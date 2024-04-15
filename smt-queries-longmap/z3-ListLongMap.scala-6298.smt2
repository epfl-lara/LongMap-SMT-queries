; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80520 () Bool)

(assert start!80520)

(declare-fun b!945408 () Bool)

(declare-fun b_free!18109 () Bool)

(declare-fun b_next!18109 () Bool)

(assert (=> b!945408 (= b_free!18109 (not b_next!18109))))

(declare-fun tp!62851 () Bool)

(declare-fun b_and!29505 () Bool)

(assert (=> b!945408 (= tp!62851 b_and!29505)))

(declare-fun b!945405 () Bool)

(declare-fun e!531776 () Bool)

(declare-fun e!531774 () Bool)

(declare-fun mapRes!32765 () Bool)

(assert (=> b!945405 (= e!531776 (and e!531774 mapRes!32765))))

(declare-fun condMapEmpty!32765 () Bool)

(declare-datatypes ((V!32455 0))(
  ( (V!32456 (val!10359 Int)) )
))
(declare-datatypes ((ValueCell!9827 0))(
  ( (ValueCellFull!9827 (v!12892 V!32455)) (EmptyCell!9827) )
))
(declare-datatypes ((array!57175 0))(
  ( (array!57176 (arr!27509 (Array (_ BitVec 32) ValueCell!9827)) (size!27979 (_ BitVec 32))) )
))
(declare-datatypes ((array!57177 0))(
  ( (array!57178 (arr!27510 (Array (_ BitVec 32) (_ BitVec 64))) (size!27980 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4804 0))(
  ( (LongMapFixedSize!4805 (defaultEntry!5699 Int) (mask!27366 (_ BitVec 32)) (extraKeys!5431 (_ BitVec 32)) (zeroValue!5535 V!32455) (minValue!5535 V!32455) (_size!2457 (_ BitVec 32)) (_keys!10576 array!57177) (_values!5722 array!57175) (_vacant!2457 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4804)

(declare-fun mapDefault!32765 () ValueCell!9827)

(assert (=> b!945405 (= condMapEmpty!32765 (= (arr!27509 (_values!5722 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9827)) mapDefault!32765)))))

(declare-fun b!945406 () Bool)

(declare-fun e!531775 () Bool)

(declare-fun tp_is_empty!20617 () Bool)

(assert (=> b!945406 (= e!531775 tp_is_empty!20617)))

(declare-fun b!945407 () Bool)

(assert (=> b!945407 (= e!531774 tp_is_empty!20617)))

(declare-fun e!531778 () Bool)

(declare-fun array_inv!21422 (array!57177) Bool)

(declare-fun array_inv!21423 (array!57175) Bool)

(assert (=> b!945408 (= e!531778 (and tp!62851 tp_is_empty!20617 (array_inv!21422 (_keys!10576 thiss!1141)) (array_inv!21423 (_values!5722 thiss!1141)) e!531776))))

(declare-fun b!945409 () Bool)

(declare-fun e!531777 () Bool)

(declare-datatypes ((SeekEntryResult!9085 0))(
  ( (MissingZero!9085 (index!38711 (_ BitVec 32))) (Found!9085 (index!38712 (_ BitVec 32))) (Intermediate!9085 (undefined!9897 Bool) (index!38713 (_ BitVec 32)) (x!81259 (_ BitVec 32))) (Undefined!9085) (MissingVacant!9085 (index!38714 (_ BitVec 32))) )
))
(declare-fun lt!425833 () SeekEntryResult!9085)

(get-info :version)

(assert (=> b!945409 (= e!531777 (and ((_ is Found!9085) lt!425833) (bvsge (index!38712 lt!425833) #b00000000000000000000000000000000) (bvslt (index!38712 lt!425833) (size!27980 (_keys!10576 thiss!1141))) (bvsge (size!27980 (_keys!10576 thiss!1141)) #b01111111111111111111111111111111)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57177 (_ BitVec 32)) SeekEntryResult!9085)

(assert (=> b!945409 (= lt!425833 (seekEntry!0 key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)))))

(declare-fun mapNonEmpty!32765 () Bool)

(declare-fun tp!62852 () Bool)

(assert (=> mapNonEmpty!32765 (= mapRes!32765 (and tp!62852 e!531775))))

(declare-fun mapKey!32765 () (_ BitVec 32))

(declare-fun mapRest!32765 () (Array (_ BitVec 32) ValueCell!9827))

(declare-fun mapValue!32765 () ValueCell!9827)

(assert (=> mapNonEmpty!32765 (= (arr!27509 (_values!5722 thiss!1141)) (store mapRest!32765 mapKey!32765 mapValue!32765))))

(declare-fun b!945410 () Bool)

(declare-fun res!634942 () Bool)

(assert (=> b!945410 (=> (not res!634942) (not e!531777))))

(assert (=> b!945410 (= res!634942 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!32765 () Bool)

(assert (=> mapIsEmpty!32765 mapRes!32765))

(declare-fun res!634941 () Bool)

(assert (=> start!80520 (=> (not res!634941) (not e!531777))))

(declare-fun valid!1837 (LongMapFixedSize!4804) Bool)

(assert (=> start!80520 (= res!634941 (valid!1837 thiss!1141))))

(assert (=> start!80520 e!531777))

(assert (=> start!80520 e!531778))

(assert (=> start!80520 true))

(assert (= (and start!80520 res!634941) b!945410))

(assert (= (and b!945410 res!634942) b!945409))

(assert (= (and b!945405 condMapEmpty!32765) mapIsEmpty!32765))

(assert (= (and b!945405 (not condMapEmpty!32765)) mapNonEmpty!32765))

(assert (= (and mapNonEmpty!32765 ((_ is ValueCellFull!9827) mapValue!32765)) b!945406))

(assert (= (and b!945405 ((_ is ValueCellFull!9827) mapDefault!32765)) b!945407))

(assert (= b!945408 b!945405))

(assert (= start!80520 b!945408))

(declare-fun m!878613 () Bool)

(assert (=> b!945408 m!878613))

(declare-fun m!878615 () Bool)

(assert (=> b!945408 m!878615))

(declare-fun m!878617 () Bool)

(assert (=> b!945409 m!878617))

(declare-fun m!878619 () Bool)

(assert (=> mapNonEmpty!32765 m!878619))

(declare-fun m!878621 () Bool)

(assert (=> start!80520 m!878621))

(check-sat (not start!80520) (not mapNonEmpty!32765) tp_is_empty!20617 (not b!945409) (not b_next!18109) (not b!945408) b_and!29505)
(check-sat b_and!29505 (not b_next!18109))
(get-model)

(declare-fun b!945459 () Bool)

(declare-fun e!531823 () SeekEntryResult!9085)

(declare-fun e!531821 () SeekEntryResult!9085)

(assert (=> b!945459 (= e!531823 e!531821)))

(declare-fun lt!425849 () (_ BitVec 64))

(declare-fun lt!425850 () SeekEntryResult!9085)

(assert (=> b!945459 (= lt!425849 (select (arr!27510 (_keys!10576 thiss!1141)) (index!38713 lt!425850)))))

(declare-fun c!98381 () Bool)

(assert (=> b!945459 (= c!98381 (= lt!425849 key!756))))

(declare-fun b!945460 () Bool)

(assert (=> b!945460 (= e!531821 (Found!9085 (index!38713 lt!425850)))))

(declare-fun b!945461 () Bool)

(assert (=> b!945461 (= e!531823 Undefined!9085)))

(declare-fun d!114227 () Bool)

(declare-fun lt!425851 () SeekEntryResult!9085)

(assert (=> d!114227 (and (or ((_ is MissingVacant!9085) lt!425851) (not ((_ is Found!9085) lt!425851)) (and (bvsge (index!38712 lt!425851) #b00000000000000000000000000000000) (bvslt (index!38712 lt!425851) (size!27980 (_keys!10576 thiss!1141))))) (not ((_ is MissingVacant!9085) lt!425851)) (or (not ((_ is Found!9085) lt!425851)) (= (select (arr!27510 (_keys!10576 thiss!1141)) (index!38712 lt!425851)) key!756)))))

(assert (=> d!114227 (= lt!425851 e!531823)))

(declare-fun c!98382 () Bool)

(assert (=> d!114227 (= c!98382 (and ((_ is Intermediate!9085) lt!425850) (undefined!9897 lt!425850)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57177 (_ BitVec 32)) SeekEntryResult!9085)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114227 (= lt!425850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27366 thiss!1141)) key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114227 (validMask!0 (mask!27366 thiss!1141))))

(assert (=> d!114227 (= (seekEntry!0 key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)) lt!425851)))

(declare-fun b!945462 () Bool)

(declare-fun e!531822 () SeekEntryResult!9085)

(declare-fun lt!425848 () SeekEntryResult!9085)

(assert (=> b!945462 (= e!531822 (ite ((_ is MissingVacant!9085) lt!425848) (MissingZero!9085 (index!38714 lt!425848)) lt!425848))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57177 (_ BitVec 32)) SeekEntryResult!9085)

(assert (=> b!945462 (= lt!425848 (seekKeyOrZeroReturnVacant!0 (x!81259 lt!425850) (index!38713 lt!425850) (index!38713 lt!425850) key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)))))

(declare-fun b!945463 () Bool)

(assert (=> b!945463 (= e!531822 (MissingZero!9085 (index!38713 lt!425850)))))

(declare-fun b!945464 () Bool)

(declare-fun c!98380 () Bool)

(assert (=> b!945464 (= c!98380 (= lt!425849 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945464 (= e!531821 e!531822)))

(assert (= (and d!114227 c!98382) b!945461))

(assert (= (and d!114227 (not c!98382)) b!945459))

(assert (= (and b!945459 c!98381) b!945460))

(assert (= (and b!945459 (not c!98381)) b!945464))

(assert (= (and b!945464 c!98380) b!945463))

(assert (= (and b!945464 (not c!98380)) b!945462))

(declare-fun m!878643 () Bool)

(assert (=> b!945459 m!878643))

(declare-fun m!878645 () Bool)

(assert (=> d!114227 m!878645))

(declare-fun m!878647 () Bool)

(assert (=> d!114227 m!878647))

(assert (=> d!114227 m!878647))

(declare-fun m!878649 () Bool)

(assert (=> d!114227 m!878649))

(declare-fun m!878651 () Bool)

(assert (=> d!114227 m!878651))

(declare-fun m!878653 () Bool)

(assert (=> b!945462 m!878653))

(assert (=> b!945409 d!114227))

(declare-fun d!114229 () Bool)

(declare-fun res!634961 () Bool)

(declare-fun e!531826 () Bool)

(assert (=> d!114229 (=> (not res!634961) (not e!531826))))

(declare-fun simpleValid!353 (LongMapFixedSize!4804) Bool)

(assert (=> d!114229 (= res!634961 (simpleValid!353 thiss!1141))))

(assert (=> d!114229 (= (valid!1837 thiss!1141) e!531826)))

(declare-fun b!945471 () Bool)

(declare-fun res!634962 () Bool)

(assert (=> b!945471 (=> (not res!634962) (not e!531826))))

(declare-fun arrayCountValidKeys!0 (array!57177 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945471 (= res!634962 (= (arrayCountValidKeys!0 (_keys!10576 thiss!1141) #b00000000000000000000000000000000 (size!27980 (_keys!10576 thiss!1141))) (_size!2457 thiss!1141)))))

(declare-fun b!945472 () Bool)

(declare-fun res!634963 () Bool)

(assert (=> b!945472 (=> (not res!634963) (not e!531826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57177 (_ BitVec 32)) Bool)

(assert (=> b!945472 (= res!634963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)))))

(declare-fun b!945473 () Bool)

(declare-datatypes ((List!19298 0))(
  ( (Nil!19295) (Cons!19294 (h!20445 (_ BitVec 64)) (t!27610 List!19298)) )
))
(declare-fun arrayNoDuplicates!0 (array!57177 (_ BitVec 32) List!19298) Bool)

(assert (=> b!945473 (= e!531826 (arrayNoDuplicates!0 (_keys!10576 thiss!1141) #b00000000000000000000000000000000 Nil!19295))))

(assert (= (and d!114229 res!634961) b!945471))

(assert (= (and b!945471 res!634962) b!945472))

(assert (= (and b!945472 res!634963) b!945473))

(declare-fun m!878655 () Bool)

(assert (=> d!114229 m!878655))

(declare-fun m!878657 () Bool)

(assert (=> b!945471 m!878657))

(declare-fun m!878659 () Bool)

(assert (=> b!945472 m!878659))

(declare-fun m!878661 () Bool)

(assert (=> b!945473 m!878661))

(assert (=> start!80520 d!114229))

(declare-fun d!114231 () Bool)

(assert (=> d!114231 (= (array_inv!21422 (_keys!10576 thiss!1141)) (bvsge (size!27980 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945408 d!114231))

(declare-fun d!114233 () Bool)

(assert (=> d!114233 (= (array_inv!21423 (_values!5722 thiss!1141)) (bvsge (size!27979 (_values!5722 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945408 d!114233))

(declare-fun condMapEmpty!32774 () Bool)

(declare-fun mapDefault!32774 () ValueCell!9827)

(assert (=> mapNonEmpty!32765 (= condMapEmpty!32774 (= mapRest!32765 ((as const (Array (_ BitVec 32) ValueCell!9827)) mapDefault!32774)))))

(declare-fun e!531831 () Bool)

(declare-fun mapRes!32774 () Bool)

(assert (=> mapNonEmpty!32765 (= tp!62852 (and e!531831 mapRes!32774))))

(declare-fun b!945480 () Bool)

(declare-fun e!531832 () Bool)

(assert (=> b!945480 (= e!531832 tp_is_empty!20617)))

(declare-fun mapIsEmpty!32774 () Bool)

(assert (=> mapIsEmpty!32774 mapRes!32774))

(declare-fun mapNonEmpty!32774 () Bool)

(declare-fun tp!62867 () Bool)

(assert (=> mapNonEmpty!32774 (= mapRes!32774 (and tp!62867 e!531832))))

(declare-fun mapRest!32774 () (Array (_ BitVec 32) ValueCell!9827))

(declare-fun mapValue!32774 () ValueCell!9827)

(declare-fun mapKey!32774 () (_ BitVec 32))

(assert (=> mapNonEmpty!32774 (= mapRest!32765 (store mapRest!32774 mapKey!32774 mapValue!32774))))

(declare-fun b!945481 () Bool)

(assert (=> b!945481 (= e!531831 tp_is_empty!20617)))

(assert (= (and mapNonEmpty!32765 condMapEmpty!32774) mapIsEmpty!32774))

(assert (= (and mapNonEmpty!32765 (not condMapEmpty!32774)) mapNonEmpty!32774))

(assert (= (and mapNonEmpty!32774 ((_ is ValueCellFull!9827) mapValue!32774)) b!945480))

(assert (= (and mapNonEmpty!32765 ((_ is ValueCellFull!9827) mapDefault!32774)) b!945481))

(declare-fun m!878663 () Bool)

(assert (=> mapNonEmpty!32774 m!878663))

(check-sat (not b!945471) (not b!945473) (not b!945462) (not mapNonEmpty!32774) (not d!114227) (not b!945472) tp_is_empty!20617 b_and!29505 (not b_next!18109) (not d!114229))
(check-sat b_and!29505 (not b_next!18109))
(get-model)

(declare-fun b!945490 () Bool)

(declare-fun e!531838 () (_ BitVec 32))

(declare-fun e!531837 () (_ BitVec 32))

(assert (=> b!945490 (= e!531838 e!531837)))

(declare-fun c!98387 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945490 (= c!98387 (validKeyInArray!0 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114235 () Bool)

(declare-fun lt!425854 () (_ BitVec 32))

(assert (=> d!114235 (and (bvsge lt!425854 #b00000000000000000000000000000000) (bvsle lt!425854 (bvsub (size!27980 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114235 (= lt!425854 e!531838)))

(declare-fun c!98388 () Bool)

(assert (=> d!114235 (= c!98388 (bvsge #b00000000000000000000000000000000 (size!27980 (_keys!10576 thiss!1141))))))

(assert (=> d!114235 (and (bvsle #b00000000000000000000000000000000 (size!27980 (_keys!10576 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27980 (_keys!10576 thiss!1141)) (size!27980 (_keys!10576 thiss!1141))))))

(assert (=> d!114235 (= (arrayCountValidKeys!0 (_keys!10576 thiss!1141) #b00000000000000000000000000000000 (size!27980 (_keys!10576 thiss!1141))) lt!425854)))

(declare-fun bm!41032 () Bool)

(declare-fun call!41035 () (_ BitVec 32))

(assert (=> bm!41032 (= call!41035 (arrayCountValidKeys!0 (_keys!10576 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27980 (_keys!10576 thiss!1141))))))

(declare-fun b!945491 () Bool)

(assert (=> b!945491 (= e!531838 #b00000000000000000000000000000000)))

(declare-fun b!945492 () Bool)

(assert (=> b!945492 (= e!531837 (bvadd #b00000000000000000000000000000001 call!41035))))

(declare-fun b!945493 () Bool)

(assert (=> b!945493 (= e!531837 call!41035)))

(assert (= (and d!114235 c!98388) b!945491))

(assert (= (and d!114235 (not c!98388)) b!945490))

(assert (= (and b!945490 c!98387) b!945492))

(assert (= (and b!945490 (not c!98387)) b!945493))

(assert (= (or b!945492 b!945493) bm!41032))

(declare-fun m!878665 () Bool)

(assert (=> b!945490 m!878665))

(assert (=> b!945490 m!878665))

(declare-fun m!878667 () Bool)

(assert (=> b!945490 m!878667))

(declare-fun m!878669 () Bool)

(assert (=> bm!41032 m!878669))

(assert (=> b!945471 d!114235))

(declare-fun b!945505 () Bool)

(declare-fun e!531841 () Bool)

(assert (=> b!945505 (= e!531841 (and (bvsge (extraKeys!5431 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5431 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2457 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114237 () Bool)

(declare-fun res!634975 () Bool)

(assert (=> d!114237 (=> (not res!634975) (not e!531841))))

(assert (=> d!114237 (= res!634975 (validMask!0 (mask!27366 thiss!1141)))))

(assert (=> d!114237 (= (simpleValid!353 thiss!1141) e!531841)))

(declare-fun b!945503 () Bool)

(declare-fun res!634974 () Bool)

(assert (=> b!945503 (=> (not res!634974) (not e!531841))))

(declare-fun size!27985 (LongMapFixedSize!4804) (_ BitVec 32))

(assert (=> b!945503 (= res!634974 (bvsge (size!27985 thiss!1141) (_size!2457 thiss!1141)))))

(declare-fun b!945504 () Bool)

(declare-fun res!634972 () Bool)

(assert (=> b!945504 (=> (not res!634972) (not e!531841))))

(assert (=> b!945504 (= res!634972 (= (size!27985 thiss!1141) (bvadd (_size!2457 thiss!1141) (bvsdiv (bvadd (extraKeys!5431 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!945502 () Bool)

(declare-fun res!634973 () Bool)

(assert (=> b!945502 (=> (not res!634973) (not e!531841))))

(assert (=> b!945502 (= res!634973 (and (= (size!27979 (_values!5722 thiss!1141)) (bvadd (mask!27366 thiss!1141) #b00000000000000000000000000000001)) (= (size!27980 (_keys!10576 thiss!1141)) (size!27979 (_values!5722 thiss!1141))) (bvsge (_size!2457 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2457 thiss!1141) (bvadd (mask!27366 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114237 res!634975) b!945502))

(assert (= (and b!945502 res!634973) b!945503))

(assert (= (and b!945503 res!634974) b!945504))

(assert (= (and b!945504 res!634972) b!945505))

(assert (=> d!114237 m!878651))

(declare-fun m!878671 () Bool)

(assert (=> b!945503 m!878671))

(assert (=> b!945504 m!878671))

(assert (=> d!114229 d!114237))

(declare-fun b!945519 () Bool)

(declare-fun e!531849 () SeekEntryResult!9085)

(assert (=> b!945519 (= e!531849 (MissingVacant!9085 (index!38713 lt!425850)))))

(declare-fun b!945520 () Bool)

(declare-fun c!98395 () Bool)

(declare-fun lt!425860 () (_ BitVec 64))

(assert (=> b!945520 (= c!98395 (= lt!425860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!531848 () SeekEntryResult!9085)

(assert (=> b!945520 (= e!531848 e!531849)))

(declare-fun b!945521 () Bool)

(assert (=> b!945521 (= e!531848 (Found!9085 (index!38713 lt!425850)))))

(declare-fun b!945522 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945522 (= e!531849 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81259 lt!425850) #b00000000000000000000000000000001) (nextIndex!0 (index!38713 lt!425850) (x!81259 lt!425850) (mask!27366 thiss!1141)) (index!38713 lt!425850) key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)))))

(declare-fun b!945523 () Bool)

(declare-fun e!531850 () SeekEntryResult!9085)

(assert (=> b!945523 (= e!531850 e!531848)))

(declare-fun c!98396 () Bool)

(assert (=> b!945523 (= c!98396 (= lt!425860 key!756))))

(declare-fun lt!425859 () SeekEntryResult!9085)

(declare-fun d!114239 () Bool)

(assert (=> d!114239 (and (or ((_ is Undefined!9085) lt!425859) (not ((_ is Found!9085) lt!425859)) (and (bvsge (index!38712 lt!425859) #b00000000000000000000000000000000) (bvslt (index!38712 lt!425859) (size!27980 (_keys!10576 thiss!1141))))) (or ((_ is Undefined!9085) lt!425859) ((_ is Found!9085) lt!425859) (not ((_ is MissingVacant!9085) lt!425859)) (not (= (index!38714 lt!425859) (index!38713 lt!425850))) (and (bvsge (index!38714 lt!425859) #b00000000000000000000000000000000) (bvslt (index!38714 lt!425859) (size!27980 (_keys!10576 thiss!1141))))) (or ((_ is Undefined!9085) lt!425859) (ite ((_ is Found!9085) lt!425859) (= (select (arr!27510 (_keys!10576 thiss!1141)) (index!38712 lt!425859)) key!756) (and ((_ is MissingVacant!9085) lt!425859) (= (index!38714 lt!425859) (index!38713 lt!425850)) (= (select (arr!27510 (_keys!10576 thiss!1141)) (index!38714 lt!425859)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114239 (= lt!425859 e!531850)))

(declare-fun c!98397 () Bool)

(assert (=> d!114239 (= c!98397 (bvsge (x!81259 lt!425850) #b01111111111111111111111111111110))))

(assert (=> d!114239 (= lt!425860 (select (arr!27510 (_keys!10576 thiss!1141)) (index!38713 lt!425850)))))

(assert (=> d!114239 (validMask!0 (mask!27366 thiss!1141))))

(assert (=> d!114239 (= (seekKeyOrZeroReturnVacant!0 (x!81259 lt!425850) (index!38713 lt!425850) (index!38713 lt!425850) key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)) lt!425859)))

(declare-fun b!945518 () Bool)

(assert (=> b!945518 (= e!531850 Undefined!9085)))

(assert (= (and d!114239 c!98397) b!945518))

(assert (= (and d!114239 (not c!98397)) b!945523))

(assert (= (and b!945523 c!98396) b!945521))

(assert (= (and b!945523 (not c!98396)) b!945520))

(assert (= (and b!945520 c!98395) b!945519))

(assert (= (and b!945520 (not c!98395)) b!945522))

(declare-fun m!878673 () Bool)

(assert (=> b!945522 m!878673))

(assert (=> b!945522 m!878673))

(declare-fun m!878675 () Bool)

(assert (=> b!945522 m!878675))

(declare-fun m!878677 () Bool)

(assert (=> d!114239 m!878677))

(declare-fun m!878679 () Bool)

(assert (=> d!114239 m!878679))

(assert (=> d!114239 m!878643))

(assert (=> d!114239 m!878651))

(assert (=> b!945462 d!114239))

(declare-fun b!945534 () Bool)

(declare-fun e!531862 () Bool)

(declare-fun e!531860 () Bool)

(assert (=> b!945534 (= e!531862 e!531860)))

(declare-fun res!634983 () Bool)

(assert (=> b!945534 (=> (not res!634983) (not e!531860))))

(declare-fun e!531861 () Bool)

(assert (=> b!945534 (= res!634983 (not e!531861))))

(declare-fun res!634982 () Bool)

(assert (=> b!945534 (=> (not res!634982) (not e!531861))))

(assert (=> b!945534 (= res!634982 (validKeyInArray!0 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41035 () Bool)

(declare-fun call!41038 () Bool)

(declare-fun c!98400 () Bool)

(assert (=> bm!41035 (= call!41038 (arrayNoDuplicates!0 (_keys!10576 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98400 (Cons!19294 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000) Nil!19295) Nil!19295)))))

(declare-fun b!945535 () Bool)

(declare-fun e!531859 () Bool)

(assert (=> b!945535 (= e!531859 call!41038)))

(declare-fun d!114241 () Bool)

(declare-fun res!634984 () Bool)

(assert (=> d!114241 (=> res!634984 e!531862)))

(assert (=> d!114241 (= res!634984 (bvsge #b00000000000000000000000000000000 (size!27980 (_keys!10576 thiss!1141))))))

(assert (=> d!114241 (= (arrayNoDuplicates!0 (_keys!10576 thiss!1141) #b00000000000000000000000000000000 Nil!19295) e!531862)))

(declare-fun b!945536 () Bool)

(assert (=> b!945536 (= e!531859 call!41038)))

(declare-fun b!945537 () Bool)

(declare-fun contains!5155 (List!19298 (_ BitVec 64)) Bool)

(assert (=> b!945537 (= e!531861 (contains!5155 Nil!19295 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945538 () Bool)

(assert (=> b!945538 (= e!531860 e!531859)))

(assert (=> b!945538 (= c!98400 (validKeyInArray!0 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114241 (not res!634984)) b!945534))

(assert (= (and b!945534 res!634982) b!945537))

(assert (= (and b!945534 res!634983) b!945538))

(assert (= (and b!945538 c!98400) b!945536))

(assert (= (and b!945538 (not c!98400)) b!945535))

(assert (= (or b!945536 b!945535) bm!41035))

(assert (=> b!945534 m!878665))

(assert (=> b!945534 m!878665))

(assert (=> b!945534 m!878667))

(assert (=> bm!41035 m!878665))

(declare-fun m!878681 () Bool)

(assert (=> bm!41035 m!878681))

(assert (=> b!945537 m!878665))

(assert (=> b!945537 m!878665))

(declare-fun m!878683 () Bool)

(assert (=> b!945537 m!878683))

(assert (=> b!945538 m!878665))

(assert (=> b!945538 m!878665))

(assert (=> b!945538 m!878667))

(assert (=> b!945473 d!114241))

(declare-fun d!114243 () Bool)

(declare-fun res!634989 () Bool)

(declare-fun e!531870 () Bool)

(assert (=> d!114243 (=> res!634989 e!531870)))

(assert (=> d!114243 (= res!634989 (bvsge #b00000000000000000000000000000000 (size!27980 (_keys!10576 thiss!1141))))))

(assert (=> d!114243 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)) e!531870)))

(declare-fun b!945547 () Bool)

(declare-fun e!531869 () Bool)

(declare-fun call!41041 () Bool)

(assert (=> b!945547 (= e!531869 call!41041)))

(declare-fun b!945548 () Bool)

(declare-fun e!531871 () Bool)

(assert (=> b!945548 (= e!531871 e!531869)))

(declare-fun lt!425869 () (_ BitVec 64))

(assert (=> b!945548 (= lt!425869 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31764 0))(
  ( (Unit!31765) )
))
(declare-fun lt!425867 () Unit!31764)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57177 (_ BitVec 64) (_ BitVec 32)) Unit!31764)

(assert (=> b!945548 (= lt!425867 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10576 thiss!1141) lt!425869 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945548 (arrayContainsKey!0 (_keys!10576 thiss!1141) lt!425869 #b00000000000000000000000000000000)))

(declare-fun lt!425868 () Unit!31764)

(assert (=> b!945548 (= lt!425868 lt!425867)))

(declare-fun res!634990 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57177 (_ BitVec 32)) SeekEntryResult!9085)

(assert (=> b!945548 (= res!634990 (= (seekEntryOrOpen!0 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000) (_keys!10576 thiss!1141) (mask!27366 thiss!1141)) (Found!9085 #b00000000000000000000000000000000)))))

(assert (=> b!945548 (=> (not res!634990) (not e!531869))))

(declare-fun bm!41038 () Bool)

(assert (=> bm!41038 (= call!41041 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10576 thiss!1141) (mask!27366 thiss!1141)))))

(declare-fun b!945549 () Bool)

(assert (=> b!945549 (= e!531870 e!531871)))

(declare-fun c!98403 () Bool)

(assert (=> b!945549 (= c!98403 (validKeyInArray!0 (select (arr!27510 (_keys!10576 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945550 () Bool)

(assert (=> b!945550 (= e!531871 call!41041)))

(assert (= (and d!114243 (not res!634989)) b!945549))

(assert (= (and b!945549 c!98403) b!945548))

(assert (= (and b!945549 (not c!98403)) b!945550))

(assert (= (and b!945548 res!634990) b!945547))

(assert (= (or b!945547 b!945550) bm!41038))

(assert (=> b!945548 m!878665))

(declare-fun m!878685 () Bool)

(assert (=> b!945548 m!878685))

(declare-fun m!878687 () Bool)

(assert (=> b!945548 m!878687))

(assert (=> b!945548 m!878665))

(declare-fun m!878689 () Bool)

(assert (=> b!945548 m!878689))

(declare-fun m!878691 () Bool)

(assert (=> bm!41038 m!878691))

(assert (=> b!945549 m!878665))

(assert (=> b!945549 m!878665))

(assert (=> b!945549 m!878667))

(assert (=> b!945472 d!114243))

(declare-fun b!945569 () Bool)

(declare-fun e!531883 () SeekEntryResult!9085)

(assert (=> b!945569 (= e!531883 (Intermediate!9085 true (toIndex!0 key!756 (mask!27366 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!945571 () Bool)

(declare-fun e!531885 () Bool)

(declare-fun e!531886 () Bool)

(assert (=> b!945571 (= e!531885 e!531886)))

(declare-fun res!634997 () Bool)

(declare-fun lt!425874 () SeekEntryResult!9085)

(assert (=> b!945571 (= res!634997 (and ((_ is Intermediate!9085) lt!425874) (not (undefined!9897 lt!425874)) (bvslt (x!81259 lt!425874) #b01111111111111111111111111111110) (bvsge (x!81259 lt!425874) #b00000000000000000000000000000000) (bvsge (x!81259 lt!425874) #b00000000000000000000000000000000)))))

(assert (=> b!945571 (=> (not res!634997) (not e!531886))))

(declare-fun b!945572 () Bool)

(declare-fun e!531882 () SeekEntryResult!9085)

(assert (=> b!945572 (= e!531882 (Intermediate!9085 false (toIndex!0 key!756 (mask!27366 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!945573 () Bool)

(assert (=> b!945573 (= e!531885 (bvsge (x!81259 lt!425874) #b01111111111111111111111111111110))))

(declare-fun b!945574 () Bool)

(assert (=> b!945574 (= e!531883 e!531882)))

(declare-fun c!98410 () Bool)

(declare-fun lt!425875 () (_ BitVec 64))

(assert (=> b!945574 (= c!98410 (or (= lt!425875 key!756) (= (bvadd lt!425875 lt!425875) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!945575 () Bool)

(assert (=> b!945575 (and (bvsge (index!38713 lt!425874) #b00000000000000000000000000000000) (bvslt (index!38713 lt!425874) (size!27980 (_keys!10576 thiss!1141))))))

(declare-fun e!531884 () Bool)

(assert (=> b!945575 (= e!531884 (= (select (arr!27510 (_keys!10576 thiss!1141)) (index!38713 lt!425874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!945576 () Bool)

(assert (=> b!945576 (= e!531882 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27366 thiss!1141)) #b00000000000000000000000000000000 (mask!27366 thiss!1141)) key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)))))

(declare-fun b!945577 () Bool)

(assert (=> b!945577 (and (bvsge (index!38713 lt!425874) #b00000000000000000000000000000000) (bvslt (index!38713 lt!425874) (size!27980 (_keys!10576 thiss!1141))))))

(declare-fun res!634998 () Bool)

(assert (=> b!945577 (= res!634998 (= (select (arr!27510 (_keys!10576 thiss!1141)) (index!38713 lt!425874)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945577 (=> res!634998 e!531884)))

(declare-fun d!114245 () Bool)

(assert (=> d!114245 e!531885))

(declare-fun c!98411 () Bool)

(assert (=> d!114245 (= c!98411 (and ((_ is Intermediate!9085) lt!425874) (undefined!9897 lt!425874)))))

(assert (=> d!114245 (= lt!425874 e!531883)))

(declare-fun c!98412 () Bool)

(assert (=> d!114245 (= c!98412 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114245 (= lt!425875 (select (arr!27510 (_keys!10576 thiss!1141)) (toIndex!0 key!756 (mask!27366 thiss!1141))))))

(assert (=> d!114245 (validMask!0 (mask!27366 thiss!1141))))

(assert (=> d!114245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27366 thiss!1141)) key!756 (_keys!10576 thiss!1141) (mask!27366 thiss!1141)) lt!425874)))

(declare-fun b!945570 () Bool)

(assert (=> b!945570 (and (bvsge (index!38713 lt!425874) #b00000000000000000000000000000000) (bvslt (index!38713 lt!425874) (size!27980 (_keys!10576 thiss!1141))))))

(declare-fun res!634999 () Bool)

(assert (=> b!945570 (= res!634999 (= (select (arr!27510 (_keys!10576 thiss!1141)) (index!38713 lt!425874)) key!756))))

(assert (=> b!945570 (=> res!634999 e!531884)))

(assert (=> b!945570 (= e!531886 e!531884)))

(assert (= (and d!114245 c!98412) b!945569))

(assert (= (and d!114245 (not c!98412)) b!945574))

(assert (= (and b!945574 c!98410) b!945572))

(assert (= (and b!945574 (not c!98410)) b!945576))

(assert (= (and d!114245 c!98411) b!945573))

(assert (= (and d!114245 (not c!98411)) b!945571))

(assert (= (and b!945571 res!634997) b!945570))

(assert (= (and b!945570 (not res!634999)) b!945577))

(assert (= (and b!945577 (not res!634998)) b!945575))

(assert (=> b!945576 m!878647))

(declare-fun m!878693 () Bool)

(assert (=> b!945576 m!878693))

(assert (=> b!945576 m!878693))

(declare-fun m!878695 () Bool)

(assert (=> b!945576 m!878695))

(assert (=> d!114245 m!878647))

(declare-fun m!878697 () Bool)

(assert (=> d!114245 m!878697))

(assert (=> d!114245 m!878651))

(declare-fun m!878699 () Bool)

(assert (=> b!945575 m!878699))

(assert (=> b!945577 m!878699))

(assert (=> b!945570 m!878699))

(assert (=> d!114227 d!114245))

(declare-fun d!114247 () Bool)

(declare-fun lt!425881 () (_ BitVec 32))

(declare-fun lt!425880 () (_ BitVec 32))

(assert (=> d!114247 (= lt!425881 (bvmul (bvxor lt!425880 (bvlshr lt!425880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114247 (= lt!425880 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114247 (and (bvsge (mask!27366 thiss!1141) #b00000000000000000000000000000000) (let ((res!635000 (let ((h!20446 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81278 (bvmul (bvxor h!20446 (bvlshr h!20446 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81278 (bvlshr x!81278 #b00000000000000000000000000001101)) (mask!27366 thiss!1141)))))) (and (bvslt res!635000 (bvadd (mask!27366 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635000 #b00000000000000000000000000000000))))))

(assert (=> d!114247 (= (toIndex!0 key!756 (mask!27366 thiss!1141)) (bvand (bvxor lt!425881 (bvlshr lt!425881 #b00000000000000000000000000001101)) (mask!27366 thiss!1141)))))

(assert (=> d!114227 d!114247))

(declare-fun d!114249 () Bool)

(assert (=> d!114249 (= (validMask!0 (mask!27366 thiss!1141)) (and (or (= (mask!27366 thiss!1141) #b00000000000000000000000000000111) (= (mask!27366 thiss!1141) #b00000000000000000000000000001111) (= (mask!27366 thiss!1141) #b00000000000000000000000000011111) (= (mask!27366 thiss!1141) #b00000000000000000000000000111111) (= (mask!27366 thiss!1141) #b00000000000000000000000001111111) (= (mask!27366 thiss!1141) #b00000000000000000000000011111111) (= (mask!27366 thiss!1141) #b00000000000000000000000111111111) (= (mask!27366 thiss!1141) #b00000000000000000000001111111111) (= (mask!27366 thiss!1141) #b00000000000000000000011111111111) (= (mask!27366 thiss!1141) #b00000000000000000000111111111111) (= (mask!27366 thiss!1141) #b00000000000000000001111111111111) (= (mask!27366 thiss!1141) #b00000000000000000011111111111111) (= (mask!27366 thiss!1141) #b00000000000000000111111111111111) (= (mask!27366 thiss!1141) #b00000000000000001111111111111111) (= (mask!27366 thiss!1141) #b00000000000000011111111111111111) (= (mask!27366 thiss!1141) #b00000000000000111111111111111111) (= (mask!27366 thiss!1141) #b00000000000001111111111111111111) (= (mask!27366 thiss!1141) #b00000000000011111111111111111111) (= (mask!27366 thiss!1141) #b00000000000111111111111111111111) (= (mask!27366 thiss!1141) #b00000000001111111111111111111111) (= (mask!27366 thiss!1141) #b00000000011111111111111111111111) (= (mask!27366 thiss!1141) #b00000000111111111111111111111111) (= (mask!27366 thiss!1141) #b00000001111111111111111111111111) (= (mask!27366 thiss!1141) #b00000011111111111111111111111111) (= (mask!27366 thiss!1141) #b00000111111111111111111111111111) (= (mask!27366 thiss!1141) #b00001111111111111111111111111111) (= (mask!27366 thiss!1141) #b00011111111111111111111111111111) (= (mask!27366 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27366 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> d!114227 d!114249))

(declare-fun condMapEmpty!32775 () Bool)

(declare-fun mapDefault!32775 () ValueCell!9827)

(assert (=> mapNonEmpty!32774 (= condMapEmpty!32775 (= mapRest!32774 ((as const (Array (_ BitVec 32) ValueCell!9827)) mapDefault!32775)))))

(declare-fun e!531887 () Bool)

(declare-fun mapRes!32775 () Bool)

(assert (=> mapNonEmpty!32774 (= tp!62867 (and e!531887 mapRes!32775))))

(declare-fun b!945578 () Bool)

(declare-fun e!531888 () Bool)

(assert (=> b!945578 (= e!531888 tp_is_empty!20617)))

(declare-fun mapIsEmpty!32775 () Bool)

(assert (=> mapIsEmpty!32775 mapRes!32775))

(declare-fun mapNonEmpty!32775 () Bool)

(declare-fun tp!62868 () Bool)

(assert (=> mapNonEmpty!32775 (= mapRes!32775 (and tp!62868 e!531888))))

(declare-fun mapRest!32775 () (Array (_ BitVec 32) ValueCell!9827))

(declare-fun mapKey!32775 () (_ BitVec 32))

(declare-fun mapValue!32775 () ValueCell!9827)

(assert (=> mapNonEmpty!32775 (= mapRest!32774 (store mapRest!32775 mapKey!32775 mapValue!32775))))

(declare-fun b!945579 () Bool)

(assert (=> b!945579 (= e!531887 tp_is_empty!20617)))

(assert (= (and mapNonEmpty!32774 condMapEmpty!32775) mapIsEmpty!32775))

(assert (= (and mapNonEmpty!32774 (not condMapEmpty!32775)) mapNonEmpty!32775))

(assert (= (and mapNonEmpty!32775 ((_ is ValueCellFull!9827) mapValue!32775)) b!945578))

(assert (= (and mapNonEmpty!32774 ((_ is ValueCellFull!9827) mapDefault!32775)) b!945579))

(declare-fun m!878701 () Bool)

(assert (=> mapNonEmpty!32775 m!878701))

(check-sat (not b!945537) (not b!945504) tp_is_empty!20617 (not bm!41035) (not b!945548) (not b!945576) (not d!114239) (not b!945503) (not d!114245) (not bm!41038) (not b!945522) (not mapNonEmpty!32775) (not b!945549) (not bm!41032) (not b!945534) (not d!114237) b_and!29505 (not b!945490) (not b!945538) (not b_next!18109))
(check-sat b_and!29505 (not b_next!18109))
