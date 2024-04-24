; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10 () Bool)

(assert start!10)

(declare-fun b_free!1 () Bool)

(declare-fun b_next!1 () Bool)

(assert (=> start!10 (= b_free!1 (not b_next!1))))

(declare-fun tp!2 () Bool)

(declare-fun b_and!1 () Bool)

(assert (=> start!10 (= tp!2 b_and!1)))

(declare-fun res!4175 () Bool)

(declare-fun e!65 () Bool)

(assert (=> start!10 (=> (not res!4175) (not e!65))))

(assert (=> start!10 (= res!4175 true)))

(assert (=> start!10 e!65))

(assert (=> start!10 tp!2))

(declare-fun b!1394 () Bool)

(declare-fun e!66 () Bool)

(assert (=> b!1394 (= e!65 e!66)))

(declare-fun res!4174 () Bool)

(assert (=> b!1394 (=> res!4174 e!66)))

(declare-datatypes ((V!211 0))(
  ( (V!212 (val!0 Int)) )
))
(declare-datatypes ((ValueCell!2 0))(
  ( (ValueCellFull!2 (v!1065 V!211)) (EmptyCell!2) )
))
(declare-datatypes ((array!3 0))(
  ( (array!4 (arr!1 (Array (_ BitVec 32) ValueCell!2)) (size!45 (_ BitVec 32))) )
))
(declare-datatypes ((array!5 0))(
  ( (array!6 (arr!2 (Array (_ BitVec 32) (_ BitVec 64))) (size!46 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4 0))(
  ( (LongMapFixedSize!5 (defaultEntry!1580 Int) (mask!4132 (_ BitVec 32)) (extraKeys!1500 (_ BitVec 32)) (zeroValue!1523 V!211) (minValue!1523 V!211) (_size!33 (_ BitVec 32)) (_keys!2979 array!5) (_values!1584 array!3) (_vacant!33 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!4 0))(
  ( (Cell!5 (v!1066 LongMapFixedSize!4)) )
))
(declare-datatypes ((LongMap!4 0))(
  ( (LongMap!5 (underlying!13 Cell!4)) )
))
(declare-fun lt!2 () LongMap!4)

(declare-fun valid!3 (LongMap!4) Bool)

(assert (=> b!1394 (= res!4174 (not (valid!3 lt!2)))))

(declare-fun defaultEntry!179 () Int)

(declare-fun getNewLongMapFixedSize!1 ((_ BitVec 32) Int) LongMapFixedSize!4)

(assert (=> b!1394 (= lt!2 (LongMap!5 (Cell!5 (getNewLongMapFixedSize!1 #b00000000000000000000000000001111 defaultEntry!179))))))

(declare-fun b!1395 () Bool)

(declare-fun size!47 (LongMap!4) (_ BitVec 32))

(assert (=> b!1395 (= e!66 (not (= (size!47 lt!2) #b00000000000000000000000000000000)))))

(assert (= (and start!10 res!4175) b!1394))

(assert (= (and b!1394 (not res!4174)) b!1395))

(declare-fun m!75 () Bool)

(assert (=> b!1394 m!75))

(declare-fun m!77 () Bool)

(assert (=> b!1394 m!77))

(declare-fun m!79 () Bool)

(assert (=> b!1395 m!79))

(check-sat (not b!1394) (not b!1395) b_and!1 (not b_next!1))
(check-sat b_and!1 (not b_next!1))
(get-model)

(declare-fun d!8 () Bool)

(declare-fun valid!7 (LongMapFixedSize!4) Bool)

(assert (=> d!8 (= (valid!3 lt!2) (valid!7 (v!1066 (underlying!13 lt!2))))))

(declare-fun bs!8 () Bool)

(assert (= bs!8 d!8))

(declare-fun m!97 () Bool)

(assert (=> bs!8 m!97))

(assert (=> b!1394 d!8))

(declare-fun b!1450 () Bool)

(declare-fun e!100 () Bool)

(declare-datatypes ((tuple2!1 0))(
  ( (tuple2!3 (_1!1 (_ BitVec 64)) (_2!1 V!211)) )
))
(declare-fun lt!189 () tuple2!1)

(declare-fun lt!179 () (_ BitVec 32))

(assert (=> b!1450 (= e!100 (ite (= (_1!1 lt!189) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!179 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!179 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1451 () Bool)

(declare-fun lt!183 () array!5)

(declare-fun arrayContainsKey!0 (array!5 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1451 (= e!100 (arrayContainsKey!0 lt!183 (_1!1 lt!189) #b00000000000000000000000000000000))))

(declare-fun d!15 () Bool)

(declare-fun e!102 () Bool)

(assert (=> d!15 e!102))

(declare-fun res!4202 () Bool)

(assert (=> d!15 (=> (not res!4202) (not e!102))))

(declare-fun lt!188 () LongMapFixedSize!4)

(assert (=> d!15 (= res!4202 (valid!7 lt!188))))

(declare-fun lt!185 () LongMapFixedSize!4)

(assert (=> d!15 (= lt!188 lt!185)))

(declare-datatypes ((Unit!3 0))(
  ( (Unit!4) )
))
(declare-fun lt!192 () Unit!3)

(declare-fun e!101 () Unit!3)

(assert (=> d!15 (= lt!192 e!101)))

(declare-fun c!30 () Bool)

(declare-datatypes ((List!8 0))(
  ( (Nil!5) (Cons!4 (h!570 tuple2!1) (t!2015 List!8)) )
))
(declare-datatypes ((ListLongMap!9 0))(
  ( (ListLongMap!10 (toList!20 List!8)) )
))
(declare-fun map!22 (LongMapFixedSize!4) ListLongMap!9)

(assert (=> d!15 (= c!30 (not (= (map!22 lt!185) (ListLongMap!10 Nil!5))))))

(declare-fun lt!171 () Unit!3)

(declare-fun lt!182 () Unit!3)

(assert (=> d!15 (= lt!171 lt!182)))

(declare-fun lt!175 () array!5)

(declare-fun lt!187 () (_ BitVec 32))

(declare-datatypes ((List!9 0))(
  ( (Nil!6) (Cons!5 (h!571 (_ BitVec 64)) (t!2016 List!9)) )
))
(declare-fun lt!190 () List!9)

(declare-fun arrayNoDuplicates!0 (array!5 (_ BitVec 32) List!9) Bool)

(assert (=> d!15 (arrayNoDuplicates!0 lt!175 lt!187 lt!190)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!5 (_ BitVec 32) (_ BitVec 32) List!9) Unit!3)

(assert (=> d!15 (= lt!182 (lemmaArrayNoDuplicatesInAll0Array!0 lt!175 lt!187 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!190))))

(assert (=> d!15 (= lt!190 Nil!6)))

(assert (=> d!15 (= lt!187 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!175 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!176 () Unit!3)

(declare-fun lt!186 () Unit!3)

(assert (=> d!15 (= lt!176 lt!186)))

(declare-fun lt!180 () (_ BitVec 32))

(declare-fun lt!181 () array!5)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5 (_ BitVec 32)) Bool)

(assert (=> d!15 (arrayForallSeekEntryOrOpenFound!0 lt!180 lt!181 #b00000000000000000000000000001111)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!15 (= lt!186 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!181 #b00000000000000000000000000001111 lt!180))))

(assert (=> d!15 (= lt!180 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!181 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!170 () Unit!3)

(declare-fun lt!191 () Unit!3)

(assert (=> d!15 (= lt!170 lt!191)))

(declare-fun lt!177 () array!5)

(declare-fun lt!173 () (_ BitVec 32))

(declare-fun lt!184 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!5 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!15 (= (arrayCountValidKeys!0 lt!177 lt!173 lt!184) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!15 (= lt!191 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!177 lt!173 lt!184))))

(assert (=> d!15 (= lt!184 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!15 (= lt!173 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!177 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun dynLambda!1 (Int (_ BitVec 64)) V!211)

(assert (=> d!15 (= lt!185 (LongMapFixedSize!5 defaultEntry!179 #b00000000000000000000000000001111 #b00000000000000000000000000000000 (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!15 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!15 (= (getNewLongMapFixedSize!1 #b00000000000000000000000000001111 defaultEntry!179) lt!188)))

(declare-fun b!1452 () Bool)

(declare-fun Unit!8 () Unit!3)

(assert (=> b!1452 (= e!101 Unit!8)))

(declare-fun head!740 (List!8) tuple2!1)

(assert (=> b!1452 (= lt!189 (head!740 (toList!20 (map!22 lt!185))))))

(assert (=> b!1452 (= lt!183 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(assert (=> b!1452 (= lt!179 #b00000000000000000000000000000000)))

(declare-fun lt!178 () Unit!3)

(declare-fun lemmaKeyInListMapIsInArray!1 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 64) Int) Unit!3)

(assert (=> b!1452 (= lt!178 (lemmaKeyInListMapIsInArray!1 lt!183 (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!179 (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!1 lt!189) defaultEntry!179))))

(declare-fun c!29 () Bool)

(assert (=> b!1452 (= c!29 (and (not (= (_1!1 lt!189) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!1 lt!189) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1452 e!100))

(declare-fun lt!174 () Unit!3)

(assert (=> b!1452 (= lt!174 lt!178)))

(declare-fun lt!172 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!5 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452 (= lt!172 (arrayScanForKey!0 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!1 lt!189) #b00000000000000000000000000000000))))

(assert (=> b!1452 false))

(declare-fun b!1453 () Bool)

(assert (=> b!1453 (= e!102 (= (map!22 lt!188) (ListLongMap!10 Nil!5)))))

(declare-fun b!1454 () Bool)

(declare-fun res!4203 () Bool)

(assert (=> b!1454 (=> (not res!4203) (not e!102))))

(assert (=> b!1454 (= res!4203 (= (mask!4132 lt!188) #b00000000000000000000000000001111))))

(declare-fun b!1455 () Bool)

(declare-fun Unit!11 () Unit!3)

(assert (=> b!1455 (= e!101 Unit!11)))

(assert (= (and d!15 c!30) b!1452))

(assert (= (and d!15 (not c!30)) b!1455))

(assert (= (and b!1452 c!29) b!1451))

(assert (= (and b!1452 (not c!29)) b!1450))

(assert (= (and d!15 res!4202) b!1454))

(assert (= (and b!1454 res!4203) b!1453))

(declare-fun b_lambda!5 () Bool)

(assert (=> (not b_lambda!5) (not d!15)))

(declare-fun t!2012 () Bool)

(declare-fun tb!5 () Bool)

(assert (=> (and start!10 (= defaultEntry!179 defaultEntry!179) t!2012) tb!5))

(declare-fun result!3 () Bool)

(declare-fun tp_is_empty!4 () Bool)

(assert (=> tb!5 (= result!3 tp_is_empty!4)))

(assert (=> d!15 t!2012))

(declare-fun b_and!10 () Bool)

(assert (= b_and!1 (and (=> t!2012 result!3) b_and!10)))

(declare-fun b_lambda!11 () Bool)

(assert (=> (not b_lambda!11) (not b!1452)))

(assert (=> b!1452 t!2012))

(declare-fun b_and!17 () Bool)

(assert (= b_and!10 (and (=> t!2012 result!3) b_and!17)))

(declare-fun m!102 () Bool)

(assert (=> b!1451 m!102))

(declare-fun m!109 () Bool)

(assert (=> d!15 m!109))

(declare-fun m!113 () Bool)

(assert (=> d!15 m!113))

(declare-fun m!119 () Bool)

(assert (=> d!15 m!119))

(declare-fun m!126 () Bool)

(assert (=> d!15 m!126))

(declare-fun m!133 () Bool)

(assert (=> d!15 m!133))

(declare-fun m!139 () Bool)

(assert (=> d!15 m!139))

(declare-fun m!145 () Bool)

(assert (=> d!15 m!145))

(declare-fun m!151 () Bool)

(assert (=> d!15 m!151))

(declare-fun m!155 () Bool)

(assert (=> d!15 m!155))

(declare-fun m!159 () Bool)

(assert (=> d!15 m!159))

(assert (=> b!1452 m!113))

(assert (=> b!1452 m!126))

(assert (=> b!1452 m!126))

(declare-fun m!171 () Bool)

(assert (=> b!1452 m!171))

(declare-fun m!173 () Bool)

(assert (=> b!1452 m!173))

(assert (=> b!1452 m!126))

(declare-fun m!177 () Bool)

(assert (=> b!1452 m!177))

(declare-fun m!179 () Bool)

(assert (=> b!1453 m!179))

(assert (=> b!1394 d!15))

(declare-fun d!19 () Bool)

(declare-fun size!56 (LongMapFixedSize!4) (_ BitVec 32))

(assert (=> d!19 (= (size!47 lt!2) (size!56 (v!1066 (underlying!13 lt!2))))))

(declare-fun bs!11 () Bool)

(assert (= bs!11 d!19))

(declare-fun m!193 () Bool)

(assert (=> bs!11 m!193))

(assert (=> b!1395 d!19))

(declare-fun b_lambda!21 () Bool)

(assert (= b_lambda!11 (or (and start!10 b_free!1) b_lambda!21)))

(declare-fun b_lambda!23 () Bool)

(assert (= b_lambda!5 (or (and start!10 b_free!1) b_lambda!23)))

(check-sat (not b!1451) (not b!1453) (not b_lambda!21) tp_is_empty!4 (not d!15) (not b_lambda!23) b_and!17 (not d!8) (not b_next!1) (not b!1452) (not d!19))
(check-sat b_and!17 (not b_next!1))
(get-model)

(declare-fun d!39 () Bool)

(declare-fun res!4210 () Bool)

(declare-fun e!116 () Bool)

(assert (=> d!39 (=> res!4210 e!116)))

(assert (=> d!39 (= res!4210 (= (select (arr!2 lt!183) #b00000000000000000000000000000000) (_1!1 lt!189)))))

(assert (=> d!39 (= (arrayContainsKey!0 lt!183 (_1!1 lt!189) #b00000000000000000000000000000000) e!116)))

(declare-fun b!1484 () Bool)

(declare-fun e!117 () Bool)

(assert (=> b!1484 (= e!116 e!117)))

(declare-fun res!4211 () Bool)

(assert (=> b!1484 (=> (not res!4211) (not e!117))))

(assert (=> b!1484 (= res!4211 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46 lt!183)))))

(declare-fun b!1485 () Bool)

(assert (=> b!1485 (= e!117 (arrayContainsKey!0 lt!183 (_1!1 lt!189) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!39 (not res!4210)) b!1484))

(assert (= (and b!1484 res!4211) b!1485))

(declare-fun m!203 () Bool)

(assert (=> d!39 m!203))

(declare-fun m!205 () Bool)

(assert (=> b!1485 m!205))

(assert (=> b!1451 d!39))

(declare-fun bm!2 () Bool)

(declare-fun call!5 () (_ BitVec 32))

(assert (=> bm!2 (= call!5 (arrayCountValidKeys!0 lt!177 (bvadd lt!173 #b00000000000000000000000000000001) lt!184))))

(declare-fun b!1512 () Bool)

(declare-fun e!131 () (_ BitVec 32))

(assert (=> b!1512 (= e!131 #b00000000000000000000000000000000)))

(declare-fun b!1513 () Bool)

(declare-fun e!130 () (_ BitVec 32))

(assert (=> b!1513 (= e!131 e!130)))

(declare-fun c!49 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1513 (= c!49 (validKeyInArray!0 (select (arr!2 lt!177) lt!173)))))

(declare-fun b!1514 () Bool)

(assert (=> b!1514 (= e!130 (bvadd #b00000000000000000000000000000001 call!5))))

(declare-fun b!1515 () Bool)

(assert (=> b!1515 (= e!130 call!5)))

(declare-fun d!41 () Bool)

(declare-fun lt!236 () (_ BitVec 32))

(assert (=> d!41 (and (bvsge lt!236 #b00000000000000000000000000000000) (bvsle lt!236 (bvsub (size!46 lt!177) lt!173)))))

(assert (=> d!41 (= lt!236 e!131)))

(declare-fun c!50 () Bool)

(assert (=> d!41 (= c!50 (bvsge lt!173 lt!184))))

(assert (=> d!41 (and (bvsle lt!173 lt!184) (bvsge lt!173 #b00000000000000000000000000000000) (bvsle lt!184 (size!46 lt!177)))))

(assert (=> d!41 (= (arrayCountValidKeys!0 lt!177 lt!173 lt!184) lt!236)))

(assert (= (and d!41 c!50) b!1512))

(assert (= (and d!41 (not c!50)) b!1513))

(assert (= (and b!1513 c!49) b!1514))

(assert (= (and b!1513 (not c!49)) b!1515))

(assert (= (or b!1514 b!1515) bm!2))

(declare-fun m!223 () Bool)

(assert (=> bm!2 m!223))

(declare-fun m!225 () Bool)

(assert (=> b!1513 m!225))

(assert (=> b!1513 m!225))

(declare-fun m!229 () Bool)

(assert (=> b!1513 m!229))

(assert (=> d!15 d!41))

(declare-fun d!51 () Bool)

(declare-fun getCurrentListMap!3 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 32) Int) ListLongMap!9)

(assert (=> d!51 (= (map!22 lt!185) (getCurrentListMap!3 (_keys!2979 lt!185) (_values!1584 lt!185) (mask!4132 lt!185) (extraKeys!1500 lt!185) (zeroValue!1523 lt!185) (minValue!1523 lt!185) #b00000000000000000000000000000000 (defaultEntry!1580 lt!185)))))

(declare-fun bs!16 () Bool)

(assert (= bs!16 d!51))

(declare-fun m!241 () Bool)

(assert (=> bs!16 m!241))

(assert (=> d!15 d!51))

(declare-fun d!55 () Bool)

(assert (=> d!55 (= (arrayCountValidKeys!0 lt!177 lt!173 lt!184) #b00000000000000000000000000000000)))

(declare-fun lt!247 () Unit!3)

(declare-fun choose!59 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!55 (= lt!247 (choose!59 lt!177 lt!173 lt!184))))

(assert (=> d!55 (bvslt (size!46 lt!177) #b01111111111111111111111111111111)))

(assert (=> d!55 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!177 lt!173 lt!184) lt!247)))

(declare-fun bs!17 () Bool)

(assert (= bs!17 d!55))

(assert (=> bs!17 m!145))

(declare-fun m!251 () Bool)

(assert (=> bs!17 m!251))

(assert (=> d!15 d!55))

(declare-fun d!61 () Bool)

(assert (=> d!61 (arrayForallSeekEntryOrOpenFound!0 lt!180 lt!181 #b00000000000000000000000000001111)))

(declare-fun lt!254 () Unit!3)

(declare-fun choose!34 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!61 (= lt!254 (choose!34 lt!181 #b00000000000000000000000000001111 lt!180))))

(assert (=> d!61 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!61 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!181 #b00000000000000000000000000001111 lt!180) lt!254)))

(declare-fun bs!20 () Bool)

(assert (= bs!20 d!61))

(assert (=> bs!20 m!119))

(declare-fun m!257 () Bool)

(assert (=> bs!20 m!257))

(assert (=> bs!20 m!159))

(assert (=> d!15 d!61))

(declare-fun b!1577 () Bool)

(declare-fun e!172 () Bool)

(declare-fun e!174 () Bool)

(assert (=> b!1577 (= e!172 e!174)))

(declare-fun c!71 () Bool)

(assert (=> b!1577 (= c!71 (validKeyInArray!0 (select (arr!2 lt!175) lt!187)))))

(declare-fun d!69 () Bool)

(declare-fun res!4241 () Bool)

(declare-fun e!173 () Bool)

(assert (=> d!69 (=> res!4241 e!173)))

(assert (=> d!69 (= res!4241 (bvsge lt!187 (size!46 lt!175)))))

(assert (=> d!69 (= (arrayNoDuplicates!0 lt!175 lt!187 lt!190) e!173)))

(declare-fun b!1578 () Bool)

(declare-fun call!20 () Bool)

(assert (=> b!1578 (= e!174 call!20)))

(declare-fun b!1579 () Bool)

(declare-fun e!171 () Bool)

(declare-fun contains!9 (List!9 (_ BitVec 64)) Bool)

(assert (=> b!1579 (= e!171 (contains!9 lt!190 (select (arr!2 lt!175) lt!187)))))

(declare-fun b!1580 () Bool)

(assert (=> b!1580 (= e!174 call!20)))

(declare-fun b!1581 () Bool)

(assert (=> b!1581 (= e!173 e!172)))

(declare-fun res!4240 () Bool)

(assert (=> b!1581 (=> (not res!4240) (not e!172))))

(assert (=> b!1581 (= res!4240 (not e!171))))

(declare-fun res!4239 () Bool)

(assert (=> b!1581 (=> (not res!4239) (not e!171))))

(assert (=> b!1581 (= res!4239 (validKeyInArray!0 (select (arr!2 lt!175) lt!187)))))

(declare-fun bm!17 () Bool)

(assert (=> bm!17 (= call!20 (arrayNoDuplicates!0 lt!175 (bvadd lt!187 #b00000000000000000000000000000001) (ite c!71 (Cons!5 (select (arr!2 lt!175) lt!187) lt!190) lt!190)))))

(assert (= (and d!69 (not res!4241)) b!1581))

(assert (= (and b!1581 res!4239) b!1579))

(assert (= (and b!1581 res!4240) b!1577))

(assert (= (and b!1577 c!71) b!1580))

(assert (= (and b!1577 (not c!71)) b!1578))

(assert (= (or b!1580 b!1578) bm!17))

(declare-fun m!281 () Bool)

(assert (=> b!1577 m!281))

(assert (=> b!1577 m!281))

(declare-fun m!285 () Bool)

(assert (=> b!1577 m!285))

(assert (=> b!1579 m!281))

(assert (=> b!1579 m!281))

(declare-fun m!287 () Bool)

(assert (=> b!1579 m!287))

(assert (=> b!1581 m!281))

(assert (=> b!1581 m!281))

(assert (=> b!1581 m!285))

(assert (=> bm!17 m!281))

(declare-fun m!289 () Bool)

(assert (=> bm!17 m!289))

(assert (=> d!15 d!69))

(declare-fun d!75 () Bool)

(assert (=> d!75 (arrayNoDuplicates!0 lt!175 lt!187 lt!190)))

(declare-fun lt!278 () Unit!3)

(declare-fun choose!111 (array!5 (_ BitVec 32) (_ BitVec 32) List!9) Unit!3)

(assert (=> d!75 (= lt!278 (choose!111 lt!175 lt!187 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!190))))

(assert (=> d!75 (= (size!46 lt!175) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!75 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!175 lt!187 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!190) lt!278)))

(declare-fun bs!22 () Bool)

(assert (= bs!22 d!75))

(assert (=> bs!22 m!151))

(declare-fun m!293 () Bool)

(assert (=> bs!22 m!293))

(assert (=> d!15 d!75))

(declare-fun d!81 () Bool)

(assert (=> d!81 (= (validMask!0 #b00000000000000000000000000001111) true)))

(assert (=> d!15 d!81))

(declare-fun d!83 () Bool)

(declare-fun res!4276 () Bool)

(declare-fun e!210 () Bool)

(assert (=> d!83 (=> res!4276 e!210)))

(assert (=> d!83 (= res!4276 (bvsge lt!180 (size!46 lt!181)))))

(assert (=> d!83 (= (arrayForallSeekEntryOrOpenFound!0 lt!180 lt!181 #b00000000000000000000000000001111) e!210)))

(declare-fun bm!26 () Bool)

(declare-fun call!29 () Bool)

(assert (=> bm!26 (= call!29 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!180 #b00000000000000000000000000000001) lt!181 #b00000000000000000000000000001111))))

(declare-fun b!1632 () Bool)

(declare-fun e!211 () Bool)

(assert (=> b!1632 (= e!210 e!211)))

(declare-fun c!80 () Bool)

(assert (=> b!1632 (= c!80 (validKeyInArray!0 (select (arr!2 lt!181) lt!180)))))

(declare-fun b!1633 () Bool)

(assert (=> b!1633 (= e!211 call!29)))

(declare-fun b!1634 () Bool)

(declare-fun e!209 () Bool)

(assert (=> b!1634 (= e!211 e!209)))

(declare-fun lt!290 () (_ BitVec 64))

(assert (=> b!1634 (= lt!290 (select (arr!2 lt!181) lt!180))))

(declare-fun lt!288 () Unit!3)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5 (_ BitVec 64) (_ BitVec 32)) Unit!3)

(assert (=> b!1634 (= lt!288 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!181 lt!290 lt!180))))

(assert (=> b!1634 (arrayContainsKey!0 lt!181 lt!290 #b00000000000000000000000000000000)))

(declare-fun lt!289 () Unit!3)

(assert (=> b!1634 (= lt!289 lt!288)))

(declare-fun res!4277 () Bool)

(declare-datatypes ((SeekEntryResult!4 0))(
  ( (MissingZero!4 (index!2135 (_ BitVec 32))) (Found!4 (index!2136 (_ BitVec 32))) (Intermediate!4 (undefined!816 Bool) (index!2137 (_ BitVec 32)) (x!1759 (_ BitVec 32))) (Undefined!4) (MissingVacant!4 (index!2138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5 (_ BitVec 32)) SeekEntryResult!4)

(assert (=> b!1634 (= res!4277 (= (seekEntryOrOpen!0 (select (arr!2 lt!181) lt!180) lt!181 #b00000000000000000000000000001111) (Found!4 lt!180)))))

(assert (=> b!1634 (=> (not res!4277) (not e!209))))

(declare-fun b!1635 () Bool)

(assert (=> b!1635 (= e!209 call!29)))

(assert (= (and d!83 (not res!4276)) b!1632))

(assert (= (and b!1632 c!80) b!1634))

(assert (= (and b!1632 (not c!80)) b!1633))

(assert (= (and b!1634 res!4277) b!1635))

(assert (= (or b!1635 b!1633) bm!26))

(declare-fun m!329 () Bool)

(assert (=> bm!26 m!329))

(declare-fun m!331 () Bool)

(assert (=> b!1632 m!331))

(assert (=> b!1632 m!331))

(declare-fun m!333 () Bool)

(assert (=> b!1632 m!333))

(assert (=> b!1634 m!331))

(declare-fun m!335 () Bool)

(assert (=> b!1634 m!335))

(declare-fun m!337 () Bool)

(assert (=> b!1634 m!337))

(assert (=> b!1634 m!331))

(declare-fun m!341 () Bool)

(assert (=> b!1634 m!341))

(assert (=> d!15 d!83))

(declare-fun d!99 () Bool)

(declare-fun res!4299 () Bool)

(declare-fun e!227 () Bool)

(assert (=> d!99 (=> (not res!4299) (not e!227))))

(declare-fun simpleValid!3 (LongMapFixedSize!4) Bool)

(assert (=> d!99 (= res!4299 (simpleValid!3 lt!188))))

(assert (=> d!99 (= (valid!7 lt!188) e!227)))

(declare-fun b!1657 () Bool)

(declare-fun res!4300 () Bool)

(assert (=> b!1657 (=> (not res!4300) (not e!227))))

(assert (=> b!1657 (= res!4300 (= (arrayCountValidKeys!0 (_keys!2979 lt!188) #b00000000000000000000000000000000 (size!46 (_keys!2979 lt!188))) (_size!33 lt!188)))))

(declare-fun b!1658 () Bool)

(declare-fun res!4301 () Bool)

(assert (=> b!1658 (=> (not res!4301) (not e!227))))

(assert (=> b!1658 (= res!4301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2979 lt!188) (mask!4132 lt!188)))))

(declare-fun b!1659 () Bool)

(assert (=> b!1659 (= e!227 (arrayNoDuplicates!0 (_keys!2979 lt!188) #b00000000000000000000000000000000 Nil!6))))

(assert (= (and d!99 res!4299) b!1657))

(assert (= (and b!1657 res!4300) b!1658))

(assert (= (and b!1658 res!4301) b!1659))

(declare-fun m!361 () Bool)

(assert (=> d!99 m!361))

(declare-fun m!363 () Bool)

(assert (=> b!1657 m!363))

(declare-fun m!365 () Bool)

(assert (=> b!1658 m!365))

(declare-fun m!367 () Bool)

(assert (=> b!1659 m!367))

(assert (=> d!15 d!99))

(declare-fun d!107 () Bool)

(assert (=> d!107 (= (size!56 (v!1066 (underlying!13 lt!2))) (bvadd (_size!33 (v!1066 (underlying!13 lt!2))) (bvsdiv (bvadd (extraKeys!1500 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> d!19 d!107))

(declare-fun d!109 () Bool)

(assert (=> d!109 (= (head!740 (toList!20 (map!22 lt!185))) (h!570 (toList!20 (map!22 lt!185))))))

(assert (=> b!1452 d!109))

(assert (=> b!1452 d!51))

(declare-fun d!111 () Bool)

(declare-fun e!230 () Bool)

(assert (=> d!111 e!230))

(declare-fun c!83 () Bool)

(assert (=> d!111 (= c!83 (and (not (= (_1!1 lt!189) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!1 lt!189) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!293 () Unit!3)

(declare-fun choose!131 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 64) Int) Unit!3)

(assert (=> d!111 (= lt!293 (choose!131 lt!183 (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!179 (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!1 lt!189) defaultEntry!179))))

(assert (=> d!111 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!111 (= (lemmaKeyInListMapIsInArray!1 lt!183 (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!179 (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!1 lt!189) defaultEntry!179) lt!293)))

(declare-fun b!1664 () Bool)

(assert (=> b!1664 (= e!230 (arrayContainsKey!0 lt!183 (_1!1 lt!189) #b00000000000000000000000000000000))))

(declare-fun b!1665 () Bool)

(assert (=> b!1665 (= e!230 (ite (= (_1!1 lt!189) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!179 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!179 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!111 c!83) b!1664))

(assert (= (and d!111 (not c!83)) b!1665))

(assert (=> d!111 m!126))

(assert (=> d!111 m!126))

(declare-fun m!369 () Bool)

(assert (=> d!111 m!369))

(assert (=> d!111 m!159))

(assert (=> b!1664 m!102))

(assert (=> b!1452 d!111))

(declare-fun d!113 () Bool)

(declare-fun lt!296 () (_ BitVec 32))

(assert (=> d!113 (and (or (bvslt lt!296 #b00000000000000000000000000000000) (bvsge lt!296 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (and (bvsge lt!296 #b00000000000000000000000000000000) (bvslt lt!296 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))) (bvsge lt!296 #b00000000000000000000000000000000) (bvslt lt!296 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (= (select (arr!2 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) lt!296) (_1!1 lt!189)))))

(declare-fun e!233 () (_ BitVec 32))

(assert (=> d!113 (= lt!296 e!233)))

(declare-fun c!86 () Bool)

(assert (=> d!113 (= c!86 (= (select (arr!2 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!1 lt!189)))))

(assert (=> d!113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (bvslt (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!113 (= (arrayScanForKey!0 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!1 lt!189) #b00000000000000000000000000000000) lt!296)))

(declare-fun b!1670 () Bool)

(assert (=> b!1670 (= e!233 #b00000000000000000000000000000000)))

(declare-fun b!1671 () Bool)

(assert (=> b!1671 (= e!233 (arrayScanForKey!0 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!1 lt!189) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!113 c!86) b!1670))

(assert (= (and d!113 (not c!86)) b!1671))

(declare-fun m!371 () Bool)

(assert (=> d!113 m!371))

(declare-fun m!373 () Bool)

(assert (=> d!113 m!373))

(declare-fun m!375 () Bool)

(assert (=> b!1671 m!375))

(assert (=> b!1452 d!113))

(declare-fun d!115 () Bool)

(declare-fun res!4302 () Bool)

(declare-fun e!234 () Bool)

(assert (=> d!115 (=> (not res!4302) (not e!234))))

(assert (=> d!115 (= res!4302 (simpleValid!3 (v!1066 (underlying!13 lt!2))))))

(assert (=> d!115 (= (valid!7 (v!1066 (underlying!13 lt!2))) e!234)))

(declare-fun b!1672 () Bool)

(declare-fun res!4303 () Bool)

(assert (=> b!1672 (=> (not res!4303) (not e!234))))

(assert (=> b!1672 (= res!4303 (= (arrayCountValidKeys!0 (_keys!2979 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000000 (size!46 (_keys!2979 (v!1066 (underlying!13 lt!2))))) (_size!33 (v!1066 (underlying!13 lt!2)))))))

(declare-fun b!1673 () Bool)

(declare-fun res!4304 () Bool)

(assert (=> b!1673 (=> (not res!4304) (not e!234))))

(assert (=> b!1673 (= res!4304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2979 (v!1066 (underlying!13 lt!2))) (mask!4132 (v!1066 (underlying!13 lt!2)))))))

(declare-fun b!1674 () Bool)

(assert (=> b!1674 (= e!234 (arrayNoDuplicates!0 (_keys!2979 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000000 Nil!6))))

(assert (= (and d!115 res!4302) b!1672))

(assert (= (and b!1672 res!4303) b!1673))

(assert (= (and b!1673 res!4304) b!1674))

(declare-fun m!377 () Bool)

(assert (=> d!115 m!377))

(declare-fun m!379 () Bool)

(assert (=> b!1672 m!379))

(declare-fun m!381 () Bool)

(assert (=> b!1673 m!381))

(declare-fun m!383 () Bool)

(assert (=> b!1674 m!383))

(assert (=> d!8 d!115))

(declare-fun d!117 () Bool)

(assert (=> d!117 (= (map!22 lt!188) (getCurrentListMap!3 (_keys!2979 lt!188) (_values!1584 lt!188) (mask!4132 lt!188) (extraKeys!1500 lt!188) (zeroValue!1523 lt!188) (minValue!1523 lt!188) #b00000000000000000000000000000000 (defaultEntry!1580 lt!188)))))

(declare-fun bs!26 () Bool)

(assert (= bs!26 d!117))

(declare-fun m!385 () Bool)

(assert (=> bs!26 m!385))

(assert (=> b!1453 d!117))

(check-sat (not b!1672) (not b!1657) tp_is_empty!4 (not b!1671) (not d!99) (not b!1674) (not d!51) (not b_lambda!23) b_and!17 (not b!1664) (not b!1658) (not b!1485) (not d!117) (not b!1579) (not d!111) (not bm!2) (not b!1673) (not d!55) (not b_lambda!21) (not d!75) (not d!115) (not b!1659) (not b!1581) (not b!1634) (not d!61) (not b!1577) (not bm!17) (not b_next!1) (not bm!26) (not b!1513) (not b!1632))
(check-sat b_and!17 (not b_next!1))
