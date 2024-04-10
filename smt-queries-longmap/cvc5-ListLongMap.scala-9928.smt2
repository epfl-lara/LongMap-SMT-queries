; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117378 () Bool)

(assert start!117378)

(declare-fun res!922222 () Bool)

(declare-fun e!781786 () Bool)

(assert (=> start!117378 (=> (not res!922222) (not e!781786))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93938 0))(
  ( (array!93939 (arr!45365 (Array (_ BitVec 32) (_ BitVec 64))) (size!45915 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93938)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117378 (= res!922222 (and (bvslt (size!45915 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45915 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvsge pivot!64 to!184)))))

(assert (=> start!117378 e!781786))

(declare-fun array_inv!34393 (array!93938) Bool)

(assert (=> start!117378 (array_inv!34393 a!4010)))

(assert (=> start!117378 true))

(declare-fun b!1379892 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93938 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379892 (= e!781786 (not (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) (arrayCountValidKeys!0 a!4010 pivot!64 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184))))))

(assert (= (and start!117378 res!922222) b!1379892))

(declare-fun m!1265109 () Bool)

(assert (=> start!117378 m!1265109))

(declare-fun m!1265111 () Bool)

(assert (=> b!1379892 m!1265111))

(declare-fun m!1265113 () Bool)

(assert (=> b!1379892 m!1265113))

(declare-fun m!1265115 () Bool)

(assert (=> b!1379892 m!1265115))

(push 1)

(assert (not start!117378))

(assert (not b!1379892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148693 () Bool)

(assert (=> d!148693 (= (array_inv!34393 a!4010) (bvsge (size!45915 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117378 d!148693))

(declare-fun b!1379935 () Bool)

(declare-fun e!781819 () (_ BitVec 32))

(declare-fun call!66122 () (_ BitVec 32))

(assert (=> b!1379935 (= e!781819 call!66122)))

(declare-fun d!148695 () Bool)

(declare-fun lt!607798 () (_ BitVec 32))

(assert (=> d!148695 (and (bvsge lt!607798 #b00000000000000000000000000000000) (bvsle lt!607798 (bvsub (size!45915 a!4010) from!3388)))))

(declare-fun e!781818 () (_ BitVec 32))

(assert (=> d!148695 (= lt!607798 e!781818)))

(declare-fun c!128293 () Bool)

(assert (=> d!148695 (= c!128293 (bvsge from!3388 pivot!64))))

(assert (=> d!148695 (and (bvsle from!3388 pivot!64) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle pivot!64 (size!45915 a!4010)))))

(assert (=> d!148695 (= (arrayCountValidKeys!0 a!4010 from!3388 pivot!64) lt!607798)))

(declare-fun b!1379936 () Bool)

(assert (=> b!1379936 (= e!781819 (bvadd #b00000000000000000000000000000001 call!66122))))

(declare-fun b!1379937 () Bool)

(assert (=> b!1379937 (= e!781818 e!781819)))

(declare-fun c!128294 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379937 (= c!128294 (validKeyInArray!0 (select (arr!45365 a!4010) from!3388)))))

(declare-fun bm!66119 () Bool)

(assert (=> bm!66119 (= call!66122 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) pivot!64))))

(declare-fun b!1379938 () Bool)

(assert (=> b!1379938 (= e!781818 #b00000000000000000000000000000000)))

(assert (= (and d!148695 c!128293) b!1379938))

(assert (= (and d!148695 (not c!128293)) b!1379937))

(assert (= (and b!1379937 c!128294) b!1379936))

(assert (= (and b!1379937 (not c!128294)) b!1379935))

(assert (= (or b!1379936 b!1379935) bm!66119))

(declare-fun m!1265147 () Bool)

(assert (=> b!1379937 m!1265147))

(assert (=> b!1379937 m!1265147))

(declare-fun m!1265149 () Bool)

(assert (=> b!1379937 m!1265149))

(declare-fun m!1265151 () Bool)

(assert (=> bm!66119 m!1265151))

(assert (=> b!1379892 d!148695))

(declare-fun b!1379939 () Bool)

(declare-fun e!781821 () (_ BitVec 32))

(declare-fun call!66123 () (_ BitVec 32))

(assert (=> b!1379939 (= e!781821 call!66123)))

(declare-fun d!148703 () Bool)

(declare-fun lt!607799 () (_ BitVec 32))

(assert (=> d!148703 (and (bvsge lt!607799 #b00000000000000000000000000000000) (bvsle lt!607799 (bvsub (size!45915 a!4010) pivot!64)))))

(declare-fun e!781820 () (_ BitVec 32))

(assert (=> d!148703 (= lt!607799 e!781820)))

(declare-fun c!128295 () Bool)

(assert (=> d!148703 (= c!128295 (bvsge pivot!64 to!184))))

(assert (=> d!148703 (and (bvsle pivot!64 to!184) (bvsge pivot!64 #b00000000000000000000000000000000) (bvsle to!184 (size!45915 a!4010)))))

(assert (=> d!148703 (= (arrayCountValidKeys!0 a!4010 pivot!64 to!184) lt!607799)))

(declare-fun b!1379940 () Bool)

(assert (=> b!1379940 (= e!781821 (bvadd #b00000000000000000000000000000001 call!66123))))

(declare-fun b!1379941 () Bool)

(assert (=> b!1379941 (= e!781820 e!781821)))

(declare-fun c!128296 () Bool)

(assert (=> b!1379941 (= c!128296 (validKeyInArray!0 (select (arr!45365 a!4010) pivot!64)))))

(declare-fun bm!66120 () Bool)

(assert (=> bm!66120 (= call!66123 (arrayCountValidKeys!0 a!4010 (bvadd pivot!64 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379942 () Bool)

(assert (=> b!1379942 (= e!781820 #b00000000000000000000000000000000)))

(assert (= (and d!148703 c!128295) b!1379942))

(assert (= (and d!148703 (not c!128295)) b!1379941))

(assert (= (and b!1379941 c!128296) b!1379940))

(assert (= (and b!1379941 (not c!128296)) b!1379939))

(assert (= (or b!1379940 b!1379939) bm!66120))

(declare-fun m!1265153 () Bool)

(assert (=> b!1379941 m!1265153))

(assert (=> b!1379941 m!1265153))

(declare-fun m!1265155 () Bool)

(assert (=> b!1379941 m!1265155))

(declare-fun m!1265157 () Bool)

(assert (=> bm!66120 m!1265157))

(assert (=> b!1379892 d!148703))

(declare-fun b!1379943 () Bool)

(declare-fun e!781823 () (_ BitVec 32))

(declare-fun call!66124 () (_ BitVec 32))

(assert (=> b!1379943 (= e!781823 call!66124)))

(declare-fun d!148705 () Bool)

(declare-fun lt!607800 () (_ BitVec 32))

(assert (=> d!148705 (and (bvsge lt!607800 #b00000000000000000000000000000000) (bvsle lt!607800 (bvsub (size!45915 a!4010) from!3388)))))

(declare-fun e!781822 () (_ BitVec 32))

(assert (=> d!148705 (= lt!607800 e!781822)))

(declare-fun c!128297 () Bool)

(assert (=> d!148705 (= c!128297 (bvsge from!3388 to!184))))

(assert (=> d!148705 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45915 a!4010)))))

(assert (=> d!148705 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607800)))

(declare-fun b!1379944 () Bool)

(assert (=> b!1379944 (= e!781823 (bvadd #b00000000000000000000000000000001 call!66124))))

(declare-fun b!1379945 () Bool)

(assert (=> b!1379945 (= e!781822 e!781823)))

(declare-fun c!128298 () Bool)

(assert (=> b!1379945 (= c!128298 (validKeyInArray!0 (select (arr!45365 a!4010) from!3388)))))

(declare-fun bm!66121 () Bool)

(assert (=> bm!66121 (= call!66124 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379946 () Bool)

(assert (=> b!1379946 (= e!781822 #b00000000000000000000000000000000)))

(assert (= (and d!148705 c!128297) b!1379946))

(assert (= (and d!148705 (not c!128297)) b!1379945))

(assert (= (and b!1379945 c!128298) b!1379944))

(assert (= (and b!1379945 (not c!128298)) b!1379943))

(assert (= (or b!1379944 b!1379943) bm!66121))

(assert (=> b!1379945 m!1265147))

(assert (=> b!1379945 m!1265147))

(assert (=> b!1379945 m!1265149))

(declare-fun m!1265159 () Bool)

(assert (=> bm!66121 m!1265159))

(assert (=> b!1379892 d!148705))

(push 1)

(assert (not bm!66119))

(assert (not b!1379945))

(assert (not bm!66120))

(assert (not b!1379937))

(assert (not b!1379941))

(assert (not bm!66121))

(check-sat)

(pop 1)

(push 1)

(check-sat)

