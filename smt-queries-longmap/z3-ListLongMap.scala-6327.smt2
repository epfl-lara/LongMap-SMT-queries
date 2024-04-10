; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81480 () Bool)

(assert start!81480)

(declare-fun b!952241 () Bool)

(declare-fun b_free!18285 () Bool)

(declare-fun b_next!18285 () Bool)

(assert (=> b!952241 (= b_free!18285 (not b_next!18285))))

(declare-fun tp!63474 () Bool)

(declare-fun b_and!29763 () Bool)

(assert (=> b!952241 (= tp!63474 b_and!29763)))

(declare-fun b!952232 () Bool)

(declare-fun e!536262 () Bool)

(declare-fun tp_is_empty!20793 () Bool)

(assert (=> b!952232 (= e!536262 tp_is_empty!20793)))

(declare-fun b!952233 () Bool)

(declare-fun res!637976 () Bool)

(declare-fun e!536268 () Bool)

(assert (=> b!952233 (=> (not res!637976) (not e!536268))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!952233 (= res!637976 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952234 () Bool)

(declare-fun e!536267 () Bool)

(declare-fun e!536264 () Bool)

(declare-fun mapRes!33124 () Bool)

(assert (=> b!952234 (= e!536267 (and e!536264 mapRes!33124))))

(declare-fun condMapEmpty!33124 () Bool)

(declare-datatypes ((V!32689 0))(
  ( (V!32690 (val!10447 Int)) )
))
(declare-datatypes ((ValueCell!9915 0))(
  ( (ValueCellFull!9915 (v!12997 V!32689)) (EmptyCell!9915) )
))
(declare-datatypes ((array!57618 0))(
  ( (array!57619 (arr!27702 (Array (_ BitVec 32) ValueCell!9915)) (size!28181 (_ BitVec 32))) )
))
(declare-datatypes ((array!57620 0))(
  ( (array!57621 (arr!27703 (Array (_ BitVec 32) (_ BitVec 64))) (size!28182 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4980 0))(
  ( (LongMapFixedSize!4981 (defaultEntry!5819 Int) (mask!27661 (_ BitVec 32)) (extraKeys!5551 (_ BitVec 32)) (zeroValue!5655 V!32689) (minValue!5655 V!32689) (_size!2545 (_ BitVec 32)) (_keys!10771 array!57620) (_values!5842 array!57618) (_vacant!2545 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4980)

(declare-fun mapDefault!33124 () ValueCell!9915)

(assert (=> b!952234 (= condMapEmpty!33124 (= (arr!27702 (_values!5842 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9915)) mapDefault!33124)))))

(declare-fun b!952235 () Bool)

(declare-fun e!536265 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57620 (_ BitVec 32)) Bool)

(assert (=> b!952235 (= e!536265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)))))

(declare-fun mapNonEmpty!33124 () Bool)

(declare-fun tp!63473 () Bool)

(assert (=> mapNonEmpty!33124 (= mapRes!33124 (and tp!63473 e!536262))))

(declare-fun mapKey!33124 () (_ BitVec 32))

(declare-fun mapValue!33124 () ValueCell!9915)

(declare-fun mapRest!33124 () (Array (_ BitVec 32) ValueCell!9915))

(assert (=> mapNonEmpty!33124 (= (arr!27702 (_values!5842 thiss!1141)) (store mapRest!33124 mapKey!33124 mapValue!33124))))

(declare-fun b!952236 () Bool)

(assert (=> b!952236 (= e!536268 (not e!536265))))

(declare-fun res!637975 () Bool)

(assert (=> b!952236 (=> res!637975 e!536265)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952236 (= res!637975 (not (validMask!0 (mask!27661 thiss!1141))))))

(declare-fun lt!429034 () (_ BitVec 32))

(assert (=> b!952236 (arrayForallSeekEntryOrOpenFound!0 lt!429034 (_keys!10771 thiss!1141) (mask!27661 thiss!1141))))

(declare-datatypes ((Unit!32041 0))(
  ( (Unit!32042) )
))
(declare-fun lt!429036 () Unit!32041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32041)

(assert (=> b!952236 (= lt!429036 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10771 thiss!1141) (mask!27661 thiss!1141) #b00000000000000000000000000000000 lt!429034))))

(declare-fun arrayScanForKey!0 (array!57620 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952236 (= lt!429034 (arrayScanForKey!0 (_keys!10771 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952236 (arrayContainsKey!0 (_keys!10771 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429035 () Unit!32041)

(declare-fun lemmaKeyInListMapIsInArray!334 (array!57620 array!57618 (_ BitVec 32) (_ BitVec 32) V!32689 V!32689 (_ BitVec 64) Int) Unit!32041)

(assert (=> b!952236 (= lt!429035 (lemmaKeyInListMapIsInArray!334 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) key!756 (defaultEntry!5819 thiss!1141)))))

(declare-fun mapIsEmpty!33124 () Bool)

(assert (=> mapIsEmpty!33124 mapRes!33124))

(declare-fun res!637973 () Bool)

(assert (=> start!81480 (=> (not res!637973) (not e!536268))))

(declare-fun valid!1895 (LongMapFixedSize!4980) Bool)

(assert (=> start!81480 (= res!637973 (valid!1895 thiss!1141))))

(assert (=> start!81480 e!536268))

(declare-fun e!536263 () Bool)

(assert (=> start!81480 e!536263))

(assert (=> start!81480 true))

(declare-fun b!952237 () Bool)

(declare-fun res!637974 () Bool)

(assert (=> b!952237 (=> (not res!637974) (not e!536268))))

(declare-datatypes ((tuple2!13582 0))(
  ( (tuple2!13583 (_1!6802 (_ BitVec 64)) (_2!6802 V!32689)) )
))
(declare-datatypes ((List!19363 0))(
  ( (Nil!19360) (Cons!19359 (h!20521 tuple2!13582) (t!27716 List!19363)) )
))
(declare-datatypes ((ListLongMap!12279 0))(
  ( (ListLongMap!12280 (toList!6155 List!19363)) )
))
(declare-fun contains!5250 (ListLongMap!12279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3388 (array!57620 array!57618 (_ BitVec 32) (_ BitVec 32) V!32689 V!32689 (_ BitVec 32) Int) ListLongMap!12279)

(assert (=> b!952237 (= res!637974 (contains!5250 (getCurrentListMap!3388 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)) key!756))))

(declare-fun b!952238 () Bool)

(declare-fun res!637977 () Bool)

(assert (=> b!952238 (=> res!637977 e!536265)))

(assert (=> b!952238 (= res!637977 (not (= (size!28182 (_keys!10771 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27661 thiss!1141)))))))

(declare-fun b!952239 () Bool)

(assert (=> b!952239 (= e!536264 tp_is_empty!20793)))

(declare-fun b!952240 () Bool)

(declare-fun res!637972 () Bool)

(assert (=> b!952240 (=> (not res!637972) (not e!536268))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9159 0))(
  ( (MissingZero!9159 (index!39007 (_ BitVec 32))) (Found!9159 (index!39008 (_ BitVec 32))) (Intermediate!9159 (undefined!9971 Bool) (index!39009 (_ BitVec 32)) (x!81919 (_ BitVec 32))) (Undefined!9159) (MissingVacant!9159 (index!39010 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57620 (_ BitVec 32)) SeekEntryResult!9159)

(assert (=> b!952240 (= res!637972 (not ((_ is Found!9159) (seekEntry!0 key!756 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)))))))

(declare-fun array_inv!21502 (array!57620) Bool)

(declare-fun array_inv!21503 (array!57618) Bool)

(assert (=> b!952241 (= e!536263 (and tp!63474 tp_is_empty!20793 (array_inv!21502 (_keys!10771 thiss!1141)) (array_inv!21503 (_values!5842 thiss!1141)) e!536267))))

(assert (= (and start!81480 res!637973) b!952233))

(assert (= (and b!952233 res!637976) b!952240))

(assert (= (and b!952240 res!637972) b!952237))

(assert (= (and b!952237 res!637974) b!952236))

(assert (= (and b!952236 (not res!637975)) b!952238))

(assert (= (and b!952238 (not res!637977)) b!952235))

(assert (= (and b!952234 condMapEmpty!33124) mapIsEmpty!33124))

(assert (= (and b!952234 (not condMapEmpty!33124)) mapNonEmpty!33124))

(assert (= (and mapNonEmpty!33124 ((_ is ValueCellFull!9915) mapValue!33124)) b!952232))

(assert (= (and b!952234 ((_ is ValueCellFull!9915) mapDefault!33124)) b!952239))

(assert (= b!952241 b!952234))

(assert (= start!81480 b!952241))

(declare-fun m!884425 () Bool)

(assert (=> b!952240 m!884425))

(declare-fun m!884427 () Bool)

(assert (=> b!952235 m!884427))

(declare-fun m!884429 () Bool)

(assert (=> mapNonEmpty!33124 m!884429))

(declare-fun m!884431 () Bool)

(assert (=> start!81480 m!884431))

(declare-fun m!884433 () Bool)

(assert (=> b!952241 m!884433))

(declare-fun m!884435 () Bool)

(assert (=> b!952241 m!884435))

(declare-fun m!884437 () Bool)

(assert (=> b!952236 m!884437))

(declare-fun m!884439 () Bool)

(assert (=> b!952236 m!884439))

(declare-fun m!884441 () Bool)

(assert (=> b!952236 m!884441))

(declare-fun m!884443 () Bool)

(assert (=> b!952236 m!884443))

(declare-fun m!884445 () Bool)

(assert (=> b!952236 m!884445))

(declare-fun m!884447 () Bool)

(assert (=> b!952236 m!884447))

(declare-fun m!884449 () Bool)

(assert (=> b!952237 m!884449))

(assert (=> b!952237 m!884449))

(declare-fun m!884451 () Bool)

(assert (=> b!952237 m!884451))

(check-sat (not b_next!18285) (not mapNonEmpty!33124) (not b!952236) (not b!952237) (not b!952235) (not b!952241) tp_is_empty!20793 b_and!29763 (not b!952240) (not start!81480))
(check-sat b_and!29763 (not b_next!18285))
(get-model)

(declare-fun d!115503 () Bool)

(declare-fun lt!429054 () SeekEntryResult!9159)

(assert (=> d!115503 (and (or ((_ is MissingVacant!9159) lt!429054) (not ((_ is Found!9159) lt!429054)) (and (bvsge (index!39008 lt!429054) #b00000000000000000000000000000000) (bvslt (index!39008 lt!429054) (size!28182 (_keys!10771 thiss!1141))))) (not ((_ is MissingVacant!9159) lt!429054)) (or (not ((_ is Found!9159) lt!429054)) (= (select (arr!27703 (_keys!10771 thiss!1141)) (index!39008 lt!429054)) key!756)))))

(declare-fun e!536296 () SeekEntryResult!9159)

(assert (=> d!115503 (= lt!429054 e!536296)))

(declare-fun c!99612 () Bool)

(declare-fun lt!429056 () SeekEntryResult!9159)

(assert (=> d!115503 (= c!99612 (and ((_ is Intermediate!9159) lt!429056) (undefined!9971 lt!429056)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57620 (_ BitVec 32)) SeekEntryResult!9159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115503 (= lt!429056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27661 thiss!1141)) key!756 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)))))

(assert (=> d!115503 (validMask!0 (mask!27661 thiss!1141))))

(assert (=> d!115503 (= (seekEntry!0 key!756 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)) lt!429054)))

(declare-fun b!952284 () Bool)

(assert (=> b!952284 (= e!536296 Undefined!9159)))

(declare-fun b!952285 () Bool)

(declare-fun e!536298 () SeekEntryResult!9159)

(declare-fun lt!429057 () SeekEntryResult!9159)

(assert (=> b!952285 (= e!536298 (ite ((_ is MissingVacant!9159) lt!429057) (MissingZero!9159 (index!39010 lt!429057)) lt!429057))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57620 (_ BitVec 32)) SeekEntryResult!9159)

(assert (=> b!952285 (= lt!429057 (seekKeyOrZeroReturnVacant!0 (x!81919 lt!429056) (index!39009 lt!429056) (index!39009 lt!429056) key!756 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)))))

(declare-fun b!952286 () Bool)

(declare-fun e!536297 () SeekEntryResult!9159)

(assert (=> b!952286 (= e!536297 (Found!9159 (index!39009 lt!429056)))))

(declare-fun b!952287 () Bool)

(assert (=> b!952287 (= e!536296 e!536297)))

(declare-fun lt!429055 () (_ BitVec 64))

(assert (=> b!952287 (= lt!429055 (select (arr!27703 (_keys!10771 thiss!1141)) (index!39009 lt!429056)))))

(declare-fun c!99613 () Bool)

(assert (=> b!952287 (= c!99613 (= lt!429055 key!756))))

(declare-fun b!952288 () Bool)

(declare-fun c!99611 () Bool)

(assert (=> b!952288 (= c!99611 (= lt!429055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!952288 (= e!536297 e!536298)))

(declare-fun b!952289 () Bool)

(assert (=> b!952289 (= e!536298 (MissingZero!9159 (index!39009 lt!429056)))))

(assert (= (and d!115503 c!99612) b!952284))

(assert (= (and d!115503 (not c!99612)) b!952287))

(assert (= (and b!952287 c!99613) b!952286))

(assert (= (and b!952287 (not c!99613)) b!952288))

(assert (= (and b!952288 c!99611) b!952289))

(assert (= (and b!952288 (not c!99611)) b!952285))

(declare-fun m!884481 () Bool)

(assert (=> d!115503 m!884481))

(declare-fun m!884483 () Bool)

(assert (=> d!115503 m!884483))

(assert (=> d!115503 m!884483))

(declare-fun m!884485 () Bool)

(assert (=> d!115503 m!884485))

(assert (=> d!115503 m!884443))

(declare-fun m!884487 () Bool)

(assert (=> b!952285 m!884487))

(declare-fun m!884489 () Bool)

(assert (=> b!952287 m!884489))

(assert (=> b!952240 d!115503))

(declare-fun b!952298 () Bool)

(declare-fun e!536307 () Bool)

(declare-fun call!41552 () Bool)

(assert (=> b!952298 (= e!536307 call!41552)))

(declare-fun b!952299 () Bool)

(declare-fun e!536305 () Bool)

(assert (=> b!952299 (= e!536305 call!41552)))

(declare-fun b!952301 () Bool)

(assert (=> b!952301 (= e!536305 e!536307)))

(declare-fun lt!429066 () (_ BitVec 64))

(assert (=> b!952301 (= lt!429066 (select (arr!27703 (_keys!10771 thiss!1141)) lt!429034))))

(declare-fun lt!429064 () Unit!32041)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57620 (_ BitVec 64) (_ BitVec 32)) Unit!32041)

(assert (=> b!952301 (= lt!429064 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10771 thiss!1141) lt!429066 lt!429034))))

(assert (=> b!952301 (arrayContainsKey!0 (_keys!10771 thiss!1141) lt!429066 #b00000000000000000000000000000000)))

(declare-fun lt!429065 () Unit!32041)

(assert (=> b!952301 (= lt!429065 lt!429064)))

(declare-fun res!638001 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57620 (_ BitVec 32)) SeekEntryResult!9159)

(assert (=> b!952301 (= res!638001 (= (seekEntryOrOpen!0 (select (arr!27703 (_keys!10771 thiss!1141)) lt!429034) (_keys!10771 thiss!1141) (mask!27661 thiss!1141)) (Found!9159 lt!429034)))))

(assert (=> b!952301 (=> (not res!638001) (not e!536307))))

(declare-fun bm!41549 () Bool)

(assert (=> bm!41549 (= call!41552 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429034 #b00000000000000000000000000000001) (_keys!10771 thiss!1141) (mask!27661 thiss!1141)))))

(declare-fun d!115505 () Bool)

(declare-fun res!638000 () Bool)

(declare-fun e!536306 () Bool)

(assert (=> d!115505 (=> res!638000 e!536306)))

(assert (=> d!115505 (= res!638000 (bvsge lt!429034 (size!28182 (_keys!10771 thiss!1141))))))

(assert (=> d!115505 (= (arrayForallSeekEntryOrOpenFound!0 lt!429034 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)) e!536306)))

(declare-fun b!952300 () Bool)

(assert (=> b!952300 (= e!536306 e!536305)))

(declare-fun c!99616 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952300 (= c!99616 (validKeyInArray!0 (select (arr!27703 (_keys!10771 thiss!1141)) lt!429034)))))

(assert (= (and d!115505 (not res!638000)) b!952300))

(assert (= (and b!952300 c!99616) b!952301))

(assert (= (and b!952300 (not c!99616)) b!952299))

(assert (= (and b!952301 res!638001) b!952298))

(assert (= (or b!952298 b!952299) bm!41549))

(declare-fun m!884491 () Bool)

(assert (=> b!952301 m!884491))

(declare-fun m!884493 () Bool)

(assert (=> b!952301 m!884493))

(declare-fun m!884495 () Bool)

(assert (=> b!952301 m!884495))

(assert (=> b!952301 m!884491))

(declare-fun m!884497 () Bool)

(assert (=> b!952301 m!884497))

(declare-fun m!884499 () Bool)

(assert (=> bm!41549 m!884499))

(assert (=> b!952300 m!884491))

(assert (=> b!952300 m!884491))

(declare-fun m!884501 () Bool)

(assert (=> b!952300 m!884501))

(assert (=> b!952236 d!115505))

(declare-fun d!115507 () Bool)

(declare-fun res!638006 () Bool)

(declare-fun e!536312 () Bool)

(assert (=> d!115507 (=> res!638006 e!536312)))

(assert (=> d!115507 (= res!638006 (= (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115507 (= (arrayContainsKey!0 (_keys!10771 thiss!1141) key!756 #b00000000000000000000000000000000) e!536312)))

(declare-fun b!952306 () Bool)

(declare-fun e!536313 () Bool)

(assert (=> b!952306 (= e!536312 e!536313)))

(declare-fun res!638007 () Bool)

(assert (=> b!952306 (=> (not res!638007) (not e!536313))))

(assert (=> b!952306 (= res!638007 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28182 (_keys!10771 thiss!1141))))))

(declare-fun b!952307 () Bool)

(assert (=> b!952307 (= e!536313 (arrayContainsKey!0 (_keys!10771 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115507 (not res!638006)) b!952306))

(assert (= (and b!952306 res!638007) b!952307))

(declare-fun m!884503 () Bool)

(assert (=> d!115507 m!884503))

(declare-fun m!884505 () Bool)

(assert (=> b!952307 m!884505))

(assert (=> b!952236 d!115507))

(declare-fun d!115509 () Bool)

(declare-fun e!536316 () Bool)

(assert (=> d!115509 e!536316))

(declare-fun c!99619 () Bool)

(assert (=> d!115509 (= c!99619 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429069 () Unit!32041)

(declare-fun choose!1597 (array!57620 array!57618 (_ BitVec 32) (_ BitVec 32) V!32689 V!32689 (_ BitVec 64) Int) Unit!32041)

(assert (=> d!115509 (= lt!429069 (choose!1597 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) key!756 (defaultEntry!5819 thiss!1141)))))

(assert (=> d!115509 (validMask!0 (mask!27661 thiss!1141))))

(assert (=> d!115509 (= (lemmaKeyInListMapIsInArray!334 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) key!756 (defaultEntry!5819 thiss!1141)) lt!429069)))

(declare-fun b!952312 () Bool)

(assert (=> b!952312 (= e!536316 (arrayContainsKey!0 (_keys!10771 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952313 () Bool)

(assert (=> b!952313 (= e!536316 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115509 c!99619) b!952312))

(assert (= (and d!115509 (not c!99619)) b!952313))

(declare-fun m!884507 () Bool)

(assert (=> d!115509 m!884507))

(assert (=> d!115509 m!884443))

(assert (=> b!952312 m!884447))

(assert (=> b!952236 d!115509))

(declare-fun d!115511 () Bool)

(declare-fun lt!429072 () (_ BitVec 32))

(assert (=> d!115511 (and (or (bvslt lt!429072 #b00000000000000000000000000000000) (bvsge lt!429072 (size!28182 (_keys!10771 thiss!1141))) (and (bvsge lt!429072 #b00000000000000000000000000000000) (bvslt lt!429072 (size!28182 (_keys!10771 thiss!1141))))) (bvsge lt!429072 #b00000000000000000000000000000000) (bvslt lt!429072 (size!28182 (_keys!10771 thiss!1141))) (= (select (arr!27703 (_keys!10771 thiss!1141)) lt!429072) key!756))))

(declare-fun e!536319 () (_ BitVec 32))

(assert (=> d!115511 (= lt!429072 e!536319)))

(declare-fun c!99622 () Bool)

(assert (=> d!115511 (= c!99622 (= (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115511 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))) (bvslt (size!28182 (_keys!10771 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115511 (= (arrayScanForKey!0 (_keys!10771 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429072)))

(declare-fun b!952318 () Bool)

(assert (=> b!952318 (= e!536319 #b00000000000000000000000000000000)))

(declare-fun b!952319 () Bool)

(assert (=> b!952319 (= e!536319 (arrayScanForKey!0 (_keys!10771 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115511 c!99622) b!952318))

(assert (= (and d!115511 (not c!99622)) b!952319))

(declare-fun m!884509 () Bool)

(assert (=> d!115511 m!884509))

(assert (=> d!115511 m!884503))

(declare-fun m!884511 () Bool)

(assert (=> b!952319 m!884511))

(assert (=> b!952236 d!115511))

(declare-fun d!115513 () Bool)

(assert (=> d!115513 (= (validMask!0 (mask!27661 thiss!1141)) (and (or (= (mask!27661 thiss!1141) #b00000000000000000000000000000111) (= (mask!27661 thiss!1141) #b00000000000000000000000000001111) (= (mask!27661 thiss!1141) #b00000000000000000000000000011111) (= (mask!27661 thiss!1141) #b00000000000000000000000000111111) (= (mask!27661 thiss!1141) #b00000000000000000000000001111111) (= (mask!27661 thiss!1141) #b00000000000000000000000011111111) (= (mask!27661 thiss!1141) #b00000000000000000000000111111111) (= (mask!27661 thiss!1141) #b00000000000000000000001111111111) (= (mask!27661 thiss!1141) #b00000000000000000000011111111111) (= (mask!27661 thiss!1141) #b00000000000000000000111111111111) (= (mask!27661 thiss!1141) #b00000000000000000001111111111111) (= (mask!27661 thiss!1141) #b00000000000000000011111111111111) (= (mask!27661 thiss!1141) #b00000000000000000111111111111111) (= (mask!27661 thiss!1141) #b00000000000000001111111111111111) (= (mask!27661 thiss!1141) #b00000000000000011111111111111111) (= (mask!27661 thiss!1141) #b00000000000000111111111111111111) (= (mask!27661 thiss!1141) #b00000000000001111111111111111111) (= (mask!27661 thiss!1141) #b00000000000011111111111111111111) (= (mask!27661 thiss!1141) #b00000000000111111111111111111111) (= (mask!27661 thiss!1141) #b00000000001111111111111111111111) (= (mask!27661 thiss!1141) #b00000000011111111111111111111111) (= (mask!27661 thiss!1141) #b00000000111111111111111111111111) (= (mask!27661 thiss!1141) #b00000001111111111111111111111111) (= (mask!27661 thiss!1141) #b00000011111111111111111111111111) (= (mask!27661 thiss!1141) #b00000111111111111111111111111111) (= (mask!27661 thiss!1141) #b00001111111111111111111111111111) (= (mask!27661 thiss!1141) #b00011111111111111111111111111111) (= (mask!27661 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27661 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952236 d!115513))

(declare-fun d!115515 () Bool)

(assert (=> d!115515 (arrayForallSeekEntryOrOpenFound!0 lt!429034 (_keys!10771 thiss!1141) (mask!27661 thiss!1141))))

(declare-fun lt!429075 () Unit!32041)

(declare-fun choose!38 (array!57620 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32041)

(assert (=> d!115515 (= lt!429075 (choose!38 (_keys!10771 thiss!1141) (mask!27661 thiss!1141) #b00000000000000000000000000000000 lt!429034))))

(assert (=> d!115515 (validMask!0 (mask!27661 thiss!1141))))

(assert (=> d!115515 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10771 thiss!1141) (mask!27661 thiss!1141) #b00000000000000000000000000000000 lt!429034) lt!429075)))

(declare-fun bs!26759 () Bool)

(assert (= bs!26759 d!115515))

(assert (=> bs!26759 m!884437))

(declare-fun m!884513 () Bool)

(assert (=> bs!26759 m!884513))

(assert (=> bs!26759 m!884443))

(assert (=> b!952236 d!115515))

(declare-fun d!115517 () Bool)

(assert (=> d!115517 (= (array_inv!21502 (_keys!10771 thiss!1141)) (bvsge (size!28182 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952241 d!115517))

(declare-fun d!115519 () Bool)

(assert (=> d!115519 (= (array_inv!21503 (_values!5842 thiss!1141)) (bvsge (size!28181 (_values!5842 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952241 d!115519))

(declare-fun d!115521 () Bool)

(declare-fun e!536325 () Bool)

(assert (=> d!115521 e!536325))

(declare-fun res!638010 () Bool)

(assert (=> d!115521 (=> res!638010 e!536325)))

(declare-fun lt!429086 () Bool)

(assert (=> d!115521 (= res!638010 (not lt!429086))))

(declare-fun lt!429085 () Bool)

(assert (=> d!115521 (= lt!429086 lt!429085)))

(declare-fun lt!429084 () Unit!32041)

(declare-fun e!536324 () Unit!32041)

(assert (=> d!115521 (= lt!429084 e!536324)))

(declare-fun c!99625 () Bool)

(assert (=> d!115521 (= c!99625 lt!429085)))

(declare-fun containsKey!471 (List!19363 (_ BitVec 64)) Bool)

(assert (=> d!115521 (= lt!429085 (containsKey!471 (toList!6155 (getCurrentListMap!3388 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141))) key!756))))

(assert (=> d!115521 (= (contains!5250 (getCurrentListMap!3388 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)) key!756) lt!429086)))

(declare-fun b!952326 () Bool)

(declare-fun lt!429087 () Unit!32041)

(assert (=> b!952326 (= e!536324 lt!429087)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!367 (List!19363 (_ BitVec 64)) Unit!32041)

(assert (=> b!952326 (= lt!429087 (lemmaContainsKeyImpliesGetValueByKeyDefined!367 (toList!6155 (getCurrentListMap!3388 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141))) key!756))))

(declare-datatypes ((Option!510 0))(
  ( (Some!509 (v!12999 V!32689)) (None!508) )
))
(declare-fun isDefined!376 (Option!510) Bool)

(declare-fun getValueByKey!504 (List!19363 (_ BitVec 64)) Option!510)

(assert (=> b!952326 (isDefined!376 (getValueByKey!504 (toList!6155 (getCurrentListMap!3388 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141))) key!756))))

(declare-fun b!952327 () Bool)

(declare-fun Unit!32043 () Unit!32041)

(assert (=> b!952327 (= e!536324 Unit!32043)))

(declare-fun b!952328 () Bool)

(assert (=> b!952328 (= e!536325 (isDefined!376 (getValueByKey!504 (toList!6155 (getCurrentListMap!3388 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141))) key!756)))))

(assert (= (and d!115521 c!99625) b!952326))

(assert (= (and d!115521 (not c!99625)) b!952327))

(assert (= (and d!115521 (not res!638010)) b!952328))

(declare-fun m!884515 () Bool)

(assert (=> d!115521 m!884515))

(declare-fun m!884517 () Bool)

(assert (=> b!952326 m!884517))

(declare-fun m!884519 () Bool)

(assert (=> b!952326 m!884519))

(assert (=> b!952326 m!884519))

(declare-fun m!884521 () Bool)

(assert (=> b!952326 m!884521))

(assert (=> b!952328 m!884519))

(assert (=> b!952328 m!884519))

(assert (=> b!952328 m!884521))

(assert (=> b!952237 d!115521))

(declare-fun b!952371 () Bool)

(declare-fun e!536356 () ListLongMap!12279)

(declare-fun call!41569 () ListLongMap!12279)

(assert (=> b!952371 (= e!536356 call!41569)))

(declare-fun bm!41564 () Bool)

(declare-fun call!41570 () Bool)

(declare-fun lt!429146 () ListLongMap!12279)

(assert (=> bm!41564 (= call!41570 (contains!5250 lt!429146 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952372 () Bool)

(declare-fun e!536358 () Bool)

(declare-fun apply!885 (ListLongMap!12279 (_ BitVec 64)) V!32689)

(declare-fun get!14562 (ValueCell!9915 V!32689) V!32689)

(declare-fun dynLambda!1658 (Int (_ BitVec 64)) V!32689)

(assert (=> b!952372 (= e!536358 (= (apply!885 lt!429146 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000)) (get!14562 (select (arr!27702 (_values!5842 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5819 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952372 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28181 (_values!5842 thiss!1141))))))

(assert (=> b!952372 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))))))

(declare-fun d!115523 () Bool)

(declare-fun e!536357 () Bool)

(assert (=> d!115523 e!536357))

(declare-fun res!638036 () Bool)

(assert (=> d!115523 (=> (not res!638036) (not e!536357))))

(assert (=> d!115523 (= res!638036 (or (bvsge #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))))))))

(declare-fun lt!429152 () ListLongMap!12279)

(assert (=> d!115523 (= lt!429146 lt!429152)))

(declare-fun lt!429135 () Unit!32041)

(declare-fun e!536360 () Unit!32041)

(assert (=> d!115523 (= lt!429135 e!536360)))

(declare-fun c!99638 () Bool)

(declare-fun e!536359 () Bool)

(assert (=> d!115523 (= c!99638 e!536359)))

(declare-fun res!638032 () Bool)

(assert (=> d!115523 (=> (not res!638032) (not e!536359))))

(assert (=> d!115523 (= res!638032 (bvslt #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))))))

(declare-fun e!536362 () ListLongMap!12279)

(assert (=> d!115523 (= lt!429152 e!536362)))

(declare-fun c!99640 () Bool)

(assert (=> d!115523 (= c!99640 (and (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115523 (validMask!0 (mask!27661 thiss!1141))))

(assert (=> d!115523 (= (getCurrentListMap!3388 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)) lt!429146)))

(declare-fun b!952373 () Bool)

(declare-fun e!536352 () Bool)

(assert (=> b!952373 (= e!536352 (= (apply!885 lt!429146 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5655 thiss!1141)))))

(declare-fun b!952374 () Bool)

(declare-fun call!41568 () ListLongMap!12279)

(declare-fun +!2869 (ListLongMap!12279 tuple2!13582) ListLongMap!12279)

(assert (=> b!952374 (= e!536362 (+!2869 call!41568 (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5655 thiss!1141))))))

(declare-fun b!952375 () Bool)

(declare-fun c!99641 () Bool)

(assert (=> b!952375 (= c!99641 (and (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!536363 () ListLongMap!12279)

(assert (=> b!952375 (= e!536363 e!536356)))

(declare-fun b!952376 () Bool)

(declare-fun call!41573 () ListLongMap!12279)

(assert (=> b!952376 (= e!536363 call!41573)))

(declare-fun b!952377 () Bool)

(declare-fun e!536361 () Bool)

(assert (=> b!952377 (= e!536361 e!536358)))

(declare-fun res!638035 () Bool)

(assert (=> b!952377 (=> (not res!638035) (not e!536358))))

(assert (=> b!952377 (= res!638035 (contains!5250 lt!429146 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952377 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))))))

(declare-fun b!952378 () Bool)

(assert (=> b!952378 (= e!536356 call!41573)))

(declare-fun b!952379 () Bool)

(declare-fun Unit!32044 () Unit!32041)

(assert (=> b!952379 (= e!536360 Unit!32044)))

(declare-fun b!952380 () Bool)

(declare-fun e!536355 () Bool)

(assert (=> b!952380 (= e!536355 (validKeyInArray!0 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952381 () Bool)

(assert (=> b!952381 (= e!536362 e!536363)))

(declare-fun c!99642 () Bool)

(assert (=> b!952381 (= c!99642 (and (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952382 () Bool)

(declare-fun e!536354 () Bool)

(assert (=> b!952382 (= e!536354 (= (apply!885 lt!429146 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5655 thiss!1141)))))

(declare-fun bm!41565 () Bool)

(declare-fun call!41567 () ListLongMap!12279)

(declare-fun getCurrentListMapNoExtraKeys!3324 (array!57620 array!57618 (_ BitVec 32) (_ BitVec 32) V!32689 V!32689 (_ BitVec 32) Int) ListLongMap!12279)

(assert (=> bm!41565 (= call!41567 (getCurrentListMapNoExtraKeys!3324 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)))))

(declare-fun b!952383 () Bool)

(declare-fun e!536353 () Bool)

(assert (=> b!952383 (= e!536357 e!536353)))

(declare-fun c!99639 () Bool)

(assert (=> b!952383 (= c!99639 (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952384 () Bool)

(declare-fun res!638033 () Bool)

(assert (=> b!952384 (=> (not res!638033) (not e!536357))))

(assert (=> b!952384 (= res!638033 e!536361)))

(declare-fun res!638030 () Bool)

(assert (=> b!952384 (=> res!638030 e!536361)))

(assert (=> b!952384 (= res!638030 (not e!536355))))

(declare-fun res!638029 () Bool)

(assert (=> b!952384 (=> (not res!638029) (not e!536355))))

(assert (=> b!952384 (= res!638029 (bvslt #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))))))

(declare-fun bm!41566 () Bool)

(declare-fun call!41572 () ListLongMap!12279)

(assert (=> bm!41566 (= call!41569 call!41572)))

(declare-fun b!952385 () Bool)

(assert (=> b!952385 (= e!536353 e!536354)))

(declare-fun res!638031 () Bool)

(declare-fun call!41571 () Bool)

(assert (=> b!952385 (= res!638031 call!41571)))

(assert (=> b!952385 (=> (not res!638031) (not e!536354))))

(declare-fun b!952386 () Bool)

(assert (=> b!952386 (= e!536359 (validKeyInArray!0 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41567 () Bool)

(assert (=> bm!41567 (= call!41571 (contains!5250 lt!429146 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952387 () Bool)

(declare-fun e!536364 () Bool)

(assert (=> b!952387 (= e!536364 e!536352)))

(declare-fun res!638037 () Bool)

(assert (=> b!952387 (= res!638037 call!41570)))

(assert (=> b!952387 (=> (not res!638037) (not e!536352))))

(declare-fun bm!41568 () Bool)

(assert (=> bm!41568 (= call!41568 (+!2869 (ite c!99640 call!41567 (ite c!99642 call!41572 call!41569)) (ite (or c!99640 c!99642) (tuple2!13583 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5655 thiss!1141)) (tuple2!13583 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5655 thiss!1141)))))))

(declare-fun b!952388 () Bool)

(assert (=> b!952388 (= e!536364 (not call!41570))))

(declare-fun b!952389 () Bool)

(declare-fun res!638034 () Bool)

(assert (=> b!952389 (=> (not res!638034) (not e!536357))))

(assert (=> b!952389 (= res!638034 e!536364)))

(declare-fun c!99643 () Bool)

(assert (=> b!952389 (= c!99643 (not (= (bvand (extraKeys!5551 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!41569 () Bool)

(assert (=> bm!41569 (= call!41572 call!41567)))

(declare-fun bm!41570 () Bool)

(assert (=> bm!41570 (= call!41573 call!41568)))

(declare-fun b!952390 () Bool)

(declare-fun lt!429140 () Unit!32041)

(assert (=> b!952390 (= e!536360 lt!429140)))

(declare-fun lt!429145 () ListLongMap!12279)

(assert (=> b!952390 (= lt!429145 (getCurrentListMapNoExtraKeys!3324 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)))))

(declare-fun lt!429132 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429151 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429151 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429133 () Unit!32041)

(declare-fun addStillContains!588 (ListLongMap!12279 (_ BitVec 64) V!32689 (_ BitVec 64)) Unit!32041)

(assert (=> b!952390 (= lt!429133 (addStillContains!588 lt!429145 lt!429132 (zeroValue!5655 thiss!1141) lt!429151))))

(assert (=> b!952390 (contains!5250 (+!2869 lt!429145 (tuple2!13583 lt!429132 (zeroValue!5655 thiss!1141))) lt!429151)))

(declare-fun lt!429142 () Unit!32041)

(assert (=> b!952390 (= lt!429142 lt!429133)))

(declare-fun lt!429150 () ListLongMap!12279)

(assert (=> b!952390 (= lt!429150 (getCurrentListMapNoExtraKeys!3324 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)))))

(declare-fun lt!429138 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429138 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429139 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429139 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429148 () Unit!32041)

(declare-fun addApplyDifferent!468 (ListLongMap!12279 (_ BitVec 64) V!32689 (_ BitVec 64)) Unit!32041)

(assert (=> b!952390 (= lt!429148 (addApplyDifferent!468 lt!429150 lt!429138 (minValue!5655 thiss!1141) lt!429139))))

(assert (=> b!952390 (= (apply!885 (+!2869 lt!429150 (tuple2!13583 lt!429138 (minValue!5655 thiss!1141))) lt!429139) (apply!885 lt!429150 lt!429139))))

(declare-fun lt!429137 () Unit!32041)

(assert (=> b!952390 (= lt!429137 lt!429148)))

(declare-fun lt!429149 () ListLongMap!12279)

(assert (=> b!952390 (= lt!429149 (getCurrentListMapNoExtraKeys!3324 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)))))

(declare-fun lt!429147 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429147 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429144 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429144 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429134 () Unit!32041)

(assert (=> b!952390 (= lt!429134 (addApplyDifferent!468 lt!429149 lt!429147 (zeroValue!5655 thiss!1141) lt!429144))))

(assert (=> b!952390 (= (apply!885 (+!2869 lt!429149 (tuple2!13583 lt!429147 (zeroValue!5655 thiss!1141))) lt!429144) (apply!885 lt!429149 lt!429144))))

(declare-fun lt!429143 () Unit!32041)

(assert (=> b!952390 (= lt!429143 lt!429134)))

(declare-fun lt!429153 () ListLongMap!12279)

(assert (=> b!952390 (= lt!429153 (getCurrentListMapNoExtraKeys!3324 (_keys!10771 thiss!1141) (_values!5842 thiss!1141) (mask!27661 thiss!1141) (extraKeys!5551 thiss!1141) (zeroValue!5655 thiss!1141) (minValue!5655 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5819 thiss!1141)))))

(declare-fun lt!429141 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429141 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429136 () (_ BitVec 64))

(assert (=> b!952390 (= lt!429136 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952390 (= lt!429140 (addApplyDifferent!468 lt!429153 lt!429141 (minValue!5655 thiss!1141) lt!429136))))

(assert (=> b!952390 (= (apply!885 (+!2869 lt!429153 (tuple2!13583 lt!429141 (minValue!5655 thiss!1141))) lt!429136) (apply!885 lt!429153 lt!429136))))

(declare-fun b!952391 () Bool)

(assert (=> b!952391 (= e!536353 (not call!41571))))

(assert (= (and d!115523 c!99640) b!952374))

(assert (= (and d!115523 (not c!99640)) b!952381))

(assert (= (and b!952381 c!99642) b!952376))

(assert (= (and b!952381 (not c!99642)) b!952375))

(assert (= (and b!952375 c!99641) b!952378))

(assert (= (and b!952375 (not c!99641)) b!952371))

(assert (= (or b!952378 b!952371) bm!41566))

(assert (= (or b!952376 bm!41566) bm!41569))

(assert (= (or b!952376 b!952378) bm!41570))

(assert (= (or b!952374 bm!41569) bm!41565))

(assert (= (or b!952374 bm!41570) bm!41568))

(assert (= (and d!115523 res!638032) b!952386))

(assert (= (and d!115523 c!99638) b!952390))

(assert (= (and d!115523 (not c!99638)) b!952379))

(assert (= (and d!115523 res!638036) b!952384))

(assert (= (and b!952384 res!638029) b!952380))

(assert (= (and b!952384 (not res!638030)) b!952377))

(assert (= (and b!952377 res!638035) b!952372))

(assert (= (and b!952384 res!638033) b!952389))

(assert (= (and b!952389 c!99643) b!952387))

(assert (= (and b!952389 (not c!99643)) b!952388))

(assert (= (and b!952387 res!638037) b!952373))

(assert (= (or b!952387 b!952388) bm!41564))

(assert (= (and b!952389 res!638034) b!952383))

(assert (= (and b!952383 c!99639) b!952385))

(assert (= (and b!952383 (not c!99639)) b!952391))

(assert (= (and b!952385 res!638031) b!952382))

(assert (= (or b!952385 b!952391) bm!41567))

(declare-fun b_lambda!14411 () Bool)

(assert (=> (not b_lambda!14411) (not b!952372)))

(declare-fun t!27718 () Bool)

(declare-fun tb!6205 () Bool)

(assert (=> (and b!952241 (= (defaultEntry!5819 thiss!1141) (defaultEntry!5819 thiss!1141)) t!27718) tb!6205))

(declare-fun result!12337 () Bool)

(assert (=> tb!6205 (= result!12337 tp_is_empty!20793)))

(assert (=> b!952372 t!27718))

(declare-fun b_and!29767 () Bool)

(assert (= b_and!29763 (and (=> t!27718 result!12337) b_and!29767)))

(declare-fun m!884523 () Bool)

(assert (=> bm!41567 m!884523))

(declare-fun m!884525 () Bool)

(assert (=> b!952373 m!884525))

(declare-fun m!884527 () Bool)

(assert (=> b!952372 m!884527))

(declare-fun m!884529 () Bool)

(assert (=> b!952372 m!884529))

(declare-fun m!884531 () Bool)

(assert (=> b!952372 m!884531))

(assert (=> b!952372 m!884503))

(assert (=> b!952372 m!884529))

(assert (=> b!952372 m!884527))

(assert (=> b!952372 m!884503))

(declare-fun m!884533 () Bool)

(assert (=> b!952372 m!884533))

(assert (=> d!115523 m!884443))

(declare-fun m!884535 () Bool)

(assert (=> b!952382 m!884535))

(declare-fun m!884537 () Bool)

(assert (=> b!952390 m!884537))

(declare-fun m!884539 () Bool)

(assert (=> b!952390 m!884539))

(declare-fun m!884541 () Bool)

(assert (=> b!952390 m!884541))

(declare-fun m!884543 () Bool)

(assert (=> b!952390 m!884543))

(declare-fun m!884545 () Bool)

(assert (=> b!952390 m!884545))

(declare-fun m!884547 () Bool)

(assert (=> b!952390 m!884547))

(declare-fun m!884549 () Bool)

(assert (=> b!952390 m!884549))

(assert (=> b!952390 m!884537))

(declare-fun m!884551 () Bool)

(assert (=> b!952390 m!884551))

(declare-fun m!884553 () Bool)

(assert (=> b!952390 m!884553))

(declare-fun m!884555 () Bool)

(assert (=> b!952390 m!884555))

(declare-fun m!884557 () Bool)

(assert (=> b!952390 m!884557))

(declare-fun m!884559 () Bool)

(assert (=> b!952390 m!884559))

(assert (=> b!952390 m!884557))

(declare-fun m!884561 () Bool)

(assert (=> b!952390 m!884561))

(declare-fun m!884563 () Bool)

(assert (=> b!952390 m!884563))

(assert (=> b!952390 m!884547))

(assert (=> b!952390 m!884503))

(assert (=> b!952390 m!884541))

(declare-fun m!884565 () Bool)

(assert (=> b!952390 m!884565))

(declare-fun m!884567 () Bool)

(assert (=> b!952390 m!884567))

(assert (=> b!952380 m!884503))

(assert (=> b!952380 m!884503))

(declare-fun m!884569 () Bool)

(assert (=> b!952380 m!884569))

(assert (=> bm!41565 m!884545))

(declare-fun m!884571 () Bool)

(assert (=> bm!41564 m!884571))

(declare-fun m!884573 () Bool)

(assert (=> b!952374 m!884573))

(assert (=> b!952377 m!884503))

(assert (=> b!952377 m!884503))

(declare-fun m!884575 () Bool)

(assert (=> b!952377 m!884575))

(declare-fun m!884577 () Bool)

(assert (=> bm!41568 m!884577))

(assert (=> b!952386 m!884503))

(assert (=> b!952386 m!884503))

(assert (=> b!952386 m!884569))

(assert (=> b!952237 d!115523))

(declare-fun d!115525 () Bool)

(declare-fun res!638044 () Bool)

(declare-fun e!536367 () Bool)

(assert (=> d!115525 (=> (not res!638044) (not e!536367))))

(declare-fun simpleValid!381 (LongMapFixedSize!4980) Bool)

(assert (=> d!115525 (= res!638044 (simpleValid!381 thiss!1141))))

(assert (=> d!115525 (= (valid!1895 thiss!1141) e!536367)))

(declare-fun b!952400 () Bool)

(declare-fun res!638045 () Bool)

(assert (=> b!952400 (=> (not res!638045) (not e!536367))))

(declare-fun arrayCountValidKeys!0 (array!57620 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952400 (= res!638045 (= (arrayCountValidKeys!0 (_keys!10771 thiss!1141) #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))) (_size!2545 thiss!1141)))))

(declare-fun b!952401 () Bool)

(declare-fun res!638046 () Bool)

(assert (=> b!952401 (=> (not res!638046) (not e!536367))))

(assert (=> b!952401 (= res!638046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)))))

(declare-fun b!952402 () Bool)

(declare-datatypes ((List!19364 0))(
  ( (Nil!19361) (Cons!19360 (h!20522 (_ BitVec 64)) (t!27719 List!19364)) )
))
(declare-fun arrayNoDuplicates!0 (array!57620 (_ BitVec 32) List!19364) Bool)

(assert (=> b!952402 (= e!536367 (arrayNoDuplicates!0 (_keys!10771 thiss!1141) #b00000000000000000000000000000000 Nil!19361))))

(assert (= (and d!115525 res!638044) b!952400))

(assert (= (and b!952400 res!638045) b!952401))

(assert (= (and b!952401 res!638046) b!952402))

(declare-fun m!884579 () Bool)

(assert (=> d!115525 m!884579))

(declare-fun m!884581 () Bool)

(assert (=> b!952400 m!884581))

(assert (=> b!952401 m!884427))

(declare-fun m!884583 () Bool)

(assert (=> b!952402 m!884583))

(assert (=> start!81480 d!115525))

(declare-fun b!952403 () Bool)

(declare-fun e!536370 () Bool)

(declare-fun call!41574 () Bool)

(assert (=> b!952403 (= e!536370 call!41574)))

(declare-fun b!952404 () Bool)

(declare-fun e!536368 () Bool)

(assert (=> b!952404 (= e!536368 call!41574)))

(declare-fun b!952406 () Bool)

(assert (=> b!952406 (= e!536368 e!536370)))

(declare-fun lt!429156 () (_ BitVec 64))

(assert (=> b!952406 (= lt!429156 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429154 () Unit!32041)

(assert (=> b!952406 (= lt!429154 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10771 thiss!1141) lt!429156 #b00000000000000000000000000000000))))

(assert (=> b!952406 (arrayContainsKey!0 (_keys!10771 thiss!1141) lt!429156 #b00000000000000000000000000000000)))

(declare-fun lt!429155 () Unit!32041)

(assert (=> b!952406 (= lt!429155 lt!429154)))

(declare-fun res!638048 () Bool)

(assert (=> b!952406 (= res!638048 (= (seekEntryOrOpen!0 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000) (_keys!10771 thiss!1141) (mask!27661 thiss!1141)) (Found!9159 #b00000000000000000000000000000000)))))

(assert (=> b!952406 (=> (not res!638048) (not e!536370))))

(declare-fun bm!41571 () Bool)

(assert (=> bm!41571 (= call!41574 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10771 thiss!1141) (mask!27661 thiss!1141)))))

(declare-fun d!115527 () Bool)

(declare-fun res!638047 () Bool)

(declare-fun e!536369 () Bool)

(assert (=> d!115527 (=> res!638047 e!536369)))

(assert (=> d!115527 (= res!638047 (bvsge #b00000000000000000000000000000000 (size!28182 (_keys!10771 thiss!1141))))))

(assert (=> d!115527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10771 thiss!1141) (mask!27661 thiss!1141)) e!536369)))

(declare-fun b!952405 () Bool)

(assert (=> b!952405 (= e!536369 e!536368)))

(declare-fun c!99644 () Bool)

(assert (=> b!952405 (= c!99644 (validKeyInArray!0 (select (arr!27703 (_keys!10771 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115527 (not res!638047)) b!952405))

(assert (= (and b!952405 c!99644) b!952406))

(assert (= (and b!952405 (not c!99644)) b!952404))

(assert (= (and b!952406 res!638048) b!952403))

(assert (= (or b!952403 b!952404) bm!41571))

(assert (=> b!952406 m!884503))

(declare-fun m!884585 () Bool)

(assert (=> b!952406 m!884585))

(declare-fun m!884587 () Bool)

(assert (=> b!952406 m!884587))

(assert (=> b!952406 m!884503))

(declare-fun m!884589 () Bool)

(assert (=> b!952406 m!884589))

(declare-fun m!884591 () Bool)

(assert (=> bm!41571 m!884591))

(assert (=> b!952405 m!884503))

(assert (=> b!952405 m!884503))

(assert (=> b!952405 m!884569))

(assert (=> b!952235 d!115527))

(declare-fun b!952413 () Bool)

(declare-fun e!536375 () Bool)

(assert (=> b!952413 (= e!536375 tp_is_empty!20793)))

(declare-fun mapIsEmpty!33130 () Bool)

(declare-fun mapRes!33130 () Bool)

(assert (=> mapIsEmpty!33130 mapRes!33130))

(declare-fun b!952414 () Bool)

(declare-fun e!536376 () Bool)

(assert (=> b!952414 (= e!536376 tp_is_empty!20793)))

(declare-fun mapNonEmpty!33130 () Bool)

(declare-fun tp!63483 () Bool)

(assert (=> mapNonEmpty!33130 (= mapRes!33130 (and tp!63483 e!536375))))

(declare-fun mapRest!33130 () (Array (_ BitVec 32) ValueCell!9915))

(declare-fun mapValue!33130 () ValueCell!9915)

(declare-fun mapKey!33130 () (_ BitVec 32))

(assert (=> mapNonEmpty!33130 (= mapRest!33124 (store mapRest!33130 mapKey!33130 mapValue!33130))))

(declare-fun condMapEmpty!33130 () Bool)

(declare-fun mapDefault!33130 () ValueCell!9915)

(assert (=> mapNonEmpty!33124 (= condMapEmpty!33130 (= mapRest!33124 ((as const (Array (_ BitVec 32) ValueCell!9915)) mapDefault!33130)))))

(assert (=> mapNonEmpty!33124 (= tp!63473 (and e!536376 mapRes!33130))))

(assert (= (and mapNonEmpty!33124 condMapEmpty!33130) mapIsEmpty!33130))

(assert (= (and mapNonEmpty!33124 (not condMapEmpty!33130)) mapNonEmpty!33130))

(assert (= (and mapNonEmpty!33130 ((_ is ValueCellFull!9915) mapValue!33130)) b!952413))

(assert (= (and mapNonEmpty!33124 ((_ is ValueCellFull!9915) mapDefault!33130)) b!952414))

(declare-fun m!884593 () Bool)

(assert (=> mapNonEmpty!33130 m!884593))

(declare-fun b_lambda!14413 () Bool)

(assert (= b_lambda!14411 (or (and b!952241 b_free!18285) b_lambda!14413)))

(check-sat (not b_next!18285) (not b!952401) (not b!952405) tp_is_empty!20793 (not b!952406) (not b!952285) (not bm!41567) (not b!952380) (not bm!41571) (not bm!41565) (not b!952400) (not b!952382) (not b!952386) (not b!952301) (not b!952373) (not b!952300) (not mapNonEmpty!33130) (not d!115515) (not bm!41549) (not b!952377) (not b!952372) (not b!952319) (not b!952326) b_and!29767 (not b!952328) (not d!115509) (not bm!41564) (not b_lambda!14413) (not d!115523) (not b!952374) (not d!115521) (not d!115503) (not b!952390) (not bm!41568) (not b!952402) (not d!115525) (not b!952312) (not b!952307))
(check-sat b_and!29767 (not b_next!18285))
