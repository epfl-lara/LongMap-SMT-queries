; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5952 () Bool)

(assert start!5952)

(declare-fun b_free!1431 () Bool)

(declare-fun b_next!1431 () Bool)

(assert (=> start!5952 (= b_free!1431 (not b_next!1431))))

(declare-fun tp!5834 () Bool)

(declare-fun b_and!2511 () Bool)

(assert (=> start!5952 (= tp!5834 b_and!2511)))

(declare-fun b!41767 () Bool)

(declare-fun res!24895 () Bool)

(declare-fun e!26391 () Bool)

(assert (=> b!41767 (=> res!24895 e!26391)))

(declare-datatypes ((V!2187 0))(
  ( (V!2188 (val!949 Int)) )
))
(declare-datatypes ((tuple2!1552 0))(
  ( (tuple2!1553 (_1!787 (_ BitVec 64)) (_2!787 V!2187)) )
))
(declare-datatypes ((List!1120 0))(
  ( (Nil!1117) (Cons!1116 (h!1693 tuple2!1552) (t!4047 List!1120)) )
))
(declare-datatypes ((ListLongMap!1129 0))(
  ( (ListLongMap!1130 (toList!580 List!1120)) )
))
(declare-fun lt!16937 () ListLongMap!1129)

(declare-fun isEmpty!266 (List!1120) Bool)

(assert (=> b!41767 (= res!24895 (isEmpty!266 (toList!580 lt!16937)))))

(declare-fun b!41766 () Bool)

(declare-fun e!26392 () Bool)

(assert (=> b!41766 (= e!26392 (not e!26391))))

(declare-fun res!24894 () Bool)

(assert (=> b!41766 (=> res!24894 e!26391)))

(assert (=> b!41766 (= res!24894 (= lt!16937 (ListLongMap!1130 Nil!1117)))))

(declare-fun lt!16933 () V!2187)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!663 0))(
  ( (ValueCellFull!663 (v!2033 V!2187)) (EmptyCell!663) )
))
(declare-datatypes ((array!2727 0))(
  ( (array!2728 (arr!1307 (Array (_ BitVec 32) ValueCell!663)) (size!1459 (_ BitVec 32))) )
))
(declare-fun lt!16929 () array!2727)

(declare-datatypes ((array!2729 0))(
  ( (array!2730 (arr!1308 (Array (_ BitVec 32) (_ BitVec 64))) (size!1460 (_ BitVec 32))) )
))
(declare-fun lt!16934 () array!2729)

(declare-datatypes ((LongMapFixedSize!306 0))(
  ( (LongMapFixedSize!307 (defaultEntry!1843 Int) (mask!5262 (_ BitVec 32)) (extraKeys!1734 (_ BitVec 32)) (zeroValue!1761 V!2187) (minValue!1761 V!2187) (_size!202 (_ BitVec 32)) (_keys!3350 array!2729) (_values!1826 array!2727) (_vacant!202 (_ BitVec 32))) )
))
(declare-fun map!745 (LongMapFixedSize!306) ListLongMap!1129)

(assert (=> b!41766 (= lt!16937 (map!745 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1121 0))(
  ( (Nil!1118) (Cons!1117 (h!1694 (_ BitVec 64)) (t!4048 List!1121)) )
))
(declare-fun arrayNoDuplicates!0 (array!2729 (_ BitVec 32) List!1121) Bool)

(assert (=> b!41766 (arrayNoDuplicates!0 lt!16934 #b00000000000000000000000000000000 Nil!1118)))

(declare-datatypes ((Unit!1061 0))(
  ( (Unit!1062) )
))
(declare-fun lt!16932 () Unit!1061)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2729 (_ BitVec 32) (_ BitVec 32) List!1121) Unit!1061)

(assert (=> b!41766 (= lt!16932 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2729 (_ BitVec 32)) Bool)

(assert (=> b!41766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16934 mask!853)))

(declare-fun lt!16930 () Unit!1061)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1061)

(assert (=> b!41766 (= lt!16930 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16934 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41766 (= (arrayCountValidKeys!0 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16931 () Unit!1061)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1061)

(assert (=> b!41766 (= lt!16931 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41766 (= lt!16929 (array!2728 ((as const (Array (_ BitVec 32) ValueCell!663)) EmptyCell!663) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41766 (= lt!16934 (array!2730 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!224 (Int (_ BitVec 64)) V!2187)

(assert (=> b!41766 (= lt!16933 (dynLambda!224 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!24897 () Bool)

(assert (=> start!5952 (=> (not res!24897) (not e!26392))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5952 (= res!24897 (validMask!0 mask!853))))

(assert (=> start!5952 e!26392))

(assert (=> start!5952 true))

(assert (=> start!5952 tp!5834))

(declare-fun b!41768 () Bool)

(assert (=> b!41768 (= e!26391 (and (bvslt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(declare-fun e!26390 () Bool)

(assert (=> b!41768 e!26390))

(declare-fun res!24896 () Bool)

(assert (=> b!41768 (=> (not res!24896) (not e!26390))))

(declare-fun lt!16935 () tuple2!1552)

(assert (=> b!41768 (= res!24896 (and (not (= (_1!787 lt!16935) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!787 lt!16935) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16936 () Unit!1061)

(declare-fun lemmaKeyInListMapIsInArray!95 (array!2729 array!2727 (_ BitVec 32) (_ BitVec 32) V!2187 V!2187 (_ BitVec 64) Int) Unit!1061)

(assert (=> b!41768 (= lt!16936 (lemmaKeyInListMapIsInArray!95 lt!16934 lt!16929 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 (_1!787 lt!16935) defaultEntry!470))))

(declare-fun head!879 (List!1120) tuple2!1552)

(assert (=> b!41768 (= lt!16935 (head!879 (toList!580 lt!16937)))))

(declare-fun b!41769 () Bool)

(declare-fun arrayContainsKey!0 (array!2729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41769 (= e!26390 (arrayContainsKey!0 lt!16934 (_1!787 lt!16935) #b00000000000000000000000000000000))))

(assert (= (and start!5952 res!24897) b!41766))

(assert (= (and b!41766 (not res!24894)) b!41767))

(assert (= (and b!41767 (not res!24895)) b!41768))

(assert (= (and b!41768 res!24896) b!41769))

(declare-fun b_lambda!2155 () Bool)

(assert (=> (not b_lambda!2155) (not b!41766)))

(declare-fun t!4046 () Bool)

(declare-fun tb!913 () Bool)

(assert (=> (and start!5952 (= defaultEntry!470 defaultEntry!470) t!4046) tb!913))

(declare-fun result!1577 () Bool)

(declare-fun tp_is_empty!1821 () Bool)

(assert (=> tb!913 (= result!1577 tp_is_empty!1821)))

(assert (=> b!41766 t!4046))

(declare-fun b_and!2513 () Bool)

(assert (= b_and!2511 (and (=> t!4046 result!1577) b_and!2513)))

(declare-fun m!35313 () Bool)

(assert (=> start!5952 m!35313))

(declare-fun m!35315 () Bool)

(assert (=> b!41768 m!35315))

(declare-fun m!35317 () Bool)

(assert (=> b!41768 m!35317))

(declare-fun m!35319 () Bool)

(assert (=> b!41769 m!35319))

(declare-fun m!35321 () Bool)

(assert (=> b!41766 m!35321))

(declare-fun m!35323 () Bool)

(assert (=> b!41766 m!35323))

(declare-fun m!35325 () Bool)

(assert (=> b!41766 m!35325))

(declare-fun m!35327 () Bool)

(assert (=> b!41766 m!35327))

(declare-fun m!35329 () Bool)

(assert (=> b!41766 m!35329))

(declare-fun m!35331 () Bool)

(assert (=> b!41766 m!35331))

(declare-fun m!35333 () Bool)

(assert (=> b!41766 m!35333))

(declare-fun m!35335 () Bool)

(assert (=> b!41766 m!35335))

(declare-fun m!35337 () Bool)

(assert (=> b!41767 m!35337))

(check-sat (not b!41767) (not b!41766) tp_is_empty!1821 b_and!2513 (not start!5952) (not b!41769) (not b_next!1431) (not b_lambda!2155) (not b!41768))
(check-sat b_and!2513 (not b_next!1431))
(get-model)

(declare-fun b_lambda!2159 () Bool)

(assert (= b_lambda!2155 (or (and start!5952 b_free!1431) b_lambda!2159)))

(check-sat (not b!41767) (not b!41766) tp_is_empty!1821 b_and!2513 (not start!5952) (not b!41769) (not b_next!1431) (not b_lambda!2159) (not b!41768))
(check-sat b_and!2513 (not b_next!1431))
(get-model)

(declare-fun d!7453 () Bool)

(get-info :version)

(assert (=> d!7453 (= (isEmpty!266 (toList!580 lt!16937)) ((_ is Nil!1117) (toList!580 lt!16937)))))

(assert (=> b!41767 d!7453))

(declare-fun bm!3233 () Bool)

(declare-fun call!3236 () Bool)

(assert (=> bm!3233 (= call!3236 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!16934 mask!853))))

(declare-fun b!41808 () Bool)

(declare-fun e!26419 () Bool)

(declare-fun e!26418 () Bool)

(assert (=> b!41808 (= e!26419 e!26418)))

(declare-fun c!5203 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!41808 (= c!5203 (validKeyInArray!0 (select (arr!1308 lt!16934) #b00000000000000000000000000000000)))))

(declare-fun b!41809 () Bool)

(declare-fun e!26417 () Bool)

(assert (=> b!41809 (= e!26417 call!3236)))

(declare-fun b!41810 () Bool)

(assert (=> b!41810 (= e!26418 e!26417)))

(declare-fun lt!16981 () (_ BitVec 64))

(assert (=> b!41810 (= lt!16981 (select (arr!1308 lt!16934) #b00000000000000000000000000000000))))

(declare-fun lt!16982 () Unit!1061)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2729 (_ BitVec 64) (_ BitVec 32)) Unit!1061)

(assert (=> b!41810 (= lt!16982 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!16934 lt!16981 #b00000000000000000000000000000000))))

(assert (=> b!41810 (arrayContainsKey!0 lt!16934 lt!16981 #b00000000000000000000000000000000)))

(declare-fun lt!16980 () Unit!1061)

(assert (=> b!41810 (= lt!16980 lt!16982)))

(declare-fun res!24918 () Bool)

(declare-datatypes ((SeekEntryResult!175 0))(
  ( (MissingZero!175 (index!2822 (_ BitVec 32))) (Found!175 (index!2823 (_ BitVec 32))) (Intermediate!175 (undefined!987 Bool) (index!2824 (_ BitVec 32)) (x!7945 (_ BitVec 32))) (Undefined!175) (MissingVacant!175 (index!2825 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2729 (_ BitVec 32)) SeekEntryResult!175)

(assert (=> b!41810 (= res!24918 (= (seekEntryOrOpen!0 (select (arr!1308 lt!16934) #b00000000000000000000000000000000) lt!16934 mask!853) (Found!175 #b00000000000000000000000000000000)))))

(assert (=> b!41810 (=> (not res!24918) (not e!26417))))

(declare-fun b!41811 () Bool)

(assert (=> b!41811 (= e!26418 call!3236)))

(declare-fun d!7455 () Bool)

(declare-fun res!24919 () Bool)

(assert (=> d!7455 (=> res!24919 e!26419)))

(assert (=> d!7455 (= res!24919 (bvsge #b00000000000000000000000000000000 (size!1460 lt!16934)))))

(assert (=> d!7455 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16934 mask!853) e!26419)))

(assert (= (and d!7455 (not res!24919)) b!41808))

(assert (= (and b!41808 c!5203) b!41810))

(assert (= (and b!41808 (not c!5203)) b!41811))

(assert (= (and b!41810 res!24918) b!41809))

(assert (= (or b!41809 b!41811) bm!3233))

(declare-fun m!35367 () Bool)

(assert (=> bm!3233 m!35367))

(declare-fun m!35369 () Bool)

(assert (=> b!41808 m!35369))

(assert (=> b!41808 m!35369))

(declare-fun m!35371 () Bool)

(assert (=> b!41808 m!35371))

(assert (=> b!41810 m!35369))

(declare-fun m!35373 () Bool)

(assert (=> b!41810 m!35373))

(declare-fun m!35375 () Bool)

(assert (=> b!41810 m!35375))

(assert (=> b!41810 m!35369))

(declare-fun m!35377 () Bool)

(assert (=> b!41810 m!35377))

(assert (=> b!41766 d!7455))

(declare-fun b!41836 () Bool)

(declare-fun e!26437 () (_ BitVec 32))

(assert (=> b!41836 (= e!26437 #b00000000000000000000000000000000)))

(declare-fun b!41837 () Bool)

(declare-fun e!26436 () (_ BitVec 32))

(declare-fun call!3245 () (_ BitVec 32))

(assert (=> b!41837 (= e!26436 call!3245)))

(declare-fun b!41838 () Bool)

(assert (=> b!41838 (= e!26437 e!26436)))

(declare-fun c!5213 () Bool)

(assert (=> b!41838 (= c!5213 (validKeyInArray!0 (select (arr!1308 lt!16934) #b00000000000000000000000000000000)))))

(declare-fun b!41839 () Bool)

(assert (=> b!41839 (= e!26436 (bvadd #b00000000000000000000000000000001 call!3245))))

(declare-fun d!7467 () Bool)

(declare-fun lt!16997 () (_ BitVec 32))

(assert (=> d!7467 (and (bvsge lt!16997 #b00000000000000000000000000000000) (bvsle lt!16997 (bvsub (size!1460 lt!16934) #b00000000000000000000000000000000)))))

(assert (=> d!7467 (= lt!16997 e!26437)))

(declare-fun c!5212 () Bool)

(assert (=> d!7467 (= c!5212 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7467 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1460 lt!16934)))))

(assert (=> d!7467 (= (arrayCountValidKeys!0 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!16997)))

(declare-fun bm!3242 () Bool)

(assert (=> bm!3242 (= call!3245 (arrayCountValidKeys!0 lt!16934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7467 c!5212) b!41836))

(assert (= (and d!7467 (not c!5212)) b!41838))

(assert (= (and b!41838 c!5213) b!41839))

(assert (= (and b!41838 (not c!5213)) b!41837))

(assert (= (or b!41839 b!41837) bm!3242))

(assert (=> b!41838 m!35369))

(assert (=> b!41838 m!35369))

(assert (=> b!41838 m!35371))

(declare-fun m!35403 () Bool)

(assert (=> bm!3242 m!35403))

(assert (=> b!41766 d!7467))

(declare-fun b!41862 () Bool)

(declare-fun e!26455 () Bool)

(declare-fun contains!547 (List!1121 (_ BitVec 64)) Bool)

(assert (=> b!41862 (= e!26455 (contains!547 Nil!1118 (select (arr!1308 lt!16934) #b00000000000000000000000000000000)))))

(declare-fun d!7473 () Bool)

(declare-fun res!24935 () Bool)

(declare-fun e!26454 () Bool)

(assert (=> d!7473 (=> res!24935 e!26454)))

(assert (=> d!7473 (= res!24935 (bvsge #b00000000000000000000000000000000 (size!1460 lt!16934)))))

(assert (=> d!7473 (= (arrayNoDuplicates!0 lt!16934 #b00000000000000000000000000000000 Nil!1118) e!26454)))

(declare-fun b!41863 () Bool)

(declare-fun e!26452 () Bool)

(declare-fun call!3251 () Bool)

(assert (=> b!41863 (= e!26452 call!3251)))

(declare-fun b!41864 () Bool)

(declare-fun e!26453 () Bool)

(assert (=> b!41864 (= e!26454 e!26453)))

(declare-fun res!24934 () Bool)

(assert (=> b!41864 (=> (not res!24934) (not e!26453))))

(assert (=> b!41864 (= res!24934 (not e!26455))))

(declare-fun res!24936 () Bool)

(assert (=> b!41864 (=> (not res!24936) (not e!26455))))

(assert (=> b!41864 (= res!24936 (validKeyInArray!0 (select (arr!1308 lt!16934) #b00000000000000000000000000000000)))))

(declare-fun bm!3248 () Bool)

(declare-fun c!5222 () Bool)

(assert (=> bm!3248 (= call!3251 (arrayNoDuplicates!0 lt!16934 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5222 (Cons!1117 (select (arr!1308 lt!16934) #b00000000000000000000000000000000) Nil!1118) Nil!1118)))))

(declare-fun b!41865 () Bool)

(assert (=> b!41865 (= e!26453 e!26452)))

(assert (=> b!41865 (= c!5222 (validKeyInArray!0 (select (arr!1308 lt!16934) #b00000000000000000000000000000000)))))

(declare-fun b!41866 () Bool)

(assert (=> b!41866 (= e!26452 call!3251)))

(assert (= (and d!7473 (not res!24935)) b!41864))

(assert (= (and b!41864 res!24936) b!41862))

(assert (= (and b!41864 res!24934) b!41865))

(assert (= (and b!41865 c!5222) b!41866))

(assert (= (and b!41865 (not c!5222)) b!41863))

(assert (= (or b!41866 b!41863) bm!3248))

(assert (=> b!41862 m!35369))

(assert (=> b!41862 m!35369))

(declare-fun m!35409 () Bool)

(assert (=> b!41862 m!35409))

(assert (=> b!41864 m!35369))

(assert (=> b!41864 m!35369))

(assert (=> b!41864 m!35371))

(assert (=> bm!3248 m!35369))

(declare-fun m!35411 () Bool)

(assert (=> bm!3248 m!35411))

(assert (=> b!41865 m!35369))

(assert (=> b!41865 m!35369))

(assert (=> b!41865 m!35371))

(assert (=> b!41766 d!7473))

(declare-fun d!7479 () Bool)

(assert (=> d!7479 (= (arrayCountValidKeys!0 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17006 () Unit!1061)

(declare-fun choose!59 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1061)

(assert (=> d!7479 (= lt!17006 (choose!59 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7479 (bvslt (size!1460 lt!16934) #b01111111111111111111111111111111)))

(assert (=> d!7479 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17006)))

(declare-fun bs!1791 () Bool)

(assert (= bs!1791 d!7479))

(assert (=> bs!1791 m!35321))

(declare-fun m!35415 () Bool)

(assert (=> bs!1791 m!35415))

(assert (=> b!41766 d!7479))

(declare-fun d!7483 () Bool)

(declare-fun getCurrentListMap!341 (array!2729 array!2727 (_ BitVec 32) (_ BitVec 32) V!2187 V!2187 (_ BitVec 32) Int) ListLongMap!1129)

(assert (=> d!7483 (= (map!745 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)) (getCurrentListMap!341 (_keys!3350 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)) (_values!1826 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)) (mask!5262 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)) (extraKeys!1734 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)) (zeroValue!1761 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)) (minValue!1761 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1843 (LongMapFixedSize!307 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 #b00000000000000000000000000000000 lt!16934 lt!16929 #b00000000000000000000000000000000))))))

(declare-fun bs!1793 () Bool)

(assert (= bs!1793 d!7483))

(declare-fun m!35421 () Bool)

(assert (=> bs!1793 m!35421))

(assert (=> b!41766 d!7483))

(declare-fun d!7489 () Bool)

(assert (=> d!7489 (arrayNoDuplicates!0 lt!16934 #b00000000000000000000000000000000 Nil!1118)))

(declare-fun lt!17014 () Unit!1061)

(declare-fun choose!111 (array!2729 (_ BitVec 32) (_ BitVec 32) List!1121) Unit!1061)

(assert (=> d!7489 (= lt!17014 (choose!111 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1118))))

(assert (=> d!7489 (= (size!1460 lt!16934) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7489 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!16934 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1118) lt!17014)))

(declare-fun bs!1794 () Bool)

(assert (= bs!1794 d!7489))

(assert (=> bs!1794 m!35329))

(declare-fun m!35427 () Bool)

(assert (=> bs!1794 m!35427))

(assert (=> b!41766 d!7489))

(declare-fun d!7493 () Bool)

(assert (=> d!7493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16934 mask!853)))

(declare-fun lt!17024 () Unit!1061)

(declare-fun choose!34 (array!2729 (_ BitVec 32) (_ BitVec 32)) Unit!1061)

(assert (=> d!7493 (= lt!17024 (choose!34 lt!16934 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7493 (validMask!0 mask!853)))

(assert (=> d!7493 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16934 mask!853 #b00000000000000000000000000000000) lt!17024)))

(declare-fun bs!1798 () Bool)

(assert (= bs!1798 d!7493))

(assert (=> bs!1798 m!35325))

(declare-fun m!35435 () Bool)

(assert (=> bs!1798 m!35435))

(assert (=> bs!1798 m!35313))

(assert (=> b!41766 d!7493))

(declare-fun d!7501 () Bool)

(declare-fun res!24956 () Bool)

(declare-fun e!26486 () Bool)

(assert (=> d!7501 (=> res!24956 e!26486)))

(assert (=> d!7501 (= res!24956 (= (select (arr!1308 lt!16934) #b00000000000000000000000000000000) (_1!787 lt!16935)))))

(assert (=> d!7501 (= (arrayContainsKey!0 lt!16934 (_1!787 lt!16935) #b00000000000000000000000000000000) e!26486)))

(declare-fun b!41908 () Bool)

(declare-fun e!26487 () Bool)

(assert (=> b!41908 (= e!26486 e!26487)))

(declare-fun res!24957 () Bool)

(assert (=> b!41908 (=> (not res!24957) (not e!26487))))

(assert (=> b!41908 (= res!24957 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1460 lt!16934)))))

(declare-fun b!41909 () Bool)

(assert (=> b!41909 (= e!26487 (arrayContainsKey!0 lt!16934 (_1!787 lt!16935) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7501 (not res!24956)) b!41908))

(assert (= (and b!41908 res!24957) b!41909))

(assert (=> d!7501 m!35369))

(declare-fun m!35439 () Bool)

(assert (=> b!41909 m!35439))

(assert (=> b!41769 d!7501))

(declare-fun d!7505 () Bool)

(assert (=> d!7505 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5952 d!7505))

(declare-fun d!7513 () Bool)

(declare-fun e!26506 () Bool)

(assert (=> d!7513 e!26506))

(declare-fun c!5237 () Bool)

(assert (=> d!7513 (= c!5237 (and (not (= (_1!787 lt!16935) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!787 lt!16935) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!17033 () Unit!1061)

(declare-fun choose!251 (array!2729 array!2727 (_ BitVec 32) (_ BitVec 32) V!2187 V!2187 (_ BitVec 64) Int) Unit!1061)

(assert (=> d!7513 (= lt!17033 (choose!251 lt!16934 lt!16929 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 (_1!787 lt!16935) defaultEntry!470))))

(assert (=> d!7513 (validMask!0 mask!853)))

(assert (=> d!7513 (= (lemmaKeyInListMapIsInArray!95 lt!16934 lt!16929 mask!853 #b00000000000000000000000000000000 lt!16933 lt!16933 (_1!787 lt!16935) defaultEntry!470) lt!17033)))

(declare-fun b!41931 () Bool)

(assert (=> b!41931 (= e!26506 (arrayContainsKey!0 lt!16934 (_1!787 lt!16935) #b00000000000000000000000000000000))))

(declare-fun b!41932 () Bool)

(assert (=> b!41932 (= e!26506 (ite (= (_1!787 lt!16935) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!7513 c!5237) b!41931))

(assert (= (and d!7513 (not c!5237)) b!41932))

(declare-fun m!35451 () Bool)

(assert (=> d!7513 m!35451))

(assert (=> d!7513 m!35313))

(assert (=> b!41931 m!35319))

(assert (=> b!41768 d!7513))

(declare-fun d!7519 () Bool)

(assert (=> d!7519 (= (head!879 (toList!580 lt!16937)) (h!1693 (toList!580 lt!16937)))))

(assert (=> b!41768 d!7519))

(check-sat (not d!7483) (not b!41808) (not d!7489) (not d!7513) b_and!2513 (not b!41909) (not bm!3248) (not b_next!1431) (not b!41931) (not b!41838) (not b!41865) (not d!7479) (not bm!3242) (not b!41864) (not b!41862) tp_is_empty!1821 (not bm!3233) (not d!7493) (not b_lambda!2159) (not b!41810))
(check-sat b_and!2513 (not b_next!1431))
