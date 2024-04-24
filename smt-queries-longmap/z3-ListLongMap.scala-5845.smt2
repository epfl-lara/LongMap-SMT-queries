; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75668 () Bool)

(assert start!75668)

(declare-fun b!889329 () Bool)

(declare-fun b_free!15571 () Bool)

(declare-fun b_next!15571 () Bool)

(assert (=> b!889329 (= b_free!15571 (not b_next!15571))))

(declare-fun tp!54664 () Bool)

(declare-fun b_and!25819 () Bool)

(assert (=> b!889329 (= tp!54664 b_and!25819)))

(declare-fun b!889324 () Bool)

(declare-fun e!495616 () Bool)

(declare-fun tp_is_empty!17899 () Bool)

(assert (=> b!889324 (= e!495616 tp_is_empty!17899)))

(declare-fun b!889325 () Bool)

(declare-fun e!495619 () Bool)

(assert (=> b!889325 (= e!495619 tp_is_empty!17899)))

(declare-fun mapNonEmpty!28385 () Bool)

(declare-fun mapRes!28385 () Bool)

(declare-fun tp!54665 () Bool)

(assert (=> mapNonEmpty!28385 (= mapRes!28385 (and tp!54665 e!495619))))

(declare-datatypes ((array!51807 0))(
  ( (array!51808 (arr!24910 (Array (_ BitVec 32) (_ BitVec 64))) (size!25352 (_ BitVec 32))) )
))
(declare-datatypes ((V!28831 0))(
  ( (V!28832 (val!9000 Int)) )
))
(declare-datatypes ((ValueCell!8468 0))(
  ( (ValueCellFull!8468 (v!11470 V!28831)) (EmptyCell!8468) )
))
(declare-datatypes ((array!51809 0))(
  ( (array!51810 (arr!24911 (Array (_ BitVec 32) ValueCell!8468)) (size!25353 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3952 0))(
  ( (LongMapFixedSize!3953 (defaultEntry!5170 Int) (mask!25635 (_ BitVec 32)) (extraKeys!4864 (_ BitVec 32)) (zeroValue!4968 V!28831) (minValue!4968 V!28831) (_size!2031 (_ BitVec 32)) (_keys!9877 array!51807) (_values!5155 array!51809) (_vacant!2031 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3952)

(declare-fun mapKey!28385 () (_ BitVec 32))

(declare-fun mapRest!28385 () (Array (_ BitVec 32) ValueCell!8468))

(declare-fun mapValue!28385 () ValueCell!8468)

(assert (=> mapNonEmpty!28385 (= (arr!24911 (_values!5155 thiss!1181)) (store mapRest!28385 mapKey!28385 mapValue!28385))))

(declare-fun b!889326 () Bool)

(declare-fun res!602716 () Bool)

(declare-fun e!495618 () Bool)

(assert (=> b!889326 (=> (not res!602716) (not e!495618))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4300 (LongMapFixedSize!3952 (_ BitVec 64)) Bool)

(assert (=> b!889326 (= res!602716 (contains!4300 thiss!1181 key!785))))

(declare-fun b!889327 () Bool)

(declare-datatypes ((Option!444 0))(
  ( (Some!443 (v!11471 V!28831)) (None!442) )
))
(declare-fun isDefined!318 (Option!444) Bool)

(declare-datatypes ((tuple2!11856 0))(
  ( (tuple2!11857 (_1!5939 (_ BitVec 64)) (_2!5939 V!28831)) )
))
(declare-datatypes ((List!17641 0))(
  ( (Nil!17638) (Cons!17637 (h!18774 tuple2!11856) (t!24930 List!17641)) )
))
(declare-fun getValueByKey!438 (List!17641 (_ BitVec 64)) Option!444)

(declare-datatypes ((ListLongMap!10555 0))(
  ( (ListLongMap!10556 (toList!5293 List!17641)) )
))
(declare-fun map!12099 (LongMapFixedSize!3952) ListLongMap!10555)

(assert (=> b!889327 (= e!495618 (not (isDefined!318 (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785))))))

(declare-fun b!889328 () Bool)

(declare-fun e!495620 () Bool)

(assert (=> b!889328 (= e!495620 (and e!495616 mapRes!28385))))

(declare-fun condMapEmpty!28385 () Bool)

(declare-fun mapDefault!28385 () ValueCell!8468)

(assert (=> b!889328 (= condMapEmpty!28385 (= (arr!24911 (_values!5155 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8468)) mapDefault!28385)))))

(declare-fun mapIsEmpty!28385 () Bool)

(assert (=> mapIsEmpty!28385 mapRes!28385))

(declare-fun res!602714 () Bool)

(assert (=> start!75668 (=> (not res!602714) (not e!495618))))

(declare-fun valid!1551 (LongMapFixedSize!3952) Bool)

(assert (=> start!75668 (= res!602714 (valid!1551 thiss!1181))))

(assert (=> start!75668 e!495618))

(declare-fun e!495615 () Bool)

(assert (=> start!75668 e!495615))

(assert (=> start!75668 true))

(declare-fun array_inv!19640 (array!51807) Bool)

(declare-fun array_inv!19641 (array!51809) Bool)

(assert (=> b!889329 (= e!495615 (and tp!54664 tp_is_empty!17899 (array_inv!19640 (_keys!9877 thiss!1181)) (array_inv!19641 (_values!5155 thiss!1181)) e!495620))))

(declare-fun b!889330 () Bool)

(declare-fun res!602715 () Bool)

(assert (=> b!889330 (=> (not res!602715) (not e!495618))))

(assert (=> b!889330 (= res!602715 (and (= key!785 (bvneg key!785)) (or (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!75668 res!602714) b!889330))

(assert (= (and b!889330 res!602715) b!889326))

(assert (= (and b!889326 res!602716) b!889327))

(assert (= (and b!889328 condMapEmpty!28385) mapIsEmpty!28385))

(assert (= (and b!889328 (not condMapEmpty!28385)) mapNonEmpty!28385))

(get-info :version)

(assert (= (and mapNonEmpty!28385 ((_ is ValueCellFull!8468) mapValue!28385)) b!889325))

(assert (= (and b!889328 ((_ is ValueCellFull!8468) mapDefault!28385)) b!889324))

(assert (= b!889329 b!889328))

(assert (= start!75668 b!889329))

(declare-fun m!829023 () Bool)

(assert (=> mapNonEmpty!28385 m!829023))

(declare-fun m!829025 () Bool)

(assert (=> b!889326 m!829025))

(declare-fun m!829027 () Bool)

(assert (=> b!889327 m!829027))

(declare-fun m!829029 () Bool)

(assert (=> b!889327 m!829029))

(assert (=> b!889327 m!829029))

(declare-fun m!829031 () Bool)

(assert (=> b!889327 m!829031))

(declare-fun m!829033 () Bool)

(assert (=> b!889329 m!829033))

(declare-fun m!829035 () Bool)

(assert (=> b!889329 m!829035))

(declare-fun m!829037 () Bool)

(assert (=> start!75668 m!829037))

(check-sat (not b!889326) (not b_next!15571) tp_is_empty!17899 (not b!889329) (not b!889327) (not start!75668) (not mapNonEmpty!28385) b_and!25819)
(check-sat b_and!25819 (not b_next!15571))
(get-model)

(declare-fun d!110369 () Bool)

(declare-fun res!602741 () Bool)

(declare-fun e!495659 () Bool)

(assert (=> d!110369 (=> (not res!602741) (not e!495659))))

(declare-fun simpleValid!290 (LongMapFixedSize!3952) Bool)

(assert (=> d!110369 (= res!602741 (simpleValid!290 thiss!1181))))

(assert (=> d!110369 (= (valid!1551 thiss!1181) e!495659)))

(declare-fun b!889379 () Bool)

(declare-fun res!602742 () Bool)

(assert (=> b!889379 (=> (not res!602742) (not e!495659))))

(declare-fun arrayCountValidKeys!0 (array!51807 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889379 (= res!602742 (= (arrayCountValidKeys!0 (_keys!9877 thiss!1181) #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))) (_size!2031 thiss!1181)))))

(declare-fun b!889380 () Bool)

(declare-fun res!602743 () Bool)

(assert (=> b!889380 (=> (not res!602743) (not e!495659))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51807 (_ BitVec 32)) Bool)

(assert (=> b!889380 (= res!602743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(declare-fun b!889381 () Bool)

(declare-datatypes ((List!17643 0))(
  ( (Nil!17640) (Cons!17639 (h!18776 (_ BitVec 64)) (t!24932 List!17643)) )
))
(declare-fun arrayNoDuplicates!0 (array!51807 (_ BitVec 32) List!17643) Bool)

(assert (=> b!889381 (= e!495659 (arrayNoDuplicates!0 (_keys!9877 thiss!1181) #b00000000000000000000000000000000 Nil!17640))))

(assert (= (and d!110369 res!602741) b!889379))

(assert (= (and b!889379 res!602742) b!889380))

(assert (= (and b!889380 res!602743) b!889381))

(declare-fun m!829071 () Bool)

(assert (=> d!110369 m!829071))

(declare-fun m!829073 () Bool)

(assert (=> b!889379 m!829073))

(declare-fun m!829075 () Bool)

(assert (=> b!889380 m!829075))

(declare-fun m!829077 () Bool)

(assert (=> b!889381 m!829077))

(assert (=> start!75668 d!110369))

(declare-fun b!889402 () Bool)

(declare-fun e!495673 () Bool)

(declare-fun e!495671 () Bool)

(assert (=> b!889402 (= e!495673 e!495671)))

(declare-fun c!94122 () Bool)

(assert (=> b!889402 (= c!94122 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!889403 () Bool)

(assert (=> b!889403 (= e!495673 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!39492 () Bool)

(declare-fun call!39497 () Bool)

(declare-fun arrayContainsKey!0 (array!51807 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39492 (= call!39497 (arrayContainsKey!0 (_keys!9877 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun call!39495 () Bool)

(declare-fun bm!39493 () Bool)

(declare-fun c!94123 () Bool)

(declare-datatypes ((SeekEntryResult!8718 0))(
  ( (MissingZero!8718 (index!37243 (_ BitVec 32))) (Found!8718 (index!37244 (_ BitVec 32))) (Intermediate!8718 (undefined!9530 Bool) (index!37245 (_ BitVec 32)) (x!75352 (_ BitVec 32))) (Undefined!8718) (MissingVacant!8718 (index!37246 (_ BitVec 32))) )
))
(declare-fun lt!402130 () SeekEntryResult!8718)

(declare-fun call!39496 () ListLongMap!10555)

(declare-fun contains!4303 (ListLongMap!10555 (_ BitVec 64)) Bool)

(assert (=> bm!39493 (= call!39495 (contains!4303 call!39496 (ite c!94123 (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402130)) key!785)))))

(declare-fun b!889404 () Bool)

(declare-fun e!495674 () Bool)

(assert (=> b!889404 (= e!495674 true)))

(declare-datatypes ((Unit!30247 0))(
  ( (Unit!30248) )
))
(declare-fun lt!402128 () Unit!30247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51807 (_ BitVec 64) (_ BitVec 32)) Unit!30247)

(assert (=> b!889404 (= lt!402128 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9877 thiss!1181) key!785 (index!37244 lt!402130)))))

(assert (=> b!889404 call!39497))

(declare-fun lt!402136 () Unit!30247)

(assert (=> b!889404 (= lt!402136 lt!402128)))

(declare-fun lt!402135 () Unit!30247)

(declare-fun lemmaValidKeyInArrayIsInListMap!204 (array!51807 array!51809 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) Unit!30247)

(assert (=> b!889404 (= lt!402135 (lemmaValidKeyInArrayIsInListMap!204 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) (index!37244 lt!402130) (defaultEntry!5170 thiss!1181)))))

(assert (=> b!889404 call!39495))

(declare-fun lt!402134 () Unit!30247)

(assert (=> b!889404 (= lt!402134 lt!402135)))

(declare-fun bm!39494 () Bool)

(declare-fun getCurrentListMap!2574 (array!51807 array!51809 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) ListLongMap!10555)

(assert (=> bm!39494 (= call!39496 (getCurrentListMap!2574 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun d!110371 () Bool)

(declare-fun lt!402127 () Bool)

(assert (=> d!110371 (= lt!402127 (contains!4303 (map!12099 thiss!1181) key!785))))

(assert (=> d!110371 (= lt!402127 e!495673)))

(declare-fun c!94124 () Bool)

(assert (=> d!110371 (= c!94124 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110371 (valid!1551 thiss!1181)))

(assert (=> d!110371 (= (contains!4300 thiss!1181 key!785) lt!402127)))

(declare-fun b!889405 () Bool)

(declare-fun e!495672 () Bool)

(assert (=> b!889405 (= e!495672 call!39497)))

(declare-fun b!889406 () Bool)

(assert (=> b!889406 false))

(declare-fun lt!402132 () Unit!30247)

(declare-fun lt!402125 () Unit!30247)

(assert (=> b!889406 (= lt!402132 lt!402125)))

(declare-fun lt!402126 () SeekEntryResult!8718)

(declare-fun lt!402131 () (_ BitVec 32))

(assert (=> b!889406 (and ((_ is Found!8718) lt!402126) (= (index!37244 lt!402126) lt!402131))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51807 (_ BitVec 32)) SeekEntryResult!8718)

(assert (=> b!889406 (= lt!402126 (seekEntry!0 key!785 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!51807 (_ BitVec 32)) Unit!30247)

(assert (=> b!889406 (= lt!402125 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!402131 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(declare-fun lt!402123 () Unit!30247)

(declare-fun lt!402129 () Unit!30247)

(assert (=> b!889406 (= lt!402123 lt!402129)))

(assert (=> b!889406 (arrayForallSeekEntryOrOpenFound!0 lt!402131 (_keys!9877 thiss!1181) (mask!25635 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!51807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30247)

(assert (=> b!889406 (= lt!402129 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9877 thiss!1181) (mask!25635 thiss!1181) #b00000000000000000000000000000000 lt!402131))))

(declare-fun arrayScanForKey!0 (array!51807 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!889406 (= lt!402131 (arrayScanForKey!0 (_keys!9877 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!402133 () Unit!30247)

(declare-fun lt!402124 () Unit!30247)

(assert (=> b!889406 (= lt!402133 lt!402124)))

(assert (=> b!889406 e!495672))

(declare-fun c!94120 () Bool)

(assert (=> b!889406 (= c!94120 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!161 (array!51807 array!51809 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 64) Int) Unit!30247)

(assert (=> b!889406 (= lt!402124 (lemmaKeyInListMapIsInArray!161 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) key!785 (defaultEntry!5170 thiss!1181)))))

(declare-fun e!495670 () Unit!30247)

(declare-fun Unit!30249 () Unit!30247)

(assert (=> b!889406 (= e!495670 Unit!30249)))

(declare-fun b!889407 () Bool)

(assert (=> b!889407 (= e!495674 false)))

(declare-fun c!94121 () Bool)

(assert (=> b!889407 (= c!94121 call!39495)))

(declare-fun lt!402122 () Unit!30247)

(assert (=> b!889407 (= lt!402122 e!495670)))

(declare-fun b!889408 () Bool)

(assert (=> b!889408 (= c!94123 ((_ is Found!8718) lt!402130))))

(assert (=> b!889408 (= lt!402130 (seekEntry!0 key!785 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(assert (=> b!889408 (= e!495671 e!495674)))

(declare-fun b!889409 () Bool)

(assert (=> b!889409 (= e!495672 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!889410 () Bool)

(declare-fun Unit!30250 () Unit!30247)

(assert (=> b!889410 (= e!495670 Unit!30250)))

(declare-fun b!889411 () Bool)

(assert (=> b!889411 (= e!495671 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!110371 c!94124) b!889403))

(assert (= (and d!110371 (not c!94124)) b!889402))

(assert (= (and b!889402 c!94122) b!889411))

(assert (= (and b!889402 (not c!94122)) b!889408))

(assert (= (and b!889408 c!94123) b!889404))

(assert (= (and b!889408 (not c!94123)) b!889407))

(assert (= (and b!889407 c!94121) b!889406))

(assert (= (and b!889407 (not c!94121)) b!889410))

(assert (= (and b!889406 c!94120) b!889405))

(assert (= (and b!889406 (not c!94120)) b!889409))

(assert (= (or b!889404 b!889405) bm!39492))

(assert (= (or b!889404 b!889407) bm!39494))

(assert (= (or b!889404 b!889407) bm!39493))

(declare-fun m!829079 () Bool)

(assert (=> bm!39492 m!829079))

(declare-fun m!829081 () Bool)

(assert (=> b!889406 m!829081))

(declare-fun m!829083 () Bool)

(assert (=> b!889406 m!829083))

(declare-fun m!829085 () Bool)

(assert (=> b!889406 m!829085))

(declare-fun m!829087 () Bool)

(assert (=> b!889406 m!829087))

(declare-fun m!829089 () Bool)

(assert (=> b!889406 m!829089))

(declare-fun m!829091 () Bool)

(assert (=> b!889406 m!829091))

(declare-fun m!829093 () Bool)

(assert (=> bm!39493 m!829093))

(declare-fun m!829095 () Bool)

(assert (=> bm!39493 m!829095))

(assert (=> d!110371 m!829027))

(assert (=> d!110371 m!829027))

(declare-fun m!829097 () Bool)

(assert (=> d!110371 m!829097))

(assert (=> d!110371 m!829037))

(assert (=> b!889408 m!829083))

(declare-fun m!829099 () Bool)

(assert (=> b!889404 m!829099))

(declare-fun m!829101 () Bool)

(assert (=> b!889404 m!829101))

(declare-fun m!829103 () Bool)

(assert (=> bm!39494 m!829103))

(assert (=> b!889326 d!110371))

(declare-fun d!110373 () Bool)

(declare-fun isEmpty!682 (Option!444) Bool)

(assert (=> d!110373 (= (isDefined!318 (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785)) (not (isEmpty!682 (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785))))))

(declare-fun bs!24932 () Bool)

(assert (= bs!24932 d!110373))

(assert (=> bs!24932 m!829029))

(declare-fun m!829105 () Bool)

(assert (=> bs!24932 m!829105))

(assert (=> b!889327 d!110373))

(declare-fun b!889420 () Bool)

(declare-fun e!495679 () Option!444)

(assert (=> b!889420 (= e!495679 (Some!443 (_2!5939 (h!18774 (toList!5293 (map!12099 thiss!1181))))))))

(declare-fun b!889423 () Bool)

(declare-fun e!495680 () Option!444)

(assert (=> b!889423 (= e!495680 None!442)))

(declare-fun b!889421 () Bool)

(assert (=> b!889421 (= e!495679 e!495680)))

(declare-fun c!94130 () Bool)

(assert (=> b!889421 (= c!94130 (and ((_ is Cons!17637) (toList!5293 (map!12099 thiss!1181))) (not (= (_1!5939 (h!18774 (toList!5293 (map!12099 thiss!1181)))) key!785))))))

(declare-fun d!110375 () Bool)

(declare-fun c!94129 () Bool)

(assert (=> d!110375 (= c!94129 (and ((_ is Cons!17637) (toList!5293 (map!12099 thiss!1181))) (= (_1!5939 (h!18774 (toList!5293 (map!12099 thiss!1181)))) key!785)))))

(assert (=> d!110375 (= (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785) e!495679)))

(declare-fun b!889422 () Bool)

(assert (=> b!889422 (= e!495680 (getValueByKey!438 (t!24930 (toList!5293 (map!12099 thiss!1181))) key!785))))

(assert (= (and d!110375 c!94129) b!889420))

(assert (= (and d!110375 (not c!94129)) b!889421))

(assert (= (and b!889421 c!94130) b!889422))

(assert (= (and b!889421 (not c!94130)) b!889423))

(declare-fun m!829107 () Bool)

(assert (=> b!889422 m!829107))

(assert (=> b!889327 d!110375))

(declare-fun d!110377 () Bool)

(assert (=> d!110377 (= (map!12099 thiss!1181) (getCurrentListMap!2574 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun bs!24933 () Bool)

(assert (= bs!24933 d!110377))

(assert (=> bs!24933 m!829103))

(assert (=> b!889327 d!110377))

(declare-fun d!110379 () Bool)

(assert (=> d!110379 (= (array_inv!19640 (_keys!9877 thiss!1181)) (bvsge (size!25352 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889329 d!110379))

(declare-fun d!110381 () Bool)

(assert (=> d!110381 (= (array_inv!19641 (_values!5155 thiss!1181)) (bvsge (size!25353 (_values!5155 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889329 d!110381))

(declare-fun mapIsEmpty!28394 () Bool)

(declare-fun mapRes!28394 () Bool)

(assert (=> mapIsEmpty!28394 mapRes!28394))

(declare-fun b!889431 () Bool)

(declare-fun e!495686 () Bool)

(assert (=> b!889431 (= e!495686 tp_is_empty!17899)))

(declare-fun mapNonEmpty!28394 () Bool)

(declare-fun tp!54680 () Bool)

(declare-fun e!495685 () Bool)

(assert (=> mapNonEmpty!28394 (= mapRes!28394 (and tp!54680 e!495685))))

(declare-fun mapValue!28394 () ValueCell!8468)

(declare-fun mapRest!28394 () (Array (_ BitVec 32) ValueCell!8468))

(declare-fun mapKey!28394 () (_ BitVec 32))

(assert (=> mapNonEmpty!28394 (= mapRest!28385 (store mapRest!28394 mapKey!28394 mapValue!28394))))

(declare-fun b!889430 () Bool)

(assert (=> b!889430 (= e!495685 tp_is_empty!17899)))

(declare-fun condMapEmpty!28394 () Bool)

(declare-fun mapDefault!28394 () ValueCell!8468)

(assert (=> mapNonEmpty!28385 (= condMapEmpty!28394 (= mapRest!28385 ((as const (Array (_ BitVec 32) ValueCell!8468)) mapDefault!28394)))))

(assert (=> mapNonEmpty!28385 (= tp!54665 (and e!495686 mapRes!28394))))

(assert (= (and mapNonEmpty!28385 condMapEmpty!28394) mapIsEmpty!28394))

(assert (= (and mapNonEmpty!28385 (not condMapEmpty!28394)) mapNonEmpty!28394))

(assert (= (and mapNonEmpty!28394 ((_ is ValueCellFull!8468) mapValue!28394)) b!889430))

(assert (= (and mapNonEmpty!28385 ((_ is ValueCellFull!8468) mapDefault!28394)) b!889431))

(declare-fun m!829109 () Bool)

(assert (=> mapNonEmpty!28394 m!829109))

(check-sat (not b!889406) (not b!889380) (not b!889422) (not b!889404) (not d!110371) (not d!110377) (not d!110369) (not mapNonEmpty!28394) (not d!110373) (not b!889381) b_and!25819 (not b!889379) (not b!889408) (not b_next!15571) tp_is_empty!17899 (not bm!39493) (not bm!39494) (not bm!39492))
(check-sat b_and!25819 (not b_next!15571))
(get-model)

(declare-fun b!889444 () Bool)

(declare-fun e!495693 () SeekEntryResult!8718)

(declare-fun e!495694 () SeekEntryResult!8718)

(assert (=> b!889444 (= e!495693 e!495694)))

(declare-fun lt!402145 () (_ BitVec 64))

(declare-fun lt!402146 () SeekEntryResult!8718)

(assert (=> b!889444 (= lt!402145 (select (arr!24910 (_keys!9877 thiss!1181)) (index!37245 lt!402146)))))

(declare-fun c!94139 () Bool)

(assert (=> b!889444 (= c!94139 (= lt!402145 key!785))))

(declare-fun b!889445 () Bool)

(declare-fun c!94137 () Bool)

(assert (=> b!889445 (= c!94137 (= lt!402145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!495695 () SeekEntryResult!8718)

(assert (=> b!889445 (= e!495694 e!495695)))

(declare-fun d!110383 () Bool)

(declare-fun lt!402148 () SeekEntryResult!8718)

(assert (=> d!110383 (and (or ((_ is MissingVacant!8718) lt!402148) (not ((_ is Found!8718) lt!402148)) (and (bvsge (index!37244 lt!402148) #b00000000000000000000000000000000) (bvslt (index!37244 lt!402148) (size!25352 (_keys!9877 thiss!1181))))) (not ((_ is MissingVacant!8718) lt!402148)) (or (not ((_ is Found!8718) lt!402148)) (= (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402148)) key!785)))))

(assert (=> d!110383 (= lt!402148 e!495693)))

(declare-fun c!94138 () Bool)

(assert (=> d!110383 (= c!94138 (and ((_ is Intermediate!8718) lt!402146) (undefined!9530 lt!402146)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51807 (_ BitVec 32)) SeekEntryResult!8718)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110383 (= lt!402146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25635 thiss!1181)) key!785 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110383 (validMask!0 (mask!25635 thiss!1181))))

(assert (=> d!110383 (= (seekEntry!0 key!785 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)) lt!402148)))

(declare-fun b!889446 () Bool)

(assert (=> b!889446 (= e!495693 Undefined!8718)))

(declare-fun b!889447 () Bool)

(assert (=> b!889447 (= e!495694 (Found!8718 (index!37245 lt!402146)))))

(declare-fun b!889448 () Bool)

(assert (=> b!889448 (= e!495695 (MissingZero!8718 (index!37245 lt!402146)))))

(declare-fun b!889449 () Bool)

(declare-fun lt!402147 () SeekEntryResult!8718)

(assert (=> b!889449 (= e!495695 (ite ((_ is MissingVacant!8718) lt!402147) (MissingZero!8718 (index!37246 lt!402147)) lt!402147))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!51807 (_ BitVec 32)) SeekEntryResult!8718)

(assert (=> b!889449 (= lt!402147 (seekKeyOrZeroReturnVacant!0 (x!75352 lt!402146) (index!37245 lt!402146) (index!37245 lt!402146) key!785 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(assert (= (and d!110383 c!94138) b!889446))

(assert (= (and d!110383 (not c!94138)) b!889444))

(assert (= (and b!889444 c!94139) b!889447))

(assert (= (and b!889444 (not c!94139)) b!889445))

(assert (= (and b!889445 c!94137) b!889448))

(assert (= (and b!889445 (not c!94137)) b!889449))

(declare-fun m!829111 () Bool)

(assert (=> b!889444 m!829111))

(declare-fun m!829113 () Bool)

(assert (=> d!110383 m!829113))

(declare-fun m!829115 () Bool)

(assert (=> d!110383 m!829115))

(assert (=> d!110383 m!829115))

(declare-fun m!829117 () Bool)

(assert (=> d!110383 m!829117))

(declare-fun m!829119 () Bool)

(assert (=> d!110383 m!829119))

(declare-fun m!829121 () Bool)

(assert (=> b!889449 m!829121))

(assert (=> b!889408 d!110383))

(declare-fun d!110385 () Bool)

(assert (=> d!110385 (= (isEmpty!682 (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785)) (not ((_ is Some!443) (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785))))))

(assert (=> d!110373 d!110385))

(declare-fun d!110387 () Bool)

(declare-fun e!495698 () Bool)

(assert (=> d!110387 e!495698))

(declare-fun c!94142 () Bool)

(assert (=> d!110387 (= c!94142 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!402151 () Unit!30247)

(declare-fun choose!1464 (array!51807 array!51809 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 64) Int) Unit!30247)

(assert (=> d!110387 (= lt!402151 (choose!1464 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) key!785 (defaultEntry!5170 thiss!1181)))))

(assert (=> d!110387 (validMask!0 (mask!25635 thiss!1181))))

(assert (=> d!110387 (= (lemmaKeyInListMapIsInArray!161 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) key!785 (defaultEntry!5170 thiss!1181)) lt!402151)))

(declare-fun b!889454 () Bool)

(assert (=> b!889454 (= e!495698 (arrayContainsKey!0 (_keys!9877 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!889455 () Bool)

(assert (=> b!889455 (= e!495698 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110387 c!94142) b!889454))

(assert (= (and d!110387 (not c!94142)) b!889455))

(declare-fun m!829123 () Bool)

(assert (=> d!110387 m!829123))

(assert (=> d!110387 m!829119))

(assert (=> b!889454 m!829079))

(assert (=> b!889406 d!110387))

(assert (=> b!889406 d!110383))

(declare-fun b!889464 () Bool)

(declare-fun e!495705 () Bool)

(declare-fun e!495706 () Bool)

(assert (=> b!889464 (= e!495705 e!495706)))

(declare-fun lt!402159 () (_ BitVec 64))

(assert (=> b!889464 (= lt!402159 (select (arr!24910 (_keys!9877 thiss!1181)) lt!402131))))

(declare-fun lt!402158 () Unit!30247)

(assert (=> b!889464 (= lt!402158 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9877 thiss!1181) lt!402159 lt!402131))))

(assert (=> b!889464 (arrayContainsKey!0 (_keys!9877 thiss!1181) lt!402159 #b00000000000000000000000000000000)))

(declare-fun lt!402160 () Unit!30247)

(assert (=> b!889464 (= lt!402160 lt!402158)))

(declare-fun res!602748 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51807 (_ BitVec 32)) SeekEntryResult!8718)

(assert (=> b!889464 (= res!602748 (= (seekEntryOrOpen!0 (select (arr!24910 (_keys!9877 thiss!1181)) lt!402131) (_keys!9877 thiss!1181) (mask!25635 thiss!1181)) (Found!8718 lt!402131)))))

(assert (=> b!889464 (=> (not res!602748) (not e!495706))))

(declare-fun bm!39497 () Bool)

(declare-fun call!39500 () Bool)

(assert (=> bm!39497 (= call!39500 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!402131 #b00000000000000000000000000000001) (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(declare-fun b!889466 () Bool)

(assert (=> b!889466 (= e!495706 call!39500)))

(declare-fun b!889467 () Bool)

(assert (=> b!889467 (= e!495705 call!39500)))

(declare-fun b!889465 () Bool)

(declare-fun e!495707 () Bool)

(assert (=> b!889465 (= e!495707 e!495705)))

(declare-fun c!94145 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!889465 (= c!94145 (validKeyInArray!0 (select (arr!24910 (_keys!9877 thiss!1181)) lt!402131)))))

(declare-fun d!110389 () Bool)

(declare-fun res!602749 () Bool)

(assert (=> d!110389 (=> res!602749 e!495707)))

(assert (=> d!110389 (= res!602749 (bvsge lt!402131 (size!25352 (_keys!9877 thiss!1181))))))

(assert (=> d!110389 (= (arrayForallSeekEntryOrOpenFound!0 lt!402131 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)) e!495707)))

(assert (= (and d!110389 (not res!602749)) b!889465))

(assert (= (and b!889465 c!94145) b!889464))

(assert (= (and b!889465 (not c!94145)) b!889467))

(assert (= (and b!889464 res!602748) b!889466))

(assert (= (or b!889466 b!889467) bm!39497))

(declare-fun m!829125 () Bool)

(assert (=> b!889464 m!829125))

(declare-fun m!829127 () Bool)

(assert (=> b!889464 m!829127))

(declare-fun m!829129 () Bool)

(assert (=> b!889464 m!829129))

(assert (=> b!889464 m!829125))

(declare-fun m!829131 () Bool)

(assert (=> b!889464 m!829131))

(declare-fun m!829133 () Bool)

(assert (=> bm!39497 m!829133))

(assert (=> b!889465 m!829125))

(assert (=> b!889465 m!829125))

(declare-fun m!829135 () Bool)

(assert (=> b!889465 m!829135))

(assert (=> b!889406 d!110389))

(declare-fun d!110391 () Bool)

(declare-fun lt!402163 () (_ BitVec 32))

(assert (=> d!110391 (and (or (bvslt lt!402163 #b00000000000000000000000000000000) (bvsge lt!402163 (size!25352 (_keys!9877 thiss!1181))) (and (bvsge lt!402163 #b00000000000000000000000000000000) (bvslt lt!402163 (size!25352 (_keys!9877 thiss!1181))))) (bvsge lt!402163 #b00000000000000000000000000000000) (bvslt lt!402163 (size!25352 (_keys!9877 thiss!1181))) (= (select (arr!24910 (_keys!9877 thiss!1181)) lt!402163) key!785))))

(declare-fun e!495710 () (_ BitVec 32))

(assert (=> d!110391 (= lt!402163 e!495710)))

(declare-fun c!94148 () Bool)

(assert (=> d!110391 (= c!94148 (= (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110391 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))) (bvslt (size!25352 (_keys!9877 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110391 (= (arrayScanForKey!0 (_keys!9877 thiss!1181) key!785 #b00000000000000000000000000000000) lt!402163)))

(declare-fun b!889472 () Bool)

(assert (=> b!889472 (= e!495710 #b00000000000000000000000000000000)))

(declare-fun b!889473 () Bool)

(assert (=> b!889473 (= e!495710 (arrayScanForKey!0 (_keys!9877 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110391 c!94148) b!889472))

(assert (= (and d!110391 (not c!94148)) b!889473))

(declare-fun m!829137 () Bool)

(assert (=> d!110391 m!829137))

(declare-fun m!829139 () Bool)

(assert (=> d!110391 m!829139))

(declare-fun m!829141 () Bool)

(assert (=> b!889473 m!829141))

(assert (=> b!889406 d!110391))

(declare-fun d!110393 () Bool)

(assert (=> d!110393 (arrayForallSeekEntryOrOpenFound!0 lt!402131 (_keys!9877 thiss!1181) (mask!25635 thiss!1181))))

(declare-fun lt!402166 () Unit!30247)

(declare-fun choose!38 (array!51807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30247)

(assert (=> d!110393 (= lt!402166 (choose!38 (_keys!9877 thiss!1181) (mask!25635 thiss!1181) #b00000000000000000000000000000000 lt!402131))))

(assert (=> d!110393 (validMask!0 (mask!25635 thiss!1181))))

(assert (=> d!110393 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9877 thiss!1181) (mask!25635 thiss!1181) #b00000000000000000000000000000000 lt!402131) lt!402166)))

(declare-fun bs!24934 () Bool)

(assert (= bs!24934 d!110393))

(assert (=> bs!24934 m!829091))

(declare-fun m!829143 () Bool)

(assert (=> bs!24934 m!829143))

(assert (=> bs!24934 m!829119))

(assert (=> b!889406 d!110393))

(declare-fun d!110395 () Bool)

(declare-fun lt!402172 () SeekEntryResult!8718)

(assert (=> d!110395 (and ((_ is Found!8718) lt!402172) (= (index!37244 lt!402172) lt!402131))))

(assert (=> d!110395 (= lt!402172 (seekEntry!0 key!785 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(declare-fun lt!402171 () Unit!30247)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!51807 (_ BitVec 32)) Unit!30247)

(assert (=> d!110395 (= lt!402171 (choose!0 key!785 lt!402131 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(assert (=> d!110395 (validMask!0 (mask!25635 thiss!1181))))

(assert (=> d!110395 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!402131 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)) lt!402171)))

(declare-fun bs!24935 () Bool)

(assert (= bs!24935 d!110395))

(assert (=> bs!24935 m!829083))

(declare-fun m!829145 () Bool)

(assert (=> bs!24935 m!829145))

(assert (=> bs!24935 m!829119))

(assert (=> b!889406 d!110395))

(declare-fun b!889516 () Bool)

(declare-fun res!602768 () Bool)

(declare-fun e!495749 () Bool)

(assert (=> b!889516 (=> (not res!602768) (not e!495749))))

(declare-fun e!495748 () Bool)

(assert (=> b!889516 (= res!602768 e!495748)))

(declare-fun c!94163 () Bool)

(assert (=> b!889516 (= c!94163 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!889517 () Bool)

(declare-fun e!495747 () ListLongMap!10555)

(declare-fun call!39515 () ListLongMap!10555)

(assert (=> b!889517 (= e!495747 call!39515)))

(declare-fun b!889518 () Bool)

(declare-fun e!495740 () Bool)

(assert (=> b!889518 (= e!495740 (validKeyInArray!0 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889519 () Bool)

(declare-fun e!495743 () Bool)

(declare-fun call!39518 () Bool)

(assert (=> b!889519 (= e!495743 (not call!39518))))

(declare-fun b!889520 () Bool)

(declare-fun call!39519 () ListLongMap!10555)

(assert (=> b!889520 (= e!495747 call!39519)))

(declare-fun b!889521 () Bool)

(declare-fun e!495739 () Unit!30247)

(declare-fun Unit!30251 () Unit!30247)

(assert (=> b!889521 (= e!495739 Unit!30251)))

(declare-fun b!889522 () Bool)

(declare-fun call!39521 () Bool)

(assert (=> b!889522 (= e!495748 (not call!39521))))

(declare-fun bm!39512 () Bool)

(declare-fun lt!402217 () ListLongMap!10555)

(assert (=> bm!39512 (= call!39518 (contains!4303 lt!402217 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!889523 () Bool)

(declare-fun e!495745 () Bool)

(assert (=> b!889523 (= e!495748 e!495745)))

(declare-fun res!602770 () Bool)

(assert (=> b!889523 (= res!602770 call!39521)))

(assert (=> b!889523 (=> (not res!602770) (not e!495745))))

(declare-fun b!889524 () Bool)

(declare-fun e!495738 () Bool)

(assert (=> b!889524 (= e!495743 e!495738)))

(declare-fun res!602771 () Bool)

(assert (=> b!889524 (= res!602771 call!39518)))

(assert (=> b!889524 (=> (not res!602771) (not e!495738))))

(declare-fun bm!39513 () Bool)

(declare-fun call!39516 () ListLongMap!10555)

(assert (=> bm!39513 (= call!39519 call!39516)))

(declare-fun b!889525 () Bool)

(declare-fun e!495737 () Bool)

(declare-fun apply!396 (ListLongMap!10555 (_ BitVec 64)) V!28831)

(declare-fun get!13170 (ValueCell!8468 V!28831) V!28831)

(declare-fun dynLambda!1305 (Int (_ BitVec 64)) V!28831)

(assert (=> b!889525 (= e!495737 (= (apply!396 lt!402217 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)) (get!13170 (select (arr!24911 (_values!5155 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1305 (defaultEntry!5170 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!889525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25353 (_values!5155 thiss!1181))))))

(assert (=> b!889525 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))

(declare-fun d!110397 () Bool)

(assert (=> d!110397 e!495749))

(declare-fun res!602776 () Bool)

(assert (=> d!110397 (=> (not res!602776) (not e!495749))))

(assert (=> d!110397 (= res!602776 (or (bvsge #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))))

(declare-fun lt!402223 () ListLongMap!10555)

(assert (=> d!110397 (= lt!402217 lt!402223)))

(declare-fun lt!402218 () Unit!30247)

(assert (=> d!110397 (= lt!402218 e!495739)))

(declare-fun c!94165 () Bool)

(declare-fun e!495744 () Bool)

(assert (=> d!110397 (= c!94165 e!495744)))

(declare-fun res!602769 () Bool)

(assert (=> d!110397 (=> (not res!602769) (not e!495744))))

(assert (=> d!110397 (= res!602769 (bvslt #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))

(declare-fun e!495742 () ListLongMap!10555)

(assert (=> d!110397 (= lt!402223 e!495742)))

(declare-fun c!94164 () Bool)

(assert (=> d!110397 (= c!94164 (and (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110397 (validMask!0 (mask!25635 thiss!1181))))

(assert (=> d!110397 (= (getCurrentListMap!2574 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)) lt!402217)))

(declare-fun b!889526 () Bool)

(declare-fun lt!402236 () Unit!30247)

(assert (=> b!889526 (= e!495739 lt!402236)))

(declare-fun lt!402227 () ListLongMap!10555)

(declare-fun getCurrentListMapNoExtraKeys!3317 (array!51807 array!51809 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) ListLongMap!10555)

(assert (=> b!889526 (= lt!402227 (getCurrentListMapNoExtraKeys!3317 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!402226 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402226 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402220 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402220 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402237 () Unit!30247)

(declare-fun addStillContains!327 (ListLongMap!10555 (_ BitVec 64) V!28831 (_ BitVec 64)) Unit!30247)

(assert (=> b!889526 (= lt!402237 (addStillContains!327 lt!402227 lt!402226 (zeroValue!4968 thiss!1181) lt!402220))))

(declare-fun +!2596 (ListLongMap!10555 tuple2!11856) ListLongMap!10555)

(assert (=> b!889526 (contains!4303 (+!2596 lt!402227 (tuple2!11857 lt!402226 (zeroValue!4968 thiss!1181))) lt!402220)))

(declare-fun lt!402225 () Unit!30247)

(assert (=> b!889526 (= lt!402225 lt!402237)))

(declare-fun lt!402221 () ListLongMap!10555)

(assert (=> b!889526 (= lt!402221 (getCurrentListMapNoExtraKeys!3317 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!402230 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402230 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402234 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402234 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402232 () Unit!30247)

(declare-fun addApplyDifferent!327 (ListLongMap!10555 (_ BitVec 64) V!28831 (_ BitVec 64)) Unit!30247)

(assert (=> b!889526 (= lt!402232 (addApplyDifferent!327 lt!402221 lt!402230 (minValue!4968 thiss!1181) lt!402234))))

(assert (=> b!889526 (= (apply!396 (+!2596 lt!402221 (tuple2!11857 lt!402230 (minValue!4968 thiss!1181))) lt!402234) (apply!396 lt!402221 lt!402234))))

(declare-fun lt!402238 () Unit!30247)

(assert (=> b!889526 (= lt!402238 lt!402232)))

(declare-fun lt!402228 () ListLongMap!10555)

(assert (=> b!889526 (= lt!402228 (getCurrentListMapNoExtraKeys!3317 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!402222 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402222 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402224 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402224 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402219 () Unit!30247)

(assert (=> b!889526 (= lt!402219 (addApplyDifferent!327 lt!402228 lt!402222 (zeroValue!4968 thiss!1181) lt!402224))))

(assert (=> b!889526 (= (apply!396 (+!2596 lt!402228 (tuple2!11857 lt!402222 (zeroValue!4968 thiss!1181))) lt!402224) (apply!396 lt!402228 lt!402224))))

(declare-fun lt!402235 () Unit!30247)

(assert (=> b!889526 (= lt!402235 lt!402219)))

(declare-fun lt!402233 () ListLongMap!10555)

(assert (=> b!889526 (= lt!402233 (getCurrentListMapNoExtraKeys!3317 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun lt!402229 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402229 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!402231 () (_ BitVec 64))

(assert (=> b!889526 (= lt!402231 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!889526 (= lt!402236 (addApplyDifferent!327 lt!402233 lt!402229 (minValue!4968 thiss!1181) lt!402231))))

(assert (=> b!889526 (= (apply!396 (+!2596 lt!402233 (tuple2!11857 lt!402229 (minValue!4968 thiss!1181))) lt!402231) (apply!396 lt!402233 lt!402231))))

(declare-fun b!889527 () Bool)

(declare-fun e!495746 () Bool)

(assert (=> b!889527 (= e!495746 e!495737)))

(declare-fun res!602773 () Bool)

(assert (=> b!889527 (=> (not res!602773) (not e!495737))))

(assert (=> b!889527 (= res!602773 (contains!4303 lt!402217 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!889527 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))

(declare-fun bm!39514 () Bool)

(assert (=> bm!39514 (= call!39521 (contains!4303 lt!402217 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!889528 () Bool)

(assert (=> b!889528 (= e!495749 e!495743)))

(declare-fun c!94166 () Bool)

(assert (=> b!889528 (= c!94166 (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39515 () Bool)

(declare-fun call!39520 () ListLongMap!10555)

(assert (=> bm!39515 (= call!39515 call!39520)))

(declare-fun bm!39516 () Bool)

(declare-fun call!39517 () ListLongMap!10555)

(assert (=> bm!39516 (= call!39517 (getCurrentListMapNoExtraKeys!3317 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)))))

(declare-fun b!889529 () Bool)

(assert (=> b!889529 (= e!495742 (+!2596 call!39520 (tuple2!11857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4968 thiss!1181))))))

(declare-fun b!889530 () Bool)

(declare-fun c!94162 () Bool)

(assert (=> b!889530 (= c!94162 (and (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!495741 () ListLongMap!10555)

(assert (=> b!889530 (= e!495741 e!495747)))

(declare-fun b!889531 () Bool)

(declare-fun res!602774 () Bool)

(assert (=> b!889531 (=> (not res!602774) (not e!495749))))

(assert (=> b!889531 (= res!602774 e!495746)))

(declare-fun res!602772 () Bool)

(assert (=> b!889531 (=> res!602772 e!495746)))

(assert (=> b!889531 (= res!602772 (not e!495740))))

(declare-fun res!602775 () Bool)

(assert (=> b!889531 (=> (not res!602775) (not e!495740))))

(assert (=> b!889531 (= res!602775 (bvslt #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))

(declare-fun b!889532 () Bool)

(assert (=> b!889532 (= e!495744 (validKeyInArray!0 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889533 () Bool)

(assert (=> b!889533 (= e!495738 (= (apply!396 lt!402217 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4968 thiss!1181)))))

(declare-fun b!889534 () Bool)

(assert (=> b!889534 (= e!495741 call!39515)))

(declare-fun b!889535 () Bool)

(assert (=> b!889535 (= e!495745 (= (apply!396 lt!402217 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4968 thiss!1181)))))

(declare-fun b!889536 () Bool)

(assert (=> b!889536 (= e!495742 e!495741)))

(declare-fun c!94161 () Bool)

(assert (=> b!889536 (= c!94161 (and (not (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4864 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!39517 () Bool)

(assert (=> bm!39517 (= call!39516 call!39517)))

(declare-fun bm!39518 () Bool)

(assert (=> bm!39518 (= call!39520 (+!2596 (ite c!94164 call!39517 (ite c!94161 call!39516 call!39519)) (ite (or c!94164 c!94161) (tuple2!11857 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4968 thiss!1181)) (tuple2!11857 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4968 thiss!1181)))))))

(assert (= (and d!110397 c!94164) b!889529))

(assert (= (and d!110397 (not c!94164)) b!889536))

(assert (= (and b!889536 c!94161) b!889534))

(assert (= (and b!889536 (not c!94161)) b!889530))

(assert (= (and b!889530 c!94162) b!889517))

(assert (= (and b!889530 (not c!94162)) b!889520))

(assert (= (or b!889517 b!889520) bm!39513))

(assert (= (or b!889534 bm!39513) bm!39517))

(assert (= (or b!889534 b!889517) bm!39515))

(assert (= (or b!889529 bm!39517) bm!39516))

(assert (= (or b!889529 bm!39515) bm!39518))

(assert (= (and d!110397 res!602769) b!889532))

(assert (= (and d!110397 c!94165) b!889526))

(assert (= (and d!110397 (not c!94165)) b!889521))

(assert (= (and d!110397 res!602776) b!889531))

(assert (= (and b!889531 res!602775) b!889518))

(assert (= (and b!889531 (not res!602772)) b!889527))

(assert (= (and b!889527 res!602773) b!889525))

(assert (= (and b!889531 res!602774) b!889516))

(assert (= (and b!889516 c!94163) b!889523))

(assert (= (and b!889516 (not c!94163)) b!889522))

(assert (= (and b!889523 res!602770) b!889535))

(assert (= (or b!889523 b!889522) bm!39514))

(assert (= (and b!889516 res!602768) b!889528))

(assert (= (and b!889528 c!94166) b!889524))

(assert (= (and b!889528 (not c!94166)) b!889519))

(assert (= (and b!889524 res!602771) b!889533))

(assert (= (or b!889524 b!889519) bm!39512))

(declare-fun b_lambda!12893 () Bool)

(assert (=> (not b_lambda!12893) (not b!889525)))

(declare-fun t!24934 () Bool)

(declare-fun tb!5141 () Bool)

(assert (=> (and b!889329 (= (defaultEntry!5170 thiss!1181) (defaultEntry!5170 thiss!1181)) t!24934) tb!5141))

(declare-fun result!9993 () Bool)

(assert (=> tb!5141 (= result!9993 tp_is_empty!17899)))

(assert (=> b!889525 t!24934))

(declare-fun b_and!25825 () Bool)

(assert (= b_and!25819 (and (=> t!24934 result!9993) b_and!25825)))

(declare-fun m!829147 () Bool)

(assert (=> b!889529 m!829147))

(declare-fun m!829149 () Bool)

(assert (=> bm!39514 m!829149))

(assert (=> b!889527 m!829139))

(assert (=> b!889527 m!829139))

(declare-fun m!829151 () Bool)

(assert (=> b!889527 m!829151))

(assert (=> b!889532 m!829139))

(assert (=> b!889532 m!829139))

(declare-fun m!829153 () Bool)

(assert (=> b!889532 m!829153))

(assert (=> b!889518 m!829139))

(assert (=> b!889518 m!829139))

(assert (=> b!889518 m!829153))

(declare-fun m!829155 () Bool)

(assert (=> bm!39518 m!829155))

(declare-fun m!829157 () Bool)

(assert (=> bm!39516 m!829157))

(declare-fun m!829159 () Bool)

(assert (=> b!889526 m!829159))

(declare-fun m!829161 () Bool)

(assert (=> b!889526 m!829161))

(assert (=> b!889526 m!829159))

(declare-fun m!829163 () Bool)

(assert (=> b!889526 m!829163))

(declare-fun m!829165 () Bool)

(assert (=> b!889526 m!829165))

(declare-fun m!829167 () Bool)

(assert (=> b!889526 m!829167))

(declare-fun m!829169 () Bool)

(assert (=> b!889526 m!829169))

(declare-fun m!829171 () Bool)

(assert (=> b!889526 m!829171))

(declare-fun m!829173 () Bool)

(assert (=> b!889526 m!829173))

(declare-fun m!829175 () Bool)

(assert (=> b!889526 m!829175))

(declare-fun m!829177 () Bool)

(assert (=> b!889526 m!829177))

(declare-fun m!829179 () Bool)

(assert (=> b!889526 m!829179))

(assert (=> b!889526 m!829165))

(assert (=> b!889526 m!829157))

(declare-fun m!829181 () Bool)

(assert (=> b!889526 m!829181))

(declare-fun m!829183 () Bool)

(assert (=> b!889526 m!829183))

(assert (=> b!889526 m!829171))

(declare-fun m!829185 () Bool)

(assert (=> b!889526 m!829185))

(assert (=> b!889526 m!829139))

(declare-fun m!829187 () Bool)

(assert (=> b!889526 m!829187))

(assert (=> b!889526 m!829181))

(declare-fun m!829189 () Bool)

(assert (=> b!889535 m!829189))

(assert (=> d!110397 m!829119))

(declare-fun m!829191 () Bool)

(assert (=> bm!39512 m!829191))

(declare-fun m!829193 () Bool)

(assert (=> b!889525 m!829193))

(declare-fun m!829195 () Bool)

(assert (=> b!889525 m!829195))

(assert (=> b!889525 m!829195))

(assert (=> b!889525 m!829193))

(declare-fun m!829197 () Bool)

(assert (=> b!889525 m!829197))

(assert (=> b!889525 m!829139))

(assert (=> b!889525 m!829139))

(declare-fun m!829199 () Bool)

(assert (=> b!889525 m!829199))

(declare-fun m!829201 () Bool)

(assert (=> b!889533 m!829201))

(assert (=> d!110377 d!110397))

(assert (=> bm!39494 d!110397))

(declare-fun d!110399 () Bool)

(assert (=> d!110399 (arrayContainsKey!0 (_keys!9877 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402241 () Unit!30247)

(declare-fun choose!13 (array!51807 (_ BitVec 64) (_ BitVec 32)) Unit!30247)

(assert (=> d!110399 (= lt!402241 (choose!13 (_keys!9877 thiss!1181) key!785 (index!37244 lt!402130)))))

(assert (=> d!110399 (bvsge (index!37244 lt!402130) #b00000000000000000000000000000000)))

(assert (=> d!110399 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9877 thiss!1181) key!785 (index!37244 lt!402130)) lt!402241)))

(declare-fun bs!24936 () Bool)

(assert (= bs!24936 d!110399))

(assert (=> bs!24936 m!829079))

(declare-fun m!829203 () Bool)

(assert (=> bs!24936 m!829203))

(assert (=> b!889404 d!110399))

(declare-fun d!110401 () Bool)

(declare-fun e!495752 () Bool)

(assert (=> d!110401 e!495752))

(declare-fun res!602779 () Bool)

(assert (=> d!110401 (=> (not res!602779) (not e!495752))))

(assert (=> d!110401 (= res!602779 (and (bvsge (index!37244 lt!402130) #b00000000000000000000000000000000) (bvslt (index!37244 lt!402130) (size!25352 (_keys!9877 thiss!1181)))))))

(declare-fun lt!402244 () Unit!30247)

(declare-fun choose!1465 (array!51807 array!51809 (_ BitVec 32) (_ BitVec 32) V!28831 V!28831 (_ BitVec 32) Int) Unit!30247)

(assert (=> d!110401 (= lt!402244 (choose!1465 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) (index!37244 lt!402130) (defaultEntry!5170 thiss!1181)))))

(assert (=> d!110401 (validMask!0 (mask!25635 thiss!1181))))

(assert (=> d!110401 (= (lemmaValidKeyInArrayIsInListMap!204 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) (index!37244 lt!402130) (defaultEntry!5170 thiss!1181)) lt!402244)))

(declare-fun b!889541 () Bool)

(assert (=> b!889541 (= e!495752 (contains!4303 (getCurrentListMap!2574 (_keys!9877 thiss!1181) (_values!5155 thiss!1181) (mask!25635 thiss!1181) (extraKeys!4864 thiss!1181) (zeroValue!4968 thiss!1181) (minValue!4968 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5170 thiss!1181)) (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402130))))))

(assert (= (and d!110401 res!602779) b!889541))

(declare-fun m!829205 () Bool)

(assert (=> d!110401 m!829205))

(assert (=> d!110401 m!829119))

(assert (=> b!889541 m!829103))

(assert (=> b!889541 m!829093))

(assert (=> b!889541 m!829103))

(assert (=> b!889541 m!829093))

(declare-fun m!829207 () Bool)

(assert (=> b!889541 m!829207))

(assert (=> b!889404 d!110401))

(declare-fun d!110403 () Bool)

(declare-fun e!495757 () Bool)

(assert (=> d!110403 e!495757))

(declare-fun res!602782 () Bool)

(assert (=> d!110403 (=> res!602782 e!495757)))

(declare-fun lt!402253 () Bool)

(assert (=> d!110403 (= res!602782 (not lt!402253))))

(declare-fun lt!402254 () Bool)

(assert (=> d!110403 (= lt!402253 lt!402254)))

(declare-fun lt!402255 () Unit!30247)

(declare-fun e!495758 () Unit!30247)

(assert (=> d!110403 (= lt!402255 e!495758)))

(declare-fun c!94169 () Bool)

(assert (=> d!110403 (= c!94169 lt!402254)))

(declare-fun containsKey!422 (List!17641 (_ BitVec 64)) Bool)

(assert (=> d!110403 (= lt!402254 (containsKey!422 (toList!5293 call!39496) (ite c!94123 (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402130)) key!785)))))

(assert (=> d!110403 (= (contains!4303 call!39496 (ite c!94123 (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402130)) key!785)) lt!402253)))

(declare-fun b!889548 () Bool)

(declare-fun lt!402256 () Unit!30247)

(assert (=> b!889548 (= e!495758 lt!402256)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!316 (List!17641 (_ BitVec 64)) Unit!30247)

(assert (=> b!889548 (= lt!402256 (lemmaContainsKeyImpliesGetValueByKeyDefined!316 (toList!5293 call!39496) (ite c!94123 (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402130)) key!785)))))

(assert (=> b!889548 (isDefined!318 (getValueByKey!438 (toList!5293 call!39496) (ite c!94123 (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402130)) key!785)))))

(declare-fun b!889549 () Bool)

(declare-fun Unit!30252 () Unit!30247)

(assert (=> b!889549 (= e!495758 Unit!30252)))

(declare-fun b!889550 () Bool)

(assert (=> b!889550 (= e!495757 (isDefined!318 (getValueByKey!438 (toList!5293 call!39496) (ite c!94123 (select (arr!24910 (_keys!9877 thiss!1181)) (index!37244 lt!402130)) key!785))))))

(assert (= (and d!110403 c!94169) b!889548))

(assert (= (and d!110403 (not c!94169)) b!889549))

(assert (= (and d!110403 (not res!602782)) b!889550))

(declare-fun m!829209 () Bool)

(assert (=> d!110403 m!829209))

(declare-fun m!829211 () Bool)

(assert (=> b!889548 m!829211))

(declare-fun m!829213 () Bool)

(assert (=> b!889548 m!829213))

(assert (=> b!889548 m!829213))

(declare-fun m!829215 () Bool)

(assert (=> b!889548 m!829215))

(assert (=> b!889550 m!829213))

(assert (=> b!889550 m!829213))

(assert (=> b!889550 m!829215))

(assert (=> bm!39493 d!110403))

(declare-fun b!889561 () Bool)

(declare-fun e!495767 () Bool)

(declare-fun contains!4304 (List!17643 (_ BitVec 64)) Bool)

(assert (=> b!889561 (= e!495767 (contains!4304 Nil!17640 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39521 () Bool)

(declare-fun call!39524 () Bool)

(declare-fun c!94172 () Bool)

(assert (=> bm!39521 (= call!39524 (arrayNoDuplicates!0 (_keys!9877 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94172 (Cons!17639 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000) Nil!17640) Nil!17640)))))

(declare-fun b!889562 () Bool)

(declare-fun e!495770 () Bool)

(declare-fun e!495768 () Bool)

(assert (=> b!889562 (= e!495770 e!495768)))

(declare-fun res!602791 () Bool)

(assert (=> b!889562 (=> (not res!602791) (not e!495768))))

(assert (=> b!889562 (= res!602791 (not e!495767))))

(declare-fun res!602789 () Bool)

(assert (=> b!889562 (=> (not res!602789) (not e!495767))))

(assert (=> b!889562 (= res!602789 (validKeyInArray!0 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889563 () Bool)

(declare-fun e!495769 () Bool)

(assert (=> b!889563 (= e!495768 e!495769)))

(assert (=> b!889563 (= c!94172 (validKeyInArray!0 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!889564 () Bool)

(assert (=> b!889564 (= e!495769 call!39524)))

(declare-fun d!110405 () Bool)

(declare-fun res!602790 () Bool)

(assert (=> d!110405 (=> res!602790 e!495770)))

(assert (=> d!110405 (= res!602790 (bvsge #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))

(assert (=> d!110405 (= (arrayNoDuplicates!0 (_keys!9877 thiss!1181) #b00000000000000000000000000000000 Nil!17640) e!495770)))

(declare-fun b!889565 () Bool)

(assert (=> b!889565 (= e!495769 call!39524)))

(assert (= (and d!110405 (not res!602790)) b!889562))

(assert (= (and b!889562 res!602789) b!889561))

(assert (= (and b!889562 res!602791) b!889563))

(assert (= (and b!889563 c!94172) b!889564))

(assert (= (and b!889563 (not c!94172)) b!889565))

(assert (= (or b!889564 b!889565) bm!39521))

(assert (=> b!889561 m!829139))

(assert (=> b!889561 m!829139))

(declare-fun m!829217 () Bool)

(assert (=> b!889561 m!829217))

(assert (=> bm!39521 m!829139))

(declare-fun m!829219 () Bool)

(assert (=> bm!39521 m!829219))

(assert (=> b!889562 m!829139))

(assert (=> b!889562 m!829139))

(assert (=> b!889562 m!829153))

(assert (=> b!889563 m!829139))

(assert (=> b!889563 m!829139))

(assert (=> b!889563 m!829153))

(assert (=> b!889381 d!110405))

(declare-fun d!110407 () Bool)

(declare-fun e!495771 () Bool)

(assert (=> d!110407 e!495771))

(declare-fun res!602792 () Bool)

(assert (=> d!110407 (=> res!602792 e!495771)))

(declare-fun lt!402257 () Bool)

(assert (=> d!110407 (= res!602792 (not lt!402257))))

(declare-fun lt!402258 () Bool)

(assert (=> d!110407 (= lt!402257 lt!402258)))

(declare-fun lt!402259 () Unit!30247)

(declare-fun e!495772 () Unit!30247)

(assert (=> d!110407 (= lt!402259 e!495772)))

(declare-fun c!94173 () Bool)

(assert (=> d!110407 (= c!94173 lt!402258)))

(assert (=> d!110407 (= lt!402258 (containsKey!422 (toList!5293 (map!12099 thiss!1181)) key!785))))

(assert (=> d!110407 (= (contains!4303 (map!12099 thiss!1181) key!785) lt!402257)))

(declare-fun b!889566 () Bool)

(declare-fun lt!402260 () Unit!30247)

(assert (=> b!889566 (= e!495772 lt!402260)))

(assert (=> b!889566 (= lt!402260 (lemmaContainsKeyImpliesGetValueByKeyDefined!316 (toList!5293 (map!12099 thiss!1181)) key!785))))

(assert (=> b!889566 (isDefined!318 (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785))))

(declare-fun b!889567 () Bool)

(declare-fun Unit!30253 () Unit!30247)

(assert (=> b!889567 (= e!495772 Unit!30253)))

(declare-fun b!889568 () Bool)

(assert (=> b!889568 (= e!495771 (isDefined!318 (getValueByKey!438 (toList!5293 (map!12099 thiss!1181)) key!785)))))

(assert (= (and d!110407 c!94173) b!889566))

(assert (= (and d!110407 (not c!94173)) b!889567))

(assert (= (and d!110407 (not res!602792)) b!889568))

(declare-fun m!829221 () Bool)

(assert (=> d!110407 m!829221))

(declare-fun m!829223 () Bool)

(assert (=> b!889566 m!829223))

(assert (=> b!889566 m!829029))

(assert (=> b!889566 m!829029))

(assert (=> b!889566 m!829031))

(assert (=> b!889568 m!829029))

(assert (=> b!889568 m!829029))

(assert (=> b!889568 m!829031))

(assert (=> d!110371 d!110407))

(assert (=> d!110371 d!110377))

(assert (=> d!110371 d!110369))

(declare-fun d!110409 () Bool)

(declare-fun res!602797 () Bool)

(declare-fun e!495777 () Bool)

(assert (=> d!110409 (=> res!602797 e!495777)))

(assert (=> d!110409 (= res!602797 (= (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110409 (= (arrayContainsKey!0 (_keys!9877 thiss!1181) key!785 #b00000000000000000000000000000000) e!495777)))

(declare-fun b!889573 () Bool)

(declare-fun e!495778 () Bool)

(assert (=> b!889573 (= e!495777 e!495778)))

(declare-fun res!602798 () Bool)

(assert (=> b!889573 (=> (not res!602798) (not e!495778))))

(assert (=> b!889573 (= res!602798 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25352 (_keys!9877 thiss!1181))))))

(declare-fun b!889574 () Bool)

(assert (=> b!889574 (= e!495778 (arrayContainsKey!0 (_keys!9877 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110409 (not res!602797)) b!889573))

(assert (= (and b!889573 res!602798) b!889574))

(assert (=> d!110409 m!829139))

(declare-fun m!829225 () Bool)

(assert (=> b!889574 m!829225))

(assert (=> bm!39492 d!110409))

(declare-fun b!889575 () Bool)

(declare-fun e!495779 () Bool)

(declare-fun e!495780 () Bool)

(assert (=> b!889575 (= e!495779 e!495780)))

(declare-fun lt!402262 () (_ BitVec 64))

(assert (=> b!889575 (= lt!402262 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!402261 () Unit!30247)

(assert (=> b!889575 (= lt!402261 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9877 thiss!1181) lt!402262 #b00000000000000000000000000000000))))

(assert (=> b!889575 (arrayContainsKey!0 (_keys!9877 thiss!1181) lt!402262 #b00000000000000000000000000000000)))

(declare-fun lt!402263 () Unit!30247)

(assert (=> b!889575 (= lt!402263 lt!402261)))

(declare-fun res!602799 () Bool)

(assert (=> b!889575 (= res!602799 (= (seekEntryOrOpen!0 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000) (_keys!9877 thiss!1181) (mask!25635 thiss!1181)) (Found!8718 #b00000000000000000000000000000000)))))

(assert (=> b!889575 (=> (not res!602799) (not e!495780))))

(declare-fun bm!39522 () Bool)

(declare-fun call!39525 () Bool)

(assert (=> bm!39522 (= call!39525 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9877 thiss!1181) (mask!25635 thiss!1181)))))

(declare-fun b!889577 () Bool)

(assert (=> b!889577 (= e!495780 call!39525)))

(declare-fun b!889578 () Bool)

(assert (=> b!889578 (= e!495779 call!39525)))

(declare-fun b!889576 () Bool)

(declare-fun e!495781 () Bool)

(assert (=> b!889576 (= e!495781 e!495779)))

(declare-fun c!94174 () Bool)

(assert (=> b!889576 (= c!94174 (validKeyInArray!0 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110411 () Bool)

(declare-fun res!602800 () Bool)

(assert (=> d!110411 (=> res!602800 e!495781)))

(assert (=> d!110411 (= res!602800 (bvsge #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))

(assert (=> d!110411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9877 thiss!1181) (mask!25635 thiss!1181)) e!495781)))

(assert (= (and d!110411 (not res!602800)) b!889576))

(assert (= (and b!889576 c!94174) b!889575))

(assert (= (and b!889576 (not c!94174)) b!889578))

(assert (= (and b!889575 res!602799) b!889577))

(assert (= (or b!889577 b!889578) bm!39522))

(assert (=> b!889575 m!829139))

(declare-fun m!829227 () Bool)

(assert (=> b!889575 m!829227))

(declare-fun m!829229 () Bool)

(assert (=> b!889575 m!829229))

(assert (=> b!889575 m!829139))

(declare-fun m!829231 () Bool)

(assert (=> b!889575 m!829231))

(declare-fun m!829233 () Bool)

(assert (=> bm!39522 m!829233))

(assert (=> b!889576 m!829139))

(assert (=> b!889576 m!829139))

(assert (=> b!889576 m!829153))

(assert (=> b!889380 d!110411))

(declare-fun b!889587 () Bool)

(declare-fun e!495787 () (_ BitVec 32))

(declare-fun call!39528 () (_ BitVec 32))

(assert (=> b!889587 (= e!495787 (bvadd #b00000000000000000000000000000001 call!39528))))

(declare-fun b!889588 () Bool)

(declare-fun e!495786 () (_ BitVec 32))

(assert (=> b!889588 (= e!495786 e!495787)))

(declare-fun c!94180 () Bool)

(assert (=> b!889588 (= c!94180 (validKeyInArray!0 (select (arr!24910 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110413 () Bool)

(declare-fun lt!402266 () (_ BitVec 32))

(assert (=> d!110413 (and (bvsge lt!402266 #b00000000000000000000000000000000) (bvsle lt!402266 (bvsub (size!25352 (_keys!9877 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110413 (= lt!402266 e!495786)))

(declare-fun c!94179 () Bool)

(assert (=> d!110413 (= c!94179 (bvsge #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))))))

(assert (=> d!110413 (and (bvsle #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25352 (_keys!9877 thiss!1181)) (size!25352 (_keys!9877 thiss!1181))))))

(assert (=> d!110413 (= (arrayCountValidKeys!0 (_keys!9877 thiss!1181) #b00000000000000000000000000000000 (size!25352 (_keys!9877 thiss!1181))) lt!402266)))

(declare-fun b!889589 () Bool)

(assert (=> b!889589 (= e!495787 call!39528)))

(declare-fun bm!39525 () Bool)

(assert (=> bm!39525 (= call!39528 (arrayCountValidKeys!0 (_keys!9877 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25352 (_keys!9877 thiss!1181))))))

(declare-fun b!889590 () Bool)

(assert (=> b!889590 (= e!495786 #b00000000000000000000000000000000)))

(assert (= (and d!110413 c!94179) b!889590))

(assert (= (and d!110413 (not c!94179)) b!889588))

(assert (= (and b!889588 c!94180) b!889587))

(assert (= (and b!889588 (not c!94180)) b!889589))

(assert (= (or b!889587 b!889589) bm!39525))

(assert (=> b!889588 m!829139))

(assert (=> b!889588 m!829139))

(assert (=> b!889588 m!829153))

(declare-fun m!829235 () Bool)

(assert (=> bm!39525 m!829235))

(assert (=> b!889379 d!110413))

(declare-fun b!889591 () Bool)

(declare-fun e!495788 () Option!444)

(assert (=> b!889591 (= e!495788 (Some!443 (_2!5939 (h!18774 (t!24930 (toList!5293 (map!12099 thiss!1181)))))))))

(declare-fun b!889594 () Bool)

(declare-fun e!495789 () Option!444)

(assert (=> b!889594 (= e!495789 None!442)))

(declare-fun b!889592 () Bool)

(assert (=> b!889592 (= e!495788 e!495789)))

(declare-fun c!94182 () Bool)

(assert (=> b!889592 (= c!94182 (and ((_ is Cons!17637) (t!24930 (toList!5293 (map!12099 thiss!1181)))) (not (= (_1!5939 (h!18774 (t!24930 (toList!5293 (map!12099 thiss!1181))))) key!785))))))

(declare-fun d!110415 () Bool)

(declare-fun c!94181 () Bool)

(assert (=> d!110415 (= c!94181 (and ((_ is Cons!17637) (t!24930 (toList!5293 (map!12099 thiss!1181)))) (= (_1!5939 (h!18774 (t!24930 (toList!5293 (map!12099 thiss!1181))))) key!785)))))

(assert (=> d!110415 (= (getValueByKey!438 (t!24930 (toList!5293 (map!12099 thiss!1181))) key!785) e!495788)))

(declare-fun b!889593 () Bool)

(assert (=> b!889593 (= e!495789 (getValueByKey!438 (t!24930 (t!24930 (toList!5293 (map!12099 thiss!1181)))) key!785))))

(assert (= (and d!110415 c!94181) b!889591))

(assert (= (and d!110415 (not c!94181)) b!889592))

(assert (= (and b!889592 c!94182) b!889593))

(assert (= (and b!889592 (not c!94182)) b!889594))

(declare-fun m!829237 () Bool)

(assert (=> b!889593 m!829237))

(assert (=> b!889422 d!110415))

(declare-fun b!889605 () Bool)

(declare-fun res!602810 () Bool)

(declare-fun e!495792 () Bool)

(assert (=> b!889605 (=> (not res!602810) (not e!495792))))

(declare-fun size!25358 (LongMapFixedSize!3952) (_ BitVec 32))

(assert (=> b!889605 (= res!602810 (= (size!25358 thiss!1181) (bvadd (_size!2031 thiss!1181) (bvsdiv (bvadd (extraKeys!4864 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!889606 () Bool)

(assert (=> b!889606 (= e!495792 (and (bvsge (extraKeys!4864 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4864 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2031 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!889604 () Bool)

(declare-fun res!602811 () Bool)

(assert (=> b!889604 (=> (not res!602811) (not e!495792))))

(assert (=> b!889604 (= res!602811 (bvsge (size!25358 thiss!1181) (_size!2031 thiss!1181)))))

(declare-fun b!889603 () Bool)

(declare-fun res!602812 () Bool)

(assert (=> b!889603 (=> (not res!602812) (not e!495792))))

(assert (=> b!889603 (= res!602812 (and (= (size!25353 (_values!5155 thiss!1181)) (bvadd (mask!25635 thiss!1181) #b00000000000000000000000000000001)) (= (size!25352 (_keys!9877 thiss!1181)) (size!25353 (_values!5155 thiss!1181))) (bvsge (_size!2031 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2031 thiss!1181) (bvadd (mask!25635 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!110417 () Bool)

(declare-fun res!602809 () Bool)

(assert (=> d!110417 (=> (not res!602809) (not e!495792))))

(assert (=> d!110417 (= res!602809 (validMask!0 (mask!25635 thiss!1181)))))

(assert (=> d!110417 (= (simpleValid!290 thiss!1181) e!495792)))

(assert (= (and d!110417 res!602809) b!889603))

(assert (= (and b!889603 res!602812) b!889604))

(assert (= (and b!889604 res!602811) b!889605))

(assert (= (and b!889605 res!602810) b!889606))

(declare-fun m!829239 () Bool)

(assert (=> b!889605 m!829239))

(assert (=> b!889604 m!829239))

(assert (=> d!110417 m!829119))

(assert (=> d!110369 d!110417))

(declare-fun mapIsEmpty!28395 () Bool)

(declare-fun mapRes!28395 () Bool)

(assert (=> mapIsEmpty!28395 mapRes!28395))

(declare-fun b!889608 () Bool)

(declare-fun e!495794 () Bool)

(assert (=> b!889608 (= e!495794 tp_is_empty!17899)))

(declare-fun mapNonEmpty!28395 () Bool)

(declare-fun tp!54681 () Bool)

(declare-fun e!495793 () Bool)

(assert (=> mapNonEmpty!28395 (= mapRes!28395 (and tp!54681 e!495793))))

(declare-fun mapRest!28395 () (Array (_ BitVec 32) ValueCell!8468))

(declare-fun mapKey!28395 () (_ BitVec 32))

(declare-fun mapValue!28395 () ValueCell!8468)

(assert (=> mapNonEmpty!28395 (= mapRest!28394 (store mapRest!28395 mapKey!28395 mapValue!28395))))

(declare-fun b!889607 () Bool)

(assert (=> b!889607 (= e!495793 tp_is_empty!17899)))

(declare-fun condMapEmpty!28395 () Bool)

(declare-fun mapDefault!28395 () ValueCell!8468)

(assert (=> mapNonEmpty!28394 (= condMapEmpty!28395 (= mapRest!28394 ((as const (Array (_ BitVec 32) ValueCell!8468)) mapDefault!28395)))))

(assert (=> mapNonEmpty!28394 (= tp!54680 (and e!495794 mapRes!28395))))

(assert (= (and mapNonEmpty!28394 condMapEmpty!28395) mapIsEmpty!28395))

(assert (= (and mapNonEmpty!28394 (not condMapEmpty!28395)) mapNonEmpty!28395))

(assert (= (and mapNonEmpty!28395 ((_ is ValueCellFull!8468) mapValue!28395)) b!889607))

(assert (= (and mapNonEmpty!28394 ((_ is ValueCellFull!8468) mapDefault!28395)) b!889608))

(declare-fun m!829241 () Bool)

(assert (=> mapNonEmpty!28395 m!829241))

(declare-fun b_lambda!12895 () Bool)

(assert (= b_lambda!12893 (or (and b!889329 b_free!15571) b_lambda!12895)))

(check-sat (not b!889518) (not d!110401) (not d!110387) (not d!110393) (not b!889529) (not b!889576) (not b!889568) (not bm!39516) (not b_lambda!12895) (not b!889605) (not bm!39522) (not b!889473) (not d!110403) (not b!889548) (not b!889575) (not d!110417) (not bm!39525) (not bm!39497) (not b!889525) (not d!110399) (not b!889550) (not d!110397) (not b!889464) (not mapNonEmpty!28395) (not b!889604) (not b!889588) (not b!889574) (not b_next!15571) (not d!110395) (not bm!39512) (not b!889566) tp_is_empty!17899 (not bm!39514) (not d!110383) (not bm!39521) (not b!889449) (not b!889465) (not b!889533) b_and!25825 (not b!889541) (not b!889563) (not b!889526) (not b!889535) (not b!889593) (not b!889532) (not b!889454) (not b!889562) (not d!110407) (not b!889561) (not bm!39518) (not b!889527))
(check-sat b_and!25825 (not b_next!15571))
