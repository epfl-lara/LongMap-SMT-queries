; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80512 () Bool)

(assert start!80512)

(declare-fun b!945489 () Bool)

(declare-fun b_free!18099 () Bool)

(declare-fun b_next!18099 () Bool)

(assert (=> b!945489 (= b_free!18099 (not b_next!18099))))

(declare-fun tp!62815 () Bool)

(declare-fun b_and!29521 () Bool)

(assert (=> b!945489 (= tp!62815 b_and!29521)))

(declare-fun b!945484 () Bool)

(declare-fun e!531796 () Bool)

(declare-datatypes ((SeekEntryResult!9086 0))(
  ( (MissingZero!9086 (index!38715 (_ BitVec 32))) (Found!9086 (index!38716 (_ BitVec 32))) (Intermediate!9086 (undefined!9898 Bool) (index!38717 (_ BitVec 32)) (x!81233 (_ BitVec 32))) (Undefined!9086) (MissingVacant!9086 (index!38718 (_ BitVec 32))) )
))
(declare-fun lt!426030 () SeekEntryResult!9086)

(get-info :version)

(assert (=> b!945484 (= e!531796 (and ((_ is Found!9086) lt!426030) (bvslt (index!38716 lt!426030) #b00000000000000000000000000000000)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32441 0))(
  ( (V!32442 (val!10354 Int)) )
))
(declare-datatypes ((ValueCell!9822 0))(
  ( (ValueCellFull!9822 (v!12888 V!32441)) (EmptyCell!9822) )
))
(declare-datatypes ((array!57186 0))(
  ( (array!57187 (arr!27516 (Array (_ BitVec 32) ValueCell!9822)) (size!27984 (_ BitVec 32))) )
))
(declare-datatypes ((array!57188 0))(
  ( (array!57189 (arr!27517 (Array (_ BitVec 32) (_ BitVec 64))) (size!27985 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4794 0))(
  ( (LongMapFixedSize!4795 (defaultEntry!5694 Int) (mask!27362 (_ BitVec 32)) (extraKeys!5426 (_ BitVec 32)) (zeroValue!5530 V!32441) (minValue!5530 V!32441) (_size!2452 (_ BitVec 32)) (_keys!10574 array!57188) (_values!5717 array!57186) (_vacant!2452 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4794)

(declare-fun seekEntry!0 ((_ BitVec 64) array!57188 (_ BitVec 32)) SeekEntryResult!9086)

(assert (=> b!945484 (= lt!426030 (seekEntry!0 key!756 (_keys!10574 thiss!1141) (mask!27362 thiss!1141)))))

(declare-fun res!635004 () Bool)

(assert (=> start!80512 (=> (not res!635004) (not e!531796))))

(declare-fun valid!1832 (LongMapFixedSize!4794) Bool)

(assert (=> start!80512 (= res!635004 (valid!1832 thiss!1141))))

(assert (=> start!80512 e!531796))

(declare-fun e!531799 () Bool)

(assert (=> start!80512 e!531799))

(assert (=> start!80512 true))

(declare-fun mapNonEmpty!32744 () Bool)

(declare-fun mapRes!32744 () Bool)

(declare-fun tp!62814 () Bool)

(declare-fun e!531797 () Bool)

(assert (=> mapNonEmpty!32744 (= mapRes!32744 (and tp!62814 e!531797))))

(declare-fun mapKey!32744 () (_ BitVec 32))

(declare-fun mapRest!32744 () (Array (_ BitVec 32) ValueCell!9822))

(declare-fun mapValue!32744 () ValueCell!9822)

(assert (=> mapNonEmpty!32744 (= (arr!27516 (_values!5717 thiss!1141)) (store mapRest!32744 mapKey!32744 mapValue!32744))))

(declare-fun b!945485 () Bool)

(declare-fun e!531800 () Bool)

(declare-fun e!531795 () Bool)

(assert (=> b!945485 (= e!531800 (and e!531795 mapRes!32744))))

(declare-fun condMapEmpty!32744 () Bool)

(declare-fun mapDefault!32744 () ValueCell!9822)

(assert (=> b!945485 (= condMapEmpty!32744 (= (arr!27516 (_values!5717 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9822)) mapDefault!32744)))))

(declare-fun b!945486 () Bool)

(declare-fun res!635003 () Bool)

(assert (=> b!945486 (=> (not res!635003) (not e!531796))))

(assert (=> b!945486 (= res!635003 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945487 () Bool)

(declare-fun tp_is_empty!20607 () Bool)

(assert (=> b!945487 (= e!531795 tp_is_empty!20607)))

(declare-fun b!945488 () Bool)

(assert (=> b!945488 (= e!531797 tp_is_empty!20607)))

(declare-fun mapIsEmpty!32744 () Bool)

(assert (=> mapIsEmpty!32744 mapRes!32744))

(declare-fun array_inv!21376 (array!57188) Bool)

(declare-fun array_inv!21377 (array!57186) Bool)

(assert (=> b!945489 (= e!531799 (and tp!62815 tp_is_empty!20607 (array_inv!21376 (_keys!10574 thiss!1141)) (array_inv!21377 (_values!5717 thiss!1141)) e!531800))))

(assert (= (and start!80512 res!635004) b!945486))

(assert (= (and b!945486 res!635003) b!945484))

(assert (= (and b!945485 condMapEmpty!32744) mapIsEmpty!32744))

(assert (= (and b!945485 (not condMapEmpty!32744)) mapNonEmpty!32744))

(assert (= (and mapNonEmpty!32744 ((_ is ValueCellFull!9822) mapValue!32744)) b!945488))

(assert (= (and b!945485 ((_ is ValueCellFull!9822) mapDefault!32744)) b!945487))

(assert (= b!945489 b!945485))

(assert (= start!80512 b!945489))

(declare-fun m!879277 () Bool)

(assert (=> b!945484 m!879277))

(declare-fun m!879279 () Bool)

(assert (=> start!80512 m!879279))

(declare-fun m!879281 () Bool)

(assert (=> mapNonEmpty!32744 m!879281))

(declare-fun m!879283 () Bool)

(assert (=> b!945489 m!879283))

(declare-fun m!879285 () Bool)

(assert (=> b!945489 m!879285))

(check-sat (not b!945484) tp_is_empty!20607 (not b_next!18099) b_and!29521 (not mapNonEmpty!32744) (not start!80512) (not b!945489))
(check-sat b_and!29521 (not b_next!18099))
(get-model)

(declare-fun d!114405 () Bool)

(assert (=> d!114405 (= (array_inv!21376 (_keys!10574 thiss!1141)) (bvsge (size!27985 (_keys!10574 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945489 d!114405))

(declare-fun d!114407 () Bool)

(assert (=> d!114407 (= (array_inv!21377 (_values!5717 thiss!1141)) (bvsge (size!27984 (_values!5717 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945489 d!114407))

(declare-fun b!945520 () Bool)

(declare-fun e!531826 () SeekEntryResult!9086)

(declare-fun lt!426045 () SeekEntryResult!9086)

(assert (=> b!945520 (= e!531826 (MissingZero!9086 (index!38717 lt!426045)))))

(declare-fun b!945521 () Bool)

(declare-fun e!531825 () SeekEntryResult!9086)

(assert (=> b!945521 (= e!531825 (Found!9086 (index!38717 lt!426045)))))

(declare-fun b!945522 () Bool)

(declare-fun c!98428 () Bool)

(declare-fun lt!426042 () (_ BitVec 64))

(assert (=> b!945522 (= c!98428 (= lt!426042 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945522 (= e!531825 e!531826)))

(declare-fun b!945523 () Bool)

(declare-fun e!531827 () SeekEntryResult!9086)

(assert (=> b!945523 (= e!531827 e!531825)))

(assert (=> b!945523 (= lt!426042 (select (arr!27517 (_keys!10574 thiss!1141)) (index!38717 lt!426045)))))

(declare-fun c!98427 () Bool)

(assert (=> b!945523 (= c!98427 (= lt!426042 key!756))))

(declare-fun b!945524 () Bool)

(declare-fun lt!426044 () SeekEntryResult!9086)

(assert (=> b!945524 (= e!531826 (ite ((_ is MissingVacant!9086) lt!426044) (MissingZero!9086 (index!38718 lt!426044)) lt!426044))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57188 (_ BitVec 32)) SeekEntryResult!9086)

(assert (=> b!945524 (= lt!426044 (seekKeyOrZeroReturnVacant!0 (x!81233 lt!426045) (index!38717 lt!426045) (index!38717 lt!426045) key!756 (_keys!10574 thiss!1141) (mask!27362 thiss!1141)))))

(declare-fun b!945525 () Bool)

(assert (=> b!945525 (= e!531827 Undefined!9086)))

(declare-fun d!114409 () Bool)

(declare-fun lt!426043 () SeekEntryResult!9086)

(assert (=> d!114409 (and (or ((_ is MissingVacant!9086) lt!426043) (not ((_ is Found!9086) lt!426043)) (and (bvsge (index!38716 lt!426043) #b00000000000000000000000000000000) (bvslt (index!38716 lt!426043) (size!27985 (_keys!10574 thiss!1141))))) (not ((_ is MissingVacant!9086) lt!426043)) (or (not ((_ is Found!9086) lt!426043)) (= (select (arr!27517 (_keys!10574 thiss!1141)) (index!38716 lt!426043)) key!756)))))

(assert (=> d!114409 (= lt!426043 e!531827)))

(declare-fun c!98429 () Bool)

(assert (=> d!114409 (= c!98429 (and ((_ is Intermediate!9086) lt!426045) (undefined!9898 lt!426045)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57188 (_ BitVec 32)) SeekEntryResult!9086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114409 (= lt!426045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27362 thiss!1141)) key!756 (_keys!10574 thiss!1141) (mask!27362 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114409 (validMask!0 (mask!27362 thiss!1141))))

(assert (=> d!114409 (= (seekEntry!0 key!756 (_keys!10574 thiss!1141) (mask!27362 thiss!1141)) lt!426043)))

(assert (= (and d!114409 c!98429) b!945525))

(assert (= (and d!114409 (not c!98429)) b!945523))

(assert (= (and b!945523 c!98427) b!945521))

(assert (= (and b!945523 (not c!98427)) b!945522))

(assert (= (and b!945522 c!98428) b!945520))

(assert (= (and b!945522 (not c!98428)) b!945524))

(declare-fun m!879297 () Bool)

(assert (=> b!945523 m!879297))

(declare-fun m!879299 () Bool)

(assert (=> b!945524 m!879299))

(declare-fun m!879301 () Bool)

(assert (=> d!114409 m!879301))

(declare-fun m!879303 () Bool)

(assert (=> d!114409 m!879303))

(assert (=> d!114409 m!879303))

(declare-fun m!879305 () Bool)

(assert (=> d!114409 m!879305))

(declare-fun m!879307 () Bool)

(assert (=> d!114409 m!879307))

(assert (=> b!945484 d!114409))

(declare-fun d!114411 () Bool)

(declare-fun res!635017 () Bool)

(declare-fun e!531830 () Bool)

(assert (=> d!114411 (=> (not res!635017) (not e!531830))))

(declare-fun simpleValid!351 (LongMapFixedSize!4794) Bool)

(assert (=> d!114411 (= res!635017 (simpleValid!351 thiss!1141))))

(assert (=> d!114411 (= (valid!1832 thiss!1141) e!531830)))

(declare-fun b!945532 () Bool)

(declare-fun res!635018 () Bool)

(assert (=> b!945532 (=> (not res!635018) (not e!531830))))

(declare-fun arrayCountValidKeys!0 (array!57188 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945532 (= res!635018 (= (arrayCountValidKeys!0 (_keys!10574 thiss!1141) #b00000000000000000000000000000000 (size!27985 (_keys!10574 thiss!1141))) (_size!2452 thiss!1141)))))

(declare-fun b!945533 () Bool)

(declare-fun res!635019 () Bool)

(assert (=> b!945533 (=> (not res!635019) (not e!531830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57188 (_ BitVec 32)) Bool)

(assert (=> b!945533 (= res!635019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10574 thiss!1141) (mask!27362 thiss!1141)))))

(declare-fun b!945534 () Bool)

(declare-datatypes ((List!19291 0))(
  ( (Nil!19288) (Cons!19287 (h!20438 (_ BitVec 64)) (t!27612 List!19291)) )
))
(declare-fun arrayNoDuplicates!0 (array!57188 (_ BitVec 32) List!19291) Bool)

(assert (=> b!945534 (= e!531830 (arrayNoDuplicates!0 (_keys!10574 thiss!1141) #b00000000000000000000000000000000 Nil!19288))))

(assert (= (and d!114411 res!635017) b!945532))

(assert (= (and b!945532 res!635018) b!945533))

(assert (= (and b!945533 res!635019) b!945534))

(declare-fun m!879309 () Bool)

(assert (=> d!114411 m!879309))

(declare-fun m!879311 () Bool)

(assert (=> b!945532 m!879311))

(declare-fun m!879313 () Bool)

(assert (=> b!945533 m!879313))

(declare-fun m!879315 () Bool)

(assert (=> b!945534 m!879315))

(assert (=> start!80512 d!114411))

(declare-fun mapNonEmpty!32750 () Bool)

(declare-fun mapRes!32750 () Bool)

(declare-fun tp!62824 () Bool)

(declare-fun e!531836 () Bool)

(assert (=> mapNonEmpty!32750 (= mapRes!32750 (and tp!62824 e!531836))))

(declare-fun mapRest!32750 () (Array (_ BitVec 32) ValueCell!9822))

(declare-fun mapKey!32750 () (_ BitVec 32))

(declare-fun mapValue!32750 () ValueCell!9822)

(assert (=> mapNonEmpty!32750 (= mapRest!32744 (store mapRest!32750 mapKey!32750 mapValue!32750))))

(declare-fun mapIsEmpty!32750 () Bool)

(assert (=> mapIsEmpty!32750 mapRes!32750))

(declare-fun b!945542 () Bool)

(declare-fun e!531835 () Bool)

(assert (=> b!945542 (= e!531835 tp_is_empty!20607)))

(declare-fun condMapEmpty!32750 () Bool)

(declare-fun mapDefault!32750 () ValueCell!9822)

(assert (=> mapNonEmpty!32744 (= condMapEmpty!32750 (= mapRest!32744 ((as const (Array (_ BitVec 32) ValueCell!9822)) mapDefault!32750)))))

(assert (=> mapNonEmpty!32744 (= tp!62814 (and e!531835 mapRes!32750))))

(declare-fun b!945541 () Bool)

(assert (=> b!945541 (= e!531836 tp_is_empty!20607)))

(assert (= (and mapNonEmpty!32744 condMapEmpty!32750) mapIsEmpty!32750))

(assert (= (and mapNonEmpty!32744 (not condMapEmpty!32750)) mapNonEmpty!32750))

(assert (= (and mapNonEmpty!32750 ((_ is ValueCellFull!9822) mapValue!32750)) b!945541))

(assert (= (and mapNonEmpty!32744 ((_ is ValueCellFull!9822) mapDefault!32750)) b!945542))

(declare-fun m!879317 () Bool)

(assert (=> mapNonEmpty!32750 m!879317))

(check-sat (not d!114411) (not b!945532) tp_is_empty!20607 (not d!114409) (not b!945534) (not b_next!18099) b_and!29521 (not b!945524) (not mapNonEmpty!32750) (not b!945533))
(check-sat b_and!29521 (not b_next!18099))
