; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117490 () Bool)

(assert start!117490)

(declare-fun b!1380305 () Bool)

(declare-fun e!782133 () Bool)

(declare-fun call!66163 () (_ BitVec 32))

(declare-fun call!66162 () (_ BitVec 32))

(assert (=> b!1380305 (= e!782133 (= (bvadd #b00000000000000000000000000000001 call!66163) call!66162))))

(declare-fun b!1380306 () Bool)

(assert (=> b!1380306 (= e!782133 (= call!66163 call!66162))))

(declare-fun b!1380307 () Bool)

(declare-fun res!922541 () Bool)

(declare-fun e!782135 () Bool)

(assert (=> b!1380307 (=> (not res!922541) (not e!782135))))

(declare-fun pivot!34 () (_ BitVec 32))

(declare-datatypes ((array!94041 0))(
  ( (array!94042 (arr!45415 (Array (_ BitVec 32) (_ BitVec 64))) (size!45965 (_ BitVec 32))) )
))
(declare-fun a!3961 () array!94041)

(assert (=> b!1380307 (= res!922541 (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45965 a!3961)))))

(declare-fun res!922542 () Bool)

(assert (=> start!117490 (=> (not res!922542) (not e!782135))))

(declare-fun from!3339 () (_ BitVec 32))

(declare-fun to!135 () (_ BitVec 32))

(assert (=> start!117490 (= res!922542 (and (bvslt (size!45965 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt to!135 from!3339) (bvsle to!135 (size!45965 a!3961)) (bvsge pivot!34 from!3339) (bvslt pivot!34 (bvsub to!135 #b00000000000000000000000000000001))))))

(assert (=> start!117490 e!782135))

(declare-fun array_inv!34443 (array!94041) Bool)

(assert (=> start!117490 (array_inv!34443 a!3961)))

(assert (=> start!117490 true))

(declare-fun bm!66159 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94041 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66159 (= call!66163 (arrayCountValidKeys!0 a!3961 from!3339 pivot!34))))

(declare-fun bm!66160 () Bool)

(assert (=> bm!66160 (= call!66162 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380308 () Bool)

(declare-fun res!922543 () Bool)

(assert (=> b!1380308 (=> (not res!922543) (not e!782135))))

(declare-fun isPivot!0 (array!94041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380308 (= res!922543 (isPivot!0 a!3961 from!3339 to!135 pivot!34))))

(declare-fun b!1380309 () Bool)

(assert (=> b!1380309 (= e!782135 (not (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> b!1380309 e!782133))

(declare-fun c!128322 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380309 (= c!128322 (validKeyInArray!0 (select (arr!45415 a!3961) pivot!34)))))

(declare-datatypes ((Unit!45961 0))(
  ( (Unit!45962) )
))
(declare-fun lt!607911 () Unit!45961)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94041 (_ BitVec 32) (_ BitVec 32)) Unit!45961)

(assert (=> b!1380309 (= lt!607911 (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (= (and start!117490 res!922542) b!1380308))

(assert (= (and b!1380308 res!922543) b!1380307))

(assert (= (and b!1380307 res!922541) b!1380309))

(assert (= (and b!1380309 c!128322) b!1380305))

(assert (= (and b!1380309 (not c!128322)) b!1380306))

(assert (= (or b!1380305 b!1380306) bm!66159))

(assert (= (or b!1380305 b!1380306) bm!66160))

(declare-fun m!1265495 () Bool)

(assert (=> b!1380308 m!1265495))

(declare-fun m!1265497 () Bool)

(assert (=> b!1380309 m!1265497))

(declare-fun m!1265499 () Bool)

(assert (=> b!1380309 m!1265499))

(assert (=> b!1380309 m!1265499))

(declare-fun m!1265501 () Bool)

(assert (=> b!1380309 m!1265501))

(declare-fun m!1265503 () Bool)

(assert (=> b!1380309 m!1265503))

(declare-fun m!1265505 () Bool)

(assert (=> bm!66160 m!1265505))

(declare-fun m!1265507 () Bool)

(assert (=> bm!66159 m!1265507))

(declare-fun m!1265509 () Bool)

(assert (=> start!117490 m!1265509))

(push 1)

(assert (not bm!66160))

(assert (not start!117490))

(assert (not b!1380308))

(assert (not b!1380309))

(assert (not bm!66159))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148757 () Bool)

(assert (=> d!148757 (= (isPivot!0 a!3961 from!3339 to!135 pivot!34) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) (arrayCountValidKeys!0 a!3961 pivot!34 to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39852 () Bool)

(assert (= bs!39852 d!148757))

(assert (=> bs!39852 m!1265507))

(declare-fun m!1265523 () Bool)

(assert (=> bs!39852 m!1265523))

(declare-fun m!1265525 () Bool)

(assert (=> bs!39852 m!1265525))

(assert (=> b!1380308 d!148757))

(declare-fun d!148759 () Bool)

(assert (=> d!148759 (= (isPivot!0 a!3961 from!3339 to!135 (bvadd #b00000000000000000000000000000001 pivot!34)) (= (bvadd (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135)) (arrayCountValidKeys!0 a!3961 from!3339 to!135)))))

(declare-fun bs!39853 () Bool)

(assert (= bs!39853 d!148759))

(assert (=> bs!39853 m!1265505))

(declare-fun m!1265527 () Bool)

(assert (=> bs!39853 m!1265527))

(assert (=> bs!39853 m!1265525))

(assert (=> b!1380309 d!148759))

(declare-fun d!148761 () Bool)

(assert (=> d!148761 (= (validKeyInArray!0 (select (arr!45415 a!3961) pivot!34)) (and (not (= (select (arr!45415 a!3961) pivot!34) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45415 a!3961) pivot!34) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380309 d!148761))

(declare-fun call!66181 () (_ BitVec 32))

(declare-fun bm!66178 () Bool)

(assert (=> bm!66178 (= call!66181 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun bm!66179 () Bool)

(declare-fun call!66182 () (_ BitVec 32))

(assert (=> bm!66179 (= call!66182 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun b!1380359 () Bool)

(declare-fun e!782164 () Bool)

(declare-fun e!782165 () Bool)

(assert (=> b!1380359 (= e!782164 e!782165)))

(declare-fun c!128344 () Bool)

(assert (=> b!1380359 (= c!128344 (validKeyInArray!0 (select (arr!45415 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(declare-fun b!1380360 () Bool)

(assert (=> b!1380360 (= e!782165 (= call!66181 call!66182))))

(declare-fun d!148769 () Bool)

(assert (=> d!148769 e!782164))

(declare-fun res!922551 () Bool)

(assert (=> d!148769 (=> (not res!922551) (not e!782164))))

(declare-fun lt!607933 () (_ BitVec 32))

(assert (=> d!148769 (= res!922551 (and (bvsge lt!607933 #b00000000000000000000000000000000) (bvslt lt!607933 (size!45965 a!3961))))))

(assert (=> d!148769 (= lt!607933 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))

(declare-fun lt!607934 () Unit!45961)

(declare-fun choose!86 (array!94041 (_ BitVec 32) (_ BitVec 32)) Unit!45961)

(assert (=> d!148769 (= lt!607934 (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148769 (and (bvslt (size!45965 a!3961) #b01111111111111111111111111111111) (bvsge from!3339 #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 pivot!34) from!3339) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45965 a!3961)))))

(assert (=> d!148769 (= (lemmaCountingValidKeysAtTheEnd!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607934)))

(declare-fun b!1380361 () Bool)

(assert (=> b!1380361 (= e!782165 (= (bvadd call!66181 #b00000000000000000000000000000001) call!66182))))

(assert (= (and d!148769 res!922551) b!1380359))

(assert (= (and b!1380359 c!128344) b!1380361))

(assert (= (and b!1380359 (not c!128344)) b!1380360))

(assert (= (or b!1380361 b!1380360) bm!66179))

(assert (= (or b!1380361 b!1380360) bm!66178))

(declare-fun m!1265549 () Bool)

(assert (=> bm!66178 m!1265549))

(assert (=> bm!66179 m!1265505))

(declare-fun m!1265551 () Bool)

(assert (=> b!1380359 m!1265551))

(assert (=> b!1380359 m!1265551))

(declare-fun m!1265553 () Bool)

(assert (=> b!1380359 m!1265553))

(declare-fun m!1265555 () Bool)

(assert (=> d!148769 m!1265555))

(assert (=> b!1380309 d!148769))

(declare-fun d!148777 () Bool)

(assert (=> d!148777 (= (array_inv!34443 a!3961) (bvsge (size!45965 a!3961) #b00000000000000000000000000000000))))

(assert (=> start!117490 d!148777))

(declare-fun b!1380377 () Bool)

(declare-fun e!782174 () (_ BitVec 32))

(declare-fun call!66192 () (_ BitVec 32))

(assert (=> b!1380377 (= e!782174 (bvadd #b00000000000000000000000000000001 call!66192))))

(declare-fun b!1380378 () Bool)

(declare-fun e!782175 () (_ BitVec 32))

(assert (=> b!1380378 (= e!782175 e!782174)))

(declare-fun c!128353 () Bool)

(assert (=> b!1380378 (= c!128353 (validKeyInArray!0 (select (arr!45415 a!3961) from!3339)))))

(declare-fun b!1380379 () Bool)

(assert (=> b!1380379 (= e!782174 call!66192)))

(declare-fun d!148779 () Bool)

(declare-fun lt!607940 () (_ BitVec 32))

(assert (=> d!148779 (and (bvsge lt!607940 #b00000000000000000000000000000000) (bvsle lt!607940 (bvsub (size!45965 a!3961) from!3339)))))

(assert (=> d!148779 (= lt!607940 e!782175)))

(declare-fun c!128352 () Bool)

(assert (=> d!148779 (= c!128352 (bvsge from!3339 pivot!34))))

(assert (=> d!148779 (and (bvsle from!3339 pivot!34) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle pivot!34 (size!45965 a!3961)))))

(assert (=> d!148779 (= (arrayCountValidKeys!0 a!3961 from!3339 pivot!34) lt!607940)))

(declare-fun b!1380380 () Bool)

(assert (=> b!1380380 (= e!782175 #b00000000000000000000000000000000)))

(declare-fun bm!66189 () Bool)

(assert (=> bm!66189 (= call!66192 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(assert (= (and d!148779 c!128352) b!1380380))

(assert (= (and d!148779 (not c!128352)) b!1380378))

(assert (= (and b!1380378 c!128353) b!1380377))

(assert (= (and b!1380378 (not c!128353)) b!1380379))

(assert (= (or b!1380377 b!1380379) bm!66189))

(declare-fun m!1265569 () Bool)

(assert (=> b!1380378 m!1265569))

(assert (=> b!1380378 m!1265569))

(declare-fun m!1265571 () Bool)

(assert (=> b!1380378 m!1265571))

(declare-fun m!1265573 () Bool)

(assert (=> bm!66189 m!1265573))

(assert (=> bm!66159 d!148779))

(declare-fun b!1380381 () Bool)

(declare-fun e!782176 () (_ BitVec 32))

(declare-fun call!66193 () (_ BitVec 32))

(assert (=> b!1380381 (= e!782176 (bvadd #b00000000000000000000000000000001 call!66193))))

(declare-fun b!1380382 () Bool)

(declare-fun e!782177 () (_ BitVec 32))

(assert (=> b!1380382 (= e!782177 e!782176)))

(declare-fun c!128355 () Bool)

(assert (=> b!1380382 (= c!128355 (validKeyInArray!0 (select (arr!45415 a!3961) from!3339)))))

(declare-fun b!1380383 () Bool)

(assert (=> b!1380383 (= e!782176 call!66193)))

(declare-fun d!148785 () Bool)

(declare-fun lt!607941 () (_ BitVec 32))

(assert (=> d!148785 (and (bvsge lt!607941 #b00000000000000000000000000000000) (bvsle lt!607941 (bvsub (size!45965 a!3961) from!3339)))))

(assert (=> d!148785 (= lt!607941 e!782177)))

(declare-fun c!128354 () Bool)

(assert (=> d!148785 (= c!128354 (bvsge from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148785 (and (bvsle from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45965 a!3961)))))

(assert (=> d!148785 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607941)))

(declare-fun b!1380384 () Bool)

(assert (=> b!1380384 (= e!782177 #b00000000000000000000000000000000)))

(declare-fun bm!66190 () Bool)

(assert (=> bm!66190 (= call!66193 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (= (and d!148785 c!128354) b!1380384))

(assert (= (and d!148785 (not c!128354)) b!1380382))

(assert (= (and b!1380382 c!128355) b!1380381))

(assert (= (and b!1380382 (not c!128355)) b!1380383))

(assert (= (or b!1380381 b!1380383) bm!66190))

(assert (=> b!1380382 m!1265569))

(assert (=> b!1380382 m!1265569))

(assert (=> b!1380382 m!1265571))

(declare-fun m!1265575 () Bool)

(assert (=> bm!66190 m!1265575))

(assert (=> bm!66160 d!148785))

(push 1)

(assert (not d!148769))

(assert (not bm!66179))

(assert (not d!148759))

(assert (not bm!66189))

(assert (not b!1380382))

(assert (not b!1380378))

(assert (not b!1380359))

(assert (not d!148757))

(assert (not bm!66178))

(assert (not bm!66190))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> bm!66179 d!148785))

(declare-fun d!148823 () Bool)

(assert (=> d!148823 (= (validKeyInArray!0 (select (arr!45415 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))) (and (not (= (select (arr!45415 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45415 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380359 d!148823))

(declare-fun d!148825 () Bool)

(assert (=> d!148825 (= (validKeyInArray!0 (select (arr!45415 a!3961) from!3339)) (and (not (= (select (arr!45415 a!3961) from!3339) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45415 a!3961) from!3339) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380378 d!148825))

(assert (=> d!148759 d!148785))

(declare-fun b!1380445 () Bool)

(declare-fun e!782208 () (_ BitVec 32))

(declare-fun call!66218 () (_ BitVec 32))

(assert (=> b!1380445 (= e!782208 (bvadd #b00000000000000000000000000000001 call!66218))))

(declare-fun b!1380446 () Bool)

(declare-fun e!782209 () (_ BitVec 32))

(assert (=> b!1380446 (= e!782209 e!782208)))

(declare-fun c!128387 () Bool)

(assert (=> b!1380446 (= c!128387 (validKeyInArray!0 (select (arr!45415 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(declare-fun b!1380447 () Bool)

(assert (=> b!1380447 (= e!782208 call!66218)))

(declare-fun d!148827 () Bool)

(declare-fun lt!607954 () (_ BitVec 32))

(assert (=> d!148827 (and (bvsge lt!607954 #b00000000000000000000000000000000) (bvsle lt!607954 (bvsub (size!45965 a!3961) (bvadd #b00000000000000000000000000000001 pivot!34))))))

(assert (=> d!148827 (= lt!607954 e!782209)))

(declare-fun c!128386 () Bool)

(assert (=> d!148827 (= c!128386 (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) to!135))))

(assert (=> d!148827 (and (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) to!135) (bvsge (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000000) (bvsle to!135 (size!45965 a!3961)))))

(assert (=> d!148827 (= (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34) to!135) lt!607954)))

(declare-fun b!1380448 () Bool)

(assert (=> b!1380448 (= e!782209 #b00000000000000000000000000000000)))

(declare-fun bm!66215 () Bool)

(assert (=> bm!66215 (= call!66218 (arrayCountValidKeys!0 a!3961 (bvadd #b00000000000000000000000000000001 pivot!34 #b00000000000000000000000000000001) to!135))))

(assert (= (and d!148827 c!128386) b!1380448))

(assert (= (and d!148827 (not c!128386)) b!1380446))

(assert (= (and b!1380446 c!128387) b!1380445))

(assert (= (and b!1380446 (not c!128387)) b!1380447))

(assert (= (or b!1380445 b!1380447) bm!66215))

(declare-fun m!1265617 () Bool)

(assert (=> b!1380446 m!1265617))

(assert (=> b!1380446 m!1265617))

(declare-fun m!1265619 () Bool)

(assert (=> b!1380446 m!1265619))

(declare-fun m!1265621 () Bool)

(assert (=> bm!66215 m!1265621))

(assert (=> d!148759 d!148827))

(declare-fun b!1380449 () Bool)

(declare-fun e!782210 () (_ BitVec 32))

(declare-fun call!66219 () (_ BitVec 32))

(assert (=> b!1380449 (= e!782210 (bvadd #b00000000000000000000000000000001 call!66219))))

(declare-fun b!1380450 () Bool)

(declare-fun e!782211 () (_ BitVec 32))

(assert (=> b!1380450 (= e!782211 e!782210)))

(declare-fun c!128389 () Bool)

(assert (=> b!1380450 (= c!128389 (validKeyInArray!0 (select (arr!45415 a!3961) from!3339)))))

(declare-fun b!1380451 () Bool)

(assert (=> b!1380451 (= e!782210 call!66219)))

(declare-fun d!148829 () Bool)

(declare-fun lt!607955 () (_ BitVec 32))

(assert (=> d!148829 (and (bvsge lt!607955 #b00000000000000000000000000000000) (bvsle lt!607955 (bvsub (size!45965 a!3961) from!3339)))))

(assert (=> d!148829 (= lt!607955 e!782211)))

(declare-fun c!128388 () Bool)

(assert (=> d!148829 (= c!128388 (bvsge from!3339 to!135))))

(assert (=> d!148829 (and (bvsle from!3339 to!135) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle to!135 (size!45965 a!3961)))))

(assert (=> d!148829 (= (arrayCountValidKeys!0 a!3961 from!3339 to!135) lt!607955)))

(declare-fun b!1380452 () Bool)

(assert (=> b!1380452 (= e!782211 #b00000000000000000000000000000000)))

(declare-fun bm!66216 () Bool)

(assert (=> bm!66216 (= call!66219 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) to!135))))

(assert (= (and d!148829 c!128388) b!1380452))

(assert (= (and d!148829 (not c!128388)) b!1380450))

(assert (= (and b!1380450 c!128389) b!1380449))

(assert (= (and b!1380450 (not c!128389)) b!1380451))

(assert (= (or b!1380449 b!1380451) bm!66216))

(assert (=> b!1380450 m!1265569))

(assert (=> b!1380450 m!1265569))

(assert (=> b!1380450 m!1265571))

(declare-fun m!1265623 () Bool)

(assert (=> bm!66216 m!1265623))

(assert (=> d!148759 d!148829))

(declare-fun b!1380453 () Bool)

(declare-fun e!782212 () (_ BitVec 32))

(declare-fun call!66220 () (_ BitVec 32))

(assert (=> b!1380453 (= e!782212 (bvadd #b00000000000000000000000000000001 call!66220))))

(declare-fun b!1380454 () Bool)

(declare-fun e!782213 () (_ BitVec 32))

(assert (=> b!1380454 (= e!782213 e!782212)))

(declare-fun c!128391 () Bool)

(assert (=> b!1380454 (= c!128391 (validKeyInArray!0 (select (arr!45415 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380455 () Bool)

(assert (=> b!1380455 (= e!782212 call!66220)))

(declare-fun d!148831 () Bool)

(declare-fun lt!607956 () (_ BitVec 32))

(assert (=> d!148831 (and (bvsge lt!607956 #b00000000000000000000000000000000) (bvsle lt!607956 (bvsub (size!45965 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148831 (= lt!607956 e!782213)))

(declare-fun c!128390 () Bool)

(assert (=> d!148831 (= c!128390 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (=> d!148831 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 pivot!34) (size!45965 a!3961)))))

(assert (=> d!148831 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)) lt!607956)))

(declare-fun b!1380456 () Bool)

(assert (=> b!1380456 (= e!782213 #b00000000000000000000000000000000)))

(declare-fun bm!66217 () Bool)

(assert (=> bm!66217 (= call!66220 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 pivot!34)))))

(assert (= (and d!148831 c!128390) b!1380456))

(assert (= (and d!148831 (not c!128390)) b!1380454))

(assert (= (and b!1380454 c!128391) b!1380453))

(assert (= (and b!1380454 (not c!128391)) b!1380455))

(assert (= (or b!1380453 b!1380455) bm!66217))

(declare-fun m!1265625 () Bool)

(assert (=> b!1380454 m!1265625))

(assert (=> b!1380454 m!1265625))

(declare-fun m!1265627 () Bool)

(assert (=> b!1380454 m!1265627))

(declare-fun m!1265629 () Bool)

(assert (=> bm!66217 m!1265629))

(assert (=> bm!66190 d!148831))

(assert (=> d!148757 d!148779))

(declare-fun b!1380457 () Bool)

(declare-fun e!782214 () (_ BitVec 32))

(declare-fun call!66221 () (_ BitVec 32))

(assert (=> b!1380457 (= e!782214 (bvadd #b00000000000000000000000000000001 call!66221))))

(declare-fun b!1380458 () Bool)

(declare-fun e!782215 () (_ BitVec 32))

(assert (=> b!1380458 (= e!782215 e!782214)))

(declare-fun c!128393 () Bool)

(assert (=> b!1380458 (= c!128393 (validKeyInArray!0 (select (arr!45415 a!3961) pivot!34)))))

(declare-fun b!1380459 () Bool)

(assert (=> b!1380459 (= e!782214 call!66221)))

(declare-fun d!148833 () Bool)

(declare-fun lt!607957 () (_ BitVec 32))

(assert (=> d!148833 (and (bvsge lt!607957 #b00000000000000000000000000000000) (bvsle lt!607957 (bvsub (size!45965 a!3961) pivot!34)))))

(assert (=> d!148833 (= lt!607957 e!782215)))

(declare-fun c!128392 () Bool)

(assert (=> d!148833 (= c!128392 (bvsge pivot!34 to!135))))

(assert (=> d!148833 (and (bvsle pivot!34 to!135) (bvsge pivot!34 #b00000000000000000000000000000000) (bvsle to!135 (size!45965 a!3961)))))

(assert (=> d!148833 (= (arrayCountValidKeys!0 a!3961 pivot!34 to!135) lt!607957)))

(declare-fun b!1380460 () Bool)

(assert (=> b!1380460 (= e!782215 #b00000000000000000000000000000000)))

(declare-fun bm!66218 () Bool)

(assert (=> bm!66218 (= call!66221 (arrayCountValidKeys!0 a!3961 (bvadd pivot!34 #b00000000000000000000000000000001) to!135))))

(assert (= (and d!148833 c!128392) b!1380460))

(assert (= (and d!148833 (not c!128392)) b!1380458))

(assert (= (and b!1380458 c!128393) b!1380457))

(assert (= (and b!1380458 (not c!128393)) b!1380459))

(assert (= (or b!1380457 b!1380459) bm!66218))

(assert (=> b!1380458 m!1265499))

(assert (=> b!1380458 m!1265499))

(assert (=> b!1380458 m!1265501))

(declare-fun m!1265631 () Bool)

(assert (=> bm!66218 m!1265631))

(assert (=> d!148757 d!148833))

(assert (=> d!148757 d!148829))

(assert (=> b!1380382 d!148825))

(declare-fun b!1380461 () Bool)

(declare-fun e!782216 () (_ BitVec 32))

(declare-fun call!66222 () (_ BitVec 32))

(assert (=> b!1380461 (= e!782216 (bvadd #b00000000000000000000000000000001 call!66222))))

(declare-fun b!1380462 () Bool)

(declare-fun e!782217 () (_ BitVec 32))

(assert (=> b!1380462 (= e!782217 e!782216)))

(declare-fun c!128395 () Bool)

(assert (=> b!1380462 (= c!128395 (validKeyInArray!0 (select (arr!45415 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(declare-fun b!1380463 () Bool)

(assert (=> b!1380463 (= e!782216 call!66222)))

(declare-fun d!148835 () Bool)

(declare-fun lt!607958 () (_ BitVec 32))

(assert (=> d!148835 (and (bvsge lt!607958 #b00000000000000000000000000000000) (bvsle lt!607958 (bvsub (size!45965 a!3961) (bvadd from!3339 #b00000000000000000000000000000001))))))

(assert (=> d!148835 (= lt!607958 e!782217)))

(declare-fun c!128394 () Bool)

(assert (=> d!148835 (= c!128394 (bvsge (bvadd from!3339 #b00000000000000000000000000000001) pivot!34))))

(assert (=> d!148835 (and (bvsle (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) (bvsge (bvadd from!3339 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle pivot!34 (size!45965 a!3961)))))

(assert (=> d!148835 (= (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) pivot!34) lt!607958)))

(declare-fun b!1380464 () Bool)

(assert (=> b!1380464 (= e!782217 #b00000000000000000000000000000000)))

(declare-fun bm!66219 () Bool)

(assert (=> bm!66219 (= call!66222 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001 #b00000000000000000000000000000001) pivot!34))))

(assert (= (and d!148835 c!128394) b!1380464))

(assert (= (and d!148835 (not c!128394)) b!1380462))

(assert (= (and b!1380462 c!128395) b!1380461))

(assert (= (and b!1380462 (not c!128395)) b!1380463))

(assert (= (or b!1380461 b!1380463) bm!66219))

(assert (=> b!1380462 m!1265625))

(assert (=> b!1380462 m!1265625))

(assert (=> b!1380462 m!1265627))

(declare-fun m!1265633 () Bool)

(assert (=> bm!66219 m!1265633))

(assert (=> bm!66189 d!148835))

(declare-fun b!1380465 () Bool)

(declare-fun e!782218 () (_ BitVec 32))

(declare-fun call!66223 () (_ BitVec 32))

(assert (=> b!1380465 (= e!782218 (bvadd #b00000000000000000000000000000001 call!66223))))

(declare-fun b!1380466 () Bool)

(declare-fun e!782219 () (_ BitVec 32))

(assert (=> b!1380466 (= e!782219 e!782218)))

(declare-fun c!128397 () Bool)

(assert (=> b!1380466 (= c!128397 (validKeyInArray!0 (select (arr!45415 a!3961) from!3339)))))

(declare-fun b!1380467 () Bool)

(assert (=> b!1380467 (= e!782218 call!66223)))

(declare-fun d!148837 () Bool)

(declare-fun lt!607959 () (_ BitVec 32))

(assert (=> d!148837 (and (bvsge lt!607959 #b00000000000000000000000000000000) (bvsle lt!607959 (bvsub (size!45965 a!3961) from!3339)))))

(assert (=> d!148837 (= lt!607959 e!782219)))

(declare-fun c!128396 () Bool)

(assert (=> d!148837 (= c!128396 (bvsge from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (=> d!148837 (and (bvsle from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) (bvsge from!3339 #b00000000000000000000000000000000) (bvsle (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001) (size!45965 a!3961)))))

(assert (=> d!148837 (= (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)) lt!607959)))

(declare-fun b!1380468 () Bool)

(assert (=> b!1380468 (= e!782219 #b00000000000000000000000000000000)))

(declare-fun bm!66220 () Bool)

(assert (=> bm!66220 (= call!66223 (arrayCountValidKeys!0 a!3961 (bvadd from!3339 #b00000000000000000000000000000001) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(assert (= (and d!148837 c!128396) b!1380468))

(assert (= (and d!148837 (not c!128396)) b!1380466))

(assert (= (and b!1380466 c!128397) b!1380465))

(assert (= (and b!1380466 (not c!128397)) b!1380467))

(assert (= (or b!1380465 b!1380467) bm!66220))

(assert (=> b!1380466 m!1265569))

(assert (=> b!1380466 m!1265569))

(assert (=> b!1380466 m!1265571))

(declare-fun m!1265635 () Bool)

(assert (=> bm!66220 m!1265635))

(assert (=> bm!66178 d!148837))

(declare-fun bm!66226 () Bool)

(declare-fun call!66229 () (_ BitVec 32))

(assert (=> bm!66226 (= call!66229 (arrayCountValidKeys!0 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)))))

(declare-fun call!66228 () (_ BitVec 32))

(declare-fun bm!66225 () Bool)

(assert (=> bm!66225 (= call!66228 (arrayCountValidKeys!0 a!3961 from!3339 (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001)))))

(declare-fun d!148839 () Bool)

(declare-fun e!782222 () Bool)

(assert (=> d!148839 e!782222))

(declare-fun c!128400 () Bool)

(assert (=> d!148839 (= c!128400 (validKeyInArray!0 (select (arr!45415 a!3961) (bvsub (bvadd #b00000000000000000000000000000001 pivot!34) #b00000000000000000000000000000001))))))

(assert (=> d!148839 true))

(declare-fun _$73!20 () Unit!45961)

(assert (=> d!148839 (= (choose!86 a!3961 from!3339 (bvadd #b00000000000000000000000000000001 pivot!34)) _$73!20)))

(declare-fun b!1380473 () Bool)

(assert (=> b!1380473 (= e!782222 (= (bvadd call!66228 #b00000000000000000000000000000001) call!66229))))

(declare-fun b!1380474 () Bool)

(assert (=> b!1380474 (= e!782222 (= call!66228 call!66229))))

(assert (= (and d!148839 c!128400) b!1380473))

(assert (= (and d!148839 (not c!128400)) b!1380474))

(assert (= (or b!1380473 b!1380474) bm!66225))

(assert (= (or b!1380473 b!1380474) bm!66226))

(assert (=> bm!66226 m!1265505))

(assert (=> bm!66225 m!1265549))

(assert (=> d!148839 m!1265551))

(assert (=> d!148839 m!1265551))

(assert (=> d!148839 m!1265553))

(assert (=> d!148769 d!148839))

(push 1)

(assert (not b!1380462))

(assert (not bm!66219))

(assert (not bm!66225))

(assert (not b!1380466))

(assert (not bm!66216))

(assert (not bm!66218))

(assert (not bm!66226))

(assert (not b!1380450))

(assert (not b!1380446))

(assert (not bm!66215))

(assert (not b!1380458))

(assert (not bm!66217))

(assert (not b!1380454))

(assert (not bm!66220))

(assert (not d!148839))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

