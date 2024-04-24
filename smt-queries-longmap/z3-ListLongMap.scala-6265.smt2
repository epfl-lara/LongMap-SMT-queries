; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80258 () Bool)

(assert start!80258)

(declare-fun b!942348 () Bool)

(declare-fun b_free!17911 () Bool)

(declare-fun b_next!17911 () Bool)

(assert (=> b!942348 (= b_free!17911 (not b_next!17911))))

(declare-fun tp!62216 () Bool)

(declare-fun b_and!29333 () Bool)

(assert (=> b!942348 (= tp!62216 b_and!29333)))

(declare-fun b!942341 () Bool)

(declare-fun res!633219 () Bool)

(declare-fun e!529846 () Bool)

(assert (=> b!942341 (=> (not res!633219) (not e!529846))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32191 0))(
  ( (V!32192 (val!10260 Int)) )
))
(declare-datatypes ((ValueCell!9728 0))(
  ( (ValueCellFull!9728 (v!12788 V!32191)) (EmptyCell!9728) )
))
(declare-datatypes ((array!56841 0))(
  ( (array!56842 (arr!27349 (Array (_ BitVec 32) ValueCell!9728)) (size!27812 (_ BitVec 32))) )
))
(declare-datatypes ((array!56843 0))(
  ( (array!56844 (arr!27350 (Array (_ BitVec 32) (_ BitVec 64))) (size!27813 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4606 0))(
  ( (LongMapFixedSize!4607 (defaultEntry!5594 Int) (mask!27206 (_ BitVec 32)) (extraKeys!5326 (_ BitVec 32)) (zeroValue!5430 V!32191) (minValue!5430 V!32191) (_size!2358 (_ BitVec 32)) (_keys!10477 array!56843) (_values!5617 array!56841) (_vacant!2358 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4606)

(get-info :version)

(declare-datatypes ((SeekEntryResult!8976 0))(
  ( (MissingZero!8976 (index!38275 (_ BitVec 32))) (Found!8976 (index!38276 (_ BitVec 32))) (Intermediate!8976 (undefined!9788 Bool) (index!38277 (_ BitVec 32)) (x!80756 (_ BitVec 32))) (Undefined!8976) (MissingVacant!8976 (index!38278 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!56843 (_ BitVec 32)) SeekEntryResult!8976)

(assert (=> b!942341 (= res!633219 (not ((_ is Found!8976) (seekEntry!0 key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)))))))

(declare-fun b!942343 () Bool)

(declare-fun res!633218 () Bool)

(assert (=> b!942343 (=> (not res!633218) (not e!529846))))

(assert (=> b!942343 (= res!633218 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!942344 () Bool)

(declare-fun res!633217 () Bool)

(assert (=> b!942344 (=> (not res!633217) (not e!529846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942344 (= res!633217 (validMask!0 (mask!27206 thiss!1141)))))

(declare-fun mapNonEmpty!32426 () Bool)

(declare-fun mapRes!32426 () Bool)

(declare-fun tp!62215 () Bool)

(declare-fun e!529848 () Bool)

(assert (=> mapNonEmpty!32426 (= mapRes!32426 (and tp!62215 e!529848))))

(declare-fun mapKey!32426 () (_ BitVec 32))

(declare-fun mapValue!32426 () ValueCell!9728)

(declare-fun mapRest!32426 () (Array (_ BitVec 32) ValueCell!9728))

(assert (=> mapNonEmpty!32426 (= (arr!27349 (_values!5617 thiss!1141)) (store mapRest!32426 mapKey!32426 mapValue!32426))))

(declare-fun mapIsEmpty!32426 () Bool)

(assert (=> mapIsEmpty!32426 mapRes!32426))

(declare-fun b!942345 () Bool)

(declare-fun e!529847 () Bool)

(declare-fun tp_is_empty!20419 () Bool)

(assert (=> b!942345 (= e!529847 tp_is_empty!20419)))

(declare-fun b!942346 () Bool)

(assert (=> b!942346 (= e!529848 tp_is_empty!20419)))

(declare-fun b!942342 () Bool)

(declare-fun e!529851 () Bool)

(assert (=> b!942342 (= e!529851 (and e!529847 mapRes!32426))))

(declare-fun condMapEmpty!32426 () Bool)

(declare-fun mapDefault!32426 () ValueCell!9728)

(assert (=> b!942342 (= condMapEmpty!32426 (= (arr!27349 (_values!5617 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9728)) mapDefault!32426)))))

(declare-fun res!633220 () Bool)

(assert (=> start!80258 (=> (not res!633220) (not e!529846))))

(declare-fun valid!1768 (LongMapFixedSize!4606) Bool)

(assert (=> start!80258 (= res!633220 (valid!1768 thiss!1141))))

(assert (=> start!80258 e!529846))

(declare-fun e!529850 () Bool)

(assert (=> start!80258 e!529850))

(assert (=> start!80258 true))

(declare-fun b!942347 () Bool)

(assert (=> b!942347 (= e!529846 (and (= (size!27812 (_values!5617 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27206 thiss!1141))) (not (= (size!27813 (_keys!10477 thiss!1141)) (size!27812 (_values!5617 thiss!1141))))))))

(declare-fun array_inv!21344 (array!56843) Bool)

(declare-fun array_inv!21345 (array!56841) Bool)

(assert (=> b!942348 (= e!529850 (and tp!62216 tp_is_empty!20419 (array_inv!21344 (_keys!10477 thiss!1141)) (array_inv!21345 (_values!5617 thiss!1141)) e!529851))))

(assert (= (and start!80258 res!633220) b!942343))

(assert (= (and b!942343 res!633218) b!942341))

(assert (= (and b!942341 res!633219) b!942344))

(assert (= (and b!942344 res!633217) b!942347))

(assert (= (and b!942342 condMapEmpty!32426) mapIsEmpty!32426))

(assert (= (and b!942342 (not condMapEmpty!32426)) mapNonEmpty!32426))

(assert (= (and mapNonEmpty!32426 ((_ is ValueCellFull!9728) mapValue!32426)) b!942346))

(assert (= (and b!942342 ((_ is ValueCellFull!9728) mapDefault!32426)) b!942345))

(assert (= b!942348 b!942342))

(assert (= start!80258 b!942348))

(declare-fun m!877823 () Bool)

(assert (=> b!942344 m!877823))

(declare-fun m!877825 () Bool)

(assert (=> mapNonEmpty!32426 m!877825))

(declare-fun m!877827 () Bool)

(assert (=> start!80258 m!877827))

(declare-fun m!877829 () Bool)

(assert (=> b!942348 m!877829))

(declare-fun m!877831 () Bool)

(assert (=> b!942348 m!877831))

(declare-fun m!877833 () Bool)

(assert (=> b!942341 m!877833))

(check-sat (not mapNonEmpty!32426) (not b!942348) (not b!942341) (not b!942344) (not start!80258) b_and!29333 tp_is_empty!20419 (not b_next!17911))
(check-sat b_and!29333 (not b_next!17911))
(get-model)

(declare-fun b!942409 () Bool)

(declare-fun e!529894 () SeekEntryResult!8976)

(declare-fun lt!425348 () SeekEntryResult!8976)

(assert (=> b!942409 (= e!529894 (MissingZero!8976 (index!38277 lt!425348)))))

(declare-fun d!114391 () Bool)

(declare-fun lt!425345 () SeekEntryResult!8976)

(assert (=> d!114391 (and (or ((_ is MissingVacant!8976) lt!425345) (not ((_ is Found!8976) lt!425345)) (and (bvsge (index!38276 lt!425345) #b00000000000000000000000000000000) (bvslt (index!38276 lt!425345) (size!27813 (_keys!10477 thiss!1141))))) (not ((_ is MissingVacant!8976) lt!425345)) (or (not ((_ is Found!8976) lt!425345)) (= (select (arr!27350 (_keys!10477 thiss!1141)) (index!38276 lt!425345)) key!756)))))

(declare-fun e!529895 () SeekEntryResult!8976)

(assert (=> d!114391 (= lt!425345 e!529895)))

(declare-fun c!98364 () Bool)

(assert (=> d!114391 (= c!98364 (and ((_ is Intermediate!8976) lt!425348) (undefined!9788 lt!425348)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56843 (_ BitVec 32)) SeekEntryResult!8976)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114391 (= lt!425348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27206 thiss!1141)) key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)))))

(assert (=> d!114391 (validMask!0 (mask!27206 thiss!1141))))

(assert (=> d!114391 (= (seekEntry!0 key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)) lt!425345)))

(declare-fun b!942410 () Bool)

(assert (=> b!942410 (= e!529895 Undefined!8976)))

(declare-fun b!942411 () Bool)

(declare-fun e!529896 () SeekEntryResult!8976)

(assert (=> b!942411 (= e!529896 (Found!8976 (index!38277 lt!425348)))))

(declare-fun b!942412 () Bool)

(declare-fun c!98365 () Bool)

(declare-fun lt!425347 () (_ BitVec 64))

(assert (=> b!942412 (= c!98365 (= lt!425347 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942412 (= e!529896 e!529894)))

(declare-fun b!942413 () Bool)

(assert (=> b!942413 (= e!529895 e!529896)))

(assert (=> b!942413 (= lt!425347 (select (arr!27350 (_keys!10477 thiss!1141)) (index!38277 lt!425348)))))

(declare-fun c!98363 () Bool)

(assert (=> b!942413 (= c!98363 (= lt!425347 key!756))))

(declare-fun b!942414 () Bool)

(declare-fun lt!425346 () SeekEntryResult!8976)

(assert (=> b!942414 (= e!529894 (ite ((_ is MissingVacant!8976) lt!425346) (MissingZero!8976 (index!38278 lt!425346)) lt!425346))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!56843 (_ BitVec 32)) SeekEntryResult!8976)

(assert (=> b!942414 (= lt!425346 (seekKeyOrZeroReturnVacant!0 (x!80756 lt!425348) (index!38277 lt!425348) (index!38277 lt!425348) key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)))))

(assert (= (and d!114391 c!98364) b!942410))

(assert (= (and d!114391 (not c!98364)) b!942413))

(assert (= (and b!942413 c!98363) b!942411))

(assert (= (and b!942413 (not c!98363)) b!942412))

(assert (= (and b!942412 c!98365) b!942409))

(assert (= (and b!942412 (not c!98365)) b!942414))

(declare-fun m!877859 () Bool)

(assert (=> d!114391 m!877859))

(declare-fun m!877861 () Bool)

(assert (=> d!114391 m!877861))

(assert (=> d!114391 m!877861))

(declare-fun m!877863 () Bool)

(assert (=> d!114391 m!877863))

(assert (=> d!114391 m!877823))

(declare-fun m!877865 () Bool)

(assert (=> b!942413 m!877865))

(declare-fun m!877867 () Bool)

(assert (=> b!942414 m!877867))

(assert (=> b!942341 d!114391))

(declare-fun d!114393 () Bool)

(assert (=> d!114393 (= (array_inv!21344 (_keys!10477 thiss!1141)) (bvsge (size!27813 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942348 d!114393))

(declare-fun d!114395 () Bool)

(assert (=> d!114395 (= (array_inv!21345 (_values!5617 thiss!1141)) (bvsge (size!27812 (_values!5617 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!942348 d!114395))

(declare-fun d!114397 () Bool)

(assert (=> d!114397 (= (validMask!0 (mask!27206 thiss!1141)) (and (or (= (mask!27206 thiss!1141) #b00000000000000000000000000000111) (= (mask!27206 thiss!1141) #b00000000000000000000000000001111) (= (mask!27206 thiss!1141) #b00000000000000000000000000011111) (= (mask!27206 thiss!1141) #b00000000000000000000000000111111) (= (mask!27206 thiss!1141) #b00000000000000000000000001111111) (= (mask!27206 thiss!1141) #b00000000000000000000000011111111) (= (mask!27206 thiss!1141) #b00000000000000000000000111111111) (= (mask!27206 thiss!1141) #b00000000000000000000001111111111) (= (mask!27206 thiss!1141) #b00000000000000000000011111111111) (= (mask!27206 thiss!1141) #b00000000000000000000111111111111) (= (mask!27206 thiss!1141) #b00000000000000000001111111111111) (= (mask!27206 thiss!1141) #b00000000000000000011111111111111) (= (mask!27206 thiss!1141) #b00000000000000000111111111111111) (= (mask!27206 thiss!1141) #b00000000000000001111111111111111) (= (mask!27206 thiss!1141) #b00000000000000011111111111111111) (= (mask!27206 thiss!1141) #b00000000000000111111111111111111) (= (mask!27206 thiss!1141) #b00000000000001111111111111111111) (= (mask!27206 thiss!1141) #b00000000000011111111111111111111) (= (mask!27206 thiss!1141) #b00000000000111111111111111111111) (= (mask!27206 thiss!1141) #b00000000001111111111111111111111) (= (mask!27206 thiss!1141) #b00000000011111111111111111111111) (= (mask!27206 thiss!1141) #b00000000111111111111111111111111) (= (mask!27206 thiss!1141) #b00000001111111111111111111111111) (= (mask!27206 thiss!1141) #b00000011111111111111111111111111) (= (mask!27206 thiss!1141) #b00000111111111111111111111111111) (= (mask!27206 thiss!1141) #b00001111111111111111111111111111) (= (mask!27206 thiss!1141) #b00011111111111111111111111111111) (= (mask!27206 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27206 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!942344 d!114397))

(declare-fun d!114399 () Bool)

(declare-fun res!633251 () Bool)

(declare-fun e!529899 () Bool)

(assert (=> d!114399 (=> (not res!633251) (not e!529899))))

(declare-fun simpleValid!341 (LongMapFixedSize!4606) Bool)

(assert (=> d!114399 (= res!633251 (simpleValid!341 thiss!1141))))

(assert (=> d!114399 (= (valid!1768 thiss!1141) e!529899)))

(declare-fun b!942421 () Bool)

(declare-fun res!633252 () Bool)

(assert (=> b!942421 (=> (not res!633252) (not e!529899))))

(declare-fun arrayCountValidKeys!0 (array!56843 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942421 (= res!633252 (= (arrayCountValidKeys!0 (_keys!10477 thiss!1141) #b00000000000000000000000000000000 (size!27813 (_keys!10477 thiss!1141))) (_size!2358 thiss!1141)))))

(declare-fun b!942422 () Bool)

(declare-fun res!633253 () Bool)

(assert (=> b!942422 (=> (not res!633253) (not e!529899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56843 (_ BitVec 32)) Bool)

(assert (=> b!942422 (= res!633253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)))))

(declare-fun b!942423 () Bool)

(declare-datatypes ((List!19192 0))(
  ( (Nil!19189) (Cons!19188 (h!20341 (_ BitVec 64)) (t!27499 List!19192)) )
))
(declare-fun arrayNoDuplicates!0 (array!56843 (_ BitVec 32) List!19192) Bool)

(assert (=> b!942423 (= e!529899 (arrayNoDuplicates!0 (_keys!10477 thiss!1141) #b00000000000000000000000000000000 Nil!19189))))

(assert (= (and d!114399 res!633251) b!942421))

(assert (= (and b!942421 res!633252) b!942422))

(assert (= (and b!942422 res!633253) b!942423))

(declare-fun m!877869 () Bool)

(assert (=> d!114399 m!877869))

(declare-fun m!877871 () Bool)

(assert (=> b!942421 m!877871))

(declare-fun m!877873 () Bool)

(assert (=> b!942422 m!877873))

(declare-fun m!877875 () Bool)

(assert (=> b!942423 m!877875))

(assert (=> start!80258 d!114399))

(declare-fun mapIsEmpty!32435 () Bool)

(declare-fun mapRes!32435 () Bool)

(assert (=> mapIsEmpty!32435 mapRes!32435))

(declare-fun mapNonEmpty!32435 () Bool)

(declare-fun tp!62231 () Bool)

(declare-fun e!529904 () Bool)

(assert (=> mapNonEmpty!32435 (= mapRes!32435 (and tp!62231 e!529904))))

(declare-fun mapRest!32435 () (Array (_ BitVec 32) ValueCell!9728))

(declare-fun mapKey!32435 () (_ BitVec 32))

(declare-fun mapValue!32435 () ValueCell!9728)

(assert (=> mapNonEmpty!32435 (= mapRest!32426 (store mapRest!32435 mapKey!32435 mapValue!32435))))

(declare-fun b!942430 () Bool)

(assert (=> b!942430 (= e!529904 tp_is_empty!20419)))

(declare-fun b!942431 () Bool)

(declare-fun e!529905 () Bool)

(assert (=> b!942431 (= e!529905 tp_is_empty!20419)))

(declare-fun condMapEmpty!32435 () Bool)

(declare-fun mapDefault!32435 () ValueCell!9728)

(assert (=> mapNonEmpty!32426 (= condMapEmpty!32435 (= mapRest!32426 ((as const (Array (_ BitVec 32) ValueCell!9728)) mapDefault!32435)))))

(assert (=> mapNonEmpty!32426 (= tp!62215 (and e!529905 mapRes!32435))))

(assert (= (and mapNonEmpty!32426 condMapEmpty!32435) mapIsEmpty!32435))

(assert (= (and mapNonEmpty!32426 (not condMapEmpty!32435)) mapNonEmpty!32435))

(assert (= (and mapNonEmpty!32435 ((_ is ValueCellFull!9728) mapValue!32435)) b!942430))

(assert (= (and mapNonEmpty!32426 ((_ is ValueCellFull!9728) mapDefault!32435)) b!942431))

(declare-fun m!877877 () Bool)

(assert (=> mapNonEmpty!32435 m!877877))

(check-sat (not mapNonEmpty!32435) b_and!29333 (not b!942423) (not b!942414) (not b!942422) (not d!114391) (not b!942421) (not d!114399) tp_is_empty!20419 (not b_next!17911))
(check-sat b_and!29333 (not b_next!17911))
(get-model)

(declare-fun b!942444 () Bool)

(declare-fun e!529913 () SeekEntryResult!8976)

(declare-fun e!529914 () SeekEntryResult!8976)

(assert (=> b!942444 (= e!529913 e!529914)))

(declare-fun c!98374 () Bool)

(declare-fun lt!425353 () (_ BitVec 64))

(assert (=> b!942444 (= c!98374 (= lt!425353 key!756))))

(declare-fun b!942446 () Bool)

(declare-fun e!529912 () SeekEntryResult!8976)

(assert (=> b!942446 (= e!529912 (MissingVacant!8976 (index!38277 lt!425348)))))

(declare-fun b!942447 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!942447 (= e!529912 (seekKeyOrZeroReturnVacant!0 (bvadd (x!80756 lt!425348) #b00000000000000000000000000000001) (nextIndex!0 (index!38277 lt!425348) (bvadd (x!80756 lt!425348) #b00000000000000000000000000000001) (mask!27206 thiss!1141)) (index!38277 lt!425348) key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)))))

(declare-fun b!942445 () Bool)

(assert (=> b!942445 (= e!529913 Undefined!8976)))

(declare-fun lt!425354 () SeekEntryResult!8976)

(declare-fun d!114401 () Bool)

(assert (=> d!114401 (and (or ((_ is Undefined!8976) lt!425354) (not ((_ is Found!8976) lt!425354)) (and (bvsge (index!38276 lt!425354) #b00000000000000000000000000000000) (bvslt (index!38276 lt!425354) (size!27813 (_keys!10477 thiss!1141))))) (or ((_ is Undefined!8976) lt!425354) ((_ is Found!8976) lt!425354) (not ((_ is MissingVacant!8976) lt!425354)) (not (= (index!38278 lt!425354) (index!38277 lt!425348))) (and (bvsge (index!38278 lt!425354) #b00000000000000000000000000000000) (bvslt (index!38278 lt!425354) (size!27813 (_keys!10477 thiss!1141))))) (or ((_ is Undefined!8976) lt!425354) (ite ((_ is Found!8976) lt!425354) (= (select (arr!27350 (_keys!10477 thiss!1141)) (index!38276 lt!425354)) key!756) (and ((_ is MissingVacant!8976) lt!425354) (= (index!38278 lt!425354) (index!38277 lt!425348)) (= (select (arr!27350 (_keys!10477 thiss!1141)) (index!38278 lt!425354)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114401 (= lt!425354 e!529913)))

(declare-fun c!98373 () Bool)

(assert (=> d!114401 (= c!98373 (bvsge (x!80756 lt!425348) #b01111111111111111111111111111110))))

(assert (=> d!114401 (= lt!425353 (select (arr!27350 (_keys!10477 thiss!1141)) (index!38277 lt!425348)))))

(assert (=> d!114401 (validMask!0 (mask!27206 thiss!1141))))

(assert (=> d!114401 (= (seekKeyOrZeroReturnVacant!0 (x!80756 lt!425348) (index!38277 lt!425348) (index!38277 lt!425348) key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)) lt!425354)))

(declare-fun b!942448 () Bool)

(declare-fun c!98372 () Bool)

(assert (=> b!942448 (= c!98372 (= lt!425353 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!942448 (= e!529914 e!529912)))

(declare-fun b!942449 () Bool)

(assert (=> b!942449 (= e!529914 (Found!8976 (index!38277 lt!425348)))))

(assert (= (and d!114401 c!98373) b!942445))

(assert (= (and d!114401 (not c!98373)) b!942444))

(assert (= (and b!942444 c!98374) b!942449))

(assert (= (and b!942444 (not c!98374)) b!942448))

(assert (= (and b!942448 c!98372) b!942446))

(assert (= (and b!942448 (not c!98372)) b!942447))

(declare-fun m!877879 () Bool)

(assert (=> b!942447 m!877879))

(assert (=> b!942447 m!877879))

(declare-fun m!877881 () Bool)

(assert (=> b!942447 m!877881))

(declare-fun m!877883 () Bool)

(assert (=> d!114401 m!877883))

(declare-fun m!877885 () Bool)

(assert (=> d!114401 m!877885))

(assert (=> d!114401 m!877865))

(assert (=> d!114401 m!877823))

(assert (=> b!942414 d!114401))

(declare-fun b!942459 () Bool)

(declare-fun res!633264 () Bool)

(declare-fun e!529917 () Bool)

(assert (=> b!942459 (=> (not res!633264) (not e!529917))))

(declare-fun size!27818 (LongMapFixedSize!4606) (_ BitVec 32))

(assert (=> b!942459 (= res!633264 (bvsge (size!27818 thiss!1141) (_size!2358 thiss!1141)))))

(declare-fun b!942460 () Bool)

(declare-fun res!633265 () Bool)

(assert (=> b!942460 (=> (not res!633265) (not e!529917))))

(assert (=> b!942460 (= res!633265 (= (size!27818 thiss!1141) (bvadd (_size!2358 thiss!1141) (bvsdiv (bvadd (extraKeys!5326 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!942458 () Bool)

(declare-fun res!633262 () Bool)

(assert (=> b!942458 (=> (not res!633262) (not e!529917))))

(assert (=> b!942458 (= res!633262 (and (= (size!27812 (_values!5617 thiss!1141)) (bvadd (mask!27206 thiss!1141) #b00000000000000000000000000000001)) (= (size!27813 (_keys!10477 thiss!1141)) (size!27812 (_values!5617 thiss!1141))) (bvsge (_size!2358 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2358 thiss!1141) (bvadd (mask!27206 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun d!114403 () Bool)

(declare-fun res!633263 () Bool)

(assert (=> d!114403 (=> (not res!633263) (not e!529917))))

(assert (=> d!114403 (= res!633263 (validMask!0 (mask!27206 thiss!1141)))))

(assert (=> d!114403 (= (simpleValid!341 thiss!1141) e!529917)))

(declare-fun b!942461 () Bool)

(assert (=> b!942461 (= e!529917 (and (bvsge (extraKeys!5326 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5326 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2358 thiss!1141) #b00000000000000000000000000000000)))))

(assert (= (and d!114403 res!633263) b!942458))

(assert (= (and b!942458 res!633262) b!942459))

(assert (= (and b!942459 res!633264) b!942460))

(assert (= (and b!942460 res!633265) b!942461))

(declare-fun m!877887 () Bool)

(assert (=> b!942459 m!877887))

(assert (=> b!942460 m!877887))

(assert (=> d!114403 m!877823))

(assert (=> d!114399 d!114403))

(declare-fun b!942480 () Bool)

(declare-fun e!529931 () SeekEntryResult!8976)

(assert (=> b!942480 (= e!529931 (Intermediate!8976 false (toIndex!0 key!756 (mask!27206 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun d!114405 () Bool)

(declare-fun e!529928 () Bool)

(assert (=> d!114405 e!529928))

(declare-fun c!98381 () Bool)

(declare-fun lt!425360 () SeekEntryResult!8976)

(assert (=> d!114405 (= c!98381 (and ((_ is Intermediate!8976) lt!425360) (undefined!9788 lt!425360)))))

(declare-fun e!529932 () SeekEntryResult!8976)

(assert (=> d!114405 (= lt!425360 e!529932)))

(declare-fun c!98383 () Bool)

(assert (=> d!114405 (= c!98383 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!425359 () (_ BitVec 64))

(assert (=> d!114405 (= lt!425359 (select (arr!27350 (_keys!10477 thiss!1141)) (toIndex!0 key!756 (mask!27206 thiss!1141))))))

(assert (=> d!114405 (validMask!0 (mask!27206 thiss!1141))))

(assert (=> d!114405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27206 thiss!1141)) key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)) lt!425360)))

(declare-fun b!942481 () Bool)

(assert (=> b!942481 (and (bvsge (index!38277 lt!425360) #b00000000000000000000000000000000) (bvslt (index!38277 lt!425360) (size!27813 (_keys!10477 thiss!1141))))))

(declare-fun res!633274 () Bool)

(assert (=> b!942481 (= res!633274 (= (select (arr!27350 (_keys!10477 thiss!1141)) (index!38277 lt!425360)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!529930 () Bool)

(assert (=> b!942481 (=> res!633274 e!529930)))

(declare-fun b!942482 () Bool)

(declare-fun e!529929 () Bool)

(assert (=> b!942482 (= e!529928 e!529929)))

(declare-fun res!633273 () Bool)

(assert (=> b!942482 (= res!633273 (and ((_ is Intermediate!8976) lt!425360) (not (undefined!9788 lt!425360)) (bvslt (x!80756 lt!425360) #b01111111111111111111111111111110) (bvsge (x!80756 lt!425360) #b00000000000000000000000000000000) (bvsge (x!80756 lt!425360) #b00000000000000000000000000000000)))))

(assert (=> b!942482 (=> (not res!633273) (not e!529929))))

(declare-fun b!942483 () Bool)

(assert (=> b!942483 (= e!529931 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27206 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27206 thiss!1141)) key!756 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)))))

(declare-fun b!942484 () Bool)

(assert (=> b!942484 (and (bvsge (index!38277 lt!425360) #b00000000000000000000000000000000) (bvslt (index!38277 lt!425360) (size!27813 (_keys!10477 thiss!1141))))))

(assert (=> b!942484 (= e!529930 (= (select (arr!27350 (_keys!10477 thiss!1141)) (index!38277 lt!425360)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!942485 () Bool)

(assert (=> b!942485 (= e!529932 e!529931)))

(declare-fun c!98382 () Bool)

(assert (=> b!942485 (= c!98382 (or (= lt!425359 key!756) (= (bvadd lt!425359 lt!425359) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!942486 () Bool)

(assert (=> b!942486 (and (bvsge (index!38277 lt!425360) #b00000000000000000000000000000000) (bvslt (index!38277 lt!425360) (size!27813 (_keys!10477 thiss!1141))))))

(declare-fun res!633272 () Bool)

(assert (=> b!942486 (= res!633272 (= (select (arr!27350 (_keys!10477 thiss!1141)) (index!38277 lt!425360)) key!756))))

(assert (=> b!942486 (=> res!633272 e!529930)))

(assert (=> b!942486 (= e!529929 e!529930)))

(declare-fun b!942487 () Bool)

(assert (=> b!942487 (= e!529932 (Intermediate!8976 true (toIndex!0 key!756 (mask!27206 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!942488 () Bool)

(assert (=> b!942488 (= e!529928 (bvsge (x!80756 lt!425360) #b01111111111111111111111111111110))))

(assert (= (and d!114405 c!98383) b!942487))

(assert (= (and d!114405 (not c!98383)) b!942485))

(assert (= (and b!942485 c!98382) b!942480))

(assert (= (and b!942485 (not c!98382)) b!942483))

(assert (= (and d!114405 c!98381) b!942488))

(assert (= (and d!114405 (not c!98381)) b!942482))

(assert (= (and b!942482 res!633273) b!942486))

(assert (= (and b!942486 (not res!633272)) b!942481))

(assert (= (and b!942481 (not res!633274)) b!942484))

(declare-fun m!877889 () Bool)

(assert (=> b!942484 m!877889))

(assert (=> b!942481 m!877889))

(assert (=> b!942486 m!877889))

(assert (=> d!114405 m!877861))

(declare-fun m!877891 () Bool)

(assert (=> d!114405 m!877891))

(assert (=> d!114405 m!877823))

(assert (=> b!942483 m!877861))

(declare-fun m!877893 () Bool)

(assert (=> b!942483 m!877893))

(assert (=> b!942483 m!877893))

(declare-fun m!877895 () Bool)

(assert (=> b!942483 m!877895))

(assert (=> d!114391 d!114405))

(declare-fun d!114407 () Bool)

(declare-fun lt!425366 () (_ BitVec 32))

(declare-fun lt!425365 () (_ BitVec 32))

(assert (=> d!114407 (= lt!425366 (bvmul (bvxor lt!425365 (bvlshr lt!425365 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114407 (= lt!425365 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114407 (and (bvsge (mask!27206 thiss!1141) #b00000000000000000000000000000000) (let ((res!633275 (let ((h!20342 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!80774 (bvmul (bvxor h!20342 (bvlshr h!20342 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!80774 (bvlshr x!80774 #b00000000000000000000000000001101)) (mask!27206 thiss!1141)))))) (and (bvslt res!633275 (bvadd (mask!27206 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!633275 #b00000000000000000000000000000000))))))

(assert (=> d!114407 (= (toIndex!0 key!756 (mask!27206 thiss!1141)) (bvand (bvxor lt!425366 (bvlshr lt!425366 #b00000000000000000000000000001101)) (mask!27206 thiss!1141)))))

(assert (=> d!114391 d!114407))

(assert (=> d!114391 d!114397))

(declare-fun b!942499 () Bool)

(declare-fun e!529944 () Bool)

(declare-fun contains!5136 (List!19192 (_ BitVec 64)) Bool)

(assert (=> b!942499 (= e!529944 (contains!5136 Nil!19189 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942500 () Bool)

(declare-fun e!529941 () Bool)

(declare-fun e!529942 () Bool)

(assert (=> b!942500 (= e!529941 e!529942)))

(declare-fun c!98386 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!942500 (= c!98386 (validKeyInArray!0 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!942501 () Bool)

(declare-fun call!40971 () Bool)

(assert (=> b!942501 (= e!529942 call!40971)))

(declare-fun bm!40968 () Bool)

(assert (=> bm!40968 (= call!40971 (arrayNoDuplicates!0 (_keys!10477 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98386 (Cons!19188 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000) Nil!19189) Nil!19189)))))

(declare-fun b!942502 () Bool)

(assert (=> b!942502 (= e!529942 call!40971)))

(declare-fun b!942503 () Bool)

(declare-fun e!529943 () Bool)

(assert (=> b!942503 (= e!529943 e!529941)))

(declare-fun res!633282 () Bool)

(assert (=> b!942503 (=> (not res!633282) (not e!529941))))

(assert (=> b!942503 (= res!633282 (not e!529944))))

(declare-fun res!633284 () Bool)

(assert (=> b!942503 (=> (not res!633284) (not e!529944))))

(assert (=> b!942503 (= res!633284 (validKeyInArray!0 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114409 () Bool)

(declare-fun res!633283 () Bool)

(assert (=> d!114409 (=> res!633283 e!529943)))

(assert (=> d!114409 (= res!633283 (bvsge #b00000000000000000000000000000000 (size!27813 (_keys!10477 thiss!1141))))))

(assert (=> d!114409 (= (arrayNoDuplicates!0 (_keys!10477 thiss!1141) #b00000000000000000000000000000000 Nil!19189) e!529943)))

(assert (= (and d!114409 (not res!633283)) b!942503))

(assert (= (and b!942503 res!633284) b!942499))

(assert (= (and b!942503 res!633282) b!942500))

(assert (= (and b!942500 c!98386) b!942501))

(assert (= (and b!942500 (not c!98386)) b!942502))

(assert (= (or b!942501 b!942502) bm!40968))

(declare-fun m!877897 () Bool)

(assert (=> b!942499 m!877897))

(assert (=> b!942499 m!877897))

(declare-fun m!877899 () Bool)

(assert (=> b!942499 m!877899))

(assert (=> b!942500 m!877897))

(assert (=> b!942500 m!877897))

(declare-fun m!877901 () Bool)

(assert (=> b!942500 m!877901))

(assert (=> bm!40968 m!877897))

(declare-fun m!877903 () Bool)

(assert (=> bm!40968 m!877903))

(assert (=> b!942503 m!877897))

(assert (=> b!942503 m!877897))

(assert (=> b!942503 m!877901))

(assert (=> b!942423 d!114409))

(declare-fun b!942512 () Bool)

(declare-fun e!529949 () (_ BitVec 32))

(assert (=> b!942512 (= e!529949 #b00000000000000000000000000000000)))

(declare-fun b!942513 () Bool)

(declare-fun e!529950 () (_ BitVec 32))

(declare-fun call!40974 () (_ BitVec 32))

(assert (=> b!942513 (= e!529950 (bvadd #b00000000000000000000000000000001 call!40974))))

(declare-fun b!942514 () Bool)

(assert (=> b!942514 (= e!529949 e!529950)))

(declare-fun c!98392 () Bool)

(assert (=> b!942514 (= c!98392 (validKeyInArray!0 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114411 () Bool)

(declare-fun lt!425369 () (_ BitVec 32))

(assert (=> d!114411 (and (bvsge lt!425369 #b00000000000000000000000000000000) (bvsle lt!425369 (bvsub (size!27813 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114411 (= lt!425369 e!529949)))

(declare-fun c!98391 () Bool)

(assert (=> d!114411 (= c!98391 (bvsge #b00000000000000000000000000000000 (size!27813 (_keys!10477 thiss!1141))))))

(assert (=> d!114411 (and (bvsle #b00000000000000000000000000000000 (size!27813 (_keys!10477 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27813 (_keys!10477 thiss!1141)) (size!27813 (_keys!10477 thiss!1141))))))

(assert (=> d!114411 (= (arrayCountValidKeys!0 (_keys!10477 thiss!1141) #b00000000000000000000000000000000 (size!27813 (_keys!10477 thiss!1141))) lt!425369)))

(declare-fun bm!40971 () Bool)

(assert (=> bm!40971 (= call!40974 (arrayCountValidKeys!0 (_keys!10477 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27813 (_keys!10477 thiss!1141))))))

(declare-fun b!942515 () Bool)

(assert (=> b!942515 (= e!529950 call!40974)))

(assert (= (and d!114411 c!98391) b!942512))

(assert (= (and d!114411 (not c!98391)) b!942514))

(assert (= (and b!942514 c!98392) b!942513))

(assert (= (and b!942514 (not c!98392)) b!942515))

(assert (= (or b!942513 b!942515) bm!40971))

(assert (=> b!942514 m!877897))

(assert (=> b!942514 m!877897))

(assert (=> b!942514 m!877901))

(declare-fun m!877905 () Bool)

(assert (=> bm!40971 m!877905))

(assert (=> b!942421 d!114411))

(declare-fun b!942524 () Bool)

(declare-fun e!529959 () Bool)

(declare-fun call!40977 () Bool)

(assert (=> b!942524 (= e!529959 call!40977)))

(declare-fun bm!40974 () Bool)

(assert (=> bm!40974 (= call!40977 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10477 thiss!1141) (mask!27206 thiss!1141)))))

(declare-fun b!942525 () Bool)

(declare-fun e!529958 () Bool)

(assert (=> b!942525 (= e!529958 call!40977)))

(declare-fun d!114413 () Bool)

(declare-fun res!633289 () Bool)

(declare-fun e!529957 () Bool)

(assert (=> d!114413 (=> res!633289 e!529957)))

(assert (=> d!114413 (= res!633289 (bvsge #b00000000000000000000000000000000 (size!27813 (_keys!10477 thiss!1141))))))

(assert (=> d!114413 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10477 thiss!1141) (mask!27206 thiss!1141)) e!529957)))

(declare-fun b!942526 () Bool)

(assert (=> b!942526 (= e!529958 e!529959)))

(declare-fun lt!425378 () (_ BitVec 64))

(assert (=> b!942526 (= lt!425378 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31776 0))(
  ( (Unit!31777) )
))
(declare-fun lt!425377 () Unit!31776)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56843 (_ BitVec 64) (_ BitVec 32)) Unit!31776)

(assert (=> b!942526 (= lt!425377 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10477 thiss!1141) lt!425378 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!56843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!942526 (arrayContainsKey!0 (_keys!10477 thiss!1141) lt!425378 #b00000000000000000000000000000000)))

(declare-fun lt!425376 () Unit!31776)

(assert (=> b!942526 (= lt!425376 lt!425377)))

(declare-fun res!633290 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!56843 (_ BitVec 32)) SeekEntryResult!8976)

(assert (=> b!942526 (= res!633290 (= (seekEntryOrOpen!0 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000) (_keys!10477 thiss!1141) (mask!27206 thiss!1141)) (Found!8976 #b00000000000000000000000000000000)))))

(assert (=> b!942526 (=> (not res!633290) (not e!529959))))

(declare-fun b!942527 () Bool)

(assert (=> b!942527 (= e!529957 e!529958)))

(declare-fun c!98395 () Bool)

(assert (=> b!942527 (= c!98395 (validKeyInArray!0 (select (arr!27350 (_keys!10477 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114413 (not res!633289)) b!942527))

(assert (= (and b!942527 c!98395) b!942526))

(assert (= (and b!942527 (not c!98395)) b!942525))

(assert (= (and b!942526 res!633290) b!942524))

(assert (= (or b!942524 b!942525) bm!40974))

(declare-fun m!877907 () Bool)

(assert (=> bm!40974 m!877907))

(assert (=> b!942526 m!877897))

(declare-fun m!877909 () Bool)

(assert (=> b!942526 m!877909))

(declare-fun m!877911 () Bool)

(assert (=> b!942526 m!877911))

(assert (=> b!942526 m!877897))

(declare-fun m!877913 () Bool)

(assert (=> b!942526 m!877913))

(assert (=> b!942527 m!877897))

(assert (=> b!942527 m!877897))

(assert (=> b!942527 m!877901))

(assert (=> b!942422 d!114413))

(declare-fun mapIsEmpty!32436 () Bool)

(declare-fun mapRes!32436 () Bool)

(assert (=> mapIsEmpty!32436 mapRes!32436))

(declare-fun mapNonEmpty!32436 () Bool)

(declare-fun tp!62232 () Bool)

(declare-fun e!529960 () Bool)

(assert (=> mapNonEmpty!32436 (= mapRes!32436 (and tp!62232 e!529960))))

(declare-fun mapRest!32436 () (Array (_ BitVec 32) ValueCell!9728))

(declare-fun mapKey!32436 () (_ BitVec 32))

(declare-fun mapValue!32436 () ValueCell!9728)

(assert (=> mapNonEmpty!32436 (= mapRest!32435 (store mapRest!32436 mapKey!32436 mapValue!32436))))

(declare-fun b!942528 () Bool)

(assert (=> b!942528 (= e!529960 tp_is_empty!20419)))

(declare-fun b!942529 () Bool)

(declare-fun e!529961 () Bool)

(assert (=> b!942529 (= e!529961 tp_is_empty!20419)))

(declare-fun condMapEmpty!32436 () Bool)

(declare-fun mapDefault!32436 () ValueCell!9728)

(assert (=> mapNonEmpty!32435 (= condMapEmpty!32436 (= mapRest!32435 ((as const (Array (_ BitVec 32) ValueCell!9728)) mapDefault!32436)))))

(assert (=> mapNonEmpty!32435 (= tp!62231 (and e!529961 mapRes!32436))))

(assert (= (and mapNonEmpty!32435 condMapEmpty!32436) mapIsEmpty!32436))

(assert (= (and mapNonEmpty!32435 (not condMapEmpty!32436)) mapNonEmpty!32436))

(assert (= (and mapNonEmpty!32436 ((_ is ValueCellFull!9728) mapValue!32436)) b!942528))

(assert (= (and mapNonEmpty!32435 ((_ is ValueCellFull!9728) mapDefault!32436)) b!942529))

(declare-fun m!877915 () Bool)

(assert (=> mapNonEmpty!32436 m!877915))

(check-sat (not d!114401) (not b!942447) (not b!942527) (not mapNonEmpty!32436) (not bm!40974) (not b!942483) (not bm!40968) (not b!942459) (not b!942500) (not b!942526) (not b!942460) (not bm!40971) (not d!114405) (not d!114403) (not b!942514) b_and!29333 tp_is_empty!20419 (not b_next!17911) (not b!942499) (not b!942503))
(check-sat b_and!29333 (not b_next!17911))
