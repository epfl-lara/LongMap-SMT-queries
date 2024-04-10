; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80540 () Bool)

(assert start!80540)

(declare-fun b!945667 () Bool)

(declare-fun b_free!18111 () Bool)

(declare-fun b_next!18111 () Bool)

(assert (=> b!945667 (= b_free!18111 (not b_next!18111))))

(declare-fun tp!62856 () Bool)

(declare-fun b_and!29533 () Bool)

(assert (=> b!945667 (= tp!62856 b_and!29533)))

(declare-fun b!945662 () Bool)

(declare-fun e!531944 () Bool)

(declare-fun tp_is_empty!20619 () Bool)

(assert (=> b!945662 (= e!531944 tp_is_empty!20619)))

(declare-fun mapIsEmpty!32768 () Bool)

(declare-fun mapRes!32768 () Bool)

(assert (=> mapIsEmpty!32768 mapRes!32768))

(declare-fun b!945663 () Bool)

(declare-fun e!531942 () Bool)

(declare-datatypes ((SeekEntryResult!9092 0))(
  ( (MissingZero!9092 (index!38739 (_ BitVec 32))) (Found!9092 (index!38740 (_ BitVec 32))) (Intermediate!9092 (undefined!9904 Bool) (index!38741 (_ BitVec 32)) (x!81271 (_ BitVec 32))) (Undefined!9092) (MissingVacant!9092 (index!38742 (_ BitVec 32))) )
))
(declare-fun lt!426072 () SeekEntryResult!9092)

(declare-datatypes ((V!32457 0))(
  ( (V!32458 (val!10360 Int)) )
))
(declare-datatypes ((ValueCell!9828 0))(
  ( (ValueCellFull!9828 (v!12894 V!32457)) (EmptyCell!9828) )
))
(declare-datatypes ((array!57214 0))(
  ( (array!57215 (arr!27528 (Array (_ BitVec 32) ValueCell!9828)) (size!27996 (_ BitVec 32))) )
))
(declare-datatypes ((array!57216 0))(
  ( (array!57217 (arr!27529 (Array (_ BitVec 32) (_ BitVec 64))) (size!27997 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4806 0))(
  ( (LongMapFixedSize!4807 (defaultEntry!5700 Int) (mask!27374 (_ BitVec 32)) (extraKeys!5432 (_ BitVec 32)) (zeroValue!5536 V!32457) (minValue!5536 V!32457) (_size!2458 (_ BitVec 32)) (_keys!10582 array!57216) (_values!5723 array!57214) (_vacant!2458 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4806)

(get-info :version)

(assert (=> b!945663 (= e!531942 (and ((_ is Found!9092) lt!426072) (bvsge (index!38740 lt!426072) #b00000000000000000000000000000000) (bvslt (index!38740 lt!426072) (size!27997 (_keys!10582 thiss!1141))) (bvsge (size!27997 (_keys!10582 thiss!1141)) #b01111111111111111111111111111111)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57216 (_ BitVec 32)) SeekEntryResult!9092)

(assert (=> b!945663 (= lt!426072 (seekEntry!0 key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)))))

(declare-fun res!635058 () Bool)

(assert (=> start!80540 (=> (not res!635058) (not e!531942))))

(declare-fun valid!1837 (LongMapFixedSize!4806) Bool)

(assert (=> start!80540 (= res!635058 (valid!1837 thiss!1141))))

(assert (=> start!80540 e!531942))

(declare-fun e!531943 () Bool)

(assert (=> start!80540 e!531943))

(assert (=> start!80540 true))

(declare-fun b!945664 () Bool)

(declare-fun res!635057 () Bool)

(assert (=> b!945664 (=> (not res!635057) (not e!531942))))

(assert (=> b!945664 (= res!635057 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!945665 () Bool)

(declare-fun e!531940 () Bool)

(assert (=> b!945665 (= e!531940 tp_is_empty!20619)))

(declare-fun mapNonEmpty!32768 () Bool)

(declare-fun tp!62857 () Bool)

(assert (=> mapNonEmpty!32768 (= mapRes!32768 (and tp!62857 e!531944))))

(declare-fun mapRest!32768 () (Array (_ BitVec 32) ValueCell!9828))

(declare-fun mapValue!32768 () ValueCell!9828)

(declare-fun mapKey!32768 () (_ BitVec 32))

(assert (=> mapNonEmpty!32768 (= (arr!27528 (_values!5723 thiss!1141)) (store mapRest!32768 mapKey!32768 mapValue!32768))))

(declare-fun b!945666 () Bool)

(declare-fun e!531939 () Bool)

(assert (=> b!945666 (= e!531939 (and e!531940 mapRes!32768))))

(declare-fun condMapEmpty!32768 () Bool)

(declare-fun mapDefault!32768 () ValueCell!9828)

(assert (=> b!945666 (= condMapEmpty!32768 (= (arr!27528 (_values!5723 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9828)) mapDefault!32768)))))

(declare-fun array_inv!21384 (array!57216) Bool)

(declare-fun array_inv!21385 (array!57214) Bool)

(assert (=> b!945667 (= e!531943 (and tp!62856 tp_is_empty!20619 (array_inv!21384 (_keys!10582 thiss!1141)) (array_inv!21385 (_values!5723 thiss!1141)) e!531939))))

(assert (= (and start!80540 res!635058) b!945664))

(assert (= (and b!945664 res!635057) b!945663))

(assert (= (and b!945666 condMapEmpty!32768) mapIsEmpty!32768))

(assert (= (and b!945666 (not condMapEmpty!32768)) mapNonEmpty!32768))

(assert (= (and mapNonEmpty!32768 ((_ is ValueCellFull!9828) mapValue!32768)) b!945662))

(assert (= (and b!945666 ((_ is ValueCellFull!9828) mapDefault!32768)) b!945665))

(assert (= b!945667 b!945666))

(assert (= start!80540 b!945667))

(declare-fun m!879381 () Bool)

(assert (=> b!945663 m!879381))

(declare-fun m!879383 () Bool)

(assert (=> start!80540 m!879383))

(declare-fun m!879385 () Bool)

(assert (=> mapNonEmpty!32768 m!879385))

(declare-fun m!879387 () Bool)

(assert (=> b!945667 m!879387))

(declare-fun m!879389 () Bool)

(assert (=> b!945667 m!879389))

(check-sat tp_is_empty!20619 (not start!80540) (not b_next!18111) (not b!945667) b_and!29533 (not mapNonEmpty!32768) (not b!945663))
(check-sat b_and!29533 (not b_next!18111))
(get-model)

(declare-fun b!945698 () Bool)

(declare-fun e!531970 () SeekEntryResult!9092)

(declare-fun lt!426087 () SeekEntryResult!9092)

(assert (=> b!945698 (= e!531970 (MissingZero!9092 (index!38741 lt!426087)))))

(declare-fun b!945699 () Bool)

(declare-fun lt!426084 () SeekEntryResult!9092)

(assert (=> b!945699 (= e!531970 (ite ((_ is MissingVacant!9092) lt!426084) (MissingZero!9092 (index!38742 lt!426084)) lt!426084))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57216 (_ BitVec 32)) SeekEntryResult!9092)

(assert (=> b!945699 (= lt!426084 (seekKeyOrZeroReturnVacant!0 (x!81271 lt!426087) (index!38741 lt!426087) (index!38741 lt!426087) key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)))))

(declare-fun d!114425 () Bool)

(declare-fun lt!426085 () SeekEntryResult!9092)

(assert (=> d!114425 (and (or ((_ is MissingVacant!9092) lt!426085) (not ((_ is Found!9092) lt!426085)) (and (bvsge (index!38740 lt!426085) #b00000000000000000000000000000000) (bvslt (index!38740 lt!426085) (size!27997 (_keys!10582 thiss!1141))))) (not ((_ is MissingVacant!9092) lt!426085)) (or (not ((_ is Found!9092) lt!426085)) (= (select (arr!27529 (_keys!10582 thiss!1141)) (index!38740 lt!426085)) key!756)))))

(declare-fun e!531969 () SeekEntryResult!9092)

(assert (=> d!114425 (= lt!426085 e!531969)))

(declare-fun c!98447 () Bool)

(assert (=> d!114425 (= c!98447 (and ((_ is Intermediate!9092) lt!426087) (undefined!9904 lt!426087)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57216 (_ BitVec 32)) SeekEntryResult!9092)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114425 (= lt!426087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27374 thiss!1141)) key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114425 (validMask!0 (mask!27374 thiss!1141))))

(assert (=> d!114425 (= (seekEntry!0 key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)) lt!426085)))

(declare-fun b!945700 () Bool)

(declare-fun e!531971 () SeekEntryResult!9092)

(assert (=> b!945700 (= e!531971 (Found!9092 (index!38741 lt!426087)))))

(declare-fun b!945701 () Bool)

(declare-fun c!98445 () Bool)

(declare-fun lt!426086 () (_ BitVec 64))

(assert (=> b!945701 (= c!98445 (= lt!426086 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945701 (= e!531971 e!531970)))

(declare-fun b!945702 () Bool)

(assert (=> b!945702 (= e!531969 e!531971)))

(assert (=> b!945702 (= lt!426086 (select (arr!27529 (_keys!10582 thiss!1141)) (index!38741 lt!426087)))))

(declare-fun c!98446 () Bool)

(assert (=> b!945702 (= c!98446 (= lt!426086 key!756))))

(declare-fun b!945703 () Bool)

(assert (=> b!945703 (= e!531969 Undefined!9092)))

(assert (= (and d!114425 c!98447) b!945703))

(assert (= (and d!114425 (not c!98447)) b!945702))

(assert (= (and b!945702 c!98446) b!945700))

(assert (= (and b!945702 (not c!98446)) b!945701))

(assert (= (and b!945701 c!98445) b!945698))

(assert (= (and b!945701 (not c!98445)) b!945699))

(declare-fun m!879401 () Bool)

(assert (=> b!945699 m!879401))

(declare-fun m!879403 () Bool)

(assert (=> d!114425 m!879403))

(declare-fun m!879405 () Bool)

(assert (=> d!114425 m!879405))

(assert (=> d!114425 m!879405))

(declare-fun m!879407 () Bool)

(assert (=> d!114425 m!879407))

(declare-fun m!879409 () Bool)

(assert (=> d!114425 m!879409))

(declare-fun m!879411 () Bool)

(assert (=> b!945702 m!879411))

(assert (=> b!945663 d!114425))

(declare-fun d!114427 () Bool)

(assert (=> d!114427 (= (array_inv!21384 (_keys!10582 thiss!1141)) (bvsge (size!27997 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945667 d!114427))

(declare-fun d!114429 () Bool)

(assert (=> d!114429 (= (array_inv!21385 (_values!5723 thiss!1141)) (bvsge (size!27996 (_values!5723 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!945667 d!114429))

(declare-fun d!114431 () Bool)

(declare-fun res!635071 () Bool)

(declare-fun e!531974 () Bool)

(assert (=> d!114431 (=> (not res!635071) (not e!531974))))

(declare-fun simpleValid!353 (LongMapFixedSize!4806) Bool)

(assert (=> d!114431 (= res!635071 (simpleValid!353 thiss!1141))))

(assert (=> d!114431 (= (valid!1837 thiss!1141) e!531974)))

(declare-fun b!945710 () Bool)

(declare-fun res!635072 () Bool)

(assert (=> b!945710 (=> (not res!635072) (not e!531974))))

(declare-fun arrayCountValidKeys!0 (array!57216 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945710 (= res!635072 (= (arrayCountValidKeys!0 (_keys!10582 thiss!1141) #b00000000000000000000000000000000 (size!27997 (_keys!10582 thiss!1141))) (_size!2458 thiss!1141)))))

(declare-fun b!945711 () Bool)

(declare-fun res!635073 () Bool)

(assert (=> b!945711 (=> (not res!635073) (not e!531974))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57216 (_ BitVec 32)) Bool)

(assert (=> b!945711 (= res!635073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)))))

(declare-fun b!945712 () Bool)

(declare-datatypes ((List!19293 0))(
  ( (Nil!19290) (Cons!19289 (h!20440 (_ BitVec 64)) (t!27614 List!19293)) )
))
(declare-fun arrayNoDuplicates!0 (array!57216 (_ BitVec 32) List!19293) Bool)

(assert (=> b!945712 (= e!531974 (arrayNoDuplicates!0 (_keys!10582 thiss!1141) #b00000000000000000000000000000000 Nil!19290))))

(assert (= (and d!114431 res!635071) b!945710))

(assert (= (and b!945710 res!635072) b!945711))

(assert (= (and b!945711 res!635073) b!945712))

(declare-fun m!879413 () Bool)

(assert (=> d!114431 m!879413))

(declare-fun m!879415 () Bool)

(assert (=> b!945710 m!879415))

(declare-fun m!879417 () Bool)

(assert (=> b!945711 m!879417))

(declare-fun m!879419 () Bool)

(assert (=> b!945712 m!879419))

(assert (=> start!80540 d!114431))

(declare-fun mapIsEmpty!32774 () Bool)

(declare-fun mapRes!32774 () Bool)

(assert (=> mapIsEmpty!32774 mapRes!32774))

(declare-fun condMapEmpty!32774 () Bool)

(declare-fun mapDefault!32774 () ValueCell!9828)

(assert (=> mapNonEmpty!32768 (= condMapEmpty!32774 (= mapRest!32768 ((as const (Array (_ BitVec 32) ValueCell!9828)) mapDefault!32774)))))

(declare-fun e!531979 () Bool)

(assert (=> mapNonEmpty!32768 (= tp!62857 (and e!531979 mapRes!32774))))

(declare-fun mapNonEmpty!32774 () Bool)

(declare-fun tp!62866 () Bool)

(declare-fun e!531980 () Bool)

(assert (=> mapNonEmpty!32774 (= mapRes!32774 (and tp!62866 e!531980))))

(declare-fun mapValue!32774 () ValueCell!9828)

(declare-fun mapRest!32774 () (Array (_ BitVec 32) ValueCell!9828))

(declare-fun mapKey!32774 () (_ BitVec 32))

(assert (=> mapNonEmpty!32774 (= mapRest!32768 (store mapRest!32774 mapKey!32774 mapValue!32774))))

(declare-fun b!945719 () Bool)

(assert (=> b!945719 (= e!531980 tp_is_empty!20619)))

(declare-fun b!945720 () Bool)

(assert (=> b!945720 (= e!531979 tp_is_empty!20619)))

(assert (= (and mapNonEmpty!32768 condMapEmpty!32774) mapIsEmpty!32774))

(assert (= (and mapNonEmpty!32768 (not condMapEmpty!32774)) mapNonEmpty!32774))

(assert (= (and mapNonEmpty!32774 ((_ is ValueCellFull!9828) mapValue!32774)) b!945719))

(assert (= (and mapNonEmpty!32768 ((_ is ValueCellFull!9828) mapDefault!32774)) b!945720))

(declare-fun m!879421 () Bool)

(assert (=> mapNonEmpty!32774 m!879421))

(check-sat tp_is_empty!20619 (not b_next!18111) b_and!29533 (not b!945699) (not b!945712) (not b!945710) (not mapNonEmpty!32774) (not d!114431) (not b!945711) (not d!114425))
(check-sat b_and!29533 (not b_next!18111))
(get-model)

(declare-fun b!945739 () Bool)

(declare-fun lt!426093 () SeekEntryResult!9092)

(assert (=> b!945739 (and (bvsge (index!38741 lt!426093) #b00000000000000000000000000000000) (bvslt (index!38741 lt!426093) (size!27997 (_keys!10582 thiss!1141))))))

(declare-fun e!531992 () Bool)

(assert (=> b!945739 (= e!531992 (= (select (arr!27529 (_keys!10582 thiss!1141)) (index!38741 lt!426093)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!945741 () Bool)

(declare-fun e!531995 () SeekEntryResult!9092)

(assert (=> b!945741 (= e!531995 (Intermediate!9092 false (toIndex!0 key!756 (mask!27374 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!945742 () Bool)

(assert (=> b!945742 (and (bvsge (index!38741 lt!426093) #b00000000000000000000000000000000) (bvslt (index!38741 lt!426093) (size!27997 (_keys!10582 thiss!1141))))))

(declare-fun res!635082 () Bool)

(assert (=> b!945742 (= res!635082 (= (select (arr!27529 (_keys!10582 thiss!1141)) (index!38741 lt!426093)) key!756))))

(assert (=> b!945742 (=> res!635082 e!531992)))

(declare-fun e!531993 () Bool)

(assert (=> b!945742 (= e!531993 e!531992)))

(declare-fun b!945743 () Bool)

(declare-fun e!531991 () Bool)

(assert (=> b!945743 (= e!531991 (bvsge (x!81271 lt!426093) #b01111111111111111111111111111110))))

(declare-fun b!945744 () Bool)

(declare-fun e!531994 () SeekEntryResult!9092)

(assert (=> b!945744 (= e!531994 (Intermediate!9092 true (toIndex!0 key!756 (mask!27374 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!945745 () Bool)

(assert (=> b!945745 (= e!531994 e!531995)))

(declare-fun c!98454 () Bool)

(declare-fun lt!426092 () (_ BitVec 64))

(assert (=> b!945745 (= c!98454 (or (= lt!426092 key!756) (= (bvadd lt!426092 lt!426092) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!945746 () Bool)

(assert (=> b!945746 (= e!531991 e!531993)))

(declare-fun res!635081 () Bool)

(assert (=> b!945746 (= res!635081 (and ((_ is Intermediate!9092) lt!426093) (not (undefined!9904 lt!426093)) (bvslt (x!81271 lt!426093) #b01111111111111111111111111111110) (bvsge (x!81271 lt!426093) #b00000000000000000000000000000000) (bvsge (x!81271 lt!426093) #b00000000000000000000000000000000)))))

(assert (=> b!945746 (=> (not res!635081) (not e!531993))))

(declare-fun b!945747 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!945747 (= e!531995 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27374 thiss!1141)) #b00000000000000000000000000000000 (mask!27374 thiss!1141)) key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)))))

(declare-fun b!945740 () Bool)

(assert (=> b!945740 (and (bvsge (index!38741 lt!426093) #b00000000000000000000000000000000) (bvslt (index!38741 lt!426093) (size!27997 (_keys!10582 thiss!1141))))))

(declare-fun res!635080 () Bool)

(assert (=> b!945740 (= res!635080 (= (select (arr!27529 (_keys!10582 thiss!1141)) (index!38741 lt!426093)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!945740 (=> res!635080 e!531992)))

(declare-fun d!114433 () Bool)

(assert (=> d!114433 e!531991))

(declare-fun c!98455 () Bool)

(assert (=> d!114433 (= c!98455 (and ((_ is Intermediate!9092) lt!426093) (undefined!9904 lt!426093)))))

(assert (=> d!114433 (= lt!426093 e!531994)))

(declare-fun c!98456 () Bool)

(assert (=> d!114433 (= c!98456 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114433 (= lt!426092 (select (arr!27529 (_keys!10582 thiss!1141)) (toIndex!0 key!756 (mask!27374 thiss!1141))))))

(assert (=> d!114433 (validMask!0 (mask!27374 thiss!1141))))

(assert (=> d!114433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27374 thiss!1141)) key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)) lt!426093)))

(assert (= (and d!114433 c!98456) b!945744))

(assert (= (and d!114433 (not c!98456)) b!945745))

(assert (= (and b!945745 c!98454) b!945741))

(assert (= (and b!945745 (not c!98454)) b!945747))

(assert (= (and d!114433 c!98455) b!945743))

(assert (= (and d!114433 (not c!98455)) b!945746))

(assert (= (and b!945746 res!635081) b!945742))

(assert (= (and b!945742 (not res!635082)) b!945740))

(assert (= (and b!945740 (not res!635080)) b!945739))

(declare-fun m!879423 () Bool)

(assert (=> b!945742 m!879423))

(assert (=> b!945739 m!879423))

(assert (=> b!945747 m!879405))

(declare-fun m!879425 () Bool)

(assert (=> b!945747 m!879425))

(assert (=> b!945747 m!879425))

(declare-fun m!879427 () Bool)

(assert (=> b!945747 m!879427))

(assert (=> d!114433 m!879405))

(declare-fun m!879429 () Bool)

(assert (=> d!114433 m!879429))

(assert (=> d!114433 m!879409))

(assert (=> b!945740 m!879423))

(assert (=> d!114425 d!114433))

(declare-fun d!114435 () Bool)

(declare-fun lt!426099 () (_ BitVec 32))

(declare-fun lt!426098 () (_ BitVec 32))

(assert (=> d!114435 (= lt!426099 (bvmul (bvxor lt!426098 (bvlshr lt!426098 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114435 (= lt!426098 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114435 (and (bvsge (mask!27374 thiss!1141) #b00000000000000000000000000000000) (let ((res!635083 (let ((h!20441 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81287 (bvmul (bvxor h!20441 (bvlshr h!20441 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81287 (bvlshr x!81287 #b00000000000000000000000000001101)) (mask!27374 thiss!1141)))))) (and (bvslt res!635083 (bvadd (mask!27374 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635083 #b00000000000000000000000000000000))))))

(assert (=> d!114435 (= (toIndex!0 key!756 (mask!27374 thiss!1141)) (bvand (bvxor lt!426099 (bvlshr lt!426099 #b00000000000000000000000000001101)) (mask!27374 thiss!1141)))))

(assert (=> d!114425 d!114435))

(declare-fun d!114437 () Bool)

(assert (=> d!114437 (= (validMask!0 (mask!27374 thiss!1141)) (and (or (= (mask!27374 thiss!1141) #b00000000000000000000000000000111) (= (mask!27374 thiss!1141) #b00000000000000000000000000001111) (= (mask!27374 thiss!1141) #b00000000000000000000000000011111) (= (mask!27374 thiss!1141) #b00000000000000000000000000111111) (= (mask!27374 thiss!1141) #b00000000000000000000000001111111) (= (mask!27374 thiss!1141) #b00000000000000000000000011111111) (= (mask!27374 thiss!1141) #b00000000000000000000000111111111) (= (mask!27374 thiss!1141) #b00000000000000000000001111111111) (= (mask!27374 thiss!1141) #b00000000000000000000011111111111) (= (mask!27374 thiss!1141) #b00000000000000000000111111111111) (= (mask!27374 thiss!1141) #b00000000000000000001111111111111) (= (mask!27374 thiss!1141) #b00000000000000000011111111111111) (= (mask!27374 thiss!1141) #b00000000000000000111111111111111) (= (mask!27374 thiss!1141) #b00000000000000001111111111111111) (= (mask!27374 thiss!1141) #b00000000000000011111111111111111) (= (mask!27374 thiss!1141) #b00000000000000111111111111111111) (= (mask!27374 thiss!1141) #b00000000000001111111111111111111) (= (mask!27374 thiss!1141) #b00000000000011111111111111111111) (= (mask!27374 thiss!1141) #b00000000000111111111111111111111) (= (mask!27374 thiss!1141) #b00000000001111111111111111111111) (= (mask!27374 thiss!1141) #b00000000011111111111111111111111) (= (mask!27374 thiss!1141) #b00000000111111111111111111111111) (= (mask!27374 thiss!1141) #b00000001111111111111111111111111) (= (mask!27374 thiss!1141) #b00000011111111111111111111111111) (= (mask!27374 thiss!1141) #b00000111111111111111111111111111) (= (mask!27374 thiss!1141) #b00001111111111111111111111111111) (= (mask!27374 thiss!1141) #b00011111111111111111111111111111) (= (mask!27374 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27374 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> d!114425 d!114437))

(declare-fun b!945758 () Bool)

(declare-fun e!532007 () Bool)

(declare-fun call!41061 () Bool)

(assert (=> b!945758 (= e!532007 call!41061)))

(declare-fun b!945759 () Bool)

(declare-fun e!532005 () Bool)

(assert (=> b!945759 (= e!532005 e!532007)))

(declare-fun c!98459 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!945759 (= c!98459 (validKeyInArray!0 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114439 () Bool)

(declare-fun res!635090 () Bool)

(declare-fun e!532004 () Bool)

(assert (=> d!114439 (=> res!635090 e!532004)))

(assert (=> d!114439 (= res!635090 (bvsge #b00000000000000000000000000000000 (size!27997 (_keys!10582 thiss!1141))))))

(assert (=> d!114439 (= (arrayNoDuplicates!0 (_keys!10582 thiss!1141) #b00000000000000000000000000000000 Nil!19290) e!532004)))

(declare-fun b!945760 () Bool)

(assert (=> b!945760 (= e!532007 call!41061)))

(declare-fun b!945761 () Bool)

(declare-fun e!532006 () Bool)

(declare-fun contains!5193 (List!19293 (_ BitVec 64)) Bool)

(assert (=> b!945761 (= e!532006 (contains!5193 Nil!19290 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41058 () Bool)

(assert (=> bm!41058 (= call!41061 (arrayNoDuplicates!0 (_keys!10582 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98459 (Cons!19289 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000) Nil!19290) Nil!19290)))))

(declare-fun b!945762 () Bool)

(assert (=> b!945762 (= e!532004 e!532005)))

(declare-fun res!635091 () Bool)

(assert (=> b!945762 (=> (not res!635091) (not e!532005))))

(assert (=> b!945762 (= res!635091 (not e!532006))))

(declare-fun res!635092 () Bool)

(assert (=> b!945762 (=> (not res!635092) (not e!532006))))

(assert (=> b!945762 (= res!635092 (validKeyInArray!0 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114439 (not res!635090)) b!945762))

(assert (= (and b!945762 res!635092) b!945761))

(assert (= (and b!945762 res!635091) b!945759))

(assert (= (and b!945759 c!98459) b!945760))

(assert (= (and b!945759 (not c!98459)) b!945758))

(assert (= (or b!945760 b!945758) bm!41058))

(declare-fun m!879431 () Bool)

(assert (=> b!945759 m!879431))

(assert (=> b!945759 m!879431))

(declare-fun m!879433 () Bool)

(assert (=> b!945759 m!879433))

(assert (=> b!945761 m!879431))

(assert (=> b!945761 m!879431))

(declare-fun m!879435 () Bool)

(assert (=> b!945761 m!879435))

(assert (=> bm!41058 m!879431))

(declare-fun m!879437 () Bool)

(assert (=> bm!41058 m!879437))

(assert (=> b!945762 m!879431))

(assert (=> b!945762 m!879431))

(assert (=> b!945762 m!879433))

(assert (=> b!945712 d!114439))

(declare-fun b!945771 () Bool)

(declare-fun e!532012 () (_ BitVec 32))

(declare-fun e!532013 () (_ BitVec 32))

(assert (=> b!945771 (= e!532012 e!532013)))

(declare-fun c!98464 () Bool)

(assert (=> b!945771 (= c!98464 (validKeyInArray!0 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41061 () Bool)

(declare-fun call!41064 () (_ BitVec 32))

(assert (=> bm!41061 (= call!41064 (arrayCountValidKeys!0 (_keys!10582 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27997 (_keys!10582 thiss!1141))))))

(declare-fun b!945772 () Bool)

(assert (=> b!945772 (= e!532012 #b00000000000000000000000000000000)))

(declare-fun b!945773 () Bool)

(assert (=> b!945773 (= e!532013 (bvadd #b00000000000000000000000000000001 call!41064))))

(declare-fun d!114441 () Bool)

(declare-fun lt!426102 () (_ BitVec 32))

(assert (=> d!114441 (and (bvsge lt!426102 #b00000000000000000000000000000000) (bvsle lt!426102 (bvsub (size!27997 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114441 (= lt!426102 e!532012)))

(declare-fun c!98465 () Bool)

(assert (=> d!114441 (= c!98465 (bvsge #b00000000000000000000000000000000 (size!27997 (_keys!10582 thiss!1141))))))

(assert (=> d!114441 (and (bvsle #b00000000000000000000000000000000 (size!27997 (_keys!10582 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27997 (_keys!10582 thiss!1141)) (size!27997 (_keys!10582 thiss!1141))))))

(assert (=> d!114441 (= (arrayCountValidKeys!0 (_keys!10582 thiss!1141) #b00000000000000000000000000000000 (size!27997 (_keys!10582 thiss!1141))) lt!426102)))

(declare-fun b!945774 () Bool)

(assert (=> b!945774 (= e!532013 call!41064)))

(assert (= (and d!114441 c!98465) b!945772))

(assert (= (and d!114441 (not c!98465)) b!945771))

(assert (= (and b!945771 c!98464) b!945773))

(assert (= (and b!945771 (not c!98464)) b!945774))

(assert (= (or b!945773 b!945774) bm!41061))

(assert (=> b!945771 m!879431))

(assert (=> b!945771 m!879431))

(assert (=> b!945771 m!879433))

(declare-fun m!879439 () Bool)

(assert (=> bm!41061 m!879439))

(assert (=> b!945710 d!114441))

(declare-fun b!945783 () Bool)

(declare-fun e!532021 () Bool)

(declare-fun e!532022 () Bool)

(assert (=> b!945783 (= e!532021 e!532022)))

(declare-fun lt!426109 () (_ BitVec 64))

(assert (=> b!945783 (= lt!426109 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31890 0))(
  ( (Unit!31891) )
))
(declare-fun lt!426110 () Unit!31890)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57216 (_ BitVec 64) (_ BitVec 32)) Unit!31890)

(assert (=> b!945783 (= lt!426110 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10582 thiss!1141) lt!426109 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!945783 (arrayContainsKey!0 (_keys!10582 thiss!1141) lt!426109 #b00000000000000000000000000000000)))

(declare-fun lt!426111 () Unit!31890)

(assert (=> b!945783 (= lt!426111 lt!426110)))

(declare-fun res!635097 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57216 (_ BitVec 32)) SeekEntryResult!9092)

(assert (=> b!945783 (= res!635097 (= (seekEntryOrOpen!0 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000) (_keys!10582 thiss!1141) (mask!27374 thiss!1141)) (Found!9092 #b00000000000000000000000000000000)))))

(assert (=> b!945783 (=> (not res!635097) (not e!532022))))

(declare-fun b!945784 () Bool)

(declare-fun call!41067 () Bool)

(assert (=> b!945784 (= e!532022 call!41067)))

(declare-fun bm!41064 () Bool)

(assert (=> bm!41064 (= call!41067 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10582 thiss!1141) (mask!27374 thiss!1141)))))

(declare-fun d!114443 () Bool)

(declare-fun res!635098 () Bool)

(declare-fun e!532020 () Bool)

(assert (=> d!114443 (=> res!635098 e!532020)))

(assert (=> d!114443 (= res!635098 (bvsge #b00000000000000000000000000000000 (size!27997 (_keys!10582 thiss!1141))))))

(assert (=> d!114443 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)) e!532020)))

(declare-fun b!945785 () Bool)

(assert (=> b!945785 (= e!532020 e!532021)))

(declare-fun c!98468 () Bool)

(assert (=> b!945785 (= c!98468 (validKeyInArray!0 (select (arr!27529 (_keys!10582 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!945786 () Bool)

(assert (=> b!945786 (= e!532021 call!41067)))

(assert (= (and d!114443 (not res!635098)) b!945785))

(assert (= (and b!945785 c!98468) b!945783))

(assert (= (and b!945785 (not c!98468)) b!945786))

(assert (= (and b!945783 res!635097) b!945784))

(assert (= (or b!945784 b!945786) bm!41064))

(assert (=> b!945783 m!879431))

(declare-fun m!879441 () Bool)

(assert (=> b!945783 m!879441))

(declare-fun m!879443 () Bool)

(assert (=> b!945783 m!879443))

(assert (=> b!945783 m!879431))

(declare-fun m!879445 () Bool)

(assert (=> b!945783 m!879445))

(declare-fun m!879447 () Bool)

(assert (=> bm!41064 m!879447))

(assert (=> b!945785 m!879431))

(assert (=> b!945785 m!879431))

(assert (=> b!945785 m!879433))

(assert (=> b!945711 d!114443))

(declare-fun d!114445 () Bool)

(declare-fun res!635109 () Bool)

(declare-fun e!532025 () Bool)

(assert (=> d!114445 (=> (not res!635109) (not e!532025))))

(assert (=> d!114445 (= res!635109 (validMask!0 (mask!27374 thiss!1141)))))

(assert (=> d!114445 (= (simpleValid!353 thiss!1141) e!532025)))

(declare-fun b!945797 () Bool)

(declare-fun res!635108 () Bool)

(assert (=> b!945797 (=> (not res!635108) (not e!532025))))

(declare-fun size!28000 (LongMapFixedSize!4806) (_ BitVec 32))

(assert (=> b!945797 (= res!635108 (= (size!28000 thiss!1141) (bvadd (_size!2458 thiss!1141) (bvsdiv (bvadd (extraKeys!5432 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!945796 () Bool)

(declare-fun res!635107 () Bool)

(assert (=> b!945796 (=> (not res!635107) (not e!532025))))

(assert (=> b!945796 (= res!635107 (bvsge (size!28000 thiss!1141) (_size!2458 thiss!1141)))))

(declare-fun b!945798 () Bool)

(assert (=> b!945798 (= e!532025 (and (bvsge (extraKeys!5432 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5432 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2458 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!945795 () Bool)

(declare-fun res!635110 () Bool)

(assert (=> b!945795 (=> (not res!635110) (not e!532025))))

(assert (=> b!945795 (= res!635110 (and (= (size!27996 (_values!5723 thiss!1141)) (bvadd (mask!27374 thiss!1141) #b00000000000000000000000000000001)) (= (size!27997 (_keys!10582 thiss!1141)) (size!27996 (_values!5723 thiss!1141))) (bvsge (_size!2458 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2458 thiss!1141) (bvadd (mask!27374 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114445 res!635109) b!945795))

(assert (= (and b!945795 res!635110) b!945796))

(assert (= (and b!945796 res!635107) b!945797))

(assert (= (and b!945797 res!635108) b!945798))

(assert (=> d!114445 m!879409))

(declare-fun m!879449 () Bool)

(assert (=> b!945797 m!879449))

(assert (=> b!945796 m!879449))

(assert (=> d!114431 d!114445))

(declare-fun b!945811 () Bool)

(declare-fun e!532034 () SeekEntryResult!9092)

(assert (=> b!945811 (= e!532034 (Found!9092 (index!38741 lt!426087)))))

(declare-fun b!945812 () Bool)

(declare-fun e!532032 () SeekEntryResult!9092)

(assert (=> b!945812 (= e!532032 e!532034)))

(declare-fun c!98475 () Bool)

(declare-fun lt!426117 () (_ BitVec 64))

(assert (=> b!945812 (= c!98475 (= lt!426117 key!756))))

(declare-fun b!945813 () Bool)

(declare-fun c!98476 () Bool)

(assert (=> b!945813 (= c!98476 (= lt!426117 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532033 () SeekEntryResult!9092)

(assert (=> b!945813 (= e!532034 e!532033)))

(declare-fun b!945814 () Bool)

(assert (=> b!945814 (= e!532033 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81271 lt!426087) #b00000000000000000000000000000001) (nextIndex!0 (index!38741 lt!426087) (x!81271 lt!426087) (mask!27374 thiss!1141)) (index!38741 lt!426087) key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)))))

(declare-fun b!945815 () Bool)

(assert (=> b!945815 (= e!532033 (MissingVacant!9092 (index!38741 lt!426087)))))

(declare-fun b!945816 () Bool)

(assert (=> b!945816 (= e!532032 Undefined!9092)))

(declare-fun lt!426116 () SeekEntryResult!9092)

(declare-fun d!114447 () Bool)

(assert (=> d!114447 (and (or ((_ is Undefined!9092) lt!426116) (not ((_ is Found!9092) lt!426116)) (and (bvsge (index!38740 lt!426116) #b00000000000000000000000000000000) (bvslt (index!38740 lt!426116) (size!27997 (_keys!10582 thiss!1141))))) (or ((_ is Undefined!9092) lt!426116) ((_ is Found!9092) lt!426116) (not ((_ is MissingVacant!9092) lt!426116)) (not (= (index!38742 lt!426116) (index!38741 lt!426087))) (and (bvsge (index!38742 lt!426116) #b00000000000000000000000000000000) (bvslt (index!38742 lt!426116) (size!27997 (_keys!10582 thiss!1141))))) (or ((_ is Undefined!9092) lt!426116) (ite ((_ is Found!9092) lt!426116) (= (select (arr!27529 (_keys!10582 thiss!1141)) (index!38740 lt!426116)) key!756) (and ((_ is MissingVacant!9092) lt!426116) (= (index!38742 lt!426116) (index!38741 lt!426087)) (= (select (arr!27529 (_keys!10582 thiss!1141)) (index!38742 lt!426116)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114447 (= lt!426116 e!532032)))

(declare-fun c!98477 () Bool)

(assert (=> d!114447 (= c!98477 (bvsge (x!81271 lt!426087) #b01111111111111111111111111111110))))

(assert (=> d!114447 (= lt!426117 (select (arr!27529 (_keys!10582 thiss!1141)) (index!38741 lt!426087)))))

(assert (=> d!114447 (validMask!0 (mask!27374 thiss!1141))))

(assert (=> d!114447 (= (seekKeyOrZeroReturnVacant!0 (x!81271 lt!426087) (index!38741 lt!426087) (index!38741 lt!426087) key!756 (_keys!10582 thiss!1141) (mask!27374 thiss!1141)) lt!426116)))

(assert (= (and d!114447 c!98477) b!945816))

(assert (= (and d!114447 (not c!98477)) b!945812))

(assert (= (and b!945812 c!98475) b!945811))

(assert (= (and b!945812 (not c!98475)) b!945813))

(assert (= (and b!945813 c!98476) b!945815))

(assert (= (and b!945813 (not c!98476)) b!945814))

(declare-fun m!879451 () Bool)

(assert (=> b!945814 m!879451))

(assert (=> b!945814 m!879451))

(declare-fun m!879453 () Bool)

(assert (=> b!945814 m!879453))

(declare-fun m!879455 () Bool)

(assert (=> d!114447 m!879455))

(declare-fun m!879457 () Bool)

(assert (=> d!114447 m!879457))

(assert (=> d!114447 m!879411))

(assert (=> d!114447 m!879409))

(assert (=> b!945699 d!114447))

(declare-fun mapIsEmpty!32775 () Bool)

(declare-fun mapRes!32775 () Bool)

(assert (=> mapIsEmpty!32775 mapRes!32775))

(declare-fun condMapEmpty!32775 () Bool)

(declare-fun mapDefault!32775 () ValueCell!9828)

(assert (=> mapNonEmpty!32774 (= condMapEmpty!32775 (= mapRest!32774 ((as const (Array (_ BitVec 32) ValueCell!9828)) mapDefault!32775)))))

(declare-fun e!532035 () Bool)

(assert (=> mapNonEmpty!32774 (= tp!62866 (and e!532035 mapRes!32775))))

(declare-fun mapNonEmpty!32775 () Bool)

(declare-fun tp!62867 () Bool)

(declare-fun e!532036 () Bool)

(assert (=> mapNonEmpty!32775 (= mapRes!32775 (and tp!62867 e!532036))))

(declare-fun mapValue!32775 () ValueCell!9828)

(declare-fun mapRest!32775 () (Array (_ BitVec 32) ValueCell!9828))

(declare-fun mapKey!32775 () (_ BitVec 32))

(assert (=> mapNonEmpty!32775 (= mapRest!32774 (store mapRest!32775 mapKey!32775 mapValue!32775))))

(declare-fun b!945817 () Bool)

(assert (=> b!945817 (= e!532036 tp_is_empty!20619)))

(declare-fun b!945818 () Bool)

(assert (=> b!945818 (= e!532035 tp_is_empty!20619)))

(assert (= (and mapNonEmpty!32774 condMapEmpty!32775) mapIsEmpty!32775))

(assert (= (and mapNonEmpty!32774 (not condMapEmpty!32775)) mapNonEmpty!32775))

(assert (= (and mapNonEmpty!32775 ((_ is ValueCellFull!9828) mapValue!32775)) b!945817))

(assert (= (and mapNonEmpty!32774 ((_ is ValueCellFull!9828) mapDefault!32775)) b!945818))

(declare-fun m!879459 () Bool)

(assert (=> mapNonEmpty!32775 m!879459))

(check-sat tp_is_empty!20619 (not b!945759) (not d!114445) (not bm!41064) (not b!945814) (not b!945747) (not b!945797) (not bm!41061) (not d!114433) (not b!945761) (not mapNonEmpty!32775) (not b_next!18111) (not b!945796) (not bm!41058) (not b!945785) (not b!945783) b_and!29533 (not d!114447) (not b!945762) (not b!945771))
(check-sat b_and!29533 (not b_next!18111))
