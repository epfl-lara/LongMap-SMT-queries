; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117894 () Bool)

(assert start!117894)

(declare-fun res!923250 () Bool)

(declare-fun e!783531 () Bool)

(assert (=> start!117894 (=> (not res!923250) (not e!783531))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94275 0))(
  ( (array!94276 (arr!45524 (Array (_ BitVec 32) (_ BitVec 64))) (size!46075 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94275)

(assert (=> start!117894 (= res!923250 (and (bvslt (size!46075 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46075 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117894 e!783531))

(declare-fun array_inv!34805 (array!94275) Bool)

(assert (=> start!117894 (array_inv!34805 a!3931)))

(assert (=> start!117894 true))

(declare-fun b!1382259 () Bool)

(declare-fun e!783530 () Bool)

(assert (=> b!1382259 (= e!783531 e!783530)))

(declare-fun c!128952 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382259 (= c!128952 (validKeyInArray!0 (select (arr!45524 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun call!66542 () (_ BitVec 32))

(declare-fun bm!66538 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94275 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66538 (= call!66542 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1382260 () Bool)

(declare-fun call!66541 () (_ BitVec 32))

(assert (=> b!1382260 (= e!783530 (not (= (bvadd #b00000000000000000000000000000001 call!66542) call!66541)))))

(declare-fun b!1382261 () Bool)

(assert (=> b!1382261 (= e!783530 (not (= call!66542 call!66541)))))

(declare-fun bm!66539 () Bool)

(assert (=> bm!66539 (= call!66541 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(assert (= (and start!117894 res!923250) b!1382259))

(assert (= (and b!1382259 c!128952) b!1382260))

(assert (= (and b!1382259 (not c!128952)) b!1382261))

(assert (= (or b!1382260 b!1382261) bm!66539))

(assert (= (or b!1382260 b!1382261) bm!66538))

(declare-fun m!1267805 () Bool)

(assert (=> start!117894 m!1267805))

(declare-fun m!1267807 () Bool)

(assert (=> b!1382259 m!1267807))

(assert (=> b!1382259 m!1267807))

(declare-fun m!1267809 () Bool)

(assert (=> b!1382259 m!1267809))

(declare-fun m!1267811 () Bool)

(assert (=> bm!66538 m!1267811))

(declare-fun m!1267813 () Bool)

(assert (=> bm!66539 m!1267813))

(push 1)

(assert (not start!117894))

(assert (not b!1382259))

(assert (not bm!66538))

(assert (not bm!66539))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149393 () Bool)

(assert (=> d!149393 (= (array_inv!34805 a!3931) (bvsge (size!46075 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117894 d!149393))

(declare-fun d!149395 () Bool)

(assert (=> d!149395 (= (validKeyInArray!0 (select (arr!45524 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45524 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45524 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382259 d!149395))

(declare-fun d!149401 () Bool)

(declare-fun lt!608622 () (_ BitVec 32))

(assert (=> d!149401 (and (bvsge lt!608622 #b00000000000000000000000000000000) (bvsle lt!608622 (bvsub (size!46075 a!3931) from!3309)))))

(declare-fun e!783561 () (_ BitVec 32))

(assert (=> d!149401 (= lt!608622 e!783561)))

(declare-fun c!128976 () Bool)

(assert (=> d!149401 (= c!128976 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!149401 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46075 a!3931)))))

(assert (=> d!149401 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608622)))

(declare-fun b!1382311 () Bool)

(declare-fun e!783562 () (_ BitVec 32))

(declare-fun call!66559 () (_ BitVec 32))

(assert (=> b!1382311 (= e!783562 (bvadd #b00000000000000000000000000000001 call!66559))))

(declare-fun b!1382312 () Bool)

(assert (=> b!1382312 (= e!783561 #b00000000000000000000000000000000)))

(declare-fun bm!66556 () Bool)

(assert (=> bm!66556 (= call!66559 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1382313 () Bool)

(assert (=> b!1382313 (= e!783561 e!783562)))

(declare-fun c!128977 () Bool)

(assert (=> b!1382313 (= c!128977 (validKeyInArray!0 (select (arr!45524 a!3931) from!3309)))))

(declare-fun b!1382314 () Bool)

(assert (=> b!1382314 (= e!783562 call!66559)))

(assert (= (and d!149401 c!128976) b!1382312))

(assert (= (and d!149401 (not c!128976)) b!1382313))

(assert (= (and b!1382313 c!128977) b!1382311))

(assert (= (and b!1382313 (not c!128977)) b!1382314))

(assert (= (or b!1382311 b!1382314) bm!66556))

(declare-fun m!1267841 () Bool)

(assert (=> bm!66556 m!1267841))

(declare-fun m!1267843 () Bool)

(assert (=> b!1382313 m!1267843))

(assert (=> b!1382313 m!1267843))

(declare-fun m!1267845 () Bool)

(assert (=> b!1382313 m!1267845))

(assert (=> bm!66538 d!149401))

(declare-fun d!149403 () Bool)

(declare-fun lt!608623 () (_ BitVec 32))

(assert (=> d!149403 (and (bvsge lt!608623 #b00000000000000000000000000000000) (bvsle lt!608623 (bvsub (size!46075 a!3931) from!3309)))))

(declare-fun e!783563 () (_ BitVec 32))

(assert (=> d!149403 (= lt!608623 e!783563)))

(declare-fun c!128978 () Bool)

(assert (=> d!149403 (= c!128978 (bvsge from!3309 to!105))))

(assert (=> d!149403 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46075 a!3931)))))

(assert (=> d!149403 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608623)))

(declare-fun b!1382315 () Bool)

(declare-fun e!783564 () (_ BitVec 32))

(declare-fun call!66560 () (_ BitVec 32))

(assert (=> b!1382315 (= e!783564 (bvadd #b00000000000000000000000000000001 call!66560))))

(declare-fun b!1382316 () Bool)

(assert (=> b!1382316 (= e!783563 #b00000000000000000000000000000000)))

(declare-fun bm!66557 () Bool)

(assert (=> bm!66557 (= call!66560 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1382317 () Bool)

(assert (=> b!1382317 (= e!783563 e!783564)))

(declare-fun c!128979 () Bool)

(assert (=> b!1382317 (= c!128979 (validKeyInArray!0 (select (arr!45524 a!3931) from!3309)))))

(declare-fun b!1382318 () Bool)

(assert (=> b!1382318 (= e!783564 call!66560)))

(assert (= (and d!149403 c!128978) b!1382316))

(assert (= (and d!149403 (not c!128978)) b!1382317))

(assert (= (and b!1382317 c!128979) b!1382315))

(assert (= (and b!1382317 (not c!128979)) b!1382318))

(assert (= (or b!1382315 b!1382318) bm!66557))

(declare-fun m!1267847 () Bool)

(assert (=> bm!66557 m!1267847))

(assert (=> b!1382317 m!1267843))

(assert (=> b!1382317 m!1267843))

(assert (=> b!1382317 m!1267845))

(assert (=> bm!66539 d!149403))

(push 1)

(assert (not bm!66556))

(assert (not b!1382317))

(assert (not bm!66557))

(assert (not b!1382313))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149417 () Bool)

(declare-fun lt!608628 () (_ BitVec 32))

(assert (=> d!149417 (and (bvsge lt!608628 #b00000000000000000000000000000000) (bvsle lt!608628 (bvsub (size!46075 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun e!783573 () (_ BitVec 32))

(assert (=> d!149417 (= lt!608628 e!783573)))

(declare-fun c!128988 () Bool)

(assert (=> d!149417 (= c!128988 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!149417 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46075 a!3931)))))

(assert (=> d!149417 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) lt!608628)))

(declare-fun b!1382335 () Bool)

(declare-fun e!783574 () (_ BitVec 32))

(declare-fun call!66565 () (_ BitVec 32))

(assert (=> b!1382335 (= e!783574 (bvadd #b00000000000000000000000000000001 call!66565))))

(declare-fun b!1382336 () Bool)

(assert (=> b!1382336 (= e!783573 #b00000000000000000000000000000000)))

(declare-fun bm!66562 () Bool)

(assert (=> bm!66562 (= call!66565 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1382337 () Bool)

(assert (=> b!1382337 (= e!783573 e!783574)))

(declare-fun c!128989 () Bool)

(assert (=> b!1382337 (= c!128989 (validKeyInArray!0 (select (arr!45524 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun b!1382338 () Bool)

(assert (=> b!1382338 (= e!783574 call!66565)))

(assert (= (and d!149417 c!128988) b!1382336))

(assert (= (and d!149417 (not c!128988)) b!1382337))

(assert (= (and b!1382337 c!128989) b!1382335))

(assert (= (and b!1382337 (not c!128989)) b!1382338))

(assert (= (or b!1382335 b!1382338) bm!66562))

(declare-fun m!1267865 () Bool)

(assert (=> bm!66562 m!1267865))

(declare-fun m!1267867 () Bool)

(assert (=> b!1382337 m!1267867))

(assert (=> b!1382337 m!1267867))

(declare-fun m!1267869 () Bool)

(assert (=> b!1382337 m!1267869))

(assert (=> bm!66556 d!149417))

(declare-fun d!149419 () Bool)

(assert (=> d!149419 (= (validKeyInArray!0 (select (arr!45524 a!3931) from!3309)) (and (not (= (select (arr!45524 a!3931) from!3309) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45524 a!3931) from!3309) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382317 d!149419))

(declare-fun d!149421 () Bool)

(declare-fun lt!608629 () (_ BitVec 32))

(assert (=> d!149421 (and (bvsge lt!608629 #b00000000000000000000000000000000) (bvsle lt!608629 (bvsub (size!46075 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun e!783575 () (_ BitVec 32))

(assert (=> d!149421 (= lt!608629 e!783575)))

(declare-fun c!128990 () Bool)

(assert (=> d!149421 (= c!128990 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(assert (=> d!149421 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) to!105) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!105 (size!46075 a!3931)))))

(assert (=> d!149421 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105) lt!608629)))

(declare-fun b!1382339 () Bool)

(declare-fun e!783576 () (_ BitVec 32))

(declare-fun call!66566 () (_ BitVec 32))

(assert (=> b!1382339 (= e!783576 (bvadd #b00000000000000000000000000000001 call!66566))))

(declare-fun b!1382340 () Bool)

(assert (=> b!1382340 (= e!783575 #b00000000000000000000000000000000)))

(declare-fun bm!66563 () Bool)

(assert (=> bm!66563 (= call!66566 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1382341 () Bool)

(assert (=> b!1382341 (= e!783575 e!783576)))

(declare-fun c!128991 () Bool)

(assert (=> b!1382341 (= c!128991 (validKeyInArray!0 (select (arr!45524 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun b!1382342 () Bool)

(assert (=> b!1382342 (= e!783576 call!66566)))

(assert (= (and d!149421 c!128990) b!1382340))

(assert (= (and d!149421 (not c!128990)) b!1382341))

(assert (= (and b!1382341 c!128991) b!1382339))

(assert (= (and b!1382341 (not c!128991)) b!1382342))

(assert (= (or b!1382339 b!1382342) bm!66563))

(declare-fun m!1267871 () Bool)

(assert (=> bm!66563 m!1267871))

(assert (=> b!1382341 m!1267867))

(assert (=> b!1382341 m!1267867))

(assert (=> b!1382341 m!1267869))

(assert (=> bm!66557 d!149421))

(assert (=> b!1382313 d!149419))

(push 1)

(assert (not bm!66562))

(assert (not b!1382337))

(assert (not b!1382341))

(assert (not bm!66563))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

