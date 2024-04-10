; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5366 () Bool)

(assert start!5366)

(declare-fun b_free!1355 () Bool)

(declare-fun b_next!1355 () Bool)

(assert (=> start!5366 (= b_free!1355 (not b_next!1355))))

(declare-fun tp!5720 () Bool)

(declare-fun b_and!2323 () Bool)

(assert (=> start!5366 (= tp!5720 b_and!2323)))

(declare-fun res!23262 () Bool)

(declare-fun e!24460 () Bool)

(assert (=> start!5366 (=> (not res!23262) (not e!24460))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5366 (= res!23262 (validMask!0 mask!853))))

(assert (=> start!5366 e!24460))

(assert (=> start!5366 true))

(assert (=> start!5366 tp!5720))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2575 0))(
  ( (array!2576 (arr!1231 (Array (_ BitVec 32) (_ BitVec 64))) (size!1338 (_ BitVec 32))) )
))
(declare-fun lt!14436 () array!2575)

(declare-datatypes ((V!2085 0))(
  ( (V!2086 (val!911 Int)) )
))
(declare-fun lt!14438 () V!2085)

(declare-fun b!38516 () Bool)

(declare-datatypes ((ValueCell!625 0))(
  ( (ValueCellFull!625 (v!1980 V!2085)) (EmptyCell!625) )
))
(declare-datatypes ((array!2577 0))(
  ( (array!2578 (arr!1232 (Array (_ BitVec 32) ValueCell!625)) (size!1339 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!230 0))(
  ( (LongMapFixedSize!231 (defaultEntry!1793 Int) (mask!5114 (_ BitVec 32)) (extraKeys!1684 (_ BitVec 32)) (zeroValue!1711 V!2085) (minValue!1711 V!2085) (_size!164 (_ BitVec 32)) (_keys!3246 array!2575) (_values!1776 array!2577) (_vacant!164 (_ BitVec 32))) )
))
(declare-fun valid!114 (LongMapFixedSize!230) Bool)

(assert (=> b!38516 (= e!24460 (not (valid!114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1045 0))(
  ( (Nil!1042) (Cons!1041 (h!1609 (_ BitVec 64)) (t!3884 List!1045)) )
))
(declare-fun arrayNoDuplicates!0 (array!2575 (_ BitVec 32) List!1045) Bool)

(assert (=> b!38516 (arrayNoDuplicates!0 lt!14436 #b00000000000000000000000000000000 Nil!1042)))

(declare-datatypes ((Unit!963 0))(
  ( (Unit!964) )
))
(declare-fun lt!14437 () Unit!963)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2575 (_ BitVec 32) (_ BitVec 32) List!1045) Unit!963)

(assert (=> b!38516 (= lt!14437 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2575 (_ BitVec 32)) Bool)

(assert (=> b!38516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14436 mask!853)))

(declare-fun lt!14435 () Unit!963)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2575 (_ BitVec 32) (_ BitVec 32)) Unit!963)

(assert (=> b!38516 (= lt!14435 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14436 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2575 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38516 (= (arrayCountValidKeys!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14434 () Unit!963)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2575 (_ BitVec 32) (_ BitVec 32)) Unit!963)

(assert (=> b!38516 (= lt!14434 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38516 (= lt!14436 (array!2576 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!186 (Int (_ BitVec 64)) V!2085)

(assert (=> b!38516 (= lt!14438 (dynLambda!186 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5366 res!23262) b!38516))

(declare-fun b_lambda!2013 () Bool)

(assert (=> (not b_lambda!2013) (not b!38516)))

(declare-fun t!3883 () Bool)

(declare-fun tb!825 () Bool)

(assert (=> (and start!5366 (= defaultEntry!470 defaultEntry!470) t!3883) tb!825))

(declare-fun result!1413 () Bool)

(declare-fun tp_is_empty!1745 () Bool)

(assert (=> tb!825 (= result!1413 tp_is_empty!1745)))

(assert (=> b!38516 t!3883))

(declare-fun b_and!2325 () Bool)

(assert (= b_and!2323 (and (=> t!3883 result!1413) b_and!2325)))

(declare-fun m!31237 () Bool)

(assert (=> start!5366 m!31237))

(declare-fun m!31239 () Bool)

(assert (=> b!38516 m!31239))

(declare-fun m!31241 () Bool)

(assert (=> b!38516 m!31241))

(declare-fun m!31243 () Bool)

(assert (=> b!38516 m!31243))

(declare-fun m!31245 () Bool)

(assert (=> b!38516 m!31245))

(declare-fun m!31247 () Bool)

(assert (=> b!38516 m!31247))

(declare-fun m!31249 () Bool)

(assert (=> b!38516 m!31249))

(declare-fun m!31251 () Bool)

(assert (=> b!38516 m!31251))

(declare-fun m!31253 () Bool)

(assert (=> b!38516 m!31253))

(push 1)

(assert b_and!2325)

(assert (not b!38516))

(assert (not b_next!1355))

(assert (not start!5366))

(assert tp_is_empty!1745)

(assert (not b_lambda!2013))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2325)

(assert (not b_next!1355))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2015 () Bool)

(assert (= b_lambda!2013 (or (and start!5366 b_free!1355) b_lambda!2015)))

(push 1)

(assert b_and!2325)

(assert (not b!38516))

(assert (not b_next!1355))

(assert (not b_lambda!2015))

(assert (not start!5366))

(assert tp_is_empty!1745)

(check-sat)

(pop 1)

(push 1)

(assert b_and!2325)

(assert (not b_next!1355))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6235 () Bool)

(assert (=> d!6235 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5366 d!6235))

(declare-fun d!6241 () Bool)

(assert (=> d!6241 (= (arrayCountValidKeys!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14450 () Unit!963)

(declare-fun choose!59 (array!2575 (_ BitVec 32) (_ BitVec 32)) Unit!963)

(assert (=> d!6241 (= lt!14450 (choose!59 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6241 (bvslt (size!1338 lt!14436) #b01111111111111111111111111111111)))

(assert (=> d!6241 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14450)))

(declare-fun bs!1595 () Bool)

(assert (= bs!1595 d!6241))

(assert (=> bs!1595 m!31239))

(declare-fun m!31257 () Bool)

(assert (=> bs!1595 m!31257))

(assert (=> b!38516 d!6241))

(declare-fun b!38564 () Bool)

(declare-fun e!24494 () (_ BitVec 32))

(assert (=> b!38564 (= e!24494 #b00000000000000000000000000000000)))

(declare-fun b!38565 () Bool)

(declare-fun e!24495 () (_ BitVec 32))

(assert (=> b!38565 (= e!24494 e!24495)))

(declare-fun c!4425 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!38565 (= c!4425 (validKeyInArray!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun b!38566 () Bool)

(declare-fun call!2911 () (_ BitVec 32))

(assert (=> b!38566 (= e!24495 call!2911)))

(declare-fun d!6243 () Bool)

(declare-fun lt!14456 () (_ BitVec 32))

(assert (=> d!6243 (and (bvsge lt!14456 #b00000000000000000000000000000000) (bvsle lt!14456 (bvsub (size!1338 lt!14436) #b00000000000000000000000000000000)))))

(assert (=> d!6243 (= lt!14456 e!24494)))

(declare-fun c!4426 () Bool)

(assert (=> d!6243 (= c!4426 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6243 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1338 lt!14436)))))

(assert (=> d!6243 (= (arrayCountValidKeys!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14456)))

(declare-fun bm!2908 () Bool)

(assert (=> bm!2908 (= call!2911 (arrayCountValidKeys!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38567 () Bool)

(assert (=> b!38567 (= e!24495 (bvadd #b00000000000000000000000000000001 call!2911))))

(assert (= (and d!6243 c!4426) b!38564))

(assert (= (and d!6243 (not c!4426)) b!38565))

(assert (= (and b!38565 c!4425) b!38567))

(assert (= (and b!38565 (not c!4425)) b!38566))

(assert (= (or b!38567 b!38566) bm!2908))

(declare-fun m!31279 () Bool)

(assert (=> b!38565 m!31279))

(assert (=> b!38565 m!31279))

(declare-fun m!31281 () Bool)

(assert (=> b!38565 m!31281))

(declare-fun m!31283 () Bool)

(assert (=> bm!2908 m!31283))

(assert (=> b!38516 d!6243))

(declare-fun b!38592 () Bool)

(declare-fun e!24514 () Bool)

(declare-fun call!2915 () Bool)

(assert (=> b!38592 (= e!24514 call!2915)))

(declare-fun b!38593 () Bool)

(assert (=> b!38593 (= e!24514 call!2915)))

(declare-fun bm!2912 () Bool)

(declare-fun c!4430 () Bool)

(assert (=> bm!2912 (= call!2915 (arrayNoDuplicates!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4430 (Cons!1041 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) Nil!1042) Nil!1042)))))

(declare-fun b!38594 () Bool)

(declare-fun e!24511 () Bool)

(declare-fun contains!502 (List!1045 (_ BitVec 64)) Bool)

(assert (=> b!38594 (= e!24511 (contains!502 Nil!1042 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun b!38595 () Bool)

(declare-fun e!24513 () Bool)

(declare-fun e!24512 () Bool)

(assert (=> b!38595 (= e!24513 e!24512)))

(declare-fun res!23303 () Bool)

(assert (=> b!38595 (=> (not res!23303) (not e!24512))))

(assert (=> b!38595 (= res!23303 (not e!24511))))

(declare-fun res!23304 () Bool)

(assert (=> b!38595 (=> (not res!23304) (not e!24511))))

(assert (=> b!38595 (= res!23304 (validKeyInArray!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun d!6249 () Bool)

(declare-fun res!23302 () Bool)

(assert (=> d!6249 (=> res!23302 e!24513)))

(assert (=> d!6249 (= res!23302 (bvsge #b00000000000000000000000000000000 (size!1338 lt!14436)))))

(assert (=> d!6249 (= (arrayNoDuplicates!0 lt!14436 #b00000000000000000000000000000000 Nil!1042) e!24513)))

(declare-fun b!38596 () Bool)

(assert (=> b!38596 (= e!24512 e!24514)))

(assert (=> b!38596 (= c!4430 (validKeyInArray!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(assert (= (and d!6249 (not res!23302)) b!38595))

(assert (= (and b!38595 res!23304) b!38594))

(assert (= (and b!38595 res!23303) b!38596))

(assert (= (and b!38596 c!4430) b!38592))

(assert (= (and b!38596 (not c!4430)) b!38593))

(assert (= (or b!38592 b!38593) bm!2912))

(assert (=> bm!2912 m!31279))

(declare-fun m!31301 () Bool)

(assert (=> bm!2912 m!31301))

(assert (=> b!38594 m!31279))

(assert (=> b!38594 m!31279))

(declare-fun m!31303 () Bool)

(assert (=> b!38594 m!31303))

(assert (=> b!38595 m!31279))

(assert (=> b!38595 m!31279))

(assert (=> b!38595 m!31281))

(assert (=> b!38596 m!31279))

(assert (=> b!38596 m!31279))

(assert (=> b!38596 m!31281))

(assert (=> b!38516 d!6249))

(declare-fun d!6259 () Bool)

(declare-fun res!23317 () Bool)

(declare-fun e!24532 () Bool)

(assert (=> d!6259 (=> (not res!23317) (not e!24532))))

(declare-fun simpleValid!22 (LongMapFixedSize!230) Bool)

(assert (=> d!6259 (= res!23317 (simpleValid!22 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6259 (= (valid!114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24532)))

(declare-fun b!38627 () Bool)

(declare-fun res!23318 () Bool)

(assert (=> b!38627 (=> (not res!23318) (not e!24532))))

(assert (=> b!38627 (= res!23318 (= (arrayCountValidKeys!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (_size!164 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38628 () Bool)

(declare-fun res!23319 () Bool)

(assert (=> b!38628 (=> (not res!23319) (not e!24532))))

(assert (=> b!38628 (= res!23319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38629 () Bool)

(assert (=> b!38629 (= e!24532 (arrayNoDuplicates!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1042))))

(assert (= (and d!6259 res!23317) b!38627))

(assert (= (and b!38627 res!23318) b!38628))

(assert (= (and b!38628 res!23319) b!38629))

(declare-fun m!31307 () Bool)

(assert (=> d!6259 m!31307))

(declare-fun m!31313 () Bool)

(assert (=> b!38627 m!31313))

(declare-fun m!31317 () Bool)

(assert (=> b!38628 m!31317))

(declare-fun m!31319 () Bool)

(assert (=> b!38629 m!31319))

(assert (=> b!38516 d!6259))

(declare-fun d!6263 () Bool)

(assert (=> d!6263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14436 mask!853)))

(declare-fun lt!14479 () Unit!963)

(declare-fun choose!34 (array!2575 (_ BitVec 32) (_ BitVec 32)) Unit!963)

(assert (=> d!6263 (= lt!14479 (choose!34 lt!14436 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6263 (validMask!0 mask!853)))

(assert (=> d!6263 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14436 mask!853 #b00000000000000000000000000000000) lt!14479)))

(declare-fun bs!1598 () Bool)

(assert (= bs!1598 d!6263))

(assert (=> bs!1598 m!31243))

(declare-fun m!31331 () Bool)

(assert (=> bs!1598 m!31331))

(assert (=> bs!1598 m!31237))

(assert (=> b!38516 d!6263))

(declare-fun b!38659 () Bool)

(declare-fun e!24549 () Bool)

(declare-fun e!24548 () Bool)

(assert (=> b!38659 (= e!24549 e!24548)))

(declare-fun lt!14495 () (_ BitVec 64))

(assert (=> b!38659 (= lt!14495 (select (arr!1231 lt!14436) #b00000000000000000000000000000000))))

(declare-fun lt!14496 () Unit!963)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2575 (_ BitVec 64) (_ BitVec 32)) Unit!963)

(assert (=> b!38659 (= lt!14496 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14436 lt!14495 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!38659 (arrayContainsKey!0 lt!14436 lt!14495 #b00000000000000000000000000000000)))

(declare-fun lt!14497 () Unit!963)

(assert (=> b!38659 (= lt!14497 lt!14496)))

(declare-fun res!23333 () Bool)

(declare-datatypes ((SeekEntryResult!168 0))(
  ( (MissingZero!168 (index!2794 (_ BitVec 32))) (Found!168 (index!2795 (_ BitVec 32))) (Intermediate!168 (undefined!980 Bool) (index!2796 (_ BitVec 32)) (x!7604 (_ BitVec 32))) (Undefined!168) (MissingVacant!168 (index!2797 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2575 (_ BitVec 32)) SeekEntryResult!168)

(assert (=> b!38659 (= res!23333 (= (seekEntryOrOpen!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853) (Found!168 #b00000000000000000000000000000000)))))

(assert (=> b!38659 (=> (not res!23333) (not e!24548))))

(declare-fun b!38660 () Bool)

(declare-fun call!2927 () Bool)

(assert (=> b!38660 (= e!24549 call!2927)))

(declare-fun d!6269 () Bool)

(declare-fun res!23334 () Bool)

(declare-fun e!24550 () Bool)

(assert (=> d!6269 (=> res!23334 e!24550)))

(assert (=> d!6269 (= res!23334 (bvsge #b00000000000000000000000000000000 (size!1338 lt!14436)))))

(assert (=> d!6269 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14436 mask!853) e!24550)))

(declare-fun b!38661 () Bool)

(assert (=> b!38661 (= e!24548 call!2927)))

(declare-fun b!38662 () Bool)

(assert (=> b!38662 (= e!24550 e!24549)))

(declare-fun c!4448 () Bool)

(assert (=> b!38662 (= c!4448 (validKeyInArray!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun bm!2924 () Bool)

(assert (=> bm!2924 (= call!2927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14436 mask!853))))

(assert (= (and d!6269 (not res!23334)) b!38662))

(assert (= (and b!38662 c!4448) b!38659))

(assert (= (and b!38662 (not c!4448)) b!38660))

(assert (= (and b!38659 res!23333) b!38661))

(assert (= (or b!38661 b!38660) bm!2924))

(assert (=> b!38659 m!31279))

(declare-fun m!31339 () Bool)

(assert (=> b!38659 m!31339))

(declare-fun m!31341 () Bool)

(assert (=> b!38659 m!31341))

(assert (=> b!38659 m!31279))

(declare-fun m!31345 () Bool)

(assert (=> b!38659 m!31345))

(assert (=> b!38662 m!31279))

(assert (=> b!38662 m!31279))

(assert (=> b!38662 m!31281))

(declare-fun m!31347 () Bool)

(assert (=> bm!2924 m!31347))

(assert (=> b!38516 d!6269))

(declare-fun d!6277 () Bool)

(assert (=> d!6277 (arrayNoDuplicates!0 lt!14436 #b00000000000000000000000000000000 Nil!1042)))

(declare-fun lt!14501 () Unit!963)

(declare-fun choose!111 (array!2575 (_ BitVec 32) (_ BitVec 32) List!1045) Unit!963)

(assert (=> d!6277 (= lt!14501 (choose!111 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1042))))

(assert (=> d!6277 (= (size!1338 lt!14436) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6277 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1042) lt!14501)))

(declare-fun bs!1602 () Bool)

(assert (= bs!1602 d!6277))

(assert (=> bs!1602 m!31249))

(declare-fun m!31349 () Bool)

(assert (=> bs!1602 m!31349))

(assert (=> b!38516 d!6277))

(push 1)

(assert b_and!2325)

(assert (not b!38594))

(assert (not d!6241))

(assert (not b_lambda!2015))

(assert (not b!38627))

(assert (not bm!2908))

(assert (not b!38662))

(assert (not b!38628))

(assert (not b!38565))

(assert tp_is_empty!1745)

(assert (not b!38596))

(assert (not bm!2924))

(assert (not d!6277))

(assert (not b!38629))

(assert (not bm!2912))

(assert (not b_next!1355))

(assert (not d!6259))

(assert (not b!38659))

(assert (not d!6263))

(assert (not b!38595))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2325)

(assert (not b_next!1355))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6317 () Bool)

(assert (=> d!6317 (= (validKeyInArray!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)) (and (not (= (select (arr!1231 lt!14436) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1231 lt!14436) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38565 d!6317))

(declare-fun b!38720 () Bool)

(declare-fun e!24592 () (_ BitVec 32))

(assert (=> b!38720 (= e!24592 #b00000000000000000000000000000000)))

(declare-fun b!38721 () Bool)

(declare-fun e!24593 () (_ BitVec 32))

(assert (=> b!38721 (= e!24592 e!24593)))

(declare-fun c!4456 () Bool)

(assert (=> b!38721 (= c!4456 (validKeyInArray!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38722 () Bool)

(declare-fun call!2933 () (_ BitVec 32))

(assert (=> b!38722 (= e!24593 call!2933)))

(declare-fun d!6319 () Bool)

(declare-fun lt!14522 () (_ BitVec 32))

(assert (=> d!6319 (and (bvsge lt!14522 #b00000000000000000000000000000000) (bvsle lt!14522 (bvsub (size!1338 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6319 (= lt!14522 e!24592)))

(declare-fun c!4457 () Bool)

(assert (=> d!6319 (= c!4457 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6319 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1338 lt!14436)))))

(assert (=> d!6319 (= (arrayCountValidKeys!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14522)))

(declare-fun bm!2930 () Bool)

(assert (=> bm!2930 (= call!2933 (arrayCountValidKeys!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38723 () Bool)

(assert (=> b!38723 (= e!24593 (bvadd #b00000000000000000000000000000001 call!2933))))

(assert (= (and d!6319 c!4457) b!38720))

(assert (= (and d!6319 (not c!4457)) b!38721))

(assert (= (and b!38721 c!4456) b!38723))

(assert (= (and b!38721 (not c!4456)) b!38722))

(assert (= (or b!38723 b!38722) bm!2930))

(declare-fun m!31411 () Bool)

(assert (=> b!38721 m!31411))

(assert (=> b!38721 m!31411))

(declare-fun m!31413 () Bool)

(assert (=> b!38721 m!31413))

(declare-fun m!31415 () Bool)

(assert (=> bm!2930 m!31415))

(assert (=> bm!2908 d!6319))

(declare-fun d!6321 () Bool)

(declare-fun lt!14537 () Bool)

(declare-fun content!26 (List!1045) (Set (_ BitVec 64)))

(assert (=> d!6321 (= lt!14537 (member (select (arr!1231 lt!14436) #b00000000000000000000000000000000) (content!26 Nil!1042)))))

(declare-fun e!24610 () Bool)

(assert (=> d!6321 (= lt!14537 e!24610)))

(declare-fun res!23385 () Bool)

(assert (=> d!6321 (=> (not res!23385) (not e!24610))))

(assert (=> d!6321 (= res!23385 (is-Cons!1041 Nil!1042))))

(assert (=> d!6321 (= (contains!502 Nil!1042 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)) lt!14537)))

(declare-fun b!38752 () Bool)

(declare-fun e!24611 () Bool)

(assert (=> b!38752 (= e!24610 e!24611)))

(declare-fun res!23386 () Bool)

(assert (=> b!38752 (=> res!23386 e!24611)))

(assert (=> b!38752 (= res!23386 (= (h!1609 Nil!1042) (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun b!38753 () Bool)

(assert (=> b!38753 (= e!24611 (contains!502 (t!3884 Nil!1042) (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(assert (= (and d!6321 res!23385) b!38752))

(assert (= (and b!38752 (not res!23386)) b!38753))

(declare-fun m!31417 () Bool)

(assert (=> d!6321 m!31417))

(assert (=> d!6321 m!31279))

(declare-fun m!31419 () Bool)

(assert (=> d!6321 m!31419))

(assert (=> b!38753 m!31279))

(declare-fun m!31421 () Bool)

(assert (=> b!38753 m!31421))

(assert (=> b!38594 d!6321))

(assert (=> d!6277 d!6249))

(declare-fun d!6323 () Bool)

(assert (=> d!6323 (arrayNoDuplicates!0 lt!14436 #b00000000000000000000000000000000 Nil!1042)))

(assert (=> d!6323 true))

(declare-fun res!23389 () Unit!963)

(assert (=> d!6323 (= (choose!111 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1042) res!23389)))

(declare-fun bs!1608 () Bool)

(assert (= bs!1608 d!6323))

(assert (=> bs!1608 m!31249))

(assert (=> d!6277 d!6323))

(declare-fun b!38754 () Bool)

(declare-fun e!24615 () Bool)

(declare-fun call!2934 () Bool)

(assert (=> b!38754 (= e!24615 call!2934)))

(declare-fun b!38755 () Bool)

(assert (=> b!38755 (= e!24615 call!2934)))

(declare-fun bm!2931 () Bool)

(declare-fun c!4470 () Bool)

(assert (=> bm!2931 (= call!2934 (arrayNoDuplicates!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4470 (Cons!1041 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4430 (Cons!1041 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) Nil!1042) Nil!1042)) (ite c!4430 (Cons!1041 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) Nil!1042) Nil!1042))))))

(declare-fun b!38756 () Bool)

(declare-fun e!24612 () Bool)

(assert (=> b!38756 (= e!24612 (contains!502 (ite c!4430 (Cons!1041 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) Nil!1042) Nil!1042) (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38757 () Bool)

(declare-fun e!24614 () Bool)

(declare-fun e!24613 () Bool)

(assert (=> b!38757 (= e!24614 e!24613)))

(declare-fun res!23391 () Bool)

(assert (=> b!38757 (=> (not res!23391) (not e!24613))))

(assert (=> b!38757 (= res!23391 (not e!24612))))

(declare-fun res!23392 () Bool)

(assert (=> b!38757 (=> (not res!23392) (not e!24612))))

(assert (=> b!38757 (= res!23392 (validKeyInArray!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6325 () Bool)

(declare-fun res!23390 () Bool)

(assert (=> d!6325 (=> res!23390 e!24614)))

(assert (=> d!6325 (= res!23390 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 lt!14436)))))

(assert (=> d!6325 (= (arrayNoDuplicates!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4430 (Cons!1041 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) Nil!1042) Nil!1042)) e!24614)))

(declare-fun b!38758 () Bool)

(assert (=> b!38758 (= e!24613 e!24615)))

(assert (=> b!38758 (= c!4470 (validKeyInArray!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6325 (not res!23390)) b!38757))

(assert (= (and b!38757 res!23392) b!38756))

(assert (= (and b!38757 res!23391) b!38758))

(assert (= (and b!38758 c!4470) b!38754))

(assert (= (and b!38758 (not c!4470)) b!38755))

(assert (= (or b!38754 b!38755) bm!2931))

(assert (=> bm!2931 m!31411))

(declare-fun m!31423 () Bool)

(assert (=> bm!2931 m!31423))

(assert (=> b!38756 m!31411))

(assert (=> b!38756 m!31411))

(declare-fun m!31425 () Bool)

(assert (=> b!38756 m!31425))

(assert (=> b!38757 m!31411))

(assert (=> b!38757 m!31411))

(assert (=> b!38757 m!31413))

(assert (=> b!38758 m!31411))

(assert (=> b!38758 m!31411))

(assert (=> b!38758 m!31413))

(assert (=> bm!2912 d!6325))

(assert (=> b!38595 d!6317))

(declare-fun d!6327 () Bool)

(assert (=> d!6327 (arrayContainsKey!0 lt!14436 lt!14495 #b00000000000000000000000000000000)))

(declare-fun lt!14549 () Unit!963)

(declare-fun choose!13 (array!2575 (_ BitVec 64) (_ BitVec 32)) Unit!963)

(assert (=> d!6327 (= lt!14549 (choose!13 lt!14436 lt!14495 #b00000000000000000000000000000000))))

(assert (=> d!6327 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6327 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14436 lt!14495 #b00000000000000000000000000000000) lt!14549)))

(declare-fun bs!1609 () Bool)

(assert (= bs!1609 d!6327))

(assert (=> bs!1609 m!31341))

(declare-fun m!31469 () Bool)

(assert (=> bs!1609 m!31469))

(assert (=> b!38659 d!6327))

(declare-fun d!6335 () Bool)

(declare-fun res!23413 () Bool)

(declare-fun e!24644 () Bool)

(assert (=> d!6335 (=> res!23413 e!24644)))

(assert (=> d!6335 (= res!23413 (= (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14495))))

(assert (=> d!6335 (= (arrayContainsKey!0 lt!14436 lt!14495 #b00000000000000000000000000000000) e!24644)))

(declare-fun b!38798 () Bool)

(declare-fun e!24645 () Bool)

(assert (=> b!38798 (= e!24644 e!24645)))

(declare-fun res!23414 () Bool)

(assert (=> b!38798 (=> (not res!23414) (not e!24645))))

(assert (=> b!38798 (= res!23414 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 lt!14436)))))

(declare-fun b!38799 () Bool)

(assert (=> b!38799 (= e!24645 (arrayContainsKey!0 lt!14436 lt!14495 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6335 (not res!23413)) b!38798))

(assert (= (and b!38798 res!23414) b!38799))

(assert (=> d!6335 m!31279))

(declare-fun m!31489 () Bool)

(assert (=> b!38799 m!31489))

(assert (=> b!38659 d!6335))

(declare-fun b!38832 () Bool)

(declare-fun e!24661 () SeekEntryResult!168)

(declare-fun lt!14561 () SeekEntryResult!168)

(assert (=> b!38832 (= e!24661 (MissingZero!168 (index!2796 lt!14561)))))

(declare-fun b!38833 () Bool)

(declare-fun e!24659 () SeekEntryResult!168)

(assert (=> b!38833 (= e!24659 Undefined!168)))

(declare-fun b!38834 () Bool)

(declare-fun e!24660 () SeekEntryResult!168)

(assert (=> b!38834 (= e!24659 e!24660)))

(declare-fun lt!14563 () (_ BitVec 64))

(assert (=> b!38834 (= lt!14563 (select (arr!1231 lt!14436) (index!2796 lt!14561)))))

(declare-fun c!4492 () Bool)

(assert (=> b!38834 (= c!4492 (= lt!14563 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun d!6347 () Bool)

(declare-fun lt!14562 () SeekEntryResult!168)

(assert (=> d!6347 (and (or (is-Undefined!168 lt!14562) (not (is-Found!168 lt!14562)) (and (bvsge (index!2795 lt!14562) #b00000000000000000000000000000000) (bvslt (index!2795 lt!14562) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14562) (is-Found!168 lt!14562) (not (is-MissingZero!168 lt!14562)) (and (bvsge (index!2794 lt!14562) #b00000000000000000000000000000000) (bvslt (index!2794 lt!14562) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14562) (is-Found!168 lt!14562) (is-MissingZero!168 lt!14562) (not (is-MissingVacant!168 lt!14562)) (and (bvsge (index!2797 lt!14562) #b00000000000000000000000000000000) (bvslt (index!2797 lt!14562) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14562) (ite (is-Found!168 lt!14562) (= (select (arr!1231 lt!14436) (index!2795 lt!14562)) (select (arr!1231 lt!14436) #b00000000000000000000000000000000)) (ite (is-MissingZero!168 lt!14562) (= (select (arr!1231 lt!14436) (index!2794 lt!14562)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!168 lt!14562) (= (select (arr!1231 lt!14436) (index!2797 lt!14562)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6347 (= lt!14562 e!24659)))

(declare-fun c!4493 () Bool)

(assert (=> d!6347 (= c!4493 (and (is-Intermediate!168 lt!14561) (undefined!980 lt!14561)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2575 (_ BitVec 32)) SeekEntryResult!168)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6347 (= lt!14561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) mask!853) (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853))))

(assert (=> d!6347 (validMask!0 mask!853)))

(assert (=> d!6347 (= (seekEntryOrOpen!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853) lt!14562)))

(declare-fun b!38835 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2575 (_ BitVec 32)) SeekEntryResult!168)

(assert (=> b!38835 (= e!24661 (seekKeyOrZeroReturnVacant!0 (x!7604 lt!14561) (index!2796 lt!14561) (index!2796 lt!14561) (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853))))

(declare-fun b!38836 () Bool)

(declare-fun c!4494 () Bool)

(assert (=> b!38836 (= c!4494 (= lt!14563 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38836 (= e!24660 e!24661)))

(declare-fun b!38837 () Bool)

(assert (=> b!38837 (= e!24660 (Found!168 (index!2796 lt!14561)))))

(assert (= (and d!6347 c!4493) b!38833))

(assert (= (and d!6347 (not c!4493)) b!38834))

(assert (= (and b!38834 c!4492) b!38837))

(assert (= (and b!38834 (not c!4492)) b!38836))

(assert (= (and b!38836 c!4494) b!38832))

(assert (= (and b!38836 (not c!4494)) b!38835))

(declare-fun m!31499 () Bool)

(assert (=> b!38834 m!31499))

(assert (=> d!6347 m!31279))

(declare-fun m!31501 () Bool)

(assert (=> d!6347 m!31501))

(assert (=> d!6347 m!31501))

(assert (=> d!6347 m!31279))

(declare-fun m!31503 () Bool)

(assert (=> d!6347 m!31503))

(declare-fun m!31505 () Bool)

(assert (=> d!6347 m!31505))

(declare-fun m!31507 () Bool)

(assert (=> d!6347 m!31507))

(declare-fun m!31509 () Bool)

(assert (=> d!6347 m!31509))

(assert (=> d!6347 m!31237))

(assert (=> b!38835 m!31279))

(declare-fun m!31511 () Bool)

(assert (=> b!38835 m!31511))

(assert (=> b!38659 d!6347))

(declare-fun b!38848 () Bool)

(declare-fun res!23436 () Bool)

(declare-fun e!24664 () Bool)

(assert (=> b!38848 (=> (not res!23436) (not e!24664))))

(declare-fun size!1354 (LongMapFixedSize!230) (_ BitVec 32))

(assert (=> b!38848 (= res!23436 (= (size!1354 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!164 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1684 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!38846 () Bool)

(declare-fun res!23435 () Bool)

(assert (=> b!38846 (=> (not res!23435) (not e!24664))))

(assert (=> b!38846 (= res!23435 (and (= (size!1339 (_values!1776 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001)) (= (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1339 (_values!1776 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (_size!164 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (_size!164 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001))))))

(declare-fun b!38849 () Bool)

(assert (=> b!38849 (= e!24664 (and (bvsge (extraKeys!1684 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (extraKeys!1684 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000011) (bvsge (_vacant!164 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000)))))

(declare-fun b!38847 () Bool)

(declare-fun res!23437 () Bool)

(assert (=> b!38847 (=> (not res!23437) (not e!24664))))

(assert (=> b!38847 (= res!23437 (bvsge (size!1354 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_size!164 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun d!6355 () Bool)

(declare-fun res!23438 () Bool)

(assert (=> d!6355 (=> (not res!23438) (not e!24664))))

(assert (=> d!6355 (= res!23438 (validMask!0 (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6355 (= (simpleValid!22 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24664)))

(assert (= (and d!6355 res!23438) b!38846))

(assert (= (and b!38846 res!23435) b!38847))

(assert (= (and b!38847 res!23437) b!38848))

(assert (= (and b!38848 res!23436) b!38849))

(declare-fun m!31513 () Bool)

(assert (=> b!38848 m!31513))

(assert (=> b!38847 m!31513))

(declare-fun m!31515 () Bool)

(assert (=> d!6355 m!31515))

(assert (=> d!6259 d!6355))

(assert (=> b!38596 d!6317))

(assert (=> d!6241 d!6243))

(declare-fun d!6357 () Bool)

(assert (=> d!6357 (= (arrayCountValidKeys!0 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6357 true))

(declare-fun _$88!25 () Unit!963)

(assert (=> d!6357 (= (choose!59 lt!14436 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!25)))

(declare-fun bs!1613 () Bool)

(assert (= bs!1613 d!6357))

(assert (=> bs!1613 m!31239))

(assert (=> d!6241 d!6357))

(assert (=> d!6263 d!6269))

(declare-fun d!6359 () Bool)

(assert (=> d!6359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14436 mask!853)))

(assert (=> d!6359 true))

(declare-fun _$30!39 () Unit!963)

(assert (=> d!6359 (= (choose!34 lt!14436 mask!853 #b00000000000000000000000000000000) _$30!39)))

(declare-fun bs!1614 () Bool)

(assert (= bs!1614 d!6359))

(assert (=> bs!1614 m!31243))

(assert (=> d!6263 d!6359))

(assert (=> d!6263 d!6235))

(declare-fun b!38850 () Bool)

(declare-fun e!24665 () (_ BitVec 32))

(assert (=> b!38850 (= e!24665 #b00000000000000000000000000000000)))

(declare-fun b!38851 () Bool)

(declare-fun e!24666 () (_ BitVec 32))

(assert (=> b!38851 (= e!24665 e!24666)))

(declare-fun c!4495 () Bool)

(assert (=> b!38851 (= c!4495 (validKeyInArray!0 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38852 () Bool)

(declare-fun call!2942 () (_ BitVec 32))

(assert (=> b!38852 (= e!24666 call!2942)))

(declare-fun d!6361 () Bool)

(declare-fun lt!14564 () (_ BitVec 32))

(assert (=> d!6361 (and (bvsge lt!14564 #b00000000000000000000000000000000) (bvsle lt!14564 (bvsub (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> d!6361 (= lt!14564 e!24665)))

(declare-fun c!4496 () Bool)

(assert (=> d!6361 (= c!4496 (bvsge #b00000000000000000000000000000000 (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6361 (and (bvsle #b00000000000000000000000000000000 (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6361 (= (arrayCountValidKeys!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14564)))

(declare-fun bm!2939 () Bool)

(assert (=> bm!2939 (= call!2942 (arrayCountValidKeys!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38853 () Bool)

(assert (=> b!38853 (= e!24666 (bvadd #b00000000000000000000000000000001 call!2942))))

(assert (= (and d!6361 c!4496) b!38850))

(assert (= (and d!6361 (not c!4496)) b!38851))

(assert (= (and b!38851 c!4495) b!38853))

(assert (= (and b!38851 (not c!4495)) b!38852))

(assert (= (or b!38853 b!38852) bm!2939))

(declare-fun m!31517 () Bool)

(assert (=> b!38851 m!31517))

(assert (=> b!38851 m!31517))

(declare-fun m!31519 () Bool)

(assert (=> b!38851 m!31519))

(declare-fun m!31521 () Bool)

(assert (=> bm!2939 m!31521))

(assert (=> b!38627 d!6361))

(declare-fun b!38854 () Bool)

(declare-fun e!24668 () Bool)

(declare-fun e!24667 () Bool)

(assert (=> b!38854 (= e!24668 e!24667)))

(declare-fun lt!14565 () (_ BitVec 64))

(assert (=> b!38854 (= lt!14565 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14566 () Unit!963)

(assert (=> b!38854 (= lt!14566 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14436 lt!14565 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38854 (arrayContainsKey!0 lt!14436 lt!14565 #b00000000000000000000000000000000)))

(declare-fun lt!14567 () Unit!963)

(assert (=> b!38854 (= lt!14567 lt!14566)))

(declare-fun res!23439 () Bool)

(assert (=> b!38854 (= res!23439 (= (seekEntryOrOpen!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14436 mask!853) (Found!168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38854 (=> (not res!23439) (not e!24667))))

(declare-fun b!38855 () Bool)

(declare-fun call!2943 () Bool)

(assert (=> b!38855 (= e!24668 call!2943)))

(declare-fun d!6363 () Bool)

(declare-fun res!23440 () Bool)

(declare-fun e!24669 () Bool)

(assert (=> d!6363 (=> res!23440 e!24669)))

(assert (=> d!6363 (= res!23440 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 lt!14436)))))

(assert (=> d!6363 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14436 mask!853) e!24669)))

(declare-fun b!38856 () Bool)

(assert (=> b!38856 (= e!24667 call!2943)))

(declare-fun b!38857 () Bool)

(assert (=> b!38857 (= e!24669 e!24668)))

(declare-fun c!4497 () Bool)

(assert (=> b!38857 (= c!4497 (validKeyInArray!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2940 () Bool)

(assert (=> bm!2940 (= call!2943 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14436 mask!853))))

(assert (= (and d!6363 (not res!23440)) b!38857))

(assert (= (and b!38857 c!4497) b!38854))

(assert (= (and b!38857 (not c!4497)) b!38855))

(assert (= (and b!38854 res!23439) b!38856))

(assert (= (or b!38856 b!38855) bm!2940))

(assert (=> b!38854 m!31411))

(declare-fun m!31523 () Bool)

(assert (=> b!38854 m!31523))

(declare-fun m!31525 () Bool)

(assert (=> b!38854 m!31525))

(assert (=> b!38854 m!31411))

(declare-fun m!31527 () Bool)

(assert (=> b!38854 m!31527))

(assert (=> b!38857 m!31411))

(assert (=> b!38857 m!31411))

(assert (=> b!38857 m!31413))

(declare-fun m!31529 () Bool)

(assert (=> bm!2940 m!31529))

(assert (=> bm!2924 d!6363))

(declare-fun b!38858 () Bool)

(declare-fun e!24673 () Bool)

(declare-fun call!2944 () Bool)

(assert (=> b!38858 (= e!24673 call!2944)))

(declare-fun b!38859 () Bool)

(assert (=> b!38859 (= e!24673 call!2944)))

(declare-fun bm!2941 () Bool)

(declare-fun c!4498 () Bool)

(assert (=> bm!2941 (= call!2944 (arrayNoDuplicates!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4498 (Cons!1041 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1042) Nil!1042)))))

(declare-fun b!38860 () Bool)

(declare-fun e!24670 () Bool)

(assert (=> b!38860 (= e!24670 (contains!502 Nil!1042 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38861 () Bool)

(declare-fun e!24672 () Bool)

(declare-fun e!24671 () Bool)

(assert (=> b!38861 (= e!24672 e!24671)))

(declare-fun res!23442 () Bool)

(assert (=> b!38861 (=> (not res!23442) (not e!24671))))

(assert (=> b!38861 (= res!23442 (not e!24670))))

(declare-fun res!23443 () Bool)

(assert (=> b!38861 (=> (not res!23443) (not e!24670))))

(assert (=> b!38861 (= res!23443 (validKeyInArray!0 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun d!6365 () Bool)

(declare-fun res!23441 () Bool)

(assert (=> d!6365 (=> res!23441 e!24672)))

(assert (=> d!6365 (= res!23441 (bvsge #b00000000000000000000000000000000 (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6365 (= (arrayNoDuplicates!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1042) e!24672)))

(declare-fun b!38862 () Bool)

(assert (=> b!38862 (= e!24671 e!24673)))

(assert (=> b!38862 (= c!4498 (validKeyInArray!0 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6365 (not res!23441)) b!38861))

(assert (= (and b!38861 res!23443) b!38860))

(assert (= (and b!38861 res!23442) b!38862))

(assert (= (and b!38862 c!4498) b!38858))

(assert (= (and b!38862 (not c!4498)) b!38859))

(assert (= (or b!38858 b!38859) bm!2941))

(assert (=> bm!2941 m!31517))

(declare-fun m!31531 () Bool)

(assert (=> bm!2941 m!31531))

(assert (=> b!38860 m!31517))

(assert (=> b!38860 m!31517))

(declare-fun m!31533 () Bool)

(assert (=> b!38860 m!31533))

(assert (=> b!38861 m!31517))

(assert (=> b!38861 m!31517))

(assert (=> b!38861 m!31519))

(assert (=> b!38862 m!31517))

(assert (=> b!38862 m!31517))

(assert (=> b!38862 m!31519))

(assert (=> b!38629 d!6365))

(assert (=> b!38662 d!6317))

(declare-fun b!38863 () Bool)

(declare-fun e!24675 () Bool)

(declare-fun e!24674 () Bool)

(assert (=> b!38863 (= e!24675 e!24674)))

(declare-fun lt!14568 () (_ BitVec 64))

(assert (=> b!38863 (= lt!14568 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!14569 () Unit!963)

(assert (=> b!38863 (= lt!14569 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14568 #b00000000000000000000000000000000))))

(assert (=> b!38863 (arrayContainsKey!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14568 #b00000000000000000000000000000000)))

(declare-fun lt!14570 () Unit!963)

(assert (=> b!38863 (= lt!14570 lt!14569)))

(declare-fun res!23444 () Bool)

(assert (=> b!38863 (= res!23444 (= (seekEntryOrOpen!0 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!168 #b00000000000000000000000000000000)))))

(assert (=> b!38863 (=> (not res!23444) (not e!24674))))

(declare-fun b!38864 () Bool)

(declare-fun call!2945 () Bool)

(assert (=> b!38864 (= e!24675 call!2945)))

(declare-fun d!6367 () Bool)

(declare-fun res!23445 () Bool)

(declare-fun e!24676 () Bool)

(assert (=> d!6367 (=> res!23445 e!24676)))

(assert (=> d!6367 (= res!23445 (bvsge #b00000000000000000000000000000000 (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6367 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24676)))

(declare-fun b!38865 () Bool)

(assert (=> b!38865 (= e!24674 call!2945)))

(declare-fun b!38866 () Bool)

(assert (=> b!38866 (= e!24676 e!24675)))

(declare-fun c!4499 () Bool)

(assert (=> b!38866 (= c!4499 (validKeyInArray!0 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun bm!2942 () Bool)

(assert (=> bm!2942 (= call!2945 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6367 (not res!23445)) b!38866))

(assert (= (and b!38866 c!4499) b!38863))

(assert (= (and b!38866 (not c!4499)) b!38864))

(assert (= (and b!38863 res!23444) b!38865))

(assert (= (or b!38865 b!38864) bm!2942))

(assert (=> b!38863 m!31517))

(declare-fun m!31535 () Bool)

(assert (=> b!38863 m!31535))

(declare-fun m!31537 () Bool)

(assert (=> b!38863 m!31537))

(assert (=> b!38863 m!31517))

(declare-fun m!31539 () Bool)

(assert (=> b!38863 m!31539))

(assert (=> b!38866 m!31517))

(assert (=> b!38866 m!31517))

(assert (=> b!38866 m!31519))

(declare-fun m!31541 () Bool)

(assert (=> bm!2942 m!31541))

(assert (=> b!38628 d!6367))

(push 1)

(assert b_and!2325)

(assert (not b!38753))

(assert (not b_next!1355))

(assert (not b!38799))

(assert (not b!38854))

(assert (not b!38861))

(assert (not b!38758))

(assert (not b!38860))

(assert (not bm!2931))

(assert (not d!6347))

(assert (not bm!2939))

(assert (not b!38857))

(assert (not d!6359))

(assert (not d!6327))

(assert (not b!38851))

(assert (not d!6321))

(assert (not d!6323))

(assert (not b_lambda!2015))

(assert (not bm!2941))

(assert (not b!38835))

(assert (not b!38866))

(assert (not b!38756))

(assert (not bm!2930))

(assert (not d!6357))

(assert (not b!38848))

(assert (not bm!2940))

(assert (not bm!2942))

(assert (not d!6355))

(assert (not b!38721))

(assert tp_is_empty!1745)

(assert (not b!38862))

(assert (not b!38863))

(assert (not b!38757))

(assert (not b!38847))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2325)

(assert (not b_next!1355))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6465 () Bool)

(assert (not d!6465))

(assert (=> b!38753 d!6465))

(declare-fun d!6467 () Bool)

(assert (=> d!6467 (= (validMask!0 (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (and (or (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000001111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000011111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000001111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000011111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000001111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000011111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000001111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000011111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000001111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000011111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000001111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000011111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000001111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000011111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000111111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000001111111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000011111111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000111111111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00001111111111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00011111111111111111111111111111) (= (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)) (bvsle (mask!5114 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)))))

(assert (=> d!6355 d!6467))

(declare-fun d!6469 () Bool)

(assert (=> d!6469 (= (validKeyInArray!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38721 d!6469))

(declare-fun b!39053 () Bool)

(declare-fun e!24793 () (_ BitVec 32))

(assert (=> b!39053 (= e!24793 #b00000000000000000000000000000000)))

(declare-fun b!39054 () Bool)

(declare-fun e!24794 () (_ BitVec 32))

(assert (=> b!39054 (= e!24793 e!24794)))

(declare-fun c!4564 () Bool)

(assert (=> b!39054 (= c!4564 (validKeyInArray!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39055 () Bool)

(declare-fun call!2958 () (_ BitVec 32))

(assert (=> b!39055 (= e!24794 call!2958)))

(declare-fun d!6471 () Bool)

(declare-fun lt!14641 () (_ BitVec 32))

(assert (=> d!6471 (and (bvsge lt!14641 #b00000000000000000000000000000000) (bvsle lt!14641 (bvsub (size!1338 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6471 (= lt!14641 e!24793)))

(declare-fun c!4565 () Bool)

(assert (=> d!6471 (= c!4565 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6471 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1338 lt!14436)))))

(assert (=> d!6471 (= (arrayCountValidKeys!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14641)))

(declare-fun bm!2955 () Bool)

(assert (=> bm!2955 (= call!2958 (arrayCountValidKeys!0 lt!14436 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39056 () Bool)

(assert (=> b!39056 (= e!24794 (bvadd #b00000000000000000000000000000001 call!2958))))

(assert (= (and d!6471 c!4565) b!39053))

(assert (= (and d!6471 (not c!4565)) b!39054))

(assert (= (and b!39054 c!4564) b!39056))

(assert (= (and b!39054 (not c!4564)) b!39055))

(assert (= (or b!39056 b!39055) bm!2955))

(declare-fun m!31743 () Bool)

(assert (=> b!39054 m!31743))

(assert (=> b!39054 m!31743))

(declare-fun m!31745 () Bool)

(assert (=> b!39054 m!31745))

(declare-fun m!31747 () Bool)

(assert (=> bm!2955 m!31747))

(assert (=> bm!2930 d!6471))

(declare-fun b!39069 () Bool)

(declare-fun e!24803 () SeekEntryResult!168)

(declare-fun e!24801 () SeekEntryResult!168)

(assert (=> b!39069 (= e!24803 e!24801)))

(declare-fun c!4573 () Bool)

(declare-fun lt!14649 () (_ BitVec 64))

(assert (=> b!39069 (= c!4573 (= lt!14649 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun e!24802 () SeekEntryResult!168)

(declare-fun b!39071 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39071 (= e!24802 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7604 lt!14561) #b00000000000000000000000000000001) (nextIndex!0 (index!2796 lt!14561) (x!7604 lt!14561) mask!853) (index!2796 lt!14561) (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853))))

(declare-fun b!39072 () Bool)

(declare-fun c!4572 () Bool)

(assert (=> b!39072 (= c!4572 (= lt!14649 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39072 (= e!24801 e!24802)))

(declare-fun b!39073 () Bool)

(assert (=> b!39073 (= e!24802 (MissingVacant!168 (index!2796 lt!14561)))))

(declare-fun b!39074 () Bool)

(assert (=> b!39074 (= e!24803 Undefined!168)))

(declare-fun b!39070 () Bool)

(assert (=> b!39070 (= e!24801 (Found!168 (index!2796 lt!14561)))))

(declare-fun d!6473 () Bool)

(declare-fun lt!14648 () SeekEntryResult!168)

(assert (=> d!6473 (and (or (is-Undefined!168 lt!14648) (not (is-Found!168 lt!14648)) (and (bvsge (index!2795 lt!14648) #b00000000000000000000000000000000) (bvslt (index!2795 lt!14648) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14648) (is-Found!168 lt!14648) (not (is-MissingVacant!168 lt!14648)) (not (= (index!2797 lt!14648) (index!2796 lt!14561))) (and (bvsge (index!2797 lt!14648) #b00000000000000000000000000000000) (bvslt (index!2797 lt!14648) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14648) (ite (is-Found!168 lt!14648) (= (select (arr!1231 lt!14436) (index!2795 lt!14648)) (select (arr!1231 lt!14436) #b00000000000000000000000000000000)) (and (is-MissingVacant!168 lt!14648) (= (index!2797 lt!14648) (index!2796 lt!14561)) (= (select (arr!1231 lt!14436) (index!2797 lt!14648)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6473 (= lt!14648 e!24803)))

(declare-fun c!4574 () Bool)

(assert (=> d!6473 (= c!4574 (bvsge (x!7604 lt!14561) #b01111111111111111111111111111110))))

(assert (=> d!6473 (= lt!14649 (select (arr!1231 lt!14436) (index!2796 lt!14561)))))

(assert (=> d!6473 (validMask!0 mask!853)))

(assert (=> d!6473 (= (seekKeyOrZeroReturnVacant!0 (x!7604 lt!14561) (index!2796 lt!14561) (index!2796 lt!14561) (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853) lt!14648)))

(assert (= (and d!6473 c!4574) b!39074))

(assert (= (and d!6473 (not c!4574)) b!39069))

(assert (= (and b!39069 c!4573) b!39070))

(assert (= (and b!39069 (not c!4573)) b!39072))

(assert (= (and b!39072 c!4572) b!39073))

(assert (= (and b!39072 (not c!4572)) b!39071))

(declare-fun m!31749 () Bool)

(assert (=> b!39071 m!31749))

(assert (=> b!39071 m!31749))

(assert (=> b!39071 m!31279))

(declare-fun m!31751 () Bool)

(assert (=> b!39071 m!31751))

(declare-fun m!31753 () Bool)

(assert (=> d!6473 m!31753))

(declare-fun m!31755 () Bool)

(assert (=> d!6473 m!31755))

(assert (=> d!6473 m!31499))

(assert (=> d!6473 m!31237))

(assert (=> b!38835 d!6473))

(declare-fun d!6479 () Bool)

(assert (=> d!6479 (arrayContainsKey!0 lt!14436 lt!14565 #b00000000000000000000000000000000)))

(declare-fun lt!14650 () Unit!963)

(assert (=> d!6479 (= lt!14650 (choose!13 lt!14436 lt!14565 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6479 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6479 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14436 lt!14565 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14650)))

(declare-fun bs!1621 () Bool)

(assert (= bs!1621 d!6479))

(assert (=> bs!1621 m!31525))

(declare-fun m!31757 () Bool)

(assert (=> bs!1621 m!31757))

(assert (=> b!38854 d!6479))

(declare-fun d!6481 () Bool)

(declare-fun res!23506 () Bool)

(declare-fun e!24804 () Bool)

(assert (=> d!6481 (=> res!23506 e!24804)))

(assert (=> d!6481 (= res!23506 (= (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14565))))

(assert (=> d!6481 (= (arrayContainsKey!0 lt!14436 lt!14565 #b00000000000000000000000000000000) e!24804)))

(declare-fun b!39075 () Bool)

(declare-fun e!24805 () Bool)

(assert (=> b!39075 (= e!24804 e!24805)))

(declare-fun res!23507 () Bool)

(assert (=> b!39075 (=> (not res!23507) (not e!24805))))

(assert (=> b!39075 (= res!23507 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 lt!14436)))))

(declare-fun b!39076 () Bool)

(assert (=> b!39076 (= e!24805 (arrayContainsKey!0 lt!14436 lt!14565 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6481 (not res!23506)) b!39075))

(assert (= (and b!39075 res!23507) b!39076))

(assert (=> d!6481 m!31279))

(declare-fun m!31759 () Bool)

(assert (=> b!39076 m!31759))

(assert (=> b!38854 d!6481))

(declare-fun b!39077 () Bool)

(declare-fun e!24808 () SeekEntryResult!168)

(declare-fun lt!14651 () SeekEntryResult!168)

(assert (=> b!39077 (= e!24808 (MissingZero!168 (index!2796 lt!14651)))))

(declare-fun b!39078 () Bool)

(declare-fun e!24806 () SeekEntryResult!168)

(assert (=> b!39078 (= e!24806 Undefined!168)))

(declare-fun b!39079 () Bool)

(declare-fun e!24807 () SeekEntryResult!168)

(assert (=> b!39079 (= e!24806 e!24807)))

(declare-fun lt!14653 () (_ BitVec 64))

(assert (=> b!39079 (= lt!14653 (select (arr!1231 lt!14436) (index!2796 lt!14651)))))

(declare-fun c!4575 () Bool)

(assert (=> b!39079 (= c!4575 (= lt!14653 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6483 () Bool)

(declare-fun lt!14652 () SeekEntryResult!168)

(assert (=> d!6483 (and (or (is-Undefined!168 lt!14652) (not (is-Found!168 lt!14652)) (and (bvsge (index!2795 lt!14652) #b00000000000000000000000000000000) (bvslt (index!2795 lt!14652) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14652) (is-Found!168 lt!14652) (not (is-MissingZero!168 lt!14652)) (and (bvsge (index!2794 lt!14652) #b00000000000000000000000000000000) (bvslt (index!2794 lt!14652) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14652) (is-Found!168 lt!14652) (is-MissingZero!168 lt!14652) (not (is-MissingVacant!168 lt!14652)) (and (bvsge (index!2797 lt!14652) #b00000000000000000000000000000000) (bvslt (index!2797 lt!14652) (size!1338 lt!14436)))) (or (is-Undefined!168 lt!14652) (ite (is-Found!168 lt!14652) (= (select (arr!1231 lt!14436) (index!2795 lt!14652)) (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite (is-MissingZero!168 lt!14652) (= (select (arr!1231 lt!14436) (index!2794 lt!14652)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!168 lt!14652) (= (select (arr!1231 lt!14436) (index!2797 lt!14652)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6483 (= lt!14652 e!24806)))

(declare-fun c!4576 () Bool)

(assert (=> d!6483 (= c!4576 (and (is-Intermediate!168 lt!14651) (undefined!980 lt!14651)))))

(assert (=> d!6483 (= lt!14651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14436 mask!853))))

(assert (=> d!6483 (validMask!0 mask!853)))

(assert (=> d!6483 (= (seekEntryOrOpen!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14436 mask!853) lt!14652)))

(declare-fun b!39080 () Bool)

(assert (=> b!39080 (= e!24808 (seekKeyOrZeroReturnVacant!0 (x!7604 lt!14651) (index!2796 lt!14651) (index!2796 lt!14651) (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14436 mask!853))))

(declare-fun b!39081 () Bool)

(declare-fun c!4577 () Bool)

(assert (=> b!39081 (= c!4577 (= lt!14653 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39081 (= e!24807 e!24808)))

(declare-fun b!39082 () Bool)

(assert (=> b!39082 (= e!24807 (Found!168 (index!2796 lt!14651)))))

(assert (= (and d!6483 c!4576) b!39078))

(assert (= (and d!6483 (not c!4576)) b!39079))

(assert (= (and b!39079 c!4575) b!39082))

(assert (= (and b!39079 (not c!4575)) b!39081))

(assert (= (and b!39081 c!4577) b!39077))

(assert (= (and b!39081 (not c!4577)) b!39080))

(declare-fun m!31761 () Bool)

(assert (=> b!39079 m!31761))

(assert (=> d!6483 m!31411))

(declare-fun m!31763 () Bool)

(assert (=> d!6483 m!31763))

(assert (=> d!6483 m!31763))

(assert (=> d!6483 m!31411))

(declare-fun m!31765 () Bool)

(assert (=> d!6483 m!31765))

(declare-fun m!31767 () Bool)

(assert (=> d!6483 m!31767))

(declare-fun m!31769 () Bool)

(assert (=> d!6483 m!31769))

(declare-fun m!31771 () Bool)

(assert (=> d!6483 m!31771))

(assert (=> d!6483 m!31237))

(assert (=> b!39080 m!31411))

(declare-fun m!31773 () Bool)

(assert (=> b!39080 m!31773))

(assert (=> b!38854 d!6483))

(declare-fun d!6485 () Bool)

(assert (=> d!6485 (= (validKeyInArray!0 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38851 d!6485))

(declare-fun b!39083 () Bool)

(declare-fun e!24809 () (_ BitVec 32))

(assert (=> b!39083 (= e!24809 #b00000000000000000000000000000000)))

(declare-fun b!39084 () Bool)

(declare-fun e!24810 () (_ BitVec 32))

(assert (=> b!39084 (= e!24809 e!24810)))

(declare-fun c!4578 () Bool)

(assert (=> b!39084 (= c!4578 (validKeyInArray!0 (select (arr!1231 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39085 () Bool)

(declare-fun call!2959 () (_ BitVec 32))

(assert (=> b!39085 (= e!24810 call!2959)))

(declare-fun lt!14654 () (_ BitVec 32))

(declare-fun d!6487 () Bool)

(assert (=> d!6487 (and (bvsge lt!14654 #b00000000000000000000000000000000) (bvsle lt!14654 (bvsub (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6487 (= lt!14654 e!24809)))

(declare-fun c!4579 () Bool)

(assert (=> d!6487 (= c!4579 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6487 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6487 (= (arrayCountValidKeys!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14654)))

(declare-fun bm!2956 () Bool)

(assert (=> bm!2956 (= call!2959 (arrayCountValidKeys!0 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1338 (_keys!3246 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!39086 () Bool)

(assert (=> b!39086 (= e!24810 (bvadd #b00000000000000000000000000000001 call!2959))))

(assert (= (and d!6487 c!4579) b!39083))

(assert (= (and d!6487 (not c!4579)) b!39084))

(assert (= (and b!39084 c!4578) b!39086))

(assert (= (and b!39084 (not c!4578)) b!39085))

(assert (= (or b!39086 b!39085) bm!2956))

(declare-fun m!31775 () Bool)

(assert (=> b!39084 m!31775))

(assert (=> b!39084 m!31775))

(declare-fun m!31777 () Bool)

(assert (=> b!39084 m!31777))

(declare-fun m!31779 () Bool)

(assert (=> bm!2956 m!31779))

(assert (=> bm!2939 d!6487))

(assert (=> d!6359 d!6269))

(declare-fun b!39105 () Bool)

(declare-fun e!24821 () SeekEntryResult!168)

(assert (=> b!39105 (= e!24821 (Intermediate!168 false (toIndex!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39106 () Bool)

(declare-fun e!24825 () Bool)

(declare-fun e!24823 () Bool)

(assert (=> b!39106 (= e!24825 e!24823)))

(declare-fun res!23515 () Bool)

(declare-fun lt!14660 () SeekEntryResult!168)

(assert (=> b!39106 (= res!23515 (and (is-Intermediate!168 lt!14660) (not (undefined!980 lt!14660)) (bvslt (x!7604 lt!14660) #b01111111111111111111111111111110) (bvsge (x!7604 lt!14660) #b00000000000000000000000000000000) (bvsge (x!7604 lt!14660) #b00000000000000000000000000000000)))))

(assert (=> b!39106 (=> (not res!23515) (not e!24823))))

(declare-fun b!39107 () Bool)

(assert (=> b!39107 (and (bvsge (index!2796 lt!14660) #b00000000000000000000000000000000) (bvslt (index!2796 lt!14660) (size!1338 lt!14436)))))

(declare-fun res!23516 () Bool)

(assert (=> b!39107 (= res!23516 (= (select (arr!1231 lt!14436) (index!2796 lt!14660)) (select (arr!1231 lt!14436) #b00000000000000000000000000000000)))))

(declare-fun e!24822 () Bool)

(assert (=> b!39107 (=> res!23516 e!24822)))

(assert (=> b!39107 (= e!24823 e!24822)))

(declare-fun b!39108 () Bool)

(assert (=> b!39108 (and (bvsge (index!2796 lt!14660) #b00000000000000000000000000000000) (bvslt (index!2796 lt!14660) (size!1338 lt!14436)))))

(assert (=> b!39108 (= e!24822 (= (select (arr!1231 lt!14436) (index!2796 lt!14660)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39109 () Bool)

(assert (=> b!39109 (= e!24821 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853))))

(declare-fun b!39110 () Bool)

(declare-fun e!24824 () SeekEntryResult!168)

(assert (=> b!39110 (= e!24824 (Intermediate!168 true (toIndex!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39111 () Bool)

(assert (=> b!39111 (= e!24824 e!24821)))

(declare-fun c!4587 () Bool)

(declare-fun lt!14659 () (_ BitVec 64))

(assert (=> b!39111 (= c!4587 (or (= lt!14659 (select (arr!1231 lt!14436) #b00000000000000000000000000000000)) (= (bvadd lt!14659 lt!14659) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!6489 () Bool)

(assert (=> d!6489 e!24825))

(declare-fun c!4586 () Bool)

(assert (=> d!6489 (= c!4586 (and (is-Intermediate!168 lt!14660) (undefined!980 lt!14660)))))

(assert (=> d!6489 (= lt!14660 e!24824)))

(declare-fun c!4588 () Bool)

(assert (=> d!6489 (= c!4588 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6489 (= lt!14659 (select (arr!1231 lt!14436) (toIndex!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6489 (validMask!0 mask!853)))

(assert (=> d!6489 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) mask!853) (select (arr!1231 lt!14436) #b00000000000000000000000000000000) lt!14436 mask!853) lt!14660)))

(declare-fun b!39112 () Bool)

(assert (=> b!39112 (= e!24825 (bvsge (x!7604 lt!14660) #b01111111111111111111111111111110))))

(declare-fun b!39113 () Bool)

(assert (=> b!39113 (and (bvsge (index!2796 lt!14660) #b00000000000000000000000000000000) (bvslt (index!2796 lt!14660) (size!1338 lt!14436)))))

(declare-fun res!23514 () Bool)

(assert (=> b!39113 (= res!23514 (= (select (arr!1231 lt!14436) (index!2796 lt!14660)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39113 (=> res!23514 e!24822)))

(assert (= (and d!6489 c!4588) b!39110))

(assert (= (and d!6489 (not c!4588)) b!39111))

(assert (= (and b!39111 c!4587) b!39105))

(assert (= (and b!39111 (not c!4587)) b!39109))

(assert (= (and d!6489 c!4586) b!39112))

(assert (= (and d!6489 (not c!4586)) b!39106))

(assert (= (and b!39106 res!23515) b!39107))

(assert (= (and b!39107 (not res!23516)) b!39113))

(assert (= (and b!39113 (not res!23514)) b!39108))

(declare-fun m!31781 () Bool)

(assert (=> b!39108 m!31781))

(assert (=> d!6489 m!31501))

(declare-fun m!31783 () Bool)

(assert (=> d!6489 m!31783))

(assert (=> d!6489 m!31237))

(assert (=> b!39109 m!31501))

(declare-fun m!31785 () Bool)

(assert (=> b!39109 m!31785))

(assert (=> b!39109 m!31785))

(assert (=> b!39109 m!31279))

(declare-fun m!31787 () Bool)

(assert (=> b!39109 m!31787))

(assert (=> b!39113 m!31781))

(assert (=> b!39107 m!31781))

(assert (=> d!6347 d!6489))

(declare-fun d!6491 () Bool)

(declare-fun lt!14666 () (_ BitVec 32))

(declare-fun lt!14665 () (_ BitVec 32))

(assert (=> d!6491 (= lt!14666 (bvmul (bvxor lt!14665 (bvlshr lt!14665 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6491 (= lt!14665 ((_ extract 31 0) (bvand (bvxor (select (arr!1231 lt!14436) #b00000000000000000000000000000000) (bvlshr (select (arr!1231 lt!14436) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6491 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23517 (let ((h!1612 ((_ extract 31 0) (bvand (bvxor (select (arr!1231 lt!14436) #b00000000000000000000000000000000) (bvlshr (select (arr!1231 lt!14436) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7621 (bvmul (bvxor h!1612 (bvlshr h!1612 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7621 (bvlshr x!7621 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23517 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23517 #b00000000000000000000000000000000))))))

(assert (=> d!6491 (= (toIndex!0 (select (arr!1231 lt!14436) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!14666 (bvlshr lt!14666 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6347 d!6491))

(assert (=> d!6347 d!6235))

(declare-fun d!6493 () Bool)

(assert (=> d!6493 (= (size!1354 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!164 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1684 (LongMapFixedSize!231 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14438 lt!14438 #b00000000000000000000000000000000 lt!14436 (array!2578 ((as const (Array (_ BitVec 32) ValueCell!625)) EmptyCell!625) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!38848 d!6493))

(declare-fun b!39114 () Bool)

(declare-fun e!24827 () Bool)

(declare-fun e!24826 () Bool)

(assert (=> b!39114 (= e!24827 e!24826)))

(declare-fun lt!14667 () (_ BitVec 64))

(assert (=> b!39114 (= lt!14667 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!14668 () Unit!963)

(assert (=> b!39114 (= lt!14668 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14436 lt!14667 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!39114 (arrayContainsKey!0 lt!14436 lt!14667 #b00000000000000000000000000000000)))

(declare-fun lt!14669 () Unit!963)

(assert (=> b!39114 (= lt!14669 lt!14668)))

(declare-fun res!23518 () Bool)

(assert (=> b!39114 (= res!23518 (= (seekEntryOrOpen!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14436 mask!853) (Found!168 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!39114 (=> (not res!23518) (not e!24826))))

(declare-fun b!39115 () Bool)

(declare-fun call!2960 () Bool)

(assert (=> b!39115 (= e!24827 call!2960)))

(declare-fun d!6495 () Bool)

(declare-fun res!23519 () Bool)

(declare-fun e!24828 () Bool)

(assert (=> d!6495 (=> res!23519 e!24828)))

(assert (=> d!6495 (= res!23519 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1338 lt!14436)))))

(assert (=> d!6495 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14436 mask!853) e!24828)))

(declare-fun b!39116 () Bool)

(assert (=> b!39116 (= e!24826 call!2960)))

(declare-fun b!39117 () Bool)

(assert (=> b!39117 (= e!24828 e!24827)))

(declare-fun c!4589 () Bool)

(assert (=> b!39117 (= c!4589 (validKeyInArray!0 (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!2957 () Bool)

(assert (=> bm!2957 (= call!2960 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14436 mask!853))))

(assert (= (and d!6495 (not res!23519)) b!39117))

(assert (= (and b!39117 c!4589) b!39114))

(assert (= (and b!39117 (not c!4589)) b!39115))

(assert (= (and b!39114 res!23518) b!39116))

(assert (= (or b!39116 b!39115) bm!2957))

(assert (=> b!39114 m!31743))

(declare-fun m!31789 () Bool)

(assert (=> b!39114 m!31789))

(declare-fun m!31791 () Bool)

(assert (=> b!39114 m!31791))

(assert (=> b!39114 m!31743))

(declare-fun m!31793 () Bool)

(assert (=> b!39114 m!31793))

(assert (=> b!39117 m!31743))

(assert (=> b!39117 m!31743))

(assert (=> b!39117 m!31745))

(declare-fun m!31795 () Bool)

(assert (=> bm!2957 m!31795))

(assert (=> bm!2940 d!6495))

(declare-fun d!6497 () Bool)

(declare-fun res!23520 () Bool)

(declare-fun e!24829 () Bool)

(assert (=> d!6497 (=> res!23520 e!24829)))

(assert (=> d!6497 (= res!23520 (= (select (arr!1231 lt!14436) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14495))))

(assert (=> d!6497 (= (arrayContainsKey!0 lt!14436 lt!14495 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!24829)))

(declare-fun b!39118 () Bool)

(declare-fun e!24830 () Bool)

(assert (=> b!39118 (= e!24829 e!24830)))

(declare-fun res!23521 () Bool)

(assert (=> b!39118 (=> (not res!23521) (not e!24830))))

(assert (=> b!39118 (= res!23521 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1338 lt!14436)))))

(declare-fun b!39119 () Bool)

(assert (=> b!39119 (= e!24830 (arrayContainsKey!0 lt!14436 lt!14495 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6497 (not res!23520)) b!39118))

(assert (= (and b!39118 res!23521) b!39119))

(assert (=> d!6497 m!31411))

(declare-fun m!31797 () Bool)

(assert (=> b!39119 m!31797))

