; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6040 () Bool)

(assert start!6040)

(declare-fun b_free!1447 () Bool)

(declare-fun b_next!1447 () Bool)

(assert (=> start!6040 (= b_free!1447 (not b_next!1447))))

(declare-fun tp!5858 () Bool)

(declare-fun b_and!2543 () Bool)

(assert (=> start!6040 (= tp!5858 b_and!2543)))

(declare-fun res!25032 () Bool)

(declare-fun e!26569 () Bool)

(assert (=> start!6040 (=> (not res!25032) (not e!26569))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6040 (= res!25032 (validMask!0 mask!853))))

(assert (=> start!6040 e!26569))

(assert (=> start!6040 true))

(assert (=> start!6040 tp!5858))

(declare-fun b!42027 () Bool)

(declare-fun e!26568 () Bool)

(assert (=> b!42027 (= e!26569 (not e!26568))))

(declare-fun res!25031 () Bool)

(assert (=> b!42027 (=> res!25031 e!26568)))

(declare-datatypes ((V!2209 0))(
  ( (V!2210 (val!957 Int)) )
))
(declare-datatypes ((tuple2!1568 0))(
  ( (tuple2!1569 (_1!795 (_ BitVec 64)) (_2!795 V!2209)) )
))
(declare-datatypes ((List!1136 0))(
  ( (Nil!1133) (Cons!1132 (h!1709 tuple2!1568) (t!4079 List!1136)) )
))
(declare-datatypes ((ListLongMap!1145 0))(
  ( (ListLongMap!1146 (toList!588 List!1136)) )
))
(declare-fun lt!17248 () ListLongMap!1145)

(assert (=> b!42027 (= res!25031 (= lt!17248 (ListLongMap!1146 Nil!1133)))))

(declare-fun lt!17250 () V!2209)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2759 0))(
  ( (array!2760 (arr!1323 (Array (_ BitVec 32) (_ BitVec 64))) (size!1481 (_ BitVec 32))) )
))
(declare-fun lt!17252 () array!2759)

(declare-datatypes ((ValueCell!671 0))(
  ( (ValueCellFull!671 (v!2041 V!2209)) (EmptyCell!671) )
))
(declare-datatypes ((array!2761 0))(
  ( (array!2762 (arr!1324 (Array (_ BitVec 32) ValueCell!671)) (size!1482 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!322 0))(
  ( (LongMapFixedSize!323 (defaultEntry!1854 Int) (mask!5288 (_ BitVec 32)) (extraKeys!1745 (_ BitVec 32)) (zeroValue!1772 V!2209) (minValue!1772 V!2209) (_size!210 (_ BitVec 32)) (_keys!3367 array!2759) (_values!1837 array!2761) (_vacant!210 (_ BitVec 32))) )
))
(declare-fun map!759 (LongMapFixedSize!322) ListLongMap!1145)

(assert (=> b!42027 (= lt!17248 (map!759 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1137 0))(
  ( (Nil!1134) (Cons!1133 (h!1710 (_ BitVec 64)) (t!4080 List!1137)) )
))
(declare-fun arrayNoDuplicates!0 (array!2759 (_ BitVec 32) List!1137) Bool)

(assert (=> b!42027 (arrayNoDuplicates!0 lt!17252 #b00000000000000000000000000000000 Nil!1134)))

(declare-datatypes ((Unit!1083 0))(
  ( (Unit!1084) )
))
(declare-fun lt!17247 () Unit!1083)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2759 (_ BitVec 32) (_ BitVec 32) List!1137) Unit!1083)

(assert (=> b!42027 (= lt!17247 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2759 (_ BitVec 32)) Bool)

(assert (=> b!42027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17252 mask!853)))

(declare-fun lt!17251 () Unit!1083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2759 (_ BitVec 32) (_ BitVec 32)) Unit!1083)

(assert (=> b!42027 (= lt!17251 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17252 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2759 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42027 (= (arrayCountValidKeys!0 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17249 () Unit!1083)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2759 (_ BitVec 32) (_ BitVec 32)) Unit!1083)

(assert (=> b!42027 (= lt!17249 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42027 (= lt!17252 (array!2760 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!232 (Int (_ BitVec 64)) V!2209)

(assert (=> b!42027 (= lt!17250 (dynLambda!232 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42028 () Bool)

(declare-fun isEmpty!271 (List!1136) Bool)

(assert (=> b!42028 (= e!26568 (not (isEmpty!271 (toList!588 lt!17248))))))

(assert (= (and start!6040 res!25032) b!42027))

(assert (= (and b!42027 (not res!25031)) b!42028))

(declare-fun b_lambda!2177 () Bool)

(assert (=> (not b_lambda!2177) (not b!42027)))

(declare-fun t!4078 () Bool)

(declare-fun tb!929 () Bool)

(assert (=> (and start!6040 (= defaultEntry!470 defaultEntry!470) t!4078) tb!929))

(declare-fun result!1609 () Bool)

(declare-fun tp_is_empty!1837 () Bool)

(assert (=> tb!929 (= result!1609 tp_is_empty!1837)))

(assert (=> b!42027 t!4078))

(declare-fun b_and!2545 () Bool)

(assert (= b_and!2543 (and (=> t!4078 result!1609) b_and!2545)))

(declare-fun m!35617 () Bool)

(assert (=> start!6040 m!35617))

(declare-fun m!35619 () Bool)

(assert (=> b!42027 m!35619))

(declare-fun m!35621 () Bool)

(assert (=> b!42027 m!35621))

(declare-fun m!35623 () Bool)

(assert (=> b!42027 m!35623))

(declare-fun m!35625 () Bool)

(assert (=> b!42027 m!35625))

(declare-fun m!35627 () Bool)

(assert (=> b!42027 m!35627))

(declare-fun m!35629 () Bool)

(assert (=> b!42027 m!35629))

(declare-fun m!35631 () Bool)

(assert (=> b!42027 m!35631))

(declare-fun m!35633 () Bool)

(assert (=> b!42027 m!35633))

(declare-fun m!35635 () Bool)

(assert (=> b!42028 m!35635))

(push 1)

(assert (not b!42027))

(assert tp_is_empty!1837)

(assert b_and!2545)

(assert (not start!6040))

(assert (not b_lambda!2177))

(assert (not b!42028))

(assert (not b_next!1447))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2545)

(assert (not b_next!1447))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2183 () Bool)

(assert (= b_lambda!2177 (or (and start!6040 b_free!1447) b_lambda!2183)))

(push 1)

(assert (not b!42027))

(assert (not b_lambda!2183))

(assert tp_is_empty!1837)

(assert b_and!2545)

(assert (not start!6040))

(assert (not b!42028))

(assert (not b_next!1447))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2545)

(assert (not b_next!1447))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7529 () Bool)

(assert (=> d!7529 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6040 d!7529))

(declare-fun d!7541 () Bool)

(declare-fun getCurrentListMap!343 (array!2759 array!2761 (_ BitVec 32) (_ BitVec 32) V!2209 V!2209 (_ BitVec 32) Int) ListLongMap!1145)

(assert (=> d!7541 (= (map!759 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!343 (_keys!3367 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1837 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5288 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1745 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1772 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1772 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1854 (LongMapFixedSize!323 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17250 lt!17250 #b00000000000000000000000000000000 lt!17252 (array!2762 ((as const (Array (_ BitVec 32) ValueCell!671)) EmptyCell!671) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1811 () Bool)

(assert (= bs!1811 d!7541))

(declare-fun m!35687 () Bool)

(assert (=> bs!1811 m!35687))

(assert (=> b!42027 d!7541))

(declare-fun d!7547 () Bool)

(assert (=> d!7547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17252 mask!853)))

(declare-fun lt!17303 () Unit!1083)

(declare-fun choose!34 (array!2759 (_ BitVec 32) (_ BitVec 32)) Unit!1083)

(assert (=> d!7547 (= lt!17303 (choose!34 lt!17252 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7547 (validMask!0 mask!853)))

(assert (=> d!7547 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17252 mask!853 #b00000000000000000000000000000000) lt!17303)))

(declare-fun bs!1813 () Bool)

(assert (= bs!1813 d!7547))

(assert (=> bs!1813 m!35629))

(declare-fun m!35691 () Bool)

(assert (=> bs!1813 m!35691))

(assert (=> bs!1813 m!35617))

(assert (=> b!42027 d!7547))

(declare-fun d!7551 () Bool)

(assert (=> d!7551 (arrayNoDuplicates!0 lt!17252 #b00000000000000000000000000000000 Nil!1134)))

(declare-fun lt!17309 () Unit!1083)

(declare-fun choose!111 (array!2759 (_ BitVec 32) (_ BitVec 32) List!1137) Unit!1083)

(assert (=> d!7551 (= lt!17309 (choose!111 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1134))))

(assert (=> d!7551 (= (size!1481 lt!17252) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7551 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1134) lt!17309)))

(declare-fun bs!1814 () Bool)

(assert (= bs!1814 d!7551))

(assert (=> bs!1814 m!35627))

(declare-fun m!35701 () Bool)

(assert (=> bs!1814 m!35701))

(assert (=> b!42027 d!7551))

(declare-fun d!7555 () Bool)

(assert (=> d!7555 (= (arrayCountValidKeys!0 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17315 () Unit!1083)

(declare-fun choose!59 (array!2759 (_ BitVec 32) (_ BitVec 32)) Unit!1083)

(assert (=> d!7555 (= lt!17315 (choose!59 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7555 (bvslt (size!1481 lt!17252) #b01111111111111111111111111111111)))

(assert (=> d!7555 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17315)))

(declare-fun bs!1816 () Bool)

(assert (= bs!1816 d!7555))

(assert (=> bs!1816 m!35623))

(declare-fun m!35705 () Bool)

(assert (=> bs!1816 m!35705))

(assert (=> b!42027 d!7555))

(declare-fun b!42111 () Bool)

(declare-fun e!26632 () Bool)

(declare-fun call!3275 () Bool)

(assert (=> b!42111 (= e!26632 call!3275)))

(declare-fun bm!3272 () Bool)

(declare-fun c!5267 () Bool)

(assert (=> bm!3272 (= call!3275 (arrayNoDuplicates!0 lt!17252 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5267 (Cons!1133 (select (arr!1323 lt!17252) #b00000000000000000000000000000000) Nil!1134) Nil!1134)))))

(declare-fun b!42112 () Bool)

(declare-fun e!26629 () Bool)

(declare-fun contains!551 (List!1137 (_ BitVec 64)) Bool)

(assert (=> b!42112 (= e!26629 (contains!551 Nil!1134 (select (arr!1323 lt!17252) #b00000000000000000000000000000000)))))

(declare-fun d!7559 () Bool)

(declare-fun res!25075 () Bool)

(declare-fun e!26631 () Bool)

(assert (=> d!7559 (=> res!25075 e!26631)))

(assert (=> d!7559 (= res!25075 (bvsge #b00000000000000000000000000000000 (size!1481 lt!17252)))))

(assert (=> d!7559 (= (arrayNoDuplicates!0 lt!17252 #b00000000000000000000000000000000 Nil!1134) e!26631)))

(declare-fun b!42113 () Bool)

(declare-fun e!26630 () Bool)

(assert (=> b!42113 (= e!26630 e!26632)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42113 (= c!5267 (validKeyInArray!0 (select (arr!1323 lt!17252) #b00000000000000000000000000000000)))))

(declare-fun b!42114 () Bool)

(assert (=> b!42114 (= e!26631 e!26630)))

(declare-fun res!25076 () Bool)

(assert (=> b!42114 (=> (not res!25076) (not e!26630))))

(assert (=> b!42114 (= res!25076 (not e!26629))))

(declare-fun res!25077 () Bool)

(assert (=> b!42114 (=> (not res!25077) (not e!26629))))

(assert (=> b!42114 (= res!25077 (validKeyInArray!0 (select (arr!1323 lt!17252) #b00000000000000000000000000000000)))))

(declare-fun b!42115 () Bool)

(assert (=> b!42115 (= e!26632 call!3275)))

(assert (= (and d!7559 (not res!25075)) b!42114))

(assert (= (and b!42114 res!25077) b!42112))

(assert (= (and b!42114 res!25076) b!42113))

(assert (= (and b!42113 c!5267) b!42115))

(assert (= (and b!42113 (not c!5267)) b!42111))

(assert (= (or b!42115 b!42111) bm!3272))

(declare-fun m!35719 () Bool)

(assert (=> bm!3272 m!35719))

(declare-fun m!35721 () Bool)

(assert (=> bm!3272 m!35721))

(assert (=> b!42112 m!35719))

(assert (=> b!42112 m!35719))

(declare-fun m!35723 () Bool)

(assert (=> b!42112 m!35723))

(assert (=> b!42113 m!35719))

(assert (=> b!42113 m!35719))

(declare-fun m!35725 () Bool)

(assert (=> b!42113 m!35725))

(assert (=> b!42114 m!35719))

(assert (=> b!42114 m!35719))

(assert (=> b!42114 m!35725))

(assert (=> b!42027 d!7559))

(declare-fun b!42136 () Bool)

(declare-fun e!26647 () (_ BitVec 32))

(assert (=> b!42136 (= e!26647 #b00000000000000000000000000000000)))

(declare-fun d!7567 () Bool)

(declare-fun lt!17333 () (_ BitVec 32))

(assert (=> d!7567 (and (bvsge lt!17333 #b00000000000000000000000000000000) (bvsle lt!17333 (bvsub (size!1481 lt!17252) #b00000000000000000000000000000000)))))

(assert (=> d!7567 (= lt!17333 e!26647)))

(declare-fun c!5275 () Bool)

(assert (=> d!7567 (= c!5275 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7567 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1481 lt!17252)))))

(assert (=> d!7567 (= (arrayCountValidKeys!0 lt!17252 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17333)))

(declare-fun b!42137 () Bool)

(declare-fun e!26646 () (_ BitVec 32))

(declare-fun call!3281 () (_ BitVec 32))

(assert (=> b!42137 (= e!26646 call!3281)))

(declare-fun b!42138 () Bool)

(assert (=> b!42138 (= e!26646 (bvadd #b00000000000000000000000000000001 call!3281))))

(declare-fun b!42139 () Bool)

(assert (=> b!42139 (= e!26647 e!26646)))

(declare-fun c!5276 () Bool)

(assert (=> b!42139 (= c!5276 (validKeyInArray!0 (select (arr!1323 lt!17252) #b00000000000000000000000000000000)))))

(declare-fun bm!3278 () Bool)

(assert (=> bm!3278 (= call!3281 (arrayCountValidKeys!0 lt!17252 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7567 c!5275) b!42136))

(assert (= (and d!7567 (not c!5275)) b!42139))

(assert (= (and b!42139 c!5276) b!42138))

(assert (= (and b!42139 (not c!5276)) b!42137))

(assert (= (or b!42138 b!42137) bm!3278))

(assert (=> b!42139 m!35719))

(assert (=> b!42139 m!35719))

(assert (=> b!42139 m!35725))

(declare-fun m!35737 () Bool)

(assert (=> bm!3278 m!35737))

(assert (=> b!42027 d!7567))

(declare-fun b!42148 () Bool)

(declare-fun e!26656 () Bool)

(declare-fun e!26655 () Bool)

(assert (=> b!42148 (= e!26656 e!26655)))

(declare-fun lt!17344 () (_ BitVec 64))

(assert (=> b!42148 (= lt!17344 (select (arr!1323 lt!17252) #b00000000000000000000000000000000))))

(declare-fun lt!17345 () Unit!1083)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2759 (_ BitVec 64) (_ BitVec 32)) Unit!1083)

(assert (=> b!42148 (= lt!17345 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17252 lt!17344 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42148 (arrayContainsKey!0 lt!17252 lt!17344 #b00000000000000000000000000000000)))

(declare-fun lt!17343 () Unit!1083)

(assert (=> b!42148 (= lt!17343 lt!17345)))

(declare-fun res!25088 () Bool)

(declare-datatypes ((SeekEntryResult!179 0))(
  ( (MissingZero!179 (index!2838 (_ BitVec 32))) (Found!179 (index!2839 (_ BitVec 32))) (Intermediate!179 (undefined!991 Bool) (index!2840 (_ BitVec 32)) (x!8008 (_ BitVec 32))) (Undefined!179) (MissingVacant!179 (index!2841 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2759 (_ BitVec 32)) SeekEntryResult!179)

(assert (=> b!42148 (= res!25088 (= (seekEntryOrOpen!0 (select (arr!1323 lt!17252) #b00000000000000000000000000000000) lt!17252 mask!853) (Found!179 #b00000000000000000000000000000000)))))

(assert (=> b!42148 (=> (not res!25088) (not e!26655))))

(declare-fun b!42149 () Bool)

(declare-fun call!3284 () Bool)

(assert (=> b!42149 (= e!26656 call!3284)))

(declare-fun b!42150 () Bool)

(declare-fun e!26654 () Bool)

(assert (=> b!42150 (= e!26654 e!26656)))

(declare-fun c!5279 () Bool)

(assert (=> b!42150 (= c!5279 (validKeyInArray!0 (select (arr!1323 lt!17252) #b00000000000000000000000000000000)))))

(declare-fun d!7573 () Bool)

(declare-fun res!25089 () Bool)

(assert (=> d!7573 (=> res!25089 e!26654)))

(assert (=> d!7573 (= res!25089 (bvsge #b00000000000000000000000000000000 (size!1481 lt!17252)))))

(assert (=> d!7573 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17252 mask!853) e!26654)))

(declare-fun bm!3281 () Bool)

(assert (=> bm!3281 (= call!3284 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17252 mask!853))))

(declare-fun b!42151 () Bool)

(assert (=> b!42151 (= e!26655 call!3284)))

(assert (= (and d!7573 (not res!25089)) b!42150))

(assert (= (and b!42150 c!5279) b!42148))

(assert (= (and b!42150 (not c!5279)) b!42149))

(assert (= (and b!42148 res!25088) b!42151))

(assert (= (or b!42151 b!42149) bm!3281))

(assert (=> b!42148 m!35719))

(declare-fun m!35743 () Bool)

(assert (=> b!42148 m!35743))

(declare-fun m!35745 () Bool)

(assert (=> b!42148 m!35745))

(assert (=> b!42148 m!35719))

(declare-fun m!35747 () Bool)

(assert (=> b!42148 m!35747))

(assert (=> b!42150 m!35719))

(assert (=> b!42150 m!35719))

(assert (=> b!42150 m!35725))

(declare-fun m!35749 () Bool)

(assert (=> bm!3281 m!35749))

(assert (=> b!42027 d!7573))

(declare-fun d!7579 () Bool)

(assert (=> d!7579 (= (isEmpty!271 (toList!588 lt!17248)) (is-Nil!1133 (toList!588 lt!17248)))))

(assert (=> b!42028 d!7579))

(push 1)

(assert (not b!42150))

(assert (not bm!3278))

(assert (not b!42112))

(assert tp_is_empty!1837)

(assert b_and!2545)

(assert (not d!7555))

(assert (not d!7547))

(assert (not b!42114))

(assert (not b!42139))

(assert (not d!7551))

(assert (not bm!3272))

(assert (not b_next!1447))

(assert (not b!42113))

(assert (not bm!3281))

(assert (not b_lambda!2183))

(assert (not d!7541))

(assert (not b!42148))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2545)

(assert (not b_next!1447))

(check-sat)

