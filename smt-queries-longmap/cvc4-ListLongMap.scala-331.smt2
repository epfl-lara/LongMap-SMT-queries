; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6044 () Bool)

(assert start!6044)

(declare-fun b_free!1451 () Bool)

(declare-fun b_next!1451 () Bool)

(assert (=> start!6044 (= b_free!1451 (not b_next!1451))))

(declare-fun tp!5864 () Bool)

(declare-fun b_and!2551 () Bool)

(assert (=> start!6044 (= tp!5864 b_and!2551)))

(declare-fun res!25044 () Bool)

(declare-fun e!26581 () Bool)

(assert (=> start!6044 (=> (not res!25044) (not e!26581))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6044 (= res!25044 (validMask!0 mask!853))))

(assert (=> start!6044 e!26581))

(assert (=> start!6044 true))

(assert (=> start!6044 tp!5864))

(declare-fun b!42043 () Bool)

(declare-fun e!26580 () Bool)

(assert (=> b!42043 (= e!26581 (not e!26580))))

(declare-fun res!25043 () Bool)

(assert (=> b!42043 (=> res!25043 e!26580)))

(declare-datatypes ((V!2213 0))(
  ( (V!2214 (val!959 Int)) )
))
(declare-datatypes ((tuple2!1572 0))(
  ( (tuple2!1573 (_1!797 (_ BitVec 64)) (_2!797 V!2213)) )
))
(declare-datatypes ((List!1140 0))(
  ( (Nil!1137) (Cons!1136 (h!1713 tuple2!1572) (t!4087 List!1140)) )
))
(declare-datatypes ((ListLongMap!1149 0))(
  ( (ListLongMap!1150 (toList!590 List!1140)) )
))
(declare-fun lt!17285 () ListLongMap!1149)

(assert (=> b!42043 (= res!25043 (= lt!17285 (ListLongMap!1150 Nil!1137)))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2767 0))(
  ( (array!2768 (arr!1327 (Array (_ BitVec 32) (_ BitVec 64))) (size!1485 (_ BitVec 32))) )
))
(declare-fun lt!17283 () array!2767)

(declare-fun lt!17287 () V!2213)

(declare-datatypes ((ValueCell!673 0))(
  ( (ValueCellFull!673 (v!2043 V!2213)) (EmptyCell!673) )
))
(declare-datatypes ((array!2769 0))(
  ( (array!2770 (arr!1328 (Array (_ BitVec 32) ValueCell!673)) (size!1486 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!326 0))(
  ( (LongMapFixedSize!327 (defaultEntry!1856 Int) (mask!5290 (_ BitVec 32)) (extraKeys!1747 (_ BitVec 32)) (zeroValue!1774 V!2213) (minValue!1774 V!2213) (_size!212 (_ BitVec 32)) (_keys!3369 array!2767) (_values!1839 array!2769) (_vacant!212 (_ BitVec 32))) )
))
(declare-fun map!761 (LongMapFixedSize!326) ListLongMap!1149)

(assert (=> b!42043 (= lt!17285 (map!761 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1141 0))(
  ( (Nil!1138) (Cons!1137 (h!1714 (_ BitVec 64)) (t!4088 List!1141)) )
))
(declare-fun arrayNoDuplicates!0 (array!2767 (_ BitVec 32) List!1141) Bool)

(assert (=> b!42043 (arrayNoDuplicates!0 lt!17283 #b00000000000000000000000000000000 Nil!1138)))

(declare-datatypes ((Unit!1087 0))(
  ( (Unit!1088) )
))
(declare-fun lt!17284 () Unit!1087)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2767 (_ BitVec 32) (_ BitVec 32) List!1141) Unit!1087)

(assert (=> b!42043 (= lt!17284 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2767 (_ BitVec 32)) Bool)

(assert (=> b!42043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17283 mask!853)))

(declare-fun lt!17286 () Unit!1087)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2767 (_ BitVec 32) (_ BitVec 32)) Unit!1087)

(assert (=> b!42043 (= lt!17286 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17283 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2767 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42043 (= (arrayCountValidKeys!0 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17288 () Unit!1087)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2767 (_ BitVec 32) (_ BitVec 32)) Unit!1087)

(assert (=> b!42043 (= lt!17288 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42043 (= lt!17283 (array!2768 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!234 (Int (_ BitVec 64)) V!2213)

(assert (=> b!42043 (= lt!17287 (dynLambda!234 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42044 () Bool)

(declare-fun isEmpty!273 (List!1140) Bool)

(assert (=> b!42044 (= e!26580 (not (isEmpty!273 (toList!590 lt!17285))))))

(assert (= (and start!6044 res!25044) b!42043))

(assert (= (and b!42043 (not res!25043)) b!42044))

(declare-fun b_lambda!2181 () Bool)

(assert (=> (not b_lambda!2181) (not b!42043)))

(declare-fun t!4086 () Bool)

(declare-fun tb!933 () Bool)

(assert (=> (and start!6044 (= defaultEntry!470 defaultEntry!470) t!4086) tb!933))

(declare-fun result!1617 () Bool)

(declare-fun tp_is_empty!1841 () Bool)

(assert (=> tb!933 (= result!1617 tp_is_empty!1841)))

(assert (=> b!42043 t!4086))

(declare-fun b_and!2553 () Bool)

(assert (= b_and!2551 (and (=> t!4086 result!1617) b_and!2553)))

(declare-fun m!35657 () Bool)

(assert (=> start!6044 m!35657))

(declare-fun m!35659 () Bool)

(assert (=> b!42043 m!35659))

(declare-fun m!35661 () Bool)

(assert (=> b!42043 m!35661))

(declare-fun m!35663 () Bool)

(assert (=> b!42043 m!35663))

(declare-fun m!35665 () Bool)

(assert (=> b!42043 m!35665))

(declare-fun m!35667 () Bool)

(assert (=> b!42043 m!35667))

(declare-fun m!35669 () Bool)

(assert (=> b!42043 m!35669))

(declare-fun m!35671 () Bool)

(assert (=> b!42043 m!35671))

(declare-fun m!35673 () Bool)

(assert (=> b!42043 m!35673))

(declare-fun m!35675 () Bool)

(assert (=> b!42044 m!35675))

(push 1)

(assert (not b_next!1451))

(assert b_and!2553)

(assert (not b!42044))

(assert (not b_lambda!2181))

(assert (not start!6044))

(assert tp_is_empty!1841)

(assert (not b!42043))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2553)

(assert (not b_next!1451))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2185 () Bool)

(assert (= b_lambda!2181 (or (and start!6044 b_free!1451) b_lambda!2185)))

(push 1)

(assert (not b_next!1451))

(assert b_and!2553)

(assert (not b!42044))

(assert (not b_lambda!2185))

(assert (not start!6044))

(assert tp_is_empty!1841)

(assert (not b!42043))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2553)

(assert (not b_next!1451))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7531 () Bool)

(assert (=> d!7531 (= (isEmpty!273 (toList!590 lt!17285)) (is-Nil!1137 (toList!590 lt!17285)))))

(assert (=> b!42044 d!7531))

(declare-fun d!7533 () Bool)

(assert (=> d!7533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17283 mask!853)))

(declare-fun lt!17291 () Unit!1087)

(declare-fun choose!34 (array!2767 (_ BitVec 32) (_ BitVec 32)) Unit!1087)

(assert (=> d!7533 (= lt!17291 (choose!34 lt!17283 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7533 (validMask!0 mask!853)))

(assert (=> d!7533 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17283 mask!853 #b00000000000000000000000000000000) lt!17291)))

(declare-fun bs!1810 () Bool)

(assert (= bs!1810 d!7533))

(assert (=> bs!1810 m!35661))

(declare-fun m!35677 () Bool)

(assert (=> bs!1810 m!35677))

(assert (=> bs!1810 m!35657))

(assert (=> b!42043 d!7533))

(declare-fun d!7537 () Bool)

(declare-fun res!25051 () Bool)

(declare-fun e!26590 () Bool)

(assert (=> d!7537 (=> res!25051 e!26590)))

(assert (=> d!7537 (= res!25051 (bvsge #b00000000000000000000000000000000 (size!1485 lt!17283)))))

(assert (=> d!7537 (= (arrayNoDuplicates!0 lt!17283 #b00000000000000000000000000000000 Nil!1138) e!26590)))

(declare-fun b!42057 () Bool)

(declare-fun e!26592 () Bool)

(declare-fun e!26593 () Bool)

(assert (=> b!42057 (= e!26592 e!26593)))

(declare-fun c!5252 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42057 (= c!5252 (validKeyInArray!0 (select (arr!1327 lt!17283) #b00000000000000000000000000000000)))))

(declare-fun b!42058 () Bool)

(assert (=> b!42058 (= e!26590 e!26592)))

(declare-fun res!25052 () Bool)

(assert (=> b!42058 (=> (not res!25052) (not e!26592))))

(declare-fun e!26591 () Bool)

(assert (=> b!42058 (= res!25052 (not e!26591))))

(declare-fun res!25053 () Bool)

(assert (=> b!42058 (=> (not res!25053) (not e!26591))))

(assert (=> b!42058 (= res!25053 (validKeyInArray!0 (select (arr!1327 lt!17283) #b00000000000000000000000000000000)))))

(declare-fun b!42059 () Bool)

(declare-fun contains!550 (List!1141 (_ BitVec 64)) Bool)

(assert (=> b!42059 (= e!26591 (contains!550 Nil!1138 (select (arr!1327 lt!17283) #b00000000000000000000000000000000)))))

(declare-fun b!42060 () Bool)

(declare-fun call!3263 () Bool)

(assert (=> b!42060 (= e!26593 call!3263)))

(declare-fun bm!3260 () Bool)

(assert (=> bm!3260 (= call!3263 (arrayNoDuplicates!0 lt!17283 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5252 (Cons!1137 (select (arr!1327 lt!17283) #b00000000000000000000000000000000) Nil!1138) Nil!1138)))))

(declare-fun b!42061 () Bool)

(assert (=> b!42061 (= e!26593 call!3263)))

(assert (= (and d!7537 (not res!25051)) b!42058))

(assert (= (and b!42058 res!25053) b!42059))

(assert (= (and b!42058 res!25052) b!42057))

(assert (= (and b!42057 c!5252) b!42061))

(assert (= (and b!42057 (not c!5252)) b!42060))

(assert (= (or b!42061 b!42060) bm!3260))

(declare-fun m!35679 () Bool)

(assert (=> b!42057 m!35679))

(assert (=> b!42057 m!35679))

(declare-fun m!35681 () Bool)

(assert (=> b!42057 m!35681))

(assert (=> b!42058 m!35679))

(assert (=> b!42058 m!35679))

(assert (=> b!42058 m!35681))

(assert (=> b!42059 m!35679))

(assert (=> b!42059 m!35679))

(declare-fun m!35683 () Bool)

(assert (=> b!42059 m!35683))

(assert (=> bm!3260 m!35679))

(declare-fun m!35685 () Bool)

(assert (=> bm!3260 m!35685))

(assert (=> b!42043 d!7537))

(declare-fun b!42070 () Bool)

(declare-fun e!26602 () Bool)

(declare-fun call!3266 () Bool)

(assert (=> b!42070 (= e!26602 call!3266)))

(declare-fun b!42071 () Bool)

(declare-fun e!26601 () Bool)

(assert (=> b!42071 (= e!26601 e!26602)))

(declare-fun lt!17306 () (_ BitVec 64))

(assert (=> b!42071 (= lt!17306 (select (arr!1327 lt!17283) #b00000000000000000000000000000000))))

(declare-fun lt!17304 () Unit!1087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2767 (_ BitVec 64) (_ BitVec 32)) Unit!1087)

(assert (=> b!42071 (= lt!17304 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17283 lt!17306 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42071 (arrayContainsKey!0 lt!17283 lt!17306 #b00000000000000000000000000000000)))

(declare-fun lt!17305 () Unit!1087)

(assert (=> b!42071 (= lt!17305 lt!17304)))

(declare-fun res!25058 () Bool)

(declare-datatypes ((SeekEntryResult!178 0))(
  ( (MissingZero!178 (index!2834 (_ BitVec 32))) (Found!178 (index!2835 (_ BitVec 32))) (Intermediate!178 (undefined!990 Bool) (index!2836 (_ BitVec 32)) (x!8007 (_ BitVec 32))) (Undefined!178) (MissingVacant!178 (index!2837 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2767 (_ BitVec 32)) SeekEntryResult!178)

(assert (=> b!42071 (= res!25058 (= (seekEntryOrOpen!0 (select (arr!1327 lt!17283) #b00000000000000000000000000000000) lt!17283 mask!853) (Found!178 #b00000000000000000000000000000000)))))

(assert (=> b!42071 (=> (not res!25058) (not e!26602))))

(declare-fun b!42072 () Bool)

(assert (=> b!42072 (= e!26601 call!3266)))

(declare-fun b!42073 () Bool)

(declare-fun e!26600 () Bool)

(assert (=> b!42073 (= e!26600 e!26601)))

(declare-fun c!5255 () Bool)

(assert (=> b!42073 (= c!5255 (validKeyInArray!0 (select (arr!1327 lt!17283) #b00000000000000000000000000000000)))))

(declare-fun bm!3263 () Bool)

(assert (=> bm!3263 (= call!3266 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17283 mask!853))))

(declare-fun d!7543 () Bool)

(declare-fun res!25059 () Bool)

(assert (=> d!7543 (=> res!25059 e!26600)))

(assert (=> d!7543 (= res!25059 (bvsge #b00000000000000000000000000000000 (size!1485 lt!17283)))))

(assert (=> d!7543 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17283 mask!853) e!26600)))

(assert (= (and d!7543 (not res!25059)) b!42073))

(assert (= (and b!42073 c!5255) b!42071))

(assert (= (and b!42073 (not c!5255)) b!42072))

(assert (= (and b!42071 res!25058) b!42070))

(assert (= (or b!42070 b!42072) bm!3263))

(assert (=> b!42071 m!35679))

(declare-fun m!35693 () Bool)

(assert (=> b!42071 m!35693))

(declare-fun m!35695 () Bool)

(assert (=> b!42071 m!35695))

(assert (=> b!42071 m!35679))

(declare-fun m!35697 () Bool)

(assert (=> b!42071 m!35697))

(assert (=> b!42073 m!35679))

(assert (=> b!42073 m!35679))

(assert (=> b!42073 m!35681))

(declare-fun m!35699 () Bool)

(assert (=> bm!3263 m!35699))

(assert (=> b!42043 d!7543))

(declare-fun d!7553 () Bool)

(assert (=> d!7553 (= (arrayCountValidKeys!0 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17312 () Unit!1087)

(declare-fun choose!59 (array!2767 (_ BitVec 32) (_ BitVec 32)) Unit!1087)

(assert (=> d!7553 (= lt!17312 (choose!59 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7553 (bvslt (size!1485 lt!17283) #b01111111111111111111111111111111)))

(assert (=> d!7553 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17312)))

(declare-fun bs!1815 () Bool)

(assert (= bs!1815 d!7553))

(assert (=> bs!1815 m!35667))

(declare-fun m!35703 () Bool)

(assert (=> bs!1815 m!35703))

(assert (=> b!42043 d!7553))

(declare-fun d!7557 () Bool)

(declare-fun lt!17321 () (_ BitVec 32))

(assert (=> d!7557 (and (bvsge lt!17321 #b00000000000000000000000000000000) (bvsle lt!17321 (bvsub (size!1485 lt!17283) #b00000000000000000000000000000000)))))

(declare-fun e!26628 () (_ BitVec 32))

(assert (=> d!7557 (= lt!17321 e!26628)))

(declare-fun c!5265 () Bool)

(assert (=> d!7557 (= c!5265 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7557 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1485 lt!17283)))))

(assert (=> d!7557 (= (arrayCountValidKeys!0 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17321)))

(declare-fun b!42107 () Bool)

(declare-fun e!26627 () (_ BitVec 32))

(assert (=> b!42107 (= e!26628 e!26627)))

(declare-fun c!5266 () Bool)

(assert (=> b!42107 (= c!5266 (validKeyInArray!0 (select (arr!1327 lt!17283) #b00000000000000000000000000000000)))))

(declare-fun bm!3271 () Bool)

(declare-fun call!3274 () (_ BitVec 32))

(assert (=> bm!3271 (= call!3274 (arrayCountValidKeys!0 lt!17283 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42108 () Bool)

(assert (=> b!42108 (= e!26628 #b00000000000000000000000000000000)))

(declare-fun b!42109 () Bool)

(assert (=> b!42109 (= e!26627 (bvadd #b00000000000000000000000000000001 call!3274))))

(declare-fun b!42110 () Bool)

(assert (=> b!42110 (= e!26627 call!3274)))

(assert (= (and d!7557 c!5265) b!42108))

(assert (= (and d!7557 (not c!5265)) b!42107))

(assert (= (and b!42107 c!5266) b!42109))

(assert (= (and b!42107 (not c!5266)) b!42110))

(assert (= (or b!42109 b!42110) bm!3271))

(assert (=> b!42107 m!35679))

(assert (=> b!42107 m!35679))

(assert (=> b!42107 m!35681))

(declare-fun m!35717 () Bool)

(assert (=> bm!3271 m!35717))

(assert (=> b!42043 d!7557))

(declare-fun d!7565 () Bool)

(declare-fun getCurrentListMap!345 (array!2767 array!2769 (_ BitVec 32) (_ BitVec 32) V!2213 V!2213 (_ BitVec 32) Int) ListLongMap!1149)

(assert (=> d!7565 (= (map!761 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (getCurrentListMap!345 (_keys!3369 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_values!1839 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5290 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (extraKeys!1747 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (zeroValue!1774 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (minValue!1774 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1856 (LongMapFixedSize!327 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17287 lt!17287 #b00000000000000000000000000000000 lt!17283 (array!2770 ((as const (Array (_ BitVec 32) ValueCell!673)) EmptyCell!673) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun bs!1818 () Bool)

(assert (= bs!1818 d!7565))

(declare-fun m!35727 () Bool)

(assert (=> bs!1818 m!35727))

(assert (=> b!42043 d!7565))

(declare-fun d!7569 () Bool)

(assert (=> d!7569 (arrayNoDuplicates!0 lt!17283 #b00000000000000000000000000000000 Nil!1138)))

(declare-fun lt!17336 () Unit!1087)

(declare-fun choose!111 (array!2767 (_ BitVec 32) (_ BitVec 32) List!1141) Unit!1087)

(assert (=> d!7569 (= lt!17336 (choose!111 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1138))))

(assert (=> d!7569 (= (size!1485 lt!17283) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7569 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!17283 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1138) lt!17336)))

(declare-fun bs!1819 () Bool)

(assert (= bs!1819 d!7569))

(assert (=> bs!1819 m!35663))

(declare-fun m!35739 () Bool)

(assert (=> bs!1819 m!35739))

(assert (=> b!42043 d!7569))

(declare-fun d!7575 () Bool)

(assert (=> d!7575 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6044 d!7575))

(push 1)

