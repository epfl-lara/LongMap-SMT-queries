; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19918 () Bool)

(assert start!19918)

(declare-fun b!195287 () Bool)

(declare-fun b_free!4723 () Bool)

(declare-fun b_next!4723 () Bool)

(assert (=> b!195287 (= b_free!4723 (not b_next!4723))))

(declare-fun tp!17043 () Bool)

(declare-fun b_and!11443 () Bool)

(assert (=> b!195287 (= tp!17043 b_and!11443)))

(declare-fun b!195285 () Bool)

(declare-fun e!128429 () Bool)

(declare-datatypes ((SeekEntryResult!698 0))(
  ( (MissingZero!698 (index!4962 (_ BitVec 32))) (Found!698 (index!4963 (_ BitVec 32))) (Intermediate!698 (undefined!1510 Bool) (index!4964 (_ BitVec 32)) (x!20736 (_ BitVec 32))) (Undefined!698) (MissingVacant!698 (index!4965 (_ BitVec 32))) )
))
(declare-fun lt!97270 () SeekEntryResult!698)

(get-info :version)

(assert (=> b!195285 (= e!128429 (and (not ((_ is Undefined!698) lt!97270)) (not ((_ is MissingVacant!698) lt!97270)) (not ((_ is MissingZero!698) lt!97270)) (not ((_ is Found!698) lt!97270))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!5641 0))(
  ( (V!5642 (val!2292 Int)) )
))
(declare-datatypes ((ValueCell!1904 0))(
  ( (ValueCellFull!1904 (v!4254 V!5641)) (EmptyCell!1904) )
))
(declare-datatypes ((array!8223 0))(
  ( (array!8224 (arr!3868 (Array (_ BitVec 32) (_ BitVec 64))) (size!4194 (_ BitVec 32))) )
))
(declare-datatypes ((array!8225 0))(
  ( (array!8226 (arr!3869 (Array (_ BitVec 32) ValueCell!1904)) (size!4195 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2716 0))(
  ( (LongMapFixedSize!2717 (defaultEntry!3972 Int) (mask!9244 (_ BitVec 32)) (extraKeys!3709 (_ BitVec 32)) (zeroValue!3813 V!5641) (minValue!3813 V!5641) (_size!1407 (_ BitVec 32)) (_keys!5969 array!8223) (_values!3955 array!8225) (_vacant!1407 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2716)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8223 (_ BitVec 32)) SeekEntryResult!698)

(assert (=> b!195285 (= lt!97270 (seekEntryOrOpen!0 key!828 (_keys!5969 thiss!1248) (mask!9244 thiss!1248)))))

(declare-fun b!195286 () Bool)

(declare-fun e!128433 () Bool)

(declare-fun e!128431 () Bool)

(declare-fun mapRes!7780 () Bool)

(assert (=> b!195286 (= e!128433 (and e!128431 mapRes!7780))))

(declare-fun condMapEmpty!7780 () Bool)

(declare-fun mapDefault!7780 () ValueCell!1904)

(assert (=> b!195286 (= condMapEmpty!7780 (= (arr!3869 (_values!3955 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1904)) mapDefault!7780)))))

(declare-fun e!128434 () Bool)

(declare-fun tp_is_empty!4495 () Bool)

(declare-fun array_inv!2509 (array!8223) Bool)

(declare-fun array_inv!2510 (array!8225) Bool)

(assert (=> b!195287 (= e!128434 (and tp!17043 tp_is_empty!4495 (array_inv!2509 (_keys!5969 thiss!1248)) (array_inv!2510 (_values!3955 thiss!1248)) e!128433))))

(declare-fun b!195288 () Bool)

(assert (=> b!195288 (= e!128431 tp_is_empty!4495)))

(declare-fun res!92171 () Bool)

(assert (=> start!19918 (=> (not res!92171) (not e!128429))))

(declare-fun valid!1131 (LongMapFixedSize!2716) Bool)

(assert (=> start!19918 (= res!92171 (valid!1131 thiss!1248))))

(assert (=> start!19918 e!128429))

(assert (=> start!19918 e!128434))

(assert (=> start!19918 true))

(declare-fun b!195289 () Bool)

(declare-fun res!92172 () Bool)

(assert (=> b!195289 (=> (not res!92172) (not e!128429))))

(assert (=> b!195289 (= res!92172 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!7780 () Bool)

(declare-fun tp!17044 () Bool)

(declare-fun e!128430 () Bool)

(assert (=> mapNonEmpty!7780 (= mapRes!7780 (and tp!17044 e!128430))))

(declare-fun mapValue!7780 () ValueCell!1904)

(declare-fun mapKey!7780 () (_ BitVec 32))

(declare-fun mapRest!7780 () (Array (_ BitVec 32) ValueCell!1904))

(assert (=> mapNonEmpty!7780 (= (arr!3869 (_values!3955 thiss!1248)) (store mapRest!7780 mapKey!7780 mapValue!7780))))

(declare-fun b!195290 () Bool)

(assert (=> b!195290 (= e!128430 tp_is_empty!4495)))

(declare-fun mapIsEmpty!7780 () Bool)

(assert (=> mapIsEmpty!7780 mapRes!7780))

(assert (= (and start!19918 res!92171) b!195289))

(assert (= (and b!195289 res!92172) b!195285))

(assert (= (and b!195286 condMapEmpty!7780) mapIsEmpty!7780))

(assert (= (and b!195286 (not condMapEmpty!7780)) mapNonEmpty!7780))

(assert (= (and mapNonEmpty!7780 ((_ is ValueCellFull!1904) mapValue!7780)) b!195290))

(assert (= (and b!195286 ((_ is ValueCellFull!1904) mapDefault!7780)) b!195288))

(assert (= b!195287 b!195286))

(assert (= start!19918 b!195287))

(declare-fun m!222441 () Bool)

(assert (=> b!195285 m!222441))

(declare-fun m!222443 () Bool)

(assert (=> b!195287 m!222443))

(declare-fun m!222445 () Bool)

(assert (=> b!195287 m!222445))

(declare-fun m!222447 () Bool)

(assert (=> start!19918 m!222447))

(declare-fun m!222449 () Bool)

(assert (=> mapNonEmpty!7780 m!222449))

(check-sat (not b_next!4723) (not b!195285) (not mapNonEmpty!7780) b_and!11443 (not start!19918) tp_is_empty!4495 (not b!195287))
(check-sat b_and!11443 (not b_next!4723))
(get-model)

(declare-fun d!57341 () Bool)

(assert (=> d!57341 (= (array_inv!2509 (_keys!5969 thiss!1248)) (bvsge (size!4194 (_keys!5969 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195287 d!57341))

(declare-fun d!57343 () Bool)

(assert (=> d!57343 (= (array_inv!2510 (_values!3955 thiss!1248)) (bvsge (size!4195 (_values!3955 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195287 d!57343))

(declare-fun b!195339 () Bool)

(declare-fun e!128479 () SeekEntryResult!698)

(declare-fun lt!97285 () SeekEntryResult!698)

(assert (=> b!195339 (= e!128479 (MissingZero!698 (index!4964 lt!97285)))))

(declare-fun b!195340 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8223 (_ BitVec 32)) SeekEntryResult!698)

(assert (=> b!195340 (= e!128479 (seekKeyOrZeroReturnVacant!0 (x!20736 lt!97285) (index!4964 lt!97285) (index!4964 lt!97285) key!828 (_keys!5969 thiss!1248) (mask!9244 thiss!1248)))))

(declare-fun d!57345 () Bool)

(declare-fun lt!97284 () SeekEntryResult!698)

(assert (=> d!57345 (and (or ((_ is Undefined!698) lt!97284) (not ((_ is Found!698) lt!97284)) (and (bvsge (index!4963 lt!97284) #b00000000000000000000000000000000) (bvslt (index!4963 lt!97284) (size!4194 (_keys!5969 thiss!1248))))) (or ((_ is Undefined!698) lt!97284) ((_ is Found!698) lt!97284) (not ((_ is MissingZero!698) lt!97284)) (and (bvsge (index!4962 lt!97284) #b00000000000000000000000000000000) (bvslt (index!4962 lt!97284) (size!4194 (_keys!5969 thiss!1248))))) (or ((_ is Undefined!698) lt!97284) ((_ is Found!698) lt!97284) ((_ is MissingZero!698) lt!97284) (not ((_ is MissingVacant!698) lt!97284)) (and (bvsge (index!4965 lt!97284) #b00000000000000000000000000000000) (bvslt (index!4965 lt!97284) (size!4194 (_keys!5969 thiss!1248))))) (or ((_ is Undefined!698) lt!97284) (ite ((_ is Found!698) lt!97284) (= (select (arr!3868 (_keys!5969 thiss!1248)) (index!4963 lt!97284)) key!828) (ite ((_ is MissingZero!698) lt!97284) (= (select (arr!3868 (_keys!5969 thiss!1248)) (index!4962 lt!97284)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!698) lt!97284) (= (select (arr!3868 (_keys!5969 thiss!1248)) (index!4965 lt!97284)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!128477 () SeekEntryResult!698)

(assert (=> d!57345 (= lt!97284 e!128477)))

(declare-fun c!35375 () Bool)

(assert (=> d!57345 (= c!35375 (and ((_ is Intermediate!698) lt!97285) (undefined!1510 lt!97285)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8223 (_ BitVec 32)) SeekEntryResult!698)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57345 (= lt!97285 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9244 thiss!1248)) key!828 (_keys!5969 thiss!1248) (mask!9244 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!57345 (validMask!0 (mask!9244 thiss!1248))))

(assert (=> d!57345 (= (seekEntryOrOpen!0 key!828 (_keys!5969 thiss!1248) (mask!9244 thiss!1248)) lt!97284)))

(declare-fun b!195341 () Bool)

(declare-fun e!128478 () SeekEntryResult!698)

(assert (=> b!195341 (= e!128478 (Found!698 (index!4964 lt!97285)))))

(declare-fun b!195342 () Bool)

(declare-fun c!35374 () Bool)

(declare-fun lt!97283 () (_ BitVec 64))

(assert (=> b!195342 (= c!35374 (= lt!97283 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!195342 (= e!128478 e!128479)))

(declare-fun b!195343 () Bool)

(assert (=> b!195343 (= e!128477 e!128478)))

(assert (=> b!195343 (= lt!97283 (select (arr!3868 (_keys!5969 thiss!1248)) (index!4964 lt!97285)))))

(declare-fun c!35376 () Bool)

(assert (=> b!195343 (= c!35376 (= lt!97283 key!828))))

(declare-fun b!195344 () Bool)

(assert (=> b!195344 (= e!128477 Undefined!698)))

(assert (= (and d!57345 c!35375) b!195344))

(assert (= (and d!57345 (not c!35375)) b!195343))

(assert (= (and b!195343 c!35376) b!195341))

(assert (= (and b!195343 (not c!35376)) b!195342))

(assert (= (and b!195342 c!35374) b!195339))

(assert (= (and b!195342 (not c!35374)) b!195340))

(declare-fun m!222471 () Bool)

(assert (=> b!195340 m!222471))

(declare-fun m!222473 () Bool)

(assert (=> d!57345 m!222473))

(declare-fun m!222475 () Bool)

(assert (=> d!57345 m!222475))

(declare-fun m!222477 () Bool)

(assert (=> d!57345 m!222477))

(declare-fun m!222479 () Bool)

(assert (=> d!57345 m!222479))

(declare-fun m!222481 () Bool)

(assert (=> d!57345 m!222481))

(assert (=> d!57345 m!222475))

(declare-fun m!222483 () Bool)

(assert (=> d!57345 m!222483))

(declare-fun m!222485 () Bool)

(assert (=> b!195343 m!222485))

(assert (=> b!195285 d!57345))

(declare-fun d!57347 () Bool)

(declare-fun res!92191 () Bool)

(declare-fun e!128482 () Bool)

(assert (=> d!57347 (=> (not res!92191) (not e!128482))))

(declare-fun simpleValid!205 (LongMapFixedSize!2716) Bool)

(assert (=> d!57347 (= res!92191 (simpleValid!205 thiss!1248))))

(assert (=> d!57347 (= (valid!1131 thiss!1248) e!128482)))

(declare-fun b!195351 () Bool)

(declare-fun res!92192 () Bool)

(assert (=> b!195351 (=> (not res!92192) (not e!128482))))

(declare-fun arrayCountValidKeys!0 (array!8223 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!195351 (= res!92192 (= (arrayCountValidKeys!0 (_keys!5969 thiss!1248) #b00000000000000000000000000000000 (size!4194 (_keys!5969 thiss!1248))) (_size!1407 thiss!1248)))))

(declare-fun b!195352 () Bool)

(declare-fun res!92193 () Bool)

(assert (=> b!195352 (=> (not res!92193) (not e!128482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8223 (_ BitVec 32)) Bool)

(assert (=> b!195352 (= res!92193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5969 thiss!1248) (mask!9244 thiss!1248)))))

(declare-fun b!195353 () Bool)

(declare-datatypes ((List!2430 0))(
  ( (Nil!2427) (Cons!2426 (h!3068 (_ BitVec 64)) (t!7352 List!2430)) )
))
(declare-fun arrayNoDuplicates!0 (array!8223 (_ BitVec 32) List!2430) Bool)

(assert (=> b!195353 (= e!128482 (arrayNoDuplicates!0 (_keys!5969 thiss!1248) #b00000000000000000000000000000000 Nil!2427))))

(assert (= (and d!57347 res!92191) b!195351))

(assert (= (and b!195351 res!92192) b!195352))

(assert (= (and b!195352 res!92193) b!195353))

(declare-fun m!222487 () Bool)

(assert (=> d!57347 m!222487))

(declare-fun m!222489 () Bool)

(assert (=> b!195351 m!222489))

(declare-fun m!222491 () Bool)

(assert (=> b!195352 m!222491))

(declare-fun m!222493 () Bool)

(assert (=> b!195353 m!222493))

(assert (=> start!19918 d!57347))

(declare-fun b!195361 () Bool)

(declare-fun e!128488 () Bool)

(assert (=> b!195361 (= e!128488 tp_is_empty!4495)))

(declare-fun mapIsEmpty!7789 () Bool)

(declare-fun mapRes!7789 () Bool)

(assert (=> mapIsEmpty!7789 mapRes!7789))

(declare-fun mapNonEmpty!7789 () Bool)

(declare-fun tp!17059 () Bool)

(declare-fun e!128487 () Bool)

(assert (=> mapNonEmpty!7789 (= mapRes!7789 (and tp!17059 e!128487))))

(declare-fun mapRest!7789 () (Array (_ BitVec 32) ValueCell!1904))

(declare-fun mapKey!7789 () (_ BitVec 32))

(declare-fun mapValue!7789 () ValueCell!1904)

(assert (=> mapNonEmpty!7789 (= mapRest!7780 (store mapRest!7789 mapKey!7789 mapValue!7789))))

(declare-fun condMapEmpty!7789 () Bool)

(declare-fun mapDefault!7789 () ValueCell!1904)

(assert (=> mapNonEmpty!7780 (= condMapEmpty!7789 (= mapRest!7780 ((as const (Array (_ BitVec 32) ValueCell!1904)) mapDefault!7789)))))

(assert (=> mapNonEmpty!7780 (= tp!17044 (and e!128488 mapRes!7789))))

(declare-fun b!195360 () Bool)

(assert (=> b!195360 (= e!128487 tp_is_empty!4495)))

(assert (= (and mapNonEmpty!7780 condMapEmpty!7789) mapIsEmpty!7789))

(assert (= (and mapNonEmpty!7780 (not condMapEmpty!7789)) mapNonEmpty!7789))

(assert (= (and mapNonEmpty!7789 ((_ is ValueCellFull!1904) mapValue!7789)) b!195360))

(assert (= (and mapNonEmpty!7780 ((_ is ValueCellFull!1904) mapDefault!7789)) b!195361))

(declare-fun m!222495 () Bool)

(assert (=> mapNonEmpty!7789 m!222495))

(check-sat (not b!195340) (not b_next!4723) (not b!195353) b_and!11443 (not b!195351) (not d!57347) (not d!57345) (not mapNonEmpty!7789) (not b!195352) tp_is_empty!4495)
(check-sat b_and!11443 (not b_next!4723))
