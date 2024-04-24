; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76788 () Bool)

(assert start!76788)

(declare-fun b!898232 () Bool)

(declare-fun b_free!15979 () Bool)

(declare-fun b_next!15979 () Bool)

(assert (=> b!898232 (= b_free!15979 (not b_next!15979))))

(declare-fun tp!55988 () Bool)

(declare-fun b_and!26281 () Bool)

(assert (=> b!898232 (= tp!55988 b_and!26281)))

(declare-fun res!606910 () Bool)

(declare-fun e!502336 () Bool)

(assert (=> start!76788 (=> (not res!606910) (not e!502336))))

(declare-datatypes ((array!52679 0))(
  ( (array!52680 (arr!25318 (Array (_ BitVec 32) (_ BitVec 64))) (size!25773 (_ BitVec 32))) )
))
(declare-datatypes ((V!29375 0))(
  ( (V!29376 (val!9204 Int)) )
))
(declare-datatypes ((ValueCell!8672 0))(
  ( (ValueCellFull!8672 (v!11691 V!29375)) (EmptyCell!8672) )
))
(declare-datatypes ((array!52681 0))(
  ( (array!52682 (arr!25319 (Array (_ BitVec 32) ValueCell!8672)) (size!25774 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4360 0))(
  ( (LongMapFixedSize!4361 (defaultEntry!5392 Int) (mask!26120 (_ BitVec 32)) (extraKeys!5101 (_ BitVec 32)) (zeroValue!5205 V!29375) (minValue!5205 V!29375) (_size!2235 (_ BitVec 32)) (_keys!10175 array!52679) (_values!5392 array!52681) (_vacant!2235 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4360)

(declare-fun valid!1691 (LongMapFixedSize!4360) Bool)

(assert (=> start!76788 (= res!606910 (valid!1691 thiss!1181))))

(assert (=> start!76788 e!502336))

(declare-fun e!502329 () Bool)

(assert (=> start!76788 e!502329))

(assert (=> start!76788 true))

(declare-fun b!898231 () Bool)

(declare-fun res!606907 () Bool)

(assert (=> b!898231 (=> (not res!606907) (not e!502336))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!898231 (= res!606907 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!29096 () Bool)

(declare-fun mapRes!29096 () Bool)

(assert (=> mapIsEmpty!29096 mapRes!29096))

(declare-fun e!502334 () Bool)

(declare-fun tp_is_empty!18307 () Bool)

(declare-fun array_inv!19926 (array!52679) Bool)

(declare-fun array_inv!19927 (array!52681) Bool)

(assert (=> b!898232 (= e!502329 (and tp!55988 tp_is_empty!18307 (array_inv!19926 (_keys!10175 thiss!1181)) (array_inv!19927 (_values!5392 thiss!1181)) e!502334))))

(declare-fun b!898233 () Bool)

(declare-fun e!502330 () Bool)

(declare-fun e!502328 () Bool)

(assert (=> b!898233 (= e!502330 e!502328)))

(declare-fun res!606911 () Bool)

(assert (=> b!898233 (=> res!606911 e!502328)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!898233 (= res!606911 (not (validMask!0 (mask!26120 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!898233 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8861 0))(
  ( (MissingZero!8861 (index!37815 (_ BitVec 32))) (Found!8861 (index!37816 (_ BitVec 32))) (Intermediate!8861 (undefined!9673 Bool) (index!37817 (_ BitVec 32)) (x!76415 (_ BitVec 32))) (Undefined!8861) (MissingVacant!8861 (index!37818 (_ BitVec 32))) )
))
(declare-fun lt!405505 () SeekEntryResult!8861)

(declare-datatypes ((Unit!30494 0))(
  ( (Unit!30495) )
))
(declare-fun lt!405504 () Unit!30494)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52679 (_ BitVec 64) (_ BitVec 32)) Unit!30494)

(assert (=> b!898233 (= lt!405504 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) key!785 (index!37816 lt!405505)))))

(declare-fun b!898234 () Bool)

(declare-fun e!502333 () Bool)

(assert (=> b!898234 (= e!502334 (and e!502333 mapRes!29096))))

(declare-fun condMapEmpty!29096 () Bool)

(declare-fun mapDefault!29096 () ValueCell!8672)

(assert (=> b!898234 (= condMapEmpty!29096 (= (arr!25319 (_values!5392 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8672)) mapDefault!29096)))))

(declare-fun b!898235 () Bool)

(assert (=> b!898235 (= e!502328 (or (not (= (size!25774 (_values!5392 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26120 thiss!1181)))) (not (= (size!25773 (_keys!10175 thiss!1181)) (size!25774 (_values!5392 thiss!1181)))) (bvslt (mask!26120 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5101 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5101 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29096 () Bool)

(declare-fun tp!55987 () Bool)

(declare-fun e!502332 () Bool)

(assert (=> mapNonEmpty!29096 (= mapRes!29096 (and tp!55987 e!502332))))

(declare-fun mapValue!29096 () ValueCell!8672)

(declare-fun mapKey!29096 () (_ BitVec 32))

(declare-fun mapRest!29096 () (Array (_ BitVec 32) ValueCell!8672))

(assert (=> mapNonEmpty!29096 (= (arr!25319 (_values!5392 thiss!1181)) (store mapRest!29096 mapKey!29096 mapValue!29096))))

(declare-fun b!898236 () Bool)

(assert (=> b!898236 (= e!502333 tp_is_empty!18307)))

(declare-fun b!898237 () Bool)

(assert (=> b!898237 (= e!502336 (not e!502330))))

(declare-fun res!606909 () Bool)

(assert (=> b!898237 (=> res!606909 e!502330)))

(get-info :version)

(assert (=> b!898237 (= res!606909 (not ((_ is Found!8861) lt!405505)))))

(declare-fun e!502331 () Bool)

(assert (=> b!898237 e!502331))

(declare-fun res!606908 () Bool)

(assert (=> b!898237 (=> res!606908 e!502331)))

(assert (=> b!898237 (= res!606908 (not ((_ is Found!8861) lt!405505)))))

(declare-fun lt!405506 () Unit!30494)

(declare-fun lemmaSeekEntryGivesInRangeIndex!87 (array!52679 array!52681 (_ BitVec 32) (_ BitVec 32) V!29375 V!29375 (_ BitVec 64)) Unit!30494)

(assert (=> b!898237 (= lt!405506 (lemmaSeekEntryGivesInRangeIndex!87 (_keys!10175 thiss!1181) (_values!5392 thiss!1181) (mask!26120 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8861)

(assert (=> b!898237 (= lt!405505 (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(declare-fun b!898238 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!898238 (= e!502331 (inRange!0 (index!37816 lt!405505) (mask!26120 thiss!1181)))))

(declare-fun b!898239 () Bool)

(assert (=> b!898239 (= e!502332 tp_is_empty!18307)))

(assert (= (and start!76788 res!606910) b!898231))

(assert (= (and b!898231 res!606907) b!898237))

(assert (= (and b!898237 (not res!606908)) b!898238))

(assert (= (and b!898237 (not res!606909)) b!898233))

(assert (= (and b!898233 (not res!606911)) b!898235))

(assert (= (and b!898234 condMapEmpty!29096) mapIsEmpty!29096))

(assert (= (and b!898234 (not condMapEmpty!29096)) mapNonEmpty!29096))

(assert (= (and mapNonEmpty!29096 ((_ is ValueCellFull!8672) mapValue!29096)) b!898239))

(assert (= (and b!898234 ((_ is ValueCellFull!8672) mapDefault!29096)) b!898236))

(assert (= b!898232 b!898234))

(assert (= start!76788 b!898232))

(declare-fun m!835459 () Bool)

(assert (=> b!898237 m!835459))

(declare-fun m!835461 () Bool)

(assert (=> b!898237 m!835461))

(declare-fun m!835463 () Bool)

(assert (=> b!898238 m!835463))

(declare-fun m!835465 () Bool)

(assert (=> b!898233 m!835465))

(declare-fun m!835467 () Bool)

(assert (=> b!898233 m!835467))

(declare-fun m!835469 () Bool)

(assert (=> b!898233 m!835469))

(declare-fun m!835471 () Bool)

(assert (=> b!898232 m!835471))

(declare-fun m!835473 () Bool)

(assert (=> b!898232 m!835473))

(declare-fun m!835475 () Bool)

(assert (=> start!76788 m!835475))

(declare-fun m!835477 () Bool)

(assert (=> mapNonEmpty!29096 m!835477))

(check-sat (not b!898237) (not b_next!15979) (not b!898238) (not mapNonEmpty!29096) (not start!76788) tp_is_empty!18307 (not b!898232) b_and!26281 (not b!898233))
(check-sat b_and!26281 (not b_next!15979))
(get-model)

(declare-fun d!111397 () Bool)

(assert (=> d!111397 (= (inRange!0 (index!37816 lt!405505) (mask!26120 thiss!1181)) (and (bvsge (index!37816 lt!405505) #b00000000000000000000000000000000) (bvslt (index!37816 lt!405505) (bvadd (mask!26120 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898238 d!111397))

(declare-fun d!111399 () Bool)

(assert (=> d!111399 (= (array_inv!19926 (_keys!10175 thiss!1181)) (bvsge (size!25773 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898232 d!111399))

(declare-fun d!111401 () Bool)

(assert (=> d!111401 (= (array_inv!19927 (_values!5392 thiss!1181)) (bvsge (size!25774 (_values!5392 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!898232 d!111401))

(declare-fun d!111403 () Bool)

(assert (=> d!111403 (= (validMask!0 (mask!26120 thiss!1181)) (and (or (= (mask!26120 thiss!1181) #b00000000000000000000000000000111) (= (mask!26120 thiss!1181) #b00000000000000000000000000001111) (= (mask!26120 thiss!1181) #b00000000000000000000000000011111) (= (mask!26120 thiss!1181) #b00000000000000000000000000111111) (= (mask!26120 thiss!1181) #b00000000000000000000000001111111) (= (mask!26120 thiss!1181) #b00000000000000000000000011111111) (= (mask!26120 thiss!1181) #b00000000000000000000000111111111) (= (mask!26120 thiss!1181) #b00000000000000000000001111111111) (= (mask!26120 thiss!1181) #b00000000000000000000011111111111) (= (mask!26120 thiss!1181) #b00000000000000000000111111111111) (= (mask!26120 thiss!1181) #b00000000000000000001111111111111) (= (mask!26120 thiss!1181) #b00000000000000000011111111111111) (= (mask!26120 thiss!1181) #b00000000000000000111111111111111) (= (mask!26120 thiss!1181) #b00000000000000001111111111111111) (= (mask!26120 thiss!1181) #b00000000000000011111111111111111) (= (mask!26120 thiss!1181) #b00000000000000111111111111111111) (= (mask!26120 thiss!1181) #b00000000000001111111111111111111) (= (mask!26120 thiss!1181) #b00000000000011111111111111111111) (= (mask!26120 thiss!1181) #b00000000000111111111111111111111) (= (mask!26120 thiss!1181) #b00000000001111111111111111111111) (= (mask!26120 thiss!1181) #b00000000011111111111111111111111) (= (mask!26120 thiss!1181) #b00000000111111111111111111111111) (= (mask!26120 thiss!1181) #b00000001111111111111111111111111) (= (mask!26120 thiss!1181) #b00000011111111111111111111111111) (= (mask!26120 thiss!1181) #b00000111111111111111111111111111) (= (mask!26120 thiss!1181) #b00001111111111111111111111111111) (= (mask!26120 thiss!1181) #b00011111111111111111111111111111) (= (mask!26120 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26120 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!898233 d!111403))

(declare-fun d!111405 () Bool)

(declare-fun res!606946 () Bool)

(declare-fun e!502395 () Bool)

(assert (=> d!111405 (=> res!606946 e!502395)))

(assert (=> d!111405 (= res!606946 (= (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!111405 (= (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000) e!502395)))

(declare-fun b!898298 () Bool)

(declare-fun e!502396 () Bool)

(assert (=> b!898298 (= e!502395 e!502396)))

(declare-fun res!606947 () Bool)

(assert (=> b!898298 (=> (not res!606947) (not e!502396))))

(assert (=> b!898298 (= res!606947 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25773 (_keys!10175 thiss!1181))))))

(declare-fun b!898299 () Bool)

(assert (=> b!898299 (= e!502396 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!111405 (not res!606946)) b!898298))

(assert (= (and b!898298 res!606947) b!898299))

(declare-fun m!835519 () Bool)

(assert (=> d!111405 m!835519))

(declare-fun m!835521 () Bool)

(assert (=> b!898299 m!835521))

(assert (=> b!898233 d!111405))

(declare-fun d!111407 () Bool)

(assert (=> d!111407 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!405527 () Unit!30494)

(declare-fun choose!13 (array!52679 (_ BitVec 64) (_ BitVec 32)) Unit!30494)

(assert (=> d!111407 (= lt!405527 (choose!13 (_keys!10175 thiss!1181) key!785 (index!37816 lt!405505)))))

(assert (=> d!111407 (bvsge (index!37816 lt!405505) #b00000000000000000000000000000000)))

(assert (=> d!111407 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) key!785 (index!37816 lt!405505)) lt!405527)))

(declare-fun bs!25202 () Bool)

(assert (= bs!25202 d!111407))

(assert (=> bs!25202 m!835467))

(declare-fun m!835523 () Bool)

(assert (=> bs!25202 m!835523))

(assert (=> b!898233 d!111407))

(declare-fun d!111409 () Bool)

(declare-fun e!502399 () Bool)

(assert (=> d!111409 e!502399))

(declare-fun res!606950 () Bool)

(assert (=> d!111409 (=> res!606950 e!502399)))

(declare-fun lt!405533 () SeekEntryResult!8861)

(assert (=> d!111409 (= res!606950 (not ((_ is Found!8861) lt!405533)))))

(assert (=> d!111409 (= lt!405533 (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(declare-fun lt!405532 () Unit!30494)

(declare-fun choose!1489 (array!52679 array!52681 (_ BitVec 32) (_ BitVec 32) V!29375 V!29375 (_ BitVec 64)) Unit!30494)

(assert (=> d!111409 (= lt!405532 (choose!1489 (_keys!10175 thiss!1181) (_values!5392 thiss!1181) (mask!26120 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785))))

(assert (=> d!111409 (validMask!0 (mask!26120 thiss!1181))))

(assert (=> d!111409 (= (lemmaSeekEntryGivesInRangeIndex!87 (_keys!10175 thiss!1181) (_values!5392 thiss!1181) (mask!26120 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785) lt!405532)))

(declare-fun b!898302 () Bool)

(assert (=> b!898302 (= e!502399 (inRange!0 (index!37816 lt!405533) (mask!26120 thiss!1181)))))

(assert (= (and d!111409 (not res!606950)) b!898302))

(assert (=> d!111409 m!835461))

(declare-fun m!835525 () Bool)

(assert (=> d!111409 m!835525))

(assert (=> d!111409 m!835465))

(declare-fun m!835527 () Bool)

(assert (=> b!898302 m!835527))

(assert (=> b!898237 d!111409))

(declare-fun b!898315 () Bool)

(declare-fun c!95108 () Bool)

(declare-fun lt!405545 () (_ BitVec 64))

(assert (=> b!898315 (= c!95108 (= lt!405545 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502407 () SeekEntryResult!8861)

(declare-fun e!502408 () SeekEntryResult!8861)

(assert (=> b!898315 (= e!502407 e!502408)))

(declare-fun d!111411 () Bool)

(declare-fun lt!405542 () SeekEntryResult!8861)

(assert (=> d!111411 (and (or ((_ is MissingVacant!8861) lt!405542) (not ((_ is Found!8861) lt!405542)) (and (bvsge (index!37816 lt!405542) #b00000000000000000000000000000000) (bvslt (index!37816 lt!405542) (size!25773 (_keys!10175 thiss!1181))))) (not ((_ is MissingVacant!8861) lt!405542)) (or (not ((_ is Found!8861) lt!405542)) (= (select (arr!25318 (_keys!10175 thiss!1181)) (index!37816 lt!405542)) key!785)))))

(declare-fun e!502406 () SeekEntryResult!8861)

(assert (=> d!111411 (= lt!405542 e!502406)))

(declare-fun c!95107 () Bool)

(declare-fun lt!405544 () SeekEntryResult!8861)

(assert (=> d!111411 (= c!95107 (and ((_ is Intermediate!8861) lt!405544) (undefined!9673 lt!405544)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8861)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111411 (= lt!405544 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26120 thiss!1181)) key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(assert (=> d!111411 (validMask!0 (mask!26120 thiss!1181))))

(assert (=> d!111411 (= (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)) lt!405542)))

(declare-fun b!898316 () Bool)

(assert (=> b!898316 (= e!502408 (MissingZero!8861 (index!37817 lt!405544)))))

(declare-fun b!898317 () Bool)

(assert (=> b!898317 (= e!502406 e!502407)))

(assert (=> b!898317 (= lt!405545 (select (arr!25318 (_keys!10175 thiss!1181)) (index!37817 lt!405544)))))

(declare-fun c!95106 () Bool)

(assert (=> b!898317 (= c!95106 (= lt!405545 key!785))))

(declare-fun b!898318 () Bool)

(assert (=> b!898318 (= e!502407 (Found!8861 (index!37817 lt!405544)))))

(declare-fun b!898319 () Bool)

(declare-fun lt!405543 () SeekEntryResult!8861)

(assert (=> b!898319 (= e!502408 (ite ((_ is MissingVacant!8861) lt!405543) (MissingZero!8861 (index!37818 lt!405543)) lt!405543))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8861)

(assert (=> b!898319 (= lt!405543 (seekKeyOrZeroReturnVacant!0 (x!76415 lt!405544) (index!37817 lt!405544) (index!37817 lt!405544) key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(declare-fun b!898320 () Bool)

(assert (=> b!898320 (= e!502406 Undefined!8861)))

(assert (= (and d!111411 c!95107) b!898320))

(assert (= (and d!111411 (not c!95107)) b!898317))

(assert (= (and b!898317 c!95106) b!898318))

(assert (= (and b!898317 (not c!95106)) b!898315))

(assert (= (and b!898315 c!95108) b!898316))

(assert (= (and b!898315 (not c!95108)) b!898319))

(declare-fun m!835529 () Bool)

(assert (=> d!111411 m!835529))

(declare-fun m!835531 () Bool)

(assert (=> d!111411 m!835531))

(assert (=> d!111411 m!835531))

(declare-fun m!835533 () Bool)

(assert (=> d!111411 m!835533))

(assert (=> d!111411 m!835465))

(declare-fun m!835535 () Bool)

(assert (=> b!898317 m!835535))

(declare-fun m!835537 () Bool)

(assert (=> b!898319 m!835537))

(assert (=> b!898237 d!111411))

(declare-fun d!111413 () Bool)

(declare-fun res!606957 () Bool)

(declare-fun e!502411 () Bool)

(assert (=> d!111413 (=> (not res!606957) (not e!502411))))

(declare-fun simpleValid!318 (LongMapFixedSize!4360) Bool)

(assert (=> d!111413 (= res!606957 (simpleValid!318 thiss!1181))))

(assert (=> d!111413 (= (valid!1691 thiss!1181) e!502411)))

(declare-fun b!898327 () Bool)

(declare-fun res!606958 () Bool)

(assert (=> b!898327 (=> (not res!606958) (not e!502411))))

(declare-fun arrayCountValidKeys!0 (array!52679 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898327 (= res!606958 (= (arrayCountValidKeys!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 (size!25773 (_keys!10175 thiss!1181))) (_size!2235 thiss!1181)))))

(declare-fun b!898328 () Bool)

(declare-fun res!606959 () Bool)

(assert (=> b!898328 (=> (not res!606959) (not e!502411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52679 (_ BitVec 32)) Bool)

(assert (=> b!898328 (= res!606959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(declare-fun b!898329 () Bool)

(declare-datatypes ((List!17778 0))(
  ( (Nil!17775) (Cons!17774 (h!18921 (_ BitVec 64)) (t!25109 List!17778)) )
))
(declare-fun arrayNoDuplicates!0 (array!52679 (_ BitVec 32) List!17778) Bool)

(assert (=> b!898329 (= e!502411 (arrayNoDuplicates!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 Nil!17775))))

(assert (= (and d!111413 res!606957) b!898327))

(assert (= (and b!898327 res!606958) b!898328))

(assert (= (and b!898328 res!606959) b!898329))

(declare-fun m!835539 () Bool)

(assert (=> d!111413 m!835539))

(declare-fun m!835541 () Bool)

(assert (=> b!898327 m!835541))

(declare-fun m!835543 () Bool)

(assert (=> b!898328 m!835543))

(declare-fun m!835545 () Bool)

(assert (=> b!898329 m!835545))

(assert (=> start!76788 d!111413))

(declare-fun mapNonEmpty!29105 () Bool)

(declare-fun mapRes!29105 () Bool)

(declare-fun tp!56003 () Bool)

(declare-fun e!502416 () Bool)

(assert (=> mapNonEmpty!29105 (= mapRes!29105 (and tp!56003 e!502416))))

(declare-fun mapValue!29105 () ValueCell!8672)

(declare-fun mapKey!29105 () (_ BitVec 32))

(declare-fun mapRest!29105 () (Array (_ BitVec 32) ValueCell!8672))

(assert (=> mapNonEmpty!29105 (= mapRest!29096 (store mapRest!29105 mapKey!29105 mapValue!29105))))

(declare-fun b!898336 () Bool)

(assert (=> b!898336 (= e!502416 tp_is_empty!18307)))

(declare-fun mapIsEmpty!29105 () Bool)

(assert (=> mapIsEmpty!29105 mapRes!29105))

(declare-fun condMapEmpty!29105 () Bool)

(declare-fun mapDefault!29105 () ValueCell!8672)

(assert (=> mapNonEmpty!29096 (= condMapEmpty!29105 (= mapRest!29096 ((as const (Array (_ BitVec 32) ValueCell!8672)) mapDefault!29105)))))

(declare-fun e!502417 () Bool)

(assert (=> mapNonEmpty!29096 (= tp!55987 (and e!502417 mapRes!29105))))

(declare-fun b!898337 () Bool)

(assert (=> b!898337 (= e!502417 tp_is_empty!18307)))

(assert (= (and mapNonEmpty!29096 condMapEmpty!29105) mapIsEmpty!29105))

(assert (= (and mapNonEmpty!29096 (not condMapEmpty!29105)) mapNonEmpty!29105))

(assert (= (and mapNonEmpty!29105 ((_ is ValueCellFull!8672) mapValue!29105)) b!898336))

(assert (= (and mapNonEmpty!29096 ((_ is ValueCellFull!8672) mapDefault!29105)) b!898337))

(declare-fun m!835547 () Bool)

(assert (=> mapNonEmpty!29105 m!835547))

(check-sat (not b_next!15979) tp_is_empty!18307 (not b!898327) (not b!898328) (not b!898319) (not d!111413) (not b!898329) (not mapNonEmpty!29105) (not d!111411) (not d!111409) (not d!111407) b_and!26281 (not b!898299) (not b!898302))
(check-sat b_and!26281 (not b_next!15979))
(get-model)

(declare-fun d!111415 () Bool)

(declare-fun res!606960 () Bool)

(declare-fun e!502418 () Bool)

(assert (=> d!111415 (=> res!606960 e!502418)))

(assert (=> d!111415 (= res!606960 (= (select (arr!25318 (_keys!10175 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!111415 (= (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!502418)))

(declare-fun b!898338 () Bool)

(declare-fun e!502419 () Bool)

(assert (=> b!898338 (= e!502418 e!502419)))

(declare-fun res!606961 () Bool)

(assert (=> b!898338 (=> (not res!606961) (not e!502419))))

(assert (=> b!898338 (= res!606961 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25773 (_keys!10175 thiss!1181))))))

(declare-fun b!898339 () Bool)

(assert (=> b!898339 (= e!502419 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!111415 (not res!606960)) b!898338))

(assert (= (and b!898338 res!606961) b!898339))

(declare-fun m!835549 () Bool)

(assert (=> d!111415 m!835549))

(declare-fun m!835551 () Bool)

(assert (=> b!898339 m!835551))

(assert (=> b!898299 d!111415))

(declare-fun b!898350 () Bool)

(declare-fun e!502431 () Bool)

(declare-fun contains!4375 (List!17778 (_ BitVec 64)) Bool)

(assert (=> b!898350 (= e!502431 (contains!4375 Nil!17775 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898351 () Bool)

(declare-fun e!502429 () Bool)

(declare-fun call!39853 () Bool)

(assert (=> b!898351 (= e!502429 call!39853)))

(declare-fun b!898352 () Bool)

(declare-fun e!502428 () Bool)

(assert (=> b!898352 (= e!502428 e!502429)))

(declare-fun c!95111 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!898352 (= c!95111 (validKeyInArray!0 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39850 () Bool)

(assert (=> bm!39850 (= call!39853 (arrayNoDuplicates!0 (_keys!10175 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95111 (Cons!17774 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000) Nil!17775) Nil!17775)))))

(declare-fun b!898353 () Bool)

(declare-fun e!502430 () Bool)

(assert (=> b!898353 (= e!502430 e!502428)))

(declare-fun res!606968 () Bool)

(assert (=> b!898353 (=> (not res!606968) (not e!502428))))

(assert (=> b!898353 (= res!606968 (not e!502431))))

(declare-fun res!606969 () Bool)

(assert (=> b!898353 (=> (not res!606969) (not e!502431))))

(assert (=> b!898353 (= res!606969 (validKeyInArray!0 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!898354 () Bool)

(assert (=> b!898354 (= e!502429 call!39853)))

(declare-fun d!111417 () Bool)

(declare-fun res!606970 () Bool)

(assert (=> d!111417 (=> res!606970 e!502430)))

(assert (=> d!111417 (= res!606970 (bvsge #b00000000000000000000000000000000 (size!25773 (_keys!10175 thiss!1181))))))

(assert (=> d!111417 (= (arrayNoDuplicates!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 Nil!17775) e!502430)))

(assert (= (and d!111417 (not res!606970)) b!898353))

(assert (= (and b!898353 res!606969) b!898350))

(assert (= (and b!898353 res!606968) b!898352))

(assert (= (and b!898352 c!95111) b!898354))

(assert (= (and b!898352 (not c!95111)) b!898351))

(assert (= (or b!898354 b!898351) bm!39850))

(assert (=> b!898350 m!835519))

(assert (=> b!898350 m!835519))

(declare-fun m!835553 () Bool)

(assert (=> b!898350 m!835553))

(assert (=> b!898352 m!835519))

(assert (=> b!898352 m!835519))

(declare-fun m!835555 () Bool)

(assert (=> b!898352 m!835555))

(assert (=> bm!39850 m!835519))

(declare-fun m!835557 () Bool)

(assert (=> bm!39850 m!835557))

(assert (=> b!898353 m!835519))

(assert (=> b!898353 m!835519))

(assert (=> b!898353 m!835555))

(assert (=> b!898329 d!111417))

(declare-fun d!111419 () Bool)

(assert (=> d!111419 (= (inRange!0 (index!37816 lt!405533) (mask!26120 thiss!1181)) (and (bvsge (index!37816 lt!405533) #b00000000000000000000000000000000) (bvslt (index!37816 lt!405533) (bvadd (mask!26120 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!898302 d!111419))

(declare-fun b!898367 () Bool)

(declare-fun e!502438 () SeekEntryResult!8861)

(declare-fun e!502440 () SeekEntryResult!8861)

(assert (=> b!898367 (= e!502438 e!502440)))

(declare-fun c!95120 () Bool)

(declare-fun lt!405551 () (_ BitVec 64))

(assert (=> b!898367 (= c!95120 (= lt!405551 key!785))))

(declare-fun b!898368 () Bool)

(declare-fun e!502439 () SeekEntryResult!8861)

(assert (=> b!898368 (= e!502439 (MissingVacant!8861 (index!37817 lt!405544)))))

(declare-fun b!898369 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!898369 (= e!502439 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76415 lt!405544) #b00000000000000000000000000000001) (nextIndex!0 (index!37817 lt!405544) (bvadd (x!76415 lt!405544) #b00000000000000000000000000000001) (mask!26120 thiss!1181)) (index!37817 lt!405544) key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(declare-fun b!898371 () Bool)

(assert (=> b!898371 (= e!502438 Undefined!8861)))

(declare-fun b!898372 () Bool)

(assert (=> b!898372 (= e!502440 (Found!8861 (index!37817 lt!405544)))))

(declare-fun lt!405550 () SeekEntryResult!8861)

(declare-fun d!111421 () Bool)

(assert (=> d!111421 (and (or ((_ is Undefined!8861) lt!405550) (not ((_ is Found!8861) lt!405550)) (and (bvsge (index!37816 lt!405550) #b00000000000000000000000000000000) (bvslt (index!37816 lt!405550) (size!25773 (_keys!10175 thiss!1181))))) (or ((_ is Undefined!8861) lt!405550) ((_ is Found!8861) lt!405550) (not ((_ is MissingVacant!8861) lt!405550)) (not (= (index!37818 lt!405550) (index!37817 lt!405544))) (and (bvsge (index!37818 lt!405550) #b00000000000000000000000000000000) (bvslt (index!37818 lt!405550) (size!25773 (_keys!10175 thiss!1181))))) (or ((_ is Undefined!8861) lt!405550) (ite ((_ is Found!8861) lt!405550) (= (select (arr!25318 (_keys!10175 thiss!1181)) (index!37816 lt!405550)) key!785) (and ((_ is MissingVacant!8861) lt!405550) (= (index!37818 lt!405550) (index!37817 lt!405544)) (= (select (arr!25318 (_keys!10175 thiss!1181)) (index!37818 lt!405550)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!111421 (= lt!405550 e!502438)))

(declare-fun c!95119 () Bool)

(assert (=> d!111421 (= c!95119 (bvsge (x!76415 lt!405544) #b01111111111111111111111111111110))))

(assert (=> d!111421 (= lt!405551 (select (arr!25318 (_keys!10175 thiss!1181)) (index!37817 lt!405544)))))

(assert (=> d!111421 (validMask!0 (mask!26120 thiss!1181))))

(assert (=> d!111421 (= (seekKeyOrZeroReturnVacant!0 (x!76415 lt!405544) (index!37817 lt!405544) (index!37817 lt!405544) key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)) lt!405550)))

(declare-fun b!898370 () Bool)

(declare-fun c!95118 () Bool)

(assert (=> b!898370 (= c!95118 (= lt!405551 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!898370 (= e!502440 e!502439)))

(assert (= (and d!111421 c!95119) b!898371))

(assert (= (and d!111421 (not c!95119)) b!898367))

(assert (= (and b!898367 c!95120) b!898372))

(assert (= (and b!898367 (not c!95120)) b!898370))

(assert (= (and b!898370 c!95118) b!898368))

(assert (= (and b!898370 (not c!95118)) b!898369))

(declare-fun m!835559 () Bool)

(assert (=> b!898369 m!835559))

(assert (=> b!898369 m!835559))

(declare-fun m!835561 () Bool)

(assert (=> b!898369 m!835561))

(declare-fun m!835563 () Bool)

(assert (=> d!111421 m!835563))

(declare-fun m!835565 () Bool)

(assert (=> d!111421 m!835565))

(assert (=> d!111421 m!835535))

(assert (=> d!111421 m!835465))

(assert (=> b!898319 d!111421))

(assert (=> d!111407 d!111405))

(declare-fun d!111423 () Bool)

(assert (=> d!111423 (arrayContainsKey!0 (_keys!10175 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!111423 true))

(declare-fun _$60!415 () Unit!30494)

(assert (=> d!111423 (= (choose!13 (_keys!10175 thiss!1181) key!785 (index!37816 lt!405505)) _$60!415)))

(declare-fun bs!25203 () Bool)

(assert (= bs!25203 d!111423))

(assert (=> bs!25203 m!835467))

(assert (=> d!111407 d!111423))

(declare-fun b!898391 () Bool)

(declare-fun e!502453 () SeekEntryResult!8861)

(declare-fun e!502455 () SeekEntryResult!8861)

(assert (=> b!898391 (= e!502453 e!502455)))

(declare-fun c!95128 () Bool)

(declare-fun lt!405556 () (_ BitVec 64))

(assert (=> b!898391 (= c!95128 (or (= lt!405556 key!785) (= (bvadd lt!405556 lt!405556) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!898392 () Bool)

(assert (=> b!898392 (= e!502453 (Intermediate!8861 true (toIndex!0 key!785 (mask!26120 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun d!111425 () Bool)

(declare-fun e!502452 () Bool)

(assert (=> d!111425 e!502452))

(declare-fun c!95127 () Bool)

(declare-fun lt!405557 () SeekEntryResult!8861)

(assert (=> d!111425 (= c!95127 (and ((_ is Intermediate!8861) lt!405557) (undefined!9673 lt!405557)))))

(assert (=> d!111425 (= lt!405557 e!502453)))

(declare-fun c!95129 () Bool)

(assert (=> d!111425 (= c!95129 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111425 (= lt!405556 (select (arr!25318 (_keys!10175 thiss!1181)) (toIndex!0 key!785 (mask!26120 thiss!1181))))))

(assert (=> d!111425 (validMask!0 (mask!26120 thiss!1181))))

(assert (=> d!111425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26120 thiss!1181)) key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)) lt!405557)))

(declare-fun b!898393 () Bool)

(declare-fun e!502454 () Bool)

(assert (=> b!898393 (= e!502452 e!502454)))

(declare-fun res!606979 () Bool)

(assert (=> b!898393 (= res!606979 (and ((_ is Intermediate!8861) lt!405557) (not (undefined!9673 lt!405557)) (bvslt (x!76415 lt!405557) #b01111111111111111111111111111110) (bvsge (x!76415 lt!405557) #b00000000000000000000000000000000) (bvsge (x!76415 lt!405557) #b00000000000000000000000000000000)))))

(assert (=> b!898393 (=> (not res!606979) (not e!502454))))

(declare-fun b!898394 () Bool)

(assert (=> b!898394 (= e!502455 (Intermediate!8861 false (toIndex!0 key!785 (mask!26120 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!898395 () Bool)

(assert (=> b!898395 (= e!502455 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!26120 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!26120 thiss!1181)) key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(declare-fun b!898396 () Bool)

(assert (=> b!898396 (and (bvsge (index!37817 lt!405557) #b00000000000000000000000000000000) (bvslt (index!37817 lt!405557) (size!25773 (_keys!10175 thiss!1181))))))

(declare-fun res!606978 () Bool)

(assert (=> b!898396 (= res!606978 (= (select (arr!25318 (_keys!10175 thiss!1181)) (index!37817 lt!405557)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!502451 () Bool)

(assert (=> b!898396 (=> res!606978 e!502451)))

(declare-fun b!898397 () Bool)

(assert (=> b!898397 (= e!502452 (bvsge (x!76415 lt!405557) #b01111111111111111111111111111110))))

(declare-fun b!898398 () Bool)

(assert (=> b!898398 (and (bvsge (index!37817 lt!405557) #b00000000000000000000000000000000) (bvslt (index!37817 lt!405557) (size!25773 (_keys!10175 thiss!1181))))))

(declare-fun res!606977 () Bool)

(assert (=> b!898398 (= res!606977 (= (select (arr!25318 (_keys!10175 thiss!1181)) (index!37817 lt!405557)) key!785))))

(assert (=> b!898398 (=> res!606977 e!502451)))

(assert (=> b!898398 (= e!502454 e!502451)))

(declare-fun b!898399 () Bool)

(assert (=> b!898399 (and (bvsge (index!37817 lt!405557) #b00000000000000000000000000000000) (bvslt (index!37817 lt!405557) (size!25773 (_keys!10175 thiss!1181))))))

(assert (=> b!898399 (= e!502451 (= (select (arr!25318 (_keys!10175 thiss!1181)) (index!37817 lt!405557)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!111425 c!95129) b!898392))

(assert (= (and d!111425 (not c!95129)) b!898391))

(assert (= (and b!898391 c!95128) b!898394))

(assert (= (and b!898391 (not c!95128)) b!898395))

(assert (= (and d!111425 c!95127) b!898397))

(assert (= (and d!111425 (not c!95127)) b!898393))

(assert (= (and b!898393 res!606979) b!898398))

(assert (= (and b!898398 (not res!606977)) b!898396))

(assert (= (and b!898396 (not res!606978)) b!898399))

(assert (=> b!898395 m!835531))

(declare-fun m!835567 () Bool)

(assert (=> b!898395 m!835567))

(assert (=> b!898395 m!835567))

(declare-fun m!835569 () Bool)

(assert (=> b!898395 m!835569))

(declare-fun m!835571 () Bool)

(assert (=> b!898399 m!835571))

(assert (=> d!111425 m!835531))

(declare-fun m!835573 () Bool)

(assert (=> d!111425 m!835573))

(assert (=> d!111425 m!835465))

(assert (=> b!898396 m!835571))

(assert (=> b!898398 m!835571))

(assert (=> d!111411 d!111425))

(declare-fun d!111427 () Bool)

(declare-fun lt!405563 () (_ BitVec 32))

(declare-fun lt!405562 () (_ BitVec 32))

(assert (=> d!111427 (= lt!405563 (bvmul (bvxor lt!405562 (bvlshr lt!405562 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111427 (= lt!405562 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111427 (and (bvsge (mask!26120 thiss!1181) #b00000000000000000000000000000000) (let ((res!606980 (let ((h!18922 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76434 (bvmul (bvxor h!18922 (bvlshr h!18922 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76434 (bvlshr x!76434 #b00000000000000000000000000001101)) (mask!26120 thiss!1181)))))) (and (bvslt res!606980 (bvadd (mask!26120 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!606980 #b00000000000000000000000000000000))))))

(assert (=> d!111427 (= (toIndex!0 key!785 (mask!26120 thiss!1181)) (bvand (bvxor lt!405563 (bvlshr lt!405563 #b00000000000000000000000000001101)) (mask!26120 thiss!1181)))))

(assert (=> d!111411 d!111427))

(assert (=> d!111411 d!111403))

(declare-fun b!898408 () Bool)

(declare-fun e!502463 () Bool)

(declare-fun e!502464 () Bool)

(assert (=> b!898408 (= e!502463 e!502464)))

(declare-fun lt!405572 () (_ BitVec 64))

(assert (=> b!898408 (= lt!405572 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!405571 () Unit!30494)

(assert (=> b!898408 (= lt!405571 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10175 thiss!1181) lt!405572 #b00000000000000000000000000000000))))

(assert (=> b!898408 (arrayContainsKey!0 (_keys!10175 thiss!1181) lt!405572 #b00000000000000000000000000000000)))

(declare-fun lt!405570 () Unit!30494)

(assert (=> b!898408 (= lt!405570 lt!405571)))

(declare-fun res!606986 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52679 (_ BitVec 32)) SeekEntryResult!8861)

(assert (=> b!898408 (= res!606986 (= (seekEntryOrOpen!0 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000) (_keys!10175 thiss!1181) (mask!26120 thiss!1181)) (Found!8861 #b00000000000000000000000000000000)))))

(assert (=> b!898408 (=> (not res!606986) (not e!502464))))

(declare-fun b!898409 () Bool)

(declare-fun call!39856 () Bool)

(assert (=> b!898409 (= e!502463 call!39856)))

(declare-fun bm!39853 () Bool)

(assert (=> bm!39853 (= call!39856 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(declare-fun b!898410 () Bool)

(assert (=> b!898410 (= e!502464 call!39856)))

(declare-fun d!111429 () Bool)

(declare-fun res!606985 () Bool)

(declare-fun e!502462 () Bool)

(assert (=> d!111429 (=> res!606985 e!502462)))

(assert (=> d!111429 (= res!606985 (bvsge #b00000000000000000000000000000000 (size!25773 (_keys!10175 thiss!1181))))))

(assert (=> d!111429 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)) e!502462)))

(declare-fun b!898411 () Bool)

(assert (=> b!898411 (= e!502462 e!502463)))

(declare-fun c!95132 () Bool)

(assert (=> b!898411 (= c!95132 (validKeyInArray!0 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!111429 (not res!606985)) b!898411))

(assert (= (and b!898411 c!95132) b!898408))

(assert (= (and b!898411 (not c!95132)) b!898409))

(assert (= (and b!898408 res!606986) b!898410))

(assert (= (or b!898410 b!898409) bm!39853))

(assert (=> b!898408 m!835519))

(declare-fun m!835575 () Bool)

(assert (=> b!898408 m!835575))

(declare-fun m!835577 () Bool)

(assert (=> b!898408 m!835577))

(assert (=> b!898408 m!835519))

(declare-fun m!835579 () Bool)

(assert (=> b!898408 m!835579))

(declare-fun m!835581 () Bool)

(assert (=> bm!39853 m!835581))

(assert (=> b!898411 m!835519))

(assert (=> b!898411 m!835519))

(assert (=> b!898411 m!835555))

(assert (=> b!898328 d!111429))

(declare-fun b!898422 () Bool)

(declare-fun res!606995 () Bool)

(declare-fun e!502467 () Bool)

(assert (=> b!898422 (=> (not res!606995) (not e!502467))))

(declare-fun size!25779 (LongMapFixedSize!4360) (_ BitVec 32))

(assert (=> b!898422 (= res!606995 (= (size!25779 thiss!1181) (bvadd (_size!2235 thiss!1181) (bvsdiv (bvadd (extraKeys!5101 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!898423 () Bool)

(assert (=> b!898423 (= e!502467 (and (bvsge (extraKeys!5101 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5101 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2235 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!898421 () Bool)

(declare-fun res!606996 () Bool)

(assert (=> b!898421 (=> (not res!606996) (not e!502467))))

(assert (=> b!898421 (= res!606996 (bvsge (size!25779 thiss!1181) (_size!2235 thiss!1181)))))

(declare-fun b!898420 () Bool)

(declare-fun res!606997 () Bool)

(assert (=> b!898420 (=> (not res!606997) (not e!502467))))

(assert (=> b!898420 (= res!606997 (and (= (size!25774 (_values!5392 thiss!1181)) (bvadd (mask!26120 thiss!1181) #b00000000000000000000000000000001)) (= (size!25773 (_keys!10175 thiss!1181)) (size!25774 (_values!5392 thiss!1181))) (bvsge (_size!2235 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2235 thiss!1181) (bvadd (mask!26120 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111431 () Bool)

(declare-fun res!606998 () Bool)

(assert (=> d!111431 (=> (not res!606998) (not e!502467))))

(assert (=> d!111431 (= res!606998 (validMask!0 (mask!26120 thiss!1181)))))

(assert (=> d!111431 (= (simpleValid!318 thiss!1181) e!502467)))

(assert (= (and d!111431 res!606998) b!898420))

(assert (= (and b!898420 res!606997) b!898421))

(assert (= (and b!898421 res!606996) b!898422))

(assert (= (and b!898422 res!606995) b!898423))

(declare-fun m!835583 () Bool)

(assert (=> b!898422 m!835583))

(assert (=> b!898421 m!835583))

(assert (=> d!111431 m!835465))

(assert (=> d!111413 d!111431))

(assert (=> d!111409 d!111411))

(declare-fun d!111433 () Bool)

(declare-fun e!502470 () Bool)

(assert (=> d!111433 e!502470))

(declare-fun res!607001 () Bool)

(assert (=> d!111433 (=> res!607001 e!502470)))

(declare-fun lt!405575 () SeekEntryResult!8861)

(assert (=> d!111433 (= res!607001 (not ((_ is Found!8861) lt!405575)))))

(assert (=> d!111433 (= lt!405575 (seekEntry!0 key!785 (_keys!10175 thiss!1181) (mask!26120 thiss!1181)))))

(assert (=> d!111433 true))

(declare-fun _$36!363 () Unit!30494)

(assert (=> d!111433 (= (choose!1489 (_keys!10175 thiss!1181) (_values!5392 thiss!1181) (mask!26120 thiss!1181) (extraKeys!5101 thiss!1181) (zeroValue!5205 thiss!1181) (minValue!5205 thiss!1181) key!785) _$36!363)))

(declare-fun b!898426 () Bool)

(assert (=> b!898426 (= e!502470 (inRange!0 (index!37816 lt!405575) (mask!26120 thiss!1181)))))

(assert (= (and d!111433 (not res!607001)) b!898426))

(assert (=> d!111433 m!835461))

(declare-fun m!835585 () Bool)

(assert (=> b!898426 m!835585))

(assert (=> d!111409 d!111433))

(assert (=> d!111409 d!111403))

(declare-fun b!898435 () Bool)

(declare-fun e!502476 () (_ BitVec 32))

(declare-fun e!502475 () (_ BitVec 32))

(assert (=> b!898435 (= e!502476 e!502475)))

(declare-fun c!95137 () Bool)

(assert (=> b!898435 (= c!95137 (validKeyInArray!0 (select (arr!25318 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39856 () Bool)

(declare-fun call!39859 () (_ BitVec 32))

(assert (=> bm!39856 (= call!39859 (arrayCountValidKeys!0 (_keys!10175 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25773 (_keys!10175 thiss!1181))))))

(declare-fun d!111435 () Bool)

(declare-fun lt!405578 () (_ BitVec 32))

(assert (=> d!111435 (and (bvsge lt!405578 #b00000000000000000000000000000000) (bvsle lt!405578 (bvsub (size!25773 (_keys!10175 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111435 (= lt!405578 e!502476)))

(declare-fun c!95138 () Bool)

(assert (=> d!111435 (= c!95138 (bvsge #b00000000000000000000000000000000 (size!25773 (_keys!10175 thiss!1181))))))

(assert (=> d!111435 (and (bvsle #b00000000000000000000000000000000 (size!25773 (_keys!10175 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25773 (_keys!10175 thiss!1181)) (size!25773 (_keys!10175 thiss!1181))))))

(assert (=> d!111435 (= (arrayCountValidKeys!0 (_keys!10175 thiss!1181) #b00000000000000000000000000000000 (size!25773 (_keys!10175 thiss!1181))) lt!405578)))

(declare-fun b!898436 () Bool)

(assert (=> b!898436 (= e!502476 #b00000000000000000000000000000000)))

(declare-fun b!898437 () Bool)

(assert (=> b!898437 (= e!502475 call!39859)))

(declare-fun b!898438 () Bool)

(assert (=> b!898438 (= e!502475 (bvadd #b00000000000000000000000000000001 call!39859))))

(assert (= (and d!111435 c!95138) b!898436))

(assert (= (and d!111435 (not c!95138)) b!898435))

(assert (= (and b!898435 c!95137) b!898438))

(assert (= (and b!898435 (not c!95137)) b!898437))

(assert (= (or b!898438 b!898437) bm!39856))

(assert (=> b!898435 m!835519))

(assert (=> b!898435 m!835519))

(assert (=> b!898435 m!835555))

(declare-fun m!835587 () Bool)

(assert (=> bm!39856 m!835587))

(assert (=> b!898327 d!111435))

(declare-fun mapNonEmpty!29106 () Bool)

(declare-fun mapRes!29106 () Bool)

(declare-fun tp!56004 () Bool)

(declare-fun e!502477 () Bool)

(assert (=> mapNonEmpty!29106 (= mapRes!29106 (and tp!56004 e!502477))))

(declare-fun mapKey!29106 () (_ BitVec 32))

(declare-fun mapValue!29106 () ValueCell!8672)

(declare-fun mapRest!29106 () (Array (_ BitVec 32) ValueCell!8672))

(assert (=> mapNonEmpty!29106 (= mapRest!29105 (store mapRest!29106 mapKey!29106 mapValue!29106))))

(declare-fun b!898439 () Bool)

(assert (=> b!898439 (= e!502477 tp_is_empty!18307)))

(declare-fun mapIsEmpty!29106 () Bool)

(assert (=> mapIsEmpty!29106 mapRes!29106))

(declare-fun condMapEmpty!29106 () Bool)

(declare-fun mapDefault!29106 () ValueCell!8672)

(assert (=> mapNonEmpty!29105 (= condMapEmpty!29106 (= mapRest!29105 ((as const (Array (_ BitVec 32) ValueCell!8672)) mapDefault!29106)))))

(declare-fun e!502478 () Bool)

(assert (=> mapNonEmpty!29105 (= tp!56003 (and e!502478 mapRes!29106))))

(declare-fun b!898440 () Bool)

(assert (=> b!898440 (= e!502478 tp_is_empty!18307)))

(assert (= (and mapNonEmpty!29105 condMapEmpty!29106) mapIsEmpty!29106))

(assert (= (and mapNonEmpty!29105 (not condMapEmpty!29106)) mapNonEmpty!29106))

(assert (= (and mapNonEmpty!29106 ((_ is ValueCellFull!8672) mapValue!29106)) b!898439))

(assert (= (and mapNonEmpty!29105 ((_ is ValueCellFull!8672) mapDefault!29106)) b!898440))

(declare-fun m!835589 () Bool)

(assert (=> mapNonEmpty!29106 m!835589))

(check-sat (not b!898339) (not b_next!15979) (not b!898350) (not b!898353) (not b!898422) tp_is_empty!18307 (not b!898408) (not b!898352) b_and!26281 (not mapNonEmpty!29106) (not bm!39853) (not d!111423) (not b!898421) (not b!898395) (not b!898369) (not b!898435) (not bm!39850) (not bm!39856) (not d!111433) (not b!898426) (not d!111425) (not d!111431) (not d!111421) (not b!898411))
(check-sat b_and!26281 (not b_next!15979))
