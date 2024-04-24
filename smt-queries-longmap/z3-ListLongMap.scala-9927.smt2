; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117580 () Bool)

(assert start!117580)

(declare-fun res!922718 () Bool)

(declare-fun e!782580 () Bool)

(assert (=> start!117580 (=> (not res!922718) (not e!782580))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!94045 0))(
  ( (array!94046 (arr!45415 (Array (_ BitVec 32) (_ BitVec 64))) (size!45966 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!94045)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117580 (= res!922718 (and (bvslt (size!45966 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45966 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117580 e!782580))

(declare-fun array_inv!34696 (array!94045) Bool)

(assert (=> start!117580 (array_inv!34696 a!4010)))

(assert (=> start!117580 true))

(declare-fun b!1381117 () Bool)

(declare-fun res!922719 () Bool)

(assert (=> b!1381117 (=> (not res!922719) (not e!782580))))

(declare-fun isPivot!0 (array!94045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381117 (= res!922719 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(declare-fun b!1381118 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94045 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1381118 (= e!782580 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (=> b!1381118 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-datatypes ((Unit!45854 0))(
  ( (Unit!45855) )
))
(declare-fun lt!608239 () Unit!45854)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 (array!94045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45854)

(assert (=> b!1381118 (= lt!608239 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388))))

(assert (= (and start!117580 res!922718) b!1381117))

(assert (= (and b!1381117 res!922719) b!1381118))

(declare-fun m!1266649 () Bool)

(assert (=> start!117580 m!1266649))

(declare-fun m!1266651 () Bool)

(assert (=> b!1381117 m!1266651))

(declare-fun m!1266653 () Bool)

(assert (=> b!1381118 m!1266653))

(declare-fun m!1266655 () Bool)

(assert (=> b!1381118 m!1266655))

(declare-fun m!1266657 () Bool)

(assert (=> b!1381118 m!1266657))

(declare-fun m!1266659 () Bool)

(assert (=> b!1381118 m!1266659))

(declare-fun m!1266661 () Bool)

(assert (=> b!1381118 m!1266661))

(check-sat (not b!1381118) (not start!117580) (not b!1381117))
(check-sat)
(get-model)

(declare-fun d!149105 () Bool)

(assert (=> d!149105 (= (isPivot!0 a!4010 from!3388 to!184 pivot!64) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39805 () Bool)

(assert (= bs!39805 d!149105))

(assert (=> bs!39805 m!1266655))

(assert (=> bs!39805 m!1266657))

(assert (=> bs!39805 m!1266653))

(assert (=> b!1381118 d!149105))

(declare-fun d!149107 () Bool)

(assert (=> d!149107 (isPivot!0 a!4010 from!3388 to!184 pivot!64)))

(declare-fun lt!608248 () Unit!45854)

(declare-fun choose!124 (array!94045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45854)

(assert (=> d!149107 (= lt!608248 (choose!124 a!4010 from!3388 to!184 pivot!64 from!3388))))

(declare-fun e!782595 () Bool)

(assert (=> d!149107 e!782595))

(declare-fun res!922734 () Bool)

(assert (=> d!149107 (=> (not res!922734) (not e!782595))))

(assert (=> d!149107 (= res!922734 (and (bvslt (size!45966 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45966 a!4010)) (bvsge pivot!64 from!3388) (bvslt pivot!64 to!184) (bvsle from!3388 pivot!64) (bvsge from!3388 from!3388)))))

(assert (=> d!149107 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWholeFromTo!0 a!4010 from!3388 to!184 pivot!64 from!3388) lt!608248)))

(declare-fun b!1381133 () Bool)

(assert (=> b!1381133 (= e!782595 (isPivot!0 a!4010 from!3388 to!184 from!3388))))

(assert (= (and d!149107 res!922734) b!1381133))

(assert (=> d!149107 m!1266661))

(declare-fun m!1266695 () Bool)

(assert (=> d!149107 m!1266695))

(assert (=> b!1381133 m!1266651))

(assert (=> b!1381118 d!149107))

(declare-fun bm!66164 () Bool)

(declare-fun call!66167 () (_ BitVec 32))

(assert (=> bm!66164 (= call!66167 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1381152 () Bool)

(declare-fun e!782608 () (_ BitVec 32))

(assert (=> b!1381152 (= e!782608 #b00000000000000000000000000000000)))

(declare-fun b!1381153 () Bool)

(declare-fun e!782609 () (_ BitVec 32))

(assert (=> b!1381153 (= e!782609 call!66167)))

(declare-fun d!149121 () Bool)

(declare-fun lt!608259 () (_ BitVec 32))

(assert (=> d!149121 (and (bvsge lt!608259 #b00000000000000000000000000000000) (bvsle lt!608259 (bvsub (size!45966 a!4010) pivot!64)))))

(assert (=> d!149121 (= lt!608259 e!782608)))

(declare-fun c!128654 () Bool)

(assert (=> d!149121 (= c!128654 (bvsge pivot!64 to!184))))

(assert (=> d!149121 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45966 a!4010)))))

(assert (=> d!149121 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!608259)))

(declare-fun b!1381154 () Bool)

(assert (=> b!1381154 (= e!782609 (bvadd #b00000000000000000000000000000001 call!66167))))

(declare-fun b!1381155 () Bool)

(assert (=> b!1381155 (= e!782608 e!782609)))

(declare-fun c!128653 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381155 (= c!128653 (validKeyInArray!0 (select (arr!45415 a!4010) pivot!64)))))

(assert (= (and d!149121 c!128654) b!1381152))

(assert (= (and d!149121 (not c!128654)) b!1381155))

(assert (= (and b!1381155 c!128653) b!1381154))

(assert (= (and b!1381155 (not c!128653)) b!1381153))

(assert (= (or b!1381154 b!1381153) bm!66164))

(declare-fun m!1266701 () Bool)

(assert (=> bm!66164 m!1266701))

(declare-fun m!1266703 () Bool)

(assert (=> b!1381155 m!1266703))

(assert (=> b!1381155 m!1266703))

(declare-fun m!1266705 () Bool)

(assert (=> b!1381155 m!1266705))

(assert (=> b!1381118 d!149121))

(declare-fun call!66170 () (_ BitVec 32))

(declare-fun bm!66167 () Bool)

(assert (=> bm!66167 (= call!66170 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1381160 () Bool)

(declare-fun e!782612 () (_ BitVec 32))

(assert (=> b!1381160 (= e!782612 #b00000000000000000000000000000000)))

(declare-fun b!1381161 () Bool)

(declare-fun e!782613 () (_ BitVec 32))

(assert (=> b!1381161 (= e!782613 call!66170)))

(declare-fun d!149127 () Bool)

(declare-fun lt!608260 () (_ BitVec 32))

(assert (=> d!149127 (and (bvsge lt!608260 #b00000000000000000000000000000000) (bvsle lt!608260 (bvsub (size!45966 a!4010) from!3388)))))

(assert (=> d!149127 (= lt!608260 e!782612)))

(declare-fun c!128658 () Bool)

(assert (=> d!149127 (= c!128658 (bvsge from!3388 to!184))))

(assert (=> d!149127 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45966 a!4010)))))

(assert (=> d!149127 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!608260)))

(declare-fun b!1381162 () Bool)

(assert (=> b!1381162 (= e!782613 (bvadd #b00000000000000000000000000000001 call!66170))))

(declare-fun b!1381163 () Bool)

(assert (=> b!1381163 (= e!782612 e!782613)))

(declare-fun c!128657 () Bool)

(assert (=> b!1381163 (= c!128657 (validKeyInArray!0 (select (arr!45415 a!4010) from!3388)))))

(assert (= (and d!149127 c!128658) b!1381160))

(assert (= (and d!149127 (not c!128658)) b!1381163))

(assert (= (and b!1381163 c!128657) b!1381162))

(assert (= (and b!1381163 (not c!128657)) b!1381161))

(assert (= (or b!1381162 b!1381161) bm!66167))

(declare-fun m!1266707 () Bool)

(assert (=> bm!66167 m!1266707))

(declare-fun m!1266709 () Bool)

(assert (=> b!1381163 m!1266709))

(assert (=> b!1381163 m!1266709))

(declare-fun m!1266711 () Bool)

(assert (=> b!1381163 m!1266711))

(assert (=> b!1381118 d!149127))

(declare-fun call!66171 () (_ BitVec 32))

(declare-fun bm!66168 () Bool)

(assert (=> bm!66168 (= call!66171 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun b!1381164 () Bool)

(declare-fun e!782614 () (_ BitVec 32))

(assert (=> b!1381164 (= e!782614 #b00000000000000000000000000000000)))

(declare-fun b!1381165 () Bool)

(declare-fun e!782615 () (_ BitVec 32))

(assert (=> b!1381165 (= e!782615 call!66171)))

(declare-fun d!149129 () Bool)

(declare-fun lt!608261 () (_ BitVec 32))

(assert (=> d!149129 (and (bvsge lt!608261 #b00000000000000000000000000000000) (bvsle lt!608261 (bvsub (size!45966 a!4010) from!3388)))))

(assert (=> d!149129 (= lt!608261 e!782614)))

(declare-fun c!128660 () Bool)

(assert (=> d!149129 (= c!128660 (bvsge from!3388 pivot!64))))

(assert (=> d!149129 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45966 a!4010)))))

(assert (=> d!149129 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!608261)))

(declare-fun b!1381166 () Bool)

(assert (=> b!1381166 (= e!782615 (bvadd #b00000000000000000000000000000001 call!66171))))

(declare-fun b!1381167 () Bool)

(assert (=> b!1381167 (= e!782614 e!782615)))

(declare-fun c!128659 () Bool)

(assert (=> b!1381167 (= c!128659 (validKeyInArray!0 (select (arr!45415 a!4010) from!3388)))))

(assert (= (and d!149129 c!128660) b!1381164))

(assert (= (and d!149129 (not c!128660)) b!1381167))

(assert (= (and b!1381167 c!128659) b!1381166))

(assert (= (and b!1381167 (not c!128659)) b!1381165))

(assert (= (or b!1381166 b!1381165) bm!66168))

(declare-fun m!1266713 () Bool)

(assert (=> bm!66168 m!1266713))

(assert (=> b!1381167 m!1266709))

(assert (=> b!1381167 m!1266709))

(assert (=> b!1381167 m!1266711))

(assert (=> b!1381118 d!149129))

(declare-fun d!149131 () Bool)

(assert (=> d!149131 (= (array_inv!34696 a!4010) (bvsge (size!45966 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117580 d!149131))

(declare-fun d!149133 () Bool)

(assert (=> d!149133 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39810 () Bool)

(assert (= bs!39810 d!149133))

(declare-fun m!1266715 () Bool)

(assert (=> bs!39810 m!1266715))

(assert (=> bs!39810 m!1266653))

(assert (=> bs!39810 m!1266653))

(assert (=> b!1381117 d!149133))

(check-sat (not d!149133) (not b!1381163) (not bm!66167) (not b!1381155) (not b!1381167) (not bm!66164) (not d!149107) (not b!1381133) (not d!149105) (not bm!66168))
(check-sat)
