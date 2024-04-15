; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80796 () Bool)

(assert start!80796)

(declare-fun b!947068 () Bool)

(declare-fun b_free!18169 () Bool)

(declare-fun b_next!18169 () Bool)

(assert (=> b!947068 (= b_free!18169 (not b_next!18169))))

(declare-fun tp!63067 () Bool)

(declare-fun b_and!29565 () Bool)

(assert (=> b!947068 (= tp!63067 b_and!29565)))

(declare-fun e!533017 () Bool)

(declare-fun tp_is_empty!20677 () Bool)

(declare-fun e!533020 () Bool)

(declare-datatypes ((V!32535 0))(
  ( (V!32536 (val!10389 Int)) )
))
(declare-datatypes ((ValueCell!9857 0))(
  ( (ValueCellFull!9857 (v!12922 V!32535)) (EmptyCell!9857) )
))
(declare-datatypes ((array!57315 0))(
  ( (array!57316 (arr!27569 (Array (_ BitVec 32) ValueCell!9857)) (size!28044 (_ BitVec 32))) )
))
(declare-datatypes ((array!57317 0))(
  ( (array!57318 (arr!27570 (Array (_ BitVec 32) (_ BitVec 64))) (size!28045 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4864 0))(
  ( (LongMapFixedSize!4865 (defaultEntry!5729 Int) (mask!27457 (_ BitVec 32)) (extraKeys!5461 (_ BitVec 32)) (zeroValue!5565 V!32535) (minValue!5565 V!32535) (_size!2487 (_ BitVec 32)) (_keys!10633 array!57317) (_values!5752 array!57315) (_vacant!2487 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4864)

(declare-fun array_inv!21462 (array!57317) Bool)

(declare-fun array_inv!21463 (array!57315) Bool)

(assert (=> b!947068 (= e!533017 (and tp!63067 tp_is_empty!20677 (array_inv!21462 (_keys!10633 thiss!1141)) (array_inv!21463 (_values!5752 thiss!1141)) e!533020))))

(declare-fun b!947069 () Bool)

(declare-fun e!533018 () Bool)

(declare-fun e!533019 () Bool)

(assert (=> b!947069 (= e!533018 e!533019)))

(declare-fun res!635665 () Bool)

(assert (=> b!947069 (=> (not res!635665) (not e!533019))))

(declare-datatypes ((SeekEntryResult!9112 0))(
  ( (MissingZero!9112 (index!38819 (_ BitVec 32))) (Found!9112 (index!38820 (_ BitVec 32))) (Intermediate!9112 (undefined!9924 Bool) (index!38821 (_ BitVec 32)) (x!81491 (_ BitVec 32))) (Undefined!9112) (MissingVacant!9112 (index!38822 (_ BitVec 32))) )
))
(declare-fun lt!426309 () SeekEntryResult!9112)

(get-info :version)

(assert (=> b!947069 (= res!635665 ((_ is Found!9112) lt!426309))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57317 (_ BitVec 32)) SeekEntryResult!9112)

(assert (=> b!947069 (= lt!426309 (seekEntry!0 key!756 (_keys!10633 thiss!1141) (mask!27457 thiss!1141)))))

(declare-fun b!947070 () Bool)

(declare-fun res!635663 () Bool)

(declare-fun e!533013 () Bool)

(assert (=> b!947070 (=> res!635663 e!533013)))

(declare-datatypes ((List!19308 0))(
  ( (Nil!19305) (Cons!19304 (h!20460 (_ BitVec 64)) (t!27620 List!19308)) )
))
(declare-fun arrayNoDuplicates!0 (array!57317 (_ BitVec 32) List!19308) Bool)

(assert (=> b!947070 (= res!635663 (not (arrayNoDuplicates!0 (_keys!10633 thiss!1141) #b00000000000000000000000000000000 Nil!19305)))))

(declare-fun mapNonEmpty!32890 () Bool)

(declare-fun mapRes!32890 () Bool)

(declare-fun tp!63066 () Bool)

(declare-fun e!533014 () Bool)

(assert (=> mapNonEmpty!32890 (= mapRes!32890 (and tp!63066 e!533014))))

(declare-fun mapRest!32890 () (Array (_ BitVec 32) ValueCell!9857))

(declare-fun mapValue!32890 () ValueCell!9857)

(declare-fun mapKey!32890 () (_ BitVec 32))

(assert (=> mapNonEmpty!32890 (= (arr!27569 (_values!5752 thiss!1141)) (store mapRest!32890 mapKey!32890 mapValue!32890))))

(declare-fun b!947071 () Bool)

(declare-fun e!533016 () Bool)

(assert (=> b!947071 (= e!533020 (and e!533016 mapRes!32890))))

(declare-fun condMapEmpty!32890 () Bool)

(declare-fun mapDefault!32890 () ValueCell!9857)

(assert (=> b!947071 (= condMapEmpty!32890 (= (arr!27569 (_values!5752 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9857)) mapDefault!32890)))))

(declare-fun b!947072 () Bool)

(assert (=> b!947072 (= e!533019 (not e!533013))))

(declare-fun res!635666 () Bool)

(assert (=> b!947072 (=> res!635666 e!533013)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947072 (= res!635666 (not (validMask!0 (mask!27457 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!57317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947072 (arrayContainsKey!0 (_keys!10633 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31806 0))(
  ( (Unit!31807) )
))
(declare-fun lt!426310 () Unit!31806)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57317 (_ BitVec 64) (_ BitVec 32)) Unit!31806)

(assert (=> b!947072 (= lt!426310 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10633 thiss!1141) key!756 (index!38820 lt!426309)))))

(declare-fun mapIsEmpty!32890 () Bool)

(assert (=> mapIsEmpty!32890 mapRes!32890))

(declare-fun b!947073 () Bool)

(assert (=> b!947073 (= e!533013 (and (bvsge (index!38820 lt!426309) #b00000000000000000000000000000000) (bvslt (index!38820 lt!426309) (size!28045 (_keys!10633 thiss!1141)))))))

(declare-fun b!947074 () Bool)

(assert (=> b!947074 (= e!533016 tp_is_empty!20677)))

(declare-fun b!947075 () Bool)

(assert (=> b!947075 (= e!533014 tp_is_empty!20677)))

(declare-fun b!947067 () Bool)

(declare-fun res!635661 () Bool)

(assert (=> b!947067 (=> res!635661 e!533013)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57317 (_ BitVec 32)) Bool)

(assert (=> b!947067 (= res!635661 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10633 thiss!1141) (mask!27457 thiss!1141))))))

(declare-fun res!635662 () Bool)

(assert (=> start!80796 (=> (not res!635662) (not e!533018))))

(declare-fun valid!1857 (LongMapFixedSize!4864) Bool)

(assert (=> start!80796 (= res!635662 (valid!1857 thiss!1141))))

(assert (=> start!80796 e!533018))

(assert (=> start!80796 e!533017))

(assert (=> start!80796 true))

(declare-fun b!947076 () Bool)

(declare-fun res!635660 () Bool)

(assert (=> b!947076 (=> res!635660 e!533013)))

(assert (=> b!947076 (= res!635660 (or (not (= (size!28044 (_values!5752 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27457 thiss!1141)))) (not (= (size!28045 (_keys!10633 thiss!1141)) (size!28044 (_values!5752 thiss!1141)))) (bvslt (mask!27457 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5461 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5461 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947077 () Bool)

(declare-fun res!635664 () Bool)

(assert (=> b!947077 (=> (not res!635664) (not e!533018))))

(assert (=> b!947077 (= res!635664 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80796 res!635662) b!947077))

(assert (= (and b!947077 res!635664) b!947069))

(assert (= (and b!947069 res!635665) b!947072))

(assert (= (and b!947072 (not res!635666)) b!947076))

(assert (= (and b!947076 (not res!635660)) b!947067))

(assert (= (and b!947067 (not res!635661)) b!947070))

(assert (= (and b!947070 (not res!635663)) b!947073))

(assert (= (and b!947071 condMapEmpty!32890) mapIsEmpty!32890))

(assert (= (and b!947071 (not condMapEmpty!32890)) mapNonEmpty!32890))

(assert (= (and mapNonEmpty!32890 ((_ is ValueCellFull!9857) mapValue!32890)) b!947075))

(assert (= (and b!947071 ((_ is ValueCellFull!9857) mapDefault!32890)) b!947074))

(assert (= b!947068 b!947071))

(assert (= start!80796 b!947068))

(declare-fun m!879553 () Bool)

(assert (=> mapNonEmpty!32890 m!879553))

(declare-fun m!879555 () Bool)

(assert (=> b!947068 m!879555))

(declare-fun m!879557 () Bool)

(assert (=> b!947068 m!879557))

(declare-fun m!879559 () Bool)

(assert (=> b!947072 m!879559))

(declare-fun m!879561 () Bool)

(assert (=> b!947072 m!879561))

(declare-fun m!879563 () Bool)

(assert (=> b!947072 m!879563))

(declare-fun m!879565 () Bool)

(assert (=> b!947067 m!879565))

(declare-fun m!879567 () Bool)

(assert (=> b!947070 m!879567))

(declare-fun m!879569 () Bool)

(assert (=> start!80796 m!879569))

(declare-fun m!879571 () Bool)

(assert (=> b!947069 m!879571))

(check-sat (not start!80796) (not b!947068) (not b!947070) tp_is_empty!20677 (not b!947072) (not mapNonEmpty!32890) (not b_next!18169) (not b!947067) b_and!29565 (not b!947069))
(check-sat b_and!29565 (not b_next!18169))
(get-model)

(declare-fun b!947156 () Bool)

(declare-fun e!533076 () SeekEntryResult!9112)

(declare-fun e!533077 () SeekEntryResult!9112)

(assert (=> b!947156 (= e!533076 e!533077)))

(declare-fun lt!426331 () (_ BitVec 64))

(declare-fun lt!426333 () SeekEntryResult!9112)

(assert (=> b!947156 (= lt!426331 (select (arr!27570 (_keys!10633 thiss!1141)) (index!38821 lt!426333)))))

(declare-fun c!98629 () Bool)

(assert (=> b!947156 (= c!98629 (= lt!426331 key!756))))

(declare-fun b!947157 () Bool)

(assert (=> b!947157 (= e!533077 (Found!9112 (index!38821 lt!426333)))))

(declare-fun b!947158 () Bool)

(declare-fun e!533075 () SeekEntryResult!9112)

(assert (=> b!947158 (= e!533075 (MissingZero!9112 (index!38821 lt!426333)))))

(declare-fun b!947159 () Bool)

(assert (=> b!947159 (= e!533076 Undefined!9112)))

(declare-fun b!947160 () Bool)

(declare-fun lt!426334 () SeekEntryResult!9112)

(assert (=> b!947160 (= e!533075 (ite ((_ is MissingVacant!9112) lt!426334) (MissingZero!9112 (index!38822 lt!426334)) lt!426334))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57317 (_ BitVec 32)) SeekEntryResult!9112)

(assert (=> b!947160 (= lt!426334 (seekKeyOrZeroReturnVacant!0 (x!81491 lt!426333) (index!38821 lt!426333) (index!38821 lt!426333) key!756 (_keys!10633 thiss!1141) (mask!27457 thiss!1141)))))

(declare-fun b!947161 () Bool)

(declare-fun c!98631 () Bool)

(assert (=> b!947161 (= c!98631 (= lt!426331 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!947161 (= e!533077 e!533075)))

(declare-fun d!114471 () Bool)

(declare-fun lt!426332 () SeekEntryResult!9112)

(assert (=> d!114471 (and (or ((_ is MissingVacant!9112) lt!426332) (not ((_ is Found!9112) lt!426332)) (and (bvsge (index!38820 lt!426332) #b00000000000000000000000000000000) (bvslt (index!38820 lt!426332) (size!28045 (_keys!10633 thiss!1141))))) (not ((_ is MissingVacant!9112) lt!426332)) (or (not ((_ is Found!9112) lt!426332)) (= (select (arr!27570 (_keys!10633 thiss!1141)) (index!38820 lt!426332)) key!756)))))

(assert (=> d!114471 (= lt!426332 e!533076)))

(declare-fun c!98630 () Bool)

(assert (=> d!114471 (= c!98630 (and ((_ is Intermediate!9112) lt!426333) (undefined!9924 lt!426333)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57317 (_ BitVec 32)) SeekEntryResult!9112)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114471 (= lt!426333 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27457 thiss!1141)) key!756 (_keys!10633 thiss!1141) (mask!27457 thiss!1141)))))

(assert (=> d!114471 (validMask!0 (mask!27457 thiss!1141))))

(assert (=> d!114471 (= (seekEntry!0 key!756 (_keys!10633 thiss!1141) (mask!27457 thiss!1141)) lt!426332)))

(assert (= (and d!114471 c!98630) b!947159))

(assert (= (and d!114471 (not c!98630)) b!947156))

(assert (= (and b!947156 c!98629) b!947157))

(assert (= (and b!947156 (not c!98629)) b!947161))

(assert (= (and b!947161 c!98631) b!947158))

(assert (= (and b!947161 (not c!98631)) b!947160))

(declare-fun m!879613 () Bool)

(assert (=> b!947156 m!879613))

(declare-fun m!879615 () Bool)

(assert (=> b!947160 m!879615))

(declare-fun m!879617 () Bool)

(assert (=> d!114471 m!879617))

(declare-fun m!879619 () Bool)

(assert (=> d!114471 m!879619))

(assert (=> d!114471 m!879619))

(declare-fun m!879621 () Bool)

(assert (=> d!114471 m!879621))

(assert (=> d!114471 m!879559))

(assert (=> b!947069 d!114471))

(declare-fun d!114473 () Bool)

(assert (=> d!114473 (= (array_inv!21462 (_keys!10633 thiss!1141)) (bvsge (size!28045 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947068 d!114473))

(declare-fun d!114475 () Bool)

(assert (=> d!114475 (= (array_inv!21463 (_values!5752 thiss!1141)) (bvsge (size!28044 (_values!5752 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947068 d!114475))

(declare-fun d!114477 () Bool)

(assert (=> d!114477 (= (validMask!0 (mask!27457 thiss!1141)) (and (or (= (mask!27457 thiss!1141) #b00000000000000000000000000000111) (= (mask!27457 thiss!1141) #b00000000000000000000000000001111) (= (mask!27457 thiss!1141) #b00000000000000000000000000011111) (= (mask!27457 thiss!1141) #b00000000000000000000000000111111) (= (mask!27457 thiss!1141) #b00000000000000000000000001111111) (= (mask!27457 thiss!1141) #b00000000000000000000000011111111) (= (mask!27457 thiss!1141) #b00000000000000000000000111111111) (= (mask!27457 thiss!1141) #b00000000000000000000001111111111) (= (mask!27457 thiss!1141) #b00000000000000000000011111111111) (= (mask!27457 thiss!1141) #b00000000000000000000111111111111) (= (mask!27457 thiss!1141) #b00000000000000000001111111111111) (= (mask!27457 thiss!1141) #b00000000000000000011111111111111) (= (mask!27457 thiss!1141) #b00000000000000000111111111111111) (= (mask!27457 thiss!1141) #b00000000000000001111111111111111) (= (mask!27457 thiss!1141) #b00000000000000011111111111111111) (= (mask!27457 thiss!1141) #b00000000000000111111111111111111) (= (mask!27457 thiss!1141) #b00000000000001111111111111111111) (= (mask!27457 thiss!1141) #b00000000000011111111111111111111) (= (mask!27457 thiss!1141) #b00000000000111111111111111111111) (= (mask!27457 thiss!1141) #b00000000001111111111111111111111) (= (mask!27457 thiss!1141) #b00000000011111111111111111111111) (= (mask!27457 thiss!1141) #b00000000111111111111111111111111) (= (mask!27457 thiss!1141) #b00000001111111111111111111111111) (= (mask!27457 thiss!1141) #b00000011111111111111111111111111) (= (mask!27457 thiss!1141) #b00000111111111111111111111111111) (= (mask!27457 thiss!1141) #b00001111111111111111111111111111) (= (mask!27457 thiss!1141) #b00011111111111111111111111111111) (= (mask!27457 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27457 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947072 d!114477))

(declare-fun d!114479 () Bool)

(declare-fun res!635713 () Bool)

(declare-fun e!533082 () Bool)

(assert (=> d!114479 (=> res!635713 e!533082)))

(assert (=> d!114479 (= res!635713 (= (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114479 (= (arrayContainsKey!0 (_keys!10633 thiss!1141) key!756 #b00000000000000000000000000000000) e!533082)))

(declare-fun b!947166 () Bool)

(declare-fun e!533083 () Bool)

(assert (=> b!947166 (= e!533082 e!533083)))

(declare-fun res!635714 () Bool)

(assert (=> b!947166 (=> (not res!635714) (not e!533083))))

(assert (=> b!947166 (= res!635714 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28045 (_keys!10633 thiss!1141))))))

(declare-fun b!947167 () Bool)

(assert (=> b!947167 (= e!533083 (arrayContainsKey!0 (_keys!10633 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114479 (not res!635713)) b!947166))

(assert (= (and b!947166 res!635714) b!947167))

(declare-fun m!879623 () Bool)

(assert (=> d!114479 m!879623))

(declare-fun m!879625 () Bool)

(assert (=> b!947167 m!879625))

(assert (=> b!947072 d!114479))

(declare-fun d!114481 () Bool)

(assert (=> d!114481 (arrayContainsKey!0 (_keys!10633 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426337 () Unit!31806)

(declare-fun choose!13 (array!57317 (_ BitVec 64) (_ BitVec 32)) Unit!31806)

(assert (=> d!114481 (= lt!426337 (choose!13 (_keys!10633 thiss!1141) key!756 (index!38820 lt!426309)))))

(assert (=> d!114481 (bvsge (index!38820 lt!426309) #b00000000000000000000000000000000)))

(assert (=> d!114481 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10633 thiss!1141) key!756 (index!38820 lt!426309)) lt!426337)))

(declare-fun bs!26595 () Bool)

(assert (= bs!26595 d!114481))

(assert (=> bs!26595 m!879561))

(declare-fun m!879627 () Bool)

(assert (=> bs!26595 m!879627))

(assert (=> b!947072 d!114481))

(declare-fun b!947176 () Bool)

(declare-fun e!533092 () Bool)

(declare-fun call!41089 () Bool)

(assert (=> b!947176 (= e!533092 call!41089)))

(declare-fun b!947177 () Bool)

(declare-fun e!533090 () Bool)

(assert (=> b!947177 (= e!533090 call!41089)))

(declare-fun b!947178 () Bool)

(declare-fun e!533091 () Bool)

(assert (=> b!947178 (= e!533091 e!533090)))

(declare-fun c!98634 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!947178 (= c!98634 (validKeyInArray!0 (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114483 () Bool)

(declare-fun res!635720 () Bool)

(assert (=> d!114483 (=> res!635720 e!533091)))

(assert (=> d!114483 (= res!635720 (bvsge #b00000000000000000000000000000000 (size!28045 (_keys!10633 thiss!1141))))))

(assert (=> d!114483 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10633 thiss!1141) (mask!27457 thiss!1141)) e!533091)))

(declare-fun b!947179 () Bool)

(assert (=> b!947179 (= e!533090 e!533092)))

(declare-fun lt!426345 () (_ BitVec 64))

(assert (=> b!947179 (= lt!426345 (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426344 () Unit!31806)

(assert (=> b!947179 (= lt!426344 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10633 thiss!1141) lt!426345 #b00000000000000000000000000000000))))

(assert (=> b!947179 (arrayContainsKey!0 (_keys!10633 thiss!1141) lt!426345 #b00000000000000000000000000000000)))

(declare-fun lt!426346 () Unit!31806)

(assert (=> b!947179 (= lt!426346 lt!426344)))

(declare-fun res!635719 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57317 (_ BitVec 32)) SeekEntryResult!9112)

(assert (=> b!947179 (= res!635719 (= (seekEntryOrOpen!0 (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000) (_keys!10633 thiss!1141) (mask!27457 thiss!1141)) (Found!9112 #b00000000000000000000000000000000)))))

(assert (=> b!947179 (=> (not res!635719) (not e!533092))))

(declare-fun bm!41086 () Bool)

(assert (=> bm!41086 (= call!41089 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10633 thiss!1141) (mask!27457 thiss!1141)))))

(assert (= (and d!114483 (not res!635720)) b!947178))

(assert (= (and b!947178 c!98634) b!947179))

(assert (= (and b!947178 (not c!98634)) b!947177))

(assert (= (and b!947179 res!635719) b!947176))

(assert (= (or b!947176 b!947177) bm!41086))

(assert (=> b!947178 m!879623))

(assert (=> b!947178 m!879623))

(declare-fun m!879629 () Bool)

(assert (=> b!947178 m!879629))

(assert (=> b!947179 m!879623))

(declare-fun m!879631 () Bool)

(assert (=> b!947179 m!879631))

(declare-fun m!879633 () Bool)

(assert (=> b!947179 m!879633))

(assert (=> b!947179 m!879623))

(declare-fun m!879635 () Bool)

(assert (=> b!947179 m!879635))

(declare-fun m!879637 () Bool)

(assert (=> bm!41086 m!879637))

(assert (=> b!947067 d!114483))

(declare-fun bm!41089 () Bool)

(declare-fun call!41092 () Bool)

(declare-fun c!98637 () Bool)

(assert (=> bm!41089 (= call!41092 (arrayNoDuplicates!0 (_keys!10633 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98637 (Cons!19304 (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000) Nil!19305) Nil!19305)))))

(declare-fun b!947190 () Bool)

(declare-fun e!533103 () Bool)

(assert (=> b!947190 (= e!533103 call!41092)))

(declare-fun b!947191 () Bool)

(declare-fun e!533101 () Bool)

(declare-fun contains!5161 (List!19308 (_ BitVec 64)) Bool)

(assert (=> b!947191 (= e!533101 (contains!5161 Nil!19305 (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947192 () Bool)

(declare-fun e!533104 () Bool)

(assert (=> b!947192 (= e!533104 e!533103)))

(assert (=> b!947192 (= c!98637 (validKeyInArray!0 (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!947193 () Bool)

(assert (=> b!947193 (= e!533103 call!41092)))

(declare-fun d!114485 () Bool)

(declare-fun res!635727 () Bool)

(declare-fun e!533102 () Bool)

(assert (=> d!114485 (=> res!635727 e!533102)))

(assert (=> d!114485 (= res!635727 (bvsge #b00000000000000000000000000000000 (size!28045 (_keys!10633 thiss!1141))))))

(assert (=> d!114485 (= (arrayNoDuplicates!0 (_keys!10633 thiss!1141) #b00000000000000000000000000000000 Nil!19305) e!533102)))

(declare-fun b!947194 () Bool)

(assert (=> b!947194 (= e!533102 e!533104)))

(declare-fun res!635728 () Bool)

(assert (=> b!947194 (=> (not res!635728) (not e!533104))))

(assert (=> b!947194 (= res!635728 (not e!533101))))

(declare-fun res!635729 () Bool)

(assert (=> b!947194 (=> (not res!635729) (not e!533101))))

(assert (=> b!947194 (= res!635729 (validKeyInArray!0 (select (arr!27570 (_keys!10633 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114485 (not res!635727)) b!947194))

(assert (= (and b!947194 res!635729) b!947191))

(assert (= (and b!947194 res!635728) b!947192))

(assert (= (and b!947192 c!98637) b!947193))

(assert (= (and b!947192 (not c!98637)) b!947190))

(assert (= (or b!947193 b!947190) bm!41089))

(assert (=> bm!41089 m!879623))

(declare-fun m!879639 () Bool)

(assert (=> bm!41089 m!879639))

(assert (=> b!947191 m!879623))

(assert (=> b!947191 m!879623))

(declare-fun m!879641 () Bool)

(assert (=> b!947191 m!879641))

(assert (=> b!947192 m!879623))

(assert (=> b!947192 m!879623))

(assert (=> b!947192 m!879629))

(assert (=> b!947194 m!879623))

(assert (=> b!947194 m!879623))

(assert (=> b!947194 m!879629))

(assert (=> b!947070 d!114485))

(declare-fun d!114487 () Bool)

(declare-fun res!635736 () Bool)

(declare-fun e!533107 () Bool)

(assert (=> d!114487 (=> (not res!635736) (not e!533107))))

(declare-fun simpleValid!363 (LongMapFixedSize!4864) Bool)

(assert (=> d!114487 (= res!635736 (simpleValid!363 thiss!1141))))

(assert (=> d!114487 (= (valid!1857 thiss!1141) e!533107)))

(declare-fun b!947201 () Bool)

(declare-fun res!635737 () Bool)

(assert (=> b!947201 (=> (not res!635737) (not e!533107))))

(declare-fun arrayCountValidKeys!0 (array!57317 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!947201 (= res!635737 (= (arrayCountValidKeys!0 (_keys!10633 thiss!1141) #b00000000000000000000000000000000 (size!28045 (_keys!10633 thiss!1141))) (_size!2487 thiss!1141)))))

(declare-fun b!947202 () Bool)

(declare-fun res!635738 () Bool)

(assert (=> b!947202 (=> (not res!635738) (not e!533107))))

(assert (=> b!947202 (= res!635738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10633 thiss!1141) (mask!27457 thiss!1141)))))

(declare-fun b!947203 () Bool)

(assert (=> b!947203 (= e!533107 (arrayNoDuplicates!0 (_keys!10633 thiss!1141) #b00000000000000000000000000000000 Nil!19305))))

(assert (= (and d!114487 res!635736) b!947201))

(assert (= (and b!947201 res!635737) b!947202))

(assert (= (and b!947202 res!635738) b!947203))

(declare-fun m!879643 () Bool)

(assert (=> d!114487 m!879643))

(declare-fun m!879645 () Bool)

(assert (=> b!947201 m!879645))

(assert (=> b!947202 m!879565))

(assert (=> b!947203 m!879567))

(assert (=> start!80796 d!114487))

(declare-fun b!947210 () Bool)

(declare-fun e!533112 () Bool)

(assert (=> b!947210 (= e!533112 tp_is_empty!20677)))

(declare-fun mapNonEmpty!32899 () Bool)

(declare-fun mapRes!32899 () Bool)

(declare-fun tp!63082 () Bool)

(assert (=> mapNonEmpty!32899 (= mapRes!32899 (and tp!63082 e!533112))))

(declare-fun mapRest!32899 () (Array (_ BitVec 32) ValueCell!9857))

(declare-fun mapKey!32899 () (_ BitVec 32))

(declare-fun mapValue!32899 () ValueCell!9857)

(assert (=> mapNonEmpty!32899 (= mapRest!32890 (store mapRest!32899 mapKey!32899 mapValue!32899))))

(declare-fun mapIsEmpty!32899 () Bool)

(assert (=> mapIsEmpty!32899 mapRes!32899))

(declare-fun condMapEmpty!32899 () Bool)

(declare-fun mapDefault!32899 () ValueCell!9857)

(assert (=> mapNonEmpty!32890 (= condMapEmpty!32899 (= mapRest!32890 ((as const (Array (_ BitVec 32) ValueCell!9857)) mapDefault!32899)))))

(declare-fun e!533113 () Bool)

(assert (=> mapNonEmpty!32890 (= tp!63066 (and e!533113 mapRes!32899))))

(declare-fun b!947211 () Bool)

(assert (=> b!947211 (= e!533113 tp_is_empty!20677)))

(assert (= (and mapNonEmpty!32890 condMapEmpty!32899) mapIsEmpty!32899))

(assert (= (and mapNonEmpty!32890 (not condMapEmpty!32899)) mapNonEmpty!32899))

(assert (= (and mapNonEmpty!32899 ((_ is ValueCellFull!9857) mapValue!32899)) b!947210))

(assert (= (and mapNonEmpty!32890 ((_ is ValueCellFull!9857) mapDefault!32899)) b!947211))

(declare-fun m!879647 () Bool)

(assert (=> mapNonEmpty!32899 m!879647))

(check-sat (not b!947191) (not mapNonEmpty!32899) (not b!947192) b_and!29565 (not d!114471) (not b!947167) tp_is_empty!20677 (not b!947160) (not b!947178) (not b!947194) (not b!947179) (not b_next!18169) (not d!114481) (not b!947203) (not b!947202) (not bm!41086) (not b!947201) (not bm!41089) (not d!114487))
(check-sat b_and!29565 (not b_next!18169))
