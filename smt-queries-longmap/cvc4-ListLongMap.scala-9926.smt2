; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117328 () Bool)

(assert start!117328)

(declare-fun res!922192 () Bool)

(declare-fun e!781699 () Bool)

(assert (=> start!117328 (=> (not res!922192) (not e!781699))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93924 0))(
  ( (array!93925 (arr!45361 (Array (_ BitVec 32) (_ BitVec 64))) (size!45911 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93924)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117328 (= res!922192 (and (bvslt (size!45911 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45911 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117328 e!781699))

(declare-fun array_inv!34389 (array!93924) Bool)

(assert (=> start!117328 (array_inv!34389 a!4010)))

(assert (=> start!117328 true))

(declare-fun b!1379754 () Bool)

(declare-fun isPivot!0 (array!93924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379754 (= e!781699 (not (isPivot!0 a!4010 from!3388 to!184 from!3388)))))

(assert (= (and start!117328 res!922192) b!1379754))

(declare-fun m!1264973 () Bool)

(assert (=> start!117328 m!1264973))

(declare-fun m!1264975 () Bool)

(assert (=> b!1379754 m!1264975))

(push 1)

(assert (not start!117328))

(assert (not b!1379754))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148625 () Bool)

(assert (=> d!148625 (= (array_inv!34389 a!4010) (bvsge (size!45911 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117328 d!148625))

(declare-fun d!148627 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93924 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!148627 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39784 () Bool)

(assert (= bs!39784 d!148627))

(declare-fun m!1264985 () Bool)

(assert (=> bs!39784 m!1264985))

(declare-fun m!1264987 () Bool)

(assert (=> bs!39784 m!1264987))

(assert (=> bs!39784 m!1264987))

(assert (=> b!1379754 d!148627))

(push 1)

(assert (not d!148627))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!66091 () Bool)

(declare-fun call!66094 () (_ BitVec 32))

(assert (=> bm!66091 (= call!66094 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) from!3388))))

(declare-fun b!1379787 () Bool)

(declare-fun e!781718 () (_ BitVec 32))

(declare-fun e!781717 () (_ BitVec 32))

(assert (=> b!1379787 (= e!781718 e!781717)))

(declare-fun c!128237 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379787 (= c!128237 (validKeyInArray!0 (select (arr!45361 a!4010) from!3388)))))

(declare-fun b!1379788 () Bool)

(assert (=> b!1379788 (= e!781718 #b00000000000000000000000000000000)))

(declare-fun b!1379790 () Bool)

(assert (=> b!1379790 (= e!781717 call!66094)))

(declare-fun b!1379789 () Bool)

(assert (=> b!1379789 (= e!781717 (bvadd #b00000000000000000000000000000001 call!66094))))

(declare-fun d!148633 () Bool)

(declare-fun lt!607752 () (_ BitVec 32))

(assert (=> d!148633 (and (bvsge lt!607752 #b00000000000000000000000000000000) (bvsle lt!607752 (bvsub (size!45911 a!4010) from!3388)))))

(assert (=> d!148633 (= lt!607752 e!781718)))

(declare-fun c!128238 () Bool)

(assert (=> d!148633 (= c!128238 (bvsge from!3388 from!3388))))

(assert (=> d!148633 (and (bvsle from!3388 from!3388) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle from!3388 (size!45911 a!4010)))))

(assert (=> d!148633 (= (arrayCountValidKeys!0 a!4010 from!3388 from!3388) lt!607752)))

(assert (= (and d!148633 c!128238) b!1379788))

(assert (= (and d!148633 (not c!128238)) b!1379787))

(assert (= (and b!1379787 c!128237) b!1379789))

(assert (= (and b!1379787 (not c!128237)) b!1379790))

(assert (= (or b!1379789 b!1379790) bm!66091))

(declare-fun m!1264997 () Bool)

(assert (=> bm!66091 m!1264997))

(declare-fun m!1264999 () Bool)

(assert (=> b!1379787 m!1264999))

(assert (=> b!1379787 m!1264999))

(declare-fun m!1265001 () Bool)

(assert (=> b!1379787 m!1265001))

(assert (=> d!148627 d!148633))

(declare-fun call!66095 () (_ BitVec 32))

(declare-fun bm!66092 () Bool)

(assert (=> bm!66092 (= call!66095 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379791 () Bool)

(declare-fun e!781720 () (_ BitVec 32))

(declare-fun e!781719 () (_ BitVec 32))

(assert (=> b!1379791 (= e!781720 e!781719)))

(declare-fun c!128239 () Bool)

(assert (=> b!1379791 (= c!128239 (validKeyInArray!0 (select (arr!45361 a!4010) from!3388)))))

(declare-fun b!1379792 () Bool)

(assert (=> b!1379792 (= e!781720 #b00000000000000000000000000000000)))

(declare-fun b!1379794 () Bool)

(assert (=> b!1379794 (= e!781719 call!66095)))

