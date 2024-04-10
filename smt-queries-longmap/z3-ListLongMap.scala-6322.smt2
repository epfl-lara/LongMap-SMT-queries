; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81298 () Bool)

(assert start!81298)

(declare-fun b!950932 () Bool)

(declare-fun b_free!18255 () Bool)

(declare-fun b_next!18255 () Bool)

(assert (=> b!950932 (= b_free!18255 (not b_next!18255))))

(declare-fun tp!63368 () Bool)

(declare-fun b_and!29719 () Bool)

(assert (=> b!950932 (= tp!63368 b_and!29719)))

(declare-fun b!950930 () Bool)

(declare-fun res!637418 () Bool)

(declare-fun e!535426 () Bool)

(assert (=> b!950930 (=> (not res!637418) (not e!535426))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!950930 (= res!637418 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!33063 () Bool)

(declare-fun mapRes!33063 () Bool)

(assert (=> mapIsEmpty!33063 mapRes!33063))

(declare-fun mapNonEmpty!33063 () Bool)

(declare-fun tp!63367 () Bool)

(declare-fun e!535425 () Bool)

(assert (=> mapNonEmpty!33063 (= mapRes!33063 (and tp!63367 e!535425))))

(declare-datatypes ((V!32649 0))(
  ( (V!32650 (val!10432 Int)) )
))
(declare-datatypes ((ValueCell!9900 0))(
  ( (ValueCellFull!9900 (v!12977 V!32649)) (EmptyCell!9900) )
))
(declare-fun mapValue!33063 () ValueCell!9900)

(declare-datatypes ((array!57548 0))(
  ( (array!57549 (arr!27672 (Array (_ BitVec 32) ValueCell!9900)) (size!28150 (_ BitVec 32))) )
))
(declare-datatypes ((array!57550 0))(
  ( (array!57551 (arr!27673 (Array (_ BitVec 32) (_ BitVec 64))) (size!28151 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4950 0))(
  ( (LongMapFixedSize!4951 (defaultEntry!5792 Int) (mask!27604 (_ BitVec 32)) (extraKeys!5524 (_ BitVec 32)) (zeroValue!5628 V!32649) (minValue!5628 V!32649) (_size!2530 (_ BitVec 32)) (_keys!10733 array!57550) (_values!5815 array!57548) (_vacant!2530 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4950)

(declare-fun mapKey!33063 () (_ BitVec 32))

(declare-fun mapRest!33063 () (Array (_ BitVec 32) ValueCell!9900))

(assert (=> mapNonEmpty!33063 (= (arr!27672 (_values!5815 thiss!1141)) (store mapRest!33063 mapKey!33063 mapValue!33063))))

(declare-fun b!950931 () Bool)

(declare-fun res!637416 () Bool)

(assert (=> b!950931 (=> (not res!637416) (not e!535426))))

(declare-datatypes ((tuple2!13558 0))(
  ( (tuple2!13559 (_1!6790 (_ BitVec 64)) (_2!6790 V!32649)) )
))
(declare-datatypes ((List!19346 0))(
  ( (Nil!19343) (Cons!19342 (h!20503 tuple2!13558) (t!27689 List!19346)) )
))
(declare-datatypes ((ListLongMap!12255 0))(
  ( (ListLongMap!12256 (toList!6143 List!19346)) )
))
(declare-fun contains!5236 (ListLongMap!12255 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3376 (array!57550 array!57548 (_ BitVec 32) (_ BitVec 32) V!32649 V!32649 (_ BitVec 32) Int) ListLongMap!12255)

(assert (=> b!950931 (= res!637416 (contains!5236 (getCurrentListMap!3376 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)) key!756))))

(declare-fun e!535429 () Bool)

(declare-fun tp_is_empty!20763 () Bool)

(declare-fun e!535430 () Bool)

(declare-fun array_inv!21480 (array!57550) Bool)

(declare-fun array_inv!21481 (array!57548) Bool)

(assert (=> b!950932 (= e!535430 (and tp!63368 tp_is_empty!20763 (array_inv!21480 (_keys!10733 thiss!1141)) (array_inv!21481 (_values!5815 thiss!1141)) e!535429))))

(declare-fun b!950933 () Bool)

(declare-fun e!535424 () Bool)

(assert (=> b!950933 (= e!535424 tp_is_empty!20763)))

(declare-fun b!950934 () Bool)

(assert (=> b!950934 (= e!535425 tp_is_empty!20763)))

(declare-fun b!950935 () Bool)

(declare-fun e!535427 () Bool)

(assert (=> b!950935 (= e!535426 (not e!535427))))

(declare-fun res!637414 () Bool)

(assert (=> b!950935 (=> res!637414 e!535427)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!950935 (= res!637414 (not (validMask!0 (mask!27604 thiss!1141))))))

(declare-fun lt!428288 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57550 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950935 (= lt!428288 (arrayScanForKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!950935 (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!32003 0))(
  ( (Unit!32004) )
))
(declare-fun lt!428289 () Unit!32003)

(declare-fun lemmaKeyInListMapIsInArray!322 (array!57550 array!57548 (_ BitVec 32) (_ BitVec 32) V!32649 V!32649 (_ BitVec 64) Int) Unit!32003)

(assert (=> b!950935 (= lt!428289 (lemmaKeyInListMapIsInArray!322 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) key!756 (defaultEntry!5792 thiss!1141)))))

(declare-fun b!950929 () Bool)

(assert (=> b!950929 (= e!535427 (or (not (= (size!28151 (_keys!10733 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27604 thiss!1141)))) (bvsle #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141)))))))

(declare-fun res!637415 () Bool)

(assert (=> start!81298 (=> (not res!637415) (not e!535426))))

(declare-fun valid!1882 (LongMapFixedSize!4950) Bool)

(assert (=> start!81298 (= res!637415 (valid!1882 thiss!1141))))

(assert (=> start!81298 e!535426))

(assert (=> start!81298 e!535430))

(assert (=> start!81298 true))

(declare-fun b!950936 () Bool)

(assert (=> b!950936 (= e!535429 (and e!535424 mapRes!33063))))

(declare-fun condMapEmpty!33063 () Bool)

(declare-fun mapDefault!33063 () ValueCell!9900)

(assert (=> b!950936 (= condMapEmpty!33063 (= (arr!27672 (_values!5815 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9900)) mapDefault!33063)))))

(declare-fun b!950937 () Bool)

(declare-fun res!637417 () Bool)

(assert (=> b!950937 (=> (not res!637417) (not e!535426))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9147 0))(
  ( (MissingZero!9147 (index!38959 (_ BitVec 32))) (Found!9147 (index!38960 (_ BitVec 32))) (Intermediate!9147 (undefined!9959 Bool) (index!38961 (_ BitVec 32)) (x!81809 (_ BitVec 32))) (Undefined!9147) (MissingVacant!9147 (index!38962 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57550 (_ BitVec 32)) SeekEntryResult!9147)

(assert (=> b!950937 (= res!637417 (not ((_ is Found!9147) (seekEntry!0 key!756 (_keys!10733 thiss!1141) (mask!27604 thiss!1141)))))))

(assert (= (and start!81298 res!637415) b!950930))

(assert (= (and b!950930 res!637418) b!950937))

(assert (= (and b!950937 res!637417) b!950931))

(assert (= (and b!950931 res!637416) b!950935))

(assert (= (and b!950935 (not res!637414)) b!950929))

(assert (= (and b!950936 condMapEmpty!33063) mapIsEmpty!33063))

(assert (= (and b!950936 (not condMapEmpty!33063)) mapNonEmpty!33063))

(assert (= (and mapNonEmpty!33063 ((_ is ValueCellFull!9900) mapValue!33063)) b!950934))

(assert (= (and b!950936 ((_ is ValueCellFull!9900) mapDefault!33063)) b!950933))

(assert (= b!950932 b!950936))

(assert (= start!81298 b!950932))

(declare-fun m!883299 () Bool)

(assert (=> b!950935 m!883299))

(declare-fun m!883301 () Bool)

(assert (=> b!950935 m!883301))

(declare-fun m!883303 () Bool)

(assert (=> b!950935 m!883303))

(declare-fun m!883305 () Bool)

(assert (=> b!950935 m!883305))

(declare-fun m!883307 () Bool)

(assert (=> start!81298 m!883307))

(declare-fun m!883309 () Bool)

(assert (=> mapNonEmpty!33063 m!883309))

(declare-fun m!883311 () Bool)

(assert (=> b!950931 m!883311))

(assert (=> b!950931 m!883311))

(declare-fun m!883313 () Bool)

(assert (=> b!950931 m!883313))

(declare-fun m!883315 () Bool)

(assert (=> b!950932 m!883315))

(declare-fun m!883317 () Bool)

(assert (=> b!950932 m!883317))

(declare-fun m!883319 () Bool)

(assert (=> b!950937 m!883319))

(check-sat (not b!950931) b_and!29719 (not b!950935) (not b!950937) tp_is_empty!20763 (not start!81298) (not mapNonEmpty!33063) (not b!950932) (not b_next!18255))
(check-sat b_and!29719 (not b_next!18255))
(get-model)

(declare-fun d!115291 () Bool)

(assert (=> d!115291 (= (array_inv!21480 (_keys!10733 thiss!1141)) (bvsge (size!28151 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950932 d!115291))

(declare-fun d!115293 () Bool)

(assert (=> d!115293 (= (array_inv!21481 (_values!5815 thiss!1141)) (bvsge (size!28150 (_values!5815 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!950932 d!115293))

(declare-fun d!115295 () Bool)

(declare-fun res!637440 () Bool)

(declare-fun e!535454 () Bool)

(assert (=> d!115295 (=> (not res!637440) (not e!535454))))

(declare-fun simpleValid!376 (LongMapFixedSize!4950) Bool)

(assert (=> d!115295 (= res!637440 (simpleValid!376 thiss!1141))))

(assert (=> d!115295 (= (valid!1882 thiss!1141) e!535454)))

(declare-fun b!950971 () Bool)

(declare-fun res!637441 () Bool)

(assert (=> b!950971 (=> (not res!637441) (not e!535454))))

(declare-fun arrayCountValidKeys!0 (array!57550 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!950971 (= res!637441 (= (arrayCountValidKeys!0 (_keys!10733 thiss!1141) #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))) (_size!2530 thiss!1141)))))

(declare-fun b!950972 () Bool)

(declare-fun res!637442 () Bool)

(assert (=> b!950972 (=> (not res!637442) (not e!535454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57550 (_ BitVec 32)) Bool)

(assert (=> b!950972 (= res!637442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10733 thiss!1141) (mask!27604 thiss!1141)))))

(declare-fun b!950973 () Bool)

(declare-datatypes ((List!19347 0))(
  ( (Nil!19344) (Cons!19343 (h!20504 (_ BitVec 64)) (t!27692 List!19347)) )
))
(declare-fun arrayNoDuplicates!0 (array!57550 (_ BitVec 32) List!19347) Bool)

(assert (=> b!950973 (= e!535454 (arrayNoDuplicates!0 (_keys!10733 thiss!1141) #b00000000000000000000000000000000 Nil!19344))))

(assert (= (and d!115295 res!637440) b!950971))

(assert (= (and b!950971 res!637441) b!950972))

(assert (= (and b!950972 res!637442) b!950973))

(declare-fun m!883343 () Bool)

(assert (=> d!115295 m!883343))

(declare-fun m!883345 () Bool)

(assert (=> b!950971 m!883345))

(declare-fun m!883347 () Bool)

(assert (=> b!950972 m!883347))

(declare-fun m!883349 () Bool)

(assert (=> b!950973 m!883349))

(assert (=> start!81298 d!115295))

(declare-fun d!115297 () Bool)

(declare-fun lt!428307 () SeekEntryResult!9147)

(assert (=> d!115297 (and (or ((_ is MissingVacant!9147) lt!428307) (not ((_ is Found!9147) lt!428307)) (and (bvsge (index!38960 lt!428307) #b00000000000000000000000000000000) (bvslt (index!38960 lt!428307) (size!28151 (_keys!10733 thiss!1141))))) (not ((_ is MissingVacant!9147) lt!428307)) (or (not ((_ is Found!9147) lt!428307)) (= (select (arr!27673 (_keys!10733 thiss!1141)) (index!38960 lt!428307)) key!756)))))

(declare-fun e!535463 () SeekEntryResult!9147)

(assert (=> d!115297 (= lt!428307 e!535463)))

(declare-fun c!99355 () Bool)

(declare-fun lt!428305 () SeekEntryResult!9147)

(assert (=> d!115297 (= c!99355 (and ((_ is Intermediate!9147) lt!428305) (undefined!9959 lt!428305)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57550 (_ BitVec 32)) SeekEntryResult!9147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115297 (= lt!428305 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27604 thiss!1141)) key!756 (_keys!10733 thiss!1141) (mask!27604 thiss!1141)))))

(assert (=> d!115297 (validMask!0 (mask!27604 thiss!1141))))

(assert (=> d!115297 (= (seekEntry!0 key!756 (_keys!10733 thiss!1141) (mask!27604 thiss!1141)) lt!428307)))

(declare-fun b!950986 () Bool)

(declare-fun e!535461 () SeekEntryResult!9147)

(assert (=> b!950986 (= e!535461 (MissingZero!9147 (index!38961 lt!428305)))))

(declare-fun b!950987 () Bool)

(declare-fun e!535462 () SeekEntryResult!9147)

(assert (=> b!950987 (= e!535463 e!535462)))

(declare-fun lt!428304 () (_ BitVec 64))

(assert (=> b!950987 (= lt!428304 (select (arr!27673 (_keys!10733 thiss!1141)) (index!38961 lt!428305)))))

(declare-fun c!99357 () Bool)

(assert (=> b!950987 (= c!99357 (= lt!428304 key!756))))

(declare-fun b!950988 () Bool)

(assert (=> b!950988 (= e!535462 (Found!9147 (index!38961 lt!428305)))))

(declare-fun b!950989 () Bool)

(assert (=> b!950989 (= e!535463 Undefined!9147)))

(declare-fun b!950990 () Bool)

(declare-fun c!99356 () Bool)

(assert (=> b!950990 (= c!99356 (= lt!428304 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!950990 (= e!535462 e!535461)))

(declare-fun b!950991 () Bool)

(declare-fun lt!428306 () SeekEntryResult!9147)

(assert (=> b!950991 (= e!535461 (ite ((_ is MissingVacant!9147) lt!428306) (MissingZero!9147 (index!38962 lt!428306)) lt!428306))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57550 (_ BitVec 32)) SeekEntryResult!9147)

(assert (=> b!950991 (= lt!428306 (seekKeyOrZeroReturnVacant!0 (x!81809 lt!428305) (index!38961 lt!428305) (index!38961 lt!428305) key!756 (_keys!10733 thiss!1141) (mask!27604 thiss!1141)))))

(assert (= (and d!115297 c!99355) b!950989))

(assert (= (and d!115297 (not c!99355)) b!950987))

(assert (= (and b!950987 c!99357) b!950988))

(assert (= (and b!950987 (not c!99357)) b!950990))

(assert (= (and b!950990 c!99356) b!950986))

(assert (= (and b!950990 (not c!99356)) b!950991))

(declare-fun m!883351 () Bool)

(assert (=> d!115297 m!883351))

(declare-fun m!883353 () Bool)

(assert (=> d!115297 m!883353))

(assert (=> d!115297 m!883353))

(declare-fun m!883355 () Bool)

(assert (=> d!115297 m!883355))

(assert (=> d!115297 m!883299))

(declare-fun m!883357 () Bool)

(assert (=> b!950987 m!883357))

(declare-fun m!883359 () Bool)

(assert (=> b!950991 m!883359))

(assert (=> b!950937 d!115297))

(declare-fun d!115299 () Bool)

(declare-fun e!535468 () Bool)

(assert (=> d!115299 e!535468))

(declare-fun res!637445 () Bool)

(assert (=> d!115299 (=> res!637445 e!535468)))

(declare-fun lt!428316 () Bool)

(assert (=> d!115299 (= res!637445 (not lt!428316))))

(declare-fun lt!428319 () Bool)

(assert (=> d!115299 (= lt!428316 lt!428319)))

(declare-fun lt!428318 () Unit!32003)

(declare-fun e!535469 () Unit!32003)

(assert (=> d!115299 (= lt!428318 e!535469)))

(declare-fun c!99360 () Bool)

(assert (=> d!115299 (= c!99360 lt!428319)))

(declare-fun containsKey!466 (List!19346 (_ BitVec 64)) Bool)

(assert (=> d!115299 (= lt!428319 (containsKey!466 (toList!6143 (getCurrentListMap!3376 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141))) key!756))))

(assert (=> d!115299 (= (contains!5236 (getCurrentListMap!3376 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)) key!756) lt!428316)))

(declare-fun b!950998 () Bool)

(declare-fun lt!428317 () Unit!32003)

(assert (=> b!950998 (= e!535469 lt!428317)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!362 (List!19346 (_ BitVec 64)) Unit!32003)

(assert (=> b!950998 (= lt!428317 (lemmaContainsKeyImpliesGetValueByKeyDefined!362 (toList!6143 (getCurrentListMap!3376 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141))) key!756))))

(declare-datatypes ((Option!505 0))(
  ( (Some!504 (v!12979 V!32649)) (None!503) )
))
(declare-fun isDefined!371 (Option!505) Bool)

(declare-fun getValueByKey!499 (List!19346 (_ BitVec 64)) Option!505)

(assert (=> b!950998 (isDefined!371 (getValueByKey!499 (toList!6143 (getCurrentListMap!3376 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141))) key!756))))

(declare-fun b!950999 () Bool)

(declare-fun Unit!32005 () Unit!32003)

(assert (=> b!950999 (= e!535469 Unit!32005)))

(declare-fun b!951000 () Bool)

(assert (=> b!951000 (= e!535468 (isDefined!371 (getValueByKey!499 (toList!6143 (getCurrentListMap!3376 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141))) key!756)))))

(assert (= (and d!115299 c!99360) b!950998))

(assert (= (and d!115299 (not c!99360)) b!950999))

(assert (= (and d!115299 (not res!637445)) b!951000))

(declare-fun m!883361 () Bool)

(assert (=> d!115299 m!883361))

(declare-fun m!883363 () Bool)

(assert (=> b!950998 m!883363))

(declare-fun m!883365 () Bool)

(assert (=> b!950998 m!883365))

(assert (=> b!950998 m!883365))

(declare-fun m!883367 () Bool)

(assert (=> b!950998 m!883367))

(assert (=> b!951000 m!883365))

(assert (=> b!951000 m!883365))

(assert (=> b!951000 m!883367))

(assert (=> b!950931 d!115299))

(declare-fun b!951043 () Bool)

(declare-fun e!535498 () ListLongMap!12255)

(declare-fun e!535501 () ListLongMap!12255)

(assert (=> b!951043 (= e!535498 e!535501)))

(declare-fun c!99374 () Bool)

(assert (=> b!951043 (= c!99374 (and (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951044 () Bool)

(declare-fun e!535505 () ListLongMap!12255)

(declare-fun call!41439 () ListLongMap!12255)

(assert (=> b!951044 (= e!535505 call!41439)))

(declare-fun b!951045 () Bool)

(declare-fun e!535499 () Bool)

(declare-fun e!535503 () Bool)

(assert (=> b!951045 (= e!535499 e!535503)))

(declare-fun res!637469 () Bool)

(declare-fun call!41444 () Bool)

(assert (=> b!951045 (= res!637469 call!41444)))

(assert (=> b!951045 (=> (not res!637469) (not e!535503))))

(declare-fun b!951046 () Bool)

(declare-fun call!41443 () ListLongMap!12255)

(assert (=> b!951046 (= e!535501 call!41443)))

(declare-fun bm!41436 () Bool)

(declare-fun call!41440 () ListLongMap!12255)

(assert (=> bm!41436 (= call!41443 call!41440)))

(declare-fun b!951047 () Bool)

(declare-fun e!535508 () Unit!32003)

(declare-fun lt!428379 () Unit!32003)

(assert (=> b!951047 (= e!535508 lt!428379)))

(declare-fun lt!428375 () ListLongMap!12255)

(declare-fun getCurrentListMapNoExtraKeys!3319 (array!57550 array!57548 (_ BitVec 32) (_ BitVec 32) V!32649 V!32649 (_ BitVec 32) Int) ListLongMap!12255)

(assert (=> b!951047 (= lt!428375 (getCurrentListMapNoExtraKeys!3319 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)))))

(declare-fun lt!428368 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428368 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428370 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428370 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428382 () Unit!32003)

(declare-fun addStillContains!583 (ListLongMap!12255 (_ BitVec 64) V!32649 (_ BitVec 64)) Unit!32003)

(assert (=> b!951047 (= lt!428382 (addStillContains!583 lt!428375 lt!428368 (zeroValue!5628 thiss!1141) lt!428370))))

(declare-fun +!2864 (ListLongMap!12255 tuple2!13558) ListLongMap!12255)

(assert (=> b!951047 (contains!5236 (+!2864 lt!428375 (tuple2!13559 lt!428368 (zeroValue!5628 thiss!1141))) lt!428370)))

(declare-fun lt!428377 () Unit!32003)

(assert (=> b!951047 (= lt!428377 lt!428382)))

(declare-fun lt!428372 () ListLongMap!12255)

(assert (=> b!951047 (= lt!428372 (getCurrentListMapNoExtraKeys!3319 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)))))

(declare-fun lt!428373 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428373 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428376 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428376 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428365 () Unit!32003)

(declare-fun addApplyDifferent!463 (ListLongMap!12255 (_ BitVec 64) V!32649 (_ BitVec 64)) Unit!32003)

(assert (=> b!951047 (= lt!428365 (addApplyDifferent!463 lt!428372 lt!428373 (minValue!5628 thiss!1141) lt!428376))))

(declare-fun apply!880 (ListLongMap!12255 (_ BitVec 64)) V!32649)

(assert (=> b!951047 (= (apply!880 (+!2864 lt!428372 (tuple2!13559 lt!428373 (minValue!5628 thiss!1141))) lt!428376) (apply!880 lt!428372 lt!428376))))

(declare-fun lt!428383 () Unit!32003)

(assert (=> b!951047 (= lt!428383 lt!428365)))

(declare-fun lt!428374 () ListLongMap!12255)

(assert (=> b!951047 (= lt!428374 (getCurrentListMapNoExtraKeys!3319 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)))))

(declare-fun lt!428364 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428364 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428369 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428369 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428378 () Unit!32003)

(assert (=> b!951047 (= lt!428378 (addApplyDifferent!463 lt!428374 lt!428364 (zeroValue!5628 thiss!1141) lt!428369))))

(assert (=> b!951047 (= (apply!880 (+!2864 lt!428374 (tuple2!13559 lt!428364 (zeroValue!5628 thiss!1141))) lt!428369) (apply!880 lt!428374 lt!428369))))

(declare-fun lt!428366 () Unit!32003)

(assert (=> b!951047 (= lt!428366 lt!428378)))

(declare-fun lt!428381 () ListLongMap!12255)

(assert (=> b!951047 (= lt!428381 (getCurrentListMapNoExtraKeys!3319 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)))))

(declare-fun lt!428384 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428384 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428385 () (_ BitVec 64))

(assert (=> b!951047 (= lt!428385 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951047 (= lt!428379 (addApplyDifferent!463 lt!428381 lt!428384 (minValue!5628 thiss!1141) lt!428385))))

(assert (=> b!951047 (= (apply!880 (+!2864 lt!428381 (tuple2!13559 lt!428384 (minValue!5628 thiss!1141))) lt!428385) (apply!880 lt!428381 lt!428385))))

(declare-fun b!951048 () Bool)

(declare-fun e!535497 () Bool)

(declare-fun e!535496 () Bool)

(assert (=> b!951048 (= e!535497 e!535496)))

(declare-fun res!637464 () Bool)

(declare-fun call!41442 () Bool)

(assert (=> b!951048 (= res!637464 call!41442)))

(assert (=> b!951048 (=> (not res!637464) (not e!535496))))

(declare-fun bm!41437 () Bool)

(declare-fun call!41441 () ListLongMap!12255)

(declare-fun call!41445 () ListLongMap!12255)

(declare-fun c!99375 () Bool)

(assert (=> bm!41437 (= call!41440 (+!2864 (ite c!99375 call!41445 (ite c!99374 call!41441 call!41439)) (ite (or c!99375 c!99374) (tuple2!13559 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5628 thiss!1141)) (tuple2!13559 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5628 thiss!1141)))))))

(declare-fun b!951049 () Bool)

(assert (=> b!951049 (= e!535497 (not call!41442))))

(declare-fun b!951050 () Bool)

(declare-fun e!535507 () Bool)

(assert (=> b!951050 (= e!535507 e!535499)))

(declare-fun c!99373 () Bool)

(assert (=> b!951050 (= c!99373 (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951051 () Bool)

(declare-fun lt!428367 () ListLongMap!12255)

(assert (=> b!951051 (= e!535496 (= (apply!880 lt!428367 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5628 thiss!1141)))))

(declare-fun b!951052 () Bool)

(declare-fun e!535504 () Bool)

(declare-fun e!535506 () Bool)

(assert (=> b!951052 (= e!535504 e!535506)))

(declare-fun res!637466 () Bool)

(assert (=> b!951052 (=> (not res!637466) (not e!535506))))

(assert (=> b!951052 (= res!637466 (contains!5236 lt!428367 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951052 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))))))

(declare-fun b!951053 () Bool)

(declare-fun c!99377 () Bool)

(assert (=> b!951053 (= c!99377 (and (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951053 (= e!535501 e!535505)))

(declare-fun b!951054 () Bool)

(assert (=> b!951054 (= e!535505 call!41443)))

(declare-fun bm!41438 () Bool)

(assert (=> bm!41438 (= call!41444 (contains!5236 lt!428367 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951055 () Bool)

(declare-fun e!535500 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951055 (= e!535500 (validKeyInArray!0 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!115301 () Bool)

(assert (=> d!115301 e!535507))

(declare-fun res!637468 () Bool)

(assert (=> d!115301 (=> (not res!637468) (not e!535507))))

(assert (=> d!115301 (= res!637468 (or (bvsge #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))))))))

(declare-fun lt!428380 () ListLongMap!12255)

(assert (=> d!115301 (= lt!428367 lt!428380)))

(declare-fun lt!428371 () Unit!32003)

(assert (=> d!115301 (= lt!428371 e!535508)))

(declare-fun c!99376 () Bool)

(declare-fun e!535502 () Bool)

(assert (=> d!115301 (= c!99376 e!535502)))

(declare-fun res!637465 () Bool)

(assert (=> d!115301 (=> (not res!637465) (not e!535502))))

(assert (=> d!115301 (= res!637465 (bvslt #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))))))

(assert (=> d!115301 (= lt!428380 e!535498)))

(assert (=> d!115301 (= c!99375 (and (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115301 (validMask!0 (mask!27604 thiss!1141))))

(assert (=> d!115301 (= (getCurrentListMap!3376 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)) lt!428367)))

(declare-fun bm!41439 () Bool)

(assert (=> bm!41439 (= call!41439 call!41441)))

(declare-fun b!951056 () Bool)

(assert (=> b!951056 (= e!535502 (validKeyInArray!0 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951057 () Bool)

(declare-fun get!14544 (ValueCell!9900 V!32649) V!32649)

(declare-fun dynLambda!1653 (Int (_ BitVec 64)) V!32649)

(assert (=> b!951057 (= e!535506 (= (apply!880 lt!428367 (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000)) (get!14544 (select (arr!27672 (_values!5815 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1653 (defaultEntry!5792 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28150 (_values!5815 thiss!1141))))))

(assert (=> b!951057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))))))

(declare-fun bm!41440 () Bool)

(assert (=> bm!41440 (= call!41442 (contains!5236 lt!428367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951058 () Bool)

(assert (=> b!951058 (= e!535503 (= (apply!880 lt!428367 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5628 thiss!1141)))))

(declare-fun b!951059 () Bool)

(declare-fun Unit!32006 () Unit!32003)

(assert (=> b!951059 (= e!535508 Unit!32006)))

(declare-fun b!951060 () Bool)

(declare-fun res!637472 () Bool)

(assert (=> b!951060 (=> (not res!637472) (not e!535507))))

(assert (=> b!951060 (= res!637472 e!535504)))

(declare-fun res!637470 () Bool)

(assert (=> b!951060 (=> res!637470 e!535504)))

(assert (=> b!951060 (= res!637470 (not e!535500))))

(declare-fun res!637471 () Bool)

(assert (=> b!951060 (=> (not res!637471) (not e!535500))))

(assert (=> b!951060 (= res!637471 (bvslt #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))))))

(declare-fun bm!41441 () Bool)

(assert (=> bm!41441 (= call!41445 (getCurrentListMapNoExtraKeys!3319 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5792 thiss!1141)))))

(declare-fun b!951061 () Bool)

(assert (=> b!951061 (= e!535498 (+!2864 call!41440 (tuple2!13559 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5628 thiss!1141))))))

(declare-fun b!951062 () Bool)

(assert (=> b!951062 (= e!535499 (not call!41444))))

(declare-fun b!951063 () Bool)

(declare-fun res!637467 () Bool)

(assert (=> b!951063 (=> (not res!637467) (not e!535507))))

(assert (=> b!951063 (= res!637467 e!535497)))

(declare-fun c!99378 () Bool)

(assert (=> b!951063 (= c!99378 (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41442 () Bool)

(assert (=> bm!41442 (= call!41441 call!41445)))

(assert (= (and d!115301 c!99375) b!951061))

(assert (= (and d!115301 (not c!99375)) b!951043))

(assert (= (and b!951043 c!99374) b!951046))

(assert (= (and b!951043 (not c!99374)) b!951053))

(assert (= (and b!951053 c!99377) b!951054))

(assert (= (and b!951053 (not c!99377)) b!951044))

(assert (= (or b!951054 b!951044) bm!41439))

(assert (= (or b!951046 bm!41439) bm!41442))

(assert (= (or b!951046 b!951054) bm!41436))

(assert (= (or b!951061 bm!41442) bm!41441))

(assert (= (or b!951061 bm!41436) bm!41437))

(assert (= (and d!115301 res!637465) b!951056))

(assert (= (and d!115301 c!99376) b!951047))

(assert (= (and d!115301 (not c!99376)) b!951059))

(assert (= (and d!115301 res!637468) b!951060))

(assert (= (and b!951060 res!637471) b!951055))

(assert (= (and b!951060 (not res!637470)) b!951052))

(assert (= (and b!951052 res!637466) b!951057))

(assert (= (and b!951060 res!637472) b!951063))

(assert (= (and b!951063 c!99378) b!951048))

(assert (= (and b!951063 (not c!99378)) b!951049))

(assert (= (and b!951048 res!637464) b!951051))

(assert (= (or b!951048 b!951049) bm!41440))

(assert (= (and b!951063 res!637467) b!951050))

(assert (= (and b!951050 c!99373) b!951045))

(assert (= (and b!951050 (not c!99373)) b!951062))

(assert (= (and b!951045 res!637469) b!951058))

(assert (= (or b!951045 b!951062) bm!41438))

(declare-fun b_lambda!14383 () Bool)

(assert (=> (not b_lambda!14383) (not b!951057)))

(declare-fun t!27691 () Bool)

(declare-fun tb!6195 () Bool)

(assert (=> (and b!950932 (= (defaultEntry!5792 thiss!1141) (defaultEntry!5792 thiss!1141)) t!27691) tb!6195))

(declare-fun result!12307 () Bool)

(assert (=> tb!6195 (= result!12307 tp_is_empty!20763)))

(assert (=> b!951057 t!27691))

(declare-fun b_and!29723 () Bool)

(assert (= b_and!29719 (and (=> t!27691 result!12307) b_and!29723)))

(declare-fun m!883369 () Bool)

(assert (=> b!951047 m!883369))

(declare-fun m!883371 () Bool)

(assert (=> b!951047 m!883371))

(declare-fun m!883373 () Bool)

(assert (=> b!951047 m!883373))

(declare-fun m!883375 () Bool)

(assert (=> b!951047 m!883375))

(declare-fun m!883377 () Bool)

(assert (=> b!951047 m!883377))

(assert (=> b!951047 m!883369))

(declare-fun m!883379 () Bool)

(assert (=> b!951047 m!883379))

(declare-fun m!883381 () Bool)

(assert (=> b!951047 m!883381))

(declare-fun m!883383 () Bool)

(assert (=> b!951047 m!883383))

(declare-fun m!883385 () Bool)

(assert (=> b!951047 m!883385))

(declare-fun m!883387 () Bool)

(assert (=> b!951047 m!883387))

(declare-fun m!883389 () Bool)

(assert (=> b!951047 m!883389))

(declare-fun m!883391 () Bool)

(assert (=> b!951047 m!883391))

(declare-fun m!883393 () Bool)

(assert (=> b!951047 m!883393))

(declare-fun m!883395 () Bool)

(assert (=> b!951047 m!883395))

(assert (=> b!951047 m!883387))

(assert (=> b!951047 m!883375))

(declare-fun m!883397 () Bool)

(assert (=> b!951047 m!883397))

(assert (=> b!951047 m!883391))

(declare-fun m!883399 () Bool)

(assert (=> b!951047 m!883399))

(declare-fun m!883401 () Bool)

(assert (=> b!951047 m!883401))

(declare-fun m!883403 () Bool)

(assert (=> b!951058 m!883403))

(declare-fun m!883405 () Bool)

(assert (=> bm!41437 m!883405))

(assert (=> b!951056 m!883381))

(assert (=> b!951056 m!883381))

(declare-fun m!883407 () Bool)

(assert (=> b!951056 m!883407))

(declare-fun m!883409 () Bool)

(assert (=> bm!41440 m!883409))

(declare-fun m!883411 () Bool)

(assert (=> b!951061 m!883411))

(assert (=> d!115301 m!883299))

(declare-fun m!883413 () Bool)

(assert (=> b!951057 m!883413))

(assert (=> b!951057 m!883413))

(declare-fun m!883415 () Bool)

(assert (=> b!951057 m!883415))

(declare-fun m!883417 () Bool)

(assert (=> b!951057 m!883417))

(assert (=> b!951057 m!883381))

(assert (=> b!951057 m!883415))

(assert (=> b!951057 m!883381))

(declare-fun m!883419 () Bool)

(assert (=> b!951057 m!883419))

(declare-fun m!883421 () Bool)

(assert (=> bm!41438 m!883421))

(assert (=> b!951055 m!883381))

(assert (=> b!951055 m!883381))

(assert (=> b!951055 m!883407))

(assert (=> b!951052 m!883381))

(assert (=> b!951052 m!883381))

(declare-fun m!883423 () Bool)

(assert (=> b!951052 m!883423))

(assert (=> bm!41441 m!883383))

(declare-fun m!883425 () Bool)

(assert (=> b!951051 m!883425))

(assert (=> b!950931 d!115301))

(declare-fun d!115303 () Bool)

(assert (=> d!115303 (= (validMask!0 (mask!27604 thiss!1141)) (and (or (= (mask!27604 thiss!1141) #b00000000000000000000000000000111) (= (mask!27604 thiss!1141) #b00000000000000000000000000001111) (= (mask!27604 thiss!1141) #b00000000000000000000000000011111) (= (mask!27604 thiss!1141) #b00000000000000000000000000111111) (= (mask!27604 thiss!1141) #b00000000000000000000000001111111) (= (mask!27604 thiss!1141) #b00000000000000000000000011111111) (= (mask!27604 thiss!1141) #b00000000000000000000000111111111) (= (mask!27604 thiss!1141) #b00000000000000000000001111111111) (= (mask!27604 thiss!1141) #b00000000000000000000011111111111) (= (mask!27604 thiss!1141) #b00000000000000000000111111111111) (= (mask!27604 thiss!1141) #b00000000000000000001111111111111) (= (mask!27604 thiss!1141) #b00000000000000000011111111111111) (= (mask!27604 thiss!1141) #b00000000000000000111111111111111) (= (mask!27604 thiss!1141) #b00000000000000001111111111111111) (= (mask!27604 thiss!1141) #b00000000000000011111111111111111) (= (mask!27604 thiss!1141) #b00000000000000111111111111111111) (= (mask!27604 thiss!1141) #b00000000000001111111111111111111) (= (mask!27604 thiss!1141) #b00000000000011111111111111111111) (= (mask!27604 thiss!1141) #b00000000000111111111111111111111) (= (mask!27604 thiss!1141) #b00000000001111111111111111111111) (= (mask!27604 thiss!1141) #b00000000011111111111111111111111) (= (mask!27604 thiss!1141) #b00000000111111111111111111111111) (= (mask!27604 thiss!1141) #b00000001111111111111111111111111) (= (mask!27604 thiss!1141) #b00000011111111111111111111111111) (= (mask!27604 thiss!1141) #b00000111111111111111111111111111) (= (mask!27604 thiss!1141) #b00001111111111111111111111111111) (= (mask!27604 thiss!1141) #b00011111111111111111111111111111) (= (mask!27604 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27604 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!950935 d!115303))

(declare-fun d!115305 () Bool)

(declare-fun lt!428388 () (_ BitVec 32))

(assert (=> d!115305 (and (or (bvslt lt!428388 #b00000000000000000000000000000000) (bvsge lt!428388 (size!28151 (_keys!10733 thiss!1141))) (and (bvsge lt!428388 #b00000000000000000000000000000000) (bvslt lt!428388 (size!28151 (_keys!10733 thiss!1141))))) (bvsge lt!428388 #b00000000000000000000000000000000) (bvslt lt!428388 (size!28151 (_keys!10733 thiss!1141))) (= (select (arr!27673 (_keys!10733 thiss!1141)) lt!428388) key!756))))

(declare-fun e!535511 () (_ BitVec 32))

(assert (=> d!115305 (= lt!428388 e!535511)))

(declare-fun c!99381 () Bool)

(assert (=> d!115305 (= c!99381 (= (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115305 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28151 (_keys!10733 thiss!1141))) (bvslt (size!28151 (_keys!10733 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115305 (= (arrayScanForKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428388)))

(declare-fun b!951070 () Bool)

(assert (=> b!951070 (= e!535511 #b00000000000000000000000000000000)))

(declare-fun b!951071 () Bool)

(assert (=> b!951071 (= e!535511 (arrayScanForKey!0 (_keys!10733 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115305 c!99381) b!951070))

(assert (= (and d!115305 (not c!99381)) b!951071))

(declare-fun m!883427 () Bool)

(assert (=> d!115305 m!883427))

(assert (=> d!115305 m!883381))

(declare-fun m!883429 () Bool)

(assert (=> b!951071 m!883429))

(assert (=> b!950935 d!115305))

(declare-fun d!115307 () Bool)

(declare-fun res!637477 () Bool)

(declare-fun e!535516 () Bool)

(assert (=> d!115307 (=> res!637477 e!535516)))

(assert (=> d!115307 (= res!637477 (= (select (arr!27673 (_keys!10733 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115307 (= (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000) e!535516)))

(declare-fun b!951076 () Bool)

(declare-fun e!535517 () Bool)

(assert (=> b!951076 (= e!535516 e!535517)))

(declare-fun res!637478 () Bool)

(assert (=> b!951076 (=> (not res!637478) (not e!535517))))

(assert (=> b!951076 (= res!637478 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28151 (_keys!10733 thiss!1141))))))

(declare-fun b!951077 () Bool)

(assert (=> b!951077 (= e!535517 (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115307 (not res!637477)) b!951076))

(assert (= (and b!951076 res!637478) b!951077))

(assert (=> d!115307 m!883381))

(declare-fun m!883431 () Bool)

(assert (=> b!951077 m!883431))

(assert (=> b!950935 d!115307))

(declare-fun d!115309 () Bool)

(declare-fun e!535520 () Bool)

(assert (=> d!115309 e!535520))

(declare-fun c!99384 () Bool)

(assert (=> d!115309 (= c!99384 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428391 () Unit!32003)

(declare-fun choose!1589 (array!57550 array!57548 (_ BitVec 32) (_ BitVec 32) V!32649 V!32649 (_ BitVec 64) Int) Unit!32003)

(assert (=> d!115309 (= lt!428391 (choose!1589 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) key!756 (defaultEntry!5792 thiss!1141)))))

(assert (=> d!115309 (validMask!0 (mask!27604 thiss!1141))))

(assert (=> d!115309 (= (lemmaKeyInListMapIsInArray!322 (_keys!10733 thiss!1141) (_values!5815 thiss!1141) (mask!27604 thiss!1141) (extraKeys!5524 thiss!1141) (zeroValue!5628 thiss!1141) (minValue!5628 thiss!1141) key!756 (defaultEntry!5792 thiss!1141)) lt!428391)))

(declare-fun b!951082 () Bool)

(assert (=> b!951082 (= e!535520 (arrayContainsKey!0 (_keys!10733 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951083 () Bool)

(assert (=> b!951083 (= e!535520 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5524 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115309 c!99384) b!951082))

(assert (= (and d!115309 (not c!99384)) b!951083))

(declare-fun m!883433 () Bool)

(assert (=> d!115309 m!883433))

(assert (=> d!115309 m!883299))

(assert (=> b!951082 m!883303))

(assert (=> b!950935 d!115309))

(declare-fun condMapEmpty!33069 () Bool)

(declare-fun mapDefault!33069 () ValueCell!9900)

(assert (=> mapNonEmpty!33063 (= condMapEmpty!33069 (= mapRest!33063 ((as const (Array (_ BitVec 32) ValueCell!9900)) mapDefault!33069)))))

(declare-fun e!535526 () Bool)

(declare-fun mapRes!33069 () Bool)

(assert (=> mapNonEmpty!33063 (= tp!63367 (and e!535526 mapRes!33069))))

(declare-fun b!951090 () Bool)

(declare-fun e!535525 () Bool)

(assert (=> b!951090 (= e!535525 tp_is_empty!20763)))

(declare-fun b!951091 () Bool)

(assert (=> b!951091 (= e!535526 tp_is_empty!20763)))

(declare-fun mapIsEmpty!33069 () Bool)

(assert (=> mapIsEmpty!33069 mapRes!33069))

(declare-fun mapNonEmpty!33069 () Bool)

(declare-fun tp!63377 () Bool)

(assert (=> mapNonEmpty!33069 (= mapRes!33069 (and tp!63377 e!535525))))

(declare-fun mapRest!33069 () (Array (_ BitVec 32) ValueCell!9900))

(declare-fun mapValue!33069 () ValueCell!9900)

(declare-fun mapKey!33069 () (_ BitVec 32))

(assert (=> mapNonEmpty!33069 (= mapRest!33063 (store mapRest!33069 mapKey!33069 mapValue!33069))))

(assert (= (and mapNonEmpty!33063 condMapEmpty!33069) mapIsEmpty!33069))

(assert (= (and mapNonEmpty!33063 (not condMapEmpty!33069)) mapNonEmpty!33069))

(assert (= (and mapNonEmpty!33069 ((_ is ValueCellFull!9900) mapValue!33069)) b!951090))

(assert (= (and mapNonEmpty!33063 ((_ is ValueCellFull!9900) mapDefault!33069)) b!951091))

(declare-fun m!883435 () Bool)

(assert (=> mapNonEmpty!33069 m!883435))

(declare-fun b_lambda!14385 () Bool)

(assert (= b_lambda!14383 (or (and b!950932 b_free!18255) b_lambda!14385)))

(check-sat (not b!951055) (not d!115299) (not b!951058) (not b!950991) (not b!951000) (not b!951077) (not mapNonEmpty!33069) (not b!950998) tp_is_empty!20763 (not b!950971) (not b!951051) (not b!951061) (not b!950973) b_and!29723 (not b_next!18255) (not b_lambda!14385) (not bm!41441) (not bm!41438) (not d!115301) (not d!115309) (not d!115297) (not b!951071) (not b!951047) (not b!950972) (not b!951082) (not b!951056) (not bm!41437) (not bm!41440) (not b!951057) (not b!951052) (not d!115295))
(check-sat b_and!29723 (not b_next!18255))
