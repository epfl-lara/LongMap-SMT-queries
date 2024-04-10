; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75940 () Bool)

(assert start!75940)

(declare-fun b!893354 () Bool)

(declare-fun b_free!15855 () Bool)

(declare-fun b_next!15855 () Bool)

(assert (=> b!893354 (= b_free!15855 (not b_next!15855))))

(declare-fun tp!55540 () Bool)

(declare-fun b_and!26119 () Bool)

(assert (=> b!893354 (= tp!55540 b_and!26119)))

(declare-fun tp_is_empty!18183 () Bool)

(declare-datatypes ((array!52350 0))(
  ( (array!52351 (arr!25179 (Array (_ BitVec 32) (_ BitVec 64))) (size!25623 (_ BitVec 32))) )
))
(declare-datatypes ((V!29209 0))(
  ( (V!29210 (val!9142 Int)) )
))
(declare-datatypes ((ValueCell!8610 0))(
  ( (ValueCellFull!8610 (v!11623 V!29209)) (EmptyCell!8610) )
))
(declare-datatypes ((array!52352 0))(
  ( (array!52353 (arr!25180 (Array (_ BitVec 32) ValueCell!8610)) (size!25624 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4236 0))(
  ( (LongMapFixedSize!4237 (defaultEntry!5318 Int) (mask!25849 (_ BitVec 32)) (extraKeys!5014 (_ BitVec 32)) (zeroValue!5118 V!29209) (minValue!5118 V!29209) (_size!2173 (_ BitVec 32)) (_keys!10005 array!52350) (_values!5305 array!52352) (_vacant!2173 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4236)

(declare-fun e!498901 () Bool)

(declare-fun e!498900 () Bool)

(declare-fun array_inv!19774 (array!52350) Bool)

(declare-fun array_inv!19775 (array!52352) Bool)

(assert (=> b!893354 (= e!498901 (and tp!55540 tp_is_empty!18183 (array_inv!19774 (_keys!10005 thiss!1181)) (array_inv!19775 (_values!5305 thiss!1181)) e!498900))))

(declare-fun b!893355 () Bool)

(declare-fun res!604982 () Bool)

(declare-fun e!498904 () Bool)

(assert (=> b!893355 (=> (not res!604982) (not e!498904))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!893355 (= res!604982 (and (= key!785 (bvneg key!785)) (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!28835 () Bool)

(declare-fun mapRes!28835 () Bool)

(declare-fun tp!55539 () Bool)

(declare-fun e!498902 () Bool)

(assert (=> mapNonEmpty!28835 (= mapRes!28835 (and tp!55539 e!498902))))

(declare-fun mapRest!28835 () (Array (_ BitVec 32) ValueCell!8610))

(declare-fun mapValue!28835 () ValueCell!8610)

(declare-fun mapKey!28835 () (_ BitVec 32))

(assert (=> mapNonEmpty!28835 (= (arr!25180 (_values!5305 thiss!1181)) (store mapRest!28835 mapKey!28835 mapValue!28835))))

(declare-fun b!893356 () Bool)

(assert (=> b!893356 (= e!498902 tp_is_empty!18183)))

(declare-fun b!893357 () Bool)

(declare-fun e!498903 () Bool)

(assert (=> b!893357 (= e!498903 tp_is_empty!18183)))

(declare-fun res!604981 () Bool)

(assert (=> start!75940 (=> (not res!604981) (not e!498904))))

(declare-fun valid!1637 (LongMapFixedSize!4236) Bool)

(assert (=> start!75940 (= res!604981 (valid!1637 thiss!1181))))

(assert (=> start!75940 e!498904))

(assert (=> start!75940 e!498901))

(assert (=> start!75940 true))

(declare-fun b!893358 () Bool)

(assert (=> b!893358 (= e!498900 (and e!498903 mapRes!28835))))

(declare-fun condMapEmpty!28835 () Bool)

(declare-fun mapDefault!28835 () ValueCell!8610)

(assert (=> b!893358 (= condMapEmpty!28835 (= (arr!25180 (_values!5305 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8610)) mapDefault!28835)))))

(declare-fun b!893359 () Bool)

(declare-fun e!498905 () Bool)

(assert (=> b!893359 (= e!498904 e!498905)))

(declare-fun c!94095 () Bool)

(declare-fun contains!4381 (LongMapFixedSize!4236 (_ BitVec 64)) Bool)

(assert (=> b!893359 (= c!94095 (contains!4381 thiss!1181 key!785))))

(declare-fun b!893360 () Bool)

(declare-datatypes ((Option!454 0))(
  ( (Some!453 (v!11624 V!29209)) (None!452) )
))
(declare-fun get!13254 (Option!454) V!29209)

(declare-datatypes ((tuple2!12016 0))(
  ( (tuple2!12017 (_1!6019 (_ BitVec 64)) (_2!6019 V!29209)) )
))
(declare-datatypes ((List!17797 0))(
  ( (Nil!17794) (Cons!17793 (h!18924 tuple2!12016) (t!25118 List!17797)) )
))
(declare-fun getValueByKey!448 (List!17797 (_ BitVec 64)) Option!454)

(declare-datatypes ((ListLongMap!10713 0))(
  ( (ListLongMap!10714 (toList!5372 List!17797)) )
))
(declare-fun map!12215 (LongMapFixedSize!4236) ListLongMap!10713)

(assert (=> b!893360 (= e!498905 (not (= (zeroValue!5118 thiss!1181) (get!13254 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785)))))))

(declare-fun b!893361 () Bool)

(declare-fun dynLambda!1297 (Int (_ BitVec 64)) V!29209)

(assert (=> b!893361 (= e!498905 (not (= (zeroValue!5118 thiss!1181) (dynLambda!1297 (defaultEntry!5318 thiss!1181) key!785))))))

(declare-fun mapIsEmpty!28835 () Bool)

(assert (=> mapIsEmpty!28835 mapRes!28835))

(assert (= (and start!75940 res!604981) b!893355))

(assert (= (and b!893355 res!604982) b!893359))

(assert (= (and b!893359 c!94095) b!893360))

(assert (= (and b!893359 (not c!94095)) b!893361))

(assert (= (and b!893358 condMapEmpty!28835) mapIsEmpty!28835))

(assert (= (and b!893358 (not condMapEmpty!28835)) mapNonEmpty!28835))

(get-info :version)

(assert (= (and mapNonEmpty!28835 ((_ is ValueCellFull!8610) mapValue!28835)) b!893356))

(assert (= (and b!893358 ((_ is ValueCellFull!8610) mapDefault!28835)) b!893357))

(assert (= b!893354 b!893358))

(assert (= start!75940 b!893354))

(declare-fun b_lambda!12913 () Bool)

(assert (=> (not b_lambda!12913) (not b!893361)))

(declare-fun t!25117 () Bool)

(declare-fun tb!5171 () Bool)

(assert (=> (and b!893354 (= (defaultEntry!5318 thiss!1181) (defaultEntry!5318 thiss!1181)) t!25117) tb!5171))

(declare-fun result!10057 () Bool)

(assert (=> tb!5171 (= result!10057 tp_is_empty!18183)))

(assert (=> b!893361 t!25117))

(declare-fun b_and!26121 () Bool)

(assert (= b_and!26119 (and (=> t!25117 result!10057) b_and!26121)))

(declare-fun m!831419 () Bool)

(assert (=> mapNonEmpty!28835 m!831419))

(declare-fun m!831421 () Bool)

(assert (=> b!893360 m!831421))

(declare-fun m!831423 () Bool)

(assert (=> b!893360 m!831423))

(assert (=> b!893360 m!831423))

(declare-fun m!831425 () Bool)

(assert (=> b!893360 m!831425))

(declare-fun m!831427 () Bool)

(assert (=> b!893354 m!831427))

(declare-fun m!831429 () Bool)

(assert (=> b!893354 m!831429))

(declare-fun m!831431 () Bool)

(assert (=> b!893359 m!831431))

(declare-fun m!831433 () Bool)

(assert (=> b!893361 m!831433))

(declare-fun m!831435 () Bool)

(assert (=> start!75940 m!831435))

(check-sat (not b!893359) b_and!26121 (not mapNonEmpty!28835) tp_is_empty!18183 (not b_lambda!12913) (not b!893360) (not start!75940) (not b_next!15855) (not b!893354))
(check-sat b_and!26121 (not b_next!15855))
(get-model)

(declare-fun b_lambda!12917 () Bool)

(assert (= b_lambda!12913 (or (and b!893354 b_free!15855) b_lambda!12917)))

(check-sat (not b!893359) b_and!26121 (not mapNonEmpty!28835) tp_is_empty!18183 (not b_lambda!12917) (not b!893360) (not start!75940) (not b_next!15855) (not b!893354))
(check-sat b_and!26121 (not b_next!15855))
(get-model)

(declare-fun d!110303 () Bool)

(assert (=> d!110303 (= (get!13254 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785)) (v!11624 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785)))))

(assert (=> b!893360 d!110303))

(declare-fun b!893399 () Bool)

(declare-fun e!498932 () Option!454)

(declare-fun e!498933 () Option!454)

(assert (=> b!893399 (= e!498932 e!498933)))

(declare-fun c!94104 () Bool)

(assert (=> b!893399 (= c!94104 (and ((_ is Cons!17793) (toList!5372 (map!12215 thiss!1181))) (not (= (_1!6019 (h!18924 (toList!5372 (map!12215 thiss!1181)))) key!785))))))

(declare-fun b!893398 () Bool)

(assert (=> b!893398 (= e!498932 (Some!453 (_2!6019 (h!18924 (toList!5372 (map!12215 thiss!1181))))))))

(declare-fun d!110305 () Bool)

(declare-fun c!94103 () Bool)

(assert (=> d!110305 (= c!94103 (and ((_ is Cons!17793) (toList!5372 (map!12215 thiss!1181))) (= (_1!6019 (h!18924 (toList!5372 (map!12215 thiss!1181)))) key!785)))))

(assert (=> d!110305 (= (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785) e!498932)))

(declare-fun b!893401 () Bool)

(assert (=> b!893401 (= e!498933 None!452)))

(declare-fun b!893400 () Bool)

(assert (=> b!893400 (= e!498933 (getValueByKey!448 (t!25118 (toList!5372 (map!12215 thiss!1181))) key!785))))

(assert (= (and d!110305 c!94103) b!893398))

(assert (= (and d!110305 (not c!94103)) b!893399))

(assert (= (and b!893399 c!94104) b!893400))

(assert (= (and b!893399 (not c!94104)) b!893401))

(declare-fun m!831455 () Bool)

(assert (=> b!893400 m!831455))

(assert (=> b!893360 d!110305))

(declare-fun d!110307 () Bool)

(declare-fun getCurrentListMap!2650 (array!52350 array!52352 (_ BitVec 32) (_ BitVec 32) V!29209 V!29209 (_ BitVec 32) Int) ListLongMap!10713)

(assert (=> d!110307 (= (map!12215 thiss!1181) (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)))))

(declare-fun bs!25073 () Bool)

(assert (= bs!25073 d!110307))

(declare-fun m!831457 () Bool)

(assert (=> bs!25073 m!831457))

(assert (=> b!893360 d!110307))

(declare-fun d!110309 () Bool)

(declare-fun res!604995 () Bool)

(declare-fun e!498936 () Bool)

(assert (=> d!110309 (=> (not res!604995) (not e!498936))))

(declare-fun simpleValid!297 (LongMapFixedSize!4236) Bool)

(assert (=> d!110309 (= res!604995 (simpleValid!297 thiss!1181))))

(assert (=> d!110309 (= (valid!1637 thiss!1181) e!498936)))

(declare-fun b!893408 () Bool)

(declare-fun res!604996 () Bool)

(assert (=> b!893408 (=> (not res!604996) (not e!498936))))

(declare-fun arrayCountValidKeys!0 (array!52350 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893408 (= res!604996 (= (arrayCountValidKeys!0 (_keys!10005 thiss!1181) #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))) (_size!2173 thiss!1181)))))

(declare-fun b!893409 () Bool)

(declare-fun res!604997 () Bool)

(assert (=> b!893409 (=> (not res!604997) (not e!498936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52350 (_ BitVec 32)) Bool)

(assert (=> b!893409 (= res!604997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893410 () Bool)

(declare-datatypes ((List!17799 0))(
  ( (Nil!17796) (Cons!17795 (h!18926 (_ BitVec 64)) (t!25122 List!17799)) )
))
(declare-fun arrayNoDuplicates!0 (array!52350 (_ BitVec 32) List!17799) Bool)

(assert (=> b!893410 (= e!498936 (arrayNoDuplicates!0 (_keys!10005 thiss!1181) #b00000000000000000000000000000000 Nil!17796))))

(assert (= (and d!110309 res!604995) b!893408))

(assert (= (and b!893408 res!604996) b!893409))

(assert (= (and b!893409 res!604997) b!893410))

(declare-fun m!831459 () Bool)

(assert (=> d!110309 m!831459))

(declare-fun m!831461 () Bool)

(assert (=> b!893408 m!831461))

(declare-fun m!831463 () Bool)

(assert (=> b!893409 m!831463))

(declare-fun m!831465 () Bool)

(assert (=> b!893410 m!831465))

(assert (=> start!75940 d!110309))

(declare-fun d!110311 () Bool)

(assert (=> d!110311 (= (array_inv!19774 (_keys!10005 thiss!1181)) (bvsge (size!25623 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893354 d!110311))

(declare-fun d!110313 () Bool)

(assert (=> d!110313 (= (array_inv!19775 (_values!5305 thiss!1181)) (bvsge (size!25624 (_values!5305 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893354 d!110313))

(declare-fun b!893431 () Bool)

(declare-fun e!498949 () Bool)

(assert (=> b!893431 (= e!498949 false)))

(declare-fun c!94117 () Bool)

(declare-fun call!39623 () Bool)

(assert (=> b!893431 (= c!94117 call!39623)))

(declare-datatypes ((Unit!30426 0))(
  ( (Unit!30427) )
))
(declare-fun lt!403658 () Unit!30426)

(declare-fun e!498951 () Unit!30426)

(assert (=> b!893431 (= lt!403658 e!498951)))

(declare-fun b!893432 () Bool)

(declare-fun e!498948 () Bool)

(declare-fun call!39622 () Bool)

(assert (=> b!893432 (= e!498948 call!39622)))

(declare-fun d!110315 () Bool)

(declare-fun lt!403667 () Bool)

(declare-fun contains!4383 (ListLongMap!10713 (_ BitVec 64)) Bool)

(assert (=> d!110315 (= lt!403667 (contains!4383 (map!12215 thiss!1181) key!785))))

(declare-fun e!498950 () Bool)

(assert (=> d!110315 (= lt!403667 e!498950)))

(declare-fun c!94116 () Bool)

(assert (=> d!110315 (= c!94116 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110315 (valid!1637 thiss!1181)))

(assert (=> d!110315 (= (contains!4381 thiss!1181 key!785) lt!403667)))

(declare-fun b!893433 () Bool)

(assert (=> b!893433 (= e!498950 (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!893434 () Bool)

(assert (=> b!893434 false))

(declare-fun lt!403665 () Unit!30426)

(declare-fun lt!403671 () Unit!30426)

(assert (=> b!893434 (= lt!403665 lt!403671)))

(declare-datatypes ((SeekEntryResult!8863 0))(
  ( (MissingZero!8863 (index!37823 (_ BitVec 32))) (Found!8863 (index!37824 (_ BitVec 32))) (Intermediate!8863 (undefined!9675 Bool) (index!37825 (_ BitVec 32)) (x!75963 (_ BitVec 32))) (Undefined!8863) (MissingVacant!8863 (index!37826 (_ BitVec 32))) )
))
(declare-fun lt!403672 () SeekEntryResult!8863)

(declare-fun lt!403659 () (_ BitVec 32))

(assert (=> b!893434 (and ((_ is Found!8863) lt!403672) (= (index!37824 lt!403672) lt!403659))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52350 (_ BitVec 32)) SeekEntryResult!8863)

(assert (=> b!893434 (= lt!403672 (seekEntry!0 key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52350 (_ BitVec 32)) Unit!30426)

(assert (=> b!893434 (= lt!403671 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun lt!403661 () Unit!30426)

(declare-fun lt!403662 () Unit!30426)

(assert (=> b!893434 (= lt!403661 lt!403662)))

(assert (=> b!893434 (arrayForallSeekEntryOrOpenFound!0 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30426)

(assert (=> b!893434 (= lt!403662 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10005 thiss!1181) (mask!25849 thiss!1181) #b00000000000000000000000000000000 lt!403659))))

(declare-fun arrayScanForKey!0 (array!52350 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893434 (= lt!403659 (arrayScanForKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403669 () Unit!30426)

(declare-fun lt!403666 () Unit!30426)

(assert (=> b!893434 (= lt!403669 lt!403666)))

(assert (=> b!893434 e!498948))

(declare-fun c!94119 () Bool)

(assert (=> b!893434 (= c!94119 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!162 (array!52350 array!52352 (_ BitVec 32) (_ BitVec 32) V!29209 V!29209 (_ BitVec 64) Int) Unit!30426)

(assert (=> b!893434 (= lt!403666 (lemmaKeyInListMapIsInArray!162 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) key!785 (defaultEntry!5318 thiss!1181)))))

(declare-fun Unit!30428 () Unit!30426)

(assert (=> b!893434 (= e!498951 Unit!30428)))

(declare-fun bm!39619 () Bool)

(declare-fun call!39624 () ListLongMap!10713)

(assert (=> bm!39619 (= call!39624 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)))))

(declare-fun b!893435 () Bool)

(declare-fun Unit!30429 () Unit!30426)

(assert (=> b!893435 (= e!498951 Unit!30429)))

(declare-fun b!893436 () Bool)

(declare-fun e!498947 () Bool)

(assert (=> b!893436 (= e!498947 (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893437 () Bool)

(assert (=> b!893437 (= e!498948 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!893438 () Bool)

(assert (=> b!893438 (= e!498949 true)))

(declare-fun lt!403670 () Unit!30426)

(declare-fun lt!403664 () SeekEntryResult!8863)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52350 (_ BitVec 64) (_ BitVec 32)) Unit!30426)

(assert (=> b!893438 (= lt!403670 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) key!785 (index!37824 lt!403664)))))

(assert (=> b!893438 call!39622))

(declare-fun lt!403660 () Unit!30426)

(assert (=> b!893438 (= lt!403660 lt!403670)))

(declare-fun lt!403663 () Unit!30426)

(declare-fun lemmaValidKeyInArrayIsInListMap!239 (array!52350 array!52352 (_ BitVec 32) (_ BitVec 32) V!29209 V!29209 (_ BitVec 32) Int) Unit!30426)

(assert (=> b!893438 (= lt!403663 (lemmaValidKeyInArrayIsInListMap!239 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) (index!37824 lt!403664) (defaultEntry!5318 thiss!1181)))))

(assert (=> b!893438 call!39623))

(declare-fun lt!403668 () Unit!30426)

(assert (=> b!893438 (= lt!403668 lt!403663)))

(declare-fun c!94118 () Bool)

(declare-fun bm!39620 () Bool)

(assert (=> bm!39620 (= call!39623 (contains!4383 call!39624 (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(declare-fun b!893439 () Bool)

(assert (=> b!893439 (= e!498950 e!498947)))

(declare-fun c!94115 () Bool)

(assert (=> b!893439 (= c!94115 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893440 () Bool)

(assert (=> b!893440 (= c!94118 ((_ is Found!8863) lt!403664))))

(assert (=> b!893440 (= lt!403664 (seekEntry!0 key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(assert (=> b!893440 (= e!498947 e!498949)))

(declare-fun bm!39621 () Bool)

(declare-fun arrayContainsKey!0 (array!52350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39621 (= call!39622 (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (= (and d!110315 c!94116) b!893433))

(assert (= (and d!110315 (not c!94116)) b!893439))

(assert (= (and b!893439 c!94115) b!893436))

(assert (= (and b!893439 (not c!94115)) b!893440))

(assert (= (and b!893440 c!94118) b!893438))

(assert (= (and b!893440 (not c!94118)) b!893431))

(assert (= (and b!893431 c!94117) b!893434))

(assert (= (and b!893431 (not c!94117)) b!893435))

(assert (= (and b!893434 c!94119) b!893432))

(assert (= (and b!893434 (not c!94119)) b!893437))

(assert (= (or b!893438 b!893432) bm!39621))

(assert (= (or b!893438 b!893431) bm!39619))

(assert (= (or b!893438 b!893431) bm!39620))

(declare-fun m!831467 () Bool)

(assert (=> bm!39621 m!831467))

(declare-fun m!831469 () Bool)

(assert (=> b!893440 m!831469))

(assert (=> b!893434 m!831469))

(declare-fun m!831471 () Bool)

(assert (=> b!893434 m!831471))

(declare-fun m!831473 () Bool)

(assert (=> b!893434 m!831473))

(declare-fun m!831475 () Bool)

(assert (=> b!893434 m!831475))

(declare-fun m!831477 () Bool)

(assert (=> b!893434 m!831477))

(declare-fun m!831479 () Bool)

(assert (=> b!893434 m!831479))

(declare-fun m!831481 () Bool)

(assert (=> b!893438 m!831481))

(declare-fun m!831483 () Bool)

(assert (=> b!893438 m!831483))

(assert (=> d!110315 m!831421))

(assert (=> d!110315 m!831421))

(declare-fun m!831485 () Bool)

(assert (=> d!110315 m!831485))

(assert (=> d!110315 m!831435))

(assert (=> bm!39619 m!831457))

(declare-fun m!831487 () Bool)

(assert (=> bm!39620 m!831487))

(declare-fun m!831489 () Bool)

(assert (=> bm!39620 m!831489))

(assert (=> b!893359 d!110315))

(declare-fun b!893447 () Bool)

(declare-fun e!498957 () Bool)

(assert (=> b!893447 (= e!498957 tp_is_empty!18183)))

(declare-fun mapIsEmpty!28841 () Bool)

(declare-fun mapRes!28841 () Bool)

(assert (=> mapIsEmpty!28841 mapRes!28841))

(declare-fun mapNonEmpty!28841 () Bool)

(declare-fun tp!55549 () Bool)

(assert (=> mapNonEmpty!28841 (= mapRes!28841 (and tp!55549 e!498957))))

(declare-fun mapKey!28841 () (_ BitVec 32))

(declare-fun mapRest!28841 () (Array (_ BitVec 32) ValueCell!8610))

(declare-fun mapValue!28841 () ValueCell!8610)

(assert (=> mapNonEmpty!28841 (= mapRest!28835 (store mapRest!28841 mapKey!28841 mapValue!28841))))

(declare-fun b!893448 () Bool)

(declare-fun e!498956 () Bool)

(assert (=> b!893448 (= e!498956 tp_is_empty!18183)))

(declare-fun condMapEmpty!28841 () Bool)

(declare-fun mapDefault!28841 () ValueCell!8610)

(assert (=> mapNonEmpty!28835 (= condMapEmpty!28841 (= mapRest!28835 ((as const (Array (_ BitVec 32) ValueCell!8610)) mapDefault!28841)))))

(assert (=> mapNonEmpty!28835 (= tp!55539 (and e!498956 mapRes!28841))))

(assert (= (and mapNonEmpty!28835 condMapEmpty!28841) mapIsEmpty!28841))

(assert (= (and mapNonEmpty!28835 (not condMapEmpty!28841)) mapNonEmpty!28841))

(assert (= (and mapNonEmpty!28841 ((_ is ValueCellFull!8610) mapValue!28841)) b!893447))

(assert (= (and mapNonEmpty!28835 ((_ is ValueCellFull!8610) mapDefault!28841)) b!893448))

(declare-fun m!831491 () Bool)

(assert (=> mapNonEmpty!28841 m!831491))

(check-sat (not b!893409) (not b!893440) tp_is_empty!18183 (not d!110309) (not b!893408) (not b!893434) (not b!893410) (not b_next!15855) (not d!110307) (not d!110315) (not b!893400) b_and!26121 (not b!893438) (not bm!39621) (not mapNonEmpty!28841) (not b_lambda!12917) (not bm!39619) (not bm!39620))
(check-sat b_and!26121 (not b_next!15855))
(get-model)

(declare-fun b!893450 () Bool)

(declare-fun e!498958 () Option!454)

(declare-fun e!498959 () Option!454)

(assert (=> b!893450 (= e!498958 e!498959)))

(declare-fun c!94121 () Bool)

(assert (=> b!893450 (= c!94121 (and ((_ is Cons!17793) (t!25118 (toList!5372 (map!12215 thiss!1181)))) (not (= (_1!6019 (h!18924 (t!25118 (toList!5372 (map!12215 thiss!1181))))) key!785))))))

(declare-fun b!893449 () Bool)

(assert (=> b!893449 (= e!498958 (Some!453 (_2!6019 (h!18924 (t!25118 (toList!5372 (map!12215 thiss!1181)))))))))

(declare-fun d!110317 () Bool)

(declare-fun c!94120 () Bool)

(assert (=> d!110317 (= c!94120 (and ((_ is Cons!17793) (t!25118 (toList!5372 (map!12215 thiss!1181)))) (= (_1!6019 (h!18924 (t!25118 (toList!5372 (map!12215 thiss!1181))))) key!785)))))

(assert (=> d!110317 (= (getValueByKey!448 (t!25118 (toList!5372 (map!12215 thiss!1181))) key!785) e!498958)))

(declare-fun b!893452 () Bool)

(assert (=> b!893452 (= e!498959 None!452)))

(declare-fun b!893451 () Bool)

(assert (=> b!893451 (= e!498959 (getValueByKey!448 (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181)))) key!785))))

(assert (= (and d!110317 c!94120) b!893449))

(assert (= (and d!110317 (not c!94120)) b!893450))

(assert (= (and b!893450 c!94121) b!893451))

(assert (= (and b!893450 (not c!94121)) b!893452))

(declare-fun m!831493 () Bool)

(assert (=> b!893451 m!831493))

(assert (=> b!893400 d!110317))

(declare-fun d!110319 () Bool)

(assert (=> d!110319 (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403675 () Unit!30426)

(declare-fun choose!13 (array!52350 (_ BitVec 64) (_ BitVec 32)) Unit!30426)

(assert (=> d!110319 (= lt!403675 (choose!13 (_keys!10005 thiss!1181) key!785 (index!37824 lt!403664)))))

(assert (=> d!110319 (bvsge (index!37824 lt!403664) #b00000000000000000000000000000000)))

(assert (=> d!110319 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) key!785 (index!37824 lt!403664)) lt!403675)))

(declare-fun bs!25074 () Bool)

(assert (= bs!25074 d!110319))

(assert (=> bs!25074 m!831467))

(declare-fun m!831495 () Bool)

(assert (=> bs!25074 m!831495))

(assert (=> b!893438 d!110319))

(declare-fun d!110321 () Bool)

(declare-fun e!498962 () Bool)

(assert (=> d!110321 e!498962))

(declare-fun res!605000 () Bool)

(assert (=> d!110321 (=> (not res!605000) (not e!498962))))

(assert (=> d!110321 (= res!605000 (and (bvsge (index!37824 lt!403664) #b00000000000000000000000000000000) (bvslt (index!37824 lt!403664) (size!25623 (_keys!10005 thiss!1181)))))))

(declare-fun lt!403678 () Unit!30426)

(declare-fun choose!1464 (array!52350 array!52352 (_ BitVec 32) (_ BitVec 32) V!29209 V!29209 (_ BitVec 32) Int) Unit!30426)

(assert (=> d!110321 (= lt!403678 (choose!1464 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) (index!37824 lt!403664) (defaultEntry!5318 thiss!1181)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110321 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110321 (= (lemmaValidKeyInArrayIsInListMap!239 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) (index!37824 lt!403664) (defaultEntry!5318 thiss!1181)) lt!403678)))

(declare-fun b!893455 () Bool)

(assert (=> b!893455 (= e!498962 (contains!4383 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)) (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664))))))

(assert (= (and d!110321 res!605000) b!893455))

(declare-fun m!831497 () Bool)

(assert (=> d!110321 m!831497))

(declare-fun m!831499 () Bool)

(assert (=> d!110321 m!831499))

(assert (=> b!893455 m!831457))

(assert (=> b!893455 m!831487))

(assert (=> b!893455 m!831457))

(assert (=> b!893455 m!831487))

(declare-fun m!831501 () Bool)

(assert (=> b!893455 m!831501))

(assert (=> b!893438 d!110321))

(declare-fun b!893464 () Bool)

(declare-fun res!605010 () Bool)

(declare-fun e!498965 () Bool)

(assert (=> b!893464 (=> (not res!605010) (not e!498965))))

(assert (=> b!893464 (= res!605010 (and (= (size!25624 (_values!5305 thiss!1181)) (bvadd (mask!25849 thiss!1181) #b00000000000000000000000000000001)) (= (size!25623 (_keys!10005 thiss!1181)) (size!25624 (_values!5305 thiss!1181))) (bvsge (_size!2173 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2173 thiss!1181) (bvadd (mask!25849 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!893465 () Bool)

(declare-fun res!605009 () Bool)

(assert (=> b!893465 (=> (not res!605009) (not e!498965))))

(declare-fun size!25627 (LongMapFixedSize!4236) (_ BitVec 32))

(assert (=> b!893465 (= res!605009 (bvsge (size!25627 thiss!1181) (_size!2173 thiss!1181)))))

(declare-fun b!893466 () Bool)

(declare-fun res!605011 () Bool)

(assert (=> b!893466 (=> (not res!605011) (not e!498965))))

(assert (=> b!893466 (= res!605011 (= (size!25627 thiss!1181) (bvadd (_size!2173 thiss!1181) (bvsdiv (bvadd (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!893467 () Bool)

(assert (=> b!893467 (= e!498965 (and (bvsge (extraKeys!5014 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5014 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2173 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110323 () Bool)

(declare-fun res!605012 () Bool)

(assert (=> d!110323 (=> (not res!605012) (not e!498965))))

(assert (=> d!110323 (= res!605012 (validMask!0 (mask!25849 thiss!1181)))))

(assert (=> d!110323 (= (simpleValid!297 thiss!1181) e!498965)))

(assert (= (and d!110323 res!605012) b!893464))

(assert (= (and b!893464 res!605010) b!893465))

(assert (= (and b!893465 res!605009) b!893466))

(assert (= (and b!893466 res!605011) b!893467))

(declare-fun m!831503 () Bool)

(assert (=> b!893465 m!831503))

(assert (=> b!893466 m!831503))

(assert (=> d!110323 m!831499))

(assert (=> d!110309 d!110323))

(declare-fun b!893476 () Bool)

(declare-fun e!498971 () (_ BitVec 32))

(declare-fun e!498970 () (_ BitVec 32))

(assert (=> b!893476 (= e!498971 e!498970)))

(declare-fun c!94127 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!893476 (= c!94127 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893477 () Bool)

(declare-fun call!39627 () (_ BitVec 32))

(assert (=> b!893477 (= e!498970 (bvadd #b00000000000000000000000000000001 call!39627))))

(declare-fun d!110325 () Bool)

(declare-fun lt!403681 () (_ BitVec 32))

(assert (=> d!110325 (and (bvsge lt!403681 #b00000000000000000000000000000000) (bvsle lt!403681 (bvsub (size!25623 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110325 (= lt!403681 e!498971)))

(declare-fun c!94126 () Bool)

(assert (=> d!110325 (= c!94126 (bvsge #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110325 (and (bvsle #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25623 (_keys!10005 thiss!1181)) (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110325 (= (arrayCountValidKeys!0 (_keys!10005 thiss!1181) #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))) lt!403681)))

(declare-fun bm!39624 () Bool)

(assert (=> bm!39624 (= call!39627 (arrayCountValidKeys!0 (_keys!10005 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893478 () Bool)

(assert (=> b!893478 (= e!498971 #b00000000000000000000000000000000)))

(declare-fun b!893479 () Bool)

(assert (=> b!893479 (= e!498970 call!39627)))

(assert (= (and d!110325 c!94126) b!893478))

(assert (= (and d!110325 (not c!94126)) b!893476))

(assert (= (and b!893476 c!94127) b!893477))

(assert (= (and b!893476 (not c!94127)) b!893479))

(assert (= (or b!893477 b!893479) bm!39624))

(declare-fun m!831505 () Bool)

(assert (=> b!893476 m!831505))

(assert (=> b!893476 m!831505))

(declare-fun m!831507 () Bool)

(assert (=> b!893476 m!831507))

(declare-fun m!831509 () Bool)

(assert (=> bm!39624 m!831509))

(assert (=> b!893408 d!110325))

(declare-fun d!110327 () Bool)

(declare-fun e!498976 () Bool)

(assert (=> d!110327 e!498976))

(declare-fun res!605015 () Bool)

(assert (=> d!110327 (=> res!605015 e!498976)))

(declare-fun lt!403693 () Bool)

(assert (=> d!110327 (= res!605015 (not lt!403693))))

(declare-fun lt!403690 () Bool)

(assert (=> d!110327 (= lt!403693 lt!403690)))

(declare-fun lt!403691 () Unit!30426)

(declare-fun e!498977 () Unit!30426)

(assert (=> d!110327 (= lt!403691 e!498977)))

(declare-fun c!94130 () Bool)

(assert (=> d!110327 (= c!94130 lt!403690)))

(declare-fun containsKey!422 (List!17797 (_ BitVec 64)) Bool)

(assert (=> d!110327 (= lt!403690 (containsKey!422 (toList!5372 (map!12215 thiss!1181)) key!785))))

(assert (=> d!110327 (= (contains!4383 (map!12215 thiss!1181) key!785) lt!403693)))

(declare-fun b!893486 () Bool)

(declare-fun lt!403692 () Unit!30426)

(assert (=> b!893486 (= e!498977 lt!403692)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!318 (List!17797 (_ BitVec 64)) Unit!30426)

(assert (=> b!893486 (= lt!403692 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 (map!12215 thiss!1181)) key!785))))

(declare-fun isDefined!327 (Option!454) Bool)

(assert (=> b!893486 (isDefined!327 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785))))

(declare-fun b!893487 () Bool)

(declare-fun Unit!30430 () Unit!30426)

(assert (=> b!893487 (= e!498977 Unit!30430)))

(declare-fun b!893488 () Bool)

(assert (=> b!893488 (= e!498976 (isDefined!327 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785)))))

(assert (= (and d!110327 c!94130) b!893486))

(assert (= (and d!110327 (not c!94130)) b!893487))

(assert (= (and d!110327 (not res!605015)) b!893488))

(declare-fun m!831511 () Bool)

(assert (=> d!110327 m!831511))

(declare-fun m!831513 () Bool)

(assert (=> b!893486 m!831513))

(assert (=> b!893486 m!831423))

(assert (=> b!893486 m!831423))

(declare-fun m!831515 () Bool)

(assert (=> b!893486 m!831515))

(assert (=> b!893488 m!831423))

(assert (=> b!893488 m!831423))

(assert (=> b!893488 m!831515))

(assert (=> d!110315 d!110327))

(assert (=> d!110315 d!110307))

(assert (=> d!110315 d!110309))

(declare-fun bm!39627 () Bool)

(declare-fun call!39630 () Bool)

(assert (=> bm!39627 (= call!39630 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893497 () Bool)

(declare-fun e!498986 () Bool)

(assert (=> b!893497 (= e!498986 call!39630)))

(declare-fun b!893498 () Bool)

(declare-fun e!498985 () Bool)

(declare-fun e!498984 () Bool)

(assert (=> b!893498 (= e!498985 e!498984)))

(declare-fun c!94133 () Bool)

(assert (=> b!893498 (= c!94133 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!110329 () Bool)

(declare-fun res!605021 () Bool)

(assert (=> d!110329 (=> res!605021 e!498985)))

(assert (=> d!110329 (= res!605021 (bvsge #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110329 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) e!498985)))

(declare-fun b!893499 () Bool)

(assert (=> b!893499 (= e!498984 call!39630)))

(declare-fun b!893500 () Bool)

(assert (=> b!893500 (= e!498984 e!498986)))

(declare-fun lt!403700 () (_ BitVec 64))

(assert (=> b!893500 (= lt!403700 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403702 () Unit!30426)

(assert (=> b!893500 (= lt!403702 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) lt!403700 #b00000000000000000000000000000000))))

(assert (=> b!893500 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403700 #b00000000000000000000000000000000)))

(declare-fun lt!403701 () Unit!30426)

(assert (=> b!893500 (= lt!403701 lt!403702)))

(declare-fun res!605020 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52350 (_ BitVec 32)) SeekEntryResult!8863)

(assert (=> b!893500 (= res!605020 (= (seekEntryOrOpen!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) (Found!8863 #b00000000000000000000000000000000)))))

(assert (=> b!893500 (=> (not res!605020) (not e!498986))))

(assert (= (and d!110329 (not res!605021)) b!893498))

(assert (= (and b!893498 c!94133) b!893500))

(assert (= (and b!893498 (not c!94133)) b!893499))

(assert (= (and b!893500 res!605020) b!893497))

(assert (= (or b!893497 b!893499) bm!39627))

(declare-fun m!831517 () Bool)

(assert (=> bm!39627 m!831517))

(assert (=> b!893498 m!831505))

(assert (=> b!893498 m!831505))

(assert (=> b!893498 m!831507))

(assert (=> b!893500 m!831505))

(declare-fun m!831519 () Bool)

(assert (=> b!893500 m!831519))

(declare-fun m!831521 () Bool)

(assert (=> b!893500 m!831521))

(assert (=> b!893500 m!831505))

(declare-fun m!831523 () Bool)

(assert (=> b!893500 m!831523))

(assert (=> b!893409 d!110329))

(declare-fun b!893543 () Bool)

(declare-fun res!605045 () Bool)

(declare-fun e!499013 () Bool)

(assert (=> b!893543 (=> (not res!605045) (not e!499013))))

(declare-fun e!499016 () Bool)

(assert (=> b!893543 (= res!605045 e!499016)))

(declare-fun c!94148 () Bool)

(assert (=> b!893543 (= c!94148 (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!893544 () Bool)

(declare-fun e!499020 () Bool)

(declare-fun call!39646 () Bool)

(assert (=> b!893544 (= e!499020 (not call!39646))))

(declare-fun bm!39642 () Bool)

(declare-fun call!39647 () ListLongMap!10713)

(declare-fun call!39650 () ListLongMap!10713)

(assert (=> bm!39642 (= call!39647 call!39650)))

(declare-fun b!893545 () Bool)

(declare-fun e!499023 () Bool)

(assert (=> b!893545 (= e!499016 e!499023)))

(declare-fun res!605043 () Bool)

(declare-fun call!39648 () Bool)

(assert (=> b!893545 (= res!605043 call!39648)))

(assert (=> b!893545 (=> (not res!605043) (not e!499023))))

(declare-fun b!893546 () Bool)

(assert (=> b!893546 (= e!499013 e!499020)))

(declare-fun c!94151 () Bool)

(assert (=> b!893546 (= c!94151 (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!893547 () Bool)

(declare-fun e!499025 () ListLongMap!10713)

(declare-fun call!39645 () ListLongMap!10713)

(assert (=> b!893547 (= e!499025 call!39645)))

(declare-fun b!893548 () Bool)

(declare-fun e!499014 () ListLongMap!10713)

(assert (=> b!893548 (= e!499014 call!39645)))

(declare-fun b!893549 () Bool)

(declare-fun e!499024 () Bool)

(assert (=> b!893549 (= e!499020 e!499024)))

(declare-fun res!605042 () Bool)

(assert (=> b!893549 (= res!605042 call!39646)))

(assert (=> b!893549 (=> (not res!605042) (not e!499024))))

(declare-fun b!893550 () Bool)

(declare-fun e!499021 () Bool)

(declare-fun e!499019 () Bool)

(assert (=> b!893550 (= e!499021 e!499019)))

(declare-fun res!605041 () Bool)

(assert (=> b!893550 (=> (not res!605041) (not e!499019))))

(declare-fun lt!403761 () ListLongMap!10713)

(assert (=> b!893550 (= res!605041 (contains!4383 lt!403761 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893550 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893552 () Bool)

(declare-fun res!605044 () Bool)

(assert (=> b!893552 (=> (not res!605044) (not e!499013))))

(assert (=> b!893552 (= res!605044 e!499021)))

(declare-fun res!605047 () Bool)

(assert (=> b!893552 (=> res!605047 e!499021)))

(declare-fun e!499022 () Bool)

(assert (=> b!893552 (= res!605047 (not e!499022))))

(declare-fun res!605048 () Bool)

(assert (=> b!893552 (=> (not res!605048) (not e!499022))))

(assert (=> b!893552 (= res!605048 (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893553 () Bool)

(declare-fun apply!407 (ListLongMap!10713 (_ BitVec 64)) V!29209)

(assert (=> b!893553 (= e!499024 (= (apply!407 lt!403761 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5118 thiss!1181)))))

(declare-fun bm!39643 () Bool)

(assert (=> bm!39643 (= call!39646 (contains!4383 lt!403761 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893554 () Bool)

(declare-fun e!499015 () Bool)

(assert (=> b!893554 (= e!499015 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893555 () Bool)

(assert (=> b!893555 (= e!499025 call!39647)))

(declare-fun b!893556 () Bool)

(declare-fun e!499018 () Unit!30426)

(declare-fun Unit!30431 () Unit!30426)

(assert (=> b!893556 (= e!499018 Unit!30431)))

(declare-fun b!893557 () Bool)

(assert (=> b!893557 (= e!499023 (= (apply!407 lt!403761 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5118 thiss!1181)))))

(declare-fun bm!39644 () Bool)

(declare-fun call!39651 () ListLongMap!10713)

(assert (=> bm!39644 (= call!39650 call!39651)))

(declare-fun bm!39645 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3275 (array!52350 array!52352 (_ BitVec 32) (_ BitVec 32) V!29209 V!29209 (_ BitVec 32) Int) ListLongMap!10713)

(assert (=> bm!39645 (= call!39651 (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)))))

(declare-fun b!893558 () Bool)

(assert (=> b!893558 (= e!499022 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893559 () Bool)

(declare-fun get!13256 (ValueCell!8610 V!29209) V!29209)

(assert (=> b!893559 (= e!499019 (= (apply!407 lt!403761 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)) (get!13256 (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1297 (defaultEntry!5318 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25624 (_values!5305 thiss!1181))))))

(assert (=> b!893559 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun bm!39646 () Bool)

(assert (=> bm!39646 (= call!39648 (contains!4383 lt!403761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893560 () Bool)

(declare-fun e!499017 () ListLongMap!10713)

(assert (=> b!893560 (= e!499017 e!499014)))

(declare-fun c!94147 () Bool)

(assert (=> b!893560 (= c!94147 (and (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!39649 () ListLongMap!10713)

(declare-fun bm!39647 () Bool)

(declare-fun c!94149 () Bool)

(declare-fun +!2588 (ListLongMap!10713 tuple2!12016) ListLongMap!10713)

(assert (=> bm!39647 (= call!39649 (+!2588 (ite c!94149 call!39651 (ite c!94147 call!39650 call!39647)) (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))))))

(declare-fun b!893561 () Bool)

(declare-fun c!94146 () Bool)

(assert (=> b!893561 (= c!94146 (and (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!893561 (= e!499014 e!499025)))

(declare-fun b!893562 () Bool)

(assert (=> b!893562 (= e!499016 (not call!39648))))

(declare-fun b!893551 () Bool)

(assert (=> b!893551 (= e!499017 (+!2588 call!39649 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))))

(declare-fun d!110331 () Bool)

(assert (=> d!110331 e!499013))

(declare-fun res!605040 () Bool)

(assert (=> d!110331 (=> (not res!605040) (not e!499013))))

(assert (=> d!110331 (= res!605040 (or (bvsge #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))))

(declare-fun lt!403754 () ListLongMap!10713)

(assert (=> d!110331 (= lt!403761 lt!403754)))

(declare-fun lt!403755 () Unit!30426)

(assert (=> d!110331 (= lt!403755 e!499018)))

(declare-fun c!94150 () Bool)

(assert (=> d!110331 (= c!94150 e!499015)))

(declare-fun res!605046 () Bool)

(assert (=> d!110331 (=> (not res!605046) (not e!499015))))

(assert (=> d!110331 (= res!605046 (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110331 (= lt!403754 e!499017)))

(assert (=> d!110331 (= c!94149 (and (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!110331 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110331 (= (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)) lt!403761)))

(declare-fun b!893563 () Bool)

(declare-fun lt!403758 () Unit!30426)

(assert (=> b!893563 (= e!499018 lt!403758)))

(declare-fun lt!403751 () ListLongMap!10713)

(assert (=> b!893563 (= lt!403751 (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)))))

(declare-fun lt!403763 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403763 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403748 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403748 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403750 () Unit!30426)

(declare-fun addStillContains!329 (ListLongMap!10713 (_ BitVec 64) V!29209 (_ BitVec 64)) Unit!30426)

(assert (=> b!893563 (= lt!403750 (addStillContains!329 lt!403751 lt!403763 (zeroValue!5118 thiss!1181) lt!403748))))

(assert (=> b!893563 (contains!4383 (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))) lt!403748)))

(declare-fun lt!403752 () Unit!30426)

(assert (=> b!893563 (= lt!403752 lt!403750)))

(declare-fun lt!403757 () ListLongMap!10713)

(assert (=> b!893563 (= lt!403757 (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)))))

(declare-fun lt!403759 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403759 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403760 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403760 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403766 () Unit!30426)

(declare-fun addApplyDifferent!329 (ListLongMap!10713 (_ BitVec 64) V!29209 (_ BitVec 64)) Unit!30426)

(assert (=> b!893563 (= lt!403766 (addApplyDifferent!329 lt!403757 lt!403759 (minValue!5118 thiss!1181) lt!403760))))

(assert (=> b!893563 (= (apply!407 (+!2588 lt!403757 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))) lt!403760) (apply!407 lt!403757 lt!403760))))

(declare-fun lt!403753 () Unit!30426)

(assert (=> b!893563 (= lt!403753 lt!403766)))

(declare-fun lt!403749 () ListLongMap!10713)

(assert (=> b!893563 (= lt!403749 (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)))))

(declare-fun lt!403756 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403756 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403762 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403762 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!403764 () Unit!30426)

(assert (=> b!893563 (= lt!403764 (addApplyDifferent!329 lt!403749 lt!403756 (zeroValue!5118 thiss!1181) lt!403762))))

(assert (=> b!893563 (= (apply!407 (+!2588 lt!403749 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))) lt!403762) (apply!407 lt!403749 lt!403762))))

(declare-fun lt!403747 () Unit!30426)

(assert (=> b!893563 (= lt!403747 lt!403764)))

(declare-fun lt!403765 () ListLongMap!10713)

(assert (=> b!893563 (= lt!403765 (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)))))

(declare-fun lt!403768 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403768 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!403767 () (_ BitVec 64))

(assert (=> b!893563 (= lt!403767 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!893563 (= lt!403758 (addApplyDifferent!329 lt!403765 lt!403768 (minValue!5118 thiss!1181) lt!403767))))

(assert (=> b!893563 (= (apply!407 (+!2588 lt!403765 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))) lt!403767) (apply!407 lt!403765 lt!403767))))

(declare-fun bm!39648 () Bool)

(assert (=> bm!39648 (= call!39645 call!39649)))

(assert (= (and d!110331 c!94149) b!893551))

(assert (= (and d!110331 (not c!94149)) b!893560))

(assert (= (and b!893560 c!94147) b!893548))

(assert (= (and b!893560 (not c!94147)) b!893561))

(assert (= (and b!893561 c!94146) b!893547))

(assert (= (and b!893561 (not c!94146)) b!893555))

(assert (= (or b!893547 b!893555) bm!39642))

(assert (= (or b!893548 bm!39642) bm!39644))

(assert (= (or b!893548 b!893547) bm!39648))

(assert (= (or b!893551 bm!39644) bm!39645))

(assert (= (or b!893551 bm!39648) bm!39647))

(assert (= (and d!110331 res!605046) b!893554))

(assert (= (and d!110331 c!94150) b!893563))

(assert (= (and d!110331 (not c!94150)) b!893556))

(assert (= (and d!110331 res!605040) b!893552))

(assert (= (and b!893552 res!605048) b!893558))

(assert (= (and b!893552 (not res!605047)) b!893550))

(assert (= (and b!893550 res!605041) b!893559))

(assert (= (and b!893552 res!605044) b!893543))

(assert (= (and b!893543 c!94148) b!893545))

(assert (= (and b!893543 (not c!94148)) b!893562))

(assert (= (and b!893545 res!605043) b!893557))

(assert (= (or b!893545 b!893562) bm!39646))

(assert (= (and b!893543 res!605045) b!893546))

(assert (= (and b!893546 c!94151) b!893549))

(assert (= (and b!893546 (not c!94151)) b!893544))

(assert (= (and b!893549 res!605042) b!893553))

(assert (= (or b!893549 b!893544) bm!39643))

(declare-fun b_lambda!12919 () Bool)

(assert (=> (not b_lambda!12919) (not b!893559)))

(declare-fun t!25124 () Bool)

(declare-fun tb!5175 () Bool)

(assert (=> (and b!893354 (= (defaultEntry!5318 thiss!1181) (defaultEntry!5318 thiss!1181)) t!25124) tb!5175))

(declare-fun result!10067 () Bool)

(assert (=> tb!5175 (= result!10067 tp_is_empty!18183)))

(assert (=> b!893559 t!25124))

(declare-fun b_and!26127 () Bool)

(assert (= b_and!26121 (and (=> t!25124 result!10067) b_and!26127)))

(assert (=> b!893558 m!831505))

(assert (=> b!893558 m!831505))

(assert (=> b!893558 m!831507))

(assert (=> b!893554 m!831505))

(assert (=> b!893554 m!831505))

(assert (=> b!893554 m!831507))

(assert (=> d!110331 m!831499))

(declare-fun m!831525 () Bool)

(assert (=> b!893563 m!831525))

(declare-fun m!831527 () Bool)

(assert (=> b!893563 m!831527))

(declare-fun m!831529 () Bool)

(assert (=> b!893563 m!831529))

(declare-fun m!831531 () Bool)

(assert (=> b!893563 m!831531))

(declare-fun m!831533 () Bool)

(assert (=> b!893563 m!831533))

(declare-fun m!831535 () Bool)

(assert (=> b!893563 m!831535))

(declare-fun m!831537 () Bool)

(assert (=> b!893563 m!831537))

(declare-fun m!831539 () Bool)

(assert (=> b!893563 m!831539))

(declare-fun m!831541 () Bool)

(assert (=> b!893563 m!831541))

(declare-fun m!831543 () Bool)

(assert (=> b!893563 m!831543))

(assert (=> b!893563 m!831529))

(assert (=> b!893563 m!831505))

(declare-fun m!831545 () Bool)

(assert (=> b!893563 m!831545))

(declare-fun m!831547 () Bool)

(assert (=> b!893563 m!831547))

(declare-fun m!831549 () Bool)

(assert (=> b!893563 m!831549))

(assert (=> b!893563 m!831533))

(declare-fun m!831551 () Bool)

(assert (=> b!893563 m!831551))

(assert (=> b!893563 m!831539))

(declare-fun m!831553 () Bool)

(assert (=> b!893563 m!831553))

(assert (=> b!893563 m!831545))

(declare-fun m!831555 () Bool)

(assert (=> b!893563 m!831555))

(assert (=> b!893550 m!831505))

(assert (=> b!893550 m!831505))

(declare-fun m!831557 () Bool)

(assert (=> b!893550 m!831557))

(declare-fun m!831559 () Bool)

(assert (=> b!893553 m!831559))

(declare-fun m!831561 () Bool)

(assert (=> bm!39646 m!831561))

(assert (=> bm!39645 m!831535))

(declare-fun m!831563 () Bool)

(assert (=> b!893557 m!831563))

(declare-fun m!831565 () Bool)

(assert (=> b!893551 m!831565))

(declare-fun m!831567 () Bool)

(assert (=> bm!39643 m!831567))

(declare-fun m!831569 () Bool)

(assert (=> bm!39647 m!831569))

(declare-fun m!831571 () Bool)

(assert (=> b!893559 m!831571))

(declare-fun m!831573 () Bool)

(assert (=> b!893559 m!831573))

(declare-fun m!831575 () Bool)

(assert (=> b!893559 m!831575))

(assert (=> b!893559 m!831571))

(assert (=> b!893559 m!831505))

(assert (=> b!893559 m!831573))

(assert (=> b!893559 m!831505))

(declare-fun m!831577 () Bool)

(assert (=> b!893559 m!831577))

(assert (=> bm!39619 d!110331))

(declare-fun bm!39651 () Bool)

(declare-fun call!39654 () Bool)

(declare-fun c!94154 () Bool)

(assert (=> bm!39651 (= call!39654 (arrayNoDuplicates!0 (_keys!10005 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94154 (Cons!17795 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) Nil!17796) Nil!17796)))))

(declare-fun b!893574 () Bool)

(declare-fun e!499036 () Bool)

(declare-fun e!499035 () Bool)

(assert (=> b!893574 (= e!499036 e!499035)))

(assert (=> b!893574 (= c!94154 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893575 () Bool)

(assert (=> b!893575 (= e!499035 call!39654)))

(declare-fun d!110333 () Bool)

(declare-fun res!605056 () Bool)

(declare-fun e!499034 () Bool)

(assert (=> d!110333 (=> res!605056 e!499034)))

(assert (=> d!110333 (= res!605056 (bvsge #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110333 (= (arrayNoDuplicates!0 (_keys!10005 thiss!1181) #b00000000000000000000000000000000 Nil!17796) e!499034)))

(declare-fun b!893576 () Bool)

(declare-fun e!499037 () Bool)

(declare-fun contains!4384 (List!17799 (_ BitVec 64)) Bool)

(assert (=> b!893576 (= e!499037 (contains!4384 Nil!17796 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893577 () Bool)

(assert (=> b!893577 (= e!499034 e!499036)))

(declare-fun res!605055 () Bool)

(assert (=> b!893577 (=> (not res!605055) (not e!499036))))

(assert (=> b!893577 (= res!605055 (not e!499037))))

(declare-fun res!605057 () Bool)

(assert (=> b!893577 (=> (not res!605057) (not e!499037))))

(assert (=> b!893577 (= res!605057 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893578 () Bool)

(assert (=> b!893578 (= e!499035 call!39654)))

(assert (= (and d!110333 (not res!605056)) b!893577))

(assert (= (and b!893577 res!605057) b!893576))

(assert (= (and b!893577 res!605055) b!893574))

(assert (= (and b!893574 c!94154) b!893578))

(assert (= (and b!893574 (not c!94154)) b!893575))

(assert (= (or b!893578 b!893575) bm!39651))

(assert (=> bm!39651 m!831505))

(declare-fun m!831579 () Bool)

(assert (=> bm!39651 m!831579))

(assert (=> b!893574 m!831505))

(assert (=> b!893574 m!831505))

(assert (=> b!893574 m!831507))

(assert (=> b!893576 m!831505))

(assert (=> b!893576 m!831505))

(declare-fun m!831581 () Bool)

(assert (=> b!893576 m!831581))

(assert (=> b!893577 m!831505))

(assert (=> b!893577 m!831505))

(assert (=> b!893577 m!831507))

(assert (=> b!893410 d!110333))

(assert (=> d!110307 d!110331))

(declare-fun d!110335 () Bool)

(declare-fun e!499040 () Bool)

(assert (=> d!110335 e!499040))

(declare-fun c!94157 () Bool)

(assert (=> d!110335 (= c!94157 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!403771 () Unit!30426)

(declare-fun choose!1465 (array!52350 array!52352 (_ BitVec 32) (_ BitVec 32) V!29209 V!29209 (_ BitVec 64) Int) Unit!30426)

(assert (=> d!110335 (= lt!403771 (choose!1465 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) key!785 (defaultEntry!5318 thiss!1181)))))

(assert (=> d!110335 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110335 (= (lemmaKeyInListMapIsInArray!162 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) key!785 (defaultEntry!5318 thiss!1181)) lt!403771)))

(declare-fun b!893583 () Bool)

(assert (=> b!893583 (= e!499040 (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893584 () Bool)

(assert (=> b!893584 (= e!499040 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110335 c!94157) b!893583))

(assert (= (and d!110335 (not c!94157)) b!893584))

(declare-fun m!831583 () Bool)

(assert (=> d!110335 m!831583))

(assert (=> d!110335 m!831499))

(assert (=> b!893583 m!831467))

(assert (=> b!893434 d!110335))

(declare-fun b!893597 () Bool)

(declare-fun c!94166 () Bool)

(declare-fun lt!403780 () (_ BitVec 64))

(assert (=> b!893597 (= c!94166 (= lt!403780 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499049 () SeekEntryResult!8863)

(declare-fun e!499048 () SeekEntryResult!8863)

(assert (=> b!893597 (= e!499049 e!499048)))

(declare-fun b!893598 () Bool)

(declare-fun lt!403782 () SeekEntryResult!8863)

(assert (=> b!893598 (= e!499049 (Found!8863 (index!37825 lt!403782)))))

(declare-fun b!893599 () Bool)

(declare-fun e!499047 () SeekEntryResult!8863)

(assert (=> b!893599 (= e!499047 Undefined!8863)))

(declare-fun b!893600 () Bool)

(assert (=> b!893600 (= e!499048 (MissingZero!8863 (index!37825 lt!403782)))))

(declare-fun b!893601 () Bool)

(assert (=> b!893601 (= e!499047 e!499049)))

(assert (=> b!893601 (= lt!403780 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37825 lt!403782)))))

(declare-fun c!94165 () Bool)

(assert (=> b!893601 (= c!94165 (= lt!403780 key!785))))

(declare-fun b!893602 () Bool)

(declare-fun lt!403783 () SeekEntryResult!8863)

(assert (=> b!893602 (= e!499048 (ite ((_ is MissingVacant!8863) lt!403783) (MissingZero!8863 (index!37826 lt!403783)) lt!403783))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52350 (_ BitVec 32)) SeekEntryResult!8863)

(assert (=> b!893602 (= lt!403783 (seekKeyOrZeroReturnVacant!0 (x!75963 lt!403782) (index!37825 lt!403782) (index!37825 lt!403782) key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun d!110337 () Bool)

(declare-fun lt!403781 () SeekEntryResult!8863)

(assert (=> d!110337 (and (or ((_ is MissingVacant!8863) lt!403781) (not ((_ is Found!8863) lt!403781)) (and (bvsge (index!37824 lt!403781) #b00000000000000000000000000000000) (bvslt (index!37824 lt!403781) (size!25623 (_keys!10005 thiss!1181))))) (not ((_ is MissingVacant!8863) lt!403781)) (or (not ((_ is Found!8863) lt!403781)) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403781)) key!785)))))

(assert (=> d!110337 (= lt!403781 e!499047)))

(declare-fun c!94164 () Bool)

(assert (=> d!110337 (= c!94164 (and ((_ is Intermediate!8863) lt!403782) (undefined!9675 lt!403782)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52350 (_ BitVec 32)) SeekEntryResult!8863)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110337 (= lt!403782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25849 thiss!1181)) key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(assert (=> d!110337 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110337 (= (seekEntry!0 key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) lt!403781)))

(assert (= (and d!110337 c!94164) b!893599))

(assert (= (and d!110337 (not c!94164)) b!893601))

(assert (= (and b!893601 c!94165) b!893598))

(assert (= (and b!893601 (not c!94165)) b!893597))

(assert (= (and b!893597 c!94166) b!893600))

(assert (= (and b!893597 (not c!94166)) b!893602))

(declare-fun m!831585 () Bool)

(assert (=> b!893601 m!831585))

(declare-fun m!831587 () Bool)

(assert (=> b!893602 m!831587))

(declare-fun m!831589 () Bool)

(assert (=> d!110337 m!831589))

(declare-fun m!831591 () Bool)

(assert (=> d!110337 m!831591))

(assert (=> d!110337 m!831591))

(declare-fun m!831593 () Bool)

(assert (=> d!110337 m!831593))

(assert (=> d!110337 m!831499))

(assert (=> b!893434 d!110337))

(declare-fun d!110339 () Bool)

(declare-fun lt!403789 () SeekEntryResult!8863)

(assert (=> d!110339 (and ((_ is Found!8863) lt!403789) (= (index!37824 lt!403789) lt!403659))))

(assert (=> d!110339 (= lt!403789 (seekEntry!0 key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun lt!403788 () Unit!30426)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!52350 (_ BitVec 32)) Unit!30426)

(assert (=> d!110339 (= lt!403788 (choose!0 key!785 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(assert (=> d!110339 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110339 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) lt!403788)))

(declare-fun bs!25075 () Bool)

(assert (= bs!25075 d!110339))

(assert (=> bs!25075 m!831469))

(declare-fun m!831595 () Bool)

(assert (=> bs!25075 m!831595))

(assert (=> bs!25075 m!831499))

(assert (=> b!893434 d!110339))

(declare-fun bm!39652 () Bool)

(declare-fun call!39655 () Bool)

(assert (=> bm!39652 (= call!39655 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403659 #b00000000000000000000000000000001) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893603 () Bool)

(declare-fun e!499052 () Bool)

(assert (=> b!893603 (= e!499052 call!39655)))

(declare-fun b!893604 () Bool)

(declare-fun e!499051 () Bool)

(declare-fun e!499050 () Bool)

(assert (=> b!893604 (= e!499051 e!499050)))

(declare-fun c!94167 () Bool)

(assert (=> b!893604 (= c!94167 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659)))))

(declare-fun d!110341 () Bool)

(declare-fun res!605059 () Bool)

(assert (=> d!110341 (=> res!605059 e!499051)))

(assert (=> d!110341 (= res!605059 (bvsge lt!403659 (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110341 (= (arrayForallSeekEntryOrOpenFound!0 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) e!499051)))

(declare-fun b!893605 () Bool)

(assert (=> b!893605 (= e!499050 call!39655)))

(declare-fun b!893606 () Bool)

(assert (=> b!893606 (= e!499050 e!499052)))

(declare-fun lt!403790 () (_ BitVec 64))

(assert (=> b!893606 (= lt!403790 (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659))))

(declare-fun lt!403792 () Unit!30426)

(assert (=> b!893606 (= lt!403792 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) lt!403790 lt!403659))))

(assert (=> b!893606 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403790 #b00000000000000000000000000000000)))

(declare-fun lt!403791 () Unit!30426)

(assert (=> b!893606 (= lt!403791 lt!403792)))

(declare-fun res!605058 () Bool)

(assert (=> b!893606 (= res!605058 (= (seekEntryOrOpen!0 (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) (Found!8863 lt!403659)))))

(assert (=> b!893606 (=> (not res!605058) (not e!499052))))

(assert (= (and d!110341 (not res!605059)) b!893604))

(assert (= (and b!893604 c!94167) b!893606))

(assert (= (and b!893604 (not c!94167)) b!893605))

(assert (= (and b!893606 res!605058) b!893603))

(assert (= (or b!893603 b!893605) bm!39652))

(declare-fun m!831597 () Bool)

(assert (=> bm!39652 m!831597))

(declare-fun m!831599 () Bool)

(assert (=> b!893604 m!831599))

(assert (=> b!893604 m!831599))

(declare-fun m!831601 () Bool)

(assert (=> b!893604 m!831601))

(assert (=> b!893606 m!831599))

(declare-fun m!831603 () Bool)

(assert (=> b!893606 m!831603))

(declare-fun m!831605 () Bool)

(assert (=> b!893606 m!831605))

(assert (=> b!893606 m!831599))

(declare-fun m!831607 () Bool)

(assert (=> b!893606 m!831607))

(assert (=> b!893434 d!110341))

(declare-fun d!110343 () Bool)

(declare-fun lt!403795 () (_ BitVec 32))

(assert (=> d!110343 (and (or (bvslt lt!403795 #b00000000000000000000000000000000) (bvsge lt!403795 (size!25623 (_keys!10005 thiss!1181))) (and (bvsge lt!403795 #b00000000000000000000000000000000) (bvslt lt!403795 (size!25623 (_keys!10005 thiss!1181))))) (bvsge lt!403795 #b00000000000000000000000000000000) (bvslt lt!403795 (size!25623 (_keys!10005 thiss!1181))) (= (select (arr!25179 (_keys!10005 thiss!1181)) lt!403795) key!785))))

(declare-fun e!499055 () (_ BitVec 32))

(assert (=> d!110343 (= lt!403795 e!499055)))

(declare-fun c!94170 () Bool)

(assert (=> d!110343 (= c!94170 (= (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))) (bvslt (size!25623 (_keys!10005 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110343 (= (arrayScanForKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000) lt!403795)))

(declare-fun b!893611 () Bool)

(assert (=> b!893611 (= e!499055 #b00000000000000000000000000000000)))

(declare-fun b!893612 () Bool)

(assert (=> b!893612 (= e!499055 (arrayScanForKey!0 (_keys!10005 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110343 c!94170) b!893611))

(assert (= (and d!110343 (not c!94170)) b!893612))

(declare-fun m!831609 () Bool)

(assert (=> d!110343 m!831609))

(assert (=> d!110343 m!831505))

(declare-fun m!831611 () Bool)

(assert (=> b!893612 m!831611))

(assert (=> b!893434 d!110343))

(declare-fun d!110345 () Bool)

(assert (=> d!110345 (arrayForallSeekEntryOrOpenFound!0 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181))))

(declare-fun lt!403798 () Unit!30426)

(declare-fun choose!38 (array!52350 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30426)

(assert (=> d!110345 (= lt!403798 (choose!38 (_keys!10005 thiss!1181) (mask!25849 thiss!1181) #b00000000000000000000000000000000 lt!403659))))

(assert (=> d!110345 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110345 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10005 thiss!1181) (mask!25849 thiss!1181) #b00000000000000000000000000000000 lt!403659) lt!403798)))

(declare-fun bs!25076 () Bool)

(assert (= bs!25076 d!110345))

(assert (=> bs!25076 m!831471))

(declare-fun m!831613 () Bool)

(assert (=> bs!25076 m!831613))

(assert (=> bs!25076 m!831499))

(assert (=> b!893434 d!110345))

(declare-fun d!110347 () Bool)

(declare-fun res!605064 () Bool)

(declare-fun e!499060 () Bool)

(assert (=> d!110347 (=> res!605064 e!499060)))

(assert (=> d!110347 (= res!605064 (= (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!110347 (= (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000) e!499060)))

(declare-fun b!893617 () Bool)

(declare-fun e!499061 () Bool)

(assert (=> b!893617 (= e!499060 e!499061)))

(declare-fun res!605065 () Bool)

(assert (=> b!893617 (=> (not res!605065) (not e!499061))))

(assert (=> b!893617 (= res!605065 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893618 () Bool)

(assert (=> b!893618 (= e!499061 (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110347 (not res!605064)) b!893617))

(assert (= (and b!893617 res!605065) b!893618))

(assert (=> d!110347 m!831505))

(declare-fun m!831615 () Bool)

(assert (=> b!893618 m!831615))

(assert (=> bm!39621 d!110347))

(assert (=> b!893440 d!110337))

(declare-fun d!110349 () Bool)

(declare-fun e!499062 () Bool)

(assert (=> d!110349 e!499062))

(declare-fun res!605066 () Bool)

(assert (=> d!110349 (=> res!605066 e!499062)))

(declare-fun lt!403802 () Bool)

(assert (=> d!110349 (= res!605066 (not lt!403802))))

(declare-fun lt!403799 () Bool)

(assert (=> d!110349 (= lt!403802 lt!403799)))

(declare-fun lt!403800 () Unit!30426)

(declare-fun e!499063 () Unit!30426)

(assert (=> d!110349 (= lt!403800 e!499063)))

(declare-fun c!94171 () Bool)

(assert (=> d!110349 (= c!94171 lt!403799)))

(assert (=> d!110349 (= lt!403799 (containsKey!422 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(assert (=> d!110349 (= (contains!4383 call!39624 (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)) lt!403802)))

(declare-fun b!893619 () Bool)

(declare-fun lt!403801 () Unit!30426)

(assert (=> b!893619 (= e!499063 lt!403801)))

(assert (=> b!893619 (= lt!403801 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(assert (=> b!893619 (isDefined!327 (getValueByKey!448 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(declare-fun b!893620 () Bool)

(declare-fun Unit!30432 () Unit!30426)

(assert (=> b!893620 (= e!499063 Unit!30432)))

(declare-fun b!893621 () Bool)

(assert (=> b!893621 (= e!499062 (isDefined!327 (getValueByKey!448 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785))))))

(assert (= (and d!110349 c!94171) b!893619))

(assert (= (and d!110349 (not c!94171)) b!893620))

(assert (= (and d!110349 (not res!605066)) b!893621))

(declare-fun m!831617 () Bool)

(assert (=> d!110349 m!831617))

(declare-fun m!831619 () Bool)

(assert (=> b!893619 m!831619))

(declare-fun m!831621 () Bool)

(assert (=> b!893619 m!831621))

(assert (=> b!893619 m!831621))

(declare-fun m!831623 () Bool)

(assert (=> b!893619 m!831623))

(assert (=> b!893621 m!831621))

(assert (=> b!893621 m!831621))

(assert (=> b!893621 m!831623))

(assert (=> bm!39620 d!110349))

(declare-fun b!893622 () Bool)

(declare-fun e!499065 () Bool)

(assert (=> b!893622 (= e!499065 tp_is_empty!18183)))

(declare-fun mapIsEmpty!28842 () Bool)

(declare-fun mapRes!28842 () Bool)

(assert (=> mapIsEmpty!28842 mapRes!28842))

(declare-fun mapNonEmpty!28842 () Bool)

(declare-fun tp!55550 () Bool)

(assert (=> mapNonEmpty!28842 (= mapRes!28842 (and tp!55550 e!499065))))

(declare-fun mapValue!28842 () ValueCell!8610)

(declare-fun mapKey!28842 () (_ BitVec 32))

(declare-fun mapRest!28842 () (Array (_ BitVec 32) ValueCell!8610))

(assert (=> mapNonEmpty!28842 (= mapRest!28841 (store mapRest!28842 mapKey!28842 mapValue!28842))))

(declare-fun b!893623 () Bool)

(declare-fun e!499064 () Bool)

(assert (=> b!893623 (= e!499064 tp_is_empty!18183)))

(declare-fun condMapEmpty!28842 () Bool)

(declare-fun mapDefault!28842 () ValueCell!8610)

(assert (=> mapNonEmpty!28841 (= condMapEmpty!28842 (= mapRest!28841 ((as const (Array (_ BitVec 32) ValueCell!8610)) mapDefault!28842)))))

(assert (=> mapNonEmpty!28841 (= tp!55549 (and e!499064 mapRes!28842))))

(assert (= (and mapNonEmpty!28841 condMapEmpty!28842) mapIsEmpty!28842))

(assert (= (and mapNonEmpty!28841 (not condMapEmpty!28842)) mapNonEmpty!28842))

(assert (= (and mapNonEmpty!28842 ((_ is ValueCellFull!8610) mapValue!28842)) b!893622))

(assert (= (and mapNonEmpty!28841 ((_ is ValueCellFull!8610) mapDefault!28842)) b!893623))

(declare-fun m!831625 () Bool)

(assert (=> mapNonEmpty!28842 m!831625))

(declare-fun b_lambda!12921 () Bool)

(assert (= b_lambda!12919 (or (and b!893354 b_free!15855) b_lambda!12921)))

(check-sat (not b!893558) b_and!26127 (not b!893602) (not b!893577) (not d!110319) (not b!893583) (not b!893486) (not b!893563) (not b!893466) (not mapNonEmpty!28842) (not b!893576) (not b!893550) (not d!110321) (not bm!39627) (not d!110339) (not d!110349) (not b!893618) (not b!893498) (not b!893621) (not b!893551) (not d!110331) (not b!893574) (not b!893455) (not b!893559) (not bm!39651) (not d!110323) (not d!110345) (not b!893553) (not bm!39647) tp_is_empty!18183 (not b_lambda!12917) (not d!110335) (not bm!39646) (not b!893500) (not b!893604) (not b_next!15855) (not b_lambda!12921) (not d!110337) (not b!893606) (not bm!39652) (not b!893554) (not bm!39624) (not d!110327) (not b!893488) (not b!893451) (not b!893619) (not bm!39645) (not b!893612) (not b!893476) (not b!893465) (not b!893557) (not bm!39643))
(check-sat b_and!26127 (not b_next!15855))
(get-model)

(declare-fun b!893636 () Bool)

(declare-fun e!499073 () SeekEntryResult!8863)

(assert (=> b!893636 (= e!499073 (Found!8863 (index!37825 lt!403782)))))

(declare-fun e!499074 () SeekEntryResult!8863)

(declare-fun b!893637 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893637 (= e!499074 (seekKeyOrZeroReturnVacant!0 (bvadd (x!75963 lt!403782) #b00000000000000000000000000000001) (nextIndex!0 (index!37825 lt!403782) (x!75963 lt!403782) (mask!25849 thiss!1181)) (index!37825 lt!403782) key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893638 () Bool)

(declare-fun e!499072 () SeekEntryResult!8863)

(assert (=> b!893638 (= e!499072 Undefined!8863)))

(declare-fun lt!403808 () SeekEntryResult!8863)

(declare-fun d!110351 () Bool)

(assert (=> d!110351 (and (or ((_ is Undefined!8863) lt!403808) (not ((_ is Found!8863) lt!403808)) (and (bvsge (index!37824 lt!403808) #b00000000000000000000000000000000) (bvslt (index!37824 lt!403808) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403808) ((_ is Found!8863) lt!403808) (not ((_ is MissingVacant!8863) lt!403808)) (not (= (index!37826 lt!403808) (index!37825 lt!403782))) (and (bvsge (index!37826 lt!403808) #b00000000000000000000000000000000) (bvslt (index!37826 lt!403808) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403808) (ite ((_ is Found!8863) lt!403808) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403808)) key!785) (and ((_ is MissingVacant!8863) lt!403808) (= (index!37826 lt!403808) (index!37825 lt!403782)) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37826 lt!403808)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!110351 (= lt!403808 e!499072)))

(declare-fun c!94179 () Bool)

(assert (=> d!110351 (= c!94179 (bvsge (x!75963 lt!403782) #b01111111111111111111111111111110))))

(declare-fun lt!403807 () (_ BitVec 64))

(assert (=> d!110351 (= lt!403807 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37825 lt!403782)))))

(assert (=> d!110351 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110351 (= (seekKeyOrZeroReturnVacant!0 (x!75963 lt!403782) (index!37825 lt!403782) (index!37825 lt!403782) key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) lt!403808)))

(declare-fun b!893639 () Bool)

(assert (=> b!893639 (= e!499074 (MissingVacant!8863 (index!37825 lt!403782)))))

(declare-fun b!893640 () Bool)

(assert (=> b!893640 (= e!499072 e!499073)))

(declare-fun c!94180 () Bool)

(assert (=> b!893640 (= c!94180 (= lt!403807 key!785))))

(declare-fun b!893641 () Bool)

(declare-fun c!94178 () Bool)

(assert (=> b!893641 (= c!94178 (= lt!403807 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893641 (= e!499073 e!499074)))

(assert (= (and d!110351 c!94179) b!893638))

(assert (= (and d!110351 (not c!94179)) b!893640))

(assert (= (and b!893640 c!94180) b!893636))

(assert (= (and b!893640 (not c!94180)) b!893641))

(assert (= (and b!893641 c!94178) b!893639))

(assert (= (and b!893641 (not c!94178)) b!893637))

(declare-fun m!831627 () Bool)

(assert (=> b!893637 m!831627))

(assert (=> b!893637 m!831627))

(declare-fun m!831629 () Bool)

(assert (=> b!893637 m!831629))

(declare-fun m!831631 () Bool)

(assert (=> d!110351 m!831631))

(declare-fun m!831633 () Bool)

(assert (=> d!110351 m!831633))

(assert (=> d!110351 m!831585))

(assert (=> d!110351 m!831499))

(assert (=> b!893602 d!110351))

(declare-fun d!110353 () Bool)

(assert (=> d!110353 (= (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659)) (and (not (= (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893604 d!110353))

(declare-fun b!893666 () Bool)

(declare-fun lt!403826 () Unit!30426)

(declare-fun lt!403828 () Unit!30426)

(assert (=> b!893666 (= lt!403826 lt!403828)))

(declare-fun lt!403827 () ListLongMap!10713)

(declare-fun lt!403823 () (_ BitVec 64))

(declare-fun lt!403824 () (_ BitVec 64))

(declare-fun lt!403829 () V!29209)

(assert (=> b!893666 (not (contains!4383 (+!2588 lt!403827 (tuple2!12017 lt!403823 lt!403829)) lt!403824))))

(declare-fun addStillNotContains!212 (ListLongMap!10713 (_ BitVec 64) V!29209 (_ BitVec 64)) Unit!30426)

(assert (=> b!893666 (= lt!403828 (addStillNotContains!212 lt!403827 lt!403823 lt!403829 lt!403824))))

(assert (=> b!893666 (= lt!403824 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!893666 (= lt!403829 (get!13256 (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1297 (defaultEntry!5318 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!893666 (= lt!403823 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun call!39658 () ListLongMap!10713)

(assert (=> b!893666 (= lt!403827 call!39658)))

(declare-fun e!499095 () ListLongMap!10713)

(assert (=> b!893666 (= e!499095 (+!2588 call!39658 (tuple2!12017 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) (get!13256 (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1297 (defaultEntry!5318 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!893667 () Bool)

(declare-fun e!499093 () Bool)

(assert (=> b!893667 (= e!499093 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893667 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!110355 () Bool)

(declare-fun e!499091 () Bool)

(assert (=> d!110355 e!499091))

(declare-fun res!605076 () Bool)

(assert (=> d!110355 (=> (not res!605076) (not e!499091))))

(declare-fun lt!403825 () ListLongMap!10713)

(assert (=> d!110355 (= res!605076 (not (contains!4383 lt!403825 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!499092 () ListLongMap!10713)

(assert (=> d!110355 (= lt!403825 e!499092)))

(declare-fun c!94192 () Bool)

(assert (=> d!110355 (= c!94192 (bvsge #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110355 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110355 (= (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)) lt!403825)))

(declare-fun bm!39655 () Bool)

(assert (=> bm!39655 (= call!39658 (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5318 thiss!1181)))))

(declare-fun b!893668 () Bool)

(assert (=> b!893668 (= e!499095 call!39658)))

(declare-fun b!893669 () Bool)

(declare-fun e!499089 () Bool)

(declare-fun e!499094 () Bool)

(assert (=> b!893669 (= e!499089 e!499094)))

(declare-fun c!94189 () Bool)

(assert (=> b!893669 (= c!94189 (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893670 () Bool)

(assert (=> b!893670 (= e!499094 (= lt!403825 (getCurrentListMapNoExtraKeys!3275 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!5318 thiss!1181))))))

(declare-fun b!893671 () Bool)

(declare-fun res!605078 () Bool)

(assert (=> b!893671 (=> (not res!605078) (not e!499091))))

(assert (=> b!893671 (= res!605078 (not (contains!4383 lt!403825 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893672 () Bool)

(assert (=> b!893672 (= e!499092 e!499095)))

(declare-fun c!94190 () Bool)

(assert (=> b!893672 (= c!94190 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893673 () Bool)

(assert (=> b!893673 (= e!499091 e!499089)))

(declare-fun c!94191 () Bool)

(assert (=> b!893673 (= c!94191 e!499093)))

(declare-fun res!605077 () Bool)

(assert (=> b!893673 (=> (not res!605077) (not e!499093))))

(assert (=> b!893673 (= res!605077 (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893674 () Bool)

(assert (=> b!893674 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> b!893674 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25624 (_values!5305 thiss!1181))))))

(declare-fun e!499090 () Bool)

(assert (=> b!893674 (= e!499090 (= (apply!407 lt!403825 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)) (get!13256 (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1297 (defaultEntry!5318 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!893675 () Bool)

(assert (=> b!893675 (= e!499089 e!499090)))

(assert (=> b!893675 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun res!605075 () Bool)

(assert (=> b!893675 (= res!605075 (contains!4383 lt!403825 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893675 (=> (not res!605075) (not e!499090))))

(declare-fun b!893676 () Bool)

(assert (=> b!893676 (= e!499092 (ListLongMap!10714 Nil!17794))))

(declare-fun b!893677 () Bool)

(declare-fun isEmpty!680 (ListLongMap!10713) Bool)

(assert (=> b!893677 (= e!499094 (isEmpty!680 lt!403825))))

(assert (= (and d!110355 c!94192) b!893676))

(assert (= (and d!110355 (not c!94192)) b!893672))

(assert (= (and b!893672 c!94190) b!893666))

(assert (= (and b!893672 (not c!94190)) b!893668))

(assert (= (or b!893666 b!893668) bm!39655))

(assert (= (and d!110355 res!605076) b!893671))

(assert (= (and b!893671 res!605078) b!893673))

(assert (= (and b!893673 res!605077) b!893667))

(assert (= (and b!893673 c!94191) b!893675))

(assert (= (and b!893673 (not c!94191)) b!893669))

(assert (= (and b!893675 res!605075) b!893674))

(assert (= (and b!893669 c!94189) b!893670))

(assert (= (and b!893669 (not c!94189)) b!893677))

(declare-fun b_lambda!12923 () Bool)

(assert (=> (not b_lambda!12923) (not b!893666)))

(assert (=> b!893666 t!25124))

(declare-fun b_and!26129 () Bool)

(assert (= b_and!26127 (and (=> t!25124 result!10067) b_and!26129)))

(declare-fun b_lambda!12925 () Bool)

(assert (=> (not b_lambda!12925) (not b!893674)))

(assert (=> b!893674 t!25124))

(declare-fun b_and!26131 () Bool)

(assert (= b_and!26129 (and (=> t!25124 result!10067) b_and!26131)))

(declare-fun m!831635 () Bool)

(assert (=> b!893671 m!831635))

(declare-fun m!831637 () Bool)

(assert (=> b!893666 m!831637))

(declare-fun m!831639 () Bool)

(assert (=> b!893666 m!831639))

(assert (=> b!893666 m!831639))

(declare-fun m!831641 () Bool)

(assert (=> b!893666 m!831641))

(declare-fun m!831643 () Bool)

(assert (=> b!893666 m!831643))

(assert (=> b!893666 m!831573))

(assert (=> b!893666 m!831571))

(assert (=> b!893666 m!831573))

(assert (=> b!893666 m!831575))

(assert (=> b!893666 m!831505))

(assert (=> b!893666 m!831571))

(declare-fun m!831645 () Bool)

(assert (=> bm!39655 m!831645))

(assert (=> b!893674 m!831505))

(declare-fun m!831647 () Bool)

(assert (=> b!893674 m!831647))

(assert (=> b!893674 m!831573))

(assert (=> b!893674 m!831571))

(assert (=> b!893674 m!831573))

(assert (=> b!893674 m!831575))

(assert (=> b!893674 m!831505))

(assert (=> b!893674 m!831571))

(assert (=> b!893667 m!831505))

(assert (=> b!893667 m!831505))

(assert (=> b!893667 m!831507))

(assert (=> b!893670 m!831645))

(assert (=> b!893672 m!831505))

(assert (=> b!893672 m!831505))

(assert (=> b!893672 m!831507))

(declare-fun m!831649 () Bool)

(assert (=> b!893677 m!831649))

(declare-fun m!831651 () Bool)

(assert (=> d!110355 m!831651))

(assert (=> d!110355 m!831499))

(assert (=> b!893675 m!831505))

(assert (=> b!893675 m!831505))

(declare-fun m!831653 () Bool)

(assert (=> b!893675 m!831653))

(assert (=> bm!39645 d!110355))

(declare-fun d!110357 () Bool)

(assert (=> d!110357 (= (validMask!0 (mask!25849 thiss!1181)) (and (or (= (mask!25849 thiss!1181) #b00000000000000000000000000000111) (= (mask!25849 thiss!1181) #b00000000000000000000000000001111) (= (mask!25849 thiss!1181) #b00000000000000000000000000011111) (= (mask!25849 thiss!1181) #b00000000000000000000000000111111) (= (mask!25849 thiss!1181) #b00000000000000000000000001111111) (= (mask!25849 thiss!1181) #b00000000000000000000000011111111) (= (mask!25849 thiss!1181) #b00000000000000000000000111111111) (= (mask!25849 thiss!1181) #b00000000000000000000001111111111) (= (mask!25849 thiss!1181) #b00000000000000000000011111111111) (= (mask!25849 thiss!1181) #b00000000000000000000111111111111) (= (mask!25849 thiss!1181) #b00000000000000000001111111111111) (= (mask!25849 thiss!1181) #b00000000000000000011111111111111) (= (mask!25849 thiss!1181) #b00000000000000000111111111111111) (= (mask!25849 thiss!1181) #b00000000000000001111111111111111) (= (mask!25849 thiss!1181) #b00000000000000011111111111111111) (= (mask!25849 thiss!1181) #b00000000000000111111111111111111) (= (mask!25849 thiss!1181) #b00000000000001111111111111111111) (= (mask!25849 thiss!1181) #b00000000000011111111111111111111) (= (mask!25849 thiss!1181) #b00000000000111111111111111111111) (= (mask!25849 thiss!1181) #b00000000001111111111111111111111) (= (mask!25849 thiss!1181) #b00000000011111111111111111111111) (= (mask!25849 thiss!1181) #b00000000111111111111111111111111) (= (mask!25849 thiss!1181) #b00000001111111111111111111111111) (= (mask!25849 thiss!1181) #b00000011111111111111111111111111) (= (mask!25849 thiss!1181) #b00000111111111111111111111111111) (= (mask!25849 thiss!1181) #b00001111111111111111111111111111) (= (mask!25849 thiss!1181) #b00011111111111111111111111111111) (= (mask!25849 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25849 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> d!110331 d!110357))

(assert (=> d!110345 d!110341))

(declare-fun d!110359 () Bool)

(assert (=> d!110359 (arrayForallSeekEntryOrOpenFound!0 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181))))

(assert (=> d!110359 true))

(declare-fun _$72!119 () Unit!30426)

(assert (=> d!110359 (= (choose!38 (_keys!10005 thiss!1181) (mask!25849 thiss!1181) #b00000000000000000000000000000000 lt!403659) _$72!119)))

(declare-fun bs!25077 () Bool)

(assert (= bs!25077 d!110359))

(assert (=> bs!25077 m!831471))

(assert (=> d!110345 d!110359))

(assert (=> d!110345 d!110357))

(declare-fun d!110361 () Bool)

(declare-fun e!499096 () Bool)

(assert (=> d!110361 e!499096))

(declare-fun res!605079 () Bool)

(assert (=> d!110361 (=> res!605079 e!499096)))

(declare-fun lt!403833 () Bool)

(assert (=> d!110361 (= res!605079 (not lt!403833))))

(declare-fun lt!403830 () Bool)

(assert (=> d!110361 (= lt!403833 lt!403830)))

(declare-fun lt!403831 () Unit!30426)

(declare-fun e!499097 () Unit!30426)

(assert (=> d!110361 (= lt!403831 e!499097)))

(declare-fun c!94193 () Bool)

(assert (=> d!110361 (= c!94193 lt!403830)))

(assert (=> d!110361 (= lt!403830 (containsKey!422 (toList!5372 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181))) (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664))))))

(assert (=> d!110361 (= (contains!4383 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)) (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664))) lt!403833)))

(declare-fun b!893678 () Bool)

(declare-fun lt!403832 () Unit!30426)

(assert (=> b!893678 (= e!499097 lt!403832)))

(assert (=> b!893678 (= lt!403832 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181))) (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664))))))

(assert (=> b!893678 (isDefined!327 (getValueByKey!448 (toList!5372 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181))) (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664))))))

(declare-fun b!893679 () Bool)

(declare-fun Unit!30433 () Unit!30426)

(assert (=> b!893679 (= e!499097 Unit!30433)))

(declare-fun b!893680 () Bool)

(assert (=> b!893680 (= e!499096 (isDefined!327 (getValueByKey!448 (toList!5372 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181))) (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)))))))

(assert (= (and d!110361 c!94193) b!893678))

(assert (= (and d!110361 (not c!94193)) b!893679))

(assert (= (and d!110361 (not res!605079)) b!893680))

(assert (=> d!110361 m!831487))

(declare-fun m!831655 () Bool)

(assert (=> d!110361 m!831655))

(assert (=> b!893678 m!831487))

(declare-fun m!831657 () Bool)

(assert (=> b!893678 m!831657))

(assert (=> b!893678 m!831487))

(declare-fun m!831659 () Bool)

(assert (=> b!893678 m!831659))

(assert (=> b!893678 m!831659))

(declare-fun m!831661 () Bool)

(assert (=> b!893678 m!831661))

(assert (=> b!893680 m!831487))

(assert (=> b!893680 m!831659))

(assert (=> b!893680 m!831659))

(assert (=> b!893680 m!831661))

(assert (=> b!893455 d!110361))

(assert (=> b!893455 d!110331))

(declare-fun d!110363 () Bool)

(assert (=> d!110363 (contains!4383 (getCurrentListMap!2650 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5318 thiss!1181)) (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)))))

(assert (=> d!110363 true))

(declare-fun _$16!172 () Unit!30426)

(assert (=> d!110363 (= (choose!1464 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) (index!37824 lt!403664) (defaultEntry!5318 thiss!1181)) _$16!172)))

(declare-fun bs!25078 () Bool)

(assert (= bs!25078 d!110363))

(assert (=> bs!25078 m!831457))

(assert (=> bs!25078 m!831487))

(assert (=> bs!25078 m!831457))

(assert (=> bs!25078 m!831487))

(assert (=> bs!25078 m!831501))

(assert (=> d!110321 d!110363))

(assert (=> d!110321 d!110357))

(declare-fun bm!39656 () Bool)

(declare-fun call!39659 () Bool)

(assert (=> bm!39656 (= call!39659 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403659 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893681 () Bool)

(declare-fun e!499100 () Bool)

(assert (=> b!893681 (= e!499100 call!39659)))

(declare-fun b!893682 () Bool)

(declare-fun e!499099 () Bool)

(declare-fun e!499098 () Bool)

(assert (=> b!893682 (= e!499099 e!499098)))

(declare-fun c!94194 () Bool)

(assert (=> b!893682 (= c!94194 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd lt!403659 #b00000000000000000000000000000001))))))

(declare-fun d!110365 () Bool)

(declare-fun res!605081 () Bool)

(assert (=> d!110365 (=> res!605081 e!499099)))

(assert (=> d!110365 (= res!605081 (bvsge (bvadd lt!403659 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110365 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!403659 #b00000000000000000000000000000001) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) e!499099)))

(declare-fun b!893683 () Bool)

(assert (=> b!893683 (= e!499098 call!39659)))

(declare-fun b!893684 () Bool)

(assert (=> b!893684 (= e!499098 e!499100)))

(declare-fun lt!403834 () (_ BitVec 64))

(assert (=> b!893684 (= lt!403834 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd lt!403659 #b00000000000000000000000000000001)))))

(declare-fun lt!403836 () Unit!30426)

(assert (=> b!893684 (= lt!403836 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) lt!403834 (bvadd lt!403659 #b00000000000000000000000000000001)))))

(assert (=> b!893684 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403834 #b00000000000000000000000000000000)))

(declare-fun lt!403835 () Unit!30426)

(assert (=> b!893684 (= lt!403835 lt!403836)))

(declare-fun res!605080 () Bool)

(assert (=> b!893684 (= res!605080 (= (seekEntryOrOpen!0 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd lt!403659 #b00000000000000000000000000000001)) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) (Found!8863 (bvadd lt!403659 #b00000000000000000000000000000001))))))

(assert (=> b!893684 (=> (not res!605080) (not e!499100))))

(assert (= (and d!110365 (not res!605081)) b!893682))

(assert (= (and b!893682 c!94194) b!893684))

(assert (= (and b!893682 (not c!94194)) b!893683))

(assert (= (and b!893684 res!605080) b!893681))

(assert (= (or b!893681 b!893683) bm!39656))

(declare-fun m!831663 () Bool)

(assert (=> bm!39656 m!831663))

(declare-fun m!831665 () Bool)

(assert (=> b!893682 m!831665))

(assert (=> b!893682 m!831665))

(declare-fun m!831667 () Bool)

(assert (=> b!893682 m!831667))

(assert (=> b!893684 m!831665))

(declare-fun m!831669 () Bool)

(assert (=> b!893684 m!831669))

(declare-fun m!831671 () Bool)

(assert (=> b!893684 m!831671))

(assert (=> b!893684 m!831665))

(declare-fun m!831673 () Bool)

(assert (=> b!893684 m!831673))

(assert (=> bm!39652 d!110365))

(declare-fun d!110367 () Bool)

(assert (=> d!110367 (= (apply!407 lt!403761 #b0000000000000000000000000000000000000000000000000000000000000000) (get!13254 (getValueByKey!448 (toList!5372 lt!403761) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25079 () Bool)

(assert (= bs!25079 d!110367))

(declare-fun m!831675 () Bool)

(assert (=> bs!25079 m!831675))

(assert (=> bs!25079 m!831675))

(declare-fun m!831677 () Bool)

(assert (=> bs!25079 m!831677))

(assert (=> b!893557 d!110367))

(declare-fun d!110369 () Bool)

(declare-fun res!605086 () Bool)

(declare-fun e!499105 () Bool)

(assert (=> d!110369 (=> res!605086 e!499105)))

(assert (=> d!110369 (= res!605086 (and ((_ is Cons!17793) (toList!5372 call!39624)) (= (_1!6019 (h!18924 (toList!5372 call!39624))) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785))))))

(assert (=> d!110369 (= (containsKey!422 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)) e!499105)))

(declare-fun b!893689 () Bool)

(declare-fun e!499106 () Bool)

(assert (=> b!893689 (= e!499105 e!499106)))

(declare-fun res!605087 () Bool)

(assert (=> b!893689 (=> (not res!605087) (not e!499106))))

(assert (=> b!893689 (= res!605087 (and (or (not ((_ is Cons!17793) (toList!5372 call!39624))) (bvsle (_1!6019 (h!18924 (toList!5372 call!39624))) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785))) ((_ is Cons!17793) (toList!5372 call!39624)) (bvslt (_1!6019 (h!18924 (toList!5372 call!39624))) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785))))))

(declare-fun b!893690 () Bool)

(assert (=> b!893690 (= e!499106 (containsKey!422 (t!25118 (toList!5372 call!39624)) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(assert (= (and d!110369 (not res!605086)) b!893689))

(assert (= (and b!893689 res!605087) b!893690))

(declare-fun m!831679 () Bool)

(assert (=> b!893690 m!831679))

(assert (=> d!110349 d!110369))

(declare-fun d!110371 () Bool)

(assert (=> d!110371 (= (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)) (and (not (= (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!893577 d!110371))

(declare-fun d!110373 () Bool)

(declare-fun isEmpty!681 (Option!454) Bool)

(assert (=> d!110373 (= (isDefined!327 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785)) (not (isEmpty!681 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785))))))

(declare-fun bs!25080 () Bool)

(assert (= bs!25080 d!110373))

(assert (=> bs!25080 m!831423))

(declare-fun m!831681 () Bool)

(assert (=> bs!25080 m!831681))

(assert (=> b!893488 d!110373))

(assert (=> b!893488 d!110305))

(declare-fun d!110375 () Bool)

(declare-fun lt!403839 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!400 (List!17799) (InoxSet (_ BitVec 64)))

(assert (=> d!110375 (= lt!403839 (select (content!400 Nil!17796) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499112 () Bool)

(assert (=> d!110375 (= lt!403839 e!499112)))

(declare-fun res!605092 () Bool)

(assert (=> d!110375 (=> (not res!605092) (not e!499112))))

(assert (=> d!110375 (= res!605092 ((_ is Cons!17795) Nil!17796))))

(assert (=> d!110375 (= (contains!4384 Nil!17796 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)) lt!403839)))

(declare-fun b!893695 () Bool)

(declare-fun e!499111 () Bool)

(assert (=> b!893695 (= e!499112 e!499111)))

(declare-fun res!605093 () Bool)

(assert (=> b!893695 (=> res!605093 e!499111)))

(assert (=> b!893695 (= res!605093 (= (h!18926 Nil!17796) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893696 () Bool)

(assert (=> b!893696 (= e!499111 (contains!4384 (t!25122 Nil!17796) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110375 res!605092) b!893695))

(assert (= (and b!893695 (not res!605093)) b!893696))

(declare-fun m!831683 () Bool)

(assert (=> d!110375 m!831683))

(assert (=> d!110375 m!831505))

(declare-fun m!831685 () Bool)

(assert (=> d!110375 m!831685))

(assert (=> b!893696 m!831505))

(declare-fun m!831687 () Bool)

(assert (=> b!893696 m!831687))

(assert (=> b!893576 d!110375))

(assert (=> b!893554 d!110371))

(declare-fun d!110377 () Bool)

(declare-fun e!499113 () Bool)

(assert (=> d!110377 e!499113))

(declare-fun res!605094 () Bool)

(assert (=> d!110377 (=> res!605094 e!499113)))

(declare-fun lt!403843 () Bool)

(assert (=> d!110377 (= res!605094 (not lt!403843))))

(declare-fun lt!403840 () Bool)

(assert (=> d!110377 (= lt!403843 lt!403840)))

(declare-fun lt!403841 () Unit!30426)

(declare-fun e!499114 () Unit!30426)

(assert (=> d!110377 (= lt!403841 e!499114)))

(declare-fun c!94195 () Bool)

(assert (=> d!110377 (= c!94195 lt!403840)))

(assert (=> d!110377 (= lt!403840 (containsKey!422 (toList!5372 lt!403761) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110377 (= (contains!4383 lt!403761 #b1000000000000000000000000000000000000000000000000000000000000000) lt!403843)))

(declare-fun b!893697 () Bool)

(declare-fun lt!403842 () Unit!30426)

(assert (=> b!893697 (= e!499114 lt!403842)))

(assert (=> b!893697 (= lt!403842 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 lt!403761) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893697 (isDefined!327 (getValueByKey!448 (toList!5372 lt!403761) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893698 () Bool)

(declare-fun Unit!30434 () Unit!30426)

(assert (=> b!893698 (= e!499114 Unit!30434)))

(declare-fun b!893699 () Bool)

(assert (=> b!893699 (= e!499113 (isDefined!327 (getValueByKey!448 (toList!5372 lt!403761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110377 c!94195) b!893697))

(assert (= (and d!110377 (not c!94195)) b!893698))

(assert (= (and d!110377 (not res!605094)) b!893699))

(declare-fun m!831689 () Bool)

(assert (=> d!110377 m!831689))

(declare-fun m!831691 () Bool)

(assert (=> b!893697 m!831691))

(declare-fun m!831693 () Bool)

(assert (=> b!893697 m!831693))

(assert (=> b!893697 m!831693))

(declare-fun m!831695 () Bool)

(assert (=> b!893697 m!831695))

(assert (=> b!893699 m!831693))

(assert (=> b!893699 m!831693))

(assert (=> b!893699 m!831695))

(assert (=> bm!39643 d!110377))

(declare-fun d!110379 () Bool)

(assert (=> d!110379 (isDefined!327 (getValueByKey!448 (toList!5372 (map!12215 thiss!1181)) key!785))))

(declare-fun lt!403846 () Unit!30426)

(declare-fun choose!1466 (List!17797 (_ BitVec 64)) Unit!30426)

(assert (=> d!110379 (= lt!403846 (choose!1466 (toList!5372 (map!12215 thiss!1181)) key!785))))

(declare-fun e!499117 () Bool)

(assert (=> d!110379 e!499117))

(declare-fun res!605097 () Bool)

(assert (=> d!110379 (=> (not res!605097) (not e!499117))))

(declare-fun isStrictlySorted!495 (List!17797) Bool)

(assert (=> d!110379 (= res!605097 (isStrictlySorted!495 (toList!5372 (map!12215 thiss!1181))))))

(assert (=> d!110379 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 (map!12215 thiss!1181)) key!785) lt!403846)))

(declare-fun b!893702 () Bool)

(assert (=> b!893702 (= e!499117 (containsKey!422 (toList!5372 (map!12215 thiss!1181)) key!785))))

(assert (= (and d!110379 res!605097) b!893702))

(assert (=> d!110379 m!831423))

(assert (=> d!110379 m!831423))

(assert (=> d!110379 m!831515))

(declare-fun m!831697 () Bool)

(assert (=> d!110379 m!831697))

(declare-fun m!831699 () Bool)

(assert (=> d!110379 m!831699))

(assert (=> b!893702 m!831511))

(assert (=> b!893486 d!110379))

(assert (=> b!893486 d!110373))

(assert (=> b!893486 d!110305))

(declare-fun d!110381 () Bool)

(declare-fun res!605098 () Bool)

(declare-fun e!499118 () Bool)

(assert (=> d!110381 (=> res!605098 e!499118)))

(assert (=> d!110381 (= res!605098 (= (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110381 (= (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!499118)))

(declare-fun b!893703 () Bool)

(declare-fun e!499119 () Bool)

(assert (=> b!893703 (= e!499118 e!499119)))

(declare-fun res!605099 () Bool)

(assert (=> b!893703 (=> (not res!605099) (not e!499119))))

(assert (=> b!893703 (= res!605099 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893704 () Bool)

(assert (=> b!893704 (= e!499119 (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110381 (not res!605098)) b!893703))

(assert (= (and b!893703 res!605099) b!893704))

(declare-fun m!831701 () Bool)

(assert (=> d!110381 m!831701))

(declare-fun m!831703 () Bool)

(assert (=> b!893704 m!831703))

(assert (=> b!893618 d!110381))

(declare-fun d!110383 () Bool)

(declare-fun lt!403847 () (_ BitVec 32))

(assert (=> d!110383 (and (or (bvslt lt!403847 #b00000000000000000000000000000000) (bvsge lt!403847 (size!25623 (_keys!10005 thiss!1181))) (and (bvsge lt!403847 #b00000000000000000000000000000000) (bvslt lt!403847 (size!25623 (_keys!10005 thiss!1181))))) (bvsge lt!403847 #b00000000000000000000000000000000) (bvslt lt!403847 (size!25623 (_keys!10005 thiss!1181))) (= (select (arr!25179 (_keys!10005 thiss!1181)) lt!403847) key!785))))

(declare-fun e!499120 () (_ BitVec 32))

(assert (=> d!110383 (= lt!403847 e!499120)))

(declare-fun c!94196 () Bool)

(assert (=> d!110383 (= c!94196 (= (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) key!785))))

(assert (=> d!110383 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))) (bvslt (size!25623 (_keys!10005 thiss!1181)) #b01111111111111111111111111111111))))

(assert (=> d!110383 (= (arrayScanForKey!0 (_keys!10005 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!403847)))

(declare-fun b!893705 () Bool)

(assert (=> b!893705 (= e!499120 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!893706 () Bool)

(assert (=> b!893706 (= e!499120 (arrayScanForKey!0 (_keys!10005 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!110383 c!94196) b!893705))

(assert (= (and d!110383 (not c!94196)) b!893706))

(declare-fun m!831705 () Bool)

(assert (=> d!110383 m!831705))

(assert (=> d!110383 m!831701))

(declare-fun m!831707 () Bool)

(assert (=> b!893706 m!831707))

(assert (=> b!893612 d!110383))

(declare-fun d!110385 () Bool)

(assert (=> d!110385 (= (size!25627 thiss!1181) (bvadd (_size!2173 thiss!1181) (bvsdiv (bvadd (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!893466 d!110385))

(assert (=> b!893574 d!110371))

(declare-fun d!110387 () Bool)

(assert (=> d!110387 (= (apply!407 lt!403761 #b1000000000000000000000000000000000000000000000000000000000000000) (get!13254 (getValueByKey!448 (toList!5372 lt!403761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!25081 () Bool)

(assert (= bs!25081 d!110387))

(assert (=> bs!25081 m!831693))

(assert (=> bs!25081 m!831693))

(declare-fun m!831709 () Bool)

(assert (=> bs!25081 m!831709))

(assert (=> b!893553 d!110387))

(assert (=> b!893465 d!110385))

(declare-fun bm!39657 () Bool)

(declare-fun call!39660 () Bool)

(declare-fun c!94197 () Bool)

(assert (=> bm!39657 (= call!39660 (arrayNoDuplicates!0 (_keys!10005 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!94197 (Cons!17795 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!94154 (Cons!17795 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) Nil!17796) Nil!17796)) (ite c!94154 (Cons!17795 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) Nil!17796) Nil!17796))))))

(declare-fun b!893707 () Bool)

(declare-fun e!499123 () Bool)

(declare-fun e!499122 () Bool)

(assert (=> b!893707 (= e!499123 e!499122)))

(assert (=> b!893707 (= c!94197 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!893708 () Bool)

(assert (=> b!893708 (= e!499122 call!39660)))

(declare-fun d!110389 () Bool)

(declare-fun res!605101 () Bool)

(declare-fun e!499121 () Bool)

(assert (=> d!110389 (=> res!605101 e!499121)))

(assert (=> d!110389 (= res!605101 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110389 (= (arrayNoDuplicates!0 (_keys!10005 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94154 (Cons!17795 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) Nil!17796) Nil!17796)) e!499121)))

(declare-fun b!893709 () Bool)

(declare-fun e!499124 () Bool)

(assert (=> b!893709 (= e!499124 (contains!4384 (ite c!94154 (Cons!17795 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) Nil!17796) Nil!17796) (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!893710 () Bool)

(assert (=> b!893710 (= e!499121 e!499123)))

(declare-fun res!605100 () Bool)

(assert (=> b!893710 (=> (not res!605100) (not e!499123))))

(assert (=> b!893710 (= res!605100 (not e!499124))))

(declare-fun res!605102 () Bool)

(assert (=> b!893710 (=> (not res!605102) (not e!499124))))

(assert (=> b!893710 (= res!605102 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!893711 () Bool)

(assert (=> b!893711 (= e!499122 call!39660)))

(assert (= (and d!110389 (not res!605101)) b!893710))

(assert (= (and b!893710 res!605102) b!893709))

(assert (= (and b!893710 res!605100) b!893707))

(assert (= (and b!893707 c!94197) b!893711))

(assert (= (and b!893707 (not c!94197)) b!893708))

(assert (= (or b!893711 b!893708) bm!39657))

(assert (=> bm!39657 m!831701))

(declare-fun m!831711 () Bool)

(assert (=> bm!39657 m!831711))

(assert (=> b!893707 m!831701))

(assert (=> b!893707 m!831701))

(declare-fun m!831713 () Bool)

(assert (=> b!893707 m!831713))

(assert (=> b!893709 m!831701))

(assert (=> b!893709 m!831701))

(declare-fun m!831715 () Bool)

(assert (=> b!893709 m!831715))

(assert (=> b!893710 m!831701))

(assert (=> b!893710 m!831701))

(assert (=> b!893710 m!831713))

(assert (=> bm!39651 d!110389))

(declare-fun b!893712 () Bool)

(declare-fun e!499126 () (_ BitVec 32))

(declare-fun e!499125 () (_ BitVec 32))

(assert (=> b!893712 (= e!499126 e!499125)))

(declare-fun c!94199 () Bool)

(assert (=> b!893712 (= c!94199 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!893713 () Bool)

(declare-fun call!39661 () (_ BitVec 32))

(assert (=> b!893713 (= e!499125 (bvadd #b00000000000000000000000000000001 call!39661))))

(declare-fun d!110391 () Bool)

(declare-fun lt!403848 () (_ BitVec 32))

(assert (=> d!110391 (and (bvsge lt!403848 #b00000000000000000000000000000000) (bvsle lt!403848 (bvsub (size!25623 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!110391 (= lt!403848 e!499126)))

(declare-fun c!94198 () Bool)

(assert (=> d!110391 (= c!94198 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110391 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!25623 (_keys!10005 thiss!1181)) (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110391 (= (arrayCountValidKeys!0 (_keys!10005 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))) lt!403848)))

(declare-fun bm!39658 () Bool)

(assert (=> bm!39658 (= call!39661 (arrayCountValidKeys!0 (_keys!10005 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893714 () Bool)

(assert (=> b!893714 (= e!499126 #b00000000000000000000000000000000)))

(declare-fun b!893715 () Bool)

(assert (=> b!893715 (= e!499125 call!39661)))

(assert (= (and d!110391 c!94198) b!893714))

(assert (= (and d!110391 (not c!94198)) b!893712))

(assert (= (and b!893712 c!94199) b!893713))

(assert (= (and b!893712 (not c!94199)) b!893715))

(assert (= (or b!893713 b!893715) bm!39658))

(assert (=> b!893712 m!831701))

(assert (=> b!893712 m!831701))

(assert (=> b!893712 m!831713))

(declare-fun m!831717 () Bool)

(assert (=> bm!39658 m!831717))

(assert (=> bm!39624 d!110391))

(assert (=> d!110339 d!110337))

(declare-fun d!110393 () Bool)

(declare-fun lt!403851 () SeekEntryResult!8863)

(assert (=> d!110393 (and ((_ is Found!8863) lt!403851) (= (index!37824 lt!403851) lt!403659))))

(assert (=> d!110393 (= lt!403851 (seekEntry!0 key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(assert (=> d!110393 true))

(declare-fun _$57!19 () Unit!30426)

(assert (=> d!110393 (= (choose!0 key!785 lt!403659 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) _$57!19)))

(declare-fun bs!25082 () Bool)

(assert (= bs!25082 d!110393))

(assert (=> bs!25082 m!831469))

(assert (=> d!110339 d!110393))

(assert (=> d!110339 d!110357))

(declare-fun d!110395 () Bool)

(declare-fun e!499129 () Bool)

(assert (=> d!110395 e!499129))

(declare-fun res!605107 () Bool)

(assert (=> d!110395 (=> (not res!605107) (not e!499129))))

(declare-fun lt!403863 () ListLongMap!10713)

(assert (=> d!110395 (= res!605107 (contains!4383 lt!403863 (_1!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))))))

(declare-fun lt!403862 () List!17797)

(assert (=> d!110395 (= lt!403863 (ListLongMap!10714 lt!403862))))

(declare-fun lt!403861 () Unit!30426)

(declare-fun lt!403860 () Unit!30426)

(assert (=> d!110395 (= lt!403861 lt!403860)))

(assert (=> d!110395 (= (getValueByKey!448 lt!403862 (_1!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!246 (List!17797 (_ BitVec 64) V!29209) Unit!30426)

(assert (=> d!110395 (= lt!403860 (lemmaContainsTupThenGetReturnValue!246 lt!403862 (_1!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))))))

(declare-fun insertStrictlySorted!303 (List!17797 (_ BitVec 64) V!29209) List!17797)

(assert (=> d!110395 (= lt!403862 (insertStrictlySorted!303 (toList!5372 call!39649) (_1!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))))))

(assert (=> d!110395 (= (+!2588 call!39649 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))) lt!403863)))

(declare-fun b!893720 () Bool)

(declare-fun res!605108 () Bool)

(assert (=> b!893720 (=> (not res!605108) (not e!499129))))

(assert (=> b!893720 (= res!605108 (= (getValueByKey!448 (toList!5372 lt!403863) (_1!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))))))

(declare-fun b!893721 () Bool)

(declare-fun contains!4385 (List!17797 tuple2!12016) Bool)

(assert (=> b!893721 (= e!499129 (contains!4385 (toList!5372 lt!403863) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))))

(assert (= (and d!110395 res!605107) b!893720))

(assert (= (and b!893720 res!605108) b!893721))

(declare-fun m!831719 () Bool)

(assert (=> d!110395 m!831719))

(declare-fun m!831721 () Bool)

(assert (=> d!110395 m!831721))

(declare-fun m!831723 () Bool)

(assert (=> d!110395 m!831723))

(declare-fun m!831725 () Bool)

(assert (=> d!110395 m!831725))

(declare-fun m!831727 () Bool)

(assert (=> b!893720 m!831727))

(declare-fun m!831729 () Bool)

(assert (=> b!893721 m!831729))

(assert (=> b!893551 d!110395))

(declare-fun d!110397 () Bool)

(declare-fun e!499130 () Bool)

(assert (=> d!110397 e!499130))

(declare-fun res!605109 () Bool)

(assert (=> d!110397 (=> res!605109 e!499130)))

(declare-fun lt!403867 () Bool)

(assert (=> d!110397 (= res!605109 (not lt!403867))))

(declare-fun lt!403864 () Bool)

(assert (=> d!110397 (= lt!403867 lt!403864)))

(declare-fun lt!403865 () Unit!30426)

(declare-fun e!499131 () Unit!30426)

(assert (=> d!110397 (= lt!403865 e!499131)))

(declare-fun c!94200 () Bool)

(assert (=> d!110397 (= c!94200 lt!403864)))

(assert (=> d!110397 (= lt!403864 (containsKey!422 (toList!5372 lt!403761) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110397 (= (contains!4383 lt!403761 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)) lt!403867)))

(declare-fun b!893722 () Bool)

(declare-fun lt!403866 () Unit!30426)

(assert (=> b!893722 (= e!499131 lt!403866)))

(assert (=> b!893722 (= lt!403866 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 lt!403761) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!893722 (isDefined!327 (getValueByKey!448 (toList!5372 lt!403761) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893723 () Bool)

(declare-fun Unit!30435 () Unit!30426)

(assert (=> b!893723 (= e!499131 Unit!30435)))

(declare-fun b!893724 () Bool)

(assert (=> b!893724 (= e!499130 (isDefined!327 (getValueByKey!448 (toList!5372 lt!403761) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))))

(assert (= (and d!110397 c!94200) b!893722))

(assert (= (and d!110397 (not c!94200)) b!893723))

(assert (= (and d!110397 (not res!605109)) b!893724))

(assert (=> d!110397 m!831505))

(declare-fun m!831731 () Bool)

(assert (=> d!110397 m!831731))

(assert (=> b!893722 m!831505))

(declare-fun m!831733 () Bool)

(assert (=> b!893722 m!831733))

(assert (=> b!893722 m!831505))

(declare-fun m!831735 () Bool)

(assert (=> b!893722 m!831735))

(assert (=> b!893722 m!831735))

(declare-fun m!831737 () Bool)

(assert (=> b!893722 m!831737))

(assert (=> b!893724 m!831505))

(assert (=> b!893724 m!831735))

(assert (=> b!893724 m!831735))

(assert (=> b!893724 m!831737))

(assert (=> b!893550 d!110397))

(declare-fun d!110399 () Bool)

(assert (=> d!110399 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403700 #b00000000000000000000000000000000)))

(declare-fun lt!403868 () Unit!30426)

(assert (=> d!110399 (= lt!403868 (choose!13 (_keys!10005 thiss!1181) lt!403700 #b00000000000000000000000000000000))))

(assert (=> d!110399 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!110399 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) lt!403700 #b00000000000000000000000000000000) lt!403868)))

(declare-fun bs!25083 () Bool)

(assert (= bs!25083 d!110399))

(assert (=> bs!25083 m!831521))

(declare-fun m!831739 () Bool)

(assert (=> bs!25083 m!831739))

(assert (=> b!893500 d!110399))

(declare-fun d!110401 () Bool)

(declare-fun res!605110 () Bool)

(declare-fun e!499132 () Bool)

(assert (=> d!110401 (=> res!605110 e!499132)))

(assert (=> d!110401 (= res!605110 (= (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) lt!403700))))

(assert (=> d!110401 (= (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403700 #b00000000000000000000000000000000) e!499132)))

(declare-fun b!893725 () Bool)

(declare-fun e!499133 () Bool)

(assert (=> b!893725 (= e!499132 e!499133)))

(declare-fun res!605111 () Bool)

(assert (=> b!893725 (=> (not res!605111) (not e!499133))))

(assert (=> b!893725 (= res!605111 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893726 () Bool)

(assert (=> b!893726 (= e!499133 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403700 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110401 (not res!605110)) b!893725))

(assert (= (and b!893725 res!605111) b!893726))

(assert (=> d!110401 m!831505))

(declare-fun m!831741 () Bool)

(assert (=> b!893726 m!831741))

(assert (=> b!893500 d!110401))

(declare-fun b!893739 () Bool)

(declare-fun e!499141 () SeekEntryResult!8863)

(assert (=> b!893739 (= e!499141 Undefined!8863)))

(declare-fun d!110403 () Bool)

(declare-fun lt!403876 () SeekEntryResult!8863)

(assert (=> d!110403 (and (or ((_ is Undefined!8863) lt!403876) (not ((_ is Found!8863) lt!403876)) (and (bvsge (index!37824 lt!403876) #b00000000000000000000000000000000) (bvslt (index!37824 lt!403876) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403876) ((_ is Found!8863) lt!403876) (not ((_ is MissingZero!8863) lt!403876)) (and (bvsge (index!37823 lt!403876) #b00000000000000000000000000000000) (bvslt (index!37823 lt!403876) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403876) ((_ is Found!8863) lt!403876) ((_ is MissingZero!8863) lt!403876) (not ((_ is MissingVacant!8863) lt!403876)) (and (bvsge (index!37826 lt!403876) #b00000000000000000000000000000000) (bvslt (index!37826 lt!403876) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403876) (ite ((_ is Found!8863) lt!403876) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403876)) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8863) lt!403876) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37823 lt!403876)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8863) lt!403876) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37826 lt!403876)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110403 (= lt!403876 e!499141)))

(declare-fun c!94208 () Bool)

(declare-fun lt!403875 () SeekEntryResult!8863)

(assert (=> d!110403 (= c!94208 (and ((_ is Intermediate!8863) lt!403875) (undefined!9675 lt!403875)))))

(assert (=> d!110403 (= lt!403875 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) (mask!25849 thiss!1181)) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(assert (=> d!110403 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110403 (= (seekEntryOrOpen!0 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) lt!403876)))

(declare-fun b!893740 () Bool)

(declare-fun e!499142 () SeekEntryResult!8863)

(assert (=> b!893740 (= e!499142 (MissingZero!8863 (index!37825 lt!403875)))))

(declare-fun b!893741 () Bool)

(assert (=> b!893741 (= e!499142 (seekKeyOrZeroReturnVacant!0 (x!75963 lt!403875) (index!37825 lt!403875) (index!37825 lt!403875) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893742 () Bool)

(declare-fun e!499140 () SeekEntryResult!8863)

(assert (=> b!893742 (= e!499140 (Found!8863 (index!37825 lt!403875)))))

(declare-fun b!893743 () Bool)

(assert (=> b!893743 (= e!499141 e!499140)))

(declare-fun lt!403877 () (_ BitVec 64))

(assert (=> b!893743 (= lt!403877 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37825 lt!403875)))))

(declare-fun c!94209 () Bool)

(assert (=> b!893743 (= c!94209 (= lt!403877 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!893744 () Bool)

(declare-fun c!94207 () Bool)

(assert (=> b!893744 (= c!94207 (= lt!403877 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893744 (= e!499140 e!499142)))

(assert (= (and d!110403 c!94208) b!893739))

(assert (= (and d!110403 (not c!94208)) b!893743))

(assert (= (and b!893743 c!94209) b!893742))

(assert (= (and b!893743 (not c!94209)) b!893744))

(assert (= (and b!893744 c!94207) b!893740))

(assert (= (and b!893744 (not c!94207)) b!893741))

(assert (=> d!110403 m!831505))

(declare-fun m!831743 () Bool)

(assert (=> d!110403 m!831743))

(declare-fun m!831745 () Bool)

(assert (=> d!110403 m!831745))

(assert (=> d!110403 m!831499))

(declare-fun m!831747 () Bool)

(assert (=> d!110403 m!831747))

(declare-fun m!831749 () Bool)

(assert (=> d!110403 m!831749))

(assert (=> d!110403 m!831743))

(assert (=> d!110403 m!831505))

(declare-fun m!831751 () Bool)

(assert (=> d!110403 m!831751))

(assert (=> b!893741 m!831505))

(declare-fun m!831753 () Bool)

(assert (=> b!893741 m!831753))

(declare-fun m!831755 () Bool)

(assert (=> b!893743 m!831755))

(assert (=> b!893500 d!110403))

(assert (=> b!893476 d!110371))

(declare-fun b!893763 () Bool)

(declare-fun e!499153 () SeekEntryResult!8863)

(declare-fun e!499154 () SeekEntryResult!8863)

(assert (=> b!893763 (= e!499153 e!499154)))

(declare-fun c!94218 () Bool)

(declare-fun lt!403882 () (_ BitVec 64))

(assert (=> b!893763 (= c!94218 (or (= lt!403882 key!785) (= (bvadd lt!403882 lt!403882) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893764 () Bool)

(declare-fun lt!403883 () SeekEntryResult!8863)

(assert (=> b!893764 (and (bvsge (index!37825 lt!403883) #b00000000000000000000000000000000) (bvslt (index!37825 lt!403883) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun e!499157 () Bool)

(assert (=> b!893764 (= e!499157 (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37825 lt!403883)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893765 () Bool)

(assert (=> b!893765 (= e!499154 (Intermediate!8863 false (toIndex!0 key!785 (mask!25849 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!893766 () Bool)

(declare-fun e!499156 () Bool)

(declare-fun e!499155 () Bool)

(assert (=> b!893766 (= e!499156 e!499155)))

(declare-fun res!605118 () Bool)

(assert (=> b!893766 (= res!605118 (and ((_ is Intermediate!8863) lt!403883) (not (undefined!9675 lt!403883)) (bvslt (x!75963 lt!403883) #b01111111111111111111111111111110) (bvsge (x!75963 lt!403883) #b00000000000000000000000000000000) (bvsge (x!75963 lt!403883) #b00000000000000000000000000000000)))))

(assert (=> b!893766 (=> (not res!605118) (not e!499155))))

(declare-fun b!893767 () Bool)

(assert (=> b!893767 (= e!499156 (bvsge (x!75963 lt!403883) #b01111111111111111111111111111110))))

(declare-fun b!893768 () Bool)

(assert (=> b!893768 (= e!499153 (Intermediate!8863 true (toIndex!0 key!785 (mask!25849 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!893769 () Bool)

(assert (=> b!893769 (= e!499154 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25849 thiss!1181)) #b00000000000000000000000000000000 (mask!25849 thiss!1181)) key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun d!110405 () Bool)

(assert (=> d!110405 e!499156))

(declare-fun c!94217 () Bool)

(assert (=> d!110405 (= c!94217 (and ((_ is Intermediate!8863) lt!403883) (undefined!9675 lt!403883)))))

(assert (=> d!110405 (= lt!403883 e!499153)))

(declare-fun c!94216 () Bool)

(assert (=> d!110405 (= c!94216 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110405 (= lt!403882 (select (arr!25179 (_keys!10005 thiss!1181)) (toIndex!0 key!785 (mask!25849 thiss!1181))))))

(assert (=> d!110405 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25849 thiss!1181)) key!785 (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) lt!403883)))

(declare-fun b!893770 () Bool)

(assert (=> b!893770 (and (bvsge (index!37825 lt!403883) #b00000000000000000000000000000000) (bvslt (index!37825 lt!403883) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun res!605120 () Bool)

(assert (=> b!893770 (= res!605120 (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37825 lt!403883)) key!785))))

(assert (=> b!893770 (=> res!605120 e!499157)))

(assert (=> b!893770 (= e!499155 e!499157)))

(declare-fun b!893771 () Bool)

(assert (=> b!893771 (and (bvsge (index!37825 lt!403883) #b00000000000000000000000000000000) (bvslt (index!37825 lt!403883) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun res!605119 () Bool)

(assert (=> b!893771 (= res!605119 (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37825 lt!403883)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893771 (=> res!605119 e!499157)))

(assert (= (and d!110405 c!94216) b!893768))

(assert (= (and d!110405 (not c!94216)) b!893763))

(assert (= (and b!893763 c!94218) b!893765))

(assert (= (and b!893763 (not c!94218)) b!893769))

(assert (= (and d!110405 c!94217) b!893767))

(assert (= (and d!110405 (not c!94217)) b!893766))

(assert (= (and b!893766 res!605118) b!893770))

(assert (= (and b!893770 (not res!605120)) b!893771))

(assert (= (and b!893771 (not res!605119)) b!893764))

(declare-fun m!831757 () Bool)

(assert (=> b!893770 m!831757))

(assert (=> d!110405 m!831591))

(declare-fun m!831759 () Bool)

(assert (=> d!110405 m!831759))

(assert (=> d!110405 m!831499))

(assert (=> b!893769 m!831591))

(declare-fun m!831761 () Bool)

(assert (=> b!893769 m!831761))

(assert (=> b!893769 m!831761))

(declare-fun m!831763 () Bool)

(assert (=> b!893769 m!831763))

(assert (=> b!893764 m!831757))

(assert (=> b!893771 m!831757))

(assert (=> d!110337 d!110405))

(declare-fun d!110407 () Bool)

(declare-fun lt!403889 () (_ BitVec 32))

(declare-fun lt!403888 () (_ BitVec 32))

(assert (=> d!110407 (= lt!403889 (bvmul (bvxor lt!403888 (bvlshr lt!403888 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110407 (= lt!403888 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110407 (and (bvsge (mask!25849 thiss!1181) #b00000000000000000000000000000000) (let ((res!605121 (let ((h!18927 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!75975 (bvmul (bvxor h!18927 (bvlshr h!18927 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!75975 (bvlshr x!75975 #b00000000000000000000000000001101)) (mask!25849 thiss!1181)))))) (and (bvslt res!605121 (bvadd (mask!25849 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605121 #b00000000000000000000000000000000))))))

(assert (=> d!110407 (= (toIndex!0 key!785 (mask!25849 thiss!1181)) (bvand (bvxor lt!403889 (bvlshr lt!403889 #b00000000000000000000000000001101)) (mask!25849 thiss!1181)))))

(assert (=> d!110337 d!110407))

(assert (=> d!110337 d!110357))

(assert (=> b!893498 d!110371))

(declare-fun d!110409 () Bool)

(assert (=> d!110409 (= (isDefined!327 (getValueByKey!448 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785))) (not (isEmpty!681 (getValueByKey!448 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))))

(declare-fun bs!25084 () Bool)

(assert (= bs!25084 d!110409))

(assert (=> bs!25084 m!831621))

(declare-fun m!831765 () Bool)

(assert (=> bs!25084 m!831765))

(assert (=> b!893621 d!110409))

(declare-fun b!893773 () Bool)

(declare-fun e!499158 () Option!454)

(declare-fun e!499159 () Option!454)

(assert (=> b!893773 (= e!499158 e!499159)))

(declare-fun c!94220 () Bool)

(assert (=> b!893773 (= c!94220 (and ((_ is Cons!17793) (toList!5372 call!39624)) (not (= (_1!6019 (h!18924 (toList!5372 call!39624))) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))))

(declare-fun b!893772 () Bool)

(assert (=> b!893772 (= e!499158 (Some!453 (_2!6019 (h!18924 (toList!5372 call!39624)))))))

(declare-fun d!110411 () Bool)

(declare-fun c!94219 () Bool)

(assert (=> d!110411 (= c!94219 (and ((_ is Cons!17793) (toList!5372 call!39624)) (= (_1!6019 (h!18924 (toList!5372 call!39624))) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785))))))

(assert (=> d!110411 (= (getValueByKey!448 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)) e!499158)))

(declare-fun b!893775 () Bool)

(assert (=> b!893775 (= e!499159 None!452)))

(declare-fun b!893774 () Bool)

(assert (=> b!893774 (= e!499159 (getValueByKey!448 (t!25118 (toList!5372 call!39624)) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(assert (= (and d!110411 c!94219) b!893772))

(assert (= (and d!110411 (not c!94219)) b!893773))

(assert (= (and b!893773 c!94220) b!893774))

(assert (= (and b!893773 (not c!94220)) b!893775))

(declare-fun m!831767 () Bool)

(assert (=> b!893774 m!831767))

(assert (=> b!893621 d!110411))

(declare-fun d!110413 () Bool)

(assert (=> d!110413 (= (apply!407 lt!403749 lt!403762) (get!13254 (getValueByKey!448 (toList!5372 lt!403749) lt!403762)))))

(declare-fun bs!25085 () Bool)

(assert (= bs!25085 d!110413))

(declare-fun m!831769 () Bool)

(assert (=> bs!25085 m!831769))

(assert (=> bs!25085 m!831769))

(declare-fun m!831771 () Bool)

(assert (=> bs!25085 m!831771))

(assert (=> b!893563 d!110413))

(declare-fun d!110415 () Bool)

(assert (=> d!110415 (= (apply!407 lt!403765 lt!403767) (get!13254 (getValueByKey!448 (toList!5372 lt!403765) lt!403767)))))

(declare-fun bs!25086 () Bool)

(assert (= bs!25086 d!110415))

(declare-fun m!831773 () Bool)

(assert (=> bs!25086 m!831773))

(assert (=> bs!25086 m!831773))

(declare-fun m!831775 () Bool)

(assert (=> bs!25086 m!831775))

(assert (=> b!893563 d!110415))

(declare-fun d!110417 () Bool)

(assert (=> d!110417 (= (apply!407 (+!2588 lt!403765 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))) lt!403767) (apply!407 lt!403765 lt!403767))))

(declare-fun lt!403892 () Unit!30426)

(declare-fun choose!1467 (ListLongMap!10713 (_ BitVec 64) V!29209 (_ BitVec 64)) Unit!30426)

(assert (=> d!110417 (= lt!403892 (choose!1467 lt!403765 lt!403768 (minValue!5118 thiss!1181) lt!403767))))

(declare-fun e!499162 () Bool)

(assert (=> d!110417 e!499162))

(declare-fun res!605124 () Bool)

(assert (=> d!110417 (=> (not res!605124) (not e!499162))))

(assert (=> d!110417 (= res!605124 (contains!4383 lt!403765 lt!403767))))

(assert (=> d!110417 (= (addApplyDifferent!329 lt!403765 lt!403768 (minValue!5118 thiss!1181) lt!403767) lt!403892)))

(declare-fun b!893779 () Bool)

(assert (=> b!893779 (= e!499162 (not (= lt!403767 lt!403768)))))

(assert (= (and d!110417 res!605124) b!893779))

(assert (=> d!110417 m!831533))

(declare-fun m!831777 () Bool)

(assert (=> d!110417 m!831777))

(assert (=> d!110417 m!831533))

(assert (=> d!110417 m!831551))

(declare-fun m!831779 () Bool)

(assert (=> d!110417 m!831779))

(assert (=> d!110417 m!831541))

(assert (=> b!893563 d!110417))

(declare-fun d!110419 () Bool)

(declare-fun e!499163 () Bool)

(assert (=> d!110419 e!499163))

(declare-fun res!605125 () Bool)

(assert (=> d!110419 (=> (not res!605125) (not e!499163))))

(declare-fun lt!403896 () ListLongMap!10713)

(assert (=> d!110419 (= res!605125 (contains!4383 lt!403896 (_1!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))))))

(declare-fun lt!403895 () List!17797)

(assert (=> d!110419 (= lt!403896 (ListLongMap!10714 lt!403895))))

(declare-fun lt!403894 () Unit!30426)

(declare-fun lt!403893 () Unit!30426)

(assert (=> d!110419 (= lt!403894 lt!403893)))

(assert (=> d!110419 (= (getValueByKey!448 lt!403895 (_1!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))))))

(assert (=> d!110419 (= lt!403893 (lemmaContainsTupThenGetReturnValue!246 lt!403895 (_1!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))))))

(assert (=> d!110419 (= lt!403895 (insertStrictlySorted!303 (toList!5372 lt!403751) (_1!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))))))

(assert (=> d!110419 (= (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))) lt!403896)))

(declare-fun b!893780 () Bool)

(declare-fun res!605126 () Bool)

(assert (=> b!893780 (=> (not res!605126) (not e!499163))))

(assert (=> b!893780 (= res!605126 (= (getValueByKey!448 (toList!5372 lt!403896) (_1!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))))))))

(declare-fun b!893781 () Bool)

(assert (=> b!893781 (= e!499163 (contains!4385 (toList!5372 lt!403896) (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))))))

(assert (= (and d!110419 res!605125) b!893780))

(assert (= (and b!893780 res!605126) b!893781))

(declare-fun m!831781 () Bool)

(assert (=> d!110419 m!831781))

(declare-fun m!831783 () Bool)

(assert (=> d!110419 m!831783))

(declare-fun m!831785 () Bool)

(assert (=> d!110419 m!831785))

(declare-fun m!831787 () Bool)

(assert (=> d!110419 m!831787))

(declare-fun m!831789 () Bool)

(assert (=> b!893780 m!831789))

(declare-fun m!831791 () Bool)

(assert (=> b!893781 m!831791))

(assert (=> b!893563 d!110419))

(declare-fun d!110421 () Bool)

(assert (=> d!110421 (= (apply!407 (+!2588 lt!403749 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))) lt!403762) (apply!407 lt!403749 lt!403762))))

(declare-fun lt!403897 () Unit!30426)

(assert (=> d!110421 (= lt!403897 (choose!1467 lt!403749 lt!403756 (zeroValue!5118 thiss!1181) lt!403762))))

(declare-fun e!499164 () Bool)

(assert (=> d!110421 e!499164))

(declare-fun res!605127 () Bool)

(assert (=> d!110421 (=> (not res!605127) (not e!499164))))

(assert (=> d!110421 (= res!605127 (contains!4383 lt!403749 lt!403762))))

(assert (=> d!110421 (= (addApplyDifferent!329 lt!403749 lt!403756 (zeroValue!5118 thiss!1181) lt!403762) lt!403897)))

(declare-fun b!893782 () Bool)

(assert (=> b!893782 (= e!499164 (not (= lt!403762 lt!403756)))))

(assert (= (and d!110421 res!605127) b!893782))

(assert (=> d!110421 m!831529))

(declare-fun m!831793 () Bool)

(assert (=> d!110421 m!831793))

(assert (=> d!110421 m!831529))

(assert (=> d!110421 m!831531))

(declare-fun m!831795 () Bool)

(assert (=> d!110421 m!831795))

(assert (=> d!110421 m!831547))

(assert (=> b!893563 d!110421))

(declare-fun d!110423 () Bool)

(assert (=> d!110423 (= (apply!407 (+!2588 lt!403757 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))) lt!403760) (get!13254 (getValueByKey!448 (toList!5372 (+!2588 lt!403757 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181)))) lt!403760)))))

(declare-fun bs!25087 () Bool)

(assert (= bs!25087 d!110423))

(declare-fun m!831797 () Bool)

(assert (=> bs!25087 m!831797))

(assert (=> bs!25087 m!831797))

(declare-fun m!831799 () Bool)

(assert (=> bs!25087 m!831799))

(assert (=> b!893563 d!110423))

(declare-fun d!110425 () Bool)

(assert (=> d!110425 (= (apply!407 (+!2588 lt!403749 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))) lt!403762) (get!13254 (getValueByKey!448 (toList!5372 (+!2588 lt!403749 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181)))) lt!403762)))))

(declare-fun bs!25088 () Bool)

(assert (= bs!25088 d!110425))

(declare-fun m!831801 () Bool)

(assert (=> bs!25088 m!831801))

(assert (=> bs!25088 m!831801))

(declare-fun m!831803 () Bool)

(assert (=> bs!25088 m!831803))

(assert (=> b!893563 d!110425))

(declare-fun d!110427 () Bool)

(declare-fun e!499165 () Bool)

(assert (=> d!110427 e!499165))

(declare-fun res!605128 () Bool)

(assert (=> d!110427 (=> (not res!605128) (not e!499165))))

(declare-fun lt!403901 () ListLongMap!10713)

(assert (=> d!110427 (= res!605128 (contains!4383 lt!403901 (_1!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181)))))))

(declare-fun lt!403900 () List!17797)

(assert (=> d!110427 (= lt!403901 (ListLongMap!10714 lt!403900))))

(declare-fun lt!403899 () Unit!30426)

(declare-fun lt!403898 () Unit!30426)

(assert (=> d!110427 (= lt!403899 lt!403898)))

(assert (=> d!110427 (= (getValueByKey!448 lt!403900 (_1!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181)))))))

(assert (=> d!110427 (= lt!403898 (lemmaContainsTupThenGetReturnValue!246 lt!403900 (_1!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181)))))))

(assert (=> d!110427 (= lt!403900 (insertStrictlySorted!303 (toList!5372 lt!403765) (_1!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181)))))))

(assert (=> d!110427 (= (+!2588 lt!403765 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))) lt!403901)))

(declare-fun b!893783 () Bool)

(declare-fun res!605129 () Bool)

(assert (=> b!893783 (=> (not res!605129) (not e!499165))))

(assert (=> b!893783 (= res!605129 (= (getValueByKey!448 (toList!5372 lt!403901) (_1!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))))))))

(declare-fun b!893784 () Bool)

(assert (=> b!893784 (= e!499165 (contains!4385 (toList!5372 lt!403901) (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))))))

(assert (= (and d!110427 res!605128) b!893783))

(assert (= (and b!893783 res!605129) b!893784))

(declare-fun m!831805 () Bool)

(assert (=> d!110427 m!831805))

(declare-fun m!831807 () Bool)

(assert (=> d!110427 m!831807))

(declare-fun m!831809 () Bool)

(assert (=> d!110427 m!831809))

(declare-fun m!831811 () Bool)

(assert (=> d!110427 m!831811))

(declare-fun m!831813 () Bool)

(assert (=> b!893783 m!831813))

(declare-fun m!831815 () Bool)

(assert (=> b!893784 m!831815))

(assert (=> b!893563 d!110427))

(declare-fun d!110429 () Bool)

(assert (=> d!110429 (= (apply!407 (+!2588 lt!403757 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))) lt!403760) (apply!407 lt!403757 lt!403760))))

(declare-fun lt!403902 () Unit!30426)

(assert (=> d!110429 (= lt!403902 (choose!1467 lt!403757 lt!403759 (minValue!5118 thiss!1181) lt!403760))))

(declare-fun e!499166 () Bool)

(assert (=> d!110429 e!499166))

(declare-fun res!605130 () Bool)

(assert (=> d!110429 (=> (not res!605130) (not e!499166))))

(assert (=> d!110429 (= res!605130 (contains!4383 lt!403757 lt!403760))))

(assert (=> d!110429 (= (addApplyDifferent!329 lt!403757 lt!403759 (minValue!5118 thiss!1181) lt!403760) lt!403902)))

(declare-fun b!893785 () Bool)

(assert (=> b!893785 (= e!499166 (not (= lt!403760 lt!403759)))))

(assert (= (and d!110429 res!605130) b!893785))

(assert (=> d!110429 m!831545))

(declare-fun m!831817 () Bool)

(assert (=> d!110429 m!831817))

(assert (=> d!110429 m!831545))

(assert (=> d!110429 m!831555))

(declare-fun m!831819 () Bool)

(assert (=> d!110429 m!831819))

(assert (=> d!110429 m!831527))

(assert (=> b!893563 d!110429))

(assert (=> b!893563 d!110355))

(declare-fun d!110431 () Bool)

(assert (=> d!110431 (= (apply!407 (+!2588 lt!403765 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181))) lt!403767) (get!13254 (getValueByKey!448 (toList!5372 (+!2588 lt!403765 (tuple2!12017 lt!403768 (minValue!5118 thiss!1181)))) lt!403767)))))

(declare-fun bs!25089 () Bool)

(assert (= bs!25089 d!110431))

(declare-fun m!831821 () Bool)

(assert (=> bs!25089 m!831821))

(assert (=> bs!25089 m!831821))

(declare-fun m!831823 () Bool)

(assert (=> bs!25089 m!831823))

(assert (=> b!893563 d!110431))

(declare-fun d!110433 () Bool)

(declare-fun e!499167 () Bool)

(assert (=> d!110433 e!499167))

(declare-fun res!605131 () Bool)

(assert (=> d!110433 (=> (not res!605131) (not e!499167))))

(declare-fun lt!403906 () ListLongMap!10713)

(assert (=> d!110433 (= res!605131 (contains!4383 lt!403906 (_1!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181)))))))

(declare-fun lt!403905 () List!17797)

(assert (=> d!110433 (= lt!403906 (ListLongMap!10714 lt!403905))))

(declare-fun lt!403904 () Unit!30426)

(declare-fun lt!403903 () Unit!30426)

(assert (=> d!110433 (= lt!403904 lt!403903)))

(assert (=> d!110433 (= (getValueByKey!448 lt!403905 (_1!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181)))))))

(assert (=> d!110433 (= lt!403903 (lemmaContainsTupThenGetReturnValue!246 lt!403905 (_1!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181)))))))

(assert (=> d!110433 (= lt!403905 (insertStrictlySorted!303 (toList!5372 lt!403757) (_1!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181)))))))

(assert (=> d!110433 (= (+!2588 lt!403757 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))) lt!403906)))

(declare-fun b!893786 () Bool)

(declare-fun res!605132 () Bool)

(assert (=> b!893786 (=> (not res!605132) (not e!499167))))

(assert (=> b!893786 (= res!605132 (= (getValueByKey!448 (toList!5372 lt!403906) (_1!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))))))))

(declare-fun b!893787 () Bool)

(assert (=> b!893787 (= e!499167 (contains!4385 (toList!5372 lt!403906) (tuple2!12017 lt!403759 (minValue!5118 thiss!1181))))))

(assert (= (and d!110433 res!605131) b!893786))

(assert (= (and b!893786 res!605132) b!893787))

(declare-fun m!831825 () Bool)

(assert (=> d!110433 m!831825))

(declare-fun m!831827 () Bool)

(assert (=> d!110433 m!831827))

(declare-fun m!831829 () Bool)

(assert (=> d!110433 m!831829))

(declare-fun m!831831 () Bool)

(assert (=> d!110433 m!831831))

(declare-fun m!831833 () Bool)

(assert (=> b!893786 m!831833))

(declare-fun m!831835 () Bool)

(assert (=> b!893787 m!831835))

(assert (=> b!893563 d!110433))

(declare-fun d!110435 () Bool)

(assert (=> d!110435 (= (apply!407 lt!403757 lt!403760) (get!13254 (getValueByKey!448 (toList!5372 lt!403757) lt!403760)))))

(declare-fun bs!25090 () Bool)

(assert (= bs!25090 d!110435))

(declare-fun m!831837 () Bool)

(assert (=> bs!25090 m!831837))

(assert (=> bs!25090 m!831837))

(declare-fun m!831839 () Bool)

(assert (=> bs!25090 m!831839))

(assert (=> b!893563 d!110435))

(declare-fun d!110437 () Bool)

(declare-fun e!499168 () Bool)

(assert (=> d!110437 e!499168))

(declare-fun res!605133 () Bool)

(assert (=> d!110437 (=> (not res!605133) (not e!499168))))

(declare-fun lt!403910 () ListLongMap!10713)

(assert (=> d!110437 (= res!605133 (contains!4383 lt!403910 (_1!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181)))))))

(declare-fun lt!403909 () List!17797)

(assert (=> d!110437 (= lt!403910 (ListLongMap!10714 lt!403909))))

(declare-fun lt!403908 () Unit!30426)

(declare-fun lt!403907 () Unit!30426)

(assert (=> d!110437 (= lt!403908 lt!403907)))

(assert (=> d!110437 (= (getValueByKey!448 lt!403909 (_1!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181)))))))

(assert (=> d!110437 (= lt!403907 (lemmaContainsTupThenGetReturnValue!246 lt!403909 (_1!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181)))))))

(assert (=> d!110437 (= lt!403909 (insertStrictlySorted!303 (toList!5372 lt!403749) (_1!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))) (_2!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181)))))))

(assert (=> d!110437 (= (+!2588 lt!403749 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))) lt!403910)))

(declare-fun b!893788 () Bool)

(declare-fun res!605134 () Bool)

(assert (=> b!893788 (=> (not res!605134) (not e!499168))))

(assert (=> b!893788 (= res!605134 (= (getValueByKey!448 (toList!5372 lt!403910) (_1!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181)))) (Some!453 (_2!6019 (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))))))))

(declare-fun b!893789 () Bool)

(assert (=> b!893789 (= e!499168 (contains!4385 (toList!5372 lt!403910) (tuple2!12017 lt!403756 (zeroValue!5118 thiss!1181))))))

(assert (= (and d!110437 res!605133) b!893788))

(assert (= (and b!893788 res!605134) b!893789))

(declare-fun m!831841 () Bool)

(assert (=> d!110437 m!831841))

(declare-fun m!831843 () Bool)

(assert (=> d!110437 m!831843))

(declare-fun m!831845 () Bool)

(assert (=> d!110437 m!831845))

(declare-fun m!831847 () Bool)

(assert (=> d!110437 m!831847))

(declare-fun m!831849 () Bool)

(assert (=> b!893788 m!831849))

(declare-fun m!831851 () Bool)

(assert (=> b!893789 m!831851))

(assert (=> b!893563 d!110437))

(declare-fun d!110439 () Bool)

(assert (=> d!110439 (contains!4383 (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))) lt!403748)))

(declare-fun lt!403913 () Unit!30426)

(declare-fun choose!1468 (ListLongMap!10713 (_ BitVec 64) V!29209 (_ BitVec 64)) Unit!30426)

(assert (=> d!110439 (= lt!403913 (choose!1468 lt!403751 lt!403763 (zeroValue!5118 thiss!1181) lt!403748))))

(assert (=> d!110439 (contains!4383 lt!403751 lt!403748)))

(assert (=> d!110439 (= (addStillContains!329 lt!403751 lt!403763 (zeroValue!5118 thiss!1181) lt!403748) lt!403913)))

(declare-fun bs!25091 () Bool)

(assert (= bs!25091 d!110439))

(assert (=> bs!25091 m!831539))

(assert (=> bs!25091 m!831539))

(assert (=> bs!25091 m!831553))

(declare-fun m!831853 () Bool)

(assert (=> bs!25091 m!831853))

(declare-fun m!831855 () Bool)

(assert (=> bs!25091 m!831855))

(assert (=> b!893563 d!110439))

(declare-fun d!110441 () Bool)

(declare-fun e!499169 () Bool)

(assert (=> d!110441 e!499169))

(declare-fun res!605135 () Bool)

(assert (=> d!110441 (=> res!605135 e!499169)))

(declare-fun lt!403917 () Bool)

(assert (=> d!110441 (= res!605135 (not lt!403917))))

(declare-fun lt!403914 () Bool)

(assert (=> d!110441 (= lt!403917 lt!403914)))

(declare-fun lt!403915 () Unit!30426)

(declare-fun e!499170 () Unit!30426)

(assert (=> d!110441 (= lt!403915 e!499170)))

(declare-fun c!94221 () Bool)

(assert (=> d!110441 (= c!94221 lt!403914)))

(assert (=> d!110441 (= lt!403914 (containsKey!422 (toList!5372 (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))) lt!403748))))

(assert (=> d!110441 (= (contains!4383 (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181))) lt!403748) lt!403917)))

(declare-fun b!893791 () Bool)

(declare-fun lt!403916 () Unit!30426)

(assert (=> b!893791 (= e!499170 lt!403916)))

(assert (=> b!893791 (= lt!403916 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))) lt!403748))))

(assert (=> b!893791 (isDefined!327 (getValueByKey!448 (toList!5372 (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))) lt!403748))))

(declare-fun b!893792 () Bool)

(declare-fun Unit!30436 () Unit!30426)

(assert (=> b!893792 (= e!499170 Unit!30436)))

(declare-fun b!893793 () Bool)

(assert (=> b!893793 (= e!499169 (isDefined!327 (getValueByKey!448 (toList!5372 (+!2588 lt!403751 (tuple2!12017 lt!403763 (zeroValue!5118 thiss!1181)))) lt!403748)))))

(assert (= (and d!110441 c!94221) b!893791))

(assert (= (and d!110441 (not c!94221)) b!893792))

(assert (= (and d!110441 (not res!605135)) b!893793))

(declare-fun m!831857 () Bool)

(assert (=> d!110441 m!831857))

(declare-fun m!831859 () Bool)

(assert (=> b!893791 m!831859))

(declare-fun m!831861 () Bool)

(assert (=> b!893791 m!831861))

(assert (=> b!893791 m!831861))

(declare-fun m!831863 () Bool)

(assert (=> b!893791 m!831863))

(assert (=> b!893793 m!831861))

(assert (=> b!893793 m!831861))

(assert (=> b!893793 m!831863))

(assert (=> b!893563 d!110441))

(declare-fun bm!39659 () Bool)

(declare-fun call!39662 () Bool)

(assert (=> bm!39659 (= call!39662 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893794 () Bool)

(declare-fun e!499173 () Bool)

(assert (=> b!893794 (= e!499173 call!39662)))

(declare-fun b!893795 () Bool)

(declare-fun e!499172 () Bool)

(declare-fun e!499171 () Bool)

(assert (=> b!893795 (= e!499172 e!499171)))

(declare-fun c!94222 () Bool)

(assert (=> b!893795 (= c!94222 (validKeyInArray!0 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!110443 () Bool)

(declare-fun res!605137 () Bool)

(assert (=> d!110443 (=> res!605137 e!499172)))

(assert (=> d!110443 (= res!605137 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(assert (=> d!110443 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) e!499172)))

(declare-fun b!893796 () Bool)

(assert (=> b!893796 (= e!499171 call!39662)))

(declare-fun b!893797 () Bool)

(assert (=> b!893797 (= e!499171 e!499173)))

(declare-fun lt!403918 () (_ BitVec 64))

(assert (=> b!893797 (= lt!403918 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!403920 () Unit!30426)

(assert (=> b!893797 (= lt!403920 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) lt!403918 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!893797 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403918 #b00000000000000000000000000000000)))

(declare-fun lt!403919 () Unit!30426)

(assert (=> b!893797 (= lt!403919 lt!403920)))

(declare-fun res!605136 () Bool)

(assert (=> b!893797 (= res!605136 (= (seekEntryOrOpen!0 (select (arr!25179 (_keys!10005 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) (Found!8863 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!893797 (=> (not res!605136) (not e!499173))))

(assert (= (and d!110443 (not res!605137)) b!893795))

(assert (= (and b!893795 c!94222) b!893797))

(assert (= (and b!893795 (not c!94222)) b!893796))

(assert (= (and b!893797 res!605136) b!893794))

(assert (= (or b!893794 b!893796) bm!39659))

(declare-fun m!831865 () Bool)

(assert (=> bm!39659 m!831865))

(assert (=> b!893795 m!831701))

(assert (=> b!893795 m!831701))

(assert (=> b!893795 m!831713))

(assert (=> b!893797 m!831701))

(declare-fun m!831867 () Bool)

(assert (=> b!893797 m!831867))

(declare-fun m!831869 () Bool)

(assert (=> b!893797 m!831869))

(assert (=> b!893797 m!831701))

(declare-fun m!831871 () Bool)

(assert (=> b!893797 m!831871))

(assert (=> bm!39627 d!110443))

(assert (=> d!110323 d!110357))

(declare-fun d!110445 () Bool)

(assert (=> d!110445 (isDefined!327 (getValueByKey!448 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(declare-fun lt!403921 () Unit!30426)

(assert (=> d!110445 (= lt!403921 (choose!1466 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(declare-fun e!499174 () Bool)

(assert (=> d!110445 e!499174))

(declare-fun res!605138 () Bool)

(assert (=> d!110445 (=> (not res!605138) (not e!499174))))

(assert (=> d!110445 (= res!605138 (isStrictlySorted!495 (toList!5372 call!39624)))))

(assert (=> d!110445 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)) lt!403921)))

(declare-fun b!893798 () Bool)

(assert (=> b!893798 (= e!499174 (containsKey!422 (toList!5372 call!39624) (ite c!94118 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403664)) key!785)))))

(assert (= (and d!110445 res!605138) b!893798))

(assert (=> d!110445 m!831621))

(assert (=> d!110445 m!831621))

(assert (=> d!110445 m!831623))

(declare-fun m!831873 () Bool)

(assert (=> d!110445 m!831873))

(declare-fun m!831875 () Bool)

(assert (=> d!110445 m!831875))

(assert (=> b!893798 m!831617))

(assert (=> b!893619 d!110445))

(assert (=> b!893619 d!110409))

(assert (=> b!893619 d!110411))

(assert (=> d!110319 d!110347))

(declare-fun d!110447 () Bool)

(assert (=> d!110447 (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000)))

(assert (=> d!110447 true))

(declare-fun _$60!400 () Unit!30426)

(assert (=> d!110447 (= (choose!13 (_keys!10005 thiss!1181) key!785 (index!37824 lt!403664)) _$60!400)))

(declare-fun bs!25092 () Bool)

(assert (= bs!25092 d!110447))

(assert (=> bs!25092 m!831467))

(assert (=> d!110319 d!110447))

(assert (=> b!893583 d!110347))

(declare-fun d!110449 () Bool)

(declare-fun e!499175 () Bool)

(assert (=> d!110449 e!499175))

(declare-fun res!605139 () Bool)

(assert (=> d!110449 (=> (not res!605139) (not e!499175))))

(declare-fun lt!403925 () ListLongMap!10713)

(assert (=> d!110449 (= res!605139 (contains!4383 lt!403925 (_1!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))))))

(declare-fun lt!403924 () List!17797)

(assert (=> d!110449 (= lt!403925 (ListLongMap!10714 lt!403924))))

(declare-fun lt!403923 () Unit!30426)

(declare-fun lt!403922 () Unit!30426)

(assert (=> d!110449 (= lt!403923 lt!403922)))

(assert (=> d!110449 (= (getValueByKey!448 lt!403924 (_1!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))) (Some!453 (_2!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))))))

(assert (=> d!110449 (= lt!403922 (lemmaContainsTupThenGetReturnValue!246 lt!403924 (_1!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))) (_2!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))))))

(assert (=> d!110449 (= lt!403924 (insertStrictlySorted!303 (toList!5372 (ite c!94149 call!39651 (ite c!94147 call!39650 call!39647))) (_1!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))) (_2!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))))))

(assert (=> d!110449 (= (+!2588 (ite c!94149 call!39651 (ite c!94147 call!39650 call!39647)) (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))) lt!403925)))

(declare-fun b!893799 () Bool)

(declare-fun res!605140 () Bool)

(assert (=> b!893799 (=> (not res!605140) (not e!499175))))

(assert (=> b!893799 (= res!605140 (= (getValueByKey!448 (toList!5372 lt!403925) (_1!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181))))) (Some!453 (_2!6019 (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))))))))

(declare-fun b!893800 () Bool)

(assert (=> b!893800 (= e!499175 (contains!4385 (toList!5372 lt!403925) (ite (or c!94149 c!94147) (tuple2!12017 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5118 thiss!1181)) (tuple2!12017 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5118 thiss!1181)))))))

(assert (= (and d!110449 res!605139) b!893799))

(assert (= (and b!893799 res!605140) b!893800))

(declare-fun m!831877 () Bool)

(assert (=> d!110449 m!831877))

(declare-fun m!831879 () Bool)

(assert (=> d!110449 m!831879))

(declare-fun m!831881 () Bool)

(assert (=> d!110449 m!831881))

(declare-fun m!831883 () Bool)

(assert (=> d!110449 m!831883))

(declare-fun m!831885 () Bool)

(assert (=> b!893799 m!831885))

(declare-fun m!831887 () Bool)

(assert (=> b!893800 m!831887))

(assert (=> bm!39647 d!110449))

(declare-fun d!110451 () Bool)

(declare-fun e!499178 () Bool)

(assert (=> d!110451 e!499178))

(declare-fun c!94225 () Bool)

(assert (=> d!110451 (= c!94225 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!110451 true))

(declare-fun _$15!89 () Unit!30426)

(assert (=> d!110451 (= (choose!1465 (_keys!10005 thiss!1181) (_values!5305 thiss!1181) (mask!25849 thiss!1181) (extraKeys!5014 thiss!1181) (zeroValue!5118 thiss!1181) (minValue!5118 thiss!1181) key!785 (defaultEntry!5318 thiss!1181)) _$15!89)))

(declare-fun b!893805 () Bool)

(assert (=> b!893805 (= e!499178 (arrayContainsKey!0 (_keys!10005 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun b!893806 () Bool)

(assert (=> b!893806 (= e!499178 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5014 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!110451 c!94225) b!893805))

(assert (= (and d!110451 (not c!94225)) b!893806))

(assert (=> b!893805 m!831467))

(assert (=> d!110335 d!110451))

(assert (=> d!110335 d!110357))

(declare-fun d!110453 () Bool)

(declare-fun e!499179 () Bool)

(assert (=> d!110453 e!499179))

(declare-fun res!605141 () Bool)

(assert (=> d!110453 (=> res!605141 e!499179)))

(declare-fun lt!403929 () Bool)

(assert (=> d!110453 (= res!605141 (not lt!403929))))

(declare-fun lt!403926 () Bool)

(assert (=> d!110453 (= lt!403929 lt!403926)))

(declare-fun lt!403927 () Unit!30426)

(declare-fun e!499180 () Unit!30426)

(assert (=> d!110453 (= lt!403927 e!499180)))

(declare-fun c!94226 () Bool)

(assert (=> d!110453 (= c!94226 lt!403926)))

(assert (=> d!110453 (= lt!403926 (containsKey!422 (toList!5372 lt!403761) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110453 (= (contains!4383 lt!403761 #b0000000000000000000000000000000000000000000000000000000000000000) lt!403929)))

(declare-fun b!893807 () Bool)

(declare-fun lt!403928 () Unit!30426)

(assert (=> b!893807 (= e!499180 lt!403928)))

(assert (=> b!893807 (= lt!403928 (lemmaContainsKeyImpliesGetValueByKeyDefined!318 (toList!5372 lt!403761) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893807 (isDefined!327 (getValueByKey!448 (toList!5372 lt!403761) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893808 () Bool)

(declare-fun Unit!30437 () Unit!30426)

(assert (=> b!893808 (= e!499180 Unit!30437)))

(declare-fun b!893809 () Bool)

(assert (=> b!893809 (= e!499179 (isDefined!327 (getValueByKey!448 (toList!5372 lt!403761) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110453 c!94226) b!893807))

(assert (= (and d!110453 (not c!94226)) b!893808))

(assert (= (and d!110453 (not res!605141)) b!893809))

(declare-fun m!831889 () Bool)

(assert (=> d!110453 m!831889))

(declare-fun m!831891 () Bool)

(assert (=> b!893807 m!831891))

(assert (=> b!893807 m!831675))

(assert (=> b!893807 m!831675))

(declare-fun m!831893 () Bool)

(assert (=> b!893807 m!831893))

(assert (=> b!893809 m!831675))

(assert (=> b!893809 m!831675))

(assert (=> b!893809 m!831893))

(assert (=> bm!39646 d!110453))

(declare-fun d!110455 () Bool)

(assert (=> d!110455 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403790 #b00000000000000000000000000000000)))

(declare-fun lt!403930 () Unit!30426)

(assert (=> d!110455 (= lt!403930 (choose!13 (_keys!10005 thiss!1181) lt!403790 lt!403659))))

(assert (=> d!110455 (bvsge lt!403659 #b00000000000000000000000000000000)))

(assert (=> d!110455 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10005 thiss!1181) lt!403790 lt!403659) lt!403930)))

(declare-fun bs!25093 () Bool)

(assert (= bs!25093 d!110455))

(assert (=> bs!25093 m!831605))

(declare-fun m!831895 () Bool)

(assert (=> bs!25093 m!831895))

(assert (=> b!893606 d!110455))

(declare-fun d!110457 () Bool)

(declare-fun res!605142 () Bool)

(declare-fun e!499181 () Bool)

(assert (=> d!110457 (=> res!605142 e!499181)))

(assert (=> d!110457 (= res!605142 (= (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000) lt!403790))))

(assert (=> d!110457 (= (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403790 #b00000000000000000000000000000000) e!499181)))

(declare-fun b!893810 () Bool)

(declare-fun e!499182 () Bool)

(assert (=> b!893810 (= e!499181 e!499182)))

(declare-fun res!605143 () Bool)

(assert (=> b!893810 (=> (not res!605143) (not e!499182))))

(assert (=> b!893810 (= res!605143 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25623 (_keys!10005 thiss!1181))))))

(declare-fun b!893811 () Bool)

(assert (=> b!893811 (= e!499182 (arrayContainsKey!0 (_keys!10005 thiss!1181) lt!403790 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!110457 (not res!605142)) b!893810))

(assert (= (and b!893810 res!605143) b!893811))

(assert (=> d!110457 m!831505))

(declare-fun m!831897 () Bool)

(assert (=> b!893811 m!831897))

(assert (=> b!893606 d!110457))

(declare-fun b!893812 () Bool)

(declare-fun e!499184 () SeekEntryResult!8863)

(assert (=> b!893812 (= e!499184 Undefined!8863)))

(declare-fun d!110459 () Bool)

(declare-fun lt!403932 () SeekEntryResult!8863)

(assert (=> d!110459 (and (or ((_ is Undefined!8863) lt!403932) (not ((_ is Found!8863) lt!403932)) (and (bvsge (index!37824 lt!403932) #b00000000000000000000000000000000) (bvslt (index!37824 lt!403932) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403932) ((_ is Found!8863) lt!403932) (not ((_ is MissingZero!8863) lt!403932)) (and (bvsge (index!37823 lt!403932) #b00000000000000000000000000000000) (bvslt (index!37823 lt!403932) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403932) ((_ is Found!8863) lt!403932) ((_ is MissingZero!8863) lt!403932) (not ((_ is MissingVacant!8863) lt!403932)) (and (bvsge (index!37826 lt!403932) #b00000000000000000000000000000000) (bvslt (index!37826 lt!403932) (size!25623 (_keys!10005 thiss!1181))))) (or ((_ is Undefined!8863) lt!403932) (ite ((_ is Found!8863) lt!403932) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37824 lt!403932)) (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659)) (ite ((_ is MissingZero!8863) lt!403932) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37823 lt!403932)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8863) lt!403932) (= (select (arr!25179 (_keys!10005 thiss!1181)) (index!37826 lt!403932)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!110459 (= lt!403932 e!499184)))

(declare-fun c!94228 () Bool)

(declare-fun lt!403931 () SeekEntryResult!8863)

(assert (=> d!110459 (= c!94228 (and ((_ is Intermediate!8863) lt!403931) (undefined!9675 lt!403931)))))

(assert (=> d!110459 (= lt!403931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659) (mask!25849 thiss!1181)) (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(assert (=> d!110459 (validMask!0 (mask!25849 thiss!1181))))

(assert (=> d!110459 (= (seekEntryOrOpen!0 (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)) lt!403932)))

(declare-fun b!893813 () Bool)

(declare-fun e!499185 () SeekEntryResult!8863)

(assert (=> b!893813 (= e!499185 (MissingZero!8863 (index!37825 lt!403931)))))

(declare-fun b!893814 () Bool)

(assert (=> b!893814 (= e!499185 (seekKeyOrZeroReturnVacant!0 (x!75963 lt!403931) (index!37825 lt!403931) (index!37825 lt!403931) (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659) (_keys!10005 thiss!1181) (mask!25849 thiss!1181)))))

(declare-fun b!893815 () Bool)

(declare-fun e!499183 () SeekEntryResult!8863)

(assert (=> b!893815 (= e!499183 (Found!8863 (index!37825 lt!403931)))))

(declare-fun b!893816 () Bool)

(assert (=> b!893816 (= e!499184 e!499183)))

(declare-fun lt!403933 () (_ BitVec 64))

(assert (=> b!893816 (= lt!403933 (select (arr!25179 (_keys!10005 thiss!1181)) (index!37825 lt!403931)))))

(declare-fun c!94229 () Bool)

(assert (=> b!893816 (= c!94229 (= lt!403933 (select (arr!25179 (_keys!10005 thiss!1181)) lt!403659)))))

(declare-fun b!893817 () Bool)

(declare-fun c!94227 () Bool)

(assert (=> b!893817 (= c!94227 (= lt!403933 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!893817 (= e!499183 e!499185)))

(assert (= (and d!110459 c!94228) b!893812))

(assert (= (and d!110459 (not c!94228)) b!893816))

(assert (= (and b!893816 c!94229) b!893815))

(assert (= (and b!893816 (not c!94229)) b!893817))

(assert (= (and b!893817 c!94227) b!893813))

(assert (= (and b!893817 (not c!94227)) b!893814))

(assert (=> d!110459 m!831599))

(declare-fun m!831899 () Bool)

(assert (=> d!110459 m!831899))

(declare-fun m!831901 () Bool)

(assert (=> d!110459 m!831901))

(assert (=> d!110459 m!831499))

(declare-fun m!831903 () Bool)

(assert (=> d!110459 m!831903))

(declare-fun m!831905 () Bool)

(assert (=> d!110459 m!831905))

(assert (=> d!110459 m!831899))

(assert (=> d!110459 m!831599))

(declare-fun m!831907 () Bool)

(assert (=> d!110459 m!831907))

(assert (=> b!893814 m!831599))

(declare-fun m!831909 () Bool)

(assert (=> b!893814 m!831909))

(declare-fun m!831911 () Bool)

(assert (=> b!893816 m!831911))

(assert (=> b!893606 d!110459))

(declare-fun d!110461 () Bool)

(assert (=> d!110461 (= (apply!407 lt!403761 (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000)) (get!13254 (getValueByKey!448 (toList!5372 lt!403761) (select (arr!25179 (_keys!10005 thiss!1181)) #b00000000000000000000000000000000))))))

(declare-fun bs!25094 () Bool)

(assert (= bs!25094 d!110461))

(assert (=> bs!25094 m!831505))

(assert (=> bs!25094 m!831735))

(assert (=> bs!25094 m!831735))

(declare-fun m!831913 () Bool)

(assert (=> bs!25094 m!831913))

(assert (=> b!893559 d!110461))

(declare-fun d!110463 () Bool)

(declare-fun c!94232 () Bool)

(assert (=> d!110463 (= c!94232 ((_ is ValueCellFull!8610) (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499188 () V!29209)

(assert (=> d!110463 (= (get!13256 (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1297 (defaultEntry!5318 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)) e!499188)))

(declare-fun b!893822 () Bool)

(declare-fun get!13257 (ValueCell!8610 V!29209) V!29209)

(assert (=> b!893822 (= e!499188 (get!13257 (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1297 (defaultEntry!5318 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!893823 () Bool)

(declare-fun get!13258 (ValueCell!8610 V!29209) V!29209)

(assert (=> b!893823 (= e!499188 (get!13258 (select (arr!25180 (_values!5305 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1297 (defaultEntry!5318 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!110463 c!94232) b!893822))

(assert (= (and d!110463 (not c!94232)) b!893823))

(assert (=> b!893822 m!831571))

(assert (=> b!893822 m!831573))

(declare-fun m!831915 () Bool)

(assert (=> b!893822 m!831915))

(assert (=> b!893823 m!831571))

(assert (=> b!893823 m!831573))

(declare-fun m!831917 () Bool)

(assert (=> b!893823 m!831917))

(assert (=> b!893559 d!110463))

(declare-fun d!110465 () Bool)

(declare-fun res!605144 () Bool)

(declare-fun e!499189 () Bool)

(assert (=> d!110465 (=> res!605144 e!499189)))

(assert (=> d!110465 (= res!605144 (and ((_ is Cons!17793) (toList!5372 (map!12215 thiss!1181))) (= (_1!6019 (h!18924 (toList!5372 (map!12215 thiss!1181)))) key!785)))))

(assert (=> d!110465 (= (containsKey!422 (toList!5372 (map!12215 thiss!1181)) key!785) e!499189)))

(declare-fun b!893824 () Bool)

(declare-fun e!499190 () Bool)

(assert (=> b!893824 (= e!499189 e!499190)))

(declare-fun res!605145 () Bool)

(assert (=> b!893824 (=> (not res!605145) (not e!499190))))

(assert (=> b!893824 (= res!605145 (and (or (not ((_ is Cons!17793) (toList!5372 (map!12215 thiss!1181)))) (bvsle (_1!6019 (h!18924 (toList!5372 (map!12215 thiss!1181)))) key!785)) ((_ is Cons!17793) (toList!5372 (map!12215 thiss!1181))) (bvslt (_1!6019 (h!18924 (toList!5372 (map!12215 thiss!1181)))) key!785)))))

(declare-fun b!893825 () Bool)

(assert (=> b!893825 (= e!499190 (containsKey!422 (t!25118 (toList!5372 (map!12215 thiss!1181))) key!785))))

(assert (= (and d!110465 (not res!605144)) b!893824))

(assert (= (and b!893824 res!605145) b!893825))

(declare-fun m!831919 () Bool)

(assert (=> b!893825 m!831919))

(assert (=> d!110327 d!110465))

(declare-fun b!893827 () Bool)

(declare-fun e!499191 () Option!454)

(declare-fun e!499192 () Option!454)

(assert (=> b!893827 (= e!499191 e!499192)))

(declare-fun c!94234 () Bool)

(assert (=> b!893827 (= c!94234 (and ((_ is Cons!17793) (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181))))) (not (= (_1!6019 (h!18924 (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181)))))) key!785))))))

(declare-fun b!893826 () Bool)

(assert (=> b!893826 (= e!499191 (Some!453 (_2!6019 (h!18924 (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181))))))))))

(declare-fun d!110467 () Bool)

(declare-fun c!94233 () Bool)

(assert (=> d!110467 (= c!94233 (and ((_ is Cons!17793) (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181))))) (= (_1!6019 (h!18924 (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181)))))) key!785)))))

(assert (=> d!110467 (= (getValueByKey!448 (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181)))) key!785) e!499191)))

(declare-fun b!893829 () Bool)

(assert (=> b!893829 (= e!499192 None!452)))

(declare-fun b!893828 () Bool)

(assert (=> b!893828 (= e!499192 (getValueByKey!448 (t!25118 (t!25118 (t!25118 (toList!5372 (map!12215 thiss!1181))))) key!785))))

(assert (= (and d!110467 c!94233) b!893826))

(assert (= (and d!110467 (not c!94233)) b!893827))

(assert (= (and b!893827 c!94234) b!893828))

(assert (= (and b!893827 (not c!94234)) b!893829))

(declare-fun m!831921 () Bool)

(assert (=> b!893828 m!831921))

(assert (=> b!893451 d!110467))

(assert (=> b!893558 d!110371))

(declare-fun b!893830 () Bool)

(declare-fun e!499194 () Bool)

(assert (=> b!893830 (= e!499194 tp_is_empty!18183)))

(declare-fun mapIsEmpty!28843 () Bool)

(declare-fun mapRes!28843 () Bool)

(assert (=> mapIsEmpty!28843 mapRes!28843))

(declare-fun mapNonEmpty!28843 () Bool)

(declare-fun tp!55551 () Bool)

(assert (=> mapNonEmpty!28843 (= mapRes!28843 (and tp!55551 e!499194))))

(declare-fun mapKey!28843 () (_ BitVec 32))

(declare-fun mapValue!28843 () ValueCell!8610)

(declare-fun mapRest!28843 () (Array (_ BitVec 32) ValueCell!8610))

(assert (=> mapNonEmpty!28843 (= mapRest!28842 (store mapRest!28843 mapKey!28843 mapValue!28843))))

(declare-fun b!893831 () Bool)

(declare-fun e!499193 () Bool)

(assert (=> b!893831 (= e!499193 tp_is_empty!18183)))

(declare-fun condMapEmpty!28843 () Bool)

(declare-fun mapDefault!28843 () ValueCell!8610)

(assert (=> mapNonEmpty!28842 (= condMapEmpty!28843 (= mapRest!28842 ((as const (Array (_ BitVec 32) ValueCell!8610)) mapDefault!28843)))))

(assert (=> mapNonEmpty!28842 (= tp!55550 (and e!499193 mapRes!28843))))

(assert (= (and mapNonEmpty!28842 condMapEmpty!28843) mapIsEmpty!28843))

(assert (= (and mapNonEmpty!28842 (not condMapEmpty!28843)) mapNonEmpty!28843))

(assert (= (and mapNonEmpty!28843 ((_ is ValueCellFull!8610) mapValue!28843)) b!893830))

(assert (= (and mapNonEmpty!28842 ((_ is ValueCellFull!8610) mapDefault!28843)) b!893831))

(declare-fun m!831923 () Bool)

(assert (=> mapNonEmpty!28843 m!831923))

(declare-fun b_lambda!12927 () Bool)

(assert (= b_lambda!12923 (or (and b!893354 b_free!15855) b_lambda!12927)))

(declare-fun b_lambda!12929 () Bool)

(assert (= b_lambda!12925 (or (and b!893354 b_free!15855) b_lambda!12929)))

(check-sat tp_is_empty!18183 (not b!893822) (not b!893666) b_and!26131 (not d!110403) (not d!110399) (not b!893789) (not b!893825) (not b!893674) (not b!893682) (not d!110419) (not d!110459) (not bm!39657) (not b!893800) (not d!110453) (not d!110367) (not b_lambda!12927) (not d!110355) (not b!893667) (not b!893797) (not b!893828) (not d!110441) (not b!893795) (not d!110447) (not d!110409) (not b!893769) (not b!893637) (not d!110413) (not d!110449) (not d!110437) (not d!110377) (not b!893678) (not b!893805) (not b!893722) (not b!893781) (not b!893791) (not b_lambda!12917) (not d!110393) (not b!893704) (not d!110373) (not d!110397) (not d!110431) (not d!110405) (not d!110359) (not d!110439) (not bm!39655) (not b!893709) (not b!893809) (not d!110455) (not b!893720) (not d!110361) (not b!893710) (not d!110433) (not b!893707) (not b!893677) (not b!893672) (not b!893697) (not d!110375) (not b!893814) (not b!893680) (not d!110351) (not b!893786) (not b!893784) (not d!110417) (not d!110423) (not b!893774) (not b_next!15855) (not b!893726) (not b!893699) (not d!110421) (not b!893696) (not d!110445) (not d!110429) (not b_lambda!12921) (not d!110425) (not b!893811) (not b!893780) (not b!893741) (not b!893670) (not d!110435) (not d!110461) (not b!893712) (not b!893721) (not b!893793) (not b!893783) (not b!893724) (not b!893702) (not b!893823) (not d!110395) (not bm!39658) (not b!893798) (not b!893807) (not b!893671) (not bm!39659) (not b!893675) (not b!893799) (not mapNonEmpty!28843) (not d!110415) (not b_lambda!12929) (not b!893788) (not b!893706) (not bm!39656) (not b!893690) (not d!110427) (not b!893787) (not d!110387) (not b!893684) (not d!110363) (not d!110379))
(check-sat b_and!26131 (not b_next!15855))
