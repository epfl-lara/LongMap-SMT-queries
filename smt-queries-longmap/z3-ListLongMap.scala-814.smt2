; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19916 () Bool)

(assert start!19916)

(declare-fun b!195455 () Bool)

(declare-fun b_free!4725 () Bool)

(declare-fun b_next!4725 () Bool)

(assert (=> b!195455 (= b_free!4725 (not b_next!4725))))

(declare-fun tp!17050 () Bool)

(declare-fun b_and!11471 () Bool)

(assert (=> b!195455 (= tp!17050 b_and!11471)))

(declare-fun res!92272 () Bool)

(declare-fun e!128552 () Bool)

(assert (=> start!19916 (=> (not res!92272) (not e!128552))))

(declare-datatypes ((V!5643 0))(
  ( (V!5644 (val!2293 Int)) )
))
(declare-datatypes ((ValueCell!1905 0))(
  ( (ValueCellFull!1905 (v!4261 V!5643)) (EmptyCell!1905) )
))
(declare-datatypes ((array!8247 0))(
  ( (array!8248 (arr!3881 (Array (_ BitVec 32) (_ BitVec 64))) (size!4206 (_ BitVec 32))) )
))
(declare-datatypes ((array!8249 0))(
  ( (array!8250 (arr!3882 (Array (_ BitVec 32) ValueCell!1905)) (size!4207 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2718 0))(
  ( (LongMapFixedSize!2719 (defaultEntry!3973 Int) (mask!9246 (_ BitVec 32)) (extraKeys!3710 (_ BitVec 32)) (zeroValue!3814 V!5643) (minValue!3814 V!5643) (_size!1408 (_ BitVec 32)) (_keys!5971 array!8247) (_values!3956 array!8249) (_vacant!1408 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2718)

(declare-fun valid!1115 (LongMapFixedSize!2718) Bool)

(assert (=> start!19916 (= res!92272 (valid!1115 thiss!1248))))

(assert (=> start!19916 e!128552))

(declare-fun e!128553 () Bool)

(assert (=> start!19916 e!128553))

(assert (=> start!19916 true))

(declare-fun b!195450 () Bool)

(declare-fun res!92273 () Bool)

(assert (=> b!195450 (=> (not res!92273) (not e!128552))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!195450 (= res!92273 (not (= key!828 (bvneg key!828))))))

(declare-fun b!195451 () Bool)

(declare-datatypes ((SeekEntryResult!696 0))(
  ( (MissingZero!696 (index!4954 (_ BitVec 32))) (Found!696 (index!4955 (_ BitVec 32))) (Intermediate!696 (undefined!1508 Bool) (index!4956 (_ BitVec 32)) (x!20735 (_ BitVec 32))) (Undefined!696) (MissingVacant!696 (index!4957 (_ BitVec 32))) )
))
(declare-fun lt!97454 () SeekEntryResult!696)

(get-info :version)

(assert (=> b!195451 (= e!128552 (and (not ((_ is Undefined!696) lt!97454)) (not ((_ is MissingVacant!696) lt!97454)) (not ((_ is MissingZero!696) lt!97454)) (not ((_ is Found!696) lt!97454))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8247 (_ BitVec 32)) SeekEntryResult!696)

(assert (=> b!195451 (= lt!97454 (seekEntryOrOpen!0 key!828 (_keys!5971 thiss!1248) (mask!9246 thiss!1248)))))

(declare-fun mapIsEmpty!7783 () Bool)

(declare-fun mapRes!7783 () Bool)

(assert (=> mapIsEmpty!7783 mapRes!7783))

(declare-fun b!195452 () Bool)

(declare-fun e!128550 () Bool)

(declare-fun tp_is_empty!4497 () Bool)

(assert (=> b!195452 (= e!128550 tp_is_empty!4497)))

(declare-fun mapNonEmpty!7783 () Bool)

(declare-fun tp!17049 () Bool)

(declare-fun e!128551 () Bool)

(assert (=> mapNonEmpty!7783 (= mapRes!7783 (and tp!17049 e!128551))))

(declare-fun mapRest!7783 () (Array (_ BitVec 32) ValueCell!1905))

(declare-fun mapKey!7783 () (_ BitVec 32))

(declare-fun mapValue!7783 () ValueCell!1905)

(assert (=> mapNonEmpty!7783 (= (arr!3882 (_values!3956 thiss!1248)) (store mapRest!7783 mapKey!7783 mapValue!7783))))

(declare-fun b!195453 () Bool)

(declare-fun e!128548 () Bool)

(assert (=> b!195453 (= e!128548 (and e!128550 mapRes!7783))))

(declare-fun condMapEmpty!7783 () Bool)

(declare-fun mapDefault!7783 () ValueCell!1905)

(assert (=> b!195453 (= condMapEmpty!7783 (= (arr!3882 (_values!3956 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1905)) mapDefault!7783)))))

(declare-fun b!195454 () Bool)

(assert (=> b!195454 (= e!128551 tp_is_empty!4497)))

(declare-fun array_inv!2519 (array!8247) Bool)

(declare-fun array_inv!2520 (array!8249) Bool)

(assert (=> b!195455 (= e!128553 (and tp!17050 tp_is_empty!4497 (array_inv!2519 (_keys!5971 thiss!1248)) (array_inv!2520 (_values!3956 thiss!1248)) e!128548))))

(assert (= (and start!19916 res!92272) b!195450))

(assert (= (and b!195450 res!92273) b!195451))

(assert (= (and b!195453 condMapEmpty!7783) mapIsEmpty!7783))

(assert (= (and b!195453 (not condMapEmpty!7783)) mapNonEmpty!7783))

(assert (= (and mapNonEmpty!7783 ((_ is ValueCellFull!1905) mapValue!7783)) b!195454))

(assert (= (and b!195453 ((_ is ValueCellFull!1905) mapDefault!7783)) b!195452))

(assert (= b!195455 b!195453))

(assert (= start!19916 b!195455))

(declare-fun m!223067 () Bool)

(assert (=> start!19916 m!223067))

(declare-fun m!223069 () Bool)

(assert (=> b!195451 m!223069))

(declare-fun m!223071 () Bool)

(assert (=> mapNonEmpty!7783 m!223071))

(declare-fun m!223073 () Bool)

(assert (=> b!195455 m!223073))

(declare-fun m!223075 () Bool)

(assert (=> b!195455 m!223075))

(check-sat (not b_next!4725) (not b!195451) (not start!19916) tp_is_empty!4497 (not mapNonEmpty!7783) b_and!11471 (not b!195455))
(check-sat b_and!11471 (not b_next!4725))
(get-model)

(declare-fun d!57489 () Bool)

(declare-fun res!92286 () Bool)

(declare-fun e!128574 () Bool)

(assert (=> d!57489 (=> (not res!92286) (not e!128574))))

(declare-fun simpleValid!205 (LongMapFixedSize!2718) Bool)

(assert (=> d!57489 (= res!92286 (simpleValid!205 thiss!1248))))

(assert (=> d!57489 (= (valid!1115 thiss!1248) e!128574)))

(declare-fun b!195480 () Bool)

(declare-fun res!92287 () Bool)

(assert (=> b!195480 (=> (not res!92287) (not e!128574))))

(declare-fun arrayCountValidKeys!0 (array!8247 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!195480 (= res!92287 (= (arrayCountValidKeys!0 (_keys!5971 thiss!1248) #b00000000000000000000000000000000 (size!4206 (_keys!5971 thiss!1248))) (_size!1408 thiss!1248)))))

(declare-fun b!195481 () Bool)

(declare-fun res!92288 () Bool)

(assert (=> b!195481 (=> (not res!92288) (not e!128574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8247 (_ BitVec 32)) Bool)

(assert (=> b!195481 (= res!92288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5971 thiss!1248) (mask!9246 thiss!1248)))))

(declare-fun b!195482 () Bool)

(declare-datatypes ((List!2452 0))(
  ( (Nil!2449) (Cons!2448 (h!3090 (_ BitVec 64)) (t!7383 List!2452)) )
))
(declare-fun arrayNoDuplicates!0 (array!8247 (_ BitVec 32) List!2452) Bool)

(assert (=> b!195482 (= e!128574 (arrayNoDuplicates!0 (_keys!5971 thiss!1248) #b00000000000000000000000000000000 Nil!2449))))

(assert (= (and d!57489 res!92286) b!195480))

(assert (= (and b!195480 res!92287) b!195481))

(assert (= (and b!195481 res!92288) b!195482))

(declare-fun m!223087 () Bool)

(assert (=> d!57489 m!223087))

(declare-fun m!223089 () Bool)

(assert (=> b!195480 m!223089))

(declare-fun m!223091 () Bool)

(assert (=> b!195481 m!223091))

(declare-fun m!223093 () Bool)

(assert (=> b!195482 m!223093))

(assert (=> start!19916 d!57489))

(declare-fun b!195495 () Bool)

(declare-fun e!128581 () SeekEntryResult!696)

(declare-fun lt!97465 () SeekEntryResult!696)

(assert (=> b!195495 (= e!128581 (Found!696 (index!4956 lt!97465)))))

(declare-fun d!57491 () Bool)

(declare-fun lt!97464 () SeekEntryResult!696)

(assert (=> d!57491 (and (or ((_ is Undefined!696) lt!97464) (not ((_ is Found!696) lt!97464)) (and (bvsge (index!4955 lt!97464) #b00000000000000000000000000000000) (bvslt (index!4955 lt!97464) (size!4206 (_keys!5971 thiss!1248))))) (or ((_ is Undefined!696) lt!97464) ((_ is Found!696) lt!97464) (not ((_ is MissingZero!696) lt!97464)) (and (bvsge (index!4954 lt!97464) #b00000000000000000000000000000000) (bvslt (index!4954 lt!97464) (size!4206 (_keys!5971 thiss!1248))))) (or ((_ is Undefined!696) lt!97464) ((_ is Found!696) lt!97464) ((_ is MissingZero!696) lt!97464) (not ((_ is MissingVacant!696) lt!97464)) (and (bvsge (index!4957 lt!97464) #b00000000000000000000000000000000) (bvslt (index!4957 lt!97464) (size!4206 (_keys!5971 thiss!1248))))) (or ((_ is Undefined!696) lt!97464) (ite ((_ is Found!696) lt!97464) (= (select (arr!3881 (_keys!5971 thiss!1248)) (index!4955 lt!97464)) key!828) (ite ((_ is MissingZero!696) lt!97464) (= (select (arr!3881 (_keys!5971 thiss!1248)) (index!4954 lt!97464)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!696) lt!97464) (= (select (arr!3881 (_keys!5971 thiss!1248)) (index!4957 lt!97464)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!128583 () SeekEntryResult!696)

(assert (=> d!57491 (= lt!97464 e!128583)))

(declare-fun c!35402 () Bool)

(assert (=> d!57491 (= c!35402 (and ((_ is Intermediate!696) lt!97465) (undefined!1508 lt!97465)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8247 (_ BitVec 32)) SeekEntryResult!696)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57491 (= lt!97465 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9246 thiss!1248)) key!828 (_keys!5971 thiss!1248) (mask!9246 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!57491 (validMask!0 (mask!9246 thiss!1248))))

(assert (=> d!57491 (= (seekEntryOrOpen!0 key!828 (_keys!5971 thiss!1248) (mask!9246 thiss!1248)) lt!97464)))

(declare-fun b!195496 () Bool)

(assert (=> b!195496 (= e!128583 e!128581)))

(declare-fun lt!97466 () (_ BitVec 64))

(assert (=> b!195496 (= lt!97466 (select (arr!3881 (_keys!5971 thiss!1248)) (index!4956 lt!97465)))))

(declare-fun c!35400 () Bool)

(assert (=> b!195496 (= c!35400 (= lt!97466 key!828))))

(declare-fun b!195497 () Bool)

(declare-fun c!35401 () Bool)

(assert (=> b!195497 (= c!35401 (= lt!97466 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128582 () SeekEntryResult!696)

(assert (=> b!195497 (= e!128581 e!128582)))

(declare-fun b!195498 () Bool)

(assert (=> b!195498 (= e!128583 Undefined!696)))

(declare-fun b!195499 () Bool)

(assert (=> b!195499 (= e!128582 (MissingZero!696 (index!4956 lt!97465)))))

(declare-fun b!195500 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8247 (_ BitVec 32)) SeekEntryResult!696)

(assert (=> b!195500 (= e!128582 (seekKeyOrZeroReturnVacant!0 (x!20735 lt!97465) (index!4956 lt!97465) (index!4956 lt!97465) key!828 (_keys!5971 thiss!1248) (mask!9246 thiss!1248)))))

(assert (= (and d!57491 c!35402) b!195498))

(assert (= (and d!57491 (not c!35402)) b!195496))

(assert (= (and b!195496 c!35400) b!195495))

(assert (= (and b!195496 (not c!35400)) b!195497))

(assert (= (and b!195497 c!35401) b!195499))

(assert (= (and b!195497 (not c!35401)) b!195500))

(declare-fun m!223095 () Bool)

(assert (=> d!57491 m!223095))

(declare-fun m!223097 () Bool)

(assert (=> d!57491 m!223097))

(assert (=> d!57491 m!223097))

(declare-fun m!223099 () Bool)

(assert (=> d!57491 m!223099))

(declare-fun m!223101 () Bool)

(assert (=> d!57491 m!223101))

(declare-fun m!223103 () Bool)

(assert (=> d!57491 m!223103))

(declare-fun m!223105 () Bool)

(assert (=> d!57491 m!223105))

(declare-fun m!223107 () Bool)

(assert (=> b!195496 m!223107))

(declare-fun m!223109 () Bool)

(assert (=> b!195500 m!223109))

(assert (=> b!195451 d!57491))

(declare-fun d!57493 () Bool)

(assert (=> d!57493 (= (array_inv!2519 (_keys!5971 thiss!1248)) (bvsge (size!4206 (_keys!5971 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195455 d!57493))

(declare-fun d!57495 () Bool)

(assert (=> d!57495 (= (array_inv!2520 (_values!3956 thiss!1248)) (bvsge (size!4207 (_values!3956 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195455 d!57495))

(declare-fun condMapEmpty!7789 () Bool)

(declare-fun mapDefault!7789 () ValueCell!1905)

(assert (=> mapNonEmpty!7783 (= condMapEmpty!7789 (= mapRest!7783 ((as const (Array (_ BitVec 32) ValueCell!1905)) mapDefault!7789)))))

(declare-fun e!128588 () Bool)

(declare-fun mapRes!7789 () Bool)

(assert (=> mapNonEmpty!7783 (= tp!17049 (and e!128588 mapRes!7789))))

(declare-fun b!195508 () Bool)

(assert (=> b!195508 (= e!128588 tp_is_empty!4497)))

(declare-fun mapIsEmpty!7789 () Bool)

(assert (=> mapIsEmpty!7789 mapRes!7789))

(declare-fun mapNonEmpty!7789 () Bool)

(declare-fun tp!17059 () Bool)

(declare-fun e!128589 () Bool)

(assert (=> mapNonEmpty!7789 (= mapRes!7789 (and tp!17059 e!128589))))

(declare-fun mapValue!7789 () ValueCell!1905)

(declare-fun mapRest!7789 () (Array (_ BitVec 32) ValueCell!1905))

(declare-fun mapKey!7789 () (_ BitVec 32))

(assert (=> mapNonEmpty!7789 (= mapRest!7783 (store mapRest!7789 mapKey!7789 mapValue!7789))))

(declare-fun b!195507 () Bool)

(assert (=> b!195507 (= e!128589 tp_is_empty!4497)))

(assert (= (and mapNonEmpty!7783 condMapEmpty!7789) mapIsEmpty!7789))

(assert (= (and mapNonEmpty!7783 (not condMapEmpty!7789)) mapNonEmpty!7789))

(assert (= (and mapNonEmpty!7789 ((_ is ValueCellFull!1905) mapValue!7789)) b!195507))

(assert (= (and mapNonEmpty!7783 ((_ is ValueCellFull!1905) mapDefault!7789)) b!195508))

(declare-fun m!223111 () Bool)

(assert (=> mapNonEmpty!7789 m!223111))

(check-sat (not b!195481) (not d!57491) (not mapNonEmpty!7789) (not b_next!4725) (not d!57489) b_and!11471 (not b!195480) (not b!195500) tp_is_empty!4497 (not b!195482))
(check-sat b_and!11471 (not b_next!4725))
