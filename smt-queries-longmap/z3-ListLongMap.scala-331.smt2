; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6044 () Bool)

(assert start!6044)

(declare-fun b_free!1447 () Bool)

(declare-fun b_next!1447 () Bool)

(assert (=> start!6044 (= b_free!1447 (not b_next!1447))))

(declare-fun tp!5858 () Bool)

(declare-fun b_and!2541 () Bool)

(assert (=> start!6044 (= tp!5858 b_and!2541)))

(declare-fun res!25006 () Bool)

(declare-fun e!26532 () Bool)

(assert (=> start!6044 (=> (not res!25006) (not e!26532))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6044 (= res!25006 (validMask!0 mask!853))))

(assert (=> start!6044 e!26532))

(assert (=> start!6044 true))

(assert (=> start!6044 tp!5858))

(declare-fun b!41970 () Bool)

(declare-fun e!26531 () Bool)

(assert (=> b!41970 (= e!26532 (not e!26531))))

(declare-fun res!25007 () Bool)

(assert (=> b!41970 (=> res!25007 e!26531)))

(declare-datatypes ((V!2209 0))(
  ( (V!2210 (val!957 Int)) )
))
(declare-datatypes ((tuple2!1550 0))(
  ( (tuple2!1551 (_1!786 (_ BitVec 64)) (_2!786 V!2209)) )
))
(declare-datatypes ((List!1122 0))(
  ( (Nil!1119) (Cons!1118 (h!1695 tuple2!1550) (t!4065 List!1122)) )
))
(declare-datatypes ((ListLongMap!1121 0))(
  ( (ListLongMap!1122 (toList!576 List!1122)) )
))
(declare-fun lt!17207 () ListLongMap!1121)

(assert (=> b!41970 (= res!25007 (= lt!17207 (ListLongMap!1122 Nil!1119)))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2745 0))(
  ( (array!2746 (arr!1316 (Array (_ BitVec 32) (_ BitVec 64))) (size!1474 (_ BitVec 32))) )
))
(declare-fun lt!17206 () array!2745)

(declare-fun lt!17204 () V!2209)

(declare-datatypes ((ValueCell!671 0))(
  ( (ValueCellFull!671 (v!2042 V!2209)) (EmptyCell!671) )
))
(declare-datatypes ((array!2747 0))(
  ( (array!2748 (arr!1317 (Array (_ BitVec 32) ValueCell!671)) (size!1475 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!322 0))(
  ( (LongMapFixedSize!323 (defaultEntry!1854 Int) (mask!5288 (_ BitVec 32)) (extraKeys!1745 (_ BitVec 32)) (zeroValue!1772 V!2209) (minValue!1772 V!2209) (_size!210 (_ BitVec 32)) (_keys!3367 array!2745) (_values!1837 array!2747) (_vacant!210 (_ BitVec 32))) )
))
(declare-fun map!759 (LongMapFixedSize!322) ListLongMap!1121)

(assert (=> b!41970 (= lt!17207 (map!759 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1123 0))(
  ( (Nil!1120) (Cons!1119 (h!1696 (_ BitVec 64)) (t!4066 List!1123)) )
))
(declare-fun arrayNoDuplicates!0 (array!2745 (_ BitVec 32) List!1123) Bool)

(assert (=> b!41970 (arrayNoDuplicates!0 lt!17206 #b00000000000000000000000000000000 Nil!1120)))

(declare-datatypes ((Unit!1095 0))(
  ( (Unit!1096) )
))
(declare-fun lt!17208 () Unit!1095)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2745 (_ BitVec 32) (_ BitVec 32) List!1123) Unit!1095)

(assert (=> b!41970 (= lt!17208 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2745 (_ BitVec 32)) Bool)

(assert (=> b!41970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17206 mask!853)))

(declare-fun lt!17205 () Unit!1095)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2745 (_ BitVec 32) (_ BitVec 32)) Unit!1095)

(assert (=> b!41970 (= lt!17205 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17206 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2745 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41970 (= (arrayCountValidKeys!0 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17209 () Unit!1095)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2745 (_ BitVec 32) (_ BitVec 32)) Unit!1095)

(assert (=> b!41970 (= lt!17209 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41970 (= lt!17206 (array!2746 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!228 (Int (_ BitVec 64)) V!2209)

(assert (=> b!41970 (= lt!17204 (dynLambda!228 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41971 () Bool)

(declare-fun isEmpty!275 (List!1122) Bool)

(assert (=> b!41971 (= e!26531 (not (isEmpty!275 (toList!576 lt!17207))))))

(assert (= (and start!6044 res!25006) b!41970))

(assert (= (and b!41970 (not res!25007)) b!41971))

(declare-fun b_lambda!2177 () Bool)

(assert (=> (not b_lambda!2177) (not b!41970)))

(declare-fun t!4064 () Bool)

(declare-fun tb!929 () Bool)

(assert (=> (and start!6044 (= defaultEntry!470 defaultEntry!470) t!4064) tb!929))

(declare-fun result!1609 () Bool)

(declare-fun tp_is_empty!1837 () Bool)

(assert (=> tb!929 (= result!1609 tp_is_empty!1837)))

(assert (=> b!41970 t!4064))

(declare-fun b_and!2543 () Bool)

(assert (= b_and!2541 (and (=> t!4064 result!1609) b_and!2543)))

(declare-fun m!35491 () Bool)

(assert (=> start!6044 m!35491))

(declare-fun m!35493 () Bool)

(assert (=> b!41970 m!35493))

(declare-fun m!35495 () Bool)

(assert (=> b!41970 m!35495))

(declare-fun m!35497 () Bool)

(assert (=> b!41970 m!35497))

(declare-fun m!35499 () Bool)

(assert (=> b!41970 m!35499))

(declare-fun m!35501 () Bool)

(assert (=> b!41970 m!35501))

(declare-fun m!35503 () Bool)

(assert (=> b!41970 m!35503))

(declare-fun m!35505 () Bool)

(assert (=> b!41970 m!35505))

(declare-fun m!35507 () Bool)

(assert (=> b!41970 m!35507))

(declare-fun m!35509 () Bool)

(assert (=> b!41971 m!35509))

(check-sat (not start!6044) (not b_lambda!2177) tp_is_empty!1837 (not b_next!1447) (not b!41971) (not b!41970) b_and!2543)
(check-sat b_and!2543 (not b_next!1447))
(get-model)

(declare-fun b_lambda!2185 () Bool)

(assert (= b_lambda!2177 (or (and start!6044 b_free!1447) b_lambda!2185)))

(check-sat (not start!6044) (not b_lambda!2185) tp_is_empty!1837 (not b_next!1447) (not b!41971) (not b!41970) b_and!2543)
(check-sat b_and!2543 (not b_next!1447))
(get-model)

(declare-fun d!7519 () Bool)

(get-info :version)

(assert (=> d!7519 (= (isEmpty!275 (toList!576 lt!17207)) ((_ is Nil!1119) (toList!576 lt!17207)))))

(assert (=> b!41971 d!7519))

(declare-fun b!42018 () Bool)

(declare-fun e!26562 () (_ BitVec 32))

(declare-fun call!3254 () (_ BitVec 32))

(assert (=> b!42018 (= e!26562 call!3254)))

(declare-fun b!42019 () Bool)

(declare-fun e!26563 () (_ BitVec 32))

(assert (=> b!42019 (= e!26563 e!26562)))

(declare-fun c!5245 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42019 (= c!5245 (validKeyInArray!0 (select (arr!1316 lt!17206) #b00000000000000000000000000000000)))))

(declare-fun d!7521 () Bool)

(declare-fun lt!17262 () (_ BitVec 32))

(assert (=> d!7521 (and (bvsge lt!17262 #b00000000000000000000000000000000) (bvsle lt!17262 (bvsub (size!1474 lt!17206) #b00000000000000000000000000000000)))))

(assert (=> d!7521 (= lt!17262 e!26563)))

(declare-fun c!5246 () Bool)

(assert (=> d!7521 (= c!5246 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7521 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1474 lt!17206)))))

(assert (=> d!7521 (= (arrayCountValidKeys!0 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17262)))

(declare-fun bm!3251 () Bool)

(assert (=> bm!3251 (= call!3254 (arrayCountValidKeys!0 lt!17206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42020 () Bool)

(assert (=> b!42020 (= e!26562 (bvadd #b00000000000000000000000000000001 call!3254))))

(declare-fun b!42021 () Bool)

(assert (=> b!42021 (= e!26563 #b00000000000000000000000000000000)))

(assert (= (and d!7521 c!5246) b!42021))

(assert (= (and d!7521 (not c!5246)) b!42019))

(assert (= (and b!42019 c!5245) b!42020))

(assert (= (and b!42019 (not c!5245)) b!42018))

(assert (= (or b!42020 b!42018) bm!3251))

(declare-fun m!35565 () Bool)

(assert (=> b!42019 m!35565))

(assert (=> b!42019 m!35565))

(declare-fun m!35567 () Bool)

(assert (=> b!42019 m!35567))

(declare-fun m!35569 () Bool)

(assert (=> bm!3251 m!35569))

(assert (=> b!41970 d!7521))

(declare-fun bm!3258 () Bool)

(declare-fun call!3261 () Bool)

(assert (=> bm!3258 (= call!3261 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17206 mask!853))))

(declare-fun b!42052 () Bool)

(declare-fun e!26584 () Bool)

(declare-fun e!26583 () Bool)

(assert (=> b!42052 (= e!26584 e!26583)))

(declare-fun c!5259 () Bool)

(assert (=> b!42052 (= c!5259 (validKeyInArray!0 (select (arr!1316 lt!17206) #b00000000000000000000000000000000)))))

(declare-fun b!42053 () Bool)

(declare-fun e!26582 () Bool)

(assert (=> b!42053 (= e!26583 e!26582)))

(declare-fun lt!17283 () (_ BitVec 64))

(assert (=> b!42053 (= lt!17283 (select (arr!1316 lt!17206) #b00000000000000000000000000000000))))

(declare-fun lt!17282 () Unit!1095)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2745 (_ BitVec 64) (_ BitVec 32)) Unit!1095)

(assert (=> b!42053 (= lt!17282 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17206 lt!17283 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42053 (arrayContainsKey!0 lt!17206 lt!17283 #b00000000000000000000000000000000)))

(declare-fun lt!17284 () Unit!1095)

(assert (=> b!42053 (= lt!17284 lt!17282)))

(declare-fun res!25033 () Bool)

(declare-datatypes ((SeekEntryResult!173 0))(
  ( (MissingZero!173 (index!2814 (_ BitVec 32))) (Found!173 (index!2815 (_ BitVec 32))) (Intermediate!173 (undefined!985 Bool) (index!2816 (_ BitVec 32)) (x!8002 (_ BitVec 32))) (Undefined!173) (MissingVacant!173 (index!2817 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2745 (_ BitVec 32)) SeekEntryResult!173)

(assert (=> b!42053 (= res!25033 (= (seekEntryOrOpen!0 (select (arr!1316 lt!17206) #b00000000000000000000000000000000) lt!17206 mask!853) (Found!173 #b00000000000000000000000000000000)))))

(assert (=> b!42053 (=> (not res!25033) (not e!26582))))

(declare-fun b!42054 () Bool)

(assert (=> b!42054 (= e!26582 call!3261)))

(declare-fun d!7527 () Bool)

(declare-fun res!25032 () Bool)

(assert (=> d!7527 (=> res!25032 e!26584)))

(assert (=> d!7527 (= res!25032 (bvsge #b00000000000000000000000000000000 (size!1474 lt!17206)))))

(assert (=> d!7527 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17206 mask!853) e!26584)))

(declare-fun b!42055 () Bool)

(assert (=> b!42055 (= e!26583 call!3261)))

(assert (= (and d!7527 (not res!25032)) b!42052))

(assert (= (and b!42052 c!5259) b!42053))

(assert (= (and b!42052 (not c!5259)) b!42055))

(assert (= (and b!42053 res!25033) b!42054))

(assert (= (or b!42054 b!42055) bm!3258))

(declare-fun m!35581 () Bool)

(assert (=> bm!3258 m!35581))

(assert (=> b!42052 m!35565))

(assert (=> b!42052 m!35565))

(assert (=> b!42052 m!35567))

(assert (=> b!42053 m!35565))

(declare-fun m!35583 () Bool)

(assert (=> b!42053 m!35583))

(declare-fun m!35585 () Bool)

(assert (=> b!42053 m!35585))

(assert (=> b!42053 m!35565))

(declare-fun m!35587 () Bool)

(assert (=> b!42053 m!35587))

(assert (=> b!41970 d!7527))

(declare-fun b!42072 () Bool)

(declare-fun e!26599 () Bool)

(declare-fun e!26600 () Bool)

(assert (=> b!42072 (= e!26599 e!26600)))

(declare-fun res!25046 () Bool)

(assert (=> b!42072 (=> (not res!25046) (not e!26600))))

(declare-fun e!26601 () Bool)

(assert (=> b!42072 (= res!25046 (not e!26601))))

(declare-fun res!25045 () Bool)

(assert (=> b!42072 (=> (not res!25045) (not e!26601))))

(assert (=> b!42072 (= res!25045 (validKeyInArray!0 (select (arr!1316 lt!17206) #b00000000000000000000000000000000)))))

(declare-fun d!7535 () Bool)

(declare-fun res!25044 () Bool)

(assert (=> d!7535 (=> res!25044 e!26599)))

(assert (=> d!7535 (= res!25044 (bvsge #b00000000000000000000000000000000 (size!1474 lt!17206)))))

(assert (=> d!7535 (= (arrayNoDuplicates!0 lt!17206 #b00000000000000000000000000000000 Nil!1120) e!26599)))

(declare-fun b!42073 () Bool)

(declare-fun e!26598 () Bool)

(declare-fun call!3267 () Bool)

(assert (=> b!42073 (= e!26598 call!3267)))

(declare-fun bm!3264 () Bool)

(declare-fun c!5263 () Bool)

(assert (=> bm!3264 (= call!3267 (arrayNoDuplicates!0 lt!17206 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5263 (Cons!1119 (select (arr!1316 lt!17206) #b00000000000000000000000000000000) Nil!1120) Nil!1120)))))

(declare-fun b!42074 () Bool)

(assert (=> b!42074 (= e!26598 call!3267)))

(declare-fun b!42075 () Bool)

(assert (=> b!42075 (= e!26600 e!26598)))

(assert (=> b!42075 (= c!5263 (validKeyInArray!0 (select (arr!1316 lt!17206) #b00000000000000000000000000000000)))))

(declare-fun b!42076 () Bool)

(declare-fun contains!541 (List!1123 (_ BitVec 64)) Bool)

(assert (=> b!42076 (= e!26601 (contains!541 Nil!1120 (select (arr!1316 lt!17206) #b00000000000000000000000000000000)))))

(assert (= (and d!7535 (not res!25044)) b!42072))

(assert (= (and b!42072 res!25045) b!42076))

(assert (= (and b!42072 res!25046) b!42075))

(assert (= (and b!42075 c!5263) b!42073))

(assert (= (and b!42075 (not c!5263)) b!42074))

(assert (= (or b!42073 b!42074) bm!3264))

(assert (=> b!42072 m!35565))

(assert (=> b!42072 m!35565))

(assert (=> b!42072 m!35567))

(assert (=> bm!3264 m!35565))

(declare-fun m!35599 () Bool)

(assert (=> bm!3264 m!35599))

(assert (=> b!42075 m!35565))

(assert (=> b!42075 m!35565))

(assert (=> b!42075 m!35567))

(assert (=> b!42076 m!35565))

(assert (=> b!42076 m!35565))

(declare-fun m!35601 () Bool)

(assert (=> b!42076 m!35601))

(assert (=> b!41970 d!7535))

(declare-fun d!7541 () Bool)

(assert (=> d!7541 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17206 mask!853)))

(declare-fun lt!17293 () Unit!1095)

(declare-fun choose!34 (array!2745 (_ BitVec 32) (_ BitVec 32)) Unit!1095)

(assert (=> d!7541 (= lt!17293 (choose!34 lt!17206 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7541 (validMask!0 mask!853)))

(assert (=> d!7541 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17206 mask!853 #b00000000000000000000000000000000) lt!17293)))

(declare-fun bs!1813 () Bool)

(assert (= bs!1813 d!7541))

(assert (=> bs!1813 m!35495))

(declare-fun m!35609 () Bool)

(assert (=> bs!1813 m!35609))

(assert (=> bs!1813 m!35491))

(assert (=> b!41970 d!7541))

(declare-fun d!7547 () Bool)

(declare-fun getCurrentListMap!327 (array!2745 array!2747 (_ BitVec 32) (_ BitVec 32) V!2209 V!2209 (_ BitVec 32) Int) ListLongMap!1121)

(assert (=> d!7547 (= (map!759 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!327 (_keys!3367 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1837 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5288 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1745 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1772 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1772 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1854 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17204 lt!17204 #b00000000000000000000000000000000 lt!17206 (array!2748 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1816 () Bool)

(assert (= bs!1816 d!7547))

(declare-fun m!35619 () Bool)

(assert (=> bs!1816 m!35619))

(assert (=> b!41970 d!7547))

(declare-fun d!7555 () Bool)

(assert (=> d!7555 (= (arrayCountValidKeys!0 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17305 () Unit!1095)

(declare-fun choose!59 (array!2745 (_ BitVec 32) (_ BitVec 32)) Unit!1095)

(assert (=> d!7555 (= lt!17305 (choose!59 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7555 (bvslt (size!1474 lt!17206) #b01111111111111111111111111111111)))

(assert (=> d!7555 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17305)))

(declare-fun bs!1818 () Bool)

(assert (= bs!1818 d!7555))

(assert (=> bs!1818 m!35497))

(declare-fun m!35623 () Bool)

(assert (=> bs!1818 m!35623))

(assert (=> b!41970 d!7555))

(declare-fun d!7561 () Bool)

(assert (=> d!7561 (arrayNoDuplicates!0 lt!17206 #b00000000000000000000000000000000 Nil!1120)))

(declare-fun lt!17308 () Unit!1095)

(declare-fun choose!111 (array!2745 (_ BitVec 32) (_ BitVec 32) List!1123) Unit!1095)

(assert (=> d!7561 (= lt!17308 (choose!111 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1120))))

(assert (=> d!7561 (= (size!1474 lt!17206) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7561 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!17206 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1120) lt!17308)))

(declare-fun bs!1819 () Bool)

(assert (= bs!1819 d!7561))

(assert (=> bs!1819 m!35501))

(declare-fun m!35625 () Bool)

(assert (=> bs!1819 m!35625))

(assert (=> b!41970 d!7561))

(declare-fun d!7563 () Bool)

(assert (=> d!7563 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6044 d!7563))

(check-sat (not b!42052) (not b!42076) (not bm!3251) (not bm!3264) (not bm!3258) (not d!7561) (not d!7547) tp_is_empty!1837 (not d!7541) (not d!7555) (not b_next!1447) (not b!42072) (not b!42053) (not b!42019) b_and!2543 (not b!42075) (not b_lambda!2185))
(check-sat b_and!2543 (not b_next!1447))
