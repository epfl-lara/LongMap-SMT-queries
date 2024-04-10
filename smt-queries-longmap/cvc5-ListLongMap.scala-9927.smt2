; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117348 () Bool)

(assert start!117348)

(declare-fun res!922198 () Bool)

(declare-fun e!781729 () Bool)

(assert (=> start!117348 (=> (not res!922198) (not e!781729))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93929 0))(
  ( (array!93930 (arr!45362 (Array (_ BitVec 32) (_ BitVec 64))) (size!45912 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93929)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117348 (= res!922198 (and (bvslt (size!45912 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45912 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117348 e!781729))

(declare-fun array_inv!34390 (array!93929) Bool)

(assert (=> start!117348 (array_inv!34390 a!4010)))

(assert (=> start!117348 true))

(declare-fun b!1379807 () Bool)

(declare-fun res!922197 () Bool)

(assert (=> b!1379807 (=> (not res!922197) (not e!781729))))

(declare-fun isPivot!0 (array!93929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379807 (= res!922197 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379808 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93929 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379808 (= e!781729 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (=> b!1379808 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45915 0))(
  ( (Unit!45916) )
))
(declare-fun lt!607758 () Unit!45915)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45915)

(assert (=> b!1379808 (= lt!607758 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117348 res!922198) b!1379807))

(assert (= (and b!1379807 res!922197) b!1379808))

(declare-fun m!1265013 () Bool)

(assert (=> start!117348 m!1265013))

(declare-fun m!1265015 () Bool)

(assert (=> b!1379807 m!1265015))

(declare-fun m!1265017 () Bool)

(assert (=> b!1379808 m!1265017))

(declare-fun m!1265019 () Bool)

(assert (=> b!1379808 m!1265019))

(declare-fun m!1265021 () Bool)

(assert (=> b!1379808 m!1265021))

(declare-fun m!1265023 () Bool)

(assert (=> b!1379808 m!1265023))

(declare-fun m!1265025 () Bool)

(assert (=> b!1379808 m!1265025))

(push 1)

(assert (not start!117348))

(assert (not b!1379808))

(assert (not b!1379807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148651 () Bool)

(assert (=> d!148651 (= (array_inv!34390 a!4010) (bvsge (size!45912 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117348 d!148651))

(declare-fun d!148653 () Bool)

(assert (=> d!148653 (= (isPivot!0 a!4010 from!3388 to!184 pivot!64) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39789 () Bool)

(assert (= bs!39789 d!148653))

(assert (=> bs!39789 m!1265019))

(assert (=> bs!39789 m!1265021))

(assert (=> bs!39789 m!1265017))

(assert (=> b!1379808 d!148653))

(declare-fun d!148657 () Bool)

(assert (=> d!148657 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-fun lt!607773 () Unit!45915)

(declare-fun choose!124 (array!93929 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45915)

(assert (=> d!148657 (= lt!607773 (choose!124 a!4010 from!3388 to!184 pivot!64 from!3388))))

(declare-fun e!781751 () Bool)

(assert (=> d!148657 e!781751))

(declare-fun res!922219 () Bool)

(assert (=> d!148657 (=> (not res!922219) (not e!781751))))

(assert (=> d!148657 (= res!922219 (and (bvslt (size!45912 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45912 a!4010)) (bvsge pivot!64 from!3388) (bvslt pivot!64 to!184) (bvsle from!3388 pivot!64) (bvsge from!3388 from!3388)))))

(assert (=> d!148657 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388) lt!607773)))

(declare-fun b!1379829 () Bool)

(assert (=> b!1379829 (= e!781751 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and d!148657 res!922219) b!1379829))

(assert (=> d!148657 m!1265025))

(declare-fun m!1265061 () Bool)

(assert (=> d!148657 m!1265061))

(assert (=> b!1379829 m!1265015))

(assert (=> b!1379808 d!148657))

(declare-fun b!1379878 () Bool)

(declare-fun e!781776 () (_ BitVec 32))

(assert (=> b!1379878 (= e!781776 #b00000000000000000000000000000000)))

(declare-fun bm!66107 () Bool)

(declare-fun call!66110 () (_ BitVec 32))

(assert (=> bm!66107 (= call!66110 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun d!148669 () Bool)

(declare-fun lt!607786 () (_ BitVec 32))

(assert (=> d!148669 (and (bvsge lt!607786 #b00000000000000000000000000000000) (bvsle lt!607786 (bvsub (size!45912 a!4010) pivot!64)))))

(assert (=> d!148669 (= lt!607786 e!781776)))

(declare-fun c!128270 () Bool)

(assert (=> d!148669 (= c!128270 (bvsge pivot!64 to!184))))

(assert (=> d!148669 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45912 a!4010)))))

(assert (=> d!148669 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607786)))

(declare-fun b!1379879 () Bool)

(declare-fun e!781777 () (_ BitVec 32))

(assert (=> b!1379879 (= e!781776 e!781777)))

(declare-fun c!128269 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379879 (= c!128269 (validKeyInArray!0 (select (arr!45362 a!4010) pivot!64)))))

(declare-fun b!1379880 () Bool)

(assert (=> b!1379880 (= e!781777 call!66110)))

(declare-fun b!1379881 () Bool)

(assert (=> b!1379881 (= e!781777 (bvadd #b00000000000000000000000000000001 call!66110))))

(assert (= (and d!148669 c!128270) b!1379878))

(assert (= (and d!148669 (not c!128270)) b!1379879))

(assert (= (and b!1379879 c!128269) b!1379881))

(assert (= (and b!1379879 (not c!128269)) b!1379880))

(assert (= (or b!1379881 b!1379880) bm!66107))

(declare-fun m!1265093 () Bool)

(assert (=> bm!66107 m!1265093))

(declare-fun m!1265095 () Bool)

(assert (=> b!1379879 m!1265095))

(assert (=> b!1379879 m!1265095))

(declare-fun m!1265097 () Bool)

(assert (=> b!1379879 m!1265097))

(assert (=> b!1379808 d!148669))

(declare-fun b!1379882 () Bool)

(declare-fun e!781778 () (_ BitVec 32))

(assert (=> b!1379882 (= e!781778 #b00000000000000000000000000000000)))

(declare-fun bm!66108 () Bool)

(declare-fun call!66111 () (_ BitVec 32))

(assert (=> bm!66108 (= call!66111 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun d!148681 () Bool)

(declare-fun lt!607787 () (_ BitVec 32))

(assert (=> d!148681 (and (bvsge lt!607787 #b00000000000000000000000000000000) (bvsle lt!607787 (bvsub (size!45912 a!4010) from!3388)))))

(assert (=> d!148681 (= lt!607787 e!781778)))

(declare-fun c!128272 () Bool)

(assert (=> d!148681 (= c!128272 (bvsge from!3388 to!184))))

(assert (=> d!148681 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45912 a!4010)))))

(assert (=> d!148681 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607787)))

(declare-fun b!1379883 () Bool)

(declare-fun e!781779 () (_ BitVec 32))

(assert (=> b!1379883 (= e!781778 e!781779)))

(declare-fun c!128271 () Bool)

(assert (=> b!1379883 (= c!128271 (validKeyInArray!0 (select (arr!45362 a!4010) from!3388)))))

(declare-fun b!1379884 () Bool)

(assert (=> b!1379884 (= e!781779 call!66111)))

(declare-fun b!1379885 () Bool)

(assert (=> b!1379885 (= e!781779 (bvadd #b00000000000000000000000000000001 call!66111))))

(assert (= (and d!148681 c!128272) b!1379882))

(assert (= (and d!148681 (not c!128272)) b!1379883))

(assert (= (and b!1379883 c!128271) b!1379885))

(assert (= (and b!1379883 (not c!128271)) b!1379884))

(assert (= (or b!1379885 b!1379884) bm!66108))

(declare-fun m!1265099 () Bool)

(assert (=> bm!66108 m!1265099))

(declare-fun m!1265101 () Bool)

(assert (=> b!1379883 m!1265101))

(assert (=> b!1379883 m!1265101))

(declare-fun m!1265103 () Bool)

(assert (=> b!1379883 m!1265103))

(assert (=> b!1379808 d!148681))

(declare-fun b!1379886 () Bool)

(declare-fun e!781780 () (_ BitVec 32))

(assert (=> b!1379886 (= e!781780 #b00000000000000000000000000000000)))

(declare-fun call!66112 () (_ BitVec 32))

(declare-fun bm!66109 () Bool)

(assert (=> bm!66109 (= call!66112 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun d!148683 () Bool)

(declare-fun lt!607788 () (_ BitVec 32))

(assert (=> d!148683 (and (bvsge lt!607788 #b00000000000000000000000000000000) (bvsle lt!607788 (bvsub (size!45912 a!4010) from!3388)))))

(assert (=> d!148683 (= lt!607788 e!781780)))

(declare-fun c!128274 () Bool)

(assert (=> d!148683 (= c!128274 (bvsge from!3388 pivot!64))))

(assert (=> d!148683 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45912 a!4010)))))

(assert (=> d!148683 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607788)))

(declare-fun b!1379887 () Bool)

(declare-fun e!781781 () (_ BitVec 32))

(assert (=> b!1379887 (= e!781780 e!781781)))

(declare-fun c!128273 () Bool)

(assert (=> b!1379887 (= c!128273 (validKeyInArray!0 (select (arr!45362 a!4010) from!3388)))))

(declare-fun b!1379888 () Bool)

(assert (=> b!1379888 (= e!781781 call!66112)))

(declare-fun b!1379889 () Bool)

(assert (=> b!1379889 (= e!781781 (bvadd #b00000000000000000000000000000001 call!66112))))

(assert (= (and d!148683 c!128274) b!1379886))

(assert (= (and d!148683 (not c!128274)) b!1379887))

(assert (= (and b!1379887 c!128273) b!1379889))

(assert (= (and b!1379887 (not c!128273)) b!1379888))

(assert (= (or b!1379889 b!1379888) bm!66109))

(declare-fun m!1265105 () Bool)

(assert (=> bm!66109 m!1265105))

(assert (=> b!1379887 m!1265101))

(assert (=> b!1379887 m!1265101))

(assert (=> b!1379887 m!1265103))

(assert (=> b!1379808 d!148683))

(declare-fun d!148685 () Bool)

(assert (=> d!148685 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39793 () Bool)

(assert (= bs!39793 d!148685))

(declare-fun m!1265107 () Bool)

(assert (=> bs!39793 m!1265107))

(assert (=> bs!39793 m!1265017))

(assert (=> bs!39793 m!1265017))

(assert (=> b!1379807 d!148685))

(push 1)

