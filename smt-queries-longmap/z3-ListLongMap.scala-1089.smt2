; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22218 () Bool)

(assert start!22218)

(declare-fun b!233153 () Bool)

(declare-fun b_free!6285 () Bool)

(declare-fun b_next!6285 () Bool)

(assert (=> b!233153 (= b_free!6285 (not b_next!6285))))

(declare-fun tp!21996 () Bool)

(declare-fun b_and!13183 () Bool)

(assert (=> b!233153 (= tp!21996 b_and!13183)))

(declare-fun b!233151 () Bool)

(declare-fun res!114441 () Bool)

(declare-fun e!151455 () Bool)

(assert (=> b!233151 (=> (not res!114441) (not e!151455))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233151 (= res!114441 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!10390 () Bool)

(declare-fun mapRes!10390 () Bool)

(declare-fun tp!21997 () Bool)

(declare-fun e!151457 () Bool)

(assert (=> mapNonEmpty!10390 (= mapRes!10390 (and tp!21997 e!151457))))

(declare-datatypes ((V!7843 0))(
  ( (V!7844 (val!3118 Int)) )
))
(declare-datatypes ((ValueCell!2730 0))(
  ( (ValueCellFull!2730 (v!5138 V!7843)) (EmptyCell!2730) )
))
(declare-fun mapRest!10390 () (Array (_ BitVec 32) ValueCell!2730))

(declare-fun mapKey!10390 () (_ BitVec 32))

(declare-fun mapValue!10390 () ValueCell!2730)

(declare-datatypes ((array!11537 0))(
  ( (array!11538 (arr!5488 (Array (_ BitVec 32) ValueCell!2730)) (size!5821 (_ BitVec 32))) )
))
(declare-datatypes ((array!11539 0))(
  ( (array!11540 (arr!5489 (Array (_ BitVec 32) (_ BitVec 64))) (size!5822 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3360 0))(
  ( (LongMapFixedSize!3361 (defaultEntry!4339 Int) (mask!10261 (_ BitVec 32)) (extraKeys!4076 (_ BitVec 32)) (zeroValue!4180 V!7843) (minValue!4180 V!7843) (_size!1729 (_ BitVec 32)) (_keys!6393 array!11539) (_values!4322 array!11537) (_vacant!1729 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3360)

(assert (=> mapNonEmpty!10390 (= (arr!5488 (_values!4322 thiss!1504)) (store mapRest!10390 mapKey!10390 mapValue!10390))))

(declare-fun b!233152 () Bool)

(declare-fun tp_is_empty!6147 () Bool)

(assert (=> b!233152 (= e!151457 tp_is_empty!6147)))

(declare-fun e!151460 () Bool)

(declare-fun e!151454 () Bool)

(declare-fun array_inv!3615 (array!11539) Bool)

(declare-fun array_inv!3616 (array!11537) Bool)

(assert (=> b!233153 (= e!151454 (and tp!21996 tp_is_empty!6147 (array_inv!3615 (_keys!6393 thiss!1504)) (array_inv!3616 (_values!4322 thiss!1504)) e!151460))))

(declare-fun b!233154 () Bool)

(declare-fun e!151458 () Bool)

(assert (=> b!233154 (= e!151460 (and e!151458 mapRes!10390))))

(declare-fun condMapEmpty!10390 () Bool)

(declare-fun mapDefault!10390 () ValueCell!2730)

(assert (=> b!233154 (= condMapEmpty!10390 (= (arr!5488 (_values!4322 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2730)) mapDefault!10390)))))

(declare-fun mapIsEmpty!10390 () Bool)

(assert (=> mapIsEmpty!10390 mapRes!10390))

(declare-fun b!233155 () Bool)

(assert (=> b!233155 (= e!151458 tp_is_empty!6147)))

(declare-fun b!233156 () Bool)

(declare-fun e!151456 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233156 (= e!151456 (not (validMask!0 (mask!10261 thiss!1504))))))

(declare-fun res!114440 () Bool)

(assert (=> start!22218 (=> (not res!114440) (not e!151455))))

(declare-fun valid!1327 (LongMapFixedSize!3360) Bool)

(assert (=> start!22218 (= res!114440 (valid!1327 thiss!1504))))

(assert (=> start!22218 e!151455))

(assert (=> start!22218 e!151454))

(assert (=> start!22218 true))

(declare-fun b!233157 () Bool)

(declare-fun res!114439 () Bool)

(assert (=> b!233157 (=> (not res!114439) (not e!151456))))

(declare-datatypes ((tuple2!4598 0))(
  ( (tuple2!4599 (_1!2310 (_ BitVec 64)) (_2!2310 V!7843)) )
))
(declare-datatypes ((List!3512 0))(
  ( (Nil!3509) (Cons!3508 (h!4156 tuple2!4598) (t!8471 List!3512)) )
))
(declare-datatypes ((ListLongMap!3511 0))(
  ( (ListLongMap!3512 (toList!1771 List!3512)) )
))
(declare-fun contains!1639 (ListLongMap!3511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1299 (array!11539 array!11537 (_ BitVec 32) (_ BitVec 32) V!7843 V!7843 (_ BitVec 32) Int) ListLongMap!3511)

(assert (=> b!233157 (= res!114439 (contains!1639 (getCurrentListMap!1299 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)) key!932))))

(declare-fun b!233158 () Bool)

(assert (=> b!233158 (= e!151455 e!151456)))

(declare-fun res!114442 () Bool)

(assert (=> b!233158 (=> (not res!114442) (not e!151456))))

(declare-datatypes ((SeekEntryResult!974 0))(
  ( (MissingZero!974 (index!6066 (_ BitVec 32))) (Found!974 (index!6067 (_ BitVec 32))) (Intermediate!974 (undefined!1786 Bool) (index!6068 (_ BitVec 32)) (x!23602 (_ BitVec 32))) (Undefined!974) (MissingVacant!974 (index!6069 (_ BitVec 32))) )
))
(declare-fun lt!117911 () SeekEntryResult!974)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233158 (= res!114442 (or (= lt!117911 (MissingZero!974 index!297)) (= lt!117911 (MissingVacant!974 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11539 (_ BitVec 32)) SeekEntryResult!974)

(assert (=> b!233158 (= lt!117911 (seekEntryOrOpen!0 key!932 (_keys!6393 thiss!1504) (mask!10261 thiss!1504)))))

(assert (= (and start!22218 res!114440) b!233151))

(assert (= (and b!233151 res!114441) b!233158))

(assert (= (and b!233158 res!114442) b!233157))

(assert (= (and b!233157 res!114439) b!233156))

(assert (= (and b!233154 condMapEmpty!10390) mapIsEmpty!10390))

(assert (= (and b!233154 (not condMapEmpty!10390)) mapNonEmpty!10390))

(get-info :version)

(assert (= (and mapNonEmpty!10390 ((_ is ValueCellFull!2730) mapValue!10390)) b!233152))

(assert (= (and b!233154 ((_ is ValueCellFull!2730) mapDefault!10390)) b!233155))

(assert (= b!233153 b!233154))

(assert (= start!22218 b!233153))

(declare-fun m!254601 () Bool)

(assert (=> b!233157 m!254601))

(assert (=> b!233157 m!254601))

(declare-fun m!254603 () Bool)

(assert (=> b!233157 m!254603))

(declare-fun m!254605 () Bool)

(assert (=> start!22218 m!254605))

(declare-fun m!254607 () Bool)

(assert (=> b!233158 m!254607))

(declare-fun m!254609 () Bool)

(assert (=> b!233156 m!254609))

(declare-fun m!254611 () Bool)

(assert (=> b!233153 m!254611))

(declare-fun m!254613 () Bool)

(assert (=> b!233153 m!254613))

(declare-fun m!254615 () Bool)

(assert (=> mapNonEmpty!10390 m!254615))

(check-sat (not b_next!6285) b_and!13183 (not b!233158) (not b!233153) tp_is_empty!6147 (not b!233157) (not b!233156) (not start!22218) (not mapNonEmpty!10390))
(check-sat b_and!13183 (not b_next!6285))
(get-model)

(declare-fun d!58863 () Bool)

(assert (=> d!58863 (= (validMask!0 (mask!10261 thiss!1504)) (and (or (= (mask!10261 thiss!1504) #b00000000000000000000000000000111) (= (mask!10261 thiss!1504) #b00000000000000000000000000001111) (= (mask!10261 thiss!1504) #b00000000000000000000000000011111) (= (mask!10261 thiss!1504) #b00000000000000000000000000111111) (= (mask!10261 thiss!1504) #b00000000000000000000000001111111) (= (mask!10261 thiss!1504) #b00000000000000000000000011111111) (= (mask!10261 thiss!1504) #b00000000000000000000000111111111) (= (mask!10261 thiss!1504) #b00000000000000000000001111111111) (= (mask!10261 thiss!1504) #b00000000000000000000011111111111) (= (mask!10261 thiss!1504) #b00000000000000000000111111111111) (= (mask!10261 thiss!1504) #b00000000000000000001111111111111) (= (mask!10261 thiss!1504) #b00000000000000000011111111111111) (= (mask!10261 thiss!1504) #b00000000000000000111111111111111) (= (mask!10261 thiss!1504) #b00000000000000001111111111111111) (= (mask!10261 thiss!1504) #b00000000000000011111111111111111) (= (mask!10261 thiss!1504) #b00000000000000111111111111111111) (= (mask!10261 thiss!1504) #b00000000000001111111111111111111) (= (mask!10261 thiss!1504) #b00000000000011111111111111111111) (= (mask!10261 thiss!1504) #b00000000000111111111111111111111) (= (mask!10261 thiss!1504) #b00000000001111111111111111111111) (= (mask!10261 thiss!1504) #b00000000011111111111111111111111) (= (mask!10261 thiss!1504) #b00000000111111111111111111111111) (= (mask!10261 thiss!1504) #b00000001111111111111111111111111) (= (mask!10261 thiss!1504) #b00000011111111111111111111111111) (= (mask!10261 thiss!1504) #b00000111111111111111111111111111) (= (mask!10261 thiss!1504) #b00001111111111111111111111111111) (= (mask!10261 thiss!1504) #b00011111111111111111111111111111) (= (mask!10261 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10261 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233156 d!58863))

(declare-fun d!58865 () Bool)

(declare-fun res!114461 () Bool)

(declare-fun e!151484 () Bool)

(assert (=> d!58865 (=> (not res!114461) (not e!151484))))

(declare-fun simpleValid!226 (LongMapFixedSize!3360) Bool)

(assert (=> d!58865 (= res!114461 (simpleValid!226 thiss!1504))))

(assert (=> d!58865 (= (valid!1327 thiss!1504) e!151484)))

(declare-fun b!233189 () Bool)

(declare-fun res!114462 () Bool)

(assert (=> b!233189 (=> (not res!114462) (not e!151484))))

(declare-fun arrayCountValidKeys!0 (array!11539 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233189 (= res!114462 (= (arrayCountValidKeys!0 (_keys!6393 thiss!1504) #b00000000000000000000000000000000 (size!5822 (_keys!6393 thiss!1504))) (_size!1729 thiss!1504)))))

(declare-fun b!233190 () Bool)

(declare-fun res!114463 () Bool)

(assert (=> b!233190 (=> (not res!114463) (not e!151484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11539 (_ BitVec 32)) Bool)

(assert (=> b!233190 (= res!114463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6393 thiss!1504) (mask!10261 thiss!1504)))))

(declare-fun b!233191 () Bool)

(declare-datatypes ((List!3514 0))(
  ( (Nil!3511) (Cons!3510 (h!4158 (_ BitVec 64)) (t!8475 List!3514)) )
))
(declare-fun arrayNoDuplicates!0 (array!11539 (_ BitVec 32) List!3514) Bool)

(assert (=> b!233191 (= e!151484 (arrayNoDuplicates!0 (_keys!6393 thiss!1504) #b00000000000000000000000000000000 Nil!3511))))

(assert (= (and d!58865 res!114461) b!233189))

(assert (= (and b!233189 res!114462) b!233190))

(assert (= (and b!233190 res!114463) b!233191))

(declare-fun m!254633 () Bool)

(assert (=> d!58865 m!254633))

(declare-fun m!254635 () Bool)

(assert (=> b!233189 m!254635))

(declare-fun m!254637 () Bool)

(assert (=> b!233190 m!254637))

(declare-fun m!254639 () Bool)

(assert (=> b!233191 m!254639))

(assert (=> start!22218 d!58865))

(declare-fun d!58867 () Bool)

(declare-fun e!151489 () Bool)

(assert (=> d!58867 e!151489))

(declare-fun res!114466 () Bool)

(assert (=> d!58867 (=> res!114466 e!151489)))

(declare-fun lt!117925 () Bool)

(assert (=> d!58867 (= res!114466 (not lt!117925))))

(declare-fun lt!117923 () Bool)

(assert (=> d!58867 (= lt!117925 lt!117923)))

(declare-datatypes ((Unit!7210 0))(
  ( (Unit!7211) )
))
(declare-fun lt!117924 () Unit!7210)

(declare-fun e!151490 () Unit!7210)

(assert (=> d!58867 (= lt!117924 e!151490)))

(declare-fun c!38778 () Bool)

(assert (=> d!58867 (= c!38778 lt!117923)))

(declare-fun containsKey!253 (List!3512 (_ BitVec 64)) Bool)

(assert (=> d!58867 (= lt!117923 (containsKey!253 (toList!1771 (getCurrentListMap!1299 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504))) key!932))))

(assert (=> d!58867 (= (contains!1639 (getCurrentListMap!1299 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)) key!932) lt!117925)))

(declare-fun b!233198 () Bool)

(declare-fun lt!117926 () Unit!7210)

(assert (=> b!233198 (= e!151490 lt!117926)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!201 (List!3512 (_ BitVec 64)) Unit!7210)

(assert (=> b!233198 (= lt!117926 (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1771 (getCurrentListMap!1299 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504))) key!932))))

(declare-datatypes ((Option!267 0))(
  ( (Some!266 (v!5140 V!7843)) (None!265) )
))
(declare-fun isDefined!202 (Option!267) Bool)

(declare-fun getValueByKey!261 (List!3512 (_ BitVec 64)) Option!267)

(assert (=> b!233198 (isDefined!202 (getValueByKey!261 (toList!1771 (getCurrentListMap!1299 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504))) key!932))))

(declare-fun b!233199 () Bool)

(declare-fun Unit!7212 () Unit!7210)

(assert (=> b!233199 (= e!151490 Unit!7212)))

(declare-fun b!233200 () Bool)

(assert (=> b!233200 (= e!151489 (isDefined!202 (getValueByKey!261 (toList!1771 (getCurrentListMap!1299 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504))) key!932)))))

(assert (= (and d!58867 c!38778) b!233198))

(assert (= (and d!58867 (not c!38778)) b!233199))

(assert (= (and d!58867 (not res!114466)) b!233200))

(declare-fun m!254641 () Bool)

(assert (=> d!58867 m!254641))

(declare-fun m!254643 () Bool)

(assert (=> b!233198 m!254643))

(declare-fun m!254645 () Bool)

(assert (=> b!233198 m!254645))

(assert (=> b!233198 m!254645))

(declare-fun m!254647 () Bool)

(assert (=> b!233198 m!254647))

(assert (=> b!233200 m!254645))

(assert (=> b!233200 m!254645))

(assert (=> b!233200 m!254647))

(assert (=> b!233157 d!58867))

(declare-fun b!233243 () Bool)

(declare-fun e!151525 () ListLongMap!3511)

(declare-fun call!21695 () ListLongMap!3511)

(declare-fun +!630 (ListLongMap!3511 tuple2!4598) ListLongMap!3511)

(assert (=> b!233243 (= e!151525 (+!630 call!21695 (tuple2!4599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4180 thiss!1504))))))

(declare-fun bm!21690 () Bool)

(declare-fun call!21694 () ListLongMap!3511)

(assert (=> bm!21690 (= call!21694 call!21695)))

(declare-fun b!233244 () Bool)

(declare-fun e!151524 () ListLongMap!3511)

(assert (=> b!233244 (= e!151525 e!151524)))

(declare-fun c!38794 () Bool)

(assert (=> b!233244 (= c!38794 (and (not (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21691 () Bool)

(declare-fun call!21699 () Bool)

(declare-fun lt!117973 () ListLongMap!3511)

(assert (=> bm!21691 (= call!21699 (contains!1639 lt!117973 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233245 () Bool)

(declare-fun e!151523 () Unit!7210)

(declare-fun Unit!7213 () Unit!7210)

(assert (=> b!233245 (= e!151523 Unit!7213)))

(declare-fun b!233246 () Bool)

(declare-fun e!151519 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233246 (= e!151519 (validKeyInArray!0 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21692 () Bool)

(declare-fun call!21693 () ListLongMap!3511)

(declare-fun call!21697 () ListLongMap!3511)

(assert (=> bm!21692 (= call!21693 call!21697)))

(declare-fun b!233247 () Bool)

(declare-fun e!151517 () ListLongMap!3511)

(assert (=> b!233247 (= e!151517 call!21694)))

(declare-fun b!233248 () Bool)

(declare-fun e!151526 () Bool)

(declare-fun call!21698 () Bool)

(assert (=> b!233248 (= e!151526 (not call!21698))))

(declare-fun b!233249 () Bool)

(assert (=> b!233249 (= e!151524 call!21694)))

(declare-fun b!233250 () Bool)

(declare-fun e!151527 () Bool)

(assert (=> b!233250 (= e!151526 e!151527)))

(declare-fun res!114486 () Bool)

(assert (=> b!233250 (= res!114486 call!21698)))

(assert (=> b!233250 (=> (not res!114486) (not e!151527))))

(declare-fun b!233251 () Bool)

(declare-fun e!151528 () Bool)

(assert (=> b!233251 (= e!151528 (not call!21699))))

(declare-fun b!233252 () Bool)

(declare-fun res!114485 () Bool)

(declare-fun e!151522 () Bool)

(assert (=> b!233252 (=> (not res!114485) (not e!151522))))

(declare-fun e!151518 () Bool)

(assert (=> b!233252 (= res!114485 e!151518)))

(declare-fun res!114491 () Bool)

(assert (=> b!233252 (=> res!114491 e!151518)))

(declare-fun e!151521 () Bool)

(assert (=> b!233252 (= res!114491 (not e!151521))))

(declare-fun res!114488 () Bool)

(assert (=> b!233252 (=> (not res!114488) (not e!151521))))

(assert (=> b!233252 (= res!114488 (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6393 thiss!1504))))))

(declare-fun d!58869 () Bool)

(assert (=> d!58869 e!151522))

(declare-fun res!114490 () Bool)

(assert (=> d!58869 (=> (not res!114490) (not e!151522))))

(assert (=> d!58869 (= res!114490 (or (bvsge #b00000000000000000000000000000000 (size!5822 (_keys!6393 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6393 thiss!1504))))))))

(declare-fun lt!117980 () ListLongMap!3511)

(assert (=> d!58869 (= lt!117973 lt!117980)))

(declare-fun lt!117978 () Unit!7210)

(assert (=> d!58869 (= lt!117978 e!151523)))

(declare-fun c!38796 () Bool)

(assert (=> d!58869 (= c!38796 e!151519)))

(declare-fun res!114489 () Bool)

(assert (=> d!58869 (=> (not res!114489) (not e!151519))))

(assert (=> d!58869 (= res!114489 (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6393 thiss!1504))))))

(assert (=> d!58869 (= lt!117980 e!151525)))

(declare-fun c!38791 () Bool)

(assert (=> d!58869 (= c!38791 (and (not (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58869 (validMask!0 (mask!10261 thiss!1504))))

(assert (=> d!58869 (= (getCurrentListMap!1299 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)) lt!117973)))

(declare-fun b!233253 () Bool)

(assert (=> b!233253 (= e!151517 call!21693)))

(declare-fun b!233254 () Bool)

(declare-fun apply!203 (ListLongMap!3511 (_ BitVec 64)) V!7843)

(assert (=> b!233254 (= e!151527 (= (apply!203 lt!117973 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4180 thiss!1504)))))

(declare-fun bm!21693 () Bool)

(assert (=> bm!21693 (= call!21698 (contains!1639 lt!117973 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233255 () Bool)

(assert (=> b!233255 (= e!151522 e!151528)))

(declare-fun c!38795 () Bool)

(assert (=> b!233255 (= c!38795 (not (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21694 () Bool)

(declare-fun call!21696 () ListLongMap!3511)

(declare-fun getCurrentListMapNoExtraKeys!525 (array!11539 array!11537 (_ BitVec 32) (_ BitVec 32) V!7843 V!7843 (_ BitVec 32) Int) ListLongMap!3511)

(assert (=> bm!21694 (= call!21696 (getCurrentListMapNoExtraKeys!525 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)))))

(declare-fun b!233256 () Bool)

(declare-fun c!38792 () Bool)

(assert (=> b!233256 (= c!38792 (and (not (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!233256 (= e!151524 e!151517)))

(declare-fun bm!21695 () Bool)

(assert (=> bm!21695 (= call!21695 (+!630 (ite c!38791 call!21696 (ite c!38794 call!21697 call!21693)) (ite (or c!38791 c!38794) (tuple2!4599 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4180 thiss!1504)) (tuple2!4599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4180 thiss!1504)))))))

(declare-fun b!233257 () Bool)

(declare-fun e!151529 () Bool)

(assert (=> b!233257 (= e!151518 e!151529)))

(declare-fun res!114492 () Bool)

(assert (=> b!233257 (=> (not res!114492) (not e!151529))))

(assert (=> b!233257 (= res!114492 (contains!1639 lt!117973 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6393 thiss!1504))))))

(declare-fun b!233258 () Bool)

(declare-fun get!2810 (ValueCell!2730 V!7843) V!7843)

(declare-fun dynLambda!546 (Int (_ BitVec 64)) V!7843)

(assert (=> b!233258 (= e!151529 (= (apply!203 lt!117973 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000)) (get!2810 (select (arr!5488 (_values!4322 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!546 (defaultEntry!4339 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5821 (_values!4322 thiss!1504))))))

(assert (=> b!233258 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5822 (_keys!6393 thiss!1504))))))

(declare-fun b!233259 () Bool)

(declare-fun lt!117985 () Unit!7210)

(assert (=> b!233259 (= e!151523 lt!117985)))

(declare-fun lt!117975 () ListLongMap!3511)

(assert (=> b!233259 (= lt!117975 (getCurrentListMapNoExtraKeys!525 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)))))

(declare-fun lt!117971 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117971 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117977 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117977 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117984 () Unit!7210)

(declare-fun addStillContains!179 (ListLongMap!3511 (_ BitVec 64) V!7843 (_ BitVec 64)) Unit!7210)

(assert (=> b!233259 (= lt!117984 (addStillContains!179 lt!117975 lt!117971 (zeroValue!4180 thiss!1504) lt!117977))))

(assert (=> b!233259 (contains!1639 (+!630 lt!117975 (tuple2!4599 lt!117971 (zeroValue!4180 thiss!1504))) lt!117977)))

(declare-fun lt!117981 () Unit!7210)

(assert (=> b!233259 (= lt!117981 lt!117984)))

(declare-fun lt!117982 () ListLongMap!3511)

(assert (=> b!233259 (= lt!117982 (getCurrentListMapNoExtraKeys!525 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)))))

(declare-fun lt!117987 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117987 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117972 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117972 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117988 () Unit!7210)

(declare-fun addApplyDifferent!179 (ListLongMap!3511 (_ BitVec 64) V!7843 (_ BitVec 64)) Unit!7210)

(assert (=> b!233259 (= lt!117988 (addApplyDifferent!179 lt!117982 lt!117987 (minValue!4180 thiss!1504) lt!117972))))

(assert (=> b!233259 (= (apply!203 (+!630 lt!117982 (tuple2!4599 lt!117987 (minValue!4180 thiss!1504))) lt!117972) (apply!203 lt!117982 lt!117972))))

(declare-fun lt!117974 () Unit!7210)

(assert (=> b!233259 (= lt!117974 lt!117988)))

(declare-fun lt!117976 () ListLongMap!3511)

(assert (=> b!233259 (= lt!117976 (getCurrentListMapNoExtraKeys!525 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)))))

(declare-fun lt!117992 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117992 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117989 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117989 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!117991 () Unit!7210)

(assert (=> b!233259 (= lt!117991 (addApplyDifferent!179 lt!117976 lt!117992 (zeroValue!4180 thiss!1504) lt!117989))))

(assert (=> b!233259 (= (apply!203 (+!630 lt!117976 (tuple2!4599 lt!117992 (zeroValue!4180 thiss!1504))) lt!117989) (apply!203 lt!117976 lt!117989))))

(declare-fun lt!117990 () Unit!7210)

(assert (=> b!233259 (= lt!117990 lt!117991)))

(declare-fun lt!117979 () ListLongMap!3511)

(assert (=> b!233259 (= lt!117979 (getCurrentListMapNoExtraKeys!525 (_keys!6393 thiss!1504) (_values!4322 thiss!1504) (mask!10261 thiss!1504) (extraKeys!4076 thiss!1504) (zeroValue!4180 thiss!1504) (minValue!4180 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4339 thiss!1504)))))

(declare-fun lt!117983 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117983 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!117986 () (_ BitVec 64))

(assert (=> b!233259 (= lt!117986 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233259 (= lt!117985 (addApplyDifferent!179 lt!117979 lt!117983 (minValue!4180 thiss!1504) lt!117986))))

(assert (=> b!233259 (= (apply!203 (+!630 lt!117979 (tuple2!4599 lt!117983 (minValue!4180 thiss!1504))) lt!117986) (apply!203 lt!117979 lt!117986))))

(declare-fun b!233260 () Bool)

(declare-fun e!151520 () Bool)

(assert (=> b!233260 (= e!151528 e!151520)))

(declare-fun res!114487 () Bool)

(assert (=> b!233260 (= res!114487 call!21699)))

(assert (=> b!233260 (=> (not res!114487) (not e!151520))))

(declare-fun b!233261 () Bool)

(assert (=> b!233261 (= e!151520 (= (apply!203 lt!117973 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4180 thiss!1504)))))

(declare-fun bm!21696 () Bool)

(assert (=> bm!21696 (= call!21697 call!21696)))

(declare-fun b!233262 () Bool)

(declare-fun res!114493 () Bool)

(assert (=> b!233262 (=> (not res!114493) (not e!151522))))

(assert (=> b!233262 (= res!114493 e!151526)))

(declare-fun c!38793 () Bool)

(assert (=> b!233262 (= c!38793 (not (= (bvand (extraKeys!4076 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!233263 () Bool)

(assert (=> b!233263 (= e!151521 (validKeyInArray!0 (select (arr!5489 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!58869 c!38791) b!233243))

(assert (= (and d!58869 (not c!38791)) b!233244))

(assert (= (and b!233244 c!38794) b!233249))

(assert (= (and b!233244 (not c!38794)) b!233256))

(assert (= (and b!233256 c!38792) b!233247))

(assert (= (and b!233256 (not c!38792)) b!233253))

(assert (= (or b!233247 b!233253) bm!21692))

(assert (= (or b!233249 bm!21692) bm!21696))

(assert (= (or b!233249 b!233247) bm!21690))

(assert (= (or b!233243 bm!21696) bm!21694))

(assert (= (or b!233243 bm!21690) bm!21695))

(assert (= (and d!58869 res!114489) b!233246))

(assert (= (and d!58869 c!38796) b!233259))

(assert (= (and d!58869 (not c!38796)) b!233245))

(assert (= (and d!58869 res!114490) b!233252))

(assert (= (and b!233252 res!114488) b!233263))

(assert (= (and b!233252 (not res!114491)) b!233257))

(assert (= (and b!233257 res!114492) b!233258))

(assert (= (and b!233252 res!114485) b!233262))

(assert (= (and b!233262 c!38793) b!233250))

(assert (= (and b!233262 (not c!38793)) b!233248))

(assert (= (and b!233250 res!114486) b!233254))

(assert (= (or b!233250 b!233248) bm!21693))

(assert (= (and b!233262 res!114493) b!233255))

(assert (= (and b!233255 c!38795) b!233260))

(assert (= (and b!233255 (not c!38795)) b!233251))

(assert (= (and b!233260 res!114487) b!233261))

(assert (= (or b!233260 b!233251) bm!21691))

(declare-fun b_lambda!7843 () Bool)

(assert (=> (not b_lambda!7843) (not b!233258)))

(declare-fun t!8474 () Bool)

(declare-fun tb!2919 () Bool)

(assert (=> (and b!233153 (= (defaultEntry!4339 thiss!1504) (defaultEntry!4339 thiss!1504)) t!8474) tb!2919))

(declare-fun result!5079 () Bool)

(assert (=> tb!2919 (= result!5079 tp_is_empty!6147)))

(assert (=> b!233258 t!8474))

(declare-fun b_and!13187 () Bool)

(assert (= b_and!13183 (and (=> t!8474 result!5079) b_and!13187)))

(declare-fun m!254649 () Bool)

(assert (=> b!233263 m!254649))

(assert (=> b!233263 m!254649))

(declare-fun m!254651 () Bool)

(assert (=> b!233263 m!254651))

(declare-fun m!254653 () Bool)

(assert (=> bm!21694 m!254653))

(declare-fun m!254655 () Bool)

(assert (=> bm!21695 m!254655))

(declare-fun m!254657 () Bool)

(assert (=> bm!21693 m!254657))

(declare-fun m!254659 () Bool)

(assert (=> b!233259 m!254659))

(declare-fun m!254661 () Bool)

(assert (=> b!233259 m!254661))

(declare-fun m!254663 () Bool)

(assert (=> b!233259 m!254663))

(declare-fun m!254665 () Bool)

(assert (=> b!233259 m!254665))

(declare-fun m!254667 () Bool)

(assert (=> b!233259 m!254667))

(assert (=> b!233259 m!254653))

(declare-fun m!254669 () Bool)

(assert (=> b!233259 m!254669))

(declare-fun m!254671 () Bool)

(assert (=> b!233259 m!254671))

(declare-fun m!254673 () Bool)

(assert (=> b!233259 m!254673))

(declare-fun m!254675 () Bool)

(assert (=> b!233259 m!254675))

(assert (=> b!233259 m!254665))

(assert (=> b!233259 m!254663))

(declare-fun m!254677 () Bool)

(assert (=> b!233259 m!254677))

(declare-fun m!254679 () Bool)

(assert (=> b!233259 m!254679))

(declare-fun m!254681 () Bool)

(assert (=> b!233259 m!254681))

(assert (=> b!233259 m!254649))

(declare-fun m!254683 () Bool)

(assert (=> b!233259 m!254683))

(declare-fun m!254685 () Bool)

(assert (=> b!233259 m!254685))

(assert (=> b!233259 m!254683))

(declare-fun m!254687 () Bool)

(assert (=> b!233259 m!254687))

(assert (=> b!233259 m!254659))

(declare-fun m!254689 () Bool)

(assert (=> b!233243 m!254689))

(assert (=> d!58869 m!254609))

(declare-fun m!254691 () Bool)

(assert (=> b!233261 m!254691))

(assert (=> b!233246 m!254649))

(assert (=> b!233246 m!254649))

(assert (=> b!233246 m!254651))

(declare-fun m!254693 () Bool)

(assert (=> bm!21691 m!254693))

(assert (=> b!233258 m!254649))

(declare-fun m!254695 () Bool)

(assert (=> b!233258 m!254695))

(assert (=> b!233258 m!254695))

(declare-fun m!254697 () Bool)

(assert (=> b!233258 m!254697))

(declare-fun m!254699 () Bool)

(assert (=> b!233258 m!254699))

(assert (=> b!233258 m!254697))

(assert (=> b!233258 m!254649))

(declare-fun m!254701 () Bool)

(assert (=> b!233258 m!254701))

(declare-fun m!254703 () Bool)

(assert (=> b!233254 m!254703))

(assert (=> b!233257 m!254649))

(assert (=> b!233257 m!254649))

(declare-fun m!254705 () Bool)

(assert (=> b!233257 m!254705))

(assert (=> b!233157 d!58869))

(declare-fun d!58871 () Bool)

(assert (=> d!58871 (= (array_inv!3615 (_keys!6393 thiss!1504)) (bvsge (size!5822 (_keys!6393 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233153 d!58871))

(declare-fun d!58873 () Bool)

(assert (=> d!58873 (= (array_inv!3616 (_values!4322 thiss!1504)) (bvsge (size!5821 (_values!4322 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233153 d!58873))

(declare-fun b!233278 () Bool)

(declare-fun e!151538 () SeekEntryResult!974)

(declare-fun lt!117999 () SeekEntryResult!974)

(assert (=> b!233278 (= e!151538 (Found!974 (index!6068 lt!117999)))))

(declare-fun e!151536 () SeekEntryResult!974)

(declare-fun b!233279 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11539 (_ BitVec 32)) SeekEntryResult!974)

(assert (=> b!233279 (= e!151536 (seekKeyOrZeroReturnVacant!0 (x!23602 lt!117999) (index!6068 lt!117999) (index!6068 lt!117999) key!932 (_keys!6393 thiss!1504) (mask!10261 thiss!1504)))))

(declare-fun b!233280 () Bool)

(assert (=> b!233280 (= e!151536 (MissingZero!974 (index!6068 lt!117999)))))

(declare-fun b!233281 () Bool)

(declare-fun e!151537 () SeekEntryResult!974)

(assert (=> b!233281 (= e!151537 e!151538)))

(declare-fun lt!118001 () (_ BitVec 64))

(assert (=> b!233281 (= lt!118001 (select (arr!5489 (_keys!6393 thiss!1504)) (index!6068 lt!117999)))))

(declare-fun c!38803 () Bool)

(assert (=> b!233281 (= c!38803 (= lt!118001 key!932))))

(declare-fun d!58875 () Bool)

(declare-fun lt!118000 () SeekEntryResult!974)

(assert (=> d!58875 (and (or ((_ is Undefined!974) lt!118000) (not ((_ is Found!974) lt!118000)) (and (bvsge (index!6067 lt!118000) #b00000000000000000000000000000000) (bvslt (index!6067 lt!118000) (size!5822 (_keys!6393 thiss!1504))))) (or ((_ is Undefined!974) lt!118000) ((_ is Found!974) lt!118000) (not ((_ is MissingZero!974) lt!118000)) (and (bvsge (index!6066 lt!118000) #b00000000000000000000000000000000) (bvslt (index!6066 lt!118000) (size!5822 (_keys!6393 thiss!1504))))) (or ((_ is Undefined!974) lt!118000) ((_ is Found!974) lt!118000) ((_ is MissingZero!974) lt!118000) (not ((_ is MissingVacant!974) lt!118000)) (and (bvsge (index!6069 lt!118000) #b00000000000000000000000000000000) (bvslt (index!6069 lt!118000) (size!5822 (_keys!6393 thiss!1504))))) (or ((_ is Undefined!974) lt!118000) (ite ((_ is Found!974) lt!118000) (= (select (arr!5489 (_keys!6393 thiss!1504)) (index!6067 lt!118000)) key!932) (ite ((_ is MissingZero!974) lt!118000) (= (select (arr!5489 (_keys!6393 thiss!1504)) (index!6066 lt!118000)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!974) lt!118000) (= (select (arr!5489 (_keys!6393 thiss!1504)) (index!6069 lt!118000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58875 (= lt!118000 e!151537)))

(declare-fun c!38805 () Bool)

(assert (=> d!58875 (= c!38805 (and ((_ is Intermediate!974) lt!117999) (undefined!1786 lt!117999)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11539 (_ BitVec 32)) SeekEntryResult!974)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58875 (= lt!117999 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10261 thiss!1504)) key!932 (_keys!6393 thiss!1504) (mask!10261 thiss!1504)))))

(assert (=> d!58875 (validMask!0 (mask!10261 thiss!1504))))

(assert (=> d!58875 (= (seekEntryOrOpen!0 key!932 (_keys!6393 thiss!1504) (mask!10261 thiss!1504)) lt!118000)))

(declare-fun b!233282 () Bool)

(assert (=> b!233282 (= e!151537 Undefined!974)))

(declare-fun b!233283 () Bool)

(declare-fun c!38804 () Bool)

(assert (=> b!233283 (= c!38804 (= lt!118001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233283 (= e!151538 e!151536)))

(assert (= (and d!58875 c!38805) b!233282))

(assert (= (and d!58875 (not c!38805)) b!233281))

(assert (= (and b!233281 c!38803) b!233278))

(assert (= (and b!233281 (not c!38803)) b!233283))

(assert (= (and b!233283 c!38804) b!233280))

(assert (= (and b!233283 (not c!38804)) b!233279))

(declare-fun m!254707 () Bool)

(assert (=> b!233279 m!254707))

(declare-fun m!254709 () Bool)

(assert (=> b!233281 m!254709))

(assert (=> d!58875 m!254609))

(declare-fun m!254711 () Bool)

(assert (=> d!58875 m!254711))

(declare-fun m!254713 () Bool)

(assert (=> d!58875 m!254713))

(declare-fun m!254715 () Bool)

(assert (=> d!58875 m!254715))

(declare-fun m!254717 () Bool)

(assert (=> d!58875 m!254717))

(declare-fun m!254719 () Bool)

(assert (=> d!58875 m!254719))

(assert (=> d!58875 m!254711))

(assert (=> b!233158 d!58875))

(declare-fun condMapEmpty!10396 () Bool)

(declare-fun mapDefault!10396 () ValueCell!2730)

(assert (=> mapNonEmpty!10390 (= condMapEmpty!10396 (= mapRest!10390 ((as const (Array (_ BitVec 32) ValueCell!2730)) mapDefault!10396)))))

(declare-fun e!151544 () Bool)

(declare-fun mapRes!10396 () Bool)

(assert (=> mapNonEmpty!10390 (= tp!21997 (and e!151544 mapRes!10396))))

(declare-fun b!233290 () Bool)

(declare-fun e!151543 () Bool)

(assert (=> b!233290 (= e!151543 tp_is_empty!6147)))

(declare-fun b!233291 () Bool)

(assert (=> b!233291 (= e!151544 tp_is_empty!6147)))

(declare-fun mapIsEmpty!10396 () Bool)

(assert (=> mapIsEmpty!10396 mapRes!10396))

(declare-fun mapNonEmpty!10396 () Bool)

(declare-fun tp!22006 () Bool)

(assert (=> mapNonEmpty!10396 (= mapRes!10396 (and tp!22006 e!151543))))

(declare-fun mapKey!10396 () (_ BitVec 32))

(declare-fun mapValue!10396 () ValueCell!2730)

(declare-fun mapRest!10396 () (Array (_ BitVec 32) ValueCell!2730))

(assert (=> mapNonEmpty!10396 (= mapRest!10390 (store mapRest!10396 mapKey!10396 mapValue!10396))))

(assert (= (and mapNonEmpty!10390 condMapEmpty!10396) mapIsEmpty!10396))

(assert (= (and mapNonEmpty!10390 (not condMapEmpty!10396)) mapNonEmpty!10396))

(assert (= (and mapNonEmpty!10396 ((_ is ValueCellFull!2730) mapValue!10396)) b!233290))

(assert (= (and mapNonEmpty!10390 ((_ is ValueCellFull!2730) mapDefault!10396)) b!233291))

(declare-fun m!254721 () Bool)

(assert (=> mapNonEmpty!10396 m!254721))

(declare-fun b_lambda!7845 () Bool)

(assert (= b_lambda!7843 (or (and b!233153 b_free!6285) b_lambda!7845)))

(check-sat (not d!58869) (not b!233189) (not b!233279) (not b!233198) (not bm!21694) (not b!233261) (not b!233243) (not d!58865) tp_is_empty!6147 (not b_lambda!7845) (not b!233263) (not mapNonEmpty!10396) (not d!58867) (not b_next!6285) (not b!233254) (not d!58875) (not bm!21691) (not b!233190) (not b!233200) (not b!233191) (not b!233257) b_and!13187 (not bm!21693) (not b!233258) (not bm!21695) (not b!233259) (not b!233246))
(check-sat b_and!13187 (not b_next!6285))
