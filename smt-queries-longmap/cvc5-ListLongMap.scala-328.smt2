; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5950 () Bool)

(assert start!5950)

(declare-fun b_free!1429 () Bool)

(declare-fun b_next!1429 () Bool)

(assert (=> start!5950 (= b_free!1429 (not b_next!1429))))

(declare-fun tp!5831 () Bool)

(declare-fun b_and!2507 () Bool)

(assert (=> start!5950 (= tp!5831 b_and!2507)))

(declare-fun res!24882 () Bool)

(declare-fun e!26381 () Bool)

(assert (=> start!5950 (=> (not res!24882) (not e!26381))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5950 (= res!24882 (validMask!0 mask!853))))

(assert (=> start!5950 e!26381))

(assert (=> start!5950 true))

(assert (=> start!5950 tp!5831))

(declare-fun b!41755 () Bool)

(declare-fun e!26382 () Bool)

(declare-datatypes ((array!2723 0))(
  ( (array!2724 (arr!1305 (Array (_ BitVec 32) (_ BitVec 64))) (size!1457 (_ BitVec 32))) )
))
(declare-fun lt!16905 () array!2723)

(declare-datatypes ((V!2185 0))(
  ( (V!2186 (val!948 Int)) )
))
(declare-datatypes ((tuple2!1550 0))(
  ( (tuple2!1551 (_1!786 (_ BitVec 64)) (_2!786 V!2185)) )
))
(declare-fun lt!16903 () tuple2!1550)

(declare-fun arrayContainsKey!0 (array!2723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41755 (= e!26382 (arrayContainsKey!0 lt!16905 (_1!786 lt!16903) #b00000000000000000000000000000000))))

(declare-fun b!41754 () Bool)

(declare-fun e!26383 () Bool)

(assert (=> b!41754 (= e!26383 (and (bvslt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(assert (=> b!41754 e!26382))

(declare-fun res!24883 () Bool)

(assert (=> b!41754 (=> (not res!24883) (not e!26382))))

(assert (=> b!41754 (= res!24883 (and (not (= (_1!786 lt!16903) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!786 lt!16903) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16910 () V!2185)

(declare-datatypes ((Unit!1059 0))(
  ( (Unit!1060) )
))
(declare-fun lt!16907 () Unit!1059)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((ValueCell!662 0))(
  ( (ValueCellFull!662 (v!2032 V!2185)) (EmptyCell!662) )
))
(declare-datatypes ((array!2725 0))(
  ( (array!2726 (arr!1306 (Array (_ BitVec 32) ValueCell!662)) (size!1458 (_ BitVec 32))) )
))
(declare-fun lt!16906 () array!2725)

(declare-fun lemmaKeyInListMapIsInArray!94 (array!2723 array!2725 (_ BitVec 32) (_ BitVec 32) V!2185 V!2185 (_ BitVec 64) Int) Unit!1059)

(assert (=> b!41754 (= lt!16907 (lemmaKeyInListMapIsInArray!94 lt!16905 lt!16906 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 (_1!786 lt!16903) defaultEntry!470))))

(declare-datatypes ((List!1118 0))(
  ( (Nil!1115) (Cons!1114 (h!1691 tuple2!1550) (t!4043 List!1118)) )
))
(declare-datatypes ((ListLongMap!1127 0))(
  ( (ListLongMap!1128 (toList!579 List!1118)) )
))
(declare-fun lt!16904 () ListLongMap!1127)

(declare-fun head!878 (List!1118) tuple2!1550)

(assert (=> b!41754 (= lt!16903 (head!878 (toList!579 lt!16904)))))

(declare-fun b!41752 () Bool)

(assert (=> b!41752 (= e!26381 (not e!26383))))

(declare-fun res!24885 () Bool)

(assert (=> b!41752 (=> res!24885 e!26383)))

(assert (=> b!41752 (= res!24885 (= lt!16904 (ListLongMap!1128 Nil!1115)))))

(declare-datatypes ((LongMapFixedSize!304 0))(
  ( (LongMapFixedSize!305 (defaultEntry!1842 Int) (mask!5261 (_ BitVec 32)) (extraKeys!1733 (_ BitVec 32)) (zeroValue!1760 V!2185) (minValue!1760 V!2185) (_size!201 (_ BitVec 32)) (_keys!3349 array!2723) (_values!1825 array!2725) (_vacant!201 (_ BitVec 32))) )
))
(declare-fun map!744 (LongMapFixedSize!304) ListLongMap!1127)

(assert (=> b!41752 (= lt!16904 (map!744 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1119 0))(
  ( (Nil!1116) (Cons!1115 (h!1692 (_ BitVec 64)) (t!4044 List!1119)) )
))
(declare-fun arrayNoDuplicates!0 (array!2723 (_ BitVec 32) List!1119) Bool)

(assert (=> b!41752 (arrayNoDuplicates!0 lt!16905 #b00000000000000000000000000000000 Nil!1116)))

(declare-fun lt!16909 () Unit!1059)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2723 (_ BitVec 32) (_ BitVec 32) List!1119) Unit!1059)

(assert (=> b!41752 (= lt!16909 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2723 (_ BitVec 32)) Bool)

(assert (=> b!41752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16905 mask!853)))

(declare-fun lt!16902 () Unit!1059)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2723 (_ BitVec 32) (_ BitVec 32)) Unit!1059)

(assert (=> b!41752 (= lt!16902 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16905 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2723 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41752 (= (arrayCountValidKeys!0 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16908 () Unit!1059)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2723 (_ BitVec 32) (_ BitVec 32)) Unit!1059)

(assert (=> b!41752 (= lt!16908 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41752 (= lt!16906 (array!2726 ((as const (Array (_ BitVec 32) ValueCell!662)) EmptyCell!662) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41752 (= lt!16905 (array!2724 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!223 (Int (_ BitVec 64)) V!2185)

(assert (=> b!41752 (= lt!16910 (dynLambda!223 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41753 () Bool)

(declare-fun res!24884 () Bool)

(assert (=> b!41753 (=> res!24884 e!26383)))

(declare-fun isEmpty!265 (List!1118) Bool)

(assert (=> b!41753 (= res!24884 (isEmpty!265 (toList!579 lt!16904)))))

(assert (= (and start!5950 res!24882) b!41752))

(assert (= (and b!41752 (not res!24885)) b!41753))

(assert (= (and b!41753 (not res!24884)) b!41754))

(assert (= (and b!41754 res!24883) b!41755))

(declare-fun b_lambda!2153 () Bool)

(assert (=> (not b_lambda!2153) (not b!41752)))

(declare-fun t!4042 () Bool)

(declare-fun tb!911 () Bool)

(assert (=> (and start!5950 (= defaultEntry!470 defaultEntry!470) t!4042) tb!911))

(declare-fun result!1573 () Bool)

(declare-fun tp_is_empty!1819 () Bool)

(assert (=> tb!911 (= result!1573 tp_is_empty!1819)))

(assert (=> b!41752 t!4042))

(declare-fun b_and!2509 () Bool)

(assert (= b_and!2507 (and (=> t!4042 result!1573) b_and!2509)))

(declare-fun m!35287 () Bool)

(assert (=> b!41752 m!35287))

(declare-fun m!35289 () Bool)

(assert (=> b!41752 m!35289))

(declare-fun m!35291 () Bool)

(assert (=> b!41752 m!35291))

(declare-fun m!35293 () Bool)

(assert (=> b!41752 m!35293))

(declare-fun m!35295 () Bool)

(assert (=> b!41752 m!35295))

(declare-fun m!35297 () Bool)

(assert (=> b!41752 m!35297))

(declare-fun m!35299 () Bool)

(assert (=> b!41752 m!35299))

(declare-fun m!35301 () Bool)

(assert (=> b!41752 m!35301))

(declare-fun m!35303 () Bool)

(assert (=> b!41753 m!35303))

(declare-fun m!35305 () Bool)

(assert (=> start!5950 m!35305))

(declare-fun m!35307 () Bool)

(assert (=> b!41754 m!35307))

(declare-fun m!35309 () Bool)

(assert (=> b!41754 m!35309))

(declare-fun m!35311 () Bool)

(assert (=> b!41755 m!35311))

(push 1)

(assert (not b!41753))

(assert (not b!41755))

(assert tp_is_empty!1819)

(assert (not start!5950))

(assert (not b_next!1429))

(assert (not b!41752))

(assert (not b!41754))

(assert b_and!2509)

(assert (not b_lambda!2153))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2509)

(assert (not b_next!1429))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2161 () Bool)

(assert (= b_lambda!2153 (or (and start!5950 b_free!1429) b_lambda!2161)))

(push 1)

(assert (not b!41753))

(assert (not b_lambda!2161))

(assert (not b!41755))

(assert tp_is_empty!1819)

(assert (not start!5950))

(assert (not b_next!1429))

(assert (not b!41752))

(assert b_and!2509)

(assert (not b!41754))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2509)

(assert (not b_next!1429))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7451 () Bool)

(declare-fun e!26404 () Bool)

(assert (=> d!7451 e!26404))

(declare-fun c!5198 () Bool)

(assert (=> d!7451 (= c!5198 (and (not (= (_1!786 lt!16903) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!786 lt!16903) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16967 () Unit!1059)

(declare-fun choose!250 (array!2723 array!2725 (_ BitVec 32) (_ BitVec 32) V!2185 V!2185 (_ BitVec 64) Int) Unit!1059)

(assert (=> d!7451 (= lt!16967 (choose!250 lt!16905 lt!16906 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 (_1!786 lt!16903) defaultEntry!470))))

(assert (=> d!7451 (validMask!0 mask!853)))

(assert (=> d!7451 (= (lemmaKeyInListMapIsInArray!94 lt!16905 lt!16906 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 (_1!786 lt!16903) defaultEntry!470) lt!16967)))

(declare-fun b!41790 () Bool)

(assert (=> b!41790 (= e!26404 (arrayContainsKey!0 lt!16905 (_1!786 lt!16903) #b00000000000000000000000000000000))))

(declare-fun b!41791 () Bool)

(assert (=> b!41791 (= e!26404 (ite (= (_1!786 lt!16903) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!7451 c!5198) b!41790))

(assert (= (and d!7451 (not c!5198)) b!41791))

(declare-fun m!35365 () Bool)

(assert (=> d!7451 m!35365))

(assert (=> d!7451 m!35305))

(assert (=> b!41790 m!35311))

(assert (=> b!41754 d!7451))

(declare-fun d!7461 () Bool)

(assert (=> d!7461 (= (head!878 (toList!579 lt!16904)) (h!1691 (toList!579 lt!16904)))))

(assert (=> b!41754 d!7461))

(declare-fun d!7463 () Bool)

(assert (=> d!7463 (= (isEmpty!265 (toList!579 lt!16904)) (is-Nil!1115 (toList!579 lt!16904)))))

(assert (=> b!41753 d!7463))

(declare-fun b!41832 () Bool)

(declare-fun e!26434 () Bool)

(declare-fun e!26435 () Bool)

(assert (=> b!41832 (= e!26434 e!26435)))

(declare-fun c!5211 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!41832 (= c!5211 (validKeyInArray!0 (select (arr!1305 lt!16905) #b00000000000000000000000000000000)))))

(declare-fun d!7465 () Bool)

(declare-fun res!24927 () Bool)

(assert (=> d!7465 (=> res!24927 e!26434)))

(assert (=> d!7465 (= res!24927 (bvsge #b00000000000000000000000000000000 (size!1457 lt!16905)))))

(assert (=> d!7465 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16905 mask!853) e!26434)))

(declare-fun b!41833 () Bool)

(declare-fun e!26433 () Bool)

(declare-fun call!3244 () Bool)

(assert (=> b!41833 (= e!26433 call!3244)))

(declare-fun b!41834 () Bool)

(assert (=> b!41834 (= e!26435 call!3244)))

(declare-fun bm!3241 () Bool)

(assert (=> bm!3241 (= call!3244 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!16905 mask!853))))

(declare-fun b!41835 () Bool)

(assert (=> b!41835 (= e!26435 e!26433)))

(declare-fun lt!16995 () (_ BitVec 64))

(assert (=> b!41835 (= lt!16995 (select (arr!1305 lt!16905) #b00000000000000000000000000000000))))

(declare-fun lt!16994 () Unit!1059)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2723 (_ BitVec 64) (_ BitVec 32)) Unit!1059)

(assert (=> b!41835 (= lt!16994 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!16905 lt!16995 #b00000000000000000000000000000000))))

(assert (=> b!41835 (arrayContainsKey!0 lt!16905 lt!16995 #b00000000000000000000000000000000)))

(declare-fun lt!16996 () Unit!1059)

(assert (=> b!41835 (= lt!16996 lt!16994)))

(declare-fun res!24926 () Bool)

(declare-datatypes ((SeekEntryResult!176 0))(
  ( (MissingZero!176 (index!2826 (_ BitVec 32))) (Found!176 (index!2827 (_ BitVec 32))) (Intermediate!176 (undefined!988 Bool) (index!2828 (_ BitVec 32)) (x!7946 (_ BitVec 32))) (Undefined!176) (MissingVacant!176 (index!2829 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2723 (_ BitVec 32)) SeekEntryResult!176)

(assert (=> b!41835 (= res!24926 (= (seekEntryOrOpen!0 (select (arr!1305 lt!16905) #b00000000000000000000000000000000) lt!16905 mask!853) (Found!176 #b00000000000000000000000000000000)))))

(assert (=> b!41835 (=> (not res!24926) (not e!26433))))

(assert (= (and d!7465 (not res!24927)) b!41832))

(assert (= (and b!41832 c!5211) b!41835))

(assert (= (and b!41832 (not c!5211)) b!41834))

(assert (= (and b!41835 res!24926) b!41833))

(assert (= (or b!41833 b!41834) bm!3241))

(declare-fun m!35391 () Bool)

(assert (=> b!41832 m!35391))

(assert (=> b!41832 m!35391))

(declare-fun m!35393 () Bool)

(assert (=> b!41832 m!35393))

(declare-fun m!35395 () Bool)

(assert (=> bm!3241 m!35395))

(assert (=> b!41835 m!35391))

(declare-fun m!35397 () Bool)

(assert (=> b!41835 m!35397))

(declare-fun m!35399 () Bool)

(assert (=> b!41835 m!35399))

(assert (=> b!41835 m!35391))

(declare-fun m!35401 () Bool)

(assert (=> b!41835 m!35401))

(assert (=> b!41752 d!7465))

(declare-fun d!7471 () Bool)

(declare-fun getCurrentListMap!340 (array!2723 array!2725 (_ BitVec 32) (_ BitVec 32) V!2185 V!2185 (_ BitVec 32) Int) ListLongMap!1127)

(assert (=> d!7471 (= (map!744 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)) (getCurrentListMap!340 (_keys!3349 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)) (_values!1825 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)) (mask!5261 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)) (extraKeys!1733 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)) (zeroValue!1760 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)) (minValue!1760 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1842 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16910 lt!16910 #b00000000000000000000000000000000 lt!16905 lt!16906 #b00000000000000000000000000000000))))))

(declare-fun bs!1789 () Bool)

(assert (= bs!1789 d!7471))

(declare-fun m!35407 () Bool)

(assert (=> bs!1789 m!35407))

(assert (=> b!41752 d!7471))

(declare-fun d!7477 () Bool)

(assert (=> d!7477 (= (arrayCountValidKeys!0 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17005 () Unit!1059)

(declare-fun choose!59 (array!2723 (_ BitVec 32) (_ BitVec 32)) Unit!1059)

(assert (=> d!7477 (= lt!17005 (choose!59 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7477 (bvslt (size!1457 lt!16905) #b01111111111111111111111111111111)))

(assert (=> d!7477 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17005)))

(declare-fun bs!1790 () Bool)

(assert (= bs!1790 d!7477))

(assert (=> bs!1790 m!35293))

(declare-fun m!35413 () Bool)

(assert (=> bs!1790 m!35413))

(assert (=> b!41752 d!7477))

(declare-fun b!41885 () Bool)

(declare-fun e!26469 () (_ BitVec 32))

(declare-fun e!26468 () (_ BitVec 32))

(assert (=> b!41885 (= e!26469 e!26468)))

(declare-fun c!5229 () Bool)

(assert (=> b!41885 (= c!5229 (validKeyInArray!0 (select (arr!1305 lt!16905) #b00000000000000000000000000000000)))))

(declare-fun b!41886 () Bool)

(assert (=> b!41886 (= e!26469 #b00000000000000000000000000000000)))

(declare-fun b!41887 () Bool)

(declare-fun call!3256 () (_ BitVec 32))

(assert (=> b!41887 (= e!26468 (bvadd #b00000000000000000000000000000001 call!3256))))

(declare-fun b!41888 () Bool)

(assert (=> b!41888 (= e!26468 call!3256)))

(declare-fun d!7481 () Bool)

(declare-fun lt!17009 () (_ BitVec 32))

(assert (=> d!7481 (and (bvsge lt!17009 #b00000000000000000000000000000000) (bvsle lt!17009 (bvsub (size!1457 lt!16905) #b00000000000000000000000000000000)))))

(assert (=> d!7481 (= lt!17009 e!26469)))

(declare-fun c!5230 () Bool)

(assert (=> d!7481 (= c!5230 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7481 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1457 lt!16905)))))

(assert (=> d!7481 (= (arrayCountValidKeys!0 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17009)))

(declare-fun bm!3253 () Bool)

(assert (=> bm!3253 (= call!3256 (arrayCountValidKeys!0 lt!16905 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7481 c!5230) b!41886))

(assert (= (and d!7481 (not c!5230)) b!41885))

(assert (= (and b!41885 c!5229) b!41887))

(assert (= (and b!41885 (not c!5229)) b!41888))

(assert (= (or b!41887 b!41888) bm!3253))

(assert (=> b!41885 m!35391))

(assert (=> b!41885 m!35391))

(assert (=> b!41885 m!35393))

(declare-fun m!35419 () Bool)

(assert (=> bm!3253 m!35419))

(assert (=> b!41752 d!7481))

(declare-fun d!7487 () Bool)

(assert (=> d!7487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16905 mask!853)))

(declare-fun lt!17015 () Unit!1059)

(declare-fun choose!34 (array!2723 (_ BitVec 32) (_ BitVec 32)) Unit!1059)

(assert (=> d!7487 (= lt!17015 (choose!34 lt!16905 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7487 (validMask!0 mask!853)))

(assert (=> d!7487 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16905 mask!853 #b00000000000000000000000000000000) lt!17015)))

(declare-fun bs!1795 () Bool)

(assert (= bs!1795 d!7487))

(assert (=> bs!1795 m!35295))

(declare-fun m!35429 () Bool)

(assert (=> bs!1795 m!35429))

(assert (=> bs!1795 m!35305))

(assert (=> b!41752 d!7487))

(declare-fun d!7495 () Bool)

(assert (=> d!7495 (arrayNoDuplicates!0 lt!16905 #b00000000000000000000000000000000 Nil!1116)))

(declare-fun lt!17021 () Unit!1059)

(declare-fun choose!111 (array!2723 (_ BitVec 32) (_ BitVec 32) List!1119) Unit!1059)

(assert (=> d!7495 (= lt!17021 (choose!111 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1116))))

(assert (=> d!7495 (= (size!1457 lt!16905) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7495 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!16905 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1116) lt!17021)))

(declare-fun bs!1797 () Bool)

(assert (= bs!1797 d!7495))

(assert (=> bs!1797 m!35289))

(declare-fun m!35433 () Bool)

(assert (=> bs!1797 m!35433))

(assert (=> b!41752 d!7495))

(declare-fun d!7499 () Bool)

(declare-fun res!24960 () Bool)

(declare-fun e!26489 () Bool)

(assert (=> d!7499 (=> res!24960 e!26489)))

(assert (=> d!7499 (= res!24960 (bvsge #b00000000000000000000000000000000 (size!1457 lt!16905)))))

(assert (=> d!7499 (= (arrayNoDuplicates!0 lt!16905 #b00000000000000000000000000000000 Nil!1116) e!26489)))

(declare-fun b!41910 () Bool)

(declare-fun e!26490 () Bool)

(declare-fun call!3260 () Bool)

(assert (=> b!41910 (= e!26490 call!3260)))

(declare-fun b!41911 () Bool)

(declare-fun e!26491 () Bool)

(declare-fun contains!548 (List!1119 (_ BitVec 64)) Bool)

(assert (=> b!41911 (= e!26491 (contains!548 Nil!1116 (select (arr!1305 lt!16905) #b00000000000000000000000000000000)))))

(declare-fun b!41912 () Bool)

(assert (=> b!41912 (= e!26490 call!3260)))

(declare-fun bm!3257 () Bool)

(declare-fun c!5234 () Bool)

(assert (=> bm!3257 (= call!3260 (arrayNoDuplicates!0 lt!16905 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5234 (Cons!1115 (select (arr!1305 lt!16905) #b00000000000000000000000000000000) Nil!1116) Nil!1116)))))

(declare-fun b!41913 () Bool)

(declare-fun e!26488 () Bool)

(assert (=> b!41913 (= e!26488 e!26490)))

(assert (=> b!41913 (= c!5234 (validKeyInArray!0 (select (arr!1305 lt!16905) #b00000000000000000000000000000000)))))

(declare-fun b!41914 () Bool)

(assert (=> b!41914 (= e!26489 e!26488)))

(declare-fun res!24958 () Bool)

(assert (=> b!41914 (=> (not res!24958) (not e!26488))))

(assert (=> b!41914 (= res!24958 (not e!26491))))

(declare-fun res!24959 () Bool)

(assert (=> b!41914 (=> (not res!24959) (not e!26491))))

(assert (=> b!41914 (= res!24959 (validKeyInArray!0 (select (arr!1305 lt!16905) #b00000000000000000000000000000000)))))

(assert (= (and d!7499 (not res!24960)) b!41914))

(assert (= (and b!41914 res!24959) b!41911))

(assert (= (and b!41914 res!24958) b!41913))

(assert (= (and b!41913 c!5234) b!41912))

(assert (= (and b!41913 (not c!5234)) b!41910))

(assert (= (or b!41912 b!41910) bm!3257))

(assert (=> b!41911 m!35391))

(assert (=> b!41911 m!35391))

(declare-fun m!35443 () Bool)

(assert (=> b!41911 m!35443))

(assert (=> bm!3257 m!35391))

(declare-fun m!35445 () Bool)

(assert (=> bm!3257 m!35445))

(assert (=> b!41913 m!35391))

(assert (=> b!41913 m!35391))

(assert (=> b!41913 m!35393))

(assert (=> b!41914 m!35391))

(assert (=> b!41914 m!35391))

(assert (=> b!41914 m!35393))

(assert (=> b!41752 d!7499))

(declare-fun d!7509 () Bool)

(declare-fun res!24965 () Bool)

(declare-fun e!26496 () Bool)

(assert (=> d!7509 (=> res!24965 e!26496)))

(assert (=> d!7509 (= res!24965 (= (select (arr!1305 lt!16905) #b00000000000000000000000000000000) (_1!786 lt!16903)))))

(assert (=> d!7509 (= (arrayContainsKey!0 lt!16905 (_1!786 lt!16903) #b00000000000000000000000000000000) e!26496)))

(declare-fun b!41919 () Bool)

(declare-fun e!26497 () Bool)

(assert (=> b!41919 (= e!26496 e!26497)))

(declare-fun res!24966 () Bool)

(assert (=> b!41919 (=> (not res!24966) (not e!26497))))

(assert (=> b!41919 (= res!24966 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1457 lt!16905)))))

(declare-fun b!41920 () Bool)

(assert (=> b!41920 (= e!26497 (arrayContainsKey!0 lt!16905 (_1!786 lt!16903) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7509 (not res!24965)) b!41919))

(assert (= (and b!41919 res!24966) b!41920))

(assert (=> d!7509 m!35391))

(declare-fun m!35447 () Bool)

(assert (=> b!41920 m!35447))

(assert (=> b!41755 d!7509))

(declare-fun d!7511 () Bool)

(assert (=> d!7511 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5950 d!7511))

(push 1)

