; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81214 () Bool)

(assert start!81214)

(declare-fun b!950252 () Bool)

(declare-fun b_free!18247 () Bool)

(declare-fun b_next!18247 () Bool)

(assert (=> b!950252 (= b_free!18247 (not b_next!18247))))

(declare-fun tp!63341 () Bool)

(declare-fun b_and!29679 () Bool)

(assert (=> b!950252 (= tp!63341 b_and!29679)))

(declare-fun b!950249 () Bool)

(declare-fun res!637116 () Bool)

(declare-fun e!534996 () Bool)

(assert (=> b!950249 (=> (not res!637116) (not e!534996))))

(declare-datatypes ((V!32639 0))(
  ( (V!32640 (val!10428 Int)) )
))
(declare-datatypes ((ValueCell!9896 0))(
  ( (ValueCellFull!9896 (v!12971 V!32639)) (EmptyCell!9896) )
))
(declare-datatypes ((array!57495 0))(
  ( (array!57496 (arr!27647 (Array (_ BitVec 32) ValueCell!9896)) (size!28126 (_ BitVec 32))) )
))
(declare-datatypes ((array!57497 0))(
  ( (array!57498 (arr!27648 (Array (_ BitVec 32) (_ BitVec 64))) (size!28127 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4942 0))(
  ( (LongMapFixedSize!4943 (defaultEntry!5784 Int) (mask!27581 (_ BitVec 32)) (extraKeys!5516 (_ BitVec 32)) (zeroValue!5620 V!32639) (minValue!5620 V!32639) (_size!2526 (_ BitVec 32)) (_keys!10716 array!57497) (_values!5807 array!57495) (_vacant!2526 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4942)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13600 0))(
  ( (tuple2!13601 (_1!6811 (_ BitVec 64)) (_2!6811 V!32639)) )
))
(declare-datatypes ((List!19346 0))(
  ( (Nil!19343) (Cons!19342 (h!20502 tuple2!13600) (t!27678 List!19346)) )
))
(declare-datatypes ((ListLongMap!12287 0))(
  ( (ListLongMap!12288 (toList!6159 List!19346)) )
))
(declare-fun contains!5193 (ListLongMap!12287 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3321 (array!57497 array!57495 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 32) Int) ListLongMap!12287)

(assert (=> b!950249 (= res!637116 (contains!5193 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) key!756))))

(declare-fun b!950250 () Bool)

(declare-fun e!534998 () Bool)

(declare-fun tp_is_empty!20755 () Bool)

(assert (=> b!950250 (= e!534998 tp_is_empty!20755)))

(declare-fun b!950251 () Bool)

(declare-fun e!534995 () Bool)

(declare-fun mapRes!33047 () Bool)

(assert (=> b!950251 (= e!534995 (and e!534998 mapRes!33047))))

(declare-fun condMapEmpty!33047 () Bool)

(declare-fun mapDefault!33047 () ValueCell!9896)

(assert (=> b!950251 (= condMapEmpty!33047 (= (arr!27647 (_values!5807 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9896)) mapDefault!33047)))))

(declare-fun e!535001 () Bool)

(declare-fun array_inv!21516 (array!57497) Bool)

(declare-fun array_inv!21517 (array!57495) Bool)

(assert (=> b!950252 (= e!535001 (and tp!63341 tp_is_empty!20755 (array_inv!21516 (_keys!10716 thiss!1141)) (array_inv!21517 (_values!5807 thiss!1141)) e!534995))))

(declare-fun mapIsEmpty!33047 () Bool)

(assert (=> mapIsEmpty!33047 mapRes!33047))

(declare-fun b!950253 () Bool)

(declare-fun e!534997 () Bool)

(assert (=> b!950253 (= e!534997 (= (size!28127 (_keys!10716 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27581 thiss!1141))))))

(declare-fun b!950254 () Bool)

(declare-fun res!637115 () Bool)

(assert (=> b!950254 (=> (not res!637115) (not e!534996))))

(assert (=> b!950254 (= res!637115 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!637117 () Bool)

(assert (=> start!81214 (=> (not res!637117) (not e!534996))))

(declare-fun valid!1886 (LongMapFixedSize!4942) Bool)

(assert (=> start!81214 (= res!637117 (valid!1886 thiss!1141))))

(assert (=> start!81214 e!534996))

(assert (=> start!81214 e!535001))

(assert (=> start!81214 true))

(declare-fun b!950255 () Bool)

(assert (=> b!950255 (= e!534996 (not e!534997))))

(declare-fun res!637114 () Bool)

(assert (=> b!950255 (=> res!637114 e!534997)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950255 (= res!637114 (not (validMask!0 (mask!27581 thiss!1141))))))

(declare-fun lt!427822 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57497 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950255 (= lt!427822 (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950255 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31871 0))(
  ( (Unit!31872) )
))
(declare-fun lt!427821 () Unit!31871)

(declare-fun lemmaKeyInListMapIsInArray!305 (array!57497 array!57495 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 64) Int) Unit!31871)

(assert (=> b!950255 (= lt!427821 (lemmaKeyInListMapIsInArray!305 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)))))

(declare-fun mapNonEmpty!33047 () Bool)

(declare-fun tp!63340 () Bool)

(declare-fun e!535000 () Bool)

(assert (=> mapNonEmpty!33047 (= mapRes!33047 (and tp!63340 e!535000))))

(declare-fun mapRest!33047 () (Array (_ BitVec 32) ValueCell!9896))

(declare-fun mapValue!33047 () ValueCell!9896)

(declare-fun mapKey!33047 () (_ BitVec 32))

(assert (=> mapNonEmpty!33047 (= (arr!27647 (_values!5807 thiss!1141)) (store mapRest!33047 mapKey!33047 mapValue!33047))))

(declare-fun b!950256 () Bool)

(declare-fun res!637118 () Bool)

(assert (=> b!950256 (=> (not res!637118) (not e!534996))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9143 0))(
  ( (MissingZero!9143 (index!38943 (_ BitVec 32))) (Found!9143 (index!38944 (_ BitVec 32))) (Intermediate!9143 (undefined!9955 Bool) (index!38945 (_ BitVec 32)) (x!81774 (_ BitVec 32))) (Undefined!9143) (MissingVacant!9143 (index!38946 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57497 (_ BitVec 32)) SeekEntryResult!9143)

(assert (=> b!950256 (= res!637118 (not ((_ is Found!9143) (seekEntry!0 key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)))))))

(declare-fun b!950257 () Bool)

(assert (=> b!950257 (= e!535000 tp_is_empty!20755)))

(assert (= (and start!81214 res!637117) b!950254))

(assert (= (and b!950254 res!637115) b!950256))

(assert (= (and b!950256 res!637118) b!950249))

(assert (= (and b!950249 res!637116) b!950255))

(assert (= (and b!950255 (not res!637114)) b!950253))

(assert (= (and b!950251 condMapEmpty!33047) mapIsEmpty!33047))

(assert (= (and b!950251 (not condMapEmpty!33047)) mapNonEmpty!33047))

(assert (= (and mapNonEmpty!33047 ((_ is ValueCellFull!9896) mapValue!33047)) b!950257))

(assert (= (and b!950251 ((_ is ValueCellFull!9896) mapDefault!33047)) b!950250))

(assert (= b!950252 b!950251))

(assert (= start!81214 b!950252))

(declare-fun m!882133 () Bool)

(assert (=> b!950256 m!882133))

(declare-fun m!882135 () Bool)

(assert (=> start!81214 m!882135))

(declare-fun m!882137 () Bool)

(assert (=> b!950255 m!882137))

(declare-fun m!882139 () Bool)

(assert (=> b!950255 m!882139))

(declare-fun m!882141 () Bool)

(assert (=> b!950255 m!882141))

(declare-fun m!882143 () Bool)

(assert (=> b!950255 m!882143))

(declare-fun m!882145 () Bool)

(assert (=> b!950252 m!882145))

(declare-fun m!882147 () Bool)

(assert (=> b!950252 m!882147))

(declare-fun m!882149 () Bool)

(assert (=> mapNonEmpty!33047 m!882149))

(declare-fun m!882151 () Bool)

(assert (=> b!950249 m!882151))

(assert (=> b!950249 m!882151))

(declare-fun m!882153 () Bool)

(assert (=> b!950249 m!882153))

(check-sat (not start!81214) (not b!950255) (not mapNonEmpty!33047) b_and!29679 (not b_next!18247) (not b!950249) (not b!950252) (not b!950256) tp_is_empty!20755)
(check-sat b_and!29679 (not b_next!18247))
(get-model)

(declare-fun d!114991 () Bool)

(declare-fun res!637155 () Bool)

(declare-fun e!535046 () Bool)

(assert (=> d!114991 (=> (not res!637155) (not e!535046))))

(declare-fun simpleValid!375 (LongMapFixedSize!4942) Bool)

(assert (=> d!114991 (= res!637155 (simpleValid!375 thiss!1141))))

(assert (=> d!114991 (= (valid!1886 thiss!1141) e!535046)))

(declare-fun b!950318 () Bool)

(declare-fun res!637156 () Bool)

(assert (=> b!950318 (=> (not res!637156) (not e!535046))))

(declare-fun arrayCountValidKeys!0 (array!57497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950318 (= res!637156 (= (arrayCountValidKeys!0 (_keys!10716 thiss!1141) #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))) (_size!2526 thiss!1141)))))

(declare-fun b!950319 () Bool)

(declare-fun res!637157 () Bool)

(assert (=> b!950319 (=> (not res!637157) (not e!535046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57497 (_ BitVec 32)) Bool)

(assert (=> b!950319 (= res!637157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)))))

(declare-fun b!950320 () Bool)

(declare-datatypes ((List!19347 0))(
  ( (Nil!19344) (Cons!19343 (h!20503 (_ BitVec 64)) (t!27681 List!19347)) )
))
(declare-fun arrayNoDuplicates!0 (array!57497 (_ BitVec 32) List!19347) Bool)

(assert (=> b!950320 (= e!535046 (arrayNoDuplicates!0 (_keys!10716 thiss!1141) #b00000000000000000000000000000000 Nil!19344))))

(assert (= (and d!114991 res!637155) b!950318))

(assert (= (and b!950318 res!637156) b!950319))

(assert (= (and b!950319 res!637157) b!950320))

(declare-fun m!882199 () Bool)

(assert (=> d!114991 m!882199))

(declare-fun m!882201 () Bool)

(assert (=> b!950318 m!882201))

(declare-fun m!882203 () Bool)

(assert (=> b!950319 m!882203))

(declare-fun m!882205 () Bool)

(assert (=> b!950320 m!882205))

(assert (=> start!81214 d!114991))

(declare-fun d!114993 () Bool)

(declare-fun e!535051 () Bool)

(assert (=> d!114993 e!535051))

(declare-fun res!637160 () Bool)

(assert (=> d!114993 (=> res!637160 e!535051)))

(declare-fun lt!427843 () Bool)

(assert (=> d!114993 (= res!637160 (not lt!427843))))

(declare-fun lt!427846 () Bool)

(assert (=> d!114993 (= lt!427843 lt!427846)))

(declare-fun lt!427845 () Unit!31871)

(declare-fun e!535052 () Unit!31871)

(assert (=> d!114993 (= lt!427845 e!535052)))

(declare-fun c!99191 () Bool)

(assert (=> d!114993 (= c!99191 lt!427846)))

(declare-fun containsKey!465 (List!19346 (_ BitVec 64)) Bool)

(assert (=> d!114993 (= lt!427846 (containsKey!465 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(assert (=> d!114993 (= (contains!5193 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) key!756) lt!427843)))

(declare-fun b!950327 () Bool)

(declare-fun lt!427844 () Unit!31871)

(assert (=> b!950327 (= e!535052 lt!427844)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!360 (List!19346 (_ BitVec 64)) Unit!31871)

(assert (=> b!950327 (= lt!427844 (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-datatypes ((Option!507 0))(
  ( (Some!506 (v!12974 V!32639)) (None!505) )
))
(declare-fun isDefined!373 (Option!507) Bool)

(declare-fun getValueByKey!501 (List!19346 (_ BitVec 64)) Option!507)

(assert (=> b!950327 (isDefined!373 (getValueByKey!501 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-fun b!950328 () Bool)

(declare-fun Unit!31873 () Unit!31871)

(assert (=> b!950328 (= e!535052 Unit!31873)))

(declare-fun b!950329 () Bool)

(assert (=> b!950329 (= e!535051 (isDefined!373 (getValueByKey!501 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756)))))

(assert (= (and d!114993 c!99191) b!950327))

(assert (= (and d!114993 (not c!99191)) b!950328))

(assert (= (and d!114993 (not res!637160)) b!950329))

(declare-fun m!882207 () Bool)

(assert (=> d!114993 m!882207))

(declare-fun m!882209 () Bool)

(assert (=> b!950327 m!882209))

(declare-fun m!882211 () Bool)

(assert (=> b!950327 m!882211))

(assert (=> b!950327 m!882211))

(declare-fun m!882213 () Bool)

(assert (=> b!950327 m!882213))

(assert (=> b!950329 m!882211))

(assert (=> b!950329 m!882211))

(assert (=> b!950329 m!882213))

(assert (=> b!950249 d!114993))

(declare-fun b!950372 () Bool)

(declare-fun res!637181 () Bool)

(declare-fun e!535084 () Bool)

(assert (=> b!950372 (=> (not res!637181) (not e!535084))))

(declare-fun e!535079 () Bool)

(assert (=> b!950372 (= res!637181 e!535079)))

(declare-fun res!637182 () Bool)

(assert (=> b!950372 (=> res!637182 e!535079)))

(declare-fun e!535087 () Bool)

(assert (=> b!950372 (= res!637182 (not e!535087))))

(declare-fun res!637180 () Bool)

(assert (=> b!950372 (=> (not res!637180) (not e!535087))))

(assert (=> b!950372 (= res!637180 (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun b!950373 () Bool)

(declare-fun e!535080 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950373 (= e!535080 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41377 () Bool)

(declare-fun call!41384 () ListLongMap!12287)

(declare-fun call!41386 () ListLongMap!12287)

(assert (=> bm!41377 (= call!41384 call!41386)))

(declare-fun b!950374 () Bool)

(declare-fun res!637179 () Bool)

(assert (=> b!950374 (=> (not res!637179) (not e!535084))))

(declare-fun e!535089 () Bool)

(assert (=> b!950374 (= res!637179 e!535089)))

(declare-fun c!99206 () Bool)

(assert (=> b!950374 (= c!99206 (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41378 () Bool)

(declare-fun call!41385 () Bool)

(declare-fun lt!427894 () ListLongMap!12287)

(assert (=> bm!41378 (= call!41385 (contains!5193 lt!427894 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950375 () Bool)

(declare-fun e!535088 () Unit!31871)

(declare-fun lt!427896 () Unit!31871)

(assert (=> b!950375 (= e!535088 lt!427896)))

(declare-fun lt!427912 () ListLongMap!12287)

(declare-fun getCurrentListMapNoExtraKeys!3354 (array!57497 array!57495 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 32) Int) ListLongMap!12287)

(assert (=> b!950375 (= lt!427912 (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!427901 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427901 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427908 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427908 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427911 () Unit!31871)

(declare-fun addStillContains!571 (ListLongMap!12287 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31871)

(assert (=> b!950375 (= lt!427911 (addStillContains!571 lt!427912 lt!427901 (zeroValue!5620 thiss!1141) lt!427908))))

(declare-fun +!2882 (ListLongMap!12287 tuple2!13600) ListLongMap!12287)

(assert (=> b!950375 (contains!5193 (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))) lt!427908)))

(declare-fun lt!427909 () Unit!31871)

(assert (=> b!950375 (= lt!427909 lt!427911)))

(declare-fun lt!427902 () ListLongMap!12287)

(assert (=> b!950375 (= lt!427902 (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!427903 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427903 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427906 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427906 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427895 () Unit!31871)

(declare-fun addApplyDifferent!451 (ListLongMap!12287 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31871)

(assert (=> b!950375 (= lt!427895 (addApplyDifferent!451 lt!427902 lt!427903 (minValue!5620 thiss!1141) lt!427906))))

(declare-fun apply!872 (ListLongMap!12287 (_ BitVec 64)) V!32639)

(assert (=> b!950375 (= (apply!872 (+!2882 lt!427902 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))) lt!427906) (apply!872 lt!427902 lt!427906))))

(declare-fun lt!427891 () Unit!31871)

(assert (=> b!950375 (= lt!427891 lt!427895)))

(declare-fun lt!427897 () ListLongMap!12287)

(assert (=> b!950375 (= lt!427897 (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!427892 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427892 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427898 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427898 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427899 () Unit!31871)

(assert (=> b!950375 (= lt!427899 (addApplyDifferent!451 lt!427897 lt!427892 (zeroValue!5620 thiss!1141) lt!427898))))

(assert (=> b!950375 (= (apply!872 (+!2882 lt!427897 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))) lt!427898) (apply!872 lt!427897 lt!427898))))

(declare-fun lt!427905 () Unit!31871)

(assert (=> b!950375 (= lt!427905 lt!427899)))

(declare-fun lt!427893 () ListLongMap!12287)

(assert (=> b!950375 (= lt!427893 (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!427910 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427910 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427904 () (_ BitVec 64))

(assert (=> b!950375 (= lt!427904 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950375 (= lt!427896 (addApplyDifferent!451 lt!427893 lt!427910 (minValue!5620 thiss!1141) lt!427904))))

(assert (=> b!950375 (= (apply!872 (+!2882 lt!427893 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))) lt!427904) (apply!872 lt!427893 lt!427904))))

(declare-fun b!950377 () Bool)

(declare-fun e!535085 () ListLongMap!12287)

(declare-fun e!535086 () ListLongMap!12287)

(assert (=> b!950377 (= e!535085 e!535086)))

(declare-fun c!99208 () Bool)

(assert (=> b!950377 (= c!99208 (and (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41379 () Bool)

(declare-fun call!41381 () Bool)

(assert (=> bm!41379 (= call!41381 (contains!5193 lt!427894 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950378 () Bool)

(declare-fun e!535082 () Bool)

(assert (=> b!950378 (= e!535084 e!535082)))

(declare-fun c!99205 () Bool)

(assert (=> b!950378 (= c!99205 (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950379 () Bool)

(assert (=> b!950379 (= e!535087 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950380 () Bool)

(declare-fun e!535090 () ListLongMap!12287)

(assert (=> b!950380 (= e!535090 call!41384)))

(declare-fun b!950381 () Bool)

(declare-fun e!535083 () Bool)

(assert (=> b!950381 (= e!535083 (= (apply!872 lt!427894 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5620 thiss!1141)))))

(declare-fun bm!41380 () Bool)

(declare-fun c!99204 () Bool)

(declare-fun call!41383 () ListLongMap!12287)

(declare-fun call!41380 () ListLongMap!12287)

(declare-fun call!41382 () ListLongMap!12287)

(assert (=> bm!41380 (= call!41386 (+!2882 (ite c!99204 call!41382 (ite c!99208 call!41383 call!41380)) (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(declare-fun bm!41381 () Bool)

(assert (=> bm!41381 (= call!41383 call!41382)))

(declare-fun b!950382 () Bool)

(assert (=> b!950382 (= e!535089 (not call!41385))))

(declare-fun b!950383 () Bool)

(declare-fun e!535081 () Bool)

(assert (=> b!950383 (= e!535089 e!535081)))

(declare-fun res!637185 () Bool)

(assert (=> b!950383 (= res!637185 call!41385)))

(assert (=> b!950383 (=> (not res!637185) (not e!535081))))

(declare-fun b!950384 () Bool)

(declare-fun Unit!31874 () Unit!31871)

(assert (=> b!950384 (= e!535088 Unit!31874)))

(declare-fun bm!41382 () Bool)

(assert (=> bm!41382 (= call!41380 call!41383)))

(declare-fun b!950385 () Bool)

(assert (=> b!950385 (= e!535081 (= (apply!872 lt!427894 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5620 thiss!1141)))))

(declare-fun d!114995 () Bool)

(assert (=> d!114995 e!535084))

(declare-fun res!637186 () Bool)

(assert (=> d!114995 (=> (not res!637186) (not e!535084))))

(assert (=> d!114995 (= res!637186 (or (bvsge #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))))

(declare-fun lt!427907 () ListLongMap!12287)

(assert (=> d!114995 (= lt!427894 lt!427907)))

(declare-fun lt!427900 () Unit!31871)

(assert (=> d!114995 (= lt!427900 e!535088)))

(declare-fun c!99209 () Bool)

(assert (=> d!114995 (= c!99209 e!535080)))

(declare-fun res!637187 () Bool)

(assert (=> d!114995 (=> (not res!637187) (not e!535080))))

(assert (=> d!114995 (= res!637187 (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(assert (=> d!114995 (= lt!427907 e!535085)))

(assert (=> d!114995 (= c!99204 (and (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114995 (validMask!0 (mask!27581 thiss!1141))))

(assert (=> d!114995 (= (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) lt!427894)))

(declare-fun b!950376 () Bool)

(declare-fun e!535091 () Bool)

(assert (=> b!950376 (= e!535079 e!535091)))

(declare-fun res!637183 () Bool)

(assert (=> b!950376 (=> (not res!637183) (not e!535091))))

(assert (=> b!950376 (= res!637183 (contains!5193 lt!427894 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950376 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun bm!41383 () Bool)

(assert (=> bm!41383 (= call!41382 (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun b!950386 () Bool)

(assert (=> b!950386 (= e!535090 call!41380)))

(declare-fun b!950387 () Bool)

(assert (=> b!950387 (= e!535082 (not call!41381))))

(declare-fun b!950388 () Bool)

(declare-fun get!14529 (ValueCell!9896 V!32639) V!32639)

(declare-fun dynLambda!1638 (Int (_ BitVec 64)) V!32639)

(assert (=> b!950388 (= e!535091 (= (apply!872 lt!427894 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)) (get!14529 (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1638 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_values!5807 thiss!1141))))))

(assert (=> b!950388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun b!950389 () Bool)

(declare-fun c!99207 () Bool)

(assert (=> b!950389 (= c!99207 (and (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!950389 (= e!535086 e!535090)))

(declare-fun b!950390 () Bool)

(assert (=> b!950390 (= e!535085 (+!2882 call!41386 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))

(declare-fun b!950391 () Bool)

(assert (=> b!950391 (= e!535086 call!41384)))

(declare-fun b!950392 () Bool)

(assert (=> b!950392 (= e!535082 e!535083)))

(declare-fun res!637184 () Bool)

(assert (=> b!950392 (= res!637184 call!41381)))

(assert (=> b!950392 (=> (not res!637184) (not e!535083))))

(assert (= (and d!114995 c!99204) b!950390))

(assert (= (and d!114995 (not c!99204)) b!950377))

(assert (= (and b!950377 c!99208) b!950391))

(assert (= (and b!950377 (not c!99208)) b!950389))

(assert (= (and b!950389 c!99207) b!950380))

(assert (= (and b!950389 (not c!99207)) b!950386))

(assert (= (or b!950380 b!950386) bm!41382))

(assert (= (or b!950391 bm!41382) bm!41381))

(assert (= (or b!950391 b!950380) bm!41377))

(assert (= (or b!950390 bm!41381) bm!41383))

(assert (= (or b!950390 bm!41377) bm!41380))

(assert (= (and d!114995 res!637187) b!950373))

(assert (= (and d!114995 c!99209) b!950375))

(assert (= (and d!114995 (not c!99209)) b!950384))

(assert (= (and d!114995 res!637186) b!950372))

(assert (= (and b!950372 res!637180) b!950379))

(assert (= (and b!950372 (not res!637182)) b!950376))

(assert (= (and b!950376 res!637183) b!950388))

(assert (= (and b!950372 res!637181) b!950374))

(assert (= (and b!950374 c!99206) b!950383))

(assert (= (and b!950374 (not c!99206)) b!950382))

(assert (= (and b!950383 res!637185) b!950385))

(assert (= (or b!950383 b!950382) bm!41378))

(assert (= (and b!950374 res!637179) b!950378))

(assert (= (and b!950378 c!99205) b!950392))

(assert (= (and b!950378 (not c!99205)) b!950387))

(assert (= (and b!950392 res!637184) b!950381))

(assert (= (or b!950392 b!950387) bm!41379))

(declare-fun b_lambda!14353 () Bool)

(assert (=> (not b_lambda!14353) (not b!950388)))

(declare-fun t!27680 () Bool)

(declare-fun tb!6185 () Bool)

(assert (=> (and b!950252 (= (defaultEntry!5784 thiss!1141) (defaultEntry!5784 thiss!1141)) t!27680) tb!6185))

(declare-fun result!12293 () Bool)

(assert (=> tb!6185 (= result!12293 tp_is_empty!20755)))

(assert (=> b!950388 t!27680))

(declare-fun b_and!29685 () Bool)

(assert (= b_and!29679 (and (=> t!27680 result!12293) b_and!29685)))

(declare-fun m!882215 () Bool)

(assert (=> b!950388 m!882215))

(declare-fun m!882217 () Bool)

(assert (=> b!950388 m!882217))

(declare-fun m!882219 () Bool)

(assert (=> b!950388 m!882219))

(declare-fun m!882221 () Bool)

(assert (=> b!950388 m!882221))

(assert (=> b!950388 m!882215))

(assert (=> b!950388 m!882217))

(assert (=> b!950388 m!882221))

(declare-fun m!882223 () Bool)

(assert (=> b!950388 m!882223))

(declare-fun m!882225 () Bool)

(assert (=> bm!41380 m!882225))

(assert (=> b!950379 m!882221))

(assert (=> b!950379 m!882221))

(declare-fun m!882227 () Bool)

(assert (=> b!950379 m!882227))

(declare-fun m!882229 () Bool)

(assert (=> bm!41379 m!882229))

(declare-fun m!882231 () Bool)

(assert (=> b!950375 m!882231))

(declare-fun m!882233 () Bool)

(assert (=> b!950375 m!882233))

(assert (=> b!950375 m!882231))

(declare-fun m!882235 () Bool)

(assert (=> b!950375 m!882235))

(declare-fun m!882237 () Bool)

(assert (=> b!950375 m!882237))

(declare-fun m!882239 () Bool)

(assert (=> b!950375 m!882239))

(declare-fun m!882241 () Bool)

(assert (=> b!950375 m!882241))

(declare-fun m!882243 () Bool)

(assert (=> b!950375 m!882243))

(declare-fun m!882245 () Bool)

(assert (=> b!950375 m!882245))

(declare-fun m!882247 () Bool)

(assert (=> b!950375 m!882247))

(declare-fun m!882249 () Bool)

(assert (=> b!950375 m!882249))

(declare-fun m!882251 () Bool)

(assert (=> b!950375 m!882251))

(assert (=> b!950375 m!882239))

(declare-fun m!882253 () Bool)

(assert (=> b!950375 m!882253))

(declare-fun m!882255 () Bool)

(assert (=> b!950375 m!882255))

(declare-fun m!882257 () Bool)

(assert (=> b!950375 m!882257))

(declare-fun m!882259 () Bool)

(assert (=> b!950375 m!882259))

(assert (=> b!950375 m!882221))

(assert (=> b!950375 m!882257))

(assert (=> b!950375 m!882249))

(declare-fun m!882261 () Bool)

(assert (=> b!950375 m!882261))

(assert (=> d!114995 m!882137))

(declare-fun m!882263 () Bool)

(assert (=> b!950390 m!882263))

(declare-fun m!882265 () Bool)

(assert (=> b!950385 m!882265))

(declare-fun m!882267 () Bool)

(assert (=> bm!41378 m!882267))

(declare-fun m!882269 () Bool)

(assert (=> b!950381 m!882269))

(assert (=> b!950373 m!882221))

(assert (=> b!950373 m!882221))

(assert (=> b!950373 m!882227))

(assert (=> bm!41383 m!882247))

(assert (=> b!950376 m!882221))

(assert (=> b!950376 m!882221))

(declare-fun m!882271 () Bool)

(assert (=> b!950376 m!882271))

(assert (=> b!950249 d!114995))

(declare-fun b!950407 () Bool)

(declare-fun e!535099 () SeekEntryResult!9143)

(declare-fun lt!427921 () SeekEntryResult!9143)

(assert (=> b!950407 (= e!535099 (ite ((_ is MissingVacant!9143) lt!427921) (MissingZero!9143 (index!38946 lt!427921)) lt!427921))))

(declare-fun lt!427923 () SeekEntryResult!9143)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57497 (_ BitVec 32)) SeekEntryResult!9143)

(assert (=> b!950407 (= lt!427921 (seekKeyOrZeroReturnVacant!0 (x!81774 lt!427923) (index!38945 lt!427923) (index!38945 lt!427923) key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)))))

(declare-fun b!950408 () Bool)

(assert (=> b!950408 (= e!535099 (MissingZero!9143 (index!38945 lt!427923)))))

(declare-fun b!950409 () Bool)

(declare-fun e!535098 () SeekEntryResult!9143)

(declare-fun e!535100 () SeekEntryResult!9143)

(assert (=> b!950409 (= e!535098 e!535100)))

(declare-fun lt!427922 () (_ BitVec 64))

(assert (=> b!950409 (= lt!427922 (select (arr!27648 (_keys!10716 thiss!1141)) (index!38945 lt!427923)))))

(declare-fun c!99217 () Bool)

(assert (=> b!950409 (= c!99217 (= lt!427922 key!756))))

(declare-fun b!950410 () Bool)

(assert (=> b!950410 (= e!535100 (Found!9143 (index!38945 lt!427923)))))

(declare-fun b!950411 () Bool)

(assert (=> b!950411 (= e!535098 Undefined!9143)))

(declare-fun d!114997 () Bool)

(declare-fun lt!427924 () SeekEntryResult!9143)

(assert (=> d!114997 (and (or ((_ is MissingVacant!9143) lt!427924) (not ((_ is Found!9143) lt!427924)) (and (bvsge (index!38944 lt!427924) #b00000000000000000000000000000000) (bvslt (index!38944 lt!427924) (size!28127 (_keys!10716 thiss!1141))))) (not ((_ is MissingVacant!9143) lt!427924)) (or (not ((_ is Found!9143) lt!427924)) (= (select (arr!27648 (_keys!10716 thiss!1141)) (index!38944 lt!427924)) key!756)))))

(assert (=> d!114997 (= lt!427924 e!535098)))

(declare-fun c!99216 () Bool)

(assert (=> d!114997 (= c!99216 (and ((_ is Intermediate!9143) lt!427923) (undefined!9955 lt!427923)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57497 (_ BitVec 32)) SeekEntryResult!9143)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114997 (= lt!427923 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27581 thiss!1141)) key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)))))

(assert (=> d!114997 (validMask!0 (mask!27581 thiss!1141))))

(assert (=> d!114997 (= (seekEntry!0 key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)) lt!427924)))

(declare-fun b!950412 () Bool)

(declare-fun c!99218 () Bool)

(assert (=> b!950412 (= c!99218 (= lt!427922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950412 (= e!535100 e!535099)))

(assert (= (and d!114997 c!99216) b!950411))

(assert (= (and d!114997 (not c!99216)) b!950409))

(assert (= (and b!950409 c!99217) b!950410))

(assert (= (and b!950409 (not c!99217)) b!950412))

(assert (= (and b!950412 c!99218) b!950408))

(assert (= (and b!950412 (not c!99218)) b!950407))

(declare-fun m!882273 () Bool)

(assert (=> b!950407 m!882273))

(declare-fun m!882275 () Bool)

(assert (=> b!950409 m!882275))

(declare-fun m!882277 () Bool)

(assert (=> d!114997 m!882277))

(declare-fun m!882279 () Bool)

(assert (=> d!114997 m!882279))

(assert (=> d!114997 m!882279))

(declare-fun m!882281 () Bool)

(assert (=> d!114997 m!882281))

(assert (=> d!114997 m!882137))

(assert (=> b!950256 d!114997))

(declare-fun d!114999 () Bool)

(assert (=> d!114999 (= (validMask!0 (mask!27581 thiss!1141)) (and (or (= (mask!27581 thiss!1141) #b00000000000000000000000000000111) (= (mask!27581 thiss!1141) #b00000000000000000000000000001111) (= (mask!27581 thiss!1141) #b00000000000000000000000000011111) (= (mask!27581 thiss!1141) #b00000000000000000000000000111111) (= (mask!27581 thiss!1141) #b00000000000000000000000001111111) (= (mask!27581 thiss!1141) #b00000000000000000000000011111111) (= (mask!27581 thiss!1141) #b00000000000000000000000111111111) (= (mask!27581 thiss!1141) #b00000000000000000000001111111111) (= (mask!27581 thiss!1141) #b00000000000000000000011111111111) (= (mask!27581 thiss!1141) #b00000000000000000000111111111111) (= (mask!27581 thiss!1141) #b00000000000000000001111111111111) (= (mask!27581 thiss!1141) #b00000000000000000011111111111111) (= (mask!27581 thiss!1141) #b00000000000000000111111111111111) (= (mask!27581 thiss!1141) #b00000000000000001111111111111111) (= (mask!27581 thiss!1141) #b00000000000000011111111111111111) (= (mask!27581 thiss!1141) #b00000000000000111111111111111111) (= (mask!27581 thiss!1141) #b00000000000001111111111111111111) (= (mask!27581 thiss!1141) #b00000000000011111111111111111111) (= (mask!27581 thiss!1141) #b00000000000111111111111111111111) (= (mask!27581 thiss!1141) #b00000000001111111111111111111111) (= (mask!27581 thiss!1141) #b00000000011111111111111111111111) (= (mask!27581 thiss!1141) #b00000000111111111111111111111111) (= (mask!27581 thiss!1141) #b00000001111111111111111111111111) (= (mask!27581 thiss!1141) #b00000011111111111111111111111111) (= (mask!27581 thiss!1141) #b00000111111111111111111111111111) (= (mask!27581 thiss!1141) #b00001111111111111111111111111111) (= (mask!27581 thiss!1141) #b00011111111111111111111111111111) (= (mask!27581 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27581 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950255 d!114999))

(declare-fun d!115001 () Bool)

(declare-fun lt!427927 () (_ BitVec 32))

(assert (=> d!115001 (and (or (bvslt lt!427927 #b00000000000000000000000000000000) (bvsge lt!427927 (size!28127 (_keys!10716 thiss!1141))) (and (bvsge lt!427927 #b00000000000000000000000000000000) (bvslt lt!427927 (size!28127 (_keys!10716 thiss!1141))))) (bvsge lt!427927 #b00000000000000000000000000000000) (bvslt lt!427927 (size!28127 (_keys!10716 thiss!1141))) (= (select (arr!27648 (_keys!10716 thiss!1141)) lt!427927) key!756))))

(declare-fun e!535103 () (_ BitVec 32))

(assert (=> d!115001 (= lt!427927 e!535103)))

(declare-fun c!99221 () Bool)

(assert (=> d!115001 (= c!99221 (= (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115001 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))) (bvslt (size!28127 (_keys!10716 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115001 (= (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000) lt!427927)))

(declare-fun b!950417 () Bool)

(assert (=> b!950417 (= e!535103 #b00000000000000000000000000000000)))

(declare-fun b!950418 () Bool)

(assert (=> b!950418 (= e!535103 (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115001 c!99221) b!950417))

(assert (= (and d!115001 (not c!99221)) b!950418))

(declare-fun m!882283 () Bool)

(assert (=> d!115001 m!882283))

(assert (=> d!115001 m!882221))

(declare-fun m!882285 () Bool)

(assert (=> b!950418 m!882285))

(assert (=> b!950255 d!115001))

(declare-fun d!115003 () Bool)

(declare-fun res!637192 () Bool)

(declare-fun e!535108 () Bool)

(assert (=> d!115003 (=> res!637192 e!535108)))

(assert (=> d!115003 (= res!637192 (= (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115003 (= (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000) e!535108)))

(declare-fun b!950423 () Bool)

(declare-fun e!535109 () Bool)

(assert (=> b!950423 (= e!535108 e!535109)))

(declare-fun res!637193 () Bool)

(assert (=> b!950423 (=> (not res!637193) (not e!535109))))

(assert (=> b!950423 (= res!637193 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun b!950424 () Bool)

(assert (=> b!950424 (= e!535109 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115003 (not res!637192)) b!950423))

(assert (= (and b!950423 res!637193) b!950424))

(assert (=> d!115003 m!882221))

(declare-fun m!882287 () Bool)

(assert (=> b!950424 m!882287))

(assert (=> b!950255 d!115003))

(declare-fun d!115005 () Bool)

(declare-fun e!535112 () Bool)

(assert (=> d!115005 e!535112))

(declare-fun c!99224 () Bool)

(assert (=> d!115005 (= c!99224 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!427930 () Unit!31871)

(declare-fun choose!1594 (array!57497 array!57495 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 64) Int) Unit!31871)

(assert (=> d!115005 (= lt!427930 (choose!1594 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)))))

(assert (=> d!115005 (validMask!0 (mask!27581 thiss!1141))))

(assert (=> d!115005 (= (lemmaKeyInListMapIsInArray!305 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)) lt!427930)))

(declare-fun b!950429 () Bool)

(assert (=> b!950429 (= e!535112 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950430 () Bool)

(assert (=> b!950430 (= e!535112 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115005 c!99224) b!950429))

(assert (= (and d!115005 (not c!99224)) b!950430))

(declare-fun m!882289 () Bool)

(assert (=> d!115005 m!882289))

(assert (=> d!115005 m!882137))

(assert (=> b!950429 m!882141))

(assert (=> b!950255 d!115005))

(declare-fun d!115007 () Bool)

(assert (=> d!115007 (= (array_inv!21516 (_keys!10716 thiss!1141)) (bvsge (size!28127 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950252 d!115007))

(declare-fun d!115009 () Bool)

(assert (=> d!115009 (= (array_inv!21517 (_values!5807 thiss!1141)) (bvsge (size!28126 (_values!5807 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950252 d!115009))

(declare-fun b!950437 () Bool)

(declare-fun e!535117 () Bool)

(assert (=> b!950437 (= e!535117 tp_is_empty!20755)))

(declare-fun mapIsEmpty!33056 () Bool)

(declare-fun mapRes!33056 () Bool)

(assert (=> mapIsEmpty!33056 mapRes!33056))

(declare-fun condMapEmpty!33056 () Bool)

(declare-fun mapDefault!33056 () ValueCell!9896)

(assert (=> mapNonEmpty!33047 (= condMapEmpty!33056 (= mapRest!33047 ((as const (Array (_ BitVec 32) ValueCell!9896)) mapDefault!33056)))))

(declare-fun e!535118 () Bool)

(assert (=> mapNonEmpty!33047 (= tp!63340 (and e!535118 mapRes!33056))))

(declare-fun mapNonEmpty!33056 () Bool)

(declare-fun tp!63356 () Bool)

(assert (=> mapNonEmpty!33056 (= mapRes!33056 (and tp!63356 e!535117))))

(declare-fun mapRest!33056 () (Array (_ BitVec 32) ValueCell!9896))

(declare-fun mapKey!33056 () (_ BitVec 32))

(declare-fun mapValue!33056 () ValueCell!9896)

(assert (=> mapNonEmpty!33056 (= mapRest!33047 (store mapRest!33056 mapKey!33056 mapValue!33056))))

(declare-fun b!950438 () Bool)

(assert (=> b!950438 (= e!535118 tp_is_empty!20755)))

(assert (= (and mapNonEmpty!33047 condMapEmpty!33056) mapIsEmpty!33056))

(assert (= (and mapNonEmpty!33047 (not condMapEmpty!33056)) mapNonEmpty!33056))

(assert (= (and mapNonEmpty!33056 ((_ is ValueCellFull!9896) mapValue!33056)) b!950437))

(assert (= (and mapNonEmpty!33047 ((_ is ValueCellFull!9896) mapDefault!33056)) b!950438))

(declare-fun m!882291 () Bool)

(assert (=> mapNonEmpty!33056 m!882291))

(declare-fun b_lambda!14355 () Bool)

(assert (= b_lambda!14353 (or (and b!950252 b_free!18247) b_lambda!14355)))

(check-sat (not b_next!18247) (not bm!41383) (not b!950375) (not d!114995) (not bm!41378) (not b!950390) (not b_lambda!14355) (not b!950385) b_and!29685 (not b!950327) (not b!950320) (not b!950373) (not mapNonEmpty!33056) (not b!950318) (not b!950429) (not d!114991) (not b!950418) (not b!950319) (not d!114993) (not b!950388) (not bm!41380) (not b!950407) (not b!950424) (not d!114997) (not d!115005) tp_is_empty!20755 (not b!950376) (not b!950379) (not bm!41379) (not b!950329) (not b!950381))
(check-sat b_and!29685 (not b_next!18247))
(get-model)

(declare-fun b!950451 () Bool)

(declare-fun e!535127 () SeekEntryResult!9143)

(assert (=> b!950451 (= e!535127 (MissingVacant!9143 (index!38945 lt!427923)))))

(declare-fun b!950452 () Bool)

(declare-fun e!535125 () SeekEntryResult!9143)

(assert (=> b!950452 (= e!535125 (Found!9143 (index!38945 lt!427923)))))

(declare-fun b!950453 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950453 (= e!535127 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81774 lt!427923) #b00000000000000000000000000000001) (nextIndex!0 (index!38945 lt!427923) (x!81774 lt!427923) (mask!27581 thiss!1141)) (index!38945 lt!427923) key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)))))

(declare-fun b!950454 () Bool)

(declare-fun e!535126 () SeekEntryResult!9143)

(assert (=> b!950454 (= e!535126 e!535125)))

(declare-fun c!99231 () Bool)

(declare-fun lt!427936 () (_ BitVec 64))

(assert (=> b!950454 (= c!99231 (= lt!427936 key!756))))

(declare-fun b!950455 () Bool)

(assert (=> b!950455 (= e!535126 Undefined!9143)))

(declare-fun d!115011 () Bool)

(declare-fun lt!427935 () SeekEntryResult!9143)

(assert (=> d!115011 (and (or ((_ is Undefined!9143) lt!427935) (not ((_ is Found!9143) lt!427935)) (and (bvsge (index!38944 lt!427935) #b00000000000000000000000000000000) (bvslt (index!38944 lt!427935) (size!28127 (_keys!10716 thiss!1141))))) (or ((_ is Undefined!9143) lt!427935) ((_ is Found!9143) lt!427935) (not ((_ is MissingVacant!9143) lt!427935)) (not (= (index!38946 lt!427935) (index!38945 lt!427923))) (and (bvsge (index!38946 lt!427935) #b00000000000000000000000000000000) (bvslt (index!38946 lt!427935) (size!28127 (_keys!10716 thiss!1141))))) (or ((_ is Undefined!9143) lt!427935) (ite ((_ is Found!9143) lt!427935) (= (select (arr!27648 (_keys!10716 thiss!1141)) (index!38944 lt!427935)) key!756) (and ((_ is MissingVacant!9143) lt!427935) (= (index!38946 lt!427935) (index!38945 lt!427923)) (= (select (arr!27648 (_keys!10716 thiss!1141)) (index!38946 lt!427935)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!115011 (= lt!427935 e!535126)))

(declare-fun c!99233 () Bool)

(assert (=> d!115011 (= c!99233 (bvsge (x!81774 lt!427923) #b01111111111111111111111111111110))))

(assert (=> d!115011 (= lt!427936 (select (arr!27648 (_keys!10716 thiss!1141)) (index!38945 lt!427923)))))

(assert (=> d!115011 (validMask!0 (mask!27581 thiss!1141))))

(assert (=> d!115011 (= (seekKeyOrZeroReturnVacant!0 (x!81774 lt!427923) (index!38945 lt!427923) (index!38945 lt!427923) key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)) lt!427935)))

(declare-fun b!950456 () Bool)

(declare-fun c!99232 () Bool)

(assert (=> b!950456 (= c!99232 (= lt!427936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950456 (= e!535125 e!535127)))

(assert (= (and d!115011 c!99233) b!950455))

(assert (= (and d!115011 (not c!99233)) b!950454))

(assert (= (and b!950454 c!99231) b!950452))

(assert (= (and b!950454 (not c!99231)) b!950456))

(assert (= (and b!950456 c!99232) b!950451))

(assert (= (and b!950456 (not c!99232)) b!950453))

(declare-fun m!882293 () Bool)

(assert (=> b!950453 m!882293))

(assert (=> b!950453 m!882293))

(declare-fun m!882295 () Bool)

(assert (=> b!950453 m!882295))

(declare-fun m!882297 () Bool)

(assert (=> d!115011 m!882297))

(declare-fun m!882299 () Bool)

(assert (=> d!115011 m!882299))

(assert (=> d!115011 m!882275))

(assert (=> d!115011 m!882137))

(assert (=> b!950407 d!115011))

(declare-fun b!950465 () Bool)

(declare-fun e!535134 () Bool)

(declare-fun call!41389 () Bool)

(assert (=> b!950465 (= e!535134 call!41389)))

(declare-fun b!950466 () Bool)

(declare-fun e!535135 () Bool)

(assert (=> b!950466 (= e!535135 e!535134)))

(declare-fun lt!427945 () (_ BitVec 64))

(assert (=> b!950466 (= lt!427945 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427944 () Unit!31871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57497 (_ BitVec 64) (_ BitVec 32)) Unit!31871)

(assert (=> b!950466 (= lt!427944 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10716 thiss!1141) lt!427945 #b00000000000000000000000000000000))))

(assert (=> b!950466 (arrayContainsKey!0 (_keys!10716 thiss!1141) lt!427945 #b00000000000000000000000000000000)))

(declare-fun lt!427943 () Unit!31871)

(assert (=> b!950466 (= lt!427943 lt!427944)))

(declare-fun res!637198 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57497 (_ BitVec 32)) SeekEntryResult!9143)

(assert (=> b!950466 (= res!637198 (= (seekEntryOrOpen!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) (_keys!10716 thiss!1141) (mask!27581 thiss!1141)) (Found!9143 #b00000000000000000000000000000000)))))

(assert (=> b!950466 (=> (not res!637198) (not e!535134))))

(declare-fun b!950467 () Bool)

(assert (=> b!950467 (= e!535135 call!41389)))

(declare-fun bm!41386 () Bool)

(assert (=> bm!41386 (= call!41389 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10716 thiss!1141) (mask!27581 thiss!1141)))))

(declare-fun b!950468 () Bool)

(declare-fun e!535136 () Bool)

(assert (=> b!950468 (= e!535136 e!535135)))

(declare-fun c!99236 () Bool)

(assert (=> b!950468 (= c!99236 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115013 () Bool)

(declare-fun res!637199 () Bool)

(assert (=> d!115013 (=> res!637199 e!535136)))

(assert (=> d!115013 (= res!637199 (bvsge #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(assert (=> d!115013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)) e!535136)))

(assert (= (and d!115013 (not res!637199)) b!950468))

(assert (= (and b!950468 c!99236) b!950466))

(assert (= (and b!950468 (not c!99236)) b!950467))

(assert (= (and b!950466 res!637198) b!950465))

(assert (= (or b!950465 b!950467) bm!41386))

(assert (=> b!950466 m!882221))

(declare-fun m!882301 () Bool)

(assert (=> b!950466 m!882301))

(declare-fun m!882303 () Bool)

(assert (=> b!950466 m!882303))

(assert (=> b!950466 m!882221))

(declare-fun m!882305 () Bool)

(assert (=> b!950466 m!882305))

(declare-fun m!882307 () Bool)

(assert (=> bm!41386 m!882307))

(assert (=> b!950468 m!882221))

(assert (=> b!950468 m!882221))

(assert (=> b!950468 m!882227))

(assert (=> b!950319 d!115013))

(declare-fun d!115015 () Bool)

(declare-fun lt!427946 () (_ BitVec 32))

(assert (=> d!115015 (and (or (bvslt lt!427946 #b00000000000000000000000000000000) (bvsge lt!427946 (size!28127 (_keys!10716 thiss!1141))) (and (bvsge lt!427946 #b00000000000000000000000000000000) (bvslt lt!427946 (size!28127 (_keys!10716 thiss!1141))))) (bvsge lt!427946 #b00000000000000000000000000000000) (bvslt lt!427946 (size!28127 (_keys!10716 thiss!1141))) (= (select (arr!27648 (_keys!10716 thiss!1141)) lt!427946) key!756))))

(declare-fun e!535137 () (_ BitVec 32))

(assert (=> d!115015 (= lt!427946 e!535137)))

(declare-fun c!99237 () Bool)

(assert (=> d!115015 (= c!99237 (= (select (arr!27648 (_keys!10716 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115015 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28127 (_keys!10716 thiss!1141))) (bvslt (size!28127 (_keys!10716 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115015 (= (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!427946)))

(declare-fun b!950469 () Bool)

(assert (=> b!950469 (= e!535137 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!950470 () Bool)

(assert (=> b!950470 (= e!535137 (arrayScanForKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115015 c!99237) b!950469))

(assert (= (and d!115015 (not c!99237)) b!950470))

(declare-fun m!882309 () Bool)

(assert (=> d!115015 m!882309))

(declare-fun m!882311 () Bool)

(assert (=> d!115015 m!882311))

(declare-fun m!882313 () Bool)

(assert (=> b!950470 m!882313))

(assert (=> b!950418 d!115015))

(declare-fun d!115017 () Bool)

(declare-fun get!14530 (Option!507) V!32639)

(assert (=> d!115017 (= (apply!872 lt!427894 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)) (get!14530 (getValueByKey!501 (toList!6159 lt!427894) (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26682 () Bool)

(assert (= bs!26682 d!115017))

(assert (=> bs!26682 m!882221))

(declare-fun m!882315 () Bool)

(assert (=> bs!26682 m!882315))

(assert (=> bs!26682 m!882315))

(declare-fun m!882317 () Bool)

(assert (=> bs!26682 m!882317))

(assert (=> b!950388 d!115017))

(declare-fun d!115019 () Bool)

(declare-fun c!99240 () Bool)

(assert (=> d!115019 (= c!99240 ((_ is ValueCellFull!9896) (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535140 () V!32639)

(assert (=> d!115019 (= (get!14529 (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1638 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!535140)))

(declare-fun b!950475 () Bool)

(declare-fun get!14531 (ValueCell!9896 V!32639) V!32639)

(assert (=> b!950475 (= e!535140 (get!14531 (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1638 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950476 () Bool)

(declare-fun get!14532 (ValueCell!9896 V!32639) V!32639)

(assert (=> b!950476 (= e!535140 (get!14532 (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1638 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115019 c!99240) b!950475))

(assert (= (and d!115019 (not c!99240)) b!950476))

(assert (=> b!950475 m!882215))

(assert (=> b!950475 m!882217))

(declare-fun m!882319 () Bool)

(assert (=> b!950475 m!882319))

(assert (=> b!950476 m!882215))

(assert (=> b!950476 m!882217))

(declare-fun m!882321 () Bool)

(assert (=> b!950476 m!882321))

(assert (=> b!950388 d!115019))

(declare-fun d!115021 () Bool)

(declare-fun lt!427949 () (_ BitVec 32))

(assert (=> d!115021 (and (bvsge lt!427949 #b00000000000000000000000000000000) (bvsle lt!427949 (bvsub (size!28127 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535145 () (_ BitVec 32))

(assert (=> d!115021 (= lt!427949 e!535145)))

(declare-fun c!99246 () Bool)

(assert (=> d!115021 (= c!99246 (bvsge #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(assert (=> d!115021 (and (bvsle #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28127 (_keys!10716 thiss!1141)) (size!28127 (_keys!10716 thiss!1141))))))

(assert (=> d!115021 (= (arrayCountValidKeys!0 (_keys!10716 thiss!1141) #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))) lt!427949)))

(declare-fun bm!41389 () Bool)

(declare-fun call!41392 () (_ BitVec 32))

(assert (=> bm!41389 (= call!41392 (arrayCountValidKeys!0 (_keys!10716 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun b!950485 () Bool)

(assert (=> b!950485 (= e!535145 #b00000000000000000000000000000000)))

(declare-fun b!950486 () Bool)

(declare-fun e!535146 () (_ BitVec 32))

(assert (=> b!950486 (= e!535146 call!41392)))

(declare-fun b!950487 () Bool)

(assert (=> b!950487 (= e!535145 e!535146)))

(declare-fun c!99245 () Bool)

(assert (=> b!950487 (= c!99245 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950488 () Bool)

(assert (=> b!950488 (= e!535146 (bvadd #b00000000000000000000000000000001 call!41392))))

(assert (= (and d!115021 c!99246) b!950485))

(assert (= (and d!115021 (not c!99246)) b!950487))

(assert (= (and b!950487 c!99245) b!950488))

(assert (= (and b!950487 (not c!99245)) b!950486))

(assert (= (or b!950488 b!950486) bm!41389))

(declare-fun m!882323 () Bool)

(assert (=> bm!41389 m!882323))

(assert (=> b!950487 m!882221))

(assert (=> b!950487 m!882221))

(assert (=> b!950487 m!882227))

(assert (=> b!950318 d!115021))

(declare-fun d!115023 () Bool)

(declare-fun e!535147 () Bool)

(assert (=> d!115023 e!535147))

(declare-fun res!637200 () Bool)

(assert (=> d!115023 (=> res!637200 e!535147)))

(declare-fun lt!427950 () Bool)

(assert (=> d!115023 (= res!637200 (not lt!427950))))

(declare-fun lt!427953 () Bool)

(assert (=> d!115023 (= lt!427950 lt!427953)))

(declare-fun lt!427952 () Unit!31871)

(declare-fun e!535148 () Unit!31871)

(assert (=> d!115023 (= lt!427952 e!535148)))

(declare-fun c!99247 () Bool)

(assert (=> d!115023 (= c!99247 lt!427953)))

(assert (=> d!115023 (= lt!427953 (containsKey!465 (toList!6159 lt!427894) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115023 (= (contains!5193 lt!427894 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427950)))

(declare-fun b!950489 () Bool)

(declare-fun lt!427951 () Unit!31871)

(assert (=> b!950489 (= e!535148 lt!427951)))

(assert (=> b!950489 (= lt!427951 (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6159 lt!427894) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950489 (isDefined!373 (getValueByKey!501 (toList!6159 lt!427894) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950490 () Bool)

(declare-fun Unit!31875 () Unit!31871)

(assert (=> b!950490 (= e!535148 Unit!31875)))

(declare-fun b!950491 () Bool)

(assert (=> b!950491 (= e!535147 (isDefined!373 (getValueByKey!501 (toList!6159 lt!427894) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115023 c!99247) b!950489))

(assert (= (and d!115023 (not c!99247)) b!950490))

(assert (= (and d!115023 (not res!637200)) b!950491))

(declare-fun m!882325 () Bool)

(assert (=> d!115023 m!882325))

(declare-fun m!882327 () Bool)

(assert (=> b!950489 m!882327))

(declare-fun m!882329 () Bool)

(assert (=> b!950489 m!882329))

(assert (=> b!950489 m!882329))

(declare-fun m!882331 () Bool)

(assert (=> b!950489 m!882331))

(assert (=> b!950491 m!882329))

(assert (=> b!950491 m!882329))

(assert (=> b!950491 m!882331))

(assert (=> bm!41378 d!115023))

(declare-fun d!115025 () Bool)

(declare-fun e!535151 () Bool)

(assert (=> d!115025 e!535151))

(declare-fun res!637205 () Bool)

(assert (=> d!115025 (=> (not res!637205) (not e!535151))))

(declare-fun lt!427965 () ListLongMap!12287)

(assert (=> d!115025 (= res!637205 (contains!5193 lt!427965 (_1!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(declare-fun lt!427963 () List!19346)

(assert (=> d!115025 (= lt!427965 (ListLongMap!12288 lt!427963))))

(declare-fun lt!427964 () Unit!31871)

(declare-fun lt!427962 () Unit!31871)

(assert (=> d!115025 (= lt!427964 lt!427962)))

(assert (=> d!115025 (= (getValueByKey!501 lt!427963 (_1!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!267 (List!19346 (_ BitVec 64) V!32639) Unit!31871)

(assert (=> d!115025 (= lt!427962 (lemmaContainsTupThenGetReturnValue!267 lt!427963 (_1!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(declare-fun insertStrictlySorted!324 (List!19346 (_ BitVec 64) V!32639) List!19346)

(assert (=> d!115025 (= lt!427963 (insertStrictlySorted!324 (toList!6159 call!41386) (_1!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(assert (=> d!115025 (= (+!2882 call!41386 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))) lt!427965)))

(declare-fun b!950496 () Bool)

(declare-fun res!637206 () Bool)

(assert (=> b!950496 (=> (not res!637206) (not e!535151))))

(assert (=> b!950496 (= res!637206 (= (getValueByKey!501 (toList!6159 lt!427965) (_1!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(declare-fun b!950497 () Bool)

(declare-fun contains!5194 (List!19346 tuple2!13600) Bool)

(assert (=> b!950497 (= e!535151 (contains!5194 (toList!6159 lt!427965) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))

(assert (= (and d!115025 res!637205) b!950496))

(assert (= (and b!950496 res!637206) b!950497))

(declare-fun m!882333 () Bool)

(assert (=> d!115025 m!882333))

(declare-fun m!882335 () Bool)

(assert (=> d!115025 m!882335))

(declare-fun m!882337 () Bool)

(assert (=> d!115025 m!882337))

(declare-fun m!882339 () Bool)

(assert (=> d!115025 m!882339))

(declare-fun m!882341 () Bool)

(assert (=> b!950496 m!882341))

(declare-fun m!882343 () Bool)

(assert (=> b!950497 m!882343))

(assert (=> b!950390 d!115025))

(declare-fun d!115027 () Bool)

(declare-fun res!637215 () Bool)

(declare-fun e!535163 () Bool)

(assert (=> d!115027 (=> res!637215 e!535163)))

(assert (=> d!115027 (= res!637215 (bvsge #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(assert (=> d!115027 (= (arrayNoDuplicates!0 (_keys!10716 thiss!1141) #b00000000000000000000000000000000 Nil!19344) e!535163)))

(declare-fun b!950508 () Bool)

(declare-fun e!535160 () Bool)

(declare-fun e!535162 () Bool)

(assert (=> b!950508 (= e!535160 e!535162)))

(declare-fun c!99250 () Bool)

(assert (=> b!950508 (= c!99250 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950509 () Bool)

(declare-fun e!535161 () Bool)

(declare-fun contains!5195 (List!19347 (_ BitVec 64)) Bool)

(assert (=> b!950509 (= e!535161 (contains!5195 Nil!19344 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950510 () Bool)

(assert (=> b!950510 (= e!535163 e!535160)))

(declare-fun res!637213 () Bool)

(assert (=> b!950510 (=> (not res!637213) (not e!535160))))

(assert (=> b!950510 (= res!637213 (not e!535161))))

(declare-fun res!637214 () Bool)

(assert (=> b!950510 (=> (not res!637214) (not e!535161))))

(assert (=> b!950510 (= res!637214 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41392 () Bool)

(declare-fun call!41395 () Bool)

(assert (=> bm!41392 (= call!41395 (arrayNoDuplicates!0 (_keys!10716 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99250 (Cons!19343 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) Nil!19344) Nil!19344)))))

(declare-fun b!950511 () Bool)

(assert (=> b!950511 (= e!535162 call!41395)))

(declare-fun b!950512 () Bool)

(assert (=> b!950512 (= e!535162 call!41395)))

(assert (= (and d!115027 (not res!637215)) b!950510))

(assert (= (and b!950510 res!637214) b!950509))

(assert (= (and b!950510 res!637213) b!950508))

(assert (= (and b!950508 c!99250) b!950511))

(assert (= (and b!950508 (not c!99250)) b!950512))

(assert (= (or b!950511 b!950512) bm!41392))

(assert (=> b!950508 m!882221))

(assert (=> b!950508 m!882221))

(assert (=> b!950508 m!882227))

(assert (=> b!950509 m!882221))

(assert (=> b!950509 m!882221))

(declare-fun m!882345 () Bool)

(assert (=> b!950509 m!882345))

(assert (=> b!950510 m!882221))

(assert (=> b!950510 m!882221))

(assert (=> b!950510 m!882227))

(assert (=> bm!41392 m!882221))

(declare-fun m!882347 () Bool)

(assert (=> bm!41392 m!882347))

(assert (=> b!950320 d!115027))

(declare-fun d!115029 () Bool)

(assert (=> d!115029 (= (apply!872 (+!2882 lt!427897 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))) lt!427898) (apply!872 lt!427897 lt!427898))))

(declare-fun lt!427968 () Unit!31871)

(declare-fun choose!1595 (ListLongMap!12287 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31871)

(assert (=> d!115029 (= lt!427968 (choose!1595 lt!427897 lt!427892 (zeroValue!5620 thiss!1141) lt!427898))))

(declare-fun e!535166 () Bool)

(assert (=> d!115029 e!535166))

(declare-fun res!637218 () Bool)

(assert (=> d!115029 (=> (not res!637218) (not e!535166))))

(assert (=> d!115029 (= res!637218 (contains!5193 lt!427897 lt!427898))))

(assert (=> d!115029 (= (addApplyDifferent!451 lt!427897 lt!427892 (zeroValue!5620 thiss!1141) lt!427898) lt!427968)))

(declare-fun b!950516 () Bool)

(assert (=> b!950516 (= e!535166 (not (= lt!427898 lt!427892)))))

(assert (= (and d!115029 res!637218) b!950516))

(declare-fun m!882349 () Bool)

(assert (=> d!115029 m!882349))

(declare-fun m!882351 () Bool)

(assert (=> d!115029 m!882351))

(assert (=> d!115029 m!882249))

(assert (=> d!115029 m!882243))

(assert (=> d!115029 m!882249))

(assert (=> d!115029 m!882251))

(assert (=> b!950375 d!115029))

(declare-fun d!115031 () Bool)

(assert (=> d!115031 (= (apply!872 lt!427902 lt!427906) (get!14530 (getValueByKey!501 (toList!6159 lt!427902) lt!427906)))))

(declare-fun bs!26683 () Bool)

(assert (= bs!26683 d!115031))

(declare-fun m!882353 () Bool)

(assert (=> bs!26683 m!882353))

(assert (=> bs!26683 m!882353))

(declare-fun m!882355 () Bool)

(assert (=> bs!26683 m!882355))

(assert (=> b!950375 d!115031))

(declare-fun d!115033 () Bool)

(assert (=> d!115033 (= (apply!872 (+!2882 lt!427893 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))) lt!427904) (get!14530 (getValueByKey!501 (toList!6159 (+!2882 lt!427893 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141)))) lt!427904)))))

(declare-fun bs!26684 () Bool)

(assert (= bs!26684 d!115033))

(declare-fun m!882357 () Bool)

(assert (=> bs!26684 m!882357))

(assert (=> bs!26684 m!882357))

(declare-fun m!882359 () Bool)

(assert (=> bs!26684 m!882359))

(assert (=> b!950375 d!115033))

(declare-fun d!115035 () Bool)

(assert (=> d!115035 (= (apply!872 (+!2882 lt!427897 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))) lt!427898) (get!14530 (getValueByKey!501 (toList!6159 (+!2882 lt!427897 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141)))) lt!427898)))))

(declare-fun bs!26685 () Bool)

(assert (= bs!26685 d!115035))

(declare-fun m!882361 () Bool)

(assert (=> bs!26685 m!882361))

(assert (=> bs!26685 m!882361))

(declare-fun m!882363 () Bool)

(assert (=> bs!26685 m!882363))

(assert (=> b!950375 d!115035))

(declare-fun d!115037 () Bool)

(declare-fun e!535167 () Bool)

(assert (=> d!115037 e!535167))

(declare-fun res!637219 () Bool)

(assert (=> d!115037 (=> (not res!637219) (not e!535167))))

(declare-fun lt!427972 () ListLongMap!12287)

(assert (=> d!115037 (= res!637219 (contains!5193 lt!427972 (_1!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141)))))))

(declare-fun lt!427970 () List!19346)

(assert (=> d!115037 (= lt!427972 (ListLongMap!12288 lt!427970))))

(declare-fun lt!427971 () Unit!31871)

(declare-fun lt!427969 () Unit!31871)

(assert (=> d!115037 (= lt!427971 lt!427969)))

(assert (=> d!115037 (= (getValueByKey!501 lt!427970 (_1!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115037 (= lt!427969 (lemmaContainsTupThenGetReturnValue!267 lt!427970 (_1!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115037 (= lt!427970 (insertStrictlySorted!324 (toList!6159 lt!427897) (_1!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115037 (= (+!2882 lt!427897 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))) lt!427972)))

(declare-fun b!950517 () Bool)

(declare-fun res!637220 () Bool)

(assert (=> b!950517 (=> (not res!637220) (not e!535167))))

(assert (=> b!950517 (= res!637220 (= (getValueByKey!501 (toList!6159 lt!427972) (_1!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))))))))

(declare-fun b!950518 () Bool)

(assert (=> b!950518 (= e!535167 (contains!5194 (toList!6159 lt!427972) (tuple2!13601 lt!427892 (zeroValue!5620 thiss!1141))))))

(assert (= (and d!115037 res!637219) b!950517))

(assert (= (and b!950517 res!637220) b!950518))

(declare-fun m!882365 () Bool)

(assert (=> d!115037 m!882365))

(declare-fun m!882367 () Bool)

(assert (=> d!115037 m!882367))

(declare-fun m!882369 () Bool)

(assert (=> d!115037 m!882369))

(declare-fun m!882371 () Bool)

(assert (=> d!115037 m!882371))

(declare-fun m!882373 () Bool)

(assert (=> b!950517 m!882373))

(declare-fun m!882375 () Bool)

(assert (=> b!950518 m!882375))

(assert (=> b!950375 d!115037))

(declare-fun d!115039 () Bool)

(declare-fun e!535168 () Bool)

(assert (=> d!115039 e!535168))

(declare-fun res!637221 () Bool)

(assert (=> d!115039 (=> (not res!637221) (not e!535168))))

(declare-fun lt!427976 () ListLongMap!12287)

(assert (=> d!115039 (= res!637221 (contains!5193 lt!427976 (_1!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))))))

(declare-fun lt!427974 () List!19346)

(assert (=> d!115039 (= lt!427976 (ListLongMap!12288 lt!427974))))

(declare-fun lt!427975 () Unit!31871)

(declare-fun lt!427973 () Unit!31871)

(assert (=> d!115039 (= lt!427975 lt!427973)))

(assert (=> d!115039 (= (getValueByKey!501 lt!427974 (_1!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115039 (= lt!427973 (lemmaContainsTupThenGetReturnValue!267 lt!427974 (_1!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115039 (= lt!427974 (insertStrictlySorted!324 (toList!6159 lt!427912) (_1!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115039 (= (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))) lt!427976)))

(declare-fun b!950519 () Bool)

(declare-fun res!637222 () Bool)

(assert (=> b!950519 (=> (not res!637222) (not e!535168))))

(assert (=> b!950519 (= res!637222 (= (getValueByKey!501 (toList!6159 lt!427976) (_1!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))))))))

(declare-fun b!950520 () Bool)

(assert (=> b!950520 (= e!535168 (contains!5194 (toList!6159 lt!427976) (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))))))

(assert (= (and d!115039 res!637221) b!950519))

(assert (= (and b!950519 res!637222) b!950520))

(declare-fun m!882377 () Bool)

(assert (=> d!115039 m!882377))

(declare-fun m!882379 () Bool)

(assert (=> d!115039 m!882379))

(declare-fun m!882381 () Bool)

(assert (=> d!115039 m!882381))

(declare-fun m!882383 () Bool)

(assert (=> d!115039 m!882383))

(declare-fun m!882385 () Bool)

(assert (=> b!950519 m!882385))

(declare-fun m!882387 () Bool)

(assert (=> b!950520 m!882387))

(assert (=> b!950375 d!115039))

(declare-fun d!115041 () Bool)

(assert (=> d!115041 (= (apply!872 lt!427893 lt!427904) (get!14530 (getValueByKey!501 (toList!6159 lt!427893) lt!427904)))))

(declare-fun bs!26686 () Bool)

(assert (= bs!26686 d!115041))

(declare-fun m!882389 () Bool)

(assert (=> bs!26686 m!882389))

(assert (=> bs!26686 m!882389))

(declare-fun m!882391 () Bool)

(assert (=> bs!26686 m!882391))

(assert (=> b!950375 d!115041))

(declare-fun d!115043 () Bool)

(assert (=> d!115043 (= (apply!872 (+!2882 lt!427902 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))) lt!427906) (get!14530 (getValueByKey!501 (toList!6159 (+!2882 lt!427902 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141)))) lt!427906)))))

(declare-fun bs!26687 () Bool)

(assert (= bs!26687 d!115043))

(declare-fun m!882393 () Bool)

(assert (=> bs!26687 m!882393))

(assert (=> bs!26687 m!882393))

(declare-fun m!882395 () Bool)

(assert (=> bs!26687 m!882395))

(assert (=> b!950375 d!115043))

(declare-fun d!115045 () Bool)

(assert (=> d!115045 (= (apply!872 lt!427897 lt!427898) (get!14530 (getValueByKey!501 (toList!6159 lt!427897) lt!427898)))))

(declare-fun bs!26688 () Bool)

(assert (= bs!26688 d!115045))

(declare-fun m!882397 () Bool)

(assert (=> bs!26688 m!882397))

(assert (=> bs!26688 m!882397))

(declare-fun m!882399 () Bool)

(assert (=> bs!26688 m!882399))

(assert (=> b!950375 d!115045))

(declare-fun d!115047 () Bool)

(declare-fun e!535169 () Bool)

(assert (=> d!115047 e!535169))

(declare-fun res!637223 () Bool)

(assert (=> d!115047 (=> (not res!637223) (not e!535169))))

(declare-fun lt!427980 () ListLongMap!12287)

(assert (=> d!115047 (= res!637223 (contains!5193 lt!427980 (_1!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141)))))))

(declare-fun lt!427978 () List!19346)

(assert (=> d!115047 (= lt!427980 (ListLongMap!12288 lt!427978))))

(declare-fun lt!427979 () Unit!31871)

(declare-fun lt!427977 () Unit!31871)

(assert (=> d!115047 (= lt!427979 lt!427977)))

(assert (=> d!115047 (= (getValueByKey!501 lt!427978 (_1!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141)))))))

(assert (=> d!115047 (= lt!427977 (lemmaContainsTupThenGetReturnValue!267 lt!427978 (_1!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141)))))))

(assert (=> d!115047 (= lt!427978 (insertStrictlySorted!324 (toList!6159 lt!427893) (_1!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141)))))))

(assert (=> d!115047 (= (+!2882 lt!427893 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))) lt!427980)))

(declare-fun b!950521 () Bool)

(declare-fun res!637224 () Bool)

(assert (=> b!950521 (=> (not res!637224) (not e!535169))))

(assert (=> b!950521 (= res!637224 (= (getValueByKey!501 (toList!6159 lt!427980) (_1!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))))))))

(declare-fun b!950522 () Bool)

(assert (=> b!950522 (= e!535169 (contains!5194 (toList!6159 lt!427980) (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))))))

(assert (= (and d!115047 res!637223) b!950521))

(assert (= (and b!950521 res!637224) b!950522))

(declare-fun m!882401 () Bool)

(assert (=> d!115047 m!882401))

(declare-fun m!882403 () Bool)

(assert (=> d!115047 m!882403))

(declare-fun m!882405 () Bool)

(assert (=> d!115047 m!882405))

(declare-fun m!882407 () Bool)

(assert (=> d!115047 m!882407))

(declare-fun m!882409 () Bool)

(assert (=> b!950521 m!882409))

(declare-fun m!882411 () Bool)

(assert (=> b!950522 m!882411))

(assert (=> b!950375 d!115047))

(declare-fun d!115049 () Bool)

(declare-fun e!535170 () Bool)

(assert (=> d!115049 e!535170))

(declare-fun res!637225 () Bool)

(assert (=> d!115049 (=> res!637225 e!535170)))

(declare-fun lt!427981 () Bool)

(assert (=> d!115049 (= res!637225 (not lt!427981))))

(declare-fun lt!427984 () Bool)

(assert (=> d!115049 (= lt!427981 lt!427984)))

(declare-fun lt!427983 () Unit!31871)

(declare-fun e!535171 () Unit!31871)

(assert (=> d!115049 (= lt!427983 e!535171)))

(declare-fun c!99251 () Bool)

(assert (=> d!115049 (= c!99251 lt!427984)))

(assert (=> d!115049 (= lt!427984 (containsKey!465 (toList!6159 (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))) lt!427908))))

(assert (=> d!115049 (= (contains!5193 (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))) lt!427908) lt!427981)))

(declare-fun b!950523 () Bool)

(declare-fun lt!427982 () Unit!31871)

(assert (=> b!950523 (= e!535171 lt!427982)))

(assert (=> b!950523 (= lt!427982 (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6159 (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))) lt!427908))))

(assert (=> b!950523 (isDefined!373 (getValueByKey!501 (toList!6159 (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))) lt!427908))))

(declare-fun b!950524 () Bool)

(declare-fun Unit!31876 () Unit!31871)

(assert (=> b!950524 (= e!535171 Unit!31876)))

(declare-fun b!950525 () Bool)

(assert (=> b!950525 (= e!535170 (isDefined!373 (getValueByKey!501 (toList!6159 (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141)))) lt!427908)))))

(assert (= (and d!115049 c!99251) b!950523))

(assert (= (and d!115049 (not c!99251)) b!950524))

(assert (= (and d!115049 (not res!637225)) b!950525))

(declare-fun m!882413 () Bool)

(assert (=> d!115049 m!882413))

(declare-fun m!882415 () Bool)

(assert (=> b!950523 m!882415))

(declare-fun m!882417 () Bool)

(assert (=> b!950523 m!882417))

(assert (=> b!950523 m!882417))

(declare-fun m!882419 () Bool)

(assert (=> b!950523 m!882419))

(assert (=> b!950525 m!882417))

(assert (=> b!950525 m!882417))

(assert (=> b!950525 m!882419))

(assert (=> b!950375 d!115049))

(declare-fun d!115051 () Bool)

(assert (=> d!115051 (contains!5193 (+!2882 lt!427912 (tuple2!13601 lt!427901 (zeroValue!5620 thiss!1141))) lt!427908)))

(declare-fun lt!427987 () Unit!31871)

(declare-fun choose!1596 (ListLongMap!12287 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31871)

(assert (=> d!115051 (= lt!427987 (choose!1596 lt!427912 lt!427901 (zeroValue!5620 thiss!1141) lt!427908))))

(assert (=> d!115051 (contains!5193 lt!427912 lt!427908)))

(assert (=> d!115051 (= (addStillContains!571 lt!427912 lt!427901 (zeroValue!5620 thiss!1141) lt!427908) lt!427987)))

(declare-fun bs!26689 () Bool)

(assert (= bs!26689 d!115051))

(assert (=> bs!26689 m!882239))

(assert (=> bs!26689 m!882239))

(assert (=> bs!26689 m!882253))

(declare-fun m!882421 () Bool)

(assert (=> bs!26689 m!882421))

(declare-fun m!882423 () Bool)

(assert (=> bs!26689 m!882423))

(assert (=> b!950375 d!115051))

(declare-fun b!950551 () Bool)

(declare-fun lt!428008 () Unit!31871)

(declare-fun lt!428004 () Unit!31871)

(assert (=> b!950551 (= lt!428008 lt!428004)))

(declare-fun lt!428002 () ListLongMap!12287)

(declare-fun lt!428005 () V!32639)

(declare-fun lt!428003 () (_ BitVec 64))

(declare-fun lt!428006 () (_ BitVec 64))

(assert (=> b!950551 (not (contains!5193 (+!2882 lt!428002 (tuple2!13601 lt!428003 lt!428005)) lt!428006))))

(declare-fun addStillNotContains!228 (ListLongMap!12287 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31871)

(assert (=> b!950551 (= lt!428004 (addStillNotContains!228 lt!428002 lt!428003 lt!428005 lt!428006))))

(assert (=> b!950551 (= lt!428006 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!950551 (= lt!428005 (get!14529 (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1638 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!950551 (= lt!428003 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun call!41398 () ListLongMap!12287)

(assert (=> b!950551 (= lt!428002 call!41398)))

(declare-fun e!535186 () ListLongMap!12287)

(assert (=> b!950551 (= e!535186 (+!2882 call!41398 (tuple2!13601 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) (get!14529 (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1638 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!950552 () Bool)

(assert (=> b!950552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(assert (=> b!950552 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28126 (_values!5807 thiss!1141))))))

(declare-fun e!535188 () Bool)

(declare-fun lt!428007 () ListLongMap!12287)

(assert (=> b!950552 (= e!535188 (= (apply!872 lt!428007 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)) (get!14529 (select (arr!27647 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1638 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950553 () Bool)

(declare-fun e!535189 () Bool)

(declare-fun e!535192 () Bool)

(assert (=> b!950553 (= e!535189 e!535192)))

(declare-fun c!99262 () Bool)

(declare-fun e!535191 () Bool)

(assert (=> b!950553 (= c!99262 e!535191)))

(declare-fun res!637236 () Bool)

(assert (=> b!950553 (=> (not res!637236) (not e!535191))))

(assert (=> b!950553 (= res!637236 (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun b!950554 () Bool)

(assert (=> b!950554 (= e!535192 e!535188)))

(assert (=> b!950554 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun res!637234 () Bool)

(assert (=> b!950554 (= res!637234 (contains!5193 lt!428007 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950554 (=> (not res!637234) (not e!535188))))

(declare-fun b!950555 () Bool)

(declare-fun e!535187 () Bool)

(assert (=> b!950555 (= e!535192 e!535187)))

(declare-fun c!99263 () Bool)

(assert (=> b!950555 (= c!99263 (bvslt #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun b!950556 () Bool)

(declare-fun res!637237 () Bool)

(assert (=> b!950556 (=> (not res!637237) (not e!535189))))

(assert (=> b!950556 (= res!637237 (not (contains!5193 lt!428007 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950557 () Bool)

(assert (=> b!950557 (= e!535186 call!41398)))

(declare-fun b!950558 () Bool)

(declare-fun e!535190 () ListLongMap!12287)

(assert (=> b!950558 (= e!535190 (ListLongMap!12288 Nil!19343))))

(declare-fun b!950559 () Bool)

(assert (=> b!950559 (= e!535191 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950559 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!115053 () Bool)

(assert (=> d!115053 e!535189))

(declare-fun res!637235 () Bool)

(assert (=> d!115053 (=> (not res!637235) (not e!535189))))

(assert (=> d!115053 (= res!637235 (not (contains!5193 lt!428007 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115053 (= lt!428007 e!535190)))

(declare-fun c!99260 () Bool)

(assert (=> d!115053 (= c!99260 (bvsge #b00000000000000000000000000000000 (size!28127 (_keys!10716 thiss!1141))))))

(assert (=> d!115053 (validMask!0 (mask!27581 thiss!1141))))

(assert (=> d!115053 (= (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) lt!428007)))

(declare-fun b!950560 () Bool)

(declare-fun isEmpty!717 (ListLongMap!12287) Bool)

(assert (=> b!950560 (= e!535187 (isEmpty!717 lt!428007))))

(declare-fun b!950561 () Bool)

(assert (=> b!950561 (= e!535190 e!535186)))

(declare-fun c!99261 () Bool)

(assert (=> b!950561 (= c!99261 (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41395 () Bool)

(assert (=> bm!41395 (= call!41398 (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5784 thiss!1141)))))

(declare-fun b!950562 () Bool)

(assert (=> b!950562 (= e!535187 (= lt!428007 (getCurrentListMapNoExtraKeys!3354 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5784 thiss!1141))))))

(assert (= (and d!115053 c!99260) b!950558))

(assert (= (and d!115053 (not c!99260)) b!950561))

(assert (= (and b!950561 c!99261) b!950551))

(assert (= (and b!950561 (not c!99261)) b!950557))

(assert (= (or b!950551 b!950557) bm!41395))

(assert (= (and d!115053 res!637235) b!950556))

(assert (= (and b!950556 res!637237) b!950553))

(assert (= (and b!950553 res!637236) b!950559))

(assert (= (and b!950553 c!99262) b!950554))

(assert (= (and b!950553 (not c!99262)) b!950555))

(assert (= (and b!950554 res!637234) b!950552))

(assert (= (and b!950555 c!99263) b!950562))

(assert (= (and b!950555 (not c!99263)) b!950560))

(declare-fun b_lambda!14357 () Bool)

(assert (=> (not b_lambda!14357) (not b!950551)))

(assert (=> b!950551 t!27680))

(declare-fun b_and!29687 () Bool)

(assert (= b_and!29685 (and (=> t!27680 result!12293) b_and!29687)))

(declare-fun b_lambda!14359 () Bool)

(assert (=> (not b_lambda!14359) (not b!950552)))

(assert (=> b!950552 t!27680))

(declare-fun b_and!29689 () Bool)

(assert (= b_and!29687 (and (=> t!27680 result!12293) b_and!29689)))

(declare-fun m!882425 () Bool)

(assert (=> bm!41395 m!882425))

(declare-fun m!882427 () Bool)

(assert (=> b!950560 m!882427))

(assert (=> b!950552 m!882215))

(assert (=> b!950552 m!882217))

(assert (=> b!950552 m!882219))

(assert (=> b!950552 m!882221))

(declare-fun m!882429 () Bool)

(assert (=> b!950552 m!882429))

(assert (=> b!950552 m!882217))

(assert (=> b!950552 m!882215))

(assert (=> b!950552 m!882221))

(assert (=> b!950551 m!882215))

(assert (=> b!950551 m!882217))

(assert (=> b!950551 m!882219))

(declare-fun m!882431 () Bool)

(assert (=> b!950551 m!882431))

(assert (=> b!950551 m!882217))

(assert (=> b!950551 m!882431))

(declare-fun m!882433 () Bool)

(assert (=> b!950551 m!882433))

(assert (=> b!950551 m!882215))

(declare-fun m!882435 () Bool)

(assert (=> b!950551 m!882435))

(assert (=> b!950551 m!882221))

(declare-fun m!882437 () Bool)

(assert (=> b!950551 m!882437))

(declare-fun m!882439 () Bool)

(assert (=> d!115053 m!882439))

(assert (=> d!115053 m!882137))

(declare-fun m!882441 () Bool)

(assert (=> b!950556 m!882441))

(assert (=> b!950559 m!882221))

(assert (=> b!950559 m!882221))

(assert (=> b!950559 m!882227))

(assert (=> b!950562 m!882425))

(assert (=> b!950561 m!882221))

(assert (=> b!950561 m!882221))

(assert (=> b!950561 m!882227))

(assert (=> b!950554 m!882221))

(assert (=> b!950554 m!882221))

(declare-fun m!882443 () Bool)

(assert (=> b!950554 m!882443))

(assert (=> b!950375 d!115053))

(declare-fun d!115055 () Bool)

(assert (=> d!115055 (= (apply!872 (+!2882 lt!427902 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))) lt!427906) (apply!872 lt!427902 lt!427906))))

(declare-fun lt!428009 () Unit!31871)

(assert (=> d!115055 (= lt!428009 (choose!1595 lt!427902 lt!427903 (minValue!5620 thiss!1141) lt!427906))))

(declare-fun e!535193 () Bool)

(assert (=> d!115055 e!535193))

(declare-fun res!637238 () Bool)

(assert (=> d!115055 (=> (not res!637238) (not e!535193))))

(assert (=> d!115055 (= res!637238 (contains!5193 lt!427902 lt!427906))))

(assert (=> d!115055 (= (addApplyDifferent!451 lt!427902 lt!427903 (minValue!5620 thiss!1141) lt!427906) lt!428009)))

(declare-fun b!950563 () Bool)

(assert (=> b!950563 (= e!535193 (not (= lt!427906 lt!427903)))))

(assert (= (and d!115055 res!637238) b!950563))

(declare-fun m!882445 () Bool)

(assert (=> d!115055 m!882445))

(declare-fun m!882447 () Bool)

(assert (=> d!115055 m!882447))

(assert (=> d!115055 m!882231))

(assert (=> d!115055 m!882245))

(assert (=> d!115055 m!882231))

(assert (=> d!115055 m!882235))

(assert (=> b!950375 d!115055))

(declare-fun d!115057 () Bool)

(declare-fun e!535194 () Bool)

(assert (=> d!115057 e!535194))

(declare-fun res!637239 () Bool)

(assert (=> d!115057 (=> (not res!637239) (not e!535194))))

(declare-fun lt!428013 () ListLongMap!12287)

(assert (=> d!115057 (= res!637239 (contains!5193 lt!428013 (_1!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141)))))))

(declare-fun lt!428011 () List!19346)

(assert (=> d!115057 (= lt!428013 (ListLongMap!12288 lt!428011))))

(declare-fun lt!428012 () Unit!31871)

(declare-fun lt!428010 () Unit!31871)

(assert (=> d!115057 (= lt!428012 lt!428010)))

(assert (=> d!115057 (= (getValueByKey!501 lt!428011 (_1!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141)))))))

(assert (=> d!115057 (= lt!428010 (lemmaContainsTupThenGetReturnValue!267 lt!428011 (_1!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141)))))))

(assert (=> d!115057 (= lt!428011 (insertStrictlySorted!324 (toList!6159 lt!427902) (_1!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))) (_2!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141)))))))

(assert (=> d!115057 (= (+!2882 lt!427902 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))) lt!428013)))

(declare-fun b!950564 () Bool)

(declare-fun res!637240 () Bool)

(assert (=> b!950564 (=> (not res!637240) (not e!535194))))

(assert (=> b!950564 (= res!637240 (= (getValueByKey!501 (toList!6159 lt!428013) (_1!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141)))) (Some!506 (_2!6811 (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))))))))

(declare-fun b!950565 () Bool)

(assert (=> b!950565 (= e!535194 (contains!5194 (toList!6159 lt!428013) (tuple2!13601 lt!427903 (minValue!5620 thiss!1141))))))

(assert (= (and d!115057 res!637239) b!950564))

(assert (= (and b!950564 res!637240) b!950565))

(declare-fun m!882449 () Bool)

(assert (=> d!115057 m!882449))

(declare-fun m!882451 () Bool)

(assert (=> d!115057 m!882451))

(declare-fun m!882453 () Bool)

(assert (=> d!115057 m!882453))

(declare-fun m!882455 () Bool)

(assert (=> d!115057 m!882455))

(declare-fun m!882457 () Bool)

(assert (=> b!950564 m!882457))

(declare-fun m!882459 () Bool)

(assert (=> b!950565 m!882459))

(assert (=> b!950375 d!115057))

(declare-fun d!115059 () Bool)

(assert (=> d!115059 (= (apply!872 (+!2882 lt!427893 (tuple2!13601 lt!427910 (minValue!5620 thiss!1141))) lt!427904) (apply!872 lt!427893 lt!427904))))

(declare-fun lt!428014 () Unit!31871)

(assert (=> d!115059 (= lt!428014 (choose!1595 lt!427893 lt!427910 (minValue!5620 thiss!1141) lt!427904))))

(declare-fun e!535195 () Bool)

(assert (=> d!115059 e!535195))

(declare-fun res!637241 () Bool)

(assert (=> d!115059 (=> (not res!637241) (not e!535195))))

(assert (=> d!115059 (= res!637241 (contains!5193 lt!427893 lt!427904))))

(assert (=> d!115059 (= (addApplyDifferent!451 lt!427893 lt!427910 (minValue!5620 thiss!1141) lt!427904) lt!428014)))

(declare-fun b!950566 () Bool)

(assert (=> b!950566 (= e!535195 (not (= lt!427904 lt!427910)))))

(assert (= (and d!115059 res!637241) b!950566))

(declare-fun m!882461 () Bool)

(assert (=> d!115059 m!882461))

(declare-fun m!882463 () Bool)

(assert (=> d!115059 m!882463))

(assert (=> d!115059 m!882257))

(assert (=> d!115059 m!882255))

(assert (=> d!115059 m!882257))

(assert (=> d!115059 m!882259))

(assert (=> b!950375 d!115059))

(declare-fun d!115061 () Bool)

(declare-fun e!535196 () Bool)

(assert (=> d!115061 e!535196))

(declare-fun res!637242 () Bool)

(assert (=> d!115061 (=> res!637242 e!535196)))

(declare-fun lt!428015 () Bool)

(assert (=> d!115061 (= res!637242 (not lt!428015))))

(declare-fun lt!428018 () Bool)

(assert (=> d!115061 (= lt!428015 lt!428018)))

(declare-fun lt!428017 () Unit!31871)

(declare-fun e!535197 () Unit!31871)

(assert (=> d!115061 (= lt!428017 e!535197)))

(declare-fun c!99264 () Bool)

(assert (=> d!115061 (= c!99264 lt!428018)))

(assert (=> d!115061 (= lt!428018 (containsKey!465 (toList!6159 lt!427894) (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115061 (= (contains!5193 lt!427894 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)) lt!428015)))

(declare-fun b!950567 () Bool)

(declare-fun lt!428016 () Unit!31871)

(assert (=> b!950567 (= e!535197 lt!428016)))

(assert (=> b!950567 (= lt!428016 (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6159 lt!427894) (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950567 (isDefined!373 (getValueByKey!501 (toList!6159 lt!427894) (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950568 () Bool)

(declare-fun Unit!31877 () Unit!31871)

(assert (=> b!950568 (= e!535197 Unit!31877)))

(declare-fun b!950569 () Bool)

(assert (=> b!950569 (= e!535196 (isDefined!373 (getValueByKey!501 (toList!6159 lt!427894) (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115061 c!99264) b!950567))

(assert (= (and d!115061 (not c!99264)) b!950568))

(assert (= (and d!115061 (not res!637242)) b!950569))

(assert (=> d!115061 m!882221))

(declare-fun m!882465 () Bool)

(assert (=> d!115061 m!882465))

(assert (=> b!950567 m!882221))

(declare-fun m!882467 () Bool)

(assert (=> b!950567 m!882467))

(assert (=> b!950567 m!882221))

(assert (=> b!950567 m!882315))

(assert (=> b!950567 m!882315))

(declare-fun m!882469 () Bool)

(assert (=> b!950567 m!882469))

(assert (=> b!950569 m!882221))

(assert (=> b!950569 m!882315))

(assert (=> b!950569 m!882315))

(assert (=> b!950569 m!882469))

(assert (=> b!950376 d!115061))

(declare-fun d!115063 () Bool)

(assert (=> d!115063 (isDefined!373 (getValueByKey!501 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-fun lt!428021 () Unit!31871)

(declare-fun choose!1597 (List!19346 (_ BitVec 64)) Unit!31871)

(assert (=> d!115063 (= lt!428021 (choose!1597 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-fun e!535200 () Bool)

(assert (=> d!115063 e!535200))

(declare-fun res!637245 () Bool)

(assert (=> d!115063 (=> (not res!637245) (not e!535200))))

(declare-fun isStrictlySorted!508 (List!19346) Bool)

(assert (=> d!115063 (= res!637245 (isStrictlySorted!508 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))))

(assert (=> d!115063 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756) lt!428021)))

(declare-fun b!950572 () Bool)

(assert (=> b!950572 (= e!535200 (containsKey!465 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(assert (= (and d!115063 res!637245) b!950572))

(assert (=> d!115063 m!882211))

(assert (=> d!115063 m!882211))

(assert (=> d!115063 m!882213))

(declare-fun m!882471 () Bool)

(assert (=> d!115063 m!882471))

(declare-fun m!882473 () Bool)

(assert (=> d!115063 m!882473))

(assert (=> b!950572 m!882207))

(assert (=> b!950327 d!115063))

(declare-fun d!115065 () Bool)

(declare-fun isEmpty!718 (Option!507) Bool)

(assert (=> d!115065 (= (isDefined!373 (getValueByKey!501 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756)) (not (isEmpty!718 (getValueByKey!501 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))))

(declare-fun bs!26690 () Bool)

(assert (= bs!26690 d!115065))

(assert (=> bs!26690 m!882211))

(declare-fun m!882475 () Bool)

(assert (=> bs!26690 m!882475))

(assert (=> b!950327 d!115065))

(declare-fun b!950584 () Bool)

(declare-fun e!535206 () Option!507)

(assert (=> b!950584 (= e!535206 None!505)))

(declare-fun b!950581 () Bool)

(declare-fun e!535205 () Option!507)

(assert (=> b!950581 (= e!535205 (Some!506 (_2!6811 (h!20502 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))))))

(declare-fun d!115067 () Bool)

(declare-fun c!99269 () Bool)

(assert (=> d!115067 (= c!99269 (and ((_ is Cons!19342) (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (= (_1!6811 (h!20502 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)))))

(assert (=> d!115067 (= (getValueByKey!501 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756) e!535205)))

(declare-fun b!950583 () Bool)

(assert (=> b!950583 (= e!535206 (getValueByKey!501 (t!27678 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) key!756))))

(declare-fun b!950582 () Bool)

(assert (=> b!950582 (= e!535205 e!535206)))

(declare-fun c!99270 () Bool)

(assert (=> b!950582 (= c!99270 (and ((_ is Cons!19342) (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (not (= (_1!6811 (h!20502 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756))))))

(assert (= (and d!115067 c!99269) b!950581))

(assert (= (and d!115067 (not c!99269)) b!950582))

(assert (= (and b!950582 c!99270) b!950583))

(assert (= (and b!950582 (not c!99270)) b!950584))

(declare-fun m!882477 () Bool)

(assert (=> b!950583 m!882477))

(assert (=> b!950327 d!115067))

(assert (=> d!114995 d!114999))

(declare-fun b!950603 () Bool)

(declare-fun e!535220 () Bool)

(declare-fun lt!428026 () SeekEntryResult!9143)

(assert (=> b!950603 (= e!535220 (bvsge (x!81774 lt!428026) #b01111111111111111111111111111110))))

(declare-fun b!950604 () Bool)

(declare-fun e!535218 () SeekEntryResult!9143)

(assert (=> b!950604 (= e!535218 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27581 thiss!1141)) #b00000000000000000000000000000000 (mask!27581 thiss!1141)) key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)))))

(declare-fun b!950605 () Bool)

(declare-fun e!535217 () SeekEntryResult!9143)

(assert (=> b!950605 (= e!535217 e!535218)))

(declare-fun c!99277 () Bool)

(declare-fun lt!428027 () (_ BitVec 64))

(assert (=> b!950605 (= c!99277 (or (= lt!428027 key!756) (= (bvadd lt!428027 lt!428027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950606 () Bool)

(assert (=> b!950606 (= e!535218 (Intermediate!9143 false (toIndex!0 key!756 (mask!27581 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!950607 () Bool)

(declare-fun e!535219 () Bool)

(assert (=> b!950607 (= e!535220 e!535219)))

(declare-fun res!637253 () Bool)

(assert (=> b!950607 (= res!637253 (and ((_ is Intermediate!9143) lt!428026) (not (undefined!9955 lt!428026)) (bvslt (x!81774 lt!428026) #b01111111111111111111111111111110) (bvsge (x!81774 lt!428026) #b00000000000000000000000000000000) (bvsge (x!81774 lt!428026) #b00000000000000000000000000000000)))))

(assert (=> b!950607 (=> (not res!637253) (not e!535219))))

(declare-fun d!115069 () Bool)

(assert (=> d!115069 e!535220))

(declare-fun c!99278 () Bool)

(assert (=> d!115069 (= c!99278 (and ((_ is Intermediate!9143) lt!428026) (undefined!9955 lt!428026)))))

(assert (=> d!115069 (= lt!428026 e!535217)))

(declare-fun c!99279 () Bool)

(assert (=> d!115069 (= c!99279 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!115069 (= lt!428027 (select (arr!27648 (_keys!10716 thiss!1141)) (toIndex!0 key!756 (mask!27581 thiss!1141))))))

(assert (=> d!115069 (validMask!0 (mask!27581 thiss!1141))))

(assert (=> d!115069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27581 thiss!1141)) key!756 (_keys!10716 thiss!1141) (mask!27581 thiss!1141)) lt!428026)))

(declare-fun b!950608 () Bool)

(assert (=> b!950608 (and (bvsge (index!38945 lt!428026) #b00000000000000000000000000000000) (bvslt (index!38945 lt!428026) (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun e!535221 () Bool)

(assert (=> b!950608 (= e!535221 (= (select (arr!27648 (_keys!10716 thiss!1141)) (index!38945 lt!428026)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950609 () Bool)

(assert (=> b!950609 (= e!535217 (Intermediate!9143 true (toIndex!0 key!756 (mask!27581 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!950610 () Bool)

(assert (=> b!950610 (and (bvsge (index!38945 lt!428026) #b00000000000000000000000000000000) (bvslt (index!38945 lt!428026) (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun res!637252 () Bool)

(assert (=> b!950610 (= res!637252 (= (select (arr!27648 (_keys!10716 thiss!1141)) (index!38945 lt!428026)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950610 (=> res!637252 e!535221)))

(declare-fun b!950611 () Bool)

(assert (=> b!950611 (and (bvsge (index!38945 lt!428026) #b00000000000000000000000000000000) (bvslt (index!38945 lt!428026) (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun res!637254 () Bool)

(assert (=> b!950611 (= res!637254 (= (select (arr!27648 (_keys!10716 thiss!1141)) (index!38945 lt!428026)) key!756))))

(assert (=> b!950611 (=> res!637254 e!535221)))

(assert (=> b!950611 (= e!535219 e!535221)))

(assert (= (and d!115069 c!99279) b!950609))

(assert (= (and d!115069 (not c!99279)) b!950605))

(assert (= (and b!950605 c!99277) b!950606))

(assert (= (and b!950605 (not c!99277)) b!950604))

(assert (= (and d!115069 c!99278) b!950603))

(assert (= (and d!115069 (not c!99278)) b!950607))

(assert (= (and b!950607 res!637253) b!950611))

(assert (= (and b!950611 (not res!637254)) b!950610))

(assert (= (and b!950610 (not res!637252)) b!950608))

(declare-fun m!882479 () Bool)

(assert (=> b!950608 m!882479))

(assert (=> b!950604 m!882279))

(declare-fun m!882481 () Bool)

(assert (=> b!950604 m!882481))

(assert (=> b!950604 m!882481))

(declare-fun m!882483 () Bool)

(assert (=> b!950604 m!882483))

(assert (=> b!950610 m!882479))

(assert (=> b!950611 m!882479))

(assert (=> d!115069 m!882279))

(declare-fun m!882485 () Bool)

(assert (=> d!115069 m!882485))

(assert (=> d!115069 m!882137))

(assert (=> d!114997 d!115069))

(declare-fun d!115071 () Bool)

(declare-fun lt!428033 () (_ BitVec 32))

(declare-fun lt!428032 () (_ BitVec 32))

(assert (=> d!115071 (= lt!428033 (bvmul (bvxor lt!428032 (bvlshr lt!428032 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115071 (= lt!428032 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115071 (and (bvsge (mask!27581 thiss!1141) #b00000000000000000000000000000000) (let ((res!637255 (let ((h!20504 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81793 (bvmul (bvxor h!20504 (bvlshr h!20504 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81793 (bvlshr x!81793 #b00000000000000000000000000001101)) (mask!27581 thiss!1141)))))) (and (bvslt res!637255 (bvadd (mask!27581 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!637255 #b00000000000000000000000000000000))))))

(assert (=> d!115071 (= (toIndex!0 key!756 (mask!27581 thiss!1141)) (bvand (bvxor lt!428033 (bvlshr lt!428033 #b00000000000000000000000000001101)) (mask!27581 thiss!1141)))))

(assert (=> d!114997 d!115071))

(assert (=> d!114997 d!114999))

(assert (=> bm!41383 d!115053))

(declare-fun d!115073 () Bool)

(assert (=> d!115073 (= (apply!872 lt!427894 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14530 (getValueByKey!501 (toList!6159 lt!427894) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26691 () Bool)

(assert (= bs!26691 d!115073))

(assert (=> bs!26691 m!882329))

(assert (=> bs!26691 m!882329))

(declare-fun m!882487 () Bool)

(assert (=> bs!26691 m!882487))

(assert (=> b!950385 d!115073))

(declare-fun d!115075 () Bool)

(assert (=> d!115075 (= (validKeyInArray!0 (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27648 (_keys!10716 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950373 d!115075))

(declare-fun b!950623 () Bool)

(declare-fun e!535224 () Bool)

(assert (=> b!950623 (= e!535224 (and (bvsge (extraKeys!5516 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5516 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2526 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!950622 () Bool)

(declare-fun res!637267 () Bool)

(assert (=> b!950622 (=> (not res!637267) (not e!535224))))

(declare-fun size!28132 (LongMapFixedSize!4942) (_ BitVec 32))

(assert (=> b!950622 (= res!637267 (= (size!28132 thiss!1141) (bvadd (_size!2526 thiss!1141) (bvsdiv (bvadd (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!950620 () Bool)

(declare-fun res!637265 () Bool)

(assert (=> b!950620 (=> (not res!637265) (not e!535224))))

(assert (=> b!950620 (= res!637265 (and (= (size!28126 (_values!5807 thiss!1141)) (bvadd (mask!27581 thiss!1141) #b00000000000000000000000000000001)) (= (size!28127 (_keys!10716 thiss!1141)) (size!28126 (_values!5807 thiss!1141))) (bvsge (_size!2526 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2526 thiss!1141) (bvadd (mask!27581 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!115077 () Bool)

(declare-fun res!637264 () Bool)

(assert (=> d!115077 (=> (not res!637264) (not e!535224))))

(assert (=> d!115077 (= res!637264 (validMask!0 (mask!27581 thiss!1141)))))

(assert (=> d!115077 (= (simpleValid!375 thiss!1141) e!535224)))

(declare-fun b!950621 () Bool)

(declare-fun res!637266 () Bool)

(assert (=> b!950621 (=> (not res!637266) (not e!535224))))

(assert (=> b!950621 (= res!637266 (bvsge (size!28132 thiss!1141) (_size!2526 thiss!1141)))))

(assert (= (and d!115077 res!637264) b!950620))

(assert (= (and b!950620 res!637265) b!950621))

(assert (= (and b!950621 res!637266) b!950622))

(assert (= (and b!950622 res!637267) b!950623))

(declare-fun m!882489 () Bool)

(assert (=> b!950622 m!882489))

(assert (=> d!115077 m!882137))

(assert (=> b!950621 m!882489))

(assert (=> d!114991 d!115077))

(declare-fun d!115079 () Bool)

(declare-fun e!535225 () Bool)

(assert (=> d!115079 e!535225))

(declare-fun res!637268 () Bool)

(assert (=> d!115079 (=> (not res!637268) (not e!535225))))

(declare-fun lt!428037 () ListLongMap!12287)

(assert (=> d!115079 (= res!637268 (contains!5193 lt!428037 (_1!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(declare-fun lt!428035 () List!19346)

(assert (=> d!115079 (= lt!428037 (ListLongMap!12288 lt!428035))))

(declare-fun lt!428036 () Unit!31871)

(declare-fun lt!428034 () Unit!31871)

(assert (=> d!115079 (= lt!428036 lt!428034)))

(assert (=> d!115079 (= (getValueByKey!501 lt!428035 (_1!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))) (Some!506 (_2!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(assert (=> d!115079 (= lt!428034 (lemmaContainsTupThenGetReturnValue!267 lt!428035 (_1!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (_2!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(assert (=> d!115079 (= lt!428035 (insertStrictlySorted!324 (toList!6159 (ite c!99204 call!41382 (ite c!99208 call!41383 call!41380))) (_1!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (_2!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(assert (=> d!115079 (= (+!2882 (ite c!99204 call!41382 (ite c!99208 call!41383 call!41380)) (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) lt!428037)))

(declare-fun b!950624 () Bool)

(declare-fun res!637269 () Bool)

(assert (=> b!950624 (=> (not res!637269) (not e!535225))))

(assert (=> b!950624 (= res!637269 (= (getValueByKey!501 (toList!6159 lt!428037) (_1!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))) (Some!506 (_2!6811 (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))))

(declare-fun b!950625 () Bool)

(assert (=> b!950625 (= e!535225 (contains!5194 (toList!6159 lt!428037) (ite (or c!99204 c!99208) (tuple2!13601 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13601 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(assert (= (and d!115079 res!637268) b!950624))

(assert (= (and b!950624 res!637269) b!950625))

(declare-fun m!882491 () Bool)

(assert (=> d!115079 m!882491))

(declare-fun m!882493 () Bool)

(assert (=> d!115079 m!882493))

(declare-fun m!882495 () Bool)

(assert (=> d!115079 m!882495))

(declare-fun m!882497 () Bool)

(assert (=> d!115079 m!882497))

(declare-fun m!882499 () Bool)

(assert (=> b!950624 m!882499))

(declare-fun m!882501 () Bool)

(assert (=> b!950625 m!882501))

(assert (=> bm!41380 d!115079))

(declare-fun d!115081 () Bool)

(declare-fun e!535228 () Bool)

(assert (=> d!115081 e!535228))

(declare-fun c!99282 () Bool)

(assert (=> d!115081 (= c!99282 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!115081 true))

(declare-fun _$15!104 () Unit!31871)

(assert (=> d!115081 (= (choose!1594 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)) _$15!104)))

(declare-fun b!950630 () Bool)

(assert (=> b!950630 (= e!535228 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!950631 () Bool)

(assert (=> b!950631 (= e!535228 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115081 c!99282) b!950630))

(assert (= (and d!115081 (not c!99282)) b!950631))

(assert (=> b!950630 m!882141))

(assert (=> d!115005 d!115081))

(assert (=> d!115005 d!114999))

(declare-fun d!115083 () Bool)

(declare-fun res!637274 () Bool)

(declare-fun e!535233 () Bool)

(assert (=> d!115083 (=> res!637274 e!535233)))

(assert (=> d!115083 (= res!637274 (and ((_ is Cons!19342) (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (= (_1!6811 (h!20502 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)))))

(assert (=> d!115083 (= (containsKey!465 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756) e!535233)))

(declare-fun b!950636 () Bool)

(declare-fun e!535234 () Bool)

(assert (=> b!950636 (= e!535233 e!535234)))

(declare-fun res!637275 () Bool)

(assert (=> b!950636 (=> (not res!637275) (not e!535234))))

(assert (=> b!950636 (= res!637275 (and (or (not ((_ is Cons!19342) (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) (bvsle (_1!6811 (h!20502 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)) ((_ is Cons!19342) (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (bvslt (_1!6811 (h!20502 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)))))

(declare-fun b!950637 () Bool)

(assert (=> b!950637 (= e!535234 (containsKey!465 (t!27678 (toList!6159 (getCurrentListMap!3321 (_keys!10716 thiss!1141) (_values!5807 thiss!1141) (mask!27581 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) key!756))))

(assert (= (and d!115083 (not res!637274)) b!950636))

(assert (= (and b!950636 res!637275) b!950637))

(declare-fun m!882503 () Bool)

(assert (=> b!950637 m!882503))

(assert (=> d!114993 d!115083))

(assert (=> b!950429 d!115003))

(declare-fun d!115085 () Bool)

(declare-fun e!535235 () Bool)

(assert (=> d!115085 e!535235))

(declare-fun res!637276 () Bool)

(assert (=> d!115085 (=> res!637276 e!535235)))

(declare-fun lt!428038 () Bool)

(assert (=> d!115085 (= res!637276 (not lt!428038))))

(declare-fun lt!428041 () Bool)

(assert (=> d!115085 (= lt!428038 lt!428041)))

(declare-fun lt!428040 () Unit!31871)

(declare-fun e!535236 () Unit!31871)

(assert (=> d!115085 (= lt!428040 e!535236)))

(declare-fun c!99283 () Bool)

(assert (=> d!115085 (= c!99283 lt!428041)))

(assert (=> d!115085 (= lt!428041 (containsKey!465 (toList!6159 lt!427894) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115085 (= (contains!5193 lt!427894 #b1000000000000000000000000000000000000000000000000000000000000000) lt!428038)))

(declare-fun b!950638 () Bool)

(declare-fun lt!428039 () Unit!31871)

(assert (=> b!950638 (= e!535236 lt!428039)))

(assert (=> b!950638 (= lt!428039 (lemmaContainsKeyImpliesGetValueByKeyDefined!360 (toList!6159 lt!427894) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950638 (isDefined!373 (getValueByKey!501 (toList!6159 lt!427894) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950639 () Bool)

(declare-fun Unit!31878 () Unit!31871)

(assert (=> b!950639 (= e!535236 Unit!31878)))

(declare-fun b!950640 () Bool)

(assert (=> b!950640 (= e!535235 (isDefined!373 (getValueByKey!501 (toList!6159 lt!427894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115085 c!99283) b!950638))

(assert (= (and d!115085 (not c!99283)) b!950639))

(assert (= (and d!115085 (not res!637276)) b!950640))

(declare-fun m!882505 () Bool)

(assert (=> d!115085 m!882505))

(declare-fun m!882507 () Bool)

(assert (=> b!950638 m!882507))

(declare-fun m!882509 () Bool)

(assert (=> b!950638 m!882509))

(assert (=> b!950638 m!882509))

(declare-fun m!882511 () Bool)

(assert (=> b!950638 m!882511))

(assert (=> b!950640 m!882509))

(assert (=> b!950640 m!882509))

(assert (=> b!950640 m!882511))

(assert (=> bm!41379 d!115085))

(assert (=> b!950329 d!115065))

(assert (=> b!950329 d!115067))

(assert (=> b!950379 d!115075))

(declare-fun d!115087 () Bool)

(declare-fun res!637277 () Bool)

(declare-fun e!535237 () Bool)

(assert (=> d!115087 (=> res!637277 e!535237)))

(assert (=> d!115087 (= res!637277 (= (select (arr!27648 (_keys!10716 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115087 (= (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!535237)))

(declare-fun b!950641 () Bool)

(declare-fun e!535238 () Bool)

(assert (=> b!950641 (= e!535237 e!535238)))

(declare-fun res!637278 () Bool)

(assert (=> b!950641 (=> (not res!637278) (not e!535238))))

(assert (=> b!950641 (= res!637278 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28127 (_keys!10716 thiss!1141))))))

(declare-fun b!950642 () Bool)

(assert (=> b!950642 (= e!535238 (arrayContainsKey!0 (_keys!10716 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115087 (not res!637277)) b!950641))

(assert (= (and b!950641 res!637278) b!950642))

(assert (=> d!115087 m!882311))

(declare-fun m!882513 () Bool)

(assert (=> b!950642 m!882513))

(assert (=> b!950424 d!115087))

(declare-fun d!115089 () Bool)

(assert (=> d!115089 (= (apply!872 lt!427894 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14530 (getValueByKey!501 (toList!6159 lt!427894) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26692 () Bool)

(assert (= bs!26692 d!115089))

(assert (=> bs!26692 m!882509))

(assert (=> bs!26692 m!882509))

(declare-fun m!882515 () Bool)

(assert (=> bs!26692 m!882515))

(assert (=> b!950381 d!115089))

(declare-fun b!950643 () Bool)

(declare-fun e!535239 () Bool)

(assert (=> b!950643 (= e!535239 tp_is_empty!20755)))

(declare-fun mapIsEmpty!33057 () Bool)

(declare-fun mapRes!33057 () Bool)

(assert (=> mapIsEmpty!33057 mapRes!33057))

(declare-fun condMapEmpty!33057 () Bool)

(declare-fun mapDefault!33057 () ValueCell!9896)

(assert (=> mapNonEmpty!33056 (= condMapEmpty!33057 (= mapRest!33056 ((as const (Array (_ BitVec 32) ValueCell!9896)) mapDefault!33057)))))

(declare-fun e!535240 () Bool)

(assert (=> mapNonEmpty!33056 (= tp!63356 (and e!535240 mapRes!33057))))

(declare-fun mapNonEmpty!33057 () Bool)

(declare-fun tp!63357 () Bool)

(assert (=> mapNonEmpty!33057 (= mapRes!33057 (and tp!63357 e!535239))))

(declare-fun mapRest!33057 () (Array (_ BitVec 32) ValueCell!9896))

(declare-fun mapValue!33057 () ValueCell!9896)

(declare-fun mapKey!33057 () (_ BitVec 32))

(assert (=> mapNonEmpty!33057 (= mapRest!33056 (store mapRest!33057 mapKey!33057 mapValue!33057))))

(declare-fun b!950644 () Bool)

(assert (=> b!950644 (= e!535240 tp_is_empty!20755)))

(assert (= (and mapNonEmpty!33056 condMapEmpty!33057) mapIsEmpty!33057))

(assert (= (and mapNonEmpty!33056 (not condMapEmpty!33057)) mapNonEmpty!33057))

(assert (= (and mapNonEmpty!33057 ((_ is ValueCellFull!9896) mapValue!33057)) b!950643))

(assert (= (and mapNonEmpty!33056 ((_ is ValueCellFull!9896) mapDefault!33057)) b!950644))

(declare-fun m!882517 () Bool)

(assert (=> mapNonEmpty!33057 m!882517))

(declare-fun b_lambda!14361 () Bool)

(assert (= b_lambda!14359 (or (and b!950252 b_free!18247) b_lambda!14361)))

(declare-fun b_lambda!14363 () Bool)

(assert (= b_lambda!14357 (or (and b!950252 b_free!18247) b_lambda!14363)))

(check-sat (not b_next!18247) (not b!950475) (not d!115025) (not b!950510) (not b!950559) (not b!950640) (not b!950468) (not b!950453) (not bm!41389) (not b!950519) b_and!29689 (not b!950518) (not b!950520) (not b!950554) (not d!115047) (not d!115029) (not bm!41392) (not d!115057) (not d!115049) (not b!950625) (not b!950489) (not b!950604) (not b!950567) (not d!115011) (not d!115035) (not mapNonEmpty!33057) (not d!115059) (not b!950622) (not b!950497) (not b!950637) (not d!115045) (not b!950525) (not b!950509) (not bm!41386) (not b!950572) (not d!115043) (not d!115069) (not d!115033) (not b!950621) (not d!115017) (not b!950630) (not b_lambda!14355) (not b!950556) (not b!950561) (not d!115077) (not d!115039) (not b_lambda!14363) (not b!950638) (not b!950517) (not b!950476) (not b!950487) (not d!115063) (not b!950624) (not b!950491) (not d!115085) (not bm!41395) (not b_lambda!14361) (not b!950466) (not b!950583) (not b!950642) (not b!950523) (not b!950508) (not b!950552) (not d!115051) (not d!115037) (not d!115061) (not b!950560) (not b!950569) (not b!950521) (not b!950551) (not d!115055) (not b!950565) (not d!115031) (not b!950522) (not d!115065) (not b!950496) (not d!115089) (not d!115023) (not d!115079) tp_is_empty!20755 (not b!950562) (not d!115073) (not d!115041) (not d!115053) (not b!950470) (not b!950564))
(check-sat b_and!29689 (not b_next!18247))
