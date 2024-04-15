; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117008 () Bool)

(assert start!117008)

(declare-fun res!920527 () Bool)

(declare-fun e!780543 () Bool)

(assert (=> start!117008 (=> (not res!920527) (not e!780543))))

(declare-fun to!360 () (_ BitVec 32))

(declare-datatypes ((array!93606 0))(
  ( (array!93607 (arr!45205 (Array (_ BitVec 32) (_ BitVec 64))) (size!45757 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93606)

(declare-fun from!3564 () (_ BitVec 32))

(assert (=> start!117008 (= res!920527 (and (bvslt (size!45757 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45757 a!4197))))))

(assert (=> start!117008 e!780543))

(declare-fun array_inv!34438 (array!93606) Bool)

(assert (=> start!117008 (array_inv!34438 a!4197)))

(assert (=> start!117008 true))

(declare-fun b!1377853 () Bool)

(declare-fun res!920528 () Bool)

(assert (=> b!1377853 (=> (not res!920528) (not e!780543))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377853 (= res!920528 (validKeyInArray!0 (select (arr!45205 a!4197) to!360)))))

(declare-fun b!1377854 () Bool)

(declare-fun res!920526 () Bool)

(assert (=> b!1377854 (=> (not res!920526) (not e!780543))))

(assert (=> b!1377854 (= res!920526 (and (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(declare-fun b!1377855 () Bool)

(declare-fun lt!606051 () (_ BitVec 32))

(declare-fun lt!606052 () (_ BitVec 32))

(assert (=> b!1377855 (= e!780543 (not (= lt!606051 (bvadd #b00000000000000000000000000000001 lt!606052))))))

(declare-fun lt!606050 () (_ BitVec 32))

(assert (=> b!1377855 (= (bvadd lt!606052 lt!606050) lt!606051)))

(declare-fun arrayCountValidKeys!0 (array!93606 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377855 (= lt!606051 (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377855 (= lt!606050 (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> b!1377855 (= lt!606052 (arrayCountValidKeys!0 a!4197 from!3564 to!360))))

(declare-datatypes ((Unit!45582 0))(
  ( (Unit!45583) )
))
(declare-fun lt!606053 () Unit!45582)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45582)

(assert (=> b!1377855 (= lt!606053 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (= (and start!117008 res!920527) b!1377853))

(assert (= (and b!1377853 res!920528) b!1377854))

(assert (= (and b!1377854 res!920526) b!1377855))

(declare-fun m!1261869 () Bool)

(assert (=> start!117008 m!1261869))

(declare-fun m!1261871 () Bool)

(assert (=> b!1377853 m!1261871))

(assert (=> b!1377853 m!1261871))

(declare-fun m!1261873 () Bool)

(assert (=> b!1377853 m!1261873))

(declare-fun m!1261875 () Bool)

(assert (=> b!1377855 m!1261875))

(declare-fun m!1261877 () Bool)

(assert (=> b!1377855 m!1261877))

(declare-fun m!1261879 () Bool)

(assert (=> b!1377855 m!1261879))

(declare-fun m!1261881 () Bool)

(assert (=> b!1377855 m!1261881))

(check-sat (not start!117008) (not b!1377855) (not b!1377853))
(check-sat)
(get-model)

(declare-fun d!148289 () Bool)

(assert (=> d!148289 (= (array_inv!34438 a!4197) (bvsge (size!45757 a!4197) #b00000000000000000000000000000000))))

(assert (=> start!117008 d!148289))

(declare-fun b!1377922 () Bool)

(declare-fun e!780581 () (_ BitVec 32))

(assert (=> b!1377922 (= e!780581 #b00000000000000000000000000000000)))

(declare-fun call!66031 () (_ BitVec 32))

(declare-fun bm!66028 () Bool)

(assert (=> bm!66028 (= call!66031 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1377923 () Bool)

(declare-fun e!780582 () (_ BitVec 32))

(assert (=> b!1377923 (= e!780582 (bvadd #b00000000000000000000000000000001 call!66031))))

(declare-fun d!148291 () Bool)

(declare-fun lt!606090 () (_ BitVec 32))

(assert (=> d!148291 (and (bvsge lt!606090 #b00000000000000000000000000000000) (bvsle lt!606090 (bvsub (size!45757 a!4197) from!3564)))))

(assert (=> d!148291 (= lt!606090 e!780581)))

(declare-fun c!128130 () Bool)

(assert (=> d!148291 (= c!128130 (bvsge from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148291 (and (bvsle from!3564 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45757 a!4197)))))

(assert (=> d!148291 (= (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)) lt!606090)))

(declare-fun b!1377924 () Bool)

(assert (=> b!1377924 (= e!780581 e!780582)))

(declare-fun c!128131 () Bool)

(assert (=> b!1377924 (= c!128131 (validKeyInArray!0 (select (arr!45205 a!4197) from!3564)))))

(declare-fun b!1377925 () Bool)

(assert (=> b!1377925 (= e!780582 call!66031)))

(assert (= (and d!148291 c!128130) b!1377922))

(assert (= (and d!148291 (not c!128130)) b!1377924))

(assert (= (and b!1377924 c!128131) b!1377923))

(assert (= (and b!1377924 (not c!128131)) b!1377925))

(assert (= (or b!1377923 b!1377925) bm!66028))

(declare-fun m!1261931 () Bool)

(assert (=> bm!66028 m!1261931))

(declare-fun m!1261933 () Bool)

(assert (=> b!1377924 m!1261933))

(assert (=> b!1377924 m!1261933))

(declare-fun m!1261935 () Bool)

(assert (=> b!1377924 m!1261935))

(assert (=> b!1377855 d!148291))

(declare-fun b!1377926 () Bool)

(declare-fun e!780583 () (_ BitVec 32))

(assert (=> b!1377926 (= e!780583 #b00000000000000000000000000000000)))

(declare-fun bm!66029 () Bool)

(declare-fun call!66032 () (_ BitVec 32))

(assert (=> bm!66029 (= call!66032 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1377927 () Bool)

(declare-fun e!780584 () (_ BitVec 32))

(assert (=> b!1377927 (= e!780584 (bvadd #b00000000000000000000000000000001 call!66032))))

(declare-fun d!148305 () Bool)

(declare-fun lt!606095 () (_ BitVec 32))

(assert (=> d!148305 (and (bvsge lt!606095 #b00000000000000000000000000000000) (bvsle lt!606095 (bvsub (size!45757 a!4197) to!360)))))

(assert (=> d!148305 (= lt!606095 e!780583)))

(declare-fun c!128132 () Bool)

(assert (=> d!148305 (= c!128132 (bvsge to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148305 (and (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)) (bvsge to!360 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45757 a!4197)))))

(assert (=> d!148305 (= (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360)) lt!606095)))

(declare-fun b!1377928 () Bool)

(assert (=> b!1377928 (= e!780583 e!780584)))

(declare-fun c!128133 () Bool)

(assert (=> b!1377928 (= c!128133 (validKeyInArray!0 (select (arr!45205 a!4197) to!360)))))

(declare-fun b!1377929 () Bool)

(assert (=> b!1377929 (= e!780584 call!66032)))

(assert (= (and d!148305 c!128132) b!1377926))

(assert (= (and d!148305 (not c!128132)) b!1377928))

(assert (= (and b!1377928 c!128133) b!1377927))

(assert (= (and b!1377928 (not c!128133)) b!1377929))

(assert (= (or b!1377927 b!1377929) bm!66029))

(declare-fun m!1261937 () Bool)

(assert (=> bm!66029 m!1261937))

(assert (=> b!1377928 m!1261871))

(assert (=> b!1377928 m!1261871))

(assert (=> b!1377928 m!1261873))

(assert (=> b!1377855 d!148305))

(declare-fun b!1377930 () Bool)

(declare-fun e!780585 () (_ BitVec 32))

(assert (=> b!1377930 (= e!780585 #b00000000000000000000000000000000)))

(declare-fun bm!66030 () Bool)

(declare-fun call!66033 () (_ BitVec 32))

(assert (=> bm!66030 (= call!66033 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(declare-fun b!1377931 () Bool)

(declare-fun e!780586 () (_ BitVec 32))

(assert (=> b!1377931 (= e!780586 (bvadd #b00000000000000000000000000000001 call!66033))))

(declare-fun d!148307 () Bool)

(declare-fun lt!606096 () (_ BitVec 32))

(assert (=> d!148307 (and (bvsge lt!606096 #b00000000000000000000000000000000) (bvsle lt!606096 (bvsub (size!45757 a!4197) from!3564)))))

(assert (=> d!148307 (= lt!606096 e!780585)))

(declare-fun c!128134 () Bool)

(assert (=> d!148307 (= c!128134 (bvsge from!3564 to!360))))

(assert (=> d!148307 (and (bvsle from!3564 to!360) (bvsge from!3564 #b00000000000000000000000000000000) (bvsle to!360 (size!45757 a!4197)))))

(assert (=> d!148307 (= (arrayCountValidKeys!0 a!4197 from!3564 to!360) lt!606096)))

(declare-fun b!1377932 () Bool)

(assert (=> b!1377932 (= e!780585 e!780586)))

(declare-fun c!128135 () Bool)

(assert (=> b!1377932 (= c!128135 (validKeyInArray!0 (select (arr!45205 a!4197) from!3564)))))

(declare-fun b!1377933 () Bool)

(assert (=> b!1377933 (= e!780586 call!66033)))

(assert (= (and d!148307 c!128134) b!1377930))

(assert (= (and d!148307 (not c!128134)) b!1377932))

(assert (= (and b!1377932 c!128135) b!1377931))

(assert (= (and b!1377932 (not c!128135)) b!1377933))

(assert (= (or b!1377931 b!1377933) bm!66030))

(declare-fun m!1261939 () Bool)

(assert (=> bm!66030 m!1261939))

(assert (=> b!1377932 m!1261933))

(assert (=> b!1377932 m!1261933))

(assert (=> b!1377932 m!1261935))

(assert (=> b!1377855 d!148307))

(declare-fun d!148311 () Bool)

(assert (=> d!148311 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun lt!606101 () Unit!45582)

(declare-fun choose!61 (array!93606 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45582)

(assert (=> d!148311 (= lt!606101 (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360))))

(assert (=> d!148311 (and (bvslt (size!45757 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45757 a!4197)) (bvsge to!360 from!3564) (bvsle to!360 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148311 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) lt!606101)))

(declare-fun bs!39609 () Bool)

(assert (= bs!39609 d!148311))

(assert (=> bs!39609 m!1261879))

(assert (=> bs!39609 m!1261877))

(assert (=> bs!39609 m!1261875))

(declare-fun m!1261945 () Bool)

(assert (=> bs!39609 m!1261945))

(assert (=> b!1377855 d!148311))

(declare-fun d!148315 () Bool)

(assert (=> d!148315 (= (validKeyInArray!0 (select (arr!45205 a!4197) to!360)) (and (not (= (select (arr!45205 a!4197) to!360) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45205 a!4197) to!360) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377853 d!148315))

(check-sat (not d!148311) (not bm!66029) (not bm!66030) (not b!1377928) (not b!1377924) (not b!1377932) (not bm!66028))
(check-sat)
(get-model)

(declare-fun d!148317 () Bool)

(assert (=> d!148317 (= (validKeyInArray!0 (select (arr!45205 a!4197) from!3564)) (and (not (= (select (arr!45205 a!4197) from!3564) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45205 a!4197) from!3564) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377924 d!148317))

(declare-fun b!1377934 () Bool)

(declare-fun e!780587 () (_ BitVec 32))

(assert (=> b!1377934 (= e!780587 #b00000000000000000000000000000000)))

(declare-fun call!66034 () (_ BitVec 32))

(declare-fun bm!66031 () Bool)

(assert (=> bm!66031 (= call!66034 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!360))))

(declare-fun b!1377935 () Bool)

(declare-fun e!780588 () (_ BitVec 32))

(assert (=> b!1377935 (= e!780588 (bvadd #b00000000000000000000000000000001 call!66034))))

(declare-fun d!148319 () Bool)

(declare-fun lt!606102 () (_ BitVec 32))

(assert (=> d!148319 (and (bvsge lt!606102 #b00000000000000000000000000000000) (bvsle lt!606102 (bvsub (size!45757 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(assert (=> d!148319 (= lt!606102 e!780587)))

(declare-fun c!128136 () Bool)

(assert (=> d!148319 (= c!128136 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) to!360))))

(assert (=> d!148319 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) to!360) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!360 (size!45757 a!4197)))))

(assert (=> d!148319 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) to!360) lt!606102)))

(declare-fun b!1377936 () Bool)

(assert (=> b!1377936 (= e!780587 e!780588)))

(declare-fun c!128137 () Bool)

(assert (=> b!1377936 (= c!128137 (validKeyInArray!0 (select (arr!45205 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun b!1377937 () Bool)

(assert (=> b!1377937 (= e!780588 call!66034)))

(assert (= (and d!148319 c!128136) b!1377934))

(assert (= (and d!148319 (not c!128136)) b!1377936))

(assert (= (and b!1377936 c!128137) b!1377935))

(assert (= (and b!1377936 (not c!128137)) b!1377937))

(assert (= (or b!1377935 b!1377937) bm!66031))

(declare-fun m!1261947 () Bool)

(assert (=> bm!66031 m!1261947))

(declare-fun m!1261949 () Bool)

(assert (=> b!1377936 m!1261949))

(assert (=> b!1377936 m!1261949))

(declare-fun m!1261951 () Bool)

(assert (=> b!1377936 m!1261951))

(assert (=> bm!66030 d!148319))

(assert (=> d!148311 d!148307))

(assert (=> d!148311 d!148305))

(assert (=> d!148311 d!148291))

(declare-fun d!148321 () Bool)

(assert (=> d!148321 (= (bvadd (arrayCountValidKeys!0 a!4197 from!3564 to!360) (arrayCountValidKeys!0 a!4197 to!360 (bvadd #b00000000000000000000000000000001 to!360))) (arrayCountValidKeys!0 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148321 true))

(declare-fun _$76!61 () Unit!45582)

(assert (=> d!148321 (= (choose!61 a!4197 from!3564 (bvadd #b00000000000000000000000000000001 to!360) to!360) _$76!61)))

(declare-fun bs!39610 () Bool)

(assert (= bs!39610 d!148321))

(assert (=> bs!39610 m!1261879))

(assert (=> bs!39610 m!1261877))

(assert (=> bs!39610 m!1261875))

(assert (=> d!148311 d!148321))

(assert (=> b!1377928 d!148315))

(declare-fun b!1377938 () Bool)

(declare-fun e!780589 () (_ BitVec 32))

(assert (=> b!1377938 (= e!780589 #b00000000000000000000000000000000)))

(declare-fun call!66035 () (_ BitVec 32))

(declare-fun bm!66032 () Bool)

(assert (=> bm!66032 (= call!66035 (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1377939 () Bool)

(declare-fun e!780590 () (_ BitVec 32))

(assert (=> b!1377939 (= e!780590 (bvadd #b00000000000000000000000000000001 call!66035))))

(declare-fun d!148323 () Bool)

(declare-fun lt!606103 () (_ BitVec 32))

(assert (=> d!148323 (and (bvsge lt!606103 #b00000000000000000000000000000000) (bvsle lt!606103 (bvsub (size!45757 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(assert (=> d!148323 (= lt!606103 e!780589)))

(declare-fun c!128138 () Bool)

(assert (=> d!148323 (= c!128138 (bvsge (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148323 (and (bvsle (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd from!3564 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45757 a!4197)))))

(assert (=> d!148323 (= (arrayCountValidKeys!0 a!4197 (bvadd from!3564 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606103)))

(declare-fun b!1377940 () Bool)

(assert (=> b!1377940 (= e!780589 e!780590)))

(declare-fun c!128139 () Bool)

(assert (=> b!1377940 (= c!128139 (validKeyInArray!0 (select (arr!45205 a!4197) (bvadd from!3564 #b00000000000000000000000000000001))))))

(declare-fun b!1377941 () Bool)

(assert (=> b!1377941 (= e!780590 call!66035)))

(assert (= (and d!148323 c!128138) b!1377938))

(assert (= (and d!148323 (not c!128138)) b!1377940))

(assert (= (and b!1377940 c!128139) b!1377939))

(assert (= (and b!1377940 (not c!128139)) b!1377941))

(assert (= (or b!1377939 b!1377941) bm!66032))

(declare-fun m!1261953 () Bool)

(assert (=> bm!66032 m!1261953))

(assert (=> b!1377940 m!1261949))

(assert (=> b!1377940 m!1261949))

(assert (=> b!1377940 m!1261951))

(assert (=> bm!66028 d!148323))

(assert (=> b!1377932 d!148317))

(declare-fun b!1377942 () Bool)

(declare-fun e!780591 () (_ BitVec 32))

(assert (=> b!1377942 (= e!780591 #b00000000000000000000000000000000)))

(declare-fun bm!66033 () Bool)

(declare-fun call!66036 () (_ BitVec 32))

(assert (=> bm!66033 (= call!66036 (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(declare-fun b!1377943 () Bool)

(declare-fun e!780592 () (_ BitVec 32))

(assert (=> b!1377943 (= e!780592 (bvadd #b00000000000000000000000000000001 call!66036))))

(declare-fun d!148325 () Bool)

(declare-fun lt!606104 () (_ BitVec 32))

(assert (=> d!148325 (and (bvsge lt!606104 #b00000000000000000000000000000000) (bvsle lt!606104 (bvsub (size!45757 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(assert (=> d!148325 (= lt!606104 e!780591)))

(declare-fun c!128140 () Bool)

(assert (=> d!148325 (= c!128140 (bvsge (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)))))

(assert (=> d!148325 (and (bvsle (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) (bvsge (bvadd to!360 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!360) (size!45757 a!4197)))))

(assert (=> d!148325 (= (arrayCountValidKeys!0 a!4197 (bvadd to!360 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!360)) lt!606104)))

(declare-fun b!1377944 () Bool)

(assert (=> b!1377944 (= e!780591 e!780592)))

(declare-fun c!128141 () Bool)

(assert (=> b!1377944 (= c!128141 (validKeyInArray!0 (select (arr!45205 a!4197) (bvadd to!360 #b00000000000000000000000000000001))))))

(declare-fun b!1377945 () Bool)

(assert (=> b!1377945 (= e!780592 call!66036)))

(assert (= (and d!148325 c!128140) b!1377942))

(assert (= (and d!148325 (not c!128140)) b!1377944))

(assert (= (and b!1377944 c!128141) b!1377943))

(assert (= (and b!1377944 (not c!128141)) b!1377945))

(assert (= (or b!1377943 b!1377945) bm!66033))

(declare-fun m!1261955 () Bool)

(assert (=> bm!66033 m!1261955))

(declare-fun m!1261957 () Bool)

(assert (=> b!1377944 m!1261957))

(assert (=> b!1377944 m!1261957))

(declare-fun m!1261959 () Bool)

(assert (=> b!1377944 m!1261959))

(assert (=> bm!66029 d!148325))

(check-sat (not bm!66031) (not b!1377940) (not bm!66032) (not b!1377936) (not bm!66033) (not b!1377944) (not d!148321))
(check-sat)
