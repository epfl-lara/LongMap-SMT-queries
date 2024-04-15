; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81188 () Bool)

(assert start!81188)

(declare-fun b!950055 () Bool)

(declare-fun b_free!18241 () Bool)

(declare-fun b_next!18241 () Bool)

(assert (=> b!950055 (= b_free!18241 (not b_next!18241))))

(declare-fun tp!63319 () Bool)

(declare-fun b_and!29671 () Bool)

(assert (=> b!950055 (= tp!63319 b_and!29671)))

(declare-fun b!950049 () Bool)

(declare-fun e!534866 () Bool)

(declare-fun tp_is_empty!20749 () Bool)

(assert (=> b!950049 (= e!534866 tp_is_empty!20749)))

(declare-fun b!950050 () Bool)

(declare-fun res!637034 () Bool)

(declare-fun e!534868 () Bool)

(assert (=> b!950050 (=> (not res!637034) (not e!534868))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32631 0))(
  ( (V!32632 (val!10425 Int)) )
))
(declare-datatypes ((ValueCell!9893 0))(
  ( (ValueCellFull!9893 (v!12967 V!32631)) (EmptyCell!9893) )
))
(declare-datatypes ((array!57481 0))(
  ( (array!57482 (arr!27641 (Array (_ BitVec 32) ValueCell!9893)) (size!28120 (_ BitVec 32))) )
))
(declare-datatypes ((array!57483 0))(
  ( (array!57484 (arr!27642 (Array (_ BitVec 32) (_ BitVec 64))) (size!28121 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4936 0))(
  ( (LongMapFixedSize!4937 (defaultEntry!5779 Int) (mask!27572 (_ BitVec 32)) (extraKeys!5511 (_ BitVec 32)) (zeroValue!5615 V!32631) (minValue!5615 V!32631) (_size!2523 (_ BitVec 32)) (_keys!10710 array!57483) (_values!5802 array!57481) (_vacant!2523 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4936)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9141 0))(
  ( (MissingZero!9141 (index!38935 (_ BitVec 32))) (Found!9141 (index!38936 (_ BitVec 32))) (Intermediate!9141 (undefined!9953 Bool) (index!38937 (_ BitVec 32)) (x!81754 (_ BitVec 32))) (Undefined!9141) (MissingVacant!9141 (index!38938 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57483 (_ BitVec 32)) SeekEntryResult!9141)

(assert (=> b!950050 (= res!637034 (not ((_ is Found!9141) (seekEntry!0 key!756 (_keys!10710 thiss!1141) (mask!27572 thiss!1141)))))))

(declare-fun b!950051 () Bool)

(declare-fun e!534867 () Bool)

(declare-fun mapRes!33035 () Bool)

(assert (=> b!950051 (= e!534867 (and e!534866 mapRes!33035))))

(declare-fun condMapEmpty!33035 () Bool)

(declare-fun mapDefault!33035 () ValueCell!9893)

(assert (=> b!950051 (= condMapEmpty!33035 (= (arr!27641 (_values!5802 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9893)) mapDefault!33035)))))

(declare-fun b!950052 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950052 (= e!534868 (not (validMask!0 (mask!27572 thiss!1141))))))

(declare-fun lt!427707 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57483 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950052 (= lt!427707 (arrayScanForKey!0 (_keys!10710 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57483 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950052 (arrayContainsKey!0 (_keys!10710 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31867 0))(
  ( (Unit!31868) )
))
(declare-fun lt!427708 () Unit!31867)

(declare-fun lemmaKeyInListMapIsInArray!304 (array!57483 array!57481 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 64) Int) Unit!31867)

(assert (=> b!950052 (= lt!427708 (lemmaKeyInListMapIsInArray!304 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) key!756 (defaultEntry!5779 thiss!1141)))))

(declare-fun mapNonEmpty!33035 () Bool)

(declare-fun tp!63320 () Bool)

(declare-fun e!534864 () Bool)

(assert (=> mapNonEmpty!33035 (= mapRes!33035 (and tp!63320 e!534864))))

(declare-fun mapValue!33035 () ValueCell!9893)

(declare-fun mapRest!33035 () (Array (_ BitVec 32) ValueCell!9893))

(declare-fun mapKey!33035 () (_ BitVec 32))

(assert (=> mapNonEmpty!33035 (= (arr!27641 (_values!5802 thiss!1141)) (store mapRest!33035 mapKey!33035 mapValue!33035))))

(declare-fun b!950053 () Bool)

(declare-fun res!637032 () Bool)

(assert (=> b!950053 (=> (not res!637032) (not e!534868))))

(declare-datatypes ((tuple2!13598 0))(
  ( (tuple2!13599 (_1!6810 (_ BitVec 64)) (_2!6810 V!32631)) )
))
(declare-datatypes ((List!19344 0))(
  ( (Nil!19341) (Cons!19340 (h!20500 tuple2!13598) (t!27674 List!19344)) )
))
(declare-datatypes ((ListLongMap!12285 0))(
  ( (ListLongMap!12286 (toList!6158 List!19344)) )
))
(declare-fun contains!5192 (ListLongMap!12285 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3320 (array!57483 array!57481 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 32) Int) ListLongMap!12285)

(assert (=> b!950053 (= res!637032 (contains!5192 (getCurrentListMap!3320 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)) key!756))))

(declare-fun b!950054 () Bool)

(declare-fun res!637031 () Bool)

(assert (=> b!950054 (=> (not res!637031) (not e!534868))))

(assert (=> b!950054 (= res!637031 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!33035 () Bool)

(assert (=> mapIsEmpty!33035 mapRes!33035))

(declare-fun e!534865 () Bool)

(declare-fun array_inv!21514 (array!57483) Bool)

(declare-fun array_inv!21515 (array!57481) Bool)

(assert (=> b!950055 (= e!534865 (and tp!63319 tp_is_empty!20749 (array_inv!21514 (_keys!10710 thiss!1141)) (array_inv!21515 (_values!5802 thiss!1141)) e!534867))))

(declare-fun b!950048 () Bool)

(assert (=> b!950048 (= e!534864 tp_is_empty!20749)))

(declare-fun res!637033 () Bool)

(assert (=> start!81188 (=> (not res!637033) (not e!534868))))

(declare-fun valid!1884 (LongMapFixedSize!4936) Bool)

(assert (=> start!81188 (= res!637033 (valid!1884 thiss!1141))))

(assert (=> start!81188 e!534868))

(assert (=> start!81188 e!534865))

(assert (=> start!81188 true))

(assert (= (and start!81188 res!637033) b!950054))

(assert (= (and b!950054 res!637031) b!950050))

(assert (= (and b!950050 res!637034) b!950053))

(assert (= (and b!950053 res!637032) b!950052))

(assert (= (and b!950051 condMapEmpty!33035) mapIsEmpty!33035))

(assert (= (and b!950051 (not condMapEmpty!33035)) mapNonEmpty!33035))

(assert (= (and mapNonEmpty!33035 ((_ is ValueCellFull!9893) mapValue!33035)) b!950048))

(assert (= (and b!950051 ((_ is ValueCellFull!9893) mapDefault!33035)) b!950049))

(assert (= b!950055 b!950051))

(assert (= start!81188 b!950055))

(declare-fun m!881973 () Bool)

(assert (=> mapNonEmpty!33035 m!881973))

(declare-fun m!881975 () Bool)

(assert (=> b!950053 m!881975))

(assert (=> b!950053 m!881975))

(declare-fun m!881977 () Bool)

(assert (=> b!950053 m!881977))

(declare-fun m!881979 () Bool)

(assert (=> b!950055 m!881979))

(declare-fun m!881981 () Bool)

(assert (=> b!950055 m!881981))

(declare-fun m!881983 () Bool)

(assert (=> start!81188 m!881983))

(declare-fun m!881985 () Bool)

(assert (=> b!950052 m!881985))

(declare-fun m!881987 () Bool)

(assert (=> b!950052 m!881987))

(declare-fun m!881989 () Bool)

(assert (=> b!950052 m!881989))

(declare-fun m!881991 () Bool)

(assert (=> b!950052 m!881991))

(declare-fun m!881993 () Bool)

(assert (=> b!950050 m!881993))

(check-sat (not mapNonEmpty!33035) (not b!950055) tp_is_empty!20749 b_and!29671 (not b_next!18241) (not b!950052) (not b!950053) (not start!81188) (not b!950050))
(check-sat b_and!29671 (not b_next!18241))
(get-model)

(declare-fun d!114969 () Bool)

(declare-fun res!637065 () Bool)

(declare-fun e!534908 () Bool)

(assert (=> d!114969 (=> (not res!637065) (not e!534908))))

(declare-fun simpleValid!374 (LongMapFixedSize!4936) Bool)

(assert (=> d!114969 (= res!637065 (simpleValid!374 thiss!1141))))

(assert (=> d!114969 (= (valid!1884 thiss!1141) e!534908)))

(declare-fun b!950110 () Bool)

(declare-fun res!637066 () Bool)

(assert (=> b!950110 (=> (not res!637066) (not e!534908))))

(declare-fun arrayCountValidKeys!0 (array!57483 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950110 (= res!637066 (= (arrayCountValidKeys!0 (_keys!10710 thiss!1141) #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))) (_size!2523 thiss!1141)))))

(declare-fun b!950111 () Bool)

(declare-fun res!637067 () Bool)

(assert (=> b!950111 (=> (not res!637067) (not e!534908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57483 (_ BitVec 32)) Bool)

(assert (=> b!950111 (= res!637067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10710 thiss!1141) (mask!27572 thiss!1141)))))

(declare-fun b!950112 () Bool)

(declare-datatypes ((List!19345 0))(
  ( (Nil!19342) (Cons!19341 (h!20501 (_ BitVec 64)) (t!27677 List!19345)) )
))
(declare-fun arrayNoDuplicates!0 (array!57483 (_ BitVec 32) List!19345) Bool)

(assert (=> b!950112 (= e!534908 (arrayNoDuplicates!0 (_keys!10710 thiss!1141) #b00000000000000000000000000000000 Nil!19342))))

(assert (= (and d!114969 res!637065) b!950110))

(assert (= (and b!950110 res!637066) b!950111))

(assert (= (and b!950111 res!637067) b!950112))

(declare-fun m!882039 () Bool)

(assert (=> d!114969 m!882039))

(declare-fun m!882041 () Bool)

(assert (=> b!950110 m!882041))

(declare-fun m!882043 () Bool)

(assert (=> b!950111 m!882043))

(declare-fun m!882045 () Bool)

(assert (=> b!950112 m!882045))

(assert (=> start!81188 d!114969))

(declare-fun b!950125 () Bool)

(declare-fun e!534917 () SeekEntryResult!9141)

(declare-fun lt!427730 () SeekEntryResult!9141)

(assert (=> b!950125 (= e!534917 (Found!9141 (index!38937 lt!427730)))))

(declare-fun b!950126 () Bool)

(declare-fun e!534916 () SeekEntryResult!9141)

(assert (=> b!950126 (= e!534916 e!534917)))

(declare-fun lt!427729 () (_ BitVec 64))

(assert (=> b!950126 (= lt!427729 (select (arr!27642 (_keys!10710 thiss!1141)) (index!38937 lt!427730)))))

(declare-fun c!99161 () Bool)

(assert (=> b!950126 (= c!99161 (= lt!427729 key!756))))

(declare-fun b!950127 () Bool)

(assert (=> b!950127 (= e!534916 Undefined!9141)))

(declare-fun b!950128 () Bool)

(declare-fun e!534915 () SeekEntryResult!9141)

(assert (=> b!950128 (= e!534915 (MissingZero!9141 (index!38937 lt!427730)))))

(declare-fun b!950129 () Bool)

(declare-fun c!99160 () Bool)

(assert (=> b!950129 (= c!99160 (= lt!427729 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950129 (= e!534917 e!534915)))

(declare-fun b!950130 () Bool)

(declare-fun lt!427732 () SeekEntryResult!9141)

(assert (=> b!950130 (= e!534915 (ite ((_ is MissingVacant!9141) lt!427732) (MissingZero!9141 (index!38938 lt!427732)) lt!427732))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57483 (_ BitVec 32)) SeekEntryResult!9141)

(assert (=> b!950130 (= lt!427732 (seekKeyOrZeroReturnVacant!0 (x!81754 lt!427730) (index!38937 lt!427730) (index!38937 lt!427730) key!756 (_keys!10710 thiss!1141) (mask!27572 thiss!1141)))))

(declare-fun d!114971 () Bool)

(declare-fun lt!427731 () SeekEntryResult!9141)

(assert (=> d!114971 (and (or ((_ is MissingVacant!9141) lt!427731) (not ((_ is Found!9141) lt!427731)) (and (bvsge (index!38936 lt!427731) #b00000000000000000000000000000000) (bvslt (index!38936 lt!427731) (size!28121 (_keys!10710 thiss!1141))))) (not ((_ is MissingVacant!9141) lt!427731)) (or (not ((_ is Found!9141) lt!427731)) (= (select (arr!27642 (_keys!10710 thiss!1141)) (index!38936 lt!427731)) key!756)))))

(assert (=> d!114971 (= lt!427731 e!534916)))

(declare-fun c!99159 () Bool)

(assert (=> d!114971 (= c!99159 (and ((_ is Intermediate!9141) lt!427730) (undefined!9953 lt!427730)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57483 (_ BitVec 32)) SeekEntryResult!9141)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114971 (= lt!427730 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27572 thiss!1141)) key!756 (_keys!10710 thiss!1141) (mask!27572 thiss!1141)))))

(assert (=> d!114971 (validMask!0 (mask!27572 thiss!1141))))

(assert (=> d!114971 (= (seekEntry!0 key!756 (_keys!10710 thiss!1141) (mask!27572 thiss!1141)) lt!427731)))

(assert (= (and d!114971 c!99159) b!950127))

(assert (= (and d!114971 (not c!99159)) b!950126))

(assert (= (and b!950126 c!99161) b!950125))

(assert (= (and b!950126 (not c!99161)) b!950129))

(assert (= (and b!950129 c!99160) b!950128))

(assert (= (and b!950129 (not c!99160)) b!950130))

(declare-fun m!882047 () Bool)

(assert (=> b!950126 m!882047))

(declare-fun m!882049 () Bool)

(assert (=> b!950130 m!882049))

(declare-fun m!882051 () Bool)

(assert (=> d!114971 m!882051))

(declare-fun m!882053 () Bool)

(assert (=> d!114971 m!882053))

(assert (=> d!114971 m!882053))

(declare-fun m!882055 () Bool)

(assert (=> d!114971 m!882055))

(assert (=> d!114971 m!881985))

(assert (=> b!950050 d!114971))

(declare-fun d!114973 () Bool)

(declare-fun e!534922 () Bool)

(assert (=> d!114973 e!534922))

(declare-fun res!637070 () Bool)

(assert (=> d!114973 (=> res!637070 e!534922)))

(declare-fun lt!427743 () Bool)

(assert (=> d!114973 (= res!637070 (not lt!427743))))

(declare-fun lt!427742 () Bool)

(assert (=> d!114973 (= lt!427743 lt!427742)))

(declare-fun lt!427744 () Unit!31867)

(declare-fun e!534923 () Unit!31867)

(assert (=> d!114973 (= lt!427744 e!534923)))

(declare-fun c!99164 () Bool)

(assert (=> d!114973 (= c!99164 lt!427742)))

(declare-fun containsKey!464 (List!19344 (_ BitVec 64)) Bool)

(assert (=> d!114973 (= lt!427742 (containsKey!464 (toList!6158 (getCurrentListMap!3320 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756))))

(assert (=> d!114973 (= (contains!5192 (getCurrentListMap!3320 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)) key!756) lt!427743)))

(declare-fun b!950137 () Bool)

(declare-fun lt!427741 () Unit!31867)

(assert (=> b!950137 (= e!534923 lt!427741)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!359 (List!19344 (_ BitVec 64)) Unit!31867)

(assert (=> b!950137 (= lt!427741 (lemmaContainsKeyImpliesGetValueByKeyDefined!359 (toList!6158 (getCurrentListMap!3320 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756))))

(declare-datatypes ((Option!506 0))(
  ( (Some!505 (v!12970 V!32631)) (None!504) )
))
(declare-fun isDefined!372 (Option!506) Bool)

(declare-fun getValueByKey!500 (List!19344 (_ BitVec 64)) Option!506)

(assert (=> b!950137 (isDefined!372 (getValueByKey!500 (toList!6158 (getCurrentListMap!3320 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756))))

(declare-fun b!950138 () Bool)

(declare-fun Unit!31869 () Unit!31867)

(assert (=> b!950138 (= e!534923 Unit!31869)))

(declare-fun b!950139 () Bool)

(assert (=> b!950139 (= e!534922 (isDefined!372 (getValueByKey!500 (toList!6158 (getCurrentListMap!3320 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141))) key!756)))))

(assert (= (and d!114973 c!99164) b!950137))

(assert (= (and d!114973 (not c!99164)) b!950138))

(assert (= (and d!114973 (not res!637070)) b!950139))

(declare-fun m!882057 () Bool)

(assert (=> d!114973 m!882057))

(declare-fun m!882059 () Bool)

(assert (=> b!950137 m!882059))

(declare-fun m!882061 () Bool)

(assert (=> b!950137 m!882061))

(assert (=> b!950137 m!882061))

(declare-fun m!882063 () Bool)

(assert (=> b!950137 m!882063))

(assert (=> b!950139 m!882061))

(assert (=> b!950139 m!882061))

(assert (=> b!950139 m!882063))

(assert (=> b!950053 d!114973))

(declare-fun bm!41356 () Bool)

(declare-fun call!41361 () ListLongMap!12285)

(declare-fun call!41360 () ListLongMap!12285)

(assert (=> bm!41356 (= call!41361 call!41360)))

(declare-fun bm!41357 () Bool)

(declare-fun call!41362 () Bool)

(declare-fun lt!427796 () ListLongMap!12285)

(assert (=> bm!41357 (= call!41362 (contains!5192 lt!427796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950183 () Bool)

(declare-fun e!534962 () ListLongMap!12285)

(declare-fun call!41364 () ListLongMap!12285)

(declare-fun +!2881 (ListLongMap!12285 tuple2!13598) ListLongMap!12285)

(assert (=> b!950183 (= e!534962 (+!2881 call!41364 (tuple2!13599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5615 thiss!1141))))))

(declare-fun b!950184 () Bool)

(declare-fun e!534955 () ListLongMap!12285)

(assert (=> b!950184 (= e!534962 e!534955)))

(declare-fun c!99181 () Bool)

(assert (=> b!950184 (= c!99181 (and (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950185 () Bool)

(declare-fun e!534954 () ListLongMap!12285)

(declare-fun call!41359 () ListLongMap!12285)

(assert (=> b!950185 (= e!534954 call!41359)))

(declare-fun b!950186 () Bool)

(declare-fun e!534952 () Unit!31867)

(declare-fun lt!427806 () Unit!31867)

(assert (=> b!950186 (= e!534952 lt!427806)))

(declare-fun lt!427792 () ListLongMap!12285)

(declare-fun getCurrentListMapNoExtraKeys!3353 (array!57483 array!57481 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 32) Int) ListLongMap!12285)

(assert (=> b!950186 (= lt!427792 (getCurrentListMapNoExtraKeys!3353 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!427803 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427803 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427799 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427799 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427797 () Unit!31867)

(declare-fun addStillContains!570 (ListLongMap!12285 (_ BitVec 64) V!32631 (_ BitVec 64)) Unit!31867)

(assert (=> b!950186 (= lt!427797 (addStillContains!570 lt!427792 lt!427803 (zeroValue!5615 thiss!1141) lt!427799))))

(assert (=> b!950186 (contains!5192 (+!2881 lt!427792 (tuple2!13599 lt!427803 (zeroValue!5615 thiss!1141))) lt!427799)))

(declare-fun lt!427790 () Unit!31867)

(assert (=> b!950186 (= lt!427790 lt!427797)))

(declare-fun lt!427805 () ListLongMap!12285)

(assert (=> b!950186 (= lt!427805 (getCurrentListMapNoExtraKeys!3353 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!427795 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427795 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427809 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427809 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427810 () Unit!31867)

(declare-fun addApplyDifferent!450 (ListLongMap!12285 (_ BitVec 64) V!32631 (_ BitVec 64)) Unit!31867)

(assert (=> b!950186 (= lt!427810 (addApplyDifferent!450 lt!427805 lt!427795 (minValue!5615 thiss!1141) lt!427809))))

(declare-fun apply!871 (ListLongMap!12285 (_ BitVec 64)) V!32631)

(assert (=> b!950186 (= (apply!871 (+!2881 lt!427805 (tuple2!13599 lt!427795 (minValue!5615 thiss!1141))) lt!427809) (apply!871 lt!427805 lt!427809))))

(declare-fun lt!427791 () Unit!31867)

(assert (=> b!950186 (= lt!427791 lt!427810)))

(declare-fun lt!427800 () ListLongMap!12285)

(assert (=> b!950186 (= lt!427800 (getCurrentListMapNoExtraKeys!3353 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!427808 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427808 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427793 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427793 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427798 () Unit!31867)

(assert (=> b!950186 (= lt!427798 (addApplyDifferent!450 lt!427800 lt!427808 (zeroValue!5615 thiss!1141) lt!427793))))

(assert (=> b!950186 (= (apply!871 (+!2881 lt!427800 (tuple2!13599 lt!427808 (zeroValue!5615 thiss!1141))) lt!427793) (apply!871 lt!427800 lt!427793))))

(declare-fun lt!427801 () Unit!31867)

(assert (=> b!950186 (= lt!427801 lt!427798)))

(declare-fun lt!427807 () ListLongMap!12285)

(assert (=> b!950186 (= lt!427807 (getCurrentListMapNoExtraKeys!3353 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun lt!427802 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427802 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427804 () (_ BitVec 64))

(assert (=> b!950186 (= lt!427804 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950186 (= lt!427806 (addApplyDifferent!450 lt!427807 lt!427802 (minValue!5615 thiss!1141) lt!427804))))

(assert (=> b!950186 (= (apply!871 (+!2881 lt!427807 (tuple2!13599 lt!427802 (minValue!5615 thiss!1141))) lt!427804) (apply!871 lt!427807 lt!427804))))

(declare-fun b!950187 () Bool)

(declare-fun e!534951 () Bool)

(declare-fun e!534958 () Bool)

(assert (=> b!950187 (= e!534951 e!534958)))

(declare-fun res!637095 () Bool)

(declare-fun call!41365 () Bool)

(assert (=> b!950187 (= res!637095 call!41365)))

(assert (=> b!950187 (=> (not res!637095) (not e!534958))))

(declare-fun b!950188 () Bool)

(declare-fun e!534953 () Bool)

(assert (=> b!950188 (= e!534953 (= (apply!871 lt!427796 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5615 thiss!1141)))))

(declare-fun bm!41358 () Bool)

(declare-fun call!41363 () ListLongMap!12285)

(assert (=> bm!41358 (= call!41363 call!41361)))

(declare-fun bm!41359 () Bool)

(assert (=> bm!41359 (= call!41359 call!41364)))

(declare-fun b!950189 () Bool)

(declare-fun res!637091 () Bool)

(declare-fun e!534961 () Bool)

(assert (=> b!950189 (=> (not res!637091) (not e!534961))))

(declare-fun e!534959 () Bool)

(assert (=> b!950189 (= res!637091 e!534959)))

(declare-fun c!99182 () Bool)

(assert (=> b!950189 (= c!99182 (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950190 () Bool)

(declare-fun e!534957 () Bool)

(declare-fun get!14526 (ValueCell!9893 V!32631) V!32631)

(declare-fun dynLambda!1637 (Int (_ BitVec 64)) V!32631)

(assert (=> b!950190 (= e!534957 (= (apply!871 lt!427796 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)) (get!14526 (select (arr!27641 (_values!5802 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1637 (defaultEntry!5779 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28120 (_values!5802 thiss!1141))))))

(assert (=> b!950190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))))))

(declare-fun b!950182 () Bool)

(assert (=> b!950182 (= e!534951 (not call!41365))))

(declare-fun d!114975 () Bool)

(assert (=> d!114975 e!534961))

(declare-fun res!637094 () Bool)

(assert (=> d!114975 (=> (not res!637094) (not e!534961))))

(assert (=> d!114975 (= res!637094 (or (bvsge #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))))))))

(declare-fun lt!427789 () ListLongMap!12285)

(assert (=> d!114975 (= lt!427796 lt!427789)))

(declare-fun lt!427794 () Unit!31867)

(assert (=> d!114975 (= lt!427794 e!534952)))

(declare-fun c!99180 () Bool)

(declare-fun e!534960 () Bool)

(assert (=> d!114975 (= c!99180 e!534960)))

(declare-fun res!637090 () Bool)

(assert (=> d!114975 (=> (not res!637090) (not e!534960))))

(assert (=> d!114975 (= res!637090 (bvslt #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))))))

(assert (=> d!114975 (= lt!427789 e!534962)))

(declare-fun c!99177 () Bool)

(assert (=> d!114975 (= c!99177 (and (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114975 (validMask!0 (mask!27572 thiss!1141))))

(assert (=> d!114975 (= (getCurrentListMap!3320 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)) lt!427796)))

(declare-fun b!950191 () Bool)

(declare-fun e!534956 () Bool)

(assert (=> b!950191 (= e!534956 e!534957)))

(declare-fun res!637089 () Bool)

(assert (=> b!950191 (=> (not res!637089) (not e!534957))))

(assert (=> b!950191 (= res!637089 (contains!5192 lt!427796 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950191 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))))))

(declare-fun b!950192 () Bool)

(assert (=> b!950192 (= e!534955 call!41359)))

(declare-fun b!950193 () Bool)

(declare-fun Unit!31870 () Unit!31867)

(assert (=> b!950193 (= e!534952 Unit!31870)))

(declare-fun bm!41360 () Bool)

(assert (=> bm!41360 (= call!41365 (contains!5192 lt!427796 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950194 () Bool)

(assert (=> b!950194 (= e!534961 e!534951)))

(declare-fun c!99178 () Bool)

(assert (=> b!950194 (= c!99178 (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950195 () Bool)

(assert (=> b!950195 (= e!534959 e!534953)))

(declare-fun res!637092 () Bool)

(assert (=> b!950195 (= res!637092 call!41362)))

(assert (=> b!950195 (=> (not res!637092) (not e!534953))))

(declare-fun b!950196 () Bool)

(assert (=> b!950196 (= e!534954 call!41363)))

(declare-fun b!950197 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950197 (= e!534960 (validKeyInArray!0 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41361 () Bool)

(assert (=> bm!41361 (= call!41364 (+!2881 (ite c!99177 call!41360 (ite c!99181 call!41361 call!41363)) (ite (or c!99177 c!99181) (tuple2!13599 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5615 thiss!1141)) (tuple2!13599 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5615 thiss!1141)))))))

(declare-fun b!950198 () Bool)

(declare-fun res!637093 () Bool)

(assert (=> b!950198 (=> (not res!637093) (not e!534961))))

(assert (=> b!950198 (= res!637093 e!534956)))

(declare-fun res!637096 () Bool)

(assert (=> b!950198 (=> res!637096 e!534956)))

(declare-fun e!534950 () Bool)

(assert (=> b!950198 (= res!637096 (not e!534950))))

(declare-fun res!637097 () Bool)

(assert (=> b!950198 (=> (not res!637097) (not e!534950))))

(assert (=> b!950198 (= res!637097 (bvslt #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))))))

(declare-fun b!950199 () Bool)

(assert (=> b!950199 (= e!534950 (validKeyInArray!0 (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41362 () Bool)

(assert (=> bm!41362 (= call!41360 (getCurrentListMapNoExtraKeys!3353 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5779 thiss!1141)))))

(declare-fun b!950200 () Bool)

(assert (=> b!950200 (= e!534958 (= (apply!871 lt!427796 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5615 thiss!1141)))))

(declare-fun b!950201 () Bool)

(assert (=> b!950201 (= e!534959 (not call!41362))))

(declare-fun b!950202 () Bool)

(declare-fun c!99179 () Bool)

(assert (=> b!950202 (= c!99179 (and (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!950202 (= e!534955 e!534954)))

(assert (= (and d!114975 c!99177) b!950183))

(assert (= (and d!114975 (not c!99177)) b!950184))

(assert (= (and b!950184 c!99181) b!950192))

(assert (= (and b!950184 (not c!99181)) b!950202))

(assert (= (and b!950202 c!99179) b!950185))

(assert (= (and b!950202 (not c!99179)) b!950196))

(assert (= (or b!950185 b!950196) bm!41358))

(assert (= (or b!950192 bm!41358) bm!41356))

(assert (= (or b!950192 b!950185) bm!41359))

(assert (= (or b!950183 bm!41356) bm!41362))

(assert (= (or b!950183 bm!41359) bm!41361))

(assert (= (and d!114975 res!637090) b!950197))

(assert (= (and d!114975 c!99180) b!950186))

(assert (= (and d!114975 (not c!99180)) b!950193))

(assert (= (and d!114975 res!637094) b!950198))

(assert (= (and b!950198 res!637097) b!950199))

(assert (= (and b!950198 (not res!637096)) b!950191))

(assert (= (and b!950191 res!637089) b!950190))

(assert (= (and b!950198 res!637093) b!950189))

(assert (= (and b!950189 c!99182) b!950195))

(assert (= (and b!950189 (not c!99182)) b!950201))

(assert (= (and b!950195 res!637092) b!950188))

(assert (= (or b!950195 b!950201) bm!41357))

(assert (= (and b!950189 res!637091) b!950194))

(assert (= (and b!950194 c!99178) b!950187))

(assert (= (and b!950194 (not c!99178)) b!950182))

(assert (= (and b!950187 res!637095) b!950200))

(assert (= (or b!950187 b!950182) bm!41360))

(declare-fun b_lambda!14349 () Bool)

(assert (=> (not b_lambda!14349) (not b!950190)))

(declare-fun t!27676 () Bool)

(declare-fun tb!6183 () Bool)

(assert (=> (and b!950055 (= (defaultEntry!5779 thiss!1141) (defaultEntry!5779 thiss!1141)) t!27676) tb!6183))

(declare-fun result!12287 () Bool)

(assert (=> tb!6183 (= result!12287 tp_is_empty!20749)))

(assert (=> b!950190 t!27676))

(declare-fun b_and!29677 () Bool)

(assert (= b_and!29671 (and (=> t!27676 result!12287) b_and!29677)))

(declare-fun m!882065 () Bool)

(assert (=> bm!41362 m!882065))

(declare-fun m!882067 () Bool)

(assert (=> b!950190 m!882067))

(declare-fun m!882069 () Bool)

(assert (=> b!950190 m!882069))

(assert (=> b!950190 m!882069))

(declare-fun m!882071 () Bool)

(assert (=> b!950190 m!882071))

(declare-fun m!882073 () Bool)

(assert (=> b!950190 m!882073))

(assert (=> b!950190 m!882067))

(assert (=> b!950190 m!882073))

(declare-fun m!882075 () Bool)

(assert (=> b!950190 m!882075))

(declare-fun m!882077 () Bool)

(assert (=> b!950188 m!882077))

(declare-fun m!882079 () Bool)

(assert (=> b!950186 m!882079))

(declare-fun m!882081 () Bool)

(assert (=> b!950186 m!882081))

(assert (=> b!950186 m!882069))

(declare-fun m!882083 () Bool)

(assert (=> b!950186 m!882083))

(declare-fun m!882085 () Bool)

(assert (=> b!950186 m!882085))

(declare-fun m!882087 () Bool)

(assert (=> b!950186 m!882087))

(declare-fun m!882089 () Bool)

(assert (=> b!950186 m!882089))

(assert (=> b!950186 m!882085))

(declare-fun m!882091 () Bool)

(assert (=> b!950186 m!882091))

(declare-fun m!882093 () Bool)

(assert (=> b!950186 m!882093))

(declare-fun m!882095 () Bool)

(assert (=> b!950186 m!882095))

(declare-fun m!882097 () Bool)

(assert (=> b!950186 m!882097))

(declare-fun m!882099 () Bool)

(assert (=> b!950186 m!882099))

(assert (=> b!950186 m!882091))

(declare-fun m!882101 () Bool)

(assert (=> b!950186 m!882101))

(assert (=> b!950186 m!882083))

(declare-fun m!882103 () Bool)

(assert (=> b!950186 m!882103))

(declare-fun m!882105 () Bool)

(assert (=> b!950186 m!882105))

(assert (=> b!950186 m!882089))

(declare-fun m!882107 () Bool)

(assert (=> b!950186 m!882107))

(assert (=> b!950186 m!882065))

(assert (=> b!950197 m!882069))

(assert (=> b!950197 m!882069))

(declare-fun m!882109 () Bool)

(assert (=> b!950197 m!882109))

(assert (=> b!950191 m!882069))

(assert (=> b!950191 m!882069))

(declare-fun m!882111 () Bool)

(assert (=> b!950191 m!882111))

(assert (=> d!114975 m!881985))

(declare-fun m!882113 () Bool)

(assert (=> bm!41360 m!882113))

(declare-fun m!882115 () Bool)

(assert (=> bm!41361 m!882115))

(declare-fun m!882117 () Bool)

(assert (=> bm!41357 m!882117))

(declare-fun m!882119 () Bool)

(assert (=> b!950200 m!882119))

(assert (=> b!950199 m!882069))

(assert (=> b!950199 m!882069))

(assert (=> b!950199 m!882109))

(declare-fun m!882121 () Bool)

(assert (=> b!950183 m!882121))

(assert (=> b!950053 d!114975))

(declare-fun d!114977 () Bool)

(assert (=> d!114977 (= (validMask!0 (mask!27572 thiss!1141)) (and (or (= (mask!27572 thiss!1141) #b00000000000000000000000000000111) (= (mask!27572 thiss!1141) #b00000000000000000000000000001111) (= (mask!27572 thiss!1141) #b00000000000000000000000000011111) (= (mask!27572 thiss!1141) #b00000000000000000000000000111111) (= (mask!27572 thiss!1141) #b00000000000000000000000001111111) (= (mask!27572 thiss!1141) #b00000000000000000000000011111111) (= (mask!27572 thiss!1141) #b00000000000000000000000111111111) (= (mask!27572 thiss!1141) #b00000000000000000000001111111111) (= (mask!27572 thiss!1141) #b00000000000000000000011111111111) (= (mask!27572 thiss!1141) #b00000000000000000000111111111111) (= (mask!27572 thiss!1141) #b00000000000000000001111111111111) (= (mask!27572 thiss!1141) #b00000000000000000011111111111111) (= (mask!27572 thiss!1141) #b00000000000000000111111111111111) (= (mask!27572 thiss!1141) #b00000000000000001111111111111111) (= (mask!27572 thiss!1141) #b00000000000000011111111111111111) (= (mask!27572 thiss!1141) #b00000000000000111111111111111111) (= (mask!27572 thiss!1141) #b00000000000001111111111111111111) (= (mask!27572 thiss!1141) #b00000000000011111111111111111111) (= (mask!27572 thiss!1141) #b00000000000111111111111111111111) (= (mask!27572 thiss!1141) #b00000000001111111111111111111111) (= (mask!27572 thiss!1141) #b00000000011111111111111111111111) (= (mask!27572 thiss!1141) #b00000000111111111111111111111111) (= (mask!27572 thiss!1141) #b00000001111111111111111111111111) (= (mask!27572 thiss!1141) #b00000011111111111111111111111111) (= (mask!27572 thiss!1141) #b00000111111111111111111111111111) (= (mask!27572 thiss!1141) #b00001111111111111111111111111111) (= (mask!27572 thiss!1141) #b00011111111111111111111111111111) (= (mask!27572 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27572 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950052 d!114977))

(declare-fun d!114979 () Bool)

(declare-fun lt!427813 () (_ BitVec 32))

(assert (=> d!114979 (and (or (bvslt lt!427813 #b00000000000000000000000000000000) (bvsge lt!427813 (size!28121 (_keys!10710 thiss!1141))) (and (bvsge lt!427813 #b00000000000000000000000000000000) (bvslt lt!427813 (size!28121 (_keys!10710 thiss!1141))))) (bvsge lt!427813 #b00000000000000000000000000000000) (bvslt lt!427813 (size!28121 (_keys!10710 thiss!1141))) (= (select (arr!27642 (_keys!10710 thiss!1141)) lt!427813) key!756))))

(declare-fun e!534965 () (_ BitVec 32))

(assert (=> d!114979 (= lt!427813 e!534965)))

(declare-fun c!99185 () Bool)

(assert (=> d!114979 (= c!99185 (= (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114979 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28121 (_keys!10710 thiss!1141))) (bvslt (size!28121 (_keys!10710 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!114979 (= (arrayScanForKey!0 (_keys!10710 thiss!1141) key!756 #b00000000000000000000000000000000) lt!427813)))

(declare-fun b!950209 () Bool)

(assert (=> b!950209 (= e!534965 #b00000000000000000000000000000000)))

(declare-fun b!950210 () Bool)

(assert (=> b!950210 (= e!534965 (arrayScanForKey!0 (_keys!10710 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114979 c!99185) b!950209))

(assert (= (and d!114979 (not c!99185)) b!950210))

(declare-fun m!882123 () Bool)

(assert (=> d!114979 m!882123))

(assert (=> d!114979 m!882069))

(declare-fun m!882125 () Bool)

(assert (=> b!950210 m!882125))

(assert (=> b!950052 d!114979))

(declare-fun d!114981 () Bool)

(declare-fun res!637102 () Bool)

(declare-fun e!534970 () Bool)

(assert (=> d!114981 (=> res!637102 e!534970)))

(assert (=> d!114981 (= res!637102 (= (select (arr!27642 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114981 (= (arrayContainsKey!0 (_keys!10710 thiss!1141) key!756 #b00000000000000000000000000000000) e!534970)))

(declare-fun b!950215 () Bool)

(declare-fun e!534971 () Bool)

(assert (=> b!950215 (= e!534970 e!534971)))

(declare-fun res!637103 () Bool)

(assert (=> b!950215 (=> (not res!637103) (not e!534971))))

(assert (=> b!950215 (= res!637103 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28121 (_keys!10710 thiss!1141))))))

(declare-fun b!950216 () Bool)

(assert (=> b!950216 (= e!534971 (arrayContainsKey!0 (_keys!10710 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114981 (not res!637102)) b!950215))

(assert (= (and b!950215 res!637103) b!950216))

(assert (=> d!114981 m!882069))

(declare-fun m!882127 () Bool)

(assert (=> b!950216 m!882127))

(assert (=> b!950052 d!114981))

(declare-fun d!114983 () Bool)

(declare-fun e!534974 () Bool)

(assert (=> d!114983 e!534974))

(declare-fun c!99188 () Bool)

(assert (=> d!114983 (= c!99188 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!427816 () Unit!31867)

(declare-fun choose!1593 (array!57483 array!57481 (_ BitVec 32) (_ BitVec 32) V!32631 V!32631 (_ BitVec 64) Int) Unit!31867)

(assert (=> d!114983 (= lt!427816 (choose!1593 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) key!756 (defaultEntry!5779 thiss!1141)))))

(assert (=> d!114983 (validMask!0 (mask!27572 thiss!1141))))

(assert (=> d!114983 (= (lemmaKeyInListMapIsInArray!304 (_keys!10710 thiss!1141) (_values!5802 thiss!1141) (mask!27572 thiss!1141) (extraKeys!5511 thiss!1141) (zeroValue!5615 thiss!1141) (minValue!5615 thiss!1141) key!756 (defaultEntry!5779 thiss!1141)) lt!427816)))

(declare-fun b!950221 () Bool)

(assert (=> b!950221 (= e!534974 (arrayContainsKey!0 (_keys!10710 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950222 () Bool)

(assert (=> b!950222 (= e!534974 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5511 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114983 c!99188) b!950221))

(assert (= (and d!114983 (not c!99188)) b!950222))

(declare-fun m!882129 () Bool)

(assert (=> d!114983 m!882129))

(assert (=> d!114983 m!881985))

(assert (=> b!950221 m!881989))

(assert (=> b!950052 d!114983))

(declare-fun d!114985 () Bool)

(assert (=> d!114985 (= (array_inv!21514 (_keys!10710 thiss!1141)) (bvsge (size!28121 (_keys!10710 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950055 d!114985))

(declare-fun d!114987 () Bool)

(assert (=> d!114987 (= (array_inv!21515 (_values!5802 thiss!1141)) (bvsge (size!28120 (_values!5802 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950055 d!114987))

(declare-fun mapNonEmpty!33044 () Bool)

(declare-fun mapRes!33044 () Bool)

(declare-fun tp!63335 () Bool)

(declare-fun e!534980 () Bool)

(assert (=> mapNonEmpty!33044 (= mapRes!33044 (and tp!63335 e!534980))))

(declare-fun mapRest!33044 () (Array (_ BitVec 32) ValueCell!9893))

(declare-fun mapValue!33044 () ValueCell!9893)

(declare-fun mapKey!33044 () (_ BitVec 32))

(assert (=> mapNonEmpty!33044 (= mapRest!33035 (store mapRest!33044 mapKey!33044 mapValue!33044))))

(declare-fun b!950229 () Bool)

(assert (=> b!950229 (= e!534980 tp_is_empty!20749)))

(declare-fun condMapEmpty!33044 () Bool)

(declare-fun mapDefault!33044 () ValueCell!9893)

(assert (=> mapNonEmpty!33035 (= condMapEmpty!33044 (= mapRest!33035 ((as const (Array (_ BitVec 32) ValueCell!9893)) mapDefault!33044)))))

(declare-fun e!534979 () Bool)

(assert (=> mapNonEmpty!33035 (= tp!63320 (and e!534979 mapRes!33044))))

(declare-fun b!950230 () Bool)

(assert (=> b!950230 (= e!534979 tp_is_empty!20749)))

(declare-fun mapIsEmpty!33044 () Bool)

(assert (=> mapIsEmpty!33044 mapRes!33044))

(assert (= (and mapNonEmpty!33035 condMapEmpty!33044) mapIsEmpty!33044))

(assert (= (and mapNonEmpty!33035 (not condMapEmpty!33044)) mapNonEmpty!33044))

(assert (= (and mapNonEmpty!33044 ((_ is ValueCellFull!9893) mapValue!33044)) b!950229))

(assert (= (and mapNonEmpty!33035 ((_ is ValueCellFull!9893) mapDefault!33044)) b!950230))

(declare-fun m!882131 () Bool)

(assert (=> mapNonEmpty!33044 m!882131))

(declare-fun b_lambda!14351 () Bool)

(assert (= b_lambda!14349 (or (and b!950055 b_free!18241) b_lambda!14351)))

(check-sat (not b!950137) (not b!950188) (not bm!41361) (not d!114983) (not b!950197) tp_is_empty!20749 (not d!114975) (not b!950190) (not b!950111) (not b_next!18241) (not b!950210) (not b!950200) (not b!950199) (not d!114971) (not b_lambda!14351) (not b!950130) (not b!950183) (not bm!41360) (not bm!41362) b_and!29677 (not d!114973) (not bm!41357) (not mapNonEmpty!33044) (not b!950221) (not b!950110) (not b!950112) (not b!950139) (not b!950186) (not d!114969) (not b!950216) (not b!950191))
(check-sat b_and!29677 (not b_next!18241))
