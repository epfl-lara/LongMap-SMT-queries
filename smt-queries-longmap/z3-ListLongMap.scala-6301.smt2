; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80772 () Bool)

(assert start!80772)

(declare-fun b!946950 () Bool)

(declare-fun b_free!18127 () Bool)

(declare-fun b_next!18127 () Bool)

(assert (=> b!946950 (= b_free!18127 (not b_next!18127))))

(declare-fun tp!62916 () Bool)

(declare-fun b_and!29559 () Bool)

(assert (=> b!946950 (= tp!62916 b_and!29559)))

(declare-fun b!946946 () Bool)

(declare-fun res!635549 () Bool)

(declare-fun e!532814 () Bool)

(assert (=> b!946946 (=> (not res!635549) (not e!532814))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!946946 (= res!635549 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32802 () Bool)

(declare-fun mapRes!32802 () Bool)

(declare-fun tp!62915 () Bool)

(declare-fun e!532813 () Bool)

(assert (=> mapNonEmpty!32802 (= mapRes!32802 (and tp!62915 e!532813))))

(declare-datatypes ((V!32479 0))(
  ( (V!32480 (val!10368 Int)) )
))
(declare-datatypes ((ValueCell!9836 0))(
  ( (ValueCellFull!9836 (v!12899 V!32479)) (EmptyCell!9836) )
))
(declare-fun mapValue!32802 () ValueCell!9836)

(declare-datatypes ((array!57303 0))(
  ( (array!57304 (arr!27565 (Array (_ BitVec 32) ValueCell!9836)) (size!28035 (_ BitVec 32))) )
))
(declare-datatypes ((array!57305 0))(
  ( (array!57306 (arr!27566 (Array (_ BitVec 32) (_ BitVec 64))) (size!28036 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4822 0))(
  ( (LongMapFixedSize!4823 (defaultEntry!5708 Int) (mask!27440 (_ BitVec 32)) (extraKeys!5440 (_ BitVec 32)) (zeroValue!5544 V!32479) (minValue!5544 V!32479) (_size!2466 (_ BitVec 32)) (_keys!10624 array!57305) (_values!5731 array!57303) (_vacant!2466 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4822)

(declare-fun mapKey!32802 () (_ BitVec 32))

(declare-fun mapRest!32802 () (Array (_ BitVec 32) ValueCell!9836))

(assert (=> mapNonEmpty!32802 (= (arr!27565 (_values!5731 thiss!1141)) (store mapRest!32802 mapKey!32802 mapValue!32802))))

(declare-fun res!635550 () Bool)

(assert (=> start!80772 (=> (not res!635550) (not e!532814))))

(declare-fun valid!1848 (LongMapFixedSize!4822) Bool)

(assert (=> start!80772 (= res!635550 (valid!1848 thiss!1141))))

(assert (=> start!80772 e!532814))

(declare-fun e!532816 () Bool)

(assert (=> start!80772 e!532816))

(assert (=> start!80772 true))

(declare-fun b!946947 () Bool)

(declare-fun e!532812 () Bool)

(declare-fun e!532811 () Bool)

(assert (=> b!946947 (= e!532812 (not e!532811))))

(declare-fun res!635547 () Bool)

(assert (=> b!946947 (=> res!635547 e!532811)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!946947 (= res!635547 (not (validMask!0 (mask!27440 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57305 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!946947 (arrayContainsKey!0 (_keys!10624 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31873 0))(
  ( (Unit!31874) )
))
(declare-fun lt!426538 () Unit!31873)

(declare-datatypes ((SeekEntryResult!9055 0))(
  ( (MissingZero!9055 (index!38591 (_ BitVec 32))) (Found!9055 (index!38592 (_ BitVec 32))) (Intermediate!9055 (undefined!9867 Bool) (index!38593 (_ BitVec 32)) (x!81305 (_ BitVec 32))) (Undefined!9055) (MissingVacant!9055 (index!38594 (_ BitVec 32))) )
))
(declare-fun lt!426537 () SeekEntryResult!9055)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57305 (_ BitVec 64) (_ BitVec 32)) Unit!31873)

(assert (=> b!946947 (= lt!426538 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10624 thiss!1141) key!756 (index!38592 lt!426537)))))

(declare-fun b!946948 () Bool)

(declare-fun tp_is_empty!20635 () Bool)

(assert (=> b!946948 (= e!532813 tp_is_empty!20635)))

(declare-fun b!946949 () Bool)

(declare-fun e!532815 () Bool)

(declare-fun e!532810 () Bool)

(assert (=> b!946949 (= e!532815 (and e!532810 mapRes!32802))))

(declare-fun condMapEmpty!32802 () Bool)

(declare-fun mapDefault!32802 () ValueCell!9836)

(assert (=> b!946949 (= condMapEmpty!32802 (= (arr!27565 (_values!5731 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9836)) mapDefault!32802)))))

(declare-fun array_inv!21490 (array!57305) Bool)

(declare-fun array_inv!21491 (array!57303) Bool)

(assert (=> b!946950 (= e!532816 (and tp!62916 tp_is_empty!20635 (array_inv!21490 (_keys!10624 thiss!1141)) (array_inv!21491 (_values!5731 thiss!1141)) e!532815))))

(declare-fun b!946951 () Bool)

(assert (=> b!946951 (= e!532810 tp_is_empty!20635)))

(declare-fun b!946952 () Bool)

(assert (=> b!946952 (= e!532814 e!532812)))

(declare-fun res!635548 () Bool)

(assert (=> b!946952 (=> (not res!635548) (not e!532812))))

(get-info :version)

(assert (=> b!946952 (= res!635548 ((_ is Found!9055) lt!426537))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57305 (_ BitVec 32)) SeekEntryResult!9055)

(assert (=> b!946952 (= lt!426537 (seekEntry!0 key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)))))

(declare-fun b!946953 () Bool)

(assert (=> b!946953 (= e!532811 (= (size!28035 (_values!5731 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27440 thiss!1141))))))

(declare-fun mapIsEmpty!32802 () Bool)

(assert (=> mapIsEmpty!32802 mapRes!32802))

(assert (= (and start!80772 res!635550) b!946946))

(assert (= (and b!946946 res!635549) b!946952))

(assert (= (and b!946952 res!635548) b!946947))

(assert (= (and b!946947 (not res!635547)) b!946953))

(assert (= (and b!946949 condMapEmpty!32802) mapIsEmpty!32802))

(assert (= (and b!946949 (not condMapEmpty!32802)) mapNonEmpty!32802))

(assert (= (and mapNonEmpty!32802 ((_ is ValueCellFull!9836) mapValue!32802)) b!946948))

(assert (= (and b!946949 ((_ is ValueCellFull!9836) mapDefault!32802)) b!946951))

(assert (= b!946950 b!946949))

(assert (= start!80772 b!946950))

(declare-fun m!880891 () Bool)

(assert (=> mapNonEmpty!32802 m!880891))

(declare-fun m!880893 () Bool)

(assert (=> start!80772 m!880893))

(declare-fun m!880895 () Bool)

(assert (=> b!946952 m!880895))

(declare-fun m!880897 () Bool)

(assert (=> b!946947 m!880897))

(declare-fun m!880899 () Bool)

(assert (=> b!946947 m!880899))

(declare-fun m!880901 () Bool)

(assert (=> b!946947 m!880901))

(declare-fun m!880903 () Bool)

(assert (=> b!946950 m!880903))

(declare-fun m!880905 () Bool)

(assert (=> b!946950 m!880905))

(check-sat (not b_next!18127) (not b!946952) (not start!80772) tp_is_empty!20635 (not b!946950) (not b!946947) (not mapNonEmpty!32802) b_and!29559)
(check-sat b_and!29559 (not b_next!18127))
(get-model)

(declare-fun d!114801 () Bool)

(assert (=> d!114801 (= (array_inv!21490 (_keys!10624 thiss!1141)) (bvsge (size!28036 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946950 d!114801))

(declare-fun d!114803 () Bool)

(assert (=> d!114803 (= (array_inv!21491 (_values!5731 thiss!1141)) (bvsge (size!28035 (_values!5731 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!946950 d!114803))

(declare-fun d!114805 () Bool)

(assert (=> d!114805 (= (validMask!0 (mask!27440 thiss!1141)) (and (or (= (mask!27440 thiss!1141) #b00000000000000000000000000000111) (= (mask!27440 thiss!1141) #b00000000000000000000000000001111) (= (mask!27440 thiss!1141) #b00000000000000000000000000011111) (= (mask!27440 thiss!1141) #b00000000000000000000000000111111) (= (mask!27440 thiss!1141) #b00000000000000000000000001111111) (= (mask!27440 thiss!1141) #b00000000000000000000000011111111) (= (mask!27440 thiss!1141) #b00000000000000000000000111111111) (= (mask!27440 thiss!1141) #b00000000000000000000001111111111) (= (mask!27440 thiss!1141) #b00000000000000000000011111111111) (= (mask!27440 thiss!1141) #b00000000000000000000111111111111) (= (mask!27440 thiss!1141) #b00000000000000000001111111111111) (= (mask!27440 thiss!1141) #b00000000000000000011111111111111) (= (mask!27440 thiss!1141) #b00000000000000000111111111111111) (= (mask!27440 thiss!1141) #b00000000000000001111111111111111) (= (mask!27440 thiss!1141) #b00000000000000011111111111111111) (= (mask!27440 thiss!1141) #b00000000000000111111111111111111) (= (mask!27440 thiss!1141) #b00000000000001111111111111111111) (= (mask!27440 thiss!1141) #b00000000000011111111111111111111) (= (mask!27440 thiss!1141) #b00000000000111111111111111111111) (= (mask!27440 thiss!1141) #b00000000001111111111111111111111) (= (mask!27440 thiss!1141) #b00000000011111111111111111111111) (= (mask!27440 thiss!1141) #b00000000111111111111111111111111) (= (mask!27440 thiss!1141) #b00000001111111111111111111111111) (= (mask!27440 thiss!1141) #b00000011111111111111111111111111) (= (mask!27440 thiss!1141) #b00000111111111111111111111111111) (= (mask!27440 thiss!1141) #b00001111111111111111111111111111) (= (mask!27440 thiss!1141) #b00011111111111111111111111111111) (= (mask!27440 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27440 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!946947 d!114805))

(declare-fun d!114807 () Bool)

(declare-fun res!635579 () Bool)

(declare-fun e!532869 () Bool)

(assert (=> d!114807 (=> res!635579 e!532869)))

(assert (=> d!114807 (= res!635579 (= (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114807 (= (arrayContainsKey!0 (_keys!10624 thiss!1141) key!756 #b00000000000000000000000000000000) e!532869)))

(declare-fun b!947006 () Bool)

(declare-fun e!532870 () Bool)

(assert (=> b!947006 (= e!532869 e!532870)))

(declare-fun res!635580 () Bool)

(assert (=> b!947006 (=> (not res!635580) (not e!532870))))

(assert (=> b!947006 (= res!635580 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28036 (_keys!10624 thiss!1141))))))

(declare-fun b!947007 () Bool)

(assert (=> b!947007 (= e!532870 (arrayContainsKey!0 (_keys!10624 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114807 (not res!635579)) b!947006))

(assert (= (and b!947006 res!635580) b!947007))

(declare-fun m!880939 () Bool)

(assert (=> d!114807 m!880939))

(declare-fun m!880941 () Bool)

(assert (=> b!947007 m!880941))

(assert (=> b!946947 d!114807))

(declare-fun d!114809 () Bool)

(assert (=> d!114809 (arrayContainsKey!0 (_keys!10624 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426553 () Unit!31873)

(declare-fun choose!13 (array!57305 (_ BitVec 64) (_ BitVec 32)) Unit!31873)

(assert (=> d!114809 (= lt!426553 (choose!13 (_keys!10624 thiss!1141) key!756 (index!38592 lt!426537)))))

(assert (=> d!114809 (bvsge (index!38592 lt!426537) #b00000000000000000000000000000000)))

(assert (=> d!114809 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10624 thiss!1141) key!756 (index!38592 lt!426537)) lt!426553)))

(declare-fun bs!26609 () Bool)

(assert (= bs!26609 d!114809))

(assert (=> bs!26609 m!880899))

(declare-fun m!880943 () Bool)

(assert (=> bs!26609 m!880943))

(assert (=> b!946947 d!114809))

(declare-fun b!947020 () Bool)

(declare-fun e!532879 () SeekEntryResult!9055)

(declare-fun lt!426563 () SeekEntryResult!9055)

(assert (=> b!947020 (= e!532879 (Found!9055 (index!38593 lt!426563)))))

(declare-fun d!114811 () Bool)

(declare-fun lt!426565 () SeekEntryResult!9055)

(assert (=> d!114811 (and (or ((_ is MissingVacant!9055) lt!426565) (not ((_ is Found!9055) lt!426565)) (and (bvsge (index!38592 lt!426565) #b00000000000000000000000000000000) (bvslt (index!38592 lt!426565) (size!28036 (_keys!10624 thiss!1141))))) (not ((_ is MissingVacant!9055) lt!426565)) (or (not ((_ is Found!9055) lt!426565)) (= (select (arr!27566 (_keys!10624 thiss!1141)) (index!38592 lt!426565)) key!756)))))

(declare-fun e!532878 () SeekEntryResult!9055)

(assert (=> d!114811 (= lt!426565 e!532878)))

(declare-fun c!98784 () Bool)

(assert (=> d!114811 (= c!98784 (and ((_ is Intermediate!9055) lt!426563) (undefined!9867 lt!426563)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57305 (_ BitVec 32)) SeekEntryResult!9055)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114811 (= lt!426563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27440 thiss!1141)) key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)))))

(assert (=> d!114811 (validMask!0 (mask!27440 thiss!1141))))

(assert (=> d!114811 (= (seekEntry!0 key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)) lt!426565)))

(declare-fun b!947021 () Bool)

(declare-fun e!532877 () SeekEntryResult!9055)

(declare-fun lt!426562 () SeekEntryResult!9055)

(assert (=> b!947021 (= e!532877 (ite ((_ is MissingVacant!9055) lt!426562) (MissingZero!9055 (index!38594 lt!426562)) lt!426562))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57305 (_ BitVec 32)) SeekEntryResult!9055)

(assert (=> b!947021 (= lt!426562 (seekKeyOrZeroReturnVacant!0 (x!81305 lt!426563) (index!38593 lt!426563) (index!38593 lt!426563) key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)))))

(declare-fun b!947022 () Bool)

(assert (=> b!947022 (= e!532878 e!532879)))

(declare-fun lt!426564 () (_ BitVec 64))

(assert (=> b!947022 (= lt!426564 (select (arr!27566 (_keys!10624 thiss!1141)) (index!38593 lt!426563)))))

(declare-fun c!98785 () Bool)

(assert (=> b!947022 (= c!98785 (= lt!426564 key!756))))

(declare-fun b!947023 () Bool)

(declare-fun c!98786 () Bool)

(assert (=> b!947023 (= c!98786 (= lt!426564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947023 (= e!532879 e!532877)))

(declare-fun b!947024 () Bool)

(assert (=> b!947024 (= e!532878 Undefined!9055)))

(declare-fun b!947025 () Bool)

(assert (=> b!947025 (= e!532877 (MissingZero!9055 (index!38593 lt!426563)))))

(assert (= (and d!114811 c!98784) b!947024))

(assert (= (and d!114811 (not c!98784)) b!947022))

(assert (= (and b!947022 c!98785) b!947020))

(assert (= (and b!947022 (not c!98785)) b!947023))

(assert (= (and b!947023 c!98786) b!947025))

(assert (= (and b!947023 (not c!98786)) b!947021))

(declare-fun m!880945 () Bool)

(assert (=> d!114811 m!880945))

(declare-fun m!880947 () Bool)

(assert (=> d!114811 m!880947))

(assert (=> d!114811 m!880947))

(declare-fun m!880949 () Bool)

(assert (=> d!114811 m!880949))

(assert (=> d!114811 m!880897))

(declare-fun m!880951 () Bool)

(assert (=> b!947021 m!880951))

(declare-fun m!880953 () Bool)

(assert (=> b!947022 m!880953))

(assert (=> b!946952 d!114811))

(declare-fun d!114813 () Bool)

(declare-fun res!635587 () Bool)

(declare-fun e!532882 () Bool)

(assert (=> d!114813 (=> (not res!635587) (not e!532882))))

(declare-fun simpleValid!356 (LongMapFixedSize!4822) Bool)

(assert (=> d!114813 (= res!635587 (simpleValid!356 thiss!1141))))

(assert (=> d!114813 (= (valid!1848 thiss!1141) e!532882)))

(declare-fun b!947032 () Bool)

(declare-fun res!635588 () Bool)

(assert (=> b!947032 (=> (not res!635588) (not e!532882))))

(declare-fun arrayCountValidKeys!0 (array!57305 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947032 (= res!635588 (= (arrayCountValidKeys!0 (_keys!10624 thiss!1141) #b00000000000000000000000000000000 (size!28036 (_keys!10624 thiss!1141))) (_size!2466 thiss!1141)))))

(declare-fun b!947033 () Bool)

(declare-fun res!635589 () Bool)

(assert (=> b!947033 (=> (not res!635589) (not e!532882))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57305 (_ BitVec 32)) Bool)

(assert (=> b!947033 (= res!635589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)))))

(declare-fun b!947034 () Bool)

(declare-datatypes ((List!19281 0))(
  ( (Nil!19278) (Cons!19277 (h!20435 (_ BitVec 64)) (t!27594 List!19281)) )
))
(declare-fun arrayNoDuplicates!0 (array!57305 (_ BitVec 32) List!19281) Bool)

(assert (=> b!947034 (= e!532882 (arrayNoDuplicates!0 (_keys!10624 thiss!1141) #b00000000000000000000000000000000 Nil!19278))))

(assert (= (and d!114813 res!635587) b!947032))

(assert (= (and b!947032 res!635588) b!947033))

(assert (= (and b!947033 res!635589) b!947034))

(declare-fun m!880955 () Bool)

(assert (=> d!114813 m!880955))

(declare-fun m!880957 () Bool)

(assert (=> b!947032 m!880957))

(declare-fun m!880959 () Bool)

(assert (=> b!947033 m!880959))

(declare-fun m!880961 () Bool)

(assert (=> b!947034 m!880961))

(assert (=> start!80772 d!114813))

(declare-fun b!947042 () Bool)

(declare-fun e!532888 () Bool)

(assert (=> b!947042 (= e!532888 tp_is_empty!20635)))

(declare-fun b!947041 () Bool)

(declare-fun e!532887 () Bool)

(assert (=> b!947041 (= e!532887 tp_is_empty!20635)))

(declare-fun condMapEmpty!32811 () Bool)

(declare-fun mapDefault!32811 () ValueCell!9836)

(assert (=> mapNonEmpty!32802 (= condMapEmpty!32811 (= mapRest!32802 ((as const (Array (_ BitVec 32) ValueCell!9836)) mapDefault!32811)))))

(declare-fun mapRes!32811 () Bool)

(assert (=> mapNonEmpty!32802 (= tp!62915 (and e!532888 mapRes!32811))))

(declare-fun mapIsEmpty!32811 () Bool)

(assert (=> mapIsEmpty!32811 mapRes!32811))

(declare-fun mapNonEmpty!32811 () Bool)

(declare-fun tp!62931 () Bool)

(assert (=> mapNonEmpty!32811 (= mapRes!32811 (and tp!62931 e!532887))))

(declare-fun mapRest!32811 () (Array (_ BitVec 32) ValueCell!9836))

(declare-fun mapKey!32811 () (_ BitVec 32))

(declare-fun mapValue!32811 () ValueCell!9836)

(assert (=> mapNonEmpty!32811 (= mapRest!32802 (store mapRest!32811 mapKey!32811 mapValue!32811))))

(assert (= (and mapNonEmpty!32802 condMapEmpty!32811) mapIsEmpty!32811))

(assert (= (and mapNonEmpty!32802 (not condMapEmpty!32811)) mapNonEmpty!32811))

(assert (= (and mapNonEmpty!32811 ((_ is ValueCellFull!9836) mapValue!32811)) b!947041))

(assert (= (and mapNonEmpty!32802 ((_ is ValueCellFull!9836) mapDefault!32811)) b!947042))

(declare-fun m!880963 () Bool)

(assert (=> mapNonEmpty!32811 m!880963))

(check-sat (not b!947007) (not mapNonEmpty!32811) (not b!947034) (not b!947032) (not d!114813) (not b_next!18127) (not d!114809) tp_is_empty!20635 (not b!947021) (not d!114811) b_and!29559 (not b!947033))
(check-sat b_and!29559 (not b_next!18127))
(get-model)

(declare-fun b!947051 () Bool)

(declare-fun e!532896 () Bool)

(declare-fun e!532895 () Bool)

(assert (=> b!947051 (= e!532896 e!532895)))

(declare-fun c!98789 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947051 (= c!98789 (validKeyInArray!0 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947052 () Bool)

(declare-fun e!532897 () Bool)

(assert (=> b!947052 (= e!532895 e!532897)))

(declare-fun lt!426574 () (_ BitVec 64))

(assert (=> b!947052 (= lt!426574 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426573 () Unit!31873)

(assert (=> b!947052 (= lt!426573 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10624 thiss!1141) lt!426574 #b00000000000000000000000000000000))))

(assert (=> b!947052 (arrayContainsKey!0 (_keys!10624 thiss!1141) lt!426574 #b00000000000000000000000000000000)))

(declare-fun lt!426572 () Unit!31873)

(assert (=> b!947052 (= lt!426572 lt!426573)))

(declare-fun res!635594 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57305 (_ BitVec 32)) SeekEntryResult!9055)

(assert (=> b!947052 (= res!635594 (= (seekEntryOrOpen!0 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000) (_keys!10624 thiss!1141) (mask!27440 thiss!1141)) (Found!9055 #b00000000000000000000000000000000)))))

(assert (=> b!947052 (=> (not res!635594) (not e!532897))))

(declare-fun b!947053 () Bool)

(declare-fun call!41115 () Bool)

(assert (=> b!947053 (= e!532897 call!41115)))

(declare-fun d!114815 () Bool)

(declare-fun res!635595 () Bool)

(assert (=> d!114815 (=> res!635595 e!532896)))

(assert (=> d!114815 (= res!635595 (bvsge #b00000000000000000000000000000000 (size!28036 (_keys!10624 thiss!1141))))))

(assert (=> d!114815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)) e!532896)))

(declare-fun b!947054 () Bool)

(assert (=> b!947054 (= e!532895 call!41115)))

(declare-fun bm!41112 () Bool)

(assert (=> bm!41112 (= call!41115 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10624 thiss!1141) (mask!27440 thiss!1141)))))

(assert (= (and d!114815 (not res!635595)) b!947051))

(assert (= (and b!947051 c!98789) b!947052))

(assert (= (and b!947051 (not c!98789)) b!947054))

(assert (= (and b!947052 res!635594) b!947053))

(assert (= (or b!947053 b!947054) bm!41112))

(assert (=> b!947051 m!880939))

(assert (=> b!947051 m!880939))

(declare-fun m!880965 () Bool)

(assert (=> b!947051 m!880965))

(assert (=> b!947052 m!880939))

(declare-fun m!880967 () Bool)

(assert (=> b!947052 m!880967))

(declare-fun m!880969 () Bool)

(assert (=> b!947052 m!880969))

(assert (=> b!947052 m!880939))

(declare-fun m!880971 () Bool)

(assert (=> b!947052 m!880971))

(declare-fun m!880973 () Bool)

(assert (=> bm!41112 m!880973))

(assert (=> b!947033 d!114815))

(assert (=> d!114809 d!114807))

(declare-fun d!114817 () Bool)

(assert (=> d!114817 (arrayContainsKey!0 (_keys!10624 thiss!1141) key!756 #b00000000000000000000000000000000)))

(assert (=> d!114817 true))

(declare-fun _$60!430 () Unit!31873)

(assert (=> d!114817 (= (choose!13 (_keys!10624 thiss!1141) key!756 (index!38592 lt!426537)) _$60!430)))

(declare-fun bs!26610 () Bool)

(assert (= bs!26610 d!114817))

(assert (=> bs!26610 m!880899))

(assert (=> d!114809 d!114817))

(declare-fun d!114819 () Bool)

(declare-fun res!635596 () Bool)

(declare-fun e!532898 () Bool)

(assert (=> d!114819 (=> res!635596 e!532898)))

(assert (=> d!114819 (= res!635596 (= (select (arr!27566 (_keys!10624 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114819 (= (arrayContainsKey!0 (_keys!10624 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!532898)))

(declare-fun b!947055 () Bool)

(declare-fun e!532899 () Bool)

(assert (=> b!947055 (= e!532898 e!532899)))

(declare-fun res!635597 () Bool)

(assert (=> b!947055 (=> (not res!635597) (not e!532899))))

(assert (=> b!947055 (= res!635597 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28036 (_keys!10624 thiss!1141))))))

(declare-fun b!947056 () Bool)

(assert (=> b!947056 (= e!532899 (arrayContainsKey!0 (_keys!10624 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114819 (not res!635596)) b!947055))

(assert (= (and b!947055 res!635597) b!947056))

(declare-fun m!880975 () Bool)

(assert (=> d!114819 m!880975))

(declare-fun m!880977 () Bool)

(assert (=> b!947056 m!880977))

(assert (=> b!947007 d!114819))

(declare-fun b!947065 () Bool)

(declare-fun e!532905 () (_ BitVec 32))

(declare-fun call!41118 () (_ BitVec 32))

(assert (=> b!947065 (= e!532905 call!41118)))

(declare-fun b!947067 () Bool)

(declare-fun e!532904 () (_ BitVec 32))

(assert (=> b!947067 (= e!532904 #b00000000000000000000000000000000)))

(declare-fun b!947068 () Bool)

(assert (=> b!947068 (= e!532904 e!532905)))

(declare-fun c!98794 () Bool)

(assert (=> b!947068 (= c!98794 (validKeyInArray!0 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41115 () Bool)

(assert (=> bm!41115 (= call!41118 (arrayCountValidKeys!0 (_keys!10624 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28036 (_keys!10624 thiss!1141))))))

(declare-fun d!114821 () Bool)

(declare-fun lt!426577 () (_ BitVec 32))

(assert (=> d!114821 (and (bvsge lt!426577 #b00000000000000000000000000000000) (bvsle lt!426577 (bvsub (size!28036 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114821 (= lt!426577 e!532904)))

(declare-fun c!98795 () Bool)

(assert (=> d!114821 (= c!98795 (bvsge #b00000000000000000000000000000000 (size!28036 (_keys!10624 thiss!1141))))))

(assert (=> d!114821 (and (bvsle #b00000000000000000000000000000000 (size!28036 (_keys!10624 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28036 (_keys!10624 thiss!1141)) (size!28036 (_keys!10624 thiss!1141))))))

(assert (=> d!114821 (= (arrayCountValidKeys!0 (_keys!10624 thiss!1141) #b00000000000000000000000000000000 (size!28036 (_keys!10624 thiss!1141))) lt!426577)))

(declare-fun b!947066 () Bool)

(assert (=> b!947066 (= e!532905 (bvadd #b00000000000000000000000000000001 call!41118))))

(assert (= (and d!114821 c!98795) b!947067))

(assert (= (and d!114821 (not c!98795)) b!947068))

(assert (= (and b!947068 c!98794) b!947066))

(assert (= (and b!947068 (not c!98794)) b!947065))

(assert (= (or b!947066 b!947065) bm!41115))

(assert (=> b!947068 m!880939))

(assert (=> b!947068 m!880939))

(assert (=> b!947068 m!880965))

(declare-fun m!880979 () Bool)

(assert (=> bm!41115 m!880979))

(assert (=> b!947032 d!114821))

(declare-fun b!947078 () Bool)

(declare-fun res!635608 () Bool)

(declare-fun e!532908 () Bool)

(assert (=> b!947078 (=> (not res!635608) (not e!532908))))

(declare-fun size!28041 (LongMapFixedSize!4822) (_ BitVec 32))

(assert (=> b!947078 (= res!635608 (bvsge (size!28041 thiss!1141) (_size!2466 thiss!1141)))))

(declare-fun b!947077 () Bool)

(declare-fun res!635607 () Bool)

(assert (=> b!947077 (=> (not res!635607) (not e!532908))))

(assert (=> b!947077 (= res!635607 (and (= (size!28035 (_values!5731 thiss!1141)) (bvadd (mask!27440 thiss!1141) #b00000000000000000000000000000001)) (= (size!28036 (_keys!10624 thiss!1141)) (size!28035 (_values!5731 thiss!1141))) (bvsge (_size!2466 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2466 thiss!1141) (bvadd (mask!27440 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!947080 () Bool)

(assert (=> b!947080 (= e!532908 (and (bvsge (extraKeys!5440 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5440 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2466 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun d!114823 () Bool)

(declare-fun res!635606 () Bool)

(assert (=> d!114823 (=> (not res!635606) (not e!532908))))

(assert (=> d!114823 (= res!635606 (validMask!0 (mask!27440 thiss!1141)))))

(assert (=> d!114823 (= (simpleValid!356 thiss!1141) e!532908)))

(declare-fun b!947079 () Bool)

(declare-fun res!635609 () Bool)

(assert (=> b!947079 (=> (not res!635609) (not e!532908))))

(assert (=> b!947079 (= res!635609 (= (size!28041 thiss!1141) (bvadd (_size!2466 thiss!1141) (bvsdiv (bvadd (extraKeys!5440 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!114823 res!635606) b!947077))

(assert (= (and b!947077 res!635607) b!947078))

(assert (= (and b!947078 res!635608) b!947079))

(assert (= (and b!947079 res!635609) b!947080))

(declare-fun m!880981 () Bool)

(assert (=> b!947078 m!880981))

(assert (=> d!114823 m!880897))

(assert (=> b!947079 m!880981))

(assert (=> d!114813 d!114823))

(declare-fun lt!426582 () SeekEntryResult!9055)

(declare-fun d!114825 () Bool)

(assert (=> d!114825 (and (or ((_ is Undefined!9055) lt!426582) (not ((_ is Found!9055) lt!426582)) (and (bvsge (index!38592 lt!426582) #b00000000000000000000000000000000) (bvslt (index!38592 lt!426582) (size!28036 (_keys!10624 thiss!1141))))) (or ((_ is Undefined!9055) lt!426582) ((_ is Found!9055) lt!426582) (not ((_ is MissingVacant!9055) lt!426582)) (not (= (index!38594 lt!426582) (index!38593 lt!426563))) (and (bvsge (index!38594 lt!426582) #b00000000000000000000000000000000) (bvslt (index!38594 lt!426582) (size!28036 (_keys!10624 thiss!1141))))) (or ((_ is Undefined!9055) lt!426582) (ite ((_ is Found!9055) lt!426582) (= (select (arr!27566 (_keys!10624 thiss!1141)) (index!38592 lt!426582)) key!756) (and ((_ is MissingVacant!9055) lt!426582) (= (index!38594 lt!426582) (index!38593 lt!426563)) (= (select (arr!27566 (_keys!10624 thiss!1141)) (index!38594 lt!426582)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!532915 () SeekEntryResult!9055)

(assert (=> d!114825 (= lt!426582 e!532915)))

(declare-fun c!98803 () Bool)

(assert (=> d!114825 (= c!98803 (bvsge (x!81305 lt!426563) #b01111111111111111111111111111110))))

(declare-fun lt!426583 () (_ BitVec 64))

(assert (=> d!114825 (= lt!426583 (select (arr!27566 (_keys!10624 thiss!1141)) (index!38593 lt!426563)))))

(assert (=> d!114825 (validMask!0 (mask!27440 thiss!1141))))

(assert (=> d!114825 (= (seekKeyOrZeroReturnVacant!0 (x!81305 lt!426563) (index!38593 lt!426563) (index!38593 lt!426563) key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)) lt!426582)))

(declare-fun b!947093 () Bool)

(declare-fun e!532916 () SeekEntryResult!9055)

(assert (=> b!947093 (= e!532915 e!532916)))

(declare-fun c!98802 () Bool)

(assert (=> b!947093 (= c!98802 (= lt!426583 key!756))))

(declare-fun b!947094 () Bool)

(declare-fun c!98804 () Bool)

(assert (=> b!947094 (= c!98804 (= lt!426583 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!532917 () SeekEntryResult!9055)

(assert (=> b!947094 (= e!532916 e!532917)))

(declare-fun b!947095 () Bool)

(assert (=> b!947095 (= e!532917 (MissingVacant!9055 (index!38593 lt!426563)))))

(declare-fun b!947096 () Bool)

(assert (=> b!947096 (= e!532916 (Found!9055 (index!38593 lt!426563)))))

(declare-fun b!947097 () Bool)

(assert (=> b!947097 (= e!532915 Undefined!9055)))

(declare-fun b!947098 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947098 (= e!532917 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81305 lt!426563) #b00000000000000000000000000000001) (nextIndex!0 (index!38593 lt!426563) (bvadd (x!81305 lt!426563) #b00000000000000000000000000000001) (mask!27440 thiss!1141)) (index!38593 lt!426563) key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)))))

(assert (= (and d!114825 c!98803) b!947097))

(assert (= (and d!114825 (not c!98803)) b!947093))

(assert (= (and b!947093 c!98802) b!947096))

(assert (= (and b!947093 (not c!98802)) b!947094))

(assert (= (and b!947094 c!98804) b!947095))

(assert (= (and b!947094 (not c!98804)) b!947098))

(declare-fun m!880983 () Bool)

(assert (=> d!114825 m!880983))

(declare-fun m!880985 () Bool)

(assert (=> d!114825 m!880985))

(assert (=> d!114825 m!880953))

(assert (=> d!114825 m!880897))

(declare-fun m!880987 () Bool)

(assert (=> b!947098 m!880987))

(assert (=> b!947098 m!880987))

(declare-fun m!880989 () Bool)

(assert (=> b!947098 m!880989))

(assert (=> b!947021 d!114825))

(declare-fun b!947117 () Bool)

(declare-fun e!532930 () SeekEntryResult!9055)

(assert (=> b!947117 (= e!532930 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27440 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27440 thiss!1141)) key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)))))

(declare-fun b!947118 () Bool)

(declare-fun e!532931 () Bool)

(declare-fun lt!426588 () SeekEntryResult!9055)

(assert (=> b!947118 (= e!532931 (bvsge (x!81305 lt!426588) #b01111111111111111111111111111110))))

(declare-fun b!947120 () Bool)

(declare-fun e!532932 () SeekEntryResult!9055)

(assert (=> b!947120 (= e!532932 (Intermediate!9055 true (toIndex!0 key!756 (mask!27440 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!947121 () Bool)

(assert (=> b!947121 (and (bvsge (index!38593 lt!426588) #b00000000000000000000000000000000) (bvslt (index!38593 lt!426588) (size!28036 (_keys!10624 thiss!1141))))))

(declare-fun res!635617 () Bool)

(assert (=> b!947121 (= res!635617 (= (select (arr!27566 (_keys!10624 thiss!1141)) (index!38593 lt!426588)) key!756))))

(declare-fun e!532929 () Bool)

(assert (=> b!947121 (=> res!635617 e!532929)))

(declare-fun e!532928 () Bool)

(assert (=> b!947121 (= e!532928 e!532929)))

(declare-fun b!947122 () Bool)

(assert (=> b!947122 (= e!532930 (Intermediate!9055 false (toIndex!0 key!756 (mask!27440 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!947123 () Bool)

(assert (=> b!947123 (and (bvsge (index!38593 lt!426588) #b00000000000000000000000000000000) (bvslt (index!38593 lt!426588) (size!28036 (_keys!10624 thiss!1141))))))

(declare-fun res!635616 () Bool)

(assert (=> b!947123 (= res!635616 (= (select (arr!27566 (_keys!10624 thiss!1141)) (index!38593 lt!426588)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947123 (=> res!635616 e!532929)))

(declare-fun b!947124 () Bool)

(assert (=> b!947124 (and (bvsge (index!38593 lt!426588) #b00000000000000000000000000000000) (bvslt (index!38593 lt!426588) (size!28036 (_keys!10624 thiss!1141))))))

(assert (=> b!947124 (= e!532929 (= (select (arr!27566 (_keys!10624 thiss!1141)) (index!38593 lt!426588)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!947125 () Bool)

(assert (=> b!947125 (= e!532931 e!532928)))

(declare-fun res!635618 () Bool)

(assert (=> b!947125 (= res!635618 (and ((_ is Intermediate!9055) lt!426588) (not (undefined!9867 lt!426588)) (bvslt (x!81305 lt!426588) #b01111111111111111111111111111110) (bvsge (x!81305 lt!426588) #b00000000000000000000000000000000) (bvsge (x!81305 lt!426588) #b00000000000000000000000000000000)))))

(assert (=> b!947125 (=> (not res!635618) (not e!532928))))

(declare-fun d!114827 () Bool)

(assert (=> d!114827 e!532931))

(declare-fun c!98813 () Bool)

(assert (=> d!114827 (= c!98813 (and ((_ is Intermediate!9055) lt!426588) (undefined!9867 lt!426588)))))

(assert (=> d!114827 (= lt!426588 e!532932)))

(declare-fun c!98812 () Bool)

(assert (=> d!114827 (= c!98812 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!426589 () (_ BitVec 64))

(assert (=> d!114827 (= lt!426589 (select (arr!27566 (_keys!10624 thiss!1141)) (toIndex!0 key!756 (mask!27440 thiss!1141))))))

(assert (=> d!114827 (validMask!0 (mask!27440 thiss!1141))))

(assert (=> d!114827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27440 thiss!1141)) key!756 (_keys!10624 thiss!1141) (mask!27440 thiss!1141)) lt!426588)))

(declare-fun b!947119 () Bool)

(assert (=> b!947119 (= e!532932 e!532930)))

(declare-fun c!98811 () Bool)

(assert (=> b!947119 (= c!98811 (or (= lt!426589 key!756) (= (bvadd lt!426589 lt!426589) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114827 c!98812) b!947120))

(assert (= (and d!114827 (not c!98812)) b!947119))

(assert (= (and b!947119 c!98811) b!947122))

(assert (= (and b!947119 (not c!98811)) b!947117))

(assert (= (and d!114827 c!98813) b!947118))

(assert (= (and d!114827 (not c!98813)) b!947125))

(assert (= (and b!947125 res!635618) b!947121))

(assert (= (and b!947121 (not res!635617)) b!947123))

(assert (= (and b!947123 (not res!635616)) b!947124))

(declare-fun m!880991 () Bool)

(assert (=> b!947124 m!880991))

(assert (=> b!947117 m!880947))

(declare-fun m!880993 () Bool)

(assert (=> b!947117 m!880993))

(assert (=> b!947117 m!880993))

(declare-fun m!880995 () Bool)

(assert (=> b!947117 m!880995))

(assert (=> b!947123 m!880991))

(assert (=> d!114827 m!880947))

(declare-fun m!880997 () Bool)

(assert (=> d!114827 m!880997))

(assert (=> d!114827 m!880897))

(assert (=> b!947121 m!880991))

(assert (=> d!114811 d!114827))

(declare-fun d!114829 () Bool)

(declare-fun lt!426595 () (_ BitVec 32))

(declare-fun lt!426594 () (_ BitVec 32))

(assert (=> d!114829 (= lt!426595 (bvmul (bvxor lt!426594 (bvlshr lt!426594 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114829 (= lt!426594 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114829 (and (bvsge (mask!27440 thiss!1141) #b00000000000000000000000000000000) (let ((res!635619 (let ((h!20436 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81324 (bvmul (bvxor h!20436 (bvlshr h!20436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81324 (bvlshr x!81324 #b00000000000000000000000000001101)) (mask!27440 thiss!1141)))))) (and (bvslt res!635619 (bvadd (mask!27440 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!635619 #b00000000000000000000000000000000))))))

(assert (=> d!114829 (= (toIndex!0 key!756 (mask!27440 thiss!1141)) (bvand (bvxor lt!426595 (bvlshr lt!426595 #b00000000000000000000000000001101)) (mask!27440 thiss!1141)))))

(assert (=> d!114811 d!114829))

(assert (=> d!114811 d!114805))

(declare-fun b!947136 () Bool)

(declare-fun e!532942 () Bool)

(declare-fun contains!5196 (List!19281 (_ BitVec 64)) Bool)

(assert (=> b!947136 (= e!532942 (contains!5196 Nil!19278 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947137 () Bool)

(declare-fun e!532943 () Bool)

(declare-fun call!41121 () Bool)

(assert (=> b!947137 (= e!532943 call!41121)))

(declare-fun d!114831 () Bool)

(declare-fun res!635626 () Bool)

(declare-fun e!532944 () Bool)

(assert (=> d!114831 (=> res!635626 e!532944)))

(assert (=> d!114831 (= res!635626 (bvsge #b00000000000000000000000000000000 (size!28036 (_keys!10624 thiss!1141))))))

(assert (=> d!114831 (= (arrayNoDuplicates!0 (_keys!10624 thiss!1141) #b00000000000000000000000000000000 Nil!19278) e!532944)))

(declare-fun bm!41118 () Bool)

(declare-fun c!98816 () Bool)

(assert (=> bm!41118 (= call!41121 (arrayNoDuplicates!0 (_keys!10624 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98816 (Cons!19277 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000) Nil!19278) Nil!19278)))))

(declare-fun b!947138 () Bool)

(assert (=> b!947138 (= e!532943 call!41121)))

(declare-fun b!947139 () Bool)

(declare-fun e!532941 () Bool)

(assert (=> b!947139 (= e!532944 e!532941)))

(declare-fun res!635627 () Bool)

(assert (=> b!947139 (=> (not res!635627) (not e!532941))))

(assert (=> b!947139 (= res!635627 (not e!532942))))

(declare-fun res!635628 () Bool)

(assert (=> b!947139 (=> (not res!635628) (not e!532942))))

(assert (=> b!947139 (= res!635628 (validKeyInArray!0 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947140 () Bool)

(assert (=> b!947140 (= e!532941 e!532943)))

(assert (=> b!947140 (= c!98816 (validKeyInArray!0 (select (arr!27566 (_keys!10624 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114831 (not res!635626)) b!947139))

(assert (= (and b!947139 res!635628) b!947136))

(assert (= (and b!947139 res!635627) b!947140))

(assert (= (and b!947140 c!98816) b!947138))

(assert (= (and b!947140 (not c!98816)) b!947137))

(assert (= (or b!947138 b!947137) bm!41118))

(assert (=> b!947136 m!880939))

(assert (=> b!947136 m!880939))

(declare-fun m!880999 () Bool)

(assert (=> b!947136 m!880999))

(assert (=> bm!41118 m!880939))

(declare-fun m!881001 () Bool)

(assert (=> bm!41118 m!881001))

(assert (=> b!947139 m!880939))

(assert (=> b!947139 m!880939))

(assert (=> b!947139 m!880965))

(assert (=> b!947140 m!880939))

(assert (=> b!947140 m!880939))

(assert (=> b!947140 m!880965))

(assert (=> b!947034 d!114831))

(declare-fun b!947142 () Bool)

(declare-fun e!532946 () Bool)

(assert (=> b!947142 (= e!532946 tp_is_empty!20635)))

(declare-fun b!947141 () Bool)

(declare-fun e!532945 () Bool)

(assert (=> b!947141 (= e!532945 tp_is_empty!20635)))

(declare-fun condMapEmpty!32812 () Bool)

(declare-fun mapDefault!32812 () ValueCell!9836)

(assert (=> mapNonEmpty!32811 (= condMapEmpty!32812 (= mapRest!32811 ((as const (Array (_ BitVec 32) ValueCell!9836)) mapDefault!32812)))))

(declare-fun mapRes!32812 () Bool)

(assert (=> mapNonEmpty!32811 (= tp!62931 (and e!532946 mapRes!32812))))

(declare-fun mapIsEmpty!32812 () Bool)

(assert (=> mapIsEmpty!32812 mapRes!32812))

(declare-fun mapNonEmpty!32812 () Bool)

(declare-fun tp!62932 () Bool)

(assert (=> mapNonEmpty!32812 (= mapRes!32812 (and tp!62932 e!532945))))

(declare-fun mapValue!32812 () ValueCell!9836)

(declare-fun mapRest!32812 () (Array (_ BitVec 32) ValueCell!9836))

(declare-fun mapKey!32812 () (_ BitVec 32))

(assert (=> mapNonEmpty!32812 (= mapRest!32811 (store mapRest!32812 mapKey!32812 mapValue!32812))))

(assert (= (and mapNonEmpty!32811 condMapEmpty!32812) mapIsEmpty!32812))

(assert (= (and mapNonEmpty!32811 (not condMapEmpty!32812)) mapNonEmpty!32812))

(assert (= (and mapNonEmpty!32812 ((_ is ValueCellFull!9836) mapValue!32812)) b!947141))

(assert (= (and mapNonEmpty!32811 ((_ is ValueCellFull!9836) mapDefault!32812)) b!947142))

(declare-fun m!881003 () Bool)

(assert (=> mapNonEmpty!32812 m!881003))

(check-sat (not b!947078) (not mapNonEmpty!32812) (not b!947052) (not b_next!18127) (not b!947139) (not b!947068) (not b!947117) (not d!114817) (not bm!41112) (not d!114827) (not b!947140) (not b!947051) tp_is_empty!20635 (not b!947136) b_and!29559 (not d!114825) (not b!947098) (not bm!41118) (not b!947056) (not bm!41115) (not b!947079) (not d!114823))
(check-sat b_and!29559 (not b_next!18127))
