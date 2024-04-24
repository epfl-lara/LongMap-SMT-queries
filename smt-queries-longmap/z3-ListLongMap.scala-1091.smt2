; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22296 () Bool)

(assert start!22296)

(declare-fun b!233743 () Bool)

(declare-fun b_free!6295 () Bool)

(declare-fun b_next!6295 () Bool)

(assert (=> b!233743 (= b_free!6295 (not b_next!6295))))

(declare-fun tp!22033 () Bool)

(declare-fun b_and!13215 () Bool)

(assert (=> b!233743 (= tp!22033 b_and!13215)))

(declare-datatypes ((V!7857 0))(
  ( (V!7858 (val!3123 Int)) )
))
(declare-datatypes ((ValueCell!2735 0))(
  ( (ValueCellFull!2735 (v!5146 V!7857)) (EmptyCell!2735) )
))
(declare-datatypes ((array!11559 0))(
  ( (array!11560 (arr!5497 (Array (_ BitVec 32) ValueCell!2735)) (size!5831 (_ BitVec 32))) )
))
(declare-datatypes ((array!11561 0))(
  ( (array!11562 (arr!5498 (Array (_ BitVec 32) (_ BitVec 64))) (size!5832 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3370 0))(
  ( (LongMapFixedSize!3371 (defaultEntry!4347 Int) (mask!10281 (_ BitVec 32)) (extraKeys!4084 (_ BitVec 32)) (zeroValue!4188 V!7857) (minValue!4188 V!7857) (_size!1734 (_ BitVec 32)) (_keys!6406 array!11561) (_values!4330 array!11559) (_vacant!1734 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3370)

(declare-fun e!151828 () Bool)

(declare-fun e!151829 () Bool)

(declare-fun tp_is_empty!6157 () Bool)

(declare-fun array_inv!3603 (array!11561) Bool)

(declare-fun array_inv!3604 (array!11559) Bool)

(assert (=> b!233743 (= e!151828 (and tp!22033 tp_is_empty!6157 (array_inv!3603 (_keys!6406 thiss!1504)) (array_inv!3604 (_values!4330 thiss!1504)) e!151829))))

(declare-fun b!233744 () Bool)

(declare-fun e!151826 () Bool)

(assert (=> b!233744 (= e!151826 tp_is_empty!6157)))

(declare-fun mapNonEmpty!10412 () Bool)

(declare-fun mapRes!10412 () Bool)

(declare-fun tp!22034 () Bool)

(declare-fun e!151831 () Bool)

(assert (=> mapNonEmpty!10412 (= mapRes!10412 (and tp!22034 e!151831))))

(declare-fun mapValue!10412 () ValueCell!2735)

(declare-fun mapKey!10412 () (_ BitVec 32))

(declare-fun mapRest!10412 () (Array (_ BitVec 32) ValueCell!2735))

(assert (=> mapNonEmpty!10412 (= (arr!5497 (_values!4330 thiss!1504)) (store mapRest!10412 mapKey!10412 mapValue!10412))))

(declare-fun b!233745 () Bool)

(declare-fun res!114693 () Bool)

(declare-fun e!151825 () Bool)

(assert (=> b!233745 (=> (not res!114693) (not e!151825))))

(declare-fun key!932 () (_ BitVec 64))

(assert (=> b!233745 (= res!114693 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!233746 () Bool)

(declare-fun res!114692 () Bool)

(declare-fun e!151830 () Bool)

(assert (=> b!233746 (=> (not res!114692) (not e!151830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!233746 (= res!114692 (validMask!0 (mask!10281 thiss!1504)))))

(declare-fun b!233747 () Bool)

(assert (=> b!233747 (= e!151825 e!151830)))

(declare-fun res!114694 () Bool)

(assert (=> b!233747 (=> (not res!114694) (not e!151830))))

(declare-datatypes ((SeekEntryResult!947 0))(
  ( (MissingZero!947 (index!5958 (_ BitVec 32))) (Found!947 (index!5959 (_ BitVec 32))) (Intermediate!947 (undefined!1759 Bool) (index!5960 (_ BitVec 32)) (x!23619 (_ BitVec 32))) (Undefined!947) (MissingVacant!947 (index!5961 (_ BitVec 32))) )
))
(declare-fun lt!118269 () SeekEntryResult!947)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!233747 (= res!114694 (or (= lt!118269 (MissingZero!947 index!297)) (= lt!118269 (MissingVacant!947 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11561 (_ BitVec 32)) SeekEntryResult!947)

(assert (=> b!233747 (= lt!118269 (seekEntryOrOpen!0 key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)))))

(declare-fun mapIsEmpty!10412 () Bool)

(assert (=> mapIsEmpty!10412 mapRes!10412))

(declare-fun res!114696 () Bool)

(assert (=> start!22296 (=> (not res!114696) (not e!151825))))

(declare-fun valid!1346 (LongMapFixedSize!3370) Bool)

(assert (=> start!22296 (= res!114696 (valid!1346 thiss!1504))))

(assert (=> start!22296 e!151825))

(assert (=> start!22296 e!151828))

(assert (=> start!22296 true))

(declare-fun b!233748 () Bool)

(assert (=> b!233748 (= e!151829 (and e!151826 mapRes!10412))))

(declare-fun condMapEmpty!10412 () Bool)

(declare-fun mapDefault!10412 () ValueCell!2735)

(assert (=> b!233748 (= condMapEmpty!10412 (= (arr!5497 (_values!4330 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2735)) mapDefault!10412)))))

(declare-fun b!233749 () Bool)

(assert (=> b!233749 (= e!151831 tp_is_empty!6157)))

(declare-fun b!233750 () Bool)

(declare-fun res!114695 () Bool)

(assert (=> b!233750 (=> (not res!114695) (not e!151830))))

(declare-datatypes ((tuple2!4538 0))(
  ( (tuple2!4539 (_1!2280 (_ BitVec 64)) (_2!2280 V!7857)) )
))
(declare-datatypes ((List!3442 0))(
  ( (Nil!3439) (Cons!3438 (h!4087 tuple2!4538) (t!8397 List!3442)) )
))
(declare-datatypes ((ListLongMap!3453 0))(
  ( (ListLongMap!3454 (toList!1742 List!3442)) )
))
(declare-fun contains!1626 (ListLongMap!3453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1274 (array!11561 array!11559 (_ BitVec 32) (_ BitVec 32) V!7857 V!7857 (_ BitVec 32) Int) ListLongMap!3453)

(assert (=> b!233750 (= res!114695 (contains!1626 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) key!932))))

(declare-fun b!233751 () Bool)

(assert (=> b!233751 (= e!151830 (and (= (size!5831 (_values!4330 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10281 thiss!1504))) (not (= (size!5832 (_keys!6406 thiss!1504)) (size!5831 (_values!4330 thiss!1504))))))))

(assert (= (and start!22296 res!114696) b!233745))

(assert (= (and b!233745 res!114693) b!233747))

(assert (= (and b!233747 res!114694) b!233750))

(assert (= (and b!233750 res!114695) b!233746))

(assert (= (and b!233746 res!114692) b!233751))

(assert (= (and b!233748 condMapEmpty!10412) mapIsEmpty!10412))

(assert (= (and b!233748 (not condMapEmpty!10412)) mapNonEmpty!10412))

(get-info :version)

(assert (= (and mapNonEmpty!10412 ((_ is ValueCellFull!2735) mapValue!10412)) b!233749))

(assert (= (and b!233748 ((_ is ValueCellFull!2735) mapDefault!10412)) b!233744))

(assert (= b!233743 b!233748))

(assert (= start!22296 b!233743))

(declare-fun m!255261 () Bool)

(assert (=> b!233743 m!255261))

(declare-fun m!255263 () Bool)

(assert (=> b!233743 m!255263))

(declare-fun m!255265 () Bool)

(assert (=> b!233747 m!255265))

(declare-fun m!255267 () Bool)

(assert (=> b!233746 m!255267))

(declare-fun m!255269 () Bool)

(assert (=> start!22296 m!255269))

(declare-fun m!255271 () Bool)

(assert (=> b!233750 m!255271))

(assert (=> b!233750 m!255271))

(declare-fun m!255273 () Bool)

(assert (=> b!233750 m!255273))

(declare-fun m!255275 () Bool)

(assert (=> mapNonEmpty!10412 m!255275))

(check-sat (not b!233743) (not start!22296) b_and!13215 (not mapNonEmpty!10412) tp_is_empty!6157 (not b_next!6295) (not b!233750) (not b!233747) (not b!233746))
(check-sat b_and!13215 (not b_next!6295))
(get-model)

(declare-fun d!59043 () Bool)

(assert (=> d!59043 (= (array_inv!3603 (_keys!6406 thiss!1504)) (bvsge (size!5832 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233743 d!59043))

(declare-fun d!59045 () Bool)

(assert (=> d!59045 (= (array_inv!3604 (_values!4330 thiss!1504)) (bvsge (size!5831 (_values!4330 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233743 d!59045))

(declare-fun b!233818 () Bool)

(declare-fun c!38912 () Bool)

(declare-fun lt!118282 () (_ BitVec 64))

(assert (=> b!233818 (= c!38912 (= lt!118282 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151880 () SeekEntryResult!947)

(declare-fun e!151881 () SeekEntryResult!947)

(assert (=> b!233818 (= e!151880 e!151881)))

(declare-fun b!233819 () Bool)

(declare-fun lt!118284 () SeekEntryResult!947)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11561 (_ BitVec 32)) SeekEntryResult!947)

(assert (=> b!233819 (= e!151881 (seekKeyOrZeroReturnVacant!0 (x!23619 lt!118284) (index!5960 lt!118284) (index!5960 lt!118284) key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)))))

(declare-fun b!233820 () Bool)

(assert (=> b!233820 (= e!151881 (MissingZero!947 (index!5960 lt!118284)))))

(declare-fun b!233821 () Bool)

(declare-fun e!151882 () SeekEntryResult!947)

(assert (=> b!233821 (= e!151882 Undefined!947)))

(declare-fun d!59047 () Bool)

(declare-fun lt!118283 () SeekEntryResult!947)

(assert (=> d!59047 (and (or ((_ is Undefined!947) lt!118283) (not ((_ is Found!947) lt!118283)) (and (bvsge (index!5959 lt!118283) #b00000000000000000000000000000000) (bvslt (index!5959 lt!118283) (size!5832 (_keys!6406 thiss!1504))))) (or ((_ is Undefined!947) lt!118283) ((_ is Found!947) lt!118283) (not ((_ is MissingZero!947) lt!118283)) (and (bvsge (index!5958 lt!118283) #b00000000000000000000000000000000) (bvslt (index!5958 lt!118283) (size!5832 (_keys!6406 thiss!1504))))) (or ((_ is Undefined!947) lt!118283) ((_ is Found!947) lt!118283) ((_ is MissingZero!947) lt!118283) (not ((_ is MissingVacant!947) lt!118283)) (and (bvsge (index!5961 lt!118283) #b00000000000000000000000000000000) (bvslt (index!5961 lt!118283) (size!5832 (_keys!6406 thiss!1504))))) (or ((_ is Undefined!947) lt!118283) (ite ((_ is Found!947) lt!118283) (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5959 lt!118283)) key!932) (ite ((_ is MissingZero!947) lt!118283) (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5958 lt!118283)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!947) lt!118283) (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5961 lt!118283)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59047 (= lt!118283 e!151882)))

(declare-fun c!38911 () Bool)

(assert (=> d!59047 (= c!38911 (and ((_ is Intermediate!947) lt!118284) (undefined!1759 lt!118284)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11561 (_ BitVec 32)) SeekEntryResult!947)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59047 (= lt!118284 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10281 thiss!1504)) key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)))))

(assert (=> d!59047 (validMask!0 (mask!10281 thiss!1504))))

(assert (=> d!59047 (= (seekEntryOrOpen!0 key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)) lt!118283)))

(declare-fun b!233822 () Bool)

(assert (=> b!233822 (= e!151882 e!151880)))

(assert (=> b!233822 (= lt!118282 (select (arr!5498 (_keys!6406 thiss!1504)) (index!5960 lt!118284)))))

(declare-fun c!38910 () Bool)

(assert (=> b!233822 (= c!38910 (= lt!118282 key!932))))

(declare-fun b!233823 () Bool)

(assert (=> b!233823 (= e!151880 (Found!947 (index!5960 lt!118284)))))

(assert (= (and d!59047 c!38911) b!233821))

(assert (= (and d!59047 (not c!38911)) b!233822))

(assert (= (and b!233822 c!38910) b!233823))

(assert (= (and b!233822 (not c!38910)) b!233818))

(assert (= (and b!233818 c!38912) b!233820))

(assert (= (and b!233818 (not c!38912)) b!233819))

(declare-fun m!255309 () Bool)

(assert (=> b!233819 m!255309))

(assert (=> d!59047 m!255267))

(declare-fun m!255311 () Bool)

(assert (=> d!59047 m!255311))

(declare-fun m!255313 () Bool)

(assert (=> d!59047 m!255313))

(declare-fun m!255315 () Bool)

(assert (=> d!59047 m!255315))

(assert (=> d!59047 m!255313))

(declare-fun m!255317 () Bool)

(assert (=> d!59047 m!255317))

(declare-fun m!255319 () Bool)

(assert (=> d!59047 m!255319))

(declare-fun m!255321 () Bool)

(assert (=> b!233822 m!255321))

(assert (=> b!233747 d!59047))

(declare-fun d!59049 () Bool)

(assert (=> d!59049 (= (validMask!0 (mask!10281 thiss!1504)) (and (or (= (mask!10281 thiss!1504) #b00000000000000000000000000000111) (= (mask!10281 thiss!1504) #b00000000000000000000000000001111) (= (mask!10281 thiss!1504) #b00000000000000000000000000011111) (= (mask!10281 thiss!1504) #b00000000000000000000000000111111) (= (mask!10281 thiss!1504) #b00000000000000000000000001111111) (= (mask!10281 thiss!1504) #b00000000000000000000000011111111) (= (mask!10281 thiss!1504) #b00000000000000000000000111111111) (= (mask!10281 thiss!1504) #b00000000000000000000001111111111) (= (mask!10281 thiss!1504) #b00000000000000000000011111111111) (= (mask!10281 thiss!1504) #b00000000000000000000111111111111) (= (mask!10281 thiss!1504) #b00000000000000000001111111111111) (= (mask!10281 thiss!1504) #b00000000000000000011111111111111) (= (mask!10281 thiss!1504) #b00000000000000000111111111111111) (= (mask!10281 thiss!1504) #b00000000000000001111111111111111) (= (mask!10281 thiss!1504) #b00000000000000011111111111111111) (= (mask!10281 thiss!1504) #b00000000000000111111111111111111) (= (mask!10281 thiss!1504) #b00000000000001111111111111111111) (= (mask!10281 thiss!1504) #b00000000000011111111111111111111) (= (mask!10281 thiss!1504) #b00000000000111111111111111111111) (= (mask!10281 thiss!1504) #b00000000001111111111111111111111) (= (mask!10281 thiss!1504) #b00000000011111111111111111111111) (= (mask!10281 thiss!1504) #b00000000111111111111111111111111) (= (mask!10281 thiss!1504) #b00000001111111111111111111111111) (= (mask!10281 thiss!1504) #b00000011111111111111111111111111) (= (mask!10281 thiss!1504) #b00000111111111111111111111111111) (= (mask!10281 thiss!1504) #b00001111111111111111111111111111) (= (mask!10281 thiss!1504) #b00011111111111111111111111111111) (= (mask!10281 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10281 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!233746 d!59049))

(declare-fun d!59051 () Bool)

(declare-fun e!151887 () Bool)

(assert (=> d!59051 e!151887))

(declare-fun res!114729 () Bool)

(assert (=> d!59051 (=> res!114729 e!151887)))

(declare-fun lt!118294 () Bool)

(assert (=> d!59051 (= res!114729 (not lt!118294))))

(declare-fun lt!118295 () Bool)

(assert (=> d!59051 (= lt!118294 lt!118295)))

(declare-datatypes ((Unit!7211 0))(
  ( (Unit!7212) )
))
(declare-fun lt!118296 () Unit!7211)

(declare-fun e!151888 () Unit!7211)

(assert (=> d!59051 (= lt!118296 e!151888)))

(declare-fun c!38915 () Bool)

(assert (=> d!59051 (= c!38915 lt!118295)))

(declare-fun containsKey!255 (List!3442 (_ BitVec 64)) Bool)

(assert (=> d!59051 (= lt!118295 (containsKey!255 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(assert (=> d!59051 (= (contains!1626 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) key!932) lt!118294)))

(declare-fun b!233830 () Bool)

(declare-fun lt!118293 () Unit!7211)

(assert (=> b!233830 (= e!151888 lt!118293)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!203 (List!3442 (_ BitVec 64)) Unit!7211)

(assert (=> b!233830 (= lt!118293 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-datatypes ((Option!270 0))(
  ( (Some!269 (v!5149 V!7857)) (None!268) )
))
(declare-fun isDefined!204 (Option!270) Bool)

(declare-fun getValueByKey!264 (List!3442 (_ BitVec 64)) Option!270)

(assert (=> b!233830 (isDefined!204 (getValueByKey!264 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-fun b!233831 () Bool)

(declare-fun Unit!7213 () Unit!7211)

(assert (=> b!233831 (= e!151888 Unit!7213)))

(declare-fun b!233832 () Bool)

(assert (=> b!233832 (= e!151887 (isDefined!204 (getValueByKey!264 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932)))))

(assert (= (and d!59051 c!38915) b!233830))

(assert (= (and d!59051 (not c!38915)) b!233831))

(assert (= (and d!59051 (not res!114729)) b!233832))

(declare-fun m!255323 () Bool)

(assert (=> d!59051 m!255323))

(declare-fun m!255325 () Bool)

(assert (=> b!233830 m!255325))

(declare-fun m!255327 () Bool)

(assert (=> b!233830 m!255327))

(assert (=> b!233830 m!255327))

(declare-fun m!255329 () Bool)

(assert (=> b!233830 m!255329))

(assert (=> b!233832 m!255327))

(assert (=> b!233832 m!255327))

(assert (=> b!233832 m!255329))

(assert (=> b!233750 d!59051))

(declare-fun bm!21732 () Bool)

(declare-fun call!21737 () ListLongMap!3453)

(declare-fun getCurrentListMapNoExtraKeys!521 (array!11561 array!11559 (_ BitVec 32) (_ BitVec 32) V!7857 V!7857 (_ BitVec 32) Int) ListLongMap!3453)

(assert (=> bm!21732 (= call!21737 (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun b!233875 () Bool)

(declare-fun e!151924 () ListLongMap!3453)

(declare-fun call!21741 () ListLongMap!3453)

(assert (=> b!233875 (= e!151924 call!21741)))

(declare-fun b!233876 () Bool)

(declare-fun c!38932 () Bool)

(assert (=> b!233876 (= c!38932 (and (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!151919 () ListLongMap!3453)

(assert (=> b!233876 (= e!151919 e!151924)))

(declare-fun bm!21733 () Bool)

(declare-fun call!21739 () ListLongMap!3453)

(assert (=> bm!21733 (= call!21739 call!21737)))

(declare-fun b!233877 () Bool)

(declare-fun res!114753 () Bool)

(declare-fun e!151917 () Bool)

(assert (=> b!233877 (=> (not res!114753) (not e!151917))))

(declare-fun e!151920 () Bool)

(assert (=> b!233877 (= res!114753 e!151920)))

(declare-fun c!38930 () Bool)

(assert (=> b!233877 (= c!38930 (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!233878 () Bool)

(declare-fun e!151922 () Bool)

(declare-fun lt!118359 () ListLongMap!3453)

(declare-fun apply!205 (ListLongMap!3453 (_ BitVec 64)) V!7857)

(assert (=> b!233878 (= e!151922 (= (apply!205 lt!118359 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4188 thiss!1504)))))

(declare-fun bm!21734 () Bool)

(declare-fun call!21740 () ListLongMap!3453)

(assert (=> bm!21734 (= call!21741 call!21740)))

(declare-fun b!233879 () Bool)

(assert (=> b!233879 (= e!151920 e!151922)))

(declare-fun res!114756 () Bool)

(declare-fun call!21738 () Bool)

(assert (=> b!233879 (= res!114756 call!21738)))

(assert (=> b!233879 (=> (not res!114756) (not e!151922))))

(declare-fun b!233880 () Bool)

(declare-fun e!151921 () Bool)

(declare-fun get!2825 (ValueCell!2735 V!7857) V!7857)

(declare-fun dynLambda!548 (Int (_ BitVec 64)) V!7857)

(assert (=> b!233880 (= e!151921 (= (apply!205 lt!118359 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)) (get!2825 (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5831 (_values!4330 thiss!1504))))))

(assert (=> b!233880 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun bm!21735 () Bool)

(declare-fun c!38933 () Bool)

(declare-fun c!38929 () Bool)

(declare-fun call!21736 () ListLongMap!3453)

(declare-fun +!632 (ListLongMap!3453 tuple2!4538) ListLongMap!3453)

(assert (=> bm!21735 (= call!21740 (+!632 (ite c!38929 call!21737 (ite c!38933 call!21739 call!21736)) (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(declare-fun bm!21736 () Bool)

(declare-fun call!21735 () Bool)

(assert (=> bm!21736 (= call!21735 (contains!1626 lt!118359 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233881 () Bool)

(assert (=> b!233881 (= e!151924 call!21736)))

(declare-fun b!233882 () Bool)

(declare-fun e!151915 () Bool)

(assert (=> b!233882 (= e!151915 (= (apply!205 lt!118359 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4188 thiss!1504)))))

(declare-fun b!233883 () Bool)

(declare-fun e!151926 () Bool)

(assert (=> b!233883 (= e!151926 e!151921)))

(declare-fun res!114752 () Bool)

(assert (=> b!233883 (=> (not res!114752) (not e!151921))))

(assert (=> b!233883 (= res!114752 (contains!1626 lt!118359 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!233883 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun bm!21737 () Bool)

(assert (=> bm!21737 (= call!21738 (contains!1626 lt!118359 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233884 () Bool)

(declare-fun e!151927 () Unit!7211)

(declare-fun Unit!7214 () Unit!7211)

(assert (=> b!233884 (= e!151927 Unit!7214)))

(declare-fun b!233885 () Bool)

(declare-fun e!151916 () ListLongMap!3453)

(assert (=> b!233885 (= e!151916 (+!632 call!21740 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))

(declare-fun b!233886 () Bool)

(declare-fun res!114751 () Bool)

(assert (=> b!233886 (=> (not res!114751) (not e!151917))))

(assert (=> b!233886 (= res!114751 e!151926)))

(declare-fun res!114755 () Bool)

(assert (=> b!233886 (=> res!114755 e!151926)))

(declare-fun e!151923 () Bool)

(assert (=> b!233886 (= res!114755 (not e!151923))))

(declare-fun res!114750 () Bool)

(assert (=> b!233886 (=> (not res!114750) (not e!151923))))

(assert (=> b!233886 (= res!114750 (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun b!233887 () Bool)

(assert (=> b!233887 (= e!151919 call!21741)))

(declare-fun b!233888 () Bool)

(declare-fun lt!118361 () Unit!7211)

(assert (=> b!233888 (= e!151927 lt!118361)))

(declare-fun lt!118341 () ListLongMap!3453)

(assert (=> b!233888 (= lt!118341 (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118360 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118360 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118345 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118345 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118357 () Unit!7211)

(declare-fun addStillContains!181 (ListLongMap!3453 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7211)

(assert (=> b!233888 (= lt!118357 (addStillContains!181 lt!118341 lt!118360 (zeroValue!4188 thiss!1504) lt!118345))))

(assert (=> b!233888 (contains!1626 (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))) lt!118345)))

(declare-fun lt!118349 () Unit!7211)

(assert (=> b!233888 (= lt!118349 lt!118357)))

(declare-fun lt!118352 () ListLongMap!3453)

(assert (=> b!233888 (= lt!118352 (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118362 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118362 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118358 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118358 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118348 () Unit!7211)

(declare-fun addApplyDifferent!181 (ListLongMap!3453 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7211)

(assert (=> b!233888 (= lt!118348 (addApplyDifferent!181 lt!118352 lt!118362 (minValue!4188 thiss!1504) lt!118358))))

(assert (=> b!233888 (= (apply!205 (+!632 lt!118352 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))) lt!118358) (apply!205 lt!118352 lt!118358))))

(declare-fun lt!118342 () Unit!7211)

(assert (=> b!233888 (= lt!118342 lt!118348)))

(declare-fun lt!118346 () ListLongMap!3453)

(assert (=> b!233888 (= lt!118346 (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118355 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118355 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118354 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118354 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118343 () Unit!7211)

(assert (=> b!233888 (= lt!118343 (addApplyDifferent!181 lt!118346 lt!118355 (zeroValue!4188 thiss!1504) lt!118354))))

(assert (=> b!233888 (= (apply!205 (+!632 lt!118346 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))) lt!118354) (apply!205 lt!118346 lt!118354))))

(declare-fun lt!118356 () Unit!7211)

(assert (=> b!233888 (= lt!118356 lt!118343)))

(declare-fun lt!118347 () ListLongMap!3453)

(assert (=> b!233888 (= lt!118347 (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))

(declare-fun lt!118351 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118351 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118350 () (_ BitVec 64))

(assert (=> b!233888 (= lt!118350 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!233888 (= lt!118361 (addApplyDifferent!181 lt!118347 lt!118351 (minValue!4188 thiss!1504) lt!118350))))

(assert (=> b!233888 (= (apply!205 (+!632 lt!118347 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))) lt!118350) (apply!205 lt!118347 lt!118350))))

(declare-fun b!233889 () Bool)

(assert (=> b!233889 (= e!151920 (not call!21738))))

(declare-fun d!59053 () Bool)

(assert (=> d!59053 e!151917))

(declare-fun res!114749 () Bool)

(assert (=> d!59053 (=> (not res!114749) (not e!151917))))

(assert (=> d!59053 (= res!114749 (or (bvsge #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))))

(declare-fun lt!118344 () ListLongMap!3453)

(assert (=> d!59053 (= lt!118359 lt!118344)))

(declare-fun lt!118353 () Unit!7211)

(assert (=> d!59053 (= lt!118353 e!151927)))

(declare-fun c!38928 () Bool)

(declare-fun e!151918 () Bool)

(assert (=> d!59053 (= c!38928 e!151918)))

(declare-fun res!114748 () Bool)

(assert (=> d!59053 (=> (not res!114748) (not e!151918))))

(assert (=> d!59053 (= res!114748 (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> d!59053 (= lt!118344 e!151916)))

(assert (=> d!59053 (= c!38929 (and (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59053 (validMask!0 (mask!10281 thiss!1504))))

(assert (=> d!59053 (= (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) lt!118359)))

(declare-fun b!233890 () Bool)

(assert (=> b!233890 (= e!151916 e!151919)))

(assert (=> b!233890 (= c!38933 (and (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!233891 () Bool)

(declare-fun e!151925 () Bool)

(assert (=> b!233891 (= e!151925 (not call!21735))))

(declare-fun b!233892 () Bool)

(assert (=> b!233892 (= e!151925 e!151915)))

(declare-fun res!114754 () Bool)

(assert (=> b!233892 (= res!114754 call!21735)))

(assert (=> b!233892 (=> (not res!114754) (not e!151915))))

(declare-fun b!233893 () Bool)

(assert (=> b!233893 (= e!151917 e!151925)))

(declare-fun c!38931 () Bool)

(assert (=> b!233893 (= c!38931 (not (= (bvand (extraKeys!4084 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!21738 () Bool)

(assert (=> bm!21738 (= call!21736 call!21739)))

(declare-fun b!233894 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!233894 (= e!151923 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233895 () Bool)

(assert (=> b!233895 (= e!151918 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59053 c!38929) b!233885))

(assert (= (and d!59053 (not c!38929)) b!233890))

(assert (= (and b!233890 c!38933) b!233887))

(assert (= (and b!233890 (not c!38933)) b!233876))

(assert (= (and b!233876 c!38932) b!233875))

(assert (= (and b!233876 (not c!38932)) b!233881))

(assert (= (or b!233875 b!233881) bm!21738))

(assert (= (or b!233887 bm!21738) bm!21733))

(assert (= (or b!233887 b!233875) bm!21734))

(assert (= (or b!233885 bm!21733) bm!21732))

(assert (= (or b!233885 bm!21734) bm!21735))

(assert (= (and d!59053 res!114748) b!233895))

(assert (= (and d!59053 c!38928) b!233888))

(assert (= (and d!59053 (not c!38928)) b!233884))

(assert (= (and d!59053 res!114749) b!233886))

(assert (= (and b!233886 res!114750) b!233894))

(assert (= (and b!233886 (not res!114755)) b!233883))

(assert (= (and b!233883 res!114752) b!233880))

(assert (= (and b!233886 res!114751) b!233877))

(assert (= (and b!233877 c!38930) b!233879))

(assert (= (and b!233877 (not c!38930)) b!233889))

(assert (= (and b!233879 res!114756) b!233878))

(assert (= (or b!233879 b!233889) bm!21737))

(assert (= (and b!233877 res!114753) b!233893))

(assert (= (and b!233893 c!38931) b!233892))

(assert (= (and b!233893 (not c!38931)) b!233891))

(assert (= (and b!233892 res!114754) b!233882))

(assert (= (or b!233892 b!233891) bm!21736))

(declare-fun b_lambda!7881 () Bool)

(assert (=> (not b_lambda!7881) (not b!233880)))

(declare-fun t!8400 () Bool)

(declare-fun tb!2915 () Bool)

(assert (=> (and b!233743 (= (defaultEntry!4347 thiss!1504) (defaultEntry!4347 thiss!1504)) t!8400) tb!2915))

(declare-fun result!5083 () Bool)

(assert (=> tb!2915 (= result!5083 tp_is_empty!6157)))

(assert (=> b!233880 t!8400))

(declare-fun b_and!13221 () Bool)

(assert (= b_and!13215 (and (=> t!8400 result!5083) b_and!13221)))

(declare-fun m!255331 () Bool)

(assert (=> b!233885 m!255331))

(declare-fun m!255333 () Bool)

(assert (=> bm!21732 m!255333))

(declare-fun m!255335 () Bool)

(assert (=> b!233882 m!255335))

(declare-fun m!255337 () Bool)

(assert (=> b!233883 m!255337))

(assert (=> b!233883 m!255337))

(declare-fun m!255339 () Bool)

(assert (=> b!233883 m!255339))

(assert (=> b!233894 m!255337))

(assert (=> b!233894 m!255337))

(declare-fun m!255341 () Bool)

(assert (=> b!233894 m!255341))

(assert (=> b!233888 m!255333))

(assert (=> b!233888 m!255337))

(declare-fun m!255343 () Bool)

(assert (=> b!233888 m!255343))

(declare-fun m!255345 () Bool)

(assert (=> b!233888 m!255345))

(declare-fun m!255347 () Bool)

(assert (=> b!233888 m!255347))

(declare-fun m!255349 () Bool)

(assert (=> b!233888 m!255349))

(declare-fun m!255351 () Bool)

(assert (=> b!233888 m!255351))

(declare-fun m!255353 () Bool)

(assert (=> b!233888 m!255353))

(assert (=> b!233888 m!255345))

(declare-fun m!255355 () Bool)

(assert (=> b!233888 m!255355))

(declare-fun m!255357 () Bool)

(assert (=> b!233888 m!255357))

(declare-fun m!255359 () Bool)

(assert (=> b!233888 m!255359))

(declare-fun m!255361 () Bool)

(assert (=> b!233888 m!255361))

(declare-fun m!255363 () Bool)

(assert (=> b!233888 m!255363))

(assert (=> b!233888 m!255363))

(declare-fun m!255365 () Bool)

(assert (=> b!233888 m!255365))

(assert (=> b!233888 m!255349))

(declare-fun m!255367 () Bool)

(assert (=> b!233888 m!255367))

(assert (=> b!233888 m!255359))

(declare-fun m!255369 () Bool)

(assert (=> b!233888 m!255369))

(declare-fun m!255371 () Bool)

(assert (=> b!233888 m!255371))

(declare-fun m!255373 () Bool)

(assert (=> bm!21736 m!255373))

(declare-fun m!255375 () Bool)

(assert (=> bm!21735 m!255375))

(declare-fun m!255377 () Bool)

(assert (=> bm!21737 m!255377))

(assert (=> b!233895 m!255337))

(assert (=> b!233895 m!255337))

(assert (=> b!233895 m!255341))

(assert (=> d!59053 m!255267))

(declare-fun m!255379 () Bool)

(assert (=> b!233878 m!255379))

(assert (=> b!233880 m!255337))

(assert (=> b!233880 m!255337))

(declare-fun m!255381 () Bool)

(assert (=> b!233880 m!255381))

(declare-fun m!255383 () Bool)

(assert (=> b!233880 m!255383))

(declare-fun m!255385 () Bool)

(assert (=> b!233880 m!255385))

(declare-fun m!255387 () Bool)

(assert (=> b!233880 m!255387))

(assert (=> b!233880 m!255383))

(assert (=> b!233880 m!255385))

(assert (=> b!233750 d!59053))

(declare-fun d!59055 () Bool)

(declare-fun res!114763 () Bool)

(declare-fun e!151930 () Bool)

(assert (=> d!59055 (=> (not res!114763) (not e!151930))))

(declare-fun simpleValid!228 (LongMapFixedSize!3370) Bool)

(assert (=> d!59055 (= res!114763 (simpleValid!228 thiss!1504))))

(assert (=> d!59055 (= (valid!1346 thiss!1504) e!151930)))

(declare-fun b!233904 () Bool)

(declare-fun res!114764 () Bool)

(assert (=> b!233904 (=> (not res!114764) (not e!151930))))

(declare-fun arrayCountValidKeys!0 (array!11561 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233904 (= res!114764 (= (arrayCountValidKeys!0 (_keys!6406 thiss!1504) #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))) (_size!1734 thiss!1504)))))

(declare-fun b!233905 () Bool)

(declare-fun res!114765 () Bool)

(assert (=> b!233905 (=> (not res!114765) (not e!151930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11561 (_ BitVec 32)) Bool)

(assert (=> b!233905 (= res!114765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)))))

(declare-fun b!233906 () Bool)

(declare-datatypes ((List!3444 0))(
  ( (Nil!3441) (Cons!3440 (h!4089 (_ BitVec 64)) (t!8401 List!3444)) )
))
(declare-fun arrayNoDuplicates!0 (array!11561 (_ BitVec 32) List!3444) Bool)

(assert (=> b!233906 (= e!151930 (arrayNoDuplicates!0 (_keys!6406 thiss!1504) #b00000000000000000000000000000000 Nil!3441))))

(assert (= (and d!59055 res!114763) b!233904))

(assert (= (and b!233904 res!114764) b!233905))

(assert (= (and b!233905 res!114765) b!233906))

(declare-fun m!255389 () Bool)

(assert (=> d!59055 m!255389))

(declare-fun m!255391 () Bool)

(assert (=> b!233904 m!255391))

(declare-fun m!255393 () Bool)

(assert (=> b!233905 m!255393))

(declare-fun m!255395 () Bool)

(assert (=> b!233906 m!255395))

(assert (=> start!22296 d!59055))

(declare-fun mapNonEmpty!10421 () Bool)

(declare-fun mapRes!10421 () Bool)

(declare-fun tp!22049 () Bool)

(declare-fun e!151935 () Bool)

(assert (=> mapNonEmpty!10421 (= mapRes!10421 (and tp!22049 e!151935))))

(declare-fun mapKey!10421 () (_ BitVec 32))

(declare-fun mapRest!10421 () (Array (_ BitVec 32) ValueCell!2735))

(declare-fun mapValue!10421 () ValueCell!2735)

(assert (=> mapNonEmpty!10421 (= mapRest!10412 (store mapRest!10421 mapKey!10421 mapValue!10421))))

(declare-fun b!233913 () Bool)

(assert (=> b!233913 (= e!151935 tp_is_empty!6157)))

(declare-fun mapIsEmpty!10421 () Bool)

(assert (=> mapIsEmpty!10421 mapRes!10421))

(declare-fun condMapEmpty!10421 () Bool)

(declare-fun mapDefault!10421 () ValueCell!2735)

(assert (=> mapNonEmpty!10412 (= condMapEmpty!10421 (= mapRest!10412 ((as const (Array (_ BitVec 32) ValueCell!2735)) mapDefault!10421)))))

(declare-fun e!151936 () Bool)

(assert (=> mapNonEmpty!10412 (= tp!22034 (and e!151936 mapRes!10421))))

(declare-fun b!233914 () Bool)

(assert (=> b!233914 (= e!151936 tp_is_empty!6157)))

(assert (= (and mapNonEmpty!10412 condMapEmpty!10421) mapIsEmpty!10421))

(assert (= (and mapNonEmpty!10412 (not condMapEmpty!10421)) mapNonEmpty!10421))

(assert (= (and mapNonEmpty!10421 ((_ is ValueCellFull!2735) mapValue!10421)) b!233913))

(assert (= (and mapNonEmpty!10412 ((_ is ValueCellFull!2735) mapDefault!10421)) b!233914))

(declare-fun m!255397 () Bool)

(assert (=> mapNonEmpty!10421 m!255397))

(declare-fun b_lambda!7883 () Bool)

(assert (= b_lambda!7881 (or (and b!233743 b_free!6295) b_lambda!7883)))

(check-sat (not bm!21732) (not b_lambda!7883) (not d!59047) (not mapNonEmpty!10421) (not b!233819) (not b!233894) (not b!233906) (not b!233885) (not b!233830) (not b!233905) (not b!233904) (not b_next!6295) (not b!233882) (not b!233895) b_and!13221 (not b!233832) (not bm!21737) (not b!233883) (not bm!21736) (not b!233878) (not b!233880) (not bm!21735) (not d!59053) tp_is_empty!6157 (not b!233888) (not d!59051) (not d!59055))
(check-sat b_and!13221 (not b_next!6295))
(get-model)

(declare-fun d!59057 () Bool)

(declare-fun e!151939 () Bool)

(assert (=> d!59057 e!151939))

(declare-fun res!114771 () Bool)

(assert (=> d!59057 (=> (not res!114771) (not e!151939))))

(declare-fun lt!118371 () ListLongMap!3453)

(assert (=> d!59057 (= res!114771 (contains!1626 lt!118371 (_1!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun lt!118372 () List!3442)

(assert (=> d!59057 (= lt!118371 (ListLongMap!3454 lt!118372))))

(declare-fun lt!118374 () Unit!7211)

(declare-fun lt!118373 () Unit!7211)

(assert (=> d!59057 (= lt!118374 lt!118373)))

(assert (=> d!59057 (= (getValueByKey!264 lt!118372 (_1!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))) (Some!269 (_2!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!149 (List!3442 (_ BitVec 64) V!7857) Unit!7211)

(assert (=> d!59057 (= lt!118373 (lemmaContainsTupThenGetReturnValue!149 lt!118372 (_1!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (_2!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun insertStrictlySorted!152 (List!3442 (_ BitVec 64) V!7857) List!3442)

(assert (=> d!59057 (= lt!118372 (insertStrictlySorted!152 (toList!1742 (ite c!38929 call!21737 (ite c!38933 call!21739 call!21736))) (_1!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (_2!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(assert (=> d!59057 (= (+!632 (ite c!38929 call!21737 (ite c!38933 call!21739 call!21736)) (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) lt!118371)))

(declare-fun b!233919 () Bool)

(declare-fun res!114770 () Bool)

(assert (=> b!233919 (=> (not res!114770) (not e!151939))))

(assert (=> b!233919 (= res!114770 (= (getValueByKey!264 (toList!1742 lt!118371) (_1!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))) (Some!269 (_2!2280 (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))))

(declare-fun b!233920 () Bool)

(declare-fun contains!1628 (List!3442 tuple2!4538) Bool)

(assert (=> b!233920 (= e!151939 (contains!1628 (toList!1742 lt!118371) (ite (or c!38929 c!38933) (tuple2!4539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4188 thiss!1504)) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (= (and d!59057 res!114771) b!233919))

(assert (= (and b!233919 res!114770) b!233920))

(declare-fun m!255399 () Bool)

(assert (=> d!59057 m!255399))

(declare-fun m!255401 () Bool)

(assert (=> d!59057 m!255401))

(declare-fun m!255403 () Bool)

(assert (=> d!59057 m!255403))

(declare-fun m!255405 () Bool)

(assert (=> d!59057 m!255405))

(declare-fun m!255407 () Bool)

(assert (=> b!233919 m!255407))

(declare-fun m!255409 () Bool)

(assert (=> b!233920 m!255409))

(assert (=> bm!21735 d!59057))

(declare-fun d!59059 () Bool)

(declare-fun e!151940 () Bool)

(assert (=> d!59059 e!151940))

(declare-fun res!114772 () Bool)

(assert (=> d!59059 (=> res!114772 e!151940)))

(declare-fun lt!118376 () Bool)

(assert (=> d!59059 (= res!114772 (not lt!118376))))

(declare-fun lt!118377 () Bool)

(assert (=> d!59059 (= lt!118376 lt!118377)))

(declare-fun lt!118378 () Unit!7211)

(declare-fun e!151941 () Unit!7211)

(assert (=> d!59059 (= lt!118378 e!151941)))

(declare-fun c!38934 () Bool)

(assert (=> d!59059 (= c!38934 lt!118377)))

(assert (=> d!59059 (= lt!118377 (containsKey!255 (toList!1742 lt!118359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59059 (= (contains!1626 lt!118359 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118376)))

(declare-fun b!233921 () Bool)

(declare-fun lt!118375 () Unit!7211)

(assert (=> b!233921 (= e!151941 lt!118375)))

(assert (=> b!233921 (= lt!118375 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1742 lt!118359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!233921 (isDefined!204 (getValueByKey!264 (toList!1742 lt!118359) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!233922 () Bool)

(declare-fun Unit!7215 () Unit!7211)

(assert (=> b!233922 (= e!151941 Unit!7215)))

(declare-fun b!233923 () Bool)

(assert (=> b!233923 (= e!151940 (isDefined!204 (getValueByKey!264 (toList!1742 lt!118359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59059 c!38934) b!233921))

(assert (= (and d!59059 (not c!38934)) b!233922))

(assert (= (and d!59059 (not res!114772)) b!233923))

(declare-fun m!255411 () Bool)

(assert (=> d!59059 m!255411))

(declare-fun m!255413 () Bool)

(assert (=> b!233921 m!255413))

(declare-fun m!255415 () Bool)

(assert (=> b!233921 m!255415))

(assert (=> b!233921 m!255415))

(declare-fun m!255417 () Bool)

(assert (=> b!233921 m!255417))

(assert (=> b!233923 m!255415))

(assert (=> b!233923 m!255415))

(assert (=> b!233923 m!255417))

(assert (=> bm!21736 d!59059))

(declare-fun b!233936 () Bool)

(declare-fun c!38941 () Bool)

(declare-fun lt!118384 () (_ BitVec 64))

(assert (=> b!233936 (= c!38941 (= lt!118384 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!151949 () SeekEntryResult!947)

(declare-fun e!151950 () SeekEntryResult!947)

(assert (=> b!233936 (= e!151949 e!151950)))

(declare-fun b!233937 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!233937 (= e!151950 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23619 lt!118284) #b00000000000000000000000000000001) (nextIndex!0 (index!5960 lt!118284) (bvadd (x!23619 lt!118284) #b00000000000000000000000000000001) (mask!10281 thiss!1504)) (index!5960 lt!118284) key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)))))

(declare-fun b!233938 () Bool)

(declare-fun e!151948 () SeekEntryResult!947)

(assert (=> b!233938 (= e!151948 Undefined!947)))

(declare-fun b!233940 () Bool)

(assert (=> b!233940 (= e!151949 (Found!947 (index!5960 lt!118284)))))

(declare-fun b!233941 () Bool)

(assert (=> b!233941 (= e!151948 e!151949)))

(declare-fun c!38942 () Bool)

(assert (=> b!233941 (= c!38942 (= lt!118384 key!932))))

(declare-fun b!233939 () Bool)

(assert (=> b!233939 (= e!151950 (MissingVacant!947 (index!5960 lt!118284)))))

(declare-fun lt!118383 () SeekEntryResult!947)

(declare-fun d!59061 () Bool)

(assert (=> d!59061 (and (or ((_ is Undefined!947) lt!118383) (not ((_ is Found!947) lt!118383)) (and (bvsge (index!5959 lt!118383) #b00000000000000000000000000000000) (bvslt (index!5959 lt!118383) (size!5832 (_keys!6406 thiss!1504))))) (or ((_ is Undefined!947) lt!118383) ((_ is Found!947) lt!118383) (not ((_ is MissingVacant!947) lt!118383)) (not (= (index!5961 lt!118383) (index!5960 lt!118284))) (and (bvsge (index!5961 lt!118383) #b00000000000000000000000000000000) (bvslt (index!5961 lt!118383) (size!5832 (_keys!6406 thiss!1504))))) (or ((_ is Undefined!947) lt!118383) (ite ((_ is Found!947) lt!118383) (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5959 lt!118383)) key!932) (and ((_ is MissingVacant!947) lt!118383) (= (index!5961 lt!118383) (index!5960 lt!118284)) (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5961 lt!118383)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59061 (= lt!118383 e!151948)))

(declare-fun c!38943 () Bool)

(assert (=> d!59061 (= c!38943 (bvsge (x!23619 lt!118284) #b01111111111111111111111111111110))))

(assert (=> d!59061 (= lt!118384 (select (arr!5498 (_keys!6406 thiss!1504)) (index!5960 lt!118284)))))

(assert (=> d!59061 (validMask!0 (mask!10281 thiss!1504))))

(assert (=> d!59061 (= (seekKeyOrZeroReturnVacant!0 (x!23619 lt!118284) (index!5960 lt!118284) (index!5960 lt!118284) key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)) lt!118383)))

(assert (= (and d!59061 c!38943) b!233938))

(assert (= (and d!59061 (not c!38943)) b!233941))

(assert (= (and b!233941 c!38942) b!233940))

(assert (= (and b!233941 (not c!38942)) b!233936))

(assert (= (and b!233936 c!38941) b!233939))

(assert (= (and b!233936 (not c!38941)) b!233937))

(declare-fun m!255419 () Bool)

(assert (=> b!233937 m!255419))

(assert (=> b!233937 m!255419))

(declare-fun m!255421 () Bool)

(assert (=> b!233937 m!255421))

(declare-fun m!255423 () Bool)

(assert (=> d!59061 m!255423))

(declare-fun m!255425 () Bool)

(assert (=> d!59061 m!255425))

(assert (=> d!59061 m!255321))

(assert (=> d!59061 m!255267))

(assert (=> b!233819 d!59061))

(declare-fun b!233952 () Bool)

(declare-fun e!151961 () Bool)

(declare-fun call!21744 () Bool)

(assert (=> b!233952 (= e!151961 call!21744)))

(declare-fun b!233953 () Bool)

(declare-fun e!151959 () Bool)

(declare-fun contains!1629 (List!3444 (_ BitVec 64)) Bool)

(assert (=> b!233953 (= e!151959 (contains!1629 Nil!3441 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233954 () Bool)

(declare-fun e!151960 () Bool)

(declare-fun e!151962 () Bool)

(assert (=> b!233954 (= e!151960 e!151962)))

(declare-fun res!114780 () Bool)

(assert (=> b!233954 (=> (not res!114780) (not e!151962))))

(assert (=> b!233954 (= res!114780 (not e!151959))))

(declare-fun res!114779 () Bool)

(assert (=> b!233954 (=> (not res!114779) (not e!151959))))

(assert (=> b!233954 (= res!114779 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59063 () Bool)

(declare-fun res!114781 () Bool)

(assert (=> d!59063 (=> res!114781 e!151960)))

(assert (=> d!59063 (= res!114781 (bvsge #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> d!59063 (= (arrayNoDuplicates!0 (_keys!6406 thiss!1504) #b00000000000000000000000000000000 Nil!3441) e!151960)))

(declare-fun b!233955 () Bool)

(assert (=> b!233955 (= e!151961 call!21744)))

(declare-fun b!233956 () Bool)

(assert (=> b!233956 (= e!151962 e!151961)))

(declare-fun c!38946 () Bool)

(assert (=> b!233956 (= c!38946 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21741 () Bool)

(assert (=> bm!21741 (= call!21744 (arrayNoDuplicates!0 (_keys!6406 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!38946 (Cons!3440 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000) Nil!3441) Nil!3441)))))

(assert (= (and d!59063 (not res!114781)) b!233954))

(assert (= (and b!233954 res!114779) b!233953))

(assert (= (and b!233954 res!114780) b!233956))

(assert (= (and b!233956 c!38946) b!233955))

(assert (= (and b!233956 (not c!38946)) b!233952))

(assert (= (or b!233955 b!233952) bm!21741))

(assert (=> b!233953 m!255337))

(assert (=> b!233953 m!255337))

(declare-fun m!255427 () Bool)

(assert (=> b!233953 m!255427))

(assert (=> b!233954 m!255337))

(assert (=> b!233954 m!255337))

(assert (=> b!233954 m!255341))

(assert (=> b!233956 m!255337))

(assert (=> b!233956 m!255337))

(assert (=> b!233956 m!255341))

(assert (=> bm!21741 m!255337))

(declare-fun m!255429 () Bool)

(assert (=> bm!21741 m!255429))

(assert (=> b!233906 d!59063))

(declare-fun d!59065 () Bool)

(declare-fun get!2826 (Option!270) V!7857)

(assert (=> d!59065 (= (apply!205 lt!118359 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)) (get!2826 (getValueByKey!264 (toList!1742 lt!118359) (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8683 () Bool)

(assert (= bs!8683 d!59065))

(assert (=> bs!8683 m!255337))

(declare-fun m!255431 () Bool)

(assert (=> bs!8683 m!255431))

(assert (=> bs!8683 m!255431))

(declare-fun m!255433 () Bool)

(assert (=> bs!8683 m!255433))

(assert (=> b!233880 d!59065))

(declare-fun d!59067 () Bool)

(declare-fun c!38949 () Bool)

(assert (=> d!59067 (= c!38949 ((_ is ValueCellFull!2735) (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!151965 () V!7857)

(assert (=> d!59067 (= (get!2825 (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!151965)))

(declare-fun b!233961 () Bool)

(declare-fun get!2827 (ValueCell!2735 V!7857) V!7857)

(assert (=> b!233961 (= e!151965 (get!2827 (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!233962 () Bool)

(declare-fun get!2828 (ValueCell!2735 V!7857) V!7857)

(assert (=> b!233962 (= e!151965 (get!2828 (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59067 c!38949) b!233961))

(assert (= (and d!59067 (not c!38949)) b!233962))

(assert (=> b!233961 m!255383))

(assert (=> b!233961 m!255385))

(declare-fun m!255435 () Bool)

(assert (=> b!233961 m!255435))

(assert (=> b!233962 m!255383))

(assert (=> b!233962 m!255385))

(declare-fun m!255437 () Bool)

(assert (=> b!233962 m!255437))

(assert (=> b!233880 d!59067))

(declare-fun d!59069 () Bool)

(declare-fun isEmpty!512 (Option!270) Bool)

(assert (=> d!59069 (= (isDefined!204 (getValueByKey!264 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932)) (not (isEmpty!512 (getValueByKey!264 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))))

(declare-fun bs!8684 () Bool)

(assert (= bs!8684 d!59069))

(assert (=> bs!8684 m!255327))

(declare-fun m!255439 () Bool)

(assert (=> bs!8684 m!255439))

(assert (=> b!233832 d!59069))

(declare-fun b!233973 () Bool)

(declare-fun e!151971 () Option!270)

(assert (=> b!233973 (= e!151971 (getValueByKey!264 (t!8397 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) key!932))))

(declare-fun b!233972 () Bool)

(declare-fun e!151970 () Option!270)

(assert (=> b!233972 (= e!151970 e!151971)))

(declare-fun c!38955 () Bool)

(assert (=> b!233972 (= c!38955 (and ((_ is Cons!3438) (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (not (= (_1!2280 (h!4087 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932))))))

(declare-fun b!233971 () Bool)

(assert (=> b!233971 (= e!151970 (Some!269 (_2!2280 (h!4087 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))))))

(declare-fun b!233974 () Bool)

(assert (=> b!233974 (= e!151971 None!268)))

(declare-fun d!59071 () Bool)

(declare-fun c!38954 () Bool)

(assert (=> d!59071 (= c!38954 (and ((_ is Cons!3438) (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (= (_1!2280 (h!4087 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)))))

(assert (=> d!59071 (= (getValueByKey!264 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932) e!151970)))

(assert (= (and d!59071 c!38954) b!233971))

(assert (= (and d!59071 (not c!38954)) b!233972))

(assert (= (and b!233972 c!38955) b!233973))

(assert (= (and b!233972 (not c!38955)) b!233974))

(declare-fun m!255441 () Bool)

(assert (=> b!233973 m!255441))

(assert (=> b!233832 d!59071))

(declare-fun b!233983 () Bool)

(declare-fun e!151976 () (_ BitVec 32))

(declare-fun e!151977 () (_ BitVec 32))

(assert (=> b!233983 (= e!151976 e!151977)))

(declare-fun c!38961 () Bool)

(assert (=> b!233983 (= c!38961 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233984 () Bool)

(declare-fun call!21747 () (_ BitVec 32))

(assert (=> b!233984 (= e!151977 call!21747)))

(declare-fun b!233985 () Bool)

(assert (=> b!233985 (= e!151977 (bvadd #b00000000000000000000000000000001 call!21747))))

(declare-fun b!233986 () Bool)

(assert (=> b!233986 (= e!151976 #b00000000000000000000000000000000)))

(declare-fun bm!21744 () Bool)

(assert (=> bm!21744 (= call!21747 (arrayCountValidKeys!0 (_keys!6406 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun d!59073 () Bool)

(declare-fun lt!118387 () (_ BitVec 32))

(assert (=> d!59073 (and (bvsge lt!118387 #b00000000000000000000000000000000) (bvsle lt!118387 (bvsub (size!5832 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59073 (= lt!118387 e!151976)))

(declare-fun c!38960 () Bool)

(assert (=> d!59073 (= c!38960 (bvsge #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> d!59073 (and (bvsle #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5832 (_keys!6406 thiss!1504)) (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> d!59073 (= (arrayCountValidKeys!0 (_keys!6406 thiss!1504) #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))) lt!118387)))

(assert (= (and d!59073 c!38960) b!233986))

(assert (= (and d!59073 (not c!38960)) b!233983))

(assert (= (and b!233983 c!38961) b!233985))

(assert (= (and b!233983 (not c!38961)) b!233984))

(assert (= (or b!233985 b!233984) bm!21744))

(assert (=> b!233983 m!255337))

(assert (=> b!233983 m!255337))

(assert (=> b!233983 m!255341))

(declare-fun m!255443 () Bool)

(assert (=> bm!21744 m!255443))

(assert (=> b!233904 d!59073))

(declare-fun d!59075 () Bool)

(declare-fun res!114786 () Bool)

(declare-fun e!151986 () Bool)

(assert (=> d!59075 (=> res!114786 e!151986)))

(assert (=> d!59075 (= res!114786 (bvsge #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> d!59075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)) e!151986)))

(declare-fun b!233995 () Bool)

(declare-fun e!151984 () Bool)

(assert (=> b!233995 (= e!151986 e!151984)))

(declare-fun c!38964 () Bool)

(assert (=> b!233995 (= c!38964 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!233996 () Bool)

(declare-fun e!151985 () Bool)

(assert (=> b!233996 (= e!151984 e!151985)))

(declare-fun lt!118394 () (_ BitVec 64))

(assert (=> b!233996 (= lt!118394 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118395 () Unit!7211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11561 (_ BitVec 64) (_ BitVec 32)) Unit!7211)

(assert (=> b!233996 (= lt!118395 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6406 thiss!1504) lt!118394 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233996 (arrayContainsKey!0 (_keys!6406 thiss!1504) lt!118394 #b00000000000000000000000000000000)))

(declare-fun lt!118396 () Unit!7211)

(assert (=> b!233996 (= lt!118396 lt!118395)))

(declare-fun res!114787 () Bool)

(assert (=> b!233996 (= res!114787 (= (seekEntryOrOpen!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000) (_keys!6406 thiss!1504) (mask!10281 thiss!1504)) (Found!947 #b00000000000000000000000000000000)))))

(assert (=> b!233996 (=> (not res!114787) (not e!151985))))

(declare-fun b!233997 () Bool)

(declare-fun call!21750 () Bool)

(assert (=> b!233997 (= e!151984 call!21750)))

(declare-fun bm!21747 () Bool)

(assert (=> bm!21747 (= call!21750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6406 thiss!1504) (mask!10281 thiss!1504)))))

(declare-fun b!233998 () Bool)

(assert (=> b!233998 (= e!151985 call!21750)))

(assert (= (and d!59075 (not res!114786)) b!233995))

(assert (= (and b!233995 c!38964) b!233996))

(assert (= (and b!233995 (not c!38964)) b!233997))

(assert (= (and b!233996 res!114787) b!233998))

(assert (= (or b!233998 b!233997) bm!21747))

(assert (=> b!233995 m!255337))

(assert (=> b!233995 m!255337))

(assert (=> b!233995 m!255341))

(assert (=> b!233996 m!255337))

(declare-fun m!255445 () Bool)

(assert (=> b!233996 m!255445))

(declare-fun m!255447 () Bool)

(assert (=> b!233996 m!255447))

(assert (=> b!233996 m!255337))

(declare-fun m!255449 () Bool)

(assert (=> b!233996 m!255449))

(declare-fun m!255451 () Bool)

(assert (=> bm!21747 m!255451))

(assert (=> b!233905 d!59075))

(declare-fun d!59077 () Bool)

(assert (=> d!59077 (= (apply!205 (+!632 lt!118347 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))) lt!118350) (get!2826 (getValueByKey!264 (toList!1742 (+!632 lt!118347 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504)))) lt!118350)))))

(declare-fun bs!8685 () Bool)

(assert (= bs!8685 d!59077))

(declare-fun m!255453 () Bool)

(assert (=> bs!8685 m!255453))

(assert (=> bs!8685 m!255453))

(declare-fun m!255455 () Bool)

(assert (=> bs!8685 m!255455))

(assert (=> b!233888 d!59077))

(declare-fun d!59079 () Bool)

(declare-fun e!151987 () Bool)

(assert (=> d!59079 e!151987))

(declare-fun res!114789 () Bool)

(assert (=> d!59079 (=> (not res!114789) (not e!151987))))

(declare-fun lt!118397 () ListLongMap!3453)

(assert (=> d!59079 (= res!114789 (contains!1626 lt!118397 (_1!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504)))))))

(declare-fun lt!118398 () List!3442)

(assert (=> d!59079 (= lt!118397 (ListLongMap!3454 lt!118398))))

(declare-fun lt!118400 () Unit!7211)

(declare-fun lt!118399 () Unit!7211)

(assert (=> d!59079 (= lt!118400 lt!118399)))

(assert (=> d!59079 (= (getValueByKey!264 lt!118398 (_1!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504)))))))

(assert (=> d!59079 (= lt!118399 (lemmaContainsTupThenGetReturnValue!149 lt!118398 (_1!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504)))))))

(assert (=> d!59079 (= lt!118398 (insertStrictlySorted!152 (toList!1742 lt!118352) (_1!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504)))))))

(assert (=> d!59079 (= (+!632 lt!118352 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))) lt!118397)))

(declare-fun b!233999 () Bool)

(declare-fun res!114788 () Bool)

(assert (=> b!233999 (=> (not res!114788) (not e!151987))))

(assert (=> b!233999 (= res!114788 (= (getValueByKey!264 (toList!1742 lt!118397) (_1!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))))))))

(declare-fun b!234000 () Bool)

(assert (=> b!234000 (= e!151987 (contains!1628 (toList!1742 lt!118397) (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))))))

(assert (= (and d!59079 res!114789) b!233999))

(assert (= (and b!233999 res!114788) b!234000))

(declare-fun m!255457 () Bool)

(assert (=> d!59079 m!255457))

(declare-fun m!255459 () Bool)

(assert (=> d!59079 m!255459))

(declare-fun m!255461 () Bool)

(assert (=> d!59079 m!255461))

(declare-fun m!255463 () Bool)

(assert (=> d!59079 m!255463))

(declare-fun m!255465 () Bool)

(assert (=> b!233999 m!255465))

(declare-fun m!255467 () Bool)

(assert (=> b!234000 m!255467))

(assert (=> b!233888 d!59079))

(declare-fun d!59081 () Bool)

(declare-fun e!151988 () Bool)

(assert (=> d!59081 e!151988))

(declare-fun res!114790 () Bool)

(assert (=> d!59081 (=> res!114790 e!151988)))

(declare-fun lt!118402 () Bool)

(assert (=> d!59081 (= res!114790 (not lt!118402))))

(declare-fun lt!118403 () Bool)

(assert (=> d!59081 (= lt!118402 lt!118403)))

(declare-fun lt!118404 () Unit!7211)

(declare-fun e!151989 () Unit!7211)

(assert (=> d!59081 (= lt!118404 e!151989)))

(declare-fun c!38965 () Bool)

(assert (=> d!59081 (= c!38965 lt!118403)))

(assert (=> d!59081 (= lt!118403 (containsKey!255 (toList!1742 (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))) lt!118345))))

(assert (=> d!59081 (= (contains!1626 (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))) lt!118345) lt!118402)))

(declare-fun b!234001 () Bool)

(declare-fun lt!118401 () Unit!7211)

(assert (=> b!234001 (= e!151989 lt!118401)))

(assert (=> b!234001 (= lt!118401 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1742 (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))) lt!118345))))

(assert (=> b!234001 (isDefined!204 (getValueByKey!264 (toList!1742 (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))) lt!118345))))

(declare-fun b!234002 () Bool)

(declare-fun Unit!7216 () Unit!7211)

(assert (=> b!234002 (= e!151989 Unit!7216)))

(declare-fun b!234003 () Bool)

(assert (=> b!234003 (= e!151988 (isDefined!204 (getValueByKey!264 (toList!1742 (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))) lt!118345)))))

(assert (= (and d!59081 c!38965) b!234001))

(assert (= (and d!59081 (not c!38965)) b!234002))

(assert (= (and d!59081 (not res!114790)) b!234003))

(declare-fun m!255469 () Bool)

(assert (=> d!59081 m!255469))

(declare-fun m!255471 () Bool)

(assert (=> b!234001 m!255471))

(declare-fun m!255473 () Bool)

(assert (=> b!234001 m!255473))

(assert (=> b!234001 m!255473))

(declare-fun m!255475 () Bool)

(assert (=> b!234001 m!255475))

(assert (=> b!234003 m!255473))

(assert (=> b!234003 m!255473))

(assert (=> b!234003 m!255475))

(assert (=> b!233888 d!59081))

(declare-fun d!59083 () Bool)

(assert (=> d!59083 (= (apply!205 (+!632 lt!118352 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))) lt!118358) (apply!205 lt!118352 lt!118358))))

(declare-fun lt!118407 () Unit!7211)

(declare-fun choose!1102 (ListLongMap!3453 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7211)

(assert (=> d!59083 (= lt!118407 (choose!1102 lt!118352 lt!118362 (minValue!4188 thiss!1504) lt!118358))))

(declare-fun e!151992 () Bool)

(assert (=> d!59083 e!151992))

(declare-fun res!114793 () Bool)

(assert (=> d!59083 (=> (not res!114793) (not e!151992))))

(assert (=> d!59083 (= res!114793 (contains!1626 lt!118352 lt!118358))))

(assert (=> d!59083 (= (addApplyDifferent!181 lt!118352 lt!118362 (minValue!4188 thiss!1504) lt!118358) lt!118407)))

(declare-fun b!234007 () Bool)

(assert (=> b!234007 (= e!151992 (not (= lt!118358 lt!118362)))))

(assert (= (and d!59083 res!114793) b!234007))

(declare-fun m!255477 () Bool)

(assert (=> d!59083 m!255477))

(declare-fun m!255479 () Bool)

(assert (=> d!59083 m!255479))

(assert (=> d!59083 m!255361))

(assert (=> d!59083 m!255345))

(assert (=> d!59083 m!255347))

(assert (=> d!59083 m!255345))

(assert (=> b!233888 d!59083))

(declare-fun d!59085 () Bool)

(declare-fun e!151993 () Bool)

(assert (=> d!59085 e!151993))

(declare-fun res!114795 () Bool)

(assert (=> d!59085 (=> (not res!114795) (not e!151993))))

(declare-fun lt!118408 () ListLongMap!3453)

(assert (=> d!59085 (= res!114795 (contains!1626 lt!118408 (_1!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))))))

(declare-fun lt!118409 () List!3442)

(assert (=> d!59085 (= lt!118408 (ListLongMap!3454 lt!118409))))

(declare-fun lt!118411 () Unit!7211)

(declare-fun lt!118410 () Unit!7211)

(assert (=> d!59085 (= lt!118411 lt!118410)))

(assert (=> d!59085 (= (getValueByKey!264 lt!118409 (_1!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!59085 (= lt!118410 (lemmaContainsTupThenGetReturnValue!149 lt!118409 (_1!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!59085 (= lt!118409 (insertStrictlySorted!152 (toList!1742 lt!118341) (_1!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!59085 (= (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))) lt!118408)))

(declare-fun b!234008 () Bool)

(declare-fun res!114794 () Bool)

(assert (=> b!234008 (=> (not res!114794) (not e!151993))))

(assert (=> b!234008 (= res!114794 (= (getValueByKey!264 (toList!1742 lt!118408) (_1!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))))))))

(declare-fun b!234009 () Bool)

(assert (=> b!234009 (= e!151993 (contains!1628 (toList!1742 lt!118408) (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))))))

(assert (= (and d!59085 res!114795) b!234008))

(assert (= (and b!234008 res!114794) b!234009))

(declare-fun m!255481 () Bool)

(assert (=> d!59085 m!255481))

(declare-fun m!255483 () Bool)

(assert (=> d!59085 m!255483))

(declare-fun m!255485 () Bool)

(assert (=> d!59085 m!255485))

(declare-fun m!255487 () Bool)

(assert (=> d!59085 m!255487))

(declare-fun m!255489 () Bool)

(assert (=> b!234008 m!255489))

(declare-fun m!255491 () Bool)

(assert (=> b!234009 m!255491))

(assert (=> b!233888 d!59085))

(declare-fun d!59087 () Bool)

(assert (=> d!59087 (= (apply!205 (+!632 lt!118347 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))) lt!118350) (apply!205 lt!118347 lt!118350))))

(declare-fun lt!118412 () Unit!7211)

(assert (=> d!59087 (= lt!118412 (choose!1102 lt!118347 lt!118351 (minValue!4188 thiss!1504) lt!118350))))

(declare-fun e!151994 () Bool)

(assert (=> d!59087 e!151994))

(declare-fun res!114796 () Bool)

(assert (=> d!59087 (=> (not res!114796) (not e!151994))))

(assert (=> d!59087 (= res!114796 (contains!1626 lt!118347 lt!118350))))

(assert (=> d!59087 (= (addApplyDifferent!181 lt!118347 lt!118351 (minValue!4188 thiss!1504) lt!118350) lt!118412)))

(declare-fun b!234010 () Bool)

(assert (=> b!234010 (= e!151994 (not (= lt!118350 lt!118351)))))

(assert (= (and d!59087 res!114796) b!234010))

(declare-fun m!255493 () Bool)

(assert (=> d!59087 m!255493))

(declare-fun m!255495 () Bool)

(assert (=> d!59087 m!255495))

(assert (=> d!59087 m!255367))

(assert (=> d!59087 m!255359))

(assert (=> d!59087 m!255369))

(assert (=> d!59087 m!255359))

(assert (=> b!233888 d!59087))

(declare-fun b!234035 () Bool)

(declare-fun res!114807 () Bool)

(declare-fun e!152013 () Bool)

(assert (=> b!234035 (=> (not res!114807) (not e!152013))))

(declare-fun lt!118433 () ListLongMap!3453)

(assert (=> b!234035 (= res!114807 (not (contains!1626 lt!118433 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234036 () Bool)

(declare-fun e!152015 () Bool)

(assert (=> b!234036 (= e!152015 (= lt!118433 (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4347 thiss!1504))))))

(declare-fun b!234037 () Bool)

(declare-fun lt!118427 () Unit!7211)

(declare-fun lt!118429 () Unit!7211)

(assert (=> b!234037 (= lt!118427 lt!118429)))

(declare-fun lt!118430 () V!7857)

(declare-fun lt!118428 () (_ BitVec 64))

(declare-fun lt!118431 () (_ BitVec 64))

(declare-fun lt!118432 () ListLongMap!3453)

(assert (=> b!234037 (not (contains!1626 (+!632 lt!118432 (tuple2!4539 lt!118428 lt!118430)) lt!118431))))

(declare-fun addStillNotContains!114 (ListLongMap!3453 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7211)

(assert (=> b!234037 (= lt!118429 (addStillNotContains!114 lt!118432 lt!118428 lt!118430 lt!118431))))

(assert (=> b!234037 (= lt!118431 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234037 (= lt!118430 (get!2825 (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234037 (= lt!118428 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun call!21753 () ListLongMap!3453)

(assert (=> b!234037 (= lt!118432 call!21753)))

(declare-fun e!152009 () ListLongMap!3453)

(assert (=> b!234037 (= e!152009 (+!632 call!21753 (tuple2!4539 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000) (get!2825 (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!234038 () Bool)

(declare-fun isEmpty!513 (ListLongMap!3453) Bool)

(assert (=> b!234038 (= e!152015 (isEmpty!513 lt!118433))))

(declare-fun b!234039 () Bool)

(declare-fun e!152010 () Bool)

(declare-fun e!152011 () Bool)

(assert (=> b!234039 (= e!152010 e!152011)))

(assert (=> b!234039 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun res!114805 () Bool)

(assert (=> b!234039 (= res!114805 (contains!1626 lt!118433 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234039 (=> (not res!114805) (not e!152011))))

(declare-fun d!59089 () Bool)

(assert (=> d!59089 e!152013))

(declare-fun res!114806 () Bool)

(assert (=> d!59089 (=> (not res!114806) (not e!152013))))

(assert (=> d!59089 (= res!114806 (not (contains!1626 lt!118433 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!152012 () ListLongMap!3453)

(assert (=> d!59089 (= lt!118433 e!152012)))

(declare-fun c!38976 () Bool)

(assert (=> d!59089 (= c!38976 (bvsge #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> d!59089 (validMask!0 (mask!10281 thiss!1504))))

(assert (=> d!59089 (= (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)) lt!118433)))

(declare-fun b!234040 () Bool)

(assert (=> b!234040 (= e!152009 call!21753)))

(declare-fun bm!21750 () Bool)

(assert (=> bm!21750 (= call!21753 (getCurrentListMapNoExtraKeys!521 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4347 thiss!1504)))))

(declare-fun b!234041 () Bool)

(assert (=> b!234041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> b!234041 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5831 (_values!4330 thiss!1504))))))

(assert (=> b!234041 (= e!152011 (= (apply!205 lt!118433 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)) (get!2825 (select (arr!5497 (_values!4330 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!548 (defaultEntry!4347 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234042 () Bool)

(assert (=> b!234042 (= e!152013 e!152010)))

(declare-fun c!38974 () Bool)

(declare-fun e!152014 () Bool)

(assert (=> b!234042 (= c!38974 e!152014)))

(declare-fun res!114808 () Bool)

(assert (=> b!234042 (=> (not res!114808) (not e!152014))))

(assert (=> b!234042 (= res!114808 (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun b!234043 () Bool)

(assert (=> b!234043 (= e!152014 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234043 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!234044 () Bool)

(assert (=> b!234044 (= e!152012 (ListLongMap!3454 Nil!3439))))

(declare-fun b!234045 () Bool)

(assert (=> b!234045 (= e!152012 e!152009)))

(declare-fun c!38977 () Bool)

(assert (=> b!234045 (= c!38977 (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234046 () Bool)

(assert (=> b!234046 (= e!152010 e!152015)))

(declare-fun c!38975 () Bool)

(assert (=> b!234046 (= c!38975 (bvslt #b00000000000000000000000000000000 (size!5832 (_keys!6406 thiss!1504))))))

(assert (= (and d!59089 c!38976) b!234044))

(assert (= (and d!59089 (not c!38976)) b!234045))

(assert (= (and b!234045 c!38977) b!234037))

(assert (= (and b!234045 (not c!38977)) b!234040))

(assert (= (or b!234037 b!234040) bm!21750))

(assert (= (and d!59089 res!114806) b!234035))

(assert (= (and b!234035 res!114807) b!234042))

(assert (= (and b!234042 res!114808) b!234043))

(assert (= (and b!234042 c!38974) b!234039))

(assert (= (and b!234042 (not c!38974)) b!234046))

(assert (= (and b!234039 res!114805) b!234041))

(assert (= (and b!234046 c!38975) b!234036))

(assert (= (and b!234046 (not c!38975)) b!234038))

(declare-fun b_lambda!7885 () Bool)

(assert (=> (not b_lambda!7885) (not b!234037)))

(assert (=> b!234037 t!8400))

(declare-fun b_and!13223 () Bool)

(assert (= b_and!13221 (and (=> t!8400 result!5083) b_and!13223)))

(declare-fun b_lambda!7887 () Bool)

(assert (=> (not b_lambda!7887) (not b!234041)))

(assert (=> b!234041 t!8400))

(declare-fun b_and!13225 () Bool)

(assert (= b_and!13223 (and (=> t!8400 result!5083) b_and!13225)))

(assert (=> b!234041 m!255337))

(declare-fun m!255497 () Bool)

(assert (=> b!234041 m!255497))

(assert (=> b!234041 m!255383))

(assert (=> b!234041 m!255385))

(assert (=> b!234041 m!255387))

(assert (=> b!234041 m!255383))

(assert (=> b!234041 m!255337))

(assert (=> b!234041 m!255385))

(assert (=> b!234039 m!255337))

(assert (=> b!234039 m!255337))

(declare-fun m!255499 () Bool)

(assert (=> b!234039 m!255499))

(declare-fun m!255501 () Bool)

(assert (=> d!59089 m!255501))

(assert (=> d!59089 m!255267))

(declare-fun m!255503 () Bool)

(assert (=> b!234035 m!255503))

(declare-fun m!255505 () Bool)

(assert (=> bm!21750 m!255505))

(assert (=> b!234043 m!255337))

(assert (=> b!234043 m!255337))

(assert (=> b!234043 m!255341))

(assert (=> b!234045 m!255337))

(assert (=> b!234045 m!255337))

(assert (=> b!234045 m!255341))

(assert (=> b!234036 m!255505))

(assert (=> b!234037 m!255383))

(assert (=> b!234037 m!255337))

(declare-fun m!255507 () Bool)

(assert (=> b!234037 m!255507))

(assert (=> b!234037 m!255385))

(assert (=> b!234037 m!255507))

(declare-fun m!255509 () Bool)

(assert (=> b!234037 m!255509))

(declare-fun m!255511 () Bool)

(assert (=> b!234037 m!255511))

(declare-fun m!255513 () Bool)

(assert (=> b!234037 m!255513))

(assert (=> b!234037 m!255383))

(assert (=> b!234037 m!255385))

(assert (=> b!234037 m!255387))

(declare-fun m!255515 () Bool)

(assert (=> b!234038 m!255515))

(assert (=> b!233888 d!59089))

(declare-fun d!59091 () Bool)

(assert (=> d!59091 (contains!1626 (+!632 lt!118341 (tuple2!4539 lt!118360 (zeroValue!4188 thiss!1504))) lt!118345)))

(declare-fun lt!118436 () Unit!7211)

(declare-fun choose!1103 (ListLongMap!3453 (_ BitVec 64) V!7857 (_ BitVec 64)) Unit!7211)

(assert (=> d!59091 (= lt!118436 (choose!1103 lt!118341 lt!118360 (zeroValue!4188 thiss!1504) lt!118345))))

(assert (=> d!59091 (contains!1626 lt!118341 lt!118345)))

(assert (=> d!59091 (= (addStillContains!181 lt!118341 lt!118360 (zeroValue!4188 thiss!1504) lt!118345) lt!118436)))

(declare-fun bs!8686 () Bool)

(assert (= bs!8686 d!59091))

(assert (=> bs!8686 m!255363))

(assert (=> bs!8686 m!255363))

(assert (=> bs!8686 m!255365))

(declare-fun m!255517 () Bool)

(assert (=> bs!8686 m!255517))

(declare-fun m!255519 () Bool)

(assert (=> bs!8686 m!255519))

(assert (=> b!233888 d!59091))

(declare-fun d!59093 () Bool)

(assert (=> d!59093 (= (apply!205 lt!118352 lt!118358) (get!2826 (getValueByKey!264 (toList!1742 lt!118352) lt!118358)))))

(declare-fun bs!8687 () Bool)

(assert (= bs!8687 d!59093))

(declare-fun m!255521 () Bool)

(assert (=> bs!8687 m!255521))

(assert (=> bs!8687 m!255521))

(declare-fun m!255523 () Bool)

(assert (=> bs!8687 m!255523))

(assert (=> b!233888 d!59093))

(declare-fun d!59095 () Bool)

(assert (=> d!59095 (= (apply!205 (+!632 lt!118352 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504))) lt!118358) (get!2826 (getValueByKey!264 (toList!1742 (+!632 lt!118352 (tuple2!4539 lt!118362 (minValue!4188 thiss!1504)))) lt!118358)))))

(declare-fun bs!8688 () Bool)

(assert (= bs!8688 d!59095))

(declare-fun m!255525 () Bool)

(assert (=> bs!8688 m!255525))

(assert (=> bs!8688 m!255525))

(declare-fun m!255527 () Bool)

(assert (=> bs!8688 m!255527))

(assert (=> b!233888 d!59095))

(declare-fun d!59097 () Bool)

(assert (=> d!59097 (= (apply!205 (+!632 lt!118346 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))) lt!118354) (get!2826 (getValueByKey!264 (toList!1742 (+!632 lt!118346 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504)))) lt!118354)))))

(declare-fun bs!8689 () Bool)

(assert (= bs!8689 d!59097))

(declare-fun m!255529 () Bool)

(assert (=> bs!8689 m!255529))

(assert (=> bs!8689 m!255529))

(declare-fun m!255531 () Bool)

(assert (=> bs!8689 m!255531))

(assert (=> b!233888 d!59097))

(declare-fun d!59099 () Bool)

(declare-fun e!152016 () Bool)

(assert (=> d!59099 e!152016))

(declare-fun res!114810 () Bool)

(assert (=> d!59099 (=> (not res!114810) (not e!152016))))

(declare-fun lt!118437 () ListLongMap!3453)

(assert (=> d!59099 (= res!114810 (contains!1626 lt!118437 (_1!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504)))))))

(declare-fun lt!118438 () List!3442)

(assert (=> d!59099 (= lt!118437 (ListLongMap!3454 lt!118438))))

(declare-fun lt!118440 () Unit!7211)

(declare-fun lt!118439 () Unit!7211)

(assert (=> d!59099 (= lt!118440 lt!118439)))

(assert (=> d!59099 (= (getValueByKey!264 lt!118438 (_1!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504)))))))

(assert (=> d!59099 (= lt!118439 (lemmaContainsTupThenGetReturnValue!149 lt!118438 (_1!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504)))))))

(assert (=> d!59099 (= lt!118438 (insertStrictlySorted!152 (toList!1742 lt!118347) (_1!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504)))))))

(assert (=> d!59099 (= (+!632 lt!118347 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))) lt!118437)))

(declare-fun b!234048 () Bool)

(declare-fun res!114809 () Bool)

(assert (=> b!234048 (=> (not res!114809) (not e!152016))))

(assert (=> b!234048 (= res!114809 (= (getValueByKey!264 (toList!1742 lt!118437) (_1!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))))))))

(declare-fun b!234049 () Bool)

(assert (=> b!234049 (= e!152016 (contains!1628 (toList!1742 lt!118437) (tuple2!4539 lt!118351 (minValue!4188 thiss!1504))))))

(assert (= (and d!59099 res!114810) b!234048))

(assert (= (and b!234048 res!114809) b!234049))

(declare-fun m!255533 () Bool)

(assert (=> d!59099 m!255533))

(declare-fun m!255535 () Bool)

(assert (=> d!59099 m!255535))

(declare-fun m!255537 () Bool)

(assert (=> d!59099 m!255537))

(declare-fun m!255539 () Bool)

(assert (=> d!59099 m!255539))

(declare-fun m!255541 () Bool)

(assert (=> b!234048 m!255541))

(declare-fun m!255543 () Bool)

(assert (=> b!234049 m!255543))

(assert (=> b!233888 d!59099))

(declare-fun d!59101 () Bool)

(assert (=> d!59101 (= (apply!205 lt!118346 lt!118354) (get!2826 (getValueByKey!264 (toList!1742 lt!118346) lt!118354)))))

(declare-fun bs!8690 () Bool)

(assert (= bs!8690 d!59101))

(declare-fun m!255545 () Bool)

(assert (=> bs!8690 m!255545))

(assert (=> bs!8690 m!255545))

(declare-fun m!255547 () Bool)

(assert (=> bs!8690 m!255547))

(assert (=> b!233888 d!59101))

(declare-fun d!59103 () Bool)

(declare-fun e!152017 () Bool)

(assert (=> d!59103 e!152017))

(declare-fun res!114812 () Bool)

(assert (=> d!59103 (=> (not res!114812) (not e!152017))))

(declare-fun lt!118441 () ListLongMap!3453)

(assert (=> d!59103 (= res!114812 (contains!1626 lt!118441 (_1!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504)))))))

(declare-fun lt!118442 () List!3442)

(assert (=> d!59103 (= lt!118441 (ListLongMap!3454 lt!118442))))

(declare-fun lt!118444 () Unit!7211)

(declare-fun lt!118443 () Unit!7211)

(assert (=> d!59103 (= lt!118444 lt!118443)))

(assert (=> d!59103 (= (getValueByKey!264 lt!118442 (_1!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!59103 (= lt!118443 (lemmaContainsTupThenGetReturnValue!149 lt!118442 (_1!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!59103 (= lt!118442 (insertStrictlySorted!152 (toList!1742 lt!118346) (_1!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504)))))))

(assert (=> d!59103 (= (+!632 lt!118346 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))) lt!118441)))

(declare-fun b!234050 () Bool)

(declare-fun res!114811 () Bool)

(assert (=> b!234050 (=> (not res!114811) (not e!152017))))

(assert (=> b!234050 (= res!114811 (= (getValueByKey!264 (toList!1742 lt!118441) (_1!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))))))))

(declare-fun b!234051 () Bool)

(assert (=> b!234051 (= e!152017 (contains!1628 (toList!1742 lt!118441) (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))))))

(assert (= (and d!59103 res!114812) b!234050))

(assert (= (and b!234050 res!114811) b!234051))

(declare-fun m!255549 () Bool)

(assert (=> d!59103 m!255549))

(declare-fun m!255551 () Bool)

(assert (=> d!59103 m!255551))

(declare-fun m!255553 () Bool)

(assert (=> d!59103 m!255553))

(declare-fun m!255555 () Bool)

(assert (=> d!59103 m!255555))

(declare-fun m!255557 () Bool)

(assert (=> b!234050 m!255557))

(declare-fun m!255559 () Bool)

(assert (=> b!234051 m!255559))

(assert (=> b!233888 d!59103))

(declare-fun d!59105 () Bool)

(assert (=> d!59105 (= (apply!205 lt!118347 lt!118350) (get!2826 (getValueByKey!264 (toList!1742 lt!118347) lt!118350)))))

(declare-fun bs!8691 () Bool)

(assert (= bs!8691 d!59105))

(declare-fun m!255561 () Bool)

(assert (=> bs!8691 m!255561))

(assert (=> bs!8691 m!255561))

(declare-fun m!255563 () Bool)

(assert (=> bs!8691 m!255563))

(assert (=> b!233888 d!59105))

(declare-fun d!59107 () Bool)

(assert (=> d!59107 (= (apply!205 (+!632 lt!118346 (tuple2!4539 lt!118355 (zeroValue!4188 thiss!1504))) lt!118354) (apply!205 lt!118346 lt!118354))))

(declare-fun lt!118445 () Unit!7211)

(assert (=> d!59107 (= lt!118445 (choose!1102 lt!118346 lt!118355 (zeroValue!4188 thiss!1504) lt!118354))))

(declare-fun e!152018 () Bool)

(assert (=> d!59107 e!152018))

(declare-fun res!114813 () Bool)

(assert (=> d!59107 (=> (not res!114813) (not e!152018))))

(assert (=> d!59107 (= res!114813 (contains!1626 lt!118346 lt!118354))))

(assert (=> d!59107 (= (addApplyDifferent!181 lt!118346 lt!118355 (zeroValue!4188 thiss!1504) lt!118354) lt!118445)))

(declare-fun b!234052 () Bool)

(assert (=> b!234052 (= e!152018 (not (= lt!118354 lt!118355)))))

(assert (= (and d!59107 res!114813) b!234052))

(declare-fun m!255565 () Bool)

(assert (=> d!59107 m!255565))

(declare-fun m!255567 () Bool)

(assert (=> d!59107 m!255567))

(assert (=> d!59107 m!255371))

(assert (=> d!59107 m!255349))

(assert (=> d!59107 m!255351))

(assert (=> d!59107 m!255349))

(assert (=> b!233888 d!59107))

(assert (=> d!59053 d!59049))

(declare-fun b!234061 () Bool)

(declare-fun res!114822 () Bool)

(declare-fun e!152021 () Bool)

(assert (=> b!234061 (=> (not res!114822) (not e!152021))))

(assert (=> b!234061 (= res!114822 (and (= (size!5831 (_values!4330 thiss!1504)) (bvadd (mask!10281 thiss!1504) #b00000000000000000000000000000001)) (= (size!5832 (_keys!6406 thiss!1504)) (size!5831 (_values!4330 thiss!1504))) (bvsge (_size!1734 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1734 thiss!1504) (bvadd (mask!10281 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!234063 () Bool)

(declare-fun res!114823 () Bool)

(assert (=> b!234063 (=> (not res!114823) (not e!152021))))

(declare-fun size!5837 (LongMapFixedSize!3370) (_ BitVec 32))

(assert (=> b!234063 (= res!114823 (= (size!5837 thiss!1504) (bvadd (_size!1734 thiss!1504) (bvsdiv (bvadd (extraKeys!4084 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!234062 () Bool)

(declare-fun res!114824 () Bool)

(assert (=> b!234062 (=> (not res!114824) (not e!152021))))

(assert (=> b!234062 (= res!114824 (bvsge (size!5837 thiss!1504) (_size!1734 thiss!1504)))))

(declare-fun d!59109 () Bool)

(declare-fun res!114825 () Bool)

(assert (=> d!59109 (=> (not res!114825) (not e!152021))))

(assert (=> d!59109 (= res!114825 (validMask!0 (mask!10281 thiss!1504)))))

(assert (=> d!59109 (= (simpleValid!228 thiss!1504) e!152021)))

(declare-fun b!234064 () Bool)

(assert (=> b!234064 (= e!152021 (and (bvsge (extraKeys!4084 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4084 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1734 thiss!1504) #b00000000000000000000000000000000)))))

(assert (= (and d!59109 res!114825) b!234061))

(assert (= (and b!234061 res!114822) b!234062))

(assert (= (and b!234062 res!114824) b!234063))

(assert (= (and b!234063 res!114823) b!234064))

(declare-fun m!255569 () Bool)

(assert (=> b!234063 m!255569))

(assert (=> b!234062 m!255569))

(assert (=> d!59109 m!255267))

(assert (=> d!59055 d!59109))

(declare-fun d!59111 () Bool)

(declare-fun e!152022 () Bool)

(assert (=> d!59111 e!152022))

(declare-fun res!114827 () Bool)

(assert (=> d!59111 (=> (not res!114827) (not e!152022))))

(declare-fun lt!118446 () ListLongMap!3453)

(assert (=> d!59111 (= res!114827 (contains!1626 lt!118446 (_1!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(declare-fun lt!118447 () List!3442)

(assert (=> d!59111 (= lt!118446 (ListLongMap!3454 lt!118447))))

(declare-fun lt!118449 () Unit!7211)

(declare-fun lt!118448 () Unit!7211)

(assert (=> d!59111 (= lt!118449 lt!118448)))

(assert (=> d!59111 (= (getValueByKey!264 lt!118447 (_1!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (=> d!59111 (= lt!118448 (lemmaContainsTupThenGetReturnValue!149 lt!118447 (_1!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (=> d!59111 (= lt!118447 (insertStrictlySorted!152 (toList!1742 call!21740) (_1!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))) (_2!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))))))

(assert (=> d!59111 (= (+!632 call!21740 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))) lt!118446)))

(declare-fun b!234065 () Bool)

(declare-fun res!114826 () Bool)

(assert (=> b!234065 (=> (not res!114826) (not e!152022))))

(assert (=> b!234065 (= res!114826 (= (getValueByKey!264 (toList!1742 lt!118446) (_1!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504)))) (Some!269 (_2!2280 (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))))

(declare-fun b!234066 () Bool)

(assert (=> b!234066 (= e!152022 (contains!1628 (toList!1742 lt!118446) (tuple2!4539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4188 thiss!1504))))))

(assert (= (and d!59111 res!114827) b!234065))

(assert (= (and b!234065 res!114826) b!234066))

(declare-fun m!255571 () Bool)

(assert (=> d!59111 m!255571))

(declare-fun m!255573 () Bool)

(assert (=> d!59111 m!255573))

(declare-fun m!255575 () Bool)

(assert (=> d!59111 m!255575))

(declare-fun m!255577 () Bool)

(assert (=> d!59111 m!255577))

(declare-fun m!255579 () Bool)

(assert (=> b!234065 m!255579))

(declare-fun m!255581 () Bool)

(assert (=> b!234066 m!255581))

(assert (=> b!233885 d!59111))

(declare-fun d!59113 () Bool)

(assert (=> d!59113 (= (apply!205 lt!118359 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2826 (getValueByKey!264 (toList!1742 lt!118359) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8692 () Bool)

(assert (= bs!8692 d!59113))

(declare-fun m!255583 () Bool)

(assert (=> bs!8692 m!255583))

(assert (=> bs!8692 m!255583))

(declare-fun m!255585 () Bool)

(assert (=> bs!8692 m!255585))

(assert (=> b!233878 d!59113))

(declare-fun d!59115 () Bool)

(assert (=> d!59115 (isDefined!204 (getValueByKey!264 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-fun lt!118452 () Unit!7211)

(declare-fun choose!1104 (List!3442 (_ BitVec 64)) Unit!7211)

(assert (=> d!59115 (= lt!118452 (choose!1104 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(declare-fun e!152025 () Bool)

(assert (=> d!59115 e!152025))

(declare-fun res!114830 () Bool)

(assert (=> d!59115 (=> (not res!114830) (not e!152025))))

(declare-fun isStrictlySorted!347 (List!3442) Bool)

(assert (=> d!59115 (= res!114830 (isStrictlySorted!347 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))))))

(assert (=> d!59115 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932) lt!118452)))

(declare-fun b!234069 () Bool)

(assert (=> b!234069 (= e!152025 (containsKey!255 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932))))

(assert (= (and d!59115 res!114830) b!234069))

(assert (=> d!59115 m!255327))

(assert (=> d!59115 m!255327))

(assert (=> d!59115 m!255329))

(declare-fun m!255587 () Bool)

(assert (=> d!59115 m!255587))

(declare-fun m!255589 () Bool)

(assert (=> d!59115 m!255589))

(assert (=> b!234069 m!255323))

(assert (=> b!233830 d!59115))

(assert (=> b!233830 d!59069))

(assert (=> b!233830 d!59071))

(declare-fun d!59117 () Bool)

(assert (=> d!59117 (= (validKeyInArray!0 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!233895 d!59117))

(declare-fun b!234088 () Bool)

(declare-fun e!152040 () Bool)

(declare-fun lt!118457 () SeekEntryResult!947)

(assert (=> b!234088 (= e!152040 (bvsge (x!23619 lt!118457) #b01111111111111111111111111111110))))

(declare-fun b!234089 () Bool)

(assert (=> b!234089 (and (bvsge (index!5960 lt!118457) #b00000000000000000000000000000000) (bvslt (index!5960 lt!118457) (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun res!114837 () Bool)

(assert (=> b!234089 (= res!114837 (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5960 lt!118457)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152038 () Bool)

(assert (=> b!234089 (=> res!114837 e!152038)))

(declare-fun b!234090 () Bool)

(declare-fun e!152037 () SeekEntryResult!947)

(assert (=> b!234090 (= e!152037 (Intermediate!947 true (toIndex!0 key!932 (mask!10281 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!234091 () Bool)

(declare-fun e!152036 () SeekEntryResult!947)

(assert (=> b!234091 (= e!152036 (Intermediate!947 false (toIndex!0 key!932 (mask!10281 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun d!59119 () Bool)

(assert (=> d!59119 e!152040))

(declare-fun c!38985 () Bool)

(assert (=> d!59119 (= c!38985 (and ((_ is Intermediate!947) lt!118457) (undefined!1759 lt!118457)))))

(assert (=> d!59119 (= lt!118457 e!152037)))

(declare-fun c!38986 () Bool)

(assert (=> d!59119 (= c!38986 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!118458 () (_ BitVec 64))

(assert (=> d!59119 (= lt!118458 (select (arr!5498 (_keys!6406 thiss!1504)) (toIndex!0 key!932 (mask!10281 thiss!1504))))))

(assert (=> d!59119 (validMask!0 (mask!10281 thiss!1504))))

(assert (=> d!59119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10281 thiss!1504)) key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)) lt!118457)))

(declare-fun b!234092 () Bool)

(assert (=> b!234092 (and (bvsge (index!5960 lt!118457) #b00000000000000000000000000000000) (bvslt (index!5960 lt!118457) (size!5832 (_keys!6406 thiss!1504))))))

(assert (=> b!234092 (= e!152038 (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5960 lt!118457)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234093 () Bool)

(assert (=> b!234093 (and (bvsge (index!5960 lt!118457) #b00000000000000000000000000000000) (bvslt (index!5960 lt!118457) (size!5832 (_keys!6406 thiss!1504))))))

(declare-fun res!114838 () Bool)

(assert (=> b!234093 (= res!114838 (= (select (arr!5498 (_keys!6406 thiss!1504)) (index!5960 lt!118457)) key!932))))

(assert (=> b!234093 (=> res!114838 e!152038)))

(declare-fun e!152039 () Bool)

(assert (=> b!234093 (= e!152039 e!152038)))

(declare-fun b!234094 () Bool)

(assert (=> b!234094 (= e!152037 e!152036)))

(declare-fun c!38984 () Bool)

(assert (=> b!234094 (= c!38984 (or (= lt!118458 key!932) (= (bvadd lt!118458 lt!118458) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234095 () Bool)

(assert (=> b!234095 (= e!152040 e!152039)))

(declare-fun res!114839 () Bool)

(assert (=> b!234095 (= res!114839 (and ((_ is Intermediate!947) lt!118457) (not (undefined!1759 lt!118457)) (bvslt (x!23619 lt!118457) #b01111111111111111111111111111110) (bvsge (x!23619 lt!118457) #b00000000000000000000000000000000) (bvsge (x!23619 lt!118457) #b00000000000000000000000000000000)))))

(assert (=> b!234095 (=> (not res!114839) (not e!152039))))

(declare-fun b!234096 () Bool)

(assert (=> b!234096 (= e!152036 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10281 thiss!1504)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!10281 thiss!1504)) key!932 (_keys!6406 thiss!1504) (mask!10281 thiss!1504)))))

(assert (= (and d!59119 c!38986) b!234090))

(assert (= (and d!59119 (not c!38986)) b!234094))

(assert (= (and b!234094 c!38984) b!234091))

(assert (= (and b!234094 (not c!38984)) b!234096))

(assert (= (and d!59119 c!38985) b!234088))

(assert (= (and d!59119 (not c!38985)) b!234095))

(assert (= (and b!234095 res!114839) b!234093))

(assert (= (and b!234093 (not res!114838)) b!234089))

(assert (= (and b!234089 (not res!114837)) b!234092))

(assert (=> d!59119 m!255313))

(declare-fun m!255591 () Bool)

(assert (=> d!59119 m!255591))

(assert (=> d!59119 m!255267))

(assert (=> b!234096 m!255313))

(declare-fun m!255593 () Bool)

(assert (=> b!234096 m!255593))

(assert (=> b!234096 m!255593))

(declare-fun m!255595 () Bool)

(assert (=> b!234096 m!255595))

(declare-fun m!255597 () Bool)

(assert (=> b!234092 m!255597))

(assert (=> b!234089 m!255597))

(assert (=> b!234093 m!255597))

(assert (=> d!59047 d!59119))

(declare-fun d!59121 () Bool)

(declare-fun lt!118464 () (_ BitVec 32))

(declare-fun lt!118463 () (_ BitVec 32))

(assert (=> d!59121 (= lt!118464 (bvmul (bvxor lt!118463 (bvlshr lt!118463 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59121 (= lt!118463 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59121 (and (bvsge (mask!10281 thiss!1504) #b00000000000000000000000000000000) (let ((res!114840 (let ((h!4090 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23638 (bvmul (bvxor h!4090 (bvlshr h!4090 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23638 (bvlshr x!23638 #b00000000000000000000000000001101)) (mask!10281 thiss!1504)))))) (and (bvslt res!114840 (bvadd (mask!10281 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!114840 #b00000000000000000000000000000000))))))

(assert (=> d!59121 (= (toIndex!0 key!932 (mask!10281 thiss!1504)) (bvand (bvxor lt!118464 (bvlshr lt!118464 #b00000000000000000000000000001101)) (mask!10281 thiss!1504)))))

(assert (=> d!59047 d!59121))

(assert (=> d!59047 d!59049))

(assert (=> b!233894 d!59117))

(declare-fun d!59123 () Bool)

(declare-fun e!152041 () Bool)

(assert (=> d!59123 e!152041))

(declare-fun res!114841 () Bool)

(assert (=> d!59123 (=> res!114841 e!152041)))

(declare-fun lt!118466 () Bool)

(assert (=> d!59123 (= res!114841 (not lt!118466))))

(declare-fun lt!118467 () Bool)

(assert (=> d!59123 (= lt!118466 lt!118467)))

(declare-fun lt!118468 () Unit!7211)

(declare-fun e!152042 () Unit!7211)

(assert (=> d!59123 (= lt!118468 e!152042)))

(declare-fun c!38987 () Bool)

(assert (=> d!59123 (= c!38987 lt!118467)))

(assert (=> d!59123 (= lt!118467 (containsKey!255 (toList!1742 lt!118359) (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59123 (= (contains!1626 lt!118359 (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)) lt!118466)))

(declare-fun b!234097 () Bool)

(declare-fun lt!118465 () Unit!7211)

(assert (=> b!234097 (= e!152042 lt!118465)))

(assert (=> b!234097 (= lt!118465 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1742 lt!118359) (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234097 (isDefined!204 (getValueByKey!264 (toList!1742 lt!118359) (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234098 () Bool)

(declare-fun Unit!7217 () Unit!7211)

(assert (=> b!234098 (= e!152042 Unit!7217)))

(declare-fun b!234099 () Bool)

(assert (=> b!234099 (= e!152041 (isDefined!204 (getValueByKey!264 (toList!1742 lt!118359) (select (arr!5498 (_keys!6406 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59123 c!38987) b!234097))

(assert (= (and d!59123 (not c!38987)) b!234098))

(assert (= (and d!59123 (not res!114841)) b!234099))

(assert (=> d!59123 m!255337))

(declare-fun m!255599 () Bool)

(assert (=> d!59123 m!255599))

(assert (=> b!234097 m!255337))

(declare-fun m!255601 () Bool)

(assert (=> b!234097 m!255601))

(assert (=> b!234097 m!255337))

(assert (=> b!234097 m!255431))

(assert (=> b!234097 m!255431))

(declare-fun m!255603 () Bool)

(assert (=> b!234097 m!255603))

(assert (=> b!234099 m!255337))

(assert (=> b!234099 m!255431))

(assert (=> b!234099 m!255431))

(assert (=> b!234099 m!255603))

(assert (=> b!233883 d!59123))

(declare-fun d!59125 () Bool)

(declare-fun e!152043 () Bool)

(assert (=> d!59125 e!152043))

(declare-fun res!114842 () Bool)

(assert (=> d!59125 (=> res!114842 e!152043)))

(declare-fun lt!118470 () Bool)

(assert (=> d!59125 (= res!114842 (not lt!118470))))

(declare-fun lt!118471 () Bool)

(assert (=> d!59125 (= lt!118470 lt!118471)))

(declare-fun lt!118472 () Unit!7211)

(declare-fun e!152044 () Unit!7211)

(assert (=> d!59125 (= lt!118472 e!152044)))

(declare-fun c!38988 () Bool)

(assert (=> d!59125 (= c!38988 lt!118471)))

(assert (=> d!59125 (= lt!118471 (containsKey!255 (toList!1742 lt!118359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59125 (= (contains!1626 lt!118359 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118470)))

(declare-fun b!234100 () Bool)

(declare-fun lt!118469 () Unit!7211)

(assert (=> b!234100 (= e!152044 lt!118469)))

(assert (=> b!234100 (= lt!118469 (lemmaContainsKeyImpliesGetValueByKeyDefined!203 (toList!1742 lt!118359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234100 (isDefined!204 (getValueByKey!264 (toList!1742 lt!118359) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234101 () Bool)

(declare-fun Unit!7218 () Unit!7211)

(assert (=> b!234101 (= e!152044 Unit!7218)))

(declare-fun b!234102 () Bool)

(assert (=> b!234102 (= e!152043 (isDefined!204 (getValueByKey!264 (toList!1742 lt!118359) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59125 c!38988) b!234100))

(assert (= (and d!59125 (not c!38988)) b!234101))

(assert (= (and d!59125 (not res!114842)) b!234102))

(declare-fun m!255605 () Bool)

(assert (=> d!59125 m!255605))

(declare-fun m!255607 () Bool)

(assert (=> b!234100 m!255607))

(assert (=> b!234100 m!255583))

(assert (=> b!234100 m!255583))

(declare-fun m!255609 () Bool)

(assert (=> b!234100 m!255609))

(assert (=> b!234102 m!255583))

(assert (=> b!234102 m!255583))

(assert (=> b!234102 m!255609))

(assert (=> bm!21737 d!59125))

(declare-fun d!59127 () Bool)

(declare-fun res!114847 () Bool)

(declare-fun e!152049 () Bool)

(assert (=> d!59127 (=> res!114847 e!152049)))

(assert (=> d!59127 (= res!114847 (and ((_ is Cons!3438) (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (= (_1!2280 (h!4087 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)))))

(assert (=> d!59127 (= (containsKey!255 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))) key!932) e!152049)))

(declare-fun b!234107 () Bool)

(declare-fun e!152050 () Bool)

(assert (=> b!234107 (= e!152049 e!152050)))

(declare-fun res!114848 () Bool)

(assert (=> b!234107 (=> (not res!114848) (not e!152050))))

(assert (=> b!234107 (= res!114848 (and (or (not ((_ is Cons!3438) (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) (bvsle (_1!2280 (h!4087 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)) ((_ is Cons!3438) (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) (bvslt (_1!2280 (h!4087 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504))))) key!932)))))

(declare-fun b!234108 () Bool)

(assert (=> b!234108 (= e!152050 (containsKey!255 (t!8397 (toList!1742 (getCurrentListMap!1274 (_keys!6406 thiss!1504) (_values!4330 thiss!1504) (mask!10281 thiss!1504) (extraKeys!4084 thiss!1504) (zeroValue!4188 thiss!1504) (minValue!4188 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4347 thiss!1504)))) key!932))))

(assert (= (and d!59127 (not res!114847)) b!234107))

(assert (= (and b!234107 res!114848) b!234108))

(declare-fun m!255611 () Bool)

(assert (=> b!234108 m!255611))

(assert (=> d!59051 d!59127))

(declare-fun d!59129 () Bool)

(assert (=> d!59129 (= (apply!205 lt!118359 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2826 (getValueByKey!264 (toList!1742 lt!118359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8693 () Bool)

(assert (= bs!8693 d!59129))

(assert (=> bs!8693 m!255415))

(assert (=> bs!8693 m!255415))

(declare-fun m!255613 () Bool)

(assert (=> bs!8693 m!255613))

(assert (=> b!233882 d!59129))

(assert (=> bm!21732 d!59089))

(declare-fun mapNonEmpty!10422 () Bool)

(declare-fun mapRes!10422 () Bool)

(declare-fun tp!22050 () Bool)

(declare-fun e!152051 () Bool)

(assert (=> mapNonEmpty!10422 (= mapRes!10422 (and tp!22050 e!152051))))

(declare-fun mapValue!10422 () ValueCell!2735)

(declare-fun mapKey!10422 () (_ BitVec 32))

(declare-fun mapRest!10422 () (Array (_ BitVec 32) ValueCell!2735))

(assert (=> mapNonEmpty!10422 (= mapRest!10421 (store mapRest!10422 mapKey!10422 mapValue!10422))))

(declare-fun b!234109 () Bool)

(assert (=> b!234109 (= e!152051 tp_is_empty!6157)))

(declare-fun mapIsEmpty!10422 () Bool)

(assert (=> mapIsEmpty!10422 mapRes!10422))

(declare-fun condMapEmpty!10422 () Bool)

(declare-fun mapDefault!10422 () ValueCell!2735)

(assert (=> mapNonEmpty!10421 (= condMapEmpty!10422 (= mapRest!10421 ((as const (Array (_ BitVec 32) ValueCell!2735)) mapDefault!10422)))))

(declare-fun e!152052 () Bool)

(assert (=> mapNonEmpty!10421 (= tp!22049 (and e!152052 mapRes!10422))))

(declare-fun b!234110 () Bool)

(assert (=> b!234110 (= e!152052 tp_is_empty!6157)))

(assert (= (and mapNonEmpty!10421 condMapEmpty!10422) mapIsEmpty!10422))

(assert (= (and mapNonEmpty!10421 (not condMapEmpty!10422)) mapNonEmpty!10422))

(assert (= (and mapNonEmpty!10422 ((_ is ValueCellFull!2735) mapValue!10422)) b!234109))

(assert (= (and mapNonEmpty!10421 ((_ is ValueCellFull!2735) mapDefault!10422)) b!234110))

(declare-fun m!255615 () Bool)

(assert (=> mapNonEmpty!10422 m!255615))

(declare-fun b_lambda!7889 () Bool)

(assert (= b_lambda!7885 (or (and b!233743 b_free!6295) b_lambda!7889)))

(declare-fun b_lambda!7891 () Bool)

(assert (= b_lambda!7887 (or (and b!233743 b_free!6295) b_lambda!7891)))

(check-sat (not b!234043) (not d!59097) tp_is_empty!6157 (not d!59093) (not d!59059) (not bm!21744) (not b!234001) (not d!59099) (not d!59087) (not b!233973) (not b!234102) (not b!233996) (not d!59095) (not b!234050) (not b_lambda!7891) (not d!59069) (not d!59091) (not b!234066) (not b!234036) (not d!59123) (not b!234063) (not b!234045) (not mapNonEmpty!10422) (not d!59109) (not b_next!6295) (not bm!21747) (not d!59079) (not b!234048) (not b!233953) (not b!234000) (not bm!21750) (not b!233937) (not b!234100) (not bm!21741) (not b!233920) (not b!233919) (not b!234051) (not d!59125) (not b!234038) (not b_lambda!7883) (not b!233995) (not d!59085) (not d!59083) (not b!233983) (not b!234049) (not d!59105) (not b!234069) (not b!234003) (not d!59103) (not d!59113) (not b!234108) (not d!59111) (not b!233921) (not d!59119) (not b!234035) (not b!233923) (not b!233956) (not b!234039) (not d!59115) (not b!233961) (not b!234097) (not d!59057) b_and!13225 (not d!59061) (not b!233954) (not b!233999) (not b!234096) (not d!59129) (not b!234041) (not b!234008) (not b!234065) (not d!59081) (not d!59101) (not b!234099) (not d!59089) (not d!59065) (not d!59077) (not b!234009) (not b!233962) (not b!234062) (not d!59107) (not b_lambda!7889) (not b!234037))
(check-sat b_and!13225 (not b_next!6295))
