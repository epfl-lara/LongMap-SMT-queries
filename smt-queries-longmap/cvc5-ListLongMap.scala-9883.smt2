; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117014 () Bool)

(assert start!117014)

(declare-fun res!920553 () Bool)

(declare-fun e!780576 () Bool)

(assert (=> start!117014 (=> (not res!920553) (not e!780576))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93656 0))(
  ( (array!93657 (arr!45230 (Array (_ BitVec 32) (_ BitVec 64))) (size!45780 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93656)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117014 (= res!920553 (and (bvslt (size!45780 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45780 a!4197))))))

(assert (=> start!117014 e!780576))

(declare-fun array_inv!34258 (array!93656) Bool)

(assert (=> start!117014 (array_inv!34258 a!4197)))

(assert (=> start!117014 true))

(declare-fun b!1377926 () Bool)

(declare-fun res!920554 () Bool)

(assert (=> b!1377926 (=> (not res!920554) (not e!780576))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377926 (= res!920554 (validKeyInArray!0 (select (arr!45230 a!4197) to!360)))))

(declare-fun b!1377927 () Bool)

(declare-fun res!920552 () Bool)

(assert (=> b!1377927 (=> (not res!920552) (not e!780576))))

(assert (=> b!1377927 (= res!920552 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377928 () Bool)

(declare-fun lt!606236 () (_ BitVec 32))

(declare-fun lt!606237 () (_ BitVec 32))

(assert (=> b!1377928 (= e!780576 (not (= lt!606236 (bvadd #b00000000000000000000000000000001 lt!606237))))))

(declare-fun lt!606238 () (_ BitVec 32))

(assert (=> b!1377928 (= (bvadd lt!606237 lt!606238) lt!606236)))

(declare-fun arrayCountValidKeys!0 (array!93656 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377928 (= lt!606236 (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377928 (= lt!606238 (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377928 (= lt!606237 (arrayCountValidKeys!0 a!4197 from!3564 to!360))))

(declare-datatypes ((Unit!45741 0))(
  ( (Unit!45742) )
))
(declare-fun lt!606235 () Unit!45741)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45741)

(assert (=> b!1377928 (= lt!606235 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117014 res!920553) b!1377926))

(assert (= (and b!1377926 res!920554) b!1377927))

(assert (= (and b!1377927 res!920552) b!1377928))

(declare-fun m!1262381 () Bool)

(assert (=> start!117014 m!1262381))

(declare-fun m!1262383 () Bool)

(assert (=> b!1377926 m!1262383))

(assert (=> b!1377926 m!1262383))

(declare-fun m!1262385 () Bool)

(assert (=> b!1377926 m!1262385))

(declare-fun m!1262387 () Bool)

(assert (=> b!1377928 m!1262387))

(declare-fun m!1262389 () Bool)

(assert (=> b!1377928 m!1262389))

(declare-fun m!1262391 () Bool)

(assert (=> b!1377928 m!1262391))

(declare-fun m!1262393 () Bool)

(assert (=> b!1377928 m!1262393))

(push 1)

(assert (not start!117014))

(assert (not b!1377928))

(assert (not b!1377926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148411 () Bool)

(assert (=> d!148411 (= (array_inv!34258 a!4197) (bvsge (size!45780 a!4197) #b00000000000000000000000000000000))))

(assert (=> start!117014 d!148411))

(declare-fun b!1377983 () Bool)

(declare-fun e!780609 () (_ BitVec 32))

(assert (=> b!1377983 (= e!780609 #b00000000000000000000000000000000)))

(declare-fun d!148415 () Bool)

(declare-fun lt!606275 () (_ BitVec 32))

(assert (=> d!148415 (and (bvsge lt!606275 #b00000000000000000000000000000000) (bvsle lt!606275 (bvsub (size!45780 a!4197) from!3564)))))

(assert (=> d!148415 (= lt!606275 e!780609)))

(declare-fun c!128145 () Bool)

(assert (=> d!148415 (= c!128145 (bvsge from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148415 (and (bvsle from!3564 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45780 a!4197)))))

(assert (=> d!148415 (= (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)) lt!606275)))

(declare-fun b!1377984 () Bool)

(declare-fun e!780608 () (_ BitVec 32))

(declare-fun call!66048 () (_ BitVec 32))

(assert (=> b!1377984 (= e!780608 call!66048)))

(declare-fun b!1377985 () Bool)

(assert (=> b!1377985 (= e!780608 (bvadd #b00000000000000000000000000000001 call!66048))))

(declare-fun b!1377986 () Bool)

(assert (=> b!1377986 (= e!780609 e!780608)))

(declare-fun c!128146 () Bool)

(assert (=> b!1377986 (= c!128146 (validKeyInArray!0 (select (arr!45230 a!4197) from!3564)))))

(declare-fun bm!66045 () Bool)

(assert (=> bm!66045 (= call!66048 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (= (and d!148415 c!128145) b!1377983))

(assert (= (and d!148415 (not c!128145)) b!1377986))

(assert (= (and b!1377986 c!128146) b!1377985))

(assert (= (and b!1377986 (not c!128146)) b!1377984))

(assert (= (or b!1377985 b!1377984) bm!66045))

(declare-fun m!1262435 () Bool)

(assert (=> b!1377986 m!1262435))

(assert (=> b!1377986 m!1262435))

(declare-fun m!1262437 () Bool)

(assert (=> b!1377986 m!1262437))

(declare-fun m!1262439 () Bool)

(assert (=> bm!66045 m!1262439))

(assert (=> b!1377928 d!148415))

(declare-fun b!1377987 () Bool)

(declare-fun e!780611 () (_ BitVec 32))

(assert (=> b!1377987 (= e!780611 #b00000000000000000000000000000000)))

(declare-fun d!148425 () Bool)

(declare-fun lt!606276 () (_ BitVec 32))

(assert (=> d!148425 (and (bvsge lt!606276 #b00000000000000000000000000000000) (bvsle lt!606276 (bvsub (size!45780 a!4197) to!360)))))

(assert (=> d!148425 (= lt!606276 e!780611)))

(declare-fun c!128147 () Bool)

(assert (=> d!148425 (= c!128147 (bvsge to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148425 (and (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge to!360 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45780 a!4197)))))

(assert (=> d!148425 (= (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)) lt!606276)))

(declare-fun b!1377988 () Bool)

(declare-fun e!780610 () (_ BitVec 32))

(declare-fun call!66049 () (_ BitVec 32))

(assert (=> b!1377988 (= e!780610 call!66049)))

(declare-fun b!1377989 () Bool)

(assert (=> b!1377989 (= e!780610 (bvadd #b00000000000000000000000000000001 call!66049))))

(declare-fun b!1377990 () Bool)

(assert (=> b!1377990 (= e!780611 e!780610)))

(declare-fun c!128148 () Bool)

(assert (=> b!1377990 (= c!128148 (validKeyInArray!0 (select (arr!45230 a!4197) to!360)))))

(declare-fun bm!66046 () Bool)

(assert (=> bm!66046 (= call!66049 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (= (and d!148425 c!128147) b!1377987))

(assert (= (and d!148425 (not c!128147)) b!1377990))

(assert (= (and b!1377990 c!128148) b!1377989))

(assert (= (and b!1377990 (not c!128148)) b!1377988))

(assert (= (or b!1377989 b!1377988) bm!66046))

(assert (=> b!1377990 m!1262383))

(assert (=> b!1377990 m!1262383))

(assert (=> b!1377990 m!1262385))

(declare-fun m!1262447 () Bool)

(assert (=> bm!66046 m!1262447))

(assert (=> b!1377928 d!148425))

(declare-fun b!1377999 () Bool)

(declare-fun e!780617 () (_ BitVec 32))

(assert (=> b!1377999 (= e!780617 #b00000000000000000000000000000000)))

(declare-fun d!148429 () Bool)

(declare-fun lt!606279 () (_ BitVec 32))

(assert (=> d!148429 (and (bvsge lt!606279 #b00000000000000000000000000000000) (bvsle lt!606279 (bvsub (size!45780 a!4197) from!3564)))))

(assert (=> d!148429 (= lt!606279 e!780617)))

(declare-fun c!128153 () Bool)

(assert (=> d!148429 (= c!128153 (bvsge from!3564 to!360))))

(assert (=> d!148429 (and (bvsle from!3564 to!360) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle to!360 (size!45780 a!4197)))))

(assert (=> d!148429 (= (arrayCountValidKeys!0 a!4197 from!3564 to!360) lt!606279)))

(declare-fun b!1378000 () Bool)

(declare-fun e!780616 () (_ BitVec 32))

(declare-fun call!66052 () (_ BitVec 32))

(assert (=> b!1378000 (= e!780616 call!66052)))

(declare-fun b!1378001 () Bool)

(assert (=> b!1378001 (= e!780616 (bvadd #b00000000000000000000000000000001 call!66052))))

(declare-fun b!1378002 () Bool)

(assert (=> b!1378002 (= e!780617 e!780616)))

(declare-fun c!128154 () Bool)

(assert (=> b!1378002 (= c!128154 (validKeyInArray!0 (select (arr!45230 a!4197) from!3564)))))

(declare-fun bm!66049 () Bool)

(assert (=> bm!66049 (= call!66052 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(assert (= (and d!148429 c!128153) b!1377999))

(assert (= (and d!148429 (not c!128153)) b!1378002))

(assert (= (and b!1378002 c!128154) b!1378001))

(assert (= (and b!1378002 (not c!128154)) b!1378000))

(assert (= (or b!1378001 b!1378000) bm!66049))

(assert (=> b!1378002 m!1262435))

(assert (=> b!1378002 m!1262435))

(assert (=> b!1378002 m!1262437))

(declare-fun m!1262451 () Bool)

(assert (=> bm!66049 m!1262451))

(assert (=> b!1377928 d!148429))

(declare-fun d!148433 () Bool)

(assert (=> d!148433 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun lt!606286 () Unit!45741)

(declare-fun choose!61 (array!93656 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45741)

(assert (=> d!148433 (= lt!606286 (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (=> d!148433 (and (bvslt (size!45780 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45780 a!4197)) (bvsge to!360 from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148433 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) lt!606286)))

(declare-fun bs!39638 () Bool)

(assert (= bs!39638 d!148433))

(assert (=> bs!39638 m!1262391))

(assert (=> bs!39638 m!1262389))

(assert (=> bs!39638 m!1262387))

(declare-fun m!1262457 () Bool)

(assert (=> bs!39638 m!1262457))

(assert (=> b!1377928 d!148433))

(declare-fun d!148441 () Bool)

(assert (=> d!148441 (= (validKeyInArray!0 (select (arr!45230 a!4197) to!360)) (and (not (= (select (arr!45230 a!4197) to!360) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45230 a!4197) to!360) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377926 d!148441))

(push 1)

(assert (not bm!66049))

(assert (not b!1377990))

(assert (not b!1377986))

(assert (not b!1378002))

(assert (not d!148433))

(assert (not bm!66045))

(assert (not bm!66046))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1378019 () Bool)

(declare-fun e!780627 () (_ BitVec 32))

(assert (=> b!1378019 (= e!780627 #b00000000000000000000000000000000)))

(declare-fun d!148453 () Bool)

(declare-fun lt!606290 () (_ BitVec 32))

(assert (=> d!148453 (and (bvsge lt!606290 #b00000000000000000000000000000000) (bvsle lt!606290 (bvsub (size!45780 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(assert (=> d!148453 (= lt!606290 e!780627)))

(declare-fun c!128163 () Bool)

(assert (=> d!148453 (= c!128163 (bvsge (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148453 (and (bvsle (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd to!360 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45780 a!4197)))))

(assert (=> d!148453 (= (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606290)))

(declare-fun b!1378020 () Bool)

(declare-fun e!780626 () (_ BitVec 32))

(declare-fun call!66057 () (_ BitVec 32))

(assert (=> b!1378020 (= e!780626 call!66057)))

(declare-fun b!1378021 () Bool)

(assert (=> b!1378021 (= e!780626 (bvadd #b00000000000000000000000000000001 call!66057))))

(declare-fun b!1378022 () Bool)

(assert (=> b!1378022 (= e!780627 e!780626)))

(declare-fun c!128164 () Bool)

(assert (=> b!1378022 (= c!128164 (validKeyInArray!0 (select (arr!45230 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(declare-fun bm!66054 () Bool)

(assert (=> bm!66054 (= call!66057 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (= (and d!148453 c!128163) b!1378019))

(assert (= (and d!148453 (not c!128163)) b!1378022))

(assert (= (and b!1378022 c!128164) b!1378021))

(assert (= (and b!1378022 (not c!128164)) b!1378020))

(assert (= (or b!1378021 b!1378020) bm!66054))

(declare-fun m!1262473 () Bool)

(assert (=> b!1378022 m!1262473))

(assert (=> b!1378022 m!1262473))

(declare-fun m!1262475 () Bool)

(assert (=> b!1378022 m!1262475))

(declare-fun m!1262477 () Bool)

(assert (=> bm!66054 m!1262477))

(assert (=> bm!66046 d!148453))

(assert (=> d!148433 d!148429))

(assert (=> d!148433 d!148425))

(assert (=> d!148433 d!148415))

(declare-fun d!148455 () Bool)

(assert (=> d!148455 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148455 true))

(declare-fun _$76!67 () Unit!45741)

(assert (=> d!148455 (= (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) _$76!67)))

(declare-fun bs!39640 () Bool)

(assert (= bs!39640 d!148455))

(assert (=> bs!39640 m!1262391))

(assert (=> bs!39640 m!1262389))

(assert (=> bs!39640 m!1262387))

(assert (=> d!148433 d!148455))

(assert (=> b!1377990 d!148441))

(declare-fun b!1378023 () Bool)

(declare-fun e!780629 () (_ BitVec 32))

(assert (=> b!1378023 (= e!780629 #b00000000000000000000000000000000)))

(declare-fun d!148457 () Bool)

(declare-fun lt!606291 () (_ BitVec 32))

(assert (=> d!148457 (and (bvsge lt!606291 #b00000000000000000000000000000000) (bvsle lt!606291 (bvsub (size!45780 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(assert (=> d!148457 (= lt!606291 e!780629)))

(declare-fun c!128165 () Bool)

(assert (=> d!148457 (= c!128165 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148457 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45780 a!4197)))))

(assert (=> d!148457 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606291)))

(declare-fun b!1378024 () Bool)

(declare-fun e!780628 () (_ BitVec 32))

(declare-fun call!66058 () (_ BitVec 32))

(assert (=> b!1378024 (= e!780628 call!66058)))

(declare-fun b!1378025 () Bool)

(assert (=> b!1378025 (= e!780628 (bvadd #b00000000000000000000000000000001 call!66058))))

(declare-fun b!1378026 () Bool)

(assert (=> b!1378026 (= e!780629 e!780628)))

(declare-fun c!128166 () Bool)

(assert (=> b!1378026 (= c!128166 (validKeyInArray!0 (select (arr!45230 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun bm!66055 () Bool)

(assert (=> bm!66055 (= call!66058 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (= (and d!148457 c!128165) b!1378023))

(assert (= (and d!148457 (not c!128165)) b!1378026))

(assert (= (and b!1378026 c!128166) b!1378025))

(assert (= (and b!1378026 (not c!128166)) b!1378024))

(assert (= (or b!1378025 b!1378024) bm!66055))

(declare-fun m!1262479 () Bool)

(assert (=> b!1378026 m!1262479))

(assert (=> b!1378026 m!1262479))

(declare-fun m!1262481 () Bool)

(assert (=> b!1378026 m!1262481))

(declare-fun m!1262483 () Bool)

(assert (=> bm!66055 m!1262483))

(assert (=> bm!66045 d!148457))

(declare-fun b!1378027 () Bool)

(declare-fun e!780631 () (_ BitVec 32))

(assert (=> b!1378027 (= e!780631 #b00000000000000000000000000000000)))

(declare-fun d!148459 () Bool)

(declare-fun lt!606292 () (_ BitVec 32))

(assert (=> d!148459 (and (bvsge lt!606292 #b00000000000000000000000000000000) (bvsle lt!606292 (bvsub (size!45780 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(assert (=> d!148459 (= lt!606292 e!780631)))

(declare-fun c!128167 () Bool)

(assert (=> d!148459 (= c!128167 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(assert (=> d!148459 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) to!360) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!360 (size!45780 a!4197)))))

(assert (=> d!148459 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360) lt!606292)))

(declare-fun b!1378028 () Bool)

(declare-fun e!780630 () (_ BitVec 32))

(declare-fun call!66059 () (_ BitVec 32))

(assert (=> b!1378028 (= e!780630 call!66059)))

(declare-fun b!1378029 () Bool)

(assert (=> b!1378029 (= e!780630 (bvadd #b00000000000000000000000000000001 call!66059))))

(declare-fun b!1378030 () Bool)

(assert (=> b!1378030 (= e!780631 e!780630)))

(declare-fun c!128168 () Bool)

(assert (=> b!1378030 (= c!128168 (validKeyInArray!0 (select (arr!45230 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun bm!66056 () Bool)

(assert (=> bm!66056 (= call!66059 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!360))))

(assert (= (and d!148459 c!128167) b!1378027))

(assert (= (and d!148459 (not c!128167)) b!1378030))

(assert (= (and b!1378030 c!128168) b!1378029))

(assert (= (and b!1378030 (not c!128168)) b!1378028))

(assert (= (or b!1378029 b!1378028) bm!66056))

(assert (=> b!1378030 m!1262479))

(assert (=> b!1378030 m!1262479))

(assert (=> b!1378030 m!1262481))

(declare-fun m!1262485 () Bool)

(assert (=> bm!66056 m!1262485))

(assert (=> bm!66049 d!148459))

(declare-fun d!148461 () Bool)

(assert (=> d!148461 (= (validKeyInArray!0 (select (arr!45230 a!4197) from!3564)) (and (not (= (select (arr!45230 a!4197) from!3564) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45230 a!4197) from!3564) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377986 d!148461))

(assert (=> b!1378002 d!148461))

(push 1)

(assert (not b!1378022))

(assert (not d!148455))

(assert (not b!1378030))

(assert (not bm!66055))

(assert (not bm!66056))

(assert (not bm!66054))

(assert (not b!1378026))

(check-sat)

(pop 1)

(push 1)

(check-sat)

