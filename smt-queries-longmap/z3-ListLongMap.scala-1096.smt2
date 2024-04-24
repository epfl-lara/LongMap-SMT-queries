; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22506 () Bool)

(assert start!22506)

(declare-fun b!235312 () Bool)

(declare-fun b_free!6325 () Bool)

(declare-fun b_next!6325 () Bool)

(assert (=> b!235312 (= b_free!6325 (not b_next!6325))))

(declare-fun tp!22141 () Bool)

(declare-fun b_and!13267 () Bool)

(assert (=> b!235312 (= tp!22141 b_and!13267)))

(declare-fun res!115383 () Bool)

(declare-fun e!152815 () Bool)

(assert (=> start!22506 (=> (not res!115383) (not e!152815))))

(declare-datatypes ((V!7897 0))(
  ( (V!7898 (val!3138 Int)) )
))
(declare-datatypes ((ValueCell!2750 0))(
  ( (ValueCellFull!2750 (v!5166 V!7897)) (EmptyCell!2750) )
))
(declare-datatypes ((array!11629 0))(
  ( (array!11630 (arr!5527 (Array (_ BitVec 32) ValueCell!2750)) (size!5864 (_ BitVec 32))) )
))
(declare-datatypes ((array!11631 0))(
  ( (array!11632 (arr!5528 (Array (_ BitVec 32) (_ BitVec 64))) (size!5865 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3400 0))(
  ( (LongMapFixedSize!3401 (defaultEntry!4370 Int) (mask!10337 (_ BitVec 32)) (extraKeys!4107 (_ BitVec 32)) (zeroValue!4211 V!7897) (minValue!4211 V!7897) (_size!1749 (_ BitVec 32)) (_keys!6444 array!11631) (_values!4353 array!11629) (_vacant!1749 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3400)

(declare-fun valid!1356 (LongMapFixedSize!3400) Bool)

(assert (=> start!22506 (= res!115383 (valid!1356 thiss!1504))))

(assert (=> start!22506 e!152815))

(declare-fun e!152818 () Bool)

(assert (=> start!22506 e!152818))

(assert (=> start!22506 true))

(declare-fun b!235306 () Bool)

(declare-fun e!152813 () Bool)

(declare-fun e!152814 () Bool)

(declare-fun mapRes!10475 () Bool)

(assert (=> b!235306 (= e!152813 (and e!152814 mapRes!10475))))

(declare-fun condMapEmpty!10475 () Bool)

(declare-fun mapDefault!10475 () ValueCell!2750)

(assert (=> b!235306 (= condMapEmpty!10475 (= (arr!5527 (_values!4353 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2750)) mapDefault!10475)))))

(declare-fun b!235307 () Bool)

(declare-fun e!152817 () Bool)

(declare-fun tp_is_empty!6187 () Bool)

(assert (=> b!235307 (= e!152817 tp_is_empty!6187)))

(declare-fun b!235308 () Bool)

(declare-fun res!115386 () Bool)

(declare-fun e!152816 () Bool)

(assert (=> b!235308 (=> (not res!115386) (not e!152816))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4558 0))(
  ( (tuple2!4559 (_1!2290 (_ BitVec 64)) (_2!2290 V!7897)) )
))
(declare-datatypes ((List!3457 0))(
  ( (Nil!3454) (Cons!3453 (h!4105 tuple2!4558) (t!8422 List!3457)) )
))
(declare-datatypes ((ListLongMap!3473 0))(
  ( (ListLongMap!3474 (toList!1752 List!3457)) )
))
(declare-fun contains!1642 (ListLongMap!3473 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1284 (array!11631 array!11629 (_ BitVec 32) (_ BitVec 32) V!7897 V!7897 (_ BitVec 32) Int) ListLongMap!3473)

(assert (=> b!235308 (= res!115386 (contains!1642 (getCurrentListMap!1284 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)) key!932))))

(declare-fun b!235309 () Bool)

(declare-fun res!115384 () Bool)

(assert (=> b!235309 (=> (not res!115384) (not e!152815))))

(assert (=> b!235309 (= res!115384 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10475 () Bool)

(assert (=> mapIsEmpty!10475 mapRes!10475))

(declare-fun b!235310 () Bool)

(assert (=> b!235310 (= e!152815 e!152816)))

(declare-fun res!115385 () Bool)

(assert (=> b!235310 (=> (not res!115385) (not e!152816))))

(declare-datatypes ((SeekEntryResult!959 0))(
  ( (MissingZero!959 (index!6006 (_ BitVec 32))) (Found!959 (index!6007 (_ BitVec 32))) (Intermediate!959 (undefined!1771 Bool) (index!6008 (_ BitVec 32)) (x!23745 (_ BitVec 32))) (Undefined!959) (MissingVacant!959 (index!6009 (_ BitVec 32))) )
))
(declare-fun lt!119088 () SeekEntryResult!959)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!235310 (= res!115385 (or (= lt!119088 (MissingZero!959 index!297)) (= lt!119088 (MissingVacant!959 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11631 (_ BitVec 32)) SeekEntryResult!959)

(assert (=> b!235310 (= lt!119088 (seekEntryOrOpen!0 key!932 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(declare-fun b!235311 () Bool)

(declare-fun res!115381 () Bool)

(assert (=> b!235311 (=> (not res!115381) (not e!152816))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!235311 (= res!115381 (validMask!0 (mask!10337 thiss!1504)))))

(declare-fun mapNonEmpty!10475 () Bool)

(declare-fun tp!22142 () Bool)

(assert (=> mapNonEmpty!10475 (= mapRes!10475 (and tp!22142 e!152817))))

(declare-fun mapKey!10475 () (_ BitVec 32))

(declare-fun mapRest!10475 () (Array (_ BitVec 32) ValueCell!2750))

(declare-fun mapValue!10475 () ValueCell!2750)

(assert (=> mapNonEmpty!10475 (= (arr!5527 (_values!4353 thiss!1504)) (store mapRest!10475 mapKey!10475 mapValue!10475))))

(declare-fun array_inv!3629 (array!11631) Bool)

(declare-fun array_inv!3630 (array!11629) Bool)

(assert (=> b!235312 (= e!152818 (and tp!22141 tp_is_empty!6187 (array_inv!3629 (_keys!6444 thiss!1504)) (array_inv!3630 (_values!4353 thiss!1504)) e!152813))))

(declare-fun b!235313 () Bool)

(declare-datatypes ((List!3458 0))(
  ( (Nil!3455) (Cons!3454 (h!4106 (_ BitVec 64)) (t!8423 List!3458)) )
))
(declare-fun arrayNoDuplicates!0 (array!11631 (_ BitVec 32) List!3458) Bool)

(assert (=> b!235313 (= e!152816 (not (arrayNoDuplicates!0 (_keys!6444 thiss!1504) #b00000000000000000000000000000000 Nil!3455)))))

(declare-fun b!235314 () Bool)

(declare-fun res!115380 () Bool)

(assert (=> b!235314 (=> (not res!115380) (not e!152816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11631 (_ BitVec 32)) Bool)

(assert (=> b!235314 (= res!115380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(declare-fun b!235315 () Bool)

(assert (=> b!235315 (= e!152814 tp_is_empty!6187)))

(declare-fun b!235316 () Bool)

(declare-fun res!115382 () Bool)

(assert (=> b!235316 (=> (not res!115382) (not e!152816))))

(assert (=> b!235316 (= res!115382 (and (= (size!5864 (_values!4353 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10337 thiss!1504))) (= (size!5865 (_keys!6444 thiss!1504)) (size!5864 (_values!4353 thiss!1504))) (bvsge (mask!10337 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4107 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4107 thiss!1504) #b00000000000000000000000000000011)))))

(assert (= (and start!22506 res!115383) b!235309))

(assert (= (and b!235309 res!115384) b!235310))

(assert (= (and b!235310 res!115385) b!235308))

(assert (= (and b!235308 res!115386) b!235311))

(assert (= (and b!235311 res!115381) b!235316))

(assert (= (and b!235316 res!115382) b!235314))

(assert (= (and b!235314 res!115380) b!235313))

(assert (= (and b!235306 condMapEmpty!10475) mapIsEmpty!10475))

(assert (= (and b!235306 (not condMapEmpty!10475)) mapNonEmpty!10475))

(get-info :version)

(assert (= (and mapNonEmpty!10475 ((_ is ValueCellFull!2750) mapValue!10475)) b!235307))

(assert (= (and b!235306 ((_ is ValueCellFull!2750) mapDefault!10475)) b!235315))

(assert (= b!235312 b!235306))

(assert (= start!22506 b!235312))

(declare-fun m!256617 () Bool)

(assert (=> b!235308 m!256617))

(assert (=> b!235308 m!256617))

(declare-fun m!256619 () Bool)

(assert (=> b!235308 m!256619))

(declare-fun m!256621 () Bool)

(assert (=> mapNonEmpty!10475 m!256621))

(declare-fun m!256623 () Bool)

(assert (=> start!22506 m!256623))

(declare-fun m!256625 () Bool)

(assert (=> b!235314 m!256625))

(declare-fun m!256627 () Bool)

(assert (=> b!235310 m!256627))

(declare-fun m!256629 () Bool)

(assert (=> b!235311 m!256629))

(declare-fun m!256631 () Bool)

(assert (=> b!235312 m!256631))

(declare-fun m!256633 () Bool)

(assert (=> b!235312 m!256633))

(declare-fun m!256635 () Bool)

(assert (=> b!235313 m!256635))

(check-sat (not b!235311) (not b!235314) (not b!235312) (not mapNonEmpty!10475) (not start!22506) (not b_next!6325) (not b!235310) b_and!13267 tp_is_empty!6187 (not b!235308) (not b!235313))
(check-sat b_and!13267 (not b_next!6325))
(get-model)

(declare-fun d!59347 () Bool)

(declare-fun e!152866 () Bool)

(assert (=> d!59347 e!152866))

(declare-fun res!115431 () Bool)

(assert (=> d!59347 (=> res!115431 e!152866)))

(declare-fun lt!119106 () Bool)

(assert (=> d!59347 (= res!115431 (not lt!119106))))

(declare-fun lt!119105 () Bool)

(assert (=> d!59347 (= lt!119106 lt!119105)))

(declare-datatypes ((Unit!7243 0))(
  ( (Unit!7244) )
))
(declare-fun lt!119103 () Unit!7243)

(declare-fun e!152865 () Unit!7243)

(assert (=> d!59347 (= lt!119103 e!152865)))

(declare-fun c!39224 () Bool)

(assert (=> d!59347 (= c!39224 lt!119105)))

(declare-fun containsKey!260 (List!3457 (_ BitVec 64)) Bool)

(assert (=> d!59347 (= lt!119105 (containsKey!260 (toList!1752 (getCurrentListMap!1284 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932))))

(assert (=> d!59347 (= (contains!1642 (getCurrentListMap!1284 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)) key!932) lt!119106)))

(declare-fun b!235389 () Bool)

(declare-fun lt!119104 () Unit!7243)

(assert (=> b!235389 (= e!152865 lt!119104)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!208 (List!3457 (_ BitVec 64)) Unit!7243)

(assert (=> b!235389 (= lt!119104 (lemmaContainsKeyImpliesGetValueByKeyDefined!208 (toList!1752 (getCurrentListMap!1284 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932))))

(declare-datatypes ((Option!275 0))(
  ( (Some!274 (v!5169 V!7897)) (None!273) )
))
(declare-fun isDefined!209 (Option!275) Bool)

(declare-fun getValueByKey!269 (List!3457 (_ BitVec 64)) Option!275)

(assert (=> b!235389 (isDefined!209 (getValueByKey!269 (toList!1752 (getCurrentListMap!1284 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932))))

(declare-fun b!235390 () Bool)

(declare-fun Unit!7245 () Unit!7243)

(assert (=> b!235390 (= e!152865 Unit!7245)))

(declare-fun b!235391 () Bool)

(assert (=> b!235391 (= e!152866 (isDefined!209 (getValueByKey!269 (toList!1752 (getCurrentListMap!1284 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504))) key!932)))))

(assert (= (and d!59347 c!39224) b!235389))

(assert (= (and d!59347 (not c!39224)) b!235390))

(assert (= (and d!59347 (not res!115431)) b!235391))

(declare-fun m!256677 () Bool)

(assert (=> d!59347 m!256677))

(declare-fun m!256679 () Bool)

(assert (=> b!235389 m!256679))

(declare-fun m!256681 () Bool)

(assert (=> b!235389 m!256681))

(assert (=> b!235389 m!256681))

(declare-fun m!256683 () Bool)

(assert (=> b!235389 m!256683))

(assert (=> b!235391 m!256681))

(assert (=> b!235391 m!256681))

(assert (=> b!235391 m!256683))

(assert (=> b!235308 d!59347))

(declare-fun b!235434 () Bool)

(declare-fun c!39242 () Bool)

(assert (=> b!235434 (= c!39242 (and (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!152893 () ListLongMap!3473)

(declare-fun e!152897 () ListLongMap!3473)

(assert (=> b!235434 (= e!152893 e!152897)))

(declare-fun bm!21877 () Bool)

(declare-fun call!21883 () Bool)

(declare-fun lt!119151 () ListLongMap!3473)

(assert (=> bm!21877 (= call!21883 (contains!1642 lt!119151 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235435 () Bool)

(declare-fun e!152898 () ListLongMap!3473)

(assert (=> b!235435 (= e!152898 e!152893)))

(declare-fun c!39239 () Bool)

(assert (=> b!235435 (= c!39239 (and (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!235436 () Bool)

(declare-fun e!152902 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!235436 (= e!152902 (validKeyInArray!0 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235437 () Bool)

(declare-fun e!152895 () Unit!7243)

(declare-fun Unit!7246 () Unit!7243)

(assert (=> b!235437 (= e!152895 Unit!7246)))

(declare-fun bm!21878 () Bool)

(declare-fun call!21880 () Bool)

(assert (=> bm!21878 (= call!21880 (contains!1642 lt!119151 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235438 () Bool)

(declare-fun lt!119167 () Unit!7243)

(assert (=> b!235438 (= e!152895 lt!119167)))

(declare-fun lt!119171 () ListLongMap!3473)

(declare-fun getCurrentListMapNoExtraKeys!526 (array!11631 array!11629 (_ BitVec 32) (_ BitVec 32) V!7897 V!7897 (_ BitVec 32) Int) ListLongMap!3473)

(assert (=> b!235438 (= lt!119171 (getCurrentListMapNoExtraKeys!526 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!119155 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119155 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119172 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119172 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119169 () Unit!7243)

(declare-fun addStillContains!186 (ListLongMap!3473 (_ BitVec 64) V!7897 (_ BitVec 64)) Unit!7243)

(assert (=> b!235438 (= lt!119169 (addStillContains!186 lt!119171 lt!119155 (zeroValue!4211 thiss!1504) lt!119172))))

(declare-fun +!637 (ListLongMap!3473 tuple2!4558) ListLongMap!3473)

(assert (=> b!235438 (contains!1642 (+!637 lt!119171 (tuple2!4559 lt!119155 (zeroValue!4211 thiss!1504))) lt!119172)))

(declare-fun lt!119159 () Unit!7243)

(assert (=> b!235438 (= lt!119159 lt!119169)))

(declare-fun lt!119153 () ListLongMap!3473)

(assert (=> b!235438 (= lt!119153 (getCurrentListMapNoExtraKeys!526 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!119163 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119163 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119156 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119156 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119160 () Unit!7243)

(declare-fun addApplyDifferent!186 (ListLongMap!3473 (_ BitVec 64) V!7897 (_ BitVec 64)) Unit!7243)

(assert (=> b!235438 (= lt!119160 (addApplyDifferent!186 lt!119153 lt!119163 (minValue!4211 thiss!1504) lt!119156))))

(declare-fun apply!210 (ListLongMap!3473 (_ BitVec 64)) V!7897)

(assert (=> b!235438 (= (apply!210 (+!637 lt!119153 (tuple2!4559 lt!119163 (minValue!4211 thiss!1504))) lt!119156) (apply!210 lt!119153 lt!119156))))

(declare-fun lt!119166 () Unit!7243)

(assert (=> b!235438 (= lt!119166 lt!119160)))

(declare-fun lt!119165 () ListLongMap!3473)

(assert (=> b!235438 (= lt!119165 (getCurrentListMapNoExtraKeys!526 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!119158 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119158 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119168 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119168 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119161 () Unit!7243)

(assert (=> b!235438 (= lt!119161 (addApplyDifferent!186 lt!119165 lt!119158 (zeroValue!4211 thiss!1504) lt!119168))))

(assert (=> b!235438 (= (apply!210 (+!637 lt!119165 (tuple2!4559 lt!119158 (zeroValue!4211 thiss!1504))) lt!119168) (apply!210 lt!119165 lt!119168))))

(declare-fun lt!119154 () Unit!7243)

(assert (=> b!235438 (= lt!119154 lt!119161)))

(declare-fun lt!119164 () ListLongMap!3473)

(assert (=> b!235438 (= lt!119164 (getCurrentListMapNoExtraKeys!526 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun lt!119170 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119170 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119157 () (_ BitVec 64))

(assert (=> b!235438 (= lt!119157 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235438 (= lt!119167 (addApplyDifferent!186 lt!119164 lt!119170 (minValue!4211 thiss!1504) lt!119157))))

(assert (=> b!235438 (= (apply!210 (+!637 lt!119164 (tuple2!4559 lt!119170 (minValue!4211 thiss!1504))) lt!119157) (apply!210 lt!119164 lt!119157))))

(declare-fun b!235439 () Bool)

(declare-fun call!21884 () ListLongMap!3473)

(assert (=> b!235439 (= e!152893 call!21884)))

(declare-fun bm!21879 () Bool)

(declare-fun call!21882 () ListLongMap!3473)

(declare-fun call!21881 () ListLongMap!3473)

(assert (=> bm!21879 (= call!21882 call!21881)))

(declare-fun bm!21880 () Bool)

(declare-fun call!21879 () ListLongMap!3473)

(assert (=> bm!21880 (= call!21879 call!21882)))

(declare-fun b!235440 () Bool)

(declare-fun e!152903 () Bool)

(assert (=> b!235440 (= e!152903 (not call!21883))))

(declare-fun bm!21881 () Bool)

(declare-fun call!21885 () ListLongMap!3473)

(assert (=> bm!21881 (= call!21884 call!21885)))

(declare-fun bm!21882 () Bool)

(declare-fun c!39238 () Bool)

(assert (=> bm!21882 (= call!21885 (+!637 (ite c!39238 call!21881 (ite c!39239 call!21882 call!21879)) (ite (or c!39238 c!39239) (tuple2!4559 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4211 thiss!1504)) (tuple2!4559 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4211 thiss!1504)))))))

(declare-fun b!235441 () Bool)

(declare-fun e!152899 () Bool)

(assert (=> b!235441 (= e!152899 (validKeyInArray!0 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235442 () Bool)

(declare-fun e!152896 () Bool)

(assert (=> b!235442 (= e!152896 (= (apply!210 lt!119151 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4211 thiss!1504)))))

(declare-fun bm!21876 () Bool)

(assert (=> bm!21876 (= call!21881 (getCurrentListMapNoExtraKeys!526 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)))))

(declare-fun d!59349 () Bool)

(declare-fun e!152894 () Bool)

(assert (=> d!59349 e!152894))

(declare-fun res!115455 () Bool)

(assert (=> d!59349 (=> (not res!115455) (not e!152894))))

(assert (=> d!59349 (= res!115455 (or (bvsge #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))))))))

(declare-fun lt!119162 () ListLongMap!3473)

(assert (=> d!59349 (= lt!119151 lt!119162)))

(declare-fun lt!119152 () Unit!7243)

(assert (=> d!59349 (= lt!119152 e!152895)))

(declare-fun c!39241 () Bool)

(assert (=> d!59349 (= c!39241 e!152902)))

(declare-fun res!115458 () Bool)

(assert (=> d!59349 (=> (not res!115458) (not e!152902))))

(assert (=> d!59349 (= res!115458 (bvslt #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))))))

(assert (=> d!59349 (= lt!119162 e!152898)))

(assert (=> d!59349 (= c!39238 (and (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59349 (validMask!0 (mask!10337 thiss!1504))))

(assert (=> d!59349 (= (getCurrentListMap!1284 (_keys!6444 thiss!1504) (_values!4353 thiss!1504) (mask!10337 thiss!1504) (extraKeys!4107 thiss!1504) (zeroValue!4211 thiss!1504) (minValue!4211 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4370 thiss!1504)) lt!119151)))

(declare-fun b!235443 () Bool)

(assert (=> b!235443 (= e!152897 call!21884)))

(declare-fun b!235444 () Bool)

(declare-fun e!152905 () Bool)

(assert (=> b!235444 (= e!152905 (= (apply!210 lt!119151 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4211 thiss!1504)))))

(declare-fun b!235445 () Bool)

(declare-fun e!152901 () Bool)

(assert (=> b!235445 (= e!152901 e!152896)))

(declare-fun res!115457 () Bool)

(assert (=> b!235445 (= res!115457 call!21880)))

(assert (=> b!235445 (=> (not res!115457) (not e!152896))))

(declare-fun b!235446 () Bool)

(declare-fun e!152904 () Bool)

(declare-fun get!2849 (ValueCell!2750 V!7897) V!7897)

(declare-fun dynLambda!553 (Int (_ BitVec 64)) V!7897)

(assert (=> b!235446 (= e!152904 (= (apply!210 lt!119151 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)) (get!2849 (select (arr!5527 (_values!4353 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!553 (defaultEntry!4370 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!235446 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5864 (_values!4353 thiss!1504))))))

(assert (=> b!235446 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))))))

(declare-fun b!235447 () Bool)

(declare-fun res!115453 () Bool)

(assert (=> b!235447 (=> (not res!115453) (not e!152894))))

(assert (=> b!235447 (= res!115453 e!152903)))

(declare-fun c!39237 () Bool)

(assert (=> b!235447 (= c!39237 (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!235448 () Bool)

(assert (=> b!235448 (= e!152901 (not call!21880))))

(declare-fun b!235449 () Bool)

(assert (=> b!235449 (= e!152898 (+!637 call!21885 (tuple2!4559 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4211 thiss!1504))))))

(declare-fun b!235450 () Bool)

(declare-fun res!115452 () Bool)

(assert (=> b!235450 (=> (not res!115452) (not e!152894))))

(declare-fun e!152900 () Bool)

(assert (=> b!235450 (= res!115452 e!152900)))

(declare-fun res!115456 () Bool)

(assert (=> b!235450 (=> res!115456 e!152900)))

(assert (=> b!235450 (= res!115456 (not e!152899))))

(declare-fun res!115450 () Bool)

(assert (=> b!235450 (=> (not res!115450) (not e!152899))))

(assert (=> b!235450 (= res!115450 (bvslt #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))))))

(declare-fun b!235451 () Bool)

(assert (=> b!235451 (= e!152903 e!152905)))

(declare-fun res!115451 () Bool)

(assert (=> b!235451 (= res!115451 call!21883)))

(assert (=> b!235451 (=> (not res!115451) (not e!152905))))

(declare-fun b!235452 () Bool)

(assert (=> b!235452 (= e!152900 e!152904)))

(declare-fun res!115454 () Bool)

(assert (=> b!235452 (=> (not res!115454) (not e!152904))))

(assert (=> b!235452 (= res!115454 (contains!1642 lt!119151 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!235452 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))))))

(declare-fun b!235453 () Bool)

(assert (=> b!235453 (= e!152897 call!21879)))

(declare-fun b!235454 () Bool)

(assert (=> b!235454 (= e!152894 e!152901)))

(declare-fun c!39240 () Bool)

(assert (=> b!235454 (= c!39240 (not (= (bvand (extraKeys!4107 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59349 c!39238) b!235449))

(assert (= (and d!59349 (not c!39238)) b!235435))

(assert (= (and b!235435 c!39239) b!235439))

(assert (= (and b!235435 (not c!39239)) b!235434))

(assert (= (and b!235434 c!39242) b!235443))

(assert (= (and b!235434 (not c!39242)) b!235453))

(assert (= (or b!235443 b!235453) bm!21880))

(assert (= (or b!235439 bm!21880) bm!21879))

(assert (= (or b!235439 b!235443) bm!21881))

(assert (= (or b!235449 bm!21879) bm!21876))

(assert (= (or b!235449 bm!21881) bm!21882))

(assert (= (and d!59349 res!115458) b!235436))

(assert (= (and d!59349 c!39241) b!235438))

(assert (= (and d!59349 (not c!39241)) b!235437))

(assert (= (and d!59349 res!115455) b!235450))

(assert (= (and b!235450 res!115450) b!235441))

(assert (= (and b!235450 (not res!115456)) b!235452))

(assert (= (and b!235452 res!115454) b!235446))

(assert (= (and b!235450 res!115452) b!235447))

(assert (= (and b!235447 c!39237) b!235451))

(assert (= (and b!235447 (not c!39237)) b!235440))

(assert (= (and b!235451 res!115451) b!235444))

(assert (= (or b!235451 b!235440) bm!21877))

(assert (= (and b!235447 res!115453) b!235454))

(assert (= (and b!235454 c!39240) b!235445))

(assert (= (and b!235454 (not c!39240)) b!235448))

(assert (= (and b!235445 res!115457) b!235442))

(assert (= (or b!235445 b!235448) bm!21878))

(declare-fun b_lambda!7925 () Bool)

(assert (=> (not b_lambda!7925) (not b!235446)))

(declare-fun t!8427 () Bool)

(declare-fun tb!2925 () Bool)

(assert (=> (and b!235312 (= (defaultEntry!4370 thiss!1504) (defaultEntry!4370 thiss!1504)) t!8427) tb!2925))

(declare-fun result!5113 () Bool)

(assert (=> tb!2925 (= result!5113 tp_is_empty!6187)))

(assert (=> b!235446 t!8427))

(declare-fun b_and!13273 () Bool)

(assert (= b_and!13267 (and (=> t!8427 result!5113) b_and!13273)))

(declare-fun m!256685 () Bool)

(assert (=> b!235436 m!256685))

(assert (=> b!235436 m!256685))

(declare-fun m!256687 () Bool)

(assert (=> b!235436 m!256687))

(declare-fun m!256689 () Bool)

(assert (=> bm!21877 m!256689))

(declare-fun m!256691 () Bool)

(assert (=> b!235446 m!256691))

(declare-fun m!256693 () Bool)

(assert (=> b!235446 m!256693))

(assert (=> b!235446 m!256691))

(declare-fun m!256695 () Bool)

(assert (=> b!235446 m!256695))

(assert (=> b!235446 m!256693))

(assert (=> b!235446 m!256685))

(assert (=> b!235446 m!256685))

(declare-fun m!256697 () Bool)

(assert (=> b!235446 m!256697))

(assert (=> b!235441 m!256685))

(assert (=> b!235441 m!256685))

(assert (=> b!235441 m!256687))

(declare-fun m!256699 () Bool)

(assert (=> bm!21882 m!256699))

(assert (=> b!235438 m!256685))

(declare-fun m!256701 () Bool)

(assert (=> b!235438 m!256701))

(declare-fun m!256703 () Bool)

(assert (=> b!235438 m!256703))

(declare-fun m!256705 () Bool)

(assert (=> b!235438 m!256705))

(declare-fun m!256707 () Bool)

(assert (=> b!235438 m!256707))

(declare-fun m!256709 () Bool)

(assert (=> b!235438 m!256709))

(declare-fun m!256711 () Bool)

(assert (=> b!235438 m!256711))

(declare-fun m!256713 () Bool)

(assert (=> b!235438 m!256713))

(declare-fun m!256715 () Bool)

(assert (=> b!235438 m!256715))

(declare-fun m!256717 () Bool)

(assert (=> b!235438 m!256717))

(declare-fun m!256719 () Bool)

(assert (=> b!235438 m!256719))

(declare-fun m!256721 () Bool)

(assert (=> b!235438 m!256721))

(declare-fun m!256723 () Bool)

(assert (=> b!235438 m!256723))

(declare-fun m!256725 () Bool)

(assert (=> b!235438 m!256725))

(assert (=> b!235438 m!256711))

(declare-fun m!256727 () Bool)

(assert (=> b!235438 m!256727))

(assert (=> b!235438 m!256701))

(declare-fun m!256729 () Bool)

(assert (=> b!235438 m!256729))

(declare-fun m!256731 () Bool)

(assert (=> b!235438 m!256731))

(assert (=> b!235438 m!256721))

(assert (=> b!235438 m!256717))

(assert (=> b!235452 m!256685))

(assert (=> b!235452 m!256685))

(declare-fun m!256733 () Bool)

(assert (=> b!235452 m!256733))

(declare-fun m!256735 () Bool)

(assert (=> b!235449 m!256735))

(declare-fun m!256737 () Bool)

(assert (=> b!235444 m!256737))

(assert (=> bm!21876 m!256707))

(declare-fun m!256739 () Bool)

(assert (=> b!235442 m!256739))

(declare-fun m!256741 () Bool)

(assert (=> bm!21878 m!256741))

(assert (=> d!59349 m!256629))

(assert (=> b!235308 d!59349))

(declare-fun b!235469 () Bool)

(declare-fun e!152914 () SeekEntryResult!959)

(declare-fun lt!119181 () SeekEntryResult!959)

(assert (=> b!235469 (= e!152914 (Found!959 (index!6008 lt!119181)))))

(declare-fun b!235470 () Bool)

(declare-fun e!152912 () SeekEntryResult!959)

(assert (=> b!235470 (= e!152912 (MissingZero!959 (index!6008 lt!119181)))))

(declare-fun d!59351 () Bool)

(declare-fun lt!119179 () SeekEntryResult!959)

(assert (=> d!59351 (and (or ((_ is Undefined!959) lt!119179) (not ((_ is Found!959) lt!119179)) (and (bvsge (index!6007 lt!119179) #b00000000000000000000000000000000) (bvslt (index!6007 lt!119179) (size!5865 (_keys!6444 thiss!1504))))) (or ((_ is Undefined!959) lt!119179) ((_ is Found!959) lt!119179) (not ((_ is MissingZero!959) lt!119179)) (and (bvsge (index!6006 lt!119179) #b00000000000000000000000000000000) (bvslt (index!6006 lt!119179) (size!5865 (_keys!6444 thiss!1504))))) (or ((_ is Undefined!959) lt!119179) ((_ is Found!959) lt!119179) ((_ is MissingZero!959) lt!119179) (not ((_ is MissingVacant!959) lt!119179)) (and (bvsge (index!6009 lt!119179) #b00000000000000000000000000000000) (bvslt (index!6009 lt!119179) (size!5865 (_keys!6444 thiss!1504))))) (or ((_ is Undefined!959) lt!119179) (ite ((_ is Found!959) lt!119179) (= (select (arr!5528 (_keys!6444 thiss!1504)) (index!6007 lt!119179)) key!932) (ite ((_ is MissingZero!959) lt!119179) (= (select (arr!5528 (_keys!6444 thiss!1504)) (index!6006 lt!119179)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!959) lt!119179) (= (select (arr!5528 (_keys!6444 thiss!1504)) (index!6009 lt!119179)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!152913 () SeekEntryResult!959)

(assert (=> d!59351 (= lt!119179 e!152913)))

(declare-fun c!39249 () Bool)

(assert (=> d!59351 (= c!39249 (and ((_ is Intermediate!959) lt!119181) (undefined!1771 lt!119181)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11631 (_ BitVec 32)) SeekEntryResult!959)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59351 (= lt!119181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10337 thiss!1504)) key!932 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(assert (=> d!59351 (validMask!0 (mask!10337 thiss!1504))))

(assert (=> d!59351 (= (seekEntryOrOpen!0 key!932 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)) lt!119179)))

(declare-fun b!235471 () Bool)

(assert (=> b!235471 (= e!152913 Undefined!959)))

(declare-fun b!235472 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11631 (_ BitVec 32)) SeekEntryResult!959)

(assert (=> b!235472 (= e!152912 (seekKeyOrZeroReturnVacant!0 (x!23745 lt!119181) (index!6008 lt!119181) (index!6008 lt!119181) key!932 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(declare-fun b!235473 () Bool)

(assert (=> b!235473 (= e!152913 e!152914)))

(declare-fun lt!119180 () (_ BitVec 64))

(assert (=> b!235473 (= lt!119180 (select (arr!5528 (_keys!6444 thiss!1504)) (index!6008 lt!119181)))))

(declare-fun c!39251 () Bool)

(assert (=> b!235473 (= c!39251 (= lt!119180 key!932))))

(declare-fun b!235474 () Bool)

(declare-fun c!39250 () Bool)

(assert (=> b!235474 (= c!39250 (= lt!119180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!235474 (= e!152914 e!152912)))

(assert (= (and d!59351 c!39249) b!235471))

(assert (= (and d!59351 (not c!39249)) b!235473))

(assert (= (and b!235473 c!39251) b!235469))

(assert (= (and b!235473 (not c!39251)) b!235474))

(assert (= (and b!235474 c!39250) b!235470))

(assert (= (and b!235474 (not c!39250)) b!235472))

(declare-fun m!256743 () Bool)

(assert (=> d!59351 m!256743))

(assert (=> d!59351 m!256629))

(declare-fun m!256745 () Bool)

(assert (=> d!59351 m!256745))

(declare-fun m!256747 () Bool)

(assert (=> d!59351 m!256747))

(declare-fun m!256749 () Bool)

(assert (=> d!59351 m!256749))

(assert (=> d!59351 m!256745))

(declare-fun m!256751 () Bool)

(assert (=> d!59351 m!256751))

(declare-fun m!256753 () Bool)

(assert (=> b!235472 m!256753))

(declare-fun m!256755 () Bool)

(assert (=> b!235473 m!256755))

(assert (=> b!235310 d!59351))

(declare-fun d!59353 () Bool)

(assert (=> d!59353 (= (validMask!0 (mask!10337 thiss!1504)) (and (or (= (mask!10337 thiss!1504) #b00000000000000000000000000000111) (= (mask!10337 thiss!1504) #b00000000000000000000000000001111) (= (mask!10337 thiss!1504) #b00000000000000000000000000011111) (= (mask!10337 thiss!1504) #b00000000000000000000000000111111) (= (mask!10337 thiss!1504) #b00000000000000000000000001111111) (= (mask!10337 thiss!1504) #b00000000000000000000000011111111) (= (mask!10337 thiss!1504) #b00000000000000000000000111111111) (= (mask!10337 thiss!1504) #b00000000000000000000001111111111) (= (mask!10337 thiss!1504) #b00000000000000000000011111111111) (= (mask!10337 thiss!1504) #b00000000000000000000111111111111) (= (mask!10337 thiss!1504) #b00000000000000000001111111111111) (= (mask!10337 thiss!1504) #b00000000000000000011111111111111) (= (mask!10337 thiss!1504) #b00000000000000000111111111111111) (= (mask!10337 thiss!1504) #b00000000000000001111111111111111) (= (mask!10337 thiss!1504) #b00000000000000011111111111111111) (= (mask!10337 thiss!1504) #b00000000000000111111111111111111) (= (mask!10337 thiss!1504) #b00000000000001111111111111111111) (= (mask!10337 thiss!1504) #b00000000000011111111111111111111) (= (mask!10337 thiss!1504) #b00000000000111111111111111111111) (= (mask!10337 thiss!1504) #b00000000001111111111111111111111) (= (mask!10337 thiss!1504) #b00000000011111111111111111111111) (= (mask!10337 thiss!1504) #b00000000111111111111111111111111) (= (mask!10337 thiss!1504) #b00000001111111111111111111111111) (= (mask!10337 thiss!1504) #b00000011111111111111111111111111) (= (mask!10337 thiss!1504) #b00000111111111111111111111111111) (= (mask!10337 thiss!1504) #b00001111111111111111111111111111) (= (mask!10337 thiss!1504) #b00011111111111111111111111111111) (= (mask!10337 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10337 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!235311 d!59353))

(declare-fun b!235485 () Bool)

(declare-fun e!152924 () Bool)

(declare-fun contains!1644 (List!3458 (_ BitVec 64)) Bool)

(assert (=> b!235485 (= e!152924 (contains!1644 Nil!3455 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235486 () Bool)

(declare-fun e!152923 () Bool)

(declare-fun call!21888 () Bool)

(assert (=> b!235486 (= e!152923 call!21888)))

(declare-fun bm!21885 () Bool)

(declare-fun c!39254 () Bool)

(assert (=> bm!21885 (= call!21888 (arrayNoDuplicates!0 (_keys!6444 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39254 (Cons!3454 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000) Nil!3455) Nil!3455)))))

(declare-fun b!235487 () Bool)

(assert (=> b!235487 (= e!152923 call!21888)))

(declare-fun b!235488 () Bool)

(declare-fun e!152925 () Bool)

(declare-fun e!152926 () Bool)

(assert (=> b!235488 (= e!152925 e!152926)))

(declare-fun res!115467 () Bool)

(assert (=> b!235488 (=> (not res!115467) (not e!152926))))

(assert (=> b!235488 (= res!115467 (not e!152924))))

(declare-fun res!115465 () Bool)

(assert (=> b!235488 (=> (not res!115465) (not e!152924))))

(assert (=> b!235488 (= res!115465 (validKeyInArray!0 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235489 () Bool)

(assert (=> b!235489 (= e!152926 e!152923)))

(assert (=> b!235489 (= c!39254 (validKeyInArray!0 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59355 () Bool)

(declare-fun res!115466 () Bool)

(assert (=> d!59355 (=> res!115466 e!152925)))

(assert (=> d!59355 (= res!115466 (bvsge #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))))))

(assert (=> d!59355 (= (arrayNoDuplicates!0 (_keys!6444 thiss!1504) #b00000000000000000000000000000000 Nil!3455) e!152925)))

(assert (= (and d!59355 (not res!115466)) b!235488))

(assert (= (and b!235488 res!115465) b!235485))

(assert (= (and b!235488 res!115467) b!235489))

(assert (= (and b!235489 c!39254) b!235487))

(assert (= (and b!235489 (not c!39254)) b!235486))

(assert (= (or b!235487 b!235486) bm!21885))

(assert (=> b!235485 m!256685))

(assert (=> b!235485 m!256685))

(declare-fun m!256757 () Bool)

(assert (=> b!235485 m!256757))

(assert (=> bm!21885 m!256685))

(declare-fun m!256759 () Bool)

(assert (=> bm!21885 m!256759))

(assert (=> b!235488 m!256685))

(assert (=> b!235488 m!256685))

(assert (=> b!235488 m!256687))

(assert (=> b!235489 m!256685))

(assert (=> b!235489 m!256685))

(assert (=> b!235489 m!256687))

(assert (=> b!235313 d!59355))

(declare-fun b!235498 () Bool)

(declare-fun e!152933 () Bool)

(declare-fun e!152934 () Bool)

(assert (=> b!235498 (= e!152933 e!152934)))

(declare-fun lt!119189 () (_ BitVec 64))

(assert (=> b!235498 (= lt!119189 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119190 () Unit!7243)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11631 (_ BitVec 64) (_ BitVec 32)) Unit!7243)

(assert (=> b!235498 (= lt!119190 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6444 thiss!1504) lt!119189 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235498 (arrayContainsKey!0 (_keys!6444 thiss!1504) lt!119189 #b00000000000000000000000000000000)))

(declare-fun lt!119188 () Unit!7243)

(assert (=> b!235498 (= lt!119188 lt!119190)))

(declare-fun res!115472 () Bool)

(assert (=> b!235498 (= res!115472 (= (seekEntryOrOpen!0 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000) (_keys!6444 thiss!1504) (mask!10337 thiss!1504)) (Found!959 #b00000000000000000000000000000000)))))

(assert (=> b!235498 (=> (not res!115472) (not e!152934))))

(declare-fun bm!21888 () Bool)

(declare-fun call!21891 () Bool)

(assert (=> bm!21888 (= call!21891 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(declare-fun b!235499 () Bool)

(assert (=> b!235499 (= e!152934 call!21891)))

(declare-fun d!59357 () Bool)

(declare-fun res!115473 () Bool)

(declare-fun e!152935 () Bool)

(assert (=> d!59357 (=> res!115473 e!152935)))

(assert (=> d!59357 (= res!115473 (bvsge #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))))))

(assert (=> d!59357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)) e!152935)))

(declare-fun b!235500 () Bool)

(assert (=> b!235500 (= e!152935 e!152933)))

(declare-fun c!39257 () Bool)

(assert (=> b!235500 (= c!39257 (validKeyInArray!0 (select (arr!5528 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!235501 () Bool)

(assert (=> b!235501 (= e!152933 call!21891)))

(assert (= (and d!59357 (not res!115473)) b!235500))

(assert (= (and b!235500 c!39257) b!235498))

(assert (= (and b!235500 (not c!39257)) b!235501))

(assert (= (and b!235498 res!115472) b!235499))

(assert (= (or b!235499 b!235501) bm!21888))

(assert (=> b!235498 m!256685))

(declare-fun m!256761 () Bool)

(assert (=> b!235498 m!256761))

(declare-fun m!256763 () Bool)

(assert (=> b!235498 m!256763))

(assert (=> b!235498 m!256685))

(declare-fun m!256765 () Bool)

(assert (=> b!235498 m!256765))

(declare-fun m!256767 () Bool)

(assert (=> bm!21888 m!256767))

(assert (=> b!235500 m!256685))

(assert (=> b!235500 m!256685))

(assert (=> b!235500 m!256687))

(assert (=> b!235314 d!59357))

(declare-fun d!59359 () Bool)

(assert (=> d!59359 (= (array_inv!3629 (_keys!6444 thiss!1504)) (bvsge (size!5865 (_keys!6444 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235312 d!59359))

(declare-fun d!59361 () Bool)

(assert (=> d!59361 (= (array_inv!3630 (_values!4353 thiss!1504)) (bvsge (size!5864 (_values!4353 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!235312 d!59361))

(declare-fun d!59363 () Bool)

(declare-fun res!115480 () Bool)

(declare-fun e!152938 () Bool)

(assert (=> d!59363 (=> (not res!115480) (not e!152938))))

(declare-fun simpleValid!233 (LongMapFixedSize!3400) Bool)

(assert (=> d!59363 (= res!115480 (simpleValid!233 thiss!1504))))

(assert (=> d!59363 (= (valid!1356 thiss!1504) e!152938)))

(declare-fun b!235508 () Bool)

(declare-fun res!115481 () Bool)

(assert (=> b!235508 (=> (not res!115481) (not e!152938))))

(declare-fun arrayCountValidKeys!0 (array!11631 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!235508 (= res!115481 (= (arrayCountValidKeys!0 (_keys!6444 thiss!1504) #b00000000000000000000000000000000 (size!5865 (_keys!6444 thiss!1504))) (_size!1749 thiss!1504)))))

(declare-fun b!235509 () Bool)

(declare-fun res!115482 () Bool)

(assert (=> b!235509 (=> (not res!115482) (not e!152938))))

(assert (=> b!235509 (= res!115482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6444 thiss!1504) (mask!10337 thiss!1504)))))

(declare-fun b!235510 () Bool)

(assert (=> b!235510 (= e!152938 (arrayNoDuplicates!0 (_keys!6444 thiss!1504) #b00000000000000000000000000000000 Nil!3455))))

(assert (= (and d!59363 res!115480) b!235508))

(assert (= (and b!235508 res!115481) b!235509))

(assert (= (and b!235509 res!115482) b!235510))

(declare-fun m!256769 () Bool)

(assert (=> d!59363 m!256769))

(declare-fun m!256771 () Bool)

(assert (=> b!235508 m!256771))

(assert (=> b!235509 m!256625))

(assert (=> b!235510 m!256635))

(assert (=> start!22506 d!59363))

(declare-fun mapIsEmpty!10484 () Bool)

(declare-fun mapRes!10484 () Bool)

(assert (=> mapIsEmpty!10484 mapRes!10484))

(declare-fun condMapEmpty!10484 () Bool)

(declare-fun mapDefault!10484 () ValueCell!2750)

(assert (=> mapNonEmpty!10475 (= condMapEmpty!10484 (= mapRest!10475 ((as const (Array (_ BitVec 32) ValueCell!2750)) mapDefault!10484)))))

(declare-fun e!152943 () Bool)

(assert (=> mapNonEmpty!10475 (= tp!22142 (and e!152943 mapRes!10484))))

(declare-fun mapNonEmpty!10484 () Bool)

(declare-fun tp!22157 () Bool)

(declare-fun e!152944 () Bool)

(assert (=> mapNonEmpty!10484 (= mapRes!10484 (and tp!22157 e!152944))))

(declare-fun mapKey!10484 () (_ BitVec 32))

(declare-fun mapRest!10484 () (Array (_ BitVec 32) ValueCell!2750))

(declare-fun mapValue!10484 () ValueCell!2750)

(assert (=> mapNonEmpty!10484 (= mapRest!10475 (store mapRest!10484 mapKey!10484 mapValue!10484))))

(declare-fun b!235518 () Bool)

(assert (=> b!235518 (= e!152943 tp_is_empty!6187)))

(declare-fun b!235517 () Bool)

(assert (=> b!235517 (= e!152944 tp_is_empty!6187)))

(assert (= (and mapNonEmpty!10475 condMapEmpty!10484) mapIsEmpty!10484))

(assert (= (and mapNonEmpty!10475 (not condMapEmpty!10484)) mapNonEmpty!10484))

(assert (= (and mapNonEmpty!10484 ((_ is ValueCellFull!2750) mapValue!10484)) b!235517))

(assert (= (and mapNonEmpty!10475 ((_ is ValueCellFull!2750) mapDefault!10484)) b!235518))

(declare-fun m!256773 () Bool)

(assert (=> mapNonEmpty!10484 m!256773))

(declare-fun b_lambda!7927 () Bool)

(assert (= b_lambda!7925 (or (and b!235312 b_free!6325) b_lambda!7927)))

(check-sat (not b!235510) (not bm!21877) (not d!59347) (not b!235509) (not b!235438) (not mapNonEmpty!10484) (not bm!21888) (not b!235500) (not b!235489) (not b!235441) b_and!13273 (not b!235472) tp_is_empty!6187 (not d!59363) (not b!235389) (not bm!21885) (not d!59349) (not bm!21876) (not b!235452) (not b!235449) (not b!235485) (not b!235488) (not b!235446) (not b_next!6325) (not b_lambda!7927) (not b!235391) (not b!235442) (not b!235498) (not b!235508) (not b!235436) (not d!59351) (not bm!21882) (not b!235444) (not bm!21878))
(check-sat b_and!13273 (not b_next!6325))
