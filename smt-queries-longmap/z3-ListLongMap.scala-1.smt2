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

(declare-fun valid!6 (LongMapFixedSize!4) Bool)

(assert (=> d!8 (= (valid!3 lt!2) (valid!6 (v!1066 (underlying!13 lt!2))))))

(declare-fun bs!8 () Bool)

(assert (= bs!8 d!8))

(declare-fun m!94 () Bool)

(assert (=> bs!8 m!94))

(assert (=> b!1394 d!8))

(declare-fun b!1445 () Bool)

(declare-fun e!98 () Bool)

(declare-datatypes ((tuple2!0 0))(
  ( (tuple2!1 (_1!0 (_ BitVec 64)) (_2!0 V!211)) )
))
(declare-fun lt!190 () tuple2!0)

(declare-fun lt!181 () (_ BitVec 32))

(assert (=> b!1445 (= e!98 (ite (= (_1!0 lt!190) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!181 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!181 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1447 () Bool)

(declare-fun lt!156 () array!5)

(declare-fun arrayContainsKey!0 (array!5 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1447 (= e!98 (arrayContainsKey!0 lt!156 (_1!0 lt!190) #b00000000000000000000000000000000))))

(declare-fun d!15 () Bool)

(declare-fun e!97 () Bool)

(assert (=> d!15 e!97))

(declare-fun res!4202 () Bool)

(assert (=> d!15 (=> (not res!4202) (not e!97))))

(declare-fun lt!162 () LongMapFixedSize!4)

(assert (=> d!15 (= res!4202 (valid!6 lt!162))))

(declare-fun lt!180 () LongMapFixedSize!4)

(assert (=> d!15 (= lt!162 lt!180)))

(declare-datatypes ((Unit!3 0))(
  ( (Unit!4) )
))
(declare-fun lt!188 () Unit!3)

(declare-fun e!100 () Unit!3)

(assert (=> d!15 (= lt!188 e!100)))

(declare-fun c!30 () Bool)

(declare-datatypes ((List!7 0))(
  ( (Nil!4) (Cons!3 (h!569 tuple2!0) (t!2014 List!7)) )
))
(declare-datatypes ((ListLongMap!7 0))(
  ( (ListLongMap!8 (toList!19 List!7)) )
))
(declare-fun map!21 (LongMapFixedSize!4) ListLongMap!7)

(assert (=> d!15 (= c!30 (not (= (map!21 lt!180) (ListLongMap!8 Nil!4))))))

(declare-fun lt!168 () Unit!3)

(declare-fun lt!152 () Unit!3)

(assert (=> d!15 (= lt!168 lt!152)))

(declare-fun lt!172 () array!5)

(declare-fun lt!176 () (_ BitVec 32))

(declare-datatypes ((List!10 0))(
  ( (Nil!7) (Cons!6 (h!572 (_ BitVec 64)) (t!2017 List!10)) )
))
(declare-fun lt!160 () List!10)

(declare-fun arrayNoDuplicates!0 (array!5 (_ BitVec 32) List!10) Bool)

(assert (=> d!15 (arrayNoDuplicates!0 lt!172 lt!176 lt!160)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!5 (_ BitVec 32) (_ BitVec 32) List!10) Unit!3)

(assert (=> d!15 (= lt!152 (lemmaArrayNoDuplicatesInAll0Array!0 lt!172 lt!176 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!160))))

(assert (=> d!15 (= lt!160 Nil!7)))

(assert (=> d!15 (= lt!176 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!172 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!178 () Unit!3)

(declare-fun lt!169 () Unit!3)

(assert (=> d!15 (= lt!178 lt!169)))

(declare-fun lt!170 () (_ BitVec 32))

(declare-fun lt!154 () array!5)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5 (_ BitVec 32)) Bool)

(assert (=> d!15 (arrayForallSeekEntryOrOpenFound!0 lt!170 lt!154 #b00000000000000000000000000001111)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!15 (= lt!169 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!154 #b00000000000000000000000000001111 lt!170))))

(assert (=> d!15 (= lt!170 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!154 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!150 () Unit!3)

(declare-fun lt!148 () Unit!3)

(assert (=> d!15 (= lt!150 lt!148)))

(declare-fun lt!183 () array!5)

(declare-fun lt!166 () (_ BitVec 32))

(declare-fun lt!174 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!5 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!15 (= (arrayCountValidKeys!0 lt!183 lt!166 lt!174) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!15 (= lt!148 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!183 lt!166 lt!174))))

(assert (=> d!15 (= lt!174 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!15 (= lt!166 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!183 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun dynLambda!0 (Int (_ BitVec 64)) V!211)

(assert (=> d!15 (= lt!180 (LongMapFixedSize!5 defaultEntry!179 #b00000000000000000000000000001111 #b00000000000000000000000000000000 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!15 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!15 (= (getNewLongMapFixedSize!1 #b00000000000000000000000000001111 defaultEntry!179) lt!162)))

(declare-fun b!1449 () Bool)

(declare-fun Unit!7 () Unit!3)

(assert (=> b!1449 (= e!100 Unit!7)))

(declare-fun head!740 (List!7) tuple2!0)

(assert (=> b!1449 (= lt!190 (head!740 (toList!19 (map!21 lt!180))))))

(assert (=> b!1449 (= lt!156 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(assert (=> b!1449 (= lt!181 #b00000000000000000000000000000000)))

(declare-fun lt!164 () Unit!3)

(declare-fun lemmaKeyInListMapIsInArray!1 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 64) Int) Unit!3)

(assert (=> b!1449 (= lt!164 (lemmaKeyInListMapIsInArray!1 lt!156 (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!181 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!0 lt!190) defaultEntry!179))))

(declare-fun c!27 () Bool)

(assert (=> b!1449 (= c!27 (and (not (= (_1!0 lt!190) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!0 lt!190) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1449 e!98))

(declare-fun lt!158 () Unit!3)

(assert (=> b!1449 (= lt!158 lt!164)))

(declare-fun lt!186 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!5 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449 (= lt!186 (arrayScanForKey!0 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!0 lt!190) #b00000000000000000000000000000000))))

(assert (=> b!1449 false))

(declare-fun b!1451 () Bool)

(assert (=> b!1451 (= e!97 (= (map!21 lt!162) (ListLongMap!8 Nil!4)))))

(declare-fun b!1453 () Bool)

(declare-fun res!4203 () Bool)

(assert (=> b!1453 (=> (not res!4203) (not e!97))))

(assert (=> b!1453 (= res!4203 (= (mask!4132 lt!162) #b00000000000000000000000000001111))))

(declare-fun b!1455 () Bool)

(declare-fun Unit!12 () Unit!3)

(assert (=> b!1455 (= e!100 Unit!12)))

(assert (= (and d!15 c!30) b!1449))

(assert (= (and d!15 (not c!30)) b!1455))

(assert (= (and b!1449 c!27) b!1447))

(assert (= (and b!1449 (not c!27)) b!1445))

(assert (= (and d!15 res!4202) b!1453))

(assert (= (and b!1453 res!4203) b!1451))

(declare-fun b_lambda!2 () Bool)

(assert (=> (not b_lambda!2) (not d!15)))

(declare-fun t!2009 () Bool)

(declare-fun tb!1 () Bool)

(assert (=> (and start!10 (= defaultEntry!179 defaultEntry!179) t!2009) tb!1))

(declare-fun result!1 () Bool)

(declare-fun tp_is_empty!5 () Bool)

(assert (=> tb!1 (= result!1 tp_is_empty!5)))

(assert (=> d!15 t!2009))

(declare-fun b_and!9 () Bool)

(assert (= b_and!1 (and (=> t!2009 result!1) b_and!9)))

(declare-fun b_lambda!9 () Bool)

(assert (=> (not b_lambda!9) (not b!1449)))

(assert (=> b!1449 t!2009))

(declare-fun b_and!14 () Bool)

(assert (= b_and!9 (and (=> t!2009 result!1) b_and!14)))

(declare-fun m!103 () Bool)

(assert (=> b!1447 m!103))

(declare-fun m!109 () Bool)

(assert (=> d!15 m!109))

(declare-fun m!111 () Bool)

(assert (=> d!15 m!111))

(declare-fun m!117 () Bool)

(assert (=> d!15 m!117))

(declare-fun m!123 () Bool)

(assert (=> d!15 m!123))

(declare-fun m!127 () Bool)

(assert (=> d!15 m!127))

(declare-fun m!133 () Bool)

(assert (=> d!15 m!133))

(declare-fun m!137 () Bool)

(assert (=> d!15 m!137))

(declare-fun m!143 () Bool)

(assert (=> d!15 m!143))

(declare-fun m!147 () Bool)

(assert (=> d!15 m!147))

(declare-fun m!153 () Bool)

(assert (=> d!15 m!153))

(declare-fun m!163 () Bool)

(assert (=> b!1449 m!163))

(assert (=> b!1449 m!117))

(declare-fun m!171 () Bool)

(assert (=> b!1449 m!171))

(assert (=> b!1449 m!117))

(assert (=> b!1449 m!117))

(declare-fun m!179 () Bool)

(assert (=> b!1449 m!179))

(assert (=> b!1449 m!147))

(declare-fun m!185 () Bool)

(assert (=> b!1451 m!185))

(assert (=> b!1394 d!15))

(declare-fun d!21 () Bool)

(declare-fun size!56 (LongMapFixedSize!4) (_ BitVec 32))

(assert (=> d!21 (= (size!47 lt!2) (size!56 (v!1066 (underlying!13 lt!2))))))

(declare-fun bs!11 () Bool)

(assert (= bs!11 d!21))

(declare-fun m!193 () Bool)

(assert (=> bs!11 m!193))

(assert (=> b!1395 d!21))

(declare-fun b_lambda!19 () Bool)

(assert (= b_lambda!9 (or (and start!10 b_free!1) b_lambda!19)))

(declare-fun b_lambda!23 () Bool)

(assert (= b_lambda!2 (or (and start!10 b_free!1) b_lambda!23)))

(check-sat tp_is_empty!5 b_and!14 (not b!1447) (not b_lambda!19) (not d!15) (not b!1451) (not b!1449) (not b_lambda!23) (not d!8) (not b_next!1) (not d!21))
(check-sat b_and!14 (not b_next!1))
(get-model)

(declare-fun d!31 () Bool)

(assert (=> d!31 (= (size!56 (v!1066 (underlying!13 lt!2))) (bvadd (_size!33 (v!1066 (underlying!13 lt!2))) (bvsdiv (bvadd (extraKeys!1500 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> d!21 d!31))

(declare-fun d!35 () Bool)

(declare-fun getCurrentListMap!2 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 32) Int) ListLongMap!7)

(assert (=> d!35 (= (map!21 lt!180) (getCurrentListMap!2 (_keys!2979 lt!180) (_values!1584 lt!180) (mask!4132 lt!180) (extraKeys!1500 lt!180) (zeroValue!1523 lt!180) (minValue!1523 lt!180) #b00000000000000000000000000000000 (defaultEntry!1580 lt!180)))))

(declare-fun bs!13 () Bool)

(assert (= bs!13 d!35))

(declare-fun m!217 () Bool)

(assert (=> bs!13 m!217))

(assert (=> d!15 d!35))

(declare-fun d!39 () Bool)

(assert (=> d!39 (arrayForallSeekEntryOrOpenFound!0 lt!170 lt!154 #b00000000000000000000000000001111)))

(declare-fun lt!223 () Unit!3)

(declare-fun choose!34 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!39 (= lt!223 (choose!34 lt!154 #b00000000000000000000000000001111 lt!170))))

(assert (=> d!39 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!39 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!154 #b00000000000000000000000000001111 lt!170) lt!223)))

(declare-fun bs!16 () Bool)

(assert (= bs!16 d!39))

(assert (=> bs!16 m!143))

(declare-fun m!223 () Bool)

(assert (=> bs!16 m!223))

(assert (=> bs!16 m!133))

(assert (=> d!15 d!39))

(declare-fun d!45 () Bool)

(assert (=> d!45 (arrayNoDuplicates!0 lt!172 lt!176 lt!160)))

(declare-fun lt!227 () Unit!3)

(declare-fun choose!111 (array!5 (_ BitVec 32) (_ BitVec 32) List!10) Unit!3)

(assert (=> d!45 (= lt!227 (choose!111 lt!172 lt!176 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!160))))

(assert (=> d!45 (= (size!46 lt!172) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!45 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!172 lt!176 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!160) lt!227)))

(declare-fun bs!19 () Bool)

(assert (= bs!19 d!45))

(assert (=> bs!19 m!127))

(declare-fun m!229 () Bool)

(assert (=> bs!19 m!229))

(assert (=> d!15 d!45))

(declare-fun d!53 () Bool)

(declare-fun res!4249 () Bool)

(declare-fun e!138 () Bool)

(assert (=> d!53 (=> (not res!4249) (not e!138))))

(declare-fun simpleValid!2 (LongMapFixedSize!4) Bool)

(assert (=> d!53 (= res!4249 (simpleValid!2 lt!162))))

(assert (=> d!53 (= (valid!6 lt!162) e!138)))

(declare-fun b!1521 () Bool)

(declare-fun res!4250 () Bool)

(assert (=> b!1521 (=> (not res!4250) (not e!138))))

(assert (=> b!1521 (= res!4250 (= (arrayCountValidKeys!0 (_keys!2979 lt!162) #b00000000000000000000000000000000 (size!46 (_keys!2979 lt!162))) (_size!33 lt!162)))))

(declare-fun b!1522 () Bool)

(declare-fun res!4251 () Bool)

(assert (=> b!1522 (=> (not res!4251) (not e!138))))

(assert (=> b!1522 (= res!4251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2979 lt!162) (mask!4132 lt!162)))))

(declare-fun b!1523 () Bool)

(assert (=> b!1523 (= e!138 (arrayNoDuplicates!0 (_keys!2979 lt!162) #b00000000000000000000000000000000 Nil!7))))

(assert (= (and d!53 res!4249) b!1521))

(assert (= (and b!1521 res!4250) b!1522))

(assert (= (and b!1522 res!4251) b!1523))

(declare-fun m!231 () Bool)

(assert (=> d!53 m!231))

(declare-fun m!233 () Bool)

(assert (=> b!1521 m!233))

(declare-fun m!237 () Bool)

(assert (=> b!1522 m!237))

(declare-fun m!241 () Bool)

(assert (=> b!1523 m!241))

(assert (=> d!15 d!53))

(declare-fun d!55 () Bool)

(assert (=> d!55 (= (validMask!0 #b00000000000000000000000000001111) true)))

(assert (=> d!15 d!55))

(declare-fun b!1553 () Bool)

(declare-fun e!157 () (_ BitVec 32))

(declare-fun call!13 () (_ BitVec 32))

(assert (=> b!1553 (= e!157 call!13)))

(declare-fun bm!10 () Bool)

(assert (=> bm!10 (= call!13 (arrayCountValidKeys!0 lt!183 (bvadd lt!166 #b00000000000000000000000000000001) lt!174))))

(declare-fun b!1554 () Bool)

(declare-fun e!158 () (_ BitVec 32))

(assert (=> b!1554 (= e!158 e!157)))

(declare-fun c!48 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1554 (= c!48 (validKeyInArray!0 (select (arr!2 lt!183) lt!166)))))

(declare-fun b!1555 () Bool)

(assert (=> b!1555 (= e!158 #b00000000000000000000000000000000)))

(declare-fun b!1556 () Bool)

(assert (=> b!1556 (= e!157 (bvadd #b00000000000000000000000000000001 call!13))))

(declare-fun d!57 () Bool)

(declare-fun lt!244 () (_ BitVec 32))

(assert (=> d!57 (and (bvsge lt!244 #b00000000000000000000000000000000) (bvsle lt!244 (bvsub (size!46 lt!183) lt!166)))))

(assert (=> d!57 (= lt!244 e!158)))

(declare-fun c!47 () Bool)

(assert (=> d!57 (= c!47 (bvsge lt!166 lt!174))))

(assert (=> d!57 (and (bvsle lt!166 lt!174) (bvsge lt!166 #b00000000000000000000000000000000) (bvsle lt!174 (size!46 lt!183)))))

(assert (=> d!57 (= (arrayCountValidKeys!0 lt!183 lt!166 lt!174) lt!244)))

(assert (= (and d!57 c!47) b!1555))

(assert (= (and d!57 (not c!47)) b!1554))

(assert (= (and b!1554 c!48) b!1556))

(assert (= (and b!1554 (not c!48)) b!1553))

(assert (= (or b!1556 b!1553) bm!10))

(declare-fun m!269 () Bool)

(assert (=> bm!10 m!269))

(declare-fun m!271 () Bool)

(assert (=> b!1554 m!271))

(assert (=> b!1554 m!271))

(declare-fun m!273 () Bool)

(assert (=> b!1554 m!273))

(assert (=> d!15 d!57))

(declare-fun b!1591 () Bool)

(declare-fun e!182 () Bool)

(declare-fun call!22 () Bool)

(assert (=> b!1591 (= e!182 call!22)))

(declare-fun e!180 () Bool)

(declare-fun b!1592 () Bool)

(declare-fun contains!9 (List!10 (_ BitVec 64)) Bool)

(assert (=> b!1592 (= e!180 (contains!9 lt!160 (select (arr!2 lt!172) lt!176)))))

(declare-fun d!67 () Bool)

(declare-fun res!4277 () Bool)

(declare-fun e!183 () Bool)

(assert (=> d!67 (=> res!4277 e!183)))

(assert (=> d!67 (= res!4277 (bvsge lt!176 (size!46 lt!172)))))

(assert (=> d!67 (= (arrayNoDuplicates!0 lt!172 lt!176 lt!160) e!183)))

(declare-fun b!1593 () Bool)

(declare-fun e!181 () Bool)

(assert (=> b!1593 (= e!183 e!181)))

(declare-fun res!4275 () Bool)

(assert (=> b!1593 (=> (not res!4275) (not e!181))))

(assert (=> b!1593 (= res!4275 (not e!180))))

(declare-fun res!4276 () Bool)

(assert (=> b!1593 (=> (not res!4276) (not e!180))))

(assert (=> b!1593 (= res!4276 (validKeyInArray!0 (select (arr!2 lt!172) lt!176)))))

(declare-fun bm!19 () Bool)

(declare-fun c!60 () Bool)

(assert (=> bm!19 (= call!22 (arrayNoDuplicates!0 lt!172 (bvadd lt!176 #b00000000000000000000000000000001) (ite c!60 (Cons!6 (select (arr!2 lt!172) lt!176) lt!160) lt!160)))))

(declare-fun b!1594 () Bool)

(assert (=> b!1594 (= e!182 call!22)))

(declare-fun b!1595 () Bool)

(assert (=> b!1595 (= e!181 e!182)))

(assert (=> b!1595 (= c!60 (validKeyInArray!0 (select (arr!2 lt!172) lt!176)))))

(assert (= (and d!67 (not res!4277)) b!1593))

(assert (= (and b!1593 res!4276) b!1592))

(assert (= (and b!1593 res!4275) b!1595))

(assert (= (and b!1595 c!60) b!1591))

(assert (= (and b!1595 (not c!60)) b!1594))

(assert (= (or b!1591 b!1594) bm!19))

(declare-fun m!297 () Bool)

(assert (=> b!1592 m!297))

(assert (=> b!1592 m!297))

(declare-fun m!299 () Bool)

(assert (=> b!1592 m!299))

(assert (=> b!1593 m!297))

(assert (=> b!1593 m!297))

(declare-fun m!301 () Bool)

(assert (=> b!1593 m!301))

(assert (=> bm!19 m!297))

(declare-fun m!303 () Bool)

(assert (=> bm!19 m!303))

(assert (=> b!1595 m!297))

(assert (=> b!1595 m!297))

(assert (=> b!1595 m!301))

(assert (=> d!15 d!67))

(declare-fun d!75 () Bool)

(assert (=> d!75 (= (arrayCountValidKeys!0 lt!183 lt!166 lt!174) #b00000000000000000000000000000000)))

(declare-fun lt!257 () Unit!3)

(declare-fun choose!59 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!3)

(assert (=> d!75 (= lt!257 (choose!59 lt!183 lt!166 lt!174))))

(assert (=> d!75 (bvslt (size!46 lt!183) #b01111111111111111111111111111111)))

(assert (=> d!75 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!183 lt!166 lt!174) lt!257)))

(declare-fun bs!21 () Bool)

(assert (= bs!21 d!75))

(assert (=> bs!21 m!153))

(declare-fun m!311 () Bool)

(assert (=> bs!21 m!311))

(assert (=> d!15 d!75))

(declare-fun b!1626 () Bool)

(declare-fun e!204 () Bool)

(declare-fun call!29 () Bool)

(assert (=> b!1626 (= e!204 call!29)))

(declare-fun b!1627 () Bool)

(declare-fun e!205 () Bool)

(assert (=> b!1627 (= e!205 call!29)))

(declare-fun bm!26 () Bool)

(assert (=> bm!26 (= call!29 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!170 #b00000000000000000000000000000001) lt!154 #b00000000000000000000000000001111))))

(declare-fun b!1628 () Bool)

(assert (=> b!1628 (= e!205 e!204)))

(declare-fun lt!277 () (_ BitVec 64))

(assert (=> b!1628 (= lt!277 (select (arr!2 lt!154) lt!170))))

(declare-fun lt!278 () Unit!3)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5 (_ BitVec 64) (_ BitVec 32)) Unit!3)

(assert (=> b!1628 (= lt!278 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!154 lt!277 lt!170))))

(assert (=> b!1628 (arrayContainsKey!0 lt!154 lt!277 #b00000000000000000000000000000000)))

(declare-fun lt!276 () Unit!3)

(assert (=> b!1628 (= lt!276 lt!278)))

(declare-fun res!4289 () Bool)

(declare-datatypes ((SeekEntryResult!3 0))(
  ( (MissingZero!3 (index!2131 (_ BitVec 32))) (Found!3 (index!2132 (_ BitVec 32))) (Intermediate!3 (undefined!815 Bool) (index!2133 (_ BitVec 32)) (x!1758 (_ BitVec 32))) (Undefined!3) (MissingVacant!3 (index!2134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5 (_ BitVec 32)) SeekEntryResult!3)

(assert (=> b!1628 (= res!4289 (= (seekEntryOrOpen!0 (select (arr!2 lt!154) lt!170) lt!154 #b00000000000000000000000000001111) (Found!3 lt!170)))))

(assert (=> b!1628 (=> (not res!4289) (not e!204))))

(declare-fun b!1629 () Bool)

(declare-fun e!206 () Bool)

(assert (=> b!1629 (= e!206 e!205)))

(declare-fun c!71 () Bool)

(assert (=> b!1629 (= c!71 (validKeyInArray!0 (select (arr!2 lt!154) lt!170)))))

(declare-fun d!79 () Bool)

(declare-fun res!4288 () Bool)

(assert (=> d!79 (=> res!4288 e!206)))

(assert (=> d!79 (= res!4288 (bvsge lt!170 (size!46 lt!154)))))

(assert (=> d!79 (= (arrayForallSeekEntryOrOpenFound!0 lt!170 lt!154 #b00000000000000000000000000001111) e!206)))

(assert (= (and d!79 (not res!4288)) b!1629))

(assert (= (and b!1629 c!71) b!1628))

(assert (= (and b!1629 (not c!71)) b!1627))

(assert (= (and b!1628 res!4289) b!1626))

(assert (= (or b!1626 b!1627) bm!26))

(declare-fun m!333 () Bool)

(assert (=> bm!26 m!333))

(declare-fun m!335 () Bool)

(assert (=> b!1628 m!335))

(declare-fun m!337 () Bool)

(assert (=> b!1628 m!337))

(declare-fun m!339 () Bool)

(assert (=> b!1628 m!339))

(assert (=> b!1628 m!335))

(declare-fun m!341 () Bool)

(assert (=> b!1628 m!341))

(assert (=> b!1629 m!335))

(assert (=> b!1629 m!335))

(declare-fun m!343 () Bool)

(assert (=> b!1629 m!343))

(assert (=> d!15 d!79))

(declare-fun d!95 () Bool)

(assert (=> d!95 (= (map!21 lt!162) (getCurrentListMap!2 (_keys!2979 lt!162) (_values!1584 lt!162) (mask!4132 lt!162) (extraKeys!1500 lt!162) (zeroValue!1523 lt!162) (minValue!1523 lt!162) #b00000000000000000000000000000000 (defaultEntry!1580 lt!162)))))

(declare-fun bs!25 () Bool)

(assert (= bs!25 d!95))

(declare-fun m!345 () Bool)

(assert (=> bs!25 m!345))

(assert (=> b!1451 d!95))

(declare-fun d!97 () Bool)

(declare-fun res!4294 () Bool)

(declare-fun e!211 () Bool)

(assert (=> d!97 (=> res!4294 e!211)))

(assert (=> d!97 (= res!4294 (= (select (arr!2 lt!156) #b00000000000000000000000000000000) (_1!0 lt!190)))))

(assert (=> d!97 (= (arrayContainsKey!0 lt!156 (_1!0 lt!190) #b00000000000000000000000000000000) e!211)))

(declare-fun b!1634 () Bool)

(declare-fun e!212 () Bool)

(assert (=> b!1634 (= e!211 e!212)))

(declare-fun res!4295 () Bool)

(assert (=> b!1634 (=> (not res!4295) (not e!212))))

(assert (=> b!1634 (= res!4295 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46 lt!156)))))

(declare-fun b!1635 () Bool)

(assert (=> b!1635 (= e!212 (arrayContainsKey!0 lt!156 (_1!0 lt!190) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!97 (not res!4294)) b!1634))

(assert (= (and b!1634 res!4295) b!1635))

(declare-fun m!349 () Bool)

(assert (=> d!97 m!349))

(declare-fun m!351 () Bool)

(assert (=> b!1635 m!351))

(assert (=> b!1447 d!97))

(declare-fun d!101 () Bool)

(declare-fun res!4296 () Bool)

(declare-fun e!213 () Bool)

(assert (=> d!101 (=> (not res!4296) (not e!213))))

(assert (=> d!101 (= res!4296 (simpleValid!2 (v!1066 (underlying!13 lt!2))))))

(assert (=> d!101 (= (valid!6 (v!1066 (underlying!13 lt!2))) e!213)))

(declare-fun b!1636 () Bool)

(declare-fun res!4297 () Bool)

(assert (=> b!1636 (=> (not res!4297) (not e!213))))

(assert (=> b!1636 (= res!4297 (= (arrayCountValidKeys!0 (_keys!2979 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000000 (size!46 (_keys!2979 (v!1066 (underlying!13 lt!2))))) (_size!33 (v!1066 (underlying!13 lt!2)))))))

(declare-fun b!1637 () Bool)

(declare-fun res!4298 () Bool)

(assert (=> b!1637 (=> (not res!4298) (not e!213))))

(assert (=> b!1637 (= res!4298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2979 (v!1066 (underlying!13 lt!2))) (mask!4132 (v!1066 (underlying!13 lt!2)))))))

(declare-fun b!1638 () Bool)

(assert (=> b!1638 (= e!213 (arrayNoDuplicates!0 (_keys!2979 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000000 Nil!7))))

(assert (= (and d!101 res!4296) b!1636))

(assert (= (and b!1636 res!4297) b!1637))

(assert (= (and b!1637 res!4298) b!1638))

(declare-fun m!353 () Bool)

(assert (=> d!101 m!353))

(declare-fun m!355 () Bool)

(assert (=> b!1636 m!355))

(declare-fun m!357 () Bool)

(assert (=> b!1637 m!357))

(declare-fun m!359 () Bool)

(assert (=> b!1638 m!359))

(assert (=> d!8 d!101))

(declare-fun d!105 () Bool)

(assert (=> d!105 (= (head!740 (toList!19 (map!21 lt!180))) (h!569 (toList!19 (map!21 lt!180))))))

(assert (=> b!1449 d!105))

(assert (=> b!1449 d!35))

(declare-fun d!107 () Bool)

(declare-fun e!225 () Bool)

(assert (=> d!107 e!225))

(declare-fun c!77 () Bool)

(assert (=> d!107 (= c!77 (and (not (= (_1!0 lt!190) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!0 lt!190) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!287 () Unit!3)

(declare-fun choose!130 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 64) Int) Unit!3)

(assert (=> d!107 (= lt!287 (choose!130 lt!156 (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!181 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!0 lt!190) defaultEntry!179))))

(assert (=> d!107 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!107 (= (lemmaKeyInListMapIsInArray!1 lt!156 (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!181 (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!0 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!0 lt!190) defaultEntry!179) lt!287)))

(declare-fun b!1655 () Bool)

(assert (=> b!1655 (= e!225 (arrayContainsKey!0 lt!156 (_1!0 lt!190) #b00000000000000000000000000000000))))

(declare-fun b!1656 () Bool)

(assert (=> b!1656 (= e!225 (ite (= (_1!0 lt!190) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!181 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!181 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!107 c!77) b!1655))

(assert (= (and d!107 (not c!77)) b!1656))

(assert (=> d!107 m!117))

(assert (=> d!107 m!117))

(declare-fun m!371 () Bool)

(assert (=> d!107 m!371))

(assert (=> d!107 m!133))

(assert (=> b!1655 m!103))

(assert (=> b!1449 d!107))

(declare-fun d!115 () Bool)

(declare-fun lt!292 () (_ BitVec 32))

(assert (=> d!115 (and (or (bvslt lt!292 #b00000000000000000000000000000000) (bvsge lt!292 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (and (bvsge lt!292 #b00000000000000000000000000000000) (bvslt lt!292 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))) (bvsge lt!292 #b00000000000000000000000000000000) (bvslt lt!292 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (= (select (arr!2 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) lt!292) (_1!0 lt!190)))))

(declare-fun e!230 () (_ BitVec 32))

(assert (=> d!115 (= lt!292 e!230)))

(declare-fun c!82 () Bool)

(assert (=> d!115 (= c!82 (= (select (arr!2 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) #b00000000000000000000000000000000) (_1!0 lt!190)))))

(assert (=> d!115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))) (bvslt (size!46 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))) #b01111111111111111111111111111111))))

(assert (=> d!115 (= (arrayScanForKey!0 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!0 lt!190) #b00000000000000000000000000000000) lt!292)))

(declare-fun b!1665 () Bool)

(assert (=> b!1665 (= e!230 #b00000000000000000000000000000000)))

(declare-fun b!1666 () Bool)

(assert (=> b!1666 (= e!230 (arrayScanForKey!0 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!0 lt!190) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115 c!82) b!1665))

(assert (= (and d!115 (not c!82)) b!1666))

(declare-fun m!373 () Bool)

(assert (=> d!115 m!373))

(declare-fun m!375 () Bool)

(assert (=> d!115 m!375))

(declare-fun m!377 () Bool)

(assert (=> b!1666 m!377))

(assert (=> b!1449 d!115))

(check-sat b_and!14 (not b!1523) (not b!1628) (not d!45) (not d!107) (not b_lambda!23) (not b!1655) (not b_next!1) (not d!95) (not bm!19) (not b!1635) tp_is_empty!5 (not b!1666) (not b!1637) (not b!1593) (not b!1592) (not d!75) (not d!53) (not b!1629) (not b_lambda!19) (not b!1636) (not d!39) (not d!35) (not d!101) (not b!1521) (not bm!26) (not b!1554) (not b!1638) (not b!1522) (not bm!10) (not b!1595))
(check-sat b_and!14 (not b_next!1))
