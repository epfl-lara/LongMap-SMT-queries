; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18674 () Bool)

(assert start!18674)

(declare-fun b!184519 () Bool)

(declare-fun b_free!4549 () Bool)

(declare-fun b_next!4549 () Bool)

(assert (=> b!184519 (= b_free!4549 (not b_next!4549))))

(declare-fun tp!16432 () Bool)

(declare-fun b_and!11113 () Bool)

(assert (=> b!184519 (= tp!16432 b_and!11113)))

(declare-fun res!87259 () Bool)

(declare-fun e!121437 () Bool)

(assert (=> start!18674 (=> (not res!87259) (not e!121437))))

(declare-datatypes ((V!5409 0))(
  ( (V!5410 (val!2205 Int)) )
))
(declare-datatypes ((ValueCell!1817 0))(
  ( (ValueCellFull!1817 (v!4106 V!5409)) (EmptyCell!1817) )
))
(declare-datatypes ((array!7823 0))(
  ( (array!7824 (arr!3694 (Array (_ BitVec 32) (_ BitVec 64))) (size!4010 (_ BitVec 32))) )
))
(declare-datatypes ((array!7825 0))(
  ( (array!7826 (arr!3695 (Array (_ BitVec 32) ValueCell!1817)) (size!4011 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2542 0))(
  ( (LongMapFixedSize!2543 (defaultEntry!3768 Int) (mask!8857 (_ BitVec 32)) (extraKeys!3505 (_ BitVec 32)) (zeroValue!3609 V!5409) (minValue!3609 V!5409) (_size!1320 (_ BitVec 32)) (_keys!5698 array!7823) (_values!3751 array!7825) (_vacant!1320 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2542)

(declare-fun valid!1067 (LongMapFixedSize!2542) Bool)

(assert (=> start!18674 (= res!87259 (valid!1067 thiss!1248))))

(assert (=> start!18674 e!121437))

(declare-fun e!121438 () Bool)

(assert (=> start!18674 e!121438))

(assert (=> start!18674 true))

(declare-fun b!184511 () Bool)

(declare-fun e!121439 () Bool)

(declare-fun tp_is_empty!4321 () Bool)

(assert (=> b!184511 (= e!121439 tp_is_empty!4321)))

(declare-fun b!184512 () Bool)

(declare-fun e!121440 () Bool)

(assert (=> b!184512 (= e!121440 tp_is_empty!4321)))

(declare-fun b!184513 () Bool)

(declare-fun e!121442 () Bool)

(assert (=> b!184513 (= e!121442 (and (= (size!4011 (_values!3751 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8857 thiss!1248))) (= (size!4010 (_keys!5698 thiss!1248)) (size!4011 (_values!3751 thiss!1248))) (bvsge (mask!8857 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3505 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3505 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!7430 () Bool)

(declare-fun mapRes!7430 () Bool)

(declare-fun tp!16433 () Bool)

(assert (=> mapNonEmpty!7430 (= mapRes!7430 (and tp!16433 e!121440))))

(declare-fun mapValue!7430 () ValueCell!1817)

(declare-fun mapKey!7430 () (_ BitVec 32))

(declare-fun mapRest!7430 () (Array (_ BitVec 32) ValueCell!1817))

(assert (=> mapNonEmpty!7430 (= (arr!3695 (_values!3751 thiss!1248)) (store mapRest!7430 mapKey!7430 mapValue!7430))))

(declare-fun b!184514 () Bool)

(declare-fun res!87261 () Bool)

(assert (=> b!184514 (=> (not res!87261) (not e!121442))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3402 0))(
  ( (tuple2!3403 (_1!1712 (_ BitVec 64)) (_2!1712 V!5409)) )
))
(declare-datatypes ((List!2340 0))(
  ( (Nil!2337) (Cons!2336 (h!2968 tuple2!3402) (t!7207 List!2340)) )
))
(declare-datatypes ((ListLongMap!2311 0))(
  ( (ListLongMap!2312 (toList!1171 List!2340)) )
))
(declare-fun contains!1269 (ListLongMap!2311 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!804 (array!7823 array!7825 (_ BitVec 32) (_ BitVec 32) V!5409 V!5409 (_ BitVec 32) Int) ListLongMap!2311)

(assert (=> b!184514 (= res!87261 (not (contains!1269 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) key!828)))))

(declare-fun b!184515 () Bool)

(declare-fun res!87262 () Bool)

(assert (=> b!184515 (=> (not res!87262) (not e!121437))))

(assert (=> b!184515 (= res!87262 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184516 () Bool)

(declare-fun e!121441 () Bool)

(assert (=> b!184516 (= e!121441 (and e!121439 mapRes!7430))))

(declare-fun condMapEmpty!7430 () Bool)

(declare-fun mapDefault!7430 () ValueCell!1817)

(assert (=> b!184516 (= condMapEmpty!7430 (= (arr!3695 (_values!3751 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1817)) mapDefault!7430)))))

(declare-fun b!184517 () Bool)

(declare-fun res!87258 () Bool)

(assert (=> b!184517 (=> (not res!87258) (not e!121442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184517 (= res!87258 (validMask!0 (mask!8857 thiss!1248)))))

(declare-fun b!184518 () Bool)

(assert (=> b!184518 (= e!121437 e!121442)))

(declare-fun res!87260 () Bool)

(assert (=> b!184518 (=> (not res!87260) (not e!121442))))

(declare-datatypes ((SeekEntryResult!628 0))(
  ( (MissingZero!628 (index!4682 (_ BitVec 32))) (Found!628 (index!4683 (_ BitVec 32))) (Intermediate!628 (undefined!1440 Bool) (index!4684 (_ BitVec 32)) (x!20077 (_ BitVec 32))) (Undefined!628) (MissingVacant!628 (index!4685 (_ BitVec 32))) )
))
(declare-fun lt!91152 () SeekEntryResult!628)

(get-info :version)

(assert (=> b!184518 (= res!87260 (and (not ((_ is Undefined!628) lt!91152)) (not ((_ is MissingVacant!628) lt!91152)) (not ((_ is MissingZero!628) lt!91152)) ((_ is Found!628) lt!91152)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7823 (_ BitVec 32)) SeekEntryResult!628)

(assert (=> b!184518 (= lt!91152 (seekEntryOrOpen!0 key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)))))

(declare-fun array_inv!2389 (array!7823) Bool)

(declare-fun array_inv!2390 (array!7825) Bool)

(assert (=> b!184519 (= e!121438 (and tp!16432 tp_is_empty!4321 (array_inv!2389 (_keys!5698 thiss!1248)) (array_inv!2390 (_values!3751 thiss!1248)) e!121441))))

(declare-fun mapIsEmpty!7430 () Bool)

(assert (=> mapIsEmpty!7430 mapRes!7430))

(assert (= (and start!18674 res!87259) b!184515))

(assert (= (and b!184515 res!87262) b!184518))

(assert (= (and b!184518 res!87260) b!184514))

(assert (= (and b!184514 res!87261) b!184517))

(assert (= (and b!184517 res!87258) b!184513))

(assert (= (and b!184516 condMapEmpty!7430) mapIsEmpty!7430))

(assert (= (and b!184516 (not condMapEmpty!7430)) mapNonEmpty!7430))

(assert (= (and mapNonEmpty!7430 ((_ is ValueCellFull!1817) mapValue!7430)) b!184512))

(assert (= (and b!184516 ((_ is ValueCellFull!1817) mapDefault!7430)) b!184511))

(assert (= b!184519 b!184516))

(assert (= start!18674 b!184519))

(declare-fun m!211421 () Bool)

(assert (=> b!184519 m!211421))

(declare-fun m!211423 () Bool)

(assert (=> b!184519 m!211423))

(declare-fun m!211425 () Bool)

(assert (=> start!18674 m!211425))

(declare-fun m!211427 () Bool)

(assert (=> mapNonEmpty!7430 m!211427))

(declare-fun m!211429 () Bool)

(assert (=> b!184518 m!211429))

(declare-fun m!211431 () Bool)

(assert (=> b!184514 m!211431))

(assert (=> b!184514 m!211431))

(declare-fun m!211433 () Bool)

(assert (=> b!184514 m!211433))

(declare-fun m!211435 () Bool)

(assert (=> b!184517 m!211435))

(check-sat b_and!11113 (not start!18674) (not b!184518) tp_is_empty!4321 (not b_next!4549) (not mapNonEmpty!7430) (not b!184514) (not b!184519) (not b!184517))
(check-sat b_and!11113 (not b_next!4549))
(get-model)

(declare-fun d!54841 () Bool)

(assert (=> d!54841 (= (validMask!0 (mask!8857 thiss!1248)) (and (or (= (mask!8857 thiss!1248) #b00000000000000000000000000000111) (= (mask!8857 thiss!1248) #b00000000000000000000000000001111) (= (mask!8857 thiss!1248) #b00000000000000000000000000011111) (= (mask!8857 thiss!1248) #b00000000000000000000000000111111) (= (mask!8857 thiss!1248) #b00000000000000000000000001111111) (= (mask!8857 thiss!1248) #b00000000000000000000000011111111) (= (mask!8857 thiss!1248) #b00000000000000000000000111111111) (= (mask!8857 thiss!1248) #b00000000000000000000001111111111) (= (mask!8857 thiss!1248) #b00000000000000000000011111111111) (= (mask!8857 thiss!1248) #b00000000000000000000111111111111) (= (mask!8857 thiss!1248) #b00000000000000000001111111111111) (= (mask!8857 thiss!1248) #b00000000000000000011111111111111) (= (mask!8857 thiss!1248) #b00000000000000000111111111111111) (= (mask!8857 thiss!1248) #b00000000000000001111111111111111) (= (mask!8857 thiss!1248) #b00000000000000011111111111111111) (= (mask!8857 thiss!1248) #b00000000000000111111111111111111) (= (mask!8857 thiss!1248) #b00000000000001111111111111111111) (= (mask!8857 thiss!1248) #b00000000000011111111111111111111) (= (mask!8857 thiss!1248) #b00000000000111111111111111111111) (= (mask!8857 thiss!1248) #b00000000001111111111111111111111) (= (mask!8857 thiss!1248) #b00000000011111111111111111111111) (= (mask!8857 thiss!1248) #b00000000111111111111111111111111) (= (mask!8857 thiss!1248) #b00000001111111111111111111111111) (= (mask!8857 thiss!1248) #b00000011111111111111111111111111) (= (mask!8857 thiss!1248) #b00000111111111111111111111111111) (= (mask!8857 thiss!1248) #b00001111111111111111111111111111) (= (mask!8857 thiss!1248) #b00011111111111111111111111111111) (= (mask!8857 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8857 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184517 d!54841))

(declare-fun d!54843 () Bool)

(declare-fun res!87299 () Bool)

(declare-fun e!121488 () Bool)

(assert (=> d!54843 (=> (not res!87299) (not e!121488))))

(declare-fun simpleValid!179 (LongMapFixedSize!2542) Bool)

(assert (=> d!54843 (= res!87299 (simpleValid!179 thiss!1248))))

(assert (=> d!54843 (= (valid!1067 thiss!1248) e!121488)))

(declare-fun b!184580 () Bool)

(declare-fun res!87300 () Bool)

(assert (=> b!184580 (=> (not res!87300) (not e!121488))))

(declare-fun arrayCountValidKeys!0 (array!7823 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184580 (= res!87300 (= (arrayCountValidKeys!0 (_keys!5698 thiss!1248) #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))) (_size!1320 thiss!1248)))))

(declare-fun b!184581 () Bool)

(declare-fun res!87301 () Bool)

(assert (=> b!184581 (=> (not res!87301) (not e!121488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7823 (_ BitVec 32)) Bool)

(assert (=> b!184581 (= res!87301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)))))

(declare-fun b!184582 () Bool)

(declare-datatypes ((List!2341 0))(
  ( (Nil!2338) (Cons!2337 (h!2969 (_ BitVec 64)) (t!7210 List!2341)) )
))
(declare-fun arrayNoDuplicates!0 (array!7823 (_ BitVec 32) List!2341) Bool)

(assert (=> b!184582 (= e!121488 (arrayNoDuplicates!0 (_keys!5698 thiss!1248) #b00000000000000000000000000000000 Nil!2338))))

(assert (= (and d!54843 res!87299) b!184580))

(assert (= (and b!184580 res!87300) b!184581))

(assert (= (and b!184581 res!87301) b!184582))

(declare-fun m!211469 () Bool)

(assert (=> d!54843 m!211469))

(declare-fun m!211471 () Bool)

(assert (=> b!184580 m!211471))

(declare-fun m!211473 () Bool)

(assert (=> b!184581 m!211473))

(declare-fun m!211475 () Bool)

(assert (=> b!184582 m!211475))

(assert (=> start!18674 d!54843))

(declare-fun b!184595 () Bool)

(declare-fun e!121496 () SeekEntryResult!628)

(assert (=> b!184595 (= e!121496 Undefined!628)))

(declare-fun b!184596 () Bool)

(declare-fun e!121495 () SeekEntryResult!628)

(assert (=> b!184596 (= e!121496 e!121495)))

(declare-fun lt!91166 () (_ BitVec 64))

(declare-fun lt!91167 () SeekEntryResult!628)

(assert (=> b!184596 (= lt!91166 (select (arr!3694 (_keys!5698 thiss!1248)) (index!4684 lt!91167)))))

(declare-fun c!33114 () Bool)

(assert (=> b!184596 (= c!33114 (= lt!91166 key!828))))

(declare-fun b!184597 () Bool)

(declare-fun e!121497 () SeekEntryResult!628)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7823 (_ BitVec 32)) SeekEntryResult!628)

(assert (=> b!184597 (= e!121497 (seekKeyOrZeroReturnVacant!0 (x!20077 lt!91167) (index!4684 lt!91167) (index!4684 lt!91167) key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)))))

(declare-fun b!184598 () Bool)

(assert (=> b!184598 (= e!121497 (MissingZero!628 (index!4684 lt!91167)))))

(declare-fun d!54845 () Bool)

(declare-fun lt!91165 () SeekEntryResult!628)

(assert (=> d!54845 (and (or ((_ is Undefined!628) lt!91165) (not ((_ is Found!628) lt!91165)) (and (bvsge (index!4683 lt!91165) #b00000000000000000000000000000000) (bvslt (index!4683 lt!91165) (size!4010 (_keys!5698 thiss!1248))))) (or ((_ is Undefined!628) lt!91165) ((_ is Found!628) lt!91165) (not ((_ is MissingZero!628) lt!91165)) (and (bvsge (index!4682 lt!91165) #b00000000000000000000000000000000) (bvslt (index!4682 lt!91165) (size!4010 (_keys!5698 thiss!1248))))) (or ((_ is Undefined!628) lt!91165) ((_ is Found!628) lt!91165) ((_ is MissingZero!628) lt!91165) (not ((_ is MissingVacant!628) lt!91165)) (and (bvsge (index!4685 lt!91165) #b00000000000000000000000000000000) (bvslt (index!4685 lt!91165) (size!4010 (_keys!5698 thiss!1248))))) (or ((_ is Undefined!628) lt!91165) (ite ((_ is Found!628) lt!91165) (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4683 lt!91165)) key!828) (ite ((_ is MissingZero!628) lt!91165) (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4682 lt!91165)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!628) lt!91165) (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4685 lt!91165)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54845 (= lt!91165 e!121496)))

(declare-fun c!33115 () Bool)

(assert (=> d!54845 (= c!33115 (and ((_ is Intermediate!628) lt!91167) (undefined!1440 lt!91167)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7823 (_ BitVec 32)) SeekEntryResult!628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54845 (= lt!91167 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8857 thiss!1248)) key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)))))

(assert (=> d!54845 (validMask!0 (mask!8857 thiss!1248))))

(assert (=> d!54845 (= (seekEntryOrOpen!0 key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)) lt!91165)))

(declare-fun b!184599 () Bool)

(assert (=> b!184599 (= e!121495 (Found!628 (index!4684 lt!91167)))))

(declare-fun b!184600 () Bool)

(declare-fun c!33113 () Bool)

(assert (=> b!184600 (= c!33113 (= lt!91166 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184600 (= e!121495 e!121497)))

(assert (= (and d!54845 c!33115) b!184595))

(assert (= (and d!54845 (not c!33115)) b!184596))

(assert (= (and b!184596 c!33114) b!184599))

(assert (= (and b!184596 (not c!33114)) b!184600))

(assert (= (and b!184600 c!33113) b!184598))

(assert (= (and b!184600 (not c!33113)) b!184597))

(declare-fun m!211477 () Bool)

(assert (=> b!184596 m!211477))

(declare-fun m!211479 () Bool)

(assert (=> b!184597 m!211479))

(declare-fun m!211481 () Bool)

(assert (=> d!54845 m!211481))

(declare-fun m!211483 () Bool)

(assert (=> d!54845 m!211483))

(declare-fun m!211485 () Bool)

(assert (=> d!54845 m!211485))

(declare-fun m!211487 () Bool)

(assert (=> d!54845 m!211487))

(declare-fun m!211489 () Bool)

(assert (=> d!54845 m!211489))

(assert (=> d!54845 m!211487))

(assert (=> d!54845 m!211435))

(assert (=> b!184518 d!54845))

(declare-fun d!54847 () Bool)

(declare-fun e!121502 () Bool)

(assert (=> d!54847 e!121502))

(declare-fun res!87304 () Bool)

(assert (=> d!54847 (=> res!87304 e!121502)))

(declare-fun lt!91179 () Bool)

(assert (=> d!54847 (= res!87304 (not lt!91179))))

(declare-fun lt!91178 () Bool)

(assert (=> d!54847 (= lt!91179 lt!91178)))

(declare-datatypes ((Unit!5547 0))(
  ( (Unit!5548) )
))
(declare-fun lt!91177 () Unit!5547)

(declare-fun e!121503 () Unit!5547)

(assert (=> d!54847 (= lt!91177 e!121503)))

(declare-fun c!33118 () Bool)

(assert (=> d!54847 (= c!33118 lt!91178)))

(declare-fun containsKey!222 (List!2340 (_ BitVec 64)) Bool)

(assert (=> d!54847 (= lt!91178 (containsKey!222 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(assert (=> d!54847 (= (contains!1269 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) key!828) lt!91179)))

(declare-fun b!184607 () Bool)

(declare-fun lt!91176 () Unit!5547)

(assert (=> b!184607 (= e!121503 lt!91176)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!171 (List!2340 (_ BitVec 64)) Unit!5547)

(assert (=> b!184607 (= lt!91176 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-datatypes ((Option!224 0))(
  ( (Some!223 (v!4109 V!5409)) (None!222) )
))
(declare-fun isDefined!172 (Option!224) Bool)

(declare-fun getValueByKey!218 (List!2340 (_ BitVec 64)) Option!224)

(assert (=> b!184607 (isDefined!172 (getValueByKey!218 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-fun b!184608 () Bool)

(declare-fun Unit!5549 () Unit!5547)

(assert (=> b!184608 (= e!121503 Unit!5549)))

(declare-fun b!184609 () Bool)

(assert (=> b!184609 (= e!121502 (isDefined!172 (getValueByKey!218 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828)))))

(assert (= (and d!54847 c!33118) b!184607))

(assert (= (and d!54847 (not c!33118)) b!184608))

(assert (= (and d!54847 (not res!87304)) b!184609))

(declare-fun m!211491 () Bool)

(assert (=> d!54847 m!211491))

(declare-fun m!211493 () Bool)

(assert (=> b!184607 m!211493))

(declare-fun m!211495 () Bool)

(assert (=> b!184607 m!211495))

(assert (=> b!184607 m!211495))

(declare-fun m!211497 () Bool)

(assert (=> b!184607 m!211497))

(assert (=> b!184609 m!211495))

(assert (=> b!184609 m!211495))

(assert (=> b!184609 m!211497))

(assert (=> b!184514 d!54847))

(declare-fun bm!18616 () Bool)

(declare-fun call!18620 () ListLongMap!2311)

(declare-fun call!18625 () ListLongMap!2311)

(assert (=> bm!18616 (= call!18620 call!18625)))

(declare-fun b!184652 () Bool)

(declare-fun e!121532 () ListLongMap!2311)

(declare-fun call!18623 () ListLongMap!2311)

(assert (=> b!184652 (= e!121532 call!18623)))

(declare-fun b!184653 () Bool)

(declare-fun e!121539 () ListLongMap!2311)

(declare-fun e!121541 () ListLongMap!2311)

(assert (=> b!184653 (= e!121539 e!121541)))

(declare-fun c!33131 () Bool)

(assert (=> b!184653 (= c!33131 (and (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184654 () Bool)

(declare-fun e!121540 () Bool)

(declare-fun lt!91241 () ListLongMap!2311)

(declare-fun apply!163 (ListLongMap!2311 (_ BitVec 64)) V!5409)

(assert (=> b!184654 (= e!121540 (= (apply!163 lt!91241 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3609 thiss!1248)))))

(declare-fun c!33136 () Bool)

(declare-fun bm!18617 () Bool)

(declare-fun call!18624 () ListLongMap!2311)

(declare-fun +!280 (ListLongMap!2311 tuple2!3402) ListLongMap!2311)

(assert (=> bm!18617 (= call!18624 (+!280 (ite c!33136 call!18625 (ite c!33131 call!18620 call!18623)) (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun b!184655 () Bool)

(declare-fun res!87330 () Bool)

(declare-fun e!121535 () Bool)

(assert (=> b!184655 (=> (not res!87330) (not e!121535))))

(declare-fun e!121538 () Bool)

(assert (=> b!184655 (= res!87330 e!121538)))

(declare-fun res!87329 () Bool)

(assert (=> b!184655 (=> res!87329 e!121538)))

(declare-fun e!121530 () Bool)

(assert (=> b!184655 (= res!87329 (not e!121530))))

(declare-fun res!87323 () Bool)

(assert (=> b!184655 (=> (not res!87323) (not e!121530))))

(assert (=> b!184655 (= res!87323 (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun b!184656 () Bool)

(declare-fun e!121534 () Bool)

(assert (=> b!184656 (= e!121534 e!121540)))

(declare-fun res!87324 () Bool)

(declare-fun call!18621 () Bool)

(assert (=> b!184656 (= res!87324 call!18621)))

(assert (=> b!184656 (=> (not res!87324) (not e!121540))))

(declare-fun b!184657 () Bool)

(declare-fun e!121537 () Bool)

(assert (=> b!184657 (= e!121538 e!121537)))

(declare-fun res!87325 () Bool)

(assert (=> b!184657 (=> (not res!87325) (not e!121537))))

(assert (=> b!184657 (= res!87325 (contains!1269 lt!91241 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184657 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun b!184658 () Bool)

(assert (=> b!184658 (= e!121539 (+!280 call!18624 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))

(declare-fun d!54849 () Bool)

(assert (=> d!54849 e!121535))

(declare-fun res!87326 () Bool)

(assert (=> d!54849 (=> (not res!87326) (not e!121535))))

(assert (=> d!54849 (= res!87326 (or (bvsge #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))))

(declare-fun lt!91230 () ListLongMap!2311)

(assert (=> d!54849 (= lt!91241 lt!91230)))

(declare-fun lt!91244 () Unit!5547)

(declare-fun e!121531 () Unit!5547)

(assert (=> d!54849 (= lt!91244 e!121531)))

(declare-fun c!33133 () Bool)

(declare-fun e!121542 () Bool)

(assert (=> d!54849 (= c!33133 e!121542)))

(declare-fun res!87331 () Bool)

(assert (=> d!54849 (=> (not res!87331) (not e!121542))))

(assert (=> d!54849 (= res!87331 (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> d!54849 (= lt!91230 e!121539)))

(assert (=> d!54849 (= c!33136 (and (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54849 (validMask!0 (mask!8857 thiss!1248))))

(assert (=> d!54849 (= (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) lt!91241)))

(declare-fun b!184659 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184659 (= e!121530 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184660 () Bool)

(assert (=> b!184660 (= e!121534 (not call!18621))))

(declare-fun b!184661 () Bool)

(assert (=> b!184661 (= e!121542 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun bm!18618 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!184 (array!7823 array!7825 (_ BitVec 32) (_ BitVec 32) V!5409 V!5409 (_ BitVec 32) Int) ListLongMap!2311)

(assert (=> bm!18618 (= call!18625 (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun b!184662 () Bool)

(declare-fun call!18619 () ListLongMap!2311)

(assert (=> b!184662 (= e!121541 call!18619)))

(declare-fun b!184663 () Bool)

(declare-fun res!87328 () Bool)

(assert (=> b!184663 (=> (not res!87328) (not e!121535))))

(assert (=> b!184663 (= res!87328 e!121534)))

(declare-fun c!33132 () Bool)

(assert (=> b!184663 (= c!33132 (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18619 () Bool)

(declare-fun call!18622 () Bool)

(assert (=> bm!18619 (= call!18622 (contains!1269 lt!91241 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184664 () Bool)

(declare-fun get!2123 (ValueCell!1817 V!5409) V!5409)

(declare-fun dynLambda!497 (Int (_ BitVec 64)) V!5409)

(assert (=> b!184664 (= e!121537 (= (apply!163 lt!91241 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)) (get!2123 (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184664 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4011 (_values!3751 thiss!1248))))))

(assert (=> b!184664 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun bm!18620 () Bool)

(assert (=> bm!18620 (= call!18619 call!18624)))

(declare-fun bm!18621 () Bool)

(assert (=> bm!18621 (= call!18621 (contains!1269 lt!91241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184665 () Bool)

(assert (=> b!184665 (= e!121532 call!18619)))

(declare-fun b!184666 () Bool)

(declare-fun e!121533 () Bool)

(declare-fun e!121536 () Bool)

(assert (=> b!184666 (= e!121533 e!121536)))

(declare-fun res!87327 () Bool)

(assert (=> b!184666 (= res!87327 call!18622)))

(assert (=> b!184666 (=> (not res!87327) (not e!121536))))

(declare-fun b!184667 () Bool)

(assert (=> b!184667 (= e!121533 (not call!18622))))

(declare-fun b!184668 () Bool)

(declare-fun c!33135 () Bool)

(assert (=> b!184668 (= c!33135 (and (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!184668 (= e!121541 e!121532)))

(declare-fun b!184669 () Bool)

(assert (=> b!184669 (= e!121536 (= (apply!163 lt!91241 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3609 thiss!1248)))))

(declare-fun b!184670 () Bool)

(assert (=> b!184670 (= e!121535 e!121533)))

(declare-fun c!33134 () Bool)

(assert (=> b!184670 (= c!33134 (not (= (bvand (extraKeys!3505 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184671 () Bool)

(declare-fun lt!91234 () Unit!5547)

(assert (=> b!184671 (= e!121531 lt!91234)))

(declare-fun lt!91243 () ListLongMap!2311)

(assert (=> b!184671 (= lt!91243 (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91226 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91226 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91240 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91240 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91238 () Unit!5547)

(declare-fun addStillContains!139 (ListLongMap!2311 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5547)

(assert (=> b!184671 (= lt!91238 (addStillContains!139 lt!91243 lt!91226 (zeroValue!3609 thiss!1248) lt!91240))))

(assert (=> b!184671 (contains!1269 (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))) lt!91240)))

(declare-fun lt!91233 () Unit!5547)

(assert (=> b!184671 (= lt!91233 lt!91238)))

(declare-fun lt!91228 () ListLongMap!2311)

(assert (=> b!184671 (= lt!91228 (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91237 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91237 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91225 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91225 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91245 () Unit!5547)

(declare-fun addApplyDifferent!139 (ListLongMap!2311 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5547)

(assert (=> b!184671 (= lt!91245 (addApplyDifferent!139 lt!91228 lt!91237 (minValue!3609 thiss!1248) lt!91225))))

(assert (=> b!184671 (= (apply!163 (+!280 lt!91228 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))) lt!91225) (apply!163 lt!91228 lt!91225))))

(declare-fun lt!91224 () Unit!5547)

(assert (=> b!184671 (= lt!91224 lt!91245)))

(declare-fun lt!91232 () ListLongMap!2311)

(assert (=> b!184671 (= lt!91232 (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91236 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91236 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91227 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91227 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91229 () Unit!5547)

(assert (=> b!184671 (= lt!91229 (addApplyDifferent!139 lt!91232 lt!91236 (zeroValue!3609 thiss!1248) lt!91227))))

(assert (=> b!184671 (= (apply!163 (+!280 lt!91232 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))) lt!91227) (apply!163 lt!91232 lt!91227))))

(declare-fun lt!91242 () Unit!5547)

(assert (=> b!184671 (= lt!91242 lt!91229)))

(declare-fun lt!91239 () ListLongMap!2311)

(assert (=> b!184671 (= lt!91239 (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))

(declare-fun lt!91231 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91231 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91235 () (_ BitVec 64))

(assert (=> b!184671 (= lt!91235 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184671 (= lt!91234 (addApplyDifferent!139 lt!91239 lt!91231 (minValue!3609 thiss!1248) lt!91235))))

(assert (=> b!184671 (= (apply!163 (+!280 lt!91239 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))) lt!91235) (apply!163 lt!91239 lt!91235))))

(declare-fun bm!18622 () Bool)

(assert (=> bm!18622 (= call!18623 call!18620)))

(declare-fun b!184672 () Bool)

(declare-fun Unit!5550 () Unit!5547)

(assert (=> b!184672 (= e!121531 Unit!5550)))

(assert (= (and d!54849 c!33136) b!184658))

(assert (= (and d!54849 (not c!33136)) b!184653))

(assert (= (and b!184653 c!33131) b!184662))

(assert (= (and b!184653 (not c!33131)) b!184668))

(assert (= (and b!184668 c!33135) b!184665))

(assert (= (and b!184668 (not c!33135)) b!184652))

(assert (= (or b!184665 b!184652) bm!18622))

(assert (= (or b!184662 bm!18622) bm!18616))

(assert (= (or b!184662 b!184665) bm!18620))

(assert (= (or b!184658 bm!18616) bm!18618))

(assert (= (or b!184658 bm!18620) bm!18617))

(assert (= (and d!54849 res!87331) b!184661))

(assert (= (and d!54849 c!33133) b!184671))

(assert (= (and d!54849 (not c!33133)) b!184672))

(assert (= (and d!54849 res!87326) b!184655))

(assert (= (and b!184655 res!87323) b!184659))

(assert (= (and b!184655 (not res!87329)) b!184657))

(assert (= (and b!184657 res!87325) b!184664))

(assert (= (and b!184655 res!87330) b!184663))

(assert (= (and b!184663 c!33132) b!184656))

(assert (= (and b!184663 (not c!33132)) b!184660))

(assert (= (and b!184656 res!87324) b!184654))

(assert (= (or b!184656 b!184660) bm!18621))

(assert (= (and b!184663 res!87328) b!184670))

(assert (= (and b!184670 c!33134) b!184666))

(assert (= (and b!184670 (not c!33134)) b!184667))

(assert (= (and b!184666 res!87327) b!184669))

(assert (= (or b!184666 b!184667) bm!18619))

(declare-fun b_lambda!7213 () Bool)

(assert (=> (not b_lambda!7213) (not b!184664)))

(declare-fun t!7209 () Bool)

(declare-fun tb!2829 () Bool)

(assert (=> (and b!184519 (= (defaultEntry!3768 thiss!1248) (defaultEntry!3768 thiss!1248)) t!7209) tb!2829))

(declare-fun result!4781 () Bool)

(assert (=> tb!2829 (= result!4781 tp_is_empty!4321)))

(assert (=> b!184664 t!7209))

(declare-fun b_and!11119 () Bool)

(assert (= b_and!11113 (and (=> t!7209 result!4781) b_and!11119)))

(declare-fun m!211499 () Bool)

(assert (=> bm!18621 m!211499))

(declare-fun m!211501 () Bool)

(assert (=> b!184669 m!211501))

(assert (=> d!54849 m!211435))

(declare-fun m!211503 () Bool)

(assert (=> b!184661 m!211503))

(assert (=> b!184661 m!211503))

(declare-fun m!211505 () Bool)

(assert (=> b!184661 m!211505))

(declare-fun m!211507 () Bool)

(assert (=> b!184654 m!211507))

(declare-fun m!211509 () Bool)

(assert (=> bm!18618 m!211509))

(declare-fun m!211511 () Bool)

(assert (=> b!184658 m!211511))

(declare-fun m!211513 () Bool)

(assert (=> bm!18617 m!211513))

(assert (=> b!184664 m!211503))

(declare-fun m!211515 () Bool)

(assert (=> b!184664 m!211515))

(assert (=> b!184664 m!211503))

(declare-fun m!211517 () Bool)

(assert (=> b!184664 m!211517))

(declare-fun m!211519 () Bool)

(assert (=> b!184664 m!211519))

(declare-fun m!211521 () Bool)

(assert (=> b!184664 m!211521))

(assert (=> b!184664 m!211517))

(assert (=> b!184664 m!211519))

(assert (=> b!184659 m!211503))

(assert (=> b!184659 m!211503))

(assert (=> b!184659 m!211505))

(declare-fun m!211523 () Bool)

(assert (=> b!184671 m!211523))

(declare-fun m!211525 () Bool)

(assert (=> b!184671 m!211525))

(declare-fun m!211527 () Bool)

(assert (=> b!184671 m!211527))

(declare-fun m!211529 () Bool)

(assert (=> b!184671 m!211529))

(declare-fun m!211531 () Bool)

(assert (=> b!184671 m!211531))

(declare-fun m!211533 () Bool)

(assert (=> b!184671 m!211533))

(declare-fun m!211535 () Bool)

(assert (=> b!184671 m!211535))

(declare-fun m!211537 () Bool)

(assert (=> b!184671 m!211537))

(declare-fun m!211539 () Bool)

(assert (=> b!184671 m!211539))

(assert (=> b!184671 m!211509))

(assert (=> b!184671 m!211523))

(declare-fun m!211541 () Bool)

(assert (=> b!184671 m!211541))

(declare-fun m!211543 () Bool)

(assert (=> b!184671 m!211543))

(declare-fun m!211545 () Bool)

(assert (=> b!184671 m!211545))

(assert (=> b!184671 m!211527))

(assert (=> b!184671 m!211503))

(declare-fun m!211547 () Bool)

(assert (=> b!184671 m!211547))

(declare-fun m!211549 () Bool)

(assert (=> b!184671 m!211549))

(assert (=> b!184671 m!211537))

(assert (=> b!184671 m!211525))

(declare-fun m!211551 () Bool)

(assert (=> b!184671 m!211551))

(assert (=> b!184657 m!211503))

(assert (=> b!184657 m!211503))

(declare-fun m!211553 () Bool)

(assert (=> b!184657 m!211553))

(declare-fun m!211555 () Bool)

(assert (=> bm!18619 m!211555))

(assert (=> b!184514 d!54849))

(declare-fun d!54851 () Bool)

(assert (=> d!54851 (= (array_inv!2389 (_keys!5698 thiss!1248)) (bvsge (size!4010 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184519 d!54851))

(declare-fun d!54853 () Bool)

(assert (=> d!54853 (= (array_inv!2390 (_values!3751 thiss!1248)) (bvsge (size!4011 (_values!3751 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184519 d!54853))

(declare-fun b!184682 () Bool)

(declare-fun e!121547 () Bool)

(assert (=> b!184682 (= e!121547 tp_is_empty!4321)))

(declare-fun b!184681 () Bool)

(declare-fun e!121548 () Bool)

(assert (=> b!184681 (= e!121548 tp_is_empty!4321)))

(declare-fun mapNonEmpty!7439 () Bool)

(declare-fun mapRes!7439 () Bool)

(declare-fun tp!16448 () Bool)

(assert (=> mapNonEmpty!7439 (= mapRes!7439 (and tp!16448 e!121548))))

(declare-fun mapValue!7439 () ValueCell!1817)

(declare-fun mapKey!7439 () (_ BitVec 32))

(declare-fun mapRest!7439 () (Array (_ BitVec 32) ValueCell!1817))

(assert (=> mapNonEmpty!7439 (= mapRest!7430 (store mapRest!7439 mapKey!7439 mapValue!7439))))

(declare-fun mapIsEmpty!7439 () Bool)

(assert (=> mapIsEmpty!7439 mapRes!7439))

(declare-fun condMapEmpty!7439 () Bool)

(declare-fun mapDefault!7439 () ValueCell!1817)

(assert (=> mapNonEmpty!7430 (= condMapEmpty!7439 (= mapRest!7430 ((as const (Array (_ BitVec 32) ValueCell!1817)) mapDefault!7439)))))

(assert (=> mapNonEmpty!7430 (= tp!16433 (and e!121547 mapRes!7439))))

(assert (= (and mapNonEmpty!7430 condMapEmpty!7439) mapIsEmpty!7439))

(assert (= (and mapNonEmpty!7430 (not condMapEmpty!7439)) mapNonEmpty!7439))

(assert (= (and mapNonEmpty!7439 ((_ is ValueCellFull!1817) mapValue!7439)) b!184681))

(assert (= (and mapNonEmpty!7430 ((_ is ValueCellFull!1817) mapDefault!7439)) b!184682))

(declare-fun m!211557 () Bool)

(assert (=> mapNonEmpty!7439 m!211557))

(declare-fun b_lambda!7215 () Bool)

(assert (= b_lambda!7213 (or (and b!184519 b_free!4549) b_lambda!7215)))

(check-sat (not b!184580) (not b!184658) (not b!184664) (not mapNonEmpty!7439) (not b!184671) (not d!54843) (not b!184581) (not b!184657) (not b!184582) (not b!184659) (not b!184669) (not bm!18621) (not d!54845) (not b!184661) (not b_lambda!7215) (not b!184609) (not d!54847) tp_is_empty!4321 (not bm!18618) (not b!184597) b_and!11119 (not bm!18617) (not b_next!4549) (not d!54849) (not bm!18619) (not b!184654) (not b!184607))
(check-sat b_and!11119 (not b_next!4549))
(get-model)

(declare-fun bm!18625 () Bool)

(declare-fun call!18628 () Bool)

(declare-fun c!33139 () Bool)

(assert (=> bm!18625 (= call!18628 (arrayNoDuplicates!0 (_keys!5698 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33139 (Cons!2337 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000) Nil!2338) Nil!2338)))))

(declare-fun b!184693 () Bool)

(declare-fun e!121559 () Bool)

(declare-fun contains!1270 (List!2341 (_ BitVec 64)) Bool)

(assert (=> b!184693 (= e!121559 (contains!1270 Nil!2338 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184694 () Bool)

(declare-fun e!121558 () Bool)

(assert (=> b!184694 (= e!121558 call!18628)))

(declare-fun d!54855 () Bool)

(declare-fun res!87338 () Bool)

(declare-fun e!121557 () Bool)

(assert (=> d!54855 (=> res!87338 e!121557)))

(assert (=> d!54855 (= res!87338 (bvsge #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> d!54855 (= (arrayNoDuplicates!0 (_keys!5698 thiss!1248) #b00000000000000000000000000000000 Nil!2338) e!121557)))

(declare-fun b!184695 () Bool)

(declare-fun e!121560 () Bool)

(assert (=> b!184695 (= e!121557 e!121560)))

(declare-fun res!87340 () Bool)

(assert (=> b!184695 (=> (not res!87340) (not e!121560))))

(assert (=> b!184695 (= res!87340 (not e!121559))))

(declare-fun res!87339 () Bool)

(assert (=> b!184695 (=> (not res!87339) (not e!121559))))

(assert (=> b!184695 (= res!87339 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184696 () Bool)

(assert (=> b!184696 (= e!121560 e!121558)))

(assert (=> b!184696 (= c!33139 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184697 () Bool)

(assert (=> b!184697 (= e!121558 call!18628)))

(assert (= (and d!54855 (not res!87338)) b!184695))

(assert (= (and b!184695 res!87339) b!184693))

(assert (= (and b!184695 res!87340) b!184696))

(assert (= (and b!184696 c!33139) b!184694))

(assert (= (and b!184696 (not c!33139)) b!184697))

(assert (= (or b!184694 b!184697) bm!18625))

(assert (=> bm!18625 m!211503))

(declare-fun m!211559 () Bool)

(assert (=> bm!18625 m!211559))

(assert (=> b!184693 m!211503))

(assert (=> b!184693 m!211503))

(declare-fun m!211561 () Bool)

(assert (=> b!184693 m!211561))

(assert (=> b!184695 m!211503))

(assert (=> b!184695 m!211503))

(assert (=> b!184695 m!211505))

(assert (=> b!184696 m!211503))

(assert (=> b!184696 m!211503))

(assert (=> b!184696 m!211505))

(assert (=> b!184582 d!54855))

(declare-fun d!54857 () Bool)

(assert (=> d!54857 (= (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184661 d!54857))

(assert (=> d!54849 d!54841))

(declare-fun b!184706 () Bool)

(declare-fun e!121565 () (_ BitVec 32))

(declare-fun e!121566 () (_ BitVec 32))

(assert (=> b!184706 (= e!121565 e!121566)))

(declare-fun c!33144 () Bool)

(assert (=> b!184706 (= c!33144 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184707 () Bool)

(declare-fun call!18631 () (_ BitVec 32))

(assert (=> b!184707 (= e!121566 call!18631)))

(declare-fun b!184708 () Bool)

(assert (=> b!184708 (= e!121566 (bvadd #b00000000000000000000000000000001 call!18631))))

(declare-fun bm!18628 () Bool)

(assert (=> bm!18628 (= call!18631 (arrayCountValidKeys!0 (_keys!5698 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun b!184709 () Bool)

(assert (=> b!184709 (= e!121565 #b00000000000000000000000000000000)))

(declare-fun d!54859 () Bool)

(declare-fun lt!91248 () (_ BitVec 32))

(assert (=> d!54859 (and (bvsge lt!91248 #b00000000000000000000000000000000) (bvsle lt!91248 (bvsub (size!4010 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54859 (= lt!91248 e!121565)))

(declare-fun c!33145 () Bool)

(assert (=> d!54859 (= c!33145 (bvsge #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> d!54859 (and (bvsle #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4010 (_keys!5698 thiss!1248)) (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> d!54859 (= (arrayCountValidKeys!0 (_keys!5698 thiss!1248) #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))) lt!91248)))

(assert (= (and d!54859 c!33145) b!184709))

(assert (= (and d!54859 (not c!33145)) b!184706))

(assert (= (and b!184706 c!33144) b!184708))

(assert (= (and b!184706 (not c!33144)) b!184707))

(assert (= (or b!184708 b!184707) bm!18628))

(assert (=> b!184706 m!211503))

(assert (=> b!184706 m!211503))

(assert (=> b!184706 m!211505))

(declare-fun m!211563 () Bool)

(assert (=> bm!18628 m!211563))

(assert (=> b!184580 d!54859))

(declare-fun d!54861 () Bool)

(declare-fun e!121567 () Bool)

(assert (=> d!54861 e!121567))

(declare-fun res!87341 () Bool)

(assert (=> d!54861 (=> res!87341 e!121567)))

(declare-fun lt!91252 () Bool)

(assert (=> d!54861 (= res!87341 (not lt!91252))))

(declare-fun lt!91251 () Bool)

(assert (=> d!54861 (= lt!91252 lt!91251)))

(declare-fun lt!91250 () Unit!5547)

(declare-fun e!121568 () Unit!5547)

(assert (=> d!54861 (= lt!91250 e!121568)))

(declare-fun c!33146 () Bool)

(assert (=> d!54861 (= c!33146 lt!91251)))

(assert (=> d!54861 (= lt!91251 (containsKey!222 (toList!1171 lt!91241) (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!54861 (= (contains!1269 lt!91241 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)) lt!91252)))

(declare-fun b!184710 () Bool)

(declare-fun lt!91249 () Unit!5547)

(assert (=> b!184710 (= e!121568 lt!91249)))

(assert (=> b!184710 (= lt!91249 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1171 lt!91241) (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184710 (isDefined!172 (getValueByKey!218 (toList!1171 lt!91241) (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184711 () Bool)

(declare-fun Unit!5551 () Unit!5547)

(assert (=> b!184711 (= e!121568 Unit!5551)))

(declare-fun b!184712 () Bool)

(assert (=> b!184712 (= e!121567 (isDefined!172 (getValueByKey!218 (toList!1171 lt!91241) (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!54861 c!33146) b!184710))

(assert (= (and d!54861 (not c!33146)) b!184711))

(assert (= (and d!54861 (not res!87341)) b!184712))

(assert (=> d!54861 m!211503))

(declare-fun m!211565 () Bool)

(assert (=> d!54861 m!211565))

(assert (=> b!184710 m!211503))

(declare-fun m!211567 () Bool)

(assert (=> b!184710 m!211567))

(assert (=> b!184710 m!211503))

(declare-fun m!211569 () Bool)

(assert (=> b!184710 m!211569))

(assert (=> b!184710 m!211569))

(declare-fun m!211571 () Bool)

(assert (=> b!184710 m!211571))

(assert (=> b!184712 m!211503))

(assert (=> b!184712 m!211569))

(assert (=> b!184712 m!211569))

(assert (=> b!184712 m!211571))

(assert (=> b!184657 d!54861))

(declare-fun b!184724 () Bool)

(declare-fun e!121571 () Bool)

(assert (=> b!184724 (= e!121571 (and (bvsge (extraKeys!3505 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3505 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1320 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!184722 () Bool)

(declare-fun res!87350 () Bool)

(assert (=> b!184722 (=> (not res!87350) (not e!121571))))

(declare-fun size!4016 (LongMapFixedSize!2542) (_ BitVec 32))

(assert (=> b!184722 (= res!87350 (bvsge (size!4016 thiss!1248) (_size!1320 thiss!1248)))))

(declare-fun b!184723 () Bool)

(declare-fun res!87353 () Bool)

(assert (=> b!184723 (=> (not res!87353) (not e!121571))))

(assert (=> b!184723 (= res!87353 (= (size!4016 thiss!1248) (bvadd (_size!1320 thiss!1248) (bvsdiv (bvadd (extraKeys!3505 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!54863 () Bool)

(declare-fun res!87352 () Bool)

(assert (=> d!54863 (=> (not res!87352) (not e!121571))))

(assert (=> d!54863 (= res!87352 (validMask!0 (mask!8857 thiss!1248)))))

(assert (=> d!54863 (= (simpleValid!179 thiss!1248) e!121571)))

(declare-fun b!184721 () Bool)

(declare-fun res!87351 () Bool)

(assert (=> b!184721 (=> (not res!87351) (not e!121571))))

(assert (=> b!184721 (= res!87351 (and (= (size!4011 (_values!3751 thiss!1248)) (bvadd (mask!8857 thiss!1248) #b00000000000000000000000000000001)) (= (size!4010 (_keys!5698 thiss!1248)) (size!4011 (_values!3751 thiss!1248))) (bvsge (_size!1320 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1320 thiss!1248) (bvadd (mask!8857 thiss!1248) #b00000000000000000000000000000001))))))

(assert (= (and d!54863 res!87352) b!184721))

(assert (= (and b!184721 res!87351) b!184722))

(assert (= (and b!184722 res!87350) b!184723))

(assert (= (and b!184723 res!87353) b!184724))

(declare-fun m!211573 () Bool)

(assert (=> b!184722 m!211573))

(assert (=> b!184723 m!211573))

(assert (=> d!54863 m!211435))

(assert (=> d!54843 d!54863))

(declare-fun d!54865 () Bool)

(declare-fun e!121572 () Bool)

(assert (=> d!54865 e!121572))

(declare-fun res!87354 () Bool)

(assert (=> d!54865 (=> res!87354 e!121572)))

(declare-fun lt!91256 () Bool)

(assert (=> d!54865 (= res!87354 (not lt!91256))))

(declare-fun lt!91255 () Bool)

(assert (=> d!54865 (= lt!91256 lt!91255)))

(declare-fun lt!91254 () Unit!5547)

(declare-fun e!121573 () Unit!5547)

(assert (=> d!54865 (= lt!91254 e!121573)))

(declare-fun c!33147 () Bool)

(assert (=> d!54865 (= c!33147 lt!91255)))

(assert (=> d!54865 (= lt!91255 (containsKey!222 (toList!1171 lt!91241) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54865 (= (contains!1269 lt!91241 #b0000000000000000000000000000000000000000000000000000000000000000) lt!91256)))

(declare-fun b!184725 () Bool)

(declare-fun lt!91253 () Unit!5547)

(assert (=> b!184725 (= e!121573 lt!91253)))

(assert (=> b!184725 (= lt!91253 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1171 lt!91241) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184725 (isDefined!172 (getValueByKey!218 (toList!1171 lt!91241) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184726 () Bool)

(declare-fun Unit!5552 () Unit!5547)

(assert (=> b!184726 (= e!121573 Unit!5552)))

(declare-fun b!184727 () Bool)

(assert (=> b!184727 (= e!121572 (isDefined!172 (getValueByKey!218 (toList!1171 lt!91241) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54865 c!33147) b!184725))

(assert (= (and d!54865 (not c!33147)) b!184726))

(assert (= (and d!54865 (not res!87354)) b!184727))

(declare-fun m!211575 () Bool)

(assert (=> d!54865 m!211575))

(declare-fun m!211577 () Bool)

(assert (=> b!184725 m!211577))

(declare-fun m!211579 () Bool)

(assert (=> b!184725 m!211579))

(assert (=> b!184725 m!211579))

(declare-fun m!211581 () Bool)

(assert (=> b!184725 m!211581))

(assert (=> b!184727 m!211579))

(assert (=> b!184727 m!211579))

(assert (=> b!184727 m!211581))

(assert (=> bm!18621 d!54865))

(declare-fun b!184746 () Bool)

(declare-fun e!121588 () SeekEntryResult!628)

(assert (=> b!184746 (= e!121588 (Intermediate!628 false (toIndex!0 key!828 (mask!8857 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!54867 () Bool)

(declare-fun e!121587 () Bool)

(assert (=> d!54867 e!121587))

(declare-fun c!33156 () Bool)

(declare-fun lt!91261 () SeekEntryResult!628)

(assert (=> d!54867 (= c!33156 (and ((_ is Intermediate!628) lt!91261) (undefined!1440 lt!91261)))))

(declare-fun e!121585 () SeekEntryResult!628)

(assert (=> d!54867 (= lt!91261 e!121585)))

(declare-fun c!33155 () Bool)

(assert (=> d!54867 (= c!33155 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!91262 () (_ BitVec 64))

(assert (=> d!54867 (= lt!91262 (select (arr!3694 (_keys!5698 thiss!1248)) (toIndex!0 key!828 (mask!8857 thiss!1248))))))

(assert (=> d!54867 (validMask!0 (mask!8857 thiss!1248))))

(assert (=> d!54867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8857 thiss!1248)) key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)) lt!91261)))

(declare-fun b!184747 () Bool)

(declare-fun e!121586 () Bool)

(assert (=> b!184747 (= e!121587 e!121586)))

(declare-fun res!87362 () Bool)

(assert (=> b!184747 (= res!87362 (and ((_ is Intermediate!628) lt!91261) (not (undefined!1440 lt!91261)) (bvslt (x!20077 lt!91261) #b01111111111111111111111111111110) (bvsge (x!20077 lt!91261) #b00000000000000000000000000000000) (bvsge (x!20077 lt!91261) #b00000000000000000000000000000000)))))

(assert (=> b!184747 (=> (not res!87362) (not e!121586))))

(declare-fun b!184748 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184748 (= e!121588 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8857 thiss!1248)) #b00000000000000000000000000000000 (mask!8857 thiss!1248)) key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)))))

(declare-fun b!184749 () Bool)

(assert (=> b!184749 (and (bvsge (index!4684 lt!91261) #b00000000000000000000000000000000) (bvslt (index!4684 lt!91261) (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun res!87361 () Bool)

(assert (=> b!184749 (= res!87361 (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4684 lt!91261)) key!828))))

(declare-fun e!121584 () Bool)

(assert (=> b!184749 (=> res!87361 e!121584)))

(assert (=> b!184749 (= e!121586 e!121584)))

(declare-fun b!184750 () Bool)

(assert (=> b!184750 (= e!121587 (bvsge (x!20077 lt!91261) #b01111111111111111111111111111110))))

(declare-fun b!184751 () Bool)

(assert (=> b!184751 (= e!121585 (Intermediate!628 true (toIndex!0 key!828 (mask!8857 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184752 () Bool)

(assert (=> b!184752 (and (bvsge (index!4684 lt!91261) #b00000000000000000000000000000000) (bvslt (index!4684 lt!91261) (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun res!87363 () Bool)

(assert (=> b!184752 (= res!87363 (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4684 lt!91261)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184752 (=> res!87363 e!121584)))

(declare-fun b!184753 () Bool)

(assert (=> b!184753 (and (bvsge (index!4684 lt!91261) #b00000000000000000000000000000000) (bvslt (index!4684 lt!91261) (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> b!184753 (= e!121584 (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4684 lt!91261)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184754 () Bool)

(assert (=> b!184754 (= e!121585 e!121588)))

(declare-fun c!33154 () Bool)

(assert (=> b!184754 (= c!33154 (or (= lt!91262 key!828) (= (bvadd lt!91262 lt!91262) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54867 c!33155) b!184751))

(assert (= (and d!54867 (not c!33155)) b!184754))

(assert (= (and b!184754 c!33154) b!184746))

(assert (= (and b!184754 (not c!33154)) b!184748))

(assert (= (and d!54867 c!33156) b!184750))

(assert (= (and d!54867 (not c!33156)) b!184747))

(assert (= (and b!184747 res!87362) b!184749))

(assert (= (and b!184749 (not res!87361)) b!184752))

(assert (= (and b!184752 (not res!87363)) b!184753))

(assert (=> b!184748 m!211487))

(declare-fun m!211583 () Bool)

(assert (=> b!184748 m!211583))

(assert (=> b!184748 m!211583))

(declare-fun m!211585 () Bool)

(assert (=> b!184748 m!211585))

(assert (=> d!54867 m!211487))

(declare-fun m!211587 () Bool)

(assert (=> d!54867 m!211587))

(assert (=> d!54867 m!211435))

(declare-fun m!211589 () Bool)

(assert (=> b!184753 m!211589))

(assert (=> b!184749 m!211589))

(assert (=> b!184752 m!211589))

(assert (=> d!54845 d!54867))

(declare-fun d!54869 () Bool)

(declare-fun lt!91268 () (_ BitVec 32))

(declare-fun lt!91267 () (_ BitVec 32))

(assert (=> d!54869 (= lt!91268 (bvmul (bvxor lt!91267 (bvlshr lt!91267 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!54869 (= lt!91267 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!54869 (and (bvsge (mask!8857 thiss!1248) #b00000000000000000000000000000000) (let ((res!87364 (let ((h!2970 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20094 (bvmul (bvxor h!2970 (bvlshr h!2970 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20094 (bvlshr x!20094 #b00000000000000000000000000001101)) (mask!8857 thiss!1248)))))) (and (bvslt res!87364 (bvadd (mask!8857 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87364 #b00000000000000000000000000000000))))))

(assert (=> d!54869 (= (toIndex!0 key!828 (mask!8857 thiss!1248)) (bvand (bvxor lt!91268 (bvlshr lt!91268 #b00000000000000000000000000001101)) (mask!8857 thiss!1248)))))

(assert (=> d!54845 d!54869))

(assert (=> d!54845 d!54841))

(declare-fun d!54871 () Bool)

(declare-fun e!121591 () Bool)

(assert (=> d!54871 e!121591))

(declare-fun res!87370 () Bool)

(assert (=> d!54871 (=> (not res!87370) (not e!121591))))

(declare-fun lt!91278 () ListLongMap!2311)

(assert (=> d!54871 (= res!87370 (contains!1269 lt!91278 (_1!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun lt!91277 () List!2340)

(assert (=> d!54871 (= lt!91278 (ListLongMap!2312 lt!91277))))

(declare-fun lt!91279 () Unit!5547)

(declare-fun lt!91280 () Unit!5547)

(assert (=> d!54871 (= lt!91279 lt!91280)))

(assert (=> d!54871 (= (getValueByKey!218 lt!91277 (_1!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!117 (List!2340 (_ BitVec 64) V!5409) Unit!5547)

(assert (=> d!54871 (= lt!91280 (lemmaContainsTupThenGetReturnValue!117 lt!91277 (_1!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(declare-fun insertStrictlySorted!120 (List!2340 (_ BitVec 64) V!5409) List!2340)

(assert (=> d!54871 (= lt!91277 (insertStrictlySorted!120 (toList!1171 call!18624) (_1!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(assert (=> d!54871 (= (+!280 call!18624 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))) lt!91278)))

(declare-fun b!184759 () Bool)

(declare-fun res!87369 () Bool)

(assert (=> b!184759 (=> (not res!87369) (not e!121591))))

(assert (=> b!184759 (= res!87369 (= (getValueByKey!218 (toList!1171 lt!91278) (_1!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(declare-fun b!184760 () Bool)

(declare-fun contains!1271 (List!2340 tuple2!3402) Bool)

(assert (=> b!184760 (= e!121591 (contains!1271 (toList!1171 lt!91278) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))

(assert (= (and d!54871 res!87370) b!184759))

(assert (= (and b!184759 res!87369) b!184760))

(declare-fun m!211591 () Bool)

(assert (=> d!54871 m!211591))

(declare-fun m!211593 () Bool)

(assert (=> d!54871 m!211593))

(declare-fun m!211595 () Bool)

(assert (=> d!54871 m!211595))

(declare-fun m!211597 () Bool)

(assert (=> d!54871 m!211597))

(declare-fun m!211599 () Bool)

(assert (=> b!184759 m!211599))

(declare-fun m!211601 () Bool)

(assert (=> b!184760 m!211601))

(assert (=> b!184658 d!54871))

(declare-fun d!54873 () Bool)

(declare-fun isEmpty!473 (Option!224) Bool)

(assert (=> d!54873 (= (isDefined!172 (getValueByKey!218 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828)) (not (isEmpty!473 (getValueByKey!218 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))))

(declare-fun bs!7474 () Bool)

(assert (= bs!7474 d!54873))

(assert (=> bs!7474 m!211495))

(declare-fun m!211603 () Bool)

(assert (=> bs!7474 m!211603))

(assert (=> b!184609 d!54873))

(declare-fun b!184770 () Bool)

(declare-fun e!121596 () Option!224)

(declare-fun e!121597 () Option!224)

(assert (=> b!184770 (= e!121596 e!121597)))

(declare-fun c!33162 () Bool)

(assert (=> b!184770 (= c!33162 (and ((_ is Cons!2336) (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (not (= (_1!1712 (h!2968 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828))))))

(declare-fun b!184771 () Bool)

(assert (=> b!184771 (= e!121597 (getValueByKey!218 (t!7207 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) key!828))))

(declare-fun b!184772 () Bool)

(assert (=> b!184772 (= e!121597 None!222)))

(declare-fun d!54875 () Bool)

(declare-fun c!33161 () Bool)

(assert (=> d!54875 (= c!33161 (and ((_ is Cons!2336) (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (= (_1!1712 (h!2968 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)))))

(assert (=> d!54875 (= (getValueByKey!218 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828) e!121596)))

(declare-fun b!184769 () Bool)

(assert (=> b!184769 (= e!121596 (Some!223 (_2!1712 (h!2968 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))))))

(assert (= (and d!54875 c!33161) b!184769))

(assert (= (and d!54875 (not c!33161)) b!184770))

(assert (= (and b!184770 c!33162) b!184771))

(assert (= (and b!184770 (not c!33162)) b!184772))

(declare-fun m!211605 () Bool)

(assert (=> b!184771 m!211605))

(assert (=> b!184609 d!54875))

(assert (=> b!184659 d!54857))

(declare-fun d!54877 () Bool)

(declare-fun res!87376 () Bool)

(declare-fun e!121604 () Bool)

(assert (=> d!54877 (=> res!87376 e!121604)))

(assert (=> d!54877 (= res!87376 (bvsge #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> d!54877 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)) e!121604)))

(declare-fun b!184781 () Bool)

(declare-fun e!121606 () Bool)

(declare-fun call!18634 () Bool)

(assert (=> b!184781 (= e!121606 call!18634)))

(declare-fun bm!18631 () Bool)

(assert (=> bm!18631 (= call!18634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5698 thiss!1248) (mask!8857 thiss!1248)))))

(declare-fun b!184782 () Bool)

(assert (=> b!184782 (= e!121604 e!121606)))

(declare-fun c!33165 () Bool)

(assert (=> b!184782 (= c!33165 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184783 () Bool)

(declare-fun e!121605 () Bool)

(assert (=> b!184783 (= e!121605 call!18634)))

(declare-fun b!184784 () Bool)

(assert (=> b!184784 (= e!121606 e!121605)))

(declare-fun lt!91287 () (_ BitVec 64))

(assert (=> b!184784 (= lt!91287 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91289 () Unit!5547)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7823 (_ BitVec 64) (_ BitVec 32)) Unit!5547)

(assert (=> b!184784 (= lt!91289 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5698 thiss!1248) lt!91287 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!184784 (arrayContainsKey!0 (_keys!5698 thiss!1248) lt!91287 #b00000000000000000000000000000000)))

(declare-fun lt!91288 () Unit!5547)

(assert (=> b!184784 (= lt!91288 lt!91289)))

(declare-fun res!87375 () Bool)

(assert (=> b!184784 (= res!87375 (= (seekEntryOrOpen!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000) (_keys!5698 thiss!1248) (mask!8857 thiss!1248)) (Found!628 #b00000000000000000000000000000000)))))

(assert (=> b!184784 (=> (not res!87375) (not e!121605))))

(assert (= (and d!54877 (not res!87376)) b!184782))

(assert (= (and b!184782 c!33165) b!184784))

(assert (= (and b!184782 (not c!33165)) b!184781))

(assert (= (and b!184784 res!87375) b!184783))

(assert (= (or b!184783 b!184781) bm!18631))

(declare-fun m!211607 () Bool)

(assert (=> bm!18631 m!211607))

(assert (=> b!184782 m!211503))

(assert (=> b!184782 m!211503))

(assert (=> b!184782 m!211505))

(assert (=> b!184784 m!211503))

(declare-fun m!211609 () Bool)

(assert (=> b!184784 m!211609))

(declare-fun m!211611 () Bool)

(assert (=> b!184784 m!211611))

(assert (=> b!184784 m!211503))

(declare-fun m!211613 () Bool)

(assert (=> b!184784 m!211613))

(assert (=> b!184581 d!54877))

(declare-fun d!54879 () Bool)

(declare-fun e!121607 () Bool)

(assert (=> d!54879 e!121607))

(declare-fun res!87377 () Bool)

(assert (=> d!54879 (=> res!87377 e!121607)))

(declare-fun lt!91293 () Bool)

(assert (=> d!54879 (= res!87377 (not lt!91293))))

(declare-fun lt!91292 () Bool)

(assert (=> d!54879 (= lt!91293 lt!91292)))

(declare-fun lt!91291 () Unit!5547)

(declare-fun e!121608 () Unit!5547)

(assert (=> d!54879 (= lt!91291 e!121608)))

(declare-fun c!33166 () Bool)

(assert (=> d!54879 (= c!33166 lt!91292)))

(assert (=> d!54879 (= lt!91292 (containsKey!222 (toList!1171 lt!91241) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!54879 (= (contains!1269 lt!91241 #b1000000000000000000000000000000000000000000000000000000000000000) lt!91293)))

(declare-fun b!184785 () Bool)

(declare-fun lt!91290 () Unit!5547)

(assert (=> b!184785 (= e!121608 lt!91290)))

(assert (=> b!184785 (= lt!91290 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1171 lt!91241) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184785 (isDefined!172 (getValueByKey!218 (toList!1171 lt!91241) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184786 () Bool)

(declare-fun Unit!5553 () Unit!5547)

(assert (=> b!184786 (= e!121608 Unit!5553)))

(declare-fun b!184787 () Bool)

(assert (=> b!184787 (= e!121607 (isDefined!172 (getValueByKey!218 (toList!1171 lt!91241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54879 c!33166) b!184785))

(assert (= (and d!54879 (not c!33166)) b!184786))

(assert (= (and d!54879 (not res!87377)) b!184787))

(declare-fun m!211615 () Bool)

(assert (=> d!54879 m!211615))

(declare-fun m!211617 () Bool)

(assert (=> b!184785 m!211617))

(declare-fun m!211619 () Bool)

(assert (=> b!184785 m!211619))

(assert (=> b!184785 m!211619))

(declare-fun m!211621 () Bool)

(assert (=> b!184785 m!211621))

(assert (=> b!184787 m!211619))

(assert (=> b!184787 m!211619))

(assert (=> b!184787 m!211621))

(assert (=> bm!18619 d!54879))

(declare-fun d!54881 () Bool)

(declare-fun e!121609 () Bool)

(assert (=> d!54881 e!121609))

(declare-fun res!87379 () Bool)

(assert (=> d!54881 (=> (not res!87379) (not e!121609))))

(declare-fun lt!91295 () ListLongMap!2311)

(assert (=> d!54881 (= res!87379 (contains!1269 lt!91295 (_1!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(declare-fun lt!91294 () List!2340)

(assert (=> d!54881 (= lt!91295 (ListLongMap!2312 lt!91294))))

(declare-fun lt!91296 () Unit!5547)

(declare-fun lt!91297 () Unit!5547)

(assert (=> d!54881 (= lt!91296 lt!91297)))

(assert (=> d!54881 (= (getValueByKey!218 lt!91294 (_1!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))) (Some!223 (_2!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(assert (=> d!54881 (= lt!91297 (lemmaContainsTupThenGetReturnValue!117 lt!91294 (_1!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (_2!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(assert (=> d!54881 (= lt!91294 (insertStrictlySorted!120 (toList!1171 (ite c!33136 call!18625 (ite c!33131 call!18620 call!18623))) (_1!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) (_2!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))))))

(assert (=> d!54881 (= (+!280 (ite c!33136 call!18625 (ite c!33131 call!18620 call!18623)) (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))) lt!91295)))

(declare-fun b!184788 () Bool)

(declare-fun res!87378 () Bool)

(assert (=> b!184788 (=> (not res!87378) (not e!121609))))

(assert (=> b!184788 (= res!87378 (= (getValueByKey!218 (toList!1171 lt!91295) (_1!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248))))) (Some!223 (_2!1712 (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))))

(declare-fun b!184789 () Bool)

(assert (=> b!184789 (= e!121609 (contains!1271 (toList!1171 lt!91295) (ite (or c!33136 c!33131) (tuple2!3403 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3609 thiss!1248)) (tuple2!3403 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3609 thiss!1248)))))))

(assert (= (and d!54881 res!87379) b!184788))

(assert (= (and b!184788 res!87378) b!184789))

(declare-fun m!211623 () Bool)

(assert (=> d!54881 m!211623))

(declare-fun m!211625 () Bool)

(assert (=> d!54881 m!211625))

(declare-fun m!211627 () Bool)

(assert (=> d!54881 m!211627))

(declare-fun m!211629 () Bool)

(assert (=> d!54881 m!211629))

(declare-fun m!211631 () Bool)

(assert (=> b!184788 m!211631))

(declare-fun m!211633 () Bool)

(assert (=> b!184789 m!211633))

(assert (=> bm!18617 d!54881))

(declare-fun d!54883 () Bool)

(assert (=> d!54883 (isDefined!172 (getValueByKey!218 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-fun lt!91300 () Unit!5547)

(declare-fun choose!986 (List!2340 (_ BitVec 64)) Unit!5547)

(assert (=> d!54883 (= lt!91300 (choose!986 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(declare-fun e!121612 () Bool)

(assert (=> d!54883 e!121612))

(declare-fun res!87382 () Bool)

(assert (=> d!54883 (=> (not res!87382) (not e!121612))))

(declare-fun isStrictlySorted!343 (List!2340) Bool)

(assert (=> d!54883 (= res!87382 (isStrictlySorted!343 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))))))

(assert (=> d!54883 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828) lt!91300)))

(declare-fun b!184792 () Bool)

(assert (=> b!184792 (= e!121612 (containsKey!222 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828))))

(assert (= (and d!54883 res!87382) b!184792))

(assert (=> d!54883 m!211495))

(assert (=> d!54883 m!211495))

(assert (=> d!54883 m!211497))

(declare-fun m!211635 () Bool)

(assert (=> d!54883 m!211635))

(declare-fun m!211637 () Bool)

(assert (=> d!54883 m!211637))

(assert (=> b!184792 m!211491))

(assert (=> b!184607 d!54883))

(assert (=> b!184607 d!54873))

(assert (=> b!184607 d!54875))

(declare-fun d!54885 () Bool)

(declare-fun get!2124 (Option!224) V!5409)

(assert (=> d!54885 (= (apply!163 lt!91241 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)) (get!2124 (getValueByKey!218 (toList!1171 lt!91241) (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7475 () Bool)

(assert (= bs!7475 d!54885))

(assert (=> bs!7475 m!211503))

(assert (=> bs!7475 m!211569))

(assert (=> bs!7475 m!211569))

(declare-fun m!211639 () Bool)

(assert (=> bs!7475 m!211639))

(assert (=> b!184664 d!54885))

(declare-fun d!54887 () Bool)

(declare-fun c!33169 () Bool)

(assert (=> d!54887 (= c!33169 ((_ is ValueCellFull!1817) (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121615 () V!5409)

(assert (=> d!54887 (= (get!2123 (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121615)))

(declare-fun b!184797 () Bool)

(declare-fun get!2125 (ValueCell!1817 V!5409) V!5409)

(assert (=> b!184797 (= e!121615 (get!2125 (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184798 () Bool)

(declare-fun get!2126 (ValueCell!1817 V!5409) V!5409)

(assert (=> b!184798 (= e!121615 (get!2126 (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!54887 c!33169) b!184797))

(assert (= (and d!54887 (not c!33169)) b!184798))

(assert (=> b!184797 m!211517))

(assert (=> b!184797 m!211519))

(declare-fun m!211641 () Bool)

(assert (=> b!184797 m!211641))

(assert (=> b!184798 m!211517))

(assert (=> b!184798 m!211519))

(declare-fun m!211643 () Bool)

(assert (=> b!184798 m!211643))

(assert (=> b!184664 d!54887))

(declare-fun e!121622 () SeekEntryResult!628)

(declare-fun b!184811 () Bool)

(assert (=> b!184811 (= e!121622 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20077 lt!91167) #b00000000000000000000000000000001) (nextIndex!0 (index!4684 lt!91167) (x!20077 lt!91167) (mask!8857 thiss!1248)) (index!4684 lt!91167) key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)))))

(declare-fun b!184812 () Bool)

(assert (=> b!184812 (= e!121622 (MissingVacant!628 (index!4684 lt!91167)))))

(declare-fun b!184813 () Bool)

(declare-fun e!121623 () SeekEntryResult!628)

(assert (=> b!184813 (= e!121623 Undefined!628)))

(declare-fun b!184814 () Bool)

(declare-fun e!121624 () SeekEntryResult!628)

(assert (=> b!184814 (= e!121624 (Found!628 (index!4684 lt!91167)))))

(declare-fun lt!91306 () SeekEntryResult!628)

(declare-fun d!54889 () Bool)

(assert (=> d!54889 (and (or ((_ is Undefined!628) lt!91306) (not ((_ is Found!628) lt!91306)) (and (bvsge (index!4683 lt!91306) #b00000000000000000000000000000000) (bvslt (index!4683 lt!91306) (size!4010 (_keys!5698 thiss!1248))))) (or ((_ is Undefined!628) lt!91306) ((_ is Found!628) lt!91306) (not ((_ is MissingVacant!628) lt!91306)) (not (= (index!4685 lt!91306) (index!4684 lt!91167))) (and (bvsge (index!4685 lt!91306) #b00000000000000000000000000000000) (bvslt (index!4685 lt!91306) (size!4010 (_keys!5698 thiss!1248))))) (or ((_ is Undefined!628) lt!91306) (ite ((_ is Found!628) lt!91306) (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4683 lt!91306)) key!828) (and ((_ is MissingVacant!628) lt!91306) (= (index!4685 lt!91306) (index!4684 lt!91167)) (= (select (arr!3694 (_keys!5698 thiss!1248)) (index!4685 lt!91306)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!54889 (= lt!91306 e!121623)))

(declare-fun c!33178 () Bool)

(assert (=> d!54889 (= c!33178 (bvsge (x!20077 lt!91167) #b01111111111111111111111111111110))))

(declare-fun lt!91305 () (_ BitVec 64))

(assert (=> d!54889 (= lt!91305 (select (arr!3694 (_keys!5698 thiss!1248)) (index!4684 lt!91167)))))

(assert (=> d!54889 (validMask!0 (mask!8857 thiss!1248))))

(assert (=> d!54889 (= (seekKeyOrZeroReturnVacant!0 (x!20077 lt!91167) (index!4684 lt!91167) (index!4684 lt!91167) key!828 (_keys!5698 thiss!1248) (mask!8857 thiss!1248)) lt!91306)))

(declare-fun b!184815 () Bool)

(declare-fun c!33177 () Bool)

(assert (=> b!184815 (= c!33177 (= lt!91305 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184815 (= e!121624 e!121622)))

(declare-fun b!184816 () Bool)

(assert (=> b!184816 (= e!121623 e!121624)))

(declare-fun c!33176 () Bool)

(assert (=> b!184816 (= c!33176 (= lt!91305 key!828))))

(assert (= (and d!54889 c!33178) b!184813))

(assert (= (and d!54889 (not c!33178)) b!184816))

(assert (= (and b!184816 c!33176) b!184814))

(assert (= (and b!184816 (not c!33176)) b!184815))

(assert (= (and b!184815 c!33177) b!184812))

(assert (= (and b!184815 (not c!33177)) b!184811))

(declare-fun m!211645 () Bool)

(assert (=> b!184811 m!211645))

(assert (=> b!184811 m!211645))

(declare-fun m!211647 () Bool)

(assert (=> b!184811 m!211647))

(declare-fun m!211649 () Bool)

(assert (=> d!54889 m!211649))

(declare-fun m!211651 () Bool)

(assert (=> d!54889 m!211651))

(assert (=> d!54889 m!211477))

(assert (=> d!54889 m!211435))

(assert (=> b!184597 d!54889))

(declare-fun d!54891 () Bool)

(assert (=> d!54891 (= (apply!163 lt!91241 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2124 (getValueByKey!218 (toList!1171 lt!91241) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7476 () Bool)

(assert (= bs!7476 d!54891))

(assert (=> bs!7476 m!211619))

(assert (=> bs!7476 m!211619))

(declare-fun m!211653 () Bool)

(assert (=> bs!7476 m!211653))

(assert (=> b!184669 d!54891))

(declare-fun b!184841 () Bool)

(declare-fun e!121643 () ListLongMap!2311)

(declare-fun e!121641 () ListLongMap!2311)

(assert (=> b!184841 (= e!121643 e!121641)))

(declare-fun c!33188 () Bool)

(assert (=> b!184841 (= c!33188 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184842 () Bool)

(declare-fun e!121639 () Bool)

(declare-fun e!121640 () Bool)

(assert (=> b!184842 (= e!121639 e!121640)))

(assert (=> b!184842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun res!87394 () Bool)

(declare-fun lt!91327 () ListLongMap!2311)

(assert (=> b!184842 (= res!87394 (contains!1269 lt!91327 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184842 (=> (not res!87394) (not e!121640))))

(declare-fun d!54893 () Bool)

(declare-fun e!121642 () Bool)

(assert (=> d!54893 e!121642))

(declare-fun res!87392 () Bool)

(assert (=> d!54893 (=> (not res!87392) (not e!121642))))

(assert (=> d!54893 (= res!87392 (not (contains!1269 lt!91327 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!54893 (= lt!91327 e!121643)))

(declare-fun c!33189 () Bool)

(assert (=> d!54893 (= c!33189 (bvsge #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> d!54893 (validMask!0 (mask!8857 thiss!1248))))

(assert (=> d!54893 (= (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)) lt!91327)))

(declare-fun b!184843 () Bool)

(assert (=> b!184843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(assert (=> b!184843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4011 (_values!3751 thiss!1248))))))

(assert (=> b!184843 (= e!121640 (= (apply!163 lt!91327 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)) (get!2123 (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!184844 () Bool)

(declare-fun e!121645 () Bool)

(assert (=> b!184844 (= e!121645 (validKeyInArray!0 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184844 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!184845 () Bool)

(assert (=> b!184845 (= e!121643 (ListLongMap!2312 Nil!2337))))

(declare-fun bm!18634 () Bool)

(declare-fun call!18637 () ListLongMap!2311)

(assert (=> bm!18634 (= call!18637 (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3768 thiss!1248)))))

(declare-fun b!184846 () Bool)

(declare-fun e!121644 () Bool)

(assert (=> b!184846 (= e!121639 e!121644)))

(declare-fun c!33190 () Bool)

(assert (=> b!184846 (= c!33190 (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun b!184847 () Bool)

(assert (=> b!184847 (= e!121642 e!121639)))

(declare-fun c!33187 () Bool)

(assert (=> b!184847 (= c!33187 e!121645)))

(declare-fun res!87391 () Bool)

(assert (=> b!184847 (=> (not res!87391) (not e!121645))))

(assert (=> b!184847 (= res!87391 (bvslt #b00000000000000000000000000000000 (size!4010 (_keys!5698 thiss!1248))))))

(declare-fun b!184848 () Bool)

(declare-fun res!87393 () Bool)

(assert (=> b!184848 (=> (not res!87393) (not e!121642))))

(assert (=> b!184848 (= res!87393 (not (contains!1269 lt!91327 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184849 () Bool)

(declare-fun lt!91323 () Unit!5547)

(declare-fun lt!91325 () Unit!5547)

(assert (=> b!184849 (= lt!91323 lt!91325)))

(declare-fun lt!91326 () (_ BitVec 64))

(declare-fun lt!91321 () (_ BitVec 64))

(declare-fun lt!91324 () V!5409)

(declare-fun lt!91322 () ListLongMap!2311)

(assert (=> b!184849 (not (contains!1269 (+!280 lt!91322 (tuple2!3403 lt!91321 lt!91324)) lt!91326))))

(declare-fun addStillNotContains!89 (ListLongMap!2311 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5547)

(assert (=> b!184849 (= lt!91325 (addStillNotContains!89 lt!91322 lt!91321 lt!91324 lt!91326))))

(assert (=> b!184849 (= lt!91326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!184849 (= lt!91324 (get!2123 (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184849 (= lt!91321 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184849 (= lt!91322 call!18637)))

(assert (=> b!184849 (= e!121641 (+!280 call!18637 (tuple2!3403 (select (arr!3694 (_keys!5698 thiss!1248)) #b00000000000000000000000000000000) (get!2123 (select (arr!3695 (_values!3751 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!497 (defaultEntry!3768 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!184850 () Bool)

(declare-fun isEmpty!474 (ListLongMap!2311) Bool)

(assert (=> b!184850 (= e!121644 (isEmpty!474 lt!91327))))

(declare-fun b!184851 () Bool)

(assert (=> b!184851 (= e!121641 call!18637)))

(declare-fun b!184852 () Bool)

(assert (=> b!184852 (= e!121644 (= lt!91327 (getCurrentListMapNoExtraKeys!184 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3768 thiss!1248))))))

(assert (= (and d!54893 c!33189) b!184845))

(assert (= (and d!54893 (not c!33189)) b!184841))

(assert (= (and b!184841 c!33188) b!184849))

(assert (= (and b!184841 (not c!33188)) b!184851))

(assert (= (or b!184849 b!184851) bm!18634))

(assert (= (and d!54893 res!87392) b!184848))

(assert (= (and b!184848 res!87393) b!184847))

(assert (= (and b!184847 res!87391) b!184844))

(assert (= (and b!184847 c!33187) b!184842))

(assert (= (and b!184847 (not c!33187)) b!184846))

(assert (= (and b!184842 res!87394) b!184843))

(assert (= (and b!184846 c!33190) b!184852))

(assert (= (and b!184846 (not c!33190)) b!184850))

(declare-fun b_lambda!7217 () Bool)

(assert (=> (not b_lambda!7217) (not b!184843)))

(assert (=> b!184843 t!7209))

(declare-fun b_and!11121 () Bool)

(assert (= b_and!11119 (and (=> t!7209 result!4781) b_and!11121)))

(declare-fun b_lambda!7219 () Bool)

(assert (=> (not b_lambda!7219) (not b!184849)))

(assert (=> b!184849 t!7209))

(declare-fun b_and!11123 () Bool)

(assert (= b_and!11121 (and (=> t!7209 result!4781) b_and!11123)))

(assert (=> b!184849 m!211519))

(declare-fun m!211655 () Bool)

(assert (=> b!184849 m!211655))

(declare-fun m!211657 () Bool)

(assert (=> b!184849 m!211657))

(assert (=> b!184849 m!211517))

(assert (=> b!184849 m!211519))

(assert (=> b!184849 m!211521))

(assert (=> b!184849 m!211503))

(declare-fun m!211659 () Bool)

(assert (=> b!184849 m!211659))

(assert (=> b!184849 m!211517))

(declare-fun m!211661 () Bool)

(assert (=> b!184849 m!211661))

(assert (=> b!184849 m!211655))

(assert (=> b!184843 m!211519))

(assert (=> b!184843 m!211503))

(declare-fun m!211663 () Bool)

(assert (=> b!184843 m!211663))

(assert (=> b!184843 m!211517))

(assert (=> b!184843 m!211519))

(assert (=> b!184843 m!211521))

(assert (=> b!184843 m!211503))

(assert (=> b!184843 m!211517))

(declare-fun m!211665 () Bool)

(assert (=> b!184852 m!211665))

(declare-fun m!211667 () Bool)

(assert (=> b!184848 m!211667))

(assert (=> b!184844 m!211503))

(assert (=> b!184844 m!211503))

(assert (=> b!184844 m!211505))

(assert (=> b!184841 m!211503))

(assert (=> b!184841 m!211503))

(assert (=> b!184841 m!211505))

(declare-fun m!211669 () Bool)

(assert (=> d!54893 m!211669))

(assert (=> d!54893 m!211435))

(assert (=> bm!18634 m!211665))

(declare-fun m!211671 () Bool)

(assert (=> b!184850 m!211671))

(assert (=> b!184842 m!211503))

(assert (=> b!184842 m!211503))

(declare-fun m!211673 () Bool)

(assert (=> b!184842 m!211673))

(assert (=> bm!18618 d!54893))

(declare-fun d!54895 () Bool)

(assert (=> d!54895 (= (apply!163 lt!91241 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2124 (getValueByKey!218 (toList!1171 lt!91241) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7477 () Bool)

(assert (= bs!7477 d!54895))

(assert (=> bs!7477 m!211579))

(assert (=> bs!7477 m!211579))

(declare-fun m!211675 () Bool)

(assert (=> bs!7477 m!211675))

(assert (=> b!184654 d!54895))

(assert (=> b!184671 d!54893))

(declare-fun d!54897 () Bool)

(declare-fun e!121646 () Bool)

(assert (=> d!54897 e!121646))

(declare-fun res!87395 () Bool)

(assert (=> d!54897 (=> res!87395 e!121646)))

(declare-fun lt!91331 () Bool)

(assert (=> d!54897 (= res!87395 (not lt!91331))))

(declare-fun lt!91330 () Bool)

(assert (=> d!54897 (= lt!91331 lt!91330)))

(declare-fun lt!91329 () Unit!5547)

(declare-fun e!121647 () Unit!5547)

(assert (=> d!54897 (= lt!91329 e!121647)))

(declare-fun c!33191 () Bool)

(assert (=> d!54897 (= c!33191 lt!91330)))

(assert (=> d!54897 (= lt!91330 (containsKey!222 (toList!1171 (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))) lt!91240))))

(assert (=> d!54897 (= (contains!1269 (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))) lt!91240) lt!91331)))

(declare-fun b!184853 () Bool)

(declare-fun lt!91328 () Unit!5547)

(assert (=> b!184853 (= e!121647 lt!91328)))

(assert (=> b!184853 (= lt!91328 (lemmaContainsKeyImpliesGetValueByKeyDefined!171 (toList!1171 (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))) lt!91240))))

(assert (=> b!184853 (isDefined!172 (getValueByKey!218 (toList!1171 (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))) lt!91240))))

(declare-fun b!184854 () Bool)

(declare-fun Unit!5554 () Unit!5547)

(assert (=> b!184854 (= e!121647 Unit!5554)))

(declare-fun b!184855 () Bool)

(assert (=> b!184855 (= e!121646 (isDefined!172 (getValueByKey!218 (toList!1171 (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))) lt!91240)))))

(assert (= (and d!54897 c!33191) b!184853))

(assert (= (and d!54897 (not c!33191)) b!184854))

(assert (= (and d!54897 (not res!87395)) b!184855))

(declare-fun m!211677 () Bool)

(assert (=> d!54897 m!211677))

(declare-fun m!211679 () Bool)

(assert (=> b!184853 m!211679))

(declare-fun m!211681 () Bool)

(assert (=> b!184853 m!211681))

(assert (=> b!184853 m!211681))

(declare-fun m!211683 () Bool)

(assert (=> b!184853 m!211683))

(assert (=> b!184855 m!211681))

(assert (=> b!184855 m!211681))

(assert (=> b!184855 m!211683))

(assert (=> b!184671 d!54897))

(declare-fun d!54899 () Bool)

(assert (=> d!54899 (= (apply!163 (+!280 lt!91239 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))) lt!91235) (apply!163 lt!91239 lt!91235))))

(declare-fun lt!91334 () Unit!5547)

(declare-fun choose!987 (ListLongMap!2311 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5547)

(assert (=> d!54899 (= lt!91334 (choose!987 lt!91239 lt!91231 (minValue!3609 thiss!1248) lt!91235))))

(declare-fun e!121650 () Bool)

(assert (=> d!54899 e!121650))

(declare-fun res!87398 () Bool)

(assert (=> d!54899 (=> (not res!87398) (not e!121650))))

(assert (=> d!54899 (= res!87398 (contains!1269 lt!91239 lt!91235))))

(assert (=> d!54899 (= (addApplyDifferent!139 lt!91239 lt!91231 (minValue!3609 thiss!1248) lt!91235) lt!91334)))

(declare-fun b!184859 () Bool)

(assert (=> b!184859 (= e!121650 (not (= lt!91235 lt!91231)))))

(assert (= (and d!54899 res!87398) b!184859))

(assert (=> d!54899 m!211543))

(assert (=> d!54899 m!211527))

(declare-fun m!211685 () Bool)

(assert (=> d!54899 m!211685))

(declare-fun m!211687 () Bool)

(assert (=> d!54899 m!211687))

(assert (=> d!54899 m!211527))

(assert (=> d!54899 m!211529))

(assert (=> b!184671 d!54899))

(declare-fun d!54901 () Bool)

(declare-fun e!121651 () Bool)

(assert (=> d!54901 e!121651))

(declare-fun res!87400 () Bool)

(assert (=> d!54901 (=> (not res!87400) (not e!121651))))

(declare-fun lt!91336 () ListLongMap!2311)

(assert (=> d!54901 (= res!87400 (contains!1269 lt!91336 (_1!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248)))))))

(declare-fun lt!91335 () List!2340)

(assert (=> d!54901 (= lt!91336 (ListLongMap!2312 lt!91335))))

(declare-fun lt!91337 () Unit!5547)

(declare-fun lt!91338 () Unit!5547)

(assert (=> d!54901 (= lt!91337 lt!91338)))

(assert (=> d!54901 (= (getValueByKey!218 lt!91335 (_1!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!54901 (= lt!91338 (lemmaContainsTupThenGetReturnValue!117 lt!91335 (_1!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!54901 (= lt!91335 (insertStrictlySorted!120 (toList!1171 lt!91232) (_1!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!54901 (= (+!280 lt!91232 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))) lt!91336)))

(declare-fun b!184860 () Bool)

(declare-fun res!87399 () Bool)

(assert (=> b!184860 (=> (not res!87399) (not e!121651))))

(assert (=> b!184860 (= res!87399 (= (getValueByKey!218 (toList!1171 lt!91336) (_1!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))))))))

(declare-fun b!184861 () Bool)

(assert (=> b!184861 (= e!121651 (contains!1271 (toList!1171 lt!91336) (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))))))

(assert (= (and d!54901 res!87400) b!184860))

(assert (= (and b!184860 res!87399) b!184861))

(declare-fun m!211689 () Bool)

(assert (=> d!54901 m!211689))

(declare-fun m!211691 () Bool)

(assert (=> d!54901 m!211691))

(declare-fun m!211693 () Bool)

(assert (=> d!54901 m!211693))

(declare-fun m!211695 () Bool)

(assert (=> d!54901 m!211695))

(declare-fun m!211697 () Bool)

(assert (=> b!184860 m!211697))

(declare-fun m!211699 () Bool)

(assert (=> b!184861 m!211699))

(assert (=> b!184671 d!54901))

(declare-fun d!54903 () Bool)

(assert (=> d!54903 (= (apply!163 (+!280 lt!91228 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))) lt!91225) (apply!163 lt!91228 lt!91225))))

(declare-fun lt!91339 () Unit!5547)

(assert (=> d!54903 (= lt!91339 (choose!987 lt!91228 lt!91237 (minValue!3609 thiss!1248) lt!91225))))

(declare-fun e!121652 () Bool)

(assert (=> d!54903 e!121652))

(declare-fun res!87401 () Bool)

(assert (=> d!54903 (=> (not res!87401) (not e!121652))))

(assert (=> d!54903 (= res!87401 (contains!1269 lt!91228 lt!91225))))

(assert (=> d!54903 (= (addApplyDifferent!139 lt!91228 lt!91237 (minValue!3609 thiss!1248) lt!91225) lt!91339)))

(declare-fun b!184862 () Bool)

(assert (=> b!184862 (= e!121652 (not (= lt!91225 lt!91237)))))

(assert (= (and d!54903 res!87401) b!184862))

(assert (=> d!54903 m!211531))

(assert (=> d!54903 m!211525))

(declare-fun m!211701 () Bool)

(assert (=> d!54903 m!211701))

(declare-fun m!211703 () Bool)

(assert (=> d!54903 m!211703))

(assert (=> d!54903 m!211525))

(assert (=> d!54903 m!211551))

(assert (=> b!184671 d!54903))

(declare-fun d!54905 () Bool)

(declare-fun e!121653 () Bool)

(assert (=> d!54905 e!121653))

(declare-fun res!87403 () Bool)

(assert (=> d!54905 (=> (not res!87403) (not e!121653))))

(declare-fun lt!91341 () ListLongMap!2311)

(assert (=> d!54905 (= res!87403 (contains!1269 lt!91341 (_1!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248)))))))

(declare-fun lt!91340 () List!2340)

(assert (=> d!54905 (= lt!91341 (ListLongMap!2312 lt!91340))))

(declare-fun lt!91342 () Unit!5547)

(declare-fun lt!91343 () Unit!5547)

(assert (=> d!54905 (= lt!91342 lt!91343)))

(assert (=> d!54905 (= (getValueByKey!218 lt!91340 (_1!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248)))))))

(assert (=> d!54905 (= lt!91343 (lemmaContainsTupThenGetReturnValue!117 lt!91340 (_1!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248)))))))

(assert (=> d!54905 (= lt!91340 (insertStrictlySorted!120 (toList!1171 lt!91239) (_1!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248)))))))

(assert (=> d!54905 (= (+!280 lt!91239 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))) lt!91341)))

(declare-fun b!184863 () Bool)

(declare-fun res!87402 () Bool)

(assert (=> b!184863 (=> (not res!87402) (not e!121653))))

(assert (=> b!184863 (= res!87402 (= (getValueByKey!218 (toList!1171 lt!91341) (_1!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))))))))

(declare-fun b!184864 () Bool)

(assert (=> b!184864 (= e!121653 (contains!1271 (toList!1171 lt!91341) (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))))))

(assert (= (and d!54905 res!87403) b!184863))

(assert (= (and b!184863 res!87402) b!184864))

(declare-fun m!211705 () Bool)

(assert (=> d!54905 m!211705))

(declare-fun m!211707 () Bool)

(assert (=> d!54905 m!211707))

(declare-fun m!211709 () Bool)

(assert (=> d!54905 m!211709))

(declare-fun m!211711 () Bool)

(assert (=> d!54905 m!211711))

(declare-fun m!211713 () Bool)

(assert (=> b!184863 m!211713))

(declare-fun m!211715 () Bool)

(assert (=> b!184864 m!211715))

(assert (=> b!184671 d!54905))

(declare-fun d!54907 () Bool)

(assert (=> d!54907 (= (apply!163 (+!280 lt!91232 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))) lt!91227) (apply!163 lt!91232 lt!91227))))

(declare-fun lt!91344 () Unit!5547)

(assert (=> d!54907 (= lt!91344 (choose!987 lt!91232 lt!91236 (zeroValue!3609 thiss!1248) lt!91227))))

(declare-fun e!121654 () Bool)

(assert (=> d!54907 e!121654))

(declare-fun res!87404 () Bool)

(assert (=> d!54907 (=> (not res!87404) (not e!121654))))

(assert (=> d!54907 (= res!87404 (contains!1269 lt!91232 lt!91227))))

(assert (=> d!54907 (= (addApplyDifferent!139 lt!91232 lt!91236 (zeroValue!3609 thiss!1248) lt!91227) lt!91344)))

(declare-fun b!184865 () Bool)

(assert (=> b!184865 (= e!121654 (not (= lt!91227 lt!91236)))))

(assert (= (and d!54907 res!87404) b!184865))

(assert (=> d!54907 m!211533))

(assert (=> d!54907 m!211537))

(declare-fun m!211717 () Bool)

(assert (=> d!54907 m!211717))

(declare-fun m!211719 () Bool)

(assert (=> d!54907 m!211719))

(assert (=> d!54907 m!211537))

(assert (=> d!54907 m!211539))

(assert (=> b!184671 d!54907))

(declare-fun d!54909 () Bool)

(assert (=> d!54909 (= (apply!163 (+!280 lt!91239 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248))) lt!91235) (get!2124 (getValueByKey!218 (toList!1171 (+!280 lt!91239 (tuple2!3403 lt!91231 (minValue!3609 thiss!1248)))) lt!91235)))))

(declare-fun bs!7478 () Bool)

(assert (= bs!7478 d!54909))

(declare-fun m!211721 () Bool)

(assert (=> bs!7478 m!211721))

(assert (=> bs!7478 m!211721))

(declare-fun m!211723 () Bool)

(assert (=> bs!7478 m!211723))

(assert (=> b!184671 d!54909))

(declare-fun d!54911 () Bool)

(assert (=> d!54911 (= (apply!163 lt!91232 lt!91227) (get!2124 (getValueByKey!218 (toList!1171 lt!91232) lt!91227)))))

(declare-fun bs!7479 () Bool)

(assert (= bs!7479 d!54911))

(declare-fun m!211725 () Bool)

(assert (=> bs!7479 m!211725))

(assert (=> bs!7479 m!211725))

(declare-fun m!211727 () Bool)

(assert (=> bs!7479 m!211727))

(assert (=> b!184671 d!54911))

(declare-fun d!54913 () Bool)

(assert (=> d!54913 (= (apply!163 (+!280 lt!91228 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))) lt!91225) (get!2124 (getValueByKey!218 (toList!1171 (+!280 lt!91228 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248)))) lt!91225)))))

(declare-fun bs!7480 () Bool)

(assert (= bs!7480 d!54913))

(declare-fun m!211729 () Bool)

(assert (=> bs!7480 m!211729))

(assert (=> bs!7480 m!211729))

(declare-fun m!211731 () Bool)

(assert (=> bs!7480 m!211731))

(assert (=> b!184671 d!54913))

(declare-fun d!54915 () Bool)

(assert (=> d!54915 (= (apply!163 (+!280 lt!91232 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248))) lt!91227) (get!2124 (getValueByKey!218 (toList!1171 (+!280 lt!91232 (tuple2!3403 lt!91236 (zeroValue!3609 thiss!1248)))) lt!91227)))))

(declare-fun bs!7481 () Bool)

(assert (= bs!7481 d!54915))

(declare-fun m!211733 () Bool)

(assert (=> bs!7481 m!211733))

(assert (=> bs!7481 m!211733))

(declare-fun m!211735 () Bool)

(assert (=> bs!7481 m!211735))

(assert (=> b!184671 d!54915))

(declare-fun d!54917 () Bool)

(assert (=> d!54917 (contains!1269 (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))) lt!91240)))

(declare-fun lt!91347 () Unit!5547)

(declare-fun choose!988 (ListLongMap!2311 (_ BitVec 64) V!5409 (_ BitVec 64)) Unit!5547)

(assert (=> d!54917 (= lt!91347 (choose!988 lt!91243 lt!91226 (zeroValue!3609 thiss!1248) lt!91240))))

(assert (=> d!54917 (contains!1269 lt!91243 lt!91240)))

(assert (=> d!54917 (= (addStillContains!139 lt!91243 lt!91226 (zeroValue!3609 thiss!1248) lt!91240) lt!91347)))

(declare-fun bs!7482 () Bool)

(assert (= bs!7482 d!54917))

(assert (=> bs!7482 m!211523))

(assert (=> bs!7482 m!211523))

(assert (=> bs!7482 m!211541))

(declare-fun m!211737 () Bool)

(assert (=> bs!7482 m!211737))

(declare-fun m!211739 () Bool)

(assert (=> bs!7482 m!211739))

(assert (=> b!184671 d!54917))

(declare-fun d!54919 () Bool)

(assert (=> d!54919 (= (apply!163 lt!91228 lt!91225) (get!2124 (getValueByKey!218 (toList!1171 lt!91228) lt!91225)))))

(declare-fun bs!7483 () Bool)

(assert (= bs!7483 d!54919))

(declare-fun m!211741 () Bool)

(assert (=> bs!7483 m!211741))

(assert (=> bs!7483 m!211741))

(declare-fun m!211743 () Bool)

(assert (=> bs!7483 m!211743))

(assert (=> b!184671 d!54919))

(declare-fun d!54921 () Bool)

(declare-fun e!121655 () Bool)

(assert (=> d!54921 e!121655))

(declare-fun res!87406 () Bool)

(assert (=> d!54921 (=> (not res!87406) (not e!121655))))

(declare-fun lt!91349 () ListLongMap!2311)

(assert (=> d!54921 (= res!87406 (contains!1269 lt!91349 (_1!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))))))

(declare-fun lt!91348 () List!2340)

(assert (=> d!54921 (= lt!91349 (ListLongMap!2312 lt!91348))))

(declare-fun lt!91350 () Unit!5547)

(declare-fun lt!91351 () Unit!5547)

(assert (=> d!54921 (= lt!91350 lt!91351)))

(assert (=> d!54921 (= (getValueByKey!218 lt!91348 (_1!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!54921 (= lt!91351 (lemmaContainsTupThenGetReturnValue!117 lt!91348 (_1!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!54921 (= lt!91348 (insertStrictlySorted!120 (toList!1171 lt!91243) (_1!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))))))

(assert (=> d!54921 (= (+!280 lt!91243 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))) lt!91349)))

(declare-fun b!184867 () Bool)

(declare-fun res!87405 () Bool)

(assert (=> b!184867 (=> (not res!87405) (not e!121655))))

(assert (=> b!184867 (= res!87405 (= (getValueByKey!218 (toList!1171 lt!91349) (_1!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))))))))

(declare-fun b!184868 () Bool)

(assert (=> b!184868 (= e!121655 (contains!1271 (toList!1171 lt!91349) (tuple2!3403 lt!91226 (zeroValue!3609 thiss!1248))))))

(assert (= (and d!54921 res!87406) b!184867))

(assert (= (and b!184867 res!87405) b!184868))

(declare-fun m!211745 () Bool)

(assert (=> d!54921 m!211745))

(declare-fun m!211747 () Bool)

(assert (=> d!54921 m!211747))

(declare-fun m!211749 () Bool)

(assert (=> d!54921 m!211749))

(declare-fun m!211751 () Bool)

(assert (=> d!54921 m!211751))

(declare-fun m!211753 () Bool)

(assert (=> b!184867 m!211753))

(declare-fun m!211755 () Bool)

(assert (=> b!184868 m!211755))

(assert (=> b!184671 d!54921))

(declare-fun d!54923 () Bool)

(assert (=> d!54923 (= (apply!163 lt!91239 lt!91235) (get!2124 (getValueByKey!218 (toList!1171 lt!91239) lt!91235)))))

(declare-fun bs!7484 () Bool)

(assert (= bs!7484 d!54923))

(declare-fun m!211757 () Bool)

(assert (=> bs!7484 m!211757))

(assert (=> bs!7484 m!211757))

(declare-fun m!211759 () Bool)

(assert (=> bs!7484 m!211759))

(assert (=> b!184671 d!54923))

(declare-fun d!54925 () Bool)

(declare-fun e!121656 () Bool)

(assert (=> d!54925 e!121656))

(declare-fun res!87408 () Bool)

(assert (=> d!54925 (=> (not res!87408) (not e!121656))))

(declare-fun lt!91353 () ListLongMap!2311)

(assert (=> d!54925 (= res!87408 (contains!1269 lt!91353 (_1!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248)))))))

(declare-fun lt!91352 () List!2340)

(assert (=> d!54925 (= lt!91353 (ListLongMap!2312 lt!91352))))

(declare-fun lt!91354 () Unit!5547)

(declare-fun lt!91355 () Unit!5547)

(assert (=> d!54925 (= lt!91354 lt!91355)))

(assert (=> d!54925 (= (getValueByKey!218 lt!91352 (_1!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248)))))))

(assert (=> d!54925 (= lt!91355 (lemmaContainsTupThenGetReturnValue!117 lt!91352 (_1!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248)))))))

(assert (=> d!54925 (= lt!91352 (insertStrictlySorted!120 (toList!1171 lt!91228) (_1!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))) (_2!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248)))))))

(assert (=> d!54925 (= (+!280 lt!91228 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))) lt!91353)))

(declare-fun b!184869 () Bool)

(declare-fun res!87407 () Bool)

(assert (=> b!184869 (=> (not res!87407) (not e!121656))))

(assert (=> b!184869 (= res!87407 (= (getValueByKey!218 (toList!1171 lt!91353) (_1!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248)))) (Some!223 (_2!1712 (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))))))))

(declare-fun b!184870 () Bool)

(assert (=> b!184870 (= e!121656 (contains!1271 (toList!1171 lt!91353) (tuple2!3403 lt!91237 (minValue!3609 thiss!1248))))))

(assert (= (and d!54925 res!87408) b!184869))

(assert (= (and b!184869 res!87407) b!184870))

(declare-fun m!211761 () Bool)

(assert (=> d!54925 m!211761))

(declare-fun m!211763 () Bool)

(assert (=> d!54925 m!211763))

(declare-fun m!211765 () Bool)

(assert (=> d!54925 m!211765))

(declare-fun m!211767 () Bool)

(assert (=> d!54925 m!211767))

(declare-fun m!211769 () Bool)

(assert (=> b!184869 m!211769))

(declare-fun m!211771 () Bool)

(assert (=> b!184870 m!211771))

(assert (=> b!184671 d!54925))

(declare-fun d!54927 () Bool)

(declare-fun res!87413 () Bool)

(declare-fun e!121661 () Bool)

(assert (=> d!54927 (=> res!87413 e!121661)))

(assert (=> d!54927 (= res!87413 (and ((_ is Cons!2336) (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (= (_1!1712 (h!2968 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)))))

(assert (=> d!54927 (= (containsKey!222 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))) key!828) e!121661)))

(declare-fun b!184875 () Bool)

(declare-fun e!121662 () Bool)

(assert (=> b!184875 (= e!121661 e!121662)))

(declare-fun res!87414 () Bool)

(assert (=> b!184875 (=> (not res!87414) (not e!121662))))

(assert (=> b!184875 (= res!87414 (and (or (not ((_ is Cons!2336) (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) (bvsle (_1!1712 (h!2968 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)) ((_ is Cons!2336) (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) (bvslt (_1!1712 (h!2968 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248))))) key!828)))))

(declare-fun b!184876 () Bool)

(assert (=> b!184876 (= e!121662 (containsKey!222 (t!7207 (toList!1171 (getCurrentListMap!804 (_keys!5698 thiss!1248) (_values!3751 thiss!1248) (mask!8857 thiss!1248) (extraKeys!3505 thiss!1248) (zeroValue!3609 thiss!1248) (minValue!3609 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3768 thiss!1248)))) key!828))))

(assert (= (and d!54927 (not res!87413)) b!184875))

(assert (= (and b!184875 res!87414) b!184876))

(declare-fun m!211773 () Bool)

(assert (=> b!184876 m!211773))

(assert (=> d!54847 d!54927))

(declare-fun b!184878 () Bool)

(declare-fun e!121663 () Bool)

(assert (=> b!184878 (= e!121663 tp_is_empty!4321)))

(declare-fun b!184877 () Bool)

(declare-fun e!121664 () Bool)

(assert (=> b!184877 (= e!121664 tp_is_empty!4321)))

(declare-fun mapNonEmpty!7440 () Bool)

(declare-fun mapRes!7440 () Bool)

(declare-fun tp!16449 () Bool)

(assert (=> mapNonEmpty!7440 (= mapRes!7440 (and tp!16449 e!121664))))

(declare-fun mapValue!7440 () ValueCell!1817)

(declare-fun mapKey!7440 () (_ BitVec 32))

(declare-fun mapRest!7440 () (Array (_ BitVec 32) ValueCell!1817))

(assert (=> mapNonEmpty!7440 (= mapRest!7439 (store mapRest!7440 mapKey!7440 mapValue!7440))))

(declare-fun mapIsEmpty!7440 () Bool)

(assert (=> mapIsEmpty!7440 mapRes!7440))

(declare-fun condMapEmpty!7440 () Bool)

(declare-fun mapDefault!7440 () ValueCell!1817)

(assert (=> mapNonEmpty!7439 (= condMapEmpty!7440 (= mapRest!7439 ((as const (Array (_ BitVec 32) ValueCell!1817)) mapDefault!7440)))))

(assert (=> mapNonEmpty!7439 (= tp!16448 (and e!121663 mapRes!7440))))

(assert (= (and mapNonEmpty!7439 condMapEmpty!7440) mapIsEmpty!7440))

(assert (= (and mapNonEmpty!7439 (not condMapEmpty!7440)) mapNonEmpty!7440))

(assert (= (and mapNonEmpty!7440 ((_ is ValueCellFull!1817) mapValue!7440)) b!184877))

(assert (= (and mapNonEmpty!7439 ((_ is ValueCellFull!1817) mapDefault!7440)) b!184878))

(declare-fun m!211775 () Bool)

(assert (=> mapNonEmpty!7440 m!211775))

(declare-fun b_lambda!7221 () Bool)

(assert (= b_lambda!7219 (or (and b!184519 b_free!4549) b_lambda!7221)))

(declare-fun b_lambda!7223 () Bool)

(assert (= b_lambda!7217 (or (and b!184519 b_free!4549) b_lambda!7223)))

(check-sat (not b!184852) (not d!54873) (not d!54867) (not b_lambda!7215) (not b_next!4549) (not d!54865) (not b_lambda!7223) (not b!184712) (not b!184723) (not b!184771) (not d!54903) (not d!54899) (not b!184844) (not b!184785) (not b!184861) (not d!54913) (not b!184811) (not b!184784) (not d!54891) (not b!184710) (not d!54881) (not d!54907) (not d!54917) (not d!54863) (not bm!18625) (not b!184848) (not d!54921) (not b!184797) (not b!184867) (not d!54895) (not d!54879) (not b!184782) (not d!54889) (not d!54923) (not b!184748) (not b!184864) (not b!184787) (not b!184863) (not b!184855) b_and!11123 (not d!54909) (not b!184868) (not d!54915) (not bm!18634) (not b!184850) (not d!54901) (not b!184725) (not d!54861) (not d!54871) (not b!184843) (not b!184876) (not b!184722) (not b!184853) (not d!54897) (not b!184870) (not d!54883) (not b!184759) (not b!184788) (not b!184695) (not b!184696) (not bm!18631) (not d!54925) tp_is_empty!4321 (not b!184693) (not b!184706) (not d!54919) (not b_lambda!7221) (not b!184798) (not d!54911) (not d!54905) (not b!184792) (not d!54893) (not b!184727) (not b!184842) (not mapNonEmpty!7440) (not b!184869) (not bm!18628) (not b!184860) (not b!184760) (not b!184789) (not b!184849) (not b!184841) (not d!54885))
(check-sat b_and!11123 (not b_next!4549))
