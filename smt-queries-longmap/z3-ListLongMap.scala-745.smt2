; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17286 () Bool)

(assert start!17286)

(declare-fun b!173294 () Bool)

(declare-fun b_free!4311 () Bool)

(declare-fun b_next!4311 () Bool)

(assert (=> b!173294 (= b_free!4311 (not b_next!4311))))

(declare-fun tp!15597 () Bool)

(declare-fun b_and!10751 () Bool)

(assert (=> b!173294 (= tp!15597 b_and!10751)))

(declare-fun b!173289 () Bool)

(declare-fun e!114476 () Bool)

(declare-fun e!114481 () Bool)

(assert (=> b!173289 (= e!114476 (not e!114481))))

(declare-fun res!82286 () Bool)

(assert (=> b!173289 (=> (not res!82286) (not e!114481))))

(declare-datatypes ((V!5091 0))(
  ( (V!5092 (val!2086 Int)) )
))
(declare-datatypes ((ValueCell!1698 0))(
  ( (ValueCellFull!1698 (v!3954 V!5091)) (EmptyCell!1698) )
))
(declare-datatypes ((array!7297 0))(
  ( (array!7298 (arr!3467 (Array (_ BitVec 32) (_ BitVec 64))) (size!3766 (_ BitVec 32))) )
))
(declare-datatypes ((array!7299 0))(
  ( (array!7300 (arr!3468 (Array (_ BitVec 32) ValueCell!1698)) (size!3767 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2304 0))(
  ( (LongMapFixedSize!2305 (defaultEntry!3598 Int) (mask!8470 (_ BitVec 32)) (extraKeys!3337 (_ BitVec 32)) (zeroValue!3439 V!5091) (minValue!3441 V!5091) (_size!1201 (_ BitVec 32)) (_keys!5439 array!7297) (_values!3581 array!7299) (_vacant!1201 (_ BitVec 32))) )
))
(declare-fun lt!85729 () LongMapFixedSize!2304)

(declare-fun valid!973 (LongMapFixedSize!2304) Bool)

(assert (=> b!173289 (= res!82286 (valid!973 lt!85729))))

(declare-fun thiss!1248 () LongMapFixedSize!2304)

(declare-fun v!309 () V!5091)

(assert (=> b!173289 (= lt!85729 (LongMapFixedSize!2305 (defaultEntry!3598 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 (_size!1201 thiss!1248) (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (_vacant!1201 thiss!1248)))))

(declare-datatypes ((tuple2!3240 0))(
  ( (tuple2!3241 (_1!1631 (_ BitVec 64)) (_2!1631 V!5091)) )
))
(declare-datatypes ((List!2206 0))(
  ( (Nil!2203) (Cons!2202 (h!2819 tuple2!3240) (t!7013 List!2206)) )
))
(declare-datatypes ((ListLongMap!2167 0))(
  ( (ListLongMap!2168 (toList!1099 List!2206)) )
))
(declare-fun +!246 (ListLongMap!2167 tuple2!3240) ListLongMap!2167)

(declare-fun getCurrentListMap!751 (array!7297 array!7299 (_ BitVec 32) (_ BitVec 32) V!5091 V!5091 (_ BitVec 32) Int) ListLongMap!2167)

(assert (=> b!173289 (= (+!246 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-datatypes ((Unit!5314 0))(
  ( (Unit!5315) )
))
(declare-fun lt!85727 () Unit!5314)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!85 (array!7297 array!7299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!5091 V!5091 V!5091 Int) Unit!5314)

(assert (=> b!173289 (= lt!85727 (lemmaChangeLongMinValueKeyThenAddPairToListMap!85 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) v!309 (defaultEntry!3598 thiss!1248)))))

(declare-fun b!173290 () Bool)

(declare-fun e!114479 () Bool)

(assert (=> b!173290 (= e!114481 e!114479)))

(declare-fun res!82287 () Bool)

(assert (=> b!173290 (=> (not res!82287) (not e!114479))))

(declare-fun lt!85728 () ListLongMap!2167)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1154 (ListLongMap!2167 (_ BitVec 64)) Bool)

(assert (=> b!173290 (= res!82287 (contains!1154 lt!85728 key!828))))

(declare-fun map!1882 (LongMapFixedSize!2304) ListLongMap!2167)

(assert (=> b!173290 (= lt!85728 (map!1882 lt!85729))))

(declare-fun b!173291 () Bool)

(declare-fun res!82284 () Bool)

(assert (=> b!173291 (=> (not res!82284) (not e!114476))))

(assert (=> b!173291 (= res!82284 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173292 () Bool)

(declare-fun e!114482 () Bool)

(declare-fun e!114478 () Bool)

(declare-fun mapRes!6951 () Bool)

(assert (=> b!173292 (= e!114482 (and e!114478 mapRes!6951))))

(declare-fun condMapEmpty!6951 () Bool)

(declare-fun mapDefault!6951 () ValueCell!1698)

(assert (=> b!173292 (= condMapEmpty!6951 (= (arr!3468 (_values!3581 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1698)) mapDefault!6951)))))

(declare-fun b!173293 () Bool)

(declare-fun tp_is_empty!4083 () Bool)

(assert (=> b!173293 (= e!114478 tp_is_empty!4083)))

(declare-fun mapIsEmpty!6951 () Bool)

(assert (=> mapIsEmpty!6951 mapRes!6951))

(declare-fun e!114480 () Bool)

(declare-fun array_inv!2219 (array!7297) Bool)

(declare-fun array_inv!2220 (array!7299) Bool)

(assert (=> b!173294 (= e!114480 (and tp!15597 tp_is_empty!4083 (array_inv!2219 (_keys!5439 thiss!1248)) (array_inv!2220 (_values!3581 thiss!1248)) e!114482))))

(declare-fun b!173295 () Bool)

(assert (=> b!173295 (= e!114479 (= lt!85728 (+!246 (map!1882 thiss!1248) (tuple2!3241 key!828 v!309))))))

(declare-fun res!82285 () Bool)

(assert (=> start!17286 (=> (not res!82285) (not e!114476))))

(assert (=> start!17286 (= res!82285 (valid!973 thiss!1248))))

(assert (=> start!17286 e!114476))

(assert (=> start!17286 e!114480))

(assert (=> start!17286 true))

(assert (=> start!17286 tp_is_empty!4083))

(declare-fun mapNonEmpty!6951 () Bool)

(declare-fun tp!15596 () Bool)

(declare-fun e!114475 () Bool)

(assert (=> mapNonEmpty!6951 (= mapRes!6951 (and tp!15596 e!114475))))

(declare-fun mapValue!6951 () ValueCell!1698)

(declare-fun mapRest!6951 () (Array (_ BitVec 32) ValueCell!1698))

(declare-fun mapKey!6951 () (_ BitVec 32))

(assert (=> mapNonEmpty!6951 (= (arr!3468 (_values!3581 thiss!1248)) (store mapRest!6951 mapKey!6951 mapValue!6951))))

(declare-fun b!173296 () Bool)

(assert (=> b!173296 (= e!114475 tp_is_empty!4083)))

(assert (= (and start!17286 res!82285) b!173291))

(assert (= (and b!173291 res!82284) b!173289))

(assert (= (and b!173289 res!82286) b!173290))

(assert (= (and b!173290 res!82287) b!173295))

(assert (= (and b!173292 condMapEmpty!6951) mapIsEmpty!6951))

(assert (= (and b!173292 (not condMapEmpty!6951)) mapNonEmpty!6951))

(get-info :version)

(assert (= (and mapNonEmpty!6951 ((_ is ValueCellFull!1698) mapValue!6951)) b!173296))

(assert (= (and b!173292 ((_ is ValueCellFull!1698) mapDefault!6951)) b!173293))

(assert (= b!173294 b!173292))

(assert (= start!17286 b!173294))

(declare-fun m!201659 () Bool)

(assert (=> start!17286 m!201659))

(declare-fun m!201661 () Bool)

(assert (=> mapNonEmpty!6951 m!201661))

(declare-fun m!201663 () Bool)

(assert (=> b!173294 m!201663))

(declare-fun m!201665 () Bool)

(assert (=> b!173294 m!201665))

(declare-fun m!201667 () Bool)

(assert (=> b!173295 m!201667))

(assert (=> b!173295 m!201667))

(declare-fun m!201669 () Bool)

(assert (=> b!173295 m!201669))

(declare-fun m!201671 () Bool)

(assert (=> b!173289 m!201671))

(declare-fun m!201673 () Bool)

(assert (=> b!173289 m!201673))

(declare-fun m!201675 () Bool)

(assert (=> b!173289 m!201675))

(declare-fun m!201677 () Bool)

(assert (=> b!173289 m!201677))

(declare-fun m!201679 () Bool)

(assert (=> b!173289 m!201679))

(assert (=> b!173289 m!201671))

(declare-fun m!201681 () Bool)

(assert (=> b!173290 m!201681))

(declare-fun m!201683 () Bool)

(assert (=> b!173290 m!201683))

(check-sat (not mapNonEmpty!6951) (not start!17286) (not b!173295) (not b!173290) (not b_next!4311) tp_is_empty!4083 b_and!10751 (not b!173289) (not b!173294))
(check-sat b_and!10751 (not b_next!4311))
(get-model)

(declare-fun d!52589 () Bool)

(declare-fun res!82306 () Bool)

(declare-fun e!114509 () Bool)

(assert (=> d!52589 (=> (not res!82306) (not e!114509))))

(declare-fun simpleValid!144 (LongMapFixedSize!2304) Bool)

(assert (=> d!52589 (= res!82306 (simpleValid!144 thiss!1248))))

(assert (=> d!52589 (= (valid!973 thiss!1248) e!114509)))

(declare-fun b!173327 () Bool)

(declare-fun res!82307 () Bool)

(assert (=> b!173327 (=> (not res!82307) (not e!114509))))

(declare-fun arrayCountValidKeys!0 (array!7297 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173327 (= res!82307 (= (arrayCountValidKeys!0 (_keys!5439 thiss!1248) #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))) (_size!1201 thiss!1248)))))

(declare-fun b!173328 () Bool)

(declare-fun res!82308 () Bool)

(assert (=> b!173328 (=> (not res!82308) (not e!114509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7297 (_ BitVec 32)) Bool)

(assert (=> b!173328 (= res!82308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5439 thiss!1248) (mask!8470 thiss!1248)))))

(declare-fun b!173329 () Bool)

(declare-datatypes ((List!2208 0))(
  ( (Nil!2205) (Cons!2204 (h!2821 (_ BitVec 64)) (t!7017 List!2208)) )
))
(declare-fun arrayNoDuplicates!0 (array!7297 (_ BitVec 32) List!2208) Bool)

(assert (=> b!173329 (= e!114509 (arrayNoDuplicates!0 (_keys!5439 thiss!1248) #b00000000000000000000000000000000 Nil!2205))))

(assert (= (and d!52589 res!82306) b!173327))

(assert (= (and b!173327 res!82307) b!173328))

(assert (= (and b!173328 res!82308) b!173329))

(declare-fun m!201711 () Bool)

(assert (=> d!52589 m!201711))

(declare-fun m!201713 () Bool)

(assert (=> b!173327 m!201713))

(declare-fun m!201715 () Bool)

(assert (=> b!173328 m!201715))

(declare-fun m!201717 () Bool)

(assert (=> b!173329 m!201717))

(assert (=> start!17286 d!52589))

(declare-fun d!52591 () Bool)

(declare-fun res!82309 () Bool)

(declare-fun e!114510 () Bool)

(assert (=> d!52591 (=> (not res!82309) (not e!114510))))

(assert (=> d!52591 (= res!82309 (simpleValid!144 lt!85729))))

(assert (=> d!52591 (= (valid!973 lt!85729) e!114510)))

(declare-fun b!173330 () Bool)

(declare-fun res!82310 () Bool)

(assert (=> b!173330 (=> (not res!82310) (not e!114510))))

(assert (=> b!173330 (= res!82310 (= (arrayCountValidKeys!0 (_keys!5439 lt!85729) #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))) (_size!1201 lt!85729)))))

(declare-fun b!173331 () Bool)

(declare-fun res!82311 () Bool)

(assert (=> b!173331 (=> (not res!82311) (not e!114510))))

(assert (=> b!173331 (= res!82311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5439 lt!85729) (mask!8470 lt!85729)))))

(declare-fun b!173332 () Bool)

(assert (=> b!173332 (= e!114510 (arrayNoDuplicates!0 (_keys!5439 lt!85729) #b00000000000000000000000000000000 Nil!2205))))

(assert (= (and d!52591 res!82309) b!173330))

(assert (= (and b!173330 res!82310) b!173331))

(assert (= (and b!173331 res!82311) b!173332))

(declare-fun m!201719 () Bool)

(assert (=> d!52591 m!201719))

(declare-fun m!201721 () Bool)

(assert (=> b!173330 m!201721))

(declare-fun m!201723 () Bool)

(assert (=> b!173331 m!201723))

(declare-fun m!201725 () Bool)

(assert (=> b!173332 m!201725))

(assert (=> b!173289 d!52591))

(declare-fun d!52593 () Bool)

(assert (=> d!52593 (= (+!246 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85741 () Unit!5314)

(declare-fun choose!928 (array!7297 array!7299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!5091 V!5091 V!5091 Int) Unit!5314)

(assert (=> d!52593 (= lt!85741 (choose!928 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) v!309 (defaultEntry!3598 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!52593 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!52593 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!85 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) v!309 (defaultEntry!3598 thiss!1248)) lt!85741)))

(declare-fun bs!7148 () Bool)

(assert (= bs!7148 d!52593))

(declare-fun m!201727 () Bool)

(assert (=> bs!7148 m!201727))

(declare-fun m!201729 () Bool)

(assert (=> bs!7148 m!201729))

(assert (=> bs!7148 m!201671))

(assert (=> bs!7148 m!201673))

(assert (=> bs!7148 m!201679))

(assert (=> bs!7148 m!201671))

(assert (=> b!173289 d!52593))

(declare-fun bm!17569 () Bool)

(declare-fun call!17574 () ListLongMap!2167)

(declare-fun call!17575 () ListLongMap!2167)

(assert (=> bm!17569 (= call!17574 call!17575)))

(declare-fun b!173375 () Bool)

(declare-fun e!114539 () Bool)

(declare-fun lt!85791 () ListLongMap!2167)

(declare-fun apply!130 (ListLongMap!2167 (_ BitVec 64)) V!5091)

(assert (=> b!173375 (= e!114539 (= (apply!130 lt!85791 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3441 thiss!1248)))))

(declare-fun b!173376 () Bool)

(declare-fun res!82335 () Bool)

(declare-fun e!114548 () Bool)

(assert (=> b!173376 (=> (not res!82335) (not e!114548))))

(declare-fun e!114538 () Bool)

(assert (=> b!173376 (= res!82335 e!114538)))

(declare-fun c!30911 () Bool)

(assert (=> b!173376 (= c!30911 (not (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173377 () Bool)

(declare-fun c!30913 () Bool)

(assert (=> b!173377 (= c!30913 (and (not (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!114543 () ListLongMap!2167)

(declare-fun e!114544 () ListLongMap!2167)

(assert (=> b!173377 (= e!114543 e!114544)))

(declare-fun b!173378 () Bool)

(declare-fun e!114542 () Bool)

(assert (=> b!173378 (= e!114542 (= (apply!130 lt!85791 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3439 thiss!1248)))))

(declare-fun b!173379 () Bool)

(declare-fun e!114545 () ListLongMap!2167)

(assert (=> b!173379 (= e!114545 e!114543)))

(declare-fun c!30912 () Bool)

(assert (=> b!173379 (= c!30912 (and (not (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!17578 () ListLongMap!2167)

(declare-fun c!30909 () Bool)

(declare-fun call!17576 () ListLongMap!2167)

(declare-fun bm!17570 () Bool)

(assert (=> bm!17570 (= call!17576 (+!246 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)) (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun bm!17571 () Bool)

(declare-fun call!17577 () Bool)

(assert (=> bm!17571 (= call!17577 (contains!1154 lt!85791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173380 () Bool)

(declare-fun e!114549 () Bool)

(assert (=> b!173380 (= e!114549 e!114539)))

(declare-fun res!82338 () Bool)

(declare-fun call!17572 () Bool)

(assert (=> b!173380 (= res!82338 call!17572)))

(assert (=> b!173380 (=> (not res!82338) (not e!114539))))

(declare-fun b!173381 () Bool)

(declare-fun res!82332 () Bool)

(assert (=> b!173381 (=> (not res!82332) (not e!114548))))

(declare-fun e!114547 () Bool)

(assert (=> b!173381 (= res!82332 e!114547)))

(declare-fun res!82331 () Bool)

(assert (=> b!173381 (=> res!82331 e!114547)))

(declare-fun e!114537 () Bool)

(assert (=> b!173381 (= res!82331 (not e!114537))))

(declare-fun res!82336 () Bool)

(assert (=> b!173381 (=> (not res!82336) (not e!114537))))

(assert (=> b!173381 (= res!82336 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173382 () Bool)

(assert (=> b!173382 (= e!114538 (not call!17577))))

(declare-fun b!173383 () Bool)

(declare-fun e!114541 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173383 (= e!114541 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173384 () Bool)

(assert (=> b!173384 (= e!114538 e!114542)))

(declare-fun res!82333 () Bool)

(assert (=> b!173384 (= res!82333 call!17577)))

(assert (=> b!173384 (=> (not res!82333) (not e!114542))))

(declare-fun bm!17572 () Bool)

(assert (=> bm!17572 (= call!17578 call!17574)))

(declare-fun d!52595 () Bool)

(assert (=> d!52595 e!114548))

(declare-fun res!82334 () Bool)

(assert (=> d!52595 (=> (not res!82334) (not e!114548))))

(assert (=> d!52595 (= res!82334 (or (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))))

(declare-fun lt!85805 () ListLongMap!2167)

(assert (=> d!52595 (= lt!85791 lt!85805)))

(declare-fun lt!85797 () Unit!5314)

(declare-fun e!114546 () Unit!5314)

(assert (=> d!52595 (= lt!85797 e!114546)))

(declare-fun c!30910 () Bool)

(assert (=> d!52595 (= c!30910 e!114541)))

(declare-fun res!82337 () Bool)

(assert (=> d!52595 (=> (not res!82337) (not e!114541))))

(assert (=> d!52595 (= res!82337 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52595 (= lt!85805 e!114545)))

(assert (=> d!52595 (= c!30909 (and (not (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52595 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!52595 (= (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) lt!85791)))

(declare-fun bm!17573 () Bool)

(declare-fun call!17573 () ListLongMap!2167)

(assert (=> bm!17573 (= call!17573 call!17576)))

(declare-fun b!173385 () Bool)

(assert (=> b!173385 (= e!114543 call!17573)))

(declare-fun b!173386 () Bool)

(assert (=> b!173386 (= e!114544 call!17573)))

(declare-fun b!173387 () Bool)

(declare-fun e!114540 () Bool)

(assert (=> b!173387 (= e!114547 e!114540)))

(declare-fun res!82330 () Bool)

(assert (=> b!173387 (=> (not res!82330) (not e!114540))))

(assert (=> b!173387 (= res!82330 (contains!1154 lt!85791 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173387 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173388 () Bool)

(assert (=> b!173388 (= e!114549 (not call!17572))))

(declare-fun b!173389 () Bool)

(assert (=> b!173389 (= e!114548 e!114549)))

(declare-fun c!30914 () Bool)

(assert (=> b!173389 (= c!30914 (not (= (bvand (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173390 () Bool)

(declare-fun lt!85807 () Unit!5314)

(assert (=> b!173390 (= e!114546 lt!85807)))

(declare-fun lt!85789 () ListLongMap!2167)

(declare-fun getCurrentListMapNoExtraKeys!163 (array!7297 array!7299 (_ BitVec 32) (_ BitVec 32) V!5091 V!5091 (_ BitVec 32) Int) ListLongMap!2167)

(assert (=> b!173390 (= lt!85789 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85787 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85787 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85788 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85788 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85790 () Unit!5314)

(declare-fun addStillContains!106 (ListLongMap!2167 (_ BitVec 64) V!5091 (_ BitVec 64)) Unit!5314)

(assert (=> b!173390 (= lt!85790 (addStillContains!106 lt!85789 lt!85787 (zeroValue!3439 thiss!1248) lt!85788))))

(assert (=> b!173390 (contains!1154 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) lt!85788)))

(declare-fun lt!85798 () Unit!5314)

(assert (=> b!173390 (= lt!85798 lt!85790)))

(declare-fun lt!85800 () ListLongMap!2167)

(assert (=> b!173390 (= lt!85800 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85804 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85804 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85794 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85794 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85803 () Unit!5314)

(declare-fun addApplyDifferent!106 (ListLongMap!2167 (_ BitVec 64) V!5091 (_ BitVec 64)) Unit!5314)

(assert (=> b!173390 (= lt!85803 (addApplyDifferent!106 lt!85800 lt!85804 (minValue!3441 thiss!1248) lt!85794))))

(assert (=> b!173390 (= (apply!130 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) lt!85794) (apply!130 lt!85800 lt!85794))))

(declare-fun lt!85793 () Unit!5314)

(assert (=> b!173390 (= lt!85793 lt!85803)))

(declare-fun lt!85806 () ListLongMap!2167)

(assert (=> b!173390 (= lt!85806 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85799 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85799 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85795 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85795 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85786 () Unit!5314)

(assert (=> b!173390 (= lt!85786 (addApplyDifferent!106 lt!85806 lt!85799 (zeroValue!3439 thiss!1248) lt!85795))))

(assert (=> b!173390 (= (apply!130 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) lt!85795) (apply!130 lt!85806 lt!85795))))

(declare-fun lt!85801 () Unit!5314)

(assert (=> b!173390 (= lt!85801 lt!85786)))

(declare-fun lt!85792 () ListLongMap!2167)

(assert (=> b!173390 (= lt!85792 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85802 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85796 () (_ BitVec 64))

(assert (=> b!173390 (= lt!85796 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173390 (= lt!85807 (addApplyDifferent!106 lt!85792 lt!85802 (minValue!3441 thiss!1248) lt!85796))))

(assert (=> b!173390 (= (apply!130 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) lt!85796) (apply!130 lt!85792 lt!85796))))

(declare-fun b!173391 () Bool)

(assert (=> b!173391 (= e!114537 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17574 () Bool)

(assert (=> bm!17574 (= call!17572 (contains!1154 lt!85791 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17575 () Bool)

(assert (=> bm!17575 (= call!17575 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun b!173392 () Bool)

(assert (=> b!173392 (= e!114545 (+!246 call!17576 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))

(declare-fun b!173393 () Bool)

(assert (=> b!173393 (= e!114544 call!17578)))

(declare-fun b!173394 () Bool)

(declare-fun Unit!5318 () Unit!5314)

(assert (=> b!173394 (= e!114546 Unit!5318)))

(declare-fun b!173395 () Bool)

(declare-fun get!1968 (ValueCell!1698 V!5091) V!5091)

(declare-fun dynLambda!473 (Int (_ BitVec 64)) V!5091)

(assert (=> b!173395 (= e!114540 (= (apply!130 lt!85791 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173395 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_values!3581 thiss!1248))))))

(assert (=> b!173395 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (= (and d!52595 c!30909) b!173392))

(assert (= (and d!52595 (not c!30909)) b!173379))

(assert (= (and b!173379 c!30912) b!173385))

(assert (= (and b!173379 (not c!30912)) b!173377))

(assert (= (and b!173377 c!30913) b!173386))

(assert (= (and b!173377 (not c!30913)) b!173393))

(assert (= (or b!173386 b!173393) bm!17572))

(assert (= (or b!173385 bm!17572) bm!17569))

(assert (= (or b!173385 b!173386) bm!17573))

(assert (= (or b!173392 bm!17569) bm!17575))

(assert (= (or b!173392 bm!17573) bm!17570))

(assert (= (and d!52595 res!82337) b!173383))

(assert (= (and d!52595 c!30910) b!173390))

(assert (= (and d!52595 (not c!30910)) b!173394))

(assert (= (and d!52595 res!82334) b!173381))

(assert (= (and b!173381 res!82336) b!173391))

(assert (= (and b!173381 (not res!82331)) b!173387))

(assert (= (and b!173387 res!82330) b!173395))

(assert (= (and b!173381 res!82332) b!173376))

(assert (= (and b!173376 c!30911) b!173384))

(assert (= (and b!173376 (not c!30911)) b!173382))

(assert (= (and b!173384 res!82333) b!173378))

(assert (= (or b!173384 b!173382) bm!17571))

(assert (= (and b!173376 res!82335) b!173389))

(assert (= (and b!173389 c!30914) b!173380))

(assert (= (and b!173389 (not c!30914)) b!173388))

(assert (= (and b!173380 res!82338) b!173375))

(assert (= (or b!173380 b!173388) bm!17574))

(declare-fun b_lambda!6935 () Bool)

(assert (=> (not b_lambda!6935) (not b!173395)))

(declare-fun t!7016 () Bool)

(declare-fun tb!2769 () Bool)

(assert (=> (and b!173294 (= (defaultEntry!3598 thiss!1248) (defaultEntry!3598 thiss!1248)) t!7016) tb!2769))

(declare-fun result!4585 () Bool)

(assert (=> tb!2769 (= result!4585 tp_is_empty!4083)))

(assert (=> b!173395 t!7016))

(declare-fun b_and!10755 () Bool)

(assert (= b_and!10751 (and (=> t!7016 result!4585) b_and!10755)))

(declare-fun m!201731 () Bool)

(assert (=> bm!17575 m!201731))

(declare-fun m!201733 () Bool)

(assert (=> bm!17574 m!201733))

(declare-fun m!201735 () Bool)

(assert (=> bm!17570 m!201735))

(declare-fun m!201737 () Bool)

(assert (=> b!173391 m!201737))

(assert (=> b!173391 m!201737))

(declare-fun m!201739 () Bool)

(assert (=> b!173391 m!201739))

(assert (=> b!173387 m!201737))

(assert (=> b!173387 m!201737))

(declare-fun m!201741 () Bool)

(assert (=> b!173387 m!201741))

(declare-fun m!201743 () Bool)

(assert (=> bm!17571 m!201743))

(assert (=> b!173383 m!201737))

(assert (=> b!173383 m!201737))

(assert (=> b!173383 m!201739))

(declare-fun m!201745 () Bool)

(assert (=> b!173395 m!201745))

(declare-fun m!201747 () Bool)

(assert (=> b!173395 m!201747))

(declare-fun m!201749 () Bool)

(assert (=> b!173395 m!201749))

(assert (=> b!173395 m!201745))

(assert (=> b!173395 m!201737))

(assert (=> b!173395 m!201737))

(declare-fun m!201751 () Bool)

(assert (=> b!173395 m!201751))

(assert (=> b!173395 m!201747))

(declare-fun m!201753 () Bool)

(assert (=> b!173375 m!201753))

(declare-fun m!201755 () Bool)

(assert (=> b!173390 m!201755))

(declare-fun m!201757 () Bool)

(assert (=> b!173390 m!201757))

(declare-fun m!201759 () Bool)

(assert (=> b!173390 m!201759))

(declare-fun m!201761 () Bool)

(assert (=> b!173390 m!201761))

(declare-fun m!201763 () Bool)

(assert (=> b!173390 m!201763))

(declare-fun m!201765 () Bool)

(assert (=> b!173390 m!201765))

(declare-fun m!201767 () Bool)

(assert (=> b!173390 m!201767))

(assert (=> b!173390 m!201731))

(declare-fun m!201769 () Bool)

(assert (=> b!173390 m!201769))

(assert (=> b!173390 m!201759))

(assert (=> b!173390 m!201767))

(declare-fun m!201771 () Bool)

(assert (=> b!173390 m!201771))

(declare-fun m!201773 () Bool)

(assert (=> b!173390 m!201773))

(declare-fun m!201775 () Bool)

(assert (=> b!173390 m!201775))

(assert (=> b!173390 m!201763))

(declare-fun m!201777 () Bool)

(assert (=> b!173390 m!201777))

(declare-fun m!201779 () Bool)

(assert (=> b!173390 m!201779))

(assert (=> b!173390 m!201737))

(declare-fun m!201781 () Bool)

(assert (=> b!173390 m!201781))

(assert (=> b!173390 m!201773))

(declare-fun m!201783 () Bool)

(assert (=> b!173390 m!201783))

(declare-fun m!201785 () Bool)

(assert (=> b!173378 m!201785))

(assert (=> d!52595 m!201729))

(declare-fun m!201787 () Bool)

(assert (=> b!173392 m!201787))

(assert (=> b!173289 d!52595))

(declare-fun d!52597 () Bool)

(declare-fun e!114552 () Bool)

(assert (=> d!52597 e!114552))

(declare-fun res!82343 () Bool)

(assert (=> d!52597 (=> (not res!82343) (not e!114552))))

(declare-fun lt!85817 () ListLongMap!2167)

(assert (=> d!52597 (= res!82343 (contains!1154 lt!85817 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85818 () List!2206)

(assert (=> d!52597 (= lt!85817 (ListLongMap!2168 lt!85818))))

(declare-fun lt!85819 () Unit!5314)

(declare-fun lt!85816 () Unit!5314)

(assert (=> d!52597 (= lt!85819 lt!85816)))

(declare-datatypes ((Option!191 0))(
  ( (Some!190 (v!3956 V!5091)) (None!189) )
))
(declare-fun getValueByKey!185 (List!2206 (_ BitVec 64)) Option!191)

(assert (=> d!52597 (= (getValueByKey!185 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!98 (List!2206 (_ BitVec 64) V!5091) Unit!5314)

(assert (=> d!52597 (= lt!85816 (lemmaContainsTupThenGetReturnValue!98 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun insertStrictlySorted!101 (List!2206 (_ BitVec 64) V!5091) List!2206)

(assert (=> d!52597 (= lt!85818 (insertStrictlySorted!101 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52597 (= (+!246 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85817)))

(declare-fun b!173402 () Bool)

(declare-fun res!82344 () Bool)

(assert (=> b!173402 (=> (not res!82344) (not e!114552))))

(assert (=> b!173402 (= res!82344 (= (getValueByKey!185 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173403 () Bool)

(declare-fun contains!1155 (List!2206 tuple2!3240) Bool)

(assert (=> b!173403 (= e!114552 (contains!1155 (toList!1099 lt!85817) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52597 res!82343) b!173402))

(assert (= (and b!173402 res!82344) b!173403))

(declare-fun m!201789 () Bool)

(assert (=> d!52597 m!201789))

(declare-fun m!201791 () Bool)

(assert (=> d!52597 m!201791))

(declare-fun m!201793 () Bool)

(assert (=> d!52597 m!201793))

(declare-fun m!201795 () Bool)

(assert (=> d!52597 m!201795))

(declare-fun m!201797 () Bool)

(assert (=> b!173402 m!201797))

(declare-fun m!201799 () Bool)

(assert (=> b!173403 m!201799))

(assert (=> b!173289 d!52597))

(declare-fun bm!17576 () Bool)

(declare-fun call!17581 () ListLongMap!2167)

(declare-fun call!17582 () ListLongMap!2167)

(assert (=> bm!17576 (= call!17581 call!17582)))

(declare-fun b!173404 () Bool)

(declare-fun e!114555 () Bool)

(declare-fun lt!85825 () ListLongMap!2167)

(assert (=> b!173404 (= e!114555 (= (apply!130 lt!85825 #b1000000000000000000000000000000000000000000000000000000000000000) v!309))))

(declare-fun b!173405 () Bool)

(declare-fun res!82350 () Bool)

(declare-fun e!114564 () Bool)

(assert (=> b!173405 (=> (not res!82350) (not e!114564))))

(declare-fun e!114554 () Bool)

(assert (=> b!173405 (= res!82350 e!114554)))

(declare-fun c!30917 () Bool)

(assert (=> b!173405 (= c!30917 (not (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173406 () Bool)

(declare-fun c!30919 () Bool)

(assert (=> b!173406 (= c!30919 (and (not (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!114559 () ListLongMap!2167)

(declare-fun e!114560 () ListLongMap!2167)

(assert (=> b!173406 (= e!114559 e!114560)))

(declare-fun b!173407 () Bool)

(declare-fun e!114558 () Bool)

(assert (=> b!173407 (= e!114558 (= (apply!130 lt!85825 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3439 thiss!1248)))))

(declare-fun b!173408 () Bool)

(declare-fun e!114561 () ListLongMap!2167)

(assert (=> b!173408 (= e!114561 e!114559)))

(declare-fun c!30918 () Bool)

(assert (=> b!173408 (= c!30918 (and (not (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!17585 () ListLongMap!2167)

(declare-fun bm!17577 () Bool)

(declare-fun call!17583 () ListLongMap!2167)

(declare-fun c!30915 () Bool)

(assert (=> bm!17577 (= call!17583 (+!246 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)) (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17578 () Bool)

(declare-fun call!17584 () Bool)

(assert (=> bm!17578 (= call!17584 (contains!1154 lt!85825 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173409 () Bool)

(declare-fun e!114565 () Bool)

(assert (=> b!173409 (= e!114565 e!114555)))

(declare-fun res!82353 () Bool)

(declare-fun call!17579 () Bool)

(assert (=> b!173409 (= res!82353 call!17579)))

(assert (=> b!173409 (=> (not res!82353) (not e!114555))))

(declare-fun b!173410 () Bool)

(declare-fun res!82347 () Bool)

(assert (=> b!173410 (=> (not res!82347) (not e!114564))))

(declare-fun e!114563 () Bool)

(assert (=> b!173410 (= res!82347 e!114563)))

(declare-fun res!82346 () Bool)

(assert (=> b!173410 (=> res!82346 e!114563)))

(declare-fun e!114553 () Bool)

(assert (=> b!173410 (= res!82346 (not e!114553))))

(declare-fun res!82351 () Bool)

(assert (=> b!173410 (=> (not res!82351) (not e!114553))))

(assert (=> b!173410 (= res!82351 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173411 () Bool)

(assert (=> b!173411 (= e!114554 (not call!17584))))

(declare-fun b!173412 () Bool)

(declare-fun e!114557 () Bool)

(assert (=> b!173412 (= e!114557 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173413 () Bool)

(assert (=> b!173413 (= e!114554 e!114558)))

(declare-fun res!82348 () Bool)

(assert (=> b!173413 (= res!82348 call!17584)))

(assert (=> b!173413 (=> (not res!82348) (not e!114558))))

(declare-fun bm!17579 () Bool)

(assert (=> bm!17579 (= call!17585 call!17581)))

(declare-fun d!52599 () Bool)

(assert (=> d!52599 e!114564))

(declare-fun res!82349 () Bool)

(assert (=> d!52599 (=> (not res!82349) (not e!114564))))

(assert (=> d!52599 (= res!82349 (or (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))))

(declare-fun lt!85839 () ListLongMap!2167)

(assert (=> d!52599 (= lt!85825 lt!85839)))

(declare-fun lt!85831 () Unit!5314)

(declare-fun e!114562 () Unit!5314)

(assert (=> d!52599 (= lt!85831 e!114562)))

(declare-fun c!30916 () Bool)

(assert (=> d!52599 (= c!30916 e!114557)))

(declare-fun res!82352 () Bool)

(assert (=> d!52599 (=> (not res!82352) (not e!114557))))

(assert (=> d!52599 (= res!82352 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52599 (= lt!85839 e!114561)))

(assert (=> d!52599 (= c!30915 (and (not (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52599 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!52599 (= (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) lt!85825)))

(declare-fun bm!17580 () Bool)

(declare-fun call!17580 () ListLongMap!2167)

(assert (=> bm!17580 (= call!17580 call!17583)))

(declare-fun b!173414 () Bool)

(assert (=> b!173414 (= e!114559 call!17580)))

(declare-fun b!173415 () Bool)

(assert (=> b!173415 (= e!114560 call!17580)))

(declare-fun b!173416 () Bool)

(declare-fun e!114556 () Bool)

(assert (=> b!173416 (= e!114563 e!114556)))

(declare-fun res!82345 () Bool)

(assert (=> b!173416 (=> (not res!82345) (not e!114556))))

(assert (=> b!173416 (= res!82345 (contains!1154 lt!85825 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173416 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173417 () Bool)

(assert (=> b!173417 (= e!114565 (not call!17579))))

(declare-fun b!173418 () Bool)

(assert (=> b!173418 (= e!114564 e!114565)))

(declare-fun c!30920 () Bool)

(assert (=> b!173418 (= c!30920 (not (= (bvand (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173419 () Bool)

(declare-fun lt!85841 () Unit!5314)

(assert (=> b!173419 (= e!114562 lt!85841)))

(declare-fun lt!85823 () ListLongMap!2167)

(assert (=> b!173419 (= lt!85823 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85821 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85821 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85822 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85822 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85824 () Unit!5314)

(assert (=> b!173419 (= lt!85824 (addStillContains!106 lt!85823 lt!85821 (zeroValue!3439 thiss!1248) lt!85822))))

(assert (=> b!173419 (contains!1154 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) lt!85822)))

(declare-fun lt!85832 () Unit!5314)

(assert (=> b!173419 (= lt!85832 lt!85824)))

(declare-fun lt!85834 () ListLongMap!2167)

(assert (=> b!173419 (= lt!85834 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85838 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85838 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85828 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85828 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85837 () Unit!5314)

(assert (=> b!173419 (= lt!85837 (addApplyDifferent!106 lt!85834 lt!85838 v!309 lt!85828))))

(assert (=> b!173419 (= (apply!130 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)) lt!85828) (apply!130 lt!85834 lt!85828))))

(declare-fun lt!85827 () Unit!5314)

(assert (=> b!173419 (= lt!85827 lt!85837)))

(declare-fun lt!85840 () ListLongMap!2167)

(assert (=> b!173419 (= lt!85840 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85833 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85829 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85829 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85820 () Unit!5314)

(assert (=> b!173419 (= lt!85820 (addApplyDifferent!106 lt!85840 lt!85833 (zeroValue!3439 thiss!1248) lt!85829))))

(assert (=> b!173419 (= (apply!130 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) lt!85829) (apply!130 lt!85840 lt!85829))))

(declare-fun lt!85835 () Unit!5314)

(assert (=> b!173419 (= lt!85835 lt!85820)))

(declare-fun lt!85826 () ListLongMap!2167)

(assert (=> b!173419 (= lt!85826 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun lt!85836 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85836 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85830 () (_ BitVec 64))

(assert (=> b!173419 (= lt!85830 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173419 (= lt!85841 (addApplyDifferent!106 lt!85826 lt!85836 v!309 lt!85830))))

(assert (=> b!173419 (= (apply!130 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)) lt!85830) (apply!130 lt!85826 lt!85830))))

(declare-fun b!173420 () Bool)

(assert (=> b!173420 (= e!114553 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17581 () Bool)

(assert (=> bm!17581 (= call!17579 (contains!1154 lt!85825 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17582 () Bool)

(assert (=> bm!17582 (= call!17582 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun b!173421 () Bool)

(assert (=> b!173421 (= e!114561 (+!246 call!17583 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!173422 () Bool)

(assert (=> b!173422 (= e!114560 call!17585)))

(declare-fun b!173423 () Bool)

(declare-fun Unit!5319 () Unit!5314)

(assert (=> b!173423 (= e!114562 Unit!5319)))

(declare-fun b!173424 () Bool)

(assert (=> b!173424 (= e!114556 (= (apply!130 lt!85825 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173424 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_values!3581 thiss!1248))))))

(assert (=> b!173424 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (= (and d!52599 c!30915) b!173421))

(assert (= (and d!52599 (not c!30915)) b!173408))

(assert (= (and b!173408 c!30918) b!173414))

(assert (= (and b!173408 (not c!30918)) b!173406))

(assert (= (and b!173406 c!30919) b!173415))

(assert (= (and b!173406 (not c!30919)) b!173422))

(assert (= (or b!173415 b!173422) bm!17579))

(assert (= (or b!173414 bm!17579) bm!17576))

(assert (= (or b!173414 b!173415) bm!17580))

(assert (= (or b!173421 bm!17576) bm!17582))

(assert (= (or b!173421 bm!17580) bm!17577))

(assert (= (and d!52599 res!82352) b!173412))

(assert (= (and d!52599 c!30916) b!173419))

(assert (= (and d!52599 (not c!30916)) b!173423))

(assert (= (and d!52599 res!82349) b!173410))

(assert (= (and b!173410 res!82351) b!173420))

(assert (= (and b!173410 (not res!82346)) b!173416))

(assert (= (and b!173416 res!82345) b!173424))

(assert (= (and b!173410 res!82347) b!173405))

(assert (= (and b!173405 c!30917) b!173413))

(assert (= (and b!173405 (not c!30917)) b!173411))

(assert (= (and b!173413 res!82348) b!173407))

(assert (= (or b!173413 b!173411) bm!17578))

(assert (= (and b!173405 res!82350) b!173418))

(assert (= (and b!173418 c!30920) b!173409))

(assert (= (and b!173418 (not c!30920)) b!173417))

(assert (= (and b!173409 res!82353) b!173404))

(assert (= (or b!173409 b!173417) bm!17581))

(declare-fun b_lambda!6937 () Bool)

(assert (=> (not b_lambda!6937) (not b!173424)))

(assert (=> b!173424 t!7016))

(declare-fun b_and!10757 () Bool)

(assert (= b_and!10755 (and (=> t!7016 result!4585) b_and!10757)))

(declare-fun m!201801 () Bool)

(assert (=> bm!17582 m!201801))

(declare-fun m!201803 () Bool)

(assert (=> bm!17581 m!201803))

(declare-fun m!201805 () Bool)

(assert (=> bm!17577 m!201805))

(assert (=> b!173420 m!201737))

(assert (=> b!173420 m!201737))

(assert (=> b!173420 m!201739))

(assert (=> b!173416 m!201737))

(assert (=> b!173416 m!201737))

(declare-fun m!201807 () Bool)

(assert (=> b!173416 m!201807))

(declare-fun m!201809 () Bool)

(assert (=> bm!17578 m!201809))

(assert (=> b!173412 m!201737))

(assert (=> b!173412 m!201737))

(assert (=> b!173412 m!201739))

(assert (=> b!173424 m!201745))

(assert (=> b!173424 m!201747))

(assert (=> b!173424 m!201749))

(assert (=> b!173424 m!201745))

(assert (=> b!173424 m!201737))

(assert (=> b!173424 m!201737))

(declare-fun m!201811 () Bool)

(assert (=> b!173424 m!201811))

(assert (=> b!173424 m!201747))

(declare-fun m!201813 () Bool)

(assert (=> b!173404 m!201813))

(declare-fun m!201815 () Bool)

(assert (=> b!173419 m!201815))

(declare-fun m!201817 () Bool)

(assert (=> b!173419 m!201817))

(declare-fun m!201819 () Bool)

(assert (=> b!173419 m!201819))

(declare-fun m!201821 () Bool)

(assert (=> b!173419 m!201821))

(declare-fun m!201823 () Bool)

(assert (=> b!173419 m!201823))

(declare-fun m!201825 () Bool)

(assert (=> b!173419 m!201825))

(declare-fun m!201827 () Bool)

(assert (=> b!173419 m!201827))

(assert (=> b!173419 m!201801))

(declare-fun m!201829 () Bool)

(assert (=> b!173419 m!201829))

(assert (=> b!173419 m!201819))

(assert (=> b!173419 m!201827))

(declare-fun m!201831 () Bool)

(assert (=> b!173419 m!201831))

(declare-fun m!201833 () Bool)

(assert (=> b!173419 m!201833))

(declare-fun m!201835 () Bool)

(assert (=> b!173419 m!201835))

(assert (=> b!173419 m!201823))

(declare-fun m!201837 () Bool)

(assert (=> b!173419 m!201837))

(declare-fun m!201839 () Bool)

(assert (=> b!173419 m!201839))

(assert (=> b!173419 m!201737))

(declare-fun m!201841 () Bool)

(assert (=> b!173419 m!201841))

(assert (=> b!173419 m!201833))

(declare-fun m!201843 () Bool)

(assert (=> b!173419 m!201843))

(declare-fun m!201845 () Bool)

(assert (=> b!173407 m!201845))

(assert (=> d!52599 m!201729))

(declare-fun m!201847 () Bool)

(assert (=> b!173421 m!201847))

(assert (=> b!173289 d!52599))

(declare-fun d!52601 () Bool)

(assert (=> d!52601 (= (array_inv!2219 (_keys!5439 thiss!1248)) (bvsge (size!3766 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173294 d!52601))

(declare-fun d!52603 () Bool)

(assert (=> d!52603 (= (array_inv!2220 (_values!3581 thiss!1248)) (bvsge (size!3767 (_values!3581 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173294 d!52603))

(declare-fun d!52605 () Bool)

(declare-fun e!114570 () Bool)

(assert (=> d!52605 e!114570))

(declare-fun res!82356 () Bool)

(assert (=> d!52605 (=> res!82356 e!114570)))

(declare-fun lt!85850 () Bool)

(assert (=> d!52605 (= res!82356 (not lt!85850))))

(declare-fun lt!85852 () Bool)

(assert (=> d!52605 (= lt!85850 lt!85852)))

(declare-fun lt!85853 () Unit!5314)

(declare-fun e!114571 () Unit!5314)

(assert (=> d!52605 (= lt!85853 e!114571)))

(declare-fun c!30923 () Bool)

(assert (=> d!52605 (= c!30923 lt!85852)))

(declare-fun containsKey!189 (List!2206 (_ BitVec 64)) Bool)

(assert (=> d!52605 (= lt!85852 (containsKey!189 (toList!1099 lt!85728) key!828))))

(assert (=> d!52605 (= (contains!1154 lt!85728 key!828) lt!85850)))

(declare-fun b!173431 () Bool)

(declare-fun lt!85851 () Unit!5314)

(assert (=> b!173431 (= e!114571 lt!85851)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!137 (List!2206 (_ BitVec 64)) Unit!5314)

(assert (=> b!173431 (= lt!85851 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85728) key!828))))

(declare-fun isDefined!138 (Option!191) Bool)

(assert (=> b!173431 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85728) key!828))))

(declare-fun b!173432 () Bool)

(declare-fun Unit!5320 () Unit!5314)

(assert (=> b!173432 (= e!114571 Unit!5320)))

(declare-fun b!173433 () Bool)

(assert (=> b!173433 (= e!114570 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85728) key!828)))))

(assert (= (and d!52605 c!30923) b!173431))

(assert (= (and d!52605 (not c!30923)) b!173432))

(assert (= (and d!52605 (not res!82356)) b!173433))

(declare-fun m!201849 () Bool)

(assert (=> d!52605 m!201849))

(declare-fun m!201851 () Bool)

(assert (=> b!173431 m!201851))

(declare-fun m!201853 () Bool)

(assert (=> b!173431 m!201853))

(assert (=> b!173431 m!201853))

(declare-fun m!201855 () Bool)

(assert (=> b!173431 m!201855))

(assert (=> b!173433 m!201853))

(assert (=> b!173433 m!201853))

(assert (=> b!173433 m!201855))

(assert (=> b!173290 d!52605))

(declare-fun d!52607 () Bool)

(assert (=> d!52607 (= (map!1882 lt!85729) (getCurrentListMap!751 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)))))

(declare-fun bs!7149 () Bool)

(assert (= bs!7149 d!52607))

(declare-fun m!201857 () Bool)

(assert (=> bs!7149 m!201857))

(assert (=> b!173290 d!52607))

(declare-fun d!52609 () Bool)

(declare-fun e!114572 () Bool)

(assert (=> d!52609 e!114572))

(declare-fun res!82357 () Bool)

(assert (=> d!52609 (=> (not res!82357) (not e!114572))))

(declare-fun lt!85855 () ListLongMap!2167)

(assert (=> d!52609 (= res!82357 (contains!1154 lt!85855 (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun lt!85856 () List!2206)

(assert (=> d!52609 (= lt!85855 (ListLongMap!2168 lt!85856))))

(declare-fun lt!85857 () Unit!5314)

(declare-fun lt!85854 () Unit!5314)

(assert (=> d!52609 (= lt!85857 lt!85854)))

(assert (=> d!52609 (= (getValueByKey!185 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309))) (Some!190 (_2!1631 (tuple2!3241 key!828 v!309))))))

(assert (=> d!52609 (= lt!85854 (lemmaContainsTupThenGetReturnValue!98 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))))

(assert (=> d!52609 (= lt!85856 (insertStrictlySorted!101 (toList!1099 (map!1882 thiss!1248)) (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))))

(assert (=> d!52609 (= (+!246 (map!1882 thiss!1248) (tuple2!3241 key!828 v!309)) lt!85855)))

(declare-fun b!173434 () Bool)

(declare-fun res!82358 () Bool)

(assert (=> b!173434 (=> (not res!82358) (not e!114572))))

(assert (=> b!173434 (= res!82358 (= (getValueByKey!185 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))) (Some!190 (_2!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun b!173435 () Bool)

(assert (=> b!173435 (= e!114572 (contains!1155 (toList!1099 lt!85855) (tuple2!3241 key!828 v!309)))))

(assert (= (and d!52609 res!82357) b!173434))

(assert (= (and b!173434 res!82358) b!173435))

(declare-fun m!201859 () Bool)

(assert (=> d!52609 m!201859))

(declare-fun m!201861 () Bool)

(assert (=> d!52609 m!201861))

(declare-fun m!201863 () Bool)

(assert (=> d!52609 m!201863))

(declare-fun m!201865 () Bool)

(assert (=> d!52609 m!201865))

(declare-fun m!201867 () Bool)

(assert (=> b!173434 m!201867))

(declare-fun m!201869 () Bool)

(assert (=> b!173435 m!201869))

(assert (=> b!173295 d!52609))

(declare-fun d!52611 () Bool)

(assert (=> d!52611 (= (map!1882 thiss!1248) (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(declare-fun bs!7150 () Bool)

(assert (= bs!7150 d!52611))

(assert (=> bs!7150 m!201671))

(assert (=> b!173295 d!52611))

(declare-fun mapIsEmpty!6957 () Bool)

(declare-fun mapRes!6957 () Bool)

(assert (=> mapIsEmpty!6957 mapRes!6957))

(declare-fun mapNonEmpty!6957 () Bool)

(declare-fun tp!15606 () Bool)

(declare-fun e!114577 () Bool)

(assert (=> mapNonEmpty!6957 (= mapRes!6957 (and tp!15606 e!114577))))

(declare-fun mapRest!6957 () (Array (_ BitVec 32) ValueCell!1698))

(declare-fun mapValue!6957 () ValueCell!1698)

(declare-fun mapKey!6957 () (_ BitVec 32))

(assert (=> mapNonEmpty!6957 (= mapRest!6951 (store mapRest!6957 mapKey!6957 mapValue!6957))))

(declare-fun b!173443 () Bool)

(declare-fun e!114578 () Bool)

(assert (=> b!173443 (= e!114578 tp_is_empty!4083)))

(declare-fun b!173442 () Bool)

(assert (=> b!173442 (= e!114577 tp_is_empty!4083)))

(declare-fun condMapEmpty!6957 () Bool)

(declare-fun mapDefault!6957 () ValueCell!1698)

(assert (=> mapNonEmpty!6951 (= condMapEmpty!6957 (= mapRest!6951 ((as const (Array (_ BitVec 32) ValueCell!1698)) mapDefault!6957)))))

(assert (=> mapNonEmpty!6951 (= tp!15596 (and e!114578 mapRes!6957))))

(assert (= (and mapNonEmpty!6951 condMapEmpty!6957) mapIsEmpty!6957))

(assert (= (and mapNonEmpty!6951 (not condMapEmpty!6957)) mapNonEmpty!6957))

(assert (= (and mapNonEmpty!6957 ((_ is ValueCellFull!1698) mapValue!6957)) b!173442))

(assert (= (and mapNonEmpty!6951 ((_ is ValueCellFull!1698) mapDefault!6957)) b!173443))

(declare-fun m!201871 () Bool)

(assert (=> mapNonEmpty!6957 m!201871))

(declare-fun b_lambda!6939 () Bool)

(assert (= b_lambda!6937 (or (and b!173294 b_free!4311) b_lambda!6939)))

(declare-fun b_lambda!6941 () Bool)

(assert (= b_lambda!6935 (or (and b!173294 b_free!4311) b_lambda!6941)))

(check-sat (not d!52611) (not b_lambda!6941) (not b!173419) (not bm!17581) (not bm!17577) (not b!173421) (not d!52607) (not b!173329) (not b!173327) (not d!52609) (not d!52599) (not b!173392) (not b!173375) (not b!173332) (not b!173331) (not mapNonEmpty!6957) (not d!52593) (not d!52597) (not bm!17575) (not b!173420) (not b!173403) (not bm!17570) (not b!173424) (not bm!17574) (not bm!17578) (not d!52605) (not b!173407) (not b!173402) (not b!173395) (not bm!17582) (not b_next!4311) (not b!173328) (not b!173383) (not b!173404) (not b!173433) b_and!10757 (not b!173435) (not d!52595) (not b!173378) (not bm!17571) (not b!173412) tp_is_empty!4083 (not b!173387) (not b!173391) (not b!173416) (not b!173431) (not d!52589) (not b!173330) (not d!52591) (not b!173390) (not b!173434) (not b_lambda!6939))
(check-sat b_and!10757 (not b_next!4311))
(get-model)

(declare-fun d!52613 () Bool)

(declare-fun res!82363 () Bool)

(declare-fun e!114583 () Bool)

(assert (=> d!52613 (=> res!82363 e!114583)))

(assert (=> d!52613 (= res!82363 (and ((_ is Cons!2202) (toList!1099 lt!85728)) (= (_1!1631 (h!2819 (toList!1099 lt!85728))) key!828)))))

(assert (=> d!52613 (= (containsKey!189 (toList!1099 lt!85728) key!828) e!114583)))

(declare-fun b!173448 () Bool)

(declare-fun e!114584 () Bool)

(assert (=> b!173448 (= e!114583 e!114584)))

(declare-fun res!82364 () Bool)

(assert (=> b!173448 (=> (not res!82364) (not e!114584))))

(assert (=> b!173448 (= res!82364 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85728))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85728))) key!828)) ((_ is Cons!2202) (toList!1099 lt!85728)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85728))) key!828)))))

(declare-fun b!173449 () Bool)

(assert (=> b!173449 (= e!114584 (containsKey!189 (t!7013 (toList!1099 lt!85728)) key!828))))

(assert (= (and d!52613 (not res!82363)) b!173448))

(assert (= (and b!173448 res!82364) b!173449))

(declare-fun m!201873 () Bool)

(assert (=> b!173449 m!201873))

(assert (=> d!52605 d!52613))

(declare-fun d!52615 () Bool)

(declare-fun lt!85860 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!149 (List!2206) (InoxSet tuple2!3240))

(assert (=> d!52615 (= lt!85860 (select (content!149 (toList!1099 lt!85855)) (tuple2!3241 key!828 v!309)))))

(declare-fun e!114590 () Bool)

(assert (=> d!52615 (= lt!85860 e!114590)))

(declare-fun res!82370 () Bool)

(assert (=> d!52615 (=> (not res!82370) (not e!114590))))

(assert (=> d!52615 (= res!82370 ((_ is Cons!2202) (toList!1099 lt!85855)))))

(assert (=> d!52615 (= (contains!1155 (toList!1099 lt!85855) (tuple2!3241 key!828 v!309)) lt!85860)))

(declare-fun b!173454 () Bool)

(declare-fun e!114589 () Bool)

(assert (=> b!173454 (= e!114590 e!114589)))

(declare-fun res!82369 () Bool)

(assert (=> b!173454 (=> res!82369 e!114589)))

(assert (=> b!173454 (= res!82369 (= (h!2819 (toList!1099 lt!85855)) (tuple2!3241 key!828 v!309)))))

(declare-fun b!173455 () Bool)

(assert (=> b!173455 (= e!114589 (contains!1155 (t!7013 (toList!1099 lt!85855)) (tuple2!3241 key!828 v!309)))))

(assert (= (and d!52615 res!82370) b!173454))

(assert (= (and b!173454 (not res!82369)) b!173455))

(declare-fun m!201875 () Bool)

(assert (=> d!52615 m!201875))

(declare-fun m!201877 () Bool)

(assert (=> d!52615 m!201877))

(declare-fun m!201879 () Bool)

(assert (=> b!173455 m!201879))

(assert (=> b!173435 d!52615))

(declare-fun d!52617 () Bool)

(declare-fun get!1969 (Option!191) V!5091)

(assert (=> d!52617 (= (apply!130 lt!85825 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1969 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7151 () Bool)

(assert (= bs!7151 d!52617))

(assert (=> bs!7151 m!201737))

(declare-fun m!201881 () Bool)

(assert (=> bs!7151 m!201881))

(assert (=> bs!7151 m!201881))

(declare-fun m!201883 () Bool)

(assert (=> bs!7151 m!201883))

(assert (=> b!173424 d!52617))

(declare-fun d!52619 () Bool)

(declare-fun c!30926 () Bool)

(assert (=> d!52619 (= c!30926 ((_ is ValueCellFull!1698) (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114593 () V!5091)

(assert (=> d!52619 (= (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!114593)))

(declare-fun b!173460 () Bool)

(declare-fun get!1970 (ValueCell!1698 V!5091) V!5091)

(assert (=> b!173460 (= e!114593 (get!1970 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173461 () Bool)

(declare-fun get!1971 (ValueCell!1698 V!5091) V!5091)

(assert (=> b!173461 (= e!114593 (get!1971 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52619 c!30926) b!173460))

(assert (= (and d!52619 (not c!30926)) b!173461))

(assert (=> b!173460 m!201745))

(assert (=> b!173460 m!201747))

(declare-fun m!201885 () Bool)

(assert (=> b!173460 m!201885))

(assert (=> b!173461 m!201745))

(assert (=> b!173461 m!201747))

(declare-fun m!201887 () Bool)

(assert (=> b!173461 m!201887))

(assert (=> b!173424 d!52619))

(declare-fun d!52621 () Bool)

(assert (=> d!52621 (= (validMask!0 (mask!8470 thiss!1248)) (and (or (= (mask!8470 thiss!1248) #b00000000000000000000000000000111) (= (mask!8470 thiss!1248) #b00000000000000000000000000001111) (= (mask!8470 thiss!1248) #b00000000000000000000000000011111) (= (mask!8470 thiss!1248) #b00000000000000000000000000111111) (= (mask!8470 thiss!1248) #b00000000000000000000000001111111) (= (mask!8470 thiss!1248) #b00000000000000000000000011111111) (= (mask!8470 thiss!1248) #b00000000000000000000000111111111) (= (mask!8470 thiss!1248) #b00000000000000000000001111111111) (= (mask!8470 thiss!1248) #b00000000000000000000011111111111) (= (mask!8470 thiss!1248) #b00000000000000000000111111111111) (= (mask!8470 thiss!1248) #b00000000000000000001111111111111) (= (mask!8470 thiss!1248) #b00000000000000000011111111111111) (= (mask!8470 thiss!1248) #b00000000000000000111111111111111) (= (mask!8470 thiss!1248) #b00000000000000001111111111111111) (= (mask!8470 thiss!1248) #b00000000000000011111111111111111) (= (mask!8470 thiss!1248) #b00000000000000111111111111111111) (= (mask!8470 thiss!1248) #b00000000000001111111111111111111) (= (mask!8470 thiss!1248) #b00000000000011111111111111111111) (= (mask!8470 thiss!1248) #b00000000000111111111111111111111) (= (mask!8470 thiss!1248) #b00000000001111111111111111111111) (= (mask!8470 thiss!1248) #b00000000011111111111111111111111) (= (mask!8470 thiss!1248) #b00000000111111111111111111111111) (= (mask!8470 thiss!1248) #b00000001111111111111111111111111) (= (mask!8470 thiss!1248) #b00000011111111111111111111111111) (= (mask!8470 thiss!1248) #b00000111111111111111111111111111) (= (mask!8470 thiss!1248) #b00001111111111111111111111111111) (= (mask!8470 thiss!1248) #b00011111111111111111111111111111) (= (mask!8470 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8470 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!52599 d!52621))

(declare-fun d!52623 () Bool)

(declare-fun e!114594 () Bool)

(assert (=> d!52623 e!114594))

(declare-fun res!82371 () Bool)

(assert (=> d!52623 (=> (not res!82371) (not e!114594))))

(declare-fun lt!85862 () ListLongMap!2167)

(assert (=> d!52623 (= res!82371 (contains!1154 lt!85862 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun lt!85863 () List!2206)

(assert (=> d!52623 (= lt!85862 (ListLongMap!2168 lt!85863))))

(declare-fun lt!85864 () Unit!5314)

(declare-fun lt!85861 () Unit!5314)

(assert (=> d!52623 (= lt!85864 lt!85861)))

(assert (=> d!52623 (= (getValueByKey!185 lt!85863 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!190 (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52623 (= lt!85861 (lemmaContainsTupThenGetReturnValue!98 lt!85863 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52623 (= lt!85863 (insertStrictlySorted!101 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52623 (= (+!246 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)) (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85862)))

(declare-fun b!173462 () Bool)

(declare-fun res!82372 () Bool)

(assert (=> b!173462 (=> (not res!82372) (not e!114594))))

(assert (=> b!173462 (= res!82372 (= (getValueByKey!185 (toList!1099 lt!85862) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!190 (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173463 () Bool)

(assert (=> b!173463 (= e!114594 (contains!1155 (toList!1099 lt!85862) (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52623 res!82371) b!173462))

(assert (= (and b!173462 res!82372) b!173463))

(declare-fun m!201889 () Bool)

(assert (=> d!52623 m!201889))

(declare-fun m!201891 () Bool)

(assert (=> d!52623 m!201891))

(declare-fun m!201893 () Bool)

(assert (=> d!52623 m!201893))

(declare-fun m!201895 () Bool)

(assert (=> d!52623 m!201895))

(declare-fun m!201897 () Bool)

(assert (=> b!173462 m!201897))

(declare-fun m!201899 () Bool)

(assert (=> b!173463 m!201899))

(assert (=> bm!17577 d!52623))

(declare-fun d!52625 () Bool)

(declare-fun e!114595 () Bool)

(assert (=> d!52625 e!114595))

(declare-fun res!82373 () Bool)

(assert (=> d!52625 (=> (not res!82373) (not e!114595))))

(declare-fun lt!85866 () ListLongMap!2167)

(assert (=> d!52625 (= res!82373 (contains!1154 lt!85866 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun lt!85867 () List!2206)

(assert (=> d!52625 (= lt!85866 (ListLongMap!2168 lt!85867))))

(declare-fun lt!85868 () Unit!5314)

(declare-fun lt!85865 () Unit!5314)

(assert (=> d!52625 (= lt!85868 lt!85865)))

(assert (=> d!52625 (= (getValueByKey!185 lt!85867 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(assert (=> d!52625 (= lt!85865 (lemmaContainsTupThenGetReturnValue!98 lt!85867 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(assert (=> d!52625 (= lt!85867 (insertStrictlySorted!101 (toList!1099 lt!85792) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(assert (=> d!52625 (= (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) lt!85866)))

(declare-fun b!173464 () Bool)

(declare-fun res!82374 () Bool)

(assert (=> b!173464 (=> (not res!82374) (not e!114595))))

(assert (=> b!173464 (= res!82374 (= (getValueByKey!185 (toList!1099 lt!85866) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(declare-fun b!173465 () Bool)

(assert (=> b!173465 (= e!114595 (contains!1155 (toList!1099 lt!85866) (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))

(assert (= (and d!52625 res!82373) b!173464))

(assert (= (and b!173464 res!82374) b!173465))

(declare-fun m!201901 () Bool)

(assert (=> d!52625 m!201901))

(declare-fun m!201903 () Bool)

(assert (=> d!52625 m!201903))

(declare-fun m!201905 () Bool)

(assert (=> d!52625 m!201905))

(declare-fun m!201907 () Bool)

(assert (=> d!52625 m!201907))

(declare-fun m!201909 () Bool)

(assert (=> b!173464 m!201909))

(declare-fun m!201911 () Bool)

(assert (=> b!173465 m!201911))

(assert (=> b!173390 d!52625))

(declare-fun d!52627 () Bool)

(assert (=> d!52627 (= (apply!130 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) lt!85794) (apply!130 lt!85800 lt!85794))))

(declare-fun lt!85871 () Unit!5314)

(declare-fun choose!929 (ListLongMap!2167 (_ BitVec 64) V!5091 (_ BitVec 64)) Unit!5314)

(assert (=> d!52627 (= lt!85871 (choose!929 lt!85800 lt!85804 (minValue!3441 thiss!1248) lt!85794))))

(declare-fun e!114598 () Bool)

(assert (=> d!52627 e!114598))

(declare-fun res!82377 () Bool)

(assert (=> d!52627 (=> (not res!82377) (not e!114598))))

(assert (=> d!52627 (= res!82377 (contains!1154 lt!85800 lt!85794))))

(assert (=> d!52627 (= (addApplyDifferent!106 lt!85800 lt!85804 (minValue!3441 thiss!1248) lt!85794) lt!85871)))

(declare-fun b!173469 () Bool)

(assert (=> b!173469 (= e!114598 (not (= lt!85794 lt!85804)))))

(assert (= (and d!52627 res!82377) b!173469))

(assert (=> d!52627 m!201777))

(assert (=> d!52627 m!201767))

(declare-fun m!201913 () Bool)

(assert (=> d!52627 m!201913))

(assert (=> d!52627 m!201767))

(assert (=> d!52627 m!201771))

(declare-fun m!201915 () Bool)

(assert (=> d!52627 m!201915))

(assert (=> b!173390 d!52627))

(declare-fun d!52629 () Bool)

(assert (=> d!52629 (= (apply!130 lt!85800 lt!85794) (get!1969 (getValueByKey!185 (toList!1099 lt!85800) lt!85794)))))

(declare-fun bs!7152 () Bool)

(assert (= bs!7152 d!52629))

(declare-fun m!201917 () Bool)

(assert (=> bs!7152 m!201917))

(assert (=> bs!7152 m!201917))

(declare-fun m!201919 () Bool)

(assert (=> bs!7152 m!201919))

(assert (=> b!173390 d!52629))

(declare-fun d!52631 () Bool)

(assert (=> d!52631 (= (apply!130 lt!85792 lt!85796) (get!1969 (getValueByKey!185 (toList!1099 lt!85792) lt!85796)))))

(declare-fun bs!7153 () Bool)

(assert (= bs!7153 d!52631))

(declare-fun m!201921 () Bool)

(assert (=> bs!7153 m!201921))

(assert (=> bs!7153 m!201921))

(declare-fun m!201923 () Bool)

(assert (=> bs!7153 m!201923))

(assert (=> b!173390 d!52631))

(declare-fun d!52633 () Bool)

(assert (=> d!52633 (= (apply!130 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) lt!85795) (apply!130 lt!85806 lt!85795))))

(declare-fun lt!85872 () Unit!5314)

(assert (=> d!52633 (= lt!85872 (choose!929 lt!85806 lt!85799 (zeroValue!3439 thiss!1248) lt!85795))))

(declare-fun e!114599 () Bool)

(assert (=> d!52633 e!114599))

(declare-fun res!82378 () Bool)

(assert (=> d!52633 (=> (not res!82378) (not e!114599))))

(assert (=> d!52633 (= res!82378 (contains!1154 lt!85806 lt!85795))))

(assert (=> d!52633 (= (addApplyDifferent!106 lt!85806 lt!85799 (zeroValue!3439 thiss!1248) lt!85795) lt!85872)))

(declare-fun b!173470 () Bool)

(assert (=> b!173470 (= e!114599 (not (= lt!85795 lt!85799)))))

(assert (= (and d!52633 res!82378) b!173470))

(assert (=> d!52633 m!201755))

(assert (=> d!52633 m!201763))

(declare-fun m!201925 () Bool)

(assert (=> d!52633 m!201925))

(assert (=> d!52633 m!201763))

(assert (=> d!52633 m!201765))

(declare-fun m!201927 () Bool)

(assert (=> d!52633 m!201927))

(assert (=> b!173390 d!52633))

(declare-fun b!173495 () Bool)

(declare-fun e!114614 () Bool)

(declare-fun e!114619 () Bool)

(assert (=> b!173495 (= e!114614 e!114619)))

(declare-fun c!30936 () Bool)

(assert (=> b!173495 (= c!30936 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun bm!17585 () Bool)

(declare-fun call!17588 () ListLongMap!2167)

(assert (=> bm!17585 (= call!17588 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248)))))

(declare-fun b!173497 () Bool)

(declare-fun e!114617 () Bool)

(assert (=> b!173497 (= e!114614 e!114617)))

(assert (=> b!173497 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun res!82388 () Bool)

(declare-fun lt!85889 () ListLongMap!2167)

(assert (=> b!173497 (= res!82388 (contains!1154 lt!85889 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173497 (=> (not res!82388) (not e!114617))))

(declare-fun b!173498 () Bool)

(declare-fun e!114615 () ListLongMap!2167)

(assert (=> b!173498 (= e!114615 (ListLongMap!2168 Nil!2203))))

(declare-fun b!173499 () Bool)

(declare-fun isEmpty!436 (ListLongMap!2167) Bool)

(assert (=> b!173499 (= e!114619 (isEmpty!436 lt!85889))))

(declare-fun b!173500 () Bool)

(assert (=> b!173500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> b!173500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_values!3581 thiss!1248))))))

(assert (=> b!173500 (= e!114617 (= (apply!130 lt!85889 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173501 () Bool)

(declare-fun e!114618 () ListLongMap!2167)

(assert (=> b!173501 (= e!114618 call!17588)))

(declare-fun b!173502 () Bool)

(assert (=> b!173502 (= e!114619 (= lt!85889 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248))))))

(declare-fun b!173503 () Bool)

(assert (=> b!173503 (= e!114615 e!114618)))

(declare-fun c!30938 () Bool)

(assert (=> b!173503 (= c!30938 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173504 () Bool)

(declare-fun e!114616 () Bool)

(assert (=> b!173504 (= e!114616 e!114614)))

(declare-fun c!30937 () Bool)

(declare-fun e!114620 () Bool)

(assert (=> b!173504 (= c!30937 e!114620)))

(declare-fun res!82389 () Bool)

(assert (=> b!173504 (=> (not res!82389) (not e!114620))))

(assert (=> b!173504 (= res!82389 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173505 () Bool)

(declare-fun lt!85887 () Unit!5314)

(declare-fun lt!85891 () Unit!5314)

(assert (=> b!173505 (= lt!85887 lt!85891)))

(declare-fun lt!85890 () (_ BitVec 64))

(declare-fun lt!85892 () (_ BitVec 64))

(declare-fun lt!85893 () ListLongMap!2167)

(declare-fun lt!85888 () V!5091)

(assert (=> b!173505 (not (contains!1154 (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888)) lt!85890))))

(declare-fun addStillNotContains!72 (ListLongMap!2167 (_ BitVec 64) V!5091 (_ BitVec 64)) Unit!5314)

(assert (=> b!173505 (= lt!85891 (addStillNotContains!72 lt!85893 lt!85892 lt!85888 lt!85890))))

(assert (=> b!173505 (= lt!85890 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173505 (= lt!85888 (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173505 (= lt!85892 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173505 (= lt!85893 call!17588)))

(assert (=> b!173505 (= e!114618 (+!246 call!17588 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173506 () Bool)

(assert (=> b!173506 (= e!114620 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173506 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!52635 () Bool)

(assert (=> d!52635 e!114616))

(declare-fun res!82390 () Bool)

(assert (=> d!52635 (=> (not res!82390) (not e!114616))))

(assert (=> d!52635 (= res!82390 (not (contains!1154 lt!85889 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52635 (= lt!85889 e!114615)))

(declare-fun c!30935 () Bool)

(assert (=> d!52635 (= c!30935 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52635 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!52635 (= (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) lt!85889)))

(declare-fun b!173496 () Bool)

(declare-fun res!82387 () Bool)

(assert (=> b!173496 (=> (not res!82387) (not e!114616))))

(assert (=> b!173496 (= res!82387 (not (contains!1154 lt!85889 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52635 c!30935) b!173498))

(assert (= (and d!52635 (not c!30935)) b!173503))

(assert (= (and b!173503 c!30938) b!173505))

(assert (= (and b!173503 (not c!30938)) b!173501))

(assert (= (or b!173505 b!173501) bm!17585))

(assert (= (and d!52635 res!82390) b!173496))

(assert (= (and b!173496 res!82387) b!173504))

(assert (= (and b!173504 res!82389) b!173506))

(assert (= (and b!173504 c!30937) b!173497))

(assert (= (and b!173504 (not c!30937)) b!173495))

(assert (= (and b!173497 res!82388) b!173500))

(assert (= (and b!173495 c!30936) b!173502))

(assert (= (and b!173495 (not c!30936)) b!173499))

(declare-fun b_lambda!6943 () Bool)

(assert (=> (not b_lambda!6943) (not b!173500)))

(assert (=> b!173500 t!7016))

(declare-fun b_and!10759 () Bool)

(assert (= b_and!10757 (and (=> t!7016 result!4585) b_and!10759)))

(declare-fun b_lambda!6945 () Bool)

(assert (=> (not b_lambda!6945) (not b!173505)))

(assert (=> b!173505 t!7016))

(declare-fun b_and!10761 () Bool)

(assert (= b_and!10759 (and (=> t!7016 result!4585) b_and!10761)))

(declare-fun m!201929 () Bool)

(assert (=> b!173502 m!201929))

(assert (=> b!173500 m!201745))

(assert (=> b!173500 m!201747))

(assert (=> b!173500 m!201749))

(assert (=> b!173500 m!201747))

(assert (=> b!173500 m!201737))

(declare-fun m!201931 () Bool)

(assert (=> b!173500 m!201931))

(assert (=> b!173500 m!201737))

(assert (=> b!173500 m!201745))

(declare-fun m!201933 () Bool)

(assert (=> d!52635 m!201933))

(assert (=> d!52635 m!201729))

(assert (=> b!173497 m!201737))

(assert (=> b!173497 m!201737))

(declare-fun m!201935 () Bool)

(assert (=> b!173497 m!201935))

(assert (=> bm!17585 m!201929))

(declare-fun m!201937 () Bool)

(assert (=> b!173499 m!201937))

(assert (=> b!173506 m!201737))

(assert (=> b!173506 m!201737))

(assert (=> b!173506 m!201739))

(declare-fun m!201939 () Bool)

(assert (=> b!173496 m!201939))

(assert (=> b!173503 m!201737))

(assert (=> b!173503 m!201737))

(assert (=> b!173503 m!201739))

(declare-fun m!201941 () Bool)

(assert (=> b!173505 m!201941))

(declare-fun m!201943 () Bool)

(assert (=> b!173505 m!201943))

(assert (=> b!173505 m!201745))

(assert (=> b!173505 m!201747))

(assert (=> b!173505 m!201749))

(assert (=> b!173505 m!201747))

(assert (=> b!173505 m!201941))

(declare-fun m!201945 () Bool)

(assert (=> b!173505 m!201945))

(assert (=> b!173505 m!201737))

(assert (=> b!173505 m!201745))

(declare-fun m!201947 () Bool)

(assert (=> b!173505 m!201947))

(assert (=> b!173390 d!52635))

(declare-fun d!52637 () Bool)

(assert (=> d!52637 (contains!1154 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) lt!85788)))

(declare-fun lt!85896 () Unit!5314)

(declare-fun choose!930 (ListLongMap!2167 (_ BitVec 64) V!5091 (_ BitVec 64)) Unit!5314)

(assert (=> d!52637 (= lt!85896 (choose!930 lt!85789 lt!85787 (zeroValue!3439 thiss!1248) lt!85788))))

(assert (=> d!52637 (contains!1154 lt!85789 lt!85788)))

(assert (=> d!52637 (= (addStillContains!106 lt!85789 lt!85787 (zeroValue!3439 thiss!1248) lt!85788) lt!85896)))

(declare-fun bs!7154 () Bool)

(assert (= bs!7154 d!52637))

(assert (=> bs!7154 m!201773))

(assert (=> bs!7154 m!201773))

(assert (=> bs!7154 m!201783))

(declare-fun m!201949 () Bool)

(assert (=> bs!7154 m!201949))

(declare-fun m!201951 () Bool)

(assert (=> bs!7154 m!201951))

(assert (=> b!173390 d!52637))

(declare-fun d!52639 () Bool)

(declare-fun e!114621 () Bool)

(assert (=> d!52639 e!114621))

(declare-fun res!82391 () Bool)

(assert (=> d!52639 (=> res!82391 e!114621)))

(declare-fun lt!85897 () Bool)

(assert (=> d!52639 (= res!82391 (not lt!85897))))

(declare-fun lt!85899 () Bool)

(assert (=> d!52639 (= lt!85897 lt!85899)))

(declare-fun lt!85900 () Unit!5314)

(declare-fun e!114622 () Unit!5314)

(assert (=> d!52639 (= lt!85900 e!114622)))

(declare-fun c!30939 () Bool)

(assert (=> d!52639 (= c!30939 lt!85899)))

(assert (=> d!52639 (= lt!85899 (containsKey!189 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788))))

(assert (=> d!52639 (= (contains!1154 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) lt!85788) lt!85897)))

(declare-fun b!173508 () Bool)

(declare-fun lt!85898 () Unit!5314)

(assert (=> b!173508 (= e!114622 lt!85898)))

(assert (=> b!173508 (= lt!85898 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788))))

(assert (=> b!173508 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788))))

(declare-fun b!173509 () Bool)

(declare-fun Unit!5321 () Unit!5314)

(assert (=> b!173509 (= e!114622 Unit!5321)))

(declare-fun b!173510 () Bool)

(assert (=> b!173510 (= e!114621 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788)))))

(assert (= (and d!52639 c!30939) b!173508))

(assert (= (and d!52639 (not c!30939)) b!173509))

(assert (= (and d!52639 (not res!82391)) b!173510))

(declare-fun m!201953 () Bool)

(assert (=> d!52639 m!201953))

(declare-fun m!201955 () Bool)

(assert (=> b!173508 m!201955))

(declare-fun m!201957 () Bool)

(assert (=> b!173508 m!201957))

(assert (=> b!173508 m!201957))

(declare-fun m!201959 () Bool)

(assert (=> b!173508 m!201959))

(assert (=> b!173510 m!201957))

(assert (=> b!173510 m!201957))

(assert (=> b!173510 m!201959))

(assert (=> b!173390 d!52639))

(declare-fun d!52641 () Bool)

(assert (=> d!52641 (= (apply!130 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) lt!85794) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) lt!85794)))))

(declare-fun bs!7155 () Bool)

(assert (= bs!7155 d!52641))

(declare-fun m!201961 () Bool)

(assert (=> bs!7155 m!201961))

(assert (=> bs!7155 m!201961))

(declare-fun m!201963 () Bool)

(assert (=> bs!7155 m!201963))

(assert (=> b!173390 d!52641))

(declare-fun d!52643 () Bool)

(assert (=> d!52643 (= (apply!130 lt!85806 lt!85795) (get!1969 (getValueByKey!185 (toList!1099 lt!85806) lt!85795)))))

(declare-fun bs!7156 () Bool)

(assert (= bs!7156 d!52643))

(declare-fun m!201965 () Bool)

(assert (=> bs!7156 m!201965))

(assert (=> bs!7156 m!201965))

(declare-fun m!201967 () Bool)

(assert (=> bs!7156 m!201967))

(assert (=> b!173390 d!52643))

(declare-fun d!52645 () Bool)

(assert (=> d!52645 (= (apply!130 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) lt!85796) (apply!130 lt!85792 lt!85796))))

(declare-fun lt!85901 () Unit!5314)

(assert (=> d!52645 (= lt!85901 (choose!929 lt!85792 lt!85802 (minValue!3441 thiss!1248) lt!85796))))

(declare-fun e!114623 () Bool)

(assert (=> d!52645 e!114623))

(declare-fun res!82392 () Bool)

(assert (=> d!52645 (=> (not res!82392) (not e!114623))))

(assert (=> d!52645 (= res!82392 (contains!1154 lt!85792 lt!85796))))

(assert (=> d!52645 (= (addApplyDifferent!106 lt!85792 lt!85802 (minValue!3441 thiss!1248) lt!85796) lt!85901)))

(declare-fun b!173511 () Bool)

(assert (=> b!173511 (= e!114623 (not (= lt!85796 lt!85802)))))

(assert (= (and d!52645 res!82392) b!173511))

(assert (=> d!52645 m!201757))

(assert (=> d!52645 m!201759))

(declare-fun m!201969 () Bool)

(assert (=> d!52645 m!201969))

(assert (=> d!52645 m!201759))

(assert (=> d!52645 m!201761))

(declare-fun m!201971 () Bool)

(assert (=> d!52645 m!201971))

(assert (=> b!173390 d!52645))

(declare-fun d!52647 () Bool)

(assert (=> d!52647 (= (apply!130 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) lt!85796) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) lt!85796)))))

(declare-fun bs!7157 () Bool)

(assert (= bs!7157 d!52647))

(declare-fun m!201973 () Bool)

(assert (=> bs!7157 m!201973))

(assert (=> bs!7157 m!201973))

(declare-fun m!201975 () Bool)

(assert (=> bs!7157 m!201975))

(assert (=> b!173390 d!52647))

(declare-fun d!52649 () Bool)

(declare-fun e!114624 () Bool)

(assert (=> d!52649 e!114624))

(declare-fun res!82393 () Bool)

(assert (=> d!52649 (=> (not res!82393) (not e!114624))))

(declare-fun lt!85903 () ListLongMap!2167)

(assert (=> d!52649 (= res!82393 (contains!1154 lt!85903 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun lt!85904 () List!2206)

(assert (=> d!52649 (= lt!85903 (ListLongMap!2168 lt!85904))))

(declare-fun lt!85905 () Unit!5314)

(declare-fun lt!85902 () Unit!5314)

(assert (=> d!52649 (= lt!85905 lt!85902)))

(assert (=> d!52649 (= (getValueByKey!185 lt!85904 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(assert (=> d!52649 (= lt!85902 (lemmaContainsTupThenGetReturnValue!98 lt!85904 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(assert (=> d!52649 (= lt!85904 (insertStrictlySorted!101 (toList!1099 lt!85800) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(assert (=> d!52649 (= (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) lt!85903)))

(declare-fun b!173512 () Bool)

(declare-fun res!82394 () Bool)

(assert (=> b!173512 (=> (not res!82394) (not e!114624))))

(assert (=> b!173512 (= res!82394 (= (getValueByKey!185 (toList!1099 lt!85903) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(declare-fun b!173513 () Bool)

(assert (=> b!173513 (= e!114624 (contains!1155 (toList!1099 lt!85903) (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))

(assert (= (and d!52649 res!82393) b!173512))

(assert (= (and b!173512 res!82394) b!173513))

(declare-fun m!201977 () Bool)

(assert (=> d!52649 m!201977))

(declare-fun m!201979 () Bool)

(assert (=> d!52649 m!201979))

(declare-fun m!201981 () Bool)

(assert (=> d!52649 m!201981))

(declare-fun m!201983 () Bool)

(assert (=> d!52649 m!201983))

(declare-fun m!201985 () Bool)

(assert (=> b!173512 m!201985))

(declare-fun m!201987 () Bool)

(assert (=> b!173513 m!201987))

(assert (=> b!173390 d!52649))

(declare-fun d!52651 () Bool)

(declare-fun e!114625 () Bool)

(assert (=> d!52651 e!114625))

(declare-fun res!82395 () Bool)

(assert (=> d!52651 (=> (not res!82395) (not e!114625))))

(declare-fun lt!85907 () ListLongMap!2167)

(assert (=> d!52651 (= res!82395 (contains!1154 lt!85907 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!85908 () List!2206)

(assert (=> d!52651 (= lt!85907 (ListLongMap!2168 lt!85908))))

(declare-fun lt!85909 () Unit!5314)

(declare-fun lt!85906 () Unit!5314)

(assert (=> d!52651 (= lt!85909 lt!85906)))

(assert (=> d!52651 (= (getValueByKey!185 lt!85908 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52651 (= lt!85906 (lemmaContainsTupThenGetReturnValue!98 lt!85908 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52651 (= lt!85908 (insertStrictlySorted!101 (toList!1099 lt!85789) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52651 (= (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) lt!85907)))

(declare-fun b!173514 () Bool)

(declare-fun res!82396 () Bool)

(assert (=> b!173514 (=> (not res!82396) (not e!114625))))

(assert (=> b!173514 (= res!82396 (= (getValueByKey!185 (toList!1099 lt!85907) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(declare-fun b!173515 () Bool)

(assert (=> b!173515 (= e!114625 (contains!1155 (toList!1099 lt!85907) (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!52651 res!82395) b!173514))

(assert (= (and b!173514 res!82396) b!173515))

(declare-fun m!201989 () Bool)

(assert (=> d!52651 m!201989))

(declare-fun m!201991 () Bool)

(assert (=> d!52651 m!201991))

(declare-fun m!201993 () Bool)

(assert (=> d!52651 m!201993))

(declare-fun m!201995 () Bool)

(assert (=> d!52651 m!201995))

(declare-fun m!201997 () Bool)

(assert (=> b!173514 m!201997))

(declare-fun m!201999 () Bool)

(assert (=> b!173515 m!201999))

(assert (=> b!173390 d!52651))

(declare-fun d!52653 () Bool)

(declare-fun e!114626 () Bool)

(assert (=> d!52653 e!114626))

(declare-fun res!82397 () Bool)

(assert (=> d!52653 (=> (not res!82397) (not e!114626))))

(declare-fun lt!85911 () ListLongMap!2167)

(assert (=> d!52653 (= res!82397 (contains!1154 lt!85911 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!85912 () List!2206)

(assert (=> d!52653 (= lt!85911 (ListLongMap!2168 lt!85912))))

(declare-fun lt!85913 () Unit!5314)

(declare-fun lt!85910 () Unit!5314)

(assert (=> d!52653 (= lt!85913 lt!85910)))

(assert (=> d!52653 (= (getValueByKey!185 lt!85912 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52653 (= lt!85910 (lemmaContainsTupThenGetReturnValue!98 lt!85912 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52653 (= lt!85912 (insertStrictlySorted!101 (toList!1099 lt!85806) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52653 (= (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) lt!85911)))

(declare-fun b!173516 () Bool)

(declare-fun res!82398 () Bool)

(assert (=> b!173516 (=> (not res!82398) (not e!114626))))

(assert (=> b!173516 (= res!82398 (= (getValueByKey!185 (toList!1099 lt!85911) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(declare-fun b!173517 () Bool)

(assert (=> b!173517 (= e!114626 (contains!1155 (toList!1099 lt!85911) (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!52653 res!82397) b!173516))

(assert (= (and b!173516 res!82398) b!173517))

(declare-fun m!202001 () Bool)

(assert (=> d!52653 m!202001))

(declare-fun m!202003 () Bool)

(assert (=> d!52653 m!202003))

(declare-fun m!202005 () Bool)

(assert (=> d!52653 m!202005))

(declare-fun m!202007 () Bool)

(assert (=> d!52653 m!202007))

(declare-fun m!202009 () Bool)

(assert (=> b!173516 m!202009))

(declare-fun m!202011 () Bool)

(assert (=> b!173517 m!202011))

(assert (=> b!173390 d!52653))

(declare-fun d!52655 () Bool)

(assert (=> d!52655 (= (apply!130 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) lt!85795) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) lt!85795)))))

(declare-fun bs!7158 () Bool)

(assert (= bs!7158 d!52655))

(declare-fun m!202013 () Bool)

(assert (=> bs!7158 m!202013))

(assert (=> bs!7158 m!202013))

(declare-fun m!202015 () Bool)

(assert (=> bs!7158 m!202015))

(assert (=> b!173390 d!52655))

(declare-fun d!52657 () Bool)

(declare-fun e!114627 () Bool)

(assert (=> d!52657 e!114627))

(declare-fun res!82399 () Bool)

(assert (=> d!52657 (=> res!82399 e!114627)))

(declare-fun lt!85914 () Bool)

(assert (=> d!52657 (= res!82399 (not lt!85914))))

(declare-fun lt!85916 () Bool)

(assert (=> d!52657 (= lt!85914 lt!85916)))

(declare-fun lt!85917 () Unit!5314)

(declare-fun e!114628 () Unit!5314)

(assert (=> d!52657 (= lt!85917 e!114628)))

(declare-fun c!30940 () Bool)

(assert (=> d!52657 (= c!30940 lt!85916)))

(assert (=> d!52657 (= lt!85916 (containsKey!189 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52657 (= (contains!1154 lt!85825 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85914)))

(declare-fun b!173518 () Bool)

(declare-fun lt!85915 () Unit!5314)

(assert (=> b!173518 (= e!114628 lt!85915)))

(assert (=> b!173518 (= lt!85915 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173518 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173519 () Bool)

(declare-fun Unit!5322 () Unit!5314)

(assert (=> b!173519 (= e!114628 Unit!5322)))

(declare-fun b!173520 () Bool)

(assert (=> b!173520 (= e!114627 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52657 c!30940) b!173518))

(assert (= (and d!52657 (not c!30940)) b!173519))

(assert (= (and d!52657 (not res!82399)) b!173520))

(declare-fun m!202017 () Bool)

(assert (=> d!52657 m!202017))

(declare-fun m!202019 () Bool)

(assert (=> b!173518 m!202019))

(declare-fun m!202021 () Bool)

(assert (=> b!173518 m!202021))

(assert (=> b!173518 m!202021))

(declare-fun m!202023 () Bool)

(assert (=> b!173518 m!202023))

(assert (=> b!173520 m!202021))

(assert (=> b!173520 m!202021))

(assert (=> b!173520 m!202023))

(assert (=> bm!17578 d!52657))

(declare-fun d!52659 () Bool)

(assert (=> d!52659 (= (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173391 d!52659))

(declare-fun d!52661 () Bool)

(declare-fun e!114629 () Bool)

(assert (=> d!52661 e!114629))

(declare-fun res!82400 () Bool)

(assert (=> d!52661 (=> (not res!82400) (not e!114629))))

(declare-fun lt!85919 () ListLongMap!2167)

(assert (=> d!52661 (= res!82400 (contains!1154 lt!85919 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85920 () List!2206)

(assert (=> d!52661 (= lt!85919 (ListLongMap!2168 lt!85920))))

(declare-fun lt!85921 () Unit!5314)

(declare-fun lt!85918 () Unit!5314)

(assert (=> d!52661 (= lt!85921 lt!85918)))

(assert (=> d!52661 (= (getValueByKey!185 lt!85920 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52661 (= lt!85918 (lemmaContainsTupThenGetReturnValue!98 lt!85920 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52661 (= lt!85920 (insertStrictlySorted!101 (toList!1099 call!17583) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52661 (= (+!246 call!17583 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85919)))

(declare-fun b!173521 () Bool)

(declare-fun res!82401 () Bool)

(assert (=> b!173521 (=> (not res!82401) (not e!114629))))

(assert (=> b!173521 (= res!82401 (= (getValueByKey!185 (toList!1099 lt!85919) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173522 () Bool)

(assert (=> b!173522 (= e!114629 (contains!1155 (toList!1099 lt!85919) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52661 res!82400) b!173521))

(assert (= (and b!173521 res!82401) b!173522))

(declare-fun m!202025 () Bool)

(assert (=> d!52661 m!202025))

(declare-fun m!202027 () Bool)

(assert (=> d!52661 m!202027))

(declare-fun m!202029 () Bool)

(assert (=> d!52661 m!202029))

(declare-fun m!202031 () Bool)

(assert (=> d!52661 m!202031))

(declare-fun m!202033 () Bool)

(assert (=> b!173521 m!202033))

(declare-fun m!202035 () Bool)

(assert (=> b!173522 m!202035))

(assert (=> b!173421 d!52661))

(declare-fun d!52663 () Bool)

(declare-fun e!114630 () Bool)

(assert (=> d!52663 e!114630))

(declare-fun res!82402 () Bool)

(assert (=> d!52663 (=> res!82402 e!114630)))

(declare-fun lt!85922 () Bool)

(assert (=> d!52663 (= res!82402 (not lt!85922))))

(declare-fun lt!85924 () Bool)

(assert (=> d!52663 (= lt!85922 lt!85924)))

(declare-fun lt!85925 () Unit!5314)

(declare-fun e!114631 () Unit!5314)

(assert (=> d!52663 (= lt!85925 e!114631)))

(declare-fun c!30941 () Bool)

(assert (=> d!52663 (= c!30941 lt!85924)))

(assert (=> d!52663 (= lt!85924 (containsKey!189 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52663 (= (contains!1154 lt!85791 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) lt!85922)))

(declare-fun b!173523 () Bool)

(declare-fun lt!85923 () Unit!5314)

(assert (=> b!173523 (= e!114631 lt!85923)))

(assert (=> b!173523 (= lt!85923 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173523 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173524 () Bool)

(declare-fun Unit!5323 () Unit!5314)

(assert (=> b!173524 (= e!114631 Unit!5323)))

(declare-fun b!173525 () Bool)

(assert (=> b!173525 (= e!114630 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52663 c!30941) b!173523))

(assert (= (and d!52663 (not c!30941)) b!173524))

(assert (= (and d!52663 (not res!82402)) b!173525))

(assert (=> d!52663 m!201737))

(declare-fun m!202037 () Bool)

(assert (=> d!52663 m!202037))

(assert (=> b!173523 m!201737))

(declare-fun m!202039 () Bool)

(assert (=> b!173523 m!202039))

(assert (=> b!173523 m!201737))

(declare-fun m!202041 () Bool)

(assert (=> b!173523 m!202041))

(assert (=> b!173523 m!202041))

(declare-fun m!202043 () Bool)

(assert (=> b!173523 m!202043))

(assert (=> b!173525 m!201737))

(assert (=> b!173525 m!202041))

(assert (=> b!173525 m!202041))

(assert (=> b!173525 m!202043))

(assert (=> b!173387 d!52663))

(declare-fun d!52665 () Bool)

(declare-fun e!114632 () Bool)

(assert (=> d!52665 e!114632))

(declare-fun res!82403 () Bool)

(assert (=> d!52665 (=> res!82403 e!114632)))

(declare-fun lt!85926 () Bool)

(assert (=> d!52665 (= res!82403 (not lt!85926))))

(declare-fun lt!85928 () Bool)

(assert (=> d!52665 (= lt!85926 lt!85928)))

(declare-fun lt!85929 () Unit!5314)

(declare-fun e!114633 () Unit!5314)

(assert (=> d!52665 (= lt!85929 e!114633)))

(declare-fun c!30942 () Bool)

(assert (=> d!52665 (= c!30942 lt!85928)))

(assert (=> d!52665 (= lt!85928 (containsKey!189 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52665 (= (contains!1154 lt!85817 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85926)))

(declare-fun b!173526 () Bool)

(declare-fun lt!85927 () Unit!5314)

(assert (=> b!173526 (= e!114633 lt!85927)))

(assert (=> b!173526 (= lt!85927 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!173526 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173527 () Bool)

(declare-fun Unit!5324 () Unit!5314)

(assert (=> b!173527 (= e!114633 Unit!5324)))

(declare-fun b!173528 () Bool)

(assert (=> b!173528 (= e!114632 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52665 c!30942) b!173526))

(assert (= (and d!52665 (not c!30942)) b!173527))

(assert (= (and d!52665 (not res!82403)) b!173528))

(declare-fun m!202045 () Bool)

(assert (=> d!52665 m!202045))

(declare-fun m!202047 () Bool)

(assert (=> b!173526 m!202047))

(assert (=> b!173526 m!201797))

(assert (=> b!173526 m!201797))

(declare-fun m!202049 () Bool)

(assert (=> b!173526 m!202049))

(assert (=> b!173528 m!201797))

(assert (=> b!173528 m!201797))

(assert (=> b!173528 m!202049))

(assert (=> d!52597 d!52665))

(declare-fun b!173537 () Bool)

(declare-fun e!114638 () Option!191)

(assert (=> b!173537 (= e!114638 (Some!190 (_2!1631 (h!2819 lt!85818))))))

(declare-fun b!173540 () Bool)

(declare-fun e!114639 () Option!191)

(assert (=> b!173540 (= e!114639 None!189)))

(declare-fun b!173538 () Bool)

(assert (=> b!173538 (= e!114638 e!114639)))

(declare-fun c!30948 () Bool)

(assert (=> b!173538 (= c!30948 (and ((_ is Cons!2202) lt!85818) (not (= (_1!1631 (h!2819 lt!85818)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173539 () Bool)

(assert (=> b!173539 (= e!114639 (getValueByKey!185 (t!7013 lt!85818) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52667 () Bool)

(declare-fun c!30947 () Bool)

(assert (=> d!52667 (= c!30947 (and ((_ is Cons!2202) lt!85818) (= (_1!1631 (h!2819 lt!85818)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52667 (= (getValueByKey!185 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114638)))

(assert (= (and d!52667 c!30947) b!173537))

(assert (= (and d!52667 (not c!30947)) b!173538))

(assert (= (and b!173538 c!30948) b!173539))

(assert (= (and b!173538 (not c!30948)) b!173540))

(declare-fun m!202051 () Bool)

(assert (=> b!173539 m!202051))

(assert (=> d!52597 d!52667))

(declare-fun d!52669 () Bool)

(assert (=> d!52669 (= (getValueByKey!185 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85932 () Unit!5314)

(declare-fun choose!931 (List!2206 (_ BitVec 64) V!5091) Unit!5314)

(assert (=> d!52669 (= lt!85932 (choose!931 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!114642 () Bool)

(assert (=> d!52669 e!114642))

(declare-fun res!82408 () Bool)

(assert (=> d!52669 (=> (not res!82408) (not e!114642))))

(declare-fun isStrictlySorted!332 (List!2206) Bool)

(assert (=> d!52669 (= res!82408 (isStrictlySorted!332 lt!85818))))

(assert (=> d!52669 (= (lemmaContainsTupThenGetReturnValue!98 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85932)))

(declare-fun b!173545 () Bool)

(declare-fun res!82409 () Bool)

(assert (=> b!173545 (=> (not res!82409) (not e!114642))))

(assert (=> b!173545 (= res!82409 (containsKey!189 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173546 () Bool)

(assert (=> b!173546 (= e!114642 (contains!1155 lt!85818 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52669 res!82408) b!173545))

(assert (= (and b!173545 res!82409) b!173546))

(assert (=> d!52669 m!201791))

(declare-fun m!202053 () Bool)

(assert (=> d!52669 m!202053))

(declare-fun m!202055 () Bool)

(assert (=> d!52669 m!202055))

(declare-fun m!202057 () Bool)

(assert (=> b!173545 m!202057))

(declare-fun m!202059 () Bool)

(assert (=> b!173546 m!202059))

(assert (=> d!52597 d!52669))

(declare-fun bm!17593 () Bool)

(declare-fun call!17597 () List!2206)

(declare-fun call!17595 () List!2206)

(assert (=> bm!17593 (= call!17597 call!17595)))

(declare-fun c!30960 () Bool)

(declare-fun b!173567 () Bool)

(declare-fun c!30958 () Bool)

(declare-fun e!114656 () List!2206)

(assert (=> b!173567 (= e!114656 (ite c!30958 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (ite c!30960 (Cons!2202 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) Nil!2203)))))

(declare-fun b!173568 () Bool)

(declare-fun res!82414 () Bool)

(declare-fun e!114657 () Bool)

(assert (=> b!173568 (=> (not res!82414) (not e!114657))))

(declare-fun lt!85935 () List!2206)

(assert (=> b!173568 (= res!82414 (containsKey!189 lt!85935 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173569 () Bool)

(declare-fun e!114654 () List!2206)

(assert (=> b!173569 (= e!114654 call!17595)))

(declare-fun b!173570 () Bool)

(assert (=> b!173570 (= c!30960 (and ((_ is Cons!2202) (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (bvsgt (_1!1631 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114655 () List!2206)

(declare-fun e!114653 () List!2206)

(assert (=> b!173570 (= e!114655 e!114653)))

(declare-fun b!173571 () Bool)

(declare-fun call!17596 () List!2206)

(assert (=> b!173571 (= e!114653 call!17596)))

(declare-fun b!173572 () Bool)

(assert (=> b!173572 (= e!114653 call!17596)))

(declare-fun b!173573 () Bool)

(assert (=> b!173573 (= e!114654 e!114655)))

(assert (=> b!173573 (= c!30958 (and ((_ is Cons!2202) (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (= (_1!1631 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun bm!17592 () Bool)

(declare-fun c!30957 () Bool)

(declare-fun $colon$colon!98 (List!2206 tuple2!3240) List!2206)

(assert (=> bm!17592 (= call!17595 ($colon$colon!98 e!114656 (ite c!30957 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30959 () Bool)

(assert (=> bm!17592 (= c!30959 c!30957)))

(declare-fun d!52671 () Bool)

(assert (=> d!52671 e!114657))

(declare-fun res!82415 () Bool)

(assert (=> d!52671 (=> (not res!82415) (not e!114657))))

(assert (=> d!52671 (= res!82415 (isStrictlySorted!332 lt!85935))))

(assert (=> d!52671 (= lt!85935 e!114654)))

(assert (=> d!52671 (= c!30957 (and ((_ is Cons!2202) (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (bvslt (_1!1631 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52671 (isStrictlySorted!332 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))))

(assert (=> d!52671 (= (insertStrictlySorted!101 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!85935)))

(declare-fun bm!17594 () Bool)

(assert (=> bm!17594 (= call!17596 call!17597)))

(declare-fun b!173574 () Bool)

(assert (=> b!173574 (= e!114655 call!17597)))

(declare-fun b!173575 () Bool)

(assert (=> b!173575 (= e!114656 (insertStrictlySorted!101 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173576 () Bool)

(assert (=> b!173576 (= e!114657 (contains!1155 lt!85935 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52671 c!30957) b!173569))

(assert (= (and d!52671 (not c!30957)) b!173573))

(assert (= (and b!173573 c!30958) b!173574))

(assert (= (and b!173573 (not c!30958)) b!173570))

(assert (= (and b!173570 c!30960) b!173571))

(assert (= (and b!173570 (not c!30960)) b!173572))

(assert (= (or b!173571 b!173572) bm!17594))

(assert (= (or b!173574 bm!17594) bm!17593))

(assert (= (or b!173569 bm!17593) bm!17592))

(assert (= (and bm!17592 c!30959) b!173575))

(assert (= (and bm!17592 (not c!30959)) b!173567))

(assert (= (and d!52671 res!82415) b!173568))

(assert (= (and b!173568 res!82414) b!173576))

(declare-fun m!202061 () Bool)

(assert (=> b!173576 m!202061))

(declare-fun m!202063 () Bool)

(assert (=> bm!17592 m!202063))

(declare-fun m!202065 () Bool)

(assert (=> b!173575 m!202065))

(declare-fun m!202067 () Bool)

(assert (=> b!173568 m!202067))

(declare-fun m!202069 () Bool)

(assert (=> d!52671 m!202069))

(declare-fun m!202071 () Bool)

(assert (=> d!52671 m!202071))

(assert (=> d!52597 d!52671))

(declare-fun d!52673 () Bool)

(assert (=> d!52673 (= (apply!130 lt!85825 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1969 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7159 () Bool)

(assert (= bs!7159 d!52673))

(assert (=> bs!7159 m!202021))

(assert (=> bs!7159 m!202021))

(declare-fun m!202073 () Bool)

(assert (=> bs!7159 m!202073))

(assert (=> b!173407 d!52673))

(assert (=> d!52595 d!52621))

(assert (=> d!52593 d!52621))

(declare-fun d!52675 () Bool)

(assert (=> d!52675 (= (+!246 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))

(assert (=> d!52675 true))

(declare-fun _$8!130 () Unit!5314)

(assert (=> d!52675 (= (choose!928 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) v!309 (defaultEntry!3598 thiss!1248)) _$8!130)))

(declare-fun bs!7160 () Bool)

(assert (= bs!7160 d!52675))

(assert (=> bs!7160 m!201671))

(assert (=> bs!7160 m!201671))

(assert (=> bs!7160 m!201673))

(assert (=> bs!7160 m!201679))

(assert (=> d!52593 d!52675))

(assert (=> d!52593 d!52595))

(assert (=> d!52593 d!52597))

(assert (=> d!52593 d!52599))

(declare-fun b!173577 () Bool)

(declare-fun e!114658 () Option!191)

(assert (=> b!173577 (= e!114658 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85855)))))))

(declare-fun b!173580 () Bool)

(declare-fun e!114659 () Option!191)

(assert (=> b!173580 (= e!114659 None!189)))

(declare-fun b!173578 () Bool)

(assert (=> b!173578 (= e!114658 e!114659)))

(declare-fun c!30962 () Bool)

(assert (=> b!173578 (= c!30962 (and ((_ is Cons!2202) (toList!1099 lt!85855)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85855))) (_1!1631 (tuple2!3241 key!828 v!309))))))))

(declare-fun b!173579 () Bool)

(assert (=> b!173579 (= e!114659 (getValueByKey!185 (t!7013 (toList!1099 lt!85855)) (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun d!52677 () Bool)

(declare-fun c!30961 () Bool)

(assert (=> d!52677 (= c!30961 (and ((_ is Cons!2202) (toList!1099 lt!85855)) (= (_1!1631 (h!2819 (toList!1099 lt!85855))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!52677 (= (getValueByKey!185 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))) e!114658)))

(assert (= (and d!52677 c!30961) b!173577))

(assert (= (and d!52677 (not c!30961)) b!173578))

(assert (= (and b!173578 c!30962) b!173579))

(assert (= (and b!173578 (not c!30962)) b!173580))

(declare-fun m!202075 () Bool)

(assert (=> b!173579 m!202075))

(assert (=> b!173434 d!52677))

(assert (=> b!173420 d!52659))

(declare-fun d!52679 () Bool)

(declare-fun isEmpty!437 (Option!191) Bool)

(assert (=> d!52679 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85728) key!828)) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85728) key!828))))))

(declare-fun bs!7161 () Bool)

(assert (= bs!7161 d!52679))

(assert (=> bs!7161 m!201853))

(declare-fun m!202077 () Bool)

(assert (=> bs!7161 m!202077))

(assert (=> b!173433 d!52679))

(declare-fun b!173581 () Bool)

(declare-fun e!114660 () Option!191)

(assert (=> b!173581 (= e!114660 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85728)))))))

(declare-fun b!173584 () Bool)

(declare-fun e!114661 () Option!191)

(assert (=> b!173584 (= e!114661 None!189)))

(declare-fun b!173582 () Bool)

(assert (=> b!173582 (= e!114660 e!114661)))

(declare-fun c!30964 () Bool)

(assert (=> b!173582 (= c!30964 (and ((_ is Cons!2202) (toList!1099 lt!85728)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85728))) key!828))))))

(declare-fun b!173583 () Bool)

(assert (=> b!173583 (= e!114661 (getValueByKey!185 (t!7013 (toList!1099 lt!85728)) key!828))))

(declare-fun d!52681 () Bool)

(declare-fun c!30963 () Bool)

(assert (=> d!52681 (= c!30963 (and ((_ is Cons!2202) (toList!1099 lt!85728)) (= (_1!1631 (h!2819 (toList!1099 lt!85728))) key!828)))))

(assert (=> d!52681 (= (getValueByKey!185 (toList!1099 lt!85728) key!828) e!114660)))

(assert (= (and d!52681 c!30963) b!173581))

(assert (= (and d!52681 (not c!30963)) b!173582))

(assert (= (and b!173582 c!30964) b!173583))

(assert (= (and b!173582 (not c!30964)) b!173584))

(declare-fun m!202079 () Bool)

(assert (=> b!173583 m!202079))

(assert (=> b!173433 d!52681))

(declare-fun d!52683 () Bool)

(declare-fun e!114662 () Bool)

(assert (=> d!52683 e!114662))

(declare-fun res!82416 () Bool)

(assert (=> d!52683 (=> res!82416 e!114662)))

(declare-fun lt!85936 () Bool)

(assert (=> d!52683 (= res!82416 (not lt!85936))))

(declare-fun lt!85938 () Bool)

(assert (=> d!52683 (= lt!85936 lt!85938)))

(declare-fun lt!85939 () Unit!5314)

(declare-fun e!114663 () Unit!5314)

(assert (=> d!52683 (= lt!85939 e!114663)))

(declare-fun c!30965 () Bool)

(assert (=> d!52683 (= c!30965 lt!85938)))

(assert (=> d!52683 (= lt!85938 (containsKey!189 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52683 (= (contains!1154 lt!85825 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85936)))

(declare-fun b!173585 () Bool)

(declare-fun lt!85937 () Unit!5314)

(assert (=> b!173585 (= e!114663 lt!85937)))

(assert (=> b!173585 (= lt!85937 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173585 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173586 () Bool)

(declare-fun Unit!5325 () Unit!5314)

(assert (=> b!173586 (= e!114663 Unit!5325)))

(declare-fun b!173587 () Bool)

(assert (=> b!173587 (= e!114662 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52683 c!30965) b!173585))

(assert (= (and d!52683 (not c!30965)) b!173586))

(assert (= (and d!52683 (not res!82416)) b!173587))

(declare-fun m!202081 () Bool)

(assert (=> d!52683 m!202081))

(declare-fun m!202083 () Bool)

(assert (=> b!173585 m!202083))

(declare-fun m!202085 () Bool)

(assert (=> b!173585 m!202085))

(assert (=> b!173585 m!202085))

(declare-fun m!202087 () Bool)

(assert (=> b!173585 m!202087))

(assert (=> b!173587 m!202085))

(assert (=> b!173587 m!202085))

(assert (=> b!173587 m!202087))

(assert (=> bm!17581 d!52683))

(declare-fun d!52685 () Bool)

(assert (=> d!52685 (= (apply!130 lt!85825 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1969 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7162 () Bool)

(assert (= bs!7162 d!52685))

(assert (=> bs!7162 m!202085))

(assert (=> bs!7162 m!202085))

(declare-fun m!202089 () Bool)

(assert (=> bs!7162 m!202089))

(assert (=> b!173404 d!52685))

(declare-fun b!173588 () Bool)

(declare-fun e!114664 () Bool)

(declare-fun e!114669 () Bool)

(assert (=> b!173588 (= e!114664 e!114669)))

(declare-fun c!30967 () Bool)

(assert (=> b!173588 (= c!30967 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun bm!17595 () Bool)

(declare-fun call!17598 () ListLongMap!2167)

(assert (=> bm!17595 (= call!17598 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248)))))

(declare-fun b!173590 () Bool)

(declare-fun e!114667 () Bool)

(assert (=> b!173590 (= e!114664 e!114667)))

(assert (=> b!173590 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun res!82418 () Bool)

(declare-fun lt!85942 () ListLongMap!2167)

(assert (=> b!173590 (= res!82418 (contains!1154 lt!85942 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173590 (=> (not res!82418) (not e!114667))))

(declare-fun b!173591 () Bool)

(declare-fun e!114665 () ListLongMap!2167)

(assert (=> b!173591 (= e!114665 (ListLongMap!2168 Nil!2203))))

(declare-fun b!173592 () Bool)

(assert (=> b!173592 (= e!114669 (isEmpty!436 lt!85942))))

(declare-fun b!173593 () Bool)

(assert (=> b!173593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> b!173593 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_values!3581 thiss!1248))))))

(assert (=> b!173593 (= e!114667 (= (apply!130 lt!85942 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173594 () Bool)

(declare-fun e!114668 () ListLongMap!2167)

(assert (=> b!173594 (= e!114668 call!17598)))

(declare-fun b!173595 () Bool)

(assert (=> b!173595 (= e!114669 (= lt!85942 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248))))))

(declare-fun b!173596 () Bool)

(assert (=> b!173596 (= e!114665 e!114668)))

(declare-fun c!30969 () Bool)

(assert (=> b!173596 (= c!30969 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173597 () Bool)

(declare-fun e!114666 () Bool)

(assert (=> b!173597 (= e!114666 e!114664)))

(declare-fun c!30968 () Bool)

(declare-fun e!114670 () Bool)

(assert (=> b!173597 (= c!30968 e!114670)))

(declare-fun res!82419 () Bool)

(assert (=> b!173597 (=> (not res!82419) (not e!114670))))

(assert (=> b!173597 (= res!82419 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173598 () Bool)

(declare-fun lt!85940 () Unit!5314)

(declare-fun lt!85944 () Unit!5314)

(assert (=> b!173598 (= lt!85940 lt!85944)))

(declare-fun lt!85943 () (_ BitVec 64))

(declare-fun lt!85946 () ListLongMap!2167)

(declare-fun lt!85941 () V!5091)

(declare-fun lt!85945 () (_ BitVec 64))

(assert (=> b!173598 (not (contains!1154 (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941)) lt!85943))))

(assert (=> b!173598 (= lt!85944 (addStillNotContains!72 lt!85946 lt!85945 lt!85941 lt!85943))))

(assert (=> b!173598 (= lt!85943 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173598 (= lt!85941 (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173598 (= lt!85945 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173598 (= lt!85946 call!17598)))

(assert (=> b!173598 (= e!114668 (+!246 call!17598 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173599 () Bool)

(assert (=> b!173599 (= e!114670 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173599 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!52687 () Bool)

(assert (=> d!52687 e!114666))

(declare-fun res!82420 () Bool)

(assert (=> d!52687 (=> (not res!82420) (not e!114666))))

(assert (=> d!52687 (= res!82420 (not (contains!1154 lt!85942 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52687 (= lt!85942 e!114665)))

(declare-fun c!30966 () Bool)

(assert (=> d!52687 (= c!30966 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52687 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!52687 (= (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)) lt!85942)))

(declare-fun b!173589 () Bool)

(declare-fun res!82417 () Bool)

(assert (=> b!173589 (=> (not res!82417) (not e!114666))))

(assert (=> b!173589 (= res!82417 (not (contains!1154 lt!85942 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52687 c!30966) b!173591))

(assert (= (and d!52687 (not c!30966)) b!173596))

(assert (= (and b!173596 c!30969) b!173598))

(assert (= (and b!173596 (not c!30969)) b!173594))

(assert (= (or b!173598 b!173594) bm!17595))

(assert (= (and d!52687 res!82420) b!173589))

(assert (= (and b!173589 res!82417) b!173597))

(assert (= (and b!173597 res!82419) b!173599))

(assert (= (and b!173597 c!30968) b!173590))

(assert (= (and b!173597 (not c!30968)) b!173588))

(assert (= (and b!173590 res!82418) b!173593))

(assert (= (and b!173588 c!30967) b!173595))

(assert (= (and b!173588 (not c!30967)) b!173592))

(declare-fun b_lambda!6947 () Bool)

(assert (=> (not b_lambda!6947) (not b!173593)))

(assert (=> b!173593 t!7016))

(declare-fun b_and!10763 () Bool)

(assert (= b_and!10761 (and (=> t!7016 result!4585) b_and!10763)))

(declare-fun b_lambda!6949 () Bool)

(assert (=> (not b_lambda!6949) (not b!173598)))

(assert (=> b!173598 t!7016))

(declare-fun b_and!10765 () Bool)

(assert (= b_and!10763 (and (=> t!7016 result!4585) b_and!10765)))

(declare-fun m!202091 () Bool)

(assert (=> b!173595 m!202091))

(assert (=> b!173593 m!201745))

(assert (=> b!173593 m!201747))

(assert (=> b!173593 m!201749))

(assert (=> b!173593 m!201747))

(assert (=> b!173593 m!201737))

(declare-fun m!202093 () Bool)

(assert (=> b!173593 m!202093))

(assert (=> b!173593 m!201737))

(assert (=> b!173593 m!201745))

(declare-fun m!202095 () Bool)

(assert (=> d!52687 m!202095))

(assert (=> d!52687 m!201729))

(assert (=> b!173590 m!201737))

(assert (=> b!173590 m!201737))

(declare-fun m!202097 () Bool)

(assert (=> b!173590 m!202097))

(assert (=> bm!17595 m!202091))

(declare-fun m!202099 () Bool)

(assert (=> b!173592 m!202099))

(assert (=> b!173599 m!201737))

(assert (=> b!173599 m!201737))

(assert (=> b!173599 m!201739))

(declare-fun m!202101 () Bool)

(assert (=> b!173589 m!202101))

(assert (=> b!173596 m!201737))

(assert (=> b!173596 m!201737))

(assert (=> b!173596 m!201739))

(declare-fun m!202103 () Bool)

(assert (=> b!173598 m!202103))

(declare-fun m!202105 () Bool)

(assert (=> b!173598 m!202105))

(assert (=> b!173598 m!201745))

(assert (=> b!173598 m!201747))

(assert (=> b!173598 m!201749))

(assert (=> b!173598 m!201747))

(assert (=> b!173598 m!202103))

(declare-fun m!202107 () Bool)

(assert (=> b!173598 m!202107))

(assert (=> b!173598 m!201737))

(assert (=> b!173598 m!201745))

(declare-fun m!202109 () Bool)

(assert (=> b!173598 m!202109))

(assert (=> bm!17582 d!52687))

(assert (=> b!173383 d!52659))

(declare-fun b!173608 () Bool)

(declare-fun e!114678 () Bool)

(declare-fun call!17601 () Bool)

(assert (=> b!173608 (= e!114678 call!17601)))

(declare-fun d!52689 () Bool)

(declare-fun res!82426 () Bool)

(declare-fun e!114677 () Bool)

(assert (=> d!52689 (=> res!82426 e!114677)))

(assert (=> d!52689 (= res!82426 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52689 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5439 thiss!1248) (mask!8470 thiss!1248)) e!114677)))

(declare-fun b!173609 () Bool)

(assert (=> b!173609 (= e!114677 e!114678)))

(declare-fun c!30972 () Bool)

(assert (=> b!173609 (= c!30972 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173610 () Bool)

(declare-fun e!114679 () Bool)

(assert (=> b!173610 (= e!114679 call!17601)))

(declare-fun bm!17598 () Bool)

(assert (=> bm!17598 (= call!17601 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)))))

(declare-fun b!173611 () Bool)

(assert (=> b!173611 (= e!114678 e!114679)))

(declare-fun lt!85954 () (_ BitVec 64))

(assert (=> b!173611 (= lt!85954 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85955 () Unit!5314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7297 (_ BitVec 64) (_ BitVec 32)) Unit!5314)

(assert (=> b!173611 (= lt!85955 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5439 thiss!1248) lt!85954 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173611 (arrayContainsKey!0 (_keys!5439 thiss!1248) lt!85954 #b00000000000000000000000000000000)))

(declare-fun lt!85953 () Unit!5314)

(assert (=> b!173611 (= lt!85953 lt!85955)))

(declare-fun res!82425 () Bool)

(declare-datatypes ((SeekEntryResult!542 0))(
  ( (MissingZero!542 (index!4336 (_ BitVec 32))) (Found!542 (index!4337 (_ BitVec 32))) (Intermediate!542 (undefined!1354 Bool) (index!4338 (_ BitVec 32)) (x!19196 (_ BitVec 32))) (Undefined!542) (MissingVacant!542 (index!4339 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7297 (_ BitVec 32)) SeekEntryResult!542)

(assert (=> b!173611 (= res!82425 (= (seekEntryOrOpen!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)) (Found!542 #b00000000000000000000000000000000)))))

(assert (=> b!173611 (=> (not res!82425) (not e!114679))))

(assert (= (and d!52689 (not res!82426)) b!173609))

(assert (= (and b!173609 c!30972) b!173611))

(assert (= (and b!173609 (not c!30972)) b!173608))

(assert (= (and b!173611 res!82425) b!173610))

(assert (= (or b!173610 b!173608) bm!17598))

(assert (=> b!173609 m!201737))

(assert (=> b!173609 m!201737))

(assert (=> b!173609 m!201739))

(declare-fun m!202111 () Bool)

(assert (=> bm!17598 m!202111))

(assert (=> b!173611 m!201737))

(declare-fun m!202113 () Bool)

(assert (=> b!173611 m!202113))

(declare-fun m!202115 () Bool)

(assert (=> b!173611 m!202115))

(assert (=> b!173611 m!201737))

(declare-fun m!202117 () Bool)

(assert (=> b!173611 m!202117))

(assert (=> b!173328 d!52689))

(declare-fun d!52691 () Bool)

(assert (=> d!52691 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85728) key!828))))

(declare-fun lt!85958 () Unit!5314)

(declare-fun choose!932 (List!2206 (_ BitVec 64)) Unit!5314)

(assert (=> d!52691 (= lt!85958 (choose!932 (toList!1099 lt!85728) key!828))))

(declare-fun e!114682 () Bool)

(assert (=> d!52691 e!114682))

(declare-fun res!82429 () Bool)

(assert (=> d!52691 (=> (not res!82429) (not e!114682))))

(assert (=> d!52691 (= res!82429 (isStrictlySorted!332 (toList!1099 lt!85728)))))

(assert (=> d!52691 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85728) key!828) lt!85958)))

(declare-fun b!173614 () Bool)

(assert (=> b!173614 (= e!114682 (containsKey!189 (toList!1099 lt!85728) key!828))))

(assert (= (and d!52691 res!82429) b!173614))

(assert (=> d!52691 m!201853))

(assert (=> d!52691 m!201853))

(assert (=> d!52691 m!201855))

(declare-fun m!202119 () Bool)

(assert (=> d!52691 m!202119))

(declare-fun m!202121 () Bool)

(assert (=> d!52691 m!202121))

(assert (=> b!173614 m!201849))

(assert (=> b!173431 d!52691))

(assert (=> b!173431 d!52679))

(assert (=> b!173431 d!52681))

(assert (=> d!52611 d!52595))

(declare-fun d!52693 () Bool)

(assert (=> d!52693 (= (apply!130 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) lt!85829) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) lt!85829)))))

(declare-fun bs!7163 () Bool)

(assert (= bs!7163 d!52693))

(declare-fun m!202123 () Bool)

(assert (=> bs!7163 m!202123))

(assert (=> bs!7163 m!202123))

(declare-fun m!202125 () Bool)

(assert (=> bs!7163 m!202125))

(assert (=> b!173419 d!52693))

(assert (=> b!173419 d!52687))

(declare-fun d!52695 () Bool)

(declare-fun e!114683 () Bool)

(assert (=> d!52695 e!114683))

(declare-fun res!82430 () Bool)

(assert (=> d!52695 (=> (not res!82430) (not e!114683))))

(declare-fun lt!85960 () ListLongMap!2167)

(assert (=> d!52695 (= res!82430 (contains!1154 lt!85960 (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun lt!85961 () List!2206)

(assert (=> d!52695 (= lt!85960 (ListLongMap!2168 lt!85961))))

(declare-fun lt!85962 () Unit!5314)

(declare-fun lt!85959 () Unit!5314)

(assert (=> d!52695 (= lt!85962 lt!85959)))

(assert (=> d!52695 (= (getValueByKey!185 lt!85961 (_1!1631 (tuple2!3241 lt!85838 v!309))) (Some!190 (_2!1631 (tuple2!3241 lt!85838 v!309))))))

(assert (=> d!52695 (= lt!85959 (lemmaContainsTupThenGetReturnValue!98 lt!85961 (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309))))))

(assert (=> d!52695 (= lt!85961 (insertStrictlySorted!101 (toList!1099 lt!85834) (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309))))))

(assert (=> d!52695 (= (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)) lt!85960)))

(declare-fun b!173615 () Bool)

(declare-fun res!82431 () Bool)

(assert (=> b!173615 (=> (not res!82431) (not e!114683))))

(assert (=> b!173615 (= res!82431 (= (getValueByKey!185 (toList!1099 lt!85960) (_1!1631 (tuple2!3241 lt!85838 v!309))) (Some!190 (_2!1631 (tuple2!3241 lt!85838 v!309)))))))

(declare-fun b!173616 () Bool)

(assert (=> b!173616 (= e!114683 (contains!1155 (toList!1099 lt!85960) (tuple2!3241 lt!85838 v!309)))))

(assert (= (and d!52695 res!82430) b!173615))

(assert (= (and b!173615 res!82431) b!173616))

(declare-fun m!202127 () Bool)

(assert (=> d!52695 m!202127))

(declare-fun m!202129 () Bool)

(assert (=> d!52695 m!202129))

(declare-fun m!202131 () Bool)

(assert (=> d!52695 m!202131))

(declare-fun m!202133 () Bool)

(assert (=> d!52695 m!202133))

(declare-fun m!202135 () Bool)

(assert (=> b!173615 m!202135))

(declare-fun m!202137 () Bool)

(assert (=> b!173616 m!202137))

(assert (=> b!173419 d!52695))

(declare-fun d!52697 () Bool)

(assert (=> d!52697 (contains!1154 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) lt!85822)))

(declare-fun lt!85963 () Unit!5314)

(assert (=> d!52697 (= lt!85963 (choose!930 lt!85823 lt!85821 (zeroValue!3439 thiss!1248) lt!85822))))

(assert (=> d!52697 (contains!1154 lt!85823 lt!85822)))

(assert (=> d!52697 (= (addStillContains!106 lt!85823 lt!85821 (zeroValue!3439 thiss!1248) lt!85822) lt!85963)))

(declare-fun bs!7164 () Bool)

(assert (= bs!7164 d!52697))

(assert (=> bs!7164 m!201833))

(assert (=> bs!7164 m!201833))

(assert (=> bs!7164 m!201843))

(declare-fun m!202139 () Bool)

(assert (=> bs!7164 m!202139))

(declare-fun m!202141 () Bool)

(assert (=> bs!7164 m!202141))

(assert (=> b!173419 d!52697))

(declare-fun d!52699 () Bool)

(assert (=> d!52699 (= (apply!130 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)) lt!85830) (apply!130 lt!85826 lt!85830))))

(declare-fun lt!85964 () Unit!5314)

(assert (=> d!52699 (= lt!85964 (choose!929 lt!85826 lt!85836 v!309 lt!85830))))

(declare-fun e!114684 () Bool)

(assert (=> d!52699 e!114684))

(declare-fun res!82432 () Bool)

(assert (=> d!52699 (=> (not res!82432) (not e!114684))))

(assert (=> d!52699 (= res!82432 (contains!1154 lt!85826 lt!85830))))

(assert (=> d!52699 (= (addApplyDifferent!106 lt!85826 lt!85836 v!309 lt!85830) lt!85964)))

(declare-fun b!173617 () Bool)

(assert (=> b!173617 (= e!114684 (not (= lt!85830 lt!85836)))))

(assert (= (and d!52699 res!82432) b!173617))

(assert (=> d!52699 m!201817))

(assert (=> d!52699 m!201819))

(declare-fun m!202143 () Bool)

(assert (=> d!52699 m!202143))

(assert (=> d!52699 m!201819))

(assert (=> d!52699 m!201821))

(declare-fun m!202145 () Bool)

(assert (=> d!52699 m!202145))

(assert (=> b!173419 d!52699))

(declare-fun d!52701 () Bool)

(declare-fun e!114685 () Bool)

(assert (=> d!52701 e!114685))

(declare-fun res!82433 () Bool)

(assert (=> d!52701 (=> (not res!82433) (not e!114685))))

(declare-fun lt!85966 () ListLongMap!2167)

(assert (=> d!52701 (= res!82433 (contains!1154 lt!85966 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!85967 () List!2206)

(assert (=> d!52701 (= lt!85966 (ListLongMap!2168 lt!85967))))

(declare-fun lt!85968 () Unit!5314)

(declare-fun lt!85965 () Unit!5314)

(assert (=> d!52701 (= lt!85968 lt!85965)))

(assert (=> d!52701 (= (getValueByKey!185 lt!85967 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52701 (= lt!85965 (lemmaContainsTupThenGetReturnValue!98 lt!85967 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52701 (= lt!85967 (insertStrictlySorted!101 (toList!1099 lt!85840) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52701 (= (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) lt!85966)))

(declare-fun b!173618 () Bool)

(declare-fun res!82434 () Bool)

(assert (=> b!173618 (=> (not res!82434) (not e!114685))))

(assert (=> b!173618 (= res!82434 (= (getValueByKey!185 (toList!1099 lt!85966) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(declare-fun b!173619 () Bool)

(assert (=> b!173619 (= e!114685 (contains!1155 (toList!1099 lt!85966) (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!52701 res!82433) b!173618))

(assert (= (and b!173618 res!82434) b!173619))

(declare-fun m!202147 () Bool)

(assert (=> d!52701 m!202147))

(declare-fun m!202149 () Bool)

(assert (=> d!52701 m!202149))

(declare-fun m!202151 () Bool)

(assert (=> d!52701 m!202151))

(declare-fun m!202153 () Bool)

(assert (=> d!52701 m!202153))

(declare-fun m!202155 () Bool)

(assert (=> b!173618 m!202155))

(declare-fun m!202157 () Bool)

(assert (=> b!173619 m!202157))

(assert (=> b!173419 d!52701))

(declare-fun d!52703 () Bool)

(assert (=> d!52703 (= (apply!130 lt!85826 lt!85830) (get!1969 (getValueByKey!185 (toList!1099 lt!85826) lt!85830)))))

(declare-fun bs!7165 () Bool)

(assert (= bs!7165 d!52703))

(declare-fun m!202159 () Bool)

(assert (=> bs!7165 m!202159))

(assert (=> bs!7165 m!202159))

(declare-fun m!202161 () Bool)

(assert (=> bs!7165 m!202161))

(assert (=> b!173419 d!52703))

(declare-fun d!52705 () Bool)

(declare-fun e!114686 () Bool)

(assert (=> d!52705 e!114686))

(declare-fun res!82435 () Bool)

(assert (=> d!52705 (=> (not res!82435) (not e!114686))))

(declare-fun lt!85970 () ListLongMap!2167)

(assert (=> d!52705 (= res!82435 (contains!1154 lt!85970 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!85971 () List!2206)

(assert (=> d!52705 (= lt!85970 (ListLongMap!2168 lt!85971))))

(declare-fun lt!85972 () Unit!5314)

(declare-fun lt!85969 () Unit!5314)

(assert (=> d!52705 (= lt!85972 lt!85969)))

(assert (=> d!52705 (= (getValueByKey!185 lt!85971 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52705 (= lt!85969 (lemmaContainsTupThenGetReturnValue!98 lt!85971 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52705 (= lt!85971 (insertStrictlySorted!101 (toList!1099 lt!85823) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52705 (= (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) lt!85970)))

(declare-fun b!173620 () Bool)

(declare-fun res!82436 () Bool)

(assert (=> b!173620 (=> (not res!82436) (not e!114686))))

(assert (=> b!173620 (= res!82436 (= (getValueByKey!185 (toList!1099 lt!85970) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(declare-fun b!173621 () Bool)

(assert (=> b!173621 (= e!114686 (contains!1155 (toList!1099 lt!85970) (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!52705 res!82435) b!173620))

(assert (= (and b!173620 res!82436) b!173621))

(declare-fun m!202163 () Bool)

(assert (=> d!52705 m!202163))

(declare-fun m!202165 () Bool)

(assert (=> d!52705 m!202165))

(declare-fun m!202167 () Bool)

(assert (=> d!52705 m!202167))

(declare-fun m!202169 () Bool)

(assert (=> d!52705 m!202169))

(declare-fun m!202171 () Bool)

(assert (=> b!173620 m!202171))

(declare-fun m!202173 () Bool)

(assert (=> b!173621 m!202173))

(assert (=> b!173419 d!52705))

(declare-fun d!52707 () Bool)

(assert (=> d!52707 (= (apply!130 lt!85834 lt!85828) (get!1969 (getValueByKey!185 (toList!1099 lt!85834) lt!85828)))))

(declare-fun bs!7166 () Bool)

(assert (= bs!7166 d!52707))

(declare-fun m!202175 () Bool)

(assert (=> bs!7166 m!202175))

(assert (=> bs!7166 m!202175))

(declare-fun m!202177 () Bool)

(assert (=> bs!7166 m!202177))

(assert (=> b!173419 d!52707))

(declare-fun d!52709 () Bool)

(assert (=> d!52709 (= (apply!130 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)) lt!85830) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309))) lt!85830)))))

(declare-fun bs!7167 () Bool)

(assert (= bs!7167 d!52709))

(declare-fun m!202179 () Bool)

(assert (=> bs!7167 m!202179))

(assert (=> bs!7167 m!202179))

(declare-fun m!202181 () Bool)

(assert (=> bs!7167 m!202181))

(assert (=> b!173419 d!52709))

(declare-fun d!52711 () Bool)

(assert (=> d!52711 (= (apply!130 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)) lt!85828) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309))) lt!85828)))))

(declare-fun bs!7168 () Bool)

(assert (= bs!7168 d!52711))

(declare-fun m!202183 () Bool)

(assert (=> bs!7168 m!202183))

(assert (=> bs!7168 m!202183))

(declare-fun m!202185 () Bool)

(assert (=> bs!7168 m!202185))

(assert (=> b!173419 d!52711))

(declare-fun d!52713 () Bool)

(assert (=> d!52713 (= (apply!130 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)) lt!85828) (apply!130 lt!85834 lt!85828))))

(declare-fun lt!85973 () Unit!5314)

(assert (=> d!52713 (= lt!85973 (choose!929 lt!85834 lt!85838 v!309 lt!85828))))

(declare-fun e!114687 () Bool)

(assert (=> d!52713 e!114687))

(declare-fun res!82437 () Bool)

(assert (=> d!52713 (=> (not res!82437) (not e!114687))))

(assert (=> d!52713 (= res!82437 (contains!1154 lt!85834 lt!85828))))

(assert (=> d!52713 (= (addApplyDifferent!106 lt!85834 lt!85838 v!309 lt!85828) lt!85973)))

(declare-fun b!173622 () Bool)

(assert (=> b!173622 (= e!114687 (not (= lt!85828 lt!85838)))))

(assert (= (and d!52713 res!82437) b!173622))

(assert (=> d!52713 m!201837))

(assert (=> d!52713 m!201827))

(declare-fun m!202187 () Bool)

(assert (=> d!52713 m!202187))

(assert (=> d!52713 m!201827))

(assert (=> d!52713 m!201831))

(declare-fun m!202189 () Bool)

(assert (=> d!52713 m!202189))

(assert (=> b!173419 d!52713))

(declare-fun d!52715 () Bool)

(declare-fun e!114688 () Bool)

(assert (=> d!52715 e!114688))

(declare-fun res!82438 () Bool)

(assert (=> d!52715 (=> (not res!82438) (not e!114688))))

(declare-fun lt!85975 () ListLongMap!2167)

(assert (=> d!52715 (= res!82438 (contains!1154 lt!85975 (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun lt!85976 () List!2206)

(assert (=> d!52715 (= lt!85975 (ListLongMap!2168 lt!85976))))

(declare-fun lt!85977 () Unit!5314)

(declare-fun lt!85974 () Unit!5314)

(assert (=> d!52715 (= lt!85977 lt!85974)))

(assert (=> d!52715 (= (getValueByKey!185 lt!85976 (_1!1631 (tuple2!3241 lt!85836 v!309))) (Some!190 (_2!1631 (tuple2!3241 lt!85836 v!309))))))

(assert (=> d!52715 (= lt!85974 (lemmaContainsTupThenGetReturnValue!98 lt!85976 (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309))))))

(assert (=> d!52715 (= lt!85976 (insertStrictlySorted!101 (toList!1099 lt!85826) (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309))))))

(assert (=> d!52715 (= (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)) lt!85975)))

(declare-fun b!173623 () Bool)

(declare-fun res!82439 () Bool)

(assert (=> b!173623 (=> (not res!82439) (not e!114688))))

(assert (=> b!173623 (= res!82439 (= (getValueByKey!185 (toList!1099 lt!85975) (_1!1631 (tuple2!3241 lt!85836 v!309))) (Some!190 (_2!1631 (tuple2!3241 lt!85836 v!309)))))))

(declare-fun b!173624 () Bool)

(assert (=> b!173624 (= e!114688 (contains!1155 (toList!1099 lt!85975) (tuple2!3241 lt!85836 v!309)))))

(assert (= (and d!52715 res!82438) b!173623))

(assert (= (and b!173623 res!82439) b!173624))

(declare-fun m!202191 () Bool)

(assert (=> d!52715 m!202191))

(declare-fun m!202193 () Bool)

(assert (=> d!52715 m!202193))

(declare-fun m!202195 () Bool)

(assert (=> d!52715 m!202195))

(declare-fun m!202197 () Bool)

(assert (=> d!52715 m!202197))

(declare-fun m!202199 () Bool)

(assert (=> b!173623 m!202199))

(declare-fun m!202201 () Bool)

(assert (=> b!173624 m!202201))

(assert (=> b!173419 d!52715))

(declare-fun d!52717 () Bool)

(declare-fun e!114689 () Bool)

(assert (=> d!52717 e!114689))

(declare-fun res!82440 () Bool)

(assert (=> d!52717 (=> res!82440 e!114689)))

(declare-fun lt!85978 () Bool)

(assert (=> d!52717 (= res!82440 (not lt!85978))))

(declare-fun lt!85980 () Bool)

(assert (=> d!52717 (= lt!85978 lt!85980)))

(declare-fun lt!85981 () Unit!5314)

(declare-fun e!114690 () Unit!5314)

(assert (=> d!52717 (= lt!85981 e!114690)))

(declare-fun c!30973 () Bool)

(assert (=> d!52717 (= c!30973 lt!85980)))

(assert (=> d!52717 (= lt!85980 (containsKey!189 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822))))

(assert (=> d!52717 (= (contains!1154 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) lt!85822) lt!85978)))

(declare-fun b!173625 () Bool)

(declare-fun lt!85979 () Unit!5314)

(assert (=> b!173625 (= e!114690 lt!85979)))

(assert (=> b!173625 (= lt!85979 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822))))

(assert (=> b!173625 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822))))

(declare-fun b!173626 () Bool)

(declare-fun Unit!5326 () Unit!5314)

(assert (=> b!173626 (= e!114690 Unit!5326)))

(declare-fun b!173627 () Bool)

(assert (=> b!173627 (= e!114689 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822)))))

(assert (= (and d!52717 c!30973) b!173625))

(assert (= (and d!52717 (not c!30973)) b!173626))

(assert (= (and d!52717 (not res!82440)) b!173627))

(declare-fun m!202203 () Bool)

(assert (=> d!52717 m!202203))

(declare-fun m!202205 () Bool)

(assert (=> b!173625 m!202205))

(declare-fun m!202207 () Bool)

(assert (=> b!173625 m!202207))

(assert (=> b!173625 m!202207))

(declare-fun m!202209 () Bool)

(assert (=> b!173625 m!202209))

(assert (=> b!173627 m!202207))

(assert (=> b!173627 m!202207))

(assert (=> b!173627 m!202209))

(assert (=> b!173419 d!52717))

(declare-fun d!52719 () Bool)

(assert (=> d!52719 (= (apply!130 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) lt!85829) (apply!130 lt!85840 lt!85829))))

(declare-fun lt!85982 () Unit!5314)

(assert (=> d!52719 (= lt!85982 (choose!929 lt!85840 lt!85833 (zeroValue!3439 thiss!1248) lt!85829))))

(declare-fun e!114691 () Bool)

(assert (=> d!52719 e!114691))

(declare-fun res!82441 () Bool)

(assert (=> d!52719 (=> (not res!82441) (not e!114691))))

(assert (=> d!52719 (= res!82441 (contains!1154 lt!85840 lt!85829))))

(assert (=> d!52719 (= (addApplyDifferent!106 lt!85840 lt!85833 (zeroValue!3439 thiss!1248) lt!85829) lt!85982)))

(declare-fun b!173628 () Bool)

(assert (=> b!173628 (= e!114691 (not (= lt!85829 lt!85833)))))

(assert (= (and d!52719 res!82441) b!173628))

(assert (=> d!52719 m!201815))

(assert (=> d!52719 m!201823))

(declare-fun m!202211 () Bool)

(assert (=> d!52719 m!202211))

(assert (=> d!52719 m!201823))

(assert (=> d!52719 m!201825))

(declare-fun m!202213 () Bool)

(assert (=> d!52719 m!202213))

(assert (=> b!173419 d!52719))

(declare-fun d!52721 () Bool)

(assert (=> d!52721 (= (apply!130 lt!85840 lt!85829) (get!1969 (getValueByKey!185 (toList!1099 lt!85840) lt!85829)))))

(declare-fun bs!7169 () Bool)

(assert (= bs!7169 d!52721))

(declare-fun m!202215 () Bool)

(assert (=> bs!7169 m!202215))

(assert (=> bs!7169 m!202215))

(declare-fun m!202217 () Bool)

(assert (=> bs!7169 m!202217))

(assert (=> b!173419 d!52721))

(declare-fun d!52723 () Bool)

(declare-fun res!82450 () Bool)

(declare-fun e!114701 () Bool)

(assert (=> d!52723 (=> res!82450 e!114701)))

(assert (=> d!52723 (= res!82450 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52723 (= (arrayNoDuplicates!0 (_keys!5439 thiss!1248) #b00000000000000000000000000000000 Nil!2205) e!114701)))

(declare-fun b!173639 () Bool)

(declare-fun e!114703 () Bool)

(declare-fun contains!1156 (List!2208 (_ BitVec 64)) Bool)

(assert (=> b!173639 (= e!114703 (contains!1156 Nil!2205 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173640 () Bool)

(declare-fun e!114702 () Bool)

(declare-fun e!114700 () Bool)

(assert (=> b!173640 (= e!114702 e!114700)))

(declare-fun c!30976 () Bool)

(assert (=> b!173640 (= c!30976 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173641 () Bool)

(declare-fun call!17604 () Bool)

(assert (=> b!173641 (= e!114700 call!17604)))

(declare-fun b!173642 () Bool)

(assert (=> b!173642 (= e!114700 call!17604)))

(declare-fun bm!17601 () Bool)

(assert (=> bm!17601 (= call!17604 (arrayNoDuplicates!0 (_keys!5439 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30976 (Cons!2204 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) Nil!2205) Nil!2205)))))

(declare-fun b!173643 () Bool)

(assert (=> b!173643 (= e!114701 e!114702)))

(declare-fun res!82448 () Bool)

(assert (=> b!173643 (=> (not res!82448) (not e!114702))))

(assert (=> b!173643 (= res!82448 (not e!114703))))

(declare-fun res!82449 () Bool)

(assert (=> b!173643 (=> (not res!82449) (not e!114703))))

(assert (=> b!173643 (= res!82449 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52723 (not res!82450)) b!173643))

(assert (= (and b!173643 res!82449) b!173639))

(assert (= (and b!173643 res!82448) b!173640))

(assert (= (and b!173640 c!30976) b!173642))

(assert (= (and b!173640 (not c!30976)) b!173641))

(assert (= (or b!173642 b!173641) bm!17601))

(assert (=> b!173639 m!201737))

(assert (=> b!173639 m!201737))

(declare-fun m!202219 () Bool)

(assert (=> b!173639 m!202219))

(assert (=> b!173640 m!201737))

(assert (=> b!173640 m!201737))

(assert (=> b!173640 m!201739))

(assert (=> bm!17601 m!201737))

(declare-fun m!202221 () Bool)

(assert (=> bm!17601 m!202221))

(assert (=> b!173643 m!201737))

(assert (=> b!173643 m!201737))

(assert (=> b!173643 m!201739))

(assert (=> b!173329 d!52723))

(declare-fun d!52725 () Bool)

(declare-fun res!82453 () Bool)

(declare-fun e!114705 () Bool)

(assert (=> d!52725 (=> res!82453 e!114705)))

(assert (=> d!52725 (= res!82453 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!52725 (= (arrayNoDuplicates!0 (_keys!5439 lt!85729) #b00000000000000000000000000000000 Nil!2205) e!114705)))

(declare-fun b!173644 () Bool)

(declare-fun e!114707 () Bool)

(assert (=> b!173644 (= e!114707 (contains!1156 Nil!2205 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!173645 () Bool)

(declare-fun e!114706 () Bool)

(declare-fun e!114704 () Bool)

(assert (=> b!173645 (= e!114706 e!114704)))

(declare-fun c!30977 () Bool)

(assert (=> b!173645 (= c!30977 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!173646 () Bool)

(declare-fun call!17605 () Bool)

(assert (=> b!173646 (= e!114704 call!17605)))

(declare-fun b!173647 () Bool)

(assert (=> b!173647 (= e!114704 call!17605)))

(declare-fun bm!17602 () Bool)

(assert (=> bm!17602 (= call!17605 (arrayNoDuplicates!0 (_keys!5439 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30977 (Cons!2204 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) Nil!2205) Nil!2205)))))

(declare-fun b!173648 () Bool)

(assert (=> b!173648 (= e!114705 e!114706)))

(declare-fun res!82451 () Bool)

(assert (=> b!173648 (=> (not res!82451) (not e!114706))))

(assert (=> b!173648 (= res!82451 (not e!114707))))

(declare-fun res!82452 () Bool)

(assert (=> b!173648 (=> (not res!82452) (not e!114707))))

(assert (=> b!173648 (= res!82452 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (= (and d!52725 (not res!82453)) b!173648))

(assert (= (and b!173648 res!82452) b!173644))

(assert (= (and b!173648 res!82451) b!173645))

(assert (= (and b!173645 c!30977) b!173647))

(assert (= (and b!173645 (not c!30977)) b!173646))

(assert (= (or b!173647 b!173646) bm!17602))

(declare-fun m!202223 () Bool)

(assert (=> b!173644 m!202223))

(assert (=> b!173644 m!202223))

(declare-fun m!202225 () Bool)

(assert (=> b!173644 m!202225))

(assert (=> b!173645 m!202223))

(assert (=> b!173645 m!202223))

(declare-fun m!202227 () Bool)

(assert (=> b!173645 m!202227))

(assert (=> bm!17602 m!202223))

(declare-fun m!202229 () Bool)

(assert (=> bm!17602 m!202229))

(assert (=> b!173648 m!202223))

(assert (=> b!173648 m!202223))

(assert (=> b!173648 m!202227))

(assert (=> b!173332 d!52725))

(declare-fun b!173658 () Bool)

(declare-fun res!82463 () Bool)

(declare-fun e!114710 () Bool)

(assert (=> b!173658 (=> (not res!82463) (not e!114710))))

(declare-fun size!3770 (LongMapFixedSize!2304) (_ BitVec 32))

(assert (=> b!173658 (= res!82463 (bvsge (size!3770 thiss!1248) (_size!1201 thiss!1248)))))

(declare-fun d!52727 () Bool)

(declare-fun res!82465 () Bool)

(assert (=> d!52727 (=> (not res!82465) (not e!114710))))

(assert (=> d!52727 (= res!82465 (validMask!0 (mask!8470 thiss!1248)))))

(assert (=> d!52727 (= (simpleValid!144 thiss!1248) e!114710)))

(declare-fun b!173660 () Bool)

(assert (=> b!173660 (= e!114710 (and (bvsge (extraKeys!3337 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3337 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1201 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!173657 () Bool)

(declare-fun res!82462 () Bool)

(assert (=> b!173657 (=> (not res!82462) (not e!114710))))

(assert (=> b!173657 (= res!82462 (and (= (size!3767 (_values!3581 thiss!1248)) (bvadd (mask!8470 thiss!1248) #b00000000000000000000000000000001)) (= (size!3766 (_keys!5439 thiss!1248)) (size!3767 (_values!3581 thiss!1248))) (bvsge (_size!1201 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1201 thiss!1248) (bvadd (mask!8470 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!173659 () Bool)

(declare-fun res!82464 () Bool)

(assert (=> b!173659 (=> (not res!82464) (not e!114710))))

(assert (=> b!173659 (= res!82464 (= (size!3770 thiss!1248) (bvadd (_size!1201 thiss!1248) (bvsdiv (bvadd (extraKeys!3337 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52727 res!82465) b!173657))

(assert (= (and b!173657 res!82462) b!173658))

(assert (= (and b!173658 res!82463) b!173659))

(assert (= (and b!173659 res!82464) b!173660))

(declare-fun m!202231 () Bool)

(assert (=> b!173658 m!202231))

(assert (=> d!52727 m!201729))

(assert (=> b!173659 m!202231))

(assert (=> d!52589 d!52727))

(declare-fun d!52729 () Bool)

(declare-fun e!114711 () Bool)

(assert (=> d!52729 e!114711))

(declare-fun res!82466 () Bool)

(assert (=> d!52729 (=> res!82466 e!114711)))

(declare-fun lt!85983 () Bool)

(assert (=> d!52729 (= res!82466 (not lt!85983))))

(declare-fun lt!85985 () Bool)

(assert (=> d!52729 (= lt!85983 lt!85985)))

(declare-fun lt!85986 () Unit!5314)

(declare-fun e!114712 () Unit!5314)

(assert (=> d!52729 (= lt!85986 e!114712)))

(declare-fun c!30978 () Bool)

(assert (=> d!52729 (= c!30978 lt!85985)))

(assert (=> d!52729 (= lt!85985 (containsKey!189 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52729 (= (contains!1154 lt!85825 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) lt!85983)))

(declare-fun b!173661 () Bool)

(declare-fun lt!85984 () Unit!5314)

(assert (=> b!173661 (= e!114712 lt!85984)))

(assert (=> b!173661 (= lt!85984 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173661 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173662 () Bool)

(declare-fun Unit!5327 () Unit!5314)

(assert (=> b!173662 (= e!114712 Unit!5327)))

(declare-fun b!173663 () Bool)

(assert (=> b!173663 (= e!114711 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52729 c!30978) b!173661))

(assert (= (and d!52729 (not c!30978)) b!173662))

(assert (= (and d!52729 (not res!82466)) b!173663))

(assert (=> d!52729 m!201737))

(declare-fun m!202233 () Bool)

(assert (=> d!52729 m!202233))

(assert (=> b!173661 m!201737))

(declare-fun m!202235 () Bool)

(assert (=> b!173661 m!202235))

(assert (=> b!173661 m!201737))

(assert (=> b!173661 m!201881))

(assert (=> b!173661 m!201881))

(declare-fun m!202237 () Bool)

(assert (=> b!173661 m!202237))

(assert (=> b!173663 m!201737))

(assert (=> b!173663 m!201881))

(assert (=> b!173663 m!201881))

(assert (=> b!173663 m!202237))

(assert (=> b!173416 d!52729))

(declare-fun d!52731 () Bool)

(declare-fun e!114713 () Bool)

(assert (=> d!52731 e!114713))

(declare-fun res!82467 () Bool)

(assert (=> d!52731 (=> res!82467 e!114713)))

(declare-fun lt!85987 () Bool)

(assert (=> d!52731 (= res!82467 (not lt!85987))))

(declare-fun lt!85989 () Bool)

(assert (=> d!52731 (= lt!85987 lt!85989)))

(declare-fun lt!85990 () Unit!5314)

(declare-fun e!114714 () Unit!5314)

(assert (=> d!52731 (= lt!85990 e!114714)))

(declare-fun c!30979 () Bool)

(assert (=> d!52731 (= c!30979 lt!85989)))

(assert (=> d!52731 (= lt!85989 (containsKey!189 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))))))

(assert (=> d!52731 (= (contains!1154 lt!85855 (_1!1631 (tuple2!3241 key!828 v!309))) lt!85987)))

(declare-fun b!173664 () Bool)

(declare-fun lt!85988 () Unit!5314)

(assert (=> b!173664 (= e!114714 lt!85988)))

(assert (=> b!173664 (= lt!85988 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))))))

(assert (=> b!173664 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun b!173665 () Bool)

(declare-fun Unit!5328 () Unit!5314)

(assert (=> b!173665 (= e!114714 Unit!5328)))

(declare-fun b!173666 () Bool)

(assert (=> b!173666 (= e!114713 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (= (and d!52731 c!30979) b!173664))

(assert (= (and d!52731 (not c!30979)) b!173665))

(assert (= (and d!52731 (not res!82467)) b!173666))

(declare-fun m!202239 () Bool)

(assert (=> d!52731 m!202239))

(declare-fun m!202241 () Bool)

(assert (=> b!173664 m!202241))

(assert (=> b!173664 m!201867))

(assert (=> b!173664 m!201867))

(declare-fun m!202243 () Bool)

(assert (=> b!173664 m!202243))

(assert (=> b!173666 m!201867))

(assert (=> b!173666 m!201867))

(assert (=> b!173666 m!202243))

(assert (=> d!52609 d!52731))

(declare-fun b!173667 () Bool)

(declare-fun e!114715 () Option!191)

(assert (=> b!173667 (= e!114715 (Some!190 (_2!1631 (h!2819 lt!85856))))))

(declare-fun b!173670 () Bool)

(declare-fun e!114716 () Option!191)

(assert (=> b!173670 (= e!114716 None!189)))

(declare-fun b!173668 () Bool)

(assert (=> b!173668 (= e!114715 e!114716)))

(declare-fun c!30981 () Bool)

(assert (=> b!173668 (= c!30981 (and ((_ is Cons!2202) lt!85856) (not (= (_1!1631 (h!2819 lt!85856)) (_1!1631 (tuple2!3241 key!828 v!309))))))))

(declare-fun b!173669 () Bool)

(assert (=> b!173669 (= e!114716 (getValueByKey!185 (t!7013 lt!85856) (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun c!30980 () Bool)

(declare-fun d!52733 () Bool)

(assert (=> d!52733 (= c!30980 (and ((_ is Cons!2202) lt!85856) (= (_1!1631 (h!2819 lt!85856)) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!52733 (= (getValueByKey!185 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309))) e!114715)))

(assert (= (and d!52733 c!30980) b!173667))

(assert (= (and d!52733 (not c!30980)) b!173668))

(assert (= (and b!173668 c!30981) b!173669))

(assert (= (and b!173668 (not c!30981)) b!173670))

(declare-fun m!202245 () Bool)

(assert (=> b!173669 m!202245))

(assert (=> d!52609 d!52733))

(declare-fun d!52735 () Bool)

(assert (=> d!52735 (= (getValueByKey!185 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309))) (Some!190 (_2!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun lt!85991 () Unit!5314)

(assert (=> d!52735 (= lt!85991 (choose!931 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun e!114717 () Bool)

(assert (=> d!52735 e!114717))

(declare-fun res!82468 () Bool)

(assert (=> d!52735 (=> (not res!82468) (not e!114717))))

(assert (=> d!52735 (= res!82468 (isStrictlySorted!332 lt!85856))))

(assert (=> d!52735 (= (lemmaContainsTupThenGetReturnValue!98 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))) lt!85991)))

(declare-fun b!173671 () Bool)

(declare-fun res!82469 () Bool)

(assert (=> b!173671 (=> (not res!82469) (not e!114717))))

(assert (=> b!173671 (= res!82469 (containsKey!189 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun b!173672 () Bool)

(assert (=> b!173672 (= e!114717 (contains!1155 lt!85856 (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(assert (= (and d!52735 res!82468) b!173671))

(assert (= (and b!173671 res!82469) b!173672))

(assert (=> d!52735 m!201861))

(declare-fun m!202247 () Bool)

(assert (=> d!52735 m!202247))

(declare-fun m!202249 () Bool)

(assert (=> d!52735 m!202249))

(declare-fun m!202251 () Bool)

(assert (=> b!173671 m!202251))

(declare-fun m!202253 () Bool)

(assert (=> b!173672 m!202253))

(assert (=> d!52609 d!52735))

(declare-fun bm!17604 () Bool)

(declare-fun call!17608 () List!2206)

(declare-fun call!17606 () List!2206)

(assert (=> bm!17604 (= call!17608 call!17606)))

(declare-fun e!114721 () List!2206)

(declare-fun b!173673 () Bool)

(declare-fun c!30985 () Bool)

(declare-fun c!30983 () Bool)

(assert (=> b!173673 (= e!114721 (ite c!30983 (t!7013 (toList!1099 (map!1882 thiss!1248))) (ite c!30985 (Cons!2202 (h!2819 (toList!1099 (map!1882 thiss!1248))) (t!7013 (toList!1099 (map!1882 thiss!1248)))) Nil!2203)))))

(declare-fun b!173674 () Bool)

(declare-fun res!82470 () Bool)

(declare-fun e!114722 () Bool)

(assert (=> b!173674 (=> (not res!82470) (not e!114722))))

(declare-fun lt!85992 () List!2206)

(assert (=> b!173674 (= res!82470 (containsKey!189 lt!85992 (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun b!173675 () Bool)

(declare-fun e!114719 () List!2206)

(assert (=> b!173675 (= e!114719 call!17606)))

(declare-fun b!173676 () Bool)

(assert (=> b!173676 (= c!30985 (and ((_ is Cons!2202) (toList!1099 (map!1882 thiss!1248))) (bvsgt (_1!1631 (h!2819 (toList!1099 (map!1882 thiss!1248)))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun e!114720 () List!2206)

(declare-fun e!114718 () List!2206)

(assert (=> b!173676 (= e!114720 e!114718)))

(declare-fun b!173677 () Bool)

(declare-fun call!17607 () List!2206)

(assert (=> b!173677 (= e!114718 call!17607)))

(declare-fun b!173678 () Bool)

(assert (=> b!173678 (= e!114718 call!17607)))

(declare-fun b!173679 () Bool)

(assert (=> b!173679 (= e!114719 e!114720)))

(assert (=> b!173679 (= c!30983 (and ((_ is Cons!2202) (toList!1099 (map!1882 thiss!1248))) (= (_1!1631 (h!2819 (toList!1099 (map!1882 thiss!1248)))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun c!30982 () Bool)

(declare-fun bm!17603 () Bool)

(assert (=> bm!17603 (= call!17606 ($colon$colon!98 e!114721 (ite c!30982 (h!2819 (toList!1099 (map!1882 thiss!1248))) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))))))

(declare-fun c!30984 () Bool)

(assert (=> bm!17603 (= c!30984 c!30982)))

(declare-fun d!52737 () Bool)

(assert (=> d!52737 e!114722))

(declare-fun res!82471 () Bool)

(assert (=> d!52737 (=> (not res!82471) (not e!114722))))

(assert (=> d!52737 (= res!82471 (isStrictlySorted!332 lt!85992))))

(assert (=> d!52737 (= lt!85992 e!114719)))

(assert (=> d!52737 (= c!30982 (and ((_ is Cons!2202) (toList!1099 (map!1882 thiss!1248))) (bvslt (_1!1631 (h!2819 (toList!1099 (map!1882 thiss!1248)))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!52737 (isStrictlySorted!332 (toList!1099 (map!1882 thiss!1248)))))

(assert (=> d!52737 (= (insertStrictlySorted!101 (toList!1099 (map!1882 thiss!1248)) (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))) lt!85992)))

(declare-fun bm!17605 () Bool)

(assert (=> bm!17605 (= call!17607 call!17608)))

(declare-fun b!173680 () Bool)

(assert (=> b!173680 (= e!114720 call!17608)))

(declare-fun b!173681 () Bool)

(assert (=> b!173681 (= e!114721 (insertStrictlySorted!101 (t!7013 (toList!1099 (map!1882 thiss!1248))) (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun b!173682 () Bool)

(assert (=> b!173682 (= e!114722 (contains!1155 lt!85992 (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(assert (= (and d!52737 c!30982) b!173675))

(assert (= (and d!52737 (not c!30982)) b!173679))

(assert (= (and b!173679 c!30983) b!173680))

(assert (= (and b!173679 (not c!30983)) b!173676))

(assert (= (and b!173676 c!30985) b!173677))

(assert (= (and b!173676 (not c!30985)) b!173678))

(assert (= (or b!173677 b!173678) bm!17605))

(assert (= (or b!173680 bm!17605) bm!17604))

(assert (= (or b!173675 bm!17604) bm!17603))

(assert (= (and bm!17603 c!30984) b!173681))

(assert (= (and bm!17603 (not c!30984)) b!173673))

(assert (= (and d!52737 res!82471) b!173674))

(assert (= (and b!173674 res!82470) b!173682))

(declare-fun m!202255 () Bool)

(assert (=> b!173682 m!202255))

(declare-fun m!202257 () Bool)

(assert (=> bm!17603 m!202257))

(declare-fun m!202259 () Bool)

(assert (=> b!173681 m!202259))

(declare-fun m!202261 () Bool)

(assert (=> b!173674 m!202261))

(declare-fun m!202263 () Bool)

(assert (=> d!52737 m!202263))

(declare-fun m!202265 () Bool)

(assert (=> d!52737 m!202265))

(assert (=> d!52609 d!52737))

(declare-fun bm!17608 () Bool)

(declare-fun call!17611 () (_ BitVec 32))

(assert (=> bm!17608 (= call!17611 (arrayCountValidKeys!0 (_keys!5439 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173691 () Bool)

(declare-fun e!114728 () (_ BitVec 32))

(declare-fun e!114727 () (_ BitVec 32))

(assert (=> b!173691 (= e!114728 e!114727)))

(declare-fun c!30991 () Bool)

(assert (=> b!173691 (= c!30991 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173692 () Bool)

(assert (=> b!173692 (= e!114728 #b00000000000000000000000000000000)))

(declare-fun d!52739 () Bool)

(declare-fun lt!85995 () (_ BitVec 32))

(assert (=> d!52739 (and (bvsge lt!85995 #b00000000000000000000000000000000) (bvsle lt!85995 (bvsub (size!3766 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52739 (= lt!85995 e!114728)))

(declare-fun c!30990 () Bool)

(assert (=> d!52739 (= c!30990 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52739 (and (bvsle #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3766 (_keys!5439 thiss!1248)) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52739 (= (arrayCountValidKeys!0 (_keys!5439 thiss!1248) #b00000000000000000000000000000000 (size!3766 (_keys!5439 thiss!1248))) lt!85995)))

(declare-fun b!173693 () Bool)

(assert (=> b!173693 (= e!114727 (bvadd #b00000000000000000000000000000001 call!17611))))

(declare-fun b!173694 () Bool)

(assert (=> b!173694 (= e!114727 call!17611)))

(assert (= (and d!52739 c!30990) b!173692))

(assert (= (and d!52739 (not c!30990)) b!173691))

(assert (= (and b!173691 c!30991) b!173693))

(assert (= (and b!173691 (not c!30991)) b!173694))

(assert (= (or b!173693 b!173694) bm!17608))

(declare-fun m!202267 () Bool)

(assert (=> bm!17608 m!202267))

(assert (=> b!173691 m!201737))

(assert (=> b!173691 m!201737))

(assert (=> b!173691 m!201739))

(assert (=> b!173327 d!52739))

(declare-fun d!52741 () Bool)

(assert (=> d!52741 (= (apply!130 lt!85791 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1969 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7170 () Bool)

(assert (= bs!7170 d!52741))

(assert (=> bs!7170 m!201737))

(assert (=> bs!7170 m!202041))

(assert (=> bs!7170 m!202041))

(declare-fun m!202269 () Bool)

(assert (=> bs!7170 m!202269))

(assert (=> b!173395 d!52741))

(assert (=> b!173395 d!52619))

(declare-fun d!52743 () Bool)

(declare-fun lt!85996 () Bool)

(assert (=> d!52743 (= lt!85996 (select (content!149 (toList!1099 lt!85817)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!114730 () Bool)

(assert (=> d!52743 (= lt!85996 e!114730)))

(declare-fun res!82473 () Bool)

(assert (=> d!52743 (=> (not res!82473) (not e!114730))))

(assert (=> d!52743 (= res!82473 ((_ is Cons!2202) (toList!1099 lt!85817)))))

(assert (=> d!52743 (= (contains!1155 (toList!1099 lt!85817) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85996)))

(declare-fun b!173695 () Bool)

(declare-fun e!114729 () Bool)

(assert (=> b!173695 (= e!114730 e!114729)))

(declare-fun res!82472 () Bool)

(assert (=> b!173695 (=> res!82472 e!114729)))

(assert (=> b!173695 (= res!82472 (= (h!2819 (toList!1099 lt!85817)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!173696 () Bool)

(assert (=> b!173696 (= e!114729 (contains!1155 (t!7013 (toList!1099 lt!85817)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52743 res!82473) b!173695))

(assert (= (and b!173695 (not res!82472)) b!173696))

(declare-fun m!202271 () Bool)

(assert (=> d!52743 m!202271))

(declare-fun m!202273 () Bool)

(assert (=> d!52743 m!202273))

(declare-fun m!202275 () Bool)

(assert (=> b!173696 m!202275))

(assert (=> b!173403 d!52743))

(declare-fun d!52745 () Bool)

(declare-fun e!114731 () Bool)

(assert (=> d!52745 e!114731))

(declare-fun res!82474 () Bool)

(assert (=> d!52745 (=> (not res!82474) (not e!114731))))

(declare-fun lt!85998 () ListLongMap!2167)

(assert (=> d!52745 (= res!82474 (contains!1154 lt!85998 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun lt!85999 () List!2206)

(assert (=> d!52745 (= lt!85998 (ListLongMap!2168 lt!85999))))

(declare-fun lt!86000 () Unit!5314)

(declare-fun lt!85997 () Unit!5314)

(assert (=> d!52745 (= lt!86000 lt!85997)))

(assert (=> d!52745 (= (getValueByKey!185 lt!85999 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) (Some!190 (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> d!52745 (= lt!85997 (lemmaContainsTupThenGetReturnValue!98 lt!85999 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> d!52745 (= lt!85999 (insertStrictlySorted!101 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> d!52745 (= (+!246 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)) (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) lt!85998)))

(declare-fun b!173697 () Bool)

(declare-fun res!82475 () Bool)

(assert (=> b!173697 (=> (not res!82475) (not e!114731))))

(assert (=> b!173697 (= res!82475 (= (getValueByKey!185 (toList!1099 lt!85998) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) (Some!190 (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(declare-fun b!173698 () Bool)

(assert (=> b!173698 (= e!114731 (contains!1155 (toList!1099 lt!85998) (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(assert (= (and d!52745 res!82474) b!173697))

(assert (= (and b!173697 res!82475) b!173698))

(declare-fun m!202277 () Bool)

(assert (=> d!52745 m!202277))

(declare-fun m!202279 () Bool)

(assert (=> d!52745 m!202279))

(declare-fun m!202281 () Bool)

(assert (=> d!52745 m!202281))

(declare-fun m!202283 () Bool)

(assert (=> d!52745 m!202283))

(declare-fun m!202285 () Bool)

(assert (=> b!173697 m!202285))

(declare-fun m!202287 () Bool)

(assert (=> b!173698 m!202287))

(assert (=> bm!17570 d!52745))

(declare-fun bm!17609 () Bool)

(declare-fun call!17612 () (_ BitVec 32))

(assert (=> bm!17609 (= call!17612 (arrayCountValidKeys!0 (_keys!5439 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))))))

(declare-fun b!173699 () Bool)

(declare-fun e!114733 () (_ BitVec 32))

(declare-fun e!114732 () (_ BitVec 32))

(assert (=> b!173699 (= e!114733 e!114732)))

(declare-fun c!30993 () Bool)

(assert (=> b!173699 (= c!30993 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!173700 () Bool)

(assert (=> b!173700 (= e!114733 #b00000000000000000000000000000000)))

(declare-fun d!52747 () Bool)

(declare-fun lt!86001 () (_ BitVec 32))

(assert (=> d!52747 (and (bvsge lt!86001 #b00000000000000000000000000000000) (bvsle lt!86001 (bvsub (size!3766 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (=> d!52747 (= lt!86001 e!114733)))

(declare-fun c!30992 () Bool)

(assert (=> d!52747 (= c!30992 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!52747 (and (bvsle #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3766 (_keys!5439 lt!85729)) (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!52747 (= (arrayCountValidKeys!0 (_keys!5439 lt!85729) #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))) lt!86001)))

(declare-fun b!173701 () Bool)

(assert (=> b!173701 (= e!114732 (bvadd #b00000000000000000000000000000001 call!17612))))

(declare-fun b!173702 () Bool)

(assert (=> b!173702 (= e!114732 call!17612)))

(assert (= (and d!52747 c!30992) b!173700))

(assert (= (and d!52747 (not c!30992)) b!173699))

(assert (= (and b!173699 c!30993) b!173701))

(assert (= (and b!173699 (not c!30993)) b!173702))

(assert (= (or b!173701 b!173702) bm!17609))

(declare-fun m!202289 () Bool)

(assert (=> bm!17609 m!202289))

(assert (=> b!173699 m!202223))

(assert (=> b!173699 m!202223))

(assert (=> b!173699 m!202227))

(assert (=> b!173330 d!52747))

(declare-fun d!52749 () Bool)

(declare-fun e!114734 () Bool)

(assert (=> d!52749 e!114734))

(declare-fun res!82476 () Bool)

(assert (=> d!52749 (=> res!82476 e!114734)))

(declare-fun lt!86002 () Bool)

(assert (=> d!52749 (= res!82476 (not lt!86002))))

(declare-fun lt!86004 () Bool)

(assert (=> d!52749 (= lt!86002 lt!86004)))

(declare-fun lt!86005 () Unit!5314)

(declare-fun e!114735 () Unit!5314)

(assert (=> d!52749 (= lt!86005 e!114735)))

(declare-fun c!30994 () Bool)

(assert (=> d!52749 (= c!30994 lt!86004)))

(assert (=> d!52749 (= lt!86004 (containsKey!189 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52749 (= (contains!1154 lt!85791 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86002)))

(declare-fun b!173703 () Bool)

(declare-fun lt!86003 () Unit!5314)

(assert (=> b!173703 (= e!114735 lt!86003)))

(assert (=> b!173703 (= lt!86003 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173703 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173704 () Bool)

(declare-fun Unit!5329 () Unit!5314)

(assert (=> b!173704 (= e!114735 Unit!5329)))

(declare-fun b!173705 () Bool)

(assert (=> b!173705 (= e!114734 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52749 c!30994) b!173703))

(assert (= (and d!52749 (not c!30994)) b!173704))

(assert (= (and d!52749 (not res!82476)) b!173705))

(declare-fun m!202291 () Bool)

(assert (=> d!52749 m!202291))

(declare-fun m!202293 () Bool)

(assert (=> b!173703 m!202293))

(declare-fun m!202295 () Bool)

(assert (=> b!173703 m!202295))

(assert (=> b!173703 m!202295))

(declare-fun m!202297 () Bool)

(assert (=> b!173703 m!202297))

(assert (=> b!173705 m!202295))

(assert (=> b!173705 m!202295))

(assert (=> b!173705 m!202297))

(assert (=> bm!17571 d!52749))

(declare-fun b!173706 () Bool)

(declare-fun e!114737 () Bool)

(declare-fun call!17613 () Bool)

(assert (=> b!173706 (= e!114737 call!17613)))

(declare-fun d!52751 () Bool)

(declare-fun res!82478 () Bool)

(declare-fun e!114736 () Bool)

(assert (=> d!52751 (=> res!82478 e!114736)))

(assert (=> d!52751 (= res!82478 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!52751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5439 lt!85729) (mask!8470 lt!85729)) e!114736)))

(declare-fun b!173707 () Bool)

(assert (=> b!173707 (= e!114736 e!114737)))

(declare-fun c!30995 () Bool)

(assert (=> b!173707 (= c!30995 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!173708 () Bool)

(declare-fun e!114738 () Bool)

(assert (=> b!173708 (= e!114738 call!17613)))

(declare-fun bm!17610 () Bool)

(assert (=> bm!17610 (= call!17613 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5439 lt!85729) (mask!8470 lt!85729)))))

(declare-fun b!173709 () Bool)

(assert (=> b!173709 (= e!114737 e!114738)))

(declare-fun lt!86007 () (_ BitVec 64))

(assert (=> b!173709 (= lt!86007 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))

(declare-fun lt!86008 () Unit!5314)

(assert (=> b!173709 (= lt!86008 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5439 lt!85729) lt!86007 #b00000000000000000000000000000000))))

(assert (=> b!173709 (arrayContainsKey!0 (_keys!5439 lt!85729) lt!86007 #b00000000000000000000000000000000)))

(declare-fun lt!86006 () Unit!5314)

(assert (=> b!173709 (= lt!86006 lt!86008)))

(declare-fun res!82477 () Bool)

(assert (=> b!173709 (= res!82477 (= (seekEntryOrOpen!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) (_keys!5439 lt!85729) (mask!8470 lt!85729)) (Found!542 #b00000000000000000000000000000000)))))

(assert (=> b!173709 (=> (not res!82477) (not e!114738))))

(assert (= (and d!52751 (not res!82478)) b!173707))

(assert (= (and b!173707 c!30995) b!173709))

(assert (= (and b!173707 (not c!30995)) b!173706))

(assert (= (and b!173709 res!82477) b!173708))

(assert (= (or b!173708 b!173706) bm!17610))

(assert (=> b!173707 m!202223))

(assert (=> b!173707 m!202223))

(assert (=> b!173707 m!202227))

(declare-fun m!202299 () Bool)

(assert (=> bm!17610 m!202299))

(assert (=> b!173709 m!202223))

(declare-fun m!202301 () Bool)

(assert (=> b!173709 m!202301))

(declare-fun m!202303 () Bool)

(assert (=> b!173709 m!202303))

(assert (=> b!173709 m!202223))

(declare-fun m!202305 () Bool)

(assert (=> b!173709 m!202305))

(assert (=> b!173331 d!52751))

(assert (=> b!173412 d!52659))

(declare-fun d!52753 () Bool)

(assert (=> d!52753 (= (apply!130 lt!85791 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1969 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7171 () Bool)

(assert (= bs!7171 d!52753))

(assert (=> bs!7171 m!202295))

(assert (=> bs!7171 m!202295))

(declare-fun m!202307 () Bool)

(assert (=> bs!7171 m!202307))

(assert (=> b!173378 d!52753))

(declare-fun b!173710 () Bool)

(declare-fun e!114739 () Option!191)

(assert (=> b!173710 (= e!114739 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85817)))))))

(declare-fun b!173713 () Bool)

(declare-fun e!114740 () Option!191)

(assert (=> b!173713 (= e!114740 None!189)))

(declare-fun b!173711 () Bool)

(assert (=> b!173711 (= e!114739 e!114740)))

(declare-fun c!30997 () Bool)

(assert (=> b!173711 (= c!30997 (and ((_ is Cons!2202) (toList!1099 lt!85817)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85817))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173712 () Bool)

(assert (=> b!173712 (= e!114740 (getValueByKey!185 (t!7013 (toList!1099 lt!85817)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52755 () Bool)

(declare-fun c!30996 () Bool)

(assert (=> d!52755 (= c!30996 (and ((_ is Cons!2202) (toList!1099 lt!85817)) (= (_1!1631 (h!2819 (toList!1099 lt!85817))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52755 (= (getValueByKey!185 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114739)))

(assert (= (and d!52755 c!30996) b!173710))

(assert (= (and d!52755 (not c!30996)) b!173711))

(assert (= (and b!173711 c!30997) b!173712))

(assert (= (and b!173711 (not c!30997)) b!173713))

(declare-fun m!202309 () Bool)

(assert (=> b!173712 m!202309))

(assert (=> b!173402 d!52755))

(declare-fun d!52757 () Bool)

(declare-fun e!114741 () Bool)

(assert (=> d!52757 e!114741))

(declare-fun res!82479 () Bool)

(assert (=> d!52757 (=> res!82479 e!114741)))

(declare-fun lt!86009 () Bool)

(assert (=> d!52757 (= res!82479 (not lt!86009))))

(declare-fun lt!86011 () Bool)

(assert (=> d!52757 (= lt!86009 lt!86011)))

(declare-fun lt!86012 () Unit!5314)

(declare-fun e!114742 () Unit!5314)

(assert (=> d!52757 (= lt!86012 e!114742)))

(declare-fun c!30998 () Bool)

(assert (=> d!52757 (= c!30998 lt!86011)))

(assert (=> d!52757 (= lt!86011 (containsKey!189 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52757 (= (contains!1154 lt!85791 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86009)))

(declare-fun b!173714 () Bool)

(declare-fun lt!86010 () Unit!5314)

(assert (=> b!173714 (= e!114742 lt!86010)))

(assert (=> b!173714 (= lt!86010 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173714 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173715 () Bool)

(declare-fun Unit!5330 () Unit!5314)

(assert (=> b!173715 (= e!114742 Unit!5330)))

(declare-fun b!173716 () Bool)

(assert (=> b!173716 (= e!114741 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52757 c!30998) b!173714))

(assert (= (and d!52757 (not c!30998)) b!173715))

(assert (= (and d!52757 (not res!82479)) b!173716))

(declare-fun m!202311 () Bool)

(assert (=> d!52757 m!202311))

(declare-fun m!202313 () Bool)

(assert (=> b!173714 m!202313))

(declare-fun m!202315 () Bool)

(assert (=> b!173714 m!202315))

(assert (=> b!173714 m!202315))

(declare-fun m!202317 () Bool)

(assert (=> b!173714 m!202317))

(assert (=> b!173716 m!202315))

(assert (=> b!173716 m!202315))

(assert (=> b!173716 m!202317))

(assert (=> bm!17574 d!52757))

(declare-fun d!52759 () Bool)

(assert (=> d!52759 (= (apply!130 lt!85791 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1969 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7172 () Bool)

(assert (= bs!7172 d!52759))

(assert (=> bs!7172 m!202315))

(assert (=> bs!7172 m!202315))

(declare-fun m!202319 () Bool)

(assert (=> bs!7172 m!202319))

(assert (=> b!173375 d!52759))

(declare-fun b!173718 () Bool)

(declare-fun res!82481 () Bool)

(declare-fun e!114743 () Bool)

(assert (=> b!173718 (=> (not res!82481) (not e!114743))))

(assert (=> b!173718 (= res!82481 (bvsge (size!3770 lt!85729) (_size!1201 lt!85729)))))

(declare-fun d!52761 () Bool)

(declare-fun res!82483 () Bool)

(assert (=> d!52761 (=> (not res!82483) (not e!114743))))

(assert (=> d!52761 (= res!82483 (validMask!0 (mask!8470 lt!85729)))))

(assert (=> d!52761 (= (simpleValid!144 lt!85729) e!114743)))

(declare-fun b!173720 () Bool)

(assert (=> b!173720 (= e!114743 (and (bvsge (extraKeys!3337 lt!85729) #b00000000000000000000000000000000) (bvsle (extraKeys!3337 lt!85729) #b00000000000000000000000000000011) (bvsge (_vacant!1201 lt!85729) #b00000000000000000000000000000000)))))

(declare-fun b!173717 () Bool)

(declare-fun res!82480 () Bool)

(assert (=> b!173717 (=> (not res!82480) (not e!114743))))

(assert (=> b!173717 (= res!82480 (and (= (size!3767 (_values!3581 lt!85729)) (bvadd (mask!8470 lt!85729) #b00000000000000000000000000000001)) (= (size!3766 (_keys!5439 lt!85729)) (size!3767 (_values!3581 lt!85729))) (bvsge (_size!1201 lt!85729) #b00000000000000000000000000000000) (bvsle (_size!1201 lt!85729) (bvadd (mask!8470 lt!85729) #b00000000000000000000000000000001))))))

(declare-fun b!173719 () Bool)

(declare-fun res!82482 () Bool)

(assert (=> b!173719 (=> (not res!82482) (not e!114743))))

(assert (=> b!173719 (= res!82482 (= (size!3770 lt!85729) (bvadd (_size!1201 lt!85729) (bvsdiv (bvadd (extraKeys!3337 lt!85729) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!52761 res!82483) b!173717))

(assert (= (and b!173717 res!82480) b!173718))

(assert (= (and b!173718 res!82481) b!173719))

(assert (= (and b!173719 res!82482) b!173720))

(declare-fun m!202321 () Bool)

(assert (=> b!173718 m!202321))

(declare-fun m!202323 () Bool)

(assert (=> d!52761 m!202323))

(assert (=> b!173719 m!202321))

(assert (=> d!52591 d!52761))

(assert (=> bm!17575 d!52635))

(declare-fun bm!17611 () Bool)

(declare-fun call!17616 () ListLongMap!2167)

(declare-fun call!17617 () ListLongMap!2167)

(assert (=> bm!17611 (= call!17616 call!17617)))

(declare-fun b!173721 () Bool)

(declare-fun e!114746 () Bool)

(declare-fun lt!86018 () ListLongMap!2167)

(assert (=> b!173721 (= e!114746 (= (apply!130 lt!86018 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3441 lt!85729)))))

(declare-fun b!173722 () Bool)

(declare-fun res!82489 () Bool)

(declare-fun e!114755 () Bool)

(assert (=> b!173722 (=> (not res!82489) (not e!114755))))

(declare-fun e!114745 () Bool)

(assert (=> b!173722 (= res!82489 e!114745)))

(declare-fun c!31001 () Bool)

(assert (=> b!173722 (= c!31001 (not (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173723 () Bool)

(declare-fun c!31003 () Bool)

(assert (=> b!173723 (= c!31003 (and (not (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!114750 () ListLongMap!2167)

(declare-fun e!114751 () ListLongMap!2167)

(assert (=> b!173723 (= e!114750 e!114751)))

(declare-fun b!173724 () Bool)

(declare-fun e!114749 () Bool)

(assert (=> b!173724 (= e!114749 (= (apply!130 lt!86018 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3439 lt!85729)))))

(declare-fun b!173725 () Bool)

(declare-fun e!114752 () ListLongMap!2167)

(assert (=> b!173725 (= e!114752 e!114750)))

(declare-fun c!31002 () Bool)

(assert (=> b!173725 (= c!31002 (and (not (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!30999 () Bool)

(declare-fun bm!17612 () Bool)

(declare-fun call!17620 () ListLongMap!2167)

(declare-fun call!17618 () ListLongMap!2167)

(assert (=> bm!17612 (= call!17618 (+!246 (ite c!30999 call!17617 (ite c!31002 call!17616 call!17620)) (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))))))

(declare-fun bm!17613 () Bool)

(declare-fun call!17619 () Bool)

(assert (=> bm!17613 (= call!17619 (contains!1154 lt!86018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173726 () Bool)

(declare-fun e!114756 () Bool)

(assert (=> b!173726 (= e!114756 e!114746)))

(declare-fun res!82492 () Bool)

(declare-fun call!17614 () Bool)

(assert (=> b!173726 (= res!82492 call!17614)))

(assert (=> b!173726 (=> (not res!82492) (not e!114746))))

(declare-fun b!173727 () Bool)

(declare-fun res!82486 () Bool)

(assert (=> b!173727 (=> (not res!82486) (not e!114755))))

(declare-fun e!114754 () Bool)

(assert (=> b!173727 (= res!82486 e!114754)))

(declare-fun res!82485 () Bool)

(assert (=> b!173727 (=> res!82485 e!114754)))

(declare-fun e!114744 () Bool)

(assert (=> b!173727 (= res!82485 (not e!114744))))

(declare-fun res!82490 () Bool)

(assert (=> b!173727 (=> (not res!82490) (not e!114744))))

(assert (=> b!173727 (= res!82490 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(declare-fun b!173728 () Bool)

(assert (=> b!173728 (= e!114745 (not call!17619))))

(declare-fun b!173729 () Bool)

(declare-fun e!114748 () Bool)

(assert (=> b!173729 (= e!114748 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!173730 () Bool)

(assert (=> b!173730 (= e!114745 e!114749)))

(declare-fun res!82487 () Bool)

(assert (=> b!173730 (= res!82487 call!17619)))

(assert (=> b!173730 (=> (not res!82487) (not e!114749))))

(declare-fun bm!17614 () Bool)

(assert (=> bm!17614 (= call!17620 call!17616)))

(declare-fun d!52763 () Bool)

(assert (=> d!52763 e!114755))

(declare-fun res!82488 () Bool)

(assert (=> d!52763 (=> (not res!82488) (not e!114755))))

(assert (=> d!52763 (= res!82488 (or (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))))

(declare-fun lt!86032 () ListLongMap!2167)

(assert (=> d!52763 (= lt!86018 lt!86032)))

(declare-fun lt!86024 () Unit!5314)

(declare-fun e!114753 () Unit!5314)

(assert (=> d!52763 (= lt!86024 e!114753)))

(declare-fun c!31000 () Bool)

(assert (=> d!52763 (= c!31000 e!114748)))

(declare-fun res!82491 () Bool)

(assert (=> d!52763 (=> (not res!82491) (not e!114748))))

(assert (=> d!52763 (= res!82491 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!52763 (= lt!86032 e!114752)))

(assert (=> d!52763 (= c!30999 (and (not (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52763 (validMask!0 (mask!8470 lt!85729))))

(assert (=> d!52763 (= (getCurrentListMap!751 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)) lt!86018)))

(declare-fun bm!17615 () Bool)

(declare-fun call!17615 () ListLongMap!2167)

(assert (=> bm!17615 (= call!17615 call!17618)))

(declare-fun b!173731 () Bool)

(assert (=> b!173731 (= e!114750 call!17615)))

(declare-fun b!173732 () Bool)

(assert (=> b!173732 (= e!114751 call!17615)))

(declare-fun b!173733 () Bool)

(declare-fun e!114747 () Bool)

(assert (=> b!173733 (= e!114754 e!114747)))

(declare-fun res!82484 () Bool)

(assert (=> b!173733 (=> (not res!82484) (not e!114747))))

(assert (=> b!173733 (= res!82484 (contains!1154 lt!86018 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (=> b!173733 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(declare-fun b!173734 () Bool)

(assert (=> b!173734 (= e!114756 (not call!17614))))

(declare-fun b!173735 () Bool)

(assert (=> b!173735 (= e!114755 e!114756)))

(declare-fun c!31004 () Bool)

(assert (=> b!173735 (= c!31004 (not (= (bvand (extraKeys!3337 lt!85729) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173736 () Bool)

(declare-fun lt!86034 () Unit!5314)

(assert (=> b!173736 (= e!114753 lt!86034)))

(declare-fun lt!86016 () ListLongMap!2167)

(assert (=> b!173736 (= lt!86016 (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)))))

(declare-fun lt!86014 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86014 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86015 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86015 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))

(declare-fun lt!86017 () Unit!5314)

(assert (=> b!173736 (= lt!86017 (addStillContains!106 lt!86016 lt!86014 (zeroValue!3439 lt!85729) lt!86015))))

(assert (=> b!173736 (contains!1154 (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))) lt!86015)))

(declare-fun lt!86025 () Unit!5314)

(assert (=> b!173736 (= lt!86025 lt!86017)))

(declare-fun lt!86027 () ListLongMap!2167)

(assert (=> b!173736 (= lt!86027 (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)))))

(declare-fun lt!86031 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86031 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86021 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86021 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))

(declare-fun lt!86030 () Unit!5314)

(assert (=> b!173736 (= lt!86030 (addApplyDifferent!106 lt!86027 lt!86031 (minValue!3441 lt!85729) lt!86021))))

(assert (=> b!173736 (= (apply!130 (+!246 lt!86027 (tuple2!3241 lt!86031 (minValue!3441 lt!85729))) lt!86021) (apply!130 lt!86027 lt!86021))))

(declare-fun lt!86020 () Unit!5314)

(assert (=> b!173736 (= lt!86020 lt!86030)))

(declare-fun lt!86033 () ListLongMap!2167)

(assert (=> b!173736 (= lt!86033 (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)))))

(declare-fun lt!86026 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86026 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86022 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86022 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))

(declare-fun lt!86013 () Unit!5314)

(assert (=> b!173736 (= lt!86013 (addApplyDifferent!106 lt!86033 lt!86026 (zeroValue!3439 lt!85729) lt!86022))))

(assert (=> b!173736 (= (apply!130 (+!246 lt!86033 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))) lt!86022) (apply!130 lt!86033 lt!86022))))

(declare-fun lt!86028 () Unit!5314)

(assert (=> b!173736 (= lt!86028 lt!86013)))

(declare-fun lt!86019 () ListLongMap!2167)

(assert (=> b!173736 (= lt!86019 (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)))))

(declare-fun lt!86029 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86029 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86023 () (_ BitVec 64))

(assert (=> b!173736 (= lt!86023 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))

(assert (=> b!173736 (= lt!86034 (addApplyDifferent!106 lt!86019 lt!86029 (minValue!3441 lt!85729) lt!86023))))

(assert (=> b!173736 (= (apply!130 (+!246 lt!86019 (tuple2!3241 lt!86029 (minValue!3441 lt!85729))) lt!86023) (apply!130 lt!86019 lt!86023))))

(declare-fun b!173737 () Bool)

(assert (=> b!173737 (= e!114744 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun bm!17616 () Bool)

(assert (=> bm!17616 (= call!17614 (contains!1154 lt!86018 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17617 () Bool)

(assert (=> bm!17617 (= call!17617 (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)))))

(declare-fun b!173738 () Bool)

(assert (=> b!173738 (= e!114752 (+!246 call!17618 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))))

(declare-fun b!173739 () Bool)

(assert (=> b!173739 (= e!114751 call!17620)))

(declare-fun b!173740 () Bool)

(declare-fun Unit!5331 () Unit!5314)

(assert (=> b!173740 (= e!114753 Unit!5331)))

(declare-fun b!173741 () Bool)

(assert (=> b!173741 (= e!114747 (= (apply!130 lt!86018 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)) (get!1968 (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 lt!85729) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_values!3581 lt!85729))))))

(assert (=> b!173741 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(assert (= (and d!52763 c!30999) b!173738))

(assert (= (and d!52763 (not c!30999)) b!173725))

(assert (= (and b!173725 c!31002) b!173731))

(assert (= (and b!173725 (not c!31002)) b!173723))

(assert (= (and b!173723 c!31003) b!173732))

(assert (= (and b!173723 (not c!31003)) b!173739))

(assert (= (or b!173732 b!173739) bm!17614))

(assert (= (or b!173731 bm!17614) bm!17611))

(assert (= (or b!173731 b!173732) bm!17615))

(assert (= (or b!173738 bm!17611) bm!17617))

(assert (= (or b!173738 bm!17615) bm!17612))

(assert (= (and d!52763 res!82491) b!173729))

(assert (= (and d!52763 c!31000) b!173736))

(assert (= (and d!52763 (not c!31000)) b!173740))

(assert (= (and d!52763 res!82488) b!173727))

(assert (= (and b!173727 res!82490) b!173737))

(assert (= (and b!173727 (not res!82485)) b!173733))

(assert (= (and b!173733 res!82484) b!173741))

(assert (= (and b!173727 res!82486) b!173722))

(assert (= (and b!173722 c!31001) b!173730))

(assert (= (and b!173722 (not c!31001)) b!173728))

(assert (= (and b!173730 res!82487) b!173724))

(assert (= (or b!173730 b!173728) bm!17613))

(assert (= (and b!173722 res!82489) b!173735))

(assert (= (and b!173735 c!31004) b!173726))

(assert (= (and b!173735 (not c!31004)) b!173734))

(assert (= (and b!173726 res!82492) b!173721))

(assert (= (or b!173726 b!173734) bm!17616))

(declare-fun b_lambda!6951 () Bool)

(assert (=> (not b_lambda!6951) (not b!173741)))

(declare-fun tb!2771 () Bool)

(declare-fun t!7019 () Bool)

(assert (=> (and b!173294 (= (defaultEntry!3598 thiss!1248) (defaultEntry!3598 lt!85729)) t!7019) tb!2771))

(declare-fun result!4591 () Bool)

(assert (=> tb!2771 (= result!4591 tp_is_empty!4083)))

(assert (=> b!173741 t!7019))

(declare-fun b_and!10767 () Bool)

(assert (= b_and!10765 (and (=> t!7019 result!4591) b_and!10767)))

(declare-fun m!202325 () Bool)

(assert (=> bm!17617 m!202325))

(declare-fun m!202327 () Bool)

(assert (=> bm!17616 m!202327))

(declare-fun m!202329 () Bool)

(assert (=> bm!17612 m!202329))

(assert (=> b!173737 m!202223))

(assert (=> b!173737 m!202223))

(assert (=> b!173737 m!202227))

(assert (=> b!173733 m!202223))

(assert (=> b!173733 m!202223))

(declare-fun m!202331 () Bool)

(assert (=> b!173733 m!202331))

(declare-fun m!202333 () Bool)

(assert (=> bm!17613 m!202333))

(assert (=> b!173729 m!202223))

(assert (=> b!173729 m!202223))

(assert (=> b!173729 m!202227))

(declare-fun m!202335 () Bool)

(assert (=> b!173741 m!202335))

(declare-fun m!202337 () Bool)

(assert (=> b!173741 m!202337))

(declare-fun m!202339 () Bool)

(assert (=> b!173741 m!202339))

(assert (=> b!173741 m!202335))

(assert (=> b!173741 m!202223))

(assert (=> b!173741 m!202223))

(declare-fun m!202341 () Bool)

(assert (=> b!173741 m!202341))

(assert (=> b!173741 m!202337))

(declare-fun m!202343 () Bool)

(assert (=> b!173721 m!202343))

(declare-fun m!202345 () Bool)

(assert (=> b!173736 m!202345))

(declare-fun m!202347 () Bool)

(assert (=> b!173736 m!202347))

(declare-fun m!202349 () Bool)

(assert (=> b!173736 m!202349))

(declare-fun m!202351 () Bool)

(assert (=> b!173736 m!202351))

(declare-fun m!202353 () Bool)

(assert (=> b!173736 m!202353))

(declare-fun m!202355 () Bool)

(assert (=> b!173736 m!202355))

(declare-fun m!202357 () Bool)

(assert (=> b!173736 m!202357))

(assert (=> b!173736 m!202325))

(declare-fun m!202359 () Bool)

(assert (=> b!173736 m!202359))

(assert (=> b!173736 m!202349))

(assert (=> b!173736 m!202357))

(declare-fun m!202361 () Bool)

(assert (=> b!173736 m!202361))

(declare-fun m!202363 () Bool)

(assert (=> b!173736 m!202363))

(declare-fun m!202365 () Bool)

(assert (=> b!173736 m!202365))

(assert (=> b!173736 m!202353))

(declare-fun m!202367 () Bool)

(assert (=> b!173736 m!202367))

(declare-fun m!202369 () Bool)

(assert (=> b!173736 m!202369))

(assert (=> b!173736 m!202223))

(declare-fun m!202371 () Bool)

(assert (=> b!173736 m!202371))

(assert (=> b!173736 m!202363))

(declare-fun m!202373 () Bool)

(assert (=> b!173736 m!202373))

(declare-fun m!202375 () Bool)

(assert (=> b!173724 m!202375))

(assert (=> d!52763 m!202323))

(declare-fun m!202377 () Bool)

(assert (=> b!173738 m!202377))

(assert (=> d!52607 d!52763))

(declare-fun d!52765 () Bool)

(declare-fun e!114757 () Bool)

(assert (=> d!52765 e!114757))

(declare-fun res!82493 () Bool)

(assert (=> d!52765 (=> (not res!82493) (not e!114757))))

(declare-fun lt!86036 () ListLongMap!2167)

(assert (=> d!52765 (= res!82493 (contains!1154 lt!86036 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun lt!86037 () List!2206)

(assert (=> d!52765 (= lt!86036 (ListLongMap!2168 lt!86037))))

(declare-fun lt!86038 () Unit!5314)

(declare-fun lt!86035 () Unit!5314)

(assert (=> d!52765 (= lt!86038 lt!86035)))

(assert (=> d!52765 (= (getValueByKey!185 lt!86037 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(assert (=> d!52765 (= lt!86035 (lemmaContainsTupThenGetReturnValue!98 lt!86037 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(assert (=> d!52765 (= lt!86037 (insertStrictlySorted!101 (toList!1099 call!17576) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(assert (=> d!52765 (= (+!246 call!17576 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) lt!86036)))

(declare-fun b!173742 () Bool)

(declare-fun res!82494 () Bool)

(assert (=> b!173742 (=> (not res!82494) (not e!114757))))

(assert (=> b!173742 (= res!82494 (= (getValueByKey!185 (toList!1099 lt!86036) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun b!173743 () Bool)

(assert (=> b!173743 (= e!114757 (contains!1155 (toList!1099 lt!86036) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))

(assert (= (and d!52765 res!82493) b!173742))

(assert (= (and b!173742 res!82494) b!173743))

(declare-fun m!202379 () Bool)

(assert (=> d!52765 m!202379))

(declare-fun m!202381 () Bool)

(assert (=> d!52765 m!202381))

(declare-fun m!202383 () Bool)

(assert (=> d!52765 m!202383))

(declare-fun m!202385 () Bool)

(assert (=> d!52765 m!202385))

(declare-fun m!202387 () Bool)

(assert (=> b!173742 m!202387))

(declare-fun m!202389 () Bool)

(assert (=> b!173743 m!202389))

(assert (=> b!173392 d!52765))

(declare-fun mapIsEmpty!6958 () Bool)

(declare-fun mapRes!6958 () Bool)

(assert (=> mapIsEmpty!6958 mapRes!6958))

(declare-fun mapNonEmpty!6958 () Bool)

(declare-fun tp!15607 () Bool)

(declare-fun e!114758 () Bool)

(assert (=> mapNonEmpty!6958 (= mapRes!6958 (and tp!15607 e!114758))))

(declare-fun mapValue!6958 () ValueCell!1698)

(declare-fun mapRest!6958 () (Array (_ BitVec 32) ValueCell!1698))

(declare-fun mapKey!6958 () (_ BitVec 32))

(assert (=> mapNonEmpty!6958 (= mapRest!6957 (store mapRest!6958 mapKey!6958 mapValue!6958))))

(declare-fun b!173745 () Bool)

(declare-fun e!114759 () Bool)

(assert (=> b!173745 (= e!114759 tp_is_empty!4083)))

(declare-fun b!173744 () Bool)

(assert (=> b!173744 (= e!114758 tp_is_empty!4083)))

(declare-fun condMapEmpty!6958 () Bool)

(declare-fun mapDefault!6958 () ValueCell!1698)

(assert (=> mapNonEmpty!6957 (= condMapEmpty!6958 (= mapRest!6957 ((as const (Array (_ BitVec 32) ValueCell!1698)) mapDefault!6958)))))

(assert (=> mapNonEmpty!6957 (= tp!15606 (and e!114759 mapRes!6958))))

(assert (= (and mapNonEmpty!6957 condMapEmpty!6958) mapIsEmpty!6958))

(assert (= (and mapNonEmpty!6957 (not condMapEmpty!6958)) mapNonEmpty!6958))

(assert (= (and mapNonEmpty!6958 ((_ is ValueCellFull!1698) mapValue!6958)) b!173744))

(assert (= (and mapNonEmpty!6957 ((_ is ValueCellFull!1698) mapDefault!6958)) b!173745))

(declare-fun m!202391 () Bool)

(assert (=> mapNonEmpty!6958 m!202391))

(declare-fun b_lambda!6953 () Bool)

(assert (= b_lambda!6945 (or (and b!173294 b_free!4311) b_lambda!6953)))

(declare-fun b_lambda!6955 () Bool)

(assert (= b_lambda!6943 (or (and b!173294 b_free!4311) b_lambda!6955)))

(declare-fun b_lambda!6957 () Bool)

(assert (= b_lambda!6949 (or (and b!173294 b_free!4311) b_lambda!6957)))

(declare-fun b_lambda!6959 () Bool)

(assert (= b_lambda!6947 (or (and b!173294 b_free!4311) b_lambda!6959)))

(check-sat (not bm!17613) (not d!52641) (not d!52717) (not d!52655) (not d!52685) (not b!173672) (not d!52691) (not b!173707) (not b!173663) (not b!173596) (not bm!17595) (not b_lambda!6951) (not b!173508) (not b!173718) (not b!173645) (not b!173463) (not b!173521) (not b!173738) (not d!52697) (not b!173595) (not b!173643) (not d!52761) (not d!52707) (not b_lambda!6941) (not d!52727) (not b!173624) (not b!173620) (not d!52657) (not d!52743) (not d!52709) (not d!52651) (not d!52643) (not d!52741) (not d!52737) (not bm!17612) (not b!173526) (not b!173666) (not b!173737) (not d!52683) (not b!173545) (not b!173523) (not b!173599) (not d!52629) (not b!173623) (not b!173517) (not d!52661) (not b!173661) (not b!173616) (not d!52663) (not bm!17598) (not b!173719) (not b!173609) (not b_lambda!6957) (not d!52759) (not d!52635) (not d!52639) (not b!173514) (not b!173618) (not b!173539) (not b!173664) (not b!173619) (not b!173518) (not b!173671) (not d!52721) (not b!173505) (not d!52649) (not b!173497) (not b!173699) (not d!52631) (not bm!17585) (not d!52705) (not d!52715) (not d!52623) (not b!173502) b_and!10767 (not bm!17603) (not b!173681) (not d!52713) (not b!173611) (not b!173669) (not mapNonEmpty!6958) (not d!52671) (not b!173598) (not d!52669) (not bm!17617) (not b!173592) (not b!173460) (not b!173506) (not b!173583) (not d!52627) (not d!52637) (not b!173714) (not d!52729) (not bm!17602) (not d!52653) (not d!52703) (not b!173587) (not b!173576) (not b!173568) (not b!173575) (not b!173691) (not b!173698) (not d!52645) (not bm!17616) (not d!52687) (not b!173696) (not d!52763) (not bm!17609) (not d!52615) (not d!52757) (not b!173461) (not d!52693) (not bm!17608) (not b!173522) (not b_next!4311) (not b!173464) (not b!173503) (not b!173462) (not b!173640) (not d!52625) (not d!52665) (not b!173589) (not bm!17610) (not bm!17592) (not b!173658) (not b_lambda!6959) (not d!52695) (not b!173500) (not b!173449) (not d!52673) (not b!173733) (not b!173512) (not b!173510) (not b!173705) (not b!173499) (not b!173674) (not b_lambda!6953) (not d!52719) (not d!52753) (not bm!17601) (not b!173625) (not b!173614) (not d!52701) (not d!52711) (not b!173516) (not b!173703) tp_is_empty!4083 (not d!52699) (not b!173590) (not d!52749) (not b!173585) (not d!52647) (not b!173593) (not b!173515) (not b!173736) (not b!173716) (not d!52731) (not b!173528) (not b!173721) (not b_lambda!6955) (not d!52765) (not b!173659) (not b!173520) (not d!52633) (not b!173712) (not b!173615) (not d!52745) (not d!52679) (not b!173546) (not d!52617) (not b!173465) (not b!173648) (not b!173743) (not b!173682) (not b!173742) (not d!52735) (not b!173496) (not b!173709) (not b!173729) (not b_lambda!6939) (not b!173621) (not b!173639) (not b!173525) (not b!173697) (not b!173627) (not d!52675) (not b!173724) (not b!173644) (not b!173455) (not b!173741) (not b!173513) (not b!173579))
(check-sat b_and!10767 (not b_next!4311))
(get-model)

(declare-fun d!52767 () Bool)

(assert (=> d!52767 (= (apply!130 lt!85942 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1969 (getValueByKey!185 (toList!1099 lt!85942) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7173 () Bool)

(assert (= bs!7173 d!52767))

(assert (=> bs!7173 m!201737))

(declare-fun m!202393 () Bool)

(assert (=> bs!7173 m!202393))

(assert (=> bs!7173 m!202393))

(declare-fun m!202395 () Bool)

(assert (=> bs!7173 m!202395))

(assert (=> b!173593 d!52767))

(assert (=> b!173593 d!52619))

(assert (=> b!173643 d!52659))

(declare-fun d!52769 () Bool)

(declare-fun e!114760 () Bool)

(assert (=> d!52769 e!114760))

(declare-fun res!82495 () Bool)

(assert (=> d!52769 (=> res!82495 e!114760)))

(declare-fun lt!86039 () Bool)

(assert (=> d!52769 (= res!82495 (not lt!86039))))

(declare-fun lt!86041 () Bool)

(assert (=> d!52769 (= lt!86039 lt!86041)))

(declare-fun lt!86042 () Unit!5314)

(declare-fun e!114761 () Unit!5314)

(assert (=> d!52769 (= lt!86042 e!114761)))

(declare-fun c!31005 () Bool)

(assert (=> d!52769 (= c!31005 lt!86041)))

(assert (=> d!52769 (= lt!86041 (containsKey!189 (toList!1099 lt!85998) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> d!52769 (= (contains!1154 lt!85998 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) lt!86039)))

(declare-fun b!173746 () Bool)

(declare-fun lt!86040 () Unit!5314)

(assert (=> b!173746 (= e!114761 lt!86040)))

(assert (=> b!173746 (= lt!86040 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85998) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> b!173746 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85998) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun b!173747 () Bool)

(declare-fun Unit!5332 () Unit!5314)

(assert (=> b!173747 (= e!114761 Unit!5332)))

(declare-fun b!173748 () Bool)

(assert (=> b!173748 (= e!114760 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85998) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(assert (= (and d!52769 c!31005) b!173746))

(assert (= (and d!52769 (not c!31005)) b!173747))

(assert (= (and d!52769 (not res!82495)) b!173748))

(declare-fun m!202397 () Bool)

(assert (=> d!52769 m!202397))

(declare-fun m!202399 () Bool)

(assert (=> b!173746 m!202399))

(assert (=> b!173746 m!202285))

(assert (=> b!173746 m!202285))

(declare-fun m!202401 () Bool)

(assert (=> b!173746 m!202401))

(assert (=> b!173748 m!202285))

(assert (=> b!173748 m!202285))

(assert (=> b!173748 m!202401))

(assert (=> d!52745 d!52769))

(declare-fun b!173749 () Bool)

(declare-fun e!114762 () Option!191)

(assert (=> b!173749 (= e!114762 (Some!190 (_2!1631 (h!2819 lt!85999))))))

(declare-fun b!173752 () Bool)

(declare-fun e!114763 () Option!191)

(assert (=> b!173752 (= e!114763 None!189)))

(declare-fun b!173750 () Bool)

(assert (=> b!173750 (= e!114762 e!114763)))

(declare-fun c!31007 () Bool)

(assert (=> b!173750 (= c!31007 (and ((_ is Cons!2202) lt!85999) (not (= (_1!1631 (h!2819 lt!85999)) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))))

(declare-fun b!173751 () Bool)

(assert (=> b!173751 (= e!114763 (getValueByKey!185 (t!7013 lt!85999) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun d!52771 () Bool)

(declare-fun c!31006 () Bool)

(assert (=> d!52771 (= c!31006 (and ((_ is Cons!2202) lt!85999) (= (_1!1631 (h!2819 lt!85999)) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(assert (=> d!52771 (= (getValueByKey!185 lt!85999 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) e!114762)))

(assert (= (and d!52771 c!31006) b!173749))

(assert (= (and d!52771 (not c!31006)) b!173750))

(assert (= (and b!173750 c!31007) b!173751))

(assert (= (and b!173750 (not c!31007)) b!173752))

(declare-fun m!202403 () Bool)

(assert (=> b!173751 m!202403))

(assert (=> d!52745 d!52771))

(declare-fun d!52773 () Bool)

(assert (=> d!52773 (= (getValueByKey!185 lt!85999 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) (Some!190 (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun lt!86043 () Unit!5314)

(assert (=> d!52773 (= lt!86043 (choose!931 lt!85999 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun e!114764 () Bool)

(assert (=> d!52773 e!114764))

(declare-fun res!82496 () Bool)

(assert (=> d!52773 (=> (not res!82496) (not e!114764))))

(assert (=> d!52773 (= res!82496 (isStrictlySorted!332 lt!85999))))

(assert (=> d!52773 (= (lemmaContainsTupThenGetReturnValue!98 lt!85999 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) lt!86043)))

(declare-fun b!173753 () Bool)

(declare-fun res!82497 () Bool)

(assert (=> b!173753 (=> (not res!82497) (not e!114764))))

(assert (=> b!173753 (= res!82497 (containsKey!189 lt!85999 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun b!173754 () Bool)

(assert (=> b!173754 (= e!114764 (contains!1155 lt!85999 (tuple2!3241 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(assert (= (and d!52773 res!82496) b!173753))

(assert (= (and b!173753 res!82497) b!173754))

(assert (=> d!52773 m!202279))

(declare-fun m!202405 () Bool)

(assert (=> d!52773 m!202405))

(declare-fun m!202407 () Bool)

(assert (=> d!52773 m!202407))

(declare-fun m!202409 () Bool)

(assert (=> b!173753 m!202409))

(declare-fun m!202411 () Bool)

(assert (=> b!173754 m!202411))

(assert (=> d!52745 d!52773))

(declare-fun bm!17619 () Bool)

(declare-fun call!17623 () List!2206)

(declare-fun call!17621 () List!2206)

(assert (=> bm!17619 (= call!17623 call!17621)))

(declare-fun c!31009 () Bool)

(declare-fun c!31011 () Bool)

(declare-fun e!114768 () List!2206)

(declare-fun b!173755 () Bool)

(assert (=> b!173755 (= e!114768 (ite c!31009 (t!7013 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)))) (ite c!31011 (Cons!2202 (h!2819 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)))) (t!7013 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578))))) Nil!2203)))))

(declare-fun b!173756 () Bool)

(declare-fun res!82498 () Bool)

(declare-fun e!114769 () Bool)

(assert (=> b!173756 (=> (not res!82498) (not e!114769))))

(declare-fun lt!86044 () List!2206)

(assert (=> b!173756 (= res!82498 (containsKey!189 lt!86044 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun b!173757 () Bool)

(declare-fun e!114766 () List!2206)

(assert (=> b!173757 (= e!114766 call!17621)))

(declare-fun b!173758 () Bool)

(assert (=> b!173758 (= c!31011 (and ((_ is Cons!2202) (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)))) (bvsgt (_1!1631 (h!2819 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578))))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(declare-fun e!114767 () List!2206)

(declare-fun e!114765 () List!2206)

(assert (=> b!173758 (= e!114767 e!114765)))

(declare-fun b!173759 () Bool)

(declare-fun call!17622 () List!2206)

(assert (=> b!173759 (= e!114765 call!17622)))

(declare-fun b!173760 () Bool)

(assert (=> b!173760 (= e!114765 call!17622)))

(declare-fun b!173761 () Bool)

(assert (=> b!173761 (= e!114766 e!114767)))

(assert (=> b!173761 (= c!31009 (and ((_ is Cons!2202) (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)))) (= (_1!1631 (h!2819 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578))))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(declare-fun bm!17618 () Bool)

(declare-fun c!31008 () Bool)

(assert (=> bm!17618 (= call!17621 ($colon$colon!98 e!114768 (ite c!31008 (h!2819 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)))) (tuple2!3241 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))))

(declare-fun c!31010 () Bool)

(assert (=> bm!17618 (= c!31010 c!31008)))

(declare-fun d!52775 () Bool)

(assert (=> d!52775 e!114769))

(declare-fun res!82499 () Bool)

(assert (=> d!52775 (=> (not res!82499) (not e!114769))))

(assert (=> d!52775 (= res!82499 (isStrictlySorted!332 lt!86044))))

(assert (=> d!52775 (= lt!86044 e!114766)))

(assert (=> d!52775 (= c!31008 (and ((_ is Cons!2202) (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)))) (bvslt (_1!1631 (h!2819 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578))))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(assert (=> d!52775 (isStrictlySorted!332 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578))))))

(assert (=> d!52775 (= (insertStrictlySorted!101 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) lt!86044)))

(declare-fun bm!17620 () Bool)

(assert (=> bm!17620 (= call!17622 call!17623)))

(declare-fun b!173762 () Bool)

(assert (=> b!173762 (= e!114767 call!17623)))

(declare-fun b!173763 () Bool)

(assert (=> b!173763 (= e!114768 (insertStrictlySorted!101 (t!7013 (toList!1099 (ite c!30909 call!17575 (ite c!30912 call!17574 call!17578)))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun b!173764 () Bool)

(assert (=> b!173764 (= e!114769 (contains!1155 lt!86044 (tuple2!3241 (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (_2!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(assert (= (and d!52775 c!31008) b!173757))

(assert (= (and d!52775 (not c!31008)) b!173761))

(assert (= (and b!173761 c!31009) b!173762))

(assert (= (and b!173761 (not c!31009)) b!173758))

(assert (= (and b!173758 c!31011) b!173759))

(assert (= (and b!173758 (not c!31011)) b!173760))

(assert (= (or b!173759 b!173760) bm!17620))

(assert (= (or b!173762 bm!17620) bm!17619))

(assert (= (or b!173757 bm!17619) bm!17618))

(assert (= (and bm!17618 c!31010) b!173763))

(assert (= (and bm!17618 (not c!31010)) b!173755))

(assert (= (and d!52775 res!82499) b!173756))

(assert (= (and b!173756 res!82498) b!173764))

(declare-fun m!202413 () Bool)

(assert (=> b!173764 m!202413))

(declare-fun m!202415 () Bool)

(assert (=> bm!17618 m!202415))

(declare-fun m!202417 () Bool)

(assert (=> b!173763 m!202417))

(declare-fun m!202419 () Bool)

(assert (=> b!173756 m!202419))

(declare-fun m!202421 () Bool)

(assert (=> d!52775 m!202421))

(declare-fun m!202423 () Bool)

(assert (=> d!52775 m!202423))

(assert (=> d!52745 d!52775))

(declare-fun d!52777 () Bool)

(assert (=> d!52777 (= (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173648 d!52777))

(declare-fun d!52779 () Bool)

(assert (=> d!52779 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85800) lt!85794)) (v!3956 (getValueByKey!185 (toList!1099 lt!85800) lt!85794)))))

(assert (=> d!52629 d!52779))

(declare-fun b!173765 () Bool)

(declare-fun e!114770 () Option!191)

(assert (=> b!173765 (= e!114770 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85800)))))))

(declare-fun b!173768 () Bool)

(declare-fun e!114771 () Option!191)

(assert (=> b!173768 (= e!114771 None!189)))

(declare-fun b!173766 () Bool)

(assert (=> b!173766 (= e!114770 e!114771)))

(declare-fun c!31013 () Bool)

(assert (=> b!173766 (= c!31013 (and ((_ is Cons!2202) (toList!1099 lt!85800)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85800))) lt!85794))))))

(declare-fun b!173767 () Bool)

(assert (=> b!173767 (= e!114771 (getValueByKey!185 (t!7013 (toList!1099 lt!85800)) lt!85794))))

(declare-fun d!52781 () Bool)

(declare-fun c!31012 () Bool)

(assert (=> d!52781 (= c!31012 (and ((_ is Cons!2202) (toList!1099 lt!85800)) (= (_1!1631 (h!2819 (toList!1099 lt!85800))) lt!85794)))))

(assert (=> d!52781 (= (getValueByKey!185 (toList!1099 lt!85800) lt!85794) e!114770)))

(assert (= (and d!52781 c!31012) b!173765))

(assert (= (and d!52781 (not c!31012)) b!173766))

(assert (= (and b!173766 c!31013) b!173767))

(assert (= (and b!173766 (not c!31013)) b!173768))

(declare-fun m!202425 () Bool)

(assert (=> b!173767 m!202425))

(assert (=> d!52629 d!52781))

(assert (=> d!52675 d!52597))

(assert (=> d!52675 d!52595))

(assert (=> d!52675 d!52599))

(declare-fun d!52783 () Bool)

(declare-fun lt!86045 () Bool)

(assert (=> d!52783 (= lt!86045 (select (content!149 (toList!1099 lt!86036)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))

(declare-fun e!114773 () Bool)

(assert (=> d!52783 (= lt!86045 e!114773)))

(declare-fun res!82501 () Bool)

(assert (=> d!52783 (=> (not res!82501) (not e!114773))))

(assert (=> d!52783 (= res!82501 ((_ is Cons!2202) (toList!1099 lt!86036)))))

(assert (=> d!52783 (= (contains!1155 (toList!1099 lt!86036) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) lt!86045)))

(declare-fun b!173769 () Bool)

(declare-fun e!114772 () Bool)

(assert (=> b!173769 (= e!114773 e!114772)))

(declare-fun res!82500 () Bool)

(assert (=> b!173769 (=> res!82500 e!114772)))

(assert (=> b!173769 (= res!82500 (= (h!2819 (toList!1099 lt!86036)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))

(declare-fun b!173770 () Bool)

(assert (=> b!173770 (= e!114772 (contains!1155 (t!7013 (toList!1099 lt!86036)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))

(assert (= (and d!52783 res!82501) b!173769))

(assert (= (and b!173769 (not res!82500)) b!173770))

(declare-fun m!202427 () Bool)

(assert (=> d!52783 m!202427))

(declare-fun m!202429 () Bool)

(assert (=> d!52783 m!202429))

(declare-fun m!202431 () Bool)

(assert (=> b!173770 m!202431))

(assert (=> b!173743 d!52783))

(assert (=> b!173640 d!52659))

(declare-fun lt!86046 () Bool)

(declare-fun d!52785 () Bool)

(assert (=> d!52785 (= lt!86046 (select (content!149 (toList!1099 lt!85907)) (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))

(declare-fun e!114775 () Bool)

(assert (=> d!52785 (= lt!86046 e!114775)))

(declare-fun res!82503 () Bool)

(assert (=> d!52785 (=> (not res!82503) (not e!114775))))

(assert (=> d!52785 (= res!82503 ((_ is Cons!2202) (toList!1099 lt!85907)))))

(assert (=> d!52785 (= (contains!1155 (toList!1099 lt!85907) (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) lt!86046)))

(declare-fun b!173771 () Bool)

(declare-fun e!114774 () Bool)

(assert (=> b!173771 (= e!114775 e!114774)))

(declare-fun res!82502 () Bool)

(assert (=> b!173771 (=> res!82502 e!114774)))

(assert (=> b!173771 (= res!82502 (= (h!2819 (toList!1099 lt!85907)) (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))

(declare-fun b!173772 () Bool)

(assert (=> b!173772 (= e!114774 (contains!1155 (t!7013 (toList!1099 lt!85907)) (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!52785 res!82503) b!173771))

(assert (= (and b!173771 (not res!82502)) b!173772))

(declare-fun m!202433 () Bool)

(assert (=> d!52785 m!202433))

(declare-fun m!202435 () Bool)

(assert (=> d!52785 m!202435))

(declare-fun m!202437 () Bool)

(assert (=> b!173772 m!202437))

(assert (=> b!173515 d!52785))

(assert (=> b!173645 d!52777))

(declare-fun d!52787 () Bool)

(declare-fun res!82504 () Bool)

(declare-fun e!114776 () Bool)

(assert (=> d!52787 (=> res!82504 e!114776)))

(assert (=> d!52787 (= res!82504 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (= (_1!1631 (h!2819 (toList!1099 lt!85791))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52787 (= (containsKey!189 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000) e!114776)))

(declare-fun b!173773 () Bool)

(declare-fun e!114777 () Bool)

(assert (=> b!173773 (= e!114776 e!114777)))

(declare-fun res!82505 () Bool)

(assert (=> b!173773 (=> (not res!82505) (not e!114777))))

(assert (=> b!173773 (= res!82505 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85791))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85791))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2202) (toList!1099 lt!85791)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85791))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173774 () Bool)

(assert (=> b!173774 (= e!114777 (containsKey!189 (t!7013 (toList!1099 lt!85791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52787 (not res!82504)) b!173773))

(assert (= (and b!173773 res!82505) b!173774))

(declare-fun m!202439 () Bool)

(assert (=> b!173774 m!202439))

(assert (=> d!52749 d!52787))

(declare-fun d!52789 () Bool)

(assert (=> d!52789 (= (size!3770 thiss!1248) (bvadd (_size!1201 thiss!1248) (bvsdiv (bvadd (extraKeys!3337 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!173658 d!52789))

(declare-fun d!52791 () Bool)

(declare-fun res!82506 () Bool)

(declare-fun e!114778 () Bool)

(assert (=> d!52791 (=> res!82506 e!114778)))

(assert (=> d!52791 (= res!82506 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (= (_1!1631 (h!2819 (toList!1099 lt!85791))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52791 (= (containsKey!189 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000) e!114778)))

(declare-fun b!173775 () Bool)

(declare-fun e!114779 () Bool)

(assert (=> b!173775 (= e!114778 e!114779)))

(declare-fun res!82507 () Bool)

(assert (=> b!173775 (=> (not res!82507) (not e!114779))))

(assert (=> b!173775 (= res!82507 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85791))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85791))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2202) (toList!1099 lt!85791)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85791))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173776 () Bool)

(assert (=> b!173776 (= e!114779 (containsKey!189 (t!7013 (toList!1099 lt!85791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52791 (not res!82506)) b!173775))

(assert (= (and b!173775 res!82507) b!173776))

(declare-fun m!202441 () Bool)

(assert (=> b!173776 m!202441))

(assert (=> d!52757 d!52791))

(declare-fun d!52793 () Bool)

(assert (=> d!52793 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3956 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52759 d!52793))

(declare-fun b!173777 () Bool)

(declare-fun e!114780 () Option!191)

(assert (=> b!173777 (= e!114780 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85791)))))))

(declare-fun b!173780 () Bool)

(declare-fun e!114781 () Option!191)

(assert (=> b!173780 (= e!114781 None!189)))

(declare-fun b!173778 () Bool)

(assert (=> b!173778 (= e!114780 e!114781)))

(declare-fun c!31015 () Bool)

(assert (=> b!173778 (= c!31015 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85791))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173779 () Bool)

(assert (=> b!173779 (= e!114781 (getValueByKey!185 (t!7013 (toList!1099 lt!85791)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52795 () Bool)

(declare-fun c!31014 () Bool)

(assert (=> d!52795 (= c!31014 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (= (_1!1631 (h!2819 (toList!1099 lt!85791))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52795 (= (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000) e!114780)))

(assert (= (and d!52795 c!31014) b!173777))

(assert (= (and d!52795 (not c!31014)) b!173778))

(assert (= (and b!173778 c!31015) b!173779))

(assert (= (and b!173778 (not c!31015)) b!173780))

(declare-fun m!202443 () Bool)

(assert (=> b!173779 m!202443))

(assert (=> d!52759 d!52795))

(assert (=> b!173506 d!52659))

(declare-fun d!52797 () Bool)

(declare-fun res!82508 () Bool)

(declare-fun e!114782 () Bool)

(assert (=> d!52797 (=> res!82508 e!114782)))

(assert (=> d!52797 (= res!82508 (and ((_ is Cons!2202) (toList!1099 lt!85855)) (= (_1!1631 (h!2819 (toList!1099 lt!85855))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!52797 (= (containsKey!189 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))) e!114782)))

(declare-fun b!173781 () Bool)

(declare-fun e!114783 () Bool)

(assert (=> b!173781 (= e!114782 e!114783)))

(declare-fun res!82509 () Bool)

(assert (=> b!173781 (=> (not res!82509) (not e!114783))))

(assert (=> b!173781 (= res!82509 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85855))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85855))) (_1!1631 (tuple2!3241 key!828 v!309)))) ((_ is Cons!2202) (toList!1099 lt!85855)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85855))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun b!173782 () Bool)

(assert (=> b!173782 (= e!114783 (containsKey!189 (t!7013 (toList!1099 lt!85855)) (_1!1631 (tuple2!3241 key!828 v!309))))))

(assert (= (and d!52797 (not res!82508)) b!173781))

(assert (= (and b!173781 res!82509) b!173782))

(declare-fun m!202445 () Bool)

(assert (=> b!173782 m!202445))

(assert (=> d!52731 d!52797))

(declare-fun d!52799 () Bool)

(assert (=> d!52799 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85826) lt!85830)) (v!3956 (getValueByKey!185 (toList!1099 lt!85826) lt!85830)))))

(assert (=> d!52703 d!52799))

(declare-fun b!173783 () Bool)

(declare-fun e!114784 () Option!191)

(assert (=> b!173783 (= e!114784 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85826)))))))

(declare-fun b!173786 () Bool)

(declare-fun e!114785 () Option!191)

(assert (=> b!173786 (= e!114785 None!189)))

(declare-fun b!173784 () Bool)

(assert (=> b!173784 (= e!114784 e!114785)))

(declare-fun c!31017 () Bool)

(assert (=> b!173784 (= c!31017 (and ((_ is Cons!2202) (toList!1099 lt!85826)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85826))) lt!85830))))))

(declare-fun b!173785 () Bool)

(assert (=> b!173785 (= e!114785 (getValueByKey!185 (t!7013 (toList!1099 lt!85826)) lt!85830))))

(declare-fun d!52801 () Bool)

(declare-fun c!31016 () Bool)

(assert (=> d!52801 (= c!31016 (and ((_ is Cons!2202) (toList!1099 lt!85826)) (= (_1!1631 (h!2819 (toList!1099 lt!85826))) lt!85830)))))

(assert (=> d!52801 (= (getValueByKey!185 (toList!1099 lt!85826) lt!85830) e!114784)))

(assert (= (and d!52801 c!31016) b!173783))

(assert (= (and d!52801 (not c!31016)) b!173784))

(assert (= (and b!173784 c!31017) b!173785))

(assert (= (and b!173784 (not c!31017)) b!173786))

(declare-fun m!202447 () Bool)

(assert (=> b!173785 m!202447))

(assert (=> d!52703 d!52801))

(declare-fun d!52803 () Bool)

(assert (=> d!52803 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3956 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52753 d!52803))

(declare-fun b!173787 () Bool)

(declare-fun e!114786 () Option!191)

(assert (=> b!173787 (= e!114786 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85791)))))))

(declare-fun b!173790 () Bool)

(declare-fun e!114787 () Option!191)

(assert (=> b!173790 (= e!114787 None!189)))

(declare-fun b!173788 () Bool)

(assert (=> b!173788 (= e!114786 e!114787)))

(declare-fun c!31019 () Bool)

(assert (=> b!173788 (= c!31019 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85791))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173789 () Bool)

(assert (=> b!173789 (= e!114787 (getValueByKey!185 (t!7013 (toList!1099 lt!85791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52805 () Bool)

(declare-fun c!31018 () Bool)

(assert (=> d!52805 (= c!31018 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (= (_1!1631 (h!2819 (toList!1099 lt!85791))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52805 (= (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000) e!114786)))

(assert (= (and d!52805 c!31018) b!173787))

(assert (= (and d!52805 (not c!31018)) b!173788))

(assert (= (and b!173788 c!31019) b!173789))

(assert (= (and b!173788 (not c!31019)) b!173790))

(declare-fun m!202449 () Bool)

(assert (=> b!173789 m!202449))

(assert (=> d!52753 d!52805))

(declare-fun d!52807 () Bool)

(assert (=> d!52807 (= ($colon$colon!98 e!114721 (ite c!30982 (h!2819 (toList!1099 (map!1882 thiss!1248))) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))) (Cons!2202 (ite c!30982 (h!2819 (toList!1099 (map!1882 thiss!1248))) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))) e!114721))))

(assert (=> bm!17603 d!52807))

(declare-fun b!173791 () Bool)

(declare-fun e!114788 () Bool)

(declare-fun e!114793 () Bool)

(assert (=> b!173791 (= e!114788 e!114793)))

(declare-fun c!31021 () Bool)

(assert (=> b!173791 (= c!31021 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun bm!17621 () Bool)

(declare-fun call!17624 () ListLongMap!2167)

(assert (=> bm!17621 (= call!17624 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248)))))

(declare-fun b!173793 () Bool)

(declare-fun e!114791 () Bool)

(assert (=> b!173793 (= e!114788 e!114791)))

(assert (=> b!173793 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun res!82511 () Bool)

(declare-fun lt!86049 () ListLongMap!2167)

(assert (=> b!173793 (= res!82511 (contains!1154 lt!86049 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173793 (=> (not res!82511) (not e!114791))))

(declare-fun b!173794 () Bool)

(declare-fun e!114789 () ListLongMap!2167)

(assert (=> b!173794 (= e!114789 (ListLongMap!2168 Nil!2203))))

(declare-fun b!173795 () Bool)

(assert (=> b!173795 (= e!114793 (isEmpty!436 lt!86049))))

(declare-fun b!173796 () Bool)

(assert (=> b!173796 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> b!173796 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3767 (_values!3581 thiss!1248))))))

(assert (=> b!173796 (= e!114791 (= (apply!130 lt!86049 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173797 () Bool)

(declare-fun e!114792 () ListLongMap!2167)

(assert (=> b!173797 (= e!114792 call!17624)))

(declare-fun b!173798 () Bool)

(assert (=> b!173798 (= e!114793 (= lt!86049 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248))))))

(declare-fun b!173799 () Bool)

(assert (=> b!173799 (= e!114789 e!114792)))

(declare-fun c!31023 () Bool)

(assert (=> b!173799 (= c!31023 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!173800 () Bool)

(declare-fun e!114790 () Bool)

(assert (=> b!173800 (= e!114790 e!114788)))

(declare-fun c!31022 () Bool)

(declare-fun e!114794 () Bool)

(assert (=> b!173800 (= c!31022 e!114794)))

(declare-fun res!82512 () Bool)

(assert (=> b!173800 (=> (not res!82512) (not e!114794))))

(assert (=> b!173800 (= res!82512 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!173801 () Bool)

(declare-fun lt!86047 () Unit!5314)

(declare-fun lt!86051 () Unit!5314)

(assert (=> b!173801 (= lt!86047 lt!86051)))

(declare-fun lt!86053 () ListLongMap!2167)

(declare-fun lt!86050 () (_ BitVec 64))

(declare-fun lt!86048 () V!5091)

(declare-fun lt!86052 () (_ BitVec 64))

(assert (=> b!173801 (not (contains!1154 (+!246 lt!86053 (tuple2!3241 lt!86052 lt!86048)) lt!86050))))

(assert (=> b!173801 (= lt!86051 (addStillNotContains!72 lt!86053 lt!86052 lt!86048 lt!86050))))

(assert (=> b!173801 (= lt!86050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173801 (= lt!86048 (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173801 (= lt!86052 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!173801 (= lt!86053 call!17624)))

(assert (=> b!173801 (= e!114792 (+!246 call!17624 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173802 () Bool)

(assert (=> b!173802 (= e!114794 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173802 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!52809 () Bool)

(assert (=> d!52809 e!114790))

(declare-fun res!82513 () Bool)

(assert (=> d!52809 (=> (not res!82513) (not e!114790))))

(assert (=> d!52809 (= res!82513 (not (contains!1154 lt!86049 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52809 (= lt!86049 e!114789)))

(declare-fun c!31020 () Bool)

(assert (=> d!52809 (= c!31020 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52809 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!52809 (= (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (bvor (extraKeys!3337 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3439 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248)) lt!86049)))

(declare-fun b!173792 () Bool)

(declare-fun res!82510 () Bool)

(assert (=> b!173792 (=> (not res!82510) (not e!114790))))

(assert (=> b!173792 (= res!82510 (not (contains!1154 lt!86049 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52809 c!31020) b!173794))

(assert (= (and d!52809 (not c!31020)) b!173799))

(assert (= (and b!173799 c!31023) b!173801))

(assert (= (and b!173799 (not c!31023)) b!173797))

(assert (= (or b!173801 b!173797) bm!17621))

(assert (= (and d!52809 res!82513) b!173792))

(assert (= (and b!173792 res!82510) b!173800))

(assert (= (and b!173800 res!82512) b!173802))

(assert (= (and b!173800 c!31022) b!173793))

(assert (= (and b!173800 (not c!31022)) b!173791))

(assert (= (and b!173793 res!82511) b!173796))

(assert (= (and b!173791 c!31021) b!173798))

(assert (= (and b!173791 (not c!31021)) b!173795))

(declare-fun b_lambda!6961 () Bool)

(assert (=> (not b_lambda!6961) (not b!173796)))

(assert (=> b!173796 t!7016))

(declare-fun b_and!10769 () Bool)

(assert (= b_and!10767 (and (=> t!7016 result!4585) b_and!10769)))

(declare-fun b_lambda!6963 () Bool)

(assert (=> (not b_lambda!6963) (not b!173801)))

(assert (=> b!173801 t!7016))

(declare-fun b_and!10771 () Bool)

(assert (= b_and!10769 (and (=> t!7016 result!4585) b_and!10771)))

(declare-fun m!202451 () Bool)

(assert (=> b!173798 m!202451))

(declare-fun m!202453 () Bool)

(assert (=> b!173796 m!202453))

(assert (=> b!173796 m!201747))

(declare-fun m!202455 () Bool)

(assert (=> b!173796 m!202455))

(assert (=> b!173796 m!201747))

(declare-fun m!202457 () Bool)

(assert (=> b!173796 m!202457))

(declare-fun m!202459 () Bool)

(assert (=> b!173796 m!202459))

(assert (=> b!173796 m!202457))

(assert (=> b!173796 m!202453))

(declare-fun m!202461 () Bool)

(assert (=> d!52809 m!202461))

(assert (=> d!52809 m!201729))

(assert (=> b!173793 m!202457))

(assert (=> b!173793 m!202457))

(declare-fun m!202463 () Bool)

(assert (=> b!173793 m!202463))

(assert (=> bm!17621 m!202451))

(declare-fun m!202465 () Bool)

(assert (=> b!173795 m!202465))

(assert (=> b!173802 m!202457))

(assert (=> b!173802 m!202457))

(declare-fun m!202467 () Bool)

(assert (=> b!173802 m!202467))

(declare-fun m!202469 () Bool)

(assert (=> b!173792 m!202469))

(assert (=> b!173799 m!202457))

(assert (=> b!173799 m!202457))

(assert (=> b!173799 m!202467))

(declare-fun m!202471 () Bool)

(assert (=> b!173801 m!202471))

(declare-fun m!202473 () Bool)

(assert (=> b!173801 m!202473))

(assert (=> b!173801 m!202453))

(assert (=> b!173801 m!201747))

(assert (=> b!173801 m!202455))

(assert (=> b!173801 m!201747))

(assert (=> b!173801 m!202471))

(declare-fun m!202475 () Bool)

(assert (=> b!173801 m!202475))

(assert (=> b!173801 m!202457))

(assert (=> b!173801 m!202453))

(declare-fun m!202477 () Bool)

(assert (=> b!173801 m!202477))

(assert (=> bm!17595 d!52809))

(declare-fun d!52811 () Bool)

(declare-fun res!82514 () Bool)

(declare-fun e!114795 () Bool)

(assert (=> d!52811 (=> res!82514 e!114795)))

(assert (=> d!52811 (= res!82514 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))) lt!85822)))))

(assert (=> d!52811 (= (containsKey!189 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822) e!114795)))

(declare-fun b!173803 () Bool)

(declare-fun e!114796 () Bool)

(assert (=> b!173803 (= e!114795 e!114796)))

(declare-fun res!82515 () Bool)

(assert (=> b!173803 (=> (not res!82515) (not e!114796))))

(assert (=> b!173803 (= res!82515 (and (or (not ((_ is Cons!2202) (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))) (bvsle (_1!1631 (h!2819 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))) lt!85822)) ((_ is Cons!2202) (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))) (bvslt (_1!1631 (h!2819 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))) lt!85822)))))

(declare-fun b!173804 () Bool)

(assert (=> b!173804 (= e!114796 (containsKey!189 (t!7013 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))) lt!85822))))

(assert (= (and d!52811 (not res!82514)) b!173803))

(assert (= (and b!173803 res!82515) b!173804))

(declare-fun m!202479 () Bool)

(assert (=> b!173804 m!202479))

(assert (=> d!52717 d!52811))

(declare-fun d!52813 () Bool)

(declare-fun res!82516 () Bool)

(declare-fun e!114797 () Bool)

(assert (=> d!52813 (=> res!82516 e!114797)))

(assert (=> d!52813 (= res!82516 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))) lt!85788)))))

(assert (=> d!52813 (= (containsKey!189 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788) e!114797)))

(declare-fun b!173805 () Bool)

(declare-fun e!114798 () Bool)

(assert (=> b!173805 (= e!114797 e!114798)))

(declare-fun res!82517 () Bool)

(assert (=> b!173805 (=> (not res!82517) (not e!114798))))

(assert (=> b!173805 (= res!82517 (and (or (not ((_ is Cons!2202) (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))) (bvsle (_1!1631 (h!2819 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))) lt!85788)) ((_ is Cons!2202) (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))) (bvslt (_1!1631 (h!2819 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))) lt!85788)))))

(declare-fun b!173806 () Bool)

(assert (=> b!173806 (= e!114798 (containsKey!189 (t!7013 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))) lt!85788))))

(assert (= (and d!52813 (not res!82516)) b!173805))

(assert (= (and b!173805 res!82517) b!173806))

(declare-fun m!202481 () Bool)

(assert (=> b!173806 m!202481))

(assert (=> d!52639 d!52813))

(assert (=> d!52719 d!52693))

(declare-fun d!52815 () Bool)

(assert (=> d!52815 (= (apply!130 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) lt!85829) (apply!130 lt!85840 lt!85829))))

(assert (=> d!52815 true))

(declare-fun _$34!1055 () Unit!5314)

(assert (=> d!52815 (= (choose!929 lt!85840 lt!85833 (zeroValue!3439 thiss!1248) lt!85829) _$34!1055)))

(declare-fun bs!7174 () Bool)

(assert (= bs!7174 d!52815))

(assert (=> bs!7174 m!201823))

(assert (=> bs!7174 m!201823))

(assert (=> bs!7174 m!201825))

(assert (=> bs!7174 m!201815))

(assert (=> d!52719 d!52815))

(assert (=> d!52719 d!52701))

(assert (=> d!52719 d!52721))

(declare-fun d!52817 () Bool)

(declare-fun e!114799 () Bool)

(assert (=> d!52817 e!114799))

(declare-fun res!82518 () Bool)

(assert (=> d!52817 (=> res!82518 e!114799)))

(declare-fun lt!86054 () Bool)

(assert (=> d!52817 (= res!82518 (not lt!86054))))

(declare-fun lt!86056 () Bool)

(assert (=> d!52817 (= lt!86054 lt!86056)))

(declare-fun lt!86057 () Unit!5314)

(declare-fun e!114800 () Unit!5314)

(assert (=> d!52817 (= lt!86057 e!114800)))

(declare-fun c!31024 () Bool)

(assert (=> d!52817 (= c!31024 lt!86056)))

(assert (=> d!52817 (= lt!86056 (containsKey!189 (toList!1099 lt!85840) lt!85829))))

(assert (=> d!52817 (= (contains!1154 lt!85840 lt!85829) lt!86054)))

(declare-fun b!173808 () Bool)

(declare-fun lt!86055 () Unit!5314)

(assert (=> b!173808 (= e!114800 lt!86055)))

(assert (=> b!173808 (= lt!86055 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85840) lt!85829))))

(assert (=> b!173808 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85840) lt!85829))))

(declare-fun b!173809 () Bool)

(declare-fun Unit!5333 () Unit!5314)

(assert (=> b!173809 (= e!114800 Unit!5333)))

(declare-fun b!173810 () Bool)

(assert (=> b!173810 (= e!114799 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85840) lt!85829)))))

(assert (= (and d!52817 c!31024) b!173808))

(assert (= (and d!52817 (not c!31024)) b!173809))

(assert (= (and d!52817 (not res!82518)) b!173810))

(declare-fun m!202483 () Bool)

(assert (=> d!52817 m!202483))

(declare-fun m!202485 () Bool)

(assert (=> b!173808 m!202485))

(assert (=> b!173808 m!202215))

(assert (=> b!173808 m!202215))

(declare-fun m!202487 () Bool)

(assert (=> b!173808 m!202487))

(assert (=> b!173810 m!202215))

(assert (=> b!173810 m!202215))

(assert (=> b!173810 m!202487))

(assert (=> d!52719 d!52817))

(declare-fun d!52819 () Bool)

(assert (=> d!52819 (= (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) lt!85794)) (v!3956 (getValueByKey!185 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) lt!85794)))))

(assert (=> d!52641 d!52819))

(declare-fun e!114801 () Option!191)

(declare-fun b!173811 () Bool)

(assert (=> b!173811 (= e!114801 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))))

(declare-fun b!173814 () Bool)

(declare-fun e!114802 () Option!191)

(assert (=> b!173814 (= e!114802 None!189)))

(declare-fun b!173812 () Bool)

(assert (=> b!173812 (= e!114801 e!114802)))

(declare-fun c!31026 () Bool)

(assert (=> b!173812 (= c!31026 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))) lt!85794))))))

(declare-fun b!173813 () Bool)

(assert (=> b!173813 (= e!114802 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))) lt!85794))))

(declare-fun d!52821 () Bool)

(declare-fun c!31025 () Bool)

(assert (=> d!52821 (= c!31025 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))) lt!85794)))))

(assert (=> d!52821 (= (getValueByKey!185 (toList!1099 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) lt!85794) e!114801)))

(assert (= (and d!52821 c!31025) b!173811))

(assert (= (and d!52821 (not c!31025)) b!173812))

(assert (= (and b!173812 c!31026) b!173813))

(assert (= (and b!173812 (not c!31026)) b!173814))

(declare-fun m!202489 () Bool)

(assert (=> b!173813 m!202489))

(assert (=> d!52641 d!52821))

(assert (=> d!52691 d!52679))

(assert (=> d!52691 d!52681))

(declare-fun d!52823 () Bool)

(assert (=> d!52823 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85728) key!828))))

(assert (=> d!52823 true))

(declare-fun _$12!446 () Unit!5314)

(assert (=> d!52823 (= (choose!932 (toList!1099 lt!85728) key!828) _$12!446)))

(declare-fun bs!7175 () Bool)

(assert (= bs!7175 d!52823))

(assert (=> bs!7175 m!201853))

(assert (=> bs!7175 m!201853))

(assert (=> bs!7175 m!201855))

(assert (=> d!52691 d!52823))

(declare-fun d!52825 () Bool)

(declare-fun res!82523 () Bool)

(declare-fun e!114807 () Bool)

(assert (=> d!52825 (=> res!82523 e!114807)))

(assert (=> d!52825 (= res!82523 (or ((_ is Nil!2203) (toList!1099 lt!85728)) ((_ is Nil!2203) (t!7013 (toList!1099 lt!85728)))))))

(assert (=> d!52825 (= (isStrictlySorted!332 (toList!1099 lt!85728)) e!114807)))

(declare-fun b!173819 () Bool)

(declare-fun e!114808 () Bool)

(assert (=> b!173819 (= e!114807 e!114808)))

(declare-fun res!82524 () Bool)

(assert (=> b!173819 (=> (not res!82524) (not e!114808))))

(assert (=> b!173819 (= res!82524 (bvslt (_1!1631 (h!2819 (toList!1099 lt!85728))) (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85728))))))))

(declare-fun b!173820 () Bool)

(assert (=> b!173820 (= e!114808 (isStrictlySorted!332 (t!7013 (toList!1099 lt!85728))))))

(assert (= (and d!52825 (not res!82523)) b!173819))

(assert (= (and b!173819 res!82524) b!173820))

(declare-fun m!202491 () Bool)

(assert (=> b!173820 m!202491))

(assert (=> d!52691 d!52825))

(declare-fun d!52827 () Bool)

(assert (=> d!52827 (= (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) lt!85795)) (v!3956 (getValueByKey!185 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) lt!85795)))))

(assert (=> d!52655 d!52827))

(declare-fun b!173821 () Bool)

(declare-fun e!114809 () Option!191)

(assert (=> b!173821 (= e!114809 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))))

(declare-fun b!173824 () Bool)

(declare-fun e!114810 () Option!191)

(assert (=> b!173824 (= e!114810 None!189)))

(declare-fun b!173822 () Bool)

(assert (=> b!173822 (= e!114809 e!114810)))

(declare-fun c!31028 () Bool)

(assert (=> b!173822 (= c!31028 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))) lt!85795))))))

(declare-fun b!173823 () Bool)

(assert (=> b!173823 (= e!114810 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))) lt!85795))))

(declare-fun d!52829 () Bool)

(declare-fun c!31027 () Bool)

(assert (=> d!52829 (= c!31027 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))) lt!85795)))))

(assert (=> d!52829 (= (getValueByKey!185 (toList!1099 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) lt!85795) e!114809)))

(assert (= (and d!52829 c!31027) b!173821))

(assert (= (and d!52829 (not c!31027)) b!173822))

(assert (= (and b!173822 c!31028) b!173823))

(assert (= (and b!173822 (not c!31028)) b!173824))

(declare-fun m!202493 () Bool)

(assert (=> b!173823 m!202493))

(assert (=> d!52655 d!52829))

(declare-fun d!52831 () Bool)

(assert (=> d!52831 (= (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85728) key!828)) (not ((_ is Some!190) (getValueByKey!185 (toList!1099 lt!85728) key!828))))))

(assert (=> d!52679 d!52831))

(declare-fun d!52833 () Bool)

(declare-fun lt!86058 () Bool)

(assert (=> d!52833 (= lt!86058 (select (content!149 (toList!1099 lt!85919)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!114812 () Bool)

(assert (=> d!52833 (= lt!86058 e!114812)))

(declare-fun res!82526 () Bool)

(assert (=> d!52833 (=> (not res!82526) (not e!114812))))

(assert (=> d!52833 (= res!82526 ((_ is Cons!2202) (toList!1099 lt!85919)))))

(assert (=> d!52833 (= (contains!1155 (toList!1099 lt!85919) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!86058)))

(declare-fun b!173825 () Bool)

(declare-fun e!114811 () Bool)

(assert (=> b!173825 (= e!114812 e!114811)))

(declare-fun res!82525 () Bool)

(assert (=> b!173825 (=> res!82525 e!114811)))

(assert (=> b!173825 (= res!82525 (= (h!2819 (toList!1099 lt!85919)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!173826 () Bool)

(assert (=> b!173826 (= e!114811 (contains!1155 (t!7013 (toList!1099 lt!85919)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52833 res!82526) b!173825))

(assert (= (and b!173825 (not res!82525)) b!173826))

(declare-fun m!202495 () Bool)

(assert (=> d!52833 m!202495))

(declare-fun m!202497 () Bool)

(assert (=> d!52833 m!202497))

(declare-fun m!202499 () Bool)

(assert (=> b!173826 m!202499))

(assert (=> b!173522 d!52833))

(declare-fun d!52835 () Bool)

(declare-fun e!114813 () Bool)

(assert (=> d!52835 e!114813))

(declare-fun res!82527 () Bool)

(assert (=> d!52835 (=> (not res!82527) (not e!114813))))

(declare-fun lt!86060 () ListLongMap!2167)

(assert (=> d!52835 (= res!82527 (contains!1154 lt!86060 (_1!1631 (tuple2!3241 lt!85892 lt!85888))))))

(declare-fun lt!86061 () List!2206)

(assert (=> d!52835 (= lt!86060 (ListLongMap!2168 lt!86061))))

(declare-fun lt!86062 () Unit!5314)

(declare-fun lt!86059 () Unit!5314)

(assert (=> d!52835 (= lt!86062 lt!86059)))

(assert (=> d!52835 (= (getValueByKey!185 lt!86061 (_1!1631 (tuple2!3241 lt!85892 lt!85888))) (Some!190 (_2!1631 (tuple2!3241 lt!85892 lt!85888))))))

(assert (=> d!52835 (= lt!86059 (lemmaContainsTupThenGetReturnValue!98 lt!86061 (_1!1631 (tuple2!3241 lt!85892 lt!85888)) (_2!1631 (tuple2!3241 lt!85892 lt!85888))))))

(assert (=> d!52835 (= lt!86061 (insertStrictlySorted!101 (toList!1099 lt!85893) (_1!1631 (tuple2!3241 lt!85892 lt!85888)) (_2!1631 (tuple2!3241 lt!85892 lt!85888))))))

(assert (=> d!52835 (= (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888)) lt!86060)))

(declare-fun b!173827 () Bool)

(declare-fun res!82528 () Bool)

(assert (=> b!173827 (=> (not res!82528) (not e!114813))))

(assert (=> b!173827 (= res!82528 (= (getValueByKey!185 (toList!1099 lt!86060) (_1!1631 (tuple2!3241 lt!85892 lt!85888))) (Some!190 (_2!1631 (tuple2!3241 lt!85892 lt!85888)))))))

(declare-fun b!173828 () Bool)

(assert (=> b!173828 (= e!114813 (contains!1155 (toList!1099 lt!86060) (tuple2!3241 lt!85892 lt!85888)))))

(assert (= (and d!52835 res!82527) b!173827))

(assert (= (and b!173827 res!82528) b!173828))

(declare-fun m!202501 () Bool)

(assert (=> d!52835 m!202501))

(declare-fun m!202503 () Bool)

(assert (=> d!52835 m!202503))

(declare-fun m!202505 () Bool)

(assert (=> d!52835 m!202505))

(declare-fun m!202507 () Bool)

(assert (=> d!52835 m!202507))

(declare-fun m!202509 () Bool)

(assert (=> b!173827 m!202509))

(declare-fun m!202511 () Bool)

(assert (=> b!173828 m!202511))

(assert (=> b!173505 d!52835))

(declare-fun d!52837 () Bool)

(declare-fun e!114814 () Bool)

(assert (=> d!52837 e!114814))

(declare-fun res!82529 () Bool)

(assert (=> d!52837 (=> res!82529 e!114814)))

(declare-fun lt!86063 () Bool)

(assert (=> d!52837 (= res!82529 (not lt!86063))))

(declare-fun lt!86065 () Bool)

(assert (=> d!52837 (= lt!86063 lt!86065)))

(declare-fun lt!86066 () Unit!5314)

(declare-fun e!114815 () Unit!5314)

(assert (=> d!52837 (= lt!86066 e!114815)))

(declare-fun c!31029 () Bool)

(assert (=> d!52837 (= c!31029 lt!86065)))

(assert (=> d!52837 (= lt!86065 (containsKey!189 (toList!1099 (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888))) lt!85890))))

(assert (=> d!52837 (= (contains!1154 (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888)) lt!85890) lt!86063)))

(declare-fun b!173829 () Bool)

(declare-fun lt!86064 () Unit!5314)

(assert (=> b!173829 (= e!114815 lt!86064)))

(assert (=> b!173829 (= lt!86064 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888))) lt!85890))))

(assert (=> b!173829 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888))) lt!85890))))

(declare-fun b!173830 () Bool)

(declare-fun Unit!5334 () Unit!5314)

(assert (=> b!173830 (= e!114815 Unit!5334)))

(declare-fun b!173831 () Bool)

(assert (=> b!173831 (= e!114814 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888))) lt!85890)))))

(assert (= (and d!52837 c!31029) b!173829))

(assert (= (and d!52837 (not c!31029)) b!173830))

(assert (= (and d!52837 (not res!82529)) b!173831))

(declare-fun m!202513 () Bool)

(assert (=> d!52837 m!202513))

(declare-fun m!202515 () Bool)

(assert (=> b!173829 m!202515))

(declare-fun m!202517 () Bool)

(assert (=> b!173829 m!202517))

(assert (=> b!173829 m!202517))

(declare-fun m!202519 () Bool)

(assert (=> b!173829 m!202519))

(assert (=> b!173831 m!202517))

(assert (=> b!173831 m!202517))

(assert (=> b!173831 m!202519))

(assert (=> b!173505 d!52837))

(declare-fun d!52839 () Bool)

(assert (=> d!52839 (not (contains!1154 (+!246 lt!85893 (tuple2!3241 lt!85892 lt!85888)) lt!85890))))

(declare-fun lt!86069 () Unit!5314)

(declare-fun choose!933 (ListLongMap!2167 (_ BitVec 64) V!5091 (_ BitVec 64)) Unit!5314)

(assert (=> d!52839 (= lt!86069 (choose!933 lt!85893 lt!85892 lt!85888 lt!85890))))

(declare-fun e!114818 () Bool)

(assert (=> d!52839 e!114818))

(declare-fun res!82532 () Bool)

(assert (=> d!52839 (=> (not res!82532) (not e!114818))))

(assert (=> d!52839 (= res!82532 (not (contains!1154 lt!85893 lt!85890)))))

(assert (=> d!52839 (= (addStillNotContains!72 lt!85893 lt!85892 lt!85888 lt!85890) lt!86069)))

(declare-fun b!173835 () Bool)

(assert (=> b!173835 (= e!114818 (not (= lt!85892 lt!85890)))))

(assert (= (and d!52839 res!82532) b!173835))

(assert (=> d!52839 m!201941))

(assert (=> d!52839 m!201941))

(assert (=> d!52839 m!201943))

(declare-fun m!202521 () Bool)

(assert (=> d!52839 m!202521))

(declare-fun m!202523 () Bool)

(assert (=> d!52839 m!202523))

(assert (=> b!173505 d!52839))

(declare-fun d!52841 () Bool)

(declare-fun e!114819 () Bool)

(assert (=> d!52841 e!114819))

(declare-fun res!82533 () Bool)

(assert (=> d!52841 (=> (not res!82533) (not e!114819))))

(declare-fun lt!86071 () ListLongMap!2167)

(assert (=> d!52841 (= res!82533 (contains!1154 lt!86071 (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!86072 () List!2206)

(assert (=> d!52841 (= lt!86071 (ListLongMap!2168 lt!86072))))

(declare-fun lt!86073 () Unit!5314)

(declare-fun lt!86070 () Unit!5314)

(assert (=> d!52841 (= lt!86073 lt!86070)))

(assert (=> d!52841 (= (getValueByKey!185 lt!86072 (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52841 (= lt!86070 (lemmaContainsTupThenGetReturnValue!98 lt!86072 (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52841 (= lt!86072 (insertStrictlySorted!101 (toList!1099 call!17588) (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52841 (= (+!246 call!17588 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!86071)))

(declare-fun b!173836 () Bool)

(declare-fun res!82534 () Bool)

(assert (=> b!173836 (=> (not res!82534) (not e!114819))))

(assert (=> b!173836 (= res!82534 (= (getValueByKey!185 (toList!1099 lt!86071) (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!173837 () Bool)

(assert (=> b!173837 (= e!114819 (contains!1155 (toList!1099 lt!86071) (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!52841 res!82533) b!173836))

(assert (= (and b!173836 res!82534) b!173837))

(declare-fun m!202525 () Bool)

(assert (=> d!52841 m!202525))

(declare-fun m!202527 () Bool)

(assert (=> d!52841 m!202527))

(declare-fun m!202529 () Bool)

(assert (=> d!52841 m!202529))

(declare-fun m!202531 () Bool)

(assert (=> d!52841 m!202531))

(declare-fun m!202533 () Bool)

(assert (=> b!173836 m!202533))

(declare-fun m!202535 () Bool)

(assert (=> b!173837 m!202535))

(assert (=> b!173505 d!52841))

(assert (=> b!173505 d!52619))

(declare-fun b!173838 () Bool)

(declare-fun e!114820 () Option!191)

(assert (=> b!173838 (= e!114820 (Some!190 (_2!1631 (h!2819 (t!7013 (toList!1099 lt!85817))))))))

(declare-fun b!173841 () Bool)

(declare-fun e!114821 () Option!191)

(assert (=> b!173841 (= e!114821 None!189)))

(declare-fun b!173839 () Bool)

(assert (=> b!173839 (= e!114820 e!114821)))

(declare-fun c!31031 () Bool)

(assert (=> b!173839 (= c!31031 (and ((_ is Cons!2202) (t!7013 (toList!1099 lt!85817))) (not (= (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85817)))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173840 () Bool)

(assert (=> b!173840 (= e!114821 (getValueByKey!185 (t!7013 (t!7013 (toList!1099 lt!85817))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52843 () Bool)

(declare-fun c!31030 () Bool)

(assert (=> d!52843 (= c!31030 (and ((_ is Cons!2202) (t!7013 (toList!1099 lt!85817))) (= (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85817)))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52843 (= (getValueByKey!185 (t!7013 (toList!1099 lt!85817)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114820)))

(assert (= (and d!52843 c!31030) b!173838))

(assert (= (and d!52843 (not c!31030)) b!173839))

(assert (= (and b!173839 c!31031) b!173840))

(assert (= (and b!173839 (not c!31031)) b!173841))

(declare-fun m!202537 () Bool)

(assert (=> b!173840 m!202537))

(assert (=> b!173712 d!52843))

(declare-fun lt!86074 () Bool)

(declare-fun d!52845 () Bool)

(assert (=> d!52845 (= lt!86074 (select (content!149 (toList!1099 lt!85970)) (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))

(declare-fun e!114823 () Bool)

(assert (=> d!52845 (= lt!86074 e!114823)))

(declare-fun res!82536 () Bool)

(assert (=> d!52845 (=> (not res!82536) (not e!114823))))

(assert (=> d!52845 (= res!82536 ((_ is Cons!2202) (toList!1099 lt!85970)))))

(assert (=> d!52845 (= (contains!1155 (toList!1099 lt!85970) (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) lt!86074)))

(declare-fun b!173842 () Bool)

(declare-fun e!114822 () Bool)

(assert (=> b!173842 (= e!114823 e!114822)))

(declare-fun res!82535 () Bool)

(assert (=> b!173842 (=> res!82535 e!114822)))

(assert (=> b!173842 (= res!82535 (= (h!2819 (toList!1099 lt!85970)) (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))

(declare-fun b!173843 () Bool)

(assert (=> b!173843 (= e!114822 (contains!1155 (t!7013 (toList!1099 lt!85970)) (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!52845 res!82536) b!173842))

(assert (= (and b!173842 (not res!82535)) b!173843))

(declare-fun m!202539 () Bool)

(assert (=> d!52845 m!202539))

(declare-fun m!202541 () Bool)

(assert (=> d!52845 m!202541))

(declare-fun m!202543 () Bool)

(assert (=> b!173843 m!202543))

(assert (=> b!173621 d!52845))

(declare-fun d!52847 () Bool)

(assert (=> d!52847 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7176 () Bool)

(assert (= bs!7176 d!52847))

(assert (=> bs!7176 m!202041))

(declare-fun m!202545 () Bool)

(assert (=> bs!7176 m!202545))

(assert (=> b!173525 d!52847))

(declare-fun b!173844 () Bool)

(declare-fun e!114824 () Option!191)

(assert (=> b!173844 (= e!114824 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85791)))))))

(declare-fun b!173847 () Bool)

(declare-fun e!114825 () Option!191)

(assert (=> b!173847 (= e!114825 None!189)))

(declare-fun b!173845 () Bool)

(assert (=> b!173845 (= e!114824 e!114825)))

(declare-fun c!31033 () Bool)

(assert (=> b!173845 (= c!31033 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85791))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!173846 () Bool)

(assert (=> b!173846 (= e!114825 (getValueByKey!185 (t!7013 (toList!1099 lt!85791)) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52849 () Bool)

(declare-fun c!31032 () Bool)

(assert (=> d!52849 (= c!31032 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (= (_1!1631 (h!2819 (toList!1099 lt!85791))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52849 (= (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) e!114824)))

(assert (= (and d!52849 c!31032) b!173844))

(assert (= (and d!52849 (not c!31032)) b!173845))

(assert (= (and b!173845 c!31033) b!173846))

(assert (= (and b!173845 (not c!31033)) b!173847))

(assert (=> b!173846 m!201737))

(declare-fun m!202547 () Bool)

(assert (=> b!173846 m!202547))

(assert (=> b!173525 d!52849))

(declare-fun lt!86075 () Bool)

(declare-fun d!52851 () Bool)

(assert (=> d!52851 (= lt!86075 (select (content!149 lt!85856) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun e!114827 () Bool)

(assert (=> d!52851 (= lt!86075 e!114827)))

(declare-fun res!82538 () Bool)

(assert (=> d!52851 (=> (not res!82538) (not e!114827))))

(assert (=> d!52851 (= res!82538 ((_ is Cons!2202) lt!85856))))

(assert (=> d!52851 (= (contains!1155 lt!85856 (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))) lt!86075)))

(declare-fun b!173848 () Bool)

(declare-fun e!114826 () Bool)

(assert (=> b!173848 (= e!114827 e!114826)))

(declare-fun res!82537 () Bool)

(assert (=> b!173848 (=> res!82537 e!114826)))

(assert (=> b!173848 (= res!82537 (= (h!2819 lt!85856) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun b!173849 () Bool)

(assert (=> b!173849 (= e!114826 (contains!1155 (t!7013 lt!85856) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(assert (= (and d!52851 res!82538) b!173848))

(assert (= (and b!173848 (not res!82537)) b!173849))

(declare-fun m!202549 () Bool)

(assert (=> d!52851 m!202549))

(declare-fun m!202551 () Bool)

(assert (=> d!52851 m!202551))

(declare-fun m!202553 () Bool)

(assert (=> b!173849 m!202553))

(assert (=> b!173672 d!52851))

(declare-fun d!52853 () Bool)

(assert (=> d!52853 (= (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309))) lt!85830)) (v!3956 (getValueByKey!185 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309))) lt!85830)))))

(assert (=> d!52709 d!52853))

(declare-fun e!114828 () Option!191)

(declare-fun b!173850 () Bool)

(assert (=> b!173850 (= e!114828 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)))))))))

(declare-fun b!173853 () Bool)

(declare-fun e!114829 () Option!191)

(assert (=> b!173853 (= e!114829 None!189)))

(declare-fun b!173851 () Bool)

(assert (=> b!173851 (= e!114828 e!114829)))

(declare-fun c!31035 () Bool)

(assert (=> b!173851 (= c!31035 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309))))) lt!85830))))))

(declare-fun b!173852 () Bool)

(assert (=> b!173852 (= e!114829 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)))) lt!85830))))

(declare-fun c!31034 () Bool)

(declare-fun d!52855 () Bool)

(assert (=> d!52855 (= c!31034 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309))))) lt!85830)))))

(assert (=> d!52855 (= (getValueByKey!185 (toList!1099 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309))) lt!85830) e!114828)))

(assert (= (and d!52855 c!31034) b!173850))

(assert (= (and d!52855 (not c!31034)) b!173851))

(assert (= (and b!173851 c!31035) b!173852))

(assert (= (and b!173851 (not c!31035)) b!173853))

(declare-fun m!202555 () Bool)

(assert (=> b!173852 m!202555))

(assert (=> d!52709 d!52855))

(declare-fun d!52857 () Bool)

(declare-fun e!114830 () Bool)

(assert (=> d!52857 e!114830))

(declare-fun res!82539 () Bool)

(assert (=> d!52857 (=> res!82539 e!114830)))

(declare-fun lt!86076 () Bool)

(assert (=> d!52857 (= res!82539 (not lt!86076))))

(declare-fun lt!86078 () Bool)

(assert (=> d!52857 (= lt!86076 lt!86078)))

(declare-fun lt!86079 () Unit!5314)

(declare-fun e!114831 () Unit!5314)

(assert (=> d!52857 (= lt!86079 e!114831)))

(declare-fun c!31036 () Bool)

(assert (=> d!52857 (= c!31036 lt!86078)))

(assert (=> d!52857 (= lt!86078 (containsKey!189 (toList!1099 lt!85942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52857 (= (contains!1154 lt!85942 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86076)))

(declare-fun b!173854 () Bool)

(declare-fun lt!86077 () Unit!5314)

(assert (=> b!173854 (= e!114831 lt!86077)))

(assert (=> b!173854 (= lt!86077 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173854 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85942) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173855 () Bool)

(declare-fun Unit!5335 () Unit!5314)

(assert (=> b!173855 (= e!114831 Unit!5335)))

(declare-fun b!173856 () Bool)

(assert (=> b!173856 (= e!114830 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85942) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52857 c!31036) b!173854))

(assert (= (and d!52857 (not c!31036)) b!173855))

(assert (= (and d!52857 (not res!82539)) b!173856))

(declare-fun m!202557 () Bool)

(assert (=> d!52857 m!202557))

(declare-fun m!202559 () Bool)

(assert (=> b!173854 m!202559))

(declare-fun m!202561 () Bool)

(assert (=> b!173854 m!202561))

(assert (=> b!173854 m!202561))

(declare-fun m!202563 () Bool)

(assert (=> b!173854 m!202563))

(assert (=> b!173856 m!202561))

(assert (=> b!173856 m!202561))

(assert (=> b!173856 m!202563))

(assert (=> d!52687 d!52857))

(assert (=> d!52687 d!52621))

(declare-fun d!52859 () Bool)

(assert (=> d!52859 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun bs!7177 () Bool)

(assert (= bs!7177 d!52859))

(assert (=> bs!7177 m!201797))

(declare-fun m!202565 () Bool)

(assert (=> bs!7177 m!202565))

(assert (=> b!173528 d!52859))

(assert (=> b!173528 d!52755))

(declare-fun d!52861 () Bool)

(assert (=> d!52861 (= (validMask!0 (mask!8470 lt!85729)) (and (or (= (mask!8470 lt!85729) #b00000000000000000000000000000111) (= (mask!8470 lt!85729) #b00000000000000000000000000001111) (= (mask!8470 lt!85729) #b00000000000000000000000000011111) (= (mask!8470 lt!85729) #b00000000000000000000000000111111) (= (mask!8470 lt!85729) #b00000000000000000000000001111111) (= (mask!8470 lt!85729) #b00000000000000000000000011111111) (= (mask!8470 lt!85729) #b00000000000000000000000111111111) (= (mask!8470 lt!85729) #b00000000000000000000001111111111) (= (mask!8470 lt!85729) #b00000000000000000000011111111111) (= (mask!8470 lt!85729) #b00000000000000000000111111111111) (= (mask!8470 lt!85729) #b00000000000000000001111111111111) (= (mask!8470 lt!85729) #b00000000000000000011111111111111) (= (mask!8470 lt!85729) #b00000000000000000111111111111111) (= (mask!8470 lt!85729) #b00000000000000001111111111111111) (= (mask!8470 lt!85729) #b00000000000000011111111111111111) (= (mask!8470 lt!85729) #b00000000000000111111111111111111) (= (mask!8470 lt!85729) #b00000000000001111111111111111111) (= (mask!8470 lt!85729) #b00000000000011111111111111111111) (= (mask!8470 lt!85729) #b00000000000111111111111111111111) (= (mask!8470 lt!85729) #b00000000001111111111111111111111) (= (mask!8470 lt!85729) #b00000000011111111111111111111111) (= (mask!8470 lt!85729) #b00000000111111111111111111111111) (= (mask!8470 lt!85729) #b00000001111111111111111111111111) (= (mask!8470 lt!85729) #b00000011111111111111111111111111) (= (mask!8470 lt!85729) #b00000111111111111111111111111111) (= (mask!8470 lt!85729) #b00001111111111111111111111111111) (= (mask!8470 lt!85729) #b00011111111111111111111111111111) (= (mask!8470 lt!85729) #b00111111111111111111111111111111)) (bvsle (mask!8470 lt!85729) #b00111111111111111111111111111111)))))

(assert (=> d!52763 d!52861))

(declare-fun d!52863 () Bool)

(declare-fun lt!86080 () Bool)

(assert (=> d!52863 (= lt!86080 (select (content!149 lt!85818) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114833 () Bool)

(assert (=> d!52863 (= lt!86080 e!114833)))

(declare-fun res!82541 () Bool)

(assert (=> d!52863 (=> (not res!82541) (not e!114833))))

(assert (=> d!52863 (= res!82541 ((_ is Cons!2202) lt!85818))))

(assert (=> d!52863 (= (contains!1155 lt!85818 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86080)))

(declare-fun b!173857 () Bool)

(declare-fun e!114832 () Bool)

(assert (=> b!173857 (= e!114833 e!114832)))

(declare-fun res!82540 () Bool)

(assert (=> b!173857 (=> res!82540 e!114832)))

(assert (=> b!173857 (= res!82540 (= (h!2819 lt!85818) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173858 () Bool)

(assert (=> b!173858 (= e!114832 (contains!1155 (t!7013 lt!85818) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52863 res!82541) b!173857))

(assert (= (and b!173857 (not res!82540)) b!173858))

(declare-fun m!202567 () Bool)

(assert (=> d!52863 m!202567))

(declare-fun m!202569 () Bool)

(assert (=> d!52863 m!202569))

(declare-fun m!202571 () Bool)

(assert (=> b!173858 m!202571))

(assert (=> b!173546 d!52863))

(declare-fun d!52865 () Bool)

(assert (=> d!52865 (= (size!3770 lt!85729) (bvadd (_size!1201 lt!85729) (bvsdiv (bvadd (extraKeys!3337 lt!85729) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!173718 d!52865))

(declare-fun d!52867 () Bool)

(declare-fun lt!86081 () Bool)

(assert (=> d!52867 (= lt!86081 (select (content!149 lt!85992) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun e!114835 () Bool)

(assert (=> d!52867 (= lt!86081 e!114835)))

(declare-fun res!82543 () Bool)

(assert (=> d!52867 (=> (not res!82543) (not e!114835))))

(assert (=> d!52867 (= res!82543 ((_ is Cons!2202) lt!85992))))

(assert (=> d!52867 (= (contains!1155 lt!85992 (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))) lt!86081)))

(declare-fun b!173859 () Bool)

(declare-fun e!114834 () Bool)

(assert (=> b!173859 (= e!114835 e!114834)))

(declare-fun res!82542 () Bool)

(assert (=> b!173859 (=> res!82542 e!114834)))

(assert (=> b!173859 (= res!82542 (= (h!2819 lt!85992) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun b!173860 () Bool)

(assert (=> b!173860 (= e!114834 (contains!1155 (t!7013 lt!85992) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(assert (= (and d!52867 res!82543) b!173859))

(assert (= (and b!173859 (not res!82542)) b!173860))

(declare-fun m!202573 () Bool)

(assert (=> d!52867 m!202573))

(declare-fun m!202575 () Bool)

(assert (=> d!52867 m!202575))

(declare-fun m!202577 () Bool)

(assert (=> b!173860 m!202577))

(assert (=> b!173682 d!52867))

(declare-fun d!52869 () Bool)

(assert (=> d!52869 (= (apply!130 lt!86018 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1969 (getValueByKey!185 (toList!1099 lt!86018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7178 () Bool)

(assert (= bs!7178 d!52869))

(declare-fun m!202579 () Bool)

(assert (=> bs!7178 m!202579))

(assert (=> bs!7178 m!202579))

(declare-fun m!202581 () Bool)

(assert (=> bs!7178 m!202581))

(assert (=> b!173721 d!52869))

(declare-fun d!52871 () Bool)

(declare-fun lt!86082 () Bool)

(assert (=> d!52871 (= lt!86082 (select (content!149 (toList!1099 lt!85866)) (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))

(declare-fun e!114837 () Bool)

(assert (=> d!52871 (= lt!86082 e!114837)))

(declare-fun res!82545 () Bool)

(assert (=> d!52871 (=> (not res!82545) (not e!114837))))

(assert (=> d!52871 (= res!82545 ((_ is Cons!2202) (toList!1099 lt!85866)))))

(assert (=> d!52871 (= (contains!1155 (toList!1099 lt!85866) (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) lt!86082)))

(declare-fun b!173861 () Bool)

(declare-fun e!114836 () Bool)

(assert (=> b!173861 (= e!114837 e!114836)))

(declare-fun res!82544 () Bool)

(assert (=> b!173861 (=> res!82544 e!114836)))

(assert (=> b!173861 (= res!82544 (= (h!2819 (toList!1099 lt!85866)) (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))

(declare-fun b!173862 () Bool)

(assert (=> b!173862 (= e!114836 (contains!1155 (t!7013 (toList!1099 lt!85866)) (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))

(assert (= (and d!52871 res!82545) b!173861))

(assert (= (and b!173861 (not res!82544)) b!173862))

(declare-fun m!202583 () Bool)

(assert (=> d!52871 m!202583))

(declare-fun m!202585 () Bool)

(assert (=> d!52871 m!202585))

(declare-fun m!202587 () Bool)

(assert (=> b!173862 m!202587))

(assert (=> b!173465 d!52871))

(declare-fun d!52873 () Bool)

(declare-fun e!114838 () Bool)

(assert (=> d!52873 e!114838))

(declare-fun res!82546 () Bool)

(assert (=> d!52873 (=> res!82546 e!114838)))

(declare-fun lt!86083 () Bool)

(assert (=> d!52873 (= res!82546 (not lt!86083))))

(declare-fun lt!86085 () Bool)

(assert (=> d!52873 (= lt!86083 lt!86085)))

(declare-fun lt!86086 () Unit!5314)

(declare-fun e!114839 () Unit!5314)

(assert (=> d!52873 (= lt!86086 e!114839)))

(declare-fun c!31037 () Bool)

(assert (=> d!52873 (= c!31037 lt!86085)))

(assert (=> d!52873 (= lt!86085 (containsKey!189 (toList!1099 lt!86018) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52873 (= (contains!1154 lt!86018 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86083)))

(declare-fun b!173863 () Bool)

(declare-fun lt!86084 () Unit!5314)

(assert (=> b!173863 (= e!114839 lt!86084)))

(assert (=> b!173863 (= lt!86084 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!86018) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173863 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86018) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173864 () Bool)

(declare-fun Unit!5336 () Unit!5314)

(assert (=> b!173864 (= e!114839 Unit!5336)))

(declare-fun b!173865 () Bool)

(assert (=> b!173865 (= e!114838 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52873 c!31037) b!173863))

(assert (= (and d!52873 (not c!31037)) b!173864))

(assert (= (and d!52873 (not res!82546)) b!173865))

(declare-fun m!202589 () Bool)

(assert (=> d!52873 m!202589))

(declare-fun m!202591 () Bool)

(assert (=> b!173863 m!202591))

(assert (=> b!173863 m!202579))

(assert (=> b!173863 m!202579))

(declare-fun m!202593 () Bool)

(assert (=> b!173863 m!202593))

(assert (=> b!173865 m!202579))

(assert (=> b!173865 m!202579))

(assert (=> b!173865 m!202593))

(assert (=> bm!17616 d!52873))

(declare-fun d!52875 () Bool)

(declare-fun e!114840 () Bool)

(assert (=> d!52875 e!114840))

(declare-fun res!82547 () Bool)

(assert (=> d!52875 (=> res!82547 e!114840)))

(declare-fun lt!86087 () Bool)

(assert (=> d!52875 (= res!82547 (not lt!86087))))

(declare-fun lt!86089 () Bool)

(assert (=> d!52875 (= lt!86087 lt!86089)))

(declare-fun lt!86090 () Unit!5314)

(declare-fun e!114841 () Unit!5314)

(assert (=> d!52875 (= lt!86090 e!114841)))

(declare-fun c!31038 () Bool)

(assert (=> d!52875 (= c!31038 lt!86089)))

(assert (=> d!52875 (= lt!86089 (containsKey!189 (toList!1099 lt!85907) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!52875 (= (contains!1154 lt!85907 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!86087)))

(declare-fun b!173866 () Bool)

(declare-fun lt!86088 () Unit!5314)

(assert (=> b!173866 (= e!114841 lt!86088)))

(assert (=> b!173866 (= lt!86088 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85907) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(assert (=> b!173866 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85907) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!173867 () Bool)

(declare-fun Unit!5337 () Unit!5314)

(assert (=> b!173867 (= e!114841 Unit!5337)))

(declare-fun b!173868 () Bool)

(assert (=> b!173868 (= e!114840 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85907) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!52875 c!31038) b!173866))

(assert (= (and d!52875 (not c!31038)) b!173867))

(assert (= (and d!52875 (not res!82547)) b!173868))

(declare-fun m!202595 () Bool)

(assert (=> d!52875 m!202595))

(declare-fun m!202597 () Bool)

(assert (=> b!173866 m!202597))

(assert (=> b!173866 m!201997))

(assert (=> b!173866 m!201997))

(declare-fun m!202599 () Bool)

(assert (=> b!173866 m!202599))

(assert (=> b!173868 m!201997))

(assert (=> b!173868 m!201997))

(assert (=> b!173868 m!202599))

(assert (=> d!52651 d!52875))

(declare-fun b!173869 () Bool)

(declare-fun e!114842 () Option!191)

(assert (=> b!173869 (= e!114842 (Some!190 (_2!1631 (h!2819 lt!85908))))))

(declare-fun b!173872 () Bool)

(declare-fun e!114843 () Option!191)

(assert (=> b!173872 (= e!114843 None!189)))

(declare-fun b!173870 () Bool)

(assert (=> b!173870 (= e!114842 e!114843)))

(declare-fun c!31040 () Bool)

(assert (=> b!173870 (= c!31040 (and ((_ is Cons!2202) lt!85908) (not (= (_1!1631 (h!2819 lt!85908)) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!173871 () Bool)

(assert (=> b!173871 (= e!114843 (getValueByKey!185 (t!7013 lt!85908) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun c!31039 () Bool)

(declare-fun d!52877 () Bool)

(assert (=> d!52877 (= c!31039 (and ((_ is Cons!2202) lt!85908) (= (_1!1631 (h!2819 lt!85908)) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!52877 (= (getValueByKey!185 lt!85908 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) e!114842)))

(assert (= (and d!52877 c!31039) b!173869))

(assert (= (and d!52877 (not c!31039)) b!173870))

(assert (= (and b!173870 c!31040) b!173871))

(assert (= (and b!173870 (not c!31040)) b!173872))

(declare-fun m!202601 () Bool)

(assert (=> b!173871 m!202601))

(assert (=> d!52651 d!52877))

(declare-fun d!52879 () Bool)

(assert (=> d!52879 (= (getValueByKey!185 lt!85908 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!86091 () Unit!5314)

(assert (=> d!52879 (= lt!86091 (choose!931 lt!85908 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun e!114844 () Bool)

(assert (=> d!52879 e!114844))

(declare-fun res!82548 () Bool)

(assert (=> d!52879 (=> (not res!82548) (not e!114844))))

(assert (=> d!52879 (= res!82548 (isStrictlySorted!332 lt!85908))))

(assert (=> d!52879 (= (lemmaContainsTupThenGetReturnValue!98 lt!85908 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!86091)))

(declare-fun b!173873 () Bool)

(declare-fun res!82549 () Bool)

(assert (=> b!173873 (=> (not res!82549) (not e!114844))))

(assert (=> b!173873 (= res!82549 (containsKey!189 lt!85908 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!173874 () Bool)

(assert (=> b!173874 (= e!114844 (contains!1155 lt!85908 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!52879 res!82548) b!173873))

(assert (= (and b!173873 res!82549) b!173874))

(assert (=> d!52879 m!201991))

(declare-fun m!202603 () Bool)

(assert (=> d!52879 m!202603))

(declare-fun m!202605 () Bool)

(assert (=> d!52879 m!202605))

(declare-fun m!202607 () Bool)

(assert (=> b!173873 m!202607))

(declare-fun m!202609 () Bool)

(assert (=> b!173874 m!202609))

(assert (=> d!52651 d!52879))

(declare-fun bm!17623 () Bool)

(declare-fun call!17627 () List!2206)

(declare-fun call!17625 () List!2206)

(assert (=> bm!17623 (= call!17627 call!17625)))

(declare-fun b!173875 () Bool)

(declare-fun c!31044 () Bool)

(declare-fun e!114848 () List!2206)

(declare-fun c!31042 () Bool)

(assert (=> b!173875 (= e!114848 (ite c!31042 (t!7013 (toList!1099 lt!85789)) (ite c!31044 (Cons!2202 (h!2819 (toList!1099 lt!85789)) (t!7013 (toList!1099 lt!85789))) Nil!2203)))))

(declare-fun b!173876 () Bool)

(declare-fun res!82550 () Bool)

(declare-fun e!114849 () Bool)

(assert (=> b!173876 (=> (not res!82550) (not e!114849))))

(declare-fun lt!86092 () List!2206)

(assert (=> b!173876 (= res!82550 (containsKey!189 lt!86092 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!173877 () Bool)

(declare-fun e!114846 () List!2206)

(assert (=> b!173877 (= e!114846 call!17625)))

(declare-fun b!173878 () Bool)

(assert (=> b!173878 (= c!31044 (and ((_ is Cons!2202) (toList!1099 lt!85789)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85789))) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(declare-fun e!114847 () List!2206)

(declare-fun e!114845 () List!2206)

(assert (=> b!173878 (= e!114847 e!114845)))

(declare-fun b!173879 () Bool)

(declare-fun call!17626 () List!2206)

(assert (=> b!173879 (= e!114845 call!17626)))

(declare-fun b!173880 () Bool)

(assert (=> b!173880 (= e!114845 call!17626)))

(declare-fun b!173881 () Bool)

(assert (=> b!173881 (= e!114846 e!114847)))

(assert (=> b!173881 (= c!31042 (and ((_ is Cons!2202) (toList!1099 lt!85789)) (= (_1!1631 (h!2819 (toList!1099 lt!85789))) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(declare-fun bm!17622 () Bool)

(declare-fun c!31041 () Bool)

(assert (=> bm!17622 (= call!17625 ($colon$colon!98 e!114848 (ite c!31041 (h!2819 (toList!1099 lt!85789)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))))

(declare-fun c!31043 () Bool)

(assert (=> bm!17622 (= c!31043 c!31041)))

(declare-fun d!52881 () Bool)

(assert (=> d!52881 e!114849))

(declare-fun res!82551 () Bool)

(assert (=> d!52881 (=> (not res!82551) (not e!114849))))

(assert (=> d!52881 (= res!82551 (isStrictlySorted!332 lt!86092))))

(assert (=> d!52881 (= lt!86092 e!114846)))

(assert (=> d!52881 (= c!31041 (and ((_ is Cons!2202) (toList!1099 lt!85789)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85789))) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!52881 (isStrictlySorted!332 (toList!1099 lt!85789))))

(assert (=> d!52881 (= (insertStrictlySorted!101 (toList!1099 lt!85789) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!86092)))

(declare-fun bm!17624 () Bool)

(assert (=> bm!17624 (= call!17626 call!17627)))

(declare-fun b!173882 () Bool)

(assert (=> b!173882 (= e!114847 call!17627)))

(declare-fun b!173883 () Bool)

(assert (=> b!173883 (= e!114848 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85789)) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!173884 () Bool)

(assert (=> b!173884 (= e!114849 (contains!1155 lt!86092 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!52881 c!31041) b!173877))

(assert (= (and d!52881 (not c!31041)) b!173881))

(assert (= (and b!173881 c!31042) b!173882))

(assert (= (and b!173881 (not c!31042)) b!173878))

(assert (= (and b!173878 c!31044) b!173879))

(assert (= (and b!173878 (not c!31044)) b!173880))

(assert (= (or b!173879 b!173880) bm!17624))

(assert (= (or b!173882 bm!17624) bm!17623))

(assert (= (or b!173877 bm!17623) bm!17622))

(assert (= (and bm!17622 c!31043) b!173883))

(assert (= (and bm!17622 (not c!31043)) b!173875))

(assert (= (and d!52881 res!82551) b!173876))

(assert (= (and b!173876 res!82550) b!173884))

(declare-fun m!202611 () Bool)

(assert (=> b!173884 m!202611))

(declare-fun m!202613 () Bool)

(assert (=> bm!17622 m!202613))

(declare-fun m!202615 () Bool)

(assert (=> b!173883 m!202615))

(declare-fun m!202617 () Bool)

(assert (=> b!173876 m!202617))

(declare-fun m!202619 () Bool)

(assert (=> d!52881 m!202619))

(declare-fun m!202621 () Bool)

(assert (=> d!52881 m!202621))

(assert (=> d!52651 d!52881))

(declare-fun d!52883 () Bool)

(declare-fun e!114850 () Bool)

(assert (=> d!52883 e!114850))

(declare-fun res!82552 () Bool)

(assert (=> d!52883 (=> res!82552 e!114850)))

(declare-fun lt!86093 () Bool)

(assert (=> d!52883 (= res!82552 (not lt!86093))))

(declare-fun lt!86095 () Bool)

(assert (=> d!52883 (= lt!86093 lt!86095)))

(declare-fun lt!86096 () Unit!5314)

(declare-fun e!114851 () Unit!5314)

(assert (=> d!52883 (= lt!86096 e!114851)))

(declare-fun c!31045 () Bool)

(assert (=> d!52883 (= c!31045 lt!86095)))

(assert (=> d!52883 (= lt!86095 (containsKey!189 (toList!1099 lt!85889) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52883 (= (contains!1154 lt!85889 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) lt!86093)))

(declare-fun b!173885 () Bool)

(declare-fun lt!86094 () Unit!5314)

(assert (=> b!173885 (= e!114851 lt!86094)))

(assert (=> b!173885 (= lt!86094 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85889) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173885 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85889) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173886 () Bool)

(declare-fun Unit!5338 () Unit!5314)

(assert (=> b!173886 (= e!114851 Unit!5338)))

(declare-fun b!173887 () Bool)

(assert (=> b!173887 (= e!114850 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85889) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52883 c!31045) b!173885))

(assert (= (and d!52883 (not c!31045)) b!173886))

(assert (= (and d!52883 (not res!82552)) b!173887))

(assert (=> d!52883 m!201737))

(declare-fun m!202623 () Bool)

(assert (=> d!52883 m!202623))

(assert (=> b!173885 m!201737))

(declare-fun m!202625 () Bool)

(assert (=> b!173885 m!202625))

(assert (=> b!173885 m!201737))

(declare-fun m!202627 () Bool)

(assert (=> b!173885 m!202627))

(assert (=> b!173885 m!202627))

(declare-fun m!202629 () Bool)

(assert (=> b!173885 m!202629))

(assert (=> b!173887 m!201737))

(assert (=> b!173887 m!202627))

(assert (=> b!173887 m!202627))

(assert (=> b!173887 m!202629))

(assert (=> b!173497 d!52883))

(declare-fun b!173888 () Bool)

(declare-fun e!114852 () Option!191)

(assert (=> b!173888 (= e!114852 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85998)))))))

(declare-fun b!173891 () Bool)

(declare-fun e!114853 () Option!191)

(assert (=> b!173891 (= e!114853 None!189)))

(declare-fun b!173889 () Bool)

(assert (=> b!173889 (= e!114852 e!114853)))

(declare-fun c!31047 () Bool)

(assert (=> b!173889 (= c!31047 (and ((_ is Cons!2202) (toList!1099 lt!85998)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85998))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))))

(declare-fun b!173890 () Bool)

(assert (=> b!173890 (= e!114853 (getValueByKey!185 (t!7013 (toList!1099 lt!85998)) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun c!31046 () Bool)

(declare-fun d!52885 () Bool)

(assert (=> d!52885 (= c!31046 (and ((_ is Cons!2202) (toList!1099 lt!85998)) (= (_1!1631 (h!2819 (toList!1099 lt!85998))) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(assert (=> d!52885 (= (getValueByKey!185 (toList!1099 lt!85998) (_1!1631 (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))) e!114852)))

(assert (= (and d!52885 c!31046) b!173888))

(assert (= (and d!52885 (not c!31046)) b!173889))

(assert (= (and b!173889 c!31047) b!173890))

(assert (= (and b!173889 (not c!31047)) b!173891))

(declare-fun m!202631 () Bool)

(assert (=> b!173890 m!202631))

(assert (=> b!173697 d!52885))

(declare-fun lt!86097 () Bool)

(declare-fun d!52887 () Bool)

(assert (=> d!52887 (= lt!86097 (select (content!149 (toList!1099 lt!85960)) (tuple2!3241 lt!85838 v!309)))))

(declare-fun e!114855 () Bool)

(assert (=> d!52887 (= lt!86097 e!114855)))

(declare-fun res!82554 () Bool)

(assert (=> d!52887 (=> (not res!82554) (not e!114855))))

(assert (=> d!52887 (= res!82554 ((_ is Cons!2202) (toList!1099 lt!85960)))))

(assert (=> d!52887 (= (contains!1155 (toList!1099 lt!85960) (tuple2!3241 lt!85838 v!309)) lt!86097)))

(declare-fun b!173892 () Bool)

(declare-fun e!114854 () Bool)

(assert (=> b!173892 (= e!114855 e!114854)))

(declare-fun res!82553 () Bool)

(assert (=> b!173892 (=> res!82553 e!114854)))

(assert (=> b!173892 (= res!82553 (= (h!2819 (toList!1099 lt!85960)) (tuple2!3241 lt!85838 v!309)))))

(declare-fun b!173893 () Bool)

(assert (=> b!173893 (= e!114854 (contains!1155 (t!7013 (toList!1099 lt!85960)) (tuple2!3241 lt!85838 v!309)))))

(assert (= (and d!52887 res!82554) b!173892))

(assert (= (and b!173892 (not res!82553)) b!173893))

(declare-fun m!202633 () Bool)

(assert (=> d!52887 m!202633))

(declare-fun m!202635 () Bool)

(assert (=> d!52887 m!202635))

(declare-fun m!202637 () Bool)

(assert (=> b!173893 m!202637))

(assert (=> b!173616 d!52887))

(assert (=> b!173707 d!52777))

(declare-fun d!52889 () Bool)

(declare-fun e!114856 () Bool)

(assert (=> d!52889 e!114856))

(declare-fun res!82555 () Bool)

(assert (=> d!52889 (=> res!82555 e!114856)))

(declare-fun lt!86098 () Bool)

(assert (=> d!52889 (= res!82555 (not lt!86098))))

(declare-fun lt!86100 () Bool)

(assert (=> d!52889 (= lt!86098 lt!86100)))

(declare-fun lt!86101 () Unit!5314)

(declare-fun e!114857 () Unit!5314)

(assert (=> d!52889 (= lt!86101 e!114857)))

(declare-fun c!31048 () Bool)

(assert (=> d!52889 (= c!31048 lt!86100)))

(assert (=> d!52889 (= lt!86100 (containsKey!189 (toList!1099 lt!85889) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52889 (= (contains!1154 lt!85889 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86098)))

(declare-fun b!173894 () Bool)

(declare-fun lt!86099 () Unit!5314)

(assert (=> b!173894 (= e!114857 lt!86099)))

(assert (=> b!173894 (= lt!86099 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85889) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173894 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85889) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173895 () Bool)

(declare-fun Unit!5339 () Unit!5314)

(assert (=> b!173895 (= e!114857 Unit!5339)))

(declare-fun b!173896 () Bool)

(assert (=> b!173896 (= e!114856 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85889) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52889 c!31048) b!173894))

(assert (= (and d!52889 (not c!31048)) b!173895))

(assert (= (and d!52889 (not res!82555)) b!173896))

(declare-fun m!202639 () Bool)

(assert (=> d!52889 m!202639))

(declare-fun m!202641 () Bool)

(assert (=> b!173894 m!202641))

(declare-fun m!202643 () Bool)

(assert (=> b!173894 m!202643))

(assert (=> b!173894 m!202643))

(declare-fun m!202645 () Bool)

(assert (=> b!173894 m!202645))

(assert (=> b!173896 m!202643))

(assert (=> b!173896 m!202643))

(assert (=> b!173896 m!202645))

(assert (=> d!52635 d!52889))

(assert (=> d!52635 d!52621))

(declare-fun d!52891 () Bool)

(declare-fun res!82556 () Bool)

(declare-fun e!114858 () Bool)

(assert (=> d!52891 (=> res!82556 e!114858)))

(assert (=> d!52891 (= res!82556 (and ((_ is Cons!2202) lt!85992) (= (_1!1631 (h!2819 lt!85992)) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!52891 (= (containsKey!189 lt!85992 (_1!1631 (tuple2!3241 key!828 v!309))) e!114858)))

(declare-fun b!173897 () Bool)

(declare-fun e!114859 () Bool)

(assert (=> b!173897 (= e!114858 e!114859)))

(declare-fun res!82557 () Bool)

(assert (=> b!173897 (=> (not res!82557) (not e!114859))))

(assert (=> b!173897 (= res!82557 (and (or (not ((_ is Cons!2202) lt!85992)) (bvsle (_1!1631 (h!2819 lt!85992)) (_1!1631 (tuple2!3241 key!828 v!309)))) ((_ is Cons!2202) lt!85992) (bvslt (_1!1631 (h!2819 lt!85992)) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun b!173898 () Bool)

(assert (=> b!173898 (= e!114859 (containsKey!189 (t!7013 lt!85992) (_1!1631 (tuple2!3241 key!828 v!309))))))

(assert (= (and d!52891 (not res!82556)) b!173897))

(assert (= (and b!173897 res!82557) b!173898))

(declare-fun m!202647 () Bool)

(assert (=> b!173898 m!202647))

(assert (=> b!173674 d!52891))

(declare-fun d!52893 () Bool)

(declare-fun isEmpty!438 (List!2206) Bool)

(assert (=> d!52893 (= (isEmpty!436 lt!85942) (isEmpty!438 (toList!1099 lt!85942)))))

(declare-fun bs!7179 () Bool)

(assert (= bs!7179 d!52893))

(declare-fun m!202649 () Bool)

(assert (=> bs!7179 m!202649))

(assert (=> b!173592 d!52893))

(declare-fun b!173899 () Bool)

(declare-fun e!114860 () Option!191)

(assert (=> b!173899 (= e!114860 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85866)))))))

(declare-fun b!173902 () Bool)

(declare-fun e!114861 () Option!191)

(assert (=> b!173902 (= e!114861 None!189)))

(declare-fun b!173900 () Bool)

(assert (=> b!173900 (= e!114860 e!114861)))

(declare-fun c!31050 () Bool)

(assert (=> b!173900 (= c!31050 (and ((_ is Cons!2202) (toList!1099 lt!85866)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85866))) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))))

(declare-fun b!173901 () Bool)

(assert (=> b!173901 (= e!114861 (getValueByKey!185 (t!7013 (toList!1099 lt!85866)) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun d!52895 () Bool)

(declare-fun c!31049 () Bool)

(assert (=> d!52895 (= c!31049 (and ((_ is Cons!2202) (toList!1099 lt!85866)) (= (_1!1631 (h!2819 (toList!1099 lt!85866))) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(assert (=> d!52895 (= (getValueByKey!185 (toList!1099 lt!85866) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) e!114860)))

(assert (= (and d!52895 c!31049) b!173899))

(assert (= (and d!52895 (not c!31049)) b!173900))

(assert (= (and b!173900 c!31050) b!173901))

(assert (= (and b!173900 (not c!31050)) b!173902))

(declare-fun m!202651 () Bool)

(assert (=> b!173901 m!202651))

(assert (=> b!173464 d!52895))

(declare-fun d!52897 () Bool)

(assert (=> d!52897 (= (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) lt!85796)) (v!3956 (getValueByKey!185 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) lt!85796)))))

(assert (=> d!52647 d!52897))

(declare-fun b!173903 () Bool)

(declare-fun e!114862 () Option!191)

(assert (=> b!173903 (= e!114862 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))))

(declare-fun b!173906 () Bool)

(declare-fun e!114863 () Option!191)

(assert (=> b!173906 (= e!114863 None!189)))

(declare-fun b!173904 () Bool)

(assert (=> b!173904 (= e!114862 e!114863)))

(declare-fun c!31052 () Bool)

(assert (=> b!173904 (= c!31052 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))) lt!85796))))))

(declare-fun b!173905 () Bool)

(assert (=> b!173905 (= e!114863 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))) lt!85796))))

(declare-fun d!52899 () Bool)

(declare-fun c!31051 () Bool)

(assert (=> d!52899 (= c!31051 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))) lt!85796)))))

(assert (=> d!52899 (= (getValueByKey!185 (toList!1099 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) lt!85796) e!114862)))

(assert (= (and d!52899 c!31051) b!173903))

(assert (= (and d!52899 (not c!31051)) b!173904))

(assert (= (and b!173904 c!31052) b!173905))

(assert (= (and b!173904 (not c!31052)) b!173906))

(declare-fun m!202653 () Bool)

(assert (=> b!173905 m!202653))

(assert (=> d!52647 d!52899))

(assert (=> b!173609 d!52659))

(declare-fun d!52901 () Bool)

(declare-fun e!114864 () Bool)

(assert (=> d!52901 e!114864))

(declare-fun res!82558 () Bool)

(assert (=> d!52901 (=> res!82558 e!114864)))

(declare-fun lt!86102 () Bool)

(assert (=> d!52901 (= res!82558 (not lt!86102))))

(declare-fun lt!86104 () Bool)

(assert (=> d!52901 (= lt!86102 lt!86104)))

(declare-fun lt!86105 () Unit!5314)

(declare-fun e!114865 () Unit!5314)

(assert (=> d!52901 (= lt!86105 e!114865)))

(declare-fun c!31053 () Bool)

(assert (=> d!52901 (= c!31053 lt!86104)))

(assert (=> d!52901 (= lt!86104 (containsKey!189 (toList!1099 lt!86018) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (=> d!52901 (= (contains!1154 lt!86018 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)) lt!86102)))

(declare-fun b!173907 () Bool)

(declare-fun lt!86103 () Unit!5314)

(assert (=> b!173907 (= e!114865 lt!86103)))

(assert (=> b!173907 (= lt!86103 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!86018) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (=> b!173907 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86018) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!173908 () Bool)

(declare-fun Unit!5340 () Unit!5314)

(assert (=> b!173908 (= e!114865 Unit!5340)))

(declare-fun b!173909 () Bool)

(assert (=> b!173909 (= e!114864 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86018) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))))

(assert (= (and d!52901 c!31053) b!173907))

(assert (= (and d!52901 (not c!31053)) b!173908))

(assert (= (and d!52901 (not res!82558)) b!173909))

(assert (=> d!52901 m!202223))

(declare-fun m!202655 () Bool)

(assert (=> d!52901 m!202655))

(assert (=> b!173907 m!202223))

(declare-fun m!202657 () Bool)

(assert (=> b!173907 m!202657))

(assert (=> b!173907 m!202223))

(declare-fun m!202659 () Bool)

(assert (=> b!173907 m!202659))

(assert (=> b!173907 m!202659))

(declare-fun m!202661 () Bool)

(assert (=> b!173907 m!202661))

(assert (=> b!173909 m!202223))

(assert (=> b!173909 m!202659))

(assert (=> b!173909 m!202659))

(assert (=> b!173909 m!202661))

(assert (=> b!173733 d!52901))

(declare-fun d!52903 () Bool)

(assert (=> d!52903 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85806) lt!85795)) (v!3956 (getValueByKey!185 (toList!1099 lt!85806) lt!85795)))))

(assert (=> d!52643 d!52903))

(declare-fun b!173910 () Bool)

(declare-fun e!114866 () Option!191)

(assert (=> b!173910 (= e!114866 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85806)))))))

(declare-fun b!173913 () Bool)

(declare-fun e!114867 () Option!191)

(assert (=> b!173913 (= e!114867 None!189)))

(declare-fun b!173911 () Bool)

(assert (=> b!173911 (= e!114866 e!114867)))

(declare-fun c!31055 () Bool)

(assert (=> b!173911 (= c!31055 (and ((_ is Cons!2202) (toList!1099 lt!85806)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85806))) lt!85795))))))

(declare-fun b!173912 () Bool)

(assert (=> b!173912 (= e!114867 (getValueByKey!185 (t!7013 (toList!1099 lt!85806)) lt!85795))))

(declare-fun d!52905 () Bool)

(declare-fun c!31054 () Bool)

(assert (=> d!52905 (= c!31054 (and ((_ is Cons!2202) (toList!1099 lt!85806)) (= (_1!1631 (h!2819 (toList!1099 lt!85806))) lt!85795)))))

(assert (=> d!52905 (= (getValueByKey!185 (toList!1099 lt!85806) lt!85795) e!114866)))

(assert (= (and d!52905 c!31054) b!173910))

(assert (= (and d!52905 (not c!31054)) b!173911))

(assert (= (and b!173911 c!31055) b!173912))

(assert (= (and b!173911 (not c!31055)) b!173913))

(declare-fun m!202663 () Bool)

(assert (=> b!173912 m!202663))

(assert (=> d!52643 d!52905))

(declare-fun b!173914 () Bool)

(declare-fun e!114868 () Option!191)

(assert (=> b!173914 (= e!114868 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!86036)))))))

(declare-fun b!173917 () Bool)

(declare-fun e!114869 () Option!191)

(assert (=> b!173917 (= e!114869 None!189)))

(declare-fun b!173915 () Bool)

(assert (=> b!173915 (= e!114868 e!114869)))

(declare-fun c!31057 () Bool)

(assert (=> b!173915 (= c!31057 (and ((_ is Cons!2202) (toList!1099 lt!86036)) (not (= (_1!1631 (h!2819 (toList!1099 lt!86036))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(declare-fun b!173916 () Bool)

(assert (=> b!173916 (= e!114869 (getValueByKey!185 (t!7013 (toList!1099 lt!86036)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun d!52907 () Bool)

(declare-fun c!31056 () Bool)

(assert (=> d!52907 (= c!31056 (and ((_ is Cons!2202) (toList!1099 lt!86036)) (= (_1!1631 (h!2819 (toList!1099 lt!86036))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> d!52907 (= (getValueByKey!185 (toList!1099 lt!86036) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) e!114868)))

(assert (= (and d!52907 c!31056) b!173914))

(assert (= (and d!52907 (not c!31056)) b!173915))

(assert (= (and b!173915 c!31057) b!173916))

(assert (= (and b!173915 (not c!31057)) b!173917))

(declare-fun m!202665 () Bool)

(assert (=> b!173916 m!202665))

(assert (=> b!173742 d!52907))

(declare-fun d!52909 () Bool)

(declare-fun e!114870 () Bool)

(assert (=> d!52909 e!114870))

(declare-fun res!82559 () Bool)

(assert (=> d!52909 (=> res!82559 e!114870)))

(declare-fun lt!86106 () Bool)

(assert (=> d!52909 (= res!82559 (not lt!86106))))

(declare-fun lt!86108 () Bool)

(assert (=> d!52909 (= lt!86106 lt!86108)))

(declare-fun lt!86109 () Unit!5314)

(declare-fun e!114871 () Unit!5314)

(assert (=> d!52909 (= lt!86109 e!114871)))

(declare-fun c!31058 () Bool)

(assert (=> d!52909 (= c!31058 lt!86108)))

(assert (=> d!52909 (= lt!86108 (containsKey!189 (toList!1099 lt!85919) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52909 (= (contains!1154 lt!85919 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86106)))

(declare-fun b!173918 () Bool)

(declare-fun lt!86107 () Unit!5314)

(assert (=> b!173918 (= e!114871 lt!86107)))

(assert (=> b!173918 (= lt!86107 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85919) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!173918 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85919) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173919 () Bool)

(declare-fun Unit!5341 () Unit!5314)

(assert (=> b!173919 (= e!114871 Unit!5341)))

(declare-fun b!173920 () Bool)

(assert (=> b!173920 (= e!114870 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85919) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52909 c!31058) b!173918))

(assert (= (and d!52909 (not c!31058)) b!173919))

(assert (= (and d!52909 (not res!82559)) b!173920))

(declare-fun m!202667 () Bool)

(assert (=> d!52909 m!202667))

(declare-fun m!202669 () Bool)

(assert (=> b!173918 m!202669))

(assert (=> b!173918 m!202033))

(assert (=> b!173918 m!202033))

(declare-fun m!202671 () Bool)

(assert (=> b!173918 m!202671))

(assert (=> b!173920 m!202033))

(assert (=> b!173920 m!202033))

(assert (=> b!173920 m!202671))

(assert (=> d!52661 d!52909))

(declare-fun b!173921 () Bool)

(declare-fun e!114872 () Option!191)

(assert (=> b!173921 (= e!114872 (Some!190 (_2!1631 (h!2819 lt!85920))))))

(declare-fun b!173924 () Bool)

(declare-fun e!114873 () Option!191)

(assert (=> b!173924 (= e!114873 None!189)))

(declare-fun b!173922 () Bool)

(assert (=> b!173922 (= e!114872 e!114873)))

(declare-fun c!31060 () Bool)

(assert (=> b!173922 (= c!31060 (and ((_ is Cons!2202) lt!85920) (not (= (_1!1631 (h!2819 lt!85920)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173923 () Bool)

(assert (=> b!173923 (= e!114873 (getValueByKey!185 (t!7013 lt!85920) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52911 () Bool)

(declare-fun c!31059 () Bool)

(assert (=> d!52911 (= c!31059 (and ((_ is Cons!2202) lt!85920) (= (_1!1631 (h!2819 lt!85920)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52911 (= (getValueByKey!185 lt!85920 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114872)))

(assert (= (and d!52911 c!31059) b!173921))

(assert (= (and d!52911 (not c!31059)) b!173922))

(assert (= (and b!173922 c!31060) b!173923))

(assert (= (and b!173922 (not c!31060)) b!173924))

(declare-fun m!202673 () Bool)

(assert (=> b!173923 m!202673))

(assert (=> d!52661 d!52911))

(declare-fun d!52913 () Bool)

(assert (=> d!52913 (= (getValueByKey!185 lt!85920 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!86110 () Unit!5314)

(assert (=> d!52913 (= lt!86110 (choose!931 lt!85920 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!114874 () Bool)

(assert (=> d!52913 e!114874))

(declare-fun res!82560 () Bool)

(assert (=> d!52913 (=> (not res!82560) (not e!114874))))

(assert (=> d!52913 (= res!82560 (isStrictlySorted!332 lt!85920))))

(assert (=> d!52913 (= (lemmaContainsTupThenGetReturnValue!98 lt!85920 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86110)))

(declare-fun b!173925 () Bool)

(declare-fun res!82561 () Bool)

(assert (=> b!173925 (=> (not res!82561) (not e!114874))))

(assert (=> b!173925 (= res!82561 (containsKey!189 lt!85920 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173926 () Bool)

(assert (=> b!173926 (= e!114874 (contains!1155 lt!85920 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52913 res!82560) b!173925))

(assert (= (and b!173925 res!82561) b!173926))

(assert (=> d!52913 m!202027))

(declare-fun m!202675 () Bool)

(assert (=> d!52913 m!202675))

(declare-fun m!202677 () Bool)

(assert (=> d!52913 m!202677))

(declare-fun m!202679 () Bool)

(assert (=> b!173925 m!202679))

(declare-fun m!202681 () Bool)

(assert (=> b!173926 m!202681))

(assert (=> d!52661 d!52913))

(declare-fun bm!17626 () Bool)

(declare-fun call!17630 () List!2206)

(declare-fun call!17628 () List!2206)

(assert (=> bm!17626 (= call!17630 call!17628)))

(declare-fun b!173927 () Bool)

(declare-fun c!31062 () Bool)

(declare-fun e!114878 () List!2206)

(declare-fun c!31064 () Bool)

(assert (=> b!173927 (= e!114878 (ite c!31062 (t!7013 (toList!1099 call!17583)) (ite c!31064 (Cons!2202 (h!2819 (toList!1099 call!17583)) (t!7013 (toList!1099 call!17583))) Nil!2203)))))

(declare-fun b!173928 () Bool)

(declare-fun res!82562 () Bool)

(declare-fun e!114879 () Bool)

(assert (=> b!173928 (=> (not res!82562) (not e!114879))))

(declare-fun lt!86111 () List!2206)

(assert (=> b!173928 (= res!82562 (containsKey!189 lt!86111 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173929 () Bool)

(declare-fun e!114876 () List!2206)

(assert (=> b!173929 (= e!114876 call!17628)))

(declare-fun b!173930 () Bool)

(assert (=> b!173930 (= c!31064 (and ((_ is Cons!2202) (toList!1099 call!17583)) (bvsgt (_1!1631 (h!2819 (toList!1099 call!17583))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114877 () List!2206)

(declare-fun e!114875 () List!2206)

(assert (=> b!173930 (= e!114877 e!114875)))

(declare-fun b!173931 () Bool)

(declare-fun call!17629 () List!2206)

(assert (=> b!173931 (= e!114875 call!17629)))

(declare-fun b!173932 () Bool)

(assert (=> b!173932 (= e!114875 call!17629)))

(declare-fun b!173933 () Bool)

(assert (=> b!173933 (= e!114876 e!114877)))

(assert (=> b!173933 (= c!31062 (and ((_ is Cons!2202) (toList!1099 call!17583)) (= (_1!1631 (h!2819 (toList!1099 call!17583))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun c!31061 () Bool)

(declare-fun bm!17625 () Bool)

(assert (=> bm!17625 (= call!17628 ($colon$colon!98 e!114878 (ite c!31061 (h!2819 (toList!1099 call!17583)) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31063 () Bool)

(assert (=> bm!17625 (= c!31063 c!31061)))

(declare-fun d!52915 () Bool)

(assert (=> d!52915 e!114879))

(declare-fun res!82563 () Bool)

(assert (=> d!52915 (=> (not res!82563) (not e!114879))))

(assert (=> d!52915 (= res!82563 (isStrictlySorted!332 lt!86111))))

(assert (=> d!52915 (= lt!86111 e!114876)))

(assert (=> d!52915 (= c!31061 (and ((_ is Cons!2202) (toList!1099 call!17583)) (bvslt (_1!1631 (h!2819 (toList!1099 call!17583))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52915 (isStrictlySorted!332 (toList!1099 call!17583))))

(assert (=> d!52915 (= (insertStrictlySorted!101 (toList!1099 call!17583) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86111)))

(declare-fun bm!17627 () Bool)

(assert (=> bm!17627 (= call!17629 call!17630)))

(declare-fun b!173934 () Bool)

(assert (=> b!173934 (= e!114877 call!17630)))

(declare-fun b!173935 () Bool)

(assert (=> b!173935 (= e!114878 (insertStrictlySorted!101 (t!7013 (toList!1099 call!17583)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173936 () Bool)

(assert (=> b!173936 (= e!114879 (contains!1155 lt!86111 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52915 c!31061) b!173929))

(assert (= (and d!52915 (not c!31061)) b!173933))

(assert (= (and b!173933 c!31062) b!173934))

(assert (= (and b!173933 (not c!31062)) b!173930))

(assert (= (and b!173930 c!31064) b!173931))

(assert (= (and b!173930 (not c!31064)) b!173932))

(assert (= (or b!173931 b!173932) bm!17627))

(assert (= (or b!173934 bm!17627) bm!17626))

(assert (= (or b!173929 bm!17626) bm!17625))

(assert (= (and bm!17625 c!31063) b!173935))

(assert (= (and bm!17625 (not c!31063)) b!173927))

(assert (= (and d!52915 res!82563) b!173928))

(assert (= (and b!173928 res!82562) b!173936))

(declare-fun m!202683 () Bool)

(assert (=> b!173936 m!202683))

(declare-fun m!202685 () Bool)

(assert (=> bm!17625 m!202685))

(declare-fun m!202687 () Bool)

(assert (=> b!173935 m!202687))

(declare-fun m!202689 () Bool)

(assert (=> b!173928 m!202689))

(declare-fun m!202691 () Bool)

(assert (=> d!52915 m!202691))

(declare-fun m!202693 () Bool)

(assert (=> d!52915 m!202693))

(assert (=> d!52661 d!52915))

(declare-fun d!52917 () Bool)

(declare-fun lt!86114 () Bool)

(declare-fun content!150 (List!2208) (InoxSet (_ BitVec 64)))

(assert (=> d!52917 (= lt!86114 (select (content!150 Nil!2205) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114884 () Bool)

(assert (=> d!52917 (= lt!86114 e!114884)))

(declare-fun res!82569 () Bool)

(assert (=> d!52917 (=> (not res!82569) (not e!114884))))

(assert (=> d!52917 (= res!82569 ((_ is Cons!2204) Nil!2205))))

(assert (=> d!52917 (= (contains!1156 Nil!2205 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) lt!86114)))

(declare-fun b!173941 () Bool)

(declare-fun e!114885 () Bool)

(assert (=> b!173941 (= e!114884 e!114885)))

(declare-fun res!82568 () Bool)

(assert (=> b!173941 (=> res!82568 e!114885)))

(assert (=> b!173941 (= res!82568 (= (h!2821 Nil!2205) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173942 () Bool)

(assert (=> b!173942 (= e!114885 (contains!1156 (t!7017 Nil!2205) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52917 res!82569) b!173941))

(assert (= (and b!173941 (not res!82568)) b!173942))

(declare-fun m!202695 () Bool)

(assert (=> d!52917 m!202695))

(assert (=> d!52917 m!201737))

(declare-fun m!202697 () Bool)

(assert (=> d!52917 m!202697))

(assert (=> b!173942 m!201737))

(declare-fun m!202699 () Bool)

(assert (=> b!173942 m!202699))

(assert (=> b!173639 d!52917))

(declare-fun b!173943 () Bool)

(declare-fun e!114886 () Option!191)

(assert (=> b!173943 (= e!114886 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85907)))))))

(declare-fun b!173946 () Bool)

(declare-fun e!114887 () Option!191)

(assert (=> b!173946 (= e!114887 None!189)))

(declare-fun b!173944 () Bool)

(assert (=> b!173944 (= e!114886 e!114887)))

(declare-fun c!31066 () Bool)

(assert (=> b!173944 (= c!31066 (and ((_ is Cons!2202) (toList!1099 lt!85907)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85907))) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!173945 () Bool)

(assert (=> b!173945 (= e!114887 (getValueByKey!185 (t!7013 (toList!1099 lt!85907)) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))))

(declare-fun c!31065 () Bool)

(declare-fun d!52919 () Bool)

(assert (=> d!52919 (= c!31065 (and ((_ is Cons!2202) (toList!1099 lt!85907)) (= (_1!1631 (h!2819 (toList!1099 lt!85907))) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!52919 (= (getValueByKey!185 (toList!1099 lt!85907) (_1!1631 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) e!114886)))

(assert (= (and d!52919 c!31065) b!173943))

(assert (= (and d!52919 (not c!31065)) b!173944))

(assert (= (and b!173944 c!31066) b!173945))

(assert (= (and b!173944 (not c!31066)) b!173946))

(declare-fun m!202701 () Bool)

(assert (=> b!173945 m!202701))

(assert (=> b!173514 d!52919))

(declare-fun d!52921 () Bool)

(declare-fun e!114888 () Bool)

(assert (=> d!52921 e!114888))

(declare-fun res!82570 () Bool)

(assert (=> d!52921 (=> res!82570 e!114888)))

(declare-fun lt!86115 () Bool)

(assert (=> d!52921 (= res!82570 (not lt!86115))))

(declare-fun lt!86117 () Bool)

(assert (=> d!52921 (= lt!86115 lt!86117)))

(declare-fun lt!86118 () Unit!5314)

(declare-fun e!114889 () Unit!5314)

(assert (=> d!52921 (= lt!86118 e!114889)))

(declare-fun c!31067 () Bool)

(assert (=> d!52921 (= c!31067 lt!86117)))

(assert (=> d!52921 (= lt!86117 (containsKey!189 (toList!1099 lt!86036) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(assert (=> d!52921 (= (contains!1154 lt!86036 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) lt!86115)))

(declare-fun b!173947 () Bool)

(declare-fun lt!86116 () Unit!5314)

(assert (=> b!173947 (= e!114889 lt!86116)))

(assert (=> b!173947 (= lt!86116 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!86036) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(assert (=> b!173947 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86036) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun b!173948 () Bool)

(declare-fun Unit!5342 () Unit!5314)

(assert (=> b!173948 (= e!114889 Unit!5342)))

(declare-fun b!173949 () Bool)

(assert (=> b!173949 (= e!114888 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86036) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (= (and d!52921 c!31067) b!173947))

(assert (= (and d!52921 (not c!31067)) b!173948))

(assert (= (and d!52921 (not res!82570)) b!173949))

(declare-fun m!202703 () Bool)

(assert (=> d!52921 m!202703))

(declare-fun m!202705 () Bool)

(assert (=> b!173947 m!202705))

(assert (=> b!173947 m!202387))

(assert (=> b!173947 m!202387))

(declare-fun m!202707 () Bool)

(assert (=> b!173947 m!202707))

(assert (=> b!173949 m!202387))

(assert (=> b!173949 m!202387))

(assert (=> b!173949 m!202707))

(assert (=> d!52765 d!52921))

(declare-fun b!173950 () Bool)

(declare-fun e!114890 () Option!191)

(assert (=> b!173950 (= e!114890 (Some!190 (_2!1631 (h!2819 lt!86037))))))

(declare-fun b!173953 () Bool)

(declare-fun e!114891 () Option!191)

(assert (=> b!173953 (= e!114891 None!189)))

(declare-fun b!173951 () Bool)

(assert (=> b!173951 (= e!114890 e!114891)))

(declare-fun c!31069 () Bool)

(assert (=> b!173951 (= c!31069 (and ((_ is Cons!2202) lt!86037) (not (= (_1!1631 (h!2819 lt!86037)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(declare-fun b!173952 () Bool)

(assert (=> b!173952 (= e!114891 (getValueByKey!185 (t!7013 lt!86037) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun d!52923 () Bool)

(declare-fun c!31068 () Bool)

(assert (=> d!52923 (= c!31068 (and ((_ is Cons!2202) lt!86037) (= (_1!1631 (h!2819 lt!86037)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> d!52923 (= (getValueByKey!185 lt!86037 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) e!114890)))

(assert (= (and d!52923 c!31068) b!173950))

(assert (= (and d!52923 (not c!31068)) b!173951))

(assert (= (and b!173951 c!31069) b!173952))

(assert (= (and b!173951 (not c!31069)) b!173953))

(declare-fun m!202709 () Bool)

(assert (=> b!173952 m!202709))

(assert (=> d!52765 d!52923))

(declare-fun d!52925 () Bool)

(assert (=> d!52925 (= (getValueByKey!185 lt!86037 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun lt!86119 () Unit!5314)

(assert (=> d!52925 (= lt!86119 (choose!931 lt!86037 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun e!114892 () Bool)

(assert (=> d!52925 e!114892))

(declare-fun res!82571 () Bool)

(assert (=> d!52925 (=> (not res!82571) (not e!114892))))

(assert (=> d!52925 (= res!82571 (isStrictlySorted!332 lt!86037))))

(assert (=> d!52925 (= (lemmaContainsTupThenGetReturnValue!98 lt!86037 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) lt!86119)))

(declare-fun b!173954 () Bool)

(declare-fun res!82572 () Bool)

(assert (=> b!173954 (=> (not res!82572) (not e!114892))))

(assert (=> b!173954 (= res!82572 (containsKey!189 lt!86037 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun b!173955 () Bool)

(assert (=> b!173955 (= e!114892 (contains!1155 lt!86037 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (= (and d!52925 res!82571) b!173954))

(assert (= (and b!173954 res!82572) b!173955))

(assert (=> d!52925 m!202381))

(declare-fun m!202711 () Bool)

(assert (=> d!52925 m!202711))

(declare-fun m!202713 () Bool)

(assert (=> d!52925 m!202713))

(declare-fun m!202715 () Bool)

(assert (=> b!173954 m!202715))

(declare-fun m!202717 () Bool)

(assert (=> b!173955 m!202717))

(assert (=> d!52765 d!52925))

(declare-fun bm!17629 () Bool)

(declare-fun call!17633 () List!2206)

(declare-fun call!17631 () List!2206)

(assert (=> bm!17629 (= call!17633 call!17631)))

(declare-fun c!31071 () Bool)

(declare-fun b!173956 () Bool)

(declare-fun e!114896 () List!2206)

(declare-fun c!31073 () Bool)

(assert (=> b!173956 (= e!114896 (ite c!31071 (t!7013 (toList!1099 call!17576)) (ite c!31073 (Cons!2202 (h!2819 (toList!1099 call!17576)) (t!7013 (toList!1099 call!17576))) Nil!2203)))))

(declare-fun b!173957 () Bool)

(declare-fun res!82573 () Bool)

(declare-fun e!114897 () Bool)

(assert (=> b!173957 (=> (not res!82573) (not e!114897))))

(declare-fun lt!86120 () List!2206)

(assert (=> b!173957 (= res!82573 (containsKey!189 lt!86120 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun b!173958 () Bool)

(declare-fun e!114894 () List!2206)

(assert (=> b!173958 (= e!114894 call!17631)))

(declare-fun b!173959 () Bool)

(assert (=> b!173959 (= c!31073 (and ((_ is Cons!2202) (toList!1099 call!17576)) (bvsgt (_1!1631 (h!2819 (toList!1099 call!17576))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun e!114895 () List!2206)

(declare-fun e!114893 () List!2206)

(assert (=> b!173959 (= e!114895 e!114893)))

(declare-fun b!173960 () Bool)

(declare-fun call!17632 () List!2206)

(assert (=> b!173960 (= e!114893 call!17632)))

(declare-fun b!173961 () Bool)

(assert (=> b!173961 (= e!114893 call!17632)))

(declare-fun b!173962 () Bool)

(assert (=> b!173962 (= e!114894 e!114895)))

(assert (=> b!173962 (= c!31071 (and ((_ is Cons!2202) (toList!1099 call!17576)) (= (_1!1631 (h!2819 (toList!1099 call!17576))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(declare-fun bm!17628 () Bool)

(declare-fun c!31070 () Bool)

(assert (=> bm!17628 (= call!17631 ($colon$colon!98 e!114896 (ite c!31070 (h!2819 (toList!1099 call!17576)) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))))

(declare-fun c!31072 () Bool)

(assert (=> bm!17628 (= c!31072 c!31070)))

(declare-fun d!52927 () Bool)

(assert (=> d!52927 e!114897))

(declare-fun res!82574 () Bool)

(assert (=> d!52927 (=> (not res!82574) (not e!114897))))

(assert (=> d!52927 (= res!82574 (isStrictlySorted!332 lt!86120))))

(assert (=> d!52927 (= lt!86120 e!114894)))

(assert (=> d!52927 (= c!31070 (and ((_ is Cons!2202) (toList!1099 call!17576)) (bvslt (_1!1631 (h!2819 (toList!1099 call!17576))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (=> d!52927 (isStrictlySorted!332 (toList!1099 call!17576))))

(assert (=> d!52927 (= (insertStrictlySorted!101 (toList!1099 call!17576) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) lt!86120)))

(declare-fun bm!17630 () Bool)

(assert (=> bm!17630 (= call!17632 call!17633)))

(declare-fun b!173963 () Bool)

(assert (=> b!173963 (= e!114895 call!17633)))

(declare-fun b!173964 () Bool)

(assert (=> b!173964 (= e!114896 (insertStrictlySorted!101 (t!7013 (toList!1099 call!17576)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun b!173965 () Bool)

(assert (=> b!173965 (= e!114897 (contains!1155 lt!86120 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248))))))))

(assert (= (and d!52927 c!31070) b!173958))

(assert (= (and d!52927 (not c!31070)) b!173962))

(assert (= (and b!173962 c!31071) b!173963))

(assert (= (and b!173962 (not c!31071)) b!173959))

(assert (= (and b!173959 c!31073) b!173960))

(assert (= (and b!173959 (not c!31073)) b!173961))

(assert (= (or b!173960 b!173961) bm!17630))

(assert (= (or b!173963 bm!17630) bm!17629))

(assert (= (or b!173958 bm!17629) bm!17628))

(assert (= (and bm!17628 c!31072) b!173964))

(assert (= (and bm!17628 (not c!31072)) b!173956))

(assert (= (and d!52927 res!82574) b!173957))

(assert (= (and b!173957 res!82573) b!173965))

(declare-fun m!202719 () Bool)

(assert (=> b!173965 m!202719))

(declare-fun m!202721 () Bool)

(assert (=> bm!17628 m!202721))

(declare-fun m!202723 () Bool)

(assert (=> b!173964 m!202723))

(declare-fun m!202725 () Bool)

(assert (=> b!173957 m!202725))

(declare-fun m!202727 () Bool)

(assert (=> d!52927 m!202727))

(declare-fun m!202729 () Bool)

(assert (=> d!52927 m!202729))

(assert (=> d!52765 d!52927))

(declare-fun d!52929 () Bool)

(declare-fun lt!86121 () Bool)

(assert (=> d!52929 (= lt!86121 (select (content!150 Nil!2205) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun e!114898 () Bool)

(assert (=> d!52929 (= lt!86121 e!114898)))

(declare-fun res!82576 () Bool)

(assert (=> d!52929 (=> (not res!82576) (not e!114898))))

(assert (=> d!52929 (= res!82576 ((_ is Cons!2204) Nil!2205))))

(assert (=> d!52929 (= (contains!1156 Nil!2205 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)) lt!86121)))

(declare-fun b!173966 () Bool)

(declare-fun e!114899 () Bool)

(assert (=> b!173966 (= e!114898 e!114899)))

(declare-fun res!82575 () Bool)

(assert (=> b!173966 (=> res!82575 e!114899)))

(assert (=> b!173966 (= res!82575 (= (h!2821 Nil!2205) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!173967 () Bool)

(assert (=> b!173967 (= e!114899 (contains!1156 (t!7017 Nil!2205) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (= (and d!52929 res!82576) b!173966))

(assert (= (and b!173966 (not res!82575)) b!173967))

(assert (=> d!52929 m!202695))

(assert (=> d!52929 m!202223))

(declare-fun m!202731 () Bool)

(assert (=> d!52929 m!202731))

(assert (=> b!173967 m!202223))

(declare-fun m!202733 () Bool)

(assert (=> b!173967 m!202733))

(assert (=> b!173644 d!52929))

(declare-fun d!52931 () Bool)

(declare-fun res!82579 () Bool)

(declare-fun e!114901 () Bool)

(assert (=> d!52931 (=> res!82579 e!114901)))

(assert (=> d!52931 (= res!82579 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!52931 (= (arrayNoDuplicates!0 (_keys!5439 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30976 (Cons!2204 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) Nil!2205) Nil!2205)) e!114901)))

(declare-fun b!173968 () Bool)

(declare-fun e!114903 () Bool)

(assert (=> b!173968 (= e!114903 (contains!1156 (ite c!30976 (Cons!2204 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) Nil!2205) Nil!2205) (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!173969 () Bool)

(declare-fun e!114902 () Bool)

(declare-fun e!114900 () Bool)

(assert (=> b!173969 (= e!114902 e!114900)))

(declare-fun c!31074 () Bool)

(assert (=> b!173969 (= c!31074 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!173970 () Bool)

(declare-fun call!17634 () Bool)

(assert (=> b!173970 (= e!114900 call!17634)))

(declare-fun b!173971 () Bool)

(assert (=> b!173971 (= e!114900 call!17634)))

(declare-fun bm!17631 () Bool)

(assert (=> bm!17631 (= call!17634 (arrayNoDuplicates!0 (_keys!5439 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!31074 (Cons!2204 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30976 (Cons!2204 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) Nil!2205) Nil!2205)) (ite c!30976 (Cons!2204 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) Nil!2205) Nil!2205))))))

(declare-fun b!173972 () Bool)

(assert (=> b!173972 (= e!114901 e!114902)))

(declare-fun res!82577 () Bool)

(assert (=> b!173972 (=> (not res!82577) (not e!114902))))

(assert (=> b!173972 (= res!82577 (not e!114903))))

(declare-fun res!82578 () Bool)

(assert (=> b!173972 (=> (not res!82578) (not e!114903))))

(assert (=> b!173972 (= res!82578 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52931 (not res!82579)) b!173972))

(assert (= (and b!173972 res!82578) b!173968))

(assert (= (and b!173972 res!82577) b!173969))

(assert (= (and b!173969 c!31074) b!173971))

(assert (= (and b!173969 (not c!31074)) b!173970))

(assert (= (or b!173971 b!173970) bm!17631))

(assert (=> b!173968 m!202457))

(assert (=> b!173968 m!202457))

(declare-fun m!202735 () Bool)

(assert (=> b!173968 m!202735))

(assert (=> b!173969 m!202457))

(assert (=> b!173969 m!202457))

(assert (=> b!173969 m!202467))

(assert (=> bm!17631 m!202457))

(declare-fun m!202737 () Bool)

(assert (=> bm!17631 m!202737))

(assert (=> b!173972 m!202457))

(assert (=> b!173972 m!202457))

(assert (=> b!173972 m!202467))

(assert (=> bm!17601 d!52931))

(declare-fun d!52933 () Bool)

(declare-fun res!82582 () Bool)

(declare-fun e!114905 () Bool)

(assert (=> d!52933 (=> res!82582 e!114905)))

(assert (=> d!52933 (= res!82582 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!52933 (= (arrayNoDuplicates!0 (_keys!5439 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30977 (Cons!2204 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) Nil!2205) Nil!2205)) e!114905)))

(declare-fun b!173973 () Bool)

(declare-fun e!114907 () Bool)

(assert (=> b!173973 (= e!114907 (contains!1156 (ite c!30977 (Cons!2204 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) Nil!2205) Nil!2205) (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!173974 () Bool)

(declare-fun e!114906 () Bool)

(declare-fun e!114904 () Bool)

(assert (=> b!173974 (= e!114906 e!114904)))

(declare-fun c!31075 () Bool)

(assert (=> b!173974 (= c!31075 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!173975 () Bool)

(declare-fun call!17635 () Bool)

(assert (=> b!173975 (= e!114904 call!17635)))

(declare-fun b!173976 () Bool)

(assert (=> b!173976 (= e!114904 call!17635)))

(declare-fun bm!17632 () Bool)

(assert (=> bm!17632 (= call!17635 (arrayNoDuplicates!0 (_keys!5439 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!31075 (Cons!2204 (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30977 (Cons!2204 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) Nil!2205) Nil!2205)) (ite c!30977 (Cons!2204 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) Nil!2205) Nil!2205))))))

(declare-fun b!173977 () Bool)

(assert (=> b!173977 (= e!114905 e!114906)))

(declare-fun res!82580 () Bool)

(assert (=> b!173977 (=> (not res!82580) (not e!114906))))

(assert (=> b!173977 (= res!82580 (not e!114907))))

(declare-fun res!82581 () Bool)

(assert (=> b!173977 (=> (not res!82581) (not e!114907))))

(assert (=> b!173977 (= res!82581 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52933 (not res!82582)) b!173977))

(assert (= (and b!173977 res!82581) b!173973))

(assert (= (and b!173977 res!82580) b!173974))

(assert (= (and b!173974 c!31075) b!173976))

(assert (= (and b!173974 (not c!31075)) b!173975))

(assert (= (or b!173976 b!173975) bm!17632))

(declare-fun m!202739 () Bool)

(assert (=> b!173973 m!202739))

(assert (=> b!173973 m!202739))

(declare-fun m!202741 () Bool)

(assert (=> b!173973 m!202741))

(assert (=> b!173974 m!202739))

(assert (=> b!173974 m!202739))

(declare-fun m!202743 () Bool)

(assert (=> b!173974 m!202743))

(assert (=> bm!17632 m!202739))

(declare-fun m!202745 () Bool)

(assert (=> bm!17632 m!202745))

(assert (=> b!173977 m!202739))

(assert (=> b!173977 m!202739))

(assert (=> b!173977 m!202743))

(assert (=> bm!17602 d!52933))

(declare-fun d!52935 () Bool)

(declare-fun e!114908 () Bool)

(assert (=> d!52935 e!114908))

(declare-fun res!82583 () Bool)

(assert (=> d!52935 (=> res!82583 e!114908)))

(declare-fun lt!86122 () Bool)

(assert (=> d!52935 (= res!82583 (not lt!86122))))

(declare-fun lt!86124 () Bool)

(assert (=> d!52935 (= lt!86122 lt!86124)))

(declare-fun lt!86125 () Unit!5314)

(declare-fun e!114909 () Unit!5314)

(assert (=> d!52935 (= lt!86125 e!114909)))

(declare-fun c!31076 () Bool)

(assert (=> d!52935 (= c!31076 lt!86124)))

(assert (=> d!52935 (= lt!86124 (containsKey!189 (toList!1099 lt!85960) (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(assert (=> d!52935 (= (contains!1154 lt!85960 (_1!1631 (tuple2!3241 lt!85838 v!309))) lt!86122)))

(declare-fun b!173978 () Bool)

(declare-fun lt!86123 () Unit!5314)

(assert (=> b!173978 (= e!114909 lt!86123)))

(assert (=> b!173978 (= lt!86123 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85960) (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(assert (=> b!173978 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85960) (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun b!173979 () Bool)

(declare-fun Unit!5343 () Unit!5314)

(assert (=> b!173979 (= e!114909 Unit!5343)))

(declare-fun b!173980 () Bool)

(assert (=> b!173980 (= e!114908 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85960) (_1!1631 (tuple2!3241 lt!85838 v!309)))))))

(assert (= (and d!52935 c!31076) b!173978))

(assert (= (and d!52935 (not c!31076)) b!173979))

(assert (= (and d!52935 (not res!82583)) b!173980))

(declare-fun m!202747 () Bool)

(assert (=> d!52935 m!202747))

(declare-fun m!202749 () Bool)

(assert (=> b!173978 m!202749))

(assert (=> b!173978 m!202135))

(assert (=> b!173978 m!202135))

(declare-fun m!202751 () Bool)

(assert (=> b!173978 m!202751))

(assert (=> b!173980 m!202135))

(assert (=> b!173980 m!202135))

(assert (=> b!173980 m!202751))

(assert (=> d!52695 d!52935))

(declare-fun b!173981 () Bool)

(declare-fun e!114910 () Option!191)

(assert (=> b!173981 (= e!114910 (Some!190 (_2!1631 (h!2819 lt!85961))))))

(declare-fun b!173984 () Bool)

(declare-fun e!114911 () Option!191)

(assert (=> b!173984 (= e!114911 None!189)))

(declare-fun b!173982 () Bool)

(assert (=> b!173982 (= e!114910 e!114911)))

(declare-fun c!31078 () Bool)

(assert (=> b!173982 (= c!31078 (and ((_ is Cons!2202) lt!85961) (not (= (_1!1631 (h!2819 lt!85961)) (_1!1631 (tuple2!3241 lt!85838 v!309))))))))

(declare-fun b!173983 () Bool)

(assert (=> b!173983 (= e!114911 (getValueByKey!185 (t!7013 lt!85961) (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun d!52937 () Bool)

(declare-fun c!31077 () Bool)

(assert (=> d!52937 (= c!31077 (and ((_ is Cons!2202) lt!85961) (= (_1!1631 (h!2819 lt!85961)) (_1!1631 (tuple2!3241 lt!85838 v!309)))))))

(assert (=> d!52937 (= (getValueByKey!185 lt!85961 (_1!1631 (tuple2!3241 lt!85838 v!309))) e!114910)))

(assert (= (and d!52937 c!31077) b!173981))

(assert (= (and d!52937 (not c!31077)) b!173982))

(assert (= (and b!173982 c!31078) b!173983))

(assert (= (and b!173982 (not c!31078)) b!173984))

(declare-fun m!202753 () Bool)

(assert (=> b!173983 m!202753))

(assert (=> d!52695 d!52937))

(declare-fun d!52939 () Bool)

(assert (=> d!52939 (= (getValueByKey!185 lt!85961 (_1!1631 (tuple2!3241 lt!85838 v!309))) (Some!190 (_2!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun lt!86126 () Unit!5314)

(assert (=> d!52939 (= lt!86126 (choose!931 lt!85961 (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun e!114912 () Bool)

(assert (=> d!52939 e!114912))

(declare-fun res!82584 () Bool)

(assert (=> d!52939 (=> (not res!82584) (not e!114912))))

(assert (=> d!52939 (= res!82584 (isStrictlySorted!332 lt!85961))))

(assert (=> d!52939 (= (lemmaContainsTupThenGetReturnValue!98 lt!85961 (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309))) lt!86126)))

(declare-fun b!173985 () Bool)

(declare-fun res!82585 () Bool)

(assert (=> b!173985 (=> (not res!82585) (not e!114912))))

(assert (=> b!173985 (= res!82585 (containsKey!189 lt!85961 (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun b!173986 () Bool)

(assert (=> b!173986 (= e!114912 (contains!1155 lt!85961 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309)))))))

(assert (= (and d!52939 res!82584) b!173985))

(assert (= (and b!173985 res!82585) b!173986))

(assert (=> d!52939 m!202129))

(declare-fun m!202755 () Bool)

(assert (=> d!52939 m!202755))

(declare-fun m!202757 () Bool)

(assert (=> d!52939 m!202757))

(declare-fun m!202759 () Bool)

(assert (=> b!173985 m!202759))

(declare-fun m!202761 () Bool)

(assert (=> b!173986 m!202761))

(assert (=> d!52695 d!52939))

(declare-fun bm!17634 () Bool)

(declare-fun call!17638 () List!2206)

(declare-fun call!17636 () List!2206)

(assert (=> bm!17634 (= call!17638 call!17636)))

(declare-fun e!114916 () List!2206)

(declare-fun c!31082 () Bool)

(declare-fun b!173987 () Bool)

(declare-fun c!31080 () Bool)

(assert (=> b!173987 (= e!114916 (ite c!31080 (t!7013 (toList!1099 lt!85834)) (ite c!31082 (Cons!2202 (h!2819 (toList!1099 lt!85834)) (t!7013 (toList!1099 lt!85834))) Nil!2203)))))

(declare-fun b!173988 () Bool)

(declare-fun res!82586 () Bool)

(declare-fun e!114917 () Bool)

(assert (=> b!173988 (=> (not res!82586) (not e!114917))))

(declare-fun lt!86127 () List!2206)

(assert (=> b!173988 (= res!82586 (containsKey!189 lt!86127 (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun b!173989 () Bool)

(declare-fun e!114914 () List!2206)

(assert (=> b!173989 (= e!114914 call!17636)))

(declare-fun b!173990 () Bool)

(assert (=> b!173990 (= c!31082 (and ((_ is Cons!2202) (toList!1099 lt!85834)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85834))) (_1!1631 (tuple2!3241 lt!85838 v!309)))))))

(declare-fun e!114915 () List!2206)

(declare-fun e!114913 () List!2206)

(assert (=> b!173990 (= e!114915 e!114913)))

(declare-fun b!173991 () Bool)

(declare-fun call!17637 () List!2206)

(assert (=> b!173991 (= e!114913 call!17637)))

(declare-fun b!173992 () Bool)

(assert (=> b!173992 (= e!114913 call!17637)))

(declare-fun b!173993 () Bool)

(assert (=> b!173993 (= e!114914 e!114915)))

(assert (=> b!173993 (= c!31080 (and ((_ is Cons!2202) (toList!1099 lt!85834)) (= (_1!1631 (h!2819 (toList!1099 lt!85834))) (_1!1631 (tuple2!3241 lt!85838 v!309)))))))

(declare-fun c!31079 () Bool)

(declare-fun bm!17633 () Bool)

(assert (=> bm!17633 (= call!17636 ($colon$colon!98 e!114916 (ite c!31079 (h!2819 (toList!1099 lt!85834)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309))))))))

(declare-fun c!31081 () Bool)

(assert (=> bm!17633 (= c!31081 c!31079)))

(declare-fun d!52941 () Bool)

(assert (=> d!52941 e!114917))

(declare-fun res!82587 () Bool)

(assert (=> d!52941 (=> (not res!82587) (not e!114917))))

(assert (=> d!52941 (= res!82587 (isStrictlySorted!332 lt!86127))))

(assert (=> d!52941 (= lt!86127 e!114914)))

(assert (=> d!52941 (= c!31079 (and ((_ is Cons!2202) (toList!1099 lt!85834)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85834))) (_1!1631 (tuple2!3241 lt!85838 v!309)))))))

(assert (=> d!52941 (isStrictlySorted!332 (toList!1099 lt!85834))))

(assert (=> d!52941 (= (insertStrictlySorted!101 (toList!1099 lt!85834) (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309))) lt!86127)))

(declare-fun bm!17635 () Bool)

(assert (=> bm!17635 (= call!17637 call!17638)))

(declare-fun b!173994 () Bool)

(assert (=> b!173994 (= e!114915 call!17638)))

(declare-fun b!173995 () Bool)

(assert (=> b!173995 (= e!114916 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85834)) (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun b!173996 () Bool)

(assert (=> b!173996 (= e!114917 (contains!1155 lt!86127 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85838 v!309)) (_2!1631 (tuple2!3241 lt!85838 v!309)))))))

(assert (= (and d!52941 c!31079) b!173989))

(assert (= (and d!52941 (not c!31079)) b!173993))

(assert (= (and b!173993 c!31080) b!173994))

(assert (= (and b!173993 (not c!31080)) b!173990))

(assert (= (and b!173990 c!31082) b!173991))

(assert (= (and b!173990 (not c!31082)) b!173992))

(assert (= (or b!173991 b!173992) bm!17635))

(assert (= (or b!173994 bm!17635) bm!17634))

(assert (= (or b!173989 bm!17634) bm!17633))

(assert (= (and bm!17633 c!31081) b!173995))

(assert (= (and bm!17633 (not c!31081)) b!173987))

(assert (= (and d!52941 res!82587) b!173988))

(assert (= (and b!173988 res!82586) b!173996))

(declare-fun m!202763 () Bool)

(assert (=> b!173996 m!202763))

(declare-fun m!202765 () Bool)

(assert (=> bm!17633 m!202765))

(declare-fun m!202767 () Bool)

(assert (=> b!173995 m!202767))

(declare-fun m!202769 () Bool)

(assert (=> b!173988 m!202769))

(declare-fun m!202771 () Bool)

(assert (=> d!52941 m!202771))

(declare-fun m!202773 () Bool)

(assert (=> d!52941 m!202773))

(assert (=> d!52695 d!52941))

(declare-fun d!52943 () Bool)

(assert (=> d!52943 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3956 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52673 d!52943))

(declare-fun b!173997 () Bool)

(declare-fun e!114918 () Option!191)

(assert (=> b!173997 (= e!114918 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85825)))))))

(declare-fun b!174000 () Bool)

(declare-fun e!114919 () Option!191)

(assert (=> b!174000 (= e!114919 None!189)))

(declare-fun b!173998 () Bool)

(assert (=> b!173998 (= e!114918 e!114919)))

(declare-fun c!31084 () Bool)

(assert (=> b!173998 (= c!31084 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85825))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173999 () Bool)

(assert (=> b!173999 (= e!114919 (getValueByKey!185 (t!7013 (toList!1099 lt!85825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52945 () Bool)

(declare-fun c!31083 () Bool)

(assert (=> d!52945 (= c!31083 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (= (_1!1631 (h!2819 (toList!1099 lt!85825))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52945 (= (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000) e!114918)))

(assert (= (and d!52945 c!31083) b!173997))

(assert (= (and d!52945 (not c!31083)) b!173998))

(assert (= (and b!173998 c!31084) b!173999))

(assert (= (and b!173998 (not c!31084)) b!174000))

(declare-fun m!202775 () Bool)

(assert (=> b!173999 m!202775))

(assert (=> d!52673 d!52945))

(declare-fun d!52947 () Bool)

(assert (=> d!52947 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86128 () Unit!5314)

(assert (=> d!52947 (= lt!86128 (choose!932 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114920 () Bool)

(assert (=> d!52947 e!114920))

(declare-fun res!82588 () Bool)

(assert (=> d!52947 (=> (not res!82588) (not e!114920))))

(assert (=> d!52947 (= res!82588 (isStrictlySorted!332 (toList!1099 lt!85825)))))

(assert (=> d!52947 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000) lt!86128)))

(declare-fun b!174001 () Bool)

(assert (=> b!174001 (= e!114920 (containsKey!189 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52947 res!82588) b!174001))

(assert (=> d!52947 m!202085))

(assert (=> d!52947 m!202085))

(assert (=> d!52947 m!202087))

(declare-fun m!202777 () Bool)

(assert (=> d!52947 m!202777))

(declare-fun m!202779 () Bool)

(assert (=> d!52947 m!202779))

(assert (=> b!174001 m!202081))

(assert (=> b!173585 d!52947))

(declare-fun d!52949 () Bool)

(assert (=> d!52949 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7180 () Bool)

(assert (= bs!7180 d!52949))

(assert (=> bs!7180 m!202085))

(declare-fun m!202781 () Bool)

(assert (=> bs!7180 m!202781))

(assert (=> b!173585 d!52949))

(declare-fun b!174002 () Bool)

(declare-fun e!114921 () Option!191)

(assert (=> b!174002 (= e!114921 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85825)))))))

(declare-fun b!174005 () Bool)

(declare-fun e!114922 () Option!191)

(assert (=> b!174005 (= e!114922 None!189)))

(declare-fun b!174003 () Bool)

(assert (=> b!174003 (= e!114921 e!114922)))

(declare-fun c!31086 () Bool)

(assert (=> b!174003 (= c!31086 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85825))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!174004 () Bool)

(assert (=> b!174004 (= e!114922 (getValueByKey!185 (t!7013 (toList!1099 lt!85825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!52951 () Bool)

(declare-fun c!31085 () Bool)

(assert (=> d!52951 (= c!31085 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (= (_1!1631 (h!2819 (toList!1099 lt!85825))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52951 (= (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000) e!114921)))

(assert (= (and d!52951 c!31085) b!174002))

(assert (= (and d!52951 (not c!31085)) b!174003))

(assert (= (and b!174003 c!31086) b!174004))

(assert (= (and b!174003 (not c!31086)) b!174005))

(declare-fun m!202783 () Bool)

(assert (=> b!174004 m!202783))

(assert (=> b!173585 d!52951))

(declare-fun d!52953 () Bool)

(declare-fun e!114923 () Bool)

(assert (=> d!52953 e!114923))

(declare-fun res!82589 () Bool)

(assert (=> d!52953 (=> res!82589 e!114923)))

(declare-fun lt!86129 () Bool)

(assert (=> d!52953 (= res!82589 (not lt!86129))))

(declare-fun lt!86131 () Bool)

(assert (=> d!52953 (= lt!86129 lt!86131)))

(declare-fun lt!86132 () Unit!5314)

(declare-fun e!114924 () Unit!5314)

(assert (=> d!52953 (= lt!86132 e!114924)))

(declare-fun c!31087 () Bool)

(assert (=> d!52953 (= c!31087 lt!86131)))

(assert (=> d!52953 (= lt!86131 (containsKey!189 (toList!1099 lt!85866) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(assert (=> d!52953 (= (contains!1154 lt!85866 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) lt!86129)))

(declare-fun b!174006 () Bool)

(declare-fun lt!86130 () Unit!5314)

(assert (=> b!174006 (= e!114924 lt!86130)))

(assert (=> b!174006 (= lt!86130 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85866) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(assert (=> b!174006 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85866) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun b!174007 () Bool)

(declare-fun Unit!5344 () Unit!5314)

(assert (=> b!174007 (= e!114924 Unit!5344)))

(declare-fun b!174008 () Bool)

(assert (=> b!174008 (= e!114923 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85866) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(assert (= (and d!52953 c!31087) b!174006))

(assert (= (and d!52953 (not c!31087)) b!174007))

(assert (= (and d!52953 (not res!82589)) b!174008))

(declare-fun m!202785 () Bool)

(assert (=> d!52953 m!202785))

(declare-fun m!202787 () Bool)

(assert (=> b!174006 m!202787))

(assert (=> b!174006 m!201909))

(assert (=> b!174006 m!201909))

(declare-fun m!202789 () Bool)

(assert (=> b!174006 m!202789))

(assert (=> b!174008 m!201909))

(assert (=> b!174008 m!201909))

(assert (=> b!174008 m!202789))

(assert (=> d!52625 d!52953))

(declare-fun b!174009 () Bool)

(declare-fun e!114925 () Option!191)

(assert (=> b!174009 (= e!114925 (Some!190 (_2!1631 (h!2819 lt!85867))))))

(declare-fun b!174012 () Bool)

(declare-fun e!114926 () Option!191)

(assert (=> b!174012 (= e!114926 None!189)))

(declare-fun b!174010 () Bool)

(assert (=> b!174010 (= e!114925 e!114926)))

(declare-fun c!31089 () Bool)

(assert (=> b!174010 (= c!31089 (and ((_ is Cons!2202) lt!85867) (not (= (_1!1631 (h!2819 lt!85867)) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))))

(declare-fun b!174011 () Bool)

(assert (=> b!174011 (= e!114926 (getValueByKey!185 (t!7013 lt!85867) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun d!52955 () Bool)

(declare-fun c!31088 () Bool)

(assert (=> d!52955 (= c!31088 (and ((_ is Cons!2202) lt!85867) (= (_1!1631 (h!2819 lt!85867)) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(assert (=> d!52955 (= (getValueByKey!185 lt!85867 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) e!114925)))

(assert (= (and d!52955 c!31088) b!174009))

(assert (= (and d!52955 (not c!31088)) b!174010))

(assert (= (and b!174010 c!31089) b!174011))

(assert (= (and b!174010 (not c!31089)) b!174012))

(declare-fun m!202791 () Bool)

(assert (=> b!174011 m!202791))

(assert (=> d!52625 d!52955))

(declare-fun d!52957 () Bool)

(assert (=> d!52957 (= (getValueByKey!185 lt!85867 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun lt!86133 () Unit!5314)

(assert (=> d!52957 (= lt!86133 (choose!931 lt!85867 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun e!114927 () Bool)

(assert (=> d!52957 e!114927))

(declare-fun res!82590 () Bool)

(assert (=> d!52957 (=> (not res!82590) (not e!114927))))

(assert (=> d!52957 (= res!82590 (isStrictlySorted!332 lt!85867))))

(assert (=> d!52957 (= (lemmaContainsTupThenGetReturnValue!98 lt!85867 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) lt!86133)))

(declare-fun b!174013 () Bool)

(declare-fun res!82591 () Bool)

(assert (=> b!174013 (=> (not res!82591) (not e!114927))))

(assert (=> b!174013 (= res!82591 (containsKey!189 lt!85867 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun b!174014 () Bool)

(assert (=> b!174014 (= e!114927 (contains!1155 lt!85867 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(assert (= (and d!52957 res!82590) b!174013))

(assert (= (and b!174013 res!82591) b!174014))

(assert (=> d!52957 m!201903))

(declare-fun m!202793 () Bool)

(assert (=> d!52957 m!202793))

(declare-fun m!202795 () Bool)

(assert (=> d!52957 m!202795))

(declare-fun m!202797 () Bool)

(assert (=> b!174013 m!202797))

(declare-fun m!202799 () Bool)

(assert (=> b!174014 m!202799))

(assert (=> d!52625 d!52957))

(declare-fun bm!17637 () Bool)

(declare-fun call!17641 () List!2206)

(declare-fun call!17639 () List!2206)

(assert (=> bm!17637 (= call!17641 call!17639)))

(declare-fun c!31091 () Bool)

(declare-fun c!31093 () Bool)

(declare-fun b!174015 () Bool)

(declare-fun e!114931 () List!2206)

(assert (=> b!174015 (= e!114931 (ite c!31091 (t!7013 (toList!1099 lt!85792)) (ite c!31093 (Cons!2202 (h!2819 (toList!1099 lt!85792)) (t!7013 (toList!1099 lt!85792))) Nil!2203)))))

(declare-fun b!174016 () Bool)

(declare-fun res!82592 () Bool)

(declare-fun e!114932 () Bool)

(assert (=> b!174016 (=> (not res!82592) (not e!114932))))

(declare-fun lt!86134 () List!2206)

(assert (=> b!174016 (= res!82592 (containsKey!189 lt!86134 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun b!174017 () Bool)

(declare-fun e!114929 () List!2206)

(assert (=> b!174017 (= e!114929 call!17639)))

(declare-fun b!174018 () Bool)

(assert (=> b!174018 (= c!31093 (and ((_ is Cons!2202) (toList!1099 lt!85792)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85792))) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(declare-fun e!114930 () List!2206)

(declare-fun e!114928 () List!2206)

(assert (=> b!174018 (= e!114930 e!114928)))

(declare-fun b!174019 () Bool)

(declare-fun call!17640 () List!2206)

(assert (=> b!174019 (= e!114928 call!17640)))

(declare-fun b!174020 () Bool)

(assert (=> b!174020 (= e!114928 call!17640)))

(declare-fun b!174021 () Bool)

(assert (=> b!174021 (= e!114929 e!114930)))

(assert (=> b!174021 (= c!31091 (and ((_ is Cons!2202) (toList!1099 lt!85792)) (= (_1!1631 (h!2819 (toList!1099 lt!85792))) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(declare-fun c!31090 () Bool)

(declare-fun bm!17636 () Bool)

(assert (=> bm!17636 (= call!17639 ($colon$colon!98 e!114931 (ite c!31090 (h!2819 (toList!1099 lt!85792)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))))

(declare-fun c!31092 () Bool)

(assert (=> bm!17636 (= c!31092 c!31090)))

(declare-fun d!52959 () Bool)

(assert (=> d!52959 e!114932))

(declare-fun res!82593 () Bool)

(assert (=> d!52959 (=> (not res!82593) (not e!114932))))

(assert (=> d!52959 (= res!82593 (isStrictlySorted!332 lt!86134))))

(assert (=> d!52959 (= lt!86134 e!114929)))

(assert (=> d!52959 (= c!31090 (and ((_ is Cons!2202) (toList!1099 lt!85792)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85792))) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(assert (=> d!52959 (isStrictlySorted!332 (toList!1099 lt!85792))))

(assert (=> d!52959 (= (insertStrictlySorted!101 (toList!1099 lt!85792) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))) lt!86134)))

(declare-fun bm!17638 () Bool)

(assert (=> bm!17638 (= call!17640 call!17641)))

(declare-fun b!174022 () Bool)

(assert (=> b!174022 (= e!114930 call!17641)))

(declare-fun b!174023 () Bool)

(assert (=> b!174023 (= e!114931 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85792)) (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248)))))))

(declare-fun b!174024 () Bool)

(assert (=> b!174024 (= e!114932 (contains!1155 lt!86134 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))))))))

(assert (= (and d!52959 c!31090) b!174017))

(assert (= (and d!52959 (not c!31090)) b!174021))

(assert (= (and b!174021 c!31091) b!174022))

(assert (= (and b!174021 (not c!31091)) b!174018))

(assert (= (and b!174018 c!31093) b!174019))

(assert (= (and b!174018 (not c!31093)) b!174020))

(assert (= (or b!174019 b!174020) bm!17638))

(assert (= (or b!174022 bm!17638) bm!17637))

(assert (= (or b!174017 bm!17637) bm!17636))

(assert (= (and bm!17636 c!31092) b!174023))

(assert (= (and bm!17636 (not c!31092)) b!174015))

(assert (= (and d!52959 res!82593) b!174016))

(assert (= (and b!174016 res!82592) b!174024))

(declare-fun m!202801 () Bool)

(assert (=> b!174024 m!202801))

(declare-fun m!202803 () Bool)

(assert (=> bm!17636 m!202803))

(declare-fun m!202805 () Bool)

(assert (=> b!174023 m!202805))

(declare-fun m!202807 () Bool)

(assert (=> b!174016 m!202807))

(declare-fun m!202809 () Bool)

(assert (=> d!52959 m!202809))

(declare-fun m!202811 () Bool)

(assert (=> d!52959 m!202811))

(assert (=> d!52625 d!52959))

(declare-fun d!52961 () Bool)

(declare-fun e!114933 () Bool)

(assert (=> d!52961 e!114933))

(declare-fun res!82594 () Bool)

(assert (=> d!52961 (=> res!82594 e!114933)))

(declare-fun lt!86135 () Bool)

(assert (=> d!52961 (= res!82594 (not lt!86135))))

(declare-fun lt!86137 () Bool)

(assert (=> d!52961 (= lt!86135 lt!86137)))

(declare-fun lt!86138 () Unit!5314)

(declare-fun e!114934 () Unit!5314)

(assert (=> d!52961 (= lt!86138 e!114934)))

(declare-fun c!31094 () Bool)

(assert (=> d!52961 (= c!31094 lt!86137)))

(assert (=> d!52961 (= lt!86137 (containsKey!189 (toList!1099 lt!85942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52961 (= (contains!1154 lt!85942 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86135)))

(declare-fun b!174025 () Bool)

(declare-fun lt!86136 () Unit!5314)

(assert (=> b!174025 (= e!114934 lt!86136)))

(assert (=> b!174025 (= lt!86136 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174025 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85942) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174026 () Bool)

(declare-fun Unit!5345 () Unit!5314)

(assert (=> b!174026 (= e!114934 Unit!5345)))

(declare-fun b!174027 () Bool)

(assert (=> b!174027 (= e!114933 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52961 c!31094) b!174025))

(assert (= (and d!52961 (not c!31094)) b!174026))

(assert (= (and d!52961 (not res!82594)) b!174027))

(declare-fun m!202813 () Bool)

(assert (=> d!52961 m!202813))

(declare-fun m!202815 () Bool)

(assert (=> b!174025 m!202815))

(declare-fun m!202817 () Bool)

(assert (=> b!174025 m!202817))

(assert (=> b!174025 m!202817))

(declare-fun m!202819 () Bool)

(assert (=> b!174025 m!202819))

(assert (=> b!174027 m!202817))

(assert (=> b!174027 m!202817))

(assert (=> b!174027 m!202819))

(assert (=> b!173589 d!52961))

(declare-fun d!52963 () Bool)

(declare-fun res!82595 () Bool)

(declare-fun e!114935 () Bool)

(assert (=> d!52963 (=> res!82595 e!114935)))

(assert (=> d!52963 (= res!82595 (and ((_ is Cons!2202) lt!85818) (= (_1!1631 (h!2819 lt!85818)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52963 (= (containsKey!189 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114935)))

(declare-fun b!174028 () Bool)

(declare-fun e!114936 () Bool)

(assert (=> b!174028 (= e!114935 e!114936)))

(declare-fun res!82596 () Bool)

(assert (=> b!174028 (=> (not res!82596) (not e!114936))))

(assert (=> b!174028 (= res!82596 (and (or (not ((_ is Cons!2202) lt!85818)) (bvsle (_1!1631 (h!2819 lt!85818)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2202) lt!85818) (bvslt (_1!1631 (h!2819 lt!85818)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174029 () Bool)

(assert (=> b!174029 (= e!114936 (containsKey!189 (t!7013 lt!85818) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52963 (not res!82595)) b!174028))

(assert (= (and b!174028 res!82596) b!174029))

(declare-fun m!202821 () Bool)

(assert (=> b!174029 m!202821))

(assert (=> b!173545 d!52963))

(declare-fun d!52965 () Bool)

(assert (=> d!52965 (= (apply!130 lt!86018 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1969 (getValueByKey!185 (toList!1099 lt!86018) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7181 () Bool)

(assert (= bs!7181 d!52965))

(declare-fun m!202823 () Bool)

(assert (=> bs!7181 m!202823))

(assert (=> bs!7181 m!202823))

(declare-fun m!202825 () Bool)

(assert (=> bs!7181 m!202825))

(assert (=> b!173724 d!52965))

(declare-fun d!52967 () Bool)

(assert (=> d!52967 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!86139 () Unit!5314)

(assert (=> d!52967 (= lt!86139 (choose!932 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114937 () Bool)

(assert (=> d!52967 e!114937))

(declare-fun res!82597 () Bool)

(assert (=> d!52967 (=> (not res!82597) (not e!114937))))

(assert (=> d!52967 (= res!82597 (isStrictlySorted!332 (toList!1099 lt!85825)))))

(assert (=> d!52967 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) lt!86139)))

(declare-fun b!174030 () Bool)

(assert (=> b!174030 (= e!114937 (containsKey!189 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52967 res!82597) b!174030))

(assert (=> d!52967 m!201737))

(assert (=> d!52967 m!201881))

(assert (=> d!52967 m!201881))

(assert (=> d!52967 m!202237))

(assert (=> d!52967 m!201737))

(declare-fun m!202827 () Bool)

(assert (=> d!52967 m!202827))

(assert (=> d!52967 m!202779))

(assert (=> b!174030 m!201737))

(assert (=> b!174030 m!202233))

(assert (=> b!173661 d!52967))

(declare-fun d!52969 () Bool)

(assert (=> d!52969 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7182 () Bool)

(assert (= bs!7182 d!52969))

(assert (=> bs!7182 m!201881))

(declare-fun m!202829 () Bool)

(assert (=> bs!7182 m!202829))

(assert (=> b!173661 d!52969))

(declare-fun b!174031 () Bool)

(declare-fun e!114938 () Option!191)

(assert (=> b!174031 (= e!114938 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85825)))))))

(declare-fun b!174034 () Bool)

(declare-fun e!114939 () Option!191)

(assert (=> b!174034 (= e!114939 None!189)))

(declare-fun b!174032 () Bool)

(assert (=> b!174032 (= e!114938 e!114939)))

(declare-fun c!31096 () Bool)

(assert (=> b!174032 (= c!31096 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85825))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!174033 () Bool)

(assert (=> b!174033 (= e!114939 (getValueByKey!185 (t!7013 (toList!1099 lt!85825)) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!52971 () Bool)

(declare-fun c!31095 () Bool)

(assert (=> d!52971 (= c!31095 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (= (_1!1631 (h!2819 (toList!1099 lt!85825))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52971 (= (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) e!114938)))

(assert (= (and d!52971 c!31095) b!174031))

(assert (= (and d!52971 (not c!31095)) b!174032))

(assert (= (and b!174032 c!31096) b!174033))

(assert (= (and b!174032 (not c!31096)) b!174034))

(assert (=> b!174033 m!201737))

(declare-fun m!202831 () Bool)

(assert (=> b!174033 m!202831))

(assert (=> b!173661 d!52971))

(declare-fun b!174035 () Bool)

(declare-fun e!114940 () Option!191)

(assert (=> b!174035 (= e!114940 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85919)))))))

(declare-fun b!174038 () Bool)

(declare-fun e!114941 () Option!191)

(assert (=> b!174038 (= e!114941 None!189)))

(declare-fun b!174036 () Bool)

(assert (=> b!174036 (= e!114940 e!114941)))

(declare-fun c!31098 () Bool)

(assert (=> b!174036 (= c!31098 (and ((_ is Cons!2202) (toList!1099 lt!85919)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85919))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174037 () Bool)

(assert (=> b!174037 (= e!114941 (getValueByKey!185 (t!7013 (toList!1099 lt!85919)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!52973 () Bool)

(declare-fun c!31097 () Bool)

(assert (=> d!52973 (= c!31097 (and ((_ is Cons!2202) (toList!1099 lt!85919)) (= (_1!1631 (h!2819 (toList!1099 lt!85919))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52973 (= (getValueByKey!185 (toList!1099 lt!85919) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114940)))

(assert (= (and d!52973 c!31097) b!174035))

(assert (= (and d!52973 (not c!31097)) b!174036))

(assert (= (and b!174036 c!31098) b!174037))

(assert (= (and b!174036 (not c!31098)) b!174038))

(declare-fun m!202833 () Bool)

(assert (=> b!174037 m!202833))

(assert (=> b!173521 d!52973))

(declare-fun d!52975 () Bool)

(assert (=> d!52975 (arrayContainsKey!0 (_keys!5439 lt!85729) lt!86007 #b00000000000000000000000000000000)))

(declare-fun lt!86142 () Unit!5314)

(declare-fun choose!13 (array!7297 (_ BitVec 64) (_ BitVec 32)) Unit!5314)

(assert (=> d!52975 (= lt!86142 (choose!13 (_keys!5439 lt!85729) lt!86007 #b00000000000000000000000000000000))))

(assert (=> d!52975 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!52975 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5439 lt!85729) lt!86007 #b00000000000000000000000000000000) lt!86142)))

(declare-fun bs!7183 () Bool)

(assert (= bs!7183 d!52975))

(assert (=> bs!7183 m!202303))

(declare-fun m!202835 () Bool)

(assert (=> bs!7183 m!202835))

(assert (=> b!173709 d!52975))

(declare-fun d!52977 () Bool)

(declare-fun res!82602 () Bool)

(declare-fun e!114946 () Bool)

(assert (=> d!52977 (=> res!82602 e!114946)))

(assert (=> d!52977 (= res!82602 (= (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) lt!86007))))

(assert (=> d!52977 (= (arrayContainsKey!0 (_keys!5439 lt!85729) lt!86007 #b00000000000000000000000000000000) e!114946)))

(declare-fun b!174043 () Bool)

(declare-fun e!114947 () Bool)

(assert (=> b!174043 (= e!114946 e!114947)))

(declare-fun res!82603 () Bool)

(assert (=> b!174043 (=> (not res!82603) (not e!114947))))

(assert (=> b!174043 (= res!82603 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))))))

(declare-fun b!174044 () Bool)

(assert (=> b!174044 (= e!114947 (arrayContainsKey!0 (_keys!5439 lt!85729) lt!86007 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!52977 (not res!82602)) b!174043))

(assert (= (and b!174043 res!82603) b!174044))

(assert (=> d!52977 m!202223))

(declare-fun m!202837 () Bool)

(assert (=> b!174044 m!202837))

(assert (=> b!173709 d!52977))

(declare-fun b!174057 () Bool)

(declare-fun e!114955 () SeekEntryResult!542)

(assert (=> b!174057 (= e!114955 Undefined!542)))

(declare-fun d!52979 () Bool)

(declare-fun lt!86151 () SeekEntryResult!542)

(assert (=> d!52979 (and (or ((_ is Undefined!542) lt!86151) (not ((_ is Found!542) lt!86151)) (and (bvsge (index!4337 lt!86151) #b00000000000000000000000000000000) (bvslt (index!4337 lt!86151) (size!3766 (_keys!5439 lt!85729))))) (or ((_ is Undefined!542) lt!86151) ((_ is Found!542) lt!86151) (not ((_ is MissingZero!542) lt!86151)) (and (bvsge (index!4336 lt!86151) #b00000000000000000000000000000000) (bvslt (index!4336 lt!86151) (size!3766 (_keys!5439 lt!85729))))) (or ((_ is Undefined!542) lt!86151) ((_ is Found!542) lt!86151) ((_ is MissingZero!542) lt!86151) (not ((_ is MissingVacant!542) lt!86151)) (and (bvsge (index!4339 lt!86151) #b00000000000000000000000000000000) (bvslt (index!4339 lt!86151) (size!3766 (_keys!5439 lt!85729))))) (or ((_ is Undefined!542) lt!86151) (ite ((_ is Found!542) lt!86151) (= (select (arr!3467 (_keys!5439 lt!85729)) (index!4337 lt!86151)) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!542) lt!86151) (= (select (arr!3467 (_keys!5439 lt!85729)) (index!4336 lt!86151)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!542) lt!86151) (= (select (arr!3467 (_keys!5439 lt!85729)) (index!4339 lt!86151)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52979 (= lt!86151 e!114955)))

(declare-fun c!31105 () Bool)

(declare-fun lt!86150 () SeekEntryResult!542)

(assert (=> d!52979 (= c!31105 (and ((_ is Intermediate!542) lt!86150) (undefined!1354 lt!86150)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7297 (_ BitVec 32)) SeekEntryResult!542)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!52979 (= lt!86150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) (mask!8470 lt!85729)) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) (_keys!5439 lt!85729) (mask!8470 lt!85729)))))

(assert (=> d!52979 (validMask!0 (mask!8470 lt!85729))))

(assert (=> d!52979 (= (seekEntryOrOpen!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) (_keys!5439 lt!85729) (mask!8470 lt!85729)) lt!86151)))

(declare-fun b!174058 () Bool)

(declare-fun e!114956 () SeekEntryResult!542)

(assert (=> b!174058 (= e!114955 e!114956)))

(declare-fun lt!86149 () (_ BitVec 64))

(assert (=> b!174058 (= lt!86149 (select (arr!3467 (_keys!5439 lt!85729)) (index!4338 lt!86150)))))

(declare-fun c!31106 () Bool)

(assert (=> b!174058 (= c!31106 (= lt!86149 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!174059 () Bool)

(declare-fun e!114954 () SeekEntryResult!542)

(assert (=> b!174059 (= e!114954 (MissingZero!542 (index!4338 lt!86150)))))

(declare-fun b!174060 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7297 (_ BitVec 32)) SeekEntryResult!542)

(assert (=> b!174060 (= e!114954 (seekKeyOrZeroReturnVacant!0 (x!19196 lt!86150) (index!4338 lt!86150) (index!4338 lt!86150) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) (_keys!5439 lt!85729) (mask!8470 lt!85729)))))

(declare-fun b!174061 () Bool)

(declare-fun c!31107 () Bool)

(assert (=> b!174061 (= c!31107 (= lt!86149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174061 (= e!114956 e!114954)))

(declare-fun b!174062 () Bool)

(assert (=> b!174062 (= e!114956 (Found!542 (index!4338 lt!86150)))))

(assert (= (and d!52979 c!31105) b!174057))

(assert (= (and d!52979 (not c!31105)) b!174058))

(assert (= (and b!174058 c!31106) b!174062))

(assert (= (and b!174058 (not c!31106)) b!174061))

(assert (= (and b!174061 c!31107) b!174059))

(assert (= (and b!174061 (not c!31107)) b!174060))

(declare-fun m!202839 () Bool)

(assert (=> d!52979 m!202839))

(declare-fun m!202841 () Bool)

(assert (=> d!52979 m!202841))

(assert (=> d!52979 m!202223))

(declare-fun m!202843 () Bool)

(assert (=> d!52979 m!202843))

(assert (=> d!52979 m!202323))

(declare-fun m!202845 () Bool)

(assert (=> d!52979 m!202845))

(declare-fun m!202847 () Bool)

(assert (=> d!52979 m!202847))

(assert (=> d!52979 m!202223))

(assert (=> d!52979 m!202841))

(declare-fun m!202849 () Bool)

(assert (=> b!174058 m!202849))

(assert (=> b!174060 m!202223))

(declare-fun m!202851 () Bool)

(assert (=> b!174060 m!202851))

(assert (=> b!173709 d!52979))

(declare-fun d!52981 () Bool)

(assert (=> d!52981 (= ($colon$colon!98 e!114656 (ite c!30957 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))) (Cons!2202 (ite c!30957 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!114656))))

(assert (=> bm!17592 d!52981))

(declare-fun b!174063 () Bool)

(declare-fun e!114957 () Option!191)

(assert (=> b!174063 (= e!114957 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85970)))))))

(declare-fun b!174066 () Bool)

(declare-fun e!114958 () Option!191)

(assert (=> b!174066 (= e!114958 None!189)))

(declare-fun b!174064 () Bool)

(assert (=> b!174064 (= e!114957 e!114958)))

(declare-fun c!31109 () Bool)

(assert (=> b!174064 (= c!31109 (and ((_ is Cons!2202) (toList!1099 lt!85970)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85970))) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!174065 () Bool)

(assert (=> b!174065 (= e!114958 (getValueByKey!185 (t!7013 (toList!1099 lt!85970)) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun c!31108 () Bool)

(declare-fun d!52983 () Bool)

(assert (=> d!52983 (= c!31108 (and ((_ is Cons!2202) (toList!1099 lt!85970)) (= (_1!1631 (h!2819 (toList!1099 lt!85970))) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!52983 (= (getValueByKey!185 (toList!1099 lt!85970) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) e!114957)))

(assert (= (and d!52983 c!31108) b!174063))

(assert (= (and d!52983 (not c!31108)) b!174064))

(assert (= (and b!174064 c!31109) b!174065))

(assert (= (and b!174064 (not c!31109)) b!174066))

(declare-fun m!202853 () Bool)

(assert (=> b!174065 m!202853))

(assert (=> b!173620 d!52983))

(declare-fun d!52985 () Bool)

(declare-fun res!82604 () Bool)

(declare-fun e!114959 () Bool)

(assert (=> d!52985 (=> res!82604 e!114959)))

(assert (=> d!52985 (= res!82604 (and ((_ is Cons!2202) lt!85856) (= (_1!1631 (h!2819 lt!85856)) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!52985 (= (containsKey!189 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309))) e!114959)))

(declare-fun b!174067 () Bool)

(declare-fun e!114960 () Bool)

(assert (=> b!174067 (= e!114959 e!114960)))

(declare-fun res!82605 () Bool)

(assert (=> b!174067 (=> (not res!82605) (not e!114960))))

(assert (=> b!174067 (= res!82605 (and (or (not ((_ is Cons!2202) lt!85856)) (bvsle (_1!1631 (h!2819 lt!85856)) (_1!1631 (tuple2!3241 key!828 v!309)))) ((_ is Cons!2202) lt!85856) (bvslt (_1!1631 (h!2819 lt!85856)) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun b!174068 () Bool)

(assert (=> b!174068 (= e!114960 (containsKey!189 (t!7013 lt!85856) (_1!1631 (tuple2!3241 key!828 v!309))))))

(assert (= (and d!52985 (not res!82604)) b!174067))

(assert (= (and b!174067 res!82605) b!174068))

(declare-fun m!202855 () Bool)

(assert (=> b!174068 m!202855))

(assert (=> b!173671 d!52985))

(declare-fun d!52987 () Bool)

(assert (=> d!52987 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85792) lt!85796)) (v!3956 (getValueByKey!185 (toList!1099 lt!85792) lt!85796)))))

(assert (=> d!52631 d!52987))

(declare-fun b!174069 () Bool)

(declare-fun e!114961 () Option!191)

(assert (=> b!174069 (= e!114961 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85792)))))))

(declare-fun b!174072 () Bool)

(declare-fun e!114962 () Option!191)

(assert (=> b!174072 (= e!114962 None!189)))

(declare-fun b!174070 () Bool)

(assert (=> b!174070 (= e!114961 e!114962)))

(declare-fun c!31111 () Bool)

(assert (=> b!174070 (= c!31111 (and ((_ is Cons!2202) (toList!1099 lt!85792)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85792))) lt!85796))))))

(declare-fun b!174071 () Bool)

(assert (=> b!174071 (= e!114962 (getValueByKey!185 (t!7013 (toList!1099 lt!85792)) lt!85796))))

(declare-fun d!52989 () Bool)

(declare-fun c!31110 () Bool)

(assert (=> d!52989 (= c!31110 (and ((_ is Cons!2202) (toList!1099 lt!85792)) (= (_1!1631 (h!2819 (toList!1099 lt!85792))) lt!85796)))))

(assert (=> d!52989 (= (getValueByKey!185 (toList!1099 lt!85792) lt!85796) e!114961)))

(assert (= (and d!52989 c!31110) b!174069))

(assert (= (and d!52989 (not c!31110)) b!174070))

(assert (= (and b!174070 c!31111) b!174071))

(assert (= (and b!174070 (not c!31111)) b!174072))

(declare-fun m!202857 () Bool)

(assert (=> b!174071 m!202857))

(assert (=> d!52631 d!52989))

(assert (=> b!173614 d!52613))

(declare-fun d!52991 () Bool)

(assert (=> d!52991 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7184 () Bool)

(assert (= bs!7184 d!52991))

(assert (=> bs!7184 m!202295))

(declare-fun m!202859 () Bool)

(assert (=> bs!7184 m!202859))

(assert (=> b!173705 d!52991))

(assert (=> b!173705 d!52805))

(declare-fun b!174073 () Bool)

(declare-fun e!114963 () Option!191)

(assert (=> b!174073 (= e!114963 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85960)))))))

(declare-fun b!174076 () Bool)

(declare-fun e!114964 () Option!191)

(assert (=> b!174076 (= e!114964 None!189)))

(declare-fun b!174074 () Bool)

(assert (=> b!174074 (= e!114963 e!114964)))

(declare-fun c!31113 () Bool)

(assert (=> b!174074 (= c!31113 (and ((_ is Cons!2202) (toList!1099 lt!85960)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85960))) (_1!1631 (tuple2!3241 lt!85838 v!309))))))))

(declare-fun b!174075 () Bool)

(assert (=> b!174075 (= e!114964 (getValueByKey!185 (t!7013 (toList!1099 lt!85960)) (_1!1631 (tuple2!3241 lt!85838 v!309))))))

(declare-fun c!31112 () Bool)

(declare-fun d!52993 () Bool)

(assert (=> d!52993 (= c!31112 (and ((_ is Cons!2202) (toList!1099 lt!85960)) (= (_1!1631 (h!2819 (toList!1099 lt!85960))) (_1!1631 (tuple2!3241 lt!85838 v!309)))))))

(assert (=> d!52993 (= (getValueByKey!185 (toList!1099 lt!85960) (_1!1631 (tuple2!3241 lt!85838 v!309))) e!114963)))

(assert (= (and d!52993 c!31112) b!174073))

(assert (= (and d!52993 (not c!31112)) b!174074))

(assert (= (and b!174074 c!31113) b!174075))

(assert (= (and b!174074 (not c!31113)) b!174076))

(declare-fun m!202861 () Bool)

(assert (=> b!174075 m!202861))

(assert (=> b!173615 d!52993))

(declare-fun d!52995 () Bool)

(assert (=> d!52995 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86152 () Unit!5314)

(assert (=> d!52995 (= lt!86152 (choose!932 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114965 () Bool)

(assert (=> d!52995 e!114965))

(declare-fun res!82606 () Bool)

(assert (=> d!52995 (=> (not res!82606) (not e!114965))))

(assert (=> d!52995 (= res!82606 (isStrictlySorted!332 (toList!1099 lt!85825)))))

(assert (=> d!52995 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000) lt!86152)))

(declare-fun b!174077 () Bool)

(assert (=> b!174077 (= e!114965 (containsKey!189 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52995 res!82606) b!174077))

(assert (=> d!52995 m!202021))

(assert (=> d!52995 m!202021))

(assert (=> d!52995 m!202023))

(declare-fun m!202863 () Bool)

(assert (=> d!52995 m!202863))

(assert (=> d!52995 m!202779))

(assert (=> b!174077 m!202017))

(assert (=> b!173518 d!52995))

(declare-fun d!52997 () Bool)

(assert (=> d!52997 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7185 () Bool)

(assert (= bs!7185 d!52997))

(assert (=> bs!7185 m!202021))

(declare-fun m!202865 () Bool)

(assert (=> bs!7185 m!202865))

(assert (=> b!173518 d!52997))

(assert (=> b!173518 d!52945))

(declare-fun d!52999 () Bool)

(declare-fun lt!86153 () Bool)

(assert (=> d!52999 (= lt!86153 (select (content!149 (toList!1099 lt!85966)) (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))

(declare-fun e!114967 () Bool)

(assert (=> d!52999 (= lt!86153 e!114967)))

(declare-fun res!82608 () Bool)

(assert (=> d!52999 (=> (not res!82608) (not e!114967))))

(assert (=> d!52999 (= res!82608 ((_ is Cons!2202) (toList!1099 lt!85966)))))

(assert (=> d!52999 (= (contains!1155 (toList!1099 lt!85966) (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) lt!86153)))

(declare-fun b!174078 () Bool)

(declare-fun e!114966 () Bool)

(assert (=> b!174078 (= e!114967 e!114966)))

(declare-fun res!82607 () Bool)

(assert (=> b!174078 (=> res!82607 e!114966)))

(assert (=> b!174078 (= res!82607 (= (h!2819 (toList!1099 lt!85966)) (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))

(declare-fun b!174079 () Bool)

(assert (=> b!174079 (= e!114966 (contains!1155 (t!7013 (toList!1099 lt!85966)) (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!52999 res!82608) b!174078))

(assert (= (and b!174078 (not res!82607)) b!174079))

(declare-fun m!202867 () Bool)

(assert (=> d!52999 m!202867))

(declare-fun m!202869 () Bool)

(assert (=> d!52999 m!202869))

(declare-fun m!202871 () Bool)

(assert (=> b!174079 m!202871))

(assert (=> b!173619 d!52999))

(declare-fun b!174080 () Bool)

(declare-fun e!114968 () Option!191)

(assert (=> b!174080 (= e!114968 (Some!190 (_2!1631 (h!2819 (t!7013 (toList!1099 lt!85855))))))))

(declare-fun b!174083 () Bool)

(declare-fun e!114969 () Option!191)

(assert (=> b!174083 (= e!114969 None!189)))

(declare-fun b!174081 () Bool)

(assert (=> b!174081 (= e!114968 e!114969)))

(declare-fun c!31115 () Bool)

(assert (=> b!174081 (= c!31115 (and ((_ is Cons!2202) (t!7013 (toList!1099 lt!85855))) (not (= (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85855)))) (_1!1631 (tuple2!3241 key!828 v!309))))))))

(declare-fun b!174082 () Bool)

(assert (=> b!174082 (= e!114969 (getValueByKey!185 (t!7013 (t!7013 (toList!1099 lt!85855))) (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun c!31114 () Bool)

(declare-fun d!53001 () Bool)

(assert (=> d!53001 (= c!31114 (and ((_ is Cons!2202) (t!7013 (toList!1099 lt!85855))) (= (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85855)))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!53001 (= (getValueByKey!185 (t!7013 (toList!1099 lt!85855)) (_1!1631 (tuple2!3241 key!828 v!309))) e!114968)))

(assert (= (and d!53001 c!31114) b!174080))

(assert (= (and d!53001 (not c!31114)) b!174081))

(assert (= (and b!174081 c!31115) b!174082))

(assert (= (and b!174081 (not c!31115)) b!174083))

(declare-fun m!202873 () Bool)

(assert (=> b!174082 m!202873))

(assert (=> b!173579 d!53001))

(declare-fun d!53003 () Bool)

(declare-fun e!114970 () Bool)

(assert (=> d!53003 e!114970))

(declare-fun res!82609 () Bool)

(assert (=> d!53003 (=> res!82609 e!114970)))

(declare-fun lt!86154 () Bool)

(assert (=> d!53003 (= res!82609 (not lt!86154))))

(declare-fun lt!86156 () Bool)

(assert (=> d!53003 (= lt!86154 lt!86156)))

(declare-fun lt!86157 () Unit!5314)

(declare-fun e!114971 () Unit!5314)

(assert (=> d!53003 (= lt!86157 e!114971)))

(declare-fun c!31116 () Bool)

(assert (=> d!53003 (= c!31116 lt!86156)))

(assert (=> d!53003 (= lt!86156 (containsKey!189 (toList!1099 lt!85970) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!53003 (= (contains!1154 lt!85970 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!86154)))

(declare-fun b!174084 () Bool)

(declare-fun lt!86155 () Unit!5314)

(assert (=> b!174084 (= e!114971 lt!86155)))

(assert (=> b!174084 (= lt!86155 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85970) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(assert (=> b!174084 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85970) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174085 () Bool)

(declare-fun Unit!5346 () Unit!5314)

(assert (=> b!174085 (= e!114971 Unit!5346)))

(declare-fun b!174086 () Bool)

(assert (=> b!174086 (= e!114970 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85970) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53003 c!31116) b!174084))

(assert (= (and d!53003 (not c!31116)) b!174085))

(assert (= (and d!53003 (not res!82609)) b!174086))

(declare-fun m!202875 () Bool)

(assert (=> d!53003 m!202875))

(declare-fun m!202877 () Bool)

(assert (=> b!174084 m!202877))

(assert (=> b!174084 m!202171))

(assert (=> b!174084 m!202171))

(declare-fun m!202879 () Bool)

(assert (=> b!174084 m!202879))

(assert (=> b!174086 m!202171))

(assert (=> b!174086 m!202171))

(assert (=> b!174086 m!202879))

(assert (=> d!52705 d!53003))

(declare-fun b!174087 () Bool)

(declare-fun e!114972 () Option!191)

(assert (=> b!174087 (= e!114972 (Some!190 (_2!1631 (h!2819 lt!85971))))))

(declare-fun b!174090 () Bool)

(declare-fun e!114973 () Option!191)

(assert (=> b!174090 (= e!114973 None!189)))

(declare-fun b!174088 () Bool)

(assert (=> b!174088 (= e!114972 e!114973)))

(declare-fun c!31118 () Bool)

(assert (=> b!174088 (= c!31118 (and ((_ is Cons!2202) lt!85971) (not (= (_1!1631 (h!2819 lt!85971)) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!174089 () Bool)

(assert (=> b!174089 (= e!114973 (getValueByKey!185 (t!7013 lt!85971) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun d!53005 () Bool)

(declare-fun c!31117 () Bool)

(assert (=> d!53005 (= c!31117 (and ((_ is Cons!2202) lt!85971) (= (_1!1631 (h!2819 lt!85971)) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53005 (= (getValueByKey!185 lt!85971 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) e!114972)))

(assert (= (and d!53005 c!31117) b!174087))

(assert (= (and d!53005 (not c!31117)) b!174088))

(assert (= (and b!174088 c!31118) b!174089))

(assert (= (and b!174088 (not c!31118)) b!174090))

(declare-fun m!202881 () Bool)

(assert (=> b!174089 m!202881))

(assert (=> d!52705 d!53005))

(declare-fun d!53007 () Bool)

(assert (=> d!53007 (= (getValueByKey!185 lt!85971 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!86158 () Unit!5314)

(assert (=> d!53007 (= lt!86158 (choose!931 lt!85971 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun e!114974 () Bool)

(assert (=> d!53007 e!114974))

(declare-fun res!82610 () Bool)

(assert (=> d!53007 (=> (not res!82610) (not e!114974))))

(assert (=> d!53007 (= res!82610 (isStrictlySorted!332 lt!85971))))

(assert (=> d!53007 (= (lemmaContainsTupThenGetReturnValue!98 lt!85971 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!86158)))

(declare-fun b!174091 () Bool)

(declare-fun res!82611 () Bool)

(assert (=> b!174091 (=> (not res!82611) (not e!114974))))

(assert (=> b!174091 (= res!82611 (containsKey!189 lt!85971 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174092 () Bool)

(assert (=> b!174092 (= e!114974 (contains!1155 lt!85971 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53007 res!82610) b!174091))

(assert (= (and b!174091 res!82611) b!174092))

(assert (=> d!53007 m!202165))

(declare-fun m!202883 () Bool)

(assert (=> d!53007 m!202883))

(declare-fun m!202885 () Bool)

(assert (=> d!53007 m!202885))

(declare-fun m!202887 () Bool)

(assert (=> b!174091 m!202887))

(declare-fun m!202889 () Bool)

(assert (=> b!174092 m!202889))

(assert (=> d!52705 d!53007))

(declare-fun bm!17640 () Bool)

(declare-fun call!17644 () List!2206)

(declare-fun call!17642 () List!2206)

(assert (=> bm!17640 (= call!17644 call!17642)))

(declare-fun c!31120 () Bool)

(declare-fun e!114978 () List!2206)

(declare-fun b!174093 () Bool)

(declare-fun c!31122 () Bool)

(assert (=> b!174093 (= e!114978 (ite c!31120 (t!7013 (toList!1099 lt!85823)) (ite c!31122 (Cons!2202 (h!2819 (toList!1099 lt!85823)) (t!7013 (toList!1099 lt!85823))) Nil!2203)))))

(declare-fun b!174094 () Bool)

(declare-fun res!82612 () Bool)

(declare-fun e!114979 () Bool)

(assert (=> b!174094 (=> (not res!82612) (not e!114979))))

(declare-fun lt!86159 () List!2206)

(assert (=> b!174094 (= res!82612 (containsKey!189 lt!86159 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174095 () Bool)

(declare-fun e!114976 () List!2206)

(assert (=> b!174095 (= e!114976 call!17642)))

(declare-fun b!174096 () Bool)

(assert (=> b!174096 (= c!31122 (and ((_ is Cons!2202) (toList!1099 lt!85823)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85823))) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(declare-fun e!114977 () List!2206)

(declare-fun e!114975 () List!2206)

(assert (=> b!174096 (= e!114977 e!114975)))

(declare-fun b!174097 () Bool)

(declare-fun call!17643 () List!2206)

(assert (=> b!174097 (= e!114975 call!17643)))

(declare-fun b!174098 () Bool)

(assert (=> b!174098 (= e!114975 call!17643)))

(declare-fun b!174099 () Bool)

(assert (=> b!174099 (= e!114976 e!114977)))

(assert (=> b!174099 (= c!31120 (and ((_ is Cons!2202) (toList!1099 lt!85823)) (= (_1!1631 (h!2819 (toList!1099 lt!85823))) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(declare-fun c!31119 () Bool)

(declare-fun bm!17639 () Bool)

(assert (=> bm!17639 (= call!17642 ($colon$colon!98 e!114978 (ite c!31119 (h!2819 (toList!1099 lt!85823)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))))

(declare-fun c!31121 () Bool)

(assert (=> bm!17639 (= c!31121 c!31119)))

(declare-fun d!53009 () Bool)

(assert (=> d!53009 e!114979))

(declare-fun res!82613 () Bool)

(assert (=> d!53009 (=> (not res!82613) (not e!114979))))

(assert (=> d!53009 (= res!82613 (isStrictlySorted!332 lt!86159))))

(assert (=> d!53009 (= lt!86159 e!114976)))

(assert (=> d!53009 (= c!31119 (and ((_ is Cons!2202) (toList!1099 lt!85823)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85823))) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53009 (isStrictlySorted!332 (toList!1099 lt!85823))))

(assert (=> d!53009 (= (insertStrictlySorted!101 (toList!1099 lt!85823) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!86159)))

(declare-fun bm!17641 () Bool)

(assert (=> bm!17641 (= call!17643 call!17644)))

(declare-fun b!174100 () Bool)

(assert (=> b!174100 (= e!114977 call!17644)))

(declare-fun b!174101 () Bool)

(assert (=> b!174101 (= e!114978 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85823)) (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174102 () Bool)

(assert (=> b!174102 (= e!114979 (contains!1155 lt!86159 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53009 c!31119) b!174095))

(assert (= (and d!53009 (not c!31119)) b!174099))

(assert (= (and b!174099 c!31120) b!174100))

(assert (= (and b!174099 (not c!31120)) b!174096))

(assert (= (and b!174096 c!31122) b!174097))

(assert (= (and b!174096 (not c!31122)) b!174098))

(assert (= (or b!174097 b!174098) bm!17641))

(assert (= (or b!174100 bm!17641) bm!17640))

(assert (= (or b!174095 bm!17640) bm!17639))

(assert (= (and bm!17639 c!31121) b!174101))

(assert (= (and bm!17639 (not c!31121)) b!174093))

(assert (= (and d!53009 res!82613) b!174094))

(assert (= (and b!174094 res!82612) b!174102))

(declare-fun m!202891 () Bool)

(assert (=> b!174102 m!202891))

(declare-fun m!202893 () Bool)

(assert (=> bm!17639 m!202893))

(declare-fun m!202895 () Bool)

(assert (=> b!174101 m!202895))

(declare-fun m!202897 () Bool)

(assert (=> b!174094 m!202897))

(declare-fun m!202899 () Bool)

(assert (=> d!53009 m!202899))

(declare-fun m!202901 () Bool)

(assert (=> d!53009 m!202901))

(assert (=> d!52705 d!53009))

(declare-fun d!53011 () Bool)

(assert (=> d!53011 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7186 () Bool)

(assert (= bs!7186 d!53011))

(assert (=> bs!7186 m!202315))

(declare-fun m!202903 () Bool)

(assert (=> bs!7186 m!202903))

(assert (=> b!173716 d!53011))

(assert (=> b!173716 d!52795))

(declare-fun d!53013 () Bool)

(assert (=> d!53013 (= (apply!130 lt!85889 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (get!1969 (getValueByKey!185 (toList!1099 lt!85889) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7187 () Bool)

(assert (= bs!7187 d!53013))

(assert (=> bs!7187 m!201737))

(assert (=> bs!7187 m!202627))

(assert (=> bs!7187 m!202627))

(declare-fun m!202905 () Bool)

(assert (=> bs!7187 m!202905))

(assert (=> b!173500 d!53013))

(assert (=> b!173500 d!52619))

(declare-fun d!53015 () Bool)

(declare-fun lt!86160 () Bool)

(assert (=> d!53015 (= lt!86160 (select (content!149 (toList!1099 lt!85975)) (tuple2!3241 lt!85836 v!309)))))

(declare-fun e!114981 () Bool)

(assert (=> d!53015 (= lt!86160 e!114981)))

(declare-fun res!82615 () Bool)

(assert (=> d!53015 (=> (not res!82615) (not e!114981))))

(assert (=> d!53015 (= res!82615 ((_ is Cons!2202) (toList!1099 lt!85975)))))

(assert (=> d!53015 (= (contains!1155 (toList!1099 lt!85975) (tuple2!3241 lt!85836 v!309)) lt!86160)))

(declare-fun b!174103 () Bool)

(declare-fun e!114980 () Bool)

(assert (=> b!174103 (= e!114981 e!114980)))

(declare-fun res!82614 () Bool)

(assert (=> b!174103 (=> res!82614 e!114980)))

(assert (=> b!174103 (= res!82614 (= (h!2819 (toList!1099 lt!85975)) (tuple2!3241 lt!85836 v!309)))))

(declare-fun b!174104 () Bool)

(assert (=> b!174104 (= e!114980 (contains!1155 (t!7013 (toList!1099 lt!85975)) (tuple2!3241 lt!85836 v!309)))))

(assert (= (and d!53015 res!82615) b!174103))

(assert (= (and b!174103 (not res!82614)) b!174104))

(declare-fun m!202907 () Bool)

(assert (=> d!53015 m!202907))

(declare-fun m!202909 () Bool)

(assert (=> d!53015 m!202909))

(declare-fun m!202911 () Bool)

(assert (=> b!174104 m!202911))

(assert (=> b!173624 d!53015))

(assert (=> b!173596 d!52659))

(declare-fun d!53017 () Bool)

(assert (=> d!53017 (= (get!1971 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173461 d!53017))

(declare-fun d!53019 () Bool)

(assert (=> d!53019 (= (isDefined!138 (getValueByKey!185 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309)))) (not (isEmpty!437 (getValueByKey!185 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))))))))

(declare-fun bs!7188 () Bool)

(assert (= bs!7188 d!53019))

(assert (=> bs!7188 m!201867))

(declare-fun m!202913 () Bool)

(assert (=> bs!7188 m!202913))

(assert (=> b!173666 d!53019))

(assert (=> b!173666 d!52677))

(declare-fun d!53021 () Bool)

(declare-fun res!82616 () Bool)

(declare-fun e!114982 () Bool)

(assert (=> d!53021 (=> res!82616 e!114982)))

(assert (=> d!53021 (= res!82616 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (= (_1!1631 (h!2819 (toList!1099 lt!85825))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53021 (= (containsKey!189 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000) e!114982)))

(declare-fun b!174105 () Bool)

(declare-fun e!114983 () Bool)

(assert (=> b!174105 (= e!114982 e!114983)))

(declare-fun res!82617 () Bool)

(assert (=> b!174105 (=> (not res!82617) (not e!114983))))

(assert (=> b!174105 (= res!82617 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85825))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85825))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2202) (toList!1099 lt!85825)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85825))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174106 () Bool)

(assert (=> b!174106 (= e!114983 (containsKey!189 (t!7013 (toList!1099 lt!85825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53021 (not res!82616)) b!174105))

(assert (= (and b!174105 res!82617) b!174106))

(declare-fun m!202915 () Bool)

(assert (=> b!174106 m!202915))

(assert (=> d!52683 d!53021))

(declare-fun d!53023 () Bool)

(assert (=> d!53023 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3956 (getValueByKey!185 (toList!1099 lt!85825) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52685 d!53023))

(assert (=> d!52685 d!52951))

(declare-fun b!174107 () Bool)

(declare-fun e!114984 () Bool)

(declare-fun e!114989 () Bool)

(assert (=> b!174107 (= e!114984 e!114989)))

(declare-fun c!31124 () Bool)

(assert (=> b!174107 (= c!31124 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun bm!17642 () Bool)

(declare-fun call!17645 () ListLongMap!2167)

(assert (=> bm!17642 (= call!17645 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248)))))

(declare-fun b!174109 () Bool)

(declare-fun e!114987 () Bool)

(assert (=> b!174109 (= e!114984 e!114987)))

(assert (=> b!174109 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun res!82619 () Bool)

(declare-fun lt!86163 () ListLongMap!2167)

(assert (=> b!174109 (= res!82619 (contains!1154 lt!86163 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174109 (=> (not res!82619) (not e!114987))))

(declare-fun b!174110 () Bool)

(declare-fun e!114985 () ListLongMap!2167)

(assert (=> b!174110 (= e!114985 (ListLongMap!2168 Nil!2203))))

(declare-fun b!174111 () Bool)

(assert (=> b!174111 (= e!114989 (isEmpty!436 lt!86163))))

(declare-fun b!174112 () Bool)

(assert (=> b!174112 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> b!174112 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3767 (_values!3581 thiss!1248))))))

(assert (=> b!174112 (= e!114987 (= (apply!130 lt!86163 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!174113 () Bool)

(declare-fun e!114988 () ListLongMap!2167)

(assert (=> b!174113 (= e!114988 call!17645)))

(declare-fun b!174114 () Bool)

(assert (=> b!174114 (= e!114989 (= lt!86163 (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248))))))

(declare-fun b!174115 () Bool)

(assert (=> b!174115 (= e!114985 e!114988)))

(declare-fun c!31126 () Bool)

(assert (=> b!174115 (= c!31126 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174116 () Bool)

(declare-fun e!114986 () Bool)

(assert (=> b!174116 (= e!114986 e!114984)))

(declare-fun c!31125 () Bool)

(declare-fun e!114990 () Bool)

(assert (=> b!174116 (= c!31125 e!114990)))

(declare-fun res!82620 () Bool)

(assert (=> b!174116 (=> (not res!82620) (not e!114990))))

(assert (=> b!174116 (= res!82620 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!174117 () Bool)

(declare-fun lt!86161 () Unit!5314)

(declare-fun lt!86165 () Unit!5314)

(assert (=> b!174117 (= lt!86161 lt!86165)))

(declare-fun lt!86164 () (_ BitVec 64))

(declare-fun lt!86166 () (_ BitVec 64))

(declare-fun lt!86162 () V!5091)

(declare-fun lt!86167 () ListLongMap!2167)

(assert (=> b!174117 (not (contains!1154 (+!246 lt!86167 (tuple2!3241 lt!86166 lt!86162)) lt!86164))))

(assert (=> b!174117 (= lt!86165 (addStillNotContains!72 lt!86167 lt!86166 lt!86162 lt!86164))))

(assert (=> b!174117 (= lt!86164 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174117 (= lt!86162 (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174117 (= lt!86166 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!174117 (= lt!86167 call!17645)))

(assert (=> b!174117 (= e!114988 (+!246 call!17645 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!174118 () Bool)

(assert (=> b!174118 (= e!114990 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174118 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun d!53025 () Bool)

(assert (=> d!53025 e!114986))

(declare-fun res!82621 () Bool)

(assert (=> d!53025 (=> (not res!82621) (not e!114986))))

(assert (=> d!53025 (= res!82621 (not (contains!1154 lt!86163 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53025 (= lt!86163 e!114985)))

(declare-fun c!31123 () Bool)

(assert (=> d!53025 (= c!31123 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!53025 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!53025 (= (getCurrentListMapNoExtraKeys!163 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 thiss!1248)) lt!86163)))

(declare-fun b!174108 () Bool)

(declare-fun res!82618 () Bool)

(assert (=> b!174108 (=> (not res!82618) (not e!114986))))

(assert (=> b!174108 (= res!82618 (not (contains!1154 lt!86163 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53025 c!31123) b!174110))

(assert (= (and d!53025 (not c!31123)) b!174115))

(assert (= (and b!174115 c!31126) b!174117))

(assert (= (and b!174115 (not c!31126)) b!174113))

(assert (= (or b!174117 b!174113) bm!17642))

(assert (= (and d!53025 res!82621) b!174108))

(assert (= (and b!174108 res!82618) b!174116))

(assert (= (and b!174116 res!82620) b!174118))

(assert (= (and b!174116 c!31125) b!174109))

(assert (= (and b!174116 (not c!31125)) b!174107))

(assert (= (and b!174109 res!82619) b!174112))

(assert (= (and b!174107 c!31124) b!174114))

(assert (= (and b!174107 (not c!31124)) b!174111))

(declare-fun b_lambda!6965 () Bool)

(assert (=> (not b_lambda!6965) (not b!174112)))

(assert (=> b!174112 t!7016))

(declare-fun b_and!10773 () Bool)

(assert (= b_and!10771 (and (=> t!7016 result!4585) b_and!10773)))

(declare-fun b_lambda!6967 () Bool)

(assert (=> (not b_lambda!6967) (not b!174117)))

(assert (=> b!174117 t!7016))

(declare-fun b_and!10775 () Bool)

(assert (= b_and!10773 (and (=> t!7016 result!4585) b_and!10775)))

(declare-fun m!202917 () Bool)

(assert (=> b!174114 m!202917))

(assert (=> b!174112 m!202453))

(assert (=> b!174112 m!201747))

(assert (=> b!174112 m!202455))

(assert (=> b!174112 m!201747))

(assert (=> b!174112 m!202457))

(declare-fun m!202919 () Bool)

(assert (=> b!174112 m!202919))

(assert (=> b!174112 m!202457))

(assert (=> b!174112 m!202453))

(declare-fun m!202921 () Bool)

(assert (=> d!53025 m!202921))

(assert (=> d!53025 m!201729))

(assert (=> b!174109 m!202457))

(assert (=> b!174109 m!202457))

(declare-fun m!202923 () Bool)

(assert (=> b!174109 m!202923))

(assert (=> bm!17642 m!202917))

(declare-fun m!202925 () Bool)

(assert (=> b!174111 m!202925))

(assert (=> b!174118 m!202457))

(assert (=> b!174118 m!202457))

(assert (=> b!174118 m!202467))

(declare-fun m!202927 () Bool)

(assert (=> b!174108 m!202927))

(assert (=> b!174115 m!202457))

(assert (=> b!174115 m!202457))

(assert (=> b!174115 m!202467))

(declare-fun m!202929 () Bool)

(assert (=> b!174117 m!202929))

(declare-fun m!202931 () Bool)

(assert (=> b!174117 m!202931))

(assert (=> b!174117 m!202453))

(assert (=> b!174117 m!201747))

(assert (=> b!174117 m!202455))

(assert (=> b!174117 m!201747))

(assert (=> b!174117 m!202929))

(declare-fun m!202933 () Bool)

(assert (=> b!174117 m!202933))

(assert (=> b!174117 m!202457))

(assert (=> b!174117 m!202453))

(declare-fun m!202935 () Bool)

(assert (=> b!174117 m!202935))

(assert (=> bm!17585 d!53025))

(declare-fun bm!17644 () Bool)

(declare-fun call!17648 () List!2206)

(declare-fun call!17646 () List!2206)

(assert (=> bm!17644 (= call!17648 call!17646)))

(declare-fun e!114994 () List!2206)

(declare-fun c!31130 () Bool)

(declare-fun b!174119 () Bool)

(declare-fun c!31128 () Bool)

(assert (=> b!174119 (= e!114994 (ite c!31128 (t!7013 (t!7013 (toList!1099 (map!1882 thiss!1248)))) (ite c!31130 (Cons!2202 (h!2819 (t!7013 (toList!1099 (map!1882 thiss!1248)))) (t!7013 (t!7013 (toList!1099 (map!1882 thiss!1248))))) Nil!2203)))))

(declare-fun b!174120 () Bool)

(declare-fun res!82622 () Bool)

(declare-fun e!114995 () Bool)

(assert (=> b!174120 (=> (not res!82622) (not e!114995))))

(declare-fun lt!86168 () List!2206)

(assert (=> b!174120 (= res!82622 (containsKey!189 lt!86168 (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun b!174121 () Bool)

(declare-fun e!114992 () List!2206)

(assert (=> b!174121 (= e!114992 call!17646)))

(declare-fun b!174122 () Bool)

(assert (=> b!174122 (= c!31130 (and ((_ is Cons!2202) (t!7013 (toList!1099 (map!1882 thiss!1248)))) (bvsgt (_1!1631 (h!2819 (t!7013 (toList!1099 (map!1882 thiss!1248))))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun e!114993 () List!2206)

(declare-fun e!114991 () List!2206)

(assert (=> b!174122 (= e!114993 e!114991)))

(declare-fun b!174123 () Bool)

(declare-fun call!17647 () List!2206)

(assert (=> b!174123 (= e!114991 call!17647)))

(declare-fun b!174124 () Bool)

(assert (=> b!174124 (= e!114991 call!17647)))

(declare-fun b!174125 () Bool)

(assert (=> b!174125 (= e!114992 e!114993)))

(assert (=> b!174125 (= c!31128 (and ((_ is Cons!2202) (t!7013 (toList!1099 (map!1882 thiss!1248)))) (= (_1!1631 (h!2819 (t!7013 (toList!1099 (map!1882 thiss!1248))))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(declare-fun c!31127 () Bool)

(declare-fun bm!17643 () Bool)

(assert (=> bm!17643 (= call!17646 ($colon$colon!98 e!114994 (ite c!31127 (h!2819 (t!7013 (toList!1099 (map!1882 thiss!1248)))) (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))))))

(declare-fun c!31129 () Bool)

(assert (=> bm!17643 (= c!31129 c!31127)))

(declare-fun d!53027 () Bool)

(assert (=> d!53027 e!114995))

(declare-fun res!82623 () Bool)

(assert (=> d!53027 (=> (not res!82623) (not e!114995))))

(assert (=> d!53027 (= res!82623 (isStrictlySorted!332 lt!86168))))

(assert (=> d!53027 (= lt!86168 e!114992)))

(assert (=> d!53027 (= c!31127 (and ((_ is Cons!2202) (t!7013 (toList!1099 (map!1882 thiss!1248)))) (bvslt (_1!1631 (h!2819 (t!7013 (toList!1099 (map!1882 thiss!1248))))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!53027 (isStrictlySorted!332 (t!7013 (toList!1099 (map!1882 thiss!1248))))))

(assert (=> d!53027 (= (insertStrictlySorted!101 (t!7013 (toList!1099 (map!1882 thiss!1248))) (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))) lt!86168)))

(declare-fun bm!17645 () Bool)

(assert (=> bm!17645 (= call!17647 call!17648)))

(declare-fun b!174126 () Bool)

(assert (=> b!174126 (= e!114993 call!17648)))

(declare-fun b!174127 () Bool)

(assert (=> b!174127 (= e!114994 (insertStrictlySorted!101 (t!7013 (t!7013 (toList!1099 (map!1882 thiss!1248)))) (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun b!174128 () Bool)

(assert (=> b!174128 (= e!114995 (contains!1155 lt!86168 (tuple2!3241 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309)))))))

(assert (= (and d!53027 c!31127) b!174121))

(assert (= (and d!53027 (not c!31127)) b!174125))

(assert (= (and b!174125 c!31128) b!174126))

(assert (= (and b!174125 (not c!31128)) b!174122))

(assert (= (and b!174122 c!31130) b!174123))

(assert (= (and b!174122 (not c!31130)) b!174124))

(assert (= (or b!174123 b!174124) bm!17645))

(assert (= (or b!174126 bm!17645) bm!17644))

(assert (= (or b!174121 bm!17644) bm!17643))

(assert (= (and bm!17643 c!31129) b!174127))

(assert (= (and bm!17643 (not c!31129)) b!174119))

(assert (= (and d!53027 res!82623) b!174120))

(assert (= (and b!174120 res!82622) b!174128))

(declare-fun m!202937 () Bool)

(assert (=> b!174128 m!202937))

(declare-fun m!202939 () Bool)

(assert (=> bm!17643 m!202939))

(declare-fun m!202941 () Bool)

(assert (=> b!174127 m!202941))

(declare-fun m!202943 () Bool)

(assert (=> b!174120 m!202943))

(declare-fun m!202945 () Bool)

(assert (=> d!53027 m!202945))

(declare-fun m!202947 () Bool)

(assert (=> d!53027 m!202947))

(assert (=> b!173681 d!53027))

(declare-fun d!53029 () Bool)

(assert (=> d!53029 (= (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822)) (not (isEmpty!437 (getValueByKey!185 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822))))))

(declare-fun bs!7189 () Bool)

(assert (= bs!7189 d!53029))

(assert (=> bs!7189 m!202207))

(declare-fun m!202949 () Bool)

(assert (=> bs!7189 m!202949))

(assert (=> b!173627 d!53029))

(declare-fun e!114996 () Option!191)

(declare-fun b!174129 () Bool)

(assert (=> b!174129 (= e!114996 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))))

(declare-fun b!174132 () Bool)

(declare-fun e!114997 () Option!191)

(assert (=> b!174132 (= e!114997 None!189)))

(declare-fun b!174130 () Bool)

(assert (=> b!174130 (= e!114996 e!114997)))

(declare-fun c!31132 () Bool)

(assert (=> b!174130 (= c!31132 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))) lt!85822))))))

(declare-fun b!174131 () Bool)

(assert (=> b!174131 (= e!114997 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))) lt!85822))))

(declare-fun c!31131 () Bool)

(declare-fun d!53031 () Bool)

(assert (=> d!53031 (= c!31131 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))))) lt!85822)))))

(assert (=> d!53031 (= (getValueByKey!185 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822) e!114996)))

(assert (= (and d!53031 c!31131) b!174129))

(assert (= (and d!53031 (not c!31131)) b!174130))

(assert (= (and b!174130 c!31132) b!174131))

(assert (= (and b!174130 (not c!31132)) b!174132))

(declare-fun m!202951 () Bool)

(assert (=> b!174131 m!202951))

(assert (=> b!173627 d!53031))

(declare-fun d!53033 () Bool)

(assert (=> d!53033 (= (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788)) (not (isEmpty!437 (getValueByKey!185 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788))))))

(declare-fun bs!7190 () Bool)

(assert (= bs!7190 d!53033))

(assert (=> bs!7190 m!201957))

(declare-fun m!202953 () Bool)

(assert (=> bs!7190 m!202953))

(assert (=> b!173510 d!53033))

(declare-fun b!174133 () Bool)

(declare-fun e!114998 () Option!191)

(assert (=> b!174133 (= e!114998 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))))

(declare-fun b!174136 () Bool)

(declare-fun e!114999 () Option!191)

(assert (=> b!174136 (= e!114999 None!189)))

(declare-fun b!174134 () Bool)

(assert (=> b!174134 (= e!114998 e!114999)))

(declare-fun c!31134 () Bool)

(assert (=> b!174134 (= c!31134 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))) lt!85788))))))

(declare-fun b!174135 () Bool)

(assert (=> b!174135 (= e!114999 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))) lt!85788))))

(declare-fun c!31133 () Bool)

(declare-fun d!53035 () Bool)

(assert (=> d!53035 (= c!31133 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))))) lt!85788)))))

(assert (=> d!53035 (= (getValueByKey!185 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788) e!114998)))

(assert (= (and d!53035 c!31133) b!174133))

(assert (= (and d!53035 (not c!31133)) b!174134))

(assert (= (and b!174134 c!31134) b!174135))

(assert (= (and b!174134 (not c!31134)) b!174136))

(declare-fun m!202955 () Bool)

(assert (=> b!174135 m!202955))

(assert (=> b!173510 d!53035))

(assert (=> b!173737 d!52777))

(declare-fun d!53037 () Bool)

(declare-fun res!82624 () Bool)

(declare-fun e!115000 () Bool)

(assert (=> d!53037 (=> res!82624 e!115000)))

(assert (=> d!53037 (= res!82624 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (= (_1!1631 (h!2819 (toList!1099 lt!85825))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!53037 (= (containsKey!189 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) e!115000)))

(declare-fun b!174137 () Bool)

(declare-fun e!115001 () Bool)

(assert (=> b!174137 (= e!115000 e!115001)))

(declare-fun res!82625 () Bool)

(assert (=> b!174137 (=> (not res!82625) (not e!115001))))

(assert (=> b!174137 (= res!82625 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85825))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85825))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2202) (toList!1099 lt!85825)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85825))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!174138 () Bool)

(assert (=> b!174138 (= e!115001 (containsKey!189 (t!7013 (toList!1099 lt!85825)) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53037 (not res!82624)) b!174137))

(assert (= (and b!174137 res!82625) b!174138))

(assert (=> b!174138 m!201737))

(declare-fun m!202957 () Bool)

(assert (=> b!174138 m!202957))

(assert (=> d!52729 d!53037))

(declare-fun d!53039 () Bool)

(declare-fun lt!86169 () Bool)

(assert (=> d!53039 (= lt!86169 (select (content!149 (toList!1099 lt!85862)) (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!115003 () Bool)

(assert (=> d!53039 (= lt!86169 e!115003)))

(declare-fun res!82627 () Bool)

(assert (=> d!53039 (=> (not res!82627) (not e!115003))))

(assert (=> d!53039 (= res!82627 ((_ is Cons!2202) (toList!1099 lt!85862)))))

(assert (=> d!53039 (= (contains!1155 (toList!1099 lt!85862) (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86169)))

(declare-fun b!174139 () Bool)

(declare-fun e!115002 () Bool)

(assert (=> b!174139 (= e!115003 e!115002)))

(declare-fun res!82626 () Bool)

(assert (=> b!174139 (=> res!82626 e!115002)))

(assert (=> b!174139 (= res!82626 (= (h!2819 (toList!1099 lt!85862)) (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174140 () Bool)

(assert (=> b!174140 (= e!115002 (contains!1155 (t!7013 (toList!1099 lt!85862)) (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53039 res!82627) b!174139))

(assert (= (and b!174139 (not res!82626)) b!174140))

(declare-fun m!202959 () Bool)

(assert (=> d!53039 m!202959))

(declare-fun m!202961 () Bool)

(assert (=> d!53039 m!202961))

(declare-fun m!202963 () Bool)

(assert (=> b!174140 m!202963))

(assert (=> b!173463 d!53039))

(declare-fun d!53041 () Bool)

(assert (=> d!53041 (= (get!1970 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3954 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173460 d!53041))

(declare-fun d!53043 () Bool)

(assert (=> d!53043 (= (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309))) lt!85828)) (v!3956 (getValueByKey!185 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309))) lt!85828)))))

(assert (=> d!52711 d!53043))

(declare-fun e!115004 () Option!191)

(declare-fun b!174141 () Bool)

(assert (=> b!174141 (= e!115004 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)))))))))

(declare-fun b!174144 () Bool)

(declare-fun e!115005 () Option!191)

(assert (=> b!174144 (= e!115005 None!189)))

(declare-fun b!174142 () Bool)

(assert (=> b!174142 (= e!115004 e!115005)))

(declare-fun c!31136 () Bool)

(assert (=> b!174142 (= c!31136 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309))))) lt!85828))))))

(declare-fun b!174143 () Bool)

(assert (=> b!174143 (= e!115005 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)))) lt!85828))))

(declare-fun d!53045 () Bool)

(declare-fun c!31135 () Bool)

(assert (=> d!53045 (= c!31135 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309))))) lt!85828)))))

(assert (=> d!53045 (= (getValueByKey!185 (toList!1099 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309))) lt!85828) e!115004)))

(assert (= (and d!53045 c!31135) b!174141))

(assert (= (and d!53045 (not c!31135)) b!174142))

(assert (= (and b!174142 c!31136) b!174143))

(assert (= (and b!174142 (not c!31136)) b!174144))

(declare-fun m!202965 () Bool)

(assert (=> b!174143 m!202965))

(assert (=> d!52711 d!53045))

(declare-fun d!53047 () Bool)

(declare-fun e!115006 () Bool)

(assert (=> d!53047 e!115006))

(declare-fun res!82628 () Bool)

(assert (=> d!53047 (=> res!82628 e!115006)))

(declare-fun lt!86170 () Bool)

(assert (=> d!53047 (= res!82628 (not lt!86170))))

(declare-fun lt!86172 () Bool)

(assert (=> d!53047 (= lt!86170 lt!86172)))

(declare-fun lt!86173 () Unit!5314)

(declare-fun e!115007 () Unit!5314)

(assert (=> d!53047 (= lt!86173 e!115007)))

(declare-fun c!31137 () Bool)

(assert (=> d!53047 (= c!31137 lt!86172)))

(assert (=> d!53047 (= lt!86172 (containsKey!189 (toList!1099 lt!85889) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53047 (= (contains!1154 lt!85889 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86170)))

(declare-fun b!174145 () Bool)

(declare-fun lt!86171 () Unit!5314)

(assert (=> b!174145 (= e!115007 lt!86171)))

(assert (=> b!174145 (= lt!86171 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85889) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174145 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85889) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174146 () Bool)

(declare-fun Unit!5347 () Unit!5314)

(assert (=> b!174146 (= e!115007 Unit!5347)))

(declare-fun b!174147 () Bool)

(assert (=> b!174147 (= e!115006 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85889) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53047 c!31137) b!174145))

(assert (= (and d!53047 (not c!31137)) b!174146))

(assert (= (and d!53047 (not res!82628)) b!174147))

(declare-fun m!202967 () Bool)

(assert (=> d!53047 m!202967))

(declare-fun m!202969 () Bool)

(assert (=> b!174145 m!202969))

(declare-fun m!202971 () Bool)

(assert (=> b!174145 m!202971))

(assert (=> b!174145 m!202971))

(declare-fun m!202973 () Bool)

(assert (=> b!174145 m!202973))

(assert (=> b!174147 m!202971))

(assert (=> b!174147 m!202971))

(assert (=> b!174147 m!202973))

(assert (=> b!173496 d!53047))

(declare-fun b!174148 () Bool)

(declare-fun e!115008 () Option!191)

(assert (=> b!174148 (= e!115008 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85975)))))))

(declare-fun b!174151 () Bool)

(declare-fun e!115009 () Option!191)

(assert (=> b!174151 (= e!115009 None!189)))

(declare-fun b!174149 () Bool)

(assert (=> b!174149 (= e!115008 e!115009)))

(declare-fun c!31139 () Bool)

(assert (=> b!174149 (= c!31139 (and ((_ is Cons!2202) (toList!1099 lt!85975)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85975))) (_1!1631 (tuple2!3241 lt!85836 v!309))))))))

(declare-fun b!174150 () Bool)

(assert (=> b!174150 (= e!115009 (getValueByKey!185 (t!7013 (toList!1099 lt!85975)) (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun c!31138 () Bool)

(declare-fun d!53049 () Bool)

(assert (=> d!53049 (= c!31138 (and ((_ is Cons!2202) (toList!1099 lt!85975)) (= (_1!1631 (h!2819 (toList!1099 lt!85975))) (_1!1631 (tuple2!3241 lt!85836 v!309)))))))

(assert (=> d!53049 (= (getValueByKey!185 (toList!1099 lt!85975) (_1!1631 (tuple2!3241 lt!85836 v!309))) e!115008)))

(assert (= (and d!53049 c!31138) b!174148))

(assert (= (and d!53049 (not c!31138)) b!174149))

(assert (= (and b!174149 c!31139) b!174150))

(assert (= (and b!174149 (not c!31139)) b!174151))

(declare-fun m!202975 () Bool)

(assert (=> b!174150 m!202975))

(assert (=> b!173623 d!53049))

(assert (=> b!173595 d!52809))

(declare-fun d!53051 () Bool)

(assert (=> d!53051 (arrayContainsKey!0 (_keys!5439 thiss!1248) lt!85954 #b00000000000000000000000000000000)))

(declare-fun lt!86174 () Unit!5314)

(assert (=> d!53051 (= lt!86174 (choose!13 (_keys!5439 thiss!1248) lt!85954 #b00000000000000000000000000000000))))

(assert (=> d!53051 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!53051 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5439 thiss!1248) lt!85954 #b00000000000000000000000000000000) lt!86174)))

(declare-fun bs!7191 () Bool)

(assert (= bs!7191 d!53051))

(assert (=> bs!7191 m!202115))

(declare-fun m!202977 () Bool)

(assert (=> bs!7191 m!202977))

(assert (=> b!173611 d!53051))

(declare-fun d!53053 () Bool)

(declare-fun res!82629 () Bool)

(declare-fun e!115010 () Bool)

(assert (=> d!53053 (=> res!82629 e!115010)))

(assert (=> d!53053 (= res!82629 (= (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) lt!85954))))

(assert (=> d!53053 (= (arrayContainsKey!0 (_keys!5439 thiss!1248) lt!85954 #b00000000000000000000000000000000) e!115010)))

(declare-fun b!174152 () Bool)

(declare-fun e!115011 () Bool)

(assert (=> b!174152 (= e!115010 e!115011)))

(declare-fun res!82630 () Bool)

(assert (=> b!174152 (=> (not res!82630) (not e!115011))))

(assert (=> b!174152 (= res!82630 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!174153 () Bool)

(assert (=> b!174153 (= e!115011 (arrayContainsKey!0 (_keys!5439 thiss!1248) lt!85954 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!53053 (not res!82629)) b!174152))

(assert (= (and b!174152 res!82630) b!174153))

(assert (=> d!53053 m!201737))

(declare-fun m!202979 () Bool)

(assert (=> b!174153 m!202979))

(assert (=> b!173611 d!53053))

(declare-fun b!174154 () Bool)

(declare-fun e!115013 () SeekEntryResult!542)

(assert (=> b!174154 (= e!115013 Undefined!542)))

(declare-fun d!53055 () Bool)

(declare-fun lt!86177 () SeekEntryResult!542)

(assert (=> d!53055 (and (or ((_ is Undefined!542) lt!86177) (not ((_ is Found!542) lt!86177)) (and (bvsge (index!4337 lt!86177) #b00000000000000000000000000000000) (bvslt (index!4337 lt!86177) (size!3766 (_keys!5439 thiss!1248))))) (or ((_ is Undefined!542) lt!86177) ((_ is Found!542) lt!86177) (not ((_ is MissingZero!542) lt!86177)) (and (bvsge (index!4336 lt!86177) #b00000000000000000000000000000000) (bvslt (index!4336 lt!86177) (size!3766 (_keys!5439 thiss!1248))))) (or ((_ is Undefined!542) lt!86177) ((_ is Found!542) lt!86177) ((_ is MissingZero!542) lt!86177) (not ((_ is MissingVacant!542) lt!86177)) (and (bvsge (index!4339 lt!86177) #b00000000000000000000000000000000) (bvslt (index!4339 lt!86177) (size!3766 (_keys!5439 thiss!1248))))) (or ((_ is Undefined!542) lt!86177) (ite ((_ is Found!542) lt!86177) (= (select (arr!3467 (_keys!5439 thiss!1248)) (index!4337 lt!86177)) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!542) lt!86177) (= (select (arr!3467 (_keys!5439 thiss!1248)) (index!4336 lt!86177)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!542) lt!86177) (= (select (arr!3467 (_keys!5439 thiss!1248)) (index!4339 lt!86177)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53055 (= lt!86177 e!115013)))

(declare-fun c!31140 () Bool)

(declare-fun lt!86176 () SeekEntryResult!542)

(assert (=> d!53055 (= c!31140 (and ((_ is Intermediate!542) lt!86176) (undefined!1354 lt!86176)))))

(assert (=> d!53055 (= lt!86176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (mask!8470 thiss!1248)) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)))))

(assert (=> d!53055 (validMask!0 (mask!8470 thiss!1248))))

(assert (=> d!53055 (= (seekEntryOrOpen!0 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)) lt!86177)))

(declare-fun b!174155 () Bool)

(declare-fun e!115014 () SeekEntryResult!542)

(assert (=> b!174155 (= e!115013 e!115014)))

(declare-fun lt!86175 () (_ BitVec 64))

(assert (=> b!174155 (= lt!86175 (select (arr!3467 (_keys!5439 thiss!1248)) (index!4338 lt!86176)))))

(declare-fun c!31141 () Bool)

(assert (=> b!174155 (= c!31141 (= lt!86175 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174156 () Bool)

(declare-fun e!115012 () SeekEntryResult!542)

(assert (=> b!174156 (= e!115012 (MissingZero!542 (index!4338 lt!86176)))))

(declare-fun b!174157 () Bool)

(assert (=> b!174157 (= e!115012 (seekKeyOrZeroReturnVacant!0 (x!19196 lt!86176) (index!4338 lt!86176) (index!4338 lt!86176) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)))))

(declare-fun b!174158 () Bool)

(declare-fun c!31142 () Bool)

(assert (=> b!174158 (= c!31142 (= lt!86175 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174158 (= e!115014 e!115012)))

(declare-fun b!174159 () Bool)

(assert (=> b!174159 (= e!115014 (Found!542 (index!4338 lt!86176)))))

(assert (= (and d!53055 c!31140) b!174154))

(assert (= (and d!53055 (not c!31140)) b!174155))

(assert (= (and b!174155 c!31141) b!174159))

(assert (= (and b!174155 (not c!31141)) b!174158))

(assert (= (and b!174158 c!31142) b!174156))

(assert (= (and b!174158 (not c!31142)) b!174157))

(declare-fun m!202981 () Bool)

(assert (=> d!53055 m!202981))

(declare-fun m!202983 () Bool)

(assert (=> d!53055 m!202983))

(assert (=> d!53055 m!201737))

(declare-fun m!202985 () Bool)

(assert (=> d!53055 m!202985))

(assert (=> d!53055 m!201729))

(declare-fun m!202987 () Bool)

(assert (=> d!53055 m!202987))

(declare-fun m!202989 () Bool)

(assert (=> d!53055 m!202989))

(assert (=> d!53055 m!201737))

(assert (=> d!53055 m!202983))

(declare-fun m!202991 () Bool)

(assert (=> b!174155 m!202991))

(assert (=> b!174157 m!201737))

(declare-fun m!202993 () Bool)

(assert (=> b!174157 m!202993))

(assert (=> b!173611 d!53055))

(declare-fun d!53057 () Bool)

(declare-fun e!115015 () Bool)

(assert (=> d!53057 e!115015))

(declare-fun res!82631 () Bool)

(assert (=> d!53057 (=> res!82631 e!115015)))

(declare-fun lt!86178 () Bool)

(assert (=> d!53057 (= res!82631 (not lt!86178))))

(declare-fun lt!86180 () Bool)

(assert (=> d!53057 (= lt!86178 lt!86180)))

(declare-fun lt!86181 () Unit!5314)

(declare-fun e!115016 () Unit!5314)

(assert (=> d!53057 (= lt!86181 e!115016)))

(declare-fun c!31143 () Bool)

(assert (=> d!53057 (= c!31143 lt!86180)))

(assert (=> d!53057 (= lt!86180 (containsKey!189 (toList!1099 lt!85975) (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(assert (=> d!53057 (= (contains!1154 lt!85975 (_1!1631 (tuple2!3241 lt!85836 v!309))) lt!86178)))

(declare-fun b!174160 () Bool)

(declare-fun lt!86179 () Unit!5314)

(assert (=> b!174160 (= e!115016 lt!86179)))

(assert (=> b!174160 (= lt!86179 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85975) (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(assert (=> b!174160 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85975) (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun b!174161 () Bool)

(declare-fun Unit!5348 () Unit!5314)

(assert (=> b!174161 (= e!115016 Unit!5348)))

(declare-fun b!174162 () Bool)

(assert (=> b!174162 (= e!115015 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85975) (_1!1631 (tuple2!3241 lt!85836 v!309)))))))

(assert (= (and d!53057 c!31143) b!174160))

(assert (= (and d!53057 (not c!31143)) b!174161))

(assert (= (and d!53057 (not res!82631)) b!174162))

(declare-fun m!202995 () Bool)

(assert (=> d!53057 m!202995))

(declare-fun m!202997 () Bool)

(assert (=> b!174160 m!202997))

(assert (=> b!174160 m!202199))

(assert (=> b!174160 m!202199))

(declare-fun m!202999 () Bool)

(assert (=> b!174160 m!202999))

(assert (=> b!174162 m!202199))

(assert (=> b!174162 m!202199))

(assert (=> b!174162 m!202999))

(assert (=> d!52715 d!53057))

(declare-fun b!174163 () Bool)

(declare-fun e!115017 () Option!191)

(assert (=> b!174163 (= e!115017 (Some!190 (_2!1631 (h!2819 lt!85976))))))

(declare-fun b!174166 () Bool)

(declare-fun e!115018 () Option!191)

(assert (=> b!174166 (= e!115018 None!189)))

(declare-fun b!174164 () Bool)

(assert (=> b!174164 (= e!115017 e!115018)))

(declare-fun c!31145 () Bool)

(assert (=> b!174164 (= c!31145 (and ((_ is Cons!2202) lt!85976) (not (= (_1!1631 (h!2819 lt!85976)) (_1!1631 (tuple2!3241 lt!85836 v!309))))))))

(declare-fun b!174165 () Bool)

(assert (=> b!174165 (= e!115018 (getValueByKey!185 (t!7013 lt!85976) (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun d!53059 () Bool)

(declare-fun c!31144 () Bool)

(assert (=> d!53059 (= c!31144 (and ((_ is Cons!2202) lt!85976) (= (_1!1631 (h!2819 lt!85976)) (_1!1631 (tuple2!3241 lt!85836 v!309)))))))

(assert (=> d!53059 (= (getValueByKey!185 lt!85976 (_1!1631 (tuple2!3241 lt!85836 v!309))) e!115017)))

(assert (= (and d!53059 c!31144) b!174163))

(assert (= (and d!53059 (not c!31144)) b!174164))

(assert (= (and b!174164 c!31145) b!174165))

(assert (= (and b!174164 (not c!31145)) b!174166))

(declare-fun m!203001 () Bool)

(assert (=> b!174165 m!203001))

(assert (=> d!52715 d!53059))

(declare-fun d!53061 () Bool)

(assert (=> d!53061 (= (getValueByKey!185 lt!85976 (_1!1631 (tuple2!3241 lt!85836 v!309))) (Some!190 (_2!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun lt!86182 () Unit!5314)

(assert (=> d!53061 (= lt!86182 (choose!931 lt!85976 (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun e!115019 () Bool)

(assert (=> d!53061 e!115019))

(declare-fun res!82632 () Bool)

(assert (=> d!53061 (=> (not res!82632) (not e!115019))))

(assert (=> d!53061 (= res!82632 (isStrictlySorted!332 lt!85976))))

(assert (=> d!53061 (= (lemmaContainsTupThenGetReturnValue!98 lt!85976 (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309))) lt!86182)))

(declare-fun b!174167 () Bool)

(declare-fun res!82633 () Bool)

(assert (=> b!174167 (=> (not res!82633) (not e!115019))))

(assert (=> b!174167 (= res!82633 (containsKey!189 lt!85976 (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun b!174168 () Bool)

(assert (=> b!174168 (= e!115019 (contains!1155 lt!85976 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309)))))))

(assert (= (and d!53061 res!82632) b!174167))

(assert (= (and b!174167 res!82633) b!174168))

(assert (=> d!53061 m!202193))

(declare-fun m!203003 () Bool)

(assert (=> d!53061 m!203003))

(declare-fun m!203005 () Bool)

(assert (=> d!53061 m!203005))

(declare-fun m!203007 () Bool)

(assert (=> b!174167 m!203007))

(declare-fun m!203009 () Bool)

(assert (=> b!174168 m!203009))

(assert (=> d!52715 d!53061))

(declare-fun bm!17647 () Bool)

(declare-fun call!17651 () List!2206)

(declare-fun call!17649 () List!2206)

(assert (=> bm!17647 (= call!17651 call!17649)))

(declare-fun c!31147 () Bool)

(declare-fun e!115023 () List!2206)

(declare-fun c!31149 () Bool)

(declare-fun b!174169 () Bool)

(assert (=> b!174169 (= e!115023 (ite c!31147 (t!7013 (toList!1099 lt!85826)) (ite c!31149 (Cons!2202 (h!2819 (toList!1099 lt!85826)) (t!7013 (toList!1099 lt!85826))) Nil!2203)))))

(declare-fun b!174170 () Bool)

(declare-fun res!82634 () Bool)

(declare-fun e!115024 () Bool)

(assert (=> b!174170 (=> (not res!82634) (not e!115024))))

(declare-fun lt!86183 () List!2206)

(assert (=> b!174170 (= res!82634 (containsKey!189 lt!86183 (_1!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun b!174171 () Bool)

(declare-fun e!115021 () List!2206)

(assert (=> b!174171 (= e!115021 call!17649)))

(declare-fun b!174172 () Bool)

(assert (=> b!174172 (= c!31149 (and ((_ is Cons!2202) (toList!1099 lt!85826)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85826))) (_1!1631 (tuple2!3241 lt!85836 v!309)))))))

(declare-fun e!115022 () List!2206)

(declare-fun e!115020 () List!2206)

(assert (=> b!174172 (= e!115022 e!115020)))

(declare-fun b!174173 () Bool)

(declare-fun call!17650 () List!2206)

(assert (=> b!174173 (= e!115020 call!17650)))

(declare-fun b!174174 () Bool)

(assert (=> b!174174 (= e!115020 call!17650)))

(declare-fun b!174175 () Bool)

(assert (=> b!174175 (= e!115021 e!115022)))

(assert (=> b!174175 (= c!31147 (and ((_ is Cons!2202) (toList!1099 lt!85826)) (= (_1!1631 (h!2819 (toList!1099 lt!85826))) (_1!1631 (tuple2!3241 lt!85836 v!309)))))))

(declare-fun bm!17646 () Bool)

(declare-fun c!31146 () Bool)

(assert (=> bm!17646 (= call!17649 ($colon$colon!98 e!115023 (ite c!31146 (h!2819 (toList!1099 lt!85826)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309))))))))

(declare-fun c!31148 () Bool)

(assert (=> bm!17646 (= c!31148 c!31146)))

(declare-fun d!53063 () Bool)

(assert (=> d!53063 e!115024))

(declare-fun res!82635 () Bool)

(assert (=> d!53063 (=> (not res!82635) (not e!115024))))

(assert (=> d!53063 (= res!82635 (isStrictlySorted!332 lt!86183))))

(assert (=> d!53063 (= lt!86183 e!115021)))

(assert (=> d!53063 (= c!31146 (and ((_ is Cons!2202) (toList!1099 lt!85826)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85826))) (_1!1631 (tuple2!3241 lt!85836 v!309)))))))

(assert (=> d!53063 (isStrictlySorted!332 (toList!1099 lt!85826))))

(assert (=> d!53063 (= (insertStrictlySorted!101 (toList!1099 lt!85826) (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309))) lt!86183)))

(declare-fun bm!17648 () Bool)

(assert (=> bm!17648 (= call!17650 call!17651)))

(declare-fun b!174176 () Bool)

(assert (=> b!174176 (= e!115022 call!17651)))

(declare-fun b!174177 () Bool)

(assert (=> b!174177 (= e!115023 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85826)) (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309))))))

(declare-fun b!174178 () Bool)

(assert (=> b!174178 (= e!115024 (contains!1155 lt!86183 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85836 v!309)) (_2!1631 (tuple2!3241 lt!85836 v!309)))))))

(assert (= (and d!53063 c!31146) b!174171))

(assert (= (and d!53063 (not c!31146)) b!174175))

(assert (= (and b!174175 c!31147) b!174176))

(assert (= (and b!174175 (not c!31147)) b!174172))

(assert (= (and b!174172 c!31149) b!174173))

(assert (= (and b!174172 (not c!31149)) b!174174))

(assert (= (or b!174173 b!174174) bm!17648))

(assert (= (or b!174176 bm!17648) bm!17647))

(assert (= (or b!174171 bm!17647) bm!17646))

(assert (= (and bm!17646 c!31148) b!174177))

(assert (= (and bm!17646 (not c!31148)) b!174169))

(assert (= (and d!53063 res!82635) b!174170))

(assert (= (and b!174170 res!82634) b!174178))

(declare-fun m!203011 () Bool)

(assert (=> b!174178 m!203011))

(declare-fun m!203013 () Bool)

(assert (=> bm!17646 m!203013))

(declare-fun m!203015 () Bool)

(assert (=> b!174177 m!203015))

(declare-fun m!203017 () Bool)

(assert (=> b!174170 m!203017))

(declare-fun m!203019 () Bool)

(assert (=> d!53063 m!203019))

(declare-fun m!203021 () Bool)

(assert (=> d!53063 m!203021))

(assert (=> d!52715 d!53063))

(assert (=> b!173691 d!52659))

(declare-fun d!53065 () Bool)

(declare-fun lt!86184 () Bool)

(assert (=> d!53065 (= lt!86184 (select (content!149 (toList!1099 lt!85903)) (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))

(declare-fun e!115026 () Bool)

(assert (=> d!53065 (= lt!86184 e!115026)))

(declare-fun res!82637 () Bool)

(assert (=> d!53065 (=> (not res!82637) (not e!115026))))

(assert (=> d!53065 (= res!82637 ((_ is Cons!2202) (toList!1099 lt!85903)))))

(assert (=> d!53065 (= (contains!1155 (toList!1099 lt!85903) (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) lt!86184)))

(declare-fun b!174179 () Bool)

(declare-fun e!115025 () Bool)

(assert (=> b!174179 (= e!115026 e!115025)))

(declare-fun res!82636 () Bool)

(assert (=> b!174179 (=> res!82636 e!115025)))

(assert (=> b!174179 (= res!82636 (= (h!2819 (toList!1099 lt!85903)) (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))

(declare-fun b!174180 () Bool)

(assert (=> b!174180 (= e!115025 (contains!1155 (t!7013 (toList!1099 lt!85903)) (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))

(assert (= (and d!53065 res!82637) b!174179))

(assert (= (and b!174179 (not res!82636)) b!174180))

(declare-fun m!203023 () Bool)

(assert (=> d!53065 m!203023))

(declare-fun m!203025 () Bool)

(assert (=> d!53065 m!203025))

(declare-fun m!203027 () Bool)

(assert (=> b!174180 m!203027))

(assert (=> b!173513 d!53065))

(declare-fun d!53067 () Bool)

(declare-fun lt!86185 () Bool)

(assert (=> d!53067 (= lt!86185 (select (content!149 (toList!1099 lt!85911)) (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))

(declare-fun e!115028 () Bool)

(assert (=> d!53067 (= lt!86185 e!115028)))

(declare-fun res!82639 () Bool)

(assert (=> d!53067 (=> (not res!82639) (not e!115028))))

(assert (=> d!53067 (= res!82639 ((_ is Cons!2202) (toList!1099 lt!85911)))))

(assert (=> d!53067 (= (contains!1155 (toList!1099 lt!85911) (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) lt!86185)))

(declare-fun b!174181 () Bool)

(declare-fun e!115027 () Bool)

(assert (=> b!174181 (= e!115028 e!115027)))

(declare-fun res!82638 () Bool)

(assert (=> b!174181 (=> res!82638 e!115027)))

(assert (=> b!174181 (= res!82638 (= (h!2819 (toList!1099 lt!85911)) (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))

(declare-fun b!174182 () Bool)

(assert (=> b!174182 (= e!115027 (contains!1155 (t!7013 (toList!1099 lt!85911)) (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))

(assert (= (and d!53067 res!82639) b!174181))

(assert (= (and b!174181 (not res!82638)) b!174182))

(declare-fun m!203029 () Bool)

(assert (=> d!53067 m!203029))

(declare-fun m!203031 () Bool)

(assert (=> d!53067 m!203031))

(declare-fun m!203033 () Bool)

(assert (=> b!174182 m!203033))

(assert (=> b!173517 d!53067))

(declare-fun d!53069 () Bool)

(declare-fun res!82640 () Bool)

(declare-fun e!115029 () Bool)

(assert (=> d!53069 (=> res!82640 e!115029)))

(assert (=> d!53069 (= res!82640 (and ((_ is Cons!2202) (toList!1099 lt!85825)) (= (_1!1631 (h!2819 (toList!1099 lt!85825))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53069 (= (containsKey!189 (toList!1099 lt!85825) #b0000000000000000000000000000000000000000000000000000000000000000) e!115029)))

(declare-fun b!174183 () Bool)

(declare-fun e!115030 () Bool)

(assert (=> b!174183 (= e!115029 e!115030)))

(declare-fun res!82641 () Bool)

(assert (=> b!174183 (=> (not res!82641) (not e!115030))))

(assert (=> b!174183 (= res!82641 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85825))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85825))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2202) (toList!1099 lt!85825)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85825))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174184 () Bool)

(assert (=> b!174184 (= e!115030 (containsKey!189 (t!7013 (toList!1099 lt!85825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53069 (not res!82640)) b!174183))

(assert (= (and b!174183 res!82641) b!174184))

(declare-fun m!203035 () Bool)

(assert (=> b!174184 m!203035))

(assert (=> d!52657 d!53069))

(declare-fun d!53071 () Bool)

(declare-fun e!115031 () Bool)

(assert (=> d!53071 e!115031))

(declare-fun res!82642 () Bool)

(assert (=> d!53071 (=> res!82642 e!115031)))

(declare-fun lt!86186 () Bool)

(assert (=> d!53071 (= res!82642 (not lt!86186))))

(declare-fun lt!86188 () Bool)

(assert (=> d!53071 (= lt!86186 lt!86188)))

(declare-fun lt!86189 () Unit!5314)

(declare-fun e!115032 () Unit!5314)

(assert (=> d!53071 (= lt!86189 e!115032)))

(declare-fun c!31150 () Bool)

(assert (=> d!53071 (= c!31150 lt!86188)))

(assert (=> d!53071 (= lt!86188 (containsKey!189 (toList!1099 lt!85966) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!53071 (= (contains!1154 lt!85966 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) lt!86186)))

(declare-fun b!174185 () Bool)

(declare-fun lt!86187 () Unit!5314)

(assert (=> b!174185 (= e!115032 lt!86187)))

(assert (=> b!174185 (= lt!86187 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85966) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(assert (=> b!174185 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85966) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174186 () Bool)

(declare-fun Unit!5349 () Unit!5314)

(assert (=> b!174186 (= e!115032 Unit!5349)))

(declare-fun b!174187 () Bool)

(assert (=> b!174187 (= e!115031 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85966) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53071 c!31150) b!174185))

(assert (= (and d!53071 (not c!31150)) b!174186))

(assert (= (and d!53071 (not res!82642)) b!174187))

(declare-fun m!203037 () Bool)

(assert (=> d!53071 m!203037))

(declare-fun m!203039 () Bool)

(assert (=> b!174185 m!203039))

(assert (=> b!174185 m!202155))

(assert (=> b!174185 m!202155))

(declare-fun m!203041 () Bool)

(assert (=> b!174185 m!203041))

(assert (=> b!174187 m!202155))

(assert (=> b!174187 m!202155))

(assert (=> b!174187 m!203041))

(assert (=> d!52701 d!53071))

(declare-fun b!174188 () Bool)

(declare-fun e!115033 () Option!191)

(assert (=> b!174188 (= e!115033 (Some!190 (_2!1631 (h!2819 lt!85967))))))

(declare-fun b!174191 () Bool)

(declare-fun e!115034 () Option!191)

(assert (=> b!174191 (= e!115034 None!189)))

(declare-fun b!174189 () Bool)

(assert (=> b!174189 (= e!115033 e!115034)))

(declare-fun c!31152 () Bool)

(assert (=> b!174189 (= c!31152 (and ((_ is Cons!2202) lt!85967) (not (= (_1!1631 (h!2819 lt!85967)) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!174190 () Bool)

(assert (=> b!174190 (= e!115034 (getValueByKey!185 (t!7013 lt!85967) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun c!31151 () Bool)

(declare-fun d!53073 () Bool)

(assert (=> d!53073 (= c!31151 (and ((_ is Cons!2202) lt!85967) (= (_1!1631 (h!2819 lt!85967)) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53073 (= (getValueByKey!185 lt!85967 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) e!115033)))

(assert (= (and d!53073 c!31151) b!174188))

(assert (= (and d!53073 (not c!31151)) b!174189))

(assert (= (and b!174189 c!31152) b!174190))

(assert (= (and b!174189 (not c!31152)) b!174191))

(declare-fun m!203043 () Bool)

(assert (=> b!174190 m!203043))

(assert (=> d!52701 d!53073))

(declare-fun d!53075 () Bool)

(assert (=> d!53075 (= (getValueByKey!185 lt!85967 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!86190 () Unit!5314)

(assert (=> d!53075 (= lt!86190 (choose!931 lt!85967 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun e!115035 () Bool)

(assert (=> d!53075 e!115035))

(declare-fun res!82643 () Bool)

(assert (=> d!53075 (=> (not res!82643) (not e!115035))))

(assert (=> d!53075 (= res!82643 (isStrictlySorted!332 lt!85967))))

(assert (=> d!53075 (= (lemmaContainsTupThenGetReturnValue!98 lt!85967 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) lt!86190)))

(declare-fun b!174192 () Bool)

(declare-fun res!82644 () Bool)

(assert (=> b!174192 (=> (not res!82644) (not e!115035))))

(assert (=> b!174192 (= res!82644 (containsKey!189 lt!85967 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174193 () Bool)

(assert (=> b!174193 (= e!115035 (contains!1155 lt!85967 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53075 res!82643) b!174192))

(assert (= (and b!174192 res!82644) b!174193))

(assert (=> d!53075 m!202149))

(declare-fun m!203045 () Bool)

(assert (=> d!53075 m!203045))

(declare-fun m!203047 () Bool)

(assert (=> d!53075 m!203047))

(declare-fun m!203049 () Bool)

(assert (=> b!174192 m!203049))

(declare-fun m!203051 () Bool)

(assert (=> b!174193 m!203051))

(assert (=> d!52701 d!53075))

(declare-fun bm!17650 () Bool)

(declare-fun call!17654 () List!2206)

(declare-fun call!17652 () List!2206)

(assert (=> bm!17650 (= call!17654 call!17652)))

(declare-fun c!31156 () Bool)

(declare-fun e!115039 () List!2206)

(declare-fun b!174194 () Bool)

(declare-fun c!31154 () Bool)

(assert (=> b!174194 (= e!115039 (ite c!31154 (t!7013 (toList!1099 lt!85840)) (ite c!31156 (Cons!2202 (h!2819 (toList!1099 lt!85840)) (t!7013 (toList!1099 lt!85840))) Nil!2203)))))

(declare-fun b!174195 () Bool)

(declare-fun res!82645 () Bool)

(declare-fun e!115040 () Bool)

(assert (=> b!174195 (=> (not res!82645) (not e!115040))))

(declare-fun lt!86191 () List!2206)

(assert (=> b!174195 (= res!82645 (containsKey!189 lt!86191 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174196 () Bool)

(declare-fun e!115037 () List!2206)

(assert (=> b!174196 (= e!115037 call!17652)))

(declare-fun b!174197 () Bool)

(assert (=> b!174197 (= c!31156 (and ((_ is Cons!2202) (toList!1099 lt!85840)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85840))) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(declare-fun e!115038 () List!2206)

(declare-fun e!115036 () List!2206)

(assert (=> b!174197 (= e!115038 e!115036)))

(declare-fun b!174198 () Bool)

(declare-fun call!17653 () List!2206)

(assert (=> b!174198 (= e!115036 call!17653)))

(declare-fun b!174199 () Bool)

(assert (=> b!174199 (= e!115036 call!17653)))

(declare-fun b!174200 () Bool)

(assert (=> b!174200 (= e!115037 e!115038)))

(assert (=> b!174200 (= c!31154 (and ((_ is Cons!2202) (toList!1099 lt!85840)) (= (_1!1631 (h!2819 (toList!1099 lt!85840))) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(declare-fun c!31153 () Bool)

(declare-fun bm!17649 () Bool)

(assert (=> bm!17649 (= call!17652 ($colon$colon!98 e!115039 (ite c!31153 (h!2819 (toList!1099 lt!85840)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))))

(declare-fun c!31155 () Bool)

(assert (=> bm!17649 (= c!31155 c!31153)))

(declare-fun d!53077 () Bool)

(assert (=> d!53077 e!115040))

(declare-fun res!82646 () Bool)

(assert (=> d!53077 (=> (not res!82646) (not e!115040))))

(assert (=> d!53077 (= res!82646 (isStrictlySorted!332 lt!86191))))

(assert (=> d!53077 (= lt!86191 e!115037)))

(assert (=> d!53077 (= c!31153 (and ((_ is Cons!2202) (toList!1099 lt!85840)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85840))) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53077 (isStrictlySorted!332 (toList!1099 lt!85840))))

(assert (=> d!53077 (= (insertStrictlySorted!101 (toList!1099 lt!85840) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) lt!86191)))

(declare-fun bm!17651 () Bool)

(assert (=> bm!17651 (= call!17653 call!17654)))

(declare-fun b!174201 () Bool)

(assert (=> b!174201 (= e!115038 call!17654)))

(declare-fun b!174202 () Bool)

(assert (=> b!174202 (= e!115039 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85840)) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174203 () Bool)

(assert (=> b!174203 (= e!115040 (contains!1155 lt!86191 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53077 c!31153) b!174196))

(assert (= (and d!53077 (not c!31153)) b!174200))

(assert (= (and b!174200 c!31154) b!174201))

(assert (= (and b!174200 (not c!31154)) b!174197))

(assert (= (and b!174197 c!31156) b!174198))

(assert (= (and b!174197 (not c!31156)) b!174199))

(assert (= (or b!174198 b!174199) bm!17651))

(assert (= (or b!174201 bm!17651) bm!17650))

(assert (= (or b!174196 bm!17650) bm!17649))

(assert (= (and bm!17649 c!31155) b!174202))

(assert (= (and bm!17649 (not c!31155)) b!174194))

(assert (= (and d!53077 res!82646) b!174195))

(assert (= (and b!174195 res!82645) b!174203))

(declare-fun m!203053 () Bool)

(assert (=> b!174203 m!203053))

(declare-fun m!203055 () Bool)

(assert (=> bm!17649 m!203055))

(declare-fun m!203057 () Bool)

(assert (=> b!174202 m!203057))

(declare-fun m!203059 () Bool)

(assert (=> b!174195 m!203059))

(declare-fun m!203061 () Bool)

(assert (=> d!53077 m!203061))

(declare-fun m!203063 () Bool)

(assert (=> d!53077 m!203063))

(assert (=> d!52701 d!53077))

(declare-fun d!53079 () Bool)

(assert (=> d!53079 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!86192 () Unit!5314)

(assert (=> d!53079 (= lt!86192 (choose!932 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!115041 () Bool)

(assert (=> d!53079 e!115041))

(declare-fun res!82647 () Bool)

(assert (=> d!53079 (=> (not res!82647) (not e!115041))))

(assert (=> d!53079 (= res!82647 (isStrictlySorted!332 (toList!1099 lt!85817)))))

(assert (=> d!53079 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86192)))

(declare-fun b!174204 () Bool)

(assert (=> b!174204 (= e!115041 (containsKey!189 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53079 res!82647) b!174204))

(assert (=> d!53079 m!201797))

(assert (=> d!53079 m!201797))

(assert (=> d!53079 m!202049))

(declare-fun m!203065 () Bool)

(assert (=> d!53079 m!203065))

(declare-fun m!203067 () Bool)

(assert (=> d!53079 m!203067))

(assert (=> b!174204 m!202045))

(assert (=> b!173526 d!53079))

(assert (=> b!173526 d!52859))

(assert (=> b!173526 d!52755))

(assert (=> d!52669 d!52667))

(declare-fun d!53081 () Bool)

(assert (=> d!53081 (= (getValueByKey!185 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!53081 true))

(declare-fun _$22!535 () Unit!5314)

(assert (=> d!53081 (= (choose!931 lt!85818 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) _$22!535)))

(declare-fun bs!7192 () Bool)

(assert (= bs!7192 d!53081))

(assert (=> bs!7192 m!201791))

(assert (=> d!52669 d!53081))

(declare-fun d!53083 () Bool)

(declare-fun res!82648 () Bool)

(declare-fun e!115042 () Bool)

(assert (=> d!53083 (=> res!82648 e!115042)))

(assert (=> d!53083 (= res!82648 (or ((_ is Nil!2203) lt!85818) ((_ is Nil!2203) (t!7013 lt!85818))))))

(assert (=> d!53083 (= (isStrictlySorted!332 lt!85818) e!115042)))

(declare-fun b!174205 () Bool)

(declare-fun e!115043 () Bool)

(assert (=> b!174205 (= e!115042 e!115043)))

(declare-fun res!82649 () Bool)

(assert (=> b!174205 (=> (not res!82649) (not e!115043))))

(assert (=> b!174205 (= res!82649 (bvslt (_1!1631 (h!2819 lt!85818)) (_1!1631 (h!2819 (t!7013 lt!85818)))))))

(declare-fun b!174206 () Bool)

(assert (=> b!174206 (= e!115043 (isStrictlySorted!332 (t!7013 lt!85818)))))

(assert (= (and d!53083 (not res!82648)) b!174205))

(assert (= (and b!174205 res!82649) b!174206))

(declare-fun m!203069 () Bool)

(assert (=> b!174206 m!203069))

(assert (=> d!52669 d!53083))

(assert (=> d!52645 d!52625))

(declare-fun d!53085 () Bool)

(declare-fun e!115044 () Bool)

(assert (=> d!53085 e!115044))

(declare-fun res!82650 () Bool)

(assert (=> d!53085 (=> res!82650 e!115044)))

(declare-fun lt!86193 () Bool)

(assert (=> d!53085 (= res!82650 (not lt!86193))))

(declare-fun lt!86195 () Bool)

(assert (=> d!53085 (= lt!86193 lt!86195)))

(declare-fun lt!86196 () Unit!5314)

(declare-fun e!115045 () Unit!5314)

(assert (=> d!53085 (= lt!86196 e!115045)))

(declare-fun c!31157 () Bool)

(assert (=> d!53085 (= c!31157 lt!86195)))

(assert (=> d!53085 (= lt!86195 (containsKey!189 (toList!1099 lt!85792) lt!85796))))

(assert (=> d!53085 (= (contains!1154 lt!85792 lt!85796) lt!86193)))

(declare-fun b!174207 () Bool)

(declare-fun lt!86194 () Unit!5314)

(assert (=> b!174207 (= e!115045 lt!86194)))

(assert (=> b!174207 (= lt!86194 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85792) lt!85796))))

(assert (=> b!174207 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85792) lt!85796))))

(declare-fun b!174208 () Bool)

(declare-fun Unit!5350 () Unit!5314)

(assert (=> b!174208 (= e!115045 Unit!5350)))

(declare-fun b!174209 () Bool)

(assert (=> b!174209 (= e!115044 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85792) lt!85796)))))

(assert (= (and d!53085 c!31157) b!174207))

(assert (= (and d!53085 (not c!31157)) b!174208))

(assert (= (and d!53085 (not res!82650)) b!174209))

(declare-fun m!203071 () Bool)

(assert (=> d!53085 m!203071))

(declare-fun m!203073 () Bool)

(assert (=> b!174207 m!203073))

(assert (=> b!174207 m!201921))

(assert (=> b!174207 m!201921))

(declare-fun m!203075 () Bool)

(assert (=> b!174207 m!203075))

(assert (=> b!174209 m!201921))

(assert (=> b!174209 m!201921))

(assert (=> b!174209 m!203075))

(assert (=> d!52645 d!53085))

(assert (=> d!52645 d!52647))

(declare-fun d!53087 () Bool)

(assert (=> d!53087 (= (apply!130 (+!246 lt!85792 (tuple2!3241 lt!85802 (minValue!3441 thiss!1248))) lt!85796) (apply!130 lt!85792 lt!85796))))

(assert (=> d!53087 true))

(declare-fun _$34!1056 () Unit!5314)

(assert (=> d!53087 (= (choose!929 lt!85792 lt!85802 (minValue!3441 thiss!1248) lt!85796) _$34!1056)))

(declare-fun bs!7193 () Bool)

(assert (= bs!7193 d!53087))

(assert (=> bs!7193 m!201759))

(assert (=> bs!7193 m!201759))

(assert (=> bs!7193 m!201761))

(assert (=> bs!7193 m!201757))

(assert (=> d!52645 d!53087))

(assert (=> d!52645 d!52631))

(declare-fun d!53089 () Bool)

(declare-fun e!115046 () Bool)

(assert (=> d!53089 e!115046))

(declare-fun res!82651 () Bool)

(assert (=> d!53089 (=> res!82651 e!115046)))

(declare-fun lt!86197 () Bool)

(assert (=> d!53089 (= res!82651 (not lt!86197))))

(declare-fun lt!86199 () Bool)

(assert (=> d!53089 (= lt!86197 lt!86199)))

(declare-fun lt!86200 () Unit!5314)

(declare-fun e!115047 () Unit!5314)

(assert (=> d!53089 (= lt!86200 e!115047)))

(declare-fun c!31158 () Bool)

(assert (=> d!53089 (= c!31158 lt!86199)))

(assert (=> d!53089 (= lt!86199 (containsKey!189 (toList!1099 lt!85806) lt!85795))))

(assert (=> d!53089 (= (contains!1154 lt!85806 lt!85795) lt!86197)))

(declare-fun b!174210 () Bool)

(declare-fun lt!86198 () Unit!5314)

(assert (=> b!174210 (= e!115047 lt!86198)))

(assert (=> b!174210 (= lt!86198 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85806) lt!85795))))

(assert (=> b!174210 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85806) lt!85795))))

(declare-fun b!174211 () Bool)

(declare-fun Unit!5351 () Unit!5314)

(assert (=> b!174211 (= e!115047 Unit!5351)))

(declare-fun b!174212 () Bool)

(assert (=> b!174212 (= e!115046 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85806) lt!85795)))))

(assert (= (and d!53089 c!31158) b!174210))

(assert (= (and d!53089 (not c!31158)) b!174211))

(assert (= (and d!53089 (not res!82651)) b!174212))

(declare-fun m!203077 () Bool)

(assert (=> d!53089 m!203077))

(declare-fun m!203079 () Bool)

(assert (=> b!174210 m!203079))

(assert (=> b!174210 m!201965))

(assert (=> b!174210 m!201965))

(declare-fun m!203081 () Bool)

(assert (=> b!174210 m!203081))

(assert (=> b!174212 m!201965))

(assert (=> b!174212 m!201965))

(assert (=> b!174212 m!203081))

(assert (=> d!52633 d!53089))

(assert (=> d!52633 d!52643))

(declare-fun d!53091 () Bool)

(assert (=> d!53091 (= (apply!130 (+!246 lt!85806 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) lt!85795) (apply!130 lt!85806 lt!85795))))

(assert (=> d!53091 true))

(declare-fun _$34!1057 () Unit!5314)

(assert (=> d!53091 (= (choose!929 lt!85806 lt!85799 (zeroValue!3439 thiss!1248) lt!85795) _$34!1057)))

(declare-fun bs!7194 () Bool)

(assert (= bs!7194 d!53091))

(assert (=> bs!7194 m!201763))

(assert (=> bs!7194 m!201763))

(assert (=> bs!7194 m!201765))

(assert (=> bs!7194 m!201755))

(assert (=> d!52633 d!53091))

(assert (=> d!52633 d!52653))

(assert (=> d!52633 d!52655))

(declare-fun d!53093 () Bool)

(declare-fun e!115048 () Bool)

(assert (=> d!53093 e!115048))

(declare-fun res!82652 () Bool)

(assert (=> d!53093 (=> (not res!82652) (not e!115048))))

(declare-fun lt!86202 () ListLongMap!2167)

(assert (=> d!53093 (= res!82652 (contains!1154 lt!86202 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))))))

(declare-fun lt!86203 () List!2206)

(assert (=> d!53093 (= lt!86202 (ListLongMap!2168 lt!86203))))

(declare-fun lt!86204 () Unit!5314)

(declare-fun lt!86201 () Unit!5314)

(assert (=> d!53093 (= lt!86204 lt!86201)))

(assert (=> d!53093 (= (getValueByKey!185 lt!86203 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))))))

(assert (=> d!53093 (= lt!86201 (lemmaContainsTupThenGetReturnValue!98 lt!86203 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))))))

(assert (=> d!53093 (= lt!86203 (insertStrictlySorted!101 (toList!1099 call!17618) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))))))

(assert (=> d!53093 (= (+!246 call!17618 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))) lt!86202)))

(declare-fun b!174213 () Bool)

(declare-fun res!82653 () Bool)

(assert (=> b!174213 (=> (not res!82653) (not e!115048))))

(assert (=> b!174213 (= res!82653 (= (getValueByKey!185 (toList!1099 lt!86202) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))))))

(declare-fun b!174214 () Bool)

(assert (=> b!174214 (= e!115048 (contains!1155 (toList!1099 lt!86202) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))))

(assert (= (and d!53093 res!82652) b!174213))

(assert (= (and b!174213 res!82653) b!174214))

(declare-fun m!203083 () Bool)

(assert (=> d!53093 m!203083))

(declare-fun m!203085 () Bool)

(assert (=> d!53093 m!203085))

(declare-fun m!203087 () Bool)

(assert (=> d!53093 m!203087))

(declare-fun m!203089 () Bool)

(assert (=> d!53093 m!203089))

(declare-fun m!203091 () Bool)

(assert (=> b!174213 m!203091))

(declare-fun m!203093 () Bool)

(assert (=> b!174214 m!203093))

(assert (=> b!173738 d!53093))

(assert (=> b!173699 d!52777))

(declare-fun d!53095 () Bool)

(declare-fun e!115049 () Bool)

(assert (=> d!53095 e!115049))

(declare-fun res!82654 () Bool)

(assert (=> d!53095 (=> res!82654 e!115049)))

(declare-fun lt!86205 () Bool)

(assert (=> d!53095 (= res!82654 (not lt!86205))))

(declare-fun lt!86207 () Bool)

(assert (=> d!53095 (= lt!86205 lt!86207)))

(declare-fun lt!86208 () Unit!5314)

(declare-fun e!115050 () Unit!5314)

(assert (=> d!53095 (= lt!86208 e!115050)))

(declare-fun c!31159 () Bool)

(assert (=> d!53095 (= c!31159 lt!86207)))

(assert (=> d!53095 (= lt!86207 (containsKey!189 (toList!1099 lt!85911) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(assert (=> d!53095 (= (contains!1154 lt!85911 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) lt!86205)))

(declare-fun b!174215 () Bool)

(declare-fun lt!86206 () Unit!5314)

(assert (=> b!174215 (= e!115050 lt!86206)))

(assert (=> b!174215 (= lt!86206 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85911) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(assert (=> b!174215 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85911) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174216 () Bool)

(declare-fun Unit!5352 () Unit!5314)

(assert (=> b!174216 (= e!115050 Unit!5352)))

(declare-fun b!174217 () Bool)

(assert (=> b!174217 (= e!115049 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85911) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53095 c!31159) b!174215))

(assert (= (and d!53095 (not c!31159)) b!174216))

(assert (= (and d!53095 (not res!82654)) b!174217))

(declare-fun m!203095 () Bool)

(assert (=> d!53095 m!203095))

(declare-fun m!203097 () Bool)

(assert (=> b!174215 m!203097))

(assert (=> b!174215 m!202009))

(assert (=> b!174215 m!202009))

(declare-fun m!203099 () Bool)

(assert (=> b!174215 m!203099))

(assert (=> b!174217 m!202009))

(assert (=> b!174217 m!202009))

(assert (=> b!174217 m!203099))

(assert (=> d!52653 d!53095))

(declare-fun b!174218 () Bool)

(declare-fun e!115051 () Option!191)

(assert (=> b!174218 (= e!115051 (Some!190 (_2!1631 (h!2819 lt!85912))))))

(declare-fun b!174221 () Bool)

(declare-fun e!115052 () Option!191)

(assert (=> b!174221 (= e!115052 None!189)))

(declare-fun b!174219 () Bool)

(assert (=> b!174219 (= e!115051 e!115052)))

(declare-fun c!31161 () Bool)

(assert (=> b!174219 (= c!31161 (and ((_ is Cons!2202) lt!85912) (not (= (_1!1631 (h!2819 lt!85912)) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!174220 () Bool)

(assert (=> b!174220 (= e!115052 (getValueByKey!185 (t!7013 lt!85912) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun c!31160 () Bool)

(declare-fun d!53097 () Bool)

(assert (=> d!53097 (= c!31160 (and ((_ is Cons!2202) lt!85912) (= (_1!1631 (h!2819 lt!85912)) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53097 (= (getValueByKey!185 lt!85912 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) e!115051)))

(assert (= (and d!53097 c!31160) b!174218))

(assert (= (and d!53097 (not c!31160)) b!174219))

(assert (= (and b!174219 c!31161) b!174220))

(assert (= (and b!174219 (not c!31161)) b!174221))

(declare-fun m!203101 () Bool)

(assert (=> b!174220 m!203101))

(assert (=> d!52653 d!53097))

(declare-fun d!53099 () Bool)

(assert (=> d!53099 (= (getValueByKey!185 lt!85912 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun lt!86209 () Unit!5314)

(assert (=> d!53099 (= lt!86209 (choose!931 lt!85912 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun e!115053 () Bool)

(assert (=> d!53099 e!115053))

(declare-fun res!82655 () Bool)

(assert (=> d!53099 (=> (not res!82655) (not e!115053))))

(assert (=> d!53099 (= res!82655 (isStrictlySorted!332 lt!85912))))

(assert (=> d!53099 (= (lemmaContainsTupThenGetReturnValue!98 lt!85912 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) lt!86209)))

(declare-fun b!174222 () Bool)

(declare-fun res!82656 () Bool)

(assert (=> b!174222 (=> (not res!82656) (not e!115053))))

(assert (=> b!174222 (= res!82656 (containsKey!189 lt!85912 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174223 () Bool)

(assert (=> b!174223 (= e!115053 (contains!1155 lt!85912 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53099 res!82655) b!174222))

(assert (= (and b!174222 res!82656) b!174223))

(assert (=> d!53099 m!202003))

(declare-fun m!203103 () Bool)

(assert (=> d!53099 m!203103))

(declare-fun m!203105 () Bool)

(assert (=> d!53099 m!203105))

(declare-fun m!203107 () Bool)

(assert (=> b!174222 m!203107))

(declare-fun m!203109 () Bool)

(assert (=> b!174223 m!203109))

(assert (=> d!52653 d!53099))

(declare-fun bm!17653 () Bool)

(declare-fun call!17657 () List!2206)

(declare-fun call!17655 () List!2206)

(assert (=> bm!17653 (= call!17657 call!17655)))

(declare-fun c!31165 () Bool)

(declare-fun e!115057 () List!2206)

(declare-fun c!31163 () Bool)

(declare-fun b!174224 () Bool)

(assert (=> b!174224 (= e!115057 (ite c!31163 (t!7013 (toList!1099 lt!85806)) (ite c!31165 (Cons!2202 (h!2819 (toList!1099 lt!85806)) (t!7013 (toList!1099 lt!85806))) Nil!2203)))))

(declare-fun b!174225 () Bool)

(declare-fun res!82657 () Bool)

(declare-fun e!115058 () Bool)

(assert (=> b!174225 (=> (not res!82657) (not e!115058))))

(declare-fun lt!86210 () List!2206)

(assert (=> b!174225 (= res!82657 (containsKey!189 lt!86210 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174226 () Bool)

(declare-fun e!115055 () List!2206)

(assert (=> b!174226 (= e!115055 call!17655)))

(declare-fun b!174227 () Bool)

(assert (=> b!174227 (= c!31165 (and ((_ is Cons!2202) (toList!1099 lt!85806)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85806))) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(declare-fun e!115056 () List!2206)

(declare-fun e!115054 () List!2206)

(assert (=> b!174227 (= e!115056 e!115054)))

(declare-fun b!174228 () Bool)

(declare-fun call!17656 () List!2206)

(assert (=> b!174228 (= e!115054 call!17656)))

(declare-fun b!174229 () Bool)

(assert (=> b!174229 (= e!115054 call!17656)))

(declare-fun b!174230 () Bool)

(assert (=> b!174230 (= e!115055 e!115056)))

(assert (=> b!174230 (= c!31163 (and ((_ is Cons!2202) (toList!1099 lt!85806)) (= (_1!1631 (h!2819 (toList!1099 lt!85806))) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(declare-fun c!31162 () Bool)

(declare-fun bm!17652 () Bool)

(assert (=> bm!17652 (= call!17655 ($colon$colon!98 e!115057 (ite c!31162 (h!2819 (toList!1099 lt!85806)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))))

(declare-fun c!31164 () Bool)

(assert (=> bm!17652 (= c!31164 c!31162)))

(declare-fun d!53101 () Bool)

(assert (=> d!53101 e!115058))

(declare-fun res!82658 () Bool)

(assert (=> d!53101 (=> (not res!82658) (not e!115058))))

(assert (=> d!53101 (= res!82658 (isStrictlySorted!332 lt!86210))))

(assert (=> d!53101 (= lt!86210 e!115055)))

(assert (=> d!53101 (= c!31162 (and ((_ is Cons!2202) (toList!1099 lt!85806)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85806))) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53101 (isStrictlySorted!332 (toList!1099 lt!85806))))

(assert (=> d!53101 (= (insertStrictlySorted!101 (toList!1099 lt!85806) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) lt!86210)))

(declare-fun bm!17654 () Bool)

(assert (=> bm!17654 (= call!17656 call!17657)))

(declare-fun b!174231 () Bool)

(assert (=> b!174231 (= e!115056 call!17657)))

(declare-fun b!174232 () Bool)

(assert (=> b!174232 (= e!115057 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85806)) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun b!174233 () Bool)

(assert (=> b!174233 (= e!115058 (contains!1155 lt!86210 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))) (_2!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(assert (= (and d!53101 c!31162) b!174226))

(assert (= (and d!53101 (not c!31162)) b!174230))

(assert (= (and b!174230 c!31163) b!174231))

(assert (= (and b!174230 (not c!31163)) b!174227))

(assert (= (and b!174227 c!31165) b!174228))

(assert (= (and b!174227 (not c!31165)) b!174229))

(assert (= (or b!174228 b!174229) bm!17654))

(assert (= (or b!174231 bm!17654) bm!17653))

(assert (= (or b!174226 bm!17653) bm!17652))

(assert (= (and bm!17652 c!31164) b!174232))

(assert (= (and bm!17652 (not c!31164)) b!174224))

(assert (= (and d!53101 res!82658) b!174225))

(assert (= (and b!174225 res!82657) b!174233))

(declare-fun m!203111 () Bool)

(assert (=> b!174233 m!203111))

(declare-fun m!203113 () Bool)

(assert (=> bm!17652 m!203113))

(declare-fun m!203115 () Bool)

(assert (=> b!174232 m!203115))

(declare-fun m!203117 () Bool)

(assert (=> b!174225 m!203117))

(declare-fun m!203119 () Bool)

(assert (=> d!53101 m!203119))

(declare-fun m!203121 () Bool)

(assert (=> d!53101 m!203121))

(assert (=> d!52653 d!53101))

(declare-fun b!174234 () Bool)

(declare-fun e!115059 () Option!191)

(assert (=> b!174234 (= e!115059 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85903)))))))

(declare-fun b!174237 () Bool)

(declare-fun e!115060 () Option!191)

(assert (=> b!174237 (= e!115060 None!189)))

(declare-fun b!174235 () Bool)

(assert (=> b!174235 (= e!115059 e!115060)))

(declare-fun c!31167 () Bool)

(assert (=> b!174235 (= c!31167 (and ((_ is Cons!2202) (toList!1099 lt!85903)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85903))) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))))

(declare-fun b!174236 () Bool)

(assert (=> b!174236 (= e!115060 (getValueByKey!185 (t!7013 (toList!1099 lt!85903)) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun c!31166 () Bool)

(declare-fun d!53103 () Bool)

(assert (=> d!53103 (= c!31166 (and ((_ is Cons!2202) (toList!1099 lt!85903)) (= (_1!1631 (h!2819 (toList!1099 lt!85903))) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(assert (=> d!53103 (= (getValueByKey!185 (toList!1099 lt!85903) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) e!115059)))

(assert (= (and d!53103 c!31166) b!174234))

(assert (= (and d!53103 (not c!31166)) b!174235))

(assert (= (and b!174235 c!31167) b!174236))

(assert (= (and b!174235 (not c!31167)) b!174237))

(declare-fun m!203123 () Bool)

(assert (=> b!174236 m!203123))

(assert (=> b!173512 d!53103))

(declare-fun bm!17655 () Bool)

(declare-fun call!17658 () (_ BitVec 32))

(assert (=> bm!17655 (= call!17658 (arrayCountValidKeys!0 (_keys!5439 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(declare-fun b!174238 () Bool)

(declare-fun e!115062 () (_ BitVec 32))

(declare-fun e!115061 () (_ BitVec 32))

(assert (=> b!174238 (= e!115062 e!115061)))

(declare-fun c!31169 () Bool)

(assert (=> b!174238 (= c!31169 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174239 () Bool)

(assert (=> b!174239 (= e!115062 #b00000000000000000000000000000000)))

(declare-fun d!53105 () Bool)

(declare-fun lt!86211 () (_ BitVec 32))

(assert (=> d!53105 (and (bvsge lt!86211 #b00000000000000000000000000000000) (bvsle lt!86211 (bvsub (size!3766 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!53105 (= lt!86211 e!115062)))

(declare-fun c!31168 () Bool)

(assert (=> d!53105 (= c!31168 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!53105 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3766 (_keys!5439 thiss!1248)) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!53105 (= (arrayCountValidKeys!0 (_keys!5439 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))) lt!86211)))

(declare-fun b!174240 () Bool)

(assert (=> b!174240 (= e!115061 (bvadd #b00000000000000000000000000000001 call!17658))))

(declare-fun b!174241 () Bool)

(assert (=> b!174241 (= e!115061 call!17658)))

(assert (= (and d!53105 c!31168) b!174239))

(assert (= (and d!53105 (not c!31168)) b!174238))

(assert (= (and b!174238 c!31169) b!174240))

(assert (= (and b!174238 (not c!31169)) b!174241))

(assert (= (or b!174240 b!174241) bm!17655))

(declare-fun m!203125 () Bool)

(assert (=> bm!17655 m!203125))

(assert (=> b!174238 m!202457))

(assert (=> b!174238 m!202457))

(assert (=> b!174238 m!202467))

(assert (=> bm!17608 d!53105))

(assert (=> b!173503 d!52659))

(declare-fun d!53107 () Bool)

(declare-fun lt!86212 () Bool)

(assert (=> d!53107 (= lt!86212 (select (content!149 (t!7013 (toList!1099 lt!85855))) (tuple2!3241 key!828 v!309)))))

(declare-fun e!115064 () Bool)

(assert (=> d!53107 (= lt!86212 e!115064)))

(declare-fun res!82660 () Bool)

(assert (=> d!53107 (=> (not res!82660) (not e!115064))))

(assert (=> d!53107 (= res!82660 ((_ is Cons!2202) (t!7013 (toList!1099 lt!85855))))))

(assert (=> d!53107 (= (contains!1155 (t!7013 (toList!1099 lt!85855)) (tuple2!3241 key!828 v!309)) lt!86212)))

(declare-fun b!174242 () Bool)

(declare-fun e!115063 () Bool)

(assert (=> b!174242 (= e!115064 e!115063)))

(declare-fun res!82659 () Bool)

(assert (=> b!174242 (=> res!82659 e!115063)))

(assert (=> b!174242 (= res!82659 (= (h!2819 (t!7013 (toList!1099 lt!85855))) (tuple2!3241 key!828 v!309)))))

(declare-fun b!174243 () Bool)

(assert (=> b!174243 (= e!115063 (contains!1155 (t!7013 (t!7013 (toList!1099 lt!85855))) (tuple2!3241 key!828 v!309)))))

(assert (= (and d!53107 res!82660) b!174242))

(assert (= (and b!174242 (not res!82659)) b!174243))

(declare-fun m!203127 () Bool)

(assert (=> d!53107 m!203127))

(declare-fun m!203129 () Bool)

(assert (=> d!53107 m!203129))

(declare-fun m!203131 () Bool)

(assert (=> b!174243 m!203131))

(assert (=> b!173455 d!53107))

(declare-fun d!53109 () Bool)

(assert (=> d!53109 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!86213 () Unit!5314)

(assert (=> d!53109 (= lt!86213 (choose!932 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115065 () Bool)

(assert (=> d!53109 e!115065))

(declare-fun res!82661 () Bool)

(assert (=> d!53109 (=> (not res!82661) (not e!115065))))

(assert (=> d!53109 (= res!82661 (isStrictlySorted!332 (toList!1099 lt!85791)))))

(assert (=> d!53109 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) lt!86213)))

(declare-fun b!174244 () Bool)

(assert (=> b!174244 (= e!115065 (containsKey!189 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53109 res!82661) b!174244))

(assert (=> d!53109 m!201737))

(assert (=> d!53109 m!202041))

(assert (=> d!53109 m!202041))

(assert (=> d!53109 m!202043))

(assert (=> d!53109 m!201737))

(declare-fun m!203133 () Bool)

(assert (=> d!53109 m!203133))

(declare-fun m!203135 () Bool)

(assert (=> d!53109 m!203135))

(assert (=> b!174244 m!201737))

(assert (=> b!174244 m!202037))

(assert (=> b!173523 d!53109))

(assert (=> b!173523 d!52847))

(assert (=> b!173523 d!52849))

(declare-fun d!53111 () Bool)

(assert (=> d!53111 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85840) lt!85829)) (v!3956 (getValueByKey!185 (toList!1099 lt!85840) lt!85829)))))

(assert (=> d!52721 d!53111))

(declare-fun b!174245 () Bool)

(declare-fun e!115066 () Option!191)

(assert (=> b!174245 (= e!115066 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85840)))))))

(declare-fun b!174248 () Bool)

(declare-fun e!115067 () Option!191)

(assert (=> b!174248 (= e!115067 None!189)))

(declare-fun b!174246 () Bool)

(assert (=> b!174246 (= e!115066 e!115067)))

(declare-fun c!31171 () Bool)

(assert (=> b!174246 (= c!31171 (and ((_ is Cons!2202) (toList!1099 lt!85840)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85840))) lt!85829))))))

(declare-fun b!174247 () Bool)

(assert (=> b!174247 (= e!115067 (getValueByKey!185 (t!7013 (toList!1099 lt!85840)) lt!85829))))

(declare-fun d!53113 () Bool)

(declare-fun c!31170 () Bool)

(assert (=> d!53113 (= c!31170 (and ((_ is Cons!2202) (toList!1099 lt!85840)) (= (_1!1631 (h!2819 (toList!1099 lt!85840))) lt!85829)))))

(assert (=> d!53113 (= (getValueByKey!185 (toList!1099 lt!85840) lt!85829) e!115066)))

(assert (= (and d!53113 c!31170) b!174245))

(assert (= (and d!53113 (not c!31170)) b!174246))

(assert (= (and b!174246 c!31171) b!174247))

(assert (= (and b!174246 (not c!31171)) b!174248))

(declare-fun m!203137 () Bool)

(assert (=> b!174247 m!203137))

(assert (=> d!52721 d!53113))

(declare-fun d!53115 () Bool)

(declare-fun c!31174 () Bool)

(assert (=> d!53115 (= c!31174 ((_ is Nil!2203) (toList!1099 lt!85817)))))

(declare-fun e!115070 () (InoxSet tuple2!3240))

(assert (=> d!53115 (= (content!149 (toList!1099 lt!85817)) e!115070)))

(declare-fun b!174253 () Bool)

(assert (=> b!174253 (= e!115070 ((as const (Array tuple2!3240 Bool)) false))))

(declare-fun b!174254 () Bool)

(assert (=> b!174254 (= e!115070 ((_ map or) (store ((as const (Array tuple2!3240 Bool)) false) (h!2819 (toList!1099 lt!85817)) true) (content!149 (t!7013 (toList!1099 lt!85817)))))))

(assert (= (and d!53115 c!31174) b!174253))

(assert (= (and d!53115 (not c!31174)) b!174254))

(declare-fun m!203139 () Bool)

(assert (=> b!174254 m!203139))

(declare-fun m!203141 () Bool)

(assert (=> b!174254 m!203141))

(assert (=> d!52743 d!53115))

(declare-fun d!53117 () Bool)

(declare-fun e!115071 () Bool)

(assert (=> d!53117 e!115071))

(declare-fun res!82662 () Bool)

(assert (=> d!53117 (=> res!82662 e!115071)))

(declare-fun lt!86214 () Bool)

(assert (=> d!53117 (= res!82662 (not lt!86214))))

(declare-fun lt!86216 () Bool)

(assert (=> d!53117 (= lt!86214 lt!86216)))

(declare-fun lt!86217 () Unit!5314)

(declare-fun e!115072 () Unit!5314)

(assert (=> d!53117 (= lt!86217 e!115072)))

(declare-fun c!31175 () Bool)

(assert (=> d!53117 (= c!31175 lt!86216)))

(assert (=> d!53117 (= lt!86216 (containsKey!189 (toList!1099 lt!85903) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(assert (=> d!53117 (= (contains!1154 lt!85903 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) lt!86214)))

(declare-fun b!174255 () Bool)

(declare-fun lt!86215 () Unit!5314)

(assert (=> b!174255 (= e!115072 lt!86215)))

(assert (=> b!174255 (= lt!86215 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85903) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(assert (=> b!174255 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85903) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun b!174256 () Bool)

(declare-fun Unit!5353 () Unit!5314)

(assert (=> b!174256 (= e!115072 Unit!5353)))

(declare-fun b!174257 () Bool)

(assert (=> b!174257 (= e!115071 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85903) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(assert (= (and d!53117 c!31175) b!174255))

(assert (= (and d!53117 (not c!31175)) b!174256))

(assert (= (and d!53117 (not res!82662)) b!174257))

(declare-fun m!203143 () Bool)

(assert (=> d!53117 m!203143))

(declare-fun m!203145 () Bool)

(assert (=> b!174255 m!203145))

(assert (=> b!174255 m!201985))

(assert (=> b!174255 m!201985))

(declare-fun m!203147 () Bool)

(assert (=> b!174255 m!203147))

(assert (=> b!174257 m!201985))

(assert (=> b!174257 m!201985))

(assert (=> b!174257 m!203147))

(assert (=> d!52649 d!53117))

(declare-fun b!174258 () Bool)

(declare-fun e!115073 () Option!191)

(assert (=> b!174258 (= e!115073 (Some!190 (_2!1631 (h!2819 lt!85904))))))

(declare-fun b!174261 () Bool)

(declare-fun e!115074 () Option!191)

(assert (=> b!174261 (= e!115074 None!189)))

(declare-fun b!174259 () Bool)

(assert (=> b!174259 (= e!115073 e!115074)))

(declare-fun c!31177 () Bool)

(assert (=> b!174259 (= c!31177 (and ((_ is Cons!2202) lt!85904) (not (= (_1!1631 (h!2819 lt!85904)) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))))

(declare-fun b!174260 () Bool)

(assert (=> b!174260 (= e!115074 (getValueByKey!185 (t!7013 lt!85904) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun d!53119 () Bool)

(declare-fun c!31176 () Bool)

(assert (=> d!53119 (= c!31176 (and ((_ is Cons!2202) lt!85904) (= (_1!1631 (h!2819 lt!85904)) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(assert (=> d!53119 (= (getValueByKey!185 lt!85904 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) e!115073)))

(assert (= (and d!53119 c!31176) b!174258))

(assert (= (and d!53119 (not c!31176)) b!174259))

(assert (= (and b!174259 c!31177) b!174260))

(assert (= (and b!174259 (not c!31177)) b!174261))

(declare-fun m!203149 () Bool)

(assert (=> b!174260 m!203149))

(assert (=> d!52649 d!53119))

(declare-fun d!53121 () Bool)

(assert (=> d!53121 (= (getValueByKey!185 lt!85904 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) (Some!190 (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun lt!86218 () Unit!5314)

(assert (=> d!53121 (= lt!86218 (choose!931 lt!85904 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun e!115075 () Bool)

(assert (=> d!53121 e!115075))

(declare-fun res!82663 () Bool)

(assert (=> d!53121 (=> (not res!82663) (not e!115075))))

(assert (=> d!53121 (= res!82663 (isStrictlySorted!332 lt!85904))))

(assert (=> d!53121 (= (lemmaContainsTupThenGetReturnValue!98 lt!85904 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) lt!86218)))

(declare-fun b!174262 () Bool)

(declare-fun res!82664 () Bool)

(assert (=> b!174262 (=> (not res!82664) (not e!115075))))

(assert (=> b!174262 (= res!82664 (containsKey!189 lt!85904 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun b!174263 () Bool)

(assert (=> b!174263 (= e!115075 (contains!1155 lt!85904 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(assert (= (and d!53121 res!82663) b!174262))

(assert (= (and b!174262 res!82664) b!174263))

(assert (=> d!53121 m!201979))

(declare-fun m!203151 () Bool)

(assert (=> d!53121 m!203151))

(declare-fun m!203153 () Bool)

(assert (=> d!53121 m!203153))

(declare-fun m!203155 () Bool)

(assert (=> b!174262 m!203155))

(declare-fun m!203157 () Bool)

(assert (=> b!174263 m!203157))

(assert (=> d!52649 d!53121))

(declare-fun bm!17657 () Bool)

(declare-fun call!17661 () List!2206)

(declare-fun call!17659 () List!2206)

(assert (=> bm!17657 (= call!17661 call!17659)))

(declare-fun c!31179 () Bool)

(declare-fun b!174264 () Bool)

(declare-fun e!115079 () List!2206)

(declare-fun c!31181 () Bool)

(assert (=> b!174264 (= e!115079 (ite c!31179 (t!7013 (toList!1099 lt!85800)) (ite c!31181 (Cons!2202 (h!2819 (toList!1099 lt!85800)) (t!7013 (toList!1099 lt!85800))) Nil!2203)))))

(declare-fun b!174265 () Bool)

(declare-fun res!82665 () Bool)

(declare-fun e!115080 () Bool)

(assert (=> b!174265 (=> (not res!82665) (not e!115080))))

(declare-fun lt!86219 () List!2206)

(assert (=> b!174265 (= res!82665 (containsKey!189 lt!86219 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun b!174266 () Bool)

(declare-fun e!115077 () List!2206)

(assert (=> b!174266 (= e!115077 call!17659)))

(declare-fun b!174267 () Bool)

(assert (=> b!174267 (= c!31181 (and ((_ is Cons!2202) (toList!1099 lt!85800)) (bvsgt (_1!1631 (h!2819 (toList!1099 lt!85800))) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(declare-fun e!115078 () List!2206)

(declare-fun e!115076 () List!2206)

(assert (=> b!174267 (= e!115078 e!115076)))

(declare-fun b!174268 () Bool)

(declare-fun call!17660 () List!2206)

(assert (=> b!174268 (= e!115076 call!17660)))

(declare-fun b!174269 () Bool)

(assert (=> b!174269 (= e!115076 call!17660)))

(declare-fun b!174270 () Bool)

(assert (=> b!174270 (= e!115077 e!115078)))

(assert (=> b!174270 (= c!31179 (and ((_ is Cons!2202) (toList!1099 lt!85800)) (= (_1!1631 (h!2819 (toList!1099 lt!85800))) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(declare-fun bm!17656 () Bool)

(declare-fun c!31178 () Bool)

(assert (=> bm!17656 (= call!17659 ($colon$colon!98 e!115079 (ite c!31178 (h!2819 (toList!1099 lt!85800)) (tuple2!3241 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))))

(declare-fun c!31180 () Bool)

(assert (=> bm!17656 (= c!31180 c!31178)))

(declare-fun d!53123 () Bool)

(assert (=> d!53123 e!115080))

(declare-fun res!82666 () Bool)

(assert (=> d!53123 (=> (not res!82666) (not e!115080))))

(assert (=> d!53123 (= res!82666 (isStrictlySorted!332 lt!86219))))

(assert (=> d!53123 (= lt!86219 e!115077)))

(assert (=> d!53123 (= c!31178 (and ((_ is Cons!2202) (toList!1099 lt!85800)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85800))) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(assert (=> d!53123 (isStrictlySorted!332 (toList!1099 lt!85800))))

(assert (=> d!53123 (= (insertStrictlySorted!101 (toList!1099 lt!85800) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))) lt!86219)))

(declare-fun bm!17658 () Bool)

(assert (=> bm!17658 (= call!17660 call!17661)))

(declare-fun b!174271 () Bool)

(assert (=> b!174271 (= e!115078 call!17661)))

(declare-fun b!174272 () Bool)

(assert (=> b!174272 (= e!115079 (insertStrictlySorted!101 (t!7013 (toList!1099 lt!85800)) (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248)))))))

(declare-fun b!174273 () Bool)

(assert (=> b!174273 (= e!115080 (contains!1155 lt!86219 (tuple2!3241 (_1!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) (_2!1631 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))))))))

(assert (= (and d!53123 c!31178) b!174266))

(assert (= (and d!53123 (not c!31178)) b!174270))

(assert (= (and b!174270 c!31179) b!174271))

(assert (= (and b!174270 (not c!31179)) b!174267))

(assert (= (and b!174267 c!31181) b!174268))

(assert (= (and b!174267 (not c!31181)) b!174269))

(assert (= (or b!174268 b!174269) bm!17658))

(assert (= (or b!174271 bm!17658) bm!17657))

(assert (= (or b!174266 bm!17657) bm!17656))

(assert (= (and bm!17656 c!31180) b!174272))

(assert (= (and bm!17656 (not c!31180)) b!174264))

(assert (= (and d!53123 res!82666) b!174265))

(assert (= (and b!174265 res!82665) b!174273))

(declare-fun m!203159 () Bool)

(assert (=> b!174273 m!203159))

(declare-fun m!203161 () Bool)

(assert (=> bm!17656 m!203161))

(declare-fun m!203163 () Bool)

(assert (=> b!174272 m!203163))

(declare-fun m!203165 () Bool)

(assert (=> b!174265 m!203165))

(declare-fun m!203167 () Bool)

(assert (=> d!53123 m!203167))

(declare-fun m!203169 () Bool)

(assert (=> d!53123 m!203169))

(assert (=> d!52649 d!53123))

(declare-fun d!53125 () Bool)

(assert (=> d!53125 (= (apply!130 (+!246 lt!86033 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))) lt!86022) (apply!130 lt!86033 lt!86022))))

(declare-fun lt!86220 () Unit!5314)

(assert (=> d!53125 (= lt!86220 (choose!929 lt!86033 lt!86026 (zeroValue!3439 lt!85729) lt!86022))))

(declare-fun e!115081 () Bool)

(assert (=> d!53125 e!115081))

(declare-fun res!82667 () Bool)

(assert (=> d!53125 (=> (not res!82667) (not e!115081))))

(assert (=> d!53125 (= res!82667 (contains!1154 lt!86033 lt!86022))))

(assert (=> d!53125 (= (addApplyDifferent!106 lt!86033 lt!86026 (zeroValue!3439 lt!85729) lt!86022) lt!86220)))

(declare-fun b!174274 () Bool)

(assert (=> b!174274 (= e!115081 (not (= lt!86022 lt!86026)))))

(assert (= (and d!53125 res!82667) b!174274))

(assert (=> d!53125 m!202345))

(assert (=> d!53125 m!202353))

(declare-fun m!203171 () Bool)

(assert (=> d!53125 m!203171))

(assert (=> d!53125 m!202353))

(assert (=> d!53125 m!202355))

(declare-fun m!203173 () Bool)

(assert (=> d!53125 m!203173))

(assert (=> b!173736 d!53125))

(declare-fun d!53127 () Bool)

(assert (=> d!53127 (contains!1154 (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))) lt!86015)))

(declare-fun lt!86221 () Unit!5314)

(assert (=> d!53127 (= lt!86221 (choose!930 lt!86016 lt!86014 (zeroValue!3439 lt!85729) lt!86015))))

(assert (=> d!53127 (contains!1154 lt!86016 lt!86015)))

(assert (=> d!53127 (= (addStillContains!106 lt!86016 lt!86014 (zeroValue!3439 lt!85729) lt!86015) lt!86221)))

(declare-fun bs!7195 () Bool)

(assert (= bs!7195 d!53127))

(assert (=> bs!7195 m!202363))

(assert (=> bs!7195 m!202363))

(assert (=> bs!7195 m!202373))

(declare-fun m!203175 () Bool)

(assert (=> bs!7195 m!203175))

(declare-fun m!203177 () Bool)

(assert (=> bs!7195 m!203177))

(assert (=> b!173736 d!53127))

(declare-fun d!53129 () Bool)

(declare-fun e!115082 () Bool)

(assert (=> d!53129 e!115082))

(declare-fun res!82668 () Bool)

(assert (=> d!53129 (=> (not res!82668) (not e!115082))))

(declare-fun lt!86223 () ListLongMap!2167)

(assert (=> d!53129 (= res!82668 (contains!1154 lt!86223 (_1!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729)))))))

(declare-fun lt!86224 () List!2206)

(assert (=> d!53129 (= lt!86223 (ListLongMap!2168 lt!86224))))

(declare-fun lt!86225 () Unit!5314)

(declare-fun lt!86222 () Unit!5314)

(assert (=> d!53129 (= lt!86225 lt!86222)))

(assert (=> d!53129 (= (getValueByKey!185 lt!86224 (_1!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729)))))))

(assert (=> d!53129 (= lt!86222 (lemmaContainsTupThenGetReturnValue!98 lt!86224 (_1!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))) (_2!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729)))))))

(assert (=> d!53129 (= lt!86224 (insertStrictlySorted!101 (toList!1099 lt!86033) (_1!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))) (_2!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729)))))))

(assert (=> d!53129 (= (+!246 lt!86033 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))) lt!86223)))

(declare-fun b!174275 () Bool)

(declare-fun res!82669 () Bool)

(assert (=> b!174275 (=> (not res!82669) (not e!115082))))

(assert (=> b!174275 (= res!82669 (= (getValueByKey!185 (toList!1099 lt!86223) (_1!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))))))))

(declare-fun b!174276 () Bool)

(assert (=> b!174276 (= e!115082 (contains!1155 (toList!1099 lt!86223) (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))))))

(assert (= (and d!53129 res!82668) b!174275))

(assert (= (and b!174275 res!82669) b!174276))

(declare-fun m!203179 () Bool)

(assert (=> d!53129 m!203179))

(declare-fun m!203181 () Bool)

(assert (=> d!53129 m!203181))

(declare-fun m!203183 () Bool)

(assert (=> d!53129 m!203183))

(declare-fun m!203185 () Bool)

(assert (=> d!53129 m!203185))

(declare-fun m!203187 () Bool)

(assert (=> b!174275 m!203187))

(declare-fun m!203189 () Bool)

(assert (=> b!174276 m!203189))

(assert (=> b!173736 d!53129))

(declare-fun b!174277 () Bool)

(declare-fun e!115083 () Bool)

(declare-fun e!115088 () Bool)

(assert (=> b!174277 (= e!115083 e!115088)))

(declare-fun c!31183 () Bool)

(assert (=> b!174277 (= c!31183 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(declare-fun bm!17659 () Bool)

(declare-fun call!17662 () ListLongMap!2167)

(assert (=> bm!17659 (= call!17662 (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 lt!85729)))))

(declare-fun b!174279 () Bool)

(declare-fun e!115086 () Bool)

(assert (=> b!174279 (= e!115083 e!115086)))

(assert (=> b!174279 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(declare-fun res!82671 () Bool)

(declare-fun lt!86228 () ListLongMap!2167)

(assert (=> b!174279 (= res!82671 (contains!1154 lt!86228 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (=> b!174279 (=> (not res!82671) (not e!115086))))

(declare-fun b!174280 () Bool)

(declare-fun e!115084 () ListLongMap!2167)

(assert (=> b!174280 (= e!115084 (ListLongMap!2168 Nil!2203))))

(declare-fun b!174281 () Bool)

(assert (=> b!174281 (= e!115088 (isEmpty!436 lt!86228))))

(declare-fun b!174282 () Bool)

(assert (=> b!174282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(assert (=> b!174282 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3767 (_values!3581 lt!85729))))))

(assert (=> b!174282 (= e!115086 (= (apply!130 lt!86228 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)) (get!1968 (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 lt!85729) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!174283 () Bool)

(declare-fun e!115087 () ListLongMap!2167)

(assert (=> b!174283 (= e!115087 call!17662)))

(declare-fun b!174284 () Bool)

(assert (=> b!174284 (= e!115088 (= lt!86228 (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3598 lt!85729))))))

(declare-fun b!174285 () Bool)

(assert (=> b!174285 (= e!115084 e!115087)))

(declare-fun c!31185 () Bool)

(assert (=> b!174285 (= c!31185 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun b!174286 () Bool)

(declare-fun e!115085 () Bool)

(assert (=> b!174286 (= e!115085 e!115083)))

(declare-fun c!31184 () Bool)

(declare-fun e!115089 () Bool)

(assert (=> b!174286 (= c!31184 e!115089)))

(declare-fun res!82672 () Bool)

(assert (=> b!174286 (=> (not res!82672) (not e!115089))))

(assert (=> b!174286 (= res!82672 (bvslt #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(declare-fun b!174287 () Bool)

(declare-fun lt!86226 () Unit!5314)

(declare-fun lt!86230 () Unit!5314)

(assert (=> b!174287 (= lt!86226 lt!86230)))

(declare-fun lt!86229 () (_ BitVec 64))

(declare-fun lt!86227 () V!5091)

(declare-fun lt!86232 () ListLongMap!2167)

(declare-fun lt!86231 () (_ BitVec 64))

(assert (=> b!174287 (not (contains!1154 (+!246 lt!86232 (tuple2!3241 lt!86231 lt!86227)) lt!86229))))

(assert (=> b!174287 (= lt!86230 (addStillNotContains!72 lt!86232 lt!86231 lt!86227 lt!86229))))

(assert (=> b!174287 (= lt!86229 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174287 (= lt!86227 (get!1968 (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 lt!85729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174287 (= lt!86231 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))

(assert (=> b!174287 (= lt!86232 call!17662)))

(assert (=> b!174287 (= e!115087 (+!246 call!17662 (tuple2!3241 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 lt!85729) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!174288 () Bool)

(assert (=> b!174288 (= e!115089 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)))))

(assert (=> b!174288 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!53131 () Bool)

(assert (=> d!53131 e!115085))

(declare-fun res!82673 () Bool)

(assert (=> d!53131 (=> (not res!82673) (not e!115085))))

(assert (=> d!53131 (= res!82673 (not (contains!1154 lt!86228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53131 (= lt!86228 e!115084)))

(declare-fun c!31182 () Bool)

(assert (=> d!53131 (= c!31182 (bvsge #b00000000000000000000000000000000 (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!53131 (validMask!0 (mask!8470 lt!85729))))

(assert (=> d!53131 (= (getCurrentListMapNoExtraKeys!163 (_keys!5439 lt!85729) (_values!3581 lt!85729) (mask!8470 lt!85729) (extraKeys!3337 lt!85729) (zeroValue!3439 lt!85729) (minValue!3441 lt!85729) #b00000000000000000000000000000000 (defaultEntry!3598 lt!85729)) lt!86228)))

(declare-fun b!174278 () Bool)

(declare-fun res!82670 () Bool)

(assert (=> b!174278 (=> (not res!82670) (not e!115085))))

(assert (=> b!174278 (= res!82670 (not (contains!1154 lt!86228 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53131 c!31182) b!174280))

(assert (= (and d!53131 (not c!31182)) b!174285))

(assert (= (and b!174285 c!31185) b!174287))

(assert (= (and b!174285 (not c!31185)) b!174283))

(assert (= (or b!174287 b!174283) bm!17659))

(assert (= (and d!53131 res!82673) b!174278))

(assert (= (and b!174278 res!82670) b!174286))

(assert (= (and b!174286 res!82672) b!174288))

(assert (= (and b!174286 c!31184) b!174279))

(assert (= (and b!174286 (not c!31184)) b!174277))

(assert (= (and b!174279 res!82671) b!174282))

(assert (= (and b!174277 c!31183) b!174284))

(assert (= (and b!174277 (not c!31183)) b!174281))

(declare-fun b_lambda!6969 () Bool)

(assert (=> (not b_lambda!6969) (not b!174282)))

(assert (=> b!174282 t!7019))

(declare-fun b_and!10777 () Bool)

(assert (= b_and!10775 (and (=> t!7019 result!4591) b_and!10777)))

(declare-fun b_lambda!6971 () Bool)

(assert (=> (not b_lambda!6971) (not b!174287)))

(assert (=> b!174287 t!7019))

(declare-fun b_and!10779 () Bool)

(assert (= b_and!10777 (and (=> t!7019 result!4591) b_and!10779)))

(declare-fun m!203191 () Bool)

(assert (=> b!174284 m!203191))

(assert (=> b!174282 m!202335))

(assert (=> b!174282 m!202337))

(assert (=> b!174282 m!202339))

(assert (=> b!174282 m!202337))

(assert (=> b!174282 m!202223))

(declare-fun m!203193 () Bool)

(assert (=> b!174282 m!203193))

(assert (=> b!174282 m!202223))

(assert (=> b!174282 m!202335))

(declare-fun m!203195 () Bool)

(assert (=> d!53131 m!203195))

(assert (=> d!53131 m!202323))

(assert (=> b!174279 m!202223))

(assert (=> b!174279 m!202223))

(declare-fun m!203197 () Bool)

(assert (=> b!174279 m!203197))

(assert (=> bm!17659 m!203191))

(declare-fun m!203199 () Bool)

(assert (=> b!174281 m!203199))

(assert (=> b!174288 m!202223))

(assert (=> b!174288 m!202223))

(assert (=> b!174288 m!202227))

(declare-fun m!203201 () Bool)

(assert (=> b!174278 m!203201))

(assert (=> b!174285 m!202223))

(assert (=> b!174285 m!202223))

(assert (=> b!174285 m!202227))

(declare-fun m!203203 () Bool)

(assert (=> b!174287 m!203203))

(declare-fun m!203205 () Bool)

(assert (=> b!174287 m!203205))

(assert (=> b!174287 m!202335))

(assert (=> b!174287 m!202337))

(assert (=> b!174287 m!202339))

(assert (=> b!174287 m!202337))

(assert (=> b!174287 m!203203))

(declare-fun m!203207 () Bool)

(assert (=> b!174287 m!203207))

(assert (=> b!174287 m!202223))

(assert (=> b!174287 m!202335))

(declare-fun m!203209 () Bool)

(assert (=> b!174287 m!203209))

(assert (=> b!173736 d!53131))

(declare-fun d!53133 () Bool)

(assert (=> d!53133 (= (apply!130 (+!246 lt!86033 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729))) lt!86022) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!86033 (tuple2!3241 lt!86026 (zeroValue!3439 lt!85729)))) lt!86022)))))

(declare-fun bs!7196 () Bool)

(assert (= bs!7196 d!53133))

(declare-fun m!203211 () Bool)

(assert (=> bs!7196 m!203211))

(assert (=> bs!7196 m!203211))

(declare-fun m!203213 () Bool)

(assert (=> bs!7196 m!203213))

(assert (=> b!173736 d!53133))

(declare-fun d!53135 () Bool)

(assert (=> d!53135 (= (apply!130 (+!246 lt!86019 (tuple2!3241 lt!86029 (minValue!3441 lt!85729))) lt!86023) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!86019 (tuple2!3241 lt!86029 (minValue!3441 lt!85729)))) lt!86023)))))

(declare-fun bs!7197 () Bool)

(assert (= bs!7197 d!53135))

(declare-fun m!203215 () Bool)

(assert (=> bs!7197 m!203215))

(assert (=> bs!7197 m!203215))

(declare-fun m!203217 () Bool)

(assert (=> bs!7197 m!203217))

(assert (=> b!173736 d!53135))

(declare-fun d!53137 () Bool)

(assert (=> d!53137 (= (apply!130 lt!86033 lt!86022) (get!1969 (getValueByKey!185 (toList!1099 lt!86033) lt!86022)))))

(declare-fun bs!7198 () Bool)

(assert (= bs!7198 d!53137))

(declare-fun m!203219 () Bool)

(assert (=> bs!7198 m!203219))

(assert (=> bs!7198 m!203219))

(declare-fun m!203221 () Bool)

(assert (=> bs!7198 m!203221))

(assert (=> b!173736 d!53137))

(declare-fun d!53139 () Bool)

(assert (=> d!53139 (= (apply!130 (+!246 lt!86019 (tuple2!3241 lt!86029 (minValue!3441 lt!85729))) lt!86023) (apply!130 lt!86019 lt!86023))))

(declare-fun lt!86233 () Unit!5314)

(assert (=> d!53139 (= lt!86233 (choose!929 lt!86019 lt!86029 (minValue!3441 lt!85729) lt!86023))))

(declare-fun e!115090 () Bool)

(assert (=> d!53139 e!115090))

(declare-fun res!82674 () Bool)

(assert (=> d!53139 (=> (not res!82674) (not e!115090))))

(assert (=> d!53139 (= res!82674 (contains!1154 lt!86019 lt!86023))))

(assert (=> d!53139 (= (addApplyDifferent!106 lt!86019 lt!86029 (minValue!3441 lt!85729) lt!86023) lt!86233)))

(declare-fun b!174289 () Bool)

(assert (=> b!174289 (= e!115090 (not (= lt!86023 lt!86029)))))

(assert (= (and d!53139 res!82674) b!174289))

(assert (=> d!53139 m!202347))

(assert (=> d!53139 m!202349))

(declare-fun m!203223 () Bool)

(assert (=> d!53139 m!203223))

(assert (=> d!53139 m!202349))

(assert (=> d!53139 m!202351))

(declare-fun m!203225 () Bool)

(assert (=> d!53139 m!203225))

(assert (=> b!173736 d!53139))

(declare-fun d!53141 () Bool)

(assert (=> d!53141 (= (apply!130 lt!86027 lt!86021) (get!1969 (getValueByKey!185 (toList!1099 lt!86027) lt!86021)))))

(declare-fun bs!7199 () Bool)

(assert (= bs!7199 d!53141))

(declare-fun m!203227 () Bool)

(assert (=> bs!7199 m!203227))

(assert (=> bs!7199 m!203227))

(declare-fun m!203229 () Bool)

(assert (=> bs!7199 m!203229))

(assert (=> b!173736 d!53141))

(declare-fun d!53143 () Bool)

(declare-fun e!115091 () Bool)

(assert (=> d!53143 e!115091))

(declare-fun res!82675 () Bool)

(assert (=> d!53143 (=> (not res!82675) (not e!115091))))

(declare-fun lt!86235 () ListLongMap!2167)

(assert (=> d!53143 (= res!82675 (contains!1154 lt!86235 (_1!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))))))

(declare-fun lt!86236 () List!2206)

(assert (=> d!53143 (= lt!86235 (ListLongMap!2168 lt!86236))))

(declare-fun lt!86237 () Unit!5314)

(declare-fun lt!86234 () Unit!5314)

(assert (=> d!53143 (= lt!86237 lt!86234)))

(assert (=> d!53143 (= (getValueByKey!185 lt!86236 (_1!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))))))

(assert (=> d!53143 (= lt!86234 (lemmaContainsTupThenGetReturnValue!98 lt!86236 (_1!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))) (_2!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))))))

(assert (=> d!53143 (= lt!86236 (insertStrictlySorted!101 (toList!1099 lt!86016) (_1!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))) (_2!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))))))

(assert (=> d!53143 (= (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))) lt!86235)))

(declare-fun b!174290 () Bool)

(declare-fun res!82676 () Bool)

(assert (=> b!174290 (=> (not res!82676) (not e!115091))))

(assert (=> b!174290 (= res!82676 (= (getValueByKey!185 (toList!1099 lt!86235) (_1!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))))))))

(declare-fun b!174291 () Bool)

(assert (=> b!174291 (= e!115091 (contains!1155 (toList!1099 lt!86235) (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))))))

(assert (= (and d!53143 res!82675) b!174290))

(assert (= (and b!174290 res!82676) b!174291))

(declare-fun m!203231 () Bool)

(assert (=> d!53143 m!203231))

(declare-fun m!203233 () Bool)

(assert (=> d!53143 m!203233))

(declare-fun m!203235 () Bool)

(assert (=> d!53143 m!203235))

(declare-fun m!203237 () Bool)

(assert (=> d!53143 m!203237))

(declare-fun m!203239 () Bool)

(assert (=> b!174290 m!203239))

(declare-fun m!203241 () Bool)

(assert (=> b!174291 m!203241))

(assert (=> b!173736 d!53143))

(declare-fun d!53145 () Bool)

(assert (=> d!53145 (= (apply!130 (+!246 lt!86027 (tuple2!3241 lt!86031 (minValue!3441 lt!85729))) lt!86021) (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!86027 (tuple2!3241 lt!86031 (minValue!3441 lt!85729)))) lt!86021)))))

(declare-fun bs!7200 () Bool)

(assert (= bs!7200 d!53145))

(declare-fun m!203243 () Bool)

(assert (=> bs!7200 m!203243))

(assert (=> bs!7200 m!203243))

(declare-fun m!203245 () Bool)

(assert (=> bs!7200 m!203245))

(assert (=> b!173736 d!53145))

(declare-fun d!53147 () Bool)

(declare-fun e!115092 () Bool)

(assert (=> d!53147 e!115092))

(declare-fun res!82677 () Bool)

(assert (=> d!53147 (=> (not res!82677) (not e!115092))))

(declare-fun lt!86239 () ListLongMap!2167)

(assert (=> d!53147 (= res!82677 (contains!1154 lt!86239 (_1!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729)))))))

(declare-fun lt!86240 () List!2206)

(assert (=> d!53147 (= lt!86239 (ListLongMap!2168 lt!86240))))

(declare-fun lt!86241 () Unit!5314)

(declare-fun lt!86238 () Unit!5314)

(assert (=> d!53147 (= lt!86241 lt!86238)))

(assert (=> d!53147 (= (getValueByKey!185 lt!86240 (_1!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729)))))))

(assert (=> d!53147 (= lt!86238 (lemmaContainsTupThenGetReturnValue!98 lt!86240 (_1!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729))) (_2!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729)))))))

(assert (=> d!53147 (= lt!86240 (insertStrictlySorted!101 (toList!1099 lt!86027) (_1!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729))) (_2!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729)))))))

(assert (=> d!53147 (= (+!246 lt!86027 (tuple2!3241 lt!86031 (minValue!3441 lt!85729))) lt!86239)))

(declare-fun b!174292 () Bool)

(declare-fun res!82678 () Bool)

(assert (=> b!174292 (=> (not res!82678) (not e!115092))))

(assert (=> b!174292 (= res!82678 (= (getValueByKey!185 (toList!1099 lt!86239) (_1!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86031 (minValue!3441 lt!85729))))))))

(declare-fun b!174293 () Bool)

(assert (=> b!174293 (= e!115092 (contains!1155 (toList!1099 lt!86239) (tuple2!3241 lt!86031 (minValue!3441 lt!85729))))))

(assert (= (and d!53147 res!82677) b!174292))

(assert (= (and b!174292 res!82678) b!174293))

(declare-fun m!203247 () Bool)

(assert (=> d!53147 m!203247))

(declare-fun m!203249 () Bool)

(assert (=> d!53147 m!203249))

(declare-fun m!203251 () Bool)

(assert (=> d!53147 m!203251))

(declare-fun m!203253 () Bool)

(assert (=> d!53147 m!203253))

(declare-fun m!203255 () Bool)

(assert (=> b!174292 m!203255))

(declare-fun m!203257 () Bool)

(assert (=> b!174293 m!203257))

(assert (=> b!173736 d!53147))

(declare-fun d!53149 () Bool)

(assert (=> d!53149 (= (apply!130 (+!246 lt!86027 (tuple2!3241 lt!86031 (minValue!3441 lt!85729))) lt!86021) (apply!130 lt!86027 lt!86021))))

(declare-fun lt!86242 () Unit!5314)

(assert (=> d!53149 (= lt!86242 (choose!929 lt!86027 lt!86031 (minValue!3441 lt!85729) lt!86021))))

(declare-fun e!115093 () Bool)

(assert (=> d!53149 e!115093))

(declare-fun res!82679 () Bool)

(assert (=> d!53149 (=> (not res!82679) (not e!115093))))

(assert (=> d!53149 (= res!82679 (contains!1154 lt!86027 lt!86021))))

(assert (=> d!53149 (= (addApplyDifferent!106 lt!86027 lt!86031 (minValue!3441 lt!85729) lt!86021) lt!86242)))

(declare-fun b!174294 () Bool)

(assert (=> b!174294 (= e!115093 (not (= lt!86021 lt!86031)))))

(assert (= (and d!53149 res!82679) b!174294))

(assert (=> d!53149 m!202367))

(assert (=> d!53149 m!202357))

(declare-fun m!203259 () Bool)

(assert (=> d!53149 m!203259))

(assert (=> d!53149 m!202357))

(assert (=> d!53149 m!202361))

(declare-fun m!203261 () Bool)

(assert (=> d!53149 m!203261))

(assert (=> b!173736 d!53149))

(declare-fun d!53151 () Bool)

(assert (=> d!53151 (= (apply!130 lt!86019 lt!86023) (get!1969 (getValueByKey!185 (toList!1099 lt!86019) lt!86023)))))

(declare-fun bs!7201 () Bool)

(assert (= bs!7201 d!53151))

(declare-fun m!203263 () Bool)

(assert (=> bs!7201 m!203263))

(assert (=> bs!7201 m!203263))

(declare-fun m!203265 () Bool)

(assert (=> bs!7201 m!203265))

(assert (=> b!173736 d!53151))

(declare-fun d!53153 () Bool)

(declare-fun e!115094 () Bool)

(assert (=> d!53153 e!115094))

(declare-fun res!82680 () Bool)

(assert (=> d!53153 (=> (not res!82680) (not e!115094))))

(declare-fun lt!86244 () ListLongMap!2167)

(assert (=> d!53153 (= res!82680 (contains!1154 lt!86244 (_1!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729)))))))

(declare-fun lt!86245 () List!2206)

(assert (=> d!53153 (= lt!86244 (ListLongMap!2168 lt!86245))))

(declare-fun lt!86246 () Unit!5314)

(declare-fun lt!86243 () Unit!5314)

(assert (=> d!53153 (= lt!86246 lt!86243)))

(assert (=> d!53153 (= (getValueByKey!185 lt!86245 (_1!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729)))))))

(assert (=> d!53153 (= lt!86243 (lemmaContainsTupThenGetReturnValue!98 lt!86245 (_1!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729))) (_2!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729)))))))

(assert (=> d!53153 (= lt!86245 (insertStrictlySorted!101 (toList!1099 lt!86019) (_1!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729))) (_2!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729)))))))

(assert (=> d!53153 (= (+!246 lt!86019 (tuple2!3241 lt!86029 (minValue!3441 lt!85729))) lt!86244)))

(declare-fun b!174295 () Bool)

(declare-fun res!82681 () Bool)

(assert (=> b!174295 (=> (not res!82681) (not e!115094))))

(assert (=> b!174295 (= res!82681 (= (getValueByKey!185 (toList!1099 lt!86244) (_1!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729)))) (Some!190 (_2!1631 (tuple2!3241 lt!86029 (minValue!3441 lt!85729))))))))

(declare-fun b!174296 () Bool)

(assert (=> b!174296 (= e!115094 (contains!1155 (toList!1099 lt!86244) (tuple2!3241 lt!86029 (minValue!3441 lt!85729))))))

(assert (= (and d!53153 res!82680) b!174295))

(assert (= (and b!174295 res!82681) b!174296))

(declare-fun m!203267 () Bool)

(assert (=> d!53153 m!203267))

(declare-fun m!203269 () Bool)

(assert (=> d!53153 m!203269))

(declare-fun m!203271 () Bool)

(assert (=> d!53153 m!203271))

(declare-fun m!203273 () Bool)

(assert (=> d!53153 m!203273))

(declare-fun m!203275 () Bool)

(assert (=> b!174295 m!203275))

(declare-fun m!203277 () Bool)

(assert (=> b!174296 m!203277))

(assert (=> b!173736 d!53153))

(declare-fun d!53155 () Bool)

(declare-fun e!115095 () Bool)

(assert (=> d!53155 e!115095))

(declare-fun res!82682 () Bool)

(assert (=> d!53155 (=> res!82682 e!115095)))

(declare-fun lt!86247 () Bool)

(assert (=> d!53155 (= res!82682 (not lt!86247))))

(declare-fun lt!86249 () Bool)

(assert (=> d!53155 (= lt!86247 lt!86249)))

(declare-fun lt!86250 () Unit!5314)

(declare-fun e!115096 () Unit!5314)

(assert (=> d!53155 (= lt!86250 e!115096)))

(declare-fun c!31186 () Bool)

(assert (=> d!53155 (= c!31186 lt!86249)))

(assert (=> d!53155 (= lt!86249 (containsKey!189 (toList!1099 (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))) lt!86015))))

(assert (=> d!53155 (= (contains!1154 (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729))) lt!86015) lt!86247)))

(declare-fun b!174297 () Bool)

(declare-fun lt!86248 () Unit!5314)

(assert (=> b!174297 (= e!115096 lt!86248)))

(assert (=> b!174297 (= lt!86248 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))) lt!86015))))

(assert (=> b!174297 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))) lt!86015))))

(declare-fun b!174298 () Bool)

(declare-fun Unit!5354 () Unit!5314)

(assert (=> b!174298 (= e!115096 Unit!5354)))

(declare-fun b!174299 () Bool)

(assert (=> b!174299 (= e!115095 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!86016 (tuple2!3241 lt!86014 (zeroValue!3439 lt!85729)))) lt!86015)))))

(assert (= (and d!53155 c!31186) b!174297))

(assert (= (and d!53155 (not c!31186)) b!174298))

(assert (= (and d!53155 (not res!82682)) b!174299))

(declare-fun m!203279 () Bool)

(assert (=> d!53155 m!203279))

(declare-fun m!203281 () Bool)

(assert (=> b!174297 m!203281))

(declare-fun m!203283 () Bool)

(assert (=> b!174297 m!203283))

(assert (=> b!174297 m!203283))

(declare-fun m!203285 () Bool)

(assert (=> b!174297 m!203285))

(assert (=> b!174299 m!203283))

(assert (=> b!174299 m!203283))

(assert (=> b!174299 m!203285))

(assert (=> b!173736 d!53155))

(declare-fun d!53157 () Bool)

(assert (=> d!53157 (= (isEmpty!436 lt!85889) (isEmpty!438 (toList!1099 lt!85889)))))

(declare-fun bs!7202 () Bool)

(assert (= bs!7202 d!53157))

(declare-fun m!203287 () Bool)

(assert (=> bs!7202 m!203287))

(assert (=> b!173499 d!53157))

(declare-fun d!53159 () Bool)

(declare-fun c!31187 () Bool)

(assert (=> d!53159 (= c!31187 ((_ is Nil!2203) (toList!1099 lt!85855)))))

(declare-fun e!115097 () (InoxSet tuple2!3240))

(assert (=> d!53159 (= (content!149 (toList!1099 lt!85855)) e!115097)))

(declare-fun b!174300 () Bool)

(assert (=> b!174300 (= e!115097 ((as const (Array tuple2!3240 Bool)) false))))

(declare-fun b!174301 () Bool)

(assert (=> b!174301 (= e!115097 ((_ map or) (store ((as const (Array tuple2!3240 Bool)) false) (h!2819 (toList!1099 lt!85855)) true) (content!149 (t!7013 (toList!1099 lt!85855)))))))

(assert (= (and d!53159 c!31187) b!174300))

(assert (= (and d!53159 (not c!31187)) b!174301))

(declare-fun m!203289 () Bool)

(assert (=> b!174301 m!203289))

(assert (=> b!174301 m!203127))

(assert (=> d!52615 d!53159))

(declare-fun d!53161 () Bool)

(declare-fun lt!86251 () Bool)

(assert (=> d!53161 (= lt!86251 (select (content!149 lt!85935) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!115099 () Bool)

(assert (=> d!53161 (= lt!86251 e!115099)))

(declare-fun res!82684 () Bool)

(assert (=> d!53161 (=> (not res!82684) (not e!115099))))

(assert (=> d!53161 (= res!82684 ((_ is Cons!2202) lt!85935))))

(assert (=> d!53161 (= (contains!1155 lt!85935 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86251)))

(declare-fun b!174302 () Bool)

(declare-fun e!115098 () Bool)

(assert (=> b!174302 (= e!115099 e!115098)))

(declare-fun res!82683 () Bool)

(assert (=> b!174302 (=> res!82683 e!115098)))

(assert (=> b!174302 (= res!82683 (= (h!2819 lt!85935) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174303 () Bool)

(assert (=> b!174303 (= e!115098 (contains!1155 (t!7013 lt!85935) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53161 res!82684) b!174302))

(assert (= (and b!174302 (not res!82683)) b!174303))

(declare-fun m!203291 () Bool)

(assert (=> d!53161 m!203291))

(declare-fun m!203293 () Bool)

(assert (=> d!53161 m!203293))

(declare-fun m!203295 () Bool)

(assert (=> b!174303 m!203295))

(assert (=> b!173576 d!53161))

(declare-fun b!174304 () Bool)

(declare-fun e!115100 () Option!191)

(assert (=> b!174304 (= e!115100 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85966)))))))

(declare-fun b!174307 () Bool)

(declare-fun e!115101 () Option!191)

(assert (=> b!174307 (= e!115101 None!189)))

(declare-fun b!174305 () Bool)

(assert (=> b!174305 (= e!115100 e!115101)))

(declare-fun c!31189 () Bool)

(assert (=> b!174305 (= c!31189 (and ((_ is Cons!2202) (toList!1099 lt!85966)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85966))) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!174306 () Bool)

(assert (=> b!174306 (= e!115101 (getValueByKey!185 (t!7013 (toList!1099 lt!85966)) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))))

(declare-fun c!31188 () Bool)

(declare-fun d!53163 () Bool)

(assert (=> d!53163 (= c!31188 (and ((_ is Cons!2202) (toList!1099 lt!85966)) (= (_1!1631 (h!2819 (toList!1099 lt!85966))) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53163 (= (getValueByKey!185 (toList!1099 lt!85966) (_1!1631 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) e!115100)))

(assert (= (and d!53163 c!31188) b!174304))

(assert (= (and d!53163 (not c!31188)) b!174305))

(assert (= (and b!174305 c!31189) b!174306))

(assert (= (and b!174305 (not c!31189)) b!174307))

(declare-fun m!203297 () Bool)

(assert (=> b!174306 m!203297))

(assert (=> b!173618 d!53163))

(declare-fun b!174308 () Bool)

(declare-fun e!115102 () Option!191)

(assert (=> b!174308 (= e!115102 (Some!190 (_2!1631 (h!2819 (t!7013 (toList!1099 lt!85728))))))))

(declare-fun b!174311 () Bool)

(declare-fun e!115103 () Option!191)

(assert (=> b!174311 (= e!115103 None!189)))

(declare-fun b!174309 () Bool)

(assert (=> b!174309 (= e!115102 e!115103)))

(declare-fun c!31191 () Bool)

(assert (=> b!174309 (= c!31191 (and ((_ is Cons!2202) (t!7013 (toList!1099 lt!85728))) (not (= (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85728)))) key!828))))))

(declare-fun b!174310 () Bool)

(assert (=> b!174310 (= e!115103 (getValueByKey!185 (t!7013 (t!7013 (toList!1099 lt!85728))) key!828))))

(declare-fun d!53165 () Bool)

(declare-fun c!31190 () Bool)

(assert (=> d!53165 (= c!31190 (and ((_ is Cons!2202) (t!7013 (toList!1099 lt!85728))) (= (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85728)))) key!828)))))

(assert (=> d!53165 (= (getValueByKey!185 (t!7013 (toList!1099 lt!85728)) key!828) e!115102)))

(assert (= (and d!53165 c!31190) b!174308))

(assert (= (and d!53165 (not c!31190)) b!174309))

(assert (= (and b!174309 c!31191) b!174310))

(assert (= (and b!174309 (not c!31191)) b!174311))

(declare-fun m!203299 () Bool)

(assert (=> b!174310 m!203299))

(assert (=> b!173583 d!53165))

(declare-fun d!53167 () Bool)

(declare-fun res!82685 () Bool)

(declare-fun e!115104 () Bool)

(assert (=> d!53167 (=> res!82685 e!115104)))

(assert (=> d!53167 (= res!82685 (and ((_ is Cons!2202) (t!7013 (toList!1099 lt!85728))) (= (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85728)))) key!828)))))

(assert (=> d!53167 (= (containsKey!189 (t!7013 (toList!1099 lt!85728)) key!828) e!115104)))

(declare-fun b!174312 () Bool)

(declare-fun e!115105 () Bool)

(assert (=> b!174312 (= e!115104 e!115105)))

(declare-fun res!82686 () Bool)

(assert (=> b!174312 (=> (not res!82686) (not e!115105))))

(assert (=> b!174312 (= res!82686 (and (or (not ((_ is Cons!2202) (t!7013 (toList!1099 lt!85728)))) (bvsle (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85728)))) key!828)) ((_ is Cons!2202) (t!7013 (toList!1099 lt!85728))) (bvslt (_1!1631 (h!2819 (t!7013 (toList!1099 lt!85728)))) key!828)))))

(declare-fun b!174313 () Bool)

(assert (=> b!174313 (= e!115105 (containsKey!189 (t!7013 (t!7013 (toList!1099 lt!85728))) key!828))))

(assert (= (and d!53167 (not res!82685)) b!174312))

(assert (= (and b!174312 res!82686) b!174313))

(declare-fun m!203301 () Bool)

(assert (=> b!174313 m!203301))

(assert (=> b!173449 d!53167))

(assert (=> d!52727 d!52621))

(declare-fun b!174314 () Bool)

(declare-fun e!115107 () Bool)

(declare-fun call!17663 () Bool)

(assert (=> b!174314 (= e!115107 call!17663)))

(declare-fun d!53169 () Bool)

(declare-fun res!82688 () Bool)

(declare-fun e!115106 () Bool)

(assert (=> d!53169 (=> res!82688 e!115106)))

(assert (=> d!53169 (= res!82688 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!53169 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5439 lt!85729) (mask!8470 lt!85729)) e!115106)))

(declare-fun b!174315 () Bool)

(assert (=> b!174315 (= e!115106 e!115107)))

(declare-fun c!31192 () Bool)

(assert (=> b!174315 (= c!31192 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174316 () Bool)

(declare-fun e!115108 () Bool)

(assert (=> b!174316 (= e!115108 call!17663)))

(declare-fun bm!17660 () Bool)

(assert (=> bm!17660 (= call!17663 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5439 lt!85729) (mask!8470 lt!85729)))))

(declare-fun b!174317 () Bool)

(assert (=> b!174317 (= e!115107 e!115108)))

(declare-fun lt!86253 () (_ BitVec 64))

(assert (=> b!174317 (= lt!86253 (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!86254 () Unit!5314)

(assert (=> b!174317 (= lt!86254 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5439 lt!85729) lt!86253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!174317 (arrayContainsKey!0 (_keys!5439 lt!85729) lt!86253 #b00000000000000000000000000000000)))

(declare-fun lt!86252 () Unit!5314)

(assert (=> b!174317 (= lt!86252 lt!86254)))

(declare-fun res!82687 () Bool)

(assert (=> b!174317 (= res!82687 (= (seekEntryOrOpen!0 (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5439 lt!85729) (mask!8470 lt!85729)) (Found!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174317 (=> (not res!82687) (not e!115108))))

(assert (= (and d!53169 (not res!82688)) b!174315))

(assert (= (and b!174315 c!31192) b!174317))

(assert (= (and b!174315 (not c!31192)) b!174314))

(assert (= (and b!174317 res!82687) b!174316))

(assert (= (or b!174316 b!174314) bm!17660))

(assert (=> b!174315 m!202739))

(assert (=> b!174315 m!202739))

(assert (=> b!174315 m!202743))

(declare-fun m!203303 () Bool)

(assert (=> bm!17660 m!203303))

(assert (=> b!174317 m!202739))

(declare-fun m!203305 () Bool)

(assert (=> b!174317 m!203305))

(declare-fun m!203307 () Bool)

(assert (=> b!174317 m!203307))

(assert (=> b!174317 m!202739))

(declare-fun m!203309 () Bool)

(assert (=> b!174317 m!203309))

(assert (=> bm!17610 d!53169))

(assert (=> d!52735 d!52733))

(declare-fun d!53171 () Bool)

(assert (=> d!53171 (= (getValueByKey!185 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309))) (Some!190 (_2!1631 (tuple2!3241 key!828 v!309))))))

(assert (=> d!53171 true))

(declare-fun _$22!536 () Unit!5314)

(assert (=> d!53171 (= (choose!931 lt!85856 (_1!1631 (tuple2!3241 key!828 v!309)) (_2!1631 (tuple2!3241 key!828 v!309))) _$22!536)))

(declare-fun bs!7203 () Bool)

(assert (= bs!7203 d!53171))

(assert (=> bs!7203 m!201861))

(assert (=> d!52735 d!53171))

(declare-fun d!53173 () Bool)

(declare-fun res!82689 () Bool)

(declare-fun e!115109 () Bool)

(assert (=> d!53173 (=> res!82689 e!115109)))

(assert (=> d!53173 (= res!82689 (or ((_ is Nil!2203) lt!85856) ((_ is Nil!2203) (t!7013 lt!85856))))))

(assert (=> d!53173 (= (isStrictlySorted!332 lt!85856) e!115109)))

(declare-fun b!174318 () Bool)

(declare-fun e!115110 () Bool)

(assert (=> b!174318 (= e!115109 e!115110)))

(declare-fun res!82690 () Bool)

(assert (=> b!174318 (=> (not res!82690) (not e!115110))))

(assert (=> b!174318 (= res!82690 (bvslt (_1!1631 (h!2819 lt!85856)) (_1!1631 (h!2819 (t!7013 lt!85856)))))))

(declare-fun b!174319 () Bool)

(assert (=> b!174319 (= e!115110 (isStrictlySorted!332 (t!7013 lt!85856)))))

(assert (= (and d!53173 (not res!82689)) b!174318))

(assert (= (and b!174318 res!82690) b!174319))

(declare-fun m!203311 () Bool)

(assert (=> b!174319 m!203311))

(assert (=> d!52735 d!53173))

(assert (=> b!173599 d!52659))

(declare-fun b!174320 () Bool)

(declare-fun e!115111 () Option!191)

(assert (=> b!174320 (= e!115111 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85862)))))))

(declare-fun b!174323 () Bool)

(declare-fun e!115112 () Option!191)

(assert (=> b!174323 (= e!115112 None!189)))

(declare-fun b!174321 () Bool)

(assert (=> b!174321 (= e!115111 e!115112)))

(declare-fun c!31194 () Bool)

(assert (=> b!174321 (= c!31194 (and ((_ is Cons!2202) (toList!1099 lt!85862)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85862))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun b!174322 () Bool)

(assert (=> b!174322 (= e!115112 (getValueByKey!185 (t!7013 (toList!1099 lt!85862)) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun d!53175 () Bool)

(declare-fun c!31193 () Bool)

(assert (=> d!53175 (= c!31193 (and ((_ is Cons!2202) (toList!1099 lt!85862)) (= (_1!1631 (h!2819 (toList!1099 lt!85862))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!53175 (= (getValueByKey!185 (toList!1099 lt!85862) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!115111)))

(assert (= (and d!53175 c!31193) b!174320))

(assert (= (and d!53175 (not c!31193)) b!174321))

(assert (= (and b!174321 c!31194) b!174322))

(assert (= (and b!174321 (not c!31194)) b!174323))

(declare-fun m!203313 () Bool)

(assert (=> b!174322 m!203313))

(assert (=> b!173462 d!53175))

(declare-fun b!174324 () Bool)

(declare-fun e!115114 () Bool)

(declare-fun call!17664 () Bool)

(assert (=> b!174324 (= e!115114 call!17664)))

(declare-fun d!53177 () Bool)

(declare-fun res!82692 () Bool)

(declare-fun e!115113 () Bool)

(assert (=> d!53177 (=> res!82692 e!115113)))

(assert (=> d!53177 (= res!82692 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 thiss!1248))))))

(assert (=> d!53177 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)) e!115113)))

(declare-fun b!174325 () Bool)

(assert (=> b!174325 (= e!115113 e!115114)))

(declare-fun c!31195 () Bool)

(assert (=> b!174325 (= c!31195 (validKeyInArray!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174326 () Bool)

(declare-fun e!115115 () Bool)

(assert (=> b!174326 (= e!115115 call!17664)))

(declare-fun bm!17661 () Bool)

(assert (=> bm!17661 (= call!17664 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)))))

(declare-fun b!174327 () Bool)

(assert (=> b!174327 (= e!115114 e!115115)))

(declare-fun lt!86256 () (_ BitVec 64))

(assert (=> b!174327 (= lt!86256 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!86257 () Unit!5314)

(assert (=> b!174327 (= lt!86257 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5439 thiss!1248) lt!86256 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!174327 (arrayContainsKey!0 (_keys!5439 thiss!1248) lt!86256 #b00000000000000000000000000000000)))

(declare-fun lt!86255 () Unit!5314)

(assert (=> b!174327 (= lt!86255 lt!86257)))

(declare-fun res!82691 () Bool)

(assert (=> b!174327 (= res!82691 (= (seekEntryOrOpen!0 (select (arr!3467 (_keys!5439 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5439 thiss!1248) (mask!8470 thiss!1248)) (Found!542 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174327 (=> (not res!82691) (not e!115115))))

(assert (= (and d!53177 (not res!82692)) b!174325))

(assert (= (and b!174325 c!31195) b!174327))

(assert (= (and b!174325 (not c!31195)) b!174324))

(assert (= (and b!174327 res!82691) b!174326))

(assert (= (or b!174326 b!174324) bm!17661))

(assert (=> b!174325 m!202457))

(assert (=> b!174325 m!202457))

(assert (=> b!174325 m!202467))

(declare-fun m!203315 () Bool)

(assert (=> bm!17661 m!203315))

(assert (=> b!174327 m!202457))

(declare-fun m!203317 () Bool)

(assert (=> b!174327 m!203317))

(declare-fun m!203319 () Bool)

(assert (=> b!174327 m!203319))

(assert (=> b!174327 m!202457))

(declare-fun m!203321 () Bool)

(assert (=> b!174327 m!203321))

(assert (=> bm!17598 d!53177))

(declare-fun d!53179 () Bool)

(assert (=> d!53179 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))) (v!3956 (getValueByKey!185 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52741 d!53179))

(assert (=> d!52741 d!52849))

(assert (=> d!52697 d!52717))

(assert (=> d!52697 d!52705))

(declare-fun d!53181 () Bool)

(assert (=> d!53181 (contains!1154 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))) lt!85822)))

(assert (=> d!53181 true))

(declare-fun _$35!412 () Unit!5314)

(assert (=> d!53181 (= (choose!930 lt!85823 lt!85821 (zeroValue!3439 thiss!1248) lt!85822) _$35!412)))

(declare-fun bs!7204 () Bool)

(assert (= bs!7204 d!53181))

(assert (=> bs!7204 m!201833))

(assert (=> bs!7204 m!201833))

(assert (=> bs!7204 m!201843))

(assert (=> d!52697 d!53181))

(declare-fun d!53183 () Bool)

(declare-fun e!115116 () Bool)

(assert (=> d!53183 e!115116))

(declare-fun res!82693 () Bool)

(assert (=> d!53183 (=> res!82693 e!115116)))

(declare-fun lt!86258 () Bool)

(assert (=> d!53183 (= res!82693 (not lt!86258))))

(declare-fun lt!86260 () Bool)

(assert (=> d!53183 (= lt!86258 lt!86260)))

(declare-fun lt!86261 () Unit!5314)

(declare-fun e!115117 () Unit!5314)

(assert (=> d!53183 (= lt!86261 e!115117)))

(declare-fun c!31196 () Bool)

(assert (=> d!53183 (= c!31196 lt!86260)))

(assert (=> d!53183 (= lt!86260 (containsKey!189 (toList!1099 lt!85823) lt!85822))))

(assert (=> d!53183 (= (contains!1154 lt!85823 lt!85822) lt!86258)))

(declare-fun b!174329 () Bool)

(declare-fun lt!86259 () Unit!5314)

(assert (=> b!174329 (= e!115117 lt!86259)))

(assert (=> b!174329 (= lt!86259 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85823) lt!85822))))

(assert (=> b!174329 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85823) lt!85822))))

(declare-fun b!174330 () Bool)

(declare-fun Unit!5355 () Unit!5314)

(assert (=> b!174330 (= e!115117 Unit!5355)))

(declare-fun b!174331 () Bool)

(assert (=> b!174331 (= e!115116 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85823) lt!85822)))))

(assert (= (and d!53183 c!31196) b!174329))

(assert (= (and d!53183 (not c!31196)) b!174330))

(assert (= (and d!53183 (not res!82693)) b!174331))

(declare-fun m!203323 () Bool)

(assert (=> d!53183 m!203323))

(declare-fun m!203325 () Bool)

(assert (=> b!174329 m!203325))

(declare-fun m!203327 () Bool)

(assert (=> b!174329 m!203327))

(assert (=> b!174329 m!203327))

(declare-fun m!203329 () Bool)

(assert (=> b!174329 m!203329))

(assert (=> b!174331 m!203327))

(assert (=> b!174331 m!203327))

(assert (=> b!174331 m!203329))

(assert (=> d!52697 d!53183))

(assert (=> d!52761 d!52861))

(assert (=> b!173587 d!52949))

(assert (=> b!173587 d!52951))

(declare-fun d!53185 () Bool)

(declare-fun res!82694 () Bool)

(declare-fun e!115118 () Bool)

(assert (=> d!53185 (=> res!82694 e!115118)))

(assert (=> d!53185 (= res!82694 (and ((_ is Cons!2202) (toList!1099 lt!85791)) (= (_1!1631 (h!2819 (toList!1099 lt!85791))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!53185 (= (containsKey!189 (toList!1099 lt!85791) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) e!115118)))

(declare-fun b!174332 () Bool)

(declare-fun e!115119 () Bool)

(assert (=> b!174332 (= e!115118 e!115119)))

(declare-fun res!82695 () Bool)

(assert (=> b!174332 (=> (not res!82695) (not e!115119))))

(assert (=> b!174332 (= res!82695 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85791))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85791))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2202) (toList!1099 lt!85791)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85791))) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!174333 () Bool)

(assert (=> b!174333 (= e!115119 (containsKey!189 (t!7013 (toList!1099 lt!85791)) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53185 (not res!82694)) b!174332))

(assert (= (and b!174332 res!82695) b!174333))

(assert (=> b!174333 m!201737))

(declare-fun m!203331 () Bool)

(assert (=> b!174333 m!203331))

(assert (=> d!52663 d!53185))

(declare-fun b!174334 () Bool)

(declare-fun e!115120 () Option!191)

(assert (=> b!174334 (= e!115120 (Some!190 (_2!1631 (h!2819 (t!7013 lt!85856)))))))

(declare-fun b!174337 () Bool)

(declare-fun e!115121 () Option!191)

(assert (=> b!174337 (= e!115121 None!189)))

(declare-fun b!174335 () Bool)

(assert (=> b!174335 (= e!115120 e!115121)))

(declare-fun c!31198 () Bool)

(assert (=> b!174335 (= c!31198 (and ((_ is Cons!2202) (t!7013 lt!85856)) (not (= (_1!1631 (h!2819 (t!7013 lt!85856))) (_1!1631 (tuple2!3241 key!828 v!309))))))))

(declare-fun b!174336 () Bool)

(assert (=> b!174336 (= e!115121 (getValueByKey!185 (t!7013 (t!7013 lt!85856)) (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun d!53187 () Bool)

(declare-fun c!31197 () Bool)

(assert (=> d!53187 (= c!31197 (and ((_ is Cons!2202) (t!7013 lt!85856)) (= (_1!1631 (h!2819 (t!7013 lt!85856))) (_1!1631 (tuple2!3241 key!828 v!309)))))))

(assert (=> d!53187 (= (getValueByKey!185 (t!7013 lt!85856) (_1!1631 (tuple2!3241 key!828 v!309))) e!115120)))

(assert (= (and d!53187 c!31197) b!174334))

(assert (= (and d!53187 (not c!31197)) b!174335))

(assert (= (and b!174335 c!31198) b!174336))

(assert (= (and b!174335 (not c!31198)) b!174337))

(declare-fun m!203333 () Bool)

(assert (=> b!174336 m!203333))

(assert (=> b!173669 d!53187))

(declare-fun d!53189 () Bool)

(declare-fun res!82696 () Bool)

(declare-fun e!115122 () Bool)

(assert (=> d!53189 (=> res!82696 e!115122)))

(assert (=> d!53189 (= res!82696 (and ((_ is Cons!2202) (toList!1099 lt!85817)) (= (_1!1631 (h!2819 (toList!1099 lt!85817))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53189 (= (containsKey!189 (toList!1099 lt!85817) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115122)))

(declare-fun b!174338 () Bool)

(declare-fun e!115123 () Bool)

(assert (=> b!174338 (= e!115122 e!115123)))

(declare-fun res!82697 () Bool)

(assert (=> b!174338 (=> (not res!82697) (not e!115123))))

(assert (=> b!174338 (= res!82697 (and (or (not ((_ is Cons!2202) (toList!1099 lt!85817))) (bvsle (_1!1631 (h!2819 (toList!1099 lt!85817))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2202) (toList!1099 lt!85817)) (bvslt (_1!1631 (h!2819 (toList!1099 lt!85817))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174339 () Bool)

(assert (=> b!174339 (= e!115123 (containsKey!189 (t!7013 (toList!1099 lt!85817)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53189 (not res!82696)) b!174338))

(assert (= (and b!174338 res!82697) b!174339))

(declare-fun m!203335 () Bool)

(assert (=> b!174339 m!203335))

(assert (=> d!52665 d!53189))

(declare-fun d!53191 () Bool)

(assert (=> d!53191 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86262 () Unit!5314)

(assert (=> d!53191 (= lt!86262 (choose!932 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115124 () Bool)

(assert (=> d!53191 e!115124))

(declare-fun res!82698 () Bool)

(assert (=> d!53191 (=> (not res!82698) (not e!115124))))

(assert (=> d!53191 (= res!82698 (isStrictlySorted!332 (toList!1099 lt!85791)))))

(assert (=> d!53191 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000) lt!86262)))

(declare-fun b!174340 () Bool)

(assert (=> b!174340 (= e!115124 (containsKey!189 (toList!1099 lt!85791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53191 res!82698) b!174340))

(assert (=> d!53191 m!202315))

(assert (=> d!53191 m!202315))

(assert (=> d!53191 m!202317))

(declare-fun m!203337 () Bool)

(assert (=> d!53191 m!203337))

(assert (=> d!53191 m!203135))

(assert (=> b!174340 m!202311))

(assert (=> b!173714 d!53191))

(assert (=> b!173714 d!53011))

(assert (=> b!173714 d!52795))

(declare-fun d!53193 () Bool)

(declare-fun res!82699 () Bool)

(declare-fun e!115125 () Bool)

(assert (=> d!53193 (=> res!82699 e!115125)))

(assert (=> d!53193 (= res!82699 (or ((_ is Nil!2203) lt!85992) ((_ is Nil!2203) (t!7013 lt!85992))))))

(assert (=> d!53193 (= (isStrictlySorted!332 lt!85992) e!115125)))

(declare-fun b!174341 () Bool)

(declare-fun e!115126 () Bool)

(assert (=> b!174341 (= e!115125 e!115126)))

(declare-fun res!82700 () Bool)

(assert (=> b!174341 (=> (not res!82700) (not e!115126))))

(assert (=> b!174341 (= res!82700 (bvslt (_1!1631 (h!2819 lt!85992)) (_1!1631 (h!2819 (t!7013 lt!85992)))))))

(declare-fun b!174342 () Bool)

(assert (=> b!174342 (= e!115126 (isStrictlySorted!332 (t!7013 lt!85992)))))

(assert (= (and d!53193 (not res!82699)) b!174341))

(assert (= (and b!174341 res!82700) b!174342))

(declare-fun m!203339 () Bool)

(assert (=> b!174342 m!203339))

(assert (=> d!52737 d!53193))

(declare-fun d!53195 () Bool)

(declare-fun res!82701 () Bool)

(declare-fun e!115127 () Bool)

(assert (=> d!53195 (=> res!82701 e!115127)))

(assert (=> d!53195 (= res!82701 (or ((_ is Nil!2203) (toList!1099 (map!1882 thiss!1248))) ((_ is Nil!2203) (t!7013 (toList!1099 (map!1882 thiss!1248))))))))

(assert (=> d!53195 (= (isStrictlySorted!332 (toList!1099 (map!1882 thiss!1248))) e!115127)))

(declare-fun b!174343 () Bool)

(declare-fun e!115128 () Bool)

(assert (=> b!174343 (= e!115127 e!115128)))

(declare-fun res!82702 () Bool)

(assert (=> b!174343 (=> (not res!82702) (not e!115128))))

(assert (=> b!174343 (= res!82702 (bvslt (_1!1631 (h!2819 (toList!1099 (map!1882 thiss!1248)))) (_1!1631 (h!2819 (t!7013 (toList!1099 (map!1882 thiss!1248)))))))))

(declare-fun b!174344 () Bool)

(assert (=> b!174344 (= e!115128 (isStrictlySorted!332 (t!7013 (toList!1099 (map!1882 thiss!1248)))))))

(assert (= (and d!53195 (not res!82701)) b!174343))

(assert (= (and b!174343 res!82702) b!174344))

(assert (=> b!174344 m!202947))

(assert (=> d!52737 d!53195))

(assert (=> d!52637 d!52639))

(assert (=> d!52637 d!52651))

(declare-fun d!53197 () Bool)

(assert (=> d!53197 (contains!1154 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))) lt!85788)))

(assert (=> d!53197 true))

(declare-fun _$35!413 () Unit!5314)

(assert (=> d!53197 (= (choose!930 lt!85789 lt!85787 (zeroValue!3439 thiss!1248) lt!85788) _$35!413)))

(declare-fun bs!7205 () Bool)

(assert (= bs!7205 d!53197))

(assert (=> bs!7205 m!201773))

(assert (=> bs!7205 m!201773))

(assert (=> bs!7205 m!201783))

(assert (=> d!52637 d!53197))

(declare-fun d!53199 () Bool)

(declare-fun e!115129 () Bool)

(assert (=> d!53199 e!115129))

(declare-fun res!82703 () Bool)

(assert (=> d!53199 (=> res!82703 e!115129)))

(declare-fun lt!86263 () Bool)

(assert (=> d!53199 (= res!82703 (not lt!86263))))

(declare-fun lt!86265 () Bool)

(assert (=> d!53199 (= lt!86263 lt!86265)))

(declare-fun lt!86266 () Unit!5314)

(declare-fun e!115130 () Unit!5314)

(assert (=> d!53199 (= lt!86266 e!115130)))

(declare-fun c!31199 () Bool)

(assert (=> d!53199 (= c!31199 lt!86265)))

(assert (=> d!53199 (= lt!86265 (containsKey!189 (toList!1099 lt!85789) lt!85788))))

(assert (=> d!53199 (= (contains!1154 lt!85789 lt!85788) lt!86263)))

(declare-fun b!174345 () Bool)

(declare-fun lt!86264 () Unit!5314)

(assert (=> b!174345 (= e!115130 lt!86264)))

(assert (=> b!174345 (= lt!86264 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85789) lt!85788))))

(assert (=> b!174345 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85789) lt!85788))))

(declare-fun b!174346 () Bool)

(declare-fun Unit!5356 () Unit!5314)

(assert (=> b!174346 (= e!115130 Unit!5356)))

(declare-fun b!174347 () Bool)

(assert (=> b!174347 (= e!115129 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85789) lt!85788)))))

(assert (= (and d!53199 c!31199) b!174345))

(assert (= (and d!53199 (not c!31199)) b!174346))

(assert (= (and d!53199 (not res!82703)) b!174347))

(declare-fun m!203341 () Bool)

(assert (=> d!53199 m!203341))

(declare-fun m!203343 () Bool)

(assert (=> b!174345 m!203343))

(declare-fun m!203345 () Bool)

(assert (=> b!174345 m!203345))

(assert (=> b!174345 m!203345))

(declare-fun m!203347 () Bool)

(assert (=> b!174345 m!203347))

(assert (=> b!174347 m!203345))

(assert (=> b!174347 m!203345))

(assert (=> b!174347 m!203347))

(assert (=> d!52637 d!53199))

(declare-fun d!53201 () Bool)

(declare-fun res!82704 () Bool)

(declare-fun e!115131 () Bool)

(assert (=> d!53201 (=> res!82704 e!115131)))

(assert (=> d!53201 (= res!82704 (or ((_ is Nil!2203) lt!85935) ((_ is Nil!2203) (t!7013 lt!85935))))))

(assert (=> d!53201 (= (isStrictlySorted!332 lt!85935) e!115131)))

(declare-fun b!174348 () Bool)

(declare-fun e!115132 () Bool)

(assert (=> b!174348 (= e!115131 e!115132)))

(declare-fun res!82705 () Bool)

(assert (=> b!174348 (=> (not res!82705) (not e!115132))))

(assert (=> b!174348 (= res!82705 (bvslt (_1!1631 (h!2819 lt!85935)) (_1!1631 (h!2819 (t!7013 lt!85935)))))))

(declare-fun b!174349 () Bool)

(assert (=> b!174349 (= e!115132 (isStrictlySorted!332 (t!7013 lt!85935)))))

(assert (= (and d!53201 (not res!82704)) b!174348))

(assert (= (and b!174348 res!82705) b!174349))

(declare-fun m!203349 () Bool)

(assert (=> b!174349 m!203349))

(assert (=> d!52671 d!53201))

(declare-fun d!53203 () Bool)

(declare-fun res!82706 () Bool)

(declare-fun e!115133 () Bool)

(assert (=> d!53203 (=> res!82706 e!115133)))

(assert (=> d!53203 (= res!82706 (or ((_ is Nil!2203) (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) ((_ is Nil!2203) (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))))))

(assert (=> d!53203 (= (isStrictlySorted!332 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) e!115133)))

(declare-fun b!174350 () Bool)

(declare-fun e!115134 () Bool)

(assert (=> b!174350 (= e!115133 e!115134)))

(declare-fun res!82707 () Bool)

(assert (=> b!174350 (=> (not res!82707) (not e!115134))))

(assert (=> b!174350 (= res!82707 (bvslt (_1!1631 (h!2819 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (_1!1631 (h!2819 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))))))))

(declare-fun b!174351 () Bool)

(assert (=> b!174351 (= e!115134 (isStrictlySorted!332 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))))))

(assert (= (and d!53203 (not res!82706)) b!174350))

(assert (= (and b!174350 res!82707) b!174351))

(declare-fun m!203351 () Bool)

(assert (=> b!174351 m!203351))

(assert (=> d!52671 d!53203))

(assert (=> b!173659 d!52789))

(declare-fun d!53205 () Bool)

(declare-fun e!115135 () Bool)

(assert (=> d!53205 e!115135))

(declare-fun res!82708 () Bool)

(assert (=> d!53205 (=> res!82708 e!115135)))

(declare-fun lt!86267 () Bool)

(assert (=> d!53205 (= res!82708 (not lt!86267))))

(declare-fun lt!86269 () Bool)

(assert (=> d!53205 (= lt!86267 lt!86269)))

(declare-fun lt!86270 () Unit!5314)

(declare-fun e!115136 () Unit!5314)

(assert (=> d!53205 (= lt!86270 e!115136)))

(declare-fun c!31200 () Bool)

(assert (=> d!53205 (= c!31200 lt!86269)))

(assert (=> d!53205 (= lt!86269 (containsKey!189 (toList!1099 lt!85800) lt!85794))))

(assert (=> d!53205 (= (contains!1154 lt!85800 lt!85794) lt!86267)))

(declare-fun b!174352 () Bool)

(declare-fun lt!86268 () Unit!5314)

(assert (=> b!174352 (= e!115136 lt!86268)))

(assert (=> b!174352 (= lt!86268 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85800) lt!85794))))

(assert (=> b!174352 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85800) lt!85794))))

(declare-fun b!174353 () Bool)

(declare-fun Unit!5357 () Unit!5314)

(assert (=> b!174353 (= e!115136 Unit!5357)))

(declare-fun b!174354 () Bool)

(assert (=> b!174354 (= e!115135 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85800) lt!85794)))))

(assert (= (and d!53205 c!31200) b!174352))

(assert (= (and d!53205 (not c!31200)) b!174353))

(assert (= (and d!53205 (not res!82708)) b!174354))

(declare-fun m!203353 () Bool)

(assert (=> d!53205 m!203353))

(declare-fun m!203355 () Bool)

(assert (=> b!174352 m!203355))

(assert (=> b!174352 m!201917))

(assert (=> b!174352 m!201917))

(declare-fun m!203357 () Bool)

(assert (=> b!174352 m!203357))

(assert (=> b!174354 m!201917))

(assert (=> b!174354 m!201917))

(assert (=> b!174354 m!203357))

(assert (=> d!52627 d!53205))

(declare-fun d!53207 () Bool)

(assert (=> d!53207 (= (apply!130 (+!246 lt!85800 (tuple2!3241 lt!85804 (minValue!3441 thiss!1248))) lt!85794) (apply!130 lt!85800 lt!85794))))

(assert (=> d!53207 true))

(declare-fun _$34!1058 () Unit!5314)

(assert (=> d!53207 (= (choose!929 lt!85800 lt!85804 (minValue!3441 thiss!1248) lt!85794) _$34!1058)))

(declare-fun bs!7206 () Bool)

(assert (= bs!7206 d!53207))

(assert (=> bs!7206 m!201767))

(assert (=> bs!7206 m!201767))

(assert (=> bs!7206 m!201771))

(assert (=> bs!7206 m!201777))

(assert (=> d!52627 d!53207))

(assert (=> d!52627 d!52641))

(assert (=> d!52627 d!52629))

(assert (=> d!52627 d!52649))

(declare-fun d!53209 () Bool)

(declare-fun e!115137 () Bool)

(assert (=> d!53209 e!115137))

(declare-fun res!82709 () Bool)

(assert (=> d!53209 (=> res!82709 e!115137)))

(declare-fun lt!86271 () Bool)

(assert (=> d!53209 (= res!82709 (not lt!86271))))

(declare-fun lt!86273 () Bool)

(assert (=> d!53209 (= lt!86271 lt!86273)))

(declare-fun lt!86274 () Unit!5314)

(declare-fun e!115138 () Unit!5314)

(assert (=> d!53209 (= lt!86274 e!115138)))

(declare-fun c!31201 () Bool)

(assert (=> d!53209 (= c!31201 lt!86273)))

(assert (=> d!53209 (= lt!86273 (containsKey!189 (toList!1099 lt!86018) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53209 (= (contains!1154 lt!86018 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86271)))

(declare-fun b!174355 () Bool)

(declare-fun lt!86272 () Unit!5314)

(assert (=> b!174355 (= e!115138 lt!86272)))

(assert (=> b!174355 (= lt!86272 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!86018) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174355 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86018) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174356 () Bool)

(declare-fun Unit!5358 () Unit!5314)

(assert (=> b!174356 (= e!115138 Unit!5358)))

(declare-fun b!174357 () Bool)

(assert (=> b!174357 (= e!115137 (isDefined!138 (getValueByKey!185 (toList!1099 lt!86018) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53209 c!31201) b!174355))

(assert (= (and d!53209 (not c!31201)) b!174356))

(assert (= (and d!53209 (not res!82709)) b!174357))

(declare-fun m!203359 () Bool)

(assert (=> d!53209 m!203359))

(declare-fun m!203361 () Bool)

(assert (=> b!174355 m!203361))

(assert (=> b!174355 m!202823))

(assert (=> b!174355 m!202823))

(declare-fun m!203363 () Bool)

(assert (=> b!174355 m!203363))

(assert (=> b!174357 m!202823))

(assert (=> b!174357 m!202823))

(assert (=> b!174357 m!203363))

(assert (=> bm!17613 d!53209))

(declare-fun d!53211 () Bool)

(assert (=> d!53211 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))) (v!3956 (getValueByKey!185 (toList!1099 lt!85825) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52617 d!53211))

(assert (=> d!52617 d!52971))

(declare-fun d!53213 () Bool)

(declare-fun e!115139 () Bool)

(assert (=> d!53213 e!115139))

(declare-fun res!82710 () Bool)

(assert (=> d!53213 (=> res!82710 e!115139)))

(declare-fun lt!86275 () Bool)

(assert (=> d!53213 (= res!82710 (not lt!86275))))

(declare-fun lt!86277 () Bool)

(assert (=> d!53213 (= lt!86275 lt!86277)))

(declare-fun lt!86278 () Unit!5314)

(declare-fun e!115140 () Unit!5314)

(assert (=> d!53213 (= lt!86278 e!115140)))

(declare-fun c!31202 () Bool)

(assert (=> d!53213 (= c!31202 lt!86277)))

(assert (=> d!53213 (= lt!86277 (containsKey!189 (toList!1099 lt!85862) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53213 (= (contains!1154 lt!85862 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86275)))

(declare-fun b!174358 () Bool)

(declare-fun lt!86276 () Unit!5314)

(assert (=> b!174358 (= e!115140 lt!86276)))

(assert (=> b!174358 (= lt!86276 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85862) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!174358 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85862) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174359 () Bool)

(declare-fun Unit!5359 () Unit!5314)

(assert (=> b!174359 (= e!115140 Unit!5359)))

(declare-fun b!174360 () Bool)

(assert (=> b!174360 (= e!115139 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85862) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!53213 c!31202) b!174358))

(assert (= (and d!53213 (not c!31202)) b!174359))

(assert (= (and d!53213 (not res!82710)) b!174360))

(declare-fun m!203365 () Bool)

(assert (=> d!53213 m!203365))

(declare-fun m!203367 () Bool)

(assert (=> b!174358 m!203367))

(assert (=> b!174358 m!201897))

(assert (=> b!174358 m!201897))

(declare-fun m!203369 () Bool)

(assert (=> b!174358 m!203369))

(assert (=> b!174360 m!201897))

(assert (=> b!174360 m!201897))

(assert (=> b!174360 m!203369))

(assert (=> d!52623 d!53213))

(declare-fun b!174361 () Bool)

(declare-fun e!115141 () Option!191)

(assert (=> b!174361 (= e!115141 (Some!190 (_2!1631 (h!2819 lt!85863))))))

(declare-fun b!174364 () Bool)

(declare-fun e!115142 () Option!191)

(assert (=> b!174364 (= e!115142 None!189)))

(declare-fun b!174362 () Bool)

(assert (=> b!174362 (= e!115141 e!115142)))

(declare-fun c!31204 () Bool)

(assert (=> b!174362 (= c!31204 (and ((_ is Cons!2202) lt!85863) (not (= (_1!1631 (h!2819 lt!85863)) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun b!174363 () Bool)

(assert (=> b!174363 (= e!115142 (getValueByKey!185 (t!7013 lt!85863) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun d!53215 () Bool)

(declare-fun c!31203 () Bool)

(assert (=> d!53215 (= c!31203 (and ((_ is Cons!2202) lt!85863) (= (_1!1631 (h!2819 lt!85863)) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!53215 (= (getValueByKey!185 lt!85863 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!115141)))

(assert (= (and d!53215 c!31203) b!174361))

(assert (= (and d!53215 (not c!31203)) b!174362))

(assert (= (and b!174362 c!31204) b!174363))

(assert (= (and b!174362 (not c!31204)) b!174364))

(declare-fun m!203371 () Bool)

(assert (=> b!174363 m!203371))

(assert (=> d!52623 d!53215))

(declare-fun d!53217 () Bool)

(assert (=> d!53217 (= (getValueByKey!185 lt!85863 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!190 (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun lt!86279 () Unit!5314)

(assert (=> d!53217 (= lt!86279 (choose!931 lt!85863 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!115143 () Bool)

(assert (=> d!53217 e!115143))

(declare-fun res!82711 () Bool)

(assert (=> d!53217 (=> (not res!82711) (not e!115143))))

(assert (=> d!53217 (= res!82711 (isStrictlySorted!332 lt!85863))))

(assert (=> d!53217 (= (lemmaContainsTupThenGetReturnValue!98 lt!85863 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86279)))

(declare-fun b!174365 () Bool)

(declare-fun res!82712 () Bool)

(assert (=> b!174365 (=> (not res!82712) (not e!115143))))

(assert (=> b!174365 (= res!82712 (containsKey!189 lt!85863 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174366 () Bool)

(assert (=> b!174366 (= e!115143 (contains!1155 lt!85863 (tuple2!3241 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!53217 res!82711) b!174365))

(assert (= (and b!174365 res!82712) b!174366))

(assert (=> d!53217 m!201891))

(declare-fun m!203373 () Bool)

(assert (=> d!53217 m!203373))

(declare-fun m!203375 () Bool)

(assert (=> d!53217 m!203375))

(declare-fun m!203377 () Bool)

(assert (=> b!174365 m!203377))

(declare-fun m!203379 () Bool)

(assert (=> b!174366 m!203379))

(assert (=> d!52623 d!53217))

(declare-fun bm!17663 () Bool)

(declare-fun call!17667 () List!2206)

(declare-fun call!17665 () List!2206)

(assert (=> bm!17663 (= call!17667 call!17665)))

(declare-fun b!174367 () Bool)

(declare-fun c!31208 () Bool)

(declare-fun c!31206 () Bool)

(declare-fun e!115147 () List!2206)

(assert (=> b!174367 (= e!115147 (ite c!31206 (t!7013 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)))) (ite c!31208 (Cons!2202 (h!2819 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)))) (t!7013 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585))))) Nil!2203)))))

(declare-fun b!174368 () Bool)

(declare-fun res!82713 () Bool)

(declare-fun e!115148 () Bool)

(assert (=> b!174368 (=> (not res!82713) (not e!115148))))

(declare-fun lt!86280 () List!2206)

(assert (=> b!174368 (= res!82713 (containsKey!189 lt!86280 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174369 () Bool)

(declare-fun e!115145 () List!2206)

(assert (=> b!174369 (= e!115145 call!17665)))

(declare-fun b!174370 () Bool)

(assert (=> b!174370 (= c!31208 (and ((_ is Cons!2202) (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)))) (bvsgt (_1!1631 (h!2819 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585))))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun e!115146 () List!2206)

(declare-fun e!115144 () List!2206)

(assert (=> b!174370 (= e!115146 e!115144)))

(declare-fun b!174371 () Bool)

(declare-fun call!17666 () List!2206)

(assert (=> b!174371 (= e!115144 call!17666)))

(declare-fun b!174372 () Bool)

(assert (=> b!174372 (= e!115144 call!17666)))

(declare-fun b!174373 () Bool)

(assert (=> b!174373 (= e!115145 e!115146)))

(assert (=> b!174373 (= c!31206 (and ((_ is Cons!2202) (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)))) (= (_1!1631 (h!2819 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585))))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31205 () Bool)

(declare-fun bm!17662 () Bool)

(assert (=> bm!17662 (= call!17665 ($colon$colon!98 e!115147 (ite c!31205 (h!2819 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)))) (tuple2!3241 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun c!31207 () Bool)

(assert (=> bm!17662 (= c!31207 c!31205)))

(declare-fun d!53219 () Bool)

(assert (=> d!53219 e!115148))

(declare-fun res!82714 () Bool)

(assert (=> d!53219 (=> (not res!82714) (not e!115148))))

(assert (=> d!53219 (= res!82714 (isStrictlySorted!332 lt!86280))))

(assert (=> d!53219 (= lt!86280 e!115145)))

(assert (=> d!53219 (= c!31205 (and ((_ is Cons!2202) (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)))) (bvslt (_1!1631 (h!2819 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585))))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!53219 (isStrictlySorted!332 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585))))))

(assert (=> d!53219 (= (insertStrictlySorted!101 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86280)))

(declare-fun bm!17664 () Bool)

(assert (=> bm!17664 (= call!17666 call!17667)))

(declare-fun b!174374 () Bool)

(assert (=> b!174374 (= e!115146 call!17667)))

(declare-fun b!174375 () Bool)

(assert (=> b!174375 (= e!115147 (insertStrictlySorted!101 (t!7013 (toList!1099 (ite c!30915 call!17582 (ite c!30918 call!17581 call!17585)))) (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174376 () Bool)

(assert (=> b!174376 (= e!115148 (contains!1155 lt!86280 (tuple2!3241 (_1!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1631 (ite (or c!30915 c!30918) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!53219 c!31205) b!174369))

(assert (= (and d!53219 (not c!31205)) b!174373))

(assert (= (and b!174373 c!31206) b!174374))

(assert (= (and b!174373 (not c!31206)) b!174370))

(assert (= (and b!174370 c!31208) b!174371))

(assert (= (and b!174370 (not c!31208)) b!174372))

(assert (= (or b!174371 b!174372) bm!17664))

(assert (= (or b!174374 bm!17664) bm!17663))

(assert (= (or b!174369 bm!17663) bm!17662))

(assert (= (and bm!17662 c!31207) b!174375))

(assert (= (and bm!17662 (not c!31207)) b!174367))

(assert (= (and d!53219 res!82714) b!174368))

(assert (= (and b!174368 res!82713) b!174376))

(declare-fun m!203381 () Bool)

(assert (=> b!174376 m!203381))

(declare-fun m!203383 () Bool)

(assert (=> bm!17662 m!203383))

(declare-fun m!203385 () Bool)

(assert (=> b!174375 m!203385))

(declare-fun m!203387 () Bool)

(assert (=> b!174368 m!203387))

(declare-fun m!203389 () Bool)

(assert (=> d!53219 m!203389))

(declare-fun m!203391 () Bool)

(assert (=> d!53219 m!203391))

(assert (=> d!52623 d!53219))

(declare-fun d!53221 () Bool)

(declare-fun e!115149 () Bool)

(assert (=> d!53221 e!115149))

(declare-fun res!82715 () Bool)

(assert (=> d!53221 (=> res!82715 e!115149)))

(declare-fun lt!86281 () Bool)

(assert (=> d!53221 (= res!82715 (not lt!86281))))

(declare-fun lt!86283 () Bool)

(assert (=> d!53221 (= lt!86281 lt!86283)))

(declare-fun lt!86284 () Unit!5314)

(declare-fun e!115150 () Unit!5314)

(assert (=> d!53221 (= lt!86284 e!115150)))

(declare-fun c!31209 () Bool)

(assert (=> d!53221 (= c!31209 lt!86283)))

(assert (=> d!53221 (= lt!86283 (containsKey!189 (toList!1099 lt!85942) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53221 (= (contains!1154 lt!85942 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)) lt!86281)))

(declare-fun b!174377 () Bool)

(declare-fun lt!86282 () Unit!5314)

(assert (=> b!174377 (= e!115150 lt!86282)))

(assert (=> b!174377 (= lt!86282 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85942) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174377 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85942) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174378 () Bool)

(declare-fun Unit!5360 () Unit!5314)

(assert (=> b!174378 (= e!115150 Unit!5360)))

(declare-fun b!174379 () Bool)

(assert (=> b!174379 (= e!115149 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85942) (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53221 c!31209) b!174377))

(assert (= (and d!53221 (not c!31209)) b!174378))

(assert (= (and d!53221 (not res!82715)) b!174379))

(assert (=> d!53221 m!201737))

(declare-fun m!203393 () Bool)

(assert (=> d!53221 m!203393))

(assert (=> b!174377 m!201737))

(declare-fun m!203395 () Bool)

(assert (=> b!174377 m!203395))

(assert (=> b!174377 m!201737))

(assert (=> b!174377 m!202393))

(assert (=> b!174377 m!202393))

(declare-fun m!203397 () Bool)

(assert (=> b!174377 m!203397))

(assert (=> b!174379 m!201737))

(assert (=> b!174379 m!202393))

(assert (=> b!174379 m!202393))

(assert (=> b!174379 m!203397))

(assert (=> b!173590 d!53221))

(assert (=> b!173729 d!52777))

(declare-fun d!53223 () Bool)

(declare-fun res!82716 () Bool)

(declare-fun e!115151 () Bool)

(assert (=> d!53223 (=> res!82716 e!115151)))

(assert (=> d!53223 (= res!82716 (and ((_ is Cons!2202) lt!85935) (= (_1!1631 (h!2819 lt!85935)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53223 (= (containsKey!189 lt!85935 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115151)))

(declare-fun b!174380 () Bool)

(declare-fun e!115152 () Bool)

(assert (=> b!174380 (= e!115151 e!115152)))

(declare-fun res!82717 () Bool)

(assert (=> b!174380 (=> (not res!82717) (not e!115152))))

(assert (=> b!174380 (= res!82717 (and (or (not ((_ is Cons!2202) lt!85935)) (bvsle (_1!1631 (h!2819 lt!85935)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2202) lt!85935) (bvslt (_1!1631 (h!2819 lt!85935)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174381 () Bool)

(assert (=> b!174381 (= e!115152 (containsKey!189 (t!7013 lt!85935) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53223 (not res!82716)) b!174380))

(assert (= (and b!174380 res!82717) b!174381))

(declare-fun m!203399 () Bool)

(assert (=> b!174381 m!203399))

(assert (=> b!173568 d!53223))

(declare-fun b!174382 () Bool)

(declare-fun e!115153 () Option!191)

(assert (=> b!174382 (= e!115153 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85911)))))))

(declare-fun b!174385 () Bool)

(declare-fun e!115154 () Option!191)

(assert (=> b!174385 (= e!115154 None!189)))

(declare-fun b!174383 () Bool)

(assert (=> b!174383 (= e!115153 e!115154)))

(declare-fun c!31211 () Bool)

(assert (=> b!174383 (= c!31211 (and ((_ is Cons!2202) (toList!1099 lt!85911)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85911))) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))))

(declare-fun b!174384 () Bool)

(assert (=> b!174384 (= e!115154 (getValueByKey!185 (t!7013 (toList!1099 lt!85911)) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))))))

(declare-fun c!31210 () Bool)

(declare-fun d!53225 () Bool)

(assert (=> d!53225 (= c!31210 (and ((_ is Cons!2202) (toList!1099 lt!85911)) (= (_1!1631 (h!2819 (toList!1099 lt!85911))) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53225 (= (getValueByKey!185 (toList!1099 lt!85911) (_1!1631 (tuple2!3241 lt!85799 (zeroValue!3439 thiss!1248)))) e!115153)))

(assert (= (and d!53225 c!31210) b!174382))

(assert (= (and d!53225 (not c!31210)) b!174383))

(assert (= (and b!174383 c!31211) b!174384))

(assert (= (and b!174383 (not c!31211)) b!174385))

(declare-fun m!203401 () Bool)

(assert (=> b!174384 m!203401))

(assert (=> b!173516 d!53225))

(assert (=> b!173663 d!52969))

(assert (=> b!173663 d!52971))

(assert (=> bm!17617 d!53131))

(declare-fun d!53227 () Bool)

(assert (=> d!53227 (= (apply!130 lt!86018 (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000)) (get!1969 (getValueByKey!185 (toList!1099 lt!86018) (select (arr!3467 (_keys!5439 lt!85729)) #b00000000000000000000000000000000))))))

(declare-fun bs!7207 () Bool)

(assert (= bs!7207 d!53227))

(assert (=> bs!7207 m!202223))

(assert (=> bs!7207 m!202659))

(assert (=> bs!7207 m!202659))

(declare-fun m!203403 () Bool)

(assert (=> bs!7207 m!203403))

(assert (=> b!173741 d!53227))

(declare-fun d!53229 () Bool)

(declare-fun c!31212 () Bool)

(assert (=> d!53229 (= c!31212 ((_ is ValueCellFull!1698) (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000)))))

(declare-fun e!115155 () V!5091)

(assert (=> d!53229 (= (get!1968 (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 lt!85729) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115155)))

(declare-fun b!174386 () Bool)

(assert (=> b!174386 (= e!115155 (get!1970 (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 lt!85729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174387 () Bool)

(assert (=> b!174387 (= e!115155 (get!1971 (select (arr!3468 (_values!3581 lt!85729)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 lt!85729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53229 c!31212) b!174386))

(assert (= (and d!53229 (not c!31212)) b!174387))

(assert (=> b!174386 m!202335))

(assert (=> b!174386 m!202337))

(declare-fun m!203405 () Bool)

(assert (=> b!174386 m!203405))

(assert (=> b!174387 m!202335))

(assert (=> b!174387 m!202337))

(declare-fun m!203407 () Bool)

(assert (=> b!174387 m!203407))

(assert (=> b!173741 d!53229))

(declare-fun d!53231 () Bool)

(declare-fun e!115156 () Bool)

(assert (=> d!53231 e!115156))

(declare-fun res!82718 () Bool)

(assert (=> d!53231 (=> (not res!82718) (not e!115156))))

(declare-fun lt!86286 () ListLongMap!2167)

(assert (=> d!53231 (= res!82718 (contains!1154 lt!86286 (_1!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))))))

(declare-fun lt!86287 () List!2206)

(assert (=> d!53231 (= lt!86286 (ListLongMap!2168 lt!86287))))

(declare-fun lt!86288 () Unit!5314)

(declare-fun lt!86285 () Unit!5314)

(assert (=> d!53231 (= lt!86288 lt!86285)))

(assert (=> d!53231 (= (getValueByKey!185 lt!86287 (_1!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))) (Some!190 (_2!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))))))

(assert (=> d!53231 (= lt!86285 (lemmaContainsTupThenGetReturnValue!98 lt!86287 (_1!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))) (_2!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))))))

(assert (=> d!53231 (= lt!86287 (insertStrictlySorted!101 (toList!1099 (ite c!30999 call!17617 (ite c!31002 call!17616 call!17620))) (_1!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))) (_2!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))))))

(assert (=> d!53231 (= (+!246 (ite c!30999 call!17617 (ite c!31002 call!17616 call!17620)) (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))) lt!86286)))

(declare-fun b!174388 () Bool)

(declare-fun res!82719 () Bool)

(assert (=> b!174388 (=> (not res!82719) (not e!115156))))

(assert (=> b!174388 (= res!82719 (= (getValueByKey!185 (toList!1099 lt!86286) (_1!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729))))) (Some!190 (_2!1631 (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))))))))

(declare-fun b!174389 () Bool)

(assert (=> b!174389 (= e!115156 (contains!1155 (toList!1099 lt!86286) (ite (or c!30999 c!31002) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 lt!85729)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 lt!85729)))))))

(assert (= (and d!53231 res!82718) b!174388))

(assert (= (and b!174388 res!82719) b!174389))

(declare-fun m!203409 () Bool)

(assert (=> d!53231 m!203409))

(declare-fun m!203411 () Bool)

(assert (=> d!53231 m!203411))

(declare-fun m!203413 () Bool)

(assert (=> d!53231 m!203413))

(declare-fun m!203415 () Bool)

(assert (=> d!53231 m!203415))

(declare-fun m!203417 () Bool)

(assert (=> b!174388 m!203417))

(declare-fun m!203419 () Bool)

(assert (=> b!174389 m!203419))

(assert (=> bm!17612 d!53231))

(assert (=> b!173502 d!53025))

(declare-fun d!53233 () Bool)

(declare-fun lt!86289 () Bool)

(assert (=> d!53233 (= lt!86289 (select (content!149 (t!7013 (toList!1099 lt!85817))) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!115158 () Bool)

(assert (=> d!53233 (= lt!86289 e!115158)))

(declare-fun res!82721 () Bool)

(assert (=> d!53233 (=> (not res!82721) (not e!115158))))

(assert (=> d!53233 (= res!82721 ((_ is Cons!2202) (t!7013 (toList!1099 lt!85817))))))

(assert (=> d!53233 (= (contains!1155 (t!7013 (toList!1099 lt!85817)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!86289)))

(declare-fun b!174390 () Bool)

(declare-fun e!115157 () Bool)

(assert (=> b!174390 (= e!115158 e!115157)))

(declare-fun res!82720 () Bool)

(assert (=> b!174390 (=> res!82720 e!115157)))

(assert (=> b!174390 (= res!82720 (= (h!2819 (t!7013 (toList!1099 lt!85817))) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!174391 () Bool)

(assert (=> b!174391 (= e!115157 (contains!1155 (t!7013 (t!7013 (toList!1099 lt!85817))) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!53233 res!82721) b!174390))

(assert (= (and b!174390 (not res!82720)) b!174391))

(assert (=> d!53233 m!203141))

(declare-fun m!203421 () Bool)

(assert (=> d!53233 m!203421))

(declare-fun m!203423 () Bool)

(assert (=> b!174391 m!203423))

(assert (=> b!173696 d!53233))

(declare-fun d!53235 () Bool)

(assert (=> d!53235 (= (get!1969 (getValueByKey!185 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) lt!85829)) (v!3956 (getValueByKey!185 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) lt!85829)))))

(assert (=> d!52693 d!53235))

(declare-fun b!174392 () Bool)

(declare-fun e!115159 () Option!191)

(assert (=> b!174392 (= e!115159 (Some!190 (_2!1631 (h!2819 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))))))))

(declare-fun b!174395 () Bool)

(declare-fun e!115160 () Option!191)

(assert (=> b!174395 (= e!115160 None!189)))

(declare-fun b!174393 () Bool)

(assert (=> b!174393 (= e!115159 e!115160)))

(declare-fun c!31214 () Bool)

(assert (=> b!174393 (= c!31214 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))) (not (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))) lt!85829))))))

(declare-fun b!174394 () Bool)

(assert (=> b!174394 (= e!115160 (getValueByKey!185 (t!7013 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))) lt!85829))))

(declare-fun c!31213 () Bool)

(declare-fun d!53237 () Bool)

(assert (=> d!53237 (= c!31213 (and ((_ is Cons!2202) (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248))))) (= (_1!1631 (h!2819 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))))) lt!85829)))))

(assert (=> d!53237 (= (getValueByKey!185 (toList!1099 (+!246 lt!85840 (tuple2!3241 lt!85833 (zeroValue!3439 thiss!1248)))) lt!85829) e!115159)))

(assert (= (and d!53237 c!31213) b!174392))

(assert (= (and d!53237 (not c!31213)) b!174393))

(assert (= (and b!174393 c!31214) b!174394))

(assert (= (and b!174393 (not c!31214)) b!174395))

(declare-fun m!203425 () Bool)

(assert (=> b!174394 m!203425))

(assert (=> d!52693 d!53237))

(assert (=> d!52713 d!52695))

(declare-fun d!53239 () Bool)

(declare-fun e!115161 () Bool)

(assert (=> d!53239 e!115161))

(declare-fun res!82722 () Bool)

(assert (=> d!53239 (=> res!82722 e!115161)))

(declare-fun lt!86290 () Bool)

(assert (=> d!53239 (= res!82722 (not lt!86290))))

(declare-fun lt!86292 () Bool)

(assert (=> d!53239 (= lt!86290 lt!86292)))

(declare-fun lt!86293 () Unit!5314)

(declare-fun e!115162 () Unit!5314)

(assert (=> d!53239 (= lt!86293 e!115162)))

(declare-fun c!31215 () Bool)

(assert (=> d!53239 (= c!31215 lt!86292)))

(assert (=> d!53239 (= lt!86292 (containsKey!189 (toList!1099 lt!85834) lt!85828))))

(assert (=> d!53239 (= (contains!1154 lt!85834 lt!85828) lt!86290)))

(declare-fun b!174396 () Bool)

(declare-fun lt!86291 () Unit!5314)

(assert (=> b!174396 (= e!115162 lt!86291)))

(assert (=> b!174396 (= lt!86291 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85834) lt!85828))))

(assert (=> b!174396 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85834) lt!85828))))

(declare-fun b!174397 () Bool)

(declare-fun Unit!5361 () Unit!5314)

(assert (=> b!174397 (= e!115162 Unit!5361)))

(declare-fun b!174398 () Bool)

(assert (=> b!174398 (= e!115161 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85834) lt!85828)))))

(assert (= (and d!53239 c!31215) b!174396))

(assert (= (and d!53239 (not c!31215)) b!174397))

(assert (= (and d!53239 (not res!82722)) b!174398))

(declare-fun m!203427 () Bool)

(assert (=> d!53239 m!203427))

(declare-fun m!203429 () Bool)

(assert (=> b!174396 m!203429))

(assert (=> b!174396 m!202175))

(assert (=> b!174396 m!202175))

(declare-fun m!203431 () Bool)

(assert (=> b!174396 m!203431))

(assert (=> b!174398 m!202175))

(assert (=> b!174398 m!202175))

(assert (=> b!174398 m!203431))

(assert (=> d!52713 d!53239))

(assert (=> d!52713 d!52707))

(declare-fun d!53241 () Bool)

(assert (=> d!53241 (= (apply!130 (+!246 lt!85834 (tuple2!3241 lt!85838 v!309)) lt!85828) (apply!130 lt!85834 lt!85828))))

(assert (=> d!53241 true))

(declare-fun _$34!1059 () Unit!5314)

(assert (=> d!53241 (= (choose!929 lt!85834 lt!85838 v!309 lt!85828) _$34!1059)))

(declare-fun bs!7208 () Bool)

(assert (= bs!7208 d!53241))

(assert (=> bs!7208 m!201827))

(assert (=> bs!7208 m!201827))

(assert (=> bs!7208 m!201831))

(assert (=> bs!7208 m!201837))

(assert (=> d!52713 d!53241))

(assert (=> d!52713 d!52711))

(declare-fun d!53243 () Bool)

(declare-fun e!115163 () Bool)

(assert (=> d!53243 e!115163))

(declare-fun res!82723 () Bool)

(assert (=> d!53243 (=> res!82723 e!115163)))

(declare-fun lt!86294 () Bool)

(assert (=> d!53243 (= res!82723 (not lt!86294))))

(declare-fun lt!86296 () Bool)

(assert (=> d!53243 (= lt!86294 lt!86296)))

(declare-fun lt!86297 () Unit!5314)

(declare-fun e!115164 () Unit!5314)

(assert (=> d!53243 (= lt!86297 e!115164)))

(declare-fun c!31216 () Bool)

(assert (=> d!53243 (= c!31216 lt!86296)))

(assert (=> d!53243 (= lt!86296 (containsKey!189 (toList!1099 (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941))) lt!85943))))

(assert (=> d!53243 (= (contains!1154 (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941)) lt!85943) lt!86294)))

(declare-fun b!174399 () Bool)

(declare-fun lt!86295 () Unit!5314)

(assert (=> b!174399 (= e!115164 lt!86295)))

(assert (=> b!174399 (= lt!86295 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941))) lt!85943))))

(assert (=> b!174399 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941))) lt!85943))))

(declare-fun b!174400 () Bool)

(declare-fun Unit!5362 () Unit!5314)

(assert (=> b!174400 (= e!115164 Unit!5362)))

(declare-fun b!174401 () Bool)

(assert (=> b!174401 (= e!115163 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941))) lt!85943)))))

(assert (= (and d!53243 c!31216) b!174399))

(assert (= (and d!53243 (not c!31216)) b!174400))

(assert (= (and d!53243 (not res!82723)) b!174401))

(declare-fun m!203433 () Bool)

(assert (=> d!53243 m!203433))

(declare-fun m!203435 () Bool)

(assert (=> b!174399 m!203435))

(declare-fun m!203437 () Bool)

(assert (=> b!174399 m!203437))

(assert (=> b!174399 m!203437))

(declare-fun m!203439 () Bool)

(assert (=> b!174399 m!203439))

(assert (=> b!174401 m!203437))

(assert (=> b!174401 m!203437))

(assert (=> b!174401 m!203439))

(assert (=> b!173598 d!53243))

(declare-fun d!53245 () Bool)

(declare-fun e!115165 () Bool)

(assert (=> d!53245 e!115165))

(declare-fun res!82724 () Bool)

(assert (=> d!53245 (=> (not res!82724) (not e!115165))))

(declare-fun lt!86299 () ListLongMap!2167)

(assert (=> d!53245 (= res!82724 (contains!1154 lt!86299 (_1!1631 (tuple2!3241 lt!85945 lt!85941))))))

(declare-fun lt!86300 () List!2206)

(assert (=> d!53245 (= lt!86299 (ListLongMap!2168 lt!86300))))

(declare-fun lt!86301 () Unit!5314)

(declare-fun lt!86298 () Unit!5314)

(assert (=> d!53245 (= lt!86301 lt!86298)))

(assert (=> d!53245 (= (getValueByKey!185 lt!86300 (_1!1631 (tuple2!3241 lt!85945 lt!85941))) (Some!190 (_2!1631 (tuple2!3241 lt!85945 lt!85941))))))

(assert (=> d!53245 (= lt!86298 (lemmaContainsTupThenGetReturnValue!98 lt!86300 (_1!1631 (tuple2!3241 lt!85945 lt!85941)) (_2!1631 (tuple2!3241 lt!85945 lt!85941))))))

(assert (=> d!53245 (= lt!86300 (insertStrictlySorted!101 (toList!1099 lt!85946) (_1!1631 (tuple2!3241 lt!85945 lt!85941)) (_2!1631 (tuple2!3241 lt!85945 lt!85941))))))

(assert (=> d!53245 (= (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941)) lt!86299)))

(declare-fun b!174402 () Bool)

(declare-fun res!82725 () Bool)

(assert (=> b!174402 (=> (not res!82725) (not e!115165))))

(assert (=> b!174402 (= res!82725 (= (getValueByKey!185 (toList!1099 lt!86299) (_1!1631 (tuple2!3241 lt!85945 lt!85941))) (Some!190 (_2!1631 (tuple2!3241 lt!85945 lt!85941)))))))

(declare-fun b!174403 () Bool)

(assert (=> b!174403 (= e!115165 (contains!1155 (toList!1099 lt!86299) (tuple2!3241 lt!85945 lt!85941)))))

(assert (= (and d!53245 res!82724) b!174402))

(assert (= (and b!174402 res!82725) b!174403))

(declare-fun m!203441 () Bool)

(assert (=> d!53245 m!203441))

(declare-fun m!203443 () Bool)

(assert (=> d!53245 m!203443))

(declare-fun m!203445 () Bool)

(assert (=> d!53245 m!203445))

(declare-fun m!203447 () Bool)

(assert (=> d!53245 m!203447))

(declare-fun m!203449 () Bool)

(assert (=> b!174402 m!203449))

(declare-fun m!203451 () Bool)

(assert (=> b!174403 m!203451))

(assert (=> b!173598 d!53245))

(declare-fun d!53247 () Bool)

(declare-fun e!115166 () Bool)

(assert (=> d!53247 e!115166))

(declare-fun res!82726 () Bool)

(assert (=> d!53247 (=> (not res!82726) (not e!115166))))

(declare-fun lt!86303 () ListLongMap!2167)

(assert (=> d!53247 (= res!82726 (contains!1154 lt!86303 (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!86304 () List!2206)

(assert (=> d!53247 (= lt!86303 (ListLongMap!2168 lt!86304))))

(declare-fun lt!86305 () Unit!5314)

(declare-fun lt!86302 () Unit!5314)

(assert (=> d!53247 (= lt!86305 lt!86302)))

(assert (=> d!53247 (= (getValueByKey!185 lt!86304 (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53247 (= lt!86302 (lemmaContainsTupThenGetReturnValue!98 lt!86304 (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53247 (= lt!86304 (insertStrictlySorted!101 (toList!1099 call!17598) (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53247 (= (+!246 call!17598 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!86303)))

(declare-fun b!174404 () Bool)

(declare-fun res!82727 () Bool)

(assert (=> b!174404 (=> (not res!82727) (not e!115166))))

(assert (=> b!174404 (= res!82727 (= (getValueByKey!185 (toList!1099 lt!86303) (_1!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!190 (_2!1631 (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!174405 () Bool)

(assert (=> b!174405 (= e!115166 (contains!1155 (toList!1099 lt!86303) (tuple2!3241 (select (arr!3467 (_keys!5439 thiss!1248)) #b00000000000000000000000000000000) (get!1968 (select (arr!3468 (_values!3581 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3598 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!53247 res!82726) b!174404))

(assert (= (and b!174404 res!82727) b!174405))

(declare-fun m!203453 () Bool)

(assert (=> d!53247 m!203453))

(declare-fun m!203455 () Bool)

(assert (=> d!53247 m!203455))

(declare-fun m!203457 () Bool)

(assert (=> d!53247 m!203457))

(declare-fun m!203459 () Bool)

(assert (=> d!53247 m!203459))

(declare-fun m!203461 () Bool)

(assert (=> b!174404 m!203461))

(declare-fun m!203463 () Bool)

(assert (=> b!174405 m!203463))

(assert (=> b!173598 d!53247))

(declare-fun d!53249 () Bool)

(assert (=> d!53249 (not (contains!1154 (+!246 lt!85946 (tuple2!3241 lt!85945 lt!85941)) lt!85943))))

(declare-fun lt!86306 () Unit!5314)

(assert (=> d!53249 (= lt!86306 (choose!933 lt!85946 lt!85945 lt!85941 lt!85943))))

(declare-fun e!115167 () Bool)

(assert (=> d!53249 e!115167))

(declare-fun res!82728 () Bool)

(assert (=> d!53249 (=> (not res!82728) (not e!115167))))

(assert (=> d!53249 (= res!82728 (not (contains!1154 lt!85946 lt!85943)))))

(assert (=> d!53249 (= (addStillNotContains!72 lt!85946 lt!85945 lt!85941 lt!85943) lt!86306)))

(declare-fun b!174406 () Bool)

(assert (=> b!174406 (= e!115167 (not (= lt!85945 lt!85943)))))

(assert (= (and d!53249 res!82728) b!174406))

(assert (=> d!53249 m!202103))

(assert (=> d!53249 m!202103))

(assert (=> d!53249 m!202105))

(declare-fun m!203465 () Bool)

(assert (=> d!53249 m!203465))

(declare-fun m!203467 () Bool)

(assert (=> d!53249 m!203467))

(assert (=> b!173598 d!53249))

(assert (=> b!173598 d!52619))

(declare-fun b!174407 () Bool)

(declare-fun e!115168 () Option!191)

(assert (=> b!174407 (= e!115168 (Some!190 (_2!1631 (h!2819 (t!7013 lt!85818)))))))

(declare-fun b!174410 () Bool)

(declare-fun e!115169 () Option!191)

(assert (=> b!174410 (= e!115169 None!189)))

(declare-fun b!174408 () Bool)

(assert (=> b!174408 (= e!115168 e!115169)))

(declare-fun c!31218 () Bool)

(assert (=> b!174408 (= c!31218 (and ((_ is Cons!2202) (t!7013 lt!85818)) (not (= (_1!1631 (h!2819 (t!7013 lt!85818))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174409 () Bool)

(assert (=> b!174409 (= e!115169 (getValueByKey!185 (t!7013 (t!7013 lt!85818)) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun d!53251 () Bool)

(declare-fun c!31217 () Bool)

(assert (=> d!53251 (= c!31217 (and ((_ is Cons!2202) (t!7013 lt!85818)) (= (_1!1631 (h!2819 (t!7013 lt!85818))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53251 (= (getValueByKey!185 (t!7013 lt!85818) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115168)))

(assert (= (and d!53251 c!31217) b!174407))

(assert (= (and d!53251 (not c!31217)) b!174408))

(assert (= (and b!174408 c!31218) b!174409))

(assert (= (and b!174408 (not c!31218)) b!174410))

(declare-fun m!203469 () Bool)

(assert (=> b!174409 m!203469))

(assert (=> b!173539 d!53251))

(declare-fun d!53253 () Bool)

(assert (=> d!53253 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822))))

(declare-fun lt!86307 () Unit!5314)

(assert (=> d!53253 (= lt!86307 (choose!932 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822))))

(declare-fun e!115170 () Bool)

(assert (=> d!53253 e!115170))

(declare-fun res!82729 () Bool)

(assert (=> d!53253 (=> (not res!82729) (not e!115170))))

(assert (=> d!53253 (= res!82729 (isStrictlySorted!332 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53253 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822) lt!86307)))

(declare-fun b!174411 () Bool)

(assert (=> b!174411 (= e!115170 (containsKey!189 (toList!1099 (+!246 lt!85823 (tuple2!3241 lt!85821 (zeroValue!3439 thiss!1248)))) lt!85822))))

(assert (= (and d!53253 res!82729) b!174411))

(assert (=> d!53253 m!202207))

(assert (=> d!53253 m!202207))

(assert (=> d!53253 m!202209))

(declare-fun m!203471 () Bool)

(assert (=> d!53253 m!203471))

(declare-fun m!203473 () Bool)

(assert (=> d!53253 m!203473))

(assert (=> b!174411 m!202203))

(assert (=> b!173625 d!53253))

(assert (=> b!173625 d!53029))

(assert (=> b!173625 d!53031))

(declare-fun d!53255 () Bool)

(assert (=> d!53255 (isDefined!138 (getValueByKey!185 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788))))

(declare-fun lt!86308 () Unit!5314)

(assert (=> d!53255 (= lt!86308 (choose!932 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788))))

(declare-fun e!115171 () Bool)

(assert (=> d!53255 e!115171))

(declare-fun res!82730 () Bool)

(assert (=> d!53255 (=> (not res!82730) (not e!115171))))

(assert (=> d!53255 (= res!82730 (isStrictlySorted!332 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248))))))))

(assert (=> d!53255 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788) lt!86308)))

(declare-fun b!174412 () Bool)

(assert (=> b!174412 (= e!115171 (containsKey!189 (toList!1099 (+!246 lt!85789 (tuple2!3241 lt!85787 (zeroValue!3439 thiss!1248)))) lt!85788))))

(assert (= (and d!53255 res!82730) b!174412))

(assert (=> d!53255 m!201957))

(assert (=> d!53255 m!201957))

(assert (=> d!53255 m!201959))

(declare-fun m!203475 () Bool)

(assert (=> d!53255 m!203475))

(declare-fun m!203477 () Bool)

(assert (=> d!53255 m!203477))

(assert (=> b!174412 m!201953))

(assert (=> b!173508 d!53255))

(assert (=> b!173508 d!53033))

(assert (=> b!173508 d!53035))

(declare-fun d!53257 () Bool)

(assert (=> d!53257 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86309 () Unit!5314)

(assert (=> d!53257 (= lt!86309 (choose!932 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115172 () Bool)

(assert (=> d!53257 e!115172))

(declare-fun res!82731 () Bool)

(assert (=> d!53257 (=> (not res!82731) (not e!115172))))

(assert (=> d!53257 (= res!82731 (isStrictlySorted!332 (toList!1099 lt!85791)))))

(assert (=> d!53257 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000) lt!86309)))

(declare-fun b!174413 () Bool)

(assert (=> b!174413 (= e!115172 (containsKey!189 (toList!1099 lt!85791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53257 res!82731) b!174413))

(assert (=> d!53257 m!202295))

(assert (=> d!53257 m!202295))

(assert (=> d!53257 m!202297))

(declare-fun m!203479 () Bool)

(assert (=> d!53257 m!203479))

(assert (=> d!53257 m!203135))

(assert (=> b!174413 m!202291))

(assert (=> b!173703 d!53257))

(assert (=> b!173703 d!52991))

(assert (=> b!173703 d!52805))

(declare-fun bm!17666 () Bool)

(declare-fun call!17670 () List!2206)

(declare-fun call!17668 () List!2206)

(assert (=> bm!17666 (= call!17670 call!17668)))

(declare-fun c!31220 () Bool)

(declare-fun e!115176 () List!2206)

(declare-fun c!31222 () Bool)

(declare-fun b!174414 () Bool)

(assert (=> b!174414 (= e!115176 (ite c!31220 (t!7013 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (ite c!31222 (Cons!2202 (h!2819 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (t!7013 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))) Nil!2203)))))

(declare-fun b!174415 () Bool)

(declare-fun res!82732 () Bool)

(declare-fun e!115177 () Bool)

(assert (=> b!174415 (=> (not res!82732) (not e!115177))))

(declare-fun lt!86310 () List!2206)

(assert (=> b!174415 (= res!82732 (containsKey!189 lt!86310 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174416 () Bool)

(declare-fun e!115174 () List!2206)

(assert (=> b!174416 (= e!115174 call!17668)))

(declare-fun b!174417 () Bool)

(assert (=> b!174417 (= c!31222 (and ((_ is Cons!2202) (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (bvsgt (_1!1631 (h!2819 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!115175 () List!2206)

(declare-fun e!115173 () List!2206)

(assert (=> b!174417 (= e!115175 e!115173)))

(declare-fun b!174418 () Bool)

(declare-fun call!17669 () List!2206)

(assert (=> b!174418 (= e!115173 call!17669)))

(declare-fun b!174419 () Bool)

(assert (=> b!174419 (= e!115173 call!17669)))

(declare-fun b!174420 () Bool)

(assert (=> b!174420 (= e!115174 e!115175)))

(assert (=> b!174420 (= c!31220 (and ((_ is Cons!2202) (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (= (_1!1631 (h!2819 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun bm!17665 () Bool)

(declare-fun c!31219 () Bool)

(assert (=> bm!17665 (= call!17668 ($colon$colon!98 e!115176 (ite c!31219 (h!2819 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31221 () Bool)

(assert (=> bm!17665 (= c!31221 c!31219)))

(declare-fun d!53259 () Bool)

(assert (=> d!53259 e!115177))

(declare-fun res!82733 () Bool)

(assert (=> d!53259 (=> (not res!82733) (not e!115177))))

(assert (=> d!53259 (= res!82733 (isStrictlySorted!332 lt!86310))))

(assert (=> d!53259 (= lt!86310 e!115174)))

(assert (=> d!53259 (= c!31219 (and ((_ is Cons!2202) (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (bvslt (_1!1631 (h!2819 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53259 (isStrictlySorted!332 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))))))

(assert (=> d!53259 (= (insertStrictlySorted!101 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248)))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86310)))

(declare-fun bm!17667 () Bool)

(assert (=> bm!17667 (= call!17669 call!17670)))

(declare-fun b!174421 () Bool)

(assert (=> b!174421 (= e!115175 call!17670)))

(declare-fun b!174422 () Bool)

(assert (=> b!174422 (= e!115176 (insertStrictlySorted!101 (t!7013 (t!7013 (toList!1099 (getCurrentListMap!751 (_keys!5439 thiss!1248) (_values!3581 thiss!1248) (mask!8470 thiss!1248) (extraKeys!3337 thiss!1248) (zeroValue!3439 thiss!1248) (minValue!3441 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3598 thiss!1248))))) (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174423 () Bool)

(assert (=> b!174423 (= e!115177 (contains!1155 lt!86310 (tuple2!3241 (_1!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1631 (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53259 c!31219) b!174416))

(assert (= (and d!53259 (not c!31219)) b!174420))

(assert (= (and b!174420 c!31220) b!174421))

(assert (= (and b!174420 (not c!31220)) b!174417))

(assert (= (and b!174417 c!31222) b!174418))

(assert (= (and b!174417 (not c!31222)) b!174419))

(assert (= (or b!174418 b!174419) bm!17667))

(assert (= (or b!174421 bm!17667) bm!17666))

(assert (= (or b!174416 bm!17666) bm!17665))

(assert (= (and bm!17665 c!31221) b!174422))

(assert (= (and bm!17665 (not c!31221)) b!174414))

(assert (= (and d!53259 res!82733) b!174415))

(assert (= (and b!174415 res!82732) b!174423))

(declare-fun m!203481 () Bool)

(assert (=> b!174423 m!203481))

(declare-fun m!203483 () Bool)

(assert (=> bm!17665 m!203483))

(declare-fun m!203485 () Bool)

(assert (=> b!174422 m!203485))

(declare-fun m!203487 () Bool)

(assert (=> b!174415 m!203487))

(declare-fun m!203489 () Bool)

(assert (=> d!53259 m!203489))

(assert (=> d!53259 m!203351))

(assert (=> b!173575 d!53259))

(declare-fun d!53261 () Bool)

(declare-fun lt!86311 () Bool)

(assert (=> d!53261 (= lt!86311 (select (content!149 (toList!1099 lt!85998)) (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun e!115179 () Bool)

(assert (=> d!53261 (= lt!86311 e!115179)))

(declare-fun res!82735 () Bool)

(assert (=> d!53261 (=> (not res!82735) (not e!115179))))

(assert (=> d!53261 (= res!82735 ((_ is Cons!2202) (toList!1099 lt!85998)))))

(assert (=> d!53261 (= (contains!1155 (toList!1099 lt!85998) (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))) lt!86311)))

(declare-fun b!174424 () Bool)

(declare-fun e!115178 () Bool)

(assert (=> b!174424 (= e!115179 e!115178)))

(declare-fun res!82734 () Bool)

(assert (=> b!174424 (=> res!82734 e!115178)))

(assert (=> b!174424 (= res!82734 (= (h!2819 (toList!1099 lt!85998)) (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(declare-fun b!174425 () Bool)

(assert (=> b!174425 (= e!115178 (contains!1155 (t!7013 (toList!1099 lt!85998)) (ite (or c!30909 c!30912) (tuple2!3241 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3439 thiss!1248)) (tuple2!3241 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3441 thiss!1248)))))))

(assert (= (and d!53261 res!82735) b!174424))

(assert (= (and b!174424 (not res!82734)) b!174425))

(declare-fun m!203491 () Bool)

(assert (=> d!53261 m!203491))

(declare-fun m!203493 () Bool)

(assert (=> d!53261 m!203493))

(declare-fun m!203495 () Bool)

(assert (=> b!174425 m!203495))

(assert (=> b!173698 d!53261))

(declare-fun bm!17668 () Bool)

(declare-fun call!17671 () (_ BitVec 32))

(assert (=> bm!17668 (= call!17671 (arrayCountValidKeys!0 (_keys!5439 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))))))

(declare-fun b!174426 () Bool)

(declare-fun e!115181 () (_ BitVec 32))

(declare-fun e!115180 () (_ BitVec 32))

(assert (=> b!174426 (= e!115181 e!115180)))

(declare-fun c!31224 () Bool)

(assert (=> b!174426 (= c!31224 (validKeyInArray!0 (select (arr!3467 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174427 () Bool)

(assert (=> b!174427 (= e!115181 #b00000000000000000000000000000000)))

(declare-fun d!53263 () Bool)

(declare-fun lt!86312 () (_ BitVec 32))

(assert (=> d!53263 (and (bvsge lt!86312 #b00000000000000000000000000000000) (bvsle lt!86312 (bvsub (size!3766 (_keys!5439 lt!85729)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!53263 (= lt!86312 e!115181)))

(declare-fun c!31223 () Bool)

(assert (=> d!53263 (= c!31223 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!53263 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3766 (_keys!5439 lt!85729)) (size!3766 (_keys!5439 lt!85729))))))

(assert (=> d!53263 (= (arrayCountValidKeys!0 (_keys!5439 lt!85729) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3766 (_keys!5439 lt!85729))) lt!86312)))

(declare-fun b!174428 () Bool)

(assert (=> b!174428 (= e!115180 (bvadd #b00000000000000000000000000000001 call!17671))))

(declare-fun b!174429 () Bool)

(assert (=> b!174429 (= e!115180 call!17671)))

(assert (= (and d!53263 c!31223) b!174427))

(assert (= (and d!53263 (not c!31223)) b!174426))

(assert (= (and b!174426 c!31224) b!174428))

(assert (= (and b!174426 (not c!31224)) b!174429))

(assert (= (or b!174428 b!174429) bm!17668))

(declare-fun m!203497 () Bool)

(assert (=> bm!17668 m!203497))

(assert (=> b!174426 m!202739))

(assert (=> b!174426 m!202739))

(assert (=> b!174426 m!202743))

(assert (=> bm!17609 d!53263))

(assert (=> d!52699 d!52715))

(assert (=> d!52699 d!52703))

(declare-fun d!53265 () Bool)

(assert (=> d!53265 (= (apply!130 (+!246 lt!85826 (tuple2!3241 lt!85836 v!309)) lt!85830) (apply!130 lt!85826 lt!85830))))

(assert (=> d!53265 true))

(declare-fun _$34!1060 () Unit!5314)

(assert (=> d!53265 (= (choose!929 lt!85826 lt!85836 v!309 lt!85830) _$34!1060)))

(declare-fun bs!7209 () Bool)

(assert (= bs!7209 d!53265))

(assert (=> bs!7209 m!201819))

(assert (=> bs!7209 m!201819))

(assert (=> bs!7209 m!201821))

(assert (=> bs!7209 m!201817))

(assert (=> d!52699 d!53265))

(declare-fun d!53267 () Bool)

(declare-fun e!115182 () Bool)

(assert (=> d!53267 e!115182))

(declare-fun res!82736 () Bool)

(assert (=> d!53267 (=> res!82736 e!115182)))

(declare-fun lt!86313 () Bool)

(assert (=> d!53267 (= res!82736 (not lt!86313))))

(declare-fun lt!86315 () Bool)

(assert (=> d!53267 (= lt!86313 lt!86315)))

(declare-fun lt!86316 () Unit!5314)

(declare-fun e!115183 () Unit!5314)

(assert (=> d!53267 (= lt!86316 e!115183)))

(declare-fun c!31225 () Bool)

(assert (=> d!53267 (= c!31225 lt!86315)))

(assert (=> d!53267 (= lt!86315 (containsKey!189 (toList!1099 lt!85826) lt!85830))))

(assert (=> d!53267 (= (contains!1154 lt!85826 lt!85830) lt!86313)))

(declare-fun b!174430 () Bool)

(declare-fun lt!86314 () Unit!5314)

(assert (=> b!174430 (= e!115183 lt!86314)))

(assert (=> b!174430 (= lt!86314 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85826) lt!85830))))

(assert (=> b!174430 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85826) lt!85830))))

(declare-fun b!174431 () Bool)

(declare-fun Unit!5363 () Unit!5314)

(assert (=> b!174431 (= e!115183 Unit!5363)))

(declare-fun b!174432 () Bool)

(assert (=> b!174432 (= e!115182 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85826) lt!85830)))))

(assert (= (and d!53267 c!31225) b!174430))

(assert (= (and d!53267 (not c!31225)) b!174431))

(assert (= (and d!53267 (not res!82736)) b!174432))

(declare-fun m!203499 () Bool)

(assert (=> d!53267 m!203499))

(declare-fun m!203501 () Bool)

(assert (=> b!174430 m!203501))

(assert (=> b!174430 m!202159))

(assert (=> b!174430 m!202159))

(declare-fun m!203503 () Bool)

(assert (=> b!174430 m!203503))

(assert (=> b!174432 m!202159))

(assert (=> b!174432 m!202159))

(assert (=> b!174432 m!203503))

(assert (=> d!52699 d!53267))

(assert (=> d!52699 d!52709))

(assert (=> b!173520 d!52997))

(assert (=> b!173520 d!52945))

(declare-fun d!53269 () Bool)

(assert (=> d!53269 (isDefined!138 (getValueByKey!185 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun lt!86317 () Unit!5314)

(assert (=> d!53269 (= lt!86317 (choose!932 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))))))

(declare-fun e!115184 () Bool)

(assert (=> d!53269 e!115184))

(declare-fun res!82737 () Bool)

(assert (=> d!53269 (=> (not res!82737) (not e!115184))))

(assert (=> d!53269 (= res!82737 (isStrictlySorted!332 (toList!1099 lt!85855)))))

(assert (=> d!53269 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))) lt!86317)))

(declare-fun b!174433 () Bool)

(assert (=> b!174433 (= e!115184 (containsKey!189 (toList!1099 lt!85855) (_1!1631 (tuple2!3241 key!828 v!309))))))

(assert (= (and d!53269 res!82737) b!174433))

(assert (=> d!53269 m!201867))

(assert (=> d!53269 m!201867))

(assert (=> d!53269 m!202243))

(declare-fun m!203505 () Bool)

(assert (=> d!53269 m!203505))

(declare-fun m!203507 () Bool)

(assert (=> d!53269 m!203507))

(assert (=> b!174433 m!202239))

(assert (=> b!173664 d!53269))

(assert (=> b!173664 d!53019))

(assert (=> b!173664 d!52677))

(assert (=> b!173719 d!52865))

(declare-fun d!53271 () Bool)

(assert (=> d!53271 (= (get!1969 (getValueByKey!185 (toList!1099 lt!85834) lt!85828)) (v!3956 (getValueByKey!185 (toList!1099 lt!85834) lt!85828)))))

(assert (=> d!52707 d!53271))

(declare-fun b!174434 () Bool)

(declare-fun e!115185 () Option!191)

(assert (=> b!174434 (= e!115185 (Some!190 (_2!1631 (h!2819 (toList!1099 lt!85834)))))))

(declare-fun b!174437 () Bool)

(declare-fun e!115186 () Option!191)

(assert (=> b!174437 (= e!115186 None!189)))

(declare-fun b!174435 () Bool)

(assert (=> b!174435 (= e!115185 e!115186)))

(declare-fun c!31227 () Bool)

(assert (=> b!174435 (= c!31227 (and ((_ is Cons!2202) (toList!1099 lt!85834)) (not (= (_1!1631 (h!2819 (toList!1099 lt!85834))) lt!85828))))))

(declare-fun b!174436 () Bool)

(assert (=> b!174436 (= e!115186 (getValueByKey!185 (t!7013 (toList!1099 lt!85834)) lt!85828))))

(declare-fun d!53273 () Bool)

(declare-fun c!31226 () Bool)

(assert (=> d!53273 (= c!31226 (and ((_ is Cons!2202) (toList!1099 lt!85834)) (= (_1!1631 (h!2819 (toList!1099 lt!85834))) lt!85828)))))

(assert (=> d!53273 (= (getValueByKey!185 (toList!1099 lt!85834) lt!85828) e!115185)))

(assert (= (and d!53273 c!31226) b!174434))

(assert (= (and d!53273 (not c!31226)) b!174435))

(assert (= (and b!174435 c!31227) b!174436))

(assert (= (and b!174435 (not c!31227)) b!174437))

(declare-fun m!203509 () Bool)

(assert (=> b!174436 m!203509))

(assert (=> d!52707 d!53273))

(declare-fun mapIsEmpty!6959 () Bool)

(declare-fun mapRes!6959 () Bool)

(assert (=> mapIsEmpty!6959 mapRes!6959))

(declare-fun mapNonEmpty!6959 () Bool)

(declare-fun tp!15608 () Bool)

(declare-fun e!115187 () Bool)

(assert (=> mapNonEmpty!6959 (= mapRes!6959 (and tp!15608 e!115187))))

(declare-fun mapValue!6959 () ValueCell!1698)

(declare-fun mapRest!6959 () (Array (_ BitVec 32) ValueCell!1698))

(declare-fun mapKey!6959 () (_ BitVec 32))

(assert (=> mapNonEmpty!6959 (= mapRest!6958 (store mapRest!6959 mapKey!6959 mapValue!6959))))

(declare-fun b!174439 () Bool)

(declare-fun e!115188 () Bool)

(assert (=> b!174439 (= e!115188 tp_is_empty!4083)))

(declare-fun b!174438 () Bool)

(assert (=> b!174438 (= e!115187 tp_is_empty!4083)))

(declare-fun condMapEmpty!6959 () Bool)

(declare-fun mapDefault!6959 () ValueCell!1698)

(assert (=> mapNonEmpty!6958 (= condMapEmpty!6959 (= mapRest!6958 ((as const (Array (_ BitVec 32) ValueCell!1698)) mapDefault!6959)))))

(assert (=> mapNonEmpty!6958 (= tp!15607 (and e!115188 mapRes!6959))))

(assert (= (and mapNonEmpty!6958 condMapEmpty!6959) mapIsEmpty!6959))

(assert (= (and mapNonEmpty!6958 (not condMapEmpty!6959)) mapNonEmpty!6959))

(assert (= (and mapNonEmpty!6959 ((_ is ValueCellFull!1698) mapValue!6959)) b!174438))

(assert (= (and mapNonEmpty!6958 ((_ is ValueCellFull!1698) mapDefault!6959)) b!174439))

(declare-fun m!203511 () Bool)

(assert (=> mapNonEmpty!6959 m!203511))

(declare-fun b_lambda!6973 () Bool)

(assert (= b_lambda!6965 (or (and b!173294 b_free!4311) b_lambda!6973)))

(declare-fun b_lambda!6975 () Bool)

(assert (= b_lambda!6961 (or (and b!173294 b_free!4311) b_lambda!6975)))

(declare-fun b_lambda!6977 () Bool)

(assert (= b_lambda!6967 (or (and b!173294 b_free!4311) b_lambda!6977)))

(declare-fun b_lambda!6979 () Bool)

(assert (= b_lambda!6963 (or (and b!173294 b_free!4311) b_lambda!6979)))

(declare-fun b_lambda!6981 () Bool)

(assert (= b_lambda!6951 (or (and b!173294 b_free!4311 (= (defaultEntry!3598 thiss!1248) (defaultEntry!3598 lt!85729))) b_lambda!6981)))

(check-sat (not b!174177) (not b!173793) (not b!174150) (not b!174402) (not bm!17646) (not b_lambda!6969) (not b!174319) (not d!52837) (not b!174091) (not b!173945) (not b!174128) (not b!174016) (not d!52929) (not bm!17639) (not b!173942) (not d!52833) (not d!53253) (not d!52863) (not b!174209) (not b!174112) (not d!52847) (not b!174135) (not d!53157) (not d!52965) (not b!174344) (not d!53249) (not b!174094) (not b!174299) (not b!174195) (not d!53075) (not b!174210) (not d!52959) (not d!53151) (not b!174262) (not d!53243) (not d!53007) (not b!174120) (not b!174187) (not d!53029) (not d!52939) (not b!174111) (not b!174214) (not b!174075) (not d!53259) (not b!174276) (not b!174203) (not d!52839) (not d!52893) (not d!53199) (not b!173964) (not b!174138) (not b!173985) (not b!174396) (not bm!17665) (not d!52845) (not b!173883) (not b!174165) (not b!174220) (not b!174279) (not b_lambda!6941) (not b!173977) (not b!174287) (not d!52915) (not bm!17642) (not b_lambda!6975) (not b!173798) (not b!173820) (not b!174292) (not b!174398) (not b!174425) (not b!174403) (not b!174114) (not b!174060) (not b!174145) (not d!53095) (not d!52767) (not b!173907) (not b!173774) (not d!52957) (not b!174265) (not b!174013) (not d!53121) (not d!53269) (not b!174014) (not d!52871) (not d!52835) (not b!173810) (not b!174399) (not bm!17622) (not b!174281) (not b!173753) (not d!53247) (not b!174404) (not d!52857) (not d!53063) (not b!174349) (not b!174162) (not d!52889) (not b!173949) (not d!52947) (not b!174310) (not b_lambda!6971) (not b!174426) (not d!52809) (not b!174375) (not b!174131) (not bm!17649) (not b!174275) (not b!173776) (not d!52815) (not d!53039) (not b!173866) (not b!173767) (not b!174027) (not d!52901) (not d!52935) (not b!174207) (not bm!17656) (not d!53011) (not b!174282) (not b!174296) (not b!174217) (not b!173863) (not b!173974) (not b!173901) (not d!53107) (not d!53161) (not d!53067) (not d!53181) (not b!174212) (not b!173884) (not b!173782) (not b!174190) (not d!53047) (not b!173916) (not b!174376) (not d!52921) (not b_lambda!6957) (not bm!17659) (not b!174329) (not d!52883) (not b!174379) (not b!174025) (not b!173996) (not b!173792) (not d!52879) (not bm!17618) (not d!53109) (not b!174089) (not b!173828) (not b!174290) (not b!174317) (not b!174147) (not b!173846) (not bm!17660) (not d!53245) (not b!173852) (not b!174413) (not b!174243) (not b!174180) (not b!174153) (not b!174102) (not b!173957) (not b_lambda!6977) (not b!174391) (not bm!17662) (not bm!17633) (not b!173751) (not b!174079) (not d!53117) (not b!173799) (not mapNonEmpty!6959) (not b!173935) (not b!174377) (not d!53191) (not b!174347) (not b!173836) (not b!173826) (not b_lambda!6973) (not bm!17625) (not b!174333) (not d!53085) (not b!174436) (not b!174006) (not b!174255) (not d!52917) (not d!53219) (not d!52913) (not b!174388) (not b!174357) (not bm!17643) (not b!174432) (not d!52875) (not d!53233) (not b!174327) (not b!173779) (not b!174301) (not b!173829) (not d!53257) (not d!52823) (not d!52775) (not b!173868) (not d!53101) (not b!174336) (not b!174004) (not d!52925) (not b!174363) (not d!53065) (not b!173983) (not d!53089) (not b!173912) (not d!53207) (not b!173978) (not b!173874) (not d!53009) (not d!53061) (not b!174157) (not b!173965) (not d!52817) (not d!52841) (not b!174185) (not b!174143) (not b!174365) (not b!174291) (not b!173988) (not b!173969) (not b!174033) (not b!174433) (not b!173923) (not b!174118) (not d!53155) (not b!174184) (not b!174192) (not d!53267) (not b!174257) (not b!173871) (not b!174254) (not d!52909) (not b!173813) (not b!173854) (not d!52975) (not b!174065) b_and!10779 (not b!173796) (not b!173856) (not b!173999) (not d!52773) (not b!174140) (not b!173968) (not d!53221) (not d!52873) (not b!174360) (not b!173772) (not b!174232) (not b!173980) (not d!53197) (not d!53129) (not b!173789) (not b!174381) (not b!173887) (not bm!17631) (not d!53127) (not b!174411) (not b!174415) (not b!174284) (not d!52999) (not d!53145) (not b_next!4311) (not b!173837) (not d!53133) (not b!173754) (not b!174409) (not b!174247) (not b_lambda!6981) (not b!173865) (not b!173764) (not b!174127) (not b!174037) (not b!174117) (not d!53171) (not d!53261) (not b!174278) (not b!173876) (not b!174303) (not d!53139) (not d!53153) (not b!173918) (not b_lambda!6959) (not d!53135) (not b!174313) (not b!173746) (not b!173873) (not b!174387) (not b!174423) (not b!173827) (not b!174024) (not b!174206) (not d!52867) (not b!173808) (not b!173995) (not b!174011) (not bm!17628) (not b!173898) (not d!52881) (not b!173936) (not b!173785) (not b!174168) (not b!174086) (not b!173862) (not b!173843) (not b!174295) (not b!174008) (not b!173849) (not b!174029) (not b!174293) (not b!174345) (not b!174115) (not b!174222) (not b!174082) (not d!53125) (not d!53255) (not d!53071) (not b!173905) (not b!173973) (not d!52783) (not bm!17621) (not d!53131) (not d!53027) (not b!174077) (not b!174297) (not b!174384) (not d!53003) (not b!174233) (not b!173909) (not b_lambda!6953) (not bm!17655) (not d!52969) (not b!174068) (not d!53091) (not b!174101) (not b!174225) (not d!53033) (not b!173858) (not b!174430) (not d!53099) (not d!53077) (not b!173795) (not b!174202) (not d!53087) (not b!174325) tp_is_empty!4083 (not b!173928) (not b!173955) (not b!174358) (not d!52785) (not bm!17632) (not d!53079) (not b!173840) (not d!53057) (not b!174178) (not bm!17668) (not d!53143) (not b!173885) (not b!173926) (not b!173920) (not b!174160) (not b!174170) (not b!174339) (not b!173952) (not b!174092) (not b!173890) (not bm!17652) (not d!53123) (not b!174355) (not b!173967) (not b!174071) (not d!53265) (not b!174104) (not b!174084) (not b!174306) (not d!53081) (not b!174213) (not b!173947) (not d!52991) (not b_lambda!6955) (not d!53013) (not b!174342) (not b!174044) (not b!174352) (not b!173763) (not d!52967) (not b!174288) (not b!174223) (not b!173986) (not b!174315) (not b!173804) (not bm!17636) (not d!52941) (not b!173831) (not b!173860) (not b!174354) (not d!52979) (not b!174272) (not b!173972) (not d!52769) (not d!53239) (not b!174368) (not d!53137) (not b!173893) (not b!174001) (not b!174394) (not d!52859) (not b!174285) (not b!174389) (not b!174401) (not b!173802) (not d!53241) (not b!174273) (not b!174106) (not d!52961) (not b!174340) (not b!173770) (not b!174260) (not b!174351) (not b!174366) (not bm!17661) (not b!174405) (not d!53213) (not d!52869) (not d!53093) (not d!52851) (not b!173748) (not b!174322) (not b!174204) (not d!53149) (not d!53019) (not b!173801) (not d!53217) (not d!53183) (not d!53227) (not b!174193) (not b!173925) (not b!173756) (not b!174244) (not d!52949) (not b!173806) (not b!174386) (not d!52995) (not d!52927) (not d!52887) (not b!174023) (not b!174215) (not b!174182) (not d!52953) (not d!53141) (not b_lambda!6939) (not b!173954) (not b_lambda!6979) (not d!53209) (not d!53015) (not b!174030) (not b!174109) (not d!53055) (not d!53231) (not b!174167) (not b!174263) (not b!174331) (not b!173896) (not b!173823) (not d!53205) (not d!53051) (not b!174108) (not d!53025) (not b!174238) (not d!53147) (not b!174412) (not d!52997) (not b!173894) (not b!174422) (not b!174236))
(check-sat b_and!10779 (not b_next!4311))
