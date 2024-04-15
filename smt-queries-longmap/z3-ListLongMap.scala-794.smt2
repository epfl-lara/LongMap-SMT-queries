; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18976 () Bool)

(assert start!18976)

(declare-fun b!186931 () Bool)

(declare-fun b_free!4603 () Bool)

(declare-fun b_next!4603 () Bool)

(assert (=> b!186931 (= b_free!4603 (not b_next!4603))))

(declare-fun tp!16618 () Bool)

(declare-fun b_and!11193 () Bool)

(assert (=> b!186931 (= tp!16618 b_and!11193)))

(declare-fun e!123011 () Bool)

(declare-fun e!123013 () Bool)

(declare-fun tp_is_empty!4375 () Bool)

(declare-datatypes ((V!5481 0))(
  ( (V!5482 (val!2232 Int)) )
))
(declare-datatypes ((ValueCell!1844 0))(
  ( (ValueCellFull!1844 (v!4140 V!5481)) (EmptyCell!1844) )
))
(declare-datatypes ((array!7945 0))(
  ( (array!7946 (arr!3748 (Array (_ BitVec 32) (_ BitVec 64))) (size!4067 (_ BitVec 32))) )
))
(declare-datatypes ((array!7947 0))(
  ( (array!7948 (arr!3749 (Array (_ BitVec 32) ValueCell!1844)) (size!4068 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2596 0))(
  ( (LongMapFixedSize!2597 (defaultEntry!3815 Int) (mask!8954 (_ BitVec 32)) (extraKeys!3552 (_ BitVec 32)) (zeroValue!3656 V!5481) (minValue!3656 V!5481) (_size!1347 (_ BitVec 32)) (_keys!5764 array!7945) (_values!3798 array!7947) (_vacant!1347 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2596)

(declare-fun array_inv!2427 (array!7945) Bool)

(declare-fun array_inv!2428 (array!7947) Bool)

(assert (=> b!186931 (= e!123013 (and tp!16618 tp_is_empty!4375 (array_inv!2427 (_keys!5764 thiss!1248)) (array_inv!2428 (_values!3798 thiss!1248)) e!123011))))

(declare-fun b!186932 () Bool)

(declare-fun e!123017 () Bool)

(declare-fun e!123015 () Bool)

(assert (=> b!186932 (= e!123017 e!123015)))

(declare-fun res!88377 () Bool)

(assert (=> b!186932 (=> (not res!88377) (not e!123015))))

(declare-datatypes ((SeekEntryResult!648 0))(
  ( (MissingZero!648 (index!4762 (_ BitVec 32))) (Found!648 (index!4763 (_ BitVec 32))) (Intermediate!648 (undefined!1460 Bool) (index!4764 (_ BitVec 32)) (x!20263 (_ BitVec 32))) (Undefined!648) (MissingVacant!648 (index!4765 (_ BitVec 32))) )
))
(declare-fun lt!92354 () SeekEntryResult!648)

(get-info :version)

(assert (=> b!186932 (= res!88377 (and (not ((_ is Undefined!648) lt!92354)) (not ((_ is MissingVacant!648) lt!92354)) (not ((_ is MissingZero!648) lt!92354)) ((_ is Found!648) lt!92354)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7945 (_ BitVec 32)) SeekEntryResult!648)

(assert (=> b!186932 (= lt!92354 (seekEntryOrOpen!0 key!828 (_keys!5764 thiss!1248) (mask!8954 thiss!1248)))))

(declare-fun b!186933 () Bool)

(declare-datatypes ((Unit!5605 0))(
  ( (Unit!5606) )
))
(declare-fun e!123009 () Unit!5605)

(declare-fun Unit!5607 () Unit!5605)

(assert (=> b!186933 (= e!123009 Unit!5607)))

(declare-fun lt!92352 () Unit!5605)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (array!7945 array!7947 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5605)

(assert (=> b!186933 (= lt!92352 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(assert (=> b!186933 false))

(declare-fun b!186934 () Bool)

(declare-fun e!123010 () Bool)

(assert (=> b!186934 (= e!123010 tp_is_empty!4375)))

(declare-fun b!186935 () Bool)

(declare-fun lt!92355 () Unit!5605)

(assert (=> b!186935 (= e!123009 lt!92355)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!147 (array!7945 array!7947 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5605)

(assert (=> b!186935 (= lt!92355 (lemmaInListMapThenSeekEntryOrOpenFindsIt!147 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(declare-fun res!88378 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!186935 (= res!88378 (inRange!0 (index!4763 lt!92354) (mask!8954 thiss!1248)))))

(declare-fun e!123018 () Bool)

(assert (=> b!186935 (=> (not res!88378) (not e!123018))))

(assert (=> b!186935 e!123018))

(declare-fun res!88381 () Bool)

(assert (=> start!18976 (=> (not res!88381) (not e!123017))))

(declare-fun valid!1088 (LongMapFixedSize!2596) Bool)

(assert (=> start!18976 (= res!88381 (valid!1088 thiss!1248))))

(assert (=> start!18976 e!123017))

(assert (=> start!18976 e!123013))

(assert (=> start!18976 true))

(declare-fun b!186936 () Bool)

(assert (=> b!186936 (= e!123018 (= (select (arr!3748 (_keys!5764 thiss!1248)) (index!4763 lt!92354)) key!828))))

(declare-fun b!186937 () Bool)

(declare-fun res!88380 () Bool)

(assert (=> b!186937 (=> (not res!88380) (not e!123017))))

(assert (=> b!186937 (= res!88380 (not (= key!828 (bvneg key!828))))))

(declare-fun b!186938 () Bool)

(declare-fun e!123014 () Bool)

(assert (=> b!186938 (= e!123014 (and (= (size!4068 (_values!3798 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8954 thiss!1248))) (= (size!4067 (_keys!5764 thiss!1248)) (size!4068 (_values!3798 thiss!1248))) (bvslt (mask!8954 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!7535 () Bool)

(declare-fun mapRes!7535 () Bool)

(declare-fun tp!16619 () Bool)

(assert (=> mapNonEmpty!7535 (= mapRes!7535 (and tp!16619 e!123010))))

(declare-fun mapKey!7535 () (_ BitVec 32))

(declare-fun mapValue!7535 () ValueCell!1844)

(declare-fun mapRest!7535 () (Array (_ BitVec 32) ValueCell!1844))

(assert (=> mapNonEmpty!7535 (= (arr!3749 (_values!3798 thiss!1248)) (store mapRest!7535 mapKey!7535 mapValue!7535))))

(declare-fun b!186939 () Bool)

(declare-fun e!123016 () Bool)

(assert (=> b!186939 (= e!123011 (and e!123016 mapRes!7535))))

(declare-fun condMapEmpty!7535 () Bool)

(declare-fun mapDefault!7535 () ValueCell!1844)

(assert (=> b!186939 (= condMapEmpty!7535 (= (arr!3749 (_values!3798 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1844)) mapDefault!7535)))))

(declare-fun b!186940 () Bool)

(assert (=> b!186940 (= e!123016 tp_is_empty!4375)))

(declare-fun mapIsEmpty!7535 () Bool)

(assert (=> mapIsEmpty!7535 mapRes!7535))

(declare-fun b!186941 () Bool)

(assert (=> b!186941 (= e!123015 e!123014)))

(declare-fun res!88379 () Bool)

(assert (=> b!186941 (=> (not res!88379) (not e!123014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!186941 (= res!88379 (validMask!0 (mask!8954 thiss!1248)))))

(declare-fun lt!92353 () Unit!5605)

(assert (=> b!186941 (= lt!92353 e!123009)))

(declare-fun c!33556 () Bool)

(declare-datatypes ((tuple2!3436 0))(
  ( (tuple2!3437 (_1!1729 (_ BitVec 64)) (_2!1729 V!5481)) )
))
(declare-datatypes ((List!2366 0))(
  ( (Nil!2363) (Cons!2362 (h!2997 tuple2!3436) (t!7247 List!2366)) )
))
(declare-datatypes ((ListLongMap!2345 0))(
  ( (ListLongMap!2346 (toList!1188 List!2366)) )
))
(declare-fun contains!1294 (ListLongMap!2345 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!821 (array!7945 array!7947 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 32) Int) ListLongMap!2345)

(assert (=> b!186941 (= c!33556 (contains!1294 (getCurrentListMap!821 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)) key!828))))

(assert (= (and start!18976 res!88381) b!186937))

(assert (= (and b!186937 res!88380) b!186932))

(assert (= (and b!186932 res!88377) b!186941))

(assert (= (and b!186941 c!33556) b!186935))

(assert (= (and b!186941 (not c!33556)) b!186933))

(assert (= (and b!186935 res!88378) b!186936))

(assert (= (and b!186941 res!88379) b!186938))

(assert (= (and b!186939 condMapEmpty!7535) mapIsEmpty!7535))

(assert (= (and b!186939 (not condMapEmpty!7535)) mapNonEmpty!7535))

(assert (= (and mapNonEmpty!7535 ((_ is ValueCellFull!1844) mapValue!7535)) b!186934))

(assert (= (and b!186939 ((_ is ValueCellFull!1844) mapDefault!7535)) b!186940))

(assert (= b!186931 b!186939))

(assert (= start!18976 b!186931))

(declare-fun m!213351 () Bool)

(assert (=> mapNonEmpty!7535 m!213351))

(declare-fun m!213353 () Bool)

(assert (=> b!186933 m!213353))

(declare-fun m!213355 () Bool)

(assert (=> b!186936 m!213355))

(declare-fun m!213357 () Bool)

(assert (=> b!186932 m!213357))

(declare-fun m!213359 () Bool)

(assert (=> b!186941 m!213359))

(declare-fun m!213361 () Bool)

(assert (=> b!186941 m!213361))

(assert (=> b!186941 m!213361))

(declare-fun m!213363 () Bool)

(assert (=> b!186941 m!213363))

(declare-fun m!213365 () Bool)

(assert (=> b!186935 m!213365))

(declare-fun m!213367 () Bool)

(assert (=> b!186935 m!213367))

(declare-fun m!213369 () Bool)

(assert (=> b!186931 m!213369))

(declare-fun m!213371 () Bool)

(assert (=> b!186931 m!213371))

(declare-fun m!213373 () Bool)

(assert (=> start!18976 m!213373))

(check-sat (not b!186933) (not b_next!4603) (not mapNonEmpty!7535) (not start!18976) (not b!186935) b_and!11193 (not b!186932) (not b!186941) tp_is_empty!4375 (not b!186931))
(check-sat b_and!11193 (not b_next!4603))
(get-model)

(declare-fun b!187020 () Bool)

(declare-fun e!123087 () SeekEntryResult!648)

(assert (=> b!187020 (= e!123087 Undefined!648)))

(declare-fun b!187021 () Bool)

(declare-fun e!123086 () SeekEntryResult!648)

(assert (=> b!187021 (= e!123087 e!123086)))

(declare-fun lt!92387 () (_ BitVec 64))

(declare-fun lt!92386 () SeekEntryResult!648)

(assert (=> b!187021 (= lt!92387 (select (arr!3748 (_keys!5764 thiss!1248)) (index!4764 lt!92386)))))

(declare-fun c!33570 () Bool)

(assert (=> b!187021 (= c!33570 (= lt!92387 key!828))))

(declare-fun b!187022 () Bool)

(declare-fun c!33571 () Bool)

(assert (=> b!187022 (= c!33571 (= lt!92387 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!123085 () SeekEntryResult!648)

(assert (=> b!187022 (= e!123086 e!123085)))

(declare-fun b!187023 () Bool)

(assert (=> b!187023 (= e!123085 (MissingZero!648 (index!4764 lt!92386)))))

(declare-fun d!55229 () Bool)

(declare-fun lt!92388 () SeekEntryResult!648)

(assert (=> d!55229 (and (or ((_ is Undefined!648) lt!92388) (not ((_ is Found!648) lt!92388)) (and (bvsge (index!4763 lt!92388) #b00000000000000000000000000000000) (bvslt (index!4763 lt!92388) (size!4067 (_keys!5764 thiss!1248))))) (or ((_ is Undefined!648) lt!92388) ((_ is Found!648) lt!92388) (not ((_ is MissingZero!648) lt!92388)) (and (bvsge (index!4762 lt!92388) #b00000000000000000000000000000000) (bvslt (index!4762 lt!92388) (size!4067 (_keys!5764 thiss!1248))))) (or ((_ is Undefined!648) lt!92388) ((_ is Found!648) lt!92388) ((_ is MissingZero!648) lt!92388) (not ((_ is MissingVacant!648) lt!92388)) (and (bvsge (index!4765 lt!92388) #b00000000000000000000000000000000) (bvslt (index!4765 lt!92388) (size!4067 (_keys!5764 thiss!1248))))) (or ((_ is Undefined!648) lt!92388) (ite ((_ is Found!648) lt!92388) (= (select (arr!3748 (_keys!5764 thiss!1248)) (index!4763 lt!92388)) key!828) (ite ((_ is MissingZero!648) lt!92388) (= (select (arr!3748 (_keys!5764 thiss!1248)) (index!4762 lt!92388)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!648) lt!92388) (= (select (arr!3748 (_keys!5764 thiss!1248)) (index!4765 lt!92388)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!55229 (= lt!92388 e!123087)))

(declare-fun c!33569 () Bool)

(assert (=> d!55229 (= c!33569 (and ((_ is Intermediate!648) lt!92386) (undefined!1460 lt!92386)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7945 (_ BitVec 32)) SeekEntryResult!648)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!55229 (= lt!92386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8954 thiss!1248)) key!828 (_keys!5764 thiss!1248) (mask!8954 thiss!1248)))))

(assert (=> d!55229 (validMask!0 (mask!8954 thiss!1248))))

(assert (=> d!55229 (= (seekEntryOrOpen!0 key!828 (_keys!5764 thiss!1248) (mask!8954 thiss!1248)) lt!92388)))

(declare-fun b!187024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7945 (_ BitVec 32)) SeekEntryResult!648)

(assert (=> b!187024 (= e!123085 (seekKeyOrZeroReturnVacant!0 (x!20263 lt!92386) (index!4764 lt!92386) (index!4764 lt!92386) key!828 (_keys!5764 thiss!1248) (mask!8954 thiss!1248)))))

(declare-fun b!187025 () Bool)

(assert (=> b!187025 (= e!123086 (Found!648 (index!4764 lt!92386)))))

(assert (= (and d!55229 c!33569) b!187020))

(assert (= (and d!55229 (not c!33569)) b!187021))

(assert (= (and b!187021 c!33570) b!187025))

(assert (= (and b!187021 (not c!33570)) b!187022))

(assert (= (and b!187022 c!33571) b!187023))

(assert (= (and b!187022 (not c!33571)) b!187024))

(declare-fun m!213423 () Bool)

(assert (=> b!187021 m!213423))

(assert (=> d!55229 m!213359))

(declare-fun m!213425 () Bool)

(assert (=> d!55229 m!213425))

(declare-fun m!213427 () Bool)

(assert (=> d!55229 m!213427))

(assert (=> d!55229 m!213425))

(declare-fun m!213429 () Bool)

(assert (=> d!55229 m!213429))

(declare-fun m!213431 () Bool)

(assert (=> d!55229 m!213431))

(declare-fun m!213433 () Bool)

(assert (=> d!55229 m!213433))

(declare-fun m!213435 () Bool)

(assert (=> b!187024 m!213435))

(assert (=> b!186932 d!55229))

(declare-fun d!55231 () Bool)

(assert (=> d!55231 (= (validMask!0 (mask!8954 thiss!1248)) (and (or (= (mask!8954 thiss!1248) #b00000000000000000000000000000111) (= (mask!8954 thiss!1248) #b00000000000000000000000000001111) (= (mask!8954 thiss!1248) #b00000000000000000000000000011111) (= (mask!8954 thiss!1248) #b00000000000000000000000000111111) (= (mask!8954 thiss!1248) #b00000000000000000000000001111111) (= (mask!8954 thiss!1248) #b00000000000000000000000011111111) (= (mask!8954 thiss!1248) #b00000000000000000000000111111111) (= (mask!8954 thiss!1248) #b00000000000000000000001111111111) (= (mask!8954 thiss!1248) #b00000000000000000000011111111111) (= (mask!8954 thiss!1248) #b00000000000000000000111111111111) (= (mask!8954 thiss!1248) #b00000000000000000001111111111111) (= (mask!8954 thiss!1248) #b00000000000000000011111111111111) (= (mask!8954 thiss!1248) #b00000000000000000111111111111111) (= (mask!8954 thiss!1248) #b00000000000000001111111111111111) (= (mask!8954 thiss!1248) #b00000000000000011111111111111111) (= (mask!8954 thiss!1248) #b00000000000000111111111111111111) (= (mask!8954 thiss!1248) #b00000000000001111111111111111111) (= (mask!8954 thiss!1248) #b00000000000011111111111111111111) (= (mask!8954 thiss!1248) #b00000000000111111111111111111111) (= (mask!8954 thiss!1248) #b00000000001111111111111111111111) (= (mask!8954 thiss!1248) #b00000000011111111111111111111111) (= (mask!8954 thiss!1248) #b00000000111111111111111111111111) (= (mask!8954 thiss!1248) #b00000001111111111111111111111111) (= (mask!8954 thiss!1248) #b00000011111111111111111111111111) (= (mask!8954 thiss!1248) #b00000111111111111111111111111111) (= (mask!8954 thiss!1248) #b00001111111111111111111111111111) (= (mask!8954 thiss!1248) #b00011111111111111111111111111111) (= (mask!8954 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8954 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!186941 d!55231))

(declare-fun d!55233 () Bool)

(declare-fun e!123093 () Bool)

(assert (=> d!55233 e!123093))

(declare-fun res!88414 () Bool)

(assert (=> d!55233 (=> res!88414 e!123093)))

(declare-fun lt!92398 () Bool)

(assert (=> d!55233 (= res!88414 (not lt!92398))))

(declare-fun lt!92400 () Bool)

(assert (=> d!55233 (= lt!92398 lt!92400)))

(declare-fun lt!92397 () Unit!5605)

(declare-fun e!123092 () Unit!5605)

(assert (=> d!55233 (= lt!92397 e!123092)))

(declare-fun c!33574 () Bool)

(assert (=> d!55233 (= c!33574 lt!92400)))

(declare-fun containsKey!229 (List!2366 (_ BitVec 64)) Bool)

(assert (=> d!55233 (= lt!92400 (containsKey!229 (toList!1188 (getCurrentListMap!821 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828))))

(assert (=> d!55233 (= (contains!1294 (getCurrentListMap!821 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)) key!828) lt!92398)))

(declare-fun b!187032 () Bool)

(declare-fun lt!92399 () Unit!5605)

(assert (=> b!187032 (= e!123092 lt!92399)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!178 (List!2366 (_ BitVec 64)) Unit!5605)

(assert (=> b!187032 (= lt!92399 (lemmaContainsKeyImpliesGetValueByKeyDefined!178 (toList!1188 (getCurrentListMap!821 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828))))

(declare-datatypes ((Option!231 0))(
  ( (Some!230 (v!4143 V!5481)) (None!229) )
))
(declare-fun isDefined!179 (Option!231) Bool)

(declare-fun getValueByKey!225 (List!2366 (_ BitVec 64)) Option!231)

(assert (=> b!187032 (isDefined!179 (getValueByKey!225 (toList!1188 (getCurrentListMap!821 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828))))

(declare-fun b!187033 () Bool)

(declare-fun Unit!5613 () Unit!5605)

(assert (=> b!187033 (= e!123092 Unit!5613)))

(declare-fun b!187034 () Bool)

(assert (=> b!187034 (= e!123093 (isDefined!179 (getValueByKey!225 (toList!1188 (getCurrentListMap!821 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248))) key!828)))))

(assert (= (and d!55233 c!33574) b!187032))

(assert (= (and d!55233 (not c!33574)) b!187033))

(assert (= (and d!55233 (not res!88414)) b!187034))

(declare-fun m!213437 () Bool)

(assert (=> d!55233 m!213437))

(declare-fun m!213439 () Bool)

(assert (=> b!187032 m!213439))

(declare-fun m!213441 () Bool)

(assert (=> b!187032 m!213441))

(assert (=> b!187032 m!213441))

(declare-fun m!213443 () Bool)

(assert (=> b!187032 m!213443))

(assert (=> b!187034 m!213441))

(assert (=> b!187034 m!213441))

(assert (=> b!187034 m!213443))

(assert (=> b!186941 d!55233))

(declare-fun d!55235 () Bool)

(declare-fun e!123130 () Bool)

(assert (=> d!55235 e!123130))

(declare-fun res!88440 () Bool)

(assert (=> d!55235 (=> (not res!88440) (not e!123130))))

(assert (=> d!55235 (= res!88440 (or (bvsge #b00000000000000000000000000000000 (size!4067 (_keys!5764 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4067 (_keys!5764 thiss!1248))))))))

(declare-fun lt!92449 () ListLongMap!2345)

(declare-fun lt!92453 () ListLongMap!2345)

(assert (=> d!55235 (= lt!92449 lt!92453)))

(declare-fun lt!92446 () Unit!5605)

(declare-fun e!123125 () Unit!5605)

(assert (=> d!55235 (= lt!92446 e!123125)))

(declare-fun c!33591 () Bool)

(declare-fun e!123131 () Bool)

(assert (=> d!55235 (= c!33591 e!123131)))

(declare-fun res!88433 () Bool)

(assert (=> d!55235 (=> (not res!88433) (not e!123131))))

(assert (=> d!55235 (= res!88433 (bvslt #b00000000000000000000000000000000 (size!4067 (_keys!5764 thiss!1248))))))

(declare-fun e!123132 () ListLongMap!2345)

(assert (=> d!55235 (= lt!92453 e!123132)))

(declare-fun c!33590 () Bool)

(assert (=> d!55235 (= c!33590 (and (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!55235 (validMask!0 (mask!8954 thiss!1248))))

(assert (=> d!55235 (= (getCurrentListMap!821 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)) lt!92449)))

(declare-fun b!187077 () Bool)

(declare-fun res!88436 () Bool)

(assert (=> b!187077 (=> (not res!88436) (not e!123130))))

(declare-fun e!123129 () Bool)

(assert (=> b!187077 (= res!88436 e!123129)))

(declare-fun c!33587 () Bool)

(assert (=> b!187077 (= c!33587 (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!187078 () Bool)

(declare-fun e!123121 () Bool)

(assert (=> b!187078 (= e!123130 e!123121)))

(declare-fun c!33592 () Bool)

(assert (=> b!187078 (= c!33592 (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!187079 () Bool)

(declare-fun e!123124 () Bool)

(declare-fun apply!170 (ListLongMap!2345 (_ BitVec 64)) V!5481)

(assert (=> b!187079 (= e!123124 (= (apply!170 lt!92449 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3656 thiss!1248)))))

(declare-fun b!187080 () Bool)

(declare-fun e!123127 () ListLongMap!2345)

(declare-fun call!18850 () ListLongMap!2345)

(assert (=> b!187080 (= e!123127 call!18850)))

(declare-fun b!187081 () Bool)

(declare-fun e!123123 () Bool)

(assert (=> b!187081 (= e!123123 (= (apply!170 lt!92449 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3656 thiss!1248)))))

(declare-fun bm!18844 () Bool)

(declare-fun call!18849 () ListLongMap!2345)

(declare-fun c!33588 () Bool)

(declare-fun call!18852 () ListLongMap!2345)

(declare-fun call!18848 () ListLongMap!2345)

(declare-fun +!287 (ListLongMap!2345 tuple2!3436) ListLongMap!2345)

(assert (=> bm!18844 (= call!18849 (+!287 (ite c!33590 call!18848 (ite c!33588 call!18852 call!18850)) (ite (or c!33590 c!33588) (tuple2!3437 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3656 thiss!1248)) (tuple2!3437 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3656 thiss!1248)))))))

(declare-fun bm!18845 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!191 (array!7945 array!7947 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 32) Int) ListLongMap!2345)

(assert (=> bm!18845 (= call!18848 (getCurrentListMapNoExtraKeys!191 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun bm!18846 () Bool)

(declare-fun call!18847 () ListLongMap!2345)

(assert (=> bm!18846 (= call!18847 call!18849)))

(declare-fun b!187082 () Bool)

(assert (=> b!187082 (= e!123121 e!123124)))

(declare-fun res!88437 () Bool)

(declare-fun call!18853 () Bool)

(assert (=> b!187082 (= res!88437 call!18853)))

(assert (=> b!187082 (=> (not res!88437) (not e!123124))))

(declare-fun b!187083 () Bool)

(declare-fun c!33589 () Bool)

(assert (=> b!187083 (= c!33589 (and (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!123120 () ListLongMap!2345)

(assert (=> b!187083 (= e!123120 e!123127)))

(declare-fun b!187084 () Bool)

(assert (=> b!187084 (= e!123121 (not call!18853))))

(declare-fun b!187085 () Bool)

(declare-fun lt!92463 () Unit!5605)

(assert (=> b!187085 (= e!123125 lt!92463)))

(declare-fun lt!92461 () ListLongMap!2345)

(assert (=> b!187085 (= lt!92461 (getCurrentListMapNoExtraKeys!191 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92460 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92462 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92462 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92448 () Unit!5605)

(declare-fun addStillContains!146 (ListLongMap!2345 (_ BitVec 64) V!5481 (_ BitVec 64)) Unit!5605)

(assert (=> b!187085 (= lt!92448 (addStillContains!146 lt!92461 lt!92460 (zeroValue!3656 thiss!1248) lt!92462))))

(assert (=> b!187085 (contains!1294 (+!287 lt!92461 (tuple2!3437 lt!92460 (zeroValue!3656 thiss!1248))) lt!92462)))

(declare-fun lt!92458 () Unit!5605)

(assert (=> b!187085 (= lt!92458 lt!92448)))

(declare-fun lt!92454 () ListLongMap!2345)

(assert (=> b!187085 (= lt!92454 (getCurrentListMapNoExtraKeys!191 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92445 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92447 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92447 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92452 () Unit!5605)

(declare-fun addApplyDifferent!146 (ListLongMap!2345 (_ BitVec 64) V!5481 (_ BitVec 64)) Unit!5605)

(assert (=> b!187085 (= lt!92452 (addApplyDifferent!146 lt!92454 lt!92445 (minValue!3656 thiss!1248) lt!92447))))

(assert (=> b!187085 (= (apply!170 (+!287 lt!92454 (tuple2!3437 lt!92445 (minValue!3656 thiss!1248))) lt!92447) (apply!170 lt!92454 lt!92447))))

(declare-fun lt!92450 () Unit!5605)

(assert (=> b!187085 (= lt!92450 lt!92452)))

(declare-fun lt!92459 () ListLongMap!2345)

(assert (=> b!187085 (= lt!92459 (getCurrentListMapNoExtraKeys!191 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92451 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92451 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92464 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92464 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!92456 () Unit!5605)

(assert (=> b!187085 (= lt!92456 (addApplyDifferent!146 lt!92459 lt!92451 (zeroValue!3656 thiss!1248) lt!92464))))

(assert (=> b!187085 (= (apply!170 (+!287 lt!92459 (tuple2!3437 lt!92451 (zeroValue!3656 thiss!1248))) lt!92464) (apply!170 lt!92459 lt!92464))))

(declare-fun lt!92465 () Unit!5605)

(assert (=> b!187085 (= lt!92465 lt!92456)))

(declare-fun lt!92455 () ListLongMap!2345)

(assert (=> b!187085 (= lt!92455 (getCurrentListMapNoExtraKeys!191 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3815 thiss!1248)))))

(declare-fun lt!92466 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92466 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!92457 () (_ BitVec 64))

(assert (=> b!187085 (= lt!92457 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!187085 (= lt!92463 (addApplyDifferent!146 lt!92455 lt!92466 (minValue!3656 thiss!1248) lt!92457))))

(assert (=> b!187085 (= (apply!170 (+!287 lt!92455 (tuple2!3437 lt!92466 (minValue!3656 thiss!1248))) lt!92457) (apply!170 lt!92455 lt!92457))))

(declare-fun b!187086 () Bool)

(declare-fun res!88441 () Bool)

(assert (=> b!187086 (=> (not res!88441) (not e!123130))))

(declare-fun e!123122 () Bool)

(assert (=> b!187086 (= res!88441 e!123122)))

(declare-fun res!88434 () Bool)

(assert (=> b!187086 (=> res!88434 e!123122)))

(declare-fun e!123126 () Bool)

(assert (=> b!187086 (= res!88434 (not e!123126))))

(declare-fun res!88439 () Bool)

(assert (=> b!187086 (=> (not res!88439) (not e!123126))))

(assert (=> b!187086 (= res!88439 (bvslt #b00000000000000000000000000000000 (size!4067 (_keys!5764 thiss!1248))))))

(declare-fun b!187087 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!187087 (= e!123131 (validKeyInArray!0 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18847 () Bool)

(declare-fun call!18851 () Bool)

(assert (=> bm!18847 (= call!18851 (contains!1294 lt!92449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!18848 () Bool)

(assert (=> bm!18848 (= call!18850 call!18852)))

(declare-fun b!187088 () Bool)

(assert (=> b!187088 (= e!123129 (not call!18851))))

(declare-fun b!187089 () Bool)

(assert (=> b!187089 (= e!123127 call!18847)))

(declare-fun b!187090 () Bool)

(assert (=> b!187090 (= e!123132 (+!287 call!18849 (tuple2!3437 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3656 thiss!1248))))))

(declare-fun b!187091 () Bool)

(assert (=> b!187091 (= e!123126 (validKeyInArray!0 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!187092 () Bool)

(assert (=> b!187092 (= e!123129 e!123123)))

(declare-fun res!88438 () Bool)

(assert (=> b!187092 (= res!88438 call!18851)))

(assert (=> b!187092 (=> (not res!88438) (not e!123123))))

(declare-fun b!187093 () Bool)

(declare-fun e!123128 () Bool)

(assert (=> b!187093 (= e!123122 e!123128)))

(declare-fun res!88435 () Bool)

(assert (=> b!187093 (=> (not res!88435) (not e!123128))))

(assert (=> b!187093 (= res!88435 (contains!1294 lt!92449 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!187093 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4067 (_keys!5764 thiss!1248))))))

(declare-fun bm!18849 () Bool)

(assert (=> bm!18849 (= call!18853 (contains!1294 lt!92449 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!187094 () Bool)

(assert (=> b!187094 (= e!123120 call!18847)))

(declare-fun b!187095 () Bool)

(declare-fun Unit!5614 () Unit!5605)

(assert (=> b!187095 (= e!123125 Unit!5614)))

(declare-fun b!187096 () Bool)

(assert (=> b!187096 (= e!123132 e!123120)))

(assert (=> b!187096 (= c!33588 (and (not (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3552 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!18850 () Bool)

(assert (=> bm!18850 (= call!18852 call!18848)))

(declare-fun b!187097 () Bool)

(declare-fun get!2157 (ValueCell!1844 V!5481) V!5481)

(declare-fun dynLambda!504 (Int (_ BitVec 64)) V!5481)

(assert (=> b!187097 (= e!123128 (= (apply!170 lt!92449 (select (arr!3748 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000)) (get!2157 (select (arr!3749 (_values!3798 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!504 (defaultEntry!3815 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!187097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4068 (_values!3798 thiss!1248))))))

(assert (=> b!187097 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4067 (_keys!5764 thiss!1248))))))

(assert (= (and d!55235 c!33590) b!187090))

(assert (= (and d!55235 (not c!33590)) b!187096))

(assert (= (and b!187096 c!33588) b!187094))

(assert (= (and b!187096 (not c!33588)) b!187083))

(assert (= (and b!187083 c!33589) b!187089))

(assert (= (and b!187083 (not c!33589)) b!187080))

(assert (= (or b!187089 b!187080) bm!18848))

(assert (= (or b!187094 bm!18848) bm!18850))

(assert (= (or b!187094 b!187089) bm!18846))

(assert (= (or b!187090 bm!18850) bm!18845))

(assert (= (or b!187090 bm!18846) bm!18844))

(assert (= (and d!55235 res!88433) b!187087))

(assert (= (and d!55235 c!33591) b!187085))

(assert (= (and d!55235 (not c!33591)) b!187095))

(assert (= (and d!55235 res!88440) b!187086))

(assert (= (and b!187086 res!88439) b!187091))

(assert (= (and b!187086 (not res!88434)) b!187093))

(assert (= (and b!187093 res!88435) b!187097))

(assert (= (and b!187086 res!88441) b!187077))

(assert (= (and b!187077 c!33587) b!187092))

(assert (= (and b!187077 (not c!33587)) b!187088))

(assert (= (and b!187092 res!88438) b!187081))

(assert (= (or b!187092 b!187088) bm!18847))

(assert (= (and b!187077 res!88436) b!187078))

(assert (= (and b!187078 c!33592) b!187082))

(assert (= (and b!187078 (not c!33592)) b!187084))

(assert (= (and b!187082 res!88437) b!187079))

(assert (= (or b!187082 b!187084) bm!18849))

(declare-fun b_lambda!7265 () Bool)

(assert (=> (not b_lambda!7265) (not b!187097)))

(declare-fun t!7251 () Bool)

(declare-fun tb!2843 () Bool)

(assert (=> (and b!186931 (= (defaultEntry!3815 thiss!1248) (defaultEntry!3815 thiss!1248)) t!7251) tb!2843))

(declare-fun result!4823 () Bool)

(assert (=> tb!2843 (= result!4823 tp_is_empty!4375)))

(assert (=> b!187097 t!7251))

(declare-fun b_and!11199 () Bool)

(assert (= b_and!11193 (and (=> t!7251 result!4823) b_and!11199)))

(declare-fun m!213445 () Bool)

(assert (=> b!187087 m!213445))

(assert (=> b!187087 m!213445))

(declare-fun m!213447 () Bool)

(assert (=> b!187087 m!213447))

(declare-fun m!213449 () Bool)

(assert (=> bm!18849 m!213449))

(declare-fun m!213451 () Bool)

(assert (=> bm!18844 m!213451))

(declare-fun m!213453 () Bool)

(assert (=> b!187081 m!213453))

(declare-fun m!213455 () Bool)

(assert (=> b!187085 m!213455))

(declare-fun m!213457 () Bool)

(assert (=> b!187085 m!213457))

(declare-fun m!213459 () Bool)

(assert (=> b!187085 m!213459))

(declare-fun m!213461 () Bool)

(assert (=> b!187085 m!213461))

(assert (=> b!187085 m!213455))

(declare-fun m!213463 () Bool)

(assert (=> b!187085 m!213463))

(declare-fun m!213465 () Bool)

(assert (=> b!187085 m!213465))

(declare-fun m!213467 () Bool)

(assert (=> b!187085 m!213467))

(declare-fun m!213469 () Bool)

(assert (=> b!187085 m!213469))

(assert (=> b!187085 m!213445))

(assert (=> b!187085 m!213465))

(declare-fun m!213471 () Bool)

(assert (=> b!187085 m!213471))

(declare-fun m!213473 () Bool)

(assert (=> b!187085 m!213473))

(declare-fun m!213475 () Bool)

(assert (=> b!187085 m!213475))

(declare-fun m!213477 () Bool)

(assert (=> b!187085 m!213477))

(assert (=> b!187085 m!213467))

(declare-fun m!213479 () Bool)

(assert (=> b!187085 m!213479))

(declare-fun m!213481 () Bool)

(assert (=> b!187085 m!213481))

(declare-fun m!213483 () Bool)

(assert (=> b!187085 m!213483))

(declare-fun m!213485 () Bool)

(assert (=> b!187085 m!213485))

(assert (=> b!187085 m!213473))

(assert (=> b!187097 m!213445))

(declare-fun m!213487 () Bool)

(assert (=> b!187097 m!213487))

(declare-fun m!213489 () Bool)

(assert (=> b!187097 m!213489))

(assert (=> b!187097 m!213445))

(assert (=> b!187097 m!213489))

(declare-fun m!213491 () Bool)

(assert (=> b!187097 m!213491))

(declare-fun m!213493 () Bool)

(assert (=> b!187097 m!213493))

(assert (=> b!187097 m!213491))

(assert (=> b!187091 m!213445))

(assert (=> b!187091 m!213445))

(assert (=> b!187091 m!213447))

(declare-fun m!213495 () Bool)

(assert (=> bm!18847 m!213495))

(assert (=> bm!18845 m!213485))

(declare-fun m!213497 () Bool)

(assert (=> b!187079 m!213497))

(assert (=> b!187093 m!213445))

(assert (=> b!187093 m!213445))

(declare-fun m!213499 () Bool)

(assert (=> b!187093 m!213499))

(assert (=> d!55235 m!213359))

(declare-fun m!213501 () Bool)

(assert (=> b!187090 m!213501))

(assert (=> b!186941 d!55235))

(declare-fun d!55237 () Bool)

(assert (=> d!55237 (= (array_inv!2427 (_keys!5764 thiss!1248)) (bvsge (size!4067 (_keys!5764 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186931 d!55237))

(declare-fun d!55239 () Bool)

(assert (=> d!55239 (= (array_inv!2428 (_values!3798 thiss!1248)) (bvsge (size!4068 (_values!3798 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!186931 d!55239))

(declare-fun d!55241 () Bool)

(declare-fun res!88448 () Bool)

(declare-fun e!123135 () Bool)

(assert (=> d!55241 (=> (not res!88448) (not e!123135))))

(declare-fun simpleValid!186 (LongMapFixedSize!2596) Bool)

(assert (=> d!55241 (= res!88448 (simpleValid!186 thiss!1248))))

(assert (=> d!55241 (= (valid!1088 thiss!1248) e!123135)))

(declare-fun b!187106 () Bool)

(declare-fun res!88449 () Bool)

(assert (=> b!187106 (=> (not res!88449) (not e!123135))))

(declare-fun arrayCountValidKeys!0 (array!7945 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!187106 (= res!88449 (= (arrayCountValidKeys!0 (_keys!5764 thiss!1248) #b00000000000000000000000000000000 (size!4067 (_keys!5764 thiss!1248))) (_size!1347 thiss!1248)))))

(declare-fun b!187107 () Bool)

(declare-fun res!88450 () Bool)

(assert (=> b!187107 (=> (not res!88450) (not e!123135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7945 (_ BitVec 32)) Bool)

(assert (=> b!187107 (= res!88450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5764 thiss!1248) (mask!8954 thiss!1248)))))

(declare-fun b!187108 () Bool)

(declare-datatypes ((List!2369 0))(
  ( (Nil!2366) (Cons!2365 (h!3000 (_ BitVec 64)) (t!7252 List!2369)) )
))
(declare-fun arrayNoDuplicates!0 (array!7945 (_ BitVec 32) List!2369) Bool)

(assert (=> b!187108 (= e!123135 (arrayNoDuplicates!0 (_keys!5764 thiss!1248) #b00000000000000000000000000000000 Nil!2366))))

(assert (= (and d!55241 res!88448) b!187106))

(assert (= (and b!187106 res!88449) b!187107))

(assert (= (and b!187107 res!88450) b!187108))

(declare-fun m!213503 () Bool)

(assert (=> d!55241 m!213503))

(declare-fun m!213505 () Bool)

(assert (=> b!187106 m!213505))

(declare-fun m!213507 () Bool)

(assert (=> b!187107 m!213507))

(declare-fun m!213509 () Bool)

(assert (=> b!187108 m!213509))

(assert (=> start!18976 d!55241))

(declare-fun d!55243 () Bool)

(declare-fun e!123138 () Bool)

(assert (=> d!55243 e!123138))

(declare-fun res!88455 () Bool)

(assert (=> d!55243 (=> (not res!88455) (not e!123138))))

(declare-fun lt!92471 () SeekEntryResult!648)

(assert (=> d!55243 (= res!88455 ((_ is Found!648) lt!92471))))

(assert (=> d!55243 (= lt!92471 (seekEntryOrOpen!0 key!828 (_keys!5764 thiss!1248) (mask!8954 thiss!1248)))))

(declare-fun lt!92472 () Unit!5605)

(declare-fun choose!1001 (array!7945 array!7947 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5605)

(assert (=> d!55243 (= lt!92472 (choose!1001 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(assert (=> d!55243 (validMask!0 (mask!8954 thiss!1248))))

(assert (=> d!55243 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!147 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)) lt!92472)))

(declare-fun b!187113 () Bool)

(declare-fun res!88456 () Bool)

(assert (=> b!187113 (=> (not res!88456) (not e!123138))))

(assert (=> b!187113 (= res!88456 (inRange!0 (index!4763 lt!92471) (mask!8954 thiss!1248)))))

(declare-fun b!187114 () Bool)

(assert (=> b!187114 (= e!123138 (= (select (arr!3748 (_keys!5764 thiss!1248)) (index!4763 lt!92471)) key!828))))

(assert (=> b!187114 (and (bvsge (index!4763 lt!92471) #b00000000000000000000000000000000) (bvslt (index!4763 lt!92471) (size!4067 (_keys!5764 thiss!1248))))))

(assert (= (and d!55243 res!88455) b!187113))

(assert (= (and b!187113 res!88456) b!187114))

(assert (=> d!55243 m!213357))

(declare-fun m!213511 () Bool)

(assert (=> d!55243 m!213511))

(assert (=> d!55243 m!213359))

(declare-fun m!213513 () Bool)

(assert (=> b!187113 m!213513))

(declare-fun m!213515 () Bool)

(assert (=> b!187114 m!213515))

(assert (=> b!186935 d!55243))

(declare-fun d!55245 () Bool)

(assert (=> d!55245 (= (inRange!0 (index!4763 lt!92354) (mask!8954 thiss!1248)) (and (bvsge (index!4763 lt!92354) #b00000000000000000000000000000000) (bvslt (index!4763 lt!92354) (bvadd (mask!8954 thiss!1248) #b00000000000000000000000000000001))))))

(assert (=> b!186935 d!55245))

(declare-fun bm!18855 () Bool)

(declare-fun call!18858 () Bool)

(declare-fun arrayContainsKey!0 (array!7945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18855 (= call!18858 (arrayContainsKey!0 (_keys!5764 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!187131 () Bool)

(declare-fun e!123148 () Bool)

(declare-fun e!123147 () Bool)

(assert (=> b!187131 (= e!123148 e!123147)))

(declare-fun c!33597 () Bool)

(declare-fun lt!92478 () SeekEntryResult!648)

(assert (=> b!187131 (= c!33597 ((_ is MissingVacant!648) lt!92478))))

(declare-fun b!187132 () Bool)

(declare-fun res!88465 () Bool)

(declare-fun e!123150 () Bool)

(assert (=> b!187132 (=> (not res!88465) (not e!123150))))

(declare-fun call!18859 () Bool)

(assert (=> b!187132 (= res!88465 call!18859)))

(assert (=> b!187132 (= e!123147 e!123150)))

(declare-fun b!187133 () Bool)

(declare-fun e!123149 () Bool)

(assert (=> b!187133 (= e!123149 (not call!18858))))

(declare-fun b!187134 () Bool)

(assert (=> b!187134 (= e!123150 (not call!18858))))

(declare-fun d!55247 () Bool)

(assert (=> d!55247 e!123148))

(declare-fun c!33598 () Bool)

(assert (=> d!55247 (= c!33598 ((_ is MissingZero!648) lt!92478))))

(assert (=> d!55247 (= lt!92478 (seekEntryOrOpen!0 key!828 (_keys!5764 thiss!1248) (mask!8954 thiss!1248)))))

(declare-fun lt!92477 () Unit!5605)

(declare-fun choose!1002 (array!7945 array!7947 (_ BitVec 32) (_ BitVec 32) V!5481 V!5481 (_ BitVec 64) Int) Unit!5605)

(assert (=> d!55247 (= lt!92477 (choose!1002 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)))))

(assert (=> d!55247 (validMask!0 (mask!8954 thiss!1248))))

(assert (=> d!55247 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!145 (_keys!5764 thiss!1248) (_values!3798 thiss!1248) (mask!8954 thiss!1248) (extraKeys!3552 thiss!1248) (zeroValue!3656 thiss!1248) (minValue!3656 thiss!1248) key!828 (defaultEntry!3815 thiss!1248)) lt!92477)))

(declare-fun b!187135 () Bool)

(assert (=> b!187135 (= e!123148 e!123149)))

(declare-fun res!88466 () Bool)

(assert (=> b!187135 (= res!88466 call!18859)))

(assert (=> b!187135 (=> (not res!88466) (not e!123149))))

(declare-fun bm!18856 () Bool)

(assert (=> bm!18856 (= call!18859 (inRange!0 (ite c!33598 (index!4762 lt!92478) (index!4765 lt!92478)) (mask!8954 thiss!1248)))))

(declare-fun b!187136 () Bool)

(assert (=> b!187136 (= e!123147 ((_ is Undefined!648) lt!92478))))

(declare-fun b!187137 () Bool)

(declare-fun res!88468 () Bool)

(assert (=> b!187137 (=> (not res!88468) (not e!123150))))

(assert (=> b!187137 (= res!88468 (= (select (arr!3748 (_keys!5764 thiss!1248)) (index!4765 lt!92478)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187137 (and (bvsge (index!4765 lt!92478) #b00000000000000000000000000000000) (bvslt (index!4765 lt!92478) (size!4067 (_keys!5764 thiss!1248))))))

(declare-fun b!187138 () Bool)

(assert (=> b!187138 (and (bvsge (index!4762 lt!92478) #b00000000000000000000000000000000) (bvslt (index!4762 lt!92478) (size!4067 (_keys!5764 thiss!1248))))))

(declare-fun res!88467 () Bool)

(assert (=> b!187138 (= res!88467 (= (select (arr!3748 (_keys!5764 thiss!1248)) (index!4762 lt!92478)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!187138 (=> (not res!88467) (not e!123149))))

(assert (= (and d!55247 c!33598) b!187135))

(assert (= (and d!55247 (not c!33598)) b!187131))

(assert (= (and b!187135 res!88466) b!187138))

(assert (= (and b!187138 res!88467) b!187133))

(assert (= (and b!187131 c!33597) b!187132))

(assert (= (and b!187131 (not c!33597)) b!187136))

(assert (= (and b!187132 res!88465) b!187137))

(assert (= (and b!187137 res!88468) b!187134))

(assert (= (or b!187135 b!187132) bm!18856))

(assert (= (or b!187133 b!187134) bm!18855))

(declare-fun m!213517 () Bool)

(assert (=> b!187138 m!213517))

(assert (=> d!55247 m!213357))

(declare-fun m!213519 () Bool)

(assert (=> d!55247 m!213519))

(assert (=> d!55247 m!213359))

(declare-fun m!213521 () Bool)

(assert (=> b!187137 m!213521))

(declare-fun m!213523 () Bool)

(assert (=> bm!18855 m!213523))

(declare-fun m!213525 () Bool)

(assert (=> bm!18856 m!213525))

(assert (=> b!186933 d!55247))

(declare-fun mapNonEmpty!7544 () Bool)

(declare-fun mapRes!7544 () Bool)

(declare-fun tp!16634 () Bool)

(declare-fun e!123156 () Bool)

(assert (=> mapNonEmpty!7544 (= mapRes!7544 (and tp!16634 e!123156))))

(declare-fun mapRest!7544 () (Array (_ BitVec 32) ValueCell!1844))

(declare-fun mapKey!7544 () (_ BitVec 32))

(declare-fun mapValue!7544 () ValueCell!1844)

(assert (=> mapNonEmpty!7544 (= mapRest!7535 (store mapRest!7544 mapKey!7544 mapValue!7544))))

(declare-fun condMapEmpty!7544 () Bool)

(declare-fun mapDefault!7544 () ValueCell!1844)

(assert (=> mapNonEmpty!7535 (= condMapEmpty!7544 (= mapRest!7535 ((as const (Array (_ BitVec 32) ValueCell!1844)) mapDefault!7544)))))

(declare-fun e!123155 () Bool)

(assert (=> mapNonEmpty!7535 (= tp!16619 (and e!123155 mapRes!7544))))

(declare-fun b!187146 () Bool)

(assert (=> b!187146 (= e!123155 tp_is_empty!4375)))

(declare-fun b!187145 () Bool)

(assert (=> b!187145 (= e!123156 tp_is_empty!4375)))

(declare-fun mapIsEmpty!7544 () Bool)

(assert (=> mapIsEmpty!7544 mapRes!7544))

(assert (= (and mapNonEmpty!7535 condMapEmpty!7544) mapIsEmpty!7544))

(assert (= (and mapNonEmpty!7535 (not condMapEmpty!7544)) mapNonEmpty!7544))

(assert (= (and mapNonEmpty!7544 ((_ is ValueCellFull!1844) mapValue!7544)) b!187145))

(assert (= (and mapNonEmpty!7535 ((_ is ValueCellFull!1844) mapDefault!7544)) b!187146))

(declare-fun m!213527 () Bool)

(assert (=> mapNonEmpty!7544 m!213527))

(declare-fun b_lambda!7267 () Bool)

(assert (= b_lambda!7265 (or (and b!186931 b_free!4603) b_lambda!7267)))

(check-sat (not b!187034) (not b_next!4603) (not b!187091) (not b!187106) (not b!187108) (not d!55235) (not b_lambda!7267) (not bm!18849) (not b!187085) (not b!187093) (not bm!18845) (not b!187113) (not d!55229) (not b!187090) (not b!187024) (not b!187087) (not bm!18844) (not bm!18847) (not d!55233) tp_is_empty!4375 (not b!187032) (not bm!18855) (not mapNonEmpty!7544) (not bm!18856) (not d!55247) (not b!187097) (not b!187107) (not d!55241) (not b!187079) (not d!55243) (not b!187081) b_and!11199)
(check-sat b_and!11199 (not b_next!4603))
