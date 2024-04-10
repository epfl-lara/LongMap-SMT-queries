; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117486 () Bool)

(assert start!117486)

(declare-fun res!922524 () Bool)

(declare-fun e!782116 () Bool)

(assert (=> start!117486 (=> (not res!922524) (not e!782116))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94037 0))(
  ( (array!94038 (arr!45413 (Array (_ BitVec 32) (_ BitVec 64))) (size!45963 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94037)

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117486 (= res!922524 (and (bvslt (size!45963 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45963 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117486 e!782116))

(declare-fun array_inv!34441 (array!94037) Bool)

(assert (=> start!117486 (array_inv!34441 a!3961)))

(assert (=> start!117486 true))

(declare-fun b!1380275 () Bool)

(declare-fun isPivot!0 (array!94037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380275 (= e!782116 (not (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34))))))

(declare-fun e!782115 () Bool)

(assert (=> b!1380275 e!782115))

(declare-fun c!128316 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380275 (= c!128316 (validKeyInArray!0 (select (arr!45413 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45957 0))(
  ( (Unit!45958) )
))
(declare-fun lt!607905 () Unit!45957)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94037 (_ BitVec 32) (_ BitVec 32)) Unit!45957)

(assert (=> b!1380275 (= lt!607905 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380276 () Bool)

(declare-fun call!66150 () (_ BitVec 32))

(declare-fun call!66151 () (_ BitVec 32))

(assert (=> b!1380276 (= e!782115 (= call!66150 call!66151))))

(declare-fun b!1380277 () Bool)

(declare-fun res!922525 () Bool)

(assert (=> b!1380277 (=> (not res!922525) (not e!782116))))

(assert (=> b!1380277 (= res!922525 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45963 a!3961)))))

(declare-fun bm!66147 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94037 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66147 (= call!66151 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380278 () Bool)

(assert (=> b!1380278 (= e!782115 (= (bvadd #b00000000000000000000000000000001 call!66150) call!66151))))

(declare-fun bm!66148 () Bool)

(assert (=> bm!66148 (= call!66150 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun b!1380279 () Bool)

(declare-fun res!922523 () Bool)

(assert (=> b!1380279 (=> (not res!922523) (not e!782116))))

(assert (=> b!1380279 (= res!922523 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(assert (= (and start!117486 res!922524) b!1380279))

(assert (= (and b!1380279 res!922523) b!1380277))

(assert (= (and b!1380277 res!922525) b!1380275))

(assert (= (and b!1380275 c!128316) b!1380278))

(assert (= (and b!1380275 (not c!128316)) b!1380276))

(assert (= (or b!1380278 b!1380276) bm!66148))

(assert (= (or b!1380278 b!1380276) bm!66147))

(declare-fun m!1265463 () Bool)

(assert (=> bm!66148 m!1265463))

(declare-fun m!1265465 () Bool)

(assert (=> bm!66147 m!1265465))

(declare-fun m!1265467 () Bool)

(assert (=> b!1380279 m!1265467))

(declare-fun m!1265469 () Bool)

(assert (=> start!117486 m!1265469))

(declare-fun m!1265471 () Bool)

(assert (=> b!1380275 m!1265471))

(declare-fun m!1265473 () Bool)

(assert (=> b!1380275 m!1265473))

(assert (=> b!1380275 m!1265473))

(declare-fun m!1265475 () Bool)

(assert (=> b!1380275 m!1265475))

(declare-fun m!1265477 () Bool)

(assert (=> b!1380275 m!1265477))

(push 1)

(assert (not bm!66148))

(assert (not b!1380275))

(assert (not bm!66147))

(assert (not start!117486))

(assert (not b!1380279))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1380339 () Bool)

(declare-fun e!782152 () (_ BitVec 32))

(assert (=> b!1380339 (= e!782152 #b00000000000000000000000000000000)))

(declare-fun call!66175 () (_ BitVec 32))

(declare-fun bm!66172 () Bool)

(assert (=> bm!66172 (= call!66175 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380341 () Bool)

(declare-fun e!782153 () (_ BitVec 32))

(assert (=> b!1380341 (= e!782153 call!66175)))

(declare-fun b!1380342 () Bool)

(assert (=> b!1380342 (= e!782152 e!782153)))

(declare-fun c!128337 () Bool)

(assert (=> b!1380342 (= c!128337 (validKeyInArray!0 (select (arr!45413 a!3961) from!3339)))))

(declare-fun b!1380340 () Bool)

(assert (=> b!1380340 (= e!782153 (bvadd #b00000000000000000000000000000001 call!66175))))

(declare-fun d!148755 () Bool)

(declare-fun lt!607923 () (_ BitVec 32))

(assert (=> d!148755 (and (bvsge lt!607923 #b00000000000000000000000000000000) (bvsle lt!607923 (bvsub (size!45963 a!3961) from!3339)))))

(assert (=> d!148755 (= lt!607923 e!782152)))

(declare-fun c!128336 () Bool)

(assert (=> d!148755 (= c!128336 (bvsge from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148755 (and (bvsle from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45963 a!3961)))))

(assert (=> d!148755 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607923)))

(assert (= (and d!148755 c!128336) b!1380339))

(assert (= (and d!148755 (not c!128336)) b!1380342))

(assert (= (and b!1380342 c!128337) b!1380340))

(assert (= (and b!1380342 (not c!128337)) b!1380341))

(assert (= (or b!1380340 b!1380341) bm!66172))

(declare-fun m!1265535 () Bool)

(assert (=> bm!66172 m!1265535))

(declare-fun m!1265537 () Bool)

(assert (=> b!1380342 m!1265537))

(assert (=> b!1380342 m!1265537))

(declare-fun m!1265539 () Bool)

(assert (=> b!1380342 m!1265539))

(assert (=> bm!66147 d!148755))

(declare-fun d!148765 () Bool)

(assert (=> d!148765 (= (array_inv!34441 a!3961) (bvsge (size!45963 a!3961) #b00000000000000000000000000000000))))

(assert (=> start!117486 d!148765))

(declare-fun d!148771 () Bool)

(assert (=> d!148771 (= (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34)) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39855 () Bool)

(assert (= bs!39855 d!148771))

(assert (=> bs!39855 m!1265465))

(declare-fun m!1265545 () Bool)

(assert (=> bs!39855 m!1265545))

(declare-fun m!1265547 () Bool)

(assert (=> bs!39855 m!1265547))

(assert (=> b!1380275 d!148771))

(declare-fun d!148773 () Bool)

(assert (=> d!148773 (= (validKeyInArray!0 (select (arr!45413 a!3961) pivot!34)) (and (not (= (select (arr!45413 a!3961) pivot!34) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45413 a!3961) pivot!34) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380275 d!148773))

(declare-fun d!148775 () Bool)

(declare-fun e!782166 () Bool)

(assert (=> d!148775 e!782166))

(declare-fun res!922552 () Bool)

(assert (=> d!148775 (=> (not res!922552) (not e!782166))))

(declare-fun lt!607936 () (_ BitVec 32))

(assert (=> d!148775 (= res!922552 (and (bvsge lt!607936 #b00000000000000000000000000000000) (bvslt lt!607936 (size!45963 a!3961))))))

(assert (=> d!148775 (= lt!607936 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))

(declare-fun lt!607935 () Unit!45957)

(declare-fun choose!86 (array!94037 (_ BitVec 32) (_ BitVec 32)) Unit!45957)

(assert (=> d!148775 (= lt!607935 (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148775 (and (bvslt (size!45963 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) from!3339) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45963 a!3961)))))

(assert (=> d!148775 (= (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607935)))

(declare-fun b!1380362 () Bool)

(declare-fun e!782167 () Bool)

(declare-fun call!66188 () (_ BitVec 32))

(declare-fun call!66187 () (_ BitVec 32))

(assert (=> b!1380362 (= e!782167 (= (bvadd call!66188 #b00000000000000000000000000000001) call!66187))))

(declare-fun b!1380363 () Bool)

(assert (=> b!1380363 (= e!782167 (= call!66188 call!66187))))

(declare-fun bm!66184 () Bool)

(assert (=> bm!66184 (= call!66188 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun b!1380364 () Bool)

(assert (=> b!1380364 (= e!782166 e!782167)))

(declare-fun c!128345 () Bool)

(assert (=> b!1380364 (= c!128345 (validKeyInArray!0 (select (arr!45413 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(declare-fun bm!66185 () Bool)

(assert (=> bm!66185 (= call!66187 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (= (and d!148775 res!922552) b!1380364))

(assert (= (and b!1380364 c!128345) b!1380362))

(assert (= (and b!1380364 (not c!128345)) b!1380363))

(assert (= (or b!1380362 b!1380363) bm!66185))

(assert (= (or b!1380362 b!1380363) bm!66184))

(declare-fun m!1265557 () Bool)

(assert (=> d!148775 m!1265557))

(declare-fun m!1265559 () Bool)

(assert (=> bm!66184 m!1265559))

(declare-fun m!1265561 () Bool)

(assert (=> b!1380364 m!1265561))

(assert (=> b!1380364 m!1265561))

(declare-fun m!1265563 () Bool)

(assert (=> b!1380364 m!1265563))

(assert (=> bm!66185 m!1265465))

(assert (=> b!1380275 d!148775))

(declare-fun b!1380365 () Bool)

(declare-fun e!782168 () (_ BitVec 32))

(assert (=> b!1380365 (= e!782168 #b00000000000000000000000000000000)))

(declare-fun bm!66186 () Bool)

(declare-fun call!66189 () (_ BitVec 32))

(assert (=> bm!66186 (= call!66189 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(declare-fun b!1380367 () Bool)

(declare-fun e!782169 () (_ BitVec 32))

(assert (=> b!1380367 (= e!782169 call!66189)))

(declare-fun b!1380368 () Bool)

(assert (=> b!1380368 (= e!782168 e!782169)))

(declare-fun c!128347 () Bool)

(assert (=> b!1380368 (= c!128347 (validKeyInArray!0 (select (arr!45413 a!3961) from!3339)))))

(declare-fun b!1380366 () Bool)

(assert (=> b!1380366 (= e!782169 (bvadd #b00000000000000000000000000000001 call!66189))))

(declare-fun d!148781 () Bool)

(declare-fun lt!607937 () (_ BitVec 32))

(assert (=> d!148781 (and (bvsge lt!607937 #b00000000000000000000000000000000) (bvsle lt!607937 (bvsub (size!45963 a!3961) from!3339)))))

(assert (=> d!148781 (= lt!607937 e!782168)))

(declare-fun c!128346 () Bool)

(assert (=> d!148781 (= c!128346 (bvsge from!3339 pivot!34))))

(assert (=> d!148781 (and (bvsle from!3339 pivot!34) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle pivot!34 (size!45963 a!3961)))))

(assert (=> d!148781 (= (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) lt!607937)))

(assert (= (and d!148781 c!128346) b!1380365))

(assert (= (and d!148781 (not c!128346)) b!1380368))

(assert (= (and b!1380368 c!128347) b!1380366))

(assert (= (and b!1380368 (not c!128347)) b!1380367))

(assert (= (or b!1380366 b!1380367) bm!66186))

(declare-fun m!1265565 () Bool)

(assert (=> bm!66186 m!1265565))

(assert (=> b!1380368 m!1265537))

(assert (=> b!1380368 m!1265537))

(assert (=> b!1380368 m!1265539))

(assert (=> bm!66148 d!148781))

(declare-fun d!148783 () Bool)

(assert (=> d!148783 (= (isPivot!0 a!3961 from!3339 to!135 pivot!34) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) (arrayCountValidKeys!0 a!3961 pivot!34 to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39856 () Bool)

(assert (= bs!39856 d!148783))

(assert (=> bs!39856 m!1265463))

(declare-fun m!1265567 () Bool)

(assert (=> bs!39856 m!1265567))

(assert (=> bs!39856 m!1265547))

(assert (=> b!1380279 d!148783))

(push 1)

(assert (not d!148771))

(assert (not d!148775))

(assert (not b!1380342))

(assert (not bm!66186))

(assert (not bm!66185))

(assert (not d!148783))

(assert (not bm!66172))

(assert (not bm!66184))

(assert (not b!1380364))

(assert (not b!1380368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!148783 d!148781))

(declare-fun b!1380415 () Bool)

(declare-fun e!782193 () (_ BitVec 32))

(assert (=> b!1380415 (= e!782193 #b00000000000000000000000000000000)))

(declare-fun call!66206 () (_ BitVec 32))

(declare-fun bm!66203 () Bool)

(assert (=> bm!66203 (= call!66206 (arrayCountValidKeys!0 a!3961 (bvadd pivot!34 #b00000000000000000000000000000001) to!135))))

(declare-fun b!1380417 () Bool)

(declare-fun e!782194 () (_ BitVec 32))

(assert (=> b!1380417 (= e!782194 call!66206)))

(declare-fun b!1380418 () Bool)

(assert (=> b!1380418 (= e!782193 e!782194)))

(declare-fun c!128372 () Bool)

(assert (=> b!1380418 (= c!128372 (validKeyInArray!0 (select (arr!45413 a!3961) pivot!34)))))

(declare-fun b!1380416 () Bool)

(assert (=> b!1380416 (= e!782194 (bvadd #b00000000000000000000000000000001 call!66206))))

(declare-fun d!148805 () Bool)

(declare-fun lt!607948 () (_ BitVec 32))

(assert (=> d!148805 (and (bvsge lt!607948 #b00000000000000000000000000000000) (bvsle lt!607948 (bvsub (size!45963 a!3961) pivot!34)))))

(assert (=> d!148805 (= lt!607948 e!782193)))

(declare-fun c!128371 () Bool)

(assert (=> d!148805 (= c!128371 (bvsge pivot!34 to!135))))

(assert (=> d!148805 (and (bvsle pivot!34 to!135) (bvsge pivot!34 #b00000000000000000000000000000000) (bvsle to!135 (size!45963 a!3961)))))

(assert (=> d!148805 (= (arrayCountValidKeys!0 a!3961 pivot!34 to!135) lt!607948)))

(assert (= (and d!148805 c!128371) b!1380415))

(assert (= (and d!148805 (not c!128371)) b!1380418))

(assert (= (and b!1380418 c!128372) b!1380416))

(assert (= (and b!1380418 (not c!128372)) b!1380417))

(assert (= (or b!1380416 b!1380417) bm!66203))

(declare-fun m!1265597 () Bool)

(assert (=> bm!66203 m!1265597))

(assert (=> b!1380418 m!1265473))

(assert (=> b!1380418 m!1265473))

(assert (=> b!1380418 m!1265475))

(assert (=> d!148783 d!148805))

(declare-fun b!1380419 () Bool)

(declare-fun e!782195 () (_ BitVec 32))

(assert (=> b!1380419 (= e!782195 #b00000000000000000000000000000000)))

(declare-fun call!66207 () (_ BitVec 32))

(declare-fun bm!66204 () Bool)

(assert (=> bm!66204 (= call!66207 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) to!135))))

(declare-fun b!1380421 () Bool)

(declare-fun e!782196 () (_ BitVec 32))

(assert (=> b!1380421 (= e!782196 call!66207)))

(declare-fun b!1380422 () Bool)

(assert (=> b!1380422 (= e!782195 e!782196)))

(declare-fun c!128374 () Bool)

(assert (=> b!1380422 (= c!128374 (validKeyInArray!0 (select (arr!45413 a!3961) from!3339)))))

(declare-fun b!1380420 () Bool)

(assert (=> b!1380420 (= e!782196 (bvadd #b00000000000000000000000000000001 call!66207))))

(declare-fun d!148807 () Bool)

(declare-fun lt!607949 () (_ BitVec 32))

(assert (=> d!148807 (and (bvsge lt!607949 #b00000000000000000000000000000000) (bvsle lt!607949 (bvsub (size!45963 a!3961) from!3339)))))

(assert (=> d!148807 (= lt!607949 e!782195)))

(declare-fun c!128373 () Bool)

(assert (=> d!148807 (= c!128373 (bvsge from!3339 to!135))))

(assert (=> d!148807 (and (bvsle from!3339 to!135) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle to!135 (size!45963 a!3961)))))

(assert (=> d!148807 (= (arrayCountValidKeys!0 a!3961 from!3339 to!135) lt!607949)))

(assert (= (and d!148807 c!128373) b!1380419))

(assert (= (and d!148807 (not c!128373)) b!1380422))

(assert (= (and b!1380422 c!128374) b!1380420))

(assert (= (and b!1380422 (not c!128374)) b!1380421))

(assert (= (or b!1380420 b!1380421) bm!66204))

(declare-fun m!1265599 () Bool)

(assert (=> bm!66204 m!1265599))

(assert (=> b!1380422 m!1265537))

(assert (=> b!1380422 m!1265537))

(assert (=> b!1380422 m!1265539))

(assert (=> d!148783 d!148807))

(declare-fun d!148809 () Bool)

(assert (=> d!148809 (= (validKeyInArray!0 (select (arr!45413 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))) (and (not (= (select (arr!45413 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45413 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380364 d!148809))

(assert (=> bm!66185 d!148755))

(assert (=> d!148771 d!148755))

(declare-fun b!1380423 () Bool)

(declare-fun e!782197 () (_ BitVec 32))

(assert (=> b!1380423 (= e!782197 #b00000000000000000000000000000000)))

(declare-fun call!66208 () (_ BitVec 32))

(declare-fun bm!66205 () Bool)

(assert (=> bm!66205 (= call!66208 (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34 #b00000000000000000000000000000001) to!135))))

(declare-fun b!1380425 () Bool)

(declare-fun e!782198 () (_ BitVec 32))

(assert (=> b!1380425 (= e!782198 call!66208)))

(declare-fun b!1380426 () Bool)

(assert (=> b!1380426 (= e!782197 e!782198)))

(declare-fun c!128376 () Bool)

(assert (=> b!1380426 (= c!128376 (validKeyInArray!0 (select (arr!45413 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(declare-fun b!1380424 () Bool)

(assert (=> b!1380424 (= e!782198 (bvadd #b00000000000000000000000000000001 call!66208))))

(declare-fun d!148811 () Bool)

(declare-fun lt!607950 () (_ BitVec 32))

(assert (=> d!148811 (and (bvsge lt!607950 #b00000000000000000000000000000000) (bvsle lt!607950 (bvsub (size!45963 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> d!148811 (= lt!607950 e!782197)))

(declare-fun c!128375 () Bool)

(assert (=> d!148811 (= c!128375 (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) to!135))))

(assert (=> d!148811 (and (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) to!135) (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000000) (bvsle to!135 (size!45963 a!3961)))))

(assert (=> d!148811 (= (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135) lt!607950)))

(assert (= (and d!148811 c!128375) b!1380423))

(assert (= (and d!148811 (not c!128375)) b!1380426))

(assert (= (and b!1380426 c!128376) b!1380424))

(assert (= (and b!1380426 (not c!128376)) b!1380425))

(assert (= (or b!1380424 b!1380425) bm!66205))

(declare-fun m!1265601 () Bool)

(assert (=> bm!66205 m!1265601))

(declare-fun m!1265603 () Bool)

(assert (=> b!1380426 m!1265603))

(assert (=> b!1380426 m!1265603))

(declare-fun m!1265605 () Bool)

(assert (=> b!1380426 m!1265605))

(assert (=> d!148771 d!148811))

(assert (=> d!148771 d!148807))

(declare-fun d!148813 () Bool)

(assert (=> d!148813 (= (validKeyInArray!0 (select (arr!45413 a!3961) from!3339)) (and (not (= (select (arr!45413 a!3961) from!3339) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45413 a!3961) from!3339) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380368 d!148813))

(declare-fun b!1380427 () Bool)

(declare-fun e!782199 () (_ BitVec 32))

(assert (=> b!1380427 (= e!782199 #b00000000000000000000000000000000)))

(declare-fun call!66209 () (_ BitVec 32))

(declare-fun bm!66206 () Bool)

(assert (=> bm!66206 (= call!66209 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380429 () Bool)

(declare-fun e!782200 () (_ BitVec 32))

(assert (=> b!1380429 (= e!782200 call!66209)))

(declare-fun b!1380430 () Bool)

(assert (=> b!1380430 (= e!782199 e!782200)))

(declare-fun c!128378 () Bool)

(assert (=> b!1380430 (= c!128378 (validKeyInArray!0 (select (arr!45413 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380428 () Bool)

(assert (=> b!1380428 (= e!782200 (bvadd #b00000000000000000000000000000001 call!66209))))

(declare-fun d!148815 () Bool)

(declare-fun lt!607951 () (_ BitVec 32))

(assert (=> d!148815 (and (bvsge lt!607951 #b00000000000000000000000000000000) (bvsle lt!607951 (bvsub (size!45963 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148815 (= lt!607951 e!782199)))

(declare-fun c!128377 () Bool)

(assert (=> d!148815 (= c!128377 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148815 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45963 a!3961)))))

(assert (=> d!148815 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607951)))

(assert (= (and d!148815 c!128377) b!1380427))

(assert (= (and d!148815 (not c!128377)) b!1380430))

(assert (= (and b!1380430 c!128378) b!1380428))

(assert (= (and b!1380430 (not c!128378)) b!1380429))

(assert (= (or b!1380428 b!1380429) bm!66206))

(declare-fun m!1265607 () Bool)

(assert (=> bm!66206 m!1265607))

(declare-fun m!1265609 () Bool)

(assert (=> b!1380430 m!1265609))

(assert (=> b!1380430 m!1265609))

(declare-fun m!1265611 () Bool)

(assert (=> b!1380430 m!1265611))

(assert (=> bm!66172 d!148815))

(declare-fun call!66215 () (_ BitVec 32))

(declare-fun bm!66211 () Bool)

(assert (=> bm!66211 (= call!66215 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun b!1380435 () Bool)

(declare-fun e!782203 () Bool)

(declare-fun call!66214 () (_ BitVec 32))

(assert (=> b!1380435 (= e!782203 (= (bvadd call!66215 #b00000000000000000000000000000001) call!66214))))

(declare-fun d!148817 () Bool)

(assert (=> d!148817 e!782203))

(declare-fun c!128381 () Bool)

(assert (=> d!148817 (= c!128381 (validKeyInArray!0 (select (arr!45413 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(assert (=> d!148817 true))

(declare-fun _$73!17 () Unit!45957)

(assert (=> d!148817 (= (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) _$73!17)))

(declare-fun bm!66212 () Bool)

(assert (=> bm!66212 (= call!66214 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380436 () Bool)

(assert (=> b!1380436 (= e!782203 (= call!66215 call!66214))))

(assert (= (and d!148817 c!128381) b!1380435))

(assert (= (and d!148817 (not c!128381)) b!1380436))

(assert (= (or b!1380435 b!1380436) bm!66211))

(assert (= (or b!1380435 b!1380436) bm!66212))

(assert (=> bm!66211 m!1265559))

(assert (=> d!148817 m!1265561))

(assert (=> d!148817 m!1265561))

(assert (=> d!148817 m!1265563))

(assert (=> bm!66212 m!1265465))

(assert (=> d!148775 d!148817))

(assert (=> b!1380342 d!148813))

(declare-fun b!1380437 () Bool)

(declare-fun e!782204 () (_ BitVec 32))

(assert (=> b!1380437 (= e!782204 #b00000000000000000000000000000000)))

(declare-fun call!66216 () (_ BitVec 32))

(declare-fun bm!66213 () Bool)

(assert (=> bm!66213 (= call!66216 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun b!1380439 () Bool)

(declare-fun e!782205 () (_ BitVec 32))

(assert (=> b!1380439 (= e!782205 call!66216)))

(declare-fun b!1380440 () Bool)

(assert (=> b!1380440 (= e!782204 e!782205)))

(declare-fun c!128383 () Bool)

(assert (=> b!1380440 (= c!128383 (validKeyInArray!0 (select (arr!45413 a!3961) from!3339)))))

(declare-fun b!1380438 () Bool)

(assert (=> b!1380438 (= e!782205 (bvadd #b00000000000000000000000000000001 call!66216))))

(declare-fun d!148819 () Bool)

(declare-fun lt!607952 () (_ BitVec 32))

(assert (=> d!148819 (and (bvsge lt!607952 #b00000000000000000000000000000000) (bvsle lt!607952 (bvsub (size!45963 a!3961) from!3339)))))

(assert (=> d!148819 (= lt!607952 e!782204)))

(declare-fun c!128382 () Bool)

(assert (=> d!148819 (= c!128382 (bvsge from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (=> d!148819 (and (bvsle from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001) (size!45963 a!3961)))))

(assert (=> d!148819 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) lt!607952)))

(assert (= (and d!148819 c!128382) b!1380437))

(assert (= (and d!148819 (not c!128382)) b!1380440))

(assert (= (and b!1380440 c!128383) b!1380438))

(assert (= (and b!1380440 (not c!128383)) b!1380439))

(assert (= (or b!1380438 b!1380439) bm!66213))

(declare-fun m!1265613 () Bool)

(assert (=> bm!66213 m!1265613))

(assert (=> b!1380440 m!1265537))

(assert (=> b!1380440 m!1265537))

(assert (=> b!1380440 m!1265539))

(assert (=> bm!66184 d!148819))

(declare-fun b!1380441 () Bool)

(declare-fun e!782206 () (_ BitVec 32))

(assert (=> b!1380441 (= e!782206 #b00000000000000000000000000000000)))

(declare-fun call!66217 () (_ BitVec 32))

(declare-fun bm!66214 () Bool)

(assert (=> bm!66214 (= call!66217 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) pivot!34))))

(declare-fun b!1380443 () Bool)

(declare-fun e!782207 () (_ BitVec 32))

(assert (=> b!1380443 (= e!782207 call!66217)))

(declare-fun b!1380444 () Bool)

(assert (=> b!1380444 (= e!782206 e!782207)))

(declare-fun c!128385 () Bool)

(assert (=> b!1380444 (= c!128385 (validKeyInArray!0 (select (arr!45413 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380442 () Bool)

(assert (=> b!1380442 (= e!782207 (bvadd #b00000000000000000000000000000001 call!66217))))

(declare-fun d!148821 () Bool)

(declare-fun lt!607953 () (_ BitVec 32))

(assert (=> d!148821 (and (bvsge lt!607953 #b00000000000000000000000000000000) (bvsle lt!607953 (bvsub (size!45963 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148821 (= lt!607953 e!782206)))

(declare-fun c!128384 () Bool)

(assert (=> d!148821 (= c!128384 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(assert (=> d!148821 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle pivot!34 (size!45963 a!3961)))))

(assert (=> d!148821 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) lt!607953)))

(assert (= (and d!148821 c!128384) b!1380441))

(assert (= (and d!148821 (not c!128384)) b!1380444))

(assert (= (and b!1380444 c!128385) b!1380442))

(assert (= (and b!1380444 (not c!128385)) b!1380443))

(assert (= (or b!1380442 b!1380443) bm!66214))

(declare-fun m!1265615 () Bool)

(assert (=> bm!66214 m!1265615))

(assert (=> b!1380444 m!1265609))

(assert (=> b!1380444 m!1265609))

(assert (=> b!1380444 m!1265611))

(assert (=> bm!66186 d!148821))

(push 1)

(assert (not b!1380418))

(assert (not b!1380430))

(assert (not bm!66203))

(assert (not bm!66205))

(assert (not b!1380422))

(assert (not bm!66214))

(assert (not b!1380444))

(assert (not d!148817))

(assert (not bm!66212))

(assert (not b!1380440))

(assert (not bm!66206))

(assert (not bm!66204))

(assert (not bm!66213))

(assert (not b!1380426))

(assert (not bm!66211))

(check-sat)

(pop 1)

(push 1)

(check-sat)

