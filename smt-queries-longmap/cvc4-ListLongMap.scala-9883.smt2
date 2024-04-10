; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117018 () Bool)

(assert start!117018)

(declare-fun res!920571 () Bool)

(declare-fun e!780588 () Bool)

(assert (=> start!117018 (=> (not res!920571) (not e!780588))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93660 0))(
  ( (array!93661 (arr!45232 (Array (_ BitVec 32) (_ BitVec 64))) (size!45782 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93660)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117018 (= res!920571 (and (bvslt (size!45782 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45782 a!4197))))))

(assert (=> start!117018 e!780588))

(declare-fun array_inv!34260 (array!93660) Bool)

(assert (=> start!117018 (array_inv!34260 a!4197)))

(assert (=> start!117018 true))

(declare-fun b!1377944 () Bool)

(declare-fun res!920572 () Bool)

(assert (=> b!1377944 (=> (not res!920572) (not e!780588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377944 (= res!920572 (validKeyInArray!0 (select (arr!45232 a!4197) to!360)))))

(declare-fun b!1377945 () Bool)

(declare-fun res!920570 () Bool)

(assert (=> b!1377945 (=> (not res!920570) (not e!780588))))

(assert (=> b!1377945 (= res!920570 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377946 () Bool)

(declare-fun lt!606259 () (_ BitVec 32))

(declare-fun lt!606261 () (_ BitVec 32))

(assert (=> b!1377946 (= e!780588 (not (= lt!606259 (bvadd #b00000000000000000000000000000001 lt!606261))))))

(declare-fun lt!606260 () (_ BitVec 32))

(assert (=> b!1377946 (= (bvadd lt!606261 lt!606260) lt!606259)))

(declare-fun arrayCountValidKeys!0 (array!93660 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377946 (= lt!606259 (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377946 (= lt!606260 (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377946 (= lt!606261 (arrayCountValidKeys!0 a!4197 from!3564 to!360))))

(declare-datatypes ((Unit!45745 0))(
  ( (Unit!45746) )
))
(declare-fun lt!606262 () Unit!45745)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45745)

(assert (=> b!1377946 (= lt!606262 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117018 res!920571) b!1377944))

(assert (= (and b!1377944 res!920572) b!1377945))

(assert (= (and b!1377945 res!920570) b!1377946))

(declare-fun m!1262409 () Bool)

(assert (=> start!117018 m!1262409))

(declare-fun m!1262411 () Bool)

(assert (=> b!1377944 m!1262411))

(assert (=> b!1377944 m!1262411))

(declare-fun m!1262413 () Bool)

(assert (=> b!1377944 m!1262413))

(declare-fun m!1262415 () Bool)

(assert (=> b!1377946 m!1262415))

(declare-fun m!1262417 () Bool)

(assert (=> b!1377946 m!1262417))

(declare-fun m!1262419 () Bool)

(assert (=> b!1377946 m!1262419))

(declare-fun m!1262421 () Bool)

(assert (=> b!1377946 m!1262421))

(push 1)

(assert (not b!1377946))

(assert (not b!1377944))

(assert (not start!117018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1377991 () Bool)

(declare-fun e!780613 () (_ BitVec 32))

(declare-fun e!780612 () (_ BitVec 32))

(assert (=> b!1377991 (= e!780613 e!780612)))

(declare-fun c!128149 () Bool)

(assert (=> b!1377991 (= c!128149 (validKeyInArray!0 (select (arr!45232 a!4197) from!3564)))))

(declare-fun b!1377992 () Bool)

(declare-fun call!66050 () (_ BitVec 32))

(assert (=> b!1377992 (= e!780612 call!66050)))

(declare-fun b!1377993 () Bool)

(assert (=> b!1377993 (= e!780612 (bvadd #b00000000000000000000000000000001 call!66050))))

(declare-fun d!148421 () Bool)

(declare-fun lt!606277 () (_ BitVec 32))

(assert (=> d!148421 (and (bvsge lt!606277 #b00000000000000000000000000000000) (bvsle lt!606277 (bvsub (size!45782 a!4197) from!3564)))))

(assert (=> d!148421 (= lt!606277 e!780613)))

(declare-fun c!128150 () Bool)

(assert (=> d!148421 (= c!128150 (bvsge from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148421 (and (bvsle from!3564 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45782 a!4197)))))

(assert (=> d!148421 (= (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)) lt!606277)))

(declare-fun bm!66047 () Bool)

(assert (=> bm!66047 (= call!66050 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1377994 () Bool)

(assert (=> b!1377994 (= e!780613 #b00000000000000000000000000000000)))

(assert (= (and d!148421 c!128150) b!1377994))

(assert (= (and d!148421 (not c!128150)) b!1377991))

(assert (= (and b!1377991 c!128149) b!1377993))

(assert (= (and b!1377991 (not c!128149)) b!1377992))

(assert (= (or b!1377993 b!1377992) bm!66047))

(declare-fun m!1262441 () Bool)

(assert (=> b!1377991 m!1262441))

(assert (=> b!1377991 m!1262441))

(declare-fun m!1262443 () Bool)

(assert (=> b!1377991 m!1262443))

(declare-fun m!1262445 () Bool)

(assert (=> bm!66047 m!1262445))

(assert (=> b!1377946 d!148421))

(declare-fun b!1377995 () Bool)

(declare-fun e!780615 () (_ BitVec 32))

(declare-fun e!780614 () (_ BitVec 32))

(assert (=> b!1377995 (= e!780615 e!780614)))

(declare-fun c!128151 () Bool)

(assert (=> b!1377995 (= c!128151 (validKeyInArray!0 (select (arr!45232 a!4197) to!360)))))

(declare-fun b!1377996 () Bool)

(declare-fun call!66051 () (_ BitVec 32))

(assert (=> b!1377996 (= e!780614 call!66051)))

(declare-fun b!1377997 () Bool)

(assert (=> b!1377997 (= e!780614 (bvadd #b00000000000000000000000000000001 call!66051))))

(declare-fun d!148427 () Bool)

(declare-fun lt!606278 () (_ BitVec 32))

(assert (=> d!148427 (and (bvsge lt!606278 #b00000000000000000000000000000000) (bvsle lt!606278 (bvsub (size!45782 a!4197) to!360)))))

(assert (=> d!148427 (= lt!606278 e!780615)))

(declare-fun c!128152 () Bool)

(assert (=> d!148427 (= c!128152 (bvsge to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148427 (and (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge to!360 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45782 a!4197)))))

(assert (=> d!148427 (= (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)) lt!606278)))

(declare-fun bm!66048 () Bool)

(assert (=> bm!66048 (= call!66051 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1377998 () Bool)

(assert (=> b!1377998 (= e!780615 #b00000000000000000000000000000000)))

(assert (= (and d!148427 c!128152) b!1377998))

(assert (= (and d!148427 (not c!128152)) b!1377995))

(assert (= (and b!1377995 c!128151) b!1377997))

(assert (= (and b!1377995 (not c!128151)) b!1377996))

(assert (= (or b!1377997 b!1377996) bm!66048))

(assert (=> b!1377995 m!1262411))

(assert (=> b!1377995 m!1262411))

(assert (=> b!1377995 m!1262413))

(declare-fun m!1262449 () Bool)

(assert (=> bm!66048 m!1262449))

(assert (=> b!1377946 d!148427))

(declare-fun b!1378003 () Bool)

(declare-fun e!780619 () (_ BitVec 32))

(declare-fun e!780618 () (_ BitVec 32))

(assert (=> b!1378003 (= e!780619 e!780618)))

(declare-fun c!128155 () Bool)

(assert (=> b!1378003 (= c!128155 (validKeyInArray!0 (select (arr!45232 a!4197) from!3564)))))

(declare-fun b!1378004 () Bool)

(declare-fun call!66053 () (_ BitVec 32))

(assert (=> b!1378004 (= e!780618 call!66053)))

(declare-fun b!1378005 () Bool)

(assert (=> b!1378005 (= e!780618 (bvadd #b00000000000000000000000000000001 call!66053))))

(declare-fun d!148431 () Bool)

(declare-fun lt!606280 () (_ BitVec 32))

(assert (=> d!148431 (and (bvsge lt!606280 #b00000000000000000000000000000000) (bvsle lt!606280 (bvsub (size!45782 a!4197) from!3564)))))

(assert (=> d!148431 (= lt!606280 e!780619)))

(declare-fun c!128156 () Bool)

(assert (=> d!148431 (= c!128156 (bvsge from!3564 to!360))))

(assert (=> d!148431 (and (bvsle from!3564 to!360) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle to!360 (size!45782 a!4197)))))

(assert (=> d!148431 (= (arrayCountValidKeys!0 a!4197 from!3564 to!360) lt!606280)))

(declare-fun bm!66050 () Bool)

(assert (=> bm!66050 (= call!66053 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(declare-fun b!1378006 () Bool)

(assert (=> b!1378006 (= e!780619 #b00000000000000000000000000000000)))

(assert (= (and d!148431 c!128156) b!1378006))

(assert (= (and d!148431 (not c!128156)) b!1378003))

(assert (= (and b!1378003 c!128155) b!1378005))

(assert (= (and b!1378003 (not c!128155)) b!1378004))

(assert (= (or b!1378005 b!1378004) bm!66050))

(assert (=> b!1378003 m!1262441))

(assert (=> b!1378003 m!1262441))

(assert (=> b!1378003 m!1262443))

(declare-fun m!1262453 () Bool)

(assert (=> bm!66050 m!1262453))

(assert (=> b!1377946 d!148431))

(declare-fun d!148435 () Bool)

(assert (=> d!148435 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun lt!606285 () Unit!45745)

(declare-fun choose!61 (array!93660 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45745)

(assert (=> d!148435 (= lt!606285 (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (=> d!148435 (and (bvslt (size!45782 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45782 a!4197)) (bvsge to!360 from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148435 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) lt!606285)))

(declare-fun bs!39637 () Bool)

(assert (= bs!39637 d!148435))

(assert (=> bs!39637 m!1262419))

(assert (=> bs!39637 m!1262417))

(assert (=> bs!39637 m!1262415))

(declare-fun m!1262455 () Bool)

(assert (=> bs!39637 m!1262455))

(assert (=> b!1377946 d!148435))

(declare-fun d!148437 () Bool)

(assert (=> d!148437 (= (validKeyInArray!0 (select (arr!45232 a!4197) to!360)) (and (not (= (select (arr!45232 a!4197) to!360) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45232 a!4197) to!360) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377944 d!148437))

(declare-fun d!148439 () Bool)

(assert (=> d!148439 (= (array_inv!34260 a!4197) (bvsge (size!45782 a!4197) #b00000000000000000000000000000000))))

(assert (=> start!117018 d!148439))

(push 1)

(assert (not d!148435))

(assert (not bm!66050))

(assert (not b!1378003))

(assert (not b!1377991))

(assert (not b!1377995))

(assert (not bm!66048))

(assert (not bm!66047))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

