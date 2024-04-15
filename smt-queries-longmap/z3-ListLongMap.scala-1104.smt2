; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22720 () Bool)

(assert start!22720)

(declare-fun b!236920 () Bool)

(declare-fun b_free!6373 () Bool)

(declare-fun b_next!6373 () Bool)

(assert (=> b!236920 (= b_free!6373 (not b_next!6373))))

(declare-fun tp!22305 () Bool)

(declare-fun b_and!13295 () Bool)

(assert (=> b!236920 (= tp!22305 b_and!13295)))

(declare-fun b!236919 () Bool)

(declare-fun e!153857 () Bool)

(declare-fun e!153852 () Bool)

(assert (=> b!236919 (= e!153857 e!153852)))

(declare-fun res!116117 () Bool)

(assert (=> b!236919 (=> (not res!116117) (not e!153852))))

(declare-datatypes ((SeekEntryResult!1004 0))(
  ( (MissingZero!1004 (index!6186 (_ BitVec 32))) (Found!1004 (index!6187 (_ BitVec 32))) (Intermediate!1004 (undefined!1816 Bool) (index!6188 (_ BitVec 32)) (x!23929 (_ BitVec 32))) (Undefined!1004) (MissingVacant!1004 (index!6189 (_ BitVec 32))) )
))
(declare-fun lt!119698 () SeekEntryResult!1004)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!236919 (= res!116117 (or (= lt!119698 (MissingZero!1004 index!297)) (= lt!119698 (MissingVacant!1004 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((V!7961 0))(
  ( (V!7962 (val!3162 Int)) )
))
(declare-datatypes ((ValueCell!2774 0))(
  ( (ValueCellFull!2774 (v!5189 V!7961)) (EmptyCell!2774) )
))
(declare-datatypes ((array!11731 0))(
  ( (array!11732 (arr!5571 (Array (_ BitVec 32) ValueCell!2774)) (size!5911 (_ BitVec 32))) )
))
(declare-datatypes ((array!11733 0))(
  ( (array!11734 (arr!5572 (Array (_ BitVec 32) (_ BitVec 64))) (size!5912 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3448 0))(
  ( (LongMapFixedSize!3449 (defaultEntry!4402 Int) (mask!10406 (_ BitVec 32)) (extraKeys!4139 (_ BitVec 32)) (zeroValue!4243 V!7961) (minValue!4243 V!7961) (_size!1773 (_ BitVec 32)) (_keys!6489 array!11733) (_values!4385 array!11731) (_vacant!1773 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3448)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11733 (_ BitVec 32)) SeekEntryResult!1004)

(assert (=> b!236919 (= lt!119698 (seekEntryOrOpen!0 key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)))))

(declare-fun tp_is_empty!6235 () Bool)

(declare-fun e!153854 () Bool)

(declare-fun e!153855 () Bool)

(declare-fun array_inv!3675 (array!11733) Bool)

(declare-fun array_inv!3676 (array!11731) Bool)

(assert (=> b!236920 (= e!153854 (and tp!22305 tp_is_empty!6235 (array_inv!3675 (_keys!6489 thiss!1504)) (array_inv!3676 (_values!4385 thiss!1504)) e!153855))))

(declare-fun b!236921 () Bool)

(declare-fun e!153853 () Bool)

(assert (=> b!236921 (= e!153853 tp_is_empty!6235)))

(declare-fun b!236922 () Bool)

(declare-fun e!153858 () Bool)

(assert (=> b!236922 (= e!153858 tp_is_empty!6235)))

(declare-fun mapNonEmpty!10567 () Bool)

(declare-fun mapRes!10567 () Bool)

(declare-fun tp!22306 () Bool)

(assert (=> mapNonEmpty!10567 (= mapRes!10567 (and tp!22306 e!153853))))

(declare-fun mapRest!10567 () (Array (_ BitVec 32) ValueCell!2774))

(declare-fun mapKey!10567 () (_ BitVec 32))

(declare-fun mapValue!10567 () ValueCell!2774)

(assert (=> mapNonEmpty!10567 (= (arr!5571 (_values!4385 thiss!1504)) (store mapRest!10567 mapKey!10567 mapValue!10567))))

(declare-fun b!236924 () Bool)

(assert (=> b!236924 (= e!153855 (and e!153858 mapRes!10567))))

(declare-fun condMapEmpty!10567 () Bool)

(declare-fun mapDefault!10567 () ValueCell!2774)

(assert (=> b!236924 (= condMapEmpty!10567 (= (arr!5571 (_values!4385 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2774)) mapDefault!10567)))))

(declare-fun res!116116 () Bool)

(assert (=> start!22720 (=> (not res!116116) (not e!153857))))

(declare-fun valid!1368 (LongMapFixedSize!3448) Bool)

(assert (=> start!22720 (= res!116116 (valid!1368 thiss!1504))))

(assert (=> start!22720 e!153857))

(assert (=> start!22720 e!153854))

(assert (=> start!22720 true))

(declare-fun b!236923 () Bool)

(declare-fun res!116115 () Bool)

(assert (=> b!236923 (=> (not res!116115) (not e!153852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!236923 (= res!116115 (validMask!0 (mask!10406 thiss!1504)))))

(declare-fun b!236925 () Bool)

(assert (=> b!236925 (= e!153852 (and (= (size!5911 (_values!4385 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10406 thiss!1504))) (= (size!5912 (_keys!6489 thiss!1504)) (size!5911 (_values!4385 thiss!1504))) (bvsge (mask!10406 thiss!1504) #b00000000000000000000000000000000) (bvslt (extraKeys!4139 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!236926 () Bool)

(declare-fun res!116113 () Bool)

(assert (=> b!236926 (=> (not res!116113) (not e!153852))))

(declare-datatypes ((tuple2!4638 0))(
  ( (tuple2!4639 (_1!2330 (_ BitVec 64)) (_2!2330 V!7961)) )
))
(declare-datatypes ((List!3555 0))(
  ( (Nil!3552) (Cons!3551 (h!4205 tuple2!4638) (t!8531 List!3555)) )
))
(declare-datatypes ((ListLongMap!3541 0))(
  ( (ListLongMap!3542 (toList!1786 List!3555)) )
))
(declare-fun contains!1671 (ListLongMap!3541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1295 (array!11733 array!11731 (_ BitVec 32) (_ BitVec 32) V!7961 V!7961 (_ BitVec 32) Int) ListLongMap!3541)

(assert (=> b!236926 (= res!116113 (not (contains!1671 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) key!932)))))

(declare-fun b!236927 () Bool)

(declare-fun res!116114 () Bool)

(assert (=> b!236927 (=> (not res!116114) (not e!153857))))

(assert (=> b!236927 (= res!116114 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!10567 () Bool)

(assert (=> mapIsEmpty!10567 mapRes!10567))

(assert (= (and start!22720 res!116116) b!236927))

(assert (= (and b!236927 res!116114) b!236919))

(assert (= (and b!236919 res!116117) b!236926))

(assert (= (and b!236926 res!116113) b!236923))

(assert (= (and b!236923 res!116115) b!236925))

(assert (= (and b!236924 condMapEmpty!10567) mapIsEmpty!10567))

(assert (= (and b!236924 (not condMapEmpty!10567)) mapNonEmpty!10567))

(get-info :version)

(assert (= (and mapNonEmpty!10567 ((_ is ValueCellFull!2774) mapValue!10567)) b!236921))

(assert (= (and b!236924 ((_ is ValueCellFull!2774) mapDefault!10567)) b!236922))

(assert (= b!236920 b!236924))

(assert (= start!22720 b!236920))

(declare-fun m!257249 () Bool)

(assert (=> mapNonEmpty!10567 m!257249))

(declare-fun m!257251 () Bool)

(assert (=> b!236923 m!257251))

(declare-fun m!257253 () Bool)

(assert (=> b!236926 m!257253))

(assert (=> b!236926 m!257253))

(declare-fun m!257255 () Bool)

(assert (=> b!236926 m!257255))

(declare-fun m!257257 () Bool)

(assert (=> b!236920 m!257257))

(declare-fun m!257259 () Bool)

(assert (=> b!236920 m!257259))

(declare-fun m!257261 () Bool)

(assert (=> start!22720 m!257261))

(declare-fun m!257263 () Bool)

(assert (=> b!236919 m!257263))

(check-sat tp_is_empty!6235 (not b!236926) (not b!236920) (not b!236919) (not mapNonEmpty!10567) (not b_next!6373) (not start!22720) (not b!236923) b_and!13295)
(check-sat b_and!13295 (not b_next!6373))
(get-model)

(declare-fun b!236994 () Bool)

(declare-fun c!39491 () Bool)

(declare-fun lt!119712 () (_ BitVec 64))

(assert (=> b!236994 (= c!39491 (= lt!119712 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!153907 () SeekEntryResult!1004)

(declare-fun e!153908 () SeekEntryResult!1004)

(assert (=> b!236994 (= e!153907 e!153908)))

(declare-fun b!236995 () Bool)

(declare-fun e!153909 () SeekEntryResult!1004)

(assert (=> b!236995 (= e!153909 Undefined!1004)))

(declare-fun d!59383 () Bool)

(declare-fun lt!119713 () SeekEntryResult!1004)

(assert (=> d!59383 (and (or ((_ is Undefined!1004) lt!119713) (not ((_ is Found!1004) lt!119713)) (and (bvsge (index!6187 lt!119713) #b00000000000000000000000000000000) (bvslt (index!6187 lt!119713) (size!5912 (_keys!6489 thiss!1504))))) (or ((_ is Undefined!1004) lt!119713) ((_ is Found!1004) lt!119713) (not ((_ is MissingZero!1004) lt!119713)) (and (bvsge (index!6186 lt!119713) #b00000000000000000000000000000000) (bvslt (index!6186 lt!119713) (size!5912 (_keys!6489 thiss!1504))))) (or ((_ is Undefined!1004) lt!119713) ((_ is Found!1004) lt!119713) ((_ is MissingZero!1004) lt!119713) (not ((_ is MissingVacant!1004) lt!119713)) (and (bvsge (index!6189 lt!119713) #b00000000000000000000000000000000) (bvslt (index!6189 lt!119713) (size!5912 (_keys!6489 thiss!1504))))) (or ((_ is Undefined!1004) lt!119713) (ite ((_ is Found!1004) lt!119713) (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6187 lt!119713)) key!932) (ite ((_ is MissingZero!1004) lt!119713) (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6186 lt!119713)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1004) lt!119713) (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6189 lt!119713)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59383 (= lt!119713 e!153909)))

(declare-fun c!39492 () Bool)

(declare-fun lt!119711 () SeekEntryResult!1004)

(assert (=> d!59383 (= c!39492 (and ((_ is Intermediate!1004) lt!119711) (undefined!1816 lt!119711)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11733 (_ BitVec 32)) SeekEntryResult!1004)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59383 (= lt!119711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10406 thiss!1504)) key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)))))

(assert (=> d!59383 (validMask!0 (mask!10406 thiss!1504))))

(assert (=> d!59383 (= (seekEntryOrOpen!0 key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)) lt!119713)))

(declare-fun b!236996 () Bool)

(assert (=> b!236996 (= e!153908 (MissingZero!1004 (index!6188 lt!119711)))))

(declare-fun b!236997 () Bool)

(assert (=> b!236997 (= e!153909 e!153907)))

(assert (=> b!236997 (= lt!119712 (select (arr!5572 (_keys!6489 thiss!1504)) (index!6188 lt!119711)))))

(declare-fun c!39493 () Bool)

(assert (=> b!236997 (= c!39493 (= lt!119712 key!932))))

(declare-fun b!236998 () Bool)

(assert (=> b!236998 (= e!153907 (Found!1004 (index!6188 lt!119711)))))

(declare-fun b!236999 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11733 (_ BitVec 32)) SeekEntryResult!1004)

(assert (=> b!236999 (= e!153908 (seekKeyOrZeroReturnVacant!0 (x!23929 lt!119711) (index!6188 lt!119711) (index!6188 lt!119711) key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)))))

(assert (= (and d!59383 c!39492) b!236995))

(assert (= (and d!59383 (not c!39492)) b!236997))

(assert (= (and b!236997 c!39493) b!236998))

(assert (= (and b!236997 (not c!39493)) b!236994))

(assert (= (and b!236994 c!39491) b!236996))

(assert (= (and b!236994 (not c!39491)) b!236999))

(declare-fun m!257297 () Bool)

(assert (=> d!59383 m!257297))

(declare-fun m!257299 () Bool)

(assert (=> d!59383 m!257299))

(assert (=> d!59383 m!257251))

(declare-fun m!257301 () Bool)

(assert (=> d!59383 m!257301))

(assert (=> d!59383 m!257297))

(declare-fun m!257303 () Bool)

(assert (=> d!59383 m!257303))

(declare-fun m!257305 () Bool)

(assert (=> d!59383 m!257305))

(declare-fun m!257307 () Bool)

(assert (=> b!236997 m!257307))

(declare-fun m!257309 () Bool)

(assert (=> b!236999 m!257309))

(assert (=> b!236919 d!59383))

(declare-fun d!59385 () Bool)

(assert (=> d!59385 (= (validMask!0 (mask!10406 thiss!1504)) (and (or (= (mask!10406 thiss!1504) #b00000000000000000000000000000111) (= (mask!10406 thiss!1504) #b00000000000000000000000000001111) (= (mask!10406 thiss!1504) #b00000000000000000000000000011111) (= (mask!10406 thiss!1504) #b00000000000000000000000000111111) (= (mask!10406 thiss!1504) #b00000000000000000000000001111111) (= (mask!10406 thiss!1504) #b00000000000000000000000011111111) (= (mask!10406 thiss!1504) #b00000000000000000000000111111111) (= (mask!10406 thiss!1504) #b00000000000000000000001111111111) (= (mask!10406 thiss!1504) #b00000000000000000000011111111111) (= (mask!10406 thiss!1504) #b00000000000000000000111111111111) (= (mask!10406 thiss!1504) #b00000000000000000001111111111111) (= (mask!10406 thiss!1504) #b00000000000000000011111111111111) (= (mask!10406 thiss!1504) #b00000000000000000111111111111111) (= (mask!10406 thiss!1504) #b00000000000000001111111111111111) (= (mask!10406 thiss!1504) #b00000000000000011111111111111111) (= (mask!10406 thiss!1504) #b00000000000000111111111111111111) (= (mask!10406 thiss!1504) #b00000000000001111111111111111111) (= (mask!10406 thiss!1504) #b00000000000011111111111111111111) (= (mask!10406 thiss!1504) #b00000000000111111111111111111111) (= (mask!10406 thiss!1504) #b00000000001111111111111111111111) (= (mask!10406 thiss!1504) #b00000000011111111111111111111111) (= (mask!10406 thiss!1504) #b00000000111111111111111111111111) (= (mask!10406 thiss!1504) #b00000001111111111111111111111111) (= (mask!10406 thiss!1504) #b00000011111111111111111111111111) (= (mask!10406 thiss!1504) #b00000111111111111111111111111111) (= (mask!10406 thiss!1504) #b00001111111111111111111111111111) (= (mask!10406 thiss!1504) #b00011111111111111111111111111111) (= (mask!10406 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10406 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!236923 d!59385))

(declare-fun d!59387 () Bool)

(declare-fun e!153914 () Bool)

(assert (=> d!59387 e!153914))

(declare-fun res!116150 () Bool)

(assert (=> d!59387 (=> res!116150 e!153914)))

(declare-fun lt!119724 () Bool)

(assert (=> d!59387 (= res!116150 (not lt!119724))))

(declare-fun lt!119723 () Bool)

(assert (=> d!59387 (= lt!119724 lt!119723)))

(declare-datatypes ((Unit!7284 0))(
  ( (Unit!7285) )
))
(declare-fun lt!119722 () Unit!7284)

(declare-fun e!153915 () Unit!7284)

(assert (=> d!59387 (= lt!119722 e!153915)))

(declare-fun c!39496 () Bool)

(assert (=> d!59387 (= c!39496 lt!119723)))

(declare-fun containsKey!264 (List!3555 (_ BitVec 64)) Bool)

(assert (=> d!59387 (= lt!119723 (containsKey!264 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(assert (=> d!59387 (= (contains!1671 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) key!932) lt!119724)))

(declare-fun b!237006 () Bool)

(declare-fun lt!119725 () Unit!7284)

(assert (=> b!237006 (= e!153915 lt!119725)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!213 (List!3555 (_ BitVec 64)) Unit!7284)

(assert (=> b!237006 (= lt!119725 (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-datatypes ((Option!278 0))(
  ( (Some!277 (v!5192 V!7961)) (None!276) )
))
(declare-fun isDefined!214 (Option!278) Bool)

(declare-fun getValueByKey!272 (List!3555 (_ BitVec 64)) Option!278)

(assert (=> b!237006 (isDefined!214 (getValueByKey!272 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-fun b!237007 () Bool)

(declare-fun Unit!7286 () Unit!7284)

(assert (=> b!237007 (= e!153915 Unit!7286)))

(declare-fun b!237008 () Bool)

(assert (=> b!237008 (= e!153914 (isDefined!214 (getValueByKey!272 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932)))))

(assert (= (and d!59387 c!39496) b!237006))

(assert (= (and d!59387 (not c!39496)) b!237007))

(assert (= (and d!59387 (not res!116150)) b!237008))

(declare-fun m!257311 () Bool)

(assert (=> d!59387 m!257311))

(declare-fun m!257313 () Bool)

(assert (=> b!237006 m!257313))

(declare-fun m!257315 () Bool)

(assert (=> b!237006 m!257315))

(assert (=> b!237006 m!257315))

(declare-fun m!257317 () Bool)

(assert (=> b!237006 m!257317))

(assert (=> b!237008 m!257315))

(assert (=> b!237008 m!257315))

(assert (=> b!237008 m!257317))

(assert (=> b!236926 d!59387))

(declare-fun b!237051 () Bool)

(declare-fun e!153948 () Bool)

(declare-fun e!153947 () Bool)

(assert (=> b!237051 (= e!153948 e!153947)))

(declare-fun res!116170 () Bool)

(declare-fun call!22029 () Bool)

(assert (=> b!237051 (= res!116170 call!22029)))

(assert (=> b!237051 (=> (not res!116170) (not e!153947))))

(declare-fun b!237052 () Bool)

(declare-fun res!116175 () Bool)

(declare-fun e!153950 () Bool)

(assert (=> b!237052 (=> (not res!116175) (not e!153950))))

(assert (=> b!237052 (= res!116175 e!153948)))

(declare-fun c!39511 () Bool)

(assert (=> b!237052 (= c!39511 (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!237053 () Bool)

(declare-fun e!153953 () ListLongMap!3541)

(declare-fun call!22030 () ListLongMap!3541)

(assert (=> b!237053 (= e!153953 call!22030)))

(declare-fun b!237054 () Bool)

(declare-fun e!153954 () ListLongMap!3541)

(assert (=> b!237054 (= e!153954 call!22030)))

(declare-fun bm!22026 () Bool)

(declare-fun call!22034 () ListLongMap!3541)

(declare-fun getCurrentListMapNoExtraKeys!532 (array!11733 array!11731 (_ BitVec 32) (_ BitVec 32) V!7961 V!7961 (_ BitVec 32) Int) ListLongMap!3541)

(assert (=> bm!22026 (= call!22034 (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun bm!22027 () Bool)

(declare-fun call!22033 () ListLongMap!3541)

(assert (=> bm!22027 (= call!22030 call!22033)))

(declare-fun d!59389 () Bool)

(assert (=> d!59389 e!153950))

(declare-fun res!116177 () Bool)

(assert (=> d!59389 (=> (not res!116177) (not e!153950))))

(assert (=> d!59389 (= res!116177 (or (bvsge #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))))

(declare-fun lt!119791 () ListLongMap!3541)

(declare-fun lt!119790 () ListLongMap!3541)

(assert (=> d!59389 (= lt!119791 lt!119790)))

(declare-fun lt!119788 () Unit!7284)

(declare-fun e!153942 () Unit!7284)

(assert (=> d!59389 (= lt!119788 e!153942)))

(declare-fun c!39509 () Bool)

(declare-fun e!153943 () Bool)

(assert (=> d!59389 (= c!39509 e!153943)))

(declare-fun res!116174 () Bool)

(assert (=> d!59389 (=> (not res!116174) (not e!153943))))

(assert (=> d!59389 (= res!116174 (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun e!153949 () ListLongMap!3541)

(assert (=> d!59389 (= lt!119790 e!153949)))

(declare-fun c!39512 () Bool)

(assert (=> d!59389 (= c!39512 (and (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59389 (validMask!0 (mask!10406 thiss!1504))))

(assert (=> d!59389 (= (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) lt!119791)))

(declare-fun bm!22028 () Bool)

(declare-fun call!22031 () ListLongMap!3541)

(declare-fun call!22032 () ListLongMap!3541)

(assert (=> bm!22028 (= call!22031 call!22032)))

(declare-fun b!237055 () Bool)

(declare-fun e!153946 () Bool)

(declare-fun apply!216 (ListLongMap!3541 (_ BitVec 64)) V!7961)

(declare-fun get!2865 (ValueCell!2774 V!7961) V!7961)

(declare-fun dynLambda!550 (Int (_ BitVec 64)) V!7961)

(assert (=> b!237055 (= e!153946 (= (apply!216 lt!119791 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)) (get!2865 (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5911 (_values!4385 thiss!1504))))))

(assert (=> b!237055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun bm!22029 () Bool)

(assert (=> bm!22029 (= call!22032 call!22034)))

(declare-fun b!237056 () Bool)

(assert (=> b!237056 (= e!153949 e!153953)))

(declare-fun c!39513 () Bool)

(assert (=> b!237056 (= c!39513 (and (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237057 () Bool)

(assert (=> b!237057 (= e!153948 (not call!22029))))

(declare-fun b!237058 () Bool)

(assert (=> b!237058 (= e!153954 call!22031)))

(declare-fun b!237059 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!237059 (= e!153943 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237060 () Bool)

(declare-fun +!649 (ListLongMap!3541 tuple2!4638) ListLongMap!3541)

(assert (=> b!237060 (= e!153949 (+!649 call!22033 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))

(declare-fun b!237061 () Bool)

(declare-fun e!153952 () Bool)

(assert (=> b!237061 (= e!153952 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237062 () Bool)

(declare-fun Unit!7287 () Unit!7284)

(assert (=> b!237062 (= e!153942 Unit!7287)))

(declare-fun bm!22030 () Bool)

(assert (=> bm!22030 (= call!22029 (contains!1671 lt!119791 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237063 () Bool)

(declare-fun e!153951 () Bool)

(assert (=> b!237063 (= e!153951 e!153946)))

(declare-fun res!116169 () Bool)

(assert (=> b!237063 (=> (not res!116169) (not e!153946))))

(assert (=> b!237063 (= res!116169 (contains!1671 lt!119791 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237063 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun b!237064 () Bool)

(declare-fun e!153944 () Bool)

(declare-fun call!22035 () Bool)

(assert (=> b!237064 (= e!153944 (not call!22035))))

(declare-fun bm!22031 () Bool)

(assert (=> bm!22031 (= call!22035 (contains!1671 lt!119791 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237065 () Bool)

(assert (=> b!237065 (= e!153947 (= (apply!216 lt!119791 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4243 thiss!1504)))))

(declare-fun b!237066 () Bool)

(declare-fun e!153945 () Bool)

(assert (=> b!237066 (= e!153945 (= (apply!216 lt!119791 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4243 thiss!1504)))))

(declare-fun b!237067 () Bool)

(declare-fun c!39510 () Bool)

(assert (=> b!237067 (= c!39510 (and (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!237067 (= e!153953 e!153954)))

(declare-fun bm!22032 () Bool)

(assert (=> bm!22032 (= call!22033 (+!649 (ite c!39512 call!22034 (ite c!39513 call!22032 call!22031)) (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(declare-fun b!237068 () Bool)

(assert (=> b!237068 (= e!153950 e!153944)))

(declare-fun c!39514 () Bool)

(assert (=> b!237068 (= c!39514 (not (= (bvand (extraKeys!4139 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!237069 () Bool)

(declare-fun res!116173 () Bool)

(assert (=> b!237069 (=> (not res!116173) (not e!153950))))

(assert (=> b!237069 (= res!116173 e!153951)))

(declare-fun res!116176 () Bool)

(assert (=> b!237069 (=> res!116176 e!153951)))

(assert (=> b!237069 (= res!116176 (not e!153952))))

(declare-fun res!116171 () Bool)

(assert (=> b!237069 (=> (not res!116171) (not e!153952))))

(assert (=> b!237069 (= res!116171 (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun b!237070 () Bool)

(declare-fun lt!119776 () Unit!7284)

(assert (=> b!237070 (= e!153942 lt!119776)))

(declare-fun lt!119771 () ListLongMap!3541)

(assert (=> b!237070 (= lt!119771 (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!119775 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119775 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119789 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119789 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119770 () Unit!7284)

(declare-fun addStillContains!192 (ListLongMap!3541 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7284)

(assert (=> b!237070 (= lt!119770 (addStillContains!192 lt!119771 lt!119775 (zeroValue!4243 thiss!1504) lt!119789))))

(assert (=> b!237070 (contains!1671 (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))) lt!119789)))

(declare-fun lt!119779 () Unit!7284)

(assert (=> b!237070 (= lt!119779 lt!119770)))

(declare-fun lt!119787 () ListLongMap!3541)

(assert (=> b!237070 (= lt!119787 (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!119781 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119781 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119774 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119774 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119780 () Unit!7284)

(declare-fun addApplyDifferent!192 (ListLongMap!3541 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7284)

(assert (=> b!237070 (= lt!119780 (addApplyDifferent!192 lt!119787 lt!119781 (minValue!4243 thiss!1504) lt!119774))))

(assert (=> b!237070 (= (apply!216 (+!649 lt!119787 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))) lt!119774) (apply!216 lt!119787 lt!119774))))

(declare-fun lt!119786 () Unit!7284)

(assert (=> b!237070 (= lt!119786 lt!119780)))

(declare-fun lt!119772 () ListLongMap!3541)

(assert (=> b!237070 (= lt!119772 (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!119782 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119782 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119783 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119783 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119784 () Unit!7284)

(assert (=> b!237070 (= lt!119784 (addApplyDifferent!192 lt!119772 lt!119782 (zeroValue!4243 thiss!1504) lt!119783))))

(assert (=> b!237070 (= (apply!216 (+!649 lt!119772 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))) lt!119783) (apply!216 lt!119772 lt!119783))))

(declare-fun lt!119773 () Unit!7284)

(assert (=> b!237070 (= lt!119773 lt!119784)))

(declare-fun lt!119778 () ListLongMap!3541)

(assert (=> b!237070 (= lt!119778 (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))

(declare-fun lt!119785 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119785 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!119777 () (_ BitVec 64))

(assert (=> b!237070 (= lt!119777 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237070 (= lt!119776 (addApplyDifferent!192 lt!119778 lt!119785 (minValue!4243 thiss!1504) lt!119777))))

(assert (=> b!237070 (= (apply!216 (+!649 lt!119778 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))) lt!119777) (apply!216 lt!119778 lt!119777))))

(declare-fun b!237071 () Bool)

(assert (=> b!237071 (= e!153944 e!153945)))

(declare-fun res!116172 () Bool)

(assert (=> b!237071 (= res!116172 call!22035)))

(assert (=> b!237071 (=> (not res!116172) (not e!153945))))

(assert (= (and d!59389 c!39512) b!237060))

(assert (= (and d!59389 (not c!39512)) b!237056))

(assert (= (and b!237056 c!39513) b!237053))

(assert (= (and b!237056 (not c!39513)) b!237067))

(assert (= (and b!237067 c!39510) b!237054))

(assert (= (and b!237067 (not c!39510)) b!237058))

(assert (= (or b!237054 b!237058) bm!22028))

(assert (= (or b!237053 bm!22028) bm!22029))

(assert (= (or b!237053 b!237054) bm!22027))

(assert (= (or b!237060 bm!22029) bm!22026))

(assert (= (or b!237060 bm!22027) bm!22032))

(assert (= (and d!59389 res!116174) b!237059))

(assert (= (and d!59389 c!39509) b!237070))

(assert (= (and d!59389 (not c!39509)) b!237062))

(assert (= (and d!59389 res!116177) b!237069))

(assert (= (and b!237069 res!116171) b!237061))

(assert (= (and b!237069 (not res!116176)) b!237063))

(assert (= (and b!237063 res!116169) b!237055))

(assert (= (and b!237069 res!116173) b!237052))

(assert (= (and b!237052 c!39511) b!237051))

(assert (= (and b!237052 (not c!39511)) b!237057))

(assert (= (and b!237051 res!116170) b!237065))

(assert (= (or b!237051 b!237057) bm!22030))

(assert (= (and b!237052 res!116175) b!237068))

(assert (= (and b!237068 c!39514) b!237071))

(assert (= (and b!237068 (not c!39514)) b!237064))

(assert (= (and b!237071 res!116172) b!237066))

(assert (= (or b!237071 b!237064) bm!22031))

(declare-fun b_lambda!7925 () Bool)

(assert (=> (not b_lambda!7925) (not b!237055)))

(declare-fun t!8535 () Bool)

(declare-fun tb!2937 () Bool)

(assert (=> (and b!236920 (= (defaultEntry!4402 thiss!1504) (defaultEntry!4402 thiss!1504)) t!8535) tb!2937))

(declare-fun result!5149 () Bool)

(assert (=> tb!2937 (= result!5149 tp_is_empty!6235)))

(assert (=> b!237055 t!8535))

(declare-fun b_and!13301 () Bool)

(assert (= b_and!13295 (and (=> t!8535 result!5149) b_and!13301)))

(declare-fun m!257319 () Bool)

(assert (=> b!237055 m!257319))

(assert (=> b!237055 m!257319))

(declare-fun m!257321 () Bool)

(assert (=> b!237055 m!257321))

(declare-fun m!257323 () Bool)

(assert (=> b!237055 m!257323))

(declare-fun m!257325 () Bool)

(assert (=> b!237055 m!257325))

(declare-fun m!257327 () Bool)

(assert (=> b!237055 m!257327))

(assert (=> b!237055 m!257323))

(assert (=> b!237055 m!257325))

(declare-fun m!257329 () Bool)

(assert (=> bm!22026 m!257329))

(assert (=> b!237061 m!257319))

(assert (=> b!237061 m!257319))

(declare-fun m!257331 () Bool)

(assert (=> b!237061 m!257331))

(declare-fun m!257333 () Bool)

(assert (=> b!237066 m!257333))

(declare-fun m!257335 () Bool)

(assert (=> bm!22032 m!257335))

(assert (=> d!59389 m!257251))

(declare-fun m!257337 () Bool)

(assert (=> bm!22030 m!257337))

(declare-fun m!257339 () Bool)

(assert (=> b!237065 m!257339))

(declare-fun m!257341 () Bool)

(assert (=> b!237060 m!257341))

(assert (=> b!237063 m!257319))

(assert (=> b!237063 m!257319))

(declare-fun m!257343 () Bool)

(assert (=> b!237063 m!257343))

(assert (=> b!237059 m!257319))

(assert (=> b!237059 m!257319))

(assert (=> b!237059 m!257331))

(declare-fun m!257345 () Bool)

(assert (=> bm!22031 m!257345))

(declare-fun m!257347 () Bool)

(assert (=> b!237070 m!257347))

(declare-fun m!257349 () Bool)

(assert (=> b!237070 m!257349))

(declare-fun m!257351 () Bool)

(assert (=> b!237070 m!257351))

(declare-fun m!257353 () Bool)

(assert (=> b!237070 m!257353))

(declare-fun m!257355 () Bool)

(assert (=> b!237070 m!257355))

(declare-fun m!257357 () Bool)

(assert (=> b!237070 m!257357))

(declare-fun m!257359 () Bool)

(assert (=> b!237070 m!257359))

(declare-fun m!257361 () Bool)

(assert (=> b!237070 m!257361))

(declare-fun m!257363 () Bool)

(assert (=> b!237070 m!257363))

(declare-fun m!257365 () Bool)

(assert (=> b!237070 m!257365))

(declare-fun m!257367 () Bool)

(assert (=> b!237070 m!257367))

(assert (=> b!237070 m!257357))

(assert (=> b!237070 m!257329))

(declare-fun m!257369 () Bool)

(assert (=> b!237070 m!257369))

(assert (=> b!237070 m!257319))

(declare-fun m!257371 () Bool)

(assert (=> b!237070 m!257371))

(assert (=> b!237070 m!257347))

(declare-fun m!257373 () Bool)

(assert (=> b!237070 m!257373))

(assert (=> b!237070 m!257361))

(assert (=> b!237070 m!257367))

(declare-fun m!257375 () Bool)

(assert (=> b!237070 m!257375))

(assert (=> b!236926 d!59389))

(declare-fun d!59391 () Bool)

(declare-fun res!116184 () Bool)

(declare-fun e!153957 () Bool)

(assert (=> d!59391 (=> (not res!116184) (not e!153957))))

(declare-fun simpleValid!239 (LongMapFixedSize!3448) Bool)

(assert (=> d!59391 (= res!116184 (simpleValid!239 thiss!1504))))

(assert (=> d!59391 (= (valid!1368 thiss!1504) e!153957)))

(declare-fun b!237080 () Bool)

(declare-fun res!116185 () Bool)

(assert (=> b!237080 (=> (not res!116185) (not e!153957))))

(declare-fun arrayCountValidKeys!0 (array!11733 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237080 (= res!116185 (= (arrayCountValidKeys!0 (_keys!6489 thiss!1504) #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))) (_size!1773 thiss!1504)))))

(declare-fun b!237081 () Bool)

(declare-fun res!116186 () Bool)

(assert (=> b!237081 (=> (not res!116186) (not e!153957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11733 (_ BitVec 32)) Bool)

(assert (=> b!237081 (= res!116186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)))))

(declare-fun b!237082 () Bool)

(declare-datatypes ((List!3558 0))(
  ( (Nil!3555) (Cons!3554 (h!4208 (_ BitVec 64)) (t!8536 List!3558)) )
))
(declare-fun arrayNoDuplicates!0 (array!11733 (_ BitVec 32) List!3558) Bool)

(assert (=> b!237082 (= e!153957 (arrayNoDuplicates!0 (_keys!6489 thiss!1504) #b00000000000000000000000000000000 Nil!3555))))

(assert (= (and d!59391 res!116184) b!237080))

(assert (= (and b!237080 res!116185) b!237081))

(assert (= (and b!237081 res!116186) b!237082))

(declare-fun m!257377 () Bool)

(assert (=> d!59391 m!257377))

(declare-fun m!257379 () Bool)

(assert (=> b!237080 m!257379))

(declare-fun m!257381 () Bool)

(assert (=> b!237081 m!257381))

(declare-fun m!257383 () Bool)

(assert (=> b!237082 m!257383))

(assert (=> start!22720 d!59391))

(declare-fun d!59393 () Bool)

(assert (=> d!59393 (= (array_inv!3675 (_keys!6489 thiss!1504)) (bvsge (size!5912 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236920 d!59393))

(declare-fun d!59395 () Bool)

(assert (=> d!59395 (= (array_inv!3676 (_values!4385 thiss!1504)) (bvsge (size!5911 (_values!4385 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!236920 d!59395))

(declare-fun condMapEmpty!10576 () Bool)

(declare-fun mapDefault!10576 () ValueCell!2774)

(assert (=> mapNonEmpty!10567 (= condMapEmpty!10576 (= mapRest!10567 ((as const (Array (_ BitVec 32) ValueCell!2774)) mapDefault!10576)))))

(declare-fun e!153962 () Bool)

(declare-fun mapRes!10576 () Bool)

(assert (=> mapNonEmpty!10567 (= tp!22306 (and e!153962 mapRes!10576))))

(declare-fun b!237090 () Bool)

(assert (=> b!237090 (= e!153962 tp_is_empty!6235)))

(declare-fun mapIsEmpty!10576 () Bool)

(assert (=> mapIsEmpty!10576 mapRes!10576))

(declare-fun mapNonEmpty!10576 () Bool)

(declare-fun tp!22321 () Bool)

(declare-fun e!153963 () Bool)

(assert (=> mapNonEmpty!10576 (= mapRes!10576 (and tp!22321 e!153963))))

(declare-fun mapValue!10576 () ValueCell!2774)

(declare-fun mapKey!10576 () (_ BitVec 32))

(declare-fun mapRest!10576 () (Array (_ BitVec 32) ValueCell!2774))

(assert (=> mapNonEmpty!10576 (= mapRest!10567 (store mapRest!10576 mapKey!10576 mapValue!10576))))

(declare-fun b!237089 () Bool)

(assert (=> b!237089 (= e!153963 tp_is_empty!6235)))

(assert (= (and mapNonEmpty!10567 condMapEmpty!10576) mapIsEmpty!10576))

(assert (= (and mapNonEmpty!10567 (not condMapEmpty!10576)) mapNonEmpty!10576))

(assert (= (and mapNonEmpty!10576 ((_ is ValueCellFull!2774) mapValue!10576)) b!237089))

(assert (= (and mapNonEmpty!10567 ((_ is ValueCellFull!2774) mapDefault!10576)) b!237090))

(declare-fun m!257385 () Bool)

(assert (=> mapNonEmpty!10576 m!257385))

(declare-fun b_lambda!7927 () Bool)

(assert (= b_lambda!7925 (or (and b!236920 b_free!6373) b_lambda!7927)))

(check-sat (not b!237066) (not b!237063) (not b_next!6373) (not bm!22032) tp_is_empty!6235 (not b!237082) (not d!59391) (not b!237081) (not b!237060) (not b!237008) (not bm!22030) (not b!237055) (not b!237065) (not d!59383) (not b!237070) (not b!237080) (not b_lambda!7927) b_and!13301 (not d!59389) (not b!236999) (not d!59387) (not bm!22031) (not b!237059) (not b!237061) (not b!237006) (not bm!22026) (not mapNonEmpty!10576))
(check-sat b_and!13301 (not b_next!6373))
(get-model)

(declare-fun b!237102 () Bool)

(declare-fun e!153966 () Bool)

(assert (=> b!237102 (= e!153966 (and (bvsge (extraKeys!4139 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4139 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1773 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!237101 () Bool)

(declare-fun res!116197 () Bool)

(assert (=> b!237101 (=> (not res!116197) (not e!153966))))

(declare-fun size!5917 (LongMapFixedSize!3448) (_ BitVec 32))

(assert (=> b!237101 (= res!116197 (= (size!5917 thiss!1504) (bvadd (_size!1773 thiss!1504) (bvsdiv (bvadd (extraKeys!4139 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!59397 () Bool)

(declare-fun res!116196 () Bool)

(assert (=> d!59397 (=> (not res!116196) (not e!153966))))

(assert (=> d!59397 (= res!116196 (validMask!0 (mask!10406 thiss!1504)))))

(assert (=> d!59397 (= (simpleValid!239 thiss!1504) e!153966)))

(declare-fun b!237099 () Bool)

(declare-fun res!116195 () Bool)

(assert (=> b!237099 (=> (not res!116195) (not e!153966))))

(assert (=> b!237099 (= res!116195 (and (= (size!5911 (_values!4385 thiss!1504)) (bvadd (mask!10406 thiss!1504) #b00000000000000000000000000000001)) (= (size!5912 (_keys!6489 thiss!1504)) (size!5911 (_values!4385 thiss!1504))) (bvsge (_size!1773 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1773 thiss!1504) (bvadd (mask!10406 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun b!237100 () Bool)

(declare-fun res!116198 () Bool)

(assert (=> b!237100 (=> (not res!116198) (not e!153966))))

(assert (=> b!237100 (= res!116198 (bvsge (size!5917 thiss!1504) (_size!1773 thiss!1504)))))

(assert (= (and d!59397 res!116196) b!237099))

(assert (= (and b!237099 res!116195) b!237100))

(assert (= (and b!237100 res!116198) b!237101))

(assert (= (and b!237101 res!116197) b!237102))

(declare-fun m!257387 () Bool)

(assert (=> b!237101 m!257387))

(assert (=> d!59397 m!257251))

(assert (=> b!237100 m!257387))

(assert (=> d!59391 d!59397))

(declare-fun d!59399 () Bool)

(declare-fun get!2866 (Option!278) V!7961)

(assert (=> d!59399 (= (apply!216 lt!119791 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)) (get!2866 (getValueByKey!272 (toList!1786 lt!119791) (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8733 () Bool)

(assert (= bs!8733 d!59399))

(assert (=> bs!8733 m!257319))

(declare-fun m!257389 () Bool)

(assert (=> bs!8733 m!257389))

(assert (=> bs!8733 m!257389))

(declare-fun m!257391 () Bool)

(assert (=> bs!8733 m!257391))

(assert (=> b!237055 d!59399))

(declare-fun d!59401 () Bool)

(declare-fun c!39517 () Bool)

(assert (=> d!59401 (= c!39517 ((_ is ValueCellFull!2774) (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!153969 () V!7961)

(assert (=> d!59401 (= (get!2865 (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!153969)))

(declare-fun b!237107 () Bool)

(declare-fun get!2867 (ValueCell!2774 V!7961) V!7961)

(assert (=> b!237107 (= e!153969 (get!2867 (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237108 () Bool)

(declare-fun get!2868 (ValueCell!2774 V!7961) V!7961)

(assert (=> b!237108 (= e!153969 (get!2868 (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59401 c!39517) b!237107))

(assert (= (and d!59401 (not c!39517)) b!237108))

(assert (=> b!237107 m!257323))

(assert (=> b!237107 m!257325))

(declare-fun m!257393 () Bool)

(assert (=> b!237107 m!257393))

(assert (=> b!237108 m!257323))

(assert (=> b!237108 m!257325))

(declare-fun m!257395 () Bool)

(assert (=> b!237108 m!257395))

(assert (=> b!237055 d!59401))

(declare-fun d!59403 () Bool)

(declare-fun e!153970 () Bool)

(assert (=> d!59403 e!153970))

(declare-fun res!116199 () Bool)

(assert (=> d!59403 (=> res!116199 e!153970)))

(declare-fun lt!119794 () Bool)

(assert (=> d!59403 (= res!116199 (not lt!119794))))

(declare-fun lt!119793 () Bool)

(assert (=> d!59403 (= lt!119794 lt!119793)))

(declare-fun lt!119792 () Unit!7284)

(declare-fun e!153971 () Unit!7284)

(assert (=> d!59403 (= lt!119792 e!153971)))

(declare-fun c!39518 () Bool)

(assert (=> d!59403 (= c!39518 lt!119793)))

(assert (=> d!59403 (= lt!119793 (containsKey!264 (toList!1786 lt!119791) (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59403 (= (contains!1671 lt!119791 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)) lt!119794)))

(declare-fun b!237109 () Bool)

(declare-fun lt!119795 () Unit!7284)

(assert (=> b!237109 (= e!153971 lt!119795)))

(assert (=> b!237109 (= lt!119795 (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1786 lt!119791) (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237109 (isDefined!214 (getValueByKey!272 (toList!1786 lt!119791) (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237110 () Bool)

(declare-fun Unit!7288 () Unit!7284)

(assert (=> b!237110 (= e!153971 Unit!7288)))

(declare-fun b!237111 () Bool)

(assert (=> b!237111 (= e!153970 (isDefined!214 (getValueByKey!272 (toList!1786 lt!119791) (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59403 c!39518) b!237109))

(assert (= (and d!59403 (not c!39518)) b!237110))

(assert (= (and d!59403 (not res!116199)) b!237111))

(assert (=> d!59403 m!257319))

(declare-fun m!257397 () Bool)

(assert (=> d!59403 m!257397))

(assert (=> b!237109 m!257319))

(declare-fun m!257399 () Bool)

(assert (=> b!237109 m!257399))

(assert (=> b!237109 m!257319))

(assert (=> b!237109 m!257389))

(assert (=> b!237109 m!257389))

(declare-fun m!257401 () Bool)

(assert (=> b!237109 m!257401))

(assert (=> b!237111 m!257319))

(assert (=> b!237111 m!257389))

(assert (=> b!237111 m!257389))

(assert (=> b!237111 m!257401))

(assert (=> b!237063 d!59403))

(declare-fun d!59405 () Bool)

(assert (=> d!59405 (isDefined!214 (getValueByKey!272 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-fun lt!119798 () Unit!7284)

(declare-fun choose!1117 (List!3555 (_ BitVec 64)) Unit!7284)

(assert (=> d!59405 (= lt!119798 (choose!1117 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(declare-fun e!153974 () Bool)

(assert (=> d!59405 e!153974))

(declare-fun res!116202 () Bool)

(assert (=> d!59405 (=> (not res!116202) (not e!153974))))

(declare-fun isStrictlySorted!360 (List!3555) Bool)

(assert (=> d!59405 (= res!116202 (isStrictlySorted!360 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))))

(assert (=> d!59405 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932) lt!119798)))

(declare-fun b!237114 () Bool)

(assert (=> b!237114 (= e!153974 (containsKey!264 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))

(assert (= (and d!59405 res!116202) b!237114))

(assert (=> d!59405 m!257315))

(assert (=> d!59405 m!257315))

(assert (=> d!59405 m!257317))

(declare-fun m!257403 () Bool)

(assert (=> d!59405 m!257403))

(declare-fun m!257405 () Bool)

(assert (=> d!59405 m!257405))

(assert (=> b!237114 m!257311))

(assert (=> b!237006 d!59405))

(declare-fun d!59407 () Bool)

(declare-fun isEmpty!520 (Option!278) Bool)

(assert (=> d!59407 (= (isDefined!214 (getValueByKey!272 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932)) (not (isEmpty!520 (getValueByKey!272 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932))))))

(declare-fun bs!8734 () Bool)

(assert (= bs!8734 d!59407))

(assert (=> bs!8734 m!257315))

(declare-fun m!257407 () Bool)

(assert (=> bs!8734 m!257407))

(assert (=> b!237006 d!59407))

(declare-fun b!237123 () Bool)

(declare-fun e!153979 () Option!278)

(assert (=> b!237123 (= e!153979 (Some!277 (_2!2330 (h!4205 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))))))))

(declare-fun b!237126 () Bool)

(declare-fun e!153980 () Option!278)

(assert (=> b!237126 (= e!153980 None!276)))

(declare-fun d!59409 () Bool)

(declare-fun c!39523 () Bool)

(assert (=> d!59409 (= c!39523 (and ((_ is Cons!3551) (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (= (_1!2330 (h!4205 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)))))

(assert (=> d!59409 (= (getValueByKey!272 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932) e!153979)))

(declare-fun b!237124 () Bool)

(assert (=> b!237124 (= e!153979 e!153980)))

(declare-fun c!39524 () Bool)

(assert (=> b!237124 (= c!39524 (and ((_ is Cons!3551) (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (not (= (_1!2330 (h!4205 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932))))))

(declare-fun b!237125 () Bool)

(assert (=> b!237125 (= e!153980 (getValueByKey!272 (t!8531 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) key!932))))

(assert (= (and d!59409 c!39523) b!237123))

(assert (= (and d!59409 (not c!39523)) b!237124))

(assert (= (and b!237124 c!39524) b!237125))

(assert (= (and b!237124 (not c!39524)) b!237126))

(declare-fun m!257409 () Bool)

(assert (=> b!237125 m!257409))

(assert (=> b!237006 d!59409))

(declare-fun d!59411 () Bool)

(declare-fun e!153981 () Bool)

(assert (=> d!59411 e!153981))

(declare-fun res!116203 () Bool)

(assert (=> d!59411 (=> res!116203 e!153981)))

(declare-fun lt!119801 () Bool)

(assert (=> d!59411 (= res!116203 (not lt!119801))))

(declare-fun lt!119800 () Bool)

(assert (=> d!59411 (= lt!119801 lt!119800)))

(declare-fun lt!119799 () Unit!7284)

(declare-fun e!153982 () Unit!7284)

(assert (=> d!59411 (= lt!119799 e!153982)))

(declare-fun c!39525 () Bool)

(assert (=> d!59411 (= c!39525 lt!119800)))

(assert (=> d!59411 (= lt!119800 (containsKey!264 (toList!1786 lt!119791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59411 (= (contains!1671 lt!119791 #b1000000000000000000000000000000000000000000000000000000000000000) lt!119801)))

(declare-fun b!237127 () Bool)

(declare-fun lt!119802 () Unit!7284)

(assert (=> b!237127 (= e!153982 lt!119802)))

(assert (=> b!237127 (= lt!119802 (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1786 lt!119791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237127 (isDefined!214 (getValueByKey!272 (toList!1786 lt!119791) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237128 () Bool)

(declare-fun Unit!7289 () Unit!7284)

(assert (=> b!237128 (= e!153982 Unit!7289)))

(declare-fun b!237129 () Bool)

(assert (=> b!237129 (= e!153981 (isDefined!214 (getValueByKey!272 (toList!1786 lt!119791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59411 c!39525) b!237127))

(assert (= (and d!59411 (not c!39525)) b!237128))

(assert (= (and d!59411 (not res!116203)) b!237129))

(declare-fun m!257411 () Bool)

(assert (=> d!59411 m!257411))

(declare-fun m!257413 () Bool)

(assert (=> b!237127 m!257413))

(declare-fun m!257415 () Bool)

(assert (=> b!237127 m!257415))

(assert (=> b!237127 m!257415))

(declare-fun m!257417 () Bool)

(assert (=> b!237127 m!257417))

(assert (=> b!237129 m!257415))

(assert (=> b!237129 m!257415))

(assert (=> b!237129 m!257417))

(assert (=> bm!22031 d!59411))

(assert (=> b!237008 d!59407))

(assert (=> b!237008 d!59409))

(declare-fun b!237138 () Bool)

(declare-fun e!153987 () (_ BitVec 32))

(declare-fun e!153988 () (_ BitVec 32))

(assert (=> b!237138 (= e!153987 e!153988)))

(declare-fun c!39531 () Bool)

(assert (=> b!237138 (= c!39531 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237139 () Bool)

(declare-fun call!22038 () (_ BitVec 32))

(assert (=> b!237139 (= e!153988 (bvadd #b00000000000000000000000000000001 call!22038))))

(declare-fun d!59413 () Bool)

(declare-fun lt!119805 () (_ BitVec 32))

(assert (=> d!59413 (and (bvsge lt!119805 #b00000000000000000000000000000000) (bvsle lt!119805 (bvsub (size!5912 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59413 (= lt!119805 e!153987)))

(declare-fun c!39530 () Bool)

(assert (=> d!59413 (= c!39530 (bvsge #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(assert (=> d!59413 (and (bvsle #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5912 (_keys!6489 thiss!1504)) (size!5912 (_keys!6489 thiss!1504))))))

(assert (=> d!59413 (= (arrayCountValidKeys!0 (_keys!6489 thiss!1504) #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))) lt!119805)))

(declare-fun b!237140 () Bool)

(assert (=> b!237140 (= e!153988 call!22038)))

(declare-fun b!237141 () Bool)

(assert (=> b!237141 (= e!153987 #b00000000000000000000000000000000)))

(declare-fun bm!22035 () Bool)

(assert (=> bm!22035 (= call!22038 (arrayCountValidKeys!0 (_keys!6489 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5912 (_keys!6489 thiss!1504))))))

(assert (= (and d!59413 c!39530) b!237141))

(assert (= (and d!59413 (not c!39530)) b!237138))

(assert (= (and b!237138 c!39531) b!237139))

(assert (= (and b!237138 (not c!39531)) b!237140))

(assert (= (or b!237139 b!237140) bm!22035))

(assert (=> b!237138 m!257319))

(assert (=> b!237138 m!257319))

(assert (=> b!237138 m!257331))

(declare-fun m!257419 () Bool)

(assert (=> bm!22035 m!257419))

(assert (=> b!237080 d!59413))

(assert (=> d!59389 d!59385))

(declare-fun bm!22038 () Bool)

(declare-fun call!22041 () ListLongMap!3541)

(assert (=> bm!22038 (= call!22041 (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4402 thiss!1504)))))

(declare-fun b!237167 () Bool)

(declare-fun e!154009 () Bool)

(declare-fun lt!119825 () ListLongMap!3541)

(declare-fun isEmpty!521 (ListLongMap!3541) Bool)

(assert (=> b!237167 (= e!154009 (isEmpty!521 lt!119825))))

(declare-fun b!237168 () Bool)

(declare-fun res!116212 () Bool)

(declare-fun e!154007 () Bool)

(assert (=> b!237168 (=> (not res!116212) (not e!154007))))

(assert (=> b!237168 (= res!116212 (not (contains!1671 lt!119825 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237169 () Bool)

(declare-fun e!154006 () Bool)

(assert (=> b!237169 (= e!154006 e!154009)))

(declare-fun c!39541 () Bool)

(assert (=> b!237169 (= c!39541 (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun b!237170 () Bool)

(declare-fun e!154008 () Bool)

(assert (=> b!237170 (= e!154008 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237170 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!237171 () Bool)

(declare-fun e!154004 () ListLongMap!3541)

(declare-fun e!154003 () ListLongMap!3541)

(assert (=> b!237171 (= e!154004 e!154003)))

(declare-fun c!39542 () Bool)

(assert (=> b!237171 (= c!39542 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!237172 () Bool)

(assert (=> b!237172 (= e!154004 (ListLongMap!3542 Nil!3552))))

(declare-fun b!237173 () Bool)

(declare-fun e!154005 () Bool)

(assert (=> b!237173 (= e!154006 e!154005)))

(assert (=> b!237173 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun res!116215 () Bool)

(assert (=> b!237173 (= res!116215 (contains!1671 lt!119825 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!237173 (=> (not res!116215) (not e!154005))))

(declare-fun b!237174 () Bool)

(assert (=> b!237174 (= e!154003 call!22041)))

(declare-fun b!237175 () Bool)

(assert (=> b!237175 (= e!154009 (= lt!119825 (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4402 thiss!1504))))))

(declare-fun d!59415 () Bool)

(assert (=> d!59415 e!154007))

(declare-fun res!116213 () Bool)

(assert (=> d!59415 (=> (not res!116213) (not e!154007))))

(assert (=> d!59415 (= res!116213 (not (contains!1671 lt!119825 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59415 (= lt!119825 e!154004)))

(declare-fun c!39540 () Bool)

(assert (=> d!59415 (= c!39540 (bvsge #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(assert (=> d!59415 (validMask!0 (mask!10406 thiss!1504))))

(assert (=> d!59415 (= (getCurrentListMapNoExtraKeys!532 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)) lt!119825)))

(declare-fun b!237166 () Bool)

(declare-fun lt!119826 () Unit!7284)

(declare-fun lt!119821 () Unit!7284)

(assert (=> b!237166 (= lt!119826 lt!119821)))

(declare-fun lt!119820 () (_ BitVec 64))

(declare-fun lt!119822 () ListLongMap!3541)

(declare-fun lt!119823 () (_ BitVec 64))

(declare-fun lt!119824 () V!7961)

(assert (=> b!237166 (not (contains!1671 (+!649 lt!119822 (tuple2!4639 lt!119820 lt!119824)) lt!119823))))

(declare-fun addStillNotContains!118 (ListLongMap!3541 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7284)

(assert (=> b!237166 (= lt!119821 (addStillNotContains!118 lt!119822 lt!119820 lt!119824 lt!119823))))

(assert (=> b!237166 (= lt!119823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!237166 (= lt!119824 (get!2865 (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!237166 (= lt!119820 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!237166 (= lt!119822 call!22041)))

(assert (=> b!237166 (= e!154003 (+!649 call!22041 (tuple2!4639 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000) (get!2865 (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!237176 () Bool)

(assert (=> b!237176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(assert (=> b!237176 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5911 (_values!4385 thiss!1504))))))

(assert (=> b!237176 (= e!154005 (= (apply!216 lt!119825 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)) (get!2865 (select (arr!5571 (_values!4385 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!550 (defaultEntry!4402 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!237177 () Bool)

(assert (=> b!237177 (= e!154007 e!154006)))

(declare-fun c!39543 () Bool)

(assert (=> b!237177 (= c!39543 e!154008)))

(declare-fun res!116214 () Bool)

(assert (=> b!237177 (=> (not res!116214) (not e!154008))))

(assert (=> b!237177 (= res!116214 (bvslt #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(assert (= (and d!59415 c!39540) b!237172))

(assert (= (and d!59415 (not c!39540)) b!237171))

(assert (= (and b!237171 c!39542) b!237166))

(assert (= (and b!237171 (not c!39542)) b!237174))

(assert (= (or b!237166 b!237174) bm!22038))

(assert (= (and d!59415 res!116213) b!237168))

(assert (= (and b!237168 res!116212) b!237177))

(assert (= (and b!237177 res!116214) b!237170))

(assert (= (and b!237177 c!39543) b!237173))

(assert (= (and b!237177 (not c!39543)) b!237169))

(assert (= (and b!237173 res!116215) b!237176))

(assert (= (and b!237169 c!39541) b!237175))

(assert (= (and b!237169 (not c!39541)) b!237167))

(declare-fun b_lambda!7929 () Bool)

(assert (=> (not b_lambda!7929) (not b!237166)))

(assert (=> b!237166 t!8535))

(declare-fun b_and!13303 () Bool)

(assert (= b_and!13301 (and (=> t!8535 result!5149) b_and!13303)))

(declare-fun b_lambda!7931 () Bool)

(assert (=> (not b_lambda!7931) (not b!237176)))

(assert (=> b!237176 t!8535))

(declare-fun b_and!13305 () Bool)

(assert (= b_and!13303 (and (=> t!8535 result!5149) b_and!13305)))

(declare-fun m!257421 () Bool)

(assert (=> d!59415 m!257421))

(assert (=> d!59415 m!257251))

(declare-fun m!257423 () Bool)

(assert (=> b!237175 m!257423))

(assert (=> bm!22038 m!257423))

(assert (=> b!237176 m!257325))

(assert (=> b!237176 m!257319))

(assert (=> b!237176 m!257323))

(assert (=> b!237176 m!257325))

(assert (=> b!237176 m!257327))

(assert (=> b!237176 m!257319))

(declare-fun m!257425 () Bool)

(assert (=> b!237176 m!257425))

(assert (=> b!237176 m!257323))

(assert (=> b!237173 m!257319))

(assert (=> b!237173 m!257319))

(declare-fun m!257427 () Bool)

(assert (=> b!237173 m!257427))

(declare-fun m!257429 () Bool)

(assert (=> b!237166 m!257429))

(assert (=> b!237166 m!257325))

(assert (=> b!237166 m!257319))

(assert (=> b!237166 m!257429))

(declare-fun m!257431 () Bool)

(assert (=> b!237166 m!257431))

(assert (=> b!237166 m!257323))

(assert (=> b!237166 m!257325))

(assert (=> b!237166 m!257327))

(assert (=> b!237166 m!257323))

(declare-fun m!257433 () Bool)

(assert (=> b!237166 m!257433))

(declare-fun m!257435 () Bool)

(assert (=> b!237166 m!257435))

(assert (=> b!237170 m!257319))

(assert (=> b!237170 m!257319))

(assert (=> b!237170 m!257331))

(declare-fun m!257437 () Bool)

(assert (=> b!237168 m!257437))

(assert (=> b!237171 m!257319))

(assert (=> b!237171 m!257319))

(assert (=> b!237171 m!257331))

(declare-fun m!257439 () Bool)

(assert (=> b!237167 m!257439))

(assert (=> bm!22026 d!59415))

(declare-fun b!237196 () Bool)

(declare-fun e!154022 () Bool)

(declare-fun e!154021 () Bool)

(assert (=> b!237196 (= e!154022 e!154021)))

(declare-fun res!116223 () Bool)

(declare-fun lt!119832 () SeekEntryResult!1004)

(assert (=> b!237196 (= res!116223 (and ((_ is Intermediate!1004) lt!119832) (not (undefined!1816 lt!119832)) (bvslt (x!23929 lt!119832) #b01111111111111111111111111111110) (bvsge (x!23929 lt!119832) #b00000000000000000000000000000000) (bvsge (x!23929 lt!119832) #b00000000000000000000000000000000)))))

(assert (=> b!237196 (=> (not res!116223) (not e!154021))))

(declare-fun b!237197 () Bool)

(declare-fun e!154020 () SeekEntryResult!1004)

(assert (=> b!237197 (= e!154020 (Intermediate!1004 false (toIndex!0 key!932 (mask!10406 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237198 () Bool)

(assert (=> b!237198 (and (bvsge (index!6188 lt!119832) #b00000000000000000000000000000000) (bvslt (index!6188 lt!119832) (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun e!154023 () Bool)

(assert (=> b!237198 (= e!154023 (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6188 lt!119832)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!59417 () Bool)

(assert (=> d!59417 e!154022))

(declare-fun c!39551 () Bool)

(assert (=> d!59417 (= c!39551 (and ((_ is Intermediate!1004) lt!119832) (undefined!1816 lt!119832)))))

(declare-fun e!154024 () SeekEntryResult!1004)

(assert (=> d!59417 (= lt!119832 e!154024)))

(declare-fun c!39550 () Bool)

(assert (=> d!59417 (= c!39550 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!119831 () (_ BitVec 64))

(assert (=> d!59417 (= lt!119831 (select (arr!5572 (_keys!6489 thiss!1504)) (toIndex!0 key!932 (mask!10406 thiss!1504))))))

(assert (=> d!59417 (validMask!0 (mask!10406 thiss!1504))))

(assert (=> d!59417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10406 thiss!1504)) key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)) lt!119832)))

(declare-fun b!237199 () Bool)

(assert (=> b!237199 (and (bvsge (index!6188 lt!119832) #b00000000000000000000000000000000) (bvslt (index!6188 lt!119832) (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun res!116222 () Bool)

(assert (=> b!237199 (= res!116222 (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6188 lt!119832)) key!932))))

(assert (=> b!237199 (=> res!116222 e!154023)))

(assert (=> b!237199 (= e!154021 e!154023)))

(declare-fun b!237200 () Bool)

(assert (=> b!237200 (= e!154024 (Intermediate!1004 true (toIndex!0 key!932 (mask!10406 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!237201 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!237201 (= e!154020 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10406 thiss!1504)) #b00000000000000000000000000000000 (mask!10406 thiss!1504)) key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)))))

(declare-fun b!237202 () Bool)

(assert (=> b!237202 (and (bvsge (index!6188 lt!119832) #b00000000000000000000000000000000) (bvslt (index!6188 lt!119832) (size!5912 (_keys!6489 thiss!1504))))))

(declare-fun res!116224 () Bool)

(assert (=> b!237202 (= res!116224 (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6188 lt!119832)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237202 (=> res!116224 e!154023)))

(declare-fun b!237203 () Bool)

(assert (=> b!237203 (= e!154024 e!154020)))

(declare-fun c!39552 () Bool)

(assert (=> b!237203 (= c!39552 (or (= lt!119831 key!932) (= (bvadd lt!119831 lt!119831) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!237204 () Bool)

(assert (=> b!237204 (= e!154022 (bvsge (x!23929 lt!119832) #b01111111111111111111111111111110))))

(assert (= (and d!59417 c!39550) b!237200))

(assert (= (and d!59417 (not c!39550)) b!237203))

(assert (= (and b!237203 c!39552) b!237197))

(assert (= (and b!237203 (not c!39552)) b!237201))

(assert (= (and d!59417 c!39551) b!237204))

(assert (= (and d!59417 (not c!39551)) b!237196))

(assert (= (and b!237196 res!116223) b!237199))

(assert (= (and b!237199 (not res!116222)) b!237202))

(assert (= (and b!237202 (not res!116224)) b!237198))

(declare-fun m!257441 () Bool)

(assert (=> b!237202 m!257441))

(assert (=> b!237198 m!257441))

(assert (=> b!237201 m!257297))

(declare-fun m!257443 () Bool)

(assert (=> b!237201 m!257443))

(assert (=> b!237201 m!257443))

(declare-fun m!257445 () Bool)

(assert (=> b!237201 m!257445))

(assert (=> d!59417 m!257297))

(declare-fun m!257447 () Bool)

(assert (=> d!59417 m!257447))

(assert (=> d!59417 m!257251))

(assert (=> b!237199 m!257441))

(assert (=> d!59383 d!59417))

(declare-fun d!59419 () Bool)

(declare-fun lt!119838 () (_ BitVec 32))

(declare-fun lt!119837 () (_ BitVec 32))

(assert (=> d!59419 (= lt!119838 (bvmul (bvxor lt!119837 (bvlshr lt!119837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59419 (= lt!119837 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59419 (and (bvsge (mask!10406 thiss!1504) #b00000000000000000000000000000000) (let ((res!116225 (let ((h!4209 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23947 (bvmul (bvxor h!4209 (bvlshr h!4209 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23947 (bvlshr x!23947 #b00000000000000000000000000001101)) (mask!10406 thiss!1504)))))) (and (bvslt res!116225 (bvadd (mask!10406 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!116225 #b00000000000000000000000000000000))))))

(assert (=> d!59419 (= (toIndex!0 key!932 (mask!10406 thiss!1504)) (bvand (bvxor lt!119838 (bvlshr lt!119838 #b00000000000000000000000000001101)) (mask!10406 thiss!1504)))))

(assert (=> d!59383 d!59419))

(assert (=> d!59383 d!59385))

(declare-fun d!59421 () Bool)

(assert (=> d!59421 (= (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!237061 d!59421))

(declare-fun b!237217 () Bool)

(declare-fun e!154032 () SeekEntryResult!1004)

(assert (=> b!237217 (= e!154032 (Found!1004 (index!6188 lt!119711)))))

(declare-fun e!154031 () SeekEntryResult!1004)

(declare-fun b!237218 () Bool)

(assert (=> b!237218 (= e!154031 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23929 lt!119711) #b00000000000000000000000000000001) (nextIndex!0 (index!6188 lt!119711) (x!23929 lt!119711) (mask!10406 thiss!1504)) (index!6188 lt!119711) key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)))))

(declare-fun b!237219 () Bool)

(declare-fun e!154033 () SeekEntryResult!1004)

(assert (=> b!237219 (= e!154033 e!154032)))

(declare-fun c!39560 () Bool)

(declare-fun lt!119844 () (_ BitVec 64))

(assert (=> b!237219 (= c!39560 (= lt!119844 key!932))))

(declare-fun b!237220 () Bool)

(assert (=> b!237220 (= e!154033 Undefined!1004)))

(declare-fun b!237221 () Bool)

(declare-fun c!39559 () Bool)

(assert (=> b!237221 (= c!39559 (= lt!119844 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237221 (= e!154032 e!154031)))

(declare-fun lt!119843 () SeekEntryResult!1004)

(declare-fun d!59423 () Bool)

(assert (=> d!59423 (and (or ((_ is Undefined!1004) lt!119843) (not ((_ is Found!1004) lt!119843)) (and (bvsge (index!6187 lt!119843) #b00000000000000000000000000000000) (bvslt (index!6187 lt!119843) (size!5912 (_keys!6489 thiss!1504))))) (or ((_ is Undefined!1004) lt!119843) ((_ is Found!1004) lt!119843) (not ((_ is MissingVacant!1004) lt!119843)) (not (= (index!6189 lt!119843) (index!6188 lt!119711))) (and (bvsge (index!6189 lt!119843) #b00000000000000000000000000000000) (bvslt (index!6189 lt!119843) (size!5912 (_keys!6489 thiss!1504))))) (or ((_ is Undefined!1004) lt!119843) (ite ((_ is Found!1004) lt!119843) (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6187 lt!119843)) key!932) (and ((_ is MissingVacant!1004) lt!119843) (= (index!6189 lt!119843) (index!6188 lt!119711)) (= (select (arr!5572 (_keys!6489 thiss!1504)) (index!6189 lt!119843)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!59423 (= lt!119843 e!154033)))

(declare-fun c!39561 () Bool)

(assert (=> d!59423 (= c!39561 (bvsge (x!23929 lt!119711) #b01111111111111111111111111111110))))

(assert (=> d!59423 (= lt!119844 (select (arr!5572 (_keys!6489 thiss!1504)) (index!6188 lt!119711)))))

(assert (=> d!59423 (validMask!0 (mask!10406 thiss!1504))))

(assert (=> d!59423 (= (seekKeyOrZeroReturnVacant!0 (x!23929 lt!119711) (index!6188 lt!119711) (index!6188 lt!119711) key!932 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)) lt!119843)))

(declare-fun b!237222 () Bool)

(assert (=> b!237222 (= e!154031 (MissingVacant!1004 (index!6188 lt!119711)))))

(assert (= (and d!59423 c!39561) b!237220))

(assert (= (and d!59423 (not c!39561)) b!237219))

(assert (= (and b!237219 c!39560) b!237217))

(assert (= (and b!237219 (not c!39560)) b!237221))

(assert (= (and b!237221 c!39559) b!237222))

(assert (= (and b!237221 (not c!39559)) b!237218))

(declare-fun m!257449 () Bool)

(assert (=> b!237218 m!257449))

(assert (=> b!237218 m!257449))

(declare-fun m!257451 () Bool)

(assert (=> b!237218 m!257451))

(declare-fun m!257453 () Bool)

(assert (=> d!59423 m!257453))

(declare-fun m!257455 () Bool)

(assert (=> d!59423 m!257455))

(assert (=> d!59423 m!257307))

(assert (=> d!59423 m!257251))

(assert (=> b!236999 d!59423))

(declare-fun d!59425 () Bool)

(declare-fun e!154034 () Bool)

(assert (=> d!59425 e!154034))

(declare-fun res!116226 () Bool)

(assert (=> d!59425 (=> res!116226 e!154034)))

(declare-fun lt!119847 () Bool)

(assert (=> d!59425 (= res!116226 (not lt!119847))))

(declare-fun lt!119846 () Bool)

(assert (=> d!59425 (= lt!119847 lt!119846)))

(declare-fun lt!119845 () Unit!7284)

(declare-fun e!154035 () Unit!7284)

(assert (=> d!59425 (= lt!119845 e!154035)))

(declare-fun c!39562 () Bool)

(assert (=> d!59425 (= c!39562 lt!119846)))

(assert (=> d!59425 (= lt!119846 (containsKey!264 (toList!1786 lt!119791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59425 (= (contains!1671 lt!119791 #b0000000000000000000000000000000000000000000000000000000000000000) lt!119847)))

(declare-fun b!237223 () Bool)

(declare-fun lt!119848 () Unit!7284)

(assert (=> b!237223 (= e!154035 lt!119848)))

(assert (=> b!237223 (= lt!119848 (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1786 lt!119791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!237223 (isDefined!214 (getValueByKey!272 (toList!1786 lt!119791) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237224 () Bool)

(declare-fun Unit!7290 () Unit!7284)

(assert (=> b!237224 (= e!154035 Unit!7290)))

(declare-fun b!237225 () Bool)

(assert (=> b!237225 (= e!154034 (isDefined!214 (getValueByKey!272 (toList!1786 lt!119791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59425 c!39562) b!237223))

(assert (= (and d!59425 (not c!39562)) b!237224))

(assert (= (and d!59425 (not res!116226)) b!237225))

(declare-fun m!257457 () Bool)

(assert (=> d!59425 m!257457))

(declare-fun m!257459 () Bool)

(assert (=> b!237223 m!257459))

(declare-fun m!257461 () Bool)

(assert (=> b!237223 m!257461))

(assert (=> b!237223 m!257461))

(declare-fun m!257463 () Bool)

(assert (=> b!237223 m!257463))

(assert (=> b!237225 m!257461))

(assert (=> b!237225 m!257461))

(assert (=> b!237225 m!257463))

(assert (=> bm!22030 d!59425))

(declare-fun d!59427 () Bool)

(assert (=> d!59427 (= (apply!216 (+!649 lt!119772 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))) lt!119783) (get!2866 (getValueByKey!272 (toList!1786 (+!649 lt!119772 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504)))) lt!119783)))))

(declare-fun bs!8735 () Bool)

(assert (= bs!8735 d!59427))

(declare-fun m!257465 () Bool)

(assert (=> bs!8735 m!257465))

(assert (=> bs!8735 m!257465))

(declare-fun m!257467 () Bool)

(assert (=> bs!8735 m!257467))

(assert (=> b!237070 d!59427))

(declare-fun d!59429 () Bool)

(declare-fun e!154038 () Bool)

(assert (=> d!59429 e!154038))

(declare-fun res!116231 () Bool)

(assert (=> d!59429 (=> (not res!116231) (not e!154038))))

(declare-fun lt!119859 () ListLongMap!3541)

(assert (=> d!59429 (= res!116231 (contains!1671 lt!119859 (_1!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))))))

(declare-fun lt!119860 () List!3555)

(assert (=> d!59429 (= lt!119859 (ListLongMap!3542 lt!119860))))

(declare-fun lt!119857 () Unit!7284)

(declare-fun lt!119858 () Unit!7284)

(assert (=> d!59429 (= lt!119857 lt!119858)))

(assert (=> d!59429 (= (getValueByKey!272 lt!119860 (_1!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!154 (List!3555 (_ BitVec 64) V!7961) Unit!7284)

(assert (=> d!59429 (= lt!119858 (lemmaContainsTupThenGetReturnValue!154 lt!119860 (_1!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))))))

(declare-fun insertStrictlySorted!157 (List!3555 (_ BitVec 64) V!7961) List!3555)

(assert (=> d!59429 (= lt!119860 (insertStrictlySorted!157 (toList!1786 lt!119771) (_1!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59429 (= (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))) lt!119859)))

(declare-fun b!237230 () Bool)

(declare-fun res!116232 () Bool)

(assert (=> b!237230 (=> (not res!116232) (not e!154038))))

(assert (=> b!237230 (= res!116232 (= (getValueByKey!272 (toList!1786 lt!119859) (_1!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))))))))

(declare-fun b!237231 () Bool)

(declare-fun contains!1674 (List!3555 tuple2!4638) Bool)

(assert (=> b!237231 (= e!154038 (contains!1674 (toList!1786 lt!119859) (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))))))

(assert (= (and d!59429 res!116231) b!237230))

(assert (= (and b!237230 res!116232) b!237231))

(declare-fun m!257469 () Bool)

(assert (=> d!59429 m!257469))

(declare-fun m!257471 () Bool)

(assert (=> d!59429 m!257471))

(declare-fun m!257473 () Bool)

(assert (=> d!59429 m!257473))

(declare-fun m!257475 () Bool)

(assert (=> d!59429 m!257475))

(declare-fun m!257477 () Bool)

(assert (=> b!237230 m!257477))

(declare-fun m!257479 () Bool)

(assert (=> b!237231 m!257479))

(assert (=> b!237070 d!59429))

(declare-fun d!59431 () Bool)

(assert (=> d!59431 (= (apply!216 (+!649 lt!119772 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))) lt!119783) (apply!216 lt!119772 lt!119783))))

(declare-fun lt!119863 () Unit!7284)

(declare-fun choose!1118 (ListLongMap!3541 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7284)

(assert (=> d!59431 (= lt!119863 (choose!1118 lt!119772 lt!119782 (zeroValue!4243 thiss!1504) lt!119783))))

(declare-fun e!154041 () Bool)

(assert (=> d!59431 e!154041))

(declare-fun res!116235 () Bool)

(assert (=> d!59431 (=> (not res!116235) (not e!154041))))

(assert (=> d!59431 (= res!116235 (contains!1671 lt!119772 lt!119783))))

(assert (=> d!59431 (= (addApplyDifferent!192 lt!119772 lt!119782 (zeroValue!4243 thiss!1504) lt!119783) lt!119863)))

(declare-fun b!237235 () Bool)

(assert (=> b!237235 (= e!154041 (not (= lt!119783 lt!119782)))))

(assert (= (and d!59431 res!116235) b!237235))

(declare-fun m!257481 () Bool)

(assert (=> d!59431 m!257481))

(assert (=> d!59431 m!257351))

(declare-fun m!257483 () Bool)

(assert (=> d!59431 m!257483))

(assert (=> d!59431 m!257361))

(assert (=> d!59431 m!257361))

(assert (=> d!59431 m!257363))

(assert (=> b!237070 d!59431))

(declare-fun d!59433 () Bool)

(assert (=> d!59433 (contains!1671 (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))) lt!119789)))

(declare-fun lt!119866 () Unit!7284)

(declare-fun choose!1119 (ListLongMap!3541 (_ BitVec 64) V!7961 (_ BitVec 64)) Unit!7284)

(assert (=> d!59433 (= lt!119866 (choose!1119 lt!119771 lt!119775 (zeroValue!4243 thiss!1504) lt!119789))))

(assert (=> d!59433 (contains!1671 lt!119771 lt!119789)))

(assert (=> d!59433 (= (addStillContains!192 lt!119771 lt!119775 (zeroValue!4243 thiss!1504) lt!119789) lt!119866)))

(declare-fun bs!8736 () Bool)

(assert (= bs!8736 d!59433))

(assert (=> bs!8736 m!257347))

(assert (=> bs!8736 m!257347))

(assert (=> bs!8736 m!257349))

(declare-fun m!257485 () Bool)

(assert (=> bs!8736 m!257485))

(declare-fun m!257487 () Bool)

(assert (=> bs!8736 m!257487))

(assert (=> b!237070 d!59433))

(declare-fun d!59435 () Bool)

(assert (=> d!59435 (= (apply!216 (+!649 lt!119787 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))) lt!119774) (apply!216 lt!119787 lt!119774))))

(declare-fun lt!119867 () Unit!7284)

(assert (=> d!59435 (= lt!119867 (choose!1118 lt!119787 lt!119781 (minValue!4243 thiss!1504) lt!119774))))

(declare-fun e!154042 () Bool)

(assert (=> d!59435 e!154042))

(declare-fun res!116236 () Bool)

(assert (=> d!59435 (=> (not res!116236) (not e!154042))))

(assert (=> d!59435 (= res!116236 (contains!1671 lt!119787 lt!119774))))

(assert (=> d!59435 (= (addApplyDifferent!192 lt!119787 lt!119781 (minValue!4243 thiss!1504) lt!119774) lt!119867)))

(declare-fun b!237237 () Bool)

(assert (=> b!237237 (= e!154042 (not (= lt!119774 lt!119781)))))

(assert (= (and d!59435 res!116236) b!237237))

(declare-fun m!257489 () Bool)

(assert (=> d!59435 m!257489))

(assert (=> d!59435 m!257369))

(declare-fun m!257491 () Bool)

(assert (=> d!59435 m!257491))

(assert (=> d!59435 m!257367))

(assert (=> d!59435 m!257367))

(assert (=> d!59435 m!257375))

(assert (=> b!237070 d!59435))

(declare-fun d!59437 () Bool)

(declare-fun e!154043 () Bool)

(assert (=> d!59437 e!154043))

(declare-fun res!116237 () Bool)

(assert (=> d!59437 (=> (not res!116237) (not e!154043))))

(declare-fun lt!119870 () ListLongMap!3541)

(assert (=> d!59437 (= res!116237 (contains!1671 lt!119870 (_1!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504)))))))

(declare-fun lt!119871 () List!3555)

(assert (=> d!59437 (= lt!119870 (ListLongMap!3542 lt!119871))))

(declare-fun lt!119868 () Unit!7284)

(declare-fun lt!119869 () Unit!7284)

(assert (=> d!59437 (= lt!119868 lt!119869)))

(assert (=> d!59437 (= (getValueByKey!272 lt!119871 (_1!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59437 (= lt!119869 (lemmaContainsTupThenGetReturnValue!154 lt!119871 (_1!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59437 (= lt!119871 (insertStrictlySorted!157 (toList!1786 lt!119772) (_1!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504)))))))

(assert (=> d!59437 (= (+!649 lt!119772 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))) lt!119870)))

(declare-fun b!237238 () Bool)

(declare-fun res!116238 () Bool)

(assert (=> b!237238 (=> (not res!116238) (not e!154043))))

(assert (=> b!237238 (= res!116238 (= (getValueByKey!272 (toList!1786 lt!119870) (_1!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))))))))

(declare-fun b!237239 () Bool)

(assert (=> b!237239 (= e!154043 (contains!1674 (toList!1786 lt!119870) (tuple2!4639 lt!119782 (zeroValue!4243 thiss!1504))))))

(assert (= (and d!59437 res!116237) b!237238))

(assert (= (and b!237238 res!116238) b!237239))

(declare-fun m!257493 () Bool)

(assert (=> d!59437 m!257493))

(declare-fun m!257495 () Bool)

(assert (=> d!59437 m!257495))

(declare-fun m!257497 () Bool)

(assert (=> d!59437 m!257497))

(declare-fun m!257499 () Bool)

(assert (=> d!59437 m!257499))

(declare-fun m!257501 () Bool)

(assert (=> b!237238 m!257501))

(declare-fun m!257503 () Bool)

(assert (=> b!237239 m!257503))

(assert (=> b!237070 d!59437))

(declare-fun d!59439 () Bool)

(assert (=> d!59439 (= (apply!216 (+!649 lt!119787 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))) lt!119774) (get!2866 (getValueByKey!272 (toList!1786 (+!649 lt!119787 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504)))) lt!119774)))))

(declare-fun bs!8737 () Bool)

(assert (= bs!8737 d!59439))

(declare-fun m!257505 () Bool)

(assert (=> bs!8737 m!257505))

(assert (=> bs!8737 m!257505))

(declare-fun m!257507 () Bool)

(assert (=> bs!8737 m!257507))

(assert (=> b!237070 d!59439))

(declare-fun d!59441 () Bool)

(assert (=> d!59441 (= (apply!216 (+!649 lt!119778 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))) lt!119777) (apply!216 lt!119778 lt!119777))))

(declare-fun lt!119872 () Unit!7284)

(assert (=> d!59441 (= lt!119872 (choose!1118 lt!119778 lt!119785 (minValue!4243 thiss!1504) lt!119777))))

(declare-fun e!154044 () Bool)

(assert (=> d!59441 e!154044))

(declare-fun res!116239 () Bool)

(assert (=> d!59441 (=> (not res!116239) (not e!154044))))

(assert (=> d!59441 (= res!116239 (contains!1671 lt!119778 lt!119777))))

(assert (=> d!59441 (= (addApplyDifferent!192 lt!119778 lt!119785 (minValue!4243 thiss!1504) lt!119777) lt!119872)))

(declare-fun b!237240 () Bool)

(assert (=> b!237240 (= e!154044 (not (= lt!119777 lt!119785)))))

(assert (= (and d!59441 res!116239) b!237240))

(declare-fun m!257509 () Bool)

(assert (=> d!59441 m!257509))

(assert (=> d!59441 m!257365))

(declare-fun m!257511 () Bool)

(assert (=> d!59441 m!257511))

(assert (=> d!59441 m!257357))

(assert (=> d!59441 m!257357))

(assert (=> d!59441 m!257359))

(assert (=> b!237070 d!59441))

(declare-fun d!59443 () Bool)

(assert (=> d!59443 (= (apply!216 lt!119778 lt!119777) (get!2866 (getValueByKey!272 (toList!1786 lt!119778) lt!119777)))))

(declare-fun bs!8738 () Bool)

(assert (= bs!8738 d!59443))

(declare-fun m!257513 () Bool)

(assert (=> bs!8738 m!257513))

(assert (=> bs!8738 m!257513))

(declare-fun m!257515 () Bool)

(assert (=> bs!8738 m!257515))

(assert (=> b!237070 d!59443))

(declare-fun d!59445 () Bool)

(declare-fun e!154045 () Bool)

(assert (=> d!59445 e!154045))

(declare-fun res!116240 () Bool)

(assert (=> d!59445 (=> (not res!116240) (not e!154045))))

(declare-fun lt!119875 () ListLongMap!3541)

(assert (=> d!59445 (= res!116240 (contains!1671 lt!119875 (_1!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504)))))))

(declare-fun lt!119876 () List!3555)

(assert (=> d!59445 (= lt!119875 (ListLongMap!3542 lt!119876))))

(declare-fun lt!119873 () Unit!7284)

(declare-fun lt!119874 () Unit!7284)

(assert (=> d!59445 (= lt!119873 lt!119874)))

(assert (=> d!59445 (= (getValueByKey!272 lt!119876 (_1!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504)))))))

(assert (=> d!59445 (= lt!119874 (lemmaContainsTupThenGetReturnValue!154 lt!119876 (_1!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504)))))))

(assert (=> d!59445 (= lt!119876 (insertStrictlySorted!157 (toList!1786 lt!119787) (_1!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504)))))))

(assert (=> d!59445 (= (+!649 lt!119787 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))) lt!119875)))

(declare-fun b!237241 () Bool)

(declare-fun res!116241 () Bool)

(assert (=> b!237241 (=> (not res!116241) (not e!154045))))

(assert (=> b!237241 (= res!116241 (= (getValueByKey!272 (toList!1786 lt!119875) (_1!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))))))))

(declare-fun b!237242 () Bool)

(assert (=> b!237242 (= e!154045 (contains!1674 (toList!1786 lt!119875) (tuple2!4639 lt!119781 (minValue!4243 thiss!1504))))))

(assert (= (and d!59445 res!116240) b!237241))

(assert (= (and b!237241 res!116241) b!237242))

(declare-fun m!257517 () Bool)

(assert (=> d!59445 m!257517))

(declare-fun m!257519 () Bool)

(assert (=> d!59445 m!257519))

(declare-fun m!257521 () Bool)

(assert (=> d!59445 m!257521))

(declare-fun m!257523 () Bool)

(assert (=> d!59445 m!257523))

(declare-fun m!257525 () Bool)

(assert (=> b!237241 m!257525))

(declare-fun m!257527 () Bool)

(assert (=> b!237242 m!257527))

(assert (=> b!237070 d!59445))

(declare-fun d!59447 () Bool)

(assert (=> d!59447 (= (apply!216 lt!119787 lt!119774) (get!2866 (getValueByKey!272 (toList!1786 lt!119787) lt!119774)))))

(declare-fun bs!8739 () Bool)

(assert (= bs!8739 d!59447))

(declare-fun m!257529 () Bool)

(assert (=> bs!8739 m!257529))

(assert (=> bs!8739 m!257529))

(declare-fun m!257531 () Bool)

(assert (=> bs!8739 m!257531))

(assert (=> b!237070 d!59447))

(declare-fun d!59449 () Bool)

(declare-fun e!154046 () Bool)

(assert (=> d!59449 e!154046))

(declare-fun res!116242 () Bool)

(assert (=> d!59449 (=> res!116242 e!154046)))

(declare-fun lt!119879 () Bool)

(assert (=> d!59449 (= res!116242 (not lt!119879))))

(declare-fun lt!119878 () Bool)

(assert (=> d!59449 (= lt!119879 lt!119878)))

(declare-fun lt!119877 () Unit!7284)

(declare-fun e!154047 () Unit!7284)

(assert (=> d!59449 (= lt!119877 e!154047)))

(declare-fun c!39563 () Bool)

(assert (=> d!59449 (= c!39563 lt!119878)))

(assert (=> d!59449 (= lt!119878 (containsKey!264 (toList!1786 (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))) lt!119789))))

(assert (=> d!59449 (= (contains!1671 (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504))) lt!119789) lt!119879)))

(declare-fun b!237243 () Bool)

(declare-fun lt!119880 () Unit!7284)

(assert (=> b!237243 (= e!154047 lt!119880)))

(assert (=> b!237243 (= lt!119880 (lemmaContainsKeyImpliesGetValueByKeyDefined!213 (toList!1786 (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))) lt!119789))))

(assert (=> b!237243 (isDefined!214 (getValueByKey!272 (toList!1786 (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))) lt!119789))))

(declare-fun b!237244 () Bool)

(declare-fun Unit!7291 () Unit!7284)

(assert (=> b!237244 (= e!154047 Unit!7291)))

(declare-fun b!237245 () Bool)

(assert (=> b!237245 (= e!154046 (isDefined!214 (getValueByKey!272 (toList!1786 (+!649 lt!119771 (tuple2!4639 lt!119775 (zeroValue!4243 thiss!1504)))) lt!119789)))))

(assert (= (and d!59449 c!39563) b!237243))

(assert (= (and d!59449 (not c!39563)) b!237244))

(assert (= (and d!59449 (not res!116242)) b!237245))

(declare-fun m!257533 () Bool)

(assert (=> d!59449 m!257533))

(declare-fun m!257535 () Bool)

(assert (=> b!237243 m!257535))

(declare-fun m!257537 () Bool)

(assert (=> b!237243 m!257537))

(assert (=> b!237243 m!257537))

(declare-fun m!257539 () Bool)

(assert (=> b!237243 m!257539))

(assert (=> b!237245 m!257537))

(assert (=> b!237245 m!257537))

(assert (=> b!237245 m!257539))

(assert (=> b!237070 d!59449))

(declare-fun d!59451 () Bool)

(declare-fun e!154048 () Bool)

(assert (=> d!59451 e!154048))

(declare-fun res!116243 () Bool)

(assert (=> d!59451 (=> (not res!116243) (not e!154048))))

(declare-fun lt!119883 () ListLongMap!3541)

(assert (=> d!59451 (= res!116243 (contains!1671 lt!119883 (_1!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504)))))))

(declare-fun lt!119884 () List!3555)

(assert (=> d!59451 (= lt!119883 (ListLongMap!3542 lt!119884))))

(declare-fun lt!119881 () Unit!7284)

(declare-fun lt!119882 () Unit!7284)

(assert (=> d!59451 (= lt!119881 lt!119882)))

(assert (=> d!59451 (= (getValueByKey!272 lt!119884 (_1!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504)))))))

(assert (=> d!59451 (= lt!119882 (lemmaContainsTupThenGetReturnValue!154 lt!119884 (_1!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504)))))))

(assert (=> d!59451 (= lt!119884 (insertStrictlySorted!157 (toList!1786 lt!119778) (_1!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504)))))))

(assert (=> d!59451 (= (+!649 lt!119778 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))) lt!119883)))

(declare-fun b!237246 () Bool)

(declare-fun res!116244 () Bool)

(assert (=> b!237246 (=> (not res!116244) (not e!154048))))

(assert (=> b!237246 (= res!116244 (= (getValueByKey!272 (toList!1786 lt!119883) (_1!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))))))))

(declare-fun b!237247 () Bool)

(assert (=> b!237247 (= e!154048 (contains!1674 (toList!1786 lt!119883) (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))))))

(assert (= (and d!59451 res!116243) b!237246))

(assert (= (and b!237246 res!116244) b!237247))

(declare-fun m!257541 () Bool)

(assert (=> d!59451 m!257541))

(declare-fun m!257543 () Bool)

(assert (=> d!59451 m!257543))

(declare-fun m!257545 () Bool)

(assert (=> d!59451 m!257545))

(declare-fun m!257547 () Bool)

(assert (=> d!59451 m!257547))

(declare-fun m!257549 () Bool)

(assert (=> b!237246 m!257549))

(declare-fun m!257551 () Bool)

(assert (=> b!237247 m!257551))

(assert (=> b!237070 d!59451))

(declare-fun d!59453 () Bool)

(assert (=> d!59453 (= (apply!216 lt!119772 lt!119783) (get!2866 (getValueByKey!272 (toList!1786 lt!119772) lt!119783)))))

(declare-fun bs!8740 () Bool)

(assert (= bs!8740 d!59453))

(declare-fun m!257553 () Bool)

(assert (=> bs!8740 m!257553))

(assert (=> bs!8740 m!257553))

(declare-fun m!257555 () Bool)

(assert (=> bs!8740 m!257555))

(assert (=> b!237070 d!59453))

(declare-fun d!59455 () Bool)

(assert (=> d!59455 (= (apply!216 (+!649 lt!119778 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504))) lt!119777) (get!2866 (getValueByKey!272 (toList!1786 (+!649 lt!119778 (tuple2!4639 lt!119785 (minValue!4243 thiss!1504)))) lt!119777)))))

(declare-fun bs!8741 () Bool)

(assert (= bs!8741 d!59455))

(declare-fun m!257557 () Bool)

(assert (=> bs!8741 m!257557))

(assert (=> bs!8741 m!257557))

(declare-fun m!257559 () Bool)

(assert (=> bs!8741 m!257559))

(assert (=> b!237070 d!59455))

(assert (=> b!237070 d!59415))

(declare-fun d!59457 () Bool)

(declare-fun e!154049 () Bool)

(assert (=> d!59457 e!154049))

(declare-fun res!116245 () Bool)

(assert (=> d!59457 (=> (not res!116245) (not e!154049))))

(declare-fun lt!119887 () ListLongMap!3541)

(assert (=> d!59457 (= res!116245 (contains!1671 lt!119887 (_1!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(declare-fun lt!119888 () List!3555)

(assert (=> d!59457 (= lt!119887 (ListLongMap!3542 lt!119888))))

(declare-fun lt!119885 () Unit!7284)

(declare-fun lt!119886 () Unit!7284)

(assert (=> d!59457 (= lt!119885 lt!119886)))

(assert (=> d!59457 (= (getValueByKey!272 lt!119888 (_1!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))) (Some!277 (_2!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(assert (=> d!59457 (= lt!119886 (lemmaContainsTupThenGetReturnValue!154 lt!119888 (_1!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (_2!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(assert (=> d!59457 (= lt!119888 (insertStrictlySorted!157 (toList!1786 (ite c!39512 call!22034 (ite c!39513 call!22032 call!22031))) (_1!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (_2!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(assert (=> d!59457 (= (+!649 (ite c!39512 call!22034 (ite c!39513 call!22032 call!22031)) (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) lt!119887)))

(declare-fun b!237248 () Bool)

(declare-fun res!116246 () Bool)

(assert (=> b!237248 (=> (not res!116246) (not e!154049))))

(assert (=> b!237248 (= res!116246 (= (getValueByKey!272 (toList!1786 lt!119887) (_1!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))) (Some!277 (_2!2330 (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))))

(declare-fun b!237249 () Bool)

(assert (=> b!237249 (= e!154049 (contains!1674 (toList!1786 lt!119887) (ite (or c!39512 c!39513) (tuple2!4639 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4243 thiss!1504)) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(assert (= (and d!59457 res!116245) b!237248))

(assert (= (and b!237248 res!116246) b!237249))

(declare-fun m!257561 () Bool)

(assert (=> d!59457 m!257561))

(declare-fun m!257563 () Bool)

(assert (=> d!59457 m!257563))

(declare-fun m!257565 () Bool)

(assert (=> d!59457 m!257565))

(declare-fun m!257567 () Bool)

(assert (=> d!59457 m!257567))

(declare-fun m!257569 () Bool)

(assert (=> b!237248 m!257569))

(declare-fun m!257571 () Bool)

(assert (=> b!237249 m!257571))

(assert (=> bm!22032 d!59457))

(assert (=> b!237059 d!59421))

(declare-fun d!59459 () Bool)

(declare-fun res!116251 () Bool)

(declare-fun e!154054 () Bool)

(assert (=> d!59459 (=> res!116251 e!154054)))

(assert (=> d!59459 (= res!116251 (and ((_ is Cons!3551) (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (= (_1!2330 (h!4205 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)))))

(assert (=> d!59459 (= (containsKey!264 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))) key!932) e!154054)))

(declare-fun b!237254 () Bool)

(declare-fun e!154055 () Bool)

(assert (=> b!237254 (= e!154054 e!154055)))

(declare-fun res!116252 () Bool)

(assert (=> b!237254 (=> (not res!116252) (not e!154055))))

(assert (=> b!237254 (= res!116252 (and (or (not ((_ is Cons!3551) (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) (bvsle (_1!2330 (h!4205 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)) ((_ is Cons!3551) (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) (bvslt (_1!2330 (h!4205 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504))))) key!932)))))

(declare-fun b!237255 () Bool)

(assert (=> b!237255 (= e!154055 (containsKey!264 (t!8531 (toList!1786 (getCurrentListMap!1295 (_keys!6489 thiss!1504) (_values!4385 thiss!1504) (mask!10406 thiss!1504) (extraKeys!4139 thiss!1504) (zeroValue!4243 thiss!1504) (minValue!4243 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4402 thiss!1504)))) key!932))))

(assert (= (and d!59459 (not res!116251)) b!237254))

(assert (= (and b!237254 res!116252) b!237255))

(declare-fun m!257573 () Bool)

(assert (=> b!237255 m!257573))

(assert (=> d!59387 d!59459))

(declare-fun d!59461 () Bool)

(declare-fun e!154056 () Bool)

(assert (=> d!59461 e!154056))

(declare-fun res!116253 () Bool)

(assert (=> d!59461 (=> (not res!116253) (not e!154056))))

(declare-fun lt!119891 () ListLongMap!3541)

(assert (=> d!59461 (= res!116253 (contains!1671 lt!119891 (_1!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(declare-fun lt!119892 () List!3555)

(assert (=> d!59461 (= lt!119891 (ListLongMap!3542 lt!119892))))

(declare-fun lt!119889 () Unit!7284)

(declare-fun lt!119890 () Unit!7284)

(assert (=> d!59461 (= lt!119889 lt!119890)))

(assert (=> d!59461 (= (getValueByKey!272 lt!119892 (_1!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(assert (=> d!59461 (= lt!119890 (lemmaContainsTupThenGetReturnValue!154 lt!119892 (_1!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(assert (=> d!59461 (= lt!119892 (insertStrictlySorted!157 (toList!1786 call!22033) (_1!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))) (_2!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))))))

(assert (=> d!59461 (= (+!649 call!22033 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))) lt!119891)))

(declare-fun b!237256 () Bool)

(declare-fun res!116254 () Bool)

(assert (=> b!237256 (=> (not res!116254) (not e!154056))))

(assert (=> b!237256 (= res!116254 (= (getValueByKey!272 (toList!1786 lt!119891) (_1!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504)))) (Some!277 (_2!2330 (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))))

(declare-fun b!237257 () Bool)

(assert (=> b!237257 (= e!154056 (contains!1674 (toList!1786 lt!119891) (tuple2!4639 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4243 thiss!1504))))))

(assert (= (and d!59461 res!116253) b!237256))

(assert (= (and b!237256 res!116254) b!237257))

(declare-fun m!257575 () Bool)

(assert (=> d!59461 m!257575))

(declare-fun m!257577 () Bool)

(assert (=> d!59461 m!257577))

(declare-fun m!257579 () Bool)

(assert (=> d!59461 m!257579))

(declare-fun m!257581 () Bool)

(assert (=> d!59461 m!257581))

(declare-fun m!257583 () Bool)

(assert (=> b!237256 m!257583))

(declare-fun m!257585 () Bool)

(assert (=> b!237257 m!257585))

(assert (=> b!237060 d!59461))

(declare-fun b!237268 () Bool)

(declare-fun e!154068 () Bool)

(declare-fun contains!1675 (List!3558 (_ BitVec 64)) Bool)

(assert (=> b!237268 (= e!154068 (contains!1675 Nil!3555 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!22041 () Bool)

(declare-fun call!22044 () Bool)

(declare-fun c!39566 () Bool)

(assert (=> bm!22041 (= call!22044 (arrayNoDuplicates!0 (_keys!6489 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39566 (Cons!3554 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000) Nil!3555) Nil!3555)))))

(declare-fun b!237269 () Bool)

(declare-fun e!154066 () Bool)

(declare-fun e!154065 () Bool)

(assert (=> b!237269 (= e!154066 e!154065)))

(declare-fun res!116262 () Bool)

(assert (=> b!237269 (=> (not res!116262) (not e!154065))))

(assert (=> b!237269 (= res!116262 (not e!154068))))

(declare-fun res!116261 () Bool)

(assert (=> b!237269 (=> (not res!116261) (not e!154068))))

(assert (=> b!237269 (= res!116261 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59463 () Bool)

(declare-fun res!116263 () Bool)

(assert (=> d!59463 (=> res!116263 e!154066)))

(assert (=> d!59463 (= res!116263 (bvsge #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(assert (=> d!59463 (= (arrayNoDuplicates!0 (_keys!6489 thiss!1504) #b00000000000000000000000000000000 Nil!3555) e!154066)))

(declare-fun b!237270 () Bool)

(declare-fun e!154067 () Bool)

(assert (=> b!237270 (= e!154067 call!22044)))

(declare-fun b!237271 () Bool)

(assert (=> b!237271 (= e!154067 call!22044)))

(declare-fun b!237272 () Bool)

(assert (=> b!237272 (= e!154065 e!154067)))

(assert (=> b!237272 (= c!39566 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59463 (not res!116263)) b!237269))

(assert (= (and b!237269 res!116261) b!237268))

(assert (= (and b!237269 res!116262) b!237272))

(assert (= (and b!237272 c!39566) b!237271))

(assert (= (and b!237272 (not c!39566)) b!237270))

(assert (= (or b!237271 b!237270) bm!22041))

(assert (=> b!237268 m!257319))

(assert (=> b!237268 m!257319))

(declare-fun m!257587 () Bool)

(assert (=> b!237268 m!257587))

(assert (=> bm!22041 m!257319))

(declare-fun m!257589 () Bool)

(assert (=> bm!22041 m!257589))

(assert (=> b!237269 m!257319))

(assert (=> b!237269 m!257319))

(assert (=> b!237269 m!257331))

(assert (=> b!237272 m!257319))

(assert (=> b!237272 m!257319))

(assert (=> b!237272 m!257331))

(assert (=> b!237082 d!59463))

(declare-fun d!59465 () Bool)

(assert (=> d!59465 (= (apply!216 lt!119791 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2866 (getValueByKey!272 (toList!1786 lt!119791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8742 () Bool)

(assert (= bs!8742 d!59465))

(assert (=> bs!8742 m!257461))

(assert (=> bs!8742 m!257461))

(declare-fun m!257591 () Bool)

(assert (=> bs!8742 m!257591))

(assert (=> b!237065 d!59465))

(declare-fun b!237281 () Bool)

(declare-fun e!154075 () Bool)

(declare-fun e!154077 () Bool)

(assert (=> b!237281 (= e!154075 e!154077)))

(declare-fun c!39569 () Bool)

(assert (=> b!237281 (= c!39569 (validKeyInArray!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59467 () Bool)

(declare-fun res!116268 () Bool)

(assert (=> d!59467 (=> res!116268 e!154075)))

(assert (=> d!59467 (= res!116268 (bvsge #b00000000000000000000000000000000 (size!5912 (_keys!6489 thiss!1504))))))

(assert (=> d!59467 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6489 thiss!1504) (mask!10406 thiss!1504)) e!154075)))

(declare-fun b!237282 () Bool)

(declare-fun e!154076 () Bool)

(declare-fun call!22047 () Bool)

(assert (=> b!237282 (= e!154076 call!22047)))

(declare-fun b!237283 () Bool)

(assert (=> b!237283 (= e!154077 e!154076)))

(declare-fun lt!119900 () (_ BitVec 64))

(assert (=> b!237283 (= lt!119900 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!119899 () Unit!7284)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11733 (_ BitVec 64) (_ BitVec 32)) Unit!7284)

(assert (=> b!237283 (= lt!119899 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6489 thiss!1504) lt!119900 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!237283 (arrayContainsKey!0 (_keys!6489 thiss!1504) lt!119900 #b00000000000000000000000000000000)))

(declare-fun lt!119901 () Unit!7284)

(assert (=> b!237283 (= lt!119901 lt!119899)))

(declare-fun res!116269 () Bool)

(assert (=> b!237283 (= res!116269 (= (seekEntryOrOpen!0 (select (arr!5572 (_keys!6489 thiss!1504)) #b00000000000000000000000000000000) (_keys!6489 thiss!1504) (mask!10406 thiss!1504)) (Found!1004 #b00000000000000000000000000000000)))))

(assert (=> b!237283 (=> (not res!116269) (not e!154076))))

(declare-fun bm!22044 () Bool)

(assert (=> bm!22044 (= call!22047 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6489 thiss!1504) (mask!10406 thiss!1504)))))

(declare-fun b!237284 () Bool)

(assert (=> b!237284 (= e!154077 call!22047)))

(assert (= (and d!59467 (not res!116268)) b!237281))

(assert (= (and b!237281 c!39569) b!237283))

(assert (= (and b!237281 (not c!39569)) b!237284))

(assert (= (and b!237283 res!116269) b!237282))

(assert (= (or b!237282 b!237284) bm!22044))

(assert (=> b!237281 m!257319))

(assert (=> b!237281 m!257319))

(assert (=> b!237281 m!257331))

(assert (=> b!237283 m!257319))

(declare-fun m!257593 () Bool)

(assert (=> b!237283 m!257593))

(declare-fun m!257595 () Bool)

(assert (=> b!237283 m!257595))

(assert (=> b!237283 m!257319))

(declare-fun m!257597 () Bool)

(assert (=> b!237283 m!257597))

(declare-fun m!257599 () Bool)

(assert (=> bm!22044 m!257599))

(assert (=> b!237081 d!59467))

(declare-fun d!59469 () Bool)

(assert (=> d!59469 (= (apply!216 lt!119791 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2866 (getValueByKey!272 (toList!1786 lt!119791) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8743 () Bool)

(assert (= bs!8743 d!59469))

(assert (=> bs!8743 m!257415))

(assert (=> bs!8743 m!257415))

(declare-fun m!257601 () Bool)

(assert (=> bs!8743 m!257601))

(assert (=> b!237066 d!59469))

(declare-fun condMapEmpty!10577 () Bool)

(declare-fun mapDefault!10577 () ValueCell!2774)

(assert (=> mapNonEmpty!10576 (= condMapEmpty!10577 (= mapRest!10576 ((as const (Array (_ BitVec 32) ValueCell!2774)) mapDefault!10577)))))

(declare-fun e!154078 () Bool)

(declare-fun mapRes!10577 () Bool)

(assert (=> mapNonEmpty!10576 (= tp!22321 (and e!154078 mapRes!10577))))

(declare-fun b!237286 () Bool)

(assert (=> b!237286 (= e!154078 tp_is_empty!6235)))

(declare-fun mapIsEmpty!10577 () Bool)

(assert (=> mapIsEmpty!10577 mapRes!10577))

(declare-fun mapNonEmpty!10577 () Bool)

(declare-fun tp!22322 () Bool)

(declare-fun e!154079 () Bool)

(assert (=> mapNonEmpty!10577 (= mapRes!10577 (and tp!22322 e!154079))))

(declare-fun mapKey!10577 () (_ BitVec 32))

(declare-fun mapValue!10577 () ValueCell!2774)

(declare-fun mapRest!10577 () (Array (_ BitVec 32) ValueCell!2774))

(assert (=> mapNonEmpty!10577 (= mapRest!10576 (store mapRest!10577 mapKey!10577 mapValue!10577))))

(declare-fun b!237285 () Bool)

(assert (=> b!237285 (= e!154079 tp_is_empty!6235)))

(assert (= (and mapNonEmpty!10576 condMapEmpty!10577) mapIsEmpty!10577))

(assert (= (and mapNonEmpty!10576 (not condMapEmpty!10577)) mapNonEmpty!10577))

(assert (= (and mapNonEmpty!10577 ((_ is ValueCellFull!2774) mapValue!10577)) b!237285))

(assert (= (and mapNonEmpty!10576 ((_ is ValueCellFull!2774) mapDefault!10577)) b!237286))

(declare-fun m!257603 () Bool)

(assert (=> mapNonEmpty!10577 m!257603))

(declare-fun b_lambda!7933 () Bool)

(assert (= b_lambda!7929 (or (and b!236920 b_free!6373) b_lambda!7933)))

(declare-fun b_lambda!7935 () Bool)

(assert (= b_lambda!7931 (or (and b!236920 b_free!6373) b_lambda!7935)))

(check-sat (not d!59455) (not b_next!6373) (not d!59451) (not b!237249) (not d!59431) (not d!59433) (not b!237272) (not d!59397) (not b!237281) (not d!59469) (not d!59457) (not d!59417) (not bm!22035) (not bm!22038) (not d!59437) (not b!237257) (not d!59449) (not d!59425) (not b!237127) (not b!237283) (not d!59423) (not d!59439) (not b!237175) (not b_lambda!7927) (not b!237111) (not b!237107) (not b!237223) (not d!59443) (not b!237114) (not b!237269) (not b!237239) (not b!237129) tp_is_empty!6235 (not b!237100) (not bm!22041) (not d!59399) (not b!237168) (not b!237238) (not d!59429) (not d!59465) (not b!237125) (not b!237173) (not b_lambda!7935) (not d!59435) (not b!237109) (not b!237255) (not b!237231) (not b!237170) (not b_lambda!7933) (not d!59441) (not b!237176) (not d!59445) (not b!237243) (not b!237218) (not mapNonEmpty!10577) (not b!237138) (not d!59447) (not b!237166) (not b!237241) (not d!59461) (not b!237256) (not d!59453) (not b!237245) (not b!237268) (not b!237225) (not b!237201) (not b!237230) (not b!237167) (not d!59403) (not d!59411) (not b!237248) (not b!237101) (not b!237246) (not d!59427) (not b!237242) (not b!237171) (not b!237108) b_and!13305 (not d!59405) (not bm!22044) (not d!59407) (not d!59415) (not b!237247))
(check-sat b_and!13305 (not b_next!6373))
