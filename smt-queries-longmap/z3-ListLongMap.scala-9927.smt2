; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117344 () Bool)

(assert start!117344)

(declare-fun res!922172 () Bool)

(declare-fun e!781698 () Bool)

(assert (=> start!117344 (=> (not res!922172) (not e!781698))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93879 0))(
  ( (array!93880 (arr!45337 (Array (_ BitVec 32) (_ BitVec 64))) (size!45889 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93879)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117344 (= res!922172 (and (bvslt (size!45889 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45889 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117344 e!781698))

(declare-fun array_inv!34570 (array!93879) Bool)

(assert (=> start!117344 (array_inv!34570 a!4010)))

(assert (=> start!117344 true))

(declare-fun b!1379738 () Bool)

(declare-fun res!922171 () Bool)

(assert (=> b!1379738 (=> (not res!922171) (not e!781698))))

(declare-fun isPivot!0 (array!93879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379738 (= res!922171 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1379739 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93879 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379739 (= e!781698 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (=> b!1379739 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45756 0))(
  ( (Unit!45757) )
))
(declare-fun lt!607574 () Unit!45756)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!93879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45756)

(assert (=> b!1379739 (= lt!607574 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117344 res!922172) b!1379738))

(assert (= (and b!1379738 res!922171) b!1379739))

(declare-fun m!1264509 () Bool)

(assert (=> start!117344 m!1264509))

(declare-fun m!1264511 () Bool)

(assert (=> b!1379738 m!1264511))

(declare-fun m!1264513 () Bool)

(assert (=> b!1379739 m!1264513))

(declare-fun m!1264515 () Bool)

(assert (=> b!1379739 m!1264515))

(declare-fun m!1264517 () Bool)

(assert (=> b!1379739 m!1264517))

(declare-fun m!1264519 () Bool)

(assert (=> b!1379739 m!1264519))

(declare-fun m!1264521 () Bool)

(assert (=> b!1379739 m!1264521))

(check-sat (not b!1379738) (not start!117344) (not b!1379739))
(check-sat)
(get-model)

(declare-fun d!148531 () Bool)

(assert (=> d!148531 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39761 () Bool)

(assert (= bs!39761 d!148531))

(declare-fun m!1264551 () Bool)

(assert (=> bs!39761 m!1264551))

(assert (=> bs!39761 m!1264513))

(assert (=> bs!39761 m!1264513))

(assert (=> b!1379738 d!148531))

(declare-fun d!148533 () Bool)

(assert (=> d!148533 (= (array_inv!34570 a!4010) (bvsge (size!45889 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117344 d!148533))

(declare-fun d!148535 () Bool)

(assert (=> d!148535 (= (isPivot!0 a!4010 from!3388 to!184 pivot!64) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39762 () Bool)

(assert (= bs!39762 d!148535))

(assert (=> bs!39762 m!1264515))

(assert (=> bs!39762 m!1264517))

(assert (=> bs!39762 m!1264513))

(assert (=> b!1379739 d!148535))

(declare-fun d!148537 () Bool)

(assert (=> d!148537 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-fun lt!607586 () Unit!45756)

(declare-fun choose!124 (array!93879 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45756)

(assert (=> d!148537 (= lt!607586 (choose!124 a!4010 from!3388 to!184 pivot!64 from!3388))))

(declare-fun e!781717 () Bool)

(assert (=> d!148537 e!781717))

(declare-fun res!922190 () Bool)

(assert (=> d!148537 (=> (not res!922190) (not e!781717))))

(assert (=> d!148537 (= res!922190 (and (bvslt (size!45889 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45889 a!4010)) (bvsge pivot!64 from!3388) (bvslt pivot!64 to!184) (bvsle from!3388 pivot!64) (bvsge from!3388 from!3388)))))

(assert (=> d!148537 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388) lt!607586)))

(declare-fun b!1379757 () Bool)

(assert (=> b!1379757 (= e!781717 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and d!148537 res!922190) b!1379757))

(assert (=> d!148537 m!1264521))

(declare-fun m!1264555 () Bool)

(assert (=> d!148537 m!1264555))

(assert (=> b!1379757 m!1264511))

(assert (=> b!1379739 d!148537))

(declare-fun b!1379797 () Bool)

(declare-fun e!781740 () (_ BitVec 32))

(declare-fun e!781739 () (_ BitVec 32))

(assert (=> b!1379797 (= e!781740 e!781739)))

(declare-fun c!128245 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379797 (= c!128245 (validKeyInArray!0 (select (arr!45337 a!4010) pivot!64)))))

(declare-fun bm!66085 () Bool)

(declare-fun call!66088 () (_ BitVec 32))

(assert (=> bm!66085 (= call!66088 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun d!148547 () Bool)

(declare-fun lt!607599 () (_ BitVec 32))

(assert (=> d!148547 (and (bvsge lt!607599 #b00000000000000000000000000000000) (bvsle lt!607599 (bvsub (size!45889 a!4010) pivot!64)))))

(assert (=> d!148547 (= lt!607599 e!781740)))

(declare-fun c!128244 () Bool)

(assert (=> d!148547 (= c!128244 (bvsge pivot!64 to!184))))

(assert (=> d!148547 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45889 a!4010)))))

(assert (=> d!148547 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607599)))

(declare-fun b!1379798 () Bool)

(assert (=> b!1379798 (= e!781740 #b00000000000000000000000000000000)))

(declare-fun b!1379799 () Bool)

(assert (=> b!1379799 (= e!781739 (bvadd #b00000000000000000000000000000001 call!66088))))

(declare-fun b!1379800 () Bool)

(assert (=> b!1379800 (= e!781739 call!66088)))

(assert (= (and d!148547 c!128244) b!1379798))

(assert (= (and d!148547 (not c!128244)) b!1379797))

(assert (= (and b!1379797 c!128245) b!1379799))

(assert (= (and b!1379797 (not c!128245)) b!1379800))

(assert (= (or b!1379799 b!1379800) bm!66085))

(declare-fun m!1264575 () Bool)

(assert (=> b!1379797 m!1264575))

(assert (=> b!1379797 m!1264575))

(declare-fun m!1264577 () Bool)

(assert (=> b!1379797 m!1264577))

(declare-fun m!1264579 () Bool)

(assert (=> bm!66085 m!1264579))

(assert (=> b!1379739 d!148547))

(declare-fun b!1379801 () Bool)

(declare-fun e!781742 () (_ BitVec 32))

(declare-fun e!781741 () (_ BitVec 32))

(assert (=> b!1379801 (= e!781742 e!781741)))

(declare-fun c!128247 () Bool)

(assert (=> b!1379801 (= c!128247 (validKeyInArray!0 (select (arr!45337 a!4010) from!3388)))))

(declare-fun bm!66086 () Bool)

(declare-fun call!66089 () (_ BitVec 32))

(assert (=> bm!66086 (= call!66089 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun d!148557 () Bool)

(declare-fun lt!607600 () (_ BitVec 32))

(assert (=> d!148557 (and (bvsge lt!607600 #b00000000000000000000000000000000) (bvsle lt!607600 (bvsub (size!45889 a!4010) from!3388)))))

(assert (=> d!148557 (= lt!607600 e!781742)))

(declare-fun c!128246 () Bool)

(assert (=> d!148557 (= c!128246 (bvsge from!3388 to!184))))

(assert (=> d!148557 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45889 a!4010)))))

(assert (=> d!148557 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607600)))

(declare-fun b!1379802 () Bool)

(assert (=> b!1379802 (= e!781742 #b00000000000000000000000000000000)))

(declare-fun b!1379803 () Bool)

(assert (=> b!1379803 (= e!781741 (bvadd #b00000000000000000000000000000001 call!66089))))

(declare-fun b!1379804 () Bool)

(assert (=> b!1379804 (= e!781741 call!66089)))

(assert (= (and d!148557 c!128246) b!1379802))

(assert (= (and d!148557 (not c!128246)) b!1379801))

(assert (= (and b!1379801 c!128247) b!1379803))

(assert (= (and b!1379801 (not c!128247)) b!1379804))

(assert (= (or b!1379803 b!1379804) bm!66086))

(declare-fun m!1264581 () Bool)

(assert (=> b!1379801 m!1264581))

(assert (=> b!1379801 m!1264581))

(declare-fun m!1264583 () Bool)

(assert (=> b!1379801 m!1264583))

(declare-fun m!1264585 () Bool)

(assert (=> bm!66086 m!1264585))

(assert (=> b!1379739 d!148557))

(declare-fun b!1379805 () Bool)

(declare-fun e!781744 () (_ BitVec 32))

(declare-fun e!781743 () (_ BitVec 32))

(assert (=> b!1379805 (= e!781744 e!781743)))

(declare-fun c!128249 () Bool)

(assert (=> b!1379805 (= c!128249 (validKeyInArray!0 (select (arr!45337 a!4010) from!3388)))))

(declare-fun bm!66087 () Bool)

(declare-fun call!66090 () (_ BitVec 32))

(assert (=> bm!66087 (= call!66090 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun d!148559 () Bool)

(declare-fun lt!607601 () (_ BitVec 32))

(assert (=> d!148559 (and (bvsge lt!607601 #b00000000000000000000000000000000) (bvsle lt!607601 (bvsub (size!45889 a!4010) from!3388)))))

(assert (=> d!148559 (= lt!607601 e!781744)))

(declare-fun c!128248 () Bool)

(assert (=> d!148559 (= c!128248 (bvsge from!3388 pivot!64))))

(assert (=> d!148559 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45889 a!4010)))))

(assert (=> d!148559 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607601)))

(declare-fun b!1379806 () Bool)

(assert (=> b!1379806 (= e!781744 #b00000000000000000000000000000000)))

(declare-fun b!1379807 () Bool)

(assert (=> b!1379807 (= e!781743 (bvadd #b00000000000000000000000000000001 call!66090))))

(declare-fun b!1379808 () Bool)

(assert (=> b!1379808 (= e!781743 call!66090)))

(assert (= (and d!148559 c!128248) b!1379806))

(assert (= (and d!148559 (not c!128248)) b!1379805))

(assert (= (and b!1379805 c!128249) b!1379807))

(assert (= (and b!1379805 (not c!128249)) b!1379808))

(assert (= (or b!1379807 b!1379808) bm!66087))

(assert (=> b!1379805 m!1264581))

(assert (=> b!1379805 m!1264581))

(assert (=> b!1379805 m!1264583))

(declare-fun m!1264587 () Bool)

(assert (=> bm!66087 m!1264587))

(assert (=> b!1379739 d!148559))

(check-sat (not b!1379797) (not d!148531) (not d!148537) (not d!148535) (not bm!66085) (not b!1379757) (not b!1379805) (not b!1379801) (not bm!66087) (not bm!66086))
(check-sat)
