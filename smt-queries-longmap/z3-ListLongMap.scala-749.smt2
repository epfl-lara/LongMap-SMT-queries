; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17514 () Bool)

(assert start!17514)

(declare-fun b!175442 () Bool)

(declare-fun b_free!4335 () Bool)

(declare-fun b_next!4335 () Bool)

(assert (=> b!175442 (= b_free!4335 (not b_next!4335))))

(declare-fun tp!15684 () Bool)

(declare-fun b_and!10815 () Bool)

(assert (=> b!175442 (= tp!15684 b_and!10815)))

(declare-fun res!83173 () Bool)

(declare-fun e!115804 () Bool)

(assert (=> start!17514 (=> (not res!83173) (not e!115804))))

(declare-datatypes ((V!5123 0))(
  ( (V!5124 (val!2098 Int)) )
))
(declare-datatypes ((ValueCell!1710 0))(
  ( (ValueCellFull!1710 (v!3972 V!5123)) (EmptyCell!1710) )
))
(declare-datatypes ((array!7353 0))(
  ( (array!7354 (arr!3491 (Array (_ BitVec 32) (_ BitVec 64))) (size!3793 (_ BitVec 32))) )
))
(declare-datatypes ((array!7355 0))(
  ( (array!7356 (arr!3492 (Array (_ BitVec 32) ValueCell!1710)) (size!3794 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2328 0))(
  ( (LongMapFixedSize!2329 (defaultEntry!3619 Int) (mask!8516 (_ BitVec 32)) (extraKeys!3356 (_ BitVec 32)) (zeroValue!3460 V!5123) (minValue!3460 V!5123) (_size!1213 (_ BitVec 32)) (_keys!5471 array!7353) (_values!3602 array!7355) (_vacant!1213 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2328)

(declare-fun valid!982 (LongMapFixedSize!2328) Bool)

(assert (=> start!17514 (= res!83173 (valid!982 thiss!1248))))

(assert (=> start!17514 e!115804))

(declare-fun e!115802 () Bool)

(assert (=> start!17514 e!115802))

(assert (=> start!17514 true))

(declare-fun b!175438 () Bool)

(declare-fun res!83175 () Bool)

(assert (=> b!175438 (=> (not res!83175) (not e!115804))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3262 0))(
  ( (tuple2!3263 (_1!1642 (_ BitVec 64)) (_2!1642 V!5123)) )
))
(declare-datatypes ((List!2221 0))(
  ( (Nil!2218) (Cons!2217 (h!2836 tuple2!3262) (t!7039 List!2221)) )
))
(declare-datatypes ((ListLongMap!2189 0))(
  ( (ListLongMap!2190 (toList!1110 List!2221)) )
))
(declare-fun contains!1170 (ListLongMap!2189 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!762 (array!7353 array!7355 (_ BitVec 32) (_ BitVec 32) V!5123 V!5123 (_ BitVec 32) Int) ListLongMap!2189)

(assert (=> b!175438 (= res!83175 (contains!1170 (getCurrentListMap!762 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)) key!828))))

(declare-fun b!175439 () Bool)

(declare-fun e!115806 () Bool)

(declare-fun e!115805 () Bool)

(declare-fun mapRes!7003 () Bool)

(assert (=> b!175439 (= e!115806 (and e!115805 mapRes!7003))))

(declare-fun condMapEmpty!7003 () Bool)

(declare-fun mapDefault!7003 () ValueCell!1710)

(assert (=> b!175439 (= condMapEmpty!7003 (= (arr!3492 (_values!3602 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1710)) mapDefault!7003)))))

(declare-fun b!175440 () Bool)

(declare-fun e!115803 () Bool)

(declare-fun tp_is_empty!4107 () Bool)

(assert (=> b!175440 (= e!115803 tp_is_empty!4107)))

(declare-fun mapNonEmpty!7003 () Bool)

(declare-fun tp!15685 () Bool)

(assert (=> mapNonEmpty!7003 (= mapRes!7003 (and tp!15685 e!115803))))

(declare-fun mapKey!7003 () (_ BitVec 32))

(declare-fun mapRest!7003 () (Array (_ BitVec 32) ValueCell!1710))

(declare-fun mapValue!7003 () ValueCell!1710)

(assert (=> mapNonEmpty!7003 (= (arr!3492 (_values!3602 thiss!1248)) (store mapRest!7003 mapKey!7003 mapValue!7003))))

(declare-fun b!175441 () Bool)

(declare-fun res!83172 () Bool)

(assert (=> b!175441 (=> (not res!83172) (not e!115804))))

(assert (=> b!175441 (= res!83172 (not (= key!828 (bvneg key!828))))))

(declare-fun array_inv!2235 (array!7353) Bool)

(declare-fun array_inv!2236 (array!7355) Bool)

(assert (=> b!175442 (= e!115802 (and tp!15684 tp_is_empty!4107 (array_inv!2235 (_keys!5471 thiss!1248)) (array_inv!2236 (_values!3602 thiss!1248)) e!115806))))

(declare-fun mapIsEmpty!7003 () Bool)

(assert (=> mapIsEmpty!7003 mapRes!7003))

(declare-fun b!175443 () Bool)

(assert (=> b!175443 (= e!115804 (and (= (size!3794 (_values!3602 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8516 thiss!1248))) (= (size!3793 (_keys!5471 thiss!1248)) (size!3794 (_values!3602 thiss!1248))) (bvslt (mask!8516 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175444 () Bool)

(assert (=> b!175444 (= e!115805 tp_is_empty!4107)))

(declare-fun b!175445 () Bool)

(declare-fun res!83174 () Bool)

(assert (=> b!175445 (=> (not res!83174) (not e!115804))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!550 0))(
  ( (MissingZero!550 (index!4368 (_ BitVec 32))) (Found!550 (index!4369 (_ BitVec 32))) (Intermediate!550 (undefined!1362 Bool) (index!4370 (_ BitVec 32)) (x!19290 (_ BitVec 32))) (Undefined!550) (MissingVacant!550 (index!4371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7353 (_ BitVec 32)) SeekEntryResult!550)

(assert (=> b!175445 (= res!83174 ((_ is Undefined!550) (seekEntryOrOpen!0 key!828 (_keys!5471 thiss!1248) (mask!8516 thiss!1248))))))

(declare-fun b!175446 () Bool)

(declare-fun res!83176 () Bool)

(assert (=> b!175446 (=> (not res!83176) (not e!115804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175446 (= res!83176 (validMask!0 (mask!8516 thiss!1248)))))

(assert (= (and start!17514 res!83173) b!175441))

(assert (= (and b!175441 res!83172) b!175445))

(assert (= (and b!175445 res!83174) b!175438))

(assert (= (and b!175438 res!83175) b!175446))

(assert (= (and b!175446 res!83176) b!175443))

(assert (= (and b!175439 condMapEmpty!7003) mapIsEmpty!7003))

(assert (= (and b!175439 (not condMapEmpty!7003)) mapNonEmpty!7003))

(assert (= (and mapNonEmpty!7003 ((_ is ValueCellFull!1710) mapValue!7003)) b!175440))

(assert (= (and b!175439 ((_ is ValueCellFull!1710) mapDefault!7003)) b!175444))

(assert (= b!175442 b!175439))

(assert (= start!17514 b!175442))

(declare-fun m!204379 () Bool)

(assert (=> start!17514 m!204379))

(declare-fun m!204381 () Bool)

(assert (=> b!175445 m!204381))

(declare-fun m!204383 () Bool)

(assert (=> b!175442 m!204383))

(declare-fun m!204385 () Bool)

(assert (=> b!175442 m!204385))

(declare-fun m!204387 () Bool)

(assert (=> b!175446 m!204387))

(declare-fun m!204389 () Bool)

(assert (=> mapNonEmpty!7003 m!204389))

(declare-fun m!204391 () Bool)

(assert (=> b!175438 m!204391))

(assert (=> b!175438 m!204391))

(declare-fun m!204393 () Bool)

(assert (=> b!175438 m!204393))

(check-sat (not b!175438) tp_is_empty!4107 (not b!175442) (not start!17514) b_and!10815 (not b_next!4335) (not b!175446) (not b!175445) (not mapNonEmpty!7003))
(check-sat b_and!10815 (not b_next!4335))
(get-model)

(declare-fun d!53473 () Bool)

(assert (=> d!53473 (= (array_inv!2235 (_keys!5471 thiss!1248)) (bvsge (size!3793 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175442 d!53473))

(declare-fun d!53475 () Bool)

(assert (=> d!53475 (= (array_inv!2236 (_values!3602 thiss!1248)) (bvsge (size!3794 (_values!3602 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175442 d!53475))

(declare-fun d!53477 () Bool)

(assert (=> d!53477 (= (validMask!0 (mask!8516 thiss!1248)) (and (or (= (mask!8516 thiss!1248) #b00000000000000000000000000000111) (= (mask!8516 thiss!1248) #b00000000000000000000000000001111) (= (mask!8516 thiss!1248) #b00000000000000000000000000011111) (= (mask!8516 thiss!1248) #b00000000000000000000000000111111) (= (mask!8516 thiss!1248) #b00000000000000000000000001111111) (= (mask!8516 thiss!1248) #b00000000000000000000000011111111) (= (mask!8516 thiss!1248) #b00000000000000000000000111111111) (= (mask!8516 thiss!1248) #b00000000000000000000001111111111) (= (mask!8516 thiss!1248) #b00000000000000000000011111111111) (= (mask!8516 thiss!1248) #b00000000000000000000111111111111) (= (mask!8516 thiss!1248) #b00000000000000000001111111111111) (= (mask!8516 thiss!1248) #b00000000000000000011111111111111) (= (mask!8516 thiss!1248) #b00000000000000000111111111111111) (= (mask!8516 thiss!1248) #b00000000000000001111111111111111) (= (mask!8516 thiss!1248) #b00000000000000011111111111111111) (= (mask!8516 thiss!1248) #b00000000000000111111111111111111) (= (mask!8516 thiss!1248) #b00000000000001111111111111111111) (= (mask!8516 thiss!1248) #b00000000000011111111111111111111) (= (mask!8516 thiss!1248) #b00000000000111111111111111111111) (= (mask!8516 thiss!1248) #b00000000001111111111111111111111) (= (mask!8516 thiss!1248) #b00000000011111111111111111111111) (= (mask!8516 thiss!1248) #b00000000111111111111111111111111) (= (mask!8516 thiss!1248) #b00000001111111111111111111111111) (= (mask!8516 thiss!1248) #b00000011111111111111111111111111) (= (mask!8516 thiss!1248) #b00000111111111111111111111111111) (= (mask!8516 thiss!1248) #b00001111111111111111111111111111) (= (mask!8516 thiss!1248) #b00011111111111111111111111111111) (= (mask!8516 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8516 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175446 d!53477))

(declare-fun d!53479 () Bool)

(declare-fun e!115830 () Bool)

(assert (=> d!53479 e!115830))

(declare-fun res!83194 () Bool)

(assert (=> d!53479 (=> res!83194 e!115830)))

(declare-fun lt!86810 () Bool)

(assert (=> d!53479 (= res!83194 (not lt!86810))))

(declare-fun lt!86807 () Bool)

(assert (=> d!53479 (= lt!86810 lt!86807)))

(declare-datatypes ((Unit!5384 0))(
  ( (Unit!5385) )
))
(declare-fun lt!86809 () Unit!5384)

(declare-fun e!115831 () Unit!5384)

(assert (=> d!53479 (= lt!86809 e!115831)))

(declare-fun c!31430 () Bool)

(assert (=> d!53479 (= c!31430 lt!86807)))

(declare-fun containsKey!193 (List!2221 (_ BitVec 64)) Bool)

(assert (=> d!53479 (= lt!86807 (containsKey!193 (toList!1110 (getCurrentListMap!762 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248))) key!828))))

(assert (=> d!53479 (= (contains!1170 (getCurrentListMap!762 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)) key!828) lt!86810)))

(declare-fun b!175480 () Bool)

(declare-fun lt!86808 () Unit!5384)

(assert (=> b!175480 (= e!115831 lt!86808)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!141 (List!2221 (_ BitVec 64)) Unit!5384)

(assert (=> b!175480 (= lt!86808 (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1110 (getCurrentListMap!762 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248))) key!828))))

(declare-datatypes ((Option!195 0))(
  ( (Some!194 (v!3974 V!5123)) (None!193) )
))
(declare-fun isDefined!142 (Option!195) Bool)

(declare-fun getValueByKey!189 (List!2221 (_ BitVec 64)) Option!195)

(assert (=> b!175480 (isDefined!142 (getValueByKey!189 (toList!1110 (getCurrentListMap!762 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248))) key!828))))

(declare-fun b!175481 () Bool)

(declare-fun Unit!5386 () Unit!5384)

(assert (=> b!175481 (= e!115831 Unit!5386)))

(declare-fun b!175482 () Bool)

(assert (=> b!175482 (= e!115830 (isDefined!142 (getValueByKey!189 (toList!1110 (getCurrentListMap!762 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248))) key!828)))))

(assert (= (and d!53479 c!31430) b!175480))

(assert (= (and d!53479 (not c!31430)) b!175481))

(assert (= (and d!53479 (not res!83194)) b!175482))

(declare-fun m!204411 () Bool)

(assert (=> d!53479 m!204411))

(declare-fun m!204413 () Bool)

(assert (=> b!175480 m!204413))

(declare-fun m!204415 () Bool)

(assert (=> b!175480 m!204415))

(assert (=> b!175480 m!204415))

(declare-fun m!204417 () Bool)

(assert (=> b!175480 m!204417))

(assert (=> b!175482 m!204415))

(assert (=> b!175482 m!204415))

(assert (=> b!175482 m!204417))

(assert (=> b!175438 d!53479))

(declare-fun b!175525 () Bool)

(declare-fun e!115864 () Bool)

(declare-fun e!115867 () Bool)

(assert (=> b!175525 (= e!115864 e!115867)))

(declare-fun res!83221 () Bool)

(declare-fun call!17774 () Bool)

(assert (=> b!175525 (= res!83221 call!17774)))

(assert (=> b!175525 (=> (not res!83221) (not e!115867))))

(declare-fun b!175526 () Bool)

(declare-fun e!115858 () ListLongMap!2189)

(declare-fun call!17773 () ListLongMap!2189)

(assert (=> b!175526 (= e!115858 call!17773)))

(declare-fun bm!17770 () Bool)

(declare-fun call!17777 () ListLongMap!2189)

(declare-fun call!17779 () ListLongMap!2189)

(assert (=> bm!17770 (= call!17777 call!17779)))

(declare-fun bm!17771 () Bool)

(declare-fun call!17775 () ListLongMap!2189)

(declare-fun call!17776 () ListLongMap!2189)

(assert (=> bm!17771 (= call!17775 call!17776)))

(declare-fun bm!17772 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!167 (array!7353 array!7355 (_ BitVec 32) (_ BitVec 32) V!5123 V!5123 (_ BitVec 32) Int) ListLongMap!2189)

(assert (=> bm!17772 (= call!17779 (getCurrentListMapNoExtraKeys!167 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)))))

(declare-fun b!175527 () Bool)

(declare-fun e!115862 () Bool)

(declare-fun call!17778 () Bool)

(assert (=> b!175527 (= e!115862 (not call!17778))))

(declare-fun b!175528 () Bool)

(declare-fun e!115866 () ListLongMap!2189)

(declare-fun e!115869 () ListLongMap!2189)

(assert (=> b!175528 (= e!115866 e!115869)))

(declare-fun c!31444 () Bool)

(assert (=> b!175528 (= c!31444 (and (not (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17773 () Bool)

(declare-fun lt!86874 () ListLongMap!2189)

(assert (=> bm!17773 (= call!17778 (contains!1170 lt!86874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175529 () Bool)

(declare-fun e!115868 () Bool)

(declare-fun apply!134 (ListLongMap!2189 (_ BitVec 64)) V!5123)

(assert (=> b!175529 (= e!115868 (= (apply!134 lt!86874 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3460 thiss!1248)))))

(declare-fun b!175530 () Bool)

(declare-fun e!115860 () Bool)

(declare-fun get!1989 (ValueCell!1710 V!5123) V!5123)

(declare-fun dynLambda!477 (Int (_ BitVec 64)) V!5123)

(assert (=> b!175530 (= e!115860 (= (apply!134 lt!86874 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000)) (get!1989 (select (arr!3492 (_values!3602 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!477 (defaultEntry!3619 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3794 (_values!3602 thiss!1248))))))

(assert (=> b!175530 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3793 (_keys!5471 thiss!1248))))))

(declare-fun b!175531 () Bool)

(assert (=> b!175531 (= e!115864 (not call!17774))))

(declare-fun b!175532 () Bool)

(declare-fun c!31447 () Bool)

(assert (=> b!175532 (= c!31447 (and (not (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!175532 (= e!115869 e!115858)))

(declare-fun bm!17774 () Bool)

(assert (=> bm!17774 (= call!17774 (contains!1170 lt!86874 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175533 () Bool)

(declare-fun res!83217 () Bool)

(declare-fun e!115859 () Bool)

(assert (=> b!175533 (=> (not res!83217) (not e!115859))))

(assert (=> b!175533 (= res!83217 e!115862)))

(declare-fun c!31443 () Bool)

(assert (=> b!175533 (= c!31443 (not (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!53481 () Bool)

(assert (=> d!53481 e!115859))

(declare-fun res!83215 () Bool)

(assert (=> d!53481 (=> (not res!83215) (not e!115859))))

(assert (=> d!53481 (= res!83215 (or (bvsge #b00000000000000000000000000000000 (size!3793 (_keys!5471 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3793 (_keys!5471 thiss!1248))))))))

(declare-fun lt!86855 () ListLongMap!2189)

(assert (=> d!53481 (= lt!86874 lt!86855)))

(declare-fun lt!86861 () Unit!5384)

(declare-fun e!115861 () Unit!5384)

(assert (=> d!53481 (= lt!86861 e!115861)))

(declare-fun c!31448 () Bool)

(declare-fun e!115865 () Bool)

(assert (=> d!53481 (= c!31448 e!115865)))

(declare-fun res!83216 () Bool)

(assert (=> d!53481 (=> (not res!83216) (not e!115865))))

(assert (=> d!53481 (= res!83216 (bvslt #b00000000000000000000000000000000 (size!3793 (_keys!5471 thiss!1248))))))

(assert (=> d!53481 (= lt!86855 e!115866)))

(declare-fun c!31445 () Bool)

(assert (=> d!53481 (= c!31445 (and (not (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53481 (validMask!0 (mask!8516 thiss!1248))))

(assert (=> d!53481 (= (getCurrentListMap!762 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)) lt!86874)))

(declare-fun bm!17775 () Bool)

(declare-fun +!251 (ListLongMap!2189 tuple2!3262) ListLongMap!2189)

(assert (=> bm!17775 (= call!17776 (+!251 (ite c!31445 call!17779 (ite c!31444 call!17777 call!17773)) (ite (or c!31445 c!31444) (tuple2!3263 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3460 thiss!1248)) (tuple2!3263 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3460 thiss!1248)))))))

(declare-fun b!175534 () Bool)

(declare-fun Unit!5387 () Unit!5384)

(assert (=> b!175534 (= e!115861 Unit!5387)))

(declare-fun b!175535 () Bool)

(declare-fun lt!86875 () Unit!5384)

(assert (=> b!175535 (= e!115861 lt!86875)))

(declare-fun lt!86872 () ListLongMap!2189)

(assert (=> b!175535 (= lt!86872 (getCurrentListMapNoExtraKeys!167 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)))))

(declare-fun lt!86864 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86862 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86862 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86876 () Unit!5384)

(declare-fun addStillContains!110 (ListLongMap!2189 (_ BitVec 64) V!5123 (_ BitVec 64)) Unit!5384)

(assert (=> b!175535 (= lt!86876 (addStillContains!110 lt!86872 lt!86864 (zeroValue!3460 thiss!1248) lt!86862))))

(assert (=> b!175535 (contains!1170 (+!251 lt!86872 (tuple2!3263 lt!86864 (zeroValue!3460 thiss!1248))) lt!86862)))

(declare-fun lt!86867 () Unit!5384)

(assert (=> b!175535 (= lt!86867 lt!86876)))

(declare-fun lt!86866 () ListLongMap!2189)

(assert (=> b!175535 (= lt!86866 (getCurrentListMapNoExtraKeys!167 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)))))

(declare-fun lt!86863 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86863 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86873 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86873 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86869 () Unit!5384)

(declare-fun addApplyDifferent!110 (ListLongMap!2189 (_ BitVec 64) V!5123 (_ BitVec 64)) Unit!5384)

(assert (=> b!175535 (= lt!86869 (addApplyDifferent!110 lt!86866 lt!86863 (minValue!3460 thiss!1248) lt!86873))))

(assert (=> b!175535 (= (apply!134 (+!251 lt!86866 (tuple2!3263 lt!86863 (minValue!3460 thiss!1248))) lt!86873) (apply!134 lt!86866 lt!86873))))

(declare-fun lt!86858 () Unit!5384)

(assert (=> b!175535 (= lt!86858 lt!86869)))

(declare-fun lt!86857 () ListLongMap!2189)

(assert (=> b!175535 (= lt!86857 (getCurrentListMapNoExtraKeys!167 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)))))

(declare-fun lt!86860 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86860 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86865 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86865 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86856 () Unit!5384)

(assert (=> b!175535 (= lt!86856 (addApplyDifferent!110 lt!86857 lt!86860 (zeroValue!3460 thiss!1248) lt!86865))))

(assert (=> b!175535 (= (apply!134 (+!251 lt!86857 (tuple2!3263 lt!86860 (zeroValue!3460 thiss!1248))) lt!86865) (apply!134 lt!86857 lt!86865))))

(declare-fun lt!86859 () Unit!5384)

(assert (=> b!175535 (= lt!86859 lt!86856)))

(declare-fun lt!86868 () ListLongMap!2189)

(assert (=> b!175535 (= lt!86868 (getCurrentListMapNoExtraKeys!167 (_keys!5471 thiss!1248) (_values!3602 thiss!1248) (mask!8516 thiss!1248) (extraKeys!3356 thiss!1248) (zeroValue!3460 thiss!1248) (minValue!3460 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3619 thiss!1248)))))

(declare-fun lt!86871 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86871 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86870 () (_ BitVec 64))

(assert (=> b!175535 (= lt!86870 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175535 (= lt!86875 (addApplyDifferent!110 lt!86868 lt!86871 (minValue!3460 thiss!1248) lt!86870))))

(assert (=> b!175535 (= (apply!134 (+!251 lt!86868 (tuple2!3263 lt!86871 (minValue!3460 thiss!1248))) lt!86870) (apply!134 lt!86868 lt!86870))))

(declare-fun b!175536 () Bool)

(declare-fun e!115863 () Bool)

(assert (=> b!175536 (= e!115863 e!115860)))

(declare-fun res!83219 () Bool)

(assert (=> b!175536 (=> (not res!83219) (not e!115860))))

(assert (=> b!175536 (= res!83219 (contains!1170 lt!86874 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175536 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3793 (_keys!5471 thiss!1248))))))

(declare-fun bm!17776 () Bool)

(assert (=> bm!17776 (= call!17773 call!17777)))

(declare-fun b!175537 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175537 (= e!115865 (validKeyInArray!0 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175538 () Bool)

(declare-fun e!115870 () Bool)

(assert (=> b!175538 (= e!115870 (validKeyInArray!0 (select (arr!3491 (_keys!5471 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175539 () Bool)

(assert (=> b!175539 (= e!115862 e!115868)))

(declare-fun res!83213 () Bool)

(assert (=> b!175539 (= res!83213 call!17778)))

(assert (=> b!175539 (=> (not res!83213) (not e!115868))))

(declare-fun b!175540 () Bool)

(assert (=> b!175540 (= e!115866 (+!251 call!17776 (tuple2!3263 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3460 thiss!1248))))))

(declare-fun b!175541 () Bool)

(assert (=> b!175541 (= e!115859 e!115864)))

(declare-fun c!31446 () Bool)

(assert (=> b!175541 (= c!31446 (not (= (bvand (extraKeys!3356 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175542 () Bool)

(assert (=> b!175542 (= e!115869 call!17775)))

(declare-fun b!175543 () Bool)

(assert (=> b!175543 (= e!115867 (= (apply!134 lt!86874 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3460 thiss!1248)))))

(declare-fun b!175544 () Bool)

(assert (=> b!175544 (= e!115858 call!17775)))

(declare-fun b!175545 () Bool)

(declare-fun res!83218 () Bool)

(assert (=> b!175545 (=> (not res!83218) (not e!115859))))

(assert (=> b!175545 (= res!83218 e!115863)))

(declare-fun res!83214 () Bool)

(assert (=> b!175545 (=> res!83214 e!115863)))

(assert (=> b!175545 (= res!83214 (not e!115870))))

(declare-fun res!83220 () Bool)

(assert (=> b!175545 (=> (not res!83220) (not e!115870))))

(assert (=> b!175545 (= res!83220 (bvslt #b00000000000000000000000000000000 (size!3793 (_keys!5471 thiss!1248))))))

(assert (= (and d!53481 c!31445) b!175540))

(assert (= (and d!53481 (not c!31445)) b!175528))

(assert (= (and b!175528 c!31444) b!175542))

(assert (= (and b!175528 (not c!31444)) b!175532))

(assert (= (and b!175532 c!31447) b!175544))

(assert (= (and b!175532 (not c!31447)) b!175526))

(assert (= (or b!175544 b!175526) bm!17776))

(assert (= (or b!175542 bm!17776) bm!17770))

(assert (= (or b!175542 b!175544) bm!17771))

(assert (= (or b!175540 bm!17770) bm!17772))

(assert (= (or b!175540 bm!17771) bm!17775))

(assert (= (and d!53481 res!83216) b!175537))

(assert (= (and d!53481 c!31448) b!175535))

(assert (= (and d!53481 (not c!31448)) b!175534))

(assert (= (and d!53481 res!83215) b!175545))

(assert (= (and b!175545 res!83220) b!175538))

(assert (= (and b!175545 (not res!83214)) b!175536))

(assert (= (and b!175536 res!83219) b!175530))

(assert (= (and b!175545 res!83218) b!175533))

(assert (= (and b!175533 c!31443) b!175539))

(assert (= (and b!175533 (not c!31443)) b!175527))

(assert (= (and b!175539 res!83213) b!175529))

(assert (= (or b!175539 b!175527) bm!17773))

(assert (= (and b!175533 res!83217) b!175541))

(assert (= (and b!175541 c!31446) b!175525))

(assert (= (and b!175541 (not c!31446)) b!175531))

(assert (= (and b!175525 res!83221) b!175543))

(assert (= (or b!175525 b!175531) bm!17774))

(declare-fun b_lambda!7011 () Bool)

(assert (=> (not b_lambda!7011) (not b!175530)))

(declare-fun t!7042 () Bool)

(declare-fun tb!2779 () Bool)

(assert (=> (and b!175442 (= (defaultEntry!3619 thiss!1248) (defaultEntry!3619 thiss!1248)) t!7042) tb!2779))

(declare-fun result!4611 () Bool)

(assert (=> tb!2779 (= result!4611 tp_is_empty!4107)))

(assert (=> b!175530 t!7042))

(declare-fun b_and!10819 () Bool)

(assert (= b_and!10815 (and (=> t!7042 result!4611) b_and!10819)))

(declare-fun m!204419 () Bool)

(assert (=> b!175537 m!204419))

(assert (=> b!175537 m!204419))

(declare-fun m!204421 () Bool)

(assert (=> b!175537 m!204421))

(declare-fun m!204423 () Bool)

(assert (=> bm!17775 m!204423))

(declare-fun m!204425 () Bool)

(assert (=> bm!17774 m!204425))

(assert (=> b!175538 m!204419))

(assert (=> b!175538 m!204419))

(assert (=> b!175538 m!204421))

(declare-fun m!204427 () Bool)

(assert (=> bm!17773 m!204427))

(assert (=> b!175536 m!204419))

(assert (=> b!175536 m!204419))

(declare-fun m!204429 () Bool)

(assert (=> b!175536 m!204429))

(declare-fun m!204431 () Bool)

(assert (=> b!175543 m!204431))

(assert (=> d!53481 m!204387))

(assert (=> b!175530 m!204419))

(declare-fun m!204433 () Bool)

(assert (=> b!175530 m!204433))

(assert (=> b!175530 m!204419))

(declare-fun m!204435 () Bool)

(assert (=> b!175530 m!204435))

(assert (=> b!175530 m!204435))

(declare-fun m!204437 () Bool)

(assert (=> b!175530 m!204437))

(declare-fun m!204439 () Bool)

(assert (=> b!175530 m!204439))

(assert (=> b!175530 m!204437))

(declare-fun m!204441 () Bool)

(assert (=> b!175535 m!204441))

(assert (=> b!175535 m!204441))

(declare-fun m!204443 () Bool)

(assert (=> b!175535 m!204443))

(assert (=> b!175535 m!204419))

(declare-fun m!204445 () Bool)

(assert (=> b!175535 m!204445))

(declare-fun m!204447 () Bool)

(assert (=> b!175535 m!204447))

(declare-fun m!204449 () Bool)

(assert (=> b!175535 m!204449))

(declare-fun m!204451 () Bool)

(assert (=> b!175535 m!204451))

(declare-fun m!204453 () Bool)

(assert (=> b!175535 m!204453))

(declare-fun m!204455 () Bool)

(assert (=> b!175535 m!204455))

(declare-fun m!204457 () Bool)

(assert (=> b!175535 m!204457))

(declare-fun m!204459 () Bool)

(assert (=> b!175535 m!204459))

(declare-fun m!204461 () Bool)

(assert (=> b!175535 m!204461))

(assert (=> b!175535 m!204453))

(declare-fun m!204463 () Bool)

(assert (=> b!175535 m!204463))

(declare-fun m!204465 () Bool)

(assert (=> b!175535 m!204465))

(assert (=> b!175535 m!204447))

(declare-fun m!204467 () Bool)

(assert (=> b!175535 m!204467))

(declare-fun m!204469 () Bool)

(assert (=> b!175535 m!204469))

(assert (=> b!175535 m!204445))

(declare-fun m!204471 () Bool)

(assert (=> b!175535 m!204471))

(assert (=> bm!17772 m!204463))

(declare-fun m!204473 () Bool)

(assert (=> b!175540 m!204473))

(declare-fun m!204475 () Bool)

(assert (=> b!175529 m!204475))

(assert (=> b!175438 d!53481))

(declare-fun b!175560 () Bool)

(declare-fun e!115878 () SeekEntryResult!550)

(declare-fun lt!86885 () SeekEntryResult!550)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7353 (_ BitVec 32)) SeekEntryResult!550)

(assert (=> b!175560 (= e!115878 (seekKeyOrZeroReturnVacant!0 (x!19290 lt!86885) (index!4370 lt!86885) (index!4370 lt!86885) key!828 (_keys!5471 thiss!1248) (mask!8516 thiss!1248)))))

(declare-fun b!175561 () Bool)

(declare-fun e!115877 () SeekEntryResult!550)

(assert (=> b!175561 (= e!115877 (Found!550 (index!4370 lt!86885)))))

(declare-fun b!175563 () Bool)

(declare-fun c!31456 () Bool)

(declare-fun lt!86883 () (_ BitVec 64))

(assert (=> b!175563 (= c!31456 (= lt!86883 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175563 (= e!115877 e!115878)))

(declare-fun d!53483 () Bool)

(declare-fun lt!86884 () SeekEntryResult!550)

(assert (=> d!53483 (and (or ((_ is Undefined!550) lt!86884) (not ((_ is Found!550) lt!86884)) (and (bvsge (index!4369 lt!86884) #b00000000000000000000000000000000) (bvslt (index!4369 lt!86884) (size!3793 (_keys!5471 thiss!1248))))) (or ((_ is Undefined!550) lt!86884) ((_ is Found!550) lt!86884) (not ((_ is MissingZero!550) lt!86884)) (and (bvsge (index!4368 lt!86884) #b00000000000000000000000000000000) (bvslt (index!4368 lt!86884) (size!3793 (_keys!5471 thiss!1248))))) (or ((_ is Undefined!550) lt!86884) ((_ is Found!550) lt!86884) ((_ is MissingZero!550) lt!86884) (not ((_ is MissingVacant!550) lt!86884)) (and (bvsge (index!4371 lt!86884) #b00000000000000000000000000000000) (bvslt (index!4371 lt!86884) (size!3793 (_keys!5471 thiss!1248))))) (or ((_ is Undefined!550) lt!86884) (ite ((_ is Found!550) lt!86884) (= (select (arr!3491 (_keys!5471 thiss!1248)) (index!4369 lt!86884)) key!828) (ite ((_ is MissingZero!550) lt!86884) (= (select (arr!3491 (_keys!5471 thiss!1248)) (index!4368 lt!86884)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!550) lt!86884) (= (select (arr!3491 (_keys!5471 thiss!1248)) (index!4371 lt!86884)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!115879 () SeekEntryResult!550)

(assert (=> d!53483 (= lt!86884 e!115879)))

(declare-fun c!31457 () Bool)

(assert (=> d!53483 (= c!31457 (and ((_ is Intermediate!550) lt!86885) (undefined!1362 lt!86885)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7353 (_ BitVec 32)) SeekEntryResult!550)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53483 (= lt!86885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8516 thiss!1248)) key!828 (_keys!5471 thiss!1248) (mask!8516 thiss!1248)))))

(assert (=> d!53483 (validMask!0 (mask!8516 thiss!1248))))

(assert (=> d!53483 (= (seekEntryOrOpen!0 key!828 (_keys!5471 thiss!1248) (mask!8516 thiss!1248)) lt!86884)))

(declare-fun b!175562 () Bool)

(assert (=> b!175562 (= e!115879 Undefined!550)))

(declare-fun b!175564 () Bool)

(assert (=> b!175564 (= e!115879 e!115877)))

(assert (=> b!175564 (= lt!86883 (select (arr!3491 (_keys!5471 thiss!1248)) (index!4370 lt!86885)))))

(declare-fun c!31455 () Bool)

(assert (=> b!175564 (= c!31455 (= lt!86883 key!828))))

(declare-fun b!175565 () Bool)

(assert (=> b!175565 (= e!115878 (MissingZero!550 (index!4370 lt!86885)))))

(assert (= (and d!53483 c!31457) b!175562))

(assert (= (and d!53483 (not c!31457)) b!175564))

(assert (= (and b!175564 c!31455) b!175561))

(assert (= (and b!175564 (not c!31455)) b!175563))

(assert (= (and b!175563 c!31456) b!175565))

(assert (= (and b!175563 (not c!31456)) b!175560))

(declare-fun m!204477 () Bool)

(assert (=> b!175560 m!204477))

(declare-fun m!204479 () Bool)

(assert (=> d!53483 m!204479))

(declare-fun m!204481 () Bool)

(assert (=> d!53483 m!204481))

(declare-fun m!204483 () Bool)

(assert (=> d!53483 m!204483))

(assert (=> d!53483 m!204479))

(declare-fun m!204485 () Bool)

(assert (=> d!53483 m!204485))

(declare-fun m!204487 () Bool)

(assert (=> d!53483 m!204487))

(assert (=> d!53483 m!204387))

(declare-fun m!204489 () Bool)

(assert (=> b!175564 m!204489))

(assert (=> b!175445 d!53483))

(declare-fun d!53485 () Bool)

(declare-fun res!83228 () Bool)

(declare-fun e!115882 () Bool)

(assert (=> d!53485 (=> (not res!83228) (not e!115882))))

(declare-fun simpleValid!148 (LongMapFixedSize!2328) Bool)

(assert (=> d!53485 (= res!83228 (simpleValid!148 thiss!1248))))

(assert (=> d!53485 (= (valid!982 thiss!1248) e!115882)))

(declare-fun b!175572 () Bool)

(declare-fun res!83229 () Bool)

(assert (=> b!175572 (=> (not res!83229) (not e!115882))))

(declare-fun arrayCountValidKeys!0 (array!7353 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175572 (= res!83229 (= (arrayCountValidKeys!0 (_keys!5471 thiss!1248) #b00000000000000000000000000000000 (size!3793 (_keys!5471 thiss!1248))) (_size!1213 thiss!1248)))))

(declare-fun b!175573 () Bool)

(declare-fun res!83230 () Bool)

(assert (=> b!175573 (=> (not res!83230) (not e!115882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7353 (_ BitVec 32)) Bool)

(assert (=> b!175573 (= res!83230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5471 thiss!1248) (mask!8516 thiss!1248)))))

(declare-fun b!175574 () Bool)

(declare-datatypes ((List!2223 0))(
  ( (Nil!2220) (Cons!2219 (h!2838 (_ BitVec 64)) (t!7043 List!2223)) )
))
(declare-fun arrayNoDuplicates!0 (array!7353 (_ BitVec 32) List!2223) Bool)

(assert (=> b!175574 (= e!115882 (arrayNoDuplicates!0 (_keys!5471 thiss!1248) #b00000000000000000000000000000000 Nil!2220))))

(assert (= (and d!53485 res!83228) b!175572))

(assert (= (and b!175572 res!83229) b!175573))

(assert (= (and b!175573 res!83230) b!175574))

(declare-fun m!204491 () Bool)

(assert (=> d!53485 m!204491))

(declare-fun m!204493 () Bool)

(assert (=> b!175572 m!204493))

(declare-fun m!204495 () Bool)

(assert (=> b!175573 m!204495))

(declare-fun m!204497 () Bool)

(assert (=> b!175574 m!204497))

(assert (=> start!17514 d!53485))

(declare-fun mapNonEmpty!7009 () Bool)

(declare-fun mapRes!7009 () Bool)

(declare-fun tp!15694 () Bool)

(declare-fun e!115888 () Bool)

(assert (=> mapNonEmpty!7009 (= mapRes!7009 (and tp!15694 e!115888))))

(declare-fun mapValue!7009 () ValueCell!1710)

(declare-fun mapRest!7009 () (Array (_ BitVec 32) ValueCell!1710))

(declare-fun mapKey!7009 () (_ BitVec 32))

(assert (=> mapNonEmpty!7009 (= mapRest!7003 (store mapRest!7009 mapKey!7009 mapValue!7009))))

(declare-fun mapIsEmpty!7009 () Bool)

(assert (=> mapIsEmpty!7009 mapRes!7009))

(declare-fun b!175582 () Bool)

(declare-fun e!115887 () Bool)

(assert (=> b!175582 (= e!115887 tp_is_empty!4107)))

(declare-fun condMapEmpty!7009 () Bool)

(declare-fun mapDefault!7009 () ValueCell!1710)

(assert (=> mapNonEmpty!7003 (= condMapEmpty!7009 (= mapRest!7003 ((as const (Array (_ BitVec 32) ValueCell!1710)) mapDefault!7009)))))

(assert (=> mapNonEmpty!7003 (= tp!15685 (and e!115887 mapRes!7009))))

(declare-fun b!175581 () Bool)

(assert (=> b!175581 (= e!115888 tp_is_empty!4107)))

(assert (= (and mapNonEmpty!7003 condMapEmpty!7009) mapIsEmpty!7009))

(assert (= (and mapNonEmpty!7003 (not condMapEmpty!7009)) mapNonEmpty!7009))

(assert (= (and mapNonEmpty!7009 ((_ is ValueCellFull!1710) mapValue!7009)) b!175581))

(assert (= (and mapNonEmpty!7003 ((_ is ValueCellFull!1710) mapDefault!7009)) b!175582))

(declare-fun m!204499 () Bool)

(assert (=> mapNonEmpty!7009 m!204499))

(declare-fun b_lambda!7013 () Bool)

(assert (= b_lambda!7011 (or (and b!175442 b_free!4335) b_lambda!7013)))

(check-sat (not b!175529) (not b!175572) (not bm!17772) (not b!175480) (not b!175543) (not b!175482) (not d!53485) (not bm!17775) (not b!175573) (not b!175538) tp_is_empty!4107 (not b!175537) (not b!175540) (not b_lambda!7013) b_and!10819 (not b!175560) (not b!175535) (not bm!17774) (not d!53481) (not b!175536) (not d!53483) (not b_next!4335) (not d!53479) (not mapNonEmpty!7009) (not b!175574) (not b!175530) (not bm!17773))
(check-sat b_and!10819 (not b_next!4335))
