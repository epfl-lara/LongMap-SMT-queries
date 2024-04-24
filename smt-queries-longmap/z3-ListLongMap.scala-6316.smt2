; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81266 () Bool)

(assert start!81266)

(declare-fun b!950262 () Bool)

(declare-fun b_free!18217 () Bool)

(declare-fun b_next!18217 () Bool)

(assert (=> b!950262 (= b_free!18217 (not b_next!18217))))

(declare-fun tp!63237 () Bool)

(declare-fun b_and!29673 () Bool)

(assert (=> b!950262 (= tp!63237 b_and!29673)))

(declare-fun b!950261 () Bool)

(declare-fun res!637044 () Bool)

(declare-fun e!535046 () Bool)

(assert (=> b!950261 (=> (not res!637044) (not e!535046))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32599 0))(
  ( (V!32600 (val!10413 Int)) )
))
(declare-datatypes ((ValueCell!9881 0))(
  ( (ValueCellFull!9881 (v!12950 V!32599)) (EmptyCell!9881) )
))
(declare-datatypes ((array!57513 0))(
  ( (array!57514 (arr!27655 (Array (_ BitVec 32) ValueCell!9881)) (size!28132 (_ BitVec 32))) )
))
(declare-datatypes ((array!57515 0))(
  ( (array!57516 (arr!27656 (Array (_ BitVec 32) (_ BitVec 64))) (size!28133 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4912 0))(
  ( (LongMapFixedSize!4913 (defaultEntry!5763 Int) (mask!27586 (_ BitVec 32)) (extraKeys!5495 (_ BitVec 32)) (zeroValue!5599 V!32599) (minValue!5599 V!32599) (_size!2511 (_ BitVec 32)) (_keys!10719 array!57515) (_values!5786 array!57513) (_vacant!2511 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4912)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9094 0))(
  ( (MissingZero!9094 (index!38747 (_ BitVec 32))) (Found!9094 (index!38748 (_ BitVec 32))) (Intermediate!9094 (undefined!9906 Bool) (index!38749 (_ BitVec 32)) (x!81656 (_ BitVec 32))) (Undefined!9094) (MissingVacant!9094 (index!38750 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57515 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!950261 (= res!637044 (not ((_ is Found!9094) (seekEntry!0 key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)))))))

(declare-fun e!535044 () Bool)

(declare-fun e!535047 () Bool)

(declare-fun tp_is_empty!20725 () Bool)

(declare-fun array_inv!21548 (array!57515) Bool)

(declare-fun array_inv!21549 (array!57513) Bool)

(assert (=> b!950262 (= e!535047 (and tp!63237 tp_is_empty!20725 (array_inv!21548 (_keys!10719 thiss!1141)) (array_inv!21549 (_values!5786 thiss!1141)) e!535044))))

(declare-fun b!950263 () Bool)

(declare-fun e!535048 () Bool)

(assert (=> b!950263 (= e!535048 tp_is_empty!20725)))

(declare-fun res!637042 () Bool)

(assert (=> start!81266 (=> (not res!637042) (not e!535046))))

(declare-fun valid!1882 (LongMapFixedSize!4912) Bool)

(assert (=> start!81266 (= res!637042 (valid!1882 thiss!1141))))

(assert (=> start!81266 e!535046))

(assert (=> start!81266 e!535047))

(assert (=> start!81266 true))

(declare-fun b!950264 () Bool)

(declare-fun res!637043 () Bool)

(assert (=> b!950264 (=> (not res!637043) (not e!535046))))

(assert (=> b!950264 (= res!637043 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950265 () Bool)

(declare-fun res!637041 () Bool)

(assert (=> b!950265 (=> (not res!637041) (not e!535046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950265 (= res!637041 (validMask!0 (mask!27586 thiss!1141)))))

(declare-fun b!950266 () Bool)

(declare-fun res!637045 () Bool)

(assert (=> b!950266 (=> (not res!637045) (not e!535046))))

(declare-datatypes ((tuple2!13518 0))(
  ( (tuple2!13519 (_1!6770 (_ BitVec 64)) (_2!6770 V!32599)) )
))
(declare-datatypes ((List!19314 0))(
  ( (Nil!19311) (Cons!19310 (h!20475 tuple2!13518) (t!27639 List!19314)) )
))
(declare-datatypes ((ListLongMap!12217 0))(
  ( (ListLongMap!12218 (toList!6124 List!19314)) )
))
(declare-fun contains!5223 (ListLongMap!12217 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3357 (array!57515 array!57513 (_ BitVec 32) (_ BitVec 32) V!32599 V!32599 (_ BitVec 32) Int) ListLongMap!12217)

(assert (=> b!950266 (= res!637045 (contains!5223 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) key!756))))

(declare-fun mapNonEmpty!32989 () Bool)

(declare-fun mapRes!32989 () Bool)

(declare-fun tp!63238 () Bool)

(assert (=> mapNonEmpty!32989 (= mapRes!32989 (and tp!63238 e!535048))))

(declare-fun mapKey!32989 () (_ BitVec 32))

(declare-fun mapValue!32989 () ValueCell!9881)

(declare-fun mapRest!32989 () (Array (_ BitVec 32) ValueCell!9881))

(assert (=> mapNonEmpty!32989 (= (arr!27655 (_values!5786 thiss!1141)) (store mapRest!32989 mapKey!32989 mapValue!32989))))

(declare-fun b!950267 () Bool)

(declare-fun e!535045 () Bool)

(assert (=> b!950267 (= e!535044 (and e!535045 mapRes!32989))))

(declare-fun condMapEmpty!32989 () Bool)

(declare-fun mapDefault!32989 () ValueCell!9881)

(assert (=> b!950267 (= condMapEmpty!32989 (= (arr!27655 (_values!5786 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9881)) mapDefault!32989)))))

(declare-fun mapIsEmpty!32989 () Bool)

(assert (=> mapIsEmpty!32989 mapRes!32989))

(declare-fun b!950268 () Bool)

(assert (=> b!950268 (= e!535045 tp_is_empty!20725)))

(declare-fun b!950269 () Bool)

(assert (=> b!950269 (= e!535046 (and (= (size!28132 (_values!5786 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27586 thiss!1141))) (= (size!28133 (_keys!10719 thiss!1141)) (size!28132 (_values!5786 thiss!1141))) (bvsge (mask!27586 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5495 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5495 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!81266 res!637042) b!950264))

(assert (= (and b!950264 res!637043) b!950261))

(assert (= (and b!950261 res!637044) b!950266))

(assert (= (and b!950266 res!637045) b!950265))

(assert (= (and b!950265 res!637041) b!950269))

(assert (= (and b!950267 condMapEmpty!32989) mapIsEmpty!32989))

(assert (= (and b!950267 (not condMapEmpty!32989)) mapNonEmpty!32989))

(assert (= (and mapNonEmpty!32989 ((_ is ValueCellFull!9881) mapValue!32989)) b!950263))

(assert (= (and b!950267 ((_ is ValueCellFull!9881) mapDefault!32989)) b!950268))

(assert (= b!950262 b!950267))

(assert (= start!81266 b!950262))

(declare-fun m!883313 () Bool)

(assert (=> b!950265 m!883313))

(declare-fun m!883315 () Bool)

(assert (=> start!81266 m!883315))

(declare-fun m!883317 () Bool)

(assert (=> b!950266 m!883317))

(assert (=> b!950266 m!883317))

(declare-fun m!883319 () Bool)

(assert (=> b!950266 m!883319))

(declare-fun m!883321 () Bool)

(assert (=> mapNonEmpty!32989 m!883321))

(declare-fun m!883323 () Bool)

(assert (=> b!950261 m!883323))

(declare-fun m!883325 () Bool)

(assert (=> b!950262 m!883325))

(declare-fun m!883327 () Bool)

(assert (=> b!950262 m!883327))

(check-sat (not start!81266) (not b_next!18217) (not b!950262) (not b!950265) (not mapNonEmpty!32989) b_and!29673 (not b!950266) tp_is_empty!20725 (not b!950261))
(check-sat b_and!29673 (not b_next!18217))
(get-model)

(declare-fun d!115359 () Bool)

(assert (=> d!115359 (= (array_inv!21548 (_keys!10719 thiss!1141)) (bvsge (size!28133 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950262 d!115359))

(declare-fun d!115361 () Bool)

(assert (=> d!115361 (= (array_inv!21549 (_values!5786 thiss!1141)) (bvsge (size!28132 (_values!5786 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950262 d!115361))

(declare-fun d!115363 () Bool)

(declare-fun e!535089 () Bool)

(assert (=> d!115363 e!535089))

(declare-fun res!637078 () Bool)

(assert (=> d!115363 (=> res!637078 e!535089)))

(declare-fun lt!427903 () Bool)

(assert (=> d!115363 (= res!637078 (not lt!427903))))

(declare-fun lt!427904 () Bool)

(assert (=> d!115363 (= lt!427903 lt!427904)))

(declare-datatypes ((Unit!31954 0))(
  ( (Unit!31955) )
))
(declare-fun lt!427902 () Unit!31954)

(declare-fun e!535090 () Unit!31954)

(assert (=> d!115363 (= lt!427902 e!535090)))

(declare-fun c!99348 () Bool)

(assert (=> d!115363 (= c!99348 lt!427904)))

(declare-fun containsKey!463 (List!19314 (_ BitVec 64)) Bool)

(assert (=> d!115363 (= lt!427904 (containsKey!463 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(assert (=> d!115363 (= (contains!5223 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) key!756) lt!427903)))

(declare-fun b!950330 () Bool)

(declare-fun lt!427901 () Unit!31954)

(assert (=> b!950330 (= e!535090 lt!427901)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!357 (List!19314 (_ BitVec 64)) Unit!31954)

(assert (=> b!950330 (= lt!427901 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-datatypes ((Option!498 0))(
  ( (Some!497 (v!12953 V!32599)) (None!496) )
))
(declare-fun isDefined!365 (Option!498) Bool)

(declare-fun getValueByKey!492 (List!19314 (_ BitVec 64)) Option!498)

(assert (=> b!950330 (isDefined!365 (getValueByKey!492 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-fun b!950331 () Bool)

(declare-fun Unit!31956 () Unit!31954)

(assert (=> b!950331 (= e!535090 Unit!31956)))

(declare-fun b!950332 () Bool)

(assert (=> b!950332 (= e!535089 (isDefined!365 (getValueByKey!492 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756)))))

(assert (= (and d!115363 c!99348) b!950330))

(assert (= (and d!115363 (not c!99348)) b!950331))

(assert (= (and d!115363 (not res!637078)) b!950332))

(declare-fun m!883361 () Bool)

(assert (=> d!115363 m!883361))

(declare-fun m!883363 () Bool)

(assert (=> b!950330 m!883363))

(declare-fun m!883365 () Bool)

(assert (=> b!950330 m!883365))

(assert (=> b!950330 m!883365))

(declare-fun m!883367 () Bool)

(assert (=> b!950330 m!883367))

(assert (=> b!950332 m!883365))

(assert (=> b!950332 m!883365))

(assert (=> b!950332 m!883367))

(assert (=> b!950266 d!115363))

(declare-fun b!950375 () Bool)

(declare-fun e!535117 () Bool)

(declare-fun call!41346 () Bool)

(assert (=> b!950375 (= e!535117 (not call!41346))))

(declare-fun b!950376 () Bool)

(declare-fun e!535128 () Unit!31954)

(declare-fun lt!427959 () Unit!31954)

(assert (=> b!950376 (= e!535128 lt!427959)))

(declare-fun lt!427952 () ListLongMap!12217)

(declare-fun getCurrentListMapNoExtraKeys!3358 (array!57515 array!57513 (_ BitVec 32) (_ BitVec 32) V!32599 V!32599 (_ BitVec 32) Int) ListLongMap!12217)

(assert (=> b!950376 (= lt!427952 (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427949 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427949 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427964 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427964 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427969 () Unit!31954)

(declare-fun addStillContains!573 (ListLongMap!12217 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31954)

(assert (=> b!950376 (= lt!427969 (addStillContains!573 lt!427952 lt!427949 (zeroValue!5599 thiss!1141) lt!427964))))

(declare-fun +!2870 (ListLongMap!12217 tuple2!13518) ListLongMap!12217)

(assert (=> b!950376 (contains!5223 (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))) lt!427964)))

(declare-fun lt!427966 () Unit!31954)

(assert (=> b!950376 (= lt!427966 lt!427969)))

(declare-fun lt!427960 () ListLongMap!12217)

(assert (=> b!950376 (= lt!427960 (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427962 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427962 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427950 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427950 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427954 () Unit!31954)

(declare-fun addApplyDifferent!454 (ListLongMap!12217 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31954)

(assert (=> b!950376 (= lt!427954 (addApplyDifferent!454 lt!427960 lt!427962 (minValue!5599 thiss!1141) lt!427950))))

(declare-fun apply!884 (ListLongMap!12217 (_ BitVec 64)) V!32599)

(assert (=> b!950376 (= (apply!884 (+!2870 lt!427960 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))) lt!427950) (apply!884 lt!427960 lt!427950))))

(declare-fun lt!427967 () Unit!31954)

(assert (=> b!950376 (= lt!427967 lt!427954)))

(declare-fun lt!427968 () ListLongMap!12217)

(assert (=> b!950376 (= lt!427968 (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427970 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427970 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427953 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427953 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427958 () Unit!31954)

(assert (=> b!950376 (= lt!427958 (addApplyDifferent!454 lt!427968 lt!427970 (zeroValue!5599 thiss!1141) lt!427953))))

(assert (=> b!950376 (= (apply!884 (+!2870 lt!427968 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))) lt!427953) (apply!884 lt!427968 lt!427953))))

(declare-fun lt!427951 () Unit!31954)

(assert (=> b!950376 (= lt!427951 lt!427958)))

(declare-fun lt!427963 () ListLongMap!12217)

(assert (=> b!950376 (= lt!427963 (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(declare-fun lt!427965 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427965 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427961 () (_ BitVec 64))

(assert (=> b!950376 (= lt!427961 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950376 (= lt!427959 (addApplyDifferent!454 lt!427963 lt!427965 (minValue!5599 thiss!1141) lt!427961))))

(assert (=> b!950376 (= (apply!884 (+!2870 lt!427963 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))) lt!427961) (apply!884 lt!427963 lt!427961))))

(declare-fun b!950377 () Bool)

(declare-fun e!535119 () ListLongMap!12217)

(declare-fun call!41352 () ListLongMap!12217)

(assert (=> b!950377 (= e!535119 call!41352)))

(declare-fun b!950378 () Bool)

(declare-fun c!99362 () Bool)

(assert (=> b!950378 (= c!99362 (and (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!535118 () ListLongMap!12217)

(assert (=> b!950378 (= e!535118 e!535119)))

(declare-fun b!950379 () Bool)

(declare-fun e!535122 () ListLongMap!12217)

(declare-fun call!41349 () ListLongMap!12217)

(assert (=> b!950379 (= e!535122 (+!2870 call!41349 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))

(declare-fun b!950380 () Bool)

(declare-fun res!637104 () Bool)

(declare-fun e!535124 () Bool)

(assert (=> b!950380 (=> (not res!637104) (not e!535124))))

(declare-fun e!535129 () Bool)

(assert (=> b!950380 (= res!637104 e!535129)))

(declare-fun res!637105 () Bool)

(assert (=> b!950380 (=> res!637105 e!535129)))

(declare-fun e!535123 () Bool)

(assert (=> b!950380 (= res!637105 (not e!535123))))

(declare-fun res!637098 () Bool)

(assert (=> b!950380 (=> (not res!637098) (not e!535123))))

(assert (=> b!950380 (= res!637098 (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun b!950382 () Bool)

(declare-fun e!535121 () Bool)

(declare-fun lt!427957 () ListLongMap!12217)

(assert (=> b!950382 (= e!535121 (= (apply!884 lt!427957 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5599 thiss!1141)))))

(declare-fun b!950383 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!950383 (= e!535123 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950384 () Bool)

(declare-fun Unit!31957 () Unit!31954)

(assert (=> b!950384 (= e!535128 Unit!31957)))

(declare-fun b!950385 () Bool)

(declare-fun e!535126 () Bool)

(declare-fun get!14544 (ValueCell!9881 V!32599) V!32599)

(declare-fun dynLambda!1667 (Int (_ BitVec 64)) V!32599)

(assert (=> b!950385 (= e!535126 (= (apply!884 lt!427957 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)) (get!14544 (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1667 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28132 (_values!5786 thiss!1141))))))

(assert (=> b!950385 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun b!950386 () Bool)

(declare-fun call!41347 () ListLongMap!12217)

(assert (=> b!950386 (= e!535119 call!41347)))

(declare-fun bm!41343 () Bool)

(declare-fun call!41348 () Bool)

(assert (=> bm!41343 (= call!41348 (contains!5223 lt!427957 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41344 () Bool)

(declare-fun call!41350 () ListLongMap!12217)

(assert (=> bm!41344 (= call!41352 call!41350)))

(declare-fun b!950387 () Bool)

(assert (=> b!950387 (= e!535122 e!535118)))

(declare-fun c!99366 () Bool)

(assert (=> b!950387 (= c!99366 (and (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950388 () Bool)

(assert (=> b!950388 (= e!535129 e!535126)))

(declare-fun res!637102 () Bool)

(assert (=> b!950388 (=> (not res!637102) (not e!535126))))

(assert (=> b!950388 (= res!637102 (contains!5223 lt!427957 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950388 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun bm!41345 () Bool)

(assert (=> bm!41345 (= call!41347 call!41349)))

(declare-fun b!950389 () Bool)

(declare-fun e!535125 () Bool)

(assert (=> b!950389 (= e!535125 (= (apply!884 lt!427957 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5599 thiss!1141)))))

(declare-fun b!950390 () Bool)

(declare-fun e!535127 () Bool)

(assert (=> b!950390 (= e!535127 e!535125)))

(declare-fun res!637101 () Bool)

(assert (=> b!950390 (= res!637101 call!41348)))

(assert (=> b!950390 (=> (not res!637101) (not e!535125))))

(declare-fun b!950391 () Bool)

(assert (=> b!950391 (= e!535117 e!535121)))

(declare-fun res!637103 () Bool)

(assert (=> b!950391 (= res!637103 call!41346)))

(assert (=> b!950391 (=> (not res!637103) (not e!535121))))

(declare-fun b!950392 () Bool)

(declare-fun res!637100 () Bool)

(assert (=> b!950392 (=> (not res!637100) (not e!535124))))

(assert (=> b!950392 (= res!637100 e!535117)))

(declare-fun c!99361 () Bool)

(assert (=> b!950392 (= c!99361 (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!950393 () Bool)

(declare-fun e!535120 () Bool)

(assert (=> b!950393 (= e!535120 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950394 () Bool)

(assert (=> b!950394 (= e!535118 call!41347)))

(declare-fun bm!41346 () Bool)

(declare-fun call!41351 () ListLongMap!12217)

(assert (=> bm!41346 (= call!41350 call!41351)))

(declare-fun bm!41347 () Bool)

(assert (=> bm!41347 (= call!41346 (contains!5223 lt!427957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41348 () Bool)

(declare-fun c!99365 () Bool)

(assert (=> bm!41348 (= call!41349 (+!2870 (ite c!99365 call!41351 (ite c!99366 call!41350 call!41352)) (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(declare-fun d!115365 () Bool)

(assert (=> d!115365 e!535124))

(declare-fun res!637099 () Bool)

(assert (=> d!115365 (=> (not res!637099) (not e!535124))))

(assert (=> d!115365 (= res!637099 (or (bvsge #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))))

(declare-fun lt!427956 () ListLongMap!12217)

(assert (=> d!115365 (= lt!427957 lt!427956)))

(declare-fun lt!427955 () Unit!31954)

(assert (=> d!115365 (= lt!427955 e!535128)))

(declare-fun c!99363 () Bool)

(assert (=> d!115365 (= c!99363 e!535120)))

(declare-fun res!637097 () Bool)

(assert (=> d!115365 (=> (not res!637097) (not e!535120))))

(assert (=> d!115365 (= res!637097 (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(assert (=> d!115365 (= lt!427956 e!535122)))

(assert (=> d!115365 (= c!99365 (and (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115365 (validMask!0 (mask!27586 thiss!1141))))

(assert (=> d!115365 (= (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) lt!427957)))

(declare-fun b!950381 () Bool)

(assert (=> b!950381 (= e!535124 e!535127)))

(declare-fun c!99364 () Bool)

(assert (=> b!950381 (= c!99364 (not (= (bvand (extraKeys!5495 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!950395 () Bool)

(assert (=> b!950395 (= e!535127 (not call!41348))))

(declare-fun bm!41349 () Bool)

(assert (=> bm!41349 (= call!41351 (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))

(assert (= (and d!115365 c!99365) b!950379))

(assert (= (and d!115365 (not c!99365)) b!950387))

(assert (= (and b!950387 c!99366) b!950394))

(assert (= (and b!950387 (not c!99366)) b!950378))

(assert (= (and b!950378 c!99362) b!950386))

(assert (= (and b!950378 (not c!99362)) b!950377))

(assert (= (or b!950386 b!950377) bm!41344))

(assert (= (or b!950394 bm!41344) bm!41346))

(assert (= (or b!950394 b!950386) bm!41345))

(assert (= (or b!950379 bm!41346) bm!41349))

(assert (= (or b!950379 bm!41345) bm!41348))

(assert (= (and d!115365 res!637097) b!950393))

(assert (= (and d!115365 c!99363) b!950376))

(assert (= (and d!115365 (not c!99363)) b!950384))

(assert (= (and d!115365 res!637099) b!950380))

(assert (= (and b!950380 res!637098) b!950383))

(assert (= (and b!950380 (not res!637105)) b!950388))

(assert (= (and b!950388 res!637102) b!950385))

(assert (= (and b!950380 res!637104) b!950392))

(assert (= (and b!950392 c!99361) b!950391))

(assert (= (and b!950392 (not c!99361)) b!950375))

(assert (= (and b!950391 res!637103) b!950382))

(assert (= (or b!950391 b!950375) bm!41347))

(assert (= (and b!950392 res!637100) b!950381))

(assert (= (and b!950381 c!99364) b!950390))

(assert (= (and b!950381 (not c!99364)) b!950395))

(assert (= (and b!950390 res!637101) b!950389))

(assert (= (or b!950390 b!950395) bm!41343))

(declare-fun b_lambda!14361 () Bool)

(assert (=> (not b_lambda!14361) (not b!950385)))

(declare-fun t!27643 () Bool)

(declare-fun tb!6177 () Bool)

(assert (=> (and b!950262 (= (defaultEntry!5763 thiss!1141) (defaultEntry!5763 thiss!1141)) t!27643) tb!6177))

(declare-fun result!12269 () Bool)

(assert (=> tb!6177 (= result!12269 tp_is_empty!20725)))

(assert (=> b!950385 t!27643))

(declare-fun b_and!29679 () Bool)

(assert (= b_and!29673 (and (=> t!27643 result!12269) b_and!29679)))

(declare-fun m!883369 () Bool)

(assert (=> b!950376 m!883369))

(declare-fun m!883371 () Bool)

(assert (=> b!950376 m!883371))

(declare-fun m!883373 () Bool)

(assert (=> b!950376 m!883373))

(declare-fun m!883375 () Bool)

(assert (=> b!950376 m!883375))

(declare-fun m!883377 () Bool)

(assert (=> b!950376 m!883377))

(assert (=> b!950376 m!883375))

(declare-fun m!883379 () Bool)

(assert (=> b!950376 m!883379))

(declare-fun m!883381 () Bool)

(assert (=> b!950376 m!883381))

(declare-fun m!883383 () Bool)

(assert (=> b!950376 m!883383))

(assert (=> b!950376 m!883379))

(declare-fun m!883385 () Bool)

(assert (=> b!950376 m!883385))

(declare-fun m!883387 () Bool)

(assert (=> b!950376 m!883387))

(declare-fun m!883389 () Bool)

(assert (=> b!950376 m!883389))

(declare-fun m!883391 () Bool)

(assert (=> b!950376 m!883391))

(declare-fun m!883393 () Bool)

(assert (=> b!950376 m!883393))

(declare-fun m!883395 () Bool)

(assert (=> b!950376 m!883395))

(declare-fun m!883397 () Bool)

(assert (=> b!950376 m!883397))

(declare-fun m!883399 () Bool)

(assert (=> b!950376 m!883399))

(assert (=> b!950376 m!883393))

(declare-fun m!883401 () Bool)

(assert (=> b!950376 m!883401))

(assert (=> b!950376 m!883371))

(assert (=> b!950393 m!883399))

(assert (=> b!950393 m!883399))

(declare-fun m!883403 () Bool)

(assert (=> b!950393 m!883403))

(assert (=> b!950388 m!883399))

(assert (=> b!950388 m!883399))

(declare-fun m!883405 () Bool)

(assert (=> b!950388 m!883405))

(declare-fun m!883407 () Bool)

(assert (=> bm!41343 m!883407))

(declare-fun m!883409 () Bool)

(assert (=> b!950382 m!883409))

(declare-fun m!883411 () Bool)

(assert (=> b!950379 m!883411))

(declare-fun m!883413 () Bool)

(assert (=> bm!41347 m!883413))

(declare-fun m!883415 () Bool)

(assert (=> b!950385 m!883415))

(declare-fun m!883417 () Bool)

(assert (=> b!950385 m!883417))

(assert (=> b!950385 m!883417))

(assert (=> b!950385 m!883415))

(declare-fun m!883419 () Bool)

(assert (=> b!950385 m!883419))

(assert (=> b!950385 m!883399))

(assert (=> b!950385 m!883399))

(declare-fun m!883421 () Bool)

(assert (=> b!950385 m!883421))

(assert (=> bm!41349 m!883401))

(assert (=> d!115365 m!883313))

(declare-fun m!883423 () Bool)

(assert (=> bm!41348 m!883423))

(assert (=> b!950383 m!883399))

(assert (=> b!950383 m!883399))

(assert (=> b!950383 m!883403))

(declare-fun m!883425 () Bool)

(assert (=> b!950389 m!883425))

(assert (=> b!950266 d!115365))

(declare-fun b!950410 () Bool)

(declare-fun e!535138 () SeekEntryResult!9094)

(declare-fun lt!427982 () SeekEntryResult!9094)

(assert (=> b!950410 (= e!535138 (MissingZero!9094 (index!38749 lt!427982)))))

(declare-fun b!950411 () Bool)

(declare-fun lt!427981 () SeekEntryResult!9094)

(assert (=> b!950411 (= e!535138 (ite ((_ is MissingVacant!9094) lt!427981) (MissingZero!9094 (index!38750 lt!427981)) lt!427981))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57515 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!950411 (= lt!427981 (seekKeyOrZeroReturnVacant!0 (x!81656 lt!427982) (index!38749 lt!427982) (index!38749 lt!427982) key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)))))

(declare-fun b!950412 () Bool)

(declare-fun e!535136 () SeekEntryResult!9094)

(assert (=> b!950412 (= e!535136 Undefined!9094)))

(declare-fun b!950413 () Bool)

(declare-fun c!99374 () Bool)

(declare-fun lt!427979 () (_ BitVec 64))

(assert (=> b!950413 (= c!99374 (= lt!427979 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535137 () SeekEntryResult!9094)

(assert (=> b!950413 (= e!535137 e!535138)))

(declare-fun d!115367 () Bool)

(declare-fun lt!427980 () SeekEntryResult!9094)

(assert (=> d!115367 (and (or ((_ is MissingVacant!9094) lt!427980) (not ((_ is Found!9094) lt!427980)) (and (bvsge (index!38748 lt!427980) #b00000000000000000000000000000000) (bvslt (index!38748 lt!427980) (size!28133 (_keys!10719 thiss!1141))))) (not ((_ is MissingVacant!9094) lt!427980)) (or (not ((_ is Found!9094) lt!427980)) (= (select (arr!27656 (_keys!10719 thiss!1141)) (index!38748 lt!427980)) key!756)))))

(assert (=> d!115367 (= lt!427980 e!535136)))

(declare-fun c!99375 () Bool)

(assert (=> d!115367 (= c!99375 (and ((_ is Intermediate!9094) lt!427982) (undefined!9906 lt!427982)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57515 (_ BitVec 32)) SeekEntryResult!9094)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115367 (= lt!427982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27586 thiss!1141)) key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)))))

(assert (=> d!115367 (validMask!0 (mask!27586 thiss!1141))))

(assert (=> d!115367 (= (seekEntry!0 key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)) lt!427980)))

(declare-fun b!950414 () Bool)

(assert (=> b!950414 (= e!535136 e!535137)))

(assert (=> b!950414 (= lt!427979 (select (arr!27656 (_keys!10719 thiss!1141)) (index!38749 lt!427982)))))

(declare-fun c!99373 () Bool)

(assert (=> b!950414 (= c!99373 (= lt!427979 key!756))))

(declare-fun b!950415 () Bool)

(assert (=> b!950415 (= e!535137 (Found!9094 (index!38749 lt!427982)))))

(assert (= (and d!115367 c!99375) b!950412))

(assert (= (and d!115367 (not c!99375)) b!950414))

(assert (= (and b!950414 c!99373) b!950415))

(assert (= (and b!950414 (not c!99373)) b!950413))

(assert (= (and b!950413 c!99374) b!950410))

(assert (= (and b!950413 (not c!99374)) b!950411))

(declare-fun m!883427 () Bool)

(assert (=> b!950411 m!883427))

(declare-fun m!883429 () Bool)

(assert (=> d!115367 m!883429))

(declare-fun m!883431 () Bool)

(assert (=> d!115367 m!883431))

(assert (=> d!115367 m!883431))

(declare-fun m!883433 () Bool)

(assert (=> d!115367 m!883433))

(assert (=> d!115367 m!883313))

(declare-fun m!883435 () Bool)

(assert (=> b!950414 m!883435))

(assert (=> b!950261 d!115367))

(declare-fun d!115369 () Bool)

(declare-fun res!637112 () Bool)

(declare-fun e!535141 () Bool)

(assert (=> d!115369 (=> (not res!637112) (not e!535141))))

(declare-fun simpleValid!371 (LongMapFixedSize!4912) Bool)

(assert (=> d!115369 (= res!637112 (simpleValid!371 thiss!1141))))

(assert (=> d!115369 (= (valid!1882 thiss!1141) e!535141)))

(declare-fun b!950422 () Bool)

(declare-fun res!637113 () Bool)

(assert (=> b!950422 (=> (not res!637113) (not e!535141))))

(declare-fun arrayCountValidKeys!0 (array!57515 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950422 (= res!637113 (= (arrayCountValidKeys!0 (_keys!10719 thiss!1141) #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))) (_size!2511 thiss!1141)))))

(declare-fun b!950423 () Bool)

(declare-fun res!637114 () Bool)

(assert (=> b!950423 (=> (not res!637114) (not e!535141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57515 (_ BitVec 32)) Bool)

(assert (=> b!950423 (= res!637114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)))))

(declare-fun b!950424 () Bool)

(declare-datatypes ((List!19317 0))(
  ( (Nil!19314) (Cons!19313 (h!20478 (_ BitVec 64)) (t!27644 List!19317)) )
))
(declare-fun arrayNoDuplicates!0 (array!57515 (_ BitVec 32) List!19317) Bool)

(assert (=> b!950424 (= e!535141 (arrayNoDuplicates!0 (_keys!10719 thiss!1141) #b00000000000000000000000000000000 Nil!19314))))

(assert (= (and d!115369 res!637112) b!950422))

(assert (= (and b!950422 res!637113) b!950423))

(assert (= (and b!950423 res!637114) b!950424))

(declare-fun m!883437 () Bool)

(assert (=> d!115369 m!883437))

(declare-fun m!883439 () Bool)

(assert (=> b!950422 m!883439))

(declare-fun m!883441 () Bool)

(assert (=> b!950423 m!883441))

(declare-fun m!883443 () Bool)

(assert (=> b!950424 m!883443))

(assert (=> start!81266 d!115369))

(declare-fun d!115371 () Bool)

(assert (=> d!115371 (= (validMask!0 (mask!27586 thiss!1141)) (and (or (= (mask!27586 thiss!1141) #b00000000000000000000000000000111) (= (mask!27586 thiss!1141) #b00000000000000000000000000001111) (= (mask!27586 thiss!1141) #b00000000000000000000000000011111) (= (mask!27586 thiss!1141) #b00000000000000000000000000111111) (= (mask!27586 thiss!1141) #b00000000000000000000000001111111) (= (mask!27586 thiss!1141) #b00000000000000000000000011111111) (= (mask!27586 thiss!1141) #b00000000000000000000000111111111) (= (mask!27586 thiss!1141) #b00000000000000000000001111111111) (= (mask!27586 thiss!1141) #b00000000000000000000011111111111) (= (mask!27586 thiss!1141) #b00000000000000000000111111111111) (= (mask!27586 thiss!1141) #b00000000000000000001111111111111) (= (mask!27586 thiss!1141) #b00000000000000000011111111111111) (= (mask!27586 thiss!1141) #b00000000000000000111111111111111) (= (mask!27586 thiss!1141) #b00000000000000001111111111111111) (= (mask!27586 thiss!1141) #b00000000000000011111111111111111) (= (mask!27586 thiss!1141) #b00000000000000111111111111111111) (= (mask!27586 thiss!1141) #b00000000000001111111111111111111) (= (mask!27586 thiss!1141) #b00000000000011111111111111111111) (= (mask!27586 thiss!1141) #b00000000000111111111111111111111) (= (mask!27586 thiss!1141) #b00000000001111111111111111111111) (= (mask!27586 thiss!1141) #b00000000011111111111111111111111) (= (mask!27586 thiss!1141) #b00000000111111111111111111111111) (= (mask!27586 thiss!1141) #b00000001111111111111111111111111) (= (mask!27586 thiss!1141) #b00000011111111111111111111111111) (= (mask!27586 thiss!1141) #b00000111111111111111111111111111) (= (mask!27586 thiss!1141) #b00001111111111111111111111111111) (= (mask!27586 thiss!1141) #b00011111111111111111111111111111) (= (mask!27586 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27586 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950265 d!115371))

(declare-fun condMapEmpty!32998 () Bool)

(declare-fun mapDefault!32998 () ValueCell!9881)

(assert (=> mapNonEmpty!32989 (= condMapEmpty!32998 (= mapRest!32989 ((as const (Array (_ BitVec 32) ValueCell!9881)) mapDefault!32998)))))

(declare-fun e!535146 () Bool)

(declare-fun mapRes!32998 () Bool)

(assert (=> mapNonEmpty!32989 (= tp!63238 (and e!535146 mapRes!32998))))

(declare-fun b!950431 () Bool)

(declare-fun e!535147 () Bool)

(assert (=> b!950431 (= e!535147 tp_is_empty!20725)))

(declare-fun b!950432 () Bool)

(assert (=> b!950432 (= e!535146 tp_is_empty!20725)))

(declare-fun mapNonEmpty!32998 () Bool)

(declare-fun tp!63253 () Bool)

(assert (=> mapNonEmpty!32998 (= mapRes!32998 (and tp!63253 e!535147))))

(declare-fun mapValue!32998 () ValueCell!9881)

(declare-fun mapRest!32998 () (Array (_ BitVec 32) ValueCell!9881))

(declare-fun mapKey!32998 () (_ BitVec 32))

(assert (=> mapNonEmpty!32998 (= mapRest!32989 (store mapRest!32998 mapKey!32998 mapValue!32998))))

(declare-fun mapIsEmpty!32998 () Bool)

(assert (=> mapIsEmpty!32998 mapRes!32998))

(assert (= (and mapNonEmpty!32989 condMapEmpty!32998) mapIsEmpty!32998))

(assert (= (and mapNonEmpty!32989 (not condMapEmpty!32998)) mapNonEmpty!32998))

(assert (= (and mapNonEmpty!32998 ((_ is ValueCellFull!9881) mapValue!32998)) b!950431))

(assert (= (and mapNonEmpty!32989 ((_ is ValueCellFull!9881) mapDefault!32998)) b!950432))

(declare-fun m!883445 () Bool)

(assert (=> mapNonEmpty!32998 m!883445))

(declare-fun b_lambda!14363 () Bool)

(assert (= b_lambda!14361 (or (and b!950262 b_free!18217) b_lambda!14363)))

(check-sat (not b_next!18217) (not mapNonEmpty!32998) (not b!950332) (not d!115367) (not b!950376) (not b!950388) tp_is_empty!20725 (not bm!41348) (not b!950393) (not b!950424) (not d!115363) (not b!950389) (not bm!41343) (not b!950423) (not b!950383) (not b!950422) (not b!950330) (not d!115365) (not bm!41349) (not b!950379) (not b!950411) (not b_lambda!14363) (not b!950382) b_and!29679 (not bm!41347) (not b!950385) (not d!115369))
(check-sat b_and!29679 (not b_next!18217))
(get-model)

(declare-fun d!115373 () Bool)

(declare-fun e!535148 () Bool)

(assert (=> d!115373 e!535148))

(declare-fun res!637115 () Bool)

(assert (=> d!115373 (=> res!637115 e!535148)))

(declare-fun lt!427985 () Bool)

(assert (=> d!115373 (= res!637115 (not lt!427985))))

(declare-fun lt!427986 () Bool)

(assert (=> d!115373 (= lt!427985 lt!427986)))

(declare-fun lt!427984 () Unit!31954)

(declare-fun e!535149 () Unit!31954)

(assert (=> d!115373 (= lt!427984 e!535149)))

(declare-fun c!99376 () Bool)

(assert (=> d!115373 (= c!99376 lt!427986)))

(assert (=> d!115373 (= lt!427986 (containsKey!463 (toList!6124 lt!427957) (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115373 (= (contains!5223 lt!427957 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)) lt!427985)))

(declare-fun b!950433 () Bool)

(declare-fun lt!427983 () Unit!31954)

(assert (=> b!950433 (= e!535149 lt!427983)))

(assert (=> b!950433 (= lt!427983 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6124 lt!427957) (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950433 (isDefined!365 (getValueByKey!492 (toList!6124 lt!427957) (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950434 () Bool)

(declare-fun Unit!31958 () Unit!31954)

(assert (=> b!950434 (= e!535149 Unit!31958)))

(declare-fun b!950435 () Bool)

(assert (=> b!950435 (= e!535148 (isDefined!365 (getValueByKey!492 (toList!6124 lt!427957) (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115373 c!99376) b!950433))

(assert (= (and d!115373 (not c!99376)) b!950434))

(assert (= (and d!115373 (not res!637115)) b!950435))

(assert (=> d!115373 m!883399))

(declare-fun m!883447 () Bool)

(assert (=> d!115373 m!883447))

(assert (=> b!950433 m!883399))

(declare-fun m!883449 () Bool)

(assert (=> b!950433 m!883449))

(assert (=> b!950433 m!883399))

(declare-fun m!883451 () Bool)

(assert (=> b!950433 m!883451))

(assert (=> b!950433 m!883451))

(declare-fun m!883453 () Bool)

(assert (=> b!950433 m!883453))

(assert (=> b!950435 m!883399))

(assert (=> b!950435 m!883451))

(assert (=> b!950435 m!883451))

(assert (=> b!950435 m!883453))

(assert (=> b!950388 d!115373))

(declare-fun d!115375 () Bool)

(declare-fun e!535152 () Bool)

(assert (=> d!115375 e!535152))

(declare-fun res!637120 () Bool)

(assert (=> d!115375 (=> (not res!637120) (not e!535152))))

(declare-fun lt!427998 () ListLongMap!12217)

(assert (=> d!115375 (= res!637120 (contains!5223 lt!427998 (_1!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(declare-fun lt!427997 () List!19314)

(assert (=> d!115375 (= lt!427998 (ListLongMap!12218 lt!427997))))

(declare-fun lt!427995 () Unit!31954)

(declare-fun lt!427996 () Unit!31954)

(assert (=> d!115375 (= lt!427995 lt!427996)))

(assert (=> d!115375 (= (getValueByKey!492 lt!427997 (_1!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!266 (List!19314 (_ BitVec 64) V!32599) Unit!31954)

(assert (=> d!115375 (= lt!427996 (lemmaContainsTupThenGetReturnValue!266 lt!427997 (_1!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(declare-fun insertStrictlySorted!323 (List!19314 (_ BitVec 64) V!32599) List!19314)

(assert (=> d!115375 (= lt!427997 (insertStrictlySorted!323 (toList!6124 call!41349) (_1!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(assert (=> d!115375 (= (+!2870 call!41349 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))) lt!427998)))

(declare-fun b!950440 () Bool)

(declare-fun res!637121 () Bool)

(assert (=> b!950440 (=> (not res!637121) (not e!535152))))

(assert (=> b!950440 (= res!637121 (= (getValueByKey!492 (toList!6124 lt!427998) (_1!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(declare-fun b!950441 () Bool)

(declare-fun contains!5226 (List!19314 tuple2!13518) Bool)

(assert (=> b!950441 (= e!535152 (contains!5226 (toList!6124 lt!427998) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))

(assert (= (and d!115375 res!637120) b!950440))

(assert (= (and b!950440 res!637121) b!950441))

(declare-fun m!883455 () Bool)

(assert (=> d!115375 m!883455))

(declare-fun m!883457 () Bool)

(assert (=> d!115375 m!883457))

(declare-fun m!883459 () Bool)

(assert (=> d!115375 m!883459))

(declare-fun m!883461 () Bool)

(assert (=> d!115375 m!883461))

(declare-fun m!883463 () Bool)

(assert (=> b!950440 m!883463))

(declare-fun m!883465 () Bool)

(assert (=> b!950441 m!883465))

(assert (=> b!950379 d!115375))

(declare-fun b!950454 () Bool)

(declare-fun e!535159 () SeekEntryResult!9094)

(assert (=> b!950454 (= e!535159 (MissingVacant!9094 (index!38749 lt!427982)))))

(declare-fun lt!428004 () SeekEntryResult!9094)

(declare-fun d!115377 () Bool)

(assert (=> d!115377 (and (or ((_ is Undefined!9094) lt!428004) (not ((_ is Found!9094) lt!428004)) (and (bvsge (index!38748 lt!428004) #b00000000000000000000000000000000) (bvslt (index!38748 lt!428004) (size!28133 (_keys!10719 thiss!1141))))) (or ((_ is Undefined!9094) lt!428004) ((_ is Found!9094) lt!428004) (not ((_ is MissingVacant!9094) lt!428004)) (not (= (index!38750 lt!428004) (index!38749 lt!427982))) (and (bvsge (index!38750 lt!428004) #b00000000000000000000000000000000) (bvslt (index!38750 lt!428004) (size!28133 (_keys!10719 thiss!1141))))) (or ((_ is Undefined!9094) lt!428004) (ite ((_ is Found!9094) lt!428004) (= (select (arr!27656 (_keys!10719 thiss!1141)) (index!38748 lt!428004)) key!756) (and ((_ is MissingVacant!9094) lt!428004) (= (index!38750 lt!428004) (index!38749 lt!427982)) (= (select (arr!27656 (_keys!10719 thiss!1141)) (index!38750 lt!428004)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!535161 () SeekEntryResult!9094)

(assert (=> d!115377 (= lt!428004 e!535161)))

(declare-fun c!99385 () Bool)

(assert (=> d!115377 (= c!99385 (bvsge (x!81656 lt!427982) #b01111111111111111111111111111110))))

(declare-fun lt!428003 () (_ BitVec 64))

(assert (=> d!115377 (= lt!428003 (select (arr!27656 (_keys!10719 thiss!1141)) (index!38749 lt!427982)))))

(assert (=> d!115377 (validMask!0 (mask!27586 thiss!1141))))

(assert (=> d!115377 (= (seekKeyOrZeroReturnVacant!0 (x!81656 lt!427982) (index!38749 lt!427982) (index!38749 lt!427982) key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)) lt!428004)))

(declare-fun b!950455 () Bool)

(declare-fun e!535160 () SeekEntryResult!9094)

(assert (=> b!950455 (= e!535160 (Found!9094 (index!38749 lt!427982)))))

(declare-fun b!950456 () Bool)

(assert (=> b!950456 (= e!535161 e!535160)))

(declare-fun c!99384 () Bool)

(assert (=> b!950456 (= c!99384 (= lt!428003 key!756))))

(declare-fun b!950457 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950457 (= e!535159 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81656 lt!427982) #b00000000000000000000000000000001) (nextIndex!0 (index!38749 lt!427982) (bvadd (x!81656 lt!427982) #b00000000000000000000000000000001) (mask!27586 thiss!1141)) (index!38749 lt!427982) key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)))))

(declare-fun b!950458 () Bool)

(declare-fun c!99383 () Bool)

(assert (=> b!950458 (= c!99383 (= lt!428003 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950458 (= e!535160 e!535159)))

(declare-fun b!950459 () Bool)

(assert (=> b!950459 (= e!535161 Undefined!9094)))

(assert (= (and d!115377 c!99385) b!950459))

(assert (= (and d!115377 (not c!99385)) b!950456))

(assert (= (and b!950456 c!99384) b!950455))

(assert (= (and b!950456 (not c!99384)) b!950458))

(assert (= (and b!950458 c!99383) b!950454))

(assert (= (and b!950458 (not c!99383)) b!950457))

(declare-fun m!883467 () Bool)

(assert (=> d!115377 m!883467))

(declare-fun m!883469 () Bool)

(assert (=> d!115377 m!883469))

(assert (=> d!115377 m!883435))

(assert (=> d!115377 m!883313))

(declare-fun m!883471 () Bool)

(assert (=> b!950457 m!883471))

(assert (=> b!950457 m!883471))

(declare-fun m!883473 () Bool)

(assert (=> b!950457 m!883473))

(assert (=> b!950411 d!115377))

(declare-fun d!115379 () Bool)

(declare-fun e!535162 () Bool)

(assert (=> d!115379 e!535162))

(declare-fun res!637122 () Bool)

(assert (=> d!115379 (=> (not res!637122) (not e!535162))))

(declare-fun lt!428008 () ListLongMap!12217)

(assert (=> d!115379 (= res!637122 (contains!5223 lt!428008 (_1!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(declare-fun lt!428007 () List!19314)

(assert (=> d!115379 (= lt!428008 (ListLongMap!12218 lt!428007))))

(declare-fun lt!428005 () Unit!31954)

(declare-fun lt!428006 () Unit!31954)

(assert (=> d!115379 (= lt!428005 lt!428006)))

(assert (=> d!115379 (= (getValueByKey!492 lt!428007 (_1!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))) (Some!497 (_2!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(assert (=> d!115379 (= lt!428006 (lemmaContainsTupThenGetReturnValue!266 lt!428007 (_1!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (_2!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(assert (=> d!115379 (= lt!428007 (insertStrictlySorted!323 (toList!6124 (ite c!99365 call!41351 (ite c!99366 call!41350 call!41352))) (_1!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) (_2!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))))))

(assert (=> d!115379 (= (+!2870 (ite c!99365 call!41351 (ite c!99366 call!41350 call!41352)) (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))) lt!428008)))

(declare-fun b!950460 () Bool)

(declare-fun res!637123 () Bool)

(assert (=> b!950460 (=> (not res!637123) (not e!535162))))

(assert (=> b!950460 (= res!637123 (= (getValueByKey!492 (toList!6124 lt!428008) (_1!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141))))) (Some!497 (_2!6770 (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))))

(declare-fun b!950461 () Bool)

(assert (=> b!950461 (= e!535162 (contains!5226 (toList!6124 lt!428008) (ite (or c!99365 c!99366) (tuple2!13519 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5599 thiss!1141)) (tuple2!13519 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5599 thiss!1141)))))))

(assert (= (and d!115379 res!637122) b!950460))

(assert (= (and b!950460 res!637123) b!950461))

(declare-fun m!883475 () Bool)

(assert (=> d!115379 m!883475))

(declare-fun m!883477 () Bool)

(assert (=> d!115379 m!883477))

(declare-fun m!883479 () Bool)

(assert (=> d!115379 m!883479))

(declare-fun m!883481 () Bool)

(assert (=> d!115379 m!883481))

(declare-fun m!883483 () Bool)

(assert (=> b!950460 m!883483))

(declare-fun m!883485 () Bool)

(assert (=> b!950461 m!883485))

(assert (=> bm!41348 d!115379))

(declare-fun d!115381 () Bool)

(declare-fun e!535177 () Bool)

(assert (=> d!115381 e!535177))

(declare-fun res!637133 () Bool)

(assert (=> d!115381 (=> (not res!637133) (not e!535177))))

(declare-fun lt!428025 () ListLongMap!12217)

(assert (=> d!115381 (= res!637133 (not (contains!5223 lt!428025 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!535179 () ListLongMap!12217)

(assert (=> d!115381 (= lt!428025 e!535179)))

(declare-fun c!99396 () Bool)

(assert (=> d!115381 (= c!99396 (bvsge #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(assert (=> d!115381 (validMask!0 (mask!27586 thiss!1141))))

(assert (=> d!115381 (= (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)) lt!428025)))

(declare-fun b!950486 () Bool)

(declare-fun lt!428028 () Unit!31954)

(declare-fun lt!428029 () Unit!31954)

(assert (=> b!950486 (= lt!428028 lt!428029)))

(declare-fun lt!428024 () (_ BitVec 64))

(declare-fun lt!428027 () V!32599)

(declare-fun lt!428023 () (_ BitVec 64))

(declare-fun lt!428026 () ListLongMap!12217)

(assert (=> b!950486 (not (contains!5223 (+!2870 lt!428026 (tuple2!13519 lt!428024 lt!428027)) lt!428023))))

(declare-fun addStillNotContains!228 (ListLongMap!12217 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31954)

(assert (=> b!950486 (= lt!428029 (addStillNotContains!228 lt!428026 lt!428024 lt!428027 lt!428023))))

(assert (=> b!950486 (= lt!428023 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!950486 (= lt!428027 (get!14544 (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1667 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!950486 (= lt!428024 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun call!41355 () ListLongMap!12217)

(assert (=> b!950486 (= lt!428026 call!41355)))

(declare-fun e!535178 () ListLongMap!12217)

(assert (=> b!950486 (= e!535178 (+!2870 call!41355 (tuple2!13519 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000) (get!14544 (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1667 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!950487 () Bool)

(declare-fun e!535180 () Bool)

(assert (=> b!950487 (= e!535180 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950487 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!950488 () Bool)

(declare-fun e!535183 () Bool)

(declare-fun isEmpty!716 (ListLongMap!12217) Bool)

(assert (=> b!950488 (= e!535183 (isEmpty!716 lt!428025))))

(declare-fun b!950489 () Bool)

(assert (=> b!950489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(assert (=> b!950489 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28132 (_values!5786 thiss!1141))))))

(declare-fun e!535181 () Bool)

(assert (=> b!950489 (= e!535181 (= (apply!884 lt!428025 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)) (get!14544 (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1667 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!950490 () Bool)

(declare-fun e!535182 () Bool)

(assert (=> b!950490 (= e!535177 e!535182)))

(declare-fun c!99395 () Bool)

(assert (=> b!950490 (= c!99395 e!535180)))

(declare-fun res!637134 () Bool)

(assert (=> b!950490 (=> (not res!637134) (not e!535180))))

(assert (=> b!950490 (= res!637134 (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun b!950491 () Bool)

(declare-fun res!637135 () Bool)

(assert (=> b!950491 (=> (not res!637135) (not e!535177))))

(assert (=> b!950491 (= res!637135 (not (contains!5223 lt!428025 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!41352 () Bool)

(assert (=> bm!41352 (= call!41355 (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5763 thiss!1141)))))

(declare-fun b!950492 () Bool)

(assert (=> b!950492 (= e!535178 call!41355)))

(declare-fun b!950493 () Bool)

(assert (=> b!950493 (= e!535182 e!535181)))

(assert (=> b!950493 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun res!637132 () Bool)

(assert (=> b!950493 (= res!637132 (contains!5223 lt!428025 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!950493 (=> (not res!637132) (not e!535181))))

(declare-fun b!950494 () Bool)

(assert (=> b!950494 (= e!535179 (ListLongMap!12218 Nil!19311))))

(declare-fun b!950495 () Bool)

(assert (=> b!950495 (= e!535179 e!535178)))

(declare-fun c!99397 () Bool)

(assert (=> b!950495 (= c!99397 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950496 () Bool)

(assert (=> b!950496 (= e!535182 e!535183)))

(declare-fun c!99394 () Bool)

(assert (=> b!950496 (= c!99394 (bvslt #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun b!950497 () Bool)

(assert (=> b!950497 (= e!535183 (= lt!428025 (getCurrentListMapNoExtraKeys!3358 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5763 thiss!1141))))))

(assert (= (and d!115381 c!99396) b!950494))

(assert (= (and d!115381 (not c!99396)) b!950495))

(assert (= (and b!950495 c!99397) b!950486))

(assert (= (and b!950495 (not c!99397)) b!950492))

(assert (= (or b!950486 b!950492) bm!41352))

(assert (= (and d!115381 res!637133) b!950491))

(assert (= (and b!950491 res!637135) b!950490))

(assert (= (and b!950490 res!637134) b!950487))

(assert (= (and b!950490 c!99395) b!950493))

(assert (= (and b!950490 (not c!99395)) b!950496))

(assert (= (and b!950493 res!637132) b!950489))

(assert (= (and b!950496 c!99394) b!950497))

(assert (= (and b!950496 (not c!99394)) b!950488))

(declare-fun b_lambda!14365 () Bool)

(assert (=> (not b_lambda!14365) (not b!950486)))

(assert (=> b!950486 t!27643))

(declare-fun b_and!29681 () Bool)

(assert (= b_and!29679 (and (=> t!27643 result!12269) b_and!29681)))

(declare-fun b_lambda!14367 () Bool)

(assert (=> (not b_lambda!14367) (not b!950489)))

(assert (=> b!950489 t!27643))

(declare-fun b_and!29683 () Bool)

(assert (= b_and!29681 (and (=> t!27643 result!12269) b_and!29683)))

(assert (=> b!950487 m!883399))

(assert (=> b!950487 m!883399))

(assert (=> b!950487 m!883403))

(assert (=> b!950486 m!883417))

(assert (=> b!950486 m!883417))

(assert (=> b!950486 m!883415))

(assert (=> b!950486 m!883419))

(declare-fun m!883487 () Bool)

(assert (=> b!950486 m!883487))

(assert (=> b!950486 m!883399))

(declare-fun m!883489 () Bool)

(assert (=> b!950486 m!883489))

(declare-fun m!883491 () Bool)

(assert (=> b!950486 m!883491))

(assert (=> b!950486 m!883491))

(declare-fun m!883493 () Bool)

(assert (=> b!950486 m!883493))

(assert (=> b!950486 m!883415))

(declare-fun m!883495 () Bool)

(assert (=> b!950488 m!883495))

(declare-fun m!883497 () Bool)

(assert (=> bm!41352 m!883497))

(assert (=> b!950489 m!883417))

(assert (=> b!950489 m!883417))

(assert (=> b!950489 m!883415))

(assert (=> b!950489 m!883419))

(assert (=> b!950489 m!883399))

(assert (=> b!950489 m!883399))

(declare-fun m!883499 () Bool)

(assert (=> b!950489 m!883499))

(assert (=> b!950489 m!883415))

(declare-fun m!883501 () Bool)

(assert (=> d!115381 m!883501))

(assert (=> d!115381 m!883313))

(declare-fun m!883503 () Bool)

(assert (=> b!950491 m!883503))

(assert (=> b!950497 m!883497))

(assert (=> b!950495 m!883399))

(assert (=> b!950495 m!883399))

(assert (=> b!950495 m!883403))

(assert (=> b!950493 m!883399))

(assert (=> b!950493 m!883399))

(declare-fun m!883505 () Bool)

(assert (=> b!950493 m!883505))

(assert (=> bm!41349 d!115381))

(assert (=> d!115365 d!115371))

(declare-fun b!950516 () Bool)

(declare-fun e!535196 () SeekEntryResult!9094)

(assert (=> b!950516 (= e!535196 (Intermediate!9094 false (toIndex!0 key!756 (mask!27586 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!950517 () Bool)

(declare-fun e!535195 () Bool)

(declare-fun e!535197 () Bool)

(assert (=> b!950517 (= e!535195 e!535197)))

(declare-fun res!637143 () Bool)

(declare-fun lt!428035 () SeekEntryResult!9094)

(assert (=> b!950517 (= res!637143 (and ((_ is Intermediate!9094) lt!428035) (not (undefined!9906 lt!428035)) (bvslt (x!81656 lt!428035) #b01111111111111111111111111111110) (bvsge (x!81656 lt!428035) #b00000000000000000000000000000000) (bvsge (x!81656 lt!428035) #b00000000000000000000000000000000)))))

(assert (=> b!950517 (=> (not res!637143) (not e!535197))))

(declare-fun b!950518 () Bool)

(assert (=> b!950518 (= e!535196 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27586 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27586 thiss!1141)) key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)))))

(declare-fun b!950519 () Bool)

(assert (=> b!950519 (and (bvsge (index!38749 lt!428035) #b00000000000000000000000000000000) (bvslt (index!38749 lt!428035) (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun e!535198 () Bool)

(assert (=> b!950519 (= e!535198 (= (select (arr!27656 (_keys!10719 thiss!1141)) (index!38749 lt!428035)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950520 () Bool)

(declare-fun e!535194 () SeekEntryResult!9094)

(assert (=> b!950520 (= e!535194 (Intermediate!9094 true (toIndex!0 key!756 (mask!27586 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!115383 () Bool)

(assert (=> d!115383 e!535195))

(declare-fun c!99404 () Bool)

(assert (=> d!115383 (= c!99404 (and ((_ is Intermediate!9094) lt!428035) (undefined!9906 lt!428035)))))

(assert (=> d!115383 (= lt!428035 e!535194)))

(declare-fun c!99405 () Bool)

(assert (=> d!115383 (= c!99405 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!428034 () (_ BitVec 64))

(assert (=> d!115383 (= lt!428034 (select (arr!27656 (_keys!10719 thiss!1141)) (toIndex!0 key!756 (mask!27586 thiss!1141))))))

(assert (=> d!115383 (validMask!0 (mask!27586 thiss!1141))))

(assert (=> d!115383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27586 thiss!1141)) key!756 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)) lt!428035)))

(declare-fun b!950521 () Bool)

(assert (=> b!950521 (and (bvsge (index!38749 lt!428035) #b00000000000000000000000000000000) (bvslt (index!38749 lt!428035) (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun res!637142 () Bool)

(assert (=> b!950521 (= res!637142 (= (select (arr!27656 (_keys!10719 thiss!1141)) (index!38749 lt!428035)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950521 (=> res!637142 e!535198)))

(declare-fun b!950522 () Bool)

(assert (=> b!950522 (= e!535195 (bvsge (x!81656 lt!428035) #b01111111111111111111111111111110))))

(declare-fun b!950523 () Bool)

(assert (=> b!950523 (and (bvsge (index!38749 lt!428035) #b00000000000000000000000000000000) (bvslt (index!38749 lt!428035) (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun res!637144 () Bool)

(assert (=> b!950523 (= res!637144 (= (select (arr!27656 (_keys!10719 thiss!1141)) (index!38749 lt!428035)) key!756))))

(assert (=> b!950523 (=> res!637144 e!535198)))

(assert (=> b!950523 (= e!535197 e!535198)))

(declare-fun b!950524 () Bool)

(assert (=> b!950524 (= e!535194 e!535196)))

(declare-fun c!99406 () Bool)

(assert (=> b!950524 (= c!99406 (or (= lt!428034 key!756) (= (bvadd lt!428034 lt!428034) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115383 c!99405) b!950520))

(assert (= (and d!115383 (not c!99405)) b!950524))

(assert (= (and b!950524 c!99406) b!950516))

(assert (= (and b!950524 (not c!99406)) b!950518))

(assert (= (and d!115383 c!99404) b!950522))

(assert (= (and d!115383 (not c!99404)) b!950517))

(assert (= (and b!950517 res!637143) b!950523))

(assert (= (and b!950523 (not res!637144)) b!950521))

(assert (= (and b!950521 (not res!637142)) b!950519))

(assert (=> b!950518 m!883431))

(declare-fun m!883507 () Bool)

(assert (=> b!950518 m!883507))

(assert (=> b!950518 m!883507))

(declare-fun m!883509 () Bool)

(assert (=> b!950518 m!883509))

(declare-fun m!883511 () Bool)

(assert (=> b!950521 m!883511))

(assert (=> d!115383 m!883431))

(declare-fun m!883513 () Bool)

(assert (=> d!115383 m!883513))

(assert (=> d!115383 m!883313))

(assert (=> b!950523 m!883511))

(assert (=> b!950519 m!883511))

(assert (=> d!115367 d!115383))

(declare-fun d!115385 () Bool)

(declare-fun lt!428041 () (_ BitVec 32))

(declare-fun lt!428040 () (_ BitVec 32))

(assert (=> d!115385 (= lt!428041 (bvmul (bvxor lt!428040 (bvlshr lt!428040 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115385 (= lt!428040 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115385 (and (bvsge (mask!27586 thiss!1141) #b00000000000000000000000000000000) (let ((res!637145 (let ((h!20479 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81676 (bvmul (bvxor h!20479 (bvlshr h!20479 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81676 (bvlshr x!81676 #b00000000000000000000000000001101)) (mask!27586 thiss!1141)))))) (and (bvslt res!637145 (bvadd (mask!27586 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!637145 #b00000000000000000000000000000000))))))

(assert (=> d!115385 (= (toIndex!0 key!756 (mask!27586 thiss!1141)) (bvand (bvxor lt!428041 (bvlshr lt!428041 #b00000000000000000000000000001101)) (mask!27586 thiss!1141)))))

(assert (=> d!115367 d!115385))

(assert (=> d!115367 d!115371))

(declare-fun d!115387 () Bool)

(declare-fun get!14545 (Option!498) V!32599)

(assert (=> d!115387 (= (apply!884 lt!427957 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14545 (getValueByKey!492 (toList!6124 lt!427957) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26702 () Bool)

(assert (= bs!26702 d!115387))

(declare-fun m!883515 () Bool)

(assert (=> bs!26702 m!883515))

(assert (=> bs!26702 m!883515))

(declare-fun m!883517 () Bool)

(assert (=> bs!26702 m!883517))

(assert (=> b!950382 d!115387))

(declare-fun d!115389 () Bool)

(declare-fun isEmpty!717 (Option!498) Bool)

(assert (=> d!115389 (= (isDefined!365 (getValueByKey!492 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756)) (not (isEmpty!717 (getValueByKey!492 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))))

(declare-fun bs!26703 () Bool)

(assert (= bs!26703 d!115389))

(assert (=> bs!26703 m!883365))

(declare-fun m!883519 () Bool)

(assert (=> bs!26703 m!883519))

(assert (=> b!950332 d!115389))

(declare-fun b!950536 () Bool)

(declare-fun e!535204 () Option!498)

(assert (=> b!950536 (= e!535204 None!496)))

(declare-fun b!950534 () Bool)

(declare-fun e!535203 () Option!498)

(assert (=> b!950534 (= e!535203 e!535204)))

(declare-fun c!99412 () Bool)

(assert (=> b!950534 (= c!99412 (and ((_ is Cons!19310) (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (not (= (_1!6770 (h!20475 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756))))))

(declare-fun b!950535 () Bool)

(assert (=> b!950535 (= e!535204 (getValueByKey!492 (t!27639 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) key!756))))

(declare-fun b!950533 () Bool)

(assert (=> b!950533 (= e!535203 (Some!497 (_2!6770 (h!20475 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))))))

(declare-fun d!115391 () Bool)

(declare-fun c!99411 () Bool)

(assert (=> d!115391 (= c!99411 (and ((_ is Cons!19310) (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (= (_1!6770 (h!20475 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)))))

(assert (=> d!115391 (= (getValueByKey!492 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756) e!535203)))

(assert (= (and d!115391 c!99411) b!950533))

(assert (= (and d!115391 (not c!99411)) b!950534))

(assert (= (and b!950534 c!99412) b!950535))

(assert (= (and b!950534 (not c!99412)) b!950536))

(declare-fun m!883521 () Bool)

(assert (=> b!950535 m!883521))

(assert (=> b!950332 d!115391))

(declare-fun d!115393 () Bool)

(assert (=> d!115393 (= (apply!884 lt!427957 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14545 (getValueByKey!492 (toList!6124 lt!427957) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26704 () Bool)

(assert (= bs!26704 d!115393))

(declare-fun m!883523 () Bool)

(assert (=> bs!26704 m!883523))

(assert (=> bs!26704 m!883523))

(declare-fun m!883525 () Bool)

(assert (=> bs!26704 m!883525))

(assert (=> b!950389 d!115393))

(declare-fun d!115395 () Bool)

(assert (=> d!115395 (isDefined!365 (getValueByKey!492 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-fun lt!428044 () Unit!31954)

(declare-fun choose!1587 (List!19314 (_ BitVec 64)) Unit!31954)

(assert (=> d!115395 (= lt!428044 (choose!1587 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(declare-fun e!535207 () Bool)

(assert (=> d!115395 e!535207))

(declare-fun res!637148 () Bool)

(assert (=> d!115395 (=> (not res!637148) (not e!535207))))

(declare-fun isStrictlySorted!499 (List!19314) Bool)

(assert (=> d!115395 (= res!637148 (isStrictlySorted!499 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))))))

(assert (=> d!115395 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756) lt!428044)))

(declare-fun b!950539 () Bool)

(assert (=> b!950539 (= e!535207 (containsKey!463 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756))))

(assert (= (and d!115395 res!637148) b!950539))

(assert (=> d!115395 m!883365))

(assert (=> d!115395 m!883365))

(assert (=> d!115395 m!883367))

(declare-fun m!883527 () Bool)

(assert (=> d!115395 m!883527))

(declare-fun m!883529 () Bool)

(assert (=> d!115395 m!883529))

(assert (=> b!950539 m!883361))

(assert (=> b!950330 d!115395))

(assert (=> b!950330 d!115389))

(assert (=> b!950330 d!115391))

(declare-fun d!115397 () Bool)

(assert (=> d!115397 (= (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!950383 d!115397))

(declare-fun b!950548 () Bool)

(declare-fun e!535212 () (_ BitVec 32))

(declare-fun call!41358 () (_ BitVec 32))

(assert (=> b!950548 (= e!535212 call!41358)))

(declare-fun b!950549 () Bool)

(assert (=> b!950549 (= e!535212 (bvadd #b00000000000000000000000000000001 call!41358))))

(declare-fun bm!41355 () Bool)

(assert (=> bm!41355 (= call!41358 (arrayCountValidKeys!0 (_keys!10719 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28133 (_keys!10719 thiss!1141))))))

(declare-fun d!115399 () Bool)

(declare-fun lt!428047 () (_ BitVec 32))

(assert (=> d!115399 (and (bvsge lt!428047 #b00000000000000000000000000000000) (bvsle lt!428047 (bvsub (size!28133 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535213 () (_ BitVec 32))

(assert (=> d!115399 (= lt!428047 e!535213)))

(declare-fun c!99418 () Bool)

(assert (=> d!115399 (= c!99418 (bvsge #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(assert (=> d!115399 (and (bvsle #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28133 (_keys!10719 thiss!1141)) (size!28133 (_keys!10719 thiss!1141))))))

(assert (=> d!115399 (= (arrayCountValidKeys!0 (_keys!10719 thiss!1141) #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))) lt!428047)))

(declare-fun b!950550 () Bool)

(assert (=> b!950550 (= e!535213 #b00000000000000000000000000000000)))

(declare-fun b!950551 () Bool)

(assert (=> b!950551 (= e!535213 e!535212)))

(declare-fun c!99417 () Bool)

(assert (=> b!950551 (= c!99417 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115399 c!99418) b!950550))

(assert (= (and d!115399 (not c!99418)) b!950551))

(assert (= (and b!950551 c!99417) b!950549))

(assert (= (and b!950551 (not c!99417)) b!950548))

(assert (= (or b!950549 b!950548) bm!41355))

(declare-fun m!883531 () Bool)

(assert (=> bm!41355 m!883531))

(assert (=> b!950551 m!883399))

(assert (=> b!950551 m!883399))

(assert (=> b!950551 m!883403))

(assert (=> b!950422 d!115399))

(declare-fun d!115401 () Bool)

(declare-fun res!637157 () Bool)

(declare-fun e!535216 () Bool)

(assert (=> d!115401 (=> (not res!637157) (not e!535216))))

(assert (=> d!115401 (= res!637157 (validMask!0 (mask!27586 thiss!1141)))))

(assert (=> d!115401 (= (simpleValid!371 thiss!1141) e!535216)))

(declare-fun b!950562 () Bool)

(declare-fun res!637160 () Bool)

(assert (=> b!950562 (=> (not res!637160) (not e!535216))))

(declare-fun size!28138 (LongMapFixedSize!4912) (_ BitVec 32))

(assert (=> b!950562 (= res!637160 (= (size!28138 thiss!1141) (bvadd (_size!2511 thiss!1141) (bvsdiv (bvadd (extraKeys!5495 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!950561 () Bool)

(declare-fun res!637158 () Bool)

(assert (=> b!950561 (=> (not res!637158) (not e!535216))))

(assert (=> b!950561 (= res!637158 (bvsge (size!28138 thiss!1141) (_size!2511 thiss!1141)))))

(declare-fun b!950563 () Bool)

(assert (=> b!950563 (= e!535216 (and (bvsge (extraKeys!5495 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5495 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2511 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!950560 () Bool)

(declare-fun res!637159 () Bool)

(assert (=> b!950560 (=> (not res!637159) (not e!535216))))

(assert (=> b!950560 (= res!637159 (and (= (size!28132 (_values!5786 thiss!1141)) (bvadd (mask!27586 thiss!1141) #b00000000000000000000000000000001)) (= (size!28133 (_keys!10719 thiss!1141)) (size!28132 (_values!5786 thiss!1141))) (bvsge (_size!2511 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2511 thiss!1141) (bvadd (mask!27586 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!115401 res!637157) b!950560))

(assert (= (and b!950560 res!637159) b!950561))

(assert (= (and b!950561 res!637158) b!950562))

(assert (= (and b!950562 res!637160) b!950563))

(assert (=> d!115401 m!883313))

(declare-fun m!883533 () Bool)

(assert (=> b!950562 m!883533))

(assert (=> b!950561 m!883533))

(assert (=> d!115369 d!115401))

(declare-fun d!115403 () Bool)

(declare-fun res!637166 () Bool)

(declare-fun e!535224 () Bool)

(assert (=> d!115403 (=> res!637166 e!535224)))

(assert (=> d!115403 (= res!637166 (bvsge #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(assert (=> d!115403 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10719 thiss!1141) (mask!27586 thiss!1141)) e!535224)))

(declare-fun bm!41358 () Bool)

(declare-fun call!41361 () Bool)

(assert (=> bm!41358 (= call!41361 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10719 thiss!1141) (mask!27586 thiss!1141)))))

(declare-fun b!950572 () Bool)

(declare-fun e!535223 () Bool)

(assert (=> b!950572 (= e!535223 call!41361)))

(declare-fun b!950573 () Bool)

(declare-fun e!535225 () Bool)

(assert (=> b!950573 (= e!535223 e!535225)))

(declare-fun lt!428055 () (_ BitVec 64))

(assert (=> b!950573 (= lt!428055 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428056 () Unit!31954)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57515 (_ BitVec 64) (_ BitVec 32)) Unit!31954)

(assert (=> b!950573 (= lt!428056 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10719 thiss!1141) lt!428055 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950573 (arrayContainsKey!0 (_keys!10719 thiss!1141) lt!428055 #b00000000000000000000000000000000)))

(declare-fun lt!428054 () Unit!31954)

(assert (=> b!950573 (= lt!428054 lt!428056)))

(declare-fun res!637165 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57515 (_ BitVec 32)) SeekEntryResult!9094)

(assert (=> b!950573 (= res!637165 (= (seekEntryOrOpen!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000) (_keys!10719 thiss!1141) (mask!27586 thiss!1141)) (Found!9094 #b00000000000000000000000000000000)))))

(assert (=> b!950573 (=> (not res!637165) (not e!535225))))

(declare-fun b!950574 () Bool)

(assert (=> b!950574 (= e!535225 call!41361)))

(declare-fun b!950575 () Bool)

(assert (=> b!950575 (= e!535224 e!535223)))

(declare-fun c!99421 () Bool)

(assert (=> b!950575 (= c!99421 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115403 (not res!637166)) b!950575))

(assert (= (and b!950575 c!99421) b!950573))

(assert (= (and b!950575 (not c!99421)) b!950572))

(assert (= (and b!950573 res!637165) b!950574))

(assert (= (or b!950574 b!950572) bm!41358))

(declare-fun m!883535 () Bool)

(assert (=> bm!41358 m!883535))

(assert (=> b!950573 m!883399))

(declare-fun m!883537 () Bool)

(assert (=> b!950573 m!883537))

(declare-fun m!883539 () Bool)

(assert (=> b!950573 m!883539))

(assert (=> b!950573 m!883399))

(declare-fun m!883541 () Bool)

(assert (=> b!950573 m!883541))

(assert (=> b!950575 m!883399))

(assert (=> b!950575 m!883399))

(assert (=> b!950575 m!883403))

(assert (=> b!950423 d!115403))

(assert (=> b!950393 d!115397))

(declare-fun d!115405 () Bool)

(assert (=> d!115405 (= (apply!884 lt!427957 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)) (get!14545 (getValueByKey!492 (toList!6124 lt!427957) (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26705 () Bool)

(assert (= bs!26705 d!115405))

(assert (=> bs!26705 m!883399))

(assert (=> bs!26705 m!883451))

(assert (=> bs!26705 m!883451))

(declare-fun m!883543 () Bool)

(assert (=> bs!26705 m!883543))

(assert (=> b!950385 d!115405))

(declare-fun d!115407 () Bool)

(declare-fun c!99424 () Bool)

(assert (=> d!115407 (= c!99424 ((_ is ValueCellFull!9881) (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535228 () V!32599)

(assert (=> d!115407 (= (get!14544 (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1667 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!535228)))

(declare-fun b!950580 () Bool)

(declare-fun get!14546 (ValueCell!9881 V!32599) V!32599)

(assert (=> b!950580 (= e!535228 (get!14546 (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1667 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!950581 () Bool)

(declare-fun get!14547 (ValueCell!9881 V!32599) V!32599)

(assert (=> b!950581 (= e!535228 (get!14547 (select (arr!27655 (_values!5786 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1667 (defaultEntry!5763 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115407 c!99424) b!950580))

(assert (= (and d!115407 (not c!99424)) b!950581))

(assert (=> b!950580 m!883417))

(assert (=> b!950580 m!883415))

(declare-fun m!883545 () Bool)

(assert (=> b!950580 m!883545))

(assert (=> b!950581 m!883417))

(assert (=> b!950581 m!883415))

(declare-fun m!883547 () Bool)

(assert (=> b!950581 m!883547))

(assert (=> b!950385 d!115407))

(declare-fun d!115409 () Bool)

(declare-fun e!535229 () Bool)

(assert (=> d!115409 e!535229))

(declare-fun res!637167 () Bool)

(assert (=> d!115409 (=> res!637167 e!535229)))

(declare-fun lt!428059 () Bool)

(assert (=> d!115409 (= res!637167 (not lt!428059))))

(declare-fun lt!428060 () Bool)

(assert (=> d!115409 (= lt!428059 lt!428060)))

(declare-fun lt!428058 () Unit!31954)

(declare-fun e!535230 () Unit!31954)

(assert (=> d!115409 (= lt!428058 e!535230)))

(declare-fun c!99425 () Bool)

(assert (=> d!115409 (= c!99425 lt!428060)))

(assert (=> d!115409 (= lt!428060 (containsKey!463 (toList!6124 lt!427957) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115409 (= (contains!5223 lt!427957 #b1000000000000000000000000000000000000000000000000000000000000000) lt!428059)))

(declare-fun b!950582 () Bool)

(declare-fun lt!428057 () Unit!31954)

(assert (=> b!950582 (= e!535230 lt!428057)))

(assert (=> b!950582 (= lt!428057 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6124 lt!427957) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950582 (isDefined!365 (getValueByKey!492 (toList!6124 lt!427957) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950583 () Bool)

(declare-fun Unit!31959 () Unit!31954)

(assert (=> b!950583 (= e!535230 Unit!31959)))

(declare-fun b!950584 () Bool)

(assert (=> b!950584 (= e!535229 (isDefined!365 (getValueByKey!492 (toList!6124 lt!427957) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115409 c!99425) b!950582))

(assert (= (and d!115409 (not c!99425)) b!950583))

(assert (= (and d!115409 (not res!637167)) b!950584))

(declare-fun m!883549 () Bool)

(assert (=> d!115409 m!883549))

(declare-fun m!883551 () Bool)

(assert (=> b!950582 m!883551))

(assert (=> b!950582 m!883523))

(assert (=> b!950582 m!883523))

(declare-fun m!883553 () Bool)

(assert (=> b!950582 m!883553))

(assert (=> b!950584 m!883523))

(assert (=> b!950584 m!883523))

(assert (=> b!950584 m!883553))

(assert (=> bm!41343 d!115409))

(declare-fun b!950595 () Bool)

(declare-fun e!535239 () Bool)

(declare-fun e!535240 () Bool)

(assert (=> b!950595 (= e!535239 e!535240)))

(declare-fun c!99428 () Bool)

(assert (=> b!950595 (= c!99428 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950596 () Bool)

(declare-fun e!535242 () Bool)

(assert (=> b!950596 (= e!535242 e!535239)))

(declare-fun res!637174 () Bool)

(assert (=> b!950596 (=> (not res!637174) (not e!535239))))

(declare-fun e!535241 () Bool)

(assert (=> b!950596 (= res!637174 (not e!535241))))

(declare-fun res!637175 () Bool)

(assert (=> b!950596 (=> (not res!637175) (not e!535241))))

(assert (=> b!950596 (= res!637175 (validKeyInArray!0 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950597 () Bool)

(declare-fun contains!5227 (List!19317 (_ BitVec 64)) Bool)

(assert (=> b!950597 (= e!535241 (contains!5227 Nil!19314 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!950598 () Bool)

(declare-fun call!41364 () Bool)

(assert (=> b!950598 (= e!535240 call!41364)))

(declare-fun bm!41361 () Bool)

(assert (=> bm!41361 (= call!41364 (arrayNoDuplicates!0 (_keys!10719 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99428 (Cons!19313 (select (arr!27656 (_keys!10719 thiss!1141)) #b00000000000000000000000000000000) Nil!19314) Nil!19314)))))

(declare-fun b!950599 () Bool)

(assert (=> b!950599 (= e!535240 call!41364)))

(declare-fun d!115411 () Bool)

(declare-fun res!637176 () Bool)

(assert (=> d!115411 (=> res!637176 e!535242)))

(assert (=> d!115411 (= res!637176 (bvsge #b00000000000000000000000000000000 (size!28133 (_keys!10719 thiss!1141))))))

(assert (=> d!115411 (= (arrayNoDuplicates!0 (_keys!10719 thiss!1141) #b00000000000000000000000000000000 Nil!19314) e!535242)))

(assert (= (and d!115411 (not res!637176)) b!950596))

(assert (= (and b!950596 res!637175) b!950597))

(assert (= (and b!950596 res!637174) b!950595))

(assert (= (and b!950595 c!99428) b!950599))

(assert (= (and b!950595 (not c!99428)) b!950598))

(assert (= (or b!950599 b!950598) bm!41361))

(assert (=> b!950595 m!883399))

(assert (=> b!950595 m!883399))

(assert (=> b!950595 m!883403))

(assert (=> b!950596 m!883399))

(assert (=> b!950596 m!883399))

(assert (=> b!950596 m!883403))

(assert (=> b!950597 m!883399))

(assert (=> b!950597 m!883399))

(declare-fun m!883555 () Bool)

(assert (=> b!950597 m!883555))

(assert (=> bm!41361 m!883399))

(declare-fun m!883557 () Bool)

(assert (=> bm!41361 m!883557))

(assert (=> b!950424 d!115411))

(declare-fun d!115413 () Bool)

(assert (=> d!115413 (= (apply!884 (+!2870 lt!427960 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))) lt!427950) (get!14545 (getValueByKey!492 (toList!6124 (+!2870 lt!427960 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141)))) lt!427950)))))

(declare-fun bs!26706 () Bool)

(assert (= bs!26706 d!115413))

(declare-fun m!883559 () Bool)

(assert (=> bs!26706 m!883559))

(assert (=> bs!26706 m!883559))

(declare-fun m!883561 () Bool)

(assert (=> bs!26706 m!883561))

(assert (=> b!950376 d!115413))

(declare-fun d!115415 () Bool)

(assert (=> d!115415 (= (apply!884 lt!427963 lt!427961) (get!14545 (getValueByKey!492 (toList!6124 lt!427963) lt!427961)))))

(declare-fun bs!26707 () Bool)

(assert (= bs!26707 d!115415))

(declare-fun m!883563 () Bool)

(assert (=> bs!26707 m!883563))

(assert (=> bs!26707 m!883563))

(declare-fun m!883565 () Bool)

(assert (=> bs!26707 m!883565))

(assert (=> b!950376 d!115415))

(declare-fun d!115417 () Bool)

(declare-fun e!535243 () Bool)

(assert (=> d!115417 e!535243))

(declare-fun res!637177 () Bool)

(assert (=> d!115417 (=> (not res!637177) (not e!535243))))

(declare-fun lt!428064 () ListLongMap!12217)

(assert (=> d!115417 (= res!637177 (contains!5223 lt!428064 (_1!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141)))))))

(declare-fun lt!428063 () List!19314)

(assert (=> d!115417 (= lt!428064 (ListLongMap!12218 lt!428063))))

(declare-fun lt!428061 () Unit!31954)

(declare-fun lt!428062 () Unit!31954)

(assert (=> d!115417 (= lt!428061 lt!428062)))

(assert (=> d!115417 (= (getValueByKey!492 lt!428063 (_1!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!115417 (= lt!428062 (lemmaContainsTupThenGetReturnValue!266 lt!428063 (_1!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!115417 (= lt!428063 (insertStrictlySorted!323 (toList!6124 lt!427968) (_1!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!115417 (= (+!2870 lt!427968 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))) lt!428064)))

(declare-fun b!950600 () Bool)

(declare-fun res!637178 () Bool)

(assert (=> b!950600 (=> (not res!637178) (not e!535243))))

(assert (=> b!950600 (= res!637178 (= (getValueByKey!492 (toList!6124 lt!428064) (_1!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))))))))

(declare-fun b!950601 () Bool)

(assert (=> b!950601 (= e!535243 (contains!5226 (toList!6124 lt!428064) (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))))))

(assert (= (and d!115417 res!637177) b!950600))

(assert (= (and b!950600 res!637178) b!950601))

(declare-fun m!883567 () Bool)

(assert (=> d!115417 m!883567))

(declare-fun m!883569 () Bool)

(assert (=> d!115417 m!883569))

(declare-fun m!883571 () Bool)

(assert (=> d!115417 m!883571))

(declare-fun m!883573 () Bool)

(assert (=> d!115417 m!883573))

(declare-fun m!883575 () Bool)

(assert (=> b!950600 m!883575))

(declare-fun m!883577 () Bool)

(assert (=> b!950601 m!883577))

(assert (=> b!950376 d!115417))

(declare-fun d!115419 () Bool)

(assert (=> d!115419 (= (apply!884 (+!2870 lt!427960 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))) lt!427950) (apply!884 lt!427960 lt!427950))))

(declare-fun lt!428067 () Unit!31954)

(declare-fun choose!1588 (ListLongMap!12217 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31954)

(assert (=> d!115419 (= lt!428067 (choose!1588 lt!427960 lt!427962 (minValue!5599 thiss!1141) lt!427950))))

(declare-fun e!535246 () Bool)

(assert (=> d!115419 e!535246))

(declare-fun res!637181 () Bool)

(assert (=> d!115419 (=> (not res!637181) (not e!535246))))

(assert (=> d!115419 (= res!637181 (contains!5223 lt!427960 lt!427950))))

(assert (=> d!115419 (= (addApplyDifferent!454 lt!427960 lt!427962 (minValue!5599 thiss!1141) lt!427950) lt!428067)))

(declare-fun b!950605 () Bool)

(assert (=> b!950605 (= e!535246 (not (= lt!427950 lt!427962)))))

(assert (= (and d!115419 res!637181) b!950605))

(declare-fun m!883579 () Bool)

(assert (=> d!115419 m!883579))

(assert (=> d!115419 m!883381))

(assert (=> d!115419 m!883379))

(assert (=> d!115419 m!883385))

(declare-fun m!883581 () Bool)

(assert (=> d!115419 m!883581))

(assert (=> d!115419 m!883379))

(assert (=> b!950376 d!115419))

(declare-fun d!115421 () Bool)

(assert (=> d!115421 (contains!5223 (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))) lt!427964)))

(declare-fun lt!428070 () Unit!31954)

(declare-fun choose!1589 (ListLongMap!12217 (_ BitVec 64) V!32599 (_ BitVec 64)) Unit!31954)

(assert (=> d!115421 (= lt!428070 (choose!1589 lt!427952 lt!427949 (zeroValue!5599 thiss!1141) lt!427964))))

(assert (=> d!115421 (contains!5223 lt!427952 lt!427964)))

(assert (=> d!115421 (= (addStillContains!573 lt!427952 lt!427949 (zeroValue!5599 thiss!1141) lt!427964) lt!428070)))

(declare-fun bs!26708 () Bool)

(assert (= bs!26708 d!115421))

(assert (=> bs!26708 m!883371))

(assert (=> bs!26708 m!883371))

(assert (=> bs!26708 m!883373))

(declare-fun m!883583 () Bool)

(assert (=> bs!26708 m!883583))

(declare-fun m!883585 () Bool)

(assert (=> bs!26708 m!883585))

(assert (=> b!950376 d!115421))

(declare-fun d!115423 () Bool)

(assert (=> d!115423 (= (apply!884 lt!427968 lt!427953) (get!14545 (getValueByKey!492 (toList!6124 lt!427968) lt!427953)))))

(declare-fun bs!26709 () Bool)

(assert (= bs!26709 d!115423))

(declare-fun m!883587 () Bool)

(assert (=> bs!26709 m!883587))

(assert (=> bs!26709 m!883587))

(declare-fun m!883589 () Bool)

(assert (=> bs!26709 m!883589))

(assert (=> b!950376 d!115423))

(declare-fun d!115425 () Bool)

(declare-fun e!535247 () Bool)

(assert (=> d!115425 e!535247))

(declare-fun res!637182 () Bool)

(assert (=> d!115425 (=> (not res!637182) (not e!535247))))

(declare-fun lt!428074 () ListLongMap!12217)

(assert (=> d!115425 (= res!637182 (contains!5223 lt!428074 (_1!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141)))))))

(declare-fun lt!428073 () List!19314)

(assert (=> d!115425 (= lt!428074 (ListLongMap!12218 lt!428073))))

(declare-fun lt!428071 () Unit!31954)

(declare-fun lt!428072 () Unit!31954)

(assert (=> d!115425 (= lt!428071 lt!428072)))

(assert (=> d!115425 (= (getValueByKey!492 lt!428073 (_1!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141)))))))

(assert (=> d!115425 (= lt!428072 (lemmaContainsTupThenGetReturnValue!266 lt!428073 (_1!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141)))))))

(assert (=> d!115425 (= lt!428073 (insertStrictlySorted!323 (toList!6124 lt!427960) (_1!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141)))))))

(assert (=> d!115425 (= (+!2870 lt!427960 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))) lt!428074)))

(declare-fun b!950607 () Bool)

(declare-fun res!637183 () Bool)

(assert (=> b!950607 (=> (not res!637183) (not e!535247))))

(assert (=> b!950607 (= res!637183 (= (getValueByKey!492 (toList!6124 lt!428074) (_1!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))))))))

(declare-fun b!950608 () Bool)

(assert (=> b!950608 (= e!535247 (contains!5226 (toList!6124 lt!428074) (tuple2!13519 lt!427962 (minValue!5599 thiss!1141))))))

(assert (= (and d!115425 res!637182) b!950607))

(assert (= (and b!950607 res!637183) b!950608))

(declare-fun m!883591 () Bool)

(assert (=> d!115425 m!883591))

(declare-fun m!883593 () Bool)

(assert (=> d!115425 m!883593))

(declare-fun m!883595 () Bool)

(assert (=> d!115425 m!883595))

(declare-fun m!883597 () Bool)

(assert (=> d!115425 m!883597))

(declare-fun m!883599 () Bool)

(assert (=> b!950607 m!883599))

(declare-fun m!883601 () Bool)

(assert (=> b!950608 m!883601))

(assert (=> b!950376 d!115425))

(declare-fun d!115427 () Bool)

(assert (=> d!115427 (= (apply!884 (+!2870 lt!427968 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))) lt!427953) (apply!884 lt!427968 lt!427953))))

(declare-fun lt!428075 () Unit!31954)

(assert (=> d!115427 (= lt!428075 (choose!1588 lt!427968 lt!427970 (zeroValue!5599 thiss!1141) lt!427953))))

(declare-fun e!535248 () Bool)

(assert (=> d!115427 e!535248))

(declare-fun res!637184 () Bool)

(assert (=> d!115427 (=> (not res!637184) (not e!535248))))

(assert (=> d!115427 (= res!637184 (contains!5223 lt!427968 lt!427953))))

(assert (=> d!115427 (= (addApplyDifferent!454 lt!427968 lt!427970 (zeroValue!5599 thiss!1141) lt!427953) lt!428075)))

(declare-fun b!950609 () Bool)

(assert (=> b!950609 (= e!535248 (not (= lt!427953 lt!427970)))))

(assert (= (and d!115427 res!637184) b!950609))

(declare-fun m!883603 () Bool)

(assert (=> d!115427 m!883603))

(assert (=> d!115427 m!883391))

(assert (=> d!115427 m!883393))

(assert (=> d!115427 m!883395))

(declare-fun m!883605 () Bool)

(assert (=> d!115427 m!883605))

(assert (=> d!115427 m!883393))

(assert (=> b!950376 d!115427))

(declare-fun d!115429 () Bool)

(assert (=> d!115429 (= (apply!884 (+!2870 lt!427963 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))) lt!427961) (apply!884 lt!427963 lt!427961))))

(declare-fun lt!428076 () Unit!31954)

(assert (=> d!115429 (= lt!428076 (choose!1588 lt!427963 lt!427965 (minValue!5599 thiss!1141) lt!427961))))

(declare-fun e!535249 () Bool)

(assert (=> d!115429 e!535249))

(declare-fun res!637185 () Bool)

(assert (=> d!115429 (=> (not res!637185) (not e!535249))))

(assert (=> d!115429 (= res!637185 (contains!5223 lt!427963 lt!427961))))

(assert (=> d!115429 (= (addApplyDifferent!454 lt!427963 lt!427965 (minValue!5599 thiss!1141) lt!427961) lt!428076)))

(declare-fun b!950610 () Bool)

(assert (=> b!950610 (= e!535249 (not (= lt!427961 lt!427965)))))

(assert (= (and d!115429 res!637185) b!950610))

(declare-fun m!883607 () Bool)

(assert (=> d!115429 m!883607))

(assert (=> d!115429 m!883397))

(assert (=> d!115429 m!883375))

(assert (=> d!115429 m!883377))

(declare-fun m!883609 () Bool)

(assert (=> d!115429 m!883609))

(assert (=> d!115429 m!883375))

(assert (=> b!950376 d!115429))

(declare-fun d!115431 () Bool)

(assert (=> d!115431 (= (apply!884 (+!2870 lt!427968 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141))) lt!427953) (get!14545 (getValueByKey!492 (toList!6124 (+!2870 lt!427968 (tuple2!13519 lt!427970 (zeroValue!5599 thiss!1141)))) lt!427953)))))

(declare-fun bs!26710 () Bool)

(assert (= bs!26710 d!115431))

(declare-fun m!883611 () Bool)

(assert (=> bs!26710 m!883611))

(assert (=> bs!26710 m!883611))

(declare-fun m!883613 () Bool)

(assert (=> bs!26710 m!883613))

(assert (=> b!950376 d!115431))

(declare-fun d!115433 () Bool)

(declare-fun e!535250 () Bool)

(assert (=> d!115433 e!535250))

(declare-fun res!637186 () Bool)

(assert (=> d!115433 (=> (not res!637186) (not e!535250))))

(declare-fun lt!428080 () ListLongMap!12217)

(assert (=> d!115433 (= res!637186 (contains!5223 lt!428080 (_1!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141)))))))

(declare-fun lt!428079 () List!19314)

(assert (=> d!115433 (= lt!428080 (ListLongMap!12218 lt!428079))))

(declare-fun lt!428077 () Unit!31954)

(declare-fun lt!428078 () Unit!31954)

(assert (=> d!115433 (= lt!428077 lt!428078)))

(assert (=> d!115433 (= (getValueByKey!492 lt!428079 (_1!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141)))))))

(assert (=> d!115433 (= lt!428078 (lemmaContainsTupThenGetReturnValue!266 lt!428079 (_1!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141)))))))

(assert (=> d!115433 (= lt!428079 (insertStrictlySorted!323 (toList!6124 lt!427963) (_1!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141)))))))

(assert (=> d!115433 (= (+!2870 lt!427963 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))) lt!428080)))

(declare-fun b!950611 () Bool)

(declare-fun res!637187 () Bool)

(assert (=> b!950611 (=> (not res!637187) (not e!535250))))

(assert (=> b!950611 (= res!637187 (= (getValueByKey!492 (toList!6124 lt!428080) (_1!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))))))))

(declare-fun b!950612 () Bool)

(assert (=> b!950612 (= e!535250 (contains!5226 (toList!6124 lt!428080) (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))))))

(assert (= (and d!115433 res!637186) b!950611))

(assert (= (and b!950611 res!637187) b!950612))

(declare-fun m!883615 () Bool)

(assert (=> d!115433 m!883615))

(declare-fun m!883617 () Bool)

(assert (=> d!115433 m!883617))

(declare-fun m!883619 () Bool)

(assert (=> d!115433 m!883619))

(declare-fun m!883621 () Bool)

(assert (=> d!115433 m!883621))

(declare-fun m!883623 () Bool)

(assert (=> b!950611 m!883623))

(declare-fun m!883625 () Bool)

(assert (=> b!950612 m!883625))

(assert (=> b!950376 d!115433))

(assert (=> b!950376 d!115381))

(declare-fun d!115435 () Bool)

(declare-fun e!535251 () Bool)

(assert (=> d!115435 e!535251))

(declare-fun res!637188 () Bool)

(assert (=> d!115435 (=> res!637188 e!535251)))

(declare-fun lt!428083 () Bool)

(assert (=> d!115435 (= res!637188 (not lt!428083))))

(declare-fun lt!428084 () Bool)

(assert (=> d!115435 (= lt!428083 lt!428084)))

(declare-fun lt!428082 () Unit!31954)

(declare-fun e!535252 () Unit!31954)

(assert (=> d!115435 (= lt!428082 e!535252)))

(declare-fun c!99429 () Bool)

(assert (=> d!115435 (= c!99429 lt!428084)))

(assert (=> d!115435 (= lt!428084 (containsKey!463 (toList!6124 (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))) lt!427964))))

(assert (=> d!115435 (= (contains!5223 (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))) lt!427964) lt!428083)))

(declare-fun b!950613 () Bool)

(declare-fun lt!428081 () Unit!31954)

(assert (=> b!950613 (= e!535252 lt!428081)))

(assert (=> b!950613 (= lt!428081 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6124 (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))) lt!427964))))

(assert (=> b!950613 (isDefined!365 (getValueByKey!492 (toList!6124 (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))) lt!427964))))

(declare-fun b!950614 () Bool)

(declare-fun Unit!31960 () Unit!31954)

(assert (=> b!950614 (= e!535252 Unit!31960)))

(declare-fun b!950615 () Bool)

(assert (=> b!950615 (= e!535251 (isDefined!365 (getValueByKey!492 (toList!6124 (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))) lt!427964)))))

(assert (= (and d!115435 c!99429) b!950613))

(assert (= (and d!115435 (not c!99429)) b!950614))

(assert (= (and d!115435 (not res!637188)) b!950615))

(declare-fun m!883627 () Bool)

(assert (=> d!115435 m!883627))

(declare-fun m!883629 () Bool)

(assert (=> b!950613 m!883629))

(declare-fun m!883631 () Bool)

(assert (=> b!950613 m!883631))

(assert (=> b!950613 m!883631))

(declare-fun m!883633 () Bool)

(assert (=> b!950613 m!883633))

(assert (=> b!950615 m!883631))

(assert (=> b!950615 m!883631))

(assert (=> b!950615 m!883633))

(assert (=> b!950376 d!115435))

(declare-fun d!115437 () Bool)

(assert (=> d!115437 (= (apply!884 (+!2870 lt!427963 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141))) lt!427961) (get!14545 (getValueByKey!492 (toList!6124 (+!2870 lt!427963 (tuple2!13519 lt!427965 (minValue!5599 thiss!1141)))) lt!427961)))))

(declare-fun bs!26711 () Bool)

(assert (= bs!26711 d!115437))

(declare-fun m!883635 () Bool)

(assert (=> bs!26711 m!883635))

(assert (=> bs!26711 m!883635))

(declare-fun m!883637 () Bool)

(assert (=> bs!26711 m!883637))

(assert (=> b!950376 d!115437))

(declare-fun d!115439 () Bool)

(declare-fun e!535253 () Bool)

(assert (=> d!115439 e!535253))

(declare-fun res!637189 () Bool)

(assert (=> d!115439 (=> (not res!637189) (not e!535253))))

(declare-fun lt!428088 () ListLongMap!12217)

(assert (=> d!115439 (= res!637189 (contains!5223 lt!428088 (_1!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))))))

(declare-fun lt!428087 () List!19314)

(assert (=> d!115439 (= lt!428088 (ListLongMap!12218 lt!428087))))

(declare-fun lt!428085 () Unit!31954)

(declare-fun lt!428086 () Unit!31954)

(assert (=> d!115439 (= lt!428085 lt!428086)))

(assert (=> d!115439 (= (getValueByKey!492 lt!428087 (_1!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!115439 (= lt!428086 (lemmaContainsTupThenGetReturnValue!266 lt!428087 (_1!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!115439 (= lt!428087 (insertStrictlySorted!323 (toList!6124 lt!427952) (_1!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))) (_2!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))))))

(assert (=> d!115439 (= (+!2870 lt!427952 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))) lt!428088)))

(declare-fun b!950616 () Bool)

(declare-fun res!637190 () Bool)

(assert (=> b!950616 (=> (not res!637190) (not e!535253))))

(assert (=> b!950616 (= res!637190 (= (getValueByKey!492 (toList!6124 lt!428088) (_1!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141)))) (Some!497 (_2!6770 (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))))))))

(declare-fun b!950617 () Bool)

(assert (=> b!950617 (= e!535253 (contains!5226 (toList!6124 lt!428088) (tuple2!13519 lt!427949 (zeroValue!5599 thiss!1141))))))

(assert (= (and d!115439 res!637189) b!950616))

(assert (= (and b!950616 res!637190) b!950617))

(declare-fun m!883639 () Bool)

(assert (=> d!115439 m!883639))

(declare-fun m!883641 () Bool)

(assert (=> d!115439 m!883641))

(declare-fun m!883643 () Bool)

(assert (=> d!115439 m!883643))

(declare-fun m!883645 () Bool)

(assert (=> d!115439 m!883645))

(declare-fun m!883647 () Bool)

(assert (=> b!950616 m!883647))

(declare-fun m!883649 () Bool)

(assert (=> b!950617 m!883649))

(assert (=> b!950376 d!115439))

(declare-fun d!115441 () Bool)

(assert (=> d!115441 (= (apply!884 lt!427960 lt!427950) (get!14545 (getValueByKey!492 (toList!6124 lt!427960) lt!427950)))))

(declare-fun bs!26712 () Bool)

(assert (= bs!26712 d!115441))

(declare-fun m!883651 () Bool)

(assert (=> bs!26712 m!883651))

(assert (=> bs!26712 m!883651))

(declare-fun m!883653 () Bool)

(assert (=> bs!26712 m!883653))

(assert (=> b!950376 d!115441))

(declare-fun d!115443 () Bool)

(declare-fun res!637195 () Bool)

(declare-fun e!535258 () Bool)

(assert (=> d!115443 (=> res!637195 e!535258)))

(assert (=> d!115443 (= res!637195 (and ((_ is Cons!19310) (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (= (_1!6770 (h!20475 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)))))

(assert (=> d!115443 (= (containsKey!463 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))) key!756) e!535258)))

(declare-fun b!950622 () Bool)

(declare-fun e!535259 () Bool)

(assert (=> b!950622 (= e!535258 e!535259)))

(declare-fun res!637196 () Bool)

(assert (=> b!950622 (=> (not res!637196) (not e!535259))))

(assert (=> b!950622 (= res!637196 (and (or (not ((_ is Cons!19310) (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) (bvsle (_1!6770 (h!20475 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)) ((_ is Cons!19310) (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) (bvslt (_1!6770 (h!20475 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141))))) key!756)))))

(declare-fun b!950623 () Bool)

(assert (=> b!950623 (= e!535259 (containsKey!463 (t!27639 (toList!6124 (getCurrentListMap!3357 (_keys!10719 thiss!1141) (_values!5786 thiss!1141) (mask!27586 thiss!1141) (extraKeys!5495 thiss!1141) (zeroValue!5599 thiss!1141) (minValue!5599 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5763 thiss!1141)))) key!756))))

(assert (= (and d!115443 (not res!637195)) b!950622))

(assert (= (and b!950622 res!637196) b!950623))

(declare-fun m!883655 () Bool)

(assert (=> b!950623 m!883655))

(assert (=> d!115363 d!115443))

(declare-fun d!115445 () Bool)

(declare-fun e!535260 () Bool)

(assert (=> d!115445 e!535260))

(declare-fun res!637197 () Bool)

(assert (=> d!115445 (=> res!637197 e!535260)))

(declare-fun lt!428091 () Bool)

(assert (=> d!115445 (= res!637197 (not lt!428091))))

(declare-fun lt!428092 () Bool)

(assert (=> d!115445 (= lt!428091 lt!428092)))

(declare-fun lt!428090 () Unit!31954)

(declare-fun e!535261 () Unit!31954)

(assert (=> d!115445 (= lt!428090 e!535261)))

(declare-fun c!99430 () Bool)

(assert (=> d!115445 (= c!99430 lt!428092)))

(assert (=> d!115445 (= lt!428092 (containsKey!463 (toList!6124 lt!427957) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115445 (= (contains!5223 lt!427957 #b0000000000000000000000000000000000000000000000000000000000000000) lt!428091)))

(declare-fun b!950624 () Bool)

(declare-fun lt!428089 () Unit!31954)

(assert (=> b!950624 (= e!535261 lt!428089)))

(assert (=> b!950624 (= lt!428089 (lemmaContainsKeyImpliesGetValueByKeyDefined!357 (toList!6124 lt!427957) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950624 (isDefined!365 (getValueByKey!492 (toList!6124 lt!427957) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!950625 () Bool)

(declare-fun Unit!31961 () Unit!31954)

(assert (=> b!950625 (= e!535261 Unit!31961)))

(declare-fun b!950626 () Bool)

(assert (=> b!950626 (= e!535260 (isDefined!365 (getValueByKey!492 (toList!6124 lt!427957) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115445 c!99430) b!950624))

(assert (= (and d!115445 (not c!99430)) b!950625))

(assert (= (and d!115445 (not res!637197)) b!950626))

(declare-fun m!883657 () Bool)

(assert (=> d!115445 m!883657))

(declare-fun m!883659 () Bool)

(assert (=> b!950624 m!883659))

(assert (=> b!950624 m!883515))

(assert (=> b!950624 m!883515))

(declare-fun m!883661 () Bool)

(assert (=> b!950624 m!883661))

(assert (=> b!950626 m!883515))

(assert (=> b!950626 m!883515))

(assert (=> b!950626 m!883661))

(assert (=> bm!41347 d!115445))

(declare-fun condMapEmpty!32999 () Bool)

(declare-fun mapDefault!32999 () ValueCell!9881)

(assert (=> mapNonEmpty!32998 (= condMapEmpty!32999 (= mapRest!32998 ((as const (Array (_ BitVec 32) ValueCell!9881)) mapDefault!32999)))))

(declare-fun e!535262 () Bool)

(declare-fun mapRes!32999 () Bool)

(assert (=> mapNonEmpty!32998 (= tp!63253 (and e!535262 mapRes!32999))))

(declare-fun b!950627 () Bool)

(declare-fun e!535263 () Bool)

(assert (=> b!950627 (= e!535263 tp_is_empty!20725)))

(declare-fun b!950628 () Bool)

(assert (=> b!950628 (= e!535262 tp_is_empty!20725)))

(declare-fun mapNonEmpty!32999 () Bool)

(declare-fun tp!63254 () Bool)

(assert (=> mapNonEmpty!32999 (= mapRes!32999 (and tp!63254 e!535263))))

(declare-fun mapKey!32999 () (_ BitVec 32))

(declare-fun mapRest!32999 () (Array (_ BitVec 32) ValueCell!9881))

(declare-fun mapValue!32999 () ValueCell!9881)

(assert (=> mapNonEmpty!32999 (= mapRest!32998 (store mapRest!32999 mapKey!32999 mapValue!32999))))

(declare-fun mapIsEmpty!32999 () Bool)

(assert (=> mapIsEmpty!32999 mapRes!32999))

(assert (= (and mapNonEmpty!32998 condMapEmpty!32999) mapIsEmpty!32999))

(assert (= (and mapNonEmpty!32998 (not condMapEmpty!32999)) mapNonEmpty!32999))

(assert (= (and mapNonEmpty!32999 ((_ is ValueCellFull!9881) mapValue!32999)) b!950627))

(assert (= (and mapNonEmpty!32998 ((_ is ValueCellFull!9881) mapDefault!32999)) b!950628))

(declare-fun m!883663 () Bool)

(assert (=> mapNonEmpty!32999 m!883663))

(declare-fun b_lambda!14369 () Bool)

(assert (= b_lambda!14367 (or (and b!950262 b_free!18217) b_lambda!14369)))

(declare-fun b_lambda!14371 () Bool)

(assert (= b_lambda!14365 (or (and b!950262 b_free!18217) b_lambda!14371)))

(check-sat (not b!950518) (not b!950626) (not d!115419) (not b!950488) (not b!950495) (not b!950580) (not d!115415) (not b!950487) (not d!115395) (not b!950461) (not b!950433) (not d!115413) (not b!950611) b_and!29683 (not b!950595) (not b!950615) (not d!115431) (not b!950497) (not d!115427) (not b!950607) (not d!115377) (not b!950623) (not b_next!18217) (not b!950493) (not d!115405) (not b!950601) (not b!950575) (not d!115441) (not b!950573) (not d!115387) (not d!115421) (not b_lambda!14371) (not d!115375) (not d!115439) (not b!950613) (not b!950440) (not d!115381) (not d!115389) (not bm!41358) (not b!950582) (not b!950435) (not b!950596) (not d!115409) (not b!950608) (not b!950460) (not b!950616) (not b!950441) (not b!950489) (not d!115437) (not b!950551) (not b!950600) (not b!950457) (not d!115401) (not d!115379) (not d!115425) (not bm!41361) (not bm!41355) (not d!115433) (not d!115445) (not b!950491) (not b!950624) (not d!115393) (not b!950612) (not bm!41352) (not b_lambda!14363) tp_is_empty!20725 (not b!950617) (not mapNonEmpty!32999) (not b!950539) (not d!115417) (not b_lambda!14369) (not b!950561) (not d!115435) (not d!115429) (not b!950562) (not b!950584) (not d!115373) (not b!950486) (not b!950597) (not b!950581) (not d!115423) (not d!115383) (not b!950535))
(check-sat b_and!29683 (not b_next!18217))
