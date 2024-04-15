; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81388 () Bool)

(assert start!81388)

(declare-fun b!951520 () Bool)

(declare-fun b_free!18277 () Bool)

(declare-fun b_next!18277 () Bool)

(assert (=> b!951520 (= b_free!18277 (not b_next!18277))))

(declare-fun tp!63447 () Bool)

(declare-fun b_and!29723 () Bool)

(assert (=> b!951520 (= tp!63447 b_and!29723)))

(declare-fun b!951519 () Bool)

(declare-fun res!637663 () Bool)

(declare-fun e!535821 () Bool)

(assert (=> b!951519 (=> (not res!637663) (not e!535821))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32679 0))(
  ( (V!32680 (val!10443 Int)) )
))
(declare-datatypes ((ValueCell!9911 0))(
  ( (ValueCellFull!9911 (v!12991 V!32679)) (EmptyCell!9911) )
))
(declare-datatypes ((array!57565 0))(
  ( (array!57566 (arr!27677 (Array (_ BitVec 32) ValueCell!9911)) (size!28157 (_ BitVec 32))) )
))
(declare-datatypes ((array!57567 0))(
  ( (array!57568 (arr!27678 (Array (_ BitVec 32) (_ BitVec 64))) (size!28158 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4972 0))(
  ( (LongMapFixedSize!4973 (defaultEntry!5811 Int) (mask!27635 (_ BitVec 32)) (extraKeys!5543 (_ BitVec 32)) (zeroValue!5647 V!32679) (minValue!5647 V!32679) (_size!2541 (_ BitVec 32)) (_keys!10753 array!57567) (_values!5834 array!57565) (_vacant!2541 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4972)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9151 0))(
  ( (MissingZero!9151 (index!38975 (_ BitVec 32))) (Found!9151 (index!38976 (_ BitVec 32))) (Intermediate!9151 (undefined!9963 Bool) (index!38977 (_ BitVec 32)) (x!81880 (_ BitVec 32))) (Undefined!9151) (MissingVacant!9151 (index!38978 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57567 (_ BitVec 32)) SeekEntryResult!9151)

(assert (=> b!951519 (= res!637663 (not ((_ is Found!9151) (seekEntry!0 key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))))

(declare-fun tp_is_empty!20785 () Bool)

(declare-fun e!535816 () Bool)

(declare-fun e!535822 () Bool)

(declare-fun array_inv!21540 (array!57567) Bool)

(declare-fun array_inv!21541 (array!57565) Bool)

(assert (=> b!951520 (= e!535816 (and tp!63447 tp_is_empty!20785 (array_inv!21540 (_keys!10753 thiss!1141)) (array_inv!21541 (_values!5834 thiss!1141)) e!535822))))

(declare-fun mapNonEmpty!33108 () Bool)

(declare-fun mapRes!33108 () Bool)

(declare-fun tp!63446 () Bool)

(declare-fun e!535818 () Bool)

(assert (=> mapNonEmpty!33108 (= mapRes!33108 (and tp!63446 e!535818))))

(declare-fun mapKey!33108 () (_ BitVec 32))

(declare-fun mapValue!33108 () ValueCell!9911)

(declare-fun mapRest!33108 () (Array (_ BitVec 32) ValueCell!9911))

(assert (=> mapNonEmpty!33108 (= (arr!27677 (_values!5834 thiss!1141)) (store mapRest!33108 mapKey!33108 mapValue!33108))))

(declare-fun b!951521 () Bool)

(declare-fun res!637665 () Bool)

(assert (=> b!951521 (=> (not res!637665) (not e!535821))))

(assert (=> b!951521 (= res!637665 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!33108 () Bool)

(assert (=> mapIsEmpty!33108 mapRes!33108))

(declare-fun b!951522 () Bool)

(declare-fun e!535820 () Bool)

(assert (=> b!951522 (= e!535820 tp_is_empty!20785)))

(declare-fun b!951523 () Bool)

(assert (=> b!951523 (= e!535822 (and e!535820 mapRes!33108))))

(declare-fun condMapEmpty!33108 () Bool)

(declare-fun mapDefault!33108 () ValueCell!9911)

(assert (=> b!951523 (= condMapEmpty!33108 (= (arr!27677 (_values!5834 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9911)) mapDefault!33108)))))

(declare-fun b!951524 () Bool)

(assert (=> b!951524 (= e!535818 tp_is_empty!20785)))

(declare-fun res!637664 () Bool)

(assert (=> start!81388 (=> (not res!637664) (not e!535821))))

(declare-fun valid!1897 (LongMapFixedSize!4972) Bool)

(assert (=> start!81388 (= res!637664 (valid!1897 thiss!1141))))

(assert (=> start!81388 e!535821))

(assert (=> start!81388 e!535816))

(assert (=> start!81388 true))

(declare-fun b!951525 () Bool)

(declare-fun e!535819 () Bool)

(assert (=> b!951525 (= e!535821 (not e!535819))))

(declare-fun res!637662 () Bool)

(assert (=> b!951525 (=> res!637662 e!535819)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951525 (= res!637662 (not (validMask!0 (mask!27635 thiss!1141))))))

(declare-fun lt!428534 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57567 (_ BitVec 32)) Bool)

(assert (=> b!951525 (arrayForallSeekEntryOrOpenFound!0 lt!428534 (_keys!10753 thiss!1141) (mask!27635 thiss!1141))))

(declare-datatypes ((Unit!31901 0))(
  ( (Unit!31902) )
))
(declare-fun lt!428535 () Unit!31901)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31901)

(assert (=> b!951525 (= lt!428535 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10753 thiss!1141) (mask!27635 thiss!1141) #b00000000000000000000000000000000 lt!428534))))

(declare-fun arrayScanForKey!0 (array!57567 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951525 (= lt!428534 (arrayScanForKey!0 (_keys!10753 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951525 (arrayContainsKey!0 (_keys!10753 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!428536 () Unit!31901)

(declare-fun lemmaKeyInListMapIsInArray!313 (array!57567 array!57565 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 64) Int) Unit!31901)

(assert (=> b!951525 (= lt!428536 (lemmaKeyInListMapIsInArray!313 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)))))

(declare-fun b!951526 () Bool)

(declare-fun res!637661 () Bool)

(assert (=> b!951526 (=> (not res!637661) (not e!535821))))

(declare-datatypes ((tuple2!13620 0))(
  ( (tuple2!13621 (_1!6821 (_ BitVec 64)) (_2!6821 V!32679)) )
))
(declare-datatypes ((List!19361 0))(
  ( (Nil!19358) (Cons!19357 (h!20518 tuple2!13620) (t!27703 List!19361)) )
))
(declare-datatypes ((ListLongMap!12307 0))(
  ( (ListLongMap!12308 (toList!6169 List!19361)) )
))
(declare-fun contains!5205 (ListLongMap!12307 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3331 (array!57567 array!57565 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 32) Int) ListLongMap!12307)

(assert (=> b!951526 (= res!637661 (contains!5205 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) key!756))))

(declare-fun b!951527 () Bool)

(assert (=> b!951527 (= e!535819 (= (size!28158 (_keys!10753 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27635 thiss!1141))))))

(assert (= (and start!81388 res!637664) b!951521))

(assert (= (and b!951521 res!637665) b!951519))

(assert (= (and b!951519 res!637663) b!951526))

(assert (= (and b!951526 res!637661) b!951525))

(assert (= (and b!951525 (not res!637662)) b!951527))

(assert (= (and b!951523 condMapEmpty!33108) mapIsEmpty!33108))

(assert (= (and b!951523 (not condMapEmpty!33108)) mapNonEmpty!33108))

(assert (= (and mapNonEmpty!33108 ((_ is ValueCellFull!9911) mapValue!33108)) b!951524))

(assert (= (and b!951523 ((_ is ValueCellFull!9911) mapDefault!33108)) b!951522))

(assert (= b!951520 b!951523))

(assert (= start!81388 b!951520))

(declare-fun m!883197 () Bool)

(assert (=> b!951520 m!883197))

(declare-fun m!883199 () Bool)

(assert (=> b!951520 m!883199))

(declare-fun m!883201 () Bool)

(assert (=> start!81388 m!883201))

(declare-fun m!883203 () Bool)

(assert (=> b!951526 m!883203))

(assert (=> b!951526 m!883203))

(declare-fun m!883205 () Bool)

(assert (=> b!951526 m!883205))

(declare-fun m!883207 () Bool)

(assert (=> b!951525 m!883207))

(declare-fun m!883209 () Bool)

(assert (=> b!951525 m!883209))

(declare-fun m!883211 () Bool)

(assert (=> b!951525 m!883211))

(declare-fun m!883213 () Bool)

(assert (=> b!951525 m!883213))

(declare-fun m!883215 () Bool)

(assert (=> b!951525 m!883215))

(declare-fun m!883217 () Bool)

(assert (=> b!951525 m!883217))

(declare-fun m!883219 () Bool)

(assert (=> b!951519 m!883219))

(declare-fun m!883221 () Bool)

(assert (=> mapNonEmpty!33108 m!883221))

(check-sat (not b!951520) tp_is_empty!20785 b_and!29723 (not mapNonEmpty!33108) (not b_next!18277) (not start!81388) (not b!951519) (not b!951526) (not b!951525))
(check-sat b_and!29723 (not b_next!18277))
(get-model)

(declare-fun b!951594 () Bool)

(declare-fun e!535871 () SeekEntryResult!9151)

(declare-fun lt!428566 () SeekEntryResult!9151)

(assert (=> b!951594 (= e!535871 (Found!9151 (index!38977 lt!428566)))))

(declare-fun b!951595 () Bool)

(declare-fun e!535873 () SeekEntryResult!9151)

(assert (=> b!951595 (= e!535873 (MissingZero!9151 (index!38977 lt!428566)))))

(declare-fun b!951596 () Bool)

(declare-fun e!535872 () SeekEntryResult!9151)

(assert (=> b!951596 (= e!535872 Undefined!9151)))

(declare-fun d!115187 () Bool)

(declare-fun lt!428563 () SeekEntryResult!9151)

(assert (=> d!115187 (and (or ((_ is MissingVacant!9151) lt!428563) (not ((_ is Found!9151) lt!428563)) (and (bvsge (index!38976 lt!428563) #b00000000000000000000000000000000) (bvslt (index!38976 lt!428563) (size!28158 (_keys!10753 thiss!1141))))) (not ((_ is MissingVacant!9151) lt!428563)) (or (not ((_ is Found!9151) lt!428563)) (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38976 lt!428563)) key!756)))))

(assert (=> d!115187 (= lt!428563 e!535872)))

(declare-fun c!99441 () Bool)

(assert (=> d!115187 (= c!99441 (and ((_ is Intermediate!9151) lt!428566) (undefined!9963 lt!428566)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57567 (_ BitVec 32)) SeekEntryResult!9151)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115187 (= lt!428566 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27635 thiss!1141)) key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(assert (=> d!115187 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115187 (= (seekEntry!0 key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) lt!428563)))

(declare-fun b!951597 () Bool)

(assert (=> b!951597 (= e!535872 e!535871)))

(declare-fun lt!428565 () (_ BitVec 64))

(assert (=> b!951597 (= lt!428565 (select (arr!27678 (_keys!10753 thiss!1141)) (index!38977 lt!428566)))))

(declare-fun c!99442 () Bool)

(assert (=> b!951597 (= c!99442 (= lt!428565 key!756))))

(declare-fun b!951598 () Bool)

(declare-fun lt!428564 () SeekEntryResult!9151)

(assert (=> b!951598 (= e!535873 (ite ((_ is MissingVacant!9151) lt!428564) (MissingZero!9151 (index!38978 lt!428564)) lt!428564))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57567 (_ BitVec 32)) SeekEntryResult!9151)

(assert (=> b!951598 (= lt!428564 (seekKeyOrZeroReturnVacant!0 (x!81880 lt!428566) (index!38977 lt!428566) (index!38977 lt!428566) key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(declare-fun b!951599 () Bool)

(declare-fun c!99440 () Bool)

(assert (=> b!951599 (= c!99440 (= lt!428565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951599 (= e!535871 e!535873)))

(assert (= (and d!115187 c!99441) b!951596))

(assert (= (and d!115187 (not c!99441)) b!951597))

(assert (= (and b!951597 c!99442) b!951594))

(assert (= (and b!951597 (not c!99442)) b!951599))

(assert (= (and b!951599 c!99440) b!951595))

(assert (= (and b!951599 (not c!99440)) b!951598))

(declare-fun m!883275 () Bool)

(assert (=> d!115187 m!883275))

(declare-fun m!883277 () Bool)

(assert (=> d!115187 m!883277))

(assert (=> d!115187 m!883277))

(declare-fun m!883279 () Bool)

(assert (=> d!115187 m!883279))

(assert (=> d!115187 m!883209))

(declare-fun m!883281 () Bool)

(assert (=> b!951597 m!883281))

(declare-fun m!883283 () Bool)

(assert (=> b!951598 m!883283))

(assert (=> b!951519 d!115187))

(declare-fun d!115189 () Bool)

(assert (=> d!115189 (= (array_inv!21540 (_keys!10753 thiss!1141)) (bvsge (size!28158 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951520 d!115189))

(declare-fun d!115191 () Bool)

(assert (=> d!115191 (= (array_inv!21541 (_values!5834 thiss!1141)) (bvsge (size!28157 (_values!5834 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951520 d!115191))

(declare-fun b!951609 () Bool)

(declare-fun e!535880 () Bool)

(declare-fun e!535882 () Bool)

(assert (=> b!951609 (= e!535880 e!535882)))

(declare-fun lt!428575 () (_ BitVec 64))

(assert (=> b!951609 (= lt!428575 (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534))))

(declare-fun lt!428574 () Unit!31901)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57567 (_ BitVec 64) (_ BitVec 32)) Unit!31901)

(assert (=> b!951609 (= lt!428574 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10753 thiss!1141) lt!428575 lt!428534))))

(assert (=> b!951609 (arrayContainsKey!0 (_keys!10753 thiss!1141) lt!428575 #b00000000000000000000000000000000)))

(declare-fun lt!428573 () Unit!31901)

(assert (=> b!951609 (= lt!428573 lt!428574)))

(declare-fun res!637701 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57567 (_ BitVec 32)) SeekEntryResult!9151)

(assert (=> b!951609 (= res!637701 (= (seekEntryOrOpen!0 (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) (Found!9151 lt!428534)))))

(assert (=> b!951609 (=> (not res!637701) (not e!535882))))

(declare-fun b!951610 () Bool)

(declare-fun call!41491 () Bool)

(assert (=> b!951610 (= e!535880 call!41491)))

(declare-fun bm!41488 () Bool)

(assert (=> bm!41488 (= call!41491 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428534 #b00000000000000000000000000000001) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(declare-fun b!951611 () Bool)

(declare-fun e!535881 () Bool)

(assert (=> b!951611 (= e!535881 e!535880)))

(declare-fun c!99445 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951611 (= c!99445 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534)))))

(declare-fun d!115193 () Bool)

(declare-fun res!637700 () Bool)

(assert (=> d!115193 (=> res!637700 e!535881)))

(assert (=> d!115193 (= res!637700 (bvsge lt!428534 (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115193 (= (arrayForallSeekEntryOrOpenFound!0 lt!428534 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) e!535881)))

(declare-fun b!951608 () Bool)

(assert (=> b!951608 (= e!535882 call!41491)))

(assert (= (and d!115193 (not res!637700)) b!951611))

(assert (= (and b!951611 c!99445) b!951609))

(assert (= (and b!951611 (not c!99445)) b!951610))

(assert (= (and b!951609 res!637701) b!951608))

(assert (= (or b!951608 b!951610) bm!41488))

(declare-fun m!883285 () Bool)

(assert (=> b!951609 m!883285))

(declare-fun m!883287 () Bool)

(assert (=> b!951609 m!883287))

(declare-fun m!883289 () Bool)

(assert (=> b!951609 m!883289))

(assert (=> b!951609 m!883285))

(declare-fun m!883291 () Bool)

(assert (=> b!951609 m!883291))

(declare-fun m!883293 () Bool)

(assert (=> bm!41488 m!883293))

(assert (=> b!951611 m!883285))

(assert (=> b!951611 m!883285))

(declare-fun m!883295 () Bool)

(assert (=> b!951611 m!883295))

(assert (=> b!951525 d!115193))

(declare-fun d!115195 () Bool)

(declare-fun res!637706 () Bool)

(declare-fun e!535887 () Bool)

(assert (=> d!115195 (=> res!637706 e!535887)))

(assert (=> d!115195 (= res!637706 (= (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115195 (= (arrayContainsKey!0 (_keys!10753 thiss!1141) key!756 #b00000000000000000000000000000000) e!535887)))

(declare-fun b!951616 () Bool)

(declare-fun e!535888 () Bool)

(assert (=> b!951616 (= e!535887 e!535888)))

(declare-fun res!637707 () Bool)

(assert (=> b!951616 (=> (not res!637707) (not e!535888))))

(assert (=> b!951616 (= res!637707 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun b!951617 () Bool)

(assert (=> b!951617 (= e!535888 (arrayContainsKey!0 (_keys!10753 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115195 (not res!637706)) b!951616))

(assert (= (and b!951616 res!637707) b!951617))

(declare-fun m!883297 () Bool)

(assert (=> d!115195 m!883297))

(declare-fun m!883299 () Bool)

(assert (=> b!951617 m!883299))

(assert (=> b!951525 d!115195))

(declare-fun d!115197 () Bool)

(declare-fun e!535891 () Bool)

(assert (=> d!115197 e!535891))

(declare-fun c!99448 () Bool)

(assert (=> d!115197 (= c!99448 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428578 () Unit!31901)

(declare-fun choose!1602 (array!57567 array!57565 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 64) Int) Unit!31901)

(assert (=> d!115197 (= lt!428578 (choose!1602 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)))))

(assert (=> d!115197 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115197 (= (lemmaKeyInListMapIsInArray!313 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)) lt!428578)))

(declare-fun b!951622 () Bool)

(assert (=> b!951622 (= e!535891 (arrayContainsKey!0 (_keys!10753 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951623 () Bool)

(assert (=> b!951623 (= e!535891 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115197 c!99448) b!951622))

(assert (= (and d!115197 (not c!99448)) b!951623))

(declare-fun m!883301 () Bool)

(assert (=> d!115197 m!883301))

(assert (=> d!115197 m!883209))

(assert (=> b!951622 m!883213))

(assert (=> b!951525 d!115197))

(declare-fun d!115199 () Bool)

(declare-fun lt!428581 () (_ BitVec 32))

(assert (=> d!115199 (and (or (bvslt lt!428581 #b00000000000000000000000000000000) (bvsge lt!428581 (size!28158 (_keys!10753 thiss!1141))) (and (bvsge lt!428581 #b00000000000000000000000000000000) (bvslt lt!428581 (size!28158 (_keys!10753 thiss!1141))))) (bvsge lt!428581 #b00000000000000000000000000000000) (bvslt lt!428581 (size!28158 (_keys!10753 thiss!1141))) (= (select (arr!27678 (_keys!10753 thiss!1141)) lt!428581) key!756))))

(declare-fun e!535894 () (_ BitVec 32))

(assert (=> d!115199 (= lt!428581 e!535894)))

(declare-fun c!99451 () Bool)

(assert (=> d!115199 (= c!99451 (= (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115199 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))) (bvslt (size!28158 (_keys!10753 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115199 (= (arrayScanForKey!0 (_keys!10753 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428581)))

(declare-fun b!951628 () Bool)

(assert (=> b!951628 (= e!535894 #b00000000000000000000000000000000)))

(declare-fun b!951629 () Bool)

(assert (=> b!951629 (= e!535894 (arrayScanForKey!0 (_keys!10753 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115199 c!99451) b!951628))

(assert (= (and d!115199 (not c!99451)) b!951629))

(declare-fun m!883303 () Bool)

(assert (=> d!115199 m!883303))

(assert (=> d!115199 m!883297))

(declare-fun m!883305 () Bool)

(assert (=> b!951629 m!883305))

(assert (=> b!951525 d!115199))

(declare-fun d!115201 () Bool)

(assert (=> d!115201 (= (validMask!0 (mask!27635 thiss!1141)) (and (or (= (mask!27635 thiss!1141) #b00000000000000000000000000000111) (= (mask!27635 thiss!1141) #b00000000000000000000000000001111) (= (mask!27635 thiss!1141) #b00000000000000000000000000011111) (= (mask!27635 thiss!1141) #b00000000000000000000000000111111) (= (mask!27635 thiss!1141) #b00000000000000000000000001111111) (= (mask!27635 thiss!1141) #b00000000000000000000000011111111) (= (mask!27635 thiss!1141) #b00000000000000000000000111111111) (= (mask!27635 thiss!1141) #b00000000000000000000001111111111) (= (mask!27635 thiss!1141) #b00000000000000000000011111111111) (= (mask!27635 thiss!1141) #b00000000000000000000111111111111) (= (mask!27635 thiss!1141) #b00000000000000000001111111111111) (= (mask!27635 thiss!1141) #b00000000000000000011111111111111) (= (mask!27635 thiss!1141) #b00000000000000000111111111111111) (= (mask!27635 thiss!1141) #b00000000000000001111111111111111) (= (mask!27635 thiss!1141) #b00000000000000011111111111111111) (= (mask!27635 thiss!1141) #b00000000000000111111111111111111) (= (mask!27635 thiss!1141) #b00000000000001111111111111111111) (= (mask!27635 thiss!1141) #b00000000000011111111111111111111) (= (mask!27635 thiss!1141) #b00000000000111111111111111111111) (= (mask!27635 thiss!1141) #b00000000001111111111111111111111) (= (mask!27635 thiss!1141) #b00000000011111111111111111111111) (= (mask!27635 thiss!1141) #b00000000111111111111111111111111) (= (mask!27635 thiss!1141) #b00000001111111111111111111111111) (= (mask!27635 thiss!1141) #b00000011111111111111111111111111) (= (mask!27635 thiss!1141) #b00000111111111111111111111111111) (= (mask!27635 thiss!1141) #b00001111111111111111111111111111) (= (mask!27635 thiss!1141) #b00011111111111111111111111111111) (= (mask!27635 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27635 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951525 d!115201))

(declare-fun d!115203 () Bool)

(assert (=> d!115203 (arrayForallSeekEntryOrOpenFound!0 lt!428534 (_keys!10753 thiss!1141) (mask!27635 thiss!1141))))

(declare-fun lt!428584 () Unit!31901)

(declare-fun choose!38 (array!57567 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!31901)

(assert (=> d!115203 (= lt!428584 (choose!38 (_keys!10753 thiss!1141) (mask!27635 thiss!1141) #b00000000000000000000000000000000 lt!428534))))

(assert (=> d!115203 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115203 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10753 thiss!1141) (mask!27635 thiss!1141) #b00000000000000000000000000000000 lt!428534) lt!428584)))

(declare-fun bs!26709 () Bool)

(assert (= bs!26709 d!115203))

(assert (=> bs!26709 m!883217))

(declare-fun m!883307 () Bool)

(assert (=> bs!26709 m!883307))

(assert (=> bs!26709 m!883209))

(assert (=> b!951525 d!115203))

(declare-fun d!115205 () Bool)

(declare-fun e!535899 () Bool)

(assert (=> d!115205 e!535899))

(declare-fun res!637710 () Bool)

(assert (=> d!115205 (=> res!637710 e!535899)))

(declare-fun lt!428593 () Bool)

(assert (=> d!115205 (= res!637710 (not lt!428593))))

(declare-fun lt!428596 () Bool)

(assert (=> d!115205 (= lt!428593 lt!428596)))

(declare-fun lt!428595 () Unit!31901)

(declare-fun e!535900 () Unit!31901)

(assert (=> d!115205 (= lt!428595 e!535900)))

(declare-fun c!99454 () Bool)

(assert (=> d!115205 (= c!99454 lt!428596)))

(declare-fun containsKey!470 (List!19361 (_ BitVec 64)) Bool)

(assert (=> d!115205 (= lt!428596 (containsKey!470 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(assert (=> d!115205 (= (contains!5205 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) key!756) lt!428593)))

(declare-fun b!951636 () Bool)

(declare-fun lt!428594 () Unit!31901)

(assert (=> b!951636 (= e!535900 lt!428594)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!365 (List!19361 (_ BitVec 64)) Unit!31901)

(assert (=> b!951636 (= lt!428594 (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-datatypes ((Option!512 0))(
  ( (Some!511 (v!12994 V!32679)) (None!510) )
))
(declare-fun isDefined!378 (Option!512) Bool)

(declare-fun getValueByKey!506 (List!19361 (_ BitVec 64)) Option!512)

(assert (=> b!951636 (isDefined!378 (getValueByKey!506 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-fun b!951637 () Bool)

(declare-fun Unit!31905 () Unit!31901)

(assert (=> b!951637 (= e!535900 Unit!31905)))

(declare-fun b!951638 () Bool)

(assert (=> b!951638 (= e!535899 (isDefined!378 (getValueByKey!506 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756)))))

(assert (= (and d!115205 c!99454) b!951636))

(assert (= (and d!115205 (not c!99454)) b!951637))

(assert (= (and d!115205 (not res!637710)) b!951638))

(declare-fun m!883309 () Bool)

(assert (=> d!115205 m!883309))

(declare-fun m!883311 () Bool)

(assert (=> b!951636 m!883311))

(declare-fun m!883313 () Bool)

(assert (=> b!951636 m!883313))

(assert (=> b!951636 m!883313))

(declare-fun m!883315 () Bool)

(assert (=> b!951636 m!883315))

(assert (=> b!951638 m!883313))

(assert (=> b!951638 m!883313))

(assert (=> b!951638 m!883315))

(assert (=> b!951526 d!115205))

(declare-fun b!951681 () Bool)

(declare-fun e!535928 () ListLongMap!12307)

(declare-fun call!41507 () ListLongMap!12307)

(assert (=> b!951681 (= e!535928 call!41507)))

(declare-fun b!951682 () Bool)

(declare-fun res!637737 () Bool)

(declare-fun e!535938 () Bool)

(assert (=> b!951682 (=> (not res!637737) (not e!535938))))

(declare-fun e!535927 () Bool)

(assert (=> b!951682 (= res!637737 e!535927)))

(declare-fun res!637731 () Bool)

(assert (=> b!951682 (=> res!637731 e!535927)))

(declare-fun e!535937 () Bool)

(assert (=> b!951682 (= res!637731 (not e!535937))))

(declare-fun res!637736 () Bool)

(assert (=> b!951682 (=> (not res!637736) (not e!535937))))

(assert (=> b!951682 (= res!637736 (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun b!951683 () Bool)

(declare-fun e!535932 () Bool)

(declare-fun lt!428644 () ListLongMap!12307)

(declare-fun apply!877 (ListLongMap!12307 (_ BitVec 64)) V!32679)

(assert (=> b!951683 (= e!535932 (= (apply!877 lt!428644 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5647 thiss!1141)))))

(declare-fun b!951684 () Bool)

(declare-fun e!535931 () ListLongMap!12307)

(declare-fun call!41509 () ListLongMap!12307)

(declare-fun +!2887 (ListLongMap!12307 tuple2!13620) ListLongMap!12307)

(assert (=> b!951684 (= e!535931 (+!2887 call!41509 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))

(declare-fun b!951685 () Bool)

(declare-fun e!535936 () Bool)

(assert (=> b!951685 (= e!535936 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41503 () Bool)

(assert (=> bm!41503 (= call!41507 call!41509)))

(declare-fun b!951686 () Bool)

(declare-fun c!99468 () Bool)

(assert (=> b!951686 (= c!99468 (and (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!535929 () ListLongMap!12307)

(assert (=> b!951686 (= e!535929 e!535928)))

(declare-fun b!951687 () Bool)

(declare-fun e!535939 () Bool)

(assert (=> b!951687 (= e!535939 e!535932)))

(declare-fun res!637732 () Bool)

(declare-fun call!41512 () Bool)

(assert (=> b!951687 (= res!637732 call!41512)))

(assert (=> b!951687 (=> (not res!637732) (not e!535932))))

(declare-fun b!951689 () Bool)

(assert (=> b!951689 (= e!535937 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951690 () Bool)

(declare-fun e!535930 () Bool)

(assert (=> b!951690 (= e!535930 (= (apply!877 lt!428644 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5647 thiss!1141)))))

(declare-fun b!951691 () Bool)

(declare-fun e!535933 () Bool)

(assert (=> b!951691 (= e!535927 e!535933)))

(declare-fun res!637729 () Bool)

(assert (=> b!951691 (=> (not res!637729) (not e!535933))))

(assert (=> b!951691 (= res!637729 (contains!5205 lt!428644 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951691 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun bm!41504 () Bool)

(declare-fun call!41511 () ListLongMap!12307)

(declare-fun call!41506 () ListLongMap!12307)

(assert (=> bm!41504 (= call!41511 call!41506)))

(declare-fun bm!41505 () Bool)

(declare-fun call!41510 () ListLongMap!12307)

(assert (=> bm!41505 (= call!41510 call!41511)))

(declare-fun b!951692 () Bool)

(declare-fun e!535935 () Bool)

(assert (=> b!951692 (= e!535938 e!535935)))

(declare-fun c!99471 () Bool)

(assert (=> b!951692 (= c!99471 (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951693 () Bool)

(declare-fun call!41508 () Bool)

(assert (=> b!951693 (= e!535935 (not call!41508))))

(declare-fun bm!41506 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3359 (array!57567 array!57565 (_ BitVec 32) (_ BitVec 32) V!32679 V!32679 (_ BitVec 32) Int) ListLongMap!12307)

(assert (=> bm!41506 (= call!41506 (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun b!951694 () Bool)

(declare-fun e!535934 () Unit!31901)

(declare-fun lt!428641 () Unit!31901)

(assert (=> b!951694 (= e!535934 lt!428641)))

(declare-fun lt!428653 () ListLongMap!12307)

(assert (=> b!951694 (= lt!428653 (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!428647 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428647 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428659 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428659 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428650 () Unit!31901)

(declare-fun addStillContains!576 (ListLongMap!12307 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!31901)

(assert (=> b!951694 (= lt!428650 (addStillContains!576 lt!428653 lt!428647 (zeroValue!5647 thiss!1141) lt!428659))))

(assert (=> b!951694 (contains!5205 (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))) lt!428659)))

(declare-fun lt!428643 () Unit!31901)

(assert (=> b!951694 (= lt!428643 lt!428650)))

(declare-fun lt!428656 () ListLongMap!12307)

(assert (=> b!951694 (= lt!428656 (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!428660 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428661 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428661 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428658 () Unit!31901)

(declare-fun addApplyDifferent!456 (ListLongMap!12307 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!31901)

(assert (=> b!951694 (= lt!428658 (addApplyDifferent!456 lt!428656 lt!428660 (minValue!5647 thiss!1141) lt!428661))))

(assert (=> b!951694 (= (apply!877 (+!2887 lt!428656 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))) lt!428661) (apply!877 lt!428656 lt!428661))))

(declare-fun lt!428655 () Unit!31901)

(assert (=> b!951694 (= lt!428655 lt!428658)))

(declare-fun lt!428642 () ListLongMap!12307)

(assert (=> b!951694 (= lt!428642 (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!428652 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428652 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428646 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428646 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428649 () Unit!31901)

(assert (=> b!951694 (= lt!428649 (addApplyDifferent!456 lt!428642 lt!428652 (zeroValue!5647 thiss!1141) lt!428646))))

(assert (=> b!951694 (= (apply!877 (+!2887 lt!428642 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))) lt!428646) (apply!877 lt!428642 lt!428646))))

(declare-fun lt!428651 () Unit!31901)

(assert (=> b!951694 (= lt!428651 lt!428649)))

(declare-fun lt!428648 () ListLongMap!12307)

(assert (=> b!951694 (= lt!428648 (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))

(declare-fun lt!428657 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428657 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428662 () (_ BitVec 64))

(assert (=> b!951694 (= lt!428662 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951694 (= lt!428641 (addApplyDifferent!456 lt!428648 lt!428657 (minValue!5647 thiss!1141) lt!428662))))

(assert (=> b!951694 (= (apply!877 (+!2887 lt!428648 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))) lt!428662) (apply!877 lt!428648 lt!428662))))

(declare-fun b!951695 () Bool)

(assert (=> b!951695 (= e!535931 e!535929)))

(declare-fun c!99472 () Bool)

(assert (=> b!951695 (= c!99472 (and (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41507 () Bool)

(assert (=> bm!41507 (= call!41508 (contains!5205 lt!428644 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951696 () Bool)

(declare-fun get!14547 (ValueCell!9911 V!32679) V!32679)

(declare-fun dynLambda!1643 (Int (_ BitVec 64)) V!32679)

(assert (=> b!951696 (= e!535933 (= (apply!877 lt!428644 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)) (get!14547 (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951696 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28157 (_values!5834 thiss!1141))))))

(assert (=> b!951696 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun b!951697 () Bool)

(assert (=> b!951697 (= e!535929 call!41507)))

(declare-fun b!951688 () Bool)

(assert (=> b!951688 (= e!535939 (not call!41512))))

(declare-fun d!115207 () Bool)

(assert (=> d!115207 e!535938))

(declare-fun res!637730 () Bool)

(assert (=> d!115207 (=> (not res!637730) (not e!535938))))

(assert (=> d!115207 (= res!637730 (or (bvsge #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))))

(declare-fun lt!428654 () ListLongMap!12307)

(assert (=> d!115207 (= lt!428644 lt!428654)))

(declare-fun lt!428645 () Unit!31901)

(assert (=> d!115207 (= lt!428645 e!535934)))

(declare-fun c!99470 () Bool)

(assert (=> d!115207 (= c!99470 e!535936)))

(declare-fun res!637733 () Bool)

(assert (=> d!115207 (=> (not res!637733) (not e!535936))))

(assert (=> d!115207 (= res!637733 (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115207 (= lt!428654 e!535931)))

(declare-fun c!99469 () Bool)

(assert (=> d!115207 (= c!99469 (and (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115207 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115207 (= (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) lt!428644)))

(declare-fun b!951698 () Bool)

(assert (=> b!951698 (= e!535928 call!41510)))

(declare-fun bm!41508 () Bool)

(assert (=> bm!41508 (= call!41512 (contains!5205 lt!428644 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951699 () Bool)

(declare-fun res!637735 () Bool)

(assert (=> b!951699 (=> (not res!637735) (not e!535938))))

(assert (=> b!951699 (= res!637735 e!535939)))

(declare-fun c!99467 () Bool)

(assert (=> b!951699 (= c!99467 (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951700 () Bool)

(assert (=> b!951700 (= e!535935 e!535930)))

(declare-fun res!637734 () Bool)

(assert (=> b!951700 (= res!637734 call!41508)))

(assert (=> b!951700 (=> (not res!637734) (not e!535930))))

(declare-fun bm!41509 () Bool)

(assert (=> bm!41509 (= call!41509 (+!2887 (ite c!99469 call!41506 (ite c!99472 call!41511 call!41510)) (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(declare-fun b!951701 () Bool)

(declare-fun Unit!31906 () Unit!31901)

(assert (=> b!951701 (= e!535934 Unit!31906)))

(assert (= (and d!115207 c!99469) b!951684))

(assert (= (and d!115207 (not c!99469)) b!951695))

(assert (= (and b!951695 c!99472) b!951697))

(assert (= (and b!951695 (not c!99472)) b!951686))

(assert (= (and b!951686 c!99468) b!951681))

(assert (= (and b!951686 (not c!99468)) b!951698))

(assert (= (or b!951681 b!951698) bm!41505))

(assert (= (or b!951697 bm!41505) bm!41504))

(assert (= (or b!951697 b!951681) bm!41503))

(assert (= (or b!951684 bm!41504) bm!41506))

(assert (= (or b!951684 bm!41503) bm!41509))

(assert (= (and d!115207 res!637733) b!951685))

(assert (= (and d!115207 c!99470) b!951694))

(assert (= (and d!115207 (not c!99470)) b!951701))

(assert (= (and d!115207 res!637730) b!951682))

(assert (= (and b!951682 res!637736) b!951689))

(assert (= (and b!951682 (not res!637731)) b!951691))

(assert (= (and b!951691 res!637729) b!951696))

(assert (= (and b!951682 res!637737) b!951699))

(assert (= (and b!951699 c!99467) b!951687))

(assert (= (and b!951699 (not c!99467)) b!951688))

(assert (= (and b!951687 res!637732) b!951683))

(assert (= (or b!951687 b!951688) bm!41508))

(assert (= (and b!951699 res!637735) b!951692))

(assert (= (and b!951692 c!99471) b!951700))

(assert (= (and b!951692 (not c!99471)) b!951693))

(assert (= (and b!951700 res!637734) b!951690))

(assert (= (or b!951700 b!951693) bm!41507))

(declare-fun b_lambda!14381 () Bool)

(assert (=> (not b_lambda!14381) (not b!951696)))

(declare-fun t!27705 () Bool)

(declare-fun tb!6195 () Bool)

(assert (=> (and b!951520 (= (defaultEntry!5811 thiss!1141) (defaultEntry!5811 thiss!1141)) t!27705) tb!6195))

(declare-fun result!12323 () Bool)

(assert (=> tb!6195 (= result!12323 tp_is_empty!20785)))

(assert (=> b!951696 t!27705))

(declare-fun b_and!29729 () Bool)

(assert (= b_and!29723 (and (=> t!27705 result!12323) b_and!29729)))

(declare-fun m!883317 () Bool)

(assert (=> bm!41508 m!883317))

(declare-fun m!883319 () Bool)

(assert (=> b!951684 m!883319))

(declare-fun m!883321 () Bool)

(assert (=> b!951694 m!883321))

(declare-fun m!883323 () Bool)

(assert (=> b!951694 m!883323))

(declare-fun m!883325 () Bool)

(assert (=> b!951694 m!883325))

(assert (=> b!951694 m!883297))

(declare-fun m!883327 () Bool)

(assert (=> b!951694 m!883327))

(declare-fun m!883329 () Bool)

(assert (=> b!951694 m!883329))

(assert (=> b!951694 m!883327))

(declare-fun m!883331 () Bool)

(assert (=> b!951694 m!883331))

(declare-fun m!883333 () Bool)

(assert (=> b!951694 m!883333))

(assert (=> b!951694 m!883321))

(declare-fun m!883335 () Bool)

(assert (=> b!951694 m!883335))

(declare-fun m!883337 () Bool)

(assert (=> b!951694 m!883337))

(declare-fun m!883339 () Bool)

(assert (=> b!951694 m!883339))

(declare-fun m!883341 () Bool)

(assert (=> b!951694 m!883341))

(declare-fun m!883343 () Bool)

(assert (=> b!951694 m!883343))

(declare-fun m!883345 () Bool)

(assert (=> b!951694 m!883345))

(declare-fun m!883347 () Bool)

(assert (=> b!951694 m!883347))

(assert (=> b!951694 m!883325))

(declare-fun m!883349 () Bool)

(assert (=> b!951694 m!883349))

(declare-fun m!883351 () Bool)

(assert (=> b!951694 m!883351))

(assert (=> b!951694 m!883337))

(declare-fun m!883353 () Bool)

(assert (=> bm!41509 m!883353))

(assert (=> bm!41506 m!883343))

(assert (=> b!951691 m!883297))

(assert (=> b!951691 m!883297))

(declare-fun m!883355 () Bool)

(assert (=> b!951691 m!883355))

(declare-fun m!883357 () Bool)

(assert (=> b!951683 m!883357))

(assert (=> b!951689 m!883297))

(assert (=> b!951689 m!883297))

(declare-fun m!883359 () Bool)

(assert (=> b!951689 m!883359))

(declare-fun m!883361 () Bool)

(assert (=> bm!41507 m!883361))

(assert (=> b!951696 m!883297))

(assert (=> b!951696 m!883297))

(declare-fun m!883363 () Bool)

(assert (=> b!951696 m!883363))

(declare-fun m!883365 () Bool)

(assert (=> b!951696 m!883365))

(declare-fun m!883367 () Bool)

(assert (=> b!951696 m!883367))

(declare-fun m!883369 () Bool)

(assert (=> b!951696 m!883369))

(assert (=> b!951696 m!883367))

(assert (=> b!951696 m!883365))

(declare-fun m!883371 () Bool)

(assert (=> b!951690 m!883371))

(assert (=> d!115207 m!883209))

(assert (=> b!951685 m!883297))

(assert (=> b!951685 m!883297))

(assert (=> b!951685 m!883359))

(assert (=> b!951526 d!115207))

(declare-fun d!115209 () Bool)

(declare-fun res!637744 () Bool)

(declare-fun e!535942 () Bool)

(assert (=> d!115209 (=> (not res!637744) (not e!535942))))

(declare-fun simpleValid!380 (LongMapFixedSize!4972) Bool)

(assert (=> d!115209 (= res!637744 (simpleValid!380 thiss!1141))))

(assert (=> d!115209 (= (valid!1897 thiss!1141) e!535942)))

(declare-fun b!951710 () Bool)

(declare-fun res!637745 () Bool)

(assert (=> b!951710 (=> (not res!637745) (not e!535942))))

(declare-fun arrayCountValidKeys!0 (array!57567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951710 (= res!637745 (= (arrayCountValidKeys!0 (_keys!10753 thiss!1141) #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))) (_size!2541 thiss!1141)))))

(declare-fun b!951711 () Bool)

(declare-fun res!637746 () Bool)

(assert (=> b!951711 (=> (not res!637746) (not e!535942))))

(assert (=> b!951711 (= res!637746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(declare-fun b!951712 () Bool)

(declare-datatypes ((List!19362 0))(
  ( (Nil!19359) (Cons!19358 (h!20519 (_ BitVec 64)) (t!27706 List!19362)) )
))
(declare-fun arrayNoDuplicates!0 (array!57567 (_ BitVec 32) List!19362) Bool)

(assert (=> b!951712 (= e!535942 (arrayNoDuplicates!0 (_keys!10753 thiss!1141) #b00000000000000000000000000000000 Nil!19359))))

(assert (= (and d!115209 res!637744) b!951710))

(assert (= (and b!951710 res!637745) b!951711))

(assert (= (and b!951711 res!637746) b!951712))

(declare-fun m!883373 () Bool)

(assert (=> d!115209 m!883373))

(declare-fun m!883375 () Bool)

(assert (=> b!951710 m!883375))

(declare-fun m!883377 () Bool)

(assert (=> b!951711 m!883377))

(declare-fun m!883379 () Bool)

(assert (=> b!951712 m!883379))

(assert (=> start!81388 d!115209))

(declare-fun mapIsEmpty!33117 () Bool)

(declare-fun mapRes!33117 () Bool)

(assert (=> mapIsEmpty!33117 mapRes!33117))

(declare-fun mapNonEmpty!33117 () Bool)

(declare-fun tp!63462 () Bool)

(declare-fun e!535947 () Bool)

(assert (=> mapNonEmpty!33117 (= mapRes!33117 (and tp!63462 e!535947))))

(declare-fun mapRest!33117 () (Array (_ BitVec 32) ValueCell!9911))

(declare-fun mapKey!33117 () (_ BitVec 32))

(declare-fun mapValue!33117 () ValueCell!9911)

(assert (=> mapNonEmpty!33117 (= mapRest!33108 (store mapRest!33117 mapKey!33117 mapValue!33117))))

(declare-fun condMapEmpty!33117 () Bool)

(declare-fun mapDefault!33117 () ValueCell!9911)

(assert (=> mapNonEmpty!33108 (= condMapEmpty!33117 (= mapRest!33108 ((as const (Array (_ BitVec 32) ValueCell!9911)) mapDefault!33117)))))

(declare-fun e!535948 () Bool)

(assert (=> mapNonEmpty!33108 (= tp!63446 (and e!535948 mapRes!33117))))

(declare-fun b!951719 () Bool)

(assert (=> b!951719 (= e!535947 tp_is_empty!20785)))

(declare-fun b!951720 () Bool)

(assert (=> b!951720 (= e!535948 tp_is_empty!20785)))

(assert (= (and mapNonEmpty!33108 condMapEmpty!33117) mapIsEmpty!33117))

(assert (= (and mapNonEmpty!33108 (not condMapEmpty!33117)) mapNonEmpty!33117))

(assert (= (and mapNonEmpty!33117 ((_ is ValueCellFull!9911) mapValue!33117)) b!951719))

(assert (= (and mapNonEmpty!33108 ((_ is ValueCellFull!9911) mapDefault!33117)) b!951720))

(declare-fun m!883381 () Bool)

(assert (=> mapNonEmpty!33117 m!883381))

(declare-fun b_lambda!14383 () Bool)

(assert (= b_lambda!14381 (or (and b!951520 b_free!18277) b_lambda!14383)))

(check-sat tp_is_empty!20785 (not bm!41509) (not b!951691) (not bm!41507) (not bm!41488) (not b!951710) (not b_lambda!14383) b_and!29729 (not b!951636) (not d!115203) (not b!951694) (not mapNonEmpty!33117) (not b!951617) (not b!951683) (not d!115209) (not b!951690) (not d!115187) (not b!951712) (not b!951611) (not bm!41508) (not b!951685) (not d!115207) (not d!115205) (not b_next!18277) (not d!115197) (not b!951609) (not b!951689) (not b!951598) (not b!951696) (not bm!41506) (not b!951622) (not b!951629) (not b!951638) (not b!951684) (not b!951711))
(check-sat b_and!29729 (not b_next!18277))
(get-model)

(declare-fun b!951733 () Bool)

(declare-fun c!99481 () Bool)

(declare-fun lt!428668 () (_ BitVec 64))

(assert (=> b!951733 (= c!99481 (= lt!428668 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535957 () SeekEntryResult!9151)

(declare-fun e!535956 () SeekEntryResult!9151)

(assert (=> b!951733 (= e!535957 e!535956)))

(declare-fun b!951734 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951734 (= e!535956 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81880 lt!428566) #b00000000000000000000000000000001) (nextIndex!0 (index!38977 lt!428566) (x!81880 lt!428566) (mask!27635 thiss!1141)) (index!38977 lt!428566) key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(declare-fun b!951735 () Bool)

(assert (=> b!951735 (= e!535957 (Found!9151 (index!38977 lt!428566)))))

(declare-fun lt!428667 () SeekEntryResult!9151)

(declare-fun d!115211 () Bool)

(assert (=> d!115211 (and (or ((_ is Undefined!9151) lt!428667) (not ((_ is Found!9151) lt!428667)) (and (bvsge (index!38976 lt!428667) #b00000000000000000000000000000000) (bvslt (index!38976 lt!428667) (size!28158 (_keys!10753 thiss!1141))))) (or ((_ is Undefined!9151) lt!428667) ((_ is Found!9151) lt!428667) (not ((_ is MissingVacant!9151) lt!428667)) (not (= (index!38978 lt!428667) (index!38977 lt!428566))) (and (bvsge (index!38978 lt!428667) #b00000000000000000000000000000000) (bvslt (index!38978 lt!428667) (size!28158 (_keys!10753 thiss!1141))))) (or ((_ is Undefined!9151) lt!428667) (ite ((_ is Found!9151) lt!428667) (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38976 lt!428667)) key!756) (and ((_ is MissingVacant!9151) lt!428667) (= (index!38978 lt!428667) (index!38977 lt!428566)) (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38978 lt!428667)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!535955 () SeekEntryResult!9151)

(assert (=> d!115211 (= lt!428667 e!535955)))

(declare-fun c!99480 () Bool)

(assert (=> d!115211 (= c!99480 (bvsge (x!81880 lt!428566) #b01111111111111111111111111111110))))

(assert (=> d!115211 (= lt!428668 (select (arr!27678 (_keys!10753 thiss!1141)) (index!38977 lt!428566)))))

(assert (=> d!115211 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115211 (= (seekKeyOrZeroReturnVacant!0 (x!81880 lt!428566) (index!38977 lt!428566) (index!38977 lt!428566) key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) lt!428667)))

(declare-fun b!951736 () Bool)

(assert (=> b!951736 (= e!535955 Undefined!9151)))

(declare-fun b!951737 () Bool)

(assert (=> b!951737 (= e!535955 e!535957)))

(declare-fun c!99479 () Bool)

(assert (=> b!951737 (= c!99479 (= lt!428668 key!756))))

(declare-fun b!951738 () Bool)

(assert (=> b!951738 (= e!535956 (MissingVacant!9151 (index!38977 lt!428566)))))

(assert (= (and d!115211 c!99480) b!951736))

(assert (= (and d!115211 (not c!99480)) b!951737))

(assert (= (and b!951737 c!99479) b!951735))

(assert (= (and b!951737 (not c!99479)) b!951733))

(assert (= (and b!951733 c!99481) b!951738))

(assert (= (and b!951733 (not c!99481)) b!951734))

(declare-fun m!883383 () Bool)

(assert (=> b!951734 m!883383))

(assert (=> b!951734 m!883383))

(declare-fun m!883385 () Bool)

(assert (=> b!951734 m!883385))

(declare-fun m!883387 () Bool)

(assert (=> d!115211 m!883387))

(declare-fun m!883389 () Bool)

(assert (=> d!115211 m!883389))

(assert (=> d!115211 m!883281))

(assert (=> d!115211 m!883209))

(assert (=> b!951598 d!115211))

(declare-fun d!115213 () Bool)

(declare-fun lt!428671 () (_ BitVec 32))

(assert (=> d!115213 (and (bvsge lt!428671 #b00000000000000000000000000000000) (bvsle lt!428671 (bvsub (size!28158 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535963 () (_ BitVec 32))

(assert (=> d!115213 (= lt!428671 e!535963)))

(declare-fun c!99487 () Bool)

(assert (=> d!115213 (= c!99487 (bvsge #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115213 (and (bvsle #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28158 (_keys!10753 thiss!1141)) (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115213 (= (arrayCountValidKeys!0 (_keys!10753 thiss!1141) #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))) lt!428671)))

(declare-fun b!951747 () Bool)

(declare-fun e!535962 () (_ BitVec 32))

(declare-fun call!41515 () (_ BitVec 32))

(assert (=> b!951747 (= e!535962 (bvadd #b00000000000000000000000000000001 call!41515))))

(declare-fun b!951748 () Bool)

(assert (=> b!951748 (= e!535963 #b00000000000000000000000000000000)))

(declare-fun b!951749 () Bool)

(assert (=> b!951749 (= e!535962 call!41515)))

(declare-fun b!951750 () Bool)

(assert (=> b!951750 (= e!535963 e!535962)))

(declare-fun c!99486 () Bool)

(assert (=> b!951750 (= c!99486 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41512 () Bool)

(assert (=> bm!41512 (= call!41515 (arrayCountValidKeys!0 (_keys!10753 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28158 (_keys!10753 thiss!1141))))))

(assert (= (and d!115213 c!99487) b!951748))

(assert (= (and d!115213 (not c!99487)) b!951750))

(assert (= (and b!951750 c!99486) b!951747))

(assert (= (and b!951750 (not c!99486)) b!951749))

(assert (= (or b!951747 b!951749) bm!41512))

(assert (=> b!951750 m!883297))

(assert (=> b!951750 m!883297))

(assert (=> b!951750 m!883359))

(declare-fun m!883391 () Bool)

(assert (=> bm!41512 m!883391))

(assert (=> b!951710 d!115213))

(declare-fun b!951775 () Bool)

(assert (=> b!951775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> b!951775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28157 (_values!5834 thiss!1141))))))

(declare-fun e!535980 () Bool)

(declare-fun lt!428690 () ListLongMap!12307)

(assert (=> b!951775 (= e!535980 (= (apply!877 lt!428690 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)) (get!14547 (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951776 () Bool)

(declare-fun e!535981 () Bool)

(declare-fun e!535983 () Bool)

(assert (=> b!951776 (= e!535981 e!535983)))

(declare-fun c!99496 () Bool)

(assert (=> b!951776 (= c!99496 (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun b!951777 () Bool)

(assert (=> b!951777 (= e!535981 e!535980)))

(assert (=> b!951777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun res!637757 () Bool)

(assert (=> b!951777 (= res!637757 (contains!5205 lt!428690 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951777 (=> (not res!637757) (not e!535980))))

(declare-fun b!951778 () Bool)

(declare-fun e!535982 () ListLongMap!12307)

(assert (=> b!951778 (= e!535982 (ListLongMap!12308 Nil!19358))))

(declare-fun b!951779 () Bool)

(assert (=> b!951779 (= e!535983 (= lt!428690 (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5811 thiss!1141))))))

(declare-fun b!951780 () Bool)

(declare-fun e!535979 () Bool)

(assert (=> b!951780 (= e!535979 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951780 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!115215 () Bool)

(declare-fun e!535984 () Bool)

(assert (=> d!115215 e!535984))

(declare-fun res!637758 () Bool)

(assert (=> d!115215 (=> (not res!637758) (not e!535984))))

(assert (=> d!115215 (= res!637758 (not (contains!5205 lt!428690 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115215 (= lt!428690 e!535982)))

(declare-fun c!99498 () Bool)

(assert (=> d!115215 (= c!99498 (bvsge #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115215 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115215 (= (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)) lt!428690)))

(declare-fun b!951781 () Bool)

(declare-fun lt!428692 () Unit!31901)

(declare-fun lt!428686 () Unit!31901)

(assert (=> b!951781 (= lt!428692 lt!428686)))

(declare-fun lt!428689 () (_ BitVec 64))

(declare-fun lt!428688 () V!32679)

(declare-fun lt!428691 () ListLongMap!12307)

(declare-fun lt!428687 () (_ BitVec 64))

(assert (=> b!951781 (not (contains!5205 (+!2887 lt!428691 (tuple2!13621 lt!428689 lt!428688)) lt!428687))))

(declare-fun addStillNotContains!229 (ListLongMap!12307 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!31901)

(assert (=> b!951781 (= lt!428686 (addStillNotContains!229 lt!428691 lt!428689 lt!428688 lt!428687))))

(assert (=> b!951781 (= lt!428687 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!951781 (= lt!428688 (get!14547 (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!951781 (= lt!428689 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun call!41518 () ListLongMap!12307)

(assert (=> b!951781 (= lt!428691 call!41518)))

(declare-fun e!535978 () ListLongMap!12307)

(assert (=> b!951781 (= e!535978 (+!2887 call!41518 (tuple2!13621 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) (get!14547 (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!951782 () Bool)

(declare-fun isEmpty!719 (ListLongMap!12307) Bool)

(assert (=> b!951782 (= e!535983 (isEmpty!719 lt!428690))))

(declare-fun bm!41515 () Bool)

(assert (=> bm!41515 (= call!41518 (getCurrentListMapNoExtraKeys!3359 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5811 thiss!1141)))))

(declare-fun b!951783 () Bool)

(declare-fun res!637756 () Bool)

(assert (=> b!951783 (=> (not res!637756) (not e!535984))))

(assert (=> b!951783 (= res!637756 (not (contains!5205 lt!428690 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!951784 () Bool)

(assert (=> b!951784 (= e!535978 call!41518)))

(declare-fun b!951785 () Bool)

(assert (=> b!951785 (= e!535984 e!535981)))

(declare-fun c!99499 () Bool)

(assert (=> b!951785 (= c!99499 e!535979)))

(declare-fun res!637755 () Bool)

(assert (=> b!951785 (=> (not res!637755) (not e!535979))))

(assert (=> b!951785 (= res!637755 (bvslt #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun b!951786 () Bool)

(assert (=> b!951786 (= e!535982 e!535978)))

(declare-fun c!99497 () Bool)

(assert (=> b!951786 (= c!99497 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115215 c!99498) b!951778))

(assert (= (and d!115215 (not c!99498)) b!951786))

(assert (= (and b!951786 c!99497) b!951781))

(assert (= (and b!951786 (not c!99497)) b!951784))

(assert (= (or b!951781 b!951784) bm!41515))

(assert (= (and d!115215 res!637758) b!951783))

(assert (= (and b!951783 res!637756) b!951785))

(assert (= (and b!951785 res!637755) b!951780))

(assert (= (and b!951785 c!99499) b!951777))

(assert (= (and b!951785 (not c!99499)) b!951776))

(assert (= (and b!951777 res!637757) b!951775))

(assert (= (and b!951776 c!99496) b!951779))

(assert (= (and b!951776 (not c!99496)) b!951782))

(declare-fun b_lambda!14385 () Bool)

(assert (=> (not b_lambda!14385) (not b!951775)))

(assert (=> b!951775 t!27705))

(declare-fun b_and!29731 () Bool)

(assert (= b_and!29729 (and (=> t!27705 result!12323) b_and!29731)))

(declare-fun b_lambda!14387 () Bool)

(assert (=> (not b_lambda!14387) (not b!951781)))

(assert (=> b!951781 t!27705))

(declare-fun b_and!29733 () Bool)

(assert (= b_and!29731 (and (=> t!27705 result!12323) b_and!29733)))

(assert (=> b!951775 m!883365))

(assert (=> b!951775 m!883367))

(assert (=> b!951775 m!883365))

(assert (=> b!951775 m!883367))

(assert (=> b!951775 m!883369))

(assert (=> b!951775 m!883297))

(assert (=> b!951775 m!883297))

(declare-fun m!883393 () Bool)

(assert (=> b!951775 m!883393))

(declare-fun m!883395 () Bool)

(assert (=> bm!41515 m!883395))

(declare-fun m!883397 () Bool)

(assert (=> b!951782 m!883397))

(declare-fun m!883399 () Bool)

(assert (=> b!951783 m!883399))

(declare-fun m!883401 () Bool)

(assert (=> d!115215 m!883401))

(assert (=> d!115215 m!883209))

(assert (=> b!951780 m!883297))

(assert (=> b!951780 m!883297))

(assert (=> b!951780 m!883359))

(assert (=> b!951777 m!883297))

(assert (=> b!951777 m!883297))

(declare-fun m!883403 () Bool)

(assert (=> b!951777 m!883403))

(assert (=> b!951786 m!883297))

(assert (=> b!951786 m!883297))

(assert (=> b!951786 m!883359))

(assert (=> b!951779 m!883395))

(assert (=> b!951781 m!883365))

(assert (=> b!951781 m!883367))

(declare-fun m!883405 () Bool)

(assert (=> b!951781 m!883405))

(declare-fun m!883407 () Bool)

(assert (=> b!951781 m!883407))

(assert (=> b!951781 m!883405))

(assert (=> b!951781 m!883365))

(assert (=> b!951781 m!883367))

(assert (=> b!951781 m!883369))

(declare-fun m!883409 () Bool)

(assert (=> b!951781 m!883409))

(assert (=> b!951781 m!883297))

(declare-fun m!883411 () Bool)

(assert (=> b!951781 m!883411))

(assert (=> bm!41506 d!115215))

(declare-fun b!951795 () Bool)

(declare-fun res!637768 () Bool)

(declare-fun e!535987 () Bool)

(assert (=> b!951795 (=> (not res!637768) (not e!535987))))

(assert (=> b!951795 (= res!637768 (and (= (size!28157 (_values!5834 thiss!1141)) (bvadd (mask!27635 thiss!1141) #b00000000000000000000000000000001)) (= (size!28158 (_keys!10753 thiss!1141)) (size!28157 (_values!5834 thiss!1141))) (bvsge (_size!2541 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2541 thiss!1141) (bvadd (mask!27635 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!951798 () Bool)

(assert (=> b!951798 (= e!535987 (and (bvsge (extraKeys!5543 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5543 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2541 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!951796 () Bool)

(declare-fun res!637769 () Bool)

(assert (=> b!951796 (=> (not res!637769) (not e!535987))))

(declare-fun size!28163 (LongMapFixedSize!4972) (_ BitVec 32))

(assert (=> b!951796 (= res!637769 (bvsge (size!28163 thiss!1141) (_size!2541 thiss!1141)))))

(declare-fun d!115217 () Bool)

(declare-fun res!637767 () Bool)

(assert (=> d!115217 (=> (not res!637767) (not e!535987))))

(assert (=> d!115217 (= res!637767 (validMask!0 (mask!27635 thiss!1141)))))

(assert (=> d!115217 (= (simpleValid!380 thiss!1141) e!535987)))

(declare-fun b!951797 () Bool)

(declare-fun res!637770 () Bool)

(assert (=> b!951797 (=> (not res!637770) (not e!535987))))

(assert (=> b!951797 (= res!637770 (= (size!28163 thiss!1141) (bvadd (_size!2541 thiss!1141) (bvsdiv (bvadd (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!115217 res!637767) b!951795))

(assert (= (and b!951795 res!637768) b!951796))

(assert (= (and b!951796 res!637769) b!951797))

(assert (= (and b!951797 res!637770) b!951798))

(declare-fun m!883413 () Bool)

(assert (=> b!951796 m!883413))

(assert (=> d!115217 m!883209))

(assert (=> b!951797 m!883413))

(assert (=> d!115209 d!115217))

(declare-fun d!115219 () Bool)

(declare-fun res!637775 () Bool)

(declare-fun e!535992 () Bool)

(assert (=> d!115219 (=> res!637775 e!535992)))

(assert (=> d!115219 (= res!637775 (and ((_ is Cons!19357) (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (= (_1!6821 (h!20518 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)))))

(assert (=> d!115219 (= (containsKey!470 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756) e!535992)))

(declare-fun b!951803 () Bool)

(declare-fun e!535993 () Bool)

(assert (=> b!951803 (= e!535992 e!535993)))

(declare-fun res!637776 () Bool)

(assert (=> b!951803 (=> (not res!637776) (not e!535993))))

(assert (=> b!951803 (= res!637776 (and (or (not ((_ is Cons!19357) (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) (bvsle (_1!6821 (h!20518 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)) ((_ is Cons!19357) (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (bvslt (_1!6821 (h!20518 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)))))

(declare-fun b!951804 () Bool)

(assert (=> b!951804 (= e!535993 (containsKey!470 (t!27703 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) key!756))))

(assert (= (and d!115219 (not res!637775)) b!951803))

(assert (= (and b!951803 res!637776) b!951804))

(declare-fun m!883415 () Bool)

(assert (=> b!951804 m!883415))

(assert (=> d!115205 d!115219))

(assert (=> d!115203 d!115193))

(declare-fun d!115221 () Bool)

(assert (=> d!115221 (arrayForallSeekEntryOrOpenFound!0 lt!428534 (_keys!10753 thiss!1141) (mask!27635 thiss!1141))))

(assert (=> d!115221 true))

(declare-fun _$72!122 () Unit!31901)

(assert (=> d!115221 (= (choose!38 (_keys!10753 thiss!1141) (mask!27635 thiss!1141) #b00000000000000000000000000000000 lt!428534) _$72!122)))

(declare-fun bs!26710 () Bool)

(assert (= bs!26710 d!115221))

(assert (=> bs!26710 m!883217))

(assert (=> d!115203 d!115221))

(assert (=> d!115203 d!115201))

(declare-fun d!115223 () Bool)

(assert (=> d!115223 (arrayContainsKey!0 (_keys!10753 thiss!1141) lt!428575 #b00000000000000000000000000000000)))

(declare-fun lt!428695 () Unit!31901)

(declare-fun choose!13 (array!57567 (_ BitVec 64) (_ BitVec 32)) Unit!31901)

(assert (=> d!115223 (= lt!428695 (choose!13 (_keys!10753 thiss!1141) lt!428575 lt!428534))))

(assert (=> d!115223 (bvsge lt!428534 #b00000000000000000000000000000000)))

(assert (=> d!115223 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10753 thiss!1141) lt!428575 lt!428534) lt!428695)))

(declare-fun bs!26711 () Bool)

(assert (= bs!26711 d!115223))

(assert (=> bs!26711 m!883289))

(declare-fun m!883417 () Bool)

(assert (=> bs!26711 m!883417))

(assert (=> b!951609 d!115223))

(declare-fun d!115225 () Bool)

(declare-fun res!637777 () Bool)

(declare-fun e!535994 () Bool)

(assert (=> d!115225 (=> res!637777 e!535994)))

(assert (=> d!115225 (= res!637777 (= (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) lt!428575))))

(assert (=> d!115225 (= (arrayContainsKey!0 (_keys!10753 thiss!1141) lt!428575 #b00000000000000000000000000000000) e!535994)))

(declare-fun b!951805 () Bool)

(declare-fun e!535995 () Bool)

(assert (=> b!951805 (= e!535994 e!535995)))

(declare-fun res!637778 () Bool)

(assert (=> b!951805 (=> (not res!637778) (not e!535995))))

(assert (=> b!951805 (= res!637778 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun b!951806 () Bool)

(assert (=> b!951806 (= e!535995 (arrayContainsKey!0 (_keys!10753 thiss!1141) lt!428575 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115225 (not res!637777)) b!951805))

(assert (= (and b!951805 res!637778) b!951806))

(assert (=> d!115225 m!883297))

(declare-fun m!883419 () Bool)

(assert (=> b!951806 m!883419))

(assert (=> b!951609 d!115225))

(declare-fun b!951819 () Bool)

(declare-fun e!536004 () SeekEntryResult!9151)

(declare-fun lt!428704 () SeekEntryResult!9151)

(assert (=> b!951819 (= e!536004 (Found!9151 (index!38977 lt!428704)))))

(declare-fun b!951820 () Bool)

(declare-fun e!536002 () SeekEntryResult!9151)

(assert (=> b!951820 (= e!536002 Undefined!9151)))

(declare-fun b!951821 () Bool)

(assert (=> b!951821 (= e!536002 e!536004)))

(declare-fun lt!428703 () (_ BitVec 64))

(assert (=> b!951821 (= lt!428703 (select (arr!27678 (_keys!10753 thiss!1141)) (index!38977 lt!428704)))))

(declare-fun c!99506 () Bool)

(assert (=> b!951821 (= c!99506 (= lt!428703 (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534)))))

(declare-fun b!951822 () Bool)

(declare-fun c!99507 () Bool)

(assert (=> b!951822 (= c!99507 (= lt!428703 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536003 () SeekEntryResult!9151)

(assert (=> b!951822 (= e!536004 e!536003)))

(declare-fun d!115227 () Bool)

(declare-fun lt!428702 () SeekEntryResult!9151)

(assert (=> d!115227 (and (or ((_ is Undefined!9151) lt!428702) (not ((_ is Found!9151) lt!428702)) (and (bvsge (index!38976 lt!428702) #b00000000000000000000000000000000) (bvslt (index!38976 lt!428702) (size!28158 (_keys!10753 thiss!1141))))) (or ((_ is Undefined!9151) lt!428702) ((_ is Found!9151) lt!428702) (not ((_ is MissingZero!9151) lt!428702)) (and (bvsge (index!38975 lt!428702) #b00000000000000000000000000000000) (bvslt (index!38975 lt!428702) (size!28158 (_keys!10753 thiss!1141))))) (or ((_ is Undefined!9151) lt!428702) ((_ is Found!9151) lt!428702) ((_ is MissingZero!9151) lt!428702) (not ((_ is MissingVacant!9151) lt!428702)) (and (bvsge (index!38978 lt!428702) #b00000000000000000000000000000000) (bvslt (index!38978 lt!428702) (size!28158 (_keys!10753 thiss!1141))))) (or ((_ is Undefined!9151) lt!428702) (ite ((_ is Found!9151) lt!428702) (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38976 lt!428702)) (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534)) (ite ((_ is MissingZero!9151) lt!428702) (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38975 lt!428702)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9151) lt!428702) (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38978 lt!428702)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!115227 (= lt!428702 e!536002)))

(declare-fun c!99508 () Bool)

(assert (=> d!115227 (= c!99508 (and ((_ is Intermediate!9151) lt!428704) (undefined!9963 lt!428704)))))

(assert (=> d!115227 (= lt!428704 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534) (mask!27635 thiss!1141)) (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(assert (=> d!115227 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115227 (= (seekEntryOrOpen!0 (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) lt!428702)))

(declare-fun b!951823 () Bool)

(assert (=> b!951823 (= e!536003 (MissingZero!9151 (index!38977 lt!428704)))))

(declare-fun b!951824 () Bool)

(assert (=> b!951824 (= e!536003 (seekKeyOrZeroReturnVacant!0 (x!81880 lt!428704) (index!38977 lt!428704) (index!38977 lt!428704) (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(assert (= (and d!115227 c!99508) b!951820))

(assert (= (and d!115227 (not c!99508)) b!951821))

(assert (= (and b!951821 c!99506) b!951819))

(assert (= (and b!951821 (not c!99506)) b!951822))

(assert (= (and b!951822 c!99507) b!951823))

(assert (= (and b!951822 (not c!99507)) b!951824))

(declare-fun m!883421 () Bool)

(assert (=> b!951821 m!883421))

(declare-fun m!883423 () Bool)

(assert (=> d!115227 m!883423))

(assert (=> d!115227 m!883285))

(declare-fun m!883425 () Bool)

(assert (=> d!115227 m!883425))

(declare-fun m!883427 () Bool)

(assert (=> d!115227 m!883427))

(declare-fun m!883429 () Bool)

(assert (=> d!115227 m!883429))

(assert (=> d!115227 m!883285))

(assert (=> d!115227 m!883423))

(assert (=> d!115227 m!883209))

(declare-fun m!883431 () Bool)

(assert (=> d!115227 m!883431))

(assert (=> b!951824 m!883285))

(declare-fun m!883433 () Bool)

(assert (=> b!951824 m!883433))

(assert (=> b!951609 d!115227))

(declare-fun d!115229 () Bool)

(declare-fun get!14548 (Option!512) V!32679)

(assert (=> d!115229 (= (apply!877 lt!428644 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)) (get!14548 (getValueByKey!506 (toList!6169 lt!428644) (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26712 () Bool)

(assert (= bs!26712 d!115229))

(assert (=> bs!26712 m!883297))

(declare-fun m!883435 () Bool)

(assert (=> bs!26712 m!883435))

(assert (=> bs!26712 m!883435))

(declare-fun m!883437 () Bool)

(assert (=> bs!26712 m!883437))

(assert (=> b!951696 d!115229))

(declare-fun d!115231 () Bool)

(declare-fun c!99511 () Bool)

(assert (=> d!115231 (= c!99511 ((_ is ValueCellFull!9911) (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!536007 () V!32679)

(assert (=> d!115231 (= (get!14547 (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!536007)))

(declare-fun b!951829 () Bool)

(declare-fun get!14549 (ValueCell!9911 V!32679) V!32679)

(assert (=> b!951829 (= e!536007 (get!14549 (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!951830 () Bool)

(declare-fun get!14550 (ValueCell!9911 V!32679) V!32679)

(assert (=> b!951830 (= e!536007 (get!14550 (select (arr!27677 (_values!5834 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1643 (defaultEntry!5811 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115231 c!99511) b!951829))

(assert (= (and d!115231 (not c!99511)) b!951830))

(assert (=> b!951829 m!883365))

(assert (=> b!951829 m!883367))

(declare-fun m!883439 () Bool)

(assert (=> b!951829 m!883439))

(assert (=> b!951830 m!883365))

(assert (=> b!951830 m!883367))

(declare-fun m!883441 () Bool)

(assert (=> b!951830 m!883441))

(assert (=> b!951696 d!115231))

(assert (=> d!115207 d!115201))

(declare-fun d!115233 () Bool)

(declare-fun res!637779 () Bool)

(declare-fun e!536008 () Bool)

(assert (=> d!115233 (=> res!637779 e!536008)))

(assert (=> d!115233 (= res!637779 (= (select (arr!27678 (_keys!10753 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115233 (= (arrayContainsKey!0 (_keys!10753 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!536008)))

(declare-fun b!951831 () Bool)

(declare-fun e!536009 () Bool)

(assert (=> b!951831 (= e!536008 e!536009)))

(declare-fun res!637780 () Bool)

(assert (=> b!951831 (=> (not res!637780) (not e!536009))))

(assert (=> b!951831 (= res!637780 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun b!951832 () Bool)

(assert (=> b!951832 (= e!536009 (arrayContainsKey!0 (_keys!10753 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115233 (not res!637779)) b!951831))

(assert (= (and b!951831 res!637780) b!951832))

(declare-fun m!883443 () Bool)

(assert (=> d!115233 m!883443))

(declare-fun m!883445 () Bool)

(assert (=> b!951832 m!883445))

(assert (=> b!951617 d!115233))

(declare-fun b!951834 () Bool)

(declare-fun e!536010 () Bool)

(declare-fun e!536012 () Bool)

(assert (=> b!951834 (= e!536010 e!536012)))

(declare-fun lt!428707 () (_ BitVec 64))

(assert (=> b!951834 (= lt!428707 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428706 () Unit!31901)

(assert (=> b!951834 (= lt!428706 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10753 thiss!1141) lt!428707 #b00000000000000000000000000000000))))

(assert (=> b!951834 (arrayContainsKey!0 (_keys!10753 thiss!1141) lt!428707 #b00000000000000000000000000000000)))

(declare-fun lt!428705 () Unit!31901)

(assert (=> b!951834 (= lt!428705 lt!428706)))

(declare-fun res!637782 () Bool)

(assert (=> b!951834 (= res!637782 (= (seekEntryOrOpen!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) (Found!9151 #b00000000000000000000000000000000)))))

(assert (=> b!951834 (=> (not res!637782) (not e!536012))))

(declare-fun b!951835 () Bool)

(declare-fun call!41519 () Bool)

(assert (=> b!951835 (= e!536010 call!41519)))

(declare-fun bm!41516 () Bool)

(assert (=> bm!41516 (= call!41519 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(declare-fun b!951836 () Bool)

(declare-fun e!536011 () Bool)

(assert (=> b!951836 (= e!536011 e!536010)))

(declare-fun c!99512 () Bool)

(assert (=> b!951836 (= c!99512 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115235 () Bool)

(declare-fun res!637781 () Bool)

(assert (=> d!115235 (=> res!637781 e!536011)))

(assert (=> d!115235 (= res!637781 (bvsge #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115235 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) e!536011)))

(declare-fun b!951833 () Bool)

(assert (=> b!951833 (= e!536012 call!41519)))

(assert (= (and d!115235 (not res!637781)) b!951836))

(assert (= (and b!951836 c!99512) b!951834))

(assert (= (and b!951836 (not c!99512)) b!951835))

(assert (= (and b!951834 res!637782) b!951833))

(assert (= (or b!951833 b!951835) bm!41516))

(assert (=> b!951834 m!883297))

(declare-fun m!883447 () Bool)

(assert (=> b!951834 m!883447))

(declare-fun m!883449 () Bool)

(assert (=> b!951834 m!883449))

(assert (=> b!951834 m!883297))

(declare-fun m!883451 () Bool)

(assert (=> b!951834 m!883451))

(declare-fun m!883453 () Bool)

(assert (=> bm!41516 m!883453))

(assert (=> b!951836 m!883297))

(assert (=> b!951836 m!883297))

(assert (=> b!951836 m!883359))

(assert (=> b!951711 d!115235))

(declare-fun d!115237 () Bool)

(assert (=> d!115237 (= (apply!877 lt!428642 lt!428646) (get!14548 (getValueByKey!506 (toList!6169 lt!428642) lt!428646)))))

(declare-fun bs!26713 () Bool)

(assert (= bs!26713 d!115237))

(declare-fun m!883455 () Bool)

(assert (=> bs!26713 m!883455))

(assert (=> bs!26713 m!883455))

(declare-fun m!883457 () Bool)

(assert (=> bs!26713 m!883457))

(assert (=> b!951694 d!115237))

(declare-fun d!115239 () Bool)

(assert (=> d!115239 (= (apply!877 lt!428656 lt!428661) (get!14548 (getValueByKey!506 (toList!6169 lt!428656) lt!428661)))))

(declare-fun bs!26714 () Bool)

(assert (= bs!26714 d!115239))

(declare-fun m!883459 () Bool)

(assert (=> bs!26714 m!883459))

(assert (=> bs!26714 m!883459))

(declare-fun m!883461 () Bool)

(assert (=> bs!26714 m!883461))

(assert (=> b!951694 d!115239))

(declare-fun d!115241 () Bool)

(assert (=> d!115241 (= (apply!877 (+!2887 lt!428642 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))) lt!428646) (apply!877 lt!428642 lt!428646))))

(declare-fun lt!428710 () Unit!31901)

(declare-fun choose!1603 (ListLongMap!12307 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!31901)

(assert (=> d!115241 (= lt!428710 (choose!1603 lt!428642 lt!428652 (zeroValue!5647 thiss!1141) lt!428646))))

(declare-fun e!536015 () Bool)

(assert (=> d!115241 e!536015))

(declare-fun res!637785 () Bool)

(assert (=> d!115241 (=> (not res!637785) (not e!536015))))

(assert (=> d!115241 (= res!637785 (contains!5205 lt!428642 lt!428646))))

(assert (=> d!115241 (= (addApplyDifferent!456 lt!428642 lt!428652 (zeroValue!5647 thiss!1141) lt!428646) lt!428710)))

(declare-fun b!951840 () Bool)

(assert (=> b!951840 (= e!536015 (not (= lt!428646 lt!428652)))))

(assert (= (and d!115241 res!637785) b!951840))

(assert (=> d!115241 m!883351))

(declare-fun m!883463 () Bool)

(assert (=> d!115241 m!883463))

(declare-fun m!883465 () Bool)

(assert (=> d!115241 m!883465))

(assert (=> d!115241 m!883325))

(assert (=> d!115241 m!883349))

(assert (=> d!115241 m!883325))

(assert (=> b!951694 d!115241))

(declare-fun d!115243 () Bool)

(declare-fun e!536018 () Bool)

(assert (=> d!115243 e!536018))

(declare-fun res!637791 () Bool)

(assert (=> d!115243 (=> (not res!637791) (not e!536018))))

(declare-fun lt!428720 () ListLongMap!12307)

(assert (=> d!115243 (= res!637791 (contains!5205 lt!428720 (_1!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141)))))))

(declare-fun lt!428722 () List!19361)

(assert (=> d!115243 (= lt!428720 (ListLongMap!12308 lt!428722))))

(declare-fun lt!428719 () Unit!31901)

(declare-fun lt!428721 () Unit!31901)

(assert (=> d!115243 (= lt!428719 lt!428721)))

(assert (=> d!115243 (= (getValueByKey!506 lt!428722 (_1!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!268 (List!19361 (_ BitVec 64) V!32679) Unit!31901)

(assert (=> d!115243 (= lt!428721 (lemmaContainsTupThenGetReturnValue!268 lt!428722 (_1!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141)))))))

(declare-fun insertStrictlySorted!325 (List!19361 (_ BitVec 64) V!32679) List!19361)

(assert (=> d!115243 (= lt!428722 (insertStrictlySorted!325 (toList!6169 lt!428656) (_1!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141)))))))

(assert (=> d!115243 (= (+!2887 lt!428656 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))) lt!428720)))

(declare-fun b!951845 () Bool)

(declare-fun res!637790 () Bool)

(assert (=> b!951845 (=> (not res!637790) (not e!536018))))

(assert (=> b!951845 (= res!637790 (= (getValueByKey!506 (toList!6169 lt!428720) (_1!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))))))))

(declare-fun b!951846 () Bool)

(declare-fun contains!5206 (List!19361 tuple2!13620) Bool)

(assert (=> b!951846 (= e!536018 (contains!5206 (toList!6169 lt!428720) (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))))))

(assert (= (and d!115243 res!637791) b!951845))

(assert (= (and b!951845 res!637790) b!951846))

(declare-fun m!883467 () Bool)

(assert (=> d!115243 m!883467))

(declare-fun m!883469 () Bool)

(assert (=> d!115243 m!883469))

(declare-fun m!883471 () Bool)

(assert (=> d!115243 m!883471))

(declare-fun m!883473 () Bool)

(assert (=> d!115243 m!883473))

(declare-fun m!883475 () Bool)

(assert (=> b!951845 m!883475))

(declare-fun m!883477 () Bool)

(assert (=> b!951846 m!883477))

(assert (=> b!951694 d!115243))

(declare-fun d!115245 () Bool)

(assert (=> d!115245 (= (apply!877 (+!2887 lt!428642 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))) lt!428646) (get!14548 (getValueByKey!506 (toList!6169 (+!2887 lt!428642 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141)))) lt!428646)))))

(declare-fun bs!26715 () Bool)

(assert (= bs!26715 d!115245))

(declare-fun m!883479 () Bool)

(assert (=> bs!26715 m!883479))

(assert (=> bs!26715 m!883479))

(declare-fun m!883481 () Bool)

(assert (=> bs!26715 m!883481))

(assert (=> b!951694 d!115245))

(declare-fun d!115247 () Bool)

(declare-fun e!536019 () Bool)

(assert (=> d!115247 e!536019))

(declare-fun res!637793 () Bool)

(assert (=> d!115247 (=> (not res!637793) (not e!536019))))

(declare-fun lt!428724 () ListLongMap!12307)

(assert (=> d!115247 (= res!637793 (contains!5205 lt!428724 (_1!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141)))))))

(declare-fun lt!428726 () List!19361)

(assert (=> d!115247 (= lt!428724 (ListLongMap!12308 lt!428726))))

(declare-fun lt!428723 () Unit!31901)

(declare-fun lt!428725 () Unit!31901)

(assert (=> d!115247 (= lt!428723 lt!428725)))

(assert (=> d!115247 (= (getValueByKey!506 lt!428726 (_1!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115247 (= lt!428725 (lemmaContainsTupThenGetReturnValue!268 lt!428726 (_1!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115247 (= lt!428726 (insertStrictlySorted!325 (toList!6169 lt!428642) (_1!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115247 (= (+!2887 lt!428642 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))) lt!428724)))

(declare-fun b!951847 () Bool)

(declare-fun res!637792 () Bool)

(assert (=> b!951847 (=> (not res!637792) (not e!536019))))

(assert (=> b!951847 (= res!637792 (= (getValueByKey!506 (toList!6169 lt!428724) (_1!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))))))))

(declare-fun b!951848 () Bool)

(assert (=> b!951848 (= e!536019 (contains!5206 (toList!6169 lt!428724) (tuple2!13621 lt!428652 (zeroValue!5647 thiss!1141))))))

(assert (= (and d!115247 res!637793) b!951847))

(assert (= (and b!951847 res!637792) b!951848))

(declare-fun m!883483 () Bool)

(assert (=> d!115247 m!883483))

(declare-fun m!883485 () Bool)

(assert (=> d!115247 m!883485))

(declare-fun m!883487 () Bool)

(assert (=> d!115247 m!883487))

(declare-fun m!883489 () Bool)

(assert (=> d!115247 m!883489))

(declare-fun m!883491 () Bool)

(assert (=> b!951847 m!883491))

(declare-fun m!883493 () Bool)

(assert (=> b!951848 m!883493))

(assert (=> b!951694 d!115247))

(declare-fun d!115249 () Bool)

(assert (=> d!115249 (= (apply!877 (+!2887 lt!428648 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))) lt!428662) (apply!877 lt!428648 lt!428662))))

(declare-fun lt!428727 () Unit!31901)

(assert (=> d!115249 (= lt!428727 (choose!1603 lt!428648 lt!428657 (minValue!5647 thiss!1141) lt!428662))))

(declare-fun e!536020 () Bool)

(assert (=> d!115249 e!536020))

(declare-fun res!637794 () Bool)

(assert (=> d!115249 (=> (not res!637794) (not e!536020))))

(assert (=> d!115249 (= res!637794 (contains!5205 lt!428648 lt!428662))))

(assert (=> d!115249 (= (addApplyDifferent!456 lt!428648 lt!428657 (minValue!5647 thiss!1141) lt!428662) lt!428727)))

(declare-fun b!951849 () Bool)

(assert (=> b!951849 (= e!536020 (not (= lt!428662 lt!428657)))))

(assert (= (and d!115249 res!637794) b!951849))

(assert (=> d!115249 m!883341))

(declare-fun m!883495 () Bool)

(assert (=> d!115249 m!883495))

(declare-fun m!883497 () Bool)

(assert (=> d!115249 m!883497))

(assert (=> d!115249 m!883327))

(assert (=> d!115249 m!883331))

(assert (=> d!115249 m!883327))

(assert (=> b!951694 d!115249))

(declare-fun d!115251 () Bool)

(assert (=> d!115251 (= (apply!877 lt!428648 lt!428662) (get!14548 (getValueByKey!506 (toList!6169 lt!428648) lt!428662)))))

(declare-fun bs!26716 () Bool)

(assert (= bs!26716 d!115251))

(declare-fun m!883499 () Bool)

(assert (=> bs!26716 m!883499))

(assert (=> bs!26716 m!883499))

(declare-fun m!883501 () Bool)

(assert (=> bs!26716 m!883501))

(assert (=> b!951694 d!115251))

(declare-fun d!115253 () Bool)

(declare-fun e!536021 () Bool)

(assert (=> d!115253 e!536021))

(declare-fun res!637795 () Bool)

(assert (=> d!115253 (=> res!637795 e!536021)))

(declare-fun lt!428728 () Bool)

(assert (=> d!115253 (= res!637795 (not lt!428728))))

(declare-fun lt!428731 () Bool)

(assert (=> d!115253 (= lt!428728 lt!428731)))

(declare-fun lt!428730 () Unit!31901)

(declare-fun e!536022 () Unit!31901)

(assert (=> d!115253 (= lt!428730 e!536022)))

(declare-fun c!99513 () Bool)

(assert (=> d!115253 (= c!99513 lt!428731)))

(assert (=> d!115253 (= lt!428731 (containsKey!470 (toList!6169 (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))) lt!428659))))

(assert (=> d!115253 (= (contains!5205 (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))) lt!428659) lt!428728)))

(declare-fun b!951850 () Bool)

(declare-fun lt!428729 () Unit!31901)

(assert (=> b!951850 (= e!536022 lt!428729)))

(assert (=> b!951850 (= lt!428729 (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6169 (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))) lt!428659))))

(assert (=> b!951850 (isDefined!378 (getValueByKey!506 (toList!6169 (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))) lt!428659))))

(declare-fun b!951851 () Bool)

(declare-fun Unit!31907 () Unit!31901)

(assert (=> b!951851 (= e!536022 Unit!31907)))

(declare-fun b!951852 () Bool)

(assert (=> b!951852 (= e!536021 (isDefined!378 (getValueByKey!506 (toList!6169 (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))) lt!428659)))))

(assert (= (and d!115253 c!99513) b!951850))

(assert (= (and d!115253 (not c!99513)) b!951851))

(assert (= (and d!115253 (not res!637795)) b!951852))

(declare-fun m!883503 () Bool)

(assert (=> d!115253 m!883503))

(declare-fun m!883505 () Bool)

(assert (=> b!951850 m!883505))

(declare-fun m!883507 () Bool)

(assert (=> b!951850 m!883507))

(assert (=> b!951850 m!883507))

(declare-fun m!883509 () Bool)

(assert (=> b!951850 m!883509))

(assert (=> b!951852 m!883507))

(assert (=> b!951852 m!883507))

(assert (=> b!951852 m!883509))

(assert (=> b!951694 d!115253))

(declare-fun d!115255 () Bool)

(assert (=> d!115255 (= (apply!877 (+!2887 lt!428656 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))) lt!428661) (get!14548 (getValueByKey!506 (toList!6169 (+!2887 lt!428656 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141)))) lt!428661)))))

(declare-fun bs!26717 () Bool)

(assert (= bs!26717 d!115255))

(declare-fun m!883511 () Bool)

(assert (=> bs!26717 m!883511))

(assert (=> bs!26717 m!883511))

(declare-fun m!883513 () Bool)

(assert (=> bs!26717 m!883513))

(assert (=> b!951694 d!115255))

(declare-fun d!115257 () Bool)

(declare-fun e!536023 () Bool)

(assert (=> d!115257 e!536023))

(declare-fun res!637797 () Bool)

(assert (=> d!115257 (=> (not res!637797) (not e!536023))))

(declare-fun lt!428733 () ListLongMap!12307)

(assert (=> d!115257 (= res!637797 (contains!5205 lt!428733 (_1!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141)))))))

(declare-fun lt!428735 () List!19361)

(assert (=> d!115257 (= lt!428733 (ListLongMap!12308 lt!428735))))

(declare-fun lt!428732 () Unit!31901)

(declare-fun lt!428734 () Unit!31901)

(assert (=> d!115257 (= lt!428732 lt!428734)))

(assert (=> d!115257 (= (getValueByKey!506 lt!428735 (_1!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141)))))))

(assert (=> d!115257 (= lt!428734 (lemmaContainsTupThenGetReturnValue!268 lt!428735 (_1!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141)))))))

(assert (=> d!115257 (= lt!428735 (insertStrictlySorted!325 (toList!6169 lt!428648) (_1!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141)))))))

(assert (=> d!115257 (= (+!2887 lt!428648 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))) lt!428733)))

(declare-fun b!951853 () Bool)

(declare-fun res!637796 () Bool)

(assert (=> b!951853 (=> (not res!637796) (not e!536023))))

(assert (=> b!951853 (= res!637796 (= (getValueByKey!506 (toList!6169 lt!428733) (_1!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))))))))

(declare-fun b!951854 () Bool)

(assert (=> b!951854 (= e!536023 (contains!5206 (toList!6169 lt!428733) (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))))))

(assert (= (and d!115257 res!637797) b!951853))

(assert (= (and b!951853 res!637796) b!951854))

(declare-fun m!883515 () Bool)

(assert (=> d!115257 m!883515))

(declare-fun m!883517 () Bool)

(assert (=> d!115257 m!883517))

(declare-fun m!883519 () Bool)

(assert (=> d!115257 m!883519))

(declare-fun m!883521 () Bool)

(assert (=> d!115257 m!883521))

(declare-fun m!883523 () Bool)

(assert (=> b!951853 m!883523))

(declare-fun m!883525 () Bool)

(assert (=> b!951854 m!883525))

(assert (=> b!951694 d!115257))

(declare-fun d!115259 () Bool)

(declare-fun e!536024 () Bool)

(assert (=> d!115259 e!536024))

(declare-fun res!637799 () Bool)

(assert (=> d!115259 (=> (not res!637799) (not e!536024))))

(declare-fun lt!428737 () ListLongMap!12307)

(assert (=> d!115259 (= res!637799 (contains!5205 lt!428737 (_1!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))))))

(declare-fun lt!428739 () List!19361)

(assert (=> d!115259 (= lt!428737 (ListLongMap!12308 lt!428739))))

(declare-fun lt!428736 () Unit!31901)

(declare-fun lt!428738 () Unit!31901)

(assert (=> d!115259 (= lt!428736 lt!428738)))

(assert (=> d!115259 (= (getValueByKey!506 lt!428739 (_1!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115259 (= lt!428738 (lemmaContainsTupThenGetReturnValue!268 lt!428739 (_1!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115259 (= lt!428739 (insertStrictlySorted!325 (toList!6169 lt!428653) (_1!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))))))

(assert (=> d!115259 (= (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))) lt!428737)))

(declare-fun b!951855 () Bool)

(declare-fun res!637798 () Bool)

(assert (=> b!951855 (=> (not res!637798) (not e!536024))))

(assert (=> b!951855 (= res!637798 (= (getValueByKey!506 (toList!6169 lt!428737) (_1!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))))))))

(declare-fun b!951856 () Bool)

(assert (=> b!951856 (= e!536024 (contains!5206 (toList!6169 lt!428737) (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))))))

(assert (= (and d!115259 res!637799) b!951855))

(assert (= (and b!951855 res!637798) b!951856))

(declare-fun m!883527 () Bool)

(assert (=> d!115259 m!883527))

(declare-fun m!883529 () Bool)

(assert (=> d!115259 m!883529))

(declare-fun m!883531 () Bool)

(assert (=> d!115259 m!883531))

(declare-fun m!883533 () Bool)

(assert (=> d!115259 m!883533))

(declare-fun m!883535 () Bool)

(assert (=> b!951855 m!883535))

(declare-fun m!883537 () Bool)

(assert (=> b!951856 m!883537))

(assert (=> b!951694 d!115259))

(declare-fun d!115261 () Bool)

(assert (=> d!115261 (contains!5205 (+!2887 lt!428653 (tuple2!13621 lt!428647 (zeroValue!5647 thiss!1141))) lt!428659)))

(declare-fun lt!428742 () Unit!31901)

(declare-fun choose!1604 (ListLongMap!12307 (_ BitVec 64) V!32679 (_ BitVec 64)) Unit!31901)

(assert (=> d!115261 (= lt!428742 (choose!1604 lt!428653 lt!428647 (zeroValue!5647 thiss!1141) lt!428659))))

(assert (=> d!115261 (contains!5205 lt!428653 lt!428659)))

(assert (=> d!115261 (= (addStillContains!576 lt!428653 lt!428647 (zeroValue!5647 thiss!1141) lt!428659) lt!428742)))

(declare-fun bs!26718 () Bool)

(assert (= bs!26718 d!115261))

(assert (=> bs!26718 m!883337))

(assert (=> bs!26718 m!883337))

(assert (=> bs!26718 m!883339))

(declare-fun m!883539 () Bool)

(assert (=> bs!26718 m!883539))

(declare-fun m!883541 () Bool)

(assert (=> bs!26718 m!883541))

(assert (=> b!951694 d!115261))

(assert (=> b!951694 d!115215))

(declare-fun d!115263 () Bool)

(assert (=> d!115263 (= (apply!877 (+!2887 lt!428648 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141))) lt!428662) (get!14548 (getValueByKey!506 (toList!6169 (+!2887 lt!428648 (tuple2!13621 lt!428657 (minValue!5647 thiss!1141)))) lt!428662)))))

(declare-fun bs!26719 () Bool)

(assert (= bs!26719 d!115263))

(declare-fun m!883543 () Bool)

(assert (=> bs!26719 m!883543))

(assert (=> bs!26719 m!883543))

(declare-fun m!883545 () Bool)

(assert (=> bs!26719 m!883545))

(assert (=> b!951694 d!115263))

(declare-fun d!115265 () Bool)

(assert (=> d!115265 (= (apply!877 (+!2887 lt!428656 (tuple2!13621 lt!428660 (minValue!5647 thiss!1141))) lt!428661) (apply!877 lt!428656 lt!428661))))

(declare-fun lt!428743 () Unit!31901)

(assert (=> d!115265 (= lt!428743 (choose!1603 lt!428656 lt!428660 (minValue!5647 thiss!1141) lt!428661))))

(declare-fun e!536025 () Bool)

(assert (=> d!115265 e!536025))

(declare-fun res!637800 () Bool)

(assert (=> d!115265 (=> (not res!637800) (not e!536025))))

(assert (=> d!115265 (= res!637800 (contains!5205 lt!428656 lt!428661))))

(assert (=> d!115265 (= (addApplyDifferent!456 lt!428656 lt!428660 (minValue!5647 thiss!1141) lt!428661) lt!428743)))

(declare-fun b!951858 () Bool)

(assert (=> b!951858 (= e!536025 (not (= lt!428661 lt!428660)))))

(assert (= (and d!115265 res!637800) b!951858))

(assert (=> d!115265 m!883345))

(declare-fun m!883547 () Bool)

(assert (=> d!115265 m!883547))

(declare-fun m!883549 () Bool)

(assert (=> d!115265 m!883549))

(assert (=> d!115265 m!883321))

(assert (=> d!115265 m!883335))

(assert (=> d!115265 m!883321))

(assert (=> b!951694 d!115265))

(declare-fun d!115267 () Bool)

(declare-fun e!536026 () Bool)

(assert (=> d!115267 e!536026))

(declare-fun res!637801 () Bool)

(assert (=> d!115267 (=> res!637801 e!536026)))

(declare-fun lt!428744 () Bool)

(assert (=> d!115267 (= res!637801 (not lt!428744))))

(declare-fun lt!428747 () Bool)

(assert (=> d!115267 (= lt!428744 lt!428747)))

(declare-fun lt!428746 () Unit!31901)

(declare-fun e!536027 () Unit!31901)

(assert (=> d!115267 (= lt!428746 e!536027)))

(declare-fun c!99514 () Bool)

(assert (=> d!115267 (= c!99514 lt!428747)))

(assert (=> d!115267 (= lt!428747 (containsKey!470 (toList!6169 lt!428644) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115267 (= (contains!5205 lt!428644 #b1000000000000000000000000000000000000000000000000000000000000000) lt!428744)))

(declare-fun b!951859 () Bool)

(declare-fun lt!428745 () Unit!31901)

(assert (=> b!951859 (= e!536027 lt!428745)))

(assert (=> b!951859 (= lt!428745 (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6169 lt!428644) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951859 (isDefined!378 (getValueByKey!506 (toList!6169 lt!428644) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951860 () Bool)

(declare-fun Unit!31908 () Unit!31901)

(assert (=> b!951860 (= e!536027 Unit!31908)))

(declare-fun b!951861 () Bool)

(assert (=> b!951861 (= e!536026 (isDefined!378 (getValueByKey!506 (toList!6169 lt!428644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115267 c!99514) b!951859))

(assert (= (and d!115267 (not c!99514)) b!951860))

(assert (= (and d!115267 (not res!637801)) b!951861))

(declare-fun m!883551 () Bool)

(assert (=> d!115267 m!883551))

(declare-fun m!883553 () Bool)

(assert (=> b!951859 m!883553))

(declare-fun m!883555 () Bool)

(assert (=> b!951859 m!883555))

(assert (=> b!951859 m!883555))

(declare-fun m!883557 () Bool)

(assert (=> b!951859 m!883557))

(assert (=> b!951861 m!883555))

(assert (=> b!951861 m!883555))

(assert (=> b!951861 m!883557))

(assert (=> bm!41507 d!115267))

(declare-fun b!951872 () Bool)

(declare-fun e!536037 () Bool)

(declare-fun e!536038 () Bool)

(assert (=> b!951872 (= e!536037 e!536038)))

(declare-fun c!99517 () Bool)

(assert (=> b!951872 (= c!99517 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951873 () Bool)

(declare-fun call!41522 () Bool)

(assert (=> b!951873 (= e!536038 call!41522)))

(declare-fun b!951874 () Bool)

(declare-fun e!536036 () Bool)

(declare-fun contains!5207 (List!19362 (_ BitVec 64)) Bool)

(assert (=> b!951874 (= e!536036 (contains!5207 Nil!19359 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115269 () Bool)

(declare-fun res!637809 () Bool)

(declare-fun e!536039 () Bool)

(assert (=> d!115269 (=> res!637809 e!536039)))

(assert (=> d!115269 (= res!637809 (bvsge #b00000000000000000000000000000000 (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115269 (= (arrayNoDuplicates!0 (_keys!10753 thiss!1141) #b00000000000000000000000000000000 Nil!19359) e!536039)))

(declare-fun bm!41519 () Bool)

(assert (=> bm!41519 (= call!41522 (arrayNoDuplicates!0 (_keys!10753 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99517 (Cons!19358 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) Nil!19359) Nil!19359)))))

(declare-fun b!951875 () Bool)

(assert (=> b!951875 (= e!536039 e!536037)))

(declare-fun res!637808 () Bool)

(assert (=> b!951875 (=> (not res!637808) (not e!536037))))

(assert (=> b!951875 (= res!637808 (not e!536036))))

(declare-fun res!637810 () Bool)

(assert (=> b!951875 (=> (not res!637810) (not e!536036))))

(assert (=> b!951875 (= res!637810 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951876 () Bool)

(assert (=> b!951876 (= e!536038 call!41522)))

(assert (= (and d!115269 (not res!637809)) b!951875))

(assert (= (and b!951875 res!637810) b!951874))

(assert (= (and b!951875 res!637808) b!951872))

(assert (= (and b!951872 c!99517) b!951873))

(assert (= (and b!951872 (not c!99517)) b!951876))

(assert (= (or b!951873 b!951876) bm!41519))

(assert (=> b!951872 m!883297))

(assert (=> b!951872 m!883297))

(assert (=> b!951872 m!883359))

(assert (=> b!951874 m!883297))

(assert (=> b!951874 m!883297))

(declare-fun m!883559 () Bool)

(assert (=> b!951874 m!883559))

(assert (=> bm!41519 m!883297))

(declare-fun m!883561 () Bool)

(assert (=> bm!41519 m!883561))

(assert (=> b!951875 m!883297))

(assert (=> b!951875 m!883297))

(assert (=> b!951875 m!883359))

(assert (=> b!951712 d!115269))

(declare-fun d!115271 () Bool)

(declare-fun e!536040 () Bool)

(assert (=> d!115271 e!536040))

(declare-fun res!637812 () Bool)

(assert (=> d!115271 (=> (not res!637812) (not e!536040))))

(declare-fun lt!428749 () ListLongMap!12307)

(assert (=> d!115271 (= res!637812 (contains!5205 lt!428749 (_1!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(declare-fun lt!428751 () List!19361)

(assert (=> d!115271 (= lt!428749 (ListLongMap!12308 lt!428751))))

(declare-fun lt!428748 () Unit!31901)

(declare-fun lt!428750 () Unit!31901)

(assert (=> d!115271 (= lt!428748 lt!428750)))

(assert (=> d!115271 (= (getValueByKey!506 lt!428751 (_1!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))) (Some!511 (_2!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(assert (=> d!115271 (= lt!428750 (lemmaContainsTupThenGetReturnValue!268 lt!428751 (_1!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (_2!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(assert (=> d!115271 (= lt!428751 (insertStrictlySorted!325 (toList!6169 (ite c!99469 call!41506 (ite c!99472 call!41511 call!41510))) (_1!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (_2!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(assert (=> d!115271 (= (+!2887 (ite c!99469 call!41506 (ite c!99472 call!41511 call!41510)) (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) lt!428749)))

(declare-fun b!951877 () Bool)

(declare-fun res!637811 () Bool)

(assert (=> b!951877 (=> (not res!637811) (not e!536040))))

(assert (=> b!951877 (= res!637811 (= (getValueByKey!506 (toList!6169 lt!428749) (_1!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))) (Some!511 (_2!6821 (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))))

(declare-fun b!951878 () Bool)

(assert (=> b!951878 (= e!536040 (contains!5206 (toList!6169 lt!428749) (ite (or c!99469 c!99472) (tuple2!13621 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5647 thiss!1141)) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (= (and d!115271 res!637812) b!951877))

(assert (= (and b!951877 res!637811) b!951878))

(declare-fun m!883563 () Bool)

(assert (=> d!115271 m!883563))

(declare-fun m!883565 () Bool)

(assert (=> d!115271 m!883565))

(declare-fun m!883567 () Bool)

(assert (=> d!115271 m!883567))

(declare-fun m!883569 () Bool)

(assert (=> d!115271 m!883569))

(declare-fun m!883571 () Bool)

(assert (=> b!951877 m!883571))

(declare-fun m!883573 () Bool)

(assert (=> b!951878 m!883573))

(assert (=> bm!41509 d!115271))

(declare-fun b!951897 () Bool)

(declare-fun e!536052 () SeekEntryResult!9151)

(assert (=> b!951897 (= e!536052 (Intermediate!9151 false (toIndex!0 key!756 (mask!27635 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!951898 () Bool)

(declare-fun e!536053 () SeekEntryResult!9151)

(assert (=> b!951898 (= e!536053 e!536052)))

(declare-fun c!99524 () Bool)

(declare-fun lt!428756 () (_ BitVec 64))

(assert (=> b!951898 (= c!99524 (or (= lt!428756 key!756) (= (bvadd lt!428756 lt!428756) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!951899 () Bool)

(declare-fun e!536055 () Bool)

(declare-fun lt!428757 () SeekEntryResult!9151)

(assert (=> b!951899 (= e!536055 (bvsge (x!81880 lt!428757) #b01111111111111111111111111111110))))

(declare-fun d!115273 () Bool)

(assert (=> d!115273 e!536055))

(declare-fun c!99526 () Bool)

(assert (=> d!115273 (= c!99526 (and ((_ is Intermediate!9151) lt!428757) (undefined!9963 lt!428757)))))

(assert (=> d!115273 (= lt!428757 e!536053)))

(declare-fun c!99525 () Bool)

(assert (=> d!115273 (= c!99525 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!115273 (= lt!428756 (select (arr!27678 (_keys!10753 thiss!1141)) (toIndex!0 key!756 (mask!27635 thiss!1141))))))

(assert (=> d!115273 (validMask!0 (mask!27635 thiss!1141))))

(assert (=> d!115273 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27635 thiss!1141)) key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) lt!428757)))

(declare-fun b!951900 () Bool)

(assert (=> b!951900 (= e!536053 (Intermediate!9151 true (toIndex!0 key!756 (mask!27635 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!951901 () Bool)

(assert (=> b!951901 (= e!536052 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27635 thiss!1141)) #b00000000000000000000000000000000 (mask!27635 thiss!1141)) key!756 (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(declare-fun b!951902 () Bool)

(assert (=> b!951902 (and (bvsge (index!38977 lt!428757) #b00000000000000000000000000000000) (bvslt (index!38977 lt!428757) (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun res!637820 () Bool)

(assert (=> b!951902 (= res!637820 (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38977 lt!428757)) key!756))))

(declare-fun e!536054 () Bool)

(assert (=> b!951902 (=> res!637820 e!536054)))

(declare-fun e!536051 () Bool)

(assert (=> b!951902 (= e!536051 e!536054)))

(declare-fun b!951903 () Bool)

(assert (=> b!951903 (and (bvsge (index!38977 lt!428757) #b00000000000000000000000000000000) (bvslt (index!38977 lt!428757) (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> b!951903 (= e!536054 (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38977 lt!428757)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951904 () Bool)

(assert (=> b!951904 (= e!536055 e!536051)))

(declare-fun res!637819 () Bool)

(assert (=> b!951904 (= res!637819 (and ((_ is Intermediate!9151) lt!428757) (not (undefined!9963 lt!428757)) (bvslt (x!81880 lt!428757) #b01111111111111111111111111111110) (bvsge (x!81880 lt!428757) #b00000000000000000000000000000000) (bvsge (x!81880 lt!428757) #b00000000000000000000000000000000)))))

(assert (=> b!951904 (=> (not res!637819) (not e!536051))))

(declare-fun b!951905 () Bool)

(assert (=> b!951905 (and (bvsge (index!38977 lt!428757) #b00000000000000000000000000000000) (bvslt (index!38977 lt!428757) (size!28158 (_keys!10753 thiss!1141))))))

(declare-fun res!637821 () Bool)

(assert (=> b!951905 (= res!637821 (= (select (arr!27678 (_keys!10753 thiss!1141)) (index!38977 lt!428757)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951905 (=> res!637821 e!536054)))

(assert (= (and d!115273 c!99525) b!951900))

(assert (= (and d!115273 (not c!99525)) b!951898))

(assert (= (and b!951898 c!99524) b!951897))

(assert (= (and b!951898 (not c!99524)) b!951901))

(assert (= (and d!115273 c!99526) b!951899))

(assert (= (and d!115273 (not c!99526)) b!951904))

(assert (= (and b!951904 res!637819) b!951902))

(assert (= (and b!951902 (not res!637820)) b!951905))

(assert (= (and b!951905 (not res!637821)) b!951903))

(assert (=> b!951901 m!883277))

(declare-fun m!883575 () Bool)

(assert (=> b!951901 m!883575))

(assert (=> b!951901 m!883575))

(declare-fun m!883577 () Bool)

(assert (=> b!951901 m!883577))

(assert (=> d!115273 m!883277))

(declare-fun m!883579 () Bool)

(assert (=> d!115273 m!883579))

(assert (=> d!115273 m!883209))

(declare-fun m!883581 () Bool)

(assert (=> b!951905 m!883581))

(assert (=> b!951902 m!883581))

(assert (=> b!951903 m!883581))

(assert (=> d!115187 d!115273))

(declare-fun d!115275 () Bool)

(declare-fun lt!428763 () (_ BitVec 32))

(declare-fun lt!428762 () (_ BitVec 32))

(assert (=> d!115275 (= lt!428763 (bvmul (bvxor lt!428762 (bvlshr lt!428762 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115275 (= lt!428762 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115275 (and (bvsge (mask!27635 thiss!1141) #b00000000000000000000000000000000) (let ((res!637822 (let ((h!20520 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81898 (bvmul (bvxor h!20520 (bvlshr h!20520 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81898 (bvlshr x!81898 #b00000000000000000000000000001101)) (mask!27635 thiss!1141)))))) (and (bvslt res!637822 (bvadd (mask!27635 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!637822 #b00000000000000000000000000000000))))))

(assert (=> d!115275 (= (toIndex!0 key!756 (mask!27635 thiss!1141)) (bvand (bvxor lt!428763 (bvlshr lt!428763 #b00000000000000000000000000001101)) (mask!27635 thiss!1141)))))

(assert (=> d!115187 d!115275))

(assert (=> d!115187 d!115201))

(declare-fun d!115277 () Bool)

(assert (=> d!115277 (= (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951685 d!115277))

(declare-fun d!115279 () Bool)

(declare-fun e!536058 () Bool)

(assert (=> d!115279 e!536058))

(declare-fun c!99529 () Bool)

(assert (=> d!115279 (= c!99529 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!115279 true))

(declare-fun _$15!107 () Unit!31901)

(assert (=> d!115279 (= (choose!1602 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) key!756 (defaultEntry!5811 thiss!1141)) _$15!107)))

(declare-fun b!951910 () Bool)

(assert (=> b!951910 (= e!536058 (arrayContainsKey!0 (_keys!10753 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951911 () Bool)

(assert (=> b!951911 (= e!536058 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5543 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115279 c!99529) b!951910))

(assert (= (and d!115279 (not c!99529)) b!951911))

(assert (=> b!951910 m!883213))

(assert (=> d!115197 d!115279))

(assert (=> d!115197 d!115201))

(declare-fun d!115281 () Bool)

(assert (=> d!115281 (isDefined!378 (getValueByKey!506 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-fun lt!428766 () Unit!31901)

(declare-fun choose!1605 (List!19361 (_ BitVec 64)) Unit!31901)

(assert (=> d!115281 (= lt!428766 (choose!1605 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(declare-fun e!536061 () Bool)

(assert (=> d!115281 e!536061))

(declare-fun res!637825 () Bool)

(assert (=> d!115281 (=> (not res!637825) (not e!536061))))

(declare-fun isStrictlySorted!509 (List!19361) Bool)

(assert (=> d!115281 (= res!637825 (isStrictlySorted!509 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))))

(assert (=> d!115281 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756) lt!428766)))

(declare-fun b!951914 () Bool)

(assert (=> b!951914 (= e!536061 (containsKey!470 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))

(assert (= (and d!115281 res!637825) b!951914))

(assert (=> d!115281 m!883313))

(assert (=> d!115281 m!883313))

(assert (=> d!115281 m!883315))

(declare-fun m!883583 () Bool)

(assert (=> d!115281 m!883583))

(declare-fun m!883585 () Bool)

(assert (=> d!115281 m!883585))

(assert (=> b!951914 m!883309))

(assert (=> b!951636 d!115281))

(declare-fun d!115283 () Bool)

(declare-fun isEmpty!720 (Option!512) Bool)

(assert (=> d!115283 (= (isDefined!378 (getValueByKey!506 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756)) (not (isEmpty!720 (getValueByKey!506 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756))))))

(declare-fun bs!26720 () Bool)

(assert (= bs!26720 d!115283))

(assert (=> bs!26720 m!883313))

(declare-fun m!883587 () Bool)

(assert (=> bs!26720 m!883587))

(assert (=> b!951636 d!115283))

(declare-fun b!951923 () Bool)

(declare-fun e!536066 () Option!512)

(assert (=> b!951923 (= e!536066 (Some!511 (_2!6821 (h!20518 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))))))))

(declare-fun d!115285 () Bool)

(declare-fun c!99534 () Bool)

(assert (=> d!115285 (= c!99534 (and ((_ is Cons!19357) (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (= (_1!6821 (h!20518 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756)))))

(assert (=> d!115285 (= (getValueByKey!506 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))) key!756) e!536066)))

(declare-fun b!951926 () Bool)

(declare-fun e!536067 () Option!512)

(assert (=> b!951926 (= e!536067 None!510)))

(declare-fun b!951924 () Bool)

(assert (=> b!951924 (= e!536066 e!536067)))

(declare-fun c!99535 () Bool)

(assert (=> b!951924 (= c!99535 (and ((_ is Cons!19357) (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) (not (= (_1!6821 (h!20518 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141))))) key!756))))))

(declare-fun b!951925 () Bool)

(assert (=> b!951925 (= e!536067 (getValueByKey!506 (t!27703 (toList!6169 (getCurrentListMap!3331 (_keys!10753 thiss!1141) (_values!5834 thiss!1141) (mask!27635 thiss!1141) (extraKeys!5543 thiss!1141) (zeroValue!5647 thiss!1141) (minValue!5647 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5811 thiss!1141)))) key!756))))

(assert (= (and d!115285 c!99534) b!951923))

(assert (= (and d!115285 (not c!99534)) b!951924))

(assert (= (and b!951924 c!99535) b!951925))

(assert (= (and b!951924 (not c!99535)) b!951926))

(declare-fun m!883589 () Bool)

(assert (=> b!951925 m!883589))

(assert (=> b!951636 d!115285))

(declare-fun b!951928 () Bool)

(declare-fun e!536068 () Bool)

(declare-fun e!536070 () Bool)

(assert (=> b!951928 (= e!536068 e!536070)))

(declare-fun lt!428769 () (_ BitVec 64))

(assert (=> b!951928 (= lt!428769 (select (arr!27678 (_keys!10753 thiss!1141)) (bvadd lt!428534 #b00000000000000000000000000000001)))))

(declare-fun lt!428768 () Unit!31901)

(assert (=> b!951928 (= lt!428768 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10753 thiss!1141) lt!428769 (bvadd lt!428534 #b00000000000000000000000000000001)))))

(assert (=> b!951928 (arrayContainsKey!0 (_keys!10753 thiss!1141) lt!428769 #b00000000000000000000000000000000)))

(declare-fun lt!428767 () Unit!31901)

(assert (=> b!951928 (= lt!428767 lt!428768)))

(declare-fun res!637827 () Bool)

(assert (=> b!951928 (= res!637827 (= (seekEntryOrOpen!0 (select (arr!27678 (_keys!10753 thiss!1141)) (bvadd lt!428534 #b00000000000000000000000000000001)) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) (Found!9151 (bvadd lt!428534 #b00000000000000000000000000000001))))))

(assert (=> b!951928 (=> (not res!637827) (not e!536070))))

(declare-fun b!951929 () Bool)

(declare-fun call!41523 () Bool)

(assert (=> b!951929 (= e!536068 call!41523)))

(declare-fun bm!41520 () Bool)

(assert (=> bm!41520 (= call!41523 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428534 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)))))

(declare-fun b!951930 () Bool)

(declare-fun e!536069 () Bool)

(assert (=> b!951930 (= e!536069 e!536068)))

(declare-fun c!99536 () Bool)

(assert (=> b!951930 (= c!99536 (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) (bvadd lt!428534 #b00000000000000000000000000000001))))))

(declare-fun d!115287 () Bool)

(declare-fun res!637826 () Bool)

(assert (=> d!115287 (=> res!637826 e!536069)))

(assert (=> d!115287 (= res!637826 (bvsge (bvadd lt!428534 #b00000000000000000000000000000001) (size!28158 (_keys!10753 thiss!1141))))))

(assert (=> d!115287 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!428534 #b00000000000000000000000000000001) (_keys!10753 thiss!1141) (mask!27635 thiss!1141)) e!536069)))

(declare-fun b!951927 () Bool)

(assert (=> b!951927 (= e!536070 call!41523)))

(assert (= (and d!115287 (not res!637826)) b!951930))

(assert (= (and b!951930 c!99536) b!951928))

(assert (= (and b!951930 (not c!99536)) b!951929))

(assert (= (and b!951928 res!637827) b!951927))

(assert (= (or b!951927 b!951929) bm!41520))

(declare-fun m!883591 () Bool)

(assert (=> b!951928 m!883591))

(declare-fun m!883593 () Bool)

(assert (=> b!951928 m!883593))

(declare-fun m!883595 () Bool)

(assert (=> b!951928 m!883595))

(assert (=> b!951928 m!883591))

(declare-fun m!883597 () Bool)

(assert (=> b!951928 m!883597))

(declare-fun m!883599 () Bool)

(assert (=> bm!41520 m!883599))

(assert (=> b!951930 m!883591))

(assert (=> b!951930 m!883591))

(declare-fun m!883601 () Bool)

(assert (=> b!951930 m!883601))

(assert (=> bm!41488 d!115287))

(declare-fun d!115289 () Bool)

(assert (=> d!115289 (= (apply!877 lt!428644 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14548 (getValueByKey!506 (toList!6169 lt!428644) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26721 () Bool)

(assert (= bs!26721 d!115289))

(declare-fun m!883603 () Bool)

(assert (=> bs!26721 m!883603))

(assert (=> bs!26721 m!883603))

(declare-fun m!883605 () Bool)

(assert (=> bs!26721 m!883605))

(assert (=> b!951683 d!115289))

(declare-fun d!115291 () Bool)

(declare-fun e!536071 () Bool)

(assert (=> d!115291 e!536071))

(declare-fun res!637828 () Bool)

(assert (=> d!115291 (=> res!637828 e!536071)))

(declare-fun lt!428770 () Bool)

(assert (=> d!115291 (= res!637828 (not lt!428770))))

(declare-fun lt!428773 () Bool)

(assert (=> d!115291 (= lt!428770 lt!428773)))

(declare-fun lt!428772 () Unit!31901)

(declare-fun e!536072 () Unit!31901)

(assert (=> d!115291 (= lt!428772 e!536072)))

(declare-fun c!99537 () Bool)

(assert (=> d!115291 (= c!99537 lt!428773)))

(assert (=> d!115291 (= lt!428773 (containsKey!470 (toList!6169 lt!428644) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115291 (= (contains!5205 lt!428644 #b0000000000000000000000000000000000000000000000000000000000000000) lt!428770)))

(declare-fun b!951931 () Bool)

(declare-fun lt!428771 () Unit!31901)

(assert (=> b!951931 (= e!536072 lt!428771)))

(assert (=> b!951931 (= lt!428771 (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6169 lt!428644) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951931 (isDefined!378 (getValueByKey!506 (toList!6169 lt!428644) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951932 () Bool)

(declare-fun Unit!31909 () Unit!31901)

(assert (=> b!951932 (= e!536072 Unit!31909)))

(declare-fun b!951933 () Bool)

(assert (=> b!951933 (= e!536071 (isDefined!378 (getValueByKey!506 (toList!6169 lt!428644) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115291 c!99537) b!951931))

(assert (= (and d!115291 (not c!99537)) b!951932))

(assert (= (and d!115291 (not res!637828)) b!951933))

(declare-fun m!883607 () Bool)

(assert (=> d!115291 m!883607))

(declare-fun m!883609 () Bool)

(assert (=> b!951931 m!883609))

(assert (=> b!951931 m!883603))

(assert (=> b!951931 m!883603))

(declare-fun m!883611 () Bool)

(assert (=> b!951931 m!883611))

(assert (=> b!951933 m!883603))

(assert (=> b!951933 m!883603))

(assert (=> b!951933 m!883611))

(assert (=> bm!41508 d!115291))

(declare-fun d!115293 () Bool)

(assert (=> d!115293 (= (validKeyInArray!0 (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534)) (and (not (= (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27678 (_keys!10753 thiss!1141)) lt!428534) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951611 d!115293))

(declare-fun d!115295 () Bool)

(declare-fun e!536073 () Bool)

(assert (=> d!115295 e!536073))

(declare-fun res!637830 () Bool)

(assert (=> d!115295 (=> (not res!637830) (not e!536073))))

(declare-fun lt!428775 () ListLongMap!12307)

(assert (=> d!115295 (= res!637830 (contains!5205 lt!428775 (_1!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(declare-fun lt!428777 () List!19361)

(assert (=> d!115295 (= lt!428775 (ListLongMap!12308 lt!428777))))

(declare-fun lt!428774 () Unit!31901)

(declare-fun lt!428776 () Unit!31901)

(assert (=> d!115295 (= lt!428774 lt!428776)))

(assert (=> d!115295 (= (getValueByKey!506 lt!428777 (_1!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (=> d!115295 (= lt!428776 (lemmaContainsTupThenGetReturnValue!268 lt!428777 (_1!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (=> d!115295 (= lt!428777 (insertStrictlySorted!325 (toList!6169 call!41509) (_1!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))) (_2!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))))))

(assert (=> d!115295 (= (+!2887 call!41509 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))) lt!428775)))

(declare-fun b!951934 () Bool)

(declare-fun res!637829 () Bool)

(assert (=> b!951934 (=> (not res!637829) (not e!536073))))

(assert (=> b!951934 (= res!637829 (= (getValueByKey!506 (toList!6169 lt!428775) (_1!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141)))) (Some!511 (_2!6821 (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))))

(declare-fun b!951935 () Bool)

(assert (=> b!951935 (= e!536073 (contains!5206 (toList!6169 lt!428775) (tuple2!13621 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5647 thiss!1141))))))

(assert (= (and d!115295 res!637830) b!951934))

(assert (= (and b!951934 res!637829) b!951935))

(declare-fun m!883613 () Bool)

(assert (=> d!115295 m!883613))

(declare-fun m!883615 () Bool)

(assert (=> d!115295 m!883615))

(declare-fun m!883617 () Bool)

(assert (=> d!115295 m!883617))

(declare-fun m!883619 () Bool)

(assert (=> d!115295 m!883619))

(declare-fun m!883621 () Bool)

(assert (=> b!951934 m!883621))

(declare-fun m!883623 () Bool)

(assert (=> b!951935 m!883623))

(assert (=> b!951684 d!115295))

(declare-fun d!115297 () Bool)

(assert (=> d!115297 (= (apply!877 lt!428644 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14548 (getValueByKey!506 (toList!6169 lt!428644) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26722 () Bool)

(assert (= bs!26722 d!115297))

(assert (=> bs!26722 m!883555))

(assert (=> bs!26722 m!883555))

(declare-fun m!883625 () Bool)

(assert (=> bs!26722 m!883625))

(assert (=> b!951690 d!115297))

(assert (=> b!951689 d!115277))

(declare-fun d!115299 () Bool)

(declare-fun e!536074 () Bool)

(assert (=> d!115299 e!536074))

(declare-fun res!637831 () Bool)

(assert (=> d!115299 (=> res!637831 e!536074)))

(declare-fun lt!428778 () Bool)

(assert (=> d!115299 (= res!637831 (not lt!428778))))

(declare-fun lt!428781 () Bool)

(assert (=> d!115299 (= lt!428778 lt!428781)))

(declare-fun lt!428780 () Unit!31901)

(declare-fun e!536075 () Unit!31901)

(assert (=> d!115299 (= lt!428780 e!536075)))

(declare-fun c!99538 () Bool)

(assert (=> d!115299 (= c!99538 lt!428781)))

(assert (=> d!115299 (= lt!428781 (containsKey!470 (toList!6169 lt!428644) (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115299 (= (contains!5205 lt!428644 (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)) lt!428778)))

(declare-fun b!951936 () Bool)

(declare-fun lt!428779 () Unit!31901)

(assert (=> b!951936 (= e!536075 lt!428779)))

(assert (=> b!951936 (= lt!428779 (lemmaContainsKeyImpliesGetValueByKeyDefined!365 (toList!6169 lt!428644) (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951936 (isDefined!378 (getValueByKey!506 (toList!6169 lt!428644) (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951937 () Bool)

(declare-fun Unit!31910 () Unit!31901)

(assert (=> b!951937 (= e!536075 Unit!31910)))

(declare-fun b!951938 () Bool)

(assert (=> b!951938 (= e!536074 (isDefined!378 (getValueByKey!506 (toList!6169 lt!428644) (select (arr!27678 (_keys!10753 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115299 c!99538) b!951936))

(assert (= (and d!115299 (not c!99538)) b!951937))

(assert (= (and d!115299 (not res!637831)) b!951938))

(assert (=> d!115299 m!883297))

(declare-fun m!883627 () Bool)

(assert (=> d!115299 m!883627))

(assert (=> b!951936 m!883297))

(declare-fun m!883629 () Bool)

(assert (=> b!951936 m!883629))

(assert (=> b!951936 m!883297))

(assert (=> b!951936 m!883435))

(assert (=> b!951936 m!883435))

(declare-fun m!883631 () Bool)

(assert (=> b!951936 m!883631))

(assert (=> b!951938 m!883297))

(assert (=> b!951938 m!883435))

(assert (=> b!951938 m!883435))

(assert (=> b!951938 m!883631))

(assert (=> b!951691 d!115299))

(declare-fun d!115301 () Bool)

(declare-fun lt!428782 () (_ BitVec 32))

(assert (=> d!115301 (and (or (bvslt lt!428782 #b00000000000000000000000000000000) (bvsge lt!428782 (size!28158 (_keys!10753 thiss!1141))) (and (bvsge lt!428782 #b00000000000000000000000000000000) (bvslt lt!428782 (size!28158 (_keys!10753 thiss!1141))))) (bvsge lt!428782 #b00000000000000000000000000000000) (bvslt lt!428782 (size!28158 (_keys!10753 thiss!1141))) (= (select (arr!27678 (_keys!10753 thiss!1141)) lt!428782) key!756))))

(declare-fun e!536076 () (_ BitVec 32))

(assert (=> d!115301 (= lt!428782 e!536076)))

(declare-fun c!99539 () Bool)

(assert (=> d!115301 (= c!99539 (= (select (arr!27678 (_keys!10753 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115301 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28158 (_keys!10753 thiss!1141))) (bvslt (size!28158 (_keys!10753 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115301 (= (arrayScanForKey!0 (_keys!10753 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!428782)))

(declare-fun b!951939 () Bool)

(assert (=> b!951939 (= e!536076 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!951940 () Bool)

(assert (=> b!951940 (= e!536076 (arrayScanForKey!0 (_keys!10753 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115301 c!99539) b!951939))

(assert (= (and d!115301 (not c!99539)) b!951940))

(declare-fun m!883633 () Bool)

(assert (=> d!115301 m!883633))

(assert (=> d!115301 m!883443))

(declare-fun m!883635 () Bool)

(assert (=> b!951940 m!883635))

(assert (=> b!951629 d!115301))

(assert (=> b!951622 d!115195))

(assert (=> b!951638 d!115283))

(assert (=> b!951638 d!115285))

(declare-fun mapIsEmpty!33118 () Bool)

(declare-fun mapRes!33118 () Bool)

(assert (=> mapIsEmpty!33118 mapRes!33118))

(declare-fun mapNonEmpty!33118 () Bool)

(declare-fun tp!63463 () Bool)

(declare-fun e!536077 () Bool)

(assert (=> mapNonEmpty!33118 (= mapRes!33118 (and tp!63463 e!536077))))

(declare-fun mapKey!33118 () (_ BitVec 32))

(declare-fun mapValue!33118 () ValueCell!9911)

(declare-fun mapRest!33118 () (Array (_ BitVec 32) ValueCell!9911))

(assert (=> mapNonEmpty!33118 (= mapRest!33117 (store mapRest!33118 mapKey!33118 mapValue!33118))))

(declare-fun condMapEmpty!33118 () Bool)

(declare-fun mapDefault!33118 () ValueCell!9911)

(assert (=> mapNonEmpty!33117 (= condMapEmpty!33118 (= mapRest!33117 ((as const (Array (_ BitVec 32) ValueCell!9911)) mapDefault!33118)))))

(declare-fun e!536078 () Bool)

(assert (=> mapNonEmpty!33117 (= tp!63462 (and e!536078 mapRes!33118))))

(declare-fun b!951941 () Bool)

(assert (=> b!951941 (= e!536077 tp_is_empty!20785)))

(declare-fun b!951942 () Bool)

(assert (=> b!951942 (= e!536078 tp_is_empty!20785)))

(assert (= (and mapNonEmpty!33117 condMapEmpty!33118) mapIsEmpty!33118))

(assert (= (and mapNonEmpty!33117 (not condMapEmpty!33118)) mapNonEmpty!33118))

(assert (= (and mapNonEmpty!33118 ((_ is ValueCellFull!9911) mapValue!33118)) b!951941))

(assert (= (and mapNonEmpty!33117 ((_ is ValueCellFull!9911) mapDefault!33118)) b!951942))

(declare-fun m!883637 () Bool)

(assert (=> mapNonEmpty!33118 m!883637))

(declare-fun b_lambda!14389 () Bool)

(assert (= b_lambda!14387 (or (and b!951520 b_free!18277) b_lambda!14389)))

(declare-fun b_lambda!14391 () Bool)

(assert (= b_lambda!14385 (or (and b!951520 b_free!18277) b_lambda!14391)))

(check-sat (not d!115229) (not bm!41519) (not b!951845) (not b!951832) (not d!115217) (not b!951848) tp_is_empty!20785 (not b!951940) (not d!115257) (not d!115247) (not d!115249) b_and!29733 (not b!951878) (not d!115223) (not b!951847) (not b!951861) (not bm!41512) (not d!115251) (not b!951834) (not b!951775) (not b!951925) (not b!951855) (not b!951933) (not b!951875) (not d!115291) (not b!951734) (not b!951777) (not b_lambda!14383) (not d!115299) (not d!115241) (not b_lambda!14391) (not b!951846) (not b!951796) (not d!115289) (not b!951938) (not b!951836) (not b_next!18277) (not b!951804) (not b!951872) (not b!951874) (not b!951829) (not d!115273) (not b!951934) (not b!951859) (not d!115253) (not b!951779) (not d!115261) (not b!951780) (not d!115237) (not b!951852) (not b!951850) (not b!951781) (not b!951782) (not b!951853) (not b!951935) (not d!115215) (not d!115221) (not d!115259) (not b!951914) (not b!951854) (not b!951856) (not d!115265) (not d!115267) (not d!115243) (not b!951931) (not b!951928) (not b!951910) (not b!951786) (not b!951750) (not b!951901) (not b!951877) (not b!951797) (not d!115227) (not d!115245) (not b!951783) (not d!115281) (not d!115283) (not b!951830) (not mapNonEmpty!33118) (not b!951806) (not b!951936) (not b_lambda!14389) (not d!115295) (not d!115271) (not d!115255) (not bm!41520) (not d!115297) (not b!951824) (not b!951930) (not bm!41516) (not bm!41515) (not d!115263) (not d!115239) (not d!115211))
(check-sat b_and!29733 (not b_next!18277))
