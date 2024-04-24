; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17516 () Bool)

(assert start!17516)

(declare-fun b!175460 () Bool)

(declare-fun b_free!4333 () Bool)

(declare-fun b_next!4333 () Bool)

(assert (=> b!175460 (= b_free!4333 (not b_next!4333))))

(declare-fun tp!15678 () Bool)

(declare-fun b_and!10827 () Bool)

(assert (=> b!175460 (= tp!15678 b_and!10827)))

(declare-fun mapIsEmpty!7000 () Bool)

(declare-fun mapRes!7000 () Bool)

(assert (=> mapIsEmpty!7000 mapRes!7000))

(declare-fun b!175458 () Bool)

(declare-fun e!115812 () Bool)

(declare-fun tp_is_empty!4105 () Bool)

(assert (=> b!175458 (= e!115812 tp_is_empty!4105)))

(declare-fun b!175459 () Bool)

(declare-fun e!115809 () Bool)

(assert (=> b!175459 (= e!115809 tp_is_empty!4105)))

(declare-datatypes ((V!5121 0))(
  ( (V!5122 (val!2097 Int)) )
))
(declare-datatypes ((ValueCell!1709 0))(
  ( (ValueCellFull!1709 (v!3972 V!5121)) (EmptyCell!1709) )
))
(declare-datatypes ((array!7335 0))(
  ( (array!7336 (arr!3482 (Array (_ BitVec 32) (_ BitVec 64))) (size!3784 (_ BitVec 32))) )
))
(declare-datatypes ((array!7337 0))(
  ( (array!7338 (arr!3483 (Array (_ BitVec 32) ValueCell!1709)) (size!3785 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2326 0))(
  ( (LongMapFixedSize!2327 (defaultEntry!3618 Int) (mask!8515 (_ BitVec 32)) (extraKeys!3355 (_ BitVec 32)) (zeroValue!3459 V!5121) (minValue!3459 V!5121) (_size!1212 (_ BitVec 32)) (_keys!5470 array!7335) (_values!3601 array!7337) (_vacant!1212 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2326)

(declare-fun e!115813 () Bool)

(declare-fun e!115810 () Bool)

(declare-fun array_inv!2245 (array!7335) Bool)

(declare-fun array_inv!2246 (array!7337) Bool)

(assert (=> b!175460 (= e!115810 (and tp!15678 tp_is_empty!4105 (array_inv!2245 (_keys!5470 thiss!1248)) (array_inv!2246 (_values!3601 thiss!1248)) e!115813))))

(declare-fun res!83180 () Bool)

(declare-fun e!115808 () Bool)

(assert (=> start!17516 (=> (not res!83180) (not e!115808))))

(declare-fun valid!996 (LongMapFixedSize!2326) Bool)

(assert (=> start!17516 (= res!83180 (valid!996 thiss!1248))))

(assert (=> start!17516 e!115808))

(assert (=> start!17516 e!115810))

(assert (=> start!17516 true))

(declare-fun b!175461 () Bool)

(assert (=> b!175461 (= e!115808 (and (= (size!3785 (_values!3601 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8515 thiss!1248))) (= (size!3784 (_keys!5470 thiss!1248)) (size!3785 (_values!3601 thiss!1248))) (bvslt (mask!8515 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!7000 () Bool)

(declare-fun tp!15679 () Bool)

(assert (=> mapNonEmpty!7000 (= mapRes!7000 (and tp!15679 e!115809))))

(declare-fun mapRest!7000 () (Array (_ BitVec 32) ValueCell!1709))

(declare-fun mapValue!7000 () ValueCell!1709)

(declare-fun mapKey!7000 () (_ BitVec 32))

(assert (=> mapNonEmpty!7000 (= (arr!3483 (_values!3601 thiss!1248)) (store mapRest!7000 mapKey!7000 mapValue!7000))))

(declare-fun b!175462 () Bool)

(declare-fun res!83181 () Bool)

(assert (=> b!175462 (=> (not res!83181) (not e!115808))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!543 0))(
  ( (MissingZero!543 (index!4340 (_ BitVec 32))) (Found!543 (index!4341 (_ BitVec 32))) (Intermediate!543 (undefined!1355 Bool) (index!4342 (_ BitVec 32)) (x!19283 (_ BitVec 32))) (Undefined!543) (MissingVacant!543 (index!4343 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7335 (_ BitVec 32)) SeekEntryResult!543)

(assert (=> b!175462 (= res!83181 ((_ is Undefined!543) (seekEntryOrOpen!0 key!828 (_keys!5470 thiss!1248) (mask!8515 thiss!1248))))))

(declare-fun b!175463 () Bool)

(declare-fun res!83178 () Bool)

(assert (=> b!175463 (=> (not res!83178) (not e!115808))))

(assert (=> b!175463 (= res!83178 (not (= key!828 (bvneg key!828))))))

(declare-fun b!175464 () Bool)

(assert (=> b!175464 (= e!115813 (and e!115812 mapRes!7000))))

(declare-fun condMapEmpty!7000 () Bool)

(declare-fun mapDefault!7000 () ValueCell!1709)

(assert (=> b!175464 (= condMapEmpty!7000 (= (arr!3483 (_values!3601 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1709)) mapDefault!7000)))))

(declare-fun b!175465 () Bool)

(declare-fun res!83179 () Bool)

(assert (=> b!175465 (=> (not res!83179) (not e!115808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!175465 (= res!83179 (validMask!0 (mask!8515 thiss!1248)))))

(declare-fun b!175466 () Bool)

(declare-fun res!83182 () Bool)

(assert (=> b!175466 (=> (not res!83182) (not e!115808))))

(declare-datatypes ((tuple2!3218 0))(
  ( (tuple2!3219 (_1!1620 (_ BitVec 64)) (_2!1620 V!5121)) )
))
(declare-datatypes ((List!2200 0))(
  ( (Nil!2197) (Cons!2196 (h!2815 tuple2!3218) (t!7010 List!2200)) )
))
(declare-datatypes ((ListLongMap!2151 0))(
  ( (ListLongMap!2152 (toList!1091 List!2200)) )
))
(declare-fun contains!1162 (ListLongMap!2151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!746 (array!7335 array!7337 (_ BitVec 32) (_ BitVec 32) V!5121 V!5121 (_ BitVec 32) Int) ListLongMap!2151)

(assert (=> b!175466 (= res!83182 (contains!1162 (getCurrentListMap!746 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)) key!828))))

(assert (= (and start!17516 res!83180) b!175463))

(assert (= (and b!175463 res!83178) b!175462))

(assert (= (and b!175462 res!83181) b!175466))

(assert (= (and b!175466 res!83182) b!175465))

(assert (= (and b!175465 res!83179) b!175461))

(assert (= (and b!175464 condMapEmpty!7000) mapIsEmpty!7000))

(assert (= (and b!175464 (not condMapEmpty!7000)) mapNonEmpty!7000))

(assert (= (and mapNonEmpty!7000 ((_ is ValueCellFull!1709) mapValue!7000)) b!175459))

(assert (= (and b!175464 ((_ is ValueCellFull!1709) mapDefault!7000)) b!175458))

(assert (= b!175460 b!175464))

(assert (= start!17516 b!175460))

(declare-fun m!204545 () Bool)

(assert (=> b!175462 m!204545))

(declare-fun m!204547 () Bool)

(assert (=> b!175460 m!204547))

(declare-fun m!204549 () Bool)

(assert (=> b!175460 m!204549))

(declare-fun m!204551 () Bool)

(assert (=> b!175466 m!204551))

(assert (=> b!175466 m!204551))

(declare-fun m!204553 () Bool)

(assert (=> b!175466 m!204553))

(declare-fun m!204555 () Bool)

(assert (=> mapNonEmpty!7000 m!204555))

(declare-fun m!204557 () Bool)

(assert (=> b!175465 m!204557))

(declare-fun m!204559 () Bool)

(assert (=> start!17516 m!204559))

(check-sat b_and!10827 (not b!175460) (not b!175465) (not mapNonEmpty!7000) (not b!175466) tp_is_empty!4105 (not start!17516) (not b_next!4333) (not b!175462))
(check-sat b_and!10827 (not b_next!4333))
(get-model)

(declare-fun d!53547 () Bool)

(assert (=> d!53547 (= (validMask!0 (mask!8515 thiss!1248)) (and (or (= (mask!8515 thiss!1248) #b00000000000000000000000000000111) (= (mask!8515 thiss!1248) #b00000000000000000000000000001111) (= (mask!8515 thiss!1248) #b00000000000000000000000000011111) (= (mask!8515 thiss!1248) #b00000000000000000000000000111111) (= (mask!8515 thiss!1248) #b00000000000000000000000001111111) (= (mask!8515 thiss!1248) #b00000000000000000000000011111111) (= (mask!8515 thiss!1248) #b00000000000000000000000111111111) (= (mask!8515 thiss!1248) #b00000000000000000000001111111111) (= (mask!8515 thiss!1248) #b00000000000000000000011111111111) (= (mask!8515 thiss!1248) #b00000000000000000000111111111111) (= (mask!8515 thiss!1248) #b00000000000000000001111111111111) (= (mask!8515 thiss!1248) #b00000000000000000011111111111111) (= (mask!8515 thiss!1248) #b00000000000000000111111111111111) (= (mask!8515 thiss!1248) #b00000000000000001111111111111111) (= (mask!8515 thiss!1248) #b00000000000000011111111111111111) (= (mask!8515 thiss!1248) #b00000000000000111111111111111111) (= (mask!8515 thiss!1248) #b00000000000001111111111111111111) (= (mask!8515 thiss!1248) #b00000000000011111111111111111111) (= (mask!8515 thiss!1248) #b00000000000111111111111111111111) (= (mask!8515 thiss!1248) #b00000000001111111111111111111111) (= (mask!8515 thiss!1248) #b00000000011111111111111111111111) (= (mask!8515 thiss!1248) #b00000000111111111111111111111111) (= (mask!8515 thiss!1248) #b00000001111111111111111111111111) (= (mask!8515 thiss!1248) #b00000011111111111111111111111111) (= (mask!8515 thiss!1248) #b00000111111111111111111111111111) (= (mask!8515 thiss!1248) #b00001111111111111111111111111111) (= (mask!8515 thiss!1248) #b00011111111111111111111111111111) (= (mask!8515 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8515 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!175465 d!53547))

(declare-fun d!53549 () Bool)

(declare-fun e!115855 () Bool)

(assert (=> d!53549 e!115855))

(declare-fun res!83215 () Bool)

(assert (=> d!53549 (=> res!83215 e!115855)))

(declare-fun lt!86868 () Bool)

(assert (=> d!53549 (= res!83215 (not lt!86868))))

(declare-fun lt!86867 () Bool)

(assert (=> d!53549 (= lt!86868 lt!86867)))

(declare-datatypes ((Unit!5385 0))(
  ( (Unit!5386) )
))
(declare-fun lt!86866 () Unit!5385)

(declare-fun e!115854 () Unit!5385)

(assert (=> d!53549 (= lt!86866 e!115854)))

(declare-fun c!31443 () Bool)

(assert (=> d!53549 (= c!31443 lt!86867)))

(declare-fun containsKey!193 (List!2200 (_ BitVec 64)) Bool)

(assert (=> d!53549 (= lt!86867 (containsKey!193 (toList!1091 (getCurrentListMap!746 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828))))

(assert (=> d!53549 (= (contains!1162 (getCurrentListMap!746 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)) key!828) lt!86868)))

(declare-fun b!175527 () Bool)

(declare-fun lt!86869 () Unit!5385)

(assert (=> b!175527 (= e!115854 lt!86869)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!141 (List!2200 (_ BitVec 64)) Unit!5385)

(assert (=> b!175527 (= lt!86869 (lemmaContainsKeyImpliesGetValueByKeyDefined!141 (toList!1091 (getCurrentListMap!746 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828))))

(declare-datatypes ((Option!196 0))(
  ( (Some!195 (v!3975 V!5121)) (None!194) )
))
(declare-fun isDefined!142 (Option!196) Bool)

(declare-fun getValueByKey!190 (List!2200 (_ BitVec 64)) Option!196)

(assert (=> b!175527 (isDefined!142 (getValueByKey!190 (toList!1091 (getCurrentListMap!746 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828))))

(declare-fun b!175528 () Bool)

(declare-fun Unit!5387 () Unit!5385)

(assert (=> b!175528 (= e!115854 Unit!5387)))

(declare-fun b!175529 () Bool)

(assert (=> b!175529 (= e!115855 (isDefined!142 (getValueByKey!190 (toList!1091 (getCurrentListMap!746 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248))) key!828)))))

(assert (= (and d!53549 c!31443) b!175527))

(assert (= (and d!53549 (not c!31443)) b!175528))

(assert (= (and d!53549 (not res!83215)) b!175529))

(declare-fun m!204593 () Bool)

(assert (=> d!53549 m!204593))

(declare-fun m!204595 () Bool)

(assert (=> b!175527 m!204595))

(declare-fun m!204597 () Bool)

(assert (=> b!175527 m!204597))

(assert (=> b!175527 m!204597))

(declare-fun m!204599 () Bool)

(assert (=> b!175527 m!204599))

(assert (=> b!175529 m!204597))

(assert (=> b!175529 m!204597))

(assert (=> b!175529 m!204599))

(assert (=> b!175466 d!53549))

(declare-fun b!175572 () Bool)

(declare-fun e!115894 () ListLongMap!2151)

(declare-fun call!17763 () ListLongMap!2151)

(declare-fun +!251 (ListLongMap!2151 tuple2!3218) ListLongMap!2151)

(assert (=> b!175572 (= e!115894 (+!251 call!17763 (tuple2!3219 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3459 thiss!1248))))))

(declare-fun b!175573 () Bool)

(declare-fun e!115893 () ListLongMap!2151)

(declare-fun call!17766 () ListLongMap!2151)

(assert (=> b!175573 (= e!115893 call!17766)))

(declare-fun b!175574 () Bool)

(declare-fun e!115886 () Bool)

(declare-fun call!17765 () Bool)

(assert (=> b!175574 (= e!115886 (not call!17765))))

(declare-fun b!175575 () Bool)

(declare-fun res!83238 () Bool)

(declare-fun e!115888 () Bool)

(assert (=> b!175575 (=> (not res!83238) (not e!115888))))

(declare-fun e!115882 () Bool)

(assert (=> b!175575 (= res!83238 e!115882)))

(declare-fun res!83242 () Bool)

(assert (=> b!175575 (=> res!83242 e!115882)))

(declare-fun e!115885 () Bool)

(assert (=> b!175575 (= res!83242 (not e!115885))))

(declare-fun res!83234 () Bool)

(assert (=> b!175575 (=> (not res!83234) (not e!115885))))

(assert (=> b!175575 (= res!83234 (bvslt #b00000000000000000000000000000000 (size!3784 (_keys!5470 thiss!1248))))))

(declare-fun b!175576 () Bool)

(declare-fun e!115891 () Bool)

(declare-fun lt!86935 () ListLongMap!2151)

(declare-fun apply!134 (ListLongMap!2151 (_ BitVec 64)) V!5121)

(declare-fun get!1995 (ValueCell!1709 V!5121) V!5121)

(declare-fun dynLambda!477 (Int (_ BitVec 64)) V!5121)

(assert (=> b!175576 (= e!115891 (= (apply!134 lt!86935 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000)) (get!1995 (select (arr!3483 (_values!3601 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!477 (defaultEntry!3618 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3785 (_values!3601 thiss!1248))))))

(assert (=> b!175576 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3784 (_keys!5470 thiss!1248))))))

(declare-fun bm!17758 () Bool)

(declare-fun call!17761 () Bool)

(assert (=> bm!17758 (= call!17761 (contains!1162 lt!86935 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17759 () Bool)

(assert (=> bm!17759 (= call!17765 (contains!1162 lt!86935 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17760 () Bool)

(declare-fun call!17767 () ListLongMap!2151)

(declare-fun call!17764 () ListLongMap!2151)

(assert (=> bm!17760 (= call!17767 call!17764)))

(declare-fun b!175577 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!175577 (= e!115885 (validKeyInArray!0 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175578 () Bool)

(declare-fun res!83236 () Bool)

(assert (=> b!175578 (=> (not res!83236) (not e!115888))))

(declare-fun e!115892 () Bool)

(assert (=> b!175578 (= res!83236 e!115892)))

(declare-fun c!31459 () Bool)

(assert (=> b!175578 (= c!31459 (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!175579 () Bool)

(assert (=> b!175579 (= e!115893 call!17767)))

(declare-fun b!175581 () Bool)

(declare-fun e!115884 () Unit!5385)

(declare-fun Unit!5388 () Unit!5385)

(assert (=> b!175581 (= e!115884 Unit!5388)))

(declare-fun b!175582 () Bool)

(assert (=> b!175582 (= e!115888 e!115886)))

(declare-fun c!31458 () Bool)

(assert (=> b!175582 (= c!31458 (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175583 () Bool)

(declare-fun e!115887 () Bool)

(assert (=> b!175583 (= e!115892 e!115887)))

(declare-fun res!83235 () Bool)

(assert (=> b!175583 (= res!83235 call!17761)))

(assert (=> b!175583 (=> (not res!83235) (not e!115887))))

(declare-fun b!175584 () Bool)

(assert (=> b!175584 (= e!115887 (= (apply!134 lt!86935 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3459 thiss!1248)))))

(declare-fun bm!17761 () Bool)

(declare-fun call!17762 () ListLongMap!2151)

(assert (=> bm!17761 (= call!17764 call!17762)))

(declare-fun bm!17762 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!165 (array!7335 array!7337 (_ BitVec 32) (_ BitVec 32) V!5121 V!5121 (_ BitVec 32) Int) ListLongMap!2151)

(assert (=> bm!17762 (= call!17762 (getCurrentListMapNoExtraKeys!165 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun b!175585 () Bool)

(declare-fun e!115883 () ListLongMap!2151)

(assert (=> b!175585 (= e!115894 e!115883)))

(declare-fun c!31460 () Bool)

(assert (=> b!175585 (= c!31460 (and (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175586 () Bool)

(declare-fun lt!86919 () Unit!5385)

(assert (=> b!175586 (= e!115884 lt!86919)))

(declare-fun lt!86917 () ListLongMap!2151)

(assert (=> b!175586 (= lt!86917 (getCurrentListMapNoExtraKeys!165 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86930 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86930 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86922 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86922 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86926 () Unit!5385)

(declare-fun addStillContains!110 (ListLongMap!2151 (_ BitVec 64) V!5121 (_ BitVec 64)) Unit!5385)

(assert (=> b!175586 (= lt!86926 (addStillContains!110 lt!86917 lt!86930 (zeroValue!3459 thiss!1248) lt!86922))))

(assert (=> b!175586 (contains!1162 (+!251 lt!86917 (tuple2!3219 lt!86930 (zeroValue!3459 thiss!1248))) lt!86922)))

(declare-fun lt!86932 () Unit!5385)

(assert (=> b!175586 (= lt!86932 lt!86926)))

(declare-fun lt!86928 () ListLongMap!2151)

(assert (=> b!175586 (= lt!86928 (getCurrentListMapNoExtraKeys!165 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86920 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86920 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86918 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86918 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86914 () Unit!5385)

(declare-fun addApplyDifferent!110 (ListLongMap!2151 (_ BitVec 64) V!5121 (_ BitVec 64)) Unit!5385)

(assert (=> b!175586 (= lt!86914 (addApplyDifferent!110 lt!86928 lt!86920 (minValue!3459 thiss!1248) lt!86918))))

(assert (=> b!175586 (= (apply!134 (+!251 lt!86928 (tuple2!3219 lt!86920 (minValue!3459 thiss!1248))) lt!86918) (apply!134 lt!86928 lt!86918))))

(declare-fun lt!86927 () Unit!5385)

(assert (=> b!175586 (= lt!86927 lt!86914)))

(declare-fun lt!86924 () ListLongMap!2151)

(assert (=> b!175586 (= lt!86924 (getCurrentListMapNoExtraKeys!165 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86916 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86916 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86921 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86921 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86929 () Unit!5385)

(assert (=> b!175586 (= lt!86929 (addApplyDifferent!110 lt!86924 lt!86916 (zeroValue!3459 thiss!1248) lt!86921))))

(assert (=> b!175586 (= (apply!134 (+!251 lt!86924 (tuple2!3219 lt!86916 (zeroValue!3459 thiss!1248))) lt!86921) (apply!134 lt!86924 lt!86921))))

(declare-fun lt!86934 () Unit!5385)

(assert (=> b!175586 (= lt!86934 lt!86929)))

(declare-fun lt!86933 () ListLongMap!2151)

(assert (=> b!175586 (= lt!86933 (getCurrentListMapNoExtraKeys!165 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)))))

(declare-fun lt!86923 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86923 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86931 () (_ BitVec 64))

(assert (=> b!175586 (= lt!86931 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175586 (= lt!86919 (addApplyDifferent!110 lt!86933 lt!86923 (minValue!3459 thiss!1248) lt!86931))))

(assert (=> b!175586 (= (apply!134 (+!251 lt!86933 (tuple2!3219 lt!86923 (minValue!3459 thiss!1248))) lt!86931) (apply!134 lt!86933 lt!86931))))

(declare-fun b!175587 () Bool)

(declare-fun e!115890 () Bool)

(assert (=> b!175587 (= e!115886 e!115890)))

(declare-fun res!83241 () Bool)

(assert (=> b!175587 (= res!83241 call!17765)))

(assert (=> b!175587 (=> (not res!83241) (not e!115890))))

(declare-fun b!175588 () Bool)

(assert (=> b!175588 (= e!115890 (= (apply!134 lt!86935 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3459 thiss!1248)))))

(declare-fun c!31456 () Bool)

(declare-fun bm!17763 () Bool)

(assert (=> bm!17763 (= call!17763 (+!251 (ite c!31456 call!17762 (ite c!31460 call!17764 call!17767)) (ite (or c!31456 c!31460) (tuple2!3219 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3459 thiss!1248)) (tuple2!3219 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3459 thiss!1248)))))))

(declare-fun bm!17764 () Bool)

(assert (=> bm!17764 (= call!17766 call!17763)))

(declare-fun b!175580 () Bool)

(declare-fun c!31461 () Bool)

(assert (=> b!175580 (= c!31461 (and (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!175580 (= e!115883 e!115893)))

(declare-fun d!53551 () Bool)

(assert (=> d!53551 e!115888))

(declare-fun res!83239 () Bool)

(assert (=> d!53551 (=> (not res!83239) (not e!115888))))

(assert (=> d!53551 (= res!83239 (or (bvsge #b00000000000000000000000000000000 (size!3784 (_keys!5470 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3784 (_keys!5470 thiss!1248))))))))

(declare-fun lt!86915 () ListLongMap!2151)

(assert (=> d!53551 (= lt!86935 lt!86915)))

(declare-fun lt!86925 () Unit!5385)

(assert (=> d!53551 (= lt!86925 e!115884)))

(declare-fun c!31457 () Bool)

(declare-fun e!115889 () Bool)

(assert (=> d!53551 (= c!31457 e!115889)))

(declare-fun res!83237 () Bool)

(assert (=> d!53551 (=> (not res!83237) (not e!115889))))

(assert (=> d!53551 (= res!83237 (bvslt #b00000000000000000000000000000000 (size!3784 (_keys!5470 thiss!1248))))))

(assert (=> d!53551 (= lt!86915 e!115894)))

(assert (=> d!53551 (= c!31456 (and (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3355 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53551 (validMask!0 (mask!8515 thiss!1248))))

(assert (=> d!53551 (= (getCurrentListMap!746 (_keys!5470 thiss!1248) (_values!3601 thiss!1248) (mask!8515 thiss!1248) (extraKeys!3355 thiss!1248) (zeroValue!3459 thiss!1248) (minValue!3459 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3618 thiss!1248)) lt!86935)))

(declare-fun b!175589 () Bool)

(assert (=> b!175589 (= e!115882 e!115891)))

(declare-fun res!83240 () Bool)

(assert (=> b!175589 (=> (not res!83240) (not e!115891))))

(assert (=> b!175589 (= res!83240 (contains!1162 lt!86935 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175589 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3784 (_keys!5470 thiss!1248))))))

(declare-fun b!175590 () Bool)

(assert (=> b!175590 (= e!115889 (validKeyInArray!0 (select (arr!3482 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175591 () Bool)

(assert (=> b!175591 (= e!115892 (not call!17761))))

(declare-fun b!175592 () Bool)

(assert (=> b!175592 (= e!115883 call!17766)))

(assert (= (and d!53551 c!31456) b!175572))

(assert (= (and d!53551 (not c!31456)) b!175585))

(assert (= (and b!175585 c!31460) b!175592))

(assert (= (and b!175585 (not c!31460)) b!175580))

(assert (= (and b!175580 c!31461) b!175573))

(assert (= (and b!175580 (not c!31461)) b!175579))

(assert (= (or b!175573 b!175579) bm!17760))

(assert (= (or b!175592 bm!17760) bm!17761))

(assert (= (or b!175592 b!175573) bm!17764))

(assert (= (or b!175572 bm!17761) bm!17762))

(assert (= (or b!175572 bm!17764) bm!17763))

(assert (= (and d!53551 res!83237) b!175590))

(assert (= (and d!53551 c!31457) b!175586))

(assert (= (and d!53551 (not c!31457)) b!175581))

(assert (= (and d!53551 res!83239) b!175575))

(assert (= (and b!175575 res!83234) b!175577))

(assert (= (and b!175575 (not res!83242)) b!175589))

(assert (= (and b!175589 res!83240) b!175576))

(assert (= (and b!175575 res!83238) b!175578))

(assert (= (and b!175578 c!31459) b!175583))

(assert (= (and b!175578 (not c!31459)) b!175591))

(assert (= (and b!175583 res!83235) b!175584))

(assert (= (or b!175583 b!175591) bm!17758))

(assert (= (and b!175578 res!83236) b!175582))

(assert (= (and b!175582 c!31458) b!175587))

(assert (= (and b!175582 (not c!31458)) b!175574))

(assert (= (and b!175587 res!83241) b!175588))

(assert (= (or b!175587 b!175574) bm!17759))

(declare-fun b_lambda!7033 () Bool)

(assert (=> (not b_lambda!7033) (not b!175576)))

(declare-fun t!7014 () Bool)

(declare-fun tb!2771 () Bool)

(assert (=> (and b!175460 (= (defaultEntry!3618 thiss!1248) (defaultEntry!3618 thiss!1248)) t!7014) tb!2771))

(declare-fun result!4603 () Bool)

(assert (=> tb!2771 (= result!4603 tp_is_empty!4105)))

(assert (=> b!175576 t!7014))

(declare-fun b_and!10833 () Bool)

(assert (= b_and!10827 (and (=> t!7014 result!4603) b_and!10833)))

(declare-fun m!204601 () Bool)

(assert (=> bm!17763 m!204601))

(declare-fun m!204603 () Bool)

(assert (=> bm!17762 m!204603))

(declare-fun m!204605 () Bool)

(assert (=> bm!17758 m!204605))

(declare-fun m!204607 () Bool)

(assert (=> bm!17759 m!204607))

(declare-fun m!204609 () Bool)

(assert (=> b!175577 m!204609))

(assert (=> b!175577 m!204609))

(declare-fun m!204611 () Bool)

(assert (=> b!175577 m!204611))

(declare-fun m!204613 () Bool)

(assert (=> b!175588 m!204613))

(declare-fun m!204615 () Bool)

(assert (=> b!175586 m!204615))

(declare-fun m!204617 () Bool)

(assert (=> b!175586 m!204617))

(declare-fun m!204619 () Bool)

(assert (=> b!175586 m!204619))

(declare-fun m!204621 () Bool)

(assert (=> b!175586 m!204621))

(declare-fun m!204623 () Bool)

(assert (=> b!175586 m!204623))

(assert (=> b!175586 m!204615))

(declare-fun m!204625 () Bool)

(assert (=> b!175586 m!204625))

(declare-fun m!204627 () Bool)

(assert (=> b!175586 m!204627))

(declare-fun m!204629 () Bool)

(assert (=> b!175586 m!204629))

(assert (=> b!175586 m!204603))

(declare-fun m!204631 () Bool)

(assert (=> b!175586 m!204631))

(declare-fun m!204633 () Bool)

(assert (=> b!175586 m!204633))

(declare-fun m!204635 () Bool)

(assert (=> b!175586 m!204635))

(declare-fun m!204637 () Bool)

(assert (=> b!175586 m!204637))

(declare-fun m!204639 () Bool)

(assert (=> b!175586 m!204639))

(assert (=> b!175586 m!204637))

(declare-fun m!204641 () Bool)

(assert (=> b!175586 m!204641))

(assert (=> b!175586 m!204631))

(assert (=> b!175586 m!204609))

(declare-fun m!204643 () Bool)

(assert (=> b!175586 m!204643))

(assert (=> b!175586 m!204627))

(assert (=> d!53551 m!204557))

(assert (=> b!175590 m!204609))

(assert (=> b!175590 m!204609))

(assert (=> b!175590 m!204611))

(assert (=> b!175589 m!204609))

(assert (=> b!175589 m!204609))

(declare-fun m!204645 () Bool)

(assert (=> b!175589 m!204645))

(declare-fun m!204647 () Bool)

(assert (=> b!175572 m!204647))

(assert (=> b!175576 m!204609))

(declare-fun m!204649 () Bool)

(assert (=> b!175576 m!204649))

(declare-fun m!204651 () Bool)

(assert (=> b!175576 m!204651))

(declare-fun m!204653 () Bool)

(assert (=> b!175576 m!204653))

(assert (=> b!175576 m!204649))

(assert (=> b!175576 m!204609))

(declare-fun m!204655 () Bool)

(assert (=> b!175576 m!204655))

(assert (=> b!175576 m!204651))

(declare-fun m!204657 () Bool)

(assert (=> b!175584 m!204657))

(assert (=> b!175466 d!53551))

(declare-fun d!53553 () Bool)

(declare-fun res!83249 () Bool)

(declare-fun e!115897 () Bool)

(assert (=> d!53553 (=> (not res!83249) (not e!115897))))

(declare-fun simpleValid!148 (LongMapFixedSize!2326) Bool)

(assert (=> d!53553 (= res!83249 (simpleValid!148 thiss!1248))))

(assert (=> d!53553 (= (valid!996 thiss!1248) e!115897)))

(declare-fun b!175601 () Bool)

(declare-fun res!83250 () Bool)

(assert (=> b!175601 (=> (not res!83250) (not e!115897))))

(declare-fun arrayCountValidKeys!0 (array!7335 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175601 (= res!83250 (= (arrayCountValidKeys!0 (_keys!5470 thiss!1248) #b00000000000000000000000000000000 (size!3784 (_keys!5470 thiss!1248))) (_size!1212 thiss!1248)))))

(declare-fun b!175602 () Bool)

(declare-fun res!83251 () Bool)

(assert (=> b!175602 (=> (not res!83251) (not e!115897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7335 (_ BitVec 32)) Bool)

(assert (=> b!175602 (= res!83251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5470 thiss!1248) (mask!8515 thiss!1248)))))

(declare-fun b!175603 () Bool)

(declare-datatypes ((List!2203 0))(
  ( (Nil!2200) (Cons!2199 (h!2818 (_ BitVec 64)) (t!7015 List!2203)) )
))
(declare-fun arrayNoDuplicates!0 (array!7335 (_ BitVec 32) List!2203) Bool)

(assert (=> b!175603 (= e!115897 (arrayNoDuplicates!0 (_keys!5470 thiss!1248) #b00000000000000000000000000000000 Nil!2200))))

(assert (= (and d!53553 res!83249) b!175601))

(assert (= (and b!175601 res!83250) b!175602))

(assert (= (and b!175602 res!83251) b!175603))

(declare-fun m!204659 () Bool)

(assert (=> d!53553 m!204659))

(declare-fun m!204661 () Bool)

(assert (=> b!175601 m!204661))

(declare-fun m!204663 () Bool)

(assert (=> b!175602 m!204663))

(declare-fun m!204665 () Bool)

(assert (=> b!175603 m!204665))

(assert (=> start!17516 d!53553))

(declare-fun d!53555 () Bool)

(assert (=> d!53555 (= (array_inv!2245 (_keys!5470 thiss!1248)) (bvsge (size!3784 (_keys!5470 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175460 d!53555))

(declare-fun d!53557 () Bool)

(assert (=> d!53557 (= (array_inv!2246 (_values!3601 thiss!1248)) (bvsge (size!3785 (_values!3601 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175460 d!53557))

(declare-fun b!175616 () Bool)

(declare-fun e!115904 () SeekEntryResult!543)

(declare-fun lt!86944 () SeekEntryResult!543)

(assert (=> b!175616 (= e!115904 (Found!543 (index!4342 lt!86944)))))

(declare-fun b!175617 () Bool)

(declare-fun c!31470 () Bool)

(declare-fun lt!86942 () (_ BitVec 64))

(assert (=> b!175617 (= c!31470 (= lt!86942 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115905 () SeekEntryResult!543)

(assert (=> b!175617 (= e!115904 e!115905)))

(declare-fun b!175618 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7335 (_ BitVec 32)) SeekEntryResult!543)

(assert (=> b!175618 (= e!115905 (seekKeyOrZeroReturnVacant!0 (x!19283 lt!86944) (index!4342 lt!86944) (index!4342 lt!86944) key!828 (_keys!5470 thiss!1248) (mask!8515 thiss!1248)))))

(declare-fun d!53559 () Bool)

(declare-fun lt!86943 () SeekEntryResult!543)

(assert (=> d!53559 (and (or ((_ is Undefined!543) lt!86943) (not ((_ is Found!543) lt!86943)) (and (bvsge (index!4341 lt!86943) #b00000000000000000000000000000000) (bvslt (index!4341 lt!86943) (size!3784 (_keys!5470 thiss!1248))))) (or ((_ is Undefined!543) lt!86943) ((_ is Found!543) lt!86943) (not ((_ is MissingZero!543) lt!86943)) (and (bvsge (index!4340 lt!86943) #b00000000000000000000000000000000) (bvslt (index!4340 lt!86943) (size!3784 (_keys!5470 thiss!1248))))) (or ((_ is Undefined!543) lt!86943) ((_ is Found!543) lt!86943) ((_ is MissingZero!543) lt!86943) (not ((_ is MissingVacant!543) lt!86943)) (and (bvsge (index!4343 lt!86943) #b00000000000000000000000000000000) (bvslt (index!4343 lt!86943) (size!3784 (_keys!5470 thiss!1248))))) (or ((_ is Undefined!543) lt!86943) (ite ((_ is Found!543) lt!86943) (= (select (arr!3482 (_keys!5470 thiss!1248)) (index!4341 lt!86943)) key!828) (ite ((_ is MissingZero!543) lt!86943) (= (select (arr!3482 (_keys!5470 thiss!1248)) (index!4340 lt!86943)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!543) lt!86943) (= (select (arr!3482 (_keys!5470 thiss!1248)) (index!4343 lt!86943)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!115906 () SeekEntryResult!543)

(assert (=> d!53559 (= lt!86943 e!115906)))

(declare-fun c!31469 () Bool)

(assert (=> d!53559 (= c!31469 (and ((_ is Intermediate!543) lt!86944) (undefined!1355 lt!86944)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7335 (_ BitVec 32)) SeekEntryResult!543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53559 (= lt!86944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8515 thiss!1248)) key!828 (_keys!5470 thiss!1248) (mask!8515 thiss!1248)))))

(assert (=> d!53559 (validMask!0 (mask!8515 thiss!1248))))

(assert (=> d!53559 (= (seekEntryOrOpen!0 key!828 (_keys!5470 thiss!1248) (mask!8515 thiss!1248)) lt!86943)))

(declare-fun b!175619 () Bool)

(assert (=> b!175619 (= e!115906 e!115904)))

(assert (=> b!175619 (= lt!86942 (select (arr!3482 (_keys!5470 thiss!1248)) (index!4342 lt!86944)))))

(declare-fun c!31468 () Bool)

(assert (=> b!175619 (= c!31468 (= lt!86942 key!828))))

(declare-fun b!175620 () Bool)

(assert (=> b!175620 (= e!115905 (MissingZero!543 (index!4342 lt!86944)))))

(declare-fun b!175621 () Bool)

(assert (=> b!175621 (= e!115906 Undefined!543)))

(assert (= (and d!53559 c!31469) b!175621))

(assert (= (and d!53559 (not c!31469)) b!175619))

(assert (= (and b!175619 c!31468) b!175616))

(assert (= (and b!175619 (not c!31468)) b!175617))

(assert (= (and b!175617 c!31470) b!175620))

(assert (= (and b!175617 (not c!31470)) b!175618))

(declare-fun m!204667 () Bool)

(assert (=> b!175618 m!204667))

(declare-fun m!204669 () Bool)

(assert (=> d!53559 m!204669))

(declare-fun m!204671 () Bool)

(assert (=> d!53559 m!204671))

(assert (=> d!53559 m!204557))

(assert (=> d!53559 m!204669))

(declare-fun m!204673 () Bool)

(assert (=> d!53559 m!204673))

(declare-fun m!204675 () Bool)

(assert (=> d!53559 m!204675))

(declare-fun m!204677 () Bool)

(assert (=> d!53559 m!204677))

(declare-fun m!204679 () Bool)

(assert (=> b!175619 m!204679))

(assert (=> b!175462 d!53559))

(declare-fun mapIsEmpty!7009 () Bool)

(declare-fun mapRes!7009 () Bool)

(assert (=> mapIsEmpty!7009 mapRes!7009))

(declare-fun b!175628 () Bool)

(declare-fun e!115912 () Bool)

(assert (=> b!175628 (= e!115912 tp_is_empty!4105)))

(declare-fun mapNonEmpty!7009 () Bool)

(declare-fun tp!15694 () Bool)

(assert (=> mapNonEmpty!7009 (= mapRes!7009 (and tp!15694 e!115912))))

(declare-fun mapKey!7009 () (_ BitVec 32))

(declare-fun mapRest!7009 () (Array (_ BitVec 32) ValueCell!1709))

(declare-fun mapValue!7009 () ValueCell!1709)

(assert (=> mapNonEmpty!7009 (= mapRest!7000 (store mapRest!7009 mapKey!7009 mapValue!7009))))

(declare-fun b!175629 () Bool)

(declare-fun e!115911 () Bool)

(assert (=> b!175629 (= e!115911 tp_is_empty!4105)))

(declare-fun condMapEmpty!7009 () Bool)

(declare-fun mapDefault!7009 () ValueCell!1709)

(assert (=> mapNonEmpty!7000 (= condMapEmpty!7009 (= mapRest!7000 ((as const (Array (_ BitVec 32) ValueCell!1709)) mapDefault!7009)))))

(assert (=> mapNonEmpty!7000 (= tp!15679 (and e!115911 mapRes!7009))))

(assert (= (and mapNonEmpty!7000 condMapEmpty!7009) mapIsEmpty!7009))

(assert (= (and mapNonEmpty!7000 (not condMapEmpty!7009)) mapNonEmpty!7009))

(assert (= (and mapNonEmpty!7009 ((_ is ValueCellFull!1709) mapValue!7009)) b!175628))

(assert (= (and mapNonEmpty!7000 ((_ is ValueCellFull!1709) mapDefault!7009)) b!175629))

(declare-fun m!204681 () Bool)

(assert (=> mapNonEmpty!7009 m!204681))

(declare-fun b_lambda!7035 () Bool)

(assert (= b_lambda!7033 (or (and b!175460 b_free!4333) b_lambda!7035)))

(check-sat b_and!10833 (not b!175584) (not b!175618) (not b!175529) (not b!175577) (not b!175588) (not mapNonEmpty!7009) tp_is_empty!4105 (not d!53559) (not b!175602) (not bm!17762) (not b!175527) (not b_lambda!7035) (not b!175601) (not b_next!4333) (not b!175603) (not b!175590) (not b!175589) (not bm!17759) (not d!53553) (not bm!17758) (not b!175572) (not d!53551) (not b!175586) (not bm!17763) (not b!175576) (not d!53549))
(check-sat b_and!10833 (not b_next!4333))
