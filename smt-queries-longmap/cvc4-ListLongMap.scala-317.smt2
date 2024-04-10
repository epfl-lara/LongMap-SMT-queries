; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5696 () Bool)

(assert start!5696)

(declare-fun b_free!1367 () Bool)

(declare-fun b_next!1367 () Bool)

(assert (=> start!5696 (= b_free!1367 (not b_next!1367))))

(declare-fun tp!5738 () Bool)

(declare-fun b_and!2365 () Bool)

(assert (=> start!5696 (= tp!5738 b_and!2365)))

(declare-fun res!24049 () Bool)

(declare-fun e!25539 () Bool)

(assert (=> start!5696 (=> (not res!24049) (not e!25539))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5696 (= res!24049 (validMask!0 mask!853))))

(assert (=> start!5696 e!25539))

(assert (=> start!5696 true))

(assert (=> start!5696 tp!5738))

(declare-fun b!40263 () Bool)

(declare-fun e!25540 () Bool)

(assert (=> b!40263 (= e!25539 (not e!25540))))

(declare-fun res!24050 () Bool)

(assert (=> b!40263 (=> res!24050 e!25540)))

(declare-datatypes ((V!2101 0))(
  ( (V!2102 (val!917 Int)) )
))
(declare-datatypes ((tuple2!1488 0))(
  ( (tuple2!1489 (_1!755 (_ BitVec 64)) (_2!755 V!2101)) )
))
(declare-datatypes ((List!1056 0))(
  ( (Nil!1053) (Cons!1052 (h!1626 tuple2!1488) (t!3913 List!1056)) )
))
(declare-datatypes ((ListLongMap!1065 0))(
  ( (ListLongMap!1066 (toList!548 List!1056)) )
))
(declare-fun lt!15487 () ListLongMap!1065)

(assert (=> b!40263 (= res!24050 (= lt!15487 (ListLongMap!1066 Nil!1053)))))

(declare-datatypes ((array!2599 0))(
  ( (array!2600 (arr!1243 (Array (_ BitVec 32) (_ BitVec 64))) (size!1380 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!631 0))(
  ( (ValueCellFull!631 (v!1995 V!2101)) (EmptyCell!631) )
))
(declare-datatypes ((array!2601 0))(
  ( (array!2602 (arr!1244 (Array (_ BitVec 32) ValueCell!631)) (size!1381 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!242 0))(
  ( (LongMapFixedSize!243 (defaultEntry!1805 Int) (mask!5178 (_ BitVec 32)) (extraKeys!1696 (_ BitVec 32)) (zeroValue!1723 V!2101) (minValue!1723 V!2101) (_size!170 (_ BitVec 32)) (_keys!3294 array!2599) (_values!1788 array!2601) (_vacant!170 (_ BitVec 32))) )
))
(declare-fun lt!15483 () LongMapFixedSize!242)

(declare-fun map!691 (LongMapFixedSize!242) ListLongMap!1065)

(assert (=> b!40263 (= lt!15487 (map!691 lt!15483))))

(declare-fun lt!15486 () array!2599)

(declare-datatypes ((List!1057 0))(
  ( (Nil!1054) (Cons!1053 (h!1627 (_ BitVec 64)) (t!3914 List!1057)) )
))
(declare-fun arrayNoDuplicates!0 (array!2599 (_ BitVec 32) List!1057) Bool)

(assert (=> b!40263 (arrayNoDuplicates!0 lt!15486 #b00000000000000000000000000000000 Nil!1054)))

(declare-datatypes ((Unit!985 0))(
  ( (Unit!986) )
))
(declare-fun lt!15485 () Unit!985)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2599 (_ BitVec 32) (_ BitVec 32) List!1057) Unit!985)

(assert (=> b!40263 (= lt!15485 (lemmaArrayNoDuplicatesInAll0Array!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2599 (_ BitVec 32)) Bool)

(assert (=> b!40263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15486 mask!853)))

(declare-fun lt!15484 () Unit!985)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2599 (_ BitVec 32) (_ BitVec 32)) Unit!985)

(assert (=> b!40263 (= lt!15484 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15486 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2599 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40263 (= (arrayCountValidKeys!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15482 () Unit!985)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2599 (_ BitVec 32) (_ BitVec 32)) Unit!985)

(assert (=> b!40263 (= lt!15482 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun lt!15488 () V!2101)

(declare-fun defaultEntry!470 () Int)

(assert (=> b!40263 (= lt!15483 (LongMapFixedSize!243 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!15488 lt!15488 #b00000000000000000000000000000000 lt!15486 (array!2602 ((as const (Array (_ BitVec 32) ValueCell!631)) EmptyCell!631) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!40263 (= lt!15486 (array!2600 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!192 (Int (_ BitVec 64)) V!2101)

(assert (=> b!40263 (= lt!15488 (dynLambda!192 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40264 () Bool)

(declare-fun res!24051 () Bool)

(assert (=> b!40264 (=> res!24051 e!25540)))

(declare-fun isEmpty!231 (List!1056) Bool)

(assert (=> b!40264 (= res!24051 (isEmpty!231 (toList!548 lt!15487)))))

(declare-fun b!40265 () Bool)

(declare-fun valid!120 (LongMapFixedSize!242) Bool)

(assert (=> b!40265 (= e!25540 (valid!120 lt!15483))))

(assert (= (and start!5696 res!24049) b!40263))

(assert (= (and b!40263 (not res!24050)) b!40264))

(assert (= (and b!40264 (not res!24051)) b!40265))

(declare-fun b_lambda!2061 () Bool)

(assert (=> (not b_lambda!2061) (not b!40263)))

(declare-fun t!3912 () Bool)

(declare-fun tb!843 () Bool)

(assert (=> (and start!5696 (= defaultEntry!470 defaultEntry!470) t!3912) tb!843))

(declare-fun result!1443 () Bool)

(declare-fun tp_is_empty!1757 () Bool)

(assert (=> tb!843 (= result!1443 tp_is_empty!1757)))

(assert (=> b!40263 t!3912))

(declare-fun b_and!2367 () Bool)

(assert (= b_and!2365 (and (=> t!3912 result!1443) b_and!2367)))

(declare-fun m!33225 () Bool)

(assert (=> start!5696 m!33225))

(declare-fun m!33227 () Bool)

(assert (=> b!40263 m!33227))

(declare-fun m!33229 () Bool)

(assert (=> b!40263 m!33229))

(declare-fun m!33231 () Bool)

(assert (=> b!40263 m!33231))

(declare-fun m!33233 () Bool)

(assert (=> b!40263 m!33233))

(declare-fun m!33235 () Bool)

(assert (=> b!40263 m!33235))

(declare-fun m!33237 () Bool)

(assert (=> b!40263 m!33237))

(declare-fun m!33239 () Bool)

(assert (=> b!40263 m!33239))

(declare-fun m!33241 () Bool)

(assert (=> b!40263 m!33241))

(declare-fun m!33243 () Bool)

(assert (=> b!40264 m!33243))

(declare-fun m!33245 () Bool)

(assert (=> b!40265 m!33245))

(push 1)

(assert (not b_lambda!2061))

(assert (not b!40265))

(assert (not b!40263))

(assert (not start!5696))

(assert (not b_next!1367))

(assert tp_is_empty!1757)

(assert b_and!2367)

(assert (not b!40264))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2367)

(assert (not b_next!1367))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2065 () Bool)

(assert (= b_lambda!2061 (or (and start!5696 b_free!1367) b_lambda!2065)))

(push 1)

(assert (not b!40265))

(assert (not b!40263))

(assert (not start!5696))

(assert (not b_next!1367))

(assert (not b_lambda!2065))

(assert tp_is_empty!1757)

(assert b_and!2367)

(assert (not b!40264))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2367)

(assert (not b_next!1367))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6977 () Bool)

(declare-fun res!24058 () Bool)

(declare-fun e!25543 () Bool)

(assert (=> d!6977 (=> (not res!24058) (not e!25543))))

(declare-fun simpleValid!28 (LongMapFixedSize!242) Bool)

(assert (=> d!6977 (= res!24058 (simpleValid!28 lt!15483))))

(assert (=> d!6977 (= (valid!120 lt!15483) e!25543)))

(declare-fun b!40274 () Bool)

(declare-fun res!24059 () Bool)

(assert (=> b!40274 (=> (not res!24059) (not e!25543))))

(assert (=> b!40274 (= res!24059 (= (arrayCountValidKeys!0 (_keys!3294 lt!15483) #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))) (_size!170 lt!15483)))))

(declare-fun b!40275 () Bool)

(declare-fun res!24060 () Bool)

(assert (=> b!40275 (=> (not res!24060) (not e!25543))))

(assert (=> b!40275 (= res!24060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3294 lt!15483) (mask!5178 lt!15483)))))

(declare-fun b!40276 () Bool)

(assert (=> b!40276 (= e!25543 (arrayNoDuplicates!0 (_keys!3294 lt!15483) #b00000000000000000000000000000000 Nil!1054))))

(assert (= (and d!6977 res!24058) b!40274))

(assert (= (and b!40274 res!24059) b!40275))

(assert (= (and b!40275 res!24060) b!40276))

(declare-fun m!33247 () Bool)

(assert (=> d!6977 m!33247))

(declare-fun m!33249 () Bool)

(assert (=> b!40274 m!33249))

(declare-fun m!33251 () Bool)

(assert (=> b!40275 m!33251))

(declare-fun m!33253 () Bool)

(assert (=> b!40276 m!33253))

(assert (=> b!40265 d!6977))

(declare-fun b!40302 () Bool)

(declare-fun e!25558 () Bool)

(declare-fun e!25557 () Bool)

(assert (=> b!40302 (= e!25558 e!25557)))

(declare-fun c!4902 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!40302 (= c!4902 (validKeyInArray!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun bm!3100 () Bool)

(declare-fun call!3103 () Bool)

(assert (=> bm!3100 (= call!3103 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15486 mask!853))))

(declare-fun b!40303 () Bool)

(assert (=> b!40303 (= e!25557 call!3103)))

(declare-fun b!40304 () Bool)

(declare-fun e!25559 () Bool)

(assert (=> b!40304 (= e!25557 e!25559)))

(declare-fun lt!15500 () (_ BitVec 64))

(assert (=> b!40304 (= lt!15500 (select (arr!1243 lt!15486) #b00000000000000000000000000000000))))

(declare-fun lt!15502 () Unit!985)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2599 (_ BitVec 64) (_ BitVec 32)) Unit!985)

(assert (=> b!40304 (= lt!15502 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15486 lt!15500 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!40304 (arrayContainsKey!0 lt!15486 lt!15500 #b00000000000000000000000000000000)))

(declare-fun lt!15501 () Unit!985)

(assert (=> b!40304 (= lt!15501 lt!15502)))

(declare-fun res!24075 () Bool)

(declare-datatypes ((SeekEntryResult!172 0))(
  ( (MissingZero!172 (index!2810 (_ BitVec 32))) (Found!172 (index!2811 (_ BitVec 32))) (Intermediate!172 (undefined!984 Bool) (index!2812 (_ BitVec 32)) (x!7719 (_ BitVec 32))) (Undefined!172) (MissingVacant!172 (index!2813 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2599 (_ BitVec 32)) SeekEntryResult!172)

(assert (=> b!40304 (= res!24075 (= (seekEntryOrOpen!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) lt!15486 mask!853) (Found!172 #b00000000000000000000000000000000)))))

(assert (=> b!40304 (=> (not res!24075) (not e!25559))))

(declare-fun b!40305 () Bool)

(assert (=> b!40305 (= e!25559 call!3103)))

(declare-fun d!6981 () Bool)

(declare-fun res!24074 () Bool)

(assert (=> d!6981 (=> res!24074 e!25558)))

(assert (=> d!6981 (= res!24074 (bvsge #b00000000000000000000000000000000 (size!1380 lt!15486)))))

(assert (=> d!6981 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15486 mask!853) e!25558)))

(assert (= (and d!6981 (not res!24074)) b!40302))

(assert (= (and b!40302 c!4902) b!40304))

(assert (= (and b!40302 (not c!4902)) b!40303))

(assert (= (and b!40304 res!24075) b!40305))

(assert (= (or b!40305 b!40303) bm!3100))

(declare-fun m!33267 () Bool)

(assert (=> b!40302 m!33267))

(assert (=> b!40302 m!33267))

(declare-fun m!33271 () Bool)

(assert (=> b!40302 m!33271))

(declare-fun m!33275 () Bool)

(assert (=> bm!3100 m!33275))

(assert (=> b!40304 m!33267))

(declare-fun m!33277 () Bool)

(assert (=> b!40304 m!33277))

(declare-fun m!33279 () Bool)

(assert (=> b!40304 m!33279))

(assert (=> b!40304 m!33267))

(declare-fun m!33281 () Bool)

(assert (=> b!40304 m!33281))

(assert (=> b!40263 d!6981))

(declare-fun d!6991 () Bool)

(declare-fun getCurrentListMap!311 (array!2599 array!2601 (_ BitVec 32) (_ BitVec 32) V!2101 V!2101 (_ BitVec 32) Int) ListLongMap!1065)

(assert (=> d!6991 (= (map!691 lt!15483) (getCurrentListMap!311 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)))))

(declare-fun bs!1695 () Bool)

(assert (= bs!1695 d!6991))

(declare-fun m!33293 () Bool)

(assert (=> bs!1695 m!33293))

(assert (=> b!40263 d!6991))

(declare-fun d!6997 () Bool)

(assert (=> d!6997 (arrayNoDuplicates!0 lt!15486 #b00000000000000000000000000000000 Nil!1054)))

(declare-fun lt!15511 () Unit!985)

(declare-fun choose!111 (array!2599 (_ BitVec 32) (_ BitVec 32) List!1057) Unit!985)

(assert (=> d!6997 (= lt!15511 (choose!111 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1054))))

(assert (=> d!6997 (= (size!1380 lt!15486) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6997 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1054) lt!15511)))

(declare-fun bs!1696 () Bool)

(assert (= bs!1696 d!6997))

(assert (=> bs!1696 m!33231))

(declare-fun m!33299 () Bool)

(assert (=> bs!1696 m!33299))

(assert (=> b!40263 d!6997))

(declare-fun d!7001 () Bool)

(assert (=> d!7001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15486 mask!853)))

(declare-fun lt!15518 () Unit!985)

(declare-fun choose!34 (array!2599 (_ BitVec 32) (_ BitVec 32)) Unit!985)

(assert (=> d!7001 (= lt!15518 (choose!34 lt!15486 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7001 (validMask!0 mask!853)))

(assert (=> d!7001 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15486 mask!853 #b00000000000000000000000000000000) lt!15518)))

(declare-fun bs!1698 () Bool)

(assert (= bs!1698 d!7001))

(assert (=> bs!1698 m!33227))

(declare-fun m!33305 () Bool)

(assert (=> bs!1698 m!33305))

(assert (=> bs!1698 m!33225))

(assert (=> b!40263 d!7001))

(declare-fun b!40360 () Bool)

(declare-fun e!25597 () (_ BitVec 32))

(assert (=> b!40360 (= e!25597 #b00000000000000000000000000000000)))

(declare-fun b!40361 () Bool)

(declare-fun e!25596 () (_ BitVec 32))

(declare-fun call!3116 () (_ BitVec 32))

(assert (=> b!40361 (= e!25596 call!3116)))

(declare-fun b!40362 () Bool)

(assert (=> b!40362 (= e!25597 e!25596)))

(declare-fun c!4921 () Bool)

(assert (=> b!40362 (= c!4921 (validKeyInArray!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun d!7007 () Bool)

(declare-fun lt!15521 () (_ BitVec 32))

(assert (=> d!7007 (and (bvsge lt!15521 #b00000000000000000000000000000000) (bvsle lt!15521 (bvsub (size!1380 lt!15486) #b00000000000000000000000000000000)))))

(assert (=> d!7007 (= lt!15521 e!25597)))

(declare-fun c!4922 () Bool)

(assert (=> d!7007 (= c!4922 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7007 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1380 lt!15486)))))

(assert (=> d!7007 (= (arrayCountValidKeys!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15521)))

(declare-fun b!40363 () Bool)

(assert (=> b!40363 (= e!25596 (bvadd #b00000000000000000000000000000001 call!3116))))

(declare-fun bm!3113 () Bool)

(assert (=> bm!3113 (= call!3116 (arrayCountValidKeys!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7007 c!4922) b!40360))

(assert (= (and d!7007 (not c!4922)) b!40362))

(assert (= (and b!40362 c!4921) b!40363))

(assert (= (and b!40362 (not c!4921)) b!40361))

(assert (= (or b!40363 b!40361) bm!3113))

(assert (=> b!40362 m!33267))

(assert (=> b!40362 m!33267))

(assert (=> b!40362 m!33271))

(declare-fun m!33311 () Bool)

(assert (=> bm!3113 m!33311))

(assert (=> b!40263 d!7007))

(declare-fun d!7013 () Bool)

(assert (=> d!7013 (= (arrayCountValidKeys!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15526 () Unit!985)

(declare-fun choose!59 (array!2599 (_ BitVec 32) (_ BitVec 32)) Unit!985)

(assert (=> d!7013 (= lt!15526 (choose!59 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7013 (bvslt (size!1380 lt!15486) #b01111111111111111111111111111111)))

(assert (=> d!7013 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15526)))

(declare-fun bs!1701 () Bool)

(assert (= bs!1701 d!7013))

(assert (=> bs!1701 m!33239))

(declare-fun m!33313 () Bool)

(assert (=> bs!1701 m!33313))

(assert (=> b!40263 d!7013))

(declare-fun b!40392 () Bool)

(declare-fun e!25620 () Bool)

(declare-fun call!3122 () Bool)

(assert (=> b!40392 (= e!25620 call!3122)))

(declare-fun b!40393 () Bool)

(declare-fun e!25621 () Bool)

(declare-fun contains!513 (List!1057 (_ BitVec 64)) Bool)

(assert (=> b!40393 (= e!25621 (contains!513 Nil!1054 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun b!40394 () Bool)

(declare-fun e!25622 () Bool)

(declare-fun e!25619 () Bool)

(assert (=> b!40394 (= e!25622 e!25619)))

(declare-fun res!24108 () Bool)

(assert (=> b!40394 (=> (not res!24108) (not e!25619))))

(assert (=> b!40394 (= res!24108 (not e!25621))))

(declare-fun res!24110 () Bool)

(assert (=> b!40394 (=> (not res!24110) (not e!25621))))

(assert (=> b!40394 (= res!24110 (validKeyInArray!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun d!7015 () Bool)

(declare-fun res!24109 () Bool)

(assert (=> d!7015 (=> res!24109 e!25622)))

(assert (=> d!7015 (= res!24109 (bvsge #b00000000000000000000000000000000 (size!1380 lt!15486)))))

(assert (=> d!7015 (= (arrayNoDuplicates!0 lt!15486 #b00000000000000000000000000000000 Nil!1054) e!25622)))

(declare-fun b!40395 () Bool)

(assert (=> b!40395 (= e!25619 e!25620)))

(declare-fun c!4930 () Bool)

(assert (=> b!40395 (= c!4930 (validKeyInArray!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun b!40396 () Bool)

(assert (=> b!40396 (= e!25620 call!3122)))

(declare-fun bm!3119 () Bool)

(assert (=> bm!3119 (= call!3122 (arrayNoDuplicates!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)))))

(assert (= (and d!7015 (not res!24109)) b!40394))

(assert (= (and b!40394 res!24110) b!40393))

(assert (= (and b!40394 res!24108) b!40395))

(assert (= (and b!40395 c!4930) b!40396))

(assert (= (and b!40395 (not c!4930)) b!40392))

(assert (= (or b!40396 b!40392) bm!3119))

(assert (=> b!40393 m!33267))

(assert (=> b!40393 m!33267))

(declare-fun m!33325 () Bool)

(assert (=> b!40393 m!33325))

(assert (=> b!40394 m!33267))

(assert (=> b!40394 m!33267))

(assert (=> b!40394 m!33271))

(assert (=> b!40395 m!33267))

(assert (=> b!40395 m!33267))

(assert (=> b!40395 m!33271))

(assert (=> bm!3119 m!33267))

(declare-fun m!33327 () Bool)

(assert (=> bm!3119 m!33327))

(assert (=> b!40263 d!7015))

(declare-fun d!7021 () Bool)

(assert (=> d!7021 (= (isEmpty!231 (toList!548 lt!15487)) (is-Nil!1053 (toList!548 lt!15487)))))

(assert (=> b!40264 d!7021))

(declare-fun d!7025 () Bool)

(assert (=> d!7025 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5696 d!7025))

(push 1)

(assert (not b!40275))

(assert (not b!40276))

(assert (not d!6977))

(assert (not bm!3100))

(assert (not b_next!1367))

(assert (not b!40302))

(assert tp_is_empty!1757)

(assert (not bm!3113))

(assert (not d!7013))

(assert (not b!40362))

(assert (not d!6991))

(assert (not d!6997))

(assert b_and!2367)

(assert (not b!40274))

(assert (not bm!3119))

(assert (not b!40395))

(assert (not b!40304))

(assert (not d!7001))

(assert (not b!40394))

(assert (not b_lambda!2065))

(assert (not b!40393))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2367)

(assert (not b_next!1367))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!40429 () Bool)

(declare-fun e!25644 () Bool)

(declare-fun e!25643 () Bool)

(assert (=> b!40429 (= e!25644 e!25643)))

(declare-fun c!4937 () Bool)

(assert (=> b!40429 (= c!4937 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun bm!3127 () Bool)

(declare-fun call!3130 () Bool)

(assert (=> bm!3127 (= call!3130 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3294 lt!15483) (mask!5178 lt!15483)))))

(declare-fun b!40430 () Bool)

(assert (=> b!40430 (= e!25643 call!3130)))

(declare-fun b!40431 () Bool)

(declare-fun e!25645 () Bool)

(assert (=> b!40431 (= e!25643 e!25645)))

(declare-fun lt!15559 () (_ BitVec 64))

(assert (=> b!40431 (= lt!15559 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000))))

(declare-fun lt!15561 () Unit!985)

(assert (=> b!40431 (= lt!15561 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3294 lt!15483) lt!15559 #b00000000000000000000000000000000))))

(assert (=> b!40431 (arrayContainsKey!0 (_keys!3294 lt!15483) lt!15559 #b00000000000000000000000000000000)))

(declare-fun lt!15560 () Unit!985)

(assert (=> b!40431 (= lt!15560 lt!15561)))

(declare-fun res!24135 () Bool)

(assert (=> b!40431 (= res!24135 (= (seekEntryOrOpen!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) (_keys!3294 lt!15483) (mask!5178 lt!15483)) (Found!172 #b00000000000000000000000000000000)))))

(assert (=> b!40431 (=> (not res!24135) (not e!25645))))

(declare-fun b!40432 () Bool)

(assert (=> b!40432 (= e!25645 call!3130)))

(declare-fun d!7049 () Bool)

(declare-fun res!24134 () Bool)

(assert (=> d!7049 (=> res!24134 e!25644)))

(assert (=> d!7049 (= res!24134 (bvsge #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3294 lt!15483) (mask!5178 lt!15483)) e!25644)))

(assert (= (and d!7049 (not res!24134)) b!40429))

(assert (= (and b!40429 c!4937) b!40431))

(assert (= (and b!40429 (not c!4937)) b!40430))

(assert (= (and b!40431 res!24135) b!40432))

(assert (= (or b!40432 b!40430) bm!3127))

(declare-fun m!33383 () Bool)

(assert (=> b!40429 m!33383))

(assert (=> b!40429 m!33383))

(declare-fun m!33385 () Bool)

(assert (=> b!40429 m!33385))

(declare-fun m!33387 () Bool)

(assert (=> bm!3127 m!33387))

(assert (=> b!40431 m!33383))

(declare-fun m!33389 () Bool)

(assert (=> b!40431 m!33389))

(declare-fun m!33391 () Bool)

(assert (=> b!40431 m!33391))

(assert (=> b!40431 m!33383))

(declare-fun m!33393 () Bool)

(assert (=> b!40431 m!33393))

(assert (=> b!40275 d!7049))

(declare-fun b!40433 () Bool)

(declare-fun e!25647 () Bool)

(declare-fun call!3131 () Bool)

(assert (=> b!40433 (= e!25647 call!3131)))

(declare-fun b!40434 () Bool)

(declare-fun e!25648 () Bool)

(assert (=> b!40434 (= e!25648 (contains!513 Nil!1054 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun b!40435 () Bool)

(declare-fun e!25649 () Bool)

(declare-fun e!25646 () Bool)

(assert (=> b!40435 (= e!25649 e!25646)))

(declare-fun res!24136 () Bool)

(assert (=> b!40435 (=> (not res!24136) (not e!25646))))

(assert (=> b!40435 (= res!24136 (not e!25648))))

(declare-fun res!24138 () Bool)

(assert (=> b!40435 (=> (not res!24138) (not e!25648))))

(assert (=> b!40435 (= res!24138 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun d!7051 () Bool)

(declare-fun res!24137 () Bool)

(assert (=> d!7051 (=> res!24137 e!25649)))

(assert (=> d!7051 (= res!24137 (bvsge #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7051 (= (arrayNoDuplicates!0 (_keys!3294 lt!15483) #b00000000000000000000000000000000 Nil!1054) e!25649)))

(declare-fun b!40436 () Bool)

(assert (=> b!40436 (= e!25646 e!25647)))

(declare-fun c!4938 () Bool)

(assert (=> b!40436 (= c!4938 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun b!40437 () Bool)

(assert (=> b!40437 (= e!25647 call!3131)))

(declare-fun bm!3128 () Bool)

(assert (=> bm!3128 (= call!3131 (arrayNoDuplicates!0 (_keys!3294 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4938 (Cons!1053 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) Nil!1054) Nil!1054)))))

(assert (= (and d!7051 (not res!24137)) b!40435))

(assert (= (and b!40435 res!24138) b!40434))

(assert (= (and b!40435 res!24136) b!40436))

(assert (= (and b!40436 c!4938) b!40437))

(assert (= (and b!40436 (not c!4938)) b!40433))

(assert (= (or b!40437 b!40433) bm!3128))

(assert (=> b!40434 m!33383))

(assert (=> b!40434 m!33383))

(declare-fun m!33395 () Bool)

(assert (=> b!40434 m!33395))

(assert (=> b!40435 m!33383))

(assert (=> b!40435 m!33383))

(assert (=> b!40435 m!33385))

(assert (=> b!40436 m!33383))

(assert (=> b!40436 m!33383))

(assert (=> b!40436 m!33385))

(assert (=> bm!3128 m!33383))

(declare-fun m!33397 () Bool)

(assert (=> bm!3128 m!33397))

(assert (=> b!40276 d!7051))

(declare-fun d!7053 () Bool)

(assert (=> d!7053 (= (validKeyInArray!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)) (and (not (= (select (arr!1243 lt!15486) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1243 lt!15486) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40362 d!7053))

(assert (=> d!7013 d!7007))

(declare-fun d!7055 () Bool)

(assert (=> d!7055 (= (arrayCountValidKeys!0 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!7055 true))

(declare-fun _$88!40 () Unit!985)

(assert (=> d!7055 (= (choose!59 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!40)))

(declare-fun bs!1707 () Bool)

(assert (= bs!1707 d!7055))

(assert (=> bs!1707 m!33239))

(assert (=> d!7013 d!7055))

(declare-fun b!40653 () Bool)

(declare-fun e!25787 () Bool)

(declare-fun lt!15763 () ListLongMap!1065)

(declare-fun apply!57 (ListLongMap!1065 (_ BitVec 64)) V!2101)

(assert (=> b!40653 (= e!25787 (= (apply!57 lt!15763 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1723 lt!15483)))))

(declare-fun b!40654 () Bool)

(declare-fun e!25797 () ListLongMap!1065)

(declare-fun call!3195 () ListLongMap!1065)

(assert (=> b!40654 (= e!25797 call!3195)))

(declare-fun b!40655 () Bool)

(declare-fun call!3194 () ListLongMap!1065)

(assert (=> b!40655 (= e!25797 call!3194)))

(declare-fun b!40656 () Bool)

(declare-fun e!25789 () ListLongMap!1065)

(declare-fun call!3197 () ListLongMap!1065)

(declare-fun +!66 (ListLongMap!1065 tuple2!1488) ListLongMap!1065)

(assert (=> b!40656 (= e!25789 (+!66 call!3197 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))))

(declare-fun b!40657 () Bool)

(declare-fun res!24248 () Bool)

(declare-fun e!25795 () Bool)

(assert (=> b!40657 (=> (not res!24248) (not e!25795))))

(declare-fun e!25790 () Bool)

(assert (=> b!40657 (= res!24248 e!25790)))

(declare-fun res!24251 () Bool)

(assert (=> b!40657 (=> res!24251 e!25790)))

(declare-fun e!25791 () Bool)

(assert (=> b!40657 (= res!24251 (not e!25791))))

(declare-fun res!24249 () Bool)

(assert (=> b!40657 (=> (not res!24249) (not e!25791))))

(assert (=> b!40657 (= res!24249 (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(declare-fun b!40658 () Bool)

(declare-fun e!25788 () Bool)

(declare-fun get!703 (ValueCell!631 V!2101) V!2101)

(assert (=> b!40658 (= e!25788 (= (apply!57 lt!15763 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)) (get!703 (select (arr!1244 (_values!1788 lt!15483)) #b00000000000000000000000000000000) (dynLambda!192 (defaultEntry!1805 lt!15483) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1381 (_values!1788 lt!15483))))))

(assert (=> b!40658 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(declare-fun b!40659 () Bool)

(declare-fun e!25792 () ListLongMap!1065)

(assert (=> b!40659 (= e!25792 call!3194)))

(declare-fun b!40660 () Bool)

(declare-fun e!25799 () Bool)

(assert (=> b!40660 (= e!25799 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun b!40661 () Bool)

(declare-fun e!25796 () Unit!985)

(declare-fun lt!15757 () Unit!985)

(assert (=> b!40661 (= e!25796 lt!15757)))

(declare-fun lt!15765 () ListLongMap!1065)

(declare-fun getCurrentListMapNoExtraKeys!35 (array!2599 array!2601 (_ BitVec 32) (_ BitVec 32) V!2101 V!2101 (_ BitVec 32) Int) ListLongMap!1065)

(assert (=> b!40661 (= lt!15765 (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)))))

(declare-fun lt!15770 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15770 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15756 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15756 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000))))

(declare-fun lt!15773 () Unit!985)

(declare-fun addStillContains!33 (ListLongMap!1065 (_ BitVec 64) V!2101 (_ BitVec 64)) Unit!985)

(assert (=> b!40661 (= lt!15773 (addStillContains!33 lt!15765 lt!15770 (zeroValue!1723 lt!15483) lt!15756))))

(declare-fun contains!516 (ListLongMap!1065 (_ BitVec 64)) Bool)

(assert (=> b!40661 (contains!516 (+!66 lt!15765 (tuple2!1489 lt!15770 (zeroValue!1723 lt!15483))) lt!15756)))

(declare-fun lt!15768 () Unit!985)

(assert (=> b!40661 (= lt!15768 lt!15773)))

(declare-fun lt!15759 () ListLongMap!1065)

(assert (=> b!40661 (= lt!15759 (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)))))

(declare-fun lt!15764 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15764 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15767 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15767 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000))))

(declare-fun lt!15760 () Unit!985)

(declare-fun addApplyDifferent!33 (ListLongMap!1065 (_ BitVec 64) V!2101 (_ BitVec 64)) Unit!985)

(assert (=> b!40661 (= lt!15760 (addApplyDifferent!33 lt!15759 lt!15764 (minValue!1723 lt!15483) lt!15767))))

(assert (=> b!40661 (= (apply!57 (+!66 lt!15759 (tuple2!1489 lt!15764 (minValue!1723 lt!15483))) lt!15767) (apply!57 lt!15759 lt!15767))))

(declare-fun lt!15774 () Unit!985)

(assert (=> b!40661 (= lt!15774 lt!15760)))

(declare-fun lt!15755 () ListLongMap!1065)

(assert (=> b!40661 (= lt!15755 (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)))))

(declare-fun lt!15766 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15772 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15772 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000))))

(declare-fun lt!15758 () Unit!985)

(assert (=> b!40661 (= lt!15758 (addApplyDifferent!33 lt!15755 lt!15766 (zeroValue!1723 lt!15483) lt!15772))))

(assert (=> b!40661 (= (apply!57 (+!66 lt!15755 (tuple2!1489 lt!15766 (zeroValue!1723 lt!15483))) lt!15772) (apply!57 lt!15755 lt!15772))))

(declare-fun lt!15762 () Unit!985)

(assert (=> b!40661 (= lt!15762 lt!15758)))

(declare-fun lt!15754 () ListLongMap!1065)

(assert (=> b!40661 (= lt!15754 (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)))))

(declare-fun lt!15771 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15775 () (_ BitVec 64))

(assert (=> b!40661 (= lt!15775 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000))))

(assert (=> b!40661 (= lt!15757 (addApplyDifferent!33 lt!15754 lt!15771 (minValue!1723 lt!15483) lt!15775))))

(assert (=> b!40661 (= (apply!57 (+!66 lt!15754 (tuple2!1489 lt!15771 (minValue!1723 lt!15483))) lt!15775) (apply!57 lt!15754 lt!15775))))

(declare-fun b!40662 () Bool)

(declare-fun e!25794 () Bool)

(assert (=> b!40662 (= e!25794 e!25787)))

(declare-fun res!24255 () Bool)

(declare-fun call!3196 () Bool)

(assert (=> b!40662 (= res!24255 call!3196)))

(assert (=> b!40662 (=> (not res!24255) (not e!25787))))

(declare-fun b!40663 () Bool)

(assert (=> b!40663 (= e!25795 e!25794)))

(declare-fun c!4993 () Bool)

(assert (=> b!40663 (= c!4993 (not (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40664 () Bool)

(assert (=> b!40664 (= e!25789 e!25792)))

(declare-fun c!4997 () Bool)

(assert (=> b!40664 (= c!4997 (and (not (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40665 () Bool)

(declare-fun e!25798 () Bool)

(declare-fun e!25793 () Bool)

(assert (=> b!40665 (= e!25798 e!25793)))

(declare-fun res!24250 () Bool)

(declare-fun call!3192 () Bool)

(assert (=> b!40665 (= res!24250 call!3192)))

(assert (=> b!40665 (=> (not res!24250) (not e!25793))))

(declare-fun b!40666 () Bool)

(assert (=> b!40666 (= e!25791 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun b!40667 () Bool)

(assert (=> b!40667 (= e!25790 e!25788)))

(declare-fun res!24254 () Bool)

(assert (=> b!40667 (=> (not res!24254) (not e!25788))))

(assert (=> b!40667 (= res!24254 (contains!516 lt!15763 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(assert (=> b!40667 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(declare-fun b!40668 () Bool)

(assert (=> b!40668 (= e!25798 (not call!3192))))

(declare-fun b!40669 () Bool)

(assert (=> b!40669 (= e!25794 (not call!3196))))

(declare-fun bm!3190 () Bool)

(declare-fun call!3198 () ListLongMap!1065)

(declare-fun call!3193 () ListLongMap!1065)

(assert (=> bm!3190 (= call!3198 call!3193)))

(declare-fun bm!3189 () Bool)

(assert (=> bm!3189 (= call!3195 call!3198)))

(declare-fun d!7057 () Bool)

(assert (=> d!7057 e!25795))

(declare-fun res!24256 () Bool)

(assert (=> d!7057 (=> (not res!24256) (not e!25795))))

(assert (=> d!7057 (= res!24256 (or (bvsge #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))))

(declare-fun lt!15761 () ListLongMap!1065)

(assert (=> d!7057 (= lt!15763 lt!15761)))

(declare-fun lt!15769 () Unit!985)

(assert (=> d!7057 (= lt!15769 e!25796)))

(declare-fun c!4992 () Bool)

(assert (=> d!7057 (= c!4992 e!25799)))

(declare-fun res!24252 () Bool)

(assert (=> d!7057 (=> (not res!24252) (not e!25799))))

(assert (=> d!7057 (= res!24252 (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7057 (= lt!15761 e!25789)))

(declare-fun c!4996 () Bool)

(assert (=> d!7057 (= c!4996 (and (not (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7057 (validMask!0 (mask!5178 lt!15483))))

(assert (=> d!7057 (= (getCurrentListMap!311 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)) lt!15763)))

(declare-fun b!40670 () Bool)

(declare-fun Unit!989 () Unit!985)

(assert (=> b!40670 (= e!25796 Unit!989)))

(declare-fun bm!3191 () Bool)

(assert (=> bm!3191 (= call!3192 (contains!516 lt!15763 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3192 () Bool)

(assert (=> bm!3192 (= call!3194 call!3197)))

(declare-fun bm!3193 () Bool)

(assert (=> bm!3193 (= call!3197 (+!66 (ite c!4996 call!3193 (ite c!4997 call!3198 call!3195)) (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))))))

(declare-fun b!40671 () Bool)

(declare-fun c!4994 () Bool)

(assert (=> b!40671 (= c!4994 (and (not (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!40671 (= e!25792 e!25797)))

(declare-fun b!40672 () Bool)

(declare-fun res!24253 () Bool)

(assert (=> b!40672 (=> (not res!24253) (not e!25795))))

(assert (=> b!40672 (= res!24253 e!25798)))

(declare-fun c!4995 () Bool)

(assert (=> b!40672 (= c!4995 (not (= (bvand (extraKeys!1696 lt!15483) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!3194 () Bool)

(assert (=> bm!3194 (= call!3193 (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)))))

(declare-fun b!40673 () Bool)

(assert (=> b!40673 (= e!25793 (= (apply!57 lt!15763 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1723 lt!15483)))))

(declare-fun bm!3195 () Bool)

(assert (=> bm!3195 (= call!3196 (contains!516 lt!15763 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7057 c!4996) b!40656))

(assert (= (and d!7057 (not c!4996)) b!40664))

(assert (= (and b!40664 c!4997) b!40659))

(assert (= (and b!40664 (not c!4997)) b!40671))

(assert (= (and b!40671 c!4994) b!40655))

(assert (= (and b!40671 (not c!4994)) b!40654))

(assert (= (or b!40655 b!40654) bm!3189))

(assert (= (or b!40659 bm!3189) bm!3190))

(assert (= (or b!40659 b!40655) bm!3192))

(assert (= (or b!40656 bm!3190) bm!3194))

(assert (= (or b!40656 bm!3192) bm!3193))

(assert (= (and d!7057 res!24252) b!40660))

(assert (= (and d!7057 c!4992) b!40661))

(assert (= (and d!7057 (not c!4992)) b!40670))

(assert (= (and d!7057 res!24256) b!40657))

(assert (= (and b!40657 res!24249) b!40666))

(assert (= (and b!40657 (not res!24251)) b!40667))

(assert (= (and b!40667 res!24254) b!40658))

(assert (= (and b!40657 res!24248) b!40672))

(assert (= (and b!40672 c!4995) b!40665))

(assert (= (and b!40672 (not c!4995)) b!40668))

(assert (= (and b!40665 res!24250) b!40673))

(assert (= (or b!40665 b!40668) bm!3191))

(assert (= (and b!40672 res!24253) b!40663))

(assert (= (and b!40663 c!4993) b!40662))

(assert (= (and b!40663 (not c!4993)) b!40669))

(assert (= (and b!40662 res!24255) b!40653))

(assert (= (or b!40662 b!40669) bm!3195))

(declare-fun b_lambda!2073 () Bool)

(assert (=> (not b_lambda!2073) (not b!40658)))

(declare-fun t!3920 () Bool)

(declare-fun tb!849 () Bool)

(assert (=> (and start!5696 (= defaultEntry!470 (defaultEntry!1805 lt!15483)) t!3920) tb!849))

(declare-fun result!1451 () Bool)

(assert (=> tb!849 (= result!1451 tp_is_empty!1757)))

(assert (=> b!40658 t!3920))

(declare-fun b_and!2373 () Bool)

(assert (= b_and!2367 (and (=> t!3920 result!1451) b_and!2373)))

(declare-fun m!33553 () Bool)

(assert (=> b!40656 m!33553))

(declare-fun m!33555 () Bool)

(assert (=> b!40653 m!33555))

(assert (=> b!40667 m!33383))

(assert (=> b!40667 m!33383))

(declare-fun m!33557 () Bool)

(assert (=> b!40667 m!33557))

(assert (=> b!40658 m!33383))

(declare-fun m!33559 () Bool)

(assert (=> b!40658 m!33559))

(declare-fun m!33561 () Bool)

(assert (=> b!40658 m!33561))

(declare-fun m!33563 () Bool)

(assert (=> b!40658 m!33563))

(assert (=> b!40658 m!33563))

(assert (=> b!40658 m!33561))

(declare-fun m!33565 () Bool)

(assert (=> b!40658 m!33565))

(assert (=> b!40658 m!33383))

(assert (=> b!40666 m!33383))

(assert (=> b!40666 m!33383))

(assert (=> b!40666 m!33385))

(declare-fun m!33567 () Bool)

(assert (=> bm!3194 m!33567))

(assert (=> b!40660 m!33383))

(assert (=> b!40660 m!33383))

(assert (=> b!40660 m!33385))

(declare-fun m!33569 () Bool)

(assert (=> bm!3191 m!33569))

(declare-fun m!33571 () Bool)

(assert (=> b!40661 m!33571))

(declare-fun m!33573 () Bool)

(assert (=> b!40661 m!33573))

(declare-fun m!33575 () Bool)

(assert (=> b!40661 m!33575))

(declare-fun m!33577 () Bool)

(assert (=> b!40661 m!33577))

(declare-fun m!33579 () Bool)

(assert (=> b!40661 m!33579))

(declare-fun m!33581 () Bool)

(assert (=> b!40661 m!33581))

(declare-fun m!33583 () Bool)

(assert (=> b!40661 m!33583))

(assert (=> b!40661 m!33583))

(declare-fun m!33585 () Bool)

(assert (=> b!40661 m!33585))

(declare-fun m!33587 () Bool)

(assert (=> b!40661 m!33587))

(assert (=> b!40661 m!33567))

(declare-fun m!33589 () Bool)

(assert (=> b!40661 m!33589))

(assert (=> b!40661 m!33571))

(declare-fun m!33591 () Bool)

(assert (=> b!40661 m!33591))

(declare-fun m!33593 () Bool)

(assert (=> b!40661 m!33593))

(assert (=> b!40661 m!33383))

(assert (=> b!40661 m!33591))

(declare-fun m!33595 () Bool)

(assert (=> b!40661 m!33595))

(declare-fun m!33597 () Bool)

(assert (=> b!40661 m!33597))

(assert (=> b!40661 m!33577))

(declare-fun m!33599 () Bool)

(assert (=> b!40661 m!33599))

(declare-fun m!33601 () Bool)

(assert (=> bm!3193 m!33601))

(declare-fun m!33603 () Bool)

(assert (=> bm!3195 m!33603))

(declare-fun m!33605 () Bool)

(assert (=> b!40673 m!33605))

(declare-fun m!33607 () Bool)

(assert (=> d!7057 m!33607))

(assert (=> d!6991 d!7057))

(declare-fun d!7089 () Bool)

(declare-fun res!24265 () Bool)

(declare-fun e!25808 () Bool)

(assert (=> d!7089 (=> (not res!24265) (not e!25808))))

(assert (=> d!7089 (= res!24265 (validMask!0 (mask!5178 lt!15483)))))

(assert (=> d!7089 (= (simpleValid!28 lt!15483) e!25808)))

(declare-fun b!40694 () Bool)

(declare-fun res!24266 () Bool)

(assert (=> b!40694 (=> (not res!24266) (not e!25808))))

(assert (=> b!40694 (= res!24266 (and (= (size!1381 (_values!1788 lt!15483)) (bvadd (mask!5178 lt!15483) #b00000000000000000000000000000001)) (= (size!1380 (_keys!3294 lt!15483)) (size!1381 (_values!1788 lt!15483))) (bvsge (_size!170 lt!15483) #b00000000000000000000000000000000) (bvsle (_size!170 lt!15483) (bvadd (mask!5178 lt!15483) #b00000000000000000000000000000001))))))

(declare-fun b!40696 () Bool)

(declare-fun res!24268 () Bool)

(assert (=> b!40696 (=> (not res!24268) (not e!25808))))

(declare-fun size!1396 (LongMapFixedSize!242) (_ BitVec 32))

(assert (=> b!40696 (= res!24268 (= (size!1396 lt!15483) (bvadd (_size!170 lt!15483) (bvsdiv (bvadd (extraKeys!1696 lt!15483) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!40695 () Bool)

(declare-fun res!24267 () Bool)

(assert (=> b!40695 (=> (not res!24267) (not e!25808))))

(assert (=> b!40695 (= res!24267 (bvsge (size!1396 lt!15483) (_size!170 lt!15483)))))

(declare-fun b!40697 () Bool)

(assert (=> b!40697 (= e!25808 (and (bvsge (extraKeys!1696 lt!15483) #b00000000000000000000000000000000) (bvsle (extraKeys!1696 lt!15483) #b00000000000000000000000000000011) (bvsge (_vacant!170 lt!15483) #b00000000000000000000000000000000)))))

(assert (= (and d!7089 res!24265) b!40694))

(assert (= (and b!40694 res!24266) b!40695))

(assert (= (and b!40695 res!24267) b!40696))

(assert (= (and b!40696 res!24268) b!40697))

(assert (=> d!7089 m!33607))

(declare-fun m!33609 () Bool)

(assert (=> b!40696 m!33609))

(assert (=> b!40695 m!33609))

(assert (=> d!6977 d!7089))

(declare-fun b!40698 () Bool)

(declare-fun e!25810 () (_ BitVec 32))

(assert (=> b!40698 (= e!25810 #b00000000000000000000000000000000)))

(declare-fun b!40699 () Bool)

(declare-fun e!25809 () (_ BitVec 32))

(declare-fun call!3199 () (_ BitVec 32))

(assert (=> b!40699 (= e!25809 call!3199)))

(declare-fun b!40700 () Bool)

(assert (=> b!40700 (= e!25810 e!25809)))

(declare-fun c!5004 () Bool)

(assert (=> b!40700 (= c!5004 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun d!7091 () Bool)

(declare-fun lt!15782 () (_ BitVec 32))

(assert (=> d!7091 (and (bvsge lt!15782 #b00000000000000000000000000000000) (bvsle lt!15782 (bvsub (size!1380 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(assert (=> d!7091 (= lt!15782 e!25810)))

(declare-fun c!5005 () Bool)

(assert (=> d!7091 (= c!5005 (bvsge #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7091 (and (bvsle #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1380 (_keys!3294 lt!15483)) (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7091 (= (arrayCountValidKeys!0 (_keys!3294 lt!15483) #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))) lt!15782)))

(declare-fun b!40701 () Bool)

(assert (=> b!40701 (= e!25809 (bvadd #b00000000000000000000000000000001 call!3199))))

(declare-fun bm!3196 () Bool)

(assert (=> bm!3196 (= call!3199 (arrayCountValidKeys!0 (_keys!3294 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 (_keys!3294 lt!15483))))))

(assert (= (and d!7091 c!5005) b!40698))

(assert (= (and d!7091 (not c!5005)) b!40700))

(assert (= (and b!40700 c!5004) b!40701))

(assert (= (and b!40700 (not c!5004)) b!40699))

(assert (= (or b!40701 b!40699) bm!3196))

(assert (=> b!40700 m!33383))

(assert (=> b!40700 m!33383))

(assert (=> b!40700 m!33385))

(declare-fun m!33611 () Bool)

(assert (=> bm!3196 m!33611))

(assert (=> b!40274 d!7091))

(declare-fun b!40702 () Bool)

(declare-fun e!25812 () Bool)

(declare-fun call!3200 () Bool)

(assert (=> b!40702 (= e!25812 call!3200)))

(declare-fun b!40703 () Bool)

(declare-fun e!25813 () Bool)

(assert (=> b!40703 (= e!25813 (contains!513 (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40704 () Bool)

(declare-fun e!25814 () Bool)

(declare-fun e!25811 () Bool)

(assert (=> b!40704 (= e!25814 e!25811)))

(declare-fun res!24269 () Bool)

(assert (=> b!40704 (=> (not res!24269) (not e!25811))))

(assert (=> b!40704 (= res!24269 (not e!25813))))

(declare-fun res!24271 () Bool)

(assert (=> b!40704 (=> (not res!24271) (not e!25813))))

(assert (=> b!40704 (= res!24271 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7093 () Bool)

(declare-fun res!24270 () Bool)

(assert (=> d!7093 (=> res!24270 e!25814)))

(assert (=> d!7093 (= res!24270 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 lt!15486)))))

(assert (=> d!7093 (= (arrayNoDuplicates!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) e!25814)))

(declare-fun b!40705 () Bool)

(assert (=> b!40705 (= e!25811 e!25812)))

(declare-fun c!5006 () Bool)

(assert (=> b!40705 (= c!5006 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40706 () Bool)

(assert (=> b!40706 (= e!25812 call!3200)))

(declare-fun bm!3197 () Bool)

(assert (=> bm!3197 (= call!3200 (arrayNoDuplicates!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5006 (Cons!1053 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054))))))

(assert (= (and d!7093 (not res!24270)) b!40704))

(assert (= (and b!40704 res!24271) b!40703))

(assert (= (and b!40704 res!24269) b!40705))

(assert (= (and b!40705 c!5006) b!40706))

(assert (= (and b!40705 (not c!5006)) b!40702))

(assert (= (or b!40706 b!40702) bm!3197))

(declare-fun m!33613 () Bool)

(assert (=> b!40703 m!33613))

(assert (=> b!40703 m!33613))

(declare-fun m!33615 () Bool)

(assert (=> b!40703 m!33615))

(assert (=> b!40704 m!33613))

(assert (=> b!40704 m!33613))

(declare-fun m!33617 () Bool)

(assert (=> b!40704 m!33617))

(assert (=> b!40705 m!33613))

(assert (=> b!40705 m!33613))

(assert (=> b!40705 m!33617))

(assert (=> bm!3197 m!33613))

(declare-fun m!33625 () Bool)

(assert (=> bm!3197 m!33625))

(assert (=> bm!3119 d!7093))

(declare-fun d!7095 () Bool)

(declare-fun lt!15794 () Bool)

(declare-fun content!32 (List!1057) (Set (_ BitVec 64)))

(assert (=> d!7095 (= lt!15794 (member (select (arr!1243 lt!15486) #b00000000000000000000000000000000) (content!32 Nil!1054)))))

(declare-fun e!25828 () Bool)

(assert (=> d!7095 (= lt!15794 e!25828)))

(declare-fun res!24277 () Bool)

(assert (=> d!7095 (=> (not res!24277) (not e!25828))))

(assert (=> d!7095 (= res!24277 (is-Cons!1053 Nil!1054))))

(assert (=> d!7095 (= (contains!513 Nil!1054 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)) lt!15794)))

(declare-fun b!40729 () Bool)

(declare-fun e!25829 () Bool)

(assert (=> b!40729 (= e!25828 e!25829)))

(declare-fun res!24276 () Bool)

(assert (=> b!40729 (=> res!24276 e!25829)))

(assert (=> b!40729 (= res!24276 (= (h!1627 Nil!1054) (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun b!40730 () Bool)

(assert (=> b!40730 (= e!25829 (contains!513 (t!3914 Nil!1054) (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(assert (= (and d!7095 res!24277) b!40729))

(assert (= (and b!40729 (not res!24276)) b!40730))

(declare-fun m!33635 () Bool)

(assert (=> d!7095 m!33635))

(assert (=> d!7095 m!33267))

(declare-fun m!33637 () Bool)

(assert (=> d!7095 m!33637))

(assert (=> b!40730 m!33267))

(declare-fun m!33639 () Bool)

(assert (=> b!40730 m!33639))

(assert (=> b!40393 d!7095))

(assert (=> d!7001 d!6981))

(declare-fun d!7101 () Bool)

(assert (=> d!7101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15486 mask!853)))

(assert (=> d!7101 true))

(declare-fun _$30!54 () Unit!985)

(assert (=> d!7101 (= (choose!34 lt!15486 mask!853 #b00000000000000000000000000000000) _$30!54)))

(declare-fun bs!1713 () Bool)

(assert (= bs!1713 d!7101))

(assert (=> bs!1713 m!33227))

(assert (=> d!7001 d!7101))

(assert (=> d!7001 d!7025))

(assert (=> b!40394 d!7053))

(declare-fun d!7113 () Bool)

(assert (=> d!7113 (arrayContainsKey!0 lt!15486 lt!15500 #b00000000000000000000000000000000)))

(declare-fun lt!15803 () Unit!985)

(declare-fun choose!13 (array!2599 (_ BitVec 64) (_ BitVec 32)) Unit!985)

(assert (=> d!7113 (= lt!15803 (choose!13 lt!15486 lt!15500 #b00000000000000000000000000000000))))

(assert (=> d!7113 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7113 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15486 lt!15500 #b00000000000000000000000000000000) lt!15803)))

(declare-fun bs!1714 () Bool)

(assert (= bs!1714 d!7113))

(assert (=> bs!1714 m!33279))

(declare-fun m!33665 () Bool)

(assert (=> bs!1714 m!33665))

(assert (=> b!40304 d!7113))

(declare-fun d!7115 () Bool)

(declare-fun res!24305 () Bool)

(declare-fun e!25855 () Bool)

(assert (=> d!7115 (=> res!24305 e!25855)))

(assert (=> d!7115 (= res!24305 (= (select (arr!1243 lt!15486) #b00000000000000000000000000000000) lt!15500))))

(assert (=> d!7115 (= (arrayContainsKey!0 lt!15486 lt!15500 #b00000000000000000000000000000000) e!25855)))

(declare-fun b!40769 () Bool)

(declare-fun e!25856 () Bool)

(assert (=> b!40769 (= e!25855 e!25856)))

(declare-fun res!24306 () Bool)

(assert (=> b!40769 (=> (not res!24306) (not e!25856))))

(assert (=> b!40769 (= res!24306 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 lt!15486)))))

(declare-fun b!40770 () Bool)

(assert (=> b!40770 (= e!25856 (arrayContainsKey!0 lt!15486 lt!15500 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7115 (not res!24305)) b!40769))

(assert (= (and b!40769 res!24306) b!40770))

(assert (=> d!7115 m!33267))

(declare-fun m!33673 () Bool)

(assert (=> b!40770 m!33673))

(assert (=> b!40304 d!7115))

(declare-fun lt!15814 () SeekEntryResult!172)

(declare-fun e!25866 () SeekEntryResult!172)

(declare-fun b!40791 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2599 (_ BitVec 32)) SeekEntryResult!172)

(assert (=> b!40791 (= e!25866 (seekKeyOrZeroReturnVacant!0 (x!7719 lt!15814) (index!2812 lt!15814) (index!2812 lt!15814) (select (arr!1243 lt!15486) #b00000000000000000000000000000000) lt!15486 mask!853))))

(declare-fun b!40792 () Bool)

(declare-fun e!25867 () SeekEntryResult!172)

(assert (=> b!40792 (= e!25867 Undefined!172)))

(declare-fun b!40793 () Bool)

(assert (=> b!40793 (= e!25866 (MissingZero!172 (index!2812 lt!15814)))))

(declare-fun d!7119 () Bool)

(declare-fun lt!15813 () SeekEntryResult!172)

(assert (=> d!7119 (and (or (is-Undefined!172 lt!15813) (not (is-Found!172 lt!15813)) (and (bvsge (index!2811 lt!15813) #b00000000000000000000000000000000) (bvslt (index!2811 lt!15813) (size!1380 lt!15486)))) (or (is-Undefined!172 lt!15813) (is-Found!172 lt!15813) (not (is-MissingZero!172 lt!15813)) (and (bvsge (index!2810 lt!15813) #b00000000000000000000000000000000) (bvslt (index!2810 lt!15813) (size!1380 lt!15486)))) (or (is-Undefined!172 lt!15813) (is-Found!172 lt!15813) (is-MissingZero!172 lt!15813) (not (is-MissingVacant!172 lt!15813)) (and (bvsge (index!2813 lt!15813) #b00000000000000000000000000000000) (bvslt (index!2813 lt!15813) (size!1380 lt!15486)))) (or (is-Undefined!172 lt!15813) (ite (is-Found!172 lt!15813) (= (select (arr!1243 lt!15486) (index!2811 lt!15813)) (select (arr!1243 lt!15486) #b00000000000000000000000000000000)) (ite (is-MissingZero!172 lt!15813) (= (select (arr!1243 lt!15486) (index!2810 lt!15813)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!172 lt!15813) (= (select (arr!1243 lt!15486) (index!2813 lt!15813)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7119 (= lt!15813 e!25867)))

(declare-fun c!5032 () Bool)

(assert (=> d!7119 (= c!5032 (and (is-Intermediate!172 lt!15814) (undefined!984 lt!15814)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2599 (_ BitVec 32)) SeekEntryResult!172)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!7119 (= lt!15814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) mask!853) (select (arr!1243 lt!15486) #b00000000000000000000000000000000) lt!15486 mask!853))))

(assert (=> d!7119 (validMask!0 mask!853)))

(assert (=> d!7119 (= (seekEntryOrOpen!0 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) lt!15486 mask!853) lt!15813)))

(declare-fun b!40794 () Bool)

(declare-fun e!25868 () SeekEntryResult!172)

(assert (=> b!40794 (= e!25867 e!25868)))

(declare-fun lt!15812 () (_ BitVec 64))

(assert (=> b!40794 (= lt!15812 (select (arr!1243 lt!15486) (index!2812 lt!15814)))))

(declare-fun c!5031 () Bool)

(assert (=> b!40794 (= c!5031 (= lt!15812 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun b!40795 () Bool)

(assert (=> b!40795 (= e!25868 (Found!172 (index!2812 lt!15814)))))

(declare-fun b!40796 () Bool)

(declare-fun c!5033 () Bool)

(assert (=> b!40796 (= c!5033 (= lt!15812 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40796 (= e!25868 e!25866)))

(assert (= (and d!7119 c!5032) b!40792))

(assert (= (and d!7119 (not c!5032)) b!40794))

(assert (= (and b!40794 c!5031) b!40795))

(assert (= (and b!40794 (not c!5031)) b!40796))

(assert (= (and b!40796 c!5033) b!40793))

(assert (= (and b!40796 (not c!5033)) b!40791))

(assert (=> b!40791 m!33267))

(declare-fun m!33679 () Bool)

(assert (=> b!40791 m!33679))

(declare-fun m!33681 () Bool)

(assert (=> d!7119 m!33681))

(assert (=> d!7119 m!33267))

(declare-fun m!33683 () Bool)

(assert (=> d!7119 m!33683))

(assert (=> d!7119 m!33267))

(assert (=> d!7119 m!33681))

(declare-fun m!33685 () Bool)

(assert (=> d!7119 m!33685))

(assert (=> d!7119 m!33225))

(declare-fun m!33687 () Bool)

(assert (=> d!7119 m!33687))

(declare-fun m!33689 () Bool)

(assert (=> d!7119 m!33689))

(declare-fun m!33691 () Bool)

(assert (=> b!40794 m!33691))

(assert (=> b!40304 d!7119))

(assert (=> d!6997 d!7015))

(declare-fun d!7123 () Bool)

(assert (=> d!7123 (arrayNoDuplicates!0 lt!15486 #b00000000000000000000000000000000 Nil!1054)))

(assert (=> d!7123 true))

(declare-fun res!24313 () Unit!985)

(assert (=> d!7123 (= (choose!111 lt!15486 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1054) res!24313)))

(declare-fun bs!1716 () Bool)

(assert (= bs!1716 d!7123))

(assert (=> bs!1716 m!33231))

(assert (=> d!6997 d!7123))

(assert (=> b!40395 d!7053))

(declare-fun b!40797 () Bool)

(declare-fun e!25870 () Bool)

(declare-fun e!25869 () Bool)

(assert (=> b!40797 (= e!25870 e!25869)))

(declare-fun c!5034 () Bool)

(assert (=> b!40797 (= c!5034 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3202 () Bool)

(declare-fun call!3205 () Bool)

(assert (=> bm!3202 (= call!3205 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15486 mask!853))))

(declare-fun b!40798 () Bool)

(assert (=> b!40798 (= e!25869 call!3205)))

(declare-fun b!40799 () Bool)

(declare-fun e!25871 () Bool)

(assert (=> b!40799 (= e!25869 e!25871)))

(declare-fun lt!15815 () (_ BitVec 64))

(assert (=> b!40799 (= lt!15815 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15817 () Unit!985)

(assert (=> b!40799 (= lt!15817 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15486 lt!15815 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40799 (arrayContainsKey!0 lt!15486 lt!15815 #b00000000000000000000000000000000)))

(declare-fun lt!15816 () Unit!985)

(assert (=> b!40799 (= lt!15816 lt!15817)))

(declare-fun res!24315 () Bool)

(assert (=> b!40799 (= res!24315 (= (seekEntryOrOpen!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15486 mask!853) (Found!172 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40799 (=> (not res!24315) (not e!25871))))

(declare-fun b!40800 () Bool)

(assert (=> b!40800 (= e!25871 call!3205)))

(declare-fun d!7125 () Bool)

(declare-fun res!24314 () Bool)

(assert (=> d!7125 (=> res!24314 e!25870)))

(assert (=> d!7125 (= res!24314 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 lt!15486)))))

(assert (=> d!7125 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15486 mask!853) e!25870)))

(assert (= (and d!7125 (not res!24314)) b!40797))

(assert (= (and b!40797 c!5034) b!40799))

(assert (= (and b!40797 (not c!5034)) b!40798))

(assert (= (and b!40799 res!24315) b!40800))

(assert (= (or b!40800 b!40798) bm!3202))

(assert (=> b!40797 m!33613))

(assert (=> b!40797 m!33613))

(assert (=> b!40797 m!33617))

(declare-fun m!33693 () Bool)

(assert (=> bm!3202 m!33693))

(assert (=> b!40799 m!33613))

(declare-fun m!33695 () Bool)

(assert (=> b!40799 m!33695))

(declare-fun m!33697 () Bool)

(assert (=> b!40799 m!33697))

(assert (=> b!40799 m!33613))

(declare-fun m!33699 () Bool)

(assert (=> b!40799 m!33699))

(assert (=> bm!3100 d!7125))

(assert (=> b!40302 d!7053))

(declare-fun b!40801 () Bool)

(declare-fun e!25873 () (_ BitVec 32))

(assert (=> b!40801 (= e!25873 #b00000000000000000000000000000000)))

(declare-fun b!40802 () Bool)

(declare-fun e!25872 () (_ BitVec 32))

(declare-fun call!3206 () (_ BitVec 32))

(assert (=> b!40802 (= e!25872 call!3206)))

(declare-fun b!40803 () Bool)

(assert (=> b!40803 (= e!25873 e!25872)))

(declare-fun c!5035 () Bool)

(assert (=> b!40803 (= c!5035 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7127 () Bool)

(declare-fun lt!15818 () (_ BitVec 32))

(assert (=> d!7127 (and (bvsge lt!15818 #b00000000000000000000000000000000) (bvsle lt!15818 (bvsub (size!1380 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7127 (= lt!15818 e!25873)))

(declare-fun c!5036 () Bool)

(assert (=> d!7127 (= c!5036 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7127 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1380 lt!15486)))))

(assert (=> d!7127 (= (arrayCountValidKeys!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15818)))

(declare-fun b!40804 () Bool)

(assert (=> b!40804 (= e!25872 (bvadd #b00000000000000000000000000000001 call!3206))))

(declare-fun bm!3203 () Bool)

(assert (=> bm!3203 (= call!3206 (arrayCountValidKeys!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7127 c!5036) b!40801))

(assert (= (and d!7127 (not c!5036)) b!40803))

(assert (= (and b!40803 c!5035) b!40804))

(assert (= (and b!40803 (not c!5035)) b!40802))

(assert (= (or b!40804 b!40802) bm!3203))

(assert (=> b!40803 m!33613))

(assert (=> b!40803 m!33613))

(assert (=> b!40803 m!33617))

(declare-fun m!33701 () Bool)

(assert (=> bm!3203 m!33701))

(assert (=> bm!3113 d!7127))

(push 1)

(assert (not b!40703))

(assert (not bm!3195))

(assert (not b!40695))

(assert (not b!40431))

(assert (not b!40673))

(assert (not b_lambda!2065))

(assert (not bm!3202))

(assert (not b_lambda!2073))

(assert (not b!40667))

(assert (not d!7119))

(assert (not b!40696))

(assert (not b!40661))

(assert (not b!40436))

(assert (not bm!3194))

(assert (not b!40797))

(assert (not d!7055))

(assert (not b!40653))

(assert (not b!40660))

(assert (not b!40704))

(assert (not d!7095))

(assert (not bm!3196))

(assert (not b!40434))

(assert (not b!40799))

(assert (not bm!3128))

(assert (not d!7089))

(assert (not bm!3203))

(assert (not b!40700))

(assert (not b!40656))

(assert (not bm!3197))

(assert (not b!40658))

(assert (not d!7113))

(assert (not d!7123))

(assert (not b_next!1367))

(assert tp_is_empty!1757)

(assert (not b!40429))

(assert (not b!40770))

(assert (not b!40705))

(assert (not b!40730))

(assert (not b!40791))

(assert (not bm!3127))

(assert (not b!40435))

(assert (not b!40666))

(assert (not d!7101))

(assert (not bm!3193))

(assert b_and!2373)

(assert (not bm!3191))

(assert (not b!40803))

(assert (not d!7057))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2373)

(assert (not b_next!1367))

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!3220 () Bool)

(declare-fun call!3223 () ListLongMap!1065)

(assert (=> bm!3220 (= call!3223 (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1805 lt!15483)))))

(declare-fun b!41129 () Bool)

(declare-fun e!26070 () Bool)

(assert (=> b!41129 (= e!26070 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(assert (=> b!41129 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!41130 () Bool)

(declare-fun e!26076 () Bool)

(declare-fun e!26072 () Bool)

(assert (=> b!41130 (= e!26076 e!26072)))

(declare-fun c!5133 () Bool)

(assert (=> b!41130 (= c!5133 e!26070)))

(declare-fun res!24448 () Bool)

(assert (=> b!41130 (=> (not res!24448) (not e!26070))))

(assert (=> b!41130 (= res!24448 (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(declare-fun b!41131 () Bool)

(declare-fun e!26074 () Bool)

(assert (=> b!41131 (= e!26072 e!26074)))

(declare-fun c!5136 () Bool)

(assert (=> b!41131 (= c!5136 (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(declare-fun b!41132 () Bool)

(assert (=> b!41132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(assert (=> b!41132 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1381 (_values!1788 lt!15483))))))

(declare-fun e!26075 () Bool)

(declare-fun lt!16049 () ListLongMap!1065)

(assert (=> b!41132 (= e!26075 (= (apply!57 lt!16049 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)) (get!703 (select (arr!1244 (_values!1788 lt!15483)) #b00000000000000000000000000000000) (dynLambda!192 (defaultEntry!1805 lt!15483) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!41133 () Bool)

(declare-fun res!24446 () Bool)

(assert (=> b!41133 (=> (not res!24446) (not e!26076))))

(assert (=> b!41133 (= res!24446 (not (contains!516 lt!16049 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!41134 () Bool)

(assert (=> b!41134 (= e!26072 e!26075)))

(assert (=> b!41134 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(declare-fun res!24449 () Bool)

(assert (=> b!41134 (= res!24449 (contains!516 lt!16049 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(assert (=> b!41134 (=> (not res!24449) (not e!26075))))

(declare-fun b!41135 () Bool)

(declare-fun e!26071 () ListLongMap!1065)

(assert (=> b!41135 (= e!26071 (ListLongMap!1066 Nil!1053))))

(declare-fun b!41136 () Bool)

(declare-fun isEmpty!234 (ListLongMap!1065) Bool)

(assert (=> b!41136 (= e!26074 (isEmpty!234 lt!16049))))

(declare-fun b!41137 () Bool)

(declare-fun lt!16046 () Unit!985)

(declare-fun lt!16045 () Unit!985)

(assert (=> b!41137 (= lt!16046 lt!16045)))

(declare-fun lt!16047 () ListLongMap!1065)

(declare-fun lt!16051 () (_ BitVec 64))

(declare-fun lt!16048 () (_ BitVec 64))

(declare-fun lt!16050 () V!2101)

(assert (=> b!41137 (not (contains!516 (+!66 lt!16047 (tuple2!1489 lt!16051 lt!16050)) lt!16048))))

(declare-fun addStillNotContains!8 (ListLongMap!1065 (_ BitVec 64) V!2101 (_ BitVec 64)) Unit!985)

(assert (=> b!41137 (= lt!16045 (addStillNotContains!8 lt!16047 lt!16051 lt!16050 lt!16048))))

(assert (=> b!41137 (= lt!16048 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!41137 (= lt!16050 (get!703 (select (arr!1244 (_values!1788 lt!15483)) #b00000000000000000000000000000000) (dynLambda!192 (defaultEntry!1805 lt!15483) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41137 (= lt!16051 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000))))

(assert (=> b!41137 (= lt!16047 call!3223)))

(declare-fun e!26073 () ListLongMap!1065)

(assert (=> b!41137 (= e!26073 (+!66 call!3223 (tuple2!1489 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) (get!703 (select (arr!1244 (_values!1788 lt!15483)) #b00000000000000000000000000000000) (dynLambda!192 (defaultEntry!1805 lt!15483) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!7271 () Bool)

(assert (=> d!7271 e!26076))

(declare-fun res!24447 () Bool)

(assert (=> d!7271 (=> (not res!24447) (not e!26076))))

(assert (=> d!7271 (= res!24447 (not (contains!516 lt!16049 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7271 (= lt!16049 e!26071)))

(declare-fun c!5134 () Bool)

(assert (=> d!7271 (= c!5134 (bvsge #b00000000000000000000000000000000 (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7271 (validMask!0 (mask!5178 lt!15483))))

(assert (=> d!7271 (= (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) #b00000000000000000000000000000000 (defaultEntry!1805 lt!15483)) lt!16049)))

(declare-fun b!41138 () Bool)

(assert (=> b!41138 (= e!26074 (= lt!16049 (getCurrentListMapNoExtraKeys!35 (_keys!3294 lt!15483) (_values!1788 lt!15483) (mask!5178 lt!15483) (extraKeys!1696 lt!15483) (zeroValue!1723 lt!15483) (minValue!1723 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1805 lt!15483))))))

(declare-fun b!41139 () Bool)

(assert (=> b!41139 (= e!26073 call!3223)))

(declare-fun b!41140 () Bool)

(assert (=> b!41140 (= e!26071 e!26073)))

(declare-fun c!5135 () Bool)

(assert (=> b!41140 (= c!5135 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(assert (= (and d!7271 c!5134) b!41135))

(assert (= (and d!7271 (not c!5134)) b!41140))

(assert (= (and b!41140 c!5135) b!41137))

(assert (= (and b!41140 (not c!5135)) b!41139))

(assert (= (or b!41137 b!41139) bm!3220))

(assert (= (and d!7271 res!24447) b!41133))

(assert (= (and b!41133 res!24446) b!41130))

(assert (= (and b!41130 res!24448) b!41129))

(assert (= (and b!41130 c!5133) b!41134))

(assert (= (and b!41130 (not c!5133)) b!41131))

(assert (= (and b!41134 res!24449) b!41132))

(assert (= (and b!41131 c!5136) b!41138))

(assert (= (and b!41131 (not c!5136)) b!41136))

(declare-fun b_lambda!2085 () Bool)

(assert (=> (not b_lambda!2085) (not b!41132)))

(assert (=> b!41132 t!3920))

(declare-fun b_and!2383 () Bool)

(assert (= b_and!2373 (and (=> t!3920 result!1451) b_and!2383)))

(declare-fun b_lambda!2087 () Bool)

(assert (=> (not b_lambda!2087) (not b!41137)))

(assert (=> b!41137 t!3920))

(declare-fun b_and!2385 () Bool)

(assert (= b_and!2383 (and (=> t!3920 result!1451) b_and!2385)))

(declare-fun m!34165 () Bool)

(assert (=> b!41138 m!34165))

(assert (=> b!41132 m!33383))

(declare-fun m!34167 () Bool)

(assert (=> b!41132 m!34167))

(assert (=> b!41132 m!33383))

(assert (=> b!41132 m!33563))

(assert (=> b!41132 m!33561))

(assert (=> b!41132 m!33565))

(assert (=> b!41132 m!33561))

(assert (=> b!41132 m!33563))

(declare-fun m!34169 () Bool)

(assert (=> d!7271 m!34169))

(assert (=> d!7271 m!33607))

(assert (=> b!41140 m!33383))

(assert (=> b!41140 m!33383))

(assert (=> b!41140 m!33385))

(assert (=> b!41129 m!33383))

(assert (=> b!41129 m!33383))

(assert (=> b!41129 m!33385))

(assert (=> b!41137 m!33383))

(declare-fun m!34171 () Bool)

(assert (=> b!41137 m!34171))

(declare-fun m!34173 () Bool)

(assert (=> b!41137 m!34173))

(assert (=> b!41137 m!34171))

(declare-fun m!34175 () Bool)

(assert (=> b!41137 m!34175))

(assert (=> b!41137 m!33563))

(assert (=> b!41137 m!33561))

(assert (=> b!41137 m!33565))

(assert (=> b!41137 m!33561))

(assert (=> b!41137 m!33563))

(declare-fun m!34177 () Bool)

(assert (=> b!41137 m!34177))

(declare-fun m!34179 () Bool)

(assert (=> b!41133 m!34179))

(declare-fun m!34181 () Bool)

(assert (=> b!41136 m!34181))

(assert (=> b!41134 m!33383))

(assert (=> b!41134 m!33383))

(declare-fun m!34183 () Bool)

(assert (=> b!41134 m!34183))

(assert (=> bm!3220 m!34165))

(assert (=> bm!3194 d!7271))

(declare-fun d!7303 () Bool)

(declare-fun e!26100 () Bool)

(assert (=> d!7303 e!26100))

(declare-fun res!24464 () Bool)

(assert (=> d!7303 (=> (not res!24464) (not e!26100))))

(declare-fun lt!16079 () ListLongMap!1065)

(assert (=> d!7303 (= res!24464 (contains!516 lt!16079 (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))))))

(declare-fun lt!16080 () List!1056)

(assert (=> d!7303 (= lt!16079 (ListLongMap!1066 lt!16080))))

(declare-fun lt!16081 () Unit!985)

(declare-fun lt!16078 () Unit!985)

(assert (=> d!7303 (= lt!16081 lt!16078)))

(declare-datatypes ((Option!109 0))(
  ( (Some!108 (v!2001 V!2101)) (None!107) )
))
(declare-fun getValueByKey!103 (List!1056 (_ BitVec 64)) Option!109)

(assert (=> d!7303 (= (getValueByKey!103 lt!16080 (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))) (Some!108 (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!27 (List!1056 (_ BitVec 64) V!2101) Unit!985)

(assert (=> d!7303 (= lt!16078 (lemmaContainsTupThenGetReturnValue!27 lt!16080 (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))) (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))))))

(declare-fun insertStrictlySorted!24 (List!1056 (_ BitVec 64) V!2101) List!1056)

(assert (=> d!7303 (= lt!16080 (insertStrictlySorted!24 (toList!548 call!3197) (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))) (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))))))

(assert (=> d!7303 (= (+!66 call!3197 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))) lt!16079)))

(declare-fun b!41179 () Bool)

(declare-fun res!24465 () Bool)

(assert (=> b!41179 (=> (not res!24465) (not e!26100))))

(assert (=> b!41179 (= res!24465 (= (getValueByKey!103 (toList!548 lt!16079) (_1!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))) (Some!108 (_2!755 (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))))))

(declare-fun b!41180 () Bool)

(declare-fun contains!519 (List!1056 tuple2!1488) Bool)

(assert (=> b!41180 (= e!26100 (contains!519 (toList!548 lt!16079) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))))

(assert (= (and d!7303 res!24464) b!41179))

(assert (= (and b!41179 res!24465) b!41180))

(declare-fun m!34229 () Bool)

(assert (=> d!7303 m!34229))

(declare-fun m!34233 () Bool)

(assert (=> d!7303 m!34233))

(declare-fun m!34235 () Bool)

(assert (=> d!7303 m!34235))

(declare-fun m!34237 () Bool)

(assert (=> d!7303 m!34237))

(declare-fun m!34239 () Bool)

(assert (=> b!41179 m!34239))

(declare-fun m!34241 () Bool)

(assert (=> b!41180 m!34241))

(assert (=> b!40656 d!7303))

(declare-fun b!41181 () Bool)

(declare-fun e!26102 () Bool)

(declare-fun call!3226 () Bool)

(assert (=> b!41181 (= e!26102 call!3226)))

(declare-fun b!41182 () Bool)

(declare-fun e!26103 () Bool)

(assert (=> b!41182 (= e!26103 (contains!513 (ite c!4938 (Cons!1053 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) Nil!1054) Nil!1054) (select (arr!1243 (_keys!3294 lt!15483)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41183 () Bool)

(declare-fun e!26104 () Bool)

(declare-fun e!26101 () Bool)

(assert (=> b!41183 (= e!26104 e!26101)))

(declare-fun res!24466 () Bool)

(assert (=> b!41183 (=> (not res!24466) (not e!26101))))

(assert (=> b!41183 (= res!24466 (not e!26103))))

(declare-fun res!24469 () Bool)

(assert (=> b!41183 (=> (not res!24469) (not e!26103))))

(assert (=> b!41183 (= res!24469 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7323 () Bool)

(declare-fun res!24467 () Bool)

(assert (=> d!7323 (=> res!24467 e!26104)))

(assert (=> d!7323 (= res!24467 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7323 (= (arrayNoDuplicates!0 (_keys!3294 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4938 (Cons!1053 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) e!26104)))

(declare-fun b!41185 () Bool)

(assert (=> b!41185 (= e!26101 e!26102)))

(declare-fun c!5149 () Bool)

(assert (=> b!41185 (= c!5149 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41187 () Bool)

(assert (=> b!41187 (= e!26102 call!3226)))

(declare-fun bm!3223 () Bool)

(assert (=> bm!3223 (= call!3226 (arrayNoDuplicates!0 (_keys!3294 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5149 (Cons!1053 (select (arr!1243 (_keys!3294 lt!15483)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4938 (Cons!1053 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (ite c!4938 (Cons!1053 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) Nil!1054) Nil!1054))))))

(assert (= (and d!7323 (not res!24467)) b!41183))

(assert (= (and b!41183 res!24469) b!41182))

(assert (= (and b!41183 res!24466) b!41185))

(assert (= (and b!41185 c!5149) b!41187))

(assert (= (and b!41185 (not c!5149)) b!41181))

(assert (= (or b!41187 b!41181) bm!3223))

(declare-fun m!34247 () Bool)

(assert (=> b!41182 m!34247))

(assert (=> b!41182 m!34247))

(declare-fun m!34249 () Bool)

(assert (=> b!41182 m!34249))

(assert (=> b!41183 m!34247))

(assert (=> b!41183 m!34247))

(declare-fun m!34251 () Bool)

(assert (=> b!41183 m!34251))

(assert (=> b!41185 m!34247))

(assert (=> b!41185 m!34247))

(assert (=> b!41185 m!34251))

(assert (=> bm!3223 m!34247))

(declare-fun m!34253 () Bool)

(assert (=> bm!3223 m!34253))

(assert (=> bm!3128 d!7323))

(declare-fun b!41194 () Bool)

(declare-fun e!26111 () (_ BitVec 32))

(assert (=> b!41194 (= e!26111 #b00000000000000000000000000000000)))

(declare-fun b!41195 () Bool)

(declare-fun e!26110 () (_ BitVec 32))

(declare-fun call!3227 () (_ BitVec 32))

(assert (=> b!41195 (= e!26110 call!3227)))

(declare-fun b!41196 () Bool)

(assert (=> b!41196 (= e!26111 e!26110)))

(declare-fun c!5153 () Bool)

(assert (=> b!41196 (= c!5153 (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!7329 () Bool)

(declare-fun lt!16086 () (_ BitVec 32))

(assert (=> d!7329 (and (bvsge lt!16086 #b00000000000000000000000000000000) (bvsle lt!16086 (bvsub (size!1380 (_keys!3294 lt!15483)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7329 (= lt!16086 e!26111)))

(declare-fun c!5154 () Bool)

(assert (=> d!7329 (= c!5154 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7329 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 (_keys!3294 lt!15483))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1380 (_keys!3294 lt!15483)) (size!1380 (_keys!3294 lt!15483))))))

(assert (=> d!7329 (= (arrayCountValidKeys!0 (_keys!3294 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 (_keys!3294 lt!15483))) lt!16086)))

(declare-fun b!41197 () Bool)

(assert (=> b!41197 (= e!26110 (bvadd #b00000000000000000000000000000001 call!3227))))

(declare-fun bm!3224 () Bool)

(assert (=> bm!3224 (= call!3227 (arrayCountValidKeys!0 (_keys!3294 lt!15483) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1380 (_keys!3294 lt!15483))))))

(assert (= (and d!7329 c!5154) b!41194))

(assert (= (and d!7329 (not c!5154)) b!41196))

(assert (= (and b!41196 c!5153) b!41197))

(assert (= (and b!41196 (not c!5153)) b!41195))

(assert (= (or b!41197 b!41195) bm!3224))

(assert (=> b!41196 m!34247))

(assert (=> b!41196 m!34247))

(assert (=> b!41196 m!34251))

(declare-fun m!34269 () Bool)

(assert (=> bm!3224 m!34269))

(assert (=> bm!3196 d!7329))

(declare-fun d!7333 () Bool)

(assert (=> d!7333 (= (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40803 d!7333))

(declare-fun d!7335 () Bool)

(declare-fun get!710 (Option!109) V!2101)

(assert (=> d!7335 (= (apply!57 lt!15763 #b0000000000000000000000000000000000000000000000000000000000000000) (get!710 (getValueByKey!103 (toList!548 lt!15763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1743 () Bool)

(assert (= bs!1743 d!7335))

(declare-fun m!34281 () Bool)

(assert (=> bs!1743 m!34281))

(assert (=> bs!1743 m!34281))

(declare-fun m!34283 () Bool)

(assert (=> bs!1743 m!34283))

(assert (=> b!40673 d!7335))

(declare-fun d!7341 () Bool)

(assert (=> d!7341 (= (validMask!0 (mask!5178 lt!15483)) (and (or (= (mask!5178 lt!15483) #b00000000000000000000000000000111) (= (mask!5178 lt!15483) #b00000000000000000000000000001111) (= (mask!5178 lt!15483) #b00000000000000000000000000011111) (= (mask!5178 lt!15483) #b00000000000000000000000000111111) (= (mask!5178 lt!15483) #b00000000000000000000000001111111) (= (mask!5178 lt!15483) #b00000000000000000000000011111111) (= (mask!5178 lt!15483) #b00000000000000000000000111111111) (= (mask!5178 lt!15483) #b00000000000000000000001111111111) (= (mask!5178 lt!15483) #b00000000000000000000011111111111) (= (mask!5178 lt!15483) #b00000000000000000000111111111111) (= (mask!5178 lt!15483) #b00000000000000000001111111111111) (= (mask!5178 lt!15483) #b00000000000000000011111111111111) (= (mask!5178 lt!15483) #b00000000000000000111111111111111) (= (mask!5178 lt!15483) #b00000000000000001111111111111111) (= (mask!5178 lt!15483) #b00000000000000011111111111111111) (= (mask!5178 lt!15483) #b00000000000000111111111111111111) (= (mask!5178 lt!15483) #b00000000000001111111111111111111) (= (mask!5178 lt!15483) #b00000000000011111111111111111111) (= (mask!5178 lt!15483) #b00000000000111111111111111111111) (= (mask!5178 lt!15483) #b00000000001111111111111111111111) (= (mask!5178 lt!15483) #b00000000011111111111111111111111) (= (mask!5178 lt!15483) #b00000000111111111111111111111111) (= (mask!5178 lt!15483) #b00000001111111111111111111111111) (= (mask!5178 lt!15483) #b00000011111111111111111111111111) (= (mask!5178 lt!15483) #b00000111111111111111111111111111) (= (mask!5178 lt!15483) #b00001111111111111111111111111111) (= (mask!5178 lt!15483) #b00011111111111111111111111111111) (= (mask!5178 lt!15483) #b00111111111111111111111111111111)) (bvsle (mask!5178 lt!15483) #b00111111111111111111111111111111)))))

(assert (=> d!7057 d!7341))

(declare-fun d!7343 () Bool)

(assert (=> d!7343 (arrayContainsKey!0 lt!15486 lt!15815 #b00000000000000000000000000000000)))

(declare-fun lt!16095 () Unit!985)

(assert (=> d!7343 (= lt!16095 (choose!13 lt!15486 lt!15815 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!7343 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!7343 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15486 lt!15815 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!16095)))

(declare-fun bs!1744 () Bool)

(assert (= bs!1744 d!7343))

(assert (=> bs!1744 m!33697))

(declare-fun m!34297 () Bool)

(assert (=> bs!1744 m!34297))

(assert (=> b!40799 d!7343))

(declare-fun d!7345 () Bool)

(declare-fun res!24475 () Bool)

(declare-fun e!26118 () Bool)

(assert (=> d!7345 (=> res!24475 e!26118)))

(assert (=> d!7345 (= res!24475 (= (select (arr!1243 lt!15486) #b00000000000000000000000000000000) lt!15815))))

(assert (=> d!7345 (= (arrayContainsKey!0 lt!15486 lt!15815 #b00000000000000000000000000000000) e!26118)))

(declare-fun b!41208 () Bool)

(declare-fun e!26119 () Bool)

(assert (=> b!41208 (= e!26118 e!26119)))

(declare-fun res!24476 () Bool)

(assert (=> b!41208 (=> (not res!24476) (not e!26119))))

(assert (=> b!41208 (= res!24476 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 lt!15486)))))

(declare-fun b!41209 () Bool)

(assert (=> b!41209 (= e!26119 (arrayContainsKey!0 lt!15486 lt!15815 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7345 (not res!24475)) b!41208))

(assert (= (and b!41208 res!24476) b!41209))

(assert (=> d!7345 m!33267))

(declare-fun m!34299 () Bool)

(assert (=> b!41209 m!34299))

(assert (=> b!40799 d!7345))

(declare-fun e!26120 () SeekEntryResult!172)

(declare-fun lt!16098 () SeekEntryResult!172)

(declare-fun b!41210 () Bool)

(assert (=> b!41210 (= e!26120 (seekKeyOrZeroReturnVacant!0 (x!7719 lt!16098) (index!2812 lt!16098) (index!2812 lt!16098) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15486 mask!853))))

(declare-fun b!41211 () Bool)

(declare-fun e!26121 () SeekEntryResult!172)

(assert (=> b!41211 (= e!26121 Undefined!172)))

(declare-fun b!41212 () Bool)

(assert (=> b!41212 (= e!26120 (MissingZero!172 (index!2812 lt!16098)))))

(declare-fun d!7347 () Bool)

(declare-fun lt!16097 () SeekEntryResult!172)

(assert (=> d!7347 (and (or (is-Undefined!172 lt!16097) (not (is-Found!172 lt!16097)) (and (bvsge (index!2811 lt!16097) #b00000000000000000000000000000000) (bvslt (index!2811 lt!16097) (size!1380 lt!15486)))) (or (is-Undefined!172 lt!16097) (is-Found!172 lt!16097) (not (is-MissingZero!172 lt!16097)) (and (bvsge (index!2810 lt!16097) #b00000000000000000000000000000000) (bvslt (index!2810 lt!16097) (size!1380 lt!15486)))) (or (is-Undefined!172 lt!16097) (is-Found!172 lt!16097) (is-MissingZero!172 lt!16097) (not (is-MissingVacant!172 lt!16097)) (and (bvsge (index!2813 lt!16097) #b00000000000000000000000000000000) (bvslt (index!2813 lt!16097) (size!1380 lt!15486)))) (or (is-Undefined!172 lt!16097) (ite (is-Found!172 lt!16097) (= (select (arr!1243 lt!15486) (index!2811 lt!16097)) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite (is-MissingZero!172 lt!16097) (= (select (arr!1243 lt!15486) (index!2810 lt!16097)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!172 lt!16097) (= (select (arr!1243 lt!15486) (index!2813 lt!16097)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7347 (= lt!16097 e!26121)))

(declare-fun c!5159 () Bool)

(assert (=> d!7347 (= c!5159 (and (is-Intermediate!172 lt!16098) (undefined!984 lt!16098)))))

(assert (=> d!7347 (= lt!16098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15486 mask!853))))

(assert (=> d!7347 (validMask!0 mask!853)))

(assert (=> d!7347 (= (seekEntryOrOpen!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15486 mask!853) lt!16097)))

(declare-fun b!41213 () Bool)

(declare-fun e!26122 () SeekEntryResult!172)

(assert (=> b!41213 (= e!26121 e!26122)))

(declare-fun lt!16096 () (_ BitVec 64))

(assert (=> b!41213 (= lt!16096 (select (arr!1243 lt!15486) (index!2812 lt!16098)))))

(declare-fun c!5158 () Bool)

(assert (=> b!41213 (= c!5158 (= lt!16096 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41214 () Bool)

(assert (=> b!41214 (= e!26122 (Found!172 (index!2812 lt!16098)))))

(declare-fun b!41215 () Bool)

(declare-fun c!5160 () Bool)

(assert (=> b!41215 (= c!5160 (= lt!16096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!41215 (= e!26122 e!26120)))

(assert (= (and d!7347 c!5159) b!41211))

(assert (= (and d!7347 (not c!5159)) b!41213))

(assert (= (and b!41213 c!5158) b!41214))

(assert (= (and b!41213 (not c!5158)) b!41215))

(assert (= (and b!41215 c!5160) b!41212))

(assert (= (and b!41215 (not c!5160)) b!41210))

(assert (=> b!41210 m!33613))

(declare-fun m!34301 () Bool)

(assert (=> b!41210 m!34301))

(declare-fun m!34303 () Bool)

(assert (=> d!7347 m!34303))

(assert (=> d!7347 m!33613))

(declare-fun m!34305 () Bool)

(assert (=> d!7347 m!34305))

(assert (=> d!7347 m!33613))

(assert (=> d!7347 m!34303))

(declare-fun m!34307 () Bool)

(assert (=> d!7347 m!34307))

(assert (=> d!7347 m!33225))

(declare-fun m!34309 () Bool)

(assert (=> d!7347 m!34309))

(declare-fun m!34311 () Bool)

(assert (=> d!7347 m!34311))

(declare-fun m!34313 () Bool)

(assert (=> b!41213 m!34313))

(assert (=> b!40799 d!7347))

(declare-fun d!7349 () Bool)

(declare-fun lt!16099 () Bool)

(assert (=> d!7349 (= lt!16099 (member (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) (content!32 Nil!1054)))))

(declare-fun e!26123 () Bool)

(assert (=> d!7349 (= lt!16099 e!26123)))

(declare-fun res!24478 () Bool)

(assert (=> d!7349 (=> (not res!24478) (not e!26123))))

(assert (=> d!7349 (= res!24478 (is-Cons!1053 Nil!1054))))

(assert (=> d!7349 (= (contains!513 Nil!1054 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)) lt!16099)))

(declare-fun b!41216 () Bool)

(declare-fun e!26124 () Bool)

(assert (=> b!41216 (= e!26123 e!26124)))

(declare-fun res!24477 () Bool)

(assert (=> b!41216 (=> res!24477 e!26124)))

(assert (=> b!41216 (= res!24477 (= (h!1627 Nil!1054) (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun b!41217 () Bool)

(assert (=> b!41217 (= e!26124 (contains!513 (t!3914 Nil!1054) (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(assert (= (and d!7349 res!24478) b!41216))

(assert (= (and b!41216 (not res!24477)) b!41217))

(assert (=> d!7349 m!33635))

(assert (=> d!7349 m!33383))

(declare-fun m!34315 () Bool)

(assert (=> d!7349 m!34315))

(assert (=> b!41217 m!33383))

(declare-fun m!34317 () Bool)

(assert (=> b!41217 m!34317))

(assert (=> b!40434 d!7349))

(declare-fun d!7351 () Bool)

(declare-fun e!26125 () Bool)

(assert (=> d!7351 e!26125))

(declare-fun res!24479 () Bool)

(assert (=> d!7351 (=> (not res!24479) (not e!26125))))

(declare-fun lt!16101 () ListLongMap!1065)

(assert (=> d!7351 (= res!24479 (contains!516 lt!16101 (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))))))

(declare-fun lt!16102 () List!1056)

(assert (=> d!7351 (= lt!16101 (ListLongMap!1066 lt!16102))))

(declare-fun lt!16103 () Unit!985)

(declare-fun lt!16100 () Unit!985)

(assert (=> d!7351 (= lt!16103 lt!16100)))

(assert (=> d!7351 (= (getValueByKey!103 lt!16102 (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))) (Some!108 (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))))))

(assert (=> d!7351 (= lt!16100 (lemmaContainsTupThenGetReturnValue!27 lt!16102 (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))) (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))))))

(assert (=> d!7351 (= lt!16102 (insertStrictlySorted!24 (toList!548 (ite c!4996 call!3193 (ite c!4997 call!3198 call!3195))) (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))) (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))))))

(assert (=> d!7351 (= (+!66 (ite c!4996 call!3193 (ite c!4997 call!3198 call!3195)) (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))) lt!16101)))

(declare-fun b!41218 () Bool)

(declare-fun res!24480 () Bool)

(assert (=> b!41218 (=> (not res!24480) (not e!26125))))

(assert (=> b!41218 (= res!24480 (= (getValueByKey!103 (toList!548 lt!16101) (_1!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483))))) (Some!108 (_2!755 (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))))))))

(declare-fun b!41219 () Bool)

(assert (=> b!41219 (= e!26125 (contains!519 (toList!548 lt!16101) (ite (or c!4996 c!4997) (tuple2!1489 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1723 lt!15483)) (tuple2!1489 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1723 lt!15483)))))))

(assert (= (and d!7351 res!24479) b!41218))

(assert (= (and b!41218 res!24480) b!41219))

(declare-fun m!34319 () Bool)

(assert (=> d!7351 m!34319))

(declare-fun m!34321 () Bool)

(assert (=> d!7351 m!34321))

(declare-fun m!34323 () Bool)

(assert (=> d!7351 m!34323))

(declare-fun m!34325 () Bool)

(assert (=> d!7351 m!34325))

(declare-fun m!34327 () Bool)

(assert (=> b!41218 m!34327))

(declare-fun m!34329 () Bool)

(assert (=> b!41219 m!34329))

(assert (=> bm!3193 d!7351))

(declare-fun d!7353 () Bool)

(assert (=> d!7353 (= (validKeyInArray!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40435 d!7353))

(declare-fun b!41220 () Bool)

(declare-fun e!26127 () Bool)

(declare-fun call!3230 () Bool)

(assert (=> b!41220 (= e!26127 call!3230)))

(declare-fun b!41221 () Bool)

(declare-fun e!26128 () Bool)

(assert (=> b!41221 (= e!26128 (contains!513 (ite c!5006 (Cons!1053 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!41222 () Bool)

(declare-fun e!26129 () Bool)

(declare-fun e!26126 () Bool)

(assert (=> b!41222 (= e!26129 e!26126)))

(declare-fun res!24481 () Bool)

(assert (=> b!41222 (=> (not res!24481) (not e!26126))))

(assert (=> b!41222 (= res!24481 (not e!26128))))

(declare-fun res!24483 () Bool)

(assert (=> b!41222 (=> (not res!24483) (not e!26128))))

(assert (=> b!41222 (= res!24483 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!7355 () Bool)

(declare-fun res!24482 () Bool)

(assert (=> d!7355 (=> res!24482 e!26129)))

(assert (=> d!7355 (= res!24482 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1380 lt!15486)))))

(assert (=> d!7355 (= (arrayNoDuplicates!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5006 (Cons!1053 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054))) e!26129)))

(declare-fun b!41223 () Bool)

(assert (=> b!41223 (= e!26126 e!26127)))

(declare-fun c!5161 () Bool)

(assert (=> b!41223 (= c!5161 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!41224 () Bool)

(assert (=> b!41224 (= e!26127 call!3230)))

(declare-fun bm!3227 () Bool)

(assert (=> bm!3227 (= call!3230 (arrayNoDuplicates!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5161 (Cons!1053 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!5006 (Cons!1053 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054))) (ite c!5006 (Cons!1053 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)))))))

(assert (= (and d!7355 (not res!24482)) b!41222))

(assert (= (and b!41222 res!24483) b!41221))

(assert (= (and b!41222 res!24481) b!41223))

(assert (= (and b!41223 c!5161) b!41224))

(assert (= (and b!41223 (not c!5161)) b!41220))

(assert (= (or b!41224 b!41220) bm!3227))

(declare-fun m!34331 () Bool)

(assert (=> b!41221 m!34331))

(assert (=> b!41221 m!34331))

(declare-fun m!34333 () Bool)

(assert (=> b!41221 m!34333))

(assert (=> b!41222 m!34331))

(assert (=> b!41222 m!34331))

(declare-fun m!34335 () Bool)

(assert (=> b!41222 m!34335))

(assert (=> b!41223 m!34331))

(assert (=> b!41223 m!34331))

(assert (=> b!41223 m!34335))

(assert (=> bm!3227 m!34331))

(declare-fun m!34337 () Bool)

(assert (=> bm!3227 m!34337))

(assert (=> bm!3197 d!7355))

(assert (=> b!40436 d!7353))

(assert (=> b!40700 d!7353))

(declare-fun b!41225 () Bool)

(declare-fun e!26131 () (_ BitVec 32))

(assert (=> b!41225 (= e!26131 #b00000000000000000000000000000000)))

(declare-fun b!41226 () Bool)

(declare-fun e!26130 () (_ BitVec 32))

(declare-fun call!3231 () (_ BitVec 32))

(assert (=> b!41226 (= e!26130 call!3231)))

(declare-fun b!41227 () Bool)

(assert (=> b!41227 (= e!26131 e!26130)))

(declare-fun c!5162 () Bool)

(assert (=> b!41227 (= c!5162 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!7357 () Bool)

(declare-fun lt!16104 () (_ BitVec 32))

(assert (=> d!7357 (and (bvsge lt!16104 #b00000000000000000000000000000000) (bvsle lt!16104 (bvsub (size!1380 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!7357 (= lt!16104 e!26131)))

(declare-fun c!5163 () Bool)

(assert (=> d!7357 (= c!5163 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7357 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1380 lt!15486)))))

(assert (=> d!7357 (= (arrayCountValidKeys!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!16104)))

(declare-fun b!41228 () Bool)

(assert (=> b!41228 (= e!26130 (bvadd #b00000000000000000000000000000001 call!3231))))

(declare-fun bm!3228 () Bool)

(assert (=> bm!3228 (= call!3231 (arrayCountValidKeys!0 lt!15486 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7357 c!5163) b!41225))

(assert (= (and d!7357 (not c!5163)) b!41227))

(assert (= (and b!41227 c!5162) b!41228))

(assert (= (and b!41227 (not c!5162)) b!41226))

(assert (= (or b!41228 b!41226) bm!3228))

(assert (=> b!41227 m!34331))

(assert (=> b!41227 m!34331))

(assert (=> b!41227 m!34335))

(declare-fun m!34339 () Bool)

(assert (=> bm!3228 m!34339))

(assert (=> bm!3203 d!7357))

(declare-fun d!7359 () Bool)

(declare-fun res!24484 () Bool)

(declare-fun e!26132 () Bool)

(assert (=> d!7359 (=> res!24484 e!26132)))

(assert (=> d!7359 (= res!24484 (= (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15500))))

(assert (=> d!7359 (= (arrayContainsKey!0 lt!15486 lt!15500 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!26132)))

(declare-fun b!41229 () Bool)

(declare-fun e!26133 () Bool)

(assert (=> b!41229 (= e!26132 e!26133)))

(declare-fun res!24485 () Bool)

(assert (=> b!41229 (=> (not res!24485) (not e!26133))))

(assert (=> b!41229 (= res!24485 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1380 lt!15486)))))

(declare-fun b!41230 () Bool)

(assert (=> b!41230 (= e!26133 (arrayContainsKey!0 lt!15486 lt!15500 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!7359 (not res!24484)) b!41229))

(assert (= (and b!41229 res!24485) b!41230))

(assert (=> d!7359 m!33613))

(declare-fun m!34341 () Bool)

(assert (=> b!41230 m!34341))

(assert (=> b!40770 d!7359))

(declare-fun d!7361 () Bool)

(declare-fun lt!16105 () Bool)

(assert (=> d!7361 (= lt!16105 (member (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (content!32 (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054))))))

(declare-fun e!26134 () Bool)

(assert (=> d!7361 (= lt!16105 e!26134)))

(declare-fun res!24487 () Bool)

(assert (=> d!7361 (=> (not res!24487) (not e!26134))))

(assert (=> d!7361 (= res!24487 (is-Cons!1053 (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)))))

(assert (=> d!7361 (= (contains!513 (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!16105)))

(declare-fun b!41231 () Bool)

(declare-fun e!26135 () Bool)

(assert (=> b!41231 (= e!26134 e!26135)))

(declare-fun res!24486 () Bool)

(assert (=> b!41231 (=> res!24486 e!26135)))

(assert (=> b!41231 (= res!24486 (= (h!1627 (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!41232 () Bool)

(assert (=> b!41232 (= e!26135 (contains!513 (t!3914 (ite c!4930 (Cons!1053 (select (arr!1243 lt!15486) #b00000000000000000000000000000000) Nil!1054) Nil!1054)) (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7361 res!24487) b!41231))

(assert (= (and b!41231 (not res!24486)) b!41232))

(declare-fun m!34343 () Bool)

(assert (=> d!7361 m!34343))

(assert (=> d!7361 m!33613))

(declare-fun m!34345 () Bool)

(assert (=> d!7361 m!34345))

(assert (=> b!41232 m!33613))

(declare-fun m!34347 () Bool)

(assert (=> b!41232 m!34347))

(assert (=> b!40703 d!7361))

(declare-fun d!7363 () Bool)

(declare-fun e!26140 () Bool)

(assert (=> d!7363 e!26140))

(declare-fun res!24490 () Bool)

(assert (=> d!7363 (=> res!24490 e!26140)))

(declare-fun lt!16116 () Bool)

(assert (=> d!7363 (= res!24490 (not lt!16116))))

(declare-fun lt!16115 () Bool)

(assert (=> d!7363 (= lt!16116 lt!16115)))

(declare-fun lt!16117 () Unit!985)

(declare-fun e!26141 () Unit!985)

(assert (=> d!7363 (= lt!16117 e!26141)))

(declare-fun c!5166 () Bool)

(assert (=> d!7363 (= c!5166 lt!16115)))

(declare-fun containsKey!71 (List!1056 (_ BitVec 64)) Bool)

(assert (=> d!7363 (= lt!16115 (containsKey!71 (toList!548 lt!15763) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7363 (= (contains!516 lt!15763 #b0000000000000000000000000000000000000000000000000000000000000000) lt!16116)))

(declare-fun b!41239 () Bool)

(declare-fun lt!16114 () Unit!985)

(assert (=> b!41239 (= e!26141 lt!16114)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!59 (List!1056 (_ BitVec 64)) Unit!985)

(assert (=> b!41239 (= lt!16114 (lemmaContainsKeyImpliesGetValueByKeyDefined!59 (toList!548 lt!15763) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!60 (Option!109) Bool)

(assert (=> b!41239 (isDefined!60 (getValueByKey!103 (toList!548 lt!15763) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41240 () Bool)

(declare-fun Unit!998 () Unit!985)

(assert (=> b!41240 (= e!26141 Unit!998)))

(declare-fun b!41241 () Bool)

(assert (=> b!41241 (= e!26140 (isDefined!60 (getValueByKey!103 (toList!548 lt!15763) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7363 c!5166) b!41239))

(assert (= (and d!7363 (not c!5166)) b!41240))

(assert (= (and d!7363 (not res!24490)) b!41241))

(declare-fun m!34349 () Bool)

(assert (=> d!7363 m!34349))

(declare-fun m!34351 () Bool)

(assert (=> b!41239 m!34351))

(assert (=> b!41239 m!34281))

(assert (=> b!41239 m!34281))

(declare-fun m!34353 () Bool)

(assert (=> b!41239 m!34353))

(assert (=> b!41241 m!34281))

(assert (=> b!41241 m!34281))

(assert (=> b!41241 m!34353))

(assert (=> bm!3191 d!7363))

(assert (=> b!40704 d!7333))

(assert (=> b!40705 d!7333))

(declare-fun d!7365 () Bool)

(assert (=> d!7365 (= (apply!57 lt!15763 #b1000000000000000000000000000000000000000000000000000000000000000) (get!710 (getValueByKey!103 (toList!548 lt!15763) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1745 () Bool)

(assert (= bs!1745 d!7365))

(declare-fun m!34355 () Bool)

(assert (=> bs!1745 m!34355))

(assert (=> bs!1745 m!34355))

(declare-fun m!34357 () Bool)

(assert (=> bs!1745 m!34357))

(assert (=> b!40653 d!7365))

(declare-fun d!7367 () Bool)

(assert (=> d!7367 (arrayContainsKey!0 (_keys!3294 lt!15483) lt!15559 #b00000000000000000000000000000000)))

(declare-fun lt!16118 () Unit!985)

(assert (=> d!7367 (= lt!16118 (choose!13 (_keys!3294 lt!15483) lt!15559 #b00000000000000000000000000000000))))

(assert (=> d!7367 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7367 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3294 lt!15483) lt!15559 #b00000000000000000000000000000000) lt!16118)))

(declare-fun bs!1746 () Bool)

(assert (= bs!1746 d!7367))

(assert (=> bs!1746 m!33391))

(declare-fun m!34359 () Bool)

(assert (=> bs!1746 m!34359))

(assert (=> b!40431 d!7367))

(declare-fun d!7369 () Bool)

(declare-fun res!24491 () Bool)

(declare-fun e!26142 () Bool)

(assert (=> d!7369 (=> res!24491 e!26142)))

(assert (=> d!7369 (= res!24491 (= (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) lt!15559))))

(assert (=> d!7369 (= (arrayContainsKey!0 (_keys!3294 lt!15483) lt!15559 #b00000000000000000000000000000000) e!26142)))

(declare-fun b!41242 () Bool)

(declare-fun e!26143 () Bool)

(assert (=> b!41242 (= e!26142 e!26143)))

(declare-fun res!24492 () Bool)

(assert (=> b!41242 (=> (not res!24492) (not e!26143))))

(assert (=> b!41242 (= res!24492 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1380 (_keys!3294 lt!15483))))))

(declare-fun b!41243 () Bool)

(assert (=> b!41243 (= e!26143 (arrayContainsKey!0 (_keys!3294 lt!15483) lt!15559 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7369 (not res!24491)) b!41242))

(assert (= (and b!41242 res!24492) b!41243))

(assert (=> d!7369 m!33383))

(declare-fun m!34361 () Bool)

(assert (=> b!41243 m!34361))

(assert (=> b!40431 d!7369))

(declare-fun b!41244 () Bool)

(declare-fun e!26144 () SeekEntryResult!172)

(declare-fun lt!16121 () SeekEntryResult!172)

(assert (=> b!41244 (= e!26144 (seekKeyOrZeroReturnVacant!0 (x!7719 lt!16121) (index!2812 lt!16121) (index!2812 lt!16121) (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) (_keys!3294 lt!15483) (mask!5178 lt!15483)))))

(declare-fun b!41245 () Bool)

(declare-fun e!26145 () SeekEntryResult!172)

(assert (=> b!41245 (= e!26145 Undefined!172)))

(declare-fun b!41246 () Bool)

(assert (=> b!41246 (= e!26144 (MissingZero!172 (index!2812 lt!16121)))))

(declare-fun d!7371 () Bool)

(declare-fun lt!16120 () SeekEntryResult!172)

(assert (=> d!7371 (and (or (is-Undefined!172 lt!16120) (not (is-Found!172 lt!16120)) (and (bvsge (index!2811 lt!16120) #b00000000000000000000000000000000) (bvslt (index!2811 lt!16120) (size!1380 (_keys!3294 lt!15483))))) (or (is-Undefined!172 lt!16120) (is-Found!172 lt!16120) (not (is-MissingZero!172 lt!16120)) (and (bvsge (index!2810 lt!16120) #b00000000000000000000000000000000) (bvslt (index!2810 lt!16120) (size!1380 (_keys!3294 lt!15483))))) (or (is-Undefined!172 lt!16120) (is-Found!172 lt!16120) (is-MissingZero!172 lt!16120) (not (is-MissingVacant!172 lt!16120)) (and (bvsge (index!2813 lt!16120) #b00000000000000000000000000000000) (bvslt (index!2813 lt!16120) (size!1380 (_keys!3294 lt!15483))))) (or (is-Undefined!172 lt!16120) (ite (is-Found!172 lt!16120) (= (select (arr!1243 (_keys!3294 lt!15483)) (index!2811 lt!16120)) (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)) (ite (is-MissingZero!172 lt!16120) (= (select (arr!1243 (_keys!3294 lt!15483)) (index!2810 lt!16120)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!172 lt!16120) (= (select (arr!1243 (_keys!3294 lt!15483)) (index!2813 lt!16120)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7371 (= lt!16120 e!26145)))

(declare-fun c!5168 () Bool)

(assert (=> d!7371 (= c!5168 (and (is-Intermediate!172 lt!16121) (undefined!984 lt!16121)))))

(assert (=> d!7371 (= lt!16121 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) (mask!5178 lt!15483)) (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) (_keys!3294 lt!15483) (mask!5178 lt!15483)))))

(assert (=> d!7371 (validMask!0 (mask!5178 lt!15483))))

(assert (=> d!7371 (= (seekEntryOrOpen!0 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000) (_keys!3294 lt!15483) (mask!5178 lt!15483)) lt!16120)))

(declare-fun b!41247 () Bool)

(declare-fun e!26146 () SeekEntryResult!172)

(assert (=> b!41247 (= e!26145 e!26146)))

(declare-fun lt!16119 () (_ BitVec 64))

(assert (=> b!41247 (= lt!16119 (select (arr!1243 (_keys!3294 lt!15483)) (index!2812 lt!16121)))))

(declare-fun c!5167 () Bool)

(assert (=> b!41247 (= c!5167 (= lt!16119 (select (arr!1243 (_keys!3294 lt!15483)) #b00000000000000000000000000000000)))))

(declare-fun b!41248 () Bool)

(assert (=> b!41248 (= e!26146 (Found!172 (index!2812 lt!16121)))))

(declare-fun b!41249 () Bool)

(declare-fun c!5169 () Bool)

(assert (=> b!41249 (= c!5169 (= lt!16119 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!41249 (= e!26146 e!26144)))

(assert (= (and d!7371 c!5168) b!41245))

(assert (= (and d!7371 (not c!5168)) b!41247))

(assert (= (and b!41247 c!5167) b!41248))

(assert (= (and b!41247 (not c!5167)) b!41249))

(assert (= (and b!41249 c!5169) b!41246))

(assert (= (and b!41249 (not c!5169)) b!41244))

(assert (=> b!41244 m!33383))

(declare-fun m!34363 () Bool)

(assert (=> b!41244 m!34363))

(declare-fun m!34365 () Bool)

(assert (=> d!7371 m!34365))

(assert (=> d!7371 m!33383))

(declare-fun m!34367 () Bool)

(assert (=> d!7371 m!34367))

(assert (=> d!7371 m!33383))

(assert (=> d!7371 m!34365))

(declare-fun m!34369 () Bool)

(assert (=> d!7371 m!34369))

(assert (=> d!7371 m!33607))

(declare-fun m!34371 () Bool)

(assert (=> d!7371 m!34371))

(declare-fun m!34373 () Bool)

(assert (=> d!7371 m!34373))

(declare-fun m!34375 () Bool)

(assert (=> b!41247 m!34375))

(assert (=> b!40431 d!7371))

(declare-fun b!41250 () Bool)

(declare-fun e!26148 () Bool)

(declare-fun e!26147 () Bool)

(assert (=> b!41250 (= e!26148 e!26147)))

(declare-fun c!5170 () Bool)

(assert (=> b!41250 (= c!5170 (validKeyInArray!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3229 () Bool)

(declare-fun call!3232 () Bool)

(assert (=> bm!3229 (= call!3232 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15486 mask!853))))

(declare-fun b!41251 () Bool)

(assert (=> b!41251 (= e!26147 call!3232)))

(declare-fun b!41252 () Bool)

(declare-fun e!26149 () Bool)

(assert (=> b!41252 (= e!26147 e!26149)))

(declare-fun lt!16122 () (_ BitVec 64))

(assert (=> b!41252 (= lt!16122 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!16124 () Unit!985)

(assert (=> b!41252 (= lt!16124 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15486 lt!16122 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!41252 (arrayContainsKey!0 lt!15486 lt!16122 #b00000000000000000000000000000000)))

(declare-fun lt!16123 () Unit!985)

(assert (=> b!41252 (= lt!16123 lt!16124)))

(declare-fun res!24494 () Bool)

(assert (=> b!41252 (= res!24494 (= (seekEntryOrOpen!0 (select (arr!1243 lt!15486) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!15486 mask!853) (Found!172 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!41252 (=> (not res!24494) (not e!26149))))

(declare-fun b!41253 () Bool)

(assert (=> b!41253 (= e!26149 call!3232)))

(declare-fun d!7373 () Bool)

(declare-fun res!24493 () Bool)

(assert (=> d!7373 (=> res!24493 e!26148)))

(assert (=> d!7373 (= res!24493 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1380 lt!15486)))))

(assert (=> d!7373 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15486 mask!853) e!26148)))

(assert (= (and d!7373 (not res!24493)) b!41250))

(assert (= (and b!41250 c!5170) b!41252))

(assert (= (and b!41250 (not c!5170)) b!41251))

(assert (= (and b!41252 res!24494) b!41253))

(assert (= (or b!41253 b!41251) bm!3229))

(assert (=> b!41250 m!34331))

(assert (=> b!41250 m!34331))

(assert (=> b!41250 m!34335))

(declare-fun m!34377 () Bool)

(assert (=> bm!3229 m!34377))

(assert (=> b!41252 m!34331))

(declare-fun m!34379 () Bool)

(assert (=> b!41252 m!34379))

(declare-fun m!34381 () Bool)

(assert (=> b!41252 m!34381))

(assert (=> b!41252 m!34331))

(declare-fun m!34383 () Bool)

(assert (=> b!41252 m!34383))

(assert (=> bm!3202 d!7373))

(assert (=> d!7113 d!7115))

(declare-fun d!7375 () Bool)

(assert (=> d!7375 (arrayContainsKey!0 lt!15486 lt!15500 #b00000000000000000000000000000000)))

(assert (=> d!7375 true))

(declare-fun _$60!347 () Unit!985)

(assert (=> d!7375 (= (choose!13 lt!15486 lt!15500 #b00000000000000000000000000000000) _$60!347)))

(declare-fun bs!1747 () Bool)

(assert (= bs!1747 d!7375))

(assert (=> bs!1747 m!33279))

(assert (=> d!7113 d!7375))

(assert (=> b!40797 d!7333))

(assert (=> b!40666 d!7353))

(declare-fun e!26156 () SeekEntryResult!172)

(declare-fun b!41266 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41266 (= e!26156 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7719 lt!15814) #b00000000000000000000000000000001) (nextIndex!0 (index!2812 lt!15814) (x!7719 lt!15814) mask!853) (index!2812 lt!15814) (select (arr!1243 lt!15486) #b00000000000000000000000000000000) lt!15486 mask!853))))

(declare-fun b!41267 () Bool)

(declare-fun e!26158 () SeekEntryResult!172)

(assert (=> b!41267 (= e!26158 (Found!172 (index!2812 lt!15814)))))

(declare-fun b!41269 () Bool)

(declare-fun e!26157 () SeekEntryResult!172)

(assert (=> b!41269 (= e!26157 e!26158)))

(declare-fun c!5179 () Bool)

(declare-fun lt!16129 () (_ BitVec 64))

(assert (=> b!41269 (= c!5179 (= lt!16129 (select (arr!1243 lt!15486) #b00000000000000000000000000000000)))))

(declare-fun b!41270 () Bool)

(assert (=> b!41270 (= e!26157 Undefined!172)))

(declare-fun b!41271 () Bool)

