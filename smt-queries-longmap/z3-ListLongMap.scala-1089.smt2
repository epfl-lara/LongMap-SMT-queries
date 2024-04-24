; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22220 () Bool)

(assert start!22220)

(declare-fun b!233178 () Bool)

(declare-fun b_free!6283 () Bool)

(declare-fun b_next!6283 () Bool)

(assert (=> b!233178 (= b_free!6283 (not b_next!6283))))

(declare-fun tp!21990 () Bool)

(declare-fun b_and!13195 () Bool)

(assert (=> b!233178 (= tp!21990 b_and!13195)))

(declare-fun b!233174 () Bool)

(declare-fun e!151457 () Bool)

(declare-fun tp_is_empty!6145 () Bool)

(assert (=> b!233174 (= e!151457 tp_is_empty!6145)))

(declare-fun res!114449 () Bool)

(declare-fun e!151461 () Bool)

(assert (=> start!22220 (=> (not res!114449) (not e!151461))))

(declare-datatypes ((V!7841 0))(
  ( (V!7842 (val!3117 Int)) )
))
(declare-datatypes ((ValueCell!2729 0))(
  ( (ValueCellFull!2729 (v!5138 V!7841)) (EmptyCell!2729) )
))
(declare-datatypes ((array!11531 0))(
  ( (array!11532 (arr!5485 (Array (_ BitVec 32) ValueCell!2729)) (size!5818 (_ BitVec 32))) )
))
(declare-datatypes ((array!11533 0))(
  ( (array!11534 (arr!5486 (Array (_ BitVec 32) (_ BitVec 64))) (size!5819 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3358 0))(
  ( (LongMapFixedSize!3359 (defaultEntry!4338 Int) (mask!10260 (_ BitVec 32)) (extraKeys!4075 (_ BitVec 32)) (zeroValue!4179 V!7841) (minValue!4179 V!7841) (_size!1728 (_ BitVec 32)) (_keys!6392 array!11533) (_values!4321 array!11531) (_vacant!1728 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3358)

(declare-fun valid!1342 (LongMapFixedSize!3358) Bool)

(assert (=> start!22220 (= res!114449 (valid!1342 thiss!1504))))

(assert (=> start!22220 e!151461))

(declare-fun e!151460 () Bool)

(assert (=> start!22220 e!151460))

(assert (=> start!22220 true))

(declare-fun b!233175 () Bool)

(declare-fun res!114448 () Bool)

(assert (=> b!233175 (=> (not res!114448) (not e!151461))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233175 (= res!114448 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233176 () Bool)

(declare-fun e!151459 () Bool)

(declare-fun e!151458 () Bool)

(declare-fun mapRes!10387 () Bool)

(assert (=> b!233176 (= e!151459 (and e!151458 mapRes!10387))))

(declare-fun condMapEmpty!10387 () Bool)

(declare-fun mapDefault!10387 () ValueCell!2729)

(assert (=> b!233176 (= condMapEmpty!10387 (= (arr!5485 (_values!4321 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2729)) mapDefault!10387)))))

(declare-fun mapNonEmpty!10387 () Bool)

(declare-fun tp!21991 () Bool)

(assert (=> mapNonEmpty!10387 (= mapRes!10387 (and tp!21991 e!151457))))

(declare-fun mapValue!10387 () ValueCell!2729)

(declare-fun mapKey!10387 () (_ BitVec 32))

(declare-fun mapRest!10387 () (Array (_ BitVec 32) ValueCell!2729))

(assert (=> mapNonEmpty!10387 (= (arr!5485 (_values!4321 thiss!1504)) (store mapRest!10387 mapKey!10387 mapValue!10387))))

(declare-fun b!233177 () Bool)

(declare-fun e!151463 () Bool)

(assert (=> b!233177 (= e!151461 e!151463)))

(declare-fun res!114451 () Bool)

(assert (=> b!233177 (=> (not res!114451) (not e!151463))))

(declare-datatypes ((SeekEntryResult!943 0))(
  ( (MissingZero!943 (index!5942 (_ BitVec 32))) (Found!943 (index!5943 (_ BitVec 32))) (Intermediate!943 (undefined!1755 Bool) (index!5944 (_ BitVec 32)) (x!23571 (_ BitVec 32))) (Undefined!943) (MissingVacant!943 (index!5945 (_ BitVec 32))) )
))
(declare-fun lt!117967 () SeekEntryResult!943)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233177 (= res!114451 (or (= lt!117967 (MissingZero!943 index!297)) (= lt!117967 (MissingVacant!943 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11533 (_ BitVec 32)) SeekEntryResult!943)

(assert (=> b!233177 (= lt!117967 (seekEntryOrOpen!0 key!932 (_keys!6392 thiss!1504) (mask!10260 thiss!1504)))))

(declare-fun array_inv!3595 (array!11533) Bool)

(declare-fun array_inv!3596 (array!11531) Bool)

(assert (=> b!233178 (= e!151460 (and tp!21990 tp_is_empty!6145 (array_inv!3595 (_keys!6392 thiss!1504)) (array_inv!3596 (_values!4321 thiss!1504)) e!151459))))

(declare-fun b!233179 () Bool)

(declare-fun res!114450 () Bool)

(assert (=> b!233179 (=> (not res!114450) (not e!151463))))

(declare-datatypes ((tuple2!4530 0))(
  ( (tuple2!4531 (_1!2276 (_ BitVec 64)) (_2!2276 V!7841)) )
))
(declare-datatypes ((List!3436 0))(
  ( (Nil!3433) (Cons!3432 (h!4080 tuple2!4530) (t!8387 List!3436)) )
))
(declare-datatypes ((ListLongMap!3445 0))(
  ( (ListLongMap!3446 (toList!1738 List!3436)) )
))
(declare-fun contains!1620 (ListLongMap!3445 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1270 (array!11533 array!11531 (_ BitVec 32) (_ BitVec 32) V!7841 V!7841 (_ BitVec 32) Int) ListLongMap!3445)

(assert (=> b!233179 (= res!114450 (contains!1620 (getCurrentListMap!1270 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10387 () Bool)

(assert (=> mapIsEmpty!10387 mapRes!10387))

(declare-fun b!233180 () Bool)

(assert (=> b!233180 (= e!151458 tp_is_empty!6145)))

(declare-fun b!233181 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233181 (= e!151463 (not (validMask!0 (mask!10260 thiss!1504))))))

(assert (= (and start!22220 res!114449) b!233175))

(assert (= (and b!233175 res!114448) b!233177))

(assert (= (and b!233177 res!114451) b!233179))

(assert (= (and b!233179 res!114450) b!233181))

(assert (= (and b!233176 condMapEmpty!10387) mapIsEmpty!10387))

(assert (= (and b!233176 (not condMapEmpty!10387)) mapNonEmpty!10387))

(get-info :version)

(assert (= (and mapNonEmpty!10387 ((_ is ValueCellFull!2729) mapValue!10387)) b!233174))

(assert (= (and b!233176 ((_ is ValueCellFull!2729) mapDefault!10387)) b!233180))

(assert (= b!233178 b!233176))

(assert (= start!22220 b!233178))

(declare-fun m!254767 () Bool)

(assert (=> b!233178 m!254767))

(declare-fun m!254769 () Bool)

(assert (=> b!233178 m!254769))

(declare-fun m!254771 () Bool)

(assert (=> start!22220 m!254771))

(declare-fun m!254773 () Bool)

(assert (=> b!233179 m!254773))

(assert (=> b!233179 m!254773))

(declare-fun m!254775 () Bool)

(assert (=> b!233179 m!254775))

(declare-fun m!254777 () Bool)

(assert (=> b!233177 m!254777))

(declare-fun m!254779 () Bool)

(assert (=> mapNonEmpty!10387 m!254779))

(declare-fun m!254781 () Bool)

(assert (=> b!233181 m!254781))

(check-sat (not b!233177) b_and!13195 tp_is_empty!6145 (not b!233178) (not b!233179) (not b_next!6283) (not b!233181) (not mapNonEmpty!10387) (not start!22220))
(check-sat b_and!13195 (not b_next!6283))
(get-model)

(declare-fun d!58937 () Bool)

(declare-fun res!114482 () Bool)

(declare-fun e!151508 () Bool)

(assert (=> d!58937 (=> (not res!114482) (not e!151508))))

(declare-fun simpleValid!226 (LongMapFixedSize!3358) Bool)

(assert (=> d!58937 (= res!114482 (simpleValid!226 thiss!1504))))

(assert (=> d!58937 (= (valid!1342 thiss!1504) e!151508)))

(declare-fun b!233236 () Bool)

(declare-fun res!114483 () Bool)

(assert (=> b!233236 (=> (not res!114483) (not e!151508))))

(declare-fun arrayCountValidKeys!0 (array!11533 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233236 (= res!114483 (= (arrayCountValidKeys!0 (_keys!6392 thiss!1504) #b00000000000000000000000000000000 (size!5819 (_keys!6392 thiss!1504))) (_size!1728 thiss!1504)))))

(declare-fun b!233237 () Bool)

(declare-fun res!114484 () Bool)

(assert (=> b!233237 (=> (not res!114484) (not e!151508))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11533 (_ BitVec 32)) Bool)

(assert (=> b!233237 (= res!114484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6392 thiss!1504) (mask!10260 thiss!1504)))))

(declare-fun b!233238 () Bool)

(declare-datatypes ((List!3438 0))(
  ( (Nil!3435) (Cons!3434 (h!4082 (_ BitVec 64)) (t!8391 List!3438)) )
))
(declare-fun arrayNoDuplicates!0 (array!11533 (_ BitVec 32) List!3438) Bool)

(assert (=> b!233238 (= e!151508 (arrayNoDuplicates!0 (_keys!6392 thiss!1504) #b00000000000000000000000000000000 Nil!3435))))

(assert (= (and d!58937 res!114482) b!233236))

(assert (= (and b!233236 res!114483) b!233237))

(assert (= (and b!233237 res!114484) b!233238))

(declare-fun m!254815 () Bool)

(assert (=> d!58937 m!254815))

(declare-fun m!254817 () Bool)

(assert (=> b!233236 m!254817))

(declare-fun m!254819 () Bool)

(assert (=> b!233237 m!254819))

(declare-fun m!254821 () Bool)

(assert (=> b!233238 m!254821))

(assert (=> start!22220 d!58937))

(declare-fun b!233251 () Bool)

(declare-fun e!151517 () SeekEntryResult!943)

(declare-fun lt!117980 () SeekEntryResult!943)

(assert (=> b!233251 (= e!151517 (MissingZero!943 (index!5944 lt!117980)))))

(declare-fun d!58939 () Bool)

(declare-fun lt!117981 () SeekEntryResult!943)

(assert (=> d!58939 (and (or ((_ is Undefined!943) lt!117981) (not ((_ is Found!943) lt!117981)) (and (bvsge (index!5943 lt!117981) #b00000000000000000000000000000000) (bvslt (index!5943 lt!117981) (size!5819 (_keys!6392 thiss!1504))))) (or ((_ is Undefined!943) lt!117981) ((_ is Found!943) lt!117981) (not ((_ is MissingZero!943) lt!117981)) (and (bvsge (index!5942 lt!117981) #b00000000000000000000000000000000) (bvslt (index!5942 lt!117981) (size!5819 (_keys!6392 thiss!1504))))) (or ((_ is Undefined!943) lt!117981) ((_ is Found!943) lt!117981) ((_ is MissingZero!943) lt!117981) (not ((_ is MissingVacant!943) lt!117981)) (and (bvsge (index!5945 lt!117981) #b00000000000000000000000000000000) (bvslt (index!5945 lt!117981) (size!5819 (_keys!6392 thiss!1504))))) (or ((_ is Undefined!943) lt!117981) (ite ((_ is Found!943) lt!117981) (= (select (arr!5486 (_keys!6392 thiss!1504)) (index!5943 lt!117981)) key!932) (ite ((_ is MissingZero!943) lt!117981) (= (select (arr!5486 (_keys!6392 thiss!1504)) (index!5942 lt!117981)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!943) lt!117981) (= (select (arr!5486 (_keys!6392 thiss!1504)) (index!5945 lt!117981)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!151515 () SeekEntryResult!943)

(assert (=> d!58939 (= lt!117981 e!151515)))

(declare-fun c!38796 () Bool)

(assert (=> d!58939 (= c!38796 (and ((_ is Intermediate!943) lt!117980) (undefined!1755 lt!117980)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11533 (_ BitVec 32)) SeekEntryResult!943)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58939 (= lt!117980 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10260 thiss!1504)) key!932 (_keys!6392 thiss!1504) (mask!10260 thiss!1504)))))

(assert (=> d!58939 (validMask!0 (mask!10260 thiss!1504))))

(assert (=> d!58939 (= (seekEntryOrOpen!0 key!932 (_keys!6392 thiss!1504) (mask!10260 thiss!1504)) lt!117981)))

(declare-fun b!233252 () Bool)

(declare-fun e!151516 () SeekEntryResult!943)

(assert (=> b!233252 (= e!151515 e!151516)))

(declare-fun lt!117982 () (_ BitVec 64))

(assert (=> b!233252 (= lt!117982 (select (arr!5486 (_keys!6392 thiss!1504)) (index!5944 lt!117980)))))

(declare-fun c!38797 () Bool)

(assert (=> b!233252 (= c!38797 (= lt!117982 key!932))))

(declare-fun b!233253 () Bool)

(assert (=> b!233253 (= e!151516 (Found!943 (index!5944 lt!117980)))))

(declare-fun b!233254 () Bool)

(assert (=> b!233254 (= e!151515 Undefined!943)))

(declare-fun b!233255 () Bool)

(declare-fun c!38795 () Bool)

(assert (=> b!233255 (= c!38795 (= lt!117982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233255 (= e!151516 e!151517)))

(declare-fun b!233256 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11533 (_ BitVec 32)) SeekEntryResult!943)

(assert (=> b!233256 (= e!151517 (seekKeyOrZeroReturnVacant!0 (x!23571 lt!117980) (index!5944 lt!117980) (index!5944 lt!117980) key!932 (_keys!6392 thiss!1504) (mask!10260 thiss!1504)))))

(assert (= (and d!58939 c!38796) b!233254))

(assert (= (and d!58939 (not c!38796)) b!233252))

(assert (= (and b!233252 c!38797) b!233253))

(assert (= (and b!233252 (not c!38797)) b!233255))

(assert (= (and b!233255 c!38795) b!233251))

(assert (= (and b!233255 (not c!38795)) b!233256))

(declare-fun m!254823 () Bool)

(assert (=> d!58939 m!254823))

(declare-fun m!254825 () Bool)

(assert (=> d!58939 m!254825))

(declare-fun m!254827 () Bool)

(assert (=> d!58939 m!254827))

(declare-fun m!254829 () Bool)

(assert (=> d!58939 m!254829))

(declare-fun m!254831 () Bool)

(assert (=> d!58939 m!254831))

(assert (=> d!58939 m!254825))

(assert (=> d!58939 m!254781))

(declare-fun m!254833 () Bool)

(assert (=> b!233252 m!254833))

(declare-fun m!254835 () Bool)

(assert (=> b!233256 m!254835))

(assert (=> b!233177 d!58939))

(declare-fun d!58941 () Bool)

(assert (=> d!58941 (= (validMask!0 (mask!10260 thiss!1504)) (and (or (= (mask!10260 thiss!1504) #b00000000000000000000000000000111) (= (mask!10260 thiss!1504) #b00000000000000000000000000001111) (= (mask!10260 thiss!1504) #b00000000000000000000000000011111) (= (mask!10260 thiss!1504) #b00000000000000000000000000111111) (= (mask!10260 thiss!1504) #b00000000000000000000000001111111) (= (mask!10260 thiss!1504) #b00000000000000000000000011111111) (= (mask!10260 thiss!1504) #b00000000000000000000000111111111) (= (mask!10260 thiss!1504) #b00000000000000000000001111111111) (= (mask!10260 thiss!1504) #b00000000000000000000011111111111) (= (mask!10260 thiss!1504) #b00000000000000000000111111111111) (= (mask!10260 thiss!1504) #b00000000000000000001111111111111) (= (mask!10260 thiss!1504) #b00000000000000000011111111111111) (= (mask!10260 thiss!1504) #b00000000000000000111111111111111) (= (mask!10260 thiss!1504) #b00000000000000001111111111111111) (= (mask!10260 thiss!1504) #b00000000000000011111111111111111) (= (mask!10260 thiss!1504) #b00000000000000111111111111111111) (= (mask!10260 thiss!1504) #b00000000000001111111111111111111) (= (mask!10260 thiss!1504) #b00000000000011111111111111111111) (= (mask!10260 thiss!1504) #b00000000000111111111111111111111) (= (mask!10260 thiss!1504) #b00000000001111111111111111111111) (= (mask!10260 thiss!1504) #b00000000011111111111111111111111) (= (mask!10260 thiss!1504) #b00000000111111111111111111111111) (= (mask!10260 thiss!1504) #b00000001111111111111111111111111) (= (mask!10260 thiss!1504) #b00000011111111111111111111111111) (= (mask!10260 thiss!1504) #b00000111111111111111111111111111) (= (mask!10260 thiss!1504) #b00001111111111111111111111111111) (= (mask!10260 thiss!1504) #b00011111111111111111111111111111) (= (mask!10260 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10260 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233181 d!58941))

(declare-fun d!58943 () Bool)

(assert (=> d!58943 (= (array_inv!3595 (_keys!6392 thiss!1504)) (bvsge (size!5819 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233178 d!58943))

(declare-fun d!58945 () Bool)

(assert (=> d!58945 (= (array_inv!3596 (_values!4321 thiss!1504)) (bvsge (size!5818 (_values!4321 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233178 d!58945))

(declare-fun d!58947 () Bool)

(declare-fun e!151523 () Bool)

(assert (=> d!58947 e!151523))

(declare-fun res!114487 () Bool)

(assert (=> d!58947 (=> res!114487 e!151523)))

(declare-fun lt!117992 () Bool)

(assert (=> d!58947 (= res!114487 (not lt!117992))))

(declare-fun lt!117991 () Bool)

(assert (=> d!58947 (= lt!117992 lt!117991)))

(declare-datatypes ((Unit!7199 0))(
  ( (Unit!7200) )
))
(declare-fun lt!117994 () Unit!7199)

(declare-fun e!151522 () Unit!7199)

(assert (=> d!58947 (= lt!117994 e!151522)))

(declare-fun c!38800 () Bool)

(assert (=> d!58947 (= c!38800 lt!117991)))

(declare-fun containsKey!253 (List!3436 (_ BitVec 64)) Bool)

(assert (=> d!58947 (= lt!117991 (containsKey!253 (toList!1738 (getCurrentListMap!1270 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932))))

(assert (=> d!58947 (= (contains!1620 (getCurrentListMap!1270 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)) key!932) lt!117992)))

(declare-fun b!233263 () Bool)

(declare-fun lt!117993 () Unit!7199)

(assert (=> b!233263 (= e!151522 lt!117993)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!201 (List!3436 (_ BitVec 64)) Unit!7199)

(assert (=> b!233263 (= lt!117993 (lemmaContainsKeyImpliesGetValueByKeyDefined!201 (toList!1738 (getCurrentListMap!1270 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932))))

(declare-datatypes ((Option!268 0))(
  ( (Some!267 (v!5141 V!7841)) (None!266) )
))
(declare-fun isDefined!202 (Option!268) Bool)

(declare-fun getValueByKey!262 (List!3436 (_ BitVec 64)) Option!268)

(assert (=> b!233263 (isDefined!202 (getValueByKey!262 (toList!1738 (getCurrentListMap!1270 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932))))

(declare-fun b!233264 () Bool)

(declare-fun Unit!7201 () Unit!7199)

(assert (=> b!233264 (= e!151522 Unit!7201)))

(declare-fun b!233265 () Bool)

(assert (=> b!233265 (= e!151523 (isDefined!202 (getValueByKey!262 (toList!1738 (getCurrentListMap!1270 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504))) key!932)))))

(assert (= (and d!58947 c!38800) b!233263))

(assert (= (and d!58947 (not c!38800)) b!233264))

(assert (= (and d!58947 (not res!114487)) b!233265))

(declare-fun m!254837 () Bool)

(assert (=> d!58947 m!254837))

(declare-fun m!254839 () Bool)

(assert (=> b!233263 m!254839))

(declare-fun m!254841 () Bool)

(assert (=> b!233263 m!254841))

(assert (=> b!233263 m!254841))

(declare-fun m!254843 () Bool)

(assert (=> b!233263 m!254843))

(assert (=> b!233265 m!254841))

(assert (=> b!233265 m!254841))

(assert (=> b!233265 m!254843))

(assert (=> b!233179 d!58947))

(declare-fun b!233308 () Bool)

(declare-fun e!151554 () ListLongMap!3445)

(declare-fun call!21686 () ListLongMap!3445)

(assert (=> b!233308 (= e!151554 call!21686)))

(declare-fun b!233309 () Bool)

(declare-fun e!151562 () Unit!7199)

(declare-fun Unit!7202 () Unit!7199)

(assert (=> b!233309 (= e!151562 Unit!7202)))

(declare-fun b!233310 () Bool)

(declare-fun e!151556 () ListLongMap!3445)

(assert (=> b!233310 (= e!151556 e!151554)))

(declare-fun c!38814 () Bool)

(assert (=> b!233310 (= c!38814 (and (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233311 () Bool)

(declare-fun e!151560 () ListLongMap!3445)

(assert (=> b!233311 (= e!151560 call!21686)))

(declare-fun bm!21678 () Bool)

(declare-fun call!21685 () ListLongMap!3445)

(declare-fun call!21682 () ListLongMap!3445)

(assert (=> bm!21678 (= call!21685 call!21682)))

(declare-fun b!233313 () Bool)

(declare-fun lt!118047 () Unit!7199)

(assert (=> b!233313 (= e!151562 lt!118047)))

(declare-fun lt!118056 () ListLongMap!3445)

(declare-fun getCurrentListMapNoExtraKeys!519 (array!11533 array!11531 (_ BitVec 32) (_ BitVec 32) V!7841 V!7841 (_ BitVec 32) Int) ListLongMap!3445)

(assert (=> b!233313 (= lt!118056 (getCurrentListMapNoExtraKeys!519 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!118052 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118059 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118059 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118042 () Unit!7199)

(declare-fun addStillContains!179 (ListLongMap!3445 (_ BitVec 64) V!7841 (_ BitVec 64)) Unit!7199)

(assert (=> b!233313 (= lt!118042 (addStillContains!179 lt!118056 lt!118052 (zeroValue!4179 thiss!1504) lt!118059))))

(declare-fun +!630 (ListLongMap!3445 tuple2!4530) ListLongMap!3445)

(assert (=> b!233313 (contains!1620 (+!630 lt!118056 (tuple2!4531 lt!118052 (zeroValue!4179 thiss!1504))) lt!118059)))

(declare-fun lt!118040 () Unit!7199)

(assert (=> b!233313 (= lt!118040 lt!118042)))

(declare-fun lt!118048 () ListLongMap!3445)

(assert (=> b!233313 (= lt!118048 (getCurrentListMapNoExtraKeys!519 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!118049 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118049 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118046 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118046 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118060 () Unit!7199)

(declare-fun addApplyDifferent!179 (ListLongMap!3445 (_ BitVec 64) V!7841 (_ BitVec 64)) Unit!7199)

(assert (=> b!233313 (= lt!118060 (addApplyDifferent!179 lt!118048 lt!118049 (minValue!4179 thiss!1504) lt!118046))))

(declare-fun apply!203 (ListLongMap!3445 (_ BitVec 64)) V!7841)

(assert (=> b!233313 (= (apply!203 (+!630 lt!118048 (tuple2!4531 lt!118049 (minValue!4179 thiss!1504))) lt!118046) (apply!203 lt!118048 lt!118046))))

(declare-fun lt!118041 () Unit!7199)

(assert (=> b!233313 (= lt!118041 lt!118060)))

(declare-fun lt!118044 () ListLongMap!3445)

(assert (=> b!233313 (= lt!118044 (getCurrentListMapNoExtraKeys!519 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!118057 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118057 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118045 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118045 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118043 () Unit!7199)

(assert (=> b!233313 (= lt!118043 (addApplyDifferent!179 lt!118044 lt!118057 (zeroValue!4179 thiss!1504) lt!118045))))

(assert (=> b!233313 (= (apply!203 (+!630 lt!118044 (tuple2!4531 lt!118057 (zeroValue!4179 thiss!1504))) lt!118045) (apply!203 lt!118044 lt!118045))))

(declare-fun lt!118055 () Unit!7199)

(assert (=> b!233313 (= lt!118055 lt!118043)))

(declare-fun lt!118053 () ListLongMap!3445)

(assert (=> b!233313 (= lt!118053 (getCurrentListMapNoExtraKeys!519 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun lt!118050 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118050 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118058 () (_ BitVec 64))

(assert (=> b!233313 (= lt!118058 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233313 (= lt!118047 (addApplyDifferent!179 lt!118053 lt!118050 (minValue!4179 thiss!1504) lt!118058))))

(assert (=> b!233313 (= (apply!203 (+!630 lt!118053 (tuple2!4531 lt!118050 (minValue!4179 thiss!1504))) lt!118058) (apply!203 lt!118053 lt!118058))))

(declare-fun bm!21679 () Bool)

(assert (=> bm!21679 (= call!21682 (getCurrentListMapNoExtraKeys!519 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)))))

(declare-fun b!233314 () Bool)

(declare-fun res!114514 () Bool)

(declare-fun e!151553 () Bool)

(assert (=> b!233314 (=> (not res!114514) (not e!151553))))

(declare-fun e!151558 () Bool)

(assert (=> b!233314 (= res!114514 e!151558)))

(declare-fun c!38813 () Bool)

(assert (=> b!233314 (= c!38813 (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!58949 () Bool)

(assert (=> d!58949 e!151553))

(declare-fun res!114506 () Bool)

(assert (=> d!58949 (=> (not res!114506) (not e!151553))))

(assert (=> d!58949 (= res!114506 (or (bvsge #b00000000000000000000000000000000 (size!5819 (_keys!6392 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5819 (_keys!6392 thiss!1504))))))))

(declare-fun lt!118051 () ListLongMap!3445)

(declare-fun lt!118039 () ListLongMap!3445)

(assert (=> d!58949 (= lt!118051 lt!118039)))

(declare-fun lt!118054 () Unit!7199)

(assert (=> d!58949 (= lt!118054 e!151562)))

(declare-fun c!38815 () Bool)

(declare-fun e!151559 () Bool)

(assert (=> d!58949 (= c!38815 e!151559)))

(declare-fun res!114513 () Bool)

(assert (=> d!58949 (=> (not res!114513) (not e!151559))))

(assert (=> d!58949 (= res!114513 (bvslt #b00000000000000000000000000000000 (size!5819 (_keys!6392 thiss!1504))))))

(assert (=> d!58949 (= lt!118039 e!151556)))

(declare-fun c!38816 () Bool)

(assert (=> d!58949 (= c!38816 (and (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58949 (validMask!0 (mask!10260 thiss!1504))))

(assert (=> d!58949 (= (getCurrentListMap!1270 (_keys!6392 thiss!1504) (_values!4321 thiss!1504) (mask!10260 thiss!1504) (extraKeys!4075 thiss!1504) (zeroValue!4179 thiss!1504) (minValue!4179 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4338 thiss!1504)) lt!118051)))

(declare-fun b!233312 () Bool)

(declare-fun e!151561 () Bool)

(assert (=> b!233312 (= e!151561 (= (apply!203 lt!118051 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4179 thiss!1504)))))

(declare-fun b!233315 () Bool)

(declare-fun e!151557 () Bool)

(assert (=> b!233315 (= e!151553 e!151557)))

(declare-fun c!38817 () Bool)

(assert (=> b!233315 (= c!38817 (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233316 () Bool)

(declare-fun call!21683 () Bool)

(assert (=> b!233316 (= e!151558 (not call!21683))))

(declare-fun b!233317 () Bool)

(declare-fun e!151551 () Bool)

(declare-fun get!2816 (ValueCell!2729 V!7841) V!7841)

(declare-fun dynLambda!546 (Int (_ BitVec 64)) V!7841)

(assert (=> b!233317 (= e!151551 (= (apply!203 lt!118051 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000)) (get!2816 (select (arr!5485 (_values!4321 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!546 (defaultEntry!4338 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5818 (_values!4321 thiss!1504))))))

(assert (=> b!233317 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5819 (_keys!6392 thiss!1504))))))

(declare-fun b!233318 () Bool)

(declare-fun e!151550 () Bool)

(assert (=> b!233318 (= e!151557 e!151550)))

(declare-fun res!114511 () Bool)

(declare-fun call!21684 () Bool)

(assert (=> b!233318 (= res!114511 call!21684)))

(assert (=> b!233318 (=> (not res!114511) (not e!151550))))

(declare-fun bm!21680 () Bool)

(declare-fun call!21681 () ListLongMap!3445)

(assert (=> bm!21680 (= call!21681 call!21685)))

(declare-fun b!233319 () Bool)

(declare-fun c!38818 () Bool)

(assert (=> b!233319 (= c!38818 (and (not (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4075 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!233319 (= e!151554 e!151560)))

(declare-fun b!233320 () Bool)

(assert (=> b!233320 (= e!151560 call!21681)))

(declare-fun bm!21681 () Bool)

(declare-fun call!21687 () ListLongMap!3445)

(assert (=> bm!21681 (= call!21687 (+!630 (ite c!38816 call!21682 (ite c!38814 call!21685 call!21681)) (ite (or c!38816 c!38814) (tuple2!4531 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4179 thiss!1504)) (tuple2!4531 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4179 thiss!1504)))))))

(declare-fun bm!21682 () Bool)

(assert (=> bm!21682 (= call!21684 (contains!1620 lt!118051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233321 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233321 (= e!151559 (validKeyInArray!0 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21683 () Bool)

(assert (=> bm!21683 (= call!21683 (contains!1620 lt!118051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233322 () Bool)

(declare-fun e!151555 () Bool)

(assert (=> b!233322 (= e!151555 e!151551)))

(declare-fun res!114508 () Bool)

(assert (=> b!233322 (=> (not res!114508) (not e!151551))))

(assert (=> b!233322 (= res!114508 (contains!1620 lt!118051 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5819 (_keys!6392 thiss!1504))))))

(declare-fun b!233323 () Bool)

(declare-fun e!151552 () Bool)

(assert (=> b!233323 (= e!151552 (validKeyInArray!0 (select (arr!5486 (_keys!6392 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233324 () Bool)

(declare-fun res!114507 () Bool)

(assert (=> b!233324 (=> (not res!114507) (not e!151553))))

(assert (=> b!233324 (= res!114507 e!151555)))

(declare-fun res!114509 () Bool)

(assert (=> b!233324 (=> res!114509 e!151555)))

(assert (=> b!233324 (= res!114509 (not e!151552))))

(declare-fun res!114512 () Bool)

(assert (=> b!233324 (=> (not res!114512) (not e!151552))))

(assert (=> b!233324 (= res!114512 (bvslt #b00000000000000000000000000000000 (size!5819 (_keys!6392 thiss!1504))))))

(declare-fun b!233325 () Bool)

(assert (=> b!233325 (= e!151556 (+!630 call!21687 (tuple2!4531 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4179 thiss!1504))))))

(declare-fun b!233326 () Bool)

(assert (=> b!233326 (= e!151558 e!151561)))

(declare-fun res!114510 () Bool)

(assert (=> b!233326 (= res!114510 call!21683)))

(assert (=> b!233326 (=> (not res!114510) (not e!151561))))

(declare-fun bm!21684 () Bool)

(assert (=> bm!21684 (= call!21686 call!21687)))

(declare-fun b!233327 () Bool)

(assert (=> b!233327 (= e!151550 (= (apply!203 lt!118051 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4179 thiss!1504)))))

(declare-fun b!233328 () Bool)

(assert (=> b!233328 (= e!151557 (not call!21684))))

(assert (= (and d!58949 c!38816) b!233325))

(assert (= (and d!58949 (not c!38816)) b!233310))

(assert (= (and b!233310 c!38814) b!233308))

(assert (= (and b!233310 (not c!38814)) b!233319))

(assert (= (and b!233319 c!38818) b!233311))

(assert (= (and b!233319 (not c!38818)) b!233320))

(assert (= (or b!233311 b!233320) bm!21680))

(assert (= (or b!233308 bm!21680) bm!21678))

(assert (= (or b!233308 b!233311) bm!21684))

(assert (= (or b!233325 bm!21678) bm!21679))

(assert (= (or b!233325 bm!21684) bm!21681))

(assert (= (and d!58949 res!114513) b!233321))

(assert (= (and d!58949 c!38815) b!233313))

(assert (= (and d!58949 (not c!38815)) b!233309))

(assert (= (and d!58949 res!114506) b!233324))

(assert (= (and b!233324 res!114512) b!233323))

(assert (= (and b!233324 (not res!114509)) b!233322))

(assert (= (and b!233322 res!114508) b!233317))

(assert (= (and b!233324 res!114507) b!233314))

(assert (= (and b!233314 c!38813) b!233326))

(assert (= (and b!233314 (not c!38813)) b!233316))

(assert (= (and b!233326 res!114510) b!233312))

(assert (= (or b!233326 b!233316) bm!21683))

(assert (= (and b!233314 res!114514) b!233315))

(assert (= (and b!233315 c!38817) b!233318))

(assert (= (and b!233315 (not c!38817)) b!233328))

(assert (= (and b!233318 res!114511) b!233327))

(assert (= (or b!233318 b!233328) bm!21682))

(declare-fun b_lambda!7865 () Bool)

(assert (=> (not b_lambda!7865) (not b!233317)))

(declare-fun t!8390 () Bool)

(declare-fun tb!2911 () Bool)

(assert (=> (and b!233178 (= (defaultEntry!4338 thiss!1504) (defaultEntry!4338 thiss!1504)) t!8390) tb!2911))

(declare-fun result!5071 () Bool)

(assert (=> tb!2911 (= result!5071 tp_is_empty!6145)))

(assert (=> b!233317 t!8390))

(declare-fun b_and!13201 () Bool)

(assert (= b_and!13195 (and (=> t!8390 result!5071) b_and!13201)))

(declare-fun m!254845 () Bool)

(assert (=> b!233312 m!254845))

(declare-fun m!254847 () Bool)

(assert (=> b!233317 m!254847))

(declare-fun m!254849 () Bool)

(assert (=> b!233317 m!254849))

(declare-fun m!254851 () Bool)

(assert (=> b!233317 m!254851))

(declare-fun m!254853 () Bool)

(assert (=> b!233317 m!254853))

(assert (=> b!233317 m!254849))

(assert (=> b!233317 m!254847))

(declare-fun m!254855 () Bool)

(assert (=> b!233317 m!254855))

(assert (=> b!233317 m!254851))

(declare-fun m!254857 () Bool)

(assert (=> b!233327 m!254857))

(assert (=> d!58949 m!254781))

(declare-fun m!254859 () Bool)

(assert (=> b!233325 m!254859))

(declare-fun m!254861 () Bool)

(assert (=> bm!21682 m!254861))

(assert (=> b!233322 m!254851))

(assert (=> b!233322 m!254851))

(declare-fun m!254863 () Bool)

(assert (=> b!233322 m!254863))

(assert (=> b!233323 m!254851))

(assert (=> b!233323 m!254851))

(declare-fun m!254865 () Bool)

(assert (=> b!233323 m!254865))

(declare-fun m!254867 () Bool)

(assert (=> bm!21681 m!254867))

(assert (=> b!233321 m!254851))

(assert (=> b!233321 m!254851))

(assert (=> b!233321 m!254865))

(declare-fun m!254869 () Bool)

(assert (=> b!233313 m!254869))

(declare-fun m!254871 () Bool)

(assert (=> b!233313 m!254871))

(declare-fun m!254873 () Bool)

(assert (=> b!233313 m!254873))

(declare-fun m!254875 () Bool)

(assert (=> b!233313 m!254875))

(declare-fun m!254877 () Bool)

(assert (=> b!233313 m!254877))

(declare-fun m!254879 () Bool)

(assert (=> b!233313 m!254879))

(assert (=> b!233313 m!254869))

(declare-fun m!254881 () Bool)

(assert (=> b!233313 m!254881))

(declare-fun m!254883 () Bool)

(assert (=> b!233313 m!254883))

(declare-fun m!254885 () Bool)

(assert (=> b!233313 m!254885))

(assert (=> b!233313 m!254851))

(declare-fun m!254887 () Bool)

(assert (=> b!233313 m!254887))

(declare-fun m!254889 () Bool)

(assert (=> b!233313 m!254889))

(declare-fun m!254891 () Bool)

(assert (=> b!233313 m!254891))

(declare-fun m!254893 () Bool)

(assert (=> b!233313 m!254893))

(assert (=> b!233313 m!254887))

(declare-fun m!254895 () Bool)

(assert (=> b!233313 m!254895))

(declare-fun m!254897 () Bool)

(assert (=> b!233313 m!254897))

(assert (=> b!233313 m!254877))

(declare-fun m!254899 () Bool)

(assert (=> b!233313 m!254899))

(assert (=> b!233313 m!254895))

(assert (=> bm!21679 m!254881))

(declare-fun m!254901 () Bool)

(assert (=> bm!21683 m!254901))

(assert (=> b!233179 d!58949))

(declare-fun b!233338 () Bool)

(declare-fun e!151568 () Bool)

(assert (=> b!233338 (= e!151568 tp_is_empty!6145)))

(declare-fun mapIsEmpty!10396 () Bool)

(declare-fun mapRes!10396 () Bool)

(assert (=> mapIsEmpty!10396 mapRes!10396))

(declare-fun mapNonEmpty!10396 () Bool)

(declare-fun tp!22006 () Bool)

(declare-fun e!151567 () Bool)

(assert (=> mapNonEmpty!10396 (= mapRes!10396 (and tp!22006 e!151567))))

(declare-fun mapValue!10396 () ValueCell!2729)

(declare-fun mapRest!10396 () (Array (_ BitVec 32) ValueCell!2729))

(declare-fun mapKey!10396 () (_ BitVec 32))

(assert (=> mapNonEmpty!10396 (= mapRest!10387 (store mapRest!10396 mapKey!10396 mapValue!10396))))

(declare-fun condMapEmpty!10396 () Bool)

(declare-fun mapDefault!10396 () ValueCell!2729)

(assert (=> mapNonEmpty!10387 (= condMapEmpty!10396 (= mapRest!10387 ((as const (Array (_ BitVec 32) ValueCell!2729)) mapDefault!10396)))))

(assert (=> mapNonEmpty!10387 (= tp!21991 (and e!151568 mapRes!10396))))

(declare-fun b!233337 () Bool)

(assert (=> b!233337 (= e!151567 tp_is_empty!6145)))

(assert (= (and mapNonEmpty!10387 condMapEmpty!10396) mapIsEmpty!10396))

(assert (= (and mapNonEmpty!10387 (not condMapEmpty!10396)) mapNonEmpty!10396))

(assert (= (and mapNonEmpty!10396 ((_ is ValueCellFull!2729) mapValue!10396)) b!233337))

(assert (= (and mapNonEmpty!10387 ((_ is ValueCellFull!2729) mapDefault!10396)) b!233338))

(declare-fun m!254903 () Bool)

(assert (=> mapNonEmpty!10396 m!254903))

(declare-fun b_lambda!7867 () Bool)

(assert (= b_lambda!7865 (or (and b!233178 b_free!6283) b_lambda!7867)))

(check-sat (not b_lambda!7867) (not b!233327) (not d!58937) (not b!233312) (not d!58949) (not d!58939) (not b!233317) (not b!233236) (not b!233322) (not b!233313) (not b!233238) (not bm!21679) (not bm!21683) (not bm!21681) tp_is_empty!6145 (not b!233323) (not b!233321) (not d!58947) (not bm!21682) (not b_next!6283) (not b!233256) b_and!13201 (not b!233265) (not b!233237) (not b!233325) (not mapNonEmpty!10396) (not b!233263))
(check-sat b_and!13201 (not b_next!6283))
