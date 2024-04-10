; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19728 () Bool)

(assert start!19728)

(declare-fun b!193348 () Bool)

(declare-fun b_free!4707 () Bool)

(declare-fun b_next!4707 () Bool)

(assert (=> b!193348 (= b_free!4707 (not b_next!4707))))

(declare-fun tp!16985 () Bool)

(declare-fun b_and!11413 () Bool)

(assert (=> b!193348 (= tp!16985 b_and!11413)))

(declare-fun b!193339 () Bool)

(declare-fun res!91364 () Bool)

(declare-fun e!127219 () Bool)

(assert (=> b!193339 (=> res!91364 e!127219)))

(declare-datatypes ((V!5619 0))(
  ( (V!5620 (val!2284 Int)) )
))
(declare-datatypes ((ValueCell!1896 0))(
  ( (ValueCellFull!1896 (v!4240 V!5619)) (EmptyCell!1896) )
))
(declare-datatypes ((array!8205 0))(
  ( (array!8206 (arr!3863 (Array (_ BitVec 32) (_ BitVec 64))) (size!4187 (_ BitVec 32))) )
))
(declare-datatypes ((array!8207 0))(
  ( (array!8208 (arr!3864 (Array (_ BitVec 32) ValueCell!1896)) (size!4188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2700 0))(
  ( (LongMapFixedSize!2701 (defaultEntry!3946 Int) (mask!9197 (_ BitVec 32)) (extraKeys!3683 (_ BitVec 32)) (zeroValue!3787 V!5619) (minValue!3787 V!5619) (_size!1399 (_ BitVec 32)) (_keys!5936 array!8205) (_values!3929 array!8207) (_vacant!1399 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2700)

(declare-datatypes ((List!2439 0))(
  ( (Nil!2436) (Cons!2435 (h!3076 (_ BitVec 64)) (t!7361 List!2439)) )
))
(declare-fun arrayNoDuplicates!0 (array!8205 (_ BitVec 32) List!2439) Bool)

(assert (=> b!193339 (= res!91364 (not (arrayNoDuplicates!0 (_keys!5936 thiss!1248) #b00000000000000000000000000000000 Nil!2436)))))

(declare-fun b!193340 () Bool)

(declare-fun e!127216 () Bool)

(declare-fun tp_is_empty!4479 () Bool)

(assert (=> b!193340 (= e!127216 tp_is_empty!4479)))

(declare-fun b!193341 () Bool)

(declare-datatypes ((SeekEntryResult!688 0))(
  ( (MissingZero!688 (index!4922 (_ BitVec 32))) (Found!688 (index!4923 (_ BitVec 32))) (Intermediate!688 (undefined!1500 Bool) (index!4924 (_ BitVec 32)) (x!20648 (_ BitVec 32))) (Undefined!688) (MissingVacant!688 (index!4925 (_ BitVec 32))) )
))
(declare-fun lt!96239 () SeekEntryResult!688)

(assert (=> b!193341 (= e!127219 (and (bvsge (index!4923 lt!96239) #b00000000000000000000000000000000) (bvslt (index!4923 lt!96239) (size!4187 (_keys!5936 thiss!1248)))))))

(declare-fun b!193342 () Bool)

(declare-datatypes ((Unit!5856 0))(
  ( (Unit!5857) )
))
(declare-fun e!127211 () Unit!5856)

(declare-fun lt!96238 () Unit!5856)

(assert (=> b!193342 (= e!127211 lt!96238)))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 64) Int) Unit!5856)

(assert (=> b!193342 (= lt!96238 (lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) key!828 (defaultEntry!3946 thiss!1248)))))

(declare-fun res!91362 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!193342 (= res!91362 (inRange!0 (index!4923 lt!96239) (mask!9197 thiss!1248)))))

(declare-fun e!127212 () Bool)

(assert (=> b!193342 (=> (not res!91362) (not e!127212))))

(assert (=> b!193342 e!127212))

(declare-fun b!193343 () Bool)

(declare-fun e!127214 () Bool)

(declare-fun mapRes!7745 () Bool)

(assert (=> b!193343 (= e!127214 (and e!127216 mapRes!7745))))

(declare-fun condMapEmpty!7745 () Bool)

(declare-fun mapDefault!7745 () ValueCell!1896)

(assert (=> b!193343 (= condMapEmpty!7745 (= (arr!3864 (_values!3929 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1896)) mapDefault!7745)))))

(declare-fun mapNonEmpty!7745 () Bool)

(declare-fun tp!16984 () Bool)

(declare-fun e!127217 () Bool)

(assert (=> mapNonEmpty!7745 (= mapRes!7745 (and tp!16984 e!127217))))

(declare-fun mapValue!7745 () ValueCell!1896)

(declare-fun mapKey!7745 () (_ BitVec 32))

(declare-fun mapRest!7745 () (Array (_ BitVec 32) ValueCell!1896))

(assert (=> mapNonEmpty!7745 (= (arr!3864 (_values!3929 thiss!1248)) (store mapRest!7745 mapKey!7745 mapValue!7745))))

(declare-fun b!193344 () Bool)

(assert (=> b!193344 (= e!127212 (= (select (arr!3863 (_keys!5936 thiss!1248)) (index!4923 lt!96239)) key!828))))

(declare-fun b!193345 () Bool)

(declare-fun Unit!5858 () Unit!5856)

(assert (=> b!193345 (= e!127211 Unit!5858)))

(declare-fun lt!96237 () Unit!5856)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!192 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 64) Int) Unit!5856)

(assert (=> b!193345 (= lt!96237 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!192 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) key!828 (defaultEntry!3946 thiss!1248)))))

(assert (=> b!193345 false))

(declare-fun b!193346 () Bool)

(declare-fun e!127220 () Bool)

(declare-fun e!127213 () Bool)

(assert (=> b!193346 (= e!127220 e!127213)))

(declare-fun res!91360 () Bool)

(assert (=> b!193346 (=> (not res!91360) (not e!127213))))

(get-info :version)

(assert (=> b!193346 (= res!91360 (and (not ((_ is Undefined!688) lt!96239)) (not ((_ is MissingVacant!688) lt!96239)) (not ((_ is MissingZero!688) lt!96239)) ((_ is Found!688) lt!96239)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8205 (_ BitVec 32)) SeekEntryResult!688)

(assert (=> b!193346 (= lt!96239 (seekEntryOrOpen!0 key!828 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)))))

(declare-fun b!193347 () Bool)

(assert (=> b!193347 (= e!127213 (not e!127219))))

(declare-fun res!91361 () Bool)

(assert (=> b!193347 (=> res!91361 e!127219)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!193347 (= res!91361 (not (validMask!0 (mask!9197 thiss!1248))))))

(declare-datatypes ((tuple2!3548 0))(
  ( (tuple2!3549 (_1!1785 (_ BitVec 64)) (_2!1785 V!5619)) )
))
(declare-datatypes ((List!2440 0))(
  ( (Nil!2437) (Cons!2436 (h!3077 tuple2!3548) (t!7362 List!2440)) )
))
(declare-datatypes ((ListLongMap!2465 0))(
  ( (ListLongMap!2466 (toList!1248 List!2440)) )
))
(declare-fun lt!96241 () ListLongMap!2465)

(declare-fun v!309 () V!5619)

(declare-fun +!316 (ListLongMap!2465 tuple2!3548) ListLongMap!2465)

(declare-fun getCurrentListMap!896 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 32) Int) ListLongMap!2465)

(assert (=> b!193347 (= (+!316 lt!96241 (tuple2!3549 key!828 v!309)) (getCurrentListMap!896 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96236 () Unit!5856)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!117 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 32) (_ BitVec 64) V!5619 Int) Unit!5856)

(assert (=> b!193347 (= lt!96236 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!117 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) (index!4923 lt!96239) key!828 v!309 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96240 () Unit!5856)

(assert (=> b!193347 (= lt!96240 e!127211)))

(declare-fun c!34868 () Bool)

(declare-fun contains!1369 (ListLongMap!2465 (_ BitVec 64)) Bool)

(assert (=> b!193347 (= c!34868 (contains!1369 lt!96241 key!828))))

(assert (=> b!193347 (= lt!96241 (getCurrentListMap!896 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun res!91363 () Bool)

(assert (=> start!19728 (=> (not res!91363) (not e!127220))))

(declare-fun valid!1108 (LongMapFixedSize!2700) Bool)

(assert (=> start!19728 (= res!91363 (valid!1108 thiss!1248))))

(assert (=> start!19728 e!127220))

(declare-fun e!127215 () Bool)

(assert (=> start!19728 e!127215))

(assert (=> start!19728 true))

(assert (=> start!19728 tp_is_empty!4479))

(declare-fun array_inv!2507 (array!8205) Bool)

(declare-fun array_inv!2508 (array!8207) Bool)

(assert (=> b!193348 (= e!127215 (and tp!16985 tp_is_empty!4479 (array_inv!2507 (_keys!5936 thiss!1248)) (array_inv!2508 (_values!3929 thiss!1248)) e!127214))))

(declare-fun b!193349 () Bool)

(declare-fun res!91366 () Bool)

(assert (=> b!193349 (=> (not res!91366) (not e!127220))))

(assert (=> b!193349 (= res!91366 (not (= key!828 (bvneg key!828))))))

(declare-fun b!193350 () Bool)

(assert (=> b!193350 (= e!127217 tp_is_empty!4479)))

(declare-fun b!193351 () Bool)

(declare-fun res!91365 () Bool)

(assert (=> b!193351 (=> res!91365 e!127219)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8205 (_ BitVec 32)) Bool)

(assert (=> b!193351 (= res!91365 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5936 thiss!1248) (mask!9197 thiss!1248))))))

(declare-fun mapIsEmpty!7745 () Bool)

(assert (=> mapIsEmpty!7745 mapRes!7745))

(declare-fun b!193352 () Bool)

(declare-fun res!91359 () Bool)

(assert (=> b!193352 (=> res!91359 e!127219)))

(assert (=> b!193352 (= res!91359 (or (not (= (size!4188 (_values!3929 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9197 thiss!1248)))) (not (= (size!4187 (_keys!5936 thiss!1248)) (size!4188 (_values!3929 thiss!1248)))) (bvslt (mask!9197 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3683 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3683 thiss!1248) #b00000000000000000000000000000011)))))

(assert (= (and start!19728 res!91363) b!193349))

(assert (= (and b!193349 res!91366) b!193346))

(assert (= (and b!193346 res!91360) b!193347))

(assert (= (and b!193347 c!34868) b!193342))

(assert (= (and b!193347 (not c!34868)) b!193345))

(assert (= (and b!193342 res!91362) b!193344))

(assert (= (and b!193347 (not res!91361)) b!193352))

(assert (= (and b!193352 (not res!91359)) b!193351))

(assert (= (and b!193351 (not res!91365)) b!193339))

(assert (= (and b!193339 (not res!91364)) b!193341))

(assert (= (and b!193343 condMapEmpty!7745) mapIsEmpty!7745))

(assert (= (and b!193343 (not condMapEmpty!7745)) mapNonEmpty!7745))

(assert (= (and mapNonEmpty!7745 ((_ is ValueCellFull!1896) mapValue!7745)) b!193350))

(assert (= (and b!193343 ((_ is ValueCellFull!1896) mapDefault!7745)) b!193340))

(assert (= b!193348 b!193343))

(assert (= start!19728 b!193348))

(declare-fun m!220135 () Bool)

(assert (=> b!193339 m!220135))

(declare-fun m!220137 () Bool)

(assert (=> b!193348 m!220137))

(declare-fun m!220139 () Bool)

(assert (=> b!193348 m!220139))

(declare-fun m!220141 () Bool)

(assert (=> b!193344 m!220141))

(declare-fun m!220143 () Bool)

(assert (=> b!193347 m!220143))

(declare-fun m!220145 () Bool)

(assert (=> b!193347 m!220145))

(declare-fun m!220147 () Bool)

(assert (=> b!193347 m!220147))

(declare-fun m!220149 () Bool)

(assert (=> b!193347 m!220149))

(declare-fun m!220151 () Bool)

(assert (=> b!193347 m!220151))

(declare-fun m!220153 () Bool)

(assert (=> b!193347 m!220153))

(declare-fun m!220155 () Bool)

(assert (=> b!193347 m!220155))

(declare-fun m!220157 () Bool)

(assert (=> b!193342 m!220157))

(declare-fun m!220159 () Bool)

(assert (=> b!193342 m!220159))

(declare-fun m!220161 () Bool)

(assert (=> b!193345 m!220161))

(declare-fun m!220163 () Bool)

(assert (=> start!19728 m!220163))

(declare-fun m!220165 () Bool)

(assert (=> b!193346 m!220165))

(declare-fun m!220167 () Bool)

(assert (=> mapNonEmpty!7745 m!220167))

(declare-fun m!220169 () Bool)

(assert (=> b!193351 m!220169))

(check-sat (not b_next!4707) (not b!193351) (not b!193345) b_and!11413 (not b!193339) tp_is_empty!4479 (not start!19728) (not b!193347) (not mapNonEmpty!7745) (not b!193342) (not b!193346) (not b!193348))
(check-sat b_and!11413 (not b_next!4707))
(get-model)

(declare-fun d!56573 () Bool)

(declare-fun res!91397 () Bool)

(declare-fun e!127253 () Bool)

(assert (=> d!56573 (=> (not res!91397) (not e!127253))))

(declare-fun simpleValid!202 (LongMapFixedSize!2700) Bool)

(assert (=> d!56573 (= res!91397 (simpleValid!202 thiss!1248))))

(assert (=> d!56573 (= (valid!1108 thiss!1248) e!127253)))

(declare-fun b!193401 () Bool)

(declare-fun res!91398 () Bool)

(assert (=> b!193401 (=> (not res!91398) (not e!127253))))

(declare-fun arrayCountValidKeys!0 (array!8205 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!193401 (= res!91398 (= (arrayCountValidKeys!0 (_keys!5936 thiss!1248) #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))) (_size!1399 thiss!1248)))))

(declare-fun b!193402 () Bool)

(declare-fun res!91399 () Bool)

(assert (=> b!193402 (=> (not res!91399) (not e!127253))))

(assert (=> b!193402 (= res!91399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)))))

(declare-fun b!193403 () Bool)

(assert (=> b!193403 (= e!127253 (arrayNoDuplicates!0 (_keys!5936 thiss!1248) #b00000000000000000000000000000000 Nil!2436))))

(assert (= (and d!56573 res!91397) b!193401))

(assert (= (and b!193401 res!91398) b!193402))

(assert (= (and b!193402 res!91399) b!193403))

(declare-fun m!220207 () Bool)

(assert (=> d!56573 m!220207))

(declare-fun m!220209 () Bool)

(assert (=> b!193401 m!220209))

(assert (=> b!193402 m!220169))

(assert (=> b!193403 m!220135))

(assert (=> start!19728 d!56573))

(declare-fun b!193446 () Bool)

(declare-fun e!127284 () Bool)

(declare-fun e!127281 () Bool)

(assert (=> b!193446 (= e!127284 e!127281)))

(declare-fun res!91421 () Bool)

(declare-fun call!19549 () Bool)

(assert (=> b!193446 (= res!91421 call!19549)))

(assert (=> b!193446 (=> (not res!91421) (not e!127281))))

(declare-fun bm!19541 () Bool)

(declare-fun lt!96323 () ListLongMap!2465)

(assert (=> bm!19541 (= call!19549 (contains!1369 lt!96323 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193447 () Bool)

(declare-fun res!91420 () Bool)

(declare-fun e!127292 () Bool)

(assert (=> b!193447 (=> (not res!91420) (not e!127292))))

(declare-fun e!127282 () Bool)

(assert (=> b!193447 (= res!91420 e!127282)))

(declare-fun res!91423 () Bool)

(assert (=> b!193447 (=> res!91423 e!127282)))

(declare-fun e!127280 () Bool)

(assert (=> b!193447 (= res!91423 (not e!127280))))

(declare-fun res!91425 () Bool)

(assert (=> b!193447 (=> (not res!91425) (not e!127280))))

(assert (=> b!193447 (= res!91425 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun b!193448 () Bool)

(declare-fun e!127291 () Bool)

(declare-fun e!127290 () Bool)

(assert (=> b!193448 (= e!127291 e!127290)))

(declare-fun res!91424 () Bool)

(declare-fun call!19546 () Bool)

(assert (=> b!193448 (= res!91424 call!19546)))

(assert (=> b!193448 (=> (not res!91424) (not e!127290))))

(declare-fun b!193449 () Bool)

(declare-fun apply!186 (ListLongMap!2465 (_ BitVec 64)) V!5619)

(assert (=> b!193449 (= e!127281 (= (apply!186 lt!96323 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3787 thiss!1248)))))

(declare-fun b!193450 () Bool)

(declare-fun res!91418 () Bool)

(assert (=> b!193450 (=> (not res!91418) (not e!127292))))

(assert (=> b!193450 (= res!91418 e!127291)))

(declare-fun c!34884 () Bool)

(assert (=> b!193450 (= c!34884 (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!56575 () Bool)

(assert (=> d!56575 e!127292))

(declare-fun res!91422 () Bool)

(assert (=> d!56575 (=> (not res!91422) (not e!127292))))

(assert (=> d!56575 (= res!91422 (or (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))))

(declare-fun lt!96320 () ListLongMap!2465)

(assert (=> d!56575 (= lt!96323 lt!96320)))

(declare-fun lt!96308 () Unit!5856)

(declare-fun e!127288 () Unit!5856)

(assert (=> d!56575 (= lt!96308 e!127288)))

(declare-fun c!34887 () Bool)

(declare-fun e!127283 () Bool)

(assert (=> d!56575 (= c!34887 e!127283)))

(declare-fun res!91426 () Bool)

(assert (=> d!56575 (=> (not res!91426) (not e!127283))))

(assert (=> d!56575 (= res!91426 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun e!127289 () ListLongMap!2465)

(assert (=> d!56575 (= lt!96320 e!127289)))

(declare-fun c!34888 () Bool)

(assert (=> d!56575 (= c!34888 (and (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56575 (validMask!0 (mask!9197 thiss!1248))))

(assert (=> d!56575 (= (getCurrentListMap!896 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)) lt!96323)))

(declare-fun b!193451 () Bool)

(declare-fun e!127286 () ListLongMap!2465)

(declare-fun call!19545 () ListLongMap!2465)

(assert (=> b!193451 (= e!127286 call!19545)))

(declare-fun bm!19542 () Bool)

(declare-fun call!19548 () ListLongMap!2465)

(declare-fun getCurrentListMapNoExtraKeys!219 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 32) Int) ListLongMap!2465)

(assert (=> bm!19542 (= call!19548 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun b!193452 () Bool)

(declare-fun e!127287 () Bool)

(assert (=> b!193452 (= e!127282 e!127287)))

(declare-fun res!91419 () Bool)

(assert (=> b!193452 (=> (not res!91419) (not e!127287))))

(assert (=> b!193452 (= res!91419 (contains!1369 lt!96323 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun b!193453 () Bool)

(declare-fun get!2231 (ValueCell!1896 V!5619) V!5619)

(declare-fun dynLambda!529 (Int (_ BitVec 64)) V!5619)

(assert (=> b!193453 (= e!127287 (= (apply!186 lt!96323 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3864 (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248)))) #b00000000000000000000000000000000) (dynLambda!529 (defaultEntry!3946 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))))))))

(assert (=> b!193453 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun b!193454 () Bool)

(declare-fun c!34889 () Bool)

(assert (=> b!193454 (= c!34889 (and (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127285 () ListLongMap!2465)

(assert (=> b!193454 (= e!127285 e!127286)))

(declare-fun b!193455 () Bool)

(assert (=> b!193455 (= e!127284 (not call!19549))))

(declare-fun b!193456 () Bool)

(assert (=> b!193456 (= e!127289 e!127285)))

(declare-fun c!34886 () Bool)

(assert (=> b!193456 (= c!34886 (and (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193457 () Bool)

(declare-fun call!19550 () ListLongMap!2465)

(assert (=> b!193457 (= e!127286 call!19550)))

(declare-fun b!193458 () Bool)

(declare-fun lt!96304 () Unit!5856)

(assert (=> b!193458 (= e!127288 lt!96304)))

(declare-fun lt!96310 () ListLongMap!2465)

(assert (=> b!193458 (= lt!96310 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96314 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96309 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96309 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96313 () Unit!5856)

(declare-fun addStillContains!162 (ListLongMap!2465 (_ BitVec 64) V!5619 (_ BitVec 64)) Unit!5856)

(assert (=> b!193458 (= lt!96313 (addStillContains!162 lt!96310 lt!96314 (zeroValue!3787 thiss!1248) lt!96309))))

(assert (=> b!193458 (contains!1369 (+!316 lt!96310 (tuple2!3549 lt!96314 (zeroValue!3787 thiss!1248))) lt!96309)))

(declare-fun lt!96316 () Unit!5856)

(assert (=> b!193458 (= lt!96316 lt!96313)))

(declare-fun lt!96318 () ListLongMap!2465)

(assert (=> b!193458 (= lt!96318 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96325 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96325 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96319 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96319 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96315 () Unit!5856)

(declare-fun addApplyDifferent!162 (ListLongMap!2465 (_ BitVec 64) V!5619 (_ BitVec 64)) Unit!5856)

(assert (=> b!193458 (= lt!96315 (addApplyDifferent!162 lt!96318 lt!96325 (minValue!3787 thiss!1248) lt!96319))))

(assert (=> b!193458 (= (apply!186 (+!316 lt!96318 (tuple2!3549 lt!96325 (minValue!3787 thiss!1248))) lt!96319) (apply!186 lt!96318 lt!96319))))

(declare-fun lt!96322 () Unit!5856)

(assert (=> b!193458 (= lt!96322 lt!96315)))

(declare-fun lt!96321 () ListLongMap!2465)

(assert (=> b!193458 (= lt!96321 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96324 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96324 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96306 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96306 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96312 () Unit!5856)

(assert (=> b!193458 (= lt!96312 (addApplyDifferent!162 lt!96321 lt!96324 (zeroValue!3787 thiss!1248) lt!96306))))

(assert (=> b!193458 (= (apply!186 (+!316 lt!96321 (tuple2!3549 lt!96324 (zeroValue!3787 thiss!1248))) lt!96306) (apply!186 lt!96321 lt!96306))))

(declare-fun lt!96311 () Unit!5856)

(assert (=> b!193458 (= lt!96311 lt!96312)))

(declare-fun lt!96307 () ListLongMap!2465)

(assert (=> b!193458 (= lt!96307 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96305 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96305 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96317 () (_ BitVec 64))

(assert (=> b!193458 (= lt!96317 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193458 (= lt!96304 (addApplyDifferent!162 lt!96307 lt!96305 (minValue!3787 thiss!1248) lt!96317))))

(assert (=> b!193458 (= (apply!186 (+!316 lt!96307 (tuple2!3549 lt!96305 (minValue!3787 thiss!1248))) lt!96317) (apply!186 lt!96307 lt!96317))))

(declare-fun b!193459 () Bool)

(assert (=> b!193459 (= e!127292 e!127284)))

(declare-fun c!34885 () Bool)

(assert (=> b!193459 (= c!34885 (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193460 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!193460 (= e!127283 (validKeyInArray!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19543 () Bool)

(declare-fun call!19544 () ListLongMap!2465)

(assert (=> bm!19543 (= call!19550 call!19544)))

(declare-fun call!19547 () ListLongMap!2465)

(declare-fun bm!19544 () Bool)

(assert (=> bm!19544 (= call!19547 (+!316 (ite c!34888 call!19548 (ite c!34886 call!19544 call!19550)) (ite (or c!34888 c!34886) (tuple2!3549 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3787 thiss!1248)) (tuple2!3549 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3787 thiss!1248)))))))

(declare-fun b!193461 () Bool)

(declare-fun Unit!5861 () Unit!5856)

(assert (=> b!193461 (= e!127288 Unit!5861)))

(declare-fun bm!19545 () Bool)

(assert (=> bm!19545 (= call!19545 call!19547)))

(declare-fun bm!19546 () Bool)

(assert (=> bm!19546 (= call!19546 (contains!1369 lt!96323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193462 () Bool)

(assert (=> b!193462 (= e!127285 call!19545)))

(declare-fun b!193463 () Bool)

(assert (=> b!193463 (= e!127280 (validKeyInArray!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193464 () Bool)

(assert (=> b!193464 (= e!127290 (= (apply!186 lt!96323 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3787 thiss!1248)))))

(declare-fun bm!19547 () Bool)

(assert (=> bm!19547 (= call!19544 call!19548)))

(declare-fun b!193465 () Bool)

(assert (=> b!193465 (= e!127289 (+!316 call!19547 (tuple2!3549 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3787 thiss!1248))))))

(declare-fun b!193466 () Bool)

(assert (=> b!193466 (= e!127291 (not call!19546))))

(assert (= (and d!56575 c!34888) b!193465))

(assert (= (and d!56575 (not c!34888)) b!193456))

(assert (= (and b!193456 c!34886) b!193462))

(assert (= (and b!193456 (not c!34886)) b!193454))

(assert (= (and b!193454 c!34889) b!193451))

(assert (= (and b!193454 (not c!34889)) b!193457))

(assert (= (or b!193451 b!193457) bm!19543))

(assert (= (or b!193462 bm!19543) bm!19547))

(assert (= (or b!193462 b!193451) bm!19545))

(assert (= (or b!193465 bm!19547) bm!19542))

(assert (= (or b!193465 bm!19545) bm!19544))

(assert (= (and d!56575 res!91426) b!193460))

(assert (= (and d!56575 c!34887) b!193458))

(assert (= (and d!56575 (not c!34887)) b!193461))

(assert (= (and d!56575 res!91422) b!193447))

(assert (= (and b!193447 res!91425) b!193463))

(assert (= (and b!193447 (not res!91423)) b!193452))

(assert (= (and b!193452 res!91419) b!193453))

(assert (= (and b!193447 res!91420) b!193450))

(assert (= (and b!193450 c!34884) b!193448))

(assert (= (and b!193450 (not c!34884)) b!193466))

(assert (= (and b!193448 res!91424) b!193464))

(assert (= (or b!193448 b!193466) bm!19546))

(assert (= (and b!193450 res!91418) b!193459))

(assert (= (and b!193459 c!34885) b!193446))

(assert (= (and b!193459 (not c!34885)) b!193455))

(assert (= (and b!193446 res!91421) b!193449))

(assert (= (or b!193446 b!193455) bm!19541))

(declare-fun b_lambda!7463 () Bool)

(assert (=> (not b_lambda!7463) (not b!193453)))

(declare-fun t!7366 () Bool)

(declare-fun tb!2883 () Bool)

(assert (=> (and b!193348 (= (defaultEntry!3946 thiss!1248) (defaultEntry!3946 thiss!1248)) t!7366) tb!2883))

(declare-fun result!4927 () Bool)

(assert (=> tb!2883 (= result!4927 tp_is_empty!4479)))

(assert (=> b!193453 t!7366))

(declare-fun b_and!11417 () Bool)

(assert (= b_and!11413 (and (=> t!7366 result!4927) b_and!11417)))

(assert (=> d!56575 m!220155))

(declare-fun m!220211 () Bool)

(assert (=> b!193449 m!220211))

(declare-fun m!220213 () Bool)

(assert (=> bm!19546 m!220213))

(declare-fun m!220215 () Bool)

(assert (=> bm!19542 m!220215))

(declare-fun m!220217 () Bool)

(assert (=> bm!19541 m!220217))

(declare-fun m!220219 () Bool)

(assert (=> b!193452 m!220219))

(assert (=> b!193452 m!220219))

(declare-fun m!220221 () Bool)

(assert (=> b!193452 m!220221))

(assert (=> b!193463 m!220219))

(assert (=> b!193463 m!220219))

(declare-fun m!220223 () Bool)

(assert (=> b!193463 m!220223))

(declare-fun m!220225 () Bool)

(assert (=> b!193465 m!220225))

(assert (=> b!193460 m!220219))

(assert (=> b!193460 m!220219))

(assert (=> b!193460 m!220223))

(declare-fun m!220227 () Bool)

(assert (=> bm!19544 m!220227))

(declare-fun m!220229 () Bool)

(assert (=> b!193464 m!220229))

(declare-fun m!220231 () Bool)

(assert (=> b!193453 m!220231))

(declare-fun m!220233 () Bool)

(assert (=> b!193453 m!220233))

(declare-fun m!220235 () Bool)

(assert (=> b!193453 m!220235))

(assert (=> b!193453 m!220231))

(assert (=> b!193453 m!220219))

(declare-fun m!220237 () Bool)

(assert (=> b!193453 m!220237))

(assert (=> b!193453 m!220233))

(assert (=> b!193453 m!220219))

(declare-fun m!220239 () Bool)

(assert (=> b!193458 m!220239))

(declare-fun m!220241 () Bool)

(assert (=> b!193458 m!220241))

(assert (=> b!193458 m!220241))

(declare-fun m!220243 () Bool)

(assert (=> b!193458 m!220243))

(declare-fun m!220245 () Bool)

(assert (=> b!193458 m!220245))

(declare-fun m!220247 () Bool)

(assert (=> b!193458 m!220247))

(declare-fun m!220249 () Bool)

(assert (=> b!193458 m!220249))

(declare-fun m!220251 () Bool)

(assert (=> b!193458 m!220251))

(declare-fun m!220253 () Bool)

(assert (=> b!193458 m!220253))

(declare-fun m!220255 () Bool)

(assert (=> b!193458 m!220255))

(assert (=> b!193458 m!220253))

(declare-fun m!220257 () Bool)

(assert (=> b!193458 m!220257))

(assert (=> b!193458 m!220249))

(declare-fun m!220259 () Bool)

(assert (=> b!193458 m!220259))

(declare-fun m!220261 () Bool)

(assert (=> b!193458 m!220261))

(declare-fun m!220263 () Bool)

(assert (=> b!193458 m!220263))

(assert (=> b!193458 m!220247))

(declare-fun m!220265 () Bool)

(assert (=> b!193458 m!220265))

(declare-fun m!220267 () Bool)

(assert (=> b!193458 m!220267))

(assert (=> b!193458 m!220219))

(assert (=> b!193458 m!220215))

(assert (=> b!193347 d!56575))

(declare-fun d!56577 () Bool)

(assert (=> d!56577 (= (validMask!0 (mask!9197 thiss!1248)) (and (or (= (mask!9197 thiss!1248) #b00000000000000000000000000000111) (= (mask!9197 thiss!1248) #b00000000000000000000000000001111) (= (mask!9197 thiss!1248) #b00000000000000000000000000011111) (= (mask!9197 thiss!1248) #b00000000000000000000000000111111) (= (mask!9197 thiss!1248) #b00000000000000000000000001111111) (= (mask!9197 thiss!1248) #b00000000000000000000000011111111) (= (mask!9197 thiss!1248) #b00000000000000000000000111111111) (= (mask!9197 thiss!1248) #b00000000000000000000001111111111) (= (mask!9197 thiss!1248) #b00000000000000000000011111111111) (= (mask!9197 thiss!1248) #b00000000000000000000111111111111) (= (mask!9197 thiss!1248) #b00000000000000000001111111111111) (= (mask!9197 thiss!1248) #b00000000000000000011111111111111) (= (mask!9197 thiss!1248) #b00000000000000000111111111111111) (= (mask!9197 thiss!1248) #b00000000000000001111111111111111) (= (mask!9197 thiss!1248) #b00000000000000011111111111111111) (= (mask!9197 thiss!1248) #b00000000000000111111111111111111) (= (mask!9197 thiss!1248) #b00000000000001111111111111111111) (= (mask!9197 thiss!1248) #b00000000000011111111111111111111) (= (mask!9197 thiss!1248) #b00000000000111111111111111111111) (= (mask!9197 thiss!1248) #b00000000001111111111111111111111) (= (mask!9197 thiss!1248) #b00000000011111111111111111111111) (= (mask!9197 thiss!1248) #b00000000111111111111111111111111) (= (mask!9197 thiss!1248) #b00000001111111111111111111111111) (= (mask!9197 thiss!1248) #b00000011111111111111111111111111) (= (mask!9197 thiss!1248) #b00000111111111111111111111111111) (= (mask!9197 thiss!1248) #b00001111111111111111111111111111) (= (mask!9197 thiss!1248) #b00011111111111111111111111111111) (= (mask!9197 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!9197 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!193347 d!56577))

(declare-fun d!56579 () Bool)

(declare-fun e!127297 () Bool)

(assert (=> d!56579 e!127297))

(declare-fun res!91429 () Bool)

(assert (=> d!56579 (=> res!91429 e!127297)))

(declare-fun lt!96336 () Bool)

(assert (=> d!56579 (= res!91429 (not lt!96336))))

(declare-fun lt!96334 () Bool)

(assert (=> d!56579 (= lt!96336 lt!96334)))

(declare-fun lt!96335 () Unit!5856)

(declare-fun e!127298 () Unit!5856)

(assert (=> d!56579 (= lt!96335 e!127298)))

(declare-fun c!34892 () Bool)

(assert (=> d!56579 (= c!34892 lt!96334)))

(declare-fun containsKey!247 (List!2440 (_ BitVec 64)) Bool)

(assert (=> d!56579 (= lt!96334 (containsKey!247 (toList!1248 lt!96241) key!828))))

(assert (=> d!56579 (= (contains!1369 lt!96241 key!828) lt!96336)))

(declare-fun b!193475 () Bool)

(declare-fun lt!96337 () Unit!5856)

(assert (=> b!193475 (= e!127298 lt!96337)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!195 (List!2440 (_ BitVec 64)) Unit!5856)

(assert (=> b!193475 (= lt!96337 (lemmaContainsKeyImpliesGetValueByKeyDefined!195 (toList!1248 lt!96241) key!828))))

(declare-datatypes ((Option!249 0))(
  ( (Some!248 (v!4244 V!5619)) (None!247) )
))
(declare-fun isDefined!196 (Option!249) Bool)

(declare-fun getValueByKey!243 (List!2440 (_ BitVec 64)) Option!249)

(assert (=> b!193475 (isDefined!196 (getValueByKey!243 (toList!1248 lt!96241) key!828))))

(declare-fun b!193476 () Bool)

(declare-fun Unit!5862 () Unit!5856)

(assert (=> b!193476 (= e!127298 Unit!5862)))

(declare-fun b!193477 () Bool)

(assert (=> b!193477 (= e!127297 (isDefined!196 (getValueByKey!243 (toList!1248 lt!96241) key!828)))))

(assert (= (and d!56579 c!34892) b!193475))

(assert (= (and d!56579 (not c!34892)) b!193476))

(assert (= (and d!56579 (not res!91429)) b!193477))

(declare-fun m!220269 () Bool)

(assert (=> d!56579 m!220269))

(declare-fun m!220271 () Bool)

(assert (=> b!193475 m!220271))

(declare-fun m!220273 () Bool)

(assert (=> b!193475 m!220273))

(assert (=> b!193475 m!220273))

(declare-fun m!220275 () Bool)

(assert (=> b!193475 m!220275))

(assert (=> b!193477 m!220273))

(assert (=> b!193477 m!220273))

(assert (=> b!193477 m!220275))

(assert (=> b!193347 d!56579))

(declare-fun d!56581 () Bool)

(declare-fun e!127301 () Bool)

(assert (=> d!56581 e!127301))

(declare-fun res!91435 () Bool)

(assert (=> d!56581 (=> (not res!91435) (not e!127301))))

(declare-fun lt!96346 () ListLongMap!2465)

(assert (=> d!56581 (= res!91435 (contains!1369 lt!96346 (_1!1785 (tuple2!3549 key!828 v!309))))))

(declare-fun lt!96347 () List!2440)

(assert (=> d!56581 (= lt!96346 (ListLongMap!2466 lt!96347))))

(declare-fun lt!96349 () Unit!5856)

(declare-fun lt!96348 () Unit!5856)

(assert (=> d!56581 (= lt!96349 lt!96348)))

(assert (=> d!56581 (= (getValueByKey!243 lt!96347 (_1!1785 (tuple2!3549 key!828 v!309))) (Some!248 (_2!1785 (tuple2!3549 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!130 (List!2440 (_ BitVec 64) V!5619) Unit!5856)

(assert (=> d!56581 (= lt!96348 (lemmaContainsTupThenGetReturnValue!130 lt!96347 (_1!1785 (tuple2!3549 key!828 v!309)) (_2!1785 (tuple2!3549 key!828 v!309))))))

(declare-fun insertStrictlySorted!133 (List!2440 (_ BitVec 64) V!5619) List!2440)

(assert (=> d!56581 (= lt!96347 (insertStrictlySorted!133 (toList!1248 lt!96241) (_1!1785 (tuple2!3549 key!828 v!309)) (_2!1785 (tuple2!3549 key!828 v!309))))))

(assert (=> d!56581 (= (+!316 lt!96241 (tuple2!3549 key!828 v!309)) lt!96346)))

(declare-fun b!193482 () Bool)

(declare-fun res!91434 () Bool)

(assert (=> b!193482 (=> (not res!91434) (not e!127301))))

(assert (=> b!193482 (= res!91434 (= (getValueByKey!243 (toList!1248 lt!96346) (_1!1785 (tuple2!3549 key!828 v!309))) (Some!248 (_2!1785 (tuple2!3549 key!828 v!309)))))))

(declare-fun b!193483 () Bool)

(declare-fun contains!1371 (List!2440 tuple2!3548) Bool)

(assert (=> b!193483 (= e!127301 (contains!1371 (toList!1248 lt!96346) (tuple2!3549 key!828 v!309)))))

(assert (= (and d!56581 res!91435) b!193482))

(assert (= (and b!193482 res!91434) b!193483))

(declare-fun m!220277 () Bool)

(assert (=> d!56581 m!220277))

(declare-fun m!220279 () Bool)

(assert (=> d!56581 m!220279))

(declare-fun m!220281 () Bool)

(assert (=> d!56581 m!220281))

(declare-fun m!220283 () Bool)

(assert (=> d!56581 m!220283))

(declare-fun m!220285 () Bool)

(assert (=> b!193482 m!220285))

(declare-fun m!220287 () Bool)

(assert (=> b!193483 m!220287))

(assert (=> b!193347 d!56581))

(declare-fun b!193484 () Bool)

(declare-fun e!127306 () Bool)

(declare-fun e!127303 () Bool)

(assert (=> b!193484 (= e!127306 e!127303)))

(declare-fun res!91439 () Bool)

(declare-fun call!19556 () Bool)

(assert (=> b!193484 (= res!91439 call!19556)))

(assert (=> b!193484 (=> (not res!91439) (not e!127303))))

(declare-fun bm!19548 () Bool)

(declare-fun lt!96369 () ListLongMap!2465)

(assert (=> bm!19548 (= call!19556 (contains!1369 lt!96369 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193485 () Bool)

(declare-fun res!91438 () Bool)

(declare-fun e!127314 () Bool)

(assert (=> b!193485 (=> (not res!91438) (not e!127314))))

(declare-fun e!127304 () Bool)

(assert (=> b!193485 (= res!91438 e!127304)))

(declare-fun res!91441 () Bool)

(assert (=> b!193485 (=> res!91441 e!127304)))

(declare-fun e!127302 () Bool)

(assert (=> b!193485 (= res!91441 (not e!127302))))

(declare-fun res!91443 () Bool)

(assert (=> b!193485 (=> (not res!91443) (not e!127302))))

(assert (=> b!193485 (= res!91443 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun b!193486 () Bool)

(declare-fun e!127313 () Bool)

(declare-fun e!127312 () Bool)

(assert (=> b!193486 (= e!127313 e!127312)))

(declare-fun res!91442 () Bool)

(declare-fun call!19553 () Bool)

(assert (=> b!193486 (= res!91442 call!19553)))

(assert (=> b!193486 (=> (not res!91442) (not e!127312))))

(declare-fun b!193487 () Bool)

(assert (=> b!193487 (= e!127303 (= (apply!186 lt!96369 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3787 thiss!1248)))))

(declare-fun b!193488 () Bool)

(declare-fun res!91436 () Bool)

(assert (=> b!193488 (=> (not res!91436) (not e!127314))))

(assert (=> b!193488 (= res!91436 e!127313)))

(declare-fun c!34893 () Bool)

(assert (=> b!193488 (= c!34893 (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!56583 () Bool)

(assert (=> d!56583 e!127314))

(declare-fun res!91440 () Bool)

(assert (=> d!56583 (=> (not res!91440) (not e!127314))))

(assert (=> d!56583 (= res!91440 (or (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))))

(declare-fun lt!96366 () ListLongMap!2465)

(assert (=> d!56583 (= lt!96369 lt!96366)))

(declare-fun lt!96354 () Unit!5856)

(declare-fun e!127310 () Unit!5856)

(assert (=> d!56583 (= lt!96354 e!127310)))

(declare-fun c!34896 () Bool)

(declare-fun e!127305 () Bool)

(assert (=> d!56583 (= c!34896 e!127305)))

(declare-fun res!91444 () Bool)

(assert (=> d!56583 (=> (not res!91444) (not e!127305))))

(assert (=> d!56583 (= res!91444 (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun e!127311 () ListLongMap!2465)

(assert (=> d!56583 (= lt!96366 e!127311)))

(declare-fun c!34897 () Bool)

(assert (=> d!56583 (= c!34897 (and (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!56583 (validMask!0 (mask!9197 thiss!1248))))

(assert (=> d!56583 (= (getCurrentListMap!896 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)) lt!96369)))

(declare-fun b!193489 () Bool)

(declare-fun e!127308 () ListLongMap!2465)

(declare-fun call!19552 () ListLongMap!2465)

(assert (=> b!193489 (= e!127308 call!19552)))

(declare-fun bm!19549 () Bool)

(declare-fun call!19555 () ListLongMap!2465)

(assert (=> bm!19549 (= call!19555 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun b!193490 () Bool)

(declare-fun e!127309 () Bool)

(assert (=> b!193490 (= e!127304 e!127309)))

(declare-fun res!91437 () Bool)

(assert (=> b!193490 (=> (not res!91437) (not e!127309))))

(assert (=> b!193490 (= res!91437 (contains!1369 lt!96369 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!193490 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun b!193491 () Bool)

(assert (=> b!193491 (= e!127309 (= (apply!186 lt!96369 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)) (get!2231 (select (arr!3864 (_values!3929 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!529 (defaultEntry!3946 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!193491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4188 (_values!3929 thiss!1248))))))

(assert (=> b!193491 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun b!193492 () Bool)

(declare-fun c!34898 () Bool)

(assert (=> b!193492 (= c!34898 (and (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!127307 () ListLongMap!2465)

(assert (=> b!193492 (= e!127307 e!127308)))

(declare-fun b!193493 () Bool)

(assert (=> b!193493 (= e!127306 (not call!19556))))

(declare-fun b!193494 () Bool)

(assert (=> b!193494 (= e!127311 e!127307)))

(declare-fun c!34895 () Bool)

(assert (=> b!193494 (= c!34895 (and (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193495 () Bool)

(declare-fun call!19557 () ListLongMap!2465)

(assert (=> b!193495 (= e!127308 call!19557)))

(declare-fun b!193496 () Bool)

(declare-fun lt!96350 () Unit!5856)

(assert (=> b!193496 (= e!127310 lt!96350)))

(declare-fun lt!96356 () ListLongMap!2465)

(assert (=> b!193496 (= lt!96356 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96360 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96355 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96355 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96359 () Unit!5856)

(assert (=> b!193496 (= lt!96359 (addStillContains!162 lt!96356 lt!96360 (zeroValue!3787 thiss!1248) lt!96355))))

(assert (=> b!193496 (contains!1369 (+!316 lt!96356 (tuple2!3549 lt!96360 (zeroValue!3787 thiss!1248))) lt!96355)))

(declare-fun lt!96362 () Unit!5856)

(assert (=> b!193496 (= lt!96362 lt!96359)))

(declare-fun lt!96364 () ListLongMap!2465)

(assert (=> b!193496 (= lt!96364 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96371 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96371 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96365 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96365 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96361 () Unit!5856)

(assert (=> b!193496 (= lt!96361 (addApplyDifferent!162 lt!96364 lt!96371 (minValue!3787 thiss!1248) lt!96365))))

(assert (=> b!193496 (= (apply!186 (+!316 lt!96364 (tuple2!3549 lt!96371 (minValue!3787 thiss!1248))) lt!96365) (apply!186 lt!96364 lt!96365))))

(declare-fun lt!96368 () Unit!5856)

(assert (=> b!193496 (= lt!96368 lt!96361)))

(declare-fun lt!96367 () ListLongMap!2465)

(assert (=> b!193496 (= lt!96367 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96370 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96352 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96352 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96358 () Unit!5856)

(assert (=> b!193496 (= lt!96358 (addApplyDifferent!162 lt!96367 lt!96370 (zeroValue!3787 thiss!1248) lt!96352))))

(assert (=> b!193496 (= (apply!186 (+!316 lt!96367 (tuple2!3549 lt!96370 (zeroValue!3787 thiss!1248))) lt!96352) (apply!186 lt!96367 lt!96352))))

(declare-fun lt!96357 () Unit!5856)

(assert (=> b!193496 (= lt!96357 lt!96358)))

(declare-fun lt!96353 () ListLongMap!2465)

(assert (=> b!193496 (= lt!96353 (getCurrentListMapNoExtraKeys!219 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)))))

(declare-fun lt!96351 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96351 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!96363 () (_ BitVec 64))

(assert (=> b!193496 (= lt!96363 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193496 (= lt!96350 (addApplyDifferent!162 lt!96353 lt!96351 (minValue!3787 thiss!1248) lt!96363))))

(assert (=> b!193496 (= (apply!186 (+!316 lt!96353 (tuple2!3549 lt!96351 (minValue!3787 thiss!1248))) lt!96363) (apply!186 lt!96353 lt!96363))))

(declare-fun b!193497 () Bool)

(assert (=> b!193497 (= e!127314 e!127306)))

(declare-fun c!34894 () Bool)

(assert (=> b!193497 (= c!34894 (not (= (bvand (extraKeys!3683 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!193498 () Bool)

(assert (=> b!193498 (= e!127305 (validKeyInArray!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19550 () Bool)

(declare-fun call!19551 () ListLongMap!2465)

(assert (=> bm!19550 (= call!19557 call!19551)))

(declare-fun bm!19551 () Bool)

(declare-fun call!19554 () ListLongMap!2465)

(assert (=> bm!19551 (= call!19554 (+!316 (ite c!34897 call!19555 (ite c!34895 call!19551 call!19557)) (ite (or c!34897 c!34895) (tuple2!3549 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3787 thiss!1248)) (tuple2!3549 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3787 thiss!1248)))))))

(declare-fun b!193499 () Bool)

(declare-fun Unit!5863 () Unit!5856)

(assert (=> b!193499 (= e!127310 Unit!5863)))

(declare-fun bm!19552 () Bool)

(assert (=> bm!19552 (= call!19552 call!19554)))

(declare-fun bm!19553 () Bool)

(assert (=> bm!19553 (= call!19553 (contains!1369 lt!96369 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!193500 () Bool)

(assert (=> b!193500 (= e!127307 call!19552)))

(declare-fun b!193501 () Bool)

(assert (=> b!193501 (= e!127302 (validKeyInArray!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193502 () Bool)

(assert (=> b!193502 (= e!127312 (= (apply!186 lt!96369 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3787 thiss!1248)))))

(declare-fun bm!19554 () Bool)

(assert (=> bm!19554 (= call!19551 call!19555)))

(declare-fun b!193503 () Bool)

(assert (=> b!193503 (= e!127311 (+!316 call!19554 (tuple2!3549 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3787 thiss!1248))))))

(declare-fun b!193504 () Bool)

(assert (=> b!193504 (= e!127313 (not call!19553))))

(assert (= (and d!56583 c!34897) b!193503))

(assert (= (and d!56583 (not c!34897)) b!193494))

(assert (= (and b!193494 c!34895) b!193500))

(assert (= (and b!193494 (not c!34895)) b!193492))

(assert (= (and b!193492 c!34898) b!193489))

(assert (= (and b!193492 (not c!34898)) b!193495))

(assert (= (or b!193489 b!193495) bm!19550))

(assert (= (or b!193500 bm!19550) bm!19554))

(assert (= (or b!193500 b!193489) bm!19552))

(assert (= (or b!193503 bm!19554) bm!19549))

(assert (= (or b!193503 bm!19552) bm!19551))

(assert (= (and d!56583 res!91444) b!193498))

(assert (= (and d!56583 c!34896) b!193496))

(assert (= (and d!56583 (not c!34896)) b!193499))

(assert (= (and d!56583 res!91440) b!193485))

(assert (= (and b!193485 res!91443) b!193501))

(assert (= (and b!193485 (not res!91441)) b!193490))

(assert (= (and b!193490 res!91437) b!193491))

(assert (= (and b!193485 res!91438) b!193488))

(assert (= (and b!193488 c!34893) b!193486))

(assert (= (and b!193488 (not c!34893)) b!193504))

(assert (= (and b!193486 res!91442) b!193502))

(assert (= (or b!193486 b!193504) bm!19553))

(assert (= (and b!193488 res!91436) b!193497))

(assert (= (and b!193497 c!34894) b!193484))

(assert (= (and b!193497 (not c!34894)) b!193493))

(assert (= (and b!193484 res!91439) b!193487))

(assert (= (or b!193484 b!193493) bm!19548))

(declare-fun b_lambda!7465 () Bool)

(assert (=> (not b_lambda!7465) (not b!193491)))

(assert (=> b!193491 t!7366))

(declare-fun b_and!11419 () Bool)

(assert (= b_and!11417 (and (=> t!7366 result!4927) b_and!11419)))

(assert (=> d!56583 m!220155))

(declare-fun m!220289 () Bool)

(assert (=> b!193487 m!220289))

(declare-fun m!220291 () Bool)

(assert (=> bm!19553 m!220291))

(declare-fun m!220293 () Bool)

(assert (=> bm!19549 m!220293))

(declare-fun m!220295 () Bool)

(assert (=> bm!19548 m!220295))

(assert (=> b!193490 m!220219))

(assert (=> b!193490 m!220219))

(declare-fun m!220297 () Bool)

(assert (=> b!193490 m!220297))

(assert (=> b!193501 m!220219))

(assert (=> b!193501 m!220219))

(assert (=> b!193501 m!220223))

(declare-fun m!220299 () Bool)

(assert (=> b!193503 m!220299))

(assert (=> b!193498 m!220219))

(assert (=> b!193498 m!220219))

(assert (=> b!193498 m!220223))

(declare-fun m!220301 () Bool)

(assert (=> bm!19551 m!220301))

(declare-fun m!220303 () Bool)

(assert (=> b!193502 m!220303))

(declare-fun m!220305 () Bool)

(assert (=> b!193491 m!220305))

(assert (=> b!193491 m!220233))

(declare-fun m!220307 () Bool)

(assert (=> b!193491 m!220307))

(assert (=> b!193491 m!220305))

(assert (=> b!193491 m!220219))

(declare-fun m!220309 () Bool)

(assert (=> b!193491 m!220309))

(assert (=> b!193491 m!220233))

(assert (=> b!193491 m!220219))

(declare-fun m!220311 () Bool)

(assert (=> b!193496 m!220311))

(declare-fun m!220313 () Bool)

(assert (=> b!193496 m!220313))

(assert (=> b!193496 m!220313))

(declare-fun m!220315 () Bool)

(assert (=> b!193496 m!220315))

(declare-fun m!220317 () Bool)

(assert (=> b!193496 m!220317))

(declare-fun m!220319 () Bool)

(assert (=> b!193496 m!220319))

(declare-fun m!220321 () Bool)

(assert (=> b!193496 m!220321))

(declare-fun m!220323 () Bool)

(assert (=> b!193496 m!220323))

(declare-fun m!220325 () Bool)

(assert (=> b!193496 m!220325))

(declare-fun m!220327 () Bool)

(assert (=> b!193496 m!220327))

(assert (=> b!193496 m!220325))

(declare-fun m!220329 () Bool)

(assert (=> b!193496 m!220329))

(assert (=> b!193496 m!220321))

(declare-fun m!220331 () Bool)

(assert (=> b!193496 m!220331))

(declare-fun m!220333 () Bool)

(assert (=> b!193496 m!220333))

(declare-fun m!220335 () Bool)

(assert (=> b!193496 m!220335))

(assert (=> b!193496 m!220319))

(declare-fun m!220337 () Bool)

(assert (=> b!193496 m!220337))

(declare-fun m!220339 () Bool)

(assert (=> b!193496 m!220339))

(assert (=> b!193496 m!220219))

(assert (=> b!193496 m!220293))

(assert (=> b!193347 d!56583))

(declare-fun d!56585 () Bool)

(declare-fun e!127317 () Bool)

(assert (=> d!56585 e!127317))

(declare-fun res!91447 () Bool)

(assert (=> d!56585 (=> (not res!91447) (not e!127317))))

(assert (=> d!56585 (= res!91447 (and (bvsge (index!4923 lt!96239) #b00000000000000000000000000000000) (bvslt (index!4923 lt!96239) (size!4188 (_values!3929 thiss!1248)))))))

(declare-fun lt!96374 () Unit!5856)

(declare-fun choose!1057 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 32) (_ BitVec 64) V!5619 Int) Unit!5856)

(assert (=> d!56585 (= lt!96374 (choose!1057 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) (index!4923 lt!96239) key!828 v!309 (defaultEntry!3946 thiss!1248)))))

(assert (=> d!56585 (validMask!0 (mask!9197 thiss!1248))))

(assert (=> d!56585 (= (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!117 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) (index!4923 lt!96239) key!828 v!309 (defaultEntry!3946 thiss!1248)) lt!96374)))

(declare-fun b!193507 () Bool)

(assert (=> b!193507 (= e!127317 (= (+!316 (getCurrentListMap!896 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248)) (tuple2!3549 key!828 v!309)) (getCurrentListMap!896 (_keys!5936 thiss!1248) (array!8208 (store (arr!3864 (_values!3929 thiss!1248)) (index!4923 lt!96239) (ValueCellFull!1896 v!309)) (size!4188 (_values!3929 thiss!1248))) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3946 thiss!1248))))))

(assert (= (and d!56585 res!91447) b!193507))

(declare-fun m!220341 () Bool)

(assert (=> d!56585 m!220341))

(assert (=> d!56585 m!220155))

(assert (=> b!193507 m!220145))

(assert (=> b!193507 m!220145))

(declare-fun m!220343 () Bool)

(assert (=> b!193507 m!220343))

(assert (=> b!193507 m!220149))

(assert (=> b!193507 m!220147))

(assert (=> b!193347 d!56585))

(declare-fun d!56587 () Bool)

(declare-fun e!127320 () Bool)

(assert (=> d!56587 e!127320))

(declare-fun res!91453 () Bool)

(assert (=> d!56587 (=> (not res!91453) (not e!127320))))

(declare-fun lt!96380 () SeekEntryResult!688)

(assert (=> d!56587 (= res!91453 ((_ is Found!688) lt!96380))))

(assert (=> d!56587 (= lt!96380 (seekEntryOrOpen!0 key!828 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)))))

(declare-fun lt!96379 () Unit!5856)

(declare-fun choose!1058 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 64) Int) Unit!5856)

(assert (=> d!56587 (= lt!96379 (choose!1058 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) key!828 (defaultEntry!3946 thiss!1248)))))

(assert (=> d!56587 (validMask!0 (mask!9197 thiss!1248))))

(assert (=> d!56587 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!182 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) key!828 (defaultEntry!3946 thiss!1248)) lt!96379)))

(declare-fun b!193512 () Bool)

(declare-fun res!91452 () Bool)

(assert (=> b!193512 (=> (not res!91452) (not e!127320))))

(assert (=> b!193512 (= res!91452 (inRange!0 (index!4923 lt!96380) (mask!9197 thiss!1248)))))

(declare-fun b!193513 () Bool)

(assert (=> b!193513 (= e!127320 (= (select (arr!3863 (_keys!5936 thiss!1248)) (index!4923 lt!96380)) key!828))))

(assert (=> b!193513 (and (bvsge (index!4923 lt!96380) #b00000000000000000000000000000000) (bvslt (index!4923 lt!96380) (size!4187 (_keys!5936 thiss!1248))))))

(assert (= (and d!56587 res!91453) b!193512))

(assert (= (and b!193512 res!91452) b!193513))

(assert (=> d!56587 m!220165))

(declare-fun m!220345 () Bool)

(assert (=> d!56587 m!220345))

(assert (=> d!56587 m!220155))

(declare-fun m!220347 () Bool)

(assert (=> b!193512 m!220347))

(declare-fun m!220349 () Bool)

(assert (=> b!193513 m!220349))

(assert (=> b!193342 d!56587))

(declare-fun d!56589 () Bool)

(assert (=> d!56589 (= (inRange!0 (index!4923 lt!96239) (mask!9197 thiss!1248)) (and (bvsge (index!4923 lt!96239) #b00000000000000000000000000000000) (bvslt (index!4923 lt!96239) (bvadd (mask!9197 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!193342 d!56589))

(declare-fun d!56591 () Bool)

(declare-fun lt!96388 () SeekEntryResult!688)

(assert (=> d!56591 (and (or ((_ is Undefined!688) lt!96388) (not ((_ is Found!688) lt!96388)) (and (bvsge (index!4923 lt!96388) #b00000000000000000000000000000000) (bvslt (index!4923 lt!96388) (size!4187 (_keys!5936 thiss!1248))))) (or ((_ is Undefined!688) lt!96388) ((_ is Found!688) lt!96388) (not ((_ is MissingZero!688) lt!96388)) (and (bvsge (index!4922 lt!96388) #b00000000000000000000000000000000) (bvslt (index!4922 lt!96388) (size!4187 (_keys!5936 thiss!1248))))) (or ((_ is Undefined!688) lt!96388) ((_ is Found!688) lt!96388) ((_ is MissingZero!688) lt!96388) (not ((_ is MissingVacant!688) lt!96388)) (and (bvsge (index!4925 lt!96388) #b00000000000000000000000000000000) (bvslt (index!4925 lt!96388) (size!4187 (_keys!5936 thiss!1248))))) (or ((_ is Undefined!688) lt!96388) (ite ((_ is Found!688) lt!96388) (= (select (arr!3863 (_keys!5936 thiss!1248)) (index!4923 lt!96388)) key!828) (ite ((_ is MissingZero!688) lt!96388) (= (select (arr!3863 (_keys!5936 thiss!1248)) (index!4922 lt!96388)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!688) lt!96388) (= (select (arr!3863 (_keys!5936 thiss!1248)) (index!4925 lt!96388)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!127328 () SeekEntryResult!688)

(assert (=> d!56591 (= lt!96388 e!127328)))

(declare-fun c!34905 () Bool)

(declare-fun lt!96387 () SeekEntryResult!688)

(assert (=> d!56591 (= c!34905 (and ((_ is Intermediate!688) lt!96387) (undefined!1500 lt!96387)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8205 (_ BitVec 32)) SeekEntryResult!688)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!56591 (= lt!96387 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9197 thiss!1248)) key!828 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)))))

(assert (=> d!56591 (validMask!0 (mask!9197 thiss!1248))))

(assert (=> d!56591 (= (seekEntryOrOpen!0 key!828 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)) lt!96388)))

(declare-fun b!193526 () Bool)

(declare-fun c!34906 () Bool)

(declare-fun lt!96389 () (_ BitVec 64))

(assert (=> b!193526 (= c!34906 (= lt!96389 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127327 () SeekEntryResult!688)

(declare-fun e!127329 () SeekEntryResult!688)

(assert (=> b!193526 (= e!127327 e!127329)))

(declare-fun b!193527 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8205 (_ BitVec 32)) SeekEntryResult!688)

(assert (=> b!193527 (= e!127329 (seekKeyOrZeroReturnVacant!0 (x!20648 lt!96387) (index!4924 lt!96387) (index!4924 lt!96387) key!828 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)))))

(declare-fun b!193528 () Bool)

(assert (=> b!193528 (= e!127329 (MissingZero!688 (index!4924 lt!96387)))))

(declare-fun b!193529 () Bool)

(assert (=> b!193529 (= e!127328 e!127327)))

(assert (=> b!193529 (= lt!96389 (select (arr!3863 (_keys!5936 thiss!1248)) (index!4924 lt!96387)))))

(declare-fun c!34907 () Bool)

(assert (=> b!193529 (= c!34907 (= lt!96389 key!828))))

(declare-fun b!193530 () Bool)

(assert (=> b!193530 (= e!127327 (Found!688 (index!4924 lt!96387)))))

(declare-fun b!193531 () Bool)

(assert (=> b!193531 (= e!127328 Undefined!688)))

(assert (= (and d!56591 c!34905) b!193531))

(assert (= (and d!56591 (not c!34905)) b!193529))

(assert (= (and b!193529 c!34907) b!193530))

(assert (= (and b!193529 (not c!34907)) b!193526))

(assert (= (and b!193526 c!34906) b!193528))

(assert (= (and b!193526 (not c!34906)) b!193527))

(declare-fun m!220351 () Bool)

(assert (=> d!56591 m!220351))

(declare-fun m!220353 () Bool)

(assert (=> d!56591 m!220353))

(assert (=> d!56591 m!220155))

(declare-fun m!220355 () Bool)

(assert (=> d!56591 m!220355))

(declare-fun m!220357 () Bool)

(assert (=> d!56591 m!220357))

(assert (=> d!56591 m!220355))

(declare-fun m!220359 () Bool)

(assert (=> d!56591 m!220359))

(declare-fun m!220361 () Bool)

(assert (=> b!193527 m!220361))

(declare-fun m!220363 () Bool)

(assert (=> b!193529 m!220363))

(assert (=> b!193346 d!56591))

(declare-fun b!193540 () Bool)

(declare-fun e!127337 () Bool)

(declare-fun e!127336 () Bool)

(assert (=> b!193540 (= e!127337 e!127336)))

(declare-fun c!34910 () Bool)

(assert (=> b!193540 (= c!34910 (validKeyInArray!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!19557 () Bool)

(declare-fun call!19560 () Bool)

(assert (=> bm!19557 (= call!19560 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5936 thiss!1248) (mask!9197 thiss!1248)))))

(declare-fun d!56593 () Bool)

(declare-fun res!91458 () Bool)

(assert (=> d!56593 (=> res!91458 e!127337)))

(assert (=> d!56593 (= res!91458 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(assert (=> d!56593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)) e!127337)))

(declare-fun b!193541 () Bool)

(declare-fun e!127338 () Bool)

(assert (=> b!193541 (= e!127336 e!127338)))

(declare-fun lt!96396 () (_ BitVec 64))

(assert (=> b!193541 (= lt!96396 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!96397 () Unit!5856)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8205 (_ BitVec 64) (_ BitVec 32)) Unit!5856)

(assert (=> b!193541 (= lt!96397 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5936 thiss!1248) lt!96396 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!193541 (arrayContainsKey!0 (_keys!5936 thiss!1248) lt!96396 #b00000000000000000000000000000000)))

(declare-fun lt!96398 () Unit!5856)

(assert (=> b!193541 (= lt!96398 lt!96397)))

(declare-fun res!91459 () Bool)

(assert (=> b!193541 (= res!91459 (= (seekEntryOrOpen!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000) (_keys!5936 thiss!1248) (mask!9197 thiss!1248)) (Found!688 #b00000000000000000000000000000000)))))

(assert (=> b!193541 (=> (not res!91459) (not e!127338))))

(declare-fun b!193542 () Bool)

(assert (=> b!193542 (= e!127336 call!19560)))

(declare-fun b!193543 () Bool)

(assert (=> b!193543 (= e!127338 call!19560)))

(assert (= (and d!56593 (not res!91458)) b!193540))

(assert (= (and b!193540 c!34910) b!193541))

(assert (= (and b!193540 (not c!34910)) b!193542))

(assert (= (and b!193541 res!91459) b!193543))

(assert (= (or b!193543 b!193542) bm!19557))

(assert (=> b!193540 m!220219))

(assert (=> b!193540 m!220219))

(assert (=> b!193540 m!220223))

(declare-fun m!220365 () Bool)

(assert (=> bm!19557 m!220365))

(assert (=> b!193541 m!220219))

(declare-fun m!220367 () Bool)

(assert (=> b!193541 m!220367))

(declare-fun m!220369 () Bool)

(assert (=> b!193541 m!220369))

(assert (=> b!193541 m!220219))

(declare-fun m!220371 () Bool)

(assert (=> b!193541 m!220371))

(assert (=> b!193351 d!56593))

(declare-fun b!193560 () Bool)

(declare-fun lt!96404 () SeekEntryResult!688)

(assert (=> b!193560 (and (bvsge (index!4922 lt!96404) #b00000000000000000000000000000000) (bvslt (index!4922 lt!96404) (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun res!91471 () Bool)

(assert (=> b!193560 (= res!91471 (= (select (arr!3863 (_keys!5936 thiss!1248)) (index!4922 lt!96404)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!127350 () Bool)

(assert (=> b!193560 (=> (not res!91471) (not e!127350))))

(declare-fun b!193561 () Bool)

(declare-fun call!19566 () Bool)

(assert (=> b!193561 (= e!127350 (not call!19566))))

(declare-fun d!56595 () Bool)

(declare-fun e!127349 () Bool)

(assert (=> d!56595 e!127349))

(declare-fun c!34915 () Bool)

(assert (=> d!56595 (= c!34915 ((_ is MissingZero!688) lt!96404))))

(assert (=> d!56595 (= lt!96404 (seekEntryOrOpen!0 key!828 (_keys!5936 thiss!1248) (mask!9197 thiss!1248)))))

(declare-fun lt!96403 () Unit!5856)

(declare-fun choose!1059 (array!8205 array!8207 (_ BitVec 32) (_ BitVec 32) V!5619 V!5619 (_ BitVec 64) Int) Unit!5856)

(assert (=> d!56595 (= lt!96403 (choose!1059 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) key!828 (defaultEntry!3946 thiss!1248)))))

(assert (=> d!56595 (validMask!0 (mask!9197 thiss!1248))))

(assert (=> d!56595 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!192 (_keys!5936 thiss!1248) (_values!3929 thiss!1248) (mask!9197 thiss!1248) (extraKeys!3683 thiss!1248) (zeroValue!3787 thiss!1248) (minValue!3787 thiss!1248) key!828 (defaultEntry!3946 thiss!1248)) lt!96403)))

(declare-fun b!193562 () Bool)

(declare-fun e!127348 () Bool)

(assert (=> b!193562 (= e!127349 e!127348)))

(declare-fun c!34916 () Bool)

(assert (=> b!193562 (= c!34916 ((_ is MissingVacant!688) lt!96404))))

(declare-fun bm!19562 () Bool)

(assert (=> bm!19562 (= call!19566 (arrayContainsKey!0 (_keys!5936 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!193563 () Bool)

(assert (=> b!193563 (= e!127349 e!127350)))

(declare-fun res!91470 () Bool)

(declare-fun call!19565 () Bool)

(assert (=> b!193563 (= res!91470 call!19565)))

(assert (=> b!193563 (=> (not res!91470) (not e!127350))))

(declare-fun b!193564 () Bool)

(declare-fun res!91468 () Bool)

(declare-fun e!127347 () Bool)

(assert (=> b!193564 (=> (not res!91468) (not e!127347))))

(assert (=> b!193564 (= res!91468 (= (select (arr!3863 (_keys!5936 thiss!1248)) (index!4925 lt!96404)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!193564 (and (bvsge (index!4925 lt!96404) #b00000000000000000000000000000000) (bvslt (index!4925 lt!96404) (size!4187 (_keys!5936 thiss!1248))))))

(declare-fun b!193565 () Bool)

(assert (=> b!193565 (= e!127347 (not call!19566))))

(declare-fun b!193566 () Bool)

(declare-fun res!91469 () Bool)

(assert (=> b!193566 (=> (not res!91469) (not e!127347))))

(assert (=> b!193566 (= res!91469 call!19565)))

(assert (=> b!193566 (= e!127348 e!127347)))

(declare-fun bm!19563 () Bool)

(assert (=> bm!19563 (= call!19565 (inRange!0 (ite c!34915 (index!4922 lt!96404) (index!4925 lt!96404)) (mask!9197 thiss!1248)))))

(declare-fun b!193567 () Bool)

(assert (=> b!193567 (= e!127348 ((_ is Undefined!688) lt!96404))))

(assert (= (and d!56595 c!34915) b!193563))

(assert (= (and d!56595 (not c!34915)) b!193562))

(assert (= (and b!193563 res!91470) b!193560))

(assert (= (and b!193560 res!91471) b!193561))

(assert (= (and b!193562 c!34916) b!193566))

(assert (= (and b!193562 (not c!34916)) b!193567))

(assert (= (and b!193566 res!91469) b!193564))

(assert (= (and b!193564 res!91468) b!193565))

(assert (= (or b!193563 b!193566) bm!19563))

(assert (= (or b!193561 b!193565) bm!19562))

(declare-fun m!220373 () Bool)

(assert (=> b!193560 m!220373))

(declare-fun m!220375 () Bool)

(assert (=> b!193564 m!220375))

(declare-fun m!220377 () Bool)

(assert (=> bm!19562 m!220377))

(assert (=> d!56595 m!220165))

(declare-fun m!220379 () Bool)

(assert (=> d!56595 m!220379))

(assert (=> d!56595 m!220155))

(declare-fun m!220381 () Bool)

(assert (=> bm!19563 m!220381))

(assert (=> b!193345 d!56595))

(declare-fun d!56597 () Bool)

(declare-fun res!91478 () Bool)

(declare-fun e!127359 () Bool)

(assert (=> d!56597 (=> res!91478 e!127359)))

(assert (=> d!56597 (= res!91478 (bvsge #b00000000000000000000000000000000 (size!4187 (_keys!5936 thiss!1248))))))

(assert (=> d!56597 (= (arrayNoDuplicates!0 (_keys!5936 thiss!1248) #b00000000000000000000000000000000 Nil!2436) e!127359)))

(declare-fun b!193578 () Bool)

(declare-fun e!127362 () Bool)

(declare-fun e!127361 () Bool)

(assert (=> b!193578 (= e!127362 e!127361)))

(declare-fun c!34919 () Bool)

(assert (=> b!193578 (= c!34919 (validKeyInArray!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193579 () Bool)

(declare-fun call!19569 () Bool)

(assert (=> b!193579 (= e!127361 call!19569)))

(declare-fun b!193580 () Bool)

(assert (=> b!193580 (= e!127359 e!127362)))

(declare-fun res!91480 () Bool)

(assert (=> b!193580 (=> (not res!91480) (not e!127362))))

(declare-fun e!127360 () Bool)

(assert (=> b!193580 (= res!91480 (not e!127360))))

(declare-fun res!91479 () Bool)

(assert (=> b!193580 (=> (not res!91479) (not e!127360))))

(assert (=> b!193580 (= res!91479 (validKeyInArray!0 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193581 () Bool)

(declare-fun contains!1372 (List!2439 (_ BitVec 64)) Bool)

(assert (=> b!193581 (= e!127360 (contains!1372 Nil!2436 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!193582 () Bool)

(assert (=> b!193582 (= e!127361 call!19569)))

(declare-fun bm!19566 () Bool)

(assert (=> bm!19566 (= call!19569 (arrayNoDuplicates!0 (_keys!5936 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!34919 (Cons!2435 (select (arr!3863 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000) Nil!2436) Nil!2436)))))

(assert (= (and d!56597 (not res!91478)) b!193580))

(assert (= (and b!193580 res!91479) b!193581))

(assert (= (and b!193580 res!91480) b!193578))

(assert (= (and b!193578 c!34919) b!193579))

(assert (= (and b!193578 (not c!34919)) b!193582))

(assert (= (or b!193579 b!193582) bm!19566))

(assert (=> b!193578 m!220219))

(assert (=> b!193578 m!220219))

(assert (=> b!193578 m!220223))

(assert (=> b!193580 m!220219))

(assert (=> b!193580 m!220219))

(assert (=> b!193580 m!220223))

(assert (=> b!193581 m!220219))

(assert (=> b!193581 m!220219))

(declare-fun m!220383 () Bool)

(assert (=> b!193581 m!220383))

(assert (=> bm!19566 m!220219))

(declare-fun m!220385 () Bool)

(assert (=> bm!19566 m!220385))

(assert (=> b!193339 d!56597))

(declare-fun d!56599 () Bool)

(assert (=> d!56599 (= (array_inv!2507 (_keys!5936 thiss!1248)) (bvsge (size!4187 (_keys!5936 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193348 d!56599))

(declare-fun d!56601 () Bool)

(assert (=> d!56601 (= (array_inv!2508 (_values!3929 thiss!1248)) (bvsge (size!4188 (_values!3929 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!193348 d!56601))

(declare-fun mapNonEmpty!7751 () Bool)

(declare-fun mapRes!7751 () Bool)

(declare-fun tp!16994 () Bool)

(declare-fun e!127367 () Bool)

(assert (=> mapNonEmpty!7751 (= mapRes!7751 (and tp!16994 e!127367))))

(declare-fun mapValue!7751 () ValueCell!1896)

(declare-fun mapKey!7751 () (_ BitVec 32))

(declare-fun mapRest!7751 () (Array (_ BitVec 32) ValueCell!1896))

(assert (=> mapNonEmpty!7751 (= mapRest!7745 (store mapRest!7751 mapKey!7751 mapValue!7751))))

(declare-fun b!193590 () Bool)

(declare-fun e!127368 () Bool)

(assert (=> b!193590 (= e!127368 tp_is_empty!4479)))

(declare-fun condMapEmpty!7751 () Bool)

(declare-fun mapDefault!7751 () ValueCell!1896)

(assert (=> mapNonEmpty!7745 (= condMapEmpty!7751 (= mapRest!7745 ((as const (Array (_ BitVec 32) ValueCell!1896)) mapDefault!7751)))))

(assert (=> mapNonEmpty!7745 (= tp!16984 (and e!127368 mapRes!7751))))

(declare-fun mapIsEmpty!7751 () Bool)

(assert (=> mapIsEmpty!7751 mapRes!7751))

(declare-fun b!193589 () Bool)

(assert (=> b!193589 (= e!127367 tp_is_empty!4479)))

(assert (= (and mapNonEmpty!7745 condMapEmpty!7751) mapIsEmpty!7751))

(assert (= (and mapNonEmpty!7745 (not condMapEmpty!7751)) mapNonEmpty!7751))

(assert (= (and mapNonEmpty!7751 ((_ is ValueCellFull!1896) mapValue!7751)) b!193589))

(assert (= (and mapNonEmpty!7745 ((_ is ValueCellFull!1896) mapDefault!7751)) b!193590))

(declare-fun m!220387 () Bool)

(assert (=> mapNonEmpty!7751 m!220387))

(declare-fun b_lambda!7467 () Bool)

(assert (= b_lambda!7463 (or (and b!193348 b_free!4707) b_lambda!7467)))

(declare-fun b_lambda!7469 () Bool)

(assert (= b_lambda!7465 (or (and b!193348 b_free!4707) b_lambda!7469)))

(check-sat (not b_lambda!7469) (not b!193458) (not d!56591) (not b!193578) (not bm!19542) (not d!56583) (not b!193452) (not bm!19551) (not b!193482) (not b!193403) (not b!193541) (not d!56575) (not b!193580) (not b_next!4707) (not bm!19549) (not b!193463) (not bm!19544) (not b_lambda!7467) (not bm!19563) (not b!193527) (not bm!19541) (not bm!19546) (not b!193401) (not d!56573) (not b!193402) (not b!193503) (not b!193490) (not bm!19548) (not bm!19566) (not bm!19562) (not b!193502) (not b!193475) (not b!193498) (not d!56585) (not b!193487) (not b!193449) (not mapNonEmpty!7751) (not b!193464) (not b!193512) (not b!193501) (not b!193483) (not d!56579) (not b!193477) (not b!193507) (not bm!19553) (not bm!19557) (not b!193453) (not d!56587) (not b!193465) (not b!193460) (not b!193496) (not d!56581) tp_is_empty!4479 (not d!56595) (not b!193540) (not b!193491) b_and!11419 (not b!193581))
(check-sat b_and!11419 (not b_next!4707))
