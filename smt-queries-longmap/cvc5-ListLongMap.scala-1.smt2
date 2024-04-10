; Options: -q --produce-models --incremental --print-success --lang smt2.6
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

(push 1)

(assert (not b!1394))

(assert (not b!1395))

(assert b_and!1)

(assert (not b_next!1))

(check-sat)

(pop 1)

(push 1)

(assert b_and!1)

(assert (not b_next!1))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6 () Bool)

(declare-fun valid!6 (LongMapFixedSize!4) Bool)

(assert (=> d!6 (= (valid!3 lt!2) (valid!6 (v!1066 (underlying!13 lt!2))))))

(declare-fun bs!7 () Bool)

(assert (= bs!7 d!6))

(declare-fun m!94 () Bool)

(assert (=> bs!7 m!94))

(assert (=> b!1394 d!6))

(declare-fun b!1444 () Bool)

(declare-datatypes ((Unit!2 0))(
  ( (Unit!4) )
))
(declare-fun e!98 () Unit!2)

(declare-fun Unit!6 () Unit!2)

(assert (=> b!1444 (= e!98 Unit!6)))

(declare-fun b!1445 () Bool)

(declare-fun Unit!10 () Unit!2)

(assert (=> b!1445 (= e!98 Unit!10)))

(declare-datatypes ((tuple2!2 0))(
  ( (tuple2!3 (_1!1 (_ BitVec 64)) (_2!1 V!211)) )
))
(declare-fun lt!158 () tuple2!2)

(declare-fun lt!152 () LongMapFixedSize!4)

(declare-datatypes ((List!7 0))(
  ( (Nil!4) (Cons!3 (h!569 tuple2!2) (t!2014 List!7)) )
))
(declare-fun head!741 (List!7) tuple2!2)

(declare-datatypes ((ListLongMap!7 0))(
  ( (ListLongMap!8 (toList!19 List!7)) )
))
(declare-fun map!22 (LongMapFixedSize!4) ListLongMap!7)

(assert (=> b!1445 (= lt!158 (head!741 (toList!19 (map!22 lt!152))))))

(declare-fun lt!161 () array!5)

(assert (=> b!1445 (= lt!161 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!163 () (_ BitVec 32))

(assert (=> b!1445 (= lt!163 #b00000000000000000000000000000000)))

(declare-fun lt!159 () Unit!2)

(declare-fun lemmaKeyInListMapIsInArray!3 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 64) Int) Unit!2)

(declare-fun dynLambda!1 (Int (_ BitVec 64)) V!211)

(assert (=> b!1445 (= lt!159 (lemmaKeyInListMapIsInArray!3 lt!161 (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!163 (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!1 lt!158) defaultEntry!179))))

(declare-fun c!28 () Bool)

(assert (=> b!1445 (= c!28 (and (not (= (_1!1 lt!158) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!1 lt!158) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!99 () Bool)

(assert (=> b!1445 e!99))

(declare-fun lt!151 () Unit!2)

(assert (=> b!1445 (= lt!151 lt!159)))

(declare-fun lt!167 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!5 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1445 (= lt!167 (arrayScanForKey!0 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!1 lt!158) #b00000000000000000000000000000000))))

(assert (=> b!1445 false))

(declare-fun b!1446 () Bool)

(declare-fun res!4201 () Bool)

(declare-fun e!97 () Bool)

(assert (=> b!1446 (=> (not res!4201) (not e!97))))

(declare-fun lt!148 () LongMapFixedSize!4)

(assert (=> b!1446 (= res!4201 (= (mask!4132 lt!148) #b00000000000000000000000000001111))))

(declare-fun b!1447 () Bool)

(assert (=> b!1447 (= e!97 (= (map!22 lt!148) (ListLongMap!8 Nil!4)))))

(declare-fun d!11 () Bool)

(assert (=> d!11 e!97))

(declare-fun res!4200 () Bool)

(assert (=> d!11 (=> (not res!4200) (not e!97))))

(assert (=> d!11 (= res!4200 (valid!6 lt!148))))

(assert (=> d!11 (= lt!148 lt!152)))

(declare-fun lt!166 () Unit!2)

(assert (=> d!11 (= lt!166 e!98)))

(declare-fun c!27 () Bool)

(assert (=> d!11 (= c!27 (not (= (map!22 lt!152) (ListLongMap!8 Nil!4))))))

(declare-fun lt!168 () Unit!2)

(declare-fun lt!154 () Unit!2)

(assert (=> d!11 (= lt!168 lt!154)))

(declare-fun lt!150 () array!5)

(declare-fun lt!149 () (_ BitVec 32))

(declare-datatypes ((List!10 0))(
  ( (Nil!7) (Cons!6 (h!572 (_ BitVec 64)) (t!2017 List!10)) )
))
(declare-fun lt!160 () List!10)

(declare-fun arrayNoDuplicates!0 (array!5 (_ BitVec 32) List!10) Bool)

(assert (=> d!11 (arrayNoDuplicates!0 lt!150 lt!149 lt!160)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!5 (_ BitVec 32) (_ BitVec 32) List!10) Unit!2)

(assert (=> d!11 (= lt!154 (lemmaArrayNoDuplicatesInAll0Array!0 lt!150 lt!149 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!160))))

(assert (=> d!11 (= lt!160 Nil!7)))

(assert (=> d!11 (= lt!149 #b00000000000000000000000000000000)))

(assert (=> d!11 (= lt!150 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!155 () Unit!2)

(declare-fun lt!165 () Unit!2)

(assert (=> d!11 (= lt!155 lt!165)))

(declare-fun lt!164 () (_ BitVec 32))

(declare-fun lt!169 () array!5)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5 (_ BitVec 32)) Bool)

(assert (=> d!11 (arrayForallSeekEntryOrOpenFound!0 lt!164 lt!169 #b00000000000000000000000000001111)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!2)

(assert (=> d!11 (= lt!165 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!169 #b00000000000000000000000000001111 lt!164))))

(assert (=> d!11 (= lt!164 #b00000000000000000000000000000000)))

(assert (=> d!11 (= lt!169 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!156 () Unit!2)

(declare-fun lt!157 () Unit!2)

(assert (=> d!11 (= lt!156 lt!157)))

(declare-fun lt!162 () array!5)

(declare-fun lt!147 () (_ BitVec 32))

(declare-fun lt!153 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!5 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!11 (= (arrayCountValidKeys!0 lt!162 lt!147 lt!153) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!2)

(assert (=> d!11 (= lt!157 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!162 lt!147 lt!153))))

(assert (=> d!11 (= lt!153 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!11 (= lt!147 #b00000000000000000000000000000000)))

(assert (=> d!11 (= lt!162 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(assert (=> d!11 (= lt!152 (LongMapFixedSize!5 defaultEntry!179 #b00000000000000000000000000001111 #b00000000000000000000000000000000 (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!1 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!6 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (array!4 ((as const (Array (_ BitVec 32) ValueCell!2)) EmptyCell!2) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!11 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!11 (= (getNewLongMapFixedSize!1 #b00000000000000000000000000001111 defaultEntry!179) lt!148)))

(declare-fun b!1448 () Bool)

(declare-fun arrayContainsKey!0 (array!5 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1448 (= e!99 (arrayContainsKey!0 lt!161 (_1!1 lt!158) #b00000000000000000000000000000000))))

(declare-fun b!1449 () Bool)

(assert (=> b!1449 (= e!99 (ite (= (_1!1 lt!158) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!163 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!163 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!11 c!27) b!1445))

(assert (= (and d!11 (not c!27)) b!1444))

(assert (= (and b!1445 c!28) b!1448))

(assert (= (and b!1445 (not c!28)) b!1449))

(assert (= (and d!11 res!4200) b!1446))

(assert (= (and b!1446 res!4201) b!1447))

(declare-fun b_lambda!1 () Bool)

(assert (=> (not b_lambda!1) (not b!1445)))

(declare-fun t!2009 () Bool)

(declare-fun tb!2 () Bool)

(assert (=> (and start!10 (= defaultEntry!179 defaultEntry!179) t!2009) tb!2))

(declare-fun result!3 () Bool)

(declare-fun tp_is_empty!3 () Bool)

(assert (=> tb!2 (= result!3 tp_is_empty!3)))

(assert (=> b!1445 t!2009))

(declare-fun b_and!10 () Bool)

(assert (= b_and!1 (and (=> t!2009 result!3) b_and!10)))

(declare-fun b_lambda!9 () Bool)

(assert (=> (not b_lambda!9) (not d!11)))

(assert (=> d!11 t!2009))

(declare-fun b_and!15 () Bool)

(assert (= b_and!10 (and (=> t!2009 result!3) b_and!15)))

(declare-fun m!101 () Bool)

(assert (=> b!1445 m!101))

(declare-fun m!103 () Bool)

(assert (=> b!1445 m!103))

(assert (=> b!1445 m!103))

(assert (=> b!1445 m!103))

(declare-fun m!121 () Bool)

(assert (=> b!1445 m!121))

(declare-fun m!125 () Bool)

(assert (=> b!1445 m!125))

(declare-fun m!129 () Bool)

(assert (=> b!1445 m!129))

(declare-fun m!135 () Bool)

(assert (=> b!1447 m!135))

(declare-fun m!139 () Bool)

(assert (=> d!11 m!139))

(declare-fun m!141 () Bool)

(assert (=> d!11 m!141))

(declare-fun m!147 () Bool)

(assert (=> d!11 m!147))

(declare-fun m!151 () Bool)

(assert (=> d!11 m!151))

(assert (=> d!11 m!103))

(declare-fun m!163 () Bool)

(assert (=> d!11 m!163))

(assert (=> d!11 m!129))

(declare-fun m!169 () Bool)

(assert (=> d!11 m!169))

(declare-fun m!175 () Bool)

(assert (=> d!11 m!175))

(declare-fun m!179 () Bool)

(assert (=> d!11 m!179))

(declare-fun m!181 () Bool)

(assert (=> b!1448 m!181))

(assert (=> b!1394 d!11))

(declare-fun d!21 () Bool)

(declare-fun size!55 (LongMapFixedSize!4) (_ BitVec 32))

(assert (=> d!21 (= (size!47 lt!2) (size!55 (v!1066 (underlying!13 lt!2))))))

(declare-fun bs!10 () Bool)

(assert (= bs!10 d!21))

(declare-fun m!193 () Bool)

(assert (=> bs!10 m!193))

(assert (=> b!1395 d!21))

(declare-fun b_lambda!15 () Bool)

(assert (= b_lambda!9 (or (and start!10 b_free!1) b_lambda!15)))

(declare-fun b_lambda!19 () Bool)

(assert (= b_lambda!1 (or (and start!10 b_free!1) b_lambda!19)))

(push 1)

(assert (not b_lambda!19))

(assert tp_is_empty!3)

(assert (not b!1447))

(assert (not d!6))

(assert (not b!1448))

(assert (not b_next!1))

(assert b_and!15)

(assert (not d!21))

(assert (not b!1445))

(assert (not d!11))

(assert (not b_lambda!15))

(check-sat)

(pop 1)

(push 1)

(assert b_and!15)

(assert (not b_next!1))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!23 () Bool)

(declare-fun res!4210 () Bool)

(declare-fun e!110 () Bool)

(assert (=> d!23 (=> res!4210 e!110)))

(assert (=> d!23 (= res!4210 (= (select (arr!2 lt!161) #b00000000000000000000000000000000) (_1!1 lt!158)))))

(assert (=> d!23 (= (arrayContainsKey!0 lt!161 (_1!1 lt!158) #b00000000000000000000000000000000) e!110)))

(declare-fun b!1472 () Bool)

(declare-fun e!111 () Bool)

(assert (=> b!1472 (= e!110 e!111)))

(declare-fun res!4211 () Bool)

(assert (=> b!1472 (=> (not res!4211) (not e!111))))

(assert (=> b!1472 (= res!4211 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46 lt!161)))))

(declare-fun b!1473 () Bool)

(assert (=> b!1473 (= e!111 (arrayContainsKey!0 lt!161 (_1!1 lt!158) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!23 (not res!4210)) b!1472))

(assert (= (and b!1472 res!4211) b!1473))

(declare-fun m!195 () Bool)

(assert (=> d!23 m!195))

(declare-fun m!197 () Bool)

(assert (=> b!1473 m!197))

(assert (=> b!1448 d!23))

(declare-fun d!31 () Bool)

(declare-fun res!4218 () Bool)

(declare-fun e!116 () Bool)

(assert (=> d!31 (=> (not res!4218) (not e!116))))

(declare-fun simpleValid!3 (LongMapFixedSize!4) Bool)

(assert (=> d!31 (= res!4218 (simpleValid!3 (v!1066 (underlying!13 lt!2))))))

(assert (=> d!31 (= (valid!6 (v!1066 (underlying!13 lt!2))) e!116)))

(declare-fun b!1484 () Bool)

(declare-fun res!4219 () Bool)

(assert (=> b!1484 (=> (not res!4219) (not e!116))))

(assert (=> b!1484 (= res!4219 (= (arrayCountValidKeys!0 (_keys!2979 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000000 (size!46 (_keys!2979 (v!1066 (underlying!13 lt!2))))) (_size!33 (v!1066 (underlying!13 lt!2)))))))

(declare-fun b!1485 () Bool)

(declare-fun res!4220 () Bool)

(assert (=> b!1485 (=> (not res!4220) (not e!116))))

(assert (=> b!1485 (= res!4220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2979 (v!1066 (underlying!13 lt!2))) (mask!4132 (v!1066 (underlying!13 lt!2)))))))

(declare-fun b!1486 () Bool)

(assert (=> b!1486 (= e!116 (arrayNoDuplicates!0 (_keys!2979 (v!1066 (underlying!13 lt!2))) #b00000000000000000000000000000000 Nil!7))))

(assert (= (and d!31 res!4218) b!1484))

(assert (= (and b!1484 res!4219) b!1485))

(assert (= (and b!1485 res!4220) b!1486))

(declare-fun m!205 () Bool)

(assert (=> d!31 m!205))

(declare-fun m!207 () Bool)

(assert (=> b!1484 m!207))

(declare-fun m!209 () Bool)

(assert (=> b!1485 m!209))

(declare-fun m!211 () Bool)

(assert (=> b!1486 m!211))

(assert (=> d!6 d!31))

(declare-fun d!39 () Bool)

(assert (=> d!39 (arrayNoDuplicates!0 lt!150 lt!149 lt!160)))

(declare-fun lt!224 () Unit!2)

(declare-fun choose!111 (array!5 (_ BitVec 32) (_ BitVec 32) List!10) Unit!2)

(assert (=> d!39 (= lt!224 (choose!111 lt!150 lt!149 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!160))))

(assert (=> d!39 (= (size!46 lt!150) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!39 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!150 lt!149 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!160) lt!224)))

(declare-fun bs!15 () Bool)

(assert (= bs!15 d!39))

(assert (=> bs!15 m!151))

(declare-fun m!223 () Bool)

(assert (=> bs!15 m!223))

(assert (=> d!11 d!39))

(declare-fun d!45 () Bool)

(declare-fun getCurrentListMap!3 (array!5 array!3 (_ BitVec 32) (_ BitVec 32) V!211 V!211 (_ BitVec 32) Int) ListLongMap!7)

(assert (=> d!45 (= (map!22 lt!152) (getCurrentListMap!3 (_keys!2979 lt!152) (_values!1584 lt!152) (mask!4132 lt!152) (extraKeys!1500 lt!152) (zeroValue!1523 lt!152) (minValue!1523 lt!152) #b00000000000000000000000000000000 (defaultEntry!1580 lt!152)))))

(declare-fun bs!17 () Bool)

(assert (= bs!17 d!45))

(declare-fun m!233 () Bool)

(assert (=> bs!17 m!233))

(assert (=> d!11 d!45))

(declare-fun d!53 () Bool)

(assert (=> d!53 (= (validMask!0 #b00000000000000000000000000001111) true)))

(assert (=> d!11 d!53))

(declare-fun d!57 () Bool)

(assert (=> d!57 (arrayForallSeekEntryOrOpenFound!0 lt!164 lt!169 #b00000000000000000000000000001111)))

(declare-fun lt!236 () Unit!2)

(declare-fun choose!34 (array!5 (_ BitVec 32) (_ BitVec 32)) Unit!2)

(assert (=> d!57 (= lt!236 (choose!34 lt!169 #b00000000000000000000000000001111 lt!164))))

(assert (=> d!57 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!57 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!169 #b00000000000000000000000000001111 lt!164) lt!236)))

(declare-fun bs!19 () Bool)

(assert (= bs!19 d!57))

(assert (=> bs!19 m!141))

(declare-fun m!249 () Bool)

(assert (=> bs!19 m!249))

(assert (=> bs!19 m!179))

(assert (=> d!11 d!57))

(declare-fun b!1566 () Bool)

(declare-fun e!169 () Bool)

(declare-fun call!14 () Bool)

(assert (=> b!1566 (= e!169 call!14)))

(declare-fun d!63 () Bool)

(declare-fun res!4271 () Bool)

(declare-fun e!171 () Bool)

(assert (=> d!63 (=> res!4271 e!171)))

(assert (=> d!63 (= res!4271 (bvsge lt!164 (size!46 lt!169)))))

(assert (=> d!63 (= (arrayForallSeekEntryOrOpenFound!0 lt!164 lt!169 #b00000000000000000000000000001111) e!171)))

(declare-fun b!1567 () Bool)

(declare-fun e!170 () Bool)

(assert (=> b!1567 (= e!171 e!170)))

(declare-fun c!50 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1567 (= c!50 (validKeyInArray!0 (select (arr!2 lt!169) lt!164)))))

(declare-fun b!1568 () Bool)

(assert (=> b!1568 (= e!170 call!14)))

(declare-fun b!1569 () Bool)

(assert (=> b!1569 (= e!170 e!169)))

(declare-fun lt!266 () (_ BitVec 64))

(assert (=> b!1569 (= lt!266 (select (arr!2 lt!169) lt!164))))

(declare-fun lt!267 () Unit!2)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!5 (_ BitVec 64) (_ BitVec 32)) Unit!2)

(assert (=> b!1569 (= lt!267 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!169 lt!266 lt!164))))

(assert (=> b!1569 (arrayContainsKey!0 lt!169 lt!266 #b00000000000000000000000000000000)))

(declare-fun lt!268 () Unit!2)

(assert (=> b!1569 (= lt!268 lt!267)))

(declare-fun res!4270 () Bool)

(declare-datatypes ((SeekEntryResult!4 0))(
  ( (MissingZero!4 (index!2135 (_ BitVec 32))) (Found!4 (index!2136 (_ BitVec 32))) (Intermediate!4 (undefined!816 Bool) (index!2137 (_ BitVec 32)) (x!1759 (_ BitVec 32))) (Undefined!4) (MissingVacant!4 (index!2138 (_ BitVec 32))) )
))
