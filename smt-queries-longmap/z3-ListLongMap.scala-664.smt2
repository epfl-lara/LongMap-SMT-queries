; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16404 () Bool)

(assert start!16404)

(declare-fun b!163218 () Bool)

(declare-fun b_free!3793 () Bool)

(declare-fun b_next!3793 () Bool)

(assert (=> b!163218 (= b_free!3793 (not b_next!3793))))

(declare-fun tp!13962 () Bool)

(declare-fun b_and!10181 () Bool)

(assert (=> b!163218 (= tp!13962 b_and!10181)))

(declare-fun res!77223 () Bool)

(declare-fun e!107079 () Bool)

(assert (=> start!16404 (=> (not res!77223) (not e!107079))))

(declare-datatypes ((V!4441 0))(
  ( (V!4442 (val!1842 Int)) )
))
(declare-datatypes ((ValueCell!1454 0))(
  ( (ValueCellFull!1454 (v!3701 V!4441)) (EmptyCell!1454) )
))
(declare-datatypes ((array!6257 0))(
  ( (array!6258 (arr!2968 (Array (_ BitVec 32) (_ BitVec 64))) (size!3255 (_ BitVec 32))) )
))
(declare-datatypes ((array!6259 0))(
  ( (array!6260 (arr!2969 (Array (_ BitVec 32) ValueCell!1454)) (size!3256 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1816 0))(
  ( (LongMapFixedSize!1817 (defaultEntry!3350 Int) (mask!8005 (_ BitVec 32)) (extraKeys!3091 (_ BitVec 32)) (zeroValue!3193 V!4441) (minValue!3193 V!4441) (_size!957 (_ BitVec 32)) (_keys!5160 array!6257) (_values!3333 array!6259) (_vacant!957 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1816)

(declare-fun valid!820 (LongMapFixedSize!1816) Bool)

(assert (=> start!16404 (= res!77223 (valid!820 thiss!1248))))

(assert (=> start!16404 e!107079))

(declare-fun e!107077 () Bool)

(assert (=> start!16404 e!107077))

(assert (=> start!16404 true))

(declare-fun b!163212 () Bool)

(declare-fun e!107078 () Bool)

(declare-fun tp_is_empty!3595 () Bool)

(assert (=> b!163212 (= e!107078 tp_is_empty!3595)))

(declare-fun b!163213 () Bool)

(declare-fun res!77224 () Bool)

(declare-fun e!107081 () Bool)

(assert (=> b!163213 (=> (not res!77224) (not e!107081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!163213 (= res!77224 (validMask!0 (mask!8005 thiss!1248)))))

(declare-fun mapIsEmpty!6094 () Bool)

(declare-fun mapRes!6094 () Bool)

(assert (=> mapIsEmpty!6094 mapRes!6094))

(declare-fun b!163214 () Bool)

(declare-fun e!107076 () Bool)

(assert (=> b!163214 (= e!107076 tp_is_empty!3595)))

(declare-fun b!163215 () Bool)

(assert (=> b!163215 (= e!107079 e!107081)))

(declare-fun res!77225 () Bool)

(assert (=> b!163215 (=> (not res!77225) (not e!107081))))

(declare-datatypes ((SeekEntryResult!409 0))(
  ( (MissingZero!409 (index!3804 (_ BitVec 32))) (Found!409 (index!3805 (_ BitVec 32))) (Intermediate!409 (undefined!1221 Bool) (index!3806 (_ BitVec 32)) (x!18114 (_ BitVec 32))) (Undefined!409) (MissingVacant!409 (index!3807 (_ BitVec 32))) )
))
(declare-fun lt!82488 () SeekEntryResult!409)

(get-info :version)

(assert (=> b!163215 (= res!77225 (and (not ((_ is Undefined!409) lt!82488)) (not ((_ is MissingVacant!409) lt!82488)) (not ((_ is MissingZero!409) lt!82488)) ((_ is Found!409) lt!82488)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6257 (_ BitVec 32)) SeekEntryResult!409)

(assert (=> b!163215 (= lt!82488 (seekEntryOrOpen!0 key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)))))

(declare-fun b!163216 () Bool)

(declare-fun res!77222 () Bool)

(assert (=> b!163216 (=> (not res!77222) (not e!107079))))

(assert (=> b!163216 (= res!77222 (not (= key!828 (bvneg key!828))))))

(declare-fun b!163217 () Bool)

(declare-fun e!107080 () Bool)

(assert (=> b!163217 (= e!107080 (and e!107078 mapRes!6094))))

(declare-fun condMapEmpty!6094 () Bool)

(declare-fun mapDefault!6094 () ValueCell!1454)

(assert (=> b!163217 (= condMapEmpty!6094 (= (arr!2969 (_values!3333 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1454)) mapDefault!6094)))))

(declare-fun array_inv!1909 (array!6257) Bool)

(declare-fun array_inv!1910 (array!6259) Bool)

(assert (=> b!163218 (= e!107077 (and tp!13962 tp_is_empty!3595 (array_inv!1909 (_keys!5160 thiss!1248)) (array_inv!1910 (_values!3333 thiss!1248)) e!107080))))

(declare-fun b!163219 () Bool)

(assert (=> b!163219 (= e!107081 (and (= (size!3256 (_values!3333 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8005 thiss!1248))) (= (size!3255 (_keys!5160 thiss!1248)) (size!3256 (_values!3333 thiss!1248))) (bvsge (mask!8005 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3091 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!6094 () Bool)

(declare-fun tp!13963 () Bool)

(assert (=> mapNonEmpty!6094 (= mapRes!6094 (and tp!13963 e!107076))))

(declare-fun mapValue!6094 () ValueCell!1454)

(declare-fun mapKey!6094 () (_ BitVec 32))

(declare-fun mapRest!6094 () (Array (_ BitVec 32) ValueCell!1454))

(assert (=> mapNonEmpty!6094 (= (arr!2969 (_values!3333 thiss!1248)) (store mapRest!6094 mapKey!6094 mapValue!6094))))

(assert (= (and start!16404 res!77223) b!163216))

(assert (= (and b!163216 res!77222) b!163215))

(assert (= (and b!163215 res!77225) b!163213))

(assert (= (and b!163213 res!77224) b!163219))

(assert (= (and b!163217 condMapEmpty!6094) mapIsEmpty!6094))

(assert (= (and b!163217 (not condMapEmpty!6094)) mapNonEmpty!6094))

(assert (= (and mapNonEmpty!6094 ((_ is ValueCellFull!1454) mapValue!6094)) b!163214))

(assert (= (and b!163217 ((_ is ValueCellFull!1454) mapDefault!6094)) b!163212))

(assert (= b!163218 b!163217))

(assert (= start!16404 b!163218))

(declare-fun m!193451 () Bool)

(assert (=> b!163218 m!193451))

(declare-fun m!193453 () Bool)

(assert (=> b!163218 m!193453))

(declare-fun m!193455 () Bool)

(assert (=> mapNonEmpty!6094 m!193455))

(declare-fun m!193457 () Bool)

(assert (=> b!163213 m!193457))

(declare-fun m!193459 () Bool)

(assert (=> start!16404 m!193459))

(declare-fun m!193461 () Bool)

(assert (=> b!163215 m!193461))

(check-sat (not start!16404) (not mapNonEmpty!6094) tp_is_empty!3595 (not b!163215) (not b_next!3793) (not b!163218) (not b!163213) b_and!10181)
(check-sat b_and!10181 (not b_next!3793))
(get-model)

(declare-fun d!51285 () Bool)

(assert (=> d!51285 (= (validMask!0 (mask!8005 thiss!1248)) (and (or (= (mask!8005 thiss!1248) #b00000000000000000000000000000111) (= (mask!8005 thiss!1248) #b00000000000000000000000000001111) (= (mask!8005 thiss!1248) #b00000000000000000000000000011111) (= (mask!8005 thiss!1248) #b00000000000000000000000000111111) (= (mask!8005 thiss!1248) #b00000000000000000000000001111111) (= (mask!8005 thiss!1248) #b00000000000000000000000011111111) (= (mask!8005 thiss!1248) #b00000000000000000000000111111111) (= (mask!8005 thiss!1248) #b00000000000000000000001111111111) (= (mask!8005 thiss!1248) #b00000000000000000000011111111111) (= (mask!8005 thiss!1248) #b00000000000000000000111111111111) (= (mask!8005 thiss!1248) #b00000000000000000001111111111111) (= (mask!8005 thiss!1248) #b00000000000000000011111111111111) (= (mask!8005 thiss!1248) #b00000000000000000111111111111111) (= (mask!8005 thiss!1248) #b00000000000000001111111111111111) (= (mask!8005 thiss!1248) #b00000000000000011111111111111111) (= (mask!8005 thiss!1248) #b00000000000000111111111111111111) (= (mask!8005 thiss!1248) #b00000000000001111111111111111111) (= (mask!8005 thiss!1248) #b00000000000011111111111111111111) (= (mask!8005 thiss!1248) #b00000000000111111111111111111111) (= (mask!8005 thiss!1248) #b00000000001111111111111111111111) (= (mask!8005 thiss!1248) #b00000000011111111111111111111111) (= (mask!8005 thiss!1248) #b00000000111111111111111111111111) (= (mask!8005 thiss!1248) #b00000001111111111111111111111111) (= (mask!8005 thiss!1248) #b00000011111111111111111111111111) (= (mask!8005 thiss!1248) #b00000111111111111111111111111111) (= (mask!8005 thiss!1248) #b00001111111111111111111111111111) (= (mask!8005 thiss!1248) #b00011111111111111111111111111111) (= (mask!8005 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8005 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!163213 d!51285))

(declare-fun d!51287 () Bool)

(assert (=> d!51287 (= (array_inv!1909 (_keys!5160 thiss!1248)) (bvsge (size!3255 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163218 d!51287))

(declare-fun d!51289 () Bool)

(assert (=> d!51289 (= (array_inv!1910 (_values!3333 thiss!1248)) (bvsge (size!3256 (_values!3333 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!163218 d!51289))

(declare-fun b!163280 () Bool)

(declare-fun e!107130 () SeekEntryResult!409)

(declare-fun lt!82501 () SeekEntryResult!409)

(assert (=> b!163280 (= e!107130 (Found!409 (index!3806 lt!82501)))))

(declare-fun e!107132 () SeekEntryResult!409)

(declare-fun b!163281 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6257 (_ BitVec 32)) SeekEntryResult!409)

(assert (=> b!163281 (= e!107132 (seekKeyOrZeroReturnVacant!0 (x!18114 lt!82501) (index!3806 lt!82501) (index!3806 lt!82501) key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)))))

(declare-fun b!163282 () Bool)

(declare-fun e!107131 () SeekEntryResult!409)

(assert (=> b!163282 (= e!107131 e!107130)))

(declare-fun lt!82502 () (_ BitVec 64))

(assert (=> b!163282 (= lt!82502 (select (arr!2968 (_keys!5160 thiss!1248)) (index!3806 lt!82501)))))

(declare-fun c!30056 () Bool)

(assert (=> b!163282 (= c!30056 (= lt!82502 key!828))))

(declare-fun b!163283 () Bool)

(declare-fun c!30054 () Bool)

(assert (=> b!163283 (= c!30054 (= lt!82502 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163283 (= e!107130 e!107132)))

(declare-fun d!51291 () Bool)

(declare-fun lt!82503 () SeekEntryResult!409)

(assert (=> d!51291 (and (or ((_ is Undefined!409) lt!82503) (not ((_ is Found!409) lt!82503)) (and (bvsge (index!3805 lt!82503) #b00000000000000000000000000000000) (bvslt (index!3805 lt!82503) (size!3255 (_keys!5160 thiss!1248))))) (or ((_ is Undefined!409) lt!82503) ((_ is Found!409) lt!82503) (not ((_ is MissingZero!409) lt!82503)) (and (bvsge (index!3804 lt!82503) #b00000000000000000000000000000000) (bvslt (index!3804 lt!82503) (size!3255 (_keys!5160 thiss!1248))))) (or ((_ is Undefined!409) lt!82503) ((_ is Found!409) lt!82503) ((_ is MissingZero!409) lt!82503) (not ((_ is MissingVacant!409) lt!82503)) (and (bvsge (index!3807 lt!82503) #b00000000000000000000000000000000) (bvslt (index!3807 lt!82503) (size!3255 (_keys!5160 thiss!1248))))) (or ((_ is Undefined!409) lt!82503) (ite ((_ is Found!409) lt!82503) (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3805 lt!82503)) key!828) (ite ((_ is MissingZero!409) lt!82503) (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3804 lt!82503)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!409) lt!82503) (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3807 lt!82503)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!51291 (= lt!82503 e!107131)))

(declare-fun c!30055 () Bool)

(assert (=> d!51291 (= c!30055 (and ((_ is Intermediate!409) lt!82501) (undefined!1221 lt!82501)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!6257 (_ BitVec 32)) SeekEntryResult!409)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!51291 (= lt!82501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8005 thiss!1248)) key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)))))

(assert (=> d!51291 (validMask!0 (mask!8005 thiss!1248))))

(assert (=> d!51291 (= (seekEntryOrOpen!0 key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)) lt!82503)))

(declare-fun b!163284 () Bool)

(assert (=> b!163284 (= e!107131 Undefined!409)))

(declare-fun b!163285 () Bool)

(assert (=> b!163285 (= e!107132 (MissingZero!409 (index!3806 lt!82501)))))

(assert (= (and d!51291 c!30055) b!163284))

(assert (= (and d!51291 (not c!30055)) b!163282))

(assert (= (and b!163282 c!30056) b!163280))

(assert (= (and b!163282 (not c!30056)) b!163283))

(assert (= (and b!163283 c!30054) b!163285))

(assert (= (and b!163283 (not c!30054)) b!163281))

(declare-fun m!193487 () Bool)

(assert (=> b!163281 m!193487))

(declare-fun m!193489 () Bool)

(assert (=> b!163282 m!193489))

(declare-fun m!193491 () Bool)

(assert (=> d!51291 m!193491))

(declare-fun m!193493 () Bool)

(assert (=> d!51291 m!193493))

(declare-fun m!193495 () Bool)

(assert (=> d!51291 m!193495))

(assert (=> d!51291 m!193493))

(declare-fun m!193497 () Bool)

(assert (=> d!51291 m!193497))

(declare-fun m!193499 () Bool)

(assert (=> d!51291 m!193499))

(assert (=> d!51291 m!193457))

(assert (=> b!163215 d!51291))

(declare-fun d!51293 () Bool)

(declare-fun res!77256 () Bool)

(declare-fun e!107135 () Bool)

(assert (=> d!51293 (=> (not res!77256) (not e!107135))))

(declare-fun simpleValid!122 (LongMapFixedSize!1816) Bool)

(assert (=> d!51293 (= res!77256 (simpleValid!122 thiss!1248))))

(assert (=> d!51293 (= (valid!820 thiss!1248) e!107135)))

(declare-fun b!163292 () Bool)

(declare-fun res!77257 () Bool)

(assert (=> b!163292 (=> (not res!77257) (not e!107135))))

(declare-fun arrayCountValidKeys!0 (array!6257 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163292 (= res!77257 (= (arrayCountValidKeys!0 (_keys!5160 thiss!1248) #b00000000000000000000000000000000 (size!3255 (_keys!5160 thiss!1248))) (_size!957 thiss!1248)))))

(declare-fun b!163293 () Bool)

(declare-fun res!77258 () Bool)

(assert (=> b!163293 (=> (not res!77258) (not e!107135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6257 (_ BitVec 32)) Bool)

(assert (=> b!163293 (= res!77258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)))))

(declare-fun b!163294 () Bool)

(declare-datatypes ((List!1997 0))(
  ( (Nil!1994) (Cons!1993 (h!2608 (_ BitVec 64)) (t!6790 List!1997)) )
))
(declare-fun arrayNoDuplicates!0 (array!6257 (_ BitVec 32) List!1997) Bool)

(assert (=> b!163294 (= e!107135 (arrayNoDuplicates!0 (_keys!5160 thiss!1248) #b00000000000000000000000000000000 Nil!1994))))

(assert (= (and d!51293 res!77256) b!163292))

(assert (= (and b!163292 res!77257) b!163293))

(assert (= (and b!163293 res!77258) b!163294))

(declare-fun m!193501 () Bool)

(assert (=> d!51293 m!193501))

(declare-fun m!193503 () Bool)

(assert (=> b!163292 m!193503))

(declare-fun m!193505 () Bool)

(assert (=> b!163293 m!193505))

(declare-fun m!193507 () Bool)

(assert (=> b!163294 m!193507))

(assert (=> start!16404 d!51293))

(declare-fun b!163301 () Bool)

(declare-fun e!107140 () Bool)

(assert (=> b!163301 (= e!107140 tp_is_empty!3595)))

(declare-fun b!163302 () Bool)

(declare-fun e!107141 () Bool)

(assert (=> b!163302 (= e!107141 tp_is_empty!3595)))

(declare-fun condMapEmpty!6103 () Bool)

(declare-fun mapDefault!6103 () ValueCell!1454)

(assert (=> mapNonEmpty!6094 (= condMapEmpty!6103 (= mapRest!6094 ((as const (Array (_ BitVec 32) ValueCell!1454)) mapDefault!6103)))))

(declare-fun mapRes!6103 () Bool)

(assert (=> mapNonEmpty!6094 (= tp!13963 (and e!107141 mapRes!6103))))

(declare-fun mapIsEmpty!6103 () Bool)

(assert (=> mapIsEmpty!6103 mapRes!6103))

(declare-fun mapNonEmpty!6103 () Bool)

(declare-fun tp!13978 () Bool)

(assert (=> mapNonEmpty!6103 (= mapRes!6103 (and tp!13978 e!107140))))

(declare-fun mapValue!6103 () ValueCell!1454)

(declare-fun mapRest!6103 () (Array (_ BitVec 32) ValueCell!1454))

(declare-fun mapKey!6103 () (_ BitVec 32))

(assert (=> mapNonEmpty!6103 (= mapRest!6094 (store mapRest!6103 mapKey!6103 mapValue!6103))))

(assert (= (and mapNonEmpty!6094 condMapEmpty!6103) mapIsEmpty!6103))

(assert (= (and mapNonEmpty!6094 (not condMapEmpty!6103)) mapNonEmpty!6103))

(assert (= (and mapNonEmpty!6103 ((_ is ValueCellFull!1454) mapValue!6103)) b!163301))

(assert (= (and mapNonEmpty!6094 ((_ is ValueCellFull!1454) mapDefault!6103)) b!163302))

(declare-fun m!193509 () Bool)

(assert (=> mapNonEmpty!6103 m!193509))

(check-sat tp_is_empty!3595 (not d!51291) (not b!163294) (not b!163281) (not b!163293) (not mapNonEmpty!6103) (not d!51293) b_and!10181 (not b_next!3793) (not b!163292))
(check-sat b_and!10181 (not b_next!3793))
(get-model)

(declare-fun b!163321 () Bool)

(declare-fun lt!82508 () SeekEntryResult!409)

(assert (=> b!163321 (and (bvsge (index!3806 lt!82508) #b00000000000000000000000000000000) (bvslt (index!3806 lt!82508) (size!3255 (_keys!5160 thiss!1248))))))

(declare-fun e!107156 () Bool)

(assert (=> b!163321 (= e!107156 (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3806 lt!82508)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!163322 () Bool)

(declare-fun e!107155 () Bool)

(assert (=> b!163322 (= e!107155 (bvsge (x!18114 lt!82508) #b01111111111111111111111111111110))))

(declare-fun b!163323 () Bool)

(declare-fun e!107154 () SeekEntryResult!409)

(declare-fun e!107152 () SeekEntryResult!409)

(assert (=> b!163323 (= e!107154 e!107152)))

(declare-fun c!30065 () Bool)

(declare-fun lt!82509 () (_ BitVec 64))

(assert (=> b!163323 (= c!30065 (or (= lt!82509 key!828) (= (bvadd lt!82509 lt!82509) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!163324 () Bool)

(assert (=> b!163324 (= e!107152 (Intermediate!409 false (toIndex!0 key!828 (mask!8005 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163325 () Bool)

(assert (=> b!163325 (= e!107154 (Intermediate!409 true (toIndex!0 key!828 (mask!8005 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!163326 () Bool)

(declare-fun e!107153 () Bool)

(assert (=> b!163326 (= e!107155 e!107153)))

(declare-fun res!77267 () Bool)

(assert (=> b!163326 (= res!77267 (and ((_ is Intermediate!409) lt!82508) (not (undefined!1221 lt!82508)) (bvslt (x!18114 lt!82508) #b01111111111111111111111111111110) (bvsge (x!18114 lt!82508) #b00000000000000000000000000000000) (bvsge (x!18114 lt!82508) #b00000000000000000000000000000000)))))

(assert (=> b!163326 (=> (not res!77267) (not e!107153))))

(declare-fun b!163327 () Bool)

(assert (=> b!163327 (and (bvsge (index!3806 lt!82508) #b00000000000000000000000000000000) (bvslt (index!3806 lt!82508) (size!3255 (_keys!5160 thiss!1248))))))

(declare-fun res!77265 () Bool)

(assert (=> b!163327 (= res!77265 (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3806 lt!82508)) key!828))))

(assert (=> b!163327 (=> res!77265 e!107156)))

(assert (=> b!163327 (= e!107153 e!107156)))

(declare-fun b!163328 () Bool)

(assert (=> b!163328 (and (bvsge (index!3806 lt!82508) #b00000000000000000000000000000000) (bvslt (index!3806 lt!82508) (size!3255 (_keys!5160 thiss!1248))))))

(declare-fun res!77266 () Bool)

(assert (=> b!163328 (= res!77266 (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3806 lt!82508)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!163328 (=> res!77266 e!107156)))

(declare-fun b!163329 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!163329 (= e!107152 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8005 thiss!1248)) #b00000000000000000000000000000000 (mask!8005 thiss!1248)) key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)))))

(declare-fun d!51295 () Bool)

(assert (=> d!51295 e!107155))

(declare-fun c!30063 () Bool)

(assert (=> d!51295 (= c!30063 (and ((_ is Intermediate!409) lt!82508) (undefined!1221 lt!82508)))))

(assert (=> d!51295 (= lt!82508 e!107154)))

(declare-fun c!30064 () Bool)

(assert (=> d!51295 (= c!30064 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!51295 (= lt!82509 (select (arr!2968 (_keys!5160 thiss!1248)) (toIndex!0 key!828 (mask!8005 thiss!1248))))))

(assert (=> d!51295 (validMask!0 (mask!8005 thiss!1248))))

(assert (=> d!51295 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8005 thiss!1248)) key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)) lt!82508)))

(assert (= (and d!51295 c!30064) b!163325))

(assert (= (and d!51295 (not c!30064)) b!163323))

(assert (= (and b!163323 c!30065) b!163324))

(assert (= (and b!163323 (not c!30065)) b!163329))

(assert (= (and d!51295 c!30063) b!163322))

(assert (= (and d!51295 (not c!30063)) b!163326))

(assert (= (and b!163326 res!77267) b!163327))

(assert (= (and b!163327 (not res!77265)) b!163328))

(assert (= (and b!163328 (not res!77266)) b!163321))

(declare-fun m!193511 () Bool)

(assert (=> b!163321 m!193511))

(assert (=> b!163327 m!193511))

(assert (=> b!163329 m!193493))

(declare-fun m!193513 () Bool)

(assert (=> b!163329 m!193513))

(assert (=> b!163329 m!193513))

(declare-fun m!193515 () Bool)

(assert (=> b!163329 m!193515))

(assert (=> d!51295 m!193493))

(declare-fun m!193517 () Bool)

(assert (=> d!51295 m!193517))

(assert (=> d!51295 m!193457))

(assert (=> b!163328 m!193511))

(assert (=> d!51291 d!51295))

(declare-fun d!51297 () Bool)

(declare-fun lt!82515 () (_ BitVec 32))

(declare-fun lt!82514 () (_ BitVec 32))

(assert (=> d!51297 (= lt!82515 (bvmul (bvxor lt!82514 (bvlshr lt!82514 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!51297 (= lt!82514 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!51297 (and (bvsge (mask!8005 thiss!1248) #b00000000000000000000000000000000) (let ((res!77268 (let ((h!2609 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!18131 (bvmul (bvxor h!2609 (bvlshr h!2609 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!18131 (bvlshr x!18131 #b00000000000000000000000000001101)) (mask!8005 thiss!1248)))))) (and (bvslt res!77268 (bvadd (mask!8005 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!77268 #b00000000000000000000000000000000))))))

(assert (=> d!51297 (= (toIndex!0 key!828 (mask!8005 thiss!1248)) (bvand (bvxor lt!82515 (bvlshr lt!82515 #b00000000000000000000000000001101)) (mask!8005 thiss!1248)))))

(assert (=> d!51291 d!51297))

(assert (=> d!51291 d!51285))

(declare-fun b!163341 () Bool)

(declare-fun e!107159 () Bool)

(assert (=> b!163341 (= e!107159 (and (bvsge (extraKeys!3091 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3091 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!957 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun d!51299 () Bool)

(declare-fun res!77280 () Bool)

(assert (=> d!51299 (=> (not res!77280) (not e!107159))))

(assert (=> d!51299 (= res!77280 (validMask!0 (mask!8005 thiss!1248)))))

(assert (=> d!51299 (= (simpleValid!122 thiss!1248) e!107159)))

(declare-fun b!163338 () Bool)

(declare-fun res!77277 () Bool)

(assert (=> b!163338 (=> (not res!77277) (not e!107159))))

(assert (=> b!163338 (= res!77277 (and (= (size!3256 (_values!3333 thiss!1248)) (bvadd (mask!8005 thiss!1248) #b00000000000000000000000000000001)) (= (size!3255 (_keys!5160 thiss!1248)) (size!3256 (_values!3333 thiss!1248))) (bvsge (_size!957 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!957 thiss!1248) (bvadd (mask!8005 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!163340 () Bool)

(declare-fun res!77278 () Bool)

(assert (=> b!163340 (=> (not res!77278) (not e!107159))))

(declare-fun size!3261 (LongMapFixedSize!1816) (_ BitVec 32))

(assert (=> b!163340 (= res!77278 (= (size!3261 thiss!1248) (bvadd (_size!957 thiss!1248) (bvsdiv (bvadd (extraKeys!3091 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!163339 () Bool)

(declare-fun res!77279 () Bool)

(assert (=> b!163339 (=> (not res!77279) (not e!107159))))

(assert (=> b!163339 (= res!77279 (bvsge (size!3261 thiss!1248) (_size!957 thiss!1248)))))

(assert (= (and d!51299 res!77280) b!163338))

(assert (= (and b!163338 res!77277) b!163339))

(assert (= (and b!163339 res!77279) b!163340))

(assert (= (and b!163340 res!77278) b!163341))

(assert (=> d!51299 m!193457))

(declare-fun m!193519 () Bool)

(assert (=> b!163340 m!193519))

(assert (=> b!163339 m!193519))

(assert (=> d!51293 d!51299))

(declare-fun b!163350 () Bool)

(declare-fun e!107167 () Bool)

(declare-fun call!17281 () Bool)

(assert (=> b!163350 (= e!107167 call!17281)))

(declare-fun b!163351 () Bool)

(declare-fun e!107166 () Bool)

(assert (=> b!163351 (= e!107167 e!107166)))

(declare-fun lt!82522 () (_ BitVec 64))

(assert (=> b!163351 (= lt!82522 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5009 0))(
  ( (Unit!5010) )
))
(declare-fun lt!82524 () Unit!5009)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!6257 (_ BitVec 64) (_ BitVec 32)) Unit!5009)

(assert (=> b!163351 (= lt!82524 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5160 thiss!1248) lt!82522 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!6257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!163351 (arrayContainsKey!0 (_keys!5160 thiss!1248) lt!82522 #b00000000000000000000000000000000)))

(declare-fun lt!82523 () Unit!5009)

(assert (=> b!163351 (= lt!82523 lt!82524)))

(declare-fun res!77286 () Bool)

(assert (=> b!163351 (= res!77286 (= (seekEntryOrOpen!0 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000) (_keys!5160 thiss!1248) (mask!8005 thiss!1248)) (Found!409 #b00000000000000000000000000000000)))))

(assert (=> b!163351 (=> (not res!77286) (not e!107166))))

(declare-fun bm!17278 () Bool)

(assert (=> bm!17278 (= call!17281 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5160 thiss!1248) (mask!8005 thiss!1248)))))

(declare-fun b!163352 () Bool)

(assert (=> b!163352 (= e!107166 call!17281)))

(declare-fun d!51301 () Bool)

(declare-fun res!77285 () Bool)

(declare-fun e!107168 () Bool)

(assert (=> d!51301 (=> res!77285 e!107168)))

(assert (=> d!51301 (= res!77285 (bvsge #b00000000000000000000000000000000 (size!3255 (_keys!5160 thiss!1248))))))

(assert (=> d!51301 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)) e!107168)))

(declare-fun b!163353 () Bool)

(assert (=> b!163353 (= e!107168 e!107167)))

(declare-fun c!30068 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!163353 (= c!30068 (validKeyInArray!0 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51301 (not res!77285)) b!163353))

(assert (= (and b!163353 c!30068) b!163351))

(assert (= (and b!163353 (not c!30068)) b!163350))

(assert (= (and b!163351 res!77286) b!163352))

(assert (= (or b!163352 b!163350) bm!17278))

(declare-fun m!193521 () Bool)

(assert (=> b!163351 m!193521))

(declare-fun m!193523 () Bool)

(assert (=> b!163351 m!193523))

(declare-fun m!193525 () Bool)

(assert (=> b!163351 m!193525))

(assert (=> b!163351 m!193521))

(declare-fun m!193527 () Bool)

(assert (=> b!163351 m!193527))

(declare-fun m!193529 () Bool)

(assert (=> bm!17278 m!193529))

(assert (=> b!163353 m!193521))

(assert (=> b!163353 m!193521))

(declare-fun m!193531 () Bool)

(assert (=> b!163353 m!193531))

(assert (=> b!163293 d!51301))

(declare-fun b!163366 () Bool)

(declare-fun e!107177 () SeekEntryResult!409)

(assert (=> b!163366 (= e!107177 (seekKeyOrZeroReturnVacant!0 (bvadd (x!18114 lt!82501) #b00000000000000000000000000000001) (nextIndex!0 (index!3806 lt!82501) (x!18114 lt!82501) (mask!8005 thiss!1248)) (index!3806 lt!82501) key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)))))

(declare-fun d!51303 () Bool)

(declare-fun lt!82529 () SeekEntryResult!409)

(assert (=> d!51303 (and (or ((_ is Undefined!409) lt!82529) (not ((_ is Found!409) lt!82529)) (and (bvsge (index!3805 lt!82529) #b00000000000000000000000000000000) (bvslt (index!3805 lt!82529) (size!3255 (_keys!5160 thiss!1248))))) (or ((_ is Undefined!409) lt!82529) ((_ is Found!409) lt!82529) (not ((_ is MissingVacant!409) lt!82529)) (not (= (index!3807 lt!82529) (index!3806 lt!82501))) (and (bvsge (index!3807 lt!82529) #b00000000000000000000000000000000) (bvslt (index!3807 lt!82529) (size!3255 (_keys!5160 thiss!1248))))) (or ((_ is Undefined!409) lt!82529) (ite ((_ is Found!409) lt!82529) (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3805 lt!82529)) key!828) (and ((_ is MissingVacant!409) lt!82529) (= (index!3807 lt!82529) (index!3806 lt!82501)) (= (select (arr!2968 (_keys!5160 thiss!1248)) (index!3807 lt!82529)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!107175 () SeekEntryResult!409)

(assert (=> d!51303 (= lt!82529 e!107175)))

(declare-fun c!30075 () Bool)

(assert (=> d!51303 (= c!30075 (bvsge (x!18114 lt!82501) #b01111111111111111111111111111110))))

(declare-fun lt!82530 () (_ BitVec 64))

(assert (=> d!51303 (= lt!82530 (select (arr!2968 (_keys!5160 thiss!1248)) (index!3806 lt!82501)))))

(assert (=> d!51303 (validMask!0 (mask!8005 thiss!1248))))

(assert (=> d!51303 (= (seekKeyOrZeroReturnVacant!0 (x!18114 lt!82501) (index!3806 lt!82501) (index!3806 lt!82501) key!828 (_keys!5160 thiss!1248) (mask!8005 thiss!1248)) lt!82529)))

(declare-fun b!163367 () Bool)

(assert (=> b!163367 (= e!107177 (MissingVacant!409 (index!3806 lt!82501)))))

(declare-fun b!163368 () Bool)

(assert (=> b!163368 (= e!107175 Undefined!409)))

(declare-fun b!163369 () Bool)

(declare-fun c!30076 () Bool)

(assert (=> b!163369 (= c!30076 (= lt!82530 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!107176 () SeekEntryResult!409)

(assert (=> b!163369 (= e!107176 e!107177)))

(declare-fun b!163370 () Bool)

(assert (=> b!163370 (= e!107176 (Found!409 (index!3806 lt!82501)))))

(declare-fun b!163371 () Bool)

(assert (=> b!163371 (= e!107175 e!107176)))

(declare-fun c!30077 () Bool)

(assert (=> b!163371 (= c!30077 (= lt!82530 key!828))))

(assert (= (and d!51303 c!30075) b!163368))

(assert (= (and d!51303 (not c!30075)) b!163371))

(assert (= (and b!163371 c!30077) b!163370))

(assert (= (and b!163371 (not c!30077)) b!163369))

(assert (= (and b!163369 c!30076) b!163367))

(assert (= (and b!163369 (not c!30076)) b!163366))

(declare-fun m!193533 () Bool)

(assert (=> b!163366 m!193533))

(assert (=> b!163366 m!193533))

(declare-fun m!193535 () Bool)

(assert (=> b!163366 m!193535))

(declare-fun m!193537 () Bool)

(assert (=> d!51303 m!193537))

(declare-fun m!193539 () Bool)

(assert (=> d!51303 m!193539))

(assert (=> d!51303 m!193489))

(assert (=> d!51303 m!193457))

(assert (=> b!163281 d!51303))

(declare-fun b!163380 () Bool)

(declare-fun e!107182 () (_ BitVec 32))

(declare-fun call!17284 () (_ BitVec 32))

(assert (=> b!163380 (= e!107182 call!17284)))

(declare-fun b!163381 () Bool)

(assert (=> b!163381 (= e!107182 (bvadd #b00000000000000000000000000000001 call!17284))))

(declare-fun b!163382 () Bool)

(declare-fun e!107183 () (_ BitVec 32))

(assert (=> b!163382 (= e!107183 #b00000000000000000000000000000000)))

(declare-fun d!51305 () Bool)

(declare-fun lt!82533 () (_ BitVec 32))

(assert (=> d!51305 (and (bvsge lt!82533 #b00000000000000000000000000000000) (bvsle lt!82533 (bvsub (size!3255 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!51305 (= lt!82533 e!107183)))

(declare-fun c!30083 () Bool)

(assert (=> d!51305 (= c!30083 (bvsge #b00000000000000000000000000000000 (size!3255 (_keys!5160 thiss!1248))))))

(assert (=> d!51305 (and (bvsle #b00000000000000000000000000000000 (size!3255 (_keys!5160 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!3255 (_keys!5160 thiss!1248)) (size!3255 (_keys!5160 thiss!1248))))))

(assert (=> d!51305 (= (arrayCountValidKeys!0 (_keys!5160 thiss!1248) #b00000000000000000000000000000000 (size!3255 (_keys!5160 thiss!1248))) lt!82533)))

(declare-fun bm!17281 () Bool)

(assert (=> bm!17281 (= call!17284 (arrayCountValidKeys!0 (_keys!5160 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!3255 (_keys!5160 thiss!1248))))))

(declare-fun b!163383 () Bool)

(assert (=> b!163383 (= e!107183 e!107182)))

(declare-fun c!30082 () Bool)

(assert (=> b!163383 (= c!30082 (validKeyInArray!0 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51305 c!30083) b!163382))

(assert (= (and d!51305 (not c!30083)) b!163383))

(assert (= (and b!163383 c!30082) b!163381))

(assert (= (and b!163383 (not c!30082)) b!163380))

(assert (= (or b!163381 b!163380) bm!17281))

(declare-fun m!193541 () Bool)

(assert (=> bm!17281 m!193541))

(assert (=> b!163383 m!193521))

(assert (=> b!163383 m!193521))

(assert (=> b!163383 m!193531))

(assert (=> b!163292 d!51305))

(declare-fun b!163394 () Bool)

(declare-fun e!107194 () Bool)

(declare-fun call!17287 () Bool)

(assert (=> b!163394 (= e!107194 call!17287)))

(declare-fun b!163395 () Bool)

(declare-fun e!107192 () Bool)

(declare-fun e!107195 () Bool)

(assert (=> b!163395 (= e!107192 e!107195)))

(declare-fun res!77294 () Bool)

(assert (=> b!163395 (=> (not res!77294) (not e!107195))))

(declare-fun e!107193 () Bool)

(assert (=> b!163395 (= res!77294 (not e!107193))))

(declare-fun res!77295 () Bool)

(assert (=> b!163395 (=> (not res!77295) (not e!107193))))

(assert (=> b!163395 (= res!77295 (validKeyInArray!0 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!163396 () Bool)

(assert (=> b!163396 (= e!107194 call!17287)))

(declare-fun d!51307 () Bool)

(declare-fun res!77293 () Bool)

(assert (=> d!51307 (=> res!77293 e!107192)))

(assert (=> d!51307 (= res!77293 (bvsge #b00000000000000000000000000000000 (size!3255 (_keys!5160 thiss!1248))))))

(assert (=> d!51307 (= (arrayNoDuplicates!0 (_keys!5160 thiss!1248) #b00000000000000000000000000000000 Nil!1994) e!107192)))

(declare-fun b!163397 () Bool)

(declare-fun contains!1030 (List!1997 (_ BitVec 64)) Bool)

(assert (=> b!163397 (= e!107193 (contains!1030 Nil!1994 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!17284 () Bool)

(declare-fun c!30086 () Bool)

(assert (=> bm!17284 (= call!17287 (arrayNoDuplicates!0 (_keys!5160 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!30086 (Cons!1993 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000) Nil!1994) Nil!1994)))))

(declare-fun b!163398 () Bool)

(assert (=> b!163398 (= e!107195 e!107194)))

(assert (=> b!163398 (= c!30086 (validKeyInArray!0 (select (arr!2968 (_keys!5160 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (= (and d!51307 (not res!77293)) b!163395))

(assert (= (and b!163395 res!77295) b!163397))

(assert (= (and b!163395 res!77294) b!163398))

(assert (= (and b!163398 c!30086) b!163394))

(assert (= (and b!163398 (not c!30086)) b!163396))

(assert (= (or b!163394 b!163396) bm!17284))

(assert (=> b!163395 m!193521))

(assert (=> b!163395 m!193521))

(assert (=> b!163395 m!193531))

(assert (=> b!163397 m!193521))

(assert (=> b!163397 m!193521))

(declare-fun m!193543 () Bool)

(assert (=> b!163397 m!193543))

(assert (=> bm!17284 m!193521))

(declare-fun m!193545 () Bool)

(assert (=> bm!17284 m!193545))

(assert (=> b!163398 m!193521))

(assert (=> b!163398 m!193521))

(assert (=> b!163398 m!193531))

(assert (=> b!163294 d!51307))

(declare-fun b!163399 () Bool)

(declare-fun e!107196 () Bool)

(assert (=> b!163399 (= e!107196 tp_is_empty!3595)))

(declare-fun b!163400 () Bool)

(declare-fun e!107197 () Bool)

(assert (=> b!163400 (= e!107197 tp_is_empty!3595)))

(declare-fun condMapEmpty!6104 () Bool)

(declare-fun mapDefault!6104 () ValueCell!1454)

(assert (=> mapNonEmpty!6103 (= condMapEmpty!6104 (= mapRest!6103 ((as const (Array (_ BitVec 32) ValueCell!1454)) mapDefault!6104)))))

(declare-fun mapRes!6104 () Bool)

(assert (=> mapNonEmpty!6103 (= tp!13978 (and e!107197 mapRes!6104))))

(declare-fun mapIsEmpty!6104 () Bool)

(assert (=> mapIsEmpty!6104 mapRes!6104))

(declare-fun mapNonEmpty!6104 () Bool)

(declare-fun tp!13979 () Bool)

(assert (=> mapNonEmpty!6104 (= mapRes!6104 (and tp!13979 e!107196))))

(declare-fun mapRest!6104 () (Array (_ BitVec 32) ValueCell!1454))

(declare-fun mapValue!6104 () ValueCell!1454)

(declare-fun mapKey!6104 () (_ BitVec 32))

(assert (=> mapNonEmpty!6104 (= mapRest!6103 (store mapRest!6104 mapKey!6104 mapValue!6104))))

(assert (= (and mapNonEmpty!6103 condMapEmpty!6104) mapIsEmpty!6104))

(assert (= (and mapNonEmpty!6103 (not condMapEmpty!6104)) mapNonEmpty!6104))

(assert (= (and mapNonEmpty!6104 ((_ is ValueCellFull!1454) mapValue!6104)) b!163399))

(assert (= (and mapNonEmpty!6103 ((_ is ValueCellFull!1454) mapDefault!6104)) b!163400))

(declare-fun m!193547 () Bool)

(assert (=> mapNonEmpty!6104 m!193547))

(check-sat (not b!163366) (not b!163329) (not b!163353) (not d!51295) (not b!163340) (not bm!17278) (not b!163395) (not mapNonEmpty!6104) (not b!163351) b_and!10181 (not bm!17281) (not b!163339) tp_is_empty!3595 (not b!163383) (not b!163398) (not d!51299) (not d!51303) (not b_next!3793) (not b!163397) (not bm!17284))
(check-sat b_and!10181 (not b_next!3793))
