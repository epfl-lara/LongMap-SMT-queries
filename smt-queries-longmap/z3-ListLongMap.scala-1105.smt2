; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22774 () Bool)

(assert start!22774)

(declare-fun b!237483 () Bool)

(declare-fun b_free!6381 () Bool)

(declare-fun b_next!6381 () Bool)

(assert (=> b!237483 (= b_free!6381 (not b_next!6381))))

(declare-fun tp!22334 () Bool)

(declare-fun b_and!13335 () Bool)

(assert (=> b!237483 (= tp!22334 b_and!13335)))

(declare-fun b!237479 () Bool)

(declare-fun e!154219 () Bool)

(declare-datatypes ((V!7971 0))(
  ( (V!7972 (val!3166 Int)) )
))
(declare-datatypes ((ValueCell!2778 0))(
  ( (ValueCellFull!2778 (v!5200 V!7971)) (EmptyCell!2778) )
))
(declare-datatypes ((array!11757 0))(
  ( (array!11758 (arr!5584 (Array (_ BitVec 32) ValueCell!2778)) (size!5924 (_ BitVec 32))) )
))
(declare-datatypes ((array!11759 0))(
  ( (array!11760 (arr!5585 (Array (_ BitVec 32) (_ BitVec 64))) (size!5925 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3456 0))(
  ( (LongMapFixedSize!3457 (defaultEntry!4408 Int) (mask!10421 (_ BitVec 32)) (extraKeys!4145 (_ BitVec 32)) (zeroValue!4249 V!7971) (minValue!4249 V!7971) (_size!1777 (_ BitVec 32)) (_keys!6500 array!11759) (_values!4391 array!11757) (_vacant!1777 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3456)

(assert (=> b!237479 (= e!154219 (and (= (size!5924 (_values!4391 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10421 thiss!1504))) (= (size!5925 (_keys!6500 thiss!1504)) (size!5924 (_values!4391 thiss!1504))) (bvsge (mask!10421 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4145 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4145 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!10583 () Bool)

(declare-fun mapRes!10583 () Bool)

(assert (=> mapIsEmpty!10583 mapRes!10583))

(declare-fun b!237480 () Bool)

(declare-fun res!116391 () Bool)

(assert (=> b!237480 (=> (not res!116391) (not e!154219))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4666 0))(
  ( (tuple2!4667 (_1!2344 (_ BitVec 64)) (_2!2344 V!7971)) )
))
(declare-datatypes ((List!3566 0))(
  ( (Nil!3563) (Cons!3562 (h!4217 tuple2!4666) (t!8553 List!3566)) )
))
(declare-datatypes ((ListLongMap!3579 0))(
  ( (ListLongMap!3580 (toList!1805 List!3566)) )
))
(declare-fun contains!1689 (ListLongMap!3579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1333 (array!11759 array!11757 (_ BitVec 32) (_ BitVec 32) V!7971 V!7971 (_ BitVec 32) Int) ListLongMap!3579)

(assert (=> b!237480 (= res!116391 (not (contains!1689 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)) key!932)))))

(declare-fun b!237481 () Bool)

(declare-fun res!116393 () Bool)

(assert (=> b!237481 (=> (not res!116393) (not e!154219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!237481 (= res!116393 (validMask!0 (mask!10421 thiss!1504)))))

(declare-fun e!154220 () Bool)

(declare-fun tp_is_empty!6243 () Bool)

(declare-fun e!154217 () Bool)

(declare-fun array_inv!3687 (array!11759) Bool)

(declare-fun array_inv!3688 (array!11757) Bool)

(assert (=> b!237483 (= e!154217 (and tp!22334 tp_is_empty!6243 (array_inv!3687 (_keys!6500 thiss!1504)) (array_inv!3688 (_values!4391 thiss!1504)) e!154220))))

(declare-fun b!237484 () Bool)

(declare-fun res!116390 () Bool)

(declare-fun e!154222 () Bool)

(assert (=> b!237484 (=> (not res!116390) (not e!154222))))

(assert (=> b!237484 (= res!116390 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237485 () Bool)

(declare-fun e!154218 () Bool)

(assert (=> b!237485 (= e!154218 tp_is_empty!6243)))

(declare-fun b!237486 () Bool)

(assert (=> b!237486 (= e!154220 (and e!154218 mapRes!10583))))

(declare-fun condMapEmpty!10583 () Bool)

(declare-fun mapDefault!10583 () ValueCell!2778)

(assert (=> b!237486 (= condMapEmpty!10583 (= (arr!5584 (_values!4391 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2778)) mapDefault!10583)))))

(declare-fun b!237487 () Bool)

(assert (=> b!237487 (= e!154222 e!154219)))

(declare-fun res!116392 () Bool)

(assert (=> b!237487 (=> (not res!116392) (not e!154219))))

(declare-datatypes ((SeekEntryResult!1009 0))(
  ( (MissingZero!1009 (index!6206 (_ BitVec 32))) (Found!1009 (index!6207 (_ BitVec 32))) (Intermediate!1009 (undefined!1821 Bool) (index!6208 (_ BitVec 32)) (x!23961 (_ BitVec 32))) (Undefined!1009) (MissingVacant!1009 (index!6209 (_ BitVec 32))) )
))
(declare-fun lt!120088 () SeekEntryResult!1009)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!237487 (= res!116392 (or (= lt!120088 (MissingZero!1009 index!297)) (= lt!120088 (MissingVacant!1009 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11759 (_ BitVec 32)) SeekEntryResult!1009)

(assert (=> b!237487 (= lt!120088 (seekEntryOrOpen!0 key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)))))

(declare-fun mapNonEmpty!10583 () Bool)

(declare-fun tp!22333 () Bool)

(declare-fun e!154216 () Bool)

(assert (=> mapNonEmpty!10583 (= mapRes!10583 (and tp!22333 e!154216))))

(declare-fun mapRest!10583 () (Array (_ BitVec 32) ValueCell!2778))

(declare-fun mapKey!10583 () (_ BitVec 32))

(declare-fun mapValue!10583 () ValueCell!2778)

(assert (=> mapNonEmpty!10583 (= (arr!5584 (_values!4391 thiss!1504)) (store mapRest!10583 mapKey!10583 mapValue!10583))))

(declare-fun b!237482 () Bool)

(assert (=> b!237482 (= e!154216 tp_is_empty!6243)))

(declare-fun res!116394 () Bool)

(assert (=> start!22774 (=> (not res!116394) (not e!154222))))

(declare-fun valid!1364 (LongMapFixedSize!3456) Bool)

(assert (=> start!22774 (= res!116394 (valid!1364 thiss!1504))))

(assert (=> start!22774 e!154222))

(assert (=> start!22774 e!154217))

(assert (=> start!22774 true))

(assert (= (and start!22774 res!116394) b!237484))

(assert (= (and b!237484 res!116390) b!237487))

(assert (= (and b!237487 res!116392) b!237480))

(assert (= (and b!237480 res!116391) b!237481))

(assert (= (and b!237481 res!116393) b!237479))

(assert (= (and b!237486 condMapEmpty!10583) mapIsEmpty!10583))

(assert (= (and b!237486 (not condMapEmpty!10583)) mapNonEmpty!10583))

(get-info :version)

(assert (= (and mapNonEmpty!10583 ((_ is ValueCellFull!2778) mapValue!10583)) b!237482))

(assert (= (and b!237486 ((_ is ValueCellFull!2778) mapDefault!10583)) b!237485))

(assert (= b!237483 b!237486))

(assert (= start!22774 b!237483))

(declare-fun m!258237 () Bool)

(assert (=> b!237487 m!258237))

(declare-fun m!258239 () Bool)

(assert (=> mapNonEmpty!10583 m!258239))

(declare-fun m!258241 () Bool)

(assert (=> b!237483 m!258241))

(declare-fun m!258243 () Bool)

(assert (=> b!237483 m!258243))

(declare-fun m!258245 () Bool)

(assert (=> b!237480 m!258245))

(assert (=> b!237480 m!258245))

(declare-fun m!258247 () Bool)

(assert (=> b!237480 m!258247))

(declare-fun m!258249 () Bool)

(assert (=> start!22774 m!258249))

(declare-fun m!258251 () Bool)

(assert (=> b!237481 m!258251))

(check-sat (not start!22774) (not b_next!6381) (not b!237481) tp_is_empty!6243 (not mapNonEmpty!10583) (not b!237487) (not b!237480) b_and!13335 (not b!237483))
(check-sat b_and!13335 (not b_next!6381))
(get-model)

(declare-fun d!59621 () Bool)

(assert (=> d!59621 (= (validMask!0 (mask!10421 thiss!1504)) (and (or (= (mask!10421 thiss!1504) #b00000000000000000000000000000111) (= (mask!10421 thiss!1504) #b00000000000000000000000000001111) (= (mask!10421 thiss!1504) #b00000000000000000000000000011111) (= (mask!10421 thiss!1504) #b00000000000000000000000000111111) (= (mask!10421 thiss!1504) #b00000000000000000000000001111111) (= (mask!10421 thiss!1504) #b00000000000000000000000011111111) (= (mask!10421 thiss!1504) #b00000000000000000000000111111111) (= (mask!10421 thiss!1504) #b00000000000000000000001111111111) (= (mask!10421 thiss!1504) #b00000000000000000000011111111111) (= (mask!10421 thiss!1504) #b00000000000000000000111111111111) (= (mask!10421 thiss!1504) #b00000000000000000001111111111111) (= (mask!10421 thiss!1504) #b00000000000000000011111111111111) (= (mask!10421 thiss!1504) #b00000000000000000111111111111111) (= (mask!10421 thiss!1504) #b00000000000000001111111111111111) (= (mask!10421 thiss!1504) #b00000000000000011111111111111111) (= (mask!10421 thiss!1504) #b00000000000000111111111111111111) (= (mask!10421 thiss!1504) #b00000000000001111111111111111111) (= (mask!10421 thiss!1504) #b00000000000011111111111111111111) (= (mask!10421 thiss!1504) #b00000000000111111111111111111111) (= (mask!10421 thiss!1504) #b00000000001111111111111111111111) (= (mask!10421 thiss!1504) #b00000000011111111111111111111111) (= (mask!10421 thiss!1504) #b00000000111111111111111111111111) (= (mask!10421 thiss!1504) #b00000001111111111111111111111111) (= (mask!10421 thiss!1504) #b00000011111111111111111111111111) (= (mask!10421 thiss!1504) #b00000111111111111111111111111111) (= (mask!10421 thiss!1504) #b00001111111111111111111111111111) (= (mask!10421 thiss!1504) #b00011111111111111111111111111111) (= (mask!10421 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10421 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!237481 d!59621))

(declare-fun b!237527 () Bool)

(declare-fun e!154251 () SeekEntryResult!1009)

(assert (=> b!237527 (= e!154251 Undefined!1009)))

(declare-fun b!237528 () Bool)

(declare-fun e!154252 () SeekEntryResult!1009)

(declare-fun lt!120098 () SeekEntryResult!1009)

(assert (=> b!237528 (= e!154252 (MissingZero!1009 (index!6208 lt!120098)))))

(declare-fun b!237529 () Bool)

(declare-fun e!154250 () SeekEntryResult!1009)

(assert (=> b!237529 (= e!154250 (Found!1009 (index!6208 lt!120098)))))

(declare-fun b!237530 () Bool)

(assert (=> b!237530 (= e!154251 e!154250)))

(declare-fun lt!120099 () (_ BitVec 64))

(assert (=> b!237530 (= lt!120099 (select (arr!5585 (_keys!6500 thiss!1504)) (index!6208 lt!120098)))))

(declare-fun c!39602 () Bool)

(assert (=> b!237530 (= c!39602 (= lt!120099 key!932))))

(declare-fun d!59623 () Bool)

(declare-fun lt!120100 () SeekEntryResult!1009)

(assert (=> d!59623 (and (or ((_ is Undefined!1009) lt!120100) (not ((_ is Found!1009) lt!120100)) (and (bvsge (index!6207 lt!120100) #b00000000000000000000000000000000) (bvslt (index!6207 lt!120100) (size!5925 (_keys!6500 thiss!1504))))) (or ((_ is Undefined!1009) lt!120100) ((_ is Found!1009) lt!120100) (not ((_ is MissingZero!1009) lt!120100)) (and (bvsge (index!6206 lt!120100) #b00000000000000000000000000000000) (bvslt (index!6206 lt!120100) (size!5925 (_keys!6500 thiss!1504))))) (or ((_ is Undefined!1009) lt!120100) ((_ is Found!1009) lt!120100) ((_ is MissingZero!1009) lt!120100) (not ((_ is MissingVacant!1009) lt!120100)) (and (bvsge (index!6209 lt!120100) #b00000000000000000000000000000000) (bvslt (index!6209 lt!120100) (size!5925 (_keys!6500 thiss!1504))))) (or ((_ is Undefined!1009) lt!120100) (ite ((_ is Found!1009) lt!120100) (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6207 lt!120100)) key!932) (ite ((_ is MissingZero!1009) lt!120100) (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6206 lt!120100)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1009) lt!120100) (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6209 lt!120100)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59623 (= lt!120100 e!154251)))

(declare-fun c!39604 () Bool)

(assert (=> d!59623 (= c!39604 (and ((_ is Intermediate!1009) lt!120098) (undefined!1821 lt!120098)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11759 (_ BitVec 32)) SeekEntryResult!1009)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59623 (= lt!120098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10421 thiss!1504)) key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)))))

(assert (=> d!59623 (validMask!0 (mask!10421 thiss!1504))))

(assert (=> d!59623 (= (seekEntryOrOpen!0 key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)) lt!120100)))

(declare-fun b!237531 () Bool)

(declare-fun c!39603 () Bool)

(assert (=> b!237531 (= c!39603 (= lt!120099 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237531 (= e!154250 e!154252)))

(declare-fun b!237532 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11759 (_ BitVec 32)) SeekEntryResult!1009)

(assert (=> b!237532 (= e!154252 (seekKeyOrZeroReturnVacant!0 (x!23961 lt!120098) (index!6208 lt!120098) (index!6208 lt!120098) key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)))))

(assert (= (and d!59623 c!39604) b!237527))

(assert (= (and d!59623 (not c!39604)) b!237530))

(assert (= (and b!237530 c!39602) b!237529))

(assert (= (and b!237530 (not c!39602)) b!237531))

(assert (= (and b!237531 c!39603) b!237528))

(assert (= (and b!237531 (not c!39603)) b!237532))

(declare-fun m!258269 () Bool)

(assert (=> b!237530 m!258269))

(declare-fun m!258271 () Bool)

(assert (=> d!59623 m!258271))

(assert (=> d!59623 m!258271))

(declare-fun m!258273 () Bool)

(assert (=> d!59623 m!258273))

(declare-fun m!258275 () Bool)

(assert (=> d!59623 m!258275))

(assert (=> d!59623 m!258251))

(declare-fun m!258277 () Bool)

(assert (=> d!59623 m!258277))

(declare-fun m!258279 () Bool)

(assert (=> d!59623 m!258279))

(declare-fun m!258281 () Bool)

(assert (=> b!237532 m!258281))

(assert (=> b!237487 d!59623))

(declare-fun d!59625 () Bool)

(assert (=> d!59625 (= (array_inv!3687 (_keys!6500 thiss!1504)) (bvsge (size!5925 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237483 d!59625))

(declare-fun d!59627 () Bool)

(assert (=> d!59627 (= (array_inv!3688 (_values!4391 thiss!1504)) (bvsge (size!5924 (_values!4391 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237483 d!59627))

(declare-fun d!59629 () Bool)

(declare-fun e!154257 () Bool)

(assert (=> d!59629 e!154257))

(declare-fun res!116412 () Bool)

(assert (=> d!59629 (=> res!116412 e!154257)))

(declare-fun lt!120111 () Bool)

(assert (=> d!59629 (= res!116412 (not lt!120111))))

(declare-fun lt!120110 () Bool)

(assert (=> d!59629 (= lt!120111 lt!120110)))

(declare-datatypes ((Unit!7300 0))(
  ( (Unit!7301) )
))
(declare-fun lt!120109 () Unit!7300)

(declare-fun e!154258 () Unit!7300)

(assert (=> d!59629 (= lt!120109 e!154258)))

(declare-fun c!39607 () Bool)

(assert (=> d!59629 (= c!39607 lt!120110)))

(declare-fun containsKey!267 (List!3566 (_ BitVec 64)) Bool)

(assert (=> d!59629 (= lt!120110 (containsKey!267 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932))))

(assert (=> d!59629 (= (contains!1689 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)) key!932) lt!120111)))

(declare-fun b!237539 () Bool)

(declare-fun lt!120112 () Unit!7300)

(assert (=> b!237539 (= e!154258 lt!120112)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!215 (List!3566 (_ BitVec 64)) Unit!7300)

(assert (=> b!237539 (= lt!120112 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932))))

(declare-datatypes ((Option!281 0))(
  ( (Some!280 (v!5202 V!7971)) (None!279) )
))
(declare-fun isDefined!216 (Option!281) Bool)

(declare-fun getValueByKey!275 (List!3566 (_ BitVec 64)) Option!281)

(assert (=> b!237539 (isDefined!216 (getValueByKey!275 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932))))

(declare-fun b!237540 () Bool)

(declare-fun Unit!7302 () Unit!7300)

(assert (=> b!237540 (= e!154258 Unit!7302)))

(declare-fun b!237541 () Bool)

(assert (=> b!237541 (= e!154257 (isDefined!216 (getValueByKey!275 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932)))))

(assert (= (and d!59629 c!39607) b!237539))

(assert (= (and d!59629 (not c!39607)) b!237540))

(assert (= (and d!59629 (not res!116412)) b!237541))

(declare-fun m!258283 () Bool)

(assert (=> d!59629 m!258283))

(declare-fun m!258285 () Bool)

(assert (=> b!237539 m!258285))

(declare-fun m!258287 () Bool)

(assert (=> b!237539 m!258287))

(assert (=> b!237539 m!258287))

(declare-fun m!258289 () Bool)

(assert (=> b!237539 m!258289))

(assert (=> b!237541 m!258287))

(assert (=> b!237541 m!258287))

(assert (=> b!237541 m!258289))

(assert (=> b!237480 d!59629))

(declare-fun b!237584 () Bool)

(declare-fun e!154293 () Bool)

(declare-fun lt!120163 () ListLongMap!3579)

(declare-fun apply!217 (ListLongMap!3579 (_ BitVec 64)) V!7971)

(assert (=> b!237584 (= e!154293 (= (apply!217 lt!120163 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4249 thiss!1504)))))

(declare-fun b!237585 () Bool)

(declare-fun e!154291 () Unit!7300)

(declare-fun lt!120176 () Unit!7300)

(assert (=> b!237585 (= e!154291 lt!120176)))

(declare-fun lt!120173 () ListLongMap!3579)

(declare-fun getCurrentListMapNoExtraKeys!539 (array!11759 array!11757 (_ BitVec 32) (_ BitVec 32) V!7971 V!7971 (_ BitVec 32) Int) ListLongMap!3579)

(assert (=> b!237585 (= lt!120173 (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))))

(declare-fun lt!120175 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120175 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120160 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120160 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120164 () Unit!7300)

(declare-fun addStillContains!193 (ListLongMap!3579 (_ BitVec 64) V!7971 (_ BitVec 64)) Unit!7300)

(assert (=> b!237585 (= lt!120164 (addStillContains!193 lt!120173 lt!120175 (zeroValue!4249 thiss!1504) lt!120160))))

(declare-fun +!644 (ListLongMap!3579 tuple2!4666) ListLongMap!3579)

(assert (=> b!237585 (contains!1689 (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))) lt!120160)))

(declare-fun lt!120159 () Unit!7300)

(assert (=> b!237585 (= lt!120159 lt!120164)))

(declare-fun lt!120165 () ListLongMap!3579)

(assert (=> b!237585 (= lt!120165 (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))))

(declare-fun lt!120157 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120157 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120166 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120166 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120158 () Unit!7300)

(declare-fun addApplyDifferent!193 (ListLongMap!3579 (_ BitVec 64) V!7971 (_ BitVec 64)) Unit!7300)

(assert (=> b!237585 (= lt!120158 (addApplyDifferent!193 lt!120165 lt!120157 (minValue!4249 thiss!1504) lt!120166))))

(assert (=> b!237585 (= (apply!217 (+!644 lt!120165 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))) lt!120166) (apply!217 lt!120165 lt!120166))))

(declare-fun lt!120162 () Unit!7300)

(assert (=> b!237585 (= lt!120162 lt!120158)))

(declare-fun lt!120172 () ListLongMap!3579)

(assert (=> b!237585 (= lt!120172 (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))))

(declare-fun lt!120174 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120174 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120170 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120170 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120167 () Unit!7300)

(assert (=> b!237585 (= lt!120167 (addApplyDifferent!193 lt!120172 lt!120174 (zeroValue!4249 thiss!1504) lt!120170))))

(assert (=> b!237585 (= (apply!217 (+!644 lt!120172 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))) lt!120170) (apply!217 lt!120172 lt!120170))))

(declare-fun lt!120178 () Unit!7300)

(assert (=> b!237585 (= lt!120178 lt!120167)))

(declare-fun lt!120169 () ListLongMap!3579)

(assert (=> b!237585 (= lt!120169 (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))))

(declare-fun lt!120171 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120171 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!120168 () (_ BitVec 64))

(assert (=> b!237585 (= lt!120168 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237585 (= lt!120176 (addApplyDifferent!193 lt!120169 lt!120171 (minValue!4249 thiss!1504) lt!120168))))

(assert (=> b!237585 (= (apply!217 (+!644 lt!120169 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))) lt!120168) (apply!217 lt!120169 lt!120168))))

(declare-fun b!237586 () Bool)

(declare-fun e!154287 () ListLongMap!3579)

(declare-fun call!22090 () ListLongMap!3579)

(assert (=> b!237586 (= e!154287 call!22090)))

(declare-fun b!237587 () Bool)

(declare-fun e!154294 () ListLongMap!3579)

(assert (=> b!237587 (= e!154294 e!154287)))

(declare-fun c!39625 () Bool)

(assert (=> b!237587 (= c!39625 (and (not (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237588 () Bool)

(declare-fun res!116438 () Bool)

(declare-fun e!154286 () Bool)

(assert (=> b!237588 (=> (not res!116438) (not e!154286))))

(declare-fun e!154292 () Bool)

(assert (=> b!237588 (= res!116438 e!154292)))

(declare-fun c!39620 () Bool)

(assert (=> b!237588 (= c!39620 (not (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22083 () Bool)

(declare-fun call!22092 () Bool)

(assert (=> bm!22083 (= call!22092 (contains!1689 lt!120163 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22084 () Bool)

(declare-fun call!22087 () ListLongMap!3579)

(declare-fun call!22089 () ListLongMap!3579)

(assert (=> bm!22084 (= call!22087 call!22089)))

(declare-fun b!237589 () Bool)

(declare-fun Unit!7303 () Unit!7300)

(assert (=> b!237589 (= e!154291 Unit!7303)))

(declare-fun b!237590 () Bool)

(declare-fun e!154296 () ListLongMap!3579)

(assert (=> b!237590 (= e!154296 call!22087)))

(declare-fun b!237591 () Bool)

(declare-fun res!116437 () Bool)

(assert (=> b!237591 (=> (not res!116437) (not e!154286))))

(declare-fun e!154288 () Bool)

(assert (=> b!237591 (= res!116437 e!154288)))

(declare-fun res!116432 () Bool)

(assert (=> b!237591 (=> res!116432 e!154288)))

(declare-fun e!154289 () Bool)

(assert (=> b!237591 (= res!116432 (not e!154289))))

(declare-fun res!116431 () Bool)

(assert (=> b!237591 (=> (not res!116431) (not e!154289))))

(assert (=> b!237591 (= res!116431 (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun b!237592 () Bool)

(declare-fun e!154285 () Bool)

(assert (=> b!237592 (= e!154285 (= (apply!217 lt!120163 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4249 thiss!1504)))))

(declare-fun b!237593 () Bool)

(assert (=> b!237593 (= e!154292 e!154293)))

(declare-fun res!116433 () Bool)

(assert (=> b!237593 (= res!116433 call!22092)))

(assert (=> b!237593 (=> (not res!116433) (not e!154293))))

(declare-fun call!22086 () ListLongMap!3579)

(declare-fun call!22088 () ListLongMap!3579)

(declare-fun bm!22085 () Bool)

(declare-fun c!39624 () Bool)

(assert (=> bm!22085 (= call!22086 (+!644 (ite c!39624 call!22088 (ite c!39625 call!22089 call!22087)) (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))))))

(declare-fun b!237594 () Bool)

(assert (=> b!237594 (= e!154294 (+!644 call!22086 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))))

(declare-fun b!237595 () Bool)

(assert (=> b!237595 (= e!154292 (not call!22092))))

(declare-fun b!237596 () Bool)

(declare-fun e!154290 () Bool)

(assert (=> b!237596 (= e!154288 e!154290)))

(declare-fun res!116439 () Bool)

(assert (=> b!237596 (=> (not res!116439) (not e!154290))))

(assert (=> b!237596 (= res!116439 (contains!1689 lt!120163 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237596 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun b!237597 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237597 (= e!154289 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237598 () Bool)

(declare-fun e!154297 () Bool)

(assert (=> b!237598 (= e!154286 e!154297)))

(declare-fun c!39622 () Bool)

(assert (=> b!237598 (= c!39622 (not (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237599 () Bool)

(declare-fun c!39621 () Bool)

(assert (=> b!237599 (= c!39621 (and (not (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!237599 (= e!154287 e!154296)))

(declare-fun b!237600 () Bool)

(assert (=> b!237600 (= e!154296 call!22090)))

(declare-fun bm!22086 () Bool)

(assert (=> bm!22086 (= call!22088 (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))))

(declare-fun b!237601 () Bool)

(assert (=> b!237601 (= e!154297 e!154285)))

(declare-fun res!116436 () Bool)

(declare-fun call!22091 () Bool)

(assert (=> b!237601 (= res!116436 call!22091)))

(assert (=> b!237601 (=> (not res!116436) (not e!154285))))

(declare-fun d!59631 () Bool)

(assert (=> d!59631 e!154286))

(declare-fun res!116434 () Bool)

(assert (=> d!59631 (=> (not res!116434) (not e!154286))))

(assert (=> d!59631 (= res!116434 (or (bvsge #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))))

(declare-fun lt!120177 () ListLongMap!3579)

(assert (=> d!59631 (= lt!120163 lt!120177)))

(declare-fun lt!120161 () Unit!7300)

(assert (=> d!59631 (= lt!120161 e!154291)))

(declare-fun c!39623 () Bool)

(declare-fun e!154295 () Bool)

(assert (=> d!59631 (= c!39623 e!154295)))

(declare-fun res!116435 () Bool)

(assert (=> d!59631 (=> (not res!116435) (not e!154295))))

(assert (=> d!59631 (= res!116435 (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> d!59631 (= lt!120177 e!154294)))

(assert (=> d!59631 (= c!39624 (and (not (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4145 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59631 (validMask!0 (mask!10421 thiss!1504))))

(assert (=> d!59631 (= (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)) lt!120163)))

(declare-fun b!237602 () Bool)

(declare-fun get!2877 (ValueCell!2778 V!7971) V!7971)

(declare-fun dynLambda!560 (Int (_ BitVec 64)) V!7971)

(assert (=> b!237602 (= e!154290 (= (apply!217 lt!120163 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)) (get!2877 (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4408 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5924 (_values!4391 thiss!1504))))))

(assert (=> b!237602 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun b!237603 () Bool)

(assert (=> b!237603 (= e!154295 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237604 () Bool)

(assert (=> b!237604 (= e!154297 (not call!22091))))

(declare-fun bm!22087 () Bool)

(assert (=> bm!22087 (= call!22090 call!22086)))

(declare-fun bm!22088 () Bool)

(assert (=> bm!22088 (= call!22091 (contains!1689 lt!120163 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!22089 () Bool)

(assert (=> bm!22089 (= call!22089 call!22088)))

(assert (= (and d!59631 c!39624) b!237594))

(assert (= (and d!59631 (not c!39624)) b!237587))

(assert (= (and b!237587 c!39625) b!237586))

(assert (= (and b!237587 (not c!39625)) b!237599))

(assert (= (and b!237599 c!39621) b!237600))

(assert (= (and b!237599 (not c!39621)) b!237590))

(assert (= (or b!237600 b!237590) bm!22084))

(assert (= (or b!237586 bm!22084) bm!22089))

(assert (= (or b!237586 b!237600) bm!22087))

(assert (= (or b!237594 bm!22089) bm!22086))

(assert (= (or b!237594 bm!22087) bm!22085))

(assert (= (and d!59631 res!116435) b!237603))

(assert (= (and d!59631 c!39623) b!237585))

(assert (= (and d!59631 (not c!39623)) b!237589))

(assert (= (and d!59631 res!116434) b!237591))

(assert (= (and b!237591 res!116431) b!237597))

(assert (= (and b!237591 (not res!116432)) b!237596))

(assert (= (and b!237596 res!116439) b!237602))

(assert (= (and b!237591 res!116437) b!237588))

(assert (= (and b!237588 c!39620) b!237593))

(assert (= (and b!237588 (not c!39620)) b!237595))

(assert (= (and b!237593 res!116433) b!237584))

(assert (= (or b!237593 b!237595) bm!22083))

(assert (= (and b!237588 res!116438) b!237598))

(assert (= (and b!237598 c!39622) b!237601))

(assert (= (and b!237598 (not c!39622)) b!237604))

(assert (= (and b!237601 res!116436) b!237592))

(assert (= (or b!237601 b!237604) bm!22088))

(declare-fun b_lambda!7955 () Bool)

(assert (=> (not b_lambda!7955) (not b!237602)))

(declare-fun t!8556 () Bool)

(declare-fun tb!2947 () Bool)

(assert (=> (and b!237483 (= (defaultEntry!4408 thiss!1504) (defaultEntry!4408 thiss!1504)) t!8556) tb!2947))

(declare-fun result!5163 () Bool)

(assert (=> tb!2947 (= result!5163 tp_is_empty!6243)))

(assert (=> b!237602 t!8556))

(declare-fun b_and!13339 () Bool)

(assert (= b_and!13335 (and (=> t!8556 result!5163) b_and!13339)))

(declare-fun m!258291 () Bool)

(assert (=> bm!22083 m!258291))

(declare-fun m!258293 () Bool)

(assert (=> b!237585 m!258293))

(declare-fun m!258295 () Bool)

(assert (=> b!237585 m!258295))

(declare-fun m!258297 () Bool)

(assert (=> b!237585 m!258297))

(declare-fun m!258299 () Bool)

(assert (=> b!237585 m!258299))

(declare-fun m!258301 () Bool)

(assert (=> b!237585 m!258301))

(declare-fun m!258303 () Bool)

(assert (=> b!237585 m!258303))

(assert (=> b!237585 m!258293))

(declare-fun m!258305 () Bool)

(assert (=> b!237585 m!258305))

(assert (=> b!237585 m!258301))

(declare-fun m!258307 () Bool)

(assert (=> b!237585 m!258307))

(declare-fun m!258309 () Bool)

(assert (=> b!237585 m!258309))

(declare-fun m!258311 () Bool)

(assert (=> b!237585 m!258311))

(declare-fun m!258313 () Bool)

(assert (=> b!237585 m!258313))

(declare-fun m!258315 () Bool)

(assert (=> b!237585 m!258315))

(declare-fun m!258317 () Bool)

(assert (=> b!237585 m!258317))

(declare-fun m!258319 () Bool)

(assert (=> b!237585 m!258319))

(declare-fun m!258321 () Bool)

(assert (=> b!237585 m!258321))

(assert (=> b!237585 m!258319))

(declare-fun m!258323 () Bool)

(assert (=> b!237585 m!258323))

(assert (=> b!237585 m!258323))

(declare-fun m!258325 () Bool)

(assert (=> b!237585 m!258325))

(assert (=> b!237602 m!258311))

(declare-fun m!258327 () Bool)

(assert (=> b!237602 m!258327))

(declare-fun m!258329 () Bool)

(assert (=> b!237602 m!258329))

(assert (=> b!237602 m!258327))

(declare-fun m!258331 () Bool)

(assert (=> b!237602 m!258331))

(assert (=> b!237602 m!258311))

(declare-fun m!258333 () Bool)

(assert (=> b!237602 m!258333))

(assert (=> b!237602 m!258329))

(declare-fun m!258335 () Bool)

(assert (=> b!237584 m!258335))

(declare-fun m!258337 () Bool)

(assert (=> bm!22088 m!258337))

(assert (=> b!237596 m!258311))

(assert (=> b!237596 m!258311))

(declare-fun m!258339 () Bool)

(assert (=> b!237596 m!258339))

(declare-fun m!258341 () Bool)

(assert (=> b!237592 m!258341))

(assert (=> b!237603 m!258311))

(assert (=> b!237603 m!258311))

(declare-fun m!258343 () Bool)

(assert (=> b!237603 m!258343))

(declare-fun m!258345 () Bool)

(assert (=> b!237594 m!258345))

(declare-fun m!258347 () Bool)

(assert (=> bm!22085 m!258347))

(assert (=> d!59631 m!258251))

(assert (=> b!237597 m!258311))

(assert (=> b!237597 m!258311))

(assert (=> b!237597 m!258343))

(assert (=> bm!22086 m!258313))

(assert (=> b!237480 d!59631))

(declare-fun d!59633 () Bool)

(declare-fun res!116446 () Bool)

(declare-fun e!154300 () Bool)

(assert (=> d!59633 (=> (not res!116446) (not e!154300))))

(declare-fun simpleValid!240 (LongMapFixedSize!3456) Bool)

(assert (=> d!59633 (= res!116446 (simpleValid!240 thiss!1504))))

(assert (=> d!59633 (= (valid!1364 thiss!1504) e!154300)))

(declare-fun b!237613 () Bool)

(declare-fun res!116447 () Bool)

(assert (=> b!237613 (=> (not res!116447) (not e!154300))))

(declare-fun arrayCountValidKeys!0 (array!11759 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237613 (= res!116447 (= (arrayCountValidKeys!0 (_keys!6500 thiss!1504) #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))) (_size!1777 thiss!1504)))))

(declare-fun b!237614 () Bool)

(declare-fun res!116448 () Bool)

(assert (=> b!237614 (=> (not res!116448) (not e!154300))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11759 (_ BitVec 32)) Bool)

(assert (=> b!237614 (= res!116448 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)))))

(declare-fun b!237615 () Bool)

(declare-datatypes ((List!3568 0))(
  ( (Nil!3565) (Cons!3564 (h!4219 (_ BitVec 64)) (t!8557 List!3568)) )
))
(declare-fun arrayNoDuplicates!0 (array!11759 (_ BitVec 32) List!3568) Bool)

(assert (=> b!237615 (= e!154300 (arrayNoDuplicates!0 (_keys!6500 thiss!1504) #b00000000000000000000000000000000 Nil!3565))))

(assert (= (and d!59633 res!116446) b!237613))

(assert (= (and b!237613 res!116447) b!237614))

(assert (= (and b!237614 res!116448) b!237615))

(declare-fun m!258349 () Bool)

(assert (=> d!59633 m!258349))

(declare-fun m!258351 () Bool)

(assert (=> b!237613 m!258351))

(declare-fun m!258353 () Bool)

(assert (=> b!237614 m!258353))

(declare-fun m!258355 () Bool)

(assert (=> b!237615 m!258355))

(assert (=> start!22774 d!59633))

(declare-fun mapNonEmpty!10589 () Bool)

(declare-fun mapRes!10589 () Bool)

(declare-fun tp!22343 () Bool)

(declare-fun e!154305 () Bool)

(assert (=> mapNonEmpty!10589 (= mapRes!10589 (and tp!22343 e!154305))))

(declare-fun mapKey!10589 () (_ BitVec 32))

(declare-fun mapRest!10589 () (Array (_ BitVec 32) ValueCell!2778))

(declare-fun mapValue!10589 () ValueCell!2778)

(assert (=> mapNonEmpty!10589 (= mapRest!10583 (store mapRest!10589 mapKey!10589 mapValue!10589))))

(declare-fun b!237623 () Bool)

(declare-fun e!154306 () Bool)

(assert (=> b!237623 (= e!154306 tp_is_empty!6243)))

(declare-fun b!237622 () Bool)

(assert (=> b!237622 (= e!154305 tp_is_empty!6243)))

(declare-fun condMapEmpty!10589 () Bool)

(declare-fun mapDefault!10589 () ValueCell!2778)

(assert (=> mapNonEmpty!10583 (= condMapEmpty!10589 (= mapRest!10583 ((as const (Array (_ BitVec 32) ValueCell!2778)) mapDefault!10589)))))

(assert (=> mapNonEmpty!10583 (= tp!22333 (and e!154306 mapRes!10589))))

(declare-fun mapIsEmpty!10589 () Bool)

(assert (=> mapIsEmpty!10589 mapRes!10589))

(assert (= (and mapNonEmpty!10583 condMapEmpty!10589) mapIsEmpty!10589))

(assert (= (and mapNonEmpty!10583 (not condMapEmpty!10589)) mapNonEmpty!10589))

(assert (= (and mapNonEmpty!10589 ((_ is ValueCellFull!2778) mapValue!10589)) b!237622))

(assert (= (and mapNonEmpty!10583 ((_ is ValueCellFull!2778) mapDefault!10589)) b!237623))

(declare-fun m!258357 () Bool)

(assert (=> mapNonEmpty!10589 m!258357))

(declare-fun b_lambda!7957 () Bool)

(assert (= b_lambda!7955 (or (and b!237483 b_free!6381) b_lambda!7957)))

(check-sat (not b!237539) (not b!237615) (not b!237597) (not b_lambda!7957) (not b!237592) (not bm!22086) (not d!59623) (not b!237584) (not b!237596) b_and!13339 (not b!237602) (not bm!22085) (not b!237532) (not bm!22088) (not b!237541) (not b_next!6381) (not b!237613) (not d!59633) (not b!237603) (not b!237585) (not b!237594) (not bm!22083) (not d!59631) tp_is_empty!6243 (not mapNonEmpty!10589) (not d!59629) (not b!237614))
(check-sat b_and!13339 (not b_next!6381))
(get-model)

(declare-fun d!59635 () Bool)

(declare-fun e!154307 () Bool)

(assert (=> d!59635 e!154307))

(declare-fun res!116449 () Bool)

(assert (=> d!59635 (=> res!116449 e!154307)))

(declare-fun lt!120181 () Bool)

(assert (=> d!59635 (= res!116449 (not lt!120181))))

(declare-fun lt!120180 () Bool)

(assert (=> d!59635 (= lt!120181 lt!120180)))

(declare-fun lt!120179 () Unit!7300)

(declare-fun e!154308 () Unit!7300)

(assert (=> d!59635 (= lt!120179 e!154308)))

(declare-fun c!39626 () Bool)

(assert (=> d!59635 (= c!39626 lt!120180)))

(assert (=> d!59635 (= lt!120180 (containsKey!267 (toList!1805 lt!120163) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59635 (= (contains!1689 lt!120163 #b0000000000000000000000000000000000000000000000000000000000000000) lt!120181)))

(declare-fun b!237624 () Bool)

(declare-fun lt!120182 () Unit!7300)

(assert (=> b!237624 (= e!154308 lt!120182)))

(assert (=> b!237624 (= lt!120182 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1805 lt!120163) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237624 (isDefined!216 (getValueByKey!275 (toList!1805 lt!120163) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237625 () Bool)

(declare-fun Unit!7304 () Unit!7300)

(assert (=> b!237625 (= e!154308 Unit!7304)))

(declare-fun b!237626 () Bool)

(assert (=> b!237626 (= e!154307 (isDefined!216 (getValueByKey!275 (toList!1805 lt!120163) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59635 c!39626) b!237624))

(assert (= (and d!59635 (not c!39626)) b!237625))

(assert (= (and d!59635 (not res!116449)) b!237626))

(declare-fun m!258359 () Bool)

(assert (=> d!59635 m!258359))

(declare-fun m!258361 () Bool)

(assert (=> b!237624 m!258361))

(declare-fun m!258363 () Bool)

(assert (=> b!237624 m!258363))

(assert (=> b!237624 m!258363))

(declare-fun m!258365 () Bool)

(assert (=> b!237624 m!258365))

(assert (=> b!237626 m!258363))

(assert (=> b!237626 m!258363))

(assert (=> b!237626 m!258365))

(assert (=> bm!22083 d!59635))

(declare-fun d!59637 () Bool)

(declare-fun e!154309 () Bool)

(assert (=> d!59637 e!154309))

(declare-fun res!116450 () Bool)

(assert (=> d!59637 (=> res!116450 e!154309)))

(declare-fun lt!120185 () Bool)

(assert (=> d!59637 (= res!116450 (not lt!120185))))

(declare-fun lt!120184 () Bool)

(assert (=> d!59637 (= lt!120185 lt!120184)))

(declare-fun lt!120183 () Unit!7300)

(declare-fun e!154310 () Unit!7300)

(assert (=> d!59637 (= lt!120183 e!154310)))

(declare-fun c!39627 () Bool)

(assert (=> d!59637 (= c!39627 lt!120184)))

(assert (=> d!59637 (= lt!120184 (containsKey!267 (toList!1805 lt!120163) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59637 (= (contains!1689 lt!120163 #b1000000000000000000000000000000000000000000000000000000000000000) lt!120185)))

(declare-fun b!237627 () Bool)

(declare-fun lt!120186 () Unit!7300)

(assert (=> b!237627 (= e!154310 lt!120186)))

(assert (=> b!237627 (= lt!120186 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1805 lt!120163) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237627 (isDefined!216 (getValueByKey!275 (toList!1805 lt!120163) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237628 () Bool)

(declare-fun Unit!7305 () Unit!7300)

(assert (=> b!237628 (= e!154310 Unit!7305)))

(declare-fun b!237629 () Bool)

(assert (=> b!237629 (= e!154309 (isDefined!216 (getValueByKey!275 (toList!1805 lt!120163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59637 c!39627) b!237627))

(assert (= (and d!59637 (not c!39627)) b!237628))

(assert (= (and d!59637 (not res!116450)) b!237629))

(declare-fun m!258367 () Bool)

(assert (=> d!59637 m!258367))

(declare-fun m!258369 () Bool)

(assert (=> b!237627 m!258369))

(declare-fun m!258371 () Bool)

(assert (=> b!237627 m!258371))

(assert (=> b!237627 m!258371))

(declare-fun m!258373 () Bool)

(assert (=> b!237627 m!258373))

(assert (=> b!237629 m!258371))

(assert (=> b!237629 m!258371))

(assert (=> b!237629 m!258373))

(assert (=> bm!22088 d!59637))

(declare-fun d!59639 () Bool)

(declare-fun e!154311 () Bool)

(assert (=> d!59639 e!154311))

(declare-fun res!116451 () Bool)

(assert (=> d!59639 (=> res!116451 e!154311)))

(declare-fun lt!120189 () Bool)

(assert (=> d!59639 (= res!116451 (not lt!120189))))

(declare-fun lt!120188 () Bool)

(assert (=> d!59639 (= lt!120189 lt!120188)))

(declare-fun lt!120187 () Unit!7300)

(declare-fun e!154312 () Unit!7300)

(assert (=> d!59639 (= lt!120187 e!154312)))

(declare-fun c!39628 () Bool)

(assert (=> d!59639 (= c!39628 lt!120188)))

(assert (=> d!59639 (= lt!120188 (containsKey!267 (toList!1805 lt!120163) (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59639 (= (contains!1689 lt!120163 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)) lt!120189)))

(declare-fun b!237630 () Bool)

(declare-fun lt!120190 () Unit!7300)

(assert (=> b!237630 (= e!154312 lt!120190)))

(assert (=> b!237630 (= lt!120190 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1805 lt!120163) (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237630 (isDefined!216 (getValueByKey!275 (toList!1805 lt!120163) (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237631 () Bool)

(declare-fun Unit!7306 () Unit!7300)

(assert (=> b!237631 (= e!154312 Unit!7306)))

(declare-fun b!237632 () Bool)

(assert (=> b!237632 (= e!154311 (isDefined!216 (getValueByKey!275 (toList!1805 lt!120163) (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59639 c!39628) b!237630))

(assert (= (and d!59639 (not c!39628)) b!237631))

(assert (= (and d!59639 (not res!116451)) b!237632))

(assert (=> d!59639 m!258311))

(declare-fun m!258375 () Bool)

(assert (=> d!59639 m!258375))

(assert (=> b!237630 m!258311))

(declare-fun m!258377 () Bool)

(assert (=> b!237630 m!258377))

(assert (=> b!237630 m!258311))

(declare-fun m!258379 () Bool)

(assert (=> b!237630 m!258379))

(assert (=> b!237630 m!258379))

(declare-fun m!258381 () Bool)

(assert (=> b!237630 m!258381))

(assert (=> b!237632 m!258311))

(assert (=> b!237632 m!258379))

(assert (=> b!237632 m!258379))

(assert (=> b!237632 m!258381))

(assert (=> b!237596 d!59639))

(declare-fun d!59641 () Bool)

(declare-fun res!116456 () Bool)

(declare-fun e!154317 () Bool)

(assert (=> d!59641 (=> res!116456 e!154317)))

(assert (=> d!59641 (= res!116456 (and ((_ is Cons!3562) (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))) (= (_1!2344 (h!4217 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))))) key!932)))))

(assert (=> d!59641 (= (containsKey!267 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932) e!154317)))

(declare-fun b!237637 () Bool)

(declare-fun e!154318 () Bool)

(assert (=> b!237637 (= e!154317 e!154318)))

(declare-fun res!116457 () Bool)

(assert (=> b!237637 (=> (not res!116457) (not e!154318))))

(assert (=> b!237637 (= res!116457 (and (or (not ((_ is Cons!3562) (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))))) (bvsle (_1!2344 (h!4217 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))))) key!932)) ((_ is Cons!3562) (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))) (bvslt (_1!2344 (h!4217 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))))) key!932)))))

(declare-fun b!237638 () Bool)

(assert (=> b!237638 (= e!154318 (containsKey!267 (t!8553 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))) key!932))))

(assert (= (and d!59641 (not res!116456)) b!237637))

(assert (= (and b!237637 res!116457) b!237638))

(declare-fun m!258383 () Bool)

(assert (=> b!237638 m!258383))

(assert (=> d!59629 d!59641))

(declare-fun b!237647 () Bool)

(declare-fun e!154323 () (_ BitVec 32))

(assert (=> b!237647 (= e!154323 #b00000000000000000000000000000000)))

(declare-fun d!59643 () Bool)

(declare-fun lt!120193 () (_ BitVec 32))

(assert (=> d!59643 (and (bvsge lt!120193 #b00000000000000000000000000000000) (bvsle lt!120193 (bvsub (size!5925 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59643 (= lt!120193 e!154323)))

(declare-fun c!39634 () Bool)

(assert (=> d!59643 (= c!39634 (bvsge #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> d!59643 (and (bvsle #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5925 (_keys!6500 thiss!1504)) (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> d!59643 (= (arrayCountValidKeys!0 (_keys!6500 thiss!1504) #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))) lt!120193)))

(declare-fun b!237648 () Bool)

(declare-fun e!154324 () (_ BitVec 32))

(assert (=> b!237648 (= e!154323 e!154324)))

(declare-fun c!39633 () Bool)

(assert (=> b!237648 (= c!39633 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22092 () Bool)

(declare-fun call!22095 () (_ BitVec 32))

(assert (=> bm!22092 (= call!22095 (arrayCountValidKeys!0 (_keys!6500 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun b!237649 () Bool)

(assert (=> b!237649 (= e!154324 call!22095)))

(declare-fun b!237650 () Bool)

(assert (=> b!237650 (= e!154324 (bvadd #b00000000000000000000000000000001 call!22095))))

(assert (= (and d!59643 c!39634) b!237647))

(assert (= (and d!59643 (not c!39634)) b!237648))

(assert (= (and b!237648 c!39633) b!237650))

(assert (= (and b!237648 (not c!39633)) b!237649))

(assert (= (or b!237650 b!237649) bm!22092))

(assert (=> b!237648 m!258311))

(assert (=> b!237648 m!258311))

(assert (=> b!237648 m!258343))

(declare-fun m!258385 () Bool)

(assert (=> bm!22092 m!258385))

(assert (=> b!237613 d!59643))

(assert (=> d!59631 d!59621))

(declare-fun d!59645 () Bool)

(declare-fun res!116469 () Bool)

(declare-fun e!154327 () Bool)

(assert (=> d!59645 (=> (not res!116469) (not e!154327))))

(assert (=> d!59645 (= res!116469 (validMask!0 (mask!10421 thiss!1504)))))

(assert (=> d!59645 (= (simpleValid!240 thiss!1504) e!154327)))

(declare-fun b!237662 () Bool)

(assert (=> b!237662 (= e!154327 (and (bvsge (extraKeys!4145 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4145 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1777 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!237659 () Bool)

(declare-fun res!116467 () Bool)

(assert (=> b!237659 (=> (not res!116467) (not e!154327))))

(assert (=> b!237659 (= res!116467 (and (= (size!5924 (_values!4391 thiss!1504)) (bvadd (mask!10421 thiss!1504) #b00000000000000000000000000000001)) (= (size!5925 (_keys!6500 thiss!1504)) (size!5924 (_values!4391 thiss!1504))) (bvsge (_size!1777 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1777 thiss!1504) (bvadd (mask!10421 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!237661 () Bool)

(declare-fun res!116466 () Bool)

(assert (=> b!237661 (=> (not res!116466) (not e!154327))))

(declare-fun size!5928 (LongMapFixedSize!3456) (_ BitVec 32))

(assert (=> b!237661 (= res!116466 (= (size!5928 thiss!1504) (bvadd (_size!1777 thiss!1504) (bvsdiv (bvadd (extraKeys!4145 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!237660 () Bool)

(declare-fun res!116468 () Bool)

(assert (=> b!237660 (=> (not res!116468) (not e!154327))))

(assert (=> b!237660 (= res!116468 (bvsge (size!5928 thiss!1504) (_size!1777 thiss!1504)))))

(assert (= (and d!59645 res!116469) b!237659))

(assert (= (and b!237659 res!116467) b!237660))

(assert (= (and b!237660 res!116468) b!237661))

(assert (= (and b!237661 res!116466) b!237662))

(assert (=> d!59645 m!258251))

(declare-fun m!258387 () Bool)

(assert (=> b!237661 m!258387))

(assert (=> b!237660 m!258387))

(assert (=> d!59633 d!59645))

(declare-fun d!59647 () Bool)

(assert (=> d!59647 (isDefined!216 (getValueByKey!275 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932))))

(declare-fun lt!120196 () Unit!7300)

(declare-fun choose!1113 (List!3566 (_ BitVec 64)) Unit!7300)

(assert (=> d!59647 (= lt!120196 (choose!1113 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932))))

(declare-fun e!154330 () Bool)

(assert (=> d!59647 e!154330))

(declare-fun res!116472 () Bool)

(assert (=> d!59647 (=> (not res!116472) (not e!154330))))

(declare-fun isStrictlySorted!366 (List!3566) Bool)

(assert (=> d!59647 (= res!116472 (isStrictlySorted!366 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))))))

(assert (=> d!59647 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932) lt!120196)))

(declare-fun b!237665 () Bool)

(assert (=> b!237665 (= e!154330 (containsKey!267 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932))))

(assert (= (and d!59647 res!116472) b!237665))

(assert (=> d!59647 m!258287))

(assert (=> d!59647 m!258287))

(assert (=> d!59647 m!258289))

(declare-fun m!258389 () Bool)

(assert (=> d!59647 m!258389))

(declare-fun m!258391 () Bool)

(assert (=> d!59647 m!258391))

(assert (=> b!237665 m!258283))

(assert (=> b!237539 d!59647))

(declare-fun d!59649 () Bool)

(declare-fun isEmpty!518 (Option!281) Bool)

(assert (=> d!59649 (= (isDefined!216 (getValueByKey!275 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932)) (not (isEmpty!518 (getValueByKey!275 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932))))))

(declare-fun bs!8772 () Bool)

(assert (= bs!8772 d!59649))

(assert (=> bs!8772 m!258287))

(declare-fun m!258393 () Bool)

(assert (=> bs!8772 m!258393))

(assert (=> b!237539 d!59649))

(declare-fun b!237674 () Bool)

(declare-fun e!154335 () Option!281)

(assert (=> b!237674 (= e!154335 (Some!280 (_2!2344 (h!4217 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))))))))

(declare-fun d!59651 () Bool)

(declare-fun c!39639 () Bool)

(assert (=> d!59651 (= c!39639 (and ((_ is Cons!3562) (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))) (= (_1!2344 (h!4217 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))))) key!932)))))

(assert (=> d!59651 (= (getValueByKey!275 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))) key!932) e!154335)))

(declare-fun b!237675 () Bool)

(declare-fun e!154336 () Option!281)

(assert (=> b!237675 (= e!154335 e!154336)))

(declare-fun c!39640 () Bool)

(assert (=> b!237675 (= c!39640 (and ((_ is Cons!3562) (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))) (not (= (_1!2344 (h!4217 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504))))) key!932))))))

(declare-fun b!237676 () Bool)

(assert (=> b!237676 (= e!154336 (getValueByKey!275 (t!8553 (toList!1805 (getCurrentListMap!1333 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)))) key!932))))

(declare-fun b!237677 () Bool)

(assert (=> b!237677 (= e!154336 None!279)))

(assert (= (and d!59651 c!39639) b!237674))

(assert (= (and d!59651 (not c!39639)) b!237675))

(assert (= (and b!237675 c!39640) b!237676))

(assert (= (and b!237675 (not c!39640)) b!237677))

(declare-fun m!258395 () Bool)

(assert (=> b!237676 m!258395))

(assert (=> b!237539 d!59651))

(declare-fun d!59653 () Bool)

(assert (=> d!59653 (= (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237597 d!59653))

(declare-fun d!59655 () Bool)

(declare-fun get!2878 (Option!281) V!7971)

(assert (=> d!59655 (= (apply!217 lt!120163 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2878 (getValueByKey!275 (toList!1805 lt!120163) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8773 () Bool)

(assert (= bs!8773 d!59655))

(assert (=> bs!8773 m!258371))

(assert (=> bs!8773 m!258371))

(declare-fun m!258397 () Bool)

(assert (=> bs!8773 m!258397))

(assert (=> b!237592 d!59655))

(declare-fun b!237688 () Bool)

(declare-fun e!154347 () Bool)

(declare-fun call!22098 () Bool)

(assert (=> b!237688 (= e!154347 call!22098)))

(declare-fun b!237689 () Bool)

(declare-fun e!154348 () Bool)

(declare-fun contains!1691 (List!3568 (_ BitVec 64)) Bool)

(assert (=> b!237689 (= e!154348 (contains!1691 Nil!3565 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59657 () Bool)

(declare-fun res!116479 () Bool)

(declare-fun e!154345 () Bool)

(assert (=> d!59657 (=> res!116479 e!154345)))

(assert (=> d!59657 (= res!116479 (bvsge #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> d!59657 (= (arrayNoDuplicates!0 (_keys!6500 thiss!1504) #b00000000000000000000000000000000 Nil!3565) e!154345)))

(declare-fun b!237690 () Bool)

(declare-fun e!154346 () Bool)

(assert (=> b!237690 (= e!154346 e!154347)))

(declare-fun c!39643 () Bool)

(assert (=> b!237690 (= c!39643 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22095 () Bool)

(assert (=> bm!22095 (= call!22098 (arrayNoDuplicates!0 (_keys!6500 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39643 (Cons!3564 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000) Nil!3565) Nil!3565)))))

(declare-fun b!237691 () Bool)

(assert (=> b!237691 (= e!154345 e!154346)))

(declare-fun res!116481 () Bool)

(assert (=> b!237691 (=> (not res!116481) (not e!154346))))

(assert (=> b!237691 (= res!116481 (not e!154348))))

(declare-fun res!116480 () Bool)

(assert (=> b!237691 (=> (not res!116480) (not e!154348))))

(assert (=> b!237691 (= res!116480 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237692 () Bool)

(assert (=> b!237692 (= e!154347 call!22098)))

(assert (= (and d!59657 (not res!116479)) b!237691))

(assert (= (and b!237691 res!116480) b!237689))

(assert (= (and b!237691 res!116481) b!237690))

(assert (= (and b!237690 c!39643) b!237688))

(assert (= (and b!237690 (not c!39643)) b!237692))

(assert (= (or b!237688 b!237692) bm!22095))

(assert (=> b!237689 m!258311))

(assert (=> b!237689 m!258311))

(declare-fun m!258399 () Bool)

(assert (=> b!237689 m!258399))

(assert (=> b!237690 m!258311))

(assert (=> b!237690 m!258311))

(assert (=> b!237690 m!258343))

(assert (=> bm!22095 m!258311))

(declare-fun m!258401 () Bool)

(assert (=> bm!22095 m!258401))

(assert (=> b!237691 m!258311))

(assert (=> b!237691 m!258311))

(assert (=> b!237691 m!258343))

(assert (=> b!237615 d!59657))

(declare-fun b!237717 () Bool)

(assert (=> b!237717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> b!237717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5924 (_values!4391 thiss!1504))))))

(declare-fun e!154363 () Bool)

(declare-fun lt!120214 () ListLongMap!3579)

(assert (=> b!237717 (= e!154363 (= (apply!217 lt!120214 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)) (get!2877 (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4408 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237718 () Bool)

(declare-fun e!154364 () Bool)

(assert (=> b!237718 (= e!154364 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237718 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!237719 () Bool)

(declare-fun lt!120212 () Unit!7300)

(declare-fun lt!120216 () Unit!7300)

(assert (=> b!237719 (= lt!120212 lt!120216)))

(declare-fun lt!120211 () ListLongMap!3579)

(declare-fun lt!120215 () (_ BitVec 64))

(declare-fun lt!120217 () (_ BitVec 64))

(declare-fun lt!120213 () V!7971)

(assert (=> b!237719 (not (contains!1689 (+!644 lt!120211 (tuple2!4667 lt!120217 lt!120213)) lt!120215))))

(declare-fun addStillNotContains!118 (ListLongMap!3579 (_ BitVec 64) V!7971 (_ BitVec 64)) Unit!7300)

(assert (=> b!237719 (= lt!120216 (addStillNotContains!118 lt!120211 lt!120217 lt!120213 lt!120215))))

(assert (=> b!237719 (= lt!120215 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!237719 (= lt!120213 (get!2877 (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4408 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237719 (= lt!120217 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!22101 () ListLongMap!3579)

(assert (=> b!237719 (= lt!120211 call!22101)))

(declare-fun e!154365 () ListLongMap!3579)

(assert (=> b!237719 (= e!154365 (+!644 call!22101 (tuple2!4667 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000) (get!2877 (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4408 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!59659 () Bool)

(declare-fun e!154366 () Bool)

(assert (=> d!59659 e!154366))

(declare-fun res!116493 () Bool)

(assert (=> d!59659 (=> (not res!116493) (not e!154366))))

(assert (=> d!59659 (= res!116493 (not (contains!1689 lt!120214 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!154367 () ListLongMap!3579)

(assert (=> d!59659 (= lt!120214 e!154367)))

(declare-fun c!39652 () Bool)

(assert (=> d!59659 (= c!39652 (bvsge #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> d!59659 (validMask!0 (mask!10421 thiss!1504))))

(assert (=> d!59659 (= (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4408 thiss!1504)) lt!120214)))

(declare-fun b!237720 () Bool)

(declare-fun e!154368 () Bool)

(assert (=> b!237720 (= e!154368 e!154363)))

(assert (=> b!237720 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun res!116491 () Bool)

(assert (=> b!237720 (= res!116491 (contains!1689 lt!120214 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237720 (=> (not res!116491) (not e!154363))))

(declare-fun bm!22098 () Bool)

(assert (=> bm!22098 (= call!22101 (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4408 thiss!1504)))))

(declare-fun b!237721 () Bool)

(declare-fun e!154369 () Bool)

(assert (=> b!237721 (= e!154368 e!154369)))

(declare-fun c!39653 () Bool)

(assert (=> b!237721 (= c!39653 (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun b!237722 () Bool)

(assert (=> b!237722 (= e!154367 (ListLongMap!3580 Nil!3563))))

(declare-fun b!237723 () Bool)

(assert (=> b!237723 (= e!154367 e!154365)))

(declare-fun c!39654 () Bool)

(assert (=> b!237723 (= c!39654 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237724 () Bool)

(declare-fun res!116492 () Bool)

(assert (=> b!237724 (=> (not res!116492) (not e!154366))))

(assert (=> b!237724 (= res!116492 (not (contains!1689 lt!120214 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237725 () Bool)

(declare-fun isEmpty!519 (ListLongMap!3579) Bool)

(assert (=> b!237725 (= e!154369 (isEmpty!519 lt!120214))))

(declare-fun b!237726 () Bool)

(assert (=> b!237726 (= e!154369 (= lt!120214 (getCurrentListMapNoExtraKeys!539 (_keys!6500 thiss!1504) (_values!4391 thiss!1504) (mask!10421 thiss!1504) (extraKeys!4145 thiss!1504) (zeroValue!4249 thiss!1504) (minValue!4249 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4408 thiss!1504))))))

(declare-fun b!237727 () Bool)

(assert (=> b!237727 (= e!154366 e!154368)))

(declare-fun c!39655 () Bool)

(assert (=> b!237727 (= c!39655 e!154364)))

(declare-fun res!116490 () Bool)

(assert (=> b!237727 (=> (not res!116490) (not e!154364))))

(assert (=> b!237727 (= res!116490 (bvslt #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun b!237728 () Bool)

(assert (=> b!237728 (= e!154365 call!22101)))

(assert (= (and d!59659 c!39652) b!237722))

(assert (= (and d!59659 (not c!39652)) b!237723))

(assert (= (and b!237723 c!39654) b!237719))

(assert (= (and b!237723 (not c!39654)) b!237728))

(assert (= (or b!237719 b!237728) bm!22098))

(assert (= (and d!59659 res!116493) b!237724))

(assert (= (and b!237724 res!116492) b!237727))

(assert (= (and b!237727 res!116490) b!237718))

(assert (= (and b!237727 c!39655) b!237720))

(assert (= (and b!237727 (not c!39655)) b!237721))

(assert (= (and b!237720 res!116491) b!237717))

(assert (= (and b!237721 c!39653) b!237726))

(assert (= (and b!237721 (not c!39653)) b!237725))

(declare-fun b_lambda!7959 () Bool)

(assert (=> (not b_lambda!7959) (not b!237717)))

(assert (=> b!237717 t!8556))

(declare-fun b_and!13341 () Bool)

(assert (= b_and!13339 (and (=> t!8556 result!5163) b_and!13341)))

(declare-fun b_lambda!7961 () Bool)

(assert (=> (not b_lambda!7961) (not b!237719)))

(assert (=> b!237719 t!8556))

(declare-fun b_and!13343 () Bool)

(assert (= b_and!13341 (and (=> t!8556 result!5163) b_and!13343)))

(declare-fun m!258403 () Bool)

(assert (=> b!237719 m!258403))

(assert (=> b!237719 m!258311))

(declare-fun m!258405 () Bool)

(assert (=> b!237719 m!258405))

(assert (=> b!237719 m!258329))

(declare-fun m!258407 () Bool)

(assert (=> b!237719 m!258407))

(assert (=> b!237719 m!258405))

(declare-fun m!258409 () Bool)

(assert (=> b!237719 m!258409))

(assert (=> b!237719 m!258329))

(assert (=> b!237719 m!258327))

(assert (=> b!237719 m!258331))

(assert (=> b!237719 m!258327))

(declare-fun m!258411 () Bool)

(assert (=> bm!22098 m!258411))

(declare-fun m!258413 () Bool)

(assert (=> d!59659 m!258413))

(assert (=> d!59659 m!258251))

(assert (=> b!237726 m!258411))

(declare-fun m!258415 () Bool)

(assert (=> b!237724 m!258415))

(assert (=> b!237720 m!258311))

(assert (=> b!237720 m!258311))

(declare-fun m!258417 () Bool)

(assert (=> b!237720 m!258417))

(assert (=> b!237718 m!258311))

(assert (=> b!237718 m!258311))

(assert (=> b!237718 m!258343))

(assert (=> b!237723 m!258311))

(assert (=> b!237723 m!258311))

(assert (=> b!237723 m!258343))

(declare-fun m!258419 () Bool)

(assert (=> b!237725 m!258419))

(assert (=> b!237717 m!258311))

(assert (=> b!237717 m!258329))

(assert (=> b!237717 m!258311))

(declare-fun m!258421 () Bool)

(assert (=> b!237717 m!258421))

(assert (=> b!237717 m!258329))

(assert (=> b!237717 m!258327))

(assert (=> b!237717 m!258331))

(assert (=> b!237717 m!258327))

(assert (=> bm!22086 d!59659))

(declare-fun b!237747 () Bool)

(declare-fun e!154381 () SeekEntryResult!1009)

(assert (=> b!237747 (= e!154381 (Intermediate!1009 false (toIndex!0 key!932 (mask!10421 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237748 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237748 (= e!154381 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10421 thiss!1504)) #b00000000000000000000000000000000 (mask!10421 thiss!1504)) key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)))))

(declare-fun b!237749 () Bool)

(declare-fun lt!120223 () SeekEntryResult!1009)

(assert (=> b!237749 (and (bvsge (index!6208 lt!120223) #b00000000000000000000000000000000) (bvslt (index!6208 lt!120223) (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun res!116502 () Bool)

(assert (=> b!237749 (= res!116502 (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6208 lt!120223)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!154382 () Bool)

(assert (=> b!237749 (=> res!116502 e!154382)))

(declare-fun b!237750 () Bool)

(declare-fun e!154383 () SeekEntryResult!1009)

(assert (=> b!237750 (= e!154383 (Intermediate!1009 true (toIndex!0 key!932 (mask!10421 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237751 () Bool)

(declare-fun e!154384 () Bool)

(assert (=> b!237751 (= e!154384 (bvsge (x!23961 lt!120223) #b01111111111111111111111111111110))))

(declare-fun b!237752 () Bool)

(assert (=> b!237752 (and (bvsge (index!6208 lt!120223) #b00000000000000000000000000000000) (bvslt (index!6208 lt!120223) (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> b!237752 (= e!154382 (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6208 lt!120223)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237753 () Bool)

(assert (=> b!237753 (= e!154383 e!154381)))

(declare-fun c!39664 () Bool)

(declare-fun lt!120222 () (_ BitVec 64))

(assert (=> b!237753 (= c!39664 (or (= lt!120222 key!932) (= (bvadd lt!120222 lt!120222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237754 () Bool)

(declare-fun e!154380 () Bool)

(assert (=> b!237754 (= e!154384 e!154380)))

(declare-fun res!116501 () Bool)

(assert (=> b!237754 (= res!116501 (and ((_ is Intermediate!1009) lt!120223) (not (undefined!1821 lt!120223)) (bvslt (x!23961 lt!120223) #b01111111111111111111111111111110) (bvsge (x!23961 lt!120223) #b00000000000000000000000000000000) (bvsge (x!23961 lt!120223) #b00000000000000000000000000000000)))))

(assert (=> b!237754 (=> (not res!116501) (not e!154380))))

(declare-fun d!59661 () Bool)

(assert (=> d!59661 e!154384))

(declare-fun c!39663 () Bool)

(assert (=> d!59661 (= c!39663 (and ((_ is Intermediate!1009) lt!120223) (undefined!1821 lt!120223)))))

(assert (=> d!59661 (= lt!120223 e!154383)))

(declare-fun c!39662 () Bool)

(assert (=> d!59661 (= c!39662 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!59661 (= lt!120222 (select (arr!5585 (_keys!6500 thiss!1504)) (toIndex!0 key!932 (mask!10421 thiss!1504))))))

(assert (=> d!59661 (validMask!0 (mask!10421 thiss!1504))))

(assert (=> d!59661 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10421 thiss!1504)) key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)) lt!120223)))

(declare-fun b!237755 () Bool)

(assert (=> b!237755 (and (bvsge (index!6208 lt!120223) #b00000000000000000000000000000000) (bvslt (index!6208 lt!120223) (size!5925 (_keys!6500 thiss!1504))))))

(declare-fun res!116500 () Bool)

(assert (=> b!237755 (= res!116500 (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6208 lt!120223)) key!932))))

(assert (=> b!237755 (=> res!116500 e!154382)))

(assert (=> b!237755 (= e!154380 e!154382)))

(assert (= (and d!59661 c!39662) b!237750))

(assert (= (and d!59661 (not c!39662)) b!237753))

(assert (= (and b!237753 c!39664) b!237747))

(assert (= (and b!237753 (not c!39664)) b!237748))

(assert (= (and d!59661 c!39663) b!237751))

(assert (= (and d!59661 (not c!39663)) b!237754))

(assert (= (and b!237754 res!116501) b!237755))

(assert (= (and b!237755 (not res!116500)) b!237749))

(assert (= (and b!237749 (not res!116502)) b!237752))

(assert (=> d!59661 m!258271))

(declare-fun m!258423 () Bool)

(assert (=> d!59661 m!258423))

(assert (=> d!59661 m!258251))

(declare-fun m!258425 () Bool)

(assert (=> b!237755 m!258425))

(assert (=> b!237749 m!258425))

(assert (=> b!237752 m!258425))

(assert (=> b!237748 m!258271))

(declare-fun m!258427 () Bool)

(assert (=> b!237748 m!258427))

(assert (=> b!237748 m!258427))

(declare-fun m!258429 () Bool)

(assert (=> b!237748 m!258429))

(assert (=> d!59623 d!59661))

(declare-fun d!59663 () Bool)

(declare-fun lt!120229 () (_ BitVec 32))

(declare-fun lt!120228 () (_ BitVec 32))

(assert (=> d!59663 (= lt!120229 (bvmul (bvxor lt!120228 (bvlshr lt!120228 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59663 (= lt!120228 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59663 (and (bvsge (mask!10421 thiss!1504) #b00000000000000000000000000000000) (let ((res!116503 (let ((h!4220 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23979 (bvmul (bvxor h!4220 (bvlshr h!4220 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23979 (bvlshr x!23979 #b00000000000000000000000000001101)) (mask!10421 thiss!1504)))))) (and (bvslt res!116503 (bvadd (mask!10421 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116503 #b00000000000000000000000000000000))))))

(assert (=> d!59663 (= (toIndex!0 key!932 (mask!10421 thiss!1504)) (bvand (bvxor lt!120229 (bvlshr lt!120229 #b00000000000000000000000000001101)) (mask!10421 thiss!1504)))))

(assert (=> d!59623 d!59663))

(assert (=> d!59623 d!59621))

(declare-fun b!237768 () Bool)

(declare-fun e!154393 () SeekEntryResult!1009)

(assert (=> b!237768 (= e!154393 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23961 lt!120098) #b00000000000000000000000000000001) (nextIndex!0 (index!6208 lt!120098) (x!23961 lt!120098) (mask!10421 thiss!1504)) (index!6208 lt!120098) key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)))))

(declare-fun b!237769 () Bool)

(declare-fun e!154391 () SeekEntryResult!1009)

(assert (=> b!237769 (= e!154391 Undefined!1009)))

(declare-fun b!237770 () Bool)

(declare-fun e!154392 () SeekEntryResult!1009)

(assert (=> b!237770 (= e!154391 e!154392)))

(declare-fun c!39671 () Bool)

(declare-fun lt!120234 () (_ BitVec 64))

(assert (=> b!237770 (= c!39671 (= lt!120234 key!932))))

(declare-fun b!237771 () Bool)

(declare-fun c!39672 () Bool)

(assert (=> b!237771 (= c!39672 (= lt!120234 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237771 (= e!154392 e!154393)))

(declare-fun b!237772 () Bool)

(assert (=> b!237772 (= e!154392 (Found!1009 (index!6208 lt!120098)))))

(declare-fun b!237773 () Bool)

(assert (=> b!237773 (= e!154393 (MissingVacant!1009 (index!6208 lt!120098)))))

(declare-fun d!59665 () Bool)

(declare-fun lt!120235 () SeekEntryResult!1009)

(assert (=> d!59665 (and (or ((_ is Undefined!1009) lt!120235) (not ((_ is Found!1009) lt!120235)) (and (bvsge (index!6207 lt!120235) #b00000000000000000000000000000000) (bvslt (index!6207 lt!120235) (size!5925 (_keys!6500 thiss!1504))))) (or ((_ is Undefined!1009) lt!120235) ((_ is Found!1009) lt!120235) (not ((_ is MissingVacant!1009) lt!120235)) (not (= (index!6209 lt!120235) (index!6208 lt!120098))) (and (bvsge (index!6209 lt!120235) #b00000000000000000000000000000000) (bvslt (index!6209 lt!120235) (size!5925 (_keys!6500 thiss!1504))))) (or ((_ is Undefined!1009) lt!120235) (ite ((_ is Found!1009) lt!120235) (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6207 lt!120235)) key!932) (and ((_ is MissingVacant!1009) lt!120235) (= (index!6209 lt!120235) (index!6208 lt!120098)) (= (select (arr!5585 (_keys!6500 thiss!1504)) (index!6209 lt!120235)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59665 (= lt!120235 e!154391)))

(declare-fun c!39673 () Bool)

(assert (=> d!59665 (= c!39673 (bvsge (x!23961 lt!120098) #b01111111111111111111111111111110))))

(assert (=> d!59665 (= lt!120234 (select (arr!5585 (_keys!6500 thiss!1504)) (index!6208 lt!120098)))))

(assert (=> d!59665 (validMask!0 (mask!10421 thiss!1504))))

(assert (=> d!59665 (= (seekKeyOrZeroReturnVacant!0 (x!23961 lt!120098) (index!6208 lt!120098) (index!6208 lt!120098) key!932 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)) lt!120235)))

(assert (= (and d!59665 c!39673) b!237769))

(assert (= (and d!59665 (not c!39673)) b!237770))

(assert (= (and b!237770 c!39671) b!237772))

(assert (= (and b!237770 (not c!39671)) b!237771))

(assert (= (and b!237771 c!39672) b!237773))

(assert (= (and b!237771 (not c!39672)) b!237768))

(declare-fun m!258431 () Bool)

(assert (=> b!237768 m!258431))

(assert (=> b!237768 m!258431))

(declare-fun m!258433 () Bool)

(assert (=> b!237768 m!258433))

(declare-fun m!258435 () Bool)

(assert (=> d!59665 m!258435))

(declare-fun m!258437 () Bool)

(assert (=> d!59665 m!258437))

(assert (=> d!59665 m!258269))

(assert (=> d!59665 m!258251))

(assert (=> b!237532 d!59665))

(declare-fun d!59667 () Bool)

(declare-fun res!116509 () Bool)

(declare-fun e!154400 () Bool)

(assert (=> d!59667 (=> res!116509 e!154400)))

(assert (=> d!59667 (= res!116509 (bvsge #b00000000000000000000000000000000 (size!5925 (_keys!6500 thiss!1504))))))

(assert (=> d!59667 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6500 thiss!1504) (mask!10421 thiss!1504)) e!154400)))

(declare-fun b!237782 () Bool)

(declare-fun e!154401 () Bool)

(declare-fun call!22104 () Bool)

(assert (=> b!237782 (= e!154401 call!22104)))

(declare-fun b!237783 () Bool)

(declare-fun e!154402 () Bool)

(assert (=> b!237783 (= e!154400 e!154402)))

(declare-fun c!39676 () Bool)

(assert (=> b!237783 (= c!39676 (validKeyInArray!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22101 () Bool)

(assert (=> bm!22101 (= call!22104 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6500 thiss!1504) (mask!10421 thiss!1504)))))

(declare-fun b!237784 () Bool)

(assert (=> b!237784 (= e!154402 e!154401)))

(declare-fun lt!120244 () (_ BitVec 64))

(assert (=> b!237784 (= lt!120244 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!120242 () Unit!7300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11759 (_ BitVec 64) (_ BitVec 32)) Unit!7300)

(assert (=> b!237784 (= lt!120242 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6500 thiss!1504) lt!120244 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237784 (arrayContainsKey!0 (_keys!6500 thiss!1504) lt!120244 #b00000000000000000000000000000000)))

(declare-fun lt!120243 () Unit!7300)

(assert (=> b!237784 (= lt!120243 lt!120242)))

(declare-fun res!116508 () Bool)

(assert (=> b!237784 (= res!116508 (= (seekEntryOrOpen!0 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000) (_keys!6500 thiss!1504) (mask!10421 thiss!1504)) (Found!1009 #b00000000000000000000000000000000)))))

(assert (=> b!237784 (=> (not res!116508) (not e!154401))))

(declare-fun b!237785 () Bool)

(assert (=> b!237785 (= e!154402 call!22104)))

(assert (= (and d!59667 (not res!116509)) b!237783))

(assert (= (and b!237783 c!39676) b!237784))

(assert (= (and b!237783 (not c!39676)) b!237785))

(assert (= (and b!237784 res!116508) b!237782))

(assert (= (or b!237782 b!237785) bm!22101))

(assert (=> b!237783 m!258311))

(assert (=> b!237783 m!258311))

(assert (=> b!237783 m!258343))

(declare-fun m!258439 () Bool)

(assert (=> bm!22101 m!258439))

(assert (=> b!237784 m!258311))

(declare-fun m!258441 () Bool)

(assert (=> b!237784 m!258441))

(declare-fun m!258443 () Bool)

(assert (=> b!237784 m!258443))

(assert (=> b!237784 m!258311))

(declare-fun m!258445 () Bool)

(assert (=> b!237784 m!258445))

(assert (=> b!237614 d!59667))

(assert (=> b!237541 d!59649))

(assert (=> b!237541 d!59651))

(declare-fun d!59669 () Bool)

(declare-fun e!154405 () Bool)

(assert (=> d!59669 e!154405))

(declare-fun res!116514 () Bool)

(assert (=> d!59669 (=> (not res!116514) (not e!154405))))

(declare-fun lt!120254 () ListLongMap!3579)

(assert (=> d!59669 (= res!116514 (contains!1689 lt!120254 (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))))))

(declare-fun lt!120256 () List!3566)

(assert (=> d!59669 (= lt!120254 (ListLongMap!3580 lt!120256))))

(declare-fun lt!120255 () Unit!7300)

(declare-fun lt!120253 () Unit!7300)

(assert (=> d!59669 (= lt!120255 lt!120253)))

(assert (=> d!59669 (= (getValueByKey!275 lt!120256 (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!154 (List!3566 (_ BitVec 64) V!7971) Unit!7300)

(assert (=> d!59669 (= lt!120253 (lemmaContainsTupThenGetReturnValue!154 lt!120256 (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))))))

(declare-fun insertStrictlySorted!157 (List!3566 (_ BitVec 64) V!7971) List!3566)

(assert (=> d!59669 (= lt!120256 (insertStrictlySorted!157 (toList!1805 call!22086) (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))))))

(assert (=> d!59669 (= (+!644 call!22086 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))) lt!120254)))

(declare-fun b!237790 () Bool)

(declare-fun res!116515 () Bool)

(assert (=> b!237790 (=> (not res!116515) (not e!154405))))

(assert (=> b!237790 (= res!116515 (= (getValueByKey!275 (toList!1805 lt!120254) (_1!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))))))

(declare-fun b!237791 () Bool)

(declare-fun contains!1692 (List!3566 tuple2!4666) Bool)

(assert (=> b!237791 (= e!154405 (contains!1692 (toList!1805 lt!120254) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))))

(assert (= (and d!59669 res!116514) b!237790))

(assert (= (and b!237790 res!116515) b!237791))

(declare-fun m!258447 () Bool)

(assert (=> d!59669 m!258447))

(declare-fun m!258449 () Bool)

(assert (=> d!59669 m!258449))

(declare-fun m!258451 () Bool)

(assert (=> d!59669 m!258451))

(declare-fun m!258453 () Bool)

(assert (=> d!59669 m!258453))

(declare-fun m!258455 () Bool)

(assert (=> b!237790 m!258455))

(declare-fun m!258457 () Bool)

(assert (=> b!237791 m!258457))

(assert (=> b!237594 d!59669))

(assert (=> b!237603 d!59653))

(declare-fun d!59671 () Bool)

(declare-fun e!154406 () Bool)

(assert (=> d!59671 e!154406))

(declare-fun res!116516 () Bool)

(assert (=> d!59671 (=> (not res!116516) (not e!154406))))

(declare-fun lt!120258 () ListLongMap!3579)

(assert (=> d!59671 (= res!116516 (contains!1689 lt!120258 (_1!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))))))

(declare-fun lt!120260 () List!3566)

(assert (=> d!59671 (= lt!120258 (ListLongMap!3580 lt!120260))))

(declare-fun lt!120259 () Unit!7300)

(declare-fun lt!120257 () Unit!7300)

(assert (=> d!59671 (= lt!120259 lt!120257)))

(assert (=> d!59671 (= (getValueByKey!275 lt!120260 (_1!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))) (Some!280 (_2!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))))))

(assert (=> d!59671 (= lt!120257 (lemmaContainsTupThenGetReturnValue!154 lt!120260 (_1!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))) (_2!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))))))

(assert (=> d!59671 (= lt!120260 (insertStrictlySorted!157 (toList!1805 (ite c!39624 call!22088 (ite c!39625 call!22089 call!22087))) (_1!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))) (_2!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))))))

(assert (=> d!59671 (= (+!644 (ite c!39624 call!22088 (ite c!39625 call!22089 call!22087)) (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))) lt!120258)))

(declare-fun b!237792 () Bool)

(declare-fun res!116517 () Bool)

(assert (=> b!237792 (=> (not res!116517) (not e!154406))))

(assert (=> b!237792 (= res!116517 (= (getValueByKey!275 (toList!1805 lt!120258) (_1!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504))))) (Some!280 (_2!2344 (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))))))))

(declare-fun b!237793 () Bool)

(assert (=> b!237793 (= e!154406 (contains!1692 (toList!1805 lt!120258) (ite (or c!39624 c!39625) (tuple2!4667 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4249 thiss!1504)) (tuple2!4667 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4249 thiss!1504)))))))

(assert (= (and d!59671 res!116516) b!237792))

(assert (= (and b!237792 res!116517) b!237793))

(declare-fun m!258459 () Bool)

(assert (=> d!59671 m!258459))

(declare-fun m!258461 () Bool)

(assert (=> d!59671 m!258461))

(declare-fun m!258463 () Bool)

(assert (=> d!59671 m!258463))

(declare-fun m!258465 () Bool)

(assert (=> d!59671 m!258465))

(declare-fun m!258467 () Bool)

(assert (=> b!237792 m!258467))

(declare-fun m!258469 () Bool)

(assert (=> b!237793 m!258469))

(assert (=> bm!22085 d!59671))

(declare-fun d!59673 () Bool)

(assert (=> d!59673 (= (apply!217 (+!644 lt!120169 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))) lt!120168) (apply!217 lt!120169 lt!120168))))

(declare-fun lt!120263 () Unit!7300)

(declare-fun choose!1114 (ListLongMap!3579 (_ BitVec 64) V!7971 (_ BitVec 64)) Unit!7300)

(assert (=> d!59673 (= lt!120263 (choose!1114 lt!120169 lt!120171 (minValue!4249 thiss!1504) lt!120168))))

(declare-fun e!154409 () Bool)

(assert (=> d!59673 e!154409))

(declare-fun res!116520 () Bool)

(assert (=> d!59673 (=> (not res!116520) (not e!154409))))

(assert (=> d!59673 (= res!116520 (contains!1689 lt!120169 lt!120168))))

(assert (=> d!59673 (= (addApplyDifferent!193 lt!120169 lt!120171 (minValue!4249 thiss!1504) lt!120168) lt!120263)))

(declare-fun b!237797 () Bool)

(assert (=> b!237797 (= e!154409 (not (= lt!120168 lt!120171)))))

(assert (= (and d!59673 res!116520) b!237797))

(declare-fun m!258471 () Bool)

(assert (=> d!59673 m!258471))

(declare-fun m!258473 () Bool)

(assert (=> d!59673 m!258473))

(assert (=> d!59673 m!258293))

(assert (=> d!59673 m!258295))

(assert (=> d!59673 m!258305))

(assert (=> d!59673 m!258293))

(assert (=> b!237585 d!59673))

(declare-fun d!59675 () Bool)

(assert (=> d!59675 (= (apply!217 lt!120165 lt!120166) (get!2878 (getValueByKey!275 (toList!1805 lt!120165) lt!120166)))))

(declare-fun bs!8774 () Bool)

(assert (= bs!8774 d!59675))

(declare-fun m!258475 () Bool)

(assert (=> bs!8774 m!258475))

(assert (=> bs!8774 m!258475))

(declare-fun m!258477 () Bool)

(assert (=> bs!8774 m!258477))

(assert (=> b!237585 d!59675))

(declare-fun d!59677 () Bool)

(declare-fun e!154410 () Bool)

(assert (=> d!59677 e!154410))

(declare-fun res!116521 () Bool)

(assert (=> d!59677 (=> (not res!116521) (not e!154410))))

(declare-fun lt!120265 () ListLongMap!3579)

(assert (=> d!59677 (= res!116521 (contains!1689 lt!120265 (_1!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504)))))))

(declare-fun lt!120267 () List!3566)

(assert (=> d!59677 (= lt!120265 (ListLongMap!3580 lt!120267))))

(declare-fun lt!120266 () Unit!7300)

(declare-fun lt!120264 () Unit!7300)

(assert (=> d!59677 (= lt!120266 lt!120264)))

(assert (=> d!59677 (= (getValueByKey!275 lt!120267 (_1!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504)))))))

(assert (=> d!59677 (= lt!120264 (lemmaContainsTupThenGetReturnValue!154 lt!120267 (_1!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504)))))))

(assert (=> d!59677 (= lt!120267 (insertStrictlySorted!157 (toList!1805 lt!120165) (_1!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504)))))))

(assert (=> d!59677 (= (+!644 lt!120165 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))) lt!120265)))

(declare-fun b!237798 () Bool)

(declare-fun res!116522 () Bool)

(assert (=> b!237798 (=> (not res!116522) (not e!154410))))

(assert (=> b!237798 (= res!116522 (= (getValueByKey!275 (toList!1805 lt!120265) (_1!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))))))))

(declare-fun b!237799 () Bool)

(assert (=> b!237799 (= e!154410 (contains!1692 (toList!1805 lt!120265) (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))))))

(assert (= (and d!59677 res!116521) b!237798))

(assert (= (and b!237798 res!116522) b!237799))

(declare-fun m!258479 () Bool)

(assert (=> d!59677 m!258479))

(declare-fun m!258481 () Bool)

(assert (=> d!59677 m!258481))

(declare-fun m!258483 () Bool)

(assert (=> d!59677 m!258483))

(declare-fun m!258485 () Bool)

(assert (=> d!59677 m!258485))

(declare-fun m!258487 () Bool)

(assert (=> b!237798 m!258487))

(declare-fun m!258489 () Bool)

(assert (=> b!237799 m!258489))

(assert (=> b!237585 d!59677))

(declare-fun d!59679 () Bool)

(assert (=> d!59679 (= (apply!217 (+!644 lt!120169 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))) lt!120168) (get!2878 (getValueByKey!275 (toList!1805 (+!644 lt!120169 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504)))) lt!120168)))))

(declare-fun bs!8775 () Bool)

(assert (= bs!8775 d!59679))

(declare-fun m!258491 () Bool)

(assert (=> bs!8775 m!258491))

(assert (=> bs!8775 m!258491))

(declare-fun m!258493 () Bool)

(assert (=> bs!8775 m!258493))

(assert (=> b!237585 d!59679))

(declare-fun d!59681 () Bool)

(assert (=> d!59681 (= (apply!217 (+!644 lt!120172 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))) lt!120170) (apply!217 lt!120172 lt!120170))))

(declare-fun lt!120268 () Unit!7300)

(assert (=> d!59681 (= lt!120268 (choose!1114 lt!120172 lt!120174 (zeroValue!4249 thiss!1504) lt!120170))))

(declare-fun e!154411 () Bool)

(assert (=> d!59681 e!154411))

(declare-fun res!116523 () Bool)

(assert (=> d!59681 (=> (not res!116523) (not e!154411))))

(assert (=> d!59681 (= res!116523 (contains!1689 lt!120172 lt!120170))))

(assert (=> d!59681 (= (addApplyDifferent!193 lt!120172 lt!120174 (zeroValue!4249 thiss!1504) lt!120170) lt!120268)))

(declare-fun b!237800 () Bool)

(assert (=> b!237800 (= e!154411 (not (= lt!120170 lt!120174)))))

(assert (= (and d!59681 res!116523) b!237800))

(declare-fun m!258495 () Bool)

(assert (=> d!59681 m!258495))

(declare-fun m!258497 () Bool)

(assert (=> d!59681 m!258497))

(assert (=> d!59681 m!258301))

(assert (=> d!59681 m!258307))

(assert (=> d!59681 m!258317))

(assert (=> d!59681 m!258301))

(assert (=> b!237585 d!59681))

(declare-fun d!59683 () Bool)

(declare-fun e!154412 () Bool)

(assert (=> d!59683 e!154412))

(declare-fun res!116524 () Bool)

(assert (=> d!59683 (=> res!116524 e!154412)))

(declare-fun lt!120271 () Bool)

(assert (=> d!59683 (= res!116524 (not lt!120271))))

(declare-fun lt!120270 () Bool)

(assert (=> d!59683 (= lt!120271 lt!120270)))

(declare-fun lt!120269 () Unit!7300)

(declare-fun e!154413 () Unit!7300)

(assert (=> d!59683 (= lt!120269 e!154413)))

(declare-fun c!39677 () Bool)

(assert (=> d!59683 (= c!39677 lt!120270)))

(assert (=> d!59683 (= lt!120270 (containsKey!267 (toList!1805 (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))) lt!120160))))

(assert (=> d!59683 (= (contains!1689 (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))) lt!120160) lt!120271)))

(declare-fun b!237801 () Bool)

(declare-fun lt!120272 () Unit!7300)

(assert (=> b!237801 (= e!154413 lt!120272)))

(assert (=> b!237801 (= lt!120272 (lemmaContainsKeyImpliesGetValueByKeyDefined!215 (toList!1805 (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))) lt!120160))))

(assert (=> b!237801 (isDefined!216 (getValueByKey!275 (toList!1805 (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))) lt!120160))))

(declare-fun b!237802 () Bool)

(declare-fun Unit!7307 () Unit!7300)

(assert (=> b!237802 (= e!154413 Unit!7307)))

(declare-fun b!237803 () Bool)

(assert (=> b!237803 (= e!154412 (isDefined!216 (getValueByKey!275 (toList!1805 (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))) lt!120160)))))

(assert (= (and d!59683 c!39677) b!237801))

(assert (= (and d!59683 (not c!39677)) b!237802))

(assert (= (and d!59683 (not res!116524)) b!237803))

(declare-fun m!258499 () Bool)

(assert (=> d!59683 m!258499))

(declare-fun m!258501 () Bool)

(assert (=> b!237801 m!258501))

(declare-fun m!258503 () Bool)

(assert (=> b!237801 m!258503))

(assert (=> b!237801 m!258503))

(declare-fun m!258505 () Bool)

(assert (=> b!237801 m!258505))

(assert (=> b!237803 m!258503))

(assert (=> b!237803 m!258503))

(assert (=> b!237803 m!258505))

(assert (=> b!237585 d!59683))

(declare-fun d!59685 () Bool)

(declare-fun e!154414 () Bool)

(assert (=> d!59685 e!154414))

(declare-fun res!116525 () Bool)

(assert (=> d!59685 (=> (not res!116525) (not e!154414))))

(declare-fun lt!120274 () ListLongMap!3579)

(assert (=> d!59685 (= res!116525 (contains!1689 lt!120274 (_1!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504)))))))

(declare-fun lt!120276 () List!3566)

(assert (=> d!59685 (= lt!120274 (ListLongMap!3580 lt!120276))))

(declare-fun lt!120275 () Unit!7300)

(declare-fun lt!120273 () Unit!7300)

(assert (=> d!59685 (= lt!120275 lt!120273)))

(assert (=> d!59685 (= (getValueByKey!275 lt!120276 (_1!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504)))))))

(assert (=> d!59685 (= lt!120273 (lemmaContainsTupThenGetReturnValue!154 lt!120276 (_1!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504)))))))

(assert (=> d!59685 (= lt!120276 (insertStrictlySorted!157 (toList!1805 lt!120172) (_1!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504)))))))

(assert (=> d!59685 (= (+!644 lt!120172 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))) lt!120274)))

(declare-fun b!237804 () Bool)

(declare-fun res!116526 () Bool)

(assert (=> b!237804 (=> (not res!116526) (not e!154414))))

(assert (=> b!237804 (= res!116526 (= (getValueByKey!275 (toList!1805 lt!120274) (_1!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))))))))

(declare-fun b!237805 () Bool)

(assert (=> b!237805 (= e!154414 (contains!1692 (toList!1805 lt!120274) (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))))))

(assert (= (and d!59685 res!116525) b!237804))

(assert (= (and b!237804 res!116526) b!237805))

(declare-fun m!258507 () Bool)

(assert (=> d!59685 m!258507))

(declare-fun m!258509 () Bool)

(assert (=> d!59685 m!258509))

(declare-fun m!258511 () Bool)

(assert (=> d!59685 m!258511))

(declare-fun m!258513 () Bool)

(assert (=> d!59685 m!258513))

(declare-fun m!258515 () Bool)

(assert (=> b!237804 m!258515))

(declare-fun m!258517 () Bool)

(assert (=> b!237805 m!258517))

(assert (=> b!237585 d!59685))

(declare-fun d!59687 () Bool)

(declare-fun e!154415 () Bool)

(assert (=> d!59687 e!154415))

(declare-fun res!116527 () Bool)

(assert (=> d!59687 (=> (not res!116527) (not e!154415))))

(declare-fun lt!120278 () ListLongMap!3579)

(assert (=> d!59687 (= res!116527 (contains!1689 lt!120278 (_1!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504)))))))

(declare-fun lt!120280 () List!3566)

(assert (=> d!59687 (= lt!120278 (ListLongMap!3580 lt!120280))))

(declare-fun lt!120279 () Unit!7300)

(declare-fun lt!120277 () Unit!7300)

(assert (=> d!59687 (= lt!120279 lt!120277)))

(assert (=> d!59687 (= (getValueByKey!275 lt!120280 (_1!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504)))))))

(assert (=> d!59687 (= lt!120277 (lemmaContainsTupThenGetReturnValue!154 lt!120280 (_1!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504)))))))

(assert (=> d!59687 (= lt!120280 (insertStrictlySorted!157 (toList!1805 lt!120169) (_1!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504)))))))

(assert (=> d!59687 (= (+!644 lt!120169 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))) lt!120278)))

(declare-fun b!237806 () Bool)

(declare-fun res!116528 () Bool)

(assert (=> b!237806 (=> (not res!116528) (not e!154415))))

(assert (=> b!237806 (= res!116528 (= (getValueByKey!275 (toList!1805 lt!120278) (_1!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))))))))

(declare-fun b!237807 () Bool)

(assert (=> b!237807 (= e!154415 (contains!1692 (toList!1805 lt!120278) (tuple2!4667 lt!120171 (minValue!4249 thiss!1504))))))

(assert (= (and d!59687 res!116527) b!237806))

(assert (= (and b!237806 res!116528) b!237807))

(declare-fun m!258519 () Bool)

(assert (=> d!59687 m!258519))

(declare-fun m!258521 () Bool)

(assert (=> d!59687 m!258521))

(declare-fun m!258523 () Bool)

(assert (=> d!59687 m!258523))

(declare-fun m!258525 () Bool)

(assert (=> d!59687 m!258525))

(declare-fun m!258527 () Bool)

(assert (=> b!237806 m!258527))

(declare-fun m!258529 () Bool)

(assert (=> b!237807 m!258529))

(assert (=> b!237585 d!59687))

(declare-fun d!59689 () Bool)

(assert (=> d!59689 (= (apply!217 lt!120169 lt!120168) (get!2878 (getValueByKey!275 (toList!1805 lt!120169) lt!120168)))))

(declare-fun bs!8776 () Bool)

(assert (= bs!8776 d!59689))

(declare-fun m!258531 () Bool)

(assert (=> bs!8776 m!258531))

(assert (=> bs!8776 m!258531))

(declare-fun m!258533 () Bool)

(assert (=> bs!8776 m!258533))

(assert (=> b!237585 d!59689))

(declare-fun d!59691 () Bool)

(assert (=> d!59691 (= (apply!217 (+!644 lt!120165 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))) lt!120166) (apply!217 lt!120165 lt!120166))))

(declare-fun lt!120281 () Unit!7300)

(assert (=> d!59691 (= lt!120281 (choose!1114 lt!120165 lt!120157 (minValue!4249 thiss!1504) lt!120166))))

(declare-fun e!154416 () Bool)

(assert (=> d!59691 e!154416))

(declare-fun res!116529 () Bool)

(assert (=> d!59691 (=> (not res!116529) (not e!154416))))

(assert (=> d!59691 (= res!116529 (contains!1689 lt!120165 lt!120166))))

(assert (=> d!59691 (= (addApplyDifferent!193 lt!120165 lt!120157 (minValue!4249 thiss!1504) lt!120166) lt!120281)))

(declare-fun b!237808 () Bool)

(assert (=> b!237808 (= e!154416 (not (= lt!120166 lt!120157)))))

(assert (= (and d!59691 res!116529) b!237808))

(declare-fun m!258535 () Bool)

(assert (=> d!59691 m!258535))

(declare-fun m!258537 () Bool)

(assert (=> d!59691 m!258537))

(assert (=> d!59691 m!258323))

(assert (=> d!59691 m!258325))

(assert (=> d!59691 m!258309))

(assert (=> d!59691 m!258323))

(assert (=> b!237585 d!59691))

(declare-fun d!59693 () Bool)

(assert (=> d!59693 (contains!1689 (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))) lt!120160)))

(declare-fun lt!120284 () Unit!7300)

(declare-fun choose!1115 (ListLongMap!3579 (_ BitVec 64) V!7971 (_ BitVec 64)) Unit!7300)

(assert (=> d!59693 (= lt!120284 (choose!1115 lt!120173 lt!120175 (zeroValue!4249 thiss!1504) lt!120160))))

(assert (=> d!59693 (contains!1689 lt!120173 lt!120160)))

(assert (=> d!59693 (= (addStillContains!193 lt!120173 lt!120175 (zeroValue!4249 thiss!1504) lt!120160) lt!120284)))

(declare-fun bs!8777 () Bool)

(assert (= bs!8777 d!59693))

(assert (=> bs!8777 m!258319))

(assert (=> bs!8777 m!258319))

(assert (=> bs!8777 m!258321))

(declare-fun m!258539 () Bool)

(assert (=> bs!8777 m!258539))

(declare-fun m!258541 () Bool)

(assert (=> bs!8777 m!258541))

(assert (=> b!237585 d!59693))

(declare-fun d!59695 () Bool)

(assert (=> d!59695 (= (apply!217 lt!120172 lt!120170) (get!2878 (getValueByKey!275 (toList!1805 lt!120172) lt!120170)))))

(declare-fun bs!8778 () Bool)

(assert (= bs!8778 d!59695))

(declare-fun m!258543 () Bool)

(assert (=> bs!8778 m!258543))

(assert (=> bs!8778 m!258543))

(declare-fun m!258545 () Bool)

(assert (=> bs!8778 m!258545))

(assert (=> b!237585 d!59695))

(declare-fun d!59697 () Bool)

(assert (=> d!59697 (= (apply!217 (+!644 lt!120165 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504))) lt!120166) (get!2878 (getValueByKey!275 (toList!1805 (+!644 lt!120165 (tuple2!4667 lt!120157 (minValue!4249 thiss!1504)))) lt!120166)))))

(declare-fun bs!8779 () Bool)

(assert (= bs!8779 d!59697))

(declare-fun m!258547 () Bool)

(assert (=> bs!8779 m!258547))

(assert (=> bs!8779 m!258547))

(declare-fun m!258549 () Bool)

(assert (=> bs!8779 m!258549))

(assert (=> b!237585 d!59697))

(declare-fun d!59699 () Bool)

(declare-fun e!154417 () Bool)

(assert (=> d!59699 e!154417))

(declare-fun res!116530 () Bool)

(assert (=> d!59699 (=> (not res!116530) (not e!154417))))

(declare-fun lt!120286 () ListLongMap!3579)

(assert (=> d!59699 (= res!116530 (contains!1689 lt!120286 (_1!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))))))

(declare-fun lt!120288 () List!3566)

(assert (=> d!59699 (= lt!120286 (ListLongMap!3580 lt!120288))))

(declare-fun lt!120287 () Unit!7300)

(declare-fun lt!120285 () Unit!7300)

(assert (=> d!59699 (= lt!120287 lt!120285)))

(assert (=> d!59699 (= (getValueByKey!275 lt!120288 (_1!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))))))

(assert (=> d!59699 (= lt!120285 (lemmaContainsTupThenGetReturnValue!154 lt!120288 (_1!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))))))

(assert (=> d!59699 (= lt!120288 (insertStrictlySorted!157 (toList!1805 lt!120173) (_1!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))) (_2!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))))))

(assert (=> d!59699 (= (+!644 lt!120173 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))) lt!120286)))

(declare-fun b!237810 () Bool)

(declare-fun res!116531 () Bool)

(assert (=> b!237810 (=> (not res!116531) (not e!154417))))

(assert (=> b!237810 (= res!116531 (= (getValueByKey!275 (toList!1805 lt!120286) (_1!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504)))) (Some!280 (_2!2344 (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))))))))

(declare-fun b!237811 () Bool)

(assert (=> b!237811 (= e!154417 (contains!1692 (toList!1805 lt!120286) (tuple2!4667 lt!120175 (zeroValue!4249 thiss!1504))))))

(assert (= (and d!59699 res!116530) b!237810))

(assert (= (and b!237810 res!116531) b!237811))

(declare-fun m!258551 () Bool)

(assert (=> d!59699 m!258551))

(declare-fun m!258553 () Bool)

(assert (=> d!59699 m!258553))

(declare-fun m!258555 () Bool)

(assert (=> d!59699 m!258555))

(declare-fun m!258557 () Bool)

(assert (=> d!59699 m!258557))

(declare-fun m!258559 () Bool)

(assert (=> b!237810 m!258559))

(declare-fun m!258561 () Bool)

(assert (=> b!237811 m!258561))

(assert (=> b!237585 d!59699))

(declare-fun d!59701 () Bool)

(assert (=> d!59701 (= (apply!217 (+!644 lt!120172 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504))) lt!120170) (get!2878 (getValueByKey!275 (toList!1805 (+!644 lt!120172 (tuple2!4667 lt!120174 (zeroValue!4249 thiss!1504)))) lt!120170)))))

(declare-fun bs!8780 () Bool)

(assert (= bs!8780 d!59701))

(declare-fun m!258563 () Bool)

(assert (=> bs!8780 m!258563))

(assert (=> bs!8780 m!258563))

(declare-fun m!258565 () Bool)

(assert (=> bs!8780 m!258565))

(assert (=> b!237585 d!59701))

(assert (=> b!237585 d!59659))

(declare-fun d!59703 () Bool)

(assert (=> d!59703 (= (apply!217 lt!120163 (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000)) (get!2878 (getValueByKey!275 (toList!1805 lt!120163) (select (arr!5585 (_keys!6500 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8781 () Bool)

(assert (= bs!8781 d!59703))

(assert (=> bs!8781 m!258311))

(assert (=> bs!8781 m!258379))

(assert (=> bs!8781 m!258379))

(declare-fun m!258567 () Bool)

(assert (=> bs!8781 m!258567))

(assert (=> b!237602 d!59703))

(declare-fun d!59705 () Bool)

(declare-fun c!39680 () Bool)

(assert (=> d!59705 (= c!39680 ((_ is ValueCellFull!2778) (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!154420 () V!7971)

(assert (=> d!59705 (= (get!2877 (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4408 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!154420)))

(declare-fun b!237816 () Bool)

(declare-fun get!2879 (ValueCell!2778 V!7971) V!7971)

(assert (=> b!237816 (= e!154420 (get!2879 (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4408 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237817 () Bool)

(declare-fun get!2880 (ValueCell!2778 V!7971) V!7971)

(assert (=> b!237817 (= e!154420 (get!2880 (select (arr!5584 (_values!4391 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!560 (defaultEntry!4408 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59705 c!39680) b!237816))

(assert (= (and d!59705 (not c!39680)) b!237817))

(assert (=> b!237816 m!258329))

(assert (=> b!237816 m!258327))

(declare-fun m!258569 () Bool)

(assert (=> b!237816 m!258569))

(assert (=> b!237817 m!258329))

(assert (=> b!237817 m!258327))

(declare-fun m!258571 () Bool)

(assert (=> b!237817 m!258571))

(assert (=> b!237602 d!59705))

(declare-fun d!59707 () Bool)

(assert (=> d!59707 (= (apply!217 lt!120163 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2878 (getValueByKey!275 (toList!1805 lt!120163) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8782 () Bool)

(assert (= bs!8782 d!59707))

(assert (=> bs!8782 m!258363))

(assert (=> bs!8782 m!258363))

(declare-fun m!258573 () Bool)

(assert (=> bs!8782 m!258573))

(assert (=> b!237584 d!59707))

(declare-fun mapNonEmpty!10590 () Bool)

(declare-fun mapRes!10590 () Bool)

(declare-fun tp!22344 () Bool)

(declare-fun e!154421 () Bool)

(assert (=> mapNonEmpty!10590 (= mapRes!10590 (and tp!22344 e!154421))))

(declare-fun mapValue!10590 () ValueCell!2778)

(declare-fun mapRest!10590 () (Array (_ BitVec 32) ValueCell!2778))

(declare-fun mapKey!10590 () (_ BitVec 32))

(assert (=> mapNonEmpty!10590 (= mapRest!10589 (store mapRest!10590 mapKey!10590 mapValue!10590))))

(declare-fun b!237819 () Bool)

(declare-fun e!154422 () Bool)

(assert (=> b!237819 (= e!154422 tp_is_empty!6243)))

(declare-fun b!237818 () Bool)

(assert (=> b!237818 (= e!154421 tp_is_empty!6243)))

(declare-fun condMapEmpty!10590 () Bool)

(declare-fun mapDefault!10590 () ValueCell!2778)

(assert (=> mapNonEmpty!10589 (= condMapEmpty!10590 (= mapRest!10589 ((as const (Array (_ BitVec 32) ValueCell!2778)) mapDefault!10590)))))

(assert (=> mapNonEmpty!10589 (= tp!22343 (and e!154422 mapRes!10590))))

(declare-fun mapIsEmpty!10590 () Bool)

(assert (=> mapIsEmpty!10590 mapRes!10590))

(assert (= (and mapNonEmpty!10589 condMapEmpty!10590) mapIsEmpty!10590))

(assert (= (and mapNonEmpty!10589 (not condMapEmpty!10590)) mapNonEmpty!10590))

(assert (= (and mapNonEmpty!10590 ((_ is ValueCellFull!2778) mapValue!10590)) b!237818))

(assert (= (and mapNonEmpty!10589 ((_ is ValueCellFull!2778) mapDefault!10590)) b!237819))

(declare-fun m!258575 () Bool)

(assert (=> mapNonEmpty!10590 m!258575))

(declare-fun b_lambda!7963 () Bool)

(assert (= b_lambda!7959 (or (and b!237483 b_free!6381) b_lambda!7963)))

(declare-fun b_lambda!7965 () Bool)

(assert (= b_lambda!7961 (or (and b!237483 b_free!6381) b_lambda!7965)))

(check-sat (not b!237810) (not b!237689) (not b!237799) (not bm!22092) (not b_lambda!7963) (not b!237665) (not d!59637) (not bm!22098) (not b_next!6381) (not d!59707) (not b_lambda!7965) (not mapNonEmpty!10590) (not b!237726) (not d!59659) (not bm!22095) (not b!237630) (not b!237638) (not b!237811) (not b!237768) (not d!59679) (not d!59697) (not d!59703) (not b!237718) (not b!237626) (not d!59701) (not d!59689) (not b!237791) (not b!237717) (not b!237784) (not bm!22101) (not d!59655) (not d!59647) (not b!237648) (not b!237805) (not b!237724) (not b!237629) (not d!59665) (not d!59677) tp_is_empty!6243 (not b!237661) (not d!59639) (not b!237803) (not b!237720) (not b!237801) (not b!237719) (not b_lambda!7957) (not b!237660) b_and!13343 (not d!59691) (not d!59645) (not d!59671) (not d!59675) (not d!59699) (not b!237723) (not b!237793) (not d!59685) (not b!237624) (not d!59661) (not d!59683) (not b!237627) (not b!237748) (not d!59673) (not b!237725) (not b!237798) (not b!237792) (not b!237806) (not d!59681) (not d!59693) (not d!59649) (not b!237790) (not b!237676) (not b!237690) (not b!237632) (not b!237817) (not b!237783) (not d!59669) (not b!237807) (not d!59687) (not d!59635) (not b!237691) (not d!59695) (not b!237804) (not b!237816))
(check-sat b_and!13343 (not b_next!6381))
