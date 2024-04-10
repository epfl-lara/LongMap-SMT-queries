; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18254 () Bool)

(assert start!18254)

(declare-fun b!181412 () Bool)

(declare-fun b_free!4479 () Bool)

(declare-fun b_next!4479 () Bool)

(assert (=> b!181412 (= b_free!4479 (not b_next!4479))))

(declare-fun tp!16184 () Bool)

(declare-fun b_and!11027 () Bool)

(assert (=> b!181412 (= tp!16184 b_and!11027)))

(declare-fun b!181405 () Bool)

(declare-fun e!119482 () Bool)

(declare-datatypes ((V!5315 0))(
  ( (V!5316 (val!2170 Int)) )
))
(declare-datatypes ((ValueCell!1782 0))(
  ( (ValueCellFull!1782 (v!4066 V!5315)) (EmptyCell!1782) )
))
(declare-datatypes ((array!7681 0))(
  ( (array!7682 (arr!3635 (Array (_ BitVec 32) (_ BitVec 64))) (size!3945 (_ BitVec 32))) )
))
(declare-datatypes ((array!7683 0))(
  ( (array!7684 (arr!3636 (Array (_ BitVec 32) ValueCell!1782)) (size!3946 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2472 0))(
  ( (LongMapFixedSize!2473 (defaultEntry!3717 Int) (mask!8738 (_ BitVec 32)) (extraKeys!3454 (_ BitVec 32)) (zeroValue!3558 V!5315) (minValue!3558 V!5315) (_size!1285 (_ BitVec 32)) (_keys!5619 array!7681) (_values!3700 array!7683) (_vacant!1285 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2472)

(assert (=> b!181405 (= e!119482 (and (= (size!3946 (_values!3700 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8738 thiss!1248))) (= (size!3945 (_keys!5619 thiss!1248)) (size!3946 (_values!3700 thiss!1248))) (bvslt (mask!8738 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!7287 () Bool)

(declare-fun mapRes!7287 () Bool)

(declare-fun tp!16185 () Bool)

(declare-fun e!119485 () Bool)

(assert (=> mapNonEmpty!7287 (= mapRes!7287 (and tp!16185 e!119485))))

(declare-fun mapValue!7287 () ValueCell!1782)

(declare-fun mapKey!7287 () (_ BitVec 32))

(declare-fun mapRest!7287 () (Array (_ BitVec 32) ValueCell!1782))

(assert (=> mapNonEmpty!7287 (= (arr!3636 (_values!3700 thiss!1248)) (store mapRest!7287 mapKey!7287 mapValue!7287))))

(declare-fun b!181406 () Bool)

(declare-fun e!119480 () Bool)

(declare-fun tp_is_empty!4251 () Bool)

(assert (=> b!181406 (= e!119480 tp_is_empty!4251)))

(declare-fun b!181407 () Bool)

(declare-fun res!85885 () Bool)

(assert (=> b!181407 (=> (not res!85885) (not e!119482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!181407 (= res!85885 (validMask!0 (mask!8738 thiss!1248)))))

(declare-fun res!85889 () Bool)

(declare-fun e!119479 () Bool)

(assert (=> start!18254 (=> (not res!85889) (not e!119479))))

(declare-fun valid!1026 (LongMapFixedSize!2472) Bool)

(assert (=> start!18254 (= res!85889 (valid!1026 thiss!1248))))

(assert (=> start!18254 e!119479))

(declare-fun e!119481 () Bool)

(assert (=> start!18254 e!119481))

(assert (=> start!18254 true))

(declare-fun mapIsEmpty!7287 () Bool)

(assert (=> mapIsEmpty!7287 mapRes!7287))

(declare-fun b!181408 () Bool)

(declare-fun res!85888 () Bool)

(assert (=> b!181408 (=> (not res!85888) (not e!119479))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!181408 (= res!85888 (not (= key!828 (bvneg key!828))))))

(declare-fun b!181409 () Bool)

(declare-fun e!119483 () Bool)

(assert (=> b!181409 (= e!119483 (and e!119480 mapRes!7287))))

(declare-fun condMapEmpty!7287 () Bool)

(declare-fun mapDefault!7287 () ValueCell!1782)

(assert (=> b!181409 (= condMapEmpty!7287 (= (arr!3636 (_values!3700 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1782)) mapDefault!7287)))))

(declare-fun b!181410 () Bool)

(assert (=> b!181410 (= e!119485 tp_is_empty!4251)))

(declare-fun b!181411 () Bool)

(declare-fun res!85887 () Bool)

(assert (=> b!181411 (=> (not res!85887) (not e!119482))))

(declare-datatypes ((tuple2!3384 0))(
  ( (tuple2!3385 (_1!1703 (_ BitVec 64)) (_2!1703 V!5315)) )
))
(declare-datatypes ((List!2306 0))(
  ( (Nil!2303) (Cons!2302 (h!2929 tuple2!3384) (t!7160 List!2306)) )
))
(declare-datatypes ((ListLongMap!2301 0))(
  ( (ListLongMap!2302 (toList!1166 List!2306)) )
))
(declare-fun contains!1246 (ListLongMap!2301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!814 (array!7681 array!7683 (_ BitVec 32) (_ BitVec 32) V!5315 V!5315 (_ BitVec 32) Int) ListLongMap!2301)

(assert (=> b!181411 (= res!85887 (contains!1246 (getCurrentListMap!814 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)) key!828))))

(declare-fun array_inv!2341 (array!7681) Bool)

(declare-fun array_inv!2342 (array!7683) Bool)

(assert (=> b!181412 (= e!119481 (and tp!16184 tp_is_empty!4251 (array_inv!2341 (_keys!5619 thiss!1248)) (array_inv!2342 (_values!3700 thiss!1248)) e!119483))))

(declare-fun b!181413 () Bool)

(assert (=> b!181413 (= e!119479 e!119482)))

(declare-fun res!85886 () Bool)

(assert (=> b!181413 (=> (not res!85886) (not e!119482))))

(declare-datatypes ((SeekEntryResult!600 0))(
  ( (MissingZero!600 (index!4570 (_ BitVec 32))) (Found!600 (index!4571 (_ BitVec 32))) (Intermediate!600 (undefined!1412 Bool) (index!4572 (_ BitVec 32)) (x!19804 (_ BitVec 32))) (Undefined!600) (MissingVacant!600 (index!4573 (_ BitVec 32))) )
))
(declare-fun lt!89685 () SeekEntryResult!600)

(get-info :version)

(assert (=> b!181413 (= res!85886 (and (not ((_ is Undefined!600) lt!89685)) (not ((_ is MissingVacant!600) lt!89685)) (not ((_ is MissingZero!600) lt!89685)) ((_ is Found!600) lt!89685)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7681 (_ BitVec 32)) SeekEntryResult!600)

(assert (=> b!181413 (= lt!89685 (seekEntryOrOpen!0 key!828 (_keys!5619 thiss!1248) (mask!8738 thiss!1248)))))

(assert (= (and start!18254 res!85889) b!181408))

(assert (= (and b!181408 res!85888) b!181413))

(assert (= (and b!181413 res!85886) b!181411))

(assert (= (and b!181411 res!85887) b!181407))

(assert (= (and b!181407 res!85885) b!181405))

(assert (= (and b!181409 condMapEmpty!7287) mapIsEmpty!7287))

(assert (= (and b!181409 (not condMapEmpty!7287)) mapNonEmpty!7287))

(assert (= (and mapNonEmpty!7287 ((_ is ValueCellFull!1782) mapValue!7287)) b!181410))

(assert (= (and b!181409 ((_ is ValueCellFull!1782) mapDefault!7287)) b!181406))

(assert (= b!181412 b!181409))

(assert (= start!18254 b!181412))

(declare-fun m!209327 () Bool)

(assert (=> mapNonEmpty!7287 m!209327))

(declare-fun m!209329 () Bool)

(assert (=> b!181411 m!209329))

(assert (=> b!181411 m!209329))

(declare-fun m!209331 () Bool)

(assert (=> b!181411 m!209331))

(declare-fun m!209333 () Bool)

(assert (=> b!181412 m!209333))

(declare-fun m!209335 () Bool)

(assert (=> b!181412 m!209335))

(declare-fun m!209337 () Bool)

(assert (=> b!181413 m!209337))

(declare-fun m!209339 () Bool)

(assert (=> start!18254 m!209339))

(declare-fun m!209341 () Bool)

(assert (=> b!181407 m!209341))

(check-sat (not mapNonEmpty!7287) tp_is_empty!4251 (not b!181407) (not b_next!4479) (not b!181413) b_and!11027 (not b!181411) (not start!18254) (not b!181412))
(check-sat b_and!11027 (not b_next!4479))
(get-model)

(declare-fun d!54429 () Bool)

(assert (=> d!54429 (= (array_inv!2341 (_keys!5619 thiss!1248)) (bvsge (size!3945 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181412 d!54429))

(declare-fun d!54431 () Bool)

(assert (=> d!54431 (= (array_inv!2342 (_values!3700 thiss!1248)) (bvsge (size!3946 (_values!3700 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181412 d!54431))

(declare-fun d!54433 () Bool)

(assert (=> d!54433 (= (validMask!0 (mask!8738 thiss!1248)) (and (or (= (mask!8738 thiss!1248) #b00000000000000000000000000000111) (= (mask!8738 thiss!1248) #b00000000000000000000000000001111) (= (mask!8738 thiss!1248) #b00000000000000000000000000011111) (= (mask!8738 thiss!1248) #b00000000000000000000000000111111) (= (mask!8738 thiss!1248) #b00000000000000000000000001111111) (= (mask!8738 thiss!1248) #b00000000000000000000000011111111) (= (mask!8738 thiss!1248) #b00000000000000000000000111111111) (= (mask!8738 thiss!1248) #b00000000000000000000001111111111) (= (mask!8738 thiss!1248) #b00000000000000000000011111111111) (= (mask!8738 thiss!1248) #b00000000000000000000111111111111) (= (mask!8738 thiss!1248) #b00000000000000000001111111111111) (= (mask!8738 thiss!1248) #b00000000000000000011111111111111) (= (mask!8738 thiss!1248) #b00000000000000000111111111111111) (= (mask!8738 thiss!1248) #b00000000000000001111111111111111) (= (mask!8738 thiss!1248) #b00000000000000011111111111111111) (= (mask!8738 thiss!1248) #b00000000000000111111111111111111) (= (mask!8738 thiss!1248) #b00000000000001111111111111111111) (= (mask!8738 thiss!1248) #b00000000000011111111111111111111) (= (mask!8738 thiss!1248) #b00000000000111111111111111111111) (= (mask!8738 thiss!1248) #b00000000001111111111111111111111) (= (mask!8738 thiss!1248) #b00000000011111111111111111111111) (= (mask!8738 thiss!1248) #b00000000111111111111111111111111) (= (mask!8738 thiss!1248) #b00000001111111111111111111111111) (= (mask!8738 thiss!1248) #b00000011111111111111111111111111) (= (mask!8738 thiss!1248) #b00000111111111111111111111111111) (= (mask!8738 thiss!1248) #b00001111111111111111111111111111) (= (mask!8738 thiss!1248) #b00011111111111111111111111111111) (= (mask!8738 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8738 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!181407 d!54433))

(declare-fun d!54435 () Bool)

(declare-fun e!119511 () Bool)

(assert (=> d!54435 e!119511))

(declare-fun res!85907 () Bool)

(assert (=> d!54435 (=> res!85907 e!119511)))

(declare-fun lt!89699 () Bool)

(assert (=> d!54435 (= res!85907 (not lt!89699))))

(declare-fun lt!89700 () Bool)

(assert (=> d!54435 (= lt!89699 lt!89700)))

(declare-datatypes ((Unit!5512 0))(
  ( (Unit!5513) )
))
(declare-fun lt!89697 () Unit!5512)

(declare-fun e!119512 () Unit!5512)

(assert (=> d!54435 (= lt!89697 e!119512)))

(declare-fun c!32515 () Bool)

(assert (=> d!54435 (= c!32515 lt!89700)))

(declare-fun containsKey!213 (List!2306 (_ BitVec 64)) Bool)

(assert (=> d!54435 (= lt!89700 (containsKey!213 (toList!1166 (getCurrentListMap!814 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248))) key!828))))

(assert (=> d!54435 (= (contains!1246 (getCurrentListMap!814 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)) key!828) lt!89699)))

(declare-fun b!181447 () Bool)

(declare-fun lt!89698 () Unit!5512)

(assert (=> b!181447 (= e!119512 lt!89698)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!161 (List!2306 (_ BitVec 64)) Unit!5512)

(assert (=> b!181447 (= lt!89698 (lemmaContainsKeyImpliesGetValueByKeyDefined!161 (toList!1166 (getCurrentListMap!814 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248))) key!828))))

(declare-datatypes ((Option!215 0))(
  ( (Some!214 (v!4068 V!5315)) (None!213) )
))
(declare-fun isDefined!162 (Option!215) Bool)

(declare-fun getValueByKey!209 (List!2306 (_ BitVec 64)) Option!215)

(assert (=> b!181447 (isDefined!162 (getValueByKey!209 (toList!1166 (getCurrentListMap!814 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248))) key!828))))

(declare-fun b!181448 () Bool)

(declare-fun Unit!5514 () Unit!5512)

(assert (=> b!181448 (= e!119512 Unit!5514)))

(declare-fun b!181449 () Bool)

(assert (=> b!181449 (= e!119511 (isDefined!162 (getValueByKey!209 (toList!1166 (getCurrentListMap!814 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248))) key!828)))))

(assert (= (and d!54435 c!32515) b!181447))

(assert (= (and d!54435 (not c!32515)) b!181448))

(assert (= (and d!54435 (not res!85907)) b!181449))

(declare-fun m!209359 () Bool)

(assert (=> d!54435 m!209359))

(declare-fun m!209361 () Bool)

(assert (=> b!181447 m!209361))

(declare-fun m!209363 () Bool)

(assert (=> b!181447 m!209363))

(assert (=> b!181447 m!209363))

(declare-fun m!209365 () Bool)

(assert (=> b!181447 m!209365))

(assert (=> b!181449 m!209363))

(assert (=> b!181449 m!209363))

(assert (=> b!181449 m!209365))

(assert (=> b!181411 d!54435))

(declare-fun bm!18334 () Bool)

(declare-fun call!18338 () ListLongMap!2301)

(declare-fun getCurrentListMapNoExtraKeys!185 (array!7681 array!7683 (_ BitVec 32) (_ BitVec 32) V!5315 V!5315 (_ BitVec 32) Int) ListLongMap!2301)

(assert (=> bm!18334 (= call!18338 (getCurrentListMapNoExtraKeys!185 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)))))

(declare-fun b!181492 () Bool)

(declare-fun e!119548 () Bool)

(declare-fun e!119545 () Bool)

(assert (=> b!181492 (= e!119548 e!119545)))

(declare-fun c!32533 () Bool)

(assert (=> b!181492 (= c!32533 (not (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18335 () Bool)

(declare-fun call!18343 () Bool)

(declare-fun lt!89754 () ListLongMap!2301)

(assert (=> bm!18335 (= call!18343 (contains!1246 lt!89754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181493 () Bool)

(declare-fun e!119549 () Bool)

(declare-fun apply!152 (ListLongMap!2301 (_ BitVec 64)) V!5315)

(assert (=> b!181493 (= e!119549 (= (apply!152 lt!89754 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3558 thiss!1248)))))

(declare-fun b!181494 () Bool)

(declare-fun e!119544 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!181494 (= e!119544 (validKeyInArray!0 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!181495 () Bool)

(declare-fun e!119550 () ListLongMap!2301)

(declare-fun call!18337 () ListLongMap!2301)

(assert (=> b!181495 (= e!119550 call!18337)))

(declare-fun b!181496 () Bool)

(declare-fun e!119551 () Unit!5512)

(declare-fun Unit!5515 () Unit!5512)

(assert (=> b!181496 (= e!119551 Unit!5515)))

(declare-fun call!18339 () ListLongMap!2301)

(declare-fun c!32532 () Bool)

(declare-fun call!18340 () ListLongMap!2301)

(declare-fun call!18342 () ListLongMap!2301)

(declare-fun bm!18336 () Bool)

(declare-fun c!32530 () Bool)

(declare-fun +!272 (ListLongMap!2301 tuple2!3384) ListLongMap!2301)

(assert (=> bm!18336 (= call!18342 (+!272 (ite c!32530 call!18338 (ite c!32532 call!18339 call!18340)) (ite (or c!32530 c!32532) (tuple2!3385 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3558 thiss!1248)) (tuple2!3385 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3558 thiss!1248)))))))

(declare-fun b!181497 () Bool)

(declare-fun res!85933 () Bool)

(assert (=> b!181497 (=> (not res!85933) (not e!119548))))

(declare-fun e!119542 () Bool)

(assert (=> b!181497 (= res!85933 e!119542)))

(declare-fun c!32531 () Bool)

(assert (=> b!181497 (= c!32531 (not (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!181498 () Bool)

(declare-fun res!85929 () Bool)

(assert (=> b!181498 (=> (not res!85929) (not e!119548))))

(declare-fun e!119540 () Bool)

(assert (=> b!181498 (= res!85929 e!119540)))

(declare-fun res!85928 () Bool)

(assert (=> b!181498 (=> res!85928 e!119540)))

(assert (=> b!181498 (= res!85928 (not e!119544))))

(declare-fun res!85931 () Bool)

(assert (=> b!181498 (=> (not res!85931) (not e!119544))))

(assert (=> b!181498 (= res!85931 (bvslt #b00000000000000000000000000000000 (size!3945 (_keys!5619 thiss!1248))))))

(declare-fun b!181499 () Bool)

(declare-fun e!119547 () ListLongMap!2301)

(assert (=> b!181499 (= e!119547 e!119550)))

(assert (=> b!181499 (= c!32532 (and (not (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18337 () Bool)

(declare-fun call!18341 () Bool)

(assert (=> bm!18337 (= call!18341 (contains!1246 lt!89754 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!181500 () Bool)

(declare-fun e!119539 () Bool)

(declare-fun get!2079 (ValueCell!1782 V!5315) V!5315)

(declare-fun dynLambda!495 (Int (_ BitVec 64)) V!5315)

(assert (=> b!181500 (= e!119539 (= (apply!152 lt!89754 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000)) (get!2079 (select (arr!3636 (_values!3700 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!495 (defaultEntry!3717 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!181500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3946 (_values!3700 thiss!1248))))))

(assert (=> b!181500 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3945 (_keys!5619 thiss!1248))))))

(declare-fun b!181501 () Bool)

(assert (=> b!181501 (= e!119545 e!119549)))

(declare-fun res!85932 () Bool)

(assert (=> b!181501 (= res!85932 call!18341)))

(assert (=> b!181501 (=> (not res!85932) (not e!119549))))

(declare-fun b!181502 () Bool)

(declare-fun e!119546 () ListLongMap!2301)

(assert (=> b!181502 (= e!119546 call!18340)))

(declare-fun d!54437 () Bool)

(assert (=> d!54437 e!119548))

(declare-fun res!85934 () Bool)

(assert (=> d!54437 (=> (not res!85934) (not e!119548))))

(assert (=> d!54437 (= res!85934 (or (bvsge #b00000000000000000000000000000000 (size!3945 (_keys!5619 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3945 (_keys!5619 thiss!1248))))))))

(declare-fun lt!89763 () ListLongMap!2301)

(assert (=> d!54437 (= lt!89754 lt!89763)))

(declare-fun lt!89746 () Unit!5512)

(assert (=> d!54437 (= lt!89746 e!119551)))

(declare-fun c!32528 () Bool)

(declare-fun e!119541 () Bool)

(assert (=> d!54437 (= c!32528 e!119541)))

(declare-fun res!85930 () Bool)

(assert (=> d!54437 (=> (not res!85930) (not e!119541))))

(assert (=> d!54437 (= res!85930 (bvslt #b00000000000000000000000000000000 (size!3945 (_keys!5619 thiss!1248))))))

(assert (=> d!54437 (= lt!89763 e!119547)))

(assert (=> d!54437 (= c!32530 (and (not (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54437 (validMask!0 (mask!8738 thiss!1248))))

(assert (=> d!54437 (= (getCurrentListMap!814 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)) lt!89754)))

(declare-fun bm!18338 () Bool)

(assert (=> bm!18338 (= call!18339 call!18338)))

(declare-fun b!181503 () Bool)

(assert (=> b!181503 (= e!119547 (+!272 call!18342 (tuple2!3385 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3558 thiss!1248))))))

(declare-fun bm!18339 () Bool)

(assert (=> bm!18339 (= call!18337 call!18342)))

(declare-fun b!181504 () Bool)

(declare-fun e!119543 () Bool)

(assert (=> b!181504 (= e!119542 e!119543)))

(declare-fun res!85926 () Bool)

(assert (=> b!181504 (= res!85926 call!18343)))

(assert (=> b!181504 (=> (not res!85926) (not e!119543))))

(declare-fun b!181505 () Bool)

(assert (=> b!181505 (= e!119540 e!119539)))

(declare-fun res!85927 () Bool)

(assert (=> b!181505 (=> (not res!85927) (not e!119539))))

(assert (=> b!181505 (= res!85927 (contains!1246 lt!89754 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!181505 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3945 (_keys!5619 thiss!1248))))))

(declare-fun b!181506 () Bool)

(assert (=> b!181506 (= e!119542 (not call!18343))))

(declare-fun b!181507 () Bool)

(declare-fun lt!89757 () Unit!5512)

(assert (=> b!181507 (= e!119551 lt!89757)))

(declare-fun lt!89759 () ListLongMap!2301)

(assert (=> b!181507 (= lt!89759 (getCurrentListMapNoExtraKeys!185 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)))))

(declare-fun lt!89748 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89748 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89752 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89752 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89753 () Unit!5512)

(declare-fun addStillContains!128 (ListLongMap!2301 (_ BitVec 64) V!5315 (_ BitVec 64)) Unit!5512)

(assert (=> b!181507 (= lt!89753 (addStillContains!128 lt!89759 lt!89748 (zeroValue!3558 thiss!1248) lt!89752))))

(assert (=> b!181507 (contains!1246 (+!272 lt!89759 (tuple2!3385 lt!89748 (zeroValue!3558 thiss!1248))) lt!89752)))

(declare-fun lt!89761 () Unit!5512)

(assert (=> b!181507 (= lt!89761 lt!89753)))

(declare-fun lt!89749 () ListLongMap!2301)

(assert (=> b!181507 (= lt!89749 (getCurrentListMapNoExtraKeys!185 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)))))

(declare-fun lt!89751 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89751 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89755 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89755 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89756 () Unit!5512)

(declare-fun addApplyDifferent!128 (ListLongMap!2301 (_ BitVec 64) V!5315 (_ BitVec 64)) Unit!5512)

(assert (=> b!181507 (= lt!89756 (addApplyDifferent!128 lt!89749 lt!89751 (minValue!3558 thiss!1248) lt!89755))))

(assert (=> b!181507 (= (apply!152 (+!272 lt!89749 (tuple2!3385 lt!89751 (minValue!3558 thiss!1248))) lt!89755) (apply!152 lt!89749 lt!89755))))

(declare-fun lt!89745 () Unit!5512)

(assert (=> b!181507 (= lt!89745 lt!89756)))

(declare-fun lt!89764 () ListLongMap!2301)

(assert (=> b!181507 (= lt!89764 (getCurrentListMapNoExtraKeys!185 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)))))

(declare-fun lt!89765 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89765 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89747 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89747 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!89758 () Unit!5512)

(assert (=> b!181507 (= lt!89758 (addApplyDifferent!128 lt!89764 lt!89765 (zeroValue!3558 thiss!1248) lt!89747))))

(assert (=> b!181507 (= (apply!152 (+!272 lt!89764 (tuple2!3385 lt!89765 (zeroValue!3558 thiss!1248))) lt!89747) (apply!152 lt!89764 lt!89747))))

(declare-fun lt!89762 () Unit!5512)

(assert (=> b!181507 (= lt!89762 lt!89758)))

(declare-fun lt!89766 () ListLongMap!2301)

(assert (=> b!181507 (= lt!89766 (getCurrentListMapNoExtraKeys!185 (_keys!5619 thiss!1248) (_values!3700 thiss!1248) (mask!8738 thiss!1248) (extraKeys!3454 thiss!1248) (zeroValue!3558 thiss!1248) (minValue!3558 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3717 thiss!1248)))))

(declare-fun lt!89750 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89750 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!89760 () (_ BitVec 64))

(assert (=> b!181507 (= lt!89760 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!181507 (= lt!89757 (addApplyDifferent!128 lt!89766 lt!89750 (minValue!3558 thiss!1248) lt!89760))))

(assert (=> b!181507 (= (apply!152 (+!272 lt!89766 (tuple2!3385 lt!89750 (minValue!3558 thiss!1248))) lt!89760) (apply!152 lt!89766 lt!89760))))

(declare-fun b!181508 () Bool)

(assert (=> b!181508 (= e!119543 (= (apply!152 lt!89754 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3558 thiss!1248)))))

(declare-fun b!181509 () Bool)

(declare-fun c!32529 () Bool)

(assert (=> b!181509 (= c!32529 (and (not (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3454 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!181509 (= e!119550 e!119546)))

(declare-fun b!181510 () Bool)

(assert (=> b!181510 (= e!119545 (not call!18341))))

(declare-fun b!181511 () Bool)

(assert (=> b!181511 (= e!119541 (validKeyInArray!0 (select (arr!3635 (_keys!5619 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18340 () Bool)

(assert (=> bm!18340 (= call!18340 call!18339)))

(declare-fun b!181512 () Bool)

(assert (=> b!181512 (= e!119546 call!18337)))

(assert (= (and d!54437 c!32530) b!181503))

(assert (= (and d!54437 (not c!32530)) b!181499))

(assert (= (and b!181499 c!32532) b!181495))

(assert (= (and b!181499 (not c!32532)) b!181509))

(assert (= (and b!181509 c!32529) b!181512))

(assert (= (and b!181509 (not c!32529)) b!181502))

(assert (= (or b!181512 b!181502) bm!18340))

(assert (= (or b!181495 bm!18340) bm!18338))

(assert (= (or b!181495 b!181512) bm!18339))

(assert (= (or b!181503 bm!18338) bm!18334))

(assert (= (or b!181503 bm!18339) bm!18336))

(assert (= (and d!54437 res!85930) b!181511))

(assert (= (and d!54437 c!32528) b!181507))

(assert (= (and d!54437 (not c!32528)) b!181496))

(assert (= (and d!54437 res!85934) b!181498))

(assert (= (and b!181498 res!85931) b!181494))

(assert (= (and b!181498 (not res!85928)) b!181505))

(assert (= (and b!181505 res!85927) b!181500))

(assert (= (and b!181498 res!85929) b!181497))

(assert (= (and b!181497 c!32531) b!181504))

(assert (= (and b!181497 (not c!32531)) b!181506))

(assert (= (and b!181504 res!85926) b!181508))

(assert (= (or b!181504 b!181506) bm!18335))

(assert (= (and b!181497 res!85933) b!181492))

(assert (= (and b!181492 c!32533) b!181501))

(assert (= (and b!181492 (not c!32533)) b!181510))

(assert (= (and b!181501 res!85932) b!181493))

(assert (= (or b!181501 b!181510) bm!18337))

(declare-fun b_lambda!7147 () Bool)

(assert (=> (not b_lambda!7147) (not b!181500)))

(declare-fun t!7163 () Bool)

(declare-fun tb!2815 () Bool)

(assert (=> (and b!181412 (= (defaultEntry!3717 thiss!1248) (defaultEntry!3717 thiss!1248)) t!7163) tb!2815))

(declare-fun result!4723 () Bool)

(assert (=> tb!2815 (= result!4723 tp_is_empty!4251)))

(assert (=> b!181500 t!7163))

(declare-fun b_and!11031 () Bool)

(assert (= b_and!11027 (and (=> t!7163 result!4723) b_and!11031)))

(declare-fun m!209367 () Bool)

(assert (=> bm!18336 m!209367))

(declare-fun m!209369 () Bool)

(assert (=> b!181493 m!209369))

(declare-fun m!209371 () Bool)

(assert (=> bm!18335 m!209371))

(declare-fun m!209373 () Bool)

(assert (=> b!181494 m!209373))

(assert (=> b!181494 m!209373))

(declare-fun m!209375 () Bool)

(assert (=> b!181494 m!209375))

(declare-fun m!209377 () Bool)

(assert (=> b!181508 m!209377))

(declare-fun m!209379 () Bool)

(assert (=> bm!18334 m!209379))

(declare-fun m!209381 () Bool)

(assert (=> b!181500 m!209381))

(assert (=> b!181500 m!209373))

(declare-fun m!209383 () Bool)

(assert (=> b!181500 m!209383))

(declare-fun m!209385 () Bool)

(assert (=> b!181500 m!209385))

(assert (=> b!181500 m!209385))

(assert (=> b!181500 m!209381))

(declare-fun m!209387 () Bool)

(assert (=> b!181500 m!209387))

(assert (=> b!181500 m!209373))

(declare-fun m!209389 () Bool)

(assert (=> b!181503 m!209389))

(assert (=> b!181511 m!209373))

(assert (=> b!181511 m!209373))

(assert (=> b!181511 m!209375))

(assert (=> d!54437 m!209341))

(declare-fun m!209391 () Bool)

(assert (=> bm!18337 m!209391))

(assert (=> b!181505 m!209373))

(assert (=> b!181505 m!209373))

(declare-fun m!209393 () Bool)

(assert (=> b!181505 m!209393))

(declare-fun m!209395 () Bool)

(assert (=> b!181507 m!209395))

(declare-fun m!209397 () Bool)

(assert (=> b!181507 m!209397))

(assert (=> b!181507 m!209379))

(declare-fun m!209399 () Bool)

(assert (=> b!181507 m!209399))

(declare-fun m!209401 () Bool)

(assert (=> b!181507 m!209401))

(declare-fun m!209403 () Bool)

(assert (=> b!181507 m!209403))

(declare-fun m!209405 () Bool)

(assert (=> b!181507 m!209405))

(declare-fun m!209407 () Bool)

(assert (=> b!181507 m!209407))

(assert (=> b!181507 m!209401))

(declare-fun m!209409 () Bool)

(assert (=> b!181507 m!209409))

(assert (=> b!181507 m!209405))

(declare-fun m!209411 () Bool)

(assert (=> b!181507 m!209411))

(declare-fun m!209413 () Bool)

(assert (=> b!181507 m!209413))

(declare-fun m!209415 () Bool)

(assert (=> b!181507 m!209415))

(declare-fun m!209417 () Bool)

(assert (=> b!181507 m!209417))

(assert (=> b!181507 m!209373))

(declare-fun m!209419 () Bool)

(assert (=> b!181507 m!209419))

(declare-fun m!209421 () Bool)

(assert (=> b!181507 m!209421))

(assert (=> b!181507 m!209413))

(assert (=> b!181507 m!209419))

(declare-fun m!209423 () Bool)

(assert (=> b!181507 m!209423))

(assert (=> b!181411 d!54437))

(declare-fun d!54439 () Bool)

(declare-fun res!85941 () Bool)

(declare-fun e!119554 () Bool)

(assert (=> d!54439 (=> (not res!85941) (not e!119554))))

(declare-fun simpleValid!168 (LongMapFixedSize!2472) Bool)

(assert (=> d!54439 (= res!85941 (simpleValid!168 thiss!1248))))

(assert (=> d!54439 (= (valid!1026 thiss!1248) e!119554)))

(declare-fun b!181521 () Bool)

(declare-fun res!85942 () Bool)

(assert (=> b!181521 (=> (not res!85942) (not e!119554))))

(declare-fun arrayCountValidKeys!0 (array!7681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!181521 (= res!85942 (= (arrayCountValidKeys!0 (_keys!5619 thiss!1248) #b00000000000000000000000000000000 (size!3945 (_keys!5619 thiss!1248))) (_size!1285 thiss!1248)))))

(declare-fun b!181522 () Bool)

(declare-fun res!85943 () Bool)

(assert (=> b!181522 (=> (not res!85943) (not e!119554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7681 (_ BitVec 32)) Bool)

(assert (=> b!181522 (= res!85943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5619 thiss!1248) (mask!8738 thiss!1248)))))

(declare-fun b!181523 () Bool)

(declare-datatypes ((List!2308 0))(
  ( (Nil!2305) (Cons!2304 (h!2931 (_ BitVec 64)) (t!7164 List!2308)) )
))
(declare-fun arrayNoDuplicates!0 (array!7681 (_ BitVec 32) List!2308) Bool)

(assert (=> b!181523 (= e!119554 (arrayNoDuplicates!0 (_keys!5619 thiss!1248) #b00000000000000000000000000000000 Nil!2305))))

(assert (= (and d!54439 res!85941) b!181521))

(assert (= (and b!181521 res!85942) b!181522))

(assert (= (and b!181522 res!85943) b!181523))

(declare-fun m!209425 () Bool)

(assert (=> d!54439 m!209425))

(declare-fun m!209427 () Bool)

(assert (=> b!181521 m!209427))

(declare-fun m!209429 () Bool)

(assert (=> b!181522 m!209429))

(declare-fun m!209431 () Bool)

(assert (=> b!181523 m!209431))

(assert (=> start!18254 d!54439))

(declare-fun b!181536 () Bool)

(declare-fun e!119562 () SeekEntryResult!600)

(declare-fun e!119561 () SeekEntryResult!600)

(assert (=> b!181536 (= e!119562 e!119561)))

(declare-fun lt!89773 () (_ BitVec 64))

(declare-fun lt!89775 () SeekEntryResult!600)

(assert (=> b!181536 (= lt!89773 (select (arr!3635 (_keys!5619 thiss!1248)) (index!4572 lt!89775)))))

(declare-fun c!32540 () Bool)

(assert (=> b!181536 (= c!32540 (= lt!89773 key!828))))

(declare-fun b!181538 () Bool)

(declare-fun c!32542 () Bool)

(assert (=> b!181538 (= c!32542 (= lt!89773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!119563 () SeekEntryResult!600)

(assert (=> b!181538 (= e!119561 e!119563)))

(declare-fun b!181539 () Bool)

(assert (=> b!181539 (= e!119563 (MissingZero!600 (index!4572 lt!89775)))))

(declare-fun b!181537 () Bool)

(assert (=> b!181537 (= e!119561 (Found!600 (index!4572 lt!89775)))))

(declare-fun d!54441 () Bool)

(declare-fun lt!89774 () SeekEntryResult!600)

(assert (=> d!54441 (and (or ((_ is Undefined!600) lt!89774) (not ((_ is Found!600) lt!89774)) (and (bvsge (index!4571 lt!89774) #b00000000000000000000000000000000) (bvslt (index!4571 lt!89774) (size!3945 (_keys!5619 thiss!1248))))) (or ((_ is Undefined!600) lt!89774) ((_ is Found!600) lt!89774) (not ((_ is MissingZero!600) lt!89774)) (and (bvsge (index!4570 lt!89774) #b00000000000000000000000000000000) (bvslt (index!4570 lt!89774) (size!3945 (_keys!5619 thiss!1248))))) (or ((_ is Undefined!600) lt!89774) ((_ is Found!600) lt!89774) ((_ is MissingZero!600) lt!89774) (not ((_ is MissingVacant!600) lt!89774)) (and (bvsge (index!4573 lt!89774) #b00000000000000000000000000000000) (bvslt (index!4573 lt!89774) (size!3945 (_keys!5619 thiss!1248))))) (or ((_ is Undefined!600) lt!89774) (ite ((_ is Found!600) lt!89774) (= (select (arr!3635 (_keys!5619 thiss!1248)) (index!4571 lt!89774)) key!828) (ite ((_ is MissingZero!600) lt!89774) (= (select (arr!3635 (_keys!5619 thiss!1248)) (index!4570 lt!89774)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!600) lt!89774) (= (select (arr!3635 (_keys!5619 thiss!1248)) (index!4573 lt!89774)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54441 (= lt!89774 e!119562)))

(declare-fun c!32541 () Bool)

(assert (=> d!54441 (= c!32541 (and ((_ is Intermediate!600) lt!89775) (undefined!1412 lt!89775)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7681 (_ BitVec 32)) SeekEntryResult!600)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54441 (= lt!89775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8738 thiss!1248)) key!828 (_keys!5619 thiss!1248) (mask!8738 thiss!1248)))))

(assert (=> d!54441 (validMask!0 (mask!8738 thiss!1248))))

(assert (=> d!54441 (= (seekEntryOrOpen!0 key!828 (_keys!5619 thiss!1248) (mask!8738 thiss!1248)) lt!89774)))

(declare-fun b!181540 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7681 (_ BitVec 32)) SeekEntryResult!600)

(assert (=> b!181540 (= e!119563 (seekKeyOrZeroReturnVacant!0 (x!19804 lt!89775) (index!4572 lt!89775) (index!4572 lt!89775) key!828 (_keys!5619 thiss!1248) (mask!8738 thiss!1248)))))

(declare-fun b!181541 () Bool)

(assert (=> b!181541 (= e!119562 Undefined!600)))

(assert (= (and d!54441 c!32541) b!181541))

(assert (= (and d!54441 (not c!32541)) b!181536))

(assert (= (and b!181536 c!32540) b!181537))

(assert (= (and b!181536 (not c!32540)) b!181538))

(assert (= (and b!181538 c!32542) b!181539))

(assert (= (and b!181538 (not c!32542)) b!181540))

(declare-fun m!209433 () Bool)

(assert (=> b!181536 m!209433))

(declare-fun m!209435 () Bool)

(assert (=> d!54441 m!209435))

(declare-fun m!209437 () Bool)

(assert (=> d!54441 m!209437))

(assert (=> d!54441 m!209341))

(assert (=> d!54441 m!209435))

(declare-fun m!209439 () Bool)

(assert (=> d!54441 m!209439))

(declare-fun m!209441 () Bool)

(assert (=> d!54441 m!209441))

(declare-fun m!209443 () Bool)

(assert (=> d!54441 m!209443))

(declare-fun m!209445 () Bool)

(assert (=> b!181540 m!209445))

(assert (=> b!181413 d!54441))

(declare-fun condMapEmpty!7293 () Bool)

(declare-fun mapDefault!7293 () ValueCell!1782)

(assert (=> mapNonEmpty!7287 (= condMapEmpty!7293 (= mapRest!7287 ((as const (Array (_ BitVec 32) ValueCell!1782)) mapDefault!7293)))))

(declare-fun e!119569 () Bool)

(declare-fun mapRes!7293 () Bool)

(assert (=> mapNonEmpty!7287 (= tp!16185 (and e!119569 mapRes!7293))))

(declare-fun mapIsEmpty!7293 () Bool)

(assert (=> mapIsEmpty!7293 mapRes!7293))

(declare-fun b!181548 () Bool)

(declare-fun e!119568 () Bool)

(assert (=> b!181548 (= e!119568 tp_is_empty!4251)))

(declare-fun mapNonEmpty!7293 () Bool)

(declare-fun tp!16194 () Bool)

(assert (=> mapNonEmpty!7293 (= mapRes!7293 (and tp!16194 e!119568))))

(declare-fun mapKey!7293 () (_ BitVec 32))

(declare-fun mapRest!7293 () (Array (_ BitVec 32) ValueCell!1782))

(declare-fun mapValue!7293 () ValueCell!1782)

(assert (=> mapNonEmpty!7293 (= mapRest!7287 (store mapRest!7293 mapKey!7293 mapValue!7293))))

(declare-fun b!181549 () Bool)

(assert (=> b!181549 (= e!119569 tp_is_empty!4251)))

(assert (= (and mapNonEmpty!7287 condMapEmpty!7293) mapIsEmpty!7293))

(assert (= (and mapNonEmpty!7287 (not condMapEmpty!7293)) mapNonEmpty!7293))

(assert (= (and mapNonEmpty!7293 ((_ is ValueCellFull!1782) mapValue!7293)) b!181548))

(assert (= (and mapNonEmpty!7287 ((_ is ValueCellFull!1782) mapDefault!7293)) b!181549))

(declare-fun m!209447 () Bool)

(assert (=> mapNonEmpty!7293 m!209447))

(declare-fun b_lambda!7149 () Bool)

(assert (= b_lambda!7147 (or (and b!181412 b_free!4479) b_lambda!7149)))

(check-sat (not bm!18337) (not b!181500) (not d!54441) (not bm!18335) (not b!181522) (not b!181503) (not bm!18334) (not b!181511) (not b!181505) b_and!11031 (not b!181521) (not d!54435) (not mapNonEmpty!7293) (not b!181449) (not b!181494) (not b!181507) (not b!181523) (not b_lambda!7149) (not bm!18336) (not b!181447) tp_is_empty!4251 (not d!54439) (not b!181508) (not b!181540) (not d!54437) (not b!181493) (not b_next!4479))
(check-sat b_and!11031 (not b_next!4479))
