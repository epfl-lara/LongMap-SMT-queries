; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22238 () Bool)

(assert start!22238)

(declare-fun b!233344 () Bool)

(declare-fun b_free!6291 () Bool)

(declare-fun b_next!6291 () Bool)

(assert (=> b!233344 (= b_free!6291 (not b_next!6291))))

(declare-fun tp!22017 () Bool)

(declare-fun b_and!13191 () Bool)

(assert (=> b!233344 (= tp!22017 b_and!13191)))

(declare-fun b!233337 () Bool)

(declare-fun e!151583 () Bool)

(declare-fun e!151580 () Bool)

(declare-fun mapRes!10402 () Bool)

(assert (=> b!233337 (= e!151583 (and e!151580 mapRes!10402))))

(declare-fun condMapEmpty!10402 () Bool)

(declare-datatypes ((V!7851 0))(
  ( (V!7852 (val!3121 Int)) )
))
(declare-datatypes ((ValueCell!2733 0))(
  ( (ValueCellFull!2733 (v!5142 V!7851)) (EmptyCell!2733) )
))
(declare-datatypes ((array!11551 0))(
  ( (array!11552 (arr!5494 (Array (_ BitVec 32) ValueCell!2733)) (size!5827 (_ BitVec 32))) )
))
(declare-datatypes ((array!11553 0))(
  ( (array!11554 (arr!5495 (Array (_ BitVec 32) (_ BitVec 64))) (size!5828 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3366 0))(
  ( (LongMapFixedSize!3367 (defaultEntry!4343 Int) (mask!10269 (_ BitVec 32)) (extraKeys!4080 (_ BitVec 32)) (zeroValue!4184 V!7851) (minValue!4184 V!7851) (_size!1732 (_ BitVec 32)) (_keys!6398 array!11553) (_values!4326 array!11551) (_vacant!1732 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3366)

(declare-fun mapDefault!10402 () ValueCell!2733)

(assert (=> b!233337 (= condMapEmpty!10402 (= (arr!5494 (_values!4326 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2733)) mapDefault!10402)))))

(declare-fun b!233338 () Bool)

(declare-fun res!114520 () Bool)

(declare-fun e!151584 () Bool)

(assert (=> b!233338 (=> (not res!114520) (not e!151584))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4604 0))(
  ( (tuple2!4605 (_1!2313 (_ BitVec 64)) (_2!2313 V!7851)) )
))
(declare-datatypes ((List!3516 0))(
  ( (Nil!3513) (Cons!3512 (h!4160 tuple2!4604) (t!8477 List!3516)) )
))
(declare-datatypes ((ListLongMap!3517 0))(
  ( (ListLongMap!3518 (toList!1774 List!3516)) )
))
(declare-fun contains!1642 (ListLongMap!3517 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1302 (array!11553 array!11551 (_ BitVec 32) (_ BitVec 32) V!7851 V!7851 (_ BitVec 32) Int) ListLongMap!3517)

(assert (=> b!233338 (= res!114520 (contains!1642 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)) key!932))))

(declare-fun b!233339 () Bool)

(declare-fun e!151586 () Bool)

(assert (=> b!233339 (= e!151586 e!151584)))

(declare-fun res!114522 () Bool)

(assert (=> b!233339 (=> (not res!114522) (not e!151584))))

(declare-datatypes ((SeekEntryResult!976 0))(
  ( (MissingZero!976 (index!6074 (_ BitVec 32))) (Found!976 (index!6075 (_ BitVec 32))) (Intermediate!976 (undefined!1788 Bool) (index!6076 (_ BitVec 32)) (x!23622 (_ BitVec 32))) (Undefined!976) (MissingVacant!976 (index!6077 (_ BitVec 32))) )
))
(declare-fun lt!118007 () SeekEntryResult!976)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233339 (= res!114522 (or (= lt!118007 (MissingZero!976 index!297)) (= lt!118007 (MissingVacant!976 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11553 (_ BitVec 32)) SeekEntryResult!976)

(assert (=> b!233339 (= lt!118007 (seekEntryOrOpen!0 key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)))))

(declare-fun mapIsEmpty!10402 () Bool)

(assert (=> mapIsEmpty!10402 mapRes!10402))

(declare-fun b!233340 () Bool)

(declare-fun e!151585 () Bool)

(declare-fun tp_is_empty!6153 () Bool)

(assert (=> b!233340 (= e!151585 tp_is_empty!6153)))

(declare-fun b!233342 () Bool)

(assert (=> b!233342 (= e!151580 tp_is_empty!6153)))

(declare-fun b!233343 () Bool)

(declare-fun res!114523 () Bool)

(assert (=> b!233343 (=> (not res!114523) (not e!151584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233343 (= res!114523 (validMask!0 (mask!10269 thiss!1504)))))

(declare-fun e!151581 () Bool)

(declare-fun array_inv!3619 (array!11553) Bool)

(declare-fun array_inv!3620 (array!11551) Bool)

(assert (=> b!233344 (= e!151581 (and tp!22017 tp_is_empty!6153 (array_inv!3619 (_keys!6398 thiss!1504)) (array_inv!3620 (_values!4326 thiss!1504)) e!151583))))

(declare-fun mapNonEmpty!10402 () Bool)

(declare-fun tp!22018 () Bool)

(assert (=> mapNonEmpty!10402 (= mapRes!10402 (and tp!22018 e!151585))))

(declare-fun mapValue!10402 () ValueCell!2733)

(declare-fun mapKey!10402 () (_ BitVec 32))

(declare-fun mapRest!10402 () (Array (_ BitVec 32) ValueCell!2733))

(assert (=> mapNonEmpty!10402 (= (arr!5494 (_values!4326 thiss!1504)) (store mapRest!10402 mapKey!10402 mapValue!10402))))

(declare-fun b!233345 () Bool)

(assert (=> b!233345 (= e!151584 (not (= (size!5827 (_values!4326 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10269 thiss!1504)))))))

(declare-fun res!114519 () Bool)

(assert (=> start!22238 (=> (not res!114519) (not e!151586))))

(declare-fun valid!1329 (LongMapFixedSize!3366) Bool)

(assert (=> start!22238 (= res!114519 (valid!1329 thiss!1504))))

(assert (=> start!22238 e!151586))

(assert (=> start!22238 e!151581))

(assert (=> start!22238 true))

(declare-fun b!233341 () Bool)

(declare-fun res!114521 () Bool)

(assert (=> b!233341 (=> (not res!114521) (not e!151586))))

(assert (=> b!233341 (= res!114521 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!22238 res!114519) b!233341))

(assert (= (and b!233341 res!114521) b!233339))

(assert (= (and b!233339 res!114522) b!233338))

(assert (= (and b!233338 res!114520) b!233343))

(assert (= (and b!233343 res!114523) b!233345))

(assert (= (and b!233337 condMapEmpty!10402) mapIsEmpty!10402))

(assert (= (and b!233337 (not condMapEmpty!10402)) mapNonEmpty!10402))

(get-info :version)

(assert (= (and mapNonEmpty!10402 ((_ is ValueCellFull!2733) mapValue!10402)) b!233340))

(assert (= (and b!233337 ((_ is ValueCellFull!2733) mapDefault!10402)) b!233342))

(assert (= b!233344 b!233337))

(assert (= start!22238 b!233344))

(declare-fun m!254739 () Bool)

(assert (=> b!233344 m!254739))

(declare-fun m!254741 () Bool)

(assert (=> b!233344 m!254741))

(declare-fun m!254743 () Bool)

(assert (=> b!233343 m!254743))

(declare-fun m!254745 () Bool)

(assert (=> b!233339 m!254745))

(declare-fun m!254747 () Bool)

(assert (=> b!233338 m!254747))

(assert (=> b!233338 m!254747))

(declare-fun m!254749 () Bool)

(assert (=> b!233338 m!254749))

(declare-fun m!254751 () Bool)

(assert (=> start!22238 m!254751))

(declare-fun m!254753 () Bool)

(assert (=> mapNonEmpty!10402 m!254753))

(check-sat (not b_next!6291) (not start!22238) (not mapNonEmpty!10402) (not b!233339) tp_is_empty!6153 (not b!233343) b_and!13191 (not b!233338) (not b!233344))
(check-sat b_and!13191 (not b_next!6291))
(get-model)

(declare-fun d!58879 () Bool)

(assert (=> d!58879 (= (array_inv!3619 (_keys!6398 thiss!1504)) (bvsge (size!5828 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233344 d!58879))

(declare-fun d!58881 () Bool)

(assert (=> d!58881 (= (array_inv!3620 (_values!4326 thiss!1504)) (bvsge (size!5827 (_values!4326 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233344 d!58881))

(declare-fun d!58883 () Bool)

(declare-fun res!114545 () Bool)

(declare-fun e!151610 () Bool)

(assert (=> d!58883 (=> (not res!114545) (not e!151610))))

(declare-fun simpleValid!227 (LongMapFixedSize!3366) Bool)

(assert (=> d!58883 (= res!114545 (simpleValid!227 thiss!1504))))

(assert (=> d!58883 (= (valid!1329 thiss!1504) e!151610)))

(declare-fun b!233379 () Bool)

(declare-fun res!114546 () Bool)

(assert (=> b!233379 (=> (not res!114546) (not e!151610))))

(declare-fun arrayCountValidKeys!0 (array!11553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233379 (= res!114546 (= (arrayCountValidKeys!0 (_keys!6398 thiss!1504) #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))) (_size!1732 thiss!1504)))))

(declare-fun b!233380 () Bool)

(declare-fun res!114547 () Bool)

(assert (=> b!233380 (=> (not res!114547) (not e!151610))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11553 (_ BitVec 32)) Bool)

(assert (=> b!233380 (= res!114547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)))))

(declare-fun b!233381 () Bool)

(declare-datatypes ((List!3517 0))(
  ( (Nil!3514) (Cons!3513 (h!4161 (_ BitVec 64)) (t!8480 List!3517)) )
))
(declare-fun arrayNoDuplicates!0 (array!11553 (_ BitVec 32) List!3517) Bool)

(assert (=> b!233381 (= e!151610 (arrayNoDuplicates!0 (_keys!6398 thiss!1504) #b00000000000000000000000000000000 Nil!3514))))

(assert (= (and d!58883 res!114545) b!233379))

(assert (= (and b!233379 res!114546) b!233380))

(assert (= (and b!233380 res!114547) b!233381))

(declare-fun m!254771 () Bool)

(assert (=> d!58883 m!254771))

(declare-fun m!254773 () Bool)

(assert (=> b!233379 m!254773))

(declare-fun m!254775 () Bool)

(assert (=> b!233380 m!254775))

(declare-fun m!254777 () Bool)

(assert (=> b!233381 m!254777))

(assert (=> start!22238 d!58883))

(declare-fun b!233394 () Bool)

(declare-fun e!151618 () SeekEntryResult!976)

(declare-fun lt!118017 () SeekEntryResult!976)

(assert (=> b!233394 (= e!151618 (MissingZero!976 (index!6076 lt!118017)))))

(declare-fun b!233395 () Bool)

(declare-fun e!151617 () SeekEntryResult!976)

(declare-fun e!151619 () SeekEntryResult!976)

(assert (=> b!233395 (= e!151617 e!151619)))

(declare-fun lt!118018 () (_ BitVec 64))

(assert (=> b!233395 (= lt!118018 (select (arr!5495 (_keys!6398 thiss!1504)) (index!6076 lt!118017)))))

(declare-fun c!38812 () Bool)

(assert (=> b!233395 (= c!38812 (= lt!118018 key!932))))

(declare-fun b!233397 () Bool)

(assert (=> b!233397 (= e!151619 (Found!976 (index!6076 lt!118017)))))

(declare-fun b!233398 () Bool)

(declare-fun c!38814 () Bool)

(assert (=> b!233398 (= c!38814 (= lt!118018 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233398 (= e!151619 e!151618)))

(declare-fun b!233399 () Bool)

(assert (=> b!233399 (= e!151617 Undefined!976)))

(declare-fun b!233396 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11553 (_ BitVec 32)) SeekEntryResult!976)

(assert (=> b!233396 (= e!151618 (seekKeyOrZeroReturnVacant!0 (x!23622 lt!118017) (index!6076 lt!118017) (index!6076 lt!118017) key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)))))

(declare-fun d!58885 () Bool)

(declare-fun lt!118019 () SeekEntryResult!976)

(assert (=> d!58885 (and (or ((_ is Undefined!976) lt!118019) (not ((_ is Found!976) lt!118019)) (and (bvsge (index!6075 lt!118019) #b00000000000000000000000000000000) (bvslt (index!6075 lt!118019) (size!5828 (_keys!6398 thiss!1504))))) (or ((_ is Undefined!976) lt!118019) ((_ is Found!976) lt!118019) (not ((_ is MissingZero!976) lt!118019)) (and (bvsge (index!6074 lt!118019) #b00000000000000000000000000000000) (bvslt (index!6074 lt!118019) (size!5828 (_keys!6398 thiss!1504))))) (or ((_ is Undefined!976) lt!118019) ((_ is Found!976) lt!118019) ((_ is MissingZero!976) lt!118019) (not ((_ is MissingVacant!976) lt!118019)) (and (bvsge (index!6077 lt!118019) #b00000000000000000000000000000000) (bvslt (index!6077 lt!118019) (size!5828 (_keys!6398 thiss!1504))))) (or ((_ is Undefined!976) lt!118019) (ite ((_ is Found!976) lt!118019) (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6075 lt!118019)) key!932) (ite ((_ is MissingZero!976) lt!118019) (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6074 lt!118019)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!976) lt!118019) (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6077 lt!118019)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!58885 (= lt!118019 e!151617)))

(declare-fun c!38813 () Bool)

(assert (=> d!58885 (= c!38813 (and ((_ is Intermediate!976) lt!118017) (undefined!1788 lt!118017)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11553 (_ BitVec 32)) SeekEntryResult!976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!58885 (= lt!118017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10269 thiss!1504)) key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)))))

(assert (=> d!58885 (validMask!0 (mask!10269 thiss!1504))))

(assert (=> d!58885 (= (seekEntryOrOpen!0 key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)) lt!118019)))

(assert (= (and d!58885 c!38813) b!233399))

(assert (= (and d!58885 (not c!38813)) b!233395))

(assert (= (and b!233395 c!38812) b!233397))

(assert (= (and b!233395 (not c!38812)) b!233398))

(assert (= (and b!233398 c!38814) b!233394))

(assert (= (and b!233398 (not c!38814)) b!233396))

(declare-fun m!254779 () Bool)

(assert (=> b!233395 m!254779))

(declare-fun m!254781 () Bool)

(assert (=> b!233396 m!254781))

(declare-fun m!254783 () Bool)

(assert (=> d!58885 m!254783))

(declare-fun m!254785 () Bool)

(assert (=> d!58885 m!254785))

(assert (=> d!58885 m!254783))

(declare-fun m!254787 () Bool)

(assert (=> d!58885 m!254787))

(declare-fun m!254789 () Bool)

(assert (=> d!58885 m!254789))

(declare-fun m!254791 () Bool)

(assert (=> d!58885 m!254791))

(assert (=> d!58885 m!254743))

(assert (=> b!233339 d!58885))

(declare-fun d!58887 () Bool)

(assert (=> d!58887 (= (validMask!0 (mask!10269 thiss!1504)) (and (or (= (mask!10269 thiss!1504) #b00000000000000000000000000000111) (= (mask!10269 thiss!1504) #b00000000000000000000000000001111) (= (mask!10269 thiss!1504) #b00000000000000000000000000011111) (= (mask!10269 thiss!1504) #b00000000000000000000000000111111) (= (mask!10269 thiss!1504) #b00000000000000000000000001111111) (= (mask!10269 thiss!1504) #b00000000000000000000000011111111) (= (mask!10269 thiss!1504) #b00000000000000000000000111111111) (= (mask!10269 thiss!1504) #b00000000000000000000001111111111) (= (mask!10269 thiss!1504) #b00000000000000000000011111111111) (= (mask!10269 thiss!1504) #b00000000000000000000111111111111) (= (mask!10269 thiss!1504) #b00000000000000000001111111111111) (= (mask!10269 thiss!1504) #b00000000000000000011111111111111) (= (mask!10269 thiss!1504) #b00000000000000000111111111111111) (= (mask!10269 thiss!1504) #b00000000000000001111111111111111) (= (mask!10269 thiss!1504) #b00000000000000011111111111111111) (= (mask!10269 thiss!1504) #b00000000000000111111111111111111) (= (mask!10269 thiss!1504) #b00000000000001111111111111111111) (= (mask!10269 thiss!1504) #b00000000000011111111111111111111) (= (mask!10269 thiss!1504) #b00000000000111111111111111111111) (= (mask!10269 thiss!1504) #b00000000001111111111111111111111) (= (mask!10269 thiss!1504) #b00000000011111111111111111111111) (= (mask!10269 thiss!1504) #b00000000111111111111111111111111) (= (mask!10269 thiss!1504) #b00000001111111111111111111111111) (= (mask!10269 thiss!1504) #b00000011111111111111111111111111) (= (mask!10269 thiss!1504) #b00000111111111111111111111111111) (= (mask!10269 thiss!1504) #b00001111111111111111111111111111) (= (mask!10269 thiss!1504) #b00011111111111111111111111111111) (= (mask!10269 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10269 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233343 d!58887))

(declare-fun d!58889 () Bool)

(declare-fun e!151624 () Bool)

(assert (=> d!58889 e!151624))

(declare-fun res!114550 () Bool)

(assert (=> d!58889 (=> res!114550 e!151624)))

(declare-fun lt!118029 () Bool)

(assert (=> d!58889 (= res!114550 (not lt!118029))))

(declare-fun lt!118030 () Bool)

(assert (=> d!58889 (= lt!118029 lt!118030)))

(declare-datatypes ((Unit!7214 0))(
  ( (Unit!7215) )
))
(declare-fun lt!118031 () Unit!7214)

(declare-fun e!151625 () Unit!7214)

(assert (=> d!58889 (= lt!118031 e!151625)))

(declare-fun c!38817 () Bool)

(assert (=> d!58889 (= c!38817 lt!118030)))

(declare-fun containsKey!254 (List!3516 (_ BitVec 64)) Bool)

(assert (=> d!58889 (= lt!118030 (containsKey!254 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932))))

(assert (=> d!58889 (= (contains!1642 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)) key!932) lt!118029)))

(declare-fun b!233406 () Bool)

(declare-fun lt!118028 () Unit!7214)

(assert (=> b!233406 (= e!151625 lt!118028)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!202 (List!3516 (_ BitVec 64)) Unit!7214)

(assert (=> b!233406 (= lt!118028 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932))))

(declare-datatypes ((Option!268 0))(
  ( (Some!267 (v!5144 V!7851)) (None!266) )
))
(declare-fun isDefined!203 (Option!268) Bool)

(declare-fun getValueByKey!262 (List!3516 (_ BitVec 64)) Option!268)

(assert (=> b!233406 (isDefined!203 (getValueByKey!262 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932))))

(declare-fun b!233407 () Bool)

(declare-fun Unit!7216 () Unit!7214)

(assert (=> b!233407 (= e!151625 Unit!7216)))

(declare-fun b!233408 () Bool)

(assert (=> b!233408 (= e!151624 (isDefined!203 (getValueByKey!262 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932)))))

(assert (= (and d!58889 c!38817) b!233406))

(assert (= (and d!58889 (not c!38817)) b!233407))

(assert (= (and d!58889 (not res!114550)) b!233408))

(declare-fun m!254793 () Bool)

(assert (=> d!58889 m!254793))

(declare-fun m!254795 () Bool)

(assert (=> b!233406 m!254795))

(declare-fun m!254797 () Bool)

(assert (=> b!233406 m!254797))

(assert (=> b!233406 m!254797))

(declare-fun m!254799 () Bool)

(assert (=> b!233406 m!254799))

(assert (=> b!233408 m!254797))

(assert (=> b!233408 m!254797))

(assert (=> b!233408 m!254799))

(assert (=> b!233338 d!58889))

(declare-fun call!21716 () ListLongMap!3517)

(declare-fun bm!21711 () Bool)

(declare-fun call!21717 () ListLongMap!3517)

(declare-fun c!38833 () Bool)

(declare-fun call!21714 () ListLongMap!3517)

(declare-fun c!38832 () Bool)

(declare-fun call!21719 () ListLongMap!3517)

(declare-fun +!631 (ListLongMap!3517 tuple2!4604) ListLongMap!3517)

(assert (=> bm!21711 (= call!21716 (+!631 (ite c!38832 call!21717 (ite c!38833 call!21719 call!21714)) (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))))))

(declare-fun b!233451 () Bool)

(declare-fun e!151659 () Unit!7214)

(declare-fun lt!118093 () Unit!7214)

(assert (=> b!233451 (= e!151659 lt!118093)))

(declare-fun lt!118077 () ListLongMap!3517)

(declare-fun getCurrentListMapNoExtraKeys!526 (array!11553 array!11551 (_ BitVec 32) (_ BitVec 32) V!7851 V!7851 (_ BitVec 32) Int) ListLongMap!3517)

(assert (=> b!233451 (= lt!118077 (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))))

(declare-fun lt!118090 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118090 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118083 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118083 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118092 () Unit!7214)

(declare-fun addStillContains!180 (ListLongMap!3517 (_ BitVec 64) V!7851 (_ BitVec 64)) Unit!7214)

(assert (=> b!233451 (= lt!118092 (addStillContains!180 lt!118077 lt!118090 (zeroValue!4184 thiss!1504) lt!118083))))

(assert (=> b!233451 (contains!1642 (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))) lt!118083)))

(declare-fun lt!118076 () Unit!7214)

(assert (=> b!233451 (= lt!118076 lt!118092)))

(declare-fun lt!118095 () ListLongMap!3517)

(assert (=> b!233451 (= lt!118095 (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))))

(declare-fun lt!118081 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118081 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118078 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118078 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118082 () Unit!7214)

(declare-fun addApplyDifferent!180 (ListLongMap!3517 (_ BitVec 64) V!7851 (_ BitVec 64)) Unit!7214)

(assert (=> b!233451 (= lt!118082 (addApplyDifferent!180 lt!118095 lt!118081 (minValue!4184 thiss!1504) lt!118078))))

(declare-fun apply!204 (ListLongMap!3517 (_ BitVec 64)) V!7851)

(assert (=> b!233451 (= (apply!204 (+!631 lt!118095 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))) lt!118078) (apply!204 lt!118095 lt!118078))))

(declare-fun lt!118080 () Unit!7214)

(assert (=> b!233451 (= lt!118080 lt!118082)))

(declare-fun lt!118088 () ListLongMap!3517)

(assert (=> b!233451 (= lt!118088 (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))))

(declare-fun lt!118085 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118094 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118094 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118089 () Unit!7214)

(assert (=> b!233451 (= lt!118089 (addApplyDifferent!180 lt!118088 lt!118085 (zeroValue!4184 thiss!1504) lt!118094))))

(assert (=> b!233451 (= (apply!204 (+!631 lt!118088 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))) lt!118094) (apply!204 lt!118088 lt!118094))))

(declare-fun lt!118097 () Unit!7214)

(assert (=> b!233451 (= lt!118097 lt!118089)))

(declare-fun lt!118086 () ListLongMap!3517)

(assert (=> b!233451 (= lt!118086 (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))))

(declare-fun lt!118091 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118091 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118084 () (_ BitVec 64))

(assert (=> b!233451 (= lt!118084 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233451 (= lt!118093 (addApplyDifferent!180 lt!118086 lt!118091 (minValue!4184 thiss!1504) lt!118084))))

(assert (=> b!233451 (= (apply!204 (+!631 lt!118086 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))) lt!118084) (apply!204 lt!118086 lt!118084))))

(declare-fun b!233452 () Bool)

(declare-fun res!114576 () Bool)

(declare-fun e!151664 () Bool)

(assert (=> b!233452 (=> (not res!114576) (not e!151664))))

(declare-fun e!151657 () Bool)

(assert (=> b!233452 (= res!114576 e!151657)))

(declare-fun c!38831 () Bool)

(assert (=> b!233452 (= c!38831 (not (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!233453 () Bool)

(declare-fun e!151661 () ListLongMap!3517)

(declare-fun call!21718 () ListLongMap!3517)

(assert (=> b!233453 (= e!151661 call!21718)))

(declare-fun bm!21712 () Bool)

(assert (=> bm!21712 (= call!21714 call!21719)))

(declare-fun b!233454 () Bool)

(declare-fun e!151655 () Bool)

(assert (=> b!233454 (= e!151657 e!151655)))

(declare-fun res!114570 () Bool)

(declare-fun call!21715 () Bool)

(assert (=> b!233454 (= res!114570 call!21715)))

(assert (=> b!233454 (=> (not res!114570) (not e!151655))))

(declare-fun b!233455 () Bool)

(declare-fun e!151663 () Bool)

(declare-fun call!21720 () Bool)

(assert (=> b!233455 (= e!151663 (not call!21720))))

(declare-fun d!58891 () Bool)

(assert (=> d!58891 e!151664))

(declare-fun res!114574 () Bool)

(assert (=> d!58891 (=> (not res!114574) (not e!151664))))

(assert (=> d!58891 (= res!114574 (or (bvsge #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))))

(declare-fun lt!118096 () ListLongMap!3517)

(declare-fun lt!118087 () ListLongMap!3517)

(assert (=> d!58891 (= lt!118096 lt!118087)))

(declare-fun lt!118079 () Unit!7214)

(assert (=> d!58891 (= lt!118079 e!151659)))

(declare-fun c!38834 () Bool)

(declare-fun e!151658 () Bool)

(assert (=> d!58891 (= c!38834 e!151658)))

(declare-fun res!114577 () Bool)

(assert (=> d!58891 (=> (not res!114577) (not e!151658))))

(assert (=> d!58891 (= res!114577 (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun e!151654 () ListLongMap!3517)

(assert (=> d!58891 (= lt!118087 e!151654)))

(assert (=> d!58891 (= c!38832 (and (not (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!58891 (validMask!0 (mask!10269 thiss!1504))))

(assert (=> d!58891 (= (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)) lt!118096)))

(declare-fun b!233456 () Bool)

(declare-fun Unit!7217 () Unit!7214)

(assert (=> b!233456 (= e!151659 Unit!7217)))

(declare-fun b!233457 () Bool)

(declare-fun e!151662 () ListLongMap!3517)

(assert (=> b!233457 (= e!151654 e!151662)))

(assert (=> b!233457 (= c!38833 (and (not (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233458 () Bool)

(declare-fun e!151656 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233458 (= e!151656 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233459 () Bool)

(assert (=> b!233459 (= e!151654 (+!631 call!21716 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))))

(declare-fun bm!21713 () Bool)

(assert (=> bm!21713 (= call!21717 (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))))

(declare-fun b!233460 () Bool)

(declare-fun e!151653 () Bool)

(declare-fun get!2813 (ValueCell!2733 V!7851) V!7851)

(declare-fun dynLambda!547 (Int (_ BitVec 64)) V!7851)

(assert (=> b!233460 (= e!151653 (= (apply!204 lt!118096 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)) (get!2813 (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4343 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5827 (_values!4326 thiss!1504))))))

(assert (=> b!233460 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun b!233461 () Bool)

(declare-fun e!151660 () Bool)

(assert (=> b!233461 (= e!151663 e!151660)))

(declare-fun res!114572 () Bool)

(assert (=> b!233461 (= res!114572 call!21720)))

(assert (=> b!233461 (=> (not res!114572) (not e!151660))))

(declare-fun bm!21714 () Bool)

(assert (=> bm!21714 (= call!21720 (contains!1642 lt!118096 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233462 () Bool)

(declare-fun res!114573 () Bool)

(assert (=> b!233462 (=> (not res!114573) (not e!151664))))

(declare-fun e!151652 () Bool)

(assert (=> b!233462 (= res!114573 e!151652)))

(declare-fun res!114569 () Bool)

(assert (=> b!233462 (=> res!114569 e!151652)))

(assert (=> b!233462 (= res!114569 (not e!151656))))

(declare-fun res!114575 () Bool)

(assert (=> b!233462 (=> (not res!114575) (not e!151656))))

(assert (=> b!233462 (= res!114575 (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun b!233463 () Bool)

(assert (=> b!233463 (= e!151652 e!151653)))

(declare-fun res!114571 () Bool)

(assert (=> b!233463 (=> (not res!114571) (not e!151653))))

(assert (=> b!233463 (= res!114571 (contains!1642 lt!118096 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233463 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun bm!21715 () Bool)

(assert (=> bm!21715 (= call!21718 call!21716)))

(declare-fun b!233464 () Bool)

(assert (=> b!233464 (= e!151658 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21716 () Bool)

(assert (=> bm!21716 (= call!21719 call!21717)))

(declare-fun b!233465 () Bool)

(assert (=> b!233465 (= e!151664 e!151663)))

(declare-fun c!38835 () Bool)

(assert (=> b!233465 (= c!38835 (not (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233466 () Bool)

(assert (=> b!233466 (= e!151655 (= (apply!204 lt!118096 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4184 thiss!1504)))))

(declare-fun b!233467 () Bool)

(assert (=> b!233467 (= e!151662 call!21718)))

(declare-fun bm!21717 () Bool)

(assert (=> bm!21717 (= call!21715 (contains!1642 lt!118096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233468 () Bool)

(assert (=> b!233468 (= e!151660 (= (apply!204 lt!118096 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4184 thiss!1504)))))

(declare-fun b!233469 () Bool)

(declare-fun c!38830 () Bool)

(assert (=> b!233469 (= c!38830 (and (not (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4080 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!233469 (= e!151662 e!151661)))

(declare-fun b!233470 () Bool)

(assert (=> b!233470 (= e!151657 (not call!21715))))

(declare-fun b!233471 () Bool)

(assert (=> b!233471 (= e!151661 call!21714)))

(assert (= (and d!58891 c!38832) b!233459))

(assert (= (and d!58891 (not c!38832)) b!233457))

(assert (= (and b!233457 c!38833) b!233467))

(assert (= (and b!233457 (not c!38833)) b!233469))

(assert (= (and b!233469 c!38830) b!233453))

(assert (= (and b!233469 (not c!38830)) b!233471))

(assert (= (or b!233453 b!233471) bm!21712))

(assert (= (or b!233467 bm!21712) bm!21716))

(assert (= (or b!233467 b!233453) bm!21715))

(assert (= (or b!233459 bm!21716) bm!21713))

(assert (= (or b!233459 bm!21715) bm!21711))

(assert (= (and d!58891 res!114577) b!233464))

(assert (= (and d!58891 c!38834) b!233451))

(assert (= (and d!58891 (not c!38834)) b!233456))

(assert (= (and d!58891 res!114574) b!233462))

(assert (= (and b!233462 res!114575) b!233458))

(assert (= (and b!233462 (not res!114569)) b!233463))

(assert (= (and b!233463 res!114571) b!233460))

(assert (= (and b!233462 res!114573) b!233452))

(assert (= (and b!233452 c!38831) b!233454))

(assert (= (and b!233452 (not c!38831)) b!233470))

(assert (= (and b!233454 res!114570) b!233466))

(assert (= (or b!233454 b!233470) bm!21717))

(assert (= (and b!233452 res!114576) b!233465))

(assert (= (and b!233465 c!38835) b!233461))

(assert (= (and b!233465 (not c!38835)) b!233455))

(assert (= (and b!233461 res!114572) b!233468))

(assert (= (or b!233461 b!233455) bm!21714))

(declare-fun b_lambda!7847 () Bool)

(assert (=> (not b_lambda!7847) (not b!233460)))

(declare-fun t!8479 () Bool)

(declare-fun tb!2921 () Bool)

(assert (=> (and b!233344 (= (defaultEntry!4343 thiss!1504) (defaultEntry!4343 thiss!1504)) t!8479) tb!2921))

(declare-fun result!5085 () Bool)

(assert (=> tb!2921 (= result!5085 tp_is_empty!6153)))

(assert (=> b!233460 t!8479))

(declare-fun b_and!13195 () Bool)

(assert (= b_and!13191 (and (=> t!8479 result!5085) b_and!13195)))

(declare-fun m!254801 () Bool)

(assert (=> b!233463 m!254801))

(assert (=> b!233463 m!254801))

(declare-fun m!254803 () Bool)

(assert (=> b!233463 m!254803))

(declare-fun m!254805 () Bool)

(assert (=> b!233451 m!254805))

(declare-fun m!254807 () Bool)

(assert (=> b!233451 m!254807))

(declare-fun m!254809 () Bool)

(assert (=> b!233451 m!254809))

(declare-fun m!254811 () Bool)

(assert (=> b!233451 m!254811))

(assert (=> b!233451 m!254807))

(declare-fun m!254813 () Bool)

(assert (=> b!233451 m!254813))

(assert (=> b!233451 m!254811))

(declare-fun m!254815 () Bool)

(assert (=> b!233451 m!254815))

(declare-fun m!254817 () Bool)

(assert (=> b!233451 m!254817))

(declare-fun m!254819 () Bool)

(assert (=> b!233451 m!254819))

(declare-fun m!254821 () Bool)

(assert (=> b!233451 m!254821))

(declare-fun m!254823 () Bool)

(assert (=> b!233451 m!254823))

(declare-fun m!254825 () Bool)

(assert (=> b!233451 m!254825))

(assert (=> b!233451 m!254801))

(declare-fun m!254827 () Bool)

(assert (=> b!233451 m!254827))

(declare-fun m!254829 () Bool)

(assert (=> b!233451 m!254829))

(assert (=> b!233451 m!254809))

(declare-fun m!254831 () Bool)

(assert (=> b!233451 m!254831))

(declare-fun m!254833 () Bool)

(assert (=> b!233451 m!254833))

(assert (=> b!233451 m!254833))

(declare-fun m!254835 () Bool)

(assert (=> b!233451 m!254835))

(declare-fun m!254837 () Bool)

(assert (=> b!233466 m!254837))

(declare-fun m!254839 () Bool)

(assert (=> b!233468 m!254839))

(declare-fun m!254841 () Bool)

(assert (=> b!233459 m!254841))

(assert (=> b!233460 m!254801))

(declare-fun m!254843 () Bool)

(assert (=> b!233460 m!254843))

(declare-fun m!254845 () Bool)

(assert (=> b!233460 m!254845))

(declare-fun m!254847 () Bool)

(assert (=> b!233460 m!254847))

(assert (=> b!233460 m!254801))

(assert (=> b!233460 m!254845))

(assert (=> b!233460 m!254847))

(declare-fun m!254849 () Bool)

(assert (=> b!233460 m!254849))

(declare-fun m!254851 () Bool)

(assert (=> bm!21714 m!254851))

(assert (=> d!58891 m!254743))

(assert (=> bm!21713 m!254821))

(declare-fun m!254853 () Bool)

(assert (=> bm!21711 m!254853))

(assert (=> b!233458 m!254801))

(assert (=> b!233458 m!254801))

(declare-fun m!254855 () Bool)

(assert (=> b!233458 m!254855))

(assert (=> b!233464 m!254801))

(assert (=> b!233464 m!254801))

(assert (=> b!233464 m!254855))

(declare-fun m!254857 () Bool)

(assert (=> bm!21717 m!254857))

(assert (=> b!233338 d!58891))

(declare-fun mapNonEmpty!10408 () Bool)

(declare-fun mapRes!10408 () Bool)

(declare-fun tp!22027 () Bool)

(declare-fun e!151670 () Bool)

(assert (=> mapNonEmpty!10408 (= mapRes!10408 (and tp!22027 e!151670))))

(declare-fun mapKey!10408 () (_ BitVec 32))

(declare-fun mapValue!10408 () ValueCell!2733)

(declare-fun mapRest!10408 () (Array (_ BitVec 32) ValueCell!2733))

(assert (=> mapNonEmpty!10408 (= mapRest!10402 (store mapRest!10408 mapKey!10408 mapValue!10408))))

(declare-fun b!233481 () Bool)

(declare-fun e!151669 () Bool)

(assert (=> b!233481 (= e!151669 tp_is_empty!6153)))

(declare-fun condMapEmpty!10408 () Bool)

(declare-fun mapDefault!10408 () ValueCell!2733)

(assert (=> mapNonEmpty!10402 (= condMapEmpty!10408 (= mapRest!10402 ((as const (Array (_ BitVec 32) ValueCell!2733)) mapDefault!10408)))))

(assert (=> mapNonEmpty!10402 (= tp!22018 (and e!151669 mapRes!10408))))

(declare-fun mapIsEmpty!10408 () Bool)

(assert (=> mapIsEmpty!10408 mapRes!10408))

(declare-fun b!233480 () Bool)

(assert (=> b!233480 (= e!151670 tp_is_empty!6153)))

(assert (= (and mapNonEmpty!10402 condMapEmpty!10408) mapIsEmpty!10408))

(assert (= (and mapNonEmpty!10402 (not condMapEmpty!10408)) mapNonEmpty!10408))

(assert (= (and mapNonEmpty!10408 ((_ is ValueCellFull!2733) mapValue!10408)) b!233480))

(assert (= (and mapNonEmpty!10402 ((_ is ValueCellFull!2733) mapDefault!10408)) b!233481))

(declare-fun m!254859 () Bool)

(assert (=> mapNonEmpty!10408 m!254859))

(declare-fun b_lambda!7849 () Bool)

(assert (= b_lambda!7847 (or (and b!233344 b_free!6291) b_lambda!7849)))

(check-sat (not bm!21711) (not d!58885) (not b!233463) (not bm!21713) (not bm!21714) (not b_lambda!7849) (not b!233458) tp_is_empty!6153 (not mapNonEmpty!10408) (not b!233408) (not b!233451) (not b!233466) (not b_next!6291) (not b!233379) (not b!233460) b_and!13195 (not b!233381) (not d!58883) (not b!233396) (not bm!21717) (not b!233380) (not b!233464) (not b!233406) (not d!58891) (not b!233468) (not d!58889) (not b!233459))
(check-sat b_and!13195 (not b_next!6291))
(get-model)

(declare-fun d!58893 () Bool)

(assert (=> d!58893 (contains!1642 (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))) lt!118083)))

(declare-fun lt!118100 () Unit!7214)

(declare-fun choose!1092 (ListLongMap!3517 (_ BitVec 64) V!7851 (_ BitVec 64)) Unit!7214)

(assert (=> d!58893 (= lt!118100 (choose!1092 lt!118077 lt!118090 (zeroValue!4184 thiss!1504) lt!118083))))

(assert (=> d!58893 (contains!1642 lt!118077 lt!118083)))

(assert (=> d!58893 (= (addStillContains!180 lt!118077 lt!118090 (zeroValue!4184 thiss!1504) lt!118083) lt!118100)))

(declare-fun bs!8650 () Bool)

(assert (= bs!8650 d!58893))

(assert (=> bs!8650 m!254833))

(assert (=> bs!8650 m!254833))

(assert (=> bs!8650 m!254835))

(declare-fun m!254861 () Bool)

(assert (=> bs!8650 m!254861))

(declare-fun m!254863 () Bool)

(assert (=> bs!8650 m!254863))

(assert (=> b!233451 d!58893))

(declare-fun d!58895 () Bool)

(declare-fun get!2814 (Option!268) V!7851)

(assert (=> d!58895 (= (apply!204 lt!118086 lt!118084) (get!2814 (getValueByKey!262 (toList!1774 lt!118086) lt!118084)))))

(declare-fun bs!8651 () Bool)

(assert (= bs!8651 d!58895))

(declare-fun m!254865 () Bool)

(assert (=> bs!8651 m!254865))

(assert (=> bs!8651 m!254865))

(declare-fun m!254867 () Bool)

(assert (=> bs!8651 m!254867))

(assert (=> b!233451 d!58895))

(declare-fun d!58897 () Bool)

(assert (=> d!58897 (= (apply!204 (+!631 lt!118088 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))) lt!118094) (apply!204 lt!118088 lt!118094))))

(declare-fun lt!118103 () Unit!7214)

(declare-fun choose!1093 (ListLongMap!3517 (_ BitVec 64) V!7851 (_ BitVec 64)) Unit!7214)

(assert (=> d!58897 (= lt!118103 (choose!1093 lt!118088 lt!118085 (zeroValue!4184 thiss!1504) lt!118094))))

(declare-fun e!151673 () Bool)

(assert (=> d!58897 e!151673))

(declare-fun res!114580 () Bool)

(assert (=> d!58897 (=> (not res!114580) (not e!151673))))

(assert (=> d!58897 (= res!114580 (contains!1642 lt!118088 lt!118094))))

(assert (=> d!58897 (= (addApplyDifferent!180 lt!118088 lt!118085 (zeroValue!4184 thiss!1504) lt!118094) lt!118103)))

(declare-fun b!233486 () Bool)

(assert (=> b!233486 (= e!151673 (not (= lt!118094 lt!118085)))))

(assert (= (and d!58897 res!114580) b!233486))

(assert (=> d!58897 m!254809))

(assert (=> d!58897 m!254831))

(declare-fun m!254869 () Bool)

(assert (=> d!58897 m!254869))

(assert (=> d!58897 m!254805))

(assert (=> d!58897 m!254809))

(declare-fun m!254871 () Bool)

(assert (=> d!58897 m!254871))

(assert (=> b!233451 d!58897))

(declare-fun d!58899 () Bool)

(assert (=> d!58899 (= (apply!204 lt!118095 lt!118078) (get!2814 (getValueByKey!262 (toList!1774 lt!118095) lt!118078)))))

(declare-fun bs!8652 () Bool)

(assert (= bs!8652 d!58899))

(declare-fun m!254873 () Bool)

(assert (=> bs!8652 m!254873))

(assert (=> bs!8652 m!254873))

(declare-fun m!254875 () Bool)

(assert (=> bs!8652 m!254875))

(assert (=> b!233451 d!58899))

(declare-fun d!58901 () Bool)

(assert (=> d!58901 (= (apply!204 (+!631 lt!118086 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))) lt!118084) (get!2814 (getValueByKey!262 (toList!1774 (+!631 lt!118086 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504)))) lt!118084)))))

(declare-fun bs!8653 () Bool)

(assert (= bs!8653 d!58901))

(declare-fun m!254877 () Bool)

(assert (=> bs!8653 m!254877))

(assert (=> bs!8653 m!254877))

(declare-fun m!254879 () Bool)

(assert (=> bs!8653 m!254879))

(assert (=> b!233451 d!58901))

(declare-fun d!58903 () Bool)

(declare-fun e!151676 () Bool)

(assert (=> d!58903 e!151676))

(declare-fun res!114585 () Bool)

(assert (=> d!58903 (=> (not res!114585) (not e!151676))))

(declare-fun lt!118112 () ListLongMap!3517)

(assert (=> d!58903 (= res!114585 (contains!1642 lt!118112 (_1!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504)))))))

(declare-fun lt!118115 () List!3516)

(assert (=> d!58903 (= lt!118112 (ListLongMap!3518 lt!118115))))

(declare-fun lt!118113 () Unit!7214)

(declare-fun lt!118114 () Unit!7214)

(assert (=> d!58903 (= lt!118113 lt!118114)))

(assert (=> d!58903 (= (getValueByKey!262 lt!118115 (_1!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!147 (List!3516 (_ BitVec 64) V!7851) Unit!7214)

(assert (=> d!58903 (= lt!118114 (lemmaContainsTupThenGetReturnValue!147 lt!118115 (_1!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504)))))))

(declare-fun insertStrictlySorted!150 (List!3516 (_ BitVec 64) V!7851) List!3516)

(assert (=> d!58903 (= lt!118115 (insertStrictlySorted!150 (toList!1774 lt!118086) (_1!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504)))))))

(assert (=> d!58903 (= (+!631 lt!118086 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))) lt!118112)))

(declare-fun b!233491 () Bool)

(declare-fun res!114586 () Bool)

(assert (=> b!233491 (=> (not res!114586) (not e!151676))))

(assert (=> b!233491 (= res!114586 (= (getValueByKey!262 (toList!1774 lt!118112) (_1!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))))))))

(declare-fun b!233492 () Bool)

(declare-fun contains!1643 (List!3516 tuple2!4604) Bool)

(assert (=> b!233492 (= e!151676 (contains!1643 (toList!1774 lt!118112) (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))))))

(assert (= (and d!58903 res!114585) b!233491))

(assert (= (and b!233491 res!114586) b!233492))

(declare-fun m!254881 () Bool)

(assert (=> d!58903 m!254881))

(declare-fun m!254883 () Bool)

(assert (=> d!58903 m!254883))

(declare-fun m!254885 () Bool)

(assert (=> d!58903 m!254885))

(declare-fun m!254887 () Bool)

(assert (=> d!58903 m!254887))

(declare-fun m!254889 () Bool)

(assert (=> b!233491 m!254889))

(declare-fun m!254891 () Bool)

(assert (=> b!233492 m!254891))

(assert (=> b!233451 d!58903))

(declare-fun d!58905 () Bool)

(assert (=> d!58905 (= (apply!204 (+!631 lt!118086 (tuple2!4605 lt!118091 (minValue!4184 thiss!1504))) lt!118084) (apply!204 lt!118086 lt!118084))))

(declare-fun lt!118116 () Unit!7214)

(assert (=> d!58905 (= lt!118116 (choose!1093 lt!118086 lt!118091 (minValue!4184 thiss!1504) lt!118084))))

(declare-fun e!151677 () Bool)

(assert (=> d!58905 e!151677))

(declare-fun res!114587 () Bool)

(assert (=> d!58905 (=> (not res!114587) (not e!151677))))

(assert (=> d!58905 (= res!114587 (contains!1642 lt!118086 lt!118084))))

(assert (=> d!58905 (= (addApplyDifferent!180 lt!118086 lt!118091 (minValue!4184 thiss!1504) lt!118084) lt!118116)))

(declare-fun b!233493 () Bool)

(assert (=> b!233493 (= e!151677 (not (= lt!118084 lt!118091)))))

(assert (= (and d!58905 res!114587) b!233493))

(assert (=> d!58905 m!254807))

(assert (=> d!58905 m!254813))

(declare-fun m!254893 () Bool)

(assert (=> d!58905 m!254893))

(assert (=> d!58905 m!254823))

(assert (=> d!58905 m!254807))

(declare-fun m!254895 () Bool)

(assert (=> d!58905 m!254895))

(assert (=> b!233451 d!58905))

(declare-fun d!58907 () Bool)

(assert (=> d!58907 (= (apply!204 (+!631 lt!118095 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))) lt!118078) (apply!204 lt!118095 lt!118078))))

(declare-fun lt!118117 () Unit!7214)

(assert (=> d!58907 (= lt!118117 (choose!1093 lt!118095 lt!118081 (minValue!4184 thiss!1504) lt!118078))))

(declare-fun e!151678 () Bool)

(assert (=> d!58907 e!151678))

(declare-fun res!114588 () Bool)

(assert (=> d!58907 (=> (not res!114588) (not e!151678))))

(assert (=> d!58907 (= res!114588 (contains!1642 lt!118095 lt!118078))))

(assert (=> d!58907 (= (addApplyDifferent!180 lt!118095 lt!118081 (minValue!4184 thiss!1504) lt!118078) lt!118117)))

(declare-fun b!233494 () Bool)

(assert (=> b!233494 (= e!151678 (not (= lt!118078 lt!118081)))))

(assert (= (and d!58907 res!114588) b!233494))

(assert (=> d!58907 m!254811))

(assert (=> d!58907 m!254815))

(declare-fun m!254897 () Bool)

(assert (=> d!58907 m!254897))

(assert (=> d!58907 m!254825))

(assert (=> d!58907 m!254811))

(declare-fun m!254899 () Bool)

(assert (=> d!58907 m!254899))

(assert (=> b!233451 d!58907))

(declare-fun d!58909 () Bool)

(assert (=> d!58909 (= (apply!204 (+!631 lt!118088 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))) lt!118094) (get!2814 (getValueByKey!262 (toList!1774 (+!631 lt!118088 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504)))) lt!118094)))))

(declare-fun bs!8654 () Bool)

(assert (= bs!8654 d!58909))

(declare-fun m!254901 () Bool)

(assert (=> bs!8654 m!254901))

(assert (=> bs!8654 m!254901))

(declare-fun m!254903 () Bool)

(assert (=> bs!8654 m!254903))

(assert (=> b!233451 d!58909))

(declare-fun d!58911 () Bool)

(declare-fun e!151679 () Bool)

(assert (=> d!58911 e!151679))

(declare-fun res!114589 () Bool)

(assert (=> d!58911 (=> (not res!114589) (not e!151679))))

(declare-fun lt!118118 () ListLongMap!3517)

(assert (=> d!58911 (= res!114589 (contains!1642 lt!118118 (_1!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504)))))))

(declare-fun lt!118121 () List!3516)

(assert (=> d!58911 (= lt!118118 (ListLongMap!3518 lt!118121))))

(declare-fun lt!118119 () Unit!7214)

(declare-fun lt!118120 () Unit!7214)

(assert (=> d!58911 (= lt!118119 lt!118120)))

(assert (=> d!58911 (= (getValueByKey!262 lt!118121 (_1!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504)))))))

(assert (=> d!58911 (= lt!118120 (lemmaContainsTupThenGetReturnValue!147 lt!118121 (_1!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504)))))))

(assert (=> d!58911 (= lt!118121 (insertStrictlySorted!150 (toList!1774 lt!118095) (_1!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504)))))))

(assert (=> d!58911 (= (+!631 lt!118095 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))) lt!118118)))

(declare-fun b!233495 () Bool)

(declare-fun res!114590 () Bool)

(assert (=> b!233495 (=> (not res!114590) (not e!151679))))

(assert (=> b!233495 (= res!114590 (= (getValueByKey!262 (toList!1774 lt!118118) (_1!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))))))))

(declare-fun b!233496 () Bool)

(assert (=> b!233496 (= e!151679 (contains!1643 (toList!1774 lt!118118) (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))))))

(assert (= (and d!58911 res!114589) b!233495))

(assert (= (and b!233495 res!114590) b!233496))

(declare-fun m!254905 () Bool)

(assert (=> d!58911 m!254905))

(declare-fun m!254907 () Bool)

(assert (=> d!58911 m!254907))

(declare-fun m!254909 () Bool)

(assert (=> d!58911 m!254909))

(declare-fun m!254911 () Bool)

(assert (=> d!58911 m!254911))

(declare-fun m!254913 () Bool)

(assert (=> b!233495 m!254913))

(declare-fun m!254915 () Bool)

(assert (=> b!233496 m!254915))

(assert (=> b!233451 d!58911))

(declare-fun bm!21720 () Bool)

(declare-fun call!21723 () ListLongMap!3517)

(assert (=> bm!21720 (= call!21723 (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4343 thiss!1504)))))

(declare-fun b!233522 () Bool)

(declare-fun e!151698 () Bool)

(declare-fun e!151697 () Bool)

(assert (=> b!233522 (= e!151698 e!151697)))

(declare-fun c!38846 () Bool)

(declare-fun e!151700 () Bool)

(assert (=> b!233522 (= c!38846 e!151700)))

(declare-fun res!114601 () Bool)

(assert (=> b!233522 (=> (not res!114601) (not e!151700))))

(assert (=> b!233522 (= res!114601 (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun b!233523 () Bool)

(assert (=> b!233523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(assert (=> b!233523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5827 (_values!4326 thiss!1504))))))

(declare-fun e!151699 () Bool)

(declare-fun lt!118137 () ListLongMap!3517)

(assert (=> b!233523 (= e!151699 (= (apply!204 lt!118137 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)) (get!2813 (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4343 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233524 () Bool)

(assert (=> b!233524 (= e!151697 e!151699)))

(assert (=> b!233524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun res!114599 () Bool)

(assert (=> b!233524 (= res!114599 (contains!1642 lt!118137 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233524 (=> (not res!114599) (not e!151699))))

(declare-fun b!233525 () Bool)

(declare-fun e!151694 () Bool)

(assert (=> b!233525 (= e!151697 e!151694)))

(declare-fun c!38845 () Bool)

(assert (=> b!233525 (= c!38845 (bvslt #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun b!233526 () Bool)

(declare-fun res!114602 () Bool)

(assert (=> b!233526 (=> (not res!114602) (not e!151698))))

(assert (=> b!233526 (= res!114602 (not (contains!1642 lt!118137 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233527 () Bool)

(declare-fun e!151695 () ListLongMap!3517)

(declare-fun e!151696 () ListLongMap!3517)

(assert (=> b!233527 (= e!151695 e!151696)))

(declare-fun c!38847 () Bool)

(assert (=> b!233527 (= c!38847 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233528 () Bool)

(assert (=> b!233528 (= e!151695 (ListLongMap!3518 Nil!3513))))

(declare-fun b!233529 () Bool)

(assert (=> b!233529 (= e!151696 call!21723)))

(declare-fun b!233530 () Bool)

(assert (=> b!233530 (= e!151694 (= lt!118137 (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4343 thiss!1504))))))

(declare-fun b!233531 () Bool)

(assert (=> b!233531 (= e!151700 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233531 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!233532 () Bool)

(declare-fun isEmpty!504 (ListLongMap!3517) Bool)

(assert (=> b!233532 (= e!151694 (isEmpty!504 lt!118137))))

(declare-fun b!233521 () Bool)

(declare-fun lt!118138 () Unit!7214)

(declare-fun lt!118141 () Unit!7214)

(assert (=> b!233521 (= lt!118138 lt!118141)))

(declare-fun lt!118136 () V!7851)

(declare-fun lt!118140 () (_ BitVec 64))

(declare-fun lt!118142 () (_ BitVec 64))

(declare-fun lt!118139 () ListLongMap!3517)

(assert (=> b!233521 (not (contains!1642 (+!631 lt!118139 (tuple2!4605 lt!118142 lt!118136)) lt!118140))))

(declare-fun addStillNotContains!111 (ListLongMap!3517 (_ BitVec 64) V!7851 (_ BitVec 64)) Unit!7214)

(assert (=> b!233521 (= lt!118141 (addStillNotContains!111 lt!118139 lt!118142 lt!118136 lt!118140))))

(assert (=> b!233521 (= lt!118140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!233521 (= lt!118136 (get!2813 (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4343 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!233521 (= lt!118142 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233521 (= lt!118139 call!21723)))

(assert (=> b!233521 (= e!151696 (+!631 call!21723 (tuple2!4605 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000) (get!2813 (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4343 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!58913 () Bool)

(assert (=> d!58913 e!151698))

(declare-fun res!114600 () Bool)

(assert (=> d!58913 (=> (not res!114600) (not e!151698))))

(assert (=> d!58913 (= res!114600 (not (contains!1642 lt!118137 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58913 (= lt!118137 e!151695)))

(declare-fun c!38844 () Bool)

(assert (=> d!58913 (= c!38844 (bvsge #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(assert (=> d!58913 (validMask!0 (mask!10269 thiss!1504))))

(assert (=> d!58913 (= (getCurrentListMapNoExtraKeys!526 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)) lt!118137)))

(assert (= (and d!58913 c!38844) b!233528))

(assert (= (and d!58913 (not c!38844)) b!233527))

(assert (= (and b!233527 c!38847) b!233521))

(assert (= (and b!233527 (not c!38847)) b!233529))

(assert (= (or b!233521 b!233529) bm!21720))

(assert (= (and d!58913 res!114600) b!233526))

(assert (= (and b!233526 res!114602) b!233522))

(assert (= (and b!233522 res!114601) b!233531))

(assert (= (and b!233522 c!38846) b!233524))

(assert (= (and b!233522 (not c!38846)) b!233525))

(assert (= (and b!233524 res!114599) b!233523))

(assert (= (and b!233525 c!38845) b!233530))

(assert (= (and b!233525 (not c!38845)) b!233532))

(declare-fun b_lambda!7851 () Bool)

(assert (=> (not b_lambda!7851) (not b!233523)))

(assert (=> b!233523 t!8479))

(declare-fun b_and!13197 () Bool)

(assert (= b_and!13195 (and (=> t!8479 result!5085) b_and!13197)))

(declare-fun b_lambda!7853 () Bool)

(assert (=> (not b_lambda!7853) (not b!233521)))

(assert (=> b!233521 t!8479))

(declare-fun b_and!13199 () Bool)

(assert (= b_and!13197 (and (=> t!8479 result!5085) b_and!13199)))

(declare-fun m!254917 () Bool)

(assert (=> d!58913 m!254917))

(assert (=> d!58913 m!254743))

(assert (=> b!233531 m!254801))

(assert (=> b!233531 m!254801))

(assert (=> b!233531 m!254855))

(declare-fun m!254919 () Bool)

(assert (=> bm!21720 m!254919))

(assert (=> b!233523 m!254847))

(assert (=> b!233523 m!254801))

(declare-fun m!254921 () Bool)

(assert (=> b!233523 m!254921))

(assert (=> b!233523 m!254801))

(assert (=> b!233523 m!254845))

(assert (=> b!233523 m!254845))

(assert (=> b!233523 m!254847))

(assert (=> b!233523 m!254849))

(declare-fun m!254923 () Bool)

(assert (=> b!233526 m!254923))

(declare-fun m!254925 () Bool)

(assert (=> b!233521 m!254925))

(declare-fun m!254927 () Bool)

(assert (=> b!233521 m!254927))

(assert (=> b!233521 m!254847))

(assert (=> b!233521 m!254925))

(assert (=> b!233521 m!254845))

(declare-fun m!254929 () Bool)

(assert (=> b!233521 m!254929))

(assert (=> b!233521 m!254845))

(assert (=> b!233521 m!254847))

(assert (=> b!233521 m!254849))

(declare-fun m!254931 () Bool)

(assert (=> b!233521 m!254931))

(assert (=> b!233521 m!254801))

(assert (=> b!233524 m!254801))

(assert (=> b!233524 m!254801))

(declare-fun m!254933 () Bool)

(assert (=> b!233524 m!254933))

(assert (=> b!233530 m!254919))

(declare-fun m!254935 () Bool)

(assert (=> b!233532 m!254935))

(assert (=> b!233527 m!254801))

(assert (=> b!233527 m!254801))

(assert (=> b!233527 m!254855))

(assert (=> b!233451 d!58913))

(declare-fun d!58915 () Bool)

(declare-fun e!151701 () Bool)

(assert (=> d!58915 e!151701))

(declare-fun res!114603 () Bool)

(assert (=> d!58915 (=> res!114603 e!151701)))

(declare-fun lt!118144 () Bool)

(assert (=> d!58915 (= res!114603 (not lt!118144))))

(declare-fun lt!118145 () Bool)

(assert (=> d!58915 (= lt!118144 lt!118145)))

(declare-fun lt!118146 () Unit!7214)

(declare-fun e!151702 () Unit!7214)

(assert (=> d!58915 (= lt!118146 e!151702)))

(declare-fun c!38848 () Bool)

(assert (=> d!58915 (= c!38848 lt!118145)))

(assert (=> d!58915 (= lt!118145 (containsKey!254 (toList!1774 (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))) lt!118083))))

(assert (=> d!58915 (= (contains!1642 (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))) lt!118083) lt!118144)))

(declare-fun b!233533 () Bool)

(declare-fun lt!118143 () Unit!7214)

(assert (=> b!233533 (= e!151702 lt!118143)))

(assert (=> b!233533 (= lt!118143 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1774 (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))) lt!118083))))

(assert (=> b!233533 (isDefined!203 (getValueByKey!262 (toList!1774 (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))) lt!118083))))

(declare-fun b!233534 () Bool)

(declare-fun Unit!7218 () Unit!7214)

(assert (=> b!233534 (= e!151702 Unit!7218)))

(declare-fun b!233535 () Bool)

(assert (=> b!233535 (= e!151701 (isDefined!203 (getValueByKey!262 (toList!1774 (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))) lt!118083)))))

(assert (= (and d!58915 c!38848) b!233533))

(assert (= (and d!58915 (not c!38848)) b!233534))

(assert (= (and d!58915 (not res!114603)) b!233535))

(declare-fun m!254937 () Bool)

(assert (=> d!58915 m!254937))

(declare-fun m!254939 () Bool)

(assert (=> b!233533 m!254939))

(declare-fun m!254941 () Bool)

(assert (=> b!233533 m!254941))

(assert (=> b!233533 m!254941))

(declare-fun m!254943 () Bool)

(assert (=> b!233533 m!254943))

(assert (=> b!233535 m!254941))

(assert (=> b!233535 m!254941))

(assert (=> b!233535 m!254943))

(assert (=> b!233451 d!58915))

(declare-fun d!58917 () Bool)

(assert (=> d!58917 (= (apply!204 (+!631 lt!118095 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504))) lt!118078) (get!2814 (getValueByKey!262 (toList!1774 (+!631 lt!118095 (tuple2!4605 lt!118081 (minValue!4184 thiss!1504)))) lt!118078)))))

(declare-fun bs!8655 () Bool)

(assert (= bs!8655 d!58917))

(declare-fun m!254945 () Bool)

(assert (=> bs!8655 m!254945))

(assert (=> bs!8655 m!254945))

(declare-fun m!254947 () Bool)

(assert (=> bs!8655 m!254947))

(assert (=> b!233451 d!58917))

(declare-fun d!58919 () Bool)

(assert (=> d!58919 (= (apply!204 lt!118088 lt!118094) (get!2814 (getValueByKey!262 (toList!1774 lt!118088) lt!118094)))))

(declare-fun bs!8656 () Bool)

(assert (= bs!8656 d!58919))

(declare-fun m!254949 () Bool)

(assert (=> bs!8656 m!254949))

(assert (=> bs!8656 m!254949))

(declare-fun m!254951 () Bool)

(assert (=> bs!8656 m!254951))

(assert (=> b!233451 d!58919))

(declare-fun d!58921 () Bool)

(declare-fun e!151703 () Bool)

(assert (=> d!58921 e!151703))

(declare-fun res!114604 () Bool)

(assert (=> d!58921 (=> (not res!114604) (not e!151703))))

(declare-fun lt!118147 () ListLongMap!3517)

(assert (=> d!58921 (= res!114604 (contains!1642 lt!118147 (_1!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504)))))))

(declare-fun lt!118150 () List!3516)

(assert (=> d!58921 (= lt!118147 (ListLongMap!3518 lt!118150))))

(declare-fun lt!118148 () Unit!7214)

(declare-fun lt!118149 () Unit!7214)

(assert (=> d!58921 (= lt!118148 lt!118149)))

(assert (=> d!58921 (= (getValueByKey!262 lt!118150 (_1!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504)))))))

(assert (=> d!58921 (= lt!118149 (lemmaContainsTupThenGetReturnValue!147 lt!118150 (_1!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504)))))))

(assert (=> d!58921 (= lt!118150 (insertStrictlySorted!150 (toList!1774 lt!118088) (_1!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504)))))))

(assert (=> d!58921 (= (+!631 lt!118088 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))) lt!118147)))

(declare-fun b!233536 () Bool)

(declare-fun res!114605 () Bool)

(assert (=> b!233536 (=> (not res!114605) (not e!151703))))

(assert (=> b!233536 (= res!114605 (= (getValueByKey!262 (toList!1774 lt!118147) (_1!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))))))))

(declare-fun b!233537 () Bool)

(assert (=> b!233537 (= e!151703 (contains!1643 (toList!1774 lt!118147) (tuple2!4605 lt!118085 (zeroValue!4184 thiss!1504))))))

(assert (= (and d!58921 res!114604) b!233536))

(assert (= (and b!233536 res!114605) b!233537))

(declare-fun m!254953 () Bool)

(assert (=> d!58921 m!254953))

(declare-fun m!254955 () Bool)

(assert (=> d!58921 m!254955))

(declare-fun m!254957 () Bool)

(assert (=> d!58921 m!254957))

(declare-fun m!254959 () Bool)

(assert (=> d!58921 m!254959))

(declare-fun m!254961 () Bool)

(assert (=> b!233536 m!254961))

(declare-fun m!254963 () Bool)

(assert (=> b!233537 m!254963))

(assert (=> b!233451 d!58921))

(declare-fun d!58923 () Bool)

(declare-fun e!151704 () Bool)

(assert (=> d!58923 e!151704))

(declare-fun res!114606 () Bool)

(assert (=> d!58923 (=> (not res!114606) (not e!151704))))

(declare-fun lt!118151 () ListLongMap!3517)

(assert (=> d!58923 (= res!114606 (contains!1642 lt!118151 (_1!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))))))

(declare-fun lt!118154 () List!3516)

(assert (=> d!58923 (= lt!118151 (ListLongMap!3518 lt!118154))))

(declare-fun lt!118152 () Unit!7214)

(declare-fun lt!118153 () Unit!7214)

(assert (=> d!58923 (= lt!118152 lt!118153)))

(assert (=> d!58923 (= (getValueByKey!262 lt!118154 (_1!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))))))

(assert (=> d!58923 (= lt!118153 (lemmaContainsTupThenGetReturnValue!147 lt!118154 (_1!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))))))

(assert (=> d!58923 (= lt!118154 (insertStrictlySorted!150 (toList!1774 lt!118077) (_1!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))))))

(assert (=> d!58923 (= (+!631 lt!118077 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))) lt!118151)))

(declare-fun b!233538 () Bool)

(declare-fun res!114607 () Bool)

(assert (=> b!233538 (=> (not res!114607) (not e!151704))))

(assert (=> b!233538 (= res!114607 (= (getValueByKey!262 (toList!1774 lt!118151) (_1!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))))))))

(declare-fun b!233539 () Bool)

(assert (=> b!233539 (= e!151704 (contains!1643 (toList!1774 lt!118151) (tuple2!4605 lt!118090 (zeroValue!4184 thiss!1504))))))

(assert (= (and d!58923 res!114606) b!233538))

(assert (= (and b!233538 res!114607) b!233539))

(declare-fun m!254965 () Bool)

(assert (=> d!58923 m!254965))

(declare-fun m!254967 () Bool)

(assert (=> d!58923 m!254967))

(declare-fun m!254969 () Bool)

(assert (=> d!58923 m!254969))

(declare-fun m!254971 () Bool)

(assert (=> d!58923 m!254971))

(declare-fun m!254973 () Bool)

(assert (=> b!233538 m!254973))

(declare-fun m!254975 () Bool)

(assert (=> b!233539 m!254975))

(assert (=> b!233451 d!58923))

(declare-fun e!151712 () SeekEntryResult!976)

(declare-fun b!233552 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233552 (= e!151712 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23622 lt!118017) #b00000000000000000000000000000001) (nextIndex!0 (index!6076 lt!118017) (x!23622 lt!118017) (mask!10269 thiss!1504)) (index!6076 lt!118017) key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)))))

(declare-fun b!233553 () Bool)

(declare-fun c!38855 () Bool)

(declare-fun lt!118160 () (_ BitVec 64))

(assert (=> b!233553 (= c!38855 (= lt!118160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151711 () SeekEntryResult!976)

(assert (=> b!233553 (= e!151711 e!151712)))

(declare-fun b!233554 () Bool)

(assert (=> b!233554 (= e!151711 (Found!976 (index!6076 lt!118017)))))

(declare-fun d!58925 () Bool)

(declare-fun lt!118159 () SeekEntryResult!976)

(assert (=> d!58925 (and (or ((_ is Undefined!976) lt!118159) (not ((_ is Found!976) lt!118159)) (and (bvsge (index!6075 lt!118159) #b00000000000000000000000000000000) (bvslt (index!6075 lt!118159) (size!5828 (_keys!6398 thiss!1504))))) (or ((_ is Undefined!976) lt!118159) ((_ is Found!976) lt!118159) (not ((_ is MissingVacant!976) lt!118159)) (not (= (index!6077 lt!118159) (index!6076 lt!118017))) (and (bvsge (index!6077 lt!118159) #b00000000000000000000000000000000) (bvslt (index!6077 lt!118159) (size!5828 (_keys!6398 thiss!1504))))) (or ((_ is Undefined!976) lt!118159) (ite ((_ is Found!976) lt!118159) (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6075 lt!118159)) key!932) (and ((_ is MissingVacant!976) lt!118159) (= (index!6077 lt!118159) (index!6076 lt!118017)) (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6077 lt!118159)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!151713 () SeekEntryResult!976)

(assert (=> d!58925 (= lt!118159 e!151713)))

(declare-fun c!38857 () Bool)

(assert (=> d!58925 (= c!38857 (bvsge (x!23622 lt!118017) #b01111111111111111111111111111110))))

(assert (=> d!58925 (= lt!118160 (select (arr!5495 (_keys!6398 thiss!1504)) (index!6076 lt!118017)))))

(assert (=> d!58925 (validMask!0 (mask!10269 thiss!1504))))

(assert (=> d!58925 (= (seekKeyOrZeroReturnVacant!0 (x!23622 lt!118017) (index!6076 lt!118017) (index!6076 lt!118017) key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)) lt!118159)))

(declare-fun b!233555 () Bool)

(assert (=> b!233555 (= e!151713 Undefined!976)))

(declare-fun b!233556 () Bool)

(assert (=> b!233556 (= e!151713 e!151711)))

(declare-fun c!38856 () Bool)

(assert (=> b!233556 (= c!38856 (= lt!118160 key!932))))

(declare-fun b!233557 () Bool)

(assert (=> b!233557 (= e!151712 (MissingVacant!976 (index!6076 lt!118017)))))

(assert (= (and d!58925 c!38857) b!233555))

(assert (= (and d!58925 (not c!38857)) b!233556))

(assert (= (and b!233556 c!38856) b!233554))

(assert (= (and b!233556 (not c!38856)) b!233553))

(assert (= (and b!233553 c!38855) b!233557))

(assert (= (and b!233553 (not c!38855)) b!233552))

(declare-fun m!254977 () Bool)

(assert (=> b!233552 m!254977))

(assert (=> b!233552 m!254977))

(declare-fun m!254979 () Bool)

(assert (=> b!233552 m!254979))

(declare-fun m!254981 () Bool)

(assert (=> d!58925 m!254981))

(declare-fun m!254983 () Bool)

(assert (=> d!58925 m!254983))

(assert (=> d!58925 m!254779))

(assert (=> d!58925 m!254743))

(assert (=> b!233396 d!58925))

(declare-fun d!58927 () Bool)

(declare-fun e!151714 () Bool)

(assert (=> d!58927 e!151714))

(declare-fun res!114608 () Bool)

(assert (=> d!58927 (=> (not res!114608) (not e!151714))))

(declare-fun lt!118161 () ListLongMap!3517)

(assert (=> d!58927 (= res!114608 (contains!1642 lt!118161 (_1!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))))))

(declare-fun lt!118164 () List!3516)

(assert (=> d!58927 (= lt!118161 (ListLongMap!3518 lt!118164))))

(declare-fun lt!118162 () Unit!7214)

(declare-fun lt!118163 () Unit!7214)

(assert (=> d!58927 (= lt!118162 lt!118163)))

(assert (=> d!58927 (= (getValueByKey!262 lt!118164 (_1!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))) (Some!267 (_2!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))))))

(assert (=> d!58927 (= lt!118163 (lemmaContainsTupThenGetReturnValue!147 lt!118164 (_1!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))) (_2!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))))))

(assert (=> d!58927 (= lt!118164 (insertStrictlySorted!150 (toList!1774 (ite c!38832 call!21717 (ite c!38833 call!21719 call!21714))) (_1!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))) (_2!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))))))

(assert (=> d!58927 (= (+!631 (ite c!38832 call!21717 (ite c!38833 call!21719 call!21714)) (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))) lt!118161)))

(declare-fun b!233558 () Bool)

(declare-fun res!114609 () Bool)

(assert (=> b!233558 (=> (not res!114609) (not e!151714))))

(assert (=> b!233558 (= res!114609 (= (getValueByKey!262 (toList!1774 lt!118161) (_1!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))) (Some!267 (_2!2313 (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))))))))

(declare-fun b!233559 () Bool)

(assert (=> b!233559 (= e!151714 (contains!1643 (toList!1774 lt!118161) (ite (or c!38832 c!38833) (tuple2!4605 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4184 thiss!1504)) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))))))

(assert (= (and d!58927 res!114608) b!233558))

(assert (= (and b!233558 res!114609) b!233559))

(declare-fun m!254985 () Bool)

(assert (=> d!58927 m!254985))

(declare-fun m!254987 () Bool)

(assert (=> d!58927 m!254987))

(declare-fun m!254989 () Bool)

(assert (=> d!58927 m!254989))

(declare-fun m!254991 () Bool)

(assert (=> d!58927 m!254991))

(declare-fun m!254993 () Bool)

(assert (=> b!233558 m!254993))

(declare-fun m!254995 () Bool)

(assert (=> b!233559 m!254995))

(assert (=> bm!21711 d!58927))

(assert (=> bm!21713 d!58913))

(declare-fun d!58929 () Bool)

(declare-fun e!151715 () Bool)

(assert (=> d!58929 e!151715))

(declare-fun res!114610 () Bool)

(assert (=> d!58929 (=> (not res!114610) (not e!151715))))

(declare-fun lt!118165 () ListLongMap!3517)

(assert (=> d!58929 (= res!114610 (contains!1642 lt!118165 (_1!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))))))

(declare-fun lt!118168 () List!3516)

(assert (=> d!58929 (= lt!118165 (ListLongMap!3518 lt!118168))))

(declare-fun lt!118166 () Unit!7214)

(declare-fun lt!118167 () Unit!7214)

(assert (=> d!58929 (= lt!118166 lt!118167)))

(assert (=> d!58929 (= (getValueByKey!262 lt!118168 (_1!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))))))

(assert (=> d!58929 (= lt!118167 (lemmaContainsTupThenGetReturnValue!147 lt!118168 (_1!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))))))

(assert (=> d!58929 (= lt!118168 (insertStrictlySorted!150 (toList!1774 call!21716) (_1!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))) (_2!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))))))

(assert (=> d!58929 (= (+!631 call!21716 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))) lt!118165)))

(declare-fun b!233560 () Bool)

(declare-fun res!114611 () Bool)

(assert (=> b!233560 (=> (not res!114611) (not e!151715))))

(assert (=> b!233560 (= res!114611 (= (getValueByKey!262 (toList!1774 lt!118165) (_1!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504)))) (Some!267 (_2!2313 (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))))))

(declare-fun b!233561 () Bool)

(assert (=> b!233561 (= e!151715 (contains!1643 (toList!1774 lt!118165) (tuple2!4605 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4184 thiss!1504))))))

(assert (= (and d!58929 res!114610) b!233560))

(assert (= (and b!233560 res!114611) b!233561))

(declare-fun m!254997 () Bool)

(assert (=> d!58929 m!254997))

(declare-fun m!254999 () Bool)

(assert (=> d!58929 m!254999))

(declare-fun m!255001 () Bool)

(assert (=> d!58929 m!255001))

(declare-fun m!255003 () Bool)

(assert (=> d!58929 m!255003))

(declare-fun m!255005 () Bool)

(assert (=> b!233560 m!255005))

(declare-fun m!255007 () Bool)

(assert (=> b!233561 m!255007))

(assert (=> b!233459 d!58929))

(declare-fun d!58931 () Bool)

(assert (=> d!58931 (= (apply!204 lt!118096 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2814 (getValueByKey!262 (toList!1774 lt!118096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8657 () Bool)

(assert (= bs!8657 d!58931))

(declare-fun m!255009 () Bool)

(assert (=> bs!8657 m!255009))

(assert (=> bs!8657 m!255009))

(declare-fun m!255011 () Bool)

(assert (=> bs!8657 m!255011))

(assert (=> b!233466 d!58931))

(declare-fun d!58933 () Bool)

(assert (=> d!58933 (= (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233458 d!58933))

(declare-fun d!58935 () Bool)

(declare-fun isEmpty!505 (Option!268) Bool)

(assert (=> d!58935 (= (isDefined!203 (getValueByKey!262 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932)) (not (isEmpty!505 (getValueByKey!262 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932))))))

(declare-fun bs!8658 () Bool)

(assert (= bs!8658 d!58935))

(assert (=> bs!8658 m!254797))

(declare-fun m!255013 () Bool)

(assert (=> bs!8658 m!255013))

(assert (=> b!233408 d!58935))

(declare-fun b!233570 () Bool)

(declare-fun e!151720 () Option!268)

(assert (=> b!233570 (= e!151720 (Some!267 (_2!2313 (h!4160 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))))))))

(declare-fun d!58937 () Bool)

(declare-fun c!38862 () Bool)

(assert (=> d!58937 (= c!38862 (and ((_ is Cons!3512) (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))) (= (_1!2313 (h!4160 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))))) key!932)))))

(assert (=> d!58937 (= (getValueByKey!262 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932) e!151720)))

(declare-fun b!233572 () Bool)

(declare-fun e!151721 () Option!268)

(assert (=> b!233572 (= e!151721 (getValueByKey!262 (t!8477 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))) key!932))))

(declare-fun b!233573 () Bool)

(assert (=> b!233573 (= e!151721 None!266)))

(declare-fun b!233571 () Bool)

(assert (=> b!233571 (= e!151720 e!151721)))

(declare-fun c!38863 () Bool)

(assert (=> b!233571 (= c!38863 (and ((_ is Cons!3512) (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))) (not (= (_1!2313 (h!4160 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))))) key!932))))))

(assert (= (and d!58937 c!38862) b!233570))

(assert (= (and d!58937 (not c!38862)) b!233571))

(assert (= (and b!233571 c!38863) b!233572))

(assert (= (and b!233571 (not c!38863)) b!233573))

(declare-fun m!255015 () Bool)

(assert (=> b!233572 m!255015))

(assert (=> b!233408 d!58937))

(assert (=> b!233464 d!58933))

(assert (=> d!58891 d!58887))

(declare-fun d!58939 () Bool)

(assert (=> d!58939 (isDefined!203 (getValueByKey!262 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932))))

(declare-fun lt!118171 () Unit!7214)

(declare-fun choose!1094 (List!3516 (_ BitVec 64)) Unit!7214)

(assert (=> d!58939 (= lt!118171 (choose!1094 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932))))

(declare-fun e!151724 () Bool)

(assert (=> d!58939 e!151724))

(declare-fun res!114614 () Bool)

(assert (=> d!58939 (=> (not res!114614) (not e!151724))))

(declare-fun isStrictlySorted!359 (List!3516) Bool)

(assert (=> d!58939 (= res!114614 (isStrictlySorted!359 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))))))

(assert (=> d!58939 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932) lt!118171)))

(declare-fun b!233576 () Bool)

(assert (=> b!233576 (= e!151724 (containsKey!254 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932))))

(assert (= (and d!58939 res!114614) b!233576))

(assert (=> d!58939 m!254797))

(assert (=> d!58939 m!254797))

(assert (=> d!58939 m!254799))

(declare-fun m!255017 () Bool)

(assert (=> d!58939 m!255017))

(declare-fun m!255019 () Bool)

(assert (=> d!58939 m!255019))

(assert (=> b!233576 m!254793))

(assert (=> b!233406 d!58939))

(assert (=> b!233406 d!58935))

(assert (=> b!233406 d!58937))

(declare-fun d!58941 () Bool)

(declare-fun e!151725 () Bool)

(assert (=> d!58941 e!151725))

(declare-fun res!114615 () Bool)

(assert (=> d!58941 (=> res!114615 e!151725)))

(declare-fun lt!118173 () Bool)

(assert (=> d!58941 (= res!114615 (not lt!118173))))

(declare-fun lt!118174 () Bool)

(assert (=> d!58941 (= lt!118173 lt!118174)))

(declare-fun lt!118175 () Unit!7214)

(declare-fun e!151726 () Unit!7214)

(assert (=> d!58941 (= lt!118175 e!151726)))

(declare-fun c!38864 () Bool)

(assert (=> d!58941 (= c!38864 lt!118174)))

(assert (=> d!58941 (= lt!118174 (containsKey!254 (toList!1774 lt!118096) (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58941 (= (contains!1642 lt!118096 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)) lt!118173)))

(declare-fun b!233577 () Bool)

(declare-fun lt!118172 () Unit!7214)

(assert (=> b!233577 (= e!151726 lt!118172)))

(assert (=> b!233577 (= lt!118172 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1774 lt!118096) (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233577 (isDefined!203 (getValueByKey!262 (toList!1774 lt!118096) (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233578 () Bool)

(declare-fun Unit!7219 () Unit!7214)

(assert (=> b!233578 (= e!151726 Unit!7219)))

(declare-fun b!233579 () Bool)

(assert (=> b!233579 (= e!151725 (isDefined!203 (getValueByKey!262 (toList!1774 lt!118096) (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!58941 c!38864) b!233577))

(assert (= (and d!58941 (not c!38864)) b!233578))

(assert (= (and d!58941 (not res!114615)) b!233579))

(assert (=> d!58941 m!254801))

(declare-fun m!255021 () Bool)

(assert (=> d!58941 m!255021))

(assert (=> b!233577 m!254801))

(declare-fun m!255023 () Bool)

(assert (=> b!233577 m!255023))

(assert (=> b!233577 m!254801))

(declare-fun m!255025 () Bool)

(assert (=> b!233577 m!255025))

(assert (=> b!233577 m!255025))

(declare-fun m!255027 () Bool)

(assert (=> b!233577 m!255027))

(assert (=> b!233579 m!254801))

(assert (=> b!233579 m!255025))

(assert (=> b!233579 m!255025))

(assert (=> b!233579 m!255027))

(assert (=> b!233463 d!58941))

(declare-fun d!58943 () Bool)

(declare-fun res!114623 () Bool)

(declare-fun e!151737 () Bool)

(assert (=> d!58943 (=> res!114623 e!151737)))

(assert (=> d!58943 (= res!114623 (bvsge #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(assert (=> d!58943 (= (arrayNoDuplicates!0 (_keys!6398 thiss!1504) #b00000000000000000000000000000000 Nil!3514) e!151737)))

(declare-fun b!233590 () Bool)

(declare-fun e!151738 () Bool)

(declare-fun contains!1644 (List!3517 (_ BitVec 64)) Bool)

(assert (=> b!233590 (= e!151738 (contains!1644 Nil!3514 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233591 () Bool)

(declare-fun e!151736 () Bool)

(declare-fun e!151735 () Bool)

(assert (=> b!233591 (= e!151736 e!151735)))

(declare-fun c!38867 () Bool)

(assert (=> b!233591 (= c!38867 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233592 () Bool)

(assert (=> b!233592 (= e!151737 e!151736)))

(declare-fun res!114622 () Bool)

(assert (=> b!233592 (=> (not res!114622) (not e!151736))))

(assert (=> b!233592 (= res!114622 (not e!151738))))

(declare-fun res!114624 () Bool)

(assert (=> b!233592 (=> (not res!114624) (not e!151738))))

(assert (=> b!233592 (= res!114624 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21723 () Bool)

(declare-fun call!21726 () Bool)

(assert (=> bm!21723 (= call!21726 (arrayNoDuplicates!0 (_keys!6398 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!38867 (Cons!3513 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000) Nil!3514) Nil!3514)))))

(declare-fun b!233593 () Bool)

(assert (=> b!233593 (= e!151735 call!21726)))

(declare-fun b!233594 () Bool)

(assert (=> b!233594 (= e!151735 call!21726)))

(assert (= (and d!58943 (not res!114623)) b!233592))

(assert (= (and b!233592 res!114624) b!233590))

(assert (= (and b!233592 res!114622) b!233591))

(assert (= (and b!233591 c!38867) b!233594))

(assert (= (and b!233591 (not c!38867)) b!233593))

(assert (= (or b!233594 b!233593) bm!21723))

(assert (=> b!233590 m!254801))

(assert (=> b!233590 m!254801))

(declare-fun m!255029 () Bool)

(assert (=> b!233590 m!255029))

(assert (=> b!233591 m!254801))

(assert (=> b!233591 m!254801))

(assert (=> b!233591 m!254855))

(assert (=> b!233592 m!254801))

(assert (=> b!233592 m!254801))

(assert (=> b!233592 m!254855))

(assert (=> bm!21723 m!254801))

(declare-fun m!255031 () Bool)

(assert (=> bm!21723 m!255031))

(assert (=> b!233381 d!58943))

(declare-fun b!233613 () Bool)

(declare-fun e!151753 () SeekEntryResult!976)

(assert (=> b!233613 (= e!151753 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10269 thiss!1504)) #b00000000000000000000000000000000 (mask!10269 thiss!1504)) key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)))))

(declare-fun b!233614 () Bool)

(declare-fun e!151749 () Bool)

(declare-fun lt!118181 () SeekEntryResult!976)

(assert (=> b!233614 (= e!151749 (bvsge (x!23622 lt!118181) #b01111111111111111111111111111110))))

(declare-fun b!233615 () Bool)

(assert (=> b!233615 (and (bvsge (index!6076 lt!118181) #b00000000000000000000000000000000) (bvslt (index!6076 lt!118181) (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun res!114631 () Bool)

(assert (=> b!233615 (= res!114631 (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6076 lt!118181)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151751 () Bool)

(assert (=> b!233615 (=> res!114631 e!151751)))

(declare-fun b!233616 () Bool)

(declare-fun e!151752 () SeekEntryResult!976)

(assert (=> b!233616 (= e!151752 (Intermediate!976 true (toIndex!0 key!932 (mask!10269 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!233617 () Bool)

(assert (=> b!233617 (and (bvsge (index!6076 lt!118181) #b00000000000000000000000000000000) (bvslt (index!6076 lt!118181) (size!5828 (_keys!6398 thiss!1504))))))

(assert (=> b!233617 (= e!151751 (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6076 lt!118181)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233618 () Bool)

(assert (=> b!233618 (= e!151752 e!151753)))

(declare-fun c!38874 () Bool)

(declare-fun lt!118180 () (_ BitVec 64))

(assert (=> b!233618 (= c!38874 (or (= lt!118180 key!932) (= (bvadd lt!118180 lt!118180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!58945 () Bool)

(assert (=> d!58945 e!151749))

(declare-fun c!38875 () Bool)

(assert (=> d!58945 (= c!38875 (and ((_ is Intermediate!976) lt!118181) (undefined!1788 lt!118181)))))

(assert (=> d!58945 (= lt!118181 e!151752)))

(declare-fun c!38876 () Bool)

(assert (=> d!58945 (= c!38876 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!58945 (= lt!118180 (select (arr!5495 (_keys!6398 thiss!1504)) (toIndex!0 key!932 (mask!10269 thiss!1504))))))

(assert (=> d!58945 (validMask!0 (mask!10269 thiss!1504))))

(assert (=> d!58945 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10269 thiss!1504)) key!932 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)) lt!118181)))

(declare-fun b!233619 () Bool)

(assert (=> b!233619 (and (bvsge (index!6076 lt!118181) #b00000000000000000000000000000000) (bvslt (index!6076 lt!118181) (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun res!114633 () Bool)

(assert (=> b!233619 (= res!114633 (= (select (arr!5495 (_keys!6398 thiss!1504)) (index!6076 lt!118181)) key!932))))

(assert (=> b!233619 (=> res!114633 e!151751)))

(declare-fun e!151750 () Bool)

(assert (=> b!233619 (= e!151750 e!151751)))

(declare-fun b!233620 () Bool)

(assert (=> b!233620 (= e!151749 e!151750)))

(declare-fun res!114632 () Bool)

(assert (=> b!233620 (= res!114632 (and ((_ is Intermediate!976) lt!118181) (not (undefined!1788 lt!118181)) (bvslt (x!23622 lt!118181) #b01111111111111111111111111111110) (bvsge (x!23622 lt!118181) #b00000000000000000000000000000000) (bvsge (x!23622 lt!118181) #b00000000000000000000000000000000)))))

(assert (=> b!233620 (=> (not res!114632) (not e!151750))))

(declare-fun b!233621 () Bool)

(assert (=> b!233621 (= e!151753 (Intermediate!976 false (toIndex!0 key!932 (mask!10269 thiss!1504)) #b00000000000000000000000000000000))))

(assert (= (and d!58945 c!38876) b!233616))

(assert (= (and d!58945 (not c!38876)) b!233618))

(assert (= (and b!233618 c!38874) b!233621))

(assert (= (and b!233618 (not c!38874)) b!233613))

(assert (= (and d!58945 c!38875) b!233614))

(assert (= (and d!58945 (not c!38875)) b!233620))

(assert (= (and b!233620 res!114632) b!233619))

(assert (= (and b!233619 (not res!114633)) b!233615))

(assert (= (and b!233615 (not res!114631)) b!233617))

(declare-fun m!255033 () Bool)

(assert (=> b!233619 m!255033))

(assert (=> b!233613 m!254783))

(declare-fun m!255035 () Bool)

(assert (=> b!233613 m!255035))

(assert (=> b!233613 m!255035))

(declare-fun m!255037 () Bool)

(assert (=> b!233613 m!255037))

(assert (=> b!233615 m!255033))

(assert (=> b!233617 m!255033))

(assert (=> d!58945 m!254783))

(declare-fun m!255039 () Bool)

(assert (=> d!58945 m!255039))

(assert (=> d!58945 m!254743))

(assert (=> d!58885 d!58945))

(declare-fun d!58947 () Bool)

(declare-fun lt!118187 () (_ BitVec 32))

(declare-fun lt!118186 () (_ BitVec 32))

(assert (=> d!58947 (= lt!118187 (bvmul (bvxor lt!118186 (bvlshr lt!118186 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!58947 (= lt!118186 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!58947 (and (bvsge (mask!10269 thiss!1504) #b00000000000000000000000000000000) (let ((res!114634 (let ((h!4162 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23640 (bvmul (bvxor h!4162 (bvlshr h!4162 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23640 (bvlshr x!23640 #b00000000000000000000000000001101)) (mask!10269 thiss!1504)))))) (and (bvslt res!114634 (bvadd (mask!10269 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!114634 #b00000000000000000000000000000000))))))

(assert (=> d!58947 (= (toIndex!0 key!932 (mask!10269 thiss!1504)) (bvand (bvxor lt!118187 (bvlshr lt!118187 #b00000000000000000000000000001101)) (mask!10269 thiss!1504)))))

(assert (=> d!58885 d!58947))

(assert (=> d!58885 d!58887))

(declare-fun d!58949 () Bool)

(declare-fun e!151754 () Bool)

(assert (=> d!58949 e!151754))

(declare-fun res!114635 () Bool)

(assert (=> d!58949 (=> res!114635 e!151754)))

(declare-fun lt!118189 () Bool)

(assert (=> d!58949 (= res!114635 (not lt!118189))))

(declare-fun lt!118190 () Bool)

(assert (=> d!58949 (= lt!118189 lt!118190)))

(declare-fun lt!118191 () Unit!7214)

(declare-fun e!151755 () Unit!7214)

(assert (=> d!58949 (= lt!118191 e!151755)))

(declare-fun c!38877 () Bool)

(assert (=> d!58949 (= c!38877 lt!118190)))

(assert (=> d!58949 (= lt!118190 (containsKey!254 (toList!1774 lt!118096) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58949 (= (contains!1642 lt!118096 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118189)))

(declare-fun b!233622 () Bool)

(declare-fun lt!118188 () Unit!7214)

(assert (=> b!233622 (= e!151755 lt!118188)))

(assert (=> b!233622 (= lt!118188 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1774 lt!118096) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233622 (isDefined!203 (getValueByKey!262 (toList!1774 lt!118096) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233623 () Bool)

(declare-fun Unit!7220 () Unit!7214)

(assert (=> b!233623 (= e!151755 Unit!7220)))

(declare-fun b!233624 () Bool)

(assert (=> b!233624 (= e!151754 (isDefined!203 (getValueByKey!262 (toList!1774 lt!118096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58949 c!38877) b!233622))

(assert (= (and d!58949 (not c!38877)) b!233623))

(assert (= (and d!58949 (not res!114635)) b!233624))

(declare-fun m!255041 () Bool)

(assert (=> d!58949 m!255041))

(declare-fun m!255043 () Bool)

(assert (=> b!233622 m!255043))

(declare-fun m!255045 () Bool)

(assert (=> b!233622 m!255045))

(assert (=> b!233622 m!255045))

(declare-fun m!255047 () Bool)

(assert (=> b!233622 m!255047))

(assert (=> b!233624 m!255045))

(assert (=> b!233624 m!255045))

(assert (=> b!233624 m!255047))

(assert (=> bm!21714 d!58949))

(declare-fun b!233633 () Bool)

(declare-fun e!151762 () Bool)

(declare-fun e!151763 () Bool)

(assert (=> b!233633 (= e!151762 e!151763)))

(declare-fun c!38880 () Bool)

(assert (=> b!233633 (= c!38880 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233634 () Bool)

(declare-fun e!151764 () Bool)

(declare-fun call!21729 () Bool)

(assert (=> b!233634 (= e!151764 call!21729)))

(declare-fun d!58951 () Bool)

(declare-fun res!114641 () Bool)

(assert (=> d!58951 (=> res!114641 e!151762)))

(assert (=> d!58951 (= res!114641 (bvsge #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(assert (=> d!58951 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6398 thiss!1504) (mask!10269 thiss!1504)) e!151762)))

(declare-fun b!233635 () Bool)

(assert (=> b!233635 (= e!151763 call!21729)))

(declare-fun b!233636 () Bool)

(assert (=> b!233636 (= e!151763 e!151764)))

(declare-fun lt!118198 () (_ BitVec 64))

(assert (=> b!233636 (= lt!118198 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118200 () Unit!7214)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11553 (_ BitVec 64) (_ BitVec 32)) Unit!7214)

(assert (=> b!233636 (= lt!118200 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6398 thiss!1504) lt!118198 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233636 (arrayContainsKey!0 (_keys!6398 thiss!1504) lt!118198 #b00000000000000000000000000000000)))

(declare-fun lt!118199 () Unit!7214)

(assert (=> b!233636 (= lt!118199 lt!118200)))

(declare-fun res!114640 () Bool)

(assert (=> b!233636 (= res!114640 (= (seekEntryOrOpen!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000) (_keys!6398 thiss!1504) (mask!10269 thiss!1504)) (Found!976 #b00000000000000000000000000000000)))))

(assert (=> b!233636 (=> (not res!114640) (not e!151764))))

(declare-fun bm!21726 () Bool)

(assert (=> bm!21726 (= call!21729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6398 thiss!1504) (mask!10269 thiss!1504)))))

(assert (= (and d!58951 (not res!114641)) b!233633))

(assert (= (and b!233633 c!38880) b!233636))

(assert (= (and b!233633 (not c!38880)) b!233635))

(assert (= (and b!233636 res!114640) b!233634))

(assert (= (or b!233634 b!233635) bm!21726))

(assert (=> b!233633 m!254801))

(assert (=> b!233633 m!254801))

(assert (=> b!233633 m!254855))

(assert (=> b!233636 m!254801))

(declare-fun m!255049 () Bool)

(assert (=> b!233636 m!255049))

(declare-fun m!255051 () Bool)

(assert (=> b!233636 m!255051))

(assert (=> b!233636 m!254801))

(declare-fun m!255053 () Bool)

(assert (=> b!233636 m!255053))

(declare-fun m!255055 () Bool)

(assert (=> bm!21726 m!255055))

(assert (=> b!233380 d!58951))

(declare-fun d!58953 () Bool)

(declare-fun res!114646 () Bool)

(declare-fun e!151769 () Bool)

(assert (=> d!58953 (=> res!114646 e!151769)))

(assert (=> d!58953 (= res!114646 (and ((_ is Cons!3512) (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))) (= (_1!2313 (h!4160 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))))) key!932)))))

(assert (=> d!58953 (= (containsKey!254 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))) key!932) e!151769)))

(declare-fun b!233641 () Bool)

(declare-fun e!151770 () Bool)

(assert (=> b!233641 (= e!151769 e!151770)))

(declare-fun res!114647 () Bool)

(assert (=> b!233641 (=> (not res!114647) (not e!151770))))

(assert (=> b!233641 (= res!114647 (and (or (not ((_ is Cons!3512) (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))))) (bvsle (_1!2313 (h!4160 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))))) key!932)) ((_ is Cons!3512) (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))) (bvslt (_1!2313 (h!4160 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504))))) key!932)))))

(declare-fun b!233642 () Bool)

(assert (=> b!233642 (= e!151770 (containsKey!254 (t!8477 (toList!1774 (getCurrentListMap!1302 (_keys!6398 thiss!1504) (_values!4326 thiss!1504) (mask!10269 thiss!1504) (extraKeys!4080 thiss!1504) (zeroValue!4184 thiss!1504) (minValue!4184 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4343 thiss!1504)))) key!932))))

(assert (= (and d!58953 (not res!114646)) b!233641))

(assert (= (and b!233641 res!114647) b!233642))

(declare-fun m!255057 () Bool)

(assert (=> b!233642 m!255057))

(assert (=> d!58889 d!58953))

(declare-fun d!58955 () Bool)

(assert (=> d!58955 (= (apply!204 lt!118096 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2814 (getValueByKey!262 (toList!1774 lt!118096) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8659 () Bool)

(assert (= bs!8659 d!58955))

(assert (=> bs!8659 m!255045))

(assert (=> bs!8659 m!255045))

(declare-fun m!255059 () Bool)

(assert (=> bs!8659 m!255059))

(assert (=> b!233468 d!58955))

(declare-fun b!233651 () Bool)

(declare-fun e!151776 () (_ BitVec 32))

(declare-fun call!21732 () (_ BitVec 32))

(assert (=> b!233651 (= e!151776 (bvadd #b00000000000000000000000000000001 call!21732))))

(declare-fun b!233652 () Bool)

(assert (=> b!233652 (= e!151776 call!21732)))

(declare-fun bm!21729 () Bool)

(assert (=> bm!21729 (= call!21732 (arrayCountValidKeys!0 (_keys!6398 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5828 (_keys!6398 thiss!1504))))))

(declare-fun b!233653 () Bool)

(declare-fun e!151775 () (_ BitVec 32))

(assert (=> b!233653 (= e!151775 e!151776)))

(declare-fun c!38886 () Bool)

(assert (=> b!233653 (= c!38886 (validKeyInArray!0 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!58957 () Bool)

(declare-fun lt!118203 () (_ BitVec 32))

(assert (=> d!58957 (and (bvsge lt!118203 #b00000000000000000000000000000000) (bvsle lt!118203 (bvsub (size!5828 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!58957 (= lt!118203 e!151775)))

(declare-fun c!38885 () Bool)

(assert (=> d!58957 (= c!38885 (bvsge #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))))))

(assert (=> d!58957 (and (bvsle #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5828 (_keys!6398 thiss!1504)) (size!5828 (_keys!6398 thiss!1504))))))

(assert (=> d!58957 (= (arrayCountValidKeys!0 (_keys!6398 thiss!1504) #b00000000000000000000000000000000 (size!5828 (_keys!6398 thiss!1504))) lt!118203)))

(declare-fun b!233654 () Bool)

(assert (=> b!233654 (= e!151775 #b00000000000000000000000000000000)))

(assert (= (and d!58957 c!38885) b!233654))

(assert (= (and d!58957 (not c!38885)) b!233653))

(assert (= (and b!233653 c!38886) b!233651))

(assert (= (and b!233653 (not c!38886)) b!233652))

(assert (= (or b!233651 b!233652) bm!21729))

(declare-fun m!255061 () Bool)

(assert (=> bm!21729 m!255061))

(assert (=> b!233653 m!254801))

(assert (=> b!233653 m!254801))

(assert (=> b!233653 m!254855))

(assert (=> b!233379 d!58957))

(declare-fun b!233665 () Bool)

(declare-fun res!114659 () Bool)

(declare-fun e!151779 () Bool)

(assert (=> b!233665 (=> (not res!114659) (not e!151779))))

(declare-fun size!5831 (LongMapFixedSize!3366) (_ BitVec 32))

(assert (=> b!233665 (= res!114659 (= (size!5831 thiss!1504) (bvadd (_size!1732 thiss!1504) (bvsdiv (bvadd (extraKeys!4080 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!233666 () Bool)

(assert (=> b!233666 (= e!151779 (and (bvsge (extraKeys!4080 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4080 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1732 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun d!58959 () Bool)

(declare-fun res!114658 () Bool)

(assert (=> d!58959 (=> (not res!114658) (not e!151779))))

(assert (=> d!58959 (= res!114658 (validMask!0 (mask!10269 thiss!1504)))))

(assert (=> d!58959 (= (simpleValid!227 thiss!1504) e!151779)))

(declare-fun b!233663 () Bool)

(declare-fun res!114656 () Bool)

(assert (=> b!233663 (=> (not res!114656) (not e!151779))))

(assert (=> b!233663 (= res!114656 (and (= (size!5827 (_values!4326 thiss!1504)) (bvadd (mask!10269 thiss!1504) #b00000000000000000000000000000001)) (= (size!5828 (_keys!6398 thiss!1504)) (size!5827 (_values!4326 thiss!1504))) (bvsge (_size!1732 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1732 thiss!1504) (bvadd (mask!10269 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!233664 () Bool)

(declare-fun res!114657 () Bool)

(assert (=> b!233664 (=> (not res!114657) (not e!151779))))

(assert (=> b!233664 (= res!114657 (bvsge (size!5831 thiss!1504) (_size!1732 thiss!1504)))))

(assert (= (and d!58959 res!114658) b!233663))

(assert (= (and b!233663 res!114656) b!233664))

(assert (= (and b!233664 res!114657) b!233665))

(assert (= (and b!233665 res!114659) b!233666))

(declare-fun m!255063 () Bool)

(assert (=> b!233665 m!255063))

(assert (=> d!58959 m!254743))

(assert (=> b!233664 m!255063))

(assert (=> d!58883 d!58959))

(declare-fun d!58961 () Bool)

(assert (=> d!58961 (= (apply!204 lt!118096 (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000)) (get!2814 (getValueByKey!262 (toList!1774 lt!118096) (select (arr!5495 (_keys!6398 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8660 () Bool)

(assert (= bs!8660 d!58961))

(assert (=> bs!8660 m!254801))

(assert (=> bs!8660 m!255025))

(assert (=> bs!8660 m!255025))

(declare-fun m!255065 () Bool)

(assert (=> bs!8660 m!255065))

(assert (=> b!233460 d!58961))

(declare-fun d!58963 () Bool)

(declare-fun c!38889 () Bool)

(assert (=> d!58963 (= c!38889 ((_ is ValueCellFull!2733) (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!151782 () V!7851)

(assert (=> d!58963 (= (get!2813 (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4343 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!151782)))

(declare-fun b!233671 () Bool)

(declare-fun get!2815 (ValueCell!2733 V!7851) V!7851)

(assert (=> b!233671 (= e!151782 (get!2815 (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4343 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233672 () Bool)

(declare-fun get!2816 (ValueCell!2733 V!7851) V!7851)

(assert (=> b!233672 (= e!151782 (get!2816 (select (arr!5494 (_values!4326 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!547 (defaultEntry!4343 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58963 c!38889) b!233671))

(assert (= (and d!58963 (not c!38889)) b!233672))

(assert (=> b!233671 m!254845))

(assert (=> b!233671 m!254847))

(declare-fun m!255067 () Bool)

(assert (=> b!233671 m!255067))

(assert (=> b!233672 m!254845))

(assert (=> b!233672 m!254847))

(declare-fun m!255069 () Bool)

(assert (=> b!233672 m!255069))

(assert (=> b!233460 d!58963))

(declare-fun d!58965 () Bool)

(declare-fun e!151783 () Bool)

(assert (=> d!58965 e!151783))

(declare-fun res!114660 () Bool)

(assert (=> d!58965 (=> res!114660 e!151783)))

(declare-fun lt!118205 () Bool)

(assert (=> d!58965 (= res!114660 (not lt!118205))))

(declare-fun lt!118206 () Bool)

(assert (=> d!58965 (= lt!118205 lt!118206)))

(declare-fun lt!118207 () Unit!7214)

(declare-fun e!151784 () Unit!7214)

(assert (=> d!58965 (= lt!118207 e!151784)))

(declare-fun c!38890 () Bool)

(assert (=> d!58965 (= c!38890 lt!118206)))

(assert (=> d!58965 (= lt!118206 (containsKey!254 (toList!1774 lt!118096) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!58965 (= (contains!1642 lt!118096 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118205)))

(declare-fun b!233673 () Bool)

(declare-fun lt!118204 () Unit!7214)

(assert (=> b!233673 (= e!151784 lt!118204)))

(assert (=> b!233673 (= lt!118204 (lemmaContainsKeyImpliesGetValueByKeyDefined!202 (toList!1774 lt!118096) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233673 (isDefined!203 (getValueByKey!262 (toList!1774 lt!118096) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233674 () Bool)

(declare-fun Unit!7221 () Unit!7214)

(assert (=> b!233674 (= e!151784 Unit!7221)))

(declare-fun b!233675 () Bool)

(assert (=> b!233675 (= e!151783 (isDefined!203 (getValueByKey!262 (toList!1774 lt!118096) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!58965 c!38890) b!233673))

(assert (= (and d!58965 (not c!38890)) b!233674))

(assert (= (and d!58965 (not res!114660)) b!233675))

(declare-fun m!255071 () Bool)

(assert (=> d!58965 m!255071))

(declare-fun m!255073 () Bool)

(assert (=> b!233673 m!255073))

(assert (=> b!233673 m!255009))

(assert (=> b!233673 m!255009))

(declare-fun m!255075 () Bool)

(assert (=> b!233673 m!255075))

(assert (=> b!233675 m!255009))

(assert (=> b!233675 m!255009))

(assert (=> b!233675 m!255075))

(assert (=> bm!21717 d!58965))

(declare-fun mapNonEmpty!10409 () Bool)

(declare-fun mapRes!10409 () Bool)

(declare-fun tp!22028 () Bool)

(declare-fun e!151786 () Bool)

(assert (=> mapNonEmpty!10409 (= mapRes!10409 (and tp!22028 e!151786))))

(declare-fun mapValue!10409 () ValueCell!2733)

(declare-fun mapRest!10409 () (Array (_ BitVec 32) ValueCell!2733))

(declare-fun mapKey!10409 () (_ BitVec 32))

(assert (=> mapNonEmpty!10409 (= mapRest!10408 (store mapRest!10409 mapKey!10409 mapValue!10409))))

(declare-fun b!233677 () Bool)

(declare-fun e!151785 () Bool)

(assert (=> b!233677 (= e!151785 tp_is_empty!6153)))

(declare-fun condMapEmpty!10409 () Bool)

(declare-fun mapDefault!10409 () ValueCell!2733)

(assert (=> mapNonEmpty!10408 (= condMapEmpty!10409 (= mapRest!10408 ((as const (Array (_ BitVec 32) ValueCell!2733)) mapDefault!10409)))))

(assert (=> mapNonEmpty!10408 (= tp!22027 (and e!151785 mapRes!10409))))

(declare-fun mapIsEmpty!10409 () Bool)

(assert (=> mapIsEmpty!10409 mapRes!10409))

(declare-fun b!233676 () Bool)

(assert (=> b!233676 (= e!151786 tp_is_empty!6153)))

(assert (= (and mapNonEmpty!10408 condMapEmpty!10409) mapIsEmpty!10409))

(assert (= (and mapNonEmpty!10408 (not condMapEmpty!10409)) mapNonEmpty!10409))

(assert (= (and mapNonEmpty!10409 ((_ is ValueCellFull!2733) mapValue!10409)) b!233676))

(assert (= (and mapNonEmpty!10408 ((_ is ValueCellFull!2733) mapDefault!10409)) b!233677))

(declare-fun m!255077 () Bool)

(assert (=> mapNonEmpty!10409 m!255077))

(declare-fun b_lambda!7855 () Bool)

(assert (= b_lambda!7851 (or (and b!233344 b_free!6291) b_lambda!7855)))

(declare-fun b_lambda!7857 () Bool)

(assert (= b_lambda!7853 (or (and b!233344 b_free!6291) b_lambda!7857)))

(check-sat (not b!233558) b_and!13199 (not b!233535) (not b!233664) (not bm!21720) (not b!233591) (not d!58913) (not b!233492) (not b!233673) (not b!233592) (not b!233491) (not d!58955) (not d!58961) (not b_lambda!7855) (not b!233526) (not d!58903) (not b!233672) (not b!233552) (not b!233590) (not d!58897) (not b!233576) (not d!58925) (not b!233561) (not b!233537) (not d!58895) (not d!58919) (not b!233665) (not b_next!6291) (not b!233521) (not b!233532) (not d!58911) (not b!233579) (not d!58907) (not d!58905) (not d!58915) (not d!58949) (not bm!21723) (not b!233496) (not d!58935) (not d!58965) (not bm!21726) (not b!233613) (not b!233633) (not b!233533) (not d!58917) (not b!233560) (not b!233636) (not d!58923) (not mapNonEmpty!10409) (not b!233671) (not b_lambda!7857) (not d!58893) (not d!58939) (not d!58921) (not d!58931) (not d!58899) (not b!233572) (not b!233538) (not b!233495) (not b!233536) (not b!233523) (not b_lambda!7849) (not b!233622) (not b!233675) (not d!58945) (not d!58929) (not b!233559) (not b!233527) (not b!233524) (not d!58941) (not b!233530) (not b!233642) (not d!58927) tp_is_empty!6153 (not d!58909) (not b!233539) (not bm!21729) (not d!58901) (not b!233577) (not b!233624) (not b!233531) (not b!233653) (not d!58959))
(check-sat b_and!13199 (not b_next!6291))
