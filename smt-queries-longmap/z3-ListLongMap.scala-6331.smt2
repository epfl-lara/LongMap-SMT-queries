; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81562 () Bool)

(assert start!81562)

(declare-fun b!952781 () Bool)

(declare-fun b_free!18307 () Bool)

(declare-fun b_next!18307 () Bool)

(assert (=> b!952781 (= b_free!18307 (not b_next!18307))))

(declare-fun tp!63550 () Bool)

(declare-fun b_and!29765 () Bool)

(assert (=> b!952781 (= tp!63550 b_and!29765)))

(declare-fun b!952777 () Bool)

(declare-fun e!536611 () Bool)

(declare-fun e!536612 () Bool)

(declare-fun mapRes!33166 () Bool)

(assert (=> b!952777 (= e!536611 (and e!536612 mapRes!33166))))

(declare-fun condMapEmpty!33166 () Bool)

(declare-datatypes ((V!32719 0))(
  ( (V!32720 (val!10458 Int)) )
))
(declare-datatypes ((ValueCell!9926 0))(
  ( (ValueCellFull!9926 (v!13010 V!32719)) (EmptyCell!9926) )
))
(declare-datatypes ((array!57633 0))(
  ( (array!57634 (arr!27707 (Array (_ BitVec 32) ValueCell!9926)) (size!28188 (_ BitVec 32))) )
))
(declare-datatypes ((array!57635 0))(
  ( (array!57636 (arr!27708 (Array (_ BitVec 32) (_ BitVec 64))) (size!28189 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5002 0))(
  ( (LongMapFixedSize!5003 (defaultEntry!5836 Int) (mask!27692 (_ BitVec 32)) (extraKeys!5568 (_ BitVec 32)) (zeroValue!5672 V!32719) (minValue!5672 V!32719) (_size!2556 (_ BitVec 32)) (_keys!10790 array!57635) (_values!5859 array!57633) (_vacant!2556 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!5002)

(declare-fun mapDefault!33166 () ValueCell!9926)

(assert (=> b!952777 (= condMapEmpty!33166 (= (arr!27707 (_values!5859 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9926)) mapDefault!33166)))))

(declare-fun mapIsEmpty!33166 () Bool)

(assert (=> mapIsEmpty!33166 mapRes!33166))

(declare-fun b!952778 () Bool)

(declare-datatypes ((Unit!31931 0))(
  ( (Unit!31932) )
))
(declare-fun e!536606 () Unit!31931)

(declare-fun Unit!31933 () Unit!31931)

(assert (=> b!952778 (= e!536606 Unit!31933)))

(declare-fun b!952779 () Bool)

(declare-fun tp_is_empty!20815 () Bool)

(assert (=> b!952779 (= e!536612 tp_is_empty!20815)))

(declare-fun b!952780 () Bool)

(declare-fun res!638223 () Bool)

(declare-fun e!536610 () Bool)

(assert (=> b!952780 (=> (not res!638223) (not e!536610))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!952780 (= res!638223 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!638224 () Bool)

(assert (=> start!81562 (=> (not res!638224) (not e!536610))))

(declare-fun valid!1908 (LongMapFixedSize!5002) Bool)

(assert (=> start!81562 (= res!638224 (valid!1908 thiss!1141))))

(assert (=> start!81562 e!536610))

(declare-fun e!536609 () Bool)

(assert (=> start!81562 e!536609))

(assert (=> start!81562 true))

(declare-fun array_inv!21564 (array!57635) Bool)

(declare-fun array_inv!21565 (array!57633) Bool)

(assert (=> b!952781 (= e!536609 (and tp!63550 tp_is_empty!20815 (array_inv!21564 (_keys!10790 thiss!1141)) (array_inv!21565 (_values!5859 thiss!1141)) e!536611))))

(declare-fun mapNonEmpty!33166 () Bool)

(declare-fun tp!63549 () Bool)

(declare-fun e!536608 () Bool)

(assert (=> mapNonEmpty!33166 (= mapRes!33166 (and tp!63549 e!536608))))

(declare-fun mapKey!33166 () (_ BitVec 32))

(declare-fun mapRest!33166 () (Array (_ BitVec 32) ValueCell!9926))

(declare-fun mapValue!33166 () ValueCell!9926)

(assert (=> mapNonEmpty!33166 (= (arr!27707 (_values!5859 thiss!1141)) (store mapRest!33166 mapKey!33166 mapValue!33166))))

(declare-fun b!952782 () Bool)

(declare-datatypes ((tuple2!13640 0))(
  ( (tuple2!13641 (_1!6831 (_ BitVec 64)) (_2!6831 V!32719)) )
))
(declare-datatypes ((List!19375 0))(
  ( (Nil!19372) (Cons!19371 (h!20533 tuple2!13640) (t!27725 List!19375)) )
))
(declare-datatypes ((ListLongMap!12327 0))(
  ( (ListLongMap!12328 (toList!6179 List!19375)) )
))
(declare-fun contains!5217 (ListLongMap!12327 (_ BitVec 64)) Bool)

(declare-fun map!13094 (LongMapFixedSize!5002) ListLongMap!12327)

(assert (=> b!952782 (= e!536610 (contains!5217 (map!13094 thiss!1141) key!756))))

(declare-fun lt!429254 () Unit!31931)

(assert (=> b!952782 (= lt!429254 e!536606)))

(declare-fun c!99671 () Bool)

(declare-fun getCurrentListMap!3341 (array!57635 array!57633 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 32) Int) ListLongMap!12327)

(assert (=> b!952782 (= c!99671 (contains!5217 (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)) key!756))))

(declare-fun b!952783 () Bool)

(assert (=> b!952783 (= e!536608 tp_is_empty!20815)))

(declare-fun b!952784 () Bool)

(declare-fun Unit!31934 () Unit!31931)

(assert (=> b!952784 (= e!536606 Unit!31934)))

(declare-fun lt!429252 () Unit!31931)

(declare-fun lemmaKeyInListMapIsInArray!322 (array!57635 array!57633 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 64) Int) Unit!31931)

(assert (=> b!952784 (= lt!429252 (lemmaKeyInListMapIsInArray!322 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) key!756 (defaultEntry!5836 thiss!1141)))))

(declare-fun arrayContainsKey!0 (array!57635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952784 (arrayContainsKey!0 (_keys!10790 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429253 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57635 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952784 (= lt!429253 (arrayScanForKey!0 (_keys!10790 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun lt!429256 () Unit!31931)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31931)

(assert (=> b!952784 (= lt!429256 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10790 thiss!1141) (mask!27692 thiss!1141) #b00000000000000000000000000000000 lt!429253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57635 (_ BitVec 32)) Bool)

(assert (=> b!952784 (arrayForallSeekEntryOrOpenFound!0 lt!429253 (_keys!10790 thiss!1141) (mask!27692 thiss!1141))))

(declare-fun lt!429255 () Unit!31931)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57635 (_ BitVec 32)) Unit!31931)

(assert (=> b!952784 (= lt!429255 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429253 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))

(assert (=> b!952784 false))

(declare-fun b!952785 () Bool)

(declare-fun res!638222 () Bool)

(assert (=> b!952785 (=> (not res!638222) (not e!536610))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9162 0))(
  ( (MissingZero!9162 (index!39019 (_ BitVec 32))) (Found!9162 (index!39020 (_ BitVec 32))) (Intermediate!9162 (undefined!9974 Bool) (index!39021 (_ BitVec 32)) (x!81979 (_ BitVec 32))) (Undefined!9162) (MissingVacant!9162 (index!39022 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57635 (_ BitVec 32)) SeekEntryResult!9162)

(assert (=> b!952785 (= res!638222 (not ((_ is Found!9162) (seekEntry!0 key!756 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))))

(assert (= (and start!81562 res!638224) b!952780))

(assert (= (and b!952780 res!638223) b!952785))

(assert (= (and b!952785 res!638222) b!952782))

(assert (= (and b!952782 c!99671) b!952784))

(assert (= (and b!952782 (not c!99671)) b!952778))

(assert (= (and b!952777 condMapEmpty!33166) mapIsEmpty!33166))

(assert (= (and b!952777 (not condMapEmpty!33166)) mapNonEmpty!33166))

(assert (= (and mapNonEmpty!33166 ((_ is ValueCellFull!9926) mapValue!33166)) b!952783))

(assert (= (and b!952777 ((_ is ValueCellFull!9926) mapDefault!33166)) b!952779))

(assert (= b!952781 b!952777))

(assert (= start!81562 b!952781))

(declare-fun m!884339 () Bool)

(assert (=> b!952781 m!884339))

(declare-fun m!884341 () Bool)

(assert (=> b!952781 m!884341))

(declare-fun m!884343 () Bool)

(assert (=> b!952785 m!884343))

(declare-fun m!884345 () Bool)

(assert (=> mapNonEmpty!33166 m!884345))

(declare-fun m!884347 () Bool)

(assert (=> b!952782 m!884347))

(assert (=> b!952782 m!884347))

(declare-fun m!884349 () Bool)

(assert (=> b!952782 m!884349))

(declare-fun m!884351 () Bool)

(assert (=> b!952782 m!884351))

(assert (=> b!952782 m!884351))

(declare-fun m!884353 () Bool)

(assert (=> b!952782 m!884353))

(declare-fun m!884355 () Bool)

(assert (=> start!81562 m!884355))

(declare-fun m!884357 () Bool)

(assert (=> b!952784 m!884357))

(declare-fun m!884359 () Bool)

(assert (=> b!952784 m!884359))

(declare-fun m!884361 () Bool)

(assert (=> b!952784 m!884361))

(declare-fun m!884363 () Bool)

(assert (=> b!952784 m!884363))

(declare-fun m!884365 () Bool)

(assert (=> b!952784 m!884365))

(declare-fun m!884367 () Bool)

(assert (=> b!952784 m!884367))

(check-sat (not start!81562) tp_is_empty!20815 b_and!29765 (not b!952785) (not b_next!18307) (not b!952781) (not b!952782) (not mapNonEmpty!33166) (not b!952784))
(check-sat b_and!29765 (not b_next!18307))
(get-model)

(declare-fun b!952852 () Bool)

(declare-fun e!536662 () SeekEntryResult!9162)

(assert (=> b!952852 (= e!536662 Undefined!9162)))

(declare-fun b!952854 () Bool)

(declare-fun e!536661 () SeekEntryResult!9162)

(assert (=> b!952854 (= e!536662 e!536661)))

(declare-fun lt!429297 () (_ BitVec 64))

(declare-fun lt!429295 () SeekEntryResult!9162)

(assert (=> b!952854 (= lt!429297 (select (arr!27708 (_keys!10790 thiss!1141)) (index!39021 lt!429295)))))

(declare-fun c!99685 () Bool)

(assert (=> b!952854 (= c!99685 (= lt!429297 key!756))))

(declare-fun b!952855 () Bool)

(declare-fun e!536663 () SeekEntryResult!9162)

(declare-fun lt!429298 () SeekEntryResult!9162)

(assert (=> b!952855 (= e!536663 (ite ((_ is MissingVacant!9162) lt!429298) (MissingZero!9162 (index!39022 lt!429298)) lt!429298))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57635 (_ BitVec 32)) SeekEntryResult!9162)

(assert (=> b!952855 (= lt!429298 (seekKeyOrZeroReturnVacant!0 (x!81979 lt!429295) (index!39021 lt!429295) (index!39021 lt!429295) key!756 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))

(declare-fun b!952856 () Bool)

(assert (=> b!952856 (= e!536661 (Found!9162 (index!39021 lt!429295)))))

(declare-fun b!952857 () Bool)

(declare-fun c!99686 () Bool)

(assert (=> b!952857 (= c!99686 (= lt!429297 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952857 (= e!536661 e!536663)))

(declare-fun b!952853 () Bool)

(assert (=> b!952853 (= e!536663 (MissingZero!9162 (index!39021 lt!429295)))))

(declare-fun d!115397 () Bool)

(declare-fun lt!429296 () SeekEntryResult!9162)

(assert (=> d!115397 (and (or ((_ is MissingVacant!9162) lt!429296) (not ((_ is Found!9162) lt!429296)) (and (bvsge (index!39020 lt!429296) #b00000000000000000000000000000000) (bvslt (index!39020 lt!429296) (size!28189 (_keys!10790 thiss!1141))))) (not ((_ is MissingVacant!9162) lt!429296)) (or (not ((_ is Found!9162) lt!429296)) (= (select (arr!27708 (_keys!10790 thiss!1141)) (index!39020 lt!429296)) key!756)))))

(assert (=> d!115397 (= lt!429296 e!536662)))

(declare-fun c!99684 () Bool)

(assert (=> d!115397 (= c!99684 (and ((_ is Intermediate!9162) lt!429295) (undefined!9974 lt!429295)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57635 (_ BitVec 32)) SeekEntryResult!9162)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115397 (= lt!429295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27692 thiss!1141)) key!756 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!115397 (validMask!0 (mask!27692 thiss!1141))))

(assert (=> d!115397 (= (seekEntry!0 key!756 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)) lt!429296)))

(assert (= (and d!115397 c!99684) b!952852))

(assert (= (and d!115397 (not c!99684)) b!952854))

(assert (= (and b!952854 c!99685) b!952856))

(assert (= (and b!952854 (not c!99685)) b!952857))

(assert (= (and b!952857 c!99686) b!952853))

(assert (= (and b!952857 (not c!99686)) b!952855))

(declare-fun m!884429 () Bool)

(assert (=> b!952854 m!884429))

(declare-fun m!884431 () Bool)

(assert (=> b!952855 m!884431))

(declare-fun m!884433 () Bool)

(assert (=> d!115397 m!884433))

(declare-fun m!884435 () Bool)

(assert (=> d!115397 m!884435))

(assert (=> d!115397 m!884435))

(declare-fun m!884437 () Bool)

(assert (=> d!115397 m!884437))

(declare-fun m!884439 () Bool)

(assert (=> d!115397 m!884439))

(assert (=> b!952785 d!115397))

(declare-fun d!115399 () Bool)

(declare-fun res!638249 () Bool)

(declare-fun e!536666 () Bool)

(assert (=> d!115399 (=> (not res!638249) (not e!536666))))

(declare-fun simpleValid!384 (LongMapFixedSize!5002) Bool)

(assert (=> d!115399 (= res!638249 (simpleValid!384 thiss!1141))))

(assert (=> d!115399 (= (valid!1908 thiss!1141) e!536666)))

(declare-fun b!952864 () Bool)

(declare-fun res!638250 () Bool)

(assert (=> b!952864 (=> (not res!638250) (not e!536666))))

(declare-fun arrayCountValidKeys!0 (array!57635 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952864 (= res!638250 (= (arrayCountValidKeys!0 (_keys!10790 thiss!1141) #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))) (_size!2556 thiss!1141)))))

(declare-fun b!952865 () Bool)

(declare-fun res!638251 () Bool)

(assert (=> b!952865 (=> (not res!638251) (not e!536666))))

(assert (=> b!952865 (= res!638251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))

(declare-fun b!952866 () Bool)

(declare-datatypes ((List!19378 0))(
  ( (Nil!19375) (Cons!19374 (h!20536 (_ BitVec 64)) (t!27730 List!19378)) )
))
(declare-fun arrayNoDuplicates!0 (array!57635 (_ BitVec 32) List!19378) Bool)

(assert (=> b!952866 (= e!536666 (arrayNoDuplicates!0 (_keys!10790 thiss!1141) #b00000000000000000000000000000000 Nil!19375))))

(assert (= (and d!115399 res!638249) b!952864))

(assert (= (and b!952864 res!638250) b!952865))

(assert (= (and b!952865 res!638251) b!952866))

(declare-fun m!884441 () Bool)

(assert (=> d!115399 m!884441))

(declare-fun m!884443 () Bool)

(assert (=> b!952864 m!884443))

(declare-fun m!884445 () Bool)

(assert (=> b!952865 m!884445))

(declare-fun m!884447 () Bool)

(assert (=> b!952866 m!884447))

(assert (=> start!81562 d!115399))

(declare-fun d!115401 () Bool)

(assert (=> d!115401 (= (array_inv!21564 (_keys!10790 thiss!1141)) (bvsge (size!28189 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952781 d!115401))

(declare-fun d!115403 () Bool)

(assert (=> d!115403 (= (array_inv!21565 (_values!5859 thiss!1141)) (bvsge (size!28188 (_values!5859 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952781 d!115403))

(declare-fun d!115405 () Bool)

(declare-fun lt!429304 () SeekEntryResult!9162)

(assert (=> d!115405 (and ((_ is Found!9162) lt!429304) (= (index!39020 lt!429304) lt!429253))))

(assert (=> d!115405 (= lt!429304 (seekEntry!0 key!756 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))

(declare-fun lt!429303 () Unit!31931)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!57635 (_ BitVec 32)) Unit!31931)

(assert (=> d!115405 (= lt!429303 (choose!0 key!756 lt!429253 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))

(assert (=> d!115405 (validMask!0 (mask!27692 thiss!1141))))

(assert (=> d!115405 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429253 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)) lt!429303)))

(declare-fun bs!26741 () Bool)

(assert (= bs!26741 d!115405))

(assert (=> bs!26741 m!884343))

(declare-fun m!884449 () Bool)

(assert (=> bs!26741 m!884449))

(assert (=> bs!26741 m!884439))

(assert (=> b!952784 d!115405))

(declare-fun d!115407 () Bool)

(declare-fun res!638256 () Bool)

(declare-fun e!536671 () Bool)

(assert (=> d!115407 (=> res!638256 e!536671)))

(assert (=> d!115407 (= res!638256 (= (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115407 (= (arrayContainsKey!0 (_keys!10790 thiss!1141) key!756 #b00000000000000000000000000000000) e!536671)))

(declare-fun b!952871 () Bool)

(declare-fun e!536672 () Bool)

(assert (=> b!952871 (= e!536671 e!536672)))

(declare-fun res!638257 () Bool)

(assert (=> b!952871 (=> (not res!638257) (not e!536672))))

(assert (=> b!952871 (= res!638257 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28189 (_keys!10790 thiss!1141))))))

(declare-fun b!952872 () Bool)

(assert (=> b!952872 (= e!536672 (arrayContainsKey!0 (_keys!10790 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115407 (not res!638256)) b!952871))

(assert (= (and b!952871 res!638257) b!952872))

(declare-fun m!884451 () Bool)

(assert (=> d!115407 m!884451))

(declare-fun m!884453 () Bool)

(assert (=> b!952872 m!884453))

(assert (=> b!952784 d!115407))

(declare-fun d!115409 () Bool)

(declare-fun e!536675 () Bool)

(assert (=> d!115409 e!536675))

(declare-fun c!99689 () Bool)

(assert (=> d!115409 (= c!99689 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429307 () Unit!31931)

(declare-fun choose!1609 (array!57635 array!57633 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 64) Int) Unit!31931)

(assert (=> d!115409 (= lt!429307 (choose!1609 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) key!756 (defaultEntry!5836 thiss!1141)))))

(assert (=> d!115409 (validMask!0 (mask!27692 thiss!1141))))

(assert (=> d!115409 (= (lemmaKeyInListMapIsInArray!322 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) key!756 (defaultEntry!5836 thiss!1141)) lt!429307)))

(declare-fun b!952877 () Bool)

(assert (=> b!952877 (= e!536675 (arrayContainsKey!0 (_keys!10790 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952878 () Bool)

(assert (=> b!952878 (= e!536675 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115409 c!99689) b!952877))

(assert (= (and d!115409 (not c!99689)) b!952878))

(declare-fun m!884455 () Bool)

(assert (=> d!115409 m!884455))

(assert (=> d!115409 m!884439))

(assert (=> b!952877 m!884367))

(assert (=> b!952784 d!115409))

(declare-fun d!115411 () Bool)

(assert (=> d!115411 (arrayForallSeekEntryOrOpenFound!0 lt!429253 (_keys!10790 thiss!1141) (mask!27692 thiss!1141))))

(declare-fun lt!429310 () Unit!31931)

(declare-fun choose!38 (array!57635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31931)

(assert (=> d!115411 (= lt!429310 (choose!38 (_keys!10790 thiss!1141) (mask!27692 thiss!1141) #b00000000000000000000000000000000 lt!429253))))

(assert (=> d!115411 (validMask!0 (mask!27692 thiss!1141))))

(assert (=> d!115411 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10790 thiss!1141) (mask!27692 thiss!1141) #b00000000000000000000000000000000 lt!429253) lt!429310)))

(declare-fun bs!26742 () Bool)

(assert (= bs!26742 d!115411))

(assert (=> bs!26742 m!884359))

(declare-fun m!884457 () Bool)

(assert (=> bs!26742 m!884457))

(assert (=> bs!26742 m!884439))

(assert (=> b!952784 d!115411))

(declare-fun d!115413 () Bool)

(declare-fun lt!429313 () (_ BitVec 32))

(assert (=> d!115413 (and (or (bvslt lt!429313 #b00000000000000000000000000000000) (bvsge lt!429313 (size!28189 (_keys!10790 thiss!1141))) (and (bvsge lt!429313 #b00000000000000000000000000000000) (bvslt lt!429313 (size!28189 (_keys!10790 thiss!1141))))) (bvsge lt!429313 #b00000000000000000000000000000000) (bvslt lt!429313 (size!28189 (_keys!10790 thiss!1141))) (= (select (arr!27708 (_keys!10790 thiss!1141)) lt!429313) key!756))))

(declare-fun e!536678 () (_ BitVec 32))

(assert (=> d!115413 (= lt!429313 e!536678)))

(declare-fun c!99692 () Bool)

(assert (=> d!115413 (= c!99692 (= (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115413 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))) (bvslt (size!28189 (_keys!10790 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115413 (= (arrayScanForKey!0 (_keys!10790 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429313)))

(declare-fun b!952883 () Bool)

(assert (=> b!952883 (= e!536678 #b00000000000000000000000000000000)))

(declare-fun b!952884 () Bool)

(assert (=> b!952884 (= e!536678 (arrayScanForKey!0 (_keys!10790 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115413 c!99692) b!952883))

(assert (= (and d!115413 (not c!99692)) b!952884))

(declare-fun m!884459 () Bool)

(assert (=> d!115413 m!884459))

(assert (=> d!115413 m!884451))

(declare-fun m!884461 () Bool)

(assert (=> b!952884 m!884461))

(assert (=> b!952784 d!115413))

(declare-fun d!115415 () Bool)

(declare-fun res!638262 () Bool)

(declare-fun e!536685 () Bool)

(assert (=> d!115415 (=> res!638262 e!536685)))

(assert (=> d!115415 (= res!638262 (bvsge lt!429253 (size!28189 (_keys!10790 thiss!1141))))))

(assert (=> d!115415 (= (arrayForallSeekEntryOrOpenFound!0 lt!429253 (_keys!10790 thiss!1141) (mask!27692 thiss!1141)) e!536685)))

(declare-fun b!952893 () Bool)

(declare-fun e!536687 () Bool)

(declare-fun e!536686 () Bool)

(assert (=> b!952893 (= e!536687 e!536686)))

(declare-fun lt!429320 () (_ BitVec 64))

(assert (=> b!952893 (= lt!429320 (select (arr!27708 (_keys!10790 thiss!1141)) lt!429253))))

(declare-fun lt!429322 () Unit!31931)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57635 (_ BitVec 64) (_ BitVec 32)) Unit!31931)

(assert (=> b!952893 (= lt!429322 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10790 thiss!1141) lt!429320 lt!429253))))

(assert (=> b!952893 (arrayContainsKey!0 (_keys!10790 thiss!1141) lt!429320 #b00000000000000000000000000000000)))

(declare-fun lt!429321 () Unit!31931)

(assert (=> b!952893 (= lt!429321 lt!429322)))

(declare-fun res!638263 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57635 (_ BitVec 32)) SeekEntryResult!9162)

(assert (=> b!952893 (= res!638263 (= (seekEntryOrOpen!0 (select (arr!27708 (_keys!10790 thiss!1141)) lt!429253) (_keys!10790 thiss!1141) (mask!27692 thiss!1141)) (Found!9162 lt!429253)))))

(assert (=> b!952893 (=> (not res!638263) (not e!536686))))

(declare-fun b!952894 () Bool)

(declare-fun call!41601 () Bool)

(assert (=> b!952894 (= e!536686 call!41601)))

(declare-fun bm!41598 () Bool)

(assert (=> bm!41598 (= call!41601 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429253 #b00000000000000000000000000000001) (_keys!10790 thiss!1141) (mask!27692 thiss!1141)))))

(declare-fun b!952895 () Bool)

(assert (=> b!952895 (= e!536685 e!536687)))

(declare-fun c!99695 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952895 (= c!99695 (validKeyInArray!0 (select (arr!27708 (_keys!10790 thiss!1141)) lt!429253)))))

(declare-fun b!952896 () Bool)

(assert (=> b!952896 (= e!536687 call!41601)))

(assert (= (and d!115415 (not res!638262)) b!952895))

(assert (= (and b!952895 c!99695) b!952893))

(assert (= (and b!952895 (not c!99695)) b!952896))

(assert (= (and b!952893 res!638263) b!952894))

(assert (= (or b!952894 b!952896) bm!41598))

(declare-fun m!884463 () Bool)

(assert (=> b!952893 m!884463))

(declare-fun m!884465 () Bool)

(assert (=> b!952893 m!884465))

(declare-fun m!884467 () Bool)

(assert (=> b!952893 m!884467))

(assert (=> b!952893 m!884463))

(declare-fun m!884469 () Bool)

(assert (=> b!952893 m!884469))

(declare-fun m!884471 () Bool)

(assert (=> bm!41598 m!884471))

(assert (=> b!952895 m!884463))

(assert (=> b!952895 m!884463))

(declare-fun m!884473 () Bool)

(assert (=> b!952895 m!884473))

(assert (=> b!952784 d!115415))

(declare-fun d!115417 () Bool)

(declare-fun e!536693 () Bool)

(assert (=> d!115417 e!536693))

(declare-fun res!638266 () Bool)

(assert (=> d!115417 (=> res!638266 e!536693)))

(declare-fun lt!429334 () Bool)

(assert (=> d!115417 (= res!638266 (not lt!429334))))

(declare-fun lt!429331 () Bool)

(assert (=> d!115417 (= lt!429334 lt!429331)))

(declare-fun lt!429333 () Unit!31931)

(declare-fun e!536692 () Unit!31931)

(assert (=> d!115417 (= lt!429333 e!536692)))

(declare-fun c!99698 () Bool)

(assert (=> d!115417 (= c!99698 lt!429331)))

(declare-fun containsKey!474 (List!19375 (_ BitVec 64)) Bool)

(assert (=> d!115417 (= lt!429331 (containsKey!474 (toList!6179 (map!13094 thiss!1141)) key!756))))

(assert (=> d!115417 (= (contains!5217 (map!13094 thiss!1141) key!756) lt!429334)))

(declare-fun b!952903 () Bool)

(declare-fun lt!429332 () Unit!31931)

(assert (=> b!952903 (= e!536692 lt!429332)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!369 (List!19375 (_ BitVec 64)) Unit!31931)

(assert (=> b!952903 (= lt!429332 (lemmaContainsKeyImpliesGetValueByKeyDefined!369 (toList!6179 (map!13094 thiss!1141)) key!756))))

(declare-datatypes ((Option!516 0))(
  ( (Some!515 (v!13013 V!32719)) (None!514) )
))
(declare-fun isDefined!382 (Option!516) Bool)

(declare-fun getValueByKey!510 (List!19375 (_ BitVec 64)) Option!516)

(assert (=> b!952903 (isDefined!382 (getValueByKey!510 (toList!6179 (map!13094 thiss!1141)) key!756))))

(declare-fun b!952904 () Bool)

(declare-fun Unit!31941 () Unit!31931)

(assert (=> b!952904 (= e!536692 Unit!31941)))

(declare-fun b!952905 () Bool)

(assert (=> b!952905 (= e!536693 (isDefined!382 (getValueByKey!510 (toList!6179 (map!13094 thiss!1141)) key!756)))))

(assert (= (and d!115417 c!99698) b!952903))

(assert (= (and d!115417 (not c!99698)) b!952904))

(assert (= (and d!115417 (not res!638266)) b!952905))

(declare-fun m!884475 () Bool)

(assert (=> d!115417 m!884475))

(declare-fun m!884477 () Bool)

(assert (=> b!952903 m!884477))

(declare-fun m!884479 () Bool)

(assert (=> b!952903 m!884479))

(assert (=> b!952903 m!884479))

(declare-fun m!884481 () Bool)

(assert (=> b!952903 m!884481))

(assert (=> b!952905 m!884479))

(assert (=> b!952905 m!884479))

(assert (=> b!952905 m!884481))

(assert (=> b!952782 d!115417))

(declare-fun d!115419 () Bool)

(assert (=> d!115419 (= (map!13094 thiss!1141) (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun bs!26743 () Bool)

(assert (= bs!26743 d!115419))

(assert (=> bs!26743 m!884351))

(assert (=> b!952782 d!115419))

(declare-fun d!115421 () Bool)

(declare-fun e!536695 () Bool)

(assert (=> d!115421 e!536695))

(declare-fun res!638267 () Bool)

(assert (=> d!115421 (=> res!638267 e!536695)))

(declare-fun lt!429338 () Bool)

(assert (=> d!115421 (= res!638267 (not lt!429338))))

(declare-fun lt!429335 () Bool)

(assert (=> d!115421 (= lt!429338 lt!429335)))

(declare-fun lt!429337 () Unit!31931)

(declare-fun e!536694 () Unit!31931)

(assert (=> d!115421 (= lt!429337 e!536694)))

(declare-fun c!99699 () Bool)

(assert (=> d!115421 (= c!99699 lt!429335)))

(assert (=> d!115421 (= lt!429335 (containsKey!474 (toList!6179 (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756))))

(assert (=> d!115421 (= (contains!5217 (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)) key!756) lt!429338)))

(declare-fun b!952906 () Bool)

(declare-fun lt!429336 () Unit!31931)

(assert (=> b!952906 (= e!536694 lt!429336)))

(assert (=> b!952906 (= lt!429336 (lemmaContainsKeyImpliesGetValueByKeyDefined!369 (toList!6179 (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756))))

(assert (=> b!952906 (isDefined!382 (getValueByKey!510 (toList!6179 (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756))))

(declare-fun b!952907 () Bool)

(declare-fun Unit!31942 () Unit!31931)

(assert (=> b!952907 (= e!536694 Unit!31942)))

(declare-fun b!952908 () Bool)

(assert (=> b!952908 (= e!536695 (isDefined!382 (getValueByKey!510 (toList!6179 (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141))) key!756)))))

(assert (= (and d!115421 c!99699) b!952906))

(assert (= (and d!115421 (not c!99699)) b!952907))

(assert (= (and d!115421 (not res!638267)) b!952908))

(declare-fun m!884483 () Bool)

(assert (=> d!115421 m!884483))

(declare-fun m!884485 () Bool)

(assert (=> b!952906 m!884485))

(declare-fun m!884487 () Bool)

(assert (=> b!952906 m!884487))

(assert (=> b!952906 m!884487))

(declare-fun m!884489 () Bool)

(assert (=> b!952906 m!884489))

(assert (=> b!952908 m!884487))

(assert (=> b!952908 m!884487))

(assert (=> b!952908 m!884489))

(assert (=> b!952782 d!115421))

(declare-fun b!952951 () Bool)

(declare-fun e!536723 () Unit!31931)

(declare-fun lt!429384 () Unit!31931)

(assert (=> b!952951 (= e!536723 lt!429384)))

(declare-fun lt!429396 () ListLongMap!12327)

(declare-fun getCurrentListMapNoExtraKeys!3363 (array!57635 array!57633 (_ BitVec 32) (_ BitVec 32) V!32719 V!32719 (_ BitVec 32) Int) ListLongMap!12327)

(assert (=> b!952951 (= lt!429396 (getCurrentListMapNoExtraKeys!3363 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429389 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429389 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429398 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429398 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429390 () Unit!31931)

(declare-fun addStillContains!580 (ListLongMap!12327 (_ BitVec 64) V!32719 (_ BitVec 64)) Unit!31931)

(assert (=> b!952951 (= lt!429390 (addStillContains!580 lt!429396 lt!429389 (zeroValue!5672 thiss!1141) lt!429398))))

(declare-fun +!2891 (ListLongMap!12327 tuple2!13640) ListLongMap!12327)

(assert (=> b!952951 (contains!5217 (+!2891 lt!429396 (tuple2!13641 lt!429389 (zeroValue!5672 thiss!1141))) lt!429398)))

(declare-fun lt!429395 () Unit!31931)

(assert (=> b!952951 (= lt!429395 lt!429390)))

(declare-fun lt!429400 () ListLongMap!12327)

(assert (=> b!952951 (= lt!429400 (getCurrentListMapNoExtraKeys!3363 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429386 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429386 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429403 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429403 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429401 () Unit!31931)

(declare-fun addApplyDifferent!460 (ListLongMap!12327 (_ BitVec 64) V!32719 (_ BitVec 64)) Unit!31931)

(assert (=> b!952951 (= lt!429401 (addApplyDifferent!460 lt!429400 lt!429386 (minValue!5672 thiss!1141) lt!429403))))

(declare-fun apply!881 (ListLongMap!12327 (_ BitVec 64)) V!32719)

(assert (=> b!952951 (= (apply!881 (+!2891 lt!429400 (tuple2!13641 lt!429386 (minValue!5672 thiss!1141))) lt!429403) (apply!881 lt!429400 lt!429403))))

(declare-fun lt!429399 () Unit!31931)

(assert (=> b!952951 (= lt!429399 lt!429401)))

(declare-fun lt!429388 () ListLongMap!12327)

(assert (=> b!952951 (= lt!429388 (getCurrentListMapNoExtraKeys!3363 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429383 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429383 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429391 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429391 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429402 () Unit!31931)

(assert (=> b!952951 (= lt!429402 (addApplyDifferent!460 lt!429388 lt!429383 (zeroValue!5672 thiss!1141) lt!429391))))

(assert (=> b!952951 (= (apply!881 (+!2891 lt!429388 (tuple2!13641 lt!429383 (zeroValue!5672 thiss!1141))) lt!429391) (apply!881 lt!429388 lt!429391))))

(declare-fun lt!429394 () Unit!31931)

(assert (=> b!952951 (= lt!429394 lt!429402)))

(declare-fun lt!429392 () ListLongMap!12327)

(assert (=> b!952951 (= lt!429392 (getCurrentListMapNoExtraKeys!3363 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun lt!429385 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429385 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429387 () (_ BitVec 64))

(assert (=> b!952951 (= lt!429387 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952951 (= lt!429384 (addApplyDifferent!460 lt!429392 lt!429385 (minValue!5672 thiss!1141) lt!429387))))

(assert (=> b!952951 (= (apply!881 (+!2891 lt!429392 (tuple2!13641 lt!429385 (minValue!5672 thiss!1141))) lt!429387) (apply!881 lt!429392 lt!429387))))

(declare-fun b!952952 () Bool)

(declare-fun e!536732 () Bool)

(declare-fun lt!429404 () ListLongMap!12327)

(assert (=> b!952952 (= e!536732 (= (apply!881 lt!429404 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5672 thiss!1141)))))

(declare-fun bm!41613 () Bool)

(declare-fun call!41616 () Bool)

(assert (=> bm!41613 (= call!41616 (contains!5217 lt!429404 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!115423 () Bool)

(declare-fun e!536734 () Bool)

(assert (=> d!115423 e!536734))

(declare-fun res!638286 () Bool)

(assert (=> d!115423 (=> (not res!638286) (not e!536734))))

(assert (=> d!115423 (= res!638286 (or (bvsge #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))))))))

(declare-fun lt!429393 () ListLongMap!12327)

(assert (=> d!115423 (= lt!429404 lt!429393)))

(declare-fun lt!429397 () Unit!31931)

(assert (=> d!115423 (= lt!429397 e!536723)))

(declare-fun c!99713 () Bool)

(declare-fun e!536731 () Bool)

(assert (=> d!115423 (= c!99713 e!536731)))

(declare-fun res!638292 () Bool)

(assert (=> d!115423 (=> (not res!638292) (not e!536731))))

(assert (=> d!115423 (= res!638292 (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))))))

(declare-fun e!536728 () ListLongMap!12327)

(assert (=> d!115423 (= lt!429393 e!536728)))

(declare-fun c!99714 () Bool)

(assert (=> d!115423 (= c!99714 (and (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115423 (validMask!0 (mask!27692 thiss!1141))))

(assert (=> d!115423 (= (getCurrentListMap!3341 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)) lt!429404)))

(declare-fun b!952953 () Bool)

(declare-fun e!536733 () Bool)

(declare-fun call!41620 () Bool)

(assert (=> b!952953 (= e!536733 (not call!41620))))

(declare-fun b!952954 () Bool)

(declare-fun e!536729 () Bool)

(assert (=> b!952954 (= e!536734 e!536729)))

(declare-fun c!99717 () Bool)

(assert (=> b!952954 (= c!99717 (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952955 () Bool)

(declare-fun c!99712 () Bool)

(assert (=> b!952955 (= c!99712 (and (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!536727 () ListLongMap!12327)

(declare-fun e!536724 () ListLongMap!12327)

(assert (=> b!952955 (= e!536727 e!536724)))

(declare-fun b!952956 () Bool)

(declare-fun call!41621 () ListLongMap!12327)

(assert (=> b!952956 (= e!536724 call!41621)))

(declare-fun bm!41614 () Bool)

(assert (=> bm!41614 (= call!41620 (contains!5217 lt!429404 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952957 () Bool)

(assert (=> b!952957 (= e!536729 (not call!41616))))

(declare-fun bm!41615 () Bool)

(declare-fun call!41622 () ListLongMap!12327)

(declare-fun call!41619 () ListLongMap!12327)

(assert (=> bm!41615 (= call!41622 call!41619)))

(declare-fun b!952958 () Bool)

(declare-fun res!638288 () Bool)

(assert (=> b!952958 (=> (not res!638288) (not e!536734))))

(declare-fun e!536730 () Bool)

(assert (=> b!952958 (= res!638288 e!536730)))

(declare-fun res!638291 () Bool)

(assert (=> b!952958 (=> res!638291 e!536730)))

(declare-fun e!536726 () Bool)

(assert (=> b!952958 (= res!638291 (not e!536726))))

(declare-fun res!638287 () Bool)

(assert (=> b!952958 (=> (not res!638287) (not e!536726))))

(assert (=> b!952958 (= res!638287 (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))))))

(declare-fun b!952959 () Bool)

(declare-fun e!536725 () Bool)

(assert (=> b!952959 (= e!536729 e!536725)))

(declare-fun res!638293 () Bool)

(assert (=> b!952959 (= res!638293 call!41616)))

(assert (=> b!952959 (=> (not res!638293) (not e!536725))))

(declare-fun b!952960 () Bool)

(declare-fun call!41617 () ListLongMap!12327)

(assert (=> b!952960 (= e!536727 call!41617)))

(declare-fun b!952961 () Bool)

(assert (=> b!952961 (= e!536724 call!41617)))

(declare-fun bm!41616 () Bool)

(assert (=> bm!41616 (= call!41619 (getCurrentListMapNoExtraKeys!3363 (_keys!10790 thiss!1141) (_values!5859 thiss!1141) (mask!27692 thiss!1141) (extraKeys!5568 thiss!1141) (zeroValue!5672 thiss!1141) (minValue!5672 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5836 thiss!1141)))))

(declare-fun b!952962 () Bool)

(assert (=> b!952962 (= e!536731 (validKeyInArray!0 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41617 () Bool)

(assert (=> bm!41617 (= call!41621 call!41622)))

(declare-fun b!952963 () Bool)

(assert (=> b!952963 (= e!536728 e!536727)))

(declare-fun c!99716 () Bool)

(assert (=> b!952963 (= c!99716 (and (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952964 () Bool)

(assert (=> b!952964 (= e!536733 e!536732)))

(declare-fun res!638290 () Bool)

(assert (=> b!952964 (= res!638290 call!41620)))

(assert (=> b!952964 (=> (not res!638290) (not e!536732))))

(declare-fun b!952965 () Bool)

(assert (=> b!952965 (= e!536725 (= (apply!881 lt!429404 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5672 thiss!1141)))))

(declare-fun b!952966 () Bool)

(declare-fun e!536722 () Bool)

(declare-fun get!14564 (ValueCell!9926 V!32719) V!32719)

(declare-fun dynLambda!1647 (Int (_ BitVec 64)) V!32719)

(assert (=> b!952966 (= e!536722 (= (apply!881 lt!429404 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000)) (get!14564 (select (arr!27707 (_values!5859 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1647 (defaultEntry!5836 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28188 (_values!5859 thiss!1141))))))

(assert (=> b!952966 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))))))

(declare-fun bm!41618 () Bool)

(declare-fun call!41618 () ListLongMap!12327)

(assert (=> bm!41618 (= call!41617 call!41618)))

(declare-fun b!952967 () Bool)

(assert (=> b!952967 (= e!536726 (validKeyInArray!0 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952968 () Bool)

(assert (=> b!952968 (= e!536728 (+!2891 call!41618 (tuple2!13641 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5672 thiss!1141))))))

(declare-fun b!952969 () Bool)

(declare-fun res!638294 () Bool)

(assert (=> b!952969 (=> (not res!638294) (not e!536734))))

(assert (=> b!952969 (= res!638294 e!536733)))

(declare-fun c!99715 () Bool)

(assert (=> b!952969 (= c!99715 (not (= (bvand (extraKeys!5568 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41619 () Bool)

(assert (=> bm!41619 (= call!41618 (+!2891 (ite c!99714 call!41619 (ite c!99716 call!41622 call!41621)) (ite (or c!99714 c!99716) (tuple2!13641 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5672 thiss!1141)) (tuple2!13641 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5672 thiss!1141)))))))

(declare-fun b!952970 () Bool)

(assert (=> b!952970 (= e!536730 e!536722)))

(declare-fun res!638289 () Bool)

(assert (=> b!952970 (=> (not res!638289) (not e!536722))))

(assert (=> b!952970 (= res!638289 (contains!5217 lt!429404 (select (arr!27708 (_keys!10790 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952970 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28189 (_keys!10790 thiss!1141))))))

(declare-fun b!952971 () Bool)

(declare-fun Unit!31943 () Unit!31931)

(assert (=> b!952971 (= e!536723 Unit!31943)))

(assert (= (and d!115423 c!99714) b!952968))

(assert (= (and d!115423 (not c!99714)) b!952963))

(assert (= (and b!952963 c!99716) b!952960))

(assert (= (and b!952963 (not c!99716)) b!952955))

(assert (= (and b!952955 c!99712) b!952961))

(assert (= (and b!952955 (not c!99712)) b!952956))

(assert (= (or b!952961 b!952956) bm!41617))

(assert (= (or b!952960 bm!41617) bm!41615))

(assert (= (or b!952960 b!952961) bm!41618))

(assert (= (or b!952968 bm!41615) bm!41616))

(assert (= (or b!952968 bm!41618) bm!41619))

(assert (= (and d!115423 res!638292) b!952962))

(assert (= (and d!115423 c!99713) b!952951))

(assert (= (and d!115423 (not c!99713)) b!952971))

(assert (= (and d!115423 res!638286) b!952958))

(assert (= (and b!952958 res!638287) b!952967))

(assert (= (and b!952958 (not res!638291)) b!952970))

(assert (= (and b!952970 res!638289) b!952966))

(assert (= (and b!952958 res!638288) b!952969))

(assert (= (and b!952969 c!99715) b!952964))

(assert (= (and b!952969 (not c!99715)) b!952953))

(assert (= (and b!952964 res!638290) b!952952))

(assert (= (or b!952964 b!952953) bm!41614))

(assert (= (and b!952969 res!638294) b!952954))

(assert (= (and b!952954 c!99717) b!952959))

(assert (= (and b!952954 (not c!99717)) b!952957))

(assert (= (and b!952959 res!638293) b!952965))

(assert (= (or b!952959 b!952957) bm!41613))

(declare-fun b_lambda!14405 () Bool)

(assert (=> (not b_lambda!14405) (not b!952966)))

(declare-fun t!27729 () Bool)

(declare-fun tb!6203 () Bool)

(assert (=> (and b!952781 (= (defaultEntry!5836 thiss!1141) (defaultEntry!5836 thiss!1141)) t!27729) tb!6203))

(declare-fun result!12347 () Bool)

(assert (=> tb!6203 (= result!12347 tp_is_empty!20815)))

(assert (=> b!952966 t!27729))

(declare-fun b_and!29771 () Bool)

(assert (= b_and!29765 (and (=> t!27729 result!12347) b_and!29771)))

(declare-fun m!884491 () Bool)

(assert (=> bm!41616 m!884491))

(assert (=> b!952962 m!884451))

(assert (=> b!952962 m!884451))

(declare-fun m!884493 () Bool)

(assert (=> b!952962 m!884493))

(declare-fun m!884495 () Bool)

(assert (=> bm!41619 m!884495))

(assert (=> d!115423 m!884439))

(assert (=> b!952970 m!884451))

(assert (=> b!952970 m!884451))

(declare-fun m!884497 () Bool)

(assert (=> b!952970 m!884497))

(declare-fun m!884499 () Bool)

(assert (=> b!952952 m!884499))

(declare-fun m!884501 () Bool)

(assert (=> b!952966 m!884501))

(assert (=> b!952966 m!884451))

(declare-fun m!884503 () Bool)

(assert (=> b!952966 m!884503))

(declare-fun m!884505 () Bool)

(assert (=> b!952966 m!884505))

(assert (=> b!952966 m!884451))

(assert (=> b!952966 m!884501))

(assert (=> b!952966 m!884505))

(declare-fun m!884507 () Bool)

(assert (=> b!952966 m!884507))

(declare-fun m!884509 () Bool)

(assert (=> bm!41613 m!884509))

(assert (=> b!952967 m!884451))

(assert (=> b!952967 m!884451))

(assert (=> b!952967 m!884493))

(declare-fun m!884511 () Bool)

(assert (=> b!952951 m!884511))

(declare-fun m!884513 () Bool)

(assert (=> b!952951 m!884513))

(assert (=> b!952951 m!884451))

(assert (=> b!952951 m!884491))

(declare-fun m!884515 () Bool)

(assert (=> b!952951 m!884515))

(declare-fun m!884517 () Bool)

(assert (=> b!952951 m!884517))

(declare-fun m!884519 () Bool)

(assert (=> b!952951 m!884519))

(declare-fun m!884521 () Bool)

(assert (=> b!952951 m!884521))

(declare-fun m!884523 () Bool)

(assert (=> b!952951 m!884523))

(declare-fun m!884525 () Bool)

(assert (=> b!952951 m!884525))

(assert (=> b!952951 m!884523))

(declare-fun m!884527 () Bool)

(assert (=> b!952951 m!884527))

(assert (=> b!952951 m!884513))

(declare-fun m!884529 () Bool)

(assert (=> b!952951 m!884529))

(declare-fun m!884531 () Bool)

(assert (=> b!952951 m!884531))

(declare-fun m!884533 () Bool)

(assert (=> b!952951 m!884533))

(declare-fun m!884535 () Bool)

(assert (=> b!952951 m!884535))

(declare-fun m!884537 () Bool)

(assert (=> b!952951 m!884537))

(assert (=> b!952951 m!884527))

(declare-fun m!884539 () Bool)

(assert (=> b!952951 m!884539))

(assert (=> b!952951 m!884531))

(declare-fun m!884541 () Bool)

(assert (=> bm!41614 m!884541))

(declare-fun m!884543 () Bool)

(assert (=> b!952965 m!884543))

(declare-fun m!884545 () Bool)

(assert (=> b!952968 m!884545))

(assert (=> b!952782 d!115423))

(declare-fun b!952980 () Bool)

(declare-fun e!536740 () Bool)

(assert (=> b!952980 (= e!536740 tp_is_empty!20815)))

(declare-fun condMapEmpty!33175 () Bool)

(declare-fun mapDefault!33175 () ValueCell!9926)

(assert (=> mapNonEmpty!33166 (= condMapEmpty!33175 (= mapRest!33166 ((as const (Array (_ BitVec 32) ValueCell!9926)) mapDefault!33175)))))

(declare-fun e!536739 () Bool)

(declare-fun mapRes!33175 () Bool)

(assert (=> mapNonEmpty!33166 (= tp!63549 (and e!536739 mapRes!33175))))

(declare-fun mapNonEmpty!33175 () Bool)

(declare-fun tp!63565 () Bool)

(assert (=> mapNonEmpty!33175 (= mapRes!33175 (and tp!63565 e!536740))))

(declare-fun mapKey!33175 () (_ BitVec 32))

(declare-fun mapRest!33175 () (Array (_ BitVec 32) ValueCell!9926))

(declare-fun mapValue!33175 () ValueCell!9926)

(assert (=> mapNonEmpty!33175 (= mapRest!33166 (store mapRest!33175 mapKey!33175 mapValue!33175))))

(declare-fun mapIsEmpty!33175 () Bool)

(assert (=> mapIsEmpty!33175 mapRes!33175))

(declare-fun b!952981 () Bool)

(assert (=> b!952981 (= e!536739 tp_is_empty!20815)))

(assert (= (and mapNonEmpty!33166 condMapEmpty!33175) mapIsEmpty!33175))

(assert (= (and mapNonEmpty!33166 (not condMapEmpty!33175)) mapNonEmpty!33175))

(assert (= (and mapNonEmpty!33175 ((_ is ValueCellFull!9926) mapValue!33175)) b!952980))

(assert (= (and mapNonEmpty!33166 ((_ is ValueCellFull!9926) mapDefault!33175)) b!952981))

(declare-fun m!884547 () Bool)

(assert (=> mapNonEmpty!33175 m!884547))

(declare-fun b_lambda!14407 () Bool)

(assert (= b_lambda!14405 (or (and b!952781 b_free!18307) b_lambda!14407)))

(check-sat (not d!115423) (not d!115411) (not b!952951) (not b!952965) (not d!115405) tp_is_empty!20815 (not b!952893) (not b!952962) (not b!952970) (not d!115409) (not b!952903) (not bm!41598) (not mapNonEmpty!33175) (not b!952855) (not b!952865) (not bm!41614) (not d!115399) (not b_lambda!14407) (not b!952866) (not b!952968) (not b!952966) (not d!115397) (not b!952864) (not b!952967) (not b!952906) (not b!952908) (not bm!41613) (not b!952877) b_and!29771 (not d!115421) (not b_next!18307) (not b!952884) (not b!952872) (not bm!41616) (not b!952895) (not b!952905) (not d!115417) (not d!115419) (not b!952952) (not bm!41619))
(check-sat b_and!29771 (not b_next!18307))
