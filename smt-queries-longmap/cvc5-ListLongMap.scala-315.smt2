; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5362 () Bool)

(assert start!5362)

(declare-fun b_free!1351 () Bool)

(declare-fun b_next!1351 () Bool)

(assert (=> start!5362 (= b_free!1351 (not b_next!1351))))

(declare-fun tp!5714 () Bool)

(declare-fun b_and!2315 () Bool)

(assert (=> start!5362 (= tp!5714 b_and!2315)))

(declare-fun res!23256 () Bool)

(declare-fun e!24454 () Bool)

(assert (=> start!5362 (=> (not res!23256) (not e!24454))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5362 (= res!23256 (validMask!0 mask!853))))

(assert (=> start!5362 e!24454))

(assert (=> start!5362 true))

(assert (=> start!5362 tp!5714))

(declare-datatypes ((array!2567 0))(
  ( (array!2568 (arr!1227 (Array (_ BitVec 32) (_ BitVec 64))) (size!1334 (_ BitVec 32))) )
))
(declare-fun lt!14408 () array!2567)

(declare-fun b!38506 () Bool)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2081 0))(
  ( (V!2082 (val!909 Int)) )
))
(declare-fun lt!14407 () V!2081)

(declare-datatypes ((ValueCell!623 0))(
  ( (ValueCellFull!623 (v!1978 V!2081)) (EmptyCell!623) )
))
(declare-datatypes ((array!2569 0))(
  ( (array!2570 (arr!1228 (Array (_ BitVec 32) ValueCell!623)) (size!1335 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!226 0))(
  ( (LongMapFixedSize!227 (defaultEntry!1791 Int) (mask!5112 (_ BitVec 32)) (extraKeys!1682 (_ BitVec 32)) (zeroValue!1709 V!2081) (minValue!1709 V!2081) (_size!162 (_ BitVec 32)) (_keys!3244 array!2567) (_values!1774 array!2569) (_vacant!162 (_ BitVec 32))) )
))
(declare-fun valid!112 (LongMapFixedSize!226) Bool)

(assert (=> b!38506 (= e!24454 (not (valid!112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-datatypes ((List!1043 0))(
  ( (Nil!1040) (Cons!1039 (h!1607 (_ BitVec 64)) (t!3878 List!1043)) )
))
(declare-fun arrayNoDuplicates!0 (array!2567 (_ BitVec 32) List!1043) Bool)

(assert (=> b!38506 (arrayNoDuplicates!0 lt!14408 #b00000000000000000000000000000000 Nil!1040)))

(declare-datatypes ((Unit!959 0))(
  ( (Unit!960) )
))
(declare-fun lt!14406 () Unit!959)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2567 (_ BitVec 32) (_ BitVec 32) List!1043) Unit!959)

(assert (=> b!38506 (= lt!14406 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1040))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2567 (_ BitVec 32)) Bool)

(assert (=> b!38506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14408 mask!853)))

(declare-fun lt!14405 () Unit!959)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2567 (_ BitVec 32) (_ BitVec 32)) Unit!959)

(assert (=> b!38506 (= lt!14405 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14408 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38506 (= (arrayCountValidKeys!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14404 () Unit!959)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2567 (_ BitVec 32) (_ BitVec 32)) Unit!959)

(assert (=> b!38506 (= lt!14404 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38506 (= lt!14408 (array!2568 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!184 (Int (_ BitVec 64)) V!2081)

(assert (=> b!38506 (= lt!14407 (dynLambda!184 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5362 res!23256) b!38506))

(declare-fun b_lambda!2009 () Bool)

(assert (=> (not b_lambda!2009) (not b!38506)))

(declare-fun t!3877 () Bool)

(declare-fun tb!821 () Bool)

(assert (=> (and start!5362 (= defaultEntry!470 defaultEntry!470) t!3877) tb!821))

(declare-fun result!1405 () Bool)

(declare-fun tp_is_empty!1741 () Bool)

(assert (=> tb!821 (= result!1405 tp_is_empty!1741)))

(assert (=> b!38506 t!3877))

(declare-fun b_and!2317 () Bool)

(assert (= b_and!2315 (and (=> t!3877 result!1405) b_and!2317)))

(declare-fun m!31201 () Bool)

(assert (=> start!5362 m!31201))

(declare-fun m!31203 () Bool)

(assert (=> b!38506 m!31203))

(declare-fun m!31205 () Bool)

(assert (=> b!38506 m!31205))

(declare-fun m!31207 () Bool)

(assert (=> b!38506 m!31207))

(declare-fun m!31209 () Bool)

(assert (=> b!38506 m!31209))

(declare-fun m!31211 () Bool)

(assert (=> b!38506 m!31211))

(declare-fun m!31213 () Bool)

(assert (=> b!38506 m!31213))

(declare-fun m!31215 () Bool)

(assert (=> b!38506 m!31215))

(declare-fun m!31217 () Bool)

(assert (=> b!38506 m!31217))

(push 1)

(assert (not b!38506))

(assert b_and!2317)

(assert (not start!5362))

(assert (not b_lambda!2009))

(assert tp_is_empty!1741)

(assert (not b_next!1351))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2317)

(assert (not b_next!1351))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2017 () Bool)

(assert (= b_lambda!2009 (or (and start!5362 b_free!1351) b_lambda!2017)))

(push 1)

(assert (not b!38506))

(assert b_and!2317)

(assert (not start!5362))

(assert tp_is_empty!1741)

(assert (not b_lambda!2017))

(assert (not b_next!1351))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2317)

(assert (not b_next!1351))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6231 () Bool)

(assert (=> d!6231 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5362 d!6231))

(declare-fun b!38542 () Bool)

(declare-fun e!24480 () Bool)

(declare-fun e!24479 () Bool)

(assert (=> b!38542 (= e!24480 e!24479)))

(declare-fun c!4418 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!38542 (= c!4418 (validKeyInArray!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(declare-fun bm!2903 () Bool)

(declare-fun call!2906 () Bool)

(assert (=> bm!2903 (= call!2906 (arrayNoDuplicates!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)))))

(declare-fun b!38543 () Bool)

(assert (=> b!38543 (= e!24479 call!2906)))

(declare-fun b!38544 () Bool)

(assert (=> b!38544 (= e!24479 call!2906)))

(declare-fun b!38545 () Bool)

(declare-fun e!24478 () Bool)

(assert (=> b!38545 (= e!24478 e!24480)))

(declare-fun res!23275 () Bool)

(assert (=> b!38545 (=> (not res!23275) (not e!24480))))

(declare-fun e!24481 () Bool)

(assert (=> b!38545 (= res!23275 (not e!24481))))

(declare-fun res!23276 () Bool)

(assert (=> b!38545 (=> (not res!23276) (not e!24481))))

(assert (=> b!38545 (= res!23276 (validKeyInArray!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(declare-fun d!6239 () Bool)

(declare-fun res!23277 () Bool)

(assert (=> d!6239 (=> res!23277 e!24478)))

(assert (=> d!6239 (= res!23277 (bvsge #b00000000000000000000000000000000 (size!1334 lt!14408)))))

(assert (=> d!6239 (= (arrayNoDuplicates!0 lt!14408 #b00000000000000000000000000000000 Nil!1040) e!24478)))

(declare-fun b!38541 () Bool)

(declare-fun contains!500 (List!1043 (_ BitVec 64)) Bool)

(assert (=> b!38541 (= e!24481 (contains!500 Nil!1040 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(assert (= (and d!6239 (not res!23277)) b!38545))

(assert (= (and b!38545 res!23276) b!38541))

(assert (= (and b!38545 res!23275) b!38542))

(assert (= (and b!38542 c!4418) b!38544))

(assert (= (and b!38542 (not c!4418)) b!38543))

(assert (= (or b!38544 b!38543) bm!2903))

(declare-fun m!31271 () Bool)

(assert (=> b!38542 m!31271))

(assert (=> b!38542 m!31271))

(declare-fun m!31273 () Bool)

(assert (=> b!38542 m!31273))

(assert (=> bm!2903 m!31271))

(declare-fun m!31275 () Bool)

(assert (=> bm!2903 m!31275))

(assert (=> b!38545 m!31271))

(assert (=> b!38545 m!31271))

(assert (=> b!38545 m!31273))

(assert (=> b!38541 m!31271))

(assert (=> b!38541 m!31271))

(declare-fun m!31277 () Bool)

(assert (=> b!38541 m!31277))

(assert (=> b!38506 d!6239))

(declare-fun d!6247 () Bool)

(declare-fun res!23293 () Bool)

(declare-fun e!24502 () Bool)

(assert (=> d!6247 (=> (not res!23293) (not e!24502))))

(declare-fun simpleValid!21 (LongMapFixedSize!226) Bool)

(assert (=> d!6247 (= res!23293 (simpleValid!21 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6247 (= (valid!112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24502)))

(declare-fun b!38579 () Bool)

(declare-fun res!23294 () Bool)

(assert (=> b!38579 (=> (not res!23294) (not e!24502))))

(assert (=> b!38579 (= res!23294 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38580 () Bool)

(declare-fun res!23295 () Bool)

(assert (=> b!38580 (=> (not res!23295) (not e!24502))))

(assert (=> b!38580 (= res!23295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(declare-fun b!38581 () Bool)

(assert (=> b!38581 (= e!24502 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1040))))

(assert (= (and d!6247 res!23293) b!38579))

(assert (= (and b!38579 res!23294) b!38580))

(assert (= (and b!38580 res!23295) b!38581))

(declare-fun m!31289 () Bool)

(assert (=> d!6247 m!31289))

(declare-fun m!31291 () Bool)

(assert (=> b!38579 m!31291))

(declare-fun m!31293 () Bool)

(assert (=> b!38580 m!31293))

(declare-fun m!31295 () Bool)

(assert (=> b!38581 m!31295))

(assert (=> b!38506 d!6247))

(declare-fun d!6253 () Bool)

(assert (=> d!6253 (arrayNoDuplicates!0 lt!14408 #b00000000000000000000000000000000 Nil!1040)))

(declare-fun lt!14462 () Unit!959)

(declare-fun choose!111 (array!2567 (_ BitVec 32) (_ BitVec 32) List!1043) Unit!959)

(assert (=> d!6253 (= lt!14462 (choose!111 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1040))))

(assert (=> d!6253 (= (size!1334 lt!14408) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6253 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1040) lt!14462)))

(declare-fun bs!1597 () Bool)

(assert (= bs!1597 d!6253))

(assert (=> bs!1597 m!31207))

(declare-fun m!31299 () Bool)

(assert (=> bs!1597 m!31299))

(assert (=> b!38506 d!6253))

(declare-fun b!38623 () Bool)

(declare-fun e!24530 () Bool)

(declare-fun call!2921 () Bool)

(assert (=> b!38623 (= e!24530 call!2921)))

(declare-fun b!38624 () Bool)

(declare-fun e!24531 () Bool)

(assert (=> b!38624 (= e!24531 call!2921)))

(declare-fun b!38625 () Bool)

(assert (=> b!38625 (= e!24530 e!24531)))

(declare-fun lt!14473 () (_ BitVec 64))

(assert (=> b!38625 (= lt!14473 (select (arr!1227 lt!14408) #b00000000000000000000000000000000))))

(declare-fun lt!14472 () Unit!959)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2567 (_ BitVec 64) (_ BitVec 32)) Unit!959)

(assert (=> b!38625 (= lt!14472 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14408 lt!14473 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!38625 (arrayContainsKey!0 lt!14408 lt!14473 #b00000000000000000000000000000000)))

(declare-fun lt!14474 () Unit!959)

(assert (=> b!38625 (= lt!14474 lt!14472)))

(declare-fun res!23316 () Bool)

(declare-datatypes ((SeekEntryResult!167 0))(
  ( (MissingZero!167 (index!2790 (_ BitVec 32))) (Found!167 (index!2791 (_ BitVec 32))) (Intermediate!167 (undefined!979 Bool) (index!2792 (_ BitVec 32)) (x!7603 (_ BitVec 32))) (Undefined!167) (MissingVacant!167 (index!2793 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2567 (_ BitVec 32)) SeekEntryResult!167)

(assert (=> b!38625 (= res!23316 (= (seekEntryOrOpen!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853) (Found!167 #b00000000000000000000000000000000)))))

(assert (=> b!38625 (=> (not res!23316) (not e!24531))))

(declare-fun b!38626 () Bool)

(declare-fun e!24529 () Bool)

(assert (=> b!38626 (= e!24529 e!24530)))

(declare-fun c!4439 () Bool)

(assert (=> b!38626 (= c!4439 (validKeyInArray!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(declare-fun d!6257 () Bool)

(declare-fun res!23315 () Bool)

(assert (=> d!6257 (=> res!23315 e!24529)))

(assert (=> d!6257 (= res!23315 (bvsge #b00000000000000000000000000000000 (size!1334 lt!14408)))))

(assert (=> d!6257 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14408 mask!853) e!24529)))

(declare-fun bm!2918 () Bool)

(assert (=> bm!2918 (= call!2921 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14408 mask!853))))

(assert (= (and d!6257 (not res!23315)) b!38626))

(assert (= (and b!38626 c!4439) b!38625))

(assert (= (and b!38626 (not c!4439)) b!38623))

(assert (= (and b!38625 res!23316) b!38624))

(assert (= (or b!38624 b!38623) bm!2918))

(assert (=> b!38625 m!31271))

(declare-fun m!31309 () Bool)

(assert (=> b!38625 m!31309))

(declare-fun m!31311 () Bool)

(assert (=> b!38625 m!31311))

(assert (=> b!38625 m!31271))

(declare-fun m!31315 () Bool)

(assert (=> b!38625 m!31315))

(assert (=> b!38626 m!31271))

(assert (=> b!38626 m!31271))

(assert (=> b!38626 m!31273))

(declare-fun m!31321 () Bool)

(assert (=> bm!2918 m!31321))

(assert (=> b!38506 d!6257))

(declare-fun b!38647 () Bool)

(declare-fun e!24541 () (_ BitVec 32))

(declare-fun call!2924 () (_ BitVec 32))

(assert (=> b!38647 (= e!24541 call!2924)))

(declare-fun d!6265 () Bool)

(declare-fun lt!14480 () (_ BitVec 32))

(assert (=> d!6265 (and (bvsge lt!14480 #b00000000000000000000000000000000) (bvsle lt!14480 (bvsub (size!1334 lt!14408) #b00000000000000000000000000000000)))))

(declare-fun e!24540 () (_ BitVec 32))

(assert (=> d!6265 (= lt!14480 e!24540)))

(declare-fun c!4445 () Bool)

(assert (=> d!6265 (= c!4445 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6265 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1334 lt!14408)))))

(assert (=> d!6265 (= (arrayCountValidKeys!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14480)))

(declare-fun bm!2921 () Bool)

(assert (=> bm!2921 (= call!2924 (arrayCountValidKeys!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38648 () Bool)

(assert (=> b!38648 (= e!24541 (bvadd #b00000000000000000000000000000001 call!2924))))

(declare-fun b!38649 () Bool)

(assert (=> b!38649 (= e!24540 #b00000000000000000000000000000000)))

(declare-fun b!38650 () Bool)

(assert (=> b!38650 (= e!24540 e!24541)))

(declare-fun c!4444 () Bool)

(assert (=> b!38650 (= c!4444 (validKeyInArray!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(assert (= (and d!6265 c!4445) b!38649))

(assert (= (and d!6265 (not c!4445)) b!38650))

(assert (= (and b!38650 c!4444) b!38648))

(assert (= (and b!38650 (not c!4444)) b!38647))

(assert (= (or b!38648 b!38647) bm!2921))

(declare-fun m!31333 () Bool)

(assert (=> bm!2921 m!31333))

(assert (=> b!38650 m!31271))

(assert (=> b!38650 m!31271))

(assert (=> b!38650 m!31273))

(assert (=> b!38506 d!6265))

(declare-fun d!6271 () Bool)

(assert (=> d!6271 (= (arrayCountValidKeys!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14486 () Unit!959)

(declare-fun choose!59 (array!2567 (_ BitVec 32) (_ BitVec 32)) Unit!959)

(assert (=> d!6271 (= lt!14486 (choose!59 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6271 (bvslt (size!1334 lt!14408) #b01111111111111111111111111111111)))

(assert (=> d!6271 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14486)))

(declare-fun bs!1600 () Bool)

(assert (= bs!1600 d!6271))

(assert (=> bs!1600 m!31211))

(declare-fun m!31337 () Bool)

(assert (=> bs!1600 m!31337))

(assert (=> b!38506 d!6271))

(declare-fun d!6275 () Bool)

(assert (=> d!6275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14408 mask!853)))

(declare-fun lt!14498 () Unit!959)

(declare-fun choose!34 (array!2567 (_ BitVec 32) (_ BitVec 32)) Unit!959)

(assert (=> d!6275 (= lt!14498 (choose!34 lt!14408 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6275 (validMask!0 mask!853)))

(assert (=> d!6275 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14408 mask!853 #b00000000000000000000000000000000) lt!14498)))

(declare-fun bs!1601 () Bool)

(assert (= bs!1601 d!6275))

(assert (=> bs!1601 m!31213))

(declare-fun m!31343 () Bool)

(assert (=> bs!1601 m!31343))

(assert (=> bs!1601 m!31201))

(assert (=> b!38506 d!6275))

(push 1)

(assert (not b!38580))

(assert (not b!38541))

(assert (not b!38626))

(assert (not b!38625))

(assert (not d!6253))

(assert (not b!38650))

(assert (not d!6275))

(assert (not b!38579))

(assert (not d!6247))

(assert (not b!38542))

(assert (not d!6271))

(assert (not b_lambda!2017))

(assert (not bm!2918))

(assert (not b_next!1351))

(assert b_and!2317)

(assert (not bm!2921))

(assert (not bm!2903))

(assert tp_is_empty!1741)

(assert (not b!38581))

(assert (not b!38545))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2317)

(assert (not b_next!1351))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!38672 () Bool)

(declare-fun e!24561 () (_ BitVec 32))

(declare-fun call!2930 () (_ BitVec 32))

(assert (=> b!38672 (= e!24561 call!2930)))

(declare-fun d!6289 () Bool)

(declare-fun lt!14505 () (_ BitVec 32))

(assert (=> d!6289 (and (bvsge lt!14505 #b00000000000000000000000000000000) (bvsle lt!14505 (bvsub (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun e!24560 () (_ BitVec 32))

(assert (=> d!6289 (= lt!14505 e!24560)))

(declare-fun c!4452 () Bool)

(assert (=> d!6289 (= c!4452 (bvsge #b00000000000000000000000000000000 (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6289 (and (bvsle #b00000000000000000000000000000000 (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6289 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14505)))

(declare-fun bm!2927 () Bool)

(assert (=> bm!2927 (= call!2930 (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38673 () Bool)

(assert (=> b!38673 (= e!24561 (bvadd #b00000000000000000000000000000001 call!2930))))

(declare-fun b!38674 () Bool)

(assert (=> b!38674 (= e!24560 #b00000000000000000000000000000000)))

(declare-fun b!38675 () Bool)

(assert (=> b!38675 (= e!24560 e!24561)))

(declare-fun c!4451 () Bool)

(assert (=> b!38675 (= c!4451 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6289 c!4452) b!38674))

(assert (= (and d!6289 (not c!4452)) b!38675))

(assert (= (and b!38675 c!4451) b!38673))

(assert (= (and b!38675 (not c!4451)) b!38672))

(assert (= (or b!38673 b!38672) bm!2927))

(declare-fun m!31367 () Bool)

(assert (=> bm!2927 m!31367))

(declare-fun m!31369 () Bool)

(assert (=> b!38675 m!31369))

(assert (=> b!38675 m!31369))

(declare-fun m!31371 () Bool)

(assert (=> b!38675 m!31371))

(assert (=> b!38579 d!6289))

(declare-fun d!6291 () Bool)

(declare-fun lt!14508 () Bool)

(declare-fun content!24 (List!1043) (Set (_ BitVec 64)))

(assert (=> d!6291 (= lt!14508 (set.member (select (arr!1227 lt!14408) #b00000000000000000000000000000000) (content!24 Nil!1040)))))

(declare-fun e!24568 () Bool)

(assert (=> d!6291 (= lt!14508 e!24568)))

(declare-fun res!23357 () Bool)

(assert (=> d!6291 (=> (not res!23357) (not e!24568))))

(assert (=> d!6291 (= res!23357 (is-Cons!1039 Nil!1040))))

(assert (=> d!6291 (= (contains!500 Nil!1040 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)) lt!14508)))

(declare-fun b!38692 () Bool)

(declare-fun e!24567 () Bool)

(assert (=> b!38692 (= e!24568 e!24567)))

(declare-fun res!23356 () Bool)

(assert (=> b!38692 (=> res!23356 e!24567)))

(assert (=> b!38692 (= res!23356 (= (h!1607 Nil!1040) (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(declare-fun b!38693 () Bool)

(assert (=> b!38693 (= e!24567 (contains!500 (t!3878 Nil!1040) (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(assert (= (and d!6291 res!23357) b!38692))

(assert (= (and b!38692 (not res!23356)) b!38693))

(declare-fun m!31377 () Bool)

(assert (=> d!6291 m!31377))

(assert (=> d!6291 m!31271))

(declare-fun m!31379 () Bool)

(assert (=> d!6291 m!31379))

(assert (=> b!38693 m!31271))

(declare-fun m!31381 () Bool)

(assert (=> b!38693 m!31381))

(assert (=> b!38541 d!6291))

(declare-fun d!6295 () Bool)

(assert (=> d!6295 (= (validKeyInArray!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)) (and (not (= (select (arr!1227 lt!14408) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1227 lt!14408) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38626 d!6295))

(assert (=> d!6253 d!6239))

(declare-fun d!6297 () Bool)

(assert (=> d!6297 (arrayNoDuplicates!0 lt!14408 #b00000000000000000000000000000000 Nil!1040)))

(assert (=> d!6297 true))

(declare-fun res!23366 () Unit!959)

(assert (=> d!6297 (= (choose!111 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1040) res!23366)))

(declare-fun bs!1604 () Bool)

(assert (= bs!1604 d!6297))

(assert (=> bs!1604 m!31207))

(assert (=> d!6253 d!6297))

(declare-fun b!38704 () Bool)

(declare-fun e!24578 () Bool)

(declare-fun call!2932 () Bool)

(assert (=> b!38704 (= e!24578 call!2932)))

(declare-fun b!38705 () Bool)

(declare-fun e!24579 () Bool)

(assert (=> b!38705 (= e!24579 call!2932)))

(declare-fun b!38706 () Bool)

(assert (=> b!38706 (= e!24578 e!24579)))

(declare-fun lt!14514 () (_ BitVec 64))

(assert (=> b!38706 (= lt!14514 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000))))

(declare-fun lt!14513 () Unit!959)

(assert (=> b!38706 (= lt!14513 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14514 #b00000000000000000000000000000000))))

(assert (=> b!38706 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14514 #b00000000000000000000000000000000)))

(declare-fun lt!14515 () Unit!959)

(assert (=> b!38706 (= lt!14515 lt!14513)))

(declare-fun res!23368 () Bool)

(assert (=> b!38706 (= res!23368 (= (seekEntryOrOpen!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!167 #b00000000000000000000000000000000)))))

(assert (=> b!38706 (=> (not res!23368) (not e!24579))))

(declare-fun b!38707 () Bool)

(declare-fun e!24577 () Bool)

(assert (=> b!38707 (= e!24577 e!24578)))

(declare-fun c!4455 () Bool)

(assert (=> b!38707 (= c!4455 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun d!6303 () Bool)

(declare-fun res!23367 () Bool)

(assert (=> d!6303 (=> res!23367 e!24577)))

(assert (=> d!6303 (= res!23367 (bvsge #b00000000000000000000000000000000 (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24577)))

(declare-fun bm!2929 () Bool)

(assert (=> bm!2929 (= call!2932 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6303 (not res!23367)) b!38707))

(assert (= (and b!38707 c!4455) b!38706))

(assert (= (and b!38707 (not c!4455)) b!38704))

(assert (= (and b!38706 res!23368) b!38705))

(assert (= (or b!38705 b!38704) bm!2929))

(assert (=> b!38706 m!31369))

(declare-fun m!31395 () Bool)

(assert (=> b!38706 m!31395))

(declare-fun m!31397 () Bool)

(assert (=> b!38706 m!31397))

(assert (=> b!38706 m!31369))

(declare-fun m!31399 () Bool)

(assert (=> b!38706 m!31399))

(assert (=> b!38707 m!31369))

(assert (=> b!38707 m!31369))

(assert (=> b!38707 m!31371))

(declare-fun m!31401 () Bool)

(assert (=> bm!2929 m!31401))

(assert (=> b!38580 d!6303))

(assert (=> b!38542 d!6295))

(declare-fun d!6307 () Bool)

(assert (=> d!6307 (arrayContainsKey!0 lt!14408 lt!14473 #b00000000000000000000000000000000)))

(declare-fun lt!14521 () Unit!959)

(declare-fun choose!13 (array!2567 (_ BitVec 64) (_ BitVec 32)) Unit!959)

(assert (=> d!6307 (= lt!14521 (choose!13 lt!14408 lt!14473 #b00000000000000000000000000000000))))

(assert (=> d!6307 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6307 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14408 lt!14473 #b00000000000000000000000000000000) lt!14521)))

(declare-fun bs!1607 () Bool)

(assert (= bs!1607 d!6307))

(assert (=> bs!1607 m!31311))

(declare-fun m!31405 () Bool)

(assert (=> bs!1607 m!31405))

(assert (=> b!38625 d!6307))

(declare-fun d!6311 () Bool)

(declare-fun res!23379 () Bool)

(declare-fun e!24590 () Bool)

(assert (=> d!6311 (=> res!23379 e!24590)))

(assert (=> d!6311 (= res!23379 (= (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14473))))

(assert (=> d!6311 (= (arrayContainsKey!0 lt!14408 lt!14473 #b00000000000000000000000000000000) e!24590)))

(declare-fun b!38718 () Bool)

(declare-fun e!24591 () Bool)

(assert (=> b!38718 (= e!24590 e!24591)))

(declare-fun res!23380 () Bool)

(assert (=> b!38718 (=> (not res!23380) (not e!24591))))

(assert (=> b!38718 (= res!23380 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 lt!14408)))))

(declare-fun b!38719 () Bool)

(assert (=> b!38719 (= e!24591 (arrayContainsKey!0 lt!14408 lt!14473 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6311 (not res!23379)) b!38718))

(assert (= (and b!38718 res!23380) b!38719))

(assert (=> d!6311 m!31271))

(declare-fun m!31409 () Bool)

(assert (=> b!38719 m!31409))

(assert (=> b!38625 d!6311))

(declare-fun b!38765 () Bool)

(declare-fun e!24621 () SeekEntryResult!167)

(declare-fun lt!14542 () SeekEntryResult!167)

(assert (=> b!38765 (= e!24621 (Found!167 (index!2792 lt!14542)))))

(declare-fun b!38766 () Bool)

(declare-fun e!24619 () SeekEntryResult!167)

(assert (=> b!38766 (= e!24619 Undefined!167)))

(declare-fun d!6315 () Bool)

(declare-fun lt!14543 () SeekEntryResult!167)

(assert (=> d!6315 (and (or (is-Undefined!167 lt!14543) (not (is-Found!167 lt!14543)) (and (bvsge (index!2791 lt!14543) #b00000000000000000000000000000000) (bvslt (index!2791 lt!14543) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14543) (is-Found!167 lt!14543) (not (is-MissingZero!167 lt!14543)) (and (bvsge (index!2790 lt!14543) #b00000000000000000000000000000000) (bvslt (index!2790 lt!14543) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14543) (is-Found!167 lt!14543) (is-MissingZero!167 lt!14543) (not (is-MissingVacant!167 lt!14543)) (and (bvsge (index!2793 lt!14543) #b00000000000000000000000000000000) (bvslt (index!2793 lt!14543) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14543) (ite (is-Found!167 lt!14543) (= (select (arr!1227 lt!14408) (index!2791 lt!14543)) (select (arr!1227 lt!14408) #b00000000000000000000000000000000)) (ite (is-MissingZero!167 lt!14543) (= (select (arr!1227 lt!14408) (index!2790 lt!14543)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!167 lt!14543) (= (select (arr!1227 lt!14408) (index!2793 lt!14543)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6315 (= lt!14543 e!24619)))

(declare-fun c!4476 () Bool)

(assert (=> d!6315 (= c!4476 (and (is-Intermediate!167 lt!14542) (undefined!979 lt!14542)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2567 (_ BitVec 32)) SeekEntryResult!167)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6315 (= lt!14542 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) mask!853) (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853))))

(assert (=> d!6315 (validMask!0 mask!853)))

(assert (=> d!6315 (= (seekEntryOrOpen!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853) lt!14543)))

(declare-fun b!38767 () Bool)

(assert (=> b!38767 (= e!24619 e!24621)))

(declare-fun lt!14541 () (_ BitVec 64))

(assert (=> b!38767 (= lt!14541 (select (arr!1227 lt!14408) (index!2792 lt!14542)))))

(declare-fun c!4474 () Bool)

(assert (=> b!38767 (= c!4474 (= lt!14541 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(declare-fun b!38768 () Bool)

(declare-fun e!24620 () SeekEntryResult!167)

(assert (=> b!38768 (= e!24620 (MissingZero!167 (index!2792 lt!14542)))))

(declare-fun b!38769 () Bool)

(declare-fun c!4475 () Bool)

(assert (=> b!38769 (= c!4475 (= lt!14541 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38769 (= e!24621 e!24620)))

(declare-fun b!38770 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2567 (_ BitVec 32)) SeekEntryResult!167)

(assert (=> b!38770 (= e!24620 (seekKeyOrZeroReturnVacant!0 (x!7603 lt!14542) (index!2792 lt!14542) (index!2792 lt!14542) (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853))))

(assert (= (and d!6315 c!4476) b!38766))

(assert (= (and d!6315 (not c!4476)) b!38767))

(assert (= (and b!38767 c!4474) b!38765))

(assert (= (and b!38767 (not c!4474)) b!38769))

(assert (= (and b!38769 c!4475) b!38768))

(assert (= (and b!38769 (not c!4475)) b!38770))

(declare-fun m!31427 () Bool)

(assert (=> d!6315 m!31427))

(declare-fun m!31431 () Bool)

(assert (=> d!6315 m!31431))

(declare-fun m!31433 () Bool)

(assert (=> d!6315 m!31433))

(declare-fun m!31437 () Bool)

(assert (=> d!6315 m!31437))

(assert (=> d!6315 m!31271))

(declare-fun m!31441 () Bool)

(assert (=> d!6315 m!31441))

(assert (=> d!6315 m!31271))

(assert (=> d!6315 m!31437))

(assert (=> d!6315 m!31201))

(declare-fun m!31447 () Bool)

(assert (=> b!38767 m!31447))

(assert (=> b!38770 m!31271))

(declare-fun m!31453 () Bool)

(assert (=> b!38770 m!31453))

(assert (=> b!38625 d!6315))

(declare-fun b!38771 () Bool)

(declare-fun e!24623 () Bool)

(declare-fun call!2935 () Bool)

(assert (=> b!38771 (= e!24623 call!2935)))

(declare-fun b!38772 () Bool)

(declare-fun e!24624 () Bool)

(assert (=> b!38772 (= e!24624 call!2935)))

(declare-fun b!38773 () Bool)

(assert (=> b!38773 (= e!24623 e!24624)))

(declare-fun lt!14545 () (_ BitVec 64))

(assert (=> b!38773 (= lt!14545 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14544 () Unit!959)

(assert (=> b!38773 (= lt!14544 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14408 lt!14545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38773 (arrayContainsKey!0 lt!14408 lt!14545 #b00000000000000000000000000000000)))

(declare-fun lt!14546 () Unit!959)

(assert (=> b!38773 (= lt!14546 lt!14544)))

(declare-fun res!23394 () Bool)

(assert (=> b!38773 (= res!23394 (= (seekEntryOrOpen!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14408 mask!853) (Found!167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38773 (=> (not res!23394) (not e!24624))))

(declare-fun b!38774 () Bool)

(declare-fun e!24622 () Bool)

(assert (=> b!38774 (= e!24622 e!24623)))

(declare-fun c!4477 () Bool)

(assert (=> b!38774 (= c!4477 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6329 () Bool)

(declare-fun res!23393 () Bool)

(assert (=> d!6329 (=> res!23393 e!24622)))

(assert (=> d!6329 (= res!23393 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 lt!14408)))))

(assert (=> d!6329 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14408 mask!853) e!24622)))

(declare-fun bm!2932 () Bool)

(assert (=> bm!2932 (= call!2935 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14408 mask!853))))

(assert (= (and d!6329 (not res!23393)) b!38774))

(assert (= (and b!38774 c!4477) b!38773))

(assert (= (and b!38774 (not c!4477)) b!38771))

(assert (= (and b!38773 res!23394) b!38772))

(assert (= (or b!38772 b!38771) bm!2932))

(declare-fun m!31455 () Bool)

(assert (=> b!38773 m!31455))

(declare-fun m!31457 () Bool)

(assert (=> b!38773 m!31457))

(declare-fun m!31459 () Bool)

(assert (=> b!38773 m!31459))

(assert (=> b!38773 m!31455))

(declare-fun m!31461 () Bool)

(assert (=> b!38773 m!31461))

(assert (=> b!38774 m!31455))

(assert (=> b!38774 m!31455))

(declare-fun m!31463 () Bool)

(assert (=> b!38774 m!31463))

(declare-fun m!31465 () Bool)

(assert (=> bm!2932 m!31465))

(assert (=> bm!2918 d!6329))

(declare-fun b!38781 () Bool)

(declare-fun e!24631 () Bool)

(declare-fun e!24630 () Bool)

(assert (=> b!38781 (= e!24631 e!24630)))

(declare-fun c!4479 () Bool)

(assert (=> b!38781 (= c!4479 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun bm!2934 () Bool)

(declare-fun call!2937 () Bool)

(assert (=> bm!2934 (= call!2937 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4479 (Cons!1039 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1040) Nil!1040)))))

(declare-fun b!38782 () Bool)

(assert (=> b!38782 (= e!24630 call!2937)))

(declare-fun b!38783 () Bool)

(assert (=> b!38783 (= e!24630 call!2937)))

(declare-fun b!38784 () Bool)

(declare-fun e!24629 () Bool)

(assert (=> b!38784 (= e!24629 e!24631)))

(declare-fun res!23398 () Bool)

(assert (=> b!38784 (=> (not res!23398) (not e!24631))))

(declare-fun e!24632 () Bool)

(assert (=> b!38784 (= res!23398 (not e!24632))))

(declare-fun res!23399 () Bool)

(assert (=> b!38784 (=> (not res!23399) (not e!24632))))

(assert (=> b!38784 (= res!23399 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun d!6333 () Bool)

(declare-fun res!23400 () Bool)

(assert (=> d!6333 (=> res!23400 e!24629)))

(assert (=> d!6333 (= res!23400 (bvsge #b00000000000000000000000000000000 (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6333 (= (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000 Nil!1040) e!24629)))

(declare-fun b!38780 () Bool)

(assert (=> b!38780 (= e!24632 (contains!500 Nil!1040 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6333 (not res!23400)) b!38784))

(assert (= (and b!38784 res!23399) b!38780))

(assert (= (and b!38784 res!23398) b!38781))

(assert (= (and b!38781 c!4479) b!38783))

(assert (= (and b!38781 (not c!4479)) b!38782))

(assert (= (or b!38783 b!38782) bm!2934))

(assert (=> b!38781 m!31369))

(assert (=> b!38781 m!31369))

(assert (=> b!38781 m!31371))

(assert (=> bm!2934 m!31369))

(declare-fun m!31473 () Bool)

(assert (=> bm!2934 m!31473))

(assert (=> b!38784 m!31369))

(assert (=> b!38784 m!31369))

(assert (=> b!38784 m!31371))

(assert (=> b!38780 m!31369))

(assert (=> b!38780 m!31369))

(declare-fun m!31475 () Bool)

(assert (=> b!38780 m!31475))

(assert (=> b!38581 d!6333))

(declare-fun b!38788 () Bool)

(declare-fun e!24637 () Bool)

(declare-fun e!24636 () Bool)

(assert (=> b!38788 (= e!24637 e!24636)))

(declare-fun c!4480 () Bool)

(assert (=> b!38788 (= c!4480 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2935 () Bool)

(declare-fun call!2938 () Bool)

(assert (=> bm!2935 (= call!2938 (arrayNoDuplicates!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4480 (Cons!1039 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040))))))

(declare-fun b!38789 () Bool)

(assert (=> b!38789 (= e!24636 call!2938)))

(declare-fun b!38790 () Bool)

(assert (=> b!38790 (= e!24636 call!2938)))

(declare-fun b!38791 () Bool)

(declare-fun e!24635 () Bool)

(assert (=> b!38791 (= e!24635 e!24637)))

(declare-fun res!23406 () Bool)

(assert (=> b!38791 (=> (not res!23406) (not e!24637))))

(declare-fun e!24638 () Bool)

(assert (=> b!38791 (= res!23406 (not e!24638))))

(declare-fun res!23407 () Bool)

(assert (=> b!38791 (=> (not res!23407) (not e!24638))))

(assert (=> b!38791 (= res!23407 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6339 () Bool)

(declare-fun res!23408 () Bool)

(assert (=> d!6339 (=> res!23408 e!24635)))

(assert (=> d!6339 (= res!23408 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 lt!14408)))))

(assert (=> d!6339 (= (arrayNoDuplicates!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) e!24635)))

(declare-fun b!38787 () Bool)

(assert (=> b!38787 (= e!24638 (contains!500 (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6339 (not res!23408)) b!38791))

(assert (= (and b!38791 res!23407) b!38787))

(assert (= (and b!38791 res!23406) b!38788))

(assert (= (and b!38788 c!4480) b!38790))

(assert (= (and b!38788 (not c!4480)) b!38789))

(assert (= (or b!38790 b!38789) bm!2935))

(assert (=> b!38788 m!31455))

(assert (=> b!38788 m!31455))

(assert (=> b!38788 m!31463))

(assert (=> bm!2935 m!31455))

(declare-fun m!31477 () Bool)

(assert (=> bm!2935 m!31477))

(assert (=> b!38791 m!31455))

(assert (=> b!38791 m!31455))

(assert (=> b!38791 m!31463))

(assert (=> b!38787 m!31455))

(assert (=> b!38787 m!31455))

(declare-fun m!31483 () Bool)

(assert (=> b!38787 m!31483))

(assert (=> bm!2903 d!6339))

(declare-fun b!38815 () Bool)

(declare-fun e!24650 () Bool)

(assert (=> b!38815 (= e!24650 (and (bvsge (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000011) (bvsge (_vacant!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000)))))

(declare-fun d!6343 () Bool)

(declare-fun res!23426 () Bool)

(assert (=> d!6343 (=> (not res!23426) (not e!24650))))

(assert (=> d!6343 (= res!23426 (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6343 (= (simpleValid!21 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) e!24650)))

(declare-fun b!38812 () Bool)

(declare-fun res!23425 () Bool)

(assert (=> b!38812 (=> (not res!23425) (not e!24650))))

(assert (=> b!38812 (= res!23425 (and (= (size!1335 (_values!1774 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001)) (= (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1335 (_values!1774 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvsle (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001))))))

(declare-fun b!38814 () Bool)

(declare-fun res!23424 () Bool)

(assert (=> b!38814 (=> (not res!23424) (not e!24650))))

(declare-fun size!1353 (LongMapFixedSize!226) (_ BitVec 32))

(assert (=> b!38814 (= res!23424 (= (size!1353 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!38813 () Bool)

(declare-fun res!23423 () Bool)

(assert (=> b!38813 (=> (not res!23423) (not e!24650))))

(assert (=> b!38813 (= res!23423 (bvsge (size!1353 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6343 res!23426) b!38812))

(assert (= (and b!38812 res!23425) b!38813))

(assert (= (and b!38813 res!23423) b!38814))

(assert (= (and b!38814 res!23424) b!38815))

(declare-fun m!31493 () Bool)

(assert (=> d!6343 m!31493))

(declare-fun m!31495 () Bool)

(assert (=> b!38814 m!31495))

(assert (=> b!38813 m!31495))

(assert (=> d!6247 d!6343))

(declare-fun b!38816 () Bool)

(declare-fun e!24652 () (_ BitVec 32))

(declare-fun call!2941 () (_ BitVec 32))

(assert (=> b!38816 (= e!24652 call!2941)))

(declare-fun d!6349 () Bool)

(declare-fun lt!14554 () (_ BitVec 32))

(assert (=> d!6349 (and (bvsge lt!14554 #b00000000000000000000000000000000) (bvsle lt!14554 (bvsub (size!1334 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!24651 () (_ BitVec 32))

(assert (=> d!6349 (= lt!14554 e!24651)))

(declare-fun c!4485 () Bool)

(assert (=> d!6349 (= c!4485 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6349 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1334 lt!14408)))))

(assert (=> d!6349 (= (arrayCountValidKeys!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14554)))

(declare-fun bm!2938 () Bool)

(assert (=> bm!2938 (= call!2941 (arrayCountValidKeys!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38817 () Bool)

(assert (=> b!38817 (= e!24652 (bvadd #b00000000000000000000000000000001 call!2941))))

(declare-fun b!38818 () Bool)

(assert (=> b!38818 (= e!24651 #b00000000000000000000000000000000)))

(declare-fun b!38819 () Bool)

(assert (=> b!38819 (= e!24651 e!24652)))

(declare-fun c!4484 () Bool)

(assert (=> b!38819 (= c!4484 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6349 c!4485) b!38818))

(assert (= (and d!6349 (not c!4485)) b!38819))

(assert (= (and b!38819 c!4484) b!38817))

(assert (= (and b!38819 (not c!4484)) b!38816))

(assert (= (or b!38817 b!38816) bm!2938))

(declare-fun m!31497 () Bool)

(assert (=> bm!2938 m!31497))

(assert (=> b!38819 m!31455))

(assert (=> b!38819 m!31455))

(assert (=> b!38819 m!31463))

(assert (=> bm!2921 d!6349))

(assert (=> b!38545 d!6295))

(assert (=> d!6275 d!6257))

(declare-fun d!6351 () Bool)

(assert (=> d!6351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14408 mask!853)))

(assert (=> d!6351 true))

(declare-fun _$30!36 () Unit!959)

(assert (=> d!6351 (= (choose!34 lt!14408 mask!853 #b00000000000000000000000000000000) _$30!36)))

(declare-fun bs!1611 () Bool)

(assert (= bs!1611 d!6351))

(assert (=> bs!1611 m!31213))

(assert (=> d!6275 d!6351))

(assert (=> d!6275 d!6231))

(assert (=> d!6271 d!6265))

(declare-fun d!6353 () Bool)

(assert (=> d!6353 (= (arrayCountValidKeys!0 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6353 true))

(declare-fun _$88!22 () Unit!959)

(assert (=> d!6353 (= (choose!59 lt!14408 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!22)))

(declare-fun bs!1612 () Bool)

(assert (= bs!1612 d!6353))

(assert (=> bs!1612 m!31211))

(assert (=> d!6271 d!6353))

(assert (=> b!38650 d!6295))

(push 1)

(assert (not d!6291))

(assert (not b!38819))

(assert (not d!6351))

(assert (not b!38675))

(assert (not bm!2927))

(assert (not b!38788))

(assert (not b!38813))

(assert (not b!38780))

(assert (not b!38719))

(assert (not d!6297))

(assert (not b!38773))

(assert (not b!38791))

(assert (not b!38814))

(assert (not d!6307))

(assert (not b!38774))

(assert (not d!6353))

(assert (not bm!2938))

(assert (not bm!2932))

(assert b_and!2317)

(assert (not bm!2929))

(assert (not bm!2935))

(assert (not bm!2934))

(assert (not b!38707))

(assert (not b!38784))

(assert (not b!38706))

(assert (not b!38781))

(assert (not b!38787))

(assert (not d!6343))

(assert tp_is_empty!1741)

(assert (not d!6315))

(assert (not b_lambda!2017))

(assert (not b!38770))

(assert (not b!38693))

(assert (not b_next!1351))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2317)

(assert (not b_next!1351))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6369 () Bool)

(assert (=> d!6369 (= (size!1353 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd (_size!162 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvsdiv (bvadd (extraKeys!1682 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!38813 d!6369))

(declare-fun b!38899 () Bool)

(declare-fun e!24700 () SeekEntryResult!167)

(assert (=> b!38899 (= e!24700 (Intermediate!167 false (toIndex!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun d!6371 () Bool)

(declare-fun e!24698 () Bool)

(assert (=> d!6371 e!24698))

(declare-fun c!4512 () Bool)

(declare-fun lt!14582 () SeekEntryResult!167)

(assert (=> d!6371 (= c!4512 (and (is-Intermediate!167 lt!14582) (undefined!979 lt!14582)))))

(declare-fun e!24697 () SeekEntryResult!167)

(assert (=> d!6371 (= lt!14582 e!24697)))

(declare-fun c!4511 () Bool)

(assert (=> d!6371 (= c!4511 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!14581 () (_ BitVec 64))

(assert (=> d!6371 (= lt!14581 (select (arr!1227 lt!14408) (toIndex!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6371 (validMask!0 mask!853)))

(assert (=> d!6371 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) mask!853) (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853) lt!14582)))

(declare-fun b!38900 () Bool)

(assert (=> b!38900 (= e!24697 e!24700)))

(declare-fun c!4513 () Bool)

(assert (=> b!38900 (= c!4513 (or (= lt!14581 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)) (= (bvadd lt!14581 lt!14581) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!38901 () Bool)

(declare-fun e!24696 () Bool)

(assert (=> b!38901 (= e!24698 e!24696)))

(declare-fun res!23457 () Bool)

(assert (=> b!38901 (= res!23457 (and (is-Intermediate!167 lt!14582) (not (undefined!979 lt!14582)) (bvslt (x!7603 lt!14582) #b01111111111111111111111111111110) (bvsge (x!7603 lt!14582) #b00000000000000000000000000000000) (bvsge (x!7603 lt!14582) #b00000000000000000000000000000000)))))

(assert (=> b!38901 (=> (not res!23457) (not e!24696))))

(declare-fun b!38902 () Bool)

(assert (=> b!38902 (= e!24698 (bvsge (x!7603 lt!14582) #b01111111111111111111111111111110))))

(declare-fun b!38903 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38903 (= e!24700 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853))))

(declare-fun b!38904 () Bool)

(assert (=> b!38904 (and (bvsge (index!2792 lt!14582) #b00000000000000000000000000000000) (bvslt (index!2792 lt!14582) (size!1334 lt!14408)))))

(declare-fun e!24699 () Bool)

(assert (=> b!38904 (= e!24699 (= (select (arr!1227 lt!14408) (index!2792 lt!14582)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38905 () Bool)

(assert (=> b!38905 (and (bvsge (index!2792 lt!14582) #b00000000000000000000000000000000) (bvslt (index!2792 lt!14582) (size!1334 lt!14408)))))

(declare-fun res!23456 () Bool)

(assert (=> b!38905 (= res!23456 (= (select (arr!1227 lt!14408) (index!2792 lt!14582)) (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(assert (=> b!38905 (=> res!23456 e!24699)))

(assert (=> b!38905 (= e!24696 e!24699)))

(declare-fun b!38906 () Bool)

(assert (=> b!38906 (= e!24697 (Intermediate!167 true (toIndex!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!38907 () Bool)

(assert (=> b!38907 (and (bvsge (index!2792 lt!14582) #b00000000000000000000000000000000) (bvslt (index!2792 lt!14582) (size!1334 lt!14408)))))

(declare-fun res!23458 () Bool)

(assert (=> b!38907 (= res!23458 (= (select (arr!1227 lt!14408) (index!2792 lt!14582)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38907 (=> res!23458 e!24699)))

(assert (= (and d!6371 c!4511) b!38906))

(assert (= (and d!6371 (not c!4511)) b!38900))

(assert (= (and b!38900 c!4513) b!38899))

(assert (= (and b!38900 (not c!4513)) b!38903))

(assert (= (and d!6371 c!4512) b!38902))

(assert (= (and d!6371 (not c!4512)) b!38901))

(assert (= (and b!38901 res!23457) b!38905))

(assert (= (and b!38905 (not res!23456)) b!38907))

(assert (= (and b!38907 (not res!23458)) b!38904))

(declare-fun m!31573 () Bool)

(assert (=> b!38905 m!31573))

(assert (=> b!38903 m!31437))

(declare-fun m!31575 () Bool)

(assert (=> b!38903 m!31575))

(assert (=> b!38903 m!31575))

(assert (=> b!38903 m!31271))

(declare-fun m!31577 () Bool)

(assert (=> b!38903 m!31577))

(assert (=> b!38904 m!31573))

(assert (=> b!38907 m!31573))

(assert (=> d!6371 m!31437))

(declare-fun m!31579 () Bool)

(assert (=> d!6371 m!31579))

(assert (=> d!6371 m!31201))

(assert (=> d!6315 d!6371))

(declare-fun d!6391 () Bool)

(declare-fun lt!14592 () (_ BitVec 32))

(declare-fun lt!14591 () (_ BitVec 32))

(assert (=> d!6391 (= lt!14592 (bvmul (bvxor lt!14591 (bvlshr lt!14591 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6391 (= lt!14591 ((_ extract 31 0) (bvand (bvxor (select (arr!1227 lt!14408) #b00000000000000000000000000000000) (bvlshr (select (arr!1227 lt!14408) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6391 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23461 (let ((h!1610 ((_ extract 31 0) (bvand (bvxor (select (arr!1227 lt!14408) #b00000000000000000000000000000000) (bvlshr (select (arr!1227 lt!14408) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7614 (bvmul (bvxor h!1610 (bvlshr h!1610 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7614 (bvlshr x!7614 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23461 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23461 #b00000000000000000000000000000000))))))

(assert (=> d!6391 (= (toIndex!0 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!14592 (bvlshr lt!14592 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6315 d!6391))

(assert (=> d!6315 d!6231))

(declare-fun d!6403 () Bool)

(assert (not d!6403))

(assert (=> b!38693 d!6403))

(assert (=> b!38814 d!6369))

(declare-fun d!6405 () Bool)

(assert (=> d!6405 (= (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (and (not (= (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38675 d!6405))

(assert (=> d!6351 d!6257))

(declare-fun d!6409 () Bool)

(assert (=> d!6409 (= (content!24 Nil!1040) (as set.empty (Set (_ BitVec 64))))))

(assert (=> d!6291 d!6409))

(declare-fun d!6417 () Bool)

(assert (=> d!6417 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14514 #b00000000000000000000000000000000)))

(declare-fun lt!14597 () Unit!959)

(assert (=> d!6417 (= lt!14597 (choose!13 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14514 #b00000000000000000000000000000000))))

(assert (=> d!6417 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6417 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14514 #b00000000000000000000000000000000) lt!14597)))

(declare-fun bs!1618 () Bool)

(assert (= bs!1618 d!6417))

(assert (=> bs!1618 m!31397))

(declare-fun m!31625 () Bool)

(assert (=> bs!1618 m!31625))

(assert (=> b!38706 d!6417))

(declare-fun d!6419 () Bool)

(declare-fun res!23474 () Bool)

(declare-fun e!24721 () Bool)

(assert (=> d!6419 (=> res!23474 e!24721)))

(assert (=> d!6419 (= res!23474 (= (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) lt!14514))))

(assert (=> d!6419 (= (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14514 #b00000000000000000000000000000000) e!24721)))

(declare-fun b!38934 () Bool)

(declare-fun e!24722 () Bool)

(assert (=> b!38934 (= e!24721 e!24722)))

(declare-fun res!23475 () Bool)

(assert (=> b!38934 (=> (not res!23475) (not e!24722))))

(assert (=> b!38934 (= res!23475 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!38935 () Bool)

(assert (=> b!38935 (= e!24722 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14514 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6419 (not res!23474)) b!38934))

(assert (= (and b!38934 res!23475) b!38935))

(assert (=> d!6419 m!31369))

(declare-fun m!31627 () Bool)

(assert (=> b!38935 m!31627))

(assert (=> b!38706 d!6419))

(declare-fun b!38936 () Bool)

(declare-fun e!24725 () SeekEntryResult!167)

(declare-fun lt!14599 () SeekEntryResult!167)

(assert (=> b!38936 (= e!24725 (Found!167 (index!2792 lt!14599)))))

(declare-fun b!38937 () Bool)

(declare-fun e!24723 () SeekEntryResult!167)

(assert (=> b!38937 (= e!24723 Undefined!167)))

(declare-fun lt!14600 () SeekEntryResult!167)

(declare-fun d!6421 () Bool)

(assert (=> d!6421 (and (or (is-Undefined!167 lt!14600) (not (is-Found!167 lt!14600)) (and (bvsge (index!2791 lt!14600) #b00000000000000000000000000000000) (bvslt (index!2791 lt!14600) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or (is-Undefined!167 lt!14600) (is-Found!167 lt!14600) (not (is-MissingZero!167 lt!14600)) (and (bvsge (index!2790 lt!14600) #b00000000000000000000000000000000) (bvslt (index!2790 lt!14600) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or (is-Undefined!167 lt!14600) (is-Found!167 lt!14600) (is-MissingZero!167 lt!14600) (not (is-MissingVacant!167 lt!14600)) (and (bvsge (index!2793 lt!14600) #b00000000000000000000000000000000) (bvslt (index!2793 lt!14600) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))) (or (is-Undefined!167 lt!14600) (ite (is-Found!167 lt!14600) (= (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2791 lt!14600)) (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) (ite (is-MissingZero!167 lt!14600) (= (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2790 lt!14600)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!167 lt!14600) (= (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2793 lt!14600)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6421 (= lt!14600 e!24723)))

(declare-fun c!4522 () Bool)

(assert (=> d!6421 (= c!4522 (and (is-Intermediate!167 lt!14599) (undefined!979 lt!14599)))))

(assert (=> d!6421 (= lt!14599 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (=> d!6421 (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(assert (=> d!6421 (= (seekEntryOrOpen!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) lt!14600)))

(declare-fun b!38938 () Bool)

(assert (=> b!38938 (= e!24723 e!24725)))

(declare-fun lt!14598 () (_ BitVec 64))

(assert (=> b!38938 (= lt!14598 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (index!2792 lt!14599)))))

(declare-fun c!4520 () Bool)

(assert (=> b!38938 (= c!4520 (= lt!14598 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38939 () Bool)

(declare-fun e!24724 () SeekEntryResult!167)

(assert (=> b!38939 (= e!24724 (MissingZero!167 (index!2792 lt!14599)))))

(declare-fun b!38940 () Bool)

(declare-fun c!4521 () Bool)

(assert (=> b!38940 (= c!4521 (= lt!14598 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38940 (= e!24725 e!24724)))

(declare-fun b!38941 () Bool)

(assert (=> b!38941 (= e!24724 (seekKeyOrZeroReturnVacant!0 (x!7603 lt!14599) (index!2792 lt!14599) (index!2792 lt!14599) (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6421 c!4522) b!38937))

(assert (= (and d!6421 (not c!4522)) b!38938))

(assert (= (and b!38938 c!4520) b!38936))

(assert (= (and b!38938 (not c!4520)) b!38940))

(assert (= (and b!38940 c!4521) b!38939))

(assert (= (and b!38940 (not c!4521)) b!38941))

(declare-fun m!31629 () Bool)

(assert (=> d!6421 m!31629))

(declare-fun m!31631 () Bool)

(assert (=> d!6421 m!31631))

(declare-fun m!31633 () Bool)

(assert (=> d!6421 m!31633))

(declare-fun m!31635 () Bool)

(assert (=> d!6421 m!31635))

(assert (=> d!6421 m!31369))

(declare-fun m!31637 () Bool)

(assert (=> d!6421 m!31637))

(assert (=> d!6421 m!31369))

(assert (=> d!6421 m!31635))

(assert (=> d!6421 m!31493))

(declare-fun m!31639 () Bool)

(assert (=> b!38938 m!31639))

(assert (=> b!38941 m!31369))

(declare-fun m!31641 () Bool)

(assert (=> b!38941 m!31641))

(assert (=> b!38706 d!6421))

(assert (=> d!6307 d!6311))

(declare-fun d!6423 () Bool)

(assert (=> d!6423 (arrayContainsKey!0 lt!14408 lt!14473 #b00000000000000000000000000000000)))

(assert (=> d!6423 true))

(declare-fun _$60!326 () Unit!959)

(assert (=> d!6423 (= (choose!13 lt!14408 lt!14473 #b00000000000000000000000000000000) _$60!326)))

(declare-fun bs!1619 () Bool)

(assert (= bs!1619 d!6423))

(assert (=> bs!1619 m!31311))

(assert (=> d!6307 d!6423))

(assert (=> b!38707 d!6405))

(declare-fun b!38942 () Bool)

(declare-fun e!24727 () Bool)

(declare-fun call!2950 () Bool)

(assert (=> b!38942 (= e!24727 call!2950)))

(declare-fun b!38943 () Bool)

(declare-fun e!24728 () Bool)

(assert (=> b!38943 (= e!24728 call!2950)))

(declare-fun b!38944 () Bool)

(assert (=> b!38944 (= e!24727 e!24728)))

(declare-fun lt!14602 () (_ BitVec 64))

(assert (=> b!38944 (= lt!14602 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14601 () Unit!959)

(assert (=> b!38944 (= lt!14601 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14602 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!38944 (arrayContainsKey!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) lt!14602 #b00000000000000000000000000000000)))

(declare-fun lt!14603 () Unit!959)

(assert (=> b!38944 (= lt!14603 lt!14601)))

(declare-fun res!23477 () Bool)

(assert (=> b!38944 (= res!23477 (= (seekEntryOrOpen!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (Found!167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!38944 (=> (not res!23477) (not e!24728))))

(declare-fun b!38945 () Bool)

(declare-fun e!24726 () Bool)

(assert (=> b!38945 (= e!24726 e!24727)))

(declare-fun c!4523 () Bool)

(assert (=> b!38945 (= c!4523 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6425 () Bool)

(declare-fun res!23476 () Bool)

(assert (=> d!6425 (=> res!23476 e!24726)))

(assert (=> d!6425 (= res!23476 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6425 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) e!24726)))

(declare-fun bm!2947 () Bool)

(assert (=> bm!2947 (= call!2950 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))))

(assert (= (and d!6425 (not res!23476)) b!38945))

(assert (= (and b!38945 c!4523) b!38944))

(assert (= (and b!38945 (not c!4523)) b!38942))

(assert (= (and b!38944 res!23477) b!38943))

(assert (= (or b!38943 b!38942) bm!2947))

(declare-fun m!31643 () Bool)

(assert (=> b!38944 m!31643))

(declare-fun m!31645 () Bool)

(assert (=> b!38944 m!31645))

(declare-fun m!31647 () Bool)

(assert (=> b!38944 m!31647))

(assert (=> b!38944 m!31643))

(declare-fun m!31649 () Bool)

(assert (=> b!38944 m!31649))

(assert (=> b!38945 m!31643))

(assert (=> b!38945 m!31643))

(declare-fun m!31651 () Bool)

(assert (=> b!38945 m!31651))

(declare-fun m!31653 () Bool)

(assert (=> bm!2947 m!31653))

(assert (=> bm!2929 d!6425))

(declare-fun d!6427 () Bool)

(assert (=> d!6427 (= (validMask!0 (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (and (or (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000000111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000001111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000011111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000000111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000001111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000011111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000000111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000001111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000011111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000000111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000001111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000011111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000000111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000001111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000011111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000000111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000001111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000011111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000000111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000001111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000011111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000000111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000001111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000011111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00000111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00001111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00011111111111111111111111111111) (= (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)) (bvsle (mask!5112 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) #b00111111111111111111111111111111)))))

(assert (=> d!6343 d!6427))

(declare-fun lt!14604 () Bool)

(declare-fun d!6429 () Bool)

(assert (=> d!6429 (= lt!14604 (set.member (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) (content!24 Nil!1040)))))

(declare-fun e!24730 () Bool)

(assert (=> d!6429 (= lt!14604 e!24730)))

(declare-fun res!23479 () Bool)

(assert (=> d!6429 (=> (not res!23479) (not e!24730))))

(assert (=> d!6429 (= res!23479 (is-Cons!1039 Nil!1040))))

(assert (=> d!6429 (= (contains!500 Nil!1040 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)) lt!14604)))

(declare-fun b!38946 () Bool)

(declare-fun e!24729 () Bool)

(assert (=> b!38946 (= e!24730 e!24729)))

(declare-fun res!23478 () Bool)

(assert (=> b!38946 (=> res!23478 e!24729)))

(assert (=> b!38946 (= res!23478 (= (h!1607 Nil!1040) (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(declare-fun b!38947 () Bool)

(assert (=> b!38947 (= e!24729 (contains!500 (t!3878 Nil!1040) (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000)))))

(assert (= (and d!6429 res!23479) b!38946))

(assert (= (and b!38946 (not res!23478)) b!38947))

(assert (=> d!6429 m!31377))

(assert (=> d!6429 m!31369))

(declare-fun m!31655 () Bool)

(assert (=> d!6429 m!31655))

(assert (=> b!38947 m!31369))

(declare-fun m!31657 () Bool)

(assert (=> b!38947 m!31657))

(assert (=> b!38780 d!6429))

(declare-fun b!38986 () Bool)

(declare-fun e!24753 () SeekEntryResult!167)

(assert (=> b!38986 (= e!24753 Undefined!167)))

(declare-fun b!38987 () Bool)

(declare-fun e!24751 () SeekEntryResult!167)

(assert (=> b!38987 (= e!24751 (MissingVacant!167 (index!2792 lt!14542)))))

(declare-fun b!38988 () Bool)

(assert (=> b!38988 (= e!24751 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7603 lt!14542) #b00000000000000000000000000000001) (nextIndex!0 (index!2792 lt!14542) (x!7603 lt!14542) mask!853) (index!2792 lt!14542) (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853))))

(declare-fun b!38989 () Bool)

(declare-fun e!24752 () SeekEntryResult!167)

(assert (=> b!38989 (= e!24753 e!24752)))

(declare-fun c!4544 () Bool)

(declare-fun lt!14619 () (_ BitVec 64))

(assert (=> b!38989 (= c!4544 (= lt!14619 (select (arr!1227 lt!14408) #b00000000000000000000000000000000)))))

(declare-fun d!6431 () Bool)

(declare-fun lt!14620 () SeekEntryResult!167)

(assert (=> d!6431 (and (or (is-Undefined!167 lt!14620) (not (is-Found!167 lt!14620)) (and (bvsge (index!2791 lt!14620) #b00000000000000000000000000000000) (bvslt (index!2791 lt!14620) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14620) (is-Found!167 lt!14620) (not (is-MissingVacant!167 lt!14620)) (not (= (index!2793 lt!14620) (index!2792 lt!14542))) (and (bvsge (index!2793 lt!14620) #b00000000000000000000000000000000) (bvslt (index!2793 lt!14620) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14620) (ite (is-Found!167 lt!14620) (= (select (arr!1227 lt!14408) (index!2791 lt!14620)) (select (arr!1227 lt!14408) #b00000000000000000000000000000000)) (and (is-MissingVacant!167 lt!14620) (= (index!2793 lt!14620) (index!2792 lt!14542)) (= (select (arr!1227 lt!14408) (index!2793 lt!14620)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6431 (= lt!14620 e!24753)))

(declare-fun c!4543 () Bool)

(assert (=> d!6431 (= c!4543 (bvsge (x!7603 lt!14542) #b01111111111111111111111111111110))))

(assert (=> d!6431 (= lt!14619 (select (arr!1227 lt!14408) (index!2792 lt!14542)))))

(assert (=> d!6431 (validMask!0 mask!853)))

(assert (=> d!6431 (= (seekKeyOrZeroReturnVacant!0 (x!7603 lt!14542) (index!2792 lt!14542) (index!2792 lt!14542) (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14408 mask!853) lt!14620)))

(declare-fun b!38990 () Bool)

(declare-fun c!4542 () Bool)

(assert (=> b!38990 (= c!4542 (= lt!14619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!38990 (= e!24752 e!24751)))

(declare-fun b!38991 () Bool)

(assert (=> b!38991 (= e!24752 (Found!167 (index!2792 lt!14542)))))

(assert (= (and d!6431 c!4543) b!38986))

(assert (= (and d!6431 (not c!4543)) b!38989))

(assert (= (and b!38989 c!4544) b!38991))

(assert (= (and b!38989 (not c!4544)) b!38990))

(assert (= (and b!38990 c!4542) b!38987))

(assert (= (and b!38990 (not c!4542)) b!38988))

(declare-fun m!31677 () Bool)

(assert (=> b!38988 m!31677))

(assert (=> b!38988 m!31677))

(assert (=> b!38988 m!31271))

(declare-fun m!31679 () Bool)

(assert (=> b!38988 m!31679))

(declare-fun m!31681 () Bool)

(assert (=> d!6431 m!31681))

(declare-fun m!31683 () Bool)

(assert (=> d!6431 m!31683))

(assert (=> d!6431 m!31447))

(assert (=> d!6431 m!31201))

(assert (=> b!38770 d!6431))

(declare-fun b!38993 () Bool)

(declare-fun e!24756 () Bool)

(declare-fun e!24755 () Bool)

(assert (=> b!38993 (= e!24756 e!24755)))

(declare-fun c!4545 () Bool)

(assert (=> b!38993 (= c!4545 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!2950 () Bool)

(declare-fun call!2953 () Bool)

(assert (=> bm!2950 (= call!2953 (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4545 (Cons!1039 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4479 (Cons!1039 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (ite c!4479 (Cons!1039 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1040) Nil!1040))))))

(declare-fun b!38994 () Bool)

(assert (=> b!38994 (= e!24755 call!2953)))

(declare-fun b!38995 () Bool)

(assert (=> b!38995 (= e!24755 call!2953)))

(declare-fun b!38996 () Bool)

(declare-fun e!24754 () Bool)

(assert (=> b!38996 (= e!24754 e!24756)))

(declare-fun res!23482 () Bool)

(assert (=> b!38996 (=> (not res!23482) (not e!24756))))

(declare-fun e!24757 () Bool)

(assert (=> b!38996 (= res!23482 (not e!24757))))

(declare-fun res!23483 () Bool)

(assert (=> b!38996 (=> (not res!23483) (not e!24757))))

(assert (=> b!38996 (= res!23483 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!6441 () Bool)

(declare-fun res!23484 () Bool)

(assert (=> d!6441 (=> res!23484 e!24754)))

(assert (=> d!6441 (= res!23484 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6441 (= (arrayNoDuplicates!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4479 (Cons!1039 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) e!24754)))

(declare-fun b!38992 () Bool)

(assert (=> b!38992 (= e!24757 (contains!500 (ite c!4479 (Cons!1039 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) #b00000000000000000000000000000000) Nil!1040) Nil!1040) (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6441 (not res!23484)) b!38996))

(assert (= (and b!38996 res!23483) b!38992))

(assert (= (and b!38996 res!23482) b!38993))

(assert (= (and b!38993 c!4545) b!38995))

(assert (= (and b!38993 (not c!4545)) b!38994))

(assert (= (or b!38995 b!38994) bm!2950))

(assert (=> b!38993 m!31643))

(assert (=> b!38993 m!31643))

(assert (=> b!38993 m!31651))

(assert (=> bm!2950 m!31643))

(declare-fun m!31685 () Bool)

(assert (=> bm!2950 m!31685))

(assert (=> b!38996 m!31643))

(assert (=> b!38996 m!31643))

(assert (=> b!38996 m!31651))

(assert (=> b!38992 m!31643))

(assert (=> b!38992 m!31643))

(declare-fun m!31687 () Bool)

(assert (=> b!38992 m!31687))

(assert (=> bm!2934 d!6441))

(assert (=> d!6297 d!6239))

(assert (=> b!38781 d!6405))

(declare-fun d!6443 () Bool)

(declare-fun lt!14621 () Bool)

(assert (=> d!6443 (= lt!14621 (set.member (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (content!24 (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040))))))

(declare-fun e!24759 () Bool)

(assert (=> d!6443 (= lt!14621 e!24759)))

(declare-fun res!23486 () Bool)

(assert (=> d!6443 (=> (not res!23486) (not e!24759))))

(assert (=> d!6443 (= res!23486 (is-Cons!1039 (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)))))

(assert (=> d!6443 (= (contains!500 (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!14621)))

(declare-fun b!38997 () Bool)

(declare-fun e!24758 () Bool)

(assert (=> b!38997 (= e!24759 e!24758)))

(declare-fun res!23485 () Bool)

(assert (=> b!38997 (=> res!23485 e!24758)))

(assert (=> b!38997 (= res!23485 (= (h!1607 (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!38998 () Bool)

(assert (=> b!38998 (= e!24758 (contains!500 (t!3878 (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6443 res!23486) b!38997))

(assert (= (and b!38997 (not res!23485)) b!38998))

(declare-fun m!31689 () Bool)

(assert (=> d!6443 m!31689))

(assert (=> d!6443 m!31455))

(declare-fun m!31691 () Bool)

(assert (=> d!6443 m!31691))

(assert (=> b!38998 m!31455))

(declare-fun m!31693 () Bool)

(assert (=> b!38998 m!31693))

(assert (=> b!38787 d!6443))

(declare-fun d!6445 () Bool)

(assert (=> d!6445 (arrayContainsKey!0 lt!14408 lt!14545 #b00000000000000000000000000000000)))

(declare-fun lt!14622 () Unit!959)

(assert (=> d!6445 (= lt!14622 (choose!13 lt!14408 lt!14545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6445 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6445 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14408 lt!14545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14622)))

(declare-fun bs!1620 () Bool)

(assert (= bs!1620 d!6445))

(assert (=> bs!1620 m!31459))

(declare-fun m!31695 () Bool)

(assert (=> bs!1620 m!31695))

(assert (=> b!38773 d!6445))

(declare-fun d!6447 () Bool)

(declare-fun res!23487 () Bool)

(declare-fun e!24760 () Bool)

(assert (=> d!6447 (=> res!23487 e!24760)))

(assert (=> d!6447 (= res!23487 (= (select (arr!1227 lt!14408) #b00000000000000000000000000000000) lt!14545))))

(assert (=> d!6447 (= (arrayContainsKey!0 lt!14408 lt!14545 #b00000000000000000000000000000000) e!24760)))

(declare-fun b!38999 () Bool)

(declare-fun e!24761 () Bool)

(assert (=> b!38999 (= e!24760 e!24761)))

(declare-fun res!23488 () Bool)

(assert (=> b!38999 (=> (not res!23488) (not e!24761))))

(assert (=> b!38999 (= res!23488 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 lt!14408)))))

(declare-fun b!39000 () Bool)

(assert (=> b!39000 (= e!24761 (arrayContainsKey!0 lt!14408 lt!14545 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6447 (not res!23487)) b!38999))

(assert (= (and b!38999 res!23488) b!39000))

(assert (=> d!6447 m!31271))

(declare-fun m!31697 () Bool)

(assert (=> b!39000 m!31697))

(assert (=> b!38773 d!6447))

(declare-fun b!39001 () Bool)

(declare-fun e!24764 () SeekEntryResult!167)

(declare-fun lt!14624 () SeekEntryResult!167)

(assert (=> b!39001 (= e!24764 (Found!167 (index!2792 lt!14624)))))

(declare-fun b!39002 () Bool)

(declare-fun e!24762 () SeekEntryResult!167)

(assert (=> b!39002 (= e!24762 Undefined!167)))

(declare-fun d!6449 () Bool)

(declare-fun lt!14625 () SeekEntryResult!167)

(assert (=> d!6449 (and (or (is-Undefined!167 lt!14625) (not (is-Found!167 lt!14625)) (and (bvsge (index!2791 lt!14625) #b00000000000000000000000000000000) (bvslt (index!2791 lt!14625) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14625) (is-Found!167 lt!14625) (not (is-MissingZero!167 lt!14625)) (and (bvsge (index!2790 lt!14625) #b00000000000000000000000000000000) (bvslt (index!2790 lt!14625) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14625) (is-Found!167 lt!14625) (is-MissingZero!167 lt!14625) (not (is-MissingVacant!167 lt!14625)) (and (bvsge (index!2793 lt!14625) #b00000000000000000000000000000000) (bvslt (index!2793 lt!14625) (size!1334 lt!14408)))) (or (is-Undefined!167 lt!14625) (ite (is-Found!167 lt!14625) (= (select (arr!1227 lt!14408) (index!2791 lt!14625)) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite (is-MissingZero!167 lt!14625) (= (select (arr!1227 lt!14408) (index!2790 lt!14625)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!167 lt!14625) (= (select (arr!1227 lt!14408) (index!2793 lt!14625)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!6449 (= lt!14625 e!24762)))

(declare-fun c!4548 () Bool)

(assert (=> d!6449 (= c!4548 (and (is-Intermediate!167 lt!14624) (undefined!979 lt!14624)))))

(assert (=> d!6449 (= lt!14624 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14408 mask!853))))

(assert (=> d!6449 (validMask!0 mask!853)))

(assert (=> d!6449 (= (seekEntryOrOpen!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14408 mask!853) lt!14625)))

(declare-fun b!39003 () Bool)

(assert (=> b!39003 (= e!24762 e!24764)))

(declare-fun lt!14623 () (_ BitVec 64))

(assert (=> b!39003 (= lt!14623 (select (arr!1227 lt!14408) (index!2792 lt!14624)))))

(declare-fun c!4546 () Bool)

(assert (=> b!39003 (= c!4546 (= lt!14623 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39004 () Bool)

(declare-fun e!24763 () SeekEntryResult!167)

(assert (=> b!39004 (= e!24763 (MissingZero!167 (index!2792 lt!14624)))))

(declare-fun b!39005 () Bool)

(declare-fun c!4547 () Bool)

(assert (=> b!39005 (= c!4547 (= lt!14623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!39005 (= e!24764 e!24763)))

(declare-fun b!39006 () Bool)

(assert (=> b!39006 (= e!24763 (seekKeyOrZeroReturnVacant!0 (x!7603 lt!14624) (index!2792 lt!14624) (index!2792 lt!14624) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14408 mask!853))))

(assert (= (and d!6449 c!4548) b!39002))

(assert (= (and d!6449 (not c!4548)) b!39003))

(assert (= (and b!39003 c!4546) b!39001))

(assert (= (and b!39003 (not c!4546)) b!39005))

(assert (= (and b!39005 c!4547) b!39004))

(assert (= (and b!39005 (not c!4547)) b!39006))

(declare-fun m!31699 () Bool)

(assert (=> d!6449 m!31699))

(declare-fun m!31701 () Bool)

(assert (=> d!6449 m!31701))

(declare-fun m!31703 () Bool)

(assert (=> d!6449 m!31703))

(declare-fun m!31705 () Bool)

(assert (=> d!6449 m!31705))

(assert (=> d!6449 m!31455))

(declare-fun m!31707 () Bool)

(assert (=> d!6449 m!31707))

(assert (=> d!6449 m!31455))

(assert (=> d!6449 m!31705))

(assert (=> d!6449 m!31201))

(declare-fun m!31709 () Bool)

(assert (=> b!39003 m!31709))

(assert (=> b!39006 m!31455))

(declare-fun m!31711 () Bool)

(assert (=> b!39006 m!31711))

(assert (=> b!38773 d!6449))

(declare-fun d!6451 () Bool)

(declare-fun res!23489 () Bool)

(declare-fun e!24765 () Bool)

(assert (=> d!6451 (=> res!23489 e!24765)))

(assert (=> d!6451 (= res!23489 (= (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14473))))

(assert (=> d!6451 (= (arrayContainsKey!0 lt!14408 lt!14473 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!24765)))

(declare-fun b!39007 () Bool)

(declare-fun e!24766 () Bool)

(assert (=> b!39007 (= e!24765 e!24766)))

(declare-fun res!23490 () Bool)

(assert (=> b!39007 (=> (not res!23490) (not e!24766))))

(assert (=> b!39007 (= res!23490 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1334 lt!14408)))))

(declare-fun b!39008 () Bool)

(assert (=> b!39008 (= e!24766 (arrayContainsKey!0 lt!14408 lt!14473 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6451 (not res!23489)) b!39007))

(assert (= (and b!39007 res!23490) b!39008))

(assert (=> d!6451 m!31455))

(declare-fun m!31713 () Bool)

(assert (=> b!39008 m!31713))

(assert (=> b!38719 d!6451))

(assert (=> b!38784 d!6405))

(assert (=> d!6353 d!6265))

(declare-fun d!6453 () Bool)

(assert (=> d!6453 (= (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!38788 d!6453))

(assert (=> b!38774 d!6453))

(declare-fun b!39010 () Bool)

(declare-fun e!24769 () Bool)

(declare-fun e!24768 () Bool)

(assert (=> b!39010 (= e!24769 e!24768)))

(declare-fun c!4549 () Bool)

(assert (=> b!39010 (= c!4549 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun call!2954 () Bool)

(declare-fun bm!2951 () Bool)

(assert (=> bm!2951 (= call!2954 (arrayNoDuplicates!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4549 (Cons!1039 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4480 (Cons!1039 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040))) (ite c!4480 (Cons!1039 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)))))))

(declare-fun b!39011 () Bool)

(assert (=> b!39011 (= e!24768 call!2954)))

(declare-fun b!39012 () Bool)

(assert (=> b!39012 (= e!24768 call!2954)))

(declare-fun b!39013 () Bool)

(declare-fun e!24767 () Bool)

(assert (=> b!39013 (= e!24767 e!24769)))

(declare-fun res!23491 () Bool)

(assert (=> b!39013 (=> (not res!23491) (not e!24769))))

(declare-fun e!24770 () Bool)

(assert (=> b!39013 (= res!23491 (not e!24770))))

(declare-fun res!23492 () Bool)

(assert (=> b!39013 (=> (not res!23492) (not e!24770))))

(assert (=> b!39013 (= res!23492 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6455 () Bool)

(declare-fun res!23493 () Bool)

(assert (=> d!6455 (=> res!23493 e!24767)))

(assert (=> d!6455 (= res!23493 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1334 lt!14408)))))

(assert (=> d!6455 (= (arrayNoDuplicates!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4480 (Cons!1039 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040))) e!24767)))

(declare-fun b!39009 () Bool)

(assert (=> b!39009 (= e!24770 (contains!500 (ite c!4480 (Cons!1039 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (ite c!4418 (Cons!1039 (select (arr!1227 lt!14408) #b00000000000000000000000000000000) Nil!1040) Nil!1040)) (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6455 (not res!23493)) b!39013))

(assert (= (and b!39013 res!23492) b!39009))

(assert (= (and b!39013 res!23491) b!39010))

(assert (= (and b!39010 c!4549) b!39012))

(assert (= (and b!39010 (not c!4549)) b!39011))

(assert (= (or b!39012 b!39011) bm!2951))

(declare-fun m!31715 () Bool)

(assert (=> b!39010 m!31715))

(assert (=> b!39010 m!31715))

(declare-fun m!31717 () Bool)

(assert (=> b!39010 m!31717))

(assert (=> bm!2951 m!31715))

(declare-fun m!31719 () Bool)

(assert (=> bm!2951 m!31719))

(assert (=> b!39013 m!31715))

(assert (=> b!39013 m!31715))

(assert (=> b!39013 m!31717))

(assert (=> b!39009 m!31715))

(assert (=> b!39009 m!31715))

(declare-fun m!31721 () Bool)

(assert (=> b!39009 m!31721))

(assert (=> bm!2935 d!6455))

(declare-fun b!39014 () Bool)

(declare-fun e!24772 () (_ BitVec 32))

(declare-fun call!2955 () (_ BitVec 32))

(assert (=> b!39014 (= e!24772 call!2955)))

(declare-fun d!6457 () Bool)

(declare-fun lt!14626 () (_ BitVec 32))

(assert (=> d!6457 (and (bvsge lt!14626 #b00000000000000000000000000000000) (bvsle lt!14626 (bvsub (size!1334 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun e!24771 () (_ BitVec 32))

(assert (=> d!6457 (= lt!14626 e!24771)))

(declare-fun c!4551 () Bool)

(assert (=> d!6457 (= c!4551 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6457 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1334 lt!14408)))))

(assert (=> d!6457 (= (arrayCountValidKeys!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14626)))

(declare-fun bm!2952 () Bool)

(assert (=> bm!2952 (= call!2955 (arrayCountValidKeys!0 lt!14408 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39015 () Bool)

(assert (=> b!39015 (= e!24772 (bvadd #b00000000000000000000000000000001 call!2955))))

(declare-fun b!39016 () Bool)

(assert (=> b!39016 (= e!24771 #b00000000000000000000000000000000)))

(declare-fun b!39017 () Bool)

(assert (=> b!39017 (= e!24771 e!24772)))

(declare-fun c!4550 () Bool)

(assert (=> b!39017 (= c!4550 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6457 c!4551) b!39016))

(assert (= (and d!6457 (not c!4551)) b!39017))

(assert (= (and b!39017 c!4550) b!39015))

(assert (= (and b!39017 (not c!4550)) b!39014))

(assert (= (or b!39015 b!39014) bm!2952))

(declare-fun m!31723 () Bool)

(assert (=> bm!2952 m!31723))

(assert (=> b!39017 m!31715))

(assert (=> b!39017 m!31715))

(assert (=> b!39017 m!31717))

(assert (=> bm!2938 d!6457))

(declare-fun b!39018 () Bool)

(declare-fun e!24774 () Bool)

(declare-fun call!2956 () Bool)

(assert (=> b!39018 (= e!24774 call!2956)))

(declare-fun b!39019 () Bool)

(declare-fun e!24775 () Bool)

(assert (=> b!39019 (= e!24775 call!2956)))

(declare-fun b!39020 () Bool)

(assert (=> b!39020 (= e!24774 e!24775)))

(declare-fun lt!14628 () (_ BitVec 64))

(assert (=> b!39020 (= lt!14628 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!14627 () Unit!959)

(assert (=> b!39020 (= lt!14627 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14408 lt!14628 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!39020 (arrayContainsKey!0 lt!14408 lt!14628 #b00000000000000000000000000000000)))

(declare-fun lt!14629 () Unit!959)

(assert (=> b!39020 (= lt!14629 lt!14627)))

(declare-fun res!23495 () Bool)

(assert (=> b!39020 (= res!23495 (= (seekEntryOrOpen!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14408 mask!853) (Found!167 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!39020 (=> (not res!23495) (not e!24775))))

(declare-fun b!39021 () Bool)

(declare-fun e!24773 () Bool)

(assert (=> b!39021 (= e!24773 e!24774)))

(declare-fun c!4552 () Bool)

(assert (=> b!39021 (= c!4552 (validKeyInArray!0 (select (arr!1227 lt!14408) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!6459 () Bool)

(declare-fun res!23494 () Bool)

(assert (=> d!6459 (=> res!23494 e!24773)))

(assert (=> d!6459 (= res!23494 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1334 lt!14408)))))

(assert (=> d!6459 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14408 mask!853) e!24773)))

(declare-fun bm!2953 () Bool)

(assert (=> bm!2953 (= call!2956 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14408 mask!853))))

(assert (= (and d!6459 (not res!23494)) b!39021))

(assert (= (and b!39021 c!4552) b!39020))

(assert (= (and b!39021 (not c!4552)) b!39018))

(assert (= (and b!39020 res!23495) b!39019))

(assert (= (or b!39019 b!39018) bm!2953))

(assert (=> b!39020 m!31715))

(declare-fun m!31725 () Bool)

(assert (=> b!39020 m!31725))

(declare-fun m!31727 () Bool)

(assert (=> b!39020 m!31727))

(assert (=> b!39020 m!31715))

(declare-fun m!31729 () Bool)

(assert (=> b!39020 m!31729))

(assert (=> b!39021 m!31715))

(assert (=> b!39021 m!31715))

(assert (=> b!39021 m!31717))

(declare-fun m!31731 () Bool)

(assert (=> bm!2953 m!31731))

(assert (=> bm!2932 d!6459))

(assert (=> b!38791 d!6453))

(declare-fun b!39022 () Bool)

(declare-fun e!24777 () (_ BitVec 32))

(declare-fun call!2957 () (_ BitVec 32))

(assert (=> b!39022 (= e!24777 call!2957)))

(declare-fun d!6461 () Bool)

(declare-fun lt!14630 () (_ BitVec 32))

(assert (=> d!6461 (and (bvsge lt!14630 #b00000000000000000000000000000000) (bvsle lt!14630 (bvsub (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!24776 () (_ BitVec 32))

(assert (=> d!6461 (= lt!14630 e!24776)))

(declare-fun c!4554 () Bool)

(assert (=> d!6461 (= c!4554 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6461 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(assert (=> d!6461 (= (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))) lt!14630)))

(declare-fun bm!2954 () Bool)

(assert (=> bm!2954 (= call!2957 (arrayCountValidKeys!0 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1334 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))))

(declare-fun b!39023 () Bool)

(assert (=> b!39023 (= e!24777 (bvadd #b00000000000000000000000000000001 call!2957))))

(declare-fun b!39024 () Bool)

(assert (=> b!39024 (= e!24776 #b00000000000000000000000000000000)))

(declare-fun b!39025 () Bool)

(assert (=> b!39025 (= e!24776 e!24777)))

(declare-fun c!4553 () Bool)

(assert (=> b!39025 (= c!4553 (validKeyInArray!0 (select (arr!1227 (_keys!3244 (LongMapFixedSize!227 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14407 lt!14407 #b00000000000000000000000000000000 lt!14408 (array!2570 ((as const (Array (_ BitVec 32) ValueCell!623)) EmptyCell!623) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6461 c!4554) b!39024))

(assert (= (and d!6461 (not c!4554)) b!39025))

(assert (= (and b!39025 c!4553) b!39023))

(assert (= (and b!39025 (not c!4553)) b!39022))

(assert (= (or b!39023 b!39022) bm!2954))

(declare-fun m!31733 () Bool)

(assert (=> bm!2954 m!31733))

(assert (=> b!39025 m!31643))

(assert (=> b!39025 m!31643))

(assert (=> b!39025 m!31651))

(assert (=> bm!2927 d!6461))

(assert (=> b!38819 d!6453))

(push 1)

(assert (not b!38944))

(assert (not bm!2952))

(assert (not b!39010))

(assert (not bm!2951))

(assert (not b!39000))

(assert (not bm!2954))

(assert (not b!39006))

(assert (not b!39013))

(assert (not d!6443))

(assert (not b!38988))

(assert (not b!38941))

(assert (not bm!2950))

(assert (not b!39017))

(assert (not d!6423))

(assert (not b!38993))

(assert (not b!39009))

(assert (not b!38996))

(assert (not b_lambda!2017))

(assert (not b!38998))

(assert (not d!6429))

(assert (not b!39008))

(assert (not b!39020))

(assert b_and!2317)

(assert (not d!6421))

(assert (not b!38992))

(assert (not b!38935))

(assert (not b!39025))

(assert (not b!38947))

(assert (not bm!2953))

(assert (not d!6371))

(assert (not d!6445))

(assert (not d!6417))

(assert (not d!6431))

(assert (not b!38945))

(assert (not b!38903))

(assert (not bm!2947))

(assert (not b!39021))

(assert tp_is_empty!1741)

(assert (not d!6449))

(assert (not b_next!1351))

(check-sat)

