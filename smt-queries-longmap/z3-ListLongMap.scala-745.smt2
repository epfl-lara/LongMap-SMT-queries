; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17288 () Bool)

(assert start!17288)

(declare-fun b!173312 () Bool)

(declare-fun b_free!4309 () Bool)

(declare-fun b_next!4309 () Bool)

(assert (=> b!173312 (= b_free!4309 (not b_next!4309))))

(declare-fun tp!15590 () Bool)

(declare-fun b_and!10763 () Bool)

(assert (=> b!173312 (= tp!15590 b_and!10763)))

(declare-fun mapNonEmpty!6948 () Bool)

(declare-fun mapRes!6948 () Bool)

(declare-fun tp!15591 () Bool)

(declare-fun e!114476 () Bool)

(assert (=> mapNonEmpty!6948 (= mapRes!6948 (and tp!15591 e!114476))))

(declare-datatypes ((V!5089 0))(
  ( (V!5090 (val!2085 Int)) )
))
(declare-datatypes ((ValueCell!1697 0))(
  ( (ValueCellFull!1697 (v!3954 V!5089)) (EmptyCell!1697) )
))
(declare-fun mapRest!6948 () (Array (_ BitVec 32) ValueCell!1697))

(declare-fun mapKey!6948 () (_ BitVec 32))

(declare-fun mapValue!6948 () ValueCell!1697)

(declare-datatypes ((array!7279 0))(
  ( (array!7280 (arr!3458 (Array (_ BitVec 32) (_ BitVec 64))) (size!3757 (_ BitVec 32))) )
))
(declare-datatypes ((array!7281 0))(
  ( (array!7282 (arr!3459 (Array (_ BitVec 32) ValueCell!1697)) (size!3758 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2302 0))(
  ( (LongMapFixedSize!2303 (defaultEntry!3597 Int) (mask!8469 (_ BitVec 32)) (extraKeys!3336 (_ BitVec 32)) (zeroValue!3438 V!5089) (minValue!3440 V!5089) (_size!1200 (_ BitVec 32)) (_keys!5438 array!7279) (_values!3580 array!7281) (_vacant!1200 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2302)

(assert (=> mapNonEmpty!6948 (= (arr!3459 (_values!3580 thiss!1248)) (store mapRest!6948 mapKey!6948 mapValue!6948))))

(declare-fun tp_is_empty!4081 () Bool)

(declare-fun e!114475 () Bool)

(declare-fun e!114482 () Bool)

(declare-fun array_inv!2229 (array!7279) Bool)

(declare-fun array_inv!2230 (array!7281) Bool)

(assert (=> b!173312 (= e!114482 (and tp!15590 tp_is_empty!4081 (array_inv!2229 (_keys!5438 thiss!1248)) (array_inv!2230 (_values!3580 thiss!1248)) e!114475))))

(declare-fun b!173313 () Bool)

(declare-fun e!114481 () Bool)

(declare-fun e!114477 () Bool)

(assert (=> b!173313 (= e!114481 e!114477)))

(declare-fun res!82295 () Bool)

(assert (=> b!173313 (=> (not res!82295) (not e!114477))))

(declare-datatypes ((tuple2!3202 0))(
  ( (tuple2!3203 (_1!1612 (_ BitVec 64)) (_2!1612 V!5089)) )
))
(declare-datatypes ((List!2188 0))(
  ( (Nil!2185) (Cons!2184 (h!2801 tuple2!3202) (t!6987 List!2188)) )
))
(declare-datatypes ((ListLongMap!2135 0))(
  ( (ListLongMap!2136 (toList!1083 List!2188)) )
))
(declare-fun lt!85777 () ListLongMap!2135)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1149 (ListLongMap!2135 (_ BitVec 64)) Bool)

(assert (=> b!173313 (= res!82295 (contains!1149 lt!85777 key!828))))

(declare-fun lt!85779 () LongMapFixedSize!2302)

(declare-fun map!1874 (LongMapFixedSize!2302) ListLongMap!2135)

(assert (=> b!173313 (= lt!85777 (map!1874 lt!85779))))

(declare-fun b!173314 () Bool)

(declare-fun res!82294 () Bool)

(declare-fun e!114480 () Bool)

(assert (=> b!173314 (=> (not res!82294) (not e!114480))))

(assert (=> b!173314 (= res!82294 (and (= key!828 (bvneg key!828)) (not (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173315 () Bool)

(assert (=> b!173315 (= e!114480 (not e!114481))))

(declare-fun res!82296 () Bool)

(assert (=> b!173315 (=> (not res!82296) (not e!114481))))

(declare-fun valid!988 (LongMapFixedSize!2302) Bool)

(assert (=> b!173315 (= res!82296 (valid!988 lt!85779))))

(declare-fun v!309 () V!5089)

(assert (=> b!173315 (= lt!85779 (LongMapFixedSize!2303 (defaultEntry!3597 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (_size!1200 thiss!1248) (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (_vacant!1200 thiss!1248)))))

(declare-fun +!245 (ListLongMap!2135 tuple2!3202) ListLongMap!2135)

(declare-fun getCurrentListMap!739 (array!7279 array!7281 (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 (_ BitVec 32) Int) ListLongMap!2135)

(assert (=> b!173315 (= (+!245 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-datatypes ((Unit!5315 0))(
  ( (Unit!5316) )
))
(declare-fun lt!85778 () Unit!5315)

(declare-fun lemmaChangeLongMinValueKeyThenAddPairToListMap!83 (array!7279 array!7281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 V!5089 Int) Unit!5315)

(assert (=> b!173315 (= lt!85778 (lemmaChangeLongMinValueKeyThenAddPairToListMap!83 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173316 () Bool)

(assert (=> b!173316 (= e!114476 tp_is_empty!4081)))

(declare-fun b!173317 () Bool)

(declare-fun e!114479 () Bool)

(assert (=> b!173317 (= e!114475 (and e!114479 mapRes!6948))))

(declare-fun condMapEmpty!6948 () Bool)

(declare-fun mapDefault!6948 () ValueCell!1697)

(assert (=> b!173317 (= condMapEmpty!6948 (= (arr!3459 (_values!3580 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6948)))))

(declare-fun b!173318 () Bool)

(assert (=> b!173318 (= e!114479 tp_is_empty!4081)))

(declare-fun res!82293 () Bool)

(assert (=> start!17288 (=> (not res!82293) (not e!114480))))

(assert (=> start!17288 (= res!82293 (valid!988 thiss!1248))))

(assert (=> start!17288 e!114480))

(assert (=> start!17288 e!114482))

(assert (=> start!17288 true))

(assert (=> start!17288 tp_is_empty!4081))

(declare-fun b!173319 () Bool)

(assert (=> b!173319 (= e!114477 (= lt!85777 (+!245 (map!1874 thiss!1248) (tuple2!3203 key!828 v!309))))))

(declare-fun mapIsEmpty!6948 () Bool)

(assert (=> mapIsEmpty!6948 mapRes!6948))

(assert (= (and start!17288 res!82293) b!173314))

(assert (= (and b!173314 res!82294) b!173315))

(assert (= (and b!173315 res!82296) b!173313))

(assert (= (and b!173313 res!82295) b!173319))

(assert (= (and b!173317 condMapEmpty!6948) mapIsEmpty!6948))

(assert (= (and b!173317 (not condMapEmpty!6948)) mapNonEmpty!6948))

(get-info :version)

(assert (= (and mapNonEmpty!6948 ((_ is ValueCellFull!1697) mapValue!6948)) b!173316))

(assert (= (and b!173317 ((_ is ValueCellFull!1697) mapDefault!6948)) b!173318))

(assert (= b!173312 b!173317))

(assert (= start!17288 b!173312))

(declare-fun m!201815 () Bool)

(assert (=> start!17288 m!201815))

(declare-fun m!201817 () Bool)

(assert (=> b!173312 m!201817))

(declare-fun m!201819 () Bool)

(assert (=> b!173312 m!201819))

(declare-fun m!201821 () Bool)

(assert (=> b!173313 m!201821))

(declare-fun m!201823 () Bool)

(assert (=> b!173313 m!201823))

(declare-fun m!201825 () Bool)

(assert (=> b!173315 m!201825))

(declare-fun m!201827 () Bool)

(assert (=> b!173315 m!201827))

(declare-fun m!201829 () Bool)

(assert (=> b!173315 m!201829))

(declare-fun m!201831 () Bool)

(assert (=> b!173315 m!201831))

(assert (=> b!173315 m!201825))

(declare-fun m!201833 () Bool)

(assert (=> b!173315 m!201833))

(declare-fun m!201835 () Bool)

(assert (=> mapNonEmpty!6948 m!201835))

(declare-fun m!201837 () Bool)

(assert (=> b!173319 m!201837))

(assert (=> b!173319 m!201837))

(declare-fun m!201839 () Bool)

(assert (=> b!173319 m!201839))

(check-sat (not b!173312) (not b_next!4309) (not mapNonEmpty!6948) (not b!173313) b_and!10763 (not b!173315) (not start!17288) tp_is_empty!4081 (not b!173319))
(check-sat b_and!10763 (not b_next!4309))
(get-model)

(declare-fun d!52663 () Bool)

(assert (=> d!52663 (= (+!245 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85800 () Unit!5315)

(declare-fun choose!935 (array!7279 array!7281 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 V!5089 Int) Unit!5315)

(assert (=> d!52663 (= lt!85800 (choose!935 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!52663 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!52663 (= (lemmaChangeLongMinValueKeyThenAddPairToListMap!83 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)) lt!85800)))

(declare-fun bs!7167 () Bool)

(assert (= bs!7167 d!52663))

(declare-fun m!201893 () Bool)

(assert (=> bs!7167 m!201893))

(assert (=> bs!7167 m!201831))

(declare-fun m!201895 () Bool)

(assert (=> bs!7167 m!201895))

(assert (=> bs!7167 m!201825))

(assert (=> bs!7167 m!201825))

(assert (=> bs!7167 m!201827))

(assert (=> b!173315 d!52663))

(declare-fun d!52665 () Bool)

(declare-fun res!82327 () Bool)

(declare-fun e!114533 () Bool)

(assert (=> d!52665 (=> (not res!82327) (not e!114533))))

(declare-fun simpleValid!144 (LongMapFixedSize!2302) Bool)

(assert (=> d!52665 (= res!82327 (simpleValid!144 lt!85779))))

(assert (=> d!52665 (= (valid!988 lt!85779) e!114533)))

(declare-fun b!173374 () Bool)

(declare-fun res!82328 () Bool)

(assert (=> b!173374 (=> (not res!82328) (not e!114533))))

(declare-fun arrayCountValidKeys!0 (array!7279 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!173374 (= res!82328 (= (arrayCountValidKeys!0 (_keys!5438 lt!85779) #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))) (_size!1200 lt!85779)))))

(declare-fun b!173375 () Bool)

(declare-fun res!82329 () Bool)

(assert (=> b!173375 (=> (not res!82329) (not e!114533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7279 (_ BitVec 32)) Bool)

(assert (=> b!173375 (= res!82329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5438 lt!85779) (mask!8469 lt!85779)))))

(declare-fun b!173376 () Bool)

(declare-datatypes ((List!2191 0))(
  ( (Nil!2188) (Cons!2187 (h!2804 (_ BitVec 64)) (t!6992 List!2191)) )
))
(declare-fun arrayNoDuplicates!0 (array!7279 (_ BitVec 32) List!2191) Bool)

(assert (=> b!173376 (= e!114533 (arrayNoDuplicates!0 (_keys!5438 lt!85779) #b00000000000000000000000000000000 Nil!2188))))

(assert (= (and d!52665 res!82327) b!173374))

(assert (= (and b!173374 res!82328) b!173375))

(assert (= (and b!173375 res!82329) b!173376))

(declare-fun m!201897 () Bool)

(assert (=> d!52665 m!201897))

(declare-fun m!201899 () Bool)

(assert (=> b!173374 m!201899))

(declare-fun m!201901 () Bool)

(assert (=> b!173375 m!201901))

(declare-fun m!201903 () Bool)

(assert (=> b!173376 m!201903))

(assert (=> b!173315 d!52665))

(declare-fun b!173419 () Bool)

(declare-fun e!114566 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!173419 (= e!114566 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17557 () Bool)

(declare-fun call!17563 () Bool)

(declare-fun lt!85850 () ListLongMap!2135)

(assert (=> bm!17557 (= call!17563 (contains!1149 lt!85850 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17558 () Bool)

(declare-fun call!17566 () ListLongMap!2135)

(declare-fun getCurrentListMapNoExtraKeys!161 (array!7279 array!7281 (_ BitVec 32) (_ BitVec 32) V!5089 V!5089 (_ BitVec 32) Int) ListLongMap!2135)

(assert (=> bm!17558 (= call!17566 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173420 () Bool)

(declare-fun e!114561 () Bool)

(declare-fun call!17565 () Bool)

(assert (=> b!173420 (= e!114561 (not call!17565))))

(declare-fun b!173421 () Bool)

(declare-fun e!114567 () Bool)

(declare-fun apply!130 (ListLongMap!2135 (_ BitVec 64)) V!5089)

(assert (=> b!173421 (= e!114567 (= (apply!130 lt!85850 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3438 thiss!1248)))))

(declare-fun b!173422 () Bool)

(declare-fun e!114571 () ListLongMap!2135)

(declare-fun e!114560 () ListLongMap!2135)

(assert (=> b!173422 (= e!114571 e!114560)))

(declare-fun c!30925 () Bool)

(assert (=> b!173422 (= c!30925 (and (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17559 () Bool)

(declare-fun call!17562 () ListLongMap!2135)

(declare-fun call!17560 () ListLongMap!2135)

(assert (=> bm!17559 (= call!17562 call!17560)))

(declare-fun b!173423 () Bool)

(declare-fun e!114569 () Bool)

(assert (=> b!173423 (= e!114569 (not call!17563))))

(declare-fun c!30923 () Bool)

(declare-fun bm!17560 () Bool)

(declare-fun call!17564 () ListLongMap!2135)

(assert (=> bm!17560 (= call!17564 (+!245 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)) (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173424 () Bool)

(declare-fun e!114570 () ListLongMap!2135)

(declare-fun call!17561 () ListLongMap!2135)

(assert (=> b!173424 (= e!114570 call!17561)))

(declare-fun b!173425 () Bool)

(declare-fun e!114562 () Bool)

(declare-fun e!114572 () Bool)

(assert (=> b!173425 (= e!114562 e!114572)))

(declare-fun res!82351 () Bool)

(assert (=> b!173425 (=> (not res!82351) (not e!114572))))

(assert (=> b!173425 (= res!82351 (contains!1149 lt!85850 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173425 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173426 () Bool)

(declare-fun e!114565 () Unit!5315)

(declare-fun Unit!5319 () Unit!5315)

(assert (=> b!173426 (= e!114565 Unit!5319)))

(declare-fun bm!17561 () Bool)

(assert (=> bm!17561 (= call!17565 (contains!1149 lt!85850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173427 () Bool)

(assert (=> b!173427 (= e!114560 call!17561)))

(declare-fun d!52667 () Bool)

(declare-fun e!114568 () Bool)

(assert (=> d!52667 e!114568))

(declare-fun res!82348 () Bool)

(assert (=> d!52667 (=> (not res!82348) (not e!114568))))

(assert (=> d!52667 (= res!82348 (or (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))))

(declare-fun lt!85846 () ListLongMap!2135)

(assert (=> d!52667 (= lt!85850 lt!85846)))

(declare-fun lt!85852 () Unit!5315)

(assert (=> d!52667 (= lt!85852 e!114565)))

(declare-fun c!30924 () Bool)

(assert (=> d!52667 (= c!30924 e!114566)))

(declare-fun res!82352 () Bool)

(assert (=> d!52667 (=> (not res!82352) (not e!114566))))

(assert (=> d!52667 (= res!82352 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52667 (= lt!85846 e!114571)))

(assert (=> d!52667 (= c!30923 (and (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52667 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!52667 (= (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!85850)))

(declare-fun b!173428 () Bool)

(declare-fun e!114564 () Bool)

(assert (=> b!173428 (= e!114564 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173429 () Bool)

(declare-fun res!82349 () Bool)

(assert (=> b!173429 (=> (not res!82349) (not e!114568))))

(assert (=> b!173429 (= res!82349 e!114562)))

(declare-fun res!82353 () Bool)

(assert (=> b!173429 (=> res!82353 e!114562)))

(assert (=> b!173429 (= res!82353 (not e!114564))))

(declare-fun res!82356 () Bool)

(assert (=> b!173429 (=> (not res!82356) (not e!114564))))

(assert (=> b!173429 (= res!82356 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173430 () Bool)

(assert (=> b!173430 (= e!114561 e!114567)))

(declare-fun res!82354 () Bool)

(assert (=> b!173430 (= res!82354 call!17565)))

(assert (=> b!173430 (=> (not res!82354) (not e!114567))))

(declare-fun b!173431 () Bool)

(declare-fun e!114563 () Bool)

(assert (=> b!173431 (= e!114563 (= (apply!130 lt!85850 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3440 thiss!1248)))))

(declare-fun b!173432 () Bool)

(assert (=> b!173432 (= e!114570 call!17562)))

(declare-fun b!173433 () Bool)

(declare-fun lt!85861 () Unit!5315)

(assert (=> b!173433 (= e!114565 lt!85861)))

(declare-fun lt!85845 () ListLongMap!2135)

(assert (=> b!173433 (= lt!85845 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85855 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85859 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85859 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85857 () Unit!5315)

(declare-fun addStillContains!106 (ListLongMap!2135 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5315)

(assert (=> b!173433 (= lt!85857 (addStillContains!106 lt!85845 lt!85855 (zeroValue!3438 thiss!1248) lt!85859))))

(assert (=> b!173433 (contains!1149 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) lt!85859)))

(declare-fun lt!85854 () Unit!5315)

(assert (=> b!173433 (= lt!85854 lt!85857)))

(declare-fun lt!85858 () ListLongMap!2135)

(assert (=> b!173433 (= lt!85858 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85856 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85856 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85862 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85862 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85865 () Unit!5315)

(declare-fun addApplyDifferent!106 (ListLongMap!2135 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5315)

(assert (=> b!173433 (= lt!85865 (addApplyDifferent!106 lt!85858 lt!85856 (minValue!3440 thiss!1248) lt!85862))))

(assert (=> b!173433 (= (apply!130 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) lt!85862) (apply!130 lt!85858 lt!85862))))

(declare-fun lt!85864 () Unit!5315)

(assert (=> b!173433 (= lt!85864 lt!85865)))

(declare-fun lt!85848 () ListLongMap!2135)

(assert (=> b!173433 (= lt!85848 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85853 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85847 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85847 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85851 () Unit!5315)

(assert (=> b!173433 (= lt!85851 (addApplyDifferent!106 lt!85848 lt!85853 (zeroValue!3438 thiss!1248) lt!85847))))

(assert (=> b!173433 (= (apply!130 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) lt!85847) (apply!130 lt!85848 lt!85847))))

(declare-fun lt!85866 () Unit!5315)

(assert (=> b!173433 (= lt!85866 lt!85851)))

(declare-fun lt!85860 () ListLongMap!2135)

(assert (=> b!173433 (= lt!85860 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85849 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85849 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85863 () (_ BitVec 64))

(assert (=> b!173433 (= lt!85863 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173433 (= lt!85861 (addApplyDifferent!106 lt!85860 lt!85849 (minValue!3440 thiss!1248) lt!85863))))

(assert (=> b!173433 (= (apply!130 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) lt!85863) (apply!130 lt!85860 lt!85863))))

(declare-fun b!173434 () Bool)

(assert (=> b!173434 (= e!114571 (+!245 call!17564 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(declare-fun b!173435 () Bool)

(assert (=> b!173435 (= e!114569 e!114563)))

(declare-fun res!82355 () Bool)

(assert (=> b!173435 (= res!82355 call!17563)))

(assert (=> b!173435 (=> (not res!82355) (not e!114563))))

(declare-fun b!173436 () Bool)

(declare-fun res!82350 () Bool)

(assert (=> b!173436 (=> (not res!82350) (not e!114568))))

(assert (=> b!173436 (= res!82350 e!114561)))

(declare-fun c!30927 () Bool)

(assert (=> b!173436 (= c!30927 (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173437 () Bool)

(assert (=> b!173437 (= e!114568 e!114569)))

(declare-fun c!30922 () Bool)

(assert (=> b!173437 (= c!30922 (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173438 () Bool)

(declare-fun get!1974 (ValueCell!1697 V!5089) V!5089)

(declare-fun dynLambda!473 (Int (_ BitVec 64)) V!5089)

(assert (=> b!173438 (= e!114572 (= (apply!130 lt!85850 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3758 (_values!3580 thiss!1248))))))

(assert (=> b!173438 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun bm!17562 () Bool)

(assert (=> bm!17562 (= call!17560 call!17566)))

(declare-fun bm!17563 () Bool)

(assert (=> bm!17563 (= call!17561 call!17564)))

(declare-fun b!173439 () Bool)

(declare-fun c!30926 () Bool)

(assert (=> b!173439 (= c!30926 (and (not (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!173439 (= e!114560 e!114570)))

(assert (= (and d!52667 c!30923) b!173434))

(assert (= (and d!52667 (not c!30923)) b!173422))

(assert (= (and b!173422 c!30925) b!173427))

(assert (= (and b!173422 (not c!30925)) b!173439))

(assert (= (and b!173439 c!30926) b!173424))

(assert (= (and b!173439 (not c!30926)) b!173432))

(assert (= (or b!173424 b!173432) bm!17559))

(assert (= (or b!173427 bm!17559) bm!17562))

(assert (= (or b!173427 b!173424) bm!17563))

(assert (= (or b!173434 bm!17562) bm!17558))

(assert (= (or b!173434 bm!17563) bm!17560))

(assert (= (and d!52667 res!82352) b!173419))

(assert (= (and d!52667 c!30924) b!173433))

(assert (= (and d!52667 (not c!30924)) b!173426))

(assert (= (and d!52667 res!82348) b!173429))

(assert (= (and b!173429 res!82356) b!173428))

(assert (= (and b!173429 (not res!82353)) b!173425))

(assert (= (and b!173425 res!82351) b!173438))

(assert (= (and b!173429 res!82349) b!173436))

(assert (= (and b!173436 c!30927) b!173430))

(assert (= (and b!173436 (not c!30927)) b!173420))

(assert (= (and b!173430 res!82354) b!173421))

(assert (= (or b!173430 b!173420) bm!17561))

(assert (= (and b!173436 res!82350) b!173437))

(assert (= (and b!173437 c!30922) b!173435))

(assert (= (and b!173437 (not c!30922)) b!173423))

(assert (= (and b!173435 res!82355) b!173431))

(assert (= (or b!173435 b!173423) bm!17557))

(declare-fun b_lambda!6957 () Bool)

(assert (=> (not b_lambda!6957) (not b!173438)))

(declare-fun t!6991 () Bool)

(declare-fun tb!2761 () Bool)

(assert (=> (and b!173312 (= (defaultEntry!3597 thiss!1248) (defaultEntry!3597 thiss!1248)) t!6991) tb!2761))

(declare-fun result!4577 () Bool)

(assert (=> tb!2761 (= result!4577 tp_is_empty!4081)))

(assert (=> b!173438 t!6991))

(declare-fun b_and!10769 () Bool)

(assert (= b_and!10763 (and (=> t!6991 result!4577) b_and!10769)))

(declare-fun m!201905 () Bool)

(assert (=> b!173431 m!201905))

(declare-fun m!201907 () Bool)

(assert (=> b!173434 m!201907))

(declare-fun m!201909 () Bool)

(assert (=> b!173438 m!201909))

(declare-fun m!201911 () Bool)

(assert (=> b!173438 m!201911))

(assert (=> b!173438 m!201909))

(declare-fun m!201913 () Bool)

(assert (=> b!173438 m!201913))

(declare-fun m!201915 () Bool)

(assert (=> b!173438 m!201915))

(assert (=> b!173438 m!201913))

(assert (=> b!173438 m!201915))

(declare-fun m!201917 () Bool)

(assert (=> b!173438 m!201917))

(declare-fun m!201919 () Bool)

(assert (=> b!173421 m!201919))

(declare-fun m!201921 () Bool)

(assert (=> bm!17560 m!201921))

(declare-fun m!201923 () Bool)

(assert (=> bm!17558 m!201923))

(assert (=> d!52667 m!201893))

(declare-fun m!201925 () Bool)

(assert (=> b!173433 m!201925))

(declare-fun m!201927 () Bool)

(assert (=> b!173433 m!201927))

(declare-fun m!201929 () Bool)

(assert (=> b!173433 m!201929))

(declare-fun m!201931 () Bool)

(assert (=> b!173433 m!201931))

(assert (=> b!173433 m!201923))

(declare-fun m!201933 () Bool)

(assert (=> b!173433 m!201933))

(declare-fun m!201935 () Bool)

(assert (=> b!173433 m!201935))

(assert (=> b!173433 m!201909))

(declare-fun m!201937 () Bool)

(assert (=> b!173433 m!201937))

(declare-fun m!201939 () Bool)

(assert (=> b!173433 m!201939))

(assert (=> b!173433 m!201925))

(declare-fun m!201941 () Bool)

(assert (=> b!173433 m!201941))

(declare-fun m!201943 () Bool)

(assert (=> b!173433 m!201943))

(declare-fun m!201945 () Bool)

(assert (=> b!173433 m!201945))

(assert (=> b!173433 m!201939))

(declare-fun m!201947 () Bool)

(assert (=> b!173433 m!201947))

(declare-fun m!201949 () Bool)

(assert (=> b!173433 m!201949))

(declare-fun m!201951 () Bool)

(assert (=> b!173433 m!201951))

(assert (=> b!173433 m!201945))

(declare-fun m!201953 () Bool)

(assert (=> b!173433 m!201953))

(assert (=> b!173433 m!201929))

(assert (=> b!173419 m!201909))

(assert (=> b!173419 m!201909))

(declare-fun m!201955 () Bool)

(assert (=> b!173419 m!201955))

(assert (=> b!173425 m!201909))

(assert (=> b!173425 m!201909))

(declare-fun m!201957 () Bool)

(assert (=> b!173425 m!201957))

(declare-fun m!201959 () Bool)

(assert (=> bm!17557 m!201959))

(declare-fun m!201961 () Bool)

(assert (=> bm!17561 m!201961))

(assert (=> b!173428 m!201909))

(assert (=> b!173428 m!201909))

(assert (=> b!173428 m!201955))

(assert (=> b!173315 d!52667))

(declare-fun d!52669 () Bool)

(declare-fun e!114575 () Bool)

(assert (=> d!52669 e!114575))

(declare-fun res!82362 () Bool)

(assert (=> d!52669 (=> (not res!82362) (not e!114575))))

(declare-fun lt!85878 () ListLongMap!2135)

(assert (=> d!52669 (= res!82362 (contains!1149 lt!85878 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!85877 () List!2188)

(assert (=> d!52669 (= lt!85878 (ListLongMap!2136 lt!85877))))

(declare-fun lt!85876 () Unit!5315)

(declare-fun lt!85875 () Unit!5315)

(assert (=> d!52669 (= lt!85876 lt!85875)))

(declare-datatypes ((Option!192 0))(
  ( (Some!191 (v!3957 V!5089)) (None!190) )
))
(declare-fun getValueByKey!186 (List!2188 (_ BitVec 64)) Option!192)

(assert (=> d!52669 (= (getValueByKey!186 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!99 (List!2188 (_ BitVec 64) V!5089) Unit!5315)

(assert (=> d!52669 (= lt!85875 (lemmaContainsTupThenGetReturnValue!99 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun insertStrictlySorted!102 (List!2188 (_ BitVec 64) V!5089) List!2188)

(assert (=> d!52669 (= lt!85877 (insertStrictlySorted!102 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52669 (= (+!245 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85878)))

(declare-fun b!173446 () Bool)

(declare-fun res!82361 () Bool)

(assert (=> b!173446 (=> (not res!82361) (not e!114575))))

(assert (=> b!173446 (= res!82361 (= (getValueByKey!186 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173447 () Bool)

(declare-fun contains!1151 (List!2188 tuple2!3202) Bool)

(assert (=> b!173447 (= e!114575 (contains!1151 (toList!1083 lt!85878) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52669 res!82362) b!173446))

(assert (= (and b!173446 res!82361) b!173447))

(declare-fun m!201963 () Bool)

(assert (=> d!52669 m!201963))

(declare-fun m!201965 () Bool)

(assert (=> d!52669 m!201965))

(declare-fun m!201967 () Bool)

(assert (=> d!52669 m!201967))

(declare-fun m!201969 () Bool)

(assert (=> d!52669 m!201969))

(declare-fun m!201971 () Bool)

(assert (=> b!173446 m!201971))

(declare-fun m!201973 () Bool)

(assert (=> b!173447 m!201973))

(assert (=> b!173315 d!52669))

(declare-fun b!173448 () Bool)

(declare-fun e!114582 () Bool)

(assert (=> b!173448 (= e!114582 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17564 () Bool)

(declare-fun call!17570 () Bool)

(declare-fun lt!85884 () ListLongMap!2135)

(assert (=> bm!17564 (= call!17570 (contains!1149 lt!85884 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17565 () Bool)

(declare-fun call!17573 () ListLongMap!2135)

(assert (=> bm!17565 (= call!17573 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173449 () Bool)

(declare-fun e!114577 () Bool)

(declare-fun call!17572 () Bool)

(assert (=> b!173449 (= e!114577 (not call!17572))))

(declare-fun b!173450 () Bool)

(declare-fun e!114583 () Bool)

(assert (=> b!173450 (= e!114583 (= (apply!130 lt!85884 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3438 thiss!1248)))))

(declare-fun b!173451 () Bool)

(declare-fun e!114587 () ListLongMap!2135)

(declare-fun e!114576 () ListLongMap!2135)

(assert (=> b!173451 (= e!114587 e!114576)))

(declare-fun c!30931 () Bool)

(assert (=> b!173451 (= c!30931 (and (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17566 () Bool)

(declare-fun call!17569 () ListLongMap!2135)

(declare-fun call!17567 () ListLongMap!2135)

(assert (=> bm!17566 (= call!17569 call!17567)))

(declare-fun b!173452 () Bool)

(declare-fun e!114585 () Bool)

(assert (=> b!173452 (= e!114585 (not call!17570))))

(declare-fun c!30929 () Bool)

(declare-fun bm!17567 () Bool)

(declare-fun call!17571 () ListLongMap!2135)

(assert (=> bm!17567 (= call!17571 (+!245 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)) (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173453 () Bool)

(declare-fun e!114586 () ListLongMap!2135)

(declare-fun call!17568 () ListLongMap!2135)

(assert (=> b!173453 (= e!114586 call!17568)))

(declare-fun b!173454 () Bool)

(declare-fun e!114578 () Bool)

(declare-fun e!114588 () Bool)

(assert (=> b!173454 (= e!114578 e!114588)))

(declare-fun res!82366 () Bool)

(assert (=> b!173454 (=> (not res!82366) (not e!114588))))

(assert (=> b!173454 (= res!82366 (contains!1149 lt!85884 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173454 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173455 () Bool)

(declare-fun e!114581 () Unit!5315)

(declare-fun Unit!5320 () Unit!5315)

(assert (=> b!173455 (= e!114581 Unit!5320)))

(declare-fun bm!17568 () Bool)

(assert (=> bm!17568 (= call!17572 (contains!1149 lt!85884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173456 () Bool)

(assert (=> b!173456 (= e!114576 call!17568)))

(declare-fun d!52671 () Bool)

(declare-fun e!114584 () Bool)

(assert (=> d!52671 e!114584))

(declare-fun res!82363 () Bool)

(assert (=> d!52671 (=> (not res!82363) (not e!114584))))

(assert (=> d!52671 (= res!82363 (or (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))))

(declare-fun lt!85880 () ListLongMap!2135)

(assert (=> d!52671 (= lt!85884 lt!85880)))

(declare-fun lt!85886 () Unit!5315)

(assert (=> d!52671 (= lt!85886 e!114581)))

(declare-fun c!30930 () Bool)

(assert (=> d!52671 (= c!30930 e!114582)))

(declare-fun res!82367 () Bool)

(assert (=> d!52671 (=> (not res!82367) (not e!114582))))

(assert (=> d!52671 (= res!82367 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52671 (= lt!85880 e!114587)))

(assert (=> d!52671 (= c!30929 (and (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52671 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!52671 (= (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!85884)))

(declare-fun b!173457 () Bool)

(declare-fun e!114580 () Bool)

(assert (=> b!173457 (= e!114580 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173458 () Bool)

(declare-fun res!82364 () Bool)

(assert (=> b!173458 (=> (not res!82364) (not e!114584))))

(assert (=> b!173458 (= res!82364 e!114578)))

(declare-fun res!82368 () Bool)

(assert (=> b!173458 (=> res!82368 e!114578)))

(assert (=> b!173458 (= res!82368 (not e!114580))))

(declare-fun res!82371 () Bool)

(assert (=> b!173458 (=> (not res!82371) (not e!114580))))

(assert (=> b!173458 (= res!82371 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173459 () Bool)

(assert (=> b!173459 (= e!114577 e!114583)))

(declare-fun res!82369 () Bool)

(assert (=> b!173459 (= res!82369 call!17572)))

(assert (=> b!173459 (=> (not res!82369) (not e!114583))))

(declare-fun b!173460 () Bool)

(declare-fun e!114579 () Bool)

(assert (=> b!173460 (= e!114579 (= (apply!130 lt!85884 #b1000000000000000000000000000000000000000000000000000000000000000) v!309))))

(declare-fun b!173461 () Bool)

(assert (=> b!173461 (= e!114586 call!17569)))

(declare-fun b!173462 () Bool)

(declare-fun lt!85895 () Unit!5315)

(assert (=> b!173462 (= e!114581 lt!85895)))

(declare-fun lt!85879 () ListLongMap!2135)

(assert (=> b!173462 (= lt!85879 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85889 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85893 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85893 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85891 () Unit!5315)

(assert (=> b!173462 (= lt!85891 (addStillContains!106 lt!85879 lt!85889 (zeroValue!3438 thiss!1248) lt!85893))))

(assert (=> b!173462 (contains!1149 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) lt!85893)))

(declare-fun lt!85888 () Unit!5315)

(assert (=> b!173462 (= lt!85888 lt!85891)))

(declare-fun lt!85892 () ListLongMap!2135)

(assert (=> b!173462 (= lt!85892 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85890 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85890 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85896 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85896 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85899 () Unit!5315)

(assert (=> b!173462 (= lt!85899 (addApplyDifferent!106 lt!85892 lt!85890 v!309 lt!85896))))

(assert (=> b!173462 (= (apply!130 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)) lt!85896) (apply!130 lt!85892 lt!85896))))

(declare-fun lt!85898 () Unit!5315)

(assert (=> b!173462 (= lt!85898 lt!85899)))

(declare-fun lt!85882 () ListLongMap!2135)

(assert (=> b!173462 (= lt!85882 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85887 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85881 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85881 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!85885 () Unit!5315)

(assert (=> b!173462 (= lt!85885 (addApplyDifferent!106 lt!85882 lt!85887 (zeroValue!3438 thiss!1248) lt!85881))))

(assert (=> b!173462 (= (apply!130 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) lt!85881) (apply!130 lt!85882 lt!85881))))

(declare-fun lt!85900 () Unit!5315)

(assert (=> b!173462 (= lt!85900 lt!85885)))

(declare-fun lt!85894 () ListLongMap!2135)

(assert (=> b!173462 (= lt!85894 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun lt!85883 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85883 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85897 () (_ BitVec 64))

(assert (=> b!173462 (= lt!85897 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173462 (= lt!85895 (addApplyDifferent!106 lt!85894 lt!85883 v!309 lt!85897))))

(assert (=> b!173462 (= (apply!130 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)) lt!85897) (apply!130 lt!85894 lt!85897))))

(declare-fun b!173463 () Bool)

(assert (=> b!173463 (= e!114587 (+!245 call!17571 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!173464 () Bool)

(assert (=> b!173464 (= e!114585 e!114579)))

(declare-fun res!82370 () Bool)

(assert (=> b!173464 (= res!82370 call!17570)))

(assert (=> b!173464 (=> (not res!82370) (not e!114579))))

(declare-fun b!173465 () Bool)

(declare-fun res!82365 () Bool)

(assert (=> b!173465 (=> (not res!82365) (not e!114584))))

(assert (=> b!173465 (= res!82365 e!114577)))

(declare-fun c!30933 () Bool)

(assert (=> b!173465 (= c!30933 (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173466 () Bool)

(assert (=> b!173466 (= e!114584 e!114585)))

(declare-fun c!30928 () Bool)

(assert (=> b!173466 (= c!30928 (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173467 () Bool)

(assert (=> b!173467 (= e!114588 (= (apply!130 lt!85884 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3758 (_values!3580 thiss!1248))))))

(assert (=> b!173467 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun bm!17569 () Bool)

(assert (=> bm!17569 (= call!17567 call!17573)))

(declare-fun bm!17570 () Bool)

(assert (=> bm!17570 (= call!17568 call!17571)))

(declare-fun b!173468 () Bool)

(declare-fun c!30932 () Bool)

(assert (=> b!173468 (= c!30932 (and (not (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!173468 (= e!114576 e!114586)))

(assert (= (and d!52671 c!30929) b!173463))

(assert (= (and d!52671 (not c!30929)) b!173451))

(assert (= (and b!173451 c!30931) b!173456))

(assert (= (and b!173451 (not c!30931)) b!173468))

(assert (= (and b!173468 c!30932) b!173453))

(assert (= (and b!173468 (not c!30932)) b!173461))

(assert (= (or b!173453 b!173461) bm!17566))

(assert (= (or b!173456 bm!17566) bm!17569))

(assert (= (or b!173456 b!173453) bm!17570))

(assert (= (or b!173463 bm!17569) bm!17565))

(assert (= (or b!173463 bm!17570) bm!17567))

(assert (= (and d!52671 res!82367) b!173448))

(assert (= (and d!52671 c!30930) b!173462))

(assert (= (and d!52671 (not c!30930)) b!173455))

(assert (= (and d!52671 res!82363) b!173458))

(assert (= (and b!173458 res!82371) b!173457))

(assert (= (and b!173458 (not res!82368)) b!173454))

(assert (= (and b!173454 res!82366) b!173467))

(assert (= (and b!173458 res!82364) b!173465))

(assert (= (and b!173465 c!30933) b!173459))

(assert (= (and b!173465 (not c!30933)) b!173449))

(assert (= (and b!173459 res!82369) b!173450))

(assert (= (or b!173459 b!173449) bm!17568))

(assert (= (and b!173465 res!82365) b!173466))

(assert (= (and b!173466 c!30928) b!173464))

(assert (= (and b!173466 (not c!30928)) b!173452))

(assert (= (and b!173464 res!82370) b!173460))

(assert (= (or b!173464 b!173452) bm!17564))

(declare-fun b_lambda!6959 () Bool)

(assert (=> (not b_lambda!6959) (not b!173467)))

(assert (=> b!173467 t!6991))

(declare-fun b_and!10771 () Bool)

(assert (= b_and!10769 (and (=> t!6991 result!4577) b_and!10771)))

(declare-fun m!201975 () Bool)

(assert (=> b!173460 m!201975))

(declare-fun m!201977 () Bool)

(assert (=> b!173463 m!201977))

(assert (=> b!173467 m!201909))

(declare-fun m!201979 () Bool)

(assert (=> b!173467 m!201979))

(assert (=> b!173467 m!201909))

(assert (=> b!173467 m!201913))

(assert (=> b!173467 m!201915))

(assert (=> b!173467 m!201913))

(assert (=> b!173467 m!201915))

(assert (=> b!173467 m!201917))

(declare-fun m!201981 () Bool)

(assert (=> b!173450 m!201981))

(declare-fun m!201983 () Bool)

(assert (=> bm!17567 m!201983))

(declare-fun m!201985 () Bool)

(assert (=> bm!17565 m!201985))

(assert (=> d!52671 m!201893))

(declare-fun m!201987 () Bool)

(assert (=> b!173462 m!201987))

(declare-fun m!201989 () Bool)

(assert (=> b!173462 m!201989))

(declare-fun m!201991 () Bool)

(assert (=> b!173462 m!201991))

(declare-fun m!201993 () Bool)

(assert (=> b!173462 m!201993))

(assert (=> b!173462 m!201985))

(declare-fun m!201995 () Bool)

(assert (=> b!173462 m!201995))

(declare-fun m!201997 () Bool)

(assert (=> b!173462 m!201997))

(assert (=> b!173462 m!201909))

(declare-fun m!201999 () Bool)

(assert (=> b!173462 m!201999))

(declare-fun m!202001 () Bool)

(assert (=> b!173462 m!202001))

(assert (=> b!173462 m!201987))

(declare-fun m!202003 () Bool)

(assert (=> b!173462 m!202003))

(declare-fun m!202005 () Bool)

(assert (=> b!173462 m!202005))

(declare-fun m!202007 () Bool)

(assert (=> b!173462 m!202007))

(assert (=> b!173462 m!202001))

(declare-fun m!202009 () Bool)

(assert (=> b!173462 m!202009))

(declare-fun m!202011 () Bool)

(assert (=> b!173462 m!202011))

(declare-fun m!202013 () Bool)

(assert (=> b!173462 m!202013))

(assert (=> b!173462 m!202007))

(declare-fun m!202015 () Bool)

(assert (=> b!173462 m!202015))

(assert (=> b!173462 m!201991))

(assert (=> b!173448 m!201909))

(assert (=> b!173448 m!201909))

(assert (=> b!173448 m!201955))

(assert (=> b!173454 m!201909))

(assert (=> b!173454 m!201909))

(declare-fun m!202017 () Bool)

(assert (=> b!173454 m!202017))

(declare-fun m!202019 () Bool)

(assert (=> bm!17564 m!202019))

(declare-fun m!202021 () Bool)

(assert (=> bm!17568 m!202021))

(assert (=> b!173457 m!201909))

(assert (=> b!173457 m!201909))

(assert (=> b!173457 m!201955))

(assert (=> b!173315 d!52671))

(declare-fun d!52673 () Bool)

(declare-fun res!82372 () Bool)

(declare-fun e!114589 () Bool)

(assert (=> d!52673 (=> (not res!82372) (not e!114589))))

(assert (=> d!52673 (= res!82372 (simpleValid!144 thiss!1248))))

(assert (=> d!52673 (= (valid!988 thiss!1248) e!114589)))

(declare-fun b!173469 () Bool)

(declare-fun res!82373 () Bool)

(assert (=> b!173469 (=> (not res!82373) (not e!114589))))

(assert (=> b!173469 (= res!82373 (= (arrayCountValidKeys!0 (_keys!5438 thiss!1248) #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))) (_size!1200 thiss!1248)))))

(declare-fun b!173470 () Bool)

(declare-fun res!82374 () Bool)

(assert (=> b!173470 (=> (not res!82374) (not e!114589))))

(assert (=> b!173470 (= res!82374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5438 thiss!1248) (mask!8469 thiss!1248)))))

(declare-fun b!173471 () Bool)

(assert (=> b!173471 (= e!114589 (arrayNoDuplicates!0 (_keys!5438 thiss!1248) #b00000000000000000000000000000000 Nil!2188))))

(assert (= (and d!52673 res!82372) b!173469))

(assert (= (and b!173469 res!82373) b!173470))

(assert (= (and b!173470 res!82374) b!173471))

(declare-fun m!202023 () Bool)

(assert (=> d!52673 m!202023))

(declare-fun m!202025 () Bool)

(assert (=> b!173469 m!202025))

(declare-fun m!202027 () Bool)

(assert (=> b!173470 m!202027))

(declare-fun m!202029 () Bool)

(assert (=> b!173471 m!202029))

(assert (=> start!17288 d!52673))

(declare-fun d!52675 () Bool)

(assert (=> d!52675 (= (array_inv!2229 (_keys!5438 thiss!1248)) (bvsge (size!3757 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173312 d!52675))

(declare-fun d!52677 () Bool)

(assert (=> d!52677 (= (array_inv!2230 (_values!3580 thiss!1248)) (bvsge (size!3758 (_values!3580 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173312 d!52677))

(declare-fun d!52679 () Bool)

(declare-fun e!114595 () Bool)

(assert (=> d!52679 e!114595))

(declare-fun res!82377 () Bool)

(assert (=> d!52679 (=> res!82377 e!114595)))

(declare-fun lt!85911 () Bool)

(assert (=> d!52679 (= res!82377 (not lt!85911))))

(declare-fun lt!85910 () Bool)

(assert (=> d!52679 (= lt!85911 lt!85910)))

(declare-fun lt!85912 () Unit!5315)

(declare-fun e!114594 () Unit!5315)

(assert (=> d!52679 (= lt!85912 e!114594)))

(declare-fun c!30936 () Bool)

(assert (=> d!52679 (= c!30936 lt!85910)))

(declare-fun containsKey!189 (List!2188 (_ BitVec 64)) Bool)

(assert (=> d!52679 (= lt!85910 (containsKey!189 (toList!1083 lt!85777) key!828))))

(assert (=> d!52679 (= (contains!1149 lt!85777 key!828) lt!85911)))

(declare-fun b!173478 () Bool)

(declare-fun lt!85909 () Unit!5315)

(assert (=> b!173478 (= e!114594 lt!85909)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!137 (List!2188 (_ BitVec 64)) Unit!5315)

(assert (=> b!173478 (= lt!85909 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85777) key!828))))

(declare-fun isDefined!138 (Option!192) Bool)

(assert (=> b!173478 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85777) key!828))))

(declare-fun b!173479 () Bool)

(declare-fun Unit!5321 () Unit!5315)

(assert (=> b!173479 (= e!114594 Unit!5321)))

(declare-fun b!173480 () Bool)

(assert (=> b!173480 (= e!114595 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85777) key!828)))))

(assert (= (and d!52679 c!30936) b!173478))

(assert (= (and d!52679 (not c!30936)) b!173479))

(assert (= (and d!52679 (not res!82377)) b!173480))

(declare-fun m!202031 () Bool)

(assert (=> d!52679 m!202031))

(declare-fun m!202033 () Bool)

(assert (=> b!173478 m!202033))

(declare-fun m!202035 () Bool)

(assert (=> b!173478 m!202035))

(assert (=> b!173478 m!202035))

(declare-fun m!202037 () Bool)

(assert (=> b!173478 m!202037))

(assert (=> b!173480 m!202035))

(assert (=> b!173480 m!202035))

(assert (=> b!173480 m!202037))

(assert (=> b!173313 d!52679))

(declare-fun d!52681 () Bool)

(assert (=> d!52681 (= (map!1874 lt!85779) (getCurrentListMap!739 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)))))

(declare-fun bs!7168 () Bool)

(assert (= bs!7168 d!52681))

(declare-fun m!202039 () Bool)

(assert (=> bs!7168 m!202039))

(assert (=> b!173313 d!52681))

(declare-fun d!52683 () Bool)

(declare-fun e!114596 () Bool)

(assert (=> d!52683 e!114596))

(declare-fun res!82379 () Bool)

(assert (=> d!52683 (=> (not res!82379) (not e!114596))))

(declare-fun lt!85916 () ListLongMap!2135)

(assert (=> d!52683 (= res!82379 (contains!1149 lt!85916 (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun lt!85915 () List!2188)

(assert (=> d!52683 (= lt!85916 (ListLongMap!2136 lt!85915))))

(declare-fun lt!85914 () Unit!5315)

(declare-fun lt!85913 () Unit!5315)

(assert (=> d!52683 (= lt!85914 lt!85913)))

(assert (=> d!52683 (= (getValueByKey!186 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309))) (Some!191 (_2!1612 (tuple2!3203 key!828 v!309))))))

(assert (=> d!52683 (= lt!85913 (lemmaContainsTupThenGetReturnValue!99 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))))

(assert (=> d!52683 (= lt!85915 (insertStrictlySorted!102 (toList!1083 (map!1874 thiss!1248)) (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))))

(assert (=> d!52683 (= (+!245 (map!1874 thiss!1248) (tuple2!3203 key!828 v!309)) lt!85916)))

(declare-fun b!173481 () Bool)

(declare-fun res!82378 () Bool)

(assert (=> b!173481 (=> (not res!82378) (not e!114596))))

(assert (=> b!173481 (= res!82378 (= (getValueByKey!186 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))) (Some!191 (_2!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!173482 () Bool)

(assert (=> b!173482 (= e!114596 (contains!1151 (toList!1083 lt!85916) (tuple2!3203 key!828 v!309)))))

(assert (= (and d!52683 res!82379) b!173481))

(assert (= (and b!173481 res!82378) b!173482))

(declare-fun m!202041 () Bool)

(assert (=> d!52683 m!202041))

(declare-fun m!202043 () Bool)

(assert (=> d!52683 m!202043))

(declare-fun m!202045 () Bool)

(assert (=> d!52683 m!202045))

(declare-fun m!202047 () Bool)

(assert (=> d!52683 m!202047))

(declare-fun m!202049 () Bool)

(assert (=> b!173481 m!202049))

(declare-fun m!202051 () Bool)

(assert (=> b!173482 m!202051))

(assert (=> b!173319 d!52683))

(declare-fun d!52685 () Bool)

(assert (=> d!52685 (= (map!1874 thiss!1248) (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(declare-fun bs!7169 () Bool)

(assert (= bs!7169 d!52685))

(assert (=> bs!7169 m!201825))

(assert (=> b!173319 d!52685))

(declare-fun mapIsEmpty!6957 () Bool)

(declare-fun mapRes!6957 () Bool)

(assert (=> mapIsEmpty!6957 mapRes!6957))

(declare-fun mapNonEmpty!6957 () Bool)

(declare-fun tp!15606 () Bool)

(declare-fun e!114601 () Bool)

(assert (=> mapNonEmpty!6957 (= mapRes!6957 (and tp!15606 e!114601))))

(declare-fun mapValue!6957 () ValueCell!1697)

(declare-fun mapRest!6957 () (Array (_ BitVec 32) ValueCell!1697))

(declare-fun mapKey!6957 () (_ BitVec 32))

(assert (=> mapNonEmpty!6957 (= mapRest!6948 (store mapRest!6957 mapKey!6957 mapValue!6957))))

(declare-fun condMapEmpty!6957 () Bool)

(declare-fun mapDefault!6957 () ValueCell!1697)

(assert (=> mapNonEmpty!6948 (= condMapEmpty!6957 (= mapRest!6948 ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6957)))))

(declare-fun e!114602 () Bool)

(assert (=> mapNonEmpty!6948 (= tp!15591 (and e!114602 mapRes!6957))))

(declare-fun b!173490 () Bool)

(assert (=> b!173490 (= e!114602 tp_is_empty!4081)))

(declare-fun b!173489 () Bool)

(assert (=> b!173489 (= e!114601 tp_is_empty!4081)))

(assert (= (and mapNonEmpty!6948 condMapEmpty!6957) mapIsEmpty!6957))

(assert (= (and mapNonEmpty!6948 (not condMapEmpty!6957)) mapNonEmpty!6957))

(assert (= (and mapNonEmpty!6957 ((_ is ValueCellFull!1697) mapValue!6957)) b!173489))

(assert (= (and mapNonEmpty!6948 ((_ is ValueCellFull!1697) mapDefault!6957)) b!173490))

(declare-fun m!202053 () Bool)

(assert (=> mapNonEmpty!6957 m!202053))

(declare-fun b_lambda!6961 () Bool)

(assert (= b_lambda!6957 (or (and b!173312 b_free!4309) b_lambda!6961)))

(declare-fun b_lambda!6963 () Bool)

(assert (= b_lambda!6959 (or (and b!173312 b_free!4309) b_lambda!6963)))

(check-sat (not b_lambda!6963) (not bm!17560) (not bm!17561) (not b!173454) (not d!52685) (not b!173467) (not d!52667) (not b!173462) (not b!173450) (not b!173434) (not d!52665) (not d!52673) (not b!173438) b_and!10771 (not b!173425) (not b_next!4309) (not d!52681) (not bm!17568) (not b!173460) (not b!173469) (not d!52683) (not b!173421) (not bm!17564) (not bm!17567) tp_is_empty!4081 (not b!173482) (not b!173470) (not b!173447) (not b!173480) (not bm!17565) (not b!173448) (not b!173376) (not bm!17557) (not d!52663) (not b!173457) (not b!173431) (not d!52679) (not b!173375) (not b_lambda!6961) (not d!52669) (not bm!17558) (not b!173481) (not b!173471) (not b!173419) (not b!173428) (not b!173374) (not mapNonEmpty!6957) (not b!173446) (not b!173433) (not d!52671) (not b!173463) (not b!173478))
(check-sat b_and!10771 (not b_next!4309))
(get-model)

(declare-fun d!52687 () Bool)

(declare-fun e!114604 () Bool)

(assert (=> d!52687 e!114604))

(declare-fun res!82380 () Bool)

(assert (=> d!52687 (=> res!82380 e!114604)))

(declare-fun lt!85919 () Bool)

(assert (=> d!52687 (= res!82380 (not lt!85919))))

(declare-fun lt!85918 () Bool)

(assert (=> d!52687 (= lt!85919 lt!85918)))

(declare-fun lt!85920 () Unit!5315)

(declare-fun e!114603 () Unit!5315)

(assert (=> d!52687 (= lt!85920 e!114603)))

(declare-fun c!30937 () Bool)

(assert (=> d!52687 (= c!30937 lt!85918)))

(assert (=> d!52687 (= lt!85918 (containsKey!189 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))))))

(assert (=> d!52687 (= (contains!1149 lt!85916 (_1!1612 (tuple2!3203 key!828 v!309))) lt!85919)))

(declare-fun b!173491 () Bool)

(declare-fun lt!85917 () Unit!5315)

(assert (=> b!173491 (= e!114603 lt!85917)))

(assert (=> b!173491 (= lt!85917 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))))))

(assert (=> b!173491 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!173492 () Bool)

(declare-fun Unit!5322 () Unit!5315)

(assert (=> b!173492 (= e!114603 Unit!5322)))

(declare-fun b!173493 () Bool)

(assert (=> b!173493 (= e!114604 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (= (and d!52687 c!30937) b!173491))

(assert (= (and d!52687 (not c!30937)) b!173492))

(assert (= (and d!52687 (not res!82380)) b!173493))

(declare-fun m!202055 () Bool)

(assert (=> d!52687 m!202055))

(declare-fun m!202057 () Bool)

(assert (=> b!173491 m!202057))

(assert (=> b!173491 m!202049))

(assert (=> b!173491 m!202049))

(declare-fun m!202059 () Bool)

(assert (=> b!173491 m!202059))

(assert (=> b!173493 m!202049))

(assert (=> b!173493 m!202049))

(assert (=> b!173493 m!202059))

(assert (=> d!52683 d!52687))

(declare-fun b!173504 () Bool)

(declare-fun e!114610 () Option!192)

(assert (=> b!173504 (= e!114610 (getValueByKey!186 (t!6987 lt!85915) (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!173503 () Bool)

(declare-fun e!114609 () Option!192)

(assert (=> b!173503 (= e!114609 e!114610)))

(declare-fun c!30943 () Bool)

(assert (=> b!173503 (= c!30943 (and ((_ is Cons!2184) lt!85915) (not (= (_1!1612 (h!2801 lt!85915)) (_1!1612 (tuple2!3203 key!828 v!309))))))))

(declare-fun b!173502 () Bool)

(assert (=> b!173502 (= e!114609 (Some!191 (_2!1612 (h!2801 lt!85915))))))

(declare-fun b!173505 () Bool)

(assert (=> b!173505 (= e!114610 None!190)))

(declare-fun c!30942 () Bool)

(declare-fun d!52689 () Bool)

(assert (=> d!52689 (= c!30942 (and ((_ is Cons!2184) lt!85915) (= (_1!1612 (h!2801 lt!85915)) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!52689 (= (getValueByKey!186 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309))) e!114609)))

(assert (= (and d!52689 c!30942) b!173502))

(assert (= (and d!52689 (not c!30942)) b!173503))

(assert (= (and b!173503 c!30943) b!173504))

(assert (= (and b!173503 (not c!30943)) b!173505))

(declare-fun m!202061 () Bool)

(assert (=> b!173504 m!202061))

(assert (=> d!52683 d!52689))

(declare-fun d!52691 () Bool)

(assert (=> d!52691 (= (getValueByKey!186 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309))) (Some!191 (_2!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun lt!85923 () Unit!5315)

(declare-fun choose!936 (List!2188 (_ BitVec 64) V!5089) Unit!5315)

(assert (=> d!52691 (= lt!85923 (choose!936 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun e!114613 () Bool)

(assert (=> d!52691 e!114613))

(declare-fun res!82385 () Bool)

(assert (=> d!52691 (=> (not res!82385) (not e!114613))))

(declare-fun isStrictlySorted!319 (List!2188) Bool)

(assert (=> d!52691 (= res!82385 (isStrictlySorted!319 lt!85915))))

(assert (=> d!52691 (= (lemmaContainsTupThenGetReturnValue!99 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))) lt!85923)))

(declare-fun b!173510 () Bool)

(declare-fun res!82386 () Bool)

(assert (=> b!173510 (=> (not res!82386) (not e!114613))))

(assert (=> b!173510 (= res!82386 (containsKey!189 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!173511 () Bool)

(assert (=> b!173511 (= e!114613 (contains!1151 lt!85915 (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(assert (= (and d!52691 res!82385) b!173510))

(assert (= (and b!173510 res!82386) b!173511))

(assert (=> d!52691 m!202043))

(declare-fun m!202063 () Bool)

(assert (=> d!52691 m!202063))

(declare-fun m!202065 () Bool)

(assert (=> d!52691 m!202065))

(declare-fun m!202067 () Bool)

(assert (=> b!173510 m!202067))

(declare-fun m!202069 () Bool)

(assert (=> b!173511 m!202069))

(assert (=> d!52683 d!52691))

(declare-fun d!52693 () Bool)

(declare-fun e!114625 () Bool)

(assert (=> d!52693 e!114625))

(declare-fun res!82391 () Bool)

(assert (=> d!52693 (=> (not res!82391) (not e!114625))))

(declare-fun lt!85926 () List!2188)

(assert (=> d!52693 (= res!82391 (isStrictlySorted!319 lt!85926))))

(declare-fun e!114628 () List!2188)

(assert (=> d!52693 (= lt!85926 e!114628)))

(declare-fun c!30954 () Bool)

(assert (=> d!52693 (= c!30954 (and ((_ is Cons!2184) (toList!1083 (map!1874 thiss!1248))) (bvslt (_1!1612 (h!2801 (toList!1083 (map!1874 thiss!1248)))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!52693 (isStrictlySorted!319 (toList!1083 (map!1874 thiss!1248)))))

(assert (=> d!52693 (= (insertStrictlySorted!102 (toList!1083 (map!1874 thiss!1248)) (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))) lt!85926)))

(declare-fun b!173532 () Bool)

(declare-fun call!17580 () List!2188)

(assert (=> b!173532 (= e!114628 call!17580)))

(declare-fun bm!17577 () Bool)

(declare-fun call!17581 () List!2188)

(declare-fun call!17582 () List!2188)

(assert (=> bm!17577 (= call!17581 call!17582)))

(declare-fun b!173533 () Bool)

(assert (=> b!173533 (= e!114625 (contains!1151 lt!85926 (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!173534 () Bool)

(declare-fun e!114627 () List!2188)

(assert (=> b!173534 (= e!114627 call!17581)))

(declare-fun e!114624 () List!2188)

(declare-fun b!173535 () Bool)

(assert (=> b!173535 (= e!114624 (insertStrictlySorted!102 (t!6987 (toList!1083 (map!1874 thiss!1248))) (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun bm!17578 () Bool)

(declare-fun $colon$colon!97 (List!2188 tuple2!3202) List!2188)

(assert (=> bm!17578 (= call!17580 ($colon$colon!97 e!114624 (ite c!30954 (h!2801 (toList!1083 (map!1874 thiss!1248))) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))))))

(declare-fun c!30952 () Bool)

(assert (=> bm!17578 (= c!30952 c!30954)))

(declare-fun b!173536 () Bool)

(declare-fun e!114626 () List!2188)

(assert (=> b!173536 (= e!114626 call!17582)))

(declare-fun b!173537 () Bool)

(assert (=> b!173537 (= e!114627 call!17581)))

(declare-fun b!173538 () Bool)

(assert (=> b!173538 (= e!114628 e!114626)))

(declare-fun c!30955 () Bool)

(assert (=> b!173538 (= c!30955 (and ((_ is Cons!2184) (toList!1083 (map!1874 thiss!1248))) (= (_1!1612 (h!2801 (toList!1083 (map!1874 thiss!1248)))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!173539 () Bool)

(declare-fun c!30953 () Bool)

(assert (=> b!173539 (= e!114624 (ite c!30955 (t!6987 (toList!1083 (map!1874 thiss!1248))) (ite c!30953 (Cons!2184 (h!2801 (toList!1083 (map!1874 thiss!1248))) (t!6987 (toList!1083 (map!1874 thiss!1248)))) Nil!2185)))))

(declare-fun bm!17579 () Bool)

(assert (=> bm!17579 (= call!17582 call!17580)))

(declare-fun b!173540 () Bool)

(declare-fun res!82392 () Bool)

(assert (=> b!173540 (=> (not res!82392) (not e!114625))))

(assert (=> b!173540 (= res!82392 (containsKey!189 lt!85926 (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!173541 () Bool)

(assert (=> b!173541 (= c!30953 (and ((_ is Cons!2184) (toList!1083 (map!1874 thiss!1248))) (bvsgt (_1!1612 (h!2801 (toList!1083 (map!1874 thiss!1248)))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> b!173541 (= e!114626 e!114627)))

(assert (= (and d!52693 c!30954) b!173532))

(assert (= (and d!52693 (not c!30954)) b!173538))

(assert (= (and b!173538 c!30955) b!173536))

(assert (= (and b!173538 (not c!30955)) b!173541))

(assert (= (and b!173541 c!30953) b!173537))

(assert (= (and b!173541 (not c!30953)) b!173534))

(assert (= (or b!173537 b!173534) bm!17577))

(assert (= (or b!173536 bm!17577) bm!17579))

(assert (= (or b!173532 bm!17579) bm!17578))

(assert (= (and bm!17578 c!30952) b!173535))

(assert (= (and bm!17578 (not c!30952)) b!173539))

(assert (= (and d!52693 res!82391) b!173540))

(assert (= (and b!173540 res!82392) b!173533))

(declare-fun m!202071 () Bool)

(assert (=> bm!17578 m!202071))

(declare-fun m!202073 () Bool)

(assert (=> b!173535 m!202073))

(declare-fun m!202075 () Bool)

(assert (=> b!173540 m!202075))

(declare-fun m!202077 () Bool)

(assert (=> b!173533 m!202077))

(declare-fun m!202079 () Bool)

(assert (=> d!52693 m!202079))

(declare-fun m!202081 () Bool)

(assert (=> d!52693 m!202081))

(assert (=> d!52683 d!52693))

(declare-fun d!52695 () Bool)

(assert (=> d!52695 (= (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173457 d!52695))

(declare-fun d!52697 () Bool)

(declare-fun res!82397 () Bool)

(declare-fun e!114635 () Bool)

(assert (=> d!52697 (=> res!82397 e!114635)))

(assert (=> d!52697 (= res!82397 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!52697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5438 lt!85779) (mask!8469 lt!85779)) e!114635)))

(declare-fun b!173550 () Bool)

(declare-fun e!114637 () Bool)

(assert (=> b!173550 (= e!114635 e!114637)))

(declare-fun c!30958 () Bool)

(assert (=> b!173550 (= c!30958 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!173551 () Bool)

(declare-fun e!114636 () Bool)

(declare-fun call!17585 () Bool)

(assert (=> b!173551 (= e!114636 call!17585)))

(declare-fun b!173552 () Bool)

(assert (=> b!173552 (= e!114637 call!17585)))

(declare-fun b!173553 () Bool)

(assert (=> b!173553 (= e!114637 e!114636)))

(declare-fun lt!85935 () (_ BitVec 64))

(assert (=> b!173553 (= lt!85935 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))

(declare-fun lt!85933 () Unit!5315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7279 (_ BitVec 64) (_ BitVec 32)) Unit!5315)

(assert (=> b!173553 (= lt!85933 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5438 lt!85779) lt!85935 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!173553 (arrayContainsKey!0 (_keys!5438 lt!85779) lt!85935 #b00000000000000000000000000000000)))

(declare-fun lt!85934 () Unit!5315)

(assert (=> b!173553 (= lt!85934 lt!85933)))

(declare-fun res!82398 () Bool)

(declare-datatypes ((SeekEntryResult!536 0))(
  ( (MissingZero!536 (index!4312 (_ BitVec 32))) (Found!536 (index!4313 (_ BitVec 32))) (Intermediate!536 (undefined!1348 Bool) (index!4314 (_ BitVec 32)) (x!19190 (_ BitVec 32))) (Undefined!536) (MissingVacant!536 (index!4315 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7279 (_ BitVec 32)) SeekEntryResult!536)

(assert (=> b!173553 (= res!82398 (= (seekEntryOrOpen!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) (_keys!5438 lt!85779) (mask!8469 lt!85779)) (Found!536 #b00000000000000000000000000000000)))))

(assert (=> b!173553 (=> (not res!82398) (not e!114636))))

(declare-fun bm!17582 () Bool)

(assert (=> bm!17582 (= call!17585 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5438 lt!85779) (mask!8469 lt!85779)))))

(assert (= (and d!52697 (not res!82397)) b!173550))

(assert (= (and b!173550 c!30958) b!173553))

(assert (= (and b!173550 (not c!30958)) b!173552))

(assert (= (and b!173553 res!82398) b!173551))

(assert (= (or b!173551 b!173552) bm!17582))

(declare-fun m!202083 () Bool)

(assert (=> b!173550 m!202083))

(assert (=> b!173550 m!202083))

(declare-fun m!202085 () Bool)

(assert (=> b!173550 m!202085))

(assert (=> b!173553 m!202083))

(declare-fun m!202087 () Bool)

(assert (=> b!173553 m!202087))

(declare-fun m!202089 () Bool)

(assert (=> b!173553 m!202089))

(assert (=> b!173553 m!202083))

(declare-fun m!202091 () Bool)

(assert (=> b!173553 m!202091))

(declare-fun m!202093 () Bool)

(assert (=> bm!17582 m!202093))

(assert (=> b!173375 d!52697))

(declare-fun d!52699 () Bool)

(assert (=> d!52699 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85777) key!828))))

(declare-fun lt!85938 () Unit!5315)

(declare-fun choose!937 (List!2188 (_ BitVec 64)) Unit!5315)

(assert (=> d!52699 (= lt!85938 (choose!937 (toList!1083 lt!85777) key!828))))

(declare-fun e!114640 () Bool)

(assert (=> d!52699 e!114640))

(declare-fun res!82401 () Bool)

(assert (=> d!52699 (=> (not res!82401) (not e!114640))))

(assert (=> d!52699 (= res!82401 (isStrictlySorted!319 (toList!1083 lt!85777)))))

(assert (=> d!52699 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85777) key!828) lt!85938)))

(declare-fun b!173556 () Bool)

(assert (=> b!173556 (= e!114640 (containsKey!189 (toList!1083 lt!85777) key!828))))

(assert (= (and d!52699 res!82401) b!173556))

(assert (=> d!52699 m!202035))

(assert (=> d!52699 m!202035))

(assert (=> d!52699 m!202037))

(declare-fun m!202095 () Bool)

(assert (=> d!52699 m!202095))

(declare-fun m!202097 () Bool)

(assert (=> d!52699 m!202097))

(assert (=> b!173556 m!202031))

(assert (=> b!173478 d!52699))

(declare-fun d!52701 () Bool)

(declare-fun isEmpty!442 (Option!192) Bool)

(assert (=> d!52701 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85777) key!828)) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85777) key!828))))))

(declare-fun bs!7170 () Bool)

(assert (= bs!7170 d!52701))

(assert (=> bs!7170 m!202035))

(declare-fun m!202099 () Bool)

(assert (=> bs!7170 m!202099))

(assert (=> b!173478 d!52701))

(declare-fun b!173559 () Bool)

(declare-fun e!114642 () Option!192)

(assert (=> b!173559 (= e!114642 (getValueByKey!186 (t!6987 (toList!1083 lt!85777)) key!828))))

(declare-fun b!173558 () Bool)

(declare-fun e!114641 () Option!192)

(assert (=> b!173558 (= e!114641 e!114642)))

(declare-fun c!30960 () Bool)

(assert (=> b!173558 (= c!30960 (and ((_ is Cons!2184) (toList!1083 lt!85777)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85777))) key!828))))))

(declare-fun b!173557 () Bool)

(assert (=> b!173557 (= e!114641 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85777)))))))

(declare-fun b!173560 () Bool)

(assert (=> b!173560 (= e!114642 None!190)))

(declare-fun d!52703 () Bool)

(declare-fun c!30959 () Bool)

(assert (=> d!52703 (= c!30959 (and ((_ is Cons!2184) (toList!1083 lt!85777)) (= (_1!1612 (h!2801 (toList!1083 lt!85777))) key!828)))))

(assert (=> d!52703 (= (getValueByKey!186 (toList!1083 lt!85777) key!828) e!114641)))

(assert (= (and d!52703 c!30959) b!173557))

(assert (= (and d!52703 (not c!30959)) b!173558))

(assert (= (and b!173558 c!30960) b!173559))

(assert (= (and b!173558 (not c!30960)) b!173560))

(declare-fun m!202101 () Bool)

(assert (=> b!173559 m!202101))

(assert (=> b!173478 d!52703))

(assert (=> d!52685 d!52667))

(declare-fun d!52705 () Bool)

(declare-fun e!114643 () Bool)

(assert (=> d!52705 e!114643))

(declare-fun res!82403 () Bool)

(assert (=> d!52705 (=> (not res!82403) (not e!114643))))

(declare-fun lt!85942 () ListLongMap!2135)

(assert (=> d!52705 (= res!82403 (contains!1149 lt!85942 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun lt!85941 () List!2188)

(assert (=> d!52705 (= lt!85942 (ListLongMap!2136 lt!85941))))

(declare-fun lt!85940 () Unit!5315)

(declare-fun lt!85939 () Unit!5315)

(assert (=> d!52705 (= lt!85940 lt!85939)))

(assert (=> d!52705 (= (getValueByKey!186 lt!85941 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) (Some!191 (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52705 (= lt!85939 (lemmaContainsTupThenGetReturnValue!99 lt!85941 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52705 (= lt!85941 (insertStrictlySorted!102 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52705 (= (+!245 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)) (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!85942)))

(declare-fun b!173561 () Bool)

(declare-fun res!82402 () Bool)

(assert (=> b!173561 (=> (not res!82402) (not e!114643))))

(assert (=> b!173561 (= res!82402 (= (getValueByKey!186 (toList!1083 lt!85942) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) (Some!191 (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!173562 () Bool)

(assert (=> b!173562 (= e!114643 (contains!1151 (toList!1083 lt!85942) (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (= (and d!52705 res!82403) b!173561))

(assert (= (and b!173561 res!82402) b!173562))

(declare-fun m!202103 () Bool)

(assert (=> d!52705 m!202103))

(declare-fun m!202105 () Bool)

(assert (=> d!52705 m!202105))

(declare-fun m!202107 () Bool)

(assert (=> d!52705 m!202107))

(declare-fun m!202109 () Bool)

(assert (=> d!52705 m!202109))

(declare-fun m!202111 () Bool)

(assert (=> b!173561 m!202111))

(declare-fun m!202113 () Bool)

(assert (=> b!173562 m!202113))

(assert (=> bm!17560 d!52705))

(declare-fun d!52707 () Bool)

(declare-fun res!82412 () Bool)

(declare-fun e!114652 () Bool)

(assert (=> d!52707 (=> res!82412 e!114652)))

(assert (=> d!52707 (= res!82412 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!52707 (= (arrayNoDuplicates!0 (_keys!5438 lt!85779) #b00000000000000000000000000000000 Nil!2188) e!114652)))

(declare-fun b!173573 () Bool)

(declare-fun e!114653 () Bool)

(declare-fun e!114655 () Bool)

(assert (=> b!173573 (= e!114653 e!114655)))

(declare-fun c!30963 () Bool)

(assert (=> b!173573 (= c!30963 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!173574 () Bool)

(declare-fun call!17588 () Bool)

(assert (=> b!173574 (= e!114655 call!17588)))

(declare-fun bm!17585 () Bool)

(assert (=> bm!17585 (= call!17588 (arrayNoDuplicates!0 (_keys!5438 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30963 (Cons!2187 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) Nil!2188) Nil!2188)))))

(declare-fun b!173575 () Bool)

(declare-fun e!114654 () Bool)

(declare-fun contains!1152 (List!2191 (_ BitVec 64)) Bool)

(assert (=> b!173575 (= e!114654 (contains!1152 Nil!2188 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!173576 () Bool)

(assert (=> b!173576 (= e!114655 call!17588)))

(declare-fun b!173577 () Bool)

(assert (=> b!173577 (= e!114652 e!114653)))

(declare-fun res!82411 () Bool)

(assert (=> b!173577 (=> (not res!82411) (not e!114653))))

(assert (=> b!173577 (= res!82411 (not e!114654))))

(declare-fun res!82410 () Bool)

(assert (=> b!173577 (=> (not res!82410) (not e!114654))))

(assert (=> b!173577 (= res!82410 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (= (and d!52707 (not res!82412)) b!173577))

(assert (= (and b!173577 res!82410) b!173575))

(assert (= (and b!173577 res!82411) b!173573))

(assert (= (and b!173573 c!30963) b!173574))

(assert (= (and b!173573 (not c!30963)) b!173576))

(assert (= (or b!173574 b!173576) bm!17585))

(assert (=> b!173573 m!202083))

(assert (=> b!173573 m!202083))

(assert (=> b!173573 m!202085))

(assert (=> bm!17585 m!202083))

(declare-fun m!202115 () Bool)

(assert (=> bm!17585 m!202115))

(assert (=> b!173575 m!202083))

(assert (=> b!173575 m!202083))

(declare-fun m!202117 () Bool)

(assert (=> b!173575 m!202117))

(assert (=> b!173577 m!202083))

(assert (=> b!173577 m!202083))

(assert (=> b!173577 m!202085))

(assert (=> b!173376 d!52707))

(declare-fun d!52709 () Bool)

(declare-fun get!1975 (Option!192) V!5089)

(assert (=> d!52709 (= (apply!130 lt!85850 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1975 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7171 () Bool)

(assert (= bs!7171 d!52709))

(declare-fun m!202119 () Bool)

(assert (=> bs!7171 m!202119))

(assert (=> bs!7171 m!202119))

(declare-fun m!202121 () Bool)

(assert (=> bs!7171 m!202121))

(assert (=> b!173421 d!52709))

(declare-fun d!52711 () Bool)

(declare-fun e!114657 () Bool)

(assert (=> d!52711 e!114657))

(declare-fun res!82413 () Bool)

(assert (=> d!52711 (=> res!82413 e!114657)))

(declare-fun lt!85945 () Bool)

(assert (=> d!52711 (= res!82413 (not lt!85945))))

(declare-fun lt!85944 () Bool)

(assert (=> d!52711 (= lt!85945 lt!85944)))

(declare-fun lt!85946 () Unit!5315)

(declare-fun e!114656 () Unit!5315)

(assert (=> d!52711 (= lt!85946 e!114656)))

(declare-fun c!30964 () Bool)

(assert (=> d!52711 (= c!30964 lt!85944)))

(assert (=> d!52711 (= lt!85944 (containsKey!189 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52711 (= (contains!1149 lt!85884 #b0000000000000000000000000000000000000000000000000000000000000000) lt!85945)))

(declare-fun b!173578 () Bool)

(declare-fun lt!85943 () Unit!5315)

(assert (=> b!173578 (= e!114656 lt!85943)))

(assert (=> b!173578 (= lt!85943 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173578 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173579 () Bool)

(declare-fun Unit!5323 () Unit!5315)

(assert (=> b!173579 (= e!114656 Unit!5323)))

(declare-fun b!173580 () Bool)

(assert (=> b!173580 (= e!114657 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52711 c!30964) b!173578))

(assert (= (and d!52711 (not c!30964)) b!173579))

(assert (= (and d!52711 (not res!82413)) b!173580))

(declare-fun m!202123 () Bool)

(assert (=> d!52711 m!202123))

(declare-fun m!202125 () Bool)

(assert (=> b!173578 m!202125))

(declare-fun m!202127 () Bool)

(assert (=> b!173578 m!202127))

(assert (=> b!173578 m!202127))

(declare-fun m!202129 () Bool)

(assert (=> b!173578 m!202129))

(assert (=> b!173580 m!202127))

(assert (=> b!173580 m!202127))

(assert (=> b!173580 m!202129))

(assert (=> bm!17568 d!52711))

(declare-fun b!173583 () Bool)

(declare-fun e!114659 () Option!192)

(assert (=> b!173583 (= e!114659 (getValueByKey!186 (t!6987 (toList!1083 lt!85878)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173582 () Bool)

(declare-fun e!114658 () Option!192)

(assert (=> b!173582 (= e!114658 e!114659)))

(declare-fun c!30966 () Bool)

(assert (=> b!173582 (= c!30966 (and ((_ is Cons!2184) (toList!1083 lt!85878)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85878))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173581 () Bool)

(assert (=> b!173581 (= e!114658 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85878)))))))

(declare-fun b!173584 () Bool)

(assert (=> b!173584 (= e!114659 None!190)))

(declare-fun d!52713 () Bool)

(declare-fun c!30965 () Bool)

(assert (=> d!52713 (= c!30965 (and ((_ is Cons!2184) (toList!1083 lt!85878)) (= (_1!1612 (h!2801 (toList!1083 lt!85878))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52713 (= (getValueByKey!186 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114658)))

(assert (= (and d!52713 c!30965) b!173581))

(assert (= (and d!52713 (not c!30965)) b!173582))

(assert (= (and b!173582 c!30966) b!173583))

(assert (= (and b!173582 (not c!30966)) b!173584))

(declare-fun m!202131 () Bool)

(assert (=> b!173583 m!202131))

(assert (=> b!173446 d!52713))

(declare-fun d!52715 () Bool)

(declare-fun res!82422 () Bool)

(declare-fun e!114662 () Bool)

(assert (=> d!52715 (=> (not res!82422) (not e!114662))))

(assert (=> d!52715 (= res!82422 (validMask!0 (mask!8469 lt!85779)))))

(assert (=> d!52715 (= (simpleValid!144 lt!85779) e!114662)))

(declare-fun b!173593 () Bool)

(declare-fun res!82424 () Bool)

(assert (=> b!173593 (=> (not res!82424) (not e!114662))))

(assert (=> b!173593 (= res!82424 (and (= (size!3758 (_values!3580 lt!85779)) (bvadd (mask!8469 lt!85779) #b00000000000000000000000000000001)) (= (size!3757 (_keys!5438 lt!85779)) (size!3758 (_values!3580 lt!85779))) (bvsge (_size!1200 lt!85779) #b00000000000000000000000000000000) (bvsle (_size!1200 lt!85779) (bvadd (mask!8469 lt!85779) #b00000000000000000000000000000001))))))

(declare-fun b!173595 () Bool)

(declare-fun res!82425 () Bool)

(assert (=> b!173595 (=> (not res!82425) (not e!114662))))

(declare-fun size!3763 (LongMapFixedSize!2302) (_ BitVec 32))

(assert (=> b!173595 (= res!82425 (= (size!3763 lt!85779) (bvadd (_size!1200 lt!85779) (bvsdiv (bvadd (extraKeys!3336 lt!85779) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!173594 () Bool)

(declare-fun res!82423 () Bool)

(assert (=> b!173594 (=> (not res!82423) (not e!114662))))

(assert (=> b!173594 (= res!82423 (bvsge (size!3763 lt!85779) (_size!1200 lt!85779)))))

(declare-fun b!173596 () Bool)

(assert (=> b!173596 (= e!114662 (and (bvsge (extraKeys!3336 lt!85779) #b00000000000000000000000000000000) (bvsle (extraKeys!3336 lt!85779) #b00000000000000000000000000000011) (bvsge (_vacant!1200 lt!85779) #b00000000000000000000000000000000)))))

(assert (= (and d!52715 res!82422) b!173593))

(assert (= (and b!173593 res!82424) b!173594))

(assert (= (and b!173594 res!82423) b!173595))

(assert (= (and b!173595 res!82425) b!173596))

(declare-fun m!202133 () Bool)

(assert (=> d!52715 m!202133))

(declare-fun m!202135 () Bool)

(assert (=> b!173595 m!202135))

(assert (=> b!173594 m!202135))

(assert (=> d!52665 d!52715))

(declare-fun d!52717 () Bool)

(assert (=> d!52717 (= (validMask!0 (mask!8469 thiss!1248)) (and (or (= (mask!8469 thiss!1248) #b00000000000000000000000000000111) (= (mask!8469 thiss!1248) #b00000000000000000000000000001111) (= (mask!8469 thiss!1248) #b00000000000000000000000000011111) (= (mask!8469 thiss!1248) #b00000000000000000000000000111111) (= (mask!8469 thiss!1248) #b00000000000000000000000001111111) (= (mask!8469 thiss!1248) #b00000000000000000000000011111111) (= (mask!8469 thiss!1248) #b00000000000000000000000111111111) (= (mask!8469 thiss!1248) #b00000000000000000000001111111111) (= (mask!8469 thiss!1248) #b00000000000000000000011111111111) (= (mask!8469 thiss!1248) #b00000000000000000000111111111111) (= (mask!8469 thiss!1248) #b00000000000000000001111111111111) (= (mask!8469 thiss!1248) #b00000000000000000011111111111111) (= (mask!8469 thiss!1248) #b00000000000000000111111111111111) (= (mask!8469 thiss!1248) #b00000000000000001111111111111111) (= (mask!8469 thiss!1248) #b00000000000000011111111111111111) (= (mask!8469 thiss!1248) #b00000000000000111111111111111111) (= (mask!8469 thiss!1248) #b00000000000001111111111111111111) (= (mask!8469 thiss!1248) #b00000000000011111111111111111111) (= (mask!8469 thiss!1248) #b00000000000111111111111111111111) (= (mask!8469 thiss!1248) #b00000000001111111111111111111111) (= (mask!8469 thiss!1248) #b00000000011111111111111111111111) (= (mask!8469 thiss!1248) #b00000000111111111111111111111111) (= (mask!8469 thiss!1248) #b00000001111111111111111111111111) (= (mask!8469 thiss!1248) #b00000011111111111111111111111111) (= (mask!8469 thiss!1248) #b00000111111111111111111111111111) (= (mask!8469 thiss!1248) #b00001111111111111111111111111111) (= (mask!8469 thiss!1248) #b00011111111111111111111111111111) (= (mask!8469 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8469 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> d!52663 d!52717))

(declare-fun d!52719 () Bool)

(assert (=> d!52719 (= (+!245 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))

(assert (=> d!52719 true))

(declare-fun _$8!130 () Unit!5315)

(assert (=> d!52719 (= (choose!935 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) v!309 (defaultEntry!3597 thiss!1248)) _$8!130)))

(declare-fun bs!7172 () Bool)

(assert (= bs!7172 d!52719))

(assert (=> bs!7172 m!201825))

(assert (=> bs!7172 m!201825))

(assert (=> bs!7172 m!201827))

(assert (=> bs!7172 m!201831))

(assert (=> d!52663 d!52719))

(assert (=> d!52663 d!52667))

(assert (=> d!52663 d!52669))

(assert (=> d!52663 d!52671))

(declare-fun d!52721 () Bool)

(declare-fun lt!85949 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!150 (List!2188) (InoxSet tuple2!3202))

(assert (=> d!52721 (= lt!85949 (select (content!150 (toList!1083 lt!85878)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!114667 () Bool)

(assert (=> d!52721 (= lt!85949 e!114667)))

(declare-fun res!82430 () Bool)

(assert (=> d!52721 (=> (not res!82430) (not e!114667))))

(assert (=> d!52721 (= res!82430 ((_ is Cons!2184) (toList!1083 lt!85878)))))

(assert (=> d!52721 (= (contains!1151 (toList!1083 lt!85878) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!85949)))

(declare-fun b!173601 () Bool)

(declare-fun e!114668 () Bool)

(assert (=> b!173601 (= e!114667 e!114668)))

(declare-fun res!82431 () Bool)

(assert (=> b!173601 (=> res!82431 e!114668)))

(assert (=> b!173601 (= res!82431 (= (h!2801 (toList!1083 lt!85878)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!173602 () Bool)

(assert (=> b!173602 (= e!114668 (contains!1151 (t!6987 (toList!1083 lt!85878)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52721 res!82430) b!173601))

(assert (= (and b!173601 (not res!82431)) b!173602))

(declare-fun m!202137 () Bool)

(assert (=> d!52721 m!202137))

(declare-fun m!202139 () Bool)

(assert (=> d!52721 m!202139))

(declare-fun m!202141 () Bool)

(assert (=> b!173602 m!202141))

(assert (=> b!173447 d!52721))

(declare-fun b!173611 () Bool)

(declare-fun e!114673 () (_ BitVec 32))

(assert (=> b!173611 (= e!114673 #b00000000000000000000000000000000)))

(declare-fun b!173612 () Bool)

(declare-fun e!114674 () (_ BitVec 32))

(declare-fun call!17591 () (_ BitVec 32))

(assert (=> b!173612 (= e!114674 call!17591)))

(declare-fun b!173613 () Bool)

(assert (=> b!173613 (= e!114674 (bvadd #b00000000000000000000000000000001 call!17591))))

(declare-fun d!52723 () Bool)

(declare-fun lt!85952 () (_ BitVec 32))

(assert (=> d!52723 (and (bvsge lt!85952 #b00000000000000000000000000000000) (bvsle lt!85952 (bvsub (size!3757 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (=> d!52723 (= lt!85952 e!114673)))

(declare-fun c!30971 () Bool)

(assert (=> d!52723 (= c!30971 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!52723 (and (bvsle #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3757 (_keys!5438 lt!85779)) (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!52723 (= (arrayCountValidKeys!0 (_keys!5438 lt!85779) #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))) lt!85952)))

(declare-fun bm!17588 () Bool)

(assert (=> bm!17588 (= call!17591 (arrayCountValidKeys!0 (_keys!5438 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))))))

(declare-fun b!173614 () Bool)

(assert (=> b!173614 (= e!114673 e!114674)))

(declare-fun c!30972 () Bool)

(assert (=> b!173614 (= c!30972 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (= (and d!52723 c!30971) b!173611))

(assert (= (and d!52723 (not c!30971)) b!173614))

(assert (= (and b!173614 c!30972) b!173613))

(assert (= (and b!173614 (not c!30972)) b!173612))

(assert (= (or b!173613 b!173612) bm!17588))

(declare-fun m!202143 () Bool)

(assert (=> bm!17588 m!202143))

(assert (=> b!173614 m!202083))

(assert (=> b!173614 m!202083))

(assert (=> b!173614 m!202085))

(assert (=> b!173374 d!52723))

(declare-fun d!52725 () Bool)

(declare-fun e!114676 () Bool)

(assert (=> d!52725 e!114676))

(declare-fun res!82432 () Bool)

(assert (=> d!52725 (=> res!82432 e!114676)))

(declare-fun lt!85955 () Bool)

(assert (=> d!52725 (= res!82432 (not lt!85955))))

(declare-fun lt!85954 () Bool)

(assert (=> d!52725 (= lt!85955 lt!85954)))

(declare-fun lt!85956 () Unit!5315)

(declare-fun e!114675 () Unit!5315)

(assert (=> d!52725 (= lt!85956 e!114675)))

(declare-fun c!30973 () Bool)

(assert (=> d!52725 (= c!30973 lt!85954)))

(assert (=> d!52725 (= lt!85954 (containsKey!189 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52725 (= (contains!1149 lt!85850 #b1000000000000000000000000000000000000000000000000000000000000000) lt!85955)))

(declare-fun b!173615 () Bool)

(declare-fun lt!85953 () Unit!5315)

(assert (=> b!173615 (= e!114675 lt!85953)))

(assert (=> b!173615 (= lt!85953 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173615 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173616 () Bool)

(declare-fun Unit!5324 () Unit!5315)

(assert (=> b!173616 (= e!114675 Unit!5324)))

(declare-fun b!173617 () Bool)

(assert (=> b!173617 (= e!114676 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52725 c!30973) b!173615))

(assert (= (and d!52725 (not c!30973)) b!173616))

(assert (= (and d!52725 (not res!82432)) b!173617))

(declare-fun m!202145 () Bool)

(assert (=> d!52725 m!202145))

(declare-fun m!202147 () Bool)

(assert (=> b!173615 m!202147))

(declare-fun m!202149 () Bool)

(assert (=> b!173615 m!202149))

(assert (=> b!173615 m!202149))

(declare-fun m!202151 () Bool)

(assert (=> b!173615 m!202151))

(assert (=> b!173617 m!202149))

(assert (=> b!173617 m!202149))

(assert (=> b!173617 m!202151))

(assert (=> bm!17557 d!52725))

(declare-fun b!173642 () Bool)

(declare-fun e!114692 () ListLongMap!2135)

(assert (=> b!173642 (= e!114692 (ListLongMap!2136 Nil!2185))))

(declare-fun b!173643 () Bool)

(declare-fun e!114697 () ListLongMap!2135)

(declare-fun call!17594 () ListLongMap!2135)

(assert (=> b!173643 (= e!114697 call!17594)))

(declare-fun b!173644 () Bool)

(declare-fun lt!85972 () Unit!5315)

(declare-fun lt!85975 () Unit!5315)

(assert (=> b!173644 (= lt!85972 lt!85975)))

(declare-fun lt!85977 () (_ BitVec 64))

(declare-fun lt!85976 () (_ BitVec 64))

(declare-fun lt!85974 () ListLongMap!2135)

(declare-fun lt!85973 () V!5089)

(assert (=> b!173644 (not (contains!1149 (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973)) lt!85977))))

(declare-fun addStillNotContains!74 (ListLongMap!2135 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5315)

(assert (=> b!173644 (= lt!85975 (addStillNotContains!74 lt!85974 lt!85976 lt!85973 lt!85977))))

(assert (=> b!173644 (= lt!85977 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173644 (= lt!85973 (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173644 (= lt!85976 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173644 (= lt!85974 call!17594)))

(assert (=> b!173644 (= e!114697 (+!245 call!17594 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173645 () Bool)

(assert (=> b!173645 (= e!114692 e!114697)))

(declare-fun c!30984 () Bool)

(assert (=> b!173645 (= c!30984 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173646 () Bool)

(declare-fun e!114694 () Bool)

(declare-fun e!114696 () Bool)

(assert (=> b!173646 (= e!114694 e!114696)))

(declare-fun c!30983 () Bool)

(declare-fun e!114693 () Bool)

(assert (=> b!173646 (= c!30983 e!114693)))

(declare-fun res!82443 () Bool)

(assert (=> b!173646 (=> (not res!82443) (not e!114693))))

(assert (=> b!173646 (= res!82443 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173647 () Bool)

(declare-fun res!82441 () Bool)

(assert (=> b!173647 (=> (not res!82441) (not e!114694))))

(declare-fun lt!85971 () ListLongMap!2135)

(assert (=> b!173647 (= res!82441 (not (contains!1149 lt!85971 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173648 () Bool)

(assert (=> b!173648 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> b!173648 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3758 (_values!3580 thiss!1248))))))

(declare-fun e!114691 () Bool)

(assert (=> b!173648 (= e!114691 (= (apply!130 lt!85971 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17591 () Bool)

(assert (=> bm!17591 (= call!17594 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173649 () Bool)

(declare-fun e!114695 () Bool)

(assert (=> b!173649 (= e!114695 (= lt!85971 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!173650 () Bool)

(assert (=> b!173650 (= e!114696 e!114691)))

(assert (=> b!173650 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun res!82442 () Bool)

(assert (=> b!173650 (= res!82442 (contains!1149 lt!85971 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173650 (=> (not res!82442) (not e!114691))))

(declare-fun b!173651 () Bool)

(assert (=> b!173651 (= e!114693 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173651 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!173652 () Bool)

(assert (=> b!173652 (= e!114696 e!114695)))

(declare-fun c!30985 () Bool)

(assert (=> b!173652 (= c!30985 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun d!52727 () Bool)

(assert (=> d!52727 e!114694))

(declare-fun res!82444 () Bool)

(assert (=> d!52727 (=> (not res!82444) (not e!114694))))

(assert (=> d!52727 (= res!82444 (not (contains!1149 lt!85971 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52727 (= lt!85971 e!114692)))

(declare-fun c!30982 () Bool)

(assert (=> d!52727 (= c!30982 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52727 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!52727 (= (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!85971)))

(declare-fun b!173653 () Bool)

(declare-fun isEmpty!443 (ListLongMap!2135) Bool)

(assert (=> b!173653 (= e!114695 (isEmpty!443 lt!85971))))

(assert (= (and d!52727 c!30982) b!173642))

(assert (= (and d!52727 (not c!30982)) b!173645))

(assert (= (and b!173645 c!30984) b!173644))

(assert (= (and b!173645 (not c!30984)) b!173643))

(assert (= (or b!173644 b!173643) bm!17591))

(assert (= (and d!52727 res!82444) b!173647))

(assert (= (and b!173647 res!82441) b!173646))

(assert (= (and b!173646 res!82443) b!173651))

(assert (= (and b!173646 c!30983) b!173650))

(assert (= (and b!173646 (not c!30983)) b!173652))

(assert (= (and b!173650 res!82442) b!173648))

(assert (= (and b!173652 c!30985) b!173649))

(assert (= (and b!173652 (not c!30985)) b!173653))

(declare-fun b_lambda!6965 () Bool)

(assert (=> (not b_lambda!6965) (not b!173644)))

(assert (=> b!173644 t!6991))

(declare-fun b_and!10773 () Bool)

(assert (= b_and!10771 (and (=> t!6991 result!4577) b_and!10773)))

(declare-fun b_lambda!6967 () Bool)

(assert (=> (not b_lambda!6967) (not b!173648)))

(assert (=> b!173648 t!6991))

(declare-fun b_and!10775 () Bool)

(assert (= b_and!10773 (and (=> t!6991 result!4577) b_and!10775)))

(assert (=> b!173650 m!201909))

(assert (=> b!173650 m!201909))

(declare-fun m!202153 () Bool)

(assert (=> b!173650 m!202153))

(assert (=> b!173648 m!201909))

(assert (=> b!173648 m!201909))

(declare-fun m!202155 () Bool)

(assert (=> b!173648 m!202155))

(assert (=> b!173648 m!201915))

(assert (=> b!173648 m!201913))

(assert (=> b!173648 m!201913))

(assert (=> b!173648 m!201915))

(assert (=> b!173648 m!201917))

(assert (=> b!173651 m!201909))

(assert (=> b!173651 m!201909))

(assert (=> b!173651 m!201955))

(declare-fun m!202157 () Bool)

(assert (=> b!173653 m!202157))

(declare-fun m!202159 () Bool)

(assert (=> bm!17591 m!202159))

(declare-fun m!202161 () Bool)

(assert (=> d!52727 m!202161))

(assert (=> d!52727 m!201893))

(declare-fun m!202163 () Bool)

(assert (=> b!173647 m!202163))

(declare-fun m!202165 () Bool)

(assert (=> b!173644 m!202165))

(assert (=> b!173644 m!201909))

(declare-fun m!202167 () Bool)

(assert (=> b!173644 m!202167))

(assert (=> b!173644 m!202167))

(declare-fun m!202169 () Bool)

(assert (=> b!173644 m!202169))

(declare-fun m!202171 () Bool)

(assert (=> b!173644 m!202171))

(assert (=> b!173644 m!201915))

(assert (=> b!173644 m!201913))

(assert (=> b!173644 m!201913))

(assert (=> b!173644 m!201915))

(assert (=> b!173644 m!201917))

(assert (=> b!173649 m!202159))

(assert (=> b!173645 m!201909))

(assert (=> b!173645 m!201909))

(assert (=> b!173645 m!201955))

(assert (=> bm!17558 d!52727))

(declare-fun d!52729 () Bool)

(declare-fun e!114699 () Bool)

(assert (=> d!52729 e!114699))

(declare-fun res!82445 () Bool)

(assert (=> d!52729 (=> res!82445 e!114699)))

(declare-fun lt!85980 () Bool)

(assert (=> d!52729 (= res!82445 (not lt!85980))))

(declare-fun lt!85979 () Bool)

(assert (=> d!52729 (= lt!85980 lt!85979)))

(declare-fun lt!85981 () Unit!5315)

(declare-fun e!114698 () Unit!5315)

(assert (=> d!52729 (= lt!85981 e!114698)))

(declare-fun c!30986 () Bool)

(assert (=> d!52729 (= c!30986 lt!85979)))

(assert (=> d!52729 (= lt!85979 (containsKey!189 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52729 (= (contains!1149 lt!85884 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) lt!85980)))

(declare-fun b!173654 () Bool)

(declare-fun lt!85978 () Unit!5315)

(assert (=> b!173654 (= e!114698 lt!85978)))

(assert (=> b!173654 (= lt!85978 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173654 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173655 () Bool)

(declare-fun Unit!5325 () Unit!5315)

(assert (=> b!173655 (= e!114698 Unit!5325)))

(declare-fun b!173656 () Bool)

(assert (=> b!173656 (= e!114699 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52729 c!30986) b!173654))

(assert (= (and d!52729 (not c!30986)) b!173655))

(assert (= (and d!52729 (not res!82445)) b!173656))

(assert (=> d!52729 m!201909))

(declare-fun m!202173 () Bool)

(assert (=> d!52729 m!202173))

(assert (=> b!173654 m!201909))

(declare-fun m!202175 () Bool)

(assert (=> b!173654 m!202175))

(assert (=> b!173654 m!201909))

(declare-fun m!202177 () Bool)

(assert (=> b!173654 m!202177))

(assert (=> b!173654 m!202177))

(declare-fun m!202179 () Bool)

(assert (=> b!173654 m!202179))

(assert (=> b!173656 m!201909))

(assert (=> b!173656 m!202177))

(assert (=> b!173656 m!202177))

(assert (=> b!173656 m!202179))

(assert (=> b!173454 d!52729))

(declare-fun d!52731 () Bool)

(assert (=> d!52731 (= (apply!130 lt!85850 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1975 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7173 () Bool)

(assert (= bs!7173 d!52731))

(assert (=> bs!7173 m!201909))

(declare-fun m!202181 () Bool)

(assert (=> bs!7173 m!202181))

(assert (=> bs!7173 m!202181))

(declare-fun m!202183 () Bool)

(assert (=> bs!7173 m!202183))

(assert (=> b!173438 d!52731))

(declare-fun d!52733 () Bool)

(declare-fun c!30989 () Bool)

(assert (=> d!52733 (= c!30989 ((_ is ValueCellFull!1697) (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114702 () V!5089)

(assert (=> d!52733 (= (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!114702)))

(declare-fun b!173661 () Bool)

(declare-fun get!1976 (ValueCell!1697 V!5089) V!5089)

(assert (=> b!173661 (= e!114702 (get!1976 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173662 () Bool)

(declare-fun get!1977 (ValueCell!1697 V!5089) V!5089)

(assert (=> b!173662 (= e!114702 (get!1977 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52733 c!30989) b!173661))

(assert (= (and d!52733 (not c!30989)) b!173662))

(assert (=> b!173661 m!201913))

(assert (=> b!173661 m!201915))

(declare-fun m!202185 () Bool)

(assert (=> b!173661 m!202185))

(assert (=> b!173662 m!201913))

(assert (=> b!173662 m!201915))

(declare-fun m!202187 () Bool)

(assert (=> b!173662 m!202187))

(assert (=> b!173438 d!52733))

(declare-fun b!173663 () Bool)

(declare-fun e!114709 () Bool)

(assert (=> b!173663 (= e!114709 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun bm!17592 () Bool)

(declare-fun call!17598 () Bool)

(declare-fun lt!85987 () ListLongMap!2135)

(assert (=> bm!17592 (= call!17598 (contains!1149 lt!85987 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17593 () Bool)

(declare-fun call!17601 () ListLongMap!2135)

(assert (=> bm!17593 (= call!17601 (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)))))

(declare-fun b!173664 () Bool)

(declare-fun e!114704 () Bool)

(declare-fun call!17600 () Bool)

(assert (=> b!173664 (= e!114704 (not call!17600))))

(declare-fun b!173665 () Bool)

(declare-fun e!114710 () Bool)

(assert (=> b!173665 (= e!114710 (= (apply!130 lt!85987 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3438 lt!85779)))))

(declare-fun b!173666 () Bool)

(declare-fun e!114714 () ListLongMap!2135)

(declare-fun e!114703 () ListLongMap!2135)

(assert (=> b!173666 (= e!114714 e!114703)))

(declare-fun c!30993 () Bool)

(assert (=> b!173666 (= c!30993 (and (not (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17594 () Bool)

(declare-fun call!17597 () ListLongMap!2135)

(declare-fun call!17595 () ListLongMap!2135)

(assert (=> bm!17594 (= call!17597 call!17595)))

(declare-fun b!173667 () Bool)

(declare-fun e!114712 () Bool)

(assert (=> b!173667 (= e!114712 (not call!17598))))

(declare-fun c!30991 () Bool)

(declare-fun call!17599 () ListLongMap!2135)

(declare-fun bm!17595 () Bool)

(assert (=> bm!17595 (= call!17599 (+!245 (ite c!30991 call!17601 (ite c!30993 call!17595 call!17597)) (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))))))

(declare-fun b!173668 () Bool)

(declare-fun e!114713 () ListLongMap!2135)

(declare-fun call!17596 () ListLongMap!2135)

(assert (=> b!173668 (= e!114713 call!17596)))

(declare-fun b!173669 () Bool)

(declare-fun e!114705 () Bool)

(declare-fun e!114715 () Bool)

(assert (=> b!173669 (= e!114705 e!114715)))

(declare-fun res!82449 () Bool)

(assert (=> b!173669 (=> (not res!82449) (not e!114715))))

(assert (=> b!173669 (= res!82449 (contains!1149 lt!85987 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (=> b!173669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(declare-fun b!173670 () Bool)

(declare-fun e!114708 () Unit!5315)

(declare-fun Unit!5326 () Unit!5315)

(assert (=> b!173670 (= e!114708 Unit!5326)))

(declare-fun bm!17596 () Bool)

(assert (=> bm!17596 (= call!17600 (contains!1149 lt!85987 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173671 () Bool)

(assert (=> b!173671 (= e!114703 call!17596)))

(declare-fun d!52735 () Bool)

(declare-fun e!114711 () Bool)

(assert (=> d!52735 e!114711))

(declare-fun res!82446 () Bool)

(assert (=> d!52735 (=> (not res!82446) (not e!114711))))

(assert (=> d!52735 (= res!82446 (or (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))))

(declare-fun lt!85983 () ListLongMap!2135)

(assert (=> d!52735 (= lt!85987 lt!85983)))

(declare-fun lt!85989 () Unit!5315)

(assert (=> d!52735 (= lt!85989 e!114708)))

(declare-fun c!30992 () Bool)

(assert (=> d!52735 (= c!30992 e!114709)))

(declare-fun res!82450 () Bool)

(assert (=> d!52735 (=> (not res!82450) (not e!114709))))

(assert (=> d!52735 (= res!82450 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!52735 (= lt!85983 e!114714)))

(assert (=> d!52735 (= c!30991 (and (not (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!52735 (validMask!0 (mask!8469 lt!85779))))

(assert (=> d!52735 (= (getCurrentListMap!739 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)) lt!85987)))

(declare-fun b!173672 () Bool)

(declare-fun e!114707 () Bool)

(assert (=> b!173672 (= e!114707 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!173673 () Bool)

(declare-fun res!82447 () Bool)

(assert (=> b!173673 (=> (not res!82447) (not e!114711))))

(assert (=> b!173673 (= res!82447 e!114705)))

(declare-fun res!82451 () Bool)

(assert (=> b!173673 (=> res!82451 e!114705)))

(assert (=> b!173673 (= res!82451 (not e!114707))))

(declare-fun res!82454 () Bool)

(assert (=> b!173673 (=> (not res!82454) (not e!114707))))

(assert (=> b!173673 (= res!82454 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(declare-fun b!173674 () Bool)

(assert (=> b!173674 (= e!114704 e!114710)))

(declare-fun res!82452 () Bool)

(assert (=> b!173674 (= res!82452 call!17600)))

(assert (=> b!173674 (=> (not res!82452) (not e!114710))))

(declare-fun b!173675 () Bool)

(declare-fun e!114706 () Bool)

(assert (=> b!173675 (= e!114706 (= (apply!130 lt!85987 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3440 lt!85779)))))

(declare-fun b!173676 () Bool)

(assert (=> b!173676 (= e!114713 call!17597)))

(declare-fun b!173677 () Bool)

(declare-fun lt!85998 () Unit!5315)

(assert (=> b!173677 (= e!114708 lt!85998)))

(declare-fun lt!85982 () ListLongMap!2135)

(assert (=> b!173677 (= lt!85982 (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)))))

(declare-fun lt!85992 () (_ BitVec 64))

(assert (=> b!173677 (= lt!85992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85996 () (_ BitVec 64))

(assert (=> b!173677 (= lt!85996 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))

(declare-fun lt!85994 () Unit!5315)

(assert (=> b!173677 (= lt!85994 (addStillContains!106 lt!85982 lt!85992 (zeroValue!3438 lt!85779) lt!85996))))

(assert (=> b!173677 (contains!1149 (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))) lt!85996)))

(declare-fun lt!85991 () Unit!5315)

(assert (=> b!173677 (= lt!85991 lt!85994)))

(declare-fun lt!85995 () ListLongMap!2135)

(assert (=> b!173677 (= lt!85995 (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)))))

(declare-fun lt!85993 () (_ BitVec 64))

(assert (=> b!173677 (= lt!85993 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85999 () (_ BitVec 64))

(assert (=> b!173677 (= lt!85999 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))

(declare-fun lt!86002 () Unit!5315)

(assert (=> b!173677 (= lt!86002 (addApplyDifferent!106 lt!85995 lt!85993 (minValue!3440 lt!85779) lt!85999))))

(assert (=> b!173677 (= (apply!130 (+!245 lt!85995 (tuple2!3203 lt!85993 (minValue!3440 lt!85779))) lt!85999) (apply!130 lt!85995 lt!85999))))

(declare-fun lt!86001 () Unit!5315)

(assert (=> b!173677 (= lt!86001 lt!86002)))

(declare-fun lt!85985 () ListLongMap!2135)

(assert (=> b!173677 (= lt!85985 (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)))))

(declare-fun lt!85990 () (_ BitVec 64))

(assert (=> b!173677 (= lt!85990 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!85984 () (_ BitVec 64))

(assert (=> b!173677 (= lt!85984 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))

(declare-fun lt!85988 () Unit!5315)

(assert (=> b!173677 (= lt!85988 (addApplyDifferent!106 lt!85985 lt!85990 (zeroValue!3438 lt!85779) lt!85984))))

(assert (=> b!173677 (= (apply!130 (+!245 lt!85985 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))) lt!85984) (apply!130 lt!85985 lt!85984))))

(declare-fun lt!86003 () Unit!5315)

(assert (=> b!173677 (= lt!86003 lt!85988)))

(declare-fun lt!85997 () ListLongMap!2135)

(assert (=> b!173677 (= lt!85997 (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)))))

(declare-fun lt!85986 () (_ BitVec 64))

(assert (=> b!173677 (= lt!85986 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86000 () (_ BitVec 64))

(assert (=> b!173677 (= lt!86000 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))

(assert (=> b!173677 (= lt!85998 (addApplyDifferent!106 lt!85997 lt!85986 (minValue!3440 lt!85779) lt!86000))))

(assert (=> b!173677 (= (apply!130 (+!245 lt!85997 (tuple2!3203 lt!85986 (minValue!3440 lt!85779))) lt!86000) (apply!130 lt!85997 lt!86000))))

(declare-fun b!173678 () Bool)

(assert (=> b!173678 (= e!114714 (+!245 call!17599 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))))

(declare-fun b!173679 () Bool)

(assert (=> b!173679 (= e!114712 e!114706)))

(declare-fun res!82453 () Bool)

(assert (=> b!173679 (= res!82453 call!17598)))

(assert (=> b!173679 (=> (not res!82453) (not e!114706))))

(declare-fun b!173680 () Bool)

(declare-fun res!82448 () Bool)

(assert (=> b!173680 (=> (not res!82448) (not e!114711))))

(assert (=> b!173680 (= res!82448 e!114704)))

(declare-fun c!30995 () Bool)

(assert (=> b!173680 (= c!30995 (not (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!173681 () Bool)

(assert (=> b!173681 (= e!114711 e!114712)))

(declare-fun c!30990 () Bool)

(assert (=> b!173681 (= c!30990 (not (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!173682 () Bool)

(assert (=> b!173682 (= e!114715 (= (apply!130 lt!85987 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)) (get!1974 (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 lt!85779) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173682 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3758 (_values!3580 lt!85779))))))

(assert (=> b!173682 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(declare-fun bm!17597 () Bool)

(assert (=> bm!17597 (= call!17595 call!17601)))

(declare-fun bm!17598 () Bool)

(assert (=> bm!17598 (= call!17596 call!17599)))

(declare-fun b!173683 () Bool)

(declare-fun c!30994 () Bool)

(assert (=> b!173683 (= c!30994 (and (not (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3336 lt!85779) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!173683 (= e!114703 e!114713)))

(assert (= (and d!52735 c!30991) b!173678))

(assert (= (and d!52735 (not c!30991)) b!173666))

(assert (= (and b!173666 c!30993) b!173671))

(assert (= (and b!173666 (not c!30993)) b!173683))

(assert (= (and b!173683 c!30994) b!173668))

(assert (= (and b!173683 (not c!30994)) b!173676))

(assert (= (or b!173668 b!173676) bm!17594))

(assert (= (or b!173671 bm!17594) bm!17597))

(assert (= (or b!173671 b!173668) bm!17598))

(assert (= (or b!173678 bm!17597) bm!17593))

(assert (= (or b!173678 bm!17598) bm!17595))

(assert (= (and d!52735 res!82450) b!173663))

(assert (= (and d!52735 c!30992) b!173677))

(assert (= (and d!52735 (not c!30992)) b!173670))

(assert (= (and d!52735 res!82446) b!173673))

(assert (= (and b!173673 res!82454) b!173672))

(assert (= (and b!173673 (not res!82451)) b!173669))

(assert (= (and b!173669 res!82449) b!173682))

(assert (= (and b!173673 res!82447) b!173680))

(assert (= (and b!173680 c!30995) b!173674))

(assert (= (and b!173680 (not c!30995)) b!173664))

(assert (= (and b!173674 res!82452) b!173665))

(assert (= (or b!173674 b!173664) bm!17596))

(assert (= (and b!173680 res!82448) b!173681))

(assert (= (and b!173681 c!30990) b!173679))

(assert (= (and b!173681 (not c!30990)) b!173667))

(assert (= (and b!173679 res!82453) b!173675))

(assert (= (or b!173679 b!173667) bm!17592))

(declare-fun b_lambda!6969 () Bool)

(assert (=> (not b_lambda!6969) (not b!173682)))

(declare-fun tb!2763 () Bool)

(declare-fun t!6994 () Bool)

(assert (=> (and b!173312 (= (defaultEntry!3597 thiss!1248) (defaultEntry!3597 lt!85779)) t!6994) tb!2763))

(declare-fun result!4583 () Bool)

(assert (=> tb!2763 (= result!4583 tp_is_empty!4081)))

(assert (=> b!173682 t!6994))

(declare-fun b_and!10777 () Bool)

(assert (= b_and!10775 (and (=> t!6994 result!4583) b_and!10777)))

(declare-fun m!202189 () Bool)

(assert (=> b!173675 m!202189))

(declare-fun m!202191 () Bool)

(assert (=> b!173678 m!202191))

(assert (=> b!173682 m!202083))

(declare-fun m!202193 () Bool)

(assert (=> b!173682 m!202193))

(assert (=> b!173682 m!202083))

(declare-fun m!202195 () Bool)

(assert (=> b!173682 m!202195))

(declare-fun m!202197 () Bool)

(assert (=> b!173682 m!202197))

(assert (=> b!173682 m!202195))

(assert (=> b!173682 m!202197))

(declare-fun m!202199 () Bool)

(assert (=> b!173682 m!202199))

(declare-fun m!202201 () Bool)

(assert (=> b!173665 m!202201))

(declare-fun m!202203 () Bool)

(assert (=> bm!17595 m!202203))

(declare-fun m!202205 () Bool)

(assert (=> bm!17593 m!202205))

(assert (=> d!52735 m!202133))

(declare-fun m!202207 () Bool)

(assert (=> b!173677 m!202207))

(declare-fun m!202209 () Bool)

(assert (=> b!173677 m!202209))

(declare-fun m!202211 () Bool)

(assert (=> b!173677 m!202211))

(declare-fun m!202213 () Bool)

(assert (=> b!173677 m!202213))

(assert (=> b!173677 m!202205))

(declare-fun m!202215 () Bool)

(assert (=> b!173677 m!202215))

(declare-fun m!202217 () Bool)

(assert (=> b!173677 m!202217))

(assert (=> b!173677 m!202083))

(declare-fun m!202219 () Bool)

(assert (=> b!173677 m!202219))

(declare-fun m!202221 () Bool)

(assert (=> b!173677 m!202221))

(assert (=> b!173677 m!202207))

(declare-fun m!202223 () Bool)

(assert (=> b!173677 m!202223))

(declare-fun m!202225 () Bool)

(assert (=> b!173677 m!202225))

(declare-fun m!202227 () Bool)

(assert (=> b!173677 m!202227))

(assert (=> b!173677 m!202221))

(declare-fun m!202229 () Bool)

(assert (=> b!173677 m!202229))

(declare-fun m!202231 () Bool)

(assert (=> b!173677 m!202231))

(declare-fun m!202233 () Bool)

(assert (=> b!173677 m!202233))

(assert (=> b!173677 m!202227))

(declare-fun m!202235 () Bool)

(assert (=> b!173677 m!202235))

(assert (=> b!173677 m!202211))

(assert (=> b!173663 m!202083))

(assert (=> b!173663 m!202083))

(assert (=> b!173663 m!202085))

(assert (=> b!173669 m!202083))

(assert (=> b!173669 m!202083))

(declare-fun m!202237 () Bool)

(assert (=> b!173669 m!202237))

(declare-fun m!202239 () Bool)

(assert (=> bm!17592 m!202239))

(declare-fun m!202241 () Bool)

(assert (=> bm!17596 m!202241))

(assert (=> b!173672 m!202083))

(assert (=> b!173672 m!202083))

(assert (=> b!173672 m!202085))

(assert (=> d!52681 d!52735))

(assert (=> d!52671 d!52717))

(declare-fun d!52737 () Bool)

(declare-fun e!114716 () Bool)

(assert (=> d!52737 e!114716))

(declare-fun res!82456 () Bool)

(assert (=> d!52737 (=> (not res!82456) (not e!114716))))

(declare-fun lt!86007 () ListLongMap!2135)

(assert (=> d!52737 (= res!82456 (contains!1149 lt!86007 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86006 () List!2188)

(assert (=> d!52737 (= lt!86007 (ListLongMap!2136 lt!86006))))

(declare-fun lt!86005 () Unit!5315)

(declare-fun lt!86004 () Unit!5315)

(assert (=> d!52737 (= lt!86005 lt!86004)))

(assert (=> d!52737 (= (getValueByKey!186 lt!86006 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52737 (= lt!86004 (lemmaContainsTupThenGetReturnValue!99 lt!86006 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52737 (= lt!86006 (insertStrictlySorted!102 (toList!1083 call!17564) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52737 (= (+!245 call!17564 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) lt!86007)))

(declare-fun b!173684 () Bool)

(declare-fun res!82455 () Bool)

(assert (=> b!173684 (=> (not res!82455) (not e!114716))))

(assert (=> b!173684 (= res!82455 (= (getValueByKey!186 (toList!1083 lt!86007) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!173685 () Bool)

(assert (=> b!173685 (= e!114716 (contains!1151 (toList!1083 lt!86007) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(assert (= (and d!52737 res!82456) b!173684))

(assert (= (and b!173684 res!82455) b!173685))

(declare-fun m!202243 () Bool)

(assert (=> d!52737 m!202243))

(declare-fun m!202245 () Bool)

(assert (=> d!52737 m!202245))

(declare-fun m!202247 () Bool)

(assert (=> d!52737 m!202247))

(declare-fun m!202249 () Bool)

(assert (=> d!52737 m!202249))

(declare-fun m!202251 () Bool)

(assert (=> b!173684 m!202251))

(declare-fun m!202253 () Bool)

(assert (=> b!173685 m!202253))

(assert (=> b!173434 d!52737))

(assert (=> b!173419 d!52695))

(declare-fun d!52739 () Bool)

(declare-fun e!114717 () Bool)

(assert (=> d!52739 e!114717))

(declare-fun res!82458 () Bool)

(assert (=> d!52739 (=> (not res!82458) (not e!114717))))

(declare-fun lt!86011 () ListLongMap!2135)

(assert (=> d!52739 (= res!82458 (contains!1149 lt!86011 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun lt!86010 () List!2188)

(assert (=> d!52739 (= lt!86011 (ListLongMap!2136 lt!86010))))

(declare-fun lt!86009 () Unit!5315)

(declare-fun lt!86008 () Unit!5315)

(assert (=> d!52739 (= lt!86009 lt!86008)))

(assert (=> d!52739 (= (getValueByKey!186 lt!86010 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!191 (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52739 (= lt!86008 (lemmaContainsTupThenGetReturnValue!99 lt!86010 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52739 (= lt!86010 (insertStrictlySorted!102 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52739 (= (+!245 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)) (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86011)))

(declare-fun b!173686 () Bool)

(declare-fun res!82457 () Bool)

(assert (=> b!173686 (=> (not res!82457) (not e!114717))))

(assert (=> b!173686 (= res!82457 (= (getValueByKey!186 (toList!1083 lt!86011) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!191 (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173687 () Bool)

(assert (=> b!173687 (= e!114717 (contains!1151 (toList!1083 lt!86011) (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52739 res!82458) b!173686))

(assert (= (and b!173686 res!82457) b!173687))

(declare-fun m!202255 () Bool)

(assert (=> d!52739 m!202255))

(declare-fun m!202257 () Bool)

(assert (=> d!52739 m!202257))

(declare-fun m!202259 () Bool)

(assert (=> d!52739 m!202259))

(declare-fun m!202261 () Bool)

(assert (=> d!52739 m!202261))

(declare-fun m!202263 () Bool)

(assert (=> b!173686 m!202263))

(declare-fun m!202265 () Bool)

(assert (=> b!173687 m!202265))

(assert (=> bm!17567 d!52739))

(declare-fun d!52741 () Bool)

(assert (=> d!52741 (= (apply!130 lt!85850 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1975 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7174 () Bool)

(assert (= bs!7174 d!52741))

(assert (=> bs!7174 m!202149))

(assert (=> bs!7174 m!202149))

(declare-fun m!202267 () Bool)

(assert (=> bs!7174 m!202267))

(assert (=> b!173431 d!52741))

(declare-fun d!52743 () Bool)

(declare-fun e!114719 () Bool)

(assert (=> d!52743 e!114719))

(declare-fun res!82459 () Bool)

(assert (=> d!52743 (=> res!82459 e!114719)))

(declare-fun lt!86014 () Bool)

(assert (=> d!52743 (= res!82459 (not lt!86014))))

(declare-fun lt!86013 () Bool)

(assert (=> d!52743 (= lt!86014 lt!86013)))

(declare-fun lt!86015 () Unit!5315)

(declare-fun e!114718 () Unit!5315)

(assert (=> d!52743 (= lt!86015 e!114718)))

(declare-fun c!30996 () Bool)

(assert (=> d!52743 (= c!30996 lt!86013)))

(assert (=> d!52743 (= lt!86013 (containsKey!189 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52743 (= (contains!1149 lt!85878 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86014)))

(declare-fun b!173688 () Bool)

(declare-fun lt!86012 () Unit!5315)

(assert (=> b!173688 (= e!114718 lt!86012)))

(assert (=> b!173688 (= lt!86012 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!173688 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173689 () Bool)

(declare-fun Unit!5327 () Unit!5315)

(assert (=> b!173689 (= e!114718 Unit!5327)))

(declare-fun b!173690 () Bool)

(assert (=> b!173690 (= e!114719 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52743 c!30996) b!173688))

(assert (= (and d!52743 (not c!30996)) b!173689))

(assert (= (and d!52743 (not res!82459)) b!173690))

(declare-fun m!202269 () Bool)

(assert (=> d!52743 m!202269))

(declare-fun m!202271 () Bool)

(assert (=> b!173688 m!202271))

(assert (=> b!173688 m!201971))

(assert (=> b!173688 m!201971))

(declare-fun m!202273 () Bool)

(assert (=> b!173688 m!202273))

(assert (=> b!173690 m!201971))

(assert (=> b!173690 m!201971))

(assert (=> b!173690 m!202273))

(assert (=> d!52669 d!52743))

(declare-fun b!173693 () Bool)

(declare-fun e!114721 () Option!192)

(assert (=> b!173693 (= e!114721 (getValueByKey!186 (t!6987 lt!85877) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173692 () Bool)

(declare-fun e!114720 () Option!192)

(assert (=> b!173692 (= e!114720 e!114721)))

(declare-fun c!30998 () Bool)

(assert (=> b!173692 (= c!30998 (and ((_ is Cons!2184) lt!85877) (not (= (_1!1612 (h!2801 lt!85877)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!173691 () Bool)

(assert (=> b!173691 (= e!114720 (Some!191 (_2!1612 (h!2801 lt!85877))))))

(declare-fun b!173694 () Bool)

(assert (=> b!173694 (= e!114721 None!190)))

(declare-fun d!52745 () Bool)

(declare-fun c!30997 () Bool)

(assert (=> d!52745 (= c!30997 (and ((_ is Cons!2184) lt!85877) (= (_1!1612 (h!2801 lt!85877)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52745 (= (getValueByKey!186 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114720)))

(assert (= (and d!52745 c!30997) b!173691))

(assert (= (and d!52745 (not c!30997)) b!173692))

(assert (= (and b!173692 c!30998) b!173693))

(assert (= (and b!173692 (not c!30998)) b!173694))

(declare-fun m!202275 () Bool)

(assert (=> b!173693 m!202275))

(assert (=> d!52669 d!52745))

(declare-fun d!52747 () Bool)

(assert (=> d!52747 (= (getValueByKey!186 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!86016 () Unit!5315)

(assert (=> d!52747 (= lt!86016 (choose!936 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!114722 () Bool)

(assert (=> d!52747 e!114722))

(declare-fun res!82460 () Bool)

(assert (=> d!52747 (=> (not res!82460) (not e!114722))))

(assert (=> d!52747 (= res!82460 (isStrictlySorted!319 lt!85877))))

(assert (=> d!52747 (= (lemmaContainsTupThenGetReturnValue!99 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86016)))

(declare-fun b!173695 () Bool)

(declare-fun res!82461 () Bool)

(assert (=> b!173695 (=> (not res!82461) (not e!114722))))

(assert (=> b!173695 (= res!82461 (containsKey!189 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173696 () Bool)

(assert (=> b!173696 (= e!114722 (contains!1151 lt!85877 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52747 res!82460) b!173695))

(assert (= (and b!173695 res!82461) b!173696))

(assert (=> d!52747 m!201965))

(declare-fun m!202277 () Bool)

(assert (=> d!52747 m!202277))

(declare-fun m!202279 () Bool)

(assert (=> d!52747 m!202279))

(declare-fun m!202281 () Bool)

(assert (=> b!173695 m!202281))

(declare-fun m!202283 () Bool)

(assert (=> b!173696 m!202283))

(assert (=> d!52669 d!52747))

(declare-fun d!52749 () Bool)

(declare-fun e!114724 () Bool)

(assert (=> d!52749 e!114724))

(declare-fun res!82462 () Bool)

(assert (=> d!52749 (=> (not res!82462) (not e!114724))))

(declare-fun lt!86017 () List!2188)

(assert (=> d!52749 (= res!82462 (isStrictlySorted!319 lt!86017))))

(declare-fun e!114727 () List!2188)

(assert (=> d!52749 (= lt!86017 e!114727)))

(declare-fun c!31001 () Bool)

(assert (=> d!52749 (= c!31001 (and ((_ is Cons!2184) (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (bvslt (_1!1612 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52749 (isStrictlySorted!319 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))))

(assert (=> d!52749 (= (insertStrictlySorted!102 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86017)))

(declare-fun b!173697 () Bool)

(declare-fun call!17602 () List!2188)

(assert (=> b!173697 (= e!114727 call!17602)))

(declare-fun bm!17599 () Bool)

(declare-fun call!17603 () List!2188)

(declare-fun call!17604 () List!2188)

(assert (=> bm!17599 (= call!17603 call!17604)))

(declare-fun b!173698 () Bool)

(assert (=> b!173698 (= e!114724 (contains!1151 lt!86017 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173699 () Bool)

(declare-fun e!114726 () List!2188)

(assert (=> b!173699 (= e!114726 call!17603)))

(declare-fun b!173700 () Bool)

(declare-fun e!114723 () List!2188)

(assert (=> b!173700 (= e!114723 (insertStrictlySorted!102 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17600 () Bool)

(assert (=> bm!17600 (= call!17602 ($colon$colon!97 e!114723 (ite c!31001 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!30999 () Bool)

(assert (=> bm!17600 (= c!30999 c!31001)))

(declare-fun b!173701 () Bool)

(declare-fun e!114725 () List!2188)

(assert (=> b!173701 (= e!114725 call!17604)))

(declare-fun b!173702 () Bool)

(assert (=> b!173702 (= e!114726 call!17603)))

(declare-fun b!173703 () Bool)

(assert (=> b!173703 (= e!114727 e!114725)))

(declare-fun c!31002 () Bool)

(assert (=> b!173703 (= c!31002 (and ((_ is Cons!2184) (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (= (_1!1612 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173704 () Bool)

(declare-fun c!31000 () Bool)

(assert (=> b!173704 (= e!114723 (ite c!31002 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (ite c!31000 (Cons!2184 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) Nil!2185)))))

(declare-fun bm!17601 () Bool)

(assert (=> bm!17601 (= call!17604 call!17602)))

(declare-fun b!173705 () Bool)

(declare-fun res!82463 () Bool)

(assert (=> b!173705 (=> (not res!82463) (not e!114724))))

(assert (=> b!173705 (= res!82463 (containsKey!189 lt!86017 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!173706 () Bool)

(assert (=> b!173706 (= c!31000 (and ((_ is Cons!2184) (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (bvsgt (_1!1612 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!173706 (= e!114725 e!114726)))

(assert (= (and d!52749 c!31001) b!173697))

(assert (= (and d!52749 (not c!31001)) b!173703))

(assert (= (and b!173703 c!31002) b!173701))

(assert (= (and b!173703 (not c!31002)) b!173706))

(assert (= (and b!173706 c!31000) b!173702))

(assert (= (and b!173706 (not c!31000)) b!173699))

(assert (= (or b!173702 b!173699) bm!17599))

(assert (= (or b!173701 bm!17599) bm!17601))

(assert (= (or b!173697 bm!17601) bm!17600))

(assert (= (and bm!17600 c!30999) b!173700))

(assert (= (and bm!17600 (not c!30999)) b!173704))

(assert (= (and d!52749 res!82462) b!173705))

(assert (= (and b!173705 res!82463) b!173698))

(declare-fun m!202285 () Bool)

(assert (=> bm!17600 m!202285))

(declare-fun m!202287 () Bool)

(assert (=> b!173700 m!202287))

(declare-fun m!202289 () Bool)

(assert (=> b!173705 m!202289))

(declare-fun m!202291 () Bool)

(assert (=> b!173698 m!202291))

(declare-fun m!202293 () Bool)

(assert (=> d!52749 m!202293))

(declare-fun m!202295 () Bool)

(assert (=> d!52749 m!202295))

(assert (=> d!52669 d!52749))

(declare-fun d!52751 () Bool)

(assert (=> d!52751 (= (apply!130 lt!85884 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1975 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7175 () Bool)

(assert (= bs!7175 d!52751))

(assert (=> bs!7175 m!202127))

(assert (=> bs!7175 m!202127))

(declare-fun m!202297 () Bool)

(assert (=> bs!7175 m!202297))

(assert (=> b!173450 d!52751))

(assert (=> d!52667 d!52717))

(declare-fun d!52753 () Bool)

(declare-fun e!114728 () Bool)

(assert (=> d!52753 e!114728))

(declare-fun res!82465 () Bool)

(assert (=> d!52753 (=> (not res!82465) (not e!114728))))

(declare-fun lt!86021 () ListLongMap!2135)

(assert (=> d!52753 (= res!82465 (contains!1149 lt!86021 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86020 () List!2188)

(assert (=> d!52753 (= lt!86021 (ListLongMap!2136 lt!86020))))

(declare-fun lt!86019 () Unit!5315)

(declare-fun lt!86018 () Unit!5315)

(assert (=> d!52753 (= lt!86019 lt!86018)))

(assert (=> d!52753 (= (getValueByKey!186 lt!86020 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(assert (=> d!52753 (= lt!86018 (lemmaContainsTupThenGetReturnValue!99 lt!86020 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(assert (=> d!52753 (= lt!86020 (insertStrictlySorted!102 (toList!1083 lt!85858) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(assert (=> d!52753 (= (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) lt!86021)))

(declare-fun b!173707 () Bool)

(declare-fun res!82464 () Bool)

(assert (=> b!173707 (=> (not res!82464) (not e!114728))))

(assert (=> b!173707 (= res!82464 (= (getValueByKey!186 (toList!1083 lt!86021) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(declare-fun b!173708 () Bool)

(assert (=> b!173708 (= e!114728 (contains!1151 (toList!1083 lt!86021) (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))

(assert (= (and d!52753 res!82465) b!173707))

(assert (= (and b!173707 res!82464) b!173708))

(declare-fun m!202299 () Bool)

(assert (=> d!52753 m!202299))

(declare-fun m!202301 () Bool)

(assert (=> d!52753 m!202301))

(declare-fun m!202303 () Bool)

(assert (=> d!52753 m!202303))

(declare-fun m!202305 () Bool)

(assert (=> d!52753 m!202305))

(declare-fun m!202307 () Bool)

(assert (=> b!173707 m!202307))

(declare-fun m!202309 () Bool)

(assert (=> b!173708 m!202309))

(assert (=> b!173433 d!52753))

(declare-fun d!52755 () Bool)

(assert (=> d!52755 (= (apply!130 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) lt!85862) (apply!130 lt!85858 lt!85862))))

(declare-fun lt!86024 () Unit!5315)

(declare-fun choose!938 (ListLongMap!2135 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5315)

(assert (=> d!52755 (= lt!86024 (choose!938 lt!85858 lt!85856 (minValue!3440 thiss!1248) lt!85862))))

(declare-fun e!114731 () Bool)

(assert (=> d!52755 e!114731))

(declare-fun res!82468 () Bool)

(assert (=> d!52755 (=> (not res!82468) (not e!114731))))

(assert (=> d!52755 (= res!82468 (contains!1149 lt!85858 lt!85862))))

(assert (=> d!52755 (= (addApplyDifferent!106 lt!85858 lt!85856 (minValue!3440 thiss!1248) lt!85862) lt!86024)))

(declare-fun b!173712 () Bool)

(assert (=> b!173712 (= e!114731 (not (= lt!85862 lt!85856)))))

(assert (= (and d!52755 res!82468) b!173712))

(assert (=> d!52755 m!201925))

(declare-fun m!202311 () Bool)

(assert (=> d!52755 m!202311))

(assert (=> d!52755 m!201925))

(assert (=> d!52755 m!201927))

(declare-fun m!202313 () Bool)

(assert (=> d!52755 m!202313))

(assert (=> d!52755 m!201935))

(assert (=> b!173433 d!52755))

(declare-fun d!52757 () Bool)

(assert (=> d!52757 (= (apply!130 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) lt!85863) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) lt!85863)))))

(declare-fun bs!7176 () Bool)

(assert (= bs!7176 d!52757))

(declare-fun m!202315 () Bool)

(assert (=> bs!7176 m!202315))

(assert (=> bs!7176 m!202315))

(declare-fun m!202317 () Bool)

(assert (=> bs!7176 m!202317))

(assert (=> b!173433 d!52757))

(declare-fun d!52759 () Bool)

(assert (=> d!52759 (contains!1149 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) lt!85859)))

(declare-fun lt!86027 () Unit!5315)

(declare-fun choose!939 (ListLongMap!2135 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5315)

(assert (=> d!52759 (= lt!86027 (choose!939 lt!85845 lt!85855 (zeroValue!3438 thiss!1248) lt!85859))))

(assert (=> d!52759 (contains!1149 lt!85845 lt!85859)))

(assert (=> d!52759 (= (addStillContains!106 lt!85845 lt!85855 (zeroValue!3438 thiss!1248) lt!85859) lt!86027)))

(declare-fun bs!7177 () Bool)

(assert (= bs!7177 d!52759))

(assert (=> bs!7177 m!201945))

(assert (=> bs!7177 m!201945))

(assert (=> bs!7177 m!201953))

(declare-fun m!202319 () Bool)

(assert (=> bs!7177 m!202319))

(declare-fun m!202321 () Bool)

(assert (=> bs!7177 m!202321))

(assert (=> b!173433 d!52759))

(declare-fun d!52761 () Bool)

(assert (=> d!52761 (= (apply!130 lt!85848 lt!85847) (get!1975 (getValueByKey!186 (toList!1083 lt!85848) lt!85847)))))

(declare-fun bs!7178 () Bool)

(assert (= bs!7178 d!52761))

(declare-fun m!202323 () Bool)

(assert (=> bs!7178 m!202323))

(assert (=> bs!7178 m!202323))

(declare-fun m!202325 () Bool)

(assert (=> bs!7178 m!202325))

(assert (=> b!173433 d!52761))

(declare-fun d!52763 () Bool)

(declare-fun e!114732 () Bool)

(assert (=> d!52763 e!114732))

(declare-fun res!82470 () Bool)

(assert (=> d!52763 (=> (not res!82470) (not e!114732))))

(declare-fun lt!86031 () ListLongMap!2135)

(assert (=> d!52763 (= res!82470 (contains!1149 lt!86031 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86030 () List!2188)

(assert (=> d!52763 (= lt!86031 (ListLongMap!2136 lt!86030))))

(declare-fun lt!86029 () Unit!5315)

(declare-fun lt!86028 () Unit!5315)

(assert (=> d!52763 (= lt!86029 lt!86028)))

(assert (=> d!52763 (= (getValueByKey!186 lt!86030 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52763 (= lt!86028 (lemmaContainsTupThenGetReturnValue!99 lt!86030 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52763 (= lt!86030 (insertStrictlySorted!102 (toList!1083 lt!85845) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52763 (= (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) lt!86031)))

(declare-fun b!173714 () Bool)

(declare-fun res!82469 () Bool)

(assert (=> b!173714 (=> (not res!82469) (not e!114732))))

(assert (=> b!173714 (= res!82469 (= (getValueByKey!186 (toList!1083 lt!86031) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173715 () Bool)

(assert (=> b!173715 (= e!114732 (contains!1151 (toList!1083 lt!86031) (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52763 res!82470) b!173714))

(assert (= (and b!173714 res!82469) b!173715))

(declare-fun m!202327 () Bool)

(assert (=> d!52763 m!202327))

(declare-fun m!202329 () Bool)

(assert (=> d!52763 m!202329))

(declare-fun m!202331 () Bool)

(assert (=> d!52763 m!202331))

(declare-fun m!202333 () Bool)

(assert (=> d!52763 m!202333))

(declare-fun m!202335 () Bool)

(assert (=> b!173714 m!202335))

(declare-fun m!202337 () Bool)

(assert (=> b!173715 m!202337))

(assert (=> b!173433 d!52763))

(declare-fun d!52765 () Bool)

(assert (=> d!52765 (= (apply!130 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) lt!85847) (apply!130 lt!85848 lt!85847))))

(declare-fun lt!86032 () Unit!5315)

(assert (=> d!52765 (= lt!86032 (choose!938 lt!85848 lt!85853 (zeroValue!3438 thiss!1248) lt!85847))))

(declare-fun e!114733 () Bool)

(assert (=> d!52765 e!114733))

(declare-fun res!82471 () Bool)

(assert (=> d!52765 (=> (not res!82471) (not e!114733))))

(assert (=> d!52765 (= res!82471 (contains!1149 lt!85848 lt!85847))))

(assert (=> d!52765 (= (addApplyDifferent!106 lt!85848 lt!85853 (zeroValue!3438 thiss!1248) lt!85847) lt!86032)))

(declare-fun b!173716 () Bool)

(assert (=> b!173716 (= e!114733 (not (= lt!85847 lt!85853)))))

(assert (= (and d!52765 res!82471) b!173716))

(assert (=> d!52765 m!201929))

(declare-fun m!202339 () Bool)

(assert (=> d!52765 m!202339))

(assert (=> d!52765 m!201929))

(assert (=> d!52765 m!201931))

(declare-fun m!202341 () Bool)

(assert (=> d!52765 m!202341))

(assert (=> d!52765 m!201937))

(assert (=> b!173433 d!52765))

(declare-fun d!52767 () Bool)

(declare-fun e!114735 () Bool)

(assert (=> d!52767 e!114735))

(declare-fun res!82472 () Bool)

(assert (=> d!52767 (=> res!82472 e!114735)))

(declare-fun lt!86035 () Bool)

(assert (=> d!52767 (= res!82472 (not lt!86035))))

(declare-fun lt!86034 () Bool)

(assert (=> d!52767 (= lt!86035 lt!86034)))

(declare-fun lt!86036 () Unit!5315)

(declare-fun e!114734 () Unit!5315)

(assert (=> d!52767 (= lt!86036 e!114734)))

(declare-fun c!31003 () Bool)

(assert (=> d!52767 (= c!31003 lt!86034)))

(assert (=> d!52767 (= lt!86034 (containsKey!189 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859))))

(assert (=> d!52767 (= (contains!1149 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) lt!85859) lt!86035)))

(declare-fun b!173717 () Bool)

(declare-fun lt!86033 () Unit!5315)

(assert (=> b!173717 (= e!114734 lt!86033)))

(assert (=> b!173717 (= lt!86033 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859))))

(assert (=> b!173717 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859))))

(declare-fun b!173718 () Bool)

(declare-fun Unit!5328 () Unit!5315)

(assert (=> b!173718 (= e!114734 Unit!5328)))

(declare-fun b!173719 () Bool)

(assert (=> b!173719 (= e!114735 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859)))))

(assert (= (and d!52767 c!31003) b!173717))

(assert (= (and d!52767 (not c!31003)) b!173718))

(assert (= (and d!52767 (not res!82472)) b!173719))

(declare-fun m!202343 () Bool)

(assert (=> d!52767 m!202343))

(declare-fun m!202345 () Bool)

(assert (=> b!173717 m!202345))

(declare-fun m!202347 () Bool)

(assert (=> b!173717 m!202347))

(assert (=> b!173717 m!202347))

(declare-fun m!202349 () Bool)

(assert (=> b!173717 m!202349))

(assert (=> b!173719 m!202347))

(assert (=> b!173719 m!202347))

(assert (=> b!173719 m!202349))

(assert (=> b!173433 d!52767))

(declare-fun d!52769 () Bool)

(declare-fun e!114736 () Bool)

(assert (=> d!52769 e!114736))

(declare-fun res!82474 () Bool)

(assert (=> d!52769 (=> (not res!82474) (not e!114736))))

(declare-fun lt!86040 () ListLongMap!2135)

(assert (=> d!52769 (= res!82474 (contains!1149 lt!86040 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86039 () List!2188)

(assert (=> d!52769 (= lt!86040 (ListLongMap!2136 lt!86039))))

(declare-fun lt!86038 () Unit!5315)

(declare-fun lt!86037 () Unit!5315)

(assert (=> d!52769 (= lt!86038 lt!86037)))

(assert (=> d!52769 (= (getValueByKey!186 lt!86039 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(assert (=> d!52769 (= lt!86037 (lemmaContainsTupThenGetReturnValue!99 lt!86039 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(assert (=> d!52769 (= lt!86039 (insertStrictlySorted!102 (toList!1083 lt!85860) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(assert (=> d!52769 (= (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) lt!86040)))

(declare-fun b!173720 () Bool)

(declare-fun res!82473 () Bool)

(assert (=> b!173720 (=> (not res!82473) (not e!114736))))

(assert (=> b!173720 (= res!82473 (= (getValueByKey!186 (toList!1083 lt!86040) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(declare-fun b!173721 () Bool)

(assert (=> b!173721 (= e!114736 (contains!1151 (toList!1083 lt!86040) (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))

(assert (= (and d!52769 res!82474) b!173720))

(assert (= (and b!173720 res!82473) b!173721))

(declare-fun m!202351 () Bool)

(assert (=> d!52769 m!202351))

(declare-fun m!202353 () Bool)

(assert (=> d!52769 m!202353))

(declare-fun m!202355 () Bool)

(assert (=> d!52769 m!202355))

(declare-fun m!202357 () Bool)

(assert (=> d!52769 m!202357))

(declare-fun m!202359 () Bool)

(assert (=> b!173720 m!202359))

(declare-fun m!202361 () Bool)

(assert (=> b!173721 m!202361))

(assert (=> b!173433 d!52769))

(declare-fun d!52771 () Bool)

(assert (=> d!52771 (= (apply!130 lt!85858 lt!85862) (get!1975 (getValueByKey!186 (toList!1083 lt!85858) lt!85862)))))

(declare-fun bs!7179 () Bool)

(assert (= bs!7179 d!52771))

(declare-fun m!202363 () Bool)

(assert (=> bs!7179 m!202363))

(assert (=> bs!7179 m!202363))

(declare-fun m!202365 () Bool)

(assert (=> bs!7179 m!202365))

(assert (=> b!173433 d!52771))

(declare-fun d!52773 () Bool)

(declare-fun e!114737 () Bool)

(assert (=> d!52773 e!114737))

(declare-fun res!82476 () Bool)

(assert (=> d!52773 (=> (not res!82476) (not e!114737))))

(declare-fun lt!86044 () ListLongMap!2135)

(assert (=> d!52773 (= res!82476 (contains!1149 lt!86044 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86043 () List!2188)

(assert (=> d!52773 (= lt!86044 (ListLongMap!2136 lt!86043))))

(declare-fun lt!86042 () Unit!5315)

(declare-fun lt!86041 () Unit!5315)

(assert (=> d!52773 (= lt!86042 lt!86041)))

(assert (=> d!52773 (= (getValueByKey!186 lt!86043 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52773 (= lt!86041 (lemmaContainsTupThenGetReturnValue!99 lt!86043 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52773 (= lt!86043 (insertStrictlySorted!102 (toList!1083 lt!85848) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52773 (= (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) lt!86044)))

(declare-fun b!173722 () Bool)

(declare-fun res!82475 () Bool)

(assert (=> b!173722 (=> (not res!82475) (not e!114737))))

(assert (=> b!173722 (= res!82475 (= (getValueByKey!186 (toList!1083 lt!86044) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173723 () Bool)

(assert (=> b!173723 (= e!114737 (contains!1151 (toList!1083 lt!86044) (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52773 res!82476) b!173722))

(assert (= (and b!173722 res!82475) b!173723))

(declare-fun m!202367 () Bool)

(assert (=> d!52773 m!202367))

(declare-fun m!202369 () Bool)

(assert (=> d!52773 m!202369))

(declare-fun m!202371 () Bool)

(assert (=> d!52773 m!202371))

(declare-fun m!202373 () Bool)

(assert (=> d!52773 m!202373))

(declare-fun m!202375 () Bool)

(assert (=> b!173722 m!202375))

(declare-fun m!202377 () Bool)

(assert (=> b!173723 m!202377))

(assert (=> b!173433 d!52773))

(declare-fun d!52775 () Bool)

(assert (=> d!52775 (= (apply!130 lt!85860 lt!85863) (get!1975 (getValueByKey!186 (toList!1083 lt!85860) lt!85863)))))

(declare-fun bs!7180 () Bool)

(assert (= bs!7180 d!52775))

(declare-fun m!202379 () Bool)

(assert (=> bs!7180 m!202379))

(assert (=> bs!7180 m!202379))

(declare-fun m!202381 () Bool)

(assert (=> bs!7180 m!202381))

(assert (=> b!173433 d!52775))

(assert (=> b!173433 d!52727))

(declare-fun d!52777 () Bool)

(assert (=> d!52777 (= (apply!130 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) lt!85862) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) lt!85862)))))

(declare-fun bs!7181 () Bool)

(assert (= bs!7181 d!52777))

(declare-fun m!202383 () Bool)

(assert (=> bs!7181 m!202383))

(assert (=> bs!7181 m!202383))

(declare-fun m!202385 () Bool)

(assert (=> bs!7181 m!202385))

(assert (=> b!173433 d!52777))

(declare-fun d!52779 () Bool)

(assert (=> d!52779 (= (apply!130 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) lt!85863) (apply!130 lt!85860 lt!85863))))

(declare-fun lt!86045 () Unit!5315)

(assert (=> d!52779 (= lt!86045 (choose!938 lt!85860 lt!85849 (minValue!3440 thiss!1248) lt!85863))))

(declare-fun e!114738 () Bool)

(assert (=> d!52779 e!114738))

(declare-fun res!82477 () Bool)

(assert (=> d!52779 (=> (not res!82477) (not e!114738))))

(assert (=> d!52779 (= res!82477 (contains!1149 lt!85860 lt!85863))))

(assert (=> d!52779 (= (addApplyDifferent!106 lt!85860 lt!85849 (minValue!3440 thiss!1248) lt!85863) lt!86045)))

(declare-fun b!173724 () Bool)

(assert (=> b!173724 (= e!114738 (not (= lt!85863 lt!85849)))))

(assert (= (and d!52779 res!82477) b!173724))

(assert (=> d!52779 m!201939))

(declare-fun m!202387 () Bool)

(assert (=> d!52779 m!202387))

(assert (=> d!52779 m!201939))

(assert (=> d!52779 m!201947))

(declare-fun m!202389 () Bool)

(assert (=> d!52779 m!202389))

(assert (=> d!52779 m!201941))

(assert (=> b!173433 d!52779))

(declare-fun d!52781 () Bool)

(assert (=> d!52781 (= (apply!130 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) lt!85847) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) lt!85847)))))

(declare-fun bs!7182 () Bool)

(assert (= bs!7182 d!52781))

(declare-fun m!202391 () Bool)

(assert (=> bs!7182 m!202391))

(assert (=> bs!7182 m!202391))

(declare-fun m!202393 () Bool)

(assert (=> bs!7182 m!202393))

(assert (=> b!173433 d!52781))

(declare-fun b!173727 () Bool)

(declare-fun e!114740 () Option!192)

(assert (=> b!173727 (= e!114740 (getValueByKey!186 (t!6987 (toList!1083 lt!85916)) (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!173726 () Bool)

(declare-fun e!114739 () Option!192)

(assert (=> b!173726 (= e!114739 e!114740)))

(declare-fun c!31005 () Bool)

(assert (=> b!173726 (= c!31005 (and ((_ is Cons!2184) (toList!1083 lt!85916)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85916))) (_1!1612 (tuple2!3203 key!828 v!309))))))))

(declare-fun b!173725 () Bool)

(assert (=> b!173725 (= e!114739 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85916)))))))

(declare-fun b!173728 () Bool)

(assert (=> b!173728 (= e!114740 None!190)))

(declare-fun c!31004 () Bool)

(declare-fun d!52783 () Bool)

(assert (=> d!52783 (= c!31004 (and ((_ is Cons!2184) (toList!1083 lt!85916)) (= (_1!1612 (h!2801 (toList!1083 lt!85916))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!52783 (= (getValueByKey!186 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))) e!114739)))

(assert (= (and d!52783 c!31004) b!173725))

(assert (= (and d!52783 (not c!31004)) b!173726))

(assert (= (and b!173726 c!31005) b!173727))

(assert (= (and b!173726 (not c!31005)) b!173728))

(declare-fun m!202395 () Bool)

(assert (=> b!173727 m!202395))

(assert (=> b!173481 d!52783))

(declare-fun b!173729 () Bool)

(declare-fun e!114741 () (_ BitVec 32))

(assert (=> b!173729 (= e!114741 #b00000000000000000000000000000000)))

(declare-fun b!173730 () Bool)

(declare-fun e!114742 () (_ BitVec 32))

(declare-fun call!17605 () (_ BitVec 32))

(assert (=> b!173730 (= e!114742 call!17605)))

(declare-fun b!173731 () Bool)

(assert (=> b!173731 (= e!114742 (bvadd #b00000000000000000000000000000001 call!17605))))

(declare-fun d!52785 () Bool)

(declare-fun lt!86046 () (_ BitVec 32))

(assert (=> d!52785 (and (bvsge lt!86046 #b00000000000000000000000000000000) (bvsle lt!86046 (bvsub (size!3757 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52785 (= lt!86046 e!114741)))

(declare-fun c!31006 () Bool)

(assert (=> d!52785 (= c!31006 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52785 (and (bvsle #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3757 (_keys!5438 thiss!1248)) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52785 (= (arrayCountValidKeys!0 (_keys!5438 thiss!1248) #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))) lt!86046)))

(declare-fun bm!17602 () Bool)

(assert (=> bm!17602 (= call!17605 (arrayCountValidKeys!0 (_keys!5438 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173732 () Bool)

(assert (=> b!173732 (= e!114741 e!114742)))

(declare-fun c!31007 () Bool)

(assert (=> b!173732 (= c!31007 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52785 c!31006) b!173729))

(assert (= (and d!52785 (not c!31006)) b!173732))

(assert (= (and b!173732 c!31007) b!173731))

(assert (= (and b!173732 (not c!31007)) b!173730))

(assert (= (or b!173731 b!173730) bm!17602))

(declare-fun m!202397 () Bool)

(assert (=> bm!17602 m!202397))

(assert (=> b!173732 m!201909))

(assert (=> b!173732 m!201909))

(assert (=> b!173732 m!201955))

(assert (=> b!173469 d!52785))

(declare-fun d!52787 () Bool)

(declare-fun e!114744 () Bool)

(assert (=> d!52787 e!114744))

(declare-fun res!82478 () Bool)

(assert (=> d!52787 (=> res!82478 e!114744)))

(declare-fun lt!86049 () Bool)

(assert (=> d!52787 (= res!82478 (not lt!86049))))

(declare-fun lt!86048 () Bool)

(assert (=> d!52787 (= lt!86049 lt!86048)))

(declare-fun lt!86050 () Unit!5315)

(declare-fun e!114743 () Unit!5315)

(assert (=> d!52787 (= lt!86050 e!114743)))

(declare-fun c!31008 () Bool)

(assert (=> d!52787 (= c!31008 lt!86048)))

(assert (=> d!52787 (= lt!86048 (containsKey!189 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52787 (= (contains!1149 lt!85884 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86049)))

(declare-fun b!173733 () Bool)

(declare-fun lt!86047 () Unit!5315)

(assert (=> b!173733 (= e!114743 lt!86047)))

(assert (=> b!173733 (= lt!86047 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173733 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173734 () Bool)

(declare-fun Unit!5329 () Unit!5315)

(assert (=> b!173734 (= e!114743 Unit!5329)))

(declare-fun b!173735 () Bool)

(assert (=> b!173735 (= e!114744 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52787 c!31008) b!173733))

(assert (= (and d!52787 (not c!31008)) b!173734))

(assert (= (and d!52787 (not res!82478)) b!173735))

(declare-fun m!202399 () Bool)

(assert (=> d!52787 m!202399))

(declare-fun m!202401 () Bool)

(assert (=> b!173733 m!202401))

(declare-fun m!202403 () Bool)

(assert (=> b!173733 m!202403))

(assert (=> b!173733 m!202403))

(declare-fun m!202405 () Bool)

(assert (=> b!173733 m!202405))

(assert (=> b!173735 m!202403))

(assert (=> b!173735 m!202403))

(assert (=> b!173735 m!202405))

(assert (=> bm!17564 d!52787))

(declare-fun d!52789 () Bool)

(declare-fun res!82483 () Bool)

(declare-fun e!114749 () Bool)

(assert (=> d!52789 (=> res!82483 e!114749)))

(assert (=> d!52789 (= res!82483 (and ((_ is Cons!2184) (toList!1083 lt!85777)) (= (_1!1612 (h!2801 (toList!1083 lt!85777))) key!828)))))

(assert (=> d!52789 (= (containsKey!189 (toList!1083 lt!85777) key!828) e!114749)))

(declare-fun b!173740 () Bool)

(declare-fun e!114750 () Bool)

(assert (=> b!173740 (= e!114749 e!114750)))

(declare-fun res!82484 () Bool)

(assert (=> b!173740 (=> (not res!82484) (not e!114750))))

(assert (=> b!173740 (= res!82484 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85777))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85777))) key!828)) ((_ is Cons!2184) (toList!1083 lt!85777)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85777))) key!828)))))

(declare-fun b!173741 () Bool)

(assert (=> b!173741 (= e!114750 (containsKey!189 (t!6987 (toList!1083 lt!85777)) key!828))))

(assert (= (and d!52789 (not res!82483)) b!173740))

(assert (= (and b!173740 res!82484) b!173741))

(declare-fun m!202407 () Bool)

(assert (=> b!173741 m!202407))

(assert (=> d!52679 d!52789))

(declare-fun lt!86051 () Bool)

(declare-fun d!52791 () Bool)

(assert (=> d!52791 (= lt!86051 (select (content!150 (toList!1083 lt!85916)) (tuple2!3203 key!828 v!309)))))

(declare-fun e!114751 () Bool)

(assert (=> d!52791 (= lt!86051 e!114751)))

(declare-fun res!82485 () Bool)

(assert (=> d!52791 (=> (not res!82485) (not e!114751))))

(assert (=> d!52791 (= res!82485 ((_ is Cons!2184) (toList!1083 lt!85916)))))

(assert (=> d!52791 (= (contains!1151 (toList!1083 lt!85916) (tuple2!3203 key!828 v!309)) lt!86051)))

(declare-fun b!173742 () Bool)

(declare-fun e!114752 () Bool)

(assert (=> b!173742 (= e!114751 e!114752)))

(declare-fun res!82486 () Bool)

(assert (=> b!173742 (=> res!82486 e!114752)))

(assert (=> b!173742 (= res!82486 (= (h!2801 (toList!1083 lt!85916)) (tuple2!3203 key!828 v!309)))))

(declare-fun b!173743 () Bool)

(assert (=> b!173743 (= e!114752 (contains!1151 (t!6987 (toList!1083 lt!85916)) (tuple2!3203 key!828 v!309)))))

(assert (= (and d!52791 res!82485) b!173742))

(assert (= (and b!173742 (not res!82486)) b!173743))

(declare-fun m!202409 () Bool)

(assert (=> d!52791 m!202409))

(declare-fun m!202411 () Bool)

(assert (=> d!52791 m!202411))

(declare-fun m!202413 () Bool)

(assert (=> b!173743 m!202413))

(assert (=> b!173482 d!52791))

(declare-fun d!52793 () Bool)

(declare-fun res!82487 () Bool)

(declare-fun e!114753 () Bool)

(assert (=> d!52793 (=> res!82487 e!114753)))

(assert (=> d!52793 (= res!82487 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52793 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5438 thiss!1248) (mask!8469 thiss!1248)) e!114753)))

(declare-fun b!173744 () Bool)

(declare-fun e!114755 () Bool)

(assert (=> b!173744 (= e!114753 e!114755)))

(declare-fun c!31009 () Bool)

(assert (=> b!173744 (= c!31009 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173745 () Bool)

(declare-fun e!114754 () Bool)

(declare-fun call!17606 () Bool)

(assert (=> b!173745 (= e!114754 call!17606)))

(declare-fun b!173746 () Bool)

(assert (=> b!173746 (= e!114755 call!17606)))

(declare-fun b!173747 () Bool)

(assert (=> b!173747 (= e!114755 e!114754)))

(declare-fun lt!86054 () (_ BitVec 64))

(assert (=> b!173747 (= lt!86054 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86052 () Unit!5315)

(assert (=> b!173747 (= lt!86052 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5438 thiss!1248) lt!86054 #b00000000000000000000000000000000))))

(assert (=> b!173747 (arrayContainsKey!0 (_keys!5438 thiss!1248) lt!86054 #b00000000000000000000000000000000)))

(declare-fun lt!86053 () Unit!5315)

(assert (=> b!173747 (= lt!86053 lt!86052)))

(declare-fun res!82488 () Bool)

(assert (=> b!173747 (= res!82488 (= (seekEntryOrOpen!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)) (Found!536 #b00000000000000000000000000000000)))))

(assert (=> b!173747 (=> (not res!82488) (not e!114754))))

(declare-fun bm!17603 () Bool)

(assert (=> bm!17603 (= call!17606 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)))))

(assert (= (and d!52793 (not res!82487)) b!173744))

(assert (= (and b!173744 c!31009) b!173747))

(assert (= (and b!173744 (not c!31009)) b!173746))

(assert (= (and b!173747 res!82488) b!173745))

(assert (= (or b!173745 b!173746) bm!17603))

(assert (=> b!173744 m!201909))

(assert (=> b!173744 m!201909))

(assert (=> b!173744 m!201955))

(assert (=> b!173747 m!201909))

(declare-fun m!202415 () Bool)

(assert (=> b!173747 m!202415))

(declare-fun m!202417 () Bool)

(assert (=> b!173747 m!202417))

(assert (=> b!173747 m!201909))

(declare-fun m!202419 () Bool)

(assert (=> b!173747 m!202419))

(declare-fun m!202421 () Bool)

(assert (=> bm!17603 m!202421))

(assert (=> b!173470 d!52793))

(declare-fun b!173748 () Bool)

(declare-fun e!114757 () ListLongMap!2135)

(assert (=> b!173748 (= e!114757 (ListLongMap!2136 Nil!2185))))

(declare-fun b!173749 () Bool)

(declare-fun e!114762 () ListLongMap!2135)

(declare-fun call!17607 () ListLongMap!2135)

(assert (=> b!173749 (= e!114762 call!17607)))

(declare-fun b!173750 () Bool)

(declare-fun lt!86056 () Unit!5315)

(declare-fun lt!86059 () Unit!5315)

(assert (=> b!173750 (= lt!86056 lt!86059)))

(declare-fun lt!86058 () ListLongMap!2135)

(declare-fun lt!86057 () V!5089)

(declare-fun lt!86060 () (_ BitVec 64))

(declare-fun lt!86061 () (_ BitVec 64))

(assert (=> b!173750 (not (contains!1149 (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057)) lt!86061))))

(assert (=> b!173750 (= lt!86059 (addStillNotContains!74 lt!86058 lt!86060 lt!86057 lt!86061))))

(assert (=> b!173750 (= lt!86061 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173750 (= lt!86057 (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173750 (= lt!86060 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!173750 (= lt!86058 call!17607)))

(assert (=> b!173750 (= e!114762 (+!245 call!17607 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173751 () Bool)

(assert (=> b!173751 (= e!114757 e!114762)))

(declare-fun c!31012 () Bool)

(assert (=> b!173751 (= c!31012 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173752 () Bool)

(declare-fun e!114759 () Bool)

(declare-fun e!114761 () Bool)

(assert (=> b!173752 (= e!114759 e!114761)))

(declare-fun c!31011 () Bool)

(declare-fun e!114758 () Bool)

(assert (=> b!173752 (= c!31011 e!114758)))

(declare-fun res!82491 () Bool)

(assert (=> b!173752 (=> (not res!82491) (not e!114758))))

(assert (=> b!173752 (= res!82491 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173753 () Bool)

(declare-fun res!82489 () Bool)

(assert (=> b!173753 (=> (not res!82489) (not e!114759))))

(declare-fun lt!86055 () ListLongMap!2135)

(assert (=> b!173753 (= res!82489 (not (contains!1149 lt!86055 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173754 () Bool)

(assert (=> b!173754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> b!173754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3758 (_values!3580 thiss!1248))))))

(declare-fun e!114756 () Bool)

(assert (=> b!173754 (= e!114756 (= (apply!130 lt!86055 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17604 () Bool)

(assert (=> bm!17604 (= call!17607 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173755 () Bool)

(declare-fun e!114760 () Bool)

(assert (=> b!173755 (= e!114760 (= lt!86055 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!173756 () Bool)

(assert (=> b!173756 (= e!114761 e!114756)))

(assert (=> b!173756 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun res!82490 () Bool)

(assert (=> b!173756 (= res!82490 (contains!1149 lt!86055 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173756 (=> (not res!82490) (not e!114756))))

(declare-fun b!173757 () Bool)

(assert (=> b!173757 (= e!114758 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173757 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!173758 () Bool)

(assert (=> b!173758 (= e!114761 e!114760)))

(declare-fun c!31013 () Bool)

(assert (=> b!173758 (= c!31013 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun d!52795 () Bool)

(assert (=> d!52795 e!114759))

(declare-fun res!82492 () Bool)

(assert (=> d!52795 (=> (not res!82492) (not e!114759))))

(assert (=> d!52795 (= res!82492 (not (contains!1149 lt!86055 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52795 (= lt!86055 e!114757)))

(declare-fun c!31010 () Bool)

(assert (=> d!52795 (= c!31010 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52795 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!52795 (= (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)) lt!86055)))

(declare-fun b!173759 () Bool)

(assert (=> b!173759 (= e!114760 (isEmpty!443 lt!86055))))

(assert (= (and d!52795 c!31010) b!173748))

(assert (= (and d!52795 (not c!31010)) b!173751))

(assert (= (and b!173751 c!31012) b!173750))

(assert (= (and b!173751 (not c!31012)) b!173749))

(assert (= (or b!173750 b!173749) bm!17604))

(assert (= (and d!52795 res!82492) b!173753))

(assert (= (and b!173753 res!82489) b!173752))

(assert (= (and b!173752 res!82491) b!173757))

(assert (= (and b!173752 c!31011) b!173756))

(assert (= (and b!173752 (not c!31011)) b!173758))

(assert (= (and b!173756 res!82490) b!173754))

(assert (= (and b!173758 c!31013) b!173755))

(assert (= (and b!173758 (not c!31013)) b!173759))

(declare-fun b_lambda!6971 () Bool)

(assert (=> (not b_lambda!6971) (not b!173750)))

(assert (=> b!173750 t!6991))

(declare-fun b_and!10779 () Bool)

(assert (= b_and!10777 (and (=> t!6991 result!4577) b_and!10779)))

(declare-fun b_lambda!6973 () Bool)

(assert (=> (not b_lambda!6973) (not b!173754)))

(assert (=> b!173754 t!6991))

(declare-fun b_and!10781 () Bool)

(assert (= b_and!10779 (and (=> t!6991 result!4577) b_and!10781)))

(assert (=> b!173756 m!201909))

(assert (=> b!173756 m!201909))

(declare-fun m!202423 () Bool)

(assert (=> b!173756 m!202423))

(assert (=> b!173754 m!201909))

(assert (=> b!173754 m!201909))

(declare-fun m!202425 () Bool)

(assert (=> b!173754 m!202425))

(assert (=> b!173754 m!201915))

(assert (=> b!173754 m!201913))

(assert (=> b!173754 m!201913))

(assert (=> b!173754 m!201915))

(assert (=> b!173754 m!201917))

(assert (=> b!173757 m!201909))

(assert (=> b!173757 m!201909))

(assert (=> b!173757 m!201955))

(declare-fun m!202427 () Bool)

(assert (=> b!173759 m!202427))

(declare-fun m!202429 () Bool)

(assert (=> bm!17604 m!202429))

(declare-fun m!202431 () Bool)

(assert (=> d!52795 m!202431))

(assert (=> d!52795 m!201893))

(declare-fun m!202433 () Bool)

(assert (=> b!173753 m!202433))

(declare-fun m!202435 () Bool)

(assert (=> b!173750 m!202435))

(assert (=> b!173750 m!201909))

(declare-fun m!202437 () Bool)

(assert (=> b!173750 m!202437))

(assert (=> b!173750 m!202437))

(declare-fun m!202439 () Bool)

(assert (=> b!173750 m!202439))

(declare-fun m!202441 () Bool)

(assert (=> b!173750 m!202441))

(assert (=> b!173750 m!201915))

(assert (=> b!173750 m!201913))

(assert (=> b!173750 m!201913))

(assert (=> b!173750 m!201915))

(assert (=> b!173750 m!201917))

(assert (=> b!173755 m!202429))

(assert (=> b!173751 m!201909))

(assert (=> b!173751 m!201909))

(assert (=> b!173751 m!201955))

(assert (=> bm!17565 d!52795))

(declare-fun d!52797 () Bool)

(declare-fun res!82495 () Bool)

(declare-fun e!114763 () Bool)

(assert (=> d!52797 (=> res!82495 e!114763)))

(assert (=> d!52797 (= res!82495 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52797 (= (arrayNoDuplicates!0 (_keys!5438 thiss!1248) #b00000000000000000000000000000000 Nil!2188) e!114763)))

(declare-fun b!173760 () Bool)

(declare-fun e!114764 () Bool)

(declare-fun e!114766 () Bool)

(assert (=> b!173760 (= e!114764 e!114766)))

(declare-fun c!31014 () Bool)

(assert (=> b!173760 (= c!31014 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173761 () Bool)

(declare-fun call!17608 () Bool)

(assert (=> b!173761 (= e!114766 call!17608)))

(declare-fun bm!17605 () Bool)

(assert (=> bm!17605 (= call!17608 (arrayNoDuplicates!0 (_keys!5438 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31014 (Cons!2187 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) Nil!2188) Nil!2188)))))

(declare-fun b!173762 () Bool)

(declare-fun e!114765 () Bool)

(assert (=> b!173762 (= e!114765 (contains!1152 Nil!2188 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173763 () Bool)

(assert (=> b!173763 (= e!114766 call!17608)))

(declare-fun b!173764 () Bool)

(assert (=> b!173764 (= e!114763 e!114764)))

(declare-fun res!82494 () Bool)

(assert (=> b!173764 (=> (not res!82494) (not e!114764))))

(assert (=> b!173764 (= res!82494 (not e!114765))))

(declare-fun res!82493 () Bool)

(assert (=> b!173764 (=> (not res!82493) (not e!114765))))

(assert (=> b!173764 (= res!82493 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!52797 (not res!82495)) b!173764))

(assert (= (and b!173764 res!82493) b!173762))

(assert (= (and b!173764 res!82494) b!173760))

(assert (= (and b!173760 c!31014) b!173761))

(assert (= (and b!173760 (not c!31014)) b!173763))

(assert (= (or b!173761 b!173763) bm!17605))

(assert (=> b!173760 m!201909))

(assert (=> b!173760 m!201909))

(assert (=> b!173760 m!201955))

(assert (=> bm!17605 m!201909))

(declare-fun m!202443 () Bool)

(assert (=> bm!17605 m!202443))

(assert (=> b!173762 m!201909))

(assert (=> b!173762 m!201909))

(declare-fun m!202445 () Bool)

(assert (=> b!173762 m!202445))

(assert (=> b!173764 m!201909))

(assert (=> b!173764 m!201909))

(assert (=> b!173764 m!201955))

(assert (=> b!173471 d!52797))

(declare-fun d!52799 () Bool)

(assert (=> d!52799 (= (apply!130 lt!85884 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1975 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7183 () Bool)

(assert (= bs!7183 d!52799))

(assert (=> bs!7183 m!201909))

(assert (=> bs!7183 m!202177))

(assert (=> bs!7183 m!202177))

(declare-fun m!202447 () Bool)

(assert (=> bs!7183 m!202447))

(assert (=> b!173467 d!52799))

(assert (=> b!173467 d!52733))

(declare-fun d!52801 () Bool)

(declare-fun e!114767 () Bool)

(assert (=> d!52801 e!114767))

(declare-fun res!82497 () Bool)

(assert (=> d!52801 (=> (not res!82497) (not e!114767))))

(declare-fun lt!86065 () ListLongMap!2135)

(assert (=> d!52801 (= res!82497 (contains!1149 lt!86065 (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun lt!86064 () List!2188)

(assert (=> d!52801 (= lt!86065 (ListLongMap!2136 lt!86064))))

(declare-fun lt!86063 () Unit!5315)

(declare-fun lt!86062 () Unit!5315)

(assert (=> d!52801 (= lt!86063 lt!86062)))

(assert (=> d!52801 (= (getValueByKey!186 lt!86064 (_1!1612 (tuple2!3203 lt!85883 v!309))) (Some!191 (_2!1612 (tuple2!3203 lt!85883 v!309))))))

(assert (=> d!52801 (= lt!86062 (lemmaContainsTupThenGetReturnValue!99 lt!86064 (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309))))))

(assert (=> d!52801 (= lt!86064 (insertStrictlySorted!102 (toList!1083 lt!85894) (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309))))))

(assert (=> d!52801 (= (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)) lt!86065)))

(declare-fun b!173765 () Bool)

(declare-fun res!82496 () Bool)

(assert (=> b!173765 (=> (not res!82496) (not e!114767))))

(assert (=> b!173765 (= res!82496 (= (getValueByKey!186 (toList!1083 lt!86065) (_1!1612 (tuple2!3203 lt!85883 v!309))) (Some!191 (_2!1612 (tuple2!3203 lt!85883 v!309)))))))

(declare-fun b!173766 () Bool)

(assert (=> b!173766 (= e!114767 (contains!1151 (toList!1083 lt!86065) (tuple2!3203 lt!85883 v!309)))))

(assert (= (and d!52801 res!82497) b!173765))

(assert (= (and b!173765 res!82496) b!173766))

(declare-fun m!202449 () Bool)

(assert (=> d!52801 m!202449))

(declare-fun m!202451 () Bool)

(assert (=> d!52801 m!202451))

(declare-fun m!202453 () Bool)

(assert (=> d!52801 m!202453))

(declare-fun m!202455 () Bool)

(assert (=> d!52801 m!202455))

(declare-fun m!202457 () Bool)

(assert (=> b!173765 m!202457))

(declare-fun m!202459 () Bool)

(assert (=> b!173766 m!202459))

(assert (=> b!173462 d!52801))

(declare-fun d!52803 () Bool)

(assert (=> d!52803 (contains!1149 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) lt!85893)))

(declare-fun lt!86066 () Unit!5315)

(assert (=> d!52803 (= lt!86066 (choose!939 lt!85879 lt!85889 (zeroValue!3438 thiss!1248) lt!85893))))

(assert (=> d!52803 (contains!1149 lt!85879 lt!85893)))

(assert (=> d!52803 (= (addStillContains!106 lt!85879 lt!85889 (zeroValue!3438 thiss!1248) lt!85893) lt!86066)))

(declare-fun bs!7184 () Bool)

(assert (= bs!7184 d!52803))

(assert (=> bs!7184 m!202007))

(assert (=> bs!7184 m!202007))

(assert (=> bs!7184 m!202015))

(declare-fun m!202461 () Bool)

(assert (=> bs!7184 m!202461))

(declare-fun m!202463 () Bool)

(assert (=> bs!7184 m!202463))

(assert (=> b!173462 d!52803))

(declare-fun d!52805 () Bool)

(assert (=> d!52805 (= (apply!130 lt!85892 lt!85896) (get!1975 (getValueByKey!186 (toList!1083 lt!85892) lt!85896)))))

(declare-fun bs!7185 () Bool)

(assert (= bs!7185 d!52805))

(declare-fun m!202465 () Bool)

(assert (=> bs!7185 m!202465))

(assert (=> bs!7185 m!202465))

(declare-fun m!202467 () Bool)

(assert (=> bs!7185 m!202467))

(assert (=> b!173462 d!52805))

(declare-fun d!52807 () Bool)

(declare-fun e!114768 () Bool)

(assert (=> d!52807 e!114768))

(declare-fun res!82499 () Bool)

(assert (=> d!52807 (=> (not res!82499) (not e!114768))))

(declare-fun lt!86070 () ListLongMap!2135)

(assert (=> d!52807 (= res!82499 (contains!1149 lt!86070 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86069 () List!2188)

(assert (=> d!52807 (= lt!86070 (ListLongMap!2136 lt!86069))))

(declare-fun lt!86068 () Unit!5315)

(declare-fun lt!86067 () Unit!5315)

(assert (=> d!52807 (= lt!86068 lt!86067)))

(assert (=> d!52807 (= (getValueByKey!186 lt!86069 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52807 (= lt!86067 (lemmaContainsTupThenGetReturnValue!99 lt!86069 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52807 (= lt!86069 (insertStrictlySorted!102 (toList!1083 lt!85879) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52807 (= (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) lt!86070)))

(declare-fun b!173767 () Bool)

(declare-fun res!82498 () Bool)

(assert (=> b!173767 (=> (not res!82498) (not e!114768))))

(assert (=> b!173767 (= res!82498 (= (getValueByKey!186 (toList!1083 lt!86070) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173768 () Bool)

(assert (=> b!173768 (= e!114768 (contains!1151 (toList!1083 lt!86070) (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52807 res!82499) b!173767))

(assert (= (and b!173767 res!82498) b!173768))

(declare-fun m!202469 () Bool)

(assert (=> d!52807 m!202469))

(declare-fun m!202471 () Bool)

(assert (=> d!52807 m!202471))

(declare-fun m!202473 () Bool)

(assert (=> d!52807 m!202473))

(declare-fun m!202475 () Bool)

(assert (=> d!52807 m!202475))

(declare-fun m!202477 () Bool)

(assert (=> b!173767 m!202477))

(declare-fun m!202479 () Bool)

(assert (=> b!173768 m!202479))

(assert (=> b!173462 d!52807))

(declare-fun d!52809 () Bool)

(assert (=> d!52809 (= (apply!130 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)) lt!85896) (apply!130 lt!85892 lt!85896))))

(declare-fun lt!86071 () Unit!5315)

(assert (=> d!52809 (= lt!86071 (choose!938 lt!85892 lt!85890 v!309 lt!85896))))

(declare-fun e!114769 () Bool)

(assert (=> d!52809 e!114769))

(declare-fun res!82500 () Bool)

(assert (=> d!52809 (=> (not res!82500) (not e!114769))))

(assert (=> d!52809 (= res!82500 (contains!1149 lt!85892 lt!85896))))

(assert (=> d!52809 (= (addApplyDifferent!106 lt!85892 lt!85890 v!309 lt!85896) lt!86071)))

(declare-fun b!173769 () Bool)

(assert (=> b!173769 (= e!114769 (not (= lt!85896 lt!85890)))))

(assert (= (and d!52809 res!82500) b!173769))

(assert (=> d!52809 m!201987))

(declare-fun m!202481 () Bool)

(assert (=> d!52809 m!202481))

(assert (=> d!52809 m!201987))

(assert (=> d!52809 m!201989))

(declare-fun m!202483 () Bool)

(assert (=> d!52809 m!202483))

(assert (=> d!52809 m!201997))

(assert (=> b!173462 d!52809))

(declare-fun d!52811 () Bool)

(assert (=> d!52811 (= (apply!130 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)) lt!85896) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309))) lt!85896)))))

(declare-fun bs!7186 () Bool)

(assert (= bs!7186 d!52811))

(declare-fun m!202485 () Bool)

(assert (=> bs!7186 m!202485))

(assert (=> bs!7186 m!202485))

(declare-fun m!202487 () Bool)

(assert (=> bs!7186 m!202487))

(assert (=> b!173462 d!52811))

(declare-fun d!52813 () Bool)

(assert (=> d!52813 (= (apply!130 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) lt!85881) (apply!130 lt!85882 lt!85881))))

(declare-fun lt!86072 () Unit!5315)

(assert (=> d!52813 (= lt!86072 (choose!938 lt!85882 lt!85887 (zeroValue!3438 thiss!1248) lt!85881))))

(declare-fun e!114770 () Bool)

(assert (=> d!52813 e!114770))

(declare-fun res!82501 () Bool)

(assert (=> d!52813 (=> (not res!82501) (not e!114770))))

(assert (=> d!52813 (= res!82501 (contains!1149 lt!85882 lt!85881))))

(assert (=> d!52813 (= (addApplyDifferent!106 lt!85882 lt!85887 (zeroValue!3438 thiss!1248) lt!85881) lt!86072)))

(declare-fun b!173770 () Bool)

(assert (=> b!173770 (= e!114770 (not (= lt!85881 lt!85887)))))

(assert (= (and d!52813 res!82501) b!173770))

(assert (=> d!52813 m!201991))

(declare-fun m!202489 () Bool)

(assert (=> d!52813 m!202489))

(assert (=> d!52813 m!201991))

(assert (=> d!52813 m!201993))

(declare-fun m!202491 () Bool)

(assert (=> d!52813 m!202491))

(assert (=> d!52813 m!201999))

(assert (=> b!173462 d!52813))

(declare-fun d!52815 () Bool)

(declare-fun e!114771 () Bool)

(assert (=> d!52815 e!114771))

(declare-fun res!82503 () Bool)

(assert (=> d!52815 (=> (not res!82503) (not e!114771))))

(declare-fun lt!86076 () ListLongMap!2135)

(assert (=> d!52815 (= res!82503 (contains!1149 lt!86076 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86075 () List!2188)

(assert (=> d!52815 (= lt!86076 (ListLongMap!2136 lt!86075))))

(declare-fun lt!86074 () Unit!5315)

(declare-fun lt!86073 () Unit!5315)

(assert (=> d!52815 (= lt!86074 lt!86073)))

(assert (=> d!52815 (= (getValueByKey!186 lt!86075 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52815 (= lt!86073 (lemmaContainsTupThenGetReturnValue!99 lt!86075 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52815 (= lt!86075 (insertStrictlySorted!102 (toList!1083 lt!85882) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52815 (= (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) lt!86076)))

(declare-fun b!173771 () Bool)

(declare-fun res!82502 () Bool)

(assert (=> b!173771 (=> (not res!82502) (not e!114771))))

(assert (=> b!173771 (= res!82502 (= (getValueByKey!186 (toList!1083 lt!86076) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173772 () Bool)

(assert (=> b!173772 (= e!114771 (contains!1151 (toList!1083 lt!86076) (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52815 res!82503) b!173771))

(assert (= (and b!173771 res!82502) b!173772))

(declare-fun m!202493 () Bool)

(assert (=> d!52815 m!202493))

(declare-fun m!202495 () Bool)

(assert (=> d!52815 m!202495))

(declare-fun m!202497 () Bool)

(assert (=> d!52815 m!202497))

(declare-fun m!202499 () Bool)

(assert (=> d!52815 m!202499))

(declare-fun m!202501 () Bool)

(assert (=> b!173771 m!202501))

(declare-fun m!202503 () Bool)

(assert (=> b!173772 m!202503))

(assert (=> b!173462 d!52815))

(declare-fun d!52817 () Bool)

(assert (=> d!52817 (= (apply!130 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)) lt!85897) (apply!130 lt!85894 lt!85897))))

(declare-fun lt!86077 () Unit!5315)

(assert (=> d!52817 (= lt!86077 (choose!938 lt!85894 lt!85883 v!309 lt!85897))))

(declare-fun e!114772 () Bool)

(assert (=> d!52817 e!114772))

(declare-fun res!82504 () Bool)

(assert (=> d!52817 (=> (not res!82504) (not e!114772))))

(assert (=> d!52817 (= res!82504 (contains!1149 lt!85894 lt!85897))))

(assert (=> d!52817 (= (addApplyDifferent!106 lt!85894 lt!85883 v!309 lt!85897) lt!86077)))

(declare-fun b!173773 () Bool)

(assert (=> b!173773 (= e!114772 (not (= lt!85897 lt!85883)))))

(assert (= (and d!52817 res!82504) b!173773))

(assert (=> d!52817 m!202001))

(declare-fun m!202505 () Bool)

(assert (=> d!52817 m!202505))

(assert (=> d!52817 m!202001))

(assert (=> d!52817 m!202009))

(declare-fun m!202507 () Bool)

(assert (=> d!52817 m!202507))

(assert (=> d!52817 m!202003))

(assert (=> b!173462 d!52817))

(declare-fun d!52819 () Bool)

(assert (=> d!52819 (= (apply!130 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) lt!85881) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) lt!85881)))))

(declare-fun bs!7187 () Bool)

(assert (= bs!7187 d!52819))

(declare-fun m!202509 () Bool)

(assert (=> bs!7187 m!202509))

(assert (=> bs!7187 m!202509))

(declare-fun m!202511 () Bool)

(assert (=> bs!7187 m!202511))

(assert (=> b!173462 d!52819))

(assert (=> b!173462 d!52795))

(declare-fun d!52821 () Bool)

(declare-fun e!114774 () Bool)

(assert (=> d!52821 e!114774))

(declare-fun res!82505 () Bool)

(assert (=> d!52821 (=> res!82505 e!114774)))

(declare-fun lt!86080 () Bool)

(assert (=> d!52821 (= res!82505 (not lt!86080))))

(declare-fun lt!86079 () Bool)

(assert (=> d!52821 (= lt!86080 lt!86079)))

(declare-fun lt!86081 () Unit!5315)

(declare-fun e!114773 () Unit!5315)

(assert (=> d!52821 (= lt!86081 e!114773)))

(declare-fun c!31015 () Bool)

(assert (=> d!52821 (= c!31015 lt!86079)))

(assert (=> d!52821 (= lt!86079 (containsKey!189 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893))))

(assert (=> d!52821 (= (contains!1149 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) lt!85893) lt!86080)))

(declare-fun b!173774 () Bool)

(declare-fun lt!86078 () Unit!5315)

(assert (=> b!173774 (= e!114773 lt!86078)))

(assert (=> b!173774 (= lt!86078 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893))))

(assert (=> b!173774 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893))))

(declare-fun b!173775 () Bool)

(declare-fun Unit!5330 () Unit!5315)

(assert (=> b!173775 (= e!114773 Unit!5330)))

(declare-fun b!173776 () Bool)

(assert (=> b!173776 (= e!114774 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893)))))

(assert (= (and d!52821 c!31015) b!173774))

(assert (= (and d!52821 (not c!31015)) b!173775))

(assert (= (and d!52821 (not res!82505)) b!173776))

(declare-fun m!202513 () Bool)

(assert (=> d!52821 m!202513))

(declare-fun m!202515 () Bool)

(assert (=> b!173774 m!202515))

(declare-fun m!202517 () Bool)

(assert (=> b!173774 m!202517))

(assert (=> b!173774 m!202517))

(declare-fun m!202519 () Bool)

(assert (=> b!173774 m!202519))

(assert (=> b!173776 m!202517))

(assert (=> b!173776 m!202517))

(assert (=> b!173776 m!202519))

(assert (=> b!173462 d!52821))

(declare-fun d!52823 () Bool)

(assert (=> d!52823 (= (apply!130 lt!85882 lt!85881) (get!1975 (getValueByKey!186 (toList!1083 lt!85882) lt!85881)))))

(declare-fun bs!7188 () Bool)

(assert (= bs!7188 d!52823))

(declare-fun m!202521 () Bool)

(assert (=> bs!7188 m!202521))

(assert (=> bs!7188 m!202521))

(declare-fun m!202523 () Bool)

(assert (=> bs!7188 m!202523))

(assert (=> b!173462 d!52823))

(declare-fun d!52825 () Bool)

(assert (=> d!52825 (= (apply!130 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)) lt!85897) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309))) lt!85897)))))

(declare-fun bs!7189 () Bool)

(assert (= bs!7189 d!52825))

(declare-fun m!202525 () Bool)

(assert (=> bs!7189 m!202525))

(assert (=> bs!7189 m!202525))

(declare-fun m!202527 () Bool)

(assert (=> bs!7189 m!202527))

(assert (=> b!173462 d!52825))

(declare-fun d!52827 () Bool)

(declare-fun e!114775 () Bool)

(assert (=> d!52827 e!114775))

(declare-fun res!82507 () Bool)

(assert (=> d!52827 (=> (not res!82507) (not e!114775))))

(declare-fun lt!86085 () ListLongMap!2135)

(assert (=> d!52827 (= res!82507 (contains!1149 lt!86085 (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun lt!86084 () List!2188)

(assert (=> d!52827 (= lt!86085 (ListLongMap!2136 lt!86084))))

(declare-fun lt!86083 () Unit!5315)

(declare-fun lt!86082 () Unit!5315)

(assert (=> d!52827 (= lt!86083 lt!86082)))

(assert (=> d!52827 (= (getValueByKey!186 lt!86084 (_1!1612 (tuple2!3203 lt!85890 v!309))) (Some!191 (_2!1612 (tuple2!3203 lt!85890 v!309))))))

(assert (=> d!52827 (= lt!86082 (lemmaContainsTupThenGetReturnValue!99 lt!86084 (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309))))))

(assert (=> d!52827 (= lt!86084 (insertStrictlySorted!102 (toList!1083 lt!85892) (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309))))))

(assert (=> d!52827 (= (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)) lt!86085)))

(declare-fun b!173777 () Bool)

(declare-fun res!82506 () Bool)

(assert (=> b!173777 (=> (not res!82506) (not e!114775))))

(assert (=> b!173777 (= res!82506 (= (getValueByKey!186 (toList!1083 lt!86085) (_1!1612 (tuple2!3203 lt!85890 v!309))) (Some!191 (_2!1612 (tuple2!3203 lt!85890 v!309)))))))

(declare-fun b!173778 () Bool)

(assert (=> b!173778 (= e!114775 (contains!1151 (toList!1083 lt!86085) (tuple2!3203 lt!85890 v!309)))))

(assert (= (and d!52827 res!82507) b!173777))

(assert (= (and b!173777 res!82506) b!173778))

(declare-fun m!202529 () Bool)

(assert (=> d!52827 m!202529))

(declare-fun m!202531 () Bool)

(assert (=> d!52827 m!202531))

(declare-fun m!202533 () Bool)

(assert (=> d!52827 m!202533))

(declare-fun m!202535 () Bool)

(assert (=> d!52827 m!202535))

(declare-fun m!202537 () Bool)

(assert (=> b!173777 m!202537))

(declare-fun m!202539 () Bool)

(assert (=> b!173778 m!202539))

(assert (=> b!173462 d!52827))

(declare-fun d!52829 () Bool)

(assert (=> d!52829 (= (apply!130 lt!85894 lt!85897) (get!1975 (getValueByKey!186 (toList!1083 lt!85894) lt!85897)))))

(declare-fun bs!7190 () Bool)

(assert (= bs!7190 d!52829))

(declare-fun m!202541 () Bool)

(assert (=> bs!7190 m!202541))

(assert (=> bs!7190 m!202541))

(declare-fun m!202543 () Bool)

(assert (=> bs!7190 m!202543))

(assert (=> b!173462 d!52829))

(declare-fun d!52831 () Bool)

(declare-fun e!114777 () Bool)

(assert (=> d!52831 e!114777))

(declare-fun res!82508 () Bool)

(assert (=> d!52831 (=> res!82508 e!114777)))

(declare-fun lt!86088 () Bool)

(assert (=> d!52831 (= res!82508 (not lt!86088))))

(declare-fun lt!86087 () Bool)

(assert (=> d!52831 (= lt!86088 lt!86087)))

(declare-fun lt!86089 () Unit!5315)

(declare-fun e!114776 () Unit!5315)

(assert (=> d!52831 (= lt!86089 e!114776)))

(declare-fun c!31016 () Bool)

(assert (=> d!52831 (= c!31016 lt!86087)))

(assert (=> d!52831 (= lt!86087 (containsKey!189 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52831 (= (contains!1149 lt!85850 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86088)))

(declare-fun b!173779 () Bool)

(declare-fun lt!86086 () Unit!5315)

(assert (=> b!173779 (= e!114776 lt!86086)))

(assert (=> b!173779 (= lt!86086 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173779 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173780 () Bool)

(declare-fun Unit!5331 () Unit!5315)

(assert (=> b!173780 (= e!114776 Unit!5331)))

(declare-fun b!173781 () Bool)

(assert (=> b!173781 (= e!114777 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52831 c!31016) b!173779))

(assert (= (and d!52831 (not c!31016)) b!173780))

(assert (= (and d!52831 (not res!82508)) b!173781))

(declare-fun m!202545 () Bool)

(assert (=> d!52831 m!202545))

(declare-fun m!202547 () Bool)

(assert (=> b!173779 m!202547))

(assert (=> b!173779 m!202119))

(assert (=> b!173779 m!202119))

(declare-fun m!202549 () Bool)

(assert (=> b!173779 m!202549))

(assert (=> b!173781 m!202119))

(assert (=> b!173781 m!202119))

(assert (=> b!173781 m!202549))

(assert (=> bm!17561 d!52831))

(declare-fun d!52833 () Bool)

(declare-fun e!114778 () Bool)

(assert (=> d!52833 e!114778))

(declare-fun res!82510 () Bool)

(assert (=> d!52833 (=> (not res!82510) (not e!114778))))

(declare-fun lt!86093 () ListLongMap!2135)

(assert (=> d!52833 (= res!82510 (contains!1149 lt!86093 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!86092 () List!2188)

(assert (=> d!52833 (= lt!86093 (ListLongMap!2136 lt!86092))))

(declare-fun lt!86091 () Unit!5315)

(declare-fun lt!86090 () Unit!5315)

(assert (=> d!52833 (= lt!86091 lt!86090)))

(assert (=> d!52833 (= (getValueByKey!186 lt!86092 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52833 (= lt!86090 (lemmaContainsTupThenGetReturnValue!99 lt!86092 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52833 (= lt!86092 (insertStrictlySorted!102 (toList!1083 call!17571) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!52833 (= (+!245 call!17571 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!86093)))

(declare-fun b!173782 () Bool)

(declare-fun res!82509 () Bool)

(assert (=> b!173782 (=> (not res!82509) (not e!114778))))

(assert (=> b!173782 (= res!82509 (= (getValueByKey!186 (toList!1083 lt!86093) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173783 () Bool)

(assert (=> b!173783 (= e!114778 (contains!1151 (toList!1083 lt!86093) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!52833 res!82510) b!173782))

(assert (= (and b!173782 res!82509) b!173783))

(declare-fun m!202551 () Bool)

(assert (=> d!52833 m!202551))

(declare-fun m!202553 () Bool)

(assert (=> d!52833 m!202553))

(declare-fun m!202555 () Bool)

(assert (=> d!52833 m!202555))

(declare-fun m!202557 () Bool)

(assert (=> d!52833 m!202557))

(declare-fun m!202559 () Bool)

(assert (=> b!173782 m!202559))

(declare-fun m!202561 () Bool)

(assert (=> b!173783 m!202561))

(assert (=> b!173463 d!52833))

(assert (=> b!173448 d!52695))

(assert (=> b!173428 d!52695))

(declare-fun d!52835 () Bool)

(declare-fun res!82511 () Bool)

(declare-fun e!114779 () Bool)

(assert (=> d!52835 (=> (not res!82511) (not e!114779))))

(assert (=> d!52835 (= res!82511 (validMask!0 (mask!8469 thiss!1248)))))

(assert (=> d!52835 (= (simpleValid!144 thiss!1248) e!114779)))

(declare-fun b!173784 () Bool)

(declare-fun res!82513 () Bool)

(assert (=> b!173784 (=> (not res!82513) (not e!114779))))

(assert (=> b!173784 (= res!82513 (and (= (size!3758 (_values!3580 thiss!1248)) (bvadd (mask!8469 thiss!1248) #b00000000000000000000000000000001)) (= (size!3757 (_keys!5438 thiss!1248)) (size!3758 (_values!3580 thiss!1248))) (bvsge (_size!1200 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1200 thiss!1248) (bvadd (mask!8469 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!173786 () Bool)

(declare-fun res!82514 () Bool)

(assert (=> b!173786 (=> (not res!82514) (not e!114779))))

(assert (=> b!173786 (= res!82514 (= (size!3763 thiss!1248) (bvadd (_size!1200 thiss!1248) (bvsdiv (bvadd (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!173785 () Bool)

(declare-fun res!82512 () Bool)

(assert (=> b!173785 (=> (not res!82512) (not e!114779))))

(assert (=> b!173785 (= res!82512 (bvsge (size!3763 thiss!1248) (_size!1200 thiss!1248)))))

(declare-fun b!173787 () Bool)

(assert (=> b!173787 (= e!114779 (and (bvsge (extraKeys!3336 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3336 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1200 thiss!1248) #b00000000000000000000000000000000)))))

(assert (= (and d!52835 res!82511) b!173784))

(assert (= (and b!173784 res!82513) b!173785))

(assert (= (and b!173785 res!82512) b!173786))

(assert (= (and b!173786 res!82514) b!173787))

(assert (=> d!52835 m!201893))

(declare-fun m!202563 () Bool)

(assert (=> b!173786 m!202563))

(assert (=> b!173785 m!202563))

(assert (=> d!52673 d!52835))

(assert (=> b!173480 d!52701))

(assert (=> b!173480 d!52703))

(declare-fun d!52837 () Bool)

(assert (=> d!52837 (= (apply!130 lt!85884 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1975 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7191 () Bool)

(assert (= bs!7191 d!52837))

(assert (=> bs!7191 m!202403))

(assert (=> bs!7191 m!202403))

(declare-fun m!202565 () Bool)

(assert (=> bs!7191 m!202565))

(assert (=> b!173460 d!52837))

(declare-fun d!52839 () Bool)

(declare-fun e!114781 () Bool)

(assert (=> d!52839 e!114781))

(declare-fun res!82515 () Bool)

(assert (=> d!52839 (=> res!82515 e!114781)))

(declare-fun lt!86096 () Bool)

(assert (=> d!52839 (= res!82515 (not lt!86096))))

(declare-fun lt!86095 () Bool)

(assert (=> d!52839 (= lt!86096 lt!86095)))

(declare-fun lt!86097 () Unit!5315)

(declare-fun e!114780 () Unit!5315)

(assert (=> d!52839 (= lt!86097 e!114780)))

(declare-fun c!31017 () Bool)

(assert (=> d!52839 (= c!31017 lt!86095)))

(assert (=> d!52839 (= lt!86095 (containsKey!189 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52839 (= (contains!1149 lt!85850 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) lt!86096)))

(declare-fun b!173788 () Bool)

(declare-fun lt!86094 () Unit!5315)

(assert (=> b!173788 (= e!114780 lt!86094)))

(assert (=> b!173788 (= lt!86094 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173788 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173789 () Bool)

(declare-fun Unit!5332 () Unit!5315)

(assert (=> b!173789 (= e!114780 Unit!5332)))

(declare-fun b!173790 () Bool)

(assert (=> b!173790 (= e!114781 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52839 c!31017) b!173788))

(assert (= (and d!52839 (not c!31017)) b!173789))

(assert (= (and d!52839 (not res!82515)) b!173790))

(assert (=> d!52839 m!201909))

(declare-fun m!202567 () Bool)

(assert (=> d!52839 m!202567))

(assert (=> b!173788 m!201909))

(declare-fun m!202569 () Bool)

(assert (=> b!173788 m!202569))

(assert (=> b!173788 m!201909))

(assert (=> b!173788 m!202181))

(assert (=> b!173788 m!202181))

(declare-fun m!202571 () Bool)

(assert (=> b!173788 m!202571))

(assert (=> b!173790 m!201909))

(assert (=> b!173790 m!202181))

(assert (=> b!173790 m!202181))

(assert (=> b!173790 m!202571))

(assert (=> b!173425 d!52839))

(declare-fun mapIsEmpty!6958 () Bool)

(declare-fun mapRes!6958 () Bool)

(assert (=> mapIsEmpty!6958 mapRes!6958))

(declare-fun mapNonEmpty!6958 () Bool)

(declare-fun tp!15607 () Bool)

(declare-fun e!114782 () Bool)

(assert (=> mapNonEmpty!6958 (= mapRes!6958 (and tp!15607 e!114782))))

(declare-fun mapKey!6958 () (_ BitVec 32))

(declare-fun mapRest!6958 () (Array (_ BitVec 32) ValueCell!1697))

(declare-fun mapValue!6958 () ValueCell!1697)

(assert (=> mapNonEmpty!6958 (= mapRest!6957 (store mapRest!6958 mapKey!6958 mapValue!6958))))

(declare-fun condMapEmpty!6958 () Bool)

(declare-fun mapDefault!6958 () ValueCell!1697)

(assert (=> mapNonEmpty!6957 (= condMapEmpty!6958 (= mapRest!6957 ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6958)))))

(declare-fun e!114783 () Bool)

(assert (=> mapNonEmpty!6957 (= tp!15606 (and e!114783 mapRes!6958))))

(declare-fun b!173792 () Bool)

(assert (=> b!173792 (= e!114783 tp_is_empty!4081)))

(declare-fun b!173791 () Bool)

(assert (=> b!173791 (= e!114782 tp_is_empty!4081)))

(assert (= (and mapNonEmpty!6957 condMapEmpty!6958) mapIsEmpty!6958))

(assert (= (and mapNonEmpty!6957 (not condMapEmpty!6958)) mapNonEmpty!6958))

(assert (= (and mapNonEmpty!6958 ((_ is ValueCellFull!1697) mapValue!6958)) b!173791))

(assert (= (and mapNonEmpty!6957 ((_ is ValueCellFull!1697) mapDefault!6958)) b!173792))

(declare-fun m!202573 () Bool)

(assert (=> mapNonEmpty!6958 m!202573))

(declare-fun b_lambda!6975 () Bool)

(assert (= b_lambda!6967 (or (and b!173312 b_free!4309) b_lambda!6975)))

(declare-fun b_lambda!6977 () Bool)

(assert (= b_lambda!6973 (or (and b!173312 b_free!4309) b_lambda!6977)))

(declare-fun b_lambda!6979 () Bool)

(assert (= b_lambda!6971 (or (and b!173312 b_free!4309) b_lambda!6979)))

(declare-fun b_lambda!6981 () Bool)

(assert (= b_lambda!6965 (or (and b!173312 b_free!4309) b_lambda!6981)))

(check-sat (not d!52741) (not d!52729) (not d!52819) (not b!173696) (not b_lambda!6981) (not b!173682) (not bm!17604) (not d!52699) (not b!173663) (not b!173717) (not b!173685) (not b!173615) (not d!52829) (not b_next!4309) (not b!173648) (not bm!17596) (not d!52775) (not b!173756) (not b!173535) (not b!173602) (not b!173707) (not b!173614) (not b!173575) (not d!52823) (not b!173743) (not d!52787) (not b!173550) (not b!173768) (not d!52753) (not bm!17595) (not b_lambda!6963) (not d!52805) (not bm!17588) (not b!173777) (not b!173677) (not b!173750) (not d!52721) (not b!173491) (not b!173754) (not d!52821) (not b!173578) (not b!173687) (not d!52833) (not b!173511) tp_is_empty!4081 (not d!52817) (not b!173767) (not b!173649) (not d!52705) (not d!52777) (not b!173561) (not d!52795) (not b!173764) (not b!173540) (not b!173553) (not d!52759) (not b!173766) (not b!173693) (not b!173772) (not b!173790) (not b!173645) (not d!52731) (not d!52747) (not b!173651) (not b!173559) (not b!173771) (not d!52801) (not d!52773) (not b!173779) (not d!52839) (not b!173583) (not d!52735) (not d!52743) (not b!173698) (not b!173783) (not b!173723) (not b!173644) (not mapNonEmpty!6958) (not d!52835) (not b!173733) (not b!173719) (not b!173722) (not d!52825) (not d!52749) (not b!173686) (not d!52751) (not d!52719) (not b!173656) (not b!173695) (not b!173510) (not b!173721) (not d!52737) (not bm!17578) (not b!173650) (not d!52757) (not bm!17605) (not b!173647) (not d!52827) (not b!173765) (not b_lambda!6977) (not bm!17600) (not b!173533) (not b!173762) (not b!173757) (not b!173675) (not b!173781) (not d!52715) (not b!173573) (not b!173774) (not d!52771) (not d!52779) (not b!173751) (not b!173759) (not d!52755) (not d!52799) (not b!173715) (not b_lambda!6961) (not b!173705) (not b!173732) (not b!173700) (not b!173653) (not b_lambda!6969) (not b!173760) (not d!52811) (not b!173617) (not b!173665) (not bm!17592) (not b!173577) (not b!173720) (not d!52803) (not d!52727) (not d!52837) (not d!52687) (not b!173688) (not b!173778) (not b!173755) (not bm!17591) (not b!173654) (not b!173714) (not b!173788) (not b!173661) (not d!52807) (not bm!17585) (not b!173776) (not b!173662) (not b!173785) (not d!52691) (not b!173562) (not d!52809) (not d!52767) (not b!173669) (not bm!17603) (not b!173595) (not bm!17602) (not b!173735) (not d!52739) (not b!173504) b_and!10781 (not d!52701) (not b!173753) (not d!52765) (not b!173684) (not bm!17582) (not b!173672) (not b_lambda!6975) (not d!52791) (not d!52761) (not d!52769) (not d!52763) (not b!173678) (not b!173741) (not b!173786) (not d!52711) (not b!173594) (not d!52709) (not d!52781) (not b!173690) (not b_lambda!6979) (not b!173727) (not b!173782) (not b!173493) (not b!173747) (not b!173708) (not d!52815) (not d!52813) (not bm!17593) (not d!52693) (not d!52725) (not b!173580) (not b!173744) (not b!173556) (not d!52831))
(check-sat b_and!10781 (not b_next!4309))
(get-model)

(declare-fun d!52841 () Bool)

(declare-fun lt!86098 () Bool)

(assert (=> d!52841 (= lt!86098 (select (content!150 lt!85877) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!114784 () Bool)

(assert (=> d!52841 (= lt!86098 e!114784)))

(declare-fun res!82516 () Bool)

(assert (=> d!52841 (=> (not res!82516) (not e!114784))))

(assert (=> d!52841 (= res!82516 ((_ is Cons!2184) lt!85877))))

(assert (=> d!52841 (= (contains!1151 lt!85877 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86098)))

(declare-fun b!173793 () Bool)

(declare-fun e!114785 () Bool)

(assert (=> b!173793 (= e!114784 e!114785)))

(declare-fun res!82517 () Bool)

(assert (=> b!173793 (=> res!82517 e!114785)))

(assert (=> b!173793 (= res!82517 (= (h!2801 lt!85877) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!173794 () Bool)

(assert (=> b!173794 (= e!114785 (contains!1151 (t!6987 lt!85877) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!52841 res!82516) b!173793))

(assert (= (and b!173793 (not res!82517)) b!173794))

(declare-fun m!202575 () Bool)

(assert (=> d!52841 m!202575))

(declare-fun m!202577 () Bool)

(assert (=> d!52841 m!202577))

(declare-fun m!202579 () Bool)

(assert (=> b!173794 m!202579))

(assert (=> b!173696 d!52841))

(declare-fun lt!86099 () Bool)

(declare-fun d!52843 () Bool)

(assert (=> d!52843 (= lt!86099 (select (content!150 (toList!1083 lt!86076)) (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))

(declare-fun e!114786 () Bool)

(assert (=> d!52843 (= lt!86099 e!114786)))

(declare-fun res!82518 () Bool)

(assert (=> d!52843 (=> (not res!82518) (not e!114786))))

(assert (=> d!52843 (= res!82518 ((_ is Cons!2184) (toList!1083 lt!86076)))))

(assert (=> d!52843 (= (contains!1151 (toList!1083 lt!86076) (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) lt!86099)))

(declare-fun b!173795 () Bool)

(declare-fun e!114787 () Bool)

(assert (=> b!173795 (= e!114786 e!114787)))

(declare-fun res!82519 () Bool)

(assert (=> b!173795 (=> res!82519 e!114787)))

(assert (=> b!173795 (= res!82519 (= (h!2801 (toList!1083 lt!86076)) (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))

(declare-fun b!173796 () Bool)

(assert (=> b!173796 (= e!114787 (contains!1151 (t!6987 (toList!1083 lt!86076)) (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52843 res!82518) b!173795))

(assert (= (and b!173795 (not res!82519)) b!173796))

(declare-fun m!202581 () Bool)

(assert (=> d!52843 m!202581))

(declare-fun m!202583 () Bool)

(assert (=> d!52843 m!202583))

(declare-fun m!202585 () Bool)

(assert (=> b!173796 m!202585))

(assert (=> b!173772 d!52843))

(declare-fun d!52845 () Bool)

(assert (=> d!52845 (= (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!173577 d!52845))

(declare-fun d!52847 () Bool)

(assert (=> d!52847 (= (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893)) (not (isEmpty!442 (getValueByKey!186 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893))))))

(declare-fun bs!7192 () Bool)

(assert (= bs!7192 d!52847))

(assert (=> bs!7192 m!202517))

(declare-fun m!202587 () Bool)

(assert (=> bs!7192 m!202587))

(assert (=> b!173776 d!52847))

(declare-fun e!114789 () Option!192)

(declare-fun b!173799 () Bool)

(assert (=> b!173799 (= e!114789 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))) lt!85893))))

(declare-fun b!173798 () Bool)

(declare-fun e!114788 () Option!192)

(assert (=> b!173798 (= e!114788 e!114789)))

(declare-fun c!31019 () Bool)

(assert (=> b!173798 (= c!31019 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))) lt!85893))))))

(declare-fun b!173797 () Bool)

(assert (=> b!173797 (= e!114788 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))))

(declare-fun b!173800 () Bool)

(assert (=> b!173800 (= e!114789 None!190)))

(declare-fun d!52849 () Bool)

(declare-fun c!31018 () Bool)

(assert (=> d!52849 (= c!31018 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))) lt!85893)))))

(assert (=> d!52849 (= (getValueByKey!186 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893) e!114788)))

(assert (= (and d!52849 c!31018) b!173797))

(assert (= (and d!52849 (not c!31018)) b!173798))

(assert (= (and b!173798 c!31019) b!173799))

(assert (= (and b!173798 (not c!31019)) b!173800))

(declare-fun m!202589 () Bool)

(assert (=> b!173799 m!202589))

(assert (=> b!173776 d!52849))

(declare-fun d!52851 () Bool)

(declare-fun res!82520 () Bool)

(declare-fun e!114790 () Bool)

(assert (=> d!52851 (=> res!82520 e!114790)))

(assert (=> d!52851 (= res!82520 (and ((_ is Cons!2184) lt!85915) (= (_1!1612 (h!2801 lt!85915)) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!52851 (= (containsKey!189 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309))) e!114790)))

(declare-fun b!173801 () Bool)

(declare-fun e!114791 () Bool)

(assert (=> b!173801 (= e!114790 e!114791)))

(declare-fun res!82521 () Bool)

(assert (=> b!173801 (=> (not res!82521) (not e!114791))))

(assert (=> b!173801 (= res!82521 (and (or (not ((_ is Cons!2184) lt!85915)) (bvsle (_1!1612 (h!2801 lt!85915)) (_1!1612 (tuple2!3203 key!828 v!309)))) ((_ is Cons!2184) lt!85915) (bvslt (_1!1612 (h!2801 lt!85915)) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!173802 () Bool)

(assert (=> b!173802 (= e!114791 (containsKey!189 (t!6987 lt!85915) (_1!1612 (tuple2!3203 key!828 v!309))))))

(assert (= (and d!52851 (not res!82520)) b!173801))

(assert (= (and b!173801 res!82521) b!173802))

(declare-fun m!202591 () Bool)

(assert (=> b!173802 m!202591))

(assert (=> b!173510 d!52851))

(declare-fun d!52853 () Bool)

(declare-fun e!114793 () Bool)

(assert (=> d!52853 e!114793))

(declare-fun res!82522 () Bool)

(assert (=> d!52853 (=> res!82522 e!114793)))

(declare-fun lt!86102 () Bool)

(assert (=> d!52853 (= res!82522 (not lt!86102))))

(declare-fun lt!86101 () Bool)

(assert (=> d!52853 (= lt!86102 lt!86101)))

(declare-fun lt!86103 () Unit!5315)

(declare-fun e!114792 () Unit!5315)

(assert (=> d!52853 (= lt!86103 e!114792)))

(declare-fun c!31020 () Bool)

(assert (=> d!52853 (= c!31020 lt!86101)))

(assert (=> d!52853 (= lt!86101 (containsKey!189 (toList!1083 lt!86055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52853 (= (contains!1149 lt!86055 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86102)))

(declare-fun b!173803 () Bool)

(declare-fun lt!86100 () Unit!5315)

(assert (=> b!173803 (= e!114792 lt!86100)))

(assert (=> b!173803 (= lt!86100 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173803 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86055) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173804 () Bool)

(declare-fun Unit!5333 () Unit!5315)

(assert (=> b!173804 (= e!114792 Unit!5333)))

(declare-fun b!173805 () Bool)

(assert (=> b!173805 (= e!114793 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86055) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52853 c!31020) b!173803))

(assert (= (and d!52853 (not c!31020)) b!173804))

(assert (= (and d!52853 (not res!82522)) b!173805))

(declare-fun m!202593 () Bool)

(assert (=> d!52853 m!202593))

(declare-fun m!202595 () Bool)

(assert (=> b!173803 m!202595))

(declare-fun m!202597 () Bool)

(assert (=> b!173803 m!202597))

(assert (=> b!173803 m!202597))

(declare-fun m!202599 () Bool)

(assert (=> b!173803 m!202599))

(assert (=> b!173805 m!202597))

(assert (=> b!173805 m!202597))

(assert (=> b!173805 m!202599))

(assert (=> d!52795 d!52853))

(assert (=> d!52795 d!52717))

(declare-fun d!52855 () Bool)

(declare-fun isEmpty!444 (List!2188) Bool)

(assert (=> d!52855 (= (isEmpty!443 lt!85971) (isEmpty!444 (toList!1083 lt!85971)))))

(declare-fun bs!7193 () Bool)

(assert (= bs!7193 d!52855))

(declare-fun m!202601 () Bool)

(assert (=> bs!7193 m!202601))

(assert (=> b!173653 d!52855))

(declare-fun d!52857 () Bool)

(assert (=> d!52857 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3957 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52837 d!52857))

(declare-fun b!173808 () Bool)

(declare-fun e!114795 () Option!192)

(assert (=> b!173808 (= e!114795 (getValueByKey!186 (t!6987 (toList!1083 lt!85884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173807 () Bool)

(declare-fun e!114794 () Option!192)

(assert (=> b!173807 (= e!114794 e!114795)))

(declare-fun c!31022 () Bool)

(assert (=> b!173807 (= c!31022 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85884))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173806 () Bool)

(assert (=> b!173806 (= e!114794 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85884)))))))

(declare-fun b!173809 () Bool)

(assert (=> b!173809 (= e!114795 None!190)))

(declare-fun d!52859 () Bool)

(declare-fun c!31021 () Bool)

(assert (=> d!52859 (= c!31021 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (= (_1!1612 (h!2801 (toList!1083 lt!85884))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52859 (= (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000) e!114794)))

(assert (= (and d!52859 c!31021) b!173806))

(assert (= (and d!52859 (not c!31021)) b!173807))

(assert (= (and b!173807 c!31022) b!173808))

(assert (= (and b!173807 (not c!31022)) b!173809))

(declare-fun m!202603 () Bool)

(assert (=> b!173808 m!202603))

(assert (=> d!52837 d!52859))

(declare-fun d!52861 () Bool)

(assert (=> d!52861 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!3957 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52741 d!52861))

(declare-fun b!173812 () Bool)

(declare-fun e!114797 () Option!192)

(assert (=> b!173812 (= e!114797 (getValueByKey!186 (t!6987 (toList!1083 lt!85850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173811 () Bool)

(declare-fun e!114796 () Option!192)

(assert (=> b!173811 (= e!114796 e!114797)))

(declare-fun c!31024 () Bool)

(assert (=> b!173811 (= c!31024 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85850))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173810 () Bool)

(assert (=> b!173810 (= e!114796 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85850)))))))

(declare-fun b!173813 () Bool)

(assert (=> b!173813 (= e!114797 None!190)))

(declare-fun d!52863 () Bool)

(declare-fun c!31023 () Bool)

(assert (=> d!52863 (= c!31023 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (= (_1!1612 (h!2801 (toList!1083 lt!85850))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52863 (= (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000) e!114796)))

(assert (= (and d!52863 c!31023) b!173810))

(assert (= (and d!52863 (not c!31023)) b!173811))

(assert (= (and b!173811 c!31024) b!173812))

(assert (= (and b!173811 (not c!31024)) b!173813))

(declare-fun m!202605 () Bool)

(assert (=> b!173812 m!202605))

(assert (=> d!52741 d!52863))

(assert (=> d!52755 d!52753))

(assert (=> d!52755 d!52777))

(declare-fun d!52865 () Bool)

(declare-fun e!114799 () Bool)

(assert (=> d!52865 e!114799))

(declare-fun res!82523 () Bool)

(assert (=> d!52865 (=> res!82523 e!114799)))

(declare-fun lt!86106 () Bool)

(assert (=> d!52865 (= res!82523 (not lt!86106))))

(declare-fun lt!86105 () Bool)

(assert (=> d!52865 (= lt!86106 lt!86105)))

(declare-fun lt!86107 () Unit!5315)

(declare-fun e!114798 () Unit!5315)

(assert (=> d!52865 (= lt!86107 e!114798)))

(declare-fun c!31025 () Bool)

(assert (=> d!52865 (= c!31025 lt!86105)))

(assert (=> d!52865 (= lt!86105 (containsKey!189 (toList!1083 lt!85858) lt!85862))))

(assert (=> d!52865 (= (contains!1149 lt!85858 lt!85862) lt!86106)))

(declare-fun b!173814 () Bool)

(declare-fun lt!86104 () Unit!5315)

(assert (=> b!173814 (= e!114798 lt!86104)))

(assert (=> b!173814 (= lt!86104 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85858) lt!85862))))

(assert (=> b!173814 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85858) lt!85862))))

(declare-fun b!173815 () Bool)

(declare-fun Unit!5334 () Unit!5315)

(assert (=> b!173815 (= e!114798 Unit!5334)))

(declare-fun b!173816 () Bool)

(assert (=> b!173816 (= e!114799 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85858) lt!85862)))))

(assert (= (and d!52865 c!31025) b!173814))

(assert (= (and d!52865 (not c!31025)) b!173815))

(assert (= (and d!52865 (not res!82523)) b!173816))

(declare-fun m!202607 () Bool)

(assert (=> d!52865 m!202607))

(declare-fun m!202609 () Bool)

(assert (=> b!173814 m!202609))

(assert (=> b!173814 m!202363))

(assert (=> b!173814 m!202363))

(declare-fun m!202611 () Bool)

(assert (=> b!173814 m!202611))

(assert (=> b!173816 m!202363))

(assert (=> b!173816 m!202363))

(assert (=> b!173816 m!202611))

(assert (=> d!52755 d!52865))

(assert (=> d!52755 d!52771))

(declare-fun d!52867 () Bool)

(assert (=> d!52867 (= (apply!130 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) lt!85862) (apply!130 lt!85858 lt!85862))))

(assert (=> d!52867 true))

(declare-fun _$34!1055 () Unit!5315)

(assert (=> d!52867 (= (choose!938 lt!85858 lt!85856 (minValue!3440 thiss!1248) lt!85862) _$34!1055)))

(declare-fun bs!7194 () Bool)

(assert (= bs!7194 d!52867))

(assert (=> bs!7194 m!201925))

(assert (=> bs!7194 m!201925))

(assert (=> bs!7194 m!201927))

(assert (=> bs!7194 m!201935))

(assert (=> d!52755 d!52867))

(declare-fun d!52869 () Bool)

(assert (=> d!52869 (= (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309))) lt!85897)) (v!3957 (getValueByKey!186 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309))) lt!85897)))))

(assert (=> d!52825 d!52869))

(declare-fun b!173820 () Bool)

(declare-fun e!114801 () Option!192)

(assert (=> b!173820 (= e!114801 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)))) lt!85897))))

(declare-fun b!173819 () Bool)

(declare-fun e!114800 () Option!192)

(assert (=> b!173819 (= e!114800 e!114801)))

(declare-fun c!31027 () Bool)

(assert (=> b!173819 (= c!31027 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309))))) lt!85897))))))

(declare-fun b!173818 () Bool)

(assert (=> b!173818 (= e!114800 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)))))))))

(declare-fun b!173821 () Bool)

(assert (=> b!173821 (= e!114801 None!190)))

(declare-fun c!31026 () Bool)

(declare-fun d!52871 () Bool)

(assert (=> d!52871 (= c!31026 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309))))) lt!85897)))))

(assert (=> d!52871 (= (getValueByKey!186 (toList!1083 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309))) lt!85897) e!114800)))

(assert (= (and d!52871 c!31026) b!173818))

(assert (= (and d!52871 (not c!31026)) b!173819))

(assert (= (and b!173819 c!31027) b!173820))

(assert (= (and b!173819 (not c!31027)) b!173821))

(declare-fun m!202613 () Bool)

(assert (=> b!173820 m!202613))

(assert (=> d!52825 d!52871))

(declare-fun lt!86108 () Bool)

(declare-fun d!52873 () Bool)

(assert (=> d!52873 (= lt!86108 (select (content!150 (toList!1083 lt!86031)) (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))

(declare-fun e!114802 () Bool)

(assert (=> d!52873 (= lt!86108 e!114802)))

(declare-fun res!82524 () Bool)

(assert (=> d!52873 (=> (not res!82524) (not e!114802))))

(assert (=> d!52873 (= res!82524 ((_ is Cons!2184) (toList!1083 lt!86031)))))

(assert (=> d!52873 (= (contains!1151 (toList!1083 lt!86031) (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) lt!86108)))

(declare-fun b!173822 () Bool)

(declare-fun e!114803 () Bool)

(assert (=> b!173822 (= e!114802 e!114803)))

(declare-fun res!82525 () Bool)

(assert (=> b!173822 (=> res!82525 e!114803)))

(assert (=> b!173822 (= res!82525 (= (h!2801 (toList!1083 lt!86031)) (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))

(declare-fun b!173823 () Bool)

(assert (=> b!173823 (= e!114803 (contains!1151 (t!6987 (toList!1083 lt!86031)) (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!52873 res!82524) b!173822))

(assert (= (and b!173822 (not res!82525)) b!173823))

(declare-fun m!202615 () Bool)

(assert (=> d!52873 m!202615))

(declare-fun m!202617 () Bool)

(assert (=> d!52873 m!202617))

(declare-fun m!202619 () Bool)

(assert (=> b!173823 m!202619))

(assert (=> b!173715 d!52873))

(declare-fun d!52875 () Bool)

(declare-fun res!82526 () Bool)

(declare-fun e!114804 () Bool)

(assert (=> d!52875 (=> res!82526 e!114804)))

(assert (=> d!52875 (= res!82526 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (= (_1!1612 (h!2801 (toList!1083 lt!85884))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52875 (= (containsKey!189 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000) e!114804)))

(declare-fun b!173824 () Bool)

(declare-fun e!114805 () Bool)

(assert (=> b!173824 (= e!114804 e!114805)))

(declare-fun res!82527 () Bool)

(assert (=> b!173824 (=> (not res!82527) (not e!114805))))

(assert (=> b!173824 (= res!82527 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85884))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85884))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2184) (toList!1083 lt!85884)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85884))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173825 () Bool)

(assert (=> b!173825 (= e!114805 (containsKey!189 (t!6987 (toList!1083 lt!85884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52875 (not res!82526)) b!173824))

(assert (= (and b!173824 res!82527) b!173825))

(declare-fun m!202621 () Bool)

(assert (=> b!173825 m!202621))

(assert (=> d!52711 d!52875))

(assert (=> b!173757 d!52695))

(assert (=> b!173760 d!52695))

(declare-fun d!52877 () Bool)

(assert (=> d!52877 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86109 () Unit!5315)

(assert (=> d!52877 (= lt!86109 (choose!937 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114806 () Bool)

(assert (=> d!52877 e!114806))

(declare-fun res!82528 () Bool)

(assert (=> d!52877 (=> (not res!82528) (not e!114806))))

(assert (=> d!52877 (= res!82528 (isStrictlySorted!319 (toList!1083 lt!85850)))))

(assert (=> d!52877 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000) lt!86109)))

(declare-fun b!173826 () Bool)

(assert (=> b!173826 (= e!114806 (containsKey!189 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52877 res!82528) b!173826))

(assert (=> d!52877 m!202119))

(assert (=> d!52877 m!202119))

(assert (=> d!52877 m!202549))

(declare-fun m!202623 () Bool)

(assert (=> d!52877 m!202623))

(declare-fun m!202625 () Bool)

(assert (=> d!52877 m!202625))

(assert (=> b!173826 m!202545))

(assert (=> b!173779 d!52877))

(declare-fun d!52879 () Bool)

(assert (=> d!52879 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7195 () Bool)

(assert (= bs!7195 d!52879))

(assert (=> bs!7195 m!202119))

(declare-fun m!202627 () Bool)

(assert (=> bs!7195 m!202627))

(assert (=> b!173779 d!52879))

(declare-fun b!173829 () Bool)

(declare-fun e!114808 () Option!192)

(assert (=> b!173829 (= e!114808 (getValueByKey!186 (t!6987 (toList!1083 lt!85850)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173828 () Bool)

(declare-fun e!114807 () Option!192)

(assert (=> b!173828 (= e!114807 e!114808)))

(declare-fun c!31029 () Bool)

(assert (=> b!173828 (= c!31029 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85850))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!173827 () Bool)

(assert (=> b!173827 (= e!114807 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85850)))))))

(declare-fun b!173830 () Bool)

(assert (=> b!173830 (= e!114808 None!190)))

(declare-fun d!52881 () Bool)

(declare-fun c!31028 () Bool)

(assert (=> d!52881 (= c!31028 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (= (_1!1612 (h!2801 (toList!1083 lt!85850))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52881 (= (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000) e!114807)))

(assert (= (and d!52881 c!31028) b!173827))

(assert (= (and d!52881 (not c!31028)) b!173828))

(assert (= (and b!173828 c!31029) b!173829))

(assert (= (and b!173828 (not c!31029)) b!173830))

(declare-fun m!202629 () Bool)

(assert (=> b!173829 m!202629))

(assert (=> b!173779 d!52881))

(declare-fun d!52883 () Bool)

(declare-fun e!114810 () Bool)

(assert (=> d!52883 e!114810))

(declare-fun res!82529 () Bool)

(assert (=> d!52883 (=> res!82529 e!114810)))

(declare-fun lt!86112 () Bool)

(assert (=> d!52883 (= res!82529 (not lt!86112))))

(declare-fun lt!86111 () Bool)

(assert (=> d!52883 (= lt!86112 lt!86111)))

(declare-fun lt!86113 () Unit!5315)

(declare-fun e!114809 () Unit!5315)

(assert (=> d!52883 (= lt!86113 e!114809)))

(declare-fun c!31030 () Bool)

(assert (=> d!52883 (= c!31030 lt!86111)))

(assert (=> d!52883 (= lt!86111 (containsKey!189 (toList!1083 lt!86007) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> d!52883 (= (contains!1149 lt!86007 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!86112)))

(declare-fun b!173831 () Bool)

(declare-fun lt!86110 () Unit!5315)

(assert (=> b!173831 (= e!114809 lt!86110)))

(assert (=> b!173831 (= lt!86110 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86007) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (=> b!173831 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86007) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173832 () Bool)

(declare-fun Unit!5335 () Unit!5315)

(assert (=> b!173832 (= e!114809 Unit!5335)))

(declare-fun b!173833 () Bool)

(assert (=> b!173833 (= e!114810 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86007) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (= (and d!52883 c!31030) b!173831))

(assert (= (and d!52883 (not c!31030)) b!173832))

(assert (= (and d!52883 (not res!82529)) b!173833))

(declare-fun m!202631 () Bool)

(assert (=> d!52883 m!202631))

(declare-fun m!202633 () Bool)

(assert (=> b!173831 m!202633))

(assert (=> b!173831 m!202251))

(assert (=> b!173831 m!202251))

(declare-fun m!202635 () Bool)

(assert (=> b!173831 m!202635))

(assert (=> b!173833 m!202251))

(assert (=> b!173833 m!202251))

(assert (=> b!173833 m!202635))

(assert (=> d!52737 d!52883))

(declare-fun b!173836 () Bool)

(declare-fun e!114812 () Option!192)

(assert (=> b!173836 (= e!114812 (getValueByKey!186 (t!6987 lt!86006) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173835 () Bool)

(declare-fun e!114811 () Option!192)

(assert (=> b!173835 (= e!114811 e!114812)))

(declare-fun c!31032 () Bool)

(assert (=> b!173835 (= c!31032 (and ((_ is Cons!2184) lt!86006) (not (= (_1!1612 (h!2801 lt!86006)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!173834 () Bool)

(assert (=> b!173834 (= e!114811 (Some!191 (_2!1612 (h!2801 lt!86006))))))

(declare-fun b!173837 () Bool)

(assert (=> b!173837 (= e!114812 None!190)))

(declare-fun d!52885 () Bool)

(declare-fun c!31031 () Bool)

(assert (=> d!52885 (= c!31031 (and ((_ is Cons!2184) lt!86006) (= (_1!1612 (h!2801 lt!86006)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52885 (= (getValueByKey!186 lt!86006 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) e!114811)))

(assert (= (and d!52885 c!31031) b!173834))

(assert (= (and d!52885 (not c!31031)) b!173835))

(assert (= (and b!173835 c!31032) b!173836))

(assert (= (and b!173835 (not c!31032)) b!173837))

(declare-fun m!202637 () Bool)

(assert (=> b!173836 m!202637))

(assert (=> d!52737 d!52885))

(declare-fun d!52887 () Bool)

(assert (=> d!52887 (= (getValueByKey!186 lt!86006 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86114 () Unit!5315)

(assert (=> d!52887 (= lt!86114 (choose!936 lt!86006 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun e!114813 () Bool)

(assert (=> d!52887 e!114813))

(declare-fun res!82530 () Bool)

(assert (=> d!52887 (=> (not res!82530) (not e!114813))))

(assert (=> d!52887 (= res!82530 (isStrictlySorted!319 lt!86006))))

(assert (=> d!52887 (= (lemmaContainsTupThenGetReturnValue!99 lt!86006 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!86114)))

(declare-fun b!173838 () Bool)

(declare-fun res!82531 () Bool)

(assert (=> b!173838 (=> (not res!82531) (not e!114813))))

(assert (=> b!173838 (= res!82531 (containsKey!189 lt!86006 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173839 () Bool)

(assert (=> b!173839 (= e!114813 (contains!1151 lt!86006 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (= (and d!52887 res!82530) b!173838))

(assert (= (and b!173838 res!82531) b!173839))

(assert (=> d!52887 m!202245))

(declare-fun m!202639 () Bool)

(assert (=> d!52887 m!202639))

(declare-fun m!202641 () Bool)

(assert (=> d!52887 m!202641))

(declare-fun m!202643 () Bool)

(assert (=> b!173838 m!202643))

(declare-fun m!202645 () Bool)

(assert (=> b!173839 m!202645))

(assert (=> d!52737 d!52887))

(declare-fun d!52889 () Bool)

(declare-fun e!114815 () Bool)

(assert (=> d!52889 e!114815))

(declare-fun res!82532 () Bool)

(assert (=> d!52889 (=> (not res!82532) (not e!114815))))

(declare-fun lt!86115 () List!2188)

(assert (=> d!52889 (= res!82532 (isStrictlySorted!319 lt!86115))))

(declare-fun e!114818 () List!2188)

(assert (=> d!52889 (= lt!86115 e!114818)))

(declare-fun c!31035 () Bool)

(assert (=> d!52889 (= c!31035 (and ((_ is Cons!2184) (toList!1083 call!17564)) (bvslt (_1!1612 (h!2801 (toList!1083 call!17564))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52889 (isStrictlySorted!319 (toList!1083 call!17564))))

(assert (=> d!52889 (= (insertStrictlySorted!102 (toList!1083 call!17564) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!86115)))

(declare-fun b!173840 () Bool)

(declare-fun call!17609 () List!2188)

(assert (=> b!173840 (= e!114818 call!17609)))

(declare-fun bm!17606 () Bool)

(declare-fun call!17610 () List!2188)

(declare-fun call!17611 () List!2188)

(assert (=> bm!17606 (= call!17610 call!17611)))

(declare-fun b!173841 () Bool)

(assert (=> b!173841 (= e!114815 (contains!1151 lt!86115 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!173842 () Bool)

(declare-fun e!114817 () List!2188)

(assert (=> b!173842 (= e!114817 call!17610)))

(declare-fun b!173843 () Bool)

(declare-fun e!114814 () List!2188)

(assert (=> b!173843 (= e!114814 (insertStrictlySorted!102 (t!6987 (toList!1083 call!17564)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun bm!17607 () Bool)

(assert (=> bm!17607 (= call!17609 ($colon$colon!97 e!114814 (ite c!31035 (h!2801 (toList!1083 call!17564)) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun c!31033 () Bool)

(assert (=> bm!17607 (= c!31033 c!31035)))

(declare-fun b!173844 () Bool)

(declare-fun e!114816 () List!2188)

(assert (=> b!173844 (= e!114816 call!17611)))

(declare-fun b!173845 () Bool)

(assert (=> b!173845 (= e!114817 call!17610)))

(declare-fun b!173846 () Bool)

(assert (=> b!173846 (= e!114818 e!114816)))

(declare-fun c!31036 () Bool)

(assert (=> b!173846 (= c!31036 (and ((_ is Cons!2184) (toList!1083 call!17564)) (= (_1!1612 (h!2801 (toList!1083 call!17564))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!173847 () Bool)

(declare-fun c!31034 () Bool)

(assert (=> b!173847 (= e!114814 (ite c!31036 (t!6987 (toList!1083 call!17564)) (ite c!31034 (Cons!2184 (h!2801 (toList!1083 call!17564)) (t!6987 (toList!1083 call!17564))) Nil!2185)))))

(declare-fun bm!17608 () Bool)

(assert (=> bm!17608 (= call!17611 call!17609)))

(declare-fun b!173848 () Bool)

(declare-fun res!82533 () Bool)

(assert (=> b!173848 (=> (not res!82533) (not e!114815))))

(assert (=> b!173848 (= res!82533 (containsKey!189 lt!86115 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173849 () Bool)

(assert (=> b!173849 (= c!31034 (and ((_ is Cons!2184) (toList!1083 call!17564)) (bvsgt (_1!1612 (h!2801 (toList!1083 call!17564))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> b!173849 (= e!114816 e!114817)))

(assert (= (and d!52889 c!31035) b!173840))

(assert (= (and d!52889 (not c!31035)) b!173846))

(assert (= (and b!173846 c!31036) b!173844))

(assert (= (and b!173846 (not c!31036)) b!173849))

(assert (= (and b!173849 c!31034) b!173845))

(assert (= (and b!173849 (not c!31034)) b!173842))

(assert (= (or b!173845 b!173842) bm!17606))

(assert (= (or b!173844 bm!17606) bm!17608))

(assert (= (or b!173840 bm!17608) bm!17607))

(assert (= (and bm!17607 c!31033) b!173843))

(assert (= (and bm!17607 (not c!31033)) b!173847))

(assert (= (and d!52889 res!82532) b!173848))

(assert (= (and b!173848 res!82533) b!173841))

(declare-fun m!202647 () Bool)

(assert (=> bm!17607 m!202647))

(declare-fun m!202649 () Bool)

(assert (=> b!173843 m!202649))

(declare-fun m!202651 () Bool)

(assert (=> b!173848 m!202651))

(declare-fun m!202653 () Bool)

(assert (=> b!173841 m!202653))

(declare-fun m!202655 () Bool)

(assert (=> d!52889 m!202655))

(declare-fun m!202657 () Bool)

(assert (=> d!52889 m!202657))

(assert (=> d!52737 d!52889))

(declare-fun b!173850 () Bool)

(declare-fun e!114820 () ListLongMap!2135)

(assert (=> b!173850 (= e!114820 (ListLongMap!2136 Nil!2185))))

(declare-fun b!173851 () Bool)

(declare-fun e!114825 () ListLongMap!2135)

(declare-fun call!17612 () ListLongMap!2135)

(assert (=> b!173851 (= e!114825 call!17612)))

(declare-fun b!173852 () Bool)

(declare-fun lt!86117 () Unit!5315)

(declare-fun lt!86120 () Unit!5315)

(assert (=> b!173852 (= lt!86117 lt!86120)))

(declare-fun lt!86118 () V!5089)

(declare-fun lt!86122 () (_ BitVec 64))

(declare-fun lt!86119 () ListLongMap!2135)

(declare-fun lt!86121 () (_ BitVec 64))

(assert (=> b!173852 (not (contains!1149 (+!245 lt!86119 (tuple2!3203 lt!86121 lt!86118)) lt!86122))))

(assert (=> b!173852 (= lt!86120 (addStillNotContains!74 lt!86119 lt!86121 lt!86118 lt!86122))))

(assert (=> b!173852 (= lt!86122 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!173852 (= lt!86118 (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!173852 (= lt!86121 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!173852 (= lt!86119 call!17612)))

(assert (=> b!173852 (= e!114825 (+!245 call!17612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!173853 () Bool)

(assert (=> b!173853 (= e!114820 e!114825)))

(declare-fun c!31039 () Bool)

(assert (=> b!173853 (= c!31039 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!173854 () Bool)

(declare-fun e!114822 () Bool)

(declare-fun e!114824 () Bool)

(assert (=> b!173854 (= e!114822 e!114824)))

(declare-fun c!31038 () Bool)

(declare-fun e!114821 () Bool)

(assert (=> b!173854 (= c!31038 e!114821)))

(declare-fun res!82536 () Bool)

(assert (=> b!173854 (=> (not res!82536) (not e!114821))))

(assert (=> b!173854 (= res!82536 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173855 () Bool)

(declare-fun res!82534 () Bool)

(assert (=> b!173855 (=> (not res!82534) (not e!114822))))

(declare-fun lt!86116 () ListLongMap!2135)

(assert (=> b!173855 (= res!82534 (not (contains!1149 lt!86116 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173856 () Bool)

(assert (=> b!173856 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> b!173856 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3758 (_values!3580 thiss!1248))))))

(declare-fun e!114819 () Bool)

(assert (=> b!173856 (= e!114819 (= (apply!130 lt!86116 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17609 () Bool)

(assert (=> bm!17609 (= call!17612 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun b!173857 () Bool)

(declare-fun e!114823 () Bool)

(assert (=> b!173857 (= e!114823 (= lt!86116 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!173858 () Bool)

(assert (=> b!173858 (= e!114824 e!114819)))

(assert (=> b!173858 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun res!82535 () Bool)

(assert (=> b!173858 (= res!82535 (contains!1149 lt!86116 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173858 (=> (not res!82535) (not e!114819))))

(declare-fun b!173859 () Bool)

(assert (=> b!173859 (= e!114821 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!173859 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!173860 () Bool)

(assert (=> b!173860 (= e!114824 e!114823)))

(declare-fun c!31040 () Bool)

(assert (=> b!173860 (= c!31040 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun d!52891 () Bool)

(assert (=> d!52891 e!114822))

(declare-fun res!82537 () Bool)

(assert (=> d!52891 (=> (not res!82537) (not e!114822))))

(assert (=> d!52891 (= res!82537 (not (contains!1149 lt!86116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52891 (= lt!86116 e!114820)))

(declare-fun c!31037 () Bool)

(assert (=> d!52891 (= c!31037 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52891 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!52891 (= (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)) lt!86116)))

(declare-fun b!173861 () Bool)

(assert (=> b!173861 (= e!114823 (isEmpty!443 lt!86116))))

(assert (= (and d!52891 c!31037) b!173850))

(assert (= (and d!52891 (not c!31037)) b!173853))

(assert (= (and b!173853 c!31039) b!173852))

(assert (= (and b!173853 (not c!31039)) b!173851))

(assert (= (or b!173852 b!173851) bm!17609))

(assert (= (and d!52891 res!82537) b!173855))

(assert (= (and b!173855 res!82534) b!173854))

(assert (= (and b!173854 res!82536) b!173859))

(assert (= (and b!173854 c!31038) b!173858))

(assert (= (and b!173854 (not c!31038)) b!173860))

(assert (= (and b!173858 res!82535) b!173856))

(assert (= (and b!173860 c!31040) b!173857))

(assert (= (and b!173860 (not c!31040)) b!173861))

(declare-fun b_lambda!6983 () Bool)

(assert (=> (not b_lambda!6983) (not b!173852)))

(assert (=> b!173852 t!6991))

(declare-fun b_and!10783 () Bool)

(assert (= b_and!10781 (and (=> t!6991 result!4577) b_and!10783)))

(declare-fun b_lambda!6985 () Bool)

(assert (=> (not b_lambda!6985) (not b!173856)))

(assert (=> b!173856 t!6991))

(declare-fun b_and!10785 () Bool)

(assert (= b_and!10783 (and (=> t!6991 result!4577) b_and!10785)))

(declare-fun m!202659 () Bool)

(assert (=> b!173858 m!202659))

(assert (=> b!173858 m!202659))

(declare-fun m!202661 () Bool)

(assert (=> b!173858 m!202661))

(assert (=> b!173856 m!202659))

(assert (=> b!173856 m!202659))

(declare-fun m!202663 () Bool)

(assert (=> b!173856 m!202663))

(assert (=> b!173856 m!201915))

(declare-fun m!202665 () Bool)

(assert (=> b!173856 m!202665))

(assert (=> b!173856 m!202665))

(assert (=> b!173856 m!201915))

(declare-fun m!202667 () Bool)

(assert (=> b!173856 m!202667))

(assert (=> b!173859 m!202659))

(assert (=> b!173859 m!202659))

(declare-fun m!202669 () Bool)

(assert (=> b!173859 m!202669))

(declare-fun m!202671 () Bool)

(assert (=> b!173861 m!202671))

(declare-fun m!202673 () Bool)

(assert (=> bm!17609 m!202673))

(declare-fun m!202675 () Bool)

(assert (=> d!52891 m!202675))

(assert (=> d!52891 m!201893))

(declare-fun m!202677 () Bool)

(assert (=> b!173855 m!202677))

(declare-fun m!202679 () Bool)

(assert (=> b!173852 m!202679))

(assert (=> b!173852 m!202659))

(declare-fun m!202681 () Bool)

(assert (=> b!173852 m!202681))

(assert (=> b!173852 m!202681))

(declare-fun m!202683 () Bool)

(assert (=> b!173852 m!202683))

(declare-fun m!202685 () Bool)

(assert (=> b!173852 m!202685))

(assert (=> b!173852 m!201915))

(assert (=> b!173852 m!202665))

(assert (=> b!173852 m!202665))

(assert (=> b!173852 m!201915))

(assert (=> b!173852 m!202667))

(assert (=> b!173857 m!202673))

(assert (=> b!173853 m!202659))

(assert (=> b!173853 m!202659))

(assert (=> b!173853 m!202669))

(assert (=> b!173649 d!52891))

(declare-fun d!52893 () Bool)

(assert (=> d!52893 (arrayContainsKey!0 (_keys!5438 lt!85779) lt!85935 #b00000000000000000000000000000000)))

(declare-fun lt!86125 () Unit!5315)

(declare-fun choose!13 (array!7279 (_ BitVec 64) (_ BitVec 32)) Unit!5315)

(assert (=> d!52893 (= lt!86125 (choose!13 (_keys!5438 lt!85779) lt!85935 #b00000000000000000000000000000000))))

(assert (=> d!52893 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!52893 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5438 lt!85779) lt!85935 #b00000000000000000000000000000000) lt!86125)))

(declare-fun bs!7196 () Bool)

(assert (= bs!7196 d!52893))

(assert (=> bs!7196 m!202089))

(declare-fun m!202687 () Bool)

(assert (=> bs!7196 m!202687))

(assert (=> b!173553 d!52893))

(declare-fun d!52895 () Bool)

(declare-fun res!82542 () Bool)

(declare-fun e!114830 () Bool)

(assert (=> d!52895 (=> res!82542 e!114830)))

(assert (=> d!52895 (= res!82542 (= (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) lt!85935))))

(assert (=> d!52895 (= (arrayContainsKey!0 (_keys!5438 lt!85779) lt!85935 #b00000000000000000000000000000000) e!114830)))

(declare-fun b!173866 () Bool)

(declare-fun e!114831 () Bool)

(assert (=> b!173866 (= e!114830 e!114831)))

(declare-fun res!82543 () Bool)

(assert (=> b!173866 (=> (not res!82543) (not e!114831))))

(assert (=> b!173866 (= res!82543 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))))))

(declare-fun b!173867 () Bool)

(assert (=> b!173867 (= e!114831 (arrayContainsKey!0 (_keys!5438 lt!85779) lt!85935 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!52895 (not res!82542)) b!173866))

(assert (= (and b!173866 res!82543) b!173867))

(assert (=> d!52895 m!202083))

(declare-fun m!202689 () Bool)

(assert (=> b!173867 m!202689))

(assert (=> b!173553 d!52895))

(declare-fun b!173880 () Bool)

(declare-fun e!114839 () SeekEntryResult!536)

(assert (=> b!173880 (= e!114839 Undefined!536)))

(declare-fun b!173881 () Bool)

(declare-fun e!114838 () SeekEntryResult!536)

(declare-fun lt!86132 () SeekEntryResult!536)

(assert (=> b!173881 (= e!114838 (Found!536 (index!4314 lt!86132)))))

(declare-fun b!173883 () Bool)

(declare-fun c!31049 () Bool)

(declare-fun lt!86133 () (_ BitVec 64))

(assert (=> b!173883 (= c!31049 (= lt!86133 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114840 () SeekEntryResult!536)

(assert (=> b!173883 (= e!114838 e!114840)))

(declare-fun b!173884 () Bool)

(assert (=> b!173884 (= e!114839 e!114838)))

(assert (=> b!173884 (= lt!86133 (select (arr!3458 (_keys!5438 lt!85779)) (index!4314 lt!86132)))))

(declare-fun c!31047 () Bool)

(assert (=> b!173884 (= c!31047 (= lt!86133 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!173885 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7279 (_ BitVec 32)) SeekEntryResult!536)

(assert (=> b!173885 (= e!114840 (seekKeyOrZeroReturnVacant!0 (x!19190 lt!86132) (index!4314 lt!86132) (index!4314 lt!86132) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) (_keys!5438 lt!85779) (mask!8469 lt!85779)))))

(declare-fun d!52897 () Bool)

(declare-fun lt!86134 () SeekEntryResult!536)

(assert (=> d!52897 (and (or ((_ is Undefined!536) lt!86134) (not ((_ is Found!536) lt!86134)) (and (bvsge (index!4313 lt!86134) #b00000000000000000000000000000000) (bvslt (index!4313 lt!86134) (size!3757 (_keys!5438 lt!85779))))) (or ((_ is Undefined!536) lt!86134) ((_ is Found!536) lt!86134) (not ((_ is MissingZero!536) lt!86134)) (and (bvsge (index!4312 lt!86134) #b00000000000000000000000000000000) (bvslt (index!4312 lt!86134) (size!3757 (_keys!5438 lt!85779))))) (or ((_ is Undefined!536) lt!86134) ((_ is Found!536) lt!86134) ((_ is MissingZero!536) lt!86134) (not ((_ is MissingVacant!536) lt!86134)) (and (bvsge (index!4315 lt!86134) #b00000000000000000000000000000000) (bvslt (index!4315 lt!86134) (size!3757 (_keys!5438 lt!85779))))) (or ((_ is Undefined!536) lt!86134) (ite ((_ is Found!536) lt!86134) (= (select (arr!3458 (_keys!5438 lt!85779)) (index!4313 lt!86134)) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!536) lt!86134) (= (select (arr!3458 (_keys!5438 lt!85779)) (index!4312 lt!86134)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!536) lt!86134) (= (select (arr!3458 (_keys!5438 lt!85779)) (index!4315 lt!86134)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!52897 (= lt!86134 e!114839)))

(declare-fun c!31048 () Bool)

(assert (=> d!52897 (= c!31048 (and ((_ is Intermediate!536) lt!86132) (undefined!1348 lt!86132)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7279 (_ BitVec 32)) SeekEntryResult!536)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!52897 (= lt!86132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) (mask!8469 lt!85779)) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) (_keys!5438 lt!85779) (mask!8469 lt!85779)))))

(assert (=> d!52897 (validMask!0 (mask!8469 lt!85779))))

(assert (=> d!52897 (= (seekEntryOrOpen!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) (_keys!5438 lt!85779) (mask!8469 lt!85779)) lt!86134)))

(declare-fun b!173882 () Bool)

(assert (=> b!173882 (= e!114840 (MissingZero!536 (index!4314 lt!86132)))))

(assert (= (and d!52897 c!31048) b!173880))

(assert (= (and d!52897 (not c!31048)) b!173884))

(assert (= (and b!173884 c!31047) b!173881))

(assert (= (and b!173884 (not c!31047)) b!173883))

(assert (= (and b!173883 c!31049) b!173882))

(assert (= (and b!173883 (not c!31049)) b!173885))

(declare-fun m!202691 () Bool)

(assert (=> b!173884 m!202691))

(assert (=> b!173885 m!202083))

(declare-fun m!202693 () Bool)

(assert (=> b!173885 m!202693))

(declare-fun m!202695 () Bool)

(assert (=> d!52897 m!202695))

(declare-fun m!202697 () Bool)

(assert (=> d!52897 m!202697))

(assert (=> d!52897 m!202083))

(declare-fun m!202699 () Bool)

(assert (=> d!52897 m!202699))

(assert (=> d!52897 m!202083))

(assert (=> d!52897 m!202697))

(assert (=> d!52897 m!202133))

(declare-fun m!202701 () Bool)

(assert (=> d!52897 m!202701))

(declare-fun m!202703 () Bool)

(assert (=> d!52897 m!202703))

(assert (=> b!173553 d!52897))

(declare-fun lt!86135 () Bool)

(declare-fun d!52899 () Bool)

(assert (=> d!52899 (= lt!86135 (select (content!150 (toList!1083 lt!86065)) (tuple2!3203 lt!85883 v!309)))))

(declare-fun e!114841 () Bool)

(assert (=> d!52899 (= lt!86135 e!114841)))

(declare-fun res!82544 () Bool)

(assert (=> d!52899 (=> (not res!82544) (not e!114841))))

(assert (=> d!52899 (= res!82544 ((_ is Cons!2184) (toList!1083 lt!86065)))))

(assert (=> d!52899 (= (contains!1151 (toList!1083 lt!86065) (tuple2!3203 lt!85883 v!309)) lt!86135)))

(declare-fun b!173886 () Bool)

(declare-fun e!114842 () Bool)

(assert (=> b!173886 (= e!114841 e!114842)))

(declare-fun res!82545 () Bool)

(assert (=> b!173886 (=> res!82545 e!114842)))

(assert (=> b!173886 (= res!82545 (= (h!2801 (toList!1083 lt!86065)) (tuple2!3203 lt!85883 v!309)))))

(declare-fun b!173887 () Bool)

(assert (=> b!173887 (= e!114842 (contains!1151 (t!6987 (toList!1083 lt!86065)) (tuple2!3203 lt!85883 v!309)))))

(assert (= (and d!52899 res!82544) b!173886))

(assert (= (and b!173886 (not res!82545)) b!173887))

(declare-fun m!202705 () Bool)

(assert (=> d!52899 m!202705))

(declare-fun m!202707 () Bool)

(assert (=> d!52899 m!202707))

(declare-fun m!202709 () Bool)

(assert (=> b!173887 m!202709))

(assert (=> b!173766 d!52899))

(declare-fun d!52901 () Bool)

(assert (=> d!52901 (= (validMask!0 (mask!8469 lt!85779)) (and (or (= (mask!8469 lt!85779) #b00000000000000000000000000000111) (= (mask!8469 lt!85779) #b00000000000000000000000000001111) (= (mask!8469 lt!85779) #b00000000000000000000000000011111) (= (mask!8469 lt!85779) #b00000000000000000000000000111111) (= (mask!8469 lt!85779) #b00000000000000000000000001111111) (= (mask!8469 lt!85779) #b00000000000000000000000011111111) (= (mask!8469 lt!85779) #b00000000000000000000000111111111) (= (mask!8469 lt!85779) #b00000000000000000000001111111111) (= (mask!8469 lt!85779) #b00000000000000000000011111111111) (= (mask!8469 lt!85779) #b00000000000000000000111111111111) (= (mask!8469 lt!85779) #b00000000000000000001111111111111) (= (mask!8469 lt!85779) #b00000000000000000011111111111111) (= (mask!8469 lt!85779) #b00000000000000000111111111111111) (= (mask!8469 lt!85779) #b00000000000000001111111111111111) (= (mask!8469 lt!85779) #b00000000000000011111111111111111) (= (mask!8469 lt!85779) #b00000000000000111111111111111111) (= (mask!8469 lt!85779) #b00000000000001111111111111111111) (= (mask!8469 lt!85779) #b00000000000011111111111111111111) (= (mask!8469 lt!85779) #b00000000000111111111111111111111) (= (mask!8469 lt!85779) #b00000000001111111111111111111111) (= (mask!8469 lt!85779) #b00000000011111111111111111111111) (= (mask!8469 lt!85779) #b00000000111111111111111111111111) (= (mask!8469 lt!85779) #b00000001111111111111111111111111) (= (mask!8469 lt!85779) #b00000011111111111111111111111111) (= (mask!8469 lt!85779) #b00000111111111111111111111111111) (= (mask!8469 lt!85779) #b00001111111111111111111111111111) (= (mask!8469 lt!85779) #b00011111111111111111111111111111) (= (mask!8469 lt!85779) #b00111111111111111111111111111111)) (bvsle (mask!8469 lt!85779) #b00111111111111111111111111111111)))))

(assert (=> d!52735 d!52901))

(declare-fun b!173888 () Bool)

(declare-fun e!114843 () (_ BitVec 32))

(assert (=> b!173888 (= e!114843 #b00000000000000000000000000000000)))

(declare-fun b!173889 () Bool)

(declare-fun e!114844 () (_ BitVec 32))

(declare-fun call!17613 () (_ BitVec 32))

(assert (=> b!173889 (= e!114844 call!17613)))

(declare-fun b!173890 () Bool)

(assert (=> b!173890 (= e!114844 (bvadd #b00000000000000000000000000000001 call!17613))))

(declare-fun d!52903 () Bool)

(declare-fun lt!86136 () (_ BitVec 32))

(assert (=> d!52903 (and (bvsge lt!86136 #b00000000000000000000000000000000) (bvsle lt!86136 (bvsub (size!3757 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!52903 (= lt!86136 e!114843)))

(declare-fun c!31050 () Bool)

(assert (=> d!52903 (= c!31050 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52903 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3757 (_keys!5438 thiss!1248)) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!52903 (= (arrayCountValidKeys!0 (_keys!5438 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))) lt!86136)))

(declare-fun bm!17610 () Bool)

(assert (=> bm!17610 (= call!17613 (arrayCountValidKeys!0 (_keys!5438 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!173891 () Bool)

(assert (=> b!173891 (= e!114843 e!114844)))

(declare-fun c!31051 () Bool)

(assert (=> b!173891 (= c!31051 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!52903 c!31050) b!173888))

(assert (= (and d!52903 (not c!31050)) b!173891))

(assert (= (and b!173891 c!31051) b!173890))

(assert (= (and b!173891 (not c!31051)) b!173889))

(assert (= (or b!173890 b!173889) bm!17610))

(declare-fun m!202711 () Bool)

(assert (=> bm!17610 m!202711))

(assert (=> b!173891 m!202659))

(assert (=> b!173891 m!202659))

(assert (=> b!173891 m!202669))

(assert (=> bm!17602 d!52903))

(assert (=> b!173663 d!52845))

(declare-fun lt!86137 () Bool)

(declare-fun d!52905 () Bool)

(assert (=> d!52905 (= lt!86137 (select (content!150 (toList!1083 lt!86085)) (tuple2!3203 lt!85890 v!309)))))

(declare-fun e!114845 () Bool)

(assert (=> d!52905 (= lt!86137 e!114845)))

(declare-fun res!82546 () Bool)

(assert (=> d!52905 (=> (not res!82546) (not e!114845))))

(assert (=> d!52905 (= res!82546 ((_ is Cons!2184) (toList!1083 lt!86085)))))

(assert (=> d!52905 (= (contains!1151 (toList!1083 lt!86085) (tuple2!3203 lt!85890 v!309)) lt!86137)))

(declare-fun b!173892 () Bool)

(declare-fun e!114846 () Bool)

(assert (=> b!173892 (= e!114845 e!114846)))

(declare-fun res!82547 () Bool)

(assert (=> b!173892 (=> res!82547 e!114846)))

(assert (=> b!173892 (= res!82547 (= (h!2801 (toList!1083 lt!86085)) (tuple2!3203 lt!85890 v!309)))))

(declare-fun b!173893 () Bool)

(assert (=> b!173893 (= e!114846 (contains!1151 (t!6987 (toList!1083 lt!86085)) (tuple2!3203 lt!85890 v!309)))))

(assert (= (and d!52905 res!82546) b!173892))

(assert (= (and b!173892 (not res!82547)) b!173893))

(declare-fun m!202713 () Bool)

(assert (=> d!52905 m!202713))

(declare-fun m!202715 () Bool)

(assert (=> d!52905 m!202715))

(declare-fun m!202717 () Bool)

(assert (=> b!173893 m!202717))

(assert (=> b!173778 d!52905))

(declare-fun d!52907 () Bool)

(declare-fun res!82548 () Bool)

(declare-fun e!114847 () Bool)

(assert (=> d!52907 (=> res!82548 e!114847)))

(assert (=> d!52907 (= res!82548 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (= (_1!1612 (h!2801 (toList!1083 lt!85850))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52907 (= (containsKey!189 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000) e!114847)))

(declare-fun b!173894 () Bool)

(declare-fun e!114848 () Bool)

(assert (=> b!173894 (= e!114847 e!114848)))

(declare-fun res!82549 () Bool)

(assert (=> b!173894 (=> (not res!82549) (not e!114848))))

(assert (=> b!173894 (= res!82549 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85850))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85850))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2184) (toList!1083 lt!85850)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85850))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!173895 () Bool)

(assert (=> b!173895 (= e!114848 (containsKey!189 (t!6987 (toList!1083 lt!85850)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52907 (not res!82548)) b!173894))

(assert (= (and b!173894 res!82549) b!173895))

(declare-fun m!202719 () Bool)

(assert (=> b!173895 m!202719))

(assert (=> d!52831 d!52907))

(declare-fun d!52909 () Bool)

(declare-fun e!114850 () Bool)

(assert (=> d!52909 e!114850))

(declare-fun res!82550 () Bool)

(assert (=> d!52909 (=> res!82550 e!114850)))

(declare-fun lt!86140 () Bool)

(assert (=> d!52909 (= res!82550 (not lt!86140))))

(declare-fun lt!86139 () Bool)

(assert (=> d!52909 (= lt!86140 lt!86139)))

(declare-fun lt!86141 () Unit!5315)

(declare-fun e!114849 () Unit!5315)

(assert (=> d!52909 (= lt!86141 e!114849)))

(declare-fun c!31052 () Bool)

(assert (=> d!52909 (= c!31052 lt!86139)))

(assert (=> d!52909 (= lt!86139 (containsKey!189 (toList!1083 lt!86055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!52909 (= (contains!1149 lt!86055 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86140)))

(declare-fun b!173896 () Bool)

(declare-fun lt!86138 () Unit!5315)

(assert (=> b!173896 (= e!114849 lt!86138)))

(assert (=> b!173896 (= lt!86138 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173896 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86055) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!173897 () Bool)

(declare-fun Unit!5336 () Unit!5315)

(assert (=> b!173897 (= e!114849 Unit!5336)))

(declare-fun b!173898 () Bool)

(assert (=> b!173898 (= e!114850 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!52909 c!31052) b!173896))

(assert (= (and d!52909 (not c!31052)) b!173897))

(assert (= (and d!52909 (not res!82550)) b!173898))

(declare-fun m!202721 () Bool)

(assert (=> d!52909 m!202721))

(declare-fun m!202723 () Bool)

(assert (=> b!173896 m!202723))

(declare-fun m!202725 () Bool)

(assert (=> b!173896 m!202725))

(assert (=> b!173896 m!202725))

(declare-fun m!202727 () Bool)

(assert (=> b!173896 m!202727))

(assert (=> b!173898 m!202725))

(assert (=> b!173898 m!202725))

(assert (=> b!173898 m!202727))

(assert (=> b!173753 d!52909))

(declare-fun d!52911 () Bool)

(declare-fun e!114852 () Bool)

(assert (=> d!52911 e!114852))

(declare-fun res!82551 () Bool)

(assert (=> d!52911 (=> res!82551 e!114852)))

(declare-fun lt!86144 () Bool)

(assert (=> d!52911 (= res!82551 (not lt!86144))))

(declare-fun lt!86143 () Bool)

(assert (=> d!52911 (= lt!86144 lt!86143)))

(declare-fun lt!86145 () Unit!5315)

(declare-fun e!114851 () Unit!5315)

(assert (=> d!52911 (= lt!86145 e!114851)))

(declare-fun c!31053 () Bool)

(assert (=> d!52911 (= c!31053 lt!86143)))

(assert (=> d!52911 (= lt!86143 (containsKey!189 (toList!1083 lt!86065) (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(assert (=> d!52911 (= (contains!1149 lt!86065 (_1!1612 (tuple2!3203 lt!85883 v!309))) lt!86144)))

(declare-fun b!173899 () Bool)

(declare-fun lt!86142 () Unit!5315)

(assert (=> b!173899 (= e!114851 lt!86142)))

(assert (=> b!173899 (= lt!86142 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86065) (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(assert (=> b!173899 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86065) (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun b!173900 () Bool)

(declare-fun Unit!5337 () Unit!5315)

(assert (=> b!173900 (= e!114851 Unit!5337)))

(declare-fun b!173901 () Bool)

(assert (=> b!173901 (= e!114852 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86065) (_1!1612 (tuple2!3203 lt!85883 v!309)))))))

(assert (= (and d!52911 c!31053) b!173899))

(assert (= (and d!52911 (not c!31053)) b!173900))

(assert (= (and d!52911 (not res!82551)) b!173901))

(declare-fun m!202729 () Bool)

(assert (=> d!52911 m!202729))

(declare-fun m!202731 () Bool)

(assert (=> b!173899 m!202731))

(assert (=> b!173899 m!202457))

(assert (=> b!173899 m!202457))

(declare-fun m!202733 () Bool)

(assert (=> b!173899 m!202733))

(assert (=> b!173901 m!202457))

(assert (=> b!173901 m!202457))

(assert (=> b!173901 m!202733))

(assert (=> d!52801 d!52911))

(declare-fun b!173904 () Bool)

(declare-fun e!114854 () Option!192)

(assert (=> b!173904 (= e!114854 (getValueByKey!186 (t!6987 lt!86064) (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun b!173903 () Bool)

(declare-fun e!114853 () Option!192)

(assert (=> b!173903 (= e!114853 e!114854)))

(declare-fun c!31055 () Bool)

(assert (=> b!173903 (= c!31055 (and ((_ is Cons!2184) lt!86064) (not (= (_1!1612 (h!2801 lt!86064)) (_1!1612 (tuple2!3203 lt!85883 v!309))))))))

(declare-fun b!173902 () Bool)

(assert (=> b!173902 (= e!114853 (Some!191 (_2!1612 (h!2801 lt!86064))))))

(declare-fun b!173905 () Bool)

(assert (=> b!173905 (= e!114854 None!190)))

(declare-fun d!52913 () Bool)

(declare-fun c!31054 () Bool)

(assert (=> d!52913 (= c!31054 (and ((_ is Cons!2184) lt!86064) (= (_1!1612 (h!2801 lt!86064)) (_1!1612 (tuple2!3203 lt!85883 v!309)))))))

(assert (=> d!52913 (= (getValueByKey!186 lt!86064 (_1!1612 (tuple2!3203 lt!85883 v!309))) e!114853)))

(assert (= (and d!52913 c!31054) b!173902))

(assert (= (and d!52913 (not c!31054)) b!173903))

(assert (= (and b!173903 c!31055) b!173904))

(assert (= (and b!173903 (not c!31055)) b!173905))

(declare-fun m!202735 () Bool)

(assert (=> b!173904 m!202735))

(assert (=> d!52801 d!52913))

(declare-fun d!52915 () Bool)

(assert (=> d!52915 (= (getValueByKey!186 lt!86064 (_1!1612 (tuple2!3203 lt!85883 v!309))) (Some!191 (_2!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun lt!86146 () Unit!5315)

(assert (=> d!52915 (= lt!86146 (choose!936 lt!86064 (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun e!114855 () Bool)

(assert (=> d!52915 e!114855))

(declare-fun res!82552 () Bool)

(assert (=> d!52915 (=> (not res!82552) (not e!114855))))

(assert (=> d!52915 (= res!82552 (isStrictlySorted!319 lt!86064))))

(assert (=> d!52915 (= (lemmaContainsTupThenGetReturnValue!99 lt!86064 (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309))) lt!86146)))

(declare-fun b!173906 () Bool)

(declare-fun res!82553 () Bool)

(assert (=> b!173906 (=> (not res!82553) (not e!114855))))

(assert (=> b!173906 (= res!82553 (containsKey!189 lt!86064 (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun b!173907 () Bool)

(assert (=> b!173907 (= e!114855 (contains!1151 lt!86064 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309)))))))

(assert (= (and d!52915 res!82552) b!173906))

(assert (= (and b!173906 res!82553) b!173907))

(assert (=> d!52915 m!202451))

(declare-fun m!202737 () Bool)

(assert (=> d!52915 m!202737))

(declare-fun m!202739 () Bool)

(assert (=> d!52915 m!202739))

(declare-fun m!202741 () Bool)

(assert (=> b!173906 m!202741))

(declare-fun m!202743 () Bool)

(assert (=> b!173907 m!202743))

(assert (=> d!52801 d!52915))

(declare-fun d!52917 () Bool)

(declare-fun e!114857 () Bool)

(assert (=> d!52917 e!114857))

(declare-fun res!82554 () Bool)

(assert (=> d!52917 (=> (not res!82554) (not e!114857))))

(declare-fun lt!86147 () List!2188)

(assert (=> d!52917 (= res!82554 (isStrictlySorted!319 lt!86147))))

(declare-fun e!114860 () List!2188)

(assert (=> d!52917 (= lt!86147 e!114860)))

(declare-fun c!31058 () Bool)

(assert (=> d!52917 (= c!31058 (and ((_ is Cons!2184) (toList!1083 lt!85894)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85894))) (_1!1612 (tuple2!3203 lt!85883 v!309)))))))

(assert (=> d!52917 (isStrictlySorted!319 (toList!1083 lt!85894))))

(assert (=> d!52917 (= (insertStrictlySorted!102 (toList!1083 lt!85894) (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309))) lt!86147)))

(declare-fun b!173908 () Bool)

(declare-fun call!17614 () List!2188)

(assert (=> b!173908 (= e!114860 call!17614)))

(declare-fun bm!17611 () Bool)

(declare-fun call!17615 () List!2188)

(declare-fun call!17616 () List!2188)

(assert (=> bm!17611 (= call!17615 call!17616)))

(declare-fun b!173909 () Bool)

(assert (=> b!173909 (= e!114857 (contains!1151 lt!86147 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309)))))))

(declare-fun b!173910 () Bool)

(declare-fun e!114859 () List!2188)

(assert (=> b!173910 (= e!114859 call!17615)))

(declare-fun b!173911 () Bool)

(declare-fun e!114856 () List!2188)

(assert (=> b!173911 (= e!114856 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85894)) (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun bm!17612 () Bool)

(assert (=> bm!17612 (= call!17614 ($colon$colon!97 e!114856 (ite c!31058 (h!2801 (toList!1083 lt!85894)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85883 v!309)) (_2!1612 (tuple2!3203 lt!85883 v!309))))))))

(declare-fun c!31056 () Bool)

(assert (=> bm!17612 (= c!31056 c!31058)))

(declare-fun b!173912 () Bool)

(declare-fun e!114858 () List!2188)

(assert (=> b!173912 (= e!114858 call!17616)))

(declare-fun b!173913 () Bool)

(assert (=> b!173913 (= e!114859 call!17615)))

(declare-fun b!173914 () Bool)

(assert (=> b!173914 (= e!114860 e!114858)))

(declare-fun c!31059 () Bool)

(assert (=> b!173914 (= c!31059 (and ((_ is Cons!2184) (toList!1083 lt!85894)) (= (_1!1612 (h!2801 (toList!1083 lt!85894))) (_1!1612 (tuple2!3203 lt!85883 v!309)))))))

(declare-fun b!173915 () Bool)

(declare-fun c!31057 () Bool)

(assert (=> b!173915 (= e!114856 (ite c!31059 (t!6987 (toList!1083 lt!85894)) (ite c!31057 (Cons!2184 (h!2801 (toList!1083 lt!85894)) (t!6987 (toList!1083 lt!85894))) Nil!2185)))))

(declare-fun bm!17613 () Bool)

(assert (=> bm!17613 (= call!17616 call!17614)))

(declare-fun b!173916 () Bool)

(declare-fun res!82555 () Bool)

(assert (=> b!173916 (=> (not res!82555) (not e!114857))))

(assert (=> b!173916 (= res!82555 (containsKey!189 lt!86147 (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun b!173917 () Bool)

(assert (=> b!173917 (= c!31057 (and ((_ is Cons!2184) (toList!1083 lt!85894)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85894))) (_1!1612 (tuple2!3203 lt!85883 v!309)))))))

(assert (=> b!173917 (= e!114858 e!114859)))

(assert (= (and d!52917 c!31058) b!173908))

(assert (= (and d!52917 (not c!31058)) b!173914))

(assert (= (and b!173914 c!31059) b!173912))

(assert (= (and b!173914 (not c!31059)) b!173917))

(assert (= (and b!173917 c!31057) b!173913))

(assert (= (and b!173917 (not c!31057)) b!173910))

(assert (= (or b!173913 b!173910) bm!17611))

(assert (= (or b!173912 bm!17611) bm!17613))

(assert (= (or b!173908 bm!17613) bm!17612))

(assert (= (and bm!17612 c!31056) b!173911))

(assert (= (and bm!17612 (not c!31056)) b!173915))

(assert (= (and d!52917 res!82554) b!173916))

(assert (= (and b!173916 res!82555) b!173909))

(declare-fun m!202745 () Bool)

(assert (=> bm!17612 m!202745))

(declare-fun m!202747 () Bool)

(assert (=> b!173911 m!202747))

(declare-fun m!202749 () Bool)

(assert (=> b!173916 m!202749))

(declare-fun m!202751 () Bool)

(assert (=> b!173909 m!202751))

(declare-fun m!202753 () Bool)

(assert (=> d!52917 m!202753))

(declare-fun m!202755 () Bool)

(assert (=> d!52917 m!202755))

(assert (=> d!52801 d!52917))

(assert (=> d!52835 d!52717))

(assert (=> b!173645 d!52695))

(declare-fun d!52919 () Bool)

(declare-fun e!114862 () Bool)

(assert (=> d!52919 e!114862))

(declare-fun res!82556 () Bool)

(assert (=> d!52919 (=> res!82556 e!114862)))

(declare-fun lt!86150 () Bool)

(assert (=> d!52919 (= res!82556 (not lt!86150))))

(declare-fun lt!86149 () Bool)

(assert (=> d!52919 (= lt!86150 lt!86149)))

(declare-fun lt!86151 () Unit!5315)

(declare-fun e!114861 () Unit!5315)

(assert (=> d!52919 (= lt!86151 e!114861)))

(declare-fun c!31060 () Bool)

(assert (=> d!52919 (= c!31060 lt!86149)))

(assert (=> d!52919 (= lt!86149 (containsKey!189 (toList!1083 lt!86055) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!52919 (= (contains!1149 lt!86055 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) lt!86150)))

(declare-fun b!173918 () Bool)

(declare-fun lt!86148 () Unit!5315)

(assert (=> b!173918 (= e!114861 lt!86148)))

(assert (=> b!173918 (= lt!86148 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86055) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173918 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86055) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!173919 () Bool)

(declare-fun Unit!5338 () Unit!5315)

(assert (=> b!173919 (= e!114861 Unit!5338)))

(declare-fun b!173920 () Bool)

(assert (=> b!173920 (= e!114862 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86055) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!52919 c!31060) b!173918))

(assert (= (and d!52919 (not c!31060)) b!173919))

(assert (= (and d!52919 (not res!82556)) b!173920))

(assert (=> d!52919 m!201909))

(declare-fun m!202757 () Bool)

(assert (=> d!52919 m!202757))

(assert (=> b!173918 m!201909))

(declare-fun m!202759 () Bool)

(assert (=> b!173918 m!202759))

(assert (=> b!173918 m!201909))

(declare-fun m!202761 () Bool)

(assert (=> b!173918 m!202761))

(assert (=> b!173918 m!202761))

(declare-fun m!202763 () Bool)

(assert (=> b!173918 m!202763))

(assert (=> b!173920 m!201909))

(assert (=> b!173920 m!202761))

(assert (=> b!173920 m!202761))

(assert (=> b!173920 m!202763))

(assert (=> b!173756 d!52919))

(declare-fun d!52921 () Bool)

(assert (=> d!52921 (= (size!3763 lt!85779) (bvadd (_size!1200 lt!85779) (bvsdiv (bvadd (extraKeys!3336 lt!85779) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!173595 d!52921))

(declare-fun e!114864 () Option!192)

(declare-fun b!173923 () Bool)

(assert (=> b!173923 (= e!114864 (getValueByKey!186 (t!6987 (toList!1083 lt!86044)) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173922 () Bool)

(declare-fun e!114863 () Option!192)

(assert (=> b!173922 (= e!114863 e!114864)))

(declare-fun c!31062 () Bool)

(assert (=> b!173922 (= c!31062 (and ((_ is Cons!2184) (toList!1083 lt!86044)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86044))) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173921 () Bool)

(assert (=> b!173921 (= e!114863 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86044)))))))

(declare-fun b!173924 () Bool)

(assert (=> b!173924 (= e!114864 None!190)))

(declare-fun d!52923 () Bool)

(declare-fun c!31061 () Bool)

(assert (=> d!52923 (= c!31061 (and ((_ is Cons!2184) (toList!1083 lt!86044)) (= (_1!1612 (h!2801 (toList!1083 lt!86044))) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52923 (= (getValueByKey!186 (toList!1083 lt!86044) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) e!114863)))

(assert (= (and d!52923 c!31061) b!173921))

(assert (= (and d!52923 (not c!31061)) b!173922))

(assert (= (and b!173922 c!31062) b!173923))

(assert (= (and b!173922 (not c!31062)) b!173924))

(declare-fun m!202765 () Bool)

(assert (=> b!173923 m!202765))

(assert (=> b!173722 d!52923))

(declare-fun e!114866 () Option!192)

(declare-fun b!173927 () Bool)

(assert (=> b!173927 (= e!114866 (getValueByKey!186 (t!6987 (toList!1083 lt!86070)) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173926 () Bool)

(declare-fun e!114865 () Option!192)

(assert (=> b!173926 (= e!114865 e!114866)))

(declare-fun c!31064 () Bool)

(assert (=> b!173926 (= c!31064 (and ((_ is Cons!2184) (toList!1083 lt!86070)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86070))) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173925 () Bool)

(assert (=> b!173925 (= e!114865 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86070)))))))

(declare-fun b!173928 () Bool)

(assert (=> b!173928 (= e!114866 None!190)))

(declare-fun c!31063 () Bool)

(declare-fun d!52925 () Bool)

(assert (=> d!52925 (= c!31063 (and ((_ is Cons!2184) (toList!1083 lt!86070)) (= (_1!1612 (h!2801 (toList!1083 lt!86070))) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52925 (= (getValueByKey!186 (toList!1083 lt!86070) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) e!114865)))

(assert (= (and d!52925 c!31063) b!173925))

(assert (= (and d!52925 (not c!31063)) b!173926))

(assert (= (and b!173926 c!31064) b!173927))

(assert (= (and b!173926 (not c!31064)) b!173928))

(declare-fun m!202767 () Bool)

(assert (=> b!173927 m!202767))

(assert (=> b!173767 d!52925))

(declare-fun d!52927 () Bool)

(assert (=> d!52927 (= (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85777) key!828)) (not ((_ is Some!191) (getValueByKey!186 (toList!1083 lt!85777) key!828))))))

(assert (=> d!52701 d!52927))

(declare-fun d!52929 () Bool)

(declare-fun e!114868 () Bool)

(assert (=> d!52929 e!114868))

(declare-fun res!82557 () Bool)

(assert (=> d!52929 (=> res!82557 e!114868)))

(declare-fun lt!86154 () Bool)

(assert (=> d!52929 (= res!82557 (not lt!86154))))

(declare-fun lt!86153 () Bool)

(assert (=> d!52929 (= lt!86154 lt!86153)))

(declare-fun lt!86155 () Unit!5315)

(declare-fun e!114867 () Unit!5315)

(assert (=> d!52929 (= lt!86155 e!114867)))

(declare-fun c!31065 () Bool)

(assert (=> d!52929 (= c!31065 lt!86153)))

(assert (=> d!52929 (= lt!86153 (containsKey!189 (toList!1083 lt!86076) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52929 (= (contains!1149 lt!86076 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) lt!86154)))

(declare-fun b!173929 () Bool)

(declare-fun lt!86152 () Unit!5315)

(assert (=> b!173929 (= e!114867 lt!86152)))

(assert (=> b!173929 (= lt!86152 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86076) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!173929 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86076) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173930 () Bool)

(declare-fun Unit!5339 () Unit!5315)

(assert (=> b!173930 (= e!114867 Unit!5339)))

(declare-fun b!173931 () Bool)

(assert (=> b!173931 (= e!114868 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86076) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52929 c!31065) b!173929))

(assert (= (and d!52929 (not c!31065)) b!173930))

(assert (= (and d!52929 (not res!82557)) b!173931))

(declare-fun m!202769 () Bool)

(assert (=> d!52929 m!202769))

(declare-fun m!202771 () Bool)

(assert (=> b!173929 m!202771))

(assert (=> b!173929 m!202501))

(assert (=> b!173929 m!202501))

(declare-fun m!202773 () Bool)

(assert (=> b!173929 m!202773))

(assert (=> b!173931 m!202501))

(assert (=> b!173931 m!202501))

(assert (=> b!173931 m!202773))

(assert (=> d!52815 d!52929))

(declare-fun e!114870 () Option!192)

(declare-fun b!173934 () Bool)

(assert (=> b!173934 (= e!114870 (getValueByKey!186 (t!6987 lt!86075) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173933 () Bool)

(declare-fun e!114869 () Option!192)

(assert (=> b!173933 (= e!114869 e!114870)))

(declare-fun c!31067 () Bool)

(assert (=> b!173933 (= c!31067 (and ((_ is Cons!2184) lt!86075) (not (= (_1!1612 (h!2801 lt!86075)) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173932 () Bool)

(assert (=> b!173932 (= e!114869 (Some!191 (_2!1612 (h!2801 lt!86075))))))

(declare-fun b!173935 () Bool)

(assert (=> b!173935 (= e!114870 None!190)))

(declare-fun c!31066 () Bool)

(declare-fun d!52931 () Bool)

(assert (=> d!52931 (= c!31066 (and ((_ is Cons!2184) lt!86075) (= (_1!1612 (h!2801 lt!86075)) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52931 (= (getValueByKey!186 lt!86075 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) e!114869)))

(assert (= (and d!52931 c!31066) b!173932))

(assert (= (and d!52931 (not c!31066)) b!173933))

(assert (= (and b!173933 c!31067) b!173934))

(assert (= (and b!173933 (not c!31067)) b!173935))

(declare-fun m!202775 () Bool)

(assert (=> b!173934 m!202775))

(assert (=> d!52815 d!52931))

(declare-fun d!52933 () Bool)

(assert (=> d!52933 (= (getValueByKey!186 lt!86075 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86156 () Unit!5315)

(assert (=> d!52933 (= lt!86156 (choose!936 lt!86075 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114871 () Bool)

(assert (=> d!52933 e!114871))

(declare-fun res!82558 () Bool)

(assert (=> d!52933 (=> (not res!82558) (not e!114871))))

(assert (=> d!52933 (= res!82558 (isStrictlySorted!319 lt!86075))))

(assert (=> d!52933 (= (lemmaContainsTupThenGetReturnValue!99 lt!86075 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) lt!86156)))

(declare-fun b!173936 () Bool)

(declare-fun res!82559 () Bool)

(assert (=> b!173936 (=> (not res!82559) (not e!114871))))

(assert (=> b!173936 (= res!82559 (containsKey!189 lt!86075 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173937 () Bool)

(assert (=> b!173937 (= e!114871 (contains!1151 lt!86075 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52933 res!82558) b!173936))

(assert (= (and b!173936 res!82559) b!173937))

(assert (=> d!52933 m!202495))

(declare-fun m!202777 () Bool)

(assert (=> d!52933 m!202777))

(declare-fun m!202779 () Bool)

(assert (=> d!52933 m!202779))

(declare-fun m!202781 () Bool)

(assert (=> b!173936 m!202781))

(declare-fun m!202783 () Bool)

(assert (=> b!173937 m!202783))

(assert (=> d!52815 d!52933))

(declare-fun d!52935 () Bool)

(declare-fun e!114873 () Bool)

(assert (=> d!52935 e!114873))

(declare-fun res!82560 () Bool)

(assert (=> d!52935 (=> (not res!82560) (not e!114873))))

(declare-fun lt!86157 () List!2188)

(assert (=> d!52935 (= res!82560 (isStrictlySorted!319 lt!86157))))

(declare-fun e!114876 () List!2188)

(assert (=> d!52935 (= lt!86157 e!114876)))

(declare-fun c!31070 () Bool)

(assert (=> d!52935 (= c!31070 (and ((_ is Cons!2184) (toList!1083 lt!85882)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85882))) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52935 (isStrictlySorted!319 (toList!1083 lt!85882))))

(assert (=> d!52935 (= (insertStrictlySorted!102 (toList!1083 lt!85882) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) lt!86157)))

(declare-fun b!173938 () Bool)

(declare-fun call!17617 () List!2188)

(assert (=> b!173938 (= e!114876 call!17617)))

(declare-fun bm!17614 () Bool)

(declare-fun call!17618 () List!2188)

(declare-fun call!17619 () List!2188)

(assert (=> bm!17614 (= call!17618 call!17619)))

(declare-fun b!173939 () Bool)

(assert (=> b!173939 (= e!114873 (contains!1151 lt!86157 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173940 () Bool)

(declare-fun e!114875 () List!2188)

(assert (=> b!173940 (= e!114875 call!17618)))

(declare-fun e!114872 () List!2188)

(declare-fun b!173941 () Bool)

(assert (=> b!173941 (= e!114872 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85882)) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun bm!17615 () Bool)

(assert (=> bm!17615 (= call!17617 ($colon$colon!97 e!114872 (ite c!31070 (h!2801 (toList!1083 lt!85882)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31068 () Bool)

(assert (=> bm!17615 (= c!31068 c!31070)))

(declare-fun b!173942 () Bool)

(declare-fun e!114874 () List!2188)

(assert (=> b!173942 (= e!114874 call!17619)))

(declare-fun b!173943 () Bool)

(assert (=> b!173943 (= e!114875 call!17618)))

(declare-fun b!173944 () Bool)

(assert (=> b!173944 (= e!114876 e!114874)))

(declare-fun c!31071 () Bool)

(assert (=> b!173944 (= c!31071 (and ((_ is Cons!2184) (toList!1083 lt!85882)) (= (_1!1612 (h!2801 (toList!1083 lt!85882))) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(declare-fun c!31069 () Bool)

(declare-fun b!173945 () Bool)

(assert (=> b!173945 (= e!114872 (ite c!31071 (t!6987 (toList!1083 lt!85882)) (ite c!31069 (Cons!2184 (h!2801 (toList!1083 lt!85882)) (t!6987 (toList!1083 lt!85882))) Nil!2185)))))

(declare-fun bm!17616 () Bool)

(assert (=> bm!17616 (= call!17619 call!17617)))

(declare-fun b!173946 () Bool)

(declare-fun res!82561 () Bool)

(assert (=> b!173946 (=> (not res!82561) (not e!114873))))

(assert (=> b!173946 (= res!82561 (containsKey!189 lt!86157 (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173947 () Bool)

(assert (=> b!173947 (= c!31069 (and ((_ is Cons!2184) (toList!1083 lt!85882)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85882))) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(assert (=> b!173947 (= e!114874 e!114875)))

(assert (= (and d!52935 c!31070) b!173938))

(assert (= (and d!52935 (not c!31070)) b!173944))

(assert (= (and b!173944 c!31071) b!173942))

(assert (= (and b!173944 (not c!31071)) b!173947))

(assert (= (and b!173947 c!31069) b!173943))

(assert (= (and b!173947 (not c!31069)) b!173940))

(assert (= (or b!173943 b!173940) bm!17614))

(assert (= (or b!173942 bm!17614) bm!17616))

(assert (= (or b!173938 bm!17616) bm!17615))

(assert (= (and bm!17615 c!31068) b!173941))

(assert (= (and bm!17615 (not c!31068)) b!173945))

(assert (= (and d!52935 res!82560) b!173946))

(assert (= (and b!173946 res!82561) b!173939))

(declare-fun m!202785 () Bool)

(assert (=> bm!17615 m!202785))

(declare-fun m!202787 () Bool)

(assert (=> b!173941 m!202787))

(declare-fun m!202789 () Bool)

(assert (=> b!173946 m!202789))

(declare-fun m!202791 () Bool)

(assert (=> b!173939 m!202791))

(declare-fun m!202793 () Bool)

(assert (=> d!52935 m!202793))

(declare-fun m!202795 () Bool)

(assert (=> d!52935 m!202795))

(assert (=> d!52815 d!52935))

(declare-fun d!52937 () Bool)

(assert (=> d!52937 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7197 () Bool)

(assert (= bs!7197 d!52937))

(assert (=> bs!7197 m!202403))

(declare-fun m!202797 () Bool)

(assert (=> bs!7197 m!202797))

(assert (=> b!173735 d!52937))

(assert (=> b!173735 d!52859))

(declare-fun d!52939 () Bool)

(assert (=> d!52939 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859))))

(declare-fun lt!86158 () Unit!5315)

(assert (=> d!52939 (= lt!86158 (choose!937 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859))))

(declare-fun e!114877 () Bool)

(assert (=> d!52939 e!114877))

(declare-fun res!82562 () Bool)

(assert (=> d!52939 (=> (not res!82562) (not e!114877))))

(assert (=> d!52939 (= res!82562 (isStrictlySorted!319 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52939 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859) lt!86158)))

(declare-fun b!173948 () Bool)

(assert (=> b!173948 (= e!114877 (containsKey!189 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859))))

(assert (= (and d!52939 res!82562) b!173948))

(assert (=> d!52939 m!202347))

(assert (=> d!52939 m!202347))

(assert (=> d!52939 m!202349))

(declare-fun m!202799 () Bool)

(assert (=> d!52939 m!202799))

(declare-fun m!202801 () Bool)

(assert (=> d!52939 m!202801))

(assert (=> b!173948 m!202343))

(assert (=> b!173717 d!52939))

(declare-fun d!52941 () Bool)

(assert (=> d!52941 (= (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859)) (not (isEmpty!442 (getValueByKey!186 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859))))))

(declare-fun bs!7198 () Bool)

(assert (= bs!7198 d!52941))

(assert (=> bs!7198 m!202347))

(declare-fun m!202803 () Bool)

(assert (=> bs!7198 m!202803))

(assert (=> b!173717 d!52941))

(declare-fun e!114879 () Option!192)

(declare-fun b!173951 () Bool)

(assert (=> b!173951 (= e!114879 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))) lt!85859))))

(declare-fun b!173950 () Bool)

(declare-fun e!114878 () Option!192)

(assert (=> b!173950 (= e!114878 e!114879)))

(declare-fun c!31073 () Bool)

(assert (=> b!173950 (= c!31073 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))) lt!85859))))))

(declare-fun b!173949 () Bool)

(assert (=> b!173949 (= e!114878 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))))

(declare-fun b!173952 () Bool)

(assert (=> b!173952 (= e!114879 None!190)))

(declare-fun d!52943 () Bool)

(declare-fun c!31072 () Bool)

(assert (=> d!52943 (= c!31072 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))) lt!85859)))))

(assert (=> d!52943 (= (getValueByKey!186 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859) e!114878)))

(assert (= (and d!52943 c!31072) b!173949))

(assert (= (and d!52943 (not c!31072)) b!173950))

(assert (= (and b!173950 c!31073) b!173951))

(assert (= (and b!173950 (not c!31073)) b!173952))

(declare-fun m!202805 () Bool)

(assert (=> b!173951 m!202805))

(assert (=> b!173717 d!52943))

(declare-fun b!173955 () Bool)

(declare-fun e!114881 () Option!192)

(assert (=> b!173955 (= e!114881 (getValueByKey!186 (t!6987 (toList!1083 lt!86007)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!173954 () Bool)

(declare-fun e!114880 () Option!192)

(assert (=> b!173954 (= e!114880 e!114881)))

(declare-fun c!31075 () Bool)

(assert (=> b!173954 (= c!31075 (and ((_ is Cons!2184) (toList!1083 lt!86007)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86007))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!173953 () Bool)

(assert (=> b!173953 (= e!114880 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86007)))))))

(declare-fun b!173956 () Bool)

(assert (=> b!173956 (= e!114881 None!190)))

(declare-fun d!52945 () Bool)

(declare-fun c!31074 () Bool)

(assert (=> d!52945 (= c!31074 (and ((_ is Cons!2184) (toList!1083 lt!86007)) (= (_1!1612 (h!2801 (toList!1083 lt!86007))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!52945 (= (getValueByKey!186 (toList!1083 lt!86007) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) e!114880)))

(assert (= (and d!52945 c!31074) b!173953))

(assert (= (and d!52945 (not c!31074)) b!173954))

(assert (= (and b!173954 c!31075) b!173955))

(assert (= (and b!173954 (not c!31075)) b!173956))

(declare-fun m!202807 () Bool)

(assert (=> b!173955 m!202807))

(assert (=> b!173684 d!52945))

(assert (=> d!52715 d!52901))

(declare-fun lt!86159 () Bool)

(declare-fun d!52947 () Bool)

(assert (=> d!52947 (= lt!86159 (select (content!150 (toList!1083 lt!86040)) (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))

(declare-fun e!114882 () Bool)

(assert (=> d!52947 (= lt!86159 e!114882)))

(declare-fun res!82563 () Bool)

(assert (=> d!52947 (=> (not res!82563) (not e!114882))))

(assert (=> d!52947 (= res!82563 ((_ is Cons!2184) (toList!1083 lt!86040)))))

(assert (=> d!52947 (= (contains!1151 (toList!1083 lt!86040) (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) lt!86159)))

(declare-fun b!173957 () Bool)

(declare-fun e!114883 () Bool)

(assert (=> b!173957 (= e!114882 e!114883)))

(declare-fun res!82564 () Bool)

(assert (=> b!173957 (=> res!82564 e!114883)))

(assert (=> b!173957 (= res!82564 (= (h!2801 (toList!1083 lt!86040)) (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))

(declare-fun b!173958 () Bool)

(assert (=> b!173958 (= e!114883 (contains!1151 (t!6987 (toList!1083 lt!86040)) (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))

(assert (= (and d!52947 res!82563) b!173957))

(assert (= (and b!173957 (not res!82564)) b!173958))

(declare-fun m!202809 () Bool)

(assert (=> d!52947 m!202809))

(declare-fun m!202811 () Bool)

(assert (=> d!52947 m!202811))

(declare-fun m!202813 () Bool)

(assert (=> b!173958 m!202813))

(assert (=> b!173721 d!52947))

(declare-fun d!52949 () Bool)

(declare-fun e!114885 () Bool)

(assert (=> d!52949 e!114885))

(declare-fun res!82565 () Bool)

(assert (=> d!52949 (=> res!82565 e!114885)))

(declare-fun lt!86162 () Bool)

(assert (=> d!52949 (= res!82565 (not lt!86162))))

(declare-fun lt!86161 () Bool)

(assert (=> d!52949 (= lt!86162 lt!86161)))

(declare-fun lt!86163 () Unit!5315)

(declare-fun e!114884 () Unit!5315)

(assert (=> d!52949 (= lt!86163 e!114884)))

(declare-fun c!31076 () Bool)

(assert (=> d!52949 (= c!31076 lt!86161)))

(assert (=> d!52949 (= lt!86161 (containsKey!189 (toList!1083 lt!86044) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52949 (= (contains!1149 lt!86044 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) lt!86162)))

(declare-fun b!173959 () Bool)

(declare-fun lt!86160 () Unit!5315)

(assert (=> b!173959 (= e!114884 lt!86160)))

(assert (=> b!173959 (= lt!86160 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86044) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!173959 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86044) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173960 () Bool)

(declare-fun Unit!5340 () Unit!5315)

(assert (=> b!173960 (= e!114884 Unit!5340)))

(declare-fun b!173961 () Bool)

(assert (=> b!173961 (= e!114885 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86044) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52949 c!31076) b!173959))

(assert (= (and d!52949 (not c!31076)) b!173960))

(assert (= (and d!52949 (not res!82565)) b!173961))

(declare-fun m!202815 () Bool)

(assert (=> d!52949 m!202815))

(declare-fun m!202817 () Bool)

(assert (=> b!173959 m!202817))

(assert (=> b!173959 m!202375))

(assert (=> b!173959 m!202375))

(declare-fun m!202819 () Bool)

(assert (=> b!173959 m!202819))

(assert (=> b!173961 m!202375))

(assert (=> b!173961 m!202375))

(assert (=> b!173961 m!202819))

(assert (=> d!52773 d!52949))

(declare-fun b!173964 () Bool)

(declare-fun e!114887 () Option!192)

(assert (=> b!173964 (= e!114887 (getValueByKey!186 (t!6987 lt!86043) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173963 () Bool)

(declare-fun e!114886 () Option!192)

(assert (=> b!173963 (= e!114886 e!114887)))

(declare-fun c!31078 () Bool)

(assert (=> b!173963 (= c!31078 (and ((_ is Cons!2184) lt!86043) (not (= (_1!1612 (h!2801 lt!86043)) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173962 () Bool)

(assert (=> b!173962 (= e!114886 (Some!191 (_2!1612 (h!2801 lt!86043))))))

(declare-fun b!173965 () Bool)

(assert (=> b!173965 (= e!114887 None!190)))

(declare-fun c!31077 () Bool)

(declare-fun d!52951 () Bool)

(assert (=> d!52951 (= c!31077 (and ((_ is Cons!2184) lt!86043) (= (_1!1612 (h!2801 lt!86043)) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52951 (= (getValueByKey!186 lt!86043 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) e!114886)))

(assert (= (and d!52951 c!31077) b!173962))

(assert (= (and d!52951 (not c!31077)) b!173963))

(assert (= (and b!173963 c!31078) b!173964))

(assert (= (and b!173963 (not c!31078)) b!173965))

(declare-fun m!202821 () Bool)

(assert (=> b!173964 m!202821))

(assert (=> d!52773 d!52951))

(declare-fun d!52953 () Bool)

(assert (=> d!52953 (= (getValueByKey!186 lt!86043 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86164 () Unit!5315)

(assert (=> d!52953 (= lt!86164 (choose!936 lt!86043 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114888 () Bool)

(assert (=> d!52953 e!114888))

(declare-fun res!82566 () Bool)

(assert (=> d!52953 (=> (not res!82566) (not e!114888))))

(assert (=> d!52953 (= res!82566 (isStrictlySorted!319 lt!86043))))

(assert (=> d!52953 (= (lemmaContainsTupThenGetReturnValue!99 lt!86043 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) lt!86164)))

(declare-fun b!173966 () Bool)

(declare-fun res!82567 () Bool)

(assert (=> b!173966 (=> (not res!82567) (not e!114888))))

(assert (=> b!173966 (= res!82567 (containsKey!189 lt!86043 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173967 () Bool)

(assert (=> b!173967 (= e!114888 (contains!1151 lt!86043 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52953 res!82566) b!173966))

(assert (= (and b!173966 res!82567) b!173967))

(assert (=> d!52953 m!202369))

(declare-fun m!202823 () Bool)

(assert (=> d!52953 m!202823))

(declare-fun m!202825 () Bool)

(assert (=> d!52953 m!202825))

(declare-fun m!202827 () Bool)

(assert (=> b!173966 m!202827))

(declare-fun m!202829 () Bool)

(assert (=> b!173967 m!202829))

(assert (=> d!52773 d!52953))

(declare-fun d!52955 () Bool)

(declare-fun e!114890 () Bool)

(assert (=> d!52955 e!114890))

(declare-fun res!82568 () Bool)

(assert (=> d!52955 (=> (not res!82568) (not e!114890))))

(declare-fun lt!86165 () List!2188)

(assert (=> d!52955 (= res!82568 (isStrictlySorted!319 lt!86165))))

(declare-fun e!114893 () List!2188)

(assert (=> d!52955 (= lt!86165 e!114893)))

(declare-fun c!31081 () Bool)

(assert (=> d!52955 (= c!31081 (and ((_ is Cons!2184) (toList!1083 lt!85848)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85848))) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52955 (isStrictlySorted!319 (toList!1083 lt!85848))))

(assert (=> d!52955 (= (insertStrictlySorted!102 (toList!1083 lt!85848) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) lt!86165)))

(declare-fun b!173968 () Bool)

(declare-fun call!17620 () List!2188)

(assert (=> b!173968 (= e!114893 call!17620)))

(declare-fun bm!17617 () Bool)

(declare-fun call!17621 () List!2188)

(declare-fun call!17622 () List!2188)

(assert (=> bm!17617 (= call!17621 call!17622)))

(declare-fun b!173969 () Bool)

(assert (=> b!173969 (= e!114890 (contains!1151 lt!86165 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173970 () Bool)

(declare-fun e!114892 () List!2188)

(assert (=> b!173970 (= e!114892 call!17621)))

(declare-fun b!173971 () Bool)

(declare-fun e!114889 () List!2188)

(assert (=> b!173971 (= e!114889 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85848)) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun bm!17618 () Bool)

(assert (=> bm!17618 (= call!17620 ($colon$colon!97 e!114889 (ite c!31081 (h!2801 (toList!1083 lt!85848)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31079 () Bool)

(assert (=> bm!17618 (= c!31079 c!31081)))

(declare-fun b!173972 () Bool)

(declare-fun e!114891 () List!2188)

(assert (=> b!173972 (= e!114891 call!17622)))

(declare-fun b!173973 () Bool)

(assert (=> b!173973 (= e!114892 call!17621)))

(declare-fun b!173974 () Bool)

(assert (=> b!173974 (= e!114893 e!114891)))

(declare-fun c!31082 () Bool)

(assert (=> b!173974 (= c!31082 (and ((_ is Cons!2184) (toList!1083 lt!85848)) (= (_1!1612 (h!2801 (toList!1083 lt!85848))) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173975 () Bool)

(declare-fun c!31080 () Bool)

(assert (=> b!173975 (= e!114889 (ite c!31082 (t!6987 (toList!1083 lt!85848)) (ite c!31080 (Cons!2184 (h!2801 (toList!1083 lt!85848)) (t!6987 (toList!1083 lt!85848))) Nil!2185)))))

(declare-fun bm!17619 () Bool)

(assert (=> bm!17619 (= call!17622 call!17620)))

(declare-fun b!173976 () Bool)

(declare-fun res!82569 () Bool)

(assert (=> b!173976 (=> (not res!82569) (not e!114890))))

(assert (=> b!173976 (= res!82569 (containsKey!189 lt!86165 (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173977 () Bool)

(assert (=> b!173977 (= c!31080 (and ((_ is Cons!2184) (toList!1083 lt!85848)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85848))) (_1!1612 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))

(assert (=> b!173977 (= e!114891 e!114892)))

(assert (= (and d!52955 c!31081) b!173968))

(assert (= (and d!52955 (not c!31081)) b!173974))

(assert (= (and b!173974 c!31082) b!173972))

(assert (= (and b!173974 (not c!31082)) b!173977))

(assert (= (and b!173977 c!31080) b!173973))

(assert (= (and b!173977 (not c!31080)) b!173970))

(assert (= (or b!173973 b!173970) bm!17617))

(assert (= (or b!173972 bm!17617) bm!17619))

(assert (= (or b!173968 bm!17619) bm!17618))

(assert (= (and bm!17618 c!31079) b!173971))

(assert (= (and bm!17618 (not c!31079)) b!173975))

(assert (= (and d!52955 res!82568) b!173976))

(assert (= (and b!173976 res!82569) b!173969))

(declare-fun m!202831 () Bool)

(assert (=> bm!17618 m!202831))

(declare-fun m!202833 () Bool)

(assert (=> b!173971 m!202833))

(declare-fun m!202835 () Bool)

(assert (=> b!173976 m!202835))

(declare-fun m!202837 () Bool)

(assert (=> b!173969 m!202837))

(declare-fun m!202839 () Bool)

(assert (=> d!52955 m!202839))

(declare-fun m!202841 () Bool)

(assert (=> d!52955 m!202841))

(assert (=> d!52773 d!52955))

(declare-fun d!52957 () Bool)

(declare-fun e!114895 () Bool)

(assert (=> d!52957 e!114895))

(declare-fun res!82570 () Bool)

(assert (=> d!52957 (=> res!82570 e!114895)))

(declare-fun lt!86168 () Bool)

(assert (=> d!52957 (= res!82570 (not lt!86168))))

(declare-fun lt!86167 () Bool)

(assert (=> d!52957 (= lt!86168 lt!86167)))

(declare-fun lt!86169 () Unit!5315)

(declare-fun e!114894 () Unit!5315)

(assert (=> d!52957 (= lt!86169 e!114894)))

(declare-fun c!31083 () Bool)

(assert (=> d!52957 (= c!31083 lt!86167)))

(assert (=> d!52957 (= lt!86167 (containsKey!189 (toList!1083 lt!86070) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52957 (= (contains!1149 lt!86070 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!86168)))

(declare-fun b!173978 () Bool)

(declare-fun lt!86166 () Unit!5315)

(assert (=> b!173978 (= e!114894 lt!86166)))

(assert (=> b!173978 (= lt!86166 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86070) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!173978 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86070) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173979 () Bool)

(declare-fun Unit!5341 () Unit!5315)

(assert (=> b!173979 (= e!114894 Unit!5341)))

(declare-fun b!173980 () Bool)

(assert (=> b!173980 (= e!114895 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86070) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52957 c!31083) b!173978))

(assert (= (and d!52957 (not c!31083)) b!173979))

(assert (= (and d!52957 (not res!82570)) b!173980))

(declare-fun m!202843 () Bool)

(assert (=> d!52957 m!202843))

(declare-fun m!202845 () Bool)

(assert (=> b!173978 m!202845))

(assert (=> b!173978 m!202477))

(assert (=> b!173978 m!202477))

(declare-fun m!202847 () Bool)

(assert (=> b!173978 m!202847))

(assert (=> b!173980 m!202477))

(assert (=> b!173980 m!202477))

(assert (=> b!173980 m!202847))

(assert (=> d!52807 d!52957))

(declare-fun e!114897 () Option!192)

(declare-fun b!173983 () Bool)

(assert (=> b!173983 (= e!114897 (getValueByKey!186 (t!6987 lt!86069) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173982 () Bool)

(declare-fun e!114896 () Option!192)

(assert (=> b!173982 (= e!114896 e!114897)))

(declare-fun c!31085 () Bool)

(assert (=> b!173982 (= c!31085 (and ((_ is Cons!2184) lt!86069) (not (= (_1!1612 (h!2801 lt!86069)) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!173981 () Bool)

(assert (=> b!173981 (= e!114896 (Some!191 (_2!1612 (h!2801 lt!86069))))))

(declare-fun b!173984 () Bool)

(assert (=> b!173984 (= e!114897 None!190)))

(declare-fun c!31084 () Bool)

(declare-fun d!52959 () Bool)

(assert (=> d!52959 (= c!31084 (and ((_ is Cons!2184) lt!86069) (= (_1!1612 (h!2801 lt!86069)) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52959 (= (getValueByKey!186 lt!86069 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) e!114896)))

(assert (= (and d!52959 c!31084) b!173981))

(assert (= (and d!52959 (not c!31084)) b!173982))

(assert (= (and b!173982 c!31085) b!173983))

(assert (= (and b!173982 (not c!31085)) b!173984))

(declare-fun m!202849 () Bool)

(assert (=> b!173983 m!202849))

(assert (=> d!52807 d!52959))

(declare-fun d!52961 () Bool)

(assert (=> d!52961 (= (getValueByKey!186 lt!86069 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86170 () Unit!5315)

(assert (=> d!52961 (= lt!86170 (choose!936 lt!86069 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114898 () Bool)

(assert (=> d!52961 e!114898))

(declare-fun res!82571 () Bool)

(assert (=> d!52961 (=> (not res!82571) (not e!114898))))

(assert (=> d!52961 (= res!82571 (isStrictlySorted!319 lt!86069))))

(assert (=> d!52961 (= (lemmaContainsTupThenGetReturnValue!99 lt!86069 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!86170)))

(declare-fun b!173985 () Bool)

(declare-fun res!82572 () Bool)

(assert (=> b!173985 (=> (not res!82572) (not e!114898))))

(assert (=> b!173985 (= res!82572 (containsKey!189 lt!86069 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173986 () Bool)

(assert (=> b!173986 (= e!114898 (contains!1151 lt!86069 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52961 res!82571) b!173985))

(assert (= (and b!173985 res!82572) b!173986))

(assert (=> d!52961 m!202471))

(declare-fun m!202851 () Bool)

(assert (=> d!52961 m!202851))

(declare-fun m!202853 () Bool)

(assert (=> d!52961 m!202853))

(declare-fun m!202855 () Bool)

(assert (=> b!173985 m!202855))

(declare-fun m!202857 () Bool)

(assert (=> b!173986 m!202857))

(assert (=> d!52807 d!52961))

(declare-fun d!52963 () Bool)

(declare-fun e!114900 () Bool)

(assert (=> d!52963 e!114900))

(declare-fun res!82573 () Bool)

(assert (=> d!52963 (=> (not res!82573) (not e!114900))))

(declare-fun lt!86171 () List!2188)

(assert (=> d!52963 (= res!82573 (isStrictlySorted!319 lt!86171))))

(declare-fun e!114903 () List!2188)

(assert (=> d!52963 (= lt!86171 e!114903)))

(declare-fun c!31088 () Bool)

(assert (=> d!52963 (= c!31088 (and ((_ is Cons!2184) (toList!1083 lt!85879)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85879))) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52963 (isStrictlySorted!319 (toList!1083 lt!85879))))

(assert (=> d!52963 (= (insertStrictlySorted!102 (toList!1083 lt!85879) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!86171)))

(declare-fun b!173987 () Bool)

(declare-fun call!17623 () List!2188)

(assert (=> b!173987 (= e!114903 call!17623)))

(declare-fun bm!17620 () Bool)

(declare-fun call!17624 () List!2188)

(declare-fun call!17625 () List!2188)

(assert (=> bm!17620 (= call!17624 call!17625)))

(declare-fun b!173988 () Bool)

(assert (=> b!173988 (= e!114900 (contains!1151 lt!86171 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!173989 () Bool)

(declare-fun e!114902 () List!2188)

(assert (=> b!173989 (= e!114902 call!17624)))

(declare-fun b!173990 () Bool)

(declare-fun e!114899 () List!2188)

(assert (=> b!173990 (= e!114899 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85879)) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun bm!17621 () Bool)

(assert (=> bm!17621 (= call!17623 ($colon$colon!97 e!114899 (ite c!31088 (h!2801 (toList!1083 lt!85879)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31086 () Bool)

(assert (=> bm!17621 (= c!31086 c!31088)))

(declare-fun b!173991 () Bool)

(declare-fun e!114901 () List!2188)

(assert (=> b!173991 (= e!114901 call!17625)))

(declare-fun b!173992 () Bool)

(assert (=> b!173992 (= e!114902 call!17624)))

(declare-fun b!173993 () Bool)

(assert (=> b!173993 (= e!114903 e!114901)))

(declare-fun c!31089 () Bool)

(assert (=> b!173993 (= c!31089 (and ((_ is Cons!2184) (toList!1083 lt!85879)) (= (_1!1612 (h!2801 (toList!1083 lt!85879))) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(declare-fun c!31087 () Bool)

(declare-fun b!173994 () Bool)

(assert (=> b!173994 (= e!114899 (ite c!31089 (t!6987 (toList!1083 lt!85879)) (ite c!31087 (Cons!2184 (h!2801 (toList!1083 lt!85879)) (t!6987 (toList!1083 lt!85879))) Nil!2185)))))

(declare-fun bm!17622 () Bool)

(assert (=> bm!17622 (= call!17625 call!17623)))

(declare-fun b!173995 () Bool)

(declare-fun res!82574 () Bool)

(assert (=> b!173995 (=> (not res!82574) (not e!114900))))

(assert (=> b!173995 (= res!82574 (containsKey!189 lt!86171 (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!173996 () Bool)

(assert (=> b!173996 (= c!31087 (and ((_ is Cons!2184) (toList!1083 lt!85879)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85879))) (_1!1612 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(assert (=> b!173996 (= e!114901 e!114902)))

(assert (= (and d!52963 c!31088) b!173987))

(assert (= (and d!52963 (not c!31088)) b!173993))

(assert (= (and b!173993 c!31089) b!173991))

(assert (= (and b!173993 (not c!31089)) b!173996))

(assert (= (and b!173996 c!31087) b!173992))

(assert (= (and b!173996 (not c!31087)) b!173989))

(assert (= (or b!173992 b!173989) bm!17620))

(assert (= (or b!173991 bm!17620) bm!17622))

(assert (= (or b!173987 bm!17622) bm!17621))

(assert (= (and bm!17621 c!31086) b!173990))

(assert (= (and bm!17621 (not c!31086)) b!173994))

(assert (= (and d!52963 res!82573) b!173995))

(assert (= (and b!173995 res!82574) b!173988))

(declare-fun m!202859 () Bool)

(assert (=> bm!17621 m!202859))

(declare-fun m!202861 () Bool)

(assert (=> b!173990 m!202861))

(declare-fun m!202863 () Bool)

(assert (=> b!173995 m!202863))

(declare-fun m!202865 () Bool)

(assert (=> b!173988 m!202865))

(declare-fun m!202867 () Bool)

(assert (=> d!52963 m!202867))

(declare-fun m!202869 () Bool)

(assert (=> d!52963 m!202869))

(assert (=> d!52807 d!52963))

(declare-fun d!52965 () Bool)

(assert (=> d!52965 (= (apply!130 lt!85987 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1975 (getValueByKey!186 (toList!1083 lt!85987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7199 () Bool)

(assert (= bs!7199 d!52965))

(declare-fun m!202871 () Bool)

(assert (=> bs!7199 m!202871))

(assert (=> bs!7199 m!202871))

(declare-fun m!202873 () Bool)

(assert (=> bs!7199 m!202873))

(assert (=> b!173675 d!52965))

(declare-fun d!52967 () Bool)

(declare-fun e!114905 () Bool)

(assert (=> d!52967 e!114905))

(declare-fun res!82575 () Bool)

(assert (=> d!52967 (=> (not res!82575) (not e!114905))))

(declare-fun lt!86172 () List!2188)

(assert (=> d!52967 (= res!82575 (isStrictlySorted!319 lt!86172))))

(declare-fun e!114908 () List!2188)

(assert (=> d!52967 (= lt!86172 e!114908)))

(declare-fun c!31092 () Bool)

(assert (=> d!52967 (= c!31092 (and ((_ is Cons!2184) (t!6987 (toList!1083 (map!1874 thiss!1248)))) (bvslt (_1!1612 (h!2801 (t!6987 (toList!1083 (map!1874 thiss!1248))))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!52967 (isStrictlySorted!319 (t!6987 (toList!1083 (map!1874 thiss!1248))))))

(assert (=> d!52967 (= (insertStrictlySorted!102 (t!6987 (toList!1083 (map!1874 thiss!1248))) (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))) lt!86172)))

(declare-fun b!173997 () Bool)

(declare-fun call!17626 () List!2188)

(assert (=> b!173997 (= e!114908 call!17626)))

(declare-fun bm!17623 () Bool)

(declare-fun call!17627 () List!2188)

(declare-fun call!17628 () List!2188)

(assert (=> bm!17623 (= call!17627 call!17628)))

(declare-fun b!173998 () Bool)

(assert (=> b!173998 (= e!114905 (contains!1151 lt!86172 (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!173999 () Bool)

(declare-fun e!114907 () List!2188)

(assert (=> b!173999 (= e!114907 call!17627)))

(declare-fun b!174000 () Bool)

(declare-fun e!114904 () List!2188)

(assert (=> b!174000 (= e!114904 (insertStrictlySorted!102 (t!6987 (t!6987 (toList!1083 (map!1874 thiss!1248)))) (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun bm!17624 () Bool)

(assert (=> bm!17624 (= call!17626 ($colon$colon!97 e!114904 (ite c!31092 (h!2801 (t!6987 (toList!1083 (map!1874 thiss!1248)))) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))))))

(declare-fun c!31090 () Bool)

(assert (=> bm!17624 (= c!31090 c!31092)))

(declare-fun b!174001 () Bool)

(declare-fun e!114906 () List!2188)

(assert (=> b!174001 (= e!114906 call!17628)))

(declare-fun b!174002 () Bool)

(assert (=> b!174002 (= e!114907 call!17627)))

(declare-fun b!174003 () Bool)

(assert (=> b!174003 (= e!114908 e!114906)))

(declare-fun c!31093 () Bool)

(assert (=> b!174003 (= c!31093 (and ((_ is Cons!2184) (t!6987 (toList!1083 (map!1874 thiss!1248)))) (= (_1!1612 (h!2801 (t!6987 (toList!1083 (map!1874 thiss!1248))))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!174004 () Bool)

(declare-fun c!31091 () Bool)

(assert (=> b!174004 (= e!114904 (ite c!31093 (t!6987 (t!6987 (toList!1083 (map!1874 thiss!1248)))) (ite c!31091 (Cons!2184 (h!2801 (t!6987 (toList!1083 (map!1874 thiss!1248)))) (t!6987 (t!6987 (toList!1083 (map!1874 thiss!1248))))) Nil!2185)))))

(declare-fun bm!17625 () Bool)

(assert (=> bm!17625 (= call!17628 call!17626)))

(declare-fun b!174005 () Bool)

(declare-fun res!82576 () Bool)

(assert (=> b!174005 (=> (not res!82576) (not e!114905))))

(assert (=> b!174005 (= res!82576 (containsKey!189 lt!86172 (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!174006 () Bool)

(assert (=> b!174006 (= c!31091 (and ((_ is Cons!2184) (t!6987 (toList!1083 (map!1874 thiss!1248)))) (bvsgt (_1!1612 (h!2801 (t!6987 (toList!1083 (map!1874 thiss!1248))))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> b!174006 (= e!114906 e!114907)))

(assert (= (and d!52967 c!31092) b!173997))

(assert (= (and d!52967 (not c!31092)) b!174003))

(assert (= (and b!174003 c!31093) b!174001))

(assert (= (and b!174003 (not c!31093)) b!174006))

(assert (= (and b!174006 c!31091) b!174002))

(assert (= (and b!174006 (not c!31091)) b!173999))

(assert (= (or b!174002 b!173999) bm!17623))

(assert (= (or b!174001 bm!17623) bm!17625))

(assert (= (or b!173997 bm!17625) bm!17624))

(assert (= (and bm!17624 c!31090) b!174000))

(assert (= (and bm!17624 (not c!31090)) b!174004))

(assert (= (and d!52967 res!82575) b!174005))

(assert (= (and b!174005 res!82576) b!173998))

(declare-fun m!202875 () Bool)

(assert (=> bm!17624 m!202875))

(declare-fun m!202877 () Bool)

(assert (=> b!174000 m!202877))

(declare-fun m!202879 () Bool)

(assert (=> b!174005 m!202879))

(declare-fun m!202881 () Bool)

(assert (=> b!173998 m!202881))

(declare-fun m!202883 () Bool)

(assert (=> d!52967 m!202883))

(declare-fun m!202885 () Bool)

(assert (=> d!52967 m!202885))

(assert (=> b!173535 d!52967))

(declare-fun d!52969 () Bool)

(declare-fun e!114910 () Bool)

(assert (=> d!52969 e!114910))

(declare-fun res!82577 () Bool)

(assert (=> d!52969 (=> res!82577 e!114910)))

(declare-fun lt!86175 () Bool)

(assert (=> d!52969 (= res!82577 (not lt!86175))))

(declare-fun lt!86174 () Bool)

(assert (=> d!52969 (= lt!86175 lt!86174)))

(declare-fun lt!86176 () Unit!5315)

(declare-fun e!114909 () Unit!5315)

(assert (=> d!52969 (= lt!86176 e!114909)))

(declare-fun c!31094 () Bool)

(assert (=> d!52969 (= c!31094 lt!86174)))

(assert (=> d!52969 (= lt!86174 (containsKey!189 (toList!1083 lt!86031) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(assert (=> d!52969 (= (contains!1149 lt!86031 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!86175)))

(declare-fun b!174007 () Bool)

(declare-fun lt!86173 () Unit!5315)

(assert (=> b!174007 (= e!114909 lt!86173)))

(assert (=> b!174007 (= lt!86173 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86031) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(assert (=> b!174007 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86031) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174008 () Bool)

(declare-fun Unit!5342 () Unit!5315)

(assert (=> b!174008 (= e!114909 Unit!5342)))

(declare-fun b!174009 () Bool)

(assert (=> b!174009 (= e!114910 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86031) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52969 c!31094) b!174007))

(assert (= (and d!52969 (not c!31094)) b!174008))

(assert (= (and d!52969 (not res!82577)) b!174009))

(declare-fun m!202887 () Bool)

(assert (=> d!52969 m!202887))

(declare-fun m!202889 () Bool)

(assert (=> b!174007 m!202889))

(assert (=> b!174007 m!202335))

(assert (=> b!174007 m!202335))

(declare-fun m!202891 () Bool)

(assert (=> b!174007 m!202891))

(assert (=> b!174009 m!202335))

(assert (=> b!174009 m!202335))

(assert (=> b!174009 m!202891))

(assert (=> d!52763 d!52969))

(declare-fun e!114912 () Option!192)

(declare-fun b!174012 () Bool)

(assert (=> b!174012 (= e!114912 (getValueByKey!186 (t!6987 lt!86030) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174011 () Bool)

(declare-fun e!114911 () Option!192)

(assert (=> b!174011 (= e!114911 e!114912)))

(declare-fun c!31096 () Bool)

(assert (=> b!174011 (= c!31096 (and ((_ is Cons!2184) lt!86030) (not (= (_1!1612 (h!2801 lt!86030)) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!174010 () Bool)

(assert (=> b!174010 (= e!114911 (Some!191 (_2!1612 (h!2801 lt!86030))))))

(declare-fun b!174013 () Bool)

(assert (=> b!174013 (= e!114912 None!190)))

(declare-fun c!31095 () Bool)

(declare-fun d!52971 () Bool)

(assert (=> d!52971 (= c!31095 (and ((_ is Cons!2184) lt!86030) (= (_1!1612 (h!2801 lt!86030)) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52971 (= (getValueByKey!186 lt!86030 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) e!114911)))

(assert (= (and d!52971 c!31095) b!174010))

(assert (= (and d!52971 (not c!31095)) b!174011))

(assert (= (and b!174011 c!31096) b!174012))

(assert (= (and b!174011 (not c!31096)) b!174013))

(declare-fun m!202893 () Bool)

(assert (=> b!174012 m!202893))

(assert (=> d!52763 d!52971))

(declare-fun d!52973 () Bool)

(assert (=> d!52973 (= (getValueByKey!186 lt!86030 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun lt!86177 () Unit!5315)

(assert (=> d!52973 (= lt!86177 (choose!936 lt!86030 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun e!114913 () Bool)

(assert (=> d!52973 e!114913))

(declare-fun res!82578 () Bool)

(assert (=> d!52973 (=> (not res!82578) (not e!114913))))

(assert (=> d!52973 (= res!82578 (isStrictlySorted!319 lt!86030))))

(assert (=> d!52973 (= (lemmaContainsTupThenGetReturnValue!99 lt!86030 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!86177)))

(declare-fun b!174014 () Bool)

(declare-fun res!82579 () Bool)

(assert (=> b!174014 (=> (not res!82579) (not e!114913))))

(assert (=> b!174014 (= res!82579 (containsKey!189 lt!86030 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174015 () Bool)

(assert (=> b!174015 (= e!114913 (contains!1151 lt!86030 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(assert (= (and d!52973 res!82578) b!174014))

(assert (= (and b!174014 res!82579) b!174015))

(assert (=> d!52973 m!202329))

(declare-fun m!202895 () Bool)

(assert (=> d!52973 m!202895))

(declare-fun m!202897 () Bool)

(assert (=> d!52973 m!202897))

(declare-fun m!202899 () Bool)

(assert (=> b!174014 m!202899))

(declare-fun m!202901 () Bool)

(assert (=> b!174015 m!202901))

(assert (=> d!52763 d!52973))

(declare-fun d!52975 () Bool)

(declare-fun e!114915 () Bool)

(assert (=> d!52975 e!114915))

(declare-fun res!82580 () Bool)

(assert (=> d!52975 (=> (not res!82580) (not e!114915))))

(declare-fun lt!86178 () List!2188)

(assert (=> d!52975 (= res!82580 (isStrictlySorted!319 lt!86178))))

(declare-fun e!114918 () List!2188)

(assert (=> d!52975 (= lt!86178 e!114918)))

(declare-fun c!31099 () Bool)

(assert (=> d!52975 (= c!31099 (and ((_ is Cons!2184) (toList!1083 lt!85845)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85845))) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52975 (isStrictlySorted!319 (toList!1083 lt!85845))))

(assert (=> d!52975 (= (insertStrictlySorted!102 (toList!1083 lt!85845) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!86178)))

(declare-fun b!174016 () Bool)

(declare-fun call!17629 () List!2188)

(assert (=> b!174016 (= e!114918 call!17629)))

(declare-fun bm!17626 () Bool)

(declare-fun call!17630 () List!2188)

(declare-fun call!17631 () List!2188)

(assert (=> bm!17626 (= call!17630 call!17631)))

(declare-fun b!174017 () Bool)

(assert (=> b!174017 (= e!114915 (contains!1151 lt!86178 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(declare-fun b!174018 () Bool)

(declare-fun e!114917 () List!2188)

(assert (=> b!174018 (= e!114917 call!17630)))

(declare-fun b!174019 () Bool)

(declare-fun e!114914 () List!2188)

(assert (=> b!174019 (= e!114914 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85845)) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun bm!17627 () Bool)

(assert (=> bm!17627 (= call!17629 ($colon$colon!97 e!114914 (ite c!31099 (h!2801 (toList!1083 lt!85845)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) (_2!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))))

(declare-fun c!31097 () Bool)

(assert (=> bm!17627 (= c!31097 c!31099)))

(declare-fun b!174020 () Bool)

(declare-fun e!114916 () List!2188)

(assert (=> b!174020 (= e!114916 call!17631)))

(declare-fun b!174021 () Bool)

(assert (=> b!174021 (= e!114917 call!17630)))

(declare-fun b!174022 () Bool)

(assert (=> b!174022 (= e!114918 e!114916)))

(declare-fun c!31100 () Bool)

(assert (=> b!174022 (= c!31100 (and ((_ is Cons!2184) (toList!1083 lt!85845)) (= (_1!1612 (h!2801 (toList!1083 lt!85845))) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(declare-fun c!31098 () Bool)

(declare-fun b!174023 () Bool)

(assert (=> b!174023 (= e!114914 (ite c!31100 (t!6987 (toList!1083 lt!85845)) (ite c!31098 (Cons!2184 (h!2801 (toList!1083 lt!85845)) (t!6987 (toList!1083 lt!85845))) Nil!2185)))))

(declare-fun bm!17628 () Bool)

(assert (=> bm!17628 (= call!17631 call!17629)))

(declare-fun b!174024 () Bool)

(declare-fun res!82581 () Bool)

(assert (=> b!174024 (=> (not res!82581) (not e!114915))))

(assert (=> b!174024 (= res!82581 (containsKey!189 lt!86178 (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174025 () Bool)

(assert (=> b!174025 (= c!31098 (and ((_ is Cons!2184) (toList!1083 lt!85845)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85845))) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(assert (=> b!174025 (= e!114916 e!114917)))

(assert (= (and d!52975 c!31099) b!174016))

(assert (= (and d!52975 (not c!31099)) b!174022))

(assert (= (and b!174022 c!31100) b!174020))

(assert (= (and b!174022 (not c!31100)) b!174025))

(assert (= (and b!174025 c!31098) b!174021))

(assert (= (and b!174025 (not c!31098)) b!174018))

(assert (= (or b!174021 b!174018) bm!17626))

(assert (= (or b!174020 bm!17626) bm!17628))

(assert (= (or b!174016 bm!17628) bm!17627))

(assert (= (and bm!17627 c!31097) b!174019))

(assert (= (and bm!17627 (not c!31097)) b!174023))

(assert (= (and d!52975 res!82580) b!174024))

(assert (= (and b!174024 res!82581) b!174017))

(declare-fun m!202903 () Bool)

(assert (=> bm!17627 m!202903))

(declare-fun m!202905 () Bool)

(assert (=> b!174019 m!202905))

(declare-fun m!202907 () Bool)

(assert (=> b!174024 m!202907))

(declare-fun m!202909 () Bool)

(assert (=> b!174017 m!202909))

(declare-fun m!202911 () Bool)

(assert (=> d!52975 m!202911))

(declare-fun m!202913 () Bool)

(assert (=> d!52975 m!202913))

(assert (=> d!52763 d!52975))

(declare-fun b!174028 () Bool)

(declare-fun e!114920 () Option!192)

(assert (=> b!174028 (= e!114920 (getValueByKey!186 (t!6987 (t!6987 (toList!1083 lt!85878))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174027 () Bool)

(declare-fun e!114919 () Option!192)

(assert (=> b!174027 (= e!114919 e!114920)))

(declare-fun c!31102 () Bool)

(assert (=> b!174027 (= c!31102 (and ((_ is Cons!2184) (t!6987 (toList!1083 lt!85878))) (not (= (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85878)))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174026 () Bool)

(assert (=> b!174026 (= e!114919 (Some!191 (_2!1612 (h!2801 (t!6987 (toList!1083 lt!85878))))))))

(declare-fun b!174029 () Bool)

(assert (=> b!174029 (= e!114920 None!190)))

(declare-fun d!52977 () Bool)

(declare-fun c!31101 () Bool)

(assert (=> d!52977 (= c!31101 (and ((_ is Cons!2184) (t!6987 (toList!1083 lt!85878))) (= (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85878)))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52977 (= (getValueByKey!186 (t!6987 (toList!1083 lt!85878)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114919)))

(assert (= (and d!52977 c!31101) b!174026))

(assert (= (and d!52977 (not c!31101)) b!174027))

(assert (= (and b!174027 c!31102) b!174028))

(assert (= (and b!174027 (not c!31102)) b!174029))

(declare-fun m!202915 () Bool)

(assert (=> b!174028 m!202915))

(assert (=> b!173583 d!52977))

(declare-fun d!52979 () Bool)

(assert (=> d!52979 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7200 () Bool)

(assert (= bs!7200 d!52979))

(assert (=> bs!7200 m!202177))

(declare-fun m!202917 () Bool)

(assert (=> bs!7200 m!202917))

(assert (=> b!173656 d!52979))

(declare-fun b!174032 () Bool)

(declare-fun e!114922 () Option!192)

(assert (=> b!174032 (= e!114922 (getValueByKey!186 (t!6987 (toList!1083 lt!85884)) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174031 () Bool)

(declare-fun e!114921 () Option!192)

(assert (=> b!174031 (= e!114921 e!114922)))

(declare-fun c!31104 () Bool)

(assert (=> b!174031 (= c!31104 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85884))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!174030 () Bool)

(assert (=> b!174030 (= e!114921 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85884)))))))

(declare-fun b!174033 () Bool)

(assert (=> b!174033 (= e!114922 None!190)))

(declare-fun d!52981 () Bool)

(declare-fun c!31103 () Bool)

(assert (=> d!52981 (= c!31103 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (= (_1!1612 (h!2801 (toList!1083 lt!85884))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52981 (= (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) e!114921)))

(assert (= (and d!52981 c!31103) b!174030))

(assert (= (and d!52981 (not c!31103)) b!174031))

(assert (= (and b!174031 c!31104) b!174032))

(assert (= (and b!174031 (not c!31104)) b!174033))

(assert (=> b!174032 m!201909))

(declare-fun m!202919 () Bool)

(assert (=> b!174032 m!202919))

(assert (=> b!173656 d!52981))

(declare-fun d!52983 () Bool)

(declare-fun c!31107 () Bool)

(assert (=> d!52983 (= c!31107 ((_ is Nil!2185) (toList!1083 lt!85878)))))

(declare-fun e!114925 () (InoxSet tuple2!3202))

(assert (=> d!52983 (= (content!150 (toList!1083 lt!85878)) e!114925)))

(declare-fun b!174038 () Bool)

(assert (=> b!174038 (= e!114925 ((as const (Array tuple2!3202 Bool)) false))))

(declare-fun b!174039 () Bool)

(assert (=> b!174039 (= e!114925 ((_ map or) (store ((as const (Array tuple2!3202 Bool)) false) (h!2801 (toList!1083 lt!85878)) true) (content!150 (t!6987 (toList!1083 lt!85878)))))))

(assert (= (and d!52983 c!31107) b!174038))

(assert (= (and d!52983 (not c!31107)) b!174039))

(declare-fun m!202921 () Bool)

(assert (=> b!174039 m!202921))

(declare-fun m!202923 () Bool)

(assert (=> b!174039 m!202923))

(assert (=> d!52721 d!52983))

(assert (=> d!52779 d!52775))

(assert (=> d!52779 d!52757))

(declare-fun d!52985 () Bool)

(declare-fun e!114927 () Bool)

(assert (=> d!52985 e!114927))

(declare-fun res!82582 () Bool)

(assert (=> d!52985 (=> res!82582 e!114927)))

(declare-fun lt!86181 () Bool)

(assert (=> d!52985 (= res!82582 (not lt!86181))))

(declare-fun lt!86180 () Bool)

(assert (=> d!52985 (= lt!86181 lt!86180)))

(declare-fun lt!86182 () Unit!5315)

(declare-fun e!114926 () Unit!5315)

(assert (=> d!52985 (= lt!86182 e!114926)))

(declare-fun c!31108 () Bool)

(assert (=> d!52985 (= c!31108 lt!86180)))

(assert (=> d!52985 (= lt!86180 (containsKey!189 (toList!1083 lt!85860) lt!85863))))

(assert (=> d!52985 (= (contains!1149 lt!85860 lt!85863) lt!86181)))

(declare-fun b!174040 () Bool)

(declare-fun lt!86179 () Unit!5315)

(assert (=> b!174040 (= e!114926 lt!86179)))

(assert (=> b!174040 (= lt!86179 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85860) lt!85863))))

(assert (=> b!174040 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85860) lt!85863))))

(declare-fun b!174041 () Bool)

(declare-fun Unit!5343 () Unit!5315)

(assert (=> b!174041 (= e!114926 Unit!5343)))

(declare-fun b!174042 () Bool)

(assert (=> b!174042 (= e!114927 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85860) lt!85863)))))

(assert (= (and d!52985 c!31108) b!174040))

(assert (= (and d!52985 (not c!31108)) b!174041))

(assert (= (and d!52985 (not res!82582)) b!174042))

(declare-fun m!202925 () Bool)

(assert (=> d!52985 m!202925))

(declare-fun m!202927 () Bool)

(assert (=> b!174040 m!202927))

(assert (=> b!174040 m!202379))

(assert (=> b!174040 m!202379))

(declare-fun m!202929 () Bool)

(assert (=> b!174040 m!202929))

(assert (=> b!174042 m!202379))

(assert (=> b!174042 m!202379))

(assert (=> b!174042 m!202929))

(assert (=> d!52779 d!52985))

(declare-fun d!52987 () Bool)

(assert (=> d!52987 (= (apply!130 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) lt!85863) (apply!130 lt!85860 lt!85863))))

(assert (=> d!52987 true))

(declare-fun _$34!1056 () Unit!5315)

(assert (=> d!52987 (= (choose!938 lt!85860 lt!85849 (minValue!3440 thiss!1248) lt!85863) _$34!1056)))

(declare-fun bs!7201 () Bool)

(assert (= bs!7201 d!52987))

(assert (=> bs!7201 m!201939))

(assert (=> bs!7201 m!201939))

(assert (=> bs!7201 m!201947))

(assert (=> bs!7201 m!201941))

(assert (=> d!52779 d!52987))

(assert (=> d!52779 d!52769))

(declare-fun d!52989 () Bool)

(declare-fun res!82583 () Bool)

(declare-fun e!114928 () Bool)

(assert (=> d!52989 (=> res!82583 e!114928)))

(assert (=> d!52989 (= res!82583 (and ((_ is Cons!2184) lt!85877) (= (_1!1612 (h!2801 lt!85877)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!52989 (= (containsKey!189 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114928)))

(declare-fun b!174043 () Bool)

(declare-fun e!114929 () Bool)

(assert (=> b!174043 (= e!114928 e!114929)))

(declare-fun res!82584 () Bool)

(assert (=> b!174043 (=> (not res!82584) (not e!114929))))

(assert (=> b!174043 (= res!82584 (and (or (not ((_ is Cons!2184) lt!85877)) (bvsle (_1!1612 (h!2801 lt!85877)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2184) lt!85877) (bvslt (_1!1612 (h!2801 lt!85877)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174044 () Bool)

(assert (=> b!174044 (= e!114929 (containsKey!189 (t!6987 lt!85877) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!52989 (not res!82583)) b!174043))

(assert (= (and b!174043 res!82584) b!174044))

(declare-fun m!202931 () Bool)

(assert (=> b!174044 m!202931))

(assert (=> b!173695 d!52989))

(declare-fun e!114931 () Option!192)

(declare-fun b!174047 () Bool)

(assert (=> b!174047 (= e!114931 (getValueByKey!186 (t!6987 (toList!1083 lt!86076)) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174046 () Bool)

(declare-fun e!114930 () Option!192)

(assert (=> b!174046 (= e!114930 e!114931)))

(declare-fun c!31110 () Bool)

(assert (=> b!174046 (= c!31110 (and ((_ is Cons!2184) (toList!1083 lt!86076)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86076))) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!174045 () Bool)

(assert (=> b!174045 (= e!114930 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86076)))))))

(declare-fun b!174048 () Bool)

(assert (=> b!174048 (= e!114931 None!190)))

(declare-fun d!52991 () Bool)

(declare-fun c!31109 () Bool)

(assert (=> d!52991 (= c!31109 (and ((_ is Cons!2184) (toList!1083 lt!86076)) (= (_1!1612 (h!2801 (toList!1083 lt!86076))) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!52991 (= (getValueByKey!186 (toList!1083 lt!86076) (_1!1612 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) e!114930)))

(assert (= (and d!52991 c!31109) b!174045))

(assert (= (and d!52991 (not c!31109)) b!174046))

(assert (= (and b!174046 c!31110) b!174047))

(assert (= (and b!174046 (not c!31110)) b!174048))

(declare-fun m!202933 () Bool)

(assert (=> b!174047 m!202933))

(assert (=> b!173771 d!52991))

(declare-fun d!52993 () Bool)

(assert (=> d!52993 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86183 () Unit!5315)

(assert (=> d!52993 (= lt!86183 (choose!937 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!114932 () Bool)

(assert (=> d!52993 e!114932))

(declare-fun res!82585 () Bool)

(assert (=> d!52993 (=> (not res!82585) (not e!114932))))

(assert (=> d!52993 (= res!82585 (isStrictlySorted!319 (toList!1083 lt!85850)))))

(assert (=> d!52993 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000) lt!86183)))

(declare-fun b!174049 () Bool)

(assert (=> b!174049 (= e!114932 (containsKey!189 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!52993 res!82585) b!174049))

(assert (=> d!52993 m!202149))

(assert (=> d!52993 m!202149))

(assert (=> d!52993 m!202151))

(declare-fun m!202935 () Bool)

(assert (=> d!52993 m!202935))

(assert (=> d!52993 m!202625))

(assert (=> b!174049 m!202145))

(assert (=> b!173615 d!52993))

(declare-fun d!52995 () Bool)

(assert (=> d!52995 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7202 () Bool)

(assert (= bs!7202 d!52995))

(assert (=> bs!7202 m!202149))

(declare-fun m!202937 () Bool)

(assert (=> bs!7202 m!202937))

(assert (=> b!173615 d!52995))

(assert (=> b!173615 d!52863))

(declare-fun d!52997 () Bool)

(declare-fun lt!86184 () Bool)

(assert (=> d!52997 (= lt!86184 (select (content!150 (toList!1083 lt!85942)) (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun e!114933 () Bool)

(assert (=> d!52997 (= lt!86184 e!114933)))

(declare-fun res!82586 () Bool)

(assert (=> d!52997 (=> (not res!82586) (not e!114933))))

(assert (=> d!52997 (= res!82586 ((_ is Cons!2184) (toList!1083 lt!85942)))))

(assert (=> d!52997 (= (contains!1151 (toList!1083 lt!85942) (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) lt!86184)))

(declare-fun b!174050 () Bool)

(declare-fun e!114934 () Bool)

(assert (=> b!174050 (= e!114933 e!114934)))

(declare-fun res!82587 () Bool)

(assert (=> b!174050 (=> res!82587 e!114934)))

(assert (=> b!174050 (= res!82587 (= (h!2801 (toList!1083 lt!85942)) (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(declare-fun b!174051 () Bool)

(assert (=> b!174051 (= e!114934 (contains!1151 (t!6987 (toList!1083 lt!85942)) (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))

(assert (= (and d!52997 res!82586) b!174050))

(assert (= (and b!174050 (not res!82587)) b!174051))

(declare-fun m!202939 () Bool)

(assert (=> d!52997 m!202939))

(declare-fun m!202941 () Bool)

(assert (=> d!52997 m!202941))

(declare-fun m!202943 () Bool)

(assert (=> b!174051 m!202943))

(assert (=> b!173562 d!52997))

(assert (=> d!52691 d!52689))

(declare-fun d!52999 () Bool)

(assert (=> d!52999 (= (getValueByKey!186 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309))) (Some!191 (_2!1612 (tuple2!3203 key!828 v!309))))))

(assert (=> d!52999 true))

(declare-fun _$22!535 () Unit!5315)

(assert (=> d!52999 (= (choose!936 lt!85915 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))) _$22!535)))

(declare-fun bs!7203 () Bool)

(assert (= bs!7203 d!52999))

(assert (=> bs!7203 m!202043))

(assert (=> d!52691 d!52999))

(declare-fun d!53001 () Bool)

(declare-fun res!82592 () Bool)

(declare-fun e!114939 () Bool)

(assert (=> d!53001 (=> res!82592 e!114939)))

(assert (=> d!53001 (= res!82592 (or ((_ is Nil!2185) lt!85915) ((_ is Nil!2185) (t!6987 lt!85915))))))

(assert (=> d!53001 (= (isStrictlySorted!319 lt!85915) e!114939)))

(declare-fun b!174056 () Bool)

(declare-fun e!114940 () Bool)

(assert (=> b!174056 (= e!114939 e!114940)))

(declare-fun res!82593 () Bool)

(assert (=> b!174056 (=> (not res!82593) (not e!114940))))

(assert (=> b!174056 (= res!82593 (bvslt (_1!1612 (h!2801 lt!85915)) (_1!1612 (h!2801 (t!6987 lt!85915)))))))

(declare-fun b!174057 () Bool)

(assert (=> b!174057 (= e!114940 (isStrictlySorted!319 (t!6987 lt!85915)))))

(assert (= (and d!53001 (not res!82592)) b!174056))

(assert (= (and b!174056 res!82593) b!174057))

(declare-fun m!202945 () Bool)

(assert (=> b!174057 m!202945))

(assert (=> d!52691 d!53001))

(declare-fun d!53003 () Bool)

(declare-fun lt!86185 () Bool)

(assert (=> d!53003 (= lt!86185 (select (content!150 (t!6987 (toList!1083 lt!85878))) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!114941 () Bool)

(assert (=> d!53003 (= lt!86185 e!114941)))

(declare-fun res!82594 () Bool)

(assert (=> d!53003 (=> (not res!82594) (not e!114941))))

(assert (=> d!53003 (= res!82594 ((_ is Cons!2184) (t!6987 (toList!1083 lt!85878))))))

(assert (=> d!53003 (= (contains!1151 (t!6987 (toList!1083 lt!85878)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!86185)))

(declare-fun b!174058 () Bool)

(declare-fun e!114942 () Bool)

(assert (=> b!174058 (= e!114941 e!114942)))

(declare-fun res!82595 () Bool)

(assert (=> b!174058 (=> res!82595 e!114942)))

(assert (=> b!174058 (= res!82595 (= (h!2801 (t!6987 (toList!1083 lt!85878))) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!174059 () Bool)

(assert (=> b!174059 (= e!114942 (contains!1151 (t!6987 (t!6987 (toList!1083 lt!85878))) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!53003 res!82594) b!174058))

(assert (= (and b!174058 (not res!82595)) b!174059))

(assert (=> d!53003 m!202923))

(declare-fun m!202947 () Bool)

(assert (=> d!53003 m!202947))

(declare-fun m!202949 () Bool)

(assert (=> b!174059 m!202949))

(assert (=> b!173602 d!53003))

(declare-fun d!53005 () Bool)

(assert (=> d!53005 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun lt!86186 () Unit!5315)

(assert (=> d!53005 (= lt!86186 (choose!937 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun e!114943 () Bool)

(assert (=> d!53005 e!114943))

(declare-fun res!82596 () Bool)

(assert (=> d!53005 (=> (not res!82596) (not e!114943))))

(assert (=> d!53005 (= res!82596 (isStrictlySorted!319 (toList!1083 lt!85916)))))

(assert (=> d!53005 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))) lt!86186)))

(declare-fun b!174060 () Bool)

(assert (=> b!174060 (= e!114943 (containsKey!189 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))))))

(assert (= (and d!53005 res!82596) b!174060))

(assert (=> d!53005 m!202049))

(assert (=> d!53005 m!202049))

(assert (=> d!53005 m!202059))

(declare-fun m!202951 () Bool)

(assert (=> d!53005 m!202951))

(declare-fun m!202953 () Bool)

(assert (=> d!53005 m!202953))

(assert (=> b!174060 m!202055))

(assert (=> b!173491 d!53005))

(declare-fun d!53007 () Bool)

(assert (=> d!53007 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309)))) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))))))))

(declare-fun bs!7204 () Bool)

(assert (= bs!7204 d!53007))

(assert (=> bs!7204 m!202049))

(declare-fun m!202955 () Bool)

(assert (=> bs!7204 m!202955))

(assert (=> b!173491 d!53007))

(assert (=> b!173491 d!52783))

(declare-fun d!53009 () Bool)

(declare-fun lt!86187 () Bool)

(assert (=> d!53009 (= lt!86187 (select (content!150 (toList!1083 lt!86021)) (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))

(declare-fun e!114944 () Bool)

(assert (=> d!53009 (= lt!86187 e!114944)))

(declare-fun res!82597 () Bool)

(assert (=> d!53009 (=> (not res!82597) (not e!114944))))

(assert (=> d!53009 (= res!82597 ((_ is Cons!2184) (toList!1083 lt!86021)))))

(assert (=> d!53009 (= (contains!1151 (toList!1083 lt!86021) (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) lt!86187)))

(declare-fun b!174061 () Bool)

(declare-fun e!114945 () Bool)

(assert (=> b!174061 (= e!114944 e!114945)))

(declare-fun res!82598 () Bool)

(assert (=> b!174061 (=> res!82598 e!114945)))

(assert (=> b!174061 (= res!82598 (= (h!2801 (toList!1083 lt!86021)) (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))

(declare-fun b!174062 () Bool)

(assert (=> b!174062 (= e!114945 (contains!1151 (t!6987 (toList!1083 lt!86021)) (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))

(assert (= (and d!53009 res!82597) b!174061))

(assert (= (and b!174061 (not res!82598)) b!174062))

(declare-fun m!202957 () Bool)

(assert (=> d!53009 m!202957))

(declare-fun m!202959 () Bool)

(assert (=> d!53009 m!202959))

(declare-fun m!202961 () Bool)

(assert (=> b!174062 m!202961))

(assert (=> b!173708 d!53009))

(declare-fun d!53011 () Bool)

(declare-fun e!114947 () Bool)

(assert (=> d!53011 e!114947))

(declare-fun res!82599 () Bool)

(assert (=> d!53011 (=> res!82599 e!114947)))

(declare-fun lt!86190 () Bool)

(assert (=> d!53011 (= res!82599 (not lt!86190))))

(declare-fun lt!86189 () Bool)

(assert (=> d!53011 (= lt!86190 lt!86189)))

(declare-fun lt!86191 () Unit!5315)

(declare-fun e!114946 () Unit!5315)

(assert (=> d!53011 (= lt!86191 e!114946)))

(declare-fun c!31111 () Bool)

(assert (=> d!53011 (= c!31111 lt!86189)))

(assert (=> d!53011 (= lt!86189 (containsKey!189 (toList!1083 lt!85987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53011 (= (contains!1149 lt!85987 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86190)))

(declare-fun b!174063 () Bool)

(declare-fun lt!86188 () Unit!5315)

(assert (=> b!174063 (= e!114946 lt!86188)))

(assert (=> b!174063 (= lt!86188 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174063 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85987) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174064 () Bool)

(declare-fun Unit!5344 () Unit!5315)

(assert (=> b!174064 (= e!114946 Unit!5344)))

(declare-fun b!174065 () Bool)

(assert (=> b!174065 (= e!114947 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53011 c!31111) b!174063))

(assert (= (and d!53011 (not c!31111)) b!174064))

(assert (= (and d!53011 (not res!82599)) b!174065))

(declare-fun m!202963 () Bool)

(assert (=> d!53011 m!202963))

(declare-fun m!202965 () Bool)

(assert (=> b!174063 m!202965))

(declare-fun m!202967 () Bool)

(assert (=> b!174063 m!202967))

(assert (=> b!174063 m!202967))

(declare-fun m!202969 () Bool)

(assert (=> b!174063 m!202969))

(assert (=> b!174065 m!202967))

(assert (=> b!174065 m!202967))

(assert (=> b!174065 m!202969))

(assert (=> bm!17596 d!53011))

(declare-fun d!53013 () Bool)

(assert (=> d!53013 (= (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) lt!85881)) (v!3957 (getValueByKey!186 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) lt!85881)))))

(assert (=> d!52819 d!53013))

(declare-fun e!114949 () Option!192)

(declare-fun b!174068 () Bool)

(assert (=> b!174068 (= e!114949 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))) lt!85881))))

(declare-fun b!174067 () Bool)

(declare-fun e!114948 () Option!192)

(assert (=> b!174067 (= e!114948 e!114949)))

(declare-fun c!31113 () Bool)

(assert (=> b!174067 (= c!31113 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))) lt!85881))))))

(declare-fun b!174066 () Bool)

(assert (=> b!174066 (= e!114948 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))))))))

(declare-fun b!174069 () Bool)

(assert (=> b!174069 (= e!114949 None!190)))

(declare-fun c!31112 () Bool)

(declare-fun d!53015 () Bool)

(assert (=> d!53015 (= c!31112 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))))) lt!85881)))))

(assert (=> d!53015 (= (getValueByKey!186 (toList!1083 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248)))) lt!85881) e!114948)))

(assert (= (and d!53015 c!31112) b!174066))

(assert (= (and d!53015 (not c!31112)) b!174067))

(assert (= (and b!174067 c!31113) b!174068))

(assert (= (and b!174067 (not c!31113)) b!174069))

(declare-fun m!202971 () Bool)

(assert (=> b!174068 m!202971))

(assert (=> d!52819 d!53015))

(declare-fun d!53017 () Bool)

(declare-fun e!114951 () Bool)

(assert (=> d!53017 e!114951))

(declare-fun res!82600 () Bool)

(assert (=> d!53017 (=> res!82600 e!114951)))

(declare-fun lt!86194 () Bool)

(assert (=> d!53017 (= res!82600 (not lt!86194))))

(declare-fun lt!86193 () Bool)

(assert (=> d!53017 (= lt!86194 lt!86193)))

(declare-fun lt!86195 () Unit!5315)

(declare-fun e!114950 () Unit!5315)

(assert (=> d!53017 (= lt!86195 e!114950)))

(declare-fun c!31114 () Bool)

(assert (=> d!53017 (= c!31114 lt!86193)))

(assert (=> d!53017 (= lt!86193 (containsKey!189 (toList!1083 lt!86085) (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(assert (=> d!53017 (= (contains!1149 lt!86085 (_1!1612 (tuple2!3203 lt!85890 v!309))) lt!86194)))

(declare-fun b!174070 () Bool)

(declare-fun lt!86192 () Unit!5315)

(assert (=> b!174070 (= e!114950 lt!86192)))

(assert (=> b!174070 (= lt!86192 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86085) (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(assert (=> b!174070 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86085) (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun b!174071 () Bool)

(declare-fun Unit!5345 () Unit!5315)

(assert (=> b!174071 (= e!114950 Unit!5345)))

(declare-fun b!174072 () Bool)

(assert (=> b!174072 (= e!114951 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86085) (_1!1612 (tuple2!3203 lt!85890 v!309)))))))

(assert (= (and d!53017 c!31114) b!174070))

(assert (= (and d!53017 (not c!31114)) b!174071))

(assert (= (and d!53017 (not res!82600)) b!174072))

(declare-fun m!202973 () Bool)

(assert (=> d!53017 m!202973))

(declare-fun m!202975 () Bool)

(assert (=> b!174070 m!202975))

(assert (=> b!174070 m!202537))

(assert (=> b!174070 m!202537))

(declare-fun m!202977 () Bool)

(assert (=> b!174070 m!202977))

(assert (=> b!174072 m!202537))

(assert (=> b!174072 m!202537))

(assert (=> b!174072 m!202977))

(assert (=> d!52827 d!53017))

(declare-fun b!174075 () Bool)

(declare-fun e!114953 () Option!192)

(assert (=> b!174075 (= e!114953 (getValueByKey!186 (t!6987 lt!86084) (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun b!174074 () Bool)

(declare-fun e!114952 () Option!192)

(assert (=> b!174074 (= e!114952 e!114953)))

(declare-fun c!31116 () Bool)

(assert (=> b!174074 (= c!31116 (and ((_ is Cons!2184) lt!86084) (not (= (_1!1612 (h!2801 lt!86084)) (_1!1612 (tuple2!3203 lt!85890 v!309))))))))

(declare-fun b!174073 () Bool)

(assert (=> b!174073 (= e!114952 (Some!191 (_2!1612 (h!2801 lt!86084))))))

(declare-fun b!174076 () Bool)

(assert (=> b!174076 (= e!114953 None!190)))

(declare-fun d!53019 () Bool)

(declare-fun c!31115 () Bool)

(assert (=> d!53019 (= c!31115 (and ((_ is Cons!2184) lt!86084) (= (_1!1612 (h!2801 lt!86084)) (_1!1612 (tuple2!3203 lt!85890 v!309)))))))

(assert (=> d!53019 (= (getValueByKey!186 lt!86084 (_1!1612 (tuple2!3203 lt!85890 v!309))) e!114952)))

(assert (= (and d!53019 c!31115) b!174073))

(assert (= (and d!53019 (not c!31115)) b!174074))

(assert (= (and b!174074 c!31116) b!174075))

(assert (= (and b!174074 (not c!31116)) b!174076))

(declare-fun m!202979 () Bool)

(assert (=> b!174075 m!202979))

(assert (=> d!52827 d!53019))

(declare-fun d!53021 () Bool)

(assert (=> d!53021 (= (getValueByKey!186 lt!86084 (_1!1612 (tuple2!3203 lt!85890 v!309))) (Some!191 (_2!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun lt!86196 () Unit!5315)

(assert (=> d!53021 (= lt!86196 (choose!936 lt!86084 (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun e!114954 () Bool)

(assert (=> d!53021 e!114954))

(declare-fun res!82601 () Bool)

(assert (=> d!53021 (=> (not res!82601) (not e!114954))))

(assert (=> d!53021 (= res!82601 (isStrictlySorted!319 lt!86084))))

(assert (=> d!53021 (= (lemmaContainsTupThenGetReturnValue!99 lt!86084 (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309))) lt!86196)))

(declare-fun b!174077 () Bool)

(declare-fun res!82602 () Bool)

(assert (=> b!174077 (=> (not res!82602) (not e!114954))))

(assert (=> b!174077 (= res!82602 (containsKey!189 lt!86084 (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun b!174078 () Bool)

(assert (=> b!174078 (= e!114954 (contains!1151 lt!86084 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309)))))))

(assert (= (and d!53021 res!82601) b!174077))

(assert (= (and b!174077 res!82602) b!174078))

(assert (=> d!53021 m!202531))

(declare-fun m!202981 () Bool)

(assert (=> d!53021 m!202981))

(declare-fun m!202983 () Bool)

(assert (=> d!53021 m!202983))

(declare-fun m!202985 () Bool)

(assert (=> b!174077 m!202985))

(declare-fun m!202987 () Bool)

(assert (=> b!174078 m!202987))

(assert (=> d!52827 d!53021))

(declare-fun d!53023 () Bool)

(declare-fun e!114956 () Bool)

(assert (=> d!53023 e!114956))

(declare-fun res!82603 () Bool)

(assert (=> d!53023 (=> (not res!82603) (not e!114956))))

(declare-fun lt!86197 () List!2188)

(assert (=> d!53023 (= res!82603 (isStrictlySorted!319 lt!86197))))

(declare-fun e!114959 () List!2188)

(assert (=> d!53023 (= lt!86197 e!114959)))

(declare-fun c!31119 () Bool)

(assert (=> d!53023 (= c!31119 (and ((_ is Cons!2184) (toList!1083 lt!85892)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85892))) (_1!1612 (tuple2!3203 lt!85890 v!309)))))))

(assert (=> d!53023 (isStrictlySorted!319 (toList!1083 lt!85892))))

(assert (=> d!53023 (= (insertStrictlySorted!102 (toList!1083 lt!85892) (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309))) lt!86197)))

(declare-fun b!174079 () Bool)

(declare-fun call!17632 () List!2188)

(assert (=> b!174079 (= e!114959 call!17632)))

(declare-fun bm!17629 () Bool)

(declare-fun call!17633 () List!2188)

(declare-fun call!17634 () List!2188)

(assert (=> bm!17629 (= call!17633 call!17634)))

(declare-fun b!174080 () Bool)

(assert (=> b!174080 (= e!114956 (contains!1151 lt!86197 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309)))))))

(declare-fun b!174081 () Bool)

(declare-fun e!114958 () List!2188)

(assert (=> b!174081 (= e!114958 call!17633)))

(declare-fun b!174082 () Bool)

(declare-fun e!114955 () List!2188)

(assert (=> b!174082 (= e!114955 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85892)) (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun bm!17630 () Bool)

(assert (=> bm!17630 (= call!17632 ($colon$colon!97 e!114955 (ite c!31119 (h!2801 (toList!1083 lt!85892)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85890 v!309)) (_2!1612 (tuple2!3203 lt!85890 v!309))))))))

(declare-fun c!31117 () Bool)

(assert (=> bm!17630 (= c!31117 c!31119)))

(declare-fun b!174083 () Bool)

(declare-fun e!114957 () List!2188)

(assert (=> b!174083 (= e!114957 call!17634)))

(declare-fun b!174084 () Bool)

(assert (=> b!174084 (= e!114958 call!17633)))

(declare-fun b!174085 () Bool)

(assert (=> b!174085 (= e!114959 e!114957)))

(declare-fun c!31120 () Bool)

(assert (=> b!174085 (= c!31120 (and ((_ is Cons!2184) (toList!1083 lt!85892)) (= (_1!1612 (h!2801 (toList!1083 lt!85892))) (_1!1612 (tuple2!3203 lt!85890 v!309)))))))

(declare-fun b!174086 () Bool)

(declare-fun c!31118 () Bool)

(assert (=> b!174086 (= e!114955 (ite c!31120 (t!6987 (toList!1083 lt!85892)) (ite c!31118 (Cons!2184 (h!2801 (toList!1083 lt!85892)) (t!6987 (toList!1083 lt!85892))) Nil!2185)))))

(declare-fun bm!17631 () Bool)

(assert (=> bm!17631 (= call!17634 call!17632)))

(declare-fun b!174087 () Bool)

(declare-fun res!82604 () Bool)

(assert (=> b!174087 (=> (not res!82604) (not e!114956))))

(assert (=> b!174087 (= res!82604 (containsKey!189 lt!86197 (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun b!174088 () Bool)

(assert (=> b!174088 (= c!31118 (and ((_ is Cons!2184) (toList!1083 lt!85892)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85892))) (_1!1612 (tuple2!3203 lt!85890 v!309)))))))

(assert (=> b!174088 (= e!114957 e!114958)))

(assert (= (and d!53023 c!31119) b!174079))

(assert (= (and d!53023 (not c!31119)) b!174085))

(assert (= (and b!174085 c!31120) b!174083))

(assert (= (and b!174085 (not c!31120)) b!174088))

(assert (= (and b!174088 c!31118) b!174084))

(assert (= (and b!174088 (not c!31118)) b!174081))

(assert (= (or b!174084 b!174081) bm!17629))

(assert (= (or b!174083 bm!17629) bm!17631))

(assert (= (or b!174079 bm!17631) bm!17630))

(assert (= (and bm!17630 c!31117) b!174082))

(assert (= (and bm!17630 (not c!31117)) b!174086))

(assert (= (and d!53023 res!82603) b!174087))

(assert (= (and b!174087 res!82604) b!174080))

(declare-fun m!202989 () Bool)

(assert (=> bm!17630 m!202989))

(declare-fun m!202991 () Bool)

(assert (=> b!174082 m!202991))

(declare-fun m!202993 () Bool)

(assert (=> b!174087 m!202993))

(declare-fun m!202995 () Bool)

(assert (=> b!174080 m!202995))

(declare-fun m!202997 () Bool)

(assert (=> d!53023 m!202997))

(declare-fun m!202999 () Bool)

(assert (=> d!53023 m!202999))

(assert (=> d!52827 d!53023))

(declare-fun d!53025 () Bool)

(declare-fun res!82605 () Bool)

(declare-fun e!114960 () Bool)

(assert (=> d!53025 (=> res!82605 e!114960)))

(assert (=> d!53025 (= res!82605 (and ((_ is Cons!2184) lt!86017) (= (_1!1612 (h!2801 lt!86017)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53025 (= (containsKey!189 lt!86017 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!114960)))

(declare-fun b!174089 () Bool)

(declare-fun e!114961 () Bool)

(assert (=> b!174089 (= e!114960 e!114961)))

(declare-fun res!82606 () Bool)

(assert (=> b!174089 (=> (not res!82606) (not e!114961))))

(assert (=> b!174089 (= res!82606 (and (or (not ((_ is Cons!2184) lt!86017)) (bvsle (_1!1612 (h!2801 lt!86017)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2184) lt!86017) (bvslt (_1!1612 (h!2801 lt!86017)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174090 () Bool)

(assert (=> b!174090 (= e!114961 (containsKey!189 (t!6987 lt!86017) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53025 (not res!82605)) b!174089))

(assert (= (and b!174089 res!82606) b!174090))

(declare-fun m!203001 () Bool)

(assert (=> b!174090 m!203001))

(assert (=> b!173705 d!53025))

(declare-fun d!53027 () Bool)

(assert (=> d!53027 (= (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309))) lt!85896)) (v!3957 (getValueByKey!186 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309))) lt!85896)))))

(assert (=> d!52811 d!53027))

(declare-fun e!114963 () Option!192)

(declare-fun b!174093 () Bool)

(assert (=> b!174093 (= e!114963 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)))) lt!85896))))

(declare-fun b!174092 () Bool)

(declare-fun e!114962 () Option!192)

(assert (=> b!174092 (= e!114962 e!114963)))

(declare-fun c!31122 () Bool)

(assert (=> b!174092 (= c!31122 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309))))) lt!85896))))))

(declare-fun b!174091 () Bool)

(assert (=> b!174091 (= e!114962 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)))))))))

(declare-fun b!174094 () Bool)

(assert (=> b!174094 (= e!114963 None!190)))

(declare-fun c!31121 () Bool)

(declare-fun d!53029 () Bool)

(assert (=> d!53029 (= c!31121 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309))))) lt!85896)))))

(assert (=> d!53029 (= (getValueByKey!186 (toList!1083 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309))) lt!85896) e!114962)))

(assert (= (and d!53029 c!31121) b!174091))

(assert (= (and d!53029 (not c!31121)) b!174092))

(assert (= (and b!174092 c!31122) b!174093))

(assert (= (and b!174092 (not c!31122)) b!174094))

(declare-fun m!203003 () Bool)

(assert (=> b!174093 m!203003))

(assert (=> d!52811 d!53029))

(declare-fun d!53031 () Bool)

(assert (=> d!53031 (= (apply!130 lt!85987 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1975 (getValueByKey!186 (toList!1083 lt!85987) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7205 () Bool)

(assert (= bs!7205 d!53031))

(assert (=> bs!7205 m!202967))

(assert (=> bs!7205 m!202967))

(declare-fun m!203005 () Bool)

(assert (=> bs!7205 m!203005))

(assert (=> b!173665 d!53031))

(assert (=> b!173573 d!52845))

(declare-fun e!114965 () Option!192)

(declare-fun b!174097 () Bool)

(assert (=> b!174097 (= e!114965 (getValueByKey!186 (t!6987 (toList!1083 lt!86031)) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))

(declare-fun b!174096 () Bool)

(declare-fun e!114964 () Option!192)

(assert (=> b!174096 (= e!114964 e!114965)))

(declare-fun c!31124 () Bool)

(assert (=> b!174096 (= c!31124 (and ((_ is Cons!2184) (toList!1083 lt!86031)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86031))) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))))))

(declare-fun b!174095 () Bool)

(assert (=> b!174095 (= e!114964 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86031)))))))

(declare-fun b!174098 () Bool)

(assert (=> b!174098 (= e!114965 None!190)))

(declare-fun c!31123 () Bool)

(declare-fun d!53033 () Bool)

(assert (=> d!53033 (= c!31123 (and ((_ is Cons!2184) (toList!1083 lt!86031)) (= (_1!1612 (h!2801 (toList!1083 lt!86031))) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!53033 (= (getValueByKey!186 (toList!1083 lt!86031) (_1!1612 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) e!114964)))

(assert (= (and d!53033 c!31123) b!174095))

(assert (= (and d!53033 (not c!31123)) b!174096))

(assert (= (and b!174096 c!31124) b!174097))

(assert (= (and b!174096 (not c!31124)) b!174098))

(declare-fun m!203007 () Bool)

(assert (=> b!174097 m!203007))

(assert (=> b!173714 d!53033))

(declare-fun d!53035 () Bool)

(declare-fun e!114966 () Bool)

(assert (=> d!53035 e!114966))

(declare-fun res!82608 () Bool)

(assert (=> d!53035 (=> (not res!82608) (not e!114966))))

(declare-fun lt!86201 () ListLongMap!2135)

(assert (=> d!53035 (= res!82608 (contains!1149 lt!86201 (_1!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))))))

(declare-fun lt!86200 () List!2188)

(assert (=> d!53035 (= lt!86201 (ListLongMap!2136 lt!86200))))

(declare-fun lt!86199 () Unit!5315)

(declare-fun lt!86198 () Unit!5315)

(assert (=> d!53035 (= lt!86199 lt!86198)))

(assert (=> d!53035 (= (getValueByKey!186 lt!86200 (_1!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))) (Some!191 (_2!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))))))

(assert (=> d!53035 (= lt!86198 (lemmaContainsTupThenGetReturnValue!99 lt!86200 (_1!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))) (_2!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))))))

(assert (=> d!53035 (= lt!86200 (insertStrictlySorted!102 (toList!1083 (ite c!30991 call!17601 (ite c!30993 call!17595 call!17597))) (_1!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))) (_2!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))))))

(assert (=> d!53035 (= (+!245 (ite c!30991 call!17601 (ite c!30993 call!17595 call!17597)) (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))) lt!86201)))

(declare-fun b!174099 () Bool)

(declare-fun res!82607 () Bool)

(assert (=> b!174099 (=> (not res!82607) (not e!114966))))

(assert (=> b!174099 (= res!82607 (= (getValueByKey!186 (toList!1083 lt!86201) (_1!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))) (Some!191 (_2!1612 (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))))))))

(declare-fun b!174100 () Bool)

(assert (=> b!174100 (= e!114966 (contains!1151 (toList!1083 lt!86201) (ite (or c!30991 c!30993) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 lt!85779)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))))))

(assert (= (and d!53035 res!82608) b!174099))

(assert (= (and b!174099 res!82607) b!174100))

(declare-fun m!203009 () Bool)

(assert (=> d!53035 m!203009))

(declare-fun m!203011 () Bool)

(assert (=> d!53035 m!203011))

(declare-fun m!203013 () Bool)

(assert (=> d!53035 m!203013))

(declare-fun m!203015 () Bool)

(assert (=> d!53035 m!203015))

(declare-fun m!203017 () Bool)

(assert (=> b!174099 m!203017))

(declare-fun m!203019 () Bool)

(assert (=> b!174100 m!203019))

(assert (=> bm!17595 d!53035))

(declare-fun d!53037 () Bool)

(assert (=> d!53037 (= (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) lt!85863)) (v!3957 (getValueByKey!186 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) lt!85863)))))

(assert (=> d!52757 d!53037))

(declare-fun e!114968 () Option!192)

(declare-fun b!174103 () Bool)

(assert (=> b!174103 (= e!114968 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))) lt!85863))))

(declare-fun b!174102 () Bool)

(declare-fun e!114967 () Option!192)

(assert (=> b!174102 (= e!114967 e!114968)))

(declare-fun c!31126 () Bool)

(assert (=> b!174102 (= c!31126 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))) lt!85863))))))

(declare-fun b!174101 () Bool)

(assert (=> b!174101 (= e!114967 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))))

(declare-fun b!174104 () Bool)

(assert (=> b!174104 (= e!114968 None!190)))

(declare-fun d!53039 () Bool)

(declare-fun c!31125 () Bool)

(assert (=> d!53039 (= c!31125 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))) lt!85863)))))

(assert (=> d!53039 (= (getValueByKey!186 (toList!1083 (+!245 lt!85860 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) lt!85863) e!114967)))

(assert (= (and d!53039 c!31125) b!174101))

(assert (= (and d!53039 (not c!31125)) b!174102))

(assert (= (and b!174102 c!31126) b!174103))

(assert (= (and b!174102 (not c!31126)) b!174104))

(declare-fun m!203021 () Bool)

(assert (=> b!174103 m!203021))

(assert (=> d!52757 d!53039))

(declare-fun d!53041 () Bool)

(declare-fun res!82609 () Bool)

(declare-fun e!114969 () Bool)

(assert (=> d!53041 (=> res!82609 e!114969)))

(assert (=> d!53041 (= res!82609 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))) lt!85859)))))

(assert (=> d!53041 (= (containsKey!189 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))) lt!85859) e!114969)))

(declare-fun b!174105 () Bool)

(declare-fun e!114970 () Bool)

(assert (=> b!174105 (= e!114969 e!114970)))

(declare-fun res!82610 () Bool)

(assert (=> b!174105 (=> (not res!82610) (not e!114970))))

(assert (=> b!174105 (= res!82610 (and (or (not ((_ is Cons!2184) (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))) (bvsle (_1!1612 (h!2801 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))) lt!85859)) ((_ is Cons!2184) (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))) (bvslt (_1!1612 (h!2801 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248)))))) lt!85859)))))

(declare-fun b!174106 () Bool)

(assert (=> b!174106 (= e!114970 (containsKey!189 (t!6987 (toList!1083 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))))) lt!85859))))

(assert (= (and d!53041 (not res!82609)) b!174105))

(assert (= (and b!174105 res!82610) b!174106))

(declare-fun m!203023 () Bool)

(assert (=> b!174106 m!203023))

(assert (=> d!52767 d!53041))

(declare-fun d!53043 () Bool)

(declare-fun e!114972 () Bool)

(assert (=> d!53043 e!114972))

(declare-fun res!82611 () Bool)

(assert (=> d!53043 (=> res!82611 e!114972)))

(declare-fun lt!86204 () Bool)

(assert (=> d!53043 (= res!82611 (not lt!86204))))

(declare-fun lt!86203 () Bool)

(assert (=> d!53043 (= lt!86204 lt!86203)))

(declare-fun lt!86205 () Unit!5315)

(declare-fun e!114971 () Unit!5315)

(assert (=> d!53043 (= lt!86205 e!114971)))

(declare-fun c!31127 () Bool)

(assert (=> d!53043 (= c!31127 lt!86203)))

(assert (=> d!53043 (= lt!86203 (containsKey!189 (toList!1083 lt!86040) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(assert (=> d!53043 (= (contains!1149 lt!86040 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) lt!86204)))

(declare-fun b!174107 () Bool)

(declare-fun lt!86202 () Unit!5315)

(assert (=> b!174107 (= e!114971 lt!86202)))

(assert (=> b!174107 (= lt!86202 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86040) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(assert (=> b!174107 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86040) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun b!174108 () Bool)

(declare-fun Unit!5346 () Unit!5315)

(assert (=> b!174108 (= e!114971 Unit!5346)))

(declare-fun b!174109 () Bool)

(assert (=> b!174109 (= e!114972 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86040) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(assert (= (and d!53043 c!31127) b!174107))

(assert (= (and d!53043 (not c!31127)) b!174108))

(assert (= (and d!53043 (not res!82611)) b!174109))

(declare-fun m!203025 () Bool)

(assert (=> d!53043 m!203025))

(declare-fun m!203027 () Bool)

(assert (=> b!174107 m!203027))

(assert (=> b!174107 m!202359))

(assert (=> b!174107 m!202359))

(declare-fun m!203029 () Bool)

(assert (=> b!174107 m!203029))

(assert (=> b!174109 m!202359))

(assert (=> b!174109 m!202359))

(assert (=> b!174109 m!203029))

(assert (=> d!52769 d!53043))

(declare-fun e!114974 () Option!192)

(declare-fun b!174112 () Bool)

(assert (=> b!174112 (= e!114974 (getValueByKey!186 (t!6987 lt!86039) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun b!174111 () Bool)

(declare-fun e!114973 () Option!192)

(assert (=> b!174111 (= e!114973 e!114974)))

(declare-fun c!31129 () Bool)

(assert (=> b!174111 (= c!31129 (and ((_ is Cons!2184) lt!86039) (not (= (_1!1612 (h!2801 lt!86039)) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174110 () Bool)

(assert (=> b!174110 (= e!114973 (Some!191 (_2!1612 (h!2801 lt!86039))))))

(declare-fun b!174113 () Bool)

(assert (=> b!174113 (= e!114974 None!190)))

(declare-fun c!31128 () Bool)

(declare-fun d!53045 () Bool)

(assert (=> d!53045 (= c!31128 (and ((_ is Cons!2184) lt!86039) (= (_1!1612 (h!2801 lt!86039)) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(assert (=> d!53045 (= (getValueByKey!186 lt!86039 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) e!114973)))

(assert (= (and d!53045 c!31128) b!174110))

(assert (= (and d!53045 (not c!31128)) b!174111))

(assert (= (and b!174111 c!31129) b!174112))

(assert (= (and b!174111 (not c!31129)) b!174113))

(declare-fun m!203031 () Bool)

(assert (=> b!174112 m!203031))

(assert (=> d!52769 d!53045))

(declare-fun d!53047 () Bool)

(assert (=> d!53047 (= (getValueByKey!186 lt!86039 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86206 () Unit!5315)

(assert (=> d!53047 (= lt!86206 (choose!936 lt!86039 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun e!114975 () Bool)

(assert (=> d!53047 e!114975))

(declare-fun res!82612 () Bool)

(assert (=> d!53047 (=> (not res!82612) (not e!114975))))

(assert (=> d!53047 (= res!82612 (isStrictlySorted!319 lt!86039))))

(assert (=> d!53047 (= (lemmaContainsTupThenGetReturnValue!99 lt!86039 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) lt!86206)))

(declare-fun b!174114 () Bool)

(declare-fun res!82613 () Bool)

(assert (=> b!174114 (=> (not res!82613) (not e!114975))))

(assert (=> b!174114 (= res!82613 (containsKey!189 lt!86039 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun b!174115 () Bool)

(assert (=> b!174115 (= e!114975 (contains!1151 lt!86039 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(assert (= (and d!53047 res!82612) b!174114))

(assert (= (and b!174114 res!82613) b!174115))

(assert (=> d!53047 m!202353))

(declare-fun m!203033 () Bool)

(assert (=> d!53047 m!203033))

(declare-fun m!203035 () Bool)

(assert (=> d!53047 m!203035))

(declare-fun m!203037 () Bool)

(assert (=> b!174114 m!203037))

(declare-fun m!203039 () Bool)

(assert (=> b!174115 m!203039))

(assert (=> d!52769 d!53047))

(declare-fun d!53049 () Bool)

(declare-fun e!114977 () Bool)

(assert (=> d!53049 e!114977))

(declare-fun res!82614 () Bool)

(assert (=> d!53049 (=> (not res!82614) (not e!114977))))

(declare-fun lt!86207 () List!2188)

(assert (=> d!53049 (= res!82614 (isStrictlySorted!319 lt!86207))))

(declare-fun e!114980 () List!2188)

(assert (=> d!53049 (= lt!86207 e!114980)))

(declare-fun c!31132 () Bool)

(assert (=> d!53049 (= c!31132 (and ((_ is Cons!2184) (toList!1083 lt!85860)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85860))) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(assert (=> d!53049 (isStrictlySorted!319 (toList!1083 lt!85860))))

(assert (=> d!53049 (= (insertStrictlySorted!102 (toList!1083 lt!85860) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) lt!86207)))

(declare-fun b!174116 () Bool)

(declare-fun call!17635 () List!2188)

(assert (=> b!174116 (= e!114980 call!17635)))

(declare-fun bm!17632 () Bool)

(declare-fun call!17636 () List!2188)

(declare-fun call!17637 () List!2188)

(assert (=> bm!17632 (= call!17636 call!17637)))

(declare-fun b!174117 () Bool)

(assert (=> b!174117 (= e!114977 (contains!1151 lt!86207 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(declare-fun b!174118 () Bool)

(declare-fun e!114979 () List!2188)

(assert (=> b!174118 (= e!114979 call!17636)))

(declare-fun e!114976 () List!2188)

(declare-fun b!174119 () Bool)

(assert (=> b!174119 (= e!114976 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85860)) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun bm!17633 () Bool)

(assert (=> bm!17633 (= call!17635 ($colon$colon!97 e!114976 (ite c!31132 (h!2801 (toList!1083 lt!85860)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))))

(declare-fun c!31130 () Bool)

(assert (=> bm!17633 (= c!31130 c!31132)))

(declare-fun b!174120 () Bool)

(declare-fun e!114978 () List!2188)

(assert (=> b!174120 (= e!114978 call!17637)))

(declare-fun b!174121 () Bool)

(assert (=> b!174121 (= e!114979 call!17636)))

(declare-fun b!174122 () Bool)

(assert (=> b!174122 (= e!114980 e!114978)))

(declare-fun c!31133 () Bool)

(assert (=> b!174122 (= c!31133 (and ((_ is Cons!2184) (toList!1083 lt!85860)) (= (_1!1612 (h!2801 (toList!1083 lt!85860))) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(declare-fun c!31131 () Bool)

(declare-fun b!174123 () Bool)

(assert (=> b!174123 (= e!114976 (ite c!31133 (t!6987 (toList!1083 lt!85860)) (ite c!31131 (Cons!2184 (h!2801 (toList!1083 lt!85860)) (t!6987 (toList!1083 lt!85860))) Nil!2185)))))

(declare-fun bm!17634 () Bool)

(assert (=> bm!17634 (= call!17637 call!17635)))

(declare-fun b!174124 () Bool)

(declare-fun res!82615 () Bool)

(assert (=> b!174124 (=> (not res!82615) (not e!114977))))

(assert (=> b!174124 (= res!82615 (containsKey!189 lt!86207 (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun b!174125 () Bool)

(assert (=> b!174125 (= c!31131 (and ((_ is Cons!2184) (toList!1083 lt!85860)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85860))) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(assert (=> b!174125 (= e!114978 e!114979)))

(assert (= (and d!53049 c!31132) b!174116))

(assert (= (and d!53049 (not c!31132)) b!174122))

(assert (= (and b!174122 c!31133) b!174120))

(assert (= (and b!174122 (not c!31133)) b!174125))

(assert (= (and b!174125 c!31131) b!174121))

(assert (= (and b!174125 (not c!31131)) b!174118))

(assert (= (or b!174121 b!174118) bm!17632))

(assert (= (or b!174120 bm!17632) bm!17634))

(assert (= (or b!174116 bm!17634) bm!17633))

(assert (= (and bm!17633 c!31130) b!174119))

(assert (= (and bm!17633 (not c!31130)) b!174123))

(assert (= (and d!53049 res!82614) b!174124))

(assert (= (and b!174124 res!82615) b!174117))

(declare-fun m!203041 () Bool)

(assert (=> bm!17633 m!203041))

(declare-fun m!203043 () Bool)

(assert (=> b!174119 m!203043))

(declare-fun m!203045 () Bool)

(assert (=> b!174124 m!203045))

(declare-fun m!203047 () Bool)

(assert (=> b!174117 m!203047))

(declare-fun m!203049 () Bool)

(assert (=> d!53049 m!203049))

(declare-fun m!203051 () Bool)

(assert (=> d!53049 m!203051))

(assert (=> d!52769 d!53049))

(assert (=> bm!17591 d!52891))

(declare-fun d!53051 () Bool)

(assert (=> d!53051 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun bs!7206 () Bool)

(assert (= bs!7206 d!53051))

(assert (=> bs!7206 m!202181))

(declare-fun m!203053 () Bool)

(assert (=> bs!7206 m!203053))

(assert (=> b!173790 d!53051))

(declare-fun b!174128 () Bool)

(declare-fun e!114982 () Option!192)

(assert (=> b!174128 (= e!114982 (getValueByKey!186 (t!6987 (toList!1083 lt!85850)) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174127 () Bool)

(declare-fun e!114981 () Option!192)

(assert (=> b!174127 (= e!114981 e!114982)))

(declare-fun c!31135 () Bool)

(assert (=> b!174127 (= c!31135 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85850))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))))

(declare-fun b!174126 () Bool)

(assert (=> b!174126 (= e!114981 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85850)))))))

(declare-fun b!174129 () Bool)

(assert (=> b!174129 (= e!114982 None!190)))

(declare-fun d!53053 () Bool)

(declare-fun c!31134 () Bool)

(assert (=> d!53053 (= c!31134 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (= (_1!1612 (h!2801 (toList!1083 lt!85850))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!53053 (= (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) e!114981)))

(assert (= (and d!53053 c!31134) b!174126))

(assert (= (and d!53053 (not c!31134)) b!174127))

(assert (= (and b!174127 c!31135) b!174128))

(assert (= (and b!174127 (not c!31135)) b!174129))

(assert (=> b!174128 m!201909))

(declare-fun m!203055 () Bool)

(assert (=> b!174128 m!203055))

(assert (=> b!173790 d!53053))

(declare-fun e!114984 () Option!192)

(declare-fun b!174132 () Bool)

(assert (=> b!174132 (= e!114984 (getValueByKey!186 (t!6987 (toList!1083 lt!86065)) (_1!1612 (tuple2!3203 lt!85883 v!309))))))

(declare-fun b!174131 () Bool)

(declare-fun e!114983 () Option!192)

(assert (=> b!174131 (= e!114983 e!114984)))

(declare-fun c!31137 () Bool)

(assert (=> b!174131 (= c!31137 (and ((_ is Cons!2184) (toList!1083 lt!86065)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86065))) (_1!1612 (tuple2!3203 lt!85883 v!309))))))))

(declare-fun b!174130 () Bool)

(assert (=> b!174130 (= e!114983 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86065)))))))

(declare-fun b!174133 () Bool)

(assert (=> b!174133 (= e!114984 None!190)))

(declare-fun c!31136 () Bool)

(declare-fun d!53055 () Bool)

(assert (=> d!53055 (= c!31136 (and ((_ is Cons!2184) (toList!1083 lt!86065)) (= (_1!1612 (h!2801 (toList!1083 lt!86065))) (_1!1612 (tuple2!3203 lt!85883 v!309)))))))

(assert (=> d!53055 (= (getValueByKey!186 (toList!1083 lt!86065) (_1!1612 (tuple2!3203 lt!85883 v!309))) e!114983)))

(assert (= (and d!53055 c!31136) b!174130))

(assert (= (and d!53055 (not c!31136)) b!174131))

(assert (= (and b!174131 c!31137) b!174132))

(assert (= (and b!174131 (not c!31137)) b!174133))

(declare-fun m!203057 () Bool)

(assert (=> b!174132 m!203057))

(assert (=> b!173765 d!53055))

(declare-fun d!53057 () Bool)

(assert (=> d!53057 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun bs!7207 () Bool)

(assert (= bs!7207 d!53057))

(assert (=> bs!7207 m!201971))

(declare-fun m!203059 () Bool)

(assert (=> bs!7207 m!203059))

(assert (=> b!173690 d!53057))

(assert (=> b!173690 d!52713))

(declare-fun d!53059 () Bool)

(assert (=> d!53059 (= (size!3763 thiss!1248) (bvadd (_size!1200 thiss!1248) (bvsdiv (bvadd (extraKeys!3336 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!173786 d!53059))

(declare-fun d!53061 () Bool)

(declare-fun lt!86210 () Bool)

(declare-fun content!151 (List!2191) (InoxSet (_ BitVec 64)))

(assert (=> d!53061 (= lt!86210 (select (content!151 Nil!2188) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!114989 () Bool)

(assert (=> d!53061 (= lt!86210 e!114989)))

(declare-fun res!82621 () Bool)

(assert (=> d!53061 (=> (not res!82621) (not e!114989))))

(assert (=> d!53061 (= res!82621 ((_ is Cons!2187) Nil!2188))))

(assert (=> d!53061 (= (contains!1152 Nil!2188 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) lt!86210)))

(declare-fun b!174138 () Bool)

(declare-fun e!114990 () Bool)

(assert (=> b!174138 (= e!114989 e!114990)))

(declare-fun res!82620 () Bool)

(assert (=> b!174138 (=> res!82620 e!114990)))

(assert (=> b!174138 (= res!82620 (= (h!2804 Nil!2188) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174139 () Bool)

(assert (=> b!174139 (= e!114990 (contains!1152 (t!6992 Nil!2188) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53061 res!82621) b!174138))

(assert (= (and b!174138 (not res!82620)) b!174139))

(declare-fun m!203061 () Bool)

(assert (=> d!53061 m!203061))

(assert (=> d!53061 m!201909))

(declare-fun m!203063 () Bool)

(assert (=> d!53061 m!203063))

(assert (=> b!174139 m!201909))

(declare-fun m!203065 () Bool)

(assert (=> b!174139 m!203065))

(assert (=> b!173762 d!53061))

(declare-fun d!53063 () Bool)

(assert (=> d!53063 (= (get!1977 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!173662 d!53063))

(assert (=> d!52699 d!52701))

(assert (=> d!52699 d!52703))

(declare-fun d!53065 () Bool)

(assert (=> d!53065 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85777) key!828))))

(assert (=> d!53065 true))

(declare-fun _$12!446 () Unit!5315)

(assert (=> d!53065 (= (choose!937 (toList!1083 lt!85777) key!828) _$12!446)))

(declare-fun bs!7208 () Bool)

(assert (= bs!7208 d!53065))

(assert (=> bs!7208 m!202035))

(assert (=> bs!7208 m!202035))

(assert (=> bs!7208 m!202037))

(assert (=> d!52699 d!53065))

(declare-fun d!53067 () Bool)

(declare-fun res!82622 () Bool)

(declare-fun e!114991 () Bool)

(assert (=> d!53067 (=> res!82622 e!114991)))

(assert (=> d!53067 (= res!82622 (or ((_ is Nil!2185) (toList!1083 lt!85777)) ((_ is Nil!2185) (t!6987 (toList!1083 lt!85777)))))))

(assert (=> d!53067 (= (isStrictlySorted!319 (toList!1083 lt!85777)) e!114991)))

(declare-fun b!174140 () Bool)

(declare-fun e!114992 () Bool)

(assert (=> b!174140 (= e!114991 e!114992)))

(declare-fun res!82623 () Bool)

(assert (=> b!174140 (=> (not res!82623) (not e!114992))))

(assert (=> b!174140 (= res!82623 (bvslt (_1!1612 (h!2801 (toList!1083 lt!85777))) (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85777))))))))

(declare-fun b!174141 () Bool)

(assert (=> b!174141 (= e!114992 (isStrictlySorted!319 (t!6987 (toList!1083 lt!85777))))))

(assert (= (and d!53067 (not res!82622)) b!174140))

(assert (= (and b!174140 res!82623) b!174141))

(declare-fun m!203067 () Bool)

(assert (=> b!174141 m!203067))

(assert (=> d!52699 d!53067))

(declare-fun d!53069 () Bool)

(declare-fun res!82624 () Bool)

(declare-fun e!114993 () Bool)

(assert (=> d!53069 (=> res!82624 e!114993)))

(assert (=> d!53069 (= res!82624 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (= (_1!1612 (h!2801 (toList!1083 lt!85850))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53069 (= (containsKey!189 (toList!1083 lt!85850) #b1000000000000000000000000000000000000000000000000000000000000000) e!114993)))

(declare-fun b!174142 () Bool)

(declare-fun e!114994 () Bool)

(assert (=> b!174142 (= e!114993 e!114994)))

(declare-fun res!82625 () Bool)

(assert (=> b!174142 (=> (not res!82625) (not e!114994))))

(assert (=> b!174142 (= res!82625 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85850))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85850))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2184) (toList!1083 lt!85850)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85850))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174143 () Bool)

(assert (=> b!174143 (= e!114994 (containsKey!189 (t!6987 (toList!1083 lt!85850)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53069 (not res!82624)) b!174142))

(assert (= (and b!174142 res!82625) b!174143))

(declare-fun m!203069 () Bool)

(assert (=> b!174143 m!203069))

(assert (=> d!52725 d!53069))

(declare-fun d!53071 () Bool)

(declare-fun e!114996 () Bool)

(assert (=> d!53071 e!114996))

(declare-fun res!82626 () Bool)

(assert (=> d!53071 (=> res!82626 e!114996)))

(declare-fun lt!86213 () Bool)

(assert (=> d!53071 (= res!82626 (not lt!86213))))

(declare-fun lt!86212 () Bool)

(assert (=> d!53071 (= lt!86213 lt!86212)))

(declare-fun lt!86214 () Unit!5315)

(declare-fun e!114995 () Unit!5315)

(assert (=> d!53071 (= lt!86214 e!114995)))

(declare-fun c!31138 () Bool)

(assert (=> d!53071 (= c!31138 lt!86212)))

(assert (=> d!53071 (= lt!86212 (containsKey!189 (toList!1083 lt!85942) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> d!53071 (= (contains!1149 lt!85942 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) lt!86213)))

(declare-fun b!174144 () Bool)

(declare-fun lt!86211 () Unit!5315)

(assert (=> b!174144 (= e!114995 lt!86211)))

(assert (=> b!174144 (= lt!86211 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85942) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(assert (=> b!174144 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85942) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174145 () Bool)

(declare-fun Unit!5347 () Unit!5315)

(assert (=> b!174145 (= e!114995 Unit!5347)))

(declare-fun b!174146 () Bool)

(assert (=> b!174146 (= e!114996 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85942) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (= (and d!53071 c!31138) b!174144))

(assert (= (and d!53071 (not c!31138)) b!174145))

(assert (= (and d!53071 (not res!82626)) b!174146))

(declare-fun m!203071 () Bool)

(assert (=> d!53071 m!203071))

(declare-fun m!203073 () Bool)

(assert (=> b!174144 m!203073))

(assert (=> b!174144 m!202111))

(assert (=> b!174144 m!202111))

(declare-fun m!203075 () Bool)

(assert (=> b!174144 m!203075))

(assert (=> b!174146 m!202111))

(assert (=> b!174146 m!202111))

(assert (=> b!174146 m!203075))

(assert (=> d!52705 d!53071))

(declare-fun b!174149 () Bool)

(declare-fun e!114998 () Option!192)

(assert (=> b!174149 (= e!114998 (getValueByKey!186 (t!6987 lt!85941) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174148 () Bool)

(declare-fun e!114997 () Option!192)

(assert (=> b!174148 (= e!114997 e!114998)))

(declare-fun c!31140 () Bool)

(assert (=> b!174148 (= c!31140 (and ((_ is Cons!2184) lt!85941) (not (= (_1!1612 (h!2801 lt!85941)) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))))

(declare-fun b!174147 () Bool)

(assert (=> b!174147 (= e!114997 (Some!191 (_2!1612 (h!2801 lt!85941))))))

(declare-fun b!174150 () Bool)

(assert (=> b!174150 (= e!114998 None!190)))

(declare-fun d!53073 () Bool)

(declare-fun c!31139 () Bool)

(assert (=> d!53073 (= c!31139 (and ((_ is Cons!2184) lt!85941) (= (_1!1612 (h!2801 lt!85941)) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (=> d!53073 (= (getValueByKey!186 lt!85941 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) e!114997)))

(assert (= (and d!53073 c!31139) b!174147))

(assert (= (and d!53073 (not c!31139)) b!174148))

(assert (= (and b!174148 c!31140) b!174149))

(assert (= (and b!174148 (not c!31140)) b!174150))

(declare-fun m!203077 () Bool)

(assert (=> b!174149 m!203077))

(assert (=> d!52705 d!53073))

(declare-fun d!53075 () Bool)

(assert (=> d!53075 (= (getValueByKey!186 lt!85941 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) (Some!191 (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun lt!86215 () Unit!5315)

(assert (=> d!53075 (= lt!86215 (choose!936 lt!85941 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun e!114999 () Bool)

(assert (=> d!53075 e!114999))

(declare-fun res!82627 () Bool)

(assert (=> d!53075 (=> (not res!82627) (not e!114999))))

(assert (=> d!53075 (= res!82627 (isStrictlySorted!319 lt!85941))))

(assert (=> d!53075 (= (lemmaContainsTupThenGetReturnValue!99 lt!85941 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) lt!86215)))

(declare-fun b!174151 () Bool)

(declare-fun res!82628 () Bool)

(assert (=> b!174151 (=> (not res!82628) (not e!114999))))

(assert (=> b!174151 (= res!82628 (containsKey!189 lt!85941 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174152 () Bool)

(assert (=> b!174152 (= e!114999 (contains!1151 lt!85941 (tuple2!3203 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (= (and d!53075 res!82627) b!174151))

(assert (= (and b!174151 res!82628) b!174152))

(assert (=> d!53075 m!202105))

(declare-fun m!203079 () Bool)

(assert (=> d!53075 m!203079))

(declare-fun m!203081 () Bool)

(assert (=> d!53075 m!203081))

(declare-fun m!203083 () Bool)

(assert (=> b!174151 m!203083))

(declare-fun m!203085 () Bool)

(assert (=> b!174152 m!203085))

(assert (=> d!52705 d!53075))

(declare-fun d!53077 () Bool)

(declare-fun e!115001 () Bool)

(assert (=> d!53077 e!115001))

(declare-fun res!82629 () Bool)

(assert (=> d!53077 (=> (not res!82629) (not e!115001))))

(declare-fun lt!86216 () List!2188)

(assert (=> d!53077 (= res!82629 (isStrictlySorted!319 lt!86216))))

(declare-fun e!115004 () List!2188)

(assert (=> d!53077 (= lt!86216 e!115004)))

(declare-fun c!31143 () Bool)

(assert (=> d!53077 (= c!31143 (and ((_ is Cons!2184) (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)))) (bvslt (_1!1612 (h!2801 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562))))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (=> d!53077 (isStrictlySorted!319 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562))))))

(assert (=> d!53077 (= (insertStrictlySorted!102 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) lt!86216)))

(declare-fun b!174153 () Bool)

(declare-fun call!17638 () List!2188)

(assert (=> b!174153 (= e!115004 call!17638)))

(declare-fun bm!17635 () Bool)

(declare-fun call!17639 () List!2188)

(declare-fun call!17640 () List!2188)

(assert (=> bm!17635 (= call!17639 call!17640)))

(declare-fun b!174154 () Bool)

(assert (=> b!174154 (= e!115001 (contains!1151 lt!86216 (tuple2!3203 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174155 () Bool)

(declare-fun e!115003 () List!2188)

(assert (=> b!174155 (= e!115003 call!17639)))

(declare-fun b!174156 () Bool)

(declare-fun e!115000 () List!2188)

(assert (=> b!174156 (= e!115000 (insertStrictlySorted!102 (t!6987 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun bm!17636 () Bool)

(assert (=> bm!17636 (= call!17638 ($colon$colon!97 e!115000 (ite c!31143 (h!2801 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)))) (tuple2!3203 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))) (_2!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))))

(declare-fun c!31141 () Bool)

(assert (=> bm!17636 (= c!31141 c!31143)))

(declare-fun b!174157 () Bool)

(declare-fun e!115002 () List!2188)

(assert (=> b!174157 (= e!115002 call!17640)))

(declare-fun b!174158 () Bool)

(assert (=> b!174158 (= e!115003 call!17639)))

(declare-fun b!174159 () Bool)

(assert (=> b!174159 (= e!115004 e!115002)))

(declare-fun c!31144 () Bool)

(assert (=> b!174159 (= c!31144 (and ((_ is Cons!2184) (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)))) (= (_1!1612 (h!2801 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562))))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174160 () Bool)

(declare-fun c!31142 () Bool)

(assert (=> b!174160 (= e!115000 (ite c!31144 (t!6987 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)))) (ite c!31142 (Cons!2184 (h!2801 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)))) (t!6987 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562))))) Nil!2185)))))

(declare-fun bm!17637 () Bool)

(assert (=> bm!17637 (= call!17640 call!17638)))

(declare-fun b!174161 () Bool)

(declare-fun res!82630 () Bool)

(assert (=> b!174161 (=> (not res!82630) (not e!115001))))

(assert (=> b!174161 (= res!82630 (containsKey!189 lt!86216 (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174162 () Bool)

(assert (=> b!174162 (= c!31142 (and ((_ is Cons!2184) (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562)))) (bvsgt (_1!1612 (h!2801 (toList!1083 (ite c!30923 call!17566 (ite c!30925 call!17560 call!17562))))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (=> b!174162 (= e!115002 e!115003)))

(assert (= (and d!53077 c!31143) b!174153))

(assert (= (and d!53077 (not c!31143)) b!174159))

(assert (= (and b!174159 c!31144) b!174157))

(assert (= (and b!174159 (not c!31144)) b!174162))

(assert (= (and b!174162 c!31142) b!174158))

(assert (= (and b!174162 (not c!31142)) b!174155))

(assert (= (or b!174158 b!174155) bm!17635))

(assert (= (or b!174157 bm!17635) bm!17637))

(assert (= (or b!174153 bm!17637) bm!17636))

(assert (= (and bm!17636 c!31141) b!174156))

(assert (= (and bm!17636 (not c!31141)) b!174160))

(assert (= (and d!53077 res!82629) b!174161))

(assert (= (and b!174161 res!82630) b!174154))

(declare-fun m!203087 () Bool)

(assert (=> bm!17636 m!203087))

(declare-fun m!203089 () Bool)

(assert (=> b!174156 m!203089))

(declare-fun m!203091 () Bool)

(assert (=> b!174161 m!203091))

(declare-fun m!203093 () Bool)

(assert (=> b!174154 m!203093))

(declare-fun m!203095 () Bool)

(assert (=> d!53077 m!203095))

(declare-fun m!203097 () Bool)

(assert (=> d!53077 m!203097))

(assert (=> d!52705 d!53077))

(declare-fun d!53079 () Bool)

(declare-fun res!82631 () Bool)

(declare-fun e!115005 () Bool)

(assert (=> d!53079 (=> res!82631 e!115005)))

(assert (=> d!53079 (= res!82631 (and ((_ is Cons!2184) lt!85926) (= (_1!1612 (h!2801 lt!85926)) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!53079 (= (containsKey!189 lt!85926 (_1!1612 (tuple2!3203 key!828 v!309))) e!115005)))

(declare-fun b!174163 () Bool)

(declare-fun e!115006 () Bool)

(assert (=> b!174163 (= e!115005 e!115006)))

(declare-fun res!82632 () Bool)

(assert (=> b!174163 (=> (not res!82632) (not e!115006))))

(assert (=> b!174163 (= res!82632 (and (or (not ((_ is Cons!2184) lt!85926)) (bvsle (_1!1612 (h!2801 lt!85926)) (_1!1612 (tuple2!3203 key!828 v!309)))) ((_ is Cons!2184) lt!85926) (bvslt (_1!1612 (h!2801 lt!85926)) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!174164 () Bool)

(assert (=> b!174164 (= e!115006 (containsKey!189 (t!6987 lt!85926) (_1!1612 (tuple2!3203 key!828 v!309))))))

(assert (= (and d!53079 (not res!82631)) b!174163))

(assert (= (and b!174163 res!82632) b!174164))

(declare-fun m!203099 () Bool)

(assert (=> b!174164 m!203099))

(assert (=> b!173540 d!53079))

(declare-fun d!53081 () Bool)

(declare-fun e!115008 () Bool)

(assert (=> d!53081 e!115008))

(declare-fun res!82633 () Bool)

(assert (=> d!53081 (=> res!82633 e!115008)))

(declare-fun lt!86219 () Bool)

(assert (=> d!53081 (= res!82633 (not lt!86219))))

(declare-fun lt!86218 () Bool)

(assert (=> d!53081 (= lt!86219 lt!86218)))

(declare-fun lt!86220 () Unit!5315)

(declare-fun e!115007 () Unit!5315)

(assert (=> d!53081 (= lt!86220 e!115007)))

(declare-fun c!31145 () Bool)

(assert (=> d!53081 (= c!31145 lt!86218)))

(assert (=> d!53081 (= lt!86218 (containsKey!189 (toList!1083 lt!85971) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53081 (= (contains!1149 lt!85971 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86219)))

(declare-fun b!174165 () Bool)

(declare-fun lt!86217 () Unit!5315)

(assert (=> b!174165 (= e!115007 lt!86217)))

(assert (=> b!174165 (= lt!86217 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85971) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174165 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85971) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174166 () Bool)

(declare-fun Unit!5348 () Unit!5315)

(assert (=> b!174166 (= e!115007 Unit!5348)))

(declare-fun b!174167 () Bool)

(assert (=> b!174167 (= e!115008 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85971) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53081 c!31145) b!174165))

(assert (= (and d!53081 (not c!31145)) b!174166))

(assert (= (and d!53081 (not res!82633)) b!174167))

(declare-fun m!203101 () Bool)

(assert (=> d!53081 m!203101))

(declare-fun m!203103 () Bool)

(assert (=> b!174165 m!203103))

(declare-fun m!203105 () Bool)

(assert (=> b!174165 m!203105))

(assert (=> b!174165 m!203105))

(declare-fun m!203107 () Bool)

(assert (=> b!174165 m!203107))

(assert (=> b!174167 m!203105))

(assert (=> b!174167 m!203105))

(assert (=> b!174167 m!203107))

(assert (=> d!52727 d!53081))

(assert (=> d!52727 d!52717))

(declare-fun d!53083 () Bool)

(declare-fun e!115009 () Bool)

(assert (=> d!53083 e!115009))

(declare-fun res!82635 () Bool)

(assert (=> d!53083 (=> (not res!82635) (not e!115009))))

(declare-fun lt!86224 () ListLongMap!2135)

(assert (=> d!53083 (= res!82635 (contains!1149 lt!86224 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))))))

(declare-fun lt!86223 () List!2188)

(assert (=> d!53083 (= lt!86224 (ListLongMap!2136 lt!86223))))

(declare-fun lt!86222 () Unit!5315)

(declare-fun lt!86221 () Unit!5315)

(assert (=> d!53083 (= lt!86222 lt!86221)))

(assert (=> d!53083 (= (getValueByKey!186 lt!86223 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))))))

(assert (=> d!53083 (= lt!86221 (lemmaContainsTupThenGetReturnValue!99 lt!86223 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))))))

(assert (=> d!53083 (= lt!86223 (insertStrictlySorted!102 (toList!1083 call!17599) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))))))

(assert (=> d!53083 (= (+!245 call!17599 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))) lt!86224)))

(declare-fun b!174168 () Bool)

(declare-fun res!82634 () Bool)

(assert (=> b!174168 (=> (not res!82634) (not e!115009))))

(assert (=> b!174168 (= res!82634 (= (getValueByKey!186 (toList!1083 lt!86224) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))))))

(declare-fun b!174169 () Bool)

(assert (=> b!174169 (= e!115009 (contains!1151 (toList!1083 lt!86224) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 lt!85779))))))

(assert (= (and d!53083 res!82635) b!174168))

(assert (= (and b!174168 res!82634) b!174169))

(declare-fun m!203109 () Bool)

(assert (=> d!53083 m!203109))

(declare-fun m!203111 () Bool)

(assert (=> d!53083 m!203111))

(declare-fun m!203113 () Bool)

(assert (=> d!53083 m!203113))

(declare-fun m!203115 () Bool)

(assert (=> d!53083 m!203115))

(declare-fun m!203117 () Bool)

(assert (=> b!174168 m!203117))

(declare-fun m!203119 () Bool)

(assert (=> b!174169 m!203119))

(assert (=> b!173678 d!53083))

(assert (=> b!173744 d!52695))

(declare-fun e!115011 () Option!192)

(declare-fun b!174172 () Bool)

(assert (=> b!174172 (= e!115011 (getValueByKey!186 (t!6987 (toList!1083 lt!86085)) (_1!1612 (tuple2!3203 lt!85890 v!309))))))

(declare-fun b!174171 () Bool)

(declare-fun e!115010 () Option!192)

(assert (=> b!174171 (= e!115010 e!115011)))

(declare-fun c!31147 () Bool)

(assert (=> b!174171 (= c!31147 (and ((_ is Cons!2184) (toList!1083 lt!86085)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86085))) (_1!1612 (tuple2!3203 lt!85890 v!309))))))))

(declare-fun b!174170 () Bool)

(assert (=> b!174170 (= e!115010 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86085)))))))

(declare-fun b!174173 () Bool)

(assert (=> b!174173 (= e!115011 None!190)))

(declare-fun d!53085 () Bool)

(declare-fun c!31146 () Bool)

(assert (=> d!53085 (= c!31146 (and ((_ is Cons!2184) (toList!1083 lt!86085)) (= (_1!1612 (h!2801 (toList!1083 lt!86085))) (_1!1612 (tuple2!3203 lt!85890 v!309)))))))

(assert (=> d!53085 (= (getValueByKey!186 (toList!1083 lt!86085) (_1!1612 (tuple2!3203 lt!85890 v!309))) e!115010)))

(assert (= (and d!53085 c!31146) b!174170))

(assert (= (and d!53085 (not c!31146)) b!174171))

(assert (= (and b!174171 c!31147) b!174172))

(assert (= (and b!174171 (not c!31147)) b!174173))

(declare-fun m!203121 () Bool)

(assert (=> b!174172 m!203121))

(assert (=> b!173777 d!53085))

(declare-fun d!53087 () Bool)

(assert (=> d!53087 (= (apply!130 lt!85987 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)) (get!1975 (getValueByKey!186 (toList!1083 lt!85987) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))))

(declare-fun bs!7209 () Bool)

(assert (= bs!7209 d!53087))

(assert (=> bs!7209 m!202083))

(declare-fun m!203123 () Bool)

(assert (=> bs!7209 m!203123))

(assert (=> bs!7209 m!203123))

(declare-fun m!203125 () Bool)

(assert (=> bs!7209 m!203125))

(assert (=> b!173682 d!53087))

(declare-fun d!53089 () Bool)

(declare-fun c!31148 () Bool)

(assert (=> d!53089 (= c!31148 ((_ is ValueCellFull!1697) (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun e!115012 () V!5089)

(assert (=> d!53089 (= (get!1974 (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 lt!85779) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115012)))

(declare-fun b!174174 () Bool)

(assert (=> b!174174 (= e!115012 (get!1976 (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 lt!85779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174175 () Bool)

(assert (=> b!174175 (= e!115012 (get!1977 (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 lt!85779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53089 c!31148) b!174174))

(assert (= (and d!53089 (not c!31148)) b!174175))

(assert (=> b!174174 m!202195))

(assert (=> b!174174 m!202197))

(declare-fun m!203127 () Bool)

(assert (=> b!174174 m!203127))

(assert (=> b!174175 m!202195))

(assert (=> b!174175 m!202197))

(declare-fun m!203129 () Bool)

(assert (=> b!174175 m!203129))

(assert (=> b!173682 d!53089))

(declare-fun d!53091 () Bool)

(declare-fun res!82636 () Bool)

(declare-fun e!115013 () Bool)

(assert (=> d!53091 (=> res!82636 e!115013)))

(assert (=> d!53091 (= res!82636 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!53091 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)) e!115013)))

(declare-fun b!174176 () Bool)

(declare-fun e!115015 () Bool)

(assert (=> b!174176 (= e!115013 e!115015)))

(declare-fun c!31149 () Bool)

(assert (=> b!174176 (= c!31149 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174177 () Bool)

(declare-fun e!115014 () Bool)

(declare-fun call!17641 () Bool)

(assert (=> b!174177 (= e!115014 call!17641)))

(declare-fun b!174178 () Bool)

(assert (=> b!174178 (= e!115015 call!17641)))

(declare-fun b!174179 () Bool)

(assert (=> b!174179 (= e!115015 e!115014)))

(declare-fun lt!86227 () (_ BitVec 64))

(assert (=> b!174179 (= lt!86227 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!86225 () Unit!5315)

(assert (=> b!174179 (= lt!86225 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5438 thiss!1248) lt!86227 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!174179 (arrayContainsKey!0 (_keys!5438 thiss!1248) lt!86227 #b00000000000000000000000000000000)))

(declare-fun lt!86226 () Unit!5315)

(assert (=> b!174179 (= lt!86226 lt!86225)))

(declare-fun res!82637 () Bool)

(assert (=> b!174179 (= res!82637 (= (seekEntryOrOpen!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)) (Found!536 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174179 (=> (not res!82637) (not e!115014))))

(declare-fun bm!17638 () Bool)

(assert (=> bm!17638 (= call!17641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)))))

(assert (= (and d!53091 (not res!82636)) b!174176))

(assert (= (and b!174176 c!31149) b!174179))

(assert (= (and b!174176 (not c!31149)) b!174178))

(assert (= (and b!174179 res!82637) b!174177))

(assert (= (or b!174177 b!174178) bm!17638))

(assert (=> b!174176 m!202659))

(assert (=> b!174176 m!202659))

(assert (=> b!174176 m!202669))

(assert (=> b!174179 m!202659))

(declare-fun m!203131 () Bool)

(assert (=> b!174179 m!203131))

(declare-fun m!203133 () Bool)

(assert (=> b!174179 m!203133))

(assert (=> b!174179 m!202659))

(declare-fun m!203135 () Bool)

(assert (=> b!174179 m!203135))

(declare-fun m!203137 () Bool)

(assert (=> bm!17638 m!203137))

(assert (=> bm!17603 d!53091))

(declare-fun b!174180 () Bool)

(declare-fun e!115017 () ListLongMap!2135)

(assert (=> b!174180 (= e!115017 (ListLongMap!2136 Nil!2185))))

(declare-fun b!174181 () Bool)

(declare-fun e!115022 () ListLongMap!2135)

(declare-fun call!17642 () ListLongMap!2135)

(assert (=> b!174181 (= e!115022 call!17642)))

(declare-fun b!174182 () Bool)

(declare-fun lt!86229 () Unit!5315)

(declare-fun lt!86232 () Unit!5315)

(assert (=> b!174182 (= lt!86229 lt!86232)))

(declare-fun lt!86233 () (_ BitVec 64))

(declare-fun lt!86231 () ListLongMap!2135)

(declare-fun lt!86230 () V!5089)

(declare-fun lt!86234 () (_ BitVec 64))

(assert (=> b!174182 (not (contains!1149 (+!245 lt!86231 (tuple2!3203 lt!86233 lt!86230)) lt!86234))))

(assert (=> b!174182 (= lt!86232 (addStillNotContains!74 lt!86231 lt!86233 lt!86230 lt!86234))))

(assert (=> b!174182 (= lt!86234 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174182 (= lt!86230 (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174182 (= lt!86233 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!174182 (= lt!86231 call!17642)))

(assert (=> b!174182 (= e!115022 (+!245 call!17642 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!174183 () Bool)

(assert (=> b!174183 (= e!115017 e!115022)))

(declare-fun c!31152 () Bool)

(assert (=> b!174183 (= c!31152 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174184 () Bool)

(declare-fun e!115019 () Bool)

(declare-fun e!115021 () Bool)

(assert (=> b!174184 (= e!115019 e!115021)))

(declare-fun c!31151 () Bool)

(declare-fun e!115018 () Bool)

(assert (=> b!174184 (= c!31151 e!115018)))

(declare-fun res!82640 () Bool)

(assert (=> b!174184 (=> (not res!82640) (not e!115018))))

(assert (=> b!174184 (= res!82640 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!174185 () Bool)

(declare-fun res!82638 () Bool)

(assert (=> b!174185 (=> (not res!82638) (not e!115019))))

(declare-fun lt!86228 () ListLongMap!2135)

(assert (=> b!174185 (= res!82638 (not (contains!1149 lt!86228 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174186 () Bool)

(assert (=> b!174186 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> b!174186 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3758 (_values!3580 thiss!1248))))))

(declare-fun e!115016 () Bool)

(assert (=> b!174186 (= e!115016 (= (apply!130 lt!86228 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17639 () Bool)

(assert (=> bm!17639 (= call!17642 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)))))

(declare-fun e!115020 () Bool)

(declare-fun b!174187 () Bool)

(assert (=> b!174187 (= e!115020 (= lt!86228 (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248))))))

(declare-fun b!174188 () Bool)

(assert (=> b!174188 (= e!115021 e!115016)))

(assert (=> b!174188 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun res!82639 () Bool)

(assert (=> b!174188 (= res!82639 (contains!1149 lt!86228 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174188 (=> (not res!82639) (not e!115016))))

(declare-fun b!174189 () Bool)

(assert (=> b!174189 (= e!115018 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174189 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!174190 () Bool)

(assert (=> b!174190 (= e!115021 e!115020)))

(declare-fun c!31153 () Bool)

(assert (=> b!174190 (= c!31153 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun d!53093 () Bool)

(assert (=> d!53093 e!115019))

(declare-fun res!82641 () Bool)

(assert (=> d!53093 (=> (not res!82641) (not e!115019))))

(assert (=> d!53093 (= res!82641 (not (contains!1149 lt!86228 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53093 (= lt!86228 e!115017)))

(declare-fun c!31150 () Bool)

(assert (=> d!53093 (= c!31150 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!53093 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!53093 (= (getCurrentListMapNoExtraKeys!161 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (bvor (extraKeys!3336 thiss!1248) #b00000000000000000000000000000010) (zeroValue!3438 thiss!1248) v!309 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 thiss!1248)) lt!86228)))

(declare-fun b!174191 () Bool)

(assert (=> b!174191 (= e!115020 (isEmpty!443 lt!86228))))

(assert (= (and d!53093 c!31150) b!174180))

(assert (= (and d!53093 (not c!31150)) b!174183))

(assert (= (and b!174183 c!31152) b!174182))

(assert (= (and b!174183 (not c!31152)) b!174181))

(assert (= (or b!174182 b!174181) bm!17639))

(assert (= (and d!53093 res!82641) b!174185))

(assert (= (and b!174185 res!82638) b!174184))

(assert (= (and b!174184 res!82640) b!174189))

(assert (= (and b!174184 c!31151) b!174188))

(assert (= (and b!174184 (not c!31151)) b!174190))

(assert (= (and b!174188 res!82639) b!174186))

(assert (= (and b!174190 c!31153) b!174187))

(assert (= (and b!174190 (not c!31153)) b!174191))

(declare-fun b_lambda!6987 () Bool)

(assert (=> (not b_lambda!6987) (not b!174182)))

(assert (=> b!174182 t!6991))

(declare-fun b_and!10787 () Bool)

(assert (= b_and!10785 (and (=> t!6991 result!4577) b_and!10787)))

(declare-fun b_lambda!6989 () Bool)

(assert (=> (not b_lambda!6989) (not b!174186)))

(assert (=> b!174186 t!6991))

(declare-fun b_and!10789 () Bool)

(assert (= b_and!10787 (and (=> t!6991 result!4577) b_and!10789)))

(assert (=> b!174188 m!202659))

(assert (=> b!174188 m!202659))

(declare-fun m!203139 () Bool)

(assert (=> b!174188 m!203139))

(assert (=> b!174186 m!202659))

(assert (=> b!174186 m!202659))

(declare-fun m!203141 () Bool)

(assert (=> b!174186 m!203141))

(assert (=> b!174186 m!201915))

(assert (=> b!174186 m!202665))

(assert (=> b!174186 m!202665))

(assert (=> b!174186 m!201915))

(assert (=> b!174186 m!202667))

(assert (=> b!174189 m!202659))

(assert (=> b!174189 m!202659))

(assert (=> b!174189 m!202669))

(declare-fun m!203143 () Bool)

(assert (=> b!174191 m!203143))

(declare-fun m!203145 () Bool)

(assert (=> bm!17639 m!203145))

(declare-fun m!203147 () Bool)

(assert (=> d!53093 m!203147))

(assert (=> d!53093 m!201893))

(declare-fun m!203149 () Bool)

(assert (=> b!174185 m!203149))

(declare-fun m!203151 () Bool)

(assert (=> b!174182 m!203151))

(assert (=> b!174182 m!202659))

(declare-fun m!203153 () Bool)

(assert (=> b!174182 m!203153))

(assert (=> b!174182 m!203153))

(declare-fun m!203155 () Bool)

(assert (=> b!174182 m!203155))

(declare-fun m!203157 () Bool)

(assert (=> b!174182 m!203157))

(assert (=> b!174182 m!201915))

(assert (=> b!174182 m!202665))

(assert (=> b!174182 m!202665))

(assert (=> b!174182 m!201915))

(assert (=> b!174182 m!202667))

(assert (=> b!174187 m!203145))

(assert (=> b!174183 m!202659))

(assert (=> b!174183 m!202659))

(assert (=> b!174183 m!202669))

(assert (=> b!173755 d!53093))

(declare-fun d!53095 () Bool)

(declare-fun res!82642 () Bool)

(declare-fun e!115023 () Bool)

(assert (=> d!53095 (=> res!82642 e!115023)))

(assert (=> d!53095 (= res!82642 (or ((_ is Nil!2185) lt!85926) ((_ is Nil!2185) (t!6987 lt!85926))))))

(assert (=> d!53095 (= (isStrictlySorted!319 lt!85926) e!115023)))

(declare-fun b!174192 () Bool)

(declare-fun e!115024 () Bool)

(assert (=> b!174192 (= e!115023 e!115024)))

(declare-fun res!82643 () Bool)

(assert (=> b!174192 (=> (not res!82643) (not e!115024))))

(assert (=> b!174192 (= res!82643 (bvslt (_1!1612 (h!2801 lt!85926)) (_1!1612 (h!2801 (t!6987 lt!85926)))))))

(declare-fun b!174193 () Bool)

(assert (=> b!174193 (= e!115024 (isStrictlySorted!319 (t!6987 lt!85926)))))

(assert (= (and d!53095 (not res!82642)) b!174192))

(assert (= (and b!174192 res!82643) b!174193))

(declare-fun m!203159 () Bool)

(assert (=> b!174193 m!203159))

(assert (=> d!52693 d!53095))

(declare-fun d!53097 () Bool)

(declare-fun res!82644 () Bool)

(declare-fun e!115025 () Bool)

(assert (=> d!53097 (=> res!82644 e!115025)))

(assert (=> d!53097 (= res!82644 (or ((_ is Nil!2185) (toList!1083 (map!1874 thiss!1248))) ((_ is Nil!2185) (t!6987 (toList!1083 (map!1874 thiss!1248))))))))

(assert (=> d!53097 (= (isStrictlySorted!319 (toList!1083 (map!1874 thiss!1248))) e!115025)))

(declare-fun b!174194 () Bool)

(declare-fun e!115026 () Bool)

(assert (=> b!174194 (= e!115025 e!115026)))

(declare-fun res!82645 () Bool)

(assert (=> b!174194 (=> (not res!82645) (not e!115026))))

(assert (=> b!174194 (= res!82645 (bvslt (_1!1612 (h!2801 (toList!1083 (map!1874 thiss!1248)))) (_1!1612 (h!2801 (t!6987 (toList!1083 (map!1874 thiss!1248)))))))))

(declare-fun b!174195 () Bool)

(assert (=> b!174195 (= e!115026 (isStrictlySorted!319 (t!6987 (toList!1083 (map!1874 thiss!1248)))))))

(assert (= (and d!53097 (not res!82644)) b!174194))

(assert (= (and b!174194 res!82645) b!174195))

(assert (=> b!174195 m!202885))

(assert (=> d!52693 d!53097))

(declare-fun d!53099 () Bool)

(declare-fun e!115028 () Bool)

(assert (=> d!53099 e!115028))

(declare-fun res!82646 () Bool)

(assert (=> d!53099 (=> res!82646 e!115028)))

(declare-fun lt!86237 () Bool)

(assert (=> d!53099 (= res!82646 (not lt!86237))))

(declare-fun lt!86236 () Bool)

(assert (=> d!53099 (= lt!86237 lt!86236)))

(declare-fun lt!86238 () Unit!5315)

(declare-fun e!115027 () Unit!5315)

(assert (=> d!53099 (= lt!86238 e!115027)))

(declare-fun c!31154 () Bool)

(assert (=> d!53099 (= c!31154 lt!86236)))

(assert (=> d!53099 (= lt!86236 (containsKey!189 (toList!1083 (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973))) lt!85977))))

(assert (=> d!53099 (= (contains!1149 (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973)) lt!85977) lt!86237)))

(declare-fun b!174196 () Bool)

(declare-fun lt!86235 () Unit!5315)

(assert (=> b!174196 (= e!115027 lt!86235)))

(assert (=> b!174196 (= lt!86235 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973))) lt!85977))))

(assert (=> b!174196 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973))) lt!85977))))

(declare-fun b!174197 () Bool)

(declare-fun Unit!5349 () Unit!5315)

(assert (=> b!174197 (= e!115027 Unit!5349)))

(declare-fun b!174198 () Bool)

(assert (=> b!174198 (= e!115028 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973))) lt!85977)))))

(assert (= (and d!53099 c!31154) b!174196))

(assert (= (and d!53099 (not c!31154)) b!174197))

(assert (= (and d!53099 (not res!82646)) b!174198))

(declare-fun m!203161 () Bool)

(assert (=> d!53099 m!203161))

(declare-fun m!203163 () Bool)

(assert (=> b!174196 m!203163))

(declare-fun m!203165 () Bool)

(assert (=> b!174196 m!203165))

(assert (=> b!174196 m!203165))

(declare-fun m!203167 () Bool)

(assert (=> b!174196 m!203167))

(assert (=> b!174198 m!203165))

(assert (=> b!174198 m!203165))

(assert (=> b!174198 m!203167))

(assert (=> b!173644 d!53099))

(assert (=> b!173644 d!52733))

(declare-fun d!53101 () Bool)

(declare-fun e!115029 () Bool)

(assert (=> d!53101 e!115029))

(declare-fun res!82648 () Bool)

(assert (=> d!53101 (=> (not res!82648) (not e!115029))))

(declare-fun lt!86242 () ListLongMap!2135)

(assert (=> d!53101 (= res!82648 (contains!1149 lt!86242 (_1!1612 (tuple2!3203 lt!85976 lt!85973))))))

(declare-fun lt!86241 () List!2188)

(assert (=> d!53101 (= lt!86242 (ListLongMap!2136 lt!86241))))

(declare-fun lt!86240 () Unit!5315)

(declare-fun lt!86239 () Unit!5315)

(assert (=> d!53101 (= lt!86240 lt!86239)))

(assert (=> d!53101 (= (getValueByKey!186 lt!86241 (_1!1612 (tuple2!3203 lt!85976 lt!85973))) (Some!191 (_2!1612 (tuple2!3203 lt!85976 lt!85973))))))

(assert (=> d!53101 (= lt!86239 (lemmaContainsTupThenGetReturnValue!99 lt!86241 (_1!1612 (tuple2!3203 lt!85976 lt!85973)) (_2!1612 (tuple2!3203 lt!85976 lt!85973))))))

(assert (=> d!53101 (= lt!86241 (insertStrictlySorted!102 (toList!1083 lt!85974) (_1!1612 (tuple2!3203 lt!85976 lt!85973)) (_2!1612 (tuple2!3203 lt!85976 lt!85973))))))

(assert (=> d!53101 (= (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973)) lt!86242)))

(declare-fun b!174199 () Bool)

(declare-fun res!82647 () Bool)

(assert (=> b!174199 (=> (not res!82647) (not e!115029))))

(assert (=> b!174199 (= res!82647 (= (getValueByKey!186 (toList!1083 lt!86242) (_1!1612 (tuple2!3203 lt!85976 lt!85973))) (Some!191 (_2!1612 (tuple2!3203 lt!85976 lt!85973)))))))

(declare-fun b!174200 () Bool)

(assert (=> b!174200 (= e!115029 (contains!1151 (toList!1083 lt!86242) (tuple2!3203 lt!85976 lt!85973)))))

(assert (= (and d!53101 res!82648) b!174199))

(assert (= (and b!174199 res!82647) b!174200))

(declare-fun m!203169 () Bool)

(assert (=> d!53101 m!203169))

(declare-fun m!203171 () Bool)

(assert (=> d!53101 m!203171))

(declare-fun m!203173 () Bool)

(assert (=> d!53101 m!203173))

(declare-fun m!203175 () Bool)

(assert (=> d!53101 m!203175))

(declare-fun m!203177 () Bool)

(assert (=> b!174199 m!203177))

(declare-fun m!203179 () Bool)

(assert (=> b!174200 m!203179))

(assert (=> b!173644 d!53101))

(declare-fun d!53103 () Bool)

(assert (=> d!53103 (not (contains!1149 (+!245 lt!85974 (tuple2!3203 lt!85976 lt!85973)) lt!85977))))

(declare-fun lt!86245 () Unit!5315)

(declare-fun choose!940 (ListLongMap!2135 (_ BitVec 64) V!5089 (_ BitVec 64)) Unit!5315)

(assert (=> d!53103 (= lt!86245 (choose!940 lt!85974 lt!85976 lt!85973 lt!85977))))

(declare-fun e!115032 () Bool)

(assert (=> d!53103 e!115032))

(declare-fun res!82651 () Bool)

(assert (=> d!53103 (=> (not res!82651) (not e!115032))))

(assert (=> d!53103 (= res!82651 (not (contains!1149 lt!85974 lt!85977)))))

(assert (=> d!53103 (= (addStillNotContains!74 lt!85974 lt!85976 lt!85973 lt!85977) lt!86245)))

(declare-fun b!174204 () Bool)

(assert (=> b!174204 (= e!115032 (not (= lt!85976 lt!85977)))))

(assert (= (and d!53103 res!82651) b!174204))

(assert (=> d!53103 m!202167))

(assert (=> d!53103 m!202167))

(assert (=> d!53103 m!202169))

(declare-fun m!203181 () Bool)

(assert (=> d!53103 m!203181))

(declare-fun m!203183 () Bool)

(assert (=> d!53103 m!203183))

(assert (=> b!173644 d!53103))

(declare-fun d!53105 () Bool)

(declare-fun e!115033 () Bool)

(assert (=> d!53105 e!115033))

(declare-fun res!82653 () Bool)

(assert (=> d!53105 (=> (not res!82653) (not e!115033))))

(declare-fun lt!86249 () ListLongMap!2135)

(assert (=> d!53105 (= res!82653 (contains!1149 lt!86249 (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!86248 () List!2188)

(assert (=> d!53105 (= lt!86249 (ListLongMap!2136 lt!86248))))

(declare-fun lt!86247 () Unit!5315)

(declare-fun lt!86246 () Unit!5315)

(assert (=> d!53105 (= lt!86247 lt!86246)))

(assert (=> d!53105 (= (getValueByKey!186 lt!86248 (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!191 (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53105 (= lt!86246 (lemmaContainsTupThenGetReturnValue!99 lt!86248 (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53105 (= lt!86248 (insertStrictlySorted!102 (toList!1083 call!17594) (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53105 (= (+!245 call!17594 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!86249)))

(declare-fun b!174205 () Bool)

(declare-fun res!82652 () Bool)

(assert (=> b!174205 (=> (not res!82652) (not e!115033))))

(assert (=> b!174205 (= res!82652 (= (getValueByKey!186 (toList!1083 lt!86249) (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!191 (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!174206 () Bool)

(assert (=> b!174206 (= e!115033 (contains!1151 (toList!1083 lt!86249) (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!53105 res!82653) b!174205))

(assert (= (and b!174205 res!82652) b!174206))

(declare-fun m!203185 () Bool)

(assert (=> d!53105 m!203185))

(declare-fun m!203187 () Bool)

(assert (=> d!53105 m!203187))

(declare-fun m!203189 () Bool)

(assert (=> d!53105 m!203189))

(declare-fun m!203191 () Bool)

(assert (=> d!53105 m!203191))

(declare-fun m!203193 () Bool)

(assert (=> b!174205 m!203193))

(declare-fun m!203195 () Bool)

(assert (=> b!174206 m!203195))

(assert (=> b!173644 d!53105))

(assert (=> b!173594 d!52921))

(declare-fun d!53107 () Bool)

(declare-fun res!82654 () Bool)

(declare-fun e!115034 () Bool)

(assert (=> d!53107 (=> res!82654 e!115034)))

(assert (=> d!53107 (= res!82654 (and ((_ is Cons!2184) (toList!1083 lt!85916)) (= (_1!1612 (h!2801 (toList!1083 lt!85916))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!53107 (= (containsKey!189 (toList!1083 lt!85916) (_1!1612 (tuple2!3203 key!828 v!309))) e!115034)))

(declare-fun b!174207 () Bool)

(declare-fun e!115035 () Bool)

(assert (=> b!174207 (= e!115034 e!115035)))

(declare-fun res!82655 () Bool)

(assert (=> b!174207 (=> (not res!82655) (not e!115035))))

(assert (=> b!174207 (= res!82655 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85916))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85916))) (_1!1612 (tuple2!3203 key!828 v!309)))) ((_ is Cons!2184) (toList!1083 lt!85916)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85916))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!174208 () Bool)

(assert (=> b!174208 (= e!115035 (containsKey!189 (t!6987 (toList!1083 lt!85916)) (_1!1612 (tuple2!3203 key!828 v!309))))))

(assert (= (and d!53107 (not res!82654)) b!174207))

(assert (= (and b!174207 res!82655) b!174208))

(declare-fun m!203197 () Bool)

(assert (=> b!174208 m!203197))

(assert (=> d!52687 d!53107))

(declare-fun d!53109 () Bool)

(assert (=> d!53109 (= (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!442 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!7210 () Bool)

(assert (= bs!7210 d!53109))

(assert (=> bs!7210 m!202127))

(declare-fun m!203199 () Bool)

(assert (=> bs!7210 m!203199))

(assert (=> b!173580 d!53109))

(declare-fun b!174211 () Bool)

(declare-fun e!115037 () Option!192)

(assert (=> b!174211 (= e!115037 (getValueByKey!186 (t!6987 (toList!1083 lt!85884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174210 () Bool)

(declare-fun e!115036 () Option!192)

(assert (=> b!174210 (= e!115036 e!115037)))

(declare-fun c!31156 () Bool)

(assert (=> b!174210 (= c!31156 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85884))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!174209 () Bool)

(assert (=> b!174209 (= e!115036 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85884)))))))

(declare-fun b!174212 () Bool)

(assert (=> b!174212 (= e!115037 None!190)))

(declare-fun d!53111 () Bool)

(declare-fun c!31155 () Bool)

(assert (=> d!53111 (= c!31155 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (= (_1!1612 (h!2801 (toList!1083 lt!85884))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53111 (= (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000) e!115036)))

(assert (= (and d!53111 c!31155) b!174209))

(assert (= (and d!53111 (not c!31155)) b!174210))

(assert (= (and b!174210 c!31156) b!174211))

(assert (= (and b!174210 (not c!31156)) b!174212))

(declare-fun m!203201 () Bool)

(assert (=> b!174211 m!203201))

(assert (=> b!173580 d!53111))

(declare-fun e!115039 () Option!192)

(declare-fun b!174215 () Bool)

(assert (=> b!174215 (= e!115039 (getValueByKey!186 (t!6987 (toList!1083 lt!86040)) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))

(declare-fun b!174214 () Bool)

(declare-fun e!115038 () Option!192)

(assert (=> b!174214 (= e!115038 e!115039)))

(declare-fun c!31158 () Bool)

(assert (=> b!174214 (= c!31158 (and ((_ is Cons!2184) (toList!1083 lt!86040)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86040))) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174213 () Bool)

(assert (=> b!174213 (= e!115038 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86040)))))))

(declare-fun b!174216 () Bool)

(assert (=> b!174216 (= e!115039 None!190)))

(declare-fun c!31157 () Bool)

(declare-fun d!53113 () Bool)

(assert (=> d!53113 (= c!31157 (and ((_ is Cons!2184) (toList!1083 lt!86040)) (= (_1!1612 (h!2801 (toList!1083 lt!86040))) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248))))))))

(assert (=> d!53113 (= (getValueByKey!186 (toList!1083 lt!86040) (_1!1612 (tuple2!3203 lt!85849 (minValue!3440 thiss!1248)))) e!115038)))

(assert (= (and d!53113 c!31157) b!174213))

(assert (= (and d!53113 (not c!31157)) b!174214))

(assert (= (and b!174214 c!31158) b!174215))

(assert (= (and b!174214 (not c!31158)) b!174216))

(declare-fun m!203203 () Bool)

(assert (=> b!174215 m!203203))

(assert (=> b!173720 d!53113))

(assert (=> d!52719 d!52669))

(assert (=> d!52719 d!52667))

(assert (=> d!52719 d!52671))

(declare-fun d!53115 () Bool)

(assert (=> d!53115 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))) (v!3957 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52799 d!53115))

(assert (=> d!52799 d!52981))

(declare-fun lt!86250 () Bool)

(declare-fun d!53117 () Bool)

(assert (=> d!53117 (= lt!86250 (select (content!150 (toList!1083 lt!86011)) (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!115040 () Bool)

(assert (=> d!53117 (= lt!86250 e!115040)))

(declare-fun res!82656 () Bool)

(assert (=> d!53117 (=> (not res!82656) (not e!115040))))

(assert (=> d!53117 (= res!82656 ((_ is Cons!2184) (toList!1083 lt!86011)))))

(assert (=> d!53117 (= (contains!1151 (toList!1083 lt!86011) (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86250)))

(declare-fun b!174217 () Bool)

(declare-fun e!115041 () Bool)

(assert (=> b!174217 (= e!115040 e!115041)))

(declare-fun res!82657 () Bool)

(assert (=> b!174217 (=> res!82657 e!115041)))

(assert (=> b!174217 (= res!82657 (= (h!2801 (toList!1083 lt!86011)) (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174218 () Bool)

(assert (=> b!174218 (= e!115041 (contains!1151 (t!6987 (toList!1083 lt!86011)) (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53117 res!82656) b!174217))

(assert (= (and b!174217 (not res!82657)) b!174218))

(declare-fun m!203205 () Bool)

(assert (=> d!53117 m!203205))

(declare-fun m!203207 () Bool)

(assert (=> d!53117 m!203207))

(declare-fun m!203209 () Bool)

(assert (=> b!174218 m!203209))

(assert (=> b!173687 d!53117))

(declare-fun d!53119 () Bool)

(declare-fun lt!86251 () Bool)

(assert (=> d!53119 (= lt!86251 (select (content!150 lt!86017) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!115042 () Bool)

(assert (=> d!53119 (= lt!86251 e!115042)))

(declare-fun res!82658 () Bool)

(assert (=> d!53119 (=> (not res!82658) (not e!115042))))

(assert (=> d!53119 (= res!82658 ((_ is Cons!2184) lt!86017))))

(assert (=> d!53119 (= (contains!1151 lt!86017 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86251)))

(declare-fun b!174219 () Bool)

(declare-fun e!115043 () Bool)

(assert (=> b!174219 (= e!115042 e!115043)))

(declare-fun res!82659 () Bool)

(assert (=> b!174219 (=> res!82659 e!115043)))

(assert (=> b!174219 (= res!82659 (= (h!2801 lt!86017) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174220 () Bool)

(assert (=> b!174220 (= e!115043 (contains!1151 (t!6987 lt!86017) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53119 res!82658) b!174219))

(assert (= (and b!174219 (not res!82659)) b!174220))

(declare-fun m!203211 () Bool)

(assert (=> d!53119 m!203211))

(declare-fun m!203213 () Bool)

(assert (=> d!53119 m!203213))

(declare-fun m!203215 () Bool)

(assert (=> b!174220 m!203215))

(assert (=> b!173698 d!53119))

(assert (=> b!173614 d!52845))

(assert (=> b!173781 d!52879))

(assert (=> b!173781 d!52881))

(declare-fun d!53121 () Bool)

(declare-fun e!115045 () Bool)

(assert (=> d!53121 e!115045))

(declare-fun res!82660 () Bool)

(assert (=> d!53121 (=> res!82660 e!115045)))

(declare-fun lt!86254 () Bool)

(assert (=> d!53121 (= res!82660 (not lt!86254))))

(declare-fun lt!86253 () Bool)

(assert (=> d!53121 (= lt!86254 lt!86253)))

(declare-fun lt!86255 () Unit!5315)

(declare-fun e!115044 () Unit!5315)

(assert (=> d!53121 (= lt!86255 e!115044)))

(declare-fun c!31159 () Bool)

(assert (=> d!53121 (= c!31159 lt!86253)))

(assert (=> d!53121 (= lt!86253 (containsKey!189 (toList!1083 lt!86011) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53121 (= (contains!1149 lt!86011 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86254)))

(declare-fun b!174221 () Bool)

(declare-fun lt!86252 () Unit!5315)

(assert (=> b!174221 (= e!115044 lt!86252)))

(assert (=> b!174221 (= lt!86252 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86011) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!174221 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86011) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174222 () Bool)

(declare-fun Unit!5350 () Unit!5315)

(assert (=> b!174222 (= e!115044 Unit!5350)))

(declare-fun b!174223 () Bool)

(assert (=> b!174223 (= e!115045 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86011) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!53121 c!31159) b!174221))

(assert (= (and d!53121 (not c!31159)) b!174222))

(assert (= (and d!53121 (not res!82660)) b!174223))

(declare-fun m!203217 () Bool)

(assert (=> d!53121 m!203217))

(declare-fun m!203219 () Bool)

(assert (=> b!174221 m!203219))

(assert (=> b!174221 m!202263))

(assert (=> b!174221 m!202263))

(declare-fun m!203221 () Bool)

(assert (=> b!174221 m!203221))

(assert (=> b!174223 m!202263))

(assert (=> b!174223 m!202263))

(assert (=> b!174223 m!203221))

(assert (=> d!52739 d!53121))

(declare-fun e!115047 () Option!192)

(declare-fun b!174226 () Bool)

(assert (=> b!174226 (= e!115047 (getValueByKey!186 (t!6987 lt!86010) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174225 () Bool)

(declare-fun e!115046 () Option!192)

(assert (=> b!174225 (= e!115046 e!115047)))

(declare-fun c!31161 () Bool)

(assert (=> b!174225 (= c!31161 (and ((_ is Cons!2184) lt!86010) (not (= (_1!1612 (h!2801 lt!86010)) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun b!174224 () Bool)

(assert (=> b!174224 (= e!115046 (Some!191 (_2!1612 (h!2801 lt!86010))))))

(declare-fun b!174227 () Bool)

(assert (=> b!174227 (= e!115047 None!190)))

(declare-fun d!53123 () Bool)

(declare-fun c!31160 () Bool)

(assert (=> d!53123 (= c!31160 (and ((_ is Cons!2184) lt!86010) (= (_1!1612 (h!2801 lt!86010)) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!53123 (= (getValueByKey!186 lt!86010 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!115046)))

(assert (= (and d!53123 c!31160) b!174224))

(assert (= (and d!53123 (not c!31160)) b!174225))

(assert (= (and b!174225 c!31161) b!174226))

(assert (= (and b!174225 (not c!31161)) b!174227))

(declare-fun m!203223 () Bool)

(assert (=> b!174226 m!203223))

(assert (=> d!52739 d!53123))

(declare-fun d!53125 () Bool)

(assert (=> d!53125 (= (getValueByKey!186 lt!86010 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) (Some!191 (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun lt!86256 () Unit!5315)

(assert (=> d!53125 (= lt!86256 (choose!936 lt!86010 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun e!115048 () Bool)

(assert (=> d!53125 e!115048))

(declare-fun res!82661 () Bool)

(assert (=> d!53125 (=> (not res!82661) (not e!115048))))

(assert (=> d!53125 (= res!82661 (isStrictlySorted!319 lt!86010))))

(assert (=> d!53125 (= (lemmaContainsTupThenGetReturnValue!99 lt!86010 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86256)))

(declare-fun b!174228 () Bool)

(declare-fun res!82662 () Bool)

(assert (=> b!174228 (=> (not res!82662) (not e!115048))))

(assert (=> b!174228 (= res!82662 (containsKey!189 lt!86010 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174229 () Bool)

(assert (=> b!174229 (= e!115048 (contains!1151 lt!86010 (tuple2!3203 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (= (and d!53125 res!82661) b!174228))

(assert (= (and b!174228 res!82662) b!174229))

(assert (=> d!53125 m!202257))

(declare-fun m!203225 () Bool)

(assert (=> d!53125 m!203225))

(declare-fun m!203227 () Bool)

(assert (=> d!53125 m!203227))

(declare-fun m!203229 () Bool)

(assert (=> b!174228 m!203229))

(declare-fun m!203231 () Bool)

(assert (=> b!174229 m!203231))

(assert (=> d!52739 d!53125))

(declare-fun d!53127 () Bool)

(declare-fun e!115050 () Bool)

(assert (=> d!53127 e!115050))

(declare-fun res!82663 () Bool)

(assert (=> d!53127 (=> (not res!82663) (not e!115050))))

(declare-fun lt!86257 () List!2188)

(assert (=> d!53127 (= res!82663 (isStrictlySorted!319 lt!86257))))

(declare-fun e!115053 () List!2188)

(assert (=> d!53127 (= lt!86257 e!115053)))

(declare-fun c!31164 () Bool)

(assert (=> d!53127 (= c!31164 (and ((_ is Cons!2184) (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)))) (bvslt (_1!1612 (h!2801 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569))))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!53127 (isStrictlySorted!319 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569))))))

(assert (=> d!53127 (= (insertStrictlySorted!102 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) lt!86257)))

(declare-fun b!174230 () Bool)

(declare-fun call!17643 () List!2188)

(assert (=> b!174230 (= e!115053 call!17643)))

(declare-fun bm!17640 () Bool)

(declare-fun call!17644 () List!2188)

(declare-fun call!17645 () List!2188)

(assert (=> bm!17640 (= call!17644 call!17645)))

(declare-fun b!174231 () Bool)

(assert (=> b!174231 (= e!115050 (contains!1151 lt!86257 (tuple2!3203 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174232 () Bool)

(declare-fun e!115052 () List!2188)

(assert (=> b!174232 (= e!115052 call!17644)))

(declare-fun b!174233 () Bool)

(declare-fun e!115049 () List!2188)

(assert (=> b!174233 (= e!115049 (insertStrictlySorted!102 (t!6987 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun bm!17641 () Bool)

(assert (=> bm!17641 (= call!17643 ($colon$colon!97 e!115049 (ite c!31164 (h!2801 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)))) (tuple2!3203 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (_2!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun c!31162 () Bool)

(assert (=> bm!17641 (= c!31162 c!31164)))

(declare-fun b!174234 () Bool)

(declare-fun e!115051 () List!2188)

(assert (=> b!174234 (= e!115051 call!17645)))

(declare-fun b!174235 () Bool)

(assert (=> b!174235 (= e!115052 call!17644)))

(declare-fun b!174236 () Bool)

(assert (=> b!174236 (= e!115053 e!115051)))

(declare-fun c!31165 () Bool)

(assert (=> b!174236 (= c!31165 (and ((_ is Cons!2184) (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)))) (= (_1!1612 (h!2801 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569))))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174237 () Bool)

(declare-fun c!31163 () Bool)

(assert (=> b!174237 (= e!115049 (ite c!31165 (t!6987 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)))) (ite c!31163 (Cons!2184 (h!2801 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)))) (t!6987 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569))))) Nil!2185)))))

(declare-fun bm!17642 () Bool)

(assert (=> bm!17642 (= call!17645 call!17643)))

(declare-fun b!174238 () Bool)

(declare-fun res!82664 () Bool)

(assert (=> b!174238 (=> (not res!82664) (not e!115050))))

(assert (=> b!174238 (= res!82664 (containsKey!189 lt!86257 (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174239 () Bool)

(assert (=> b!174239 (= c!31163 (and ((_ is Cons!2184) (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569)))) (bvsgt (_1!1612 (h!2801 (toList!1083 (ite c!30929 call!17573 (ite c!30931 call!17567 call!17569))))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> b!174239 (= e!115051 e!115052)))

(assert (= (and d!53127 c!31164) b!174230))

(assert (= (and d!53127 (not c!31164)) b!174236))

(assert (= (and b!174236 c!31165) b!174234))

(assert (= (and b!174236 (not c!31165)) b!174239))

(assert (= (and b!174239 c!31163) b!174235))

(assert (= (and b!174239 (not c!31163)) b!174232))

(assert (= (or b!174235 b!174232) bm!17640))

(assert (= (or b!174234 bm!17640) bm!17642))

(assert (= (or b!174230 bm!17642) bm!17641))

(assert (= (and bm!17641 c!31162) b!174233))

(assert (= (and bm!17641 (not c!31162)) b!174237))

(assert (= (and d!53127 res!82663) b!174238))

(assert (= (and b!174238 res!82664) b!174231))

(declare-fun m!203233 () Bool)

(assert (=> bm!17641 m!203233))

(declare-fun m!203235 () Bool)

(assert (=> b!174233 m!203235))

(declare-fun m!203237 () Bool)

(assert (=> b!174238 m!203237))

(declare-fun m!203239 () Bool)

(assert (=> b!174231 m!203239))

(declare-fun m!203241 () Bool)

(assert (=> d!53127 m!203241))

(declare-fun m!203243 () Bool)

(assert (=> d!53127 m!203243))

(assert (=> d!52739 d!53127))

(assert (=> b!173651 d!52695))

(declare-fun d!53129 () Bool)

(declare-fun e!115055 () Bool)

(assert (=> d!53129 e!115055))

(declare-fun res!82665 () Bool)

(assert (=> d!53129 (=> res!82665 e!115055)))

(declare-fun lt!86260 () Bool)

(assert (=> d!53129 (= res!82665 (not lt!86260))))

(declare-fun lt!86259 () Bool)

(assert (=> d!53129 (= lt!86260 lt!86259)))

(declare-fun lt!86261 () Unit!5315)

(declare-fun e!115054 () Unit!5315)

(assert (=> d!53129 (= lt!86261 e!115054)))

(declare-fun c!31166 () Bool)

(assert (=> d!53129 (= c!31166 lt!86259)))

(assert (=> d!53129 (= lt!86259 (containsKey!189 (toList!1083 lt!85882) lt!85881))))

(assert (=> d!53129 (= (contains!1149 lt!85882 lt!85881) lt!86260)))

(declare-fun b!174240 () Bool)

(declare-fun lt!86258 () Unit!5315)

(assert (=> b!174240 (= e!115054 lt!86258)))

(assert (=> b!174240 (= lt!86258 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85882) lt!85881))))

(assert (=> b!174240 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85882) lt!85881))))

(declare-fun b!174241 () Bool)

(declare-fun Unit!5351 () Unit!5315)

(assert (=> b!174241 (= e!115054 Unit!5351)))

(declare-fun b!174242 () Bool)

(assert (=> b!174242 (= e!115055 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85882) lt!85881)))))

(assert (= (and d!53129 c!31166) b!174240))

(assert (= (and d!53129 (not c!31166)) b!174241))

(assert (= (and d!53129 (not res!82665)) b!174242))

(declare-fun m!203245 () Bool)

(assert (=> d!53129 m!203245))

(declare-fun m!203247 () Bool)

(assert (=> b!174240 m!203247))

(assert (=> b!174240 m!202521))

(assert (=> b!174240 m!202521))

(declare-fun m!203249 () Bool)

(assert (=> b!174240 m!203249))

(assert (=> b!174242 m!202521))

(assert (=> b!174242 m!202521))

(assert (=> b!174242 m!203249))

(assert (=> d!52813 d!53129))

(assert (=> d!52813 d!52823))

(declare-fun d!53131 () Bool)

(assert (=> d!53131 (= (apply!130 (+!245 lt!85882 (tuple2!3203 lt!85887 (zeroValue!3438 thiss!1248))) lt!85881) (apply!130 lt!85882 lt!85881))))

(assert (=> d!53131 true))

(declare-fun _$34!1057 () Unit!5315)

(assert (=> d!53131 (= (choose!938 lt!85882 lt!85887 (zeroValue!3438 thiss!1248) lt!85881) _$34!1057)))

(declare-fun bs!7211 () Bool)

(assert (= bs!7211 d!53131))

(assert (=> bs!7211 m!201991))

(assert (=> bs!7211 m!201991))

(assert (=> bs!7211 m!201993))

(assert (=> bs!7211 m!201999))

(assert (=> d!52813 d!53131))

(assert (=> d!52813 d!52815))

(assert (=> d!52813 d!52819))

(declare-fun e!115057 () Option!192)

(declare-fun b!174245 () Bool)

(assert (=> b!174245 (= e!115057 (getValueByKey!186 (t!6987 (t!6987 (toList!1083 lt!85916))) (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!174244 () Bool)

(declare-fun e!115056 () Option!192)

(assert (=> b!174244 (= e!115056 e!115057)))

(declare-fun c!31168 () Bool)

(assert (=> b!174244 (= c!31168 (and ((_ is Cons!2184) (t!6987 (toList!1083 lt!85916))) (not (= (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85916)))) (_1!1612 (tuple2!3203 key!828 v!309))))))))

(declare-fun b!174243 () Bool)

(assert (=> b!174243 (= e!115056 (Some!191 (_2!1612 (h!2801 (t!6987 (toList!1083 lt!85916))))))))

(declare-fun b!174246 () Bool)

(assert (=> b!174246 (= e!115057 None!190)))

(declare-fun d!53133 () Bool)

(declare-fun c!31167 () Bool)

(assert (=> d!53133 (= c!31167 (and ((_ is Cons!2184) (t!6987 (toList!1083 lt!85916))) (= (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85916)))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!53133 (= (getValueByKey!186 (t!6987 (toList!1083 lt!85916)) (_1!1612 (tuple2!3203 key!828 v!309))) e!115056)))

(assert (= (and d!53133 c!31167) b!174243))

(assert (= (and d!53133 (not c!31167)) b!174244))

(assert (= (and b!174244 c!31168) b!174245))

(assert (= (and b!174244 (not c!31168)) b!174246))

(declare-fun m!203251 () Bool)

(assert (=> b!174245 m!203251))

(assert (=> b!173727 d!53133))

(declare-fun b!174249 () Bool)

(declare-fun e!115059 () Option!192)

(assert (=> b!174249 (= e!115059 (getValueByKey!186 (t!6987 (toList!1083 lt!86021)) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun b!174248 () Bool)

(declare-fun e!115058 () Option!192)

(assert (=> b!174248 (= e!115058 e!115059)))

(declare-fun c!31170 () Bool)

(assert (=> b!174248 (= c!31170 (and ((_ is Cons!2184) (toList!1083 lt!86021)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86021))) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174247 () Bool)

(assert (=> b!174247 (= e!115058 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86021)))))))

(declare-fun b!174250 () Bool)

(assert (=> b!174250 (= e!115059 None!190)))

(declare-fun d!53135 () Bool)

(declare-fun c!31169 () Bool)

(assert (=> d!53135 (= c!31169 (and ((_ is Cons!2184) (toList!1083 lt!86021)) (= (_1!1612 (h!2801 (toList!1083 lt!86021))) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(assert (=> d!53135 (= (getValueByKey!186 (toList!1083 lt!86021) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) e!115058)))

(assert (= (and d!53135 c!31169) b!174247))

(assert (= (and d!53135 (not c!31169)) b!174248))

(assert (= (and b!174248 c!31170) b!174249))

(assert (= (and b!174248 (not c!31170)) b!174250))

(declare-fun m!203253 () Bool)

(assert (=> b!174249 m!203253))

(assert (=> b!173707 d!53135))

(declare-fun d!53137 () Bool)

(declare-fun res!82666 () Bool)

(declare-fun e!115060 () Bool)

(assert (=> d!53137 (=> res!82666 e!115060)))

(assert (=> d!53137 (= res!82666 (and ((_ is Cons!2184) (t!6987 (toList!1083 lt!85777))) (= (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85777)))) key!828)))))

(assert (=> d!53137 (= (containsKey!189 (t!6987 (toList!1083 lt!85777)) key!828) e!115060)))

(declare-fun b!174251 () Bool)

(declare-fun e!115061 () Bool)

(assert (=> b!174251 (= e!115060 e!115061)))

(declare-fun res!82667 () Bool)

(assert (=> b!174251 (=> (not res!82667) (not e!115061))))

(assert (=> b!174251 (= res!82667 (and (or (not ((_ is Cons!2184) (t!6987 (toList!1083 lt!85777)))) (bvsle (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85777)))) key!828)) ((_ is Cons!2184) (t!6987 (toList!1083 lt!85777))) (bvslt (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85777)))) key!828)))))

(declare-fun b!174252 () Bool)

(assert (=> b!174252 (= e!115061 (containsKey!189 (t!6987 (t!6987 (toList!1083 lt!85777))) key!828))))

(assert (= (and d!53137 (not res!82666)) b!174251))

(assert (= (and b!174251 res!82667) b!174252))

(declare-fun m!203255 () Bool)

(assert (=> b!174252 m!203255))

(assert (=> b!173741 d!53137))

(declare-fun d!53139 () Bool)

(assert (=> d!53139 (= (apply!130 lt!85971 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1975 (getValueByKey!186 (toList!1083 lt!85971) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7212 () Bool)

(assert (= bs!7212 d!53139))

(assert (=> bs!7212 m!201909))

(declare-fun m!203257 () Bool)

(assert (=> bs!7212 m!203257))

(assert (=> bs!7212 m!203257))

(declare-fun m!203259 () Bool)

(assert (=> bs!7212 m!203259))

(assert (=> b!173648 d!53139))

(assert (=> b!173648 d!52733))

(assert (=> b!173785 d!53059))

(declare-fun d!53141 () Bool)

(declare-fun res!82670 () Bool)

(declare-fun e!115062 () Bool)

(assert (=> d!53141 (=> res!82670 e!115062)))

(assert (=> d!53141 (= res!82670 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(assert (=> d!53141 (= (arrayNoDuplicates!0 (_keys!5438 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31014 (Cons!2187 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) Nil!2188) Nil!2188)) e!115062)))

(declare-fun b!174253 () Bool)

(declare-fun e!115063 () Bool)

(declare-fun e!115065 () Bool)

(assert (=> b!174253 (= e!115063 e!115065)))

(declare-fun c!31171 () Bool)

(assert (=> b!174253 (= c!31171 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174254 () Bool)

(declare-fun call!17646 () Bool)

(assert (=> b!174254 (= e!115065 call!17646)))

(declare-fun bm!17643 () Bool)

(assert (=> bm!17643 (= call!17646 (arrayNoDuplicates!0 (_keys!5438 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!31171 (Cons!2187 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!31014 (Cons!2187 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) Nil!2188) Nil!2188)) (ite c!31014 (Cons!2187 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) Nil!2188) Nil!2188))))))

(declare-fun b!174255 () Bool)

(declare-fun e!115064 () Bool)

(assert (=> b!174255 (= e!115064 (contains!1152 (ite c!31014 (Cons!2187 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) Nil!2188) Nil!2188) (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174256 () Bool)

(assert (=> b!174256 (= e!115065 call!17646)))

(declare-fun b!174257 () Bool)

(assert (=> b!174257 (= e!115062 e!115063)))

(declare-fun res!82669 () Bool)

(assert (=> b!174257 (=> (not res!82669) (not e!115063))))

(assert (=> b!174257 (= res!82669 (not e!115064))))

(declare-fun res!82668 () Bool)

(assert (=> b!174257 (=> (not res!82668) (not e!115064))))

(assert (=> b!174257 (= res!82668 (validKeyInArray!0 (select (arr!3458 (_keys!5438 thiss!1248)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!53141 (not res!82670)) b!174257))

(assert (= (and b!174257 res!82668) b!174255))

(assert (= (and b!174257 res!82669) b!174253))

(assert (= (and b!174253 c!31171) b!174254))

(assert (= (and b!174253 (not c!31171)) b!174256))

(assert (= (or b!174254 b!174256) bm!17643))

(assert (=> b!174253 m!202659))

(assert (=> b!174253 m!202659))

(assert (=> b!174253 m!202669))

(assert (=> bm!17643 m!202659))

(declare-fun m!203261 () Bool)

(assert (=> bm!17643 m!203261))

(assert (=> b!174255 m!202659))

(assert (=> b!174255 m!202659))

(declare-fun m!203263 () Bool)

(assert (=> b!174255 m!203263))

(assert (=> b!174257 m!202659))

(assert (=> b!174257 m!202659))

(assert (=> b!174257 m!202669))

(assert (=> bm!17605 d!53141))

(declare-fun d!53143 () Bool)

(declare-fun lt!86262 () Bool)

(assert (=> d!53143 (= lt!86262 (select (content!150 (toList!1083 lt!86093)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun e!115066 () Bool)

(assert (=> d!53143 (= lt!86262 e!115066)))

(declare-fun res!82671 () Bool)

(assert (=> d!53143 (=> (not res!82671) (not e!115066))))

(assert (=> d!53143 (= res!82671 ((_ is Cons!2184) (toList!1083 lt!86093)))))

(assert (=> d!53143 (= (contains!1151 (toList!1083 lt!86093) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) lt!86262)))

(declare-fun b!174258 () Bool)

(declare-fun e!115067 () Bool)

(assert (=> b!174258 (= e!115066 e!115067)))

(declare-fun res!82672 () Bool)

(assert (=> b!174258 (=> res!82672 e!115067)))

(assert (=> b!174258 (= res!82672 (= (h!2801 (toList!1083 lt!86093)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(declare-fun b!174259 () Bool)

(assert (=> b!174259 (= e!115067 (contains!1151 (t!6987 (toList!1083 lt!86093)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))

(assert (= (and d!53143 res!82671) b!174258))

(assert (= (and b!174258 (not res!82672)) b!174259))

(declare-fun m!203265 () Bool)

(assert (=> d!53143 m!203265))

(declare-fun m!203267 () Bool)

(assert (=> d!53143 m!203267))

(declare-fun m!203269 () Bool)

(assert (=> b!174259 m!203269))

(assert (=> b!173783 d!53143))

(assert (=> d!52747 d!52745))

(declare-fun d!53145 () Bool)

(assert (=> d!53145 (= (getValueByKey!186 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!53145 true))

(declare-fun _$22!536 () Unit!5315)

(assert (=> d!53145 (= (choose!936 lt!85877 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) _$22!536)))

(declare-fun bs!7213 () Bool)

(assert (= bs!7213 d!53145))

(assert (=> bs!7213 m!201965))

(assert (=> d!52747 d!53145))

(declare-fun d!53147 () Bool)

(declare-fun res!82673 () Bool)

(declare-fun e!115068 () Bool)

(assert (=> d!53147 (=> res!82673 e!115068)))

(assert (=> d!53147 (= res!82673 (or ((_ is Nil!2185) lt!85877) ((_ is Nil!2185) (t!6987 lt!85877))))))

(assert (=> d!53147 (= (isStrictlySorted!319 lt!85877) e!115068)))

(declare-fun b!174260 () Bool)

(declare-fun e!115069 () Bool)

(assert (=> b!174260 (= e!115068 e!115069)))

(declare-fun res!82674 () Bool)

(assert (=> b!174260 (=> (not res!82674) (not e!115069))))

(assert (=> b!174260 (= res!82674 (bvslt (_1!1612 (h!2801 lt!85877)) (_1!1612 (h!2801 (t!6987 lt!85877)))))))

(declare-fun b!174261 () Bool)

(assert (=> b!174261 (= e!115069 (isStrictlySorted!319 (t!6987 lt!85877)))))

(assert (= (and d!53147 (not res!82673)) b!174260))

(assert (= (and b!174260 res!82674) b!174261))

(declare-fun m!203271 () Bool)

(assert (=> b!174261 m!203271))

(assert (=> d!52747 d!53147))

(declare-fun d!53149 () Bool)

(declare-fun e!115071 () Bool)

(assert (=> d!53149 e!115071))

(declare-fun res!82675 () Bool)

(assert (=> d!53149 (=> res!82675 e!115071)))

(declare-fun lt!86265 () Bool)

(assert (=> d!53149 (= res!82675 (not lt!86265))))

(declare-fun lt!86264 () Bool)

(assert (=> d!53149 (= lt!86265 lt!86264)))

(declare-fun lt!86266 () Unit!5315)

(declare-fun e!115070 () Unit!5315)

(assert (=> d!53149 (= lt!86266 e!115070)))

(declare-fun c!31172 () Bool)

(assert (=> d!53149 (= c!31172 lt!86264)))

(assert (=> d!53149 (= lt!86264 (containsKey!189 (toList!1083 lt!86021) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(assert (=> d!53149 (= (contains!1149 lt!86021 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) lt!86265)))

(declare-fun b!174262 () Bool)

(declare-fun lt!86263 () Unit!5315)

(assert (=> b!174262 (= e!115070 lt!86263)))

(assert (=> b!174262 (= lt!86263 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86021) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(assert (=> b!174262 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86021) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun b!174263 () Bool)

(declare-fun Unit!5352 () Unit!5315)

(assert (=> b!174263 (= e!115070 Unit!5352)))

(declare-fun b!174264 () Bool)

(assert (=> b!174264 (= e!115071 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86021) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(assert (= (and d!53149 c!31172) b!174262))

(assert (= (and d!53149 (not c!31172)) b!174263))

(assert (= (and d!53149 (not res!82675)) b!174264))

(declare-fun m!203273 () Bool)

(assert (=> d!53149 m!203273))

(declare-fun m!203275 () Bool)

(assert (=> b!174262 m!203275))

(assert (=> b!174262 m!202307))

(assert (=> b!174262 m!202307))

(declare-fun m!203277 () Bool)

(assert (=> b!174262 m!203277))

(assert (=> b!174264 m!202307))

(assert (=> b!174264 m!202307))

(assert (=> b!174264 m!203277))

(assert (=> d!52753 d!53149))

(declare-fun e!115073 () Option!192)

(declare-fun b!174267 () Bool)

(assert (=> b!174267 (= e!115073 (getValueByKey!186 (t!6987 lt!86020) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun b!174266 () Bool)

(declare-fun e!115072 () Option!192)

(assert (=> b!174266 (= e!115072 e!115073)))

(declare-fun c!31174 () Bool)

(assert (=> b!174266 (= c!31174 (and ((_ is Cons!2184) lt!86020) (not (= (_1!1612 (h!2801 lt!86020)) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))))

(declare-fun b!174265 () Bool)

(assert (=> b!174265 (= e!115072 (Some!191 (_2!1612 (h!2801 lt!86020))))))

(declare-fun b!174268 () Bool)

(assert (=> b!174268 (= e!115073 None!190)))

(declare-fun d!53151 () Bool)

(declare-fun c!31173 () Bool)

(assert (=> d!53151 (= c!31173 (and ((_ is Cons!2184) lt!86020) (= (_1!1612 (h!2801 lt!86020)) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(assert (=> d!53151 (= (getValueByKey!186 lt!86020 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) e!115072)))

(assert (= (and d!53151 c!31173) b!174265))

(assert (= (and d!53151 (not c!31173)) b!174266))

(assert (= (and b!174266 c!31174) b!174267))

(assert (= (and b!174266 (not c!31174)) b!174268))

(declare-fun m!203279 () Bool)

(assert (=> b!174267 m!203279))

(assert (=> d!52753 d!53151))

(declare-fun d!53153 () Bool)

(assert (=> d!53153 (= (getValueByKey!186 lt!86020 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) (Some!191 (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun lt!86267 () Unit!5315)

(assert (=> d!53153 (= lt!86267 (choose!936 lt!86020 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun e!115074 () Bool)

(assert (=> d!53153 e!115074))

(declare-fun res!82676 () Bool)

(assert (=> d!53153 (=> (not res!82676) (not e!115074))))

(assert (=> d!53153 (= res!82676 (isStrictlySorted!319 lt!86020))))

(assert (=> d!53153 (= (lemmaContainsTupThenGetReturnValue!99 lt!86020 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) lt!86267)))

(declare-fun b!174269 () Bool)

(declare-fun res!82677 () Bool)

(assert (=> b!174269 (=> (not res!82677) (not e!115074))))

(assert (=> b!174269 (= res!82677 (containsKey!189 lt!86020 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun b!174270 () Bool)

(assert (=> b!174270 (= e!115074 (contains!1151 lt!86020 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(assert (= (and d!53153 res!82676) b!174269))

(assert (= (and b!174269 res!82677) b!174270))

(assert (=> d!53153 m!202301))

(declare-fun m!203281 () Bool)

(assert (=> d!53153 m!203281))

(declare-fun m!203283 () Bool)

(assert (=> d!53153 m!203283))

(declare-fun m!203285 () Bool)

(assert (=> b!174269 m!203285))

(declare-fun m!203287 () Bool)

(assert (=> b!174270 m!203287))

(assert (=> d!52753 d!53153))

(declare-fun d!53155 () Bool)

(declare-fun e!115076 () Bool)

(assert (=> d!53155 e!115076))

(declare-fun res!82678 () Bool)

(assert (=> d!53155 (=> (not res!82678) (not e!115076))))

(declare-fun lt!86268 () List!2188)

(assert (=> d!53155 (= res!82678 (isStrictlySorted!319 lt!86268))))

(declare-fun e!115079 () List!2188)

(assert (=> d!53155 (= lt!86268 e!115079)))

(declare-fun c!31177 () Bool)

(assert (=> d!53155 (= c!31177 (and ((_ is Cons!2184) (toList!1083 lt!85858)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85858))) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(assert (=> d!53155 (isStrictlySorted!319 (toList!1083 lt!85858))))

(assert (=> d!53155 (= (insertStrictlySorted!102 (toList!1083 lt!85858) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) lt!86268)))

(declare-fun b!174271 () Bool)

(declare-fun call!17647 () List!2188)

(assert (=> b!174271 (= e!115079 call!17647)))

(declare-fun bm!17644 () Bool)

(declare-fun call!17648 () List!2188)

(declare-fun call!17649 () List!2188)

(assert (=> bm!17644 (= call!17648 call!17649)))

(declare-fun b!174272 () Bool)

(assert (=> b!174272 (= e!115076 (contains!1151 lt!86268 (tuple2!3203 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(declare-fun b!174273 () Bool)

(declare-fun e!115078 () List!2188)

(assert (=> b!174273 (= e!115078 call!17648)))

(declare-fun b!174274 () Bool)

(declare-fun e!115075 () List!2188)

(assert (=> b!174274 (= e!115075 (insertStrictlySorted!102 (t!6987 (toList!1083 lt!85858)) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun bm!17645 () Bool)

(assert (=> bm!17645 (= call!17647 ($colon$colon!97 e!115075 (ite c!31177 (h!2801 (toList!1083 lt!85858)) (tuple2!3203 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))) (_2!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))))

(declare-fun c!31175 () Bool)

(assert (=> bm!17645 (= c!31175 c!31177)))

(declare-fun b!174275 () Bool)

(declare-fun e!115077 () List!2188)

(assert (=> b!174275 (= e!115077 call!17649)))

(declare-fun b!174276 () Bool)

(assert (=> b!174276 (= e!115078 call!17648)))

(declare-fun b!174277 () Bool)

(assert (=> b!174277 (= e!115079 e!115077)))

(declare-fun c!31178 () Bool)

(assert (=> b!174277 (= c!31178 (and ((_ is Cons!2184) (toList!1083 lt!85858)) (= (_1!1612 (h!2801 (toList!1083 lt!85858))) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(declare-fun b!174278 () Bool)

(declare-fun c!31176 () Bool)

(assert (=> b!174278 (= e!115075 (ite c!31178 (t!6987 (toList!1083 lt!85858)) (ite c!31176 (Cons!2184 (h!2801 (toList!1083 lt!85858)) (t!6987 (toList!1083 lt!85858))) Nil!2185)))))

(declare-fun bm!17646 () Bool)

(assert (=> bm!17646 (= call!17649 call!17647)))

(declare-fun b!174279 () Bool)

(declare-fun res!82679 () Bool)

(assert (=> b!174279 (=> (not res!82679) (not e!115076))))

(assert (=> b!174279 (= res!82679 (containsKey!189 lt!86268 (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))))

(declare-fun b!174280 () Bool)

(assert (=> b!174280 (= c!31176 (and ((_ is Cons!2184) (toList!1083 lt!85858)) (bvsgt (_1!1612 (h!2801 (toList!1083 lt!85858))) (_1!1612 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))

(assert (=> b!174280 (= e!115077 e!115078)))

(assert (= (and d!53155 c!31177) b!174271))

(assert (= (and d!53155 (not c!31177)) b!174277))

(assert (= (and b!174277 c!31178) b!174275))

(assert (= (and b!174277 (not c!31178)) b!174280))

(assert (= (and b!174280 c!31176) b!174276))

(assert (= (and b!174280 (not c!31176)) b!174273))

(assert (= (or b!174276 b!174273) bm!17644))

(assert (= (or b!174275 bm!17644) bm!17646))

(assert (= (or b!174271 bm!17646) bm!17645))

(assert (= (and bm!17645 c!31175) b!174274))

(assert (= (and bm!17645 (not c!31175)) b!174278))

(assert (= (and d!53155 res!82678) b!174279))

(assert (= (and b!174279 res!82679) b!174272))

(declare-fun m!203289 () Bool)

(assert (=> bm!17645 m!203289))

(declare-fun m!203291 () Bool)

(assert (=> b!174274 m!203291))

(declare-fun m!203293 () Bool)

(assert (=> b!174279 m!203293))

(declare-fun m!203295 () Bool)

(assert (=> b!174272 m!203295))

(declare-fun m!203297 () Bool)

(assert (=> d!53155 m!203297))

(declare-fun m!203299 () Bool)

(assert (=> d!53155 m!203299))

(assert (=> d!52753 d!53155))

(declare-fun b!174283 () Bool)

(declare-fun e!115081 () Option!192)

(assert (=> b!174283 (= e!115081 (getValueByKey!186 (t!6987 (t!6987 lt!85915)) (_1!1612 (tuple2!3203 key!828 v!309))))))

(declare-fun b!174282 () Bool)

(declare-fun e!115080 () Option!192)

(assert (=> b!174282 (= e!115080 e!115081)))

(declare-fun c!31180 () Bool)

(assert (=> b!174282 (= c!31180 (and ((_ is Cons!2184) (t!6987 lt!85915)) (not (= (_1!1612 (h!2801 (t!6987 lt!85915))) (_1!1612 (tuple2!3203 key!828 v!309))))))))

(declare-fun b!174281 () Bool)

(assert (=> b!174281 (= e!115080 (Some!191 (_2!1612 (h!2801 (t!6987 lt!85915)))))))

(declare-fun b!174284 () Bool)

(assert (=> b!174284 (= e!115081 None!190)))

(declare-fun d!53157 () Bool)

(declare-fun c!31179 () Bool)

(assert (=> d!53157 (= c!31179 (and ((_ is Cons!2184) (t!6987 lt!85915)) (= (_1!1612 (h!2801 (t!6987 lt!85915))) (_1!1612 (tuple2!3203 key!828 v!309)))))))

(assert (=> d!53157 (= (getValueByKey!186 (t!6987 lt!85915) (_1!1612 (tuple2!3203 key!828 v!309))) e!115080)))

(assert (= (and d!53157 c!31179) b!174281))

(assert (= (and d!53157 (not c!31179)) b!174282))

(assert (= (and b!174282 c!31180) b!174283))

(assert (= (and b!174282 (not c!31180)) b!174284))

(declare-fun m!203301 () Bool)

(assert (=> b!174283 m!203301))

(assert (=> b!173504 d!53157))

(declare-fun b!174287 () Bool)

(declare-fun e!115083 () Option!192)

(assert (=> b!174287 (= e!115083 (getValueByKey!186 (t!6987 (toList!1083 lt!85942)) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))

(declare-fun b!174286 () Bool)

(declare-fun e!115082 () Option!192)

(assert (=> b!174286 (= e!115082 e!115083)))

(declare-fun c!31182 () Bool)

(assert (=> b!174286 (= c!31182 (and ((_ is Cons!2184) (toList!1083 lt!85942)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85942))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))))))

(declare-fun b!174285 () Bool)

(assert (=> b!174285 (= e!115082 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85942)))))))

(declare-fun b!174288 () Bool)

(assert (=> b!174288 (= e!115083 None!190)))

(declare-fun d!53159 () Bool)

(declare-fun c!31181 () Bool)

(assert (=> d!53159 (= c!31181 (and ((_ is Cons!2184) (toList!1083 lt!85942)) (= (_1!1612 (h!2801 (toList!1083 lt!85942))) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248)))))))))

(assert (=> d!53159 (= (getValueByKey!186 (toList!1083 lt!85942) (_1!1612 (ite (or c!30923 c!30925) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))) e!115082)))

(assert (= (and d!53159 c!31181) b!174285))

(assert (= (and d!53159 (not c!31181)) b!174286))

(assert (= (and b!174286 c!31182) b!174287))

(assert (= (and b!174286 (not c!31182)) b!174288))

(declare-fun m!203303 () Bool)

(assert (=> b!174287 m!203303))

(assert (=> b!173561 d!53159))

(declare-fun d!53161 () Bool)

(declare-fun lt!86269 () Bool)

(assert (=> d!53161 (= lt!86269 (select (content!151 Nil!2188) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun e!115084 () Bool)

(assert (=> d!53161 (= lt!86269 e!115084)))

(declare-fun res!82681 () Bool)

(assert (=> d!53161 (=> (not res!82681) (not e!115084))))

(assert (=> d!53161 (= res!82681 ((_ is Cons!2187) Nil!2188))))

(assert (=> d!53161 (= (contains!1152 Nil!2188 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)) lt!86269)))

(declare-fun b!174289 () Bool)

(declare-fun e!115085 () Bool)

(assert (=> b!174289 (= e!115084 e!115085)))

(declare-fun res!82680 () Bool)

(assert (=> b!174289 (=> res!82680 e!115085)))

(assert (=> b!174289 (= res!82680 (= (h!2804 Nil!2188) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!174290 () Bool)

(assert (=> b!174290 (= e!115085 (contains!1152 (t!6992 Nil!2188) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (= (and d!53161 res!82681) b!174289))

(assert (= (and b!174289 (not res!82680)) b!174290))

(assert (=> d!53161 m!203061))

(assert (=> d!53161 m!202083))

(declare-fun m!203305 () Bool)

(assert (=> d!53161 m!203305))

(assert (=> b!174290 m!202083))

(declare-fun m!203307 () Bool)

(assert (=> b!174290 m!203307))

(assert (=> b!173575 d!53161))

(declare-fun d!53163 () Bool)

(assert (=> d!53163 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893))))

(declare-fun lt!86270 () Unit!5315)

(assert (=> d!53163 (= lt!86270 (choose!937 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893))))

(declare-fun e!115086 () Bool)

(assert (=> d!53163 e!115086))

(declare-fun res!82682 () Bool)

(assert (=> d!53163 (=> (not res!82682) (not e!115086))))

(assert (=> d!53163 (= res!82682 (isStrictlySorted!319 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))))

(assert (=> d!53163 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893) lt!86270)))

(declare-fun b!174291 () Bool)

(assert (=> b!174291 (= e!115086 (containsKey!189 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893))))

(assert (= (and d!53163 res!82682) b!174291))

(assert (=> d!53163 m!202517))

(assert (=> d!53163 m!202517))

(assert (=> d!53163 m!202519))

(declare-fun m!203309 () Bool)

(assert (=> d!53163 m!203309))

(declare-fun m!203311 () Bool)

(assert (=> d!53163 m!203311))

(assert (=> b!174291 m!202513))

(assert (=> b!173774 d!53163))

(assert (=> b!173774 d!52847))

(assert (=> b!173774 d!52849))

(declare-fun d!53165 () Bool)

(assert (=> d!53165 (= (isEmpty!443 lt!86055) (isEmpty!444 (toList!1083 lt!86055)))))

(declare-fun bs!7214 () Bool)

(assert (= bs!7214 d!53165))

(declare-fun m!203313 () Bool)

(assert (=> bs!7214 m!203313))

(assert (=> b!173759 d!53165))

(declare-fun b!174294 () Bool)

(declare-fun e!115088 () Option!192)

(assert (=> b!174294 (= e!115088 (getValueByKey!186 (t!6987 (t!6987 lt!85877)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174293 () Bool)

(declare-fun e!115087 () Option!192)

(assert (=> b!174293 (= e!115087 e!115088)))

(declare-fun c!31184 () Bool)

(assert (=> b!174293 (= c!31184 (and ((_ is Cons!2184) (t!6987 lt!85877)) (not (= (_1!1612 (h!2801 (t!6987 lt!85877))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174292 () Bool)

(assert (=> b!174292 (= e!115087 (Some!191 (_2!1612 (h!2801 (t!6987 lt!85877)))))))

(declare-fun b!174295 () Bool)

(assert (=> b!174295 (= e!115088 None!190)))

(declare-fun d!53167 () Bool)

(declare-fun c!31183 () Bool)

(assert (=> d!53167 (= c!31183 (and ((_ is Cons!2184) (t!6987 lt!85877)) (= (_1!1612 (h!2801 (t!6987 lt!85877))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53167 (= (getValueByKey!186 (t!6987 lt!85877) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115087)))

(assert (= (and d!53167 c!31183) b!174292))

(assert (= (and d!53167 (not c!31183)) b!174293))

(assert (= (and b!174293 c!31184) b!174294))

(assert (= (and b!174293 (not c!31184)) b!174295))

(declare-fun m!203315 () Bool)

(assert (=> b!174294 m!203315))

(assert (=> b!173693 d!53167))

(declare-fun d!53169 () Bool)

(declare-fun res!82683 () Bool)

(declare-fun e!115089 () Bool)

(assert (=> d!53169 (=> res!82683 e!115089)))

(assert (=> d!53169 (= res!82683 (or ((_ is Nil!2185) lt!86017) ((_ is Nil!2185) (t!6987 lt!86017))))))

(assert (=> d!53169 (= (isStrictlySorted!319 lt!86017) e!115089)))

(declare-fun b!174296 () Bool)

(declare-fun e!115090 () Bool)

(assert (=> b!174296 (= e!115089 e!115090)))

(declare-fun res!82684 () Bool)

(assert (=> b!174296 (=> (not res!82684) (not e!115090))))

(assert (=> b!174296 (= res!82684 (bvslt (_1!1612 (h!2801 lt!86017)) (_1!1612 (h!2801 (t!6987 lt!86017)))))))

(declare-fun b!174297 () Bool)

(assert (=> b!174297 (= e!115090 (isStrictlySorted!319 (t!6987 lt!86017)))))

(assert (= (and d!53169 (not res!82683)) b!174296))

(assert (= (and b!174296 res!82684) b!174297))

(declare-fun m!203317 () Bool)

(assert (=> b!174297 m!203317))

(assert (=> d!52749 d!53169))

(declare-fun d!53171 () Bool)

(declare-fun res!82685 () Bool)

(declare-fun e!115091 () Bool)

(assert (=> d!53171 (=> res!82685 e!115091)))

(assert (=> d!53171 (= res!82685 (or ((_ is Nil!2185) (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) ((_ is Nil!2185) (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))))))

(assert (=> d!53171 (= (isStrictlySorted!319 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) e!115091)))

(declare-fun b!174298 () Bool)

(declare-fun e!115092 () Bool)

(assert (=> b!174298 (= e!115091 e!115092)))

(declare-fun res!82686 () Bool)

(assert (=> b!174298 (=> (not res!82686) (not e!115092))))

(assert (=> b!174298 (= res!82686 (bvslt (_1!1612 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1612 (h!2801 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))))))))

(declare-fun b!174299 () Bool)

(assert (=> b!174299 (= e!115092 (isStrictlySorted!319 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))))))

(assert (= (and d!53171 (not res!82685)) b!174298))

(assert (= (and b!174298 res!82686) b!174299))

(declare-fun m!203319 () Bool)

(assert (=> b!174299 m!203319))

(assert (=> d!52749 d!53171))

(declare-fun d!53173 () Bool)

(assert (=> d!53173 (= (get!1976 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3954 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!173661 d!53173))

(assert (=> d!52803 d!52821))

(assert (=> d!52803 d!52807))

(declare-fun d!53175 () Bool)

(assert (=> d!53175 (contains!1149 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) lt!85893)))

(assert (=> d!53175 true))

(declare-fun _$35!412 () Unit!5315)

(assert (=> d!53175 (= (choose!939 lt!85879 lt!85889 (zeroValue!3438 thiss!1248) lt!85893) _$35!412)))

(declare-fun bs!7215 () Bool)

(assert (= bs!7215 d!53175))

(assert (=> bs!7215 m!202007))

(assert (=> bs!7215 m!202007))

(assert (=> bs!7215 m!202015))

(assert (=> d!52803 d!53175))

(declare-fun d!53177 () Bool)

(declare-fun e!115094 () Bool)

(assert (=> d!53177 e!115094))

(declare-fun res!82687 () Bool)

(assert (=> d!53177 (=> res!82687 e!115094)))

(declare-fun lt!86273 () Bool)

(assert (=> d!53177 (= res!82687 (not lt!86273))))

(declare-fun lt!86272 () Bool)

(assert (=> d!53177 (= lt!86273 lt!86272)))

(declare-fun lt!86274 () Unit!5315)

(declare-fun e!115093 () Unit!5315)

(assert (=> d!53177 (= lt!86274 e!115093)))

(declare-fun c!31185 () Bool)

(assert (=> d!53177 (= c!31185 lt!86272)))

(assert (=> d!53177 (= lt!86272 (containsKey!189 (toList!1083 lt!85879) lt!85893))))

(assert (=> d!53177 (= (contains!1149 lt!85879 lt!85893) lt!86273)))

(declare-fun b!174301 () Bool)

(declare-fun lt!86271 () Unit!5315)

(assert (=> b!174301 (= e!115093 lt!86271)))

(assert (=> b!174301 (= lt!86271 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85879) lt!85893))))

(assert (=> b!174301 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85879) lt!85893))))

(declare-fun b!174302 () Bool)

(declare-fun Unit!5353 () Unit!5315)

(assert (=> b!174302 (= e!115093 Unit!5353)))

(declare-fun b!174303 () Bool)

(assert (=> b!174303 (= e!115094 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85879) lt!85893)))))

(assert (= (and d!53177 c!31185) b!174301))

(assert (= (and d!53177 (not c!31185)) b!174302))

(assert (= (and d!53177 (not res!82687)) b!174303))

(declare-fun m!203321 () Bool)

(assert (=> d!53177 m!203321))

(declare-fun m!203323 () Bool)

(assert (=> b!174301 m!203323))

(declare-fun m!203325 () Bool)

(assert (=> b!174301 m!203325))

(assert (=> b!174301 m!203325))

(declare-fun m!203327 () Bool)

(assert (=> b!174301 m!203327))

(assert (=> b!174303 m!203325))

(assert (=> b!174303 m!203325))

(assert (=> b!174303 m!203327))

(assert (=> d!52803 d!53177))

(declare-fun d!53179 () Bool)

(assert (=> d!53179 (= ($colon$colon!97 e!114723 (ite c!31001 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))) (Cons!2184 (ite c!31001 (h!2801 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!114723))))

(assert (=> bm!17600 d!53179))

(declare-fun d!53181 () Bool)

(assert (=> d!53181 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86275 () Unit!5315)

(assert (=> d!53181 (= lt!86275 (choose!937 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115095 () Bool)

(assert (=> d!53181 e!115095))

(declare-fun res!82688 () Bool)

(assert (=> d!53181 (=> (not res!82688) (not e!115095))))

(assert (=> d!53181 (= res!82688 (isStrictlySorted!319 (toList!1083 lt!85884)))))

(assert (=> d!53181 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000) lt!86275)))

(declare-fun b!174304 () Bool)

(assert (=> b!174304 (= e!115095 (containsKey!189 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53181 res!82688) b!174304))

(assert (=> d!53181 m!202403))

(assert (=> d!53181 m!202403))

(assert (=> d!53181 m!202405))

(declare-fun m!203329 () Bool)

(assert (=> d!53181 m!203329))

(declare-fun m!203331 () Bool)

(assert (=> d!53181 m!203331))

(assert (=> b!174304 m!202399))

(assert (=> b!173733 d!53181))

(assert (=> b!173733 d!52937))

(assert (=> b!173733 d!52859))

(declare-fun d!53183 () Bool)

(assert (=> d!53183 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3957 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52751 d!53183))

(assert (=> d!52751 d!53111))

(declare-fun d!53185 () Bool)

(declare-fun res!82689 () Bool)

(declare-fun e!115096 () Bool)

(assert (=> d!53185 (=> res!82689 e!115096)))

(assert (=> d!53185 (= res!82689 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))) lt!85893)))))

(assert (=> d!53185 (= (containsKey!189 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))) lt!85893) e!115096)))

(declare-fun b!174305 () Bool)

(declare-fun e!115097 () Bool)

(assert (=> b!174305 (= e!115096 e!115097)))

(declare-fun res!82690 () Bool)

(assert (=> b!174305 (=> (not res!82690) (not e!115097))))

(assert (=> b!174305 (= res!82690 (and (or (not ((_ is Cons!2184) (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))) (bvsle (_1!1612 (h!2801 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))) lt!85893)) ((_ is Cons!2184) (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))) (bvslt (_1!1612 (h!2801 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248)))))) lt!85893)))))

(declare-fun b!174306 () Bool)

(assert (=> b!174306 (= e!115097 (containsKey!189 (t!6987 (toList!1083 (+!245 lt!85879 (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))) lt!85893))))

(assert (= (and d!53185 (not res!82689)) b!174305))

(assert (= (and b!174305 res!82690) b!174306))

(declare-fun m!203333 () Bool)

(assert (=> b!174306 m!203333))

(assert (=> d!52821 d!53185))

(declare-fun d!53187 () Bool)

(assert (=> d!53187 (contains!1149 (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))) lt!85996)))

(declare-fun lt!86276 () Unit!5315)

(assert (=> d!53187 (= lt!86276 (choose!939 lt!85982 lt!85992 (zeroValue!3438 lt!85779) lt!85996))))

(assert (=> d!53187 (contains!1149 lt!85982 lt!85996)))

(assert (=> d!53187 (= (addStillContains!106 lt!85982 lt!85992 (zeroValue!3438 lt!85779) lt!85996) lt!86276)))

(declare-fun bs!7216 () Bool)

(assert (= bs!7216 d!53187))

(assert (=> bs!7216 m!202227))

(assert (=> bs!7216 m!202227))

(assert (=> bs!7216 m!202235))

(declare-fun m!203335 () Bool)

(assert (=> bs!7216 m!203335))

(declare-fun m!203337 () Bool)

(assert (=> bs!7216 m!203337))

(assert (=> b!173677 d!53187))

(declare-fun d!53189 () Bool)

(declare-fun e!115098 () Bool)

(assert (=> d!53189 e!115098))

(declare-fun res!82692 () Bool)

(assert (=> d!53189 (=> (not res!82692) (not e!115098))))

(declare-fun lt!86280 () ListLongMap!2135)

(assert (=> d!53189 (= res!82692 (contains!1149 lt!86280 (_1!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779)))))))

(declare-fun lt!86279 () List!2188)

(assert (=> d!53189 (= lt!86280 (ListLongMap!2136 lt!86279))))

(declare-fun lt!86278 () Unit!5315)

(declare-fun lt!86277 () Unit!5315)

(assert (=> d!53189 (= lt!86278 lt!86277)))

(assert (=> d!53189 (= (getValueByKey!186 lt!86279 (_1!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779)))))))

(assert (=> d!53189 (= lt!86277 (lemmaContainsTupThenGetReturnValue!99 lt!86279 (_1!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779))) (_2!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779)))))))

(assert (=> d!53189 (= lt!86279 (insertStrictlySorted!102 (toList!1083 lt!85995) (_1!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779))) (_2!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779)))))))

(assert (=> d!53189 (= (+!245 lt!85995 (tuple2!3203 lt!85993 (minValue!3440 lt!85779))) lt!86280)))

(declare-fun b!174307 () Bool)

(declare-fun res!82691 () Bool)

(assert (=> b!174307 (=> (not res!82691) (not e!115098))))

(assert (=> b!174307 (= res!82691 (= (getValueByKey!186 (toList!1083 lt!86280) (_1!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85993 (minValue!3440 lt!85779))))))))

(declare-fun b!174308 () Bool)

(assert (=> b!174308 (= e!115098 (contains!1151 (toList!1083 lt!86280) (tuple2!3203 lt!85993 (minValue!3440 lt!85779))))))

(assert (= (and d!53189 res!82692) b!174307))

(assert (= (and b!174307 res!82691) b!174308))

(declare-fun m!203339 () Bool)

(assert (=> d!53189 m!203339))

(declare-fun m!203341 () Bool)

(assert (=> d!53189 m!203341))

(declare-fun m!203343 () Bool)

(assert (=> d!53189 m!203343))

(declare-fun m!203345 () Bool)

(assert (=> d!53189 m!203345))

(declare-fun m!203347 () Bool)

(assert (=> b!174307 m!203347))

(declare-fun m!203349 () Bool)

(assert (=> b!174308 m!203349))

(assert (=> b!173677 d!53189))

(declare-fun d!53191 () Bool)

(assert (=> d!53191 (= (apply!130 (+!245 lt!85995 (tuple2!3203 lt!85993 (minValue!3440 lt!85779))) lt!85999) (apply!130 lt!85995 lt!85999))))

(declare-fun lt!86281 () Unit!5315)

(assert (=> d!53191 (= lt!86281 (choose!938 lt!85995 lt!85993 (minValue!3440 lt!85779) lt!85999))))

(declare-fun e!115099 () Bool)

(assert (=> d!53191 e!115099))

(declare-fun res!82693 () Bool)

(assert (=> d!53191 (=> (not res!82693) (not e!115099))))

(assert (=> d!53191 (= res!82693 (contains!1149 lt!85995 lt!85999))))

(assert (=> d!53191 (= (addApplyDifferent!106 lt!85995 lt!85993 (minValue!3440 lt!85779) lt!85999) lt!86281)))

(declare-fun b!174309 () Bool)

(assert (=> b!174309 (= e!115099 (not (= lt!85999 lt!85993)))))

(assert (= (and d!53191 res!82693) b!174309))

(assert (=> d!53191 m!202207))

(declare-fun m!203351 () Bool)

(assert (=> d!53191 m!203351))

(assert (=> d!53191 m!202207))

(assert (=> d!53191 m!202209))

(declare-fun m!203353 () Bool)

(assert (=> d!53191 m!203353))

(assert (=> d!53191 m!202217))

(assert (=> b!173677 d!53191))

(declare-fun d!53193 () Bool)

(assert (=> d!53193 (= (apply!130 (+!245 lt!85997 (tuple2!3203 lt!85986 (minValue!3440 lt!85779))) lt!86000) (apply!130 lt!85997 lt!86000))))

(declare-fun lt!86282 () Unit!5315)

(assert (=> d!53193 (= lt!86282 (choose!938 lt!85997 lt!85986 (minValue!3440 lt!85779) lt!86000))))

(declare-fun e!115100 () Bool)

(assert (=> d!53193 e!115100))

(declare-fun res!82694 () Bool)

(assert (=> d!53193 (=> (not res!82694) (not e!115100))))

(assert (=> d!53193 (= res!82694 (contains!1149 lt!85997 lt!86000))))

(assert (=> d!53193 (= (addApplyDifferent!106 lt!85997 lt!85986 (minValue!3440 lt!85779) lt!86000) lt!86282)))

(declare-fun b!174310 () Bool)

(assert (=> b!174310 (= e!115100 (not (= lt!86000 lt!85986)))))

(assert (= (and d!53193 res!82694) b!174310))

(assert (=> d!53193 m!202221))

(declare-fun m!203355 () Bool)

(assert (=> d!53193 m!203355))

(assert (=> d!53193 m!202221))

(assert (=> d!53193 m!202229))

(declare-fun m!203357 () Bool)

(assert (=> d!53193 m!203357))

(assert (=> d!53193 m!202223))

(assert (=> b!173677 d!53193))

(declare-fun d!53195 () Bool)

(assert (=> d!53195 (= (apply!130 (+!245 lt!85985 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))) lt!85984) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85985 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779)))) lt!85984)))))

(declare-fun bs!7217 () Bool)

(assert (= bs!7217 d!53195))

(declare-fun m!203359 () Bool)

(assert (=> bs!7217 m!203359))

(assert (=> bs!7217 m!203359))

(declare-fun m!203361 () Bool)

(assert (=> bs!7217 m!203361))

(assert (=> b!173677 d!53195))

(declare-fun d!53197 () Bool)

(assert (=> d!53197 (= (apply!130 lt!85985 lt!85984) (get!1975 (getValueByKey!186 (toList!1083 lt!85985) lt!85984)))))

(declare-fun bs!7218 () Bool)

(assert (= bs!7218 d!53197))

(declare-fun m!203363 () Bool)

(assert (=> bs!7218 m!203363))

(assert (=> bs!7218 m!203363))

(declare-fun m!203365 () Bool)

(assert (=> bs!7218 m!203365))

(assert (=> b!173677 d!53197))

(declare-fun d!53199 () Bool)

(assert (=> d!53199 (= (apply!130 (+!245 lt!85995 (tuple2!3203 lt!85993 (minValue!3440 lt!85779))) lt!85999) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85995 (tuple2!3203 lt!85993 (minValue!3440 lt!85779)))) lt!85999)))))

(declare-fun bs!7219 () Bool)

(assert (= bs!7219 d!53199))

(declare-fun m!203367 () Bool)

(assert (=> bs!7219 m!203367))

(assert (=> bs!7219 m!203367))

(declare-fun m!203369 () Bool)

(assert (=> bs!7219 m!203369))

(assert (=> b!173677 d!53199))

(declare-fun d!53201 () Bool)

(declare-fun e!115101 () Bool)

(assert (=> d!53201 e!115101))

(declare-fun res!82696 () Bool)

(assert (=> d!53201 (=> (not res!82696) (not e!115101))))

(declare-fun lt!86286 () ListLongMap!2135)

(assert (=> d!53201 (= res!82696 (contains!1149 lt!86286 (_1!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779)))))))

(declare-fun lt!86285 () List!2188)

(assert (=> d!53201 (= lt!86286 (ListLongMap!2136 lt!86285))))

(declare-fun lt!86284 () Unit!5315)

(declare-fun lt!86283 () Unit!5315)

(assert (=> d!53201 (= lt!86284 lt!86283)))

(assert (=> d!53201 (= (getValueByKey!186 lt!86285 (_1!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779)))))))

(assert (=> d!53201 (= lt!86283 (lemmaContainsTupThenGetReturnValue!99 lt!86285 (_1!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779))) (_2!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779)))))))

(assert (=> d!53201 (= lt!86285 (insertStrictlySorted!102 (toList!1083 lt!85997) (_1!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779))) (_2!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779)))))))

(assert (=> d!53201 (= (+!245 lt!85997 (tuple2!3203 lt!85986 (minValue!3440 lt!85779))) lt!86286)))

(declare-fun b!174311 () Bool)

(declare-fun res!82695 () Bool)

(assert (=> b!174311 (=> (not res!82695) (not e!115101))))

(assert (=> b!174311 (= res!82695 (= (getValueByKey!186 (toList!1083 lt!86286) (_1!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85986 (minValue!3440 lt!85779))))))))

(declare-fun b!174312 () Bool)

(assert (=> b!174312 (= e!115101 (contains!1151 (toList!1083 lt!86286) (tuple2!3203 lt!85986 (minValue!3440 lt!85779))))))

(assert (= (and d!53201 res!82696) b!174311))

(assert (= (and b!174311 res!82695) b!174312))

(declare-fun m!203371 () Bool)

(assert (=> d!53201 m!203371))

(declare-fun m!203373 () Bool)

(assert (=> d!53201 m!203373))

(declare-fun m!203375 () Bool)

(assert (=> d!53201 m!203375))

(declare-fun m!203377 () Bool)

(assert (=> d!53201 m!203377))

(declare-fun m!203379 () Bool)

(assert (=> b!174311 m!203379))

(declare-fun m!203381 () Bool)

(assert (=> b!174312 m!203381))

(assert (=> b!173677 d!53201))

(declare-fun d!53203 () Bool)

(assert (=> d!53203 (= (apply!130 (+!245 lt!85997 (tuple2!3203 lt!85986 (minValue!3440 lt!85779))) lt!86000) (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85997 (tuple2!3203 lt!85986 (minValue!3440 lt!85779)))) lt!86000)))))

(declare-fun bs!7220 () Bool)

(assert (= bs!7220 d!53203))

(declare-fun m!203383 () Bool)

(assert (=> bs!7220 m!203383))

(assert (=> bs!7220 m!203383))

(declare-fun m!203385 () Bool)

(assert (=> bs!7220 m!203385))

(assert (=> b!173677 d!53203))

(declare-fun d!53205 () Bool)

(declare-fun e!115102 () Bool)

(assert (=> d!53205 e!115102))

(declare-fun res!82698 () Bool)

(assert (=> d!53205 (=> (not res!82698) (not e!115102))))

(declare-fun lt!86290 () ListLongMap!2135)

(assert (=> d!53205 (= res!82698 (contains!1149 lt!86290 (_1!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779)))))))

(declare-fun lt!86289 () List!2188)

(assert (=> d!53205 (= lt!86290 (ListLongMap!2136 lt!86289))))

(declare-fun lt!86288 () Unit!5315)

(declare-fun lt!86287 () Unit!5315)

(assert (=> d!53205 (= lt!86288 lt!86287)))

(assert (=> d!53205 (= (getValueByKey!186 lt!86289 (_1!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779)))))))

(assert (=> d!53205 (= lt!86287 (lemmaContainsTupThenGetReturnValue!99 lt!86289 (_1!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))) (_2!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779)))))))

(assert (=> d!53205 (= lt!86289 (insertStrictlySorted!102 (toList!1083 lt!85985) (_1!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))) (_2!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779)))))))

(assert (=> d!53205 (= (+!245 lt!85985 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))) lt!86290)))

(declare-fun b!174313 () Bool)

(declare-fun res!82697 () Bool)

(assert (=> b!174313 (=> (not res!82697) (not e!115102))))

(assert (=> b!174313 (= res!82697 (= (getValueByKey!186 (toList!1083 lt!86290) (_1!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))))))))

(declare-fun b!174314 () Bool)

(assert (=> b!174314 (= e!115102 (contains!1151 (toList!1083 lt!86290) (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))))))

(assert (= (and d!53205 res!82698) b!174313))

(assert (= (and b!174313 res!82697) b!174314))

(declare-fun m!203387 () Bool)

(assert (=> d!53205 m!203387))

(declare-fun m!203389 () Bool)

(assert (=> d!53205 m!203389))

(declare-fun m!203391 () Bool)

(assert (=> d!53205 m!203391))

(declare-fun m!203393 () Bool)

(assert (=> d!53205 m!203393))

(declare-fun m!203395 () Bool)

(assert (=> b!174313 m!203395))

(declare-fun m!203397 () Bool)

(assert (=> b!174314 m!203397))

(assert (=> b!173677 d!53205))

(declare-fun b!174315 () Bool)

(declare-fun e!115104 () ListLongMap!2135)

(assert (=> b!174315 (= e!115104 (ListLongMap!2136 Nil!2185))))

(declare-fun b!174316 () Bool)

(declare-fun e!115109 () ListLongMap!2135)

(declare-fun call!17650 () ListLongMap!2135)

(assert (=> b!174316 (= e!115109 call!17650)))

(declare-fun b!174317 () Bool)

(declare-fun lt!86292 () Unit!5315)

(declare-fun lt!86295 () Unit!5315)

(assert (=> b!174317 (= lt!86292 lt!86295)))

(declare-fun lt!86297 () (_ BitVec 64))

(declare-fun lt!86293 () V!5089)

(declare-fun lt!86294 () ListLongMap!2135)

(declare-fun lt!86296 () (_ BitVec 64))

(assert (=> b!174317 (not (contains!1149 (+!245 lt!86294 (tuple2!3203 lt!86296 lt!86293)) lt!86297))))

(assert (=> b!174317 (= lt!86295 (addStillNotContains!74 lt!86294 lt!86296 lt!86293 lt!86297))))

(assert (=> b!174317 (= lt!86297 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!174317 (= lt!86293 (get!1974 (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 lt!85779) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!174317 (= lt!86296 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))

(assert (=> b!174317 (= lt!86294 call!17650)))

(assert (=> b!174317 (= e!115109 (+!245 call!17650 (tuple2!3203 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 lt!85779) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!174318 () Bool)

(assert (=> b!174318 (= e!115104 e!115109)))

(declare-fun c!31188 () Bool)

(assert (=> b!174318 (= c!31188 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!174319 () Bool)

(declare-fun e!115106 () Bool)

(declare-fun e!115108 () Bool)

(assert (=> b!174319 (= e!115106 e!115108)))

(declare-fun c!31187 () Bool)

(declare-fun e!115105 () Bool)

(assert (=> b!174319 (= c!31187 e!115105)))

(declare-fun res!82701 () Bool)

(assert (=> b!174319 (=> (not res!82701) (not e!115105))))

(assert (=> b!174319 (= res!82701 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(declare-fun b!174320 () Bool)

(declare-fun res!82699 () Bool)

(assert (=> b!174320 (=> (not res!82699) (not e!115106))))

(declare-fun lt!86291 () ListLongMap!2135)

(assert (=> b!174320 (= res!82699 (not (contains!1149 lt!86291 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174321 () Bool)

(assert (=> b!174321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(assert (=> b!174321 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3758 (_values!3580 lt!85779))))))

(declare-fun e!115103 () Bool)

(assert (=> b!174321 (= e!115103 (= (apply!130 lt!86291 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)) (get!1974 (select (arr!3459 (_values!3580 lt!85779)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 lt!85779) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!17647 () Bool)

(assert (=> bm!17647 (= call!17650 (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 lt!85779)))))

(declare-fun b!174322 () Bool)

(declare-fun e!115107 () Bool)

(assert (=> b!174322 (= e!115107 (= lt!86291 (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3597 lt!85779))))))

(declare-fun b!174323 () Bool)

(assert (=> b!174323 (= e!115108 e!115103)))

(assert (=> b!174323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(declare-fun res!82700 () Bool)

(assert (=> b!174323 (= res!82700 (contains!1149 lt!86291 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (=> b!174323 (=> (not res!82700) (not e!115103))))

(declare-fun b!174324 () Bool)

(assert (=> b!174324 (= e!115105 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (=> b!174324 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!174325 () Bool)

(assert (=> b!174325 (= e!115108 e!115107)))

(declare-fun c!31189 () Bool)

(assert (=> b!174325 (= c!31189 (bvslt #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(declare-fun d!53207 () Bool)

(assert (=> d!53207 e!115106))

(declare-fun res!82702 () Bool)

(assert (=> d!53207 (=> (not res!82702) (not e!115106))))

(assert (=> d!53207 (= res!82702 (not (contains!1149 lt!86291 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53207 (= lt!86291 e!115104)))

(declare-fun c!31186 () Bool)

(assert (=> d!53207 (= c!31186 (bvsge #b00000000000000000000000000000000 (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!53207 (validMask!0 (mask!8469 lt!85779))))

(assert (=> d!53207 (= (getCurrentListMapNoExtraKeys!161 (_keys!5438 lt!85779) (_values!3580 lt!85779) (mask!8469 lt!85779) (extraKeys!3336 lt!85779) (zeroValue!3438 lt!85779) (minValue!3440 lt!85779) #b00000000000000000000000000000000 (defaultEntry!3597 lt!85779)) lt!86291)))

(declare-fun b!174326 () Bool)

(assert (=> b!174326 (= e!115107 (isEmpty!443 lt!86291))))

(assert (= (and d!53207 c!31186) b!174315))

(assert (= (and d!53207 (not c!31186)) b!174318))

(assert (= (and b!174318 c!31188) b!174317))

(assert (= (and b!174318 (not c!31188)) b!174316))

(assert (= (or b!174317 b!174316) bm!17647))

(assert (= (and d!53207 res!82702) b!174320))

(assert (= (and b!174320 res!82699) b!174319))

(assert (= (and b!174319 res!82701) b!174324))

(assert (= (and b!174319 c!31187) b!174323))

(assert (= (and b!174319 (not c!31187)) b!174325))

(assert (= (and b!174323 res!82700) b!174321))

(assert (= (and b!174325 c!31189) b!174322))

(assert (= (and b!174325 (not c!31189)) b!174326))

(declare-fun b_lambda!6991 () Bool)

(assert (=> (not b_lambda!6991) (not b!174317)))

(assert (=> b!174317 t!6994))

(declare-fun b_and!10791 () Bool)

(assert (= b_and!10789 (and (=> t!6994 result!4583) b_and!10791)))

(declare-fun b_lambda!6993 () Bool)

(assert (=> (not b_lambda!6993) (not b!174321)))

(assert (=> b!174321 t!6994))

(declare-fun b_and!10793 () Bool)

(assert (= b_and!10791 (and (=> t!6994 result!4583) b_and!10793)))

(assert (=> b!174323 m!202083))

(assert (=> b!174323 m!202083))

(declare-fun m!203399 () Bool)

(assert (=> b!174323 m!203399))

(assert (=> b!174321 m!202083))

(assert (=> b!174321 m!202083))

(declare-fun m!203401 () Bool)

(assert (=> b!174321 m!203401))

(assert (=> b!174321 m!202197))

(assert (=> b!174321 m!202195))

(assert (=> b!174321 m!202195))

(assert (=> b!174321 m!202197))

(assert (=> b!174321 m!202199))

(assert (=> b!174324 m!202083))

(assert (=> b!174324 m!202083))

(assert (=> b!174324 m!202085))

(declare-fun m!203403 () Bool)

(assert (=> b!174326 m!203403))

(declare-fun m!203405 () Bool)

(assert (=> bm!17647 m!203405))

(declare-fun m!203407 () Bool)

(assert (=> d!53207 m!203407))

(assert (=> d!53207 m!202133))

(declare-fun m!203409 () Bool)

(assert (=> b!174320 m!203409))

(declare-fun m!203411 () Bool)

(assert (=> b!174317 m!203411))

(assert (=> b!174317 m!202083))

(declare-fun m!203413 () Bool)

(assert (=> b!174317 m!203413))

(assert (=> b!174317 m!203413))

(declare-fun m!203415 () Bool)

(assert (=> b!174317 m!203415))

(declare-fun m!203417 () Bool)

(assert (=> b!174317 m!203417))

(assert (=> b!174317 m!202197))

(assert (=> b!174317 m!202195))

(assert (=> b!174317 m!202195))

(assert (=> b!174317 m!202197))

(assert (=> b!174317 m!202199))

(assert (=> b!174322 m!203405))

(assert (=> b!174318 m!202083))

(assert (=> b!174318 m!202083))

(assert (=> b!174318 m!202085))

(assert (=> b!173677 d!53207))

(declare-fun d!53209 () Bool)

(assert (=> d!53209 (= (apply!130 (+!245 lt!85985 (tuple2!3203 lt!85990 (zeroValue!3438 lt!85779))) lt!85984) (apply!130 lt!85985 lt!85984))))

(declare-fun lt!86298 () Unit!5315)

(assert (=> d!53209 (= lt!86298 (choose!938 lt!85985 lt!85990 (zeroValue!3438 lt!85779) lt!85984))))

(declare-fun e!115110 () Bool)

(assert (=> d!53209 e!115110))

(declare-fun res!82703 () Bool)

(assert (=> d!53209 (=> (not res!82703) (not e!115110))))

(assert (=> d!53209 (= res!82703 (contains!1149 lt!85985 lt!85984))))

(assert (=> d!53209 (= (addApplyDifferent!106 lt!85985 lt!85990 (zeroValue!3438 lt!85779) lt!85984) lt!86298)))

(declare-fun b!174327 () Bool)

(assert (=> b!174327 (= e!115110 (not (= lt!85984 lt!85990)))))

(assert (= (and d!53209 res!82703) b!174327))

(assert (=> d!53209 m!202211))

(declare-fun m!203419 () Bool)

(assert (=> d!53209 m!203419))

(assert (=> d!53209 m!202211))

(assert (=> d!53209 m!202213))

(declare-fun m!203421 () Bool)

(assert (=> d!53209 m!203421))

(assert (=> d!53209 m!202219))

(assert (=> b!173677 d!53209))

(declare-fun d!53211 () Bool)

(assert (=> d!53211 (= (apply!130 lt!85995 lt!85999) (get!1975 (getValueByKey!186 (toList!1083 lt!85995) lt!85999)))))

(declare-fun bs!7221 () Bool)

(assert (= bs!7221 d!53211))

(declare-fun m!203423 () Bool)

(assert (=> bs!7221 m!203423))

(assert (=> bs!7221 m!203423))

(declare-fun m!203425 () Bool)

(assert (=> bs!7221 m!203425))

(assert (=> b!173677 d!53211))

(declare-fun d!53213 () Bool)

(declare-fun e!115112 () Bool)

(assert (=> d!53213 e!115112))

(declare-fun res!82704 () Bool)

(assert (=> d!53213 (=> res!82704 e!115112)))

(declare-fun lt!86301 () Bool)

(assert (=> d!53213 (= res!82704 (not lt!86301))))

(declare-fun lt!86300 () Bool)

(assert (=> d!53213 (= lt!86301 lt!86300)))

(declare-fun lt!86302 () Unit!5315)

(declare-fun e!115111 () Unit!5315)

(assert (=> d!53213 (= lt!86302 e!115111)))

(declare-fun c!31190 () Bool)

(assert (=> d!53213 (= c!31190 lt!86300)))

(assert (=> d!53213 (= lt!86300 (containsKey!189 (toList!1083 (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))) lt!85996))))

(assert (=> d!53213 (= (contains!1149 (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))) lt!85996) lt!86301)))

(declare-fun b!174328 () Bool)

(declare-fun lt!86299 () Unit!5315)

(assert (=> b!174328 (= e!115111 lt!86299)))

(assert (=> b!174328 (= lt!86299 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))) lt!85996))))

(assert (=> b!174328 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))) lt!85996))))

(declare-fun b!174329 () Bool)

(declare-fun Unit!5354 () Unit!5315)

(assert (=> b!174329 (= e!115111 Unit!5354)))

(declare-fun b!174330 () Bool)

(assert (=> b!174330 (= e!115112 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))) lt!85996)))))

(assert (= (and d!53213 c!31190) b!174328))

(assert (= (and d!53213 (not c!31190)) b!174329))

(assert (= (and d!53213 (not res!82704)) b!174330))

(declare-fun m!203427 () Bool)

(assert (=> d!53213 m!203427))

(declare-fun m!203429 () Bool)

(assert (=> b!174328 m!203429))

(declare-fun m!203431 () Bool)

(assert (=> b!174328 m!203431))

(assert (=> b!174328 m!203431))

(declare-fun m!203433 () Bool)

(assert (=> b!174328 m!203433))

(assert (=> b!174330 m!203431))

(assert (=> b!174330 m!203431))

(assert (=> b!174330 m!203433))

(assert (=> b!173677 d!53213))

(declare-fun d!53215 () Bool)

(assert (=> d!53215 (= (apply!130 lt!85997 lt!86000) (get!1975 (getValueByKey!186 (toList!1083 lt!85997) lt!86000)))))

(declare-fun bs!7222 () Bool)

(assert (= bs!7222 d!53215))

(declare-fun m!203435 () Bool)

(assert (=> bs!7222 m!203435))

(assert (=> bs!7222 m!203435))

(declare-fun m!203437 () Bool)

(assert (=> bs!7222 m!203437))

(assert (=> b!173677 d!53215))

(declare-fun d!53217 () Bool)

(declare-fun e!115113 () Bool)

(assert (=> d!53217 e!115113))

(declare-fun res!82706 () Bool)

(assert (=> d!53217 (=> (not res!82706) (not e!115113))))

(declare-fun lt!86306 () ListLongMap!2135)

(assert (=> d!53217 (= res!82706 (contains!1149 lt!86306 (_1!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))))))

(declare-fun lt!86305 () List!2188)

(assert (=> d!53217 (= lt!86306 (ListLongMap!2136 lt!86305))))

(declare-fun lt!86304 () Unit!5315)

(declare-fun lt!86303 () Unit!5315)

(assert (=> d!53217 (= lt!86304 lt!86303)))

(assert (=> d!53217 (= (getValueByKey!186 lt!86305 (_1!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))))))

(assert (=> d!53217 (= lt!86303 (lemmaContainsTupThenGetReturnValue!99 lt!86305 (_1!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))) (_2!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))))))

(assert (=> d!53217 (= lt!86305 (insertStrictlySorted!102 (toList!1083 lt!85982) (_1!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))) (_2!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))))))

(assert (=> d!53217 (= (+!245 lt!85982 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))) lt!86306)))

(declare-fun b!174331 () Bool)

(declare-fun res!82705 () Bool)

(assert (=> b!174331 (=> (not res!82705) (not e!115113))))

(assert (=> b!174331 (= res!82705 (= (getValueByKey!186 (toList!1083 lt!86306) (_1!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779)))) (Some!191 (_2!1612 (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))))))))

(declare-fun b!174332 () Bool)

(assert (=> b!174332 (= e!115113 (contains!1151 (toList!1083 lt!86306) (tuple2!3203 lt!85992 (zeroValue!3438 lt!85779))))))

(assert (= (and d!53217 res!82706) b!174331))

(assert (= (and b!174331 res!82705) b!174332))

(declare-fun m!203439 () Bool)

(assert (=> d!53217 m!203439))

(declare-fun m!203441 () Bool)

(assert (=> d!53217 m!203441))

(declare-fun m!203443 () Bool)

(assert (=> d!53217 m!203443))

(declare-fun m!203445 () Bool)

(assert (=> d!53217 m!203445))

(declare-fun m!203447 () Bool)

(assert (=> b!174331 m!203447))

(declare-fun m!203449 () Bool)

(assert (=> b!174332 m!203449))

(assert (=> b!173677 d!53217))

(assert (=> bm!17593 d!53207))

(assert (=> d!52817 d!52801))

(assert (=> d!52817 d!52825))

(declare-fun d!53219 () Bool)

(declare-fun e!115115 () Bool)

(assert (=> d!53219 e!115115))

(declare-fun res!82707 () Bool)

(assert (=> d!53219 (=> res!82707 e!115115)))

(declare-fun lt!86309 () Bool)

(assert (=> d!53219 (= res!82707 (not lt!86309))))

(declare-fun lt!86308 () Bool)

(assert (=> d!53219 (= lt!86309 lt!86308)))

(declare-fun lt!86310 () Unit!5315)

(declare-fun e!115114 () Unit!5315)

(assert (=> d!53219 (= lt!86310 e!115114)))

(declare-fun c!31191 () Bool)

(assert (=> d!53219 (= c!31191 lt!86308)))

(assert (=> d!53219 (= lt!86308 (containsKey!189 (toList!1083 lt!85894) lt!85897))))

(assert (=> d!53219 (= (contains!1149 lt!85894 lt!85897) lt!86309)))

(declare-fun b!174333 () Bool)

(declare-fun lt!86307 () Unit!5315)

(assert (=> b!174333 (= e!115114 lt!86307)))

(assert (=> b!174333 (= lt!86307 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85894) lt!85897))))

(assert (=> b!174333 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85894) lt!85897))))

(declare-fun b!174334 () Bool)

(declare-fun Unit!5355 () Unit!5315)

(assert (=> b!174334 (= e!115114 Unit!5355)))

(declare-fun b!174335 () Bool)

(assert (=> b!174335 (= e!115115 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85894) lt!85897)))))

(assert (= (and d!53219 c!31191) b!174333))

(assert (= (and d!53219 (not c!31191)) b!174334))

(assert (= (and d!53219 (not res!82707)) b!174335))

(declare-fun m!203451 () Bool)

(assert (=> d!53219 m!203451))

(declare-fun m!203453 () Bool)

(assert (=> b!174333 m!203453))

(assert (=> b!174333 m!202541))

(assert (=> b!174333 m!202541))

(declare-fun m!203455 () Bool)

(assert (=> b!174333 m!203455))

(assert (=> b!174335 m!202541))

(assert (=> b!174335 m!202541))

(assert (=> b!174335 m!203455))

(assert (=> d!52817 d!53219))

(declare-fun d!53221 () Bool)

(assert (=> d!53221 (= (apply!130 (+!245 lt!85894 (tuple2!3203 lt!85883 v!309)) lt!85897) (apply!130 lt!85894 lt!85897))))

(assert (=> d!53221 true))

(declare-fun _$34!1058 () Unit!5315)

(assert (=> d!53221 (= (choose!938 lt!85894 lt!85883 v!309 lt!85897) _$34!1058)))

(declare-fun bs!7223 () Bool)

(assert (= bs!7223 d!53221))

(assert (=> bs!7223 m!202001))

(assert (=> bs!7223 m!202001))

(assert (=> bs!7223 m!202009))

(assert (=> bs!7223 m!202003))

(assert (=> d!52817 d!53221))

(assert (=> d!52817 d!52829))

(declare-fun d!53223 () Bool)

(assert (=> d!53223 (arrayContainsKey!0 (_keys!5438 thiss!1248) lt!86054 #b00000000000000000000000000000000)))

(declare-fun lt!86311 () Unit!5315)

(assert (=> d!53223 (= lt!86311 (choose!13 (_keys!5438 thiss!1248) lt!86054 #b00000000000000000000000000000000))))

(assert (=> d!53223 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!53223 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5438 thiss!1248) lt!86054 #b00000000000000000000000000000000) lt!86311)))

(declare-fun bs!7224 () Bool)

(assert (= bs!7224 d!53223))

(assert (=> bs!7224 m!202417))

(declare-fun m!203457 () Bool)

(assert (=> bs!7224 m!203457))

(assert (=> b!173747 d!53223))

(declare-fun d!53225 () Bool)

(declare-fun res!82708 () Bool)

(declare-fun e!115116 () Bool)

(assert (=> d!53225 (=> res!82708 e!115116)))

(assert (=> d!53225 (= res!82708 (= (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) lt!86054))))

(assert (=> d!53225 (= (arrayContainsKey!0 (_keys!5438 thiss!1248) lt!86054 #b00000000000000000000000000000000) e!115116)))

(declare-fun b!174336 () Bool)

(declare-fun e!115117 () Bool)

(assert (=> b!174336 (= e!115116 e!115117)))

(declare-fun res!82709 () Bool)

(assert (=> b!174336 (=> (not res!82709) (not e!115117))))

(assert (=> b!174336 (= res!82709 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 thiss!1248))))))

(declare-fun b!174337 () Bool)

(assert (=> b!174337 (= e!115117 (arrayContainsKey!0 (_keys!5438 thiss!1248) lt!86054 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!53225 (not res!82708)) b!174336))

(assert (= (and b!174336 res!82709) b!174337))

(assert (=> d!53225 m!201909))

(declare-fun m!203459 () Bool)

(assert (=> b!174337 m!203459))

(assert (=> b!173747 d!53225))

(declare-fun b!174338 () Bool)

(declare-fun e!115119 () SeekEntryResult!536)

(assert (=> b!174338 (= e!115119 Undefined!536)))

(declare-fun b!174339 () Bool)

(declare-fun e!115118 () SeekEntryResult!536)

(declare-fun lt!86312 () SeekEntryResult!536)

(assert (=> b!174339 (= e!115118 (Found!536 (index!4314 lt!86312)))))

(declare-fun b!174341 () Bool)

(declare-fun c!31194 () Bool)

(declare-fun lt!86313 () (_ BitVec 64))

(assert (=> b!174341 (= c!31194 (= lt!86313 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115120 () SeekEntryResult!536)

(assert (=> b!174341 (= e!115118 e!115120)))

(declare-fun b!174342 () Bool)

(assert (=> b!174342 (= e!115119 e!115118)))

(assert (=> b!174342 (= lt!86313 (select (arr!3458 (_keys!5438 thiss!1248)) (index!4314 lt!86312)))))

(declare-fun c!31192 () Bool)

(assert (=> b!174342 (= c!31192 (= lt!86313 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174343 () Bool)

(assert (=> b!174343 (= e!115120 (seekKeyOrZeroReturnVacant!0 (x!19190 lt!86312) (index!4314 lt!86312) (index!4314 lt!86312) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)))))

(declare-fun d!53227 () Bool)

(declare-fun lt!86314 () SeekEntryResult!536)

(assert (=> d!53227 (and (or ((_ is Undefined!536) lt!86314) (not ((_ is Found!536) lt!86314)) (and (bvsge (index!4313 lt!86314) #b00000000000000000000000000000000) (bvslt (index!4313 lt!86314) (size!3757 (_keys!5438 thiss!1248))))) (or ((_ is Undefined!536) lt!86314) ((_ is Found!536) lt!86314) (not ((_ is MissingZero!536) lt!86314)) (and (bvsge (index!4312 lt!86314) #b00000000000000000000000000000000) (bvslt (index!4312 lt!86314) (size!3757 (_keys!5438 thiss!1248))))) (or ((_ is Undefined!536) lt!86314) ((_ is Found!536) lt!86314) ((_ is MissingZero!536) lt!86314) (not ((_ is MissingVacant!536) lt!86314)) (and (bvsge (index!4315 lt!86314) #b00000000000000000000000000000000) (bvslt (index!4315 lt!86314) (size!3757 (_keys!5438 thiss!1248))))) (or ((_ is Undefined!536) lt!86314) (ite ((_ is Found!536) lt!86314) (= (select (arr!3458 (_keys!5438 thiss!1248)) (index!4313 lt!86314)) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!536) lt!86314) (= (select (arr!3458 (_keys!5438 thiss!1248)) (index!4312 lt!86314)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!536) lt!86314) (= (select (arr!3458 (_keys!5438 thiss!1248)) (index!4315 lt!86314)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53227 (= lt!86314 e!115119)))

(declare-fun c!31193 () Bool)

(assert (=> d!53227 (= c!31193 (and ((_ is Intermediate!536) lt!86312) (undefined!1348 lt!86312)))))

(assert (=> d!53227 (= lt!86312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (mask!8469 thiss!1248)) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)))))

(assert (=> d!53227 (validMask!0 (mask!8469 thiss!1248))))

(assert (=> d!53227 (= (seekEntryOrOpen!0 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (_keys!5438 thiss!1248) (mask!8469 thiss!1248)) lt!86314)))

(declare-fun b!174340 () Bool)

(assert (=> b!174340 (= e!115120 (MissingZero!536 (index!4314 lt!86312)))))

(assert (= (and d!53227 c!31193) b!174338))

(assert (= (and d!53227 (not c!31193)) b!174342))

(assert (= (and b!174342 c!31192) b!174339))

(assert (= (and b!174342 (not c!31192)) b!174341))

(assert (= (and b!174341 c!31194) b!174340))

(assert (= (and b!174341 (not c!31194)) b!174343))

(declare-fun m!203461 () Bool)

(assert (=> b!174342 m!203461))

(assert (=> b!174343 m!201909))

(declare-fun m!203463 () Bool)

(assert (=> b!174343 m!203463))

(declare-fun m!203465 () Bool)

(assert (=> d!53227 m!203465))

(declare-fun m!203467 () Bool)

(assert (=> d!53227 m!203467))

(assert (=> d!53227 m!201909))

(declare-fun m!203469 () Bool)

(assert (=> d!53227 m!203469))

(assert (=> d!53227 m!201909))

(assert (=> d!53227 m!203467))

(assert (=> d!53227 m!201893))

(declare-fun m!203471 () Bool)

(assert (=> d!53227 m!203471))

(declare-fun m!203473 () Bool)

(assert (=> d!53227 m!203473))

(assert (=> b!173747 d!53227))

(assert (=> bm!17604 d!53093))

(assert (=> b!173556 d!52789))

(declare-fun b!174344 () Bool)

(declare-fun e!115121 () (_ BitVec 32))

(assert (=> b!174344 (= e!115121 #b00000000000000000000000000000000)))

(declare-fun b!174345 () Bool)

(declare-fun e!115122 () (_ BitVec 32))

(declare-fun call!17651 () (_ BitVec 32))

(assert (=> b!174345 (= e!115122 call!17651)))

(declare-fun b!174346 () Bool)

(assert (=> b!174346 (= e!115122 (bvadd #b00000000000000000000000000000001 call!17651))))

(declare-fun d!53229 () Bool)

(declare-fun lt!86315 () (_ BitVec 32))

(assert (=> d!53229 (and (bvsge lt!86315 #b00000000000000000000000000000000) (bvsle lt!86315 (bvsub (size!3757 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!53229 (= lt!86315 e!115121)))

(declare-fun c!31195 () Bool)

(assert (=> d!53229 (= c!31195 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!53229 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!3757 (_keys!5438 lt!85779)) (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!53229 (= (arrayCountValidKeys!0 (_keys!5438 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))) lt!86315)))

(declare-fun bm!17648 () Bool)

(assert (=> bm!17648 (= call!17651 (arrayCountValidKeys!0 (_keys!5438 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))))))

(declare-fun b!174347 () Bool)

(assert (=> b!174347 (= e!115121 e!115122)))

(declare-fun c!31196 () Bool)

(assert (=> b!174347 (= c!31196 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!53229 c!31195) b!174344))

(assert (= (and d!53229 (not c!31195)) b!174347))

(assert (= (and b!174347 c!31196) b!174346))

(assert (= (and b!174347 (not c!31196)) b!174345))

(assert (= (or b!174346 b!174345) bm!17648))

(declare-fun m!203475 () Bool)

(assert (=> bm!17648 m!203475))

(declare-fun m!203477 () Bool)

(assert (=> b!174347 m!203477))

(assert (=> b!174347 m!203477))

(declare-fun m!203479 () Bool)

(assert (=> b!174347 m!203479))

(assert (=> bm!17588 d!53229))

(declare-fun b!174350 () Bool)

(declare-fun e!115124 () Option!192)

(assert (=> b!174350 (= e!115124 (getValueByKey!186 (t!6987 (t!6987 (toList!1083 lt!85777))) key!828))))

(declare-fun b!174349 () Bool)

(declare-fun e!115123 () Option!192)

(assert (=> b!174349 (= e!115123 e!115124)))

(declare-fun c!31198 () Bool)

(assert (=> b!174349 (= c!31198 (and ((_ is Cons!2184) (t!6987 (toList!1083 lt!85777))) (not (= (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85777)))) key!828))))))

(declare-fun b!174348 () Bool)

(assert (=> b!174348 (= e!115123 (Some!191 (_2!1612 (h!2801 (t!6987 (toList!1083 lt!85777))))))))

(declare-fun b!174351 () Bool)

(assert (=> b!174351 (= e!115124 None!190)))

(declare-fun d!53231 () Bool)

(declare-fun c!31197 () Bool)

(assert (=> d!53231 (= c!31197 (and ((_ is Cons!2184) (t!6987 (toList!1083 lt!85777))) (= (_1!1612 (h!2801 (t!6987 (toList!1083 lt!85777)))) key!828)))))

(assert (=> d!53231 (= (getValueByKey!186 (t!6987 (toList!1083 lt!85777)) key!828) e!115123)))

(assert (= (and d!53231 c!31197) b!174348))

(assert (= (and d!53231 (not c!31197)) b!174349))

(assert (= (and b!174349 c!31198) b!174350))

(assert (= (and b!174349 (not c!31198)) b!174351))

(declare-fun m!203481 () Bool)

(assert (=> b!174350 m!203481))

(assert (=> b!173559 d!53231))

(assert (=> d!52809 d!52827))

(assert (=> d!52809 d!52811))

(declare-fun d!53233 () Bool)

(declare-fun e!115126 () Bool)

(assert (=> d!53233 e!115126))

(declare-fun res!82710 () Bool)

(assert (=> d!53233 (=> res!82710 e!115126)))

(declare-fun lt!86318 () Bool)

(assert (=> d!53233 (= res!82710 (not lt!86318))))

(declare-fun lt!86317 () Bool)

(assert (=> d!53233 (= lt!86318 lt!86317)))

(declare-fun lt!86319 () Unit!5315)

(declare-fun e!115125 () Unit!5315)

(assert (=> d!53233 (= lt!86319 e!115125)))

(declare-fun c!31199 () Bool)

(assert (=> d!53233 (= c!31199 lt!86317)))

(assert (=> d!53233 (= lt!86317 (containsKey!189 (toList!1083 lt!85892) lt!85896))))

(assert (=> d!53233 (= (contains!1149 lt!85892 lt!85896) lt!86318)))

(declare-fun b!174352 () Bool)

(declare-fun lt!86316 () Unit!5315)

(assert (=> b!174352 (= e!115125 lt!86316)))

(assert (=> b!174352 (= lt!86316 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85892) lt!85896))))

(assert (=> b!174352 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85892) lt!85896))))

(declare-fun b!174353 () Bool)

(declare-fun Unit!5356 () Unit!5315)

(assert (=> b!174353 (= e!115125 Unit!5356)))

(declare-fun b!174354 () Bool)

(assert (=> b!174354 (= e!115126 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85892) lt!85896)))))

(assert (= (and d!53233 c!31199) b!174352))

(assert (= (and d!53233 (not c!31199)) b!174353))

(assert (= (and d!53233 (not res!82710)) b!174354))

(declare-fun m!203483 () Bool)

(assert (=> d!53233 m!203483))

(declare-fun m!203485 () Bool)

(assert (=> b!174352 m!203485))

(assert (=> b!174352 m!202465))

(assert (=> b!174352 m!202465))

(declare-fun m!203487 () Bool)

(assert (=> b!174352 m!203487))

(assert (=> b!174354 m!202465))

(assert (=> b!174354 m!202465))

(assert (=> b!174354 m!203487))

(assert (=> d!52809 d!53233))

(declare-fun d!53235 () Bool)

(assert (=> d!53235 (= (apply!130 (+!245 lt!85892 (tuple2!3203 lt!85890 v!309)) lt!85896) (apply!130 lt!85892 lt!85896))))

(assert (=> d!53235 true))

(declare-fun _$34!1059 () Unit!5315)

(assert (=> d!53235 (= (choose!938 lt!85892 lt!85890 v!309 lt!85896) _$34!1059)))

(declare-fun bs!7225 () Bool)

(assert (= bs!7225 d!53235))

(assert (=> bs!7225 m!201987))

(assert (=> bs!7225 m!201987))

(assert (=> bs!7225 m!201989))

(assert (=> bs!7225 m!201997))

(assert (=> d!52809 d!53235))

(assert (=> d!52809 d!52805))

(declare-fun d!53237 () Bool)

(declare-fun c!31200 () Bool)

(assert (=> d!53237 (= c!31200 ((_ is Nil!2185) (toList!1083 lt!85916)))))

(declare-fun e!115127 () (InoxSet tuple2!3202))

(assert (=> d!53237 (= (content!150 (toList!1083 lt!85916)) e!115127)))

(declare-fun b!174355 () Bool)

(assert (=> b!174355 (= e!115127 ((as const (Array tuple2!3202 Bool)) false))))

(declare-fun b!174356 () Bool)

(assert (=> b!174356 (= e!115127 ((_ map or) (store ((as const (Array tuple2!3202 Bool)) false) (h!2801 (toList!1083 lt!85916)) true) (content!150 (t!6987 (toList!1083 lt!85916)))))))

(assert (= (and d!53237 c!31200) b!174355))

(assert (= (and d!53237 (not c!31200)) b!174356))

(declare-fun m!203489 () Bool)

(assert (=> b!174356 m!203489))

(declare-fun m!203491 () Bool)

(assert (=> b!174356 m!203491))

(assert (=> d!52791 d!53237))

(assert (=> d!52759 d!52767))

(assert (=> d!52759 d!52763))

(declare-fun d!53239 () Bool)

(assert (=> d!53239 (contains!1149 (+!245 lt!85845 (tuple2!3203 lt!85855 (zeroValue!3438 thiss!1248))) lt!85859)))

(assert (=> d!53239 true))

(declare-fun _$35!413 () Unit!5315)

(assert (=> d!53239 (= (choose!939 lt!85845 lt!85855 (zeroValue!3438 thiss!1248) lt!85859) _$35!413)))

(declare-fun bs!7226 () Bool)

(assert (= bs!7226 d!53239))

(assert (=> bs!7226 m!201945))

(assert (=> bs!7226 m!201945))

(assert (=> bs!7226 m!201953))

(assert (=> d!52759 d!53239))

(declare-fun d!53241 () Bool)

(declare-fun e!115129 () Bool)

(assert (=> d!53241 e!115129))

(declare-fun res!82711 () Bool)

(assert (=> d!53241 (=> res!82711 e!115129)))

(declare-fun lt!86322 () Bool)

(assert (=> d!53241 (= res!82711 (not lt!86322))))

(declare-fun lt!86321 () Bool)

(assert (=> d!53241 (= lt!86322 lt!86321)))

(declare-fun lt!86323 () Unit!5315)

(declare-fun e!115128 () Unit!5315)

(assert (=> d!53241 (= lt!86323 e!115128)))

(declare-fun c!31201 () Bool)

(assert (=> d!53241 (= c!31201 lt!86321)))

(assert (=> d!53241 (= lt!86321 (containsKey!189 (toList!1083 lt!85845) lt!85859))))

(assert (=> d!53241 (= (contains!1149 lt!85845 lt!85859) lt!86322)))

(declare-fun b!174357 () Bool)

(declare-fun lt!86320 () Unit!5315)

(assert (=> b!174357 (= e!115128 lt!86320)))

(assert (=> b!174357 (= lt!86320 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85845) lt!85859))))

(assert (=> b!174357 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85845) lt!85859))))

(declare-fun b!174358 () Bool)

(declare-fun Unit!5357 () Unit!5315)

(assert (=> b!174358 (= e!115128 Unit!5357)))

(declare-fun b!174359 () Bool)

(assert (=> b!174359 (= e!115129 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85845) lt!85859)))))

(assert (= (and d!53241 c!31201) b!174357))

(assert (= (and d!53241 (not c!31201)) b!174358))

(assert (= (and d!53241 (not res!82711)) b!174359))

(declare-fun m!203493 () Bool)

(assert (=> d!53241 m!203493))

(declare-fun m!203495 () Bool)

(assert (=> b!174357 m!203495))

(declare-fun m!203497 () Bool)

(assert (=> b!174357 m!203497))

(assert (=> b!174357 m!203497))

(declare-fun m!203499 () Bool)

(assert (=> b!174357 m!203499))

(assert (=> b!174359 m!203497))

(assert (=> b!174359 m!203497))

(assert (=> b!174359 m!203499))

(assert (=> d!52759 d!53241))

(declare-fun d!53243 () Bool)

(assert (=> d!53243 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!3957 (getValueByKey!186 (toList!1083 lt!85850) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!52709 d!53243))

(assert (=> d!52709 d!52881))

(declare-fun d!53245 () Bool)

(declare-fun lt!86324 () Bool)

(assert (=> d!53245 (= lt!86324 (select (content!150 lt!85926) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun e!115130 () Bool)

(assert (=> d!53245 (= lt!86324 e!115130)))

(declare-fun res!82712 () Bool)

(assert (=> d!53245 (=> (not res!82712) (not e!115130))))

(assert (=> d!53245 (= res!82712 ((_ is Cons!2184) lt!85926))))

(assert (=> d!53245 (= (contains!1151 lt!85926 (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))) lt!86324)))

(declare-fun b!174360 () Bool)

(declare-fun e!115131 () Bool)

(assert (=> b!174360 (= e!115130 e!115131)))

(declare-fun res!82713 () Bool)

(assert (=> b!174360 (=> res!82713 e!115131)))

(assert (=> b!174360 (= res!82713 (= (h!2801 lt!85926) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!174361 () Bool)

(assert (=> b!174361 (= e!115131 (contains!1151 (t!6987 lt!85926) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(assert (= (and d!53245 res!82712) b!174360))

(assert (= (and b!174360 (not res!82713)) b!174361))

(declare-fun m!203501 () Bool)

(assert (=> d!53245 m!203501))

(declare-fun m!203503 () Bool)

(assert (=> d!53245 m!203503))

(declare-fun m!203505 () Bool)

(assert (=> b!174361 m!203505))

(assert (=> b!173533 d!53245))

(declare-fun d!53247 () Bool)

(assert (=> d!53247 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85882) lt!85881)) (v!3957 (getValueByKey!186 (toList!1083 lt!85882) lt!85881)))))

(assert (=> d!52823 d!53247))

(declare-fun b!174364 () Bool)

(declare-fun e!115133 () Option!192)

(assert (=> b!174364 (= e!115133 (getValueByKey!186 (t!6987 (toList!1083 lt!85882)) lt!85881))))

(declare-fun b!174363 () Bool)

(declare-fun e!115132 () Option!192)

(assert (=> b!174363 (= e!115132 e!115133)))

(declare-fun c!31203 () Bool)

(assert (=> b!174363 (= c!31203 (and ((_ is Cons!2184) (toList!1083 lt!85882)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85882))) lt!85881))))))

(declare-fun b!174362 () Bool)

(assert (=> b!174362 (= e!115132 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85882)))))))

(declare-fun b!174365 () Bool)

(assert (=> b!174365 (= e!115133 None!190)))

(declare-fun d!53249 () Bool)

(declare-fun c!31202 () Bool)

(assert (=> d!53249 (= c!31202 (and ((_ is Cons!2184) (toList!1083 lt!85882)) (= (_1!1612 (h!2801 (toList!1083 lt!85882))) lt!85881)))))

(assert (=> d!53249 (= (getValueByKey!186 (toList!1083 lt!85882) lt!85881) e!115132)))

(assert (= (and d!53249 c!31202) b!174362))

(assert (= (and d!53249 (not c!31202)) b!174363))

(assert (= (and b!174363 c!31203) b!174364))

(assert (= (and b!174363 (not c!31203)) b!174365))

(declare-fun m!203507 () Bool)

(assert (=> b!174364 m!203507))

(assert (=> d!52823 d!53249))

(assert (=> d!52765 d!52781))

(assert (=> d!52765 d!52761))

(declare-fun d!53251 () Bool)

(assert (=> d!53251 (= (apply!130 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) lt!85847) (apply!130 lt!85848 lt!85847))))

(assert (=> d!53251 true))

(declare-fun _$34!1060 () Unit!5315)

(assert (=> d!53251 (= (choose!938 lt!85848 lt!85853 (zeroValue!3438 thiss!1248) lt!85847) _$34!1060)))

(declare-fun bs!7227 () Bool)

(assert (= bs!7227 d!53251))

(assert (=> bs!7227 m!201929))

(assert (=> bs!7227 m!201929))

(assert (=> bs!7227 m!201931))

(assert (=> bs!7227 m!201937))

(assert (=> d!52765 d!53251))

(declare-fun d!53253 () Bool)

(declare-fun e!115135 () Bool)

(assert (=> d!53253 e!115135))

(declare-fun res!82714 () Bool)

(assert (=> d!53253 (=> res!82714 e!115135)))

(declare-fun lt!86327 () Bool)

(assert (=> d!53253 (= res!82714 (not lt!86327))))

(declare-fun lt!86326 () Bool)

(assert (=> d!53253 (= lt!86327 lt!86326)))

(declare-fun lt!86328 () Unit!5315)

(declare-fun e!115134 () Unit!5315)

(assert (=> d!53253 (= lt!86328 e!115134)))

(declare-fun c!31204 () Bool)

(assert (=> d!53253 (= c!31204 lt!86326)))

(assert (=> d!53253 (= lt!86326 (containsKey!189 (toList!1083 lt!85848) lt!85847))))

(assert (=> d!53253 (= (contains!1149 lt!85848 lt!85847) lt!86327)))

(declare-fun b!174366 () Bool)

(declare-fun lt!86325 () Unit!5315)

(assert (=> b!174366 (= e!115134 lt!86325)))

(assert (=> b!174366 (= lt!86325 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85848) lt!85847))))

(assert (=> b!174366 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85848) lt!85847))))

(declare-fun b!174367 () Bool)

(declare-fun Unit!5358 () Unit!5315)

(assert (=> b!174367 (= e!115134 Unit!5358)))

(declare-fun b!174368 () Bool)

(assert (=> b!174368 (= e!115135 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85848) lt!85847)))))

(assert (= (and d!53253 c!31204) b!174366))

(assert (= (and d!53253 (not c!31204)) b!174367))

(assert (= (and d!53253 (not res!82714)) b!174368))

(declare-fun m!203509 () Bool)

(assert (=> d!53253 m!203509))

(declare-fun m!203511 () Bool)

(assert (=> b!174366 m!203511))

(assert (=> b!174366 m!202323))

(assert (=> b!174366 m!202323))

(declare-fun m!203513 () Bool)

(assert (=> b!174366 m!203513))

(assert (=> b!174368 m!202323))

(assert (=> b!174368 m!202323))

(assert (=> b!174368 m!203513))

(assert (=> d!52765 d!53253))

(assert (=> d!52765 d!52773))

(declare-fun d!53255 () Bool)

(declare-fun e!115137 () Bool)

(assert (=> d!53255 e!115137))

(declare-fun res!82715 () Bool)

(assert (=> d!53255 (=> res!82715 e!115137)))

(declare-fun lt!86331 () Bool)

(assert (=> d!53255 (= res!82715 (not lt!86331))))

(declare-fun lt!86330 () Bool)

(assert (=> d!53255 (= lt!86331 lt!86330)))

(declare-fun lt!86332 () Unit!5315)

(declare-fun e!115136 () Unit!5315)

(assert (=> d!53255 (= lt!86332 e!115136)))

(declare-fun c!31205 () Bool)

(assert (=> d!53255 (= c!31205 lt!86330)))

(assert (=> d!53255 (= lt!86330 (containsKey!189 (toList!1083 lt!86093) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> d!53255 (= (contains!1149 lt!86093 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86331)))

(declare-fun b!174369 () Bool)

(declare-fun lt!86329 () Unit!5315)

(assert (=> b!174369 (= e!115136 lt!86329)))

(assert (=> b!174369 (= lt!86329 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!86093) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (=> b!174369 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86093) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174370 () Bool)

(declare-fun Unit!5359 () Unit!5315)

(assert (=> b!174370 (= e!115136 Unit!5359)))

(declare-fun b!174371 () Bool)

(assert (=> b!174371 (= e!115137 (isDefined!138 (getValueByKey!186 (toList!1083 lt!86093) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53255 c!31205) b!174369))

(assert (= (and d!53255 (not c!31205)) b!174370))

(assert (= (and d!53255 (not res!82715)) b!174371))

(declare-fun m!203515 () Bool)

(assert (=> d!53255 m!203515))

(declare-fun m!203517 () Bool)

(assert (=> b!174369 m!203517))

(assert (=> b!174369 m!202559))

(assert (=> b!174369 m!202559))

(declare-fun m!203519 () Bool)

(assert (=> b!174369 m!203519))

(assert (=> b!174371 m!202559))

(assert (=> b!174371 m!202559))

(assert (=> b!174371 m!203519))

(assert (=> d!52833 d!53255))

(declare-fun b!174374 () Bool)

(declare-fun e!115139 () Option!192)

(assert (=> b!174374 (= e!115139 (getValueByKey!186 (t!6987 lt!86092) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174373 () Bool)

(declare-fun e!115138 () Option!192)

(assert (=> b!174373 (= e!115138 e!115139)))

(declare-fun c!31207 () Bool)

(assert (=> b!174373 (= c!31207 (and ((_ is Cons!2184) lt!86092) (not (= (_1!1612 (h!2801 lt!86092)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174372 () Bool)

(assert (=> b!174372 (= e!115138 (Some!191 (_2!1612 (h!2801 lt!86092))))))

(declare-fun b!174375 () Bool)

(assert (=> b!174375 (= e!115139 None!190)))

(declare-fun d!53257 () Bool)

(declare-fun c!31206 () Bool)

(assert (=> d!53257 (= c!31206 (and ((_ is Cons!2184) lt!86092) (= (_1!1612 (h!2801 lt!86092)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53257 (= (getValueByKey!186 lt!86092 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115138)))

(assert (= (and d!53257 c!31206) b!174372))

(assert (= (and d!53257 (not c!31206)) b!174373))

(assert (= (and b!174373 c!31207) b!174374))

(assert (= (and b!174373 (not c!31207)) b!174375))

(declare-fun m!203521 () Bool)

(assert (=> b!174374 m!203521))

(assert (=> d!52833 d!53257))

(declare-fun d!53259 () Bool)

(assert (=> d!53259 (= (getValueByKey!186 lt!86092 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) (Some!191 (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!86333 () Unit!5315)

(assert (=> d!53259 (= lt!86333 (choose!936 lt!86092 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!115140 () Bool)

(assert (=> d!53259 e!115140))

(declare-fun res!82716 () Bool)

(assert (=> d!53259 (=> (not res!82716) (not e!115140))))

(assert (=> d!53259 (= res!82716 (isStrictlySorted!319 lt!86092))))

(assert (=> d!53259 (= (lemmaContainsTupThenGetReturnValue!99 lt!86092 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86333)))

(declare-fun b!174376 () Bool)

(declare-fun res!82717 () Bool)

(assert (=> b!174376 (=> (not res!82717) (not e!115140))))

(assert (=> b!174376 (= res!82717 (containsKey!189 lt!86092 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174377 () Bool)

(assert (=> b!174377 (= e!115140 (contains!1151 lt!86092 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (= (and d!53259 res!82716) b!174376))

(assert (= (and b!174376 res!82717) b!174377))

(assert (=> d!53259 m!202553))

(declare-fun m!203523 () Bool)

(assert (=> d!53259 m!203523))

(declare-fun m!203525 () Bool)

(assert (=> d!53259 m!203525))

(declare-fun m!203527 () Bool)

(assert (=> b!174376 m!203527))

(declare-fun m!203529 () Bool)

(assert (=> b!174377 m!203529))

(assert (=> d!52833 d!53259))

(declare-fun d!53261 () Bool)

(declare-fun e!115142 () Bool)

(assert (=> d!53261 e!115142))

(declare-fun res!82718 () Bool)

(assert (=> d!53261 (=> (not res!82718) (not e!115142))))

(declare-fun lt!86334 () List!2188)

(assert (=> d!53261 (= res!82718 (isStrictlySorted!319 lt!86334))))

(declare-fun e!115145 () List!2188)

(assert (=> d!53261 (= lt!86334 e!115145)))

(declare-fun c!31210 () Bool)

(assert (=> d!53261 (= c!31210 (and ((_ is Cons!2184) (toList!1083 call!17571)) (bvslt (_1!1612 (h!2801 (toList!1083 call!17571))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53261 (isStrictlySorted!319 (toList!1083 call!17571))))

(assert (=> d!53261 (= (insertStrictlySorted!102 (toList!1083 call!17571) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86334)))

(declare-fun b!174378 () Bool)

(declare-fun call!17652 () List!2188)

(assert (=> b!174378 (= e!115145 call!17652)))

(declare-fun bm!17649 () Bool)

(declare-fun call!17653 () List!2188)

(declare-fun call!17654 () List!2188)

(assert (=> bm!17649 (= call!17653 call!17654)))

(declare-fun b!174379 () Bool)

(assert (=> b!174379 (= e!115142 (contains!1151 lt!86334 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174380 () Bool)

(declare-fun e!115144 () List!2188)

(assert (=> b!174380 (= e!115144 call!17653)))

(declare-fun b!174381 () Bool)

(declare-fun e!115141 () List!2188)

(assert (=> b!174381 (= e!115141 (insertStrictlySorted!102 (t!6987 (toList!1083 call!17571)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17650 () Bool)

(assert (=> bm!17650 (= call!17652 ($colon$colon!97 e!115141 (ite c!31210 (h!2801 (toList!1083 call!17571)) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31208 () Bool)

(assert (=> bm!17650 (= c!31208 c!31210)))

(declare-fun b!174382 () Bool)

(declare-fun e!115143 () List!2188)

(assert (=> b!174382 (= e!115143 call!17654)))

(declare-fun b!174383 () Bool)

(assert (=> b!174383 (= e!115144 call!17653)))

(declare-fun b!174384 () Bool)

(assert (=> b!174384 (= e!115145 e!115143)))

(declare-fun c!31211 () Bool)

(assert (=> b!174384 (= c!31211 (and ((_ is Cons!2184) (toList!1083 call!17571)) (= (_1!1612 (h!2801 (toList!1083 call!17571))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun c!31209 () Bool)

(declare-fun b!174385 () Bool)

(assert (=> b!174385 (= e!115141 (ite c!31211 (t!6987 (toList!1083 call!17571)) (ite c!31209 (Cons!2184 (h!2801 (toList!1083 call!17571)) (t!6987 (toList!1083 call!17571))) Nil!2185)))))

(declare-fun bm!17651 () Bool)

(assert (=> bm!17651 (= call!17654 call!17652)))

(declare-fun b!174386 () Bool)

(declare-fun res!82719 () Bool)

(assert (=> b!174386 (=> (not res!82719) (not e!115142))))

(assert (=> b!174386 (= res!82719 (containsKey!189 lt!86334 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174387 () Bool)

(assert (=> b!174387 (= c!31209 (and ((_ is Cons!2184) (toList!1083 call!17571)) (bvsgt (_1!1612 (h!2801 (toList!1083 call!17571))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!174387 (= e!115143 e!115144)))

(assert (= (and d!53261 c!31210) b!174378))

(assert (= (and d!53261 (not c!31210)) b!174384))

(assert (= (and b!174384 c!31211) b!174382))

(assert (= (and b!174384 (not c!31211)) b!174387))

(assert (= (and b!174387 c!31209) b!174383))

(assert (= (and b!174387 (not c!31209)) b!174380))

(assert (= (or b!174383 b!174380) bm!17649))

(assert (= (or b!174382 bm!17649) bm!17651))

(assert (= (or b!174378 bm!17651) bm!17650))

(assert (= (and bm!17650 c!31208) b!174381))

(assert (= (and bm!17650 (not c!31208)) b!174385))

(assert (= (and d!53261 res!82718) b!174386))

(assert (= (and b!174386 res!82719) b!174379))

(declare-fun m!203531 () Bool)

(assert (=> bm!17650 m!203531))

(declare-fun m!203533 () Bool)

(assert (=> b!174381 m!203533))

(declare-fun m!203535 () Bool)

(assert (=> b!174386 m!203535))

(declare-fun m!203537 () Bool)

(assert (=> b!174379 m!203537))

(declare-fun m!203539 () Bool)

(assert (=> d!53261 m!203539))

(declare-fun m!203541 () Bool)

(assert (=> d!53261 m!203541))

(assert (=> d!52833 d!53261))

(assert (=> b!173719 d!52941))

(assert (=> b!173719 d!52943))

(assert (=> b!173751 d!52695))

(declare-fun b!174390 () Bool)

(declare-fun e!115147 () Option!192)

(assert (=> b!174390 (= e!115147 (getValueByKey!186 (t!6987 (toList!1083 lt!86011)) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174389 () Bool)

(declare-fun e!115146 () Option!192)

(assert (=> b!174389 (= e!115146 e!115147)))

(declare-fun c!31213 () Bool)

(assert (=> b!174389 (= c!31213 (and ((_ is Cons!2184) (toList!1083 lt!86011)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86011))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))))

(declare-fun b!174388 () Bool)

(assert (=> b!174388 (= e!115146 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86011)))))))

(declare-fun b!174391 () Bool)

(assert (=> b!174391 (= e!115147 None!190)))

(declare-fun c!31212 () Bool)

(declare-fun d!53263 () Bool)

(assert (=> d!53263 (= c!31212 (and ((_ is Cons!2184) (toList!1083 lt!86011)) (= (_1!1612 (h!2801 (toList!1083 lt!86011))) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(assert (=> d!53263 (= (getValueByKey!186 (toList!1083 lt!86011) (_1!1612 (ite (or c!30929 c!30931) (tuple2!3203 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3438 thiss!1248)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) e!115146)))

(assert (= (and d!53263 c!31212) b!174388))

(assert (= (and d!53263 (not c!31212)) b!174389))

(assert (= (and b!174389 c!31213) b!174390))

(assert (= (and b!174389 (not c!31213)) b!174391))

(declare-fun m!203543 () Bool)

(assert (=> b!174390 m!203543))

(assert (=> b!173686 d!53263))

(declare-fun d!53265 () Bool)

(assert (=> d!53265 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85860) lt!85863)) (v!3957 (getValueByKey!186 (toList!1083 lt!85860) lt!85863)))))

(assert (=> d!52775 d!53265))

(declare-fun b!174394 () Bool)

(declare-fun e!115149 () Option!192)

(assert (=> b!174394 (= e!115149 (getValueByKey!186 (t!6987 (toList!1083 lt!85860)) lt!85863))))

(declare-fun b!174393 () Bool)

(declare-fun e!115148 () Option!192)

(assert (=> b!174393 (= e!115148 e!115149)))

(declare-fun c!31215 () Bool)

(assert (=> b!174393 (= c!31215 (and ((_ is Cons!2184) (toList!1083 lt!85860)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85860))) lt!85863))))))

(declare-fun b!174392 () Bool)

(assert (=> b!174392 (= e!115148 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85860)))))))

(declare-fun b!174395 () Bool)

(assert (=> b!174395 (= e!115149 None!190)))

(declare-fun d!53267 () Bool)

(declare-fun c!31214 () Bool)

(assert (=> d!53267 (= c!31214 (and ((_ is Cons!2184) (toList!1083 lt!85860)) (= (_1!1612 (h!2801 (toList!1083 lt!85860))) lt!85863)))))

(assert (=> d!53267 (= (getValueByKey!186 (toList!1083 lt!85860) lt!85863) e!115148)))

(assert (= (and d!53267 c!31214) b!174392))

(assert (= (and d!53267 (not c!31214)) b!174393))

(assert (= (and b!174393 c!31215) b!174394))

(assert (= (and b!174393 (not c!31215)) b!174395))

(declare-fun m!203545 () Bool)

(assert (=> b!174394 m!203545))

(assert (=> d!52775 d!53267))

(assert (=> b!173493 d!53007))

(assert (=> b!173493 d!52783))

(assert (=> b!173617 d!52995))

(assert (=> b!173617 d!52863))

(declare-fun d!53269 () Bool)

(declare-fun res!82720 () Bool)

(declare-fun e!115150 () Bool)

(assert (=> d!53269 (=> res!82720 e!115150)))

(assert (=> d!53269 (= res!82720 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (= (_1!1612 (h!2801 (toList!1083 lt!85884))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53269 (= (containsKey!189 (toList!1083 lt!85884) #b1000000000000000000000000000000000000000000000000000000000000000) e!115150)))

(declare-fun b!174396 () Bool)

(declare-fun e!115151 () Bool)

(assert (=> b!174396 (= e!115150 e!115151)))

(declare-fun res!82721 () Bool)

(assert (=> b!174396 (=> (not res!82721) (not e!115151))))

(assert (=> b!174396 (= res!82721 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85884))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85884))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!2184) (toList!1083 lt!85884)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85884))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!174397 () Bool)

(assert (=> b!174397 (= e!115151 (containsKey!189 (t!6987 (toList!1083 lt!85884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53269 (not res!82720)) b!174396))

(assert (= (and b!174396 res!82721) b!174397))

(declare-fun m!203547 () Bool)

(assert (=> b!174397 m!203547))

(assert (=> d!52787 d!53269))

(declare-fun d!53271 () Bool)

(declare-fun e!115153 () Bool)

(assert (=> d!53271 e!115153))

(declare-fun res!82722 () Bool)

(assert (=> d!53271 (=> res!82722 e!115153)))

(declare-fun lt!86337 () Bool)

(assert (=> d!53271 (= res!82722 (not lt!86337))))

(declare-fun lt!86336 () Bool)

(assert (=> d!53271 (= lt!86337 lt!86336)))

(declare-fun lt!86338 () Unit!5315)

(declare-fun e!115152 () Unit!5315)

(assert (=> d!53271 (= lt!86338 e!115152)))

(declare-fun c!31216 () Bool)

(assert (=> d!53271 (= c!31216 lt!86336)))

(assert (=> d!53271 (= lt!86336 (containsKey!189 (toList!1083 lt!85987) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (=> d!53271 (= (contains!1149 lt!85987 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)) lt!86337)))

(declare-fun b!174398 () Bool)

(declare-fun lt!86335 () Unit!5315)

(assert (=> b!174398 (= e!115152 lt!86335)))

(assert (=> b!174398 (= lt!86335 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85987) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(assert (=> b!174398 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85987) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000)))))

(declare-fun b!174399 () Bool)

(declare-fun Unit!5360 () Unit!5315)

(assert (=> b!174399 (= e!115152 Unit!5360)))

(declare-fun b!174400 () Bool)

(assert (=> b!174400 (= e!115153 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85987) (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000))))))

(assert (= (and d!53271 c!31216) b!174398))

(assert (= (and d!53271 (not c!31216)) b!174399))

(assert (= (and d!53271 (not res!82722)) b!174400))

(assert (=> d!53271 m!202083))

(declare-fun m!203549 () Bool)

(assert (=> d!53271 m!203549))

(assert (=> b!174398 m!202083))

(declare-fun m!203551 () Bool)

(assert (=> b!174398 m!203551))

(assert (=> b!174398 m!202083))

(assert (=> b!174398 m!203123))

(assert (=> b!174398 m!203123))

(declare-fun m!203553 () Bool)

(assert (=> b!174398 m!203553))

(assert (=> b!174400 m!202083))

(assert (=> b!174400 m!203123))

(assert (=> b!174400 m!203123))

(assert (=> b!174400 m!203553))

(assert (=> b!173669 d!53271))

(declare-fun d!53273 () Bool)

(assert (=> d!53273 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85848) lt!85847)) (v!3957 (getValueByKey!186 (toList!1083 lt!85848) lt!85847)))))

(assert (=> d!52761 d!53273))

(declare-fun b!174403 () Bool)

(declare-fun e!115155 () Option!192)

(assert (=> b!174403 (= e!115155 (getValueByKey!186 (t!6987 (toList!1083 lt!85848)) lt!85847))))

(declare-fun b!174402 () Bool)

(declare-fun e!115154 () Option!192)

(assert (=> b!174402 (= e!115154 e!115155)))

(declare-fun c!31218 () Bool)

(assert (=> b!174402 (= c!31218 (and ((_ is Cons!2184) (toList!1083 lt!85848)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85848))) lt!85847))))))

(declare-fun b!174401 () Bool)

(assert (=> b!174401 (= e!115154 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85848)))))))

(declare-fun b!174404 () Bool)

(assert (=> b!174404 (= e!115155 None!190)))

(declare-fun d!53275 () Bool)

(declare-fun c!31217 () Bool)

(assert (=> d!53275 (= c!31217 (and ((_ is Cons!2184) (toList!1083 lt!85848)) (= (_1!1612 (h!2801 (toList!1083 lt!85848))) lt!85847)))))

(assert (=> d!53275 (= (getValueByKey!186 (toList!1083 lt!85848) lt!85847) e!115154)))

(assert (= (and d!53275 c!31217) b!174401))

(assert (= (and d!53275 (not c!31217)) b!174402))

(assert (= (and b!174402 c!31218) b!174403))

(assert (= (and b!174402 (not c!31218)) b!174404))

(declare-fun m!203555 () Bool)

(assert (=> b!174403 m!203555))

(assert (=> d!52761 d!53275))

(declare-fun d!53277 () Bool)

(declare-fun e!115157 () Bool)

(assert (=> d!53277 e!115157))

(declare-fun res!82723 () Bool)

(assert (=> d!53277 (=> res!82723 e!115157)))

(declare-fun lt!86341 () Bool)

(assert (=> d!53277 (= res!82723 (not lt!86341))))

(declare-fun lt!86340 () Bool)

(assert (=> d!53277 (= lt!86341 lt!86340)))

(declare-fun lt!86342 () Unit!5315)

(declare-fun e!115156 () Unit!5315)

(assert (=> d!53277 (= lt!86342 e!115156)))

(declare-fun c!31219 () Bool)

(assert (=> d!53277 (= c!31219 lt!86340)))

(assert (=> d!53277 (= lt!86340 (containsKey!189 (toList!1083 lt!85971) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53277 (= (contains!1149 lt!85971 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) lt!86341)))

(declare-fun b!174405 () Bool)

(declare-fun lt!86339 () Unit!5315)

(assert (=> b!174405 (= e!115156 lt!86339)))

(assert (=> b!174405 (= lt!86339 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85971) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174405 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85971) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174406 () Bool)

(declare-fun Unit!5361 () Unit!5315)

(assert (=> b!174406 (= e!115156 Unit!5361)))

(declare-fun b!174407 () Bool)

(assert (=> b!174407 (= e!115157 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85971) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53277 c!31219) b!174405))

(assert (= (and d!53277 (not c!31219)) b!174406))

(assert (= (and d!53277 (not res!82723)) b!174407))

(assert (=> d!53277 m!201909))

(declare-fun m!203557 () Bool)

(assert (=> d!53277 m!203557))

(assert (=> b!174405 m!201909))

(declare-fun m!203559 () Bool)

(assert (=> b!174405 m!203559))

(assert (=> b!174405 m!201909))

(assert (=> b!174405 m!203257))

(assert (=> b!174405 m!203257))

(declare-fun m!203561 () Bool)

(assert (=> b!174405 m!203561))

(assert (=> b!174407 m!201909))

(assert (=> b!174407 m!203257))

(assert (=> b!174407 m!203257))

(assert (=> b!174407 m!203561))

(assert (=> b!173650 d!53277))

(declare-fun d!53279 () Bool)

(assert (=> d!53279 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85894) lt!85897)) (v!3957 (getValueByKey!186 (toList!1083 lt!85894) lt!85897)))))

(assert (=> d!52829 d!53279))

(declare-fun b!174410 () Bool)

(declare-fun e!115159 () Option!192)

(assert (=> b!174410 (= e!115159 (getValueByKey!186 (t!6987 (toList!1083 lt!85894)) lt!85897))))

(declare-fun b!174409 () Bool)

(declare-fun e!115158 () Option!192)

(assert (=> b!174409 (= e!115158 e!115159)))

(declare-fun c!31221 () Bool)

(assert (=> b!174409 (= c!31221 (and ((_ is Cons!2184) (toList!1083 lt!85894)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85894))) lt!85897))))))

(declare-fun b!174408 () Bool)

(assert (=> b!174408 (= e!115158 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85894)))))))

(declare-fun b!174411 () Bool)

(assert (=> b!174411 (= e!115159 None!190)))

(declare-fun d!53281 () Bool)

(declare-fun c!31220 () Bool)

(assert (=> d!53281 (= c!31220 (and ((_ is Cons!2184) (toList!1083 lt!85894)) (= (_1!1612 (h!2801 (toList!1083 lt!85894))) lt!85897)))))

(assert (=> d!53281 (= (getValueByKey!186 (toList!1083 lt!85894) lt!85897) e!115158)))

(assert (= (and d!53281 c!31220) b!174408))

(assert (= (and d!53281 (not c!31220)) b!174409))

(assert (= (and b!174409 c!31221) b!174410))

(assert (= (and b!174409 (not c!31221)) b!174411))

(declare-fun m!203563 () Bool)

(assert (=> b!174410 m!203563))

(assert (=> d!52829 d!53281))

(declare-fun d!53283 () Bool)

(assert (=> d!53283 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!86343 () Unit!5315)

(assert (=> d!53283 (= lt!86343 (choose!937 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115160 () Bool)

(assert (=> d!53283 e!115160))

(declare-fun res!82724 () Bool)

(assert (=> d!53283 (=> (not res!82724) (not e!115160))))

(assert (=> d!53283 (= res!82724 (isStrictlySorted!319 (toList!1083 lt!85884)))))

(assert (=> d!53283 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000) lt!86343)))

(declare-fun b!174412 () Bool)

(assert (=> b!174412 (= e!115160 (containsKey!189 (toList!1083 lt!85884) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53283 res!82724) b!174412))

(assert (=> d!53283 m!202127))

(assert (=> d!53283 m!202127))

(assert (=> d!53283 m!202129))

(declare-fun m!203565 () Bool)

(assert (=> d!53283 m!203565))

(assert (=> d!53283 m!203331))

(assert (=> b!174412 m!202123))

(assert (=> b!173578 d!53283))

(assert (=> b!173578 d!53109))

(assert (=> b!173578 d!53111))

(declare-fun d!53285 () Bool)

(declare-fun lt!86344 () Bool)

(assert (=> d!53285 (= lt!86344 (select (content!150 lt!85915) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun e!115161 () Bool)

(assert (=> d!53285 (= lt!86344 e!115161)))

(declare-fun res!82725 () Bool)

(assert (=> d!53285 (=> (not res!82725) (not e!115161))))

(assert (=> d!53285 (= res!82725 ((_ is Cons!2184) lt!85915))))

(assert (=> d!53285 (= (contains!1151 lt!85915 (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))) lt!86344)))

(declare-fun b!174413 () Bool)

(declare-fun e!115162 () Bool)

(assert (=> b!174413 (= e!115161 e!115162)))

(declare-fun res!82726 () Bool)

(assert (=> b!174413 (=> res!82726 e!115162)))

(assert (=> b!174413 (= res!82726 (= (h!2801 lt!85915) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(declare-fun b!174414 () Bool)

(assert (=> b!174414 (= e!115162 (contains!1151 (t!6987 lt!85915) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))))))

(assert (= (and d!53285 res!82725) b!174413))

(assert (= (and b!174413 (not res!82726)) b!174414))

(declare-fun m!203567 () Bool)

(assert (=> d!53285 m!203567))

(declare-fun m!203569 () Bool)

(assert (=> d!53285 m!203569))

(declare-fun m!203571 () Bool)

(assert (=> b!174414 m!203571))

(assert (=> b!173511 d!53285))

(declare-fun d!53287 () Bool)

(declare-fun res!82729 () Bool)

(declare-fun e!115163 () Bool)

(assert (=> d!53287 (=> res!82729 e!115163)))

(assert (=> d!53287 (= res!82729 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!53287 (= (arrayNoDuplicates!0 (_keys!5438 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30963 (Cons!2187 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) Nil!2188) Nil!2188)) e!115163)))

(declare-fun b!174415 () Bool)

(declare-fun e!115164 () Bool)

(declare-fun e!115166 () Bool)

(assert (=> b!174415 (= e!115164 e!115166)))

(declare-fun c!31222 () Bool)

(assert (=> b!174415 (= c!31222 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174416 () Bool)

(declare-fun call!17655 () Bool)

(assert (=> b!174416 (= e!115166 call!17655)))

(declare-fun bm!17652 () Bool)

(assert (=> bm!17652 (= call!17655 (arrayNoDuplicates!0 (_keys!5438 lt!85779) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!31222 (Cons!2187 (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!30963 (Cons!2187 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) Nil!2188) Nil!2188)) (ite c!30963 (Cons!2187 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) Nil!2188) Nil!2188))))))

(declare-fun b!174417 () Bool)

(declare-fun e!115165 () Bool)

(assert (=> b!174417 (= e!115165 (contains!1152 (ite c!30963 (Cons!2187 (select (arr!3458 (_keys!5438 lt!85779)) #b00000000000000000000000000000000) Nil!2188) Nil!2188) (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174418 () Bool)

(assert (=> b!174418 (= e!115166 call!17655)))

(declare-fun b!174419 () Bool)

(assert (=> b!174419 (= e!115163 e!115164)))

(declare-fun res!82728 () Bool)

(assert (=> b!174419 (=> (not res!82728) (not e!115164))))

(assert (=> b!174419 (= res!82728 (not e!115165))))

(declare-fun res!82727 () Bool)

(assert (=> b!174419 (=> (not res!82727) (not e!115165))))

(assert (=> b!174419 (= res!82727 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!53287 (not res!82729)) b!174419))

(assert (= (and b!174419 res!82727) b!174417))

(assert (= (and b!174419 res!82728) b!174415))

(assert (= (and b!174415 c!31222) b!174416))

(assert (= (and b!174415 (not c!31222)) b!174418))

(assert (= (or b!174416 b!174418) bm!17652))

(assert (=> b!174415 m!203477))

(assert (=> b!174415 m!203477))

(assert (=> b!174415 m!203479))

(assert (=> bm!17652 m!203477))

(declare-fun m!203573 () Bool)

(assert (=> bm!17652 m!203573))

(assert (=> b!174417 m!203477))

(assert (=> b!174417 m!203477))

(declare-fun m!203575 () Bool)

(assert (=> b!174417 m!203575))

(assert (=> b!174419 m!203477))

(assert (=> b!174419 m!203477))

(assert (=> b!174419 m!203479))

(assert (=> bm!17585 d!53287))

(declare-fun b!174422 () Bool)

(declare-fun e!115168 () Option!192)

(assert (=> b!174422 (= e!115168 (getValueByKey!186 (t!6987 (toList!1083 lt!86093)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174421 () Bool)

(declare-fun e!115167 () Option!192)

(assert (=> b!174421 (= e!115167 e!115168)))

(declare-fun c!31224 () Bool)

(assert (=> b!174421 (= c!31224 (and ((_ is Cons!2184) (toList!1083 lt!86093)) (not (= (_1!1612 (h!2801 (toList!1083 lt!86093))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun b!174420 () Bool)

(assert (=> b!174420 (= e!115167 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!86093)))))))

(declare-fun b!174423 () Bool)

(assert (=> b!174423 (= e!115168 None!190)))

(declare-fun d!53289 () Bool)

(declare-fun c!31223 () Bool)

(assert (=> d!53289 (= c!31223 (and ((_ is Cons!2184) (toList!1083 lt!86093)) (= (_1!1612 (h!2801 (toList!1083 lt!86093))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53289 (= (getValueByKey!186 (toList!1083 lt!86093) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115167)))

(assert (= (and d!53289 c!31223) b!174420))

(assert (= (and d!53289 (not c!31223)) b!174421))

(assert (= (and b!174421 c!31224) b!174422))

(assert (= (and b!174421 (not c!31224)) b!174423))

(declare-fun m!203577 () Bool)

(assert (=> b!174422 m!203577))

(assert (=> b!173782 d!53289))

(declare-fun d!53291 () Bool)

(declare-fun e!115170 () Bool)

(assert (=> d!53291 e!115170))

(declare-fun res!82730 () Bool)

(assert (=> d!53291 (=> res!82730 e!115170)))

(declare-fun lt!86347 () Bool)

(assert (=> d!53291 (= res!82730 (not lt!86347))))

(declare-fun lt!86346 () Bool)

(assert (=> d!53291 (= lt!86347 lt!86346)))

(declare-fun lt!86348 () Unit!5315)

(declare-fun e!115169 () Unit!5315)

(assert (=> d!53291 (= lt!86348 e!115169)))

(declare-fun c!31225 () Bool)

(assert (=> d!53291 (= c!31225 lt!86346)))

(assert (=> d!53291 (= lt!86346 (containsKey!189 (toList!1083 lt!85971) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53291 (= (contains!1149 lt!85971 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86347)))

(declare-fun b!174424 () Bool)

(declare-fun lt!86345 () Unit!5315)

(assert (=> b!174424 (= e!115169 lt!86345)))

(assert (=> b!174424 (= lt!86345 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85971) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174424 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85971) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174425 () Bool)

(declare-fun Unit!5362 () Unit!5315)

(assert (=> b!174425 (= e!115169 Unit!5362)))

(declare-fun b!174426 () Bool)

(assert (=> b!174426 (= e!115170 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53291 c!31225) b!174424))

(assert (= (and d!53291 (not c!31225)) b!174425))

(assert (= (and d!53291 (not res!82730)) b!174426))

(declare-fun m!203579 () Bool)

(assert (=> d!53291 m!203579))

(declare-fun m!203581 () Bool)

(assert (=> b!174424 m!203581))

(declare-fun m!203583 () Bool)

(assert (=> b!174424 m!203583))

(assert (=> b!174424 m!203583))

(declare-fun m!203585 () Bool)

(assert (=> b!174424 m!203585))

(assert (=> b!174426 m!203583))

(assert (=> b!174426 m!203583))

(assert (=> b!174426 m!203585))

(assert (=> b!173647 d!53291))

(declare-fun d!53293 () Bool)

(assert (=> d!53293 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!86349 () Unit!5315)

(assert (=> d!53293 (= lt!86349 (choose!937 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115171 () Bool)

(assert (=> d!53293 e!115171))

(declare-fun res!82731 () Bool)

(assert (=> d!53293 (=> (not res!82731) (not e!115171))))

(assert (=> d!53293 (= res!82731 (isStrictlySorted!319 (toList!1083 lt!85850)))))

(assert (=> d!53293 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) lt!86349)))

(declare-fun b!174427 () Bool)

(assert (=> b!174427 (= e!115171 (containsKey!189 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53293 res!82731) b!174427))

(assert (=> d!53293 m!201909))

(assert (=> d!53293 m!202181))

(assert (=> d!53293 m!202181))

(assert (=> d!53293 m!202571))

(assert (=> d!53293 m!201909))

(declare-fun m!203587 () Bool)

(assert (=> d!53293 m!203587))

(assert (=> d!53293 m!202625))

(assert (=> b!174427 m!201909))

(assert (=> b!174427 m!202567))

(assert (=> b!173788 d!53293))

(assert (=> b!173788 d!53051))

(assert (=> b!173788 d!53053))

(declare-fun d!53295 () Bool)

(assert (=> d!53295 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun lt!86350 () Unit!5315)

(assert (=> d!53295 (= lt!86350 (choose!937 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun e!115172 () Bool)

(assert (=> d!53295 e!115172))

(declare-fun res!82732 () Bool)

(assert (=> d!53295 (=> (not res!82732) (not e!115172))))

(assert (=> d!53295 (= res!82732 (isStrictlySorted!319 (toList!1083 lt!85878)))))

(assert (=> d!53295 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86350)))

(declare-fun b!174428 () Bool)

(assert (=> b!174428 (= e!115172 (containsKey!189 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53295 res!82732) b!174428))

(assert (=> d!53295 m!201971))

(assert (=> d!53295 m!201971))

(assert (=> d!53295 m!202273))

(declare-fun m!203589 () Bool)

(assert (=> d!53295 m!203589))

(declare-fun m!203591 () Bool)

(assert (=> d!53295 m!203591))

(assert (=> b!174428 m!202269))

(assert (=> b!173688 d!53295))

(assert (=> b!173688 d!53057))

(assert (=> b!173688 d!52713))

(assert (=> b!173550 d!52845))

(declare-fun d!53297 () Bool)

(assert (=> d!53297 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85858) lt!85862)) (v!3957 (getValueByKey!186 (toList!1083 lt!85858) lt!85862)))))

(assert (=> d!52771 d!53297))

(declare-fun b!174431 () Bool)

(declare-fun e!115174 () Option!192)

(assert (=> b!174431 (= e!115174 (getValueByKey!186 (t!6987 (toList!1083 lt!85858)) lt!85862))))

(declare-fun b!174430 () Bool)

(declare-fun e!115173 () Option!192)

(assert (=> b!174430 (= e!115173 e!115174)))

(declare-fun c!31227 () Bool)

(assert (=> b!174430 (= c!31227 (and ((_ is Cons!2184) (toList!1083 lt!85858)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85858))) lt!85862))))))

(declare-fun b!174429 () Bool)

(assert (=> b!174429 (= e!115173 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85858)))))))

(declare-fun b!174432 () Bool)

(assert (=> b!174432 (= e!115174 None!190)))

(declare-fun d!53299 () Bool)

(declare-fun c!31226 () Bool)

(assert (=> d!53299 (= c!31226 (and ((_ is Cons!2184) (toList!1083 lt!85858)) (= (_1!1612 (h!2801 (toList!1083 lt!85858))) lt!85862)))))

(assert (=> d!53299 (= (getValueByKey!186 (toList!1083 lt!85858) lt!85862) e!115173)))

(assert (= (and d!53299 c!31226) b!174429))

(assert (= (and d!53299 (not c!31226)) b!174430))

(assert (= (and b!174430 c!31227) b!174431))

(assert (= (and b!174430 (not c!31227)) b!174432))

(declare-fun m!203593 () Bool)

(assert (=> b!174431 m!203593))

(assert (=> d!52771 d!53299))

(declare-fun d!53301 () Bool)

(assert (=> d!53301 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun lt!86351 () Unit!5315)

(assert (=> d!53301 (= lt!86351 (choose!937 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115175 () Bool)

(assert (=> d!53301 e!115175))

(declare-fun res!82733 () Bool)

(assert (=> d!53301 (=> (not res!82733) (not e!115175))))

(assert (=> d!53301 (= res!82733 (isStrictlySorted!319 (toList!1083 lt!85884)))))

(assert (=> d!53301 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) lt!86351)))

(declare-fun b!174433 () Bool)

(assert (=> b!174433 (= e!115175 (containsKey!189 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53301 res!82733) b!174433))

(assert (=> d!53301 m!201909))

(assert (=> d!53301 m!202177))

(assert (=> d!53301 m!202177))

(assert (=> d!53301 m!202179))

(assert (=> d!53301 m!201909))

(declare-fun m!203595 () Bool)

(assert (=> d!53301 m!203595))

(assert (=> d!53301 m!203331))

(assert (=> b!174433 m!201909))

(assert (=> b!174433 m!202173))

(assert (=> b!173654 d!53301))

(assert (=> b!173654 d!52979))

(assert (=> b!173654 d!52981))

(assert (=> b!173764 d!52695))

(declare-fun d!53303 () Bool)

(declare-fun res!82734 () Bool)

(declare-fun e!115176 () Bool)

(assert (=> d!53303 (=> res!82734 e!115176)))

(assert (=> d!53303 (= res!82734 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3757 (_keys!5438 lt!85779))))))

(assert (=> d!53303 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5438 lt!85779) (mask!8469 lt!85779)) e!115176)))

(declare-fun b!174434 () Bool)

(declare-fun e!115178 () Bool)

(assert (=> b!174434 (= e!115176 e!115178)))

(declare-fun c!31228 () Bool)

(assert (=> b!174434 (= c!31228 (validKeyInArray!0 (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!174435 () Bool)

(declare-fun e!115177 () Bool)

(declare-fun call!17656 () Bool)

(assert (=> b!174435 (= e!115177 call!17656)))

(declare-fun b!174436 () Bool)

(assert (=> b!174436 (= e!115178 call!17656)))

(declare-fun b!174437 () Bool)

(assert (=> b!174437 (= e!115178 e!115177)))

(declare-fun lt!86354 () (_ BitVec 64))

(assert (=> b!174437 (= lt!86354 (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!86352 () Unit!5315)

(assert (=> b!174437 (= lt!86352 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5438 lt!85779) lt!86354 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!174437 (arrayContainsKey!0 (_keys!5438 lt!85779) lt!86354 #b00000000000000000000000000000000)))

(declare-fun lt!86353 () Unit!5315)

(assert (=> b!174437 (= lt!86353 lt!86352)))

(declare-fun res!82735 () Bool)

(assert (=> b!174437 (= res!82735 (= (seekEntryOrOpen!0 (select (arr!3458 (_keys!5438 lt!85779)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!5438 lt!85779) (mask!8469 lt!85779)) (Found!536 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!174437 (=> (not res!82735) (not e!115177))))

(declare-fun bm!17653 () Bool)

(assert (=> bm!17653 (= call!17656 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!5438 lt!85779) (mask!8469 lt!85779)))))

(assert (= (and d!53303 (not res!82734)) b!174434))

(assert (= (and b!174434 c!31228) b!174437))

(assert (= (and b!174434 (not c!31228)) b!174436))

(assert (= (and b!174437 res!82735) b!174435))

(assert (= (or b!174435 b!174436) bm!17653))

(assert (=> b!174434 m!203477))

(assert (=> b!174434 m!203477))

(assert (=> b!174434 m!203479))

(assert (=> b!174437 m!203477))

(declare-fun m!203597 () Bool)

(assert (=> b!174437 m!203597))

(declare-fun m!203599 () Bool)

(assert (=> b!174437 m!203599))

(assert (=> b!174437 m!203477))

(declare-fun m!203601 () Bool)

(assert (=> b!174437 m!203601))

(declare-fun m!203603 () Bool)

(assert (=> bm!17653 m!203603))

(assert (=> bm!17582 d!53303))

(declare-fun d!53305 () Bool)

(assert (=> d!53305 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85892) lt!85896)) (v!3957 (getValueByKey!186 (toList!1083 lt!85892) lt!85896)))))

(assert (=> d!52805 d!53305))

(declare-fun b!174440 () Bool)

(declare-fun e!115180 () Option!192)

(assert (=> b!174440 (= e!115180 (getValueByKey!186 (t!6987 (toList!1083 lt!85892)) lt!85896))))

(declare-fun b!174439 () Bool)

(declare-fun e!115179 () Option!192)

(assert (=> b!174439 (= e!115179 e!115180)))

(declare-fun c!31230 () Bool)

(assert (=> b!174439 (= c!31230 (and ((_ is Cons!2184) (toList!1083 lt!85892)) (not (= (_1!1612 (h!2801 (toList!1083 lt!85892))) lt!85896))))))

(declare-fun b!174438 () Bool)

(assert (=> b!174438 (= e!115179 (Some!191 (_2!1612 (h!2801 (toList!1083 lt!85892)))))))

(declare-fun b!174441 () Bool)

(assert (=> b!174441 (= e!115180 None!190)))

(declare-fun d!53307 () Bool)

(declare-fun c!31229 () Bool)

(assert (=> d!53307 (= c!31229 (and ((_ is Cons!2184) (toList!1083 lt!85892)) (= (_1!1612 (h!2801 (toList!1083 lt!85892))) lt!85896)))))

(assert (=> d!53307 (= (getValueByKey!186 (toList!1083 lt!85892) lt!85896) e!115179)))

(assert (= (and d!53307 c!31229) b!174438))

(assert (= (and d!53307 (not c!31229)) b!174439))

(assert (= (and b!174439 c!31230) b!174440))

(assert (= (and b!174439 (not c!31230)) b!174441))

(declare-fun m!203605 () Bool)

(assert (=> b!174440 m!203605))

(assert (=> d!52805 d!53307))

(assert (=> b!173732 d!52695))

(declare-fun d!53309 () Bool)

(assert (=> d!53309 (= (apply!130 lt!86055 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) (get!1975 (getValueByKey!186 (toList!1083 lt!86055) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7228 () Bool)

(assert (= bs!7228 d!53309))

(assert (=> bs!7228 m!201909))

(assert (=> bs!7228 m!202761))

(assert (=> bs!7228 m!202761))

(declare-fun m!203607 () Bool)

(assert (=> bs!7228 m!203607))

(assert (=> b!173754 d!53309))

(assert (=> b!173754 d!52733))

(declare-fun d!53311 () Bool)

(declare-fun res!82736 () Bool)

(declare-fun e!115181 () Bool)

(assert (=> d!53311 (=> res!82736 e!115181)))

(assert (=> d!53311 (= res!82736 (and ((_ is Cons!2184) (toList!1083 lt!85884)) (= (_1!1612 (h!2801 (toList!1083 lt!85884))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!53311 (= (containsKey!189 (toList!1083 lt!85884) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) e!115181)))

(declare-fun b!174442 () Bool)

(declare-fun e!115182 () Bool)

(assert (=> b!174442 (= e!115181 e!115182)))

(declare-fun res!82737 () Bool)

(assert (=> b!174442 (=> (not res!82737) (not e!115182))))

(assert (=> b!174442 (= res!82737 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85884))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85884))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2184) (toList!1083 lt!85884)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85884))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!174443 () Bool)

(assert (=> b!174443 (= e!115182 (containsKey!189 (t!6987 (toList!1083 lt!85884)) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53311 (not res!82736)) b!174442))

(assert (= (and b!174442 res!82737) b!174443))

(assert (=> b!174443 m!201909))

(declare-fun m!203609 () Bool)

(assert (=> b!174443 m!203609))

(assert (=> d!52729 d!53311))

(declare-fun d!53313 () Bool)

(assert (=> d!53313 (= (get!1975 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))) (v!3957 (getValueByKey!186 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!52731 d!53313))

(assert (=> d!52731 d!53053))

(declare-fun d!53315 () Bool)

(declare-fun e!115184 () Bool)

(assert (=> d!53315 e!115184))

(declare-fun res!82738 () Bool)

(assert (=> d!53315 (=> (not res!82738) (not e!115184))))

(declare-fun lt!86355 () List!2188)

(assert (=> d!53315 (= res!82738 (isStrictlySorted!319 lt!86355))))

(declare-fun e!115187 () List!2188)

(assert (=> d!53315 (= lt!86355 e!115187)))

(declare-fun c!31233 () Bool)

(assert (=> d!53315 (= c!31233 (and ((_ is Cons!2184) (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (bvslt (_1!1612 (h!2801 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53315 (isStrictlySorted!319 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))))

(assert (=> d!53315 (= (insertStrictlySorted!102 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) lt!86355)))

(declare-fun b!174444 () Bool)

(declare-fun call!17657 () List!2188)

(assert (=> b!174444 (= e!115187 call!17657)))

(declare-fun bm!17654 () Bool)

(declare-fun call!17658 () List!2188)

(declare-fun call!17659 () List!2188)

(assert (=> bm!17654 (= call!17658 call!17659)))

(declare-fun b!174445 () Bool)

(assert (=> b!174445 (= e!115184 (contains!1151 lt!86355 (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174446 () Bool)

(declare-fun e!115186 () List!2188)

(assert (=> b!174446 (= e!115186 call!17658)))

(declare-fun b!174447 () Bool)

(declare-fun e!115183 () List!2188)

(assert (=> b!174447 (= e!115183 (insertStrictlySorted!102 (t!6987 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun bm!17655 () Bool)

(assert (=> bm!17655 (= call!17657 ($colon$colon!97 e!115183 (ite c!31233 (h!2801 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (tuple2!3203 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)) (_2!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))))

(declare-fun c!31231 () Bool)

(assert (=> bm!17655 (= c!31231 c!31233)))

(declare-fun b!174448 () Bool)

(declare-fun e!115185 () List!2188)

(assert (=> b!174448 (= e!115185 call!17659)))

(declare-fun b!174449 () Bool)

(assert (=> b!174449 (= e!115186 call!17658)))

(declare-fun b!174450 () Bool)

(assert (=> b!174450 (= e!115187 e!115185)))

(declare-fun c!31234 () Bool)

(assert (=> b!174450 (= c!31234 (and ((_ is Cons!2184) (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (= (_1!1612 (h!2801 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174451 () Bool)

(declare-fun c!31232 () Bool)

(assert (=> b!174451 (= e!115183 (ite c!31234 (t!6987 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (ite c!31232 (Cons!2184 (h!2801 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (t!6987 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) Nil!2185)))))

(declare-fun bm!17656 () Bool)

(assert (=> bm!17656 (= call!17659 call!17657)))

(declare-fun b!174452 () Bool)

(declare-fun res!82739 () Bool)

(assert (=> b!174452 (=> (not res!82739) (not e!115184))))

(assert (=> b!174452 (= res!82739 (containsKey!189 lt!86355 (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(declare-fun b!174453 () Bool)

(assert (=> b!174453 (= c!31232 (and ((_ is Cons!2184) (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248))))) (bvsgt (_1!1612 (h!2801 (t!6987 (toList!1083 (getCurrentListMap!739 (_keys!5438 thiss!1248) (_values!3580 thiss!1248) (mask!8469 thiss!1248) (extraKeys!3336 thiss!1248) (zeroValue!3438 thiss!1248) (minValue!3440 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3597 thiss!1248)))))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> b!174453 (= e!115185 e!115186)))

(assert (= (and d!53315 c!31233) b!174444))

(assert (= (and d!53315 (not c!31233)) b!174450))

(assert (= (and b!174450 c!31234) b!174448))

(assert (= (and b!174450 (not c!31234)) b!174453))

(assert (= (and b!174453 c!31232) b!174449))

(assert (= (and b!174453 (not c!31232)) b!174446))

(assert (= (or b!174449 b!174446) bm!17654))

(assert (= (or b!174448 bm!17654) bm!17656))

(assert (= (or b!174444 bm!17656) bm!17655))

(assert (= (and bm!17655 c!31231) b!174447))

(assert (= (and bm!17655 (not c!31231)) b!174451))

(assert (= (and d!53315 res!82738) b!174452))

(assert (= (and b!174452 res!82739) b!174445))

(declare-fun m!203611 () Bool)

(assert (=> bm!17655 m!203611))

(declare-fun m!203613 () Bool)

(assert (=> b!174447 m!203613))

(declare-fun m!203615 () Bool)

(assert (=> b!174452 m!203615))

(declare-fun m!203617 () Bool)

(assert (=> b!174445 m!203617))

(declare-fun m!203619 () Bool)

(assert (=> d!53315 m!203619))

(assert (=> d!53315 m!203319))

(assert (=> b!173700 d!53315))

(declare-fun d!53317 () Bool)

(assert (=> d!53317 (= (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) lt!85847)) (v!3957 (getValueByKey!186 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) lt!85847)))))

(assert (=> d!52781 d!53317))

(declare-fun e!115189 () Option!192)

(declare-fun b!174456 () Bool)

(assert (=> b!174456 (= e!115189 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))) lt!85847))))

(declare-fun b!174455 () Bool)

(declare-fun e!115188 () Option!192)

(assert (=> b!174455 (= e!115188 e!115189)))

(declare-fun c!31236 () Bool)

(assert (=> b!174455 (= c!31236 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))) lt!85847))))))

(declare-fun b!174454 () Bool)

(assert (=> b!174454 (= e!115188 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))))))

(declare-fun b!174457 () Bool)

(assert (=> b!174457 (= e!115189 None!190)))

(declare-fun d!53319 () Bool)

(declare-fun c!31235 () Bool)

(assert (=> d!53319 (= c!31235 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))))) lt!85847)))))

(assert (=> d!53319 (= (getValueByKey!186 (toList!1083 (+!245 lt!85848 (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248)))) lt!85847) e!115188)))

(assert (= (and d!53319 c!31235) b!174454))

(assert (= (and d!53319 (not c!31235)) b!174455))

(assert (= (and b!174455 c!31236) b!174456))

(assert (= (and b!174455 (not c!31236)) b!174457))

(declare-fun m!203621 () Bool)

(assert (=> b!174456 m!203621))

(assert (=> d!52781 d!53319))

(declare-fun d!53321 () Bool)

(declare-fun lt!86356 () Bool)

(assert (=> d!53321 (= lt!86356 (select (content!150 (toList!1083 lt!86044)) (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))

(declare-fun e!115190 () Bool)

(assert (=> d!53321 (= lt!86356 e!115190)))

(declare-fun res!82740 () Bool)

(assert (=> d!53321 (=> (not res!82740) (not e!115190))))

(assert (=> d!53321 (= res!82740 ((_ is Cons!2184) (toList!1083 lt!86044)))))

(assert (=> d!53321 (= (contains!1151 (toList!1083 lt!86044) (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))) lt!86356)))

(declare-fun b!174458 () Bool)

(declare-fun e!115191 () Bool)

(assert (=> b!174458 (= e!115190 e!115191)))

(declare-fun res!82741 () Bool)

(assert (=> b!174458 (=> res!82741 e!115191)))

(assert (=> b!174458 (= res!82741 (= (h!2801 (toList!1083 lt!86044)) (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))

(declare-fun b!174459 () Bool)

(assert (=> b!174459 (= e!115191 (contains!1151 (t!6987 (toList!1083 lt!86044)) (tuple2!3203 lt!85853 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!53321 res!82740) b!174458))

(assert (= (and b!174458 (not res!82741)) b!174459))

(declare-fun m!203623 () Bool)

(assert (=> d!53321 m!203623))

(declare-fun m!203625 () Bool)

(assert (=> d!53321 m!203625))

(declare-fun m!203627 () Bool)

(assert (=> b!174459 m!203627))

(assert (=> b!173723 d!53321))

(declare-fun d!53323 () Bool)

(assert (=> d!53323 (= (get!1975 (getValueByKey!186 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) lt!85862)) (v!3957 (getValueByKey!186 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) lt!85862)))))

(assert (=> d!52777 d!53323))

(declare-fun e!115193 () Option!192)

(declare-fun b!174462 () Bool)

(assert (=> b!174462 (= e!115193 (getValueByKey!186 (t!6987 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))) lt!85862))))

(declare-fun b!174461 () Bool)

(declare-fun e!115192 () Option!192)

(assert (=> b!174461 (= e!115192 e!115193)))

(declare-fun c!31238 () Bool)

(assert (=> b!174461 (= c!31238 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))) (not (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))) lt!85862))))))

(declare-fun b!174460 () Bool)

(assert (=> b!174460 (= e!115192 (Some!191 (_2!1612 (h!2801 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))))))))

(declare-fun b!174463 () Bool)

(assert (=> b!174463 (= e!115193 None!190)))

(declare-fun d!53325 () Bool)

(declare-fun c!31237 () Bool)

(assert (=> d!53325 (= c!31237 (and ((_ is Cons!2184) (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248))))) (= (_1!1612 (h!2801 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))))) lt!85862)))))

(assert (=> d!53325 (= (getValueByKey!186 (toList!1083 (+!245 lt!85858 (tuple2!3203 lt!85856 (minValue!3440 thiss!1248)))) lt!85862) e!115192)))

(assert (= (and d!53325 c!31237) b!174460))

(assert (= (and d!53325 (not c!31237)) b!174461))

(assert (= (and b!174461 c!31238) b!174462))

(assert (= (and b!174461 (not c!31238)) b!174463))

(declare-fun m!203629 () Bool)

(assert (=> b!174462 m!203629))

(assert (=> d!52777 d!53325))

(declare-fun lt!86357 () Bool)

(declare-fun d!53327 () Bool)

(assert (=> d!53327 (= lt!86357 (select (content!150 (toList!1083 lt!86070)) (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))

(declare-fun e!115194 () Bool)

(assert (=> d!53327 (= lt!86357 e!115194)))

(declare-fun res!82742 () Bool)

(assert (=> d!53327 (=> (not res!82742) (not e!115194))))

(assert (=> d!53327 (= res!82742 ((_ is Cons!2184) (toList!1083 lt!86070)))))

(assert (=> d!53327 (= (contains!1151 (toList!1083 lt!86070) (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))) lt!86357)))

(declare-fun b!174464 () Bool)

(declare-fun e!115195 () Bool)

(assert (=> b!174464 (= e!115194 e!115195)))

(declare-fun res!82743 () Bool)

(assert (=> b!174464 (=> res!82743 e!115195)))

(assert (=> b!174464 (= res!82743 (= (h!2801 (toList!1083 lt!86070)) (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))

(declare-fun b!174465 () Bool)

(assert (=> b!174465 (= e!115195 (contains!1151 (t!6987 (toList!1083 lt!86070)) (tuple2!3203 lt!85889 (zeroValue!3438 thiss!1248))))))

(assert (= (and d!53327 res!82742) b!174464))

(assert (= (and b!174464 (not res!82743)) b!174465))

(declare-fun m!203631 () Bool)

(assert (=> d!53327 m!203631))

(declare-fun m!203633 () Bool)

(assert (=> d!53327 m!203633))

(declare-fun m!203635 () Bool)

(assert (=> b!174465 m!203635))

(assert (=> b!173768 d!53327))

(declare-fun d!53329 () Bool)

(declare-fun e!115197 () Bool)

(assert (=> d!53329 e!115197))

(declare-fun res!82744 () Bool)

(assert (=> d!53329 (=> res!82744 e!115197)))

(declare-fun lt!86360 () Bool)

(assert (=> d!53329 (= res!82744 (not lt!86360))))

(declare-fun lt!86359 () Bool)

(assert (=> d!53329 (= lt!86360 lt!86359)))

(declare-fun lt!86361 () Unit!5315)

(declare-fun e!115196 () Unit!5315)

(assert (=> d!53329 (= lt!86361 e!115196)))

(declare-fun c!31239 () Bool)

(assert (=> d!53329 (= c!31239 lt!86359)))

(assert (=> d!53329 (= lt!86359 (containsKey!189 (toList!1083 lt!85987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53329 (= (contains!1149 lt!85987 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86360)))

(declare-fun b!174466 () Bool)

(declare-fun lt!86358 () Unit!5315)

(assert (=> b!174466 (= e!115196 lt!86358)))

(assert (=> b!174466 (= lt!86358 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 lt!85987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!174466 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85987) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!174467 () Bool)

(declare-fun Unit!5363 () Unit!5315)

(assert (=> b!174467 (= e!115196 Unit!5363)))

(declare-fun b!174468 () Bool)

(assert (=> b!174468 (= e!115197 (isDefined!138 (getValueByKey!186 (toList!1083 lt!85987) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53329 c!31239) b!174466))

(assert (= (and d!53329 (not c!31239)) b!174467))

(assert (= (and d!53329 (not res!82744)) b!174468))

(declare-fun m!203637 () Bool)

(assert (=> d!53329 m!203637))

(declare-fun m!203639 () Bool)

(assert (=> b!174466 m!203639))

(assert (=> b!174466 m!202871))

(assert (=> b!174466 m!202871))

(declare-fun m!203641 () Bool)

(assert (=> b!174466 m!203641))

(assert (=> b!174468 m!202871))

(assert (=> b!174468 m!202871))

(assert (=> b!174468 m!203641))

(assert (=> bm!17592 d!53329))

(declare-fun d!53331 () Bool)

(declare-fun lt!86362 () Bool)

(assert (=> d!53331 (= lt!86362 (select (content!150 (t!6987 (toList!1083 lt!85916))) (tuple2!3203 key!828 v!309)))))

(declare-fun e!115198 () Bool)

(assert (=> d!53331 (= lt!86362 e!115198)))

(declare-fun res!82745 () Bool)

(assert (=> d!53331 (=> (not res!82745) (not e!115198))))

(assert (=> d!53331 (= res!82745 ((_ is Cons!2184) (t!6987 (toList!1083 lt!85916))))))

(assert (=> d!53331 (= (contains!1151 (t!6987 (toList!1083 lt!85916)) (tuple2!3203 key!828 v!309)) lt!86362)))

(declare-fun b!174469 () Bool)

(declare-fun e!115199 () Bool)

(assert (=> b!174469 (= e!115198 e!115199)))

(declare-fun res!82746 () Bool)

(assert (=> b!174469 (=> res!82746 e!115199)))

(assert (=> b!174469 (= res!82746 (= (h!2801 (t!6987 (toList!1083 lt!85916))) (tuple2!3203 key!828 v!309)))))

(declare-fun b!174470 () Bool)

(assert (=> b!174470 (= e!115199 (contains!1151 (t!6987 (t!6987 (toList!1083 lt!85916))) (tuple2!3203 key!828 v!309)))))

(assert (= (and d!53331 res!82745) b!174469))

(assert (= (and b!174469 (not res!82746)) b!174470))

(assert (=> d!53331 m!203491))

(declare-fun m!203643 () Bool)

(assert (=> d!53331 m!203643))

(declare-fun m!203645 () Bool)

(assert (=> b!174470 m!203645))

(assert (=> b!173743 d!53331))

(declare-fun d!53333 () Bool)

(declare-fun res!82747 () Bool)

(declare-fun e!115200 () Bool)

(assert (=> d!53333 (=> res!82747 e!115200)))

(assert (=> d!53333 (= res!82747 (and ((_ is Cons!2184) (toList!1083 lt!85878)) (= (_1!1612 (h!2801 (toList!1083 lt!85878))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(assert (=> d!53333 (= (containsKey!189 (toList!1083 lt!85878) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))) e!115200)))

(declare-fun b!174471 () Bool)

(declare-fun e!115201 () Bool)

(assert (=> b!174471 (= e!115200 e!115201)))

(declare-fun res!82748 () Bool)

(assert (=> b!174471 (=> (not res!82748) (not e!115201))))

(assert (=> b!174471 (= res!82748 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85878))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85878))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))) ((_ is Cons!2184) (toList!1083 lt!85878)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85878))) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309)))))))

(declare-fun b!174472 () Bool)

(assert (=> b!174472 (= e!115201 (containsKey!189 (t!6987 (toList!1083 lt!85878)) (_1!1612 (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 v!309))))))

(assert (= (and d!53333 (not res!82747)) b!174471))

(assert (= (and b!174471 res!82748) b!174472))

(declare-fun m!203647 () Bool)

(assert (=> b!174472 m!203647))

(assert (=> d!52743 d!53333))

(declare-fun d!53335 () Bool)

(assert (=> d!53335 (= ($colon$colon!97 e!114624 (ite c!30954 (h!2801 (toList!1083 (map!1874 thiss!1248))) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309))))) (Cons!2184 (ite c!30954 (h!2801 (toList!1083 (map!1874 thiss!1248))) (tuple2!3203 (_1!1612 (tuple2!3203 key!828 v!309)) (_2!1612 (tuple2!3203 key!828 v!309)))) e!114624))))

(assert (=> bm!17578 d!53335))

(declare-fun d!53337 () Bool)

(declare-fun res!82749 () Bool)

(declare-fun e!115202 () Bool)

(assert (=> d!53337 (=> res!82749 e!115202)))

(assert (=> d!53337 (= res!82749 (and ((_ is Cons!2184) (toList!1083 lt!85850)) (= (_1!1612 (h!2801 (toList!1083 lt!85850))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (=> d!53337 (= (containsKey!189 (toList!1083 lt!85850) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)) e!115202)))

(declare-fun b!174473 () Bool)

(declare-fun e!115203 () Bool)

(assert (=> b!174473 (= e!115202 e!115203)))

(declare-fun res!82750 () Bool)

(assert (=> b!174473 (=> (not res!82750) (not e!115203))))

(assert (=> b!174473 (= res!82750 (and (or (not ((_ is Cons!2184) (toList!1083 lt!85850))) (bvsle (_1!1612 (h!2801 (toList!1083 lt!85850))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))) ((_ is Cons!2184) (toList!1083 lt!85850)) (bvslt (_1!1612 (h!2801 (toList!1083 lt!85850))) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun b!174474 () Bool)

(assert (=> b!174474 (= e!115203 (containsKey!189 (t!6987 (toList!1083 lt!85850)) (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53337 (not res!82749)) b!174473))

(assert (= (and b!174473 res!82750) b!174474))

(assert (=> b!174474 m!201909))

(declare-fun m!203649 () Bool)

(assert (=> b!174474 m!203649))

(assert (=> d!52839 d!53337))

(assert (=> b!173672 d!52845))

(declare-fun d!53339 () Bool)

(declare-fun e!115204 () Bool)

(assert (=> d!53339 e!115204))

(declare-fun res!82752 () Bool)

(assert (=> d!53339 (=> (not res!82752) (not e!115204))))

(declare-fun lt!86366 () ListLongMap!2135)

(assert (=> d!53339 (= res!82752 (contains!1149 lt!86366 (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!86365 () List!2188)

(assert (=> d!53339 (= lt!86366 (ListLongMap!2136 lt!86365))))

(declare-fun lt!86364 () Unit!5315)

(declare-fun lt!86363 () Unit!5315)

(assert (=> d!53339 (= lt!86364 lt!86363)))

(assert (=> d!53339 (= (getValueByKey!186 lt!86365 (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!191 (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53339 (= lt!86363 (lemmaContainsTupThenGetReturnValue!99 lt!86365 (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53339 (= lt!86365 (insertStrictlySorted!102 (toList!1083 call!17607) (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!53339 (= (+!245 call!17607 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!86366)))

(declare-fun b!174475 () Bool)

(declare-fun res!82751 () Bool)

(assert (=> b!174475 (=> (not res!82751) (not e!115204))))

(assert (=> b!174475 (= res!82751 (= (getValueByKey!186 (toList!1083 lt!86366) (_1!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!191 (_2!1612 (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!174476 () Bool)

(assert (=> b!174476 (= e!115204 (contains!1151 (toList!1083 lt!86366) (tuple2!3203 (select (arr!3458 (_keys!5438 thiss!1248)) #b00000000000000000000000000000000) (get!1974 (select (arr!3459 (_values!3580 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!473 (defaultEntry!3597 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!53339 res!82752) b!174475))

(assert (= (and b!174475 res!82751) b!174476))

(declare-fun m!203651 () Bool)

(assert (=> d!53339 m!203651))

(declare-fun m!203653 () Bool)

(assert (=> d!53339 m!203653))

(declare-fun m!203655 () Bool)

(assert (=> d!53339 m!203655))

(declare-fun m!203657 () Bool)

(assert (=> d!53339 m!203657))

(declare-fun m!203659 () Bool)

(assert (=> b!174475 m!203659))

(declare-fun m!203661 () Bool)

(assert (=> b!174476 m!203661))

(assert (=> b!173750 d!53339))

(declare-fun d!53341 () Bool)

(assert (=> d!53341 (not (contains!1149 (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057)) lt!86061))))

(declare-fun lt!86367 () Unit!5315)

(assert (=> d!53341 (= lt!86367 (choose!940 lt!86058 lt!86060 lt!86057 lt!86061))))

(declare-fun e!115205 () Bool)

(assert (=> d!53341 e!115205))

(declare-fun res!82753 () Bool)

(assert (=> d!53341 (=> (not res!82753) (not e!115205))))

(assert (=> d!53341 (= res!82753 (not (contains!1149 lt!86058 lt!86061)))))

(assert (=> d!53341 (= (addStillNotContains!74 lt!86058 lt!86060 lt!86057 lt!86061) lt!86367)))

(declare-fun b!174477 () Bool)

(assert (=> b!174477 (= e!115205 (not (= lt!86060 lt!86061)))))

(assert (= (and d!53341 res!82753) b!174477))

(assert (=> d!53341 m!202437))

(assert (=> d!53341 m!202437))

(assert (=> d!53341 m!202439))

(declare-fun m!203663 () Bool)

(assert (=> d!53341 m!203663))

(declare-fun m!203665 () Bool)

(assert (=> d!53341 m!203665))

(assert (=> b!173750 d!53341))

(assert (=> b!173750 d!52733))

(declare-fun d!53343 () Bool)

(declare-fun e!115206 () Bool)

(assert (=> d!53343 e!115206))

(declare-fun res!82755 () Bool)

(assert (=> d!53343 (=> (not res!82755) (not e!115206))))

(declare-fun lt!86371 () ListLongMap!2135)

(assert (=> d!53343 (= res!82755 (contains!1149 lt!86371 (_1!1612 (tuple2!3203 lt!86060 lt!86057))))))

(declare-fun lt!86370 () List!2188)

(assert (=> d!53343 (= lt!86371 (ListLongMap!2136 lt!86370))))

(declare-fun lt!86369 () Unit!5315)

(declare-fun lt!86368 () Unit!5315)

(assert (=> d!53343 (= lt!86369 lt!86368)))

(assert (=> d!53343 (= (getValueByKey!186 lt!86370 (_1!1612 (tuple2!3203 lt!86060 lt!86057))) (Some!191 (_2!1612 (tuple2!3203 lt!86060 lt!86057))))))

(assert (=> d!53343 (= lt!86368 (lemmaContainsTupThenGetReturnValue!99 lt!86370 (_1!1612 (tuple2!3203 lt!86060 lt!86057)) (_2!1612 (tuple2!3203 lt!86060 lt!86057))))))

(assert (=> d!53343 (= lt!86370 (insertStrictlySorted!102 (toList!1083 lt!86058) (_1!1612 (tuple2!3203 lt!86060 lt!86057)) (_2!1612 (tuple2!3203 lt!86060 lt!86057))))))

(assert (=> d!53343 (= (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057)) lt!86371)))

(declare-fun b!174478 () Bool)

(declare-fun res!82754 () Bool)

(assert (=> b!174478 (=> (not res!82754) (not e!115206))))

(assert (=> b!174478 (= res!82754 (= (getValueByKey!186 (toList!1083 lt!86371) (_1!1612 (tuple2!3203 lt!86060 lt!86057))) (Some!191 (_2!1612 (tuple2!3203 lt!86060 lt!86057)))))))

(declare-fun b!174479 () Bool)

(assert (=> b!174479 (= e!115206 (contains!1151 (toList!1083 lt!86371) (tuple2!3203 lt!86060 lt!86057)))))

(assert (= (and d!53343 res!82755) b!174478))

(assert (= (and b!174478 res!82754) b!174479))

(declare-fun m!203667 () Bool)

(assert (=> d!53343 m!203667))

(declare-fun m!203669 () Bool)

(assert (=> d!53343 m!203669))

(declare-fun m!203671 () Bool)

(assert (=> d!53343 m!203671))

(declare-fun m!203673 () Bool)

(assert (=> d!53343 m!203673))

(declare-fun m!203675 () Bool)

(assert (=> b!174478 m!203675))

(declare-fun m!203677 () Bool)

(assert (=> b!174479 m!203677))

(assert (=> b!173750 d!53343))

(declare-fun d!53345 () Bool)

(declare-fun e!115208 () Bool)

(assert (=> d!53345 e!115208))

(declare-fun res!82756 () Bool)

(assert (=> d!53345 (=> res!82756 e!115208)))

(declare-fun lt!86374 () Bool)

(assert (=> d!53345 (= res!82756 (not lt!86374))))

(declare-fun lt!86373 () Bool)

(assert (=> d!53345 (= lt!86374 lt!86373)))

(declare-fun lt!86375 () Unit!5315)

(declare-fun e!115207 () Unit!5315)

(assert (=> d!53345 (= lt!86375 e!115207)))

(declare-fun c!31240 () Bool)

(assert (=> d!53345 (= c!31240 lt!86373)))

(assert (=> d!53345 (= lt!86373 (containsKey!189 (toList!1083 (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057))) lt!86061))))

(assert (=> d!53345 (= (contains!1149 (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057)) lt!86061) lt!86374)))

(declare-fun b!174480 () Bool)

(declare-fun lt!86372 () Unit!5315)

(assert (=> b!174480 (= e!115207 lt!86372)))

(assert (=> b!174480 (= lt!86372 (lemmaContainsKeyImpliesGetValueByKeyDefined!137 (toList!1083 (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057))) lt!86061))))

(assert (=> b!174480 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057))) lt!86061))))

(declare-fun b!174481 () Bool)

(declare-fun Unit!5364 () Unit!5315)

(assert (=> b!174481 (= e!115207 Unit!5364)))

(declare-fun b!174482 () Bool)

(assert (=> b!174482 (= e!115208 (isDefined!138 (getValueByKey!186 (toList!1083 (+!245 lt!86058 (tuple2!3203 lt!86060 lt!86057))) lt!86061)))))

(assert (= (and d!53345 c!31240) b!174480))

(assert (= (and d!53345 (not c!31240)) b!174481))

(assert (= (and d!53345 (not res!82756)) b!174482))

(declare-fun m!203679 () Bool)

(assert (=> d!53345 m!203679))

(declare-fun m!203681 () Bool)

(assert (=> b!174480 m!203681))

(declare-fun m!203683 () Bool)

(assert (=> b!174480 m!203683))

(assert (=> b!174480 m!203683))

(declare-fun m!203685 () Bool)

(assert (=> b!174480 m!203685))

(assert (=> b!174482 m!203683))

(assert (=> b!174482 m!203683))

(assert (=> b!174482 m!203685))

(assert (=> b!173750 d!53345))

(declare-fun d!53347 () Bool)

(declare-fun lt!86376 () Bool)

(assert (=> d!53347 (= lt!86376 (select (content!150 (toList!1083 lt!86007)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(declare-fun e!115209 () Bool)

(assert (=> d!53347 (= lt!86376 e!115209)))

(declare-fun res!82757 () Bool)

(assert (=> d!53347 (=> (not res!82757) (not e!115209))))

(assert (=> d!53347 (= res!82757 ((_ is Cons!2184) (toList!1083 lt!86007)))))

(assert (=> d!53347 (= (contains!1151 (toList!1083 lt!86007) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))) lt!86376)))

(declare-fun b!174483 () Bool)

(declare-fun e!115210 () Bool)

(assert (=> b!174483 (= e!115209 e!115210)))

(declare-fun res!82758 () Bool)

(assert (=> b!174483 (=> res!82758 e!115210)))

(assert (=> b!174483 (= res!82758 (= (h!2801 (toList!1083 lt!86007)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(declare-fun b!174484 () Bool)

(assert (=> b!174484 (= e!115210 (contains!1151 (t!6987 (toList!1083 lt!86007)) (tuple2!3203 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3440 thiss!1248))))))

(assert (= (and d!53347 res!82757) b!174483))

(assert (= (and b!174483 (not res!82758)) b!174484))

(declare-fun m!203687 () Bool)

(assert (=> d!53347 m!203687))

(declare-fun m!203689 () Bool)

(assert (=> d!53347 m!203689))

(declare-fun m!203691 () Bool)

(assert (=> b!174484 m!203691))

(assert (=> b!173685 d!53347))

(declare-fun mapIsEmpty!6959 () Bool)

(declare-fun mapRes!6959 () Bool)

(assert (=> mapIsEmpty!6959 mapRes!6959))

(declare-fun mapNonEmpty!6959 () Bool)

(declare-fun tp!15608 () Bool)

(declare-fun e!115211 () Bool)

(assert (=> mapNonEmpty!6959 (= mapRes!6959 (and tp!15608 e!115211))))

(declare-fun mapKey!6959 () (_ BitVec 32))

(declare-fun mapValue!6959 () ValueCell!1697)

(declare-fun mapRest!6959 () (Array (_ BitVec 32) ValueCell!1697))

(assert (=> mapNonEmpty!6959 (= mapRest!6958 (store mapRest!6959 mapKey!6959 mapValue!6959))))

(declare-fun condMapEmpty!6959 () Bool)

(declare-fun mapDefault!6959 () ValueCell!1697)

(assert (=> mapNonEmpty!6958 (= condMapEmpty!6959 (= mapRest!6958 ((as const (Array (_ BitVec 32) ValueCell!1697)) mapDefault!6959)))))

(declare-fun e!115212 () Bool)

(assert (=> mapNonEmpty!6958 (= tp!15607 (and e!115212 mapRes!6959))))

(declare-fun b!174486 () Bool)

(assert (=> b!174486 (= e!115212 tp_is_empty!4081)))

(declare-fun b!174485 () Bool)

(assert (=> b!174485 (= e!115211 tp_is_empty!4081)))

(assert (= (and mapNonEmpty!6958 condMapEmpty!6959) mapIsEmpty!6959))

(assert (= (and mapNonEmpty!6958 (not condMapEmpty!6959)) mapNonEmpty!6959))

(assert (= (and mapNonEmpty!6959 ((_ is ValueCellFull!1697) mapValue!6959)) b!174485))

(assert (= (and mapNonEmpty!6958 ((_ is ValueCellFull!1697) mapDefault!6959)) b!174486))

(declare-fun m!203693 () Bool)

(assert (=> mapNonEmpty!6959 m!203693))

(declare-fun b_lambda!6995 () Bool)

(assert (= b_lambda!6989 (or (and b!173312 b_free!4309) b_lambda!6995)))

(declare-fun b_lambda!6997 () Bool)

(assert (= b_lambda!6985 (or (and b!173312 b_free!4309) b_lambda!6997)))

(declare-fun b_lambda!6999 () Bool)

(assert (= b_lambda!6983 (or (and b!173312 b_free!4309) b_lambda!6999)))

(declare-fun b_lambda!7001 () Bool)

(assert (= b_lambda!6987 (or (and b!173312 b_free!4309) b_lambda!7001)))

(declare-fun b_lambda!7003 () Bool)

(assert (= b_lambda!6969 (or (and b!173312 b_free!4309 (= (defaultEntry!3597 thiss!1248) (defaultEntry!3597 lt!85779))) b_lambda!7003)))

(check-sat (not d!53211) (not b!174200) (not b!174422) (not b!173941) (not bm!17638) (not bm!17624) (not b!174014) (not d!53217) (not b!174262) (not b!174452) (not b!174313) (not d!53099) (not d!53071) (not b_lambda!6981) (not b!174377) (not b!174274) (not b!173916) (not d!53215) (not b!174229) (not d!53285) (not b!174103) (not b!174191) (not bm!17612) (not b!174320) (not b!174249) (not b!174332) (not b!174484) (not b!173867) (not b_next!4309) (not d!53261) (not b!174465) (not b!174062) (not b!174299) (not b!174112) (not b!174168) (not b!174357) (not b!174059) (not d!52963) (not b!174240) (not b!174431) (not d!53223) (not d!53031) (not b!173923) (not bm!17627) (not b!174028) (not b!174039) (not d!53081) (not d!53131) (not d!53101) (not b!173836) (not d!52855) (not d!53051) (not b!174149) (not d!52967) (not b!174205) (not b!174080) (not b!174017) (not b!173904) (not b!174065) (not b!174434) (not d!53213) (not d!53109) (not d!52947) (not d!53327) (not b!174143) (not b!173907) (not b!174176) (not d!52987) (not bm!17633) (not d!53291) (not b!173918) (not b!174337) (not d!52899) (not b!174019) (not b!174032) (not b!174390) (not b!174175) (not b!173901) (not d!52873) (not d!53145) (not b!173843) (not b!174196) (not b!174189) (not d!53139) (not b!174330) (not d!53049) (not b!174070) (not b!173967) (not d!53293) (not b!174245) (not d!53321) (not b!174308) (not d!52883) (not b!174272) (not b!173861) (not d!53093) (not b_lambda!6963) (not b!174215) (not b!174005) (not b!174376) (not b!174417) (not d!53199) (not b!173958) (not b!174223) (not b!174012) (not d!53087) (not d!52957) (not b!174242) (not b!173814) (not b!173986) (not b!174139) (not b!174472) (not b!173812) (not b!174301) (not b!174238) (not b!173799) (not b!173934) (not b!174433) (not d!53075) (not b!174294) (not b!174106) (not b!174323) (not b!174312) (not d!53271) (not d!52955) (not b!173816) (not d!53125) (not b!173858) (not bm!17648) (not d!52867) (not d!52879) (not d!52979) tp_is_empty!4081 (not bm!17621) (not b!174087) (not b!173808) (not b!174182) (not d!53341) (not b!174090) (not b!173856) (not bm!17647) (not b!173833) (not b!174141) (not b!174474) (not b!174437) (not d!53295) (not d!52973) (not b!174331) (not b!174057) (not b!174456) (not d!53347) (not b!174335) (not b!173899) (not b_lambda!6993) (not b!174291) (not b!174428) (not d!53253) (not b!174427) (not bm!17643) (not d!53003) (not d!52847) (not b!174199) (not b!173927) (not b!174117) (not b!173966) (not b!174400) (not b!174078) (not d!53197) (not b!174259) (not b!174479) (not d!53239) (not b!174347) (not b!173955) (not b!173980) (not d!53165) (not b!173895) (not d!52891) (not b!174161) (not b!173959) (not b!174470) (not d!53259) (not b!173805) (not b!173891) (not d!52995) (not b!174097) (not d!53251) (not b!174326) (not d!53331) (not b!174462) (not b!174119) (not d!53283) (not b!173838) (not b!173896) (not b!174459) (not d!53175) (not b!173939) (not bm!17618) (not d!53195) (not d!52999) (not b!174231) (not d!52915) (not b!174152) (not d!53061) (not b!174480) (not b!174381) (not d!53127) (not d!53105) (not b!174290) (not b!174328) (not b!174124) (not b!174397) (not b!174226) (not b!174394) (not d!52933) (not b!173978) (not b!173936) (not d!53009) (not b!174165) (not b_lambda!7003) (not b!174172) (not b!174426) (not d!53047) (not d!52877) (not b!173985) (not b!174415) (not b!174195) (not b!173820) (not b!174440) (not b!174311) (not b!174218) (not d!53277) (not b!174468) (not b!173964) (not b!174269) (not bm!17609) (not b!174364) (not d!52965) (not b!174156) (not d!53121) (not b!174386) (not b!174447) (not d!53083) (not b!174379) (not b!173853) (not b!174040) (not d!53255) (not b!173893) (not d!52887) (not b!173796) (not b!174060) (not d!53017) (not b!173961) (not b!174193) (not d!53103) (not b!173995) (not b_lambda!6997) (not d!53155) (not d!53011) (not b!174109) (not b!174169) (not b!174283) (not b_lambda!6977) (not b!174369) (not d!53309) (not b!174093) (not b!173831) (not b!173802) (not b!174072) (not d!53205) (not d!53193) (not b!174398) (not b!174475) (not b!174253) (not b!174257) (not b!174198) (not b!174051) (not b!173983) (not b!174255) (not d!52939) (not d!52969) (not b!173969) (not d!53339) (not b!174206) (not d!53227) (not d!52889) (not d!53043) (not d!53315) (not b!173948) (not b!174068) (not b!173898) (not b_lambda!6999) (not b!174270) b_and!10793 (not d!53187) (not b!174261) (not bm!17615) (not b!173990) (not b!173909) (not b!174374) (not b_lambda!7001) (not d!53023) (not b!173887) (not b!174228) (not b_lambda!6961) (not b!174009) (not b!174042) (not d!53203) (not b!173906) (not b!174146) (not b!174482) (not bm!17653) (not b!174414) (not d!53301) (not d!53329) (not b!174324) (not bm!17636) (not d!53221) (not b!173839) (not d!52911) (not d!53153) (not b!174049) (not d!53077) (not b!174015) (not b!174317) (not b!174322) (not d!53057) (not b!174403) (not b!173911) (not b!174343) (not b_lambda!6995) (not d!52993) (not d!52937) (not d!53209) (not b!174443) (not b!173920) (not b!174187) (not b!173823) (not d!53233) (not d!52841) (not d!53007) (not b!174151) (not b!173946) (not b!174366) (not d!52853) (not mapNonEmpty!6959) (not bm!17610) (not b!174419) (not b!173855) (not b!174185) (not d!52949) (not b!174128) (not b!174164) (not d!52905) (not b!174279) (not d!53117) (not d!53191) (not d!53177) (not b!174314) (not d!53143) (not b!174186) (not d!53219) (not b!174100) (not b!174445) (not d!52941) (not d!52843) (not b!174007) (not b!174264) (not d!53235) (not b!174350) (not b!174307) (not b!174359) (not d!52897) (not b!174303) (not b!174044) (not b!174233) (not bm!17645) (not b!173976) (not b!174179) (not b!173951) (not b!174424) (not b!174188) (not b!174287) (not b!174252) (not bm!17650) (not b!174371) (not b!174352) (not d!52961) (not b!173803) (not b!174075) (not b!174476) (not b!173937) (not bm!17655) (not bm!17639) (not b!174114) (not d!52917) (not b!173857) (not b!174132) (not d!53021) (not b!174077) (not b!173988) (not b!173848) (not b_lambda!6991) (not d!52953) (not b!174082) (not b!173929) (not b!174333) (not d!52893) (not b!174318) (not b!174047) (not b!174115) (not b!173826) (not b!174208) (not d!52929) (not b!174407) (not d!52985) (not d!52975) (not b!174354) (not b_lambda!6975) (not b!174412) (not b!174063) (not b!174297) (not b!174356) (not b!174267) (not b!174466) (not b!174211) (not b!173852) (not d!53241) (not d!53189) (not b!174000) (not d!53163) (not b!173794) (not b!174144) (not bm!17630) (not b!173971) (not bm!17652) (not d!53245) (not d!53129) (not d!53343) (not b!174154) (not b!174221) (not d!53005) (not d!53345) (not b!173841) (not d!52909) (not b_lambda!6979) (not b!174306) (not b!174361) (not d!53201) (not b!174174) (not b!174220) (not d!52935) (not b!174321) (not bm!17607) (not d!53035) (not b!173931) (not b!174478) (not b!174167) (not b!173885) (not d!52997) (not b!174368) (not b!174107) (not b!174024) (not b!174410) (not d!53119) (not b!173829) (not b!174304) (not b!173825) (not d!53181) (not b!173998) (not d!53207) (not b!173859) (not b!174099) (not d!53149) (not b!174183) (not d!53161) (not d!52919) (not d!52865) (not b!174405) (not d!53065) (not bm!17641))
(check-sat b_and!10793 (not b_next!4309))
