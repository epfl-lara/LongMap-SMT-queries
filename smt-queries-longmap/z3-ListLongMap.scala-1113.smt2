; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22928 () Bool)

(assert start!22928)

(declare-fun b!239237 () Bool)

(declare-fun b_free!6427 () Bool)

(declare-fun b_next!6427 () Bool)

(assert (=> b!239237 (= b_free!6427 (not b_next!6427))))

(declare-fun tp!22485 () Bool)

(declare-fun b_and!13407 () Bool)

(assert (=> b!239237 (= tp!22485 b_and!13407)))

(declare-fun b!239227 () Bool)

(declare-fun e!155321 () Bool)

(declare-fun tp_is_empty!6289 () Bool)

(assert (=> b!239227 (= e!155321 tp_is_empty!6289)))

(declare-fun b!239228 () Bool)

(declare-fun res!117240 () Bool)

(declare-fun e!155319 () Bool)

(assert (=> b!239228 (=> (not res!117240) (not e!155319))))

(declare-fun call!22230 () Bool)

(assert (=> b!239228 (= res!117240 call!22230)))

(declare-fun e!155327 () Bool)

(assert (=> b!239228 (= e!155327 e!155319)))

(declare-fun b!239229 () Bool)

(declare-fun e!155322 () Bool)

(declare-fun e!155318 () Bool)

(assert (=> b!239229 (= e!155322 e!155318)))

(declare-fun res!117243 () Bool)

(assert (=> b!239229 (= res!117243 call!22230)))

(assert (=> b!239229 (=> (not res!117243) (not e!155318))))

(declare-datatypes ((SeekEntryResult!998 0))(
  ( (MissingZero!998 (index!6162 (_ BitVec 32))) (Found!998 (index!6163 (_ BitVec 32))) (Intermediate!998 (undefined!1810 Bool) (index!6164 (_ BitVec 32)) (x!24062 (_ BitVec 32))) (Undefined!998) (MissingVacant!998 (index!6165 (_ BitVec 32))) )
))
(declare-fun lt!120798 () SeekEntryResult!998)

(declare-fun c!39886 () Bool)

(declare-datatypes ((V!8033 0))(
  ( (V!8034 (val!3189 Int)) )
))
(declare-datatypes ((ValueCell!2801 0))(
  ( (ValueCellFull!2801 (v!5228 V!8033)) (EmptyCell!2801) )
))
(declare-datatypes ((array!11855 0))(
  ( (array!11856 (arr!5629 (Array (_ BitVec 32) ValueCell!2801)) (size!5970 (_ BitVec 32))) )
))
(declare-datatypes ((array!11857 0))(
  ( (array!11858 (arr!5630 (Array (_ BitVec 32) (_ BitVec 64))) (size!5971 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3502 0))(
  ( (LongMapFixedSize!3503 (defaultEntry!4436 Int) (mask!10480 (_ BitVec 32)) (extraKeys!4173 (_ BitVec 32)) (zeroValue!4277 V!8033) (minValue!4277 V!8033) (_size!1800 (_ BitVec 32)) (_keys!6538 array!11857) (_values!4419 array!11855) (_vacant!1800 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3502)

(declare-fun bm!22226 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22226 (= call!22230 (inRange!0 (ite c!39886 (index!6162 lt!120798) (index!6165 lt!120798)) (mask!10480 thiss!1504)))))

(declare-fun b!239230 () Bool)

(declare-fun call!22229 () Bool)

(assert (=> b!239230 (= e!155319 (not call!22229))))

(declare-fun b!239231 () Bool)

(declare-fun e!155316 () Bool)

(assert (=> b!239231 (= e!155316 (and (= (size!5970 (_values!4419 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10480 thiss!1504))) (= (size!5971 (_keys!6538 thiss!1504)) (size!5970 (_values!4419 thiss!1504))) (bvslt (mask!10480 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!239233 () Bool)

(declare-fun e!155323 () Bool)

(assert (=> b!239233 (= e!155323 e!155316)))

(declare-fun res!117244 () Bool)

(assert (=> b!239233 (=> (not res!117244) (not e!155316))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!239233 (= res!117244 (inRange!0 index!297 (mask!10480 thiss!1504)))))

(declare-datatypes ((Unit!7330 0))(
  ( (Unit!7331) )
))
(declare-fun lt!120799 () Unit!7330)

(declare-fun e!155328 () Unit!7330)

(assert (=> b!239233 (= lt!120799 e!155328)))

(declare-fun c!39887 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4628 0))(
  ( (tuple2!4629 (_1!2325 (_ BitVec 64)) (_2!2325 V!8033)) )
))
(declare-datatypes ((List!3511 0))(
  ( (Nil!3508) (Cons!3507 (h!4163 tuple2!4628) (t!8498 List!3511)) )
))
(declare-datatypes ((ListLongMap!3543 0))(
  ( (ListLongMap!3544 (toList!1787 List!3511)) )
))
(declare-fun contains!1689 (ListLongMap!3543 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1319 (array!11857 array!11855 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 32) Int) ListLongMap!3543)

(assert (=> b!239233 (= c!39887 (contains!1689 (getCurrentListMap!1319 (_keys!6538 thiss!1504) (_values!4419 thiss!1504) (mask!10480 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4436 thiss!1504)) key!932))))

(declare-fun mapNonEmpty!10665 () Bool)

(declare-fun mapRes!10665 () Bool)

(declare-fun tp!22484 () Bool)

(declare-fun e!155320 () Bool)

(assert (=> mapNonEmpty!10665 (= mapRes!10665 (and tp!22484 e!155320))))

(declare-fun mapValue!10665 () ValueCell!2801)

(declare-fun mapKey!10665 () (_ BitVec 32))

(declare-fun mapRest!10665 () (Array (_ BitVec 32) ValueCell!2801))

(assert (=> mapNonEmpty!10665 (= (arr!5629 (_values!4419 thiss!1504)) (store mapRest!10665 mapKey!10665 mapValue!10665))))

(declare-fun b!239234 () Bool)

(get-info :version)

(assert (=> b!239234 (= e!155322 ((_ is Undefined!998) lt!120798))))

(declare-fun bm!22227 () Bool)

(declare-fun arrayContainsKey!0 (array!11857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22227 (= call!22229 (arrayContainsKey!0 (_keys!6538 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239235 () Bool)

(declare-fun Unit!7332 () Unit!7330)

(assert (=> b!239235 (= e!155328 Unit!7332)))

(declare-fun lt!120797 () Unit!7330)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!330 (array!11857 array!11855 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 64) Int) Unit!7330)

(assert (=> b!239235 (= lt!120797 (lemmaInListMapThenSeekEntryOrOpenFindsIt!330 (_keys!6538 thiss!1504) (_values!4419 thiss!1504) (mask!10480 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) key!932 (defaultEntry!4436 thiss!1504)))))

(assert (=> b!239235 false))

(declare-fun b!239236 () Bool)

(declare-fun res!117248 () Bool)

(assert (=> b!239236 (=> (not res!117248) (not e!155319))))

(assert (=> b!239236 (= res!117248 (= (select (arr!5630 (_keys!6538 thiss!1504)) (index!6162 lt!120798)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!155326 () Bool)

(declare-fun e!155325 () Bool)

(declare-fun array_inv!3701 (array!11857) Bool)

(declare-fun array_inv!3702 (array!11855) Bool)

(assert (=> b!239237 (= e!155326 (and tp!22485 tp_is_empty!6289 (array_inv!3701 (_keys!6538 thiss!1504)) (array_inv!3702 (_values!4419 thiss!1504)) e!155325))))

(declare-fun b!239238 () Bool)

(assert (=> b!239238 (= e!155320 tp_is_empty!6289)))

(declare-fun b!239239 () Bool)

(declare-fun res!117241 () Bool)

(declare-fun e!155317 () Bool)

(assert (=> b!239239 (=> (not res!117241) (not e!155317))))

(assert (=> b!239239 (= res!117241 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!239232 () Bool)

(declare-fun res!117246 () Bool)

(assert (=> b!239232 (=> (not res!117246) (not e!155316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!239232 (= res!117246 (validMask!0 (mask!10480 thiss!1504)))))

(declare-fun res!117247 () Bool)

(assert (=> start!22928 (=> (not res!117247) (not e!155317))))

(declare-fun valid!1394 (LongMapFixedSize!3502) Bool)

(assert (=> start!22928 (= res!117247 (valid!1394 thiss!1504))))

(assert (=> start!22928 e!155317))

(assert (=> start!22928 e!155326))

(assert (=> start!22928 true))

(declare-fun b!239240 () Bool)

(declare-fun res!117242 () Bool)

(assert (=> b!239240 (=> (not res!117242) (not e!155316))))

(assert (=> b!239240 (= res!117242 (arrayContainsKey!0 (_keys!6538 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!239241 () Bool)

(assert (=> b!239241 (= e!155317 e!155323)))

(declare-fun res!117245 () Bool)

(assert (=> b!239241 (=> (not res!117245) (not e!155323))))

(assert (=> b!239241 (= res!117245 (or (= lt!120798 (MissingZero!998 index!297)) (= lt!120798 (MissingVacant!998 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11857 (_ BitVec 32)) SeekEntryResult!998)

(assert (=> b!239241 (= lt!120798 (seekEntryOrOpen!0 key!932 (_keys!6538 thiss!1504) (mask!10480 thiss!1504)))))

(declare-fun mapIsEmpty!10665 () Bool)

(assert (=> mapIsEmpty!10665 mapRes!10665))

(declare-fun b!239242 () Bool)

(assert (=> b!239242 (= e!155318 (not call!22229))))

(declare-fun b!239243 () Bool)

(declare-fun lt!120800 () Unit!7330)

(assert (=> b!239243 (= e!155328 lt!120800)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!322 (array!11857 array!11855 (_ BitVec 32) (_ BitVec 32) V!8033 V!8033 (_ BitVec 64) Int) Unit!7330)

(assert (=> b!239243 (= lt!120800 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!322 (_keys!6538 thiss!1504) (_values!4419 thiss!1504) (mask!10480 thiss!1504) (extraKeys!4173 thiss!1504) (zeroValue!4277 thiss!1504) (minValue!4277 thiss!1504) key!932 (defaultEntry!4436 thiss!1504)))))

(assert (=> b!239243 (= c!39886 ((_ is MissingZero!998) lt!120798))))

(assert (=> b!239243 e!155327))

(declare-fun b!239244 () Bool)

(declare-fun c!39888 () Bool)

(assert (=> b!239244 (= c!39888 ((_ is MissingVacant!998) lt!120798))))

(assert (=> b!239244 (= e!155327 e!155322)))

(declare-fun b!239245 () Bool)

(assert (=> b!239245 (= e!155325 (and e!155321 mapRes!10665))))

(declare-fun condMapEmpty!10665 () Bool)

(declare-fun mapDefault!10665 () ValueCell!2801)

(assert (=> b!239245 (= condMapEmpty!10665 (= (arr!5629 (_values!4419 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2801)) mapDefault!10665)))))

(declare-fun b!239246 () Bool)

(declare-fun res!117239 () Bool)

(assert (=> b!239246 (= res!117239 (= (select (arr!5630 (_keys!6538 thiss!1504)) (index!6165 lt!120798)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!239246 (=> (not res!117239) (not e!155318))))

(assert (= (and start!22928 res!117247) b!239239))

(assert (= (and b!239239 res!117241) b!239241))

(assert (= (and b!239241 res!117245) b!239233))

(assert (= (and b!239233 c!39887) b!239235))

(assert (= (and b!239233 (not c!39887)) b!239243))

(assert (= (and b!239243 c!39886) b!239228))

(assert (= (and b!239243 (not c!39886)) b!239244))

(assert (= (and b!239228 res!117240) b!239236))

(assert (= (and b!239236 res!117248) b!239230))

(assert (= (and b!239244 c!39888) b!239229))

(assert (= (and b!239244 (not c!39888)) b!239234))

(assert (= (and b!239229 res!117243) b!239246))

(assert (= (and b!239246 res!117239) b!239242))

(assert (= (or b!239228 b!239229) bm!22226))

(assert (= (or b!239230 b!239242) bm!22227))

(assert (= (and b!239233 res!117244) b!239240))

(assert (= (and b!239240 res!117242) b!239232))

(assert (= (and b!239232 res!117246) b!239231))

(assert (= (and b!239245 condMapEmpty!10665) mapIsEmpty!10665))

(assert (= (and b!239245 (not condMapEmpty!10665)) mapNonEmpty!10665))

(assert (= (and mapNonEmpty!10665 ((_ is ValueCellFull!2801) mapValue!10665)) b!239238))

(assert (= (and b!239245 ((_ is ValueCellFull!2801) mapDefault!10665)) b!239227))

(assert (= b!239237 b!239245))

(assert (= start!22928 b!239237))

(declare-fun m!259561 () Bool)

(assert (=> bm!22226 m!259561))

(declare-fun m!259563 () Bool)

(assert (=> b!239237 m!259563))

(declare-fun m!259565 () Bool)

(assert (=> b!239237 m!259565))

(declare-fun m!259567 () Bool)

(assert (=> b!239243 m!259567))

(declare-fun m!259569 () Bool)

(assert (=> b!239241 m!259569))

(declare-fun m!259571 () Bool)

(assert (=> bm!22227 m!259571))

(declare-fun m!259573 () Bool)

(assert (=> b!239235 m!259573))

(declare-fun m!259575 () Bool)

(assert (=> b!239246 m!259575))

(assert (=> b!239240 m!259571))

(declare-fun m!259577 () Bool)

(assert (=> start!22928 m!259577))

(declare-fun m!259579 () Bool)

(assert (=> b!239236 m!259579))

(declare-fun m!259581 () Bool)

(assert (=> b!239232 m!259581))

(declare-fun m!259583 () Bool)

(assert (=> b!239233 m!259583))

(declare-fun m!259585 () Bool)

(assert (=> b!239233 m!259585))

(assert (=> b!239233 m!259585))

(declare-fun m!259587 () Bool)

(assert (=> b!239233 m!259587))

(declare-fun m!259589 () Bool)

(assert (=> mapNonEmpty!10665 m!259589))

(check-sat (not bm!22226) (not b!239243) (not b!239232) b_and!13407 (not b!239235) (not b!239237) (not b_next!6427) tp_is_empty!6289 (not b!239241) (not b!239240) (not start!22928) (not mapNonEmpty!10665) (not b!239233) (not bm!22227))
(check-sat b_and!13407 (not b_next!6427))
