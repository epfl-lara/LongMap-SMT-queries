; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80936 () Bool)

(assert start!80936)

(declare-fun b!947916 () Bool)

(declare-fun b_free!18157 () Bool)

(declare-fun b_next!18157 () Bool)

(assert (=> b!947916 (= b_free!18157 (not b_next!18157))))

(declare-fun tp!63025 () Bool)

(declare-fun b_and!29589 () Bool)

(assert (=> b!947916 (= tp!63025 b_and!29589)))

(declare-fun b!947913 () Bool)

(declare-fun res!635964 () Bool)

(declare-fun e!533528 () Bool)

(assert (=> b!947913 (=> res!635964 e!533528)))

(declare-datatypes ((V!32519 0))(
  ( (V!32520 (val!10383 Int)) )
))
(declare-datatypes ((ValueCell!9851 0))(
  ( (ValueCellFull!9851 (v!12914 V!32519)) (EmptyCell!9851) )
))
(declare-datatypes ((array!57373 0))(
  ( (array!57374 (arr!27595 (Array (_ BitVec 32) ValueCell!9851)) (size!28069 (_ BitVec 32))) )
))
(declare-datatypes ((array!57375 0))(
  ( (array!57376 (arr!27596 (Array (_ BitVec 32) (_ BitVec 64))) (size!28070 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4852 0))(
  ( (LongMapFixedSize!4853 (defaultEntry!5723 Int) (mask!27491 (_ BitVec 32)) (extraKeys!5455 (_ BitVec 32)) (zeroValue!5559 V!32519) (minValue!5559 V!32519) (_size!2481 (_ BitVec 32)) (_keys!10656 array!57375) (_values!5746 array!57373) (_vacant!2481 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4852)

(assert (=> b!947913 (= res!635964 (or (not (= (size!28069 (_values!5746 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27491 thiss!1141)))) (not (= (size!28070 (_keys!10656 thiss!1141)) (size!28069 (_values!5746 thiss!1141)))) (bvslt (mask!27491 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5455 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5455 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!947914 () Bool)

(declare-fun e!533523 () Bool)

(declare-fun e!533521 () Bool)

(declare-fun mapRes!32866 () Bool)

(assert (=> b!947914 (= e!533523 (and e!533521 mapRes!32866))))

(declare-fun condMapEmpty!32866 () Bool)

(declare-fun mapDefault!32866 () ValueCell!9851)

(assert (=> b!947914 (= condMapEmpty!32866 (= (arr!27595 (_values!5746 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9851)) mapDefault!32866)))))

(declare-fun mapNonEmpty!32866 () Bool)

(declare-fun tp!63024 () Bool)

(declare-fun e!533524 () Bool)

(assert (=> mapNonEmpty!32866 (= mapRes!32866 (and tp!63024 e!533524))))

(declare-fun mapRest!32866 () (Array (_ BitVec 32) ValueCell!9851))

(declare-fun mapValue!32866 () ValueCell!9851)

(declare-fun mapKey!32866 () (_ BitVec 32))

(assert (=> mapNonEmpty!32866 (= (arr!27595 (_values!5746 thiss!1141)) (store mapRest!32866 mapKey!32866 mapValue!32866))))

(declare-fun b!947915 () Bool)

(declare-fun tp_is_empty!20665 () Bool)

(assert (=> b!947915 (= e!533521 tp_is_empty!20665)))

(declare-fun e!533527 () Bool)

(declare-fun array_inv!21514 (array!57375) Bool)

(declare-fun array_inv!21515 (array!57373) Bool)

(assert (=> b!947916 (= e!533527 (and tp!63025 tp_is_empty!20665 (array_inv!21514 (_keys!10656 thiss!1141)) (array_inv!21515 (_values!5746 thiss!1141)) e!533523))))

(declare-fun b!947917 () Bool)

(declare-fun e!533526 () Bool)

(assert (=> b!947917 (= e!533526 (not e!533528))))

(declare-fun res!635962 () Bool)

(assert (=> b!947917 (=> res!635962 e!533528)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!947917 (= res!635962 (not (validMask!0 (mask!27491 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!57375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!947917 (arrayContainsKey!0 (_keys!10656 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!9070 0))(
  ( (MissingZero!9070 (index!38651 (_ BitVec 32))) (Found!9070 (index!38652 (_ BitVec 32))) (Intermediate!9070 (undefined!9882 Bool) (index!38653 (_ BitVec 32)) (x!81436 (_ BitVec 32))) (Undefined!9070) (MissingVacant!9070 (index!38654 (_ BitVec 32))) )
))
(declare-fun lt!426823 () SeekEntryResult!9070)

(declare-datatypes ((Unit!31897 0))(
  ( (Unit!31898) )
))
(declare-fun lt!426822 () Unit!31897)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57375 (_ BitVec 64) (_ BitVec 32)) Unit!31897)

(assert (=> b!947917 (= lt!426822 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10656 thiss!1141) key!756 (index!38652 lt!426823)))))

(declare-fun b!947918 () Bool)

(declare-fun e!533522 () Bool)

(assert (=> b!947918 (= e!533522 e!533526)))

(declare-fun res!635960 () Bool)

(assert (=> b!947918 (=> (not res!635960) (not e!533526))))

(get-info :version)

(assert (=> b!947918 (= res!635960 ((_ is Found!9070) lt!426823))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!57375 (_ BitVec 32)) SeekEntryResult!9070)

(assert (=> b!947918 (= lt!426823 (seekEntry!0 key!756 (_keys!10656 thiss!1141) (mask!27491 thiss!1141)))))

(declare-fun b!947919 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57375 (_ BitVec 32)) Bool)

(assert (=> b!947919 (= e!533528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10656 thiss!1141) (mask!27491 thiss!1141)))))

(declare-fun res!635963 () Bool)

(assert (=> start!80936 (=> (not res!635963) (not e!533522))))

(declare-fun valid!1859 (LongMapFixedSize!4852) Bool)

(assert (=> start!80936 (= res!635963 (valid!1859 thiss!1141))))

(assert (=> start!80936 e!533522))

(assert (=> start!80936 e!533527))

(assert (=> start!80936 true))

(declare-fun mapIsEmpty!32866 () Bool)

(assert (=> mapIsEmpty!32866 mapRes!32866))

(declare-fun b!947920 () Bool)

(assert (=> b!947920 (= e!533524 tp_is_empty!20665)))

(declare-fun b!947921 () Bool)

(declare-fun res!635961 () Bool)

(assert (=> b!947921 (=> (not res!635961) (not e!533522))))

(assert (=> b!947921 (= res!635961 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!80936 res!635963) b!947921))

(assert (= (and b!947921 res!635961) b!947918))

(assert (= (and b!947918 res!635960) b!947917))

(assert (= (and b!947917 (not res!635962)) b!947913))

(assert (= (and b!947913 (not res!635964)) b!947919))

(assert (= (and b!947914 condMapEmpty!32866) mapIsEmpty!32866))

(assert (= (and b!947914 (not condMapEmpty!32866)) mapNonEmpty!32866))

(assert (= (and mapNonEmpty!32866 ((_ is ValueCellFull!9851) mapValue!32866)) b!947920))

(assert (= (and b!947914 ((_ is ValueCellFull!9851) mapDefault!32866)) b!947915))

(assert (= b!947916 b!947914))

(assert (= start!80936 b!947916))

(declare-fun m!881421 () Bool)

(assert (=> b!947919 m!881421))

(declare-fun m!881423 () Bool)

(assert (=> b!947916 m!881423))

(declare-fun m!881425 () Bool)

(assert (=> b!947916 m!881425))

(declare-fun m!881427 () Bool)

(assert (=> b!947917 m!881427))

(declare-fun m!881429 () Bool)

(assert (=> b!947917 m!881429))

(declare-fun m!881431 () Bool)

(assert (=> b!947917 m!881431))

(declare-fun m!881433 () Bool)

(assert (=> mapNonEmpty!32866 m!881433))

(declare-fun m!881435 () Bool)

(assert (=> b!947918 m!881435))

(declare-fun m!881437 () Bool)

(assert (=> start!80936 m!881437))

(check-sat (not start!80936) b_and!29589 (not b!947917) (not mapNonEmpty!32866) (not b!947916) (not b_next!18157) tp_is_empty!20665 (not b!947919) (not b!947918))
(check-sat b_and!29589 (not b_next!18157))
(get-model)

(declare-fun d!114953 () Bool)

(assert (=> d!114953 (= (validMask!0 (mask!27491 thiss!1141)) (and (or (= (mask!27491 thiss!1141) #b00000000000000000000000000000111) (= (mask!27491 thiss!1141) #b00000000000000000000000000001111) (= (mask!27491 thiss!1141) #b00000000000000000000000000011111) (= (mask!27491 thiss!1141) #b00000000000000000000000000111111) (= (mask!27491 thiss!1141) #b00000000000000000000000001111111) (= (mask!27491 thiss!1141) #b00000000000000000000000011111111) (= (mask!27491 thiss!1141) #b00000000000000000000000111111111) (= (mask!27491 thiss!1141) #b00000000000000000000001111111111) (= (mask!27491 thiss!1141) #b00000000000000000000011111111111) (= (mask!27491 thiss!1141) #b00000000000000000000111111111111) (= (mask!27491 thiss!1141) #b00000000000000000001111111111111) (= (mask!27491 thiss!1141) #b00000000000000000011111111111111) (= (mask!27491 thiss!1141) #b00000000000000000111111111111111) (= (mask!27491 thiss!1141) #b00000000000000001111111111111111) (= (mask!27491 thiss!1141) #b00000000000000011111111111111111) (= (mask!27491 thiss!1141) #b00000000000000111111111111111111) (= (mask!27491 thiss!1141) #b00000000000001111111111111111111) (= (mask!27491 thiss!1141) #b00000000000011111111111111111111) (= (mask!27491 thiss!1141) #b00000000000111111111111111111111) (= (mask!27491 thiss!1141) #b00000000001111111111111111111111) (= (mask!27491 thiss!1141) #b00000000011111111111111111111111) (= (mask!27491 thiss!1141) #b00000000111111111111111111111111) (= (mask!27491 thiss!1141) #b00000001111111111111111111111111) (= (mask!27491 thiss!1141) #b00000011111111111111111111111111) (= (mask!27491 thiss!1141) #b00000111111111111111111111111111) (= (mask!27491 thiss!1141) #b00001111111111111111111111111111) (= (mask!27491 thiss!1141) #b00011111111111111111111111111111) (= (mask!27491 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27491 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!947917 d!114953))

(declare-fun d!114955 () Bool)

(declare-fun res!635999 () Bool)

(declare-fun e!533581 () Bool)

(assert (=> d!114955 (=> res!635999 e!533581)))

(assert (=> d!114955 (= res!635999 (= (select (arr!27596 (_keys!10656 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114955 (= (arrayContainsKey!0 (_keys!10656 thiss!1141) key!756 #b00000000000000000000000000000000) e!533581)))

(declare-fun b!947980 () Bool)

(declare-fun e!533582 () Bool)

(assert (=> b!947980 (= e!533581 e!533582)))

(declare-fun res!636000 () Bool)

(assert (=> b!947980 (=> (not res!636000) (not e!533582))))

(assert (=> b!947980 (= res!636000 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28070 (_keys!10656 thiss!1141))))))

(declare-fun b!947981 () Bool)

(assert (=> b!947981 (= e!533582 (arrayContainsKey!0 (_keys!10656 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114955 (not res!635999)) b!947980))

(assert (= (and b!947980 res!636000) b!947981))

(declare-fun m!881475 () Bool)

(assert (=> d!114955 m!881475))

(declare-fun m!881477 () Bool)

(assert (=> b!947981 m!881477))

(assert (=> b!947917 d!114955))

(declare-fun d!114957 () Bool)

(assert (=> d!114957 (arrayContainsKey!0 (_keys!10656 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!426838 () Unit!31897)

(declare-fun choose!13 (array!57375 (_ BitVec 64) (_ BitVec 32)) Unit!31897)

(assert (=> d!114957 (= lt!426838 (choose!13 (_keys!10656 thiss!1141) key!756 (index!38652 lt!426823)))))

(assert (=> d!114957 (bvsge (index!38652 lt!426823) #b00000000000000000000000000000000)))

(assert (=> d!114957 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10656 thiss!1141) key!756 (index!38652 lt!426823)) lt!426838)))

(declare-fun bs!26633 () Bool)

(assert (= bs!26633 d!114957))

(assert (=> bs!26633 m!881429))

(declare-fun m!881479 () Bool)

(assert (=> bs!26633 m!881479))

(assert (=> b!947917 d!114957))

(declare-fun d!114959 () Bool)

(assert (=> d!114959 (= (array_inv!21514 (_keys!10656 thiss!1141)) (bvsge (size!28070 (_keys!10656 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947916 d!114959))

(declare-fun d!114961 () Bool)

(assert (=> d!114961 (= (array_inv!21515 (_values!5746 thiss!1141)) (bvsge (size!28069 (_values!5746 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!947916 d!114961))

(declare-fun b!947994 () Bool)

(declare-fun c!98949 () Bool)

(declare-fun lt!426850 () (_ BitVec 64))

(assert (=> b!947994 (= c!98949 (= lt!426850 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!533591 () SeekEntryResult!9070)

(declare-fun e!533589 () SeekEntryResult!9070)

(assert (=> b!947994 (= e!533591 e!533589)))

(declare-fun b!947995 () Bool)

(declare-fun lt!426848 () SeekEntryResult!9070)

(assert (=> b!947995 (= e!533591 (Found!9070 (index!38653 lt!426848)))))

(declare-fun b!947996 () Bool)

(declare-fun e!533590 () SeekEntryResult!9070)

(assert (=> b!947996 (= e!533590 Undefined!9070)))

(declare-fun b!947997 () Bool)

(assert (=> b!947997 (= e!533590 e!533591)))

(assert (=> b!947997 (= lt!426850 (select (arr!27596 (_keys!10656 thiss!1141)) (index!38653 lt!426848)))))

(declare-fun c!98951 () Bool)

(assert (=> b!947997 (= c!98951 (= lt!426850 key!756))))

(declare-fun d!114963 () Bool)

(declare-fun lt!426847 () SeekEntryResult!9070)

(assert (=> d!114963 (and (or ((_ is MissingVacant!9070) lt!426847) (not ((_ is Found!9070) lt!426847)) (and (bvsge (index!38652 lt!426847) #b00000000000000000000000000000000) (bvslt (index!38652 lt!426847) (size!28070 (_keys!10656 thiss!1141))))) (not ((_ is MissingVacant!9070) lt!426847)) (or (not ((_ is Found!9070) lt!426847)) (= (select (arr!27596 (_keys!10656 thiss!1141)) (index!38652 lt!426847)) key!756)))))

(assert (=> d!114963 (= lt!426847 e!533590)))

(declare-fun c!98950 () Bool)

(assert (=> d!114963 (= c!98950 (and ((_ is Intermediate!9070) lt!426848) (undefined!9882 lt!426848)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57375 (_ BitVec 32)) SeekEntryResult!9070)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114963 (= lt!426848 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27491 thiss!1141)) key!756 (_keys!10656 thiss!1141) (mask!27491 thiss!1141)))))

(assert (=> d!114963 (validMask!0 (mask!27491 thiss!1141))))

(assert (=> d!114963 (= (seekEntry!0 key!756 (_keys!10656 thiss!1141) (mask!27491 thiss!1141)) lt!426847)))

(declare-fun b!947998 () Bool)

(declare-fun lt!426849 () SeekEntryResult!9070)

(assert (=> b!947998 (= e!533589 (ite ((_ is MissingVacant!9070) lt!426849) (MissingZero!9070 (index!38654 lt!426849)) lt!426849))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57375 (_ BitVec 32)) SeekEntryResult!9070)

(assert (=> b!947998 (= lt!426849 (seekKeyOrZeroReturnVacant!0 (x!81436 lt!426848) (index!38653 lt!426848) (index!38653 lt!426848) key!756 (_keys!10656 thiss!1141) (mask!27491 thiss!1141)))))

(declare-fun b!947999 () Bool)

(assert (=> b!947999 (= e!533589 (MissingZero!9070 (index!38653 lt!426848)))))

(assert (= (and d!114963 c!98950) b!947996))

(assert (= (and d!114963 (not c!98950)) b!947997))

(assert (= (and b!947997 c!98951) b!947995))

(assert (= (and b!947997 (not c!98951)) b!947994))

(assert (= (and b!947994 c!98949) b!947999))

(assert (= (and b!947994 (not c!98949)) b!947998))

(declare-fun m!881481 () Bool)

(assert (=> b!947997 m!881481))

(declare-fun m!881483 () Bool)

(assert (=> d!114963 m!881483))

(declare-fun m!881485 () Bool)

(assert (=> d!114963 m!881485))

(assert (=> d!114963 m!881485))

(declare-fun m!881487 () Bool)

(assert (=> d!114963 m!881487))

(assert (=> d!114963 m!881427))

(declare-fun m!881489 () Bool)

(assert (=> b!947998 m!881489))

(assert (=> b!947918 d!114963))

(declare-fun d!114965 () Bool)

(declare-fun res!636007 () Bool)

(declare-fun e!533594 () Bool)

(assert (=> d!114965 (=> (not res!636007) (not e!533594))))

(declare-fun simpleValid!361 (LongMapFixedSize!4852) Bool)

(assert (=> d!114965 (= res!636007 (simpleValid!361 thiss!1141))))

(assert (=> d!114965 (= (valid!1859 thiss!1141) e!533594)))

(declare-fun b!948006 () Bool)

(declare-fun res!636008 () Bool)

(assert (=> b!948006 (=> (not res!636008) (not e!533594))))

(declare-fun arrayCountValidKeys!0 (array!57375 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948006 (= res!636008 (= (arrayCountValidKeys!0 (_keys!10656 thiss!1141) #b00000000000000000000000000000000 (size!28070 (_keys!10656 thiss!1141))) (_size!2481 thiss!1141)))))

(declare-fun b!948007 () Bool)

(declare-fun res!636009 () Bool)

(assert (=> b!948007 (=> (not res!636009) (not e!533594))))

(assert (=> b!948007 (= res!636009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10656 thiss!1141) (mask!27491 thiss!1141)))))

(declare-fun b!948008 () Bool)

(declare-datatypes ((List!19286 0))(
  ( (Nil!19283) (Cons!19282 (h!20444 (_ BitVec 64)) (t!27599 List!19286)) )
))
(declare-fun arrayNoDuplicates!0 (array!57375 (_ BitVec 32) List!19286) Bool)

(assert (=> b!948008 (= e!533594 (arrayNoDuplicates!0 (_keys!10656 thiss!1141) #b00000000000000000000000000000000 Nil!19283))))

(assert (= (and d!114965 res!636007) b!948006))

(assert (= (and b!948006 res!636008) b!948007))

(assert (= (and b!948007 res!636009) b!948008))

(declare-fun m!881491 () Bool)

(assert (=> d!114965 m!881491))

(declare-fun m!881493 () Bool)

(assert (=> b!948006 m!881493))

(assert (=> b!948007 m!881421))

(declare-fun m!881495 () Bool)

(assert (=> b!948008 m!881495))

(assert (=> start!80936 d!114965))

(declare-fun bm!41148 () Bool)

(declare-fun call!41151 () Bool)

(assert (=> bm!41148 (= call!41151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10656 thiss!1141) (mask!27491 thiss!1141)))))

(declare-fun b!948017 () Bool)

(declare-fun e!533601 () Bool)

(assert (=> b!948017 (= e!533601 call!41151)))

(declare-fun d!114967 () Bool)

(declare-fun res!636014 () Bool)

(declare-fun e!533602 () Bool)

(assert (=> d!114967 (=> res!636014 e!533602)))

(assert (=> d!114967 (= res!636014 (bvsge #b00000000000000000000000000000000 (size!28070 (_keys!10656 thiss!1141))))))

(assert (=> d!114967 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10656 thiss!1141) (mask!27491 thiss!1141)) e!533602)))

(declare-fun b!948018 () Bool)

(declare-fun e!533603 () Bool)

(assert (=> b!948018 (= e!533603 call!41151)))

(declare-fun b!948019 () Bool)

(assert (=> b!948019 (= e!533602 e!533601)))

(declare-fun c!98954 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948019 (= c!98954 (validKeyInArray!0 (select (arr!27596 (_keys!10656 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948020 () Bool)

(assert (=> b!948020 (= e!533601 e!533603)))

(declare-fun lt!426857 () (_ BitVec 64))

(assert (=> b!948020 (= lt!426857 (select (arr!27596 (_keys!10656 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!426859 () Unit!31897)

(assert (=> b!948020 (= lt!426859 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10656 thiss!1141) lt!426857 #b00000000000000000000000000000000))))

(assert (=> b!948020 (arrayContainsKey!0 (_keys!10656 thiss!1141) lt!426857 #b00000000000000000000000000000000)))

(declare-fun lt!426858 () Unit!31897)

(assert (=> b!948020 (= lt!426858 lt!426859)))

(declare-fun res!636015 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57375 (_ BitVec 32)) SeekEntryResult!9070)

(assert (=> b!948020 (= res!636015 (= (seekEntryOrOpen!0 (select (arr!27596 (_keys!10656 thiss!1141)) #b00000000000000000000000000000000) (_keys!10656 thiss!1141) (mask!27491 thiss!1141)) (Found!9070 #b00000000000000000000000000000000)))))

(assert (=> b!948020 (=> (not res!636015) (not e!533603))))

(assert (= (and d!114967 (not res!636014)) b!948019))

(assert (= (and b!948019 c!98954) b!948020))

(assert (= (and b!948019 (not c!98954)) b!948017))

(assert (= (and b!948020 res!636015) b!948018))

(assert (= (or b!948018 b!948017) bm!41148))

(declare-fun m!881497 () Bool)

(assert (=> bm!41148 m!881497))

(assert (=> b!948019 m!881475))

(assert (=> b!948019 m!881475))

(declare-fun m!881499 () Bool)

(assert (=> b!948019 m!881499))

(assert (=> b!948020 m!881475))

(declare-fun m!881501 () Bool)

(assert (=> b!948020 m!881501))

(declare-fun m!881503 () Bool)

(assert (=> b!948020 m!881503))

(assert (=> b!948020 m!881475))

(declare-fun m!881505 () Bool)

(assert (=> b!948020 m!881505))

(assert (=> b!947919 d!114967))

(declare-fun condMapEmpty!32875 () Bool)

(declare-fun mapDefault!32875 () ValueCell!9851)

(assert (=> mapNonEmpty!32866 (= condMapEmpty!32875 (= mapRest!32866 ((as const (Array (_ BitVec 32) ValueCell!9851)) mapDefault!32875)))))

(declare-fun e!533609 () Bool)

(declare-fun mapRes!32875 () Bool)

(assert (=> mapNonEmpty!32866 (= tp!63024 (and e!533609 mapRes!32875))))

(declare-fun mapNonEmpty!32875 () Bool)

(declare-fun tp!63040 () Bool)

(declare-fun e!533608 () Bool)

(assert (=> mapNonEmpty!32875 (= mapRes!32875 (and tp!63040 e!533608))))

(declare-fun mapKey!32875 () (_ BitVec 32))

(declare-fun mapRest!32875 () (Array (_ BitVec 32) ValueCell!9851))

(declare-fun mapValue!32875 () ValueCell!9851)

(assert (=> mapNonEmpty!32875 (= mapRest!32866 (store mapRest!32875 mapKey!32875 mapValue!32875))))

(declare-fun b!948027 () Bool)

(assert (=> b!948027 (= e!533608 tp_is_empty!20665)))

(declare-fun mapIsEmpty!32875 () Bool)

(assert (=> mapIsEmpty!32875 mapRes!32875))

(declare-fun b!948028 () Bool)

(assert (=> b!948028 (= e!533609 tp_is_empty!20665)))

(assert (= (and mapNonEmpty!32866 condMapEmpty!32875) mapIsEmpty!32875))

(assert (= (and mapNonEmpty!32866 (not condMapEmpty!32875)) mapNonEmpty!32875))

(assert (= (and mapNonEmpty!32875 ((_ is ValueCellFull!9851) mapValue!32875)) b!948027))

(assert (= (and mapNonEmpty!32866 ((_ is ValueCellFull!9851) mapDefault!32875)) b!948028))

(declare-fun m!881507 () Bool)

(assert (=> mapNonEmpty!32875 m!881507))

(check-sat b_and!29589 (not b!948008) (not d!114963) (not b!947981) (not b!948020) (not b!948006) (not mapNonEmpty!32875) (not d!114957) (not b_next!18157) (not b!947998) tp_is_empty!20665 (not b!948007) (not b!948019) (not d!114965) (not bm!41148))
(check-sat b_and!29589 (not b_next!18157))
