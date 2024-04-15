; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18080 () Bool)

(assert start!18080)

(declare-fun b!179876 () Bool)

(declare-fun b_free!4447 () Bool)

(declare-fun b_next!4447 () Bool)

(assert (=> b!179876 (= b_free!4447 (not b_next!4447))))

(declare-fun tp!16071 () Bool)

(declare-fun b_and!10955 () Bool)

(assert (=> b!179876 (= tp!16071 b_and!10955)))

(declare-fun e!118470 () Bool)

(declare-fun e!118471 () Bool)

(declare-fun tp_is_empty!4219 () Bool)

(declare-datatypes ((V!5273 0))(
  ( (V!5274 (val!2154 Int)) )
))
(declare-datatypes ((ValueCell!1766 0))(
  ( (ValueCellFull!1766 (v!4037 V!5273)) (EmptyCell!1766) )
))
(declare-datatypes ((array!7587 0))(
  ( (array!7588 (arr!3592 (Array (_ BitVec 32) (_ BitVec 64))) (size!3901 (_ BitVec 32))) )
))
(declare-datatypes ((array!7589 0))(
  ( (array!7590 (arr!3593 (Array (_ BitVec 32) ValueCell!1766)) (size!3902 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2440 0))(
  ( (LongMapFixedSize!2441 (defaultEntry!3696 Int) (mask!8690 (_ BitVec 32)) (extraKeys!3433 (_ BitVec 32)) (zeroValue!3537 V!5273) (minValue!3537 V!5273) (_size!1269 (_ BitVec 32)) (_keys!5586 array!7587) (_values!3679 array!7589) (_vacant!1269 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2440)

(declare-fun array_inv!2325 (array!7587) Bool)

(declare-fun array_inv!2326 (array!7589) Bool)

(assert (=> b!179876 (= e!118471 (and tp!16071 tp_is_empty!4219 (array_inv!2325 (_keys!5586 thiss!1248)) (array_inv!2326 (_values!3679 thiss!1248)) e!118470))))

(declare-fun b!179877 () Bool)

(declare-fun e!118472 () Bool)

(declare-fun e!118475 () Bool)

(assert (=> b!179877 (= e!118472 e!118475)))

(declare-datatypes ((tuple2!3326 0))(
  ( (tuple2!3327 (_1!1674 (_ BitVec 64)) (_2!1674 V!5273)) )
))
(declare-datatypes ((List!2287 0))(
  ( (Nil!2284) (Cons!2283 (h!2908 tuple2!3326) (t!7126 List!2287)) )
))
(declare-datatypes ((ListLongMap!2245 0))(
  ( (ListLongMap!2246 (toList!1138 List!2287)) )
))
(declare-fun lt!88697 () ListLongMap!2245)

(declare-fun call!18156 () ListLongMap!2245)

(assert (=> b!179877 (= lt!88697 call!18156)))

(declare-fun res!85183 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1219 (ListLongMap!2245 (_ BitVec 64)) Bool)

(assert (=> b!179877 (= res!85183 (not (contains!1219 lt!88697 key!828)))))

(assert (=> b!179877 (=> res!85183 e!118475)))

(declare-fun b!179878 () Bool)

(declare-fun e!118474 () Bool)

(assert (=> b!179878 (= e!118474 tp_is_empty!4219)))

(declare-fun b!179879 () Bool)

(declare-fun e!118476 () Bool)

(assert (=> b!179879 (= e!118476 e!118472)))

(declare-fun c!32223 () Bool)

(declare-datatypes ((tuple2!3328 0))(
  ( (tuple2!3329 (_1!1675 Bool) (_2!1675 LongMapFixedSize!2440)) )
))
(declare-fun lt!88698 () tuple2!3328)

(assert (=> b!179879 (= c!32223 (_1!1675 lt!88698))))

(declare-fun b!179880 () Bool)

(declare-fun e!118469 () Bool)

(declare-fun e!118477 () Bool)

(assert (=> b!179880 (= e!118469 e!118477)))

(declare-fun res!85180 () Bool)

(assert (=> b!179880 (=> (not res!85180) (not e!118477))))

(declare-datatypes ((SeekEntryResult!598 0))(
  ( (MissingZero!598 (index!4560 (_ BitVec 32))) (Found!598 (index!4561 (_ BitVec 32))) (Intermediate!598 (undefined!1410 Bool) (index!4562 (_ BitVec 32)) (x!19687 (_ BitVec 32))) (Undefined!598) (MissingVacant!598 (index!4563 (_ BitVec 32))) )
))
(declare-fun lt!88699 () SeekEntryResult!598)

(get-info :version)

(assert (=> b!179880 (= res!85180 (and (not ((_ is Undefined!598) lt!88699)) ((_ is MissingVacant!598) lt!88699)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7587 (_ BitVec 32)) SeekEntryResult!598)

(assert (=> b!179880 (= lt!88699 (seekEntryOrOpen!0 key!828 (_keys!5586 thiss!1248) (mask!8690 thiss!1248)))))

(declare-fun call!18157 () ListLongMap!2245)

(declare-fun v!309 () V!5273)

(declare-fun b!179881 () Bool)

(declare-fun +!261 (ListLongMap!2245 tuple2!3326) ListLongMap!2245)

(assert (=> b!179881 (= e!118475 (not (= lt!88697 (+!261 call!18157 (tuple2!3327 key!828 v!309)))))))

(declare-fun b!179882 () Bool)

(assert (=> b!179882 (= e!118472 (not (= call!18157 call!18156)))))

(declare-fun b!179883 () Bool)

(declare-fun res!85184 () Bool)

(assert (=> b!179883 (=> (not res!85184) (not e!118469))))

(assert (=> b!179883 (= res!85184 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179884 () Bool)

(assert (=> b!179884 (= e!118477 e!118476)))

(declare-fun res!85181 () Bool)

(assert (=> b!179884 (=> res!85181 e!118476)))

(declare-fun valid!1034 (LongMapFixedSize!2440) Bool)

(assert (=> b!179884 (= res!85181 (not (valid!1034 (_2!1675 lt!88698))))))

(declare-fun updateHelperNewKey!92 (LongMapFixedSize!2440 (_ BitVec 64) V!5273 (_ BitVec 32)) tuple2!3328)

(assert (=> b!179884 (= lt!88698 (updateHelperNewKey!92 thiss!1248 key!828 v!309 (index!4563 lt!88699)))))

(declare-fun b!179885 () Bool)

(declare-fun e!118473 () Bool)

(assert (=> b!179885 (= e!118473 tp_is_empty!4219)))

(declare-fun mapIsEmpty!7222 () Bool)

(declare-fun mapRes!7222 () Bool)

(assert (=> mapIsEmpty!7222 mapRes!7222))

(declare-fun res!85182 () Bool)

(assert (=> start!18080 (=> (not res!85182) (not e!118469))))

(assert (=> start!18080 (= res!85182 (valid!1034 thiss!1248))))

(assert (=> start!18080 e!118469))

(assert (=> start!18080 e!118471))

(assert (=> start!18080 true))

(assert (=> start!18080 tp_is_empty!4219))

(declare-fun bm!18153 () Bool)

(declare-fun map!1913 (LongMapFixedSize!2440) ListLongMap!2245)

(assert (=> bm!18153 (= call!18157 (map!1913 (ite c!32223 thiss!1248 (_2!1675 lt!88698))))))

(declare-fun mapNonEmpty!7222 () Bool)

(declare-fun tp!16072 () Bool)

(assert (=> mapNonEmpty!7222 (= mapRes!7222 (and tp!16072 e!118474))))

(declare-fun mapValue!7222 () ValueCell!1766)

(declare-fun mapRest!7222 () (Array (_ BitVec 32) ValueCell!1766))

(declare-fun mapKey!7222 () (_ BitVec 32))

(assert (=> mapNonEmpty!7222 (= (arr!3593 (_values!3679 thiss!1248)) (store mapRest!7222 mapKey!7222 mapValue!7222))))

(declare-fun b!179886 () Bool)

(assert (=> b!179886 (= e!118470 (and e!118473 mapRes!7222))))

(declare-fun condMapEmpty!7222 () Bool)

(declare-fun mapDefault!7222 () ValueCell!1766)

(assert (=> b!179886 (= condMapEmpty!7222 (= (arr!3593 (_values!3679 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1766)) mapDefault!7222)))))

(declare-fun bm!18154 () Bool)

(assert (=> bm!18154 (= call!18156 (map!1913 (ite c!32223 (_2!1675 lt!88698) thiss!1248)))))

(assert (= (and start!18080 res!85182) b!179883))

(assert (= (and b!179883 res!85184) b!179880))

(assert (= (and b!179880 res!85180) b!179884))

(assert (= (and b!179884 (not res!85181)) b!179879))

(assert (= (and b!179879 c!32223) b!179877))

(assert (= (and b!179879 (not c!32223)) b!179882))

(assert (= (and b!179877 (not res!85183)) b!179881))

(assert (= (or b!179881 b!179882) bm!18153))

(assert (= (or b!179877 b!179882) bm!18154))

(assert (= (and b!179886 condMapEmpty!7222) mapIsEmpty!7222))

(assert (= (and b!179886 (not condMapEmpty!7222)) mapNonEmpty!7222))

(assert (= (and mapNonEmpty!7222 ((_ is ValueCellFull!1766) mapValue!7222)) b!179878))

(assert (= (and b!179886 ((_ is ValueCellFull!1766) mapDefault!7222)) b!179885))

(assert (= b!179876 b!179886))

(assert (= start!18080 b!179876))

(declare-fun m!207465 () Bool)

(assert (=> b!179884 m!207465))

(declare-fun m!207467 () Bool)

(assert (=> b!179884 m!207467))

(declare-fun m!207469 () Bool)

(assert (=> b!179877 m!207469))

(declare-fun m!207471 () Bool)

(assert (=> b!179881 m!207471))

(declare-fun m!207473 () Bool)

(assert (=> start!18080 m!207473))

(declare-fun m!207475 () Bool)

(assert (=> b!179876 m!207475))

(declare-fun m!207477 () Bool)

(assert (=> b!179876 m!207477))

(declare-fun m!207479 () Bool)

(assert (=> bm!18153 m!207479))

(declare-fun m!207481 () Bool)

(assert (=> bm!18154 m!207481))

(declare-fun m!207483 () Bool)

(assert (=> mapNonEmpty!7222 m!207483))

(declare-fun m!207485 () Bool)

(assert (=> b!179880 m!207485))

(check-sat (not mapNonEmpty!7222) (not bm!18154) (not bm!18153) (not b_next!4447) (not b!179877) tp_is_empty!4219 (not b!179884) (not b!179876) b_and!10955 (not b!179880) (not start!18080) (not b!179881))
(check-sat b_and!10955 (not b_next!4447))
(get-model)

(declare-fun d!54041 () Bool)

(declare-fun res!85221 () Bool)

(declare-fun e!118541 () Bool)

(assert (=> d!54041 (=> (not res!85221) (not e!118541))))

(declare-fun simpleValid!163 (LongMapFixedSize!2440) Bool)

(assert (=> d!54041 (= res!85221 (simpleValid!163 thiss!1248))))

(assert (=> d!54041 (= (valid!1034 thiss!1248) e!118541)))

(declare-fun b!179959 () Bool)

(declare-fun res!85222 () Bool)

(assert (=> b!179959 (=> (not res!85222) (not e!118541))))

(declare-fun arrayCountValidKeys!0 (array!7587 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!179959 (= res!85222 (= (arrayCountValidKeys!0 (_keys!5586 thiss!1248) #b00000000000000000000000000000000 (size!3901 (_keys!5586 thiss!1248))) (_size!1269 thiss!1248)))))

(declare-fun b!179960 () Bool)

(declare-fun res!85223 () Bool)

(assert (=> b!179960 (=> (not res!85223) (not e!118541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7587 (_ BitVec 32)) Bool)

(assert (=> b!179960 (= res!85223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5586 thiss!1248) (mask!8690 thiss!1248)))))

(declare-fun b!179961 () Bool)

(declare-datatypes ((List!2289 0))(
  ( (Nil!2286) (Cons!2285 (h!2910 (_ BitVec 64)) (t!7128 List!2289)) )
))
(declare-fun arrayNoDuplicates!0 (array!7587 (_ BitVec 32) List!2289) Bool)

(assert (=> b!179961 (= e!118541 (arrayNoDuplicates!0 (_keys!5586 thiss!1248) #b00000000000000000000000000000000 Nil!2286))))

(assert (= (and d!54041 res!85221) b!179959))

(assert (= (and b!179959 res!85222) b!179960))

(assert (= (and b!179960 res!85223) b!179961))

(declare-fun m!207531 () Bool)

(assert (=> d!54041 m!207531))

(declare-fun m!207533 () Bool)

(assert (=> b!179959 m!207533))

(declare-fun m!207535 () Bool)

(assert (=> b!179960 m!207535))

(declare-fun m!207537 () Bool)

(assert (=> b!179961 m!207537))

(assert (=> start!18080 d!54041))

(declare-fun d!54043 () Bool)

(declare-fun getCurrentListMap!774 (array!7587 array!7589 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 32) Int) ListLongMap!2245)

(assert (=> d!54043 (= (map!1913 (ite c!32223 thiss!1248 (_2!1675 lt!88698))) (getCurrentListMap!774 (_keys!5586 (ite c!32223 thiss!1248 (_2!1675 lt!88698))) (_values!3679 (ite c!32223 thiss!1248 (_2!1675 lt!88698))) (mask!8690 (ite c!32223 thiss!1248 (_2!1675 lt!88698))) (extraKeys!3433 (ite c!32223 thiss!1248 (_2!1675 lt!88698))) (zeroValue!3537 (ite c!32223 thiss!1248 (_2!1675 lt!88698))) (minValue!3537 (ite c!32223 thiss!1248 (_2!1675 lt!88698))) #b00000000000000000000000000000000 (defaultEntry!3696 (ite c!32223 thiss!1248 (_2!1675 lt!88698)))))))

(declare-fun bs!7342 () Bool)

(assert (= bs!7342 d!54043))

(declare-fun m!207539 () Bool)

(assert (=> bs!7342 m!207539))

(assert (=> bm!18153 d!54043))

(declare-fun d!54045 () Bool)

(assert (=> d!54045 (= (map!1913 (ite c!32223 (_2!1675 lt!88698) thiss!1248)) (getCurrentListMap!774 (_keys!5586 (ite c!32223 (_2!1675 lt!88698) thiss!1248)) (_values!3679 (ite c!32223 (_2!1675 lt!88698) thiss!1248)) (mask!8690 (ite c!32223 (_2!1675 lt!88698) thiss!1248)) (extraKeys!3433 (ite c!32223 (_2!1675 lt!88698) thiss!1248)) (zeroValue!3537 (ite c!32223 (_2!1675 lt!88698) thiss!1248)) (minValue!3537 (ite c!32223 (_2!1675 lt!88698) thiss!1248)) #b00000000000000000000000000000000 (defaultEntry!3696 (ite c!32223 (_2!1675 lt!88698) thiss!1248))))))

(declare-fun bs!7343 () Bool)

(assert (= bs!7343 d!54045))

(declare-fun m!207541 () Bool)

(assert (=> bs!7343 m!207541))

(assert (=> bm!18154 d!54045))

(declare-fun d!54047 () Bool)

(declare-fun e!118546 () Bool)

(assert (=> d!54047 e!118546))

(declare-fun res!85226 () Bool)

(assert (=> d!54047 (=> res!85226 e!118546)))

(declare-fun lt!88729 () Bool)

(assert (=> d!54047 (= res!85226 (not lt!88729))))

(declare-fun lt!88728 () Bool)

(assert (=> d!54047 (= lt!88729 lt!88728)))

(declare-datatypes ((Unit!5451 0))(
  ( (Unit!5452) )
))
(declare-fun lt!88726 () Unit!5451)

(declare-fun e!118547 () Unit!5451)

(assert (=> d!54047 (= lt!88726 e!118547)))

(declare-fun c!32232 () Bool)

(assert (=> d!54047 (= c!32232 lt!88728)))

(declare-fun containsKey!206 (List!2287 (_ BitVec 64)) Bool)

(assert (=> d!54047 (= lt!88728 (containsKey!206 (toList!1138 lt!88697) key!828))))

(assert (=> d!54047 (= (contains!1219 lt!88697 key!828) lt!88729)))

(declare-fun b!179968 () Bool)

(declare-fun lt!88727 () Unit!5451)

(assert (=> b!179968 (= e!118547 lt!88727)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!155 (List!2287 (_ BitVec 64)) Unit!5451)

(assert (=> b!179968 (= lt!88727 (lemmaContainsKeyImpliesGetValueByKeyDefined!155 (toList!1138 lt!88697) key!828))))

(declare-datatypes ((Option!208 0))(
  ( (Some!207 (v!4041 V!5273)) (None!206) )
))
(declare-fun isDefined!156 (Option!208) Bool)

(declare-fun getValueByKey!202 (List!2287 (_ BitVec 64)) Option!208)

(assert (=> b!179968 (isDefined!156 (getValueByKey!202 (toList!1138 lt!88697) key!828))))

(declare-fun b!179969 () Bool)

(declare-fun Unit!5453 () Unit!5451)

(assert (=> b!179969 (= e!118547 Unit!5453)))

(declare-fun b!179970 () Bool)

(assert (=> b!179970 (= e!118546 (isDefined!156 (getValueByKey!202 (toList!1138 lt!88697) key!828)))))

(assert (= (and d!54047 c!32232) b!179968))

(assert (= (and d!54047 (not c!32232)) b!179969))

(assert (= (and d!54047 (not res!85226)) b!179970))

(declare-fun m!207543 () Bool)

(assert (=> d!54047 m!207543))

(declare-fun m!207545 () Bool)

(assert (=> b!179968 m!207545))

(declare-fun m!207547 () Bool)

(assert (=> b!179968 m!207547))

(assert (=> b!179968 m!207547))

(declare-fun m!207549 () Bool)

(assert (=> b!179968 m!207549))

(assert (=> b!179970 m!207547))

(assert (=> b!179970 m!207547))

(assert (=> b!179970 m!207549))

(assert (=> b!179877 d!54047))

(declare-fun lt!88738 () SeekEntryResult!598)

(declare-fun e!118554 () SeekEntryResult!598)

(declare-fun b!179983 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7587 (_ BitVec 32)) SeekEntryResult!598)

(assert (=> b!179983 (= e!118554 (seekKeyOrZeroReturnVacant!0 (x!19687 lt!88738) (index!4562 lt!88738) (index!4562 lt!88738) key!828 (_keys!5586 thiss!1248) (mask!8690 thiss!1248)))))

(declare-fun b!179984 () Bool)

(declare-fun e!118555 () SeekEntryResult!598)

(assert (=> b!179984 (= e!118555 (Found!598 (index!4562 lt!88738)))))

(declare-fun b!179986 () Bool)

(declare-fun e!118556 () SeekEntryResult!598)

(assert (=> b!179986 (= e!118556 Undefined!598)))

(declare-fun d!54049 () Bool)

(declare-fun lt!88737 () SeekEntryResult!598)

(assert (=> d!54049 (and (or ((_ is Undefined!598) lt!88737) (not ((_ is Found!598) lt!88737)) (and (bvsge (index!4561 lt!88737) #b00000000000000000000000000000000) (bvslt (index!4561 lt!88737) (size!3901 (_keys!5586 thiss!1248))))) (or ((_ is Undefined!598) lt!88737) ((_ is Found!598) lt!88737) (not ((_ is MissingZero!598) lt!88737)) (and (bvsge (index!4560 lt!88737) #b00000000000000000000000000000000) (bvslt (index!4560 lt!88737) (size!3901 (_keys!5586 thiss!1248))))) (or ((_ is Undefined!598) lt!88737) ((_ is Found!598) lt!88737) ((_ is MissingZero!598) lt!88737) (not ((_ is MissingVacant!598) lt!88737)) (and (bvsge (index!4563 lt!88737) #b00000000000000000000000000000000) (bvslt (index!4563 lt!88737) (size!3901 (_keys!5586 thiss!1248))))) (or ((_ is Undefined!598) lt!88737) (ite ((_ is Found!598) lt!88737) (= (select (arr!3592 (_keys!5586 thiss!1248)) (index!4561 lt!88737)) key!828) (ite ((_ is MissingZero!598) lt!88737) (= (select (arr!3592 (_keys!5586 thiss!1248)) (index!4560 lt!88737)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!598) lt!88737) (= (select (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88737)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54049 (= lt!88737 e!118556)))

(declare-fun c!32239 () Bool)

(assert (=> d!54049 (= c!32239 (and ((_ is Intermediate!598) lt!88738) (undefined!1410 lt!88738)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7587 (_ BitVec 32)) SeekEntryResult!598)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54049 (= lt!88738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8690 thiss!1248)) key!828 (_keys!5586 thiss!1248) (mask!8690 thiss!1248)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!54049 (validMask!0 (mask!8690 thiss!1248))))

(assert (=> d!54049 (= (seekEntryOrOpen!0 key!828 (_keys!5586 thiss!1248) (mask!8690 thiss!1248)) lt!88737)))

(declare-fun b!179985 () Bool)

(declare-fun c!32240 () Bool)

(declare-fun lt!88736 () (_ BitVec 64))

(assert (=> b!179985 (= c!32240 (= lt!88736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!179985 (= e!118555 e!118554)))

(declare-fun b!179987 () Bool)

(assert (=> b!179987 (= e!118556 e!118555)))

(assert (=> b!179987 (= lt!88736 (select (arr!3592 (_keys!5586 thiss!1248)) (index!4562 lt!88738)))))

(declare-fun c!32241 () Bool)

(assert (=> b!179987 (= c!32241 (= lt!88736 key!828))))

(declare-fun b!179988 () Bool)

(assert (=> b!179988 (= e!118554 (MissingZero!598 (index!4562 lt!88738)))))

(assert (= (and d!54049 c!32239) b!179986))

(assert (= (and d!54049 (not c!32239)) b!179987))

(assert (= (and b!179987 c!32241) b!179984))

(assert (= (and b!179987 (not c!32241)) b!179985))

(assert (= (and b!179985 c!32240) b!179988))

(assert (= (and b!179985 (not c!32240)) b!179983))

(declare-fun m!207551 () Bool)

(assert (=> b!179983 m!207551))

(declare-fun m!207553 () Bool)

(assert (=> d!54049 m!207553))

(declare-fun m!207555 () Bool)

(assert (=> d!54049 m!207555))

(declare-fun m!207557 () Bool)

(assert (=> d!54049 m!207557))

(declare-fun m!207559 () Bool)

(assert (=> d!54049 m!207559))

(declare-fun m!207561 () Bool)

(assert (=> d!54049 m!207561))

(declare-fun m!207563 () Bool)

(assert (=> d!54049 m!207563))

(assert (=> d!54049 m!207557))

(declare-fun m!207565 () Bool)

(assert (=> b!179987 m!207565))

(assert (=> b!179880 d!54049))

(declare-fun d!54051 () Bool)

(assert (=> d!54051 (= (array_inv!2325 (_keys!5586 thiss!1248)) (bvsge (size!3901 (_keys!5586 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179876 d!54051))

(declare-fun d!54053 () Bool)

(assert (=> d!54053 (= (array_inv!2326 (_values!3679 thiss!1248)) (bvsge (size!3902 (_values!3679 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!179876 d!54053))

(declare-fun d!54055 () Bool)

(declare-fun e!118559 () Bool)

(assert (=> d!54055 e!118559))

(declare-fun res!85232 () Bool)

(assert (=> d!54055 (=> (not res!85232) (not e!118559))))

(declare-fun lt!88747 () ListLongMap!2245)

(assert (=> d!54055 (= res!85232 (contains!1219 lt!88747 (_1!1674 (tuple2!3327 key!828 v!309))))))

(declare-fun lt!88749 () List!2287)

(assert (=> d!54055 (= lt!88747 (ListLongMap!2246 lt!88749))))

(declare-fun lt!88750 () Unit!5451)

(declare-fun lt!88748 () Unit!5451)

(assert (=> d!54055 (= lt!88750 lt!88748)))

(assert (=> d!54055 (= (getValueByKey!202 lt!88749 (_1!1674 (tuple2!3327 key!828 v!309))) (Some!207 (_2!1674 (tuple2!3327 key!828 v!309))))))

(declare-fun lemmaContainsTupThenGetReturnValue!108 (List!2287 (_ BitVec 64) V!5273) Unit!5451)

(assert (=> d!54055 (= lt!88748 (lemmaContainsTupThenGetReturnValue!108 lt!88749 (_1!1674 (tuple2!3327 key!828 v!309)) (_2!1674 (tuple2!3327 key!828 v!309))))))

(declare-fun insertStrictlySorted!111 (List!2287 (_ BitVec 64) V!5273) List!2287)

(assert (=> d!54055 (= lt!88749 (insertStrictlySorted!111 (toList!1138 call!18157) (_1!1674 (tuple2!3327 key!828 v!309)) (_2!1674 (tuple2!3327 key!828 v!309))))))

(assert (=> d!54055 (= (+!261 call!18157 (tuple2!3327 key!828 v!309)) lt!88747)))

(declare-fun b!179993 () Bool)

(declare-fun res!85231 () Bool)

(assert (=> b!179993 (=> (not res!85231) (not e!118559))))

(assert (=> b!179993 (= res!85231 (= (getValueByKey!202 (toList!1138 lt!88747) (_1!1674 (tuple2!3327 key!828 v!309))) (Some!207 (_2!1674 (tuple2!3327 key!828 v!309)))))))

(declare-fun b!179994 () Bool)

(declare-fun contains!1221 (List!2287 tuple2!3326) Bool)

(assert (=> b!179994 (= e!118559 (contains!1221 (toList!1138 lt!88747) (tuple2!3327 key!828 v!309)))))

(assert (= (and d!54055 res!85232) b!179993))

(assert (= (and b!179993 res!85231) b!179994))

(declare-fun m!207567 () Bool)

(assert (=> d!54055 m!207567))

(declare-fun m!207569 () Bool)

(assert (=> d!54055 m!207569))

(declare-fun m!207571 () Bool)

(assert (=> d!54055 m!207571))

(declare-fun m!207573 () Bool)

(assert (=> d!54055 m!207573))

(declare-fun m!207575 () Bool)

(assert (=> b!179993 m!207575))

(declare-fun m!207577 () Bool)

(assert (=> b!179994 m!207577))

(assert (=> b!179881 d!54055))

(declare-fun d!54057 () Bool)

(declare-fun res!85233 () Bool)

(declare-fun e!118560 () Bool)

(assert (=> d!54057 (=> (not res!85233) (not e!118560))))

(assert (=> d!54057 (= res!85233 (simpleValid!163 (_2!1675 lt!88698)))))

(assert (=> d!54057 (= (valid!1034 (_2!1675 lt!88698)) e!118560)))

(declare-fun b!179995 () Bool)

(declare-fun res!85234 () Bool)

(assert (=> b!179995 (=> (not res!85234) (not e!118560))))

(assert (=> b!179995 (= res!85234 (= (arrayCountValidKeys!0 (_keys!5586 (_2!1675 lt!88698)) #b00000000000000000000000000000000 (size!3901 (_keys!5586 (_2!1675 lt!88698)))) (_size!1269 (_2!1675 lt!88698))))))

(declare-fun b!179996 () Bool)

(declare-fun res!85235 () Bool)

(assert (=> b!179996 (=> (not res!85235) (not e!118560))))

(assert (=> b!179996 (= res!85235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5586 (_2!1675 lt!88698)) (mask!8690 (_2!1675 lt!88698))))))

(declare-fun b!179997 () Bool)

(assert (=> b!179997 (= e!118560 (arrayNoDuplicates!0 (_keys!5586 (_2!1675 lt!88698)) #b00000000000000000000000000000000 Nil!2286))))

(assert (= (and d!54057 res!85233) b!179995))

(assert (= (and b!179995 res!85234) b!179996))

(assert (= (and b!179996 res!85235) b!179997))

(declare-fun m!207579 () Bool)

(assert (=> d!54057 m!207579))

(declare-fun m!207581 () Bool)

(assert (=> b!179995 m!207581))

(declare-fun m!207583 () Bool)

(assert (=> b!179996 m!207583))

(declare-fun m!207585 () Bool)

(assert (=> b!179997 m!207585))

(assert (=> b!179884 d!54057))

(declare-fun b!180032 () Bool)

(declare-fun e!118579 () Bool)

(declare-fun call!18178 () Bool)

(assert (=> b!180032 (= e!118579 (not call!18178))))

(declare-fun b!180033 () Bool)

(declare-fun e!118580 () Unit!5451)

(declare-fun Unit!5454 () Unit!5451)

(assert (=> b!180033 (= e!118580 Unit!5454)))

(declare-fun lt!88827 () Unit!5451)

(declare-fun lemmaArrayContainsKeyThenInListMap!50 (array!7587 array!7589 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 64) (_ BitVec 32) Int) Unit!5451)

(assert (=> b!180033 (= lt!88827 (lemmaArrayContainsKeyThenInListMap!50 (_keys!5586 thiss!1248) (_values!3679 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) key!828 #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)))))

(assert (=> b!180033 (contains!1219 (getCurrentListMap!774 (_keys!5586 thiss!1248) (_values!3679 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) key!828)))

(declare-fun lt!88837 () Unit!5451)

(assert (=> b!180033 (= lt!88837 lt!88827)))

(assert (=> b!180033 false))

(declare-fun b!180034 () Bool)

(declare-fun e!118581 () Bool)

(assert (=> b!180034 (= e!118581 e!118579)))

(declare-fun res!85261 () Bool)

(declare-fun call!18179 () Bool)

(assert (=> b!180034 (= res!85261 call!18179)))

(assert (=> b!180034 (=> (not res!85261) (not e!118579))))

(declare-fun b!180035 () Bool)

(declare-fun c!32250 () Bool)

(declare-fun lt!88823 () SeekEntryResult!598)

(assert (=> b!180035 (= c!32250 ((_ is MissingVacant!598) lt!88823))))

(declare-fun e!118577 () Bool)

(assert (=> b!180035 (= e!118577 e!118581)))

(declare-fun bm!18175 () Bool)

(declare-fun arrayContainsKey!0 (array!7587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!18175 (= call!18178 (arrayContainsKey!0 (_keys!5586 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun b!180036 () Bool)

(assert (=> b!180036 (= e!118581 ((_ is Undefined!598) lt!88823))))

(declare-fun d!54059 () Bool)

(declare-fun e!118582 () Bool)

(assert (=> d!54059 e!118582))

(declare-fun res!85255 () Bool)

(assert (=> d!54059 (=> (not res!85255) (not e!118582))))

(declare-fun lt!88813 () tuple2!3328)

(assert (=> d!54059 (= res!85255 (_1!1675 lt!88813))))

(assert (=> d!54059 (= lt!88813 (tuple2!3329 true (LongMapFixedSize!2441 (defaultEntry!3696 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) (bvadd (_size!1269 thiss!1248) #b00000000000000000000000000000001) (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))) (array!7590 (store (arr!3593 (_values!3679 thiss!1248)) (index!4563 lt!88699) (ValueCellFull!1766 v!309)) (size!3902 (_values!3679 thiss!1248))) (_vacant!1269 thiss!1248))))))

(declare-fun lt!88830 () Unit!5451)

(declare-fun lt!88824 () Unit!5451)

(assert (=> d!54059 (= lt!88830 lt!88824)))

(declare-fun lt!88840 () array!7589)

(declare-fun lt!88818 () array!7587)

(assert (=> d!54059 (contains!1219 (getCurrentListMap!774 lt!88818 lt!88840 (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) (select (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (index!4563 lt!88699)))))

(declare-fun lemmaValidKeyInArrayIsInListMap!141 (array!7587 array!7589 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 32) Int) Unit!5451)

(assert (=> d!54059 (= lt!88824 (lemmaValidKeyInArrayIsInListMap!141 lt!88818 lt!88840 (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) (index!4563 lt!88699) (defaultEntry!3696 thiss!1248)))))

(assert (=> d!54059 (= lt!88840 (array!7590 (store (arr!3593 (_values!3679 thiss!1248)) (index!4563 lt!88699) (ValueCellFull!1766 v!309)) (size!3902 (_values!3679 thiss!1248))))))

(assert (=> d!54059 (= lt!88818 (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))))))

(declare-fun lt!88838 () Unit!5451)

(declare-fun lt!88826 () Unit!5451)

(assert (=> d!54059 (= lt!88838 lt!88826)))

(declare-fun lt!88825 () array!7587)

(assert (=> d!54059 (= (arrayCountValidKeys!0 lt!88825 (index!4563 lt!88699) (bvadd (index!4563 lt!88699) #b00000000000000000000000000000001)) #b00000000000000000000000000000001)))

(declare-fun lemmaValidKeyAtIImpliesCountKeysIsOne!0 (array!7587 (_ BitVec 32)) Unit!5451)

(assert (=> d!54059 (= lt!88826 (lemmaValidKeyAtIImpliesCountKeysIsOne!0 lt!88825 (index!4563 lt!88699)))))

(assert (=> d!54059 (= lt!88825 (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))))))

(declare-fun lt!88817 () Unit!5451)

(declare-fun lt!88832 () Unit!5451)

(assert (=> d!54059 (= lt!88817 lt!88832)))

(declare-fun lt!88812 () array!7587)

(assert (=> d!54059 (arrayContainsKey!0 lt!88812 key!828 #b00000000000000000000000000000000)))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7587 (_ BitVec 64) (_ BitVec 32)) Unit!5451)

(assert (=> d!54059 (= lt!88832 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!88812 key!828 (index!4563 lt!88699)))))

(assert (=> d!54059 (= lt!88812 (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))))))

(declare-fun lt!88833 () Unit!5451)

(declare-fun lt!88836 () Unit!5451)

(assert (=> d!54059 (= lt!88833 lt!88836)))

(assert (=> d!54059 (= (+!261 (getCurrentListMap!774 (_keys!5586 thiss!1248) (_values!3679 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) (tuple2!3327 key!828 v!309)) (getCurrentListMap!774 (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))) (array!7590 (store (arr!3593 (_values!3679 thiss!1248)) (index!4563 lt!88699) (ValueCellFull!1766 v!309)) (size!3902 (_values!3679 thiss!1248))) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)))))

(declare-fun lemmaAddValidKeyToArrayThenAddPairToListMap!50 (array!7587 array!7589 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 32) (_ BitVec 64) V!5273 Int) Unit!5451)

(assert (=> d!54059 (= lt!88836 (lemmaAddValidKeyToArrayThenAddPairToListMap!50 (_keys!5586 thiss!1248) (_values!3679 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) (index!4563 lt!88699) key!828 v!309 (defaultEntry!3696 thiss!1248)))))

(declare-fun lt!88820 () Unit!5451)

(declare-fun lt!88834 () Unit!5451)

(assert (=> d!54059 (= lt!88820 lt!88834)))

(assert (=> d!54059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))) (mask!8690 thiss!1248))))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 ((_ BitVec 64) array!7587 (_ BitVec 32) (_ BitVec 32)) Unit!5451)

(assert (=> d!54059 (= lt!88834 (lemmaPutValidKeyPreservesForallSeekEntryOrOpen!0 key!828 (_keys!5586 thiss!1248) (index!4563 lt!88699) (mask!8690 thiss!1248)))))

(declare-fun lt!88816 () Unit!5451)

(declare-fun lt!88819 () Unit!5451)

(assert (=> d!54059 (= lt!88816 lt!88819)))

(assert (=> d!54059 (= (arrayCountValidKeys!0 (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))) #b00000000000000000000000000000000 (size!3901 (_keys!5586 thiss!1248))) (bvadd (arrayCountValidKeys!0 (_keys!5586 thiss!1248) #b00000000000000000000000000000000 (size!3901 (_keys!5586 thiss!1248))) #b00000000000000000000000000000001))))

(declare-fun lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (array!7587 (_ BitVec 32) (_ BitVec 64)) Unit!5451)

(assert (=> d!54059 (= lt!88819 (lemmaAddValidKeyIncreasesNumberOfValidKeysInArray!0 (_keys!5586 thiss!1248) (index!4563 lt!88699) key!828))))

(declare-fun lt!88814 () Unit!5451)

(declare-fun lt!88839 () Unit!5451)

(assert (=> d!54059 (= lt!88814 lt!88839)))

(declare-fun lt!88835 () (_ BitVec 32))

(declare-fun lt!88822 () List!2289)

(assert (=> d!54059 (arrayNoDuplicates!0 (array!7588 (store (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88699) key!828) (size!3901 (_keys!5586 thiss!1248))) lt!88835 lt!88822)))

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!7587 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!2289) Unit!5451)

(assert (=> d!54059 (= lt!88839 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!5586 thiss!1248) key!828 (index!4563 lt!88699) lt!88835 lt!88822))))

(assert (=> d!54059 (= lt!88822 Nil!2286)))

(assert (=> d!54059 (= lt!88835 #b00000000000000000000000000000000)))

(declare-fun lt!88811 () Unit!5451)

(assert (=> d!54059 (= lt!88811 e!118580)))

(declare-fun c!32252 () Bool)

(assert (=> d!54059 (= c!32252 (arrayContainsKey!0 (_keys!5586 thiss!1248) key!828 #b00000000000000000000000000000000))))

(declare-fun lt!88815 () Unit!5451)

(declare-fun e!118578 () Unit!5451)

(assert (=> d!54059 (= lt!88815 e!118578)))

(declare-fun c!32251 () Bool)

(assert (=> d!54059 (= c!32251 (contains!1219 (getCurrentListMap!774 (_keys!5586 thiss!1248) (_values!3679 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3696 thiss!1248)) key!828))))

(assert (=> d!54059 (valid!1034 thiss!1248)))

(assert (=> d!54059 (= (updateHelperNewKey!92 thiss!1248 key!828 v!309 (index!4563 lt!88699)) lt!88813)))

(declare-fun lt!88831 () SeekEntryResult!598)

(declare-fun call!18180 () Bool)

(declare-fun c!32253 () Bool)

(declare-fun bm!18176 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!18176 (= call!18180 (inRange!0 (ite c!32251 (index!4561 lt!88831) (ite c!32253 (index!4560 lt!88823) (index!4563 lt!88823))) (mask!8690 thiss!1248)))))

(declare-fun b!180037 () Bool)

(assert (=> b!180037 (= e!118582 (= (map!1913 (_2!1675 lt!88813)) (+!261 (map!1913 thiss!1248) (tuple2!3327 key!828 v!309))))))

(declare-fun b!180038 () Bool)

(declare-fun e!118583 () Bool)

(assert (=> b!180038 (= e!118583 (not call!18178))))

(declare-fun b!180039 () Bool)

(declare-fun res!85257 () Bool)

(assert (=> b!180039 (= res!85257 call!18180)))

(declare-fun e!118584 () Bool)

(assert (=> b!180039 (=> (not res!85257) (not e!118584))))

(declare-fun b!180040 () Bool)

(declare-fun res!85260 () Bool)

(assert (=> b!180040 (= res!85260 (= (select (arr!3592 (_keys!5586 thiss!1248)) (index!4563 lt!88823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!180040 (=> (not res!85260) (not e!118579))))

(declare-fun b!180041 () Bool)

(declare-fun Unit!5455 () Unit!5451)

(assert (=> b!180041 (= e!118580 Unit!5455)))

(declare-fun b!180042 () Bool)

(assert (=> b!180042 (= e!118584 (= (select (arr!3592 (_keys!5586 thiss!1248)) (index!4561 lt!88831)) key!828))))

(declare-fun b!180043 () Bool)

(declare-fun res!85254 () Bool)

(assert (=> b!180043 (=> (not res!85254) (not e!118583))))

(assert (=> b!180043 (= res!85254 call!18179)))

(assert (=> b!180043 (= e!118577 e!118583)))

(declare-fun b!180044 () Bool)

(declare-fun res!85262 () Bool)

(assert (=> b!180044 (=> (not res!85262) (not e!118582))))

(assert (=> b!180044 (= res!85262 (contains!1219 (map!1913 (_2!1675 lt!88813)) key!828))))

(declare-fun b!180045 () Bool)

(declare-fun Unit!5456 () Unit!5451)

(assert (=> b!180045 (= e!118578 Unit!5456)))

(declare-fun lt!88821 () Unit!5451)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!140 (array!7587 array!7589 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 64) Int) Unit!5451)

(assert (=> b!180045 (= lt!88821 (lemmaInListMapThenSeekEntryOrOpenFindsIt!140 (_keys!5586 thiss!1248) (_values!3679 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) key!828 (defaultEntry!3696 thiss!1248)))))

(declare-fun call!18181 () SeekEntryResult!598)

(assert (=> b!180045 (= lt!88831 call!18181)))

(declare-fun res!85259 () Bool)

(assert (=> b!180045 (= res!85259 ((_ is Found!598) lt!88831))))

(assert (=> b!180045 (=> (not res!85259) (not e!118584))))

(assert (=> b!180045 e!118584))

(declare-fun lt!88829 () Unit!5451)

(assert (=> b!180045 (= lt!88829 lt!88821)))

(assert (=> b!180045 false))

(declare-fun bm!18177 () Bool)

(assert (=> bm!18177 (= call!18181 (seekEntryOrOpen!0 key!828 (_keys!5586 thiss!1248) (mask!8690 thiss!1248)))))

(declare-fun bm!18178 () Bool)

(assert (=> bm!18178 (= call!18179 call!18180)))

(declare-fun b!180046 () Bool)

(declare-fun res!85256 () Bool)

(assert (=> b!180046 (=> (not res!85256) (not e!118583))))

(assert (=> b!180046 (= res!85256 (= (select (arr!3592 (_keys!5586 thiss!1248)) (index!4560 lt!88823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!180047 () Bool)

(declare-fun res!85258 () Bool)

(assert (=> b!180047 (=> (not res!85258) (not e!118582))))

(assert (=> b!180047 (= res!85258 (valid!1034 (_2!1675 lt!88813)))))

(declare-fun b!180048 () Bool)

(declare-fun lt!88828 () Unit!5451)

(assert (=> b!180048 (= e!118578 lt!88828)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!135 (array!7587 array!7589 (_ BitVec 32) (_ BitVec 32) V!5273 V!5273 (_ BitVec 64) Int) Unit!5451)

(assert (=> b!180048 (= lt!88828 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!135 (_keys!5586 thiss!1248) (_values!3679 thiss!1248) (mask!8690 thiss!1248) (extraKeys!3433 thiss!1248) (zeroValue!3537 thiss!1248) (minValue!3537 thiss!1248) key!828 (defaultEntry!3696 thiss!1248)))))

(assert (=> b!180048 (= lt!88823 call!18181)))

(assert (=> b!180048 (= c!32253 ((_ is MissingZero!598) lt!88823))))

(assert (=> b!180048 e!118577))

(assert (= (and d!54059 c!32251) b!180045))

(assert (= (and d!54059 (not c!32251)) b!180048))

(assert (= (and b!180045 res!85259) b!180039))

(assert (= (and b!180039 res!85257) b!180042))

(assert (= (and b!180048 c!32253) b!180043))

(assert (= (and b!180048 (not c!32253)) b!180035))

(assert (= (and b!180043 res!85254) b!180046))

(assert (= (and b!180046 res!85256) b!180038))

(assert (= (and b!180035 c!32250) b!180034))

(assert (= (and b!180035 (not c!32250)) b!180036))

(assert (= (and b!180034 res!85261) b!180040))

(assert (= (and b!180040 res!85260) b!180032))

(assert (= (or b!180043 b!180034) bm!18178))

(assert (= (or b!180038 b!180032) bm!18175))

(assert (= (or b!180039 bm!18178) bm!18176))

(assert (= (or b!180045 b!180048) bm!18177))

(assert (= (and d!54059 c!32252) b!180033))

(assert (= (and d!54059 (not c!32252)) b!180041))

(assert (= (and d!54059 res!85255) b!180047))

(assert (= (and b!180047 res!85258) b!180044))

(assert (= (and b!180044 res!85262) b!180037))

(declare-fun m!207587 () Bool)

(assert (=> b!180048 m!207587))

(declare-fun m!207589 () Bool)

(assert (=> bm!18176 m!207589))

(declare-fun m!207591 () Bool)

(assert (=> b!180047 m!207591))

(declare-fun m!207593 () Bool)

(assert (=> d!54059 m!207593))

(declare-fun m!207595 () Bool)

(assert (=> d!54059 m!207595))

(declare-fun m!207597 () Bool)

(assert (=> d!54059 m!207597))

(declare-fun m!207599 () Bool)

(assert (=> d!54059 m!207599))

(declare-fun m!207601 () Bool)

(assert (=> d!54059 m!207601))

(declare-fun m!207603 () Bool)

(assert (=> d!54059 m!207603))

(assert (=> d!54059 m!207593))

(assert (=> d!54059 m!207595))

(declare-fun m!207605 () Bool)

(assert (=> d!54059 m!207605))

(declare-fun m!207607 () Bool)

(assert (=> d!54059 m!207607))

(assert (=> d!54059 m!207607))

(declare-fun m!207609 () Bool)

(assert (=> d!54059 m!207609))

(declare-fun m!207611 () Bool)

(assert (=> d!54059 m!207611))

(declare-fun m!207613 () Bool)

(assert (=> d!54059 m!207613))

(declare-fun m!207615 () Bool)

(assert (=> d!54059 m!207615))

(declare-fun m!207617 () Bool)

(assert (=> d!54059 m!207617))

(declare-fun m!207619 () Bool)

(assert (=> d!54059 m!207619))

(declare-fun m!207621 () Bool)

(assert (=> d!54059 m!207621))

(declare-fun m!207623 () Bool)

(assert (=> d!54059 m!207623))

(assert (=> d!54059 m!207533))

(assert (=> d!54059 m!207607))

(declare-fun m!207625 () Bool)

(assert (=> d!54059 m!207625))

(declare-fun m!207627 () Bool)

(assert (=> d!54059 m!207627))

(declare-fun m!207629 () Bool)

(assert (=> d!54059 m!207629))

(declare-fun m!207631 () Bool)

(assert (=> d!54059 m!207631))

(assert (=> d!54059 m!207473))

(declare-fun m!207633 () Bool)

(assert (=> d!54059 m!207633))

(declare-fun m!207635 () Bool)

(assert (=> d!54059 m!207635))

(declare-fun m!207637 () Bool)

(assert (=> b!180033 m!207637))

(assert (=> b!180033 m!207607))

(assert (=> b!180033 m!207607))

(assert (=> b!180033 m!207609))

(declare-fun m!207639 () Bool)

(assert (=> b!180037 m!207639))

(declare-fun m!207641 () Bool)

(assert (=> b!180037 m!207641))

(assert (=> b!180037 m!207641))

(declare-fun m!207643 () Bool)

(assert (=> b!180037 m!207643))

(assert (=> bm!18175 m!207597))

(declare-fun m!207645 () Bool)

(assert (=> b!180046 m!207645))

(declare-fun m!207647 () Bool)

(assert (=> b!180045 m!207647))

(assert (=> bm!18177 m!207485))

(assert (=> b!180044 m!207639))

(assert (=> b!180044 m!207639))

(declare-fun m!207649 () Bool)

(assert (=> b!180044 m!207649))

(declare-fun m!207651 () Bool)

(assert (=> b!180042 m!207651))

(declare-fun m!207653 () Bool)

(assert (=> b!180040 m!207653))

(assert (=> b!179884 d!54059))

(declare-fun mapIsEmpty!7231 () Bool)

(declare-fun mapRes!7231 () Bool)

(assert (=> mapIsEmpty!7231 mapRes!7231))

(declare-fun condMapEmpty!7231 () Bool)

(declare-fun mapDefault!7231 () ValueCell!1766)

(assert (=> mapNonEmpty!7222 (= condMapEmpty!7231 (= mapRest!7222 ((as const (Array (_ BitVec 32) ValueCell!1766)) mapDefault!7231)))))

(declare-fun e!118590 () Bool)

(assert (=> mapNonEmpty!7222 (= tp!16072 (and e!118590 mapRes!7231))))

(declare-fun b!180055 () Bool)

(declare-fun e!118589 () Bool)

(assert (=> b!180055 (= e!118589 tp_is_empty!4219)))

(declare-fun b!180056 () Bool)

(assert (=> b!180056 (= e!118590 tp_is_empty!4219)))

(declare-fun mapNonEmpty!7231 () Bool)

(declare-fun tp!16087 () Bool)

(assert (=> mapNonEmpty!7231 (= mapRes!7231 (and tp!16087 e!118589))))

(declare-fun mapKey!7231 () (_ BitVec 32))

(declare-fun mapValue!7231 () ValueCell!1766)

(declare-fun mapRest!7231 () (Array (_ BitVec 32) ValueCell!1766))

(assert (=> mapNonEmpty!7231 (= mapRest!7222 (store mapRest!7231 mapKey!7231 mapValue!7231))))

(assert (= (and mapNonEmpty!7222 condMapEmpty!7231) mapIsEmpty!7231))

(assert (= (and mapNonEmpty!7222 (not condMapEmpty!7231)) mapNonEmpty!7231))

(assert (= (and mapNonEmpty!7231 ((_ is ValueCellFull!1766) mapValue!7231)) b!180055))

(assert (= (and mapNonEmpty!7222 ((_ is ValueCellFull!1766) mapDefault!7231)) b!180056))

(declare-fun m!207655 () Bool)

(assert (=> mapNonEmpty!7231 m!207655))

(check-sat (not b!179994) (not b!179996) (not b!180044) (not b!179995) (not d!54057) (not d!54045) (not b_next!4447) (not b!180037) (not mapNonEmpty!7231) (not b!179961) (not bm!18177) (not d!54043) b_and!10955 (not d!54059) (not b!179959) (not d!54041) (not b!180045) (not b!179968) (not b!179997) (not b!179993) (not d!54055) (not bm!18176) (not b!180048) tp_is_empty!4219 (not b!180033) (not b!179970) (not b!179983) (not b!180047) (not b!179960) (not d!54049) (not bm!18175) (not d!54047))
(check-sat b_and!10955 (not b_next!4447))
