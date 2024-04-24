; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117858 () Bool)

(assert start!117858)

(declare-fun to!105 () (_ BitVec 32))

(declare-fun from!3309 () (_ BitVec 32))

(declare-fun bm!66476 () Bool)

(declare-fun call!66480 () (_ BitVec 32))

(declare-datatypes ((array!94260 0))(
  ( (array!94261 (arr!45518 (Array (_ BitVec 32) (_ BitVec 64))) (size!46069 (_ BitVec 32))) )
))
(declare-fun a!3931 () array!94260)

(declare-fun arrayCountValidKeys!0 (array!94260 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> bm!66476 (= call!66480 (arrayCountValidKeys!0 a!3931 from!3309 to!105))))

(declare-fun b!1382125 () Bool)

(declare-fun e!783435 () Bool)

(declare-fun call!66479 () (_ BitVec 32))

(declare-fun call!66482 () (_ BitVec 32))

(assert (=> b!1382125 (= e!783435 (= call!66479 call!66482))))

(declare-fun bm!66477 () Bool)

(assert (=> bm!66477 (= call!66479 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun call!66481 () (_ BitVec 32))

(declare-fun bm!66478 () Bool)

(assert (=> bm!66478 (= call!66481 (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun bm!66479 () Bool)

(assert (=> bm!66479 (= call!66482 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun res!923232 () Bool)

(declare-fun e!783438 () Bool)

(assert (=> start!117858 (=> (not res!923232) (not e!783438))))

(assert (=> start!117858 (= res!923232 (and (bvslt (size!46069 a!3931) #b01111111111111111111111111111111) (bvsge from!3309 #b00000000000000000000000000000000) (bvsgt to!105 from!3309) (bvsle to!105 (size!46069 a!3931)) (bvslt (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000)))))

(assert (=> start!117858 e!783438))

(declare-fun array_inv!34799 (array!94260) Bool)

(assert (=> start!117858 (array_inv!34799 a!3931)))

(assert (=> start!117858 true))

(declare-fun b!1382126 () Bool)

(declare-fun e!783436 () Bool)

(assert (=> b!1382126 (= e!783438 (not e!783436))))

(declare-fun c!128894 () Bool)

(declare-fun lt!608568 () Bool)

(assert (=> b!1382126 (= c!128894 lt!608568)))

(assert (=> b!1382126 e!783435))

(declare-fun c!128895 () Bool)

(assert (=> b!1382126 (= c!128895 lt!608568)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382126 (= lt!608568 (validKeyInArray!0 (select (arr!45518 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(declare-datatypes ((Unit!45958 0))(
  ( (Unit!45959) )
))
(declare-fun lt!608569 () Unit!45958)

(declare-fun lemmaCountingValidKeysAtTheEnd!0 (array!94260 (_ BitVec 32) (_ BitVec 32)) Unit!45958)

(assert (=> b!1382126 (= lt!608569 (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun b!1382127 () Bool)

(assert (=> b!1382127 (= e!783436 (= call!66481 call!66480))))

(declare-fun b!1382128 () Bool)

(assert (=> b!1382128 (= e!783436 (= (bvadd #b00000000000000000000000000000001 call!66481) call!66480))))

(declare-fun b!1382129 () Bool)

(assert (=> b!1382129 (= e!783435 (= (bvadd #b00000000000000000000000000000001 call!66479) call!66482))))

(assert (= (and start!117858 res!923232) b!1382126))

(assert (= (and b!1382126 c!128895) b!1382129))

(assert (= (and b!1382126 (not c!128895)) b!1382125))

(assert (= (or b!1382129 b!1382125) bm!66479))

(assert (= (or b!1382129 b!1382125) bm!66477))

(assert (= (and b!1382126 c!128894) b!1382128))

(assert (= (and b!1382126 (not c!128894)) b!1382127))

(assert (= (or b!1382128 b!1382127) bm!66476))

(assert (= (or b!1382128 b!1382127) bm!66478))

(declare-fun m!1267703 () Bool)

(assert (=> bm!66478 m!1267703))

(declare-fun m!1267705 () Bool)

(assert (=> bm!66477 m!1267705))

(declare-fun m!1267707 () Bool)

(assert (=> bm!66479 m!1267707))

(declare-fun m!1267709 () Bool)

(assert (=> bm!66476 m!1267709))

(declare-fun m!1267711 () Bool)

(assert (=> b!1382126 m!1267711))

(assert (=> b!1382126 m!1267711))

(declare-fun m!1267713 () Bool)

(assert (=> b!1382126 m!1267713))

(declare-fun m!1267715 () Bool)

(assert (=> b!1382126 m!1267715))

(declare-fun m!1267717 () Bool)

(assert (=> start!117858 m!1267717))

(push 1)

(assert (not bm!66477))

(assert (not bm!66478))

(assert (not bm!66476))

(assert (not b!1382126))

(assert (not bm!66479))

(assert (not start!117858))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!66518 () Bool)

(declare-fun call!66521 () (_ BitVec 32))

(assert (=> bm!66518 (= call!66521 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun d!149363 () Bool)

(declare-fun lt!608602 () (_ BitVec 32))

(assert (=> d!149363 (and (bvsge lt!608602 #b00000000000000000000000000000000) (bvsle lt!608602 (bvsub (size!46069 a!3931) from!3309)))))

(declare-fun e!783492 () (_ BitVec 32))

(assert (=> d!149363 (= lt!608602 e!783492)))

(declare-fun c!128936 () Bool)

(assert (=> d!149363 (= c!128936 (bvsge from!3309 to!105))))

(assert (=> d!149363 (and (bvsle from!3309 to!105) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle to!105 (size!46069 a!3931)))))

(assert (=> d!149363 (= (arrayCountValidKeys!0 a!3931 from!3309 to!105) lt!608602)))

(declare-fun b!1382219 () Bool)

(declare-fun e!783491 () (_ BitVec 32))

(assert (=> b!1382219 (= e!783491 call!66521)))

(declare-fun b!1382220 () Bool)

(assert (=> b!1382220 (= e!783492 e!783491)))

(declare-fun c!128937 () Bool)

(assert (=> b!1382220 (= c!128937 (validKeyInArray!0 (select (arr!45518 a!3931) from!3309)))))

(declare-fun b!1382221 () Bool)

(assert (=> b!1382221 (= e!783492 #b00000000000000000000000000000000)))

(declare-fun b!1382222 () Bool)

(assert (=> b!1382222 (= e!783491 (bvadd #b00000000000000000000000000000001 call!66521))))

(assert (= (and d!149363 c!128936) b!1382221))

(assert (= (and d!149363 (not c!128936)) b!1382220))

(assert (= (and b!1382220 c!128937) b!1382222))

(assert (= (and b!1382220 (not c!128937)) b!1382219))

(assert (= (or b!1382222 b!1382219) bm!66518))

(declare-fun m!1267771 () Bool)

(assert (=> bm!66518 m!1267771))

(declare-fun m!1267773 () Bool)

(assert (=> b!1382220 m!1267773))

(assert (=> b!1382220 m!1267773))

(declare-fun m!1267775 () Bool)

(assert (=> b!1382220 m!1267775))

(assert (=> bm!66476 d!149363))

(declare-fun d!149365 () Bool)

(assert (=> d!149365 (= (validKeyInArray!0 (select (arr!45518 a!3931) (bvsub to!105 #b00000000000000000000000000000001))) (and (not (= (select (arr!45518 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45518 a!3931) (bvsub to!105 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382126 d!149365))

(declare-fun call!66527 () (_ BitVec 32))

(declare-fun bm!66523 () Bool)

(assert (=> bm!66523 (= call!66527 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(declare-fun bm!66524 () Bool)

(declare-fun call!66526 () (_ BitVec 32))

(assert (=> bm!66524 (= call!66526 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun b!1382229 () Bool)

(declare-fun e!783498 () Bool)

(assert (=> b!1382229 (= e!783498 (= call!66526 call!66527))))

(declare-fun b!1382230 () Bool)

(assert (=> b!1382230 (= e!783498 (= (bvadd call!66526 #b00000000000000000000000000000001) call!66527))))

(declare-fun d!149367 () Bool)

(declare-fun e!783497 () Bool)

(assert (=> d!149367 e!783497))

(declare-fun res!923244 () Bool)

(assert (=> d!149367 (=> (not res!923244) (not e!783497))))

(declare-fun lt!608607 () (_ BitVec 32))

(assert (=> d!149367 (= res!923244 (and (bvsge lt!608607 #b00000000000000000000000000000000) (bvslt lt!608607 (size!46069 a!3931))))))

(assert (=> d!149367 (= lt!608607 (bvsub to!105 #b00000000000000000000000000000001))))

(declare-fun lt!608608 () Unit!45958)

(declare-fun choose!86 (array!94260 (_ BitVec 32) (_ BitVec 32)) Unit!45958)

(assert (=> d!149367 (= lt!608608 (choose!86 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!149367 (and (bvslt (size!46069 a!3931) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsgt to!105 (bvadd #b00000000000000000000000000000001 from!3309)) (bvsle to!105 (size!46069 a!3931)))))

(assert (=> d!149367 (= (lemmaCountingValidKeysAtTheEnd!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608608)))

(declare-fun b!1382231 () Bool)

(assert (=> b!1382231 (= e!783497 e!783498)))

(declare-fun c!128940 () Bool)

(assert (=> b!1382231 (= c!128940 (validKeyInArray!0 (select (arr!45518 a!3931) (bvsub to!105 #b00000000000000000000000000000001))))))

(assert (= (and d!149367 res!923244) b!1382231))

(assert (= (and b!1382231 c!128940) b!1382230))

(assert (= (and b!1382231 (not c!128940)) b!1382229))

(assert (= (or b!1382230 b!1382229) bm!66523))

(assert (= (or b!1382230 b!1382229) bm!66524))

(assert (=> bm!66523 m!1267707))

(assert (=> bm!66524 m!1267705))

(declare-fun m!1267777 () Bool)

(assert (=> d!149367 m!1267777))

(assert (=> b!1382231 m!1267711))

(assert (=> b!1382231 m!1267711))

(assert (=> b!1382231 m!1267713))

(assert (=> b!1382126 d!149367))

(declare-fun call!66528 () (_ BitVec 32))

(declare-fun bm!66525 () Bool)

(assert (=> bm!66525 (= call!66528 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) to!105))))

(declare-fun d!149369 () Bool)

(declare-fun lt!608609 () (_ BitVec 32))

(assert (=> d!149369 (and (bvsge lt!608609 #b00000000000000000000000000000000) (bvsle lt!608609 (bvsub (size!46069 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun e!783500 () (_ BitVec 32))

(assert (=> d!149369 (= lt!608609 e!783500)))

(declare-fun c!128941 () Bool)

(assert (=> d!149369 (= c!128941 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) to!105))))

(assert (=> d!149369 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) to!105) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle to!105 (size!46069 a!3931)))))

(assert (=> d!149369 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) to!105) lt!608609)))

(declare-fun b!1382232 () Bool)

(declare-fun e!783499 () (_ BitVec 32))

(assert (=> b!1382232 (= e!783499 call!66528)))

(declare-fun b!1382233 () Bool)

(assert (=> b!1382233 (= e!783500 e!783499)))

(declare-fun c!128942 () Bool)

(assert (=> b!1382233 (= c!128942 (validKeyInArray!0 (select (arr!45518 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun b!1382234 () Bool)

(assert (=> b!1382234 (= e!783500 #b00000000000000000000000000000000)))

(declare-fun b!1382235 () Bool)

(assert (=> b!1382235 (= e!783499 (bvadd #b00000000000000000000000000000001 call!66528))))

(assert (= (and d!149369 c!128941) b!1382234))

(assert (= (and d!149369 (not c!128941)) b!1382233))

(assert (= (and b!1382233 c!128942) b!1382235))

(assert (= (and b!1382233 (not c!128942)) b!1382232))

(assert (= (or b!1382235 b!1382232) bm!66525))

(declare-fun m!1267779 () Bool)

(assert (=> bm!66525 m!1267779))

(declare-fun m!1267781 () Bool)

(assert (=> b!1382233 m!1267781))

(assert (=> b!1382233 m!1267781))

(declare-fun m!1267783 () Bool)

(assert (=> b!1382233 m!1267783))

(assert (=> bm!66479 d!149369))

(declare-fun bm!66526 () Bool)

(declare-fun call!66529 () (_ BitVec 32))

(assert (=> bm!66526 (= call!66529 (arrayCountValidKeys!0 a!3931 (bvadd from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun d!149371 () Bool)

(declare-fun lt!608610 () (_ BitVec 32))

(assert (=> d!149371 (and (bvsge lt!608610 #b00000000000000000000000000000000) (bvsle lt!608610 (bvsub (size!46069 a!3931) from!3309)))))

(declare-fun e!783502 () (_ BitVec 32))

(assert (=> d!149371 (= lt!608610 e!783502)))

(declare-fun c!128943 () Bool)

(assert (=> d!149371 (= c!128943 (bvsge from!3309 (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!149371 (and (bvsle from!3309 (bvsub to!105 #b00000000000000000000000000000001)) (bvsge from!3309 #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46069 a!3931)))))

(assert (=> d!149371 (= (arrayCountValidKeys!0 a!3931 from!3309 (bvsub to!105 #b00000000000000000000000000000001)) lt!608610)))

(declare-fun b!1382236 () Bool)

(declare-fun e!783501 () (_ BitVec 32))

(assert (=> b!1382236 (= e!783501 call!66529)))

(declare-fun b!1382237 () Bool)

(assert (=> b!1382237 (= e!783502 e!783501)))

(declare-fun c!128944 () Bool)

(assert (=> b!1382237 (= c!128944 (validKeyInArray!0 (select (arr!45518 a!3931) from!3309)))))

(declare-fun b!1382238 () Bool)

(assert (=> b!1382238 (= e!783502 #b00000000000000000000000000000000)))

(declare-fun b!1382239 () Bool)

(assert (=> b!1382239 (= e!783501 (bvadd #b00000000000000000000000000000001 call!66529))))

(assert (= (and d!149371 c!128943) b!1382238))

(assert (= (and d!149371 (not c!128943)) b!1382237))

(assert (= (and b!1382237 c!128944) b!1382239))

(assert (= (and b!1382237 (not c!128944)) b!1382236))

(assert (= (or b!1382239 b!1382236) bm!66526))

(declare-fun m!1267785 () Bool)

(assert (=> bm!66526 m!1267785))

(assert (=> b!1382237 m!1267773))

(assert (=> b!1382237 m!1267773))

(assert (=> b!1382237 m!1267775))

(assert (=> bm!66478 d!149371))

(declare-fun bm!66527 () Bool)

(declare-fun call!66530 () (_ BitVec 32))

(assert (=> bm!66527 (= call!66530 (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309 #b00000000000000000000000000000001) (bvsub to!105 #b00000000000000000000000000000001)))))

(declare-fun d!149373 () Bool)

(declare-fun lt!608611 () (_ BitVec 32))

(assert (=> d!149373 (and (bvsge lt!608611 #b00000000000000000000000000000000) (bvsle lt!608611 (bvsub (size!46069 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun e!783504 () (_ BitVec 32))

(assert (=> d!149373 (= lt!608611 e!783504)))

(declare-fun c!128945 () Bool)

(assert (=> d!149373 (= c!128945 (bvsge (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)))))

(assert (=> d!149373 (and (bvsle (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 from!3309) #b00000000000000000000000000000000) (bvsle (bvsub to!105 #b00000000000000000000000000000001) (size!46069 a!3931)))))

(assert (=> d!149373 (= (arrayCountValidKeys!0 a!3931 (bvadd #b00000000000000000000000000000001 from!3309) (bvsub to!105 #b00000000000000000000000000000001)) lt!608611)))

(declare-fun b!1382240 () Bool)

(declare-fun e!783503 () (_ BitVec 32))

(assert (=> b!1382240 (= e!783503 call!66530)))

(declare-fun b!1382241 () Bool)

(assert (=> b!1382241 (= e!783504 e!783503)))

(declare-fun c!128946 () Bool)

(assert (=> b!1382241 (= c!128946 (validKeyInArray!0 (select (arr!45518 a!3931) (bvadd #b00000000000000000000000000000001 from!3309))))))

(declare-fun b!1382242 () Bool)

(assert (=> b!1382242 (= e!783504 #b00000000000000000000000000000000)))

(declare-fun b!1382243 () Bool)

(assert (=> b!1382243 (= e!783503 (bvadd #b00000000000000000000000000000001 call!66530))))

(assert (= (and d!149373 c!128945) b!1382242))

(assert (= (and d!149373 (not c!128945)) b!1382241))

(assert (= (and b!1382241 c!128946) b!1382243))

(assert (= (and b!1382241 (not c!128946)) b!1382240))

(assert (= (or b!1382243 b!1382240) bm!66527))

(declare-fun m!1267787 () Bool)

(assert (=> bm!66527 m!1267787))

(assert (=> b!1382241 m!1267781))

(assert (=> b!1382241 m!1267781))

(assert (=> b!1382241 m!1267783))

(assert (=> bm!66477 d!149373))

(declare-fun d!149375 () Bool)

(assert (=> d!149375 (= (array_inv!34799 a!3931) (bvsge (size!46069 a!3931) #b00000000000000000000000000000000))))

(assert (=> start!117858 d!149375))

(push 1)

(assert (not b!1382220))

(assert (not b!1382233))

(assert (not bm!66523))

(assert (not b!1382241))

(assert (not bm!66524))

(assert (not d!149367))

(assert (not bm!66525))

(assert (not bm!66518))

(assert (not bm!66527))

(assert (not b!1382237))

(assert (not b!1382231))

(assert (not bm!66526))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

