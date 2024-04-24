; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22010 () Bool)

(assert start!22010)

(declare-fun b!226460 () Bool)

(declare-fun b_free!6073 () Bool)

(declare-fun b_next!6073 () Bool)

(assert (=> b!226460 (= b_free!6073 (not b_next!6073))))

(declare-fun tp!21361 () Bool)

(declare-fun b_and!12985 () Bool)

(assert (=> b!226460 (= tp!21361 b_and!12985)))

(declare-fun b!226449 () Bool)

(declare-datatypes ((Unit!6822 0))(
  ( (Unit!6823) )
))
(declare-fun e!146923 () Unit!6822)

(declare-fun Unit!6824 () Unit!6822)

(assert (=> b!226449 (= e!146923 Unit!6824)))

(declare-fun b!226450 () Bool)

(declare-fun e!146924 () Unit!6822)

(declare-fun Unit!6825 () Unit!6822)

(assert (=> b!226450 (= e!146924 Unit!6825)))

(declare-fun lt!114030 () Unit!6822)

(declare-datatypes ((V!7561 0))(
  ( (V!7562 (val!3012 Int)) )
))
(declare-datatypes ((ValueCell!2624 0))(
  ( (ValueCellFull!2624 (v!5033 V!7561)) (EmptyCell!2624) )
))
(declare-datatypes ((array!11111 0))(
  ( (array!11112 (arr!5275 (Array (_ BitVec 32) ValueCell!2624)) (size!5608 (_ BitVec 32))) )
))
(declare-datatypes ((array!11113 0))(
  ( (array!11114 (arr!5276 (Array (_ BitVec 32) (_ BitVec 64))) (size!5609 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3148 0))(
  ( (LongMapFixedSize!3149 (defaultEntry!4233 Int) (mask!10085 (_ BitVec 32)) (extraKeys!3970 (_ BitVec 32)) (zeroValue!4074 V!7561) (minValue!4074 V!7561) (_size!1623 (_ BitVec 32)) (_keys!6287 array!11113) (_values!4216 array!11111) (_vacant!1623 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3148)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!255 (array!11113 array!11111 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) Int) Unit!6822)

(assert (=> b!226450 (= lt!114030 (lemmaInListMapThenSeekEntryOrOpenFindsIt!255 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 (defaultEntry!4233 thiss!1504)))))

(assert (=> b!226450 false))

(declare-fun b!226451 () Bool)

(declare-fun e!146922 () Bool)

(assert (=> b!226451 (= e!146922 true)))

(declare-fun lt!114034 () Bool)

(declare-datatypes ((List!3287 0))(
  ( (Nil!3284) (Cons!3283 (h!3931 (_ BitVec 64)) (t!8238 List!3287)) )
))
(declare-fun arrayNoDuplicates!0 (array!11113 (_ BitVec 32) List!3287) Bool)

(assert (=> b!226451 (= lt!114034 (arrayNoDuplicates!0 (_keys!6287 thiss!1504) #b00000000000000000000000000000000 Nil!3284))))

(declare-fun b!226452 () Bool)

(declare-fun e!146925 () Bool)

(declare-fun tp_is_empty!5935 () Bool)

(assert (=> b!226452 (= e!146925 tp_is_empty!5935)))

(declare-fun b!226453 () Bool)

(declare-fun res!111477 () Bool)

(assert (=> b!226453 (=> res!111477 e!146922)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!226453 (= res!111477 (not (validKeyInArray!0 key!932)))))

(declare-fun mapIsEmpty!10072 () Bool)

(declare-fun mapRes!10072 () Bool)

(assert (=> mapIsEmpty!10072 mapRes!10072))

(declare-fun b!226454 () Bool)

(declare-fun e!146930 () Bool)

(declare-fun e!146919 () Bool)

(assert (=> b!226454 (= e!146930 (and e!146919 mapRes!10072))))

(declare-fun condMapEmpty!10072 () Bool)

(declare-fun mapDefault!10072 () ValueCell!2624)

(assert (=> b!226454 (= condMapEmpty!10072 (= (arr!5275 (_values!4216 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2624)) mapDefault!10072)))))

(declare-fun b!226455 () Bool)

(declare-fun lt!114037 () Unit!6822)

(assert (=> b!226455 (= e!146924 lt!114037)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!246 (array!11113 array!11111 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) Int) Unit!6822)

(assert (=> b!226455 (= lt!114037 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!246 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 (defaultEntry!4233 thiss!1504)))))

(declare-fun c!37547 () Bool)

(declare-datatypes ((SeekEntryResult!853 0))(
  ( (MissingZero!853 (index!5582 (_ BitVec 32))) (Found!853 (index!5583 (_ BitVec 32))) (Intermediate!853 (undefined!1665 Bool) (index!5584 (_ BitVec 32)) (x!23201 (_ BitVec 32))) (Undefined!853) (MissingVacant!853 (index!5585 (_ BitVec 32))) )
))
(declare-fun lt!114032 () SeekEntryResult!853)

(get-info :version)

(assert (=> b!226455 (= c!37547 ((_ is MissingZero!853) lt!114032))))

(declare-fun e!146929 () Bool)

(assert (=> b!226455 e!146929))

(declare-fun b!226456 () Bool)

(declare-fun res!111469 () Bool)

(declare-fun e!146927 () Bool)

(assert (=> b!226456 (=> (not res!111469) (not e!146927))))

(declare-fun call!21042 () Bool)

(assert (=> b!226456 (= res!111469 call!21042)))

(assert (=> b!226456 (= e!146929 e!146927)))

(declare-fun b!226457 () Bool)

(declare-fun e!146928 () Bool)

(declare-fun e!146926 () Bool)

(assert (=> b!226457 (= e!146928 e!146926)))

(declare-fun res!111475 () Bool)

(assert (=> b!226457 (= res!111475 call!21042)))

(assert (=> b!226457 (=> (not res!111475) (not e!146926))))

(declare-fun b!226458 () Bool)

(declare-fun res!111474 () Bool)

(assert (=> b!226458 (=> res!111474 e!146922)))

(declare-fun lt!114036 () Bool)

(assert (=> b!226458 (= res!111474 lt!114036)))

(declare-fun b!226459 () Bool)

(declare-fun res!111472 () Bool)

(assert (=> b!226459 (=> res!111472 e!146922)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11113 (_ BitVec 32)) Bool)

(assert (=> b!226459 (= res!111472 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6287 thiss!1504) (mask!10085 thiss!1504))))))

(declare-fun e!146933 () Bool)

(declare-fun array_inv!3463 (array!11113) Bool)

(declare-fun array_inv!3464 (array!11111) Bool)

(assert (=> b!226460 (= e!146933 (and tp!21361 tp_is_empty!5935 (array_inv!3463 (_keys!6287 thiss!1504)) (array_inv!3464 (_values!4216 thiss!1504)) e!146930))))

(declare-fun b!226461 () Bool)

(declare-fun call!21041 () Bool)

(assert (=> b!226461 (= e!146926 (not call!21041))))

(declare-fun b!226462 () Bool)

(assert (=> b!226462 (= e!146919 tp_is_empty!5935)))

(declare-fun b!226463 () Bool)

(declare-fun e!146931 () Bool)

(declare-fun e!146932 () Bool)

(assert (=> b!226463 (= e!146931 e!146932)))

(declare-fun res!111479 () Bool)

(assert (=> b!226463 (=> (not res!111479) (not e!146932))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!226463 (= res!111479 (or (= lt!114032 (MissingZero!853 index!297)) (= lt!114032 (MissingVacant!853 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11113 (_ BitVec 32)) SeekEntryResult!853)

(assert (=> b!226463 (= lt!114032 (seekEntryOrOpen!0 key!932 (_keys!6287 thiss!1504) (mask!10085 thiss!1504)))))

(declare-fun b!226464 () Bool)

(declare-fun res!111480 () Bool)

(assert (=> b!226464 (=> (not res!111480) (not e!146931))))

(assert (=> b!226464 (= res!111480 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!226465 () Bool)

(declare-fun e!146921 () Bool)

(assert (=> b!226465 (= e!146921 (not e!146922))))

(declare-fun res!111471 () Bool)

(assert (=> b!226465 (=> res!111471 e!146922)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!226465 (= res!111471 (not (validMask!0 (mask!10085 thiss!1504))))))

(declare-fun lt!114028 () array!11113)

(declare-fun arrayCountValidKeys!0 (array!11113 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!226465 (= (arrayCountValidKeys!0 lt!114028 #b00000000000000000000000000000000 (size!5609 (_keys!6287 thiss!1504))) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 (_keys!6287 thiss!1504) #b00000000000000000000000000000000 (size!5609 (_keys!6287 thiss!1504)))))))

(declare-fun lt!114031 () Unit!6822)

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!11113 (_ BitVec 32) (_ BitVec 64)) Unit!6822)

(assert (=> b!226465 (= lt!114031 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!6287 thiss!1504) index!297 key!932))))

(assert (=> b!226465 (arrayNoDuplicates!0 lt!114028 #b00000000000000000000000000000000 Nil!3284)))

(assert (=> b!226465 (= lt!114028 (array!11114 (store (arr!5276 (_keys!6287 thiss!1504)) index!297 key!932) (size!5609 (_keys!6287 thiss!1504))))))

(declare-fun lt!114033 () Unit!6822)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!11113 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3287) Unit!6822)

(assert (=> b!226465 (= lt!114033 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6287 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3284))))

(declare-fun lt!114035 () Unit!6822)

(assert (=> b!226465 (= lt!114035 e!146923)))

(declare-fun c!37546 () Bool)

(assert (=> b!226465 (= c!37546 lt!114036)))

(declare-fun arrayContainsKey!0 (array!11113 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!226465 (= lt!114036 (arrayContainsKey!0 (_keys!6287 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226466 () Bool)

(declare-fun res!111476 () Bool)

(assert (=> b!226466 (= res!111476 (= (select (arr!5276 (_keys!6287 thiss!1504)) (index!5585 lt!114032)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!226466 (=> (not res!111476) (not e!146926))))

(declare-fun b!226467 () Bool)

(declare-fun res!111478 () Bool)

(assert (=> b!226467 (=> res!111478 e!146922)))

(assert (=> b!226467 (= res!111478 (or (not (= (size!5609 (_keys!6287 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10085 thiss!1504)))) (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!5609 (_keys!6287 thiss!1504)))))))

(declare-fun res!111473 () Bool)

(assert (=> start!22010 (=> (not res!111473) (not e!146931))))

(declare-fun valid!1270 (LongMapFixedSize!3148) Bool)

(assert (=> start!22010 (= res!111473 (valid!1270 thiss!1504))))

(assert (=> start!22010 e!146931))

(assert (=> start!22010 e!146933))

(assert (=> start!22010 true))

(declare-fun b!226468 () Bool)

(declare-fun Unit!6826 () Unit!6822)

(assert (=> b!226468 (= e!146923 Unit!6826)))

(declare-fun lt!114027 () Unit!6822)

(declare-fun lemmaArrayContainsKeyThenInListMap!95 (array!11113 array!11111 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 64) (_ BitVec 32) Int) Unit!6822)

(assert (=> b!226468 (= lt!114027 (lemmaArrayContainsKeyThenInListMap!95 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4233 thiss!1504)))))

(assert (=> b!226468 false))

(declare-fun bm!21038 () Bool)

(assert (=> bm!21038 (= call!21041 (arrayContainsKey!0 (_keys!6287 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!226469 () Bool)

(assert (=> b!226469 (= e!146928 ((_ is Undefined!853) lt!114032))))

(declare-fun b!226470 () Bool)

(declare-fun res!111481 () Bool)

(assert (=> b!226470 (=> (not res!111481) (not e!146927))))

(assert (=> b!226470 (= res!111481 (= (select (arr!5276 (_keys!6287 thiss!1504)) (index!5582 lt!114032)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!226471 () Bool)

(assert (=> b!226471 (= e!146927 (not call!21041))))

(declare-fun b!226472 () Bool)

(declare-fun c!37548 () Bool)

(assert (=> b!226472 (= c!37548 ((_ is MissingVacant!853) lt!114032))))

(assert (=> b!226472 (= e!146929 e!146928)))

(declare-fun mapNonEmpty!10072 () Bool)

(declare-fun tp!21360 () Bool)

(assert (=> mapNonEmpty!10072 (= mapRes!10072 (and tp!21360 e!146925))))

(declare-fun mapValue!10072 () ValueCell!2624)

(declare-fun mapKey!10072 () (_ BitVec 32))

(declare-fun mapRest!10072 () (Array (_ BitVec 32) ValueCell!2624))

(assert (=> mapNonEmpty!10072 (= (arr!5275 (_values!4216 thiss!1504)) (store mapRest!10072 mapKey!10072 mapValue!10072))))

(declare-fun bm!21039 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!21039 (= call!21042 (inRange!0 (ite c!37547 (index!5582 lt!114032) (index!5585 lt!114032)) (mask!10085 thiss!1504)))))

(declare-fun b!226473 () Bool)

(assert (=> b!226473 (= e!146932 e!146921)))

(declare-fun res!111470 () Bool)

(assert (=> b!226473 (=> (not res!111470) (not e!146921))))

(assert (=> b!226473 (= res!111470 (inRange!0 index!297 (mask!10085 thiss!1504)))))

(declare-fun lt!114029 () Unit!6822)

(assert (=> b!226473 (= lt!114029 e!146924)))

(declare-fun c!37549 () Bool)

(declare-datatypes ((tuple2!4378 0))(
  ( (tuple2!4379 (_1!2200 (_ BitVec 64)) (_2!2200 V!7561)) )
))
(declare-datatypes ((List!3288 0))(
  ( (Nil!3285) (Cons!3284 (h!3932 tuple2!4378) (t!8239 List!3288)) )
))
(declare-datatypes ((ListLongMap!3293 0))(
  ( (ListLongMap!3294 (toList!1662 List!3288)) )
))
(declare-fun contains!1551 (ListLongMap!3293 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1194 (array!11113 array!11111 (_ BitVec 32) (_ BitVec 32) V!7561 V!7561 (_ BitVec 32) Int) ListLongMap!3293)

(assert (=> b!226473 (= c!37549 (contains!1551 (getCurrentListMap!1194 (_keys!6287 thiss!1504) (_values!4216 thiss!1504) (mask!10085 thiss!1504) (extraKeys!3970 thiss!1504) (zeroValue!4074 thiss!1504) (minValue!4074 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4233 thiss!1504)) key!932))))

(assert (= (and start!22010 res!111473) b!226464))

(assert (= (and b!226464 res!111480) b!226463))

(assert (= (and b!226463 res!111479) b!226473))

(assert (= (and b!226473 c!37549) b!226450))

(assert (= (and b!226473 (not c!37549)) b!226455))

(assert (= (and b!226455 c!37547) b!226456))

(assert (= (and b!226455 (not c!37547)) b!226472))

(assert (= (and b!226456 res!111469) b!226470))

(assert (= (and b!226470 res!111481) b!226471))

(assert (= (and b!226472 c!37548) b!226457))

(assert (= (and b!226472 (not c!37548)) b!226469))

(assert (= (and b!226457 res!111475) b!226466))

(assert (= (and b!226466 res!111476) b!226461))

(assert (= (or b!226456 b!226457) bm!21039))

(assert (= (or b!226471 b!226461) bm!21038))

(assert (= (and b!226473 res!111470) b!226465))

(assert (= (and b!226465 c!37546) b!226468))

(assert (= (and b!226465 (not c!37546)) b!226449))

(assert (= (and b!226465 (not res!111471)) b!226467))

(assert (= (and b!226467 (not res!111478)) b!226453))

(assert (= (and b!226453 (not res!111477)) b!226458))

(assert (= (and b!226458 (not res!111474)) b!226459))

(assert (= (and b!226459 (not res!111472)) b!226451))

(assert (= (and b!226454 condMapEmpty!10072) mapIsEmpty!10072))

(assert (= (and b!226454 (not condMapEmpty!10072)) mapNonEmpty!10072))

(assert (= (and mapNonEmpty!10072 ((_ is ValueCellFull!2624) mapValue!10072)) b!226452))

(assert (= (and b!226454 ((_ is ValueCellFull!2624) mapDefault!10072)) b!226462))

(assert (= b!226460 b!226454))

(assert (= start!22010 b!226460))

(declare-fun m!248881 () Bool)

(assert (=> mapNonEmpty!10072 m!248881))

(declare-fun m!248883 () Bool)

(assert (=> b!226460 m!248883))

(declare-fun m!248885 () Bool)

(assert (=> b!226460 m!248885))

(declare-fun m!248887 () Bool)

(assert (=> b!226463 m!248887))

(declare-fun m!248889 () Bool)

(assert (=> b!226450 m!248889))

(declare-fun m!248891 () Bool)

(assert (=> start!22010 m!248891))

(declare-fun m!248893 () Bool)

(assert (=> b!226473 m!248893))

(declare-fun m!248895 () Bool)

(assert (=> b!226473 m!248895))

(assert (=> b!226473 m!248895))

(declare-fun m!248897 () Bool)

(assert (=> b!226473 m!248897))

(declare-fun m!248899 () Bool)

(assert (=> b!226451 m!248899))

(declare-fun m!248901 () Bool)

(assert (=> b!226455 m!248901))

(declare-fun m!248903 () Bool)

(assert (=> b!226470 m!248903))

(declare-fun m!248905 () Bool)

(assert (=> b!226459 m!248905))

(declare-fun m!248907 () Bool)

(assert (=> b!226466 m!248907))

(declare-fun m!248909 () Bool)

(assert (=> b!226453 m!248909))

(declare-fun m!248911 () Bool)

(assert (=> bm!21039 m!248911))

(declare-fun m!248913 () Bool)

(assert (=> b!226465 m!248913))

(declare-fun m!248915 () Bool)

(assert (=> b!226465 m!248915))

(declare-fun m!248917 () Bool)

(assert (=> b!226465 m!248917))

(declare-fun m!248919 () Bool)

(assert (=> b!226465 m!248919))

(declare-fun m!248921 () Bool)

(assert (=> b!226465 m!248921))

(declare-fun m!248923 () Bool)

(assert (=> b!226465 m!248923))

(declare-fun m!248925 () Bool)

(assert (=> b!226465 m!248925))

(declare-fun m!248927 () Bool)

(assert (=> b!226465 m!248927))

(declare-fun m!248929 () Bool)

(assert (=> b!226468 m!248929))

(assert (=> bm!21038 m!248927))

(check-sat (not b!226465) (not b!226459) (not b!226451) (not b!226455) (not b!226463) (not b!226473) (not b!226453) (not b_next!6073) b_and!12985 (not b!226460) (not b!226450) (not bm!21039) (not mapNonEmpty!10072) tp_is_empty!5935 (not bm!21038) (not start!22010) (not b!226468))
(check-sat b_and!12985 (not b_next!6073))
