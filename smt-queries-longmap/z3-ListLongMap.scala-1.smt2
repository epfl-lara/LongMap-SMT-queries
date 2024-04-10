; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!12 () Bool)

(assert start!12)

(declare-fun b_free!3 () Bool)

(declare-fun b_next!3 () Bool)

(assert (=> start!12 (= b_free!3 (not b_next!3))))

(declare-fun tp!5 () Bool)

(declare-fun b_and!3 () Bool)

(assert (=> start!12 (= tp!5 b_and!3)))

(declare-fun res!4181 () Bool)

(declare-fun e!71 () Bool)

(assert (=> start!12 (=> (not res!4181) (not e!71))))

(assert (=> start!12 (= res!4181 true)))

(assert (=> start!12 e!71))

(assert (=> start!12 tp!5))

(declare-fun b!1400 () Bool)

(declare-fun e!72 () Bool)

(assert (=> b!1400 (= e!71 e!72)))

(declare-fun res!4180 () Bool)

(assert (=> b!1400 (=> res!4180 e!72)))

(declare-datatypes ((V!213 0))(
  ( (V!214 (val!1 Int)) )
))
(declare-datatypes ((ValueCell!3 0))(
  ( (ValueCellFull!3 (v!1067 V!213)) (EmptyCell!3) )
))
(declare-datatypes ((array!7 0))(
  ( (array!8 (arr!3 (Array (_ BitVec 32) ValueCell!3)) (size!48 (_ BitVec 32))) )
))
(declare-datatypes ((array!9 0))(
  ( (array!10 (arr!4 (Array (_ BitVec 32) (_ BitVec 64))) (size!49 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6 0))(
  ( (LongMapFixedSize!7 (defaultEntry!1581 Int) (mask!4133 (_ BitVec 32)) (extraKeys!1501 (_ BitVec 32)) (zeroValue!1524 V!213) (minValue!1524 V!213) (_size!34 (_ BitVec 32)) (_keys!2980 array!9) (_values!1585 array!7) (_vacant!34 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!6 0))(
  ( (Cell!7 (v!1068 LongMapFixedSize!6)) )
))
(declare-datatypes ((LongMap!6 0))(
  ( (LongMap!7 (underlying!14 Cell!6)) )
))
(declare-fun lt!5 () LongMap!6)

(declare-fun valid!4 (LongMap!6) Bool)

(assert (=> b!1400 (= res!4180 (not (valid!4 lt!5)))))

(declare-fun defaultEntry!179 () Int)

(declare-fun getNewLongMapFixedSize!2 ((_ BitVec 32) Int) LongMapFixedSize!6)

(assert (=> b!1400 (= lt!5 (LongMap!7 (Cell!7 (getNewLongMapFixedSize!2 #b00000000000000000000000000001111 defaultEntry!179))))))

(declare-fun b!1401 () Bool)

(declare-fun size!50 (LongMap!6) (_ BitVec 32))

(assert (=> b!1401 (= e!72 (not (= (size!50 lt!5) #b00000000000000000000000000000000)))))

(assert (= (and start!12 res!4181) b!1400))

(assert (= (and b!1400 (not res!4180)) b!1401))

(declare-fun m!81 () Bool)

(assert (=> b!1400 m!81))

(declare-fun m!83 () Bool)

(assert (=> b!1400 m!83))

(declare-fun m!85 () Bool)

(assert (=> b!1401 m!85))

(check-sat (not b!1401) (not b!1400) b_and!3 (not b_next!3))
(check-sat b_and!3 (not b_next!3))
(get-model)

(declare-fun d!7 () Bool)

(declare-fun size!54 (LongMapFixedSize!6) (_ BitVec 32))

(assert (=> d!7 (= (size!50 lt!5) (size!54 (v!1068 (underlying!14 lt!5))))))

(declare-fun bs!6 () Bool)

(assert (= bs!6 d!7))

(declare-fun m!95 () Bool)

(assert (=> bs!6 m!95))

(assert (=> b!1401 d!7))

(declare-fun d!13 () Bool)

(declare-fun valid!8 (LongMapFixedSize!6) Bool)

(assert (=> d!13 (= (valid!4 lt!5) (valid!8 (v!1068 (underlying!14 lt!5))))))

(declare-fun bs!9 () Bool)

(assert (= bs!9 d!13))

(declare-fun m!99 () Bool)

(assert (=> bs!9 m!99))

(assert (=> b!1400 d!13))

(declare-fun b!1450 () Bool)

(declare-datatypes ((Unit!8 0))(
  ( (Unit!9) )
))
(declare-fun e!100 () Unit!8)

(declare-fun Unit!11 () Unit!8)

(assert (=> b!1450 (= e!100 Unit!11)))

(declare-fun b!1451 () Bool)

(declare-fun Unit!12 () Unit!8)

(assert (=> b!1451 (= e!100 Unit!12)))

(declare-datatypes ((tuple2!4 0))(
  ( (tuple2!5 (_1!2 (_ BitVec 64)) (_2!2 V!213)) )
))
(declare-fun lt!187 () tuple2!4)

(declare-fun lt!186 () LongMapFixedSize!6)

(declare-datatypes ((List!8 0))(
  ( (Nil!5) (Cons!4 (h!570 tuple2!4) (t!2015 List!8)) )
))
(declare-fun head!742 (List!8) tuple2!4)

(declare-datatypes ((ListLongMap!9 0))(
  ( (ListLongMap!10 (toList!20 List!8)) )
))
(declare-fun map!21 (LongMapFixedSize!6) ListLongMap!9)

(assert (=> b!1451 (= lt!187 (head!742 (toList!20 (map!21 lt!186))))))

(declare-fun lt!178 () array!9)

(assert (=> b!1451 (= lt!178 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!183 () (_ BitVec 32))

(assert (=> b!1451 (= lt!183 #b00000000000000000000000000000000)))

(declare-fun lt!191 () Unit!8)

(declare-fun lemmaKeyInListMapIsInArray!1 (array!9 array!7 (_ BitVec 32) (_ BitVec 32) V!213 V!213 (_ BitVec 64) Int) Unit!8)

(declare-fun dynLambda!0 (Int (_ BitVec 64)) V!213)

(assert (=> b!1451 (= lt!191 (lemmaKeyInListMapIsInArray!1 lt!178 (array!8 ((as const (Array (_ BitVec 32) ValueCell!3)) EmptyCell!3) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!183 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!2 lt!187) defaultEntry!179))))

(declare-fun c!30 () Bool)

(assert (=> b!1451 (= c!30 (and (not (= (_1!2 lt!187) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!2 lt!187) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!101 () Bool)

(assert (=> b!1451 e!101))

(declare-fun lt!188 () Unit!8)

(assert (=> b!1451 (= lt!188 lt!191)))

(declare-fun lt!189 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!9 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1451 (= lt!189 (arrayScanForKey!0 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!2 lt!187) #b00000000000000000000000000000000))))

(assert (=> b!1451 false))

(declare-fun d!17 () Bool)

(declare-fun e!102 () Bool)

(assert (=> d!17 e!102))

(declare-fun res!4202 () Bool)

(assert (=> d!17 (=> (not res!4202) (not e!102))))

(declare-fun lt!174 () LongMapFixedSize!6)

(assert (=> d!17 (= res!4202 (valid!8 lt!174))))

(assert (=> d!17 (= lt!174 lt!186)))

(declare-fun lt!172 () Unit!8)

(assert (=> d!17 (= lt!172 e!100)))

(declare-fun c!29 () Bool)

(assert (=> d!17 (= c!29 (not (= (map!21 lt!186) (ListLongMap!10 Nil!5))))))

(declare-fun lt!175 () Unit!8)

(declare-fun lt!176 () Unit!8)

(assert (=> d!17 (= lt!175 lt!176)))

(declare-fun lt!179 () array!9)

(declare-fun lt!180 () (_ BitVec 32))

(declare-datatypes ((List!9 0))(
  ( (Nil!6) (Cons!5 (h!571 (_ BitVec 64)) (t!2016 List!9)) )
))
(declare-fun lt!170 () List!9)

(declare-fun arrayNoDuplicates!0 (array!9 (_ BitVec 32) List!9) Bool)

(assert (=> d!17 (arrayNoDuplicates!0 lt!179 lt!180 lt!170)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!9 (_ BitVec 32) (_ BitVec 32) List!9) Unit!8)

(assert (=> d!17 (= lt!176 (lemmaArrayNoDuplicatesInAll0Array!0 lt!179 lt!180 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!170))))

(assert (=> d!17 (= lt!170 Nil!6)))

(assert (=> d!17 (= lt!180 #b00000000000000000000000000000000)))

(assert (=> d!17 (= lt!179 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!184 () Unit!8)

(declare-fun lt!173 () Unit!8)

(assert (=> d!17 (= lt!184 lt!173)))

(declare-fun lt!185 () (_ BitVec 32))

(declare-fun lt!181 () array!9)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9 (_ BitVec 32)) Bool)

(assert (=> d!17 (arrayForallSeekEntryOrOpenFound!0 lt!185 lt!181 #b00000000000000000000000000001111)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!9 (_ BitVec 32) (_ BitVec 32)) Unit!8)

(assert (=> d!17 (= lt!173 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!181 #b00000000000000000000000000001111 lt!185))))

(assert (=> d!17 (= lt!185 #b00000000000000000000000000000000)))

(assert (=> d!17 (= lt!181 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!177 () Unit!8)

(declare-fun lt!171 () Unit!8)

(assert (=> d!17 (= lt!177 lt!171)))

(declare-fun lt!182 () array!9)

(declare-fun lt!192 () (_ BitVec 32))

(declare-fun lt!190 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!9 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!17 (= (arrayCountValidKeys!0 lt!182 lt!192 lt!190) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!9 (_ BitVec 32) (_ BitVec 32)) Unit!8)

(assert (=> d!17 (= lt!171 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!182 lt!192 lt!190))))

(assert (=> d!17 (= lt!190 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!17 (= lt!192 #b00000000000000000000000000000000)))

(assert (=> d!17 (= lt!182 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(assert (=> d!17 (= lt!186 (LongMapFixedSize!7 defaultEntry!179 #b00000000000000000000000000001111 #b00000000000000000000000000000000 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (array!8 ((as const (Array (_ BitVec 32) ValueCell!3)) EmptyCell!3) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!17 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!17 (= (getNewLongMapFixedSize!2 #b00000000000000000000000000001111 defaultEntry!179) lt!174)))

(declare-fun b!1452 () Bool)

(declare-fun arrayContainsKey!0 (array!9 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1452 (= e!101 (arrayContainsKey!0 lt!178 (_1!2 lt!187) #b00000000000000000000000000000000))))

(declare-fun b!1453 () Bool)

(declare-fun res!4203 () Bool)

(assert (=> b!1453 (=> (not res!4203) (not e!102))))

(assert (=> b!1453 (= res!4203 (= (mask!4133 lt!174) #b00000000000000000000000000001111))))

(declare-fun b!1454 () Bool)

(assert (=> b!1454 (= e!102 (= (map!21 lt!174) (ListLongMap!10 Nil!5)))))

(declare-fun b!1455 () Bool)

(assert (=> b!1455 (= e!101 (ite (= (_1!2 lt!187) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!183 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!183 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!17 c!29) b!1451))

(assert (= (and d!17 (not c!29)) b!1450))

(assert (= (and b!1451 c!30) b!1452))

(assert (= (and b!1451 (not c!30)) b!1455))

(assert (= (and d!17 res!4202) b!1453))

(assert (= (and b!1453 res!4203) b!1454))

(declare-fun b_lambda!3 () Bool)

(assert (=> (not b_lambda!3) (not b!1451)))

(declare-fun t!2012 () Bool)

(declare-fun tb!5 () Bool)

(assert (=> (and start!12 (= defaultEntry!179 defaultEntry!179) t!2012) tb!5))

(declare-fun result!5 () Bool)

(declare-fun tp_is_empty!5 () Bool)

(assert (=> tb!5 (= result!5 tp_is_empty!5)))

(assert (=> b!1451 t!2012))

(declare-fun b_and!11 () Bool)

(assert (= b_and!3 (and (=> t!2012 result!5) b_and!11)))

(declare-fun b_lambda!10 () Bool)

(assert (=> (not b_lambda!10) (not d!17)))

(assert (=> d!17 t!2012))

(declare-fun b_and!17 () Bool)

(assert (= b_and!11 (and (=> t!2012 result!5) b_and!17)))

(declare-fun m!107 () Bool)

(assert (=> b!1451 m!107))

(assert (=> b!1451 m!107))

(declare-fun m!111 () Bool)

(assert (=> b!1451 m!111))

(declare-fun m!117 () Bool)

(assert (=> b!1451 m!117))

(declare-fun m!123 () Bool)

(assert (=> b!1451 m!123))

(declare-fun m!131 () Bool)

(assert (=> b!1451 m!131))

(assert (=> b!1451 m!107))

(declare-fun m!144 () Bool)

(assert (=> d!17 m!144))

(declare-fun m!153 () Bool)

(assert (=> d!17 m!153))

(declare-fun m!155 () Bool)

(assert (=> d!17 m!155))

(declare-fun m!159 () Bool)

(assert (=> d!17 m!159))

(declare-fun m!167 () Bool)

(assert (=> d!17 m!167))

(declare-fun m!173 () Bool)

(assert (=> d!17 m!173))

(assert (=> d!17 m!131))

(declare-fun m!183 () Bool)

(assert (=> d!17 m!183))

(declare-fun m!185 () Bool)

(assert (=> d!17 m!185))

(assert (=> d!17 m!107))

(declare-fun m!187 () Bool)

(assert (=> b!1452 m!187))

(declare-fun m!189 () Bool)

(assert (=> b!1454 m!189))

(assert (=> b!1400 d!17))

(declare-fun b_lambda!21 () Bool)

(assert (= b_lambda!10 (or (and start!12 b_free!3) b_lambda!21)))

(declare-fun b_lambda!23 () Bool)

(assert (= b_lambda!3 (or (and start!12 b_free!3) b_lambda!23)))

(check-sat tp_is_empty!5 (not b_next!3) (not b_lambda!21) (not b!1452) (not b!1451) (not d!7) (not b_lambda!23) (not b!1454) (not d!13) (not d!17) b_and!17)
(check-sat b_and!17 (not b_next!3))
(get-model)

(declare-fun d!27 () Bool)

(assert (=> d!27 (= (head!742 (toList!20 (map!21 lt!186))) (h!570 (toList!20 (map!21 lt!186))))))

(assert (=> b!1451 d!27))

(declare-fun d!29 () Bool)

(declare-fun getCurrentListMap!1 (array!9 array!7 (_ BitVec 32) (_ BitVec 32) V!213 V!213 (_ BitVec 32) Int) ListLongMap!9)

(assert (=> d!29 (= (map!21 lt!186) (getCurrentListMap!1 (_keys!2980 lt!186) (_values!1585 lt!186) (mask!4133 lt!186) (extraKeys!1501 lt!186) (zeroValue!1524 lt!186) (minValue!1524 lt!186) #b00000000000000000000000000000000 (defaultEntry!1581 lt!186)))))

(declare-fun bs!12 () Bool)

(assert (= bs!12 d!29))

(declare-fun m!199 () Bool)

(assert (=> bs!12 m!199))

(assert (=> b!1451 d!29))

(declare-fun d!33 () Bool)

(declare-fun e!117 () Bool)

(assert (=> d!33 e!117))

(declare-fun c!35 () Bool)

(assert (=> d!33 (= c!35 (and (not (= (_1!2 lt!187) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!2 lt!187) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!221 () Unit!8)

(declare-fun choose!129 (array!9 array!7 (_ BitVec 32) (_ BitVec 32) V!213 V!213 (_ BitVec 64) Int) Unit!8)

(assert (=> d!33 (= lt!221 (choose!129 lt!178 (array!8 ((as const (Array (_ BitVec 32) ValueCell!3)) EmptyCell!3) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!183 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!2 lt!187) defaultEntry!179))))

(assert (=> d!33 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!33 (= (lemmaKeyInListMapIsInArray!1 lt!178 (array!8 ((as const (Array (_ BitVec 32) ValueCell!3)) EmptyCell!3) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!183 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!2 lt!187) defaultEntry!179) lt!221)))

(declare-fun b!1487 () Bool)

(assert (=> b!1487 (= e!117 (arrayContainsKey!0 lt!178 (_1!2 lt!187) #b00000000000000000000000000000000))))

(declare-fun b!1488 () Bool)

(assert (=> b!1488 (= e!117 (ite (= (_1!2 lt!187) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!183 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!183 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!33 c!35) b!1487))

(assert (= (and d!33 (not c!35)) b!1488))

(assert (=> d!33 m!107))

(assert (=> d!33 m!107))

(declare-fun m!213 () Bool)

(assert (=> d!33 m!213))

(assert (=> d!33 m!159))

(assert (=> b!1487 m!187))

(assert (=> b!1451 d!33))

(declare-fun d!41 () Bool)

(declare-fun lt!230 () (_ BitVec 32))

(assert (=> d!41 (and (or (bvslt lt!230 #b00000000000000000000000000000000) (bvsge lt!230 (size!49 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (and (bvsge lt!230 #b00000000000000000000000000000000) (bvslt lt!230 (size!49 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))) (bvsge lt!230 #b00000000000000000000000000000000) (bvslt lt!230 (size!49 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (= (select (arr!4 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) lt!230) (_1!2 lt!187)))))

(declare-fun e!123 () (_ BitVec 32))

(assert (=> d!41 (= lt!230 e!123)))

(declare-fun c!38 () Bool)

(assert (=> d!41 (= c!38 (= (select (arr!4 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!2 lt!187)))))

(assert (=> d!41 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!49 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (bvslt (size!49 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!41 (= (arrayScanForKey!0 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!2 lt!187) #b00000000000000000000000000000000) lt!230)))

(declare-fun b!1502 () Bool)

(assert (=> b!1502 (= e!123 #b00000000000000000000000000000000)))

(declare-fun b!1503 () Bool)

(assert (=> b!1503 (= e!123 (arrayScanForKey!0 (array!10 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!2 lt!187) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!41 c!38) b!1502))

(assert (= (and d!41 (not c!38)) b!1503))

(declare-fun m!227 () Bool)

(assert (=> d!41 m!227))

(declare-fun m!229 () Bool)

(assert (=> d!41 m!229))

(declare-fun m!231 () Bool)

(assert (=> b!1503 m!231))

(assert (=> b!1451 d!41))

(declare-fun d!49 () Bool)

(assert (=> d!49 (= (size!54 (v!1068 (underlying!14 lt!5))) (bvadd (_size!34 (v!1068 (underlying!14 lt!5))) (bvsdiv (bvadd (extraKeys!1501 (v!1068 (underlying!14 lt!5))) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> d!7 d!49))

(declare-fun d!51 () Bool)

(declare-fun res!4240 () Bool)

(declare-fun e!136 () Bool)

(assert (=> d!51 (=> res!4240 e!136)))

(assert (=> d!51 (= res!4240 (= (select (arr!4 lt!178) #b00000000000000000000000000000000) (_1!2 lt!187)))))

(assert (=> d!51 (= (arrayContainsKey!0 lt!178 (_1!2 lt!187) #b00000000000000000000000000000000) e!136)))

(declare-fun b!1518 () Bool)

(declare-fun e!137 () Bool)

(assert (=> b!1518 (= e!136 e!137)))

(declare-fun res!4241 () Bool)

(assert (=> b!1518 (=> (not res!4241) (not e!137))))

(assert (=> b!1518 (= res!4241 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!49 lt!178)))))

(declare-fun b!1519 () Bool)

(assert (=> b!1519 (= e!137 (arrayContainsKey!0 lt!178 (_1!2 lt!187) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!51 (not res!4240)) b!1518))

(assert (= (and b!1518 res!4241) b!1519))

(declare-fun m!235 () Bool)

(assert (=> d!51 m!235))

(declare-fun m!237 () Bool)

(assert (=> b!1519 m!237))

(assert (=> b!1452 d!51))

(declare-fun d!55 () Bool)

(assert (=> d!55 (arrayNoDuplicates!0 lt!179 lt!180 lt!170)))

(declare-fun lt!233 () Unit!8)

(declare-fun choose!111 (array!9 (_ BitVec 32) (_ BitVec 32) List!9) Unit!8)

(assert (=> d!55 (= lt!233 (choose!111 lt!179 lt!180 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!170))))

(assert (=> d!55 (= (size!49 lt!179) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!55 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!179 lt!180 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!170) lt!233)))

(declare-fun bs!18 () Bool)

(assert (= bs!18 d!55))

(assert (=> bs!18 m!173))

(declare-fun m!243 () Bool)

(assert (=> bs!18 m!243))

(assert (=> d!17 d!55))

(assert (=> d!17 d!29))

(declare-fun b!1541 () Bool)

(declare-fun e!156 () Bool)

(declare-fun e!154 () Bool)

(assert (=> b!1541 (= e!156 e!154)))

(declare-fun c!46 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1541 (= c!46 (validKeyInArray!0 (select (arr!4 lt!181) lt!185)))))

(declare-fun b!1542 () Bool)

(declare-fun e!155 () Bool)

(declare-fun call!10 () Bool)

(assert (=> b!1542 (= e!155 call!10)))

(declare-fun b!1543 () Bool)

(assert (=> b!1543 (= e!154 call!10)))

(declare-fun d!59 () Bool)

(declare-fun res!4253 () Bool)

(assert (=> d!59 (=> res!4253 e!156)))

(assert (=> d!59 (= res!4253 (bvsge lt!185 (size!49 lt!181)))))

(assert (=> d!59 (= (arrayForallSeekEntryOrOpenFound!0 lt!185 lt!181 #b00000000000000000000000000001111) e!156)))

(declare-fun bm!7 () Bool)

(assert (=> bm!7 (= call!10 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!185 #b00000000000000000000000000000001) lt!181 #b00000000000000000000000000001111))))

(declare-fun b!1544 () Bool)

(assert (=> b!1544 (= e!154 e!155)))

(declare-fun lt!251 () (_ BitVec 64))

(assert (=> b!1544 (= lt!251 (select (arr!4 lt!181) lt!185))))

(declare-fun lt!249 () Unit!8)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!9 (_ BitVec 64) (_ BitVec 32)) Unit!8)

(assert (=> b!1544 (= lt!249 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!181 lt!251 lt!185))))

(assert (=> b!1544 (arrayContainsKey!0 lt!181 lt!251 #b00000000000000000000000000000000)))

(declare-fun lt!250 () Unit!8)

(assert (=> b!1544 (= lt!250 lt!249)))

(declare-fun res!4254 () Bool)

(declare-datatypes ((SeekEntryResult!2 0))(
  ( (MissingZero!2 (index!2127 (_ BitVec 32))) (Found!2 (index!2128 (_ BitVec 32))) (Intermediate!2 (undefined!814 Bool) (index!2129 (_ BitVec 32)) (x!1756 (_ BitVec 32))) (Undefined!2) (MissingVacant!2 (index!2130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!9 (_ BitVec 32)) SeekEntryResult!2)

(assert (=> b!1544 (= res!4254 (= (seekEntryOrOpen!0 (select (arr!4 lt!181) lt!185) lt!181 #b00000000000000000000000000001111) (Found!2 lt!185)))))

(assert (=> b!1544 (=> (not res!4254) (not e!155))))

(assert (= (and d!59 (not res!4253)) b!1541))

(assert (= (and b!1541 c!46) b!1544))

(assert (= (and b!1541 (not c!46)) b!1543))

(assert (= (and b!1544 res!4254) b!1542))

(assert (= (or b!1542 b!1543) bm!7))

(declare-fun m!251 () Bool)

(assert (=> b!1541 m!251))

(assert (=> b!1541 m!251))

(declare-fun m!253 () Bool)

(assert (=> b!1541 m!253))

(declare-fun m!255 () Bool)

(assert (=> bm!7 m!255))

(assert (=> b!1544 m!251))

(declare-fun m!257 () Bool)

(assert (=> b!1544 m!257))

(declare-fun m!259 () Bool)

(assert (=> b!1544 m!259))

(assert (=> b!1544 m!251))

(declare-fun m!263 () Bool)

(assert (=> b!1544 m!263))

(assert (=> d!17 d!59))

(declare-fun d!65 () Bool)

(declare-fun res!4267 () Bool)

(declare-fun e!168 () Bool)

(assert (=> d!65 (=> (not res!4267) (not e!168))))

(declare-fun simpleValid!2 (LongMapFixedSize!6) Bool)

(assert (=> d!65 (= res!4267 (simpleValid!2 lt!174))))

(assert (=> d!65 (= (valid!8 lt!174) e!168)))

(declare-fun b!1563 () Bool)

(declare-fun res!4268 () Bool)

(assert (=> b!1563 (=> (not res!4268) (not e!168))))

(assert (=> b!1563 (= res!4268 (= (arrayCountValidKeys!0 (_keys!2980 lt!174) #b00000000000000000000000000000000 (size!49 (_keys!2980 lt!174))) (_size!34 lt!174)))))

(declare-fun b!1564 () Bool)

(declare-fun res!4269 () Bool)

(assert (=> b!1564 (=> (not res!4269) (not e!168))))

(assert (=> b!1564 (= res!4269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2980 lt!174) (mask!4133 lt!174)))))

(declare-fun b!1565 () Bool)

(assert (=> b!1565 (= e!168 (arrayNoDuplicates!0 (_keys!2980 lt!174) #b00000000000000000000000000000000 Nil!6))))

(assert (= (and d!65 res!4267) b!1563))

(assert (= (and b!1563 res!4268) b!1564))

(assert (= (and b!1564 res!4269) b!1565))

(declare-fun m!279 () Bool)

(assert (=> d!65 m!279))

(declare-fun m!281 () Bool)

(assert (=> b!1563 m!281))

(declare-fun m!283 () Bool)

(assert (=> b!1564 m!283))

(declare-fun m!285 () Bool)

(assert (=> b!1565 m!285))

(assert (=> d!17 d!65))

(declare-fun d!73 () Bool)

(assert (=> d!73 (= (validMask!0 #b00000000000000000000000000001111) true)))

(assert (=> d!17 d!73))

(declare-fun d!75 () Bool)

(assert (=> d!75 (= (arrayCountValidKeys!0 lt!182 lt!192 lt!190) #b00000000000000000000000000000000)))

(declare-fun lt!269 () Unit!8)

(declare-fun choose!59 (array!9 (_ BitVec 32) (_ BitVec 32)) Unit!8)

(assert (=> d!75 (= lt!269 (choose!59 lt!182 lt!192 lt!190))))

(assert (=> d!75 (bvslt (size!49 lt!182) #b01111111111111111111111111111111)))

(assert (=> d!75 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!182 lt!192 lt!190) lt!269)))

(declare-fun bs!22 () Bool)

(assert (= bs!22 d!75))

(assert (=> bs!22 m!185))

(declare-fun m!287 () Bool)

(assert (=> bs!22 m!287))

(assert (=> d!17 d!75))

(declare-fun e!195 () Bool)

(declare-fun b!1598 () Bool)

(declare-fun contains!9 (List!9 (_ BitVec 64)) Bool)

(assert (=> b!1598 (= e!195 (contains!9 lt!170 (select (arr!4 lt!179) lt!180)))))

(declare-fun b!1599 () Bool)

(declare-fun e!192 () Bool)

(declare-fun call!20 () Bool)

(assert (=> b!1599 (= e!192 call!20)))

(declare-fun d!77 () Bool)

(declare-fun res!4286 () Bool)

(declare-fun e!193 () Bool)

(assert (=> d!77 (=> res!4286 e!193)))

(assert (=> d!77 (= res!4286 (bvsge lt!180 (size!49 lt!179)))))

(assert (=> d!77 (= (arrayNoDuplicates!0 lt!179 lt!180 lt!170) e!193)))

(declare-fun b!1600 () Bool)

(declare-fun e!194 () Bool)

(assert (=> b!1600 (= e!193 e!194)))

(declare-fun res!4284 () Bool)

(assert (=> b!1600 (=> (not res!4284) (not e!194))))

(assert (=> b!1600 (= res!4284 (not e!195))))

(declare-fun res!4285 () Bool)

(assert (=> b!1600 (=> (not res!4285) (not e!195))))

(assert (=> b!1600 (= res!4285 (validKeyInArray!0 (select (arr!4 lt!179) lt!180)))))

(declare-fun b!1601 () Bool)

(assert (=> b!1601 (= e!194 e!192)))

(declare-fun c!59 () Bool)

(assert (=> b!1601 (= c!59 (validKeyInArray!0 (select (arr!4 lt!179) lt!180)))))

(declare-fun b!1602 () Bool)

(assert (=> b!1602 (= e!192 call!20)))

(declare-fun bm!17 () Bool)

(assert (=> bm!17 (= call!20 (arrayNoDuplicates!0 lt!179 (bvadd lt!180 #b00000000000000000000000000000001) (ite c!59 (Cons!5 (select (arr!4 lt!179) lt!180) lt!170) lt!170)))))

(assert (= (and d!77 (not res!4286)) b!1600))

(assert (= (and b!1600 res!4285) b!1598))

(assert (= (and b!1600 res!4284) b!1601))

(assert (= (and b!1601 c!59) b!1599))

(assert (= (and b!1601 (not c!59)) b!1602))

(assert (= (or b!1599 b!1602) bm!17))

(declare-fun m!307 () Bool)

(assert (=> b!1598 m!307))

(assert (=> b!1598 m!307))

(declare-fun m!309 () Bool)

(assert (=> b!1598 m!309))

(assert (=> b!1600 m!307))

(assert (=> b!1600 m!307))

(declare-fun m!311 () Bool)

(assert (=> b!1600 m!311))

(assert (=> b!1601 m!307))

(assert (=> b!1601 m!307))

(assert (=> b!1601 m!311))

(assert (=> bm!17 m!307))

(declare-fun m!313 () Bool)

(assert (=> bm!17 m!313))

(assert (=> d!17 d!77))

(declare-fun d!87 () Bool)

(assert (=> d!87 (arrayForallSeekEntryOrOpenFound!0 lt!185 lt!181 #b00000000000000000000000000001111)))

(declare-fun lt!275 () Unit!8)

(declare-fun choose!34 (array!9 (_ BitVec 32) (_ BitVec 32)) Unit!8)

(assert (=> d!87 (= lt!275 (choose!34 lt!181 #b00000000000000000000000000001111 lt!185))))

(assert (=> d!87 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!87 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!181 #b00000000000000000000000000001111 lt!185) lt!275)))

(declare-fun bs!23 () Bool)

(assert (= bs!23 d!87))

(assert (=> bs!23 m!167))

(declare-fun m!315 () Bool)

(assert (=> bs!23 m!315))

(assert (=> bs!23 m!159))

(assert (=> d!17 d!87))

(declare-fun d!89 () Bool)

(declare-fun lt!283 () (_ BitVec 32))

(assert (=> d!89 (and (bvsge lt!283 #b00000000000000000000000000000000) (bvsle lt!283 (bvsub (size!49 lt!182) lt!192)))))

(declare-fun e!210 () (_ BitVec 32))

(assert (=> d!89 (= lt!283 e!210)))

(declare-fun c!70 () Bool)

(assert (=> d!89 (= c!70 (bvsge lt!192 lt!190))))

(assert (=> d!89 (and (bvsle lt!192 lt!190) (bvsge lt!192 #b00000000000000000000000000000000) (bvsle lt!190 (size!49 lt!182)))))

(assert (=> d!89 (= (arrayCountValidKeys!0 lt!182 lt!192 lt!190) lt!283)))

(declare-fun bm!23 () Bool)

(declare-fun call!26 () (_ BitVec 32))

(assert (=> bm!23 (= call!26 (arrayCountValidKeys!0 lt!182 (bvadd lt!192 #b00000000000000000000000000000001) lt!190))))

(declare-fun b!1629 () Bool)

(assert (=> b!1629 (= e!210 #b00000000000000000000000000000000)))

(declare-fun b!1630 () Bool)

(declare-fun e!211 () (_ BitVec 32))

(assert (=> b!1630 (= e!211 (bvadd #b00000000000000000000000000000001 call!26))))

(declare-fun b!1631 () Bool)

(assert (=> b!1631 (= e!211 call!26)))

(declare-fun b!1632 () Bool)

(assert (=> b!1632 (= e!210 e!211)))

(declare-fun c!71 () Bool)

(assert (=> b!1632 (= c!71 (validKeyInArray!0 (select (arr!4 lt!182) lt!192)))))

(assert (= (and d!89 c!70) b!1629))

(assert (= (and d!89 (not c!70)) b!1632))

(assert (= (and b!1632 c!71) b!1630))

(assert (= (and b!1632 (not c!71)) b!1631))

(assert (= (or b!1630 b!1631) bm!23))

(declare-fun m!335 () Bool)

(assert (=> bm!23 m!335))

(declare-fun m!337 () Bool)

(assert (=> b!1632 m!337))

(assert (=> b!1632 m!337))

(declare-fun m!339 () Bool)

(assert (=> b!1632 m!339))

(assert (=> d!17 d!89))

(declare-fun d!97 () Bool)

(declare-fun res!4293 () Bool)

(declare-fun e!212 () Bool)

(assert (=> d!97 (=> (not res!4293) (not e!212))))

(assert (=> d!97 (= res!4293 (simpleValid!2 (v!1068 (underlying!14 lt!5))))))

(assert (=> d!97 (= (valid!8 (v!1068 (underlying!14 lt!5))) e!212)))

(declare-fun b!1633 () Bool)

(declare-fun res!4294 () Bool)

(assert (=> b!1633 (=> (not res!4294) (not e!212))))

(assert (=> b!1633 (= res!4294 (= (arrayCountValidKeys!0 (_keys!2980 (v!1068 (underlying!14 lt!5))) #b00000000000000000000000000000000 (size!49 (_keys!2980 (v!1068 (underlying!14 lt!5))))) (_size!34 (v!1068 (underlying!14 lt!5)))))))

(declare-fun b!1634 () Bool)

(declare-fun res!4295 () Bool)

(assert (=> b!1634 (=> (not res!4295) (not e!212))))

(assert (=> b!1634 (= res!4295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2980 (v!1068 (underlying!14 lt!5))) (mask!4133 (v!1068 (underlying!14 lt!5)))))))

(declare-fun b!1635 () Bool)

(assert (=> b!1635 (= e!212 (arrayNoDuplicates!0 (_keys!2980 (v!1068 (underlying!14 lt!5))) #b00000000000000000000000000000000 Nil!6))))

(assert (= (and d!97 res!4293) b!1633))

(assert (= (and b!1633 res!4294) b!1634))

(assert (= (and b!1634 res!4295) b!1635))

(declare-fun m!343 () Bool)

(assert (=> d!97 m!343))

(declare-fun m!345 () Bool)

(assert (=> b!1633 m!345))

(declare-fun m!347 () Bool)

(assert (=> b!1634 m!347))

(declare-fun m!349 () Bool)

(assert (=> b!1635 m!349))

(assert (=> d!13 d!97))

(declare-fun d!101 () Bool)

(assert (=> d!101 (= (map!21 lt!174) (getCurrentListMap!1 (_keys!2980 lt!174) (_values!1585 lt!174) (mask!4133 lt!174) (extraKeys!1501 lt!174) (zeroValue!1524 lt!174) (minValue!1524 lt!174) #b00000000000000000000000000000000 (defaultEntry!1581 lt!174)))))

(declare-fun bs!25 () Bool)

(assert (= bs!25 d!101))

(declare-fun m!351 () Bool)

(assert (=> bs!25 m!351))

(assert (=> b!1454 d!101))

(check-sat (not b!1519) (not b_next!3) (not d!101) (not b!1487) (not b!1564) (not bm!7) (not b_lambda!23) (not b!1598) (not bm!23) (not d!75) (not d!33) tp_is_empty!5 (not b!1601) (not b!1634) (not d!55) (not b_lambda!21) (not d!29) (not b!1600) (not d!65) (not d!97) (not b!1544) (not b!1633) (not b!1632) (not b!1541) (not bm!17) (not b!1503) (not b!1565) b_and!17 (not d!87) (not b!1635) (not b!1563))
(check-sat b_and!17 (not b_next!3))
