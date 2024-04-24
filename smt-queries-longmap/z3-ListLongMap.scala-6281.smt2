; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80476 () Bool)

(assert start!80476)

(declare-fun b!944399 () Bool)

(declare-fun b_free!18007 () Bool)

(declare-fun b_next!18007 () Bool)

(assert (=> b!944399 (= b_free!18007 (not b_next!18007))))

(declare-fun tp!62528 () Bool)

(declare-fun b_and!29429 () Bool)

(assert (=> b!944399 (= tp!62528 b_and!29429)))

(declare-fun mapIsEmpty!32594 () Bool)

(declare-fun mapRes!32594 () Bool)

(assert (=> mapIsEmpty!32594 mapRes!32594))

(declare-fun mapNonEmpty!32594 () Bool)

(declare-fun tp!62527 () Bool)

(declare-fun e!531059 () Bool)

(assert (=> mapNonEmpty!32594 (= mapRes!32594 (and tp!62527 e!531059))))

(declare-datatypes ((V!32319 0))(
  ( (V!32320 (val!10308 Int)) )
))
(declare-datatypes ((ValueCell!9776 0))(
  ( (ValueCellFull!9776 (v!12836 V!32319)) (EmptyCell!9776) )
))
(declare-datatypes ((array!57047 0))(
  ( (array!57048 (arr!27445 (Array (_ BitVec 32) ValueCell!9776)) (size!27911 (_ BitVec 32))) )
))
(declare-datatypes ((array!57049 0))(
  ( (array!57050 (arr!27446 (Array (_ BitVec 32) (_ BitVec 64))) (size!27912 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4702 0))(
  ( (LongMapFixedSize!4703 (defaultEntry!5642 Int) (mask!27315 (_ BitVec 32)) (extraKeys!5374 (_ BitVec 32)) (zeroValue!5478 V!32319) (minValue!5478 V!32319) (_size!2406 (_ BitVec 32)) (_keys!10544 array!57049) (_values!5665 array!57047) (_vacant!2406 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4702)

(declare-fun mapKey!32594 () (_ BitVec 32))

(declare-fun mapValue!32594 () ValueCell!9776)

(declare-fun mapRest!32594 () (Array (_ BitVec 32) ValueCell!9776))

(assert (=> mapNonEmpty!32594 (= (arr!27445 (_values!5665 thiss!1141)) (store mapRest!32594 mapKey!32594 mapValue!32594))))

(declare-fun b!944395 () Bool)

(declare-fun e!531058 () Bool)

(declare-fun tp_is_empty!20515 () Bool)

(assert (=> b!944395 (= e!531058 tp_is_empty!20515)))

(declare-fun b!944396 () Bool)

(declare-fun res!634301 () Bool)

(declare-fun e!531057 () Bool)

(assert (=> b!944396 (=> (not res!634301) (not e!531057))))

(declare-fun key!756 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9012 0))(
  ( (MissingZero!9012 (index!38419 (_ BitVec 32))) (Found!9012 (index!38420 (_ BitVec 32))) (Intermediate!9012 (undefined!9824 Bool) (index!38421 (_ BitVec 32)) (x!81003 (_ BitVec 32))) (Undefined!9012) (MissingVacant!9012 (index!38422 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57049 (_ BitVec 32)) SeekEntryResult!9012)

(assert (=> b!944396 (= res!634301 (not ((_ is Found!9012) (seekEntry!0 key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)))))))

(declare-fun b!944397 () Bool)

(declare-fun res!634302 () Bool)

(assert (=> b!944397 (=> (not res!634302) (not e!531057))))

(declare-datatypes ((tuple2!13430 0))(
  ( (tuple2!13431 (_1!6726 (_ BitVec 64)) (_2!6726 V!32319)) )
))
(declare-datatypes ((List!19243 0))(
  ( (Nil!19240) (Cons!19239 (h!20395 tuple2!13430) (t!27550 List!19243)) )
))
(declare-datatypes ((ListLongMap!12129 0))(
  ( (ListLongMap!12130 (toList!6080 List!19243)) )
))
(declare-fun contains!5161 (ListLongMap!12129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3314 (array!57049 array!57047 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 32) Int) ListLongMap!12129)

(assert (=> b!944397 (= res!634302 (contains!5161 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) key!756))))

(declare-fun b!944398 () Bool)

(assert (=> b!944398 (= e!531059 tp_is_empty!20515)))

(declare-fun e!531056 () Bool)

(declare-fun e!531060 () Bool)

(declare-fun array_inv!21412 (array!57049) Bool)

(declare-fun array_inv!21413 (array!57047) Bool)

(assert (=> b!944399 (= e!531056 (and tp!62528 tp_is_empty!20515 (array_inv!21412 (_keys!10544 thiss!1141)) (array_inv!21413 (_values!5665 thiss!1141)) e!531060))))

(declare-fun b!944400 () Bool)

(assert (=> b!944400 (= e!531057 (not (and (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))) (bvslt (size!27912 (_keys!10544 thiss!1141)) #b01111111111111111111111111111111))))))

(declare-fun arrayContainsKey!0 (array!57049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944400 (arrayContainsKey!0 (_keys!10544 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31788 0))(
  ( (Unit!31789) )
))
(declare-fun lt!425621 () Unit!31788)

(declare-fun lemmaKeyInListMapIsInArray!288 (array!57049 array!57047 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 64) Int) Unit!31788)

(assert (=> b!944400 (= lt!425621 (lemmaKeyInListMapIsInArray!288 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)))))

(declare-fun res!634303 () Bool)

(assert (=> start!80476 (=> (not res!634303) (not e!531057))))

(declare-fun valid!1805 (LongMapFixedSize!4702) Bool)

(assert (=> start!80476 (= res!634303 (valid!1805 thiss!1141))))

(assert (=> start!80476 e!531057))

(assert (=> start!80476 e!531056))

(assert (=> start!80476 true))

(declare-fun b!944401 () Bool)

(declare-fun res!634300 () Bool)

(assert (=> b!944401 (=> (not res!634300) (not e!531057))))

(assert (=> b!944401 (= res!634300 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944402 () Bool)

(assert (=> b!944402 (= e!531060 (and e!531058 mapRes!32594))))

(declare-fun condMapEmpty!32594 () Bool)

(declare-fun mapDefault!32594 () ValueCell!9776)

(assert (=> b!944402 (= condMapEmpty!32594 (= (arr!27445 (_values!5665 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9776)) mapDefault!32594)))))

(assert (= (and start!80476 res!634303) b!944401))

(assert (= (and b!944401 res!634300) b!944396))

(assert (= (and b!944396 res!634301) b!944397))

(assert (= (and b!944397 res!634302) b!944400))

(assert (= (and b!944402 condMapEmpty!32594) mapIsEmpty!32594))

(assert (= (and b!944402 (not condMapEmpty!32594)) mapNonEmpty!32594))

(assert (= (and mapNonEmpty!32594 ((_ is ValueCellFull!9776) mapValue!32594)) b!944398))

(assert (= (and b!944402 ((_ is ValueCellFull!9776) mapDefault!32594)) b!944395))

(assert (= b!944399 b!944402))

(assert (= start!80476 b!944399))

(declare-fun m!878933 () Bool)

(assert (=> b!944397 m!878933))

(assert (=> b!944397 m!878933))

(declare-fun m!878935 () Bool)

(assert (=> b!944397 m!878935))

(declare-fun m!878937 () Bool)

(assert (=> b!944399 m!878937))

(declare-fun m!878939 () Bool)

(assert (=> b!944399 m!878939))

(declare-fun m!878941 () Bool)

(assert (=> mapNonEmpty!32594 m!878941))

(declare-fun m!878943 () Bool)

(assert (=> b!944400 m!878943))

(declare-fun m!878945 () Bool)

(assert (=> b!944400 m!878945))

(declare-fun m!878947 () Bool)

(assert (=> start!80476 m!878947))

(declare-fun m!878949 () Bool)

(assert (=> b!944396 m!878949))

(check-sat b_and!29429 (not start!80476) (not mapNonEmpty!32594) (not b!944399) (not b!944400) tp_is_empty!20515 (not b!944397) (not b!944396) (not b_next!18007))
(check-sat b_and!29429 (not b_next!18007))
(get-model)

(declare-fun d!114545 () Bool)

(declare-fun lt!425639 () SeekEntryResult!9012)

(assert (=> d!114545 (and (or ((_ is MissingVacant!9012) lt!425639) (not ((_ is Found!9012) lt!425639)) (and (bvsge (index!38420 lt!425639) #b00000000000000000000000000000000) (bvslt (index!38420 lt!425639) (size!27912 (_keys!10544 thiss!1141))))) (not ((_ is MissingVacant!9012) lt!425639)) (or (not ((_ is Found!9012) lt!425639)) (= (select (arr!27446 (_keys!10544 thiss!1141)) (index!38420 lt!425639)) key!756)))))

(declare-fun e!531103 () SeekEntryResult!9012)

(assert (=> d!114545 (= lt!425639 e!531103)))

(declare-fun c!98533 () Bool)

(declare-fun lt!425637 () SeekEntryResult!9012)

(assert (=> d!114545 (= c!98533 (and ((_ is Intermediate!9012) lt!425637) (undefined!9824 lt!425637)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57049 (_ BitVec 32)) SeekEntryResult!9012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!114545 (= lt!425637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27315 thiss!1141)) key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!114545 (validMask!0 (mask!27315 thiss!1141))))

(assert (=> d!114545 (= (seekEntry!0 key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)) lt!425639)))

(declare-fun b!944463 () Bool)

(declare-fun e!531105 () SeekEntryResult!9012)

(declare-fun lt!425636 () SeekEntryResult!9012)

(assert (=> b!944463 (= e!531105 (ite ((_ is MissingVacant!9012) lt!425636) (MissingZero!9012 (index!38422 lt!425636)) lt!425636))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57049 (_ BitVec 32)) SeekEntryResult!9012)

(assert (=> b!944463 (= lt!425636 (seekKeyOrZeroReturnVacant!0 (x!81003 lt!425637) (index!38421 lt!425637) (index!38421 lt!425637) key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)))))

(declare-fun b!944464 () Bool)

(declare-fun e!531104 () SeekEntryResult!9012)

(assert (=> b!944464 (= e!531104 (Found!9012 (index!38421 lt!425637)))))

(declare-fun b!944465 () Bool)

(assert (=> b!944465 (= e!531103 Undefined!9012)))

(declare-fun b!944466 () Bool)

(assert (=> b!944466 (= e!531103 e!531104)))

(declare-fun lt!425638 () (_ BitVec 64))

(assert (=> b!944466 (= lt!425638 (select (arr!27446 (_keys!10544 thiss!1141)) (index!38421 lt!425637)))))

(declare-fun c!98531 () Bool)

(assert (=> b!944466 (= c!98531 (= lt!425638 key!756))))

(declare-fun b!944467 () Bool)

(assert (=> b!944467 (= e!531105 (MissingZero!9012 (index!38421 lt!425637)))))

(declare-fun b!944468 () Bool)

(declare-fun c!98532 () Bool)

(assert (=> b!944468 (= c!98532 (= lt!425638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!944468 (= e!531104 e!531105)))

(assert (= (and d!114545 c!98533) b!944465))

(assert (= (and d!114545 (not c!98533)) b!944466))

(assert (= (and b!944466 c!98531) b!944464))

(assert (= (and b!944466 (not c!98531)) b!944468))

(assert (= (and b!944468 c!98532) b!944467))

(assert (= (and b!944468 (not c!98532)) b!944463))

(declare-fun m!878987 () Bool)

(assert (=> d!114545 m!878987))

(declare-fun m!878989 () Bool)

(assert (=> d!114545 m!878989))

(assert (=> d!114545 m!878989))

(declare-fun m!878991 () Bool)

(assert (=> d!114545 m!878991))

(declare-fun m!878993 () Bool)

(assert (=> d!114545 m!878993))

(declare-fun m!878995 () Bool)

(assert (=> b!944463 m!878995))

(declare-fun m!878997 () Bool)

(assert (=> b!944466 m!878997))

(assert (=> b!944396 d!114545))

(declare-fun d!114547 () Bool)

(declare-fun e!531111 () Bool)

(assert (=> d!114547 e!531111))

(declare-fun res!634330 () Bool)

(assert (=> d!114547 (=> res!634330 e!531111)))

(declare-fun lt!425650 () Bool)

(assert (=> d!114547 (= res!634330 (not lt!425650))))

(declare-fun lt!425651 () Bool)

(assert (=> d!114547 (= lt!425650 lt!425651)))

(declare-fun lt!425648 () Unit!31788)

(declare-fun e!531110 () Unit!31788)

(assert (=> d!114547 (= lt!425648 e!531110)))

(declare-fun c!98536 () Bool)

(assert (=> d!114547 (= c!98536 lt!425651)))

(declare-fun containsKey!454 (List!19243 (_ BitVec 64)) Bool)

(assert (=> d!114547 (= lt!425651 (containsKey!454 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(assert (=> d!114547 (= (contains!5161 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) key!756) lt!425650)))

(declare-fun b!944475 () Bool)

(declare-fun lt!425649 () Unit!31788)

(assert (=> b!944475 (= e!531110 lt!425649)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!348 (List!19243 (_ BitVec 64)) Unit!31788)

(assert (=> b!944475 (= lt!425649 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-datatypes ((Option!489 0))(
  ( (Some!488 (v!12839 V!32319)) (None!487) )
))
(declare-fun isDefined!356 (Option!489) Bool)

(declare-fun getValueByKey!483 (List!19243 (_ BitVec 64)) Option!489)

(assert (=> b!944475 (isDefined!356 (getValueByKey!483 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-fun b!944476 () Bool)

(declare-fun Unit!31792 () Unit!31788)

(assert (=> b!944476 (= e!531110 Unit!31792)))

(declare-fun b!944477 () Bool)

(assert (=> b!944477 (= e!531111 (isDefined!356 (getValueByKey!483 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756)))))

(assert (= (and d!114547 c!98536) b!944475))

(assert (= (and d!114547 (not c!98536)) b!944476))

(assert (= (and d!114547 (not res!634330)) b!944477))

(declare-fun m!878999 () Bool)

(assert (=> d!114547 m!878999))

(declare-fun m!879001 () Bool)

(assert (=> b!944475 m!879001))

(declare-fun m!879003 () Bool)

(assert (=> b!944475 m!879003))

(assert (=> b!944475 m!879003))

(declare-fun m!879005 () Bool)

(assert (=> b!944475 m!879005))

(assert (=> b!944477 m!879003))

(assert (=> b!944477 m!879003))

(assert (=> b!944477 m!879005))

(assert (=> b!944397 d!114547))

(declare-fun b!944520 () Bool)

(declare-fun e!531149 () Bool)

(declare-fun call!41030 () Bool)

(assert (=> b!944520 (= e!531149 (not call!41030))))

(declare-fun b!944521 () Bool)

(declare-fun e!531138 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!944521 (= e!531138 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944522 () Bool)

(declare-fun e!531142 () Unit!31788)

(declare-fun lt!425711 () Unit!31788)

(assert (=> b!944522 (= e!531142 lt!425711)))

(declare-fun lt!425715 () ListLongMap!12129)

(declare-fun getCurrentListMapNoExtraKeys!3349 (array!57049 array!57047 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 32) Int) ListLongMap!12129)

(assert (=> b!944522 (= lt!425715 (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425702 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425702 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425712 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425712 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425713 () Unit!31788)

(declare-fun addStillContains!564 (ListLongMap!12129 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31788)

(assert (=> b!944522 (= lt!425713 (addStillContains!564 lt!425715 lt!425702 (zeroValue!5478 thiss!1141) lt!425712))))

(declare-fun +!2861 (ListLongMap!12129 tuple2!13430) ListLongMap!12129)

(assert (=> b!944522 (contains!5161 (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))) lt!425712)))

(declare-fun lt!425696 () Unit!31788)

(assert (=> b!944522 (= lt!425696 lt!425713)))

(declare-fun lt!425716 () ListLongMap!12129)

(assert (=> b!944522 (= lt!425716 (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425717 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425717 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425705 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425705 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425710 () Unit!31788)

(declare-fun addApplyDifferent!445 (ListLongMap!12129 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31788)

(assert (=> b!944522 (= lt!425710 (addApplyDifferent!445 lt!425716 lt!425717 (minValue!5478 thiss!1141) lt!425705))))

(declare-fun apply!875 (ListLongMap!12129 (_ BitVec 64)) V!32319)

(assert (=> b!944522 (= (apply!875 (+!2861 lt!425716 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))) lt!425705) (apply!875 lt!425716 lt!425705))))

(declare-fun lt!425704 () Unit!31788)

(assert (=> b!944522 (= lt!425704 lt!425710)))

(declare-fun lt!425714 () ListLongMap!12129)

(assert (=> b!944522 (= lt!425714 (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425700 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425698 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425698 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425706 () Unit!31788)

(assert (=> b!944522 (= lt!425706 (addApplyDifferent!445 lt!425714 lt!425700 (zeroValue!5478 thiss!1141) lt!425698))))

(assert (=> b!944522 (= (apply!875 (+!2861 lt!425714 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))) lt!425698) (apply!875 lt!425714 lt!425698))))

(declare-fun lt!425703 () Unit!31788)

(assert (=> b!944522 (= lt!425703 lt!425706)))

(declare-fun lt!425699 () ListLongMap!12129)

(assert (=> b!944522 (= lt!425699 (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun lt!425701 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425701 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!425709 () (_ BitVec 64))

(assert (=> b!944522 (= lt!425709 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!944522 (= lt!425711 (addApplyDifferent!445 lt!425699 lt!425701 (minValue!5478 thiss!1141) lt!425709))))

(assert (=> b!944522 (= (apply!875 (+!2861 lt!425699 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))) lt!425709) (apply!875 lt!425699 lt!425709))))

(declare-fun b!944523 () Bool)

(declare-fun e!531144 () Bool)

(declare-fun e!531145 () Bool)

(assert (=> b!944523 (= e!531144 e!531145)))

(declare-fun res!634352 () Bool)

(assert (=> b!944523 (=> (not res!634352) (not e!531145))))

(declare-fun lt!425707 () ListLongMap!12129)

(assert (=> b!944523 (= res!634352 (contains!5161 lt!425707 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!944523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun b!944524 () Bool)

(declare-fun get!14453 (ValueCell!9776 V!32319) V!32319)

(declare-fun dynLambda!1658 (Int (_ BitVec 64)) V!32319)

(assert (=> b!944524 (= e!531145 (= (apply!875 lt!425707 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)) (get!14453 (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!944524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27911 (_values!5665 thiss!1141))))))

(assert (=> b!944524 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun b!944525 () Bool)

(declare-fun e!531147 () Bool)

(assert (=> b!944525 (= e!531147 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944527 () Bool)

(declare-fun res!634355 () Bool)

(declare-fun e!531143 () Bool)

(assert (=> b!944527 (=> (not res!634355) (not e!531143))))

(assert (=> b!944527 (= res!634355 e!531144)))

(declare-fun res!634353 () Bool)

(assert (=> b!944527 (=> res!634353 e!531144)))

(assert (=> b!944527 (= res!634353 (not e!531138))))

(declare-fun res!634354 () Bool)

(assert (=> b!944527 (=> (not res!634354) (not e!531138))))

(assert (=> b!944527 (= res!634354 (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun bm!41022 () Bool)

(declare-fun call!41027 () Bool)

(assert (=> bm!41022 (= call!41027 (contains!5161 lt!425707 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!41023 () Bool)

(declare-fun call!41025 () ListLongMap!12129)

(declare-fun call!41026 () ListLongMap!12129)

(assert (=> bm!41023 (= call!41025 call!41026)))

(declare-fun b!944528 () Bool)

(declare-fun e!531139 () ListLongMap!12129)

(declare-fun e!531140 () ListLongMap!12129)

(assert (=> b!944528 (= e!531139 e!531140)))

(declare-fun c!98554 () Bool)

(assert (=> b!944528 (= c!98554 (and (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!41031 () ListLongMap!12129)

(declare-fun c!98549 () Bool)

(declare-fun call!41029 () ListLongMap!12129)

(declare-fun bm!41024 () Bool)

(declare-fun call!41028 () ListLongMap!12129)

(assert (=> bm!41024 (= call!41026 (+!2861 (ite c!98549 call!41029 (ite c!98554 call!41028 call!41031)) (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(declare-fun b!944529 () Bool)

(declare-fun e!531150 () ListLongMap!12129)

(assert (=> b!944529 (= e!531150 call!41025)))

(declare-fun b!944530 () Bool)

(declare-fun res!634357 () Bool)

(assert (=> b!944530 (=> (not res!634357) (not e!531143))))

(declare-fun e!531146 () Bool)

(assert (=> b!944530 (= res!634357 e!531146)))

(declare-fun c!98553 () Bool)

(assert (=> b!944530 (= c!98553 (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!944531 () Bool)

(declare-fun Unit!31793 () Unit!31788)

(assert (=> b!944531 (= e!531142 Unit!31793)))

(declare-fun b!944532 () Bool)

(assert (=> b!944532 (= e!531140 call!41025)))

(declare-fun b!944533 () Bool)

(declare-fun c!98550 () Bool)

(assert (=> b!944533 (= c!98550 (and (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!944533 (= e!531140 e!531150)))

(declare-fun bm!41025 () Bool)

(assert (=> bm!41025 (= call!41030 (contains!5161 lt!425707 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!944534 () Bool)

(declare-fun e!531141 () Bool)

(assert (=> b!944534 (= e!531149 e!531141)))

(declare-fun res!634349 () Bool)

(assert (=> b!944534 (= res!634349 call!41030)))

(assert (=> b!944534 (=> (not res!634349) (not e!531141))))

(declare-fun b!944535 () Bool)

(assert (=> b!944535 (= e!531146 (not call!41027))))

(declare-fun b!944536 () Bool)

(assert (=> b!944536 (= e!531150 call!41031)))

(declare-fun b!944537 () Bool)

(assert (=> b!944537 (= e!531141 (= (apply!875 lt!425707 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5478 thiss!1141)))))

(declare-fun d!114549 () Bool)

(assert (=> d!114549 e!531143))

(declare-fun res!634350 () Bool)

(assert (=> d!114549 (=> (not res!634350) (not e!531143))))

(assert (=> d!114549 (= res!634350 (or (bvsge #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))))

(declare-fun lt!425708 () ListLongMap!12129)

(assert (=> d!114549 (= lt!425707 lt!425708)))

(declare-fun lt!425697 () Unit!31788)

(assert (=> d!114549 (= lt!425697 e!531142)))

(declare-fun c!98552 () Bool)

(assert (=> d!114549 (= c!98552 e!531147)))

(declare-fun res!634356 () Bool)

(assert (=> d!114549 (=> (not res!634356) (not e!531147))))

(assert (=> d!114549 (= res!634356 (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> d!114549 (= lt!425708 e!531139)))

(assert (=> d!114549 (= c!98549 (and (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!114549 (validMask!0 (mask!27315 thiss!1141))))

(assert (=> d!114549 (= (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) lt!425707)))

(declare-fun b!944526 () Bool)

(assert (=> b!944526 (= e!531143 e!531149)))

(declare-fun c!98551 () Bool)

(assert (=> b!944526 (= c!98551 (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!944538 () Bool)

(declare-fun e!531148 () Bool)

(assert (=> b!944538 (= e!531148 (= (apply!875 lt!425707 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5478 thiss!1141)))))

(declare-fun bm!41026 () Bool)

(assert (=> bm!41026 (= call!41028 call!41029)))

(declare-fun bm!41027 () Bool)

(assert (=> bm!41027 (= call!41029 (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))

(declare-fun b!944539 () Bool)

(assert (=> b!944539 (= e!531146 e!531148)))

(declare-fun res!634351 () Bool)

(assert (=> b!944539 (= res!634351 call!41027)))

(assert (=> b!944539 (=> (not res!634351) (not e!531148))))

(declare-fun bm!41028 () Bool)

(assert (=> bm!41028 (= call!41031 call!41028)))

(declare-fun b!944540 () Bool)

(assert (=> b!944540 (= e!531139 (+!2861 call!41026 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))

(assert (= (and d!114549 c!98549) b!944540))

(assert (= (and d!114549 (not c!98549)) b!944528))

(assert (= (and b!944528 c!98554) b!944532))

(assert (= (and b!944528 (not c!98554)) b!944533))

(assert (= (and b!944533 c!98550) b!944529))

(assert (= (and b!944533 (not c!98550)) b!944536))

(assert (= (or b!944529 b!944536) bm!41028))

(assert (= (or b!944532 bm!41028) bm!41026))

(assert (= (or b!944532 b!944529) bm!41023))

(assert (= (or b!944540 bm!41026) bm!41027))

(assert (= (or b!944540 bm!41023) bm!41024))

(assert (= (and d!114549 res!634356) b!944525))

(assert (= (and d!114549 c!98552) b!944522))

(assert (= (and d!114549 (not c!98552)) b!944531))

(assert (= (and d!114549 res!634350) b!944527))

(assert (= (and b!944527 res!634354) b!944521))

(assert (= (and b!944527 (not res!634353)) b!944523))

(assert (= (and b!944523 res!634352) b!944524))

(assert (= (and b!944527 res!634355) b!944530))

(assert (= (and b!944530 c!98553) b!944539))

(assert (= (and b!944530 (not c!98553)) b!944535))

(assert (= (and b!944539 res!634351) b!944538))

(assert (= (or b!944539 b!944535) bm!41022))

(assert (= (and b!944530 res!634357) b!944526))

(assert (= (and b!944526 c!98551) b!944534))

(assert (= (and b!944526 (not c!98551)) b!944520))

(assert (= (and b!944534 res!634349) b!944537))

(assert (= (or b!944534 b!944520) bm!41025))

(declare-fun b_lambda!14293 () Bool)

(assert (=> (not b_lambda!14293) (not b!944524)))

(declare-fun t!27554 () Bool)

(declare-fun tb!6159 () Bool)

(assert (=> (and b!944399 (= (defaultEntry!5642 thiss!1141) (defaultEntry!5642 thiss!1141)) t!27554) tb!6159))

(declare-fun result!12187 () Bool)

(assert (=> tb!6159 (= result!12187 tp_is_empty!20515)))

(assert (=> b!944524 t!27554))

(declare-fun b_and!29435 () Bool)

(assert (= b_and!29429 (and (=> t!27554 result!12187) b_and!29435)))

(assert (=> d!114549 m!878993))

(declare-fun m!879007 () Bool)

(assert (=> b!944525 m!879007))

(assert (=> b!944525 m!879007))

(declare-fun m!879009 () Bool)

(assert (=> b!944525 m!879009))

(assert (=> b!944521 m!879007))

(assert (=> b!944521 m!879007))

(assert (=> b!944521 m!879009))

(assert (=> b!944523 m!879007))

(assert (=> b!944523 m!879007))

(declare-fun m!879011 () Bool)

(assert (=> b!944523 m!879011))

(declare-fun m!879013 () Bool)

(assert (=> b!944524 m!879013))

(assert (=> b!944524 m!879013))

(declare-fun m!879015 () Bool)

(assert (=> b!944524 m!879015))

(declare-fun m!879017 () Bool)

(assert (=> b!944524 m!879017))

(assert (=> b!944524 m!879015))

(assert (=> b!944524 m!879007))

(assert (=> b!944524 m!879007))

(declare-fun m!879019 () Bool)

(assert (=> b!944524 m!879019))

(declare-fun m!879021 () Bool)

(assert (=> bm!41025 m!879021))

(declare-fun m!879023 () Bool)

(assert (=> b!944538 m!879023))

(declare-fun m!879025 () Bool)

(assert (=> b!944522 m!879025))

(declare-fun m!879027 () Bool)

(assert (=> b!944522 m!879027))

(declare-fun m!879029 () Bool)

(assert (=> b!944522 m!879029))

(declare-fun m!879031 () Bool)

(assert (=> b!944522 m!879031))

(declare-fun m!879033 () Bool)

(assert (=> b!944522 m!879033))

(declare-fun m!879035 () Bool)

(assert (=> b!944522 m!879035))

(declare-fun m!879037 () Bool)

(assert (=> b!944522 m!879037))

(declare-fun m!879039 () Bool)

(assert (=> b!944522 m!879039))

(declare-fun m!879041 () Bool)

(assert (=> b!944522 m!879041))

(declare-fun m!879043 () Bool)

(assert (=> b!944522 m!879043))

(declare-fun m!879045 () Bool)

(assert (=> b!944522 m!879045))

(declare-fun m!879047 () Bool)

(assert (=> b!944522 m!879047))

(assert (=> b!944522 m!879037))

(declare-fun m!879049 () Bool)

(assert (=> b!944522 m!879049))

(assert (=> b!944522 m!879007))

(assert (=> b!944522 m!879031))

(declare-fun m!879051 () Bool)

(assert (=> b!944522 m!879051))

(assert (=> b!944522 m!879025))

(declare-fun m!879053 () Bool)

(assert (=> b!944522 m!879053))

(assert (=> b!944522 m!879029))

(declare-fun m!879055 () Bool)

(assert (=> b!944522 m!879055))

(declare-fun m!879057 () Bool)

(assert (=> b!944537 m!879057))

(assert (=> bm!41027 m!879035))

(declare-fun m!879059 () Bool)

(assert (=> b!944540 m!879059))

(declare-fun m!879061 () Bool)

(assert (=> bm!41024 m!879061))

(declare-fun m!879063 () Bool)

(assert (=> bm!41022 m!879063))

(assert (=> b!944397 d!114549))

(declare-fun d!114551 () Bool)

(declare-fun res!634364 () Bool)

(declare-fun e!531153 () Bool)

(assert (=> d!114551 (=> (not res!634364) (not e!531153))))

(declare-fun simpleValid!348 (LongMapFixedSize!4702) Bool)

(assert (=> d!114551 (= res!634364 (simpleValid!348 thiss!1141))))

(assert (=> d!114551 (= (valid!1805 thiss!1141) e!531153)))

(declare-fun b!944549 () Bool)

(declare-fun res!634365 () Bool)

(assert (=> b!944549 (=> (not res!634365) (not e!531153))))

(declare-fun arrayCountValidKeys!0 (array!57049 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944549 (= res!634365 (= (arrayCountValidKeys!0 (_keys!10544 thiss!1141) #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))) (_size!2406 thiss!1141)))))

(declare-fun b!944550 () Bool)

(declare-fun res!634366 () Bool)

(assert (=> b!944550 (=> (not res!634366) (not e!531153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57049 (_ BitVec 32)) Bool)

(assert (=> b!944550 (= res!634366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)))))

(declare-fun b!944551 () Bool)

(declare-datatypes ((List!19246 0))(
  ( (Nil!19243) (Cons!19242 (h!20398 (_ BitVec 64)) (t!27555 List!19246)) )
))
(declare-fun arrayNoDuplicates!0 (array!57049 (_ BitVec 32) List!19246) Bool)

(assert (=> b!944551 (= e!531153 (arrayNoDuplicates!0 (_keys!10544 thiss!1141) #b00000000000000000000000000000000 Nil!19243))))

(assert (= (and d!114551 res!634364) b!944549))

(assert (= (and b!944549 res!634365) b!944550))

(assert (= (and b!944550 res!634366) b!944551))

(declare-fun m!879065 () Bool)

(assert (=> d!114551 m!879065))

(declare-fun m!879067 () Bool)

(assert (=> b!944549 m!879067))

(declare-fun m!879069 () Bool)

(assert (=> b!944550 m!879069))

(declare-fun m!879071 () Bool)

(assert (=> b!944551 m!879071))

(assert (=> start!80476 d!114551))

(declare-fun d!114553 () Bool)

(assert (=> d!114553 (= (array_inv!21412 (_keys!10544 thiss!1141)) (bvsge (size!27912 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!944399 d!114553))

(declare-fun d!114555 () Bool)

(assert (=> d!114555 (= (array_inv!21413 (_values!5665 thiss!1141)) (bvsge (size!27911 (_values!5665 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!944399 d!114555))

(declare-fun d!114557 () Bool)

(declare-fun res!634371 () Bool)

(declare-fun e!531158 () Bool)

(assert (=> d!114557 (=> res!634371 e!531158)))

(assert (=> d!114557 (= res!634371 (= (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!114557 (= (arrayContainsKey!0 (_keys!10544 thiss!1141) key!756 #b00000000000000000000000000000000) e!531158)))

(declare-fun b!944556 () Bool)

(declare-fun e!531159 () Bool)

(assert (=> b!944556 (= e!531158 e!531159)))

(declare-fun res!634372 () Bool)

(assert (=> b!944556 (=> (not res!634372) (not e!531159))))

(assert (=> b!944556 (= res!634372 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun b!944557 () Bool)

(assert (=> b!944557 (= e!531159 (arrayContainsKey!0 (_keys!10544 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!114557 (not res!634371)) b!944556))

(assert (= (and b!944556 res!634372) b!944557))

(assert (=> d!114557 m!879007))

(declare-fun m!879073 () Bool)

(assert (=> b!944557 m!879073))

(assert (=> b!944400 d!114557))

(declare-fun d!114559 () Bool)

(declare-fun e!531162 () Bool)

(assert (=> d!114559 e!531162))

(declare-fun c!98557 () Bool)

(assert (=> d!114559 (= c!98557 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!425720 () Unit!31788)

(declare-fun choose!1571 (array!57049 array!57047 (_ BitVec 32) (_ BitVec 32) V!32319 V!32319 (_ BitVec 64) Int) Unit!31788)

(assert (=> d!114559 (= lt!425720 (choose!1571 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)))))

(assert (=> d!114559 (validMask!0 (mask!27315 thiss!1141))))

(assert (=> d!114559 (= (lemmaKeyInListMapIsInArray!288 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)) lt!425720)))

(declare-fun b!944562 () Bool)

(assert (=> b!944562 (= e!531162 (arrayContainsKey!0 (_keys!10544 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!944563 () Bool)

(assert (=> b!944563 (= e!531162 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114559 c!98557) b!944562))

(assert (= (and d!114559 (not c!98557)) b!944563))

(declare-fun m!879075 () Bool)

(assert (=> d!114559 m!879075))

(assert (=> d!114559 m!878993))

(assert (=> b!944562 m!878943))

(assert (=> b!944400 d!114559))

(declare-fun b!944570 () Bool)

(declare-fun e!531167 () Bool)

(assert (=> b!944570 (= e!531167 tp_is_empty!20515)))

(declare-fun condMapEmpty!32603 () Bool)

(declare-fun mapDefault!32603 () ValueCell!9776)

(assert (=> mapNonEmpty!32594 (= condMapEmpty!32603 (= mapRest!32594 ((as const (Array (_ BitVec 32) ValueCell!9776)) mapDefault!32603)))))

(declare-fun e!531168 () Bool)

(declare-fun mapRes!32603 () Bool)

(assert (=> mapNonEmpty!32594 (= tp!62527 (and e!531168 mapRes!32603))))

(declare-fun mapIsEmpty!32603 () Bool)

(assert (=> mapIsEmpty!32603 mapRes!32603))

(declare-fun b!944571 () Bool)

(assert (=> b!944571 (= e!531168 tp_is_empty!20515)))

(declare-fun mapNonEmpty!32603 () Bool)

(declare-fun tp!62543 () Bool)

(assert (=> mapNonEmpty!32603 (= mapRes!32603 (and tp!62543 e!531167))))

(declare-fun mapValue!32603 () ValueCell!9776)

(declare-fun mapRest!32603 () (Array (_ BitVec 32) ValueCell!9776))

(declare-fun mapKey!32603 () (_ BitVec 32))

(assert (=> mapNonEmpty!32603 (= mapRest!32594 (store mapRest!32603 mapKey!32603 mapValue!32603))))

(assert (= (and mapNonEmpty!32594 condMapEmpty!32603) mapIsEmpty!32603))

(assert (= (and mapNonEmpty!32594 (not condMapEmpty!32603)) mapNonEmpty!32603))

(assert (= (and mapNonEmpty!32603 ((_ is ValueCellFull!9776) mapValue!32603)) b!944570))

(assert (= (and mapNonEmpty!32594 ((_ is ValueCellFull!9776) mapDefault!32603)) b!944571))

(declare-fun m!879077 () Bool)

(assert (=> mapNonEmpty!32603 m!879077))

(declare-fun b_lambda!14295 () Bool)

(assert (= b_lambda!14293 (or (and b!944399 b_free!18007) b_lambda!14295)))

(check-sat (not b!944524) (not mapNonEmpty!32603) (not b!944523) (not b!944522) (not b_lambda!14295) (not bm!41022) tp_is_empty!20515 (not b!944538) (not b!944557) (not b!944463) (not b!944477) (not d!114559) (not b!944521) (not b!944537) (not b!944540) (not d!114547) (not b!944475) (not bm!41024) (not b!944525) (not bm!41027) (not b_next!18007) (not d!114551) (not d!114545) (not b!944551) (not b!944562) (not bm!41025) (not b!944549) (not d!114549) (not b!944550) b_and!29435)
(check-sat b_and!29435 (not b_next!18007))
(get-model)

(declare-fun bm!41031 () Bool)

(declare-fun call!41034 () (_ BitVec 32))

(assert (=> bm!41031 (= call!41034 (arrayCountValidKeys!0 (_keys!10544 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun b!944580 () Bool)

(declare-fun e!531173 () (_ BitVec 32))

(assert (=> b!944580 (= e!531173 #b00000000000000000000000000000000)))

(declare-fun b!944581 () Bool)

(declare-fun e!531174 () (_ BitVec 32))

(assert (=> b!944581 (= e!531174 call!41034)))

(declare-fun b!944582 () Bool)

(assert (=> b!944582 (= e!531173 e!531174)))

(declare-fun c!98562 () Bool)

(assert (=> b!944582 (= c!98562 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114561 () Bool)

(declare-fun lt!425723 () (_ BitVec 32))

(assert (=> d!114561 (and (bvsge lt!425723 #b00000000000000000000000000000000) (bvsle lt!425723 (bvsub (size!27912 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114561 (= lt!425723 e!531173)))

(declare-fun c!98563 () Bool)

(assert (=> d!114561 (= c!98563 (bvsge #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> d!114561 (and (bvsle #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!27912 (_keys!10544 thiss!1141)) (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> d!114561 (= (arrayCountValidKeys!0 (_keys!10544 thiss!1141) #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))) lt!425723)))

(declare-fun b!944583 () Bool)

(assert (=> b!944583 (= e!531174 (bvadd #b00000000000000000000000000000001 call!41034))))

(assert (= (and d!114561 c!98563) b!944580))

(assert (= (and d!114561 (not c!98563)) b!944582))

(assert (= (and b!944582 c!98562) b!944583))

(assert (= (and b!944582 (not c!98562)) b!944581))

(assert (= (or b!944583 b!944581) bm!41031))

(declare-fun m!879079 () Bool)

(assert (=> bm!41031 m!879079))

(assert (=> b!944582 m!879007))

(assert (=> b!944582 m!879007))

(assert (=> b!944582 m!879009))

(assert (=> b!944549 d!114561))

(declare-fun d!114563 () Bool)

(assert (=> d!114563 (= (validMask!0 (mask!27315 thiss!1141)) (and (or (= (mask!27315 thiss!1141) #b00000000000000000000000000000111) (= (mask!27315 thiss!1141) #b00000000000000000000000000001111) (= (mask!27315 thiss!1141) #b00000000000000000000000000011111) (= (mask!27315 thiss!1141) #b00000000000000000000000000111111) (= (mask!27315 thiss!1141) #b00000000000000000000000001111111) (= (mask!27315 thiss!1141) #b00000000000000000000000011111111) (= (mask!27315 thiss!1141) #b00000000000000000000000111111111) (= (mask!27315 thiss!1141) #b00000000000000000000001111111111) (= (mask!27315 thiss!1141) #b00000000000000000000011111111111) (= (mask!27315 thiss!1141) #b00000000000000000000111111111111) (= (mask!27315 thiss!1141) #b00000000000000000001111111111111) (= (mask!27315 thiss!1141) #b00000000000000000011111111111111) (= (mask!27315 thiss!1141) #b00000000000000000111111111111111) (= (mask!27315 thiss!1141) #b00000000000000001111111111111111) (= (mask!27315 thiss!1141) #b00000000000000011111111111111111) (= (mask!27315 thiss!1141) #b00000000000000111111111111111111) (= (mask!27315 thiss!1141) #b00000000000001111111111111111111) (= (mask!27315 thiss!1141) #b00000000000011111111111111111111) (= (mask!27315 thiss!1141) #b00000000000111111111111111111111) (= (mask!27315 thiss!1141) #b00000000001111111111111111111111) (= (mask!27315 thiss!1141) #b00000000011111111111111111111111) (= (mask!27315 thiss!1141) #b00000000111111111111111111111111) (= (mask!27315 thiss!1141) #b00000001111111111111111111111111) (= (mask!27315 thiss!1141) #b00000011111111111111111111111111) (= (mask!27315 thiss!1141) #b00000111111111111111111111111111) (= (mask!27315 thiss!1141) #b00001111111111111111111111111111) (= (mask!27315 thiss!1141) #b00011111111111111111111111111111) (= (mask!27315 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27315 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> d!114549 d!114563))

(declare-fun d!114565 () Bool)

(declare-fun res!634381 () Bool)

(declare-fun e!531177 () Bool)

(assert (=> d!114565 (=> (not res!634381) (not e!531177))))

(assert (=> d!114565 (= res!634381 (validMask!0 (mask!27315 thiss!1141)))))

(assert (=> d!114565 (= (simpleValid!348 thiss!1141) e!531177)))

(declare-fun b!944595 () Bool)

(assert (=> b!944595 (= e!531177 (and (bvsge (extraKeys!5374 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5374 thiss!1141) #b00000000000000000000000000000011) (bvsge (_vacant!2406 thiss!1141) #b00000000000000000000000000000000)))))

(declare-fun b!944594 () Bool)

(declare-fun res!634382 () Bool)

(assert (=> b!944594 (=> (not res!634382) (not e!531177))))

(declare-fun size!27917 (LongMapFixedSize!4702) (_ BitVec 32))

(assert (=> b!944594 (= res!634382 (= (size!27917 thiss!1141) (bvadd (_size!2406 thiss!1141) (bvsdiv (bvadd (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!944593 () Bool)

(declare-fun res!634383 () Bool)

(assert (=> b!944593 (=> (not res!634383) (not e!531177))))

(assert (=> b!944593 (= res!634383 (bvsge (size!27917 thiss!1141) (_size!2406 thiss!1141)))))

(declare-fun b!944592 () Bool)

(declare-fun res!634384 () Bool)

(assert (=> b!944592 (=> (not res!634384) (not e!531177))))

(assert (=> b!944592 (= res!634384 (and (= (size!27911 (_values!5665 thiss!1141)) (bvadd (mask!27315 thiss!1141) #b00000000000000000000000000000001)) (= (size!27912 (_keys!10544 thiss!1141)) (size!27911 (_values!5665 thiss!1141))) (bvsge (_size!2406 thiss!1141) #b00000000000000000000000000000000) (bvsle (_size!2406 thiss!1141) (bvadd (mask!27315 thiss!1141) #b00000000000000000000000000000001))))))

(assert (= (and d!114565 res!634381) b!944592))

(assert (= (and b!944592 res!634384) b!944593))

(assert (= (and b!944593 res!634383) b!944594))

(assert (= (and b!944594 res!634382) b!944595))

(assert (=> d!114565 m!878993))

(declare-fun m!879081 () Bool)

(assert (=> b!944594 m!879081))

(assert (=> b!944593 m!879081))

(assert (=> d!114551 d!114565))

(declare-fun d!114567 () Bool)

(declare-fun e!531179 () Bool)

(assert (=> d!114567 e!531179))

(declare-fun res!634385 () Bool)

(assert (=> d!114567 (=> res!634385 e!531179)))

(declare-fun lt!425726 () Bool)

(assert (=> d!114567 (= res!634385 (not lt!425726))))

(declare-fun lt!425727 () Bool)

(assert (=> d!114567 (= lt!425726 lt!425727)))

(declare-fun lt!425724 () Unit!31788)

(declare-fun e!531178 () Unit!31788)

(assert (=> d!114567 (= lt!425724 e!531178)))

(declare-fun c!98564 () Bool)

(assert (=> d!114567 (= c!98564 lt!425727)))

(assert (=> d!114567 (= lt!425727 (containsKey!454 (toList!6080 lt!425707) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114567 (= (contains!5161 lt!425707 #b1000000000000000000000000000000000000000000000000000000000000000) lt!425726)))

(declare-fun b!944596 () Bool)

(declare-fun lt!425725 () Unit!31788)

(assert (=> b!944596 (= e!531178 lt!425725)))

(assert (=> b!944596 (= lt!425725 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6080 lt!425707) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!944596 (isDefined!356 (getValueByKey!483 (toList!6080 lt!425707) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!944597 () Bool)

(declare-fun Unit!31794 () Unit!31788)

(assert (=> b!944597 (= e!531178 Unit!31794)))

(declare-fun b!944598 () Bool)

(assert (=> b!944598 (= e!531179 (isDefined!356 (getValueByKey!483 (toList!6080 lt!425707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114567 c!98564) b!944596))

(assert (= (and d!114567 (not c!98564)) b!944597))

(assert (= (and d!114567 (not res!634385)) b!944598))

(declare-fun m!879083 () Bool)

(assert (=> d!114567 m!879083))

(declare-fun m!879085 () Bool)

(assert (=> b!944596 m!879085))

(declare-fun m!879087 () Bool)

(assert (=> b!944596 m!879087))

(assert (=> b!944596 m!879087))

(declare-fun m!879089 () Bool)

(assert (=> b!944596 m!879089))

(assert (=> b!944598 m!879087))

(assert (=> b!944598 m!879087))

(assert (=> b!944598 m!879089))

(assert (=> bm!41025 d!114567))

(declare-fun b!944611 () Bool)

(declare-fun e!531186 () SeekEntryResult!9012)

(declare-fun e!531188 () SeekEntryResult!9012)

(assert (=> b!944611 (= e!531186 e!531188)))

(declare-fun c!98572 () Bool)

(declare-fun lt!425732 () (_ BitVec 64))

(assert (=> b!944611 (= c!98572 (= lt!425732 key!756))))

(declare-fun b!944612 () Bool)

(assert (=> b!944612 (= e!531186 Undefined!9012)))

(declare-fun lt!425733 () SeekEntryResult!9012)

(declare-fun d!114569 () Bool)

(assert (=> d!114569 (and (or ((_ is Undefined!9012) lt!425733) (not ((_ is Found!9012) lt!425733)) (and (bvsge (index!38420 lt!425733) #b00000000000000000000000000000000) (bvslt (index!38420 lt!425733) (size!27912 (_keys!10544 thiss!1141))))) (or ((_ is Undefined!9012) lt!425733) ((_ is Found!9012) lt!425733) (not ((_ is MissingVacant!9012) lt!425733)) (not (= (index!38422 lt!425733) (index!38421 lt!425637))) (and (bvsge (index!38422 lt!425733) #b00000000000000000000000000000000) (bvslt (index!38422 lt!425733) (size!27912 (_keys!10544 thiss!1141))))) (or ((_ is Undefined!9012) lt!425733) (ite ((_ is Found!9012) lt!425733) (= (select (arr!27446 (_keys!10544 thiss!1141)) (index!38420 lt!425733)) key!756) (and ((_ is MissingVacant!9012) lt!425733) (= (index!38422 lt!425733) (index!38421 lt!425637)) (= (select (arr!27446 (_keys!10544 thiss!1141)) (index!38422 lt!425733)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!114569 (= lt!425733 e!531186)))

(declare-fun c!98571 () Bool)

(assert (=> d!114569 (= c!98571 (bvsge (x!81003 lt!425637) #b01111111111111111111111111111110))))

(assert (=> d!114569 (= lt!425732 (select (arr!27446 (_keys!10544 thiss!1141)) (index!38421 lt!425637)))))

(assert (=> d!114569 (validMask!0 (mask!27315 thiss!1141))))

(assert (=> d!114569 (= (seekKeyOrZeroReturnVacant!0 (x!81003 lt!425637) (index!38421 lt!425637) (index!38421 lt!425637) key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)) lt!425733)))

(declare-fun b!944613 () Bool)

(declare-fun c!98573 () Bool)

(assert (=> b!944613 (= c!98573 (= lt!425732 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!531187 () SeekEntryResult!9012)

(assert (=> b!944613 (= e!531188 e!531187)))

(declare-fun b!944614 () Bool)

(assert (=> b!944614 (= e!531188 (Found!9012 (index!38421 lt!425637)))))

(declare-fun b!944615 () Bool)

(assert (=> b!944615 (= e!531187 (MissingVacant!9012 (index!38421 lt!425637)))))

(declare-fun b!944616 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944616 (= e!531187 (seekKeyOrZeroReturnVacant!0 (bvadd (x!81003 lt!425637) #b00000000000000000000000000000001) (nextIndex!0 (index!38421 lt!425637) (bvadd (x!81003 lt!425637) #b00000000000000000000000000000001) (mask!27315 thiss!1141)) (index!38421 lt!425637) key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)))))

(assert (= (and d!114569 c!98571) b!944612))

(assert (= (and d!114569 (not c!98571)) b!944611))

(assert (= (and b!944611 c!98572) b!944614))

(assert (= (and b!944611 (not c!98572)) b!944613))

(assert (= (and b!944613 c!98573) b!944615))

(assert (= (and b!944613 (not c!98573)) b!944616))

(declare-fun m!879091 () Bool)

(assert (=> d!114569 m!879091))

(declare-fun m!879093 () Bool)

(assert (=> d!114569 m!879093))

(assert (=> d!114569 m!878997))

(assert (=> d!114569 m!878993))

(declare-fun m!879095 () Bool)

(assert (=> b!944616 m!879095))

(assert (=> b!944616 m!879095))

(declare-fun m!879097 () Bool)

(assert (=> b!944616 m!879097))

(assert (=> b!944463 d!114569))

(declare-fun d!114571 () Bool)

(declare-fun get!14454 (Option!489) V!32319)

(assert (=> d!114571 (= (apply!875 lt!425707 #b1000000000000000000000000000000000000000000000000000000000000000) (get!14454 (getValueByKey!483 (toList!6080 lt!425707) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26533 () Bool)

(assert (= bs!26533 d!114571))

(assert (=> bs!26533 m!879087))

(assert (=> bs!26533 m!879087))

(declare-fun m!879099 () Bool)

(assert (=> bs!26533 m!879099))

(assert (=> b!944537 d!114571))

(declare-fun d!114573 () Bool)

(declare-fun res!634386 () Bool)

(declare-fun e!531189 () Bool)

(assert (=> d!114573 (=> res!634386 e!531189)))

(assert (=> d!114573 (= res!634386 (= (select (arr!27446 (_keys!10544 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!756))))

(assert (=> d!114573 (= (arrayContainsKey!0 (_keys!10544 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!531189)))

(declare-fun b!944617 () Bool)

(declare-fun e!531190 () Bool)

(assert (=> b!944617 (= e!531189 e!531190)))

(declare-fun res!634387 () Bool)

(assert (=> b!944617 (=> (not res!634387) (not e!531190))))

(assert (=> b!944617 (= res!634387 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun b!944618 () Bool)

(assert (=> b!944618 (= e!531190 (arrayContainsKey!0 (_keys!10544 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!114573 (not res!634386)) b!944617))

(assert (= (and b!944617 res!634387) b!944618))

(declare-fun m!879101 () Bool)

(assert (=> d!114573 m!879101))

(declare-fun m!879103 () Bool)

(assert (=> b!944618 m!879103))

(assert (=> b!944557 d!114573))

(declare-fun bm!41034 () Bool)

(declare-fun call!41037 () Bool)

(declare-fun c!98576 () Bool)

(assert (=> bm!41034 (= call!41037 (arrayNoDuplicates!0 (_keys!10544 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!98576 (Cons!19242 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000) Nil!19243) Nil!19243)))))

(declare-fun b!944629 () Bool)

(declare-fun e!531199 () Bool)

(declare-fun e!531202 () Bool)

(assert (=> b!944629 (= e!531199 e!531202)))

(declare-fun res!634395 () Bool)

(assert (=> b!944629 (=> (not res!634395) (not e!531202))))

(declare-fun e!531201 () Bool)

(assert (=> b!944629 (= res!634395 (not e!531201))))

(declare-fun res!634396 () Bool)

(assert (=> b!944629 (=> (not res!634396) (not e!531201))))

(assert (=> b!944629 (= res!634396 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944630 () Bool)

(declare-fun e!531200 () Bool)

(assert (=> b!944630 (= e!531200 call!41037)))

(declare-fun b!944631 () Bool)

(assert (=> b!944631 (= e!531200 call!41037)))

(declare-fun d!114575 () Bool)

(declare-fun res!634394 () Bool)

(assert (=> d!114575 (=> res!634394 e!531199)))

(assert (=> d!114575 (= res!634394 (bvsge #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> d!114575 (= (arrayNoDuplicates!0 (_keys!10544 thiss!1141) #b00000000000000000000000000000000 Nil!19243) e!531199)))

(declare-fun b!944632 () Bool)

(assert (=> b!944632 (= e!531202 e!531200)))

(assert (=> b!944632 (= c!98576 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944633 () Bool)

(declare-fun contains!5164 (List!19246 (_ BitVec 64)) Bool)

(assert (=> b!944633 (= e!531201 (contains!5164 Nil!19243 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (= (and d!114575 (not res!634394)) b!944629))

(assert (= (and b!944629 res!634396) b!944633))

(assert (= (and b!944629 res!634395) b!944632))

(assert (= (and b!944632 c!98576) b!944631))

(assert (= (and b!944632 (not c!98576)) b!944630))

(assert (= (or b!944631 b!944630) bm!41034))

(assert (=> bm!41034 m!879007))

(declare-fun m!879105 () Bool)

(assert (=> bm!41034 m!879105))

(assert (=> b!944629 m!879007))

(assert (=> b!944629 m!879007))

(assert (=> b!944629 m!879009))

(assert (=> b!944632 m!879007))

(assert (=> b!944632 m!879007))

(assert (=> b!944632 m!879009))

(assert (=> b!944633 m!879007))

(assert (=> b!944633 m!879007))

(declare-fun m!879107 () Bool)

(assert (=> b!944633 m!879107))

(assert (=> b!944551 d!114575))

(declare-fun b!944642 () Bool)

(declare-fun e!531210 () Bool)

(declare-fun call!41040 () Bool)

(assert (=> b!944642 (= e!531210 call!41040)))

(declare-fun b!944643 () Bool)

(declare-fun e!531211 () Bool)

(assert (=> b!944643 (= e!531211 call!41040)))

(declare-fun bm!41037 () Bool)

(assert (=> bm!41037 (= call!41040 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10544 thiss!1141) (mask!27315 thiss!1141)))))

(declare-fun b!944644 () Bool)

(declare-fun e!531209 () Bool)

(assert (=> b!944644 (= e!531209 e!531210)))

(declare-fun c!98579 () Bool)

(assert (=> b!944644 (= c!98579 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun d!114577 () Bool)

(declare-fun res!634402 () Bool)

(assert (=> d!114577 (=> res!634402 e!531209)))

(assert (=> d!114577 (= res!634402 (bvsge #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> d!114577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)) e!531209)))

(declare-fun b!944645 () Bool)

(assert (=> b!944645 (= e!531210 e!531211)))

(declare-fun lt!425741 () (_ BitVec 64))

(assert (=> b!944645 (= lt!425741 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!425740 () Unit!31788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57049 (_ BitVec 64) (_ BitVec 32)) Unit!31788)

(assert (=> b!944645 (= lt!425740 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10544 thiss!1141) lt!425741 #b00000000000000000000000000000000))))

(assert (=> b!944645 (arrayContainsKey!0 (_keys!10544 thiss!1141) lt!425741 #b00000000000000000000000000000000)))

(declare-fun lt!425742 () Unit!31788)

(assert (=> b!944645 (= lt!425742 lt!425740)))

(declare-fun res!634401 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57049 (_ BitVec 32)) SeekEntryResult!9012)

(assert (=> b!944645 (= res!634401 (= (seekEntryOrOpen!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000) (_keys!10544 thiss!1141) (mask!27315 thiss!1141)) (Found!9012 #b00000000000000000000000000000000)))))

(assert (=> b!944645 (=> (not res!634401) (not e!531211))))

(assert (= (and d!114577 (not res!634402)) b!944644))

(assert (= (and b!944644 c!98579) b!944645))

(assert (= (and b!944644 (not c!98579)) b!944642))

(assert (= (and b!944645 res!634401) b!944643))

(assert (= (or b!944643 b!944642) bm!41037))

(declare-fun m!879109 () Bool)

(assert (=> bm!41037 m!879109))

(assert (=> b!944644 m!879007))

(assert (=> b!944644 m!879007))

(assert (=> b!944644 m!879009))

(assert (=> b!944645 m!879007))

(declare-fun m!879111 () Bool)

(assert (=> b!944645 m!879111))

(declare-fun m!879113 () Bool)

(assert (=> b!944645 m!879113))

(assert (=> b!944645 m!879007))

(declare-fun m!879115 () Bool)

(assert (=> b!944645 m!879115))

(assert (=> b!944550 d!114577))

(declare-fun d!114579 () Bool)

(declare-fun e!531214 () Bool)

(assert (=> d!114579 e!531214))

(declare-fun res!634407 () Bool)

(assert (=> d!114579 (=> (not res!634407) (not e!531214))))

(declare-fun lt!425754 () ListLongMap!12129)

(assert (=> d!114579 (= res!634407 (contains!5161 lt!425754 (_1!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(declare-fun lt!425751 () List!19243)

(assert (=> d!114579 (= lt!425754 (ListLongMap!12130 lt!425751))))

(declare-fun lt!425752 () Unit!31788)

(declare-fun lt!425753 () Unit!31788)

(assert (=> d!114579 (= lt!425752 lt!425753)))

(assert (=> d!114579 (= (getValueByKey!483 lt!425751 (_1!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))) (Some!488 (_2!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!262 (List!19243 (_ BitVec 64) V!32319) Unit!31788)

(assert (=> d!114579 (= lt!425753 (lemmaContainsTupThenGetReturnValue!262 lt!425751 (_1!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (_2!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(declare-fun insertStrictlySorted!319 (List!19243 (_ BitVec 64) V!32319) List!19243)

(assert (=> d!114579 (= lt!425751 (insertStrictlySorted!319 (toList!6080 (ite c!98549 call!41029 (ite c!98554 call!41028 call!41031))) (_1!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (_2!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(assert (=> d!114579 (= (+!2861 (ite c!98549 call!41029 (ite c!98554 call!41028 call!41031)) (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) lt!425754)))

(declare-fun b!944650 () Bool)

(declare-fun res!634408 () Bool)

(assert (=> b!944650 (=> (not res!634408) (not e!531214))))

(assert (=> b!944650 (= res!634408 (= (getValueByKey!483 (toList!6080 lt!425754) (_1!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))) (Some!488 (_2!6726 (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))))

(declare-fun b!944651 () Bool)

(declare-fun contains!5165 (List!19243 tuple2!13430) Bool)

(assert (=> b!944651 (= e!531214 (contains!5165 (toList!6080 lt!425754) (ite (or c!98549 c!98554) (tuple2!13431 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5478 thiss!1141)) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (= (and d!114579 res!634407) b!944650))

(assert (= (and b!944650 res!634408) b!944651))

(declare-fun m!879117 () Bool)

(assert (=> d!114579 m!879117))

(declare-fun m!879119 () Bool)

(assert (=> d!114579 m!879119))

(declare-fun m!879121 () Bool)

(assert (=> d!114579 m!879121))

(declare-fun m!879123 () Bool)

(assert (=> d!114579 m!879123))

(declare-fun m!879125 () Bool)

(assert (=> b!944650 m!879125))

(declare-fun m!879127 () Bool)

(assert (=> b!944651 m!879127))

(assert (=> bm!41024 d!114579))

(declare-fun d!114581 () Bool)

(declare-fun res!634413 () Bool)

(declare-fun e!531219 () Bool)

(assert (=> d!114581 (=> res!634413 e!531219)))

(assert (=> d!114581 (= res!634413 (and ((_ is Cons!19239) (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (= (_1!6726 (h!20395 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)))))

(assert (=> d!114581 (= (containsKey!454 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756) e!531219)))

(declare-fun b!944656 () Bool)

(declare-fun e!531220 () Bool)

(assert (=> b!944656 (= e!531219 e!531220)))

(declare-fun res!634414 () Bool)

(assert (=> b!944656 (=> (not res!634414) (not e!531220))))

(assert (=> b!944656 (= res!634414 (and (or (not ((_ is Cons!19239) (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) (bvsle (_1!6726 (h!20395 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)) ((_ is Cons!19239) (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (bvslt (_1!6726 (h!20395 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)))))

(declare-fun b!944657 () Bool)

(assert (=> b!944657 (= e!531220 (containsKey!454 (t!27550 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) key!756))))

(assert (= (and d!114581 (not res!634413)) b!944656))

(assert (= (and b!944656 res!634414) b!944657))

(declare-fun m!879129 () Bool)

(assert (=> b!944657 m!879129))

(assert (=> d!114547 d!114581))

(assert (=> b!944562 d!114557))

(declare-fun d!114583 () Bool)

(assert (=> d!114583 (isDefined!356 (getValueByKey!483 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-fun lt!425757 () Unit!31788)

(declare-fun choose!1572 (List!19243 (_ BitVec 64)) Unit!31788)

(assert (=> d!114583 (= lt!425757 (choose!1572 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(declare-fun e!531223 () Bool)

(assert (=> d!114583 e!531223))

(declare-fun res!634417 () Bool)

(assert (=> d!114583 (=> (not res!634417) (not e!531223))))

(declare-fun isStrictlySorted!493 (List!19243) Bool)

(assert (=> d!114583 (= res!634417 (isStrictlySorted!493 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))))

(assert (=> d!114583 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756) lt!425757)))

(declare-fun b!944660 () Bool)

(assert (=> b!944660 (= e!531223 (containsKey!454 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))

(assert (= (and d!114583 res!634417) b!944660))

(assert (=> d!114583 m!879003))

(assert (=> d!114583 m!879003))

(assert (=> d!114583 m!879005))

(declare-fun m!879131 () Bool)

(assert (=> d!114583 m!879131))

(declare-fun m!879133 () Bool)

(assert (=> d!114583 m!879133))

(assert (=> b!944660 m!878999))

(assert (=> b!944475 d!114583))

(declare-fun d!114585 () Bool)

(declare-fun isEmpty!706 (Option!489) Bool)

(assert (=> d!114585 (= (isDefined!356 (getValueByKey!483 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756)) (not (isEmpty!706 (getValueByKey!483 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756))))))

(declare-fun bs!26534 () Bool)

(assert (= bs!26534 d!114585))

(assert (=> bs!26534 m!879003))

(declare-fun m!879135 () Bool)

(assert (=> bs!26534 m!879135))

(assert (=> b!944475 d!114585))

(declare-fun b!944671 () Bool)

(declare-fun e!531229 () Option!489)

(assert (=> b!944671 (= e!531229 (getValueByKey!483 (t!27550 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) key!756))))

(declare-fun d!114587 () Bool)

(declare-fun c!98584 () Bool)

(assert (=> d!114587 (= c!98584 (and ((_ is Cons!19239) (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (= (_1!6726 (h!20395 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756)))))

(declare-fun e!531228 () Option!489)

(assert (=> d!114587 (= (getValueByKey!483 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))) key!756) e!531228)))

(declare-fun b!944669 () Bool)

(assert (=> b!944669 (= e!531228 (Some!488 (_2!6726 (h!20395 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))))))))

(declare-fun b!944670 () Bool)

(assert (=> b!944670 (= e!531228 e!531229)))

(declare-fun c!98585 () Bool)

(assert (=> b!944670 (= c!98585 (and ((_ is Cons!19239) (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)))) (not (= (_1!6726 (h!20395 (toList!6080 (getCurrentListMap!3314 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141))))) key!756))))))

(declare-fun b!944672 () Bool)

(assert (=> b!944672 (= e!531229 None!487)))

(assert (= (and d!114587 c!98584) b!944669))

(assert (= (and d!114587 (not c!98584)) b!944670))

(assert (= (and b!944670 c!98585) b!944671))

(assert (= (and b!944670 (not c!98585)) b!944672))

(declare-fun m!879137 () Bool)

(assert (=> b!944671 m!879137))

(assert (=> b!944475 d!114587))

(declare-fun d!114589 () Bool)

(declare-fun e!531230 () Bool)

(assert (=> d!114589 e!531230))

(declare-fun res!634418 () Bool)

(assert (=> d!114589 (=> (not res!634418) (not e!531230))))

(declare-fun lt!425761 () ListLongMap!12129)

(assert (=> d!114589 (= res!634418 (contains!5161 lt!425761 (_1!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(declare-fun lt!425758 () List!19243)

(assert (=> d!114589 (= lt!425761 (ListLongMap!12130 lt!425758))))

(declare-fun lt!425759 () Unit!31788)

(declare-fun lt!425760 () Unit!31788)

(assert (=> d!114589 (= lt!425759 lt!425760)))

(assert (=> d!114589 (= (getValueByKey!483 lt!425758 (_1!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (=> d!114589 (= lt!425760 (lemmaContainsTupThenGetReturnValue!262 lt!425758 (_1!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (=> d!114589 (= lt!425758 (insertStrictlySorted!319 (toList!6080 call!41026) (_1!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))))))

(assert (=> d!114589 (= (+!2861 call!41026 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))) lt!425761)))

(declare-fun b!944673 () Bool)

(declare-fun res!634419 () Bool)

(assert (=> b!944673 (=> (not res!634419) (not e!531230))))

(assert (=> b!944673 (= res!634419 (= (getValueByKey!483 (toList!6080 lt!425761) (_1!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))))

(declare-fun b!944674 () Bool)

(assert (=> b!944674 (= e!531230 (contains!5165 (toList!6080 lt!425761) (tuple2!13431 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5478 thiss!1141))))))

(assert (= (and d!114589 res!634418) b!944673))

(assert (= (and b!944673 res!634419) b!944674))

(declare-fun m!879139 () Bool)

(assert (=> d!114589 m!879139))

(declare-fun m!879141 () Bool)

(assert (=> d!114589 m!879141))

(declare-fun m!879143 () Bool)

(assert (=> d!114589 m!879143))

(declare-fun m!879145 () Bool)

(assert (=> d!114589 m!879145))

(declare-fun m!879147 () Bool)

(assert (=> b!944673 m!879147))

(declare-fun m!879149 () Bool)

(assert (=> b!944674 m!879149))

(assert (=> b!944540 d!114589))

(declare-fun b!944693 () Bool)

(declare-fun lt!425767 () SeekEntryResult!9012)

(assert (=> b!944693 (and (bvsge (index!38421 lt!425767) #b00000000000000000000000000000000) (bvslt (index!38421 lt!425767) (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun res!634426 () Bool)

(assert (=> b!944693 (= res!634426 (= (select (arr!27446 (_keys!10544 thiss!1141)) (index!38421 lt!425767)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!531244 () Bool)

(assert (=> b!944693 (=> res!634426 e!531244)))

(declare-fun b!944694 () Bool)

(declare-fun e!531241 () SeekEntryResult!9012)

(assert (=> b!944694 (= e!531241 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!756 (mask!27315 thiss!1141)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!27315 thiss!1141)) key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)))))

(declare-fun b!944695 () Bool)

(declare-fun e!531245 () SeekEntryResult!9012)

(assert (=> b!944695 (= e!531245 (Intermediate!9012 true (toIndex!0 key!756 (mask!27315 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!944696 () Bool)

(assert (=> b!944696 (and (bvsge (index!38421 lt!425767) #b00000000000000000000000000000000) (bvslt (index!38421 lt!425767) (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun res!634427 () Bool)

(assert (=> b!944696 (= res!634427 (= (select (arr!27446 (_keys!10544 thiss!1141)) (index!38421 lt!425767)) key!756))))

(assert (=> b!944696 (=> res!634427 e!531244)))

(declare-fun e!531243 () Bool)

(assert (=> b!944696 (= e!531243 e!531244)))

(declare-fun b!944697 () Bool)

(declare-fun e!531242 () Bool)

(assert (=> b!944697 (= e!531242 (bvsge (x!81003 lt!425767) #b01111111111111111111111111111110))))

(declare-fun b!944698 () Bool)

(assert (=> b!944698 (= e!531242 e!531243)))

(declare-fun res!634428 () Bool)

(assert (=> b!944698 (= res!634428 (and ((_ is Intermediate!9012) lt!425767) (not (undefined!9824 lt!425767)) (bvslt (x!81003 lt!425767) #b01111111111111111111111111111110) (bvsge (x!81003 lt!425767) #b00000000000000000000000000000000) (bvsge (x!81003 lt!425767) #b00000000000000000000000000000000)))))

(assert (=> b!944698 (=> (not res!634428) (not e!531243))))

(declare-fun d!114591 () Bool)

(assert (=> d!114591 e!531242))

(declare-fun c!98593 () Bool)

(assert (=> d!114591 (= c!98593 (and ((_ is Intermediate!9012) lt!425767) (undefined!9824 lt!425767)))))

(assert (=> d!114591 (= lt!425767 e!531245)))

(declare-fun c!98592 () Bool)

(assert (=> d!114591 (= c!98592 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!425766 () (_ BitVec 64))

(assert (=> d!114591 (= lt!425766 (select (arr!27446 (_keys!10544 thiss!1141)) (toIndex!0 key!756 (mask!27315 thiss!1141))))))

(assert (=> d!114591 (validMask!0 (mask!27315 thiss!1141))))

(assert (=> d!114591 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27315 thiss!1141)) key!756 (_keys!10544 thiss!1141) (mask!27315 thiss!1141)) lt!425767)))

(declare-fun b!944699 () Bool)

(assert (=> b!944699 (= e!531241 (Intermediate!9012 false (toIndex!0 key!756 (mask!27315 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun b!944700 () Bool)

(assert (=> b!944700 (= e!531245 e!531241)))

(declare-fun c!98594 () Bool)

(assert (=> b!944700 (= c!98594 (or (= lt!425766 key!756) (= (bvadd lt!425766 lt!425766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!944701 () Bool)

(assert (=> b!944701 (and (bvsge (index!38421 lt!425767) #b00000000000000000000000000000000) (bvslt (index!38421 lt!425767) (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> b!944701 (= e!531244 (= (select (arr!27446 (_keys!10544 thiss!1141)) (index!38421 lt!425767)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!114591 c!98592) b!944695))

(assert (= (and d!114591 (not c!98592)) b!944700))

(assert (= (and b!944700 c!98594) b!944699))

(assert (= (and b!944700 (not c!98594)) b!944694))

(assert (= (and d!114591 c!98593) b!944697))

(assert (= (and d!114591 (not c!98593)) b!944698))

(assert (= (and b!944698 res!634428) b!944696))

(assert (= (and b!944696 (not res!634427)) b!944693))

(assert (= (and b!944693 (not res!634426)) b!944701))

(declare-fun m!879151 () Bool)

(assert (=> b!944693 m!879151))

(assert (=> d!114591 m!878989))

(declare-fun m!879153 () Bool)

(assert (=> d!114591 m!879153))

(assert (=> d!114591 m!878993))

(assert (=> b!944696 m!879151))

(assert (=> b!944701 m!879151))

(assert (=> b!944694 m!878989))

(declare-fun m!879155 () Bool)

(assert (=> b!944694 m!879155))

(assert (=> b!944694 m!879155))

(declare-fun m!879157 () Bool)

(assert (=> b!944694 m!879157))

(assert (=> d!114545 d!114591))

(declare-fun d!114593 () Bool)

(declare-fun lt!425773 () (_ BitVec 32))

(declare-fun lt!425772 () (_ BitVec 32))

(assert (=> d!114593 (= lt!425773 (bvmul (bvxor lt!425772 (bvlshr lt!425772 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!114593 (= lt!425772 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!114593 (and (bvsge (mask!27315 thiss!1141) #b00000000000000000000000000000000) (let ((res!634429 (let ((h!20399 ((_ extract 31 0) (bvand (bvxor key!756 (bvlshr key!756 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!81022 (bvmul (bvxor h!20399 (bvlshr h!20399 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!81022 (bvlshr x!81022 #b00000000000000000000000000001101)) (mask!27315 thiss!1141)))))) (and (bvslt res!634429 (bvadd (mask!27315 thiss!1141) #b00000000000000000000000000000001)) (bvsge res!634429 #b00000000000000000000000000000000))))))

(assert (=> d!114593 (= (toIndex!0 key!756 (mask!27315 thiss!1141)) (bvand (bvxor lt!425773 (bvlshr lt!425773 #b00000000000000000000000000001101)) (mask!27315 thiss!1141)))))

(assert (=> d!114545 d!114593))

(assert (=> d!114545 d!114563))

(declare-fun d!114595 () Bool)

(declare-fun e!531247 () Bool)

(assert (=> d!114595 e!531247))

(declare-fun res!634430 () Bool)

(assert (=> d!114595 (=> res!634430 e!531247)))

(declare-fun lt!425776 () Bool)

(assert (=> d!114595 (= res!634430 (not lt!425776))))

(declare-fun lt!425777 () Bool)

(assert (=> d!114595 (= lt!425776 lt!425777)))

(declare-fun lt!425774 () Unit!31788)

(declare-fun e!531246 () Unit!31788)

(assert (=> d!114595 (= lt!425774 e!531246)))

(declare-fun c!98595 () Bool)

(assert (=> d!114595 (= c!98595 lt!425777)))

(assert (=> d!114595 (= lt!425777 (containsKey!454 (toList!6080 lt!425707) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!114595 (= (contains!5161 lt!425707 #b0000000000000000000000000000000000000000000000000000000000000000) lt!425776)))

(declare-fun b!944702 () Bool)

(declare-fun lt!425775 () Unit!31788)

(assert (=> b!944702 (= e!531246 lt!425775)))

(assert (=> b!944702 (= lt!425775 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6080 lt!425707) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!944702 (isDefined!356 (getValueByKey!483 (toList!6080 lt!425707) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!944703 () Bool)

(declare-fun Unit!31795 () Unit!31788)

(assert (=> b!944703 (= e!531246 Unit!31795)))

(declare-fun b!944704 () Bool)

(assert (=> b!944704 (= e!531247 (isDefined!356 (getValueByKey!483 (toList!6080 lt!425707) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114595 c!98595) b!944702))

(assert (= (and d!114595 (not c!98595)) b!944703))

(assert (= (and d!114595 (not res!634430)) b!944704))

(declare-fun m!879159 () Bool)

(assert (=> d!114595 m!879159))

(declare-fun m!879161 () Bool)

(assert (=> b!944702 m!879161))

(declare-fun m!879163 () Bool)

(assert (=> b!944702 m!879163))

(assert (=> b!944702 m!879163))

(declare-fun m!879165 () Bool)

(assert (=> b!944702 m!879165))

(assert (=> b!944704 m!879163))

(assert (=> b!944704 m!879163))

(assert (=> b!944704 m!879165))

(assert (=> bm!41022 d!114595))

(assert (=> b!944477 d!114585))

(assert (=> b!944477 d!114587))

(declare-fun d!114597 () Bool)

(declare-fun e!531248 () Bool)

(assert (=> d!114597 e!531248))

(declare-fun res!634431 () Bool)

(assert (=> d!114597 (=> (not res!634431) (not e!531248))))

(declare-fun lt!425781 () ListLongMap!12129)

(assert (=> d!114597 (= res!634431 (contains!5161 lt!425781 (_1!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141)))))))

(declare-fun lt!425778 () List!19243)

(assert (=> d!114597 (= lt!425781 (ListLongMap!12130 lt!425778))))

(declare-fun lt!425779 () Unit!31788)

(declare-fun lt!425780 () Unit!31788)

(assert (=> d!114597 (= lt!425779 lt!425780)))

(assert (=> d!114597 (= (getValueByKey!483 lt!425778 (_1!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141)))))))

(assert (=> d!114597 (= lt!425780 (lemmaContainsTupThenGetReturnValue!262 lt!425778 (_1!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141)))))))

(assert (=> d!114597 (= lt!425778 (insertStrictlySorted!319 (toList!6080 lt!425716) (_1!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141)))))))

(assert (=> d!114597 (= (+!2861 lt!425716 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))) lt!425781)))

(declare-fun b!944705 () Bool)

(declare-fun res!634432 () Bool)

(assert (=> b!944705 (=> (not res!634432) (not e!531248))))

(assert (=> b!944705 (= res!634432 (= (getValueByKey!483 (toList!6080 lt!425781) (_1!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))))))))

(declare-fun b!944706 () Bool)

(assert (=> b!944706 (= e!531248 (contains!5165 (toList!6080 lt!425781) (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))))))

(assert (= (and d!114597 res!634431) b!944705))

(assert (= (and b!944705 res!634432) b!944706))

(declare-fun m!879167 () Bool)

(assert (=> d!114597 m!879167))

(declare-fun m!879169 () Bool)

(assert (=> d!114597 m!879169))

(declare-fun m!879171 () Bool)

(assert (=> d!114597 m!879171))

(declare-fun m!879173 () Bool)

(assert (=> d!114597 m!879173))

(declare-fun m!879175 () Bool)

(assert (=> b!944705 m!879175))

(declare-fun m!879177 () Bool)

(assert (=> b!944706 m!879177))

(assert (=> b!944522 d!114597))

(declare-fun d!114599 () Bool)

(assert (=> d!114599 (= (apply!875 lt!425699 lt!425709) (get!14454 (getValueByKey!483 (toList!6080 lt!425699) lt!425709)))))

(declare-fun bs!26535 () Bool)

(assert (= bs!26535 d!114599))

(declare-fun m!879179 () Bool)

(assert (=> bs!26535 m!879179))

(assert (=> bs!26535 m!879179))

(declare-fun m!879181 () Bool)

(assert (=> bs!26535 m!879181))

(assert (=> b!944522 d!114599))

(declare-fun d!114601 () Bool)

(assert (=> d!114601 (= (apply!875 (+!2861 lt!425714 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))) lt!425698) (get!14454 (getValueByKey!483 (toList!6080 (+!2861 lt!425714 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141)))) lt!425698)))))

(declare-fun bs!26536 () Bool)

(assert (= bs!26536 d!114601))

(declare-fun m!879183 () Bool)

(assert (=> bs!26536 m!879183))

(assert (=> bs!26536 m!879183))

(declare-fun m!879185 () Bool)

(assert (=> bs!26536 m!879185))

(assert (=> b!944522 d!114601))

(declare-fun d!114603 () Bool)

(declare-fun e!531249 () Bool)

(assert (=> d!114603 e!531249))

(declare-fun res!634433 () Bool)

(assert (=> d!114603 (=> (not res!634433) (not e!531249))))

(declare-fun lt!425785 () ListLongMap!12129)

(assert (=> d!114603 (= res!634433 (contains!5161 lt!425785 (_1!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141)))))))

(declare-fun lt!425782 () List!19243)

(assert (=> d!114603 (= lt!425785 (ListLongMap!12130 lt!425782))))

(declare-fun lt!425783 () Unit!31788)

(declare-fun lt!425784 () Unit!31788)

(assert (=> d!114603 (= lt!425783 lt!425784)))

(assert (=> d!114603 (= (getValueByKey!483 lt!425782 (_1!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141)))))))

(assert (=> d!114603 (= lt!425784 (lemmaContainsTupThenGetReturnValue!262 lt!425782 (_1!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141)))))))

(assert (=> d!114603 (= lt!425782 (insertStrictlySorted!319 (toList!6080 lt!425699) (_1!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141)))))))

(assert (=> d!114603 (= (+!2861 lt!425699 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))) lt!425785)))

(declare-fun b!944707 () Bool)

(declare-fun res!634434 () Bool)

(assert (=> b!944707 (=> (not res!634434) (not e!531249))))

(assert (=> b!944707 (= res!634434 (= (getValueByKey!483 (toList!6080 lt!425785) (_1!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))))))))

(declare-fun b!944708 () Bool)

(assert (=> b!944708 (= e!531249 (contains!5165 (toList!6080 lt!425785) (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))))))

(assert (= (and d!114603 res!634433) b!944707))

(assert (= (and b!944707 res!634434) b!944708))

(declare-fun m!879187 () Bool)

(assert (=> d!114603 m!879187))

(declare-fun m!879189 () Bool)

(assert (=> d!114603 m!879189))

(declare-fun m!879191 () Bool)

(assert (=> d!114603 m!879191))

(declare-fun m!879193 () Bool)

(assert (=> d!114603 m!879193))

(declare-fun m!879195 () Bool)

(assert (=> b!944707 m!879195))

(declare-fun m!879197 () Bool)

(assert (=> b!944708 m!879197))

(assert (=> b!944522 d!114603))

(declare-fun d!114605 () Bool)

(assert (=> d!114605 (= (apply!875 lt!425714 lt!425698) (get!14454 (getValueByKey!483 (toList!6080 lt!425714) lt!425698)))))

(declare-fun bs!26537 () Bool)

(assert (= bs!26537 d!114605))

(declare-fun m!879199 () Bool)

(assert (=> bs!26537 m!879199))

(assert (=> bs!26537 m!879199))

(declare-fun m!879201 () Bool)

(assert (=> bs!26537 m!879201))

(assert (=> b!944522 d!114605))

(declare-fun d!114607 () Bool)

(assert (=> d!114607 (= (apply!875 (+!2861 lt!425716 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))) lt!425705) (get!14454 (getValueByKey!483 (toList!6080 (+!2861 lt!425716 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141)))) lt!425705)))))

(declare-fun bs!26538 () Bool)

(assert (= bs!26538 d!114607))

(declare-fun m!879203 () Bool)

(assert (=> bs!26538 m!879203))

(assert (=> bs!26538 m!879203))

(declare-fun m!879205 () Bool)

(assert (=> bs!26538 m!879205))

(assert (=> b!944522 d!114607))

(declare-fun d!114609 () Bool)

(assert (=> d!114609 (= (apply!875 (+!2861 lt!425716 (tuple2!13431 lt!425717 (minValue!5478 thiss!1141))) lt!425705) (apply!875 lt!425716 lt!425705))))

(declare-fun lt!425788 () Unit!31788)

(declare-fun choose!1573 (ListLongMap!12129 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31788)

(assert (=> d!114609 (= lt!425788 (choose!1573 lt!425716 lt!425717 (minValue!5478 thiss!1141) lt!425705))))

(declare-fun e!531252 () Bool)

(assert (=> d!114609 e!531252))

(declare-fun res!634437 () Bool)

(assert (=> d!114609 (=> (not res!634437) (not e!531252))))

(assert (=> d!114609 (= res!634437 (contains!5161 lt!425716 lt!425705))))

(assert (=> d!114609 (= (addApplyDifferent!445 lt!425716 lt!425717 (minValue!5478 thiss!1141) lt!425705) lt!425788)))

(declare-fun b!944712 () Bool)

(assert (=> b!944712 (= e!531252 (not (= lt!425705 lt!425717)))))

(assert (= (and d!114609 res!634437) b!944712))

(assert (=> d!114609 m!879041))

(assert (=> d!114609 m!879029))

(assert (=> d!114609 m!879055))

(declare-fun m!879207 () Bool)

(assert (=> d!114609 m!879207))

(assert (=> d!114609 m!879029))

(declare-fun m!879209 () Bool)

(assert (=> d!114609 m!879209))

(assert (=> b!944522 d!114609))

(declare-fun d!114611 () Bool)

(assert (=> d!114611 (= (apply!875 lt!425716 lt!425705) (get!14454 (getValueByKey!483 (toList!6080 lt!425716) lt!425705)))))

(declare-fun bs!26539 () Bool)

(assert (= bs!26539 d!114611))

(declare-fun m!879211 () Bool)

(assert (=> bs!26539 m!879211))

(assert (=> bs!26539 m!879211))

(declare-fun m!879213 () Bool)

(assert (=> bs!26539 m!879213))

(assert (=> b!944522 d!114611))

(declare-fun d!114613 () Bool)

(declare-fun e!531269 () Bool)

(assert (=> d!114613 e!531269))

(declare-fun res!634446 () Bool)

(assert (=> d!114613 (=> (not res!634446) (not e!531269))))

(declare-fun lt!425804 () ListLongMap!12129)

(assert (=> d!114613 (= res!634446 (not (contains!5161 lt!425804 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!531271 () ListLongMap!12129)

(assert (=> d!114613 (= lt!425804 e!531271)))

(declare-fun c!98607 () Bool)

(assert (=> d!114613 (= c!98607 (bvsge #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> d!114613 (validMask!0 (mask!27315 thiss!1141))))

(assert (=> d!114613 (= (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5642 thiss!1141)) lt!425804)))

(declare-fun bm!41040 () Bool)

(declare-fun call!41043 () ListLongMap!12129)

(assert (=> bm!41040 (= call!41043 (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5642 thiss!1141)))))

(declare-fun b!944737 () Bool)

(declare-fun res!634447 () Bool)

(assert (=> b!944737 (=> (not res!634447) (not e!531269))))

(assert (=> b!944737 (= res!634447 (not (contains!5161 lt!425804 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!944738 () Bool)

(declare-fun e!531268 () Bool)

(declare-fun e!531267 () Bool)

(assert (=> b!944738 (= e!531268 e!531267)))

(declare-fun c!98605 () Bool)

(assert (=> b!944738 (= c!98605 (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun b!944739 () Bool)

(assert (=> b!944739 (= e!531267 (= lt!425804 (getCurrentListMapNoExtraKeys!3349 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5642 thiss!1141))))))

(declare-fun b!944740 () Bool)

(assert (=> b!944740 (= e!531271 (ListLongMap!12130 Nil!19240))))

(declare-fun b!944741 () Bool)

(declare-fun lt!425807 () Unit!31788)

(declare-fun lt!425803 () Unit!31788)

(assert (=> b!944741 (= lt!425807 lt!425803)))

(declare-fun lt!425806 () ListLongMap!12129)

(declare-fun lt!425809 () (_ BitVec 64))

(declare-fun lt!425808 () V!32319)

(declare-fun lt!425805 () (_ BitVec 64))

(assert (=> b!944741 (not (contains!5161 (+!2861 lt!425806 (tuple2!13431 lt!425809 lt!425808)) lt!425805))))

(declare-fun addStillNotContains!224 (ListLongMap!12129 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31788)

(assert (=> b!944741 (= lt!425803 (addStillNotContains!224 lt!425806 lt!425809 lt!425808 lt!425805))))

(assert (=> b!944741 (= lt!425805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!944741 (= lt!425808 (get!14453 (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!944741 (= lt!425809 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!944741 (= lt!425806 call!41043)))

(declare-fun e!531270 () ListLongMap!12129)

(assert (=> b!944741 (= e!531270 (+!2861 call!41043 (tuple2!13431 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000) (get!14453 (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!944742 () Bool)

(declare-fun e!531273 () Bool)

(assert (=> b!944742 (= e!531273 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!944742 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!944743 () Bool)

(assert (=> b!944743 (= e!531271 e!531270)))

(declare-fun c!98606 () Bool)

(assert (=> b!944743 (= c!98606 (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944744 () Bool)

(declare-fun e!531272 () Bool)

(assert (=> b!944744 (= e!531268 e!531272)))

(assert (=> b!944744 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun res!634448 () Bool)

(assert (=> b!944744 (= res!634448 (contains!5161 lt!425804 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!944744 (=> (not res!634448) (not e!531272))))

(declare-fun b!944745 () Bool)

(declare-fun isEmpty!707 (ListLongMap!12129) Bool)

(assert (=> b!944745 (= e!531267 (isEmpty!707 lt!425804))))

(declare-fun b!944746 () Bool)

(assert (=> b!944746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(assert (=> b!944746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!27911 (_values!5665 thiss!1141))))))

(assert (=> b!944746 (= e!531272 (= (apply!875 lt!425804 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)) (get!14453 (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!944747 () Bool)

(assert (=> b!944747 (= e!531269 e!531268)))

(declare-fun c!98604 () Bool)

(assert (=> b!944747 (= c!98604 e!531273)))

(declare-fun res!634449 () Bool)

(assert (=> b!944747 (=> (not res!634449) (not e!531273))))

(assert (=> b!944747 (= res!634449 (bvslt #b00000000000000000000000000000000 (size!27912 (_keys!10544 thiss!1141))))))

(declare-fun b!944748 () Bool)

(assert (=> b!944748 (= e!531270 call!41043)))

(assert (= (and d!114613 c!98607) b!944740))

(assert (= (and d!114613 (not c!98607)) b!944743))

(assert (= (and b!944743 c!98606) b!944741))

(assert (= (and b!944743 (not c!98606)) b!944748))

(assert (= (or b!944741 b!944748) bm!41040))

(assert (= (and d!114613 res!634446) b!944737))

(assert (= (and b!944737 res!634447) b!944747))

(assert (= (and b!944747 res!634449) b!944742))

(assert (= (and b!944747 c!98604) b!944744))

(assert (= (and b!944747 (not c!98604)) b!944738))

(assert (= (and b!944744 res!634448) b!944746))

(assert (= (and b!944738 c!98605) b!944739))

(assert (= (and b!944738 (not c!98605)) b!944745))

(declare-fun b_lambda!14297 () Bool)

(assert (=> (not b_lambda!14297) (not b!944741)))

(assert (=> b!944741 t!27554))

(declare-fun b_and!29437 () Bool)

(assert (= b_and!29435 (and (=> t!27554 result!12187) b_and!29437)))

(declare-fun b_lambda!14299 () Bool)

(assert (=> (not b_lambda!14299) (not b!944746)))

(assert (=> b!944746 t!27554))

(declare-fun b_and!29439 () Bool)

(assert (= b_and!29437 (and (=> t!27554 result!12187) b_and!29439)))

(declare-fun m!879215 () Bool)

(assert (=> bm!41040 m!879215))

(assert (=> b!944742 m!879007))

(assert (=> b!944742 m!879007))

(assert (=> b!944742 m!879009))

(declare-fun m!879217 () Bool)

(assert (=> d!114613 m!879217))

(assert (=> d!114613 m!878993))

(declare-fun m!879219 () Bool)

(assert (=> b!944741 m!879219))

(declare-fun m!879221 () Bool)

(assert (=> b!944741 m!879221))

(assert (=> b!944741 m!879013))

(declare-fun m!879223 () Bool)

(assert (=> b!944741 m!879223))

(assert (=> b!944741 m!879015))

(assert (=> b!944741 m!879223))

(declare-fun m!879225 () Bool)

(assert (=> b!944741 m!879225))

(assert (=> b!944741 m!879013))

(assert (=> b!944741 m!879015))

(assert (=> b!944741 m!879017))

(assert (=> b!944741 m!879007))

(declare-fun m!879227 () Bool)

(assert (=> b!944737 m!879227))

(assert (=> b!944746 m!879013))

(assert (=> b!944746 m!879007))

(declare-fun m!879229 () Bool)

(assert (=> b!944746 m!879229))

(assert (=> b!944746 m!879015))

(assert (=> b!944746 m!879013))

(assert (=> b!944746 m!879015))

(assert (=> b!944746 m!879017))

(assert (=> b!944746 m!879007))

(assert (=> b!944739 m!879215))

(assert (=> b!944743 m!879007))

(assert (=> b!944743 m!879007))

(assert (=> b!944743 m!879009))

(assert (=> b!944744 m!879007))

(assert (=> b!944744 m!879007))

(declare-fun m!879231 () Bool)

(assert (=> b!944744 m!879231))

(declare-fun m!879233 () Bool)

(assert (=> b!944745 m!879233))

(assert (=> b!944522 d!114613))

(declare-fun d!114615 () Bool)

(declare-fun e!531274 () Bool)

(assert (=> d!114615 e!531274))

(declare-fun res!634450 () Bool)

(assert (=> d!114615 (=> (not res!634450) (not e!531274))))

(declare-fun lt!425813 () ListLongMap!12129)

(assert (=> d!114615 (= res!634450 (contains!5161 lt!425813 (_1!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))))))

(declare-fun lt!425810 () List!19243)

(assert (=> d!114615 (= lt!425813 (ListLongMap!12130 lt!425810))))

(declare-fun lt!425811 () Unit!31788)

(declare-fun lt!425812 () Unit!31788)

(assert (=> d!114615 (= lt!425811 lt!425812)))

(assert (=> d!114615 (= (getValueByKey!483 lt!425810 (_1!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114615 (= lt!425812 (lemmaContainsTupThenGetReturnValue!262 lt!425810 (_1!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114615 (= lt!425810 (insertStrictlySorted!319 (toList!6080 lt!425715) (_1!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114615 (= (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))) lt!425813)))

(declare-fun b!944749 () Bool)

(declare-fun res!634451 () Bool)

(assert (=> b!944749 (=> (not res!634451) (not e!531274))))

(assert (=> b!944749 (= res!634451 (= (getValueByKey!483 (toList!6080 lt!425813) (_1!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))))))))

(declare-fun b!944750 () Bool)

(assert (=> b!944750 (= e!531274 (contains!5165 (toList!6080 lt!425813) (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))))))

(assert (= (and d!114615 res!634450) b!944749))

(assert (= (and b!944749 res!634451) b!944750))

(declare-fun m!879235 () Bool)

(assert (=> d!114615 m!879235))

(declare-fun m!879237 () Bool)

(assert (=> d!114615 m!879237))

(declare-fun m!879239 () Bool)

(assert (=> d!114615 m!879239))

(declare-fun m!879241 () Bool)

(assert (=> d!114615 m!879241))

(declare-fun m!879243 () Bool)

(assert (=> b!944749 m!879243))

(declare-fun m!879245 () Bool)

(assert (=> b!944750 m!879245))

(assert (=> b!944522 d!114615))

(declare-fun d!114617 () Bool)

(assert (=> d!114617 (= (apply!875 (+!2861 lt!425699 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))) lt!425709) (apply!875 lt!425699 lt!425709))))

(declare-fun lt!425814 () Unit!31788)

(assert (=> d!114617 (= lt!425814 (choose!1573 lt!425699 lt!425701 (minValue!5478 thiss!1141) lt!425709))))

(declare-fun e!531275 () Bool)

(assert (=> d!114617 e!531275))

(declare-fun res!634452 () Bool)

(assert (=> d!114617 (=> (not res!634452) (not e!531275))))

(assert (=> d!114617 (= res!634452 (contains!5161 lt!425699 lt!425709))))

(assert (=> d!114617 (= (addApplyDifferent!445 lt!425699 lt!425701 (minValue!5478 thiss!1141) lt!425709) lt!425814)))

(declare-fun b!944751 () Bool)

(assert (=> b!944751 (= e!531275 (not (= lt!425709 lt!425701)))))

(assert (= (and d!114617 res!634452) b!944751))

(assert (=> d!114617 m!879049))

(assert (=> d!114617 m!879031))

(assert (=> d!114617 m!879033))

(declare-fun m!879247 () Bool)

(assert (=> d!114617 m!879247))

(assert (=> d!114617 m!879031))

(declare-fun m!879249 () Bool)

(assert (=> d!114617 m!879249))

(assert (=> b!944522 d!114617))

(declare-fun d!114619 () Bool)

(assert (=> d!114619 (= (apply!875 (+!2861 lt!425699 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141))) lt!425709) (get!14454 (getValueByKey!483 (toList!6080 (+!2861 lt!425699 (tuple2!13431 lt!425701 (minValue!5478 thiss!1141)))) lt!425709)))))

(declare-fun bs!26540 () Bool)

(assert (= bs!26540 d!114619))

(declare-fun m!879251 () Bool)

(assert (=> bs!26540 m!879251))

(assert (=> bs!26540 m!879251))

(declare-fun m!879253 () Bool)

(assert (=> bs!26540 m!879253))

(assert (=> b!944522 d!114619))

(declare-fun d!114621 () Bool)

(assert (=> d!114621 (= (apply!875 (+!2861 lt!425714 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))) lt!425698) (apply!875 lt!425714 lt!425698))))

(declare-fun lt!425815 () Unit!31788)

(assert (=> d!114621 (= lt!425815 (choose!1573 lt!425714 lt!425700 (zeroValue!5478 thiss!1141) lt!425698))))

(declare-fun e!531276 () Bool)

(assert (=> d!114621 e!531276))

(declare-fun res!634453 () Bool)

(assert (=> d!114621 (=> (not res!634453) (not e!531276))))

(assert (=> d!114621 (= res!634453 (contains!5161 lt!425714 lt!425698))))

(assert (=> d!114621 (= (addApplyDifferent!445 lt!425714 lt!425700 (zeroValue!5478 thiss!1141) lt!425698) lt!425815)))

(declare-fun b!944752 () Bool)

(assert (=> b!944752 (= e!531276 (not (= lt!425698 lt!425700)))))

(assert (= (and d!114621 res!634453) b!944752))

(assert (=> d!114621 m!879051))

(assert (=> d!114621 m!879037))

(assert (=> d!114621 m!879039))

(declare-fun m!879255 () Bool)

(assert (=> d!114621 m!879255))

(assert (=> d!114621 m!879037))

(declare-fun m!879257 () Bool)

(assert (=> d!114621 m!879257))

(assert (=> b!944522 d!114621))

(declare-fun d!114623 () Bool)

(declare-fun e!531277 () Bool)

(assert (=> d!114623 e!531277))

(declare-fun res!634454 () Bool)

(assert (=> d!114623 (=> (not res!634454) (not e!531277))))

(declare-fun lt!425819 () ListLongMap!12129)

(assert (=> d!114623 (= res!634454 (contains!5161 lt!425819 (_1!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141)))))))

(declare-fun lt!425816 () List!19243)

(assert (=> d!114623 (= lt!425819 (ListLongMap!12130 lt!425816))))

(declare-fun lt!425817 () Unit!31788)

(declare-fun lt!425818 () Unit!31788)

(assert (=> d!114623 (= lt!425817 lt!425818)))

(assert (=> d!114623 (= (getValueByKey!483 lt!425816 (_1!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114623 (= lt!425818 (lemmaContainsTupThenGetReturnValue!262 lt!425816 (_1!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114623 (= lt!425816 (insertStrictlySorted!319 (toList!6080 lt!425714) (_1!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))) (_2!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141)))))))

(assert (=> d!114623 (= (+!2861 lt!425714 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))) lt!425819)))

(declare-fun b!944753 () Bool)

(declare-fun res!634455 () Bool)

(assert (=> b!944753 (=> (not res!634455) (not e!531277))))

(assert (=> b!944753 (= res!634455 (= (getValueByKey!483 (toList!6080 lt!425819) (_1!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141)))) (Some!488 (_2!6726 (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))))))))

(declare-fun b!944754 () Bool)

(assert (=> b!944754 (= e!531277 (contains!5165 (toList!6080 lt!425819) (tuple2!13431 lt!425700 (zeroValue!5478 thiss!1141))))))

(assert (= (and d!114623 res!634454) b!944753))

(assert (= (and b!944753 res!634455) b!944754))

(declare-fun m!879259 () Bool)

(assert (=> d!114623 m!879259))

(declare-fun m!879261 () Bool)

(assert (=> d!114623 m!879261))

(declare-fun m!879263 () Bool)

(assert (=> d!114623 m!879263))

(declare-fun m!879265 () Bool)

(assert (=> d!114623 m!879265))

(declare-fun m!879267 () Bool)

(assert (=> b!944753 m!879267))

(declare-fun m!879269 () Bool)

(assert (=> b!944754 m!879269))

(assert (=> b!944522 d!114623))

(declare-fun d!114625 () Bool)

(assert (=> d!114625 (contains!5161 (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))) lt!425712)))

(declare-fun lt!425822 () Unit!31788)

(declare-fun choose!1574 (ListLongMap!12129 (_ BitVec 64) V!32319 (_ BitVec 64)) Unit!31788)

(assert (=> d!114625 (= lt!425822 (choose!1574 lt!425715 lt!425702 (zeroValue!5478 thiss!1141) lt!425712))))

(assert (=> d!114625 (contains!5161 lt!425715 lt!425712)))

(assert (=> d!114625 (= (addStillContains!564 lt!425715 lt!425702 (zeroValue!5478 thiss!1141) lt!425712) lt!425822)))

(declare-fun bs!26541 () Bool)

(assert (= bs!26541 d!114625))

(assert (=> bs!26541 m!879025))

(assert (=> bs!26541 m!879025))

(assert (=> bs!26541 m!879053))

(declare-fun m!879271 () Bool)

(assert (=> bs!26541 m!879271))

(declare-fun m!879273 () Bool)

(assert (=> bs!26541 m!879273))

(assert (=> b!944522 d!114625))

(declare-fun d!114627 () Bool)

(declare-fun e!531279 () Bool)

(assert (=> d!114627 e!531279))

(declare-fun res!634456 () Bool)

(assert (=> d!114627 (=> res!634456 e!531279)))

(declare-fun lt!425825 () Bool)

(assert (=> d!114627 (= res!634456 (not lt!425825))))

(declare-fun lt!425826 () Bool)

(assert (=> d!114627 (= lt!425825 lt!425826)))

(declare-fun lt!425823 () Unit!31788)

(declare-fun e!531278 () Unit!31788)

(assert (=> d!114627 (= lt!425823 e!531278)))

(declare-fun c!98608 () Bool)

(assert (=> d!114627 (= c!98608 lt!425826)))

(assert (=> d!114627 (= lt!425826 (containsKey!454 (toList!6080 (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))) lt!425712))))

(assert (=> d!114627 (= (contains!5161 (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141))) lt!425712) lt!425825)))

(declare-fun b!944756 () Bool)

(declare-fun lt!425824 () Unit!31788)

(assert (=> b!944756 (= e!531278 lt!425824)))

(assert (=> b!944756 (= lt!425824 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6080 (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))) lt!425712))))

(assert (=> b!944756 (isDefined!356 (getValueByKey!483 (toList!6080 (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))) lt!425712))))

(declare-fun b!944757 () Bool)

(declare-fun Unit!31796 () Unit!31788)

(assert (=> b!944757 (= e!531278 Unit!31796)))

(declare-fun b!944758 () Bool)

(assert (=> b!944758 (= e!531279 (isDefined!356 (getValueByKey!483 (toList!6080 (+!2861 lt!425715 (tuple2!13431 lt!425702 (zeroValue!5478 thiss!1141)))) lt!425712)))))

(assert (= (and d!114627 c!98608) b!944756))

(assert (= (and d!114627 (not c!98608)) b!944757))

(assert (= (and d!114627 (not res!634456)) b!944758))

(declare-fun m!879275 () Bool)

(assert (=> d!114627 m!879275))

(declare-fun m!879277 () Bool)

(assert (=> b!944756 m!879277))

(declare-fun m!879279 () Bool)

(assert (=> b!944756 m!879279))

(assert (=> b!944756 m!879279))

(declare-fun m!879281 () Bool)

(assert (=> b!944756 m!879281))

(assert (=> b!944758 m!879279))

(assert (=> b!944758 m!879279))

(assert (=> b!944758 m!879281))

(assert (=> b!944522 d!114627))

(declare-fun d!114629 () Bool)

(assert (=> d!114629 (= (validKeyInArray!0 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)) (and (not (= (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!944521 d!114629))

(declare-fun d!114631 () Bool)

(assert (=> d!114631 (= (apply!875 lt!425707 #b0000000000000000000000000000000000000000000000000000000000000000) (get!14454 (getValueByKey!483 (toList!6080 lt!425707) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!26542 () Bool)

(assert (= bs!26542 d!114631))

(assert (=> bs!26542 m!879163))

(assert (=> bs!26542 m!879163))

(declare-fun m!879283 () Bool)

(assert (=> bs!26542 m!879283))

(assert (=> b!944538 d!114631))

(assert (=> b!944525 d!114629))

(declare-fun d!114633 () Bool)

(assert (=> d!114633 (= (apply!875 lt!425707 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)) (get!14454 (getValueByKey!483 (toList!6080 lt!425707) (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))))

(declare-fun bs!26543 () Bool)

(assert (= bs!26543 d!114633))

(assert (=> bs!26543 m!879007))

(declare-fun m!879285 () Bool)

(assert (=> bs!26543 m!879285))

(assert (=> bs!26543 m!879285))

(declare-fun m!879287 () Bool)

(assert (=> bs!26543 m!879287))

(assert (=> b!944524 d!114633))

(declare-fun d!114635 () Bool)

(declare-fun c!98611 () Bool)

(assert (=> d!114635 (= c!98611 ((_ is ValueCellFull!9776) (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun e!531282 () V!32319)

(assert (=> d!114635 (= (get!14453 (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)) e!531282)))

(declare-fun b!944763 () Bool)

(declare-fun get!14455 (ValueCell!9776 V!32319) V!32319)

(assert (=> b!944763 (= e!531282 (get!14455 (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!944764 () Bool)

(declare-fun get!14456 (ValueCell!9776 V!32319) V!32319)

(assert (=> b!944764 (= e!531282 (get!14456 (select (arr!27445 (_values!5665 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1658 (defaultEntry!5642 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!114635 c!98611) b!944763))

(assert (= (and d!114635 (not c!98611)) b!944764))

(assert (=> b!944763 m!879013))

(assert (=> b!944763 m!879015))

(declare-fun m!879289 () Bool)

(assert (=> b!944763 m!879289))

(assert (=> b!944764 m!879013))

(assert (=> b!944764 m!879015))

(declare-fun m!879291 () Bool)

(assert (=> b!944764 m!879291))

(assert (=> b!944524 d!114635))

(declare-fun d!114637 () Bool)

(declare-fun e!531285 () Bool)

(assert (=> d!114637 e!531285))

(declare-fun c!98614 () Bool)

(assert (=> d!114637 (= c!98614 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!114637 true))

(declare-fun _$15!101 () Unit!31788)

(assert (=> d!114637 (= (choose!1571 (_keys!10544 thiss!1141) (_values!5665 thiss!1141) (mask!27315 thiss!1141) (extraKeys!5374 thiss!1141) (zeroValue!5478 thiss!1141) (minValue!5478 thiss!1141) key!756 (defaultEntry!5642 thiss!1141)) _$15!101)))

(declare-fun b!944769 () Bool)

(assert (=> b!944769 (= e!531285 (arrayContainsKey!0 (_keys!10544 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!944770 () Bool)

(assert (=> b!944770 (= e!531285 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5374 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!114637 c!98614) b!944769))

(assert (= (and d!114637 (not c!98614)) b!944770))

(assert (=> b!944769 m!878943))

(assert (=> d!114559 d!114637))

(assert (=> d!114559 d!114563))

(declare-fun d!114639 () Bool)

(declare-fun e!531287 () Bool)

(assert (=> d!114639 e!531287))

(declare-fun res!634457 () Bool)

(assert (=> d!114639 (=> res!634457 e!531287)))

(declare-fun lt!425829 () Bool)

(assert (=> d!114639 (= res!634457 (not lt!425829))))

(declare-fun lt!425830 () Bool)

(assert (=> d!114639 (= lt!425829 lt!425830)))

(declare-fun lt!425827 () Unit!31788)

(declare-fun e!531286 () Unit!31788)

(assert (=> d!114639 (= lt!425827 e!531286)))

(declare-fun c!98615 () Bool)

(assert (=> d!114639 (= c!98615 lt!425830)))

(assert (=> d!114639 (= lt!425830 (containsKey!454 (toList!6080 lt!425707) (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> d!114639 (= (contains!5161 lt!425707 (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)) lt!425829)))

(declare-fun b!944771 () Bool)

(declare-fun lt!425828 () Unit!31788)

(assert (=> b!944771 (= e!531286 lt!425828)))

(assert (=> b!944771 (= lt!425828 (lemmaContainsKeyImpliesGetValueByKeyDefined!348 (toList!6080 lt!425707) (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!944771 (isDefined!356 (getValueByKey!483 (toList!6080 lt!425707) (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!944772 () Bool)

(declare-fun Unit!31797 () Unit!31788)

(assert (=> b!944772 (= e!531286 Unit!31797)))

(declare-fun b!944773 () Bool)

(assert (=> b!944773 (= e!531287 (isDefined!356 (getValueByKey!483 (toList!6080 lt!425707) (select (arr!27446 (_keys!10544 thiss!1141)) #b00000000000000000000000000000000))))))

(assert (= (and d!114639 c!98615) b!944771))

(assert (= (and d!114639 (not c!98615)) b!944772))

(assert (= (and d!114639 (not res!634457)) b!944773))

(assert (=> d!114639 m!879007))

(declare-fun m!879293 () Bool)

(assert (=> d!114639 m!879293))

(assert (=> b!944771 m!879007))

(declare-fun m!879295 () Bool)

(assert (=> b!944771 m!879295))

(assert (=> b!944771 m!879007))

(assert (=> b!944771 m!879285))

(assert (=> b!944771 m!879285))

(declare-fun m!879297 () Bool)

(assert (=> b!944771 m!879297))

(assert (=> b!944773 m!879007))

(assert (=> b!944773 m!879285))

(assert (=> b!944773 m!879285))

(assert (=> b!944773 m!879297))

(assert (=> b!944523 d!114639))

(assert (=> bm!41027 d!114613))

(declare-fun b!944774 () Bool)

(declare-fun e!531288 () Bool)

(assert (=> b!944774 (= e!531288 tp_is_empty!20515)))

(declare-fun condMapEmpty!32604 () Bool)

(declare-fun mapDefault!32604 () ValueCell!9776)

(assert (=> mapNonEmpty!32603 (= condMapEmpty!32604 (= mapRest!32603 ((as const (Array (_ BitVec 32) ValueCell!9776)) mapDefault!32604)))))

(declare-fun e!531289 () Bool)

(declare-fun mapRes!32604 () Bool)

(assert (=> mapNonEmpty!32603 (= tp!62543 (and e!531289 mapRes!32604))))

(declare-fun mapIsEmpty!32604 () Bool)

(assert (=> mapIsEmpty!32604 mapRes!32604))

(declare-fun b!944775 () Bool)

(assert (=> b!944775 (= e!531289 tp_is_empty!20515)))

(declare-fun mapNonEmpty!32604 () Bool)

(declare-fun tp!62544 () Bool)

(assert (=> mapNonEmpty!32604 (= mapRes!32604 (and tp!62544 e!531288))))

(declare-fun mapKey!32604 () (_ BitVec 32))

(declare-fun mapRest!32604 () (Array (_ BitVec 32) ValueCell!9776))

(declare-fun mapValue!32604 () ValueCell!9776)

(assert (=> mapNonEmpty!32604 (= mapRest!32603 (store mapRest!32604 mapKey!32604 mapValue!32604))))

(assert (= (and mapNonEmpty!32603 condMapEmpty!32604) mapIsEmpty!32604))

(assert (= (and mapNonEmpty!32603 (not condMapEmpty!32604)) mapNonEmpty!32604))

(assert (= (and mapNonEmpty!32604 ((_ is ValueCellFull!9776) mapValue!32604)) b!944774))

(assert (= (and mapNonEmpty!32603 ((_ is ValueCellFull!9776) mapDefault!32604)) b!944775))

(declare-fun m!879299 () Bool)

(assert (=> mapNonEmpty!32604 m!879299))

(declare-fun b_lambda!14301 () Bool)

(assert (= b_lambda!14299 (or (and b!944399 b_free!18007) b_lambda!14301)))

(declare-fun b_lambda!14303 () Bool)

(assert (= b_lambda!14297 (or (and b!944399 b_free!18007) b_lambda!14303)))

(check-sat (not b!944708) (not d!114599) (not b!944671) (not b!944705) (not d!114631) (not b!944632) (not b!944706) (not b!944756) (not d!114589) (not b!944651) (not b!944660) (not d!114567) (not b!944618) (not d!114601) (not d!114591) (not d!114595) (not b!944674) (not d!114605) (not mapNonEmpty!32604) (not b!944702) (not b!944596) (not d!114579) (not b!944758) (not b!944694) (not b!944650) (not b!944598) (not b!944742) (not d!114619) (not b_lambda!14301) (not d!114571) (not b!944769) b_and!29439 (not b!944629) (not b!944741) (not b!944582) (not b_lambda!14295) (not b!944763) (not d!114617) (not b!944593) (not b_lambda!14303) (not bm!41037) (not b!944743) (not bm!41040) (not d!114607) tp_is_empty!20515 (not d!114627) (not b_next!18007) (not d!114569) (not b!944594) (not b!944749) (not b!944750) (not b!944746) (not b!944704) (not bm!41031) (not b!944771) (not d!114583) (not d!114603) (not b!944744) (not d!114613) (not b!944673) (not b!944707) (not b!944645) (not d!114639) (not b!944644) (not d!114621) (not b!944616) (not d!114565) (not d!114609) (not b!944764) (not d!114611) (not b!944633) (not d!114623) (not d!114585) (not d!114633) (not b!944737) (not b!944657) (not bm!41034) (not d!114615) (not b!944754) (not b!944745) (not b!944739) (not d!114625) (not b!944753) (not b!944773) (not d!114597))
(check-sat b_and!29439 (not b_next!18007))
