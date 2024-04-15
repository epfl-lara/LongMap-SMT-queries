; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5360 () Bool)

(assert start!5360)

(declare-fun b_free!1351 () Bool)

(declare-fun b_next!1351 () Bool)

(assert (=> start!5360 (= b_free!1351 (not b_next!1351))))

(declare-fun tp!5714 () Bool)

(declare-fun b_and!2317 () Bool)

(assert (=> start!5360 (= tp!5714 b_and!2317)))

(declare-fun res!23239 () Bool)

(declare-fun e!24426 () Bool)

(assert (=> start!5360 (=> (not res!23239) (not e!24426))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5360 (= res!23239 (validMask!0 mask!853))))

(assert (=> start!5360 e!24426))

(assert (=> start!5360 true))

(assert (=> start!5360 tp!5714))

(declare-datatypes ((array!2541 0))(
  ( (array!2542 (arr!1214 (Array (_ BitVec 32) (_ BitVec 64))) (size!1321 (_ BitVec 32))) )
))
(declare-fun lt!14401 () array!2541)

(declare-fun defaultEntry!470 () Int)

(declare-fun b!38467 () Bool)

(declare-datatypes ((V!2081 0))(
  ( (V!2082 (val!909 Int)) )
))
(declare-fun lt!14403 () V!2081)

(declare-datatypes ((ValueCell!623 0))(
  ( (ValueCellFull!623 (v!1976 V!2081)) (EmptyCell!623) )
))
(declare-datatypes ((array!2543 0))(
  ( (array!2544 (arr!1215 (Array (_ BitVec 32) ValueCell!623)) (size!1322 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!226 0))(
  ( (LongMapFixedSize!227 (defaultEntry!1791 Int) (mask!5112 (_ BitVec 32)) (extraKeys!1682 (_ BitVec 32)) (zeroValue!1709 V!2081) (minValue!1709 V!2081) (_size!162 (_ BitVec 32)) (_keys!3244 array!2541) (_values!1774 array!2543) (_vacant!162 (_ BitVec 32))) )
))
(declare-fun valid!122 (LongMapFixedSize!226) Bool)

(assert (=> b!38467 (= e!24426 (not (valid!122 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1036 0))(
  ( (Nil!1033) (Cons!1032 (h!1600 (_ BitVec 64)) (t!3870 List!1036)) )
))
(declare-fun arrayNoDuplicates!0 (array!2541 (_ BitVec 32) List!1036) Bool)

(assert (=> b!38467 (arrayNoDuplicates!0 lt!14401 #b00000000000000000000000000000000 Nil!1033)))

(declare-datatypes ((Unit!960 0))(
  ( (Unit!961) )
))
(declare-fun lt!14405 () Unit!960)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2541 (_ BitVec 32) (_ BitVec 32) List!1036) Unit!960)

(assert (=> b!38467 (= lt!14405 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2541 (_ BitVec 32)) Bool)

(assert (=> b!38467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14401 mask!853)))

(declare-fun lt!14404 () Unit!960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2541 (_ BitVec 32) (_ BitVec 32)) Unit!960)

(assert (=> b!38467 (= lt!14404 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14401 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2541 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38467 (= (arrayCountValidKeys!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14402 () Unit!960)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2541 (_ BitVec 32) (_ BitVec 32)) Unit!960)

(assert (=> b!38467 (= lt!14402 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38467 (= lt!14401 (array!2542 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!183 (Int (_ BitVec 64)) V!2081)

(assert (=> b!38467 (= lt!14403 (dynLambda!183 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5360 res!23239) b!38467))

(declare-fun b_lambda!2013 () Bool)

(assert (=> (not b_lambda!2013) (not b!38467)))

(declare-fun t!3869 () Bool)

(declare-fun tb!821 () Bool)

(assert (=> (and start!5360 (= defaultEntry!470 defaultEntry!470) t!3869) tb!821))

(declare-fun result!1405 () Bool)

(declare-fun tp_is_empty!1741 () Bool)

(assert (=> tb!821 (= result!1405 tp_is_empty!1741)))

(assert (=> b!38467 t!3869))

(declare-fun b_and!2319 () Bool)

(assert (= b_and!2317 (and (=> t!3869 result!1405) b_and!2319)))

(declare-fun m!31157 () Bool)

(assert (=> start!5360 m!31157))

(declare-fun m!31159 () Bool)

(assert (=> b!38467 m!31159))

(declare-fun m!31161 () Bool)

(assert (=> b!38467 m!31161))

(declare-fun m!31163 () Bool)

(assert (=> b!38467 m!31163))

(declare-fun m!31165 () Bool)

(assert (=> b!38467 m!31165))

(declare-fun m!31167 () Bool)

(assert (=> b!38467 m!31167))

(declare-fun m!31169 () Bool)

(assert (=> b!38467 m!31169))

(declare-fun m!31171 () Bool)

(assert (=> b!38467 m!31171))

(declare-fun m!31173 () Bool)

(assert (=> b!38467 m!31173))

(check-sat (not b!38467) (not start!5360) (not b_lambda!2013) b_and!2319 (not b_next!1351) tp_is_empty!1741)
(check-sat b_and!2319 (not b_next!1351))
(get-model)

(declare-fun b_lambda!2019 () Bool)

(assert (= b_lambda!2013 (or (and start!5360 b_free!1351) b_lambda!2019)))

(check-sat (not b!38467) (not b_lambda!2019) (not start!5360) b_and!2319 (not b_next!1351) tp_is_empty!1741)
(check-sat b_and!2319 (not b_next!1351))
(get-model)

(declare-fun d!6217 () Bool)

(assert (=> d!6217 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5360 d!6217))

(declare-fun b!38502 () Bool)

(declare-fun e!24449 () Bool)

(declare-fun contains!497 (List!1036 (_ BitVec 64)) Bool)

(assert (=> b!38502 (= e!24449 (contains!497 Nil!1033 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun b!38503 () Bool)

(declare-fun e!24448 () Bool)

(declare-fun call!2906 () Bool)

(assert (=> b!38503 (= e!24448 call!2906)))

(declare-fun bm!2903 () Bool)

(declare-fun c!4410 () Bool)

(assert (=> bm!2903 (= call!2906 (arrayNoDuplicates!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)))))

(declare-fun b!38504 () Bool)

(declare-fun e!24447 () Bool)

(assert (=> b!38504 (= e!24447 e!24448)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!38504 (= c!4410 (validKeyInArray!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun b!38505 () Bool)

(declare-fun e!24450 () Bool)

(assert (=> b!38505 (= e!24450 e!24447)))

(declare-fun res!23253 () Bool)

(assert (=> b!38505 (=> (not res!23253) (not e!24447))))

(assert (=> b!38505 (= res!23253 (not e!24449))))

(declare-fun res!23254 () Bool)

(assert (=> b!38505 (=> (not res!23254) (not e!24449))))

(assert (=> b!38505 (= res!23254 (validKeyInArray!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun b!38506 () Bool)

(assert (=> b!38506 (= e!24448 call!2906)))

(declare-fun d!6223 () Bool)

(declare-fun res!23252 () Bool)

(assert (=> d!6223 (=> res!23252 e!24450)))

(assert (=> d!6223 (= res!23252 (bvsge #b00000000000000000000000000000000 (size!1321 lt!14401)))))

(assert (=> d!6223 (= (arrayNoDuplicates!0 lt!14401 #b00000000000000000000000000000000 Nil!1033) e!24450)))

(assert (= (and d!6223 (not res!23252)) b!38505))

(assert (= (and b!38505 res!23254) b!38502))

(assert (= (and b!38505 res!23253) b!38504))

(assert (= (and b!38504 c!4410) b!38506))

(assert (= (and b!38504 (not c!4410)) b!38503))

(assert (= (or b!38506 b!38503) bm!2903))

(declare-fun m!31217 () Bool)

(assert (=> b!38502 m!31217))

(assert (=> b!38502 m!31217))

(declare-fun m!31219 () Bool)

(assert (=> b!38502 m!31219))

(assert (=> bm!2903 m!31217))

(declare-fun m!31221 () Bool)

(assert (=> bm!2903 m!31221))

(assert (=> b!38504 m!31217))

(assert (=> b!38504 m!31217))

(declare-fun m!31223 () Bool)

(assert (=> b!38504 m!31223))

(assert (=> b!38505 m!31217))

(assert (=> b!38505 m!31217))

(assert (=> b!38505 m!31223))

(assert (=> b!38467 d!6223))

(declare-fun d!6229 () Bool)

(assert (=> d!6229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14401 mask!853)))

(declare-fun lt!14446 () Unit!960)

(declare-fun choose!34 (array!2541 (_ BitVec 32) (_ BitVec 32)) Unit!960)

(assert (=> d!6229 (= lt!14446 (choose!34 lt!14401 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6229 (validMask!0 mask!853)))

(assert (=> d!6229 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14401 mask!853 #b00000000000000000000000000000000) lt!14446)))

(declare-fun bs!1594 () Bool)

(assert (= bs!1594 d!6229))

(assert (=> bs!1594 m!31165))

(declare-fun m!31227 () Bool)

(assert (=> bs!1594 m!31227))

(assert (=> bs!1594 m!31157))

(assert (=> b!38467 d!6229))

(declare-fun d!6233 () Bool)

(assert (=> d!6233 (arrayNoDuplicates!0 lt!14401 #b00000000000000000000000000000000 Nil!1033)))

(declare-fun lt!14453 () Unit!960)

(declare-fun choose!111 (array!2541 (_ BitVec 32) (_ BitVec 32) List!1036) Unit!960)

(assert (=> d!6233 (= lt!14453 (choose!111 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1033))))

(assert (=> d!6233 (= (size!1321 lt!14401) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6233 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1033) lt!14453)))

(declare-fun bs!1596 () Bool)

(assert (= bs!1596 d!6233))

(assert (=> bs!1596 m!31173))

(declare-fun m!31237 () Bool)

(assert (=> bs!1596 m!31237))

(assert (=> b!38467 d!6233))

(declare-fun b!38542 () Bool)

(declare-fun e!24473 () (_ BitVec 32))

(assert (=> b!38542 (= e!24473 #b00000000000000000000000000000000)))

(declare-fun b!38543 () Bool)

(declare-fun e!24474 () (_ BitVec 32))

(declare-fun call!2915 () (_ BitVec 32))

(assert (=> b!38543 (= e!24474 (bvadd #b00000000000000000000000000000001 call!2915))))

(declare-fun bm!2912 () Bool)

(assert (=> bm!2912 (= call!2915 (arrayCountValidKeys!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38544 () Bool)

(assert (=> b!38544 (= e!24474 call!2915)))

(declare-fun b!38545 () Bool)

(assert (=> b!38545 (= e!24473 e!24474)))

(declare-fun c!4425 () Bool)

(assert (=> b!38545 (= c!4425 (validKeyInArray!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun d!6239 () Bool)

(declare-fun lt!14462 () (_ BitVec 32))

(assert (=> d!6239 (and (bvsge lt!14462 #b00000000000000000000000000000000) (bvsle lt!14462 (bvsub (size!1321 lt!14401) #b00000000000000000000000000000000)))))

(assert (=> d!6239 (= lt!14462 e!24473)))

(declare-fun c!4424 () Bool)

(assert (=> d!6239 (= c!4424 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6239 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1321 lt!14401)))))

(assert (=> d!6239 (= (arrayCountValidKeys!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14462)))

(assert (= (and d!6239 c!4424) b!38542))

(assert (= (and d!6239 (not c!4424)) b!38545))

(assert (= (and b!38545 c!4425) b!38543))

(assert (= (and b!38545 (not c!4425)) b!38544))

(assert (= (or b!38543 b!38544) bm!2912))

(declare-fun m!31244 () Bool)

(assert (=> bm!2912 m!31244))

(assert (=> b!38545 m!31217))

(assert (=> b!38545 m!31217))

(assert (=> b!38545 m!31223))

(assert (=> b!38467 d!6239))

(declare-fun d!6245 () Bool)

(assert (=> d!6245 (= (arrayCountValidKeys!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14468 () Unit!960)

(declare-fun choose!59 (array!2541 (_ BitVec 32) (_ BitVec 32)) Unit!960)

(assert (=> d!6245 (= lt!14468 (choose!59 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6245 (bvslt (size!1321 lt!14401) #b01111111111111111111111111111111)))

(assert (=> d!6245 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14468)))

(declare-fun bs!1600 () Bool)

(assert (= bs!1600 d!6245))

(assert (=> bs!1600 m!31169))

(declare-fun m!31251 () Bool)

(assert (=> bs!1600 m!31251))

(assert (=> b!38467 d!6245))

(declare-fun d!6251 () Bool)

(declare-fun res!23280 () Bool)

(declare-fun e!24491 () Bool)

(assert (=> d!6251 (=> (not res!23280) (not e!24491))))

(declare-fun simpleValid!21 (LongMapFixedSize!226) Bool)

(assert (=> d!6251 (= res!23280 (simpleValid!21 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6251 (= (valid!122 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24491)))

(declare-fun b!38572 () Bool)

(declare-fun res!23281 () Bool)

(assert (=> b!38572 (=> (not res!23281) (not e!24491))))

(assert (=> b!38572 (= res!23281 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38573 () Bool)

(declare-fun res!23282 () Bool)

(assert (=> b!38573 (=> (not res!23282) (not e!24491))))

(assert (=> b!38573 (= res!23282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38574 () Bool)

(assert (=> b!38574 (= e!24491 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1033))))

(assert (= (and d!6251 res!23280) b!38572))

(assert (= (and b!38572 res!23281) b!38573))

(assert (= (and b!38573 res!23282) b!38574))

(declare-fun m!31253 () Bool)

(assert (=> d!6251 m!31253))

(declare-fun m!31259 () Bool)

(assert (=> b!38572 m!31259))

(declare-fun m!31263 () Bool)

(assert (=> b!38573 m!31263))

(declare-fun m!31267 () Bool)

(assert (=> b!38574 m!31267))

(assert (=> b!38467 d!6251))

(declare-fun b!38608 () Bool)

(declare-fun e!24518 () Bool)

(declare-fun call!2927 () Bool)

(assert (=> b!38608 (= e!24518 call!2927)))

(declare-fun b!38609 () Bool)

(declare-fun e!24516 () Bool)

(assert (=> b!38609 (= e!24518 e!24516)))

(declare-fun lt!14498 () (_ BitVec 64))

(assert (=> b!38609 (= lt!14498 (select (arr!1214 lt!14401) #b00000000000000000000000000000000))))

(declare-fun lt!14497 () Unit!960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2541 (_ BitVec 64) (_ BitVec 32)) Unit!960)

(assert (=> b!38609 (= lt!14497 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14401 lt!14498 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2541 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!38609 (arrayContainsKey!0 lt!14401 lt!14498 #b00000000000000000000000000000000)))

(declare-fun lt!14496 () Unit!960)

(assert (=> b!38609 (= lt!14496 lt!14497)))

(declare-fun res!23304 () Bool)

(declare-datatypes ((SeekEntryResult!173 0))(
  ( (MissingZero!173 (index!2814 (_ BitVec 32))) (Found!173 (index!2815 (_ BitVec 32))) (Intermediate!173 (undefined!985 Bool) (index!2816 (_ BitVec 32)) (x!7609 (_ BitVec 32))) (Undefined!173) (MissingVacant!173 (index!2817 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2541 (_ BitVec 32)) SeekEntryResult!173)

(assert (=> b!38609 (= res!23304 (= (seekEntryOrOpen!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853) (Found!173 #b00000000000000000000000000000000)))))

(assert (=> b!38609 (=> (not res!23304) (not e!24516))))

(declare-fun bm!2924 () Bool)

(assert (=> bm!2924 (= call!2927 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14401 mask!853))))

(declare-fun b!38611 () Bool)

(assert (=> b!38611 (= e!24516 call!2927)))

(declare-fun d!6253 () Bool)

(declare-fun res!23305 () Bool)

(declare-fun e!24517 () Bool)

(assert (=> d!6253 (=> res!23305 e!24517)))

(assert (=> d!6253 (= res!23305 (bvsge #b00000000000000000000000000000000 (size!1321 lt!14401)))))

(assert (=> d!6253 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14401 mask!853) e!24517)))

(declare-fun b!38610 () Bool)

(assert (=> b!38610 (= e!24517 e!24518)))

(declare-fun c!4437 () Bool)

(assert (=> b!38610 (= c!4437 (validKeyInArray!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(assert (= (and d!6253 (not res!23305)) b!38610))

(assert (= (and b!38610 c!4437) b!38609))

(assert (= (and b!38610 (not c!4437)) b!38608))

(assert (= (and b!38609 res!23304) b!38611))

(assert (= (or b!38611 b!38608) bm!2924))

(assert (=> b!38609 m!31217))

(declare-fun m!31283 () Bool)

(assert (=> b!38609 m!31283))

(declare-fun m!31285 () Bool)

(assert (=> b!38609 m!31285))

(assert (=> b!38609 m!31217))

(declare-fun m!31287 () Bool)

(assert (=> b!38609 m!31287))

(declare-fun m!31289 () Bool)

(assert (=> bm!2924 m!31289))

(assert (=> b!38610 m!31217))

(assert (=> b!38610 m!31217))

(assert (=> b!38610 m!31223))

(assert (=> b!38467 d!6253))

(check-sat (not d!6233) (not bm!2924) (not b_lambda!2019) (not b!38609) b_and!2319 (not bm!2912) (not b_next!1351) (not bm!2903) tp_is_empty!1741 (not b!38573) (not b!38504) (not d!6229) (not d!6245) (not b!38545) (not b!38502) (not b!38572) (not d!6251) (not b!38574) (not b!38610) (not b!38505))
(check-sat b_and!2319 (not b_next!1351))
(get-model)

(declare-fun b!38624 () Bool)

(declare-fun e!24525 () Bool)

(assert (=> b!38624 (= e!24525 (contains!497 Nil!1033 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38625 () Bool)

(declare-fun e!24524 () Bool)

(declare-fun call!2928 () Bool)

(assert (=> b!38625 (= e!24524 call!2928)))

(declare-fun bm!2925 () Bool)

(declare-fun c!4438 () Bool)

(assert (=> bm!2925 (= call!2928 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4438 (Cons!1032 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1033) Nil!1033)))))

(declare-fun b!38626 () Bool)

(declare-fun e!24523 () Bool)

(assert (=> b!38626 (= e!24523 e!24524)))

(assert (=> b!38626 (= c!4438 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38627 () Bool)

(declare-fun e!24526 () Bool)

(assert (=> b!38627 (= e!24526 e!24523)))

(declare-fun res!23319 () Bool)

(assert (=> b!38627 (=> (not res!23319) (not e!24523))))

(assert (=> b!38627 (= res!23319 (not e!24525))))

(declare-fun res!23320 () Bool)

(assert (=> b!38627 (=> (not res!23320) (not e!24525))))

(assert (=> b!38627 (= res!23320 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38628 () Bool)

(assert (=> b!38628 (= e!24524 call!2928)))

(declare-fun d!6263 () Bool)

(declare-fun res!23318 () Bool)

(assert (=> d!6263 (=> res!23318 e!24526)))

(assert (=> d!6263 (= res!23318 (bvsge #b00000000000000000000000000000000 (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6263 (= (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1033) e!24526)))

(assert (= (and d!6263 (not res!23318)) b!38627))

(assert (= (and b!38627 res!23320) b!38624))

(assert (= (and b!38627 res!23319) b!38626))

(assert (= (and b!38626 c!4438) b!38628))

(assert (= (and b!38626 (not c!4438)) b!38625))

(assert (= (or b!38628 b!38625) bm!2925))

(declare-fun m!31307 () Bool)

(assert (=> b!38624 m!31307))

(assert (=> b!38624 m!31307))

(declare-fun m!31309 () Bool)

(assert (=> b!38624 m!31309))

(assert (=> bm!2925 m!31307))

(declare-fun m!31311 () Bool)

(assert (=> bm!2925 m!31311))

(assert (=> b!38626 m!31307))

(assert (=> b!38626 m!31307))

(declare-fun m!31313 () Bool)

(assert (=> b!38626 m!31313))

(assert (=> b!38627 m!31307))

(assert (=> b!38627 m!31307))

(assert (=> b!38627 m!31313))

(assert (=> b!38574 d!6263))

(declare-fun d!6265 () Bool)

(declare-fun lt!14501 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!25 (List!1036) (InoxSet (_ BitVec 64)))

(assert (=> d!6265 (= lt!14501 (select (content!25 Nil!1033) (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun e!24532 () Bool)

(assert (=> d!6265 (= lt!14501 e!24532)))

(declare-fun res!23325 () Bool)

(assert (=> d!6265 (=> (not res!23325) (not e!24532))))

(get-info :version)

(assert (=> d!6265 (= res!23325 ((_ is Cons!1032) Nil!1033))))

(assert (=> d!6265 (= (contains!497 Nil!1033 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)) lt!14501)))

(declare-fun b!38633 () Bool)

(declare-fun e!24531 () Bool)

(assert (=> b!38633 (= e!24532 e!24531)))

(declare-fun res!23326 () Bool)

(assert (=> b!38633 (=> res!23326 e!24531)))

(assert (=> b!38633 (= res!23326 (= (h!1600 Nil!1033) (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun b!38634 () Bool)

(assert (=> b!38634 (= e!24531 (contains!497 (t!3870 Nil!1033) (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(assert (= (and d!6265 res!23325) b!38633))

(assert (= (and b!38633 (not res!23326)) b!38634))

(declare-fun m!31315 () Bool)

(assert (=> d!6265 m!31315))

(assert (=> d!6265 m!31217))

(declare-fun m!31317 () Bool)

(assert (=> d!6265 m!31317))

(assert (=> b!38634 m!31217))

(declare-fun m!31319 () Bool)

(assert (=> b!38634 m!31319))

(assert (=> b!38502 d!6265))

(declare-fun b!38635 () Bool)

(declare-fun e!24535 () Bool)

(declare-fun call!2929 () Bool)

(assert (=> b!38635 (= e!24535 call!2929)))

(declare-fun b!38636 () Bool)

(declare-fun e!24533 () Bool)

(assert (=> b!38636 (= e!24535 e!24533)))

(declare-fun lt!14504 () (_ BitVec 64))

(assert (=> b!38636 (= lt!14504 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!14503 () Unit!960)

(assert (=> b!38636 (= lt!14503 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000))))

(assert (=> b!38636 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000)))

(declare-fun lt!14502 () Unit!960)

(assert (=> b!38636 (= lt!14502 lt!14503)))

(declare-fun res!23327 () Bool)

(assert (=> b!38636 (= res!23327 (= (seekEntryOrOpen!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!173 #b00000000000000000000000000000000)))))

(assert (=> b!38636 (=> (not res!23327) (not e!24533))))

(declare-fun bm!2926 () Bool)

(assert (=> bm!2926 (= call!2929 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38638 () Bool)

(assert (=> b!38638 (= e!24533 call!2929)))

(declare-fun d!6267 () Bool)

(declare-fun res!23328 () Bool)

(declare-fun e!24534 () Bool)

(assert (=> d!6267 (=> res!23328 e!24534)))

(assert (=> d!6267 (= res!23328 (bvsge #b00000000000000000000000000000000 (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24534)))

(declare-fun b!38637 () Bool)

(assert (=> b!38637 (= e!24534 e!24535)))

(declare-fun c!4439 () Bool)

(assert (=> b!38637 (= c!4439 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6267 (not res!23328)) b!38637))

(assert (= (and b!38637 c!4439) b!38636))

(assert (= (and b!38637 (not c!4439)) b!38635))

(assert (= (and b!38636 res!23327) b!38638))

(assert (= (or b!38638 b!38635) bm!2926))

(assert (=> b!38636 m!31307))

(declare-fun m!31321 () Bool)

(assert (=> b!38636 m!31321))

(declare-fun m!31323 () Bool)

(assert (=> b!38636 m!31323))

(assert (=> b!38636 m!31307))

(declare-fun m!31325 () Bool)

(assert (=> b!38636 m!31325))

(declare-fun m!31327 () Bool)

(assert (=> bm!2926 m!31327))

(assert (=> b!38637 m!31307))

(assert (=> b!38637 m!31307))

(assert (=> b!38637 m!31313))

(assert (=> b!38573 d!6267))

(declare-fun b!38639 () Bool)

(declare-fun e!24538 () Bool)

(assert (=> b!38639 (= e!24538 (contains!497 (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38640 () Bool)

(declare-fun e!24537 () Bool)

(declare-fun call!2930 () Bool)

(assert (=> b!38640 (= e!24537 call!2930)))

(declare-fun c!4440 () Bool)

(declare-fun bm!2927 () Bool)

(assert (=> bm!2927 (= call!2930 (arrayNoDuplicates!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4440 (Cons!1032 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033))))))

(declare-fun b!38641 () Bool)

(declare-fun e!24536 () Bool)

(assert (=> b!38641 (= e!24536 e!24537)))

(assert (=> b!38641 (= c!4440 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38642 () Bool)

(declare-fun e!24539 () Bool)

(assert (=> b!38642 (= e!24539 e!24536)))

(declare-fun res!23330 () Bool)

(assert (=> b!38642 (=> (not res!23330) (not e!24536))))

(assert (=> b!38642 (= res!23330 (not e!24538))))

(declare-fun res!23331 () Bool)

(assert (=> b!38642 (=> (not res!23331) (not e!24538))))

(assert (=> b!38642 (= res!23331 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38643 () Bool)

(assert (=> b!38643 (= e!24537 call!2930)))

(declare-fun d!6269 () Bool)

(declare-fun res!23329 () Bool)

(assert (=> d!6269 (=> res!23329 e!24539)))

(assert (=> d!6269 (= res!23329 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 lt!14401)))))

(assert (=> d!6269 (= (arrayNoDuplicates!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) e!24539)))

(assert (= (and d!6269 (not res!23329)) b!38642))

(assert (= (and b!38642 res!23331) b!38639))

(assert (= (and b!38642 res!23330) b!38641))

(assert (= (and b!38641 c!4440) b!38643))

(assert (= (and b!38641 (not c!4440)) b!38640))

(assert (= (or b!38643 b!38640) bm!2927))

(declare-fun m!31329 () Bool)

(assert (=> b!38639 m!31329))

(assert (=> b!38639 m!31329))

(declare-fun m!31331 () Bool)

(assert (=> b!38639 m!31331))

(assert (=> bm!2927 m!31329))

(declare-fun m!31333 () Bool)

(assert (=> bm!2927 m!31333))

(assert (=> b!38641 m!31329))

(assert (=> b!38641 m!31329))

(declare-fun m!31335 () Bool)

(assert (=> b!38641 m!31335))

(assert (=> b!38642 m!31329))

(assert (=> b!38642 m!31329))

(assert (=> b!38642 m!31335))

(assert (=> bm!2903 d!6269))

(assert (=> d!6233 d!6223))

(declare-fun d!6271 () Bool)

(assert (=> d!6271 (arrayNoDuplicates!0 lt!14401 #b00000000000000000000000000000000 Nil!1033)))

(assert (=> d!6271 true))

(declare-fun res!23334 () Unit!960)

(assert (=> d!6271 (= (choose!111 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1033) res!23334)))

(declare-fun bs!1602 () Bool)

(assert (= bs!1602 d!6271))

(assert (=> bs!1602 m!31173))

(assert (=> d!6233 d!6271))

(declare-fun b!38644 () Bool)

(declare-fun e!24540 () (_ BitVec 32))

(assert (=> b!38644 (= e!24540 #b00000000000000000000000000000000)))

(declare-fun b!38645 () Bool)

(declare-fun e!24541 () (_ BitVec 32))

(declare-fun call!2931 () (_ BitVec 32))

(assert (=> b!38645 (= e!24541 (bvadd #b00000000000000000000000000000001 call!2931))))

(declare-fun bm!2928 () Bool)

(assert (=> bm!2928 (= call!2931 (arrayCountValidKeys!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38646 () Bool)

(assert (=> b!38646 (= e!24541 call!2931)))

(declare-fun b!38647 () Bool)

(assert (=> b!38647 (= e!24540 e!24541)))

(declare-fun c!4442 () Bool)

(assert (=> b!38647 (= c!4442 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6273 () Bool)

(declare-fun lt!14505 () (_ BitVec 32))

(assert (=> d!6273 (and (bvsge lt!14505 #b00000000000000000000000000000000) (bvsle lt!14505 (bvsub (size!1321 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6273 (= lt!14505 e!24540)))

(declare-fun c!4441 () Bool)

(assert (=> d!6273 (= c!4441 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6273 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1321 lt!14401)))))

(assert (=> d!6273 (= (arrayCountValidKeys!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14505)))

(assert (= (and d!6273 c!4441) b!38644))

(assert (= (and d!6273 (not c!4441)) b!38647))

(assert (= (and b!38647 c!4442) b!38645))

(assert (= (and b!38647 (not c!4442)) b!38646))

(assert (= (or b!38645 b!38646) bm!2928))

(declare-fun m!31337 () Bool)

(assert (=> bm!2928 m!31337))

(assert (=> b!38647 m!31329))

(assert (=> b!38647 m!31329))

(assert (=> b!38647 m!31335))

(assert (=> bm!2912 d!6273))

(declare-fun d!6275 () Bool)

(assert (=> d!6275 (= (validKeyInArray!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)) (and (not (= (select (arr!1214 lt!14401) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1214 lt!14401) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38504 d!6275))

(assert (=> d!6245 d!6239))

(declare-fun d!6279 () Bool)

(assert (=> d!6279 (= (arrayCountValidKeys!0 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6279 true))

(declare-fun _$88!19 () Unit!960)

(assert (=> d!6279 (= (choose!59 lt!14401 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!19)))

(declare-fun bs!1603 () Bool)

(assert (= bs!1603 d!6279))

(assert (=> bs!1603 m!31169))

(assert (=> d!6245 d!6279))

(assert (=> d!6229 d!6253))

(declare-fun d!6283 () Bool)

(assert (=> d!6283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14401 mask!853)))

(assert (=> d!6283 true))

(declare-fun _$30!33 () Unit!960)

(assert (=> d!6283 (= (choose!34 lt!14401 mask!853 #b00000000000000000000000000000000) _$30!33)))

(declare-fun bs!1605 () Bool)

(assert (= bs!1605 d!6283))

(assert (=> bs!1605 m!31165))

(assert (=> d!6229 d!6283))

(assert (=> d!6229 d!6217))

(assert (=> b!38545 d!6275))

(assert (=> b!38505 d!6275))

(declare-fun d!6287 () Bool)

(assert (=> d!6287 (arrayContainsKey!0 lt!14401 lt!14498 #b00000000000000000000000000000000)))

(declare-fun lt!14511 () Unit!960)

(declare-fun choose!13 (array!2541 (_ BitVec 64) (_ BitVec 32)) Unit!960)

(assert (=> d!6287 (= lt!14511 (choose!13 lt!14401 lt!14498 #b00000000000000000000000000000000))))

(assert (=> d!6287 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6287 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14401 lt!14498 #b00000000000000000000000000000000) lt!14511)))

(declare-fun bs!1606 () Bool)

(assert (= bs!1606 d!6287))

(assert (=> bs!1606 m!31285))

(declare-fun m!31343 () Bool)

(assert (=> bs!1606 m!31343))

(assert (=> b!38609 d!6287))

(declare-fun d!6291 () Bool)

(declare-fun res!23345 () Bool)

(declare-fun e!24552 () Bool)

(assert (=> d!6291 (=> res!23345 e!24552)))

(assert (=> d!6291 (= res!23345 (= (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14498))))

(assert (=> d!6291 (= (arrayContainsKey!0 lt!14401 lt!14498 #b00000000000000000000000000000000) e!24552)))

(declare-fun b!38658 () Bool)

(declare-fun e!24553 () Bool)

(assert (=> b!38658 (= e!24552 e!24553)))

(declare-fun res!23346 () Bool)

(assert (=> b!38658 (=> (not res!23346) (not e!24553))))

(assert (=> b!38658 (= res!23346 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 lt!14401)))))

(declare-fun b!38659 () Bool)

(assert (=> b!38659 (= e!24553 (arrayContainsKey!0 lt!14401 lt!14498 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6291 (not res!23345)) b!38658))

(assert (= (and b!38658 res!23346) b!38659))

(assert (=> d!6291 m!31217))

(declare-fun m!31345 () Bool)

(assert (=> b!38659 m!31345))

(assert (=> b!38609 d!6291))

(declare-fun b!38698 () Bool)

(declare-fun e!24577 () SeekEntryResult!173)

(declare-fun lt!14532 () SeekEntryResult!173)

(assert (=> b!38698 (= e!24577 (MissingZero!173 (index!2816 lt!14532)))))

(declare-fun b!38699 () Bool)

(declare-fun c!4459 () Bool)

(declare-fun lt!14533 () (_ BitVec 64))

(assert (=> b!38699 (= c!4459 (= lt!14533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24576 () SeekEntryResult!173)

(assert (=> b!38699 (= e!24576 e!24577)))

(declare-fun b!38700 () Bool)

(declare-fun e!24578 () SeekEntryResult!173)

(assert (=> b!38700 (= e!24578 e!24576)))

(assert (=> b!38700 (= lt!14533 (select (arr!1214 lt!14401) (index!2816 lt!14532)))))

(declare-fun c!4460 () Bool)

(assert (=> b!38700 (= c!4460 (= lt!14533 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun d!6293 () Bool)

(declare-fun lt!14534 () SeekEntryResult!173)

(assert (=> d!6293 (and (or ((_ is Undefined!173) lt!14534) (not ((_ is Found!173) lt!14534)) (and (bvsge (index!2815 lt!14534) #b00000000000000000000000000000000) (bvslt (index!2815 lt!14534) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14534) ((_ is Found!173) lt!14534) (not ((_ is MissingZero!173) lt!14534)) (and (bvsge (index!2814 lt!14534) #b00000000000000000000000000000000) (bvslt (index!2814 lt!14534) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14534) ((_ is Found!173) lt!14534) ((_ is MissingZero!173) lt!14534) (not ((_ is MissingVacant!173) lt!14534)) (and (bvsge (index!2817 lt!14534) #b00000000000000000000000000000000) (bvslt (index!2817 lt!14534) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14534) (ite ((_ is Found!173) lt!14534) (= (select (arr!1214 lt!14401) (index!2815 lt!14534)) (select (arr!1214 lt!14401) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!173) lt!14534) (= (select (arr!1214 lt!14401) (index!2814 lt!14534)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!173) lt!14534) (= (select (arr!1214 lt!14401) (index!2817 lt!14534)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6293 (= lt!14534 e!24578)))

(declare-fun c!4461 () Bool)

(assert (=> d!6293 (= c!4461 (and ((_ is Intermediate!173) lt!14532) (undefined!985 lt!14532)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2541 (_ BitVec 32)) SeekEntryResult!173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6293 (= lt!14532 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) mask!853) (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853))))

(assert (=> d!6293 (validMask!0 mask!853)))

(assert (=> d!6293 (= (seekEntryOrOpen!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853) lt!14534)))

(declare-fun b!38701 () Bool)

(assert (=> b!38701 (= e!24576 (Found!173 (index!2816 lt!14532)))))

(declare-fun b!38702 () Bool)

(assert (=> b!38702 (= e!24578 Undefined!173)))

(declare-fun b!38703 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2541 (_ BitVec 32)) SeekEntryResult!173)

(assert (=> b!38703 (= e!24577 (seekKeyOrZeroReturnVacant!0 (x!7609 lt!14532) (index!2816 lt!14532) (index!2816 lt!14532) (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853))))

(assert (= (and d!6293 c!4461) b!38702))

(assert (= (and d!6293 (not c!4461)) b!38700))

(assert (= (and b!38700 c!4460) b!38701))

(assert (= (and b!38700 (not c!4460)) b!38699))

(assert (= (and b!38699 c!4459) b!38698))

(assert (= (and b!38699 (not c!4459)) b!38703))

(declare-fun m!31379 () Bool)

(assert (=> b!38700 m!31379))

(declare-fun m!31381 () Bool)

(assert (=> d!6293 m!31381))

(declare-fun m!31383 () Bool)

(assert (=> d!6293 m!31383))

(assert (=> d!6293 m!31217))

(declare-fun m!31385 () Bool)

(assert (=> d!6293 m!31385))

(declare-fun m!31387 () Bool)

(assert (=> d!6293 m!31387))

(assert (=> d!6293 m!31157))

(assert (=> d!6293 m!31385))

(assert (=> d!6293 m!31217))

(declare-fun m!31389 () Bool)

(assert (=> d!6293 m!31389))

(assert (=> b!38703 m!31217))

(declare-fun m!31391 () Bool)

(assert (=> b!38703 m!31391))

(assert (=> b!38609 d!6293))

(declare-fun b!38706 () Bool)

(declare-fun e!24583 () Bool)

(declare-fun call!2933 () Bool)

(assert (=> b!38706 (= e!24583 call!2933)))

(declare-fun b!38707 () Bool)

(declare-fun e!24581 () Bool)

(assert (=> b!38707 (= e!24583 e!24581)))

(declare-fun lt!14538 () (_ BitVec 64))

(assert (=> b!38707 (= lt!14538 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14537 () Unit!960)

(assert (=> b!38707 (= lt!14537 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14401 lt!14538 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38707 (arrayContainsKey!0 lt!14401 lt!14538 #b00000000000000000000000000000000)))

(declare-fun lt!14536 () Unit!960)

(assert (=> b!38707 (= lt!14536 lt!14537)))

(declare-fun res!23361 () Bool)

(assert (=> b!38707 (= res!23361 (= (seekEntryOrOpen!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14401 mask!853) (Found!173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38707 (=> (not res!23361) (not e!24581))))

(declare-fun bm!2930 () Bool)

(assert (=> bm!2930 (= call!2933 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14401 mask!853))))

(declare-fun b!38709 () Bool)

(assert (=> b!38709 (= e!24581 call!2933)))

(declare-fun d!6309 () Bool)

(declare-fun res!23362 () Bool)

(declare-fun e!24582 () Bool)

(assert (=> d!6309 (=> res!23362 e!24582)))

(assert (=> d!6309 (= res!23362 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 lt!14401)))))

(assert (=> d!6309 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14401 mask!853) e!24582)))

(declare-fun b!38708 () Bool)

(assert (=> b!38708 (= e!24582 e!24583)))

(declare-fun c!4462 () Bool)

(assert (=> b!38708 (= c!4462 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6309 (not res!23362)) b!38708))

(assert (= (and b!38708 c!4462) b!38707))

(assert (= (and b!38708 (not c!4462)) b!38706))

(assert (= (and b!38707 res!23361) b!38709))

(assert (= (or b!38709 b!38706) bm!2930))

(assert (=> b!38707 m!31329))

(declare-fun m!31393 () Bool)

(assert (=> b!38707 m!31393))

(declare-fun m!31395 () Bool)

(assert (=> b!38707 m!31395))

(assert (=> b!38707 m!31329))

(declare-fun m!31397 () Bool)

(assert (=> b!38707 m!31397))

(declare-fun m!31399 () Bool)

(assert (=> bm!2930 m!31399))

(assert (=> b!38708 m!31329))

(assert (=> b!38708 m!31329))

(assert (=> b!38708 m!31335))

(assert (=> bm!2924 d!6309))

(declare-fun b!38714 () Bool)

(declare-fun e!24588 () (_ BitVec 32))

(assert (=> b!38714 (= e!24588 #b00000000000000000000000000000000)))

(declare-fun b!38715 () Bool)

(declare-fun e!24589 () (_ BitVec 32))

(declare-fun call!2934 () (_ BitVec 32))

(assert (=> b!38715 (= e!24589 (bvadd #b00000000000000000000000000000001 call!2934))))

(declare-fun bm!2931 () Bool)

(assert (=> bm!2931 (= call!2934 (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38716 () Bool)

(assert (=> b!38716 (= e!24589 call!2934)))

(declare-fun b!38717 () Bool)

(assert (=> b!38717 (= e!24588 e!24589)))

(declare-fun c!4464 () Bool)

(assert (=> b!38717 (= c!4464 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun lt!14541 () (_ BitVec 32))

(declare-fun d!6311 () Bool)

(assert (=> d!6311 (and (bvsge lt!14541 #b00000000000000000000000000000000) (bvsle lt!14541 (bvsub (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> d!6311 (= lt!14541 e!24588)))

(declare-fun c!4463 () Bool)

(assert (=> d!6311 (= c!4463 (bvsge #b00000000000000000000000000000000 (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6311 (and (bvsle #b00000000000000000000000000000000 (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6311 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14541)))

(assert (= (and d!6311 c!4463) b!38714))

(assert (= (and d!6311 (not c!4463)) b!38717))

(assert (= (and b!38717 c!4464) b!38715))

(assert (= (and b!38717 (not c!4464)) b!38716))

(assert (= (or b!38715 b!38716) bm!2931))

(declare-fun m!31401 () Bool)

(assert (=> bm!2931 m!31401))

(assert (=> b!38717 m!31307))

(assert (=> b!38717 m!31307))

(assert (=> b!38717 m!31313))

(assert (=> b!38572 d!6311))

(assert (=> b!38610 d!6275))

(declare-fun d!6313 () Bool)

(declare-fun res!23385 () Bool)

(declare-fun e!24611 () Bool)

(assert (=> d!6313 (=> (not res!23385) (not e!24611))))

(assert (=> d!6313 (= res!23385 (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6313 (= (simpleValid!21 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24611)))

(declare-fun b!38757 () Bool)

(assert (=> b!38757 (= e!24611 (and (bvsge (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000011) (bvsge (_vacant!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000)))))

(declare-fun b!38756 () Bool)

(declare-fun res!23386 () Bool)

(assert (=> b!38756 (=> (not res!23386) (not e!24611))))

(declare-fun size!1340 (LongMapFixedSize!226) (_ BitVec 32))

(assert (=> b!38756 (= res!23386 (= (size!1340 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!38754 () Bool)

(declare-fun res!23387 () Bool)

(assert (=> b!38754 (=> (not res!23387) (not e!24611))))

(assert (=> b!38754 (= res!23387 (and (= (size!1322 (_values!1774 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001)) (= (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1322 (_values!1774 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001))))))

(declare-fun b!38755 () Bool)

(declare-fun res!23388 () Bool)

(assert (=> b!38755 (=> (not res!23388) (not e!24611))))

(assert (=> b!38755 (= res!23388 (bvsge (size!1340 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6313 res!23385) b!38754))

(assert (= (and b!38754 res!23387) b!38755))

(assert (= (and b!38755 res!23388) b!38756))

(assert (= (and b!38756 res!23386) b!38757))

(declare-fun m!31443 () Bool)

(assert (=> d!6313 m!31443))

(declare-fun m!31445 () Bool)

(assert (=> b!38756 m!31445))

(assert (=> b!38755 m!31445))

(assert (=> d!6251 d!6313))

(check-sat (not b!38717) (not b!38642) (not b!38703) (not b!38627) (not b!38636) (not bm!2926) b_and!2319 (not b!38647) (not b!38641) (not d!6293) (not d!6287) tp_is_empty!1741 (not b!38634) (not d!6283) (not b!38637) (not b!38707) (not b!38626) (not b!38639) (not bm!2928) (not b!38708) (not d!6265) (not b_lambda!2019) (not b!38659) (not bm!2931) (not bm!2927) (not d!6279) (not b!38624) (not bm!2930) (not d!6271) (not bm!2925) (not b_next!1351) (not b!38755) (not d!6313) (not b!38756))
(check-sat b_and!2319 (not b_next!1351))
(get-model)

(declare-fun b!38828 () Bool)

(declare-fun e!24651 () Bool)

(declare-fun call!2946 () Bool)

(assert (=> b!38828 (= e!24651 call!2946)))

(declare-fun b!38829 () Bool)

(declare-fun e!24649 () Bool)

(assert (=> b!38829 (= e!24651 e!24649)))

(declare-fun lt!14570 () (_ BitVec 64))

(assert (=> b!38829 (= lt!14570 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!14569 () Unit!960)

(assert (=> b!38829 (= lt!14569 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14401 lt!14570 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!38829 (arrayContainsKey!0 lt!14401 lt!14570 #b00000000000000000000000000000000)))

(declare-fun lt!14568 () Unit!960)

(assert (=> b!38829 (= lt!14568 lt!14569)))

(declare-fun res!23429 () Bool)

(assert (=> b!38829 (= res!23429 (= (seekEntryOrOpen!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14401 mask!853) (Found!173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!38829 (=> (not res!23429) (not e!24649))))

(declare-fun bm!2943 () Bool)

(assert (=> bm!2943 (= call!2946 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14401 mask!853))))

(declare-fun b!38831 () Bool)

(assert (=> b!38831 (= e!24649 call!2946)))

(declare-fun d!6353 () Bool)

(declare-fun res!23430 () Bool)

(declare-fun e!24650 () Bool)

(assert (=> d!6353 (=> res!23430 e!24650)))

(assert (=> d!6353 (= res!23430 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1321 lt!14401)))))

(assert (=> d!6353 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14401 mask!853) e!24650)))

(declare-fun b!38830 () Bool)

(assert (=> b!38830 (= e!24650 e!24651)))

(declare-fun c!4489 () Bool)

(assert (=> b!38830 (= c!4489 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6353 (not res!23430)) b!38830))

(assert (= (and b!38830 c!4489) b!38829))

(assert (= (and b!38830 (not c!4489)) b!38828))

(assert (= (and b!38829 res!23429) b!38831))

(assert (= (or b!38831 b!38828) bm!2943))

(declare-fun m!31499 () Bool)

(assert (=> b!38829 m!31499))

(declare-fun m!31501 () Bool)

(assert (=> b!38829 m!31501))

(declare-fun m!31503 () Bool)

(assert (=> b!38829 m!31503))

(assert (=> b!38829 m!31499))

(declare-fun m!31505 () Bool)

(assert (=> b!38829 m!31505))

(declare-fun m!31507 () Bool)

(assert (=> bm!2943 m!31507))

(assert (=> b!38830 m!31499))

(assert (=> b!38830 m!31499))

(declare-fun m!31509 () Bool)

(assert (=> b!38830 m!31509))

(assert (=> bm!2930 d!6353))

(declare-fun d!6355 () Bool)

(assert (=> d!6355 (= (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (and (or (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000001111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000011111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000001111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000011111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000001111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000011111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000001111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000011111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000001111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000011111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000001111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000011111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000001111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000011111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000001111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000011111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00001111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00011111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)) (bvsle (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)))))

(assert (=> d!6313 d!6355))

(assert (=> d!6271 d!6223))

(declare-fun b!38851 () Bool)

(declare-fun lt!14576 () SeekEntryResult!173)

(assert (=> b!38851 (and (bvsge (index!2816 lt!14576) #b00000000000000000000000000000000) (bvslt (index!2816 lt!14576) (size!1321 lt!14401)))))

(declare-fun res!23438 () Bool)

(assert (=> b!38851 (= res!23438 (= (select (arr!1214 lt!14401) (index!2816 lt!14576)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24665 () Bool)

(assert (=> b!38851 (=> res!23438 e!24665)))

(declare-fun b!38852 () Bool)

(declare-fun e!24663 () SeekEntryResult!173)

(assert (=> b!38852 (= e!24663 (Intermediate!173 false (toIndex!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!38853 () Bool)

(declare-fun e!24662 () SeekEntryResult!173)

(assert (=> b!38853 (= e!24662 (Intermediate!173 true (toIndex!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!38854 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38854 (= e!24663 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853))))

(declare-fun b!38855 () Bool)

(declare-fun e!24666 () Bool)

(declare-fun e!24664 () Bool)

(assert (=> b!38855 (= e!24666 e!24664)))

(declare-fun res!23437 () Bool)

(assert (=> b!38855 (= res!23437 (and ((_ is Intermediate!173) lt!14576) (not (undefined!985 lt!14576)) (bvslt (x!7609 lt!14576) #b01111111111111111111111111111110) (bvsge (x!7609 lt!14576) #b00000000000000000000000000000000) (bvsge (x!7609 lt!14576) #b00000000000000000000000000000000)))))

(assert (=> b!38855 (=> (not res!23437) (not e!24664))))

(declare-fun b!38856 () Bool)

(assert (=> b!38856 (and (bvsge (index!2816 lt!14576) #b00000000000000000000000000000000) (bvslt (index!2816 lt!14576) (size!1321 lt!14401)))))

(assert (=> b!38856 (= e!24665 (= (select (arr!1214 lt!14401) (index!2816 lt!14576)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38850 () Bool)

(assert (=> b!38850 (= e!24662 e!24663)))

(declare-fun c!4496 () Bool)

(declare-fun lt!14575 () (_ BitVec 64))

(assert (=> b!38850 (= c!4496 (or (= lt!14575 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)) (= (bvadd lt!14575 lt!14575) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!6357 () Bool)

(assert (=> d!6357 e!24666))

(declare-fun c!4498 () Bool)

(assert (=> d!6357 (= c!4498 (and ((_ is Intermediate!173) lt!14576) (undefined!985 lt!14576)))))

(assert (=> d!6357 (= lt!14576 e!24662)))

(declare-fun c!4497 () Bool)

(assert (=> d!6357 (= c!4497 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6357 (= lt!14575 (select (arr!1214 lt!14401) (toIndex!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6357 (validMask!0 mask!853)))

(assert (=> d!6357 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) mask!853) (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853) lt!14576)))

(declare-fun b!38857 () Bool)

(assert (=> b!38857 (and (bvsge (index!2816 lt!14576) #b00000000000000000000000000000000) (bvslt (index!2816 lt!14576) (size!1321 lt!14401)))))

(declare-fun res!23439 () Bool)

(assert (=> b!38857 (= res!23439 (= (select (arr!1214 lt!14401) (index!2816 lt!14576)) (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(assert (=> b!38857 (=> res!23439 e!24665)))

(assert (=> b!38857 (= e!24664 e!24665)))

(declare-fun b!38858 () Bool)

(assert (=> b!38858 (= e!24666 (bvsge (x!7609 lt!14576) #b01111111111111111111111111111110))))

(assert (= (and d!6357 c!4497) b!38853))

(assert (= (and d!6357 (not c!4497)) b!38850))

(assert (= (and b!38850 c!4496) b!38852))

(assert (= (and b!38850 (not c!4496)) b!38854))

(assert (= (and d!6357 c!4498) b!38858))

(assert (= (and d!6357 (not c!4498)) b!38855))

(assert (= (and b!38855 res!23437) b!38857))

(assert (= (and b!38857 (not res!23439)) b!38851))

(assert (= (and b!38851 (not res!23438)) b!38856))

(declare-fun m!31511 () Bool)

(assert (=> b!38856 m!31511))

(assert (=> b!38857 m!31511))

(assert (=> d!6357 m!31385))

(declare-fun m!31513 () Bool)

(assert (=> d!6357 m!31513))

(assert (=> d!6357 m!31157))

(assert (=> b!38854 m!31385))

(declare-fun m!31515 () Bool)

(assert (=> b!38854 m!31515))

(assert (=> b!38854 m!31515))

(assert (=> b!38854 m!31217))

(declare-fun m!31517 () Bool)

(assert (=> b!38854 m!31517))

(assert (=> b!38851 m!31511))

(assert (=> d!6293 d!6357))

(declare-fun d!6359 () Bool)

(declare-fun lt!14582 () (_ BitVec 32))

(declare-fun lt!14581 () (_ BitVec 32))

(assert (=> d!6359 (= lt!14582 (bvmul (bvxor lt!14581 (bvlshr lt!14581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6359 (= lt!14581 ((_ extract 31 0) (bvand (bvxor (select (arr!1214 lt!14401) #b00000000000000000000000000000000) (bvlshr (select (arr!1214 lt!14401) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6359 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23440 (let ((h!1603 ((_ extract 31 0) (bvand (bvxor (select (arr!1214 lt!14401) #b00000000000000000000000000000000) (bvlshr (select (arr!1214 lt!14401) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7620 (bvmul (bvxor h!1603 (bvlshr h!1603 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7620 (bvlshr x!7620 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23440 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23440 #b00000000000000000000000000000000))))))

(assert (=> d!6359 (= (toIndex!0 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!14582 (bvlshr lt!14582 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6293 d!6359))

(assert (=> d!6293 d!6217))

(declare-fun d!6361 () Bool)

(assert (=> d!6361 (= (content!25 Nil!1033) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!6265 d!6361))

(declare-fun d!6363 () Bool)

(assert (=> d!6363 (= (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38637 d!6363))

(declare-fun b!38859 () Bool)

(declare-fun e!24667 () (_ BitVec 32))

(assert (=> b!38859 (= e!24667 #b00000000000000000000000000000000)))

(declare-fun b!38860 () Bool)

(declare-fun e!24668 () (_ BitVec 32))

(declare-fun call!2947 () (_ BitVec 32))

(assert (=> b!38860 (= e!24668 (bvadd #b00000000000000000000000000000001 call!2947))))

(declare-fun bm!2944 () Bool)

(assert (=> bm!2944 (= call!2947 (arrayCountValidKeys!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38861 () Bool)

(assert (=> b!38861 (= e!24668 call!2947)))

(declare-fun b!38862 () Bool)

(assert (=> b!38862 (= e!24667 e!24668)))

(declare-fun c!4500 () Bool)

(assert (=> b!38862 (= c!4500 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6365 () Bool)

(declare-fun lt!14583 () (_ BitVec 32))

(assert (=> d!6365 (and (bvsge lt!14583 #b00000000000000000000000000000000) (bvsle lt!14583 (bvsub (size!1321 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6365 (= lt!14583 e!24667)))

(declare-fun c!4499 () Bool)

(assert (=> d!6365 (= c!4499 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6365 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1321 lt!14401)))))

(assert (=> d!6365 (= (arrayCountValidKeys!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14583)))

(assert (= (and d!6365 c!4499) b!38859))

(assert (= (and d!6365 (not c!4499)) b!38862))

(assert (= (and b!38862 c!4500) b!38860))

(assert (= (and b!38862 (not c!4500)) b!38861))

(assert (= (or b!38860 b!38861) bm!2944))

(declare-fun m!31519 () Bool)

(assert (=> bm!2944 m!31519))

(assert (=> b!38862 m!31499))

(assert (=> b!38862 m!31499))

(assert (=> b!38862 m!31509))

(assert (=> bm!2928 d!6365))

(declare-fun d!6367 () Bool)

(assert (=> d!6367 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000)))

(declare-fun lt!14584 () Unit!960)

(assert (=> d!6367 (= lt!14584 (choose!13 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000))))

(assert (=> d!6367 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6367 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000) lt!14584)))

(declare-fun bs!1614 () Bool)

(assert (= bs!1614 d!6367))

(assert (=> bs!1614 m!31323))

(declare-fun m!31521 () Bool)

(assert (=> bs!1614 m!31521))

(assert (=> b!38636 d!6367))

(declare-fun d!6369 () Bool)

(declare-fun res!23441 () Bool)

(declare-fun e!24669 () Bool)

(assert (=> d!6369 (=> res!23441 e!24669)))

(assert (=> d!6369 (= res!23441 (= (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) lt!14504))))

(assert (=> d!6369 (= (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 #b00000000000000000000000000000000) e!24669)))

(declare-fun b!38863 () Bool)

(declare-fun e!24670 () Bool)

(assert (=> b!38863 (= e!24669 e!24670)))

(declare-fun res!23442 () Bool)

(assert (=> b!38863 (=> (not res!23442) (not e!24670))))

(assert (=> b!38863 (= res!23442 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38864 () Bool)

(assert (=> b!38864 (= e!24670 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14504 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6369 (not res!23441)) b!38863))

(assert (= (and b!38863 res!23442) b!38864))

(assert (=> d!6369 m!31307))

(declare-fun m!31523 () Bool)

(assert (=> b!38864 m!31523))

(assert (=> b!38636 d!6369))

(declare-fun b!38865 () Bool)

(declare-fun e!24672 () SeekEntryResult!173)

(declare-fun lt!14585 () SeekEntryResult!173)

(assert (=> b!38865 (= e!24672 (MissingZero!173 (index!2816 lt!14585)))))

(declare-fun b!38866 () Bool)

(declare-fun c!4501 () Bool)

(declare-fun lt!14586 () (_ BitVec 64))

(assert (=> b!38866 (= c!4501 (= lt!14586 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24671 () SeekEntryResult!173)

(assert (=> b!38866 (= e!24671 e!24672)))

(declare-fun b!38867 () Bool)

(declare-fun e!24673 () SeekEntryResult!173)

(assert (=> b!38867 (= e!24673 e!24671)))

(assert (=> b!38867 (= lt!14586 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2816 lt!14585)))))

(declare-fun c!4502 () Bool)

(assert (=> b!38867 (= c!4502 (= lt!14586 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun lt!14587 () SeekEntryResult!173)

(declare-fun d!6371 () Bool)

(assert (=> d!6371 (and (or ((_ is Undefined!173) lt!14587) (not ((_ is Found!173) lt!14587)) (and (bvsge (index!2815 lt!14587) #b00000000000000000000000000000000) (bvslt (index!2815 lt!14587) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!173) lt!14587) ((_ is Found!173) lt!14587) (not ((_ is MissingZero!173) lt!14587)) (and (bvsge (index!2814 lt!14587) #b00000000000000000000000000000000) (bvslt (index!2814 lt!14587) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!173) lt!14587) ((_ is Found!173) lt!14587) ((_ is MissingZero!173) lt!14587) (not ((_ is MissingVacant!173) lt!14587)) (and (bvsge (index!2817 lt!14587) #b00000000000000000000000000000000) (bvslt (index!2817 lt!14587) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!173) lt!14587) (ite ((_ is Found!173) lt!14587) (= (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2815 lt!14587)) (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!173) lt!14587) (= (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2814 lt!14587)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!173) lt!14587) (= (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2817 lt!14587)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6371 (= lt!14587 e!24673)))

(declare-fun c!4503 () Bool)

(assert (=> d!6371 (= c!4503 (and ((_ is Intermediate!173) lt!14585) (undefined!985 lt!14585)))))

(assert (=> d!6371 (= lt!14585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6371 (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6371 (= (seekEntryOrOpen!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) lt!14587)))

(declare-fun b!38868 () Bool)

(assert (=> b!38868 (= e!24671 (Found!173 (index!2816 lt!14585)))))

(declare-fun b!38869 () Bool)

(assert (=> b!38869 (= e!24673 Undefined!173)))

(declare-fun b!38870 () Bool)

(assert (=> b!38870 (= e!24672 (seekKeyOrZeroReturnVacant!0 (x!7609 lt!14585) (index!2816 lt!14585) (index!2816 lt!14585) (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6371 c!4503) b!38869))

(assert (= (and d!6371 (not c!4503)) b!38867))

(assert (= (and b!38867 c!4502) b!38868))

(assert (= (and b!38867 (not c!4502)) b!38866))

(assert (= (and b!38866 c!4501) b!38865))

(assert (= (and b!38866 (not c!4501)) b!38870))

(declare-fun m!31525 () Bool)

(assert (=> b!38867 m!31525))

(declare-fun m!31527 () Bool)

(assert (=> d!6371 m!31527))

(declare-fun m!31529 () Bool)

(assert (=> d!6371 m!31529))

(assert (=> d!6371 m!31307))

(declare-fun m!31531 () Bool)

(assert (=> d!6371 m!31531))

(declare-fun m!31533 () Bool)

(assert (=> d!6371 m!31533))

(assert (=> d!6371 m!31443))

(assert (=> d!6371 m!31531))

(assert (=> d!6371 m!31307))

(declare-fun m!31535 () Bool)

(assert (=> d!6371 m!31535))

(assert (=> b!38870 m!31307))

(declare-fun m!31537 () Bool)

(assert (=> b!38870 m!31537))

(assert (=> b!38636 d!6371))

(declare-fun d!6373 () Bool)

(assert (=> d!6373 (= (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38647 d!6373))

(declare-fun b!38871 () Bool)

(declare-fun e!24676 () Bool)

(declare-fun call!2948 () Bool)

(assert (=> b!38871 (= e!24676 call!2948)))

(declare-fun b!38872 () Bool)

(declare-fun e!24674 () Bool)

(assert (=> b!38872 (= e!24676 e!24674)))

(declare-fun lt!14590 () (_ BitVec 64))

(assert (=> b!38872 (= lt!14590 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14589 () Unit!960)

(assert (=> b!38872 (= lt!14589 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14590 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38872 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14590 #b00000000000000000000000000000000)))

(declare-fun lt!14588 () Unit!960)

(assert (=> b!38872 (= lt!14588 lt!14589)))

(declare-fun res!23443 () Bool)

(assert (=> b!38872 (= res!23443 (= (seekEntryOrOpen!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38872 (=> (not res!23443) (not e!24674))))

(declare-fun bm!2945 () Bool)

(assert (=> bm!2945 (= call!2948 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38874 () Bool)

(assert (=> b!38874 (= e!24674 call!2948)))

(declare-fun d!6375 () Bool)

(declare-fun res!23444 () Bool)

(declare-fun e!24675 () Bool)

(assert (=> d!6375 (=> res!23444 e!24675)))

(assert (=> d!6375 (= res!23444 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6375 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24675)))

(declare-fun b!38873 () Bool)

(assert (=> b!38873 (= e!24675 e!24676)))

(declare-fun c!4504 () Bool)

(assert (=> b!38873 (= c!4504 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6375 (not res!23444)) b!38873))

(assert (= (and b!38873 c!4504) b!38872))

(assert (= (and b!38873 (not c!4504)) b!38871))

(assert (= (and b!38872 res!23443) b!38874))

(assert (= (or b!38874 b!38871) bm!2945))

(declare-fun m!31539 () Bool)

(assert (=> b!38872 m!31539))

(declare-fun m!31541 () Bool)

(assert (=> b!38872 m!31541))

(declare-fun m!31543 () Bool)

(assert (=> b!38872 m!31543))

(assert (=> b!38872 m!31539))

(declare-fun m!31545 () Bool)

(assert (=> b!38872 m!31545))

(declare-fun m!31547 () Bool)

(assert (=> bm!2945 m!31547))

(assert (=> b!38873 m!31539))

(assert (=> b!38873 m!31539))

(declare-fun m!31549 () Bool)

(assert (=> b!38873 m!31549))

(assert (=> bm!2926 d!6375))

(declare-fun d!6377 () Bool)

(declare-fun lt!14591 () Bool)

(assert (=> d!6377 (= lt!14591 (select (content!25 (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!24678 () Bool)

(assert (=> d!6377 (= lt!14591 e!24678)))

(declare-fun res!23445 () Bool)

(assert (=> d!6377 (=> (not res!23445) (not e!24678))))

(assert (=> d!6377 (= res!23445 ((_ is Cons!1032) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)))))

(assert (=> d!6377 (= (contains!497 (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!14591)))

(declare-fun b!38875 () Bool)

(declare-fun e!24677 () Bool)

(assert (=> b!38875 (= e!24678 e!24677)))

(declare-fun res!23446 () Bool)

(assert (=> b!38875 (=> res!23446 e!24677)))

(assert (=> b!38875 (= res!23446 (= (h!1600 (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38876 () Bool)

(assert (=> b!38876 (= e!24677 (contains!497 (t!3870 (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6377 res!23445) b!38875))

(assert (= (and b!38875 (not res!23446)) b!38876))

(declare-fun m!31551 () Bool)

(assert (=> d!6377 m!31551))

(assert (=> d!6377 m!31329))

(declare-fun m!31553 () Bool)

(assert (=> d!6377 m!31553))

(assert (=> b!38876 m!31329))

(declare-fun m!31555 () Bool)

(assert (=> b!38876 m!31555))

(assert (=> b!38639 d!6377))

(declare-fun d!6379 () Bool)

(assert (not d!6379))

(assert (=> b!38634 d!6379))

(declare-fun d!6381 () Bool)

(assert (=> d!6381 (= (size!1340 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!38755 d!6381))

(declare-fun b!38877 () Bool)

(declare-fun e!24681 () Bool)

(assert (=> b!38877 (= e!24681 (contains!497 (ite c!4440 (Cons!1032 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38878 () Bool)

(declare-fun e!24680 () Bool)

(declare-fun call!2949 () Bool)

(assert (=> b!38878 (= e!24680 call!2949)))

(declare-fun c!4505 () Bool)

(declare-fun bm!2946 () Bool)

(assert (=> bm!2946 (= call!2949 (arrayNoDuplicates!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4505 (Cons!1032 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4440 (Cons!1032 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033))) (ite c!4440 (Cons!1032 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)))))))

(declare-fun b!38879 () Bool)

(declare-fun e!24679 () Bool)

(assert (=> b!38879 (= e!24679 e!24680)))

(assert (=> b!38879 (= c!4505 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38880 () Bool)

(declare-fun e!24682 () Bool)

(assert (=> b!38880 (= e!24682 e!24679)))

(declare-fun res!23448 () Bool)

(assert (=> b!38880 (=> (not res!23448) (not e!24679))))

(assert (=> b!38880 (= res!23448 (not e!24681))))

(declare-fun res!23449 () Bool)

(assert (=> b!38880 (=> (not res!23449) (not e!24681))))

(assert (=> b!38880 (= res!23449 (validKeyInArray!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38881 () Bool)

(assert (=> b!38881 (= e!24680 call!2949)))

(declare-fun d!6383 () Bool)

(declare-fun res!23447 () Bool)

(assert (=> d!6383 (=> res!23447 e!24682)))

(assert (=> d!6383 (= res!23447 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1321 lt!14401)))))

(assert (=> d!6383 (= (arrayNoDuplicates!0 lt!14401 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4440 (Cons!1032 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (ite c!4410 (Cons!1032 (select (arr!1214 lt!14401) #b00000000000000000000000000000000) Nil!1033) Nil!1033))) e!24682)))

(assert (= (and d!6383 (not res!23447)) b!38880))

(assert (= (and b!38880 res!23449) b!38877))

(assert (= (and b!38880 res!23448) b!38879))

(assert (= (and b!38879 c!4505) b!38881))

(assert (= (and b!38879 (not c!4505)) b!38878))

(assert (= (or b!38881 b!38878) bm!2946))

(assert (=> b!38877 m!31499))

(assert (=> b!38877 m!31499))

(declare-fun m!31557 () Bool)

(assert (=> b!38877 m!31557))

(assert (=> bm!2946 m!31499))

(declare-fun m!31559 () Bool)

(assert (=> bm!2946 m!31559))

(assert (=> b!38879 m!31499))

(assert (=> b!38879 m!31499))

(assert (=> b!38879 m!31509))

(assert (=> b!38880 m!31499))

(assert (=> b!38880 m!31499))

(assert (=> b!38880 m!31509))

(assert (=> bm!2927 d!6383))

(assert (=> b!38756 d!6381))

(assert (=> b!38641 d!6373))

(declare-fun d!6385 () Bool)

(declare-fun lt!14592 () Bool)

(assert (=> d!6385 (= lt!14592 (select (content!25 Nil!1033) (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun e!24684 () Bool)

(assert (=> d!6385 (= lt!14592 e!24684)))

(declare-fun res!23450 () Bool)

(assert (=> d!6385 (=> (not res!23450) (not e!24684))))

(assert (=> d!6385 (= res!23450 ((_ is Cons!1032) Nil!1033))))

(assert (=> d!6385 (= (contains!497 Nil!1033 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) lt!14592)))

(declare-fun b!38882 () Bool)

(declare-fun e!24683 () Bool)

(assert (=> b!38882 (= e!24684 e!24683)))

(declare-fun res!23451 () Bool)

(assert (=> b!38882 (=> res!23451 e!24683)))

(assert (=> b!38882 (= res!23451 (= (h!1600 Nil!1033) (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38883 () Bool)

(assert (=> b!38883 (= e!24683 (contains!497 (t!3870 Nil!1033) (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6385 res!23450) b!38882))

(assert (= (and b!38882 (not res!23451)) b!38883))

(assert (=> d!6385 m!31315))

(assert (=> d!6385 m!31307))

(declare-fun m!31561 () Bool)

(assert (=> d!6385 m!31561))

(assert (=> b!38883 m!31307))

(declare-fun m!31563 () Bool)

(assert (=> b!38883 m!31563))

(assert (=> b!38624 d!6385))

(declare-fun b!38884 () Bool)

(declare-fun e!24687 () Bool)

(assert (=> b!38884 (= e!24687 (contains!497 (ite c!4438 (Cons!1032 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1033) Nil!1033) (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38885 () Bool)

(declare-fun e!24686 () Bool)

(declare-fun call!2950 () Bool)

(assert (=> b!38885 (= e!24686 call!2950)))

(declare-fun bm!2947 () Bool)

(declare-fun c!4506 () Bool)

(assert (=> bm!2947 (= call!2950 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4506 (Cons!1032 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4438 (Cons!1032 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) (ite c!4438 (Cons!1032 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1033) Nil!1033))))))

(declare-fun b!38886 () Bool)

(declare-fun e!24685 () Bool)

(assert (=> b!38886 (= e!24685 e!24686)))

(assert (=> b!38886 (= c!4506 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38887 () Bool)

(declare-fun e!24688 () Bool)

(assert (=> b!38887 (= e!24688 e!24685)))

(declare-fun res!23453 () Bool)

(assert (=> b!38887 (=> (not res!23453) (not e!24685))))

(assert (=> b!38887 (= res!23453 (not e!24687))))

(declare-fun res!23454 () Bool)

(assert (=> b!38887 (=> (not res!23454) (not e!24687))))

(assert (=> b!38887 (= res!23454 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38888 () Bool)

(assert (=> b!38888 (= e!24686 call!2950)))

(declare-fun d!6387 () Bool)

(declare-fun res!23452 () Bool)

(assert (=> d!6387 (=> res!23452 e!24688)))

(assert (=> d!6387 (= res!23452 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6387 (= (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4438 (Cons!1032 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1033) Nil!1033)) e!24688)))

(assert (= (and d!6387 (not res!23452)) b!38887))

(assert (= (and b!38887 res!23454) b!38884))

(assert (= (and b!38887 res!23453) b!38886))

(assert (= (and b!38886 c!4506) b!38888))

(assert (= (and b!38886 (not c!4506)) b!38885))

(assert (= (or b!38888 b!38885) bm!2947))

(assert (=> b!38884 m!31539))

(assert (=> b!38884 m!31539))

(declare-fun m!31565 () Bool)

(assert (=> b!38884 m!31565))

(assert (=> bm!2947 m!31539))

(declare-fun m!31567 () Bool)

(assert (=> bm!2947 m!31567))

(assert (=> b!38886 m!31539))

(assert (=> b!38886 m!31539))

(assert (=> b!38886 m!31549))

(assert (=> b!38887 m!31539))

(assert (=> b!38887 m!31539))

(assert (=> b!38887 m!31549))

(assert (=> bm!2925 d!6387))

(assert (=> b!38642 d!6373))

(assert (=> d!6283 d!6253))

(assert (=> b!38626 d!6363))

(declare-fun b!38889 () Bool)

(declare-fun e!24689 () (_ BitVec 32))

(assert (=> b!38889 (= e!24689 #b00000000000000000000000000000000)))

(declare-fun b!38890 () Bool)

(declare-fun e!24690 () (_ BitVec 32))

(declare-fun call!2951 () (_ BitVec 32))

(assert (=> b!38890 (= e!24690 (bvadd #b00000000000000000000000000000001 call!2951))))

(declare-fun bm!2948 () Bool)

(assert (=> bm!2948 (= call!2951 (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38891 () Bool)

(assert (=> b!38891 (= e!24690 call!2951)))

(declare-fun b!38892 () Bool)

(assert (=> b!38892 (= e!24689 e!24690)))

(declare-fun c!4508 () Bool)

(assert (=> b!38892 (= c!4508 (validKeyInArray!0 (select (arr!1214 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6389 () Bool)

(declare-fun lt!14593 () (_ BitVec 32))

(assert (=> d!6389 (and (bvsge lt!14593 #b00000000000000000000000000000000) (bvsle lt!14593 (bvsub (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6389 (= lt!14593 e!24689)))

(declare-fun c!4507 () Bool)

(assert (=> d!6389 (= c!4507 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6389 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6389 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14403 lt!14403 #b00000000000000000000000000000000 lt!14401 (array!2544 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14593)))

(assert (= (and d!6389 c!4507) b!38889))

(assert (= (and d!6389 (not c!4507)) b!38892))

(assert (= (and b!38892 c!4508) b!38890))

(assert (= (and b!38892 (not c!4508)) b!38891))

(assert (= (or b!38890 b!38891) bm!2948))

(declare-fun m!31569 () Bool)

(assert (=> bm!2948 m!31569))

(assert (=> b!38892 m!31539))

(assert (=> b!38892 m!31539))

(assert (=> b!38892 m!31549))

(assert (=> bm!2931 d!6389))

(assert (=> b!38627 d!6363))

(assert (=> d!6287 d!6291))

(declare-fun d!6391 () Bool)

(assert (=> d!6391 (arrayContainsKey!0 lt!14401 lt!14498 #b00000000000000000000000000000000)))

(assert (=> d!6391 true))

(declare-fun _$60!323 () Unit!960)

(assert (=> d!6391 (= (choose!13 lt!14401 lt!14498 #b00000000000000000000000000000000) _$60!323)))

(declare-fun bs!1615 () Bool)

(assert (= bs!1615 d!6391))

(assert (=> bs!1615 m!31285))

(assert (=> d!6287 d!6391))

(declare-fun d!6393 () Bool)

(assert (=> d!6393 (arrayContainsKey!0 lt!14401 lt!14538 #b00000000000000000000000000000000)))

(declare-fun lt!14594 () Unit!960)

(assert (=> d!6393 (= lt!14594 (choose!13 lt!14401 lt!14538 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6393 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6393 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14401 lt!14538 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14594)))

(declare-fun bs!1616 () Bool)

(assert (= bs!1616 d!6393))

(assert (=> bs!1616 m!31395))

(declare-fun m!31571 () Bool)

(assert (=> bs!1616 m!31571))

(assert (=> b!38707 d!6393))

(declare-fun d!6395 () Bool)

(declare-fun res!23455 () Bool)

(declare-fun e!24691 () Bool)

(assert (=> d!6395 (=> res!23455 e!24691)))

(assert (=> d!6395 (= res!23455 (= (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14538))))

(assert (=> d!6395 (= (arrayContainsKey!0 lt!14401 lt!14538 #b00000000000000000000000000000000) e!24691)))

(declare-fun b!38893 () Bool)

(declare-fun e!24692 () Bool)

(assert (=> b!38893 (= e!24691 e!24692)))

(declare-fun res!23456 () Bool)

(assert (=> b!38893 (=> (not res!23456) (not e!24692))))

(assert (=> b!38893 (= res!23456 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1321 lt!14401)))))

(declare-fun b!38894 () Bool)

(assert (=> b!38894 (= e!24692 (arrayContainsKey!0 lt!14401 lt!14538 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6395 (not res!23455)) b!38893))

(assert (= (and b!38893 res!23456) b!38894))

(assert (=> d!6395 m!31217))

(declare-fun m!31573 () Bool)

(assert (=> b!38894 m!31573))

(assert (=> b!38707 d!6395))

(declare-fun b!38895 () Bool)

(declare-fun e!24694 () SeekEntryResult!173)

(declare-fun lt!14595 () SeekEntryResult!173)

(assert (=> b!38895 (= e!24694 (MissingZero!173 (index!2816 lt!14595)))))

(declare-fun b!38896 () Bool)

(declare-fun c!4509 () Bool)

(declare-fun lt!14596 () (_ BitVec 64))

(assert (=> b!38896 (= c!4509 (= lt!14596 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24693 () SeekEntryResult!173)

(assert (=> b!38896 (= e!24693 e!24694)))

(declare-fun b!38897 () Bool)

(declare-fun e!24695 () SeekEntryResult!173)

(assert (=> b!38897 (= e!24695 e!24693)))

(assert (=> b!38897 (= lt!14596 (select (arr!1214 lt!14401) (index!2816 lt!14595)))))

(declare-fun c!4510 () Bool)

(assert (=> b!38897 (= c!4510 (= lt!14596 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6397 () Bool)

(declare-fun lt!14597 () SeekEntryResult!173)

(assert (=> d!6397 (and (or ((_ is Undefined!173) lt!14597) (not ((_ is Found!173) lt!14597)) (and (bvsge (index!2815 lt!14597) #b00000000000000000000000000000000) (bvslt (index!2815 lt!14597) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14597) ((_ is Found!173) lt!14597) (not ((_ is MissingZero!173) lt!14597)) (and (bvsge (index!2814 lt!14597) #b00000000000000000000000000000000) (bvslt (index!2814 lt!14597) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14597) ((_ is Found!173) lt!14597) ((_ is MissingZero!173) lt!14597) (not ((_ is MissingVacant!173) lt!14597)) (and (bvsge (index!2817 lt!14597) #b00000000000000000000000000000000) (bvslt (index!2817 lt!14597) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14597) (ite ((_ is Found!173) lt!14597) (= (select (arr!1214 lt!14401) (index!2815 lt!14597)) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!173) lt!14597) (= (select (arr!1214 lt!14401) (index!2814 lt!14597)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!173) lt!14597) (= (select (arr!1214 lt!14401) (index!2817 lt!14597)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6397 (= lt!14597 e!24695)))

(declare-fun c!4511 () Bool)

(assert (=> d!6397 (= c!4511 (and ((_ is Intermediate!173) lt!14595) (undefined!985 lt!14595)))))

(assert (=> d!6397 (= lt!14595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14401 mask!853))))

(assert (=> d!6397 (validMask!0 mask!853)))

(assert (=> d!6397 (= (seekEntryOrOpen!0 (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14401 mask!853) lt!14597)))

(declare-fun b!38898 () Bool)

(assert (=> b!38898 (= e!24693 (Found!173 (index!2816 lt!14595)))))

(declare-fun b!38899 () Bool)

(assert (=> b!38899 (= e!24695 Undefined!173)))

(declare-fun b!38900 () Bool)

(assert (=> b!38900 (= e!24694 (seekKeyOrZeroReturnVacant!0 (x!7609 lt!14595) (index!2816 lt!14595) (index!2816 lt!14595) (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14401 mask!853))))

(assert (= (and d!6397 c!4511) b!38899))

(assert (= (and d!6397 (not c!4511)) b!38897))

(assert (= (and b!38897 c!4510) b!38898))

(assert (= (and b!38897 (not c!4510)) b!38896))

(assert (= (and b!38896 c!4509) b!38895))

(assert (= (and b!38896 (not c!4509)) b!38900))

(declare-fun m!31575 () Bool)

(assert (=> b!38897 m!31575))

(declare-fun m!31577 () Bool)

(assert (=> d!6397 m!31577))

(declare-fun m!31579 () Bool)

(assert (=> d!6397 m!31579))

(assert (=> d!6397 m!31329))

(declare-fun m!31581 () Bool)

(assert (=> d!6397 m!31581))

(declare-fun m!31583 () Bool)

(assert (=> d!6397 m!31583))

(assert (=> d!6397 m!31157))

(assert (=> d!6397 m!31581))

(assert (=> d!6397 m!31329))

(declare-fun m!31585 () Bool)

(assert (=> d!6397 m!31585))

(assert (=> b!38900 m!31329))

(declare-fun m!31587 () Bool)

(assert (=> b!38900 m!31587))

(assert (=> b!38707 d!6397))

(declare-fun b!38913 () Bool)

(declare-fun e!24704 () SeekEntryResult!173)

(assert (=> b!38913 (= e!24704 (MissingVacant!173 (index!2816 lt!14532)))))

(declare-fun b!38914 () Bool)

(declare-fun e!24702 () SeekEntryResult!173)

(declare-fun e!24703 () SeekEntryResult!173)

(assert (=> b!38914 (= e!24702 e!24703)))

(declare-fun c!4520 () Bool)

(declare-fun lt!14603 () (_ BitVec 64))

(assert (=> b!38914 (= c!4520 (= lt!14603 (select (arr!1214 lt!14401) #b00000000000000000000000000000000)))))

(declare-fun b!38915 () Bool)

(assert (=> b!38915 (= e!24703 (Found!173 (index!2816 lt!14532)))))

(declare-fun d!6399 () Bool)

(declare-fun lt!14602 () SeekEntryResult!173)

(assert (=> d!6399 (and (or ((_ is Undefined!173) lt!14602) (not ((_ is Found!173) lt!14602)) (and (bvsge (index!2815 lt!14602) #b00000000000000000000000000000000) (bvslt (index!2815 lt!14602) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14602) ((_ is Found!173) lt!14602) (not ((_ is MissingVacant!173) lt!14602)) (not (= (index!2817 lt!14602) (index!2816 lt!14532))) (and (bvsge (index!2817 lt!14602) #b00000000000000000000000000000000) (bvslt (index!2817 lt!14602) (size!1321 lt!14401)))) (or ((_ is Undefined!173) lt!14602) (ite ((_ is Found!173) lt!14602) (= (select (arr!1214 lt!14401) (index!2815 lt!14602)) (select (arr!1214 lt!14401) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!173) lt!14602) (= (index!2817 lt!14602) (index!2816 lt!14532)) (= (select (arr!1214 lt!14401) (index!2817 lt!14602)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6399 (= lt!14602 e!24702)))

(declare-fun c!4519 () Bool)

(assert (=> d!6399 (= c!4519 (bvsge (x!7609 lt!14532) #b01111111111111111111111111111110))))

(assert (=> d!6399 (= lt!14603 (select (arr!1214 lt!14401) (index!2816 lt!14532)))))

(assert (=> d!6399 (validMask!0 mask!853)))

(assert (=> d!6399 (= (seekKeyOrZeroReturnVacant!0 (x!7609 lt!14532) (index!2816 lt!14532) (index!2816 lt!14532) (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853) lt!14602)))

(declare-fun b!38916 () Bool)

(assert (=> b!38916 (= e!24702 Undefined!173)))

(declare-fun b!38917 () Bool)

(assert (=> b!38917 (= e!24704 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7609 lt!14532) #b00000000000000000000000000000001) (nextIndex!0 (index!2816 lt!14532) (x!7609 lt!14532) mask!853) (index!2816 lt!14532) (select (arr!1214 lt!14401) #b00000000000000000000000000000000) lt!14401 mask!853))))

(declare-fun b!38918 () Bool)

(declare-fun c!4518 () Bool)

(assert (=> b!38918 (= c!4518 (= lt!14603 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38918 (= e!24703 e!24704)))

(assert (= (and d!6399 c!4519) b!38916))

(assert (= (and d!6399 (not c!4519)) b!38914))

(assert (= (and b!38914 c!4520) b!38915))

(assert (= (and b!38914 (not c!4520)) b!38918))

(assert (= (and b!38918 c!4518) b!38913))

(assert (= (and b!38918 (not c!4518)) b!38917))

(declare-fun m!31589 () Bool)

(assert (=> d!6399 m!31589))

(declare-fun m!31591 () Bool)

(assert (=> d!6399 m!31591))

(assert (=> d!6399 m!31379))

(assert (=> d!6399 m!31157))

(declare-fun m!31593 () Bool)

(assert (=> b!38917 m!31593))

(assert (=> b!38917 m!31593))

(assert (=> b!38917 m!31217))

(declare-fun m!31595 () Bool)

(assert (=> b!38917 m!31595))

(assert (=> b!38703 d!6399))

(assert (=> b!38717 d!6363))

(assert (=> d!6279 d!6239))

(declare-fun d!6401 () Bool)

(declare-fun res!23457 () Bool)

(declare-fun e!24705 () Bool)

(assert (=> d!6401 (=> res!23457 e!24705)))

(assert (=> d!6401 (= res!23457 (= (select (arr!1214 lt!14401) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14498))))

(assert (=> d!6401 (= (arrayContainsKey!0 lt!14401 lt!14498 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!24705)))

(declare-fun b!38919 () Bool)

(declare-fun e!24706 () Bool)

(assert (=> b!38919 (= e!24705 e!24706)))

(declare-fun res!23458 () Bool)

(assert (=> b!38919 (=> (not res!23458) (not e!24706))))

(assert (=> b!38919 (= res!23458 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1321 lt!14401)))))

(declare-fun b!38920 () Bool)

(assert (=> b!38920 (= e!24706 (arrayContainsKey!0 lt!14401 lt!14498 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6401 (not res!23457)) b!38919))

(assert (= (and b!38919 res!23458) b!38920))

(assert (=> d!6401 m!31329))

(declare-fun m!31597 () Bool)

(assert (=> b!38920 m!31597))

(assert (=> b!38659 d!6401))

(assert (=> b!38708 d!6373))

(check-sat (not b!38862) (not b!38872) (not b_lambda!2019) (not b!38894) (not d!6377) b_and!2319 (not bm!2946) (not b!38886) (not b!38876) tp_is_empty!1741 (not d!6371) (not b!38870) (not d!6385) (not b!38877) (not b!38873) (not b!38880) (not b!38864) (not bm!2945) (not d!6397) (not b!38892) (not b!38887) (not b!38854) (not bm!2947) (not b!38829) (not b!38883) (not b!38900) (not b!38917) (not d!6391) (not bm!2948) (not b!38879) (not d!6367) (not bm!2944) (not d!6393) (not d!6357) (not d!6399) (not b!38884) (not b!38920) (not b!38830) (not b_next!1351) (not bm!2943))
(check-sat b_and!2319 (not b_next!1351))
