; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75440 () Bool)

(assert start!75440)

(declare-fun b!888059 () Bool)

(declare-fun b_free!15555 () Bool)

(declare-fun b_next!15555 () Bool)

(assert (=> b!888059 (= b_free!15555 (not b_next!15555))))

(declare-fun tp!54612 () Bool)

(declare-fun b_and!25791 () Bool)

(assert (=> b!888059 (= tp!54612 b_and!25791)))

(declare-fun res!602257 () Bool)

(declare-fun e!494764 () Bool)

(assert (=> start!75440 (=> (not res!602257) (not e!494764))))

(declare-datatypes ((array!51734 0))(
  ( (array!51735 (arr!24879 (Array (_ BitVec 32) (_ BitVec 64))) (size!25319 (_ BitVec 32))) )
))
(declare-datatypes ((V!28809 0))(
  ( (V!28810 (val!8992 Int)) )
))
(declare-datatypes ((ValueCell!8460 0))(
  ( (ValueCellFull!8460 (v!11464 V!28809)) (EmptyCell!8460) )
))
(declare-datatypes ((array!51736 0))(
  ( (array!51737 (arr!24880 (Array (_ BitVec 32) ValueCell!8460)) (size!25320 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3936 0))(
  ( (LongMapFixedSize!3937 (defaultEntry!5159 Int) (mask!25571 (_ BitVec 32)) (extraKeys!4853 (_ BitVec 32)) (zeroValue!4957 V!28809) (minValue!4957 V!28809) (_size!2023 (_ BitVec 32)) (_keys!9836 array!51734) (_values!5144 array!51736) (_vacant!2023 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3936)

(declare-fun valid!1535 (LongMapFixedSize!3936) Bool)

(assert (=> start!75440 (= res!602257 (valid!1535 thiss!1181))))

(assert (=> start!75440 e!494764))

(declare-fun e!494765 () Bool)

(assert (=> start!75440 e!494765))

(assert (=> start!75440 true))

(declare-fun mapIsEmpty!28357 () Bool)

(declare-fun mapRes!28357 () Bool)

(assert (=> mapIsEmpty!28357 mapRes!28357))

(declare-fun b!888053 () Bool)

(declare-fun e!494762 () Bool)

(declare-fun tp_is_empty!17883 () Bool)

(assert (=> b!888053 (= e!494762 tp_is_empty!17883)))

(declare-fun b!888054 () Bool)

(declare-fun res!602258 () Bool)

(assert (=> b!888054 (=> (not res!602258) (not e!494764))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4318 (LongMapFixedSize!3936 (_ BitVec 64)) Bool)

(assert (=> b!888054 (= res!602258 (contains!4318 thiss!1181 key!785))))

(declare-fun b!888055 () Bool)

(declare-fun e!494760 () Bool)

(declare-fun e!494761 () Bool)

(assert (=> b!888055 (= e!494760 (and e!494761 mapRes!28357))))

(declare-fun condMapEmpty!28357 () Bool)

(declare-fun mapDefault!28357 () ValueCell!8460)

(assert (=> b!888055 (= condMapEmpty!28357 (= (arr!24880 (_values!5144 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8460)) mapDefault!28357)))))

(declare-fun b!888056 () Bool)

(declare-datatypes ((Option!445 0))(
  ( (Some!444 (v!11465 V!28809)) (None!443) )
))
(declare-fun isDefined!318 (Option!445) Bool)

(declare-datatypes ((tuple2!11930 0))(
  ( (tuple2!11931 (_1!5976 (_ BitVec 64)) (_2!5976 V!28809)) )
))
(declare-datatypes ((List!17687 0))(
  ( (Nil!17684) (Cons!17683 (h!18814 tuple2!11930) (t!24982 List!17687)) )
))
(declare-fun getValueByKey!439 (List!17687 (_ BitVec 64)) Option!445)

(declare-datatypes ((ListLongMap!10627 0))(
  ( (ListLongMap!10628 (toList!5329 List!17687)) )
))
(declare-fun map!12106 (LongMapFixedSize!3936) ListLongMap!10627)

(assert (=> b!888056 (= e!494764 (not (isDefined!318 (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785))))))

(declare-fun b!888057 () Bool)

(declare-fun res!602256 () Bool)

(assert (=> b!888057 (=> (not res!602256) (not e!494764))))

(assert (=> b!888057 (= res!602256 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!888058 () Bool)

(assert (=> b!888058 (= e!494761 tp_is_empty!17883)))

(declare-fun mapNonEmpty!28357 () Bool)

(declare-fun tp!54611 () Bool)

(assert (=> mapNonEmpty!28357 (= mapRes!28357 (and tp!54611 e!494762))))

(declare-fun mapRest!28357 () (Array (_ BitVec 32) ValueCell!8460))

(declare-fun mapKey!28357 () (_ BitVec 32))

(declare-fun mapValue!28357 () ValueCell!8460)

(assert (=> mapNonEmpty!28357 (= (arr!24880 (_values!5144 thiss!1181)) (store mapRest!28357 mapKey!28357 mapValue!28357))))

(declare-fun array_inv!19582 (array!51734) Bool)

(declare-fun array_inv!19583 (array!51736) Bool)

(assert (=> b!888059 (= e!494765 (and tp!54612 tp_is_empty!17883 (array_inv!19582 (_keys!9836 thiss!1181)) (array_inv!19583 (_values!5144 thiss!1181)) e!494760))))

(assert (= (and start!75440 res!602257) b!888057))

(assert (= (and b!888057 res!602256) b!888054))

(assert (= (and b!888054 res!602258) b!888056))

(assert (= (and b!888055 condMapEmpty!28357) mapIsEmpty!28357))

(assert (= (and b!888055 (not condMapEmpty!28357)) mapNonEmpty!28357))

(get-info :version)

(assert (= (and mapNonEmpty!28357 ((_ is ValueCellFull!8460) mapValue!28357)) b!888053))

(assert (= (and b!888055 ((_ is ValueCellFull!8460) mapDefault!28357)) b!888058))

(assert (= b!888059 b!888055))

(assert (= start!75440 b!888059))

(declare-fun m!827471 () Bool)

(assert (=> b!888059 m!827471))

(declare-fun m!827473 () Bool)

(assert (=> b!888059 m!827473))

(declare-fun m!827475 () Bool)

(assert (=> b!888056 m!827475))

(declare-fun m!827477 () Bool)

(assert (=> b!888056 m!827477))

(assert (=> b!888056 m!827477))

(declare-fun m!827479 () Bool)

(assert (=> b!888056 m!827479))

(declare-fun m!827481 () Bool)

(assert (=> start!75440 m!827481))

(declare-fun m!827483 () Bool)

(assert (=> mapNonEmpty!28357 m!827483))

(declare-fun m!827485 () Bool)

(assert (=> b!888054 m!827485))

(check-sat tp_is_empty!17883 (not b_next!15555) (not b!888054) (not b!888059) (not b!888056) (not mapNonEmpty!28357) b_and!25791 (not start!75440))
(check-sat b_and!25791 (not b_next!15555))
(get-model)

(declare-fun d!109991 () Bool)

(declare-fun isEmpty!675 (Option!445) Bool)

(assert (=> d!109991 (= (isDefined!318 (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785)) (not (isEmpty!675 (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785))))))

(declare-fun bs!24905 () Bool)

(assert (= bs!24905 d!109991))

(assert (=> bs!24905 m!827477))

(declare-fun m!827503 () Bool)

(assert (=> bs!24905 m!827503))

(assert (=> b!888056 d!109991))

(declare-fun b!888091 () Bool)

(declare-fun e!494789 () Option!445)

(assert (=> b!888091 (= e!494789 (getValueByKey!439 (t!24982 (toList!5329 (map!12106 thiss!1181))) key!785))))

(declare-fun b!888090 () Bool)

(declare-fun e!494788 () Option!445)

(assert (=> b!888090 (= e!494788 e!494789)))

(declare-fun c!93760 () Bool)

(assert (=> b!888090 (= c!93760 (and ((_ is Cons!17683) (toList!5329 (map!12106 thiss!1181))) (not (= (_1!5976 (h!18814 (toList!5329 (map!12106 thiss!1181)))) key!785))))))

(declare-fun b!888092 () Bool)

(assert (=> b!888092 (= e!494789 None!443)))

(declare-fun b!888089 () Bool)

(assert (=> b!888089 (= e!494788 (Some!444 (_2!5976 (h!18814 (toList!5329 (map!12106 thiss!1181))))))))

(declare-fun d!109993 () Bool)

(declare-fun c!93759 () Bool)

(assert (=> d!109993 (= c!93759 (and ((_ is Cons!17683) (toList!5329 (map!12106 thiss!1181))) (= (_1!5976 (h!18814 (toList!5329 (map!12106 thiss!1181)))) key!785)))))

(assert (=> d!109993 (= (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785) e!494788)))

(assert (= (and d!109993 c!93759) b!888089))

(assert (= (and d!109993 (not c!93759)) b!888090))

(assert (= (and b!888090 c!93760) b!888091))

(assert (= (and b!888090 (not c!93760)) b!888092))

(declare-fun m!827505 () Bool)

(assert (=> b!888091 m!827505))

(assert (=> b!888056 d!109993))

(declare-fun d!109995 () Bool)

(declare-fun getCurrentListMap!2615 (array!51734 array!51736 (_ BitVec 32) (_ BitVec 32) V!28809 V!28809 (_ BitVec 32) Int) ListLongMap!10627)

(assert (=> d!109995 (= (map!12106 thiss!1181) (getCurrentListMap!2615 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)))))

(declare-fun bs!24906 () Bool)

(assert (= bs!24906 d!109995))

(declare-fun m!827507 () Bool)

(assert (=> bs!24906 m!827507))

(assert (=> b!888056 d!109995))

(declare-fun b!888113 () Bool)

(declare-fun e!494804 () Bool)

(declare-fun e!494801 () Bool)

(assert (=> b!888113 (= e!494804 e!494801)))

(declare-fun c!93773 () Bool)

(assert (=> b!888113 (= c!93773 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!109997 () Bool)

(declare-fun lt!401581 () Bool)

(declare-fun contains!4319 (ListLongMap!10627 (_ BitVec 64)) Bool)

(assert (=> d!109997 (= lt!401581 (contains!4319 (map!12106 thiss!1181) key!785))))

(assert (=> d!109997 (= lt!401581 e!494804)))

(declare-fun c!93774 () Bool)

(assert (=> d!109997 (= c!93774 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!109997 (valid!1535 thiss!1181)))

(assert (=> d!109997 (= (contains!4318 thiss!1181 key!785) lt!401581)))

(declare-fun bm!39407 () Bool)

(declare-fun call!39411 () ListLongMap!10627)

(assert (=> bm!39407 (= call!39411 (getCurrentListMap!2615 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)))))

(declare-fun b!888114 () Bool)

(declare-fun e!494803 () Bool)

(assert (=> b!888114 (= e!494803 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!888115 () Bool)

(declare-fun e!494800 () Bool)

(assert (=> b!888115 (= e!494800 true)))

(declare-datatypes ((Unit!30260 0))(
  ( (Unit!30261) )
))
(declare-fun lt!401570 () Unit!30260)

(declare-datatypes ((SeekEntryResult!8766 0))(
  ( (MissingZero!8766 (index!37435 (_ BitVec 32))) (Found!8766 (index!37436 (_ BitVec 32))) (Intermediate!8766 (undefined!9578 Bool) (index!37437 (_ BitVec 32)) (x!75346 (_ BitVec 32))) (Undefined!8766) (MissingVacant!8766 (index!37438 (_ BitVec 32))) )
))
(declare-fun lt!401577 () SeekEntryResult!8766)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51734 (_ BitVec 64) (_ BitVec 32)) Unit!30260)

(assert (=> b!888115 (= lt!401570 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9836 thiss!1181) key!785 (index!37436 lt!401577)))))

(declare-fun call!39412 () Bool)

(assert (=> b!888115 call!39412))

(declare-fun lt!401569 () Unit!30260)

(assert (=> b!888115 (= lt!401569 lt!401570)))

(declare-fun lt!401568 () Unit!30260)

(declare-fun lemmaValidKeyInArrayIsInListMap!204 (array!51734 array!51736 (_ BitVec 32) (_ BitVec 32) V!28809 V!28809 (_ BitVec 32) Int) Unit!30260)

(assert (=> b!888115 (= lt!401568 (lemmaValidKeyInArrayIsInListMap!204 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) (index!37436 lt!401577) (defaultEntry!5159 thiss!1181)))))

(declare-fun call!39410 () Bool)

(assert (=> b!888115 call!39410))

(declare-fun lt!401578 () Unit!30260)

(assert (=> b!888115 (= lt!401578 lt!401568)))

(declare-fun b!888116 () Bool)

(assert (=> b!888116 (= e!494804 (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!888117 () Bool)

(assert (=> b!888117 (= e!494800 false)))

(declare-fun c!93775 () Bool)

(assert (=> b!888117 (= c!93775 call!39410)))

(declare-fun lt!401573 () Unit!30260)

(declare-fun e!494802 () Unit!30260)

(assert (=> b!888117 (= lt!401573 e!494802)))

(declare-fun b!888118 () Bool)

(declare-fun c!93772 () Bool)

(assert (=> b!888118 (= c!93772 ((_ is Found!8766) lt!401577))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51734 (_ BitVec 32)) SeekEntryResult!8766)

(assert (=> b!888118 (= lt!401577 (seekEntry!0 key!785 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(assert (=> b!888118 (= e!494801 e!494800)))

(declare-fun b!888119 () Bool)

(assert (=> b!888119 (= e!494801 (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39408 () Bool)

(assert (=> bm!39408 (= call!39410 (contains!4319 call!39411 (ite c!93772 (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401577)) key!785)))))

(declare-fun b!888120 () Bool)

(assert (=> b!888120 (= e!494803 call!39412)))

(declare-fun b!888121 () Bool)

(assert (=> b!888121 false))

(declare-fun lt!401571 () Unit!30260)

(declare-fun lt!401575 () Unit!30260)

(assert (=> b!888121 (= lt!401571 lt!401575)))

(declare-fun lt!401579 () SeekEntryResult!8766)

(declare-fun lt!401574 () (_ BitVec 32))

(assert (=> b!888121 (and ((_ is Found!8766) lt!401579) (= (index!37436 lt!401579) lt!401574))))

(assert (=> b!888121 (= lt!401579 (seekEntry!0 key!785 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51734 (_ BitVec 32)) Unit!30260)

(assert (=> b!888121 (= lt!401575 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401574 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(declare-fun lt!401576 () Unit!30260)

(declare-fun lt!401572 () Unit!30260)

(assert (=> b!888121 (= lt!401576 lt!401572)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51734 (_ BitVec 32)) Bool)

(assert (=> b!888121 (arrayForallSeekEntryOrOpenFound!0 lt!401574 (_keys!9836 thiss!1181) (mask!25571 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30260)

(assert (=> b!888121 (= lt!401572 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9836 thiss!1181) (mask!25571 thiss!1181) #b00000000000000000000000000000000 lt!401574))))

(declare-fun arrayScanForKey!0 (array!51734 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888121 (= lt!401574 (arrayScanForKey!0 (_keys!9836 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!401580 () Unit!30260)

(declare-fun lt!401582 () Unit!30260)

(assert (=> b!888121 (= lt!401580 lt!401582)))

(assert (=> b!888121 e!494803))

(declare-fun c!93771 () Bool)

(assert (=> b!888121 (= c!93771 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!157 (array!51734 array!51736 (_ BitVec 32) (_ BitVec 32) V!28809 V!28809 (_ BitVec 64) Int) Unit!30260)

(assert (=> b!888121 (= lt!401582 (lemmaKeyInListMapIsInArray!157 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) key!785 (defaultEntry!5159 thiss!1181)))))

(declare-fun Unit!30262 () Unit!30260)

(assert (=> b!888121 (= e!494802 Unit!30262)))

(declare-fun bm!39409 () Bool)

(declare-fun arrayContainsKey!0 (array!51734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39409 (= call!39412 (arrayContainsKey!0 (_keys!9836 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!888122 () Bool)

(declare-fun Unit!30263 () Unit!30260)

(assert (=> b!888122 (= e!494802 Unit!30263)))

(assert (= (and d!109997 c!93774) b!888116))

(assert (= (and d!109997 (not c!93774)) b!888113))

(assert (= (and b!888113 c!93773) b!888119))

(assert (= (and b!888113 (not c!93773)) b!888118))

(assert (= (and b!888118 c!93772) b!888115))

(assert (= (and b!888118 (not c!93772)) b!888117))

(assert (= (and b!888117 c!93775) b!888121))

(assert (= (and b!888117 (not c!93775)) b!888122))

(assert (= (and b!888121 c!93771) b!888120))

(assert (= (and b!888121 (not c!93771)) b!888114))

(assert (= (or b!888115 b!888120) bm!39409))

(assert (= (or b!888115 b!888117) bm!39407))

(assert (= (or b!888115 b!888117) bm!39408))

(assert (=> bm!39407 m!827507))

(declare-fun m!827509 () Bool)

(assert (=> b!888121 m!827509))

(declare-fun m!827511 () Bool)

(assert (=> b!888121 m!827511))

(declare-fun m!827513 () Bool)

(assert (=> b!888121 m!827513))

(declare-fun m!827515 () Bool)

(assert (=> b!888121 m!827515))

(declare-fun m!827517 () Bool)

(assert (=> b!888121 m!827517))

(declare-fun m!827519 () Bool)

(assert (=> b!888121 m!827519))

(declare-fun m!827521 () Bool)

(assert (=> b!888115 m!827521))

(declare-fun m!827523 () Bool)

(assert (=> b!888115 m!827523))

(declare-fun m!827525 () Bool)

(assert (=> bm!39409 m!827525))

(assert (=> b!888118 m!827519))

(declare-fun m!827527 () Bool)

(assert (=> bm!39408 m!827527))

(declare-fun m!827529 () Bool)

(assert (=> bm!39408 m!827529))

(assert (=> d!109997 m!827475))

(assert (=> d!109997 m!827475))

(declare-fun m!827531 () Bool)

(assert (=> d!109997 m!827531))

(assert (=> d!109997 m!827481))

(assert (=> b!888054 d!109997))

(declare-fun d!109999 () Bool)

(assert (=> d!109999 (= (array_inv!19582 (_keys!9836 thiss!1181)) (bvsge (size!25319 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888059 d!109999))

(declare-fun d!110001 () Bool)

(assert (=> d!110001 (= (array_inv!19583 (_values!5144 thiss!1181)) (bvsge (size!25320 (_values!5144 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888059 d!110001))

(declare-fun d!110003 () Bool)

(declare-fun res!602274 () Bool)

(declare-fun e!494807 () Bool)

(assert (=> d!110003 (=> (not res!602274) (not e!494807))))

(declare-fun simpleValid!289 (LongMapFixedSize!3936) Bool)

(assert (=> d!110003 (= res!602274 (simpleValid!289 thiss!1181))))

(assert (=> d!110003 (= (valid!1535 thiss!1181) e!494807)))

(declare-fun b!888129 () Bool)

(declare-fun res!602275 () Bool)

(assert (=> b!888129 (=> (not res!602275) (not e!494807))))

(declare-fun arrayCountValidKeys!0 (array!51734 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888129 (= res!602275 (= (arrayCountValidKeys!0 (_keys!9836 thiss!1181) #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))) (_size!2023 thiss!1181)))))

(declare-fun b!888130 () Bool)

(declare-fun res!602276 () Bool)

(assert (=> b!888130 (=> (not res!602276) (not e!494807))))

(assert (=> b!888130 (= res!602276 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(declare-fun b!888131 () Bool)

(declare-datatypes ((List!17688 0))(
  ( (Nil!17685) (Cons!17684 (h!18815 (_ BitVec 64)) (t!24983 List!17688)) )
))
(declare-fun arrayNoDuplicates!0 (array!51734 (_ BitVec 32) List!17688) Bool)

(assert (=> b!888131 (= e!494807 (arrayNoDuplicates!0 (_keys!9836 thiss!1181) #b00000000000000000000000000000000 Nil!17685))))

(assert (= (and d!110003 res!602274) b!888129))

(assert (= (and b!888129 res!602275) b!888130))

(assert (= (and b!888130 res!602276) b!888131))

(declare-fun m!827533 () Bool)

(assert (=> d!110003 m!827533))

(declare-fun m!827535 () Bool)

(assert (=> b!888129 m!827535))

(declare-fun m!827537 () Bool)

(assert (=> b!888130 m!827537))

(declare-fun m!827539 () Bool)

(assert (=> b!888131 m!827539))

(assert (=> start!75440 d!110003))

(declare-fun b!888139 () Bool)

(declare-fun e!494812 () Bool)

(assert (=> b!888139 (= e!494812 tp_is_empty!17883)))

(declare-fun b!888138 () Bool)

(declare-fun e!494813 () Bool)

(assert (=> b!888138 (= e!494813 tp_is_empty!17883)))

(declare-fun mapIsEmpty!28363 () Bool)

(declare-fun mapRes!28363 () Bool)

(assert (=> mapIsEmpty!28363 mapRes!28363))

(declare-fun mapNonEmpty!28363 () Bool)

(declare-fun tp!54621 () Bool)

(assert (=> mapNonEmpty!28363 (= mapRes!28363 (and tp!54621 e!494813))))

(declare-fun mapRest!28363 () (Array (_ BitVec 32) ValueCell!8460))

(declare-fun mapKey!28363 () (_ BitVec 32))

(declare-fun mapValue!28363 () ValueCell!8460)

(assert (=> mapNonEmpty!28363 (= mapRest!28357 (store mapRest!28363 mapKey!28363 mapValue!28363))))

(declare-fun condMapEmpty!28363 () Bool)

(declare-fun mapDefault!28363 () ValueCell!8460)

(assert (=> mapNonEmpty!28357 (= condMapEmpty!28363 (= mapRest!28357 ((as const (Array (_ BitVec 32) ValueCell!8460)) mapDefault!28363)))))

(assert (=> mapNonEmpty!28357 (= tp!54611 (and e!494812 mapRes!28363))))

(assert (= (and mapNonEmpty!28357 condMapEmpty!28363) mapIsEmpty!28363))

(assert (= (and mapNonEmpty!28357 (not condMapEmpty!28363)) mapNonEmpty!28363))

(assert (= (and mapNonEmpty!28363 ((_ is ValueCellFull!8460) mapValue!28363)) b!888138))

(assert (= (and mapNonEmpty!28357 ((_ is ValueCellFull!8460) mapDefault!28363)) b!888139))

(declare-fun m!827541 () Bool)

(assert (=> mapNonEmpty!28363 m!827541))

(check-sat (not b!888129) (not d!110003) (not bm!39407) (not b!888130) (not b_next!15555) (not b!888118) (not mapNonEmpty!28363) (not d!109995) (not b!888091) b_and!25791 tp_is_empty!17883 (not d!109991) (not bm!39409) (not d!109997) (not b!888115) (not b!888131) (not bm!39408) (not b!888121))
(check-sat b_and!25791 (not b_next!15555))
(get-model)

(declare-fun d!110005 () Bool)

(declare-fun e!494818 () Bool)

(assert (=> d!110005 e!494818))

(declare-fun res!602279 () Bool)

(assert (=> d!110005 (=> res!602279 e!494818)))

(declare-fun lt!401591 () Bool)

(assert (=> d!110005 (= res!602279 (not lt!401591))))

(declare-fun lt!401594 () Bool)

(assert (=> d!110005 (= lt!401591 lt!401594)))

(declare-fun lt!401593 () Unit!30260)

(declare-fun e!494819 () Unit!30260)

(assert (=> d!110005 (= lt!401593 e!494819)))

(declare-fun c!93778 () Bool)

(assert (=> d!110005 (= c!93778 lt!401594)))

(declare-fun containsKey!419 (List!17687 (_ BitVec 64)) Bool)

(assert (=> d!110005 (= lt!401594 (containsKey!419 (toList!5329 (map!12106 thiss!1181)) key!785))))

(assert (=> d!110005 (= (contains!4319 (map!12106 thiss!1181) key!785) lt!401591)))

(declare-fun b!888146 () Bool)

(declare-fun lt!401592 () Unit!30260)

(assert (=> b!888146 (= e!494819 lt!401592)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!315 (List!17687 (_ BitVec 64)) Unit!30260)

(assert (=> b!888146 (= lt!401592 (lemmaContainsKeyImpliesGetValueByKeyDefined!315 (toList!5329 (map!12106 thiss!1181)) key!785))))

(assert (=> b!888146 (isDefined!318 (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785))))

(declare-fun b!888147 () Bool)

(declare-fun Unit!30264 () Unit!30260)

(assert (=> b!888147 (= e!494819 Unit!30264)))

(declare-fun b!888148 () Bool)

(assert (=> b!888148 (= e!494818 (isDefined!318 (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785)))))

(assert (= (and d!110005 c!93778) b!888146))

(assert (= (and d!110005 (not c!93778)) b!888147))

(assert (= (and d!110005 (not res!602279)) b!888148))

(declare-fun m!827543 () Bool)

(assert (=> d!110005 m!827543))

(declare-fun m!827545 () Bool)

(assert (=> b!888146 m!827545))

(assert (=> b!888146 m!827477))

(assert (=> b!888146 m!827477))

(assert (=> b!888146 m!827479))

(assert (=> b!888148 m!827477))

(assert (=> b!888148 m!827477))

(assert (=> b!888148 m!827479))

(assert (=> d!109997 d!110005))

(assert (=> d!109997 d!109995))

(assert (=> d!109997 d!110003))

(declare-fun d!110007 () Bool)

(declare-fun res!602284 () Bool)

(declare-fun e!494824 () Bool)

(assert (=> d!110007 (=> res!602284 e!494824)))

(assert (=> d!110007 (= res!602284 (= (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110007 (= (arrayContainsKey!0 (_keys!9836 thiss!1181) key!785 #b00000000000000000000000000000000) e!494824)))

(declare-fun b!888153 () Bool)

(declare-fun e!494825 () Bool)

(assert (=> b!888153 (= e!494824 e!494825)))

(declare-fun res!602285 () Bool)

(assert (=> b!888153 (=> (not res!602285) (not e!494825))))

(assert (=> b!888153 (= res!602285 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25319 (_keys!9836 thiss!1181))))))

(declare-fun b!888154 () Bool)

(assert (=> b!888154 (= e!494825 (arrayContainsKey!0 (_keys!9836 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110007 (not res!602284)) b!888153))

(assert (= (and b!888153 res!602285) b!888154))

(declare-fun m!827547 () Bool)

(assert (=> d!110007 m!827547))

(declare-fun m!827549 () Bool)

(assert (=> b!888154 m!827549))

(assert (=> bm!39409 d!110007))

(declare-fun b!888157 () Bool)

(declare-fun e!494827 () Option!445)

(assert (=> b!888157 (= e!494827 (getValueByKey!439 (t!24982 (t!24982 (toList!5329 (map!12106 thiss!1181)))) key!785))))

(declare-fun b!888156 () Bool)

(declare-fun e!494826 () Option!445)

(assert (=> b!888156 (= e!494826 e!494827)))

(declare-fun c!93780 () Bool)

(assert (=> b!888156 (= c!93780 (and ((_ is Cons!17683) (t!24982 (toList!5329 (map!12106 thiss!1181)))) (not (= (_1!5976 (h!18814 (t!24982 (toList!5329 (map!12106 thiss!1181))))) key!785))))))

(declare-fun b!888158 () Bool)

(assert (=> b!888158 (= e!494827 None!443)))

(declare-fun b!888155 () Bool)

(assert (=> b!888155 (= e!494826 (Some!444 (_2!5976 (h!18814 (t!24982 (toList!5329 (map!12106 thiss!1181)))))))))

(declare-fun d!110009 () Bool)

(declare-fun c!93779 () Bool)

(assert (=> d!110009 (= c!93779 (and ((_ is Cons!17683) (t!24982 (toList!5329 (map!12106 thiss!1181)))) (= (_1!5976 (h!18814 (t!24982 (toList!5329 (map!12106 thiss!1181))))) key!785)))))

(assert (=> d!110009 (= (getValueByKey!439 (t!24982 (toList!5329 (map!12106 thiss!1181))) key!785) e!494826)))

(assert (= (and d!110009 c!93779) b!888155))

(assert (= (and d!110009 (not c!93779)) b!888156))

(assert (= (and b!888156 c!93780) b!888157))

(assert (= (and b!888156 (not c!93780)) b!888158))

(declare-fun m!827551 () Bool)

(assert (=> b!888157 m!827551))

(assert (=> b!888091 d!110009))

(declare-fun bm!39424 () Bool)

(declare-fun call!39433 () ListLongMap!10627)

(declare-fun call!39431 () ListLongMap!10627)

(assert (=> bm!39424 (= call!39433 call!39431)))

(declare-fun b!888201 () Bool)

(declare-fun e!494858 () ListLongMap!10627)

(declare-fun e!494862 () ListLongMap!10627)

(assert (=> b!888201 (= e!494858 e!494862)))

(declare-fun c!93797 () Bool)

(assert (=> b!888201 (= c!93797 (and (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888202 () Bool)

(declare-fun e!494856 () Bool)

(declare-fun e!494864 () Bool)

(assert (=> b!888202 (= e!494856 e!494864)))

(declare-fun res!602304 () Bool)

(declare-fun call!39432 () Bool)

(assert (=> b!888202 (= res!602304 call!39432)))

(assert (=> b!888202 (=> (not res!602304) (not e!494864))))

(declare-fun b!888204 () Bool)

(declare-fun res!602308 () Bool)

(declare-fun e!494854 () Bool)

(assert (=> b!888204 (=> (not res!602308) (not e!494854))))

(declare-fun e!494863 () Bool)

(assert (=> b!888204 (= res!602308 e!494863)))

(declare-fun res!602311 () Bool)

(assert (=> b!888204 (=> res!602311 e!494863)))

(declare-fun e!494861 () Bool)

(assert (=> b!888204 (= res!602311 (not e!494861))))

(declare-fun res!602305 () Bool)

(assert (=> b!888204 (=> (not res!602305) (not e!494861))))

(assert (=> b!888204 (= res!602305 (bvslt #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))

(declare-fun b!888205 () Bool)

(declare-fun e!494865 () ListLongMap!10627)

(declare-fun call!39429 () ListLongMap!10627)

(assert (=> b!888205 (= e!494865 call!39429)))

(declare-fun b!888206 () Bool)

(assert (=> b!888206 (= e!494865 call!39433)))

(declare-fun b!888207 () Bool)

(declare-fun e!494860 () Bool)

(assert (=> b!888207 (= e!494863 e!494860)))

(declare-fun res!602312 () Bool)

(assert (=> b!888207 (=> (not res!602312) (not e!494860))))

(declare-fun lt!401641 () ListLongMap!10627)

(assert (=> b!888207 (= res!602312 (contains!4319 lt!401641 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!888207 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))

(declare-fun b!888208 () Bool)

(declare-fun e!494855 () Bool)

(declare-fun e!494857 () Bool)

(assert (=> b!888208 (= e!494855 e!494857)))

(declare-fun res!602306 () Bool)

(declare-fun call!39430 () Bool)

(assert (=> b!888208 (= res!602306 call!39430)))

(assert (=> b!888208 (=> (not res!602306) (not e!494857))))

(declare-fun b!888209 () Bool)

(declare-fun apply!398 (ListLongMap!10627 (_ BitVec 64)) V!28809)

(assert (=> b!888209 (= e!494864 (= (apply!398 lt!401641 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4957 thiss!1181)))))

(declare-fun bm!39425 () Bool)

(assert (=> bm!39425 (= call!39430 (contains!4319 lt!401641 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888210 () Bool)

(assert (=> b!888210 (= e!494854 e!494855)))

(declare-fun c!93794 () Bool)

(assert (=> b!888210 (= c!93794 (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!888211 () Bool)

(declare-fun e!494859 () Unit!30260)

(declare-fun lt!401648 () Unit!30260)

(assert (=> b!888211 (= e!494859 lt!401648)))

(declare-fun lt!401643 () ListLongMap!10627)

(declare-fun getCurrentListMapNoExtraKeys!3272 (array!51734 array!51736 (_ BitVec 32) (_ BitVec 32) V!28809 V!28809 (_ BitVec 32) Int) ListLongMap!10627)

(assert (=> b!888211 (= lt!401643 (getCurrentListMapNoExtraKeys!3272 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)))))

(declare-fun lt!401655 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401655 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401646 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401646 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401656 () Unit!30260)

(declare-fun addStillContains!326 (ListLongMap!10627 (_ BitVec 64) V!28809 (_ BitVec 64)) Unit!30260)

(assert (=> b!888211 (= lt!401656 (addStillContains!326 lt!401643 lt!401655 (zeroValue!4957 thiss!1181) lt!401646))))

(declare-fun +!2585 (ListLongMap!10627 tuple2!11930) ListLongMap!10627)

(assert (=> b!888211 (contains!4319 (+!2585 lt!401643 (tuple2!11931 lt!401655 (zeroValue!4957 thiss!1181))) lt!401646)))

(declare-fun lt!401650 () Unit!30260)

(assert (=> b!888211 (= lt!401650 lt!401656)))

(declare-fun lt!401658 () ListLongMap!10627)

(assert (=> b!888211 (= lt!401658 (getCurrentListMapNoExtraKeys!3272 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)))))

(declare-fun lt!401652 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401652 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401639 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401639 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401653 () Unit!30260)

(declare-fun addApplyDifferent!326 (ListLongMap!10627 (_ BitVec 64) V!28809 (_ BitVec 64)) Unit!30260)

(assert (=> b!888211 (= lt!401653 (addApplyDifferent!326 lt!401658 lt!401652 (minValue!4957 thiss!1181) lt!401639))))

(assert (=> b!888211 (= (apply!398 (+!2585 lt!401658 (tuple2!11931 lt!401652 (minValue!4957 thiss!1181))) lt!401639) (apply!398 lt!401658 lt!401639))))

(declare-fun lt!401651 () Unit!30260)

(assert (=> b!888211 (= lt!401651 lt!401653)))

(declare-fun lt!401657 () ListLongMap!10627)

(assert (=> b!888211 (= lt!401657 (getCurrentListMapNoExtraKeys!3272 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)))))

(declare-fun lt!401654 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401654 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401645 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401645 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401640 () Unit!30260)

(assert (=> b!888211 (= lt!401640 (addApplyDifferent!326 lt!401657 lt!401654 (zeroValue!4957 thiss!1181) lt!401645))))

(assert (=> b!888211 (= (apply!398 (+!2585 lt!401657 (tuple2!11931 lt!401654 (zeroValue!4957 thiss!1181))) lt!401645) (apply!398 lt!401657 lt!401645))))

(declare-fun lt!401642 () Unit!30260)

(assert (=> b!888211 (= lt!401642 lt!401640)))

(declare-fun lt!401644 () ListLongMap!10627)

(assert (=> b!888211 (= lt!401644 (getCurrentListMapNoExtraKeys!3272 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)))))

(declare-fun lt!401660 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!401647 () (_ BitVec 64))

(assert (=> b!888211 (= lt!401647 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888211 (= lt!401648 (addApplyDifferent!326 lt!401644 lt!401660 (minValue!4957 thiss!1181) lt!401647))))

(assert (=> b!888211 (= (apply!398 (+!2585 lt!401644 (tuple2!11931 lt!401660 (minValue!4957 thiss!1181))) lt!401647) (apply!398 lt!401644 lt!401647))))

(declare-fun call!39427 () ListLongMap!10627)

(declare-fun bm!39426 () Bool)

(declare-fun c!93798 () Bool)

(declare-fun call!39428 () ListLongMap!10627)

(assert (=> bm!39426 (= call!39427 (+!2585 (ite c!93798 call!39428 (ite c!93797 call!39431 call!39433)) (ite (or c!93798 c!93797) (tuple2!11931 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4957 thiss!1181)) (tuple2!11931 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4957 thiss!1181)))))))

(declare-fun b!888212 () Bool)

(declare-fun res!602310 () Bool)

(assert (=> b!888212 (=> (not res!602310) (not e!494854))))

(assert (=> b!888212 (= res!602310 e!494856)))

(declare-fun c!93795 () Bool)

(assert (=> b!888212 (= c!93795 (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39427 () Bool)

(assert (=> bm!39427 (= call!39428 (getCurrentListMapNoExtraKeys!3272 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)))))

(declare-fun b!888213 () Bool)

(declare-fun c!93796 () Bool)

(assert (=> b!888213 (= c!93796 (and (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!888213 (= e!494862 e!494865)))

(declare-fun b!888214 () Bool)

(assert (=> b!888214 (= e!494857 (= (apply!398 lt!401641 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4957 thiss!1181)))))

(declare-fun bm!39428 () Bool)

(assert (=> bm!39428 (= call!39429 call!39427)))

(declare-fun b!888215 () Bool)

(assert (=> b!888215 (= e!494862 call!39429)))

(declare-fun b!888203 () Bool)

(assert (=> b!888203 (= e!494856 (not call!39432))))

(declare-fun d!110011 () Bool)

(assert (=> d!110011 e!494854))

(declare-fun res!602309 () Bool)

(assert (=> d!110011 (=> (not res!602309) (not e!494854))))

(assert (=> d!110011 (= res!602309 (or (bvsge #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))))

(declare-fun lt!401649 () ListLongMap!10627)

(assert (=> d!110011 (= lt!401641 lt!401649)))

(declare-fun lt!401659 () Unit!30260)

(assert (=> d!110011 (= lt!401659 e!494859)))

(declare-fun c!93793 () Bool)

(declare-fun e!494866 () Bool)

(assert (=> d!110011 (= c!93793 e!494866)))

(declare-fun res!602307 () Bool)

(assert (=> d!110011 (=> (not res!602307) (not e!494866))))

(assert (=> d!110011 (= res!602307 (bvslt #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))

(assert (=> d!110011 (= lt!401649 e!494858)))

(assert (=> d!110011 (= c!93798 (and (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110011 (validMask!0 (mask!25571 thiss!1181))))

(assert (=> d!110011 (= (getCurrentListMap!2615 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)) lt!401641)))

(declare-fun bm!39429 () Bool)

(assert (=> bm!39429 (= call!39432 (contains!4319 lt!401641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!888216 () Bool)

(assert (=> b!888216 (= e!494855 (not call!39430))))

(declare-fun b!888217 () Bool)

(declare-fun Unit!30265 () Unit!30260)

(assert (=> b!888217 (= e!494859 Unit!30265)))

(declare-fun b!888218 () Bool)

(declare-fun get!13143 (ValueCell!8460 V!28809) V!28809)

(declare-fun dynLambda!1289 (Int (_ BitVec 64)) V!28809)

(assert (=> b!888218 (= e!494860 (= (apply!398 lt!401641 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)) (get!13143 (select (arr!24880 (_values!5144 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1289 (defaultEntry!5159 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!888218 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25320 (_values!5144 thiss!1181))))))

(assert (=> b!888218 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))

(declare-fun bm!39430 () Bool)

(assert (=> bm!39430 (= call!39431 call!39428)))

(declare-fun b!888219 () Bool)

(assert (=> b!888219 (= e!494858 (+!2585 call!39427 (tuple2!11931 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4957 thiss!1181))))))

(declare-fun b!888220 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888220 (= e!494866 (validKeyInArray!0 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888221 () Bool)

(assert (=> b!888221 (= e!494861 (validKeyInArray!0 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110011 c!93798) b!888219))

(assert (= (and d!110011 (not c!93798)) b!888201))

(assert (= (and b!888201 c!93797) b!888215))

(assert (= (and b!888201 (not c!93797)) b!888213))

(assert (= (and b!888213 c!93796) b!888205))

(assert (= (and b!888213 (not c!93796)) b!888206))

(assert (= (or b!888205 b!888206) bm!39424))

(assert (= (or b!888215 bm!39424) bm!39430))

(assert (= (or b!888215 b!888205) bm!39428))

(assert (= (or b!888219 bm!39430) bm!39427))

(assert (= (or b!888219 bm!39428) bm!39426))

(assert (= (and d!110011 res!602307) b!888220))

(assert (= (and d!110011 c!93793) b!888211))

(assert (= (and d!110011 (not c!93793)) b!888217))

(assert (= (and d!110011 res!602309) b!888204))

(assert (= (and b!888204 res!602305) b!888221))

(assert (= (and b!888204 (not res!602311)) b!888207))

(assert (= (and b!888207 res!602312) b!888218))

(assert (= (and b!888204 res!602308) b!888212))

(assert (= (and b!888212 c!93795) b!888202))

(assert (= (and b!888212 (not c!93795)) b!888203))

(assert (= (and b!888202 res!602304) b!888209))

(assert (= (or b!888202 b!888203) bm!39429))

(assert (= (and b!888212 res!602310) b!888210))

(assert (= (and b!888210 c!93794) b!888208))

(assert (= (and b!888210 (not c!93794)) b!888216))

(assert (= (and b!888208 res!602306) b!888214))

(assert (= (or b!888208 b!888216) bm!39425))

(declare-fun b_lambda!12875 () Bool)

(assert (=> (not b_lambda!12875) (not b!888218)))

(declare-fun t!24985 () Bool)

(declare-fun tb!5147 () Bool)

(assert (=> (and b!888059 (= (defaultEntry!5159 thiss!1181) (defaultEntry!5159 thiss!1181)) t!24985) tb!5147))

(declare-fun result!9995 () Bool)

(assert (=> tb!5147 (= result!9995 tp_is_empty!17883)))

(assert (=> b!888218 t!24985))

(declare-fun b_and!25795 () Bool)

(assert (= b_and!25791 (and (=> t!24985 result!9995) b_and!25795)))

(declare-fun m!827553 () Bool)

(assert (=> bm!39425 m!827553))

(declare-fun m!827555 () Bool)

(assert (=> b!888214 m!827555))

(declare-fun m!827557 () Bool)

(assert (=> d!110011 m!827557))

(assert (=> b!888207 m!827547))

(assert (=> b!888207 m!827547))

(declare-fun m!827559 () Bool)

(assert (=> b!888207 m!827559))

(declare-fun m!827561 () Bool)

(assert (=> b!888219 m!827561))

(declare-fun m!827563 () Bool)

(assert (=> bm!39427 m!827563))

(declare-fun m!827565 () Bool)

(assert (=> bm!39429 m!827565))

(assert (=> b!888221 m!827547))

(assert (=> b!888221 m!827547))

(declare-fun m!827567 () Bool)

(assert (=> b!888221 m!827567))

(declare-fun m!827569 () Bool)

(assert (=> bm!39426 m!827569))

(declare-fun m!827571 () Bool)

(assert (=> b!888209 m!827571))

(assert (=> b!888220 m!827547))

(assert (=> b!888220 m!827547))

(assert (=> b!888220 m!827567))

(declare-fun m!827573 () Bool)

(assert (=> b!888218 m!827573))

(assert (=> b!888218 m!827547))

(assert (=> b!888218 m!827573))

(declare-fun m!827575 () Bool)

(assert (=> b!888218 m!827575))

(declare-fun m!827577 () Bool)

(assert (=> b!888218 m!827577))

(assert (=> b!888218 m!827547))

(declare-fun m!827579 () Bool)

(assert (=> b!888218 m!827579))

(assert (=> b!888218 m!827575))

(declare-fun m!827581 () Bool)

(assert (=> b!888211 m!827581))

(declare-fun m!827583 () Bool)

(assert (=> b!888211 m!827583))

(declare-fun m!827585 () Bool)

(assert (=> b!888211 m!827585))

(declare-fun m!827587 () Bool)

(assert (=> b!888211 m!827587))

(declare-fun m!827589 () Bool)

(assert (=> b!888211 m!827589))

(assert (=> b!888211 m!827587))

(declare-fun m!827591 () Bool)

(assert (=> b!888211 m!827591))

(declare-fun m!827593 () Bool)

(assert (=> b!888211 m!827593))

(declare-fun m!827595 () Bool)

(assert (=> b!888211 m!827595))

(declare-fun m!827597 () Bool)

(assert (=> b!888211 m!827597))

(declare-fun m!827599 () Bool)

(assert (=> b!888211 m!827599))

(assert (=> b!888211 m!827563))

(assert (=> b!888211 m!827583))

(declare-fun m!827601 () Bool)

(assert (=> b!888211 m!827601))

(assert (=> b!888211 m!827547))

(declare-fun m!827603 () Bool)

(assert (=> b!888211 m!827603))

(assert (=> b!888211 m!827591))

(assert (=> b!888211 m!827603))

(declare-fun m!827605 () Bool)

(assert (=> b!888211 m!827605))

(declare-fun m!827607 () Bool)

(assert (=> b!888211 m!827607))

(declare-fun m!827609 () Bool)

(assert (=> b!888211 m!827609))

(assert (=> bm!39407 d!110011))

(assert (=> d!109995 d!110011))

(declare-fun d!110013 () Bool)

(assert (=> d!110013 (arrayContainsKey!0 (_keys!9836 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!401663 () Unit!30260)

(declare-fun choose!13 (array!51734 (_ BitVec 64) (_ BitVec 32)) Unit!30260)

(assert (=> d!110013 (= lt!401663 (choose!13 (_keys!9836 thiss!1181) key!785 (index!37436 lt!401577)))))

(assert (=> d!110013 (bvsge (index!37436 lt!401577) #b00000000000000000000000000000000)))

(assert (=> d!110013 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9836 thiss!1181) key!785 (index!37436 lt!401577)) lt!401663)))

(declare-fun bs!24907 () Bool)

(assert (= bs!24907 d!110013))

(assert (=> bs!24907 m!827525))

(declare-fun m!827611 () Bool)

(assert (=> bs!24907 m!827611))

(assert (=> b!888115 d!110013))

(declare-fun d!110015 () Bool)

(declare-fun e!494869 () Bool)

(assert (=> d!110015 e!494869))

(declare-fun res!602315 () Bool)

(assert (=> d!110015 (=> (not res!602315) (not e!494869))))

(assert (=> d!110015 (= res!602315 (and (bvsge (index!37436 lt!401577) #b00000000000000000000000000000000) (bvslt (index!37436 lt!401577) (size!25319 (_keys!9836 thiss!1181)))))))

(declare-fun lt!401666 () Unit!30260)

(declare-fun choose!1456 (array!51734 array!51736 (_ BitVec 32) (_ BitVec 32) V!28809 V!28809 (_ BitVec 32) Int) Unit!30260)

(assert (=> d!110015 (= lt!401666 (choose!1456 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) (index!37436 lt!401577) (defaultEntry!5159 thiss!1181)))))

(assert (=> d!110015 (validMask!0 (mask!25571 thiss!1181))))

(assert (=> d!110015 (= (lemmaValidKeyInArrayIsInListMap!204 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) (index!37436 lt!401577) (defaultEntry!5159 thiss!1181)) lt!401666)))

(declare-fun b!888226 () Bool)

(assert (=> b!888226 (= e!494869 (contains!4319 (getCurrentListMap!2615 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5159 thiss!1181)) (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401577))))))

(assert (= (and d!110015 res!602315) b!888226))

(declare-fun m!827613 () Bool)

(assert (=> d!110015 m!827613))

(assert (=> d!110015 m!827557))

(assert (=> b!888226 m!827507))

(assert (=> b!888226 m!827527))

(assert (=> b!888226 m!827507))

(assert (=> b!888226 m!827527))

(declare-fun m!827615 () Bool)

(assert (=> b!888226 m!827615))

(assert (=> b!888115 d!110015))

(declare-fun b!888235 () Bool)

(declare-fun e!494877 () Bool)

(declare-fun e!494878 () Bool)

(assert (=> b!888235 (= e!494877 e!494878)))

(declare-fun lt!401675 () (_ BitVec 64))

(assert (=> b!888235 (= lt!401675 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!401674 () Unit!30260)

(assert (=> b!888235 (= lt!401674 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9836 thiss!1181) lt!401675 #b00000000000000000000000000000000))))

(assert (=> b!888235 (arrayContainsKey!0 (_keys!9836 thiss!1181) lt!401675 #b00000000000000000000000000000000)))

(declare-fun lt!401673 () Unit!30260)

(assert (=> b!888235 (= lt!401673 lt!401674)))

(declare-fun res!602320 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51734 (_ BitVec 32)) SeekEntryResult!8766)

(assert (=> b!888235 (= res!602320 (= (seekEntryOrOpen!0 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000) (_keys!9836 thiss!1181) (mask!25571 thiss!1181)) (Found!8766 #b00000000000000000000000000000000)))))

(assert (=> b!888235 (=> (not res!602320) (not e!494878))))

(declare-fun b!888236 () Bool)

(declare-fun e!494876 () Bool)

(assert (=> b!888236 (= e!494876 e!494877)))

(declare-fun c!93801 () Bool)

(assert (=> b!888236 (= c!93801 (validKeyInArray!0 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888237 () Bool)

(declare-fun call!39436 () Bool)

(assert (=> b!888237 (= e!494877 call!39436)))

(declare-fun d!110017 () Bool)

(declare-fun res!602321 () Bool)

(assert (=> d!110017 (=> res!602321 e!494876)))

(assert (=> d!110017 (= res!602321 (bvsge #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))

(assert (=> d!110017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)) e!494876)))

(declare-fun b!888238 () Bool)

(assert (=> b!888238 (= e!494878 call!39436)))

(declare-fun bm!39433 () Bool)

(assert (=> bm!39433 (= call!39436 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(assert (= (and d!110017 (not res!602321)) b!888236))

(assert (= (and b!888236 c!93801) b!888235))

(assert (= (and b!888236 (not c!93801)) b!888237))

(assert (= (and b!888235 res!602320) b!888238))

(assert (= (or b!888238 b!888237) bm!39433))

(assert (=> b!888235 m!827547))

(declare-fun m!827617 () Bool)

(assert (=> b!888235 m!827617))

(declare-fun m!827619 () Bool)

(assert (=> b!888235 m!827619))

(assert (=> b!888235 m!827547))

(declare-fun m!827621 () Bool)

(assert (=> b!888235 m!827621))

(assert (=> b!888236 m!827547))

(assert (=> b!888236 m!827547))

(assert (=> b!888236 m!827567))

(declare-fun m!827623 () Bool)

(assert (=> bm!39433 m!827623))

(assert (=> b!888130 d!110017))

(declare-fun d!110019 () Bool)

(assert (=> d!110019 (= (isEmpty!675 (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785)) (not ((_ is Some!444) (getValueByKey!439 (toList!5329 (map!12106 thiss!1181)) key!785))))))

(assert (=> d!109991 d!110019))

(declare-fun d!110021 () Bool)

(declare-fun res!602330 () Bool)

(declare-fun e!494881 () Bool)

(assert (=> d!110021 (=> (not res!602330) (not e!494881))))

(assert (=> d!110021 (= res!602330 (validMask!0 (mask!25571 thiss!1181)))))

(assert (=> d!110021 (= (simpleValid!289 thiss!1181) e!494881)))

(declare-fun b!888248 () Bool)

(declare-fun res!602332 () Bool)

(assert (=> b!888248 (=> (not res!602332) (not e!494881))))

(declare-fun size!25323 (LongMapFixedSize!3936) (_ BitVec 32))

(assert (=> b!888248 (= res!602332 (bvsge (size!25323 thiss!1181) (_size!2023 thiss!1181)))))

(declare-fun b!888247 () Bool)

(declare-fun res!602333 () Bool)

(assert (=> b!888247 (=> (not res!602333) (not e!494881))))

(assert (=> b!888247 (= res!602333 (and (= (size!25320 (_values!5144 thiss!1181)) (bvadd (mask!25571 thiss!1181) #b00000000000000000000000000000001)) (= (size!25319 (_keys!9836 thiss!1181)) (size!25320 (_values!5144 thiss!1181))) (bvsge (_size!2023 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2023 thiss!1181) (bvadd (mask!25571 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!888250 () Bool)

(assert (=> b!888250 (= e!494881 (and (bvsge (extraKeys!4853 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4853 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2023 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!888249 () Bool)

(declare-fun res!602331 () Bool)

(assert (=> b!888249 (=> (not res!602331) (not e!494881))))

(assert (=> b!888249 (= res!602331 (= (size!25323 thiss!1181) (bvadd (_size!2023 thiss!1181) (bvsdiv (bvadd (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!110021 res!602330) b!888247))

(assert (= (and b!888247 res!602333) b!888248))

(assert (= (and b!888248 res!602332) b!888249))

(assert (= (and b!888249 res!602331) b!888250))

(assert (=> d!110021 m!827557))

(declare-fun m!827625 () Bool)

(assert (=> b!888248 m!827625))

(assert (=> b!888249 m!827625))

(assert (=> d!110003 d!110021))

(declare-fun bm!39436 () Bool)

(declare-fun call!39439 () (_ BitVec 32))

(assert (=> bm!39436 (= call!39439 (arrayCountValidKeys!0 (_keys!9836 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25319 (_keys!9836 thiss!1181))))))

(declare-fun b!888259 () Bool)

(declare-fun e!494887 () (_ BitVec 32))

(assert (=> b!888259 (= e!494887 call!39439)))

(declare-fun b!888260 () Bool)

(declare-fun e!494886 () (_ BitVec 32))

(assert (=> b!888260 (= e!494886 e!494887)))

(declare-fun c!93807 () Bool)

(assert (=> b!888260 (= c!93807 (validKeyInArray!0 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888261 () Bool)

(assert (=> b!888261 (= e!494887 (bvadd #b00000000000000000000000000000001 call!39439))))

(declare-fun b!888262 () Bool)

(assert (=> b!888262 (= e!494886 #b00000000000000000000000000000000)))

(declare-fun d!110023 () Bool)

(declare-fun lt!401678 () (_ BitVec 32))

(assert (=> d!110023 (and (bvsge lt!401678 #b00000000000000000000000000000000) (bvsle lt!401678 (bvsub (size!25319 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110023 (= lt!401678 e!494886)))

(declare-fun c!93806 () Bool)

(assert (=> d!110023 (= c!93806 (bvsge #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))

(assert (=> d!110023 (and (bvsle #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25319 (_keys!9836 thiss!1181)) (size!25319 (_keys!9836 thiss!1181))))))

(assert (=> d!110023 (= (arrayCountValidKeys!0 (_keys!9836 thiss!1181) #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))) lt!401678)))

(assert (= (and d!110023 c!93806) b!888262))

(assert (= (and d!110023 (not c!93806)) b!888260))

(assert (= (and b!888260 c!93807) b!888261))

(assert (= (and b!888260 (not c!93807)) b!888259))

(assert (= (or b!888261 b!888259) bm!39436))

(declare-fun m!827627 () Bool)

(assert (=> bm!39436 m!827627))

(assert (=> b!888260 m!827547))

(assert (=> b!888260 m!827547))

(assert (=> b!888260 m!827567))

(assert (=> b!888129 d!110023))

(declare-fun b!888275 () Bool)

(declare-fun e!494895 () SeekEntryResult!8766)

(declare-fun e!494896 () SeekEntryResult!8766)

(assert (=> b!888275 (= e!494895 e!494896)))

(declare-fun lt!401687 () (_ BitVec 64))

(declare-fun lt!401689 () SeekEntryResult!8766)

(assert (=> b!888275 (= lt!401687 (select (arr!24879 (_keys!9836 thiss!1181)) (index!37437 lt!401689)))))

(declare-fun c!93814 () Bool)

(assert (=> b!888275 (= c!93814 (= lt!401687 key!785))))

(declare-fun b!888276 () Bool)

(declare-fun e!494894 () SeekEntryResult!8766)

(declare-fun lt!401688 () SeekEntryResult!8766)

(assert (=> b!888276 (= e!494894 (ite ((_ is MissingVacant!8766) lt!401688) (MissingZero!8766 (index!37438 lt!401688)) lt!401688))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51734 (_ BitVec 32)) SeekEntryResult!8766)

(assert (=> b!888276 (= lt!401688 (seekKeyOrZeroReturnVacant!0 (x!75346 lt!401689) (index!37437 lt!401689) (index!37437 lt!401689) key!785 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(declare-fun b!888277 () Bool)

(assert (=> b!888277 (= e!494894 (MissingZero!8766 (index!37437 lt!401689)))))

(declare-fun d!110025 () Bool)

(declare-fun lt!401690 () SeekEntryResult!8766)

(assert (=> d!110025 (and (or ((_ is MissingVacant!8766) lt!401690) (not ((_ is Found!8766) lt!401690)) (and (bvsge (index!37436 lt!401690) #b00000000000000000000000000000000) (bvslt (index!37436 lt!401690) (size!25319 (_keys!9836 thiss!1181))))) (not ((_ is MissingVacant!8766) lt!401690)) (or (not ((_ is Found!8766) lt!401690)) (= (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401690)) key!785)))))

(assert (=> d!110025 (= lt!401690 e!494895)))

(declare-fun c!93816 () Bool)

(assert (=> d!110025 (= c!93816 (and ((_ is Intermediate!8766) lt!401689) (undefined!9578 lt!401689)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51734 (_ BitVec 32)) SeekEntryResult!8766)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110025 (= lt!401689 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25571 thiss!1181)) key!785 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(assert (=> d!110025 (validMask!0 (mask!25571 thiss!1181))))

(assert (=> d!110025 (= (seekEntry!0 key!785 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)) lt!401690)))

(declare-fun b!888278 () Bool)

(assert (=> b!888278 (= e!494895 Undefined!8766)))

(declare-fun b!888279 () Bool)

(declare-fun c!93815 () Bool)

(assert (=> b!888279 (= c!93815 (= lt!401687 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!888279 (= e!494896 e!494894)))

(declare-fun b!888280 () Bool)

(assert (=> b!888280 (= e!494896 (Found!8766 (index!37437 lt!401689)))))

(assert (= (and d!110025 c!93816) b!888278))

(assert (= (and d!110025 (not c!93816)) b!888275))

(assert (= (and b!888275 c!93814) b!888280))

(assert (= (and b!888275 (not c!93814)) b!888279))

(assert (= (and b!888279 c!93815) b!888277))

(assert (= (and b!888279 (not c!93815)) b!888276))

(declare-fun m!827629 () Bool)

(assert (=> b!888275 m!827629))

(declare-fun m!827631 () Bool)

(assert (=> b!888276 m!827631))

(declare-fun m!827633 () Bool)

(assert (=> d!110025 m!827633))

(declare-fun m!827635 () Bool)

(assert (=> d!110025 m!827635))

(assert (=> d!110025 m!827635))

(declare-fun m!827637 () Bool)

(assert (=> d!110025 m!827637))

(assert (=> d!110025 m!827557))

(assert (=> b!888118 d!110025))

(declare-fun d!110027 () Bool)

(declare-fun e!494899 () Bool)

(assert (=> d!110027 e!494899))

(declare-fun c!93819 () Bool)

(assert (=> d!110027 (= c!93819 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!401693 () Unit!30260)

(declare-fun choose!1457 (array!51734 array!51736 (_ BitVec 32) (_ BitVec 32) V!28809 V!28809 (_ BitVec 64) Int) Unit!30260)

(assert (=> d!110027 (= lt!401693 (choose!1457 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) key!785 (defaultEntry!5159 thiss!1181)))))

(assert (=> d!110027 (validMask!0 (mask!25571 thiss!1181))))

(assert (=> d!110027 (= (lemmaKeyInListMapIsInArray!157 (_keys!9836 thiss!1181) (_values!5144 thiss!1181) (mask!25571 thiss!1181) (extraKeys!4853 thiss!1181) (zeroValue!4957 thiss!1181) (minValue!4957 thiss!1181) key!785 (defaultEntry!5159 thiss!1181)) lt!401693)))

(declare-fun b!888285 () Bool)

(assert (=> b!888285 (= e!494899 (arrayContainsKey!0 (_keys!9836 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!888286 () Bool)

(assert (=> b!888286 (= e!494899 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4853 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110027 c!93819) b!888285))

(assert (= (and d!110027 (not c!93819)) b!888286))

(declare-fun m!827639 () Bool)

(assert (=> d!110027 m!827639))

(assert (=> d!110027 m!827557))

(assert (=> b!888285 m!827525))

(assert (=> b!888121 d!110027))

(assert (=> b!888121 d!110025))

(declare-fun d!110029 () Bool)

(declare-fun lt!401696 () (_ BitVec 32))

(assert (=> d!110029 (and (or (bvslt lt!401696 #b00000000000000000000000000000000) (bvsge lt!401696 (size!25319 (_keys!9836 thiss!1181))) (and (bvsge lt!401696 #b00000000000000000000000000000000) (bvslt lt!401696 (size!25319 (_keys!9836 thiss!1181))))) (bvsge lt!401696 #b00000000000000000000000000000000) (bvslt lt!401696 (size!25319 (_keys!9836 thiss!1181))) (= (select (arr!24879 (_keys!9836 thiss!1181)) lt!401696) key!785))))

(declare-fun e!494902 () (_ BitVec 32))

(assert (=> d!110029 (= lt!401696 e!494902)))

(declare-fun c!93822 () Bool)

(assert (=> d!110029 (= c!93822 (= (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110029 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))) (bvslt (size!25319 (_keys!9836 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110029 (= (arrayScanForKey!0 (_keys!9836 thiss!1181) key!785 #b00000000000000000000000000000000) lt!401696)))

(declare-fun b!888291 () Bool)

(assert (=> b!888291 (= e!494902 #b00000000000000000000000000000000)))

(declare-fun b!888292 () Bool)

(assert (=> b!888292 (= e!494902 (arrayScanForKey!0 (_keys!9836 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110029 c!93822) b!888291))

(assert (= (and d!110029 (not c!93822)) b!888292))

(declare-fun m!827641 () Bool)

(assert (=> d!110029 m!827641))

(assert (=> d!110029 m!827547))

(declare-fun m!827643 () Bool)

(assert (=> b!888292 m!827643))

(assert (=> b!888121 d!110029))

(declare-fun d!110031 () Bool)

(assert (=> d!110031 (arrayForallSeekEntryOrOpenFound!0 lt!401574 (_keys!9836 thiss!1181) (mask!25571 thiss!1181))))

(declare-fun lt!401699 () Unit!30260)

(declare-fun choose!38 (array!51734 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30260)

(assert (=> d!110031 (= lt!401699 (choose!38 (_keys!9836 thiss!1181) (mask!25571 thiss!1181) #b00000000000000000000000000000000 lt!401574))))

(assert (=> d!110031 (validMask!0 (mask!25571 thiss!1181))))

(assert (=> d!110031 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9836 thiss!1181) (mask!25571 thiss!1181) #b00000000000000000000000000000000 lt!401574) lt!401699)))

(declare-fun bs!24908 () Bool)

(assert (= bs!24908 d!110031))

(assert (=> bs!24908 m!827511))

(declare-fun m!827645 () Bool)

(assert (=> bs!24908 m!827645))

(assert (=> bs!24908 m!827557))

(assert (=> b!888121 d!110031))

(declare-fun d!110033 () Bool)

(declare-fun lt!401705 () SeekEntryResult!8766)

(assert (=> d!110033 (and ((_ is Found!8766) lt!401705) (= (index!37436 lt!401705) lt!401574))))

(assert (=> d!110033 (= lt!401705 (seekEntry!0 key!785 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(declare-fun lt!401704 () Unit!30260)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!51734 (_ BitVec 32)) Unit!30260)

(assert (=> d!110033 (= lt!401704 (choose!0 key!785 lt!401574 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(assert (=> d!110033 (validMask!0 (mask!25571 thiss!1181))))

(assert (=> d!110033 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!401574 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)) lt!401704)))

(declare-fun bs!24909 () Bool)

(assert (= bs!24909 d!110033))

(assert (=> bs!24909 m!827519))

(declare-fun m!827647 () Bool)

(assert (=> bs!24909 m!827647))

(assert (=> bs!24909 m!827557))

(assert (=> b!888121 d!110033))

(declare-fun b!888293 () Bool)

(declare-fun e!494904 () Bool)

(declare-fun e!494905 () Bool)

(assert (=> b!888293 (= e!494904 e!494905)))

(declare-fun lt!401708 () (_ BitVec 64))

(assert (=> b!888293 (= lt!401708 (select (arr!24879 (_keys!9836 thiss!1181)) lt!401574))))

(declare-fun lt!401707 () Unit!30260)

(assert (=> b!888293 (= lt!401707 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9836 thiss!1181) lt!401708 lt!401574))))

(assert (=> b!888293 (arrayContainsKey!0 (_keys!9836 thiss!1181) lt!401708 #b00000000000000000000000000000000)))

(declare-fun lt!401706 () Unit!30260)

(assert (=> b!888293 (= lt!401706 lt!401707)))

(declare-fun res!602334 () Bool)

(assert (=> b!888293 (= res!602334 (= (seekEntryOrOpen!0 (select (arr!24879 (_keys!9836 thiss!1181)) lt!401574) (_keys!9836 thiss!1181) (mask!25571 thiss!1181)) (Found!8766 lt!401574)))))

(assert (=> b!888293 (=> (not res!602334) (not e!494905))))

(declare-fun b!888294 () Bool)

(declare-fun e!494903 () Bool)

(assert (=> b!888294 (= e!494903 e!494904)))

(declare-fun c!93823 () Bool)

(assert (=> b!888294 (= c!93823 (validKeyInArray!0 (select (arr!24879 (_keys!9836 thiss!1181)) lt!401574)))))

(declare-fun b!888295 () Bool)

(declare-fun call!39440 () Bool)

(assert (=> b!888295 (= e!494904 call!39440)))

(declare-fun d!110035 () Bool)

(declare-fun res!602335 () Bool)

(assert (=> d!110035 (=> res!602335 e!494903)))

(assert (=> d!110035 (= res!602335 (bvsge lt!401574 (size!25319 (_keys!9836 thiss!1181))))))

(assert (=> d!110035 (= (arrayForallSeekEntryOrOpenFound!0 lt!401574 (_keys!9836 thiss!1181) (mask!25571 thiss!1181)) e!494903)))

(declare-fun b!888296 () Bool)

(assert (=> b!888296 (= e!494905 call!39440)))

(declare-fun bm!39437 () Bool)

(assert (=> bm!39437 (= call!39440 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!401574 #b00000000000000000000000000000001) (_keys!9836 thiss!1181) (mask!25571 thiss!1181)))))

(assert (= (and d!110035 (not res!602335)) b!888294))

(assert (= (and b!888294 c!93823) b!888293))

(assert (= (and b!888294 (not c!93823)) b!888295))

(assert (= (and b!888293 res!602334) b!888296))

(assert (= (or b!888296 b!888295) bm!39437))

(declare-fun m!827649 () Bool)

(assert (=> b!888293 m!827649))

(declare-fun m!827651 () Bool)

(assert (=> b!888293 m!827651))

(declare-fun m!827653 () Bool)

(assert (=> b!888293 m!827653))

(assert (=> b!888293 m!827649))

(declare-fun m!827655 () Bool)

(assert (=> b!888293 m!827655))

(assert (=> b!888294 m!827649))

(assert (=> b!888294 m!827649))

(declare-fun m!827657 () Bool)

(assert (=> b!888294 m!827657))

(declare-fun m!827659 () Bool)

(assert (=> bm!39437 m!827659))

(assert (=> b!888121 d!110035))

(declare-fun d!110037 () Bool)

(declare-fun res!602344 () Bool)

(declare-fun e!494915 () Bool)

(assert (=> d!110037 (=> res!602344 e!494915)))

(assert (=> d!110037 (= res!602344 (bvsge #b00000000000000000000000000000000 (size!25319 (_keys!9836 thiss!1181))))))

(assert (=> d!110037 (= (arrayNoDuplicates!0 (_keys!9836 thiss!1181) #b00000000000000000000000000000000 Nil!17685) e!494915)))

(declare-fun b!888307 () Bool)

(declare-fun e!494916 () Bool)

(declare-fun contains!4320 (List!17688 (_ BitVec 64)) Bool)

(assert (=> b!888307 (= e!494916 (contains!4320 Nil!17685 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888308 () Bool)

(declare-fun e!494914 () Bool)

(declare-fun call!39443 () Bool)

(assert (=> b!888308 (= e!494914 call!39443)))

(declare-fun bm!39440 () Bool)

(declare-fun c!93826 () Bool)

(assert (=> bm!39440 (= call!39443 (arrayNoDuplicates!0 (_keys!9836 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93826 (Cons!17684 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000) Nil!17685) Nil!17685)))))

(declare-fun b!888309 () Bool)

(declare-fun e!494917 () Bool)

(assert (=> b!888309 (= e!494915 e!494917)))

(declare-fun res!602343 () Bool)

(assert (=> b!888309 (=> (not res!602343) (not e!494917))))

(assert (=> b!888309 (= res!602343 (not e!494916))))

(declare-fun res!602342 () Bool)

(assert (=> b!888309 (=> (not res!602342) (not e!494916))))

(assert (=> b!888309 (= res!602342 (validKeyInArray!0 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888310 () Bool)

(assert (=> b!888310 (= e!494917 e!494914)))

(assert (=> b!888310 (= c!93826 (validKeyInArray!0 (select (arr!24879 (_keys!9836 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888311 () Bool)

(assert (=> b!888311 (= e!494914 call!39443)))

(assert (= (and d!110037 (not res!602344)) b!888309))

(assert (= (and b!888309 res!602342) b!888307))

(assert (= (and b!888309 res!602343) b!888310))

(assert (= (and b!888310 c!93826) b!888308))

(assert (= (and b!888310 (not c!93826)) b!888311))

(assert (= (or b!888308 b!888311) bm!39440))

(assert (=> b!888307 m!827547))

(assert (=> b!888307 m!827547))

(declare-fun m!827661 () Bool)

(assert (=> b!888307 m!827661))

(assert (=> bm!39440 m!827547))

(declare-fun m!827663 () Bool)

(assert (=> bm!39440 m!827663))

(assert (=> b!888309 m!827547))

(assert (=> b!888309 m!827547))

(assert (=> b!888309 m!827567))

(assert (=> b!888310 m!827547))

(assert (=> b!888310 m!827547))

(assert (=> b!888310 m!827567))

(assert (=> b!888131 d!110037))

(declare-fun d!110039 () Bool)

(declare-fun e!494918 () Bool)

(assert (=> d!110039 e!494918))

(declare-fun res!602345 () Bool)

(assert (=> d!110039 (=> res!602345 e!494918)))

(declare-fun lt!401709 () Bool)

(assert (=> d!110039 (= res!602345 (not lt!401709))))

(declare-fun lt!401712 () Bool)

(assert (=> d!110039 (= lt!401709 lt!401712)))

(declare-fun lt!401711 () Unit!30260)

(declare-fun e!494919 () Unit!30260)

(assert (=> d!110039 (= lt!401711 e!494919)))

(declare-fun c!93827 () Bool)

(assert (=> d!110039 (= c!93827 lt!401712)))

(assert (=> d!110039 (= lt!401712 (containsKey!419 (toList!5329 call!39411) (ite c!93772 (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401577)) key!785)))))

(assert (=> d!110039 (= (contains!4319 call!39411 (ite c!93772 (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401577)) key!785)) lt!401709)))

(declare-fun b!888312 () Bool)

(declare-fun lt!401710 () Unit!30260)

(assert (=> b!888312 (= e!494919 lt!401710)))

(assert (=> b!888312 (= lt!401710 (lemmaContainsKeyImpliesGetValueByKeyDefined!315 (toList!5329 call!39411) (ite c!93772 (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401577)) key!785)))))

(assert (=> b!888312 (isDefined!318 (getValueByKey!439 (toList!5329 call!39411) (ite c!93772 (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401577)) key!785)))))

(declare-fun b!888313 () Bool)

(declare-fun Unit!30266 () Unit!30260)

(assert (=> b!888313 (= e!494919 Unit!30266)))

(declare-fun b!888314 () Bool)

(assert (=> b!888314 (= e!494918 (isDefined!318 (getValueByKey!439 (toList!5329 call!39411) (ite c!93772 (select (arr!24879 (_keys!9836 thiss!1181)) (index!37436 lt!401577)) key!785))))))

(assert (= (and d!110039 c!93827) b!888312))

(assert (= (and d!110039 (not c!93827)) b!888313))

(assert (= (and d!110039 (not res!602345)) b!888314))

(declare-fun m!827665 () Bool)

(assert (=> d!110039 m!827665))

(declare-fun m!827667 () Bool)

(assert (=> b!888312 m!827667))

(declare-fun m!827669 () Bool)

(assert (=> b!888312 m!827669))

(assert (=> b!888312 m!827669))

(declare-fun m!827671 () Bool)

(assert (=> b!888312 m!827671))

(assert (=> b!888314 m!827669))

(assert (=> b!888314 m!827669))

(assert (=> b!888314 m!827671))

(assert (=> bm!39408 d!110039))

(declare-fun b!888316 () Bool)

(declare-fun e!494920 () Bool)

(assert (=> b!888316 (= e!494920 tp_is_empty!17883)))

(declare-fun b!888315 () Bool)

(declare-fun e!494921 () Bool)

(assert (=> b!888315 (= e!494921 tp_is_empty!17883)))

(declare-fun mapIsEmpty!28364 () Bool)

(declare-fun mapRes!28364 () Bool)

(assert (=> mapIsEmpty!28364 mapRes!28364))

(declare-fun mapNonEmpty!28364 () Bool)

(declare-fun tp!54622 () Bool)

(assert (=> mapNonEmpty!28364 (= mapRes!28364 (and tp!54622 e!494921))))

(declare-fun mapRest!28364 () (Array (_ BitVec 32) ValueCell!8460))

(declare-fun mapValue!28364 () ValueCell!8460)

(declare-fun mapKey!28364 () (_ BitVec 32))

(assert (=> mapNonEmpty!28364 (= mapRest!28363 (store mapRest!28364 mapKey!28364 mapValue!28364))))

(declare-fun condMapEmpty!28364 () Bool)

(declare-fun mapDefault!28364 () ValueCell!8460)

(assert (=> mapNonEmpty!28363 (= condMapEmpty!28364 (= mapRest!28363 ((as const (Array (_ BitVec 32) ValueCell!8460)) mapDefault!28364)))))

(assert (=> mapNonEmpty!28363 (= tp!54621 (and e!494920 mapRes!28364))))

(assert (= (and mapNonEmpty!28363 condMapEmpty!28364) mapIsEmpty!28364))

(assert (= (and mapNonEmpty!28363 (not condMapEmpty!28364)) mapNonEmpty!28364))

(assert (= (and mapNonEmpty!28364 ((_ is ValueCellFull!8460) mapValue!28364)) b!888315))

(assert (= (and mapNonEmpty!28363 ((_ is ValueCellFull!8460) mapDefault!28364)) b!888316))

(declare-fun m!827673 () Bool)

(assert (=> mapNonEmpty!28364 m!827673))

(declare-fun b_lambda!12877 () Bool)

(assert (= b_lambda!12875 (or (and b!888059 b_free!15555) b_lambda!12877)))

(check-sat (not bm!39427) (not d!110033) (not bm!39433) (not b!888207) (not b!888214) (not d!110027) (not b!888211) (not d!110005) b_and!25795 (not b!888235) (not d!110011) (not b!888221) (not b!888285) (not b!888220) tp_is_empty!17883 (not b!888218) (not bm!39440) (not b!888293) (not b!888157) (not b!888294) (not b!888236) (not d!110039) (not bm!39426) (not d!110013) (not d!110015) (not b!888148) (not mapNonEmpty!28364) (not d!110025) (not b_next!15555) (not d!110021) (not b!888260) (not b!888310) (not b!888312) (not b!888314) (not b!888249) (not b!888309) (not b!888219) (not b!888276) (not b!888146) (not b_lambda!12877) (not b!888292) (not bm!39429) (not b!888307) (not bm!39436) (not b!888154) (not b!888248) (not b!888209) (not d!110031) (not b!888226) (not bm!39437) (not bm!39425))
(check-sat b_and!25795 (not b_next!15555))
