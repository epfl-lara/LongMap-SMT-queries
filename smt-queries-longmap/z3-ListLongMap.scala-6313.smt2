; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80968 () Bool)

(assert start!80968)

(declare-fun b!948425 () Bool)

(declare-fun b_free!18201 () Bool)

(declare-fun b_next!18201 () Bool)

(assert (=> b!948425 (= b_free!18201 (not b_next!18201))))

(declare-fun tp!63177 () Bool)

(declare-fun b_and!29633 () Bool)

(assert (=> b!948425 (= tp!63177 b_and!29633)))

(declare-fun b!948423 () Bool)

(declare-fun res!636295 () Bool)

(declare-fun e!533898 () Bool)

(assert (=> b!948423 (=> (not res!636295) (not e!533898))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!948423 (= res!636295 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948424 () Bool)

(declare-fun e!533901 () Bool)

(declare-fun tp_is_empty!20709 () Bool)

(assert (=> b!948424 (= e!533901 tp_is_empty!20709)))

(declare-fun mapIsEmpty!32954 () Bool)

(declare-fun mapRes!32954 () Bool)

(assert (=> mapIsEmpty!32954 mapRes!32954))

(declare-fun b!948426 () Bool)

(declare-fun e!533896 () Bool)

(assert (=> b!948426 (= e!533896 tp_is_empty!20709)))

(declare-fun b!948427 () Bool)

(declare-fun res!636296 () Bool)

(assert (=> b!948427 (=> (not res!636296) (not e!533898))))

(declare-datatypes ((V!32577 0))(
  ( (V!32578 (val!10405 Int)) )
))
(declare-datatypes ((ValueCell!9873 0))(
  ( (ValueCellFull!9873 (v!12942 V!32577)) (EmptyCell!9873) )
))
(declare-datatypes ((array!57424 0))(
  ( (array!57425 (arr!27618 (Array (_ BitVec 32) ValueCell!9873)) (size!28092 (_ BitVec 32))) )
))
(declare-datatypes ((array!57426 0))(
  ( (array!57427 (arr!27619 (Array (_ BitVec 32) (_ BitVec 64))) (size!28093 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4896 0))(
  ( (LongMapFixedSize!4897 (defaultEntry!5750 Int) (mask!27510 (_ BitVec 32)) (extraKeys!5482 (_ BitVec 32)) (zeroValue!5586 V!32577) (minValue!5586 V!32577) (_size!2503 (_ BitVec 32)) (_keys!10669 array!57426) (_values!5773 array!57424) (_vacant!2503 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4896)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9126 0))(
  ( (MissingZero!9126 (index!38875 (_ BitVec 32))) (Found!9126 (index!38876 (_ BitVec 32))) (Intermediate!9126 (undefined!9938 Bool) (index!38877 (_ BitVec 32)) (x!81604 (_ BitVec 32))) (Undefined!9126) (MissingVacant!9126 (index!38878 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57426 (_ BitVec 32)) SeekEntryResult!9126)

(assert (=> b!948427 (= res!636296 (not ((_ is Found!9126) (seekEntry!0 key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)))))))

(declare-fun b!948428 () Bool)

(declare-fun e!533900 () Bool)

(assert (=> b!948428 (= e!533900 (and e!533901 mapRes!32954))))

(declare-fun condMapEmpty!32954 () Bool)

(declare-fun mapDefault!32954 () ValueCell!9873)

(assert (=> b!948428 (= condMapEmpty!32954 (= (arr!27618 (_values!5773 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9873)) mapDefault!32954)))))

(declare-fun b!948429 () Bool)

(declare-fun res!636294 () Bool)

(assert (=> b!948429 (=> (not res!636294) (not e!533898))))

(declare-datatypes ((tuple2!13524 0))(
  ( (tuple2!13525 (_1!6773 (_ BitVec 64)) (_2!6773 V!32577)) )
))
(declare-datatypes ((List!19318 0))(
  ( (Nil!19315) (Cons!19314 (h!20471 tuple2!13524) (t!27645 List!19318)) )
))
(declare-datatypes ((ListLongMap!12221 0))(
  ( (ListLongMap!12222 (toList!6126 List!19318)) )
))
(declare-fun contains!5210 (ListLongMap!12221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3359 (array!57426 array!57424 (_ BitVec 32) (_ BitVec 32) V!32577 V!32577 (_ BitVec 32) Int) ListLongMap!12221)

(assert (=> b!948429 (= res!636294 (contains!5210 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)) key!756))))

(declare-fun b!948430 () Bool)

(assert (=> b!948430 (= e!533898 (and (= (size!28092 (_values!5773 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27510 thiss!1141))) (not (= (size!28093 (_keys!10669 thiss!1141)) (size!28092 (_values!5773 thiss!1141))))))))

(declare-fun b!948431 () Bool)

(declare-fun res!636298 () Bool)

(assert (=> b!948431 (=> (not res!636298) (not e!533898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948431 (= res!636298 (validMask!0 (mask!27510 thiss!1141)))))

(declare-fun mapNonEmpty!32954 () Bool)

(declare-fun tp!63178 () Bool)

(assert (=> mapNonEmpty!32954 (= mapRes!32954 (and tp!63178 e!533896))))

(declare-fun mapValue!32954 () ValueCell!9873)

(declare-fun mapRest!32954 () (Array (_ BitVec 32) ValueCell!9873))

(declare-fun mapKey!32954 () (_ BitVec 32))

(assert (=> mapNonEmpty!32954 (= (arr!27618 (_values!5773 thiss!1141)) (store mapRest!32954 mapKey!32954 mapValue!32954))))

(declare-fun e!533897 () Bool)

(declare-fun array_inv!21440 (array!57426) Bool)

(declare-fun array_inv!21441 (array!57424) Bool)

(assert (=> b!948425 (= e!533897 (and tp!63177 tp_is_empty!20709 (array_inv!21440 (_keys!10669 thiss!1141)) (array_inv!21441 (_values!5773 thiss!1141)) e!533900))))

(declare-fun res!636297 () Bool)

(assert (=> start!80968 (=> (not res!636297) (not e!533898))))

(declare-fun valid!1864 (LongMapFixedSize!4896) Bool)

(assert (=> start!80968 (= res!636297 (valid!1864 thiss!1141))))

(assert (=> start!80968 e!533898))

(assert (=> start!80968 e!533897))

(assert (=> start!80968 true))

(assert (= (and start!80968 res!636297) b!948423))

(assert (= (and b!948423 res!636295) b!948427))

(assert (= (and b!948427 res!636296) b!948429))

(assert (= (and b!948429 res!636294) b!948431))

(assert (= (and b!948431 res!636298) b!948430))

(assert (= (and b!948428 condMapEmpty!32954) mapIsEmpty!32954))

(assert (= (and b!948428 (not condMapEmpty!32954)) mapNonEmpty!32954))

(assert (= (and mapNonEmpty!32954 ((_ is ValueCellFull!9873) mapValue!32954)) b!948426))

(assert (= (and b!948428 ((_ is ValueCellFull!9873) mapDefault!32954)) b!948424))

(assert (= b!948425 b!948428))

(assert (= start!80968 b!948425))

(declare-fun m!881197 () Bool)

(assert (=> start!80968 m!881197))

(declare-fun m!881199 () Bool)

(assert (=> mapNonEmpty!32954 m!881199))

(declare-fun m!881201 () Bool)

(assert (=> b!948431 m!881201))

(declare-fun m!881203 () Bool)

(assert (=> b!948427 m!881203))

(declare-fun m!881205 () Bool)

(assert (=> b!948429 m!881205))

(assert (=> b!948429 m!881205))

(declare-fun m!881207 () Bool)

(assert (=> b!948429 m!881207))

(declare-fun m!881209 () Bool)

(assert (=> b!948425 m!881209))

(declare-fun m!881211 () Bool)

(assert (=> b!948425 m!881211))

(check-sat tp_is_empty!20709 b_and!29633 (not start!80968) (not mapNonEmpty!32954) (not b!948427) (not b!948429) (not b!948431) (not b_next!18201) (not b!948425))
(check-sat b_and!29633 (not b_next!18201))
(get-model)

(declare-fun d!114841 () Bool)

(assert (=> d!114841 (= (array_inv!21440 (_keys!10669 thiss!1141)) (bvsge (size!28093 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948425 d!114841))

(declare-fun d!114843 () Bool)

(assert (=> d!114843 (= (array_inv!21441 (_values!5773 thiss!1141)) (bvsge (size!28092 (_values!5773 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948425 d!114843))

(declare-fun d!114845 () Bool)

(declare-fun e!533924 () Bool)

(assert (=> d!114845 e!533924))

(declare-fun res!636316 () Bool)

(assert (=> d!114845 (=> res!636316 e!533924)))

(declare-fun lt!427052 () Bool)

(assert (=> d!114845 (= res!636316 (not lt!427052))))

(declare-fun lt!427051 () Bool)

(assert (=> d!114845 (= lt!427052 lt!427051)))

(declare-datatypes ((Unit!31953 0))(
  ( (Unit!31954) )
))
(declare-fun lt!427053 () Unit!31953)

(declare-fun e!533925 () Unit!31953)

(assert (=> d!114845 (= lt!427053 e!533925)))

(declare-fun c!98866 () Bool)

(assert (=> d!114845 (= c!98866 lt!427051)))

(declare-fun containsKey!458 (List!19318 (_ BitVec 64)) Bool)

(assert (=> d!114845 (= lt!427051 (containsKey!458 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756))))

(assert (=> d!114845 (= (contains!5210 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)) key!756) lt!427052)))

(declare-fun b!948465 () Bool)

(declare-fun lt!427050 () Unit!31953)

(assert (=> b!948465 (= e!533925 lt!427050)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!354 (List!19318 (_ BitVec 64)) Unit!31953)

(assert (=> b!948465 (= lt!427050 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756))))

(declare-datatypes ((Option!497 0))(
  ( (Some!496 (v!12944 V!32577)) (None!495) )
))
(declare-fun isDefined!363 (Option!497) Bool)

(declare-fun getValueByKey!491 (List!19318 (_ BitVec 64)) Option!497)

(assert (=> b!948465 (isDefined!363 (getValueByKey!491 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756))))

(declare-fun b!948466 () Bool)

(declare-fun Unit!31955 () Unit!31953)

(assert (=> b!948466 (= e!533925 Unit!31955)))

(declare-fun b!948467 () Bool)

(assert (=> b!948467 (= e!533924 (isDefined!363 (getValueByKey!491 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756)))))

(assert (= (and d!114845 c!98866) b!948465))

(assert (= (and d!114845 (not c!98866)) b!948466))

(assert (= (and d!114845 (not res!636316)) b!948467))

(declare-fun m!881229 () Bool)

(assert (=> d!114845 m!881229))

(declare-fun m!881231 () Bool)

(assert (=> b!948465 m!881231))

(declare-fun m!881233 () Bool)

(assert (=> b!948465 m!881233))

(assert (=> b!948465 m!881233))

(declare-fun m!881235 () Bool)

(assert (=> b!948465 m!881235))

(assert (=> b!948467 m!881233))

(assert (=> b!948467 m!881233))

(assert (=> b!948467 m!881235))

(assert (=> b!948429 d!114845))

(declare-fun b!948510 () Bool)

(declare-fun e!533956 () ListLongMap!12221)

(declare-fun call!41215 () ListLongMap!12221)

(declare-fun +!2856 (ListLongMap!12221 tuple2!13524) ListLongMap!12221)

(assert (=> b!948510 (= e!533956 (+!2856 call!41215 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))))

(declare-fun b!948511 () Bool)

(declare-fun e!533961 () Bool)

(declare-fun call!41220 () Bool)

(assert (=> b!948511 (= e!533961 (not call!41220))))

(declare-fun bm!41211 () Bool)

(declare-fun call!41216 () ListLongMap!12221)

(declare-fun call!41219 () ListLongMap!12221)

(assert (=> bm!41211 (= call!41216 call!41219)))

(declare-fun b!948512 () Bool)

(declare-fun e!533960 () Bool)

(declare-fun e!533962 () Bool)

(assert (=> b!948512 (= e!533960 e!533962)))

(declare-fun res!636336 () Bool)

(declare-fun call!41214 () Bool)

(assert (=> b!948512 (= res!636336 call!41214)))

(assert (=> b!948512 (=> (not res!636336) (not e!533962))))

(declare-fun c!98883 () Bool)

(declare-fun bm!41212 () Bool)

(declare-fun call!41218 () ListLongMap!12221)

(declare-fun c!98880 () Bool)

(assert (=> bm!41212 (= call!41215 (+!2856 (ite c!98880 call!41218 (ite c!98883 call!41219 call!41216)) (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))))))

(declare-fun b!948513 () Bool)

(declare-fun e!533963 () ListLongMap!12221)

(declare-fun call!41217 () ListLongMap!12221)

(assert (=> b!948513 (= e!533963 call!41217)))

(declare-fun b!948514 () Bool)

(declare-fun res!636339 () Bool)

(declare-fun e!533958 () Bool)

(assert (=> b!948514 (=> (not res!636339) (not e!533958))))

(declare-fun e!533952 () Bool)

(assert (=> b!948514 (= res!636339 e!533952)))

(declare-fun res!636341 () Bool)

(assert (=> b!948514 (=> res!636341 e!533952)))

(declare-fun e!533954 () Bool)

(assert (=> b!948514 (= res!636341 (not e!533954))))

(declare-fun res!636337 () Bool)

(assert (=> b!948514 (=> (not res!636337) (not e!533954))))

(assert (=> b!948514 (= res!636337 (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun b!948516 () Bool)

(declare-fun res!636338 () Bool)

(assert (=> b!948516 (=> (not res!636338) (not e!533958))))

(assert (=> b!948516 (= res!636338 e!533960)))

(declare-fun c!98881 () Bool)

(assert (=> b!948516 (= c!98881 (not (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!948517 () Bool)

(declare-fun e!533959 () Bool)

(declare-fun lt!427119 () ListLongMap!12221)

(declare-fun apply!872 (ListLongMap!12221 (_ BitVec 64)) V!32577)

(declare-fun get!14506 (ValueCell!9873 V!32577) V!32577)

(declare-fun dynLambda!1645 (Int (_ BitVec 64)) V!32577)

(assert (=> b!948517 (= e!533959 (= (apply!872 lt!427119 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)) (get!14506 (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5750 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28092 (_values!5773 thiss!1141))))))

(assert (=> b!948517 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun bm!41213 () Bool)

(assert (=> bm!41213 (= call!41217 call!41215)))

(declare-fun b!948518 () Bool)

(declare-fun c!98884 () Bool)

(assert (=> b!948518 (= c!98884 (and (not (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!533953 () ListLongMap!12221)

(assert (=> b!948518 (= e!533963 e!533953)))

(declare-fun b!948519 () Bool)

(assert (=> b!948519 (= e!533962 (= (apply!872 lt!427119 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5586 thiss!1141)))))

(declare-fun b!948520 () Bool)

(assert (=> b!948520 (= e!533953 call!41217)))

(declare-fun bm!41214 () Bool)

(assert (=> bm!41214 (= call!41220 (contains!5210 lt!427119 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948521 () Bool)

(assert (=> b!948521 (= e!533952 e!533959)))

(declare-fun res!636335 () Bool)

(assert (=> b!948521 (=> (not res!636335) (not e!533959))))

(assert (=> b!948521 (= res!636335 (contains!5210 lt!427119 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948521 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun bm!41215 () Bool)

(assert (=> bm!41215 (= call!41214 (contains!5210 lt!427119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948522 () Bool)

(declare-fun e!533964 () Unit!31953)

(declare-fun lt!427103 () Unit!31953)

(assert (=> b!948522 (= e!533964 lt!427103)))

(declare-fun lt!427106 () ListLongMap!12221)

(declare-fun getCurrentListMapNoExtraKeys!3311 (array!57426 array!57424 (_ BitVec 32) (_ BitVec 32) V!32577 V!32577 (_ BitVec 32) Int) ListLongMap!12221)

(assert (=> b!948522 (= lt!427106 (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))))

(declare-fun lt!427107 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427104 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427104 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427108 () Unit!31953)

(declare-fun addStillContains!575 (ListLongMap!12221 (_ BitVec 64) V!32577 (_ BitVec 64)) Unit!31953)

(assert (=> b!948522 (= lt!427108 (addStillContains!575 lt!427106 lt!427107 (zeroValue!5586 thiss!1141) lt!427104))))

(assert (=> b!948522 (contains!5210 (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))) lt!427104)))

(declare-fun lt!427117 () Unit!31953)

(assert (=> b!948522 (= lt!427117 lt!427108)))

(declare-fun lt!427112 () ListLongMap!12221)

(assert (=> b!948522 (= lt!427112 (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))))

(declare-fun lt!427109 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427109 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427099 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427099 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427114 () Unit!31953)

(declare-fun addApplyDifferent!455 (ListLongMap!12221 (_ BitVec 64) V!32577 (_ BitVec 64)) Unit!31953)

(assert (=> b!948522 (= lt!427114 (addApplyDifferent!455 lt!427112 lt!427109 (minValue!5586 thiss!1141) lt!427099))))

(assert (=> b!948522 (= (apply!872 (+!2856 lt!427112 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))) lt!427099) (apply!872 lt!427112 lt!427099))))

(declare-fun lt!427111 () Unit!31953)

(assert (=> b!948522 (= lt!427111 lt!427114)))

(declare-fun lt!427113 () ListLongMap!12221)

(assert (=> b!948522 (= lt!427113 (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))))

(declare-fun lt!427105 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427105 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427102 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427102 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427115 () Unit!31953)

(assert (=> b!948522 (= lt!427115 (addApplyDifferent!455 lt!427113 lt!427105 (zeroValue!5586 thiss!1141) lt!427102))))

(assert (=> b!948522 (= (apply!872 (+!2856 lt!427113 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))) lt!427102) (apply!872 lt!427113 lt!427102))))

(declare-fun lt!427116 () Unit!31953)

(assert (=> b!948522 (= lt!427116 lt!427115)))

(declare-fun lt!427101 () ListLongMap!12221)

(assert (=> b!948522 (= lt!427101 (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))))

(declare-fun lt!427110 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427110 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!427098 () (_ BitVec 64))

(assert (=> b!948522 (= lt!427098 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948522 (= lt!427103 (addApplyDifferent!455 lt!427101 lt!427110 (minValue!5586 thiss!1141) lt!427098))))

(assert (=> b!948522 (= (apply!872 (+!2856 lt!427101 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))) lt!427098) (apply!872 lt!427101 lt!427098))))

(declare-fun b!948523 () Bool)

(declare-fun e!533957 () Bool)

(assert (=> b!948523 (= e!533961 e!533957)))

(declare-fun res!636343 () Bool)

(assert (=> b!948523 (= res!636343 call!41220)))

(assert (=> b!948523 (=> (not res!636343) (not e!533957))))

(declare-fun b!948524 () Bool)

(assert (=> b!948524 (= e!533953 call!41216)))

(declare-fun b!948525 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!948525 (= e!533954 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41216 () Bool)

(assert (=> bm!41216 (= call!41218 (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))))

(declare-fun b!948526 () Bool)

(assert (=> b!948526 (= e!533956 e!533963)))

(assert (=> b!948526 (= c!98883 (and (not (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!948527 () Bool)

(assert (=> b!948527 (= e!533957 (= (apply!872 lt!427119 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5586 thiss!1141)))))

(declare-fun b!948528 () Bool)

(assert (=> b!948528 (= e!533958 e!533961)))

(declare-fun c!98882 () Bool)

(assert (=> b!948528 (= c!98882 (not (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41217 () Bool)

(assert (=> bm!41217 (= call!41219 call!41218)))

(declare-fun b!948529 () Bool)

(declare-fun e!533955 () Bool)

(assert (=> b!948529 (= e!533955 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948530 () Bool)

(assert (=> b!948530 (= e!533960 (not call!41214))))

(declare-fun b!948515 () Bool)

(declare-fun Unit!31956 () Unit!31953)

(assert (=> b!948515 (= e!533964 Unit!31956)))

(declare-fun d!114847 () Bool)

(assert (=> d!114847 e!533958))

(declare-fun res!636340 () Bool)

(assert (=> d!114847 (=> (not res!636340) (not e!533958))))

(assert (=> d!114847 (= res!636340 (or (bvsge #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))))

(declare-fun lt!427118 () ListLongMap!12221)

(assert (=> d!114847 (= lt!427119 lt!427118)))

(declare-fun lt!427100 () Unit!31953)

(assert (=> d!114847 (= lt!427100 e!533964)))

(declare-fun c!98879 () Bool)

(assert (=> d!114847 (= c!98879 e!533955)))

(declare-fun res!636342 () Bool)

(assert (=> d!114847 (=> (not res!636342) (not e!533955))))

(assert (=> d!114847 (= res!636342 (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(assert (=> d!114847 (= lt!427118 e!533956)))

(assert (=> d!114847 (= c!98880 (and (not (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5482 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114847 (validMask!0 (mask!27510 thiss!1141))))

(assert (=> d!114847 (= (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)) lt!427119)))

(assert (= (and d!114847 c!98880) b!948510))

(assert (= (and d!114847 (not c!98880)) b!948526))

(assert (= (and b!948526 c!98883) b!948513))

(assert (= (and b!948526 (not c!98883)) b!948518))

(assert (= (and b!948518 c!98884) b!948520))

(assert (= (and b!948518 (not c!98884)) b!948524))

(assert (= (or b!948520 b!948524) bm!41211))

(assert (= (or b!948513 bm!41211) bm!41217))

(assert (= (or b!948513 b!948520) bm!41213))

(assert (= (or b!948510 bm!41217) bm!41216))

(assert (= (or b!948510 bm!41213) bm!41212))

(assert (= (and d!114847 res!636342) b!948529))

(assert (= (and d!114847 c!98879) b!948522))

(assert (= (and d!114847 (not c!98879)) b!948515))

(assert (= (and d!114847 res!636340) b!948514))

(assert (= (and b!948514 res!636337) b!948525))

(assert (= (and b!948514 (not res!636341)) b!948521))

(assert (= (and b!948521 res!636335) b!948517))

(assert (= (and b!948514 res!636339) b!948516))

(assert (= (and b!948516 c!98881) b!948512))

(assert (= (and b!948516 (not c!98881)) b!948530))

(assert (= (and b!948512 res!636336) b!948519))

(assert (= (or b!948512 b!948530) bm!41215))

(assert (= (and b!948516 res!636338) b!948528))

(assert (= (and b!948528 c!98882) b!948523))

(assert (= (and b!948528 (not c!98882)) b!948511))

(assert (= (and b!948523 res!636343) b!948527))

(assert (= (or b!948523 b!948511) bm!41214))

(declare-fun b_lambda!14319 () Bool)

(assert (=> (not b_lambda!14319) (not b!948517)))

(declare-fun t!27648 () Bool)

(declare-fun tb!6179 () Bool)

(assert (=> (and b!948425 (= (defaultEntry!5750 thiss!1141) (defaultEntry!5750 thiss!1141)) t!27648) tb!6179))

(declare-fun result!12259 () Bool)

(assert (=> tb!6179 (= result!12259 tp_is_empty!20709)))

(assert (=> b!948517 t!27648))

(declare-fun b_and!29637 () Bool)

(assert (= b_and!29633 (and (=> t!27648 result!12259) b_and!29637)))

(declare-fun m!881237 () Bool)

(assert (=> bm!41212 m!881237))

(declare-fun m!881239 () Bool)

(assert (=> b!948525 m!881239))

(assert (=> b!948525 m!881239))

(declare-fun m!881241 () Bool)

(assert (=> b!948525 m!881241))

(declare-fun m!881243 () Bool)

(assert (=> b!948519 m!881243))

(declare-fun m!881245 () Bool)

(assert (=> b!948527 m!881245))

(assert (=> b!948521 m!881239))

(assert (=> b!948521 m!881239))

(declare-fun m!881247 () Bool)

(assert (=> b!948521 m!881247))

(declare-fun m!881249 () Bool)

(assert (=> b!948510 m!881249))

(declare-fun m!881251 () Bool)

(assert (=> bm!41216 m!881251))

(assert (=> d!114847 m!881201))

(declare-fun m!881253 () Bool)

(assert (=> b!948517 m!881253))

(declare-fun m!881255 () Bool)

(assert (=> b!948517 m!881255))

(declare-fun m!881257 () Bool)

(assert (=> b!948517 m!881257))

(assert (=> b!948517 m!881239))

(assert (=> b!948517 m!881239))

(declare-fun m!881259 () Bool)

(assert (=> b!948517 m!881259))

(assert (=> b!948517 m!881253))

(assert (=> b!948517 m!881255))

(declare-fun m!881261 () Bool)

(assert (=> bm!41215 m!881261))

(declare-fun m!881263 () Bool)

(assert (=> bm!41214 m!881263))

(assert (=> b!948529 m!881239))

(assert (=> b!948529 m!881239))

(assert (=> b!948529 m!881241))

(declare-fun m!881265 () Bool)

(assert (=> b!948522 m!881265))

(declare-fun m!881267 () Bool)

(assert (=> b!948522 m!881267))

(declare-fun m!881269 () Bool)

(assert (=> b!948522 m!881269))

(declare-fun m!881271 () Bool)

(assert (=> b!948522 m!881271))

(declare-fun m!881273 () Bool)

(assert (=> b!948522 m!881273))

(assert (=> b!948522 m!881267))

(assert (=> b!948522 m!881239))

(declare-fun m!881275 () Bool)

(assert (=> b!948522 m!881275))

(declare-fun m!881277 () Bool)

(assert (=> b!948522 m!881277))

(declare-fun m!881279 () Bool)

(assert (=> b!948522 m!881279))

(declare-fun m!881281 () Bool)

(assert (=> b!948522 m!881281))

(declare-fun m!881283 () Bool)

(assert (=> b!948522 m!881283))

(assert (=> b!948522 m!881275))

(declare-fun m!881285 () Bool)

(assert (=> b!948522 m!881285))

(declare-fun m!881287 () Bool)

(assert (=> b!948522 m!881287))

(assert (=> b!948522 m!881271))

(declare-fun m!881289 () Bool)

(assert (=> b!948522 m!881289))

(assert (=> b!948522 m!881279))

(declare-fun m!881291 () Bool)

(assert (=> b!948522 m!881291))

(declare-fun m!881293 () Bool)

(assert (=> b!948522 m!881293))

(assert (=> b!948522 m!881251))

(assert (=> b!948429 d!114847))

(declare-fun d!114849 () Bool)

(declare-fun lt!427130 () SeekEntryResult!9126)

(assert (=> d!114849 (and (or ((_ is MissingVacant!9126) lt!427130) (not ((_ is Found!9126) lt!427130)) (and (bvsge (index!38876 lt!427130) #b00000000000000000000000000000000) (bvslt (index!38876 lt!427130) (size!28093 (_keys!10669 thiss!1141))))) (not ((_ is MissingVacant!9126) lt!427130)) (or (not ((_ is Found!9126) lt!427130)) (= (select (arr!27619 (_keys!10669 thiss!1141)) (index!38876 lt!427130)) key!756)))))

(declare-fun e!533972 () SeekEntryResult!9126)

(assert (=> d!114849 (= lt!427130 e!533972)))

(declare-fun c!98893 () Bool)

(declare-fun lt!427129 () SeekEntryResult!9126)

(assert (=> d!114849 (= c!98893 (and ((_ is Intermediate!9126) lt!427129) (undefined!9938 lt!427129)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57426 (_ BitVec 32)) SeekEntryResult!9126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114849 (= lt!427129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27510 thiss!1141)) key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)))))

(assert (=> d!114849 (validMask!0 (mask!27510 thiss!1141))))

(assert (=> d!114849 (= (seekEntry!0 key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)) lt!427130)))

(declare-fun b!948545 () Bool)

(declare-fun e!533971 () SeekEntryResult!9126)

(declare-fun lt!427128 () SeekEntryResult!9126)

(assert (=> b!948545 (= e!533971 (ite ((_ is MissingVacant!9126) lt!427128) (MissingZero!9126 (index!38878 lt!427128)) lt!427128))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57426 (_ BitVec 32)) SeekEntryResult!9126)

(assert (=> b!948545 (= lt!427128 (seekKeyOrZeroReturnVacant!0 (x!81604 lt!427129) (index!38877 lt!427129) (index!38877 lt!427129) key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)))))

(declare-fun b!948546 () Bool)

(assert (=> b!948546 (= e!533971 (MissingZero!9126 (index!38877 lt!427129)))))

(declare-fun b!948547 () Bool)

(assert (=> b!948547 (= e!533972 Undefined!9126)))

(declare-fun b!948548 () Bool)

(declare-fun e!533973 () SeekEntryResult!9126)

(assert (=> b!948548 (= e!533972 e!533973)))

(declare-fun lt!427131 () (_ BitVec 64))

(assert (=> b!948548 (= lt!427131 (select (arr!27619 (_keys!10669 thiss!1141)) (index!38877 lt!427129)))))

(declare-fun c!98892 () Bool)

(assert (=> b!948548 (= c!98892 (= lt!427131 key!756))))

(declare-fun b!948549 () Bool)

(declare-fun c!98891 () Bool)

(assert (=> b!948549 (= c!98891 (= lt!427131 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948549 (= e!533973 e!533971)))

(declare-fun b!948550 () Bool)

(assert (=> b!948550 (= e!533973 (Found!9126 (index!38877 lt!427129)))))

(assert (= (and d!114849 c!98893) b!948547))

(assert (= (and d!114849 (not c!98893)) b!948548))

(assert (= (and b!948548 c!98892) b!948550))

(assert (= (and b!948548 (not c!98892)) b!948549))

(assert (= (and b!948549 c!98891) b!948546))

(assert (= (and b!948549 (not c!98891)) b!948545))

(declare-fun m!881295 () Bool)

(assert (=> d!114849 m!881295))

(declare-fun m!881297 () Bool)

(assert (=> d!114849 m!881297))

(assert (=> d!114849 m!881297))

(declare-fun m!881299 () Bool)

(assert (=> d!114849 m!881299))

(assert (=> d!114849 m!881201))

(declare-fun m!881301 () Bool)

(assert (=> b!948545 m!881301))

(declare-fun m!881303 () Bool)

(assert (=> b!948548 m!881303))

(assert (=> b!948427 d!114849))

(declare-fun d!114851 () Bool)

(assert (=> d!114851 (= (validMask!0 (mask!27510 thiss!1141)) (and (or (= (mask!27510 thiss!1141) #b00000000000000000000000000000111) (= (mask!27510 thiss!1141) #b00000000000000000000000000001111) (= (mask!27510 thiss!1141) #b00000000000000000000000000011111) (= (mask!27510 thiss!1141) #b00000000000000000000000000111111) (= (mask!27510 thiss!1141) #b00000000000000000000000001111111) (= (mask!27510 thiss!1141) #b00000000000000000000000011111111) (= (mask!27510 thiss!1141) #b00000000000000000000000111111111) (= (mask!27510 thiss!1141) #b00000000000000000000001111111111) (= (mask!27510 thiss!1141) #b00000000000000000000011111111111) (= (mask!27510 thiss!1141) #b00000000000000000000111111111111) (= (mask!27510 thiss!1141) #b00000000000000000001111111111111) (= (mask!27510 thiss!1141) #b00000000000000000011111111111111) (= (mask!27510 thiss!1141) #b00000000000000000111111111111111) (= (mask!27510 thiss!1141) #b00000000000000001111111111111111) (= (mask!27510 thiss!1141) #b00000000000000011111111111111111) (= (mask!27510 thiss!1141) #b00000000000000111111111111111111) (= (mask!27510 thiss!1141) #b00000000000001111111111111111111) (= (mask!27510 thiss!1141) #b00000000000011111111111111111111) (= (mask!27510 thiss!1141) #b00000000000111111111111111111111) (= (mask!27510 thiss!1141) #b00000000001111111111111111111111) (= (mask!27510 thiss!1141) #b00000000011111111111111111111111) (= (mask!27510 thiss!1141) #b00000000111111111111111111111111) (= (mask!27510 thiss!1141) #b00000001111111111111111111111111) (= (mask!27510 thiss!1141) #b00000011111111111111111111111111) (= (mask!27510 thiss!1141) #b00000111111111111111111111111111) (= (mask!27510 thiss!1141) #b00001111111111111111111111111111) (= (mask!27510 thiss!1141) #b00011111111111111111111111111111) (= (mask!27510 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27510 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!948431 d!114851))

(declare-fun d!114853 () Bool)

(declare-fun res!636350 () Bool)

(declare-fun e!533976 () Bool)

(assert (=> d!114853 (=> (not res!636350) (not e!533976))))

(declare-fun simpleValid!368 (LongMapFixedSize!4896) Bool)

(assert (=> d!114853 (= res!636350 (simpleValid!368 thiss!1141))))

(assert (=> d!114853 (= (valid!1864 thiss!1141) e!533976)))

(declare-fun b!948557 () Bool)

(declare-fun res!636351 () Bool)

(assert (=> b!948557 (=> (not res!636351) (not e!533976))))

(declare-fun arrayCountValidKeys!0 (array!57426 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948557 (= res!636351 (= (arrayCountValidKeys!0 (_keys!10669 thiss!1141) #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))) (_size!2503 thiss!1141)))))

(declare-fun b!948558 () Bool)

(declare-fun res!636352 () Bool)

(assert (=> b!948558 (=> (not res!636352) (not e!533976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57426 (_ BitVec 32)) Bool)

(assert (=> b!948558 (= res!636352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)))))

(declare-fun b!948559 () Bool)

(declare-datatypes ((List!19320 0))(
  ( (Nil!19317) (Cons!19316 (h!20473 (_ BitVec 64)) (t!27649 List!19320)) )
))
(declare-fun arrayNoDuplicates!0 (array!57426 (_ BitVec 32) List!19320) Bool)

(assert (=> b!948559 (= e!533976 (arrayNoDuplicates!0 (_keys!10669 thiss!1141) #b00000000000000000000000000000000 Nil!19317))))

(assert (= (and d!114853 res!636350) b!948557))

(assert (= (and b!948557 res!636351) b!948558))

(assert (= (and b!948558 res!636352) b!948559))

(declare-fun m!881305 () Bool)

(assert (=> d!114853 m!881305))

(declare-fun m!881307 () Bool)

(assert (=> b!948557 m!881307))

(declare-fun m!881309 () Bool)

(assert (=> b!948558 m!881309))

(declare-fun m!881311 () Bool)

(assert (=> b!948559 m!881311))

(assert (=> start!80968 d!114853))

(declare-fun mapIsEmpty!32960 () Bool)

(declare-fun mapRes!32960 () Bool)

(assert (=> mapIsEmpty!32960 mapRes!32960))

(declare-fun condMapEmpty!32960 () Bool)

(declare-fun mapDefault!32960 () ValueCell!9873)

(assert (=> mapNonEmpty!32954 (= condMapEmpty!32960 (= mapRest!32954 ((as const (Array (_ BitVec 32) ValueCell!9873)) mapDefault!32960)))))

(declare-fun e!533981 () Bool)

(assert (=> mapNonEmpty!32954 (= tp!63178 (and e!533981 mapRes!32960))))

(declare-fun b!948567 () Bool)

(assert (=> b!948567 (= e!533981 tp_is_empty!20709)))

(declare-fun mapNonEmpty!32960 () Bool)

(declare-fun tp!63187 () Bool)

(declare-fun e!533982 () Bool)

(assert (=> mapNonEmpty!32960 (= mapRes!32960 (and tp!63187 e!533982))))

(declare-fun mapRest!32960 () (Array (_ BitVec 32) ValueCell!9873))

(declare-fun mapKey!32960 () (_ BitVec 32))

(declare-fun mapValue!32960 () ValueCell!9873)

(assert (=> mapNonEmpty!32960 (= mapRest!32954 (store mapRest!32960 mapKey!32960 mapValue!32960))))

(declare-fun b!948566 () Bool)

(assert (=> b!948566 (= e!533982 tp_is_empty!20709)))

(assert (= (and mapNonEmpty!32954 condMapEmpty!32960) mapIsEmpty!32960))

(assert (= (and mapNonEmpty!32954 (not condMapEmpty!32960)) mapNonEmpty!32960))

(assert (= (and mapNonEmpty!32960 ((_ is ValueCellFull!9873) mapValue!32960)) b!948566))

(assert (= (and mapNonEmpty!32954 ((_ is ValueCellFull!9873) mapDefault!32960)) b!948567))

(declare-fun m!881313 () Bool)

(assert (=> mapNonEmpty!32960 m!881313))

(declare-fun b_lambda!14321 () Bool)

(assert (= b_lambda!14319 (or (and b!948425 b_free!18201) b_lambda!14321)))

(check-sat tp_is_empty!20709 (not d!114847) (not b!948465) (not b!948467) (not bm!41212) (not b!948529) (not b!948525) (not b!948545) (not b!948558) (not b!948517) (not b!948527) (not bm!41216) (not mapNonEmpty!32960) (not bm!41214) (not bm!41215) (not d!114849) (not b!948559) (not b!948519) (not b!948522) (not b_lambda!14321) (not b!948510) (not d!114845) (not b!948521) (not b_next!18201) (not d!114853) b_and!29637 (not b!948557))
(check-sat b_and!29637 (not b_next!18201))
(get-model)

(declare-fun d!114855 () Bool)

(assert (=> d!114855 (= (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!948529 d!114855))

(declare-fun d!114857 () Bool)

(declare-fun e!533983 () Bool)

(assert (=> d!114857 e!533983))

(declare-fun res!636353 () Bool)

(assert (=> d!114857 (=> res!636353 e!533983)))

(declare-fun lt!427134 () Bool)

(assert (=> d!114857 (= res!636353 (not lt!427134))))

(declare-fun lt!427133 () Bool)

(assert (=> d!114857 (= lt!427134 lt!427133)))

(declare-fun lt!427135 () Unit!31953)

(declare-fun e!533984 () Unit!31953)

(assert (=> d!114857 (= lt!427135 e!533984)))

(declare-fun c!98894 () Bool)

(assert (=> d!114857 (= c!98894 lt!427133)))

(assert (=> d!114857 (= lt!427133 (containsKey!458 (toList!6126 lt!427119) (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114857 (= (contains!5210 lt!427119 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)) lt!427134)))

(declare-fun b!948568 () Bool)

(declare-fun lt!427132 () Unit!31953)

(assert (=> b!948568 (= e!533984 lt!427132)))

(assert (=> b!948568 (= lt!427132 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6126 lt!427119) (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948568 (isDefined!363 (getValueByKey!491 (toList!6126 lt!427119) (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948569 () Bool)

(declare-fun Unit!31957 () Unit!31953)

(assert (=> b!948569 (= e!533984 Unit!31957)))

(declare-fun b!948570 () Bool)

(assert (=> b!948570 (= e!533983 (isDefined!363 (getValueByKey!491 (toList!6126 lt!427119) (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114857 c!98894) b!948568))

(assert (= (and d!114857 (not c!98894)) b!948569))

(assert (= (and d!114857 (not res!636353)) b!948570))

(assert (=> d!114857 m!881239))

(declare-fun m!881315 () Bool)

(assert (=> d!114857 m!881315))

(assert (=> b!948568 m!881239))

(declare-fun m!881317 () Bool)

(assert (=> b!948568 m!881317))

(assert (=> b!948568 m!881239))

(declare-fun m!881319 () Bool)

(assert (=> b!948568 m!881319))

(assert (=> b!948568 m!881319))

(declare-fun m!881321 () Bool)

(assert (=> b!948568 m!881321))

(assert (=> b!948570 m!881239))

(assert (=> b!948570 m!881319))

(assert (=> b!948570 m!881319))

(assert (=> b!948570 m!881321))

(assert (=> b!948521 d!114857))

(declare-fun d!114859 () Bool)

(declare-fun e!533985 () Bool)

(assert (=> d!114859 e!533985))

(declare-fun res!636354 () Bool)

(assert (=> d!114859 (=> res!636354 e!533985)))

(declare-fun lt!427138 () Bool)

(assert (=> d!114859 (= res!636354 (not lt!427138))))

(declare-fun lt!427137 () Bool)

(assert (=> d!114859 (= lt!427138 lt!427137)))

(declare-fun lt!427139 () Unit!31953)

(declare-fun e!533986 () Unit!31953)

(assert (=> d!114859 (= lt!427139 e!533986)))

(declare-fun c!98895 () Bool)

(assert (=> d!114859 (= c!98895 lt!427137)))

(assert (=> d!114859 (= lt!427137 (containsKey!458 (toList!6126 lt!427119) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114859 (= (contains!5210 lt!427119 #b0000000000000000000000000000000000000000000000000000000000000000) lt!427138)))

(declare-fun b!948571 () Bool)

(declare-fun lt!427136 () Unit!31953)

(assert (=> b!948571 (= e!533986 lt!427136)))

(assert (=> b!948571 (= lt!427136 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6126 lt!427119) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948571 (isDefined!363 (getValueByKey!491 (toList!6126 lt!427119) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948572 () Bool)

(declare-fun Unit!31958 () Unit!31953)

(assert (=> b!948572 (= e!533986 Unit!31958)))

(declare-fun b!948573 () Bool)

(assert (=> b!948573 (= e!533985 (isDefined!363 (getValueByKey!491 (toList!6126 lt!427119) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114859 c!98895) b!948571))

(assert (= (and d!114859 (not c!98895)) b!948572))

(assert (= (and d!114859 (not res!636354)) b!948573))

(declare-fun m!881323 () Bool)

(assert (=> d!114859 m!881323))

(declare-fun m!881325 () Bool)

(assert (=> b!948571 m!881325))

(declare-fun m!881327 () Bool)

(assert (=> b!948571 m!881327))

(assert (=> b!948571 m!881327))

(declare-fun m!881329 () Bool)

(assert (=> b!948571 m!881329))

(assert (=> b!948573 m!881327))

(assert (=> b!948573 m!881327))

(assert (=> b!948573 m!881329))

(assert (=> bm!41215 d!114859))

(declare-fun bm!41220 () Bool)

(declare-fun call!41223 () Bool)

(assert (=> bm!41220 (= call!41223 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10669 thiss!1141) (mask!27510 thiss!1141)))))

(declare-fun b!948582 () Bool)

(declare-fun e!533993 () Bool)

(assert (=> b!948582 (= e!533993 call!41223)))

(declare-fun b!948583 () Bool)

(declare-fun e!533994 () Bool)

(assert (=> b!948583 (= e!533994 e!533993)))

(declare-fun lt!427147 () (_ BitVec 64))

(assert (=> b!948583 (= lt!427147 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!427146 () Unit!31953)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57426 (_ BitVec 64) (_ BitVec 32)) Unit!31953)

(assert (=> b!948583 (= lt!427146 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10669 thiss!1141) lt!427147 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57426 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!948583 (arrayContainsKey!0 (_keys!10669 thiss!1141) lt!427147 #b00000000000000000000000000000000)))

(declare-fun lt!427148 () Unit!31953)

(assert (=> b!948583 (= lt!427148 lt!427146)))

(declare-fun res!636359 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57426 (_ BitVec 32)) SeekEntryResult!9126)

(assert (=> b!948583 (= res!636359 (= (seekEntryOrOpen!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000) (_keys!10669 thiss!1141) (mask!27510 thiss!1141)) (Found!9126 #b00000000000000000000000000000000)))))

(assert (=> b!948583 (=> (not res!636359) (not e!533993))))

(declare-fun d!114861 () Bool)

(declare-fun res!636360 () Bool)

(declare-fun e!533995 () Bool)

(assert (=> d!114861 (=> res!636360 e!533995)))

(assert (=> d!114861 (= res!636360 (bvsge #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(assert (=> d!114861 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)) e!533995)))

(declare-fun b!948584 () Bool)

(assert (=> b!948584 (= e!533994 call!41223)))

(declare-fun b!948585 () Bool)

(assert (=> b!948585 (= e!533995 e!533994)))

(declare-fun c!98898 () Bool)

(assert (=> b!948585 (= c!98898 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114861 (not res!636360)) b!948585))

(assert (= (and b!948585 c!98898) b!948583))

(assert (= (and b!948585 (not c!98898)) b!948584))

(assert (= (and b!948583 res!636359) b!948582))

(assert (= (or b!948582 b!948584) bm!41220))

(declare-fun m!881331 () Bool)

(assert (=> bm!41220 m!881331))

(assert (=> b!948583 m!881239))

(declare-fun m!881333 () Bool)

(assert (=> b!948583 m!881333))

(declare-fun m!881335 () Bool)

(assert (=> b!948583 m!881335))

(assert (=> b!948583 m!881239))

(declare-fun m!881337 () Bool)

(assert (=> b!948583 m!881337))

(assert (=> b!948585 m!881239))

(assert (=> b!948585 m!881239))

(assert (=> b!948585 m!881241))

(assert (=> b!948558 d!114861))

(declare-fun d!114863 () Bool)

(declare-fun e!533996 () Bool)

(assert (=> d!114863 e!533996))

(declare-fun res!636361 () Bool)

(assert (=> d!114863 (=> res!636361 e!533996)))

(declare-fun lt!427151 () Bool)

(assert (=> d!114863 (= res!636361 (not lt!427151))))

(declare-fun lt!427150 () Bool)

(assert (=> d!114863 (= lt!427151 lt!427150)))

(declare-fun lt!427152 () Unit!31953)

(declare-fun e!533997 () Unit!31953)

(assert (=> d!114863 (= lt!427152 e!533997)))

(declare-fun c!98899 () Bool)

(assert (=> d!114863 (= c!98899 lt!427150)))

(assert (=> d!114863 (= lt!427150 (containsKey!458 (toList!6126 lt!427119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114863 (= (contains!5210 lt!427119 #b1000000000000000000000000000000000000000000000000000000000000000) lt!427151)))

(declare-fun b!948586 () Bool)

(declare-fun lt!427149 () Unit!31953)

(assert (=> b!948586 (= e!533997 lt!427149)))

(assert (=> b!948586 (= lt!427149 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6126 lt!427119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948586 (isDefined!363 (getValueByKey!491 (toList!6126 lt!427119) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948587 () Bool)

(declare-fun Unit!31959 () Unit!31953)

(assert (=> b!948587 (= e!533997 Unit!31959)))

(declare-fun b!948588 () Bool)

(assert (=> b!948588 (= e!533996 (isDefined!363 (getValueByKey!491 (toList!6126 lt!427119) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114863 c!98899) b!948586))

(assert (= (and d!114863 (not c!98899)) b!948587))

(assert (= (and d!114863 (not res!636361)) b!948588))

(declare-fun m!881339 () Bool)

(assert (=> d!114863 m!881339))

(declare-fun m!881341 () Bool)

(assert (=> b!948586 m!881341))

(declare-fun m!881343 () Bool)

(assert (=> b!948586 m!881343))

(assert (=> b!948586 m!881343))

(declare-fun m!881345 () Bool)

(assert (=> b!948586 m!881345))

(assert (=> b!948588 m!881343))

(assert (=> b!948588 m!881343))

(assert (=> b!948588 m!881345))

(assert (=> bm!41214 d!114863))

(declare-fun d!114865 () Bool)

(declare-fun res!636366 () Bool)

(declare-fun e!534002 () Bool)

(assert (=> d!114865 (=> res!636366 e!534002)))

(assert (=> d!114865 (= res!636366 (and ((_ is Cons!19314) (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))) (= (_1!6773 (h!20471 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))))) key!756)))))

(assert (=> d!114865 (= (containsKey!458 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756) e!534002)))

(declare-fun b!948593 () Bool)

(declare-fun e!534003 () Bool)

(assert (=> b!948593 (= e!534002 e!534003)))

(declare-fun res!636367 () Bool)

(assert (=> b!948593 (=> (not res!636367) (not e!534003))))

(assert (=> b!948593 (= res!636367 (and (or (not ((_ is Cons!19314) (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))))) (bvsle (_1!6773 (h!20471 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))))) key!756)) ((_ is Cons!19314) (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))) (bvslt (_1!6773 (h!20471 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))))) key!756)))))

(declare-fun b!948594 () Bool)

(assert (=> b!948594 (= e!534003 (containsKey!458 (t!27645 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))) key!756))))

(assert (= (and d!114865 (not res!636366)) b!948593))

(assert (= (and b!948593 res!636367) b!948594))

(declare-fun m!881347 () Bool)

(assert (=> b!948594 m!881347))

(assert (=> d!114845 d!114865))

(declare-fun b!948606 () Bool)

(declare-fun e!534006 () Bool)

(assert (=> b!948606 (= e!534006 (and (bvsge (extraKeys!5482 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5482 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2503 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!948604 () Bool)

(declare-fun res!636377 () Bool)

(assert (=> b!948604 (=> (not res!636377) (not e!534006))))

(declare-fun size!28096 (LongMapFixedSize!4896) (_ BitVec 32))

(assert (=> b!948604 (= res!636377 (bvsge (size!28096 thiss!1141) (_size!2503 thiss!1141)))))

(declare-fun b!948605 () Bool)

(declare-fun res!636376 () Bool)

(assert (=> b!948605 (=> (not res!636376) (not e!534006))))

(assert (=> b!948605 (= res!636376 (= (size!28096 thiss!1141) (bvadd (_size!2503 thiss!1141) (bvsdiv (bvadd (extraKeys!5482 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!948603 () Bool)

(declare-fun res!636378 () Bool)

(assert (=> b!948603 (=> (not res!636378) (not e!534006))))

(assert (=> b!948603 (= res!636378 (and (= (size!28092 (_values!5773 thiss!1141)) (bvadd (mask!27510 thiss!1141) #b00000000000000000000000000000001)) (= (size!28093 (_keys!10669 thiss!1141)) (size!28092 (_values!5773 thiss!1141))) (bvsge (_size!2503 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2503 thiss!1141) (bvadd (mask!27510 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114867 () Bool)

(declare-fun res!636379 () Bool)

(assert (=> d!114867 (=> (not res!636379) (not e!534006))))

(assert (=> d!114867 (= res!636379 (validMask!0 (mask!27510 thiss!1141)))))

(assert (=> d!114867 (= (simpleValid!368 thiss!1141) e!534006)))

(assert (= (and d!114867 res!636379) b!948603))

(assert (= (and b!948603 res!636378) b!948604))

(assert (= (and b!948604 res!636377) b!948605))

(assert (= (and b!948605 res!636376) b!948606))

(declare-fun m!881349 () Bool)

(assert (=> b!948604 m!881349))

(assert (=> b!948605 m!881349))

(assert (=> d!114867 m!881201))

(assert (=> d!114853 d!114867))

(declare-fun d!114869 () Bool)

(declare-fun e!534009 () Bool)

(assert (=> d!114869 e!534009))

(declare-fun res!636385 () Bool)

(assert (=> d!114869 (=> (not res!636385) (not e!534009))))

(declare-fun lt!427162 () ListLongMap!12221)

(assert (=> d!114869 (= res!636385 (contains!5210 lt!427162 (_1!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))))))

(declare-fun lt!427163 () List!19318)

(assert (=> d!114869 (= lt!427162 (ListLongMap!12222 lt!427163))))

(declare-fun lt!427161 () Unit!31953)

(declare-fun lt!427164 () Unit!31953)

(assert (=> d!114869 (= lt!427161 lt!427164)))

(assert (=> d!114869 (= (getValueByKey!491 lt!427163 (_1!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))) (Some!496 (_2!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!263 (List!19318 (_ BitVec 64) V!32577) Unit!31953)

(assert (=> d!114869 (= lt!427164 (lemmaContainsTupThenGetReturnValue!263 lt!427163 (_1!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))) (_2!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))))))

(declare-fun insertStrictlySorted!320 (List!19318 (_ BitVec 64) V!32577) List!19318)

(assert (=> d!114869 (= lt!427163 (insertStrictlySorted!320 (toList!6126 (ite c!98880 call!41218 (ite c!98883 call!41219 call!41216))) (_1!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))) (_2!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))))))

(assert (=> d!114869 (= (+!2856 (ite c!98880 call!41218 (ite c!98883 call!41219 call!41216)) (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))) lt!427162)))

(declare-fun b!948611 () Bool)

(declare-fun res!636384 () Bool)

(assert (=> b!948611 (=> (not res!636384) (not e!534009))))

(assert (=> b!948611 (= res!636384 (= (getValueByKey!491 (toList!6126 lt!427162) (_1!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))) (Some!496 (_2!6773 (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))))))))

(declare-fun b!948612 () Bool)

(declare-fun contains!5212 (List!19318 tuple2!13524) Bool)

(assert (=> b!948612 (= e!534009 (contains!5212 (toList!6126 lt!427162) (ite (or c!98880 c!98883) (tuple2!13525 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5586 thiss!1141)) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))))))

(assert (= (and d!114869 res!636385) b!948611))

(assert (= (and b!948611 res!636384) b!948612))

(declare-fun m!881351 () Bool)

(assert (=> d!114869 m!881351))

(declare-fun m!881353 () Bool)

(assert (=> d!114869 m!881353))

(declare-fun m!881355 () Bool)

(assert (=> d!114869 m!881355))

(declare-fun m!881357 () Bool)

(assert (=> d!114869 m!881357))

(declare-fun m!881359 () Bool)

(assert (=> b!948611 m!881359))

(declare-fun m!881361 () Bool)

(assert (=> b!948612 m!881361))

(assert (=> bm!41212 d!114869))

(declare-fun d!114871 () Bool)

(declare-fun lt!427167 () (_ BitVec 32))

(assert (=> d!114871 (and (bvsge lt!427167 #b00000000000000000000000000000000) (bvsle lt!427167 (bvsub (size!28093 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534014 () (_ BitVec 32))

(assert (=> d!114871 (= lt!427167 e!534014)))

(declare-fun c!98904 () Bool)

(assert (=> d!114871 (= c!98904 (bvsge #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(assert (=> d!114871 (and (bvsle #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28093 (_keys!10669 thiss!1141)) (size!28093 (_keys!10669 thiss!1141))))))

(assert (=> d!114871 (= (arrayCountValidKeys!0 (_keys!10669 thiss!1141) #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))) lt!427167)))

(declare-fun b!948621 () Bool)

(declare-fun e!534015 () (_ BitVec 32))

(declare-fun call!41226 () (_ BitVec 32))

(assert (=> b!948621 (= e!534015 call!41226)))

(declare-fun bm!41223 () Bool)

(assert (=> bm!41223 (= call!41226 (arrayCountValidKeys!0 (_keys!10669 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun b!948622 () Bool)

(assert (=> b!948622 (= e!534014 e!534015)))

(declare-fun c!98905 () Bool)

(assert (=> b!948622 (= c!98905 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948623 () Bool)

(assert (=> b!948623 (= e!534015 (bvadd #b00000000000000000000000000000001 call!41226))))

(declare-fun b!948624 () Bool)

(assert (=> b!948624 (= e!534014 #b00000000000000000000000000000000)))

(assert (= (and d!114871 c!98904) b!948624))

(assert (= (and d!114871 (not c!98904)) b!948622))

(assert (= (and b!948622 c!98905) b!948623))

(assert (= (and b!948622 (not c!98905)) b!948621))

(assert (= (or b!948623 b!948621) bm!41223))

(declare-fun m!881363 () Bool)

(assert (=> bm!41223 m!881363))

(assert (=> b!948622 m!881239))

(assert (=> b!948622 m!881239))

(assert (=> b!948622 m!881241))

(assert (=> b!948557 d!114871))

(declare-fun d!114873 () Bool)

(declare-fun get!14507 (Option!497) V!32577)

(assert (=> d!114873 (= (apply!872 lt!427119 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14507 (getValueByKey!491 (toList!6126 lt!427119) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26658 () Bool)

(assert (= bs!26658 d!114873))

(assert (=> bs!26658 m!881343))

(assert (=> bs!26658 m!881343))

(declare-fun m!881365 () Bool)

(assert (=> bs!26658 m!881365))

(assert (=> b!948527 d!114873))

(declare-fun b!948637 () Bool)

(declare-fun c!98912 () Bool)

(declare-fun lt!427173 () (_ BitVec 64))

(assert (=> b!948637 (= c!98912 (= lt!427173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!534023 () SeekEntryResult!9126)

(declare-fun e!534024 () SeekEntryResult!9126)

(assert (=> b!948637 (= e!534023 e!534024)))

(declare-fun lt!427172 () SeekEntryResult!9126)

(declare-fun d!114875 () Bool)

(assert (=> d!114875 (and (or ((_ is Undefined!9126) lt!427172) (not ((_ is Found!9126) lt!427172)) (and (bvsge (index!38876 lt!427172) #b00000000000000000000000000000000) (bvslt (index!38876 lt!427172) (size!28093 (_keys!10669 thiss!1141))))) (or ((_ is Undefined!9126) lt!427172) ((_ is Found!9126) lt!427172) (not ((_ is MissingVacant!9126) lt!427172)) (not (= (index!38878 lt!427172) (index!38877 lt!427129))) (and (bvsge (index!38878 lt!427172) #b00000000000000000000000000000000) (bvslt (index!38878 lt!427172) (size!28093 (_keys!10669 thiss!1141))))) (or ((_ is Undefined!9126) lt!427172) (ite ((_ is Found!9126) lt!427172) (= (select (arr!27619 (_keys!10669 thiss!1141)) (index!38876 lt!427172)) key!756) (and ((_ is MissingVacant!9126) lt!427172) (= (index!38878 lt!427172) (index!38877 lt!427129)) (= (select (arr!27619 (_keys!10669 thiss!1141)) (index!38878 lt!427172)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!534022 () SeekEntryResult!9126)

(assert (=> d!114875 (= lt!427172 e!534022)))

(declare-fun c!98914 () Bool)

(assert (=> d!114875 (= c!98914 (bvsge (x!81604 lt!427129) #b01111111111111111111111111111110))))

(assert (=> d!114875 (= lt!427173 (select (arr!27619 (_keys!10669 thiss!1141)) (index!38877 lt!427129)))))

(assert (=> d!114875 (validMask!0 (mask!27510 thiss!1141))))

(assert (=> d!114875 (= (seekKeyOrZeroReturnVacant!0 (x!81604 lt!427129) (index!38877 lt!427129) (index!38877 lt!427129) key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)) lt!427172)))

(declare-fun b!948638 () Bool)

(assert (=> b!948638 (= e!534023 (Found!9126 (index!38877 lt!427129)))))

(declare-fun b!948639 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!948639 (= e!534024 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81604 lt!427129) #b00000000000000000000000000000001) (nextIndex!0 (index!38877 lt!427129) (x!81604 lt!427129) (mask!27510 thiss!1141)) (index!38877 lt!427129) key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)))))

(declare-fun b!948640 () Bool)

(assert (=> b!948640 (= e!534022 Undefined!9126)))

(declare-fun b!948641 () Bool)

(assert (=> b!948641 (= e!534022 e!534023)))

(declare-fun c!98913 () Bool)

(assert (=> b!948641 (= c!98913 (= lt!427173 key!756))))

(declare-fun b!948642 () Bool)

(assert (=> b!948642 (= e!534024 (MissingVacant!9126 (index!38877 lt!427129)))))

(assert (= (and d!114875 c!98914) b!948640))

(assert (= (and d!114875 (not c!98914)) b!948641))

(assert (= (and b!948641 c!98913) b!948638))

(assert (= (and b!948641 (not c!98913)) b!948637))

(assert (= (and b!948637 c!98912) b!948642))

(assert (= (and b!948637 (not c!98912)) b!948639))

(declare-fun m!881367 () Bool)

(assert (=> d!114875 m!881367))

(declare-fun m!881369 () Bool)

(assert (=> d!114875 m!881369))

(assert (=> d!114875 m!881303))

(assert (=> d!114875 m!881201))

(declare-fun m!881371 () Bool)

(assert (=> b!948639 m!881371))

(assert (=> b!948639 m!881371))

(declare-fun m!881373 () Bool)

(assert (=> b!948639 m!881373))

(assert (=> b!948545 d!114875))

(declare-fun d!114877 () Bool)

(assert (=> d!114877 (= (apply!872 lt!427119 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14507 (getValueByKey!491 (toList!6126 lt!427119) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26659 () Bool)

(assert (= bs!26659 d!114877))

(assert (=> bs!26659 m!881327))

(assert (=> bs!26659 m!881327))

(declare-fun m!881375 () Bool)

(assert (=> bs!26659 m!881375))

(assert (=> b!948519 d!114877))

(declare-fun d!114879 () Bool)

(declare-fun e!534025 () Bool)

(assert (=> d!114879 e!534025))

(declare-fun res!636387 () Bool)

(assert (=> d!114879 (=> (not res!636387) (not e!534025))))

(declare-fun lt!427175 () ListLongMap!12221)

(assert (=> d!114879 (= res!636387 (contains!5210 lt!427175 (_1!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))))))

(declare-fun lt!427176 () List!19318)

(assert (=> d!114879 (= lt!427175 (ListLongMap!12222 lt!427176))))

(declare-fun lt!427174 () Unit!31953)

(declare-fun lt!427177 () Unit!31953)

(assert (=> d!114879 (= lt!427174 lt!427177)))

(assert (=> d!114879 (= (getValueByKey!491 lt!427176 (_1!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))))))

(assert (=> d!114879 (= lt!427177 (lemmaContainsTupThenGetReturnValue!263 lt!427176 (_1!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))))))

(assert (=> d!114879 (= lt!427176 (insertStrictlySorted!320 (toList!6126 call!41215) (_1!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))))))

(assert (=> d!114879 (= (+!2856 call!41215 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))) lt!427175)))

(declare-fun b!948643 () Bool)

(declare-fun res!636386 () Bool)

(assert (=> b!948643 (=> (not res!636386) (not e!534025))))

(assert (=> b!948643 (= res!636386 (= (getValueByKey!491 (toList!6126 lt!427175) (_1!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))))))

(declare-fun b!948644 () Bool)

(assert (=> b!948644 (= e!534025 (contains!5212 (toList!6126 lt!427175) (tuple2!13525 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5586 thiss!1141))))))

(assert (= (and d!114879 res!636387) b!948643))

(assert (= (and b!948643 res!636386) b!948644))

(declare-fun m!881377 () Bool)

(assert (=> d!114879 m!881377))

(declare-fun m!881379 () Bool)

(assert (=> d!114879 m!881379))

(declare-fun m!881381 () Bool)

(assert (=> d!114879 m!881381))

(declare-fun m!881383 () Bool)

(assert (=> d!114879 m!881383))

(declare-fun m!881385 () Bool)

(assert (=> b!948643 m!881385))

(declare-fun m!881387 () Bool)

(assert (=> b!948644 m!881387))

(assert (=> b!948510 d!114879))

(declare-fun b!948669 () Bool)

(declare-fun e!534044 () ListLongMap!12221)

(assert (=> b!948669 (= e!534044 (ListLongMap!12222 Nil!19315))))

(declare-fun b!948670 () Bool)

(assert (=> b!948670 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(assert (=> b!948670 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28092 (_values!5773 thiss!1141))))))

(declare-fun e!534041 () Bool)

(declare-fun lt!427196 () ListLongMap!12221)

(assert (=> b!948670 (= e!534041 (= (apply!872 lt!427196 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)) (get!14506 (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5750 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!41226 () Bool)

(declare-fun call!41229 () ListLongMap!12221)

(assert (=> bm!41226 (= call!41229 (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5750 thiss!1141)))))

(declare-fun b!948671 () Bool)

(declare-fun e!534046 () ListLongMap!12221)

(assert (=> b!948671 (= e!534046 call!41229)))

(declare-fun b!948672 () Bool)

(declare-fun res!636398 () Bool)

(declare-fun e!534045 () Bool)

(assert (=> b!948672 (=> (not res!636398) (not e!534045))))

(assert (=> b!948672 (= res!636398 (not (contains!5210 lt!427196 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948673 () Bool)

(assert (=> b!948673 (= e!534044 e!534046)))

(declare-fun c!98925 () Bool)

(assert (=> b!948673 (= c!98925 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948674 () Bool)

(declare-fun e!534040 () Bool)

(assert (=> b!948674 (= e!534040 (= lt!427196 (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5750 thiss!1141))))))

(declare-fun b!948675 () Bool)

(declare-fun e!534042 () Bool)

(assert (=> b!948675 (= e!534042 e!534041)))

(assert (=> b!948675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun res!636396 () Bool)

(assert (=> b!948675 (= res!636396 (contains!5210 lt!427196 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948675 (=> (not res!636396) (not e!534041))))

(declare-fun d!114881 () Bool)

(assert (=> d!114881 e!534045))

(declare-fun res!636399 () Bool)

(assert (=> d!114881 (=> (not res!636399) (not e!534045))))

(assert (=> d!114881 (= res!636399 (not (contains!5210 lt!427196 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!114881 (= lt!427196 e!534044)))

(declare-fun c!98924 () Bool)

(assert (=> d!114881 (= c!98924 (bvsge #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(assert (=> d!114881 (validMask!0 (mask!27510 thiss!1141))))

(assert (=> d!114881 (= (getCurrentListMapNoExtraKeys!3311 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)) lt!427196)))

(declare-fun b!948676 () Bool)

(declare-fun isEmpty!706 (ListLongMap!12221) Bool)

(assert (=> b!948676 (= e!534040 (isEmpty!706 lt!427196))))

(declare-fun b!948677 () Bool)

(declare-fun lt!427193 () Unit!31953)

(declare-fun lt!427192 () Unit!31953)

(assert (=> b!948677 (= lt!427193 lt!427192)))

(declare-fun lt!427195 () ListLongMap!12221)

(declare-fun lt!427194 () V!32577)

(declare-fun lt!427197 () (_ BitVec 64))

(declare-fun lt!427198 () (_ BitVec 64))

(assert (=> b!948677 (not (contains!5210 (+!2856 lt!427195 (tuple2!13525 lt!427197 lt!427194)) lt!427198))))

(declare-fun addStillNotContains!224 (ListLongMap!12221 (_ BitVec 64) V!32577 (_ BitVec 64)) Unit!31953)

(assert (=> b!948677 (= lt!427192 (addStillNotContains!224 lt!427195 lt!427197 lt!427194 lt!427198))))

(assert (=> b!948677 (= lt!427198 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!948677 (= lt!427194 (get!14506 (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5750 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!948677 (= lt!427197 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!948677 (= lt!427195 call!41229)))

(assert (=> b!948677 (= e!534046 (+!2856 call!41229 (tuple2!13525 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000) (get!14506 (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5750 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!948678 () Bool)

(assert (=> b!948678 (= e!534042 e!534040)))

(declare-fun c!98923 () Bool)

(assert (=> b!948678 (= c!98923 (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun b!948679 () Bool)

(declare-fun e!534043 () Bool)

(assert (=> b!948679 (= e!534043 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!948679 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!948680 () Bool)

(assert (=> b!948680 (= e!534045 e!534042)))

(declare-fun c!98926 () Bool)

(assert (=> b!948680 (= c!98926 e!534043)))

(declare-fun res!636397 () Bool)

(assert (=> b!948680 (=> (not res!636397) (not e!534043))))

(assert (=> b!948680 (= res!636397 (bvslt #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(assert (= (and d!114881 c!98924) b!948669))

(assert (= (and d!114881 (not c!98924)) b!948673))

(assert (= (and b!948673 c!98925) b!948677))

(assert (= (and b!948673 (not c!98925)) b!948671))

(assert (= (or b!948677 b!948671) bm!41226))

(assert (= (and d!114881 res!636399) b!948672))

(assert (= (and b!948672 res!636398) b!948680))

(assert (= (and b!948680 res!636397) b!948679))

(assert (= (and b!948680 c!98926) b!948675))

(assert (= (and b!948680 (not c!98926)) b!948678))

(assert (= (and b!948675 res!636396) b!948670))

(assert (= (and b!948678 c!98923) b!948674))

(assert (= (and b!948678 (not c!98923)) b!948676))

(declare-fun b_lambda!14323 () Bool)

(assert (=> (not b_lambda!14323) (not b!948670)))

(assert (=> b!948670 t!27648))

(declare-fun b_and!29639 () Bool)

(assert (= b_and!29637 (and (=> t!27648 result!12259) b_and!29639)))

(declare-fun b_lambda!14325 () Bool)

(assert (=> (not b_lambda!14325) (not b!948677)))

(assert (=> b!948677 t!27648))

(declare-fun b_and!29641 () Bool)

(assert (= b_and!29639 (and (=> t!27648 result!12259) b_and!29641)))

(declare-fun m!881389 () Bool)

(assert (=> b!948674 m!881389))

(declare-fun m!881391 () Bool)

(assert (=> d!114881 m!881391))

(assert (=> d!114881 m!881201))

(declare-fun m!881393 () Bool)

(assert (=> b!948672 m!881393))

(assert (=> b!948675 m!881239))

(assert (=> b!948675 m!881239))

(declare-fun m!881395 () Bool)

(assert (=> b!948675 m!881395))

(assert (=> b!948679 m!881239))

(assert (=> b!948679 m!881239))

(assert (=> b!948679 m!881241))

(assert (=> b!948673 m!881239))

(assert (=> b!948673 m!881239))

(assert (=> b!948673 m!881241))

(declare-fun m!881397 () Bool)

(assert (=> b!948676 m!881397))

(assert (=> bm!41226 m!881389))

(assert (=> b!948670 m!881253))

(assert (=> b!948670 m!881255))

(assert (=> b!948670 m!881257))

(assert (=> b!948670 m!881239))

(assert (=> b!948670 m!881239))

(declare-fun m!881399 () Bool)

(assert (=> b!948670 m!881399))

(assert (=> b!948670 m!881255))

(assert (=> b!948670 m!881253))

(declare-fun m!881401 () Bool)

(assert (=> b!948677 m!881401))

(assert (=> b!948677 m!881253))

(assert (=> b!948677 m!881255))

(assert (=> b!948677 m!881257))

(assert (=> b!948677 m!881239))

(declare-fun m!881403 () Bool)

(assert (=> b!948677 m!881403))

(declare-fun m!881405 () Bool)

(assert (=> b!948677 m!881405))

(assert (=> b!948677 m!881405))

(declare-fun m!881407 () Bool)

(assert (=> b!948677 m!881407))

(assert (=> b!948677 m!881255))

(assert (=> b!948677 m!881253))

(assert (=> bm!41216 d!114881))

(assert (=> b!948525 d!114855))

(declare-fun d!114883 () Bool)

(assert (=> d!114883 (= (apply!872 lt!427119 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)) (get!14507 (getValueByKey!491 (toList!6126 lt!427119) (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26660 () Bool)

(assert (= bs!26660 d!114883))

(assert (=> bs!26660 m!881239))

(assert (=> bs!26660 m!881319))

(assert (=> bs!26660 m!881319))

(declare-fun m!881409 () Bool)

(assert (=> bs!26660 m!881409))

(assert (=> b!948517 d!114883))

(declare-fun d!114885 () Bool)

(declare-fun c!98929 () Bool)

(assert (=> d!114885 (= c!98929 ((_ is ValueCellFull!9873) (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!534049 () V!32577)

(assert (=> d!114885 (= (get!14506 (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5750 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!534049)))

(declare-fun b!948685 () Bool)

(declare-fun get!14508 (ValueCell!9873 V!32577) V!32577)

(assert (=> b!948685 (= e!534049 (get!14508 (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5750 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948686 () Bool)

(declare-fun get!14509 (ValueCell!9873 V!32577) V!32577)

(assert (=> b!948686 (= e!534049 (get!14509 (select (arr!27618 (_values!5773 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1645 (defaultEntry!5750 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114885 c!98929) b!948685))

(assert (= (and d!114885 (not c!98929)) b!948686))

(assert (=> b!948685 m!881253))

(assert (=> b!948685 m!881255))

(declare-fun m!881411 () Bool)

(assert (=> b!948685 m!881411))

(assert (=> b!948686 m!881253))

(assert (=> b!948686 m!881255))

(declare-fun m!881413 () Bool)

(assert (=> b!948686 m!881413))

(assert (=> b!948517 d!114885))

(assert (=> d!114847 d!114851))

(declare-fun b!948705 () Bool)

(declare-fun e!534061 () SeekEntryResult!9126)

(declare-fun e!534064 () SeekEntryResult!9126)

(assert (=> b!948705 (= e!534061 e!534064)))

(declare-fun c!98937 () Bool)

(declare-fun lt!427204 () (_ BitVec 64))

(assert (=> b!948705 (= c!98937 (or (= lt!427204 key!756) (= (bvadd lt!427204 lt!427204) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!948706 () Bool)

(assert (=> b!948706 (= e!534061 (Intermediate!9126 true (toIndex!0 key!756 (mask!27510 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!948707 () Bool)

(declare-fun lt!427203 () SeekEntryResult!9126)

(assert (=> b!948707 (and (bvsge (index!38877 lt!427203) #b00000000000000000000000000000000) (bvslt (index!38877 lt!427203) (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun e!534062 () Bool)

(assert (=> b!948707 (= e!534062 (= (select (arr!27619 (_keys!10669 thiss!1141)) (index!38877 lt!427203)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!948708 () Bool)

(assert (=> b!948708 (= e!534064 (Intermediate!9126 false (toIndex!0 key!756 (mask!27510 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!948709 () Bool)

(declare-fun e!534060 () Bool)

(declare-fun e!534063 () Bool)

(assert (=> b!948709 (= e!534060 e!534063)))

(declare-fun res!636407 () Bool)

(assert (=> b!948709 (= res!636407 (and ((_ is Intermediate!9126) lt!427203) (not (undefined!9938 lt!427203)) (bvslt (x!81604 lt!427203) #b01111111111111111111111111111110) (bvsge (x!81604 lt!427203) #b00000000000000000000000000000000) (bvsge (x!81604 lt!427203) #b00000000000000000000000000000000)))))

(assert (=> b!948709 (=> (not res!636407) (not e!534063))))

(declare-fun b!948711 () Bool)

(assert (=> b!948711 (and (bvsge (index!38877 lt!427203) #b00000000000000000000000000000000) (bvslt (index!38877 lt!427203) (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun res!636406 () Bool)

(assert (=> b!948711 (= res!636406 (= (select (arr!27619 (_keys!10669 thiss!1141)) (index!38877 lt!427203)) key!756))))

(assert (=> b!948711 (=> res!636406 e!534062)))

(assert (=> b!948711 (= e!534063 e!534062)))

(declare-fun b!948712 () Bool)

(assert (=> b!948712 (= e!534060 (bvsge (x!81604 lt!427203) #b01111111111111111111111111111110))))

(declare-fun b!948713 () Bool)

(assert (=> b!948713 (= e!534064 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27510 thiss!1141)) #b00000000000000000000000000000000 (mask!27510 thiss!1141)) key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)))))

(declare-fun d!114887 () Bool)

(assert (=> d!114887 e!534060))

(declare-fun c!98936 () Bool)

(assert (=> d!114887 (= c!98936 (and ((_ is Intermediate!9126) lt!427203) (undefined!9938 lt!427203)))))

(assert (=> d!114887 (= lt!427203 e!534061)))

(declare-fun c!98938 () Bool)

(assert (=> d!114887 (= c!98938 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114887 (= lt!427204 (select (arr!27619 (_keys!10669 thiss!1141)) (toIndex!0 key!756 (mask!27510 thiss!1141))))))

(assert (=> d!114887 (validMask!0 (mask!27510 thiss!1141))))

(assert (=> d!114887 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27510 thiss!1141)) key!756 (_keys!10669 thiss!1141) (mask!27510 thiss!1141)) lt!427203)))

(declare-fun b!948710 () Bool)

(assert (=> b!948710 (and (bvsge (index!38877 lt!427203) #b00000000000000000000000000000000) (bvslt (index!38877 lt!427203) (size!28093 (_keys!10669 thiss!1141))))))

(declare-fun res!636408 () Bool)

(assert (=> b!948710 (= res!636408 (= (select (arr!27619 (_keys!10669 thiss!1141)) (index!38877 lt!427203)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!948710 (=> res!636408 e!534062)))

(assert (= (and d!114887 c!98938) b!948706))

(assert (= (and d!114887 (not c!98938)) b!948705))

(assert (= (and b!948705 c!98937) b!948708))

(assert (= (and b!948705 (not c!98937)) b!948713))

(assert (= (and d!114887 c!98936) b!948712))

(assert (= (and d!114887 (not c!98936)) b!948709))

(assert (= (and b!948709 res!636407) b!948711))

(assert (= (and b!948711 (not res!636406)) b!948710))

(assert (= (and b!948710 (not res!636408)) b!948707))

(assert (=> d!114887 m!881297))

(declare-fun m!881415 () Bool)

(assert (=> d!114887 m!881415))

(assert (=> d!114887 m!881201))

(declare-fun m!881417 () Bool)

(assert (=> b!948710 m!881417))

(assert (=> b!948707 m!881417))

(assert (=> b!948713 m!881297))

(declare-fun m!881419 () Bool)

(assert (=> b!948713 m!881419))

(assert (=> b!948713 m!881419))

(declare-fun m!881421 () Bool)

(assert (=> b!948713 m!881421))

(assert (=> b!948711 m!881417))

(assert (=> d!114849 d!114887))

(declare-fun d!114889 () Bool)

(declare-fun lt!427210 () (_ BitVec 32))

(declare-fun lt!427209 () (_ BitVec 32))

(assert (=> d!114889 (= lt!427210 (bvmul (bvxor lt!427209 (bvlshr lt!427209 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114889 (= lt!427209 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114889 (and (bvsge (mask!27510 thiss!1141) #b00000000000000000000000000000000) (let ((res!636409 (let ((h!20474 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81623 (bvmul (bvxor h!20474 (bvlshr h!20474 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81623 (bvlshr x!81623 #b00000000000000000000000000001101)) (mask!27510 thiss!1141)))))) (and (bvslt res!636409 (bvadd (mask!27510 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!636409 #b00000000000000000000000000000000))))))

(assert (=> d!114889 (= (toIndex!0 key!756 (mask!27510 thiss!1141)) (bvand (bvxor lt!427210 (bvlshr lt!427210 #b00000000000000000000000000001101)) (mask!27510 thiss!1141)))))

(assert (=> d!114849 d!114889))

(assert (=> d!114849 d!114851))

(declare-fun d!114891 () Bool)

(declare-fun isEmpty!707 (Option!497) Bool)

(assert (=> d!114891 (= (isDefined!363 (getValueByKey!491 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756)) (not (isEmpty!707 (getValueByKey!491 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756))))))

(declare-fun bs!26661 () Bool)

(assert (= bs!26661 d!114891))

(assert (=> bs!26661 m!881233))

(declare-fun m!881423 () Bool)

(assert (=> bs!26661 m!881423))

(assert (=> b!948467 d!114891))

(declare-fun b!948722 () Bool)

(declare-fun e!534069 () Option!497)

(assert (=> b!948722 (= e!534069 (Some!496 (_2!6773 (h!20471 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))))))))

(declare-fun d!114893 () Bool)

(declare-fun c!98943 () Bool)

(assert (=> d!114893 (= c!98943 (and ((_ is Cons!19314) (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))) (= (_1!6773 (h!20471 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))))) key!756)))))

(assert (=> d!114893 (= (getValueByKey!491 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756) e!534069)))

(declare-fun b!948723 () Bool)

(declare-fun e!534070 () Option!497)

(assert (=> b!948723 (= e!534069 e!534070)))

(declare-fun c!98944 () Bool)

(assert (=> b!948723 (= c!98944 (and ((_ is Cons!19314) (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))) (not (= (_1!6773 (h!20471 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))))) key!756))))))

(declare-fun b!948725 () Bool)

(assert (=> b!948725 (= e!534070 None!495)))

(declare-fun b!948724 () Bool)

(assert (=> b!948724 (= e!534070 (getValueByKey!491 (t!27645 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))) key!756))))

(assert (= (and d!114893 c!98943) b!948722))

(assert (= (and d!114893 (not c!98943)) b!948723))

(assert (= (and b!948723 c!98944) b!948724))

(assert (= (and b!948723 (not c!98944)) b!948725))

(declare-fun m!881425 () Bool)

(assert (=> b!948724 m!881425))

(assert (=> b!948467 d!114893))

(declare-fun d!114895 () Bool)

(assert (=> d!114895 (isDefined!363 (getValueByKey!491 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756))))

(declare-fun lt!427213 () Unit!31953)

(declare-fun choose!1575 (List!19318 (_ BitVec 64)) Unit!31953)

(assert (=> d!114895 (= lt!427213 (choose!1575 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756))))

(declare-fun e!534073 () Bool)

(assert (=> d!114895 e!534073))

(declare-fun res!636412 () Bool)

(assert (=> d!114895 (=> (not res!636412) (not e!534073))))

(declare-fun isStrictlySorted!509 (List!19318) Bool)

(assert (=> d!114895 (= res!636412 (isStrictlySorted!509 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141)))))))

(assert (=> d!114895 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756) lt!427213)))

(declare-fun b!948728 () Bool)

(assert (=> b!948728 (= e!534073 (containsKey!458 (toList!6126 (getCurrentListMap!3359 (_keys!10669 thiss!1141) (_values!5773 thiss!1141) (mask!27510 thiss!1141) (extraKeys!5482 thiss!1141) (zeroValue!5586 thiss!1141) (minValue!5586 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5750 thiss!1141))) key!756))))

(assert (= (and d!114895 res!636412) b!948728))

(assert (=> d!114895 m!881233))

(assert (=> d!114895 m!881233))

(assert (=> d!114895 m!881235))

(declare-fun m!881427 () Bool)

(assert (=> d!114895 m!881427))

(declare-fun m!881429 () Bool)

(assert (=> d!114895 m!881429))

(assert (=> b!948728 m!881229))

(assert (=> b!948465 d!114895))

(assert (=> b!948465 d!114891))

(assert (=> b!948465 d!114893))

(declare-fun b!948739 () Bool)

(declare-fun e!534084 () Bool)

(declare-fun call!41232 () Bool)

(assert (=> b!948739 (= e!534084 call!41232)))

(declare-fun bm!41229 () Bool)

(declare-fun c!98947 () Bool)

(assert (=> bm!41229 (= call!41232 (arrayNoDuplicates!0 (_keys!10669 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98947 (Cons!19316 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000) Nil!19317) Nil!19317)))))

(declare-fun b!948740 () Bool)

(assert (=> b!948740 (= e!534084 call!41232)))

(declare-fun b!948741 () Bool)

(declare-fun e!534085 () Bool)

(assert (=> b!948741 (= e!534085 e!534084)))

(assert (=> b!948741 (= c!98947 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948742 () Bool)

(declare-fun e!534082 () Bool)

(assert (=> b!948742 (= e!534082 e!534085)))

(declare-fun res!636420 () Bool)

(assert (=> b!948742 (=> (not res!636420) (not e!534085))))

(declare-fun e!534083 () Bool)

(assert (=> b!948742 (= res!636420 (not e!534083))))

(declare-fun res!636419 () Bool)

(assert (=> b!948742 (=> (not res!636419) (not e!534083))))

(assert (=> b!948742 (= res!636419 (validKeyInArray!0 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!948743 () Bool)

(declare-fun contains!5213 (List!19320 (_ BitVec 64)) Bool)

(assert (=> b!948743 (= e!534083 (contains!5213 Nil!19317 (select (arr!27619 (_keys!10669 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114897 () Bool)

(declare-fun res!636421 () Bool)

(assert (=> d!114897 (=> res!636421 e!534082)))

(assert (=> d!114897 (= res!636421 (bvsge #b00000000000000000000000000000000 (size!28093 (_keys!10669 thiss!1141))))))

(assert (=> d!114897 (= (arrayNoDuplicates!0 (_keys!10669 thiss!1141) #b00000000000000000000000000000000 Nil!19317) e!534082)))

(assert (= (and d!114897 (not res!636421)) b!948742))

(assert (= (and b!948742 res!636419) b!948743))

(assert (= (and b!948742 res!636420) b!948741))

(assert (= (and b!948741 c!98947) b!948739))

(assert (= (and b!948741 (not c!98947)) b!948740))

(assert (= (or b!948739 b!948740) bm!41229))

(assert (=> bm!41229 m!881239))

(declare-fun m!881431 () Bool)

(assert (=> bm!41229 m!881431))

(assert (=> b!948741 m!881239))

(assert (=> b!948741 m!881239))

(assert (=> b!948741 m!881241))

(assert (=> b!948742 m!881239))

(assert (=> b!948742 m!881239))

(assert (=> b!948742 m!881241))

(assert (=> b!948743 m!881239))

(assert (=> b!948743 m!881239))

(declare-fun m!881433 () Bool)

(assert (=> b!948743 m!881433))

(assert (=> b!948559 d!114897))

(declare-fun d!114899 () Bool)

(assert (=> d!114899 (contains!5210 (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))) lt!427104)))

(declare-fun lt!427216 () Unit!31953)

(declare-fun choose!1576 (ListLongMap!12221 (_ BitVec 64) V!32577 (_ BitVec 64)) Unit!31953)

(assert (=> d!114899 (= lt!427216 (choose!1576 lt!427106 lt!427107 (zeroValue!5586 thiss!1141) lt!427104))))

(assert (=> d!114899 (contains!5210 lt!427106 lt!427104)))

(assert (=> d!114899 (= (addStillContains!575 lt!427106 lt!427107 (zeroValue!5586 thiss!1141) lt!427104) lt!427216)))

(declare-fun bs!26662 () Bool)

(assert (= bs!26662 d!114899))

(assert (=> bs!26662 m!881271))

(assert (=> bs!26662 m!881271))

(assert (=> bs!26662 m!881273))

(declare-fun m!881435 () Bool)

(assert (=> bs!26662 m!881435))

(declare-fun m!881437 () Bool)

(assert (=> bs!26662 m!881437))

(assert (=> b!948522 d!114899))

(declare-fun d!114901 () Bool)

(assert (=> d!114901 (= (apply!872 (+!2856 lt!427101 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))) lt!427098) (apply!872 lt!427101 lt!427098))))

(declare-fun lt!427219 () Unit!31953)

(declare-fun choose!1577 (ListLongMap!12221 (_ BitVec 64) V!32577 (_ BitVec 64)) Unit!31953)

(assert (=> d!114901 (= lt!427219 (choose!1577 lt!427101 lt!427110 (minValue!5586 thiss!1141) lt!427098))))

(declare-fun e!534088 () Bool)

(assert (=> d!114901 e!534088))

(declare-fun res!636424 () Bool)

(assert (=> d!114901 (=> (not res!636424) (not e!534088))))

(assert (=> d!114901 (= res!636424 (contains!5210 lt!427101 lt!427098))))

(assert (=> d!114901 (= (addApplyDifferent!455 lt!427101 lt!427110 (minValue!5586 thiss!1141) lt!427098) lt!427219)))

(declare-fun b!948748 () Bool)

(assert (=> b!948748 (= e!534088 (not (= lt!427098 lt!427110)))))

(assert (= (and d!114901 res!636424) b!948748))

(assert (=> d!114901 m!881283))

(assert (=> d!114901 m!881267))

(assert (=> d!114901 m!881269))

(declare-fun m!881439 () Bool)

(assert (=> d!114901 m!881439))

(declare-fun m!881441 () Bool)

(assert (=> d!114901 m!881441))

(assert (=> d!114901 m!881267))

(assert (=> b!948522 d!114901))

(declare-fun d!114903 () Bool)

(assert (=> d!114903 (= (apply!872 (+!2856 lt!427113 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))) lt!427102) (get!14507 (getValueByKey!491 (toList!6126 (+!2856 lt!427113 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141)))) lt!427102)))))

(declare-fun bs!26663 () Bool)

(assert (= bs!26663 d!114903))

(declare-fun m!881443 () Bool)

(assert (=> bs!26663 m!881443))

(assert (=> bs!26663 m!881443))

(declare-fun m!881445 () Bool)

(assert (=> bs!26663 m!881445))

(assert (=> b!948522 d!114903))

(declare-fun d!114905 () Bool)

(declare-fun e!534089 () Bool)

(assert (=> d!114905 e!534089))

(declare-fun res!636425 () Bool)

(assert (=> d!114905 (=> res!636425 e!534089)))

(declare-fun lt!427222 () Bool)

(assert (=> d!114905 (= res!636425 (not lt!427222))))

(declare-fun lt!427221 () Bool)

(assert (=> d!114905 (= lt!427222 lt!427221)))

(declare-fun lt!427223 () Unit!31953)

(declare-fun e!534090 () Unit!31953)

(assert (=> d!114905 (= lt!427223 e!534090)))

(declare-fun c!98948 () Bool)

(assert (=> d!114905 (= c!98948 lt!427221)))

(assert (=> d!114905 (= lt!427221 (containsKey!458 (toList!6126 (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))) lt!427104))))

(assert (=> d!114905 (= (contains!5210 (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))) lt!427104) lt!427222)))

(declare-fun b!948749 () Bool)

(declare-fun lt!427220 () Unit!31953)

(assert (=> b!948749 (= e!534090 lt!427220)))

(assert (=> b!948749 (= lt!427220 (lemmaContainsKeyImpliesGetValueByKeyDefined!354 (toList!6126 (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))) lt!427104))))

(assert (=> b!948749 (isDefined!363 (getValueByKey!491 (toList!6126 (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))) lt!427104))))

(declare-fun b!948750 () Bool)

(declare-fun Unit!31960 () Unit!31953)

(assert (=> b!948750 (= e!534090 Unit!31960)))

(declare-fun b!948751 () Bool)

(assert (=> b!948751 (= e!534089 (isDefined!363 (getValueByKey!491 (toList!6126 (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))) lt!427104)))))

(assert (= (and d!114905 c!98948) b!948749))

(assert (= (and d!114905 (not c!98948)) b!948750))

(assert (= (and d!114905 (not res!636425)) b!948751))

(declare-fun m!881447 () Bool)

(assert (=> d!114905 m!881447))

(declare-fun m!881449 () Bool)

(assert (=> b!948749 m!881449))

(declare-fun m!881451 () Bool)

(assert (=> b!948749 m!881451))

(assert (=> b!948749 m!881451))

(declare-fun m!881453 () Bool)

(assert (=> b!948749 m!881453))

(assert (=> b!948751 m!881451))

(assert (=> b!948751 m!881451))

(assert (=> b!948751 m!881453))

(assert (=> b!948522 d!114905))

(declare-fun d!114907 () Bool)

(assert (=> d!114907 (= (apply!872 (+!2856 lt!427112 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))) lt!427099) (apply!872 lt!427112 lt!427099))))

(declare-fun lt!427224 () Unit!31953)

(assert (=> d!114907 (= lt!427224 (choose!1577 lt!427112 lt!427109 (minValue!5586 thiss!1141) lt!427099))))

(declare-fun e!534091 () Bool)

(assert (=> d!114907 e!534091))

(declare-fun res!636426 () Bool)

(assert (=> d!114907 (=> (not res!636426) (not e!534091))))

(assert (=> d!114907 (= res!636426 (contains!5210 lt!427112 lt!427099))))

(assert (=> d!114907 (= (addApplyDifferent!455 lt!427112 lt!427109 (minValue!5586 thiss!1141) lt!427099) lt!427224)))

(declare-fun b!948752 () Bool)

(assert (=> b!948752 (= e!534091 (not (= lt!427099 lt!427109)))))

(assert (= (and d!114907 res!636426) b!948752))

(assert (=> d!114907 m!881287))

(assert (=> d!114907 m!881279))

(assert (=> d!114907 m!881281))

(declare-fun m!881455 () Bool)

(assert (=> d!114907 m!881455))

(declare-fun m!881457 () Bool)

(assert (=> d!114907 m!881457))

(assert (=> d!114907 m!881279))

(assert (=> b!948522 d!114907))

(declare-fun d!114909 () Bool)

(declare-fun e!534092 () Bool)

(assert (=> d!114909 e!534092))

(declare-fun res!636428 () Bool)

(assert (=> d!114909 (=> (not res!636428) (not e!534092))))

(declare-fun lt!427226 () ListLongMap!12221)

(assert (=> d!114909 (= res!636428 (contains!5210 lt!427226 (_1!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141)))))))

(declare-fun lt!427227 () List!19318)

(assert (=> d!114909 (= lt!427226 (ListLongMap!12222 lt!427227))))

(declare-fun lt!427225 () Unit!31953)

(declare-fun lt!427228 () Unit!31953)

(assert (=> d!114909 (= lt!427225 lt!427228)))

(assert (=> d!114909 (= (getValueByKey!491 lt!427227 (_1!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141)))))))

(assert (=> d!114909 (= lt!427228 (lemmaContainsTupThenGetReturnValue!263 lt!427227 (_1!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141)))))))

(assert (=> d!114909 (= lt!427227 (insertStrictlySorted!320 (toList!6126 lt!427113) (_1!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141)))))))

(assert (=> d!114909 (= (+!2856 lt!427113 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))) lt!427226)))

(declare-fun b!948753 () Bool)

(declare-fun res!636427 () Bool)

(assert (=> b!948753 (=> (not res!636427) (not e!534092))))

(assert (=> b!948753 (= res!636427 (= (getValueByKey!491 (toList!6126 lt!427226) (_1!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))))))))

(declare-fun b!948754 () Bool)

(assert (=> b!948754 (= e!534092 (contains!5212 (toList!6126 lt!427226) (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))))))

(assert (= (and d!114909 res!636428) b!948753))

(assert (= (and b!948753 res!636427) b!948754))

(declare-fun m!881459 () Bool)

(assert (=> d!114909 m!881459))

(declare-fun m!881461 () Bool)

(assert (=> d!114909 m!881461))

(declare-fun m!881463 () Bool)

(assert (=> d!114909 m!881463))

(declare-fun m!881465 () Bool)

(assert (=> d!114909 m!881465))

(declare-fun m!881467 () Bool)

(assert (=> b!948753 m!881467))

(declare-fun m!881469 () Bool)

(assert (=> b!948754 m!881469))

(assert (=> b!948522 d!114909))

(declare-fun d!114911 () Bool)

(declare-fun e!534093 () Bool)

(assert (=> d!114911 e!534093))

(declare-fun res!636430 () Bool)

(assert (=> d!114911 (=> (not res!636430) (not e!534093))))

(declare-fun lt!427230 () ListLongMap!12221)

(assert (=> d!114911 (= res!636430 (contains!5210 lt!427230 (_1!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141)))))))

(declare-fun lt!427231 () List!19318)

(assert (=> d!114911 (= lt!427230 (ListLongMap!12222 lt!427231))))

(declare-fun lt!427229 () Unit!31953)

(declare-fun lt!427232 () Unit!31953)

(assert (=> d!114911 (= lt!427229 lt!427232)))

(assert (=> d!114911 (= (getValueByKey!491 lt!427231 (_1!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141)))))))

(assert (=> d!114911 (= lt!427232 (lemmaContainsTupThenGetReturnValue!263 lt!427231 (_1!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141)))))))

(assert (=> d!114911 (= lt!427231 (insertStrictlySorted!320 (toList!6126 lt!427112) (_1!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141)))))))

(assert (=> d!114911 (= (+!2856 lt!427112 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))) lt!427230)))

(declare-fun b!948755 () Bool)

(declare-fun res!636429 () Bool)

(assert (=> b!948755 (=> (not res!636429) (not e!534093))))

(assert (=> b!948755 (= res!636429 (= (getValueByKey!491 (toList!6126 lt!427230) (_1!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))))))))

(declare-fun b!948756 () Bool)

(assert (=> b!948756 (= e!534093 (contains!5212 (toList!6126 lt!427230) (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))))))

(assert (= (and d!114911 res!636430) b!948755))

(assert (= (and b!948755 res!636429) b!948756))

(declare-fun m!881471 () Bool)

(assert (=> d!114911 m!881471))

(declare-fun m!881473 () Bool)

(assert (=> d!114911 m!881473))

(declare-fun m!881475 () Bool)

(assert (=> d!114911 m!881475))

(declare-fun m!881477 () Bool)

(assert (=> d!114911 m!881477))

(declare-fun m!881479 () Bool)

(assert (=> b!948755 m!881479))

(declare-fun m!881481 () Bool)

(assert (=> b!948756 m!881481))

(assert (=> b!948522 d!114911))

(declare-fun d!114913 () Bool)

(declare-fun e!534094 () Bool)

(assert (=> d!114913 e!534094))

(declare-fun res!636432 () Bool)

(assert (=> d!114913 (=> (not res!636432) (not e!534094))))

(declare-fun lt!427234 () ListLongMap!12221)

(assert (=> d!114913 (= res!636432 (contains!5210 lt!427234 (_1!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))))))

(declare-fun lt!427235 () List!19318)

(assert (=> d!114913 (= lt!427234 (ListLongMap!12222 lt!427235))))

(declare-fun lt!427233 () Unit!31953)

(declare-fun lt!427236 () Unit!31953)

(assert (=> d!114913 (= lt!427233 lt!427236)))

(assert (=> d!114913 (= (getValueByKey!491 lt!427235 (_1!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))))))

(assert (=> d!114913 (= lt!427236 (lemmaContainsTupThenGetReturnValue!263 lt!427235 (_1!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))))))

(assert (=> d!114913 (= lt!427235 (insertStrictlySorted!320 (toList!6126 lt!427106) (_1!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))))))

(assert (=> d!114913 (= (+!2856 lt!427106 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))) lt!427234)))

(declare-fun b!948757 () Bool)

(declare-fun res!636431 () Bool)

(assert (=> b!948757 (=> (not res!636431) (not e!534094))))

(assert (=> b!948757 (= res!636431 (= (getValueByKey!491 (toList!6126 lt!427234) (_1!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))))))))

(declare-fun b!948758 () Bool)

(assert (=> b!948758 (= e!534094 (contains!5212 (toList!6126 lt!427234) (tuple2!13525 lt!427107 (zeroValue!5586 thiss!1141))))))

(assert (= (and d!114913 res!636432) b!948757))

(assert (= (and b!948757 res!636431) b!948758))

(declare-fun m!881483 () Bool)

(assert (=> d!114913 m!881483))

(declare-fun m!881485 () Bool)

(assert (=> d!114913 m!881485))

(declare-fun m!881487 () Bool)

(assert (=> d!114913 m!881487))

(declare-fun m!881489 () Bool)

(assert (=> d!114913 m!881489))

(declare-fun m!881491 () Bool)

(assert (=> b!948757 m!881491))

(declare-fun m!881493 () Bool)

(assert (=> b!948758 m!881493))

(assert (=> b!948522 d!114913))

(declare-fun d!114915 () Bool)

(assert (=> d!114915 (= (apply!872 (+!2856 lt!427101 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))) lt!427098) (get!14507 (getValueByKey!491 (toList!6126 (+!2856 lt!427101 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141)))) lt!427098)))))

(declare-fun bs!26664 () Bool)

(assert (= bs!26664 d!114915))

(declare-fun m!881495 () Bool)

(assert (=> bs!26664 m!881495))

(assert (=> bs!26664 m!881495))

(declare-fun m!881497 () Bool)

(assert (=> bs!26664 m!881497))

(assert (=> b!948522 d!114915))

(assert (=> b!948522 d!114881))

(declare-fun d!114917 () Bool)

(assert (=> d!114917 (= (apply!872 lt!427101 lt!427098) (get!14507 (getValueByKey!491 (toList!6126 lt!427101) lt!427098)))))

(declare-fun bs!26665 () Bool)

(assert (= bs!26665 d!114917))

(declare-fun m!881499 () Bool)

(assert (=> bs!26665 m!881499))

(assert (=> bs!26665 m!881499))

(declare-fun m!881501 () Bool)

(assert (=> bs!26665 m!881501))

(assert (=> b!948522 d!114917))

(declare-fun d!114919 () Bool)

(assert (=> d!114919 (= (apply!872 lt!427112 lt!427099) (get!14507 (getValueByKey!491 (toList!6126 lt!427112) lt!427099)))))

(declare-fun bs!26666 () Bool)

(assert (= bs!26666 d!114919))

(declare-fun m!881503 () Bool)

(assert (=> bs!26666 m!881503))

(assert (=> bs!26666 m!881503))

(declare-fun m!881505 () Bool)

(assert (=> bs!26666 m!881505))

(assert (=> b!948522 d!114919))

(declare-fun d!114921 () Bool)

(declare-fun e!534095 () Bool)

(assert (=> d!114921 e!534095))

(declare-fun res!636434 () Bool)

(assert (=> d!114921 (=> (not res!636434) (not e!534095))))

(declare-fun lt!427238 () ListLongMap!12221)

(assert (=> d!114921 (= res!636434 (contains!5210 lt!427238 (_1!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141)))))))

(declare-fun lt!427239 () List!19318)

(assert (=> d!114921 (= lt!427238 (ListLongMap!12222 lt!427239))))

(declare-fun lt!427237 () Unit!31953)

(declare-fun lt!427240 () Unit!31953)

(assert (=> d!114921 (= lt!427237 lt!427240)))

(assert (=> d!114921 (= (getValueByKey!491 lt!427239 (_1!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141)))))))

(assert (=> d!114921 (= lt!427240 (lemmaContainsTupThenGetReturnValue!263 lt!427239 (_1!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141)))))))

(assert (=> d!114921 (= lt!427239 (insertStrictlySorted!320 (toList!6126 lt!427101) (_1!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))) (_2!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141)))))))

(assert (=> d!114921 (= (+!2856 lt!427101 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))) lt!427238)))

(declare-fun b!948759 () Bool)

(declare-fun res!636433 () Bool)

(assert (=> b!948759 (=> (not res!636433) (not e!534095))))

(assert (=> b!948759 (= res!636433 (= (getValueByKey!491 (toList!6126 lt!427238) (_1!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141)))) (Some!496 (_2!6773 (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))))))))

(declare-fun b!948760 () Bool)

(assert (=> b!948760 (= e!534095 (contains!5212 (toList!6126 lt!427238) (tuple2!13525 lt!427110 (minValue!5586 thiss!1141))))))

(assert (= (and d!114921 res!636434) b!948759))

(assert (= (and b!948759 res!636433) b!948760))

(declare-fun m!881507 () Bool)

(assert (=> d!114921 m!881507))

(declare-fun m!881509 () Bool)

(assert (=> d!114921 m!881509))

(declare-fun m!881511 () Bool)

(assert (=> d!114921 m!881511))

(declare-fun m!881513 () Bool)

(assert (=> d!114921 m!881513))

(declare-fun m!881515 () Bool)

(assert (=> b!948759 m!881515))

(declare-fun m!881517 () Bool)

(assert (=> b!948760 m!881517))

(assert (=> b!948522 d!114921))

(declare-fun d!114923 () Bool)

(assert (=> d!114923 (= (apply!872 (+!2856 lt!427112 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141))) lt!427099) (get!14507 (getValueByKey!491 (toList!6126 (+!2856 lt!427112 (tuple2!13525 lt!427109 (minValue!5586 thiss!1141)))) lt!427099)))))

(declare-fun bs!26667 () Bool)

(assert (= bs!26667 d!114923))

(declare-fun m!881519 () Bool)

(assert (=> bs!26667 m!881519))

(assert (=> bs!26667 m!881519))

(declare-fun m!881521 () Bool)

(assert (=> bs!26667 m!881521))

(assert (=> b!948522 d!114923))

(declare-fun d!114925 () Bool)

(assert (=> d!114925 (= (apply!872 lt!427113 lt!427102) (get!14507 (getValueByKey!491 (toList!6126 lt!427113) lt!427102)))))

(declare-fun bs!26668 () Bool)

(assert (= bs!26668 d!114925))

(declare-fun m!881523 () Bool)

(assert (=> bs!26668 m!881523))

(assert (=> bs!26668 m!881523))

(declare-fun m!881525 () Bool)

(assert (=> bs!26668 m!881525))

(assert (=> b!948522 d!114925))

(declare-fun d!114927 () Bool)

(assert (=> d!114927 (= (apply!872 (+!2856 lt!427113 (tuple2!13525 lt!427105 (zeroValue!5586 thiss!1141))) lt!427102) (apply!872 lt!427113 lt!427102))))

(declare-fun lt!427241 () Unit!31953)

(assert (=> d!114927 (= lt!427241 (choose!1577 lt!427113 lt!427105 (zeroValue!5586 thiss!1141) lt!427102))))

(declare-fun e!534096 () Bool)

(assert (=> d!114927 e!534096))

(declare-fun res!636435 () Bool)

(assert (=> d!114927 (=> (not res!636435) (not e!534096))))

(assert (=> d!114927 (= res!636435 (contains!5210 lt!427113 lt!427102))))

(assert (=> d!114927 (= (addApplyDifferent!455 lt!427113 lt!427105 (zeroValue!5586 thiss!1141) lt!427102) lt!427241)))

(declare-fun b!948761 () Bool)

(assert (=> b!948761 (= e!534096 (not (= lt!427102 lt!427105)))))

(assert (= (and d!114927 res!636435) b!948761))

(assert (=> d!114927 m!881265))

(assert (=> d!114927 m!881275))

(assert (=> d!114927 m!881285))

(declare-fun m!881527 () Bool)

(assert (=> d!114927 m!881527))

(declare-fun m!881529 () Bool)

(assert (=> d!114927 m!881529))

(assert (=> d!114927 m!881275))

(assert (=> b!948522 d!114927))

(declare-fun mapIsEmpty!32961 () Bool)

(declare-fun mapRes!32961 () Bool)

(assert (=> mapIsEmpty!32961 mapRes!32961))

(declare-fun condMapEmpty!32961 () Bool)

(declare-fun mapDefault!32961 () ValueCell!9873)

(assert (=> mapNonEmpty!32960 (= condMapEmpty!32961 (= mapRest!32960 ((as const (Array (_ BitVec 32) ValueCell!9873)) mapDefault!32961)))))

(declare-fun e!534097 () Bool)

(assert (=> mapNonEmpty!32960 (= tp!63187 (and e!534097 mapRes!32961))))

(declare-fun b!948763 () Bool)

(assert (=> b!948763 (= e!534097 tp_is_empty!20709)))

(declare-fun mapNonEmpty!32961 () Bool)

(declare-fun tp!63188 () Bool)

(declare-fun e!534098 () Bool)

(assert (=> mapNonEmpty!32961 (= mapRes!32961 (and tp!63188 e!534098))))

(declare-fun mapKey!32961 () (_ BitVec 32))

(declare-fun mapValue!32961 () ValueCell!9873)

(declare-fun mapRest!32961 () (Array (_ BitVec 32) ValueCell!9873))

(assert (=> mapNonEmpty!32961 (= mapRest!32960 (store mapRest!32961 mapKey!32961 mapValue!32961))))

(declare-fun b!948762 () Bool)

(assert (=> b!948762 (= e!534098 tp_is_empty!20709)))

(assert (= (and mapNonEmpty!32960 condMapEmpty!32961) mapIsEmpty!32961))

(assert (= (and mapNonEmpty!32960 (not condMapEmpty!32961)) mapNonEmpty!32961))

(assert (= (and mapNonEmpty!32961 ((_ is ValueCellFull!9873) mapValue!32961)) b!948762))

(assert (= (and mapNonEmpty!32960 ((_ is ValueCellFull!9873) mapDefault!32961)) b!948763))

(declare-fun m!881531 () Bool)

(assert (=> mapNonEmpty!32961 m!881531))

(declare-fun b_lambda!14327 () Bool)

(assert (= b_lambda!14323 (or (and b!948425 b_free!18201) b_lambda!14327)))

(declare-fun b_lambda!14329 () Bool)

(assert (= b_lambda!14325 (or (and b!948425 b_free!18201) b_lambda!14329)))

(check-sat (not d!114891) (not b!948754) (not bm!41223) (not d!114873) (not b!948755) (not d!114879) (not b!948713) (not d!114863) (not b!948741) tp_is_empty!20709 (not d!114895) (not b!948568) (not d!114877) (not b!948672) (not d!114925) (not b!948760) (not d!114911) (not d!114921) (not b!948571) (not mapNonEmpty!32961) b_and!29641 (not b!948605) (not b!948644) (not d!114867) (not d!114905) (not d!114907) (not b!948757) (not b!948759) (not b!948685) (not d!114923) (not d!114901) (not b!948686) (not d!114869) (not b!948588) (not d!114919) (not b!948612) (not b!948724) (not b_lambda!14321) (not b_lambda!14327) (not d!114857) (not b!948643) (not b!948749) (not b!948758) (not d!114913) (not b!948604) (not b!948743) (not b!948622) (not d!114917) (not d!114903) (not b!948639) (not d!114887) (not b!948583) (not b!948679) (not b_lambda!14329) (not b!948573) (not b!948611) (not b!948756) (not b!948742) (not b!948586) (not b!948673) (not d!114859) (not d!114883) (not b!948753) (not b!948670) (not d!114909) (not d!114915) (not d!114927) (not d!114875) (not d!114899) (not b!948751) (not bm!41226) (not bm!41229) (not bm!41220) (not b_next!18201) (not b!948676) (not b!948585) (not b!948675) (not b!948570) (not d!114881) (not b!948674) (not b!948594) (not b!948728) (not b!948677))
(check-sat b_and!29641 (not b_next!18201))
