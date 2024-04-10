; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117380 () Bool)

(assert start!117380)

(declare-fun res!922225 () Bool)

(declare-fun e!781792 () Bool)

(assert (=> start!117380 (=> (not res!922225) (not e!781792))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93940 0))(
  ( (array!93941 (arr!45366 (Array (_ BitVec 32) (_ BitVec 64))) (size!45916 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93940)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117380 (= res!922225 (and (bvslt (size!45916 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45916 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184)))))

(assert (=> start!117380 e!781792))

(declare-fun array_inv!34394 (array!93940) Bool)

(assert (=> start!117380 (array_inv!34394 a!4010)))

(assert (=> start!117380 true))

(declare-fun b!1379895 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93940 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379895 (= e!781792 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (= (and start!117380 res!922225) b!1379895))

(declare-fun m!1265117 () Bool)

(assert (=> start!117380 m!1265117))

(declare-fun m!1265119 () Bool)

(assert (=> b!1379895 m!1265119))

(declare-fun m!1265121 () Bool)

(assert (=> b!1379895 m!1265121))

(declare-fun m!1265123 () Bool)

(assert (=> b!1379895 m!1265123))

(check-sat (not start!117380) (not b!1379895))
(check-sat)
(get-model)

(declare-fun d!148689 () Bool)

(assert (=> d!148689 (= (array_inv!34394 a!4010) (bvsge (size!45916 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117380 d!148689))

(declare-fun b!1379915 () Bool)

(declare-fun e!781809 () (_ BitVec 32))

(declare-fun call!66117 () (_ BitVec 32))

(assert (=> b!1379915 (= e!781809 (bvadd #b00000000000000000000000000000001 call!66117))))

(declare-fun b!1379916 () Bool)

(assert (=> b!1379916 (= e!781809 call!66117)))

(declare-fun b!1379917 () Bool)

(declare-fun e!781808 () (_ BitVec 32))

(assert (=> b!1379917 (= e!781808 e!781809)))

(declare-fun c!128284 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379917 (= c!128284 (validKeyInArray!0 (select (arr!45366 a!4010) from!3388)))))

(declare-fun b!1379918 () Bool)

(assert (=> b!1379918 (= e!781808 #b00000000000000000000000000000000)))

(declare-fun d!148691 () Bool)

(declare-fun lt!607793 () (_ BitVec 32))

(assert (=> d!148691 (and (bvsge lt!607793 #b00000000000000000000000000000000) (bvsle lt!607793 (bvsub (size!45916 a!4010) from!3388)))))

(assert (=> d!148691 (= lt!607793 e!781808)))

(declare-fun c!128283 () Bool)

(assert (=> d!148691 (= c!128283 (bvsge from!3388 pivot!64))))

(assert (=> d!148691 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45916 a!4010)))))

(assert (=> d!148691 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607793)))

(declare-fun bm!66114 () Bool)

(assert (=> bm!66114 (= call!66117 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(assert (= (and d!148691 c!128283) b!1379918))

(assert (= (and d!148691 (not c!128283)) b!1379917))

(assert (= (and b!1379917 c!128284) b!1379915))

(assert (= (and b!1379917 (not c!128284)) b!1379916))

(assert (= (or b!1379915 b!1379916) bm!66114))

(declare-fun m!1265133 () Bool)

(assert (=> b!1379917 m!1265133))

(assert (=> b!1379917 m!1265133))

(declare-fun m!1265135 () Bool)

(assert (=> b!1379917 m!1265135))

(declare-fun m!1265137 () Bool)

(assert (=> bm!66114 m!1265137))

(assert (=> b!1379895 d!148691))

(declare-fun b!1379927 () Bool)

(declare-fun e!781815 () (_ BitVec 32))

(declare-fun call!66118 () (_ BitVec 32))

(assert (=> b!1379927 (= e!781815 (bvadd #b00000000000000000000000000000001 call!66118))))

(declare-fun b!1379928 () Bool)

(assert (=> b!1379928 (= e!781815 call!66118)))

(declare-fun b!1379929 () Bool)

(declare-fun e!781814 () (_ BitVec 32))

(assert (=> b!1379929 (= e!781814 e!781815)))

(declare-fun c!128290 () Bool)

(assert (=> b!1379929 (= c!128290 (validKeyInArray!0 (select (arr!45366 a!4010) pivot!64)))))

(declare-fun b!1379930 () Bool)

(assert (=> b!1379930 (= e!781814 #b00000000000000000000000000000000)))

(declare-fun d!148699 () Bool)

(declare-fun lt!607796 () (_ BitVec 32))

(assert (=> d!148699 (and (bvsge lt!607796 #b00000000000000000000000000000000) (bvsle lt!607796 (bvsub (size!45916 a!4010) pivot!64)))))

(assert (=> d!148699 (= lt!607796 e!781814)))

(declare-fun c!128289 () Bool)

(assert (=> d!148699 (= c!128289 (bvsge pivot!64 to!184))))

(assert (=> d!148699 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45916 a!4010)))))

(assert (=> d!148699 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607796)))

(declare-fun bm!66115 () Bool)

(assert (=> bm!66115 (= call!66118 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(assert (= (and d!148699 c!128289) b!1379930))

(assert (= (and d!148699 (not c!128289)) b!1379929))

(assert (= (and b!1379929 c!128290) b!1379927))

(assert (= (and b!1379929 (not c!128290)) b!1379928))

(assert (= (or b!1379927 b!1379928) bm!66115))

(declare-fun m!1265139 () Bool)

(assert (=> b!1379929 m!1265139))

(assert (=> b!1379929 m!1265139))

(declare-fun m!1265141 () Bool)

(assert (=> b!1379929 m!1265141))

(declare-fun m!1265143 () Bool)

(assert (=> bm!66115 m!1265143))

(assert (=> b!1379895 d!148699))

(declare-fun b!1379931 () Bool)

(declare-fun e!781817 () (_ BitVec 32))

(declare-fun call!66121 () (_ BitVec 32))

(assert (=> b!1379931 (= e!781817 (bvadd #b00000000000000000000000000000001 call!66121))))

(declare-fun b!1379932 () Bool)

(assert (=> b!1379932 (= e!781817 call!66121)))

(declare-fun b!1379933 () Bool)

(declare-fun e!781816 () (_ BitVec 32))

(assert (=> b!1379933 (= e!781816 e!781817)))

(declare-fun c!128292 () Bool)

(assert (=> b!1379933 (= c!128292 (validKeyInArray!0 (select (arr!45366 a!4010) from!3388)))))

(declare-fun b!1379934 () Bool)

(assert (=> b!1379934 (= e!781816 #b00000000000000000000000000000000)))

(declare-fun d!148701 () Bool)

(declare-fun lt!607797 () (_ BitVec 32))

(assert (=> d!148701 (and (bvsge lt!607797 #b00000000000000000000000000000000) (bvsle lt!607797 (bvsub (size!45916 a!4010) from!3388)))))

(assert (=> d!148701 (= lt!607797 e!781816)))

(declare-fun c!128291 () Bool)

(assert (=> d!148701 (= c!128291 (bvsge from!3388 to!184))))

(assert (=> d!148701 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45916 a!4010)))))

(assert (=> d!148701 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607797)))

(declare-fun bm!66118 () Bool)

(assert (=> bm!66118 (= call!66121 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(assert (= (and d!148701 c!128291) b!1379934))

(assert (= (and d!148701 (not c!128291)) b!1379933))

(assert (= (and b!1379933 c!128292) b!1379931))

(assert (= (and b!1379933 (not c!128292)) b!1379932))

(assert (= (or b!1379931 b!1379932) bm!66118))

(assert (=> b!1379933 m!1265133))

(assert (=> b!1379933 m!1265133))

(assert (=> b!1379933 m!1265135))

(declare-fun m!1265145 () Bool)

(assert (=> bm!66118 m!1265145))

(assert (=> b!1379895 d!148701))

(check-sat (not b!1379917) (not bm!66118) (not bm!66115) (not b!1379929) (not b!1379933) (not bm!66114))
(check-sat)
