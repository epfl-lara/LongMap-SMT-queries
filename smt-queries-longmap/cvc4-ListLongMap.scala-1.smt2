; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14 () Bool)

(assert start!14)

(declare-fun b_free!5 () Bool)

(declare-fun b_next!5 () Bool)

(assert (=> start!14 (= b_free!5 (not b_next!5))))

(declare-fun tp!8 () Bool)

(declare-fun b_and!5 () Bool)

(assert (=> start!14 (= tp!8 b_and!5)))

(declare-fun res!4186 () Bool)

(declare-fun e!78 () Bool)

(assert (=> start!14 (=> (not res!4186) (not e!78))))

(assert (=> start!14 (= res!4186 true)))

(assert (=> start!14 e!78))

(assert (=> start!14 tp!8))

(declare-fun b!1406 () Bool)

(declare-fun e!77 () Bool)

(assert (=> b!1406 (= e!78 e!77)))

(declare-fun res!4187 () Bool)

(assert (=> b!1406 (=> res!4187 e!77)))

(declare-datatypes ((V!215 0))(
  ( (V!216 (val!2 Int)) )
))
(declare-datatypes ((ValueCell!4 0))(
  ( (ValueCellFull!4 (v!1069 V!215)) (EmptyCell!4) )
))
(declare-datatypes ((array!11 0))(
  ( (array!12 (arr!5 (Array (_ BitVec 32) ValueCell!4)) (size!51 (_ BitVec 32))) )
))
(declare-datatypes ((array!13 0))(
  ( (array!14 (arr!6 (Array (_ BitVec 32) (_ BitVec 64))) (size!52 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!8 0))(
  ( (LongMapFixedSize!9 (defaultEntry!1582 Int) (mask!4134 (_ BitVec 32)) (extraKeys!1502 (_ BitVec 32)) (zeroValue!1525 V!215) (minValue!1525 V!215) (_size!35 (_ BitVec 32)) (_keys!2981 array!13) (_values!1586 array!11) (_vacant!35 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!8 0))(
  ( (Cell!9 (v!1070 LongMapFixedSize!8)) )
))
(declare-datatypes ((LongMap!8 0))(
  ( (LongMap!9 (underlying!15 Cell!8)) )
))
(declare-fun lt!8 () LongMap!8)

(declare-fun valid!5 (LongMap!8) Bool)

(assert (=> b!1406 (= res!4187 (not (valid!5 lt!8)))))

(declare-fun defaultEntry!179 () Int)

(declare-fun getNewLongMapFixedSize!3 ((_ BitVec 32) Int) LongMapFixedSize!8)

(assert (=> b!1406 (= lt!8 (LongMap!9 (Cell!9 (getNewLongMapFixedSize!3 #b00000000000000000000000000001111 defaultEntry!179))))))

(declare-fun b!1407 () Bool)

(declare-fun size!53 (LongMap!8) (_ BitVec 32))

(assert (=> b!1407 (= e!77 (not (= (size!53 lt!8) #b00000000000000000000000000000000)))))

(assert (= (and start!14 res!4186) b!1406))

(assert (= (and b!1406 (not res!4187)) b!1407))

(declare-fun m!87 () Bool)

(assert (=> b!1406 m!87))

(declare-fun m!89 () Bool)

(assert (=> b!1406 m!89))

(declare-fun m!91 () Bool)

(assert (=> b!1407 m!91))

(push 1)

(assert (not b!1406))

(assert (not b!1407))

(assert b_and!5)

(assert (not b_next!5))

(check-sat)

(pop 1)

(push 1)

(assert b_and!5)

(assert (not b_next!5))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!9 () Bool)

(declare-fun valid!7 (LongMapFixedSize!8) Bool)

(assert (=> d!9 (= (valid!5 lt!8) (valid!7 (v!1070 (underlying!15 lt!8))))))

(declare-fun bs!8 () Bool)

(assert (= bs!8 d!9))

(declare-fun m!97 () Bool)

(assert (=> bs!8 m!97))

(assert (=> b!1406 d!9))

(declare-fun b!1456 () Bool)

(declare-datatypes ((Unit!1 0))(
  ( (Unit!3) )
))
(declare-fun e!104 () Unit!1)

(declare-fun Unit!5 () Unit!1)

(assert (=> b!1456 (= e!104 Unit!5)))

(declare-fun b!1457 () Bool)

(declare-fun Unit!7 () Unit!1)

(assert (=> b!1457 (= e!104 Unit!7)))

(declare-datatypes ((tuple2!0 0))(
  ( (tuple2!1 (_1!0 (_ BitVec 64)) (_2!0 V!215)) )
))
(declare-fun lt!198 () tuple2!0)

(declare-fun lt!209 () LongMapFixedSize!8)

(declare-datatypes ((List!6 0))(
  ( (Nil!3) (Cons!2 (h!568 tuple2!0) (t!2013 List!6)) )
))
(declare-fun head!740 (List!6) tuple2!0)

(declare-datatypes ((ListLongMap!5 0))(
  ( (ListLongMap!6 (toList!18 List!6)) )
))
(declare-fun map!20 (LongMapFixedSize!8) ListLongMap!5)

(assert (=> b!1457 (= lt!198 (head!740 (toList!18 (map!20 lt!209))))))

(declare-fun lt!212 () array!13)

(assert (=> b!1457 (= lt!212 (array!14 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!205 () (_ BitVec 32))

(assert (=> b!1457 (= lt!205 #b00000000000000000000000000000000)))

(declare-fun lt!206 () Unit!1)

(declare-fun lemmaKeyInListMapIsInArray!2 (array!13 array!11 (_ BitVec 32) (_ BitVec 32) V!215 V!215 (_ BitVec 64) Int) Unit!1)

(declare-fun dynLambda!2 (Int (_ BitVec 64)) V!215)

(assert (=> b!1457 (= lt!206 (lemmaKeyInListMapIsInArray!2 lt!212 (array!12 ((as const (Array (_ BitVec 32) ValueCell!4)) EmptyCell!4) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!205 (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!0 lt!198) defaultEntry!179))))

(declare-fun c!31 () Bool)

(assert (=> b!1457 (= c!31 (and (not (= (_1!0 lt!198) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!0 lt!198) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!103 () Bool)

(assert (=> b!1457 e!103))

(declare-fun lt!201 () Unit!1)

(assert (=> b!1457 (= lt!201 lt!206)))

(declare-fun lt!204 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!13 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457 (= lt!204 (arrayScanForKey!0 (array!14 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (_1!0 lt!198) #b00000000000000000000000000000000))))

(assert (=> b!1457 false))

(declare-fun b!1458 () Bool)

(declare-fun res!4205 () Bool)

(declare-fun e!105 () Bool)

(assert (=> b!1458 (=> (not res!4205) (not e!105))))

(declare-fun lt!193 () LongMapFixedSize!8)

(assert (=> b!1458 (= res!4205 (= (mask!4134 lt!193) #b00000000000000000000000000001111))))

(declare-fun d!15 () Bool)

(assert (=> d!15 e!105))

(declare-fun res!4204 () Bool)

(assert (=> d!15 (=> (not res!4204) (not e!105))))

(assert (=> d!15 (= res!4204 (valid!7 lt!193))))

(assert (=> d!15 (= lt!193 lt!209)))

(declare-fun lt!208 () Unit!1)

(assert (=> d!15 (= lt!208 e!104)))

(declare-fun c!32 () Bool)

(assert (=> d!15 (= c!32 (not (= (map!20 lt!209) (ListLongMap!6 Nil!3))))))

(declare-fun lt!207 () Unit!1)

(declare-fun lt!195 () Unit!1)

(assert (=> d!15 (= lt!207 lt!195)))

(declare-fun lt!196 () array!13)

(declare-fun lt!214 () (_ BitVec 32))

(declare-datatypes ((List!11 0))(
  ( (Nil!8) (Cons!7 (h!573 (_ BitVec 64)) (t!2018 List!11)) )
))
(declare-fun lt!213 () List!11)

(declare-fun arrayNoDuplicates!0 (array!13 (_ BitVec 32) List!11) Bool)

(assert (=> d!15 (arrayNoDuplicates!0 lt!196 lt!214 lt!213)))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!13 (_ BitVec 32) (_ BitVec 32) List!11) Unit!1)

(assert (=> d!15 (= lt!195 (lemmaArrayNoDuplicatesInAll0Array!0 lt!196 lt!214 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!213))))

(assert (=> d!15 (= lt!213 Nil!8)))

(assert (=> d!15 (= lt!214 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!196 (array!14 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!197 () Unit!1)

(declare-fun lt!202 () Unit!1)

(assert (=> d!15 (= lt!197 lt!202)))

(declare-fun lt!194 () (_ BitVec 32))

(declare-fun lt!210 () array!13)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13 (_ BitVec 32)) Bool)

(assert (=> d!15 (arrayForallSeekEntryOrOpenFound!0 lt!194 lt!210 #b00000000000000000000000000001111)))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!13 (_ BitVec 32) (_ BitVec 32)) Unit!1)

(assert (=> d!15 (= lt!202 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!210 #b00000000000000000000000000001111 lt!194))))

(assert (=> d!15 (= lt!194 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!210 (array!14 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(declare-fun lt!203 () Unit!1)

(declare-fun lt!200 () Unit!1)

(assert (=> d!15 (= lt!203 lt!200)))

(declare-fun lt!211 () array!13)

(declare-fun lt!199 () (_ BitVec 32))

(declare-fun lt!215 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!13 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!15 (= (arrayCountValidKeys!0 lt!211 lt!199 lt!215) #b00000000000000000000000000000000)))

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!13 (_ BitVec 32) (_ BitVec 32)) Unit!1)

(assert (=> d!15 (= lt!200 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!211 lt!199 lt!215))))

(assert (=> d!15 (= lt!215 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!15 (= lt!199 #b00000000000000000000000000000000)))

(assert (=> d!15 (= lt!211 (array!14 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)))))

(assert (=> d!15 (= lt!209 (LongMapFixedSize!9 defaultEntry!179 #b00000000000000000000000000001111 #b00000000000000000000000000000000 (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 (array!14 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) (array!12 ((as const (Array (_ BitVec 32) ValueCell!4)) EmptyCell!4) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000000000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!15 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!15 (= (getNewLongMapFixedSize!3 #b00000000000000000000000000001111 defaultEntry!179) lt!193)))

(declare-fun b!1459 () Bool)

(declare-fun arrayContainsKey!0 (array!13 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1459 (= e!103 (arrayContainsKey!0 lt!212 (_1!0 lt!198) #b00000000000000000000000000000000))))

(declare-fun b!1460 () Bool)

(assert (=> b!1460 (= e!105 (= (map!20 lt!193) (ListLongMap!6 Nil!3)))))

(declare-fun b!1461 () Bool)

(assert (=> b!1461 (= e!103 (ite (= (_1!0 lt!198) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!205 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!205 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!15 c!32) b!1457))

(assert (= (and d!15 (not c!32)) b!1456))

(assert (= (and b!1457 c!31) b!1459))

(assert (= (and b!1457 (not c!31)) b!1461))

(assert (= (and d!15 res!4204) b!1458))

(assert (= (and b!1458 res!4205) b!1460))

(declare-fun b_lambda!5 () Bool)

(assert (=> (not b_lambda!5) (not b!1457)))

(declare-fun t!2010 () Bool)

(declare-fun tb!3 () Bool)

(assert (=> (and start!14 (= defaultEntry!179 defaultEntry!179) t!2010) tb!3))

(declare-fun result!1 () Bool)

(declare-fun tp_is_empty!2 () Bool)

(assert (=> tb!3 (= result!1 tp_is_empty!2)))

(assert (=> b!1457 t!2010))

(declare-fun b_and!9 () Bool)

(assert (= b_and!5 (and (=> t!2010 result!1) b_and!9)))

(declare-fun b_lambda!11 () Bool)

(assert (=> (not b_lambda!11) (not d!15)))

(assert (=> d!15 t!2010))

(declare-fun b_and!14 () Bool)

(assert (= b_and!9 (and (=> t!2010 result!1) b_and!14)))

(declare-fun m!105 () Bool)

(assert (=> b!1457 m!105))

(assert (=> b!1457 m!105))

(declare-fun m!109 () Bool)

(assert (=> b!1457 m!109))

(declare-fun m!113 () Bool)

(assert (=> b!1457 m!113))

(declare-fun m!115 () Bool)

(assert (=> b!1457 m!115))

(declare-fun m!119 () Bool)

(assert (=> b!1457 m!119))

(assert (=> b!1457 m!105))

(declare-fun m!127 () Bool)

(assert (=> d!15 m!127))

(declare-fun m!133 () Bool)

(assert (=> d!15 m!133))

(declare-fun m!137 () Bool)

(assert (=> d!15 m!137))

(assert (=> d!15 m!105))

(declare-fun m!145 () Bool)

(assert (=> d!15 m!145))

(declare-fun m!149 () Bool)

(assert (=> d!15 m!149))

(declare-fun m!157 () Bool)

(assert (=> d!15 m!157))

(assert (=> d!15 m!115))

(declare-fun m!161 () Bool)

(assert (=> d!15 m!161))

(declare-fun m!165 () Bool)

(assert (=> d!15 m!165))

(declare-fun m!171 () Bool)

(assert (=> b!1459 m!171))

(declare-fun m!177 () Bool)

(assert (=> b!1460 m!177))

(assert (=> b!1406 d!15))

(declare-fun d!19 () Bool)

(declare-fun size!56 (LongMapFixedSize!8) (_ BitVec 32))

(assert (=> d!19 (= (size!53 lt!8) (size!56 (v!1070 (underlying!15 lt!8))))))

(declare-fun bs!11 () Bool)

(assert (= bs!11 d!19))

(declare-fun m!191 () Bool)

(assert (=> bs!11 m!191))

(assert (=> b!1407 d!19))

(declare-fun b_lambda!14 () Bool)

(assert (= b_lambda!11 (or (and start!14 b_free!5) b_lambda!14)))

(declare-fun b_lambda!18 () Bool)

(assert (= b_lambda!5 (or (and start!14 b_free!5) b_lambda!18)))

(push 1)

(assert (not b!1460))

(assert b_and!14)

(assert (not b_lambda!18))

(assert (not b_lambda!14))

(assert (not d!15))

(assert (not b_next!5))

(assert tp_is_empty!2)

(assert (not d!19))

(assert (not b!1459))

(assert (not d!9))

(assert (not b!1457))

(check-sat)

(pop 1)

(push 1)

(assert b_and!14)

(assert (not b_next!5))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25 () Bool)

(declare-fun getCurrentListMap!2 (array!13 array!11 (_ BitVec 32) (_ BitVec 32) V!215 V!215 (_ BitVec 32) Int) ListLongMap!5)

(assert (=> d!25 (= (map!20 lt!193) (getCurrentListMap!2 (_keys!2981 lt!193) (_values!1586 lt!193) (mask!4134 lt!193) (extraKeys!1502 lt!193) (zeroValue!1525 lt!193) (minValue!1525 lt!193) #b00000000000000000000000000000000 (defaultEntry!1582 lt!193)))))

(declare-fun bs!13 () Bool)

(assert (= bs!13 d!25))

(declare-fun m!201 () Bool)

(assert (=> bs!13 m!201))

(assert (=> b!1460 d!25))

(declare-fun d!35 () Bool)

(assert (=> d!35 (= (arrayCountValidKeys!0 lt!211 lt!199 lt!215) #b00000000000000000000000000000000)))

(declare-fun lt!218 () Unit!1)

(declare-fun choose!59 (array!13 (_ BitVec 32) (_ BitVec 32)) Unit!1)

(assert (=> d!35 (= lt!218 (choose!59 lt!211 lt!199 lt!215))))

(assert (=> d!35 (bvslt (size!52 lt!211) #b01111111111111111111111111111111)))

(assert (=> d!35 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!211 lt!199 lt!215) lt!218)))

(declare-fun bs!14 () Bool)

(assert (= bs!14 d!35))

(assert (=> bs!14 m!145))

(declare-fun m!203 () Bool)

(assert (=> bs!14 m!203))

(assert (=> d!15 d!35))

(declare-fun d!37 () Bool)

(declare-fun res!4227 () Bool)

(declare-fun e!120 () Bool)

(assert (=> d!37 (=> (not res!4227) (not e!120))))

(declare-fun simpleValid!1 (LongMapFixedSize!8) Bool)

(assert (=> d!37 (= res!4227 (simpleValid!1 lt!193))))

(assert (=> d!37 (= (valid!7 lt!193) e!120)))

(declare-fun b!1495 () Bool)

(declare-fun res!4228 () Bool)

(assert (=> b!1495 (=> (not res!4228) (not e!120))))

(assert (=> b!1495 (= res!4228 (= (arrayCountValidKeys!0 (_keys!2981 lt!193) #b00000000000000000000000000000000 (size!52 (_keys!2981 lt!193))) (_size!35 lt!193)))))

(declare-fun b!1496 () Bool)

(declare-fun res!4229 () Bool)

(assert (=> b!1496 (=> (not res!4229) (not e!120))))

(assert (=> b!1496 (= res!4229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!2981 lt!193) (mask!4134 lt!193)))))

(declare-fun b!1497 () Bool)

(assert (=> b!1497 (= e!120 (arrayNoDuplicates!0 (_keys!2981 lt!193) #b00000000000000000000000000000000 Nil!8))))

(assert (= (and d!37 res!4227) b!1495))

(assert (= (and b!1495 res!4228) b!1496))

(assert (= (and b!1496 res!4229) b!1497))

(declare-fun m!215 () Bool)

(assert (=> d!37 m!215))

(declare-fun m!217 () Bool)

(assert (=> b!1495 m!217))

(declare-fun m!219 () Bool)

(assert (=> b!1496 m!219))

(declare-fun m!221 () Bool)

(assert (=> b!1497 m!221))

(assert (=> d!15 d!37))

(declare-fun d!43 () Bool)

(assert (=> d!43 (arrayNoDuplicates!0 lt!196 lt!214 lt!213)))

(declare-fun lt!227 () Unit!1)

(declare-fun choose!111 (array!13 (_ BitVec 32) (_ BitVec 32) List!11) Unit!1)

(assert (=> d!43 (= lt!227 (choose!111 lt!196 lt!214 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!213))))

(assert (=> d!43 (= (size!52 lt!196) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001))))

(assert (=> d!43 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!196 lt!214 (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001) lt!213) lt!227)))

(declare-fun bs!16 () Bool)

(assert (= bs!16 d!43))

(assert (=> bs!16 m!127))

(declare-fun m!225 () Bool)

(assert (=> bs!16 m!225))

(assert (=> d!15 d!43))

(declare-fun b!1521 () Bool)

(declare-fun e!140 () Bool)

(declare-fun call!5 () Bool)

(assert (=> b!1521 (= e!140 call!5)))

(declare-fun b!1522 () Bool)

(declare-fun e!139 () Bool)

(declare-fun e!138 () Bool)

(assert (=> b!1522 (= e!139 e!138)))

(declare-fun res!4243 () Bool)

(assert (=> b!1522 (=> (not res!4243) (not e!138))))

(declare-fun e!141 () Bool)

(assert (=> b!1522 (= res!4243 (not e!141))))

(declare-fun res!4244 () Bool)

(assert (=> b!1522 (=> (not res!4244) (not e!141))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1522 (= res!4244 (validKeyInArray!0 (select (arr!6 lt!196) lt!214)))))

(declare-fun b!1523 () Bool)

(assert (=> b!1523 (= e!138 e!140)))

(declare-fun c!41 () Bool)

(assert (=> b!1523 (= c!41 (validKeyInArray!0 (select (arr!6 lt!196) lt!214)))))

(declare-fun d!47 () Bool)

(declare-fun res!4242 () Bool)

(assert (=> d!47 (=> res!4242 e!139)))

(assert (=> d!47 (= res!4242 (bvsge lt!214 (size!52 lt!196)))))

(assert (=> d!47 (= (arrayNoDuplicates!0 lt!196 lt!214 lt!213) e!139)))

(declare-fun b!1520 () Bool)

(declare-fun contains!8 (List!11 (_ BitVec 64)) Bool)

(assert (=> b!1520 (= e!141 (contains!8 lt!213 (select (arr!6 lt!196) lt!214)))))

(declare-fun b!1524 () Bool)

(assert (=> b!1524 (= e!140 call!5)))

(declare-fun bm!2 () Bool)

(assert (=> bm!2 (= call!5 (arrayNoDuplicates!0 lt!196 (bvadd lt!214 #b00000000000000000000000000000001) (ite c!41 (Cons!7 (select (arr!6 lt!196) lt!214) lt!213) lt!213)))))

(assert (= (and d!47 (not res!4242)) b!1522))

(assert (= (and b!1522 res!4244) b!1520))

(assert (= (and b!1522 res!4243) b!1523))

(assert (= (and b!1523 c!41) b!1524))

(assert (= (and b!1523 (not c!41)) b!1521))

(assert (= (or b!1524 b!1521) bm!2))

(declare-fun m!239 () Bool)

(assert (=> b!1522 m!239))

(assert (=> b!1522 m!239))

(declare-fun m!241 () Bool)

(assert (=> b!1522 m!241))

(assert (=> b!1523 m!239))

(assert (=> b!1523 m!239))

(assert (=> b!1523 m!241))

(assert (=> b!1520 m!239))

(assert (=> b!1520 m!239))

(declare-fun m!245 () Bool)

(assert (=> b!1520 m!245))

(assert (=> bm!2 m!239))

(declare-fun m!247 () Bool)

(assert (=> bm!2 m!247))

(assert (=> d!15 d!47))

(declare-fun b!1545 () Bool)

(declare-fun e!158 () Bool)

(declare-fun call!11 () Bool)

(assert (=> b!1545 (= e!158 call!11)))

(declare-fun bm!8 () Bool)

(assert (=> bm!8 (= call!11 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!194 #b00000000000000000000000000000001) lt!210 #b00000000000000000000000000001111))))

(declare-fun b!1546 () Bool)

(declare-fun e!157 () Bool)

(declare-fun e!159 () Bool)

(assert (=> b!1546 (= e!157 e!159)))

(declare-fun c!47 () Bool)

(assert (=> b!1546 (= c!47 (validKeyInArray!0 (select (arr!6 lt!210) lt!194)))))

(declare-fun b!1547 () Bool)

(assert (=> b!1547 (= e!159 e!158)))

(declare-fun lt!254 () (_ BitVec 64))

(assert (=> b!1547 (= lt!254 (select (arr!6 lt!210) lt!194))))

(declare-fun lt!253 () Unit!1)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!13 (_ BitVec 64) (_ BitVec 32)) Unit!1)

(assert (=> b!1547 (= lt!253 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!210 lt!254 lt!194))))

(assert (=> b!1547 (arrayContainsKey!0 lt!210 lt!254 #b00000000000000000000000000000000)))

(declare-fun lt!252 () Unit!1)

(assert (=> b!1547 (= lt!252 lt!253)))

(declare-fun res!4256 () Bool)

(declare-datatypes ((SeekEntryResult!3 0))(
  ( (MissingZero!3 (index!2131 (_ BitVec 32))) (Found!3 (index!2132 (_ BitVec 32))) (Intermediate!3 (undefined!815 Bool) (index!2133 (_ BitVec 32)) (x!1758 (_ BitVec 32))) (Undefined!3) (MissingVacant!3 (index!2134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13 (_ BitVec 32)) SeekEntryResult!3)

(assert (=> b!1547 (= res!4256 (= (seekEntryOrOpen!0 (select (arr!6 lt!210) lt!194) lt!210 #b00000000000000000000000000001111) (Found!3 lt!194)))))

(assert (=> b!1547 (=> (not res!4256) (not e!158))))

(declare-fun b!1548 () Bool)

(assert (=> b!1548 (= e!159 call!11)))

(declare-fun d!61 () Bool)

(declare-fun res!4255 () Bool)

(assert (=> d!61 (=> res!4255 e!157)))

(assert (=> d!61 (= res!4255 (bvsge lt!194 (size!52 lt!210)))))

(assert (=> d!61 (= (arrayForallSeekEntryOrOpenFound!0 lt!194 lt!210 #b00000000000000000000000000001111) e!157)))

(assert (= (and d!61 (not res!4255)) b!1546))

(assert (= (and b!1546 c!47) b!1547))

(assert (= (and b!1546 (not c!47)) b!1548))

(assert (= (and b!1547 res!4256) b!1545))

(assert (= (or b!1545 b!1548) bm!8))

(declare-fun m!261 () Bool)

(assert (=> bm!8 m!261))

(declare-fun m!265 () Bool)

(assert (=> b!1546 m!265))

(assert (=> b!1546 m!265))

(declare-fun m!267 () Bool)

(assert (=> b!1546 m!267))

(assert (=> b!1547 m!265))

(declare-fun m!269 () Bool)

(assert (=> b!1547 m!269))

(declare-fun m!271 () Bool)

(assert (=> b!1547 m!271))

(assert (=> b!1547 m!265))

(declare-fun m!273 () Bool)

(assert (=> b!1547 m!273))

(assert (=> d!15 d!61))

(declare-fun d!67 () Bool)

(assert (=> d!67 (= (map!20 lt!209) (getCurrentListMap!2 (_keys!2981 lt!209) (_values!1586 lt!209) (mask!4134 lt!209) (extraKeys!1502 lt!209) (zeroValue!1525 lt!209) (minValue!1525 lt!209) #b00000000000000000000000000000000 (defaultEntry!1582 lt!209)))))

(declare-fun bs!20 () Bool)

(assert (= bs!20 d!67))

(declare-fun m!275 () Bool)

(assert (=> bs!20 m!275))

(assert (=> d!15 d!67))

(declare-fun d!69 () Bool)

(assert (=> d!69 (arrayForallSeekEntryOrOpenFound!0 lt!194 lt!210 #b00000000000000000000000000001111)))

(declare-fun lt!263 () Unit!1)

(declare-fun choose!34 (array!13 (_ BitVec 32) (_ BitVec 32)) Unit!1)

(assert (=> d!69 (= lt!263 (choose!34 lt!210 #b00000000000000000000000000001111 lt!194))))

(assert (=> d!69 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!69 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!210 #b00000000000000000000000000001111 lt!194) lt!263)))

(declare-fun bs!21 () Bool)

(assert (= bs!21 d!69))

(assert (=> bs!21 m!157))

(declare-fun m!277 () Bool)

(assert (=> bs!21 m!277))

(assert (=> bs!21 m!137))

(assert (=> d!15 d!69))

(declare-fun d!71 () Bool)

(declare-fun lt!272 () (_ BitVec 32))

(assert (=> d!71 (and (bvsge lt!272 #b00000000000000000000000000000000) (bvsle lt!272 (bvsub (size!52 lt!211) lt!199)))))

(declare-fun e!183 () (_ BitVec 32))

(assert (=> d!71 (= lt!272 e!183)))

(declare-fun c!56 () Bool)

(assert (=> d!71 (= c!56 (bvsge lt!199 lt!215))))

(assert (=> d!71 (and (bvsle lt!199 lt!215) (bvsge lt!199 #b00000000000000000000000000000000) (bvsle lt!215 (size!52 lt!211)))))

(assert (=> d!71 (= (arrayCountValidKeys!0 lt!211 lt!199 lt!215) lt!272)))

(declare-fun b!1588 () Bool)

(assert (=> b!1588 (= e!183 #b00000000000000000000000000000000)))

(declare-fun call!17 () (_ BitVec 32))

(declare-fun bm!14 () Bool)

(assert (=> bm!14 (= call!17 (arrayCountValidKeys!0 lt!211 (bvadd lt!199 #b00000000000000000000000000000001) lt!215))))

(declare-fun b!1589 () Bool)

(declare-fun e!185 () (_ BitVec 32))

(assert (=> b!1589 (= e!185 (bvadd #b00000000000000000000000000000001 call!17))))

(declare-fun b!1590 () Bool)

(assert (=> b!1590 (= e!183 e!185)))

(declare-fun c!57 () Bool)

(assert (=> b!1590 (= c!57 (validKeyInArray!0 (select (arr!6 lt!211) lt!199)))))

(declare-fun b!1591 () Bool)

(assert (=> b!1591 (= e!185 call!17)))

(assert (= (and d!71 c!56) b!1588))

(assert (= (and d!71 (not c!56)) b!1590))

(assert (= (and b!1590 c!57) b!1589))

(assert (= (and b!1590 (not c!57)) b!1591))

(assert (= (or b!1589 b!1591) bm!14))

(declare-fun m!301 () Bool)

(assert (=> bm!14 m!301))

(declare-fun m!303 () Bool)

(assert (=> b!1590 m!303))

(assert (=> b!1590 m!303))

(declare-fun m!305 () Bool)

(assert (=> b!1590 m!305))

(assert (=> d!15 d!71))

(declare-fun d!81 () Bool)

(assert (=> d!81 (= (validMask!0 #b00000000000000000000000000001111) true)))

(assert (=> d!15 d!81))

(declare-fun d!83 () Bool)

(assert (=> d!83 (= (head!740 (toList!18 (map!20 lt!209))) (h!568 (toList!18 (map!20 lt!209))))))

(assert (=> b!1457 d!83))

(assert (=> b!1457 d!67))

(declare-fun d!85 () Bool)

(declare-fun e!204 () Bool)

(assert (=> d!85 e!204))

(declare-fun c!65 () Bool)

(assert (=> d!85 (= c!65 (and (not (= (_1!0 lt!198) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!0 lt!198) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!278 () Unit!1)

(declare-fun choose!130 (array!13 array!11 (_ BitVec 32) (_ BitVec 32) V!215 V!215 (_ BitVec 64) Int) Unit!1)

(assert (=> d!85 (= lt!278 (choose!130 lt!212 (array!12 ((as const (Array (_ BitVec 32) ValueCell!4)) EmptyCell!4) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!205 (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!0 lt!198) defaultEntry!179))))

(assert (=> d!85 (validMask!0 #b00000000000000000000000000001111)))

(assert (=> d!85 (= (lemmaKeyInListMapIsInArray!2 lt!212 (array!12 ((as const (Array (_ BitVec 32) ValueCell!4)) EmptyCell!4) (bvadd #b00000000000000000000000000001111 #b00000000000000000000000000000001)) #b00000000000000000000000000001111 lt!205 (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (dynLambda!2 defaultEntry!179 #b0000000000000000000000000000000000000000000000000000000000000000) (_1!0 lt!198) defaultEntry!179) lt!278)))

(declare-fun b!1616 () Bool)

(assert (=> b!1616 (= e!204 (arrayContainsKey!0 lt!212 (_1!0 lt!198) #b00000000000000000000000000000000))))

(declare-fun b!1617 () Bool)

(assert (=> b!1617 (= e!204 (ite (= (_1!0 lt!198) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand lt!205 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand lt!205 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!85 c!65) b!1616))

(assert (= (and d!85 (not c!65)) b!1617))

(assert (=> d!85 m!105))

(assert (=> d!85 m!105))

(declare-fun m!325 () Bool)

(assert (=> d!85 m!325))

(assert (=> d!85 m!137))

(assert (=> b!1616 m!171))

