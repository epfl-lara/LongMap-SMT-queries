; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5366 () Bool)

(assert start!5366)

(declare-fun b_free!1351 () Bool)

(declare-fun b_next!1351 () Bool)

(assert (=> start!5366 (= b_free!1351 (not b_next!1351))))

(declare-fun tp!5714 () Bool)

(declare-fun b_and!2313 () Bool)

(assert (=> start!5366 (= tp!5714 b_and!2313)))

(declare-fun res!23231 () Bool)

(declare-fun e!24417 () Bool)

(assert (=> start!5366 (=> (not res!23231) (not e!24417))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5366 (= res!23231 (validMask!0 mask!853))))

(assert (=> start!5366 e!24417))

(assert (=> start!5366 true))

(assert (=> start!5366 tp!5714))

(declare-datatypes ((array!2553 0))(
  ( (array!2554 (arr!1220 (Array (_ BitVec 32) (_ BitVec 64))) (size!1327 (_ BitVec 32))) )
))
(declare-fun lt!14365 () array!2553)

(declare-datatypes ((V!2081 0))(
  ( (V!2082 (val!909 Int)) )
))
(declare-fun lt!14363 () V!2081)

(declare-fun defaultEntry!470 () Int)

(declare-fun b!38449 () Bool)

(declare-datatypes ((ValueCell!623 0))(
  ( (ValueCellFull!623 (v!1979 V!2081)) (EmptyCell!623) )
))
(declare-datatypes ((array!2555 0))(
  ( (array!2556 (arr!1221 (Array (_ BitVec 32) ValueCell!623)) (size!1328 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!226 0))(
  ( (LongMapFixedSize!227 (defaultEntry!1791 Int) (mask!5112 (_ BitVec 32)) (extraKeys!1682 (_ BitVec 32)) (zeroValue!1709 V!2081) (minValue!1709 V!2081) (_size!162 (_ BitVec 32)) (_keys!3244 array!2553) (_values!1774 array!2555) (_vacant!162 (_ BitVec 32))) )
))
(declare-fun valid!126 (LongMapFixedSize!226) Bool)

(assert (=> b!38449 (= e!24417 (not (valid!126 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1029 0))(
  ( (Nil!1026) (Cons!1025 (h!1593 (_ BitVec 64)) (t!3864 List!1029)) )
))
(declare-fun arrayNoDuplicates!0 (array!2553 (_ BitVec 32) List!1029) Bool)

(assert (=> b!38449 (arrayNoDuplicates!0 lt!14365 #b00000000000000000000000000000000 Nil!1026)))

(declare-datatypes ((Unit!965 0))(
  ( (Unit!966) )
))
(declare-fun lt!14364 () Unit!965)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2553 (_ BitVec 32) (_ BitVec 32) List!1029) Unit!965)

(assert (=> b!38449 (= lt!14364 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2553 (_ BitVec 32)) Bool)

(assert (=> b!38449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14365 mask!853)))

(declare-fun lt!14361 () Unit!965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> b!38449 (= lt!14361 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14365 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38449 (= (arrayCountValidKeys!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14362 () Unit!965)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> b!38449 (= lt!14362 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38449 (= lt!14365 (array!2554 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!180 (Int (_ BitVec 64)) V!2081)

(assert (=> b!38449 (= lt!14363 (dynLambda!180 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5366 res!23231) b!38449))

(declare-fun b_lambda!2009 () Bool)

(assert (=> (not b_lambda!2009) (not b!38449)))

(declare-fun t!3863 () Bool)

(declare-fun tb!821 () Bool)

(assert (=> (and start!5366 (= defaultEntry!470 defaultEntry!470) t!3863) tb!821))

(declare-fun result!1405 () Bool)

(declare-fun tp_is_empty!1741 () Bool)

(assert (=> tb!821 (= result!1405 tp_is_empty!1741)))

(assert (=> b!38449 t!3863))

(declare-fun b_and!2315 () Bool)

(assert (= b_and!2313 (and (=> t!3863 result!1405) b_and!2315)))

(declare-fun m!31075 () Bool)

(assert (=> start!5366 m!31075))

(declare-fun m!31077 () Bool)

(assert (=> b!38449 m!31077))

(declare-fun m!31079 () Bool)

(assert (=> b!38449 m!31079))

(declare-fun m!31081 () Bool)

(assert (=> b!38449 m!31081))

(declare-fun m!31083 () Bool)

(assert (=> b!38449 m!31083))

(declare-fun m!31085 () Bool)

(assert (=> b!38449 m!31085))

(declare-fun m!31087 () Bool)

(assert (=> b!38449 m!31087))

(declare-fun m!31089 () Bool)

(assert (=> b!38449 m!31089))

(declare-fun m!31091 () Bool)

(assert (=> b!38449 m!31091))

(check-sat (not b_next!1351) tp_is_empty!1741 (not b_lambda!2009) (not b!38449) b_and!2315 (not start!5366))
(check-sat b_and!2315 (not b_next!1351))
(get-model)

(declare-fun b_lambda!2019 () Bool)

(assert (= b_lambda!2009 (or (and start!5366 b_free!1351) b_lambda!2019)))

(check-sat (not b_next!1351) tp_is_empty!1741 (not b!38449) (not start!5366) b_and!2315 (not b_lambda!2019))
(check-sat b_and!2315 (not b_next!1351))
(get-model)

(declare-fun d!6221 () Bool)

(assert (=> d!6221 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5366 d!6221))

(declare-fun d!6225 () Bool)

(assert (=> d!6225 (arrayNoDuplicates!0 lt!14365 #b00000000000000000000000000000000 Nil!1026)))

(declare-fun lt!14400 () Unit!965)

(declare-fun choose!111 (array!2553 (_ BitVec 32) (_ BitVec 32) List!1029) Unit!965)

(assert (=> d!6225 (= lt!14400 (choose!111 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1026))))

(assert (=> d!6225 (= (size!1327 lt!14365) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6225 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1026) lt!14400)))

(declare-fun bs!1593 () Bool)

(assert (= bs!1593 d!6225))

(assert (=> bs!1593 m!31089))

(declare-fun m!31129 () Bool)

(assert (=> bs!1593 m!31129))

(assert (=> b!38449 d!6225))

(declare-fun b!38482 () Bool)

(declare-fun e!24434 () (_ BitVec 32))

(declare-fun call!2892 () (_ BitVec 32))

(assert (=> b!38482 (= e!24434 (bvadd #b00000000000000000000000000000001 call!2892))))

(declare-fun b!38483 () Bool)

(declare-fun e!24435 () (_ BitVec 32))

(assert (=> b!38483 (= e!24435 #b00000000000000000000000000000000)))

(declare-fun d!6227 () Bool)

(declare-fun lt!14404 () (_ BitVec 32))

(assert (=> d!6227 (and (bvsge lt!14404 #b00000000000000000000000000000000) (bvsle lt!14404 (bvsub (size!1327 lt!14365) #b00000000000000000000000000000000)))))

(assert (=> d!6227 (= lt!14404 e!24435)))

(declare-fun c!4407 () Bool)

(assert (=> d!6227 (= c!4407 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6227 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1327 lt!14365)))))

(assert (=> d!6227 (= (arrayCountValidKeys!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14404)))

(declare-fun bm!2889 () Bool)

(assert (=> bm!2889 (= call!2892 (arrayCountValidKeys!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38484 () Bool)

(assert (=> b!38484 (= e!24434 call!2892)))

(declare-fun b!38485 () Bool)

(assert (=> b!38485 (= e!24435 e!24434)))

(declare-fun c!4408 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!38485 (= c!4408 (validKeyInArray!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(assert (= (and d!6227 c!4407) b!38483))

(assert (= (and d!6227 (not c!4407)) b!38485))

(assert (= (and b!38485 c!4408) b!38482))

(assert (= (and b!38485 (not c!4408)) b!38484))

(assert (= (or b!38482 b!38484) bm!2889))

(declare-fun m!31137 () Bool)

(assert (=> bm!2889 m!31137))

(declare-fun m!31139 () Bool)

(assert (=> b!38485 m!31139))

(assert (=> b!38485 m!31139))

(declare-fun m!31141 () Bool)

(assert (=> b!38485 m!31141))

(assert (=> b!38449 d!6227))

(declare-fun d!6233 () Bool)

(declare-fun res!23254 () Bool)

(declare-fun e!24453 () Bool)

(assert (=> d!6233 (=> (not res!23254) (not e!24453))))

(declare-fun simpleValid!21 (LongMapFixedSize!226) Bool)

(assert (=> d!6233 (= res!23254 (simpleValid!21 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6233 (= (valid!126 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24453)))

(declare-fun b!38512 () Bool)

(declare-fun res!23255 () Bool)

(assert (=> b!38512 (=> (not res!23255) (not e!24453))))

(assert (=> b!38512 (= res!23255 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38513 () Bool)

(declare-fun res!23256 () Bool)

(assert (=> b!38513 (=> (not res!23256) (not e!24453))))

(assert (=> b!38513 (= res!23256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38514 () Bool)

(assert (=> b!38514 (= e!24453 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1026))))

(assert (= (and d!6233 res!23254) b!38512))

(assert (= (and b!38512 res!23255) b!38513))

(assert (= (and b!38513 res!23256) b!38514))

(declare-fun m!31151 () Bool)

(assert (=> d!6233 m!31151))

(declare-fun m!31153 () Bool)

(assert (=> b!38512 m!31153))

(declare-fun m!31155 () Bool)

(assert (=> b!38513 m!31155))

(declare-fun m!31157 () Bool)

(assert (=> b!38514 m!31157))

(assert (=> b!38449 d!6233))

(declare-fun b!38542 () Bool)

(declare-fun e!24476 () Bool)

(declare-fun e!24477 () Bool)

(assert (=> b!38542 (= e!24476 e!24477)))

(declare-fun lt!14437 () (_ BitVec 64))

(assert (=> b!38542 (= lt!14437 (select (arr!1220 lt!14365) #b00000000000000000000000000000000))))

(declare-fun lt!14435 () Unit!965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2553 (_ BitVec 64) (_ BitVec 32)) Unit!965)

(assert (=> b!38542 (= lt!14435 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14365 lt!14437 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!38542 (arrayContainsKey!0 lt!14365 lt!14437 #b00000000000000000000000000000000)))

(declare-fun lt!14436 () Unit!965)

(assert (=> b!38542 (= lt!14436 lt!14435)))

(declare-fun res!23272 () Bool)

(declare-datatypes ((SeekEntryResult!161 0))(
  ( (MissingZero!161 (index!2766 (_ BitVec 32))) (Found!161 (index!2767 (_ BitVec 32))) (Intermediate!161 (undefined!973 Bool) (index!2768 (_ BitVec 32)) (x!7597 (_ BitVec 32))) (Undefined!161) (MissingVacant!161 (index!2769 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2553 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!38542 (= res!23272 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853) (Found!161 #b00000000000000000000000000000000)))))

(assert (=> b!38542 (=> (not res!23272) (not e!24477))))

(declare-fun b!38543 () Bool)

(declare-fun e!24475 () Bool)

(assert (=> b!38543 (= e!24475 e!24476)))

(declare-fun c!4420 () Bool)

(assert (=> b!38543 (= c!4420 (validKeyInArray!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(declare-fun b!38544 () Bool)

(declare-fun call!2904 () Bool)

(assert (=> b!38544 (= e!24476 call!2904)))

(declare-fun bm!2901 () Bool)

(assert (=> bm!2901 (= call!2904 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14365 mask!853))))

(declare-fun d!6237 () Bool)

(declare-fun res!23273 () Bool)

(assert (=> d!6237 (=> res!23273 e!24475)))

(assert (=> d!6237 (= res!23273 (bvsge #b00000000000000000000000000000000 (size!1327 lt!14365)))))

(assert (=> d!6237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14365 mask!853) e!24475)))

(declare-fun b!38545 () Bool)

(assert (=> b!38545 (= e!24477 call!2904)))

(assert (= (and d!6237 (not res!23273)) b!38543))

(assert (= (and b!38543 c!4420) b!38542))

(assert (= (and b!38543 (not c!4420)) b!38544))

(assert (= (and b!38542 res!23272) b!38545))

(assert (= (or b!38545 b!38544) bm!2901))

(assert (=> b!38542 m!31139))

(declare-fun m!31179 () Bool)

(assert (=> b!38542 m!31179))

(declare-fun m!31181 () Bool)

(assert (=> b!38542 m!31181))

(assert (=> b!38542 m!31139))

(declare-fun m!31183 () Bool)

(assert (=> b!38542 m!31183))

(assert (=> b!38543 m!31139))

(assert (=> b!38543 m!31139))

(assert (=> b!38543 m!31141))

(declare-fun m!31185 () Bool)

(assert (=> bm!2901 m!31185))

(assert (=> b!38449 d!6237))

(declare-fun d!6247 () Bool)

(assert (=> d!6247 (= (arrayCountValidKeys!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14442 () Unit!965)

(declare-fun choose!59 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> d!6247 (= lt!14442 (choose!59 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6247 (bvslt (size!1327 lt!14365) #b01111111111111111111111111111111)))

(assert (=> d!6247 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14442)))

(declare-fun bs!1596 () Bool)

(assert (= bs!1596 d!6247))

(assert (=> bs!1596 m!31081))

(declare-fun m!31187 () Bool)

(assert (=> bs!1596 m!31187))

(assert (=> b!38449 d!6247))

(declare-fun d!6249 () Bool)

(assert (=> d!6249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14365 mask!853)))

(declare-fun lt!14446 () Unit!965)

(declare-fun choose!34 (array!2553 (_ BitVec 32) (_ BitVec 32)) Unit!965)

(assert (=> d!6249 (= lt!14446 (choose!34 lt!14365 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6249 (validMask!0 mask!853)))

(assert (=> d!6249 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14365 mask!853 #b00000000000000000000000000000000) lt!14446)))

(declare-fun bs!1598 () Bool)

(assert (= bs!1598 d!6249))

(assert (=> bs!1598 m!31091))

(declare-fun m!31199 () Bool)

(assert (=> bs!1598 m!31199))

(assert (=> bs!1598 m!31075))

(assert (=> b!38449 d!6249))

(declare-fun bm!2904 () Bool)

(declare-fun call!2907 () Bool)

(declare-fun c!4423 () Bool)

(assert (=> bm!2904 (= call!2907 (arrayNoDuplicates!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)))))

(declare-fun b!38571 () Bool)

(declare-fun e!24493 () Bool)

(assert (=> b!38571 (= e!24493 call!2907)))

(declare-fun b!38572 () Bool)

(declare-fun e!24494 () Bool)

(declare-fun contains!491 (List!1029 (_ BitVec 64)) Bool)

(assert (=> b!38572 (= e!24494 (contains!491 Nil!1026 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(declare-fun b!38573 () Bool)

(assert (=> b!38573 (= e!24493 call!2907)))

(declare-fun d!6255 () Bool)

(declare-fun res!23295 () Bool)

(declare-fun e!24492 () Bool)

(assert (=> d!6255 (=> res!23295 e!24492)))

(assert (=> d!6255 (= res!23295 (bvsge #b00000000000000000000000000000000 (size!1327 lt!14365)))))

(assert (=> d!6255 (= (arrayNoDuplicates!0 lt!14365 #b00000000000000000000000000000000 Nil!1026) e!24492)))

(declare-fun b!38574 () Bool)

(declare-fun e!24491 () Bool)

(assert (=> b!38574 (= e!24491 e!24493)))

(assert (=> b!38574 (= c!4423 (validKeyInArray!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(declare-fun b!38575 () Bool)

(assert (=> b!38575 (= e!24492 e!24491)))

(declare-fun res!23297 () Bool)

(assert (=> b!38575 (=> (not res!23297) (not e!24491))))

(assert (=> b!38575 (= res!23297 (not e!24494))))

(declare-fun res!23296 () Bool)

(assert (=> b!38575 (=> (not res!23296) (not e!24494))))

(assert (=> b!38575 (= res!23296 (validKeyInArray!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(assert (= (and d!6255 (not res!23295)) b!38575))

(assert (= (and b!38575 res!23296) b!38572))

(assert (= (and b!38575 res!23297) b!38574))

(assert (= (and b!38574 c!4423) b!38573))

(assert (= (and b!38574 (not c!4423)) b!38571))

(assert (= (or b!38573 b!38571) bm!2904))

(assert (=> bm!2904 m!31139))

(declare-fun m!31205 () Bool)

(assert (=> bm!2904 m!31205))

(assert (=> b!38572 m!31139))

(assert (=> b!38572 m!31139))

(declare-fun m!31207 () Bool)

(assert (=> b!38572 m!31207))

(assert (=> b!38574 m!31139))

(assert (=> b!38574 m!31139))

(assert (=> b!38574 m!31141))

(assert (=> b!38575 m!31139))

(assert (=> b!38575 m!31139))

(assert (=> b!38575 m!31141))

(assert (=> b!38449 d!6255))

(check-sat (not d!6247) (not bm!2901) (not b!38512) (not b!38543) (not b!38572) (not b!38513) (not b!38485) (not b!38574) (not d!6249) (not d!6225) (not bm!2904) (not d!6233) (not bm!2889) (not b!38575) (not b!38514) (not b_next!1351) (not b!38542) tp_is_empty!1741 b_and!2315 (not b_lambda!2019))
(check-sat b_and!2315 (not b_next!1351))
(get-model)

(declare-fun b!38606 () Bool)

(declare-fun e!24515 () Bool)

(declare-fun e!24516 () Bool)

(assert (=> b!38606 (= e!24515 e!24516)))

(declare-fun lt!14461 () (_ BitVec 64))

(assert (=> b!38606 (= lt!14461 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!14459 () Unit!965)

(assert (=> b!38606 (= lt!14459 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14461 #b00000000000000000000000000000000))))

(assert (=> b!38606 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14461 #b00000000000000000000000000000000)))

(declare-fun lt!14460 () Unit!965)

(assert (=> b!38606 (= lt!14460 lt!14459)))

(declare-fun res!23310 () Bool)

(assert (=> b!38606 (= res!23310 (= (seekEntryOrOpen!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!161 #b00000000000000000000000000000000)))))

(assert (=> b!38606 (=> (not res!23310) (not e!24516))))

(declare-fun b!38607 () Bool)

(declare-fun e!24514 () Bool)

(assert (=> b!38607 (= e!24514 e!24515)))

(declare-fun c!4433 () Bool)

(assert (=> b!38607 (= c!4433 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38608 () Bool)

(declare-fun call!2914 () Bool)

(assert (=> b!38608 (= e!24515 call!2914)))

(declare-fun bm!2911 () Bool)

(assert (=> bm!2911 (= call!2914 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun d!6265 () Bool)

(declare-fun res!23311 () Bool)

(assert (=> d!6265 (=> res!23311 e!24514)))

(assert (=> d!6265 (= res!23311 (bvsge #b00000000000000000000000000000000 (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6265 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24514)))

(declare-fun b!38609 () Bool)

(assert (=> b!38609 (= e!24516 call!2914)))

(assert (= (and d!6265 (not res!23311)) b!38607))

(assert (= (and b!38607 c!4433) b!38606))

(assert (= (and b!38607 (not c!4433)) b!38608))

(assert (= (and b!38606 res!23310) b!38609))

(assert (= (or b!38609 b!38608) bm!2911))

(declare-fun m!31225 () Bool)

(assert (=> b!38606 m!31225))

(declare-fun m!31227 () Bool)

(assert (=> b!38606 m!31227))

(declare-fun m!31229 () Bool)

(assert (=> b!38606 m!31229))

(assert (=> b!38606 m!31225))

(declare-fun m!31231 () Bool)

(assert (=> b!38606 m!31231))

(assert (=> b!38607 m!31225))

(assert (=> b!38607 m!31225))

(declare-fun m!31233 () Bool)

(assert (=> b!38607 m!31233))

(declare-fun m!31235 () Bool)

(assert (=> bm!2911 m!31235))

(assert (=> b!38513 d!6265))

(declare-fun b!38610 () Bool)

(declare-fun e!24517 () (_ BitVec 32))

(declare-fun call!2915 () (_ BitVec 32))

(assert (=> b!38610 (= e!24517 (bvadd #b00000000000000000000000000000001 call!2915))))

(declare-fun b!38611 () Bool)

(declare-fun e!24518 () (_ BitVec 32))

(assert (=> b!38611 (= e!24518 #b00000000000000000000000000000000)))

(declare-fun d!6267 () Bool)

(declare-fun lt!14462 () (_ BitVec 32))

(assert (=> d!6267 (and (bvsge lt!14462 #b00000000000000000000000000000000) (bvsle lt!14462 (bvsub (size!1327 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6267 (= lt!14462 e!24518)))

(declare-fun c!4434 () Bool)

(assert (=> d!6267 (= c!4434 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6267 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1327 lt!14365)))))

(assert (=> d!6267 (= (arrayCountValidKeys!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14462)))

(declare-fun bm!2912 () Bool)

(assert (=> bm!2912 (= call!2915 (arrayCountValidKeys!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38612 () Bool)

(assert (=> b!38612 (= e!24517 call!2915)))

(declare-fun b!38613 () Bool)

(assert (=> b!38613 (= e!24518 e!24517)))

(declare-fun c!4435 () Bool)

(assert (=> b!38613 (= c!4435 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6267 c!4434) b!38611))

(assert (= (and d!6267 (not c!4434)) b!38613))

(assert (= (and b!38613 c!4435) b!38610))

(assert (= (and b!38613 (not c!4435)) b!38612))

(assert (= (or b!38610 b!38612) bm!2912))

(declare-fun m!31237 () Bool)

(assert (=> bm!2912 m!31237))

(declare-fun m!31239 () Bool)

(assert (=> b!38613 m!31239))

(assert (=> b!38613 m!31239))

(declare-fun m!31241 () Bool)

(assert (=> b!38613 m!31241))

(assert (=> bm!2889 d!6267))

(declare-fun d!6269 () Bool)

(assert (=> d!6269 (arrayContainsKey!0 lt!14365 lt!14437 #b00000000000000000000000000000000)))

(declare-fun lt!14465 () Unit!965)

(declare-fun choose!13 (array!2553 (_ BitVec 64) (_ BitVec 32)) Unit!965)

(assert (=> d!6269 (= lt!14465 (choose!13 lt!14365 lt!14437 #b00000000000000000000000000000000))))

(assert (=> d!6269 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6269 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14365 lt!14437 #b00000000000000000000000000000000) lt!14465)))

(declare-fun bs!1602 () Bool)

(assert (= bs!1602 d!6269))

(assert (=> bs!1602 m!31181))

(declare-fun m!31243 () Bool)

(assert (=> bs!1602 m!31243))

(assert (=> b!38542 d!6269))

(declare-fun d!6271 () Bool)

(declare-fun res!23316 () Bool)

(declare-fun e!24523 () Bool)

(assert (=> d!6271 (=> res!23316 e!24523)))

(assert (=> d!6271 (= res!23316 (= (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14437))))

(assert (=> d!6271 (= (arrayContainsKey!0 lt!14365 lt!14437 #b00000000000000000000000000000000) e!24523)))

(declare-fun b!38618 () Bool)

(declare-fun e!24524 () Bool)

(assert (=> b!38618 (= e!24523 e!24524)))

(declare-fun res!23317 () Bool)

(assert (=> b!38618 (=> (not res!23317) (not e!24524))))

(assert (=> b!38618 (= res!23317 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 lt!14365)))))

(declare-fun b!38619 () Bool)

(assert (=> b!38619 (= e!24524 (arrayContainsKey!0 lt!14365 lt!14437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6271 (not res!23316)) b!38618))

(assert (= (and b!38618 res!23317) b!38619))

(assert (=> d!6271 m!31139))

(declare-fun m!31245 () Bool)

(assert (=> b!38619 m!31245))

(assert (=> b!38542 d!6271))

(declare-fun b!38638 () Bool)

(declare-fun e!24539 () SeekEntryResult!161)

(assert (=> b!38638 (= e!24539 Undefined!161)))

(declare-fun e!24537 () SeekEntryResult!161)

(declare-fun lt!14476 () SeekEntryResult!161)

(declare-fun b!38639 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2553 (_ BitVec 32)) SeekEntryResult!161)

(assert (=> b!38639 (= e!24537 (seekKeyOrZeroReturnVacant!0 (x!7597 lt!14476) (index!2768 lt!14476) (index!2768 lt!14476) (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853))))

(declare-fun b!38640 () Bool)

(declare-fun e!24538 () SeekEntryResult!161)

(assert (=> b!38640 (= e!24538 (Found!161 (index!2768 lt!14476)))))

(declare-fun b!38641 () Bool)

(assert (=> b!38641 (= e!24539 e!24538)))

(declare-fun lt!14475 () (_ BitVec 64))

(assert (=> b!38641 (= lt!14475 (select (arr!1220 lt!14365) (index!2768 lt!14476)))))

(declare-fun c!4443 () Bool)

(assert (=> b!38641 (= c!4443 (= lt!14475 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(declare-fun b!38642 () Bool)

(assert (=> b!38642 (= e!24537 (MissingZero!161 (index!2768 lt!14476)))))

(declare-fun b!38643 () Bool)

(declare-fun c!4444 () Bool)

(assert (=> b!38643 (= c!4444 (= lt!14475 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38643 (= e!24538 e!24537)))

(declare-fun d!6273 () Bool)

(declare-fun lt!14477 () SeekEntryResult!161)

(get-info :version)

(assert (=> d!6273 (and (or ((_ is Undefined!161) lt!14477) (not ((_ is Found!161) lt!14477)) (and (bvsge (index!2767 lt!14477) #b00000000000000000000000000000000) (bvslt (index!2767 lt!14477) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14477) ((_ is Found!161) lt!14477) (not ((_ is MissingZero!161) lt!14477)) (and (bvsge (index!2766 lt!14477) #b00000000000000000000000000000000) (bvslt (index!2766 lt!14477) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14477) ((_ is Found!161) lt!14477) ((_ is MissingZero!161) lt!14477) (not ((_ is MissingVacant!161) lt!14477)) (and (bvsge (index!2769 lt!14477) #b00000000000000000000000000000000) (bvslt (index!2769 lt!14477) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14477) (ite ((_ is Found!161) lt!14477) (= (select (arr!1220 lt!14365) (index!2767 lt!14477)) (select (arr!1220 lt!14365) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!161) lt!14477) (= (select (arr!1220 lt!14365) (index!2766 lt!14477)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!161) lt!14477) (= (select (arr!1220 lt!14365) (index!2769 lt!14477)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6273 (= lt!14477 e!24539)))

(declare-fun c!4442 () Bool)

(assert (=> d!6273 (= c!4442 (and ((_ is Intermediate!161) lt!14476) (undefined!973 lt!14476)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2553 (_ BitVec 32)) SeekEntryResult!161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6273 (= lt!14476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) mask!853) (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853))))

(assert (=> d!6273 (validMask!0 mask!853)))

(assert (=> d!6273 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853) lt!14477)))

(assert (= (and d!6273 c!4442) b!38638))

(assert (= (and d!6273 (not c!4442)) b!38641))

(assert (= (and b!38641 c!4443) b!38640))

(assert (= (and b!38641 (not c!4443)) b!38643))

(assert (= (and b!38643 c!4444) b!38642))

(assert (= (and b!38643 (not c!4444)) b!38639))

(assert (=> b!38639 m!31139))

(declare-fun m!31251 () Bool)

(assert (=> b!38639 m!31251))

(declare-fun m!31253 () Bool)

(assert (=> b!38641 m!31253))

(declare-fun m!31255 () Bool)

(assert (=> d!6273 m!31255))

(declare-fun m!31257 () Bool)

(assert (=> d!6273 m!31257))

(assert (=> d!6273 m!31139))

(declare-fun m!31259 () Bool)

(assert (=> d!6273 m!31259))

(declare-fun m!31261 () Bool)

(assert (=> d!6273 m!31261))

(assert (=> d!6273 m!31075))

(assert (=> d!6273 m!31139))

(assert (=> d!6273 m!31257))

(declare-fun m!31263 () Bool)

(assert (=> d!6273 m!31263))

(assert (=> b!38542 d!6273))

(declare-fun b!38644 () Bool)

(declare-fun e!24540 () (_ BitVec 32))

(declare-fun call!2916 () (_ BitVec 32))

(assert (=> b!38644 (= e!24540 (bvadd #b00000000000000000000000000000001 call!2916))))

(declare-fun b!38645 () Bool)

(declare-fun e!24541 () (_ BitVec 32))

(assert (=> b!38645 (= e!24541 #b00000000000000000000000000000000)))

(declare-fun d!6283 () Bool)

(declare-fun lt!14478 () (_ BitVec 32))

(assert (=> d!6283 (and (bvsge lt!14478 #b00000000000000000000000000000000) (bvsle lt!14478 (bvsub (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (=> d!6283 (= lt!14478 e!24541)))

(declare-fun c!4445 () Bool)

(assert (=> d!6283 (= c!4445 (bvsge #b00000000000000000000000000000000 (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6283 (and (bvsle #b00000000000000000000000000000000 (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6283 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14478)))

(declare-fun bm!2913 () Bool)

(assert (=> bm!2913 (= call!2916 (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38646 () Bool)

(assert (=> b!38646 (= e!24540 call!2916)))

(declare-fun b!38647 () Bool)

(assert (=> b!38647 (= e!24541 e!24540)))

(declare-fun c!4446 () Bool)

(assert (=> b!38647 (= c!4446 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6283 c!4445) b!38645))

(assert (= (and d!6283 (not c!4445)) b!38647))

(assert (= (and b!38647 c!4446) b!38644))

(assert (= (and b!38647 (not c!4446)) b!38646))

(assert (= (or b!38644 b!38646) bm!2913))

(declare-fun m!31265 () Bool)

(assert (=> bm!2913 m!31265))

(assert (=> b!38647 m!31225))

(assert (=> b!38647 m!31225))

(assert (=> b!38647 m!31233))

(assert (=> b!38512 d!6283))

(declare-fun d!6285 () Bool)

(assert (=> d!6285 (= (validKeyInArray!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)) (and (not (= (select (arr!1220 lt!14365) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1220 lt!14365) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38543 d!6285))

(declare-fun b!38648 () Bool)

(declare-fun e!24543 () Bool)

(declare-fun e!24544 () Bool)

(assert (=> b!38648 (= e!24543 e!24544)))

(declare-fun lt!14481 () (_ BitVec 64))

(assert (=> b!38648 (= lt!14481 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14479 () Unit!965)

(assert (=> b!38648 (= lt!14479 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14365 lt!14481 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38648 (arrayContainsKey!0 lt!14365 lt!14481 #b00000000000000000000000000000000)))

(declare-fun lt!14480 () Unit!965)

(assert (=> b!38648 (= lt!14480 lt!14479)))

(declare-fun res!23327 () Bool)

(assert (=> b!38648 (= res!23327 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14365 mask!853) (Found!161 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38648 (=> (not res!23327) (not e!24544))))

(declare-fun b!38649 () Bool)

(declare-fun e!24542 () Bool)

(assert (=> b!38649 (= e!24542 e!24543)))

(declare-fun c!4447 () Bool)

(assert (=> b!38649 (= c!4447 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38650 () Bool)

(declare-fun call!2917 () Bool)

(assert (=> b!38650 (= e!24543 call!2917)))

(declare-fun bm!2914 () Bool)

(assert (=> bm!2914 (= call!2917 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14365 mask!853))))

(declare-fun d!6287 () Bool)

(declare-fun res!23328 () Bool)

(assert (=> d!6287 (=> res!23328 e!24542)))

(assert (=> d!6287 (= res!23328 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 lt!14365)))))

(assert (=> d!6287 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14365 mask!853) e!24542)))

(declare-fun b!38651 () Bool)

(assert (=> b!38651 (= e!24544 call!2917)))

(assert (= (and d!6287 (not res!23328)) b!38649))

(assert (= (and b!38649 c!4447) b!38648))

(assert (= (and b!38649 (not c!4447)) b!38650))

(assert (= (and b!38648 res!23327) b!38651))

(assert (= (or b!38651 b!38650) bm!2914))

(assert (=> b!38648 m!31239))

(declare-fun m!31267 () Bool)

(assert (=> b!38648 m!31267))

(declare-fun m!31269 () Bool)

(assert (=> b!38648 m!31269))

(assert (=> b!38648 m!31239))

(declare-fun m!31271 () Bool)

(assert (=> b!38648 m!31271))

(assert (=> b!38649 m!31239))

(assert (=> b!38649 m!31239))

(assert (=> b!38649 m!31241))

(declare-fun m!31273 () Bool)

(assert (=> bm!2914 m!31273))

(assert (=> bm!2901 d!6287))

(declare-fun call!2918 () Bool)

(declare-fun c!4448 () Bool)

(declare-fun bm!2915 () Bool)

(assert (=> bm!2915 (= call!2918 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4448 (Cons!1025 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1026) Nil!1026)))))

(declare-fun b!38652 () Bool)

(declare-fun e!24547 () Bool)

(assert (=> b!38652 (= e!24547 call!2918)))

(declare-fun b!38653 () Bool)

(declare-fun e!24548 () Bool)

(assert (=> b!38653 (= e!24548 (contains!491 Nil!1026 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38654 () Bool)

(assert (=> b!38654 (= e!24547 call!2918)))

(declare-fun d!6289 () Bool)

(declare-fun res!23329 () Bool)

(declare-fun e!24546 () Bool)

(assert (=> d!6289 (=> res!23329 e!24546)))

(assert (=> d!6289 (= res!23329 (bvsge #b00000000000000000000000000000000 (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6289 (= (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1026) e!24546)))

(declare-fun b!38655 () Bool)

(declare-fun e!24545 () Bool)

(assert (=> b!38655 (= e!24545 e!24547)))

(assert (=> b!38655 (= c!4448 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38656 () Bool)

(assert (=> b!38656 (= e!24546 e!24545)))

(declare-fun res!23331 () Bool)

(assert (=> b!38656 (=> (not res!23331) (not e!24545))))

(assert (=> b!38656 (= res!23331 (not e!24548))))

(declare-fun res!23330 () Bool)

(assert (=> b!38656 (=> (not res!23330) (not e!24548))))

(assert (=> b!38656 (= res!23330 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6289 (not res!23329)) b!38656))

(assert (= (and b!38656 res!23330) b!38653))

(assert (= (and b!38656 res!23331) b!38655))

(assert (= (and b!38655 c!4448) b!38654))

(assert (= (and b!38655 (not c!4448)) b!38652))

(assert (= (or b!38654 b!38652) bm!2915))

(assert (=> bm!2915 m!31225))

(declare-fun m!31275 () Bool)

(assert (=> bm!2915 m!31275))

(assert (=> b!38653 m!31225))

(assert (=> b!38653 m!31225))

(declare-fun m!31277 () Bool)

(assert (=> b!38653 m!31277))

(assert (=> b!38655 m!31225))

(assert (=> b!38655 m!31225))

(assert (=> b!38655 m!31233))

(assert (=> b!38656 m!31225))

(assert (=> b!38656 m!31225))

(assert (=> b!38656 m!31233))

(assert (=> b!38514 d!6289))

(declare-fun bm!2916 () Bool)

(declare-fun c!4449 () Bool)

(declare-fun call!2919 () Bool)

(assert (=> bm!2916 (= call!2919 (arrayNoDuplicates!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4449 (Cons!1025 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026))))))

(declare-fun b!38657 () Bool)

(declare-fun e!24551 () Bool)

(assert (=> b!38657 (= e!24551 call!2919)))

(declare-fun b!38658 () Bool)

(declare-fun e!24552 () Bool)

(assert (=> b!38658 (= e!24552 (contains!491 (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38659 () Bool)

(assert (=> b!38659 (= e!24551 call!2919)))

(declare-fun d!6291 () Bool)

(declare-fun res!23332 () Bool)

(declare-fun e!24550 () Bool)

(assert (=> d!6291 (=> res!23332 e!24550)))

(assert (=> d!6291 (= res!23332 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 lt!14365)))))

(assert (=> d!6291 (= (arrayNoDuplicates!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) e!24550)))

(declare-fun b!38660 () Bool)

(declare-fun e!24549 () Bool)

(assert (=> b!38660 (= e!24549 e!24551)))

(assert (=> b!38660 (= c!4449 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38661 () Bool)

(assert (=> b!38661 (= e!24550 e!24549)))

(declare-fun res!23334 () Bool)

(assert (=> b!38661 (=> (not res!23334) (not e!24549))))

(assert (=> b!38661 (= res!23334 (not e!24552))))

(declare-fun res!23333 () Bool)

(assert (=> b!38661 (=> (not res!23333) (not e!24552))))

(assert (=> b!38661 (= res!23333 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6291 (not res!23332)) b!38661))

(assert (= (and b!38661 res!23333) b!38658))

(assert (= (and b!38661 res!23334) b!38660))

(assert (= (and b!38660 c!4449) b!38659))

(assert (= (and b!38660 (not c!4449)) b!38657))

(assert (= (or b!38659 b!38657) bm!2916))

(assert (=> bm!2916 m!31239))

(declare-fun m!31279 () Bool)

(assert (=> bm!2916 m!31279))

(assert (=> b!38658 m!31239))

(assert (=> b!38658 m!31239))

(declare-fun m!31281 () Bool)

(assert (=> b!38658 m!31281))

(assert (=> b!38660 m!31239))

(assert (=> b!38660 m!31239))

(assert (=> b!38660 m!31241))

(assert (=> b!38661 m!31239))

(assert (=> b!38661 m!31239))

(assert (=> b!38661 m!31241))

(assert (=> bm!2904 d!6291))

(assert (=> d!6247 d!6227))

(declare-fun d!6293 () Bool)

(assert (=> d!6293 (= (arrayCountValidKeys!0 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6293 true))

(declare-fun _$88!19 () Unit!965)

(assert (=> d!6293 (= (choose!59 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!19)))

(declare-fun bs!1605 () Bool)

(assert (= bs!1605 d!6293))

(assert (=> bs!1605 m!31081))

(assert (=> d!6247 d!6293))

(assert (=> b!38485 d!6285))

(assert (=> b!38574 d!6285))

(assert (=> d!6225 d!6255))

(declare-fun d!6297 () Bool)

(assert (=> d!6297 (arrayNoDuplicates!0 lt!14365 #b00000000000000000000000000000000 Nil!1026)))

(assert (=> d!6297 true))

(declare-fun res!23337 () Unit!965)

(assert (=> d!6297 (= (choose!111 lt!14365 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1026) res!23337)))

(declare-fun bs!1606 () Bool)

(assert (= bs!1606 d!6297))

(assert (=> bs!1606 m!31089))

(assert (=> d!6225 d!6297))

(declare-fun d!6301 () Bool)

(declare-fun lt!14489 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!26 (List!1029) (InoxSet (_ BitVec 64)))

(assert (=> d!6301 (= lt!14489 (select (content!26 Nil!1026) (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(declare-fun e!24568 () Bool)

(assert (=> d!6301 (= lt!14489 e!24568)))

(declare-fun res!23349 () Bool)

(assert (=> d!6301 (=> (not res!23349) (not e!24568))))

(assert (=> d!6301 (= res!23349 ((_ is Cons!1025) Nil!1026))))

(assert (=> d!6301 (= (contains!491 Nil!1026 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)) lt!14489)))

(declare-fun b!38680 () Bool)

(declare-fun e!24567 () Bool)

(assert (=> b!38680 (= e!24568 e!24567)))

(declare-fun res!23348 () Bool)

(assert (=> b!38680 (=> res!23348 e!24567)))

(assert (=> b!38680 (= res!23348 (= (h!1593 Nil!1026) (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(declare-fun b!38681 () Bool)

(assert (=> b!38681 (= e!24567 (contains!491 (t!3864 Nil!1026) (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(assert (= (and d!6301 res!23349) b!38680))

(assert (= (and b!38680 (not res!23348)) b!38681))

(declare-fun m!31297 () Bool)

(assert (=> d!6301 m!31297))

(assert (=> d!6301 m!31139))

(declare-fun m!31301 () Bool)

(assert (=> d!6301 m!31301))

(assert (=> b!38681 m!31139))

(declare-fun m!31303 () Bool)

(assert (=> b!38681 m!31303))

(assert (=> b!38572 d!6301))

(declare-fun b!38722 () Bool)

(declare-fun res!23372 () Bool)

(declare-fun e!24583 () Bool)

(assert (=> b!38722 (=> (not res!23372) (not e!24583))))

(declare-fun size!1346 (LongMapFixedSize!226) (_ BitVec 32))

(assert (=> b!38722 (= res!23372 (= (size!1346 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!38720 () Bool)

(declare-fun res!23370 () Bool)

(assert (=> b!38720 (=> (not res!23370) (not e!24583))))

(assert (=> b!38720 (= res!23370 (and (= (size!1328 (_values!1774 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001)) (= (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1328 (_values!1774 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001))))))

(declare-fun b!38723 () Bool)

(assert (=> b!38723 (= e!24583 (and (bvsge (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000011) (bvsge (_vacant!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000)))))

(declare-fun b!38721 () Bool)

(declare-fun res!23373 () Bool)

(assert (=> b!38721 (=> (not res!23373) (not e!24583))))

(assert (=> b!38721 (= res!23373 (bvsge (size!1346 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun d!6305 () Bool)

(declare-fun res!23371 () Bool)

(assert (=> d!6305 (=> (not res!23371) (not e!24583))))

(assert (=> d!6305 (= res!23371 (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6305 (= (simpleValid!21 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24583)))

(assert (= (and d!6305 res!23371) b!38720))

(assert (= (and b!38720 res!23370) b!38721))

(assert (= (and b!38721 res!23373) b!38722))

(assert (= (and b!38722 res!23372) b!38723))

(declare-fun m!31325 () Bool)

(assert (=> b!38722 m!31325))

(assert (=> b!38721 m!31325))

(declare-fun m!31327 () Bool)

(assert (=> d!6305 m!31327))

(assert (=> d!6233 d!6305))

(assert (=> d!6249 d!6237))

(declare-fun d!6313 () Bool)

(assert (=> d!6313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14365 mask!853)))

(assert (=> d!6313 true))

(declare-fun _$30!33 () Unit!965)

(assert (=> d!6313 (= (choose!34 lt!14365 mask!853 #b00000000000000000000000000000000) _$30!33)))

(declare-fun bs!1607 () Bool)

(assert (= bs!1607 d!6313))

(assert (=> bs!1607 m!31091))

(assert (=> d!6249 d!6313))

(assert (=> d!6249 d!6221))

(assert (=> b!38575 d!6285))

(check-sat (not b!38606) (not b_next!1351) (not b!38607) (not b!38721) (not b!38639) (not d!6301) (not b!38649) (not b!38613) (not b!38648) (not b!38661) (not b!38681) (not bm!2916) (not bm!2911) (not bm!2913) (not bm!2915) (not b!38658) (not d!6297) tp_is_empty!1741 (not b!38656) (not d!6313) (not d!6293) (not d!6269) (not d!6305) (not b!38653) (not b!38619) (not d!6273) (not b!38655) (not b!38647) (not bm!2914) (not b!38660) b_and!2315 (not b_lambda!2019) (not b!38722) (not bm!2912))
(check-sat b_and!2315 (not b_next!1351))
(get-model)

(assert (=> d!6293 d!6227))

(declare-fun d!6355 () Bool)

(assert (=> d!6355 (= (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38607 d!6355))

(declare-fun d!6357 () Bool)

(assert (=> d!6357 (= (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (and (or (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000001111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000011111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000001111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000011111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000001111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000011111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000001111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000011111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000001111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000011111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000001111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000011111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000001111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000011111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000001111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000011111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00001111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00011111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)) (bvsle (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)))))

(assert (=> d!6305 d!6357))

(declare-fun d!6359 () Bool)

(assert (=> d!6359 (= (content!26 Nil!1026) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!6301 d!6359))

(assert (=> d!6297 d!6255))

(declare-fun b!38810 () Bool)

(declare-fun e!24641 () Bool)

(declare-fun e!24642 () Bool)

(assert (=> b!38810 (= e!24641 e!24642)))

(declare-fun lt!14530 () (_ BitVec 64))

(assert (=> b!38810 (= lt!14530 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14528 () Unit!965)

(assert (=> b!38810 (= lt!14528 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14530 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38810 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14530 #b00000000000000000000000000000000)))

(declare-fun lt!14529 () Unit!965)

(assert (=> b!38810 (= lt!14529 lt!14528)))

(declare-fun res!23421 () Bool)

(assert (=> b!38810 (= res!23421 (= (seekEntryOrOpen!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!161 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38810 (=> (not res!23421) (not e!24642))))

(declare-fun b!38811 () Bool)

(declare-fun e!24640 () Bool)

(assert (=> b!38811 (= e!24640 e!24641)))

(declare-fun c!4484 () Bool)

(assert (=> b!38811 (= c!4484 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38812 () Bool)

(declare-fun call!2932 () Bool)

(assert (=> b!38812 (= e!24641 call!2932)))

(declare-fun bm!2929 () Bool)

(assert (=> bm!2929 (= call!2932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun d!6361 () Bool)

(declare-fun res!23422 () Bool)

(assert (=> d!6361 (=> res!23422 e!24640)))

(assert (=> d!6361 (= res!23422 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6361 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24640)))

(declare-fun b!38813 () Bool)

(assert (=> b!38813 (= e!24642 call!2932)))

(assert (= (and d!6361 (not res!23422)) b!38811))

(assert (= (and b!38811 c!4484) b!38810))

(assert (= (and b!38811 (not c!4484)) b!38812))

(assert (= (and b!38810 res!23421) b!38813))

(assert (= (or b!38813 b!38812) bm!2929))

(declare-fun m!31417 () Bool)

(assert (=> b!38810 m!31417))

(declare-fun m!31419 () Bool)

(assert (=> b!38810 m!31419))

(declare-fun m!31421 () Bool)

(assert (=> b!38810 m!31421))

(assert (=> b!38810 m!31417))

(declare-fun m!31423 () Bool)

(assert (=> b!38810 m!31423))

(assert (=> b!38811 m!31417))

(assert (=> b!38811 m!31417))

(declare-fun m!31425 () Bool)

(assert (=> b!38811 m!31425))

(declare-fun m!31427 () Bool)

(assert (=> bm!2929 m!31427))

(assert (=> bm!2911 d!6361))

(declare-fun b!38814 () Bool)

(declare-fun e!24643 () (_ BitVec 32))

(declare-fun call!2933 () (_ BitVec 32))

(assert (=> b!38814 (= e!24643 (bvadd #b00000000000000000000000000000001 call!2933))))

(declare-fun b!38815 () Bool)

(declare-fun e!24644 () (_ BitVec 32))

(assert (=> b!38815 (= e!24644 #b00000000000000000000000000000000)))

(declare-fun lt!14531 () (_ BitVec 32))

(declare-fun d!6363 () Bool)

(assert (=> d!6363 (and (bvsge lt!14531 #b00000000000000000000000000000000) (bvsle lt!14531 (bvsub (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6363 (= lt!14531 e!24644)))

(declare-fun c!4485 () Bool)

(assert (=> d!6363 (= c!4485 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6363 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6363 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14531)))

(declare-fun bm!2930 () Bool)

(assert (=> bm!2930 (= call!2933 (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38816 () Bool)

(assert (=> b!38816 (= e!24643 call!2933)))

(declare-fun b!38817 () Bool)

(assert (=> b!38817 (= e!24644 e!24643)))

(declare-fun c!4486 () Bool)

(assert (=> b!38817 (= c!4486 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6363 c!4485) b!38815))

(assert (= (and d!6363 (not c!4485)) b!38817))

(assert (= (and b!38817 c!4486) b!38814))

(assert (= (and b!38817 (not c!4486)) b!38816))

(assert (= (or b!38814 b!38816) bm!2930))

(declare-fun m!31429 () Bool)

(assert (=> bm!2930 m!31429))

(assert (=> b!38817 m!31417))

(assert (=> b!38817 m!31417))

(assert (=> b!38817 m!31425))

(assert (=> bm!2913 d!6363))

(declare-fun d!6365 () Bool)

(assert (=> d!6365 (= (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38649 d!6365))

(declare-fun d!6367 () Bool)

(assert (=> d!6367 (arrayContainsKey!0 lt!14365 lt!14481 #b00000000000000000000000000000000)))

(declare-fun lt!14532 () Unit!965)

(assert (=> d!6367 (= lt!14532 (choose!13 lt!14365 lt!14481 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6367 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6367 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14365 lt!14481 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14532)))

(declare-fun bs!1614 () Bool)

(assert (= bs!1614 d!6367))

(assert (=> bs!1614 m!31269))

(declare-fun m!31431 () Bool)

(assert (=> bs!1614 m!31431))

(assert (=> b!38648 d!6367))

(declare-fun d!6369 () Bool)

(declare-fun res!23423 () Bool)

(declare-fun e!24645 () Bool)

(assert (=> d!6369 (=> res!23423 e!24645)))

(assert (=> d!6369 (= res!23423 (= (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14481))))

(assert (=> d!6369 (= (arrayContainsKey!0 lt!14365 lt!14481 #b00000000000000000000000000000000) e!24645)))

(declare-fun b!38818 () Bool)

(declare-fun e!24646 () Bool)

(assert (=> b!38818 (= e!24645 e!24646)))

(declare-fun res!23424 () Bool)

(assert (=> b!38818 (=> (not res!23424) (not e!24646))))

(assert (=> b!38818 (= res!23424 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 lt!14365)))))

(declare-fun b!38819 () Bool)

(assert (=> b!38819 (= e!24646 (arrayContainsKey!0 lt!14365 lt!14481 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6369 (not res!23423)) b!38818))

(assert (= (and b!38818 res!23424) b!38819))

(assert (=> d!6369 m!31139))

(declare-fun m!31433 () Bool)

(assert (=> b!38819 m!31433))

(assert (=> b!38648 d!6369))

(declare-fun b!38820 () Bool)

(declare-fun e!24649 () SeekEntryResult!161)

(assert (=> b!38820 (= e!24649 Undefined!161)))

(declare-fun e!24647 () SeekEntryResult!161)

(declare-fun b!38821 () Bool)

(declare-fun lt!14534 () SeekEntryResult!161)

(assert (=> b!38821 (= e!24647 (seekKeyOrZeroReturnVacant!0 (x!7597 lt!14534) (index!2768 lt!14534) (index!2768 lt!14534) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14365 mask!853))))

(declare-fun b!38822 () Bool)

(declare-fun e!24648 () SeekEntryResult!161)

(assert (=> b!38822 (= e!24648 (Found!161 (index!2768 lt!14534)))))

(declare-fun b!38823 () Bool)

(assert (=> b!38823 (= e!24649 e!24648)))

(declare-fun lt!14533 () (_ BitVec 64))

(assert (=> b!38823 (= lt!14533 (select (arr!1220 lt!14365) (index!2768 lt!14534)))))

(declare-fun c!4488 () Bool)

(assert (=> b!38823 (= c!4488 (= lt!14533 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38824 () Bool)

(assert (=> b!38824 (= e!24647 (MissingZero!161 (index!2768 lt!14534)))))

(declare-fun b!38825 () Bool)

(declare-fun c!4489 () Bool)

(assert (=> b!38825 (= c!4489 (= lt!14533 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38825 (= e!24648 e!24647)))

(declare-fun d!6371 () Bool)

(declare-fun lt!14535 () SeekEntryResult!161)

(assert (=> d!6371 (and (or ((_ is Undefined!161) lt!14535) (not ((_ is Found!161) lt!14535)) (and (bvsge (index!2767 lt!14535) #b00000000000000000000000000000000) (bvslt (index!2767 lt!14535) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14535) ((_ is Found!161) lt!14535) (not ((_ is MissingZero!161) lt!14535)) (and (bvsge (index!2766 lt!14535) #b00000000000000000000000000000000) (bvslt (index!2766 lt!14535) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14535) ((_ is Found!161) lt!14535) ((_ is MissingZero!161) lt!14535) (not ((_ is MissingVacant!161) lt!14535)) (and (bvsge (index!2769 lt!14535) #b00000000000000000000000000000000) (bvslt (index!2769 lt!14535) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14535) (ite ((_ is Found!161) lt!14535) (= (select (arr!1220 lt!14365) (index!2767 lt!14535)) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!161) lt!14535) (= (select (arr!1220 lt!14365) (index!2766 lt!14535)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!161) lt!14535) (= (select (arr!1220 lt!14365) (index!2769 lt!14535)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6371 (= lt!14535 e!24649)))

(declare-fun c!4487 () Bool)

(assert (=> d!6371 (= c!4487 (and ((_ is Intermediate!161) lt!14534) (undefined!973 lt!14534)))))

(assert (=> d!6371 (= lt!14534 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14365 mask!853))))

(assert (=> d!6371 (validMask!0 mask!853)))

(assert (=> d!6371 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14365 mask!853) lt!14535)))

(assert (= (and d!6371 c!4487) b!38820))

(assert (= (and d!6371 (not c!4487)) b!38823))

(assert (= (and b!38823 c!4488) b!38822))

(assert (= (and b!38823 (not c!4488)) b!38825))

(assert (= (and b!38825 c!4489) b!38824))

(assert (= (and b!38825 (not c!4489)) b!38821))

(assert (=> b!38821 m!31239))

(declare-fun m!31435 () Bool)

(assert (=> b!38821 m!31435))

(declare-fun m!31437 () Bool)

(assert (=> b!38823 m!31437))

(declare-fun m!31439 () Bool)

(assert (=> d!6371 m!31439))

(declare-fun m!31441 () Bool)

(assert (=> d!6371 m!31441))

(assert (=> d!6371 m!31239))

(declare-fun m!31443 () Bool)

(assert (=> d!6371 m!31443))

(declare-fun m!31445 () Bool)

(assert (=> d!6371 m!31445))

(assert (=> d!6371 m!31075))

(assert (=> d!6371 m!31239))

(assert (=> d!6371 m!31441))

(declare-fun m!31447 () Bool)

(assert (=> d!6371 m!31447))

(assert (=> b!38648 d!6371))

(assert (=> d!6313 d!6237))

(assert (=> b!38647 d!6355))

(declare-fun b!38826 () Bool)

(declare-fun e!24650 () (_ BitVec 32))

(declare-fun call!2934 () (_ BitVec 32))

(assert (=> b!38826 (= e!24650 (bvadd #b00000000000000000000000000000001 call!2934))))

(declare-fun b!38827 () Bool)

(declare-fun e!24651 () (_ BitVec 32))

(assert (=> b!38827 (= e!24651 #b00000000000000000000000000000000)))

(declare-fun d!6373 () Bool)

(declare-fun lt!14536 () (_ BitVec 32))

(assert (=> d!6373 (and (bvsge lt!14536 #b00000000000000000000000000000000) (bvsle lt!14536 (bvsub (size!1327 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6373 (= lt!14536 e!24651)))

(declare-fun c!4490 () Bool)

(assert (=> d!6373 (= c!4490 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6373 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1327 lt!14365)))))

(assert (=> d!6373 (= (arrayCountValidKeys!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14536)))

(declare-fun bm!2931 () Bool)

(assert (=> bm!2931 (= call!2934 (arrayCountValidKeys!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38828 () Bool)

(assert (=> b!38828 (= e!24650 call!2934)))

(declare-fun b!38829 () Bool)

(assert (=> b!38829 (= e!24651 e!24650)))

(declare-fun c!4491 () Bool)

(assert (=> b!38829 (= c!4491 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6373 c!4490) b!38827))

(assert (= (and d!6373 (not c!4490)) b!38829))

(assert (= (and b!38829 c!4491) b!38826))

(assert (= (and b!38829 (not c!4491)) b!38828))

(assert (= (or b!38826 b!38828) bm!2931))

(declare-fun m!31449 () Bool)

(assert (=> bm!2931 m!31449))

(declare-fun m!31451 () Bool)

(assert (=> b!38829 m!31451))

(assert (=> b!38829 m!31451))

(declare-fun m!31453 () Bool)

(assert (=> b!38829 m!31453))

(assert (=> bm!2912 d!6373))

(declare-fun d!6375 () Bool)

(assert (=> d!6375 (= (size!1346 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!38721 d!6375))

(declare-fun d!6377 () Bool)

(assert (not d!6377))

(assert (=> b!38681 d!6377))

(assert (=> b!38613 d!6365))

(declare-fun call!2935 () Bool)

(declare-fun c!4492 () Bool)

(declare-fun bm!2932 () Bool)

(assert (=> bm!2932 (= call!2935 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4492 (Cons!1025 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4448 (Cons!1025 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (ite c!4448 (Cons!1025 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1026) Nil!1026))))))

(declare-fun b!38830 () Bool)

(declare-fun e!24654 () Bool)

(assert (=> b!38830 (= e!24654 call!2935)))

(declare-fun e!24655 () Bool)

(declare-fun b!38831 () Bool)

(assert (=> b!38831 (= e!24655 (contains!491 (ite c!4448 (Cons!1025 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1026) Nil!1026) (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38832 () Bool)

(assert (=> b!38832 (= e!24654 call!2935)))

(declare-fun d!6379 () Bool)

(declare-fun res!23425 () Bool)

(declare-fun e!24653 () Bool)

(assert (=> d!6379 (=> res!23425 e!24653)))

(assert (=> d!6379 (= res!23425 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6379 (= (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4448 (Cons!1025 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) e!24653)))

(declare-fun b!38833 () Bool)

(declare-fun e!24652 () Bool)

(assert (=> b!38833 (= e!24652 e!24654)))

(assert (=> b!38833 (= c!4492 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38834 () Bool)

(assert (=> b!38834 (= e!24653 e!24652)))

(declare-fun res!23427 () Bool)

(assert (=> b!38834 (=> (not res!23427) (not e!24652))))

(assert (=> b!38834 (= res!23427 (not e!24655))))

(declare-fun res!23426 () Bool)

(assert (=> b!38834 (=> (not res!23426) (not e!24655))))

(assert (=> b!38834 (= res!23426 (validKeyInArray!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6379 (not res!23425)) b!38834))

(assert (= (and b!38834 res!23426) b!38831))

(assert (= (and b!38834 res!23427) b!38833))

(assert (= (and b!38833 c!4492) b!38832))

(assert (= (and b!38833 (not c!4492)) b!38830))

(assert (= (or b!38832 b!38830) bm!2932))

(assert (=> bm!2932 m!31417))

(declare-fun m!31455 () Bool)

(assert (=> bm!2932 m!31455))

(assert (=> b!38831 m!31417))

(assert (=> b!38831 m!31417))

(declare-fun m!31457 () Bool)

(assert (=> b!38831 m!31457))

(assert (=> b!38833 m!31417))

(assert (=> b!38833 m!31417))

(assert (=> b!38833 m!31425))

(assert (=> b!38834 m!31417))

(assert (=> b!38834 m!31417))

(assert (=> b!38834 m!31425))

(assert (=> bm!2915 d!6379))

(declare-fun d!6381 () Bool)

(declare-fun lt!14537 () Bool)

(assert (=> d!6381 (= lt!14537 (select (content!26 Nil!1026) (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun e!24657 () Bool)

(assert (=> d!6381 (= lt!14537 e!24657)))

(declare-fun res!23429 () Bool)

(assert (=> d!6381 (=> (not res!23429) (not e!24657))))

(assert (=> d!6381 (= res!23429 ((_ is Cons!1025) Nil!1026))))

(assert (=> d!6381 (= (contains!491 Nil!1026 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) lt!14537)))

(declare-fun b!38835 () Bool)

(declare-fun e!24656 () Bool)

(assert (=> b!38835 (= e!24657 e!24656)))

(declare-fun res!23428 () Bool)

(assert (=> b!38835 (=> res!23428 e!24656)))

(assert (=> b!38835 (= res!23428 (= (h!1593 Nil!1026) (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38836 () Bool)

(assert (=> b!38836 (= e!24656 (contains!491 (t!3864 Nil!1026) (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6381 res!23429) b!38835))

(assert (= (and b!38835 (not res!23428)) b!38836))

(assert (=> d!6381 m!31297))

(assert (=> d!6381 m!31225))

(declare-fun m!31459 () Bool)

(assert (=> d!6381 m!31459))

(assert (=> b!38836 m!31225))

(declare-fun m!31461 () Bool)

(assert (=> b!38836 m!31461))

(assert (=> b!38653 d!6381))

(declare-fun d!6383 () Bool)

(declare-fun res!23430 () Bool)

(declare-fun e!24658 () Bool)

(assert (=> d!6383 (=> res!23430 e!24658)))

(assert (=> d!6383 (= res!23430 (= (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14437))))

(assert (=> d!6383 (= (arrayContainsKey!0 lt!14365 lt!14437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!24658)))

(declare-fun b!38837 () Bool)

(declare-fun e!24659 () Bool)

(assert (=> b!38837 (= e!24658 e!24659)))

(declare-fun res!23431 () Bool)

(assert (=> b!38837 (=> (not res!23431) (not e!24659))))

(assert (=> b!38837 (= res!23431 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1327 lt!14365)))))

(declare-fun b!38838 () Bool)

(assert (=> b!38838 (= e!24659 (arrayContainsKey!0 lt!14365 lt!14437 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6383 (not res!23430)) b!38837))

(assert (= (and b!38837 res!23431) b!38838))

(assert (=> d!6383 m!31239))

(declare-fun m!31463 () Bool)

(assert (=> b!38838 m!31463))

(assert (=> b!38619 d!6383))

(assert (=> b!38722 d!6375))

(declare-fun b!38839 () Bool)

(declare-fun e!24661 () Bool)

(declare-fun e!24662 () Bool)

(assert (=> b!38839 (= e!24661 e!24662)))

(declare-fun lt!14540 () (_ BitVec 64))

(assert (=> b!38839 (= lt!14540 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!14538 () Unit!965)

(assert (=> b!38839 (= lt!14538 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14365 lt!14540 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!38839 (arrayContainsKey!0 lt!14365 lt!14540 #b00000000000000000000000000000000)))

(declare-fun lt!14539 () Unit!965)

(assert (=> b!38839 (= lt!14539 lt!14538)))

(declare-fun res!23432 () Bool)

(assert (=> b!38839 (= res!23432 (= (seekEntryOrOpen!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14365 mask!853) (Found!161 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!38839 (=> (not res!23432) (not e!24662))))

(declare-fun b!38840 () Bool)

(declare-fun e!24660 () Bool)

(assert (=> b!38840 (= e!24660 e!24661)))

(declare-fun c!4493 () Bool)

(assert (=> b!38840 (= c!4493 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38841 () Bool)

(declare-fun call!2936 () Bool)

(assert (=> b!38841 (= e!24661 call!2936)))

(declare-fun bm!2933 () Bool)

(assert (=> bm!2933 (= call!2936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14365 mask!853))))

(declare-fun d!6385 () Bool)

(declare-fun res!23433 () Bool)

(assert (=> d!6385 (=> res!23433 e!24660)))

(assert (=> d!6385 (= res!23433 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1327 lt!14365)))))

(assert (=> d!6385 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14365 mask!853) e!24660)))

(declare-fun b!38842 () Bool)

(assert (=> b!38842 (= e!24662 call!2936)))

(assert (= (and d!6385 (not res!23433)) b!38840))

(assert (= (and b!38840 c!4493) b!38839))

(assert (= (and b!38840 (not c!4493)) b!38841))

(assert (= (and b!38839 res!23432) b!38842))

(assert (= (or b!38842 b!38841) bm!2933))

(assert (=> b!38839 m!31451))

(declare-fun m!31465 () Bool)

(assert (=> b!38839 m!31465))

(declare-fun m!31467 () Bool)

(assert (=> b!38839 m!31467))

(assert (=> b!38839 m!31451))

(declare-fun m!31469 () Bool)

(assert (=> b!38839 m!31469))

(assert (=> b!38840 m!31451))

(assert (=> b!38840 m!31451))

(assert (=> b!38840 m!31453))

(declare-fun m!31471 () Bool)

(assert (=> bm!2933 m!31471))

(assert (=> bm!2914 d!6385))

(assert (=> b!38656 d!6355))

(declare-fun call!2937 () Bool)

(declare-fun bm!2934 () Bool)

(declare-fun c!4494 () Bool)

(assert (=> bm!2934 (= call!2937 (arrayNoDuplicates!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4494 (Cons!1025 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4449 (Cons!1025 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026))) (ite c!4449 (Cons!1025 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)))))))

(declare-fun b!38843 () Bool)

(declare-fun e!24665 () Bool)

(assert (=> b!38843 (= e!24665 call!2937)))

(declare-fun b!38844 () Bool)

(declare-fun e!24666 () Bool)

(assert (=> b!38844 (= e!24666 (contains!491 (ite c!4449 (Cons!1025 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38845 () Bool)

(assert (=> b!38845 (= e!24665 call!2937)))

(declare-fun d!6387 () Bool)

(declare-fun res!23434 () Bool)

(declare-fun e!24664 () Bool)

(assert (=> d!6387 (=> res!23434 e!24664)))

(assert (=> d!6387 (= res!23434 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1327 lt!14365)))))

(assert (=> d!6387 (= (arrayNoDuplicates!0 lt!14365 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4449 (Cons!1025 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026))) e!24664)))

(declare-fun b!38846 () Bool)

(declare-fun e!24663 () Bool)

(assert (=> b!38846 (= e!24663 e!24665)))

(assert (=> b!38846 (= c!4494 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!38847 () Bool)

(assert (=> b!38847 (= e!24664 e!24663)))

(declare-fun res!23436 () Bool)

(assert (=> b!38847 (=> (not res!23436) (not e!24663))))

(assert (=> b!38847 (= res!23436 (not e!24666))))

(declare-fun res!23435 () Bool)

(assert (=> b!38847 (=> (not res!23435) (not e!24666))))

(assert (=> b!38847 (= res!23435 (validKeyInArray!0 (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6387 (not res!23434)) b!38847))

(assert (= (and b!38847 res!23435) b!38844))

(assert (= (and b!38847 res!23436) b!38846))

(assert (= (and b!38846 c!4494) b!38845))

(assert (= (and b!38846 (not c!4494)) b!38843))

(assert (= (or b!38845 b!38843) bm!2934))

(assert (=> bm!2934 m!31451))

(declare-fun m!31473 () Bool)

(assert (=> bm!2934 m!31473))

(assert (=> b!38844 m!31451))

(assert (=> b!38844 m!31451))

(declare-fun m!31475 () Bool)

(assert (=> b!38844 m!31475))

(assert (=> b!38846 m!31451))

(assert (=> b!38846 m!31451))

(assert (=> b!38846 m!31453))

(assert (=> b!38847 m!31451))

(assert (=> b!38847 m!31451))

(assert (=> b!38847 m!31453))

(assert (=> bm!2916 d!6387))

(assert (=> b!38655 d!6355))

(declare-fun b!38866 () Bool)

(declare-fun lt!14546 () SeekEntryResult!161)

(assert (=> b!38866 (and (bvsge (index!2768 lt!14546) #b00000000000000000000000000000000) (bvslt (index!2768 lt!14546) (size!1327 lt!14365)))))

(declare-fun res!23445 () Bool)

(assert (=> b!38866 (= res!23445 (= (select (arr!1220 lt!14365) (index!2768 lt!14546)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24677 () Bool)

(assert (=> b!38866 (=> res!23445 e!24677)))

(declare-fun b!38867 () Bool)

(declare-fun e!24679 () SeekEntryResult!161)

(assert (=> b!38867 (= e!24679 (Intermediate!161 true (toIndex!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!38868 () Bool)

(declare-fun e!24681 () Bool)

(assert (=> b!38868 (= e!24681 (bvsge (x!7597 lt!14546) #b01111111111111111111111111111110))))

(declare-fun b!38869 () Bool)

(declare-fun e!24678 () SeekEntryResult!161)

(assert (=> b!38869 (= e!24679 e!24678)))

(declare-fun c!4501 () Bool)

(declare-fun lt!14545 () (_ BitVec 64))

(assert (=> b!38869 (= c!4501 (or (= lt!14545 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)) (= (bvadd lt!14545 lt!14545) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!38870 () Bool)

(assert (=> b!38870 (= e!24678 (Intermediate!161 false (toIndex!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun d!6389 () Bool)

(assert (=> d!6389 e!24681))

(declare-fun c!4502 () Bool)

(assert (=> d!6389 (= c!4502 (and ((_ is Intermediate!161) lt!14546) (undefined!973 lt!14546)))))

(assert (=> d!6389 (= lt!14546 e!24679)))

(declare-fun c!4503 () Bool)

(assert (=> d!6389 (= c!4503 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6389 (= lt!14545 (select (arr!1220 lt!14365) (toIndex!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6389 (validMask!0 mask!853)))

(assert (=> d!6389 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) mask!853) (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853) lt!14546)))

(declare-fun b!38871 () Bool)

(assert (=> b!38871 (and (bvsge (index!2768 lt!14546) #b00000000000000000000000000000000) (bvslt (index!2768 lt!14546) (size!1327 lt!14365)))))

(assert (=> b!38871 (= e!24677 (= (select (arr!1220 lt!14365) (index!2768 lt!14546)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38872 () Bool)

(assert (=> b!38872 (and (bvsge (index!2768 lt!14546) #b00000000000000000000000000000000) (bvslt (index!2768 lt!14546) (size!1327 lt!14365)))))

(declare-fun res!23443 () Bool)

(assert (=> b!38872 (= res!23443 (= (select (arr!1220 lt!14365) (index!2768 lt!14546)) (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(assert (=> b!38872 (=> res!23443 e!24677)))

(declare-fun e!24680 () Bool)

(assert (=> b!38872 (= e!24680 e!24677)))

(declare-fun b!38873 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38873 (= e!24678 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) mask!853) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!853) (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853))))

(declare-fun b!38874 () Bool)

(assert (=> b!38874 (= e!24681 e!24680)))

(declare-fun res!23444 () Bool)

(assert (=> b!38874 (= res!23444 (and ((_ is Intermediate!161) lt!14546) (not (undefined!973 lt!14546)) (bvslt (x!7597 lt!14546) #b01111111111111111111111111111110) (bvsge (x!7597 lt!14546) #b00000000000000000000000000000000) (bvsge (x!7597 lt!14546) #b00000000000000000000000000000000)))))

(assert (=> b!38874 (=> (not res!23444) (not e!24680))))

(assert (= (and d!6389 c!4503) b!38867))

(assert (= (and d!6389 (not c!4503)) b!38869))

(assert (= (and b!38869 c!4501) b!38870))

(assert (= (and b!38869 (not c!4501)) b!38873))

(assert (= (and d!6389 c!4502) b!38868))

(assert (= (and d!6389 (not c!4502)) b!38874))

(assert (= (and b!38874 res!23444) b!38872))

(assert (= (and b!38872 (not res!23443)) b!38866))

(assert (= (and b!38866 (not res!23445)) b!38871))

(declare-fun m!31477 () Bool)

(assert (=> b!38871 m!31477))

(assert (=> d!6389 m!31257))

(declare-fun m!31479 () Bool)

(assert (=> d!6389 m!31479))

(assert (=> d!6389 m!31075))

(assert (=> b!38872 m!31477))

(assert (=> b!38873 m!31257))

(declare-fun m!31481 () Bool)

(assert (=> b!38873 m!31481))

(assert (=> b!38873 m!31481))

(assert (=> b!38873 m!31139))

(declare-fun m!31483 () Bool)

(assert (=> b!38873 m!31483))

(assert (=> b!38866 m!31477))

(assert (=> d!6273 d!6389))

(declare-fun d!6391 () Bool)

(declare-fun lt!14552 () (_ BitVec 32))

(declare-fun lt!14551 () (_ BitVec 32))

(assert (=> d!6391 (= lt!14552 (bvmul (bvxor lt!14551 (bvlshr lt!14551 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6391 (= lt!14551 ((_ extract 31 0) (bvand (bvxor (select (arr!1220 lt!14365) #b00000000000000000000000000000000) (bvlshr (select (arr!1220 lt!14365) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6391 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23446 (let ((h!1596 ((_ extract 31 0) (bvand (bvxor (select (arr!1220 lt!14365) #b00000000000000000000000000000000) (bvlshr (select (arr!1220 lt!14365) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7608 (bvmul (bvxor h!1596 (bvlshr h!1596 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7608 (bvlshr x!7608 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23446 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23446 #b00000000000000000000000000000000))))))

(assert (=> d!6391 (= (toIndex!0 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!14552 (bvlshr lt!14552 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6273 d!6391))

(assert (=> d!6273 d!6221))

(declare-fun b!38887 () Bool)

(declare-fun e!24689 () SeekEntryResult!161)

(declare-fun e!24688 () SeekEntryResult!161)

(assert (=> b!38887 (= e!24689 e!24688)))

(declare-fun c!4510 () Bool)

(declare-fun lt!14558 () (_ BitVec 64))

(assert (=> b!38887 (= c!4510 (= lt!14558 (select (arr!1220 lt!14365) #b00000000000000000000000000000000)))))

(declare-fun b!38888 () Bool)

(assert (=> b!38888 (= e!24688 (Found!161 (index!2768 lt!14476)))))

(declare-fun b!38889 () Bool)

(declare-fun c!4512 () Bool)

(assert (=> b!38889 (= c!4512 (= lt!14558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!24690 () SeekEntryResult!161)

(assert (=> b!38889 (= e!24688 e!24690)))

(declare-fun b!38890 () Bool)

(assert (=> b!38890 (= e!24690 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7597 lt!14476) #b00000000000000000000000000000001) (nextIndex!0 (index!2768 lt!14476) (bvadd (x!7597 lt!14476) #b00000000000000000000000000000001) mask!853) (index!2768 lt!14476) (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853))))

(declare-fun b!38891 () Bool)

(assert (=> b!38891 (= e!24690 (MissingVacant!161 (index!2768 lt!14476)))))

(declare-fun d!6393 () Bool)

(declare-fun lt!14557 () SeekEntryResult!161)

(assert (=> d!6393 (and (or ((_ is Undefined!161) lt!14557) (not ((_ is Found!161) lt!14557)) (and (bvsge (index!2767 lt!14557) #b00000000000000000000000000000000) (bvslt (index!2767 lt!14557) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14557) ((_ is Found!161) lt!14557) (not ((_ is MissingVacant!161) lt!14557)) (not (= (index!2769 lt!14557) (index!2768 lt!14476))) (and (bvsge (index!2769 lt!14557) #b00000000000000000000000000000000) (bvslt (index!2769 lt!14557) (size!1327 lt!14365)))) (or ((_ is Undefined!161) lt!14557) (ite ((_ is Found!161) lt!14557) (= (select (arr!1220 lt!14365) (index!2767 lt!14557)) (select (arr!1220 lt!14365) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!161) lt!14557) (= (index!2769 lt!14557) (index!2768 lt!14476)) (= (select (arr!1220 lt!14365) (index!2769 lt!14557)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6393 (= lt!14557 e!24689)))

(declare-fun c!4511 () Bool)

(assert (=> d!6393 (= c!4511 (bvsge (x!7597 lt!14476) #b01111111111111111111111111111110))))

(assert (=> d!6393 (= lt!14558 (select (arr!1220 lt!14365) (index!2768 lt!14476)))))

(assert (=> d!6393 (validMask!0 mask!853)))

(assert (=> d!6393 (= (seekKeyOrZeroReturnVacant!0 (x!7597 lt!14476) (index!2768 lt!14476) (index!2768 lt!14476) (select (arr!1220 lt!14365) #b00000000000000000000000000000000) lt!14365 mask!853) lt!14557)))

(declare-fun b!38892 () Bool)

(assert (=> b!38892 (= e!24689 Undefined!161)))

(assert (= (and d!6393 c!4511) b!38892))

(assert (= (and d!6393 (not c!4511)) b!38887))

(assert (= (and b!38887 c!4510) b!38888))

(assert (= (and b!38887 (not c!4510)) b!38889))

(assert (= (and b!38889 c!4512) b!38891))

(assert (= (and b!38889 (not c!4512)) b!38890))

(declare-fun m!31485 () Bool)

(assert (=> b!38890 m!31485))

(assert (=> b!38890 m!31485))

(assert (=> b!38890 m!31139))

(declare-fun m!31487 () Bool)

(assert (=> b!38890 m!31487))

(declare-fun m!31489 () Bool)

(assert (=> d!6393 m!31489))

(declare-fun m!31491 () Bool)

(assert (=> d!6393 m!31491))

(assert (=> d!6393 m!31253))

(assert (=> d!6393 m!31075))

(assert (=> b!38639 d!6393))

(declare-fun d!6395 () Bool)

(declare-fun lt!14559 () Bool)

(assert (=> d!6395 (= lt!14559 (select (content!26 (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!24692 () Bool)

(assert (=> d!6395 (= lt!14559 e!24692)))

(declare-fun res!23448 () Bool)

(assert (=> d!6395 (=> (not res!23448) (not e!24692))))

(assert (=> d!6395 (= res!23448 ((_ is Cons!1025) (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)))))

(assert (=> d!6395 (= (contains!491 (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!14559)))

(declare-fun b!38893 () Bool)

(declare-fun e!24691 () Bool)

(assert (=> b!38893 (= e!24692 e!24691)))

(declare-fun res!23447 () Bool)

(assert (=> b!38893 (=> res!23447 e!24691)))

(assert (=> b!38893 (= res!23447 (= (h!1593 (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38894 () Bool)

(assert (=> b!38894 (= e!24691 (contains!491 (t!3864 (ite c!4423 (Cons!1025 (select (arr!1220 lt!14365) #b00000000000000000000000000000000) Nil!1026) Nil!1026)) (select (arr!1220 lt!14365) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6395 res!23448) b!38893))

(assert (= (and b!38893 (not res!23447)) b!38894))

(declare-fun m!31493 () Bool)

(assert (=> d!6395 m!31493))

(assert (=> d!6395 m!31239))

(declare-fun m!31495 () Bool)

(assert (=> d!6395 m!31495))

(assert (=> b!38894 m!31239))

(declare-fun m!31497 () Bool)

(assert (=> b!38894 m!31497))

(assert (=> b!38658 d!6395))

(assert (=> b!38660 d!6365))

(assert (=> d!6269 d!6271))

(declare-fun d!6397 () Bool)

(assert (=> d!6397 (arrayContainsKey!0 lt!14365 lt!14437 #b00000000000000000000000000000000)))

(assert (=> d!6397 true))

(declare-fun _$60!323 () Unit!965)

(assert (=> d!6397 (= (choose!13 lt!14365 lt!14437 #b00000000000000000000000000000000) _$60!323)))

(declare-fun bs!1615 () Bool)

(assert (= bs!1615 d!6397))

(assert (=> bs!1615 m!31181))

(assert (=> d!6269 d!6397))

(assert (=> b!38661 d!6365))

(declare-fun d!6399 () Bool)

(assert (=> d!6399 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14461 #b00000000000000000000000000000000)))

(declare-fun lt!14560 () Unit!965)

(assert (=> d!6399 (= lt!14560 (choose!13 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14461 #b00000000000000000000000000000000))))

(assert (=> d!6399 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6399 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14461 #b00000000000000000000000000000000) lt!14560)))

(declare-fun bs!1616 () Bool)

(assert (= bs!1616 d!6399))

(assert (=> bs!1616 m!31229))

(declare-fun m!31499 () Bool)

(assert (=> bs!1616 m!31499))

(assert (=> b!38606 d!6399))

(declare-fun d!6401 () Bool)

(declare-fun res!23449 () Bool)

(declare-fun e!24693 () Bool)

(assert (=> d!6401 (=> res!23449 e!24693)))

(assert (=> d!6401 (= res!23449 (= (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) lt!14461))))

(assert (=> d!6401 (= (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14461 #b00000000000000000000000000000000) e!24693)))

(declare-fun b!38895 () Bool)

(declare-fun e!24694 () Bool)

(assert (=> b!38895 (= e!24693 e!24694)))

(declare-fun res!23450 () Bool)

(assert (=> b!38895 (=> (not res!23450) (not e!24694))))

(assert (=> b!38895 (= res!23450 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38896 () Bool)

(assert (=> b!38896 (= e!24694 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14461 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6401 (not res!23449)) b!38895))

(assert (= (and b!38895 res!23450) b!38896))

(assert (=> d!6401 m!31225))

(declare-fun m!31501 () Bool)

(assert (=> b!38896 m!31501))

(assert (=> b!38606 d!6401))

(declare-fun b!38897 () Bool)

(declare-fun e!24697 () SeekEntryResult!161)

(assert (=> b!38897 (= e!24697 Undefined!161)))

(declare-fun b!38898 () Bool)

(declare-fun lt!14562 () SeekEntryResult!161)

(declare-fun e!24695 () SeekEntryResult!161)

(assert (=> b!38898 (= e!24695 (seekKeyOrZeroReturnVacant!0 (x!7597 lt!14562) (index!2768 lt!14562) (index!2768 lt!14562) (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38899 () Bool)

(declare-fun e!24696 () SeekEntryResult!161)

(assert (=> b!38899 (= e!24696 (Found!161 (index!2768 lt!14562)))))

(declare-fun b!38900 () Bool)

(assert (=> b!38900 (= e!24697 e!24696)))

(declare-fun lt!14561 () (_ BitVec 64))

(assert (=> b!38900 (= lt!14561 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2768 lt!14562)))))

(declare-fun c!4514 () Bool)

(assert (=> b!38900 (= c!4514 (= lt!14561 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38901 () Bool)

(assert (=> b!38901 (= e!24695 (MissingZero!161 (index!2768 lt!14562)))))

(declare-fun b!38902 () Bool)

(declare-fun c!4515 () Bool)

(assert (=> b!38902 (= c!4515 (= lt!14561 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38902 (= e!24696 e!24695)))

(declare-fun lt!14563 () SeekEntryResult!161)

(declare-fun d!6403 () Bool)

(assert (=> d!6403 (and (or ((_ is Undefined!161) lt!14563) (not ((_ is Found!161) lt!14563)) (and (bvsge (index!2767 lt!14563) #b00000000000000000000000000000000) (bvslt (index!2767 lt!14563) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!161) lt!14563) ((_ is Found!161) lt!14563) (not ((_ is MissingZero!161) lt!14563)) (and (bvsge (index!2766 lt!14563) #b00000000000000000000000000000000) (bvslt (index!2766 lt!14563) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!161) lt!14563) ((_ is Found!161) lt!14563) ((_ is MissingZero!161) lt!14563) (not ((_ is MissingVacant!161) lt!14563)) (and (bvsge (index!2769 lt!14563) #b00000000000000000000000000000000) (bvslt (index!2769 lt!14563) (size!1327 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or ((_ is Undefined!161) lt!14563) (ite ((_ is Found!161) lt!14563) (= (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2767 lt!14563)) (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!161) lt!14563) (= (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2766 lt!14563)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!161) lt!14563) (= (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2769 lt!14563)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6403 (= lt!14563 e!24697)))

(declare-fun c!4513 () Bool)

(assert (=> d!6403 (= c!4513 (and ((_ is Intermediate!161) lt!14562) (undefined!973 lt!14562)))))

(assert (=> d!6403 (= lt!14562 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6403 (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6403 (= (seekEntryOrOpen!0 (select (arr!1220 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14363 lt!14363 #b00000000000000000000000000000000 lt!14365 (array!2556 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) lt!14563)))

(assert (= (and d!6403 c!4513) b!38897))

(assert (= (and d!6403 (not c!4513)) b!38900))

(assert (= (and b!38900 c!4514) b!38899))

(assert (= (and b!38900 (not c!4514)) b!38902))

(assert (= (and b!38902 c!4515) b!38901))

(assert (= (and b!38902 (not c!4515)) b!38898))

(assert (=> b!38898 m!31225))

(declare-fun m!31503 () Bool)

(assert (=> b!38898 m!31503))

(declare-fun m!31505 () Bool)

(assert (=> b!38900 m!31505))

(declare-fun m!31507 () Bool)

(assert (=> d!6403 m!31507))

(declare-fun m!31509 () Bool)

(assert (=> d!6403 m!31509))

(assert (=> d!6403 m!31225))

(declare-fun m!31511 () Bool)

(assert (=> d!6403 m!31511))

(declare-fun m!31513 () Bool)

(assert (=> d!6403 m!31513))

(assert (=> d!6403 m!31327))

(assert (=> d!6403 m!31225))

(assert (=> d!6403 m!31509))

(declare-fun m!31515 () Bool)

(assert (=> d!6403 m!31515))

(assert (=> b!38606 d!6403))

(check-sat (not b!38821) (not bm!2932) (not b!38839) tp_is_empty!1741 (not b!38829) (not b!38834) (not b!38844) (not bm!2930) (not b!38847) (not b!38898) (not b!38838) (not bm!2931) (not d!6367) (not b!38836) (not b!38896) (not b!38833) (not d!6397) (not b_next!1351) (not bm!2934) (not b!38873) (not d!6395) (not b!38810) (not d!6371) (not b!38817) (not bm!2933) (not b!38840) (not d!6393) (not b!38831) (not b!38846) (not b!38819) (not d!6403) (not d!6399) (not b!38894) b_and!2315 (not b_lambda!2019) (not d!6389) (not b!38811) (not bm!2929) (not d!6381) (not b!38890))
(check-sat b_and!2315 (not b_next!1351))
