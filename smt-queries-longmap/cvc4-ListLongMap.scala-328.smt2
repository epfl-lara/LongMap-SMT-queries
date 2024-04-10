; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5954 () Bool)

(assert start!5954)

(declare-fun b_free!1433 () Bool)

(declare-fun b_next!1433 () Bool)

(assert (=> start!5954 (= b_free!1433 (not b_next!1433))))

(declare-fun tp!5837 () Bool)

(declare-fun b_and!2515 () Bool)

(assert (=> start!5954 (= tp!5837 b_and!2515)))

(declare-fun b!41780 () Bool)

(declare-fun e!26400 () Bool)

(declare-fun e!26399 () Bool)

(assert (=> b!41780 (= e!26400 (not e!26399))))

(declare-fun res!24906 () Bool)

(assert (=> b!41780 (=> res!24906 e!26399)))

(declare-datatypes ((V!2189 0))(
  ( (V!2190 (val!950 Int)) )
))
(declare-datatypes ((tuple2!1554 0))(
  ( (tuple2!1555 (_1!788 (_ BitVec 64)) (_2!788 V!2189)) )
))
(declare-datatypes ((List!1122 0))(
  ( (Nil!1119) (Cons!1118 (h!1695 tuple2!1554) (t!4051 List!1122)) )
))
(declare-datatypes ((ListLongMap!1131 0))(
  ( (ListLongMap!1132 (toList!581 List!1122)) )
))
(declare-fun lt!16958 () ListLongMap!1131)

(assert (=> b!41780 (= res!24906 (= lt!16958 (ListLongMap!1132 Nil!1119)))))

(declare-datatypes ((ValueCell!664 0))(
  ( (ValueCellFull!664 (v!2034 V!2189)) (EmptyCell!664) )
))
(declare-datatypes ((array!2731 0))(
  ( (array!2732 (arr!1309 (Array (_ BitVec 32) ValueCell!664)) (size!1461 (_ BitVec 32))) )
))
(declare-fun lt!16962 () array!2731)

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((array!2733 0))(
  ( (array!2734 (arr!1310 (Array (_ BitVec 32) (_ BitVec 64))) (size!1462 (_ BitVec 32))) )
))
(declare-fun lt!16964 () array!2733)

(declare-fun lt!16959 () V!2189)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!308 0))(
  ( (LongMapFixedSize!309 (defaultEntry!1844 Int) (mask!5263 (_ BitVec 32)) (extraKeys!1735 (_ BitVec 32)) (zeroValue!1762 V!2189) (minValue!1762 V!2189) (_size!203 (_ BitVec 32)) (_keys!3351 array!2733) (_values!1827 array!2731) (_vacant!203 (_ BitVec 32))) )
))
(declare-fun map!746 (LongMapFixedSize!308) ListLongMap!1131)

(assert (=> b!41780 (= lt!16958 (map!746 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1123 0))(
  ( (Nil!1120) (Cons!1119 (h!1696 (_ BitVec 64)) (t!4052 List!1123)) )
))
(declare-fun arrayNoDuplicates!0 (array!2733 (_ BitVec 32) List!1123) Bool)

(assert (=> b!41780 (arrayNoDuplicates!0 lt!16964 #b00000000000000000000000000000000 Nil!1120)))

(declare-datatypes ((Unit!1063 0))(
  ( (Unit!1064) )
))
(declare-fun lt!16960 () Unit!1063)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2733 (_ BitVec 32) (_ BitVec 32) List!1123) Unit!1063)

(assert (=> b!41780 (= lt!16960 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16964 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2733 (_ BitVec 32)) Bool)

(assert (=> b!41780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16964 mask!853)))

(declare-fun lt!16961 () Unit!1063)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1063)

(assert (=> b!41780 (= lt!16961 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16964 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41780 (= (arrayCountValidKeys!0 lt!16964 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16957 () Unit!1063)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2733 (_ BitVec 32) (_ BitVec 32)) Unit!1063)

(assert (=> b!41780 (= lt!16957 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16964 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41780 (= lt!16962 (array!2732 ((as const (Array (_ BitVec 32) ValueCell!664)) EmptyCell!664) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41780 (= lt!16964 (array!2734 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!225 (Int (_ BitVec 64)) V!2189)

(assert (=> b!41780 (= lt!16959 (dynLambda!225 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41783 () Bool)

(declare-fun e!26401 () Bool)

(declare-fun lt!16963 () tuple2!1554)

(declare-fun arrayContainsKey!0 (array!2733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41783 (= e!26401 (arrayContainsKey!0 lt!16964 (_1!788 lt!16963) #b00000000000000000000000000000000))))

(declare-fun b!41782 () Bool)

(assert (=> b!41782 (= e!26399 (and (bvslt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(assert (=> b!41782 e!26401))

(declare-fun res!24908 () Bool)

(assert (=> b!41782 (=> (not res!24908) (not e!26401))))

(assert (=> b!41782 (= res!24908 (and (not (= (_1!788 lt!16963) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!788 lt!16963) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16956 () Unit!1063)

(declare-fun lemmaKeyInListMapIsInArray!96 (array!2733 array!2731 (_ BitVec 32) (_ BitVec 32) V!2189 V!2189 (_ BitVec 64) Int) Unit!1063)

(assert (=> b!41782 (= lt!16956 (lemmaKeyInListMapIsInArray!96 lt!16964 lt!16962 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 (_1!788 lt!16963) defaultEntry!470))))

(declare-fun head!880 (List!1122) tuple2!1554)

(assert (=> b!41782 (= lt!16963 (head!880 (toList!581 lt!16958)))))

(declare-fun b!41781 () Bool)

(declare-fun res!24909 () Bool)

(assert (=> b!41781 (=> res!24909 e!26399)))

(declare-fun isEmpty!267 (List!1122) Bool)

(assert (=> b!41781 (= res!24909 (isEmpty!267 (toList!581 lt!16958)))))

(declare-fun res!24907 () Bool)

(assert (=> start!5954 (=> (not res!24907) (not e!26400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5954 (= res!24907 (validMask!0 mask!853))))

(assert (=> start!5954 e!26400))

(assert (=> start!5954 true))

(assert (=> start!5954 tp!5837))

(assert (= (and start!5954 res!24907) b!41780))

(assert (= (and b!41780 (not res!24906)) b!41781))

(assert (= (and b!41781 (not res!24909)) b!41782))

(assert (= (and b!41782 res!24908) b!41783))

(declare-fun b_lambda!2157 () Bool)

(assert (=> (not b_lambda!2157) (not b!41780)))

(declare-fun t!4050 () Bool)

(declare-fun tb!915 () Bool)

(assert (=> (and start!5954 (= defaultEntry!470 defaultEntry!470) t!4050) tb!915))

(declare-fun result!1581 () Bool)

(declare-fun tp_is_empty!1823 () Bool)

(assert (=> tb!915 (= result!1581 tp_is_empty!1823)))

(assert (=> b!41780 t!4050))

(declare-fun b_and!2517 () Bool)

(assert (= b_and!2515 (and (=> t!4050 result!1581) b_and!2517)))

(declare-fun m!35339 () Bool)

(assert (=> b!41783 m!35339))

(declare-fun m!35341 () Bool)

(assert (=> b!41781 m!35341))

(declare-fun m!35343 () Bool)

(assert (=> b!41780 m!35343))

(declare-fun m!35345 () Bool)

(assert (=> b!41780 m!35345))

(declare-fun m!35347 () Bool)

(assert (=> b!41780 m!35347))

(declare-fun m!35349 () Bool)

(assert (=> b!41780 m!35349))

(declare-fun m!35351 () Bool)

(assert (=> b!41780 m!35351))

(declare-fun m!35353 () Bool)

(assert (=> b!41780 m!35353))

(declare-fun m!35355 () Bool)

(assert (=> b!41780 m!35355))

(declare-fun m!35357 () Bool)

(assert (=> b!41780 m!35357))

(declare-fun m!35359 () Bool)

(assert (=> b!41782 m!35359))

(declare-fun m!35361 () Bool)

(assert (=> b!41782 m!35361))

(declare-fun m!35363 () Bool)

(assert (=> start!5954 m!35363))

(push 1)

(assert tp_is_empty!1823)

(assert (not b!41783))

(assert (not b_lambda!2157))

(assert b_and!2517)

(assert (not b!41782))

(assert (not b_next!1433))

(assert (not b!41781))

(assert (not b!41780))

(assert (not start!5954))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2517)

(assert (not b_next!1433))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2163 () Bool)

(assert (= b_lambda!2157 (or (and start!5954 b_free!1433) b_lambda!2163)))

(push 1)

(assert tp_is_empty!1823)

(assert (not b!41783))

(assert b_and!2517)

(assert (not b_lambda!2163))

(assert (not b!41782))

(assert (not b_next!1433))

(assert (not b!41781))

(assert (not b!41780))

(assert (not start!5954))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2517)

(assert (not b_next!1433))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7457 () Bool)

(assert (=> d!7457 (= (isEmpty!267 (toList!581 lt!16958)) (is-Nil!1119 (toList!581 lt!16958)))))

(assert (=> b!41781 d!7457))

(declare-fun b!41820 () Bool)

(declare-fun e!26428 () Bool)

(declare-fun e!26427 () Bool)

(assert (=> b!41820 (= e!26428 e!26427)))

(declare-fun c!5206 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!41820 (= c!5206 (validKeyInArray!0 (select (arr!1310 lt!16964) #b00000000000000000000000000000000)))))

(declare-fun b!41821 () Bool)

(declare-fun e!26426 () Bool)

(declare-fun call!3239 () Bool)

(assert (=> b!41821 (= e!26426 call!3239)))

(declare-fun b!41822 () Bool)

(assert (=> b!41822 (= e!26427 call!3239)))

(declare-fun b!41823 () Bool)

(assert (=> b!41823 (= e!26427 e!26426)))

(declare-fun lt!16990 () (_ BitVec 64))

(assert (=> b!41823 (= lt!16990 (select (arr!1310 lt!16964) #b00000000000000000000000000000000))))

(declare-fun lt!16991 () Unit!1063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2733 (_ BitVec 64) (_ BitVec 32)) Unit!1063)

(assert (=> b!41823 (= lt!16991 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!16964 lt!16990 #b00000000000000000000000000000000))))

(assert (=> b!41823 (arrayContainsKey!0 lt!16964 lt!16990 #b00000000000000000000000000000000)))

(declare-fun lt!16989 () Unit!1063)

(assert (=> b!41823 (= lt!16989 lt!16991)))

(declare-fun res!24924 () Bool)

(declare-datatypes ((SeekEntryResult!177 0))(
  ( (MissingZero!177 (index!2830 (_ BitVec 32))) (Found!177 (index!2831 (_ BitVec 32))) (Intermediate!177 (undefined!989 Bool) (index!2832 (_ BitVec 32)) (x!7947 (_ BitVec 32))) (Undefined!177) (MissingVacant!177 (index!2833 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2733 (_ BitVec 32)) SeekEntryResult!177)

(assert (=> b!41823 (= res!24924 (= (seekEntryOrOpen!0 (select (arr!1310 lt!16964) #b00000000000000000000000000000000) lt!16964 mask!853) (Found!177 #b00000000000000000000000000000000)))))

(assert (=> b!41823 (=> (not res!24924) (not e!26426))))

(declare-fun bm!3236 () Bool)

(assert (=> bm!3236 (= call!3239 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!16964 mask!853))))

(declare-fun d!7459 () Bool)

(declare-fun res!24925 () Bool)

(assert (=> d!7459 (=> res!24925 e!26428)))

(assert (=> d!7459 (= res!24925 (bvsge #b00000000000000000000000000000000 (size!1462 lt!16964)))))

(assert (=> d!7459 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16964 mask!853) e!26428)))

(assert (= (and d!7459 (not res!24925)) b!41820))

(assert (= (and b!41820 c!5206) b!41823))

(assert (= (and b!41820 (not c!5206)) b!41822))

(assert (= (and b!41823 res!24924) b!41821))

(assert (= (or b!41821 b!41822) bm!3236))

(declare-fun m!35379 () Bool)

(assert (=> b!41820 m!35379))

(assert (=> b!41820 m!35379))

(declare-fun m!35381 () Bool)

(assert (=> b!41820 m!35381))

(assert (=> b!41823 m!35379))

(declare-fun m!35383 () Bool)

(assert (=> b!41823 m!35383))

(declare-fun m!35385 () Bool)

(assert (=> b!41823 m!35385))

(assert (=> b!41823 m!35379))

(declare-fun m!35387 () Bool)

(assert (=> b!41823 m!35387))

(declare-fun m!35389 () Bool)

(assert (=> bm!3236 m!35389))

(assert (=> b!41780 d!7459))

(declare-fun b!41848 () Bool)

(declare-fun e!26443 () (_ BitVec 32))

(declare-fun call!3248 () (_ BitVec 32))

(assert (=> b!41848 (= e!26443 call!3248)))

(declare-fun bm!3245 () Bool)

(assert (=> bm!3245 (= call!3248 (arrayCountValidKeys!0 lt!16964 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!41849 () Bool)

(declare-fun e!26442 () (_ BitVec 32))

(assert (=> b!41849 (= e!26442 #b00000000000000000000000000000000)))

(declare-fun b!41850 () Bool)

(assert (=> b!41850 (= e!26442 e!26443)))

(declare-fun c!5219 () Bool)

(assert (=> b!41850 (= c!5219 (validKeyInArray!0 (select (arr!1310 lt!16964) #b00000000000000000000000000000000)))))

(declare-fun d!7469 () Bool)

(declare-fun lt!17000 () (_ BitVec 32))

(assert (=> d!7469 (and (bvsge lt!17000 #b00000000000000000000000000000000) (bvsle lt!17000 (bvsub (size!1462 lt!16964) #b00000000000000000000000000000000)))))

(assert (=> d!7469 (= lt!17000 e!26442)))

(declare-fun c!5218 () Bool)

(assert (=> d!7469 (= c!5218 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7469 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1462 lt!16964)))))

(assert (=> d!7469 (= (arrayCountValidKeys!0 lt!16964 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17000)))

(declare-fun b!41851 () Bool)

(assert (=> b!41851 (= e!26443 (bvadd #b00000000000000000000000000000001 call!3248))))

(assert (= (and d!7469 c!5218) b!41849))

(assert (= (and d!7469 (not c!5218)) b!41850))

(assert (= (and b!41850 c!5219) b!41851))

(assert (= (and b!41850 (not c!5219)) b!41848))

(assert (= (or b!41851 b!41848) bm!3245))

(declare-fun m!35405 () Bool)

(assert (=> bm!3245 m!35405))

(assert (=> b!41850 m!35379))

(assert (=> b!41850 m!35379))

(assert (=> b!41850 m!35381))

(assert (=> b!41780 d!7469))

(declare-fun d!7475 () Bool)

(declare-fun getCurrentListMap!342 (array!2733 array!2731 (_ BitVec 32) (_ BitVec 32) V!2189 V!2189 (_ BitVec 32) Int) ListLongMap!1131)

(assert (=> d!7475 (= (map!746 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)) (getCurrentListMap!342 (_keys!3351 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)) (_values!1827 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)) (mask!5263 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)) (extraKeys!1735 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)) (zeroValue!1762 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)) (minValue!1762 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1844 (LongMapFixedSize!309 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16959 lt!16959 #b00000000000000000000000000000000 lt!16964 lt!16962 #b00000000000000000000000000000000))))))

(declare-fun bs!1792 () Bool)

(assert (= bs!1792 d!7475))

(declare-fun m!35417 () Bool)

(assert (=> bs!1792 m!35417))

(assert (=> b!41780 d!7475))

(declare-fun b!41889 () Bool)

(declare-fun e!26471 () Bool)

(declare-fun e!26470 () Bool)

(assert (=> b!41889 (= e!26471 e!26470)))

(declare-fun c!5231 () Bool)

(assert (=> b!41889 (= c!5231 (validKeyInArray!0 (select (arr!1310 lt!16964) #b00000000000000000000000000000000)))))

(declare-fun b!41890 () Bool)

(declare-fun e!26472 () Bool)

(declare-fun contains!549 (List!1123 (_ BitVec 64)) Bool)

(assert (=> b!41890 (= e!26472 (contains!549 Nil!1120 (select (arr!1310 lt!16964) #b00000000000000000000000000000000)))))

(declare-fun b!41891 () Bool)

(declare-fun call!3257 () Bool)

(assert (=> b!41891 (= e!26470 call!3257)))

(declare-fun b!41892 () Bool)

(assert (=> b!41892 (= e!26470 call!3257)))

(declare-fun b!41893 () Bool)

(declare-fun e!26473 () Bool)

(assert (=> b!41893 (= e!26473 e!26471)))

(declare-fun res!24944 () Bool)

(assert (=> b!41893 (=> (not res!24944) (not e!26471))))

(assert (=> b!41893 (= res!24944 (not e!26472))))

(declare-fun res!24945 () Bool)

(assert (=> b!41893 (=> (not res!24945) (not e!26472))))

(assert (=> b!41893 (= res!24945 (validKeyInArray!0 (select (arr!1310 lt!16964) #b00000000000000000000000000000000)))))

(declare-fun bm!3254 () Bool)

(assert (=> bm!3254 (= call!3257 (arrayNoDuplicates!0 lt!16964 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5231 (Cons!1119 (select (arr!1310 lt!16964) #b00000000000000000000000000000000) Nil!1120) Nil!1120)))))

(declare-fun d!7485 () Bool)

(declare-fun res!24943 () Bool)

(assert (=> d!7485 (=> res!24943 e!26473)))

(assert (=> d!7485 (= res!24943 (bvsge #b00000000000000000000000000000000 (size!1462 lt!16964)))))

(assert (=> d!7485 (= (arrayNoDuplicates!0 lt!16964 #b00000000000000000000000000000000 Nil!1120) e!26473)))

(assert (= (and d!7485 (not res!24943)) b!41893))

(assert (= (and b!41893 res!24945) b!41890))

(assert (= (and b!41893 res!24944) b!41889))

(assert (= (and b!41889 c!5231) b!41891))

(assert (= (and b!41889 (not c!5231)) b!41892))

(assert (= (or b!41891 b!41892) bm!3254))

(assert (=> b!41889 m!35379))

(assert (=> b!41889 m!35379))

(assert (=> b!41889 m!35381))

(assert (=> b!41890 m!35379))

(assert (=> b!41890 m!35379))

(declare-fun m!35423 () Bool)

(assert (=> b!41890 m!35423))

(assert (=> b!41893 m!35379))

(assert (=> b!41893 m!35379))

(assert (=> b!41893 m!35381))

(assert (=> bm!3254 m!35379))

(declare-fun m!35425 () Bool)

(assert (=> bm!3254 m!35425))

(assert (=> b!41780 d!7485))

(declare-fun d!7491 () Bool)

