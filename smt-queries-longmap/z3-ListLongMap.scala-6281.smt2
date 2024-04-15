; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80290 () Bool)

(assert start!80290)

(declare-fun b!943260 () Bool)

(declare-fun b_free!18007 () Bool)

(declare-fun b_next!18007 () Bool)

(assert (=> b!943260 (= b_free!18007 (not b_next!18007))))

(declare-fun tp!62528 () Bool)

(declare-fun b_and!29393 () Bool)

(assert (=> b!943260 (= tp!62528 b_and!29393)))

(declare-fun b!943253 () Bool)

(declare-fun e!530325 () Bool)

(declare-fun e!530327 () Bool)

(declare-fun mapRes!32594 () Bool)

(assert (=> b!943253 (= e!530325 (and e!530327 mapRes!32594))))

(declare-fun condMapEmpty!32594 () Bool)

(declare-datatypes ((V!32319 0))(
  ( (V!32320 (val!10308 Int)) )
))
(declare-datatypes ((ValueCell!9776 0))(
  ( (ValueCellFull!9776 (v!12838 V!32319)) (EmptyCell!9776) )
))
(declare-datatypes ((array!56961 0))(
  ( (array!56962 (arr!27407 (Array (_ BitVec 32) ValueCell!9776)) (size!27874 (_ BitVec 32))) )
))
(declare-datatypes ((array!56963 0))(
  ( (array!56964 (arr!27408 (Array (_ BitVec 32) (_ BitVec 64))) (size!27875 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4702 0))(
  ( (LongMapFixedSize!4703 (defaultEntry!5642 Int) (mask!27265 (_ BitVec 32)) (extraKeys!5374 (_ BitVec 32)) (zeroValue!5478 V!32319) (minValue!5478 V!32319) (_size!2406 (_ BitVec 32)) (_keys!10511 array!56963) (_values!5665 array!56961) (_vacant!2406 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4702)

(declare-fun mapDefault!32594 () ValueCell!9776)

(assert (=> b!943253 (= condMapEmpty!32594 (= (arr!27407 (_values!5665 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9776)) mapDefault!32594)))))

(declare-fun b!943254 () Bool)

(declare-fun res!633848 () Bool)

(declare-fun e!530329 () Bool)

(assert (=> b!943254 (=> (not res!633848) (not e!530329))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9052 0))(
  ( (MissingZero!9052 (index!38579 (_ BitVec 32))) (Found!9052 (index!38580 (_ BitVec 32))) (Intermediate!9052 (undefined!9864 Bool) (index!38581 (_ BitVec 32)) (x!81024 (_ BitVec 32))) (Undefined!9052) (MissingVacant!9052 (index!38582 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56963 (_ BitVec 32)) SeekEntryResult!9052)

(assert (=> b!943254 (= res!633848 (not ((_ is Found!9052) (seekEntry!0 key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)))))))

(declare-fun b!943255 () Bool)

(declare-fun res!633846 () Bool)

(assert (=> b!943255 (=> (not res!633846) (not e!530329))))

(assert (=> b!943255 (= res!633846 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943256 () Bool)

(declare-fun tp_is_empty!20515 () Bool)

(assert (=> b!943256 (= e!530327 tp_is_empty!20515)))

(declare-fun b!943257 () Bool)

(declare-fun res!633847 () Bool)

(assert (=> b!943257 (=> (not res!633847) (not e!530329))))

(declare-datatypes ((tuple2!13494 0))(
  ( (tuple2!13495 (_1!6758 (_ BitVec 64)) (_2!6758 V!32319)) )
))
(declare-datatypes ((List!19261 0))(
  ( (Nil!19258) (Cons!19257 (h!20407 tuple2!13494) (t!27567 List!19261)) )
))
(declare-datatypes ((ListLongMap!12181 0))(
  ( (ListLongMap!12182 (toList!6106 List!19261)) )
))
(declare-fun contains!5119 (ListLongMap!12181 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3269 (array!56963 array!56961 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 32) Int) ListLongMap!12181)

(assert (=> b!943257 (= res!633847 (contains!5119 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) key!756))))

(declare-fun b!943258 () Bool)

(declare-fun e!530326 () Bool)

(assert (=> b!943258 (= e!530326 tp_is_empty!20515)))

(declare-fun mapNonEmpty!32594 () Bool)

(declare-fun tp!62527 () Bool)

(assert (=> mapNonEmpty!32594 (= mapRes!32594 (and tp!62527 e!530326))))

(declare-fun mapRest!32594 () (Array (_ BitVec 32) ValueCell!9776))

(declare-fun mapKey!32594 () (_ BitVec 32))

(declare-fun mapValue!32594 () ValueCell!9776)

(assert (=> mapNonEmpty!32594 (= (arr!27407 (_values!5665 thiss!1141)) (store mapRest!32594 mapKey!32594 mapValue!32594))))

(declare-fun e!530328 () Bool)

(declare-fun array_inv!21354 (array!56963) Bool)

(declare-fun array_inv!21355 (array!56961) Bool)

(assert (=> b!943260 (= e!530328 (and tp!62528 tp_is_empty!20515 (array_inv!21354 (_keys!10511 thiss!1141)) (array_inv!21355 (_values!5665 thiss!1141)) e!530325))))

(declare-fun mapIsEmpty!32594 () Bool)

(assert (=> mapIsEmpty!32594 mapRes!32594))

(declare-fun res!633849 () Bool)

(assert (=> start!80290 (=> (not res!633849) (not e!530329))))

(declare-fun valid!1804 (LongMapFixedSize!4702) Bool)

(assert (=> start!80290 (= res!633849 (valid!1804 thiss!1141))))

(assert (=> start!80290 e!530329))

(assert (=> start!80290 e!530328))

(assert (=> start!80290 true))

(declare-fun b!943259 () Bool)

(assert (=> b!943259 (= e!530329 (not (and (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))) (bvslt (size!27875 (_keys!10511 thiss!1141)) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!56963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!943259 (arrayContainsKey!0 (_keys!10511 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31699 0))(
  ( (Unit!31700) )
))
(declare-fun lt!425024 () Unit!31699)

(declare-fun lemmaKeyInListMapIsInArray!281 (array!56963 array!56961 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 64) Int) Unit!31699)

(assert (=> b!943259 (= lt!425024 (lemmaKeyInListMapIsInArray!281 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)))))

(assert (= (and start!80290 res!633849) b!943255))

(assert (= (and b!943255 res!633846) b!943254))

(assert (= (and b!943254 res!633848) b!943257))

(assert (= (and b!943257 res!633847) b!943259))

(assert (= (and b!943253 condMapEmpty!32594) mapIsEmpty!32594))

(assert (= (and b!943253 (not condMapEmpty!32594)) mapNonEmpty!32594))

(assert (= (and mapNonEmpty!32594 ((_ is ValueCellFull!9776) mapValue!32594)) b!943258))

(assert (= (and b!943253 ((_ is ValueCellFull!9776) mapDefault!32594)) b!943256))

(assert (= b!943260 b!943253))

(assert (= start!80290 b!943260))

(declare-fun m!876881 () Bool)

(assert (=> b!943259 m!876881))

(declare-fun m!876883 () Bool)

(assert (=> b!943259 m!876883))

(declare-fun m!876885 () Bool)

(assert (=> b!943257 m!876885))

(assert (=> b!943257 m!876885))

(declare-fun m!876887 () Bool)

(assert (=> b!943257 m!876887))

(declare-fun m!876889 () Bool)

(assert (=> start!80290 m!876889))

(declare-fun m!876891 () Bool)

(assert (=> mapNonEmpty!32594 m!876891))

(declare-fun m!876893 () Bool)

(assert (=> b!943260 m!876893))

(declare-fun m!876895 () Bool)

(assert (=> b!943260 m!876895))

(declare-fun m!876897 () Bool)

(assert (=> b!943254 m!876897))

(check-sat (not b!943260) b_and!29393 (not b!943254) (not b!943257) (not b!943259) tp_is_empty!20515 (not mapNonEmpty!32594) (not start!80290) (not b_next!18007))
(check-sat b_and!29393 (not b_next!18007))
(get-model)

(declare-fun d!114025 () Bool)

(assert (=> d!114025 (= (array_inv!21354 (_keys!10511 thiss!1141)) (bvsge (size!27875 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943260 d!114025))

(declare-fun d!114027 () Bool)

(assert (=> d!114027 (= (array_inv!21355 (_values!5665 thiss!1141)) (bvsge (size!27874 (_values!5665 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943260 d!114027))

(declare-fun d!114029 () Bool)

(declare-fun res!633878 () Bool)

(declare-fun e!530371 () Bool)

(assert (=> d!114029 (=> res!633878 e!530371)))

(assert (=> d!114029 (= res!633878 (= (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114029 (= (arrayContainsKey!0 (_keys!10511 thiss!1141) key!756 #b00000000000000000000000000000000) e!530371)))

(declare-fun b!943313 () Bool)

(declare-fun e!530372 () Bool)

(assert (=> b!943313 (= e!530371 e!530372)))

(declare-fun res!633879 () Bool)

(assert (=> b!943313 (=> (not res!633879) (not e!530372))))

(assert (=> b!943313 (= res!633879 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun b!943314 () Bool)

(assert (=> b!943314 (= e!530372 (arrayContainsKey!0 (_keys!10511 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114029 (not res!633878)) b!943313))

(assert (= (and b!943313 res!633879) b!943314))

(declare-fun m!876935 () Bool)

(assert (=> d!114029 m!876935))

(declare-fun m!876937 () Bool)

(assert (=> b!943314 m!876937))

(assert (=> b!943259 d!114029))

(declare-fun d!114031 () Bool)

(declare-fun e!530375 () Bool)

(assert (=> d!114031 e!530375))

(declare-fun c!98180 () Bool)

(assert (=> d!114031 (= c!98180 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!425033 () Unit!31699)

(declare-fun choose!1574 (array!56963 array!56961 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 64) Int) Unit!31699)

(assert (=> d!114031 (= lt!425033 (choose!1574 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114031 (validMask!0 (mask!27265 thiss!1141))))

(assert (=> d!114031 (= (lemmaKeyInListMapIsInArray!281 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)) lt!425033)))

(declare-fun b!943319 () Bool)

(assert (=> b!943319 (= e!530375 (arrayContainsKey!0 (_keys!10511 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!943320 () Bool)

(assert (=> b!943320 (= e!530375 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114031 c!98180) b!943319))

(assert (= (and d!114031 (not c!98180)) b!943320))

(declare-fun m!876939 () Bool)

(assert (=> d!114031 m!876939))

(declare-fun m!876941 () Bool)

(assert (=> d!114031 m!876941))

(assert (=> b!943319 m!876881))

(assert (=> b!943259 d!114031))

(declare-fun b!943333 () Bool)

(declare-fun e!530384 () SeekEntryResult!9052)

(declare-fun lt!425044 () SeekEntryResult!9052)

(assert (=> b!943333 (= e!530384 (Found!9052 (index!38581 lt!425044)))))

(declare-fun d!114033 () Bool)

(declare-fun lt!425043 () SeekEntryResult!9052)

(assert (=> d!114033 (and (or ((_ is MissingVacant!9052) lt!425043) (not ((_ is Found!9052) lt!425043)) (and (bvsge (index!38580 lt!425043) #b00000000000000000000000000000000) (bvslt (index!38580 lt!425043) (size!27875 (_keys!10511 thiss!1141))))) (not ((_ is MissingVacant!9052) lt!425043)) (or (not ((_ is Found!9052) lt!425043)) (= (select (arr!27408 (_keys!10511 thiss!1141)) (index!38580 lt!425043)) key!756)))))

(declare-fun e!530382 () SeekEntryResult!9052)

(assert (=> d!114033 (= lt!425043 e!530382)))

(declare-fun c!98188 () Bool)

(assert (=> d!114033 (= c!98188 (and ((_ is Intermediate!9052) lt!425044) (undefined!9864 lt!425044)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56963 (_ BitVec 32)) SeekEntryResult!9052)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114033 (= lt!425044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27265 thiss!1141)) key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)))))

(assert (=> d!114033 (validMask!0 (mask!27265 thiss!1141))))

(assert (=> d!114033 (= (seekEntry!0 key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)) lt!425043)))

(declare-fun b!943334 () Bool)

(assert (=> b!943334 (= e!530382 Undefined!9052)))

(declare-fun b!943335 () Bool)

(declare-fun e!530383 () SeekEntryResult!9052)

(declare-fun lt!425045 () SeekEntryResult!9052)

(assert (=> b!943335 (= e!530383 (ite ((_ is MissingVacant!9052) lt!425045) (MissingZero!9052 (index!38582 lt!425045)) lt!425045))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56963 (_ BitVec 32)) SeekEntryResult!9052)

(assert (=> b!943335 (= lt!425045 (seekKeyOrZeroReturnVacant!0 (x!81024 lt!425044) (index!38581 lt!425044) (index!38581 lt!425044) key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)))))

(declare-fun b!943336 () Bool)

(assert (=> b!943336 (= e!530382 e!530384)))

(declare-fun lt!425042 () (_ BitVec 64))

(assert (=> b!943336 (= lt!425042 (select (arr!27408 (_keys!10511 thiss!1141)) (index!38581 lt!425044)))))

(declare-fun c!98187 () Bool)

(assert (=> b!943336 (= c!98187 (= lt!425042 key!756))))

(declare-fun b!943337 () Bool)

(assert (=> b!943337 (= e!530383 (MissingZero!9052 (index!38581 lt!425044)))))

(declare-fun b!943338 () Bool)

(declare-fun c!98189 () Bool)

(assert (=> b!943338 (= c!98189 (= lt!425042 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943338 (= e!530384 e!530383)))

(assert (= (and d!114033 c!98188) b!943334))

(assert (= (and d!114033 (not c!98188)) b!943336))

(assert (= (and b!943336 c!98187) b!943333))

(assert (= (and b!943336 (not c!98187)) b!943338))

(assert (= (and b!943338 c!98189) b!943337))

(assert (= (and b!943338 (not c!98189)) b!943335))

(declare-fun m!876943 () Bool)

(assert (=> d!114033 m!876943))

(declare-fun m!876945 () Bool)

(assert (=> d!114033 m!876945))

(assert (=> d!114033 m!876945))

(declare-fun m!876947 () Bool)

(assert (=> d!114033 m!876947))

(assert (=> d!114033 m!876941))

(declare-fun m!876949 () Bool)

(assert (=> b!943335 m!876949))

(declare-fun m!876951 () Bool)

(assert (=> b!943336 m!876951))

(assert (=> b!943254 d!114033))

(declare-fun d!114035 () Bool)

(declare-fun res!633886 () Bool)

(declare-fun e!530387 () Bool)

(assert (=> d!114035 (=> (not res!633886) (not e!530387))))

(declare-fun simpleValid!348 (LongMapFixedSize!4702) Bool)

(assert (=> d!114035 (= res!633886 (simpleValid!348 thiss!1141))))

(assert (=> d!114035 (= (valid!1804 thiss!1141) e!530387)))

(declare-fun b!943345 () Bool)

(declare-fun res!633887 () Bool)

(assert (=> b!943345 (=> (not res!633887) (not e!530387))))

(declare-fun arrayCountValidKeys!0 (array!56963 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943345 (= res!633887 (= (arrayCountValidKeys!0 (_keys!10511 thiss!1141) #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))) (_size!2406 thiss!1141)))))

(declare-fun b!943346 () Bool)

(declare-fun res!633888 () Bool)

(assert (=> b!943346 (=> (not res!633888) (not e!530387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56963 (_ BitVec 32)) Bool)

(assert (=> b!943346 (= res!633888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)))))

(declare-fun b!943347 () Bool)

(declare-datatypes ((List!19263 0))(
  ( (Nil!19260) (Cons!19259 (h!20409 (_ BitVec 64)) (t!27571 List!19263)) )
))
(declare-fun arrayNoDuplicates!0 (array!56963 (_ BitVec 32) List!19263) Bool)

(assert (=> b!943347 (= e!530387 (arrayNoDuplicates!0 (_keys!10511 thiss!1141) #b00000000000000000000000000000000 Nil!19260))))

(assert (= (and d!114035 res!633886) b!943345))

(assert (= (and b!943345 res!633887) b!943346))

(assert (= (and b!943346 res!633888) b!943347))

(declare-fun m!876953 () Bool)

(assert (=> d!114035 m!876953))

(declare-fun m!876955 () Bool)

(assert (=> b!943345 m!876955))

(declare-fun m!876957 () Bool)

(assert (=> b!943346 m!876957))

(declare-fun m!876959 () Bool)

(assert (=> b!943347 m!876959))

(assert (=> start!80290 d!114035))

(declare-fun d!114037 () Bool)

(declare-fun e!530393 () Bool)

(assert (=> d!114037 e!530393))

(declare-fun res!633891 () Bool)

(assert (=> d!114037 (=> res!633891 e!530393)))

(declare-fun lt!425054 () Bool)

(assert (=> d!114037 (= res!633891 (not lt!425054))))

(declare-fun lt!425055 () Bool)

(assert (=> d!114037 (= lt!425054 lt!425055)))

(declare-fun lt!425057 () Unit!31699)

(declare-fun e!530392 () Unit!31699)

(assert (=> d!114037 (= lt!425057 e!530392)))

(declare-fun c!98192 () Bool)

(assert (=> d!114037 (= c!98192 lt!425055)))

(declare-fun containsKey!452 (List!19261 (_ BitVec 64)) Bool)

(assert (=> d!114037 (= lt!425055 (containsKey!452 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(assert (=> d!114037 (= (contains!5119 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) key!756) lt!425054)))

(declare-fun b!943354 () Bool)

(declare-fun lt!425056 () Unit!31699)

(assert (=> b!943354 (= e!530392 lt!425056)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!347 (List!19261 (_ BitVec 64)) Unit!31699)

(assert (=> b!943354 (= lt!425056 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-datatypes ((Option!494 0))(
  ( (Some!493 (v!12841 V!32319)) (None!492) )
))
(declare-fun isDefined!360 (Option!494) Bool)

(declare-fun getValueByKey!488 (List!19261 (_ BitVec 64)) Option!494)

(assert (=> b!943354 (isDefined!360 (getValueByKey!488 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-fun b!943355 () Bool)

(declare-fun Unit!31701 () Unit!31699)

(assert (=> b!943355 (= e!530392 Unit!31701)))

(declare-fun b!943356 () Bool)

(assert (=> b!943356 (= e!530393 (isDefined!360 (getValueByKey!488 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756)))))

(assert (= (and d!114037 c!98192) b!943354))

(assert (= (and d!114037 (not c!98192)) b!943355))

(assert (= (and d!114037 (not res!633891)) b!943356))

(declare-fun m!876961 () Bool)

(assert (=> d!114037 m!876961))

(declare-fun m!876963 () Bool)

(assert (=> b!943354 m!876963))

(declare-fun m!876965 () Bool)

(assert (=> b!943354 m!876965))

(assert (=> b!943354 m!876965))

(declare-fun m!876967 () Bool)

(assert (=> b!943354 m!876967))

(assert (=> b!943356 m!876965))

(assert (=> b!943356 m!876965))

(assert (=> b!943356 m!876967))

(assert (=> b!943257 d!114037))

(declare-fun b!943399 () Bool)

(declare-fun res!633915 () Bool)

(declare-fun e!530423 () Bool)

(assert (=> b!943399 (=> (not res!633915) (not e!530423))))

(declare-fun e!530426 () Bool)

(assert (=> b!943399 (= res!633915 e!530426)))

(declare-fun res!633914 () Bool)

(assert (=> b!943399 (=> res!633914 e!530426)))

(declare-fun e!530420 () Bool)

(assert (=> b!943399 (= res!633914 (not e!530420))))

(declare-fun res!633911 () Bool)

(assert (=> b!943399 (=> (not res!633911) (not e!530420))))

(assert (=> b!943399 (= res!633911 (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun bm!40951 () Bool)

(declare-fun call!40958 () Bool)

(declare-fun lt!425116 () ListLongMap!12181)

(assert (=> bm!40951 (= call!40958 (contains!5119 lt!425116 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943400 () Bool)

(declare-fun e!530428 () ListLongMap!12181)

(declare-fun call!40954 () ListLongMap!12181)

(assert (=> b!943400 (= e!530428 call!40954)))

(declare-fun b!943401 () Bool)

(declare-fun e!530421 () Bool)

(assert (=> b!943401 (= e!530421 (not call!40958))))

(declare-fun b!943402 () Bool)

(declare-fun e!530429 () ListLongMap!12181)

(assert (=> b!943402 (= e!530429 call!40954)))

(declare-fun bm!40952 () Bool)

(declare-fun call!40956 () ListLongMap!12181)

(declare-fun call!40957 () ListLongMap!12181)

(assert (=> bm!40952 (= call!40956 call!40957)))

(declare-fun b!943403 () Bool)

(declare-fun call!40959 () ListLongMap!12181)

(assert (=> b!943403 (= e!530429 call!40959)))

(declare-fun b!943404 () Bool)

(assert (=> b!943404 (= e!530423 e!530421)))

(declare-fun c!98209 () Bool)

(assert (=> b!943404 (= c!98209 (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!943405 () Bool)

(declare-fun e!530427 () Bool)

(declare-fun apply!859 (ListLongMap!12181 (_ BitVec 64)) V!32319)

(assert (=> b!943405 (= e!530427 (= (apply!859 lt!425116 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5478 thiss!1141)))))

(declare-fun bm!40953 () Bool)

(assert (=> bm!40953 (= call!40959 call!40956)))

(declare-fun b!943407 () Bool)

(declare-fun e!530425 () ListLongMap!12181)

(declare-fun call!40960 () ListLongMap!12181)

(declare-fun +!2869 (ListLongMap!12181 tuple2!13494) ListLongMap!12181)

(assert (=> b!943407 (= e!530425 (+!2869 call!40960 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))

(declare-fun bm!40954 () Bool)

(assert (=> bm!40954 (= call!40954 call!40960)))

(declare-fun bm!40955 () Bool)

(declare-fun call!40955 () Bool)

(assert (=> bm!40955 (= call!40955 (contains!5119 lt!425116 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943408 () Bool)

(declare-fun e!530431 () Bool)

(assert (=> b!943408 (= e!530431 (= (apply!859 lt!425116 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5478 thiss!1141)))))

(declare-fun c!98208 () Bool)

(declare-fun c!98207 () Bool)

(declare-fun bm!40956 () Bool)

(assert (=> bm!40956 (= call!40960 (+!2869 (ite c!98208 call!40957 (ite c!98207 call!40956 call!40959)) (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(declare-fun b!943409 () Bool)

(declare-fun e!530430 () Unit!31699)

(declare-fun Unit!31702 () Unit!31699)

(assert (=> b!943409 (= e!530430 Unit!31702)))

(declare-fun b!943410 () Bool)

(assert (=> b!943410 (= e!530421 e!530431)))

(declare-fun res!633916 () Bool)

(assert (=> b!943410 (= res!633916 call!40958)))

(assert (=> b!943410 (=> (not res!633916) (not e!530431))))

(declare-fun b!943411 () Bool)

(declare-fun e!530424 () Bool)

(assert (=> b!943411 (= e!530424 e!530427)))

(declare-fun res!633910 () Bool)

(assert (=> b!943411 (= res!633910 call!40955)))

(assert (=> b!943411 (=> (not res!633910) (not e!530427))))

(declare-fun b!943406 () Bool)

(declare-fun c!98206 () Bool)

(assert (=> b!943406 (= c!98206 (and (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!943406 (= e!530428 e!530429)))

(declare-fun d!114039 () Bool)

(assert (=> d!114039 e!530423))

(declare-fun res!633918 () Bool)

(assert (=> d!114039 (=> (not res!633918) (not e!530423))))

(assert (=> d!114039 (= res!633918 (or (bvsge #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))))

(declare-fun lt!425103 () ListLongMap!12181)

(assert (=> d!114039 (= lt!425116 lt!425103)))

(declare-fun lt!425104 () Unit!31699)

(assert (=> d!114039 (= lt!425104 e!530430)))

(declare-fun c!98210 () Bool)

(declare-fun e!530432 () Bool)

(assert (=> d!114039 (= c!98210 e!530432)))

(declare-fun res!633913 () Bool)

(assert (=> d!114039 (=> (not res!633913) (not e!530432))))

(assert (=> d!114039 (= res!633913 (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> d!114039 (= lt!425103 e!530425)))

(assert (=> d!114039 (= c!98208 (and (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114039 (validMask!0 (mask!27265 thiss!1141))))

(assert (=> d!114039 (= (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) lt!425116)))

(declare-fun b!943412 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!943412 (= e!530420 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943413 () Bool)

(declare-fun lt!425115 () Unit!31699)

(assert (=> b!943413 (= e!530430 lt!425115)))

(declare-fun lt!425118 () ListLongMap!12181)

(declare-fun getCurrentListMapNoExtraKeys!3341 (array!56963 array!56961 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 32) Int) ListLongMap!12181)

(assert (=> b!943413 (= lt!425118 (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425119 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425119 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425123 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425123 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425109 () Unit!31699)

(declare-fun addStillContains!558 (ListLongMap!12181 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31699)

(assert (=> b!943413 (= lt!425109 (addStillContains!558 lt!425118 lt!425119 (zeroValue!5478 thiss!1141) lt!425123))))

(assert (=> b!943413 (contains!5119 (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))) lt!425123)))

(declare-fun lt!425117 () Unit!31699)

(assert (=> b!943413 (= lt!425117 lt!425109)))

(declare-fun lt!425113 () ListLongMap!12181)

(assert (=> b!943413 (= lt!425113 (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425114 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425114 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425111 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425111 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425105 () Unit!31699)

(declare-fun addApplyDifferent!438 (ListLongMap!12181 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31699)

(assert (=> b!943413 (= lt!425105 (addApplyDifferent!438 lt!425113 lt!425114 (minValue!5478 thiss!1141) lt!425111))))

(assert (=> b!943413 (= (apply!859 (+!2869 lt!425113 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))) lt!425111) (apply!859 lt!425113 lt!425111))))

(declare-fun lt!425108 () Unit!31699)

(assert (=> b!943413 (= lt!425108 lt!425105)))

(declare-fun lt!425107 () ListLongMap!12181)

(assert (=> b!943413 (= lt!425107 (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425121 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425121 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425120 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425120 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425106 () Unit!31699)

(assert (=> b!943413 (= lt!425106 (addApplyDifferent!438 lt!425107 lt!425121 (zeroValue!5478 thiss!1141) lt!425120))))

(assert (=> b!943413 (= (apply!859 (+!2869 lt!425107 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))) lt!425120) (apply!859 lt!425107 lt!425120))))

(declare-fun lt!425122 () Unit!31699)

(assert (=> b!943413 (= lt!425122 lt!425106)))

(declare-fun lt!425110 () ListLongMap!12181)

(assert (=> b!943413 (= lt!425110 (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425112 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425112 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425102 () (_ BitVec 64))

(assert (=> b!943413 (= lt!425102 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943413 (= lt!425115 (addApplyDifferent!438 lt!425110 lt!425112 (minValue!5478 thiss!1141) lt!425102))))

(assert (=> b!943413 (= (apply!859 (+!2869 lt!425110 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))) lt!425102) (apply!859 lt!425110 lt!425102))))

(declare-fun b!943414 () Bool)

(declare-fun e!530422 () Bool)

(declare-fun get!14421 (ValueCell!9776 V!32319) V!32319)

(declare-fun dynLambda!1625 (Int (_ BitVec 64)) V!32319)

(assert (=> b!943414 (= e!530422 (= (apply!859 lt!425116 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)) (get!14421 (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1625 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!943414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27874 (_values!5665 thiss!1141))))))

(assert (=> b!943414 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun b!943415 () Bool)

(declare-fun res!633912 () Bool)

(assert (=> b!943415 (=> (not res!633912) (not e!530423))))

(assert (=> b!943415 (= res!633912 e!530424)))

(declare-fun c!98205 () Bool)

(assert (=> b!943415 (= c!98205 (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!40957 () Bool)

(assert (=> bm!40957 (= call!40957 (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun b!943416 () Bool)

(assert (=> b!943416 (= e!530424 (not call!40955))))

(declare-fun b!943417 () Bool)

(assert (=> b!943417 (= e!530432 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943418 () Bool)

(assert (=> b!943418 (= e!530426 e!530422)))

(declare-fun res!633917 () Bool)

(assert (=> b!943418 (=> (not res!633917) (not e!530422))))

(assert (=> b!943418 (= res!633917 (contains!5119 lt!425116 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943418 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun b!943419 () Bool)

(assert (=> b!943419 (= e!530425 e!530428)))

(assert (=> b!943419 (= c!98207 (and (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!114039 c!98208) b!943407))

(assert (= (and d!114039 (not c!98208)) b!943419))

(assert (= (and b!943419 c!98207) b!943400))

(assert (= (and b!943419 (not c!98207)) b!943406))

(assert (= (and b!943406 c!98206) b!943402))

(assert (= (and b!943406 (not c!98206)) b!943403))

(assert (= (or b!943402 b!943403) bm!40953))

(assert (= (or b!943400 bm!40953) bm!40952))

(assert (= (or b!943400 b!943402) bm!40954))

(assert (= (or b!943407 bm!40952) bm!40957))

(assert (= (or b!943407 bm!40954) bm!40956))

(assert (= (and d!114039 res!633913) b!943417))

(assert (= (and d!114039 c!98210) b!943413))

(assert (= (and d!114039 (not c!98210)) b!943409))

(assert (= (and d!114039 res!633918) b!943399))

(assert (= (and b!943399 res!633911) b!943412))

(assert (= (and b!943399 (not res!633914)) b!943418))

(assert (= (and b!943418 res!633917) b!943414))

(assert (= (and b!943399 res!633915) b!943415))

(assert (= (and b!943415 c!98205) b!943411))

(assert (= (and b!943415 (not c!98205)) b!943416))

(assert (= (and b!943411 res!633910) b!943405))

(assert (= (or b!943411 b!943416) bm!40955))

(assert (= (and b!943415 res!633912) b!943404))

(assert (= (and b!943404 c!98209) b!943410))

(assert (= (and b!943404 (not c!98209)) b!943401))

(assert (= (and b!943410 res!633916) b!943408))

(assert (= (or b!943410 b!943401) bm!40951))

(declare-fun b_lambda!14261 () Bool)

(assert (=> (not b_lambda!14261) (not b!943414)))

(declare-fun t!27570 () Bool)

(declare-fun tb!6159 () Bool)

(assert (=> (and b!943260 (= (defaultEntry!5642 thiss!1141) (defaultEntry!5642 thiss!1141)) t!27570) tb!6159))

(declare-fun result!12187 () Bool)

(assert (=> tb!6159 (= result!12187 tp_is_empty!20515)))

(assert (=> b!943414 t!27570))

(declare-fun b_and!29399 () Bool)

(assert (= b_and!29393 (and (=> t!27570 result!12187) b_and!29399)))

(assert (=> d!114039 m!876941))

(declare-fun m!876969 () Bool)

(assert (=> b!943414 m!876969))

(declare-fun m!876971 () Bool)

(assert (=> b!943414 m!876971))

(assert (=> b!943414 m!876935))

(declare-fun m!876973 () Bool)

(assert (=> b!943414 m!876973))

(assert (=> b!943414 m!876969))

(assert (=> b!943414 m!876971))

(declare-fun m!876975 () Bool)

(assert (=> b!943414 m!876975))

(assert (=> b!943414 m!876935))

(assert (=> b!943412 m!876935))

(assert (=> b!943412 m!876935))

(declare-fun m!876977 () Bool)

(assert (=> b!943412 m!876977))

(declare-fun m!876979 () Bool)

(assert (=> b!943413 m!876979))

(assert (=> b!943413 m!876979))

(declare-fun m!876981 () Bool)

(assert (=> b!943413 m!876981))

(assert (=> b!943413 m!876935))

(declare-fun m!876983 () Bool)

(assert (=> b!943413 m!876983))

(declare-fun m!876985 () Bool)

(assert (=> b!943413 m!876985))

(declare-fun m!876987 () Bool)

(assert (=> b!943413 m!876987))

(declare-fun m!876989 () Bool)

(assert (=> b!943413 m!876989))

(declare-fun m!876991 () Bool)

(assert (=> b!943413 m!876991))

(assert (=> b!943413 m!876989))

(declare-fun m!876993 () Bool)

(assert (=> b!943413 m!876993))

(declare-fun m!876995 () Bool)

(assert (=> b!943413 m!876995))

(assert (=> b!943413 m!876995))

(declare-fun m!876997 () Bool)

(assert (=> b!943413 m!876997))

(declare-fun m!876999 () Bool)

(assert (=> b!943413 m!876999))

(declare-fun m!877001 () Bool)

(assert (=> b!943413 m!877001))

(declare-fun m!877003 () Bool)

(assert (=> b!943413 m!877003))

(assert (=> b!943413 m!877001))

(declare-fun m!877005 () Bool)

(assert (=> b!943413 m!877005))

(declare-fun m!877007 () Bool)

(assert (=> b!943413 m!877007))

(declare-fun m!877009 () Bool)

(assert (=> b!943413 m!877009))

(assert (=> b!943418 m!876935))

(assert (=> b!943418 m!876935))

(declare-fun m!877011 () Bool)

(assert (=> b!943418 m!877011))

(assert (=> b!943417 m!876935))

(assert (=> b!943417 m!876935))

(assert (=> b!943417 m!876977))

(declare-fun m!877013 () Bool)

(assert (=> b!943407 m!877013))

(declare-fun m!877015 () Bool)

(assert (=> bm!40956 m!877015))

(assert (=> bm!40957 m!876985))

(declare-fun m!877017 () Bool)

(assert (=> b!943408 m!877017))

(declare-fun m!877019 () Bool)

(assert (=> bm!40951 m!877019))

(declare-fun m!877021 () Bool)

(assert (=> b!943405 m!877021))

(declare-fun m!877023 () Bool)

(assert (=> bm!40955 m!877023))

(assert (=> b!943257 d!114039))

(declare-fun mapNonEmpty!32603 () Bool)

(declare-fun mapRes!32603 () Bool)

(declare-fun tp!62543 () Bool)

(declare-fun e!530438 () Bool)

(assert (=> mapNonEmpty!32603 (= mapRes!32603 (and tp!62543 e!530438))))

(declare-fun mapKey!32603 () (_ BitVec 32))

(declare-fun mapRest!32603 () (Array (_ BitVec 32) ValueCell!9776))

(declare-fun mapValue!32603 () ValueCell!9776)

(assert (=> mapNonEmpty!32603 (= mapRest!32594 (store mapRest!32603 mapKey!32603 mapValue!32603))))

(declare-fun b!943428 () Bool)

(assert (=> b!943428 (= e!530438 tp_is_empty!20515)))

(declare-fun b!943429 () Bool)

(declare-fun e!530437 () Bool)

(assert (=> b!943429 (= e!530437 tp_is_empty!20515)))

(declare-fun mapIsEmpty!32603 () Bool)

(assert (=> mapIsEmpty!32603 mapRes!32603))

(declare-fun condMapEmpty!32603 () Bool)

(declare-fun mapDefault!32603 () ValueCell!9776)

(assert (=> mapNonEmpty!32594 (= condMapEmpty!32603 (= mapRest!32594 ((as const (Array (_ BitVec 32) ValueCell!9776)) mapDefault!32603)))))

(assert (=> mapNonEmpty!32594 (= tp!62527 (and e!530437 mapRes!32603))))

(assert (= (and mapNonEmpty!32594 condMapEmpty!32603) mapIsEmpty!32603))

(assert (= (and mapNonEmpty!32594 (not condMapEmpty!32603)) mapNonEmpty!32603))

(assert (= (and mapNonEmpty!32603 ((_ is ValueCellFull!9776) mapValue!32603)) b!943428))

(assert (= (and mapNonEmpty!32594 ((_ is ValueCellFull!9776) mapDefault!32603)) b!943429))

(declare-fun m!877025 () Bool)

(assert (=> mapNonEmpty!32603 m!877025))

(declare-fun b_lambda!14263 () Bool)

(assert (= b_lambda!14261 (or (and b!943260 b_free!18007) b_lambda!14263)))

(check-sat (not bm!40955) (not b!943417) (not d!114035) tp_is_empty!20515 (not b!943418) (not b!943412) (not b!943345) (not b!943319) (not b!943356) (not b!943354) (not d!114039) (not d!114033) (not b!943408) (not b!943335) (not b!943407) (not bm!40951) (not b!943347) (not bm!40957) (not d!114037) b_and!29399 (not bm!40956) (not mapNonEmpty!32603) (not b!943414) (not b_next!18007) (not b!943413) (not d!114031) (not b!943405) (not b!943346) (not b!943314) (not b_lambda!14263))
(check-sat b_and!29399 (not b_next!18007))
(get-model)

(declare-fun b!943442 () Bool)

(declare-fun e!530446 () SeekEntryResult!9052)

(assert (=> b!943442 (= e!530446 (MissingVacant!9052 (index!38581 lt!425044)))))

(declare-fun b!943443 () Bool)

(declare-fun c!98218 () Bool)

(declare-fun lt!425129 () (_ BitVec 64))

(assert (=> b!943443 (= c!98218 (= lt!425129 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!530447 () SeekEntryResult!9052)

(assert (=> b!943443 (= e!530447 e!530446)))

(declare-fun b!943445 () Bool)

(assert (=> b!943445 (= e!530447 (Found!9052 (index!38581 lt!425044)))))

(declare-fun b!943446 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!943446 (= e!530446 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81024 lt!425044) #b00000000000000000000000000000001) (nextIndex!0 (index!38581 lt!425044) (x!81024 lt!425044) (mask!27265 thiss!1141)) (index!38581 lt!425044) key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)))))

(declare-fun b!943447 () Bool)

(declare-fun e!530445 () SeekEntryResult!9052)

(assert (=> b!943447 (= e!530445 Undefined!9052)))

(declare-fun d!114041 () Bool)

(declare-fun lt!425128 () SeekEntryResult!9052)

(assert (=> d!114041 (and (or ((_ is Undefined!9052) lt!425128) (not ((_ is Found!9052) lt!425128)) (and (bvsge (index!38580 lt!425128) #b00000000000000000000000000000000) (bvslt (index!38580 lt!425128) (size!27875 (_keys!10511 thiss!1141))))) (or ((_ is Undefined!9052) lt!425128) ((_ is Found!9052) lt!425128) (not ((_ is MissingVacant!9052) lt!425128)) (not (= (index!38582 lt!425128) (index!38581 lt!425044))) (and (bvsge (index!38582 lt!425128) #b00000000000000000000000000000000) (bvslt (index!38582 lt!425128) (size!27875 (_keys!10511 thiss!1141))))) (or ((_ is Undefined!9052) lt!425128) (ite ((_ is Found!9052) lt!425128) (= (select (arr!27408 (_keys!10511 thiss!1141)) (index!38580 lt!425128)) key!756) (and ((_ is MissingVacant!9052) lt!425128) (= (index!38582 lt!425128) (index!38581 lt!425044)) (= (select (arr!27408 (_keys!10511 thiss!1141)) (index!38582 lt!425128)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114041 (= lt!425128 e!530445)))

(declare-fun c!98219 () Bool)

(assert (=> d!114041 (= c!98219 (bvsge (x!81024 lt!425044) #b01111111111111111111111111111110))))

(assert (=> d!114041 (= lt!425129 (select (arr!27408 (_keys!10511 thiss!1141)) (index!38581 lt!425044)))))

(assert (=> d!114041 (validMask!0 (mask!27265 thiss!1141))))

(assert (=> d!114041 (= (seekKeyOrZeroReturnVacant!0 (x!81024 lt!425044) (index!38581 lt!425044) (index!38581 lt!425044) key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)) lt!425128)))

(declare-fun b!943444 () Bool)

(assert (=> b!943444 (= e!530445 e!530447)))

(declare-fun c!98217 () Bool)

(assert (=> b!943444 (= c!98217 (= lt!425129 key!756))))

(assert (= (and d!114041 c!98219) b!943447))

(assert (= (and d!114041 (not c!98219)) b!943444))

(assert (= (and b!943444 c!98217) b!943445))

(assert (= (and b!943444 (not c!98217)) b!943443))

(assert (= (and b!943443 c!98218) b!943442))

(assert (= (and b!943443 (not c!98218)) b!943446))

(declare-fun m!877027 () Bool)

(assert (=> b!943446 m!877027))

(assert (=> b!943446 m!877027))

(declare-fun m!877029 () Bool)

(assert (=> b!943446 m!877029))

(declare-fun m!877031 () Bool)

(assert (=> d!114041 m!877031))

(declare-fun m!877033 () Bool)

(assert (=> d!114041 m!877033))

(assert (=> d!114041 m!876951))

(assert (=> d!114041 m!876941))

(assert (=> b!943335 d!114041))

(declare-fun d!114043 () Bool)

(declare-fun get!14422 (Option!494) V!32319)

(assert (=> d!114043 (= (apply!859 lt!425116 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14422 (getValueByKey!488 (toList!6106 lt!425116) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26487 () Bool)

(assert (= bs!26487 d!114043))

(declare-fun m!877035 () Bool)

(assert (=> bs!26487 m!877035))

(assert (=> bs!26487 m!877035))

(declare-fun m!877037 () Bool)

(assert (=> bs!26487 m!877037))

(assert (=> b!943405 d!114043))

(declare-fun d!114045 () Bool)

(declare-fun isEmpty!705 (Option!494) Bool)

(assert (=> d!114045 (= (isDefined!360 (getValueByKey!488 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756)) (not (isEmpty!705 (getValueByKey!488 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))))

(declare-fun bs!26488 () Bool)

(assert (= bs!26488 d!114045))

(assert (=> bs!26488 m!876965))

(declare-fun m!877039 () Bool)

(assert (=> bs!26488 m!877039))

(assert (=> b!943356 d!114045))

(declare-fun d!114047 () Bool)

(declare-fun c!98224 () Bool)

(assert (=> d!114047 (= c!98224 (and ((_ is Cons!19257) (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (= (_1!6758 (h!20407 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)))))

(declare-fun e!530452 () Option!494)

(assert (=> d!114047 (= (getValueByKey!488 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756) e!530452)))

(declare-fun b!943456 () Bool)

(assert (=> b!943456 (= e!530452 (Some!493 (_2!6758 (h!20407 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))))))

(declare-fun b!943459 () Bool)

(declare-fun e!530453 () Option!494)

(assert (=> b!943459 (= e!530453 None!492)))

(declare-fun b!943458 () Bool)

(assert (=> b!943458 (= e!530453 (getValueByKey!488 (t!27567 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) key!756))))

(declare-fun b!943457 () Bool)

(assert (=> b!943457 (= e!530452 e!530453)))

(declare-fun c!98225 () Bool)

(assert (=> b!943457 (= c!98225 (and ((_ is Cons!19257) (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (not (= (_1!6758 (h!20407 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756))))))

(assert (= (and d!114047 c!98224) b!943456))

(assert (= (and d!114047 (not c!98224)) b!943457))

(assert (= (and b!943457 c!98225) b!943458))

(assert (= (and b!943457 (not c!98225)) b!943459))

(declare-fun m!877041 () Bool)

(assert (=> b!943458 m!877041))

(assert (=> b!943356 d!114047))

(declare-fun d!114049 () Bool)

(assert (=> d!114049 (isDefined!360 (getValueByKey!488 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-fun lt!425132 () Unit!31699)

(declare-fun choose!1575 (List!19261 (_ BitVec 64)) Unit!31699)

(assert (=> d!114049 (= lt!425132 (choose!1575 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-fun e!530456 () Bool)

(assert (=> d!114049 e!530456))

(declare-fun res!633921 () Bool)

(assert (=> d!114049 (=> (not res!633921) (not e!530456))))

(declare-fun isStrictlySorted!501 (List!19261) Bool)

(assert (=> d!114049 (= res!633921 (isStrictlySorted!501 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))))

(assert (=> d!114049 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756) lt!425132)))

(declare-fun b!943462 () Bool)

(assert (=> b!943462 (= e!530456 (containsKey!452 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(assert (= (and d!114049 res!633921) b!943462))

(assert (=> d!114049 m!876965))

(assert (=> d!114049 m!876965))

(assert (=> d!114049 m!876967))

(declare-fun m!877043 () Bool)

(assert (=> d!114049 m!877043))

(declare-fun m!877045 () Bool)

(assert (=> d!114049 m!877045))

(assert (=> b!943462 m!876961))

(assert (=> b!943354 d!114049))

(assert (=> b!943354 d!114045))

(assert (=> b!943354 d!114047))

(declare-fun d!114051 () Bool)

(declare-fun e!530458 () Bool)

(assert (=> d!114051 e!530458))

(declare-fun res!633922 () Bool)

(assert (=> d!114051 (=> res!633922 e!530458)))

(declare-fun lt!425133 () Bool)

(assert (=> d!114051 (= res!633922 (not lt!425133))))

(declare-fun lt!425134 () Bool)

(assert (=> d!114051 (= lt!425133 lt!425134)))

(declare-fun lt!425136 () Unit!31699)

(declare-fun e!530457 () Unit!31699)

(assert (=> d!114051 (= lt!425136 e!530457)))

(declare-fun c!98226 () Bool)

(assert (=> d!114051 (= c!98226 lt!425134)))

(assert (=> d!114051 (= lt!425134 (containsKey!452 (toList!6106 lt!425116) (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114051 (= (contains!5119 lt!425116 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)) lt!425133)))

(declare-fun b!943463 () Bool)

(declare-fun lt!425135 () Unit!31699)

(assert (=> b!943463 (= e!530457 lt!425135)))

(assert (=> b!943463 (= lt!425135 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6106 lt!425116) (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943463 (isDefined!360 (getValueByKey!488 (toList!6106 lt!425116) (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943464 () Bool)

(declare-fun Unit!31703 () Unit!31699)

(assert (=> b!943464 (= e!530457 Unit!31703)))

(declare-fun b!943465 () Bool)

(assert (=> b!943465 (= e!530458 (isDefined!360 (getValueByKey!488 (toList!6106 lt!425116) (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114051 c!98226) b!943463))

(assert (= (and d!114051 (not c!98226)) b!943464))

(assert (= (and d!114051 (not res!633922)) b!943465))

(assert (=> d!114051 m!876935))

(declare-fun m!877047 () Bool)

(assert (=> d!114051 m!877047))

(assert (=> b!943463 m!876935))

(declare-fun m!877049 () Bool)

(assert (=> b!943463 m!877049))

(assert (=> b!943463 m!876935))

(declare-fun m!877051 () Bool)

(assert (=> b!943463 m!877051))

(assert (=> b!943463 m!877051))

(declare-fun m!877053 () Bool)

(assert (=> b!943463 m!877053))

(assert (=> b!943465 m!876935))

(assert (=> b!943465 m!877051))

(assert (=> b!943465 m!877051))

(assert (=> b!943465 m!877053))

(assert (=> b!943418 d!114051))

(declare-fun d!114053 () Bool)

(declare-fun res!633923 () Bool)

(declare-fun e!530459 () Bool)

(assert (=> d!114053 (=> res!633923 e!530459)))

(assert (=> d!114053 (= res!633923 (= (select (arr!27408 (_keys!10511 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114053 (= (arrayContainsKey!0 (_keys!10511 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!530459)))

(declare-fun b!943466 () Bool)

(declare-fun e!530460 () Bool)

(assert (=> b!943466 (= e!530459 e!530460)))

(declare-fun res!633924 () Bool)

(assert (=> b!943466 (=> (not res!633924) (not e!530460))))

(assert (=> b!943466 (= res!633924 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun b!943467 () Bool)

(assert (=> b!943467 (= e!530460 (arrayContainsKey!0 (_keys!10511 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114053 (not res!633923)) b!943466))

(assert (= (and b!943466 res!633924) b!943467))

(declare-fun m!877055 () Bool)

(assert (=> d!114053 m!877055))

(declare-fun m!877057 () Bool)

(assert (=> b!943467 m!877057))

(assert (=> b!943314 d!114053))

(declare-fun d!114055 () Bool)

(assert (=> d!114055 (= (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!943417 d!114055))

(declare-fun b!943478 () Bool)

(declare-fun e!530470 () Bool)

(declare-fun e!530469 () Bool)

(assert (=> b!943478 (= e!530470 e!530469)))

(declare-fun res!633932 () Bool)

(assert (=> b!943478 (=> (not res!633932) (not e!530469))))

(declare-fun e!530472 () Bool)

(assert (=> b!943478 (= res!633932 (not e!530472))))

(declare-fun res!633933 () Bool)

(assert (=> b!943478 (=> (not res!633933) (not e!530472))))

(assert (=> b!943478 (= res!633933 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114057 () Bool)

(declare-fun res!633931 () Bool)

(assert (=> d!114057 (=> res!633931 e!530470)))

(assert (=> d!114057 (= res!633931 (bvsge #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> d!114057 (= (arrayNoDuplicates!0 (_keys!10511 thiss!1141) #b00000000000000000000000000000000 Nil!19260) e!530470)))

(declare-fun b!943479 () Bool)

(declare-fun e!530471 () Bool)

(assert (=> b!943479 (= e!530469 e!530471)))

(declare-fun c!98229 () Bool)

(assert (=> b!943479 (= c!98229 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943480 () Bool)

(declare-fun call!40963 () Bool)

(assert (=> b!943480 (= e!530471 call!40963)))

(declare-fun b!943481 () Bool)

(declare-fun contains!5121 (List!19263 (_ BitVec 64)) Bool)

(assert (=> b!943481 (= e!530472 (contains!5121 Nil!19260 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!40960 () Bool)

(assert (=> bm!40960 (= call!40963 (arrayNoDuplicates!0 (_keys!10511 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98229 (Cons!19259 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000) Nil!19260) Nil!19260)))))

(declare-fun b!943482 () Bool)

(assert (=> b!943482 (= e!530471 call!40963)))

(assert (= (and d!114057 (not res!633931)) b!943478))

(assert (= (and b!943478 res!633933) b!943481))

(assert (= (and b!943478 res!633932) b!943479))

(assert (= (and b!943479 c!98229) b!943480))

(assert (= (and b!943479 (not c!98229)) b!943482))

(assert (= (or b!943480 b!943482) bm!40960))

(assert (=> b!943478 m!876935))

(assert (=> b!943478 m!876935))

(assert (=> b!943478 m!876977))

(assert (=> b!943479 m!876935))

(assert (=> b!943479 m!876935))

(assert (=> b!943479 m!876977))

(assert (=> b!943481 m!876935))

(assert (=> b!943481 m!876935))

(declare-fun m!877059 () Bool)

(assert (=> b!943481 m!877059))

(assert (=> bm!40960 m!876935))

(declare-fun m!877061 () Bool)

(assert (=> bm!40960 m!877061))

(assert (=> b!943347 d!114057))

(declare-fun b!943491 () Bool)

(declare-fun e!530481 () Bool)

(declare-fun call!40966 () Bool)

(assert (=> b!943491 (= e!530481 call!40966)))

(declare-fun b!943492 () Bool)

(declare-fun e!530480 () Bool)

(declare-fun e!530479 () Bool)

(assert (=> b!943492 (= e!530480 e!530479)))

(declare-fun c!98232 () Bool)

(assert (=> b!943492 (= c!98232 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943493 () Bool)

(assert (=> b!943493 (= e!530479 call!40966)))

(declare-fun b!943494 () Bool)

(assert (=> b!943494 (= e!530479 e!530481)))

(declare-fun lt!425143 () (_ BitVec 64))

(assert (=> b!943494 (= lt!425143 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425144 () Unit!31699)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56963 (_ BitVec 64) (_ BitVec 32)) Unit!31699)

(assert (=> b!943494 (= lt!425144 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10511 thiss!1141) lt!425143 #b00000000000000000000000000000000))))

(assert (=> b!943494 (arrayContainsKey!0 (_keys!10511 thiss!1141) lt!425143 #b00000000000000000000000000000000)))

(declare-fun lt!425145 () Unit!31699)

(assert (=> b!943494 (= lt!425145 lt!425144)))

(declare-fun res!633938 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56963 (_ BitVec 32)) SeekEntryResult!9052)

(assert (=> b!943494 (= res!633938 (= (seekEntryOrOpen!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000) (_keys!10511 thiss!1141) (mask!27265 thiss!1141)) (Found!9052 #b00000000000000000000000000000000)))))

(assert (=> b!943494 (=> (not res!633938) (not e!530481))))

(declare-fun bm!40963 () Bool)

(assert (=> bm!40963 (= call!40966 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10511 thiss!1141) (mask!27265 thiss!1141)))))

(declare-fun d!114059 () Bool)

(declare-fun res!633939 () Bool)

(assert (=> d!114059 (=> res!633939 e!530480)))

(assert (=> d!114059 (= res!633939 (bvsge #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> d!114059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)) e!530480)))

(assert (= (and d!114059 (not res!633939)) b!943492))

(assert (= (and b!943492 c!98232) b!943494))

(assert (= (and b!943492 (not c!98232)) b!943493))

(assert (= (and b!943494 res!633938) b!943491))

(assert (= (or b!943491 b!943493) bm!40963))

(assert (=> b!943492 m!876935))

(assert (=> b!943492 m!876935))

(assert (=> b!943492 m!876977))

(assert (=> b!943494 m!876935))

(declare-fun m!877063 () Bool)

(assert (=> b!943494 m!877063))

(declare-fun m!877065 () Bool)

(assert (=> b!943494 m!877065))

(assert (=> b!943494 m!876935))

(declare-fun m!877067 () Bool)

(assert (=> b!943494 m!877067))

(declare-fun m!877069 () Bool)

(assert (=> bm!40963 m!877069))

(assert (=> b!943346 d!114059))

(declare-fun d!114061 () Bool)

(declare-fun e!530483 () Bool)

(assert (=> d!114061 e!530483))

(declare-fun res!633940 () Bool)

(assert (=> d!114061 (=> res!633940 e!530483)))

(declare-fun lt!425146 () Bool)

(assert (=> d!114061 (= res!633940 (not lt!425146))))

(declare-fun lt!425147 () Bool)

(assert (=> d!114061 (= lt!425146 lt!425147)))

(declare-fun lt!425149 () Unit!31699)

(declare-fun e!530482 () Unit!31699)

(assert (=> d!114061 (= lt!425149 e!530482)))

(declare-fun c!98233 () Bool)

(assert (=> d!114061 (= c!98233 lt!425147)))

(assert (=> d!114061 (= lt!425147 (containsKey!452 (toList!6106 lt!425116) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114061 (= (contains!5119 lt!425116 #b1000000000000000000000000000000000000000000000000000000000000000) lt!425146)))

(declare-fun b!943495 () Bool)

(declare-fun lt!425148 () Unit!31699)

(assert (=> b!943495 (= e!530482 lt!425148)))

(assert (=> b!943495 (= lt!425148 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6106 lt!425116) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943495 (isDefined!360 (getValueByKey!488 (toList!6106 lt!425116) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943496 () Bool)

(declare-fun Unit!31704 () Unit!31699)

(assert (=> b!943496 (= e!530482 Unit!31704)))

(declare-fun b!943497 () Bool)

(assert (=> b!943497 (= e!530483 (isDefined!360 (getValueByKey!488 (toList!6106 lt!425116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114061 c!98233) b!943495))

(assert (= (and d!114061 (not c!98233)) b!943496))

(assert (= (and d!114061 (not res!633940)) b!943497))

(declare-fun m!877071 () Bool)

(assert (=> d!114061 m!877071))

(declare-fun m!877073 () Bool)

(assert (=> b!943495 m!877073))

(declare-fun m!877075 () Bool)

(assert (=> b!943495 m!877075))

(assert (=> b!943495 m!877075))

(declare-fun m!877077 () Bool)

(assert (=> b!943495 m!877077))

(assert (=> b!943497 m!877075))

(assert (=> b!943497 m!877075))

(assert (=> b!943497 m!877077))

(assert (=> bm!40951 d!114061))

(declare-fun b!943506 () Bool)

(declare-fun res!633952 () Bool)

(declare-fun e!530486 () Bool)

(assert (=> b!943506 (=> (not res!633952) (not e!530486))))

(assert (=> b!943506 (= res!633952 (and (= (size!27874 (_values!5665 thiss!1141)) (bvadd (mask!27265 thiss!1141) #b00000000000000000000000000000001)) (= (size!27875 (_keys!10511 thiss!1141)) (size!27874 (_values!5665 thiss!1141))) (bvsge (_size!2406 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2406 thiss!1141) (bvadd (mask!27265 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114063 () Bool)

(declare-fun res!633949 () Bool)

(assert (=> d!114063 (=> (not res!633949) (not e!530486))))

(assert (=> d!114063 (= res!633949 (validMask!0 (mask!27265 thiss!1141)))))

(assert (=> d!114063 (= (simpleValid!348 thiss!1141) e!530486)))

(declare-fun b!943509 () Bool)

(assert (=> b!943509 (= e!530486 (and (bvsge (extraKeys!5374 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5374 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2406 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!943507 () Bool)

(declare-fun res!633951 () Bool)

(assert (=> b!943507 (=> (not res!633951) (not e!530486))))

(declare-fun size!27880 (LongMapFixedSize!4702) (_ BitVec 32))

(assert (=> b!943507 (= res!633951 (bvsge (size!27880 thiss!1141) (_size!2406 thiss!1141)))))

(declare-fun b!943508 () Bool)

(declare-fun res!633950 () Bool)

(assert (=> b!943508 (=> (not res!633950) (not e!530486))))

(assert (=> b!943508 (= res!633950 (= (size!27880 thiss!1141) (bvadd (_size!2406 thiss!1141) (bvsdiv (bvadd (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!114063 res!633949) b!943506))

(assert (= (and b!943506 res!633952) b!943507))

(assert (= (and b!943507 res!633951) b!943508))

(assert (= (and b!943508 res!633950) b!943509))

(assert (=> d!114063 m!876941))

(declare-fun m!877079 () Bool)

(assert (=> b!943507 m!877079))

(assert (=> b!943508 m!877079))

(assert (=> d!114035 d!114063))

(declare-fun b!943534 () Bool)

(declare-fun e!530507 () Bool)

(declare-fun e!530505 () Bool)

(assert (=> b!943534 (= e!530507 e!530505)))

(declare-fun c!98243 () Bool)

(declare-fun e!530504 () Bool)

(assert (=> b!943534 (= c!98243 e!530504)))

(declare-fun res!633964 () Bool)

(assert (=> b!943534 (=> (not res!633964) (not e!530504))))

(assert (=> b!943534 (= res!633964 (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun b!943535 () Bool)

(declare-fun e!530506 () Bool)

(declare-fun lt!425165 () ListLongMap!12181)

(assert (=> b!943535 (= e!530506 (= lt!425165 (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5642 thiss!1141))))))

(declare-fun b!943536 () Bool)

(declare-fun e!530502 () Bool)

(assert (=> b!943536 (= e!530505 e!530502)))

(assert (=> b!943536 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun res!633961 () Bool)

(assert (=> b!943536 (= res!633961 (contains!5119 lt!425165 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943536 (=> (not res!633961) (not e!530502))))

(declare-fun d!114065 () Bool)

(assert (=> d!114065 e!530507))

(declare-fun res!633962 () Bool)

(assert (=> d!114065 (=> (not res!633962) (not e!530507))))

(assert (=> d!114065 (= res!633962 (not (contains!5119 lt!425165 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!530503 () ListLongMap!12181)

(assert (=> d!114065 (= lt!425165 e!530503)))

(declare-fun c!98245 () Bool)

(assert (=> d!114065 (= c!98245 (bvsge #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> d!114065 (validMask!0 (mask!27265 thiss!1141))))

(assert (=> d!114065 (= (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) lt!425165)))

(declare-fun b!943537 () Bool)

(assert (=> b!943537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> b!943537 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27874 (_values!5665 thiss!1141))))))

(assert (=> b!943537 (= e!530502 (= (apply!859 lt!425165 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)) (get!14421 (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1625 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943538 () Bool)

(declare-fun e!530501 () ListLongMap!12181)

(assert (=> b!943538 (= e!530503 e!530501)))

(declare-fun c!98242 () Bool)

(assert (=> b!943538 (= c!98242 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943539 () Bool)

(declare-fun call!40969 () ListLongMap!12181)

(assert (=> b!943539 (= e!530501 call!40969)))

(declare-fun b!943540 () Bool)

(assert (=> b!943540 (= e!530504 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!943540 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!943541 () Bool)

(declare-fun res!633963 () Bool)

(assert (=> b!943541 (=> (not res!633963) (not e!530507))))

(assert (=> b!943541 (= res!633963 (not (contains!5119 lt!425165 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!943542 () Bool)

(declare-fun lt!425169 () Unit!31699)

(declare-fun lt!425166 () Unit!31699)

(assert (=> b!943542 (= lt!425169 lt!425166)))

(declare-fun lt!425167 () (_ BitVec 64))

(declare-fun lt!425164 () ListLongMap!12181)

(declare-fun lt!425170 () V!32319)

(declare-fun lt!425168 () (_ BitVec 64))

(assert (=> b!943542 (not (contains!5119 (+!2869 lt!425164 (tuple2!13495 lt!425167 lt!425170)) lt!425168))))

(declare-fun addStillNotContains!223 (ListLongMap!12181 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31699)

(assert (=> b!943542 (= lt!425166 (addStillNotContains!223 lt!425164 lt!425167 lt!425170 lt!425168))))

(assert (=> b!943542 (= lt!425168 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!943542 (= lt!425170 (get!14421 (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1625 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!943542 (= lt!425167 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!943542 (= lt!425164 call!40969)))

(assert (=> b!943542 (= e!530501 (+!2869 call!40969 (tuple2!13495 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000) (get!14421 (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1625 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!943543 () Bool)

(assert (=> b!943543 (= e!530503 (ListLongMap!12182 Nil!19258))))

(declare-fun b!943544 () Bool)

(assert (=> b!943544 (= e!530505 e!530506)))

(declare-fun c!98244 () Bool)

(assert (=> b!943544 (= c!98244 (bvslt #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun bm!40966 () Bool)

(assert (=> bm!40966 (= call!40969 (getCurrentListMapNoExtraKeys!3341 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5642 thiss!1141)))))

(declare-fun b!943545 () Bool)

(declare-fun isEmpty!706 (ListLongMap!12181) Bool)

(assert (=> b!943545 (= e!530506 (isEmpty!706 lt!425165))))

(assert (= (and d!114065 c!98245) b!943543))

(assert (= (and d!114065 (not c!98245)) b!943538))

(assert (= (and b!943538 c!98242) b!943542))

(assert (= (and b!943538 (not c!98242)) b!943539))

(assert (= (or b!943542 b!943539) bm!40966))

(assert (= (and d!114065 res!633962) b!943541))

(assert (= (and b!943541 res!633963) b!943534))

(assert (= (and b!943534 res!633964) b!943540))

(assert (= (and b!943534 c!98243) b!943536))

(assert (= (and b!943534 (not c!98243)) b!943544))

(assert (= (and b!943536 res!633961) b!943537))

(assert (= (and b!943544 c!98244) b!943535))

(assert (= (and b!943544 (not c!98244)) b!943545))

(declare-fun b_lambda!14265 () Bool)

(assert (=> (not b_lambda!14265) (not b!943537)))

(assert (=> b!943537 t!27570))

(declare-fun b_and!29401 () Bool)

(assert (= b_and!29399 (and (=> t!27570 result!12187) b_and!29401)))

(declare-fun b_lambda!14267 () Bool)

(assert (=> (not b_lambda!14267) (not b!943542)))

(assert (=> b!943542 t!27570))

(declare-fun b_and!29403 () Bool)

(assert (= b_and!29401 (and (=> t!27570 result!12187) b_and!29403)))

(declare-fun m!877081 () Bool)

(assert (=> b!943542 m!877081))

(declare-fun m!877083 () Bool)

(assert (=> b!943542 m!877083))

(declare-fun m!877085 () Bool)

(assert (=> b!943542 m!877085))

(assert (=> b!943542 m!876935))

(assert (=> b!943542 m!877085))

(declare-fun m!877087 () Bool)

(assert (=> b!943542 m!877087))

(assert (=> b!943542 m!876969))

(assert (=> b!943542 m!876971))

(assert (=> b!943542 m!876975))

(assert (=> b!943542 m!876971))

(assert (=> b!943542 m!876969))

(declare-fun m!877089 () Bool)

(assert (=> b!943535 m!877089))

(assert (=> b!943538 m!876935))

(assert (=> b!943538 m!876935))

(assert (=> b!943538 m!876977))

(declare-fun m!877091 () Bool)

(assert (=> b!943545 m!877091))

(declare-fun m!877093 () Bool)

(assert (=> b!943541 m!877093))

(assert (=> b!943540 m!876935))

(assert (=> b!943540 m!876935))

(assert (=> b!943540 m!876977))

(assert (=> b!943536 m!876935))

(assert (=> b!943536 m!876935))

(declare-fun m!877095 () Bool)

(assert (=> b!943536 m!877095))

(assert (=> bm!40966 m!877089))

(assert (=> b!943537 m!876935))

(declare-fun m!877097 () Bool)

(assert (=> b!943537 m!877097))

(assert (=> b!943537 m!876935))

(assert (=> b!943537 m!876969))

(assert (=> b!943537 m!876971))

(assert (=> b!943537 m!876975))

(assert (=> b!943537 m!876971))

(assert (=> b!943537 m!876969))

(declare-fun m!877099 () Bool)

(assert (=> d!114065 m!877099))

(assert (=> d!114065 m!876941))

(assert (=> bm!40957 d!114065))

(declare-fun d!114067 () Bool)

(declare-fun lt!425173 () (_ BitVec 32))

(assert (=> d!114067 (and (bvsge lt!425173 #b00000000000000000000000000000000) (bvsle lt!425173 (bvsub (size!27875 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!530513 () (_ BitVec 32))

(assert (=> d!114067 (= lt!425173 e!530513)))

(declare-fun c!98251 () Bool)

(assert (=> d!114067 (= c!98251 (bvsge #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> d!114067 (and (bvsle #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27875 (_keys!10511 thiss!1141)) (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> d!114067 (= (arrayCountValidKeys!0 (_keys!10511 thiss!1141) #b00000000000000000000000000000000 (size!27875 (_keys!10511 thiss!1141))) lt!425173)))

(declare-fun b!943554 () Bool)

(declare-fun e!530512 () (_ BitVec 32))

(declare-fun call!40972 () (_ BitVec 32))

(assert (=> b!943554 (= e!530512 (bvadd #b00000000000000000000000000000001 call!40972))))

(declare-fun bm!40969 () Bool)

(assert (=> bm!40969 (= call!40972 (arrayCountValidKeys!0 (_keys!10511 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun b!943555 () Bool)

(assert (=> b!943555 (= e!530513 #b00000000000000000000000000000000)))

(declare-fun b!943556 () Bool)

(assert (=> b!943556 (= e!530513 e!530512)))

(declare-fun c!98250 () Bool)

(assert (=> b!943556 (= c!98250 (validKeyInArray!0 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!943557 () Bool)

(assert (=> b!943557 (= e!530512 call!40972)))

(assert (= (and d!114067 c!98251) b!943555))

(assert (= (and d!114067 (not c!98251)) b!943556))

(assert (= (and b!943556 c!98250) b!943554))

(assert (= (and b!943556 (not c!98250)) b!943557))

(assert (= (or b!943554 b!943557) bm!40969))

(declare-fun m!877101 () Bool)

(assert (=> bm!40969 m!877101))

(assert (=> b!943556 m!876935))

(assert (=> b!943556 m!876935))

(assert (=> b!943556 m!876977))

(assert (=> b!943345 d!114067))

(declare-fun d!114069 () Bool)

(assert (=> d!114069 (= (apply!859 lt!425116 (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000)) (get!14422 (getValueByKey!488 (toList!6106 lt!425116) (select (arr!27408 (_keys!10511 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26489 () Bool)

(assert (= bs!26489 d!114069))

(assert (=> bs!26489 m!876935))

(assert (=> bs!26489 m!877051))

(assert (=> bs!26489 m!877051))

(declare-fun m!877103 () Bool)

(assert (=> bs!26489 m!877103))

(assert (=> b!943414 d!114069))

(declare-fun d!114071 () Bool)

(declare-fun c!98254 () Bool)

(assert (=> d!114071 (= c!98254 ((_ is ValueCellFull!9776) (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!530516 () V!32319)

(assert (=> d!114071 (= (get!14421 (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1625 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!530516)))

(declare-fun b!943562 () Bool)

(declare-fun get!14423 (ValueCell!9776 V!32319) V!32319)

(assert (=> b!943562 (= e!530516 (get!14423 (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1625 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!943563 () Bool)

(declare-fun get!14424 (ValueCell!9776 V!32319) V!32319)

(assert (=> b!943563 (= e!530516 (get!14424 (select (arr!27407 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1625 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114071 c!98254) b!943562))

(assert (= (and d!114071 (not c!98254)) b!943563))

(assert (=> b!943562 m!876969))

(assert (=> b!943562 m!876971))

(declare-fun m!877105 () Bool)

(assert (=> b!943562 m!877105))

(assert (=> b!943563 m!876969))

(assert (=> b!943563 m!876971))

(declare-fun m!877107 () Bool)

(assert (=> b!943563 m!877107))

(assert (=> b!943414 d!114071))

(declare-fun b!943582 () Bool)

(declare-fun e!530527 () SeekEntryResult!9052)

(declare-fun e!530530 () SeekEntryResult!9052)

(assert (=> b!943582 (= e!530527 e!530530)))

(declare-fun c!98263 () Bool)

(declare-fun lt!425179 () (_ BitVec 64))

(assert (=> b!943582 (= c!98263 (or (= lt!425179 key!756) (= (bvadd lt!425179 lt!425179) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!943583 () Bool)

(declare-fun lt!425178 () SeekEntryResult!9052)

(assert (=> b!943583 (and (bvsge (index!38581 lt!425178) #b00000000000000000000000000000000) (bvslt (index!38581 lt!425178) (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun res!633971 () Bool)

(assert (=> b!943583 (= res!633971 (= (select (arr!27408 (_keys!10511 thiss!1141)) (index!38581 lt!425178)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!530528 () Bool)

(assert (=> b!943583 (=> res!633971 e!530528)))

(declare-fun b!943584 () Bool)

(assert (=> b!943584 (and (bvsge (index!38581 lt!425178) #b00000000000000000000000000000000) (bvslt (index!38581 lt!425178) (size!27875 (_keys!10511 thiss!1141))))))

(declare-fun res!633973 () Bool)

(assert (=> b!943584 (= res!633973 (= (select (arr!27408 (_keys!10511 thiss!1141)) (index!38581 lt!425178)) key!756))))

(assert (=> b!943584 (=> res!633973 e!530528)))

(declare-fun e!530529 () Bool)

(assert (=> b!943584 (= e!530529 e!530528)))

(declare-fun b!943585 () Bool)

(assert (=> b!943585 (and (bvsge (index!38581 lt!425178) #b00000000000000000000000000000000) (bvslt (index!38581 lt!425178) (size!27875 (_keys!10511 thiss!1141))))))

(assert (=> b!943585 (= e!530528 (= (select (arr!27408 (_keys!10511 thiss!1141)) (index!38581 lt!425178)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943586 () Bool)

(assert (=> b!943586 (= e!530530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27265 thiss!1141)) #b00000000000000000000000000000000 (mask!27265 thiss!1141)) key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)))))

(declare-fun b!943588 () Bool)

(assert (=> b!943588 (= e!530527 (Intermediate!9052 true (toIndex!0 key!756 (mask!27265 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!943589 () Bool)

(assert (=> b!943589 (= e!530530 (Intermediate!9052 false (toIndex!0 key!756 (mask!27265 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!943590 () Bool)

(declare-fun e!530531 () Bool)

(assert (=> b!943590 (= e!530531 (bvsge (x!81024 lt!425178) #b01111111111111111111111111111110))))

(declare-fun d!114073 () Bool)

(assert (=> d!114073 e!530531))

(declare-fun c!98262 () Bool)

(assert (=> d!114073 (= c!98262 (and ((_ is Intermediate!9052) lt!425178) (undefined!9864 lt!425178)))))

(assert (=> d!114073 (= lt!425178 e!530527)))

(declare-fun c!98261 () Bool)

(assert (=> d!114073 (= c!98261 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!114073 (= lt!425179 (select (arr!27408 (_keys!10511 thiss!1141)) (toIndex!0 key!756 (mask!27265 thiss!1141))))))

(assert (=> d!114073 (validMask!0 (mask!27265 thiss!1141))))

(assert (=> d!114073 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27265 thiss!1141)) key!756 (_keys!10511 thiss!1141) (mask!27265 thiss!1141)) lt!425178)))

(declare-fun b!943587 () Bool)

(assert (=> b!943587 (= e!530531 e!530529)))

(declare-fun res!633972 () Bool)

(assert (=> b!943587 (= res!633972 (and ((_ is Intermediate!9052) lt!425178) (not (undefined!9864 lt!425178)) (bvslt (x!81024 lt!425178) #b01111111111111111111111111111110) (bvsge (x!81024 lt!425178) #b00000000000000000000000000000000) (bvsge (x!81024 lt!425178) #b00000000000000000000000000000000)))))

(assert (=> b!943587 (=> (not res!633972) (not e!530529))))

(assert (= (and d!114073 c!98261) b!943588))

(assert (= (and d!114073 (not c!98261)) b!943582))

(assert (= (and b!943582 c!98263) b!943589))

(assert (= (and b!943582 (not c!98263)) b!943586))

(assert (= (and d!114073 c!98262) b!943590))

(assert (= (and d!114073 (not c!98262)) b!943587))

(assert (= (and b!943587 res!633972) b!943584))

(assert (= (and b!943584 (not res!633973)) b!943583))

(assert (= (and b!943583 (not res!633971)) b!943585))

(assert (=> d!114073 m!876945))

(declare-fun m!877109 () Bool)

(assert (=> d!114073 m!877109))

(assert (=> d!114073 m!876941))

(declare-fun m!877111 () Bool)

(assert (=> b!943585 m!877111))

(assert (=> b!943586 m!876945))

(declare-fun m!877113 () Bool)

(assert (=> b!943586 m!877113))

(assert (=> b!943586 m!877113))

(declare-fun m!877115 () Bool)

(assert (=> b!943586 m!877115))

(assert (=> b!943583 m!877111))

(assert (=> b!943584 m!877111))

(assert (=> d!114033 d!114073))

(declare-fun d!114075 () Bool)

(declare-fun lt!425185 () (_ BitVec 32))

(declare-fun lt!425184 () (_ BitVec 32))

(assert (=> d!114075 (= lt!425185 (bvmul (bvxor lt!425184 (bvlshr lt!425184 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114075 (= lt!425184 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114075 (and (bvsge (mask!27265 thiss!1141) #b00000000000000000000000000000000) (let ((res!633974 (let ((h!20410 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81042 (bvmul (bvxor h!20410 (bvlshr h!20410 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81042 (bvlshr x!81042 #b00000000000000000000000000001101)) (mask!27265 thiss!1141)))))) (and (bvslt res!633974 (bvadd (mask!27265 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633974 #b00000000000000000000000000000000))))))

(assert (=> d!114075 (= (toIndex!0 key!756 (mask!27265 thiss!1141)) (bvand (bvxor lt!425185 (bvlshr lt!425185 #b00000000000000000000000000001101)) (mask!27265 thiss!1141)))))

(assert (=> d!114033 d!114075))

(declare-fun d!114077 () Bool)

(assert (=> d!114077 (= (validMask!0 (mask!27265 thiss!1141)) (and (or (= (mask!27265 thiss!1141) #b00000000000000000000000000000111) (= (mask!27265 thiss!1141) #b00000000000000000000000000001111) (= (mask!27265 thiss!1141) #b00000000000000000000000000011111) (= (mask!27265 thiss!1141) #b00000000000000000000000000111111) (= (mask!27265 thiss!1141) #b00000000000000000000000001111111) (= (mask!27265 thiss!1141) #b00000000000000000000000011111111) (= (mask!27265 thiss!1141) #b00000000000000000000000111111111) (= (mask!27265 thiss!1141) #b00000000000000000000001111111111) (= (mask!27265 thiss!1141) #b00000000000000000000011111111111) (= (mask!27265 thiss!1141) #b00000000000000000000111111111111) (= (mask!27265 thiss!1141) #b00000000000000000001111111111111) (= (mask!27265 thiss!1141) #b00000000000000000011111111111111) (= (mask!27265 thiss!1141) #b00000000000000000111111111111111) (= (mask!27265 thiss!1141) #b00000000000000001111111111111111) (= (mask!27265 thiss!1141) #b00000000000000011111111111111111) (= (mask!27265 thiss!1141) #b00000000000000111111111111111111) (= (mask!27265 thiss!1141) #b00000000000001111111111111111111) (= (mask!27265 thiss!1141) #b00000000000011111111111111111111) (= (mask!27265 thiss!1141) #b00000000000111111111111111111111) (= (mask!27265 thiss!1141) #b00000000001111111111111111111111) (= (mask!27265 thiss!1141) #b00000000011111111111111111111111) (= (mask!27265 thiss!1141) #b00000000111111111111111111111111) (= (mask!27265 thiss!1141) #b00000001111111111111111111111111) (= (mask!27265 thiss!1141) #b00000011111111111111111111111111) (= (mask!27265 thiss!1141) #b00000111111111111111111111111111) (= (mask!27265 thiss!1141) #b00001111111111111111111111111111) (= (mask!27265 thiss!1141) #b00011111111111111111111111111111) (= (mask!27265 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27265 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> d!114033 d!114077))

(declare-fun d!114079 () Bool)

(declare-fun e!530534 () Bool)

(assert (=> d!114079 e!530534))

(declare-fun res!633980 () Bool)

(assert (=> d!114079 (=> (not res!633980) (not e!530534))))

(declare-fun lt!425197 () ListLongMap!12181)

(assert (=> d!114079 (= res!633980 (contains!5119 lt!425197 (_1!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141)))))))

(declare-fun lt!425194 () List!19261)

(assert (=> d!114079 (= lt!425197 (ListLongMap!12182 lt!425194))))

(declare-fun lt!425196 () Unit!31699)

(declare-fun lt!425195 () Unit!31699)

(assert (=> d!114079 (= lt!425196 lt!425195)))

(assert (=> d!114079 (= (getValueByKey!488 lt!425194 (_1!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!262 (List!19261 (_ BitVec 64) V!32319) Unit!31699)

(assert (=> d!114079 (= lt!425195 (lemmaContainsTupThenGetReturnValue!262 lt!425194 (_1!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141)))))))

(declare-fun insertStrictlySorted!319 (List!19261 (_ BitVec 64) V!32319) List!19261)

(assert (=> d!114079 (= lt!425194 (insertStrictlySorted!319 (toList!6106 lt!425113) (_1!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141)))))))

(assert (=> d!114079 (= (+!2869 lt!425113 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))) lt!425197)))

(declare-fun b!943595 () Bool)

(declare-fun res!633979 () Bool)

(assert (=> b!943595 (=> (not res!633979) (not e!530534))))

(assert (=> b!943595 (= res!633979 (= (getValueByKey!488 (toList!6106 lt!425197) (_1!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))))))))

(declare-fun b!943596 () Bool)

(declare-fun contains!5122 (List!19261 tuple2!13494) Bool)

(assert (=> b!943596 (= e!530534 (contains!5122 (toList!6106 lt!425197) (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))))))

(assert (= (and d!114079 res!633980) b!943595))

(assert (= (and b!943595 res!633979) b!943596))

(declare-fun m!877117 () Bool)

(assert (=> d!114079 m!877117))

(declare-fun m!877119 () Bool)

(assert (=> d!114079 m!877119))

(declare-fun m!877121 () Bool)

(assert (=> d!114079 m!877121))

(declare-fun m!877123 () Bool)

(assert (=> d!114079 m!877123))

(declare-fun m!877125 () Bool)

(assert (=> b!943595 m!877125))

(declare-fun m!877127 () Bool)

(assert (=> b!943596 m!877127))

(assert (=> b!943413 d!114079))

(declare-fun d!114081 () Bool)

(assert (=> d!114081 (= (apply!859 lt!425113 lt!425111) (get!14422 (getValueByKey!488 (toList!6106 lt!425113) lt!425111)))))

(declare-fun bs!26490 () Bool)

(assert (= bs!26490 d!114081))

(declare-fun m!877129 () Bool)

(assert (=> bs!26490 m!877129))

(assert (=> bs!26490 m!877129))

(declare-fun m!877131 () Bool)

(assert (=> bs!26490 m!877131))

(assert (=> b!943413 d!114081))

(declare-fun d!114083 () Bool)

(assert (=> d!114083 (= (apply!859 lt!425110 lt!425102) (get!14422 (getValueByKey!488 (toList!6106 lt!425110) lt!425102)))))

(declare-fun bs!26491 () Bool)

(assert (= bs!26491 d!114083))

(declare-fun m!877133 () Bool)

(assert (=> bs!26491 m!877133))

(assert (=> bs!26491 m!877133))

(declare-fun m!877135 () Bool)

(assert (=> bs!26491 m!877135))

(assert (=> b!943413 d!114083))

(declare-fun d!114085 () Bool)

(declare-fun e!530536 () Bool)

(assert (=> d!114085 e!530536))

(declare-fun res!633981 () Bool)

(assert (=> d!114085 (=> res!633981 e!530536)))

(declare-fun lt!425198 () Bool)

(assert (=> d!114085 (= res!633981 (not lt!425198))))

(declare-fun lt!425199 () Bool)

(assert (=> d!114085 (= lt!425198 lt!425199)))

(declare-fun lt!425201 () Unit!31699)

(declare-fun e!530535 () Unit!31699)

(assert (=> d!114085 (= lt!425201 e!530535)))

(declare-fun c!98264 () Bool)

(assert (=> d!114085 (= c!98264 lt!425199)))

(assert (=> d!114085 (= lt!425199 (containsKey!452 (toList!6106 (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))) lt!425123))))

(assert (=> d!114085 (= (contains!5119 (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))) lt!425123) lt!425198)))

(declare-fun b!943597 () Bool)

(declare-fun lt!425200 () Unit!31699)

(assert (=> b!943597 (= e!530535 lt!425200)))

(assert (=> b!943597 (= lt!425200 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6106 (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))) lt!425123))))

(assert (=> b!943597 (isDefined!360 (getValueByKey!488 (toList!6106 (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))) lt!425123))))

(declare-fun b!943598 () Bool)

(declare-fun Unit!31705 () Unit!31699)

(assert (=> b!943598 (= e!530535 Unit!31705)))

(declare-fun b!943599 () Bool)

(assert (=> b!943599 (= e!530536 (isDefined!360 (getValueByKey!488 (toList!6106 (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))) lt!425123)))))

(assert (= (and d!114085 c!98264) b!943597))

(assert (= (and d!114085 (not c!98264)) b!943598))

(assert (= (and d!114085 (not res!633981)) b!943599))

(declare-fun m!877137 () Bool)

(assert (=> d!114085 m!877137))

(declare-fun m!877139 () Bool)

(assert (=> b!943597 m!877139))

(declare-fun m!877141 () Bool)

(assert (=> b!943597 m!877141))

(assert (=> b!943597 m!877141))

(declare-fun m!877143 () Bool)

(assert (=> b!943597 m!877143))

(assert (=> b!943599 m!877141))

(assert (=> b!943599 m!877141))

(assert (=> b!943599 m!877143))

(assert (=> b!943413 d!114085))

(declare-fun d!114087 () Bool)

(declare-fun e!530537 () Bool)

(assert (=> d!114087 e!530537))

(declare-fun res!633983 () Bool)

(assert (=> d!114087 (=> (not res!633983) (not e!530537))))

(declare-fun lt!425205 () ListLongMap!12181)

(assert (=> d!114087 (= res!633983 (contains!5119 lt!425205 (_1!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141)))))))

(declare-fun lt!425202 () List!19261)

(assert (=> d!114087 (= lt!425205 (ListLongMap!12182 lt!425202))))

(declare-fun lt!425204 () Unit!31699)

(declare-fun lt!425203 () Unit!31699)

(assert (=> d!114087 (= lt!425204 lt!425203)))

(assert (=> d!114087 (= (getValueByKey!488 lt!425202 (_1!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141)))))))

(assert (=> d!114087 (= lt!425203 (lemmaContainsTupThenGetReturnValue!262 lt!425202 (_1!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141)))))))

(assert (=> d!114087 (= lt!425202 (insertStrictlySorted!319 (toList!6106 lt!425110) (_1!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141)))))))

(assert (=> d!114087 (= (+!2869 lt!425110 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))) lt!425205)))

(declare-fun b!943600 () Bool)

(declare-fun res!633982 () Bool)

(assert (=> b!943600 (=> (not res!633982) (not e!530537))))

(assert (=> b!943600 (= res!633982 (= (getValueByKey!488 (toList!6106 lt!425205) (_1!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))))))))

(declare-fun b!943601 () Bool)

(assert (=> b!943601 (= e!530537 (contains!5122 (toList!6106 lt!425205) (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))))))

(assert (= (and d!114087 res!633983) b!943600))

(assert (= (and b!943600 res!633982) b!943601))

(declare-fun m!877145 () Bool)

(assert (=> d!114087 m!877145))

(declare-fun m!877147 () Bool)

(assert (=> d!114087 m!877147))

(declare-fun m!877149 () Bool)

(assert (=> d!114087 m!877149))

(declare-fun m!877151 () Bool)

(assert (=> d!114087 m!877151))

(declare-fun m!877153 () Bool)

(assert (=> b!943600 m!877153))

(declare-fun m!877155 () Bool)

(assert (=> b!943601 m!877155))

(assert (=> b!943413 d!114087))

(declare-fun d!114089 () Bool)

(assert (=> d!114089 (= (apply!859 lt!425107 lt!425120) (get!14422 (getValueByKey!488 (toList!6106 lt!425107) lt!425120)))))

(declare-fun bs!26492 () Bool)

(assert (= bs!26492 d!114089))

(declare-fun m!877157 () Bool)

(assert (=> bs!26492 m!877157))

(assert (=> bs!26492 m!877157))

(declare-fun m!877159 () Bool)

(assert (=> bs!26492 m!877159))

(assert (=> b!943413 d!114089))

(declare-fun d!114091 () Bool)

(declare-fun e!530538 () Bool)

(assert (=> d!114091 e!530538))

(declare-fun res!633985 () Bool)

(assert (=> d!114091 (=> (not res!633985) (not e!530538))))

(declare-fun lt!425209 () ListLongMap!12181)

(assert (=> d!114091 (= res!633985 (contains!5119 lt!425209 (_1!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))))))

(declare-fun lt!425206 () List!19261)

(assert (=> d!114091 (= lt!425209 (ListLongMap!12182 lt!425206))))

(declare-fun lt!425208 () Unit!31699)

(declare-fun lt!425207 () Unit!31699)

(assert (=> d!114091 (= lt!425208 lt!425207)))

(assert (=> d!114091 (= (getValueByKey!488 lt!425206 (_1!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114091 (= lt!425207 (lemmaContainsTupThenGetReturnValue!262 lt!425206 (_1!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114091 (= lt!425206 (insertStrictlySorted!319 (toList!6106 lt!425118) (_1!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114091 (= (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))) lt!425209)))

(declare-fun b!943602 () Bool)

(declare-fun res!633984 () Bool)

(assert (=> b!943602 (=> (not res!633984) (not e!530538))))

(assert (=> b!943602 (= res!633984 (= (getValueByKey!488 (toList!6106 lt!425209) (_1!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))))))))

(declare-fun b!943603 () Bool)

(assert (=> b!943603 (= e!530538 (contains!5122 (toList!6106 lt!425209) (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))))))

(assert (= (and d!114091 res!633985) b!943602))

(assert (= (and b!943602 res!633984) b!943603))

(declare-fun m!877161 () Bool)

(assert (=> d!114091 m!877161))

(declare-fun m!877163 () Bool)

(assert (=> d!114091 m!877163))

(declare-fun m!877165 () Bool)

(assert (=> d!114091 m!877165))

(declare-fun m!877167 () Bool)

(assert (=> d!114091 m!877167))

(declare-fun m!877169 () Bool)

(assert (=> b!943602 m!877169))

(declare-fun m!877171 () Bool)

(assert (=> b!943603 m!877171))

(assert (=> b!943413 d!114091))

(declare-fun d!114093 () Bool)

(assert (=> d!114093 (= (apply!859 (+!2869 lt!425107 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))) lt!425120) (apply!859 lt!425107 lt!425120))))

(declare-fun lt!425212 () Unit!31699)

(declare-fun choose!1576 (ListLongMap!12181 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31699)

(assert (=> d!114093 (= lt!425212 (choose!1576 lt!425107 lt!425121 (zeroValue!5478 thiss!1141) lt!425120))))

(declare-fun e!530541 () Bool)

(assert (=> d!114093 e!530541))

(declare-fun res!633988 () Bool)

(assert (=> d!114093 (=> (not res!633988) (not e!530541))))

(assert (=> d!114093 (= res!633988 (contains!5119 lt!425107 lt!425120))))

(assert (=> d!114093 (= (addApplyDifferent!438 lt!425107 lt!425121 (zeroValue!5478 thiss!1141) lt!425120) lt!425212)))

(declare-fun b!943607 () Bool)

(assert (=> b!943607 (= e!530541 (not (= lt!425120 lt!425121)))))

(assert (= (and d!114093 res!633988) b!943607))

(assert (=> d!114093 m!876979))

(declare-fun m!877173 () Bool)

(assert (=> d!114093 m!877173))

(assert (=> d!114093 m!876983))

(declare-fun m!877175 () Bool)

(assert (=> d!114093 m!877175))

(assert (=> d!114093 m!876979))

(assert (=> d!114093 m!876981))

(assert (=> b!943413 d!114093))

(declare-fun d!114095 () Bool)

(assert (=> d!114095 (contains!5119 (+!2869 lt!425118 (tuple2!13495 lt!425119 (zeroValue!5478 thiss!1141))) lt!425123)))

(declare-fun lt!425215 () Unit!31699)

(declare-fun choose!1577 (ListLongMap!12181 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31699)

(assert (=> d!114095 (= lt!425215 (choose!1577 lt!425118 lt!425119 (zeroValue!5478 thiss!1141) lt!425123))))

(assert (=> d!114095 (contains!5119 lt!425118 lt!425123)))

(assert (=> d!114095 (= (addStillContains!558 lt!425118 lt!425119 (zeroValue!5478 thiss!1141) lt!425123) lt!425215)))

(declare-fun bs!26493 () Bool)

(assert (= bs!26493 d!114095))

(assert (=> bs!26493 m!876989))

(assert (=> bs!26493 m!876989))

(assert (=> bs!26493 m!876991))

(declare-fun m!877177 () Bool)

(assert (=> bs!26493 m!877177))

(declare-fun m!877179 () Bool)

(assert (=> bs!26493 m!877179))

(assert (=> b!943413 d!114095))

(declare-fun d!114097 () Bool)

(assert (=> d!114097 (= (apply!859 (+!2869 lt!425107 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))) lt!425120) (get!14422 (getValueByKey!488 (toList!6106 (+!2869 lt!425107 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141)))) lt!425120)))))

(declare-fun bs!26494 () Bool)

(assert (= bs!26494 d!114097))

(declare-fun m!877181 () Bool)

(assert (=> bs!26494 m!877181))

(assert (=> bs!26494 m!877181))

(declare-fun m!877183 () Bool)

(assert (=> bs!26494 m!877183))

(assert (=> b!943413 d!114097))

(declare-fun d!114099 () Bool)

(assert (=> d!114099 (= (apply!859 (+!2869 lt!425113 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))) lt!425111) (get!14422 (getValueByKey!488 (toList!6106 (+!2869 lt!425113 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141)))) lt!425111)))))

(declare-fun bs!26495 () Bool)

(assert (= bs!26495 d!114099))

(declare-fun m!877185 () Bool)

(assert (=> bs!26495 m!877185))

(assert (=> bs!26495 m!877185))

(declare-fun m!877187 () Bool)

(assert (=> bs!26495 m!877187))

(assert (=> b!943413 d!114099))

(declare-fun d!114101 () Bool)

(assert (=> d!114101 (= (apply!859 (+!2869 lt!425110 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))) lt!425102) (apply!859 lt!425110 lt!425102))))

(declare-fun lt!425216 () Unit!31699)

(assert (=> d!114101 (= lt!425216 (choose!1576 lt!425110 lt!425112 (minValue!5478 thiss!1141) lt!425102))))

(declare-fun e!530542 () Bool)

(assert (=> d!114101 e!530542))

(declare-fun res!633989 () Bool)

(assert (=> d!114101 (=> (not res!633989) (not e!530542))))

(assert (=> d!114101 (= res!633989 (contains!5119 lt!425110 lt!425102))))

(assert (=> d!114101 (= (addApplyDifferent!438 lt!425110 lt!425112 (minValue!5478 thiss!1141) lt!425102) lt!425216)))

(declare-fun b!943609 () Bool)

(assert (=> b!943609 (= e!530542 (not (= lt!425102 lt!425112)))))

(assert (= (and d!114101 res!633989) b!943609))

(assert (=> d!114101 m!877001))

(declare-fun m!877189 () Bool)

(assert (=> d!114101 m!877189))

(assert (=> d!114101 m!876999))

(declare-fun m!877191 () Bool)

(assert (=> d!114101 m!877191))

(assert (=> d!114101 m!877001))

(assert (=> d!114101 m!877005))

(assert (=> b!943413 d!114101))

(declare-fun d!114103 () Bool)

(assert (=> d!114103 (= (apply!859 (+!2869 lt!425110 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141))) lt!425102) (get!14422 (getValueByKey!488 (toList!6106 (+!2869 lt!425110 (tuple2!13495 lt!425112 (minValue!5478 thiss!1141)))) lt!425102)))))

(declare-fun bs!26496 () Bool)

(assert (= bs!26496 d!114103))

(declare-fun m!877193 () Bool)

(assert (=> bs!26496 m!877193))

(assert (=> bs!26496 m!877193))

(declare-fun m!877195 () Bool)

(assert (=> bs!26496 m!877195))

(assert (=> b!943413 d!114103))

(declare-fun d!114105 () Bool)

(declare-fun e!530543 () Bool)

(assert (=> d!114105 e!530543))

(declare-fun res!633991 () Bool)

(assert (=> d!114105 (=> (not res!633991) (not e!530543))))

(declare-fun lt!425220 () ListLongMap!12181)

(assert (=> d!114105 (= res!633991 (contains!5119 lt!425220 (_1!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141)))))))

(declare-fun lt!425217 () List!19261)

(assert (=> d!114105 (= lt!425220 (ListLongMap!12182 lt!425217))))

(declare-fun lt!425219 () Unit!31699)

(declare-fun lt!425218 () Unit!31699)

(assert (=> d!114105 (= lt!425219 lt!425218)))

(assert (=> d!114105 (= (getValueByKey!488 lt!425217 (_1!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114105 (= lt!425218 (lemmaContainsTupThenGetReturnValue!262 lt!425217 (_1!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114105 (= lt!425217 (insertStrictlySorted!319 (toList!6106 lt!425107) (_1!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114105 (= (+!2869 lt!425107 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))) lt!425220)))

(declare-fun b!943610 () Bool)

(declare-fun res!633990 () Bool)

(assert (=> b!943610 (=> (not res!633990) (not e!530543))))

(assert (=> b!943610 (= res!633990 (= (getValueByKey!488 (toList!6106 lt!425220) (_1!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))))))))

(declare-fun b!943611 () Bool)

(assert (=> b!943611 (= e!530543 (contains!5122 (toList!6106 lt!425220) (tuple2!13495 lt!425121 (zeroValue!5478 thiss!1141))))))

(assert (= (and d!114105 res!633991) b!943610))

(assert (= (and b!943610 res!633990) b!943611))

(declare-fun m!877197 () Bool)

(assert (=> d!114105 m!877197))

(declare-fun m!877199 () Bool)

(assert (=> d!114105 m!877199))

(declare-fun m!877201 () Bool)

(assert (=> d!114105 m!877201))

(declare-fun m!877203 () Bool)

(assert (=> d!114105 m!877203))

(declare-fun m!877205 () Bool)

(assert (=> b!943610 m!877205))

(declare-fun m!877207 () Bool)

(assert (=> b!943611 m!877207))

(assert (=> b!943413 d!114105))

(declare-fun d!114107 () Bool)

(assert (=> d!114107 (= (apply!859 (+!2869 lt!425113 (tuple2!13495 lt!425114 (minValue!5478 thiss!1141))) lt!425111) (apply!859 lt!425113 lt!425111))))

(declare-fun lt!425221 () Unit!31699)

(assert (=> d!114107 (= lt!425221 (choose!1576 lt!425113 lt!425114 (minValue!5478 thiss!1141) lt!425111))))

(declare-fun e!530544 () Bool)

(assert (=> d!114107 e!530544))

(declare-fun res!633992 () Bool)

(assert (=> d!114107 (=> (not res!633992) (not e!530544))))

(assert (=> d!114107 (= res!633992 (contains!5119 lt!425113 lt!425111))))

(assert (=> d!114107 (= (addApplyDifferent!438 lt!425113 lt!425114 (minValue!5478 thiss!1141) lt!425111) lt!425221)))

(declare-fun b!943612 () Bool)

(assert (=> b!943612 (= e!530544 (not (= lt!425111 lt!425114)))))

(assert (= (and d!114107 res!633992) b!943612))

(assert (=> d!114107 m!876995))

(declare-fun m!877209 () Bool)

(assert (=> d!114107 m!877209))

(assert (=> d!114107 m!876987))

(declare-fun m!877211 () Bool)

(assert (=> d!114107 m!877211))

(assert (=> d!114107 m!876995))

(assert (=> d!114107 m!876997))

(assert (=> b!943413 d!114107))

(assert (=> b!943413 d!114065))

(assert (=> d!114039 d!114077))

(assert (=> b!943412 d!114055))

(declare-fun d!114109 () Bool)

(assert (=> d!114109 (= (apply!859 lt!425116 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14422 (getValueByKey!488 (toList!6106 lt!425116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26497 () Bool)

(assert (= bs!26497 d!114109))

(assert (=> bs!26497 m!877075))

(assert (=> bs!26497 m!877075))

(declare-fun m!877213 () Bool)

(assert (=> bs!26497 m!877213))

(assert (=> b!943408 d!114109))

(declare-fun d!114111 () Bool)

(declare-fun e!530545 () Bool)

(assert (=> d!114111 e!530545))

(declare-fun res!633994 () Bool)

(assert (=> d!114111 (=> (not res!633994) (not e!530545))))

(declare-fun lt!425225 () ListLongMap!12181)

(assert (=> d!114111 (= res!633994 (contains!5119 lt!425225 (_1!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(declare-fun lt!425222 () List!19261)

(assert (=> d!114111 (= lt!425225 (ListLongMap!12182 lt!425222))))

(declare-fun lt!425224 () Unit!31699)

(declare-fun lt!425223 () Unit!31699)

(assert (=> d!114111 (= lt!425224 lt!425223)))

(assert (=> d!114111 (= (getValueByKey!488 lt!425222 (_1!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))) (Some!493 (_2!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(assert (=> d!114111 (= lt!425223 (lemmaContainsTupThenGetReturnValue!262 lt!425222 (_1!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (_2!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(assert (=> d!114111 (= lt!425222 (insertStrictlySorted!319 (toList!6106 (ite c!98208 call!40957 (ite c!98207 call!40956 call!40959))) (_1!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (_2!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(assert (=> d!114111 (= (+!2869 (ite c!98208 call!40957 (ite c!98207 call!40956 call!40959)) (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) lt!425225)))

(declare-fun b!943613 () Bool)

(declare-fun res!633993 () Bool)

(assert (=> b!943613 (=> (not res!633993) (not e!530545))))

(assert (=> b!943613 (= res!633993 (= (getValueByKey!488 (toList!6106 lt!425225) (_1!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))) (Some!493 (_2!6758 (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))))

(declare-fun b!943614 () Bool)

(assert (=> b!943614 (= e!530545 (contains!5122 (toList!6106 lt!425225) (ite (or c!98208 c!98207) (tuple2!13495 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (= (and d!114111 res!633994) b!943613))

(assert (= (and b!943613 res!633993) b!943614))

(declare-fun m!877215 () Bool)

(assert (=> d!114111 m!877215))

(declare-fun m!877217 () Bool)

(assert (=> d!114111 m!877217))

(declare-fun m!877219 () Bool)

(assert (=> d!114111 m!877219))

(declare-fun m!877221 () Bool)

(assert (=> d!114111 m!877221))

(declare-fun m!877223 () Bool)

(assert (=> b!943613 m!877223))

(declare-fun m!877225 () Bool)

(assert (=> b!943614 m!877225))

(assert (=> bm!40956 d!114111))

(declare-fun d!114113 () Bool)

(declare-fun e!530547 () Bool)

(assert (=> d!114113 e!530547))

(declare-fun res!633995 () Bool)

(assert (=> d!114113 (=> res!633995 e!530547)))

(declare-fun lt!425226 () Bool)

(assert (=> d!114113 (= res!633995 (not lt!425226))))

(declare-fun lt!425227 () Bool)

(assert (=> d!114113 (= lt!425226 lt!425227)))

(declare-fun lt!425229 () Unit!31699)

(declare-fun e!530546 () Unit!31699)

(assert (=> d!114113 (= lt!425229 e!530546)))

(declare-fun c!98265 () Bool)

(assert (=> d!114113 (= c!98265 lt!425227)))

(assert (=> d!114113 (= lt!425227 (containsKey!452 (toList!6106 lt!425116) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114113 (= (contains!5119 lt!425116 #b0000000000000000000000000000000000000000000000000000000000000000) lt!425226)))

(declare-fun b!943615 () Bool)

(declare-fun lt!425228 () Unit!31699)

(assert (=> b!943615 (= e!530546 lt!425228)))

(assert (=> b!943615 (= lt!425228 (lemmaContainsKeyImpliesGetValueByKeyDefined!347 (toList!6106 lt!425116) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!943615 (isDefined!360 (getValueByKey!488 (toList!6106 lt!425116) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!943616 () Bool)

(declare-fun Unit!31706 () Unit!31699)

(assert (=> b!943616 (= e!530546 Unit!31706)))

(declare-fun b!943617 () Bool)

(assert (=> b!943617 (= e!530547 (isDefined!360 (getValueByKey!488 (toList!6106 lt!425116) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114113 c!98265) b!943615))

(assert (= (and d!114113 (not c!98265)) b!943616))

(assert (= (and d!114113 (not res!633995)) b!943617))

(declare-fun m!877227 () Bool)

(assert (=> d!114113 m!877227))

(declare-fun m!877229 () Bool)

(assert (=> b!943615 m!877229))

(assert (=> b!943615 m!877035))

(assert (=> b!943615 m!877035))

(declare-fun m!877231 () Bool)

(assert (=> b!943615 m!877231))

(assert (=> b!943617 m!877035))

(assert (=> b!943617 m!877035))

(assert (=> b!943617 m!877231))

(assert (=> bm!40955 d!114113))

(declare-fun d!114115 () Bool)

(declare-fun res!634000 () Bool)

(declare-fun e!530552 () Bool)

(assert (=> d!114115 (=> res!634000 e!530552)))

(assert (=> d!114115 (= res!634000 (and ((_ is Cons!19257) (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (= (_1!6758 (h!20407 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)))))

(assert (=> d!114115 (= (containsKey!452 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756) e!530552)))

(declare-fun b!943622 () Bool)

(declare-fun e!530553 () Bool)

(assert (=> b!943622 (= e!530552 e!530553)))

(declare-fun res!634001 () Bool)

(assert (=> b!943622 (=> (not res!634001) (not e!530553))))

(assert (=> b!943622 (= res!634001 (and (or (not ((_ is Cons!19257) (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) (bvsle (_1!6758 (h!20407 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)) ((_ is Cons!19257) (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (bvslt (_1!6758 (h!20407 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)))))

(declare-fun b!943623 () Bool)

(assert (=> b!943623 (= e!530553 (containsKey!452 (t!27567 (toList!6106 (getCurrentListMap!3269 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) key!756))))

(assert (= (and d!114115 (not res!634000)) b!943622))

(assert (= (and b!943622 res!634001) b!943623))

(declare-fun m!877233 () Bool)

(assert (=> b!943623 m!877233))

(assert (=> d!114037 d!114115))

(assert (=> b!943319 d!114029))

(declare-fun d!114117 () Bool)

(declare-fun e!530554 () Bool)

(assert (=> d!114117 e!530554))

(declare-fun res!634003 () Bool)

(assert (=> d!114117 (=> (not res!634003) (not e!530554))))

(declare-fun lt!425233 () ListLongMap!12181)

(assert (=> d!114117 (= res!634003 (contains!5119 lt!425233 (_1!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(declare-fun lt!425230 () List!19261)

(assert (=> d!114117 (= lt!425233 (ListLongMap!12182 lt!425230))))

(declare-fun lt!425232 () Unit!31699)

(declare-fun lt!425231 () Unit!31699)

(assert (=> d!114117 (= lt!425232 lt!425231)))

(assert (=> d!114117 (= (getValueByKey!488 lt!425230 (_1!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (=> d!114117 (= lt!425231 (lemmaContainsTupThenGetReturnValue!262 lt!425230 (_1!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (=> d!114117 (= lt!425230 (insertStrictlySorted!319 (toList!6106 call!40960) (_1!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))) (_2!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (=> d!114117 (= (+!2869 call!40960 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))) lt!425233)))

(declare-fun b!943624 () Bool)

(declare-fun res!634002 () Bool)

(assert (=> b!943624 (=> (not res!634002) (not e!530554))))

(assert (=> b!943624 (= res!634002 (= (getValueByKey!488 (toList!6106 lt!425233) (_1!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (Some!493 (_2!6758 (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(declare-fun b!943625 () Bool)

(assert (=> b!943625 (= e!530554 (contains!5122 (toList!6106 lt!425233) (tuple2!13495 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))

(assert (= (and d!114117 res!634003) b!943624))

(assert (= (and b!943624 res!634002) b!943625))

(declare-fun m!877235 () Bool)

(assert (=> d!114117 m!877235))

(declare-fun m!877237 () Bool)

(assert (=> d!114117 m!877237))

(declare-fun m!877239 () Bool)

(assert (=> d!114117 m!877239))

(declare-fun m!877241 () Bool)

(assert (=> d!114117 m!877241))

(declare-fun m!877243 () Bool)

(assert (=> b!943624 m!877243))

(declare-fun m!877245 () Bool)

(assert (=> b!943625 m!877245))

(assert (=> b!943407 d!114117))

(declare-fun d!114119 () Bool)

(declare-fun e!530557 () Bool)

(assert (=> d!114119 e!530557))

(declare-fun c!98268 () Bool)

(assert (=> d!114119 (= c!98268 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!114119 true))

(declare-fun _$15!101 () Unit!31699)

(assert (=> d!114119 (= (choose!1574 (_keys!10511 thiss!1141) (_values!5665 thiss!1141) (mask!27265 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)) _$15!101)))

(declare-fun b!943630 () Bool)

(assert (=> b!943630 (= e!530557 (arrayContainsKey!0 (_keys!10511 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!943631 () Bool)

(assert (=> b!943631 (= e!530557 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114119 c!98268) b!943630))

(assert (= (and d!114119 (not c!98268)) b!943631))

(assert (=> b!943630 m!876881))

(assert (=> d!114031 d!114119))

(assert (=> d!114031 d!114077))

(declare-fun mapNonEmpty!32604 () Bool)

(declare-fun mapRes!32604 () Bool)

(declare-fun tp!62544 () Bool)

(declare-fun e!530559 () Bool)

(assert (=> mapNonEmpty!32604 (= mapRes!32604 (and tp!62544 e!530559))))

(declare-fun mapRest!32604 () (Array (_ BitVec 32) ValueCell!9776))

(declare-fun mapValue!32604 () ValueCell!9776)

(declare-fun mapKey!32604 () (_ BitVec 32))

(assert (=> mapNonEmpty!32604 (= mapRest!32603 (store mapRest!32604 mapKey!32604 mapValue!32604))))

(declare-fun b!943632 () Bool)

(assert (=> b!943632 (= e!530559 tp_is_empty!20515)))

(declare-fun b!943633 () Bool)

(declare-fun e!530558 () Bool)

(assert (=> b!943633 (= e!530558 tp_is_empty!20515)))

(declare-fun mapIsEmpty!32604 () Bool)

(assert (=> mapIsEmpty!32604 mapRes!32604))

(declare-fun condMapEmpty!32604 () Bool)

(declare-fun mapDefault!32604 () ValueCell!9776)

(assert (=> mapNonEmpty!32603 (= condMapEmpty!32604 (= mapRest!32603 ((as const (Array (_ BitVec 32) ValueCell!9776)) mapDefault!32604)))))

(assert (=> mapNonEmpty!32603 (= tp!62543 (and e!530558 mapRes!32604))))

(assert (= (and mapNonEmpty!32603 condMapEmpty!32604) mapIsEmpty!32604))

(assert (= (and mapNonEmpty!32603 (not condMapEmpty!32604)) mapNonEmpty!32604))

(assert (= (and mapNonEmpty!32604 ((_ is ValueCellFull!9776) mapValue!32604)) b!943632))

(assert (= (and mapNonEmpty!32603 ((_ is ValueCellFull!9776) mapDefault!32604)) b!943633))

(declare-fun m!877247 () Bool)

(assert (=> mapNonEmpty!32604 m!877247))

(declare-fun b_lambda!14269 () Bool)

(assert (= b_lambda!14265 (or (and b!943260 b_free!18007) b_lambda!14269)))

(declare-fun b_lambda!14271 () Bool)

(assert (= b_lambda!14267 (or (and b!943260 b_free!18007) b_lambda!14271)))

(check-sat (not b!943611) (not b!943542) (not d!114097) (not bm!40966) (not d!114107) (not b!943458) (not b!943596) (not b!943492) (not d!114117) (not b_lambda!14271) (not b_lambda!14269) (not b!943497) b_and!29403 (not b!943614) (not d!114091) (not b!943599) (not b!943478) (not b!943536) (not d!114083) (not b!943537) (not b!943467) (not bm!40969) tp_is_empty!20515 (not d!114041) (not b!943545) (not d!114063) (not b!943602) (not b!943613) (not b!943465) (not b!943556) (not b!943479) (not d!114061) (not d!114069) (not d!114085) (not b!943600) (not b!943601) (not b!943507) (not d!114079) (not d!114087) (not b!943538) (not b!943462) (not d!114095) (not b!943586) (not d!114101) (not b!943446) (not b!943623) (not b!943610) (not d!114073) (not bm!40960) (not d!114109) (not b!943617) (not b!943562) (not b!943563) (not b!943495) (not d!114099) (not d!114065) (not b!943595) (not d!114089) (not d!114093) (not d!114043) (not b!943540) (not b_next!18007) (not d!114049) (not b!943541) (not d!114051) (not b!943481) (not b!943603) (not d!114045) (not d!114081) (not b!943463) (not b_lambda!14263) (not b!943625) (not d!114113) (not b!943535) (not mapNonEmpty!32604) (not b!943494) (not b!943597) (not d!114103) (not b!943630) (not d!114111) (not b!943508) (not b!943624) (not bm!40963) (not d!114105) (not b!943615))
(check-sat b_and!29403 (not b_next!18007))
