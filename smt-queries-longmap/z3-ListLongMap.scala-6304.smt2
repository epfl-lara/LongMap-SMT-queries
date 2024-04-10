; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80698 () Bool)

(assert start!80698)

(declare-fun b!946612 () Bool)

(declare-fun b_free!18147 () Bool)

(declare-fun b_next!18147 () Bool)

(assert (=> b!946612 (= b_free!18147 (not b_next!18147))))

(declare-fun tp!62986 () Bool)

(declare-fun b_and!29569 () Bool)

(assert (=> b!946612 (= tp!62986 b_and!29569)))

(declare-fun b!946606 () Bool)

(declare-fun e!532656 () Bool)

(declare-fun e!532661 () Bool)

(declare-fun mapRes!32843 () Bool)

(assert (=> b!946606 (= e!532656 (and e!532661 mapRes!32843))))

(declare-fun condMapEmpty!32843 () Bool)

(declare-datatypes ((V!32505 0))(
  ( (V!32506 (val!10378 Int)) )
))
(declare-datatypes ((ValueCell!9846 0))(
  ( (ValueCellFull!9846 (v!12912 V!32505)) (EmptyCell!9846) )
))
(declare-datatypes ((array!57298 0))(
  ( (array!57299 (arr!27564 (Array (_ BitVec 32) ValueCell!9846)) (size!28035 (_ BitVec 32))) )
))
(declare-datatypes ((array!57300 0))(
  ( (array!57301 (arr!27565 (Array (_ BitVec 32) (_ BitVec 64))) (size!28036 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4842 0))(
  ( (LongMapFixedSize!4843 (defaultEntry!5718 Int) (mask!27427 (_ BitVec 32)) (extraKeys!5450 (_ BitVec 32)) (zeroValue!5554 V!32505) (minValue!5554 V!32505) (_size!2476 (_ BitVec 32)) (_keys!10615 array!57300) (_values!5741 array!57298) (_vacant!2476 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4842)

(declare-fun mapDefault!32843 () ValueCell!9846)

(assert (=> b!946606 (= condMapEmpty!32843 (= (arr!27564 (_values!5741 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9846)) mapDefault!32843)))))

(declare-fun b!946607 () Bool)

(declare-fun res!635446 () Bool)

(declare-fun e!532660 () Bool)

(assert (=> b!946607 (=> (not res!635446) (not e!532660))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946607 (= res!635446 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!946608 () Bool)

(declare-fun e!532662 () Bool)

(declare-fun tp_is_empty!20655 () Bool)

(assert (=> b!946608 (= e!532662 tp_is_empty!20655)))

(declare-fun mapIsEmpty!32843 () Bool)

(assert (=> mapIsEmpty!32843 mapRes!32843))

(declare-fun b!946609 () Bool)

(declare-fun e!532659 () Bool)

(assert (=> b!946609 (= e!532659 (or (not (= (size!28035 (_values!5741 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27427 thiss!1141)))) (not (= (size!28036 (_keys!10615 thiss!1141)) (size!28035 (_values!5741 thiss!1141)))) (bvslt (mask!27427 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5450 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!946610 () Bool)

(declare-fun e!532655 () Bool)

(assert (=> b!946610 (= e!532660 e!532655)))

(declare-fun res!635448 () Bool)

(assert (=> b!946610 (=> (not res!635448) (not e!532655))))

(declare-datatypes ((SeekEntryResult!9105 0))(
  ( (MissingZero!9105 (index!38791 (_ BitVec 32))) (Found!9105 (index!38792 (_ BitVec 32))) (Intermediate!9105 (undefined!9917 Bool) (index!38793 (_ BitVec 32)) (x!81407 (_ BitVec 32))) (Undefined!9105) (MissingVacant!9105 (index!38794 (_ BitVec 32))) )
))
(declare-fun lt!426341 () SeekEntryResult!9105)

(get-info :version)

(assert (=> b!946610 (= res!635448 ((_ is Found!9105) lt!426341))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57300 (_ BitVec 32)) SeekEntryResult!9105)

(assert (=> b!946610 (= lt!426341 (seekEntry!0 key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun e!532657 () Bool)

(declare-fun array_inv!21402 (array!57300) Bool)

(declare-fun array_inv!21403 (array!57298) Bool)

(assert (=> b!946612 (= e!532657 (and tp!62986 tp_is_empty!20655 (array_inv!21402 (_keys!10615 thiss!1141)) (array_inv!21403 (_values!5741 thiss!1141)) e!532656))))

(declare-fun b!946613 () Bool)

(assert (=> b!946613 (= e!532655 (not e!532659))))

(declare-fun res!635449 () Bool)

(assert (=> b!946613 (=> res!635449 e!532659)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946613 (= res!635449 (not (validMask!0 (mask!27427 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57300 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946613 (arrayContainsKey!0 (_keys!10615 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31908 0))(
  ( (Unit!31909) )
))
(declare-fun lt!426342 () Unit!31908)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57300 (_ BitVec 64) (_ BitVec 32)) Unit!31908)

(assert (=> b!946613 (= lt!426342 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10615 thiss!1141) key!756 (index!38792 lt!426341)))))

(declare-fun mapNonEmpty!32843 () Bool)

(declare-fun tp!62985 () Bool)

(assert (=> mapNonEmpty!32843 (= mapRes!32843 (and tp!62985 e!532662))))

(declare-fun mapRest!32843 () (Array (_ BitVec 32) ValueCell!9846))

(declare-fun mapValue!32843 () ValueCell!9846)

(declare-fun mapKey!32843 () (_ BitVec 32))

(assert (=> mapNonEmpty!32843 (= (arr!27564 (_values!5741 thiss!1141)) (store mapRest!32843 mapKey!32843 mapValue!32843))))

(declare-fun b!946611 () Bool)

(assert (=> b!946611 (= e!532661 tp_is_empty!20655)))

(declare-fun res!635447 () Bool)

(assert (=> start!80698 (=> (not res!635447) (not e!532660))))

(declare-fun valid!1845 (LongMapFixedSize!4842) Bool)

(assert (=> start!80698 (= res!635447 (valid!1845 thiss!1141))))

(assert (=> start!80698 e!532660))

(assert (=> start!80698 e!532657))

(assert (=> start!80698 true))

(assert (= (and start!80698 res!635447) b!946607))

(assert (= (and b!946607 res!635446) b!946610))

(assert (= (and b!946610 res!635448) b!946613))

(assert (= (and b!946613 (not res!635449)) b!946609))

(assert (= (and b!946606 condMapEmpty!32843) mapIsEmpty!32843))

(assert (= (and b!946606 (not condMapEmpty!32843)) mapNonEmpty!32843))

(assert (= (and mapNonEmpty!32843 ((_ is ValueCellFull!9846) mapValue!32843)) b!946608))

(assert (= (and b!946606 ((_ is ValueCellFull!9846) mapDefault!32843)) b!946611))

(assert (= b!946612 b!946606))

(assert (= start!80698 b!946612))

(declare-fun m!879915 () Bool)

(assert (=> b!946613 m!879915))

(declare-fun m!879917 () Bool)

(assert (=> b!946613 m!879917))

(declare-fun m!879919 () Bool)

(assert (=> b!946613 m!879919))

(declare-fun m!879921 () Bool)

(assert (=> mapNonEmpty!32843 m!879921))

(declare-fun m!879923 () Bool)

(assert (=> b!946612 m!879923))

(declare-fun m!879925 () Bool)

(assert (=> b!946612 m!879925))

(declare-fun m!879927 () Bool)

(assert (=> start!80698 m!879927))

(declare-fun m!879929 () Bool)

(assert (=> b!946610 m!879929))

(check-sat b_and!29569 (not b!946610) tp_is_empty!20655 (not b_next!18147) (not mapNonEmpty!32843) (not b!946613) (not b!946612) (not start!80698))
(check-sat b_and!29569 (not b_next!18147))
(get-model)

(declare-fun b!946650 () Bool)

(declare-fun c!98589 () Bool)

(declare-fun lt!426360 () (_ BitVec 64))

(assert (=> b!946650 (= c!98589 (= lt!426360 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532695 () SeekEntryResult!9105)

(declare-fun e!532694 () SeekEntryResult!9105)

(assert (=> b!946650 (= e!532695 e!532694)))

(declare-fun b!946652 () Bool)

(declare-fun e!532693 () SeekEntryResult!9105)

(assert (=> b!946652 (= e!532693 Undefined!9105)))

(declare-fun b!946653 () Bool)

(declare-fun lt!426358 () SeekEntryResult!9105)

(assert (=> b!946653 (= e!532694 (MissingZero!9105 (index!38793 lt!426358)))))

(declare-fun b!946654 () Bool)

(assert (=> b!946654 (= e!532693 e!532695)))

(assert (=> b!946654 (= lt!426360 (select (arr!27565 (_keys!10615 thiss!1141)) (index!38793 lt!426358)))))

(declare-fun c!98591 () Bool)

(assert (=> b!946654 (= c!98591 (= lt!426360 key!756))))

(declare-fun b!946655 () Bool)

(assert (=> b!946655 (= e!532695 (Found!9105 (index!38793 lt!426358)))))

(declare-fun b!946651 () Bool)

(declare-fun lt!426357 () SeekEntryResult!9105)

(assert (=> b!946651 (= e!532694 (ite ((_ is MissingVacant!9105) lt!426357) (MissingZero!9105 (index!38794 lt!426357)) lt!426357))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57300 (_ BitVec 32)) SeekEntryResult!9105)

(assert (=> b!946651 (= lt!426357 (seekKeyOrZeroReturnVacant!0 (x!81407 lt!426358) (index!38793 lt!426358) (index!38793 lt!426358) key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun d!114563 () Bool)

(declare-fun lt!426359 () SeekEntryResult!9105)

(assert (=> d!114563 (and (or ((_ is MissingVacant!9105) lt!426359) (not ((_ is Found!9105) lt!426359)) (and (bvsge (index!38792 lt!426359) #b00000000000000000000000000000000) (bvslt (index!38792 lt!426359) (size!28036 (_keys!10615 thiss!1141))))) (not ((_ is MissingVacant!9105) lt!426359)) (or (not ((_ is Found!9105) lt!426359)) (= (select (arr!27565 (_keys!10615 thiss!1141)) (index!38792 lt!426359)) key!756)))))

(assert (=> d!114563 (= lt!426359 e!532693)))

(declare-fun c!98590 () Bool)

(assert (=> d!114563 (= c!98590 (and ((_ is Intermediate!9105) lt!426358) (undefined!9917 lt!426358)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57300 (_ BitVec 32)) SeekEntryResult!9105)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114563 (= lt!426358 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27427 thiss!1141)) key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)))))

(assert (=> d!114563 (validMask!0 (mask!27427 thiss!1141))))

(assert (=> d!114563 (= (seekEntry!0 key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)) lt!426359)))

(assert (= (and d!114563 c!98590) b!946652))

(assert (= (and d!114563 (not c!98590)) b!946654))

(assert (= (and b!946654 c!98591) b!946655))

(assert (= (and b!946654 (not c!98591)) b!946650))

(assert (= (and b!946650 c!98589) b!946653))

(assert (= (and b!946650 (not c!98589)) b!946651))

(declare-fun m!879947 () Bool)

(assert (=> b!946654 m!879947))

(declare-fun m!879949 () Bool)

(assert (=> b!946651 m!879949))

(declare-fun m!879951 () Bool)

(assert (=> d!114563 m!879951))

(declare-fun m!879953 () Bool)

(assert (=> d!114563 m!879953))

(assert (=> d!114563 m!879953))

(declare-fun m!879955 () Bool)

(assert (=> d!114563 m!879955))

(assert (=> d!114563 m!879915))

(assert (=> b!946610 d!114563))

(declare-fun d!114565 () Bool)

(assert (=> d!114565 (= (array_inv!21402 (_keys!10615 thiss!1141)) (bvsge (size!28036 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946612 d!114565))

(declare-fun d!114567 () Bool)

(assert (=> d!114567 (= (array_inv!21403 (_values!5741 thiss!1141)) (bvsge (size!28035 (_values!5741 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946612 d!114567))

(declare-fun d!114569 () Bool)

(declare-fun res!635468 () Bool)

(declare-fun e!532698 () Bool)

(assert (=> d!114569 (=> (not res!635468) (not e!532698))))

(declare-fun simpleValid!359 (LongMapFixedSize!4842) Bool)

(assert (=> d!114569 (= res!635468 (simpleValid!359 thiss!1141))))

(assert (=> d!114569 (= (valid!1845 thiss!1141) e!532698)))

(declare-fun b!946662 () Bool)

(declare-fun res!635469 () Bool)

(assert (=> b!946662 (=> (not res!635469) (not e!532698))))

(declare-fun arrayCountValidKeys!0 (array!57300 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946662 (= res!635469 (= (arrayCountValidKeys!0 (_keys!10615 thiss!1141) #b00000000000000000000000000000000 (size!28036 (_keys!10615 thiss!1141))) (_size!2476 thiss!1141)))))

(declare-fun b!946663 () Bool)

(declare-fun res!635470 () Bool)

(assert (=> b!946663 (=> (not res!635470) (not e!532698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57300 (_ BitVec 32)) Bool)

(assert (=> b!946663 (= res!635470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun b!946664 () Bool)

(declare-datatypes ((List!19299 0))(
  ( (Nil!19296) (Cons!19295 (h!20449 (_ BitVec 64)) (t!27620 List!19299)) )
))
(declare-fun arrayNoDuplicates!0 (array!57300 (_ BitVec 32) List!19299) Bool)

(assert (=> b!946664 (= e!532698 (arrayNoDuplicates!0 (_keys!10615 thiss!1141) #b00000000000000000000000000000000 Nil!19296))))

(assert (= (and d!114569 res!635468) b!946662))

(assert (= (and b!946662 res!635469) b!946663))

(assert (= (and b!946663 res!635470) b!946664))

(declare-fun m!879957 () Bool)

(assert (=> d!114569 m!879957))

(declare-fun m!879959 () Bool)

(assert (=> b!946662 m!879959))

(declare-fun m!879961 () Bool)

(assert (=> b!946663 m!879961))

(declare-fun m!879963 () Bool)

(assert (=> b!946664 m!879963))

(assert (=> start!80698 d!114569))

(declare-fun d!114571 () Bool)

(assert (=> d!114571 (= (validMask!0 (mask!27427 thiss!1141)) (and (or (= (mask!27427 thiss!1141) #b00000000000000000000000000000111) (= (mask!27427 thiss!1141) #b00000000000000000000000000001111) (= (mask!27427 thiss!1141) #b00000000000000000000000000011111) (= (mask!27427 thiss!1141) #b00000000000000000000000000111111) (= (mask!27427 thiss!1141) #b00000000000000000000000001111111) (= (mask!27427 thiss!1141) #b00000000000000000000000011111111) (= (mask!27427 thiss!1141) #b00000000000000000000000111111111) (= (mask!27427 thiss!1141) #b00000000000000000000001111111111) (= (mask!27427 thiss!1141) #b00000000000000000000011111111111) (= (mask!27427 thiss!1141) #b00000000000000000000111111111111) (= (mask!27427 thiss!1141) #b00000000000000000001111111111111) (= (mask!27427 thiss!1141) #b00000000000000000011111111111111) (= (mask!27427 thiss!1141) #b00000000000000000111111111111111) (= (mask!27427 thiss!1141) #b00000000000000001111111111111111) (= (mask!27427 thiss!1141) #b00000000000000011111111111111111) (= (mask!27427 thiss!1141) #b00000000000000111111111111111111) (= (mask!27427 thiss!1141) #b00000000000001111111111111111111) (= (mask!27427 thiss!1141) #b00000000000011111111111111111111) (= (mask!27427 thiss!1141) #b00000000000111111111111111111111) (= (mask!27427 thiss!1141) #b00000000001111111111111111111111) (= (mask!27427 thiss!1141) #b00000000011111111111111111111111) (= (mask!27427 thiss!1141) #b00000000111111111111111111111111) (= (mask!27427 thiss!1141) #b00000001111111111111111111111111) (= (mask!27427 thiss!1141) #b00000011111111111111111111111111) (= (mask!27427 thiss!1141) #b00000111111111111111111111111111) (= (mask!27427 thiss!1141) #b00001111111111111111111111111111) (= (mask!27427 thiss!1141) #b00011111111111111111111111111111) (= (mask!27427 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27427 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946613 d!114571))

(declare-fun d!114573 () Bool)

(declare-fun res!635475 () Bool)

(declare-fun e!532703 () Bool)

(assert (=> d!114573 (=> res!635475 e!532703)))

(assert (=> d!114573 (= res!635475 (= (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114573 (= (arrayContainsKey!0 (_keys!10615 thiss!1141) key!756 #b00000000000000000000000000000000) e!532703)))

(declare-fun b!946669 () Bool)

(declare-fun e!532704 () Bool)

(assert (=> b!946669 (= e!532703 e!532704)))

(declare-fun res!635476 () Bool)

(assert (=> b!946669 (=> (not res!635476) (not e!532704))))

(assert (=> b!946669 (= res!635476 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28036 (_keys!10615 thiss!1141))))))

(declare-fun b!946670 () Bool)

(assert (=> b!946670 (= e!532704 (arrayContainsKey!0 (_keys!10615 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114573 (not res!635475)) b!946669))

(assert (= (and b!946669 res!635476) b!946670))

(declare-fun m!879965 () Bool)

(assert (=> d!114573 m!879965))

(declare-fun m!879967 () Bool)

(assert (=> b!946670 m!879967))

(assert (=> b!946613 d!114573))

(declare-fun d!114575 () Bool)

(assert (=> d!114575 (arrayContainsKey!0 (_keys!10615 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426363 () Unit!31908)

(declare-fun choose!13 (array!57300 (_ BitVec 64) (_ BitVec 32)) Unit!31908)

(assert (=> d!114575 (= lt!426363 (choose!13 (_keys!10615 thiss!1141) key!756 (index!38792 lt!426341)))))

(assert (=> d!114575 (bvsge (index!38792 lt!426341) #b00000000000000000000000000000000)))

(assert (=> d!114575 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10615 thiss!1141) key!756 (index!38792 lt!426341)) lt!426363)))

(declare-fun bs!26610 () Bool)

(assert (= bs!26610 d!114575))

(assert (=> bs!26610 m!879917))

(declare-fun m!879969 () Bool)

(assert (=> bs!26610 m!879969))

(assert (=> b!946613 d!114575))

(declare-fun mapNonEmpty!32849 () Bool)

(declare-fun mapRes!32849 () Bool)

(declare-fun tp!62995 () Bool)

(declare-fun e!532709 () Bool)

(assert (=> mapNonEmpty!32849 (= mapRes!32849 (and tp!62995 e!532709))))

(declare-fun mapValue!32849 () ValueCell!9846)

(declare-fun mapKey!32849 () (_ BitVec 32))

(declare-fun mapRest!32849 () (Array (_ BitVec 32) ValueCell!9846))

(assert (=> mapNonEmpty!32849 (= mapRest!32843 (store mapRest!32849 mapKey!32849 mapValue!32849))))

(declare-fun condMapEmpty!32849 () Bool)

(declare-fun mapDefault!32849 () ValueCell!9846)

(assert (=> mapNonEmpty!32843 (= condMapEmpty!32849 (= mapRest!32843 ((as const (Array (_ BitVec 32) ValueCell!9846)) mapDefault!32849)))))

(declare-fun e!532710 () Bool)

(assert (=> mapNonEmpty!32843 (= tp!62985 (and e!532710 mapRes!32849))))

(declare-fun mapIsEmpty!32849 () Bool)

(assert (=> mapIsEmpty!32849 mapRes!32849))

(declare-fun b!946678 () Bool)

(assert (=> b!946678 (= e!532710 tp_is_empty!20655)))

(declare-fun b!946677 () Bool)

(assert (=> b!946677 (= e!532709 tp_is_empty!20655)))

(assert (= (and mapNonEmpty!32843 condMapEmpty!32849) mapIsEmpty!32849))

(assert (= (and mapNonEmpty!32843 (not condMapEmpty!32849)) mapNonEmpty!32849))

(assert (= (and mapNonEmpty!32849 ((_ is ValueCellFull!9846) mapValue!32849)) b!946677))

(assert (= (and mapNonEmpty!32843 ((_ is ValueCellFull!9846) mapDefault!32849)) b!946678))

(declare-fun m!879971 () Bool)

(assert (=> mapNonEmpty!32849 m!879971))

(check-sat (not d!114575) (not b!946662) (not mapNonEmpty!32849) (not b!946663) tp_is_empty!20655 (not b_next!18147) (not d!114563) (not d!114569) (not b!946651) b_and!29569 (not b!946670) (not b!946664))
(check-sat b_and!29569 (not b_next!18147))
(get-model)

(assert (=> d!114575 d!114573))

(declare-fun d!114577 () Bool)

(assert (=> d!114577 (arrayContainsKey!0 (_keys!10615 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114577 true))

(declare-fun _$60!436 () Unit!31908)

(assert (=> d!114577 (= (choose!13 (_keys!10615 thiss!1141) key!756 (index!38792 lt!426341)) _$60!436)))

(declare-fun bs!26611 () Bool)

(assert (= bs!26611 d!114577))

(assert (=> bs!26611 m!879917))

(assert (=> d!114575 d!114577))

(declare-fun b!946697 () Bool)

(declare-fun e!532722 () Bool)

(declare-fun e!532723 () Bool)

(assert (=> b!946697 (= e!532722 e!532723)))

(declare-fun res!635485 () Bool)

(declare-fun lt!426369 () SeekEntryResult!9105)

(assert (=> b!946697 (= res!635485 (and ((_ is Intermediate!9105) lt!426369) (not (undefined!9917 lt!426369)) (bvslt (x!81407 lt!426369) #b01111111111111111111111111111110) (bvsge (x!81407 lt!426369) #b00000000000000000000000000000000) (bvsge (x!81407 lt!426369) #b00000000000000000000000000000000)))))

(assert (=> b!946697 (=> (not res!635485) (not e!532723))))

(declare-fun d!114579 () Bool)

(assert (=> d!114579 e!532722))

(declare-fun c!98600 () Bool)

(assert (=> d!114579 (= c!98600 (and ((_ is Intermediate!9105) lt!426369) (undefined!9917 lt!426369)))))

(declare-fun e!532724 () SeekEntryResult!9105)

(assert (=> d!114579 (= lt!426369 e!532724)))

(declare-fun c!98599 () Bool)

(assert (=> d!114579 (= c!98599 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!426368 () (_ BitVec 64))

(assert (=> d!114579 (= lt!426368 (select (arr!27565 (_keys!10615 thiss!1141)) (toIndex!0 key!756 (mask!27427 thiss!1141))))))

(assert (=> d!114579 (validMask!0 (mask!27427 thiss!1141))))

(assert (=> d!114579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27427 thiss!1141)) key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)) lt!426369)))

(declare-fun b!946698 () Bool)

(assert (=> b!946698 (= e!532722 (bvsge (x!81407 lt!426369) #b01111111111111111111111111111110))))

(declare-fun b!946699 () Bool)

(declare-fun e!532725 () SeekEntryResult!9105)

(assert (=> b!946699 (= e!532724 e!532725)))

(declare-fun c!98598 () Bool)

(assert (=> b!946699 (= c!98598 (or (= lt!426368 key!756) (= (bvadd lt!426368 lt!426368) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!946700 () Bool)

(assert (=> b!946700 (= e!532724 (Intermediate!9105 true (toIndex!0 key!756 (mask!27427 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946701 () Bool)

(assert (=> b!946701 (and (bvsge (index!38793 lt!426369) #b00000000000000000000000000000000) (bvslt (index!38793 lt!426369) (size!28036 (_keys!10615 thiss!1141))))))

(declare-fun res!635483 () Bool)

(assert (=> b!946701 (= res!635483 (= (select (arr!27565 (_keys!10615 thiss!1141)) (index!38793 lt!426369)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532721 () Bool)

(assert (=> b!946701 (=> res!635483 e!532721)))

(declare-fun b!946702 () Bool)

(assert (=> b!946702 (= e!532725 (Intermediate!9105 false (toIndex!0 key!756 (mask!27427 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!946703 () Bool)

(assert (=> b!946703 (and (bvsge (index!38793 lt!426369) #b00000000000000000000000000000000) (bvslt (index!38793 lt!426369) (size!28036 (_keys!10615 thiss!1141))))))

(declare-fun res!635484 () Bool)

(assert (=> b!946703 (= res!635484 (= (select (arr!27565 (_keys!10615 thiss!1141)) (index!38793 lt!426369)) key!756))))

(assert (=> b!946703 (=> res!635484 e!532721)))

(assert (=> b!946703 (= e!532723 e!532721)))

(declare-fun b!946704 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!946704 (= e!532725 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27427 thiss!1141)) #b00000000000000000000000000000000 (mask!27427 thiss!1141)) key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun b!946705 () Bool)

(assert (=> b!946705 (and (bvsge (index!38793 lt!426369) #b00000000000000000000000000000000) (bvslt (index!38793 lt!426369) (size!28036 (_keys!10615 thiss!1141))))))

(assert (=> b!946705 (= e!532721 (= (select (arr!27565 (_keys!10615 thiss!1141)) (index!38793 lt!426369)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!114579 c!98599) b!946700))

(assert (= (and d!114579 (not c!98599)) b!946699))

(assert (= (and b!946699 c!98598) b!946702))

(assert (= (and b!946699 (not c!98598)) b!946704))

(assert (= (and d!114579 c!98600) b!946698))

(assert (= (and d!114579 (not c!98600)) b!946697))

(assert (= (and b!946697 res!635485) b!946703))

(assert (= (and b!946703 (not res!635484)) b!946701))

(assert (= (and b!946701 (not res!635483)) b!946705))

(declare-fun m!879973 () Bool)

(assert (=> b!946705 m!879973))

(assert (=> b!946704 m!879953))

(declare-fun m!879975 () Bool)

(assert (=> b!946704 m!879975))

(assert (=> b!946704 m!879975))

(declare-fun m!879977 () Bool)

(assert (=> b!946704 m!879977))

(assert (=> d!114579 m!879953))

(declare-fun m!879979 () Bool)

(assert (=> d!114579 m!879979))

(assert (=> d!114579 m!879915))

(assert (=> b!946701 m!879973))

(assert (=> b!946703 m!879973))

(assert (=> d!114563 d!114579))

(declare-fun d!114581 () Bool)

(declare-fun lt!426375 () (_ BitVec 32))

(declare-fun lt!426374 () (_ BitVec 32))

(assert (=> d!114581 (= lt!426375 (bvmul (bvxor lt!426374 (bvlshr lt!426374 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114581 (= lt!426374 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114581 (and (bvsge (mask!27427 thiss!1141) #b00000000000000000000000000000000) (let ((res!635486 (let ((h!20450 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81423 (bvmul (bvxor h!20450 (bvlshr h!20450 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81423 (bvlshr x!81423 #b00000000000000000000000000001101)) (mask!27427 thiss!1141)))))) (and (bvslt res!635486 (bvadd (mask!27427 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635486 #b00000000000000000000000000000000))))))

(assert (=> d!114581 (= (toIndex!0 key!756 (mask!27427 thiss!1141)) (bvand (bvxor lt!426375 (bvlshr lt!426375 #b00000000000000000000000000001101)) (mask!27427 thiss!1141)))))

(assert (=> d!114563 d!114581))

(assert (=> d!114563 d!114571))

(declare-fun d!114583 () Bool)

(declare-fun res!635487 () Bool)

(declare-fun e!532726 () Bool)

(assert (=> d!114583 (=> res!635487 e!532726)))

(assert (=> d!114583 (= res!635487 (= (select (arr!27565 (_keys!10615 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114583 (= (arrayContainsKey!0 (_keys!10615 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532726)))

(declare-fun b!946706 () Bool)

(declare-fun e!532727 () Bool)

(assert (=> b!946706 (= e!532726 e!532727)))

(declare-fun res!635488 () Bool)

(assert (=> b!946706 (=> (not res!635488) (not e!532727))))

(assert (=> b!946706 (= res!635488 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28036 (_keys!10615 thiss!1141))))))

(declare-fun b!946707 () Bool)

(assert (=> b!946707 (= e!532727 (arrayContainsKey!0 (_keys!10615 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114583 (not res!635487)) b!946706))

(assert (= (and b!946706 res!635488) b!946707))

(declare-fun m!879981 () Bool)

(assert (=> d!114583 m!879981))

(declare-fun m!879983 () Bool)

(assert (=> b!946707 m!879983))

(assert (=> b!946670 d!114583))

(declare-fun d!114585 () Bool)

(declare-fun res!635496 () Bool)

(declare-fun e!532739 () Bool)

(assert (=> d!114585 (=> res!635496 e!532739)))

(assert (=> d!114585 (= res!635496 (bvsge #b00000000000000000000000000000000 (size!28036 (_keys!10615 thiss!1141))))))

(assert (=> d!114585 (= (arrayNoDuplicates!0 (_keys!10615 thiss!1141) #b00000000000000000000000000000000 Nil!19296) e!532739)))

(declare-fun b!946718 () Bool)

(declare-fun e!532738 () Bool)

(declare-fun call!41088 () Bool)

(assert (=> b!946718 (= e!532738 call!41088)))

(declare-fun b!946719 () Bool)

(declare-fun e!532737 () Bool)

(declare-fun contains!5196 (List!19299 (_ BitVec 64)) Bool)

(assert (=> b!946719 (= e!532737 (contains!5196 Nil!19296 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946720 () Bool)

(declare-fun e!532736 () Bool)

(assert (=> b!946720 (= e!532736 e!532738)))

(declare-fun c!98603 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!946720 (= c!98603 (validKeyInArray!0 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!946721 () Bool)

(assert (=> b!946721 (= e!532739 e!532736)))

(declare-fun res!635497 () Bool)

(assert (=> b!946721 (=> (not res!635497) (not e!532736))))

(assert (=> b!946721 (= res!635497 (not e!532737))))

(declare-fun res!635495 () Bool)

(assert (=> b!946721 (=> (not res!635495) (not e!532737))))

(assert (=> b!946721 (= res!635495 (validKeyInArray!0 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41085 () Bool)

(assert (=> bm!41085 (= call!41088 (arrayNoDuplicates!0 (_keys!10615 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98603 (Cons!19295 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000) Nil!19296) Nil!19296)))))

(declare-fun b!946722 () Bool)

(assert (=> b!946722 (= e!532738 call!41088)))

(assert (= (and d!114585 (not res!635496)) b!946721))

(assert (= (and b!946721 res!635495) b!946719))

(assert (= (and b!946721 res!635497) b!946720))

(assert (= (and b!946720 c!98603) b!946718))

(assert (= (and b!946720 (not c!98603)) b!946722))

(assert (= (or b!946718 b!946722) bm!41085))

(assert (=> b!946719 m!879965))

(assert (=> b!946719 m!879965))

(declare-fun m!879985 () Bool)

(assert (=> b!946719 m!879985))

(assert (=> b!946720 m!879965))

(assert (=> b!946720 m!879965))

(declare-fun m!879987 () Bool)

(assert (=> b!946720 m!879987))

(assert (=> b!946721 m!879965))

(assert (=> b!946721 m!879965))

(assert (=> b!946721 m!879987))

(assert (=> bm!41085 m!879965))

(declare-fun m!879989 () Bool)

(assert (=> bm!41085 m!879989))

(assert (=> b!946664 d!114585))

(declare-fun b!946731 () Bool)

(declare-fun e!532748 () Bool)

(declare-fun e!532746 () Bool)

(assert (=> b!946731 (= e!532748 e!532746)))

(declare-fun c!98606 () Bool)

(assert (=> b!946731 (= c!98606 (validKeyInArray!0 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41088 () Bool)

(declare-fun call!41091 () Bool)

(assert (=> bm!41088 (= call!41091 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10615 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun d!114587 () Bool)

(declare-fun res!635503 () Bool)

(assert (=> d!114587 (=> res!635503 e!532748)))

(assert (=> d!114587 (= res!635503 (bvsge #b00000000000000000000000000000000 (size!28036 (_keys!10615 thiss!1141))))))

(assert (=> d!114587 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)) e!532748)))

(declare-fun b!946732 () Bool)

(assert (=> b!946732 (= e!532746 call!41091)))

(declare-fun b!946733 () Bool)

(declare-fun e!532747 () Bool)

(assert (=> b!946733 (= e!532747 call!41091)))

(declare-fun b!946734 () Bool)

(assert (=> b!946734 (= e!532746 e!532747)))

(declare-fun lt!426383 () (_ BitVec 64))

(assert (=> b!946734 (= lt!426383 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426382 () Unit!31908)

(assert (=> b!946734 (= lt!426382 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10615 thiss!1141) lt!426383 #b00000000000000000000000000000000))))

(assert (=> b!946734 (arrayContainsKey!0 (_keys!10615 thiss!1141) lt!426383 #b00000000000000000000000000000000)))

(declare-fun lt!426384 () Unit!31908)

(assert (=> b!946734 (= lt!426384 lt!426382)))

(declare-fun res!635502 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57300 (_ BitVec 32)) SeekEntryResult!9105)

(assert (=> b!946734 (= res!635502 (= (seekEntryOrOpen!0 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000) (_keys!10615 thiss!1141) (mask!27427 thiss!1141)) (Found!9105 #b00000000000000000000000000000000)))))

(assert (=> b!946734 (=> (not res!635502) (not e!532747))))

(assert (= (and d!114587 (not res!635503)) b!946731))

(assert (= (and b!946731 c!98606) b!946734))

(assert (= (and b!946731 (not c!98606)) b!946732))

(assert (= (and b!946734 res!635502) b!946733))

(assert (= (or b!946733 b!946732) bm!41088))

(assert (=> b!946731 m!879965))

(assert (=> b!946731 m!879965))

(assert (=> b!946731 m!879987))

(declare-fun m!879991 () Bool)

(assert (=> bm!41088 m!879991))

(assert (=> b!946734 m!879965))

(declare-fun m!879993 () Bool)

(assert (=> b!946734 m!879993))

(declare-fun m!879995 () Bool)

(assert (=> b!946734 m!879995))

(assert (=> b!946734 m!879965))

(declare-fun m!879997 () Bool)

(assert (=> b!946734 m!879997))

(assert (=> b!946663 d!114587))

(declare-fun b!946743 () Bool)

(declare-fun e!532754 () (_ BitVec 32))

(declare-fun call!41094 () (_ BitVec 32))

(assert (=> b!946743 (= e!532754 (bvadd #b00000000000000000000000000000001 call!41094))))

(declare-fun bm!41091 () Bool)

(assert (=> bm!41091 (= call!41094 (arrayCountValidKeys!0 (_keys!10615 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28036 (_keys!10615 thiss!1141))))))

(declare-fun b!946744 () Bool)

(declare-fun e!532753 () (_ BitVec 32))

(assert (=> b!946744 (= e!532753 #b00000000000000000000000000000000)))

(declare-fun b!946745 () Bool)

(assert (=> b!946745 (= e!532753 e!532754)))

(declare-fun c!98611 () Bool)

(assert (=> b!946745 (= c!98611 (validKeyInArray!0 (select (arr!27565 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114589 () Bool)

(declare-fun lt!426387 () (_ BitVec 32))

(assert (=> d!114589 (and (bvsge lt!426387 #b00000000000000000000000000000000) (bvsle lt!426387 (bvsub (size!28036 (_keys!10615 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114589 (= lt!426387 e!532753)))

(declare-fun c!98612 () Bool)

(assert (=> d!114589 (= c!98612 (bvsge #b00000000000000000000000000000000 (size!28036 (_keys!10615 thiss!1141))))))

(assert (=> d!114589 (and (bvsle #b00000000000000000000000000000000 (size!28036 (_keys!10615 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28036 (_keys!10615 thiss!1141)) (size!28036 (_keys!10615 thiss!1141))))))

(assert (=> d!114589 (= (arrayCountValidKeys!0 (_keys!10615 thiss!1141) #b00000000000000000000000000000000 (size!28036 (_keys!10615 thiss!1141))) lt!426387)))

(declare-fun b!946746 () Bool)

(assert (=> b!946746 (= e!532754 call!41094)))

(assert (= (and d!114589 c!98612) b!946744))

(assert (= (and d!114589 (not c!98612)) b!946745))

(assert (= (and b!946745 c!98611) b!946743))

(assert (= (and b!946745 (not c!98611)) b!946746))

(assert (= (or b!946743 b!946746) bm!41091))

(declare-fun m!879999 () Bool)

(assert (=> bm!41091 m!879999))

(assert (=> b!946745 m!879965))

(assert (=> b!946745 m!879965))

(assert (=> b!946745 m!879987))

(assert (=> b!946662 d!114589))

(declare-fun d!114591 () Bool)

(declare-fun lt!426393 () SeekEntryResult!9105)

(assert (=> d!114591 (and (or ((_ is Undefined!9105) lt!426393) (not ((_ is Found!9105) lt!426393)) (and (bvsge (index!38792 lt!426393) #b00000000000000000000000000000000) (bvslt (index!38792 lt!426393) (size!28036 (_keys!10615 thiss!1141))))) (or ((_ is Undefined!9105) lt!426393) ((_ is Found!9105) lt!426393) (not ((_ is MissingVacant!9105) lt!426393)) (not (= (index!38794 lt!426393) (index!38793 lt!426358))) (and (bvsge (index!38794 lt!426393) #b00000000000000000000000000000000) (bvslt (index!38794 lt!426393) (size!28036 (_keys!10615 thiss!1141))))) (or ((_ is Undefined!9105) lt!426393) (ite ((_ is Found!9105) lt!426393) (= (select (arr!27565 (_keys!10615 thiss!1141)) (index!38792 lt!426393)) key!756) (and ((_ is MissingVacant!9105) lt!426393) (= (index!38794 lt!426393) (index!38793 lt!426358)) (= (select (arr!27565 (_keys!10615 thiss!1141)) (index!38794 lt!426393)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!532761 () SeekEntryResult!9105)

(assert (=> d!114591 (= lt!426393 e!532761)))

(declare-fun c!98620 () Bool)

(assert (=> d!114591 (= c!98620 (bvsge (x!81407 lt!426358) #b01111111111111111111111111111110))))

(declare-fun lt!426392 () (_ BitVec 64))

(assert (=> d!114591 (= lt!426392 (select (arr!27565 (_keys!10615 thiss!1141)) (index!38793 lt!426358)))))

(assert (=> d!114591 (validMask!0 (mask!27427 thiss!1141))))

(assert (=> d!114591 (= (seekKeyOrZeroReturnVacant!0 (x!81407 lt!426358) (index!38793 lt!426358) (index!38793 lt!426358) key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)) lt!426393)))

(declare-fun b!946759 () Bool)

(declare-fun e!532763 () SeekEntryResult!9105)

(assert (=> b!946759 (= e!532761 e!532763)))

(declare-fun c!98621 () Bool)

(assert (=> b!946759 (= c!98621 (= lt!426392 key!756))))

(declare-fun b!946760 () Bool)

(declare-fun e!532762 () SeekEntryResult!9105)

(assert (=> b!946760 (= e!532762 (MissingVacant!9105 (index!38793 lt!426358)))))

(declare-fun b!946761 () Bool)

(assert (=> b!946761 (= e!532762 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81407 lt!426358) #b00000000000000000000000000000001) (nextIndex!0 (index!38793 lt!426358) (x!81407 lt!426358) (mask!27427 thiss!1141)) (index!38793 lt!426358) key!756 (_keys!10615 thiss!1141) (mask!27427 thiss!1141)))))

(declare-fun b!946762 () Bool)

(assert (=> b!946762 (= e!532763 (Found!9105 (index!38793 lt!426358)))))

(declare-fun b!946763 () Bool)

(declare-fun c!98619 () Bool)

(assert (=> b!946763 (= c!98619 (= lt!426392 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!946763 (= e!532763 e!532762)))

(declare-fun b!946764 () Bool)

(assert (=> b!946764 (= e!532761 Undefined!9105)))

(assert (= (and d!114591 c!98620) b!946764))

(assert (= (and d!114591 (not c!98620)) b!946759))

(assert (= (and b!946759 c!98621) b!946762))

(assert (= (and b!946759 (not c!98621)) b!946763))

(assert (= (and b!946763 c!98619) b!946760))

(assert (= (and b!946763 (not c!98619)) b!946761))

(declare-fun m!880001 () Bool)

(assert (=> d!114591 m!880001))

(declare-fun m!880003 () Bool)

(assert (=> d!114591 m!880003))

(assert (=> d!114591 m!879947))

(assert (=> d!114591 m!879915))

(declare-fun m!880005 () Bool)

(assert (=> b!946761 m!880005))

(assert (=> b!946761 m!880005))

(declare-fun m!880007 () Bool)

(assert (=> b!946761 m!880007))

(assert (=> b!946651 d!114591))

(declare-fun b!946775 () Bool)

(declare-fun res!635513 () Bool)

(declare-fun e!532766 () Bool)

(assert (=> b!946775 (=> (not res!635513) (not e!532766))))

(declare-fun size!28039 (LongMapFixedSize!4842) (_ BitVec 32))

(assert (=> b!946775 (= res!635513 (= (size!28039 thiss!1141) (bvadd (_size!2476 thiss!1141) (bvsdiv (bvadd (extraKeys!5450 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!946776 () Bool)

(assert (=> b!946776 (= e!532766 (and (bvsge (extraKeys!5450 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5450 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2476 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!946773 () Bool)

(declare-fun res!635514 () Bool)

(assert (=> b!946773 (=> (not res!635514) (not e!532766))))

(assert (=> b!946773 (= res!635514 (and (= (size!28035 (_values!5741 thiss!1141)) (bvadd (mask!27427 thiss!1141) #b00000000000000000000000000000001)) (= (size!28036 (_keys!10615 thiss!1141)) (size!28035 (_values!5741 thiss!1141))) (bvsge (_size!2476 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2476 thiss!1141) (bvadd (mask!27427 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!946774 () Bool)

(declare-fun res!635512 () Bool)

(assert (=> b!946774 (=> (not res!635512) (not e!532766))))

(assert (=> b!946774 (= res!635512 (bvsge (size!28039 thiss!1141) (_size!2476 thiss!1141)))))

(declare-fun d!114593 () Bool)

(declare-fun res!635515 () Bool)

(assert (=> d!114593 (=> (not res!635515) (not e!532766))))

(assert (=> d!114593 (= res!635515 (validMask!0 (mask!27427 thiss!1141)))))

(assert (=> d!114593 (= (simpleValid!359 thiss!1141) e!532766)))

(assert (= (and d!114593 res!635515) b!946773))

(assert (= (and b!946773 res!635514) b!946774))

(assert (= (and b!946774 res!635512) b!946775))

(assert (= (and b!946775 res!635513) b!946776))

(declare-fun m!880009 () Bool)

(assert (=> b!946775 m!880009))

(assert (=> b!946774 m!880009))

(assert (=> d!114593 m!879915))

(assert (=> d!114569 d!114593))

(declare-fun mapNonEmpty!32850 () Bool)

(declare-fun mapRes!32850 () Bool)

(declare-fun tp!62996 () Bool)

(declare-fun e!532767 () Bool)

(assert (=> mapNonEmpty!32850 (= mapRes!32850 (and tp!62996 e!532767))))

(declare-fun mapKey!32850 () (_ BitVec 32))

(declare-fun mapValue!32850 () ValueCell!9846)

(declare-fun mapRest!32850 () (Array (_ BitVec 32) ValueCell!9846))

(assert (=> mapNonEmpty!32850 (= mapRest!32849 (store mapRest!32850 mapKey!32850 mapValue!32850))))

(declare-fun condMapEmpty!32850 () Bool)

(declare-fun mapDefault!32850 () ValueCell!9846)

(assert (=> mapNonEmpty!32849 (= condMapEmpty!32850 (= mapRest!32849 ((as const (Array (_ BitVec 32) ValueCell!9846)) mapDefault!32850)))))

(declare-fun e!532768 () Bool)

(assert (=> mapNonEmpty!32849 (= tp!62995 (and e!532768 mapRes!32850))))

(declare-fun mapIsEmpty!32850 () Bool)

(assert (=> mapIsEmpty!32850 mapRes!32850))

(declare-fun b!946778 () Bool)

(assert (=> b!946778 (= e!532768 tp_is_empty!20655)))

(declare-fun b!946777 () Bool)

(assert (=> b!946777 (= e!532767 tp_is_empty!20655)))

(assert (= (and mapNonEmpty!32849 condMapEmpty!32850) mapIsEmpty!32850))

(assert (= (and mapNonEmpty!32849 (not condMapEmpty!32850)) mapNonEmpty!32850))

(assert (= (and mapNonEmpty!32850 ((_ is ValueCellFull!9846) mapValue!32850)) b!946777))

(assert (= (and mapNonEmpty!32849 ((_ is ValueCellFull!9846) mapDefault!32850)) b!946778))

(declare-fun m!880011 () Bool)

(assert (=> mapNonEmpty!32850 m!880011))

(check-sat (not b!946707) (not b!946734) (not bm!41088) (not b!946720) b_and!29569 (not d!114579) (not mapNonEmpty!32850) (not b!946704) (not b!946745) (not b!946731) tp_is_empty!20655 (not b_next!18147) (not b!946761) (not bm!41091) (not d!114593) (not b!946774) (not b!946775) (not b!946721) (not b!946719) (not bm!41085) (not d!114577) (not d!114591))
(check-sat b_and!29569 (not b_next!18147))
