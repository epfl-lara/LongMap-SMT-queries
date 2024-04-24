; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117720 () Bool)

(assert start!117720)

(declare-fun b!1381600 () Bool)

(declare-fun res!923055 () Bool)

(declare-fun e!782974 () Bool)

(assert (=> b!1381600 (=> (not res!923055) (not e!782974))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94155 0))(
  ( (array!94156 (arr!45467 (Array (_ BitVec 32) (_ BitVec 64))) (size!46018 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94155)

(declare-fun to!135 () (_ BitVec 32))

(declare-fun isPivot!0 (array!94155 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1381600 (= res!923055 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun call!66223 () (_ BitVec 32))

(declare-fun bm!66220 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94155 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66220 (= call!66223 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1381601 () Bool)

(assert (=> b!1381601 (= e!782974 (not (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34))))))

(declare-fun e!782975 () Bool)

(assert (=> b!1381601 e!782975))

(declare-fun c!128721 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381601 (= c!128721 (validKeyInArray!0 (select (arr!45467 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45898 0))(
  ( (Unit!45899) )
))
(declare-fun lt!608389 () Unit!45898)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94155 (_ BitVec 32) (_ BitVec 32)) Unit!45898)

(assert (=> b!1381601 (= lt!608389 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun bm!66221 () Bool)

(declare-fun call!66224 () (_ BitVec 32))

(assert (=> bm!66221 (= call!66224 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun res!923053 () Bool)

(assert (=> start!117720 (=> (not res!923053) (not e!782974))))

(assert (=> start!117720 (= res!923053 (and (bvslt (size!46018 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!46018 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117720 e!782974))

(declare-fun array_inv!34748 (array!94155) Bool)

(assert (=> start!117720 (array_inv!34748 a!3961)))

(assert (=> start!117720 true))

(declare-fun b!1381602 () Bool)

(assert (=> b!1381602 (= e!782975 (= call!66223 call!66224))))

(declare-fun b!1381603 () Bool)

(assert (=> b!1381603 (= e!782975 (= (bvadd #b00000000000000000000000000000001 call!66223) call!66224))))

(declare-fun b!1381604 () Bool)

(declare-fun res!923054 () Bool)

(assert (=> b!1381604 (=> (not res!923054) (not e!782974))))

(assert (=> b!1381604 (= res!923054 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!46018 a!3961)))))

(assert (= (and start!117720 res!923053) b!1381600))

(assert (= (and b!1381600 res!923055) b!1381604))

(assert (= (and b!1381604 res!923054) b!1381601))

(assert (= (and b!1381601 c!128721) b!1381603))

(assert (= (and b!1381601 (not c!128721)) b!1381602))

(assert (= (or b!1381603 b!1381602) bm!66220))

(assert (= (or b!1381603 b!1381602) bm!66221))

(declare-fun m!1267115 () Bool)

(assert (=> start!117720 m!1267115))

(declare-fun m!1267117 () Bool)

(assert (=> bm!66220 m!1267117))

(declare-fun m!1267119 () Bool)

(assert (=> bm!66221 m!1267119))

(declare-fun m!1267121 () Bool)

(assert (=> b!1381600 m!1267121))

(declare-fun m!1267123 () Bool)

(assert (=> b!1381601 m!1267123))

(declare-fun m!1267125 () Bool)

(assert (=> b!1381601 m!1267125))

(assert (=> b!1381601 m!1267125))

(declare-fun m!1267127 () Bool)

(assert (=> b!1381601 m!1267127))

(declare-fun m!1267129 () Bool)

(assert (=> b!1381601 m!1267129))

(push 1)

(assert (not bm!66220))

(assert (not b!1381601))

(assert (not b!1381600))

(assert (not bm!66221))

(assert (not start!117720))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149221 () Bool)

(assert (=> d!149221 (= (array_inv!34748 a!3961) (bvsge (size!46018 a!3961) #b00000000000000000000000000000000))))

(assert (=> start!117720 d!149221))

(declare-fun b!1381662 () Bool)

(declare-fun e!783011 () (_ BitVec 32))

(assert (=> b!1381662 (= e!783011 #b00000000000000000000000000000000)))

(declare-fun b!1381663 () Bool)

(declare-fun e!783010 () (_ BitVec 32))

(declare-fun call!66249 () (_ BitVec 32))

(assert (=> b!1381663 (= e!783010 (bvadd #b00000000000000000000000000000001 call!66249))))

(declare-fun b!1381664 () Bool)

(assert (=> b!1381664 (= e!783011 e!783010)))

(declare-fun c!128744 () Bool)

(assert (=> b!1381664 (= c!128744 (validKeyInArray!0 (select (arr!45467 a!3961) from!3339)))))

(declare-fun d!149223 () Bool)

(declare-fun lt!608411 () (_ BitVec 32))

(assert (=> d!149223 (and (bvsge lt!608411 #b00000000000000000000000000000000) (bvsle lt!608411 (bvsub (size!46018 a!3961) from!3339)))))

(assert (=> d!149223 (= lt!608411 e!783011)))

(declare-fun c!128743 () Bool)

(assert (=> d!149223 (= c!128743 (bvsge from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!149223 (and (bvsle from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!46018 a!3961)))))

(assert (=> d!149223 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!608411)))

(declare-fun b!1381665 () Bool)

(assert (=> b!1381665 (= e!783010 call!66249)))

(declare-fun bm!66246 () Bool)

(assert (=> bm!66246 (= call!66249 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (= (and d!149223 c!128743) b!1381662))

(assert (= (and d!149223 (not c!128743)) b!1381664))

(assert (= (and b!1381664 c!128744) b!1381663))

(assert (= (and b!1381664 (not c!128744)) b!1381665))

(assert (= (or b!1381663 b!1381665) bm!66246))

(declare-fun m!1267181 () Bool)

(assert (=> b!1381664 m!1267181))

(assert (=> b!1381664 m!1267181))

(declare-fun m!1267183 () Bool)

(assert (=> b!1381664 m!1267183))

(declare-fun m!1267185 () Bool)

(assert (=> bm!66246 m!1267185))

(assert (=> bm!66221 d!149223))

(declare-fun b!1381666 () Bool)

(declare-fun e!783013 () (_ BitVec 32))

(assert (=> b!1381666 (= e!783013 #b00000000000000000000000000000000)))

(declare-fun b!1381667 () Bool)

(declare-fun e!783012 () (_ BitVec 32))

(declare-fun call!66250 () (_ BitVec 32))

(assert (=> b!1381667 (= e!783012 (bvadd #b00000000000000000000000000000001 call!66250))))

(declare-fun b!1381668 () Bool)

(assert (=> b!1381668 (= e!783013 e!783012)))

(declare-fun c!128746 () Bool)

(assert (=> b!1381668 (= c!128746 (validKeyInArray!0 (select (arr!45467 a!3961) from!3339)))))

(declare-fun d!149233 () Bool)

(declare-fun lt!608412 () (_ BitVec 32))

(assert (=> d!149233 (and (bvsge lt!608412 #b00000000000000000000000000000000) (bvsle lt!608412 (bvsub (size!46018 a!3961) from!3339)))))

(assert (=> d!149233 (= lt!608412 e!783013)))

(declare-fun c!128745 () Bool)

(assert (=> d!149233 (= c!128745 (bvsge from!3339 pivot!34))))

(assert (=> d!149233 (and (bvsle from!3339 pivot!34) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle pivot!34 (size!46018 a!3961)))))

(assert (=> d!149233 (= (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) lt!608412)))

(declare-fun b!1381669 () Bool)

(assert (=> b!1381669 (= e!783012 call!66250)))

(declare-fun bm!66247 () Bool)

(assert (=> bm!66247 (= call!66250 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(assert (= (and d!149233 c!128745) b!1381666))

(assert (= (and d!149233 (not c!128745)) b!1381668))

(assert (= (and b!1381668 c!128746) b!1381667))

(assert (= (and b!1381668 (not c!128746)) b!1381669))

(assert (= (or b!1381667 b!1381669) bm!66247))

(assert (=> b!1381668 m!1267181))

(assert (=> b!1381668 m!1267181))

(assert (=> b!1381668 m!1267183))

(declare-fun m!1267187 () Bool)

(assert (=> bm!66247 m!1267187))

(assert (=> bm!66220 d!149233))

(declare-fun d!149235 () Bool)

(assert (=> d!149235 (= (isPivot!0 a!3961 from!3339 to!135 pivot!34) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) (arrayCountValidKeys!0 a!3961 pivot!34 to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39871 () Bool)

(assert (= bs!39871 d!149235))

(assert (=> bs!39871 m!1267117))

(declare-fun m!1267189 () Bool)

(assert (=> bs!39871 m!1267189))

(declare-fun m!1267191 () Bool)

(assert (=> bs!39871 m!1267191))

(assert (=> b!1381600 d!149235))

(declare-fun d!149237 () Bool)

(assert (=> d!149237 (= (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34)) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39872 () Bool)

(assert (= bs!39872 d!149237))

(assert (=> bs!39872 m!1267119))

(declare-fun m!1267193 () Bool)

(assert (=> bs!39872 m!1267193))

(assert (=> bs!39872 m!1267191))

(assert (=> b!1381601 d!149237))

(declare-fun d!149239 () Bool)

(assert (=> d!149239 (= (validKeyInArray!0 (select (arr!45467 a!3961) pivot!34)) (and (not (= (select (arr!45467 a!3961) pivot!34) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45467 a!3961) pivot!34) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381601 d!149239))

(declare-fun b!1381692 () Bool)

(declare-fun e!783026 () Bool)

(declare-fun call!66260 () (_ BitVec 32))

(declare-fun call!66259 () (_ BitVec 32))

(assert (=> b!1381692 (= e!783026 (= (bvadd call!66260 #b00000000000000000000000000000001) call!66259))))

(declare-fun bm!66256 () Bool)

(assert (=> bm!66256 (= call!66260 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun b!1381693 () Bool)

(declare-fun e!783027 () Bool)

(assert (=> b!1381693 (= e!783027 e!783026)))

(declare-fun c!128757 () Bool)

(assert (=> b!1381693 (= c!128757 (validKeyInArray!0 (select (arr!45467 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(declare-fun bm!66257 () Bool)

(assert (=> bm!66257 (= call!66259 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1381694 () Bool)

(assert (=> b!1381694 (= e!783026 (= call!66260 call!66259))))

(declare-fun d!149241 () Bool)

(assert (=> d!149241 e!783027))

(declare-fun res!923073 () Bool)

(assert (=> d!149241 (=> (not res!923073) (not e!783027))))

(declare-fun lt!608421 () (_ BitVec 32))

(assert (=> d!149241 (= res!923073 (and (bvsge lt!608421 #b00000000000000000000000000000000) (bvslt lt!608421 (size!46018 a!3961))))))

(assert (=> d!149241 (= lt!608421 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))

(declare-fun lt!608422 () Unit!45898)

(declare-fun choose!86 (array!94155 (_ BitVec 32) (_ BitVec 32)) Unit!45898)

(assert (=> d!149241 (= lt!608422 (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!149241 (and (bvslt (size!46018 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) from!3339) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!46018 a!3961)))))

(assert (=> d!149241 (= (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!608422)))

(assert (= (and d!149241 res!923073) b!1381693))

(assert (= (and b!1381693 c!128757) b!1381692))

(assert (= (and b!1381693 (not c!128757)) b!1381694))

(assert (= (or b!1381692 b!1381694) bm!66257))

(assert (= (or b!1381692 b!1381694) bm!66256))

(declare-fun m!1267205 () Bool)

(assert (=> bm!66256 m!1267205))

(declare-fun m!1267207 () Bool)

(assert (=> b!1381693 m!1267207))

(assert (=> b!1381693 m!1267207))

(declare-fun m!1267209 () Bool)

(assert (=> b!1381693 m!1267209))

(assert (=> bm!66257 m!1267119))

(declare-fun m!1267211 () Bool)

(assert (=> d!149241 m!1267211))

(assert (=> b!1381601 d!149241))

(push 1)

(assert (not d!149235))

(assert (not b!1381668))

(assert (not d!149241))

(assert (not bm!66247))

(assert (not d!149237))

(assert (not bm!66257))

(assert (not b!1381664))

(assert (not bm!66256))

(assert (not bm!66246))

(assert (not b!1381693))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1381755 () Bool)

(declare-fun e!783059 () (_ BitVec 32))

(assert (=> b!1381755 (= e!783059 #b00000000000000000000000000000000)))

(declare-fun b!1381756 () Bool)

(declare-fun e!783058 () (_ BitVec 32))

(declare-fun call!66285 () (_ BitVec 32))

(assert (=> b!1381756 (= e!783058 (bvadd #b00000000000000000000000000000001 call!66285))))

(declare-fun b!1381757 () Bool)

(assert (=> b!1381757 (= e!783059 e!783058)))

(declare-fun c!128789 () Bool)

(assert (=> b!1381757 (= c!128789 (validKeyInArray!0 (select (arr!45467 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun d!149283 () Bool)

(declare-fun lt!608435 () (_ BitVec 32))

(assert (=> d!149283 (and (bvsge lt!608435 #b00000000000000000000000000000000) (bvsle lt!608435 (bvsub (size!46018 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!149283 (= lt!608435 e!783059)))

(declare-fun c!128788 () Bool)

(assert (=> d!149283 (= c!128788 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(assert (=> d!149283 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle pivot!34 (size!46018 a!3961)))))

(assert (=> d!149283 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) lt!608435)))

(declare-fun b!1381758 () Bool)

(assert (=> b!1381758 (= e!783058 call!66285)))

(declare-fun bm!66282 () Bool)

(assert (=> bm!66282 (= call!66285 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) pivot!34))))

(assert (= (and d!149283 c!128788) b!1381755))

(assert (= (and d!149283 (not c!128788)) b!1381757))

(assert (= (and b!1381757 c!128789) b!1381756))

(assert (= (and b!1381757 (not c!128789)) b!1381758))

(assert (= (or b!1381756 b!1381758) bm!66282))

(declare-fun m!1267253 () Bool)

(assert (=> b!1381757 m!1267253))

(assert (=> b!1381757 m!1267253))

(declare-fun m!1267255 () Bool)

(assert (=> b!1381757 m!1267255))

(declare-fun m!1267257 () Bool)

(assert (=> bm!66282 m!1267257))

(assert (=> bm!66247 d!149283))

(declare-fun b!1381759 () Bool)

(declare-fun e!783061 () (_ BitVec 32))

(assert (=> b!1381759 (= e!783061 #b00000000000000000000000000000000)))

(declare-fun b!1381760 () Bool)

(declare-fun e!783060 () (_ BitVec 32))

(declare-fun call!66286 () (_ BitVec 32))

(assert (=> b!1381760 (= e!783060 (bvadd #b00000000000000000000000000000001 call!66286))))

(declare-fun b!1381761 () Bool)

(assert (=> b!1381761 (= e!783061 e!783060)))

(declare-fun c!128791 () Bool)

(assert (=> b!1381761 (= c!128791 (validKeyInArray!0 (select (arr!45467 a!3961) from!3339)))))

(declare-fun d!149285 () Bool)

(declare-fun lt!608436 () (_ BitVec 32))

(assert (=> d!149285 (and (bvsge lt!608436 #b00000000000000000000000000000000) (bvsle lt!608436 (bvsub (size!46018 a!3961) from!3339)))))

(assert (=> d!149285 (= lt!608436 e!783061)))

(declare-fun c!128790 () Bool)

(assert (=> d!149285 (= c!128790 (bvsge from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (=> d!149285 (and (bvsle from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001) (size!46018 a!3961)))))

(assert (=> d!149285 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) lt!608436)))

(declare-fun b!1381762 () Bool)

(assert (=> b!1381762 (= e!783060 call!66286)))

(declare-fun bm!66283 () Bool)

(assert (=> bm!66283 (= call!66286 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (= (and d!149285 c!128790) b!1381759))

(assert (= (and d!149285 (not c!128790)) b!1381761))

(assert (= (and b!1381761 c!128791) b!1381760))

(assert (= (and b!1381761 (not c!128791)) b!1381762))

(assert (= (or b!1381760 b!1381762) bm!66283))

(assert (=> b!1381761 m!1267181))

(assert (=> b!1381761 m!1267181))

(assert (=> b!1381761 m!1267183))

(declare-fun m!1267259 () Bool)

(assert (=> bm!66283 m!1267259))

(assert (=> bm!66256 d!149285))

(assert (=> d!149237 d!149223))

(declare-fun b!1381763 () Bool)

(declare-fun e!783063 () (_ BitVec 32))

(assert (=> b!1381763 (= e!783063 #b00000000000000000000000000000000)))

(declare-fun b!1381764 () Bool)

(declare-fun e!783062 () (_ BitVec 32))

(declare-fun call!66287 () (_ BitVec 32))

(assert (=> b!1381764 (= e!783062 (bvadd #b00000000000000000000000000000001 call!66287))))

(declare-fun b!1381765 () Bool)

(assert (=> b!1381765 (= e!783063 e!783062)))

(declare-fun c!128793 () Bool)

(assert (=> b!1381765 (= c!128793 (validKeyInArray!0 (select (arr!45467 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(declare-fun d!149287 () Bool)

(declare-fun lt!608437 () (_ BitVec 32))

(assert (=> d!149287 (and (bvsge lt!608437 #b00000000000000000000000000000000) (bvsle lt!608437 (bvsub (size!46018 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> d!149287 (= lt!608437 e!783063)))

(declare-fun c!128792 () Bool)

(assert (=> d!149287 (= c!128792 (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) to!135))))

(assert (=> d!149287 (and (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) to!135) (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000000) (bvsle to!135 (size!46018 a!3961)))))

(assert (=> d!149287 (= (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135) lt!608437)))

(declare-fun b!1381766 () Bool)

(assert (=> b!1381766 (= e!783062 call!66287)))

(declare-fun bm!66284 () Bool)

(assert (=> bm!66284 (= call!66287 (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34 #b00000000000000000000000000000001) to!135))))

(assert (= (and d!149287 c!128792) b!1381763))

(assert (= (and d!149287 (not c!128792)) b!1381765))

(assert (= (and b!1381765 c!128793) b!1381764))

(assert (= (and b!1381765 (not c!128793)) b!1381766))

(assert (= (or b!1381764 b!1381766) bm!66284))

(declare-fun m!1267261 () Bool)

(assert (=> b!1381765 m!1267261))

(assert (=> b!1381765 m!1267261))

(declare-fun m!1267263 () Bool)

(assert (=> b!1381765 m!1267263))

(declare-fun m!1267265 () Bool)

(assert (=> bm!66284 m!1267265))

(assert (=> d!149237 d!149287))

(declare-fun b!1381767 () Bool)

(declare-fun e!783065 () (_ BitVec 32))

(assert (=> b!1381767 (= e!783065 #b00000000000000000000000000000000)))

(declare-fun b!1381768 () Bool)

(declare-fun e!783064 () (_ BitVec 32))

(declare-fun call!66288 () (_ BitVec 32))

(assert (=> b!1381768 (= e!783064 (bvadd #b00000000000000000000000000000001 call!66288))))

(declare-fun b!1381769 () Bool)

(assert (=> b!1381769 (= e!783065 e!783064)))

(declare-fun c!128795 () Bool)

(assert (=> b!1381769 (= c!128795 (validKeyInArray!0 (select (arr!45467 a!3961) from!3339)))))

(declare-fun d!149289 () Bool)

(declare-fun lt!608438 () (_ BitVec 32))

(assert (=> d!149289 (and (bvsge lt!608438 #b00000000000000000000000000000000) (bvsle lt!608438 (bvsub (size!46018 a!3961) from!3339)))))

(assert (=> d!149289 (= lt!608438 e!783065)))

(declare-fun c!128794 () Bool)

(assert (=> d!149289 (= c!128794 (bvsge from!3339 to!135))))

(assert (=> d!149289 (and (bvsle from!3339 to!135) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle to!135 (size!46018 a!3961)))))

(assert (=> d!149289 (= (arrayCountValidKeys!0 a!3961 from!3339 to!135) lt!608438)))

(declare-fun b!1381770 () Bool)

(assert (=> b!1381770 (= e!783064 call!66288)))

(declare-fun bm!66285 () Bool)

(assert (=> bm!66285 (= call!66288 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) to!135))))

(assert (= (and d!149289 c!128794) b!1381767))

(assert (= (and d!149289 (not c!128794)) b!1381769))

(assert (= (and b!1381769 c!128795) b!1381768))

(assert (= (and b!1381769 (not c!128795)) b!1381770))

(assert (= (or b!1381768 b!1381770) bm!66285))

(assert (=> b!1381769 m!1267181))

(assert (=> b!1381769 m!1267181))

(assert (=> b!1381769 m!1267183))

(declare-fun m!1267267 () Bool)

(assert (=> bm!66285 m!1267267))

(assert (=> d!149237 d!149289))

(declare-fun d!149291 () Bool)

(assert (=> d!149291 (= (validKeyInArray!0 (select (arr!45467 a!3961) from!3339)) (and (not (= (select (arr!45467 a!3961) from!3339) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45467 a!3961) from!3339) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381664 d!149291))

(declare-fun d!149293 () Bool)

(assert (=> d!149293 (= (validKeyInArray!0 (select (arr!45467 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))) (and (not (= (select (arr!45467 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45467 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381693 d!149293))

(declare-fun call!66293 () (_ BitVec 32))

(declare-fun bm!66290 () Bool)

(assert (=> bm!66290 (= call!66293 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun d!149295 () Bool)

(declare-fun e!783068 () Bool)

(assert (=> d!149295 e!783068))

(declare-fun c!128798 () Bool)

(assert (=> d!149295 (= c!128798 (validKeyInArray!0 (select (arr!45467 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(assert (=> d!149295 true))

(declare-fun _$73!20 () Unit!45898)

(assert (=> d!149295 (= (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) _$73!20)))

(declare-fun bm!66291 () Bool)

(declare-fun call!66294 () (_ BitVec 32))

(assert (=> bm!66291 (= call!66294 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1381776 () Bool)

(assert (=> b!1381776 (= e!783068 (= call!66293 call!66294))))

(declare-fun b!1381775 () Bool)

(assert (=> b!1381775 (= e!783068 (= (bvadd call!66293 #b00000000000000000000000000000001) call!66294))))

(assert (= (and d!149295 c!128798) b!1381775))

(assert (= (and d!149295 (not c!128798)) b!1381776))

(assert (= (or b!1381775 b!1381776) bm!66290))

(assert (= (or b!1381775 b!1381776) bm!66291))

(assert (=> bm!66290 m!1267205))

(assert (=> d!149295 m!1267207))

(assert (=> d!149295 m!1267207))

(assert (=> d!149295 m!1267209))

(assert (=> bm!66291 m!1267119))

(assert (=> d!149241 d!149295))

(declare-fun b!1381777 () Bool)

(declare-fun e!783070 () (_ BitVec 32))

(assert (=> b!1381777 (= e!783070 #b00000000000000000000000000000000)))

(declare-fun b!1381778 () Bool)

(declare-fun e!783069 () (_ BitVec 32))

(declare-fun call!66295 () (_ BitVec 32))

(assert (=> b!1381778 (= e!783069 (bvadd #b00000000000000000000000000000001 call!66295))))

(declare-fun b!1381779 () Bool)

(assert (=> b!1381779 (= e!783070 e!783069)))

(declare-fun c!128800 () Bool)

(assert (=> b!1381779 (= c!128800 (validKeyInArray!0 (select (arr!45467 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun d!149297 () Bool)

(declare-fun lt!608439 () (_ BitVec 32))

(assert (=> d!149297 (and (bvsge lt!608439 #b00000000000000000000000000000000) (bvsle lt!608439 (bvsub (size!46018 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!149297 (= lt!608439 e!783070)))

(declare-fun c!128799 () Bool)

(assert (=> d!149297 (= c!128799 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!149297 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!46018 a!3961)))))

(assert (=> d!149297 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) lt!608439)))

(declare-fun b!1381780 () Bool)

(assert (=> b!1381780 (= e!783069 call!66295)))

(declare-fun bm!66292 () Bool)

(assert (=> bm!66292 (= call!66295 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (= (and d!149297 c!128799) b!1381777))

(assert (= (and d!149297 (not c!128799)) b!1381779))

(assert (= (and b!1381779 c!128800) b!1381778))

(assert (= (and b!1381779 (not c!128800)) b!1381780))

(assert (= (or b!1381778 b!1381780) bm!66292))

(assert (=> b!1381779 m!1267253))

(assert (=> b!1381779 m!1267253))

(assert (=> b!1381779 m!1267255))

(declare-fun m!1267269 () Bool)

(assert (=> bm!66292 m!1267269))

(assert (=> bm!66246 d!149297))

(assert (=> bm!66257 d!149223))

(assert (=> d!149235 d!149233))

(declare-fun b!1381781 () Bool)

(declare-fun e!783072 () (_ BitVec 32))

(assert (=> b!1381781 (= e!783072 #b00000000000000000000000000000000)))

(declare-fun b!1381782 () Bool)

(declare-fun e!783071 () (_ BitVec 32))

(declare-fun call!66296 () (_ BitVec 32))

(assert (=> b!1381782 (= e!783071 (bvadd #b00000000000000000000000000000001 call!66296))))

(declare-fun b!1381783 () Bool)

(assert (=> b!1381783 (= e!783072 e!783071)))

(declare-fun c!128802 () Bool)

(assert (=> b!1381783 (= c!128802 (validKeyInArray!0 (select (arr!45467 a!3961) pivot!34)))))

(declare-fun d!149299 () Bool)

(declare-fun lt!608440 () (_ BitVec 32))

(assert (=> d!149299 (and (bvsge lt!608440 #b00000000000000000000000000000000) (bvsle lt!608440 (bvsub (size!46018 a!3961) pivot!34)))))

(assert (=> d!149299 (= lt!608440 e!783072)))

(declare-fun c!128801 () Bool)

(assert (=> d!149299 (= c!128801 (bvsge pivot!34 to!135))))

(assert (=> d!149299 (and (bvsle pivot!34 to!135) (bvsge pivot!34 #b00000000000000000000000000000000) (bvsle to!135 (size!46018 a!3961)))))

(assert (=> d!149299 (= (arrayCountValidKeys!0 a!3961 pivot!34 to!135) lt!608440)))

(declare-fun b!1381784 () Bool)

(assert (=> b!1381784 (= e!783071 call!66296)))

(declare-fun bm!66293 () Bool)

(assert (=> bm!66293 (= call!66296 (arrayCountValidKeys!0 a!3961 (bvadd pivot!34 #b00000000000000000000000000000001) to!135))))

(assert (= (and d!149299 c!128801) b!1381781))

(assert (= (and d!149299 (not c!128801)) b!1381783))

(assert (= (and b!1381783 c!128802) b!1381782))

(assert (= (and b!1381783 (not c!128802)) b!1381784))

(assert (= (or b!1381782 b!1381784) bm!66293))

(assert (=> b!1381783 m!1267125))

(assert (=> b!1381783 m!1267125))

(assert (=> b!1381783 m!1267127))

(declare-fun m!1267271 () Bool)

(assert (=> bm!66293 m!1267271))

(assert (=> d!149235 d!149299))

(assert (=> d!149235 d!149289))

(assert (=> b!1381668 d!149291))

(push 1)

(assert (not b!1381757))

(assert (not b!1381769))

(assert (not b!1381765))

(assert (not bm!66282))

(assert (not b!1381779))

(assert (not d!149295))

(assert (not bm!66285))

(assert (not bm!66293))

(assert (not bm!66283))

(assert (not bm!66290))

(assert (not bm!66284))

(assert (not b!1381783))

(assert (not bm!66291))

(assert (not b!1381761))

(assert (not bm!66292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

