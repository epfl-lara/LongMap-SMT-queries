; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117662 () Bool)

(assert start!117662)

(declare-fun b!1380949 () Bool)

(declare-fun e!782679 () Bool)

(declare-fun call!66474 () (_ BitVec 32))

(declare-fun call!66475 () (_ BitVec 32))

(assert (=> b!1380949 (= e!782679 (not (= call!66474 call!66475)))))

(declare-fun res!922729 () Bool)

(declare-fun e!782681 () Bool)

(assert (=> start!117662 (=> (not res!922729) (not e!782681))))

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-datatypes ((array!94159 0))(
  ( (array!94160 (arr!45471 (Array (_ BitVec 32) (_ BitVec 64))) (size!46021 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94159)

(assert (=> start!117662 (= res!922729 (and (bvslt (size!46021 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46021 a!3931)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105)))))

(assert (=> start!117662 e!782681))

(declare-fun array_inv!34499 (array!94159) Bool)

(assert (=> start!117662 (array_inv!34499 a!3931)))

(assert (=> start!117662 true))

(declare-fun b!1380950 () Bool)

(assert (=> b!1380950 (= e!782681 e!782679)))

(declare-fun c!128550 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1380950 (= c!128550 (validKeyInArray!0 (select (arr!45471 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-fun bm!66471 () Bool)

(declare-fun arrayCountValidKeys!0 (array!94159 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66471 (= call!66475 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun b!1380951 () Bool)

(assert (=> b!1380951 (= e!782679 (not (= (bvadd #b00000000000000000000000000000001 call!66474) call!66475)))))

(declare-fun bm!66472 () Bool)

(assert (=> bm!66472 (= call!66474 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (= (and start!117662 res!922729) b!1380950))

(assert (= (and b!1380950 c!128550) b!1380951))

(assert (= (and b!1380950 (not c!128550)) b!1380949))

(assert (= (or b!1380951 b!1380949) bm!66471))

(assert (= (or b!1380951 b!1380949) bm!66472))

(declare-fun m!1266169 () Bool)

(assert (=> start!117662 m!1266169))

(declare-fun m!1266171 () Bool)

(assert (=> b!1380950 m!1266171))

(assert (=> b!1380950 m!1266171))

(declare-fun m!1266173 () Bool)

(assert (=> b!1380950 m!1266173))

(declare-fun m!1266175 () Bool)

(assert (=> bm!66471 m!1266175))

(declare-fun m!1266177 () Bool)

(assert (=> bm!66472 m!1266177))

(check-sat (not bm!66471) (not bm!66472) (not start!117662) (not b!1380950))
(check-sat)
(get-model)

(declare-fun d!148921 () Bool)

(declare-fun lt!608133 () (_ BitVec 32))

(assert (=> d!148921 (and (bvsge lt!608133 #b00000000000000000000000000000000) (bvsle lt!608133 (bvsub (size!46021 a!3931) from!3309)))))

(declare-fun e!782696 () (_ BitVec 32))

(assert (=> d!148921 (= lt!608133 e!782696)))

(declare-fun c!128559 () Bool)

(assert (=> d!148921 (= c!128559 (bvsge from!3309 to!105))))

(assert (=> d!148921 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46021 a!3931)))))

(assert (=> d!148921 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608133)))

(declare-fun b!1380969 () Bool)

(declare-fun e!782695 () (_ BitVec 32))

(declare-fun call!66484 () (_ BitVec 32))

(assert (=> b!1380969 (= e!782695 (bvadd #b00000000000000000000000000000001 call!66484))))

(declare-fun b!1380970 () Bool)

(assert (=> b!1380970 (= e!782695 call!66484)))

(declare-fun bm!66481 () Bool)

(assert (=> bm!66481 (= call!66484 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1380971 () Bool)

(assert (=> b!1380971 (= e!782696 e!782695)))

(declare-fun c!128558 () Bool)

(assert (=> b!1380971 (= c!128558 (validKeyInArray!0 (select (arr!45471 a!3931) from!3309)))))

(declare-fun b!1380972 () Bool)

(assert (=> b!1380972 (= e!782696 #b00000000000000000000000000000000)))

(assert (= (and d!148921 c!128559) b!1380972))

(assert (= (and d!148921 (not c!128559)) b!1380971))

(assert (= (and b!1380971 c!128558) b!1380969))

(assert (= (and b!1380971 (not c!128558)) b!1380970))

(assert (= (or b!1380969 b!1380970) bm!66481))

(declare-fun m!1266189 () Bool)

(assert (=> bm!66481 m!1266189))

(declare-fun m!1266191 () Bool)

(assert (=> b!1380971 m!1266191))

(assert (=> b!1380971 m!1266191))

(declare-fun m!1266193 () Bool)

(assert (=> b!1380971 m!1266193))

(assert (=> bm!66471 d!148921))

(declare-fun d!148927 () Bool)

(declare-fun lt!608134 () (_ BitVec 32))

(assert (=> d!148927 (and (bvsge lt!608134 #b00000000000000000000000000000000) (bvsle lt!608134 (bvsub (size!46021 a!3931) from!3309)))))

(declare-fun e!782698 () (_ BitVec 32))

(assert (=> d!148927 (= lt!608134 e!782698)))

(declare-fun c!128561 () Bool)

(assert (=> d!148927 (= c!128561 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148927 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46021 a!3931)))))

(assert (=> d!148927 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608134)))

(declare-fun b!1380973 () Bool)

(declare-fun e!782697 () (_ BitVec 32))

(declare-fun call!66485 () (_ BitVec 32))

(assert (=> b!1380973 (= e!782697 (bvadd #b00000000000000000000000000000001 call!66485))))

(declare-fun b!1380974 () Bool)

(assert (=> b!1380974 (= e!782697 call!66485)))

(declare-fun bm!66482 () Bool)

(assert (=> bm!66482 (= call!66485 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1380975 () Bool)

(assert (=> b!1380975 (= e!782698 e!782697)))

(declare-fun c!128560 () Bool)

(assert (=> b!1380975 (= c!128560 (validKeyInArray!0 (select (arr!45471 a!3931) from!3309)))))

(declare-fun b!1380976 () Bool)

(assert (=> b!1380976 (= e!782698 #b00000000000000000000000000000000)))

(assert (= (and d!148927 c!128561) b!1380976))

(assert (= (and d!148927 (not c!128561)) b!1380975))

(assert (= (and b!1380975 c!128560) b!1380973))

(assert (= (and b!1380975 (not c!128560)) b!1380974))

(assert (= (or b!1380973 b!1380974) bm!66482))

(declare-fun m!1266195 () Bool)

(assert (=> bm!66482 m!1266195))

(assert (=> b!1380975 m!1266191))

(assert (=> b!1380975 m!1266191))

(assert (=> b!1380975 m!1266193))

(assert (=> bm!66472 d!148927))

(declare-fun d!148929 () Bool)

(assert (=> d!148929 (= (array_inv!34499 a!3931) (bvsge (size!46021 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117662 d!148929))

(declare-fun d!148931 () Bool)

(assert (=> d!148931 (= (validKeyInArray!0 (select (arr!45471 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45471 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45471 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380950 d!148931))

(check-sat (not bm!66482) (not b!1380975) (not bm!66481) (not b!1380971))
(check-sat)
(get-model)

(declare-fun d!148945 () Bool)

(declare-fun lt!608143 () (_ BitVec 32))

(assert (=> d!148945 (and (bvsge lt!608143 #b00000000000000000000000000000000) (bvsle lt!608143 (bvsub (size!46021 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun e!782716 () (_ BitVec 32))

(assert (=> d!148945 (= lt!608143 e!782716)))

(declare-fun c!128579 () Bool)

(assert (=> d!148945 (= c!128579 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!148945 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46021 a!3931)))))

(assert (=> d!148945 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)) lt!608143)))

(declare-fun b!1381009 () Bool)

(declare-fun e!782715 () (_ BitVec 32))

(declare-fun call!66494 () (_ BitVec 32))

(assert (=> b!1381009 (= e!782715 (bvadd #b00000000000000000000000000000001 call!66494))))

(declare-fun b!1381010 () Bool)

(assert (=> b!1381010 (= e!782715 call!66494)))

(declare-fun bm!66491 () Bool)

(assert (=> bm!66491 (= call!66494 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1381011 () Bool)

(assert (=> b!1381011 (= e!782716 e!782715)))

(declare-fun c!128578 () Bool)

(assert (=> b!1381011 (= c!128578 (validKeyInArray!0 (select (arr!45471 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun b!1381012 () Bool)

(assert (=> b!1381012 (= e!782716 #b00000000000000000000000000000000)))

(assert (= (and d!148945 c!128579) b!1381012))

(assert (= (and d!148945 (not c!128579)) b!1381011))

(assert (= (and b!1381011 c!128578) b!1381009))

(assert (= (and b!1381011 (not c!128578)) b!1381010))

(assert (= (or b!1381009 b!1381010) bm!66491))

(declare-fun m!1266213 () Bool)

(assert (=> bm!66491 m!1266213))

(declare-fun m!1266215 () Bool)

(assert (=> b!1381011 m!1266215))

(assert (=> b!1381011 m!1266215))

(declare-fun m!1266217 () Bool)

(assert (=> b!1381011 m!1266217))

(assert (=> bm!66482 d!148945))

(declare-fun d!148947 () Bool)

(assert (=> d!148947 (= (validKeyInArray!0 (select (arr!45471 a!3931) from!3309)) (and (not (= (select (arr!45471 a!3931) from!3309) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45471 a!3931) from!3309) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1380975 d!148947))

(declare-fun d!148949 () Bool)

(declare-fun lt!608144 () (_ BitVec 32))

(assert (=> d!148949 (and (bvsge lt!608144 #b00000000000000000000000000000000) (bvsle lt!608144 (bvsub (size!46021 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun e!782718 () (_ BitVec 32))

(assert (=> d!148949 (= lt!608144 e!782718)))

(declare-fun c!128581 () Bool)

(assert (=> d!148949 (= c!128581 (bvsge (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(assert (=> d!148949 (and (bvsle (bvadd from!3309 #b00000000000000000000000000000001) to!105) (bvsge (bvadd from!3309 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!105 (size!46021 a!3931)))))

(assert (=> d!148949 (= (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105) lt!608144)))

(declare-fun b!1381013 () Bool)

(declare-fun e!782717 () (_ BitVec 32))

(declare-fun call!66495 () (_ BitVec 32))

(assert (=> b!1381013 (= e!782717 (bvadd #b00000000000000000000000000000001 call!66495))))

(declare-fun b!1381014 () Bool)

(assert (=> b!1381014 (= e!782717 call!66495)))

(declare-fun bm!66492 () Bool)

(assert (=> bm!66492 (= call!66495 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!105))))

(declare-fun b!1381015 () Bool)

(assert (=> b!1381015 (= e!782718 e!782717)))

(declare-fun c!128580 () Bool)

(assert (=> b!1381015 (= c!128580 (validKeyInArray!0 (select (arr!45471 a!3931) (bvadd from!3309 #b00000000000000000000000000000001))))))

(declare-fun b!1381016 () Bool)

(assert (=> b!1381016 (= e!782718 #b00000000000000000000000000000000)))

(assert (= (and d!148949 c!128581) b!1381016))

(assert (= (and d!148949 (not c!128581)) b!1381015))

(assert (= (and b!1381015 c!128580) b!1381013))

(assert (= (and b!1381015 (not c!128580)) b!1381014))

(assert (= (or b!1381013 b!1381014) bm!66492))

(declare-fun m!1266219 () Bool)

(assert (=> bm!66492 m!1266219))

(assert (=> b!1381015 m!1266215))

(assert (=> b!1381015 m!1266215))

(assert (=> b!1381015 m!1266217))

(assert (=> bm!66481 d!148949))

(assert (=> b!1380971 d!148947))

(check-sat (not bm!66491) (not bm!66492) (not b!1381011) (not b!1381015))
