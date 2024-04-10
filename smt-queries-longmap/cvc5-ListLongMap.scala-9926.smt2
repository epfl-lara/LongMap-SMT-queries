; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117324 () Bool)

(assert start!117324)

(declare-fun res!922186 () Bool)

(declare-fun e!781687 () Bool)

(assert (=> start!117324 (=> (not res!922186) (not e!781687))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93920 0))(
  ( (array!93921 (arr!45359 (Array (_ BitVec 32) (_ BitVec 64))) (size!45909 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93920)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117324 (= res!922186 (and (bvslt (size!45909 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45909 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117324 e!781687))

(declare-fun array_inv!34387 (array!93920) Bool)

(assert (=> start!117324 (array_inv!34387 a!4010)))

(assert (=> start!117324 true))

(declare-fun b!1379748 () Bool)

(declare-fun isPivot!0 (array!93920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379748 (= e!781687 (not (isPivot!0 a!4010 from!3388 to!184 from!3388)))))

(assert (= (and start!117324 res!922186) b!1379748))

(declare-fun m!1264965 () Bool)

(assert (=> start!117324 m!1264965))

(declare-fun m!1264967 () Bool)

(assert (=> b!1379748 m!1264967))

(push 1)

(assert (not b!1379748))

(assert (not start!117324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148623 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93920 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!148623 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39783 () Bool)

(assert (= bs!39783 d!148623))

(declare-fun m!1264981 () Bool)

(assert (=> bs!39783 m!1264981))

(declare-fun m!1264983 () Bool)

(assert (=> bs!39783 m!1264983))

(assert (=> bs!39783 m!1264983))

(assert (=> b!1379748 d!148623))

(declare-fun d!148629 () Bool)

(assert (=> d!148629 (= (array_inv!34387 a!4010) (bvsge (size!45909 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117324 d!148629))

(push 1)

(assert (not d!148623))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1379795 () Bool)

(declare-fun e!781722 () (_ BitVec 32))

(declare-fun call!66096 () (_ BitVec 32))

(assert (=> b!1379795 (= e!781722 call!66096)))

(declare-fun bm!66093 () Bool)

(assert (=> bm!66093 (= call!66096 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) from!3388))))

(declare-fun b!1379796 () Bool)

(declare-fun e!781721 () (_ BitVec 32))

(assert (=> b!1379796 (= e!781721 #b00000000000000000000000000000000)))

(declare-fun b!1379797 () Bool)

(assert (=> b!1379797 (= e!781722 (bvadd #b00000000000000000000000000000001 call!66096))))

(declare-fun b!1379798 () Bool)

(assert (=> b!1379798 (= e!781721 e!781722)))

(declare-fun c!128241 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379798 (= c!128241 (validKeyInArray!0 (select (arr!45359 a!4010) from!3388)))))

(declare-fun d!148637 () Bool)

(declare-fun lt!607754 () (_ BitVec 32))

(assert (=> d!148637 (and (bvsge lt!607754 #b00000000000000000000000000000000) (bvsle lt!607754 (bvsub (size!45909 a!4010) from!3388)))))

(assert (=> d!148637 (= lt!607754 e!781721)))

(declare-fun c!128242 () Bool)

(assert (=> d!148637 (= c!128242 (bvsge from!3388 from!3388))))

(assert (=> d!148637 (and (bvsle from!3388 from!3388) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle from!3388 (size!45909 a!4010)))))

(assert (=> d!148637 (= (arrayCountValidKeys!0 a!4010 from!3388 from!3388) lt!607754)))

(assert (= (and d!148637 c!128242) b!1379796))

(assert (= (and d!148637 (not c!128242)) b!1379798))

(assert (= (and b!1379798 c!128241) b!1379797))

(assert (= (and b!1379798 (not c!128241)) b!1379795))

(assert (= (or b!1379797 b!1379795) bm!66093))

(declare-fun m!1265005 () Bool)

(assert (=> bm!66093 m!1265005))

(declare-fun m!1265007 () Bool)

(assert (=> b!1379798 m!1265007))

(assert (=> b!1379798 m!1265007))

(declare-fun m!1265009 () Bool)

(assert (=> b!1379798 m!1265009))

(assert (=> d!148623 d!148637))

(declare-fun b!1379799 () Bool)

(declare-fun e!781724 () (_ BitVec 32))

(declare-fun call!66097 () (_ BitVec 32))

(assert (=> b!1379799 (= e!781724 call!66097)))

(declare-fun bm!66094 () Bool)

(assert (=> bm!66094 (= call!66097 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379800 () Bool)

(declare-fun e!781723 () (_ BitVec 32))

(assert (=> b!1379800 (= e!781723 #b00000000000000000000000000000000)))

(declare-fun b!1379801 () Bool)

(assert (=> b!1379801 (= e!781724 (bvadd #b00000000000000000000000000000001 call!66097))))

(declare-fun b!1379802 () Bool)

(assert (=> b!1379802 (= e!781723 e!781724)))

