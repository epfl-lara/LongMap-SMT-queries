; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19918 () Bool)

(assert start!19918)

(declare-fun b!195480 () Bool)

(declare-fun b_free!4723 () Bool)

(declare-fun b_next!4723 () Bool)

(assert (=> b!195480 (= b_free!4723 (not b_next!4723))))

(declare-fun tp!17044 () Bool)

(declare-fun b_and!11483 () Bool)

(assert (=> b!195480 (= tp!17044 b_and!11483)))

(declare-fun mapNonEmpty!7780 () Bool)

(declare-fun mapRes!7780 () Bool)

(declare-fun tp!17043 () Bool)

(declare-fun e!128554 () Bool)

(assert (=> mapNonEmpty!7780 (= mapRes!7780 (and tp!17043 e!128554))))

(declare-datatypes ((V!5641 0))(
  ( (V!5642 (val!2292 Int)) )
))
(declare-datatypes ((ValueCell!1904 0))(
  ( (ValueCellFull!1904 (v!4261 V!5641)) (EmptyCell!1904) )
))
(declare-fun mapValue!7780 () ValueCell!1904)

(declare-datatypes ((array!8229 0))(
  ( (array!8230 (arr!3872 (Array (_ BitVec 32) (_ BitVec 64))) (size!4197 (_ BitVec 32))) )
))
(declare-datatypes ((array!8231 0))(
  ( (array!8232 (arr!3873 (Array (_ BitVec 32) ValueCell!1904)) (size!4198 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2716 0))(
  ( (LongMapFixedSize!2717 (defaultEntry!3972 Int) (mask!9245 (_ BitVec 32)) (extraKeys!3709 (_ BitVec 32)) (zeroValue!3813 V!5641) (minValue!3813 V!5641) (_size!1407 (_ BitVec 32)) (_keys!5970 array!8229) (_values!3955 array!8231) (_vacant!1407 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2716)

(declare-fun mapRest!7780 () (Array (_ BitVec 32) ValueCell!1904))

(declare-fun mapKey!7780 () (_ BitVec 32))

(assert (=> mapNonEmpty!7780 (= (arr!3873 (_values!3955 thiss!1248)) (store mapRest!7780 mapKey!7780 mapValue!7780))))

(declare-fun b!195479 () Bool)

(declare-fun e!128556 () Bool)

(declare-fun e!128559 () Bool)

(assert (=> b!195479 (= e!128556 (and e!128559 mapRes!7780))))

(declare-fun condMapEmpty!7780 () Bool)

(declare-fun mapDefault!7780 () ValueCell!1904)

(assert (=> b!195479 (= condMapEmpty!7780 (= (arr!3873 (_values!3955 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1904)) mapDefault!7780)))))

(declare-fun tp_is_empty!4495 () Bool)

(declare-fun e!128557 () Bool)

(declare-fun array_inv!2503 (array!8229) Bool)

(declare-fun array_inv!2504 (array!8231) Bool)

(assert (=> b!195480 (= e!128557 (and tp!17044 tp_is_empty!4495 (array_inv!2503 (_keys!5970 thiss!1248)) (array_inv!2504 (_values!3955 thiss!1248)) e!128556))))

(declare-fun mapIsEmpty!7780 () Bool)

(assert (=> mapIsEmpty!7780 mapRes!7780))

(declare-fun res!92288 () Bool)

(declare-fun e!128555 () Bool)

(assert (=> start!19918 (=> (not res!92288) (not e!128555))))

(declare-fun valid!1134 (LongMapFixedSize!2716) Bool)

(assert (=> start!19918 (= res!92288 (valid!1134 thiss!1248))))

(assert (=> start!19918 e!128555))

(assert (=> start!19918 e!128557))

(assert (=> start!19918 true))

(declare-fun b!195481 () Bool)

(declare-fun res!92287 () Bool)

(assert (=> b!195481 (=> (not res!92287) (not e!128555))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!195481 (= res!92287 (not (= key!828 (bvneg key!828))))))

(declare-fun b!195482 () Bool)

(assert (=> b!195482 (= e!128559 tp_is_empty!4495)))

(declare-fun b!195483 () Bool)

(declare-datatypes ((SeekEntryResult!685 0))(
  ( (MissingZero!685 (index!4910 (_ BitVec 32))) (Found!685 (index!4911 (_ BitVec 32))) (Intermediate!685 (undefined!1497 Bool) (index!4912 (_ BitVec 32)) (x!20724 (_ BitVec 32))) (Undefined!685) (MissingVacant!685 (index!4913 (_ BitVec 32))) )
))
(declare-fun lt!97510 () SeekEntryResult!685)

(get-info :version)

(assert (=> b!195483 (= e!128555 (and (not ((_ is Undefined!685) lt!97510)) (not ((_ is MissingVacant!685) lt!97510)) (not ((_ is MissingZero!685) lt!97510)) (not ((_ is Found!685) lt!97510))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8229 (_ BitVec 32)) SeekEntryResult!685)

(assert (=> b!195483 (= lt!97510 (seekEntryOrOpen!0 key!828 (_keys!5970 thiss!1248) (mask!9245 thiss!1248)))))

(declare-fun b!195484 () Bool)

(assert (=> b!195484 (= e!128554 tp_is_empty!4495)))

(assert (= (and start!19918 res!92288) b!195481))

(assert (= (and b!195481 res!92287) b!195483))

(assert (= (and b!195479 condMapEmpty!7780) mapIsEmpty!7780))

(assert (= (and b!195479 (not condMapEmpty!7780)) mapNonEmpty!7780))

(assert (= (and mapNonEmpty!7780 ((_ is ValueCellFull!1904) mapValue!7780)) b!195484))

(assert (= (and b!195479 ((_ is ValueCellFull!1904) mapDefault!7780)) b!195482))

(assert (= b!195480 b!195479))

(assert (= start!19918 b!195480))

(declare-fun m!223239 () Bool)

(assert (=> mapNonEmpty!7780 m!223239))

(declare-fun m!223241 () Bool)

(assert (=> b!195480 m!223241))

(declare-fun m!223243 () Bool)

(assert (=> b!195480 m!223243))

(declare-fun m!223245 () Bool)

(assert (=> start!19918 m!223245))

(declare-fun m!223247 () Bool)

(assert (=> b!195483 m!223247))

(check-sat (not b!195483) tp_is_empty!4495 b_and!11483 (not b!195480) (not mapNonEmpty!7780) (not b_next!4723) (not start!19918))
(check-sat b_and!11483 (not b_next!4723))
(get-model)

(declare-fun b!195533 () Bool)

(declare-fun e!128602 () SeekEntryResult!685)

(declare-fun lt!97525 () SeekEntryResult!685)

(assert (=> b!195533 (= e!128602 (Found!685 (index!4912 lt!97525)))))

(declare-fun d!57563 () Bool)

(declare-fun lt!97524 () SeekEntryResult!685)

(assert (=> d!57563 (and (or ((_ is Undefined!685) lt!97524) (not ((_ is Found!685) lt!97524)) (and (bvsge (index!4911 lt!97524) #b00000000000000000000000000000000) (bvslt (index!4911 lt!97524) (size!4197 (_keys!5970 thiss!1248))))) (or ((_ is Undefined!685) lt!97524) ((_ is Found!685) lt!97524) (not ((_ is MissingZero!685) lt!97524)) (and (bvsge (index!4910 lt!97524) #b00000000000000000000000000000000) (bvslt (index!4910 lt!97524) (size!4197 (_keys!5970 thiss!1248))))) (or ((_ is Undefined!685) lt!97524) ((_ is Found!685) lt!97524) ((_ is MissingZero!685) lt!97524) (not ((_ is MissingVacant!685) lt!97524)) (and (bvsge (index!4913 lt!97524) #b00000000000000000000000000000000) (bvslt (index!4913 lt!97524) (size!4197 (_keys!5970 thiss!1248))))) (or ((_ is Undefined!685) lt!97524) (ite ((_ is Found!685) lt!97524) (= (select (arr!3872 (_keys!5970 thiss!1248)) (index!4911 lt!97524)) key!828) (ite ((_ is MissingZero!685) lt!97524) (= (select (arr!3872 (_keys!5970 thiss!1248)) (index!4910 lt!97524)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!685) lt!97524) (= (select (arr!3872 (_keys!5970 thiss!1248)) (index!4913 lt!97524)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!128604 () SeekEntryResult!685)

(assert (=> d!57563 (= lt!97524 e!128604)))

(declare-fun c!35414 () Bool)

(assert (=> d!57563 (= c!35414 (and ((_ is Intermediate!685) lt!97525) (undefined!1497 lt!97525)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8229 (_ BitVec 32)) SeekEntryResult!685)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!57563 (= lt!97525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!9245 thiss!1248)) key!828 (_keys!5970 thiss!1248) (mask!9245 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!57563 (validMask!0 (mask!9245 thiss!1248))))

(assert (=> d!57563 (= (seekEntryOrOpen!0 key!828 (_keys!5970 thiss!1248) (mask!9245 thiss!1248)) lt!97524)))

(declare-fun b!195534 () Bool)

(declare-fun c!35415 () Bool)

(declare-fun lt!97523 () (_ BitVec 64))

(assert (=> b!195534 (= c!35415 (= lt!97523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!128603 () SeekEntryResult!685)

(assert (=> b!195534 (= e!128602 e!128603)))

(declare-fun b!195535 () Bool)

(assert (=> b!195535 (= e!128603 (MissingZero!685 (index!4912 lt!97525)))))

(declare-fun b!195536 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!8229 (_ BitVec 32)) SeekEntryResult!685)

(assert (=> b!195536 (= e!128603 (seekKeyOrZeroReturnVacant!0 (x!20724 lt!97525) (index!4912 lt!97525) (index!4912 lt!97525) key!828 (_keys!5970 thiss!1248) (mask!9245 thiss!1248)))))

(declare-fun b!195537 () Bool)

(assert (=> b!195537 (= e!128604 Undefined!685)))

(declare-fun b!195538 () Bool)

(assert (=> b!195538 (= e!128604 e!128602)))

(assert (=> b!195538 (= lt!97523 (select (arr!3872 (_keys!5970 thiss!1248)) (index!4912 lt!97525)))))

(declare-fun c!35413 () Bool)

(assert (=> b!195538 (= c!35413 (= lt!97523 key!828))))

(assert (= (and d!57563 c!35414) b!195537))

(assert (= (and d!57563 (not c!35414)) b!195538))

(assert (= (and b!195538 c!35413) b!195533))

(assert (= (and b!195538 (not c!35413)) b!195534))

(assert (= (and b!195534 c!35415) b!195535))

(assert (= (and b!195534 (not c!35415)) b!195536))

(declare-fun m!223269 () Bool)

(assert (=> d!57563 m!223269))

(declare-fun m!223271 () Bool)

(assert (=> d!57563 m!223271))

(declare-fun m!223273 () Bool)

(assert (=> d!57563 m!223273))

(declare-fun m!223275 () Bool)

(assert (=> d!57563 m!223275))

(declare-fun m!223277 () Bool)

(assert (=> d!57563 m!223277))

(assert (=> d!57563 m!223275))

(declare-fun m!223279 () Bool)

(assert (=> d!57563 m!223279))

(declare-fun m!223281 () Bool)

(assert (=> b!195536 m!223281))

(declare-fun m!223283 () Bool)

(assert (=> b!195538 m!223283))

(assert (=> b!195483 d!57563))

(declare-fun d!57565 () Bool)

(declare-fun res!92307 () Bool)

(declare-fun e!128607 () Bool)

(assert (=> d!57565 (=> (not res!92307) (not e!128607))))

(declare-fun simpleValid!205 (LongMapFixedSize!2716) Bool)

(assert (=> d!57565 (= res!92307 (simpleValid!205 thiss!1248))))

(assert (=> d!57565 (= (valid!1134 thiss!1248) e!128607)))

(declare-fun b!195545 () Bool)

(declare-fun res!92308 () Bool)

(assert (=> b!195545 (=> (not res!92308) (not e!128607))))

(declare-fun arrayCountValidKeys!0 (array!8229 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!195545 (= res!92308 (= (arrayCountValidKeys!0 (_keys!5970 thiss!1248) #b00000000000000000000000000000000 (size!4197 (_keys!5970 thiss!1248))) (_size!1407 thiss!1248)))))

(declare-fun b!195546 () Bool)

(declare-fun res!92309 () Bool)

(assert (=> b!195546 (=> (not res!92309) (not e!128607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8229 (_ BitVec 32)) Bool)

(assert (=> b!195546 (= res!92309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5970 thiss!1248) (mask!9245 thiss!1248)))))

(declare-fun b!195547 () Bool)

(declare-datatypes ((List!2411 0))(
  ( (Nil!2408) (Cons!2407 (h!3049 (_ BitVec 64)) (t!7334 List!2411)) )
))
(declare-fun arrayNoDuplicates!0 (array!8229 (_ BitVec 32) List!2411) Bool)

(assert (=> b!195547 (= e!128607 (arrayNoDuplicates!0 (_keys!5970 thiss!1248) #b00000000000000000000000000000000 Nil!2408))))

(assert (= (and d!57565 res!92307) b!195545))

(assert (= (and b!195545 res!92308) b!195546))

(assert (= (and b!195546 res!92309) b!195547))

(declare-fun m!223285 () Bool)

(assert (=> d!57565 m!223285))

(declare-fun m!223287 () Bool)

(assert (=> b!195545 m!223287))

(declare-fun m!223289 () Bool)

(assert (=> b!195546 m!223289))

(declare-fun m!223291 () Bool)

(assert (=> b!195547 m!223291))

(assert (=> start!19918 d!57565))

(declare-fun d!57567 () Bool)

(assert (=> d!57567 (= (array_inv!2503 (_keys!5970 thiss!1248)) (bvsge (size!4197 (_keys!5970 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195480 d!57567))

(declare-fun d!57569 () Bool)

(assert (=> d!57569 (= (array_inv!2504 (_values!3955 thiss!1248)) (bvsge (size!4198 (_values!3955 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!195480 d!57569))

(declare-fun mapIsEmpty!7789 () Bool)

(declare-fun mapRes!7789 () Bool)

(assert (=> mapIsEmpty!7789 mapRes!7789))

(declare-fun b!195555 () Bool)

(declare-fun e!128613 () Bool)

(assert (=> b!195555 (= e!128613 tp_is_empty!4495)))

(declare-fun condMapEmpty!7789 () Bool)

(declare-fun mapDefault!7789 () ValueCell!1904)

(assert (=> mapNonEmpty!7780 (= condMapEmpty!7789 (= mapRest!7780 ((as const (Array (_ BitVec 32) ValueCell!1904)) mapDefault!7789)))))

(assert (=> mapNonEmpty!7780 (= tp!17043 (and e!128613 mapRes!7789))))

(declare-fun mapNonEmpty!7789 () Bool)

(declare-fun tp!17059 () Bool)

(declare-fun e!128612 () Bool)

(assert (=> mapNonEmpty!7789 (= mapRes!7789 (and tp!17059 e!128612))))

(declare-fun mapValue!7789 () ValueCell!1904)

(declare-fun mapKey!7789 () (_ BitVec 32))

(declare-fun mapRest!7789 () (Array (_ BitVec 32) ValueCell!1904))

(assert (=> mapNonEmpty!7789 (= mapRest!7780 (store mapRest!7789 mapKey!7789 mapValue!7789))))

(declare-fun b!195554 () Bool)

(assert (=> b!195554 (= e!128612 tp_is_empty!4495)))

(assert (= (and mapNonEmpty!7780 condMapEmpty!7789) mapIsEmpty!7789))

(assert (= (and mapNonEmpty!7780 (not condMapEmpty!7789)) mapNonEmpty!7789))

(assert (= (and mapNonEmpty!7789 ((_ is ValueCellFull!1904) mapValue!7789)) b!195554))

(assert (= (and mapNonEmpty!7780 ((_ is ValueCellFull!1904) mapDefault!7789)) b!195555))

(declare-fun m!223293 () Bool)

(assert (=> mapNonEmpty!7789 m!223293))

(check-sat (not b!195536) b_and!11483 (not b!195545) (not d!57565) (not b!195547) (not d!57563) (not b_next!4723) (not b!195546) (not mapNonEmpty!7789) tp_is_empty!4495)
(check-sat b_and!11483 (not b_next!4723))
