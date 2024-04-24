; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81400 () Bool)

(assert start!81400)

(declare-fun b!951394 () Bool)

(declare-fun b_free!18247 () Bool)

(declare-fun b_next!18247 () Bool)

(assert (=> b!951394 (= b_free!18247 (not b_next!18247))))

(declare-fun tp!63341 () Bool)

(declare-fun b_and!29715 () Bool)

(assert (=> b!951394 (= tp!63341 b_and!29715)))

(declare-fun mapNonEmpty!33047 () Bool)

(declare-fun mapRes!33047 () Bool)

(declare-fun tp!63340 () Bool)

(declare-fun e!535731 () Bool)

(assert (=> mapNonEmpty!33047 (= mapRes!33047 (and tp!63340 e!535731))))

(declare-datatypes ((V!32639 0))(
  ( (V!32640 (val!10428 Int)) )
))
(declare-datatypes ((ValueCell!9896 0))(
  ( (ValueCellFull!9896 (v!12969 V!32639)) (EmptyCell!9896) )
))
(declare-fun mapRest!33047 () (Array (_ BitVec 32) ValueCell!9896))

(declare-fun mapKey!33047 () (_ BitVec 32))

(declare-datatypes ((array!57581 0))(
  ( (array!57582 (arr!27685 (Array (_ BitVec 32) ValueCell!9896)) (size!28163 (_ BitVec 32))) )
))
(declare-datatypes ((array!57583 0))(
  ( (array!57584 (arr!27686 (Array (_ BitVec 32) (_ BitVec 64))) (size!28164 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4942 0))(
  ( (LongMapFixedSize!4943 (defaultEntry!5784 Int) (mask!27631 (_ BitVec 32)) (extraKeys!5516 (_ BitVec 32)) (zeroValue!5620 V!32639) (minValue!5620 V!32639) (_size!2526 (_ BitVec 32)) (_keys!10749 array!57583) (_values!5807 array!57581) (_vacant!2526 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4942)

(declare-fun mapValue!33047 () ValueCell!9896)

(assert (=> mapNonEmpty!33047 (= (arr!27685 (_values!5807 thiss!1141)) (store mapRest!33047 mapKey!33047 mapValue!33047))))

(declare-fun b!951391 () Bool)

(declare-fun e!535729 () Bool)

(assert (=> b!951391 (= e!535729 (= (size!28164 (_keys!10749 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27631 thiss!1141))))))

(declare-fun b!951393 () Bool)

(declare-fun e!535727 () Bool)

(declare-fun e!535728 () Bool)

(assert (=> b!951393 (= e!535727 (and e!535728 mapRes!33047))))

(declare-fun condMapEmpty!33047 () Bool)

(declare-fun mapDefault!33047 () ValueCell!9896)

(assert (=> b!951393 (= condMapEmpty!33047 (= (arr!27685 (_values!5807 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9896)) mapDefault!33047)))))

(declare-fun e!535725 () Bool)

(declare-fun tp_is_empty!20755 () Bool)

(declare-fun array_inv!21570 (array!57583) Bool)

(declare-fun array_inv!21571 (array!57581) Bool)

(assert (=> b!951394 (= e!535725 (and tp!63341 tp_is_empty!20755 (array_inv!21570 (_keys!10749 thiss!1141)) (array_inv!21571 (_values!5807 thiss!1141)) e!535727))))

(declare-fun mapIsEmpty!33047 () Bool)

(assert (=> mapIsEmpty!33047 mapRes!33047))

(declare-fun b!951395 () Bool)

(declare-fun res!637568 () Bool)

(declare-fun e!535730 () Bool)

(assert (=> b!951395 (=> (not res!637568) (not e!535730))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9104 0))(
  ( (MissingZero!9104 (index!38787 (_ BitVec 32))) (Found!9104 (index!38788 (_ BitVec 32))) (Intermediate!9104 (undefined!9916 Bool) (index!38789 (_ BitVec 32)) (x!81754 (_ BitVec 32))) (Undefined!9104) (MissingVacant!9104 (index!38790 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57583 (_ BitVec 32)) SeekEntryResult!9104)

(assert (=> b!951395 (= res!637568 (not ((_ is Found!9104) (seekEntry!0 key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)))))))

(declare-fun b!951396 () Bool)

(declare-fun res!637570 () Bool)

(assert (=> b!951396 (=> (not res!637570) (not e!535730))))

(assert (=> b!951396 (= res!637570 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951397 () Bool)

(assert (=> b!951397 (= e!535730 (not e!535729))))

(declare-fun res!637571 () Bool)

(assert (=> b!951397 (=> res!637571 e!535729)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!951397 (= res!637571 (not (validMask!0 (mask!27631 thiss!1141))))))

(declare-fun lt!428419 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!57583 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951397 (= lt!428419 (arrayScanForKey!0 (_keys!10749 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!951397 (arrayContainsKey!0 (_keys!10749 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31976 0))(
  ( (Unit!31977) )
))
(declare-fun lt!428418 () Unit!31976)

(declare-fun lemmaKeyInListMapIsInArray!319 (array!57583 array!57581 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 64) Int) Unit!31976)

(assert (=> b!951397 (= lt!428418 (lemmaKeyInListMapIsInArray!319 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)))))

(declare-fun res!637572 () Bool)

(assert (=> start!81400 (=> (not res!637572) (not e!535730))))

(declare-fun valid!1892 (LongMapFixedSize!4942) Bool)

(assert (=> start!81400 (= res!637572 (valid!1892 thiss!1141))))

(assert (=> start!81400 e!535730))

(assert (=> start!81400 e!535725))

(assert (=> start!81400 true))

(declare-fun b!951392 () Bool)

(declare-fun res!637569 () Bool)

(assert (=> b!951392 (=> (not res!637569) (not e!535730))))

(declare-datatypes ((tuple2!13538 0))(
  ( (tuple2!13539 (_1!6780 (_ BitVec 64)) (_2!6780 V!32639)) )
))
(declare-datatypes ((List!19332 0))(
  ( (Nil!19329) (Cons!19328 (h!20494 tuple2!13538) (t!27665 List!19332)) )
))
(declare-datatypes ((ListLongMap!12237 0))(
  ( (ListLongMap!12238 (toList!6134 List!19332)) )
))
(declare-fun contains!5236 (ListLongMap!12237 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3367 (array!57583 array!57581 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 32) Int) ListLongMap!12237)

(assert (=> b!951392 (= res!637569 (contains!5236 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) key!756))))

(declare-fun b!951398 () Bool)

(assert (=> b!951398 (= e!535731 tp_is_empty!20755)))

(declare-fun b!951399 () Bool)

(assert (=> b!951399 (= e!535728 tp_is_empty!20755)))

(assert (= (and start!81400 res!637572) b!951396))

(assert (= (and b!951396 res!637570) b!951395))

(assert (= (and b!951395 res!637568) b!951392))

(assert (= (and b!951392 res!637569) b!951397))

(assert (= (and b!951397 (not res!637571)) b!951391))

(assert (= (and b!951393 condMapEmpty!33047) mapIsEmpty!33047))

(assert (= (and b!951393 (not condMapEmpty!33047)) mapNonEmpty!33047))

(assert (= (and mapNonEmpty!33047 ((_ is ValueCellFull!9896) mapValue!33047)) b!951398))

(assert (= (and b!951393 ((_ is ValueCellFull!9896) mapDefault!33047)) b!951399))

(assert (= b!951394 b!951393))

(assert (= start!81400 b!951394))

(declare-fun m!884185 () Bool)

(assert (=> b!951392 m!884185))

(assert (=> b!951392 m!884185))

(declare-fun m!884187 () Bool)

(assert (=> b!951392 m!884187))

(declare-fun m!884189 () Bool)

(assert (=> b!951397 m!884189))

(declare-fun m!884191 () Bool)

(assert (=> b!951397 m!884191))

(declare-fun m!884193 () Bool)

(assert (=> b!951397 m!884193))

(declare-fun m!884195 () Bool)

(assert (=> b!951397 m!884195))

(declare-fun m!884197 () Bool)

(assert (=> b!951394 m!884197))

(declare-fun m!884199 () Bool)

(assert (=> b!951394 m!884199))

(declare-fun m!884201 () Bool)

(assert (=> mapNonEmpty!33047 m!884201))

(declare-fun m!884203 () Bool)

(assert (=> b!951395 m!884203))

(declare-fun m!884205 () Bool)

(assert (=> start!81400 m!884205))

(check-sat (not b!951395) (not start!81400) (not b_next!18247) b_and!29715 (not mapNonEmpty!33047) tp_is_empty!20755 (not b!951397) (not b!951394) (not b!951392))
(check-sat b_and!29715 (not b_next!18247))
(get-model)

(declare-fun d!115511 () Bool)

(assert (=> d!115511 (= (validMask!0 (mask!27631 thiss!1141)) (and (or (= (mask!27631 thiss!1141) #b00000000000000000000000000000111) (= (mask!27631 thiss!1141) #b00000000000000000000000000001111) (= (mask!27631 thiss!1141) #b00000000000000000000000000011111) (= (mask!27631 thiss!1141) #b00000000000000000000000000111111) (= (mask!27631 thiss!1141) #b00000000000000000000000001111111) (= (mask!27631 thiss!1141) #b00000000000000000000000011111111) (= (mask!27631 thiss!1141) #b00000000000000000000000111111111) (= (mask!27631 thiss!1141) #b00000000000000000000001111111111) (= (mask!27631 thiss!1141) #b00000000000000000000011111111111) (= (mask!27631 thiss!1141) #b00000000000000000000111111111111) (= (mask!27631 thiss!1141) #b00000000000000000001111111111111) (= (mask!27631 thiss!1141) #b00000000000000000011111111111111) (= (mask!27631 thiss!1141) #b00000000000000000111111111111111) (= (mask!27631 thiss!1141) #b00000000000000001111111111111111) (= (mask!27631 thiss!1141) #b00000000000000011111111111111111) (= (mask!27631 thiss!1141) #b00000000000000111111111111111111) (= (mask!27631 thiss!1141) #b00000000000001111111111111111111) (= (mask!27631 thiss!1141) #b00000000000011111111111111111111) (= (mask!27631 thiss!1141) #b00000000000111111111111111111111) (= (mask!27631 thiss!1141) #b00000000001111111111111111111111) (= (mask!27631 thiss!1141) #b00000000011111111111111111111111) (= (mask!27631 thiss!1141) #b00000000111111111111111111111111) (= (mask!27631 thiss!1141) #b00000001111111111111111111111111) (= (mask!27631 thiss!1141) #b00000011111111111111111111111111) (= (mask!27631 thiss!1141) #b00000111111111111111111111111111) (= (mask!27631 thiss!1141) #b00001111111111111111111111111111) (= (mask!27631 thiss!1141) #b00011111111111111111111111111111) (= (mask!27631 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27631 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!951397 d!115511))

(declare-fun d!115513 () Bool)

(declare-fun lt!428434 () (_ BitVec 32))

(assert (=> d!115513 (and (or (bvslt lt!428434 #b00000000000000000000000000000000) (bvsge lt!428434 (size!28164 (_keys!10749 thiss!1141))) (and (bvsge lt!428434 #b00000000000000000000000000000000) (bvslt lt!428434 (size!28164 (_keys!10749 thiss!1141))))) (bvsge lt!428434 #b00000000000000000000000000000000) (bvslt lt!428434 (size!28164 (_keys!10749 thiss!1141))) (= (select (arr!27686 (_keys!10749 thiss!1141)) lt!428434) key!756))))

(declare-fun e!535776 () (_ BitVec 32))

(assert (=> d!115513 (= lt!428434 e!535776)))

(declare-fun c!99538 () Bool)

(assert (=> d!115513 (= c!99538 (= (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115513 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))) (bvslt (size!28164 (_keys!10749 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115513 (= (arrayScanForKey!0 (_keys!10749 thiss!1141) key!756 #b00000000000000000000000000000000) lt!428434)))

(declare-fun b!951458 () Bool)

(assert (=> b!951458 (= e!535776 #b00000000000000000000000000000000)))

(declare-fun b!951459 () Bool)

(assert (=> b!951459 (= e!535776 (arrayScanForKey!0 (_keys!10749 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115513 c!99538) b!951458))

(assert (= (and d!115513 (not c!99538)) b!951459))

(declare-fun m!884251 () Bool)

(assert (=> d!115513 m!884251))

(declare-fun m!884253 () Bool)

(assert (=> d!115513 m!884253))

(declare-fun m!884255 () Bool)

(assert (=> b!951459 m!884255))

(assert (=> b!951397 d!115513))

(declare-fun d!115515 () Bool)

(declare-fun res!637607 () Bool)

(declare-fun e!535781 () Bool)

(assert (=> d!115515 (=> res!637607 e!535781)))

(assert (=> d!115515 (= res!637607 (= (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115515 (= (arrayContainsKey!0 (_keys!10749 thiss!1141) key!756 #b00000000000000000000000000000000) e!535781)))

(declare-fun b!951464 () Bool)

(declare-fun e!535782 () Bool)

(assert (=> b!951464 (= e!535781 e!535782)))

(declare-fun res!637608 () Bool)

(assert (=> b!951464 (=> (not res!637608) (not e!535782))))

(assert (=> b!951464 (= res!637608 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun b!951465 () Bool)

(assert (=> b!951465 (= e!535782 (arrayContainsKey!0 (_keys!10749 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115515 (not res!637607)) b!951464))

(assert (= (and b!951464 res!637608) b!951465))

(assert (=> d!115515 m!884253))

(declare-fun m!884257 () Bool)

(assert (=> b!951465 m!884257))

(assert (=> b!951397 d!115515))

(declare-fun d!115517 () Bool)

(declare-fun e!535785 () Bool)

(assert (=> d!115517 e!535785))

(declare-fun c!99541 () Bool)

(assert (=> d!115517 (= c!99541 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!428437 () Unit!31976)

(declare-fun choose!1591 (array!57583 array!57581 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 64) Int) Unit!31976)

(assert (=> d!115517 (= lt!428437 (choose!1591 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)))))

(assert (=> d!115517 (validMask!0 (mask!27631 thiss!1141))))

(assert (=> d!115517 (= (lemmaKeyInListMapIsInArray!319 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)) lt!428437)))

(declare-fun b!951470 () Bool)

(assert (=> b!951470 (= e!535785 (arrayContainsKey!0 (_keys!10749 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951471 () Bool)

(assert (=> b!951471 (= e!535785 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115517 c!99541) b!951470))

(assert (= (and d!115517 (not c!99541)) b!951471))

(declare-fun m!884259 () Bool)

(assert (=> d!115517 m!884259))

(assert (=> d!115517 m!884189))

(assert (=> b!951470 m!884193))

(assert (=> b!951397 d!115517))

(declare-fun d!115519 () Bool)

(declare-fun e!535790 () Bool)

(assert (=> d!115519 e!535790))

(declare-fun res!637611 () Bool)

(assert (=> d!115519 (=> res!637611 e!535790)))

(declare-fun lt!428448 () Bool)

(assert (=> d!115519 (= res!637611 (not lt!428448))))

(declare-fun lt!428447 () Bool)

(assert (=> d!115519 (= lt!428448 lt!428447)))

(declare-fun lt!428446 () Unit!31976)

(declare-fun e!535791 () Unit!31976)

(assert (=> d!115519 (= lt!428446 e!535791)))

(declare-fun c!99544 () Bool)

(assert (=> d!115519 (= c!99544 lt!428447)))

(declare-fun containsKey!467 (List!19332 (_ BitVec 64)) Bool)

(assert (=> d!115519 (= lt!428447 (containsKey!467 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(assert (=> d!115519 (= (contains!5236 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) key!756) lt!428448)))

(declare-fun b!951478 () Bool)

(declare-fun lt!428449 () Unit!31976)

(assert (=> b!951478 (= e!535791 lt!428449)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!361 (List!19332 (_ BitVec 64)) Unit!31976)

(assert (=> b!951478 (= lt!428449 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-datatypes ((Option!502 0))(
  ( (Some!501 (v!12972 V!32639)) (None!500) )
))
(declare-fun isDefined!369 (Option!502) Bool)

(declare-fun getValueByKey!496 (List!19332 (_ BitVec 64)) Option!502)

(assert (=> b!951478 (isDefined!369 (getValueByKey!496 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-fun b!951479 () Bool)

(declare-fun Unit!31978 () Unit!31976)

(assert (=> b!951479 (= e!535791 Unit!31978)))

(declare-fun b!951480 () Bool)

(assert (=> b!951480 (= e!535790 (isDefined!369 (getValueByKey!496 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756)))))

(assert (= (and d!115519 c!99544) b!951478))

(assert (= (and d!115519 (not c!99544)) b!951479))

(assert (= (and d!115519 (not res!637611)) b!951480))

(declare-fun m!884261 () Bool)

(assert (=> d!115519 m!884261))

(declare-fun m!884263 () Bool)

(assert (=> b!951478 m!884263))

(declare-fun m!884265 () Bool)

(assert (=> b!951478 m!884265))

(assert (=> b!951478 m!884265))

(declare-fun m!884267 () Bool)

(assert (=> b!951478 m!884267))

(assert (=> b!951480 m!884265))

(assert (=> b!951480 m!884265))

(assert (=> b!951480 m!884267))

(assert (=> b!951392 d!115519))

(declare-fun b!951523 () Bool)

(declare-fun e!535823 () Bool)

(declare-fun e!535820 () Bool)

(assert (=> b!951523 (= e!535823 e!535820)))

(declare-fun res!637632 () Bool)

(assert (=> b!951523 (=> (not res!637632) (not e!535820))))

(declare-fun lt!428505 () ListLongMap!12237)

(assert (=> b!951523 (= res!637632 (contains!5236 lt!428505 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun bm!41448 () Bool)

(declare-fun call!41455 () ListLongMap!12237)

(declare-fun call!41454 () ListLongMap!12237)

(assert (=> bm!41448 (= call!41455 call!41454)))

(declare-fun b!951524 () Bool)

(declare-fun e!535829 () Unit!31976)

(declare-fun lt!428495 () Unit!31976)

(assert (=> b!951524 (= e!535829 lt!428495)))

(declare-fun lt!428504 () ListLongMap!12237)

(declare-fun getCurrentListMapNoExtraKeys!3362 (array!57583 array!57581 (_ BitVec 32) (_ BitVec 32) V!32639 V!32639 (_ BitVec 32) Int) ListLongMap!12237)

(assert (=> b!951524 (= lt!428504 (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!428503 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428503 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428509 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428509 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428498 () Unit!31976)

(declare-fun addStillContains!577 (ListLongMap!12237 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31976)

(assert (=> b!951524 (= lt!428498 (addStillContains!577 lt!428504 lt!428503 (zeroValue!5620 thiss!1141) lt!428509))))

(declare-fun +!2874 (ListLongMap!12237 tuple2!13538) ListLongMap!12237)

(assert (=> b!951524 (contains!5236 (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))) lt!428509)))

(declare-fun lt!428508 () Unit!31976)

(assert (=> b!951524 (= lt!428508 lt!428498)))

(declare-fun lt!428496 () ListLongMap!12237)

(assert (=> b!951524 (= lt!428496 (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!428506 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428506 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428502 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428502 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428513 () Unit!31976)

(declare-fun addApplyDifferent!458 (ListLongMap!12237 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31976)

(assert (=> b!951524 (= lt!428513 (addApplyDifferent!458 lt!428496 lt!428506 (minValue!5620 thiss!1141) lt!428502))))

(declare-fun apply!888 (ListLongMap!12237 (_ BitVec 64)) V!32639)

(assert (=> b!951524 (= (apply!888 (+!2874 lt!428496 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))) lt!428502) (apply!888 lt!428496 lt!428502))))

(declare-fun lt!428511 () Unit!31976)

(assert (=> b!951524 (= lt!428511 lt!428513)))

(declare-fun lt!428510 () ListLongMap!12237)

(assert (=> b!951524 (= lt!428510 (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!428500 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428500 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428497 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428497 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428494 () Unit!31976)

(assert (=> b!951524 (= lt!428494 (addApplyDifferent!458 lt!428510 lt!428500 (zeroValue!5620 thiss!1141) lt!428497))))

(assert (=> b!951524 (= (apply!888 (+!2874 lt!428510 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))) lt!428497) (apply!888 lt!428510 lt!428497))))

(declare-fun lt!428512 () Unit!31976)

(assert (=> b!951524 (= lt!428512 lt!428494)))

(declare-fun lt!428499 () ListLongMap!12237)

(assert (=> b!951524 (= lt!428499 (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun lt!428515 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428515 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!428507 () (_ BitVec 64))

(assert (=> b!951524 (= lt!428507 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951524 (= lt!428495 (addApplyDifferent!458 lt!428499 lt!428515 (minValue!5620 thiss!1141) lt!428507))))

(assert (=> b!951524 (= (apply!888 (+!2874 lt!428499 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))) lt!428507) (apply!888 lt!428499 lt!428507))))

(declare-fun b!951525 () Bool)

(declare-fun e!535818 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!951525 (= e!535818 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951526 () Bool)

(declare-fun res!637631 () Bool)

(declare-fun e!535819 () Bool)

(assert (=> b!951526 (=> (not res!637631) (not e!535819))))

(declare-fun e!535822 () Bool)

(assert (=> b!951526 (= res!637631 e!535822)))

(declare-fun c!99561 () Bool)

(assert (=> b!951526 (= c!99561 (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!951527 () Bool)

(declare-fun e!535825 () ListLongMap!12237)

(declare-fun e!535821 () ListLongMap!12237)

(assert (=> b!951527 (= e!535825 e!535821)))

(declare-fun c!99562 () Bool)

(assert (=> b!951527 (= c!99562 (and (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951528 () Bool)

(declare-fun e!535826 () Bool)

(assert (=> b!951528 (= e!535826 (= (apply!888 lt!428505 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5620 thiss!1141)))))

(declare-fun bm!41449 () Bool)

(declare-fun call!41456 () ListLongMap!12237)

(declare-fun c!99560 () Bool)

(declare-fun call!41453 () ListLongMap!12237)

(assert (=> bm!41449 (= call!41456 (+!2874 (ite c!99560 call!41454 (ite c!99562 call!41455 call!41453)) (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(declare-fun b!951530 () Bool)

(declare-fun e!535830 () ListLongMap!12237)

(assert (=> b!951530 (= e!535830 call!41453)))

(declare-fun b!951531 () Bool)

(assert (=> b!951531 (= e!535822 e!535826)))

(declare-fun res!637633 () Bool)

(declare-fun call!41451 () Bool)

(assert (=> b!951531 (= res!637633 call!41451)))

(assert (=> b!951531 (=> (not res!637633) (not e!535826))))

(declare-fun b!951532 () Bool)

(declare-fun e!535827 () Bool)

(declare-fun call!41452 () Bool)

(assert (=> b!951532 (= e!535827 (not call!41452))))

(declare-fun b!951533 () Bool)

(declare-fun e!535828 () Bool)

(assert (=> b!951533 (= e!535827 e!535828)))

(declare-fun res!637635 () Bool)

(assert (=> b!951533 (= res!637635 call!41452)))

(assert (=> b!951533 (=> (not res!637635) (not e!535828))))

(declare-fun b!951534 () Bool)

(declare-fun c!99559 () Bool)

(assert (=> b!951534 (= c!99559 (and (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!951534 (= e!535821 e!535830)))

(declare-fun b!951535 () Bool)

(declare-fun Unit!31979 () Unit!31976)

(assert (=> b!951535 (= e!535829 Unit!31979)))

(declare-fun bm!41450 () Bool)

(declare-fun call!41457 () ListLongMap!12237)

(assert (=> bm!41450 (= call!41457 call!41456)))

(declare-fun b!951536 () Bool)

(assert (=> b!951536 (= e!535821 call!41457)))

(declare-fun b!951537 () Bool)

(declare-fun e!535824 () Bool)

(assert (=> b!951537 (= e!535824 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41451 () Bool)

(assert (=> bm!41451 (= call!41454 (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))

(declare-fun b!951529 () Bool)

(assert (=> b!951529 (= e!535830 call!41457)))

(declare-fun d!115521 () Bool)

(assert (=> d!115521 e!535819))

(declare-fun res!637636 () Bool)

(assert (=> d!115521 (=> (not res!637636) (not e!535819))))

(assert (=> d!115521 (= res!637636 (or (bvsge #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))))

(declare-fun lt!428514 () ListLongMap!12237)

(assert (=> d!115521 (= lt!428505 lt!428514)))

(declare-fun lt!428501 () Unit!31976)

(assert (=> d!115521 (= lt!428501 e!535829)))

(declare-fun c!99558 () Bool)

(assert (=> d!115521 (= c!99558 e!535818)))

(declare-fun res!637637 () Bool)

(assert (=> d!115521 (=> (not res!637637) (not e!535818))))

(assert (=> d!115521 (= res!637637 (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> d!115521 (= lt!428514 e!535825)))

(assert (=> d!115521 (= c!99560 (and (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115521 (validMask!0 (mask!27631 thiss!1141))))

(assert (=> d!115521 (= (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) lt!428505)))

(declare-fun b!951538 () Bool)

(assert (=> b!951538 (= e!535828 (= (apply!888 lt!428505 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5620 thiss!1141)))))

(declare-fun b!951539 () Bool)

(declare-fun get!14561 (ValueCell!9896 V!32639) V!32639)

(declare-fun dynLambda!1671 (Int (_ BitVec 64)) V!32639)

(assert (=> b!951539 (= e!535820 (= (apply!888 lt!428505 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)) (get!14561 (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1671 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28163 (_values!5807 thiss!1141))))))

(assert (=> b!951539 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun b!951540 () Bool)

(assert (=> b!951540 (= e!535819 e!535827)))

(declare-fun c!99557 () Bool)

(assert (=> b!951540 (= c!99557 (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!951541 () Bool)

(declare-fun res!637634 () Bool)

(assert (=> b!951541 (=> (not res!637634) (not e!535819))))

(assert (=> b!951541 (= res!637634 e!535823)))

(declare-fun res!637638 () Bool)

(assert (=> b!951541 (=> res!637638 e!535823)))

(assert (=> b!951541 (= res!637638 (not e!535824))))

(declare-fun res!637630 () Bool)

(assert (=> b!951541 (=> (not res!637630) (not e!535824))))

(assert (=> b!951541 (= res!637630 (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun bm!41452 () Bool)

(assert (=> bm!41452 (= call!41453 call!41455)))

(declare-fun b!951542 () Bool)

(assert (=> b!951542 (= e!535825 (+!2874 call!41456 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))

(declare-fun bm!41453 () Bool)

(assert (=> bm!41453 (= call!41451 (contains!5236 lt!428505 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41454 () Bool)

(assert (=> bm!41454 (= call!41452 (contains!5236 lt!428505 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951543 () Bool)

(assert (=> b!951543 (= e!535822 (not call!41451))))

(assert (= (and d!115521 c!99560) b!951542))

(assert (= (and d!115521 (not c!99560)) b!951527))

(assert (= (and b!951527 c!99562) b!951536))

(assert (= (and b!951527 (not c!99562)) b!951534))

(assert (= (and b!951534 c!99559) b!951529))

(assert (= (and b!951534 (not c!99559)) b!951530))

(assert (= (or b!951529 b!951530) bm!41452))

(assert (= (or b!951536 bm!41452) bm!41448))

(assert (= (or b!951536 b!951529) bm!41450))

(assert (= (or b!951542 bm!41448) bm!41451))

(assert (= (or b!951542 bm!41450) bm!41449))

(assert (= (and d!115521 res!637637) b!951525))

(assert (= (and d!115521 c!99558) b!951524))

(assert (= (and d!115521 (not c!99558)) b!951535))

(assert (= (and d!115521 res!637636) b!951541))

(assert (= (and b!951541 res!637630) b!951537))

(assert (= (and b!951541 (not res!637638)) b!951523))

(assert (= (and b!951523 res!637632) b!951539))

(assert (= (and b!951541 res!637634) b!951526))

(assert (= (and b!951526 c!99561) b!951531))

(assert (= (and b!951526 (not c!99561)) b!951543))

(assert (= (and b!951531 res!637633) b!951528))

(assert (= (or b!951531 b!951543) bm!41453))

(assert (= (and b!951526 res!637631) b!951540))

(assert (= (and b!951540 c!99557) b!951533))

(assert (= (and b!951540 (not c!99557)) b!951532))

(assert (= (and b!951533 res!637635) b!951538))

(assert (= (or b!951533 b!951532) bm!41454))

(declare-fun b_lambda!14385 () Bool)

(assert (=> (not b_lambda!14385) (not b!951539)))

(declare-fun t!27667 () Bool)

(declare-fun tb!6185 () Bool)

(assert (=> (and b!951394 (= (defaultEntry!5784 thiss!1141) (defaultEntry!5784 thiss!1141)) t!27667) tb!6185))

(declare-fun result!12293 () Bool)

(assert (=> tb!6185 (= result!12293 tp_is_empty!20755)))

(assert (=> b!951539 t!27667))

(declare-fun b_and!29721 () Bool)

(assert (= b_and!29715 (and (=> t!27667 result!12293) b_and!29721)))

(declare-fun m!884269 () Bool)

(assert (=> b!951538 m!884269))

(declare-fun m!884271 () Bool)

(assert (=> bm!41453 m!884271))

(declare-fun m!884273 () Bool)

(assert (=> bm!41449 m!884273))

(assert (=> b!951525 m!884253))

(assert (=> b!951525 m!884253))

(declare-fun m!884275 () Bool)

(assert (=> b!951525 m!884275))

(assert (=> b!951537 m!884253))

(assert (=> b!951537 m!884253))

(assert (=> b!951537 m!884275))

(declare-fun m!884277 () Bool)

(assert (=> bm!41454 m!884277))

(declare-fun m!884279 () Bool)

(assert (=> b!951528 m!884279))

(declare-fun m!884281 () Bool)

(assert (=> b!951542 m!884281))

(assert (=> b!951523 m!884253))

(assert (=> b!951523 m!884253))

(declare-fun m!884283 () Bool)

(assert (=> b!951523 m!884283))

(assert (=> b!951524 m!884253))

(declare-fun m!884285 () Bool)

(assert (=> b!951524 m!884285))

(declare-fun m!884287 () Bool)

(assert (=> b!951524 m!884287))

(declare-fun m!884289 () Bool)

(assert (=> b!951524 m!884289))

(declare-fun m!884291 () Bool)

(assert (=> b!951524 m!884291))

(declare-fun m!884293 () Bool)

(assert (=> b!951524 m!884293))

(declare-fun m!884295 () Bool)

(assert (=> b!951524 m!884295))

(declare-fun m!884297 () Bool)

(assert (=> b!951524 m!884297))

(assert (=> b!951524 m!884289))

(assert (=> b!951524 m!884285))

(declare-fun m!884299 () Bool)

(assert (=> b!951524 m!884299))

(declare-fun m!884301 () Bool)

(assert (=> b!951524 m!884301))

(declare-fun m!884303 () Bool)

(assert (=> b!951524 m!884303))

(declare-fun m!884305 () Bool)

(assert (=> b!951524 m!884305))

(declare-fun m!884307 () Bool)

(assert (=> b!951524 m!884307))

(assert (=> b!951524 m!884301))

(declare-fun m!884309 () Bool)

(assert (=> b!951524 m!884309))

(declare-fun m!884311 () Bool)

(assert (=> b!951524 m!884311))

(assert (=> b!951524 m!884307))

(declare-fun m!884313 () Bool)

(assert (=> b!951524 m!884313))

(declare-fun m!884315 () Bool)

(assert (=> b!951524 m!884315))

(assert (=> d!115521 m!884189))

(assert (=> b!951539 m!884253))

(assert (=> b!951539 m!884253))

(declare-fun m!884317 () Bool)

(assert (=> b!951539 m!884317))

(declare-fun m!884319 () Bool)

(assert (=> b!951539 m!884319))

(declare-fun m!884321 () Bool)

(assert (=> b!951539 m!884321))

(declare-fun m!884323 () Bool)

(assert (=> b!951539 m!884323))

(assert (=> b!951539 m!884319))

(assert (=> b!951539 m!884321))

(assert (=> bm!41451 m!884311))

(assert (=> b!951392 d!115521))

(declare-fun b!951558 () Bool)

(declare-fun c!99569 () Bool)

(declare-fun lt!428527 () (_ BitVec 64))

(assert (=> b!951558 (= c!99569 (= lt!428527 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535839 () SeekEntryResult!9104)

(declare-fun e!535838 () SeekEntryResult!9104)

(assert (=> b!951558 (= e!535839 e!535838)))

(declare-fun b!951559 () Bool)

(declare-fun lt!428526 () SeekEntryResult!9104)

(assert (=> b!951559 (= e!535838 (ite ((_ is MissingVacant!9104) lt!428526) (MissingZero!9104 (index!38790 lt!428526)) lt!428526))))

(declare-fun lt!428525 () SeekEntryResult!9104)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57583 (_ BitVec 32)) SeekEntryResult!9104)

(assert (=> b!951559 (= lt!428526 (seekKeyOrZeroReturnVacant!0 (x!81754 lt!428525) (index!38789 lt!428525) (index!38789 lt!428525) key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)))))

(declare-fun b!951560 () Bool)

(declare-fun e!535837 () SeekEntryResult!9104)

(assert (=> b!951560 (= e!535837 e!535839)))

(assert (=> b!951560 (= lt!428527 (select (arr!27686 (_keys!10749 thiss!1141)) (index!38789 lt!428525)))))

(declare-fun c!99570 () Bool)

(assert (=> b!951560 (= c!99570 (= lt!428527 key!756))))

(declare-fun b!951561 () Bool)

(assert (=> b!951561 (= e!535837 Undefined!9104)))

(declare-fun d!115523 () Bool)

(declare-fun lt!428524 () SeekEntryResult!9104)

(assert (=> d!115523 (and (or ((_ is MissingVacant!9104) lt!428524) (not ((_ is Found!9104) lt!428524)) (and (bvsge (index!38788 lt!428524) #b00000000000000000000000000000000) (bvslt (index!38788 lt!428524) (size!28164 (_keys!10749 thiss!1141))))) (not ((_ is MissingVacant!9104) lt!428524)) (or (not ((_ is Found!9104) lt!428524)) (= (select (arr!27686 (_keys!10749 thiss!1141)) (index!38788 lt!428524)) key!756)))))

(assert (=> d!115523 (= lt!428524 e!535837)))

(declare-fun c!99571 () Bool)

(assert (=> d!115523 (= c!99571 (and ((_ is Intermediate!9104) lt!428525) (undefined!9916 lt!428525)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57583 (_ BitVec 32)) SeekEntryResult!9104)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115523 (= lt!428525 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27631 thiss!1141)) key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)))))

(assert (=> d!115523 (validMask!0 (mask!27631 thiss!1141))))

(assert (=> d!115523 (= (seekEntry!0 key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)) lt!428524)))

(declare-fun b!951562 () Bool)

(assert (=> b!951562 (= e!535838 (MissingZero!9104 (index!38789 lt!428525)))))

(declare-fun b!951563 () Bool)

(assert (=> b!951563 (= e!535839 (Found!9104 (index!38789 lt!428525)))))

(assert (= (and d!115523 c!99571) b!951561))

(assert (= (and d!115523 (not c!99571)) b!951560))

(assert (= (and b!951560 c!99570) b!951563))

(assert (= (and b!951560 (not c!99570)) b!951558))

(assert (= (and b!951558 c!99569) b!951562))

(assert (= (and b!951558 (not c!99569)) b!951559))

(declare-fun m!884325 () Bool)

(assert (=> b!951559 m!884325))

(declare-fun m!884327 () Bool)

(assert (=> b!951560 m!884327))

(declare-fun m!884329 () Bool)

(assert (=> d!115523 m!884329))

(declare-fun m!884331 () Bool)

(assert (=> d!115523 m!884331))

(assert (=> d!115523 m!884331))

(declare-fun m!884333 () Bool)

(assert (=> d!115523 m!884333))

(assert (=> d!115523 m!884189))

(assert (=> b!951395 d!115523))

(declare-fun d!115525 () Bool)

(declare-fun res!637645 () Bool)

(declare-fun e!535842 () Bool)

(assert (=> d!115525 (=> (not res!637645) (not e!535842))))

(declare-fun simpleValid!375 (LongMapFixedSize!4942) Bool)

(assert (=> d!115525 (= res!637645 (simpleValid!375 thiss!1141))))

(assert (=> d!115525 (= (valid!1892 thiss!1141) e!535842)))

(declare-fun b!951570 () Bool)

(declare-fun res!637646 () Bool)

(assert (=> b!951570 (=> (not res!637646) (not e!535842))))

(declare-fun arrayCountValidKeys!0 (array!57583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951570 (= res!637646 (= (arrayCountValidKeys!0 (_keys!10749 thiss!1141) #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))) (_size!2526 thiss!1141)))))

(declare-fun b!951571 () Bool)

(declare-fun res!637647 () Bool)

(assert (=> b!951571 (=> (not res!637647) (not e!535842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57583 (_ BitVec 32)) Bool)

(assert (=> b!951571 (= res!637647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)))))

(declare-fun b!951572 () Bool)

(declare-datatypes ((List!19333 0))(
  ( (Nil!19330) (Cons!19329 (h!20495 (_ BitVec 64)) (t!27668 List!19333)) )
))
(declare-fun arrayNoDuplicates!0 (array!57583 (_ BitVec 32) List!19333) Bool)

(assert (=> b!951572 (= e!535842 (arrayNoDuplicates!0 (_keys!10749 thiss!1141) #b00000000000000000000000000000000 Nil!19330))))

(assert (= (and d!115525 res!637645) b!951570))

(assert (= (and b!951570 res!637646) b!951571))

(assert (= (and b!951571 res!637647) b!951572))

(declare-fun m!884335 () Bool)

(assert (=> d!115525 m!884335))

(declare-fun m!884337 () Bool)

(assert (=> b!951570 m!884337))

(declare-fun m!884339 () Bool)

(assert (=> b!951571 m!884339))

(declare-fun m!884341 () Bool)

(assert (=> b!951572 m!884341))

(assert (=> start!81400 d!115525))

(declare-fun d!115527 () Bool)

(assert (=> d!115527 (= (array_inv!21570 (_keys!10749 thiss!1141)) (bvsge (size!28164 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951394 d!115527))

(declare-fun d!115529 () Bool)

(assert (=> d!115529 (= (array_inv!21571 (_values!5807 thiss!1141)) (bvsge (size!28163 (_values!5807 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951394 d!115529))

(declare-fun mapIsEmpty!33056 () Bool)

(declare-fun mapRes!33056 () Bool)

(assert (=> mapIsEmpty!33056 mapRes!33056))

(declare-fun b!951580 () Bool)

(declare-fun e!535848 () Bool)

(assert (=> b!951580 (= e!535848 tp_is_empty!20755)))

(declare-fun condMapEmpty!33056 () Bool)

(declare-fun mapDefault!33056 () ValueCell!9896)

(assert (=> mapNonEmpty!33047 (= condMapEmpty!33056 (= mapRest!33047 ((as const (Array (_ BitVec 32) ValueCell!9896)) mapDefault!33056)))))

(assert (=> mapNonEmpty!33047 (= tp!63340 (and e!535848 mapRes!33056))))

(declare-fun mapNonEmpty!33056 () Bool)

(declare-fun tp!63356 () Bool)

(declare-fun e!535847 () Bool)

(assert (=> mapNonEmpty!33056 (= mapRes!33056 (and tp!63356 e!535847))))

(declare-fun mapKey!33056 () (_ BitVec 32))

(declare-fun mapRest!33056 () (Array (_ BitVec 32) ValueCell!9896))

(declare-fun mapValue!33056 () ValueCell!9896)

(assert (=> mapNonEmpty!33056 (= mapRest!33047 (store mapRest!33056 mapKey!33056 mapValue!33056))))

(declare-fun b!951579 () Bool)

(assert (=> b!951579 (= e!535847 tp_is_empty!20755)))

(assert (= (and mapNonEmpty!33047 condMapEmpty!33056) mapIsEmpty!33056))

(assert (= (and mapNonEmpty!33047 (not condMapEmpty!33056)) mapNonEmpty!33056))

(assert (= (and mapNonEmpty!33056 ((_ is ValueCellFull!9896) mapValue!33056)) b!951579))

(assert (= (and mapNonEmpty!33047 ((_ is ValueCellFull!9896) mapDefault!33056)) b!951580))

(declare-fun m!884343 () Bool)

(assert (=> mapNonEmpty!33056 m!884343))

(declare-fun b_lambda!14387 () Bool)

(assert (= b_lambda!14385 (or (and b!951394 b_free!18247) b_lambda!14387)))

(check-sat (not b!951465) (not b!951571) (not bm!41451) (not bm!41454) (not d!115523) (not b!951542) (not d!115517) b_and!29721 (not b!951538) (not b!951470) (not mapNonEmpty!33056) (not b!951570) (not b!951478) (not bm!41453) (not bm!41449) (not b!951523) (not b!951459) (not d!115521) (not b!951480) (not b_lambda!14387) (not b_next!18247) (not d!115519) (not b!951525) (not b!951539) (not b!951559) (not b!951528) (not b!951524) (not b!951537) tp_is_empty!20755 (not d!115525) (not b!951572))
(check-sat b_and!29721 (not b_next!18247))
(get-model)

(declare-fun d!115531 () Bool)

(declare-fun res!637652 () Bool)

(declare-fun e!535853 () Bool)

(assert (=> d!115531 (=> res!637652 e!535853)))

(assert (=> d!115531 (= res!637652 (and ((_ is Cons!19328) (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (= (_1!6780 (h!20494 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)))))

(assert (=> d!115531 (= (containsKey!467 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756) e!535853)))

(declare-fun b!951585 () Bool)

(declare-fun e!535854 () Bool)

(assert (=> b!951585 (= e!535853 e!535854)))

(declare-fun res!637653 () Bool)

(assert (=> b!951585 (=> (not res!637653) (not e!535854))))

(assert (=> b!951585 (= res!637653 (and (or (not ((_ is Cons!19328) (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) (bvsle (_1!6780 (h!20494 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)) ((_ is Cons!19328) (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (bvslt (_1!6780 (h!20494 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)))))

(declare-fun b!951586 () Bool)

(assert (=> b!951586 (= e!535854 (containsKey!467 (t!27665 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) key!756))))

(assert (= (and d!115531 (not res!637652)) b!951585))

(assert (= (and b!951585 res!637653) b!951586))

(declare-fun m!884345 () Bool)

(assert (=> b!951586 m!884345))

(assert (=> d!115519 d!115531))

(declare-fun d!115533 () Bool)

(declare-fun lt!428528 () (_ BitVec 32))

(assert (=> d!115533 (and (or (bvslt lt!428528 #b00000000000000000000000000000000) (bvsge lt!428528 (size!28164 (_keys!10749 thiss!1141))) (and (bvsge lt!428528 #b00000000000000000000000000000000) (bvslt lt!428528 (size!28164 (_keys!10749 thiss!1141))))) (bvsge lt!428528 #b00000000000000000000000000000000) (bvslt lt!428528 (size!28164 (_keys!10749 thiss!1141))) (= (select (arr!27686 (_keys!10749 thiss!1141)) lt!428528) key!756))))

(declare-fun e!535855 () (_ BitVec 32))

(assert (=> d!115533 (= lt!428528 e!535855)))

(declare-fun c!99572 () Bool)

(assert (=> d!115533 (= c!99572 (= (select (arr!27686 (_keys!10749 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115533 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28164 (_keys!10749 thiss!1141))) (bvslt (size!28164 (_keys!10749 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115533 (= (arrayScanForKey!0 (_keys!10749 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!428528)))

(declare-fun b!951587 () Bool)

(assert (=> b!951587 (= e!535855 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!951588 () Bool)

(assert (=> b!951588 (= e!535855 (arrayScanForKey!0 (_keys!10749 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115533 c!99572) b!951587))

(assert (= (and d!115533 (not c!99572)) b!951588))

(declare-fun m!884347 () Bool)

(assert (=> d!115533 m!884347))

(declare-fun m!884349 () Bool)

(assert (=> d!115533 m!884349))

(declare-fun m!884351 () Bool)

(assert (=> b!951588 m!884351))

(assert (=> b!951459 d!115533))

(declare-fun b!951597 () Bool)

(declare-fun e!535862 () Bool)

(declare-fun call!41460 () Bool)

(assert (=> b!951597 (= e!535862 call!41460)))

(declare-fun d!115535 () Bool)

(declare-fun res!637659 () Bool)

(declare-fun e!535863 () Bool)

(assert (=> d!115535 (=> res!637659 e!535863)))

(assert (=> d!115535 (= res!637659 (bvsge #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> d!115535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)) e!535863)))

(declare-fun b!951598 () Bool)

(declare-fun e!535864 () Bool)

(assert (=> b!951598 (= e!535864 call!41460)))

(declare-fun b!951599 () Bool)

(assert (=> b!951599 (= e!535863 e!535862)))

(declare-fun c!99575 () Bool)

(assert (=> b!951599 (= c!99575 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun bm!41457 () Bool)

(assert (=> bm!41457 (= call!41460 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10749 thiss!1141) (mask!27631 thiss!1141)))))

(declare-fun b!951600 () Bool)

(assert (=> b!951600 (= e!535862 e!535864)))

(declare-fun lt!428535 () (_ BitVec 64))

(assert (=> b!951600 (= lt!428535 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!428537 () Unit!31976)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57583 (_ BitVec 64) (_ BitVec 32)) Unit!31976)

(assert (=> b!951600 (= lt!428537 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10749 thiss!1141) lt!428535 #b00000000000000000000000000000000))))

(assert (=> b!951600 (arrayContainsKey!0 (_keys!10749 thiss!1141) lt!428535 #b00000000000000000000000000000000)))

(declare-fun lt!428536 () Unit!31976)

(assert (=> b!951600 (= lt!428536 lt!428537)))

(declare-fun res!637658 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57583 (_ BitVec 32)) SeekEntryResult!9104)

(assert (=> b!951600 (= res!637658 (= (seekEntryOrOpen!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000) (_keys!10749 thiss!1141) (mask!27631 thiss!1141)) (Found!9104 #b00000000000000000000000000000000)))))

(assert (=> b!951600 (=> (not res!637658) (not e!535864))))

(assert (= (and d!115535 (not res!637659)) b!951599))

(assert (= (and b!951599 c!99575) b!951600))

(assert (= (and b!951599 (not c!99575)) b!951597))

(assert (= (and b!951600 res!637658) b!951598))

(assert (= (or b!951598 b!951597) bm!41457))

(assert (=> b!951599 m!884253))

(assert (=> b!951599 m!884253))

(assert (=> b!951599 m!884275))

(declare-fun m!884353 () Bool)

(assert (=> bm!41457 m!884353))

(assert (=> b!951600 m!884253))

(declare-fun m!884355 () Bool)

(assert (=> b!951600 m!884355))

(declare-fun m!884357 () Bool)

(assert (=> b!951600 m!884357))

(assert (=> b!951600 m!884253))

(declare-fun m!884359 () Bool)

(assert (=> b!951600 m!884359))

(assert (=> b!951571 d!115535))

(declare-fun d!115537 () Bool)

(declare-fun get!14562 (Option!502) V!32639)

(assert (=> d!115537 (= (apply!888 lt!428505 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14562 (getValueByKey!496 (toList!6134 lt!428505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26728 () Bool)

(assert (= bs!26728 d!115537))

(declare-fun m!884361 () Bool)

(assert (=> bs!26728 m!884361))

(assert (=> bs!26728 m!884361))

(declare-fun m!884363 () Bool)

(assert (=> bs!26728 m!884363))

(assert (=> b!951538 d!115537))

(declare-fun d!115539 () Bool)

(assert (=> d!115539 (= (apply!888 lt!428505 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)) (get!14562 (getValueByKey!496 (toList!6134 lt!428505) (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26729 () Bool)

(assert (= bs!26729 d!115539))

(assert (=> bs!26729 m!884253))

(declare-fun m!884365 () Bool)

(assert (=> bs!26729 m!884365))

(assert (=> bs!26729 m!884365))

(declare-fun m!884367 () Bool)

(assert (=> bs!26729 m!884367))

(assert (=> b!951539 d!115539))

(declare-fun d!115541 () Bool)

(declare-fun c!99578 () Bool)

(assert (=> d!115541 (= c!99578 ((_ is ValueCellFull!9896) (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535867 () V!32639)

(assert (=> d!115541 (= (get!14561 (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1671 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!535867)))

(declare-fun b!951605 () Bool)

(declare-fun get!14563 (ValueCell!9896 V!32639) V!32639)

(assert (=> b!951605 (= e!535867 (get!14563 (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1671 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!951606 () Bool)

(declare-fun get!14564 (ValueCell!9896 V!32639) V!32639)

(assert (=> b!951606 (= e!535867 (get!14564 (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1671 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115541 c!99578) b!951605))

(assert (= (and d!115541 (not c!99578)) b!951606))

(assert (=> b!951605 m!884319))

(assert (=> b!951605 m!884321))

(declare-fun m!884369 () Bool)

(assert (=> b!951605 m!884369))

(assert (=> b!951606 m!884319))

(assert (=> b!951606 m!884321))

(declare-fun m!884371 () Bool)

(assert (=> b!951606 m!884371))

(assert (=> b!951539 d!115541))

(declare-fun b!951631 () Bool)

(declare-fun e!535884 () Bool)

(declare-fun lt!428558 () ListLongMap!12237)

(assert (=> b!951631 (= e!535884 (= lt!428558 (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5784 thiss!1141))))))

(declare-fun b!951632 () Bool)

(declare-fun e!535883 () ListLongMap!12237)

(declare-fun e!535888 () ListLongMap!12237)

(assert (=> b!951632 (= e!535883 e!535888)))

(declare-fun c!99587 () Bool)

(assert (=> b!951632 (= c!99587 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951633 () Bool)

(declare-fun call!41463 () ListLongMap!12237)

(assert (=> b!951633 (= e!535888 call!41463)))

(declare-fun b!951634 () Bool)

(declare-fun e!535885 () Bool)

(declare-fun e!535887 () Bool)

(assert (=> b!951634 (= e!535885 e!535887)))

(assert (=> b!951634 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun res!637670 () Bool)

(assert (=> b!951634 (= res!637670 (contains!5236 lt!428558 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951634 (=> (not res!637670) (not e!535887))))

(declare-fun b!951635 () Bool)

(assert (=> b!951635 (= e!535885 e!535884)))

(declare-fun c!99590 () Bool)

(assert (=> b!951635 (= c!99590 (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun b!951636 () Bool)

(declare-fun lt!428552 () Unit!31976)

(declare-fun lt!428553 () Unit!31976)

(assert (=> b!951636 (= lt!428552 lt!428553)))

(declare-fun lt!428556 () (_ BitVec 64))

(declare-fun lt!428557 () (_ BitVec 64))

(declare-fun lt!428555 () ListLongMap!12237)

(declare-fun lt!428554 () V!32639)

(assert (=> b!951636 (not (contains!5236 (+!2874 lt!428555 (tuple2!13539 lt!428557 lt!428554)) lt!428556))))

(declare-fun addStillNotContains!229 (ListLongMap!12237 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31976)

(assert (=> b!951636 (= lt!428553 (addStillNotContains!229 lt!428555 lt!428557 lt!428554 lt!428556))))

(assert (=> b!951636 (= lt!428556 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!951636 (= lt!428554 (get!14561 (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1671 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!951636 (= lt!428557 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!951636 (= lt!428555 call!41463)))

(assert (=> b!951636 (= e!535888 (+!2874 call!41463 (tuple2!13539 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000) (get!14561 (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1671 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!951637 () Bool)

(declare-fun e!535882 () Bool)

(assert (=> b!951637 (= e!535882 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951637 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!951638 () Bool)

(assert (=> b!951638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> b!951638 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28163 (_values!5807 thiss!1141))))))

(assert (=> b!951638 (= e!535887 (= (apply!888 lt!428558 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)) (get!14561 (select (arr!27685 (_values!5807 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1671 (defaultEntry!5784 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!951639 () Bool)

(assert (=> b!951639 (= e!535883 (ListLongMap!12238 Nil!19329))))

(declare-fun b!951640 () Bool)

(declare-fun res!637669 () Bool)

(declare-fun e!535886 () Bool)

(assert (=> b!951640 (=> (not res!637669) (not e!535886))))

(assert (=> b!951640 (= res!637669 (not (contains!5236 lt!428558 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!41460 () Bool)

(assert (=> bm!41460 (= call!41463 (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5784 thiss!1141)))))

(declare-fun d!115543 () Bool)

(assert (=> d!115543 e!535886))

(declare-fun res!637668 () Bool)

(assert (=> d!115543 (=> (not res!637668) (not e!535886))))

(assert (=> d!115543 (= res!637668 (not (contains!5236 lt!428558 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!115543 (= lt!428558 e!535883)))

(declare-fun c!99588 () Bool)

(assert (=> d!115543 (= c!99588 (bvsge #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> d!115543 (validMask!0 (mask!27631 thiss!1141))))

(assert (=> d!115543 (= (getCurrentListMapNoExtraKeys!3362 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)) lt!428558)))

(declare-fun b!951641 () Bool)

(declare-fun isEmpty!718 (ListLongMap!12237) Bool)

(assert (=> b!951641 (= e!535884 (isEmpty!718 lt!428558))))

(declare-fun b!951642 () Bool)

(assert (=> b!951642 (= e!535886 e!535885)))

(declare-fun c!99589 () Bool)

(assert (=> b!951642 (= c!99589 e!535882)))

(declare-fun res!637671 () Bool)

(assert (=> b!951642 (=> (not res!637671) (not e!535882))))

(assert (=> b!951642 (= res!637671 (bvslt #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(assert (= (and d!115543 c!99588) b!951639))

(assert (= (and d!115543 (not c!99588)) b!951632))

(assert (= (and b!951632 c!99587) b!951636))

(assert (= (and b!951632 (not c!99587)) b!951633))

(assert (= (or b!951636 b!951633) bm!41460))

(assert (= (and d!115543 res!637668) b!951640))

(assert (= (and b!951640 res!637669) b!951642))

(assert (= (and b!951642 res!637671) b!951637))

(assert (= (and b!951642 c!99589) b!951634))

(assert (= (and b!951642 (not c!99589)) b!951635))

(assert (= (and b!951634 res!637670) b!951638))

(assert (= (and b!951635 c!99590) b!951631))

(assert (= (and b!951635 (not c!99590)) b!951641))

(declare-fun b_lambda!14389 () Bool)

(assert (=> (not b_lambda!14389) (not b!951636)))

(assert (=> b!951636 t!27667))

(declare-fun b_and!29723 () Bool)

(assert (= b_and!29721 (and (=> t!27667 result!12293) b_and!29723)))

(declare-fun b_lambda!14391 () Bool)

(assert (=> (not b_lambda!14391) (not b!951638)))

(assert (=> b!951638 t!27667))

(declare-fun b_and!29725 () Bool)

(assert (= b_and!29723 (and (=> t!27667 result!12293) b_and!29725)))

(declare-fun m!884373 () Bool)

(assert (=> bm!41460 m!884373))

(assert (=> b!951638 m!884253))

(assert (=> b!951638 m!884253))

(declare-fun m!884375 () Bool)

(assert (=> b!951638 m!884375))

(assert (=> b!951638 m!884319))

(assert (=> b!951638 m!884319))

(assert (=> b!951638 m!884321))

(assert (=> b!951638 m!884323))

(assert (=> b!951638 m!884321))

(declare-fun m!884377 () Bool)

(assert (=> b!951640 m!884377))

(declare-fun m!884379 () Bool)

(assert (=> b!951641 m!884379))

(assert (=> b!951634 m!884253))

(assert (=> b!951634 m!884253))

(declare-fun m!884381 () Bool)

(assert (=> b!951634 m!884381))

(assert (=> b!951632 m!884253))

(assert (=> b!951632 m!884253))

(assert (=> b!951632 m!884275))

(declare-fun m!884383 () Bool)

(assert (=> b!951636 m!884383))

(declare-fun m!884385 () Bool)

(assert (=> b!951636 m!884385))

(assert (=> b!951636 m!884253))

(assert (=> b!951636 m!884319))

(assert (=> b!951636 m!884319))

(assert (=> b!951636 m!884321))

(assert (=> b!951636 m!884323))

(assert (=> b!951636 m!884321))

(declare-fun m!884387 () Bool)

(assert (=> b!951636 m!884387))

(assert (=> b!951636 m!884385))

(declare-fun m!884389 () Bool)

(assert (=> b!951636 m!884389))

(assert (=> b!951631 m!884373))

(declare-fun m!884391 () Bool)

(assert (=> d!115543 m!884391))

(assert (=> d!115543 m!884189))

(assert (=> b!951637 m!884253))

(assert (=> b!951637 m!884253))

(assert (=> b!951637 m!884275))

(assert (=> bm!41451 d!115543))

(assert (=> d!115521 d!115511))

(declare-fun b!951654 () Bool)

(declare-fun e!535891 () Bool)

(assert (=> b!951654 (= e!535891 (and (bvsge (extraKeys!5516 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5516 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2526 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!951651 () Bool)

(declare-fun res!637680 () Bool)

(assert (=> b!951651 (=> (not res!637680) (not e!535891))))

(assert (=> b!951651 (= res!637680 (and (= (size!28163 (_values!5807 thiss!1141)) (bvadd (mask!27631 thiss!1141) #b00000000000000000000000000000001)) (= (size!28164 (_keys!10749 thiss!1141)) (size!28163 (_values!5807 thiss!1141))) (bvsge (_size!2526 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2526 thiss!1141) (bvadd (mask!27631 thiss!1141) #b00000000000000000000000000000001))))))

(declare-fun b!951652 () Bool)

(declare-fun res!637682 () Bool)

(assert (=> b!951652 (=> (not res!637682) (not e!535891))))

(declare-fun size!28169 (LongMapFixedSize!4942) (_ BitVec 32))

(assert (=> b!951652 (= res!637682 (bvsge (size!28169 thiss!1141) (_size!2526 thiss!1141)))))

(declare-fun b!951653 () Bool)

(declare-fun res!637681 () Bool)

(assert (=> b!951653 (=> (not res!637681) (not e!535891))))

(assert (=> b!951653 (= res!637681 (= (size!28169 thiss!1141) (bvadd (_size!2526 thiss!1141) (bvsdiv (bvadd (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!115545 () Bool)

(declare-fun res!637683 () Bool)

(assert (=> d!115545 (=> (not res!637683) (not e!535891))))

(assert (=> d!115545 (= res!637683 (validMask!0 (mask!27631 thiss!1141)))))

(assert (=> d!115545 (= (simpleValid!375 thiss!1141) e!535891)))

(assert (= (and d!115545 res!637683) b!951651))

(assert (= (and b!951651 res!637680) b!951652))

(assert (= (and b!951652 res!637682) b!951653))

(assert (= (and b!951653 res!637681) b!951654))

(declare-fun m!884393 () Bool)

(assert (=> b!951652 m!884393))

(assert (=> b!951653 m!884393))

(assert (=> d!115545 m!884189))

(assert (=> d!115525 d!115545))

(declare-fun bm!41463 () Bool)

(declare-fun call!41466 () (_ BitVec 32))

(assert (=> bm!41463 (= call!41466 (arrayCountValidKeys!0 (_keys!10749 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun d!115547 () Bool)

(declare-fun lt!428561 () (_ BitVec 32))

(assert (=> d!115547 (and (bvsge lt!428561 #b00000000000000000000000000000000) (bvsle lt!428561 (bvsub (size!28164 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!535896 () (_ BitVec 32))

(assert (=> d!115547 (= lt!428561 e!535896)))

(declare-fun c!99596 () Bool)

(assert (=> d!115547 (= c!99596 (bvsge #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> d!115547 (and (bvsle #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!28164 (_keys!10749 thiss!1141)) (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> d!115547 (= (arrayCountValidKeys!0 (_keys!10749 thiss!1141) #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))) lt!428561)))

(declare-fun b!951663 () Bool)

(declare-fun e!535897 () (_ BitVec 32))

(assert (=> b!951663 (= e!535897 call!41466)))

(declare-fun b!951664 () Bool)

(assert (=> b!951664 (= e!535896 #b00000000000000000000000000000000)))

(declare-fun b!951665 () Bool)

(assert (=> b!951665 (= e!535896 e!535897)))

(declare-fun c!99595 () Bool)

(assert (=> b!951665 (= c!99595 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951666 () Bool)

(assert (=> b!951666 (= e!535897 (bvadd #b00000000000000000000000000000001 call!41466))))

(assert (= (and d!115547 c!99596) b!951664))

(assert (= (and d!115547 (not c!99596)) b!951665))

(assert (= (and b!951665 c!99595) b!951666))

(assert (= (and b!951665 (not c!99595)) b!951663))

(assert (= (or b!951666 b!951663) bm!41463))

(declare-fun m!884395 () Bool)

(assert (=> bm!41463 m!884395))

(assert (=> b!951665 m!884253))

(assert (=> b!951665 m!884253))

(assert (=> b!951665 m!884275))

(assert (=> b!951570 d!115547))

(declare-fun d!115549 () Bool)

(assert (=> d!115549 (= (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!951537 d!115549))

(declare-fun b!951685 () Bool)

(declare-fun lt!428566 () SeekEntryResult!9104)

(assert (=> b!951685 (and (bvsge (index!38789 lt!428566) #b00000000000000000000000000000000) (bvslt (index!38789 lt!428566) (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun res!637690 () Bool)

(assert (=> b!951685 (= res!637690 (= (select (arr!27686 (_keys!10749 thiss!1141)) (index!38789 lt!428566)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535911 () Bool)

(assert (=> b!951685 (=> res!637690 e!535911)))

(declare-fun b!951686 () Bool)

(assert (=> b!951686 (and (bvsge (index!38789 lt!428566) #b00000000000000000000000000000000) (bvslt (index!38789 lt!428566) (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun res!637691 () Bool)

(assert (=> b!951686 (= res!637691 (= (select (arr!27686 (_keys!10749 thiss!1141)) (index!38789 lt!428566)) key!756))))

(assert (=> b!951686 (=> res!637691 e!535911)))

(declare-fun e!535912 () Bool)

(assert (=> b!951686 (= e!535912 e!535911)))

(declare-fun b!951687 () Bool)

(declare-fun e!535909 () SeekEntryResult!9104)

(declare-fun e!535910 () SeekEntryResult!9104)

(assert (=> b!951687 (= e!535909 e!535910)))

(declare-fun c!99603 () Bool)

(declare-fun lt!428567 () (_ BitVec 64))

(assert (=> b!951687 (= c!99603 (or (= lt!428567 key!756) (= (bvadd lt!428567 lt!428567) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!951688 () Bool)

(declare-fun e!535908 () Bool)

(assert (=> b!951688 (= e!535908 e!535912)))

(declare-fun res!637692 () Bool)

(assert (=> b!951688 (= res!637692 (and ((_ is Intermediate!9104) lt!428566) (not (undefined!9916 lt!428566)) (bvslt (x!81754 lt!428566) #b01111111111111111111111111111110) (bvsge (x!81754 lt!428566) #b00000000000000000000000000000000) (bvsge (x!81754 lt!428566) #b00000000000000000000000000000000)))))

(assert (=> b!951688 (=> (not res!637692) (not e!535912))))

(declare-fun b!951689 () Bool)

(assert (=> b!951689 (= e!535910 (Intermediate!9104 false (toIndex!0 key!756 (mask!27631 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!951691 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!951691 (= e!535910 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27631 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27631 thiss!1141)) key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)))))

(declare-fun b!951692 () Bool)

(assert (=> b!951692 (= e!535909 (Intermediate!9104 true (toIndex!0 key!756 (mask!27631 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!951693 () Bool)

(assert (=> b!951693 (= e!535908 (bvsge (x!81754 lt!428566) #b01111111111111111111111111111110))))

(declare-fun b!951690 () Bool)

(assert (=> b!951690 (and (bvsge (index!38789 lt!428566) #b00000000000000000000000000000000) (bvslt (index!38789 lt!428566) (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> b!951690 (= e!535911 (= (select (arr!27686 (_keys!10749 thiss!1141)) (index!38789 lt!428566)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!115551 () Bool)

(assert (=> d!115551 e!535908))

(declare-fun c!99605 () Bool)

(assert (=> d!115551 (= c!99605 (and ((_ is Intermediate!9104) lt!428566) (undefined!9916 lt!428566)))))

(assert (=> d!115551 (= lt!428566 e!535909)))

(declare-fun c!99604 () Bool)

(assert (=> d!115551 (= c!99604 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!115551 (= lt!428567 (select (arr!27686 (_keys!10749 thiss!1141)) (toIndex!0 key!756 (mask!27631 thiss!1141))))))

(assert (=> d!115551 (validMask!0 (mask!27631 thiss!1141))))

(assert (=> d!115551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27631 thiss!1141)) key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)) lt!428566)))

(assert (= (and d!115551 c!99604) b!951692))

(assert (= (and d!115551 (not c!99604)) b!951687))

(assert (= (and b!951687 c!99603) b!951689))

(assert (= (and b!951687 (not c!99603)) b!951691))

(assert (= (and d!115551 c!99605) b!951693))

(assert (= (and d!115551 (not c!99605)) b!951688))

(assert (= (and b!951688 res!637692) b!951686))

(assert (= (and b!951686 (not res!637691)) b!951685))

(assert (= (and b!951685 (not res!637690)) b!951690))

(declare-fun m!884397 () Bool)

(assert (=> b!951686 m!884397))

(assert (=> d!115551 m!884331))

(declare-fun m!884399 () Bool)

(assert (=> d!115551 m!884399))

(assert (=> d!115551 m!884189))

(assert (=> b!951685 m!884397))

(assert (=> b!951691 m!884331))

(declare-fun m!884401 () Bool)

(assert (=> b!951691 m!884401))

(assert (=> b!951691 m!884401))

(declare-fun m!884403 () Bool)

(assert (=> b!951691 m!884403))

(assert (=> b!951690 m!884397))

(assert (=> d!115523 d!115551))

(declare-fun d!115553 () Bool)

(declare-fun lt!428573 () (_ BitVec 32))

(declare-fun lt!428572 () (_ BitVec 32))

(assert (=> d!115553 (= lt!428573 (bvmul (bvxor lt!428572 (bvlshr lt!428572 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!115553 (= lt!428572 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!115553 (and (bvsge (mask!27631 thiss!1141) #b00000000000000000000000000000000) (let ((res!637693 (let ((h!20496 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81773 (bvmul (bvxor h!20496 (bvlshr h!20496 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81773 (bvlshr x!81773 #b00000000000000000000000000001101)) (mask!27631 thiss!1141)))))) (and (bvslt res!637693 (bvadd (mask!27631 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!637693 #b00000000000000000000000000000000))))))

(assert (=> d!115553 (= (toIndex!0 key!756 (mask!27631 thiss!1141)) (bvand (bvxor lt!428573 (bvlshr lt!428573 #b00000000000000000000000000001101)) (mask!27631 thiss!1141)))))

(assert (=> d!115523 d!115553))

(assert (=> d!115523 d!115511))

(assert (=> b!951525 d!115549))

(declare-fun d!115555 () Bool)

(declare-fun e!535913 () Bool)

(assert (=> d!115555 e!535913))

(declare-fun res!637694 () Bool)

(assert (=> d!115555 (=> res!637694 e!535913)))

(declare-fun lt!428576 () Bool)

(assert (=> d!115555 (= res!637694 (not lt!428576))))

(declare-fun lt!428575 () Bool)

(assert (=> d!115555 (= lt!428576 lt!428575)))

(declare-fun lt!428574 () Unit!31976)

(declare-fun e!535914 () Unit!31976)

(assert (=> d!115555 (= lt!428574 e!535914)))

(declare-fun c!99606 () Bool)

(assert (=> d!115555 (= c!99606 lt!428575)))

(assert (=> d!115555 (= lt!428575 (containsKey!467 (toList!6134 lt!428505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115555 (= (contains!5236 lt!428505 #b0000000000000000000000000000000000000000000000000000000000000000) lt!428576)))

(declare-fun b!951694 () Bool)

(declare-fun lt!428577 () Unit!31976)

(assert (=> b!951694 (= e!535914 lt!428577)))

(assert (=> b!951694 (= lt!428577 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6134 lt!428505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951694 (isDefined!369 (getValueByKey!496 (toList!6134 lt!428505) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951695 () Bool)

(declare-fun Unit!31980 () Unit!31976)

(assert (=> b!951695 (= e!535914 Unit!31980)))

(declare-fun b!951696 () Bool)

(assert (=> b!951696 (= e!535913 (isDefined!369 (getValueByKey!496 (toList!6134 lt!428505) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115555 c!99606) b!951694))

(assert (= (and d!115555 (not c!99606)) b!951695))

(assert (= (and d!115555 (not res!637694)) b!951696))

(declare-fun m!884405 () Bool)

(assert (=> d!115555 m!884405))

(declare-fun m!884407 () Bool)

(assert (=> b!951694 m!884407))

(declare-fun m!884409 () Bool)

(assert (=> b!951694 m!884409))

(assert (=> b!951694 m!884409))

(declare-fun m!884411 () Bool)

(assert (=> b!951694 m!884411))

(assert (=> b!951696 m!884409))

(assert (=> b!951696 m!884409))

(assert (=> b!951696 m!884411))

(assert (=> bm!41453 d!115555))

(declare-fun d!115557 () Bool)

(assert (=> d!115557 (= (apply!888 (+!2874 lt!428499 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))) lt!428507) (get!14562 (getValueByKey!496 (toList!6134 (+!2874 lt!428499 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141)))) lt!428507)))))

(declare-fun bs!26730 () Bool)

(assert (= bs!26730 d!115557))

(declare-fun m!884413 () Bool)

(assert (=> bs!26730 m!884413))

(assert (=> bs!26730 m!884413))

(declare-fun m!884415 () Bool)

(assert (=> bs!26730 m!884415))

(assert (=> b!951524 d!115557))

(declare-fun d!115559 () Bool)

(declare-fun e!535917 () Bool)

(assert (=> d!115559 e!535917))

(declare-fun res!637699 () Bool)

(assert (=> d!115559 (=> (not res!637699) (not e!535917))))

(declare-fun lt!428587 () ListLongMap!12237)

(assert (=> d!115559 (= res!637699 (contains!5236 lt!428587 (_1!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141)))))))

(declare-fun lt!428588 () List!19332)

(assert (=> d!115559 (= lt!428587 (ListLongMap!12238 lt!428588))))

(declare-fun lt!428589 () Unit!31976)

(declare-fun lt!428586 () Unit!31976)

(assert (=> d!115559 (= lt!428589 lt!428586)))

(assert (=> d!115559 (= (getValueByKey!496 lt!428588 (_1!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!267 (List!19332 (_ BitVec 64) V!32639) Unit!31976)

(assert (=> d!115559 (= lt!428586 (lemmaContainsTupThenGetReturnValue!267 lt!428588 (_1!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141)))))))

(declare-fun insertStrictlySorted!324 (List!19332 (_ BitVec 64) V!32639) List!19332)

(assert (=> d!115559 (= lt!428588 (insertStrictlySorted!324 (toList!6134 lt!428510) (_1!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115559 (= (+!2874 lt!428510 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))) lt!428587)))

(declare-fun b!951701 () Bool)

(declare-fun res!637700 () Bool)

(assert (=> b!951701 (=> (not res!637700) (not e!535917))))

(assert (=> b!951701 (= res!637700 (= (getValueByKey!496 (toList!6134 lt!428587) (_1!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))))))))

(declare-fun b!951702 () Bool)

(declare-fun contains!5237 (List!19332 tuple2!13538) Bool)

(assert (=> b!951702 (= e!535917 (contains!5237 (toList!6134 lt!428587) (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))))))

(assert (= (and d!115559 res!637699) b!951701))

(assert (= (and b!951701 res!637700) b!951702))

(declare-fun m!884417 () Bool)

(assert (=> d!115559 m!884417))

(declare-fun m!884419 () Bool)

(assert (=> d!115559 m!884419))

(declare-fun m!884421 () Bool)

(assert (=> d!115559 m!884421))

(declare-fun m!884423 () Bool)

(assert (=> d!115559 m!884423))

(declare-fun m!884425 () Bool)

(assert (=> b!951701 m!884425))

(declare-fun m!884427 () Bool)

(assert (=> b!951702 m!884427))

(assert (=> b!951524 d!115559))

(declare-fun d!115561 () Bool)

(assert (=> d!115561 (= (apply!888 (+!2874 lt!428496 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))) lt!428502) (apply!888 lt!428496 lt!428502))))

(declare-fun lt!428592 () Unit!31976)

(declare-fun choose!1592 (ListLongMap!12237 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31976)

(assert (=> d!115561 (= lt!428592 (choose!1592 lt!428496 lt!428506 (minValue!5620 thiss!1141) lt!428502))))

(declare-fun e!535920 () Bool)

(assert (=> d!115561 e!535920))

(declare-fun res!637703 () Bool)

(assert (=> d!115561 (=> (not res!637703) (not e!535920))))

(assert (=> d!115561 (= res!637703 (contains!5236 lt!428496 lt!428502))))

(assert (=> d!115561 (= (addApplyDifferent!458 lt!428496 lt!428506 (minValue!5620 thiss!1141) lt!428502) lt!428592)))

(declare-fun b!951706 () Bool)

(assert (=> b!951706 (= e!535920 (not (= lt!428502 lt!428506)))))

(assert (= (and d!115561 res!637703) b!951706))

(assert (=> d!115561 m!884301))

(assert (=> d!115561 m!884301))

(assert (=> d!115561 m!884309))

(assert (=> d!115561 m!884303))

(declare-fun m!884429 () Bool)

(assert (=> d!115561 m!884429))

(declare-fun m!884431 () Bool)

(assert (=> d!115561 m!884431))

(assert (=> b!951524 d!115561))

(declare-fun d!115563 () Bool)

(assert (=> d!115563 (= (apply!888 (+!2874 lt!428510 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))) lt!428497) (apply!888 lt!428510 lt!428497))))

(declare-fun lt!428593 () Unit!31976)

(assert (=> d!115563 (= lt!428593 (choose!1592 lt!428510 lt!428500 (zeroValue!5620 thiss!1141) lt!428497))))

(declare-fun e!535921 () Bool)

(assert (=> d!115563 e!535921))

(declare-fun res!637704 () Bool)

(assert (=> d!115563 (=> (not res!637704) (not e!535921))))

(assert (=> d!115563 (= res!637704 (contains!5236 lt!428510 lt!428497))))

(assert (=> d!115563 (= (addApplyDifferent!458 lt!428510 lt!428500 (zeroValue!5620 thiss!1141) lt!428497) lt!428593)))

(declare-fun b!951707 () Bool)

(assert (=> b!951707 (= e!535921 (not (= lt!428497 lt!428500)))))

(assert (= (and d!115563 res!637704) b!951707))

(assert (=> d!115563 m!884307))

(assert (=> d!115563 m!884307))

(assert (=> d!115563 m!884313))

(assert (=> d!115563 m!884297))

(declare-fun m!884433 () Bool)

(assert (=> d!115563 m!884433))

(declare-fun m!884435 () Bool)

(assert (=> d!115563 m!884435))

(assert (=> b!951524 d!115563))

(declare-fun d!115565 () Bool)

(assert (=> d!115565 (= (apply!888 lt!428499 lt!428507) (get!14562 (getValueByKey!496 (toList!6134 lt!428499) lt!428507)))))

(declare-fun bs!26731 () Bool)

(assert (= bs!26731 d!115565))

(declare-fun m!884437 () Bool)

(assert (=> bs!26731 m!884437))

(assert (=> bs!26731 m!884437))

(declare-fun m!884439 () Bool)

(assert (=> bs!26731 m!884439))

(assert (=> b!951524 d!115565))

(declare-fun d!115567 () Bool)

(assert (=> d!115567 (= (apply!888 lt!428510 lt!428497) (get!14562 (getValueByKey!496 (toList!6134 lt!428510) lt!428497)))))

(declare-fun bs!26732 () Bool)

(assert (= bs!26732 d!115567))

(declare-fun m!884441 () Bool)

(assert (=> bs!26732 m!884441))

(assert (=> bs!26732 m!884441))

(declare-fun m!884443 () Bool)

(assert (=> bs!26732 m!884443))

(assert (=> b!951524 d!115567))

(declare-fun d!115569 () Bool)

(assert (=> d!115569 (contains!5236 (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))) lt!428509)))

(declare-fun lt!428596 () Unit!31976)

(declare-fun choose!1593 (ListLongMap!12237 (_ BitVec 64) V!32639 (_ BitVec 64)) Unit!31976)

(assert (=> d!115569 (= lt!428596 (choose!1593 lt!428504 lt!428503 (zeroValue!5620 thiss!1141) lt!428509))))

(assert (=> d!115569 (contains!5236 lt!428504 lt!428509)))

(assert (=> d!115569 (= (addStillContains!577 lt!428504 lt!428503 (zeroValue!5620 thiss!1141) lt!428509) lt!428596)))

(declare-fun bs!26733 () Bool)

(assert (= bs!26733 d!115569))

(assert (=> bs!26733 m!884289))

(assert (=> bs!26733 m!884289))

(assert (=> bs!26733 m!884291))

(declare-fun m!884445 () Bool)

(assert (=> bs!26733 m!884445))

(declare-fun m!884447 () Bool)

(assert (=> bs!26733 m!884447))

(assert (=> b!951524 d!115569))

(declare-fun d!115571 () Bool)

(assert (=> d!115571 (= (apply!888 (+!2874 lt!428499 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))) lt!428507) (apply!888 lt!428499 lt!428507))))

(declare-fun lt!428597 () Unit!31976)

(assert (=> d!115571 (= lt!428597 (choose!1592 lt!428499 lt!428515 (minValue!5620 thiss!1141) lt!428507))))

(declare-fun e!535922 () Bool)

(assert (=> d!115571 e!535922))

(declare-fun res!637705 () Bool)

(assert (=> d!115571 (=> (not res!637705) (not e!535922))))

(assert (=> d!115571 (= res!637705 (contains!5236 lt!428499 lt!428507))))

(assert (=> d!115571 (= (addApplyDifferent!458 lt!428499 lt!428515 (minValue!5620 thiss!1141) lt!428507) lt!428597)))

(declare-fun b!951709 () Bool)

(assert (=> b!951709 (= e!535922 (not (= lt!428507 lt!428515)))))

(assert (= (and d!115571 res!637705) b!951709))

(assert (=> d!115571 m!884285))

(assert (=> d!115571 m!884285))

(assert (=> d!115571 m!884299))

(assert (=> d!115571 m!884293))

(declare-fun m!884449 () Bool)

(assert (=> d!115571 m!884449))

(declare-fun m!884451 () Bool)

(assert (=> d!115571 m!884451))

(assert (=> b!951524 d!115571))

(declare-fun d!115573 () Bool)

(declare-fun e!535923 () Bool)

(assert (=> d!115573 e!535923))

(declare-fun res!637706 () Bool)

(assert (=> d!115573 (=> res!637706 e!535923)))

(declare-fun lt!428600 () Bool)

(assert (=> d!115573 (= res!637706 (not lt!428600))))

(declare-fun lt!428599 () Bool)

(assert (=> d!115573 (= lt!428600 lt!428599)))

(declare-fun lt!428598 () Unit!31976)

(declare-fun e!535924 () Unit!31976)

(assert (=> d!115573 (= lt!428598 e!535924)))

(declare-fun c!99607 () Bool)

(assert (=> d!115573 (= c!99607 lt!428599)))

(assert (=> d!115573 (= lt!428599 (containsKey!467 (toList!6134 (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))) lt!428509))))

(assert (=> d!115573 (= (contains!5236 (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))) lt!428509) lt!428600)))

(declare-fun b!951710 () Bool)

(declare-fun lt!428601 () Unit!31976)

(assert (=> b!951710 (= e!535924 lt!428601)))

(assert (=> b!951710 (= lt!428601 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6134 (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))) lt!428509))))

(assert (=> b!951710 (isDefined!369 (getValueByKey!496 (toList!6134 (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))) lt!428509))))

(declare-fun b!951711 () Bool)

(declare-fun Unit!31981 () Unit!31976)

(assert (=> b!951711 (= e!535924 Unit!31981)))

(declare-fun b!951712 () Bool)

(assert (=> b!951712 (= e!535923 (isDefined!369 (getValueByKey!496 (toList!6134 (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))) lt!428509)))))

(assert (= (and d!115573 c!99607) b!951710))

(assert (= (and d!115573 (not c!99607)) b!951711))

(assert (= (and d!115573 (not res!637706)) b!951712))

(declare-fun m!884453 () Bool)

(assert (=> d!115573 m!884453))

(declare-fun m!884455 () Bool)

(assert (=> b!951710 m!884455))

(declare-fun m!884457 () Bool)

(assert (=> b!951710 m!884457))

(assert (=> b!951710 m!884457))

(declare-fun m!884459 () Bool)

(assert (=> b!951710 m!884459))

(assert (=> b!951712 m!884457))

(assert (=> b!951712 m!884457))

(assert (=> b!951712 m!884459))

(assert (=> b!951524 d!115573))

(declare-fun d!115575 () Bool)

(assert (=> d!115575 (= (apply!888 lt!428496 lt!428502) (get!14562 (getValueByKey!496 (toList!6134 lt!428496) lt!428502)))))

(declare-fun bs!26734 () Bool)

(assert (= bs!26734 d!115575))

(declare-fun m!884461 () Bool)

(assert (=> bs!26734 m!884461))

(assert (=> bs!26734 m!884461))

(declare-fun m!884463 () Bool)

(assert (=> bs!26734 m!884463))

(assert (=> b!951524 d!115575))

(declare-fun d!115577 () Bool)

(declare-fun e!535925 () Bool)

(assert (=> d!115577 e!535925))

(declare-fun res!637707 () Bool)

(assert (=> d!115577 (=> (not res!637707) (not e!535925))))

(declare-fun lt!428603 () ListLongMap!12237)

(assert (=> d!115577 (= res!637707 (contains!5236 lt!428603 (_1!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141)))))))

(declare-fun lt!428604 () List!19332)

(assert (=> d!115577 (= lt!428603 (ListLongMap!12238 lt!428604))))

(declare-fun lt!428605 () Unit!31976)

(declare-fun lt!428602 () Unit!31976)

(assert (=> d!115577 (= lt!428605 lt!428602)))

(assert (=> d!115577 (= (getValueByKey!496 lt!428604 (_1!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141)))))))

(assert (=> d!115577 (= lt!428602 (lemmaContainsTupThenGetReturnValue!267 lt!428604 (_1!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141)))))))

(assert (=> d!115577 (= lt!428604 (insertStrictlySorted!324 (toList!6134 lt!428496) (_1!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141)))))))

(assert (=> d!115577 (= (+!2874 lt!428496 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))) lt!428603)))

(declare-fun b!951713 () Bool)

(declare-fun res!637708 () Bool)

(assert (=> b!951713 (=> (not res!637708) (not e!535925))))

(assert (=> b!951713 (= res!637708 (= (getValueByKey!496 (toList!6134 lt!428603) (_1!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))))))))

(declare-fun b!951714 () Bool)

(assert (=> b!951714 (= e!535925 (contains!5237 (toList!6134 lt!428603) (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))))))

(assert (= (and d!115577 res!637707) b!951713))

(assert (= (and b!951713 res!637708) b!951714))

(declare-fun m!884465 () Bool)

(assert (=> d!115577 m!884465))

(declare-fun m!884467 () Bool)

(assert (=> d!115577 m!884467))

(declare-fun m!884469 () Bool)

(assert (=> d!115577 m!884469))

(declare-fun m!884471 () Bool)

(assert (=> d!115577 m!884471))

(declare-fun m!884473 () Bool)

(assert (=> b!951713 m!884473))

(declare-fun m!884475 () Bool)

(assert (=> b!951714 m!884475))

(assert (=> b!951524 d!115577))

(assert (=> b!951524 d!115543))

(declare-fun d!115579 () Bool)

(assert (=> d!115579 (= (apply!888 (+!2874 lt!428496 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141))) lt!428502) (get!14562 (getValueByKey!496 (toList!6134 (+!2874 lt!428496 (tuple2!13539 lt!428506 (minValue!5620 thiss!1141)))) lt!428502)))))

(declare-fun bs!26735 () Bool)

(assert (= bs!26735 d!115579))

(declare-fun m!884477 () Bool)

(assert (=> bs!26735 m!884477))

(assert (=> bs!26735 m!884477))

(declare-fun m!884479 () Bool)

(assert (=> bs!26735 m!884479))

(assert (=> b!951524 d!115579))

(declare-fun d!115581 () Bool)

(declare-fun e!535926 () Bool)

(assert (=> d!115581 e!535926))

(declare-fun res!637709 () Bool)

(assert (=> d!115581 (=> (not res!637709) (not e!535926))))

(declare-fun lt!428607 () ListLongMap!12237)

(assert (=> d!115581 (= res!637709 (contains!5236 lt!428607 (_1!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141)))))))

(declare-fun lt!428608 () List!19332)

(assert (=> d!115581 (= lt!428607 (ListLongMap!12238 lt!428608))))

(declare-fun lt!428609 () Unit!31976)

(declare-fun lt!428606 () Unit!31976)

(assert (=> d!115581 (= lt!428609 lt!428606)))

(assert (=> d!115581 (= (getValueByKey!496 lt!428608 (_1!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141)))))))

(assert (=> d!115581 (= lt!428606 (lemmaContainsTupThenGetReturnValue!267 lt!428608 (_1!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141)))))))

(assert (=> d!115581 (= lt!428608 (insertStrictlySorted!324 (toList!6134 lt!428499) (_1!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141)))))))

(assert (=> d!115581 (= (+!2874 lt!428499 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))) lt!428607)))

(declare-fun b!951715 () Bool)

(declare-fun res!637710 () Bool)

(assert (=> b!951715 (=> (not res!637710) (not e!535926))))

(assert (=> b!951715 (= res!637710 (= (getValueByKey!496 (toList!6134 lt!428607) (_1!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))))))))

(declare-fun b!951716 () Bool)

(assert (=> b!951716 (= e!535926 (contains!5237 (toList!6134 lt!428607) (tuple2!13539 lt!428515 (minValue!5620 thiss!1141))))))

(assert (= (and d!115581 res!637709) b!951715))

(assert (= (and b!951715 res!637710) b!951716))

(declare-fun m!884481 () Bool)

(assert (=> d!115581 m!884481))

(declare-fun m!884483 () Bool)

(assert (=> d!115581 m!884483))

(declare-fun m!884485 () Bool)

(assert (=> d!115581 m!884485))

(declare-fun m!884487 () Bool)

(assert (=> d!115581 m!884487))

(declare-fun m!884489 () Bool)

(assert (=> b!951715 m!884489))

(declare-fun m!884491 () Bool)

(assert (=> b!951716 m!884491))

(assert (=> b!951524 d!115581))

(declare-fun d!115583 () Bool)

(assert (=> d!115583 (= (apply!888 (+!2874 lt!428510 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141))) lt!428497) (get!14562 (getValueByKey!496 (toList!6134 (+!2874 lt!428510 (tuple2!13539 lt!428500 (zeroValue!5620 thiss!1141)))) lt!428497)))))

(declare-fun bs!26736 () Bool)

(assert (= bs!26736 d!115583))

(declare-fun m!884493 () Bool)

(assert (=> bs!26736 m!884493))

(assert (=> bs!26736 m!884493))

(declare-fun m!884495 () Bool)

(assert (=> bs!26736 m!884495))

(assert (=> b!951524 d!115583))

(declare-fun d!115585 () Bool)

(declare-fun e!535927 () Bool)

(assert (=> d!115585 e!535927))

(declare-fun res!637711 () Bool)

(assert (=> d!115585 (=> (not res!637711) (not e!535927))))

(declare-fun lt!428611 () ListLongMap!12237)

(assert (=> d!115585 (= res!637711 (contains!5236 lt!428611 (_1!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))))))

(declare-fun lt!428612 () List!19332)

(assert (=> d!115585 (= lt!428611 (ListLongMap!12238 lt!428612))))

(declare-fun lt!428613 () Unit!31976)

(declare-fun lt!428610 () Unit!31976)

(assert (=> d!115585 (= lt!428613 lt!428610)))

(assert (=> d!115585 (= (getValueByKey!496 lt!428612 (_1!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115585 (= lt!428610 (lemmaContainsTupThenGetReturnValue!267 lt!428612 (_1!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115585 (= lt!428612 (insertStrictlySorted!324 (toList!6134 lt!428504) (_1!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))))))

(assert (=> d!115585 (= (+!2874 lt!428504 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))) lt!428611)))

(declare-fun b!951717 () Bool)

(declare-fun res!637712 () Bool)

(assert (=> b!951717 (=> (not res!637712) (not e!535927))))

(assert (=> b!951717 (= res!637712 (= (getValueByKey!496 (toList!6134 lt!428611) (_1!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))))))))

(declare-fun b!951718 () Bool)

(assert (=> b!951718 (= e!535927 (contains!5237 (toList!6134 lt!428611) (tuple2!13539 lt!428503 (zeroValue!5620 thiss!1141))))))

(assert (= (and d!115585 res!637711) b!951717))

(assert (= (and b!951717 res!637712) b!951718))

(declare-fun m!884497 () Bool)

(assert (=> d!115585 m!884497))

(declare-fun m!884499 () Bool)

(assert (=> d!115585 m!884499))

(declare-fun m!884501 () Bool)

(assert (=> d!115585 m!884501))

(declare-fun m!884503 () Bool)

(assert (=> d!115585 m!884503))

(declare-fun m!884505 () Bool)

(assert (=> b!951717 m!884505))

(declare-fun m!884507 () Bool)

(assert (=> b!951718 m!884507))

(assert (=> b!951524 d!115585))

(declare-fun d!115587 () Bool)

(declare-fun res!637713 () Bool)

(declare-fun e!535928 () Bool)

(assert (=> d!115587 (=> res!637713 e!535928)))

(assert (=> d!115587 (= res!637713 (= (select (arr!27686 (_keys!10749 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!115587 (= (arrayContainsKey!0 (_keys!10749 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!535928)))

(declare-fun b!951719 () Bool)

(declare-fun e!535929 () Bool)

(assert (=> b!951719 (= e!535928 e!535929)))

(declare-fun res!637714 () Bool)

(assert (=> b!951719 (=> (not res!637714) (not e!535929))))

(assert (=> b!951719 (= res!637714 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!28164 (_keys!10749 thiss!1141))))))

(declare-fun b!951720 () Bool)

(assert (=> b!951720 (= e!535929 (arrayContainsKey!0 (_keys!10749 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!115587 (not res!637713)) b!951719))

(assert (= (and b!951719 res!637714) b!951720))

(assert (=> d!115587 m!884349))

(declare-fun m!884509 () Bool)

(assert (=> b!951720 m!884509))

(assert (=> b!951465 d!115587))

(declare-fun b!951733 () Bool)

(declare-fun c!99615 () Bool)

(declare-fun lt!428618 () (_ BitVec 64))

(assert (=> b!951733 (= c!99615 (= lt!428618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!535936 () SeekEntryResult!9104)

(declare-fun e!535937 () SeekEntryResult!9104)

(assert (=> b!951733 (= e!535936 e!535937)))

(declare-fun b!951734 () Bool)

(assert (=> b!951734 (= e!535937 (MissingVacant!9104 (index!38789 lt!428525)))))

(declare-fun lt!428619 () SeekEntryResult!9104)

(declare-fun d!115589 () Bool)

(assert (=> d!115589 (and (or ((_ is Undefined!9104) lt!428619) (not ((_ is Found!9104) lt!428619)) (and (bvsge (index!38788 lt!428619) #b00000000000000000000000000000000) (bvslt (index!38788 lt!428619) (size!28164 (_keys!10749 thiss!1141))))) (or ((_ is Undefined!9104) lt!428619) ((_ is Found!9104) lt!428619) (not ((_ is MissingVacant!9104) lt!428619)) (not (= (index!38790 lt!428619) (index!38789 lt!428525))) (and (bvsge (index!38790 lt!428619) #b00000000000000000000000000000000) (bvslt (index!38790 lt!428619) (size!28164 (_keys!10749 thiss!1141))))) (or ((_ is Undefined!9104) lt!428619) (ite ((_ is Found!9104) lt!428619) (= (select (arr!27686 (_keys!10749 thiss!1141)) (index!38788 lt!428619)) key!756) (and ((_ is MissingVacant!9104) lt!428619) (= (index!38790 lt!428619) (index!38789 lt!428525)) (= (select (arr!27686 (_keys!10749 thiss!1141)) (index!38790 lt!428619)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!535938 () SeekEntryResult!9104)

(assert (=> d!115589 (= lt!428619 e!535938)))

(declare-fun c!99614 () Bool)

(assert (=> d!115589 (= c!99614 (bvsge (x!81754 lt!428525) #b01111111111111111111111111111110))))

(assert (=> d!115589 (= lt!428618 (select (arr!27686 (_keys!10749 thiss!1141)) (index!38789 lt!428525)))))

(assert (=> d!115589 (validMask!0 (mask!27631 thiss!1141))))

(assert (=> d!115589 (= (seekKeyOrZeroReturnVacant!0 (x!81754 lt!428525) (index!38789 lt!428525) (index!38789 lt!428525) key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)) lt!428619)))

(declare-fun b!951735 () Bool)

(assert (=> b!951735 (= e!535936 (Found!9104 (index!38789 lt!428525)))))

(declare-fun b!951736 () Bool)

(assert (=> b!951736 (= e!535938 e!535936)))

(declare-fun c!99616 () Bool)

(assert (=> b!951736 (= c!99616 (= lt!428618 key!756))))

(declare-fun b!951737 () Bool)

(assert (=> b!951737 (= e!535937 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81754 lt!428525) #b00000000000000000000000000000001) (nextIndex!0 (index!38789 lt!428525) (bvadd (x!81754 lt!428525) #b00000000000000000000000000000001) (mask!27631 thiss!1141)) (index!38789 lt!428525) key!756 (_keys!10749 thiss!1141) (mask!27631 thiss!1141)))))

(declare-fun b!951738 () Bool)

(assert (=> b!951738 (= e!535938 Undefined!9104)))

(assert (= (and d!115589 c!99614) b!951738))

(assert (= (and d!115589 (not c!99614)) b!951736))

(assert (= (and b!951736 c!99616) b!951735))

(assert (= (and b!951736 (not c!99616)) b!951733))

(assert (= (and b!951733 c!99615) b!951734))

(assert (= (and b!951733 (not c!99615)) b!951737))

(declare-fun m!884511 () Bool)

(assert (=> d!115589 m!884511))

(declare-fun m!884513 () Bool)

(assert (=> d!115589 m!884513))

(assert (=> d!115589 m!884327))

(assert (=> d!115589 m!884189))

(declare-fun m!884515 () Bool)

(assert (=> b!951737 m!884515))

(assert (=> b!951737 m!884515))

(declare-fun m!884517 () Bool)

(assert (=> b!951737 m!884517))

(assert (=> b!951559 d!115589))

(declare-fun d!115591 () Bool)

(declare-fun e!535939 () Bool)

(assert (=> d!115591 e!535939))

(declare-fun res!637715 () Bool)

(assert (=> d!115591 (=> (not res!637715) (not e!535939))))

(declare-fun lt!428621 () ListLongMap!12237)

(assert (=> d!115591 (= res!637715 (contains!5236 lt!428621 (_1!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(declare-fun lt!428622 () List!19332)

(assert (=> d!115591 (= lt!428621 (ListLongMap!12238 lt!428622))))

(declare-fun lt!428623 () Unit!31976)

(declare-fun lt!428620 () Unit!31976)

(assert (=> d!115591 (= lt!428623 lt!428620)))

(assert (=> d!115591 (= (getValueByKey!496 lt!428622 (_1!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(assert (=> d!115591 (= lt!428620 (lemmaContainsTupThenGetReturnValue!267 lt!428622 (_1!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(assert (=> d!115591 (= lt!428622 (insertStrictlySorted!324 (toList!6134 call!41456) (_1!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))) (_2!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(assert (=> d!115591 (= (+!2874 call!41456 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))) lt!428621)))

(declare-fun b!951739 () Bool)

(declare-fun res!637716 () Bool)

(assert (=> b!951739 (=> (not res!637716) (not e!535939))))

(assert (=> b!951739 (= res!637716 (= (getValueByKey!496 (toList!6134 lt!428621) (_1!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (Some!501 (_2!6780 (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(declare-fun b!951740 () Bool)

(assert (=> b!951740 (= e!535939 (contains!5237 (toList!6134 lt!428621) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))

(assert (= (and d!115591 res!637715) b!951739))

(assert (= (and b!951739 res!637716) b!951740))

(declare-fun m!884519 () Bool)

(assert (=> d!115591 m!884519))

(declare-fun m!884521 () Bool)

(assert (=> d!115591 m!884521))

(declare-fun m!884523 () Bool)

(assert (=> d!115591 m!884523))

(declare-fun m!884525 () Bool)

(assert (=> d!115591 m!884525))

(declare-fun m!884527 () Bool)

(assert (=> b!951739 m!884527))

(declare-fun m!884529 () Bool)

(assert (=> b!951740 m!884529))

(assert (=> b!951542 d!115591))

(declare-fun d!115593 () Bool)

(declare-fun res!637723 () Bool)

(declare-fun e!535951 () Bool)

(assert (=> d!115593 (=> res!637723 e!535951)))

(assert (=> d!115593 (= res!637723 (bvsge #b00000000000000000000000000000000 (size!28164 (_keys!10749 thiss!1141))))))

(assert (=> d!115593 (= (arrayNoDuplicates!0 (_keys!10749 thiss!1141) #b00000000000000000000000000000000 Nil!19330) e!535951)))

(declare-fun b!951751 () Bool)

(declare-fun e!535950 () Bool)

(declare-fun e!535948 () Bool)

(assert (=> b!951751 (= e!535950 e!535948)))

(declare-fun c!99619 () Bool)

(assert (=> b!951751 (= c!99619 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951752 () Bool)

(declare-fun call!41469 () Bool)

(assert (=> b!951752 (= e!535948 call!41469)))

(declare-fun b!951753 () Bool)

(assert (=> b!951753 (= e!535948 call!41469)))

(declare-fun bm!41466 () Bool)

(assert (=> bm!41466 (= call!41469 (arrayNoDuplicates!0 (_keys!10749 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!99619 (Cons!19329 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000) Nil!19330) Nil!19330)))))

(declare-fun b!951754 () Bool)

(declare-fun e!535949 () Bool)

(declare-fun contains!5238 (List!19333 (_ BitVec 64)) Bool)

(assert (=> b!951754 (= e!535949 (contains!5238 Nil!19330 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951755 () Bool)

(assert (=> b!951755 (= e!535951 e!535950)))

(declare-fun res!637725 () Bool)

(assert (=> b!951755 (=> (not res!637725) (not e!535950))))

(assert (=> b!951755 (= res!637725 (not e!535949))))

(declare-fun res!637724 () Bool)

(assert (=> b!951755 (=> (not res!637724) (not e!535949))))

(assert (=> b!951755 (= res!637724 (validKeyInArray!0 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!115593 (not res!637723)) b!951755))

(assert (= (and b!951755 res!637724) b!951754))

(assert (= (and b!951755 res!637725) b!951751))

(assert (= (and b!951751 c!99619) b!951752))

(assert (= (and b!951751 (not c!99619)) b!951753))

(assert (= (or b!951752 b!951753) bm!41466))

(assert (=> b!951751 m!884253))

(assert (=> b!951751 m!884253))

(assert (=> b!951751 m!884275))

(assert (=> bm!41466 m!884253))

(declare-fun m!884531 () Bool)

(assert (=> bm!41466 m!884531))

(assert (=> b!951754 m!884253))

(assert (=> b!951754 m!884253))

(declare-fun m!884533 () Bool)

(assert (=> b!951754 m!884533))

(assert (=> b!951755 m!884253))

(assert (=> b!951755 m!884253))

(assert (=> b!951755 m!884275))

(assert (=> b!951572 d!115593))

(declare-fun d!115595 () Bool)

(declare-fun e!535952 () Bool)

(assert (=> d!115595 e!535952))

(declare-fun res!637726 () Bool)

(assert (=> d!115595 (=> res!637726 e!535952)))

(declare-fun lt!428626 () Bool)

(assert (=> d!115595 (= res!637726 (not lt!428626))))

(declare-fun lt!428625 () Bool)

(assert (=> d!115595 (= lt!428626 lt!428625)))

(declare-fun lt!428624 () Unit!31976)

(declare-fun e!535953 () Unit!31976)

(assert (=> d!115595 (= lt!428624 e!535953)))

(declare-fun c!99620 () Bool)

(assert (=> d!115595 (= c!99620 lt!428625)))

(assert (=> d!115595 (= lt!428625 (containsKey!467 (toList!6134 lt!428505) (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!115595 (= (contains!5236 lt!428505 (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)) lt!428626)))

(declare-fun b!951756 () Bool)

(declare-fun lt!428627 () Unit!31976)

(assert (=> b!951756 (= e!535953 lt!428627)))

(assert (=> b!951756 (= lt!428627 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6134 lt!428505) (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!951756 (isDefined!369 (getValueByKey!496 (toList!6134 lt!428505) (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!951757 () Bool)

(declare-fun Unit!31982 () Unit!31976)

(assert (=> b!951757 (= e!535953 Unit!31982)))

(declare-fun b!951758 () Bool)

(assert (=> b!951758 (= e!535952 (isDefined!369 (getValueByKey!496 (toList!6134 lt!428505) (select (arr!27686 (_keys!10749 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!115595 c!99620) b!951756))

(assert (= (and d!115595 (not c!99620)) b!951757))

(assert (= (and d!115595 (not res!637726)) b!951758))

(assert (=> d!115595 m!884253))

(declare-fun m!884535 () Bool)

(assert (=> d!115595 m!884535))

(assert (=> b!951756 m!884253))

(declare-fun m!884537 () Bool)

(assert (=> b!951756 m!884537))

(assert (=> b!951756 m!884253))

(assert (=> b!951756 m!884365))

(assert (=> b!951756 m!884365))

(declare-fun m!884539 () Bool)

(assert (=> b!951756 m!884539))

(assert (=> b!951758 m!884253))

(assert (=> b!951758 m!884365))

(assert (=> b!951758 m!884365))

(assert (=> b!951758 m!884539))

(assert (=> b!951523 d!115595))

(assert (=> b!951470 d!115515))

(declare-fun d!115597 () Bool)

(declare-fun e!535954 () Bool)

(assert (=> d!115597 e!535954))

(declare-fun res!637727 () Bool)

(assert (=> d!115597 (=> (not res!637727) (not e!535954))))

(declare-fun lt!428629 () ListLongMap!12237)

(assert (=> d!115597 (= res!637727 (contains!5236 lt!428629 (_1!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(declare-fun lt!428630 () List!19332)

(assert (=> d!115597 (= lt!428629 (ListLongMap!12238 lt!428630))))

(declare-fun lt!428631 () Unit!31976)

(declare-fun lt!428628 () Unit!31976)

(assert (=> d!115597 (= lt!428631 lt!428628)))

(assert (=> d!115597 (= (getValueByKey!496 lt!428630 (_1!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))) (Some!501 (_2!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(assert (=> d!115597 (= lt!428628 (lemmaContainsTupThenGetReturnValue!267 lt!428630 (_1!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (_2!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(assert (=> d!115597 (= lt!428630 (insertStrictlySorted!324 (toList!6134 (ite c!99560 call!41454 (ite c!99562 call!41455 call!41453))) (_1!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) (_2!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))))))

(assert (=> d!115597 (= (+!2874 (ite c!99560 call!41454 (ite c!99562 call!41455 call!41453)) (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))) lt!428629)))

(declare-fun b!951759 () Bool)

(declare-fun res!637728 () Bool)

(assert (=> b!951759 (=> (not res!637728) (not e!535954))))

(assert (=> b!951759 (= res!637728 (= (getValueByKey!496 (toList!6134 lt!428629) (_1!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141))))) (Some!501 (_2!6780 (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))))

(declare-fun b!951760 () Bool)

(assert (=> b!951760 (= e!535954 (contains!5237 (toList!6134 lt!428629) (ite (or c!99560 c!99562) (tuple2!13539 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5620 thiss!1141)) (tuple2!13539 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5620 thiss!1141)))))))

(assert (= (and d!115597 res!637727) b!951759))

(assert (= (and b!951759 res!637728) b!951760))

(declare-fun m!884541 () Bool)

(assert (=> d!115597 m!884541))

(declare-fun m!884543 () Bool)

(assert (=> d!115597 m!884543))

(declare-fun m!884545 () Bool)

(assert (=> d!115597 m!884545))

(declare-fun m!884547 () Bool)

(assert (=> d!115597 m!884547))

(declare-fun m!884549 () Bool)

(assert (=> b!951759 m!884549))

(declare-fun m!884551 () Bool)

(assert (=> b!951760 m!884551))

(assert (=> bm!41449 d!115597))

(declare-fun d!115599 () Bool)

(declare-fun isEmpty!719 (Option!502) Bool)

(assert (=> d!115599 (= (isDefined!369 (getValueByKey!496 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756)) (not (isEmpty!719 (getValueByKey!496 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))))

(declare-fun bs!26737 () Bool)

(assert (= bs!26737 d!115599))

(assert (=> bs!26737 m!884265))

(declare-fun m!884553 () Bool)

(assert (=> bs!26737 m!884553))

(assert (=> b!951480 d!115599))

(declare-fun b!951771 () Bool)

(declare-fun e!535960 () Option!502)

(assert (=> b!951771 (= e!535960 (getValueByKey!496 (t!27665 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) key!756))))

(declare-fun b!951770 () Bool)

(declare-fun e!535959 () Option!502)

(assert (=> b!951770 (= e!535959 e!535960)))

(declare-fun c!99626 () Bool)

(assert (=> b!951770 (= c!99626 (and ((_ is Cons!19328) (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (not (= (_1!6780 (h!20494 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756))))))

(declare-fun b!951772 () Bool)

(assert (=> b!951772 (= e!535960 None!500)))

(declare-fun b!951769 () Bool)

(assert (=> b!951769 (= e!535959 (Some!501 (_2!6780 (h!20494 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))))))

(declare-fun d!115601 () Bool)

(declare-fun c!99625 () Bool)

(assert (=> d!115601 (= c!99625 (and ((_ is Cons!19328) (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))) (= (_1!6780 (h!20494 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))))) key!756)))))

(assert (=> d!115601 (= (getValueByKey!496 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756) e!535959)))

(assert (= (and d!115601 c!99625) b!951769))

(assert (= (and d!115601 (not c!99625)) b!951770))

(assert (= (and b!951770 c!99626) b!951771))

(assert (= (and b!951770 (not c!99626)) b!951772))

(declare-fun m!884555 () Bool)

(assert (=> b!951771 m!884555))

(assert (=> b!951480 d!115601))

(declare-fun d!115603 () Bool)

(assert (=> d!115603 (= (apply!888 lt!428505 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14562 (getValueByKey!496 (toList!6134 lt!428505) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26738 () Bool)

(assert (= bs!26738 d!115603))

(assert (=> bs!26738 m!884409))

(assert (=> bs!26738 m!884409))

(declare-fun m!884557 () Bool)

(assert (=> bs!26738 m!884557))

(assert (=> b!951528 d!115603))

(declare-fun d!115605 () Bool)

(assert (=> d!115605 (isDefined!369 (getValueByKey!496 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-fun lt!428634 () Unit!31976)

(declare-fun choose!1594 (List!19332 (_ BitVec 64)) Unit!31976)

(assert (=> d!115605 (= lt!428634 (choose!1594 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(declare-fun e!535963 () Bool)

(assert (=> d!115605 e!535963))

(declare-fun res!637731 () Bool)

(assert (=> d!115605 (=> (not res!637731) (not e!535963))))

(declare-fun isStrictlySorted!500 (List!19332) Bool)

(assert (=> d!115605 (= res!637731 (isStrictlySorted!500 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141)))))))

(assert (=> d!115605 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756) lt!428634)))

(declare-fun b!951775 () Bool)

(assert (=> b!951775 (= e!535963 (containsKey!467 (toList!6134 (getCurrentListMap!3367 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5784 thiss!1141))) key!756))))

(assert (= (and d!115605 res!637731) b!951775))

(assert (=> d!115605 m!884265))

(assert (=> d!115605 m!884265))

(assert (=> d!115605 m!884267))

(declare-fun m!884559 () Bool)

(assert (=> d!115605 m!884559))

(declare-fun m!884561 () Bool)

(assert (=> d!115605 m!884561))

(assert (=> b!951775 m!884261))

(assert (=> b!951478 d!115605))

(assert (=> b!951478 d!115599))

(assert (=> b!951478 d!115601))

(declare-fun d!115607 () Bool)

(declare-fun e!535966 () Bool)

(assert (=> d!115607 e!535966))

(declare-fun c!99629 () Bool)

(assert (=> d!115607 (= c!99629 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!115607 true))

(declare-fun _$15!104 () Unit!31976)

(assert (=> d!115607 (= (choose!1591 (_keys!10749 thiss!1141) (_values!5807 thiss!1141) (mask!27631 thiss!1141) (extraKeys!5516 thiss!1141) (zeroValue!5620 thiss!1141) (minValue!5620 thiss!1141) key!756 (defaultEntry!5784 thiss!1141)) _$15!104)))

(declare-fun b!951780 () Bool)

(assert (=> b!951780 (= e!535966 (arrayContainsKey!0 (_keys!10749 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!951781 () Bool)

(assert (=> b!951781 (= e!535966 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5516 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115607 c!99629) b!951780))

(assert (= (and d!115607 (not c!99629)) b!951781))

(assert (=> b!951780 m!884193))

(assert (=> d!115517 d!115607))

(assert (=> d!115517 d!115511))

(declare-fun d!115609 () Bool)

(declare-fun e!535967 () Bool)

(assert (=> d!115609 e!535967))

(declare-fun res!637732 () Bool)

(assert (=> d!115609 (=> res!637732 e!535967)))

(declare-fun lt!428637 () Bool)

(assert (=> d!115609 (= res!637732 (not lt!428637))))

(declare-fun lt!428636 () Bool)

(assert (=> d!115609 (= lt!428637 lt!428636)))

(declare-fun lt!428635 () Unit!31976)

(declare-fun e!535968 () Unit!31976)

(assert (=> d!115609 (= lt!428635 e!535968)))

(declare-fun c!99630 () Bool)

(assert (=> d!115609 (= c!99630 lt!428636)))

(assert (=> d!115609 (= lt!428636 (containsKey!467 (toList!6134 lt!428505) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!115609 (= (contains!5236 lt!428505 #b1000000000000000000000000000000000000000000000000000000000000000) lt!428637)))

(declare-fun b!951782 () Bool)

(declare-fun lt!428638 () Unit!31976)

(assert (=> b!951782 (= e!535968 lt!428638)))

(assert (=> b!951782 (= lt!428638 (lemmaContainsKeyImpliesGetValueByKeyDefined!361 (toList!6134 lt!428505) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!951782 (isDefined!369 (getValueByKey!496 (toList!6134 lt!428505) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!951783 () Bool)

(declare-fun Unit!31983 () Unit!31976)

(assert (=> b!951783 (= e!535968 Unit!31983)))

(declare-fun b!951784 () Bool)

(assert (=> b!951784 (= e!535967 (isDefined!369 (getValueByKey!496 (toList!6134 lt!428505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!115609 c!99630) b!951782))

(assert (= (and d!115609 (not c!99630)) b!951783))

(assert (= (and d!115609 (not res!637732)) b!951784))

(declare-fun m!884563 () Bool)

(assert (=> d!115609 m!884563))

(declare-fun m!884565 () Bool)

(assert (=> b!951782 m!884565))

(assert (=> b!951782 m!884361))

(assert (=> b!951782 m!884361))

(declare-fun m!884567 () Bool)

(assert (=> b!951782 m!884567))

(assert (=> b!951784 m!884361))

(assert (=> b!951784 m!884361))

(assert (=> b!951784 m!884567))

(assert (=> bm!41454 d!115609))

(declare-fun mapIsEmpty!33057 () Bool)

(declare-fun mapRes!33057 () Bool)

(assert (=> mapIsEmpty!33057 mapRes!33057))

(declare-fun b!951786 () Bool)

(declare-fun e!535970 () Bool)

(assert (=> b!951786 (= e!535970 tp_is_empty!20755)))

(declare-fun condMapEmpty!33057 () Bool)

(declare-fun mapDefault!33057 () ValueCell!9896)

(assert (=> mapNonEmpty!33056 (= condMapEmpty!33057 (= mapRest!33056 ((as const (Array (_ BitVec 32) ValueCell!9896)) mapDefault!33057)))))

(assert (=> mapNonEmpty!33056 (= tp!63356 (and e!535970 mapRes!33057))))

(declare-fun mapNonEmpty!33057 () Bool)

(declare-fun tp!63357 () Bool)

(declare-fun e!535969 () Bool)

(assert (=> mapNonEmpty!33057 (= mapRes!33057 (and tp!63357 e!535969))))

(declare-fun mapKey!33057 () (_ BitVec 32))

(declare-fun mapValue!33057 () ValueCell!9896)

(declare-fun mapRest!33057 () (Array (_ BitVec 32) ValueCell!9896))

(assert (=> mapNonEmpty!33057 (= mapRest!33056 (store mapRest!33057 mapKey!33057 mapValue!33057))))

(declare-fun b!951785 () Bool)

(assert (=> b!951785 (= e!535969 tp_is_empty!20755)))

(assert (= (and mapNonEmpty!33056 condMapEmpty!33057) mapIsEmpty!33057))

(assert (= (and mapNonEmpty!33056 (not condMapEmpty!33057)) mapNonEmpty!33057))

(assert (= (and mapNonEmpty!33057 ((_ is ValueCellFull!9896) mapValue!33057)) b!951785))

(assert (= (and mapNonEmpty!33056 ((_ is ValueCellFull!9896) mapDefault!33057)) b!951786))

(declare-fun m!884569 () Bool)

(assert (=> mapNonEmpty!33057 m!884569))

(declare-fun b_lambda!14393 () Bool)

(assert (= b_lambda!14391 (or (and b!951394 b_free!18247) b_lambda!14393)))

(declare-fun b_lambda!14395 () Bool)

(assert (= b_lambda!14389 (or (and b!951394 b_free!18247) b_lambda!14395)))

(check-sat (not b!951640) (not b_lambda!14395) (not b!951641) (not b!951599) (not d!115561) (not bm!41460) (not b!951665) (not b!951600) (not b!951751) (not d!115569) (not b!951718) (not b!951606) (not b!951775) (not d!115599) (not b!951652) (not b!951756) (not d!115567) (not b!951632) (not d!115585) (not b!951588) (not b!951758) (not d!115551) (not bm!41463) (not b!951760) (not b!951712) (not b!951586) (not b!951636) (not d!115575) (not b!951759) (not d!115609) (not b!951717) (not d!115539) (not b!951715) (not b!951637) (not b!951784) (not d!115555) (not d!115573) (not d!115559) (not b!951694) (not b_lambda!14387) (not b_next!18247) (not b_lambda!14393) (not b!951720) (not b!951702) (not b!951691) (not b!951780) (not d!115583) (not b!951605) (not b!951737) (not d!115603) (not b!951631) (not d!115563) b_and!29725 (not d!115605) (not b!951638) (not d!115557) (not b!951710) (not d!115581) (not d!115571) (not b!951701) (not d!115589) (not b!951653) (not b!951754) (not d!115543) (not d!115565) (not bm!41457) tp_is_empty!20755 (not b!951634) (not b!951740) (not b!951716) (not b!951696) (not d!115595) (not b!951755) (not b!951782) (not d!115591) (not d!115597) (not d!115545) (not b!951713) (not b!951714) (not bm!41466) (not mapNonEmpty!33057) (not d!115577) (not b!951739) (not b!951771) (not d!115537) (not d!115579))
(check-sat b_and!29725 (not b_next!18247))
