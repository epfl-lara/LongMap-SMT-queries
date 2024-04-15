; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17460 () Bool)

(assert start!17460)

(declare-fun b!174878 () Bool)

(declare-fun b_free!4327 () Bool)

(declare-fun b_next!4327 () Bool)

(assert (=> b!174878 (= b_free!4327 (not b_next!4327))))

(declare-fun tp!15656 () Bool)

(declare-fun b_and!10775 () Bool)

(assert (=> b!174878 (= tp!15656 b_and!10775)))

(declare-fun e!115451 () Bool)

(declare-datatypes ((V!5113 0))(
  ( (V!5114 (val!2094 Int)) )
))
(declare-datatypes ((ValueCell!1706 0))(
  ( (ValueCellFull!1706 (v!3961 V!5113)) (EmptyCell!1706) )
))
(declare-datatypes ((array!7315 0))(
  ( (array!7316 (arr!3472 (Array (_ BitVec 32) (_ BitVec 64))) (size!3774 (_ BitVec 32))) )
))
(declare-datatypes ((array!7317 0))(
  ( (array!7318 (arr!3473 (Array (_ BitVec 32) ValueCell!1706)) (size!3775 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2320 0))(
  ( (LongMapFixedSize!2321 (defaultEntry!3613 Int) (mask!8501 (_ BitVec 32)) (extraKeys!3350 (_ BitVec 32)) (zeroValue!3454 V!5113) (minValue!3454 V!5113) (_size!1209 (_ BitVec 32)) (_keys!5460 array!7315) (_values!3596 array!7317) (_vacant!1209 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2320)

(declare-fun tp_is_empty!4099 () Bool)

(declare-fun e!115455 () Bool)

(declare-fun array_inv!2239 (array!7315) Bool)

(declare-fun array_inv!2240 (array!7317) Bool)

(assert (=> b!174878 (= e!115455 (and tp!15656 tp_is_empty!4099 (array_inv!2239 (_keys!5460 thiss!1248)) (array_inv!2240 (_values!3596 thiss!1248)) e!115451))))

(declare-fun b!174879 () Bool)

(declare-fun res!82896 () Bool)

(declare-fun e!115452 () Bool)

(assert (=> b!174879 (=> (not res!82896) (not e!115452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!174879 (= res!82896 (validMask!0 (mask!8501 thiss!1248)))))

(declare-fun b!174880 () Bool)

(declare-fun res!82895 () Bool)

(assert (=> b!174880 (=> (not res!82895) (not e!115452))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!174880 (= res!82895 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6987 () Bool)

(declare-fun mapRes!6987 () Bool)

(assert (=> mapIsEmpty!6987 mapRes!6987))

(declare-fun b!174881 () Bool)

(declare-fun res!82899 () Bool)

(assert (=> b!174881 (=> (not res!82899) (not e!115452))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!558 0))(
  ( (MissingZero!558 (index!4400 (_ BitVec 32))) (Found!558 (index!4401 (_ BitVec 32))) (Intermediate!558 (undefined!1370 Bool) (index!4402 (_ BitVec 32)) (x!19271 (_ BitVec 32))) (Undefined!558) (MissingVacant!558 (index!4403 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7315 (_ BitVec 32)) SeekEntryResult!558)

(assert (=> b!174881 (= res!82899 ((_ is Undefined!558) (seekEntryOrOpen!0 key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248))))))

(declare-fun res!82897 () Bool)

(assert (=> start!17460 (=> (not res!82897) (not e!115452))))

(declare-fun valid!995 (LongMapFixedSize!2320) Bool)

(assert (=> start!17460 (= res!82897 (valid!995 thiss!1248))))

(assert (=> start!17460 e!115452))

(assert (=> start!17460 e!115455))

(assert (=> start!17460 true))

(declare-fun b!174882 () Bool)

(declare-fun e!115453 () Bool)

(assert (=> b!174882 (= e!115453 tp_is_empty!4099)))

(declare-fun b!174883 () Bool)

(assert (=> b!174883 (= e!115452 (and (= (size!3775 (_values!3596 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8501 thiss!1248))) (not (= (size!3774 (_keys!5460 thiss!1248)) (size!3775 (_values!3596 thiss!1248))))))))

(declare-fun mapNonEmpty!6987 () Bool)

(declare-fun tp!15657 () Bool)

(declare-fun e!115450 () Bool)

(assert (=> mapNonEmpty!6987 (= mapRes!6987 (and tp!15657 e!115450))))

(declare-fun mapRest!6987 () (Array (_ BitVec 32) ValueCell!1706))

(declare-fun mapKey!6987 () (_ BitVec 32))

(declare-fun mapValue!6987 () ValueCell!1706)

(assert (=> mapNonEmpty!6987 (= (arr!3473 (_values!3596 thiss!1248)) (store mapRest!6987 mapKey!6987 mapValue!6987))))

(declare-fun b!174884 () Bool)

(assert (=> b!174884 (= e!115451 (and e!115453 mapRes!6987))))

(declare-fun condMapEmpty!6987 () Bool)

(declare-fun mapDefault!6987 () ValueCell!1706)

(assert (=> b!174884 (= condMapEmpty!6987 (= (arr!3473 (_values!3596 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1706)) mapDefault!6987)))))

(declare-fun b!174885 () Bool)

(declare-fun res!82898 () Bool)

(assert (=> b!174885 (=> (not res!82898) (not e!115452))))

(declare-datatypes ((tuple2!3250 0))(
  ( (tuple2!3251 (_1!1636 (_ BitVec 64)) (_2!1636 V!5113)) )
))
(declare-datatypes ((List!2224 0))(
  ( (Nil!2221) (Cons!2220 (h!2838 tuple2!3250) (t!7031 List!2224)) )
))
(declare-datatypes ((ListLongMap!2169 0))(
  ( (ListLongMap!2170 (toList!1100 List!2224)) )
))
(declare-fun contains!1163 (ListLongMap!2169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!736 (array!7315 array!7317 (_ BitVec 32) (_ BitVec 32) V!5113 V!5113 (_ BitVec 32) Int) ListLongMap!2169)

(assert (=> b!174885 (= res!82898 (contains!1163 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) key!828))))

(declare-fun b!174886 () Bool)

(assert (=> b!174886 (= e!115450 tp_is_empty!4099)))

(assert (= (and start!17460 res!82897) b!174880))

(assert (= (and b!174880 res!82895) b!174881))

(assert (= (and b!174881 res!82899) b!174885))

(assert (= (and b!174885 res!82898) b!174879))

(assert (= (and b!174879 res!82896) b!174883))

(assert (= (and b!174884 condMapEmpty!6987) mapIsEmpty!6987))

(assert (= (and b!174884 (not condMapEmpty!6987)) mapNonEmpty!6987))

(assert (= (and mapNonEmpty!6987 ((_ is ValueCellFull!1706) mapValue!6987)) b!174886))

(assert (= (and b!174884 ((_ is ValueCellFull!1706) mapDefault!6987)) b!174882))

(assert (= b!174878 b!174884))

(assert (= start!17460 b!174878))

(declare-fun m!203387 () Bool)

(assert (=> b!174881 m!203387))

(declare-fun m!203389 () Bool)

(assert (=> start!17460 m!203389))

(declare-fun m!203391 () Bool)

(assert (=> mapNonEmpty!6987 m!203391))

(declare-fun m!203393 () Bool)

(assert (=> b!174878 m!203393))

(declare-fun m!203395 () Bool)

(assert (=> b!174878 m!203395))

(declare-fun m!203397 () Bool)

(assert (=> b!174879 m!203397))

(declare-fun m!203399 () Bool)

(assert (=> b!174885 m!203399))

(assert (=> b!174885 m!203399))

(declare-fun m!203401 () Bool)

(assert (=> b!174885 m!203401))

(check-sat (not b_next!4327) (not b!174881) (not mapNonEmpty!6987) (not b!174878) b_and!10775 tp_is_empty!4099 (not start!17460) (not b!174885) (not b!174879))
(check-sat b_and!10775 (not b_next!4327))
(get-model)

(declare-fun d!53235 () Bool)

(declare-fun e!115496 () Bool)

(assert (=> d!53235 e!115496))

(declare-fun res!82932 () Bool)

(assert (=> d!53235 (=> res!82932 e!115496)))

(declare-fun lt!86431 () Bool)

(assert (=> d!53235 (= res!82932 (not lt!86431))))

(declare-fun lt!86432 () Bool)

(assert (=> d!53235 (= lt!86431 lt!86432)))

(declare-datatypes ((Unit!5351 0))(
  ( (Unit!5352) )
))
(declare-fun lt!86430 () Unit!5351)

(declare-fun e!115497 () Unit!5351)

(assert (=> d!53235 (= lt!86430 e!115497)))

(declare-fun c!31319 () Bool)

(assert (=> d!53235 (= c!31319 lt!86432)))

(declare-fun containsKey!190 (List!2224 (_ BitVec 64)) Bool)

(assert (=> d!53235 (= lt!86432 (containsKey!190 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(assert (=> d!53235 (= (contains!1163 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) key!828) lt!86431)))

(declare-fun b!174947 () Bool)

(declare-fun lt!86429 () Unit!5351)

(assert (=> b!174947 (= e!115497 lt!86429)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!139 (List!2224 (_ BitVec 64)) Unit!5351)

(assert (=> b!174947 (= lt!86429 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-datatypes ((Option!192 0))(
  ( (Some!191 (v!3964 V!5113)) (None!190) )
))
(declare-fun isDefined!140 (Option!192) Bool)

(declare-fun getValueByKey!186 (List!2224 (_ BitVec 64)) Option!192)

(assert (=> b!174947 (isDefined!140 (getValueByKey!186 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-fun b!174948 () Bool)

(declare-fun Unit!5353 () Unit!5351)

(assert (=> b!174948 (= e!115497 Unit!5353)))

(declare-fun b!174949 () Bool)

(assert (=> b!174949 (= e!115496 (isDefined!140 (getValueByKey!186 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828)))))

(assert (= (and d!53235 c!31319) b!174947))

(assert (= (and d!53235 (not c!31319)) b!174948))

(assert (= (and d!53235 (not res!82932)) b!174949))

(declare-fun m!203435 () Bool)

(assert (=> d!53235 m!203435))

(declare-fun m!203437 () Bool)

(assert (=> b!174947 m!203437))

(declare-fun m!203439 () Bool)

(assert (=> b!174947 m!203439))

(assert (=> b!174947 m!203439))

(declare-fun m!203441 () Bool)

(assert (=> b!174947 m!203441))

(assert (=> b!174949 m!203439))

(assert (=> b!174949 m!203439))

(assert (=> b!174949 m!203441))

(assert (=> b!174885 d!53235))

(declare-fun d!53237 () Bool)

(declare-fun e!115528 () Bool)

(assert (=> d!53237 e!115528))

(declare-fun res!82958 () Bool)

(assert (=> d!53237 (=> (not res!82958) (not e!115528))))

(assert (=> d!53237 (= res!82958 (or (bvsge #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))))

(declare-fun lt!86488 () ListLongMap!2169)

(declare-fun lt!86479 () ListLongMap!2169)

(assert (=> d!53237 (= lt!86488 lt!86479)))

(declare-fun lt!86498 () Unit!5351)

(declare-fun e!115533 () Unit!5351)

(assert (=> d!53237 (= lt!86498 e!115533)))

(declare-fun c!31333 () Bool)

(declare-fun e!115524 () Bool)

(assert (=> d!53237 (= c!31333 e!115524)))

(declare-fun res!82952 () Bool)

(assert (=> d!53237 (=> (not res!82952) (not e!115524))))

(assert (=> d!53237 (= res!82952 (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun e!115525 () ListLongMap!2169)

(assert (=> d!53237 (= lt!86479 e!115525)))

(declare-fun c!31335 () Bool)

(assert (=> d!53237 (= c!31335 (and (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!53237 (validMask!0 (mask!8501 thiss!1248))))

(assert (=> d!53237 (= (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) lt!86488)))

(declare-fun b!174992 () Bool)

(declare-fun e!115526 () ListLongMap!2169)

(declare-fun call!17721 () ListLongMap!2169)

(assert (=> b!174992 (= e!115526 call!17721)))

(declare-fun bm!17713 () Bool)

(declare-fun call!17722 () ListLongMap!2169)

(declare-fun call!17717 () ListLongMap!2169)

(assert (=> bm!17713 (= call!17722 call!17717)))

(declare-fun bm!17714 () Bool)

(declare-fun call!17718 () ListLongMap!2169)

(assert (=> bm!17714 (= call!17718 call!17722)))

(declare-fun b!174993 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!174993 (= e!115524 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!174994 () Bool)

(declare-fun e!115532 () Bool)

(declare-fun apply!133 (ListLongMap!2169 (_ BitVec 64)) V!5113)

(assert (=> b!174994 (= e!115532 (= (apply!133 lt!86488 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3454 thiss!1248)))))

(declare-fun b!174995 () Bool)

(declare-fun Unit!5354 () Unit!5351)

(assert (=> b!174995 (= e!115533 Unit!5354)))

(declare-fun b!174996 () Bool)

(declare-fun lt!86486 () Unit!5351)

(assert (=> b!174996 (= e!115533 lt!86486)))

(declare-fun lt!86490 () ListLongMap!2169)

(declare-fun getCurrentListMapNoExtraKeys!154 (array!7315 array!7317 (_ BitVec 32) (_ BitVec 32) V!5113 V!5113 (_ BitVec 32) Int) ListLongMap!2169)

(assert (=> b!174996 (= lt!86490 (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86485 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86485 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86484 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86484 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86482 () Unit!5351)

(declare-fun addStillContains!109 (ListLongMap!2169 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5351)

(assert (=> b!174996 (= lt!86482 (addStillContains!109 lt!86490 lt!86485 (zeroValue!3454 thiss!1248) lt!86484))))

(declare-fun +!245 (ListLongMap!2169 tuple2!3250) ListLongMap!2169)

(assert (=> b!174996 (contains!1163 (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))) lt!86484)))

(declare-fun lt!86489 () Unit!5351)

(assert (=> b!174996 (= lt!86489 lt!86482)))

(declare-fun lt!86480 () ListLongMap!2169)

(assert (=> b!174996 (= lt!86480 (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86496 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86496 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86487 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86487 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86495 () Unit!5351)

(declare-fun addApplyDifferent!109 (ListLongMap!2169 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5351)

(assert (=> b!174996 (= lt!86495 (addApplyDifferent!109 lt!86480 lt!86496 (minValue!3454 thiss!1248) lt!86487))))

(assert (=> b!174996 (= (apply!133 (+!245 lt!86480 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))) lt!86487) (apply!133 lt!86480 lt!86487))))

(declare-fun lt!86494 () Unit!5351)

(assert (=> b!174996 (= lt!86494 lt!86495)))

(declare-fun lt!86477 () ListLongMap!2169)

(assert (=> b!174996 (= lt!86477 (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86483 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86478 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86478 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86491 () Unit!5351)

(assert (=> b!174996 (= lt!86491 (addApplyDifferent!109 lt!86477 lt!86483 (zeroValue!3454 thiss!1248) lt!86478))))

(assert (=> b!174996 (= (apply!133 (+!245 lt!86477 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))) lt!86478) (apply!133 lt!86477 lt!86478))))

(declare-fun lt!86481 () Unit!5351)

(assert (=> b!174996 (= lt!86481 lt!86491)))

(declare-fun lt!86497 () ListLongMap!2169)

(assert (=> b!174996 (= lt!86497 (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun lt!86493 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86493 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!86492 () (_ BitVec 64))

(assert (=> b!174996 (= lt!86492 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174996 (= lt!86486 (addApplyDifferent!109 lt!86497 lt!86493 (minValue!3454 thiss!1248) lt!86492))))

(assert (=> b!174996 (= (apply!133 (+!245 lt!86497 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))) lt!86492) (apply!133 lt!86497 lt!86492))))

(declare-fun b!174997 () Bool)

(declare-fun e!115530 () Bool)

(assert (=> b!174997 (= e!115530 (= (apply!133 lt!86488 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3454 thiss!1248)))))

(declare-fun b!174998 () Bool)

(declare-fun e!115535 () Bool)

(declare-fun e!115536 () Bool)

(assert (=> b!174998 (= e!115535 e!115536)))

(declare-fun res!82954 () Bool)

(assert (=> b!174998 (=> (not res!82954) (not e!115536))))

(assert (=> b!174998 (= res!82954 (contains!1163 lt!86488 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!174998 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun b!174999 () Bool)

(declare-fun c!31334 () Bool)

(assert (=> b!174999 (= c!31334 (and (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!115529 () ListLongMap!2169)

(assert (=> b!174999 (= e!115529 e!115526)))

(declare-fun b!175000 () Bool)

(declare-fun e!115531 () Bool)

(assert (=> b!175000 (= e!115531 e!115532)))

(declare-fun res!82959 () Bool)

(declare-fun call!17720 () Bool)

(assert (=> b!175000 (= res!82959 call!17720)))

(assert (=> b!175000 (=> (not res!82959) (not e!115532))))

(declare-fun b!175001 () Bool)

(declare-fun e!115527 () Bool)

(declare-fun call!17719 () Bool)

(assert (=> b!175001 (= e!115527 (not call!17719))))

(declare-fun b!175002 () Bool)

(assert (=> b!175002 (= e!115531 (not call!17720))))

(declare-fun b!175003 () Bool)

(assert (=> b!175003 (= e!115528 e!115531)))

(declare-fun c!31336 () Bool)

(assert (=> b!175003 (= c!31336 (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!17715 () Bool)

(declare-fun call!17716 () ListLongMap!2169)

(assert (=> bm!17715 (= call!17721 call!17716)))

(declare-fun b!175004 () Bool)

(assert (=> b!175004 (= e!115529 call!17721)))

(declare-fun b!175005 () Bool)

(declare-fun res!82953 () Bool)

(assert (=> b!175005 (=> (not res!82953) (not e!115528))))

(assert (=> b!175005 (= res!82953 e!115535)))

(declare-fun res!82951 () Bool)

(assert (=> b!175005 (=> res!82951 e!115535)))

(declare-fun e!115534 () Bool)

(assert (=> b!175005 (= res!82951 (not e!115534))))

(declare-fun res!82957 () Bool)

(assert (=> b!175005 (=> (not res!82957) (not e!115534))))

(assert (=> b!175005 (= res!82957 (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun b!175006 () Bool)

(assert (=> b!175006 (= e!115527 e!115530)))

(declare-fun res!82956 () Bool)

(assert (=> b!175006 (= res!82956 call!17719)))

(assert (=> b!175006 (=> (not res!82956) (not e!115530))))

(declare-fun b!175007 () Bool)

(assert (=> b!175007 (= e!115525 e!115529)))

(declare-fun c!31332 () Bool)

(assert (=> b!175007 (= c!31332 (and (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!175008 () Bool)

(assert (=> b!175008 (= e!115534 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175009 () Bool)

(assert (=> b!175009 (= e!115526 call!17718)))

(declare-fun bm!17716 () Bool)

(assert (=> bm!17716 (= call!17716 (+!245 (ite c!31335 call!17717 (ite c!31332 call!17722 call!17718)) (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun b!175010 () Bool)

(declare-fun res!82955 () Bool)

(assert (=> b!175010 (=> (not res!82955) (not e!115528))))

(assert (=> b!175010 (= res!82955 e!115527)))

(declare-fun c!31337 () Bool)

(assert (=> b!175010 (= c!31337 (not (= (bvand (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!17717 () Bool)

(assert (=> bm!17717 (= call!17720 (contains!1163 lt!86488 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!17718 () Bool)

(assert (=> bm!17718 (= call!17719 (contains!1163 lt!86488 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175011 () Bool)

(declare-fun get!1977 (ValueCell!1706 V!5113) V!5113)

(declare-fun dynLambda!467 (Int (_ BitVec 64)) V!5113)

(assert (=> b!175011 (= e!115536 (= (apply!133 lt!86488 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)) (get!1977 (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!467 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!175011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3775 (_values!3596 thiss!1248))))))

(assert (=> b!175011 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun bm!17719 () Bool)

(assert (=> bm!17719 (= call!17717 (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))

(declare-fun b!175012 () Bool)

(assert (=> b!175012 (= e!115525 (+!245 call!17716 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))

(assert (= (and d!53237 c!31335) b!175012))

(assert (= (and d!53237 (not c!31335)) b!175007))

(assert (= (and b!175007 c!31332) b!175004))

(assert (= (and b!175007 (not c!31332)) b!174999))

(assert (= (and b!174999 c!31334) b!174992))

(assert (= (and b!174999 (not c!31334)) b!175009))

(assert (= (or b!174992 b!175009) bm!17714))

(assert (= (or b!175004 bm!17714) bm!17713))

(assert (= (or b!175004 b!174992) bm!17715))

(assert (= (or b!175012 bm!17713) bm!17719))

(assert (= (or b!175012 bm!17715) bm!17716))

(assert (= (and d!53237 res!82952) b!174993))

(assert (= (and d!53237 c!31333) b!174996))

(assert (= (and d!53237 (not c!31333)) b!174995))

(assert (= (and d!53237 res!82958) b!175005))

(assert (= (and b!175005 res!82957) b!175008))

(assert (= (and b!175005 (not res!82951)) b!174998))

(assert (= (and b!174998 res!82954) b!175011))

(assert (= (and b!175005 res!82953) b!175010))

(assert (= (and b!175010 c!31337) b!175006))

(assert (= (and b!175010 (not c!31337)) b!175001))

(assert (= (and b!175006 res!82956) b!174997))

(assert (= (or b!175006 b!175001) bm!17718))

(assert (= (and b!175010 res!82955) b!175003))

(assert (= (and b!175003 c!31336) b!175000))

(assert (= (and b!175003 (not c!31336)) b!175002))

(assert (= (and b!175000 res!82959) b!174994))

(assert (= (or b!175000 b!175002) bm!17717))

(declare-fun b_lambda!6981 () Bool)

(assert (=> (not b_lambda!6981) (not b!175011)))

(declare-fun t!7034 () Bool)

(declare-fun tb!2769 () Bool)

(assert (=> (and b!174878 (= (defaultEntry!3613 thiss!1248) (defaultEntry!3613 thiss!1248)) t!7034) tb!2769))

(declare-fun result!4597 () Bool)

(assert (=> tb!2769 (= result!4597 tp_is_empty!4099)))

(assert (=> b!175011 t!7034))

(declare-fun b_and!10781 () Bool)

(assert (= b_and!10775 (and (=> t!7034 result!4597) b_and!10781)))

(declare-fun m!203443 () Bool)

(assert (=> bm!17718 m!203443))

(declare-fun m!203445 () Bool)

(assert (=> b!174997 m!203445))

(declare-fun m!203447 () Bool)

(assert (=> b!175011 m!203447))

(declare-fun m!203449 () Bool)

(assert (=> b!175011 m!203449))

(assert (=> b!175011 m!203449))

(declare-fun m!203451 () Bool)

(assert (=> b!175011 m!203451))

(assert (=> b!175011 m!203447))

(declare-fun m!203453 () Bool)

(assert (=> b!175011 m!203453))

(declare-fun m!203455 () Bool)

(assert (=> b!175011 m!203455))

(assert (=> b!175011 m!203453))

(declare-fun m!203457 () Bool)

(assert (=> b!174994 m!203457))

(assert (=> d!53237 m!203397))

(assert (=> b!175008 m!203449))

(assert (=> b!175008 m!203449))

(declare-fun m!203459 () Bool)

(assert (=> b!175008 m!203459))

(assert (=> b!174993 m!203449))

(assert (=> b!174993 m!203449))

(assert (=> b!174993 m!203459))

(declare-fun m!203461 () Bool)

(assert (=> bm!17716 m!203461))

(declare-fun m!203463 () Bool)

(assert (=> bm!17719 m!203463))

(declare-fun m!203465 () Bool)

(assert (=> bm!17717 m!203465))

(assert (=> b!174998 m!203449))

(assert (=> b!174998 m!203449))

(declare-fun m!203467 () Bool)

(assert (=> b!174998 m!203467))

(declare-fun m!203469 () Bool)

(assert (=> b!175012 m!203469))

(declare-fun m!203471 () Bool)

(assert (=> b!174996 m!203471))

(declare-fun m!203473 () Bool)

(assert (=> b!174996 m!203473))

(declare-fun m!203475 () Bool)

(assert (=> b!174996 m!203475))

(declare-fun m!203477 () Bool)

(assert (=> b!174996 m!203477))

(declare-fun m!203479 () Bool)

(assert (=> b!174996 m!203479))

(assert (=> b!174996 m!203479))

(declare-fun m!203481 () Bool)

(assert (=> b!174996 m!203481))

(declare-fun m!203483 () Bool)

(assert (=> b!174996 m!203483))

(assert (=> b!174996 m!203463))

(assert (=> b!174996 m!203471))

(assert (=> b!174996 m!203475))

(declare-fun m!203485 () Bool)

(assert (=> b!174996 m!203485))

(declare-fun m!203487 () Bool)

(assert (=> b!174996 m!203487))

(declare-fun m!203489 () Bool)

(assert (=> b!174996 m!203489))

(declare-fun m!203491 () Bool)

(assert (=> b!174996 m!203491))

(declare-fun m!203493 () Bool)

(assert (=> b!174996 m!203493))

(declare-fun m!203495 () Bool)

(assert (=> b!174996 m!203495))

(declare-fun m!203497 () Bool)

(assert (=> b!174996 m!203497))

(declare-fun m!203499 () Bool)

(assert (=> b!174996 m!203499))

(assert (=> b!174996 m!203449))

(assert (=> b!174996 m!203487))

(assert (=> b!174885 d!53237))

(declare-fun b!175027 () Bool)

(declare-fun c!31345 () Bool)

(declare-fun lt!86507 () (_ BitVec 64))

(assert (=> b!175027 (= c!31345 (= lt!86507 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115543 () SeekEntryResult!558)

(declare-fun e!115545 () SeekEntryResult!558)

(assert (=> b!175027 (= e!115543 e!115545)))

(declare-fun b!175028 () Bool)

(declare-fun lt!86506 () SeekEntryResult!558)

(assert (=> b!175028 (= e!115545 (MissingZero!558 (index!4402 lt!86506)))))

(declare-fun b!175029 () Bool)

(assert (=> b!175029 (= e!115543 (Found!558 (index!4402 lt!86506)))))

(declare-fun b!175030 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7315 (_ BitVec 32)) SeekEntryResult!558)

(assert (=> b!175030 (= e!115545 (seekKeyOrZeroReturnVacant!0 (x!19271 lt!86506) (index!4402 lt!86506) (index!4402 lt!86506) key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)))))

(declare-fun d!53239 () Bool)

(declare-fun lt!86505 () SeekEntryResult!558)

(assert (=> d!53239 (and (or ((_ is Undefined!558) lt!86505) (not ((_ is Found!558) lt!86505)) (and (bvsge (index!4401 lt!86505) #b00000000000000000000000000000000) (bvslt (index!4401 lt!86505) (size!3774 (_keys!5460 thiss!1248))))) (or ((_ is Undefined!558) lt!86505) ((_ is Found!558) lt!86505) (not ((_ is MissingZero!558) lt!86505)) (and (bvsge (index!4400 lt!86505) #b00000000000000000000000000000000) (bvslt (index!4400 lt!86505) (size!3774 (_keys!5460 thiss!1248))))) (or ((_ is Undefined!558) lt!86505) ((_ is Found!558) lt!86505) ((_ is MissingZero!558) lt!86505) (not ((_ is MissingVacant!558) lt!86505)) (and (bvsge (index!4403 lt!86505) #b00000000000000000000000000000000) (bvslt (index!4403 lt!86505) (size!3774 (_keys!5460 thiss!1248))))) (or ((_ is Undefined!558) lt!86505) (ite ((_ is Found!558) lt!86505) (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4401 lt!86505)) key!828) (ite ((_ is MissingZero!558) lt!86505) (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4400 lt!86505)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!558) lt!86505) (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4403 lt!86505)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!115544 () SeekEntryResult!558)

(assert (=> d!53239 (= lt!86505 e!115544)))

(declare-fun c!31344 () Bool)

(assert (=> d!53239 (= c!31344 (and ((_ is Intermediate!558) lt!86506) (undefined!1370 lt!86506)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7315 (_ BitVec 32)) SeekEntryResult!558)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!53239 (= lt!86506 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8501 thiss!1248)) key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)))))

(assert (=> d!53239 (validMask!0 (mask!8501 thiss!1248))))

(assert (=> d!53239 (= (seekEntryOrOpen!0 key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)) lt!86505)))

(declare-fun b!175031 () Bool)

(assert (=> b!175031 (= e!115544 e!115543)))

(assert (=> b!175031 (= lt!86507 (select (arr!3472 (_keys!5460 thiss!1248)) (index!4402 lt!86506)))))

(declare-fun c!31346 () Bool)

(assert (=> b!175031 (= c!31346 (= lt!86507 key!828))))

(declare-fun b!175032 () Bool)

(assert (=> b!175032 (= e!115544 Undefined!558)))

(assert (= (and d!53239 c!31344) b!175032))

(assert (= (and d!53239 (not c!31344)) b!175031))

(assert (= (and b!175031 c!31346) b!175029))

(assert (= (and b!175031 (not c!31346)) b!175027))

(assert (= (and b!175027 c!31345) b!175028))

(assert (= (and b!175027 (not c!31345)) b!175030))

(declare-fun m!203501 () Bool)

(assert (=> b!175030 m!203501))

(declare-fun m!203503 () Bool)

(assert (=> d!53239 m!203503))

(declare-fun m!203505 () Bool)

(assert (=> d!53239 m!203505))

(declare-fun m!203507 () Bool)

(assert (=> d!53239 m!203507))

(declare-fun m!203509 () Bool)

(assert (=> d!53239 m!203509))

(assert (=> d!53239 m!203397))

(assert (=> d!53239 m!203507))

(declare-fun m!203511 () Bool)

(assert (=> d!53239 m!203511))

(declare-fun m!203513 () Bool)

(assert (=> b!175031 m!203513))

(assert (=> b!174881 d!53239))

(declare-fun d!53241 () Bool)

(assert (=> d!53241 (= (array_inv!2239 (_keys!5460 thiss!1248)) (bvsge (size!3774 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174878 d!53241))

(declare-fun d!53243 () Bool)

(assert (=> d!53243 (= (array_inv!2240 (_values!3596 thiss!1248)) (bvsge (size!3775 (_values!3596 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!174878 d!53243))

(declare-fun d!53245 () Bool)

(assert (=> d!53245 (= (validMask!0 (mask!8501 thiss!1248)) (and (or (= (mask!8501 thiss!1248) #b00000000000000000000000000000111) (= (mask!8501 thiss!1248) #b00000000000000000000000000001111) (= (mask!8501 thiss!1248) #b00000000000000000000000000011111) (= (mask!8501 thiss!1248) #b00000000000000000000000000111111) (= (mask!8501 thiss!1248) #b00000000000000000000000001111111) (= (mask!8501 thiss!1248) #b00000000000000000000000011111111) (= (mask!8501 thiss!1248) #b00000000000000000000000111111111) (= (mask!8501 thiss!1248) #b00000000000000000000001111111111) (= (mask!8501 thiss!1248) #b00000000000000000000011111111111) (= (mask!8501 thiss!1248) #b00000000000000000000111111111111) (= (mask!8501 thiss!1248) #b00000000000000000001111111111111) (= (mask!8501 thiss!1248) #b00000000000000000011111111111111) (= (mask!8501 thiss!1248) #b00000000000000000111111111111111) (= (mask!8501 thiss!1248) #b00000000000000001111111111111111) (= (mask!8501 thiss!1248) #b00000000000000011111111111111111) (= (mask!8501 thiss!1248) #b00000000000000111111111111111111) (= (mask!8501 thiss!1248) #b00000000000001111111111111111111) (= (mask!8501 thiss!1248) #b00000000000011111111111111111111) (= (mask!8501 thiss!1248) #b00000000000111111111111111111111) (= (mask!8501 thiss!1248) #b00000000001111111111111111111111) (= (mask!8501 thiss!1248) #b00000000011111111111111111111111) (= (mask!8501 thiss!1248) #b00000000111111111111111111111111) (= (mask!8501 thiss!1248) #b00000001111111111111111111111111) (= (mask!8501 thiss!1248) #b00000011111111111111111111111111) (= (mask!8501 thiss!1248) #b00000111111111111111111111111111) (= (mask!8501 thiss!1248) #b00001111111111111111111111111111) (= (mask!8501 thiss!1248) #b00011111111111111111111111111111) (= (mask!8501 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8501 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!174879 d!53245))

(declare-fun d!53247 () Bool)

(declare-fun res!82966 () Bool)

(declare-fun e!115548 () Bool)

(assert (=> d!53247 (=> (not res!82966) (not e!115548))))

(declare-fun simpleValid!147 (LongMapFixedSize!2320) Bool)

(assert (=> d!53247 (= res!82966 (simpleValid!147 thiss!1248))))

(assert (=> d!53247 (= (valid!995 thiss!1248) e!115548)))

(declare-fun b!175039 () Bool)

(declare-fun res!82967 () Bool)

(assert (=> b!175039 (=> (not res!82967) (not e!115548))))

(declare-fun arrayCountValidKeys!0 (array!7315 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175039 (= res!82967 (= (arrayCountValidKeys!0 (_keys!5460 thiss!1248) #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))) (_size!1209 thiss!1248)))))

(declare-fun b!175040 () Bool)

(declare-fun res!82968 () Bool)

(assert (=> b!175040 (=> (not res!82968) (not e!115548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7315 (_ BitVec 32)) Bool)

(assert (=> b!175040 (= res!82968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)))))

(declare-fun b!175041 () Bool)

(declare-datatypes ((List!2226 0))(
  ( (Nil!2223) (Cons!2222 (h!2840 (_ BitVec 64)) (t!7035 List!2226)) )
))
(declare-fun arrayNoDuplicates!0 (array!7315 (_ BitVec 32) List!2226) Bool)

(assert (=> b!175041 (= e!115548 (arrayNoDuplicates!0 (_keys!5460 thiss!1248) #b00000000000000000000000000000000 Nil!2223))))

(assert (= (and d!53247 res!82966) b!175039))

(assert (= (and b!175039 res!82967) b!175040))

(assert (= (and b!175040 res!82968) b!175041))

(declare-fun m!203515 () Bool)

(assert (=> d!53247 m!203515))

(declare-fun m!203517 () Bool)

(assert (=> b!175039 m!203517))

(declare-fun m!203519 () Bool)

(assert (=> b!175040 m!203519))

(declare-fun m!203521 () Bool)

(assert (=> b!175041 m!203521))

(assert (=> start!17460 d!53247))

(declare-fun condMapEmpty!6996 () Bool)

(declare-fun mapDefault!6996 () ValueCell!1706)

(assert (=> mapNonEmpty!6987 (= condMapEmpty!6996 (= mapRest!6987 ((as const (Array (_ BitVec 32) ValueCell!1706)) mapDefault!6996)))))

(declare-fun e!115554 () Bool)

(declare-fun mapRes!6996 () Bool)

(assert (=> mapNonEmpty!6987 (= tp!15657 (and e!115554 mapRes!6996))))

(declare-fun mapIsEmpty!6996 () Bool)

(assert (=> mapIsEmpty!6996 mapRes!6996))

(declare-fun mapNonEmpty!6996 () Bool)

(declare-fun tp!15672 () Bool)

(declare-fun e!115553 () Bool)

(assert (=> mapNonEmpty!6996 (= mapRes!6996 (and tp!15672 e!115553))))

(declare-fun mapKey!6996 () (_ BitVec 32))

(declare-fun mapRest!6996 () (Array (_ BitVec 32) ValueCell!1706))

(declare-fun mapValue!6996 () ValueCell!1706)

(assert (=> mapNonEmpty!6996 (= mapRest!6987 (store mapRest!6996 mapKey!6996 mapValue!6996))))

(declare-fun b!175048 () Bool)

(assert (=> b!175048 (= e!115553 tp_is_empty!4099)))

(declare-fun b!175049 () Bool)

(assert (=> b!175049 (= e!115554 tp_is_empty!4099)))

(assert (= (and mapNonEmpty!6987 condMapEmpty!6996) mapIsEmpty!6996))

(assert (= (and mapNonEmpty!6987 (not condMapEmpty!6996)) mapNonEmpty!6996))

(assert (= (and mapNonEmpty!6996 ((_ is ValueCellFull!1706) mapValue!6996)) b!175048))

(assert (= (and mapNonEmpty!6987 ((_ is ValueCellFull!1706) mapDefault!6996)) b!175049))

(declare-fun m!203523 () Bool)

(assert (=> mapNonEmpty!6996 m!203523))

(declare-fun b_lambda!6983 () Bool)

(assert (= b_lambda!6981 (or (and b!174878 b_free!4327) b_lambda!6983)))

(check-sat (not b_next!4327) (not b!174949) (not b_lambda!6983) (not b!175030) (not b!175011) b_and!10781 (not bm!17717) (not b!175012) (not d!53237) (not b!174998) (not b!174997) (not b!174993) (not bm!17719) (not b!175008) (not mapNonEmpty!6996) (not b!174994) (not b!174947) (not d!53239) (not d!53247) (not d!53235) (not b!175041) (not b!175039) (not b!174996) (not bm!17718) (not b!175040) tp_is_empty!4099 (not bm!17716))
(check-sat b_and!10781 (not b_next!4327))
(get-model)

(declare-fun d!53249 () Bool)

(declare-fun e!115555 () Bool)

(assert (=> d!53249 e!115555))

(declare-fun res!82969 () Bool)

(assert (=> d!53249 (=> res!82969 e!115555)))

(declare-fun lt!86510 () Bool)

(assert (=> d!53249 (= res!82969 (not lt!86510))))

(declare-fun lt!86511 () Bool)

(assert (=> d!53249 (= lt!86510 lt!86511)))

(declare-fun lt!86509 () Unit!5351)

(declare-fun e!115556 () Unit!5351)

(assert (=> d!53249 (= lt!86509 e!115556)))

(declare-fun c!31347 () Bool)

(assert (=> d!53249 (= c!31347 lt!86511)))

(assert (=> d!53249 (= lt!86511 (containsKey!190 (toList!1100 lt!86488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53249 (= (contains!1163 lt!86488 #b0000000000000000000000000000000000000000000000000000000000000000) lt!86510)))

(declare-fun b!175050 () Bool)

(declare-fun lt!86508 () Unit!5351)

(assert (=> b!175050 (= e!115556 lt!86508)))

(assert (=> b!175050 (= lt!86508 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1100 lt!86488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175050 (isDefined!140 (getValueByKey!186 (toList!1100 lt!86488) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175051 () Bool)

(declare-fun Unit!5355 () Unit!5351)

(assert (=> b!175051 (= e!115556 Unit!5355)))

(declare-fun b!175052 () Bool)

(assert (=> b!175052 (= e!115555 (isDefined!140 (getValueByKey!186 (toList!1100 lt!86488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53249 c!31347) b!175050))

(assert (= (and d!53249 (not c!31347)) b!175051))

(assert (= (and d!53249 (not res!82969)) b!175052))

(declare-fun m!203525 () Bool)

(assert (=> d!53249 m!203525))

(declare-fun m!203527 () Bool)

(assert (=> b!175050 m!203527))

(declare-fun m!203529 () Bool)

(assert (=> b!175050 m!203529))

(assert (=> b!175050 m!203529))

(declare-fun m!203531 () Bool)

(assert (=> b!175050 m!203531))

(assert (=> b!175052 m!203529))

(assert (=> b!175052 m!203529))

(assert (=> b!175052 m!203531))

(assert (=> bm!17718 d!53249))

(declare-fun d!53251 () Bool)

(assert (=> d!53251 (= (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!174993 d!53251))

(declare-fun d!53253 () Bool)

(declare-fun res!82974 () Bool)

(declare-fun e!115561 () Bool)

(assert (=> d!53253 (=> res!82974 e!115561)))

(assert (=> d!53253 (= res!82974 (and ((_ is Cons!2220) (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (= (_1!1636 (h!2838 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)))))

(assert (=> d!53253 (= (containsKey!190 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828) e!115561)))

(declare-fun b!175057 () Bool)

(declare-fun e!115562 () Bool)

(assert (=> b!175057 (= e!115561 e!115562)))

(declare-fun res!82975 () Bool)

(assert (=> b!175057 (=> (not res!82975) (not e!115562))))

(assert (=> b!175057 (= res!82975 (and (or (not ((_ is Cons!2220) (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) (bvsle (_1!1636 (h!2838 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)) ((_ is Cons!2220) (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (bvslt (_1!1636 (h!2838 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)))))

(declare-fun b!175058 () Bool)

(assert (=> b!175058 (= e!115562 (containsKey!190 (t!7031 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) key!828))))

(assert (= (and d!53253 (not res!82974)) b!175057))

(assert (= (and b!175057 res!82975) b!175058))

(declare-fun m!203533 () Bool)

(assert (=> b!175058 m!203533))

(assert (=> d!53235 d!53253))

(declare-fun d!53255 () Bool)

(declare-fun get!1978 (Option!192) V!5113)

(assert (=> d!53255 (= (apply!133 lt!86488 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)) (get!1978 (getValueByKey!186 (toList!1100 lt!86488) (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7205 () Bool)

(assert (= bs!7205 d!53255))

(assert (=> bs!7205 m!203449))

(declare-fun m!203535 () Bool)

(assert (=> bs!7205 m!203535))

(assert (=> bs!7205 m!203535))

(declare-fun m!203537 () Bool)

(assert (=> bs!7205 m!203537))

(assert (=> b!175011 d!53255))

(declare-fun d!53257 () Bool)

(declare-fun c!31350 () Bool)

(assert (=> d!53257 (= c!31350 ((_ is ValueCellFull!1706) (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!115565 () V!5113)

(assert (=> d!53257 (= (get!1977 (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!467 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!115565)))

(declare-fun b!175063 () Bool)

(declare-fun get!1979 (ValueCell!1706 V!5113) V!5113)

(assert (=> b!175063 (= e!115565 (get!1979 (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!467 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175064 () Bool)

(declare-fun get!1980 (ValueCell!1706 V!5113) V!5113)

(assert (=> b!175064 (= e!115565 (get!1980 (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!467 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53257 c!31350) b!175063))

(assert (= (and d!53257 (not c!31350)) b!175064))

(assert (=> b!175063 m!203447))

(assert (=> b!175063 m!203453))

(declare-fun m!203539 () Bool)

(assert (=> b!175063 m!203539))

(assert (=> b!175064 m!203447))

(assert (=> b!175064 m!203453))

(declare-fun m!203541 () Bool)

(assert (=> b!175064 m!203541))

(assert (=> b!175011 d!53257))

(declare-fun d!53259 () Bool)

(assert (=> d!53259 (= (apply!133 lt!86488 #b1000000000000000000000000000000000000000000000000000000000000000) (get!1978 (getValueByKey!186 (toList!1100 lt!86488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7206 () Bool)

(assert (= bs!7206 d!53259))

(declare-fun m!203543 () Bool)

(assert (=> bs!7206 m!203543))

(assert (=> bs!7206 m!203543))

(declare-fun m!203545 () Bool)

(assert (=> bs!7206 m!203545))

(assert (=> b!174994 d!53259))

(declare-fun lt!86517 () SeekEntryResult!558)

(declare-fun d!53261 () Bool)

(assert (=> d!53261 (and (or ((_ is Undefined!558) lt!86517) (not ((_ is Found!558) lt!86517)) (and (bvsge (index!4401 lt!86517) #b00000000000000000000000000000000) (bvslt (index!4401 lt!86517) (size!3774 (_keys!5460 thiss!1248))))) (or ((_ is Undefined!558) lt!86517) ((_ is Found!558) lt!86517) (not ((_ is MissingVacant!558) lt!86517)) (not (= (index!4403 lt!86517) (index!4402 lt!86506))) (and (bvsge (index!4403 lt!86517) #b00000000000000000000000000000000) (bvslt (index!4403 lt!86517) (size!3774 (_keys!5460 thiss!1248))))) (or ((_ is Undefined!558) lt!86517) (ite ((_ is Found!558) lt!86517) (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4401 lt!86517)) key!828) (and ((_ is MissingVacant!558) lt!86517) (= (index!4403 lt!86517) (index!4402 lt!86506)) (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4403 lt!86517)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!115573 () SeekEntryResult!558)

(assert (=> d!53261 (= lt!86517 e!115573)))

(declare-fun c!31359 () Bool)

(assert (=> d!53261 (= c!31359 (bvsge (x!19271 lt!86506) #b01111111111111111111111111111110))))

(declare-fun lt!86516 () (_ BitVec 64))

(assert (=> d!53261 (= lt!86516 (select (arr!3472 (_keys!5460 thiss!1248)) (index!4402 lt!86506)))))

(assert (=> d!53261 (validMask!0 (mask!8501 thiss!1248))))

(assert (=> d!53261 (= (seekKeyOrZeroReturnVacant!0 (x!19271 lt!86506) (index!4402 lt!86506) (index!4402 lt!86506) key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)) lt!86517)))

(declare-fun b!175077 () Bool)

(declare-fun e!115572 () SeekEntryResult!558)

(assert (=> b!175077 (= e!115573 e!115572)))

(declare-fun c!31358 () Bool)

(assert (=> b!175077 (= c!31358 (= lt!86516 key!828))))

(declare-fun b!175078 () Bool)

(declare-fun e!115574 () SeekEntryResult!558)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!175078 (= e!115574 (seekKeyOrZeroReturnVacant!0 (bvadd (x!19271 lt!86506) #b00000000000000000000000000000001) (nextIndex!0 (index!4402 lt!86506) (x!19271 lt!86506) (mask!8501 thiss!1248)) (index!4402 lt!86506) key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)))))

(declare-fun b!175079 () Bool)

(assert (=> b!175079 (= e!115572 (Found!558 (index!4402 lt!86506)))))

(declare-fun b!175080 () Bool)

(assert (=> b!175080 (= e!115573 Undefined!558)))

(declare-fun b!175081 () Bool)

(assert (=> b!175081 (= e!115574 (MissingVacant!558 (index!4402 lt!86506)))))

(declare-fun b!175082 () Bool)

(declare-fun c!31357 () Bool)

(assert (=> b!175082 (= c!31357 (= lt!86516 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175082 (= e!115572 e!115574)))

(assert (= (and d!53261 c!31359) b!175080))

(assert (= (and d!53261 (not c!31359)) b!175077))

(assert (= (and b!175077 c!31358) b!175079))

(assert (= (and b!175077 (not c!31358)) b!175082))

(assert (= (and b!175082 c!31357) b!175081))

(assert (= (and b!175082 (not c!31357)) b!175078))

(declare-fun m!203547 () Bool)

(assert (=> d!53261 m!203547))

(declare-fun m!203549 () Bool)

(assert (=> d!53261 m!203549))

(assert (=> d!53261 m!203513))

(assert (=> d!53261 m!203397))

(declare-fun m!203551 () Bool)

(assert (=> b!175078 m!203551))

(assert (=> b!175078 m!203551))

(declare-fun m!203553 () Bool)

(assert (=> b!175078 m!203553))

(assert (=> b!175030 d!53261))

(declare-fun b!175107 () Bool)

(declare-fun e!115595 () Bool)

(declare-fun e!115594 () Bool)

(assert (=> b!175107 (= e!115595 e!115594)))

(declare-fun c!31368 () Bool)

(declare-fun e!115592 () Bool)

(assert (=> b!175107 (= c!31368 e!115592)))

(declare-fun res!82984 () Bool)

(assert (=> b!175107 (=> (not res!82984) (not e!115592))))

(assert (=> b!175107 (= res!82984 (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun b!175108 () Bool)

(declare-fun e!115590 () ListLongMap!2169)

(assert (=> b!175108 (= e!115590 (ListLongMap!2170 Nil!2221))))

(declare-fun b!175109 () Bool)

(declare-fun e!115589 () Bool)

(assert (=> b!175109 (= e!115594 e!115589)))

(declare-fun c!31371 () Bool)

(assert (=> b!175109 (= c!31371 (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun bm!17722 () Bool)

(declare-fun call!17725 () ListLongMap!2169)

(assert (=> bm!17722 (= call!17725 (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3613 thiss!1248)))))

(declare-fun b!175110 () Bool)

(declare-fun res!82985 () Bool)

(assert (=> b!175110 (=> (not res!82985) (not e!115595))))

(declare-fun lt!86538 () ListLongMap!2169)

(assert (=> b!175110 (= res!82985 (not (contains!1163 lt!86538 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175111 () Bool)

(declare-fun e!115593 () Bool)

(assert (=> b!175111 (= e!115594 e!115593)))

(assert (=> b!175111 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun res!82987 () Bool)

(assert (=> b!175111 (= res!82987 (contains!1163 lt!86538 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175111 (=> (not res!82987) (not e!115593))))

(declare-fun b!175112 () Bool)

(assert (=> b!175112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(assert (=> b!175112 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!3775 (_values!3596 thiss!1248))))))

(assert (=> b!175112 (= e!115593 (= (apply!133 lt!86538 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)) (get!1977 (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!467 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!53263 () Bool)

(assert (=> d!53263 e!115595))

(declare-fun res!82986 () Bool)

(assert (=> d!53263 (=> (not res!82986) (not e!115595))))

(assert (=> d!53263 (= res!82986 (not (contains!1163 lt!86538 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!53263 (= lt!86538 e!115590)))

(declare-fun c!31370 () Bool)

(assert (=> d!53263 (= c!31370 (bvsge #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(assert (=> d!53263 (validMask!0 (mask!8501 thiss!1248))))

(assert (=> d!53263 (= (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)) lt!86538)))

(declare-fun b!175113 () Bool)

(declare-fun e!115591 () ListLongMap!2169)

(assert (=> b!175113 (= e!115590 e!115591)))

(declare-fun c!31369 () Bool)

(assert (=> b!175113 (= c!31369 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175114 () Bool)

(assert (=> b!175114 (= e!115591 call!17725)))

(declare-fun b!175115 () Bool)

(declare-fun lt!86535 () Unit!5351)

(declare-fun lt!86534 () Unit!5351)

(assert (=> b!175115 (= lt!86535 lt!86534)))

(declare-fun lt!86537 () (_ BitVec 64))

(declare-fun lt!86532 () (_ BitVec 64))

(declare-fun lt!86536 () V!5113)

(declare-fun lt!86533 () ListLongMap!2169)

(assert (=> b!175115 (not (contains!1163 (+!245 lt!86533 (tuple2!3251 lt!86537 lt!86536)) lt!86532))))

(declare-fun addStillNotContains!75 (ListLongMap!2169 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5351)

(assert (=> b!175115 (= lt!86534 (addStillNotContains!75 lt!86533 lt!86537 lt!86536 lt!86532))))

(assert (=> b!175115 (= lt!86532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!175115 (= lt!86536 (get!1977 (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!467 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175115 (= lt!86537 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!175115 (= lt!86533 call!17725)))

(assert (=> b!175115 (= e!115591 (+!245 call!17725 (tuple2!3251 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000) (get!1977 (select (arr!3473 (_values!3596 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!467 (defaultEntry!3613 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!175116 () Bool)

(assert (=> b!175116 (= e!115592 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175116 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!175117 () Bool)

(assert (=> b!175117 (= e!115589 (= lt!86538 (getCurrentListMapNoExtraKeys!154 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3613 thiss!1248))))))

(declare-fun b!175118 () Bool)

(declare-fun isEmpty!445 (ListLongMap!2169) Bool)

(assert (=> b!175118 (= e!115589 (isEmpty!445 lt!86538))))

(assert (= (and d!53263 c!31370) b!175108))

(assert (= (and d!53263 (not c!31370)) b!175113))

(assert (= (and b!175113 c!31369) b!175115))

(assert (= (and b!175113 (not c!31369)) b!175114))

(assert (= (or b!175115 b!175114) bm!17722))

(assert (= (and d!53263 res!82986) b!175110))

(assert (= (and b!175110 res!82985) b!175107))

(assert (= (and b!175107 res!82984) b!175116))

(assert (= (and b!175107 c!31368) b!175111))

(assert (= (and b!175107 (not c!31368)) b!175109))

(assert (= (and b!175111 res!82987) b!175112))

(assert (= (and b!175109 c!31371) b!175117))

(assert (= (and b!175109 (not c!31371)) b!175118))

(declare-fun b_lambda!6985 () Bool)

(assert (=> (not b_lambda!6985) (not b!175112)))

(assert (=> b!175112 t!7034))

(declare-fun b_and!10783 () Bool)

(assert (= b_and!10781 (and (=> t!7034 result!4597) b_and!10783)))

(declare-fun b_lambda!6987 () Bool)

(assert (=> (not b_lambda!6987) (not b!175115)))

(assert (=> b!175115 t!7034))

(declare-fun b_and!10785 () Bool)

(assert (= b_and!10783 (and (=> t!7034 result!4597) b_and!10785)))

(assert (=> b!175113 m!203449))

(assert (=> b!175113 m!203449))

(assert (=> b!175113 m!203459))

(assert (=> b!175112 m!203447))

(assert (=> b!175112 m!203449))

(declare-fun m!203555 () Bool)

(assert (=> b!175112 m!203555))

(assert (=> b!175112 m!203453))

(assert (=> b!175112 m!203449))

(assert (=> b!175112 m!203447))

(assert (=> b!175112 m!203453))

(assert (=> b!175112 m!203455))

(assert (=> b!175111 m!203449))

(assert (=> b!175111 m!203449))

(declare-fun m!203557 () Bool)

(assert (=> b!175111 m!203557))

(declare-fun m!203559 () Bool)

(assert (=> bm!17722 m!203559))

(declare-fun m!203561 () Bool)

(assert (=> b!175110 m!203561))

(declare-fun m!203563 () Bool)

(assert (=> d!53263 m!203563))

(assert (=> d!53263 m!203397))

(assert (=> b!175117 m!203559))

(declare-fun m!203565 () Bool)

(assert (=> b!175115 m!203565))

(assert (=> b!175115 m!203447))

(declare-fun m!203567 () Bool)

(assert (=> b!175115 m!203567))

(declare-fun m!203569 () Bool)

(assert (=> b!175115 m!203569))

(assert (=> b!175115 m!203567))

(assert (=> b!175115 m!203453))

(declare-fun m!203571 () Bool)

(assert (=> b!175115 m!203571))

(assert (=> b!175115 m!203449))

(assert (=> b!175115 m!203447))

(assert (=> b!175115 m!203453))

(assert (=> b!175115 m!203455))

(assert (=> b!175116 m!203449))

(assert (=> b!175116 m!203449))

(assert (=> b!175116 m!203459))

(declare-fun m!203573 () Bool)

(assert (=> b!175118 m!203573))

(assert (=> bm!17719 d!53263))

(declare-fun b!175130 () Bool)

(declare-fun e!115598 () Bool)

(assert (=> b!175130 (= e!115598 (and (bvsge (extraKeys!3350 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3350 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1209 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!175128 () Bool)

(declare-fun res!82999 () Bool)

(assert (=> b!175128 (=> (not res!82999) (not e!115598))))

(declare-fun size!3780 (LongMapFixedSize!2320) (_ BitVec 32))

(assert (=> b!175128 (= res!82999 (bvsge (size!3780 thiss!1248) (_size!1209 thiss!1248)))))

(declare-fun b!175127 () Bool)

(declare-fun res!82998 () Bool)

(assert (=> b!175127 (=> (not res!82998) (not e!115598))))

(assert (=> b!175127 (= res!82998 (and (= (size!3775 (_values!3596 thiss!1248)) (bvadd (mask!8501 thiss!1248) #b00000000000000000000000000000001)) (= (size!3774 (_keys!5460 thiss!1248)) (size!3775 (_values!3596 thiss!1248))) (bvsge (_size!1209 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1209 thiss!1248) (bvadd (mask!8501 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun d!53265 () Bool)

(declare-fun res!82997 () Bool)

(assert (=> d!53265 (=> (not res!82997) (not e!115598))))

(assert (=> d!53265 (= res!82997 (validMask!0 (mask!8501 thiss!1248)))))

(assert (=> d!53265 (= (simpleValid!147 thiss!1248) e!115598)))

(declare-fun b!175129 () Bool)

(declare-fun res!82996 () Bool)

(assert (=> b!175129 (=> (not res!82996) (not e!115598))))

(assert (=> b!175129 (= res!82996 (= (size!3780 thiss!1248) (bvadd (_size!1209 thiss!1248) (bvsdiv (bvadd (extraKeys!3350 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!53265 res!82997) b!175127))

(assert (= (and b!175127 res!82998) b!175128))

(assert (= (and b!175128 res!82999) b!175129))

(assert (= (and b!175129 res!82996) b!175130))

(declare-fun m!203575 () Bool)

(assert (=> b!175128 m!203575))

(assert (=> d!53265 m!203397))

(assert (=> b!175129 m!203575))

(assert (=> d!53247 d!53265))

(declare-fun d!53267 () Bool)

(declare-fun e!115601 () Bool)

(assert (=> d!53267 e!115601))

(declare-fun res!83004 () Bool)

(assert (=> d!53267 (=> (not res!83004) (not e!115601))))

(declare-fun lt!86550 () ListLongMap!2169)

(assert (=> d!53267 (= res!83004 (contains!1163 lt!86550 (_1!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun lt!86547 () List!2224)

(assert (=> d!53267 (= lt!86550 (ListLongMap!2170 lt!86547))))

(declare-fun lt!86548 () Unit!5351)

(declare-fun lt!86549 () Unit!5351)

(assert (=> d!53267 (= lt!86548 lt!86549)))

(assert (=> d!53267 (= (getValueByKey!186 lt!86547 (_1!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!101 (List!2224 (_ BitVec 64) V!5113) Unit!5351)

(assert (=> d!53267 (= lt!86549 (lemmaContainsTupThenGetReturnValue!101 lt!86547 (_1!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(declare-fun insertStrictlySorted!104 (List!2224 (_ BitVec 64) V!5113) List!2224)

(assert (=> d!53267 (= lt!86547 (insertStrictlySorted!104 (toList!1100 call!17716) (_1!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(assert (=> d!53267 (= (+!245 call!17716 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))) lt!86550)))

(declare-fun b!175135 () Bool)

(declare-fun res!83005 () Bool)

(assert (=> b!175135 (=> (not res!83005) (not e!115601))))

(assert (=> b!175135 (= res!83005 (= (getValueByKey!186 (toList!1100 lt!86550) (_1!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(declare-fun b!175136 () Bool)

(declare-fun contains!1165 (List!2224 tuple2!3250) Bool)

(assert (=> b!175136 (= e!115601 (contains!1165 (toList!1100 lt!86550) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))

(assert (= (and d!53267 res!83004) b!175135))

(assert (= (and b!175135 res!83005) b!175136))

(declare-fun m!203577 () Bool)

(assert (=> d!53267 m!203577))

(declare-fun m!203579 () Bool)

(assert (=> d!53267 m!203579))

(declare-fun m!203581 () Bool)

(assert (=> d!53267 m!203581))

(declare-fun m!203583 () Bool)

(assert (=> d!53267 m!203583))

(declare-fun m!203585 () Bool)

(assert (=> b!175135 m!203585))

(declare-fun m!203587 () Bool)

(assert (=> b!175136 m!203587))

(assert (=> b!175012 d!53267))

(declare-fun d!53269 () Bool)

(assert (=> d!53269 (= (apply!133 lt!86477 lt!86478) (get!1978 (getValueByKey!186 (toList!1100 lt!86477) lt!86478)))))

(declare-fun bs!7207 () Bool)

(assert (= bs!7207 d!53269))

(declare-fun m!203589 () Bool)

(assert (=> bs!7207 m!203589))

(assert (=> bs!7207 m!203589))

(declare-fun m!203591 () Bool)

(assert (=> bs!7207 m!203591))

(assert (=> b!174996 d!53269))

(declare-fun d!53271 () Bool)

(declare-fun e!115602 () Bool)

(assert (=> d!53271 e!115602))

(declare-fun res!83006 () Bool)

(assert (=> d!53271 (=> res!83006 e!115602)))

(declare-fun lt!86553 () Bool)

(assert (=> d!53271 (= res!83006 (not lt!86553))))

(declare-fun lt!86554 () Bool)

(assert (=> d!53271 (= lt!86553 lt!86554)))

(declare-fun lt!86552 () Unit!5351)

(declare-fun e!115603 () Unit!5351)

(assert (=> d!53271 (= lt!86552 e!115603)))

(declare-fun c!31372 () Bool)

(assert (=> d!53271 (= c!31372 lt!86554)))

(assert (=> d!53271 (= lt!86554 (containsKey!190 (toList!1100 (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))) lt!86484))))

(assert (=> d!53271 (= (contains!1163 (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))) lt!86484) lt!86553)))

(declare-fun b!175137 () Bool)

(declare-fun lt!86551 () Unit!5351)

(assert (=> b!175137 (= e!115603 lt!86551)))

(assert (=> b!175137 (= lt!86551 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1100 (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))) lt!86484))))

(assert (=> b!175137 (isDefined!140 (getValueByKey!186 (toList!1100 (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))) lt!86484))))

(declare-fun b!175138 () Bool)

(declare-fun Unit!5356 () Unit!5351)

(assert (=> b!175138 (= e!115603 Unit!5356)))

(declare-fun b!175139 () Bool)

(assert (=> b!175139 (= e!115602 (isDefined!140 (getValueByKey!186 (toList!1100 (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))) lt!86484)))))

(assert (= (and d!53271 c!31372) b!175137))

(assert (= (and d!53271 (not c!31372)) b!175138))

(assert (= (and d!53271 (not res!83006)) b!175139))

(declare-fun m!203593 () Bool)

(assert (=> d!53271 m!203593))

(declare-fun m!203595 () Bool)

(assert (=> b!175137 m!203595))

(declare-fun m!203597 () Bool)

(assert (=> b!175137 m!203597))

(assert (=> b!175137 m!203597))

(declare-fun m!203599 () Bool)

(assert (=> b!175137 m!203599))

(assert (=> b!175139 m!203597))

(assert (=> b!175139 m!203597))

(assert (=> b!175139 m!203599))

(assert (=> b!174996 d!53271))

(declare-fun d!53273 () Bool)

(assert (=> d!53273 (= (apply!133 (+!245 lt!86480 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))) lt!86487) (apply!133 lt!86480 lt!86487))))

(declare-fun lt!86557 () Unit!5351)

(declare-fun choose!944 (ListLongMap!2169 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5351)

(assert (=> d!53273 (= lt!86557 (choose!944 lt!86480 lt!86496 (minValue!3454 thiss!1248) lt!86487))))

(declare-fun e!115606 () Bool)

(assert (=> d!53273 e!115606))

(declare-fun res!83009 () Bool)

(assert (=> d!53273 (=> (not res!83009) (not e!115606))))

(assert (=> d!53273 (= res!83009 (contains!1163 lt!86480 lt!86487))))

(assert (=> d!53273 (= (addApplyDifferent!109 lt!86480 lt!86496 (minValue!3454 thiss!1248) lt!86487) lt!86557)))

(declare-fun b!175143 () Bool)

(assert (=> b!175143 (= e!115606 (not (= lt!86487 lt!86496)))))

(assert (= (and d!53273 res!83009) b!175143))

(declare-fun m!203601 () Bool)

(assert (=> d!53273 m!203601))

(assert (=> d!53273 m!203483))

(assert (=> d!53273 m!203475))

(assert (=> d!53273 m!203475))

(assert (=> d!53273 m!203485))

(declare-fun m!203603 () Bool)

(assert (=> d!53273 m!203603))

(assert (=> b!174996 d!53273))

(declare-fun d!53275 () Bool)

(assert (=> d!53275 (= (apply!133 lt!86480 lt!86487) (get!1978 (getValueByKey!186 (toList!1100 lt!86480) lt!86487)))))

(declare-fun bs!7208 () Bool)

(assert (= bs!7208 d!53275))

(declare-fun m!203605 () Bool)

(assert (=> bs!7208 m!203605))

(assert (=> bs!7208 m!203605))

(declare-fun m!203607 () Bool)

(assert (=> bs!7208 m!203607))

(assert (=> b!174996 d!53275))

(declare-fun d!53277 () Bool)

(declare-fun e!115607 () Bool)

(assert (=> d!53277 e!115607))

(declare-fun res!83010 () Bool)

(assert (=> d!53277 (=> (not res!83010) (not e!115607))))

(declare-fun lt!86561 () ListLongMap!2169)

(assert (=> d!53277 (= res!83010 (contains!1163 lt!86561 (_1!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))))))

(declare-fun lt!86558 () List!2224)

(assert (=> d!53277 (= lt!86561 (ListLongMap!2170 lt!86558))))

(declare-fun lt!86559 () Unit!5351)

(declare-fun lt!86560 () Unit!5351)

(assert (=> d!53277 (= lt!86559 lt!86560)))

(assert (=> d!53277 (= (getValueByKey!186 lt!86558 (_1!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53277 (= lt!86560 (lemmaContainsTupThenGetReturnValue!101 lt!86558 (_1!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53277 (= lt!86558 (insertStrictlySorted!104 (toList!1100 lt!86490) (_1!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53277 (= (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))) lt!86561)))

(declare-fun b!175144 () Bool)

(declare-fun res!83011 () Bool)

(assert (=> b!175144 (=> (not res!83011) (not e!115607))))

(assert (=> b!175144 (= res!83011 (= (getValueByKey!186 (toList!1100 lt!86561) (_1!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))))))))

(declare-fun b!175145 () Bool)

(assert (=> b!175145 (= e!115607 (contains!1165 (toList!1100 lt!86561) (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))))))

(assert (= (and d!53277 res!83010) b!175144))

(assert (= (and b!175144 res!83011) b!175145))

(declare-fun m!203609 () Bool)

(assert (=> d!53277 m!203609))

(declare-fun m!203611 () Bool)

(assert (=> d!53277 m!203611))

(declare-fun m!203613 () Bool)

(assert (=> d!53277 m!203613))

(declare-fun m!203615 () Bool)

(assert (=> d!53277 m!203615))

(declare-fun m!203617 () Bool)

(assert (=> b!175144 m!203617))

(declare-fun m!203619 () Bool)

(assert (=> b!175145 m!203619))

(assert (=> b!174996 d!53277))

(declare-fun d!53279 () Bool)

(assert (=> d!53279 (= (apply!133 (+!245 lt!86497 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))) lt!86492) (get!1978 (getValueByKey!186 (toList!1100 (+!245 lt!86497 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248)))) lt!86492)))))

(declare-fun bs!7209 () Bool)

(assert (= bs!7209 d!53279))

(declare-fun m!203621 () Bool)

(assert (=> bs!7209 m!203621))

(assert (=> bs!7209 m!203621))

(declare-fun m!203623 () Bool)

(assert (=> bs!7209 m!203623))

(assert (=> b!174996 d!53279))

(declare-fun d!53281 () Bool)

(assert (=> d!53281 (= (apply!133 (+!245 lt!86480 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))) lt!86487) (get!1978 (getValueByKey!186 (toList!1100 (+!245 lt!86480 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248)))) lt!86487)))))

(declare-fun bs!7210 () Bool)

(assert (= bs!7210 d!53281))

(declare-fun m!203625 () Bool)

(assert (=> bs!7210 m!203625))

(assert (=> bs!7210 m!203625))

(declare-fun m!203627 () Bool)

(assert (=> bs!7210 m!203627))

(assert (=> b!174996 d!53281))

(declare-fun d!53283 () Bool)

(declare-fun e!115608 () Bool)

(assert (=> d!53283 e!115608))

(declare-fun res!83012 () Bool)

(assert (=> d!53283 (=> (not res!83012) (not e!115608))))

(declare-fun lt!86565 () ListLongMap!2169)

(assert (=> d!53283 (= res!83012 (contains!1163 lt!86565 (_1!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248)))))))

(declare-fun lt!86562 () List!2224)

(assert (=> d!53283 (= lt!86565 (ListLongMap!2170 lt!86562))))

(declare-fun lt!86563 () Unit!5351)

(declare-fun lt!86564 () Unit!5351)

(assert (=> d!53283 (= lt!86563 lt!86564)))

(assert (=> d!53283 (= (getValueByKey!186 lt!86562 (_1!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248)))))))

(assert (=> d!53283 (= lt!86564 (lemmaContainsTupThenGetReturnValue!101 lt!86562 (_1!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248)))))))

(assert (=> d!53283 (= lt!86562 (insertStrictlySorted!104 (toList!1100 lt!86497) (_1!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248)))))))

(assert (=> d!53283 (= (+!245 lt!86497 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))) lt!86565)))

(declare-fun b!175146 () Bool)

(declare-fun res!83013 () Bool)

(assert (=> b!175146 (=> (not res!83013) (not e!115608))))

(assert (=> b!175146 (= res!83013 (= (getValueByKey!186 (toList!1100 lt!86565) (_1!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))))))))

(declare-fun b!175147 () Bool)

(assert (=> b!175147 (= e!115608 (contains!1165 (toList!1100 lt!86565) (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))))))

(assert (= (and d!53283 res!83012) b!175146))

(assert (= (and b!175146 res!83013) b!175147))

(declare-fun m!203629 () Bool)

(assert (=> d!53283 m!203629))

(declare-fun m!203631 () Bool)

(assert (=> d!53283 m!203631))

(declare-fun m!203633 () Bool)

(assert (=> d!53283 m!203633))

(declare-fun m!203635 () Bool)

(assert (=> d!53283 m!203635))

(declare-fun m!203637 () Bool)

(assert (=> b!175146 m!203637))

(declare-fun m!203639 () Bool)

(assert (=> b!175147 m!203639))

(assert (=> b!174996 d!53283))

(declare-fun d!53285 () Bool)

(assert (=> d!53285 (= (apply!133 (+!245 lt!86477 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))) lt!86478) (get!1978 (getValueByKey!186 (toList!1100 (+!245 lt!86477 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248)))) lt!86478)))))

(declare-fun bs!7211 () Bool)

(assert (= bs!7211 d!53285))

(declare-fun m!203641 () Bool)

(assert (=> bs!7211 m!203641))

(assert (=> bs!7211 m!203641))

(declare-fun m!203643 () Bool)

(assert (=> bs!7211 m!203643))

(assert (=> b!174996 d!53285))

(declare-fun d!53287 () Bool)

(declare-fun e!115609 () Bool)

(assert (=> d!53287 e!115609))

(declare-fun res!83014 () Bool)

(assert (=> d!53287 (=> (not res!83014) (not e!115609))))

(declare-fun lt!86569 () ListLongMap!2169)

(assert (=> d!53287 (= res!83014 (contains!1163 lt!86569 (_1!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248)))))))

(declare-fun lt!86566 () List!2224)

(assert (=> d!53287 (= lt!86569 (ListLongMap!2170 lt!86566))))

(declare-fun lt!86567 () Unit!5351)

(declare-fun lt!86568 () Unit!5351)

(assert (=> d!53287 (= lt!86567 lt!86568)))

(assert (=> d!53287 (= (getValueByKey!186 lt!86566 (_1!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248)))))))

(assert (=> d!53287 (= lt!86568 (lemmaContainsTupThenGetReturnValue!101 lt!86566 (_1!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248)))))))

(assert (=> d!53287 (= lt!86566 (insertStrictlySorted!104 (toList!1100 lt!86480) (_1!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248)))))))

(assert (=> d!53287 (= (+!245 lt!86480 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))) lt!86569)))

(declare-fun b!175148 () Bool)

(declare-fun res!83015 () Bool)

(assert (=> b!175148 (=> (not res!83015) (not e!115609))))

(assert (=> b!175148 (= res!83015 (= (getValueByKey!186 (toList!1100 lt!86569) (_1!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))))))))

(declare-fun b!175149 () Bool)

(assert (=> b!175149 (= e!115609 (contains!1165 (toList!1100 lt!86569) (tuple2!3251 lt!86496 (minValue!3454 thiss!1248))))))

(assert (= (and d!53287 res!83014) b!175148))

(assert (= (and b!175148 res!83015) b!175149))

(declare-fun m!203645 () Bool)

(assert (=> d!53287 m!203645))

(declare-fun m!203647 () Bool)

(assert (=> d!53287 m!203647))

(declare-fun m!203649 () Bool)

(assert (=> d!53287 m!203649))

(declare-fun m!203651 () Bool)

(assert (=> d!53287 m!203651))

(declare-fun m!203653 () Bool)

(assert (=> b!175148 m!203653))

(declare-fun m!203655 () Bool)

(assert (=> b!175149 m!203655))

(assert (=> b!174996 d!53287))

(assert (=> b!174996 d!53263))

(declare-fun d!53289 () Bool)

(declare-fun e!115610 () Bool)

(assert (=> d!53289 e!115610))

(declare-fun res!83016 () Bool)

(assert (=> d!53289 (=> (not res!83016) (not e!115610))))

(declare-fun lt!86573 () ListLongMap!2169)

(assert (=> d!53289 (= res!83016 (contains!1163 lt!86573 (_1!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248)))))))

(declare-fun lt!86570 () List!2224)

(assert (=> d!53289 (= lt!86573 (ListLongMap!2170 lt!86570))))

(declare-fun lt!86571 () Unit!5351)

(declare-fun lt!86572 () Unit!5351)

(assert (=> d!53289 (= lt!86571 lt!86572)))

(assert (=> d!53289 (= (getValueByKey!186 lt!86570 (_1!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53289 (= lt!86572 (lemmaContainsTupThenGetReturnValue!101 lt!86570 (_1!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53289 (= lt!86570 (insertStrictlySorted!104 (toList!1100 lt!86477) (_1!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))) (_2!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248)))))))

(assert (=> d!53289 (= (+!245 lt!86477 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))) lt!86573)))

(declare-fun b!175150 () Bool)

(declare-fun res!83017 () Bool)

(assert (=> b!175150 (=> (not res!83017) (not e!115610))))

(assert (=> b!175150 (= res!83017 (= (getValueByKey!186 (toList!1100 lt!86573) (_1!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248)))) (Some!191 (_2!1636 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))))))))

(declare-fun b!175151 () Bool)

(assert (=> b!175151 (= e!115610 (contains!1165 (toList!1100 lt!86573) (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))))))

(assert (= (and d!53289 res!83016) b!175150))

(assert (= (and b!175150 res!83017) b!175151))

(declare-fun m!203657 () Bool)

(assert (=> d!53289 m!203657))

(declare-fun m!203659 () Bool)

(assert (=> d!53289 m!203659))

(declare-fun m!203661 () Bool)

(assert (=> d!53289 m!203661))

(declare-fun m!203663 () Bool)

(assert (=> d!53289 m!203663))

(declare-fun m!203665 () Bool)

(assert (=> b!175150 m!203665))

(declare-fun m!203667 () Bool)

(assert (=> b!175151 m!203667))

(assert (=> b!174996 d!53289))

(declare-fun d!53291 () Bool)

(assert (=> d!53291 (= (apply!133 (+!245 lt!86477 (tuple2!3251 lt!86483 (zeroValue!3454 thiss!1248))) lt!86478) (apply!133 lt!86477 lt!86478))))

(declare-fun lt!86574 () Unit!5351)

(assert (=> d!53291 (= lt!86574 (choose!944 lt!86477 lt!86483 (zeroValue!3454 thiss!1248) lt!86478))))

(declare-fun e!115611 () Bool)

(assert (=> d!53291 e!115611))

(declare-fun res!83018 () Bool)

(assert (=> d!53291 (=> (not res!83018) (not e!115611))))

(assert (=> d!53291 (= res!83018 (contains!1163 lt!86477 lt!86478))))

(assert (=> d!53291 (= (addApplyDifferent!109 lt!86477 lt!86483 (zeroValue!3454 thiss!1248) lt!86478) lt!86574)))

(declare-fun b!175152 () Bool)

(assert (=> b!175152 (= e!115611 (not (= lt!86478 lt!86483)))))

(assert (= (and d!53291 res!83018) b!175152))

(declare-fun m!203669 () Bool)

(assert (=> d!53291 m!203669))

(assert (=> d!53291 m!203497))

(assert (=> d!53291 m!203479))

(assert (=> d!53291 m!203479))

(assert (=> d!53291 m!203481))

(declare-fun m!203671 () Bool)

(assert (=> d!53291 m!203671))

(assert (=> b!174996 d!53291))

(declare-fun d!53293 () Bool)

(assert (=> d!53293 (contains!1163 (+!245 lt!86490 (tuple2!3251 lt!86485 (zeroValue!3454 thiss!1248))) lt!86484)))

(declare-fun lt!86577 () Unit!5351)

(declare-fun choose!945 (ListLongMap!2169 (_ BitVec 64) V!5113 (_ BitVec 64)) Unit!5351)

(assert (=> d!53293 (= lt!86577 (choose!945 lt!86490 lt!86485 (zeroValue!3454 thiss!1248) lt!86484))))

(assert (=> d!53293 (contains!1163 lt!86490 lt!86484)))

(assert (=> d!53293 (= (addStillContains!109 lt!86490 lt!86485 (zeroValue!3454 thiss!1248) lt!86484) lt!86577)))

(declare-fun bs!7212 () Bool)

(assert (= bs!7212 d!53293))

(assert (=> bs!7212 m!203471))

(assert (=> bs!7212 m!203471))

(assert (=> bs!7212 m!203473))

(declare-fun m!203673 () Bool)

(assert (=> bs!7212 m!203673))

(declare-fun m!203675 () Bool)

(assert (=> bs!7212 m!203675))

(assert (=> b!174996 d!53293))

(declare-fun d!53295 () Bool)

(assert (=> d!53295 (= (apply!133 lt!86497 lt!86492) (get!1978 (getValueByKey!186 (toList!1100 lt!86497) lt!86492)))))

(declare-fun bs!7213 () Bool)

(assert (= bs!7213 d!53295))

(declare-fun m!203677 () Bool)

(assert (=> bs!7213 m!203677))

(assert (=> bs!7213 m!203677))

(declare-fun m!203679 () Bool)

(assert (=> bs!7213 m!203679))

(assert (=> b!174996 d!53295))

(declare-fun d!53297 () Bool)

(assert (=> d!53297 (= (apply!133 (+!245 lt!86497 (tuple2!3251 lt!86493 (minValue!3454 thiss!1248))) lt!86492) (apply!133 lt!86497 lt!86492))))

(declare-fun lt!86578 () Unit!5351)

(assert (=> d!53297 (= lt!86578 (choose!944 lt!86497 lt!86493 (minValue!3454 thiss!1248) lt!86492))))

(declare-fun e!115612 () Bool)

(assert (=> d!53297 e!115612))

(declare-fun res!83019 () Bool)

(assert (=> d!53297 (=> (not res!83019) (not e!115612))))

(assert (=> d!53297 (= res!83019 (contains!1163 lt!86497 lt!86492))))

(assert (=> d!53297 (= (addApplyDifferent!109 lt!86497 lt!86493 (minValue!3454 thiss!1248) lt!86492) lt!86578)))

(declare-fun b!175154 () Bool)

(assert (=> b!175154 (= e!115612 (not (= lt!86492 lt!86493)))))

(assert (= (and d!53297 res!83019) b!175154))

(declare-fun m!203681 () Bool)

(assert (=> d!53297 m!203681))

(assert (=> d!53297 m!203477))

(assert (=> d!53297 m!203487))

(assert (=> d!53297 m!203487))

(assert (=> d!53297 m!203489))

(declare-fun m!203683 () Bool)

(assert (=> d!53297 m!203683))

(assert (=> b!174996 d!53297))

(declare-fun d!53299 () Bool)

(assert (=> d!53299 (isDefined!140 (getValueByKey!186 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-fun lt!86581 () Unit!5351)

(declare-fun choose!946 (List!2224 (_ BitVec 64)) Unit!5351)

(assert (=> d!53299 (= lt!86581 (choose!946 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(declare-fun e!115615 () Bool)

(assert (=> d!53299 e!115615))

(declare-fun res!83022 () Bool)

(assert (=> d!53299 (=> (not res!83022) (not e!115615))))

(declare-fun isStrictlySorted!329 (List!2224) Bool)

(assert (=> d!53299 (= res!83022 (isStrictlySorted!329 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))))

(assert (=> d!53299 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828) lt!86581)))

(declare-fun b!175157 () Bool)

(assert (=> b!175157 (= e!115615 (containsKey!190 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))

(assert (= (and d!53299 res!83022) b!175157))

(assert (=> d!53299 m!203439))

(assert (=> d!53299 m!203439))

(assert (=> d!53299 m!203441))

(declare-fun m!203685 () Bool)

(assert (=> d!53299 m!203685))

(declare-fun m!203687 () Bool)

(assert (=> d!53299 m!203687))

(assert (=> b!175157 m!203435))

(assert (=> b!174947 d!53299))

(declare-fun d!53301 () Bool)

(declare-fun isEmpty!446 (Option!192) Bool)

(assert (=> d!53301 (= (isDefined!140 (getValueByKey!186 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828)) (not (isEmpty!446 (getValueByKey!186 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828))))))

(declare-fun bs!7214 () Bool)

(assert (= bs!7214 d!53301))

(assert (=> bs!7214 m!203439))

(declare-fun m!203689 () Bool)

(assert (=> bs!7214 m!203689))

(assert (=> b!174947 d!53301))

(declare-fun b!175169 () Bool)

(declare-fun e!115621 () Option!192)

(assert (=> b!175169 (= e!115621 None!190)))

(declare-fun d!53303 () Bool)

(declare-fun c!31377 () Bool)

(assert (=> d!53303 (= c!31377 (and ((_ is Cons!2220) (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (= (_1!1636 (h!2838 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828)))))

(declare-fun e!115620 () Option!192)

(assert (=> d!53303 (= (getValueByKey!186 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))) key!828) e!115620)))

(declare-fun b!175167 () Bool)

(assert (=> b!175167 (= e!115620 e!115621)))

(declare-fun c!31378 () Bool)

(assert (=> b!175167 (= c!31378 (and ((_ is Cons!2220) (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) (not (= (_1!1636 (h!2838 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248))))) key!828))))))

(declare-fun b!175168 () Bool)

(assert (=> b!175168 (= e!115621 (getValueByKey!186 (t!7031 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))) key!828))))

(declare-fun b!175166 () Bool)

(assert (=> b!175166 (= e!115620 (Some!191 (_2!1636 (h!2838 (toList!1100 (getCurrentListMap!736 (_keys!5460 thiss!1248) (_values!3596 thiss!1248) (mask!8501 thiss!1248) (extraKeys!3350 thiss!1248) (zeroValue!3454 thiss!1248) (minValue!3454 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3613 thiss!1248)))))))))

(assert (= (and d!53303 c!31377) b!175166))

(assert (= (and d!53303 (not c!31377)) b!175167))

(assert (= (and b!175167 c!31378) b!175168))

(assert (= (and b!175167 (not c!31378)) b!175169))

(declare-fun m!203691 () Bool)

(assert (=> b!175168 m!203691))

(assert (=> b!174947 d!53303))

(declare-fun b!175178 () Bool)

(declare-fun e!115627 () (_ BitVec 32))

(assert (=> b!175178 (= e!115627 #b00000000000000000000000000000000)))

(declare-fun b!175179 () Bool)

(declare-fun e!115626 () (_ BitVec 32))

(declare-fun call!17728 () (_ BitVec 32))

(assert (=> b!175179 (= e!115626 (bvadd #b00000000000000000000000000000001 call!17728))))

(declare-fun b!175180 () Bool)

(assert (=> b!175180 (= e!115626 call!17728)))

(declare-fun bm!17725 () Bool)

(assert (=> bm!17725 (= call!17728 (arrayCountValidKeys!0 (_keys!5460 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun d!53305 () Bool)

(declare-fun lt!86584 () (_ BitVec 32))

(assert (=> d!53305 (and (bvsge lt!86584 #b00000000000000000000000000000000) (bvsle lt!86584 (bvsub (size!3774 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53305 (= lt!86584 e!115627)))

(declare-fun c!31384 () Bool)

(assert (=> d!53305 (= c!31384 (bvsge #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(assert (=> d!53305 (and (bvsle #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3774 (_keys!5460 thiss!1248)) (size!3774 (_keys!5460 thiss!1248))))))

(assert (=> d!53305 (= (arrayCountValidKeys!0 (_keys!5460 thiss!1248) #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))) lt!86584)))

(declare-fun b!175181 () Bool)

(assert (=> b!175181 (= e!115627 e!115626)))

(declare-fun c!31383 () Bool)

(assert (=> b!175181 (= c!31383 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53305 c!31384) b!175178))

(assert (= (and d!53305 (not c!31384)) b!175181))

(assert (= (and b!175181 c!31383) b!175179))

(assert (= (and b!175181 (not c!31383)) b!175180))

(assert (= (or b!175179 b!175180) bm!17725))

(declare-fun m!203693 () Bool)

(assert (=> bm!17725 m!203693))

(assert (=> b!175181 m!203449))

(assert (=> b!175181 m!203449))

(assert (=> b!175181 m!203459))

(assert (=> b!175039 d!53305))

(declare-fun b!175200 () Bool)

(declare-fun e!115641 () SeekEntryResult!558)

(declare-fun e!115642 () SeekEntryResult!558)

(assert (=> b!175200 (= e!115641 e!115642)))

(declare-fun c!31391 () Bool)

(declare-fun lt!86589 () (_ BitVec 64))

(assert (=> b!175200 (= c!31391 (or (= lt!86589 key!828) (= (bvadd lt!86589 lt!86589) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!175201 () Bool)

(declare-fun lt!86590 () SeekEntryResult!558)

(assert (=> b!175201 (and (bvsge (index!4402 lt!86590) #b00000000000000000000000000000000) (bvslt (index!4402 lt!86590) (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun res!83030 () Bool)

(assert (=> b!175201 (= res!83030 (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4402 lt!86590)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!115640 () Bool)

(assert (=> b!175201 (=> res!83030 e!115640)))

(declare-fun b!175202 () Bool)

(declare-fun e!115638 () Bool)

(declare-fun e!115639 () Bool)

(assert (=> b!175202 (= e!115638 e!115639)))

(declare-fun res!83031 () Bool)

(assert (=> b!175202 (= res!83031 (and ((_ is Intermediate!558) lt!86590) (not (undefined!1370 lt!86590)) (bvslt (x!19271 lt!86590) #b01111111111111111111111111111110) (bvsge (x!19271 lt!86590) #b00000000000000000000000000000000) (bvsge (x!19271 lt!86590) #b00000000000000000000000000000000)))))

(assert (=> b!175202 (=> (not res!83031) (not e!115639))))

(declare-fun b!175203 () Bool)

(assert (=> b!175203 (= e!115642 (Intermediate!558 false (toIndex!0 key!828 (mask!8501 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175204 () Bool)

(assert (=> b!175204 (= e!115638 (bvsge (x!19271 lt!86590) #b01111111111111111111111111111110))))

(declare-fun b!175205 () Bool)

(assert (=> b!175205 (and (bvsge (index!4402 lt!86590) #b00000000000000000000000000000000) (bvslt (index!4402 lt!86590) (size!3774 (_keys!5460 thiss!1248))))))

(declare-fun res!83029 () Bool)

(assert (=> b!175205 (= res!83029 (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4402 lt!86590)) key!828))))

(assert (=> b!175205 (=> res!83029 e!115640)))

(assert (=> b!175205 (= e!115639 e!115640)))

(declare-fun d!53307 () Bool)

(assert (=> d!53307 e!115638))

(declare-fun c!31392 () Bool)

(assert (=> d!53307 (= c!31392 (and ((_ is Intermediate!558) lt!86590) (undefined!1370 lt!86590)))))

(assert (=> d!53307 (= lt!86590 e!115641)))

(declare-fun c!31393 () Bool)

(assert (=> d!53307 (= c!31393 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!53307 (= lt!86589 (select (arr!3472 (_keys!5460 thiss!1248)) (toIndex!0 key!828 (mask!8501 thiss!1248))))))

(assert (=> d!53307 (validMask!0 (mask!8501 thiss!1248))))

(assert (=> d!53307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8501 thiss!1248)) key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)) lt!86590)))

(declare-fun b!175206 () Bool)

(assert (=> b!175206 (= e!115641 (Intermediate!558 true (toIndex!0 key!828 (mask!8501 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!175207 () Bool)

(assert (=> b!175207 (= e!115642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8501 thiss!1248)) #b00000000000000000000000000000000 (mask!8501 thiss!1248)) key!828 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)))))

(declare-fun b!175208 () Bool)

(assert (=> b!175208 (and (bvsge (index!4402 lt!86590) #b00000000000000000000000000000000) (bvslt (index!4402 lt!86590) (size!3774 (_keys!5460 thiss!1248))))))

(assert (=> b!175208 (= e!115640 (= (select (arr!3472 (_keys!5460 thiss!1248)) (index!4402 lt!86590)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!53307 c!31393) b!175206))

(assert (= (and d!53307 (not c!31393)) b!175200))

(assert (= (and b!175200 c!31391) b!175203))

(assert (= (and b!175200 (not c!31391)) b!175207))

(assert (= (and d!53307 c!31392) b!175204))

(assert (= (and d!53307 (not c!31392)) b!175202))

(assert (= (and b!175202 res!83031) b!175205))

(assert (= (and b!175205 (not res!83029)) b!175201))

(assert (= (and b!175201 (not res!83030)) b!175208))

(declare-fun m!203695 () Bool)

(assert (=> b!175201 m!203695))

(assert (=> d!53307 m!203507))

(declare-fun m!203697 () Bool)

(assert (=> d!53307 m!203697))

(assert (=> d!53307 m!203397))

(assert (=> b!175208 m!203695))

(assert (=> b!175205 m!203695))

(assert (=> b!175207 m!203507))

(declare-fun m!203699 () Bool)

(assert (=> b!175207 m!203699))

(assert (=> b!175207 m!203699))

(declare-fun m!203701 () Bool)

(assert (=> b!175207 m!203701))

(assert (=> d!53239 d!53307))

(declare-fun d!53309 () Bool)

(declare-fun lt!86596 () (_ BitVec 32))

(declare-fun lt!86595 () (_ BitVec 32))

(assert (=> d!53309 (= lt!86596 (bvmul (bvxor lt!86595 (bvlshr lt!86595 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!53309 (= lt!86595 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!53309 (and (bvsge (mask!8501 thiss!1248) #b00000000000000000000000000000000) (let ((res!83032 (let ((h!2841 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!19290 (bvmul (bvxor h!2841 (bvlshr h!2841 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!19290 (bvlshr x!19290 #b00000000000000000000000000001101)) (mask!8501 thiss!1248)))))) (and (bvslt res!83032 (bvadd (mask!8501 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!83032 #b00000000000000000000000000000000))))))

(assert (=> d!53309 (= (toIndex!0 key!828 (mask!8501 thiss!1248)) (bvand (bvxor lt!86596 (bvlshr lt!86596 #b00000000000000000000000000001101)) (mask!8501 thiss!1248)))))

(assert (=> d!53239 d!53309))

(assert (=> d!53239 d!53245))

(declare-fun d!53311 () Bool)

(assert (=> d!53311 (= (apply!133 lt!86488 #b0000000000000000000000000000000000000000000000000000000000000000) (get!1978 (getValueByKey!186 (toList!1100 lt!86488) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7215 () Bool)

(assert (= bs!7215 d!53311))

(assert (=> bs!7215 m!203529))

(assert (=> bs!7215 m!203529))

(declare-fun m!203703 () Bool)

(assert (=> bs!7215 m!203703))

(assert (=> b!174997 d!53311))

(declare-fun b!175217 () Bool)

(declare-fun e!115649 () Bool)

(declare-fun e!115651 () Bool)

(assert (=> b!175217 (= e!115649 e!115651)))

(declare-fun lt!86605 () (_ BitVec 64))

(assert (=> b!175217 (= lt!86605 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!86604 () Unit!5351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7315 (_ BitVec 64) (_ BitVec 32)) Unit!5351)

(assert (=> b!175217 (= lt!86604 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5460 thiss!1248) lt!86605 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!175217 (arrayContainsKey!0 (_keys!5460 thiss!1248) lt!86605 #b00000000000000000000000000000000)))

(declare-fun lt!86603 () Unit!5351)

(assert (=> b!175217 (= lt!86603 lt!86604)))

(declare-fun res!83037 () Bool)

(assert (=> b!175217 (= res!83037 (= (seekEntryOrOpen!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000) (_keys!5460 thiss!1248) (mask!8501 thiss!1248)) (Found!558 #b00000000000000000000000000000000)))))

(assert (=> b!175217 (=> (not res!83037) (not e!115651))))

(declare-fun bm!17728 () Bool)

(declare-fun call!17731 () Bool)

(assert (=> bm!17728 (= call!17731 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5460 thiss!1248) (mask!8501 thiss!1248)))))

(declare-fun b!175218 () Bool)

(assert (=> b!175218 (= e!115649 call!17731)))

(declare-fun d!53313 () Bool)

(declare-fun res!83038 () Bool)

(declare-fun e!115650 () Bool)

(assert (=> d!53313 (=> res!83038 e!115650)))

(assert (=> d!53313 (= res!83038 (bvsge #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(assert (=> d!53313 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5460 thiss!1248) (mask!8501 thiss!1248)) e!115650)))

(declare-fun b!175219 () Bool)

(assert (=> b!175219 (= e!115650 e!115649)))

(declare-fun c!31396 () Bool)

(assert (=> b!175219 (= c!31396 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175220 () Bool)

(assert (=> b!175220 (= e!115651 call!17731)))

(assert (= (and d!53313 (not res!83038)) b!175219))

(assert (= (and b!175219 c!31396) b!175217))

(assert (= (and b!175219 (not c!31396)) b!175218))

(assert (= (and b!175217 res!83037) b!175220))

(assert (= (or b!175220 b!175218) bm!17728))

(assert (=> b!175217 m!203449))

(declare-fun m!203705 () Bool)

(assert (=> b!175217 m!203705))

(declare-fun m!203707 () Bool)

(assert (=> b!175217 m!203707))

(assert (=> b!175217 m!203449))

(declare-fun m!203709 () Bool)

(assert (=> b!175217 m!203709))

(declare-fun m!203711 () Bool)

(assert (=> bm!17728 m!203711))

(assert (=> b!175219 m!203449))

(assert (=> b!175219 m!203449))

(assert (=> b!175219 m!203459))

(assert (=> b!175040 d!53313))

(assert (=> d!53237 d!53245))

(declare-fun d!53315 () Bool)

(declare-fun e!115652 () Bool)

(assert (=> d!53315 e!115652))

(declare-fun res!83039 () Bool)

(assert (=> d!53315 (=> res!83039 e!115652)))

(declare-fun lt!86608 () Bool)

(assert (=> d!53315 (= res!83039 (not lt!86608))))

(declare-fun lt!86609 () Bool)

(assert (=> d!53315 (= lt!86608 lt!86609)))

(declare-fun lt!86607 () Unit!5351)

(declare-fun e!115653 () Unit!5351)

(assert (=> d!53315 (= lt!86607 e!115653)))

(declare-fun c!31397 () Bool)

(assert (=> d!53315 (= c!31397 lt!86609)))

(assert (=> d!53315 (= lt!86609 (containsKey!190 (toList!1100 lt!86488) (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!53315 (= (contains!1163 lt!86488 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)) lt!86608)))

(declare-fun b!175221 () Bool)

(declare-fun lt!86606 () Unit!5351)

(assert (=> b!175221 (= e!115653 lt!86606)))

(assert (=> b!175221 (= lt!86606 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1100 lt!86488) (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!175221 (isDefined!140 (getValueByKey!186 (toList!1100 lt!86488) (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175222 () Bool)

(declare-fun Unit!5357 () Unit!5351)

(assert (=> b!175222 (= e!115653 Unit!5357)))

(declare-fun b!175223 () Bool)

(assert (=> b!175223 (= e!115652 (isDefined!140 (getValueByKey!186 (toList!1100 lt!86488) (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!53315 c!31397) b!175221))

(assert (= (and d!53315 (not c!31397)) b!175222))

(assert (= (and d!53315 (not res!83039)) b!175223))

(assert (=> d!53315 m!203449))

(declare-fun m!203713 () Bool)

(assert (=> d!53315 m!203713))

(assert (=> b!175221 m!203449))

(declare-fun m!203715 () Bool)

(assert (=> b!175221 m!203715))

(assert (=> b!175221 m!203449))

(assert (=> b!175221 m!203535))

(assert (=> b!175221 m!203535))

(declare-fun m!203717 () Bool)

(assert (=> b!175221 m!203717))

(assert (=> b!175223 m!203449))

(assert (=> b!175223 m!203535))

(assert (=> b!175223 m!203535))

(assert (=> b!175223 m!203717))

(assert (=> b!174998 d!53315))

(assert (=> b!174949 d!53301))

(assert (=> b!174949 d!53303))

(declare-fun b!175234 () Bool)

(declare-fun e!115662 () Bool)

(declare-fun e!115664 () Bool)

(assert (=> b!175234 (= e!115662 e!115664)))

(declare-fun c!31400 () Bool)

(assert (=> b!175234 (= c!31400 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175235 () Bool)

(declare-fun e!115663 () Bool)

(declare-fun contains!1166 (List!2226 (_ BitVec 64)) Bool)

(assert (=> b!175235 (= e!115663 (contains!1166 Nil!2223 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!175236 () Bool)

(declare-fun call!17734 () Bool)

(assert (=> b!175236 (= e!115664 call!17734)))

(declare-fun bm!17731 () Bool)

(assert (=> bm!17731 (= call!17734 (arrayNoDuplicates!0 (_keys!5460 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!31400 (Cons!2222 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000) Nil!2223) Nil!2223)))))

(declare-fun b!175237 () Bool)

(assert (=> b!175237 (= e!115664 call!17734)))

(declare-fun d!53317 () Bool)

(declare-fun res!83047 () Bool)

(declare-fun e!115665 () Bool)

(assert (=> d!53317 (=> res!83047 e!115665)))

(assert (=> d!53317 (= res!83047 (bvsge #b00000000000000000000000000000000 (size!3774 (_keys!5460 thiss!1248))))))

(assert (=> d!53317 (= (arrayNoDuplicates!0 (_keys!5460 thiss!1248) #b00000000000000000000000000000000 Nil!2223) e!115665)))

(declare-fun b!175238 () Bool)

(assert (=> b!175238 (= e!115665 e!115662)))

(declare-fun res!83046 () Bool)

(assert (=> b!175238 (=> (not res!83046) (not e!115662))))

(assert (=> b!175238 (= res!83046 (not e!115663))))

(declare-fun res!83048 () Bool)

(assert (=> b!175238 (=> (not res!83048) (not e!115663))))

(assert (=> b!175238 (= res!83048 (validKeyInArray!0 (select (arr!3472 (_keys!5460 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!53317 (not res!83047)) b!175238))

(assert (= (and b!175238 res!83048) b!175235))

(assert (= (and b!175238 res!83046) b!175234))

(assert (= (and b!175234 c!31400) b!175236))

(assert (= (and b!175234 (not c!31400)) b!175237))

(assert (= (or b!175236 b!175237) bm!17731))

(assert (=> b!175234 m!203449))

(assert (=> b!175234 m!203449))

(assert (=> b!175234 m!203459))

(assert (=> b!175235 m!203449))

(assert (=> b!175235 m!203449))

(declare-fun m!203719 () Bool)

(assert (=> b!175235 m!203719))

(assert (=> bm!17731 m!203449))

(declare-fun m!203721 () Bool)

(assert (=> bm!17731 m!203721))

(assert (=> b!175238 m!203449))

(assert (=> b!175238 m!203449))

(assert (=> b!175238 m!203459))

(assert (=> b!175041 d!53317))

(assert (=> b!175008 d!53251))

(declare-fun d!53319 () Bool)

(declare-fun e!115666 () Bool)

(assert (=> d!53319 e!115666))

(declare-fun res!83049 () Bool)

(assert (=> d!53319 (=> (not res!83049) (not e!115666))))

(declare-fun lt!86613 () ListLongMap!2169)

(assert (=> d!53319 (= res!83049 (contains!1163 lt!86613 (_1!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(declare-fun lt!86610 () List!2224)

(assert (=> d!53319 (= lt!86613 (ListLongMap!2170 lt!86610))))

(declare-fun lt!86611 () Unit!5351)

(declare-fun lt!86612 () Unit!5351)

(assert (=> d!53319 (= lt!86611 lt!86612)))

(assert (=> d!53319 (= (getValueByKey!186 lt!86610 (_1!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))) (Some!191 (_2!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(assert (=> d!53319 (= lt!86612 (lemmaContainsTupThenGetReturnValue!101 lt!86610 (_1!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (_2!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(assert (=> d!53319 (= lt!86610 (insertStrictlySorted!104 (toList!1100 (ite c!31335 call!17717 (ite c!31332 call!17722 call!17718))) (_1!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) (_2!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))))))

(assert (=> d!53319 (= (+!245 (ite c!31335 call!17717 (ite c!31332 call!17722 call!17718)) (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))) lt!86613)))

(declare-fun b!175239 () Bool)

(declare-fun res!83050 () Bool)

(assert (=> b!175239 (=> (not res!83050) (not e!115666))))

(assert (=> b!175239 (= res!83050 (= (getValueByKey!186 (toList!1100 lt!86613) (_1!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248))))) (Some!191 (_2!1636 (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))))

(declare-fun b!175240 () Bool)

(assert (=> b!175240 (= e!115666 (contains!1165 (toList!1100 lt!86613) (ite (or c!31335 c!31332) (tuple2!3251 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3454 thiss!1248)) (tuple2!3251 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3454 thiss!1248)))))))

(assert (= (and d!53319 res!83049) b!175239))

(assert (= (and b!175239 res!83050) b!175240))

(declare-fun m!203723 () Bool)

(assert (=> d!53319 m!203723))

(declare-fun m!203725 () Bool)

(assert (=> d!53319 m!203725))

(declare-fun m!203727 () Bool)

(assert (=> d!53319 m!203727))

(declare-fun m!203729 () Bool)

(assert (=> d!53319 m!203729))

(declare-fun m!203731 () Bool)

(assert (=> b!175239 m!203731))

(declare-fun m!203733 () Bool)

(assert (=> b!175240 m!203733))

(assert (=> bm!17716 d!53319))

(declare-fun d!53321 () Bool)

(declare-fun e!115667 () Bool)

(assert (=> d!53321 e!115667))

(declare-fun res!83051 () Bool)

(assert (=> d!53321 (=> res!83051 e!115667)))

(declare-fun lt!86616 () Bool)

(assert (=> d!53321 (= res!83051 (not lt!86616))))

(declare-fun lt!86617 () Bool)

(assert (=> d!53321 (= lt!86616 lt!86617)))

(declare-fun lt!86615 () Unit!5351)

(declare-fun e!115668 () Unit!5351)

(assert (=> d!53321 (= lt!86615 e!115668)))

(declare-fun c!31401 () Bool)

(assert (=> d!53321 (= c!31401 lt!86617)))

(assert (=> d!53321 (= lt!86617 (containsKey!190 (toList!1100 lt!86488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!53321 (= (contains!1163 lt!86488 #b1000000000000000000000000000000000000000000000000000000000000000) lt!86616)))

(declare-fun b!175241 () Bool)

(declare-fun lt!86614 () Unit!5351)

(assert (=> b!175241 (= e!115668 lt!86614)))

(assert (=> b!175241 (= lt!86614 (lemmaContainsKeyImpliesGetValueByKeyDefined!139 (toList!1100 lt!86488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!175241 (isDefined!140 (getValueByKey!186 (toList!1100 lt!86488) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175242 () Bool)

(declare-fun Unit!5358 () Unit!5351)

(assert (=> b!175242 (= e!115668 Unit!5358)))

(declare-fun b!175243 () Bool)

(assert (=> b!175243 (= e!115667 (isDefined!140 (getValueByKey!186 (toList!1100 lt!86488) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!53321 c!31401) b!175241))

(assert (= (and d!53321 (not c!31401)) b!175242))

(assert (= (and d!53321 (not res!83051)) b!175243))

(declare-fun m!203735 () Bool)

(assert (=> d!53321 m!203735))

(declare-fun m!203737 () Bool)

(assert (=> b!175241 m!203737))

(assert (=> b!175241 m!203543))

(assert (=> b!175241 m!203543))

(declare-fun m!203739 () Bool)

(assert (=> b!175241 m!203739))

(assert (=> b!175243 m!203543))

(assert (=> b!175243 m!203543))

(assert (=> b!175243 m!203739))

(assert (=> bm!17717 d!53321))

(declare-fun condMapEmpty!6997 () Bool)

(declare-fun mapDefault!6997 () ValueCell!1706)

(assert (=> mapNonEmpty!6996 (= condMapEmpty!6997 (= mapRest!6996 ((as const (Array (_ BitVec 32) ValueCell!1706)) mapDefault!6997)))))

(declare-fun e!115670 () Bool)

(declare-fun mapRes!6997 () Bool)

(assert (=> mapNonEmpty!6996 (= tp!15672 (and e!115670 mapRes!6997))))

(declare-fun mapIsEmpty!6997 () Bool)

(assert (=> mapIsEmpty!6997 mapRes!6997))

(declare-fun mapNonEmpty!6997 () Bool)

(declare-fun tp!15673 () Bool)

(declare-fun e!115669 () Bool)

(assert (=> mapNonEmpty!6997 (= mapRes!6997 (and tp!15673 e!115669))))

(declare-fun mapRest!6997 () (Array (_ BitVec 32) ValueCell!1706))

(declare-fun mapValue!6997 () ValueCell!1706)

(declare-fun mapKey!6997 () (_ BitVec 32))

(assert (=> mapNonEmpty!6997 (= mapRest!6996 (store mapRest!6997 mapKey!6997 mapValue!6997))))

(declare-fun b!175244 () Bool)

(assert (=> b!175244 (= e!115669 tp_is_empty!4099)))

(declare-fun b!175245 () Bool)

(assert (=> b!175245 (= e!115670 tp_is_empty!4099)))

(assert (= (and mapNonEmpty!6996 condMapEmpty!6997) mapIsEmpty!6997))

(assert (= (and mapNonEmpty!6996 (not condMapEmpty!6997)) mapNonEmpty!6997))

(assert (= (and mapNonEmpty!6997 ((_ is ValueCellFull!1706) mapValue!6997)) b!175244))

(assert (= (and mapNonEmpty!6996 ((_ is ValueCellFull!1706) mapDefault!6997)) b!175245))

(declare-fun m!203741 () Bool)

(assert (=> mapNonEmpty!6997 m!203741))

(declare-fun b_lambda!6989 () Bool)

(assert (= b_lambda!6987 (or (and b!174878 b_free!4327) b_lambda!6989)))

(declare-fun b_lambda!6991 () Bool)

(assert (= b_lambda!6985 (or (and b!174878 b_free!4327) b_lambda!6991)))

(check-sat (not d!53263) (not d!53307) (not b!175150) (not d!53261) (not b!175235) (not b!175149) (not b_lambda!6991) (not b!175168) tp_is_empty!4099 (not b!175064) (not b_next!4327) (not d!53265) (not b!175181) (not d!53321) (not d!53315) (not b!175117) (not b!175239) (not d!53289) (not d!53299) (not d!53291) (not b!175151) (not b!175111) (not d!53293) (not bm!17725) (not b!175112) (not d!53267) (not b!175217) (not d!53297) (not b_lambda!6983) (not d!53249) (not mapNonEmpty!6997) (not d!53319) (not b!175115) (not b!175234) b_and!10785 (not d!53281) (not d!53311) (not b!175063) (not b!175137) (not d!53279) (not d!53301) (not b!175050) (not b!175241) (not d!53283) (not b!175052) (not b!175139) (not b!175243) (not d!53295) (not d!53277) (not b!175144) (not b!175238) (not b!175223) (not d!53269) (not b_lambda!6989) (not d!53259) (not b!175147) (not b!175129) (not d!53255) (not b!175219) (not bm!17728) (not b!175157) (not b!175221) (not b!175136) (not b!175145) (not bm!17731) (not b!175113) (not d!53285) (not b!175078) (not bm!17722) (not d!53271) (not d!53275) (not b!175058) (not b!175240) (not b!175116) (not d!53287) (not b!175207) (not b!175118) (not b!175135) (not d!53273) (not b!175146) (not b!175110) (not b!175148) (not b!175128))
(check-sat b_and!10785 (not b_next!4327))
