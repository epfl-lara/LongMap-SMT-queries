; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117320 () Bool)

(assert start!117320)

(declare-fun res!922160 () Bool)

(declare-fun e!781656 () Bool)

(assert (=> start!117320 (=> (not res!922160) (not e!781656))))

(declare-fun from!3388 () (_ BitVec 32))

(declare-datatypes ((array!93870 0))(
  ( (array!93871 (arr!45334 (Array (_ BitVec 32) (_ BitVec 64))) (size!45886 (_ BitVec 32))) )
))
(declare-fun a!4010 () array!93870)

(declare-fun to!184 () (_ BitVec 32))

(declare-fun pivot!64 () (_ BitVec 32))

(assert (=> start!117320 (= res!922160 (and (bvslt (size!45886 a!4010) #b01111111111111111111111111111111) (bvsge from!3388 #b00000000000000000000000000000000) (bvsge to!184 from!3388) (bvsle to!184 (size!45886 a!4010)) (bvsge pivot!64 from!3388) (bvsle pivot!64 to!184) (bvslt pivot!64 to!184)))))

(assert (=> start!117320 e!781656))

(declare-fun array_inv!34567 (array!93870) Bool)

(assert (=> start!117320 (array_inv!34567 a!4010)))

(assert (=> start!117320 true))

(declare-fun b!1379679 () Bool)

(declare-fun isPivot!0 (array!93870 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379679 (= e!781656 (not (isPivot!0 a!4010 from!3388 to!184 from!3388)))))

(assert (= (and start!117320 res!922160) b!1379679))

(declare-fun m!1264461 () Bool)

(assert (=> start!117320 m!1264461))

(declare-fun m!1264463 () Bool)

(assert (=> b!1379679 m!1264463))

(check-sat (not b!1379679) (not start!117320))
(check-sat)
(get-model)

(declare-fun d!148499 () Bool)

(declare-fun arrayCountValidKeys!0 (array!93870 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!148499 (= (isPivot!0 a!4010 from!3388 to!184 from!3388) (= (bvadd (arrayCountValidKeys!0 a!4010 from!3388 from!3388) (arrayCountValidKeys!0 a!4010 from!3388 to!184)) (arrayCountValidKeys!0 a!4010 from!3388 to!184)))))

(declare-fun bs!39754 () Bool)

(assert (= bs!39754 d!148499))

(declare-fun m!1264473 () Bool)

(assert (=> bs!39754 m!1264473))

(declare-fun m!1264475 () Bool)

(assert (=> bs!39754 m!1264475))

(assert (=> bs!39754 m!1264475))

(assert (=> b!1379679 d!148499))

(declare-fun d!148501 () Bool)

(assert (=> d!148501 (= (array_inv!34567 a!4010) (bvsge (size!45886 a!4010) #b00000000000000000000000000000000))))

(assert (=> start!117320 d!148501))

(check-sat (not d!148499))
(check-sat)
(get-model)

(declare-fun b!1379694 () Bool)

(declare-fun e!781675 () (_ BitVec 32))

(assert (=> b!1379694 (= e!781675 #b00000000000000000000000000000000)))

(declare-fun b!1379695 () Bool)

(declare-fun e!781674 () (_ BitVec 32))

(declare-fun call!66069 () (_ BitVec 32))

(assert (=> b!1379695 (= e!781674 (bvadd #b00000000000000000000000000000001 call!66069))))

(declare-fun b!1379697 () Bool)

(assert (=> b!1379697 (= e!781674 call!66069)))

(declare-fun bm!66066 () Bool)

(assert (=> bm!66066 (= call!66069 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) from!3388))))

(declare-fun b!1379696 () Bool)

(assert (=> b!1379696 (= e!781675 e!781674)))

(declare-fun c!128206 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379696 (= c!128206 (validKeyInArray!0 (select (arr!45334 a!4010) from!3388)))))

(declare-fun d!148511 () Bool)

(declare-fun lt!607562 () (_ BitVec 32))

(assert (=> d!148511 (and (bvsge lt!607562 #b00000000000000000000000000000000) (bvsle lt!607562 (bvsub (size!45886 a!4010) from!3388)))))

(assert (=> d!148511 (= lt!607562 e!781675)))

(declare-fun c!128207 () Bool)

(assert (=> d!148511 (= c!128207 (bvsge from!3388 from!3388))))

(assert (=> d!148511 (and (bvsle from!3388 from!3388) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle from!3388 (size!45886 a!4010)))))

(assert (=> d!148511 (= (arrayCountValidKeys!0 a!4010 from!3388 from!3388) lt!607562)))

(assert (= (and d!148511 c!128207) b!1379694))

(assert (= (and d!148511 (not c!128207)) b!1379696))

(assert (= (and b!1379696 c!128206) b!1379695))

(assert (= (and b!1379696 (not c!128206)) b!1379697))

(assert (= (or b!1379695 b!1379697) bm!66066))

(declare-fun m!1264485 () Bool)

(assert (=> bm!66066 m!1264485))

(declare-fun m!1264487 () Bool)

(assert (=> b!1379696 m!1264487))

(assert (=> b!1379696 m!1264487))

(declare-fun m!1264489 () Bool)

(assert (=> b!1379696 m!1264489))

(assert (=> d!148499 d!148511))

(declare-fun b!1379698 () Bool)

(declare-fun e!781677 () (_ BitVec 32))

(assert (=> b!1379698 (= e!781677 #b00000000000000000000000000000000)))

(declare-fun b!1379699 () Bool)

(declare-fun e!781676 () (_ BitVec 32))

(declare-fun call!66070 () (_ BitVec 32))

(assert (=> b!1379699 (= e!781676 (bvadd #b00000000000000000000000000000001 call!66070))))

(declare-fun b!1379701 () Bool)

(assert (=> b!1379701 (= e!781676 call!66070)))

(declare-fun bm!66067 () Bool)

(assert (=> bm!66067 (= call!66070 (arrayCountValidKeys!0 a!4010 (bvadd from!3388 #b00000000000000000000000000000001) to!184))))

(declare-fun b!1379700 () Bool)

(assert (=> b!1379700 (= e!781677 e!781676)))

(declare-fun c!128208 () Bool)

(assert (=> b!1379700 (= c!128208 (validKeyInArray!0 (select (arr!45334 a!4010) from!3388)))))

(declare-fun d!148515 () Bool)

(declare-fun lt!607563 () (_ BitVec 32))

(assert (=> d!148515 (and (bvsge lt!607563 #b00000000000000000000000000000000) (bvsle lt!607563 (bvsub (size!45886 a!4010) from!3388)))))

(assert (=> d!148515 (= lt!607563 e!781677)))

(declare-fun c!128209 () Bool)

(assert (=> d!148515 (= c!128209 (bvsge from!3388 to!184))))

(assert (=> d!148515 (and (bvsle from!3388 to!184) (bvsge from!3388 #b00000000000000000000000000000000) (bvsle to!184 (size!45886 a!4010)))))

(assert (=> d!148515 (= (arrayCountValidKeys!0 a!4010 from!3388 to!184) lt!607563)))

(assert (= (and d!148515 c!128209) b!1379698))

(assert (= (and d!148515 (not c!128209)) b!1379700))

(assert (= (and b!1379700 c!128208) b!1379699))

(assert (= (and b!1379700 (not c!128208)) b!1379701))

(assert (= (or b!1379699 b!1379701) bm!66067))

(declare-fun m!1264491 () Bool)

(assert (=> bm!66067 m!1264491))

(assert (=> b!1379700 m!1264487))

(assert (=> b!1379700 m!1264487))

(assert (=> b!1379700 m!1264489))

(assert (=> d!148499 d!148515))

(check-sat (not b!1379696) (not bm!66067) (not b!1379700) (not bm!66066))
(check-sat)
