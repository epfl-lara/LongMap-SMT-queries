; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80122 () Bool)

(assert start!80122)

(declare-fun b!941673 () Bool)

(declare-fun b_free!17919 () Bool)

(declare-fun b_next!17919 () Bool)

(assert (=> b!941673 (= b_free!17919 (not b_next!17919))))

(declare-fun tp!62242 () Bool)

(declare-fun b_and!29331 () Bool)

(assert (=> b!941673 (= tp!62242 b_and!29331)))

(declare-fun res!632969 () Bool)

(declare-fun e!529411 () Bool)

(assert (=> start!80122 (=> (not res!632969) (not e!529411))))

(declare-datatypes ((V!32201 0))(
  ( (V!32202 (val!10264 Int)) )
))
(declare-datatypes ((ValueCell!9732 0))(
  ( (ValueCellFull!9732 (v!12795 V!32201)) (EmptyCell!9732) )
))
(declare-datatypes ((array!56808 0))(
  ( (array!56809 (arr!27336 (Array (_ BitVec 32) ValueCell!9732)) (size!27799 (_ BitVec 32))) )
))
(declare-datatypes ((array!56810 0))(
  ( (array!56811 (arr!27337 (Array (_ BitVec 32) (_ BitVec 64))) (size!27800 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4614 0))(
  ( (LongMapFixedSize!4615 (defaultEntry!5598 Int) (mask!27175 (_ BitVec 32)) (extraKeys!5330 (_ BitVec 32)) (zeroValue!5434 V!32201) (minValue!5434 V!32201) (_size!2362 (_ BitVec 32)) (_keys!10457 array!56810) (_values!5621 array!56808) (_vacant!2362 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4614)

(declare-fun valid!1767 (LongMapFixedSize!4614) Bool)

(assert (=> start!80122 (= res!632969 (valid!1767 thiss!1141))))

(assert (=> start!80122 e!529411))

(declare-fun e!529412 () Bool)

(assert (=> start!80122 e!529412))

(assert (=> start!80122 true))

(declare-fun b!941667 () Bool)

(declare-fun res!632967 () Bool)

(assert (=> b!941667 (=> (not res!632967) (not e!529411))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9023 0))(
  ( (MissingZero!9023 (index!38463 (_ BitVec 32))) (Found!9023 (index!38464 (_ BitVec 32))) (Intermediate!9023 (undefined!9835 Bool) (index!38465 (_ BitVec 32)) (x!80814 (_ BitVec 32))) (Undefined!9023) (MissingVacant!9023 (index!38466 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56810 (_ BitVec 32)) SeekEntryResult!9023)

(assert (=> b!941667 (= res!632967 (not ((_ is Found!9023) (seekEntry!0 key!756 (_keys!10457 thiss!1141) (mask!27175 thiss!1141)))))))

(declare-fun b!941668 () Bool)

(declare-fun e!529414 () Bool)

(declare-fun e!529410 () Bool)

(declare-fun mapRes!32442 () Bool)

(assert (=> b!941668 (= e!529414 (and e!529410 mapRes!32442))))

(declare-fun condMapEmpty!32442 () Bool)

(declare-fun mapDefault!32442 () ValueCell!9732)

(assert (=> b!941668 (= condMapEmpty!32442 (= (arr!27336 (_values!5621 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9732)) mapDefault!32442)))))

(declare-fun mapIsEmpty!32442 () Bool)

(assert (=> mapIsEmpty!32442 mapRes!32442))

(declare-fun b!941669 () Bool)

(declare-fun res!632970 () Bool)

(assert (=> b!941669 (=> (not res!632970) (not e!529411))))

(assert (=> b!941669 (= res!632970 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941670 () Bool)

(declare-fun e!529413 () Bool)

(declare-fun tp_is_empty!20427 () Bool)

(assert (=> b!941670 (= e!529413 tp_is_empty!20427)))

(declare-fun mapNonEmpty!32442 () Bool)

(declare-fun tp!62243 () Bool)

(assert (=> mapNonEmpty!32442 (= mapRes!32442 (and tp!62243 e!529413))))

(declare-fun mapKey!32442 () (_ BitVec 32))

(declare-fun mapRest!32442 () (Array (_ BitVec 32) ValueCell!9732))

(declare-fun mapValue!32442 () ValueCell!9732)

(assert (=> mapNonEmpty!32442 (= (arr!27336 (_values!5621 thiss!1141)) (store mapRest!32442 mapKey!32442 mapValue!32442))))

(declare-fun b!941671 () Bool)

(declare-fun res!632968 () Bool)

(assert (=> b!941671 (=> (not res!632968) (not e!529411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941671 (= res!632968 (validMask!0 (mask!27175 thiss!1141)))))

(declare-fun b!941672 () Bool)

(assert (=> b!941672 (= e!529411 (and (= (size!27799 (_values!5621 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27175 thiss!1141))) (= (size!27800 (_keys!10457 thiss!1141)) (size!27799 (_values!5621 thiss!1141))) (bvslt (mask!27175 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun array_inv!21242 (array!56810) Bool)

(declare-fun array_inv!21243 (array!56808) Bool)

(assert (=> b!941673 (= e!529412 (and tp!62242 tp_is_empty!20427 (array_inv!21242 (_keys!10457 thiss!1141)) (array_inv!21243 (_values!5621 thiss!1141)) e!529414))))

(declare-fun b!941674 () Bool)

(assert (=> b!941674 (= e!529410 tp_is_empty!20427)))

(assert (= (and start!80122 res!632969) b!941669))

(assert (= (and b!941669 res!632970) b!941667))

(assert (= (and b!941667 res!632967) b!941671))

(assert (= (and b!941671 res!632968) b!941672))

(assert (= (and b!941668 condMapEmpty!32442) mapIsEmpty!32442))

(assert (= (and b!941668 (not condMapEmpty!32442)) mapNonEmpty!32442))

(assert (= (and mapNonEmpty!32442 ((_ is ValueCellFull!9732) mapValue!32442)) b!941670))

(assert (= (and b!941668 ((_ is ValueCellFull!9732) mapDefault!32442)) b!941674))

(assert (= b!941673 b!941668))

(assert (= start!80122 b!941673))

(declare-fun m!876635 () Bool)

(assert (=> b!941673 m!876635))

(declare-fun m!876637 () Bool)

(assert (=> b!941673 m!876637))

(declare-fun m!876639 () Bool)

(assert (=> b!941667 m!876639))

(declare-fun m!876641 () Bool)

(assert (=> mapNonEmpty!32442 m!876641))

(declare-fun m!876643 () Bool)

(assert (=> start!80122 m!876643))

(declare-fun m!876645 () Bool)

(assert (=> b!941671 m!876645))

(check-sat tp_is_empty!20427 (not b!941671) (not b_next!17919) (not mapNonEmpty!32442) (not start!80122) (not b!941667) b_and!29331 (not b!941673))
(check-sat b_and!29331 (not b_next!17919))
(get-model)

(declare-fun d!114095 () Bool)

(declare-fun res!632989 () Bool)

(declare-fun e!529436 () Bool)

(assert (=> d!114095 (=> (not res!632989) (not e!529436))))

(declare-fun simpleValid!342 (LongMapFixedSize!4614) Bool)

(assert (=> d!114095 (= res!632989 (simpleValid!342 thiss!1141))))

(assert (=> d!114095 (= (valid!1767 thiss!1141) e!529436)))

(declare-fun b!941705 () Bool)

(declare-fun res!632990 () Bool)

(assert (=> b!941705 (=> (not res!632990) (not e!529436))))

(declare-fun arrayCountValidKeys!0 (array!56810 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!941705 (= res!632990 (= (arrayCountValidKeys!0 (_keys!10457 thiss!1141) #b00000000000000000000000000000000 (size!27800 (_keys!10457 thiss!1141))) (_size!2362 thiss!1141)))))

(declare-fun b!941706 () Bool)

(declare-fun res!632991 () Bool)

(assert (=> b!941706 (=> (not res!632991) (not e!529436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56810 (_ BitVec 32)) Bool)

(assert (=> b!941706 (= res!632991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10457 thiss!1141) (mask!27175 thiss!1141)))))

(declare-fun b!941707 () Bool)

(declare-datatypes ((List!19207 0))(
  ( (Nil!19204) (Cons!19203 (h!20351 (_ BitVec 64)) (t!27522 List!19207)) )
))
(declare-fun arrayNoDuplicates!0 (array!56810 (_ BitVec 32) List!19207) Bool)

(assert (=> b!941707 (= e!529436 (arrayNoDuplicates!0 (_keys!10457 thiss!1141) #b00000000000000000000000000000000 Nil!19204))))

(assert (= (and d!114095 res!632989) b!941705))

(assert (= (and b!941705 res!632990) b!941706))

(assert (= (and b!941706 res!632991) b!941707))

(declare-fun m!876659 () Bool)

(assert (=> d!114095 m!876659))

(declare-fun m!876661 () Bool)

(assert (=> b!941705 m!876661))

(declare-fun m!876663 () Bool)

(assert (=> b!941706 m!876663))

(declare-fun m!876665 () Bool)

(assert (=> b!941707 m!876665))

(assert (=> start!80122 d!114095))

(declare-fun d!114097 () Bool)

(assert (=> d!114097 (= (array_inv!21242 (_keys!10457 thiss!1141)) (bvsge (size!27800 (_keys!10457 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941673 d!114097))

(declare-fun d!114099 () Bool)

(assert (=> d!114099 (= (array_inv!21243 (_values!5621 thiss!1141)) (bvsge (size!27799 (_values!5621 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!941673 d!114099))

(declare-fun d!114101 () Bool)

(assert (=> d!114101 (= (validMask!0 (mask!27175 thiss!1141)) (and (or (= (mask!27175 thiss!1141) #b00000000000000000000000000000111) (= (mask!27175 thiss!1141) #b00000000000000000000000000001111) (= (mask!27175 thiss!1141) #b00000000000000000000000000011111) (= (mask!27175 thiss!1141) #b00000000000000000000000000111111) (= (mask!27175 thiss!1141) #b00000000000000000000000001111111) (= (mask!27175 thiss!1141) #b00000000000000000000000011111111) (= (mask!27175 thiss!1141) #b00000000000000000000000111111111) (= (mask!27175 thiss!1141) #b00000000000000000000001111111111) (= (mask!27175 thiss!1141) #b00000000000000000000011111111111) (= (mask!27175 thiss!1141) #b00000000000000000000111111111111) (= (mask!27175 thiss!1141) #b00000000000000000001111111111111) (= (mask!27175 thiss!1141) #b00000000000000000011111111111111) (= (mask!27175 thiss!1141) #b00000000000000000111111111111111) (= (mask!27175 thiss!1141) #b00000000000000001111111111111111) (= (mask!27175 thiss!1141) #b00000000000000011111111111111111) (= (mask!27175 thiss!1141) #b00000000000000111111111111111111) (= (mask!27175 thiss!1141) #b00000000000001111111111111111111) (= (mask!27175 thiss!1141) #b00000000000011111111111111111111) (= (mask!27175 thiss!1141) #b00000000000111111111111111111111) (= (mask!27175 thiss!1141) #b00000000001111111111111111111111) (= (mask!27175 thiss!1141) #b00000000011111111111111111111111) (= (mask!27175 thiss!1141) #b00000000111111111111111111111111) (= (mask!27175 thiss!1141) #b00000001111111111111111111111111) (= (mask!27175 thiss!1141) #b00000011111111111111111111111111) (= (mask!27175 thiss!1141) #b00000111111111111111111111111111) (= (mask!27175 thiss!1141) #b00001111111111111111111111111111) (= (mask!27175 thiss!1141) #b00011111111111111111111111111111) (= (mask!27175 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27175 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!941671 d!114101))

(declare-fun b!941720 () Bool)

(declare-fun c!98120 () Bool)

(declare-fun lt!425028 () (_ BitVec 64))

(assert (=> b!941720 (= c!98120 (= lt!425028 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529443 () SeekEntryResult!9023)

(declare-fun e!529445 () SeekEntryResult!9023)

(assert (=> b!941720 (= e!529443 e!529445)))

(declare-fun d!114103 () Bool)

(declare-fun lt!425027 () SeekEntryResult!9023)

(assert (=> d!114103 (and (or ((_ is MissingVacant!9023) lt!425027) (not ((_ is Found!9023) lt!425027)) (and (bvsge (index!38464 lt!425027) #b00000000000000000000000000000000) (bvslt (index!38464 lt!425027) (size!27800 (_keys!10457 thiss!1141))))) (not ((_ is MissingVacant!9023) lt!425027)) (or (not ((_ is Found!9023) lt!425027)) (= (select (arr!27337 (_keys!10457 thiss!1141)) (index!38464 lt!425027)) key!756)))))

(declare-fun e!529444 () SeekEntryResult!9023)

(assert (=> d!114103 (= lt!425027 e!529444)))

(declare-fun c!98122 () Bool)

(declare-fun lt!425026 () SeekEntryResult!9023)

(assert (=> d!114103 (= c!98122 (and ((_ is Intermediate!9023) lt!425026) (undefined!9835 lt!425026)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56810 (_ BitVec 32)) SeekEntryResult!9023)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114103 (= lt!425026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27175 thiss!1141)) key!756 (_keys!10457 thiss!1141) (mask!27175 thiss!1141)))))

(assert (=> d!114103 (validMask!0 (mask!27175 thiss!1141))))

(assert (=> d!114103 (= (seekEntry!0 key!756 (_keys!10457 thiss!1141) (mask!27175 thiss!1141)) lt!425027)))

(declare-fun b!941721 () Bool)

(assert (=> b!941721 (= e!529444 Undefined!9023)))

(declare-fun b!941722 () Bool)

(declare-fun lt!425029 () SeekEntryResult!9023)

(assert (=> b!941722 (= e!529445 (ite ((_ is MissingVacant!9023) lt!425029) (MissingZero!9023 (index!38466 lt!425029)) lt!425029))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56810 (_ BitVec 32)) SeekEntryResult!9023)

(assert (=> b!941722 (= lt!425029 (seekKeyOrZeroReturnVacant!0 (x!80814 lt!425026) (index!38465 lt!425026) (index!38465 lt!425026) key!756 (_keys!10457 thiss!1141) (mask!27175 thiss!1141)))))

(declare-fun b!941723 () Bool)

(assert (=> b!941723 (= e!529444 e!529443)))

(assert (=> b!941723 (= lt!425028 (select (arr!27337 (_keys!10457 thiss!1141)) (index!38465 lt!425026)))))

(declare-fun c!98121 () Bool)

(assert (=> b!941723 (= c!98121 (= lt!425028 key!756))))

(declare-fun b!941724 () Bool)

(assert (=> b!941724 (= e!529445 (MissingZero!9023 (index!38465 lt!425026)))))

(declare-fun b!941725 () Bool)

(assert (=> b!941725 (= e!529443 (Found!9023 (index!38465 lt!425026)))))

(assert (= (and d!114103 c!98122) b!941721))

(assert (= (and d!114103 (not c!98122)) b!941723))

(assert (= (and b!941723 c!98121) b!941725))

(assert (= (and b!941723 (not c!98121)) b!941720))

(assert (= (and b!941720 c!98120) b!941724))

(assert (= (and b!941720 (not c!98120)) b!941722))

(declare-fun m!876667 () Bool)

(assert (=> d!114103 m!876667))

(declare-fun m!876669 () Bool)

(assert (=> d!114103 m!876669))

(assert (=> d!114103 m!876669))

(declare-fun m!876671 () Bool)

(assert (=> d!114103 m!876671))

(assert (=> d!114103 m!876645))

(declare-fun m!876673 () Bool)

(assert (=> b!941722 m!876673))

(declare-fun m!876675 () Bool)

(assert (=> b!941723 m!876675))

(assert (=> b!941667 d!114103))

(declare-fun b!941732 () Bool)

(declare-fun e!529450 () Bool)

(assert (=> b!941732 (= e!529450 tp_is_empty!20427)))

(declare-fun mapNonEmpty!32448 () Bool)

(declare-fun mapRes!32448 () Bool)

(declare-fun tp!62252 () Bool)

(assert (=> mapNonEmpty!32448 (= mapRes!32448 (and tp!62252 e!529450))))

(declare-fun mapRest!32448 () (Array (_ BitVec 32) ValueCell!9732))

(declare-fun mapValue!32448 () ValueCell!9732)

(declare-fun mapKey!32448 () (_ BitVec 32))

(assert (=> mapNonEmpty!32448 (= mapRest!32442 (store mapRest!32448 mapKey!32448 mapValue!32448))))

(declare-fun b!941733 () Bool)

(declare-fun e!529451 () Bool)

(assert (=> b!941733 (= e!529451 tp_is_empty!20427)))

(declare-fun mapIsEmpty!32448 () Bool)

(assert (=> mapIsEmpty!32448 mapRes!32448))

(declare-fun condMapEmpty!32448 () Bool)

(declare-fun mapDefault!32448 () ValueCell!9732)

(assert (=> mapNonEmpty!32442 (= condMapEmpty!32448 (= mapRest!32442 ((as const (Array (_ BitVec 32) ValueCell!9732)) mapDefault!32448)))))

(assert (=> mapNonEmpty!32442 (= tp!62243 (and e!529451 mapRes!32448))))

(assert (= (and mapNonEmpty!32442 condMapEmpty!32448) mapIsEmpty!32448))

(assert (= (and mapNonEmpty!32442 (not condMapEmpty!32448)) mapNonEmpty!32448))

(assert (= (and mapNonEmpty!32448 ((_ is ValueCellFull!9732) mapValue!32448)) b!941732))

(assert (= (and mapNonEmpty!32442 ((_ is ValueCellFull!9732) mapDefault!32448)) b!941733))

(declare-fun m!876677 () Bool)

(assert (=> mapNonEmpty!32448 m!876677))

(check-sat b_and!29331 tp_is_empty!20427 (not mapNonEmpty!32448) (not b_next!17919) (not b!941706) (not d!114103) (not b!941722) (not b!941707) (not b!941705) (not d!114095))
(check-sat b_and!29331 (not b_next!17919))
