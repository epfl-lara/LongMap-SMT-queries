; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117212 () Bool)

(assert start!117212)

(declare-datatypes ((array!93829 0))(
  ( (array!93830 (arr!45315 (Array (_ BitVec 32) (_ BitVec 64))) (size!45865 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93829)

(declare-fun lt!607323 () (_ BitVec 32))

(declare-fun lt!607321 () (_ BitVec 32))

(declare-fun from!3466 () (_ BitVec 32))

(declare-fun e!781335 () Bool)

(declare-fun b!1379271 () Bool)

(declare-fun i!1451 () (_ BitVec 32))

(assert (=> b!1379271 (= e!781335 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45865 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (= lt!607321 (bvsub lt!607323 #b00000000000000000000000000000001)))))))

(declare-fun lt!607328 () (_ BitVec 32))

(declare-fun lt!607327 () (_ BitVec 32))

(assert (=> b!1379271 (= (bvadd lt!607328 lt!607327) lt!607321)))

(declare-fun lt!607324 () array!93829)

(declare-fun arrayCountValidKeys!0 (array!93829 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379271 (= lt!607321 (arrayCountValidKeys!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379271 (= lt!607328 (arrayCountValidKeys!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45857 0))(
  ( (Unit!45858) )
))
(declare-fun lt!607325 () Unit!45857)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45857)

(assert (=> b!1379271 (= lt!607325 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607326 () (_ BitVec 32))

(declare-fun lt!607329 () (_ BitVec 32))

(assert (=> b!1379271 (= (bvadd lt!607326 lt!607329) lt!607323)))

(assert (=> b!1379271 (= lt!607323 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379271 (= lt!607326 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607322 () Unit!45857)

(assert (=> b!1379271 (= lt!607322 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379272 () Bool)

(declare-fun res!921808 () Bool)

(declare-fun e!781337 () Bool)

(assert (=> b!1379272 (=> (not res!921808) (not e!781337))))

(assert (=> b!1379272 (= res!921808 (and (bvslt (size!45865 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45865 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379273 () Bool)

(declare-fun res!921807 () Bool)

(assert (=> b!1379273 (=> (not res!921807) (not e!781337))))

(declare-fun k0!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379273 (= res!921807 (not (validKeyInArray!0 k0!2953)))))

(declare-fun b!1379274 () Bool)

(assert (=> b!1379274 (= e!781337 e!781335)))

(declare-fun res!921806 () Bool)

(assert (=> b!1379274 (=> (not res!921806) (not e!781335))))

(assert (=> b!1379274 (= res!921806 (and (= lt!607327 (bvsub lt!607329 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379274 (= lt!607327 (arrayCountValidKeys!0 lt!607324 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379274 (= lt!607329 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379274 (= lt!607324 (array!93830 (store (arr!45315 a!4094) i!1451 k0!2953) (size!45865 a!4094)))))

(declare-fun res!921804 () Bool)

(assert (=> start!117212 (=> (not res!921804) (not e!781337))))

(assert (=> start!117212 (= res!921804 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45865 a!4094))))))

(assert (=> start!117212 e!781337))

(assert (=> start!117212 true))

(declare-fun array_inv!34343 (array!93829) Bool)

(assert (=> start!117212 (array_inv!34343 a!4094)))

(declare-fun b!1379270 () Bool)

(declare-fun res!921805 () Bool)

(assert (=> b!1379270 (=> (not res!921805) (not e!781337))))

(assert (=> b!1379270 (= res!921805 (validKeyInArray!0 (select (arr!45315 a!4094) i!1451)))))

(assert (= (and start!117212 res!921804) b!1379270))

(assert (= (and b!1379270 res!921805) b!1379273))

(assert (= (and b!1379273 res!921807) b!1379272))

(assert (= (and b!1379272 res!921808) b!1379274))

(assert (= (and b!1379274 res!921806) b!1379271))

(declare-fun m!1264283 () Bool)

(assert (=> b!1379270 m!1264283))

(assert (=> b!1379270 m!1264283))

(declare-fun m!1264285 () Bool)

(assert (=> b!1379270 m!1264285))

(declare-fun m!1264287 () Bool)

(assert (=> b!1379274 m!1264287))

(declare-fun m!1264289 () Bool)

(assert (=> b!1379274 m!1264289))

(declare-fun m!1264291 () Bool)

(assert (=> b!1379274 m!1264291))

(declare-fun m!1264293 () Bool)

(assert (=> start!117212 m!1264293))

(declare-fun m!1264295 () Bool)

(assert (=> b!1379271 m!1264295))

(declare-fun m!1264297 () Bool)

(assert (=> b!1379271 m!1264297))

(declare-fun m!1264299 () Bool)

(assert (=> b!1379271 m!1264299))

(declare-fun m!1264301 () Bool)

(assert (=> b!1379271 m!1264301))

(declare-fun m!1264303 () Bool)

(assert (=> b!1379271 m!1264303))

(declare-fun m!1264305 () Bool)

(assert (=> b!1379271 m!1264305))

(declare-fun m!1264307 () Bool)

(assert (=> b!1379273 m!1264307))

(check-sat (not b!1379271) (not b!1379270) (not b!1379274) (not b!1379273) (not start!117212))
(check-sat)
(get-model)

(declare-fun b!1379298 () Bool)

(declare-fun e!781352 () (_ BitVec 32))

(assert (=> b!1379298 (= e!781352 #b00000000000000000000000000000000)))

(declare-fun b!1379299 () Bool)

(declare-fun e!781351 () (_ BitVec 32))

(declare-fun call!66064 () (_ BitVec 32))

(assert (=> b!1379299 (= e!781351 call!66064)))

(declare-fun b!1379300 () Bool)

(assert (=> b!1379300 (= e!781352 e!781351)))

(declare-fun c!128177 () Bool)

(assert (=> b!1379300 (= c!128177 (validKeyInArray!0 (select (arr!45315 lt!607324) from!3466)))))

(declare-fun b!1379301 () Bool)

(assert (=> b!1379301 (= e!781351 (bvadd #b00000000000000000000000000000001 call!66064))))

(declare-fun d!148523 () Bool)

(declare-fun lt!607359 () (_ BitVec 32))

(assert (=> d!148523 (and (bvsge lt!607359 #b00000000000000000000000000000000) (bvsle lt!607359 (bvsub (size!45865 lt!607324) from!3466)))))

(assert (=> d!148523 (= lt!607359 e!781352)))

(declare-fun c!128178 () Bool)

(assert (=> d!148523 (= c!128178 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148523 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45865 lt!607324)))))

(assert (=> d!148523 (= (arrayCountValidKeys!0 lt!607324 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607359)))

(declare-fun bm!66061 () Bool)

(assert (=> bm!66061 (= call!66064 (arrayCountValidKeys!0 lt!607324 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and d!148523 c!128178) b!1379298))

(assert (= (and d!148523 (not c!128178)) b!1379300))

(assert (= (and b!1379300 c!128177) b!1379301))

(assert (= (and b!1379300 (not c!128177)) b!1379299))

(assert (= (or b!1379301 b!1379299) bm!66061))

(declare-fun m!1264335 () Bool)

(assert (=> b!1379300 m!1264335))

(assert (=> b!1379300 m!1264335))

(declare-fun m!1264337 () Bool)

(assert (=> b!1379300 m!1264337))

(declare-fun m!1264339 () Bool)

(assert (=> bm!66061 m!1264339))

(assert (=> b!1379274 d!148523))

(declare-fun b!1379302 () Bool)

(declare-fun e!781354 () (_ BitVec 32))

(assert (=> b!1379302 (= e!781354 #b00000000000000000000000000000000)))

(declare-fun b!1379303 () Bool)

(declare-fun e!781353 () (_ BitVec 32))

(declare-fun call!66065 () (_ BitVec 32))

(assert (=> b!1379303 (= e!781353 call!66065)))

(declare-fun b!1379304 () Bool)

(assert (=> b!1379304 (= e!781354 e!781353)))

(declare-fun c!128179 () Bool)

(assert (=> b!1379304 (= c!128179 (validKeyInArray!0 (select (arr!45315 a!4094) from!3466)))))

(declare-fun b!1379305 () Bool)

(assert (=> b!1379305 (= e!781353 (bvadd #b00000000000000000000000000000001 call!66065))))

(declare-fun d!148525 () Bool)

(declare-fun lt!607360 () (_ BitVec 32))

(assert (=> d!148525 (and (bvsge lt!607360 #b00000000000000000000000000000000) (bvsle lt!607360 (bvsub (size!45865 a!4094) from!3466)))))

(assert (=> d!148525 (= lt!607360 e!781354)))

(declare-fun c!128180 () Bool)

(assert (=> d!148525 (= c!128180 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148525 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45865 a!4094)))))

(assert (=> d!148525 (= (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607360)))

(declare-fun bm!66062 () Bool)

(assert (=> bm!66062 (= call!66065 (arrayCountValidKeys!0 a!4094 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and d!148525 c!128180) b!1379302))

(assert (= (and d!148525 (not c!128180)) b!1379304))

(assert (= (and b!1379304 c!128179) b!1379305))

(assert (= (and b!1379304 (not c!128179)) b!1379303))

(assert (= (or b!1379305 b!1379303) bm!66062))

(declare-fun m!1264341 () Bool)

(assert (=> b!1379304 m!1264341))

(assert (=> b!1379304 m!1264341))

(declare-fun m!1264343 () Bool)

(assert (=> b!1379304 m!1264343))

(declare-fun m!1264345 () Bool)

(assert (=> bm!66062 m!1264345))

(assert (=> b!1379274 d!148525))

(declare-fun d!148527 () Bool)

(assert (=> d!148527 (= (validKeyInArray!0 (select (arr!45315 a!4094) i!1451)) (and (not (= (select (arr!45315 a!4094) i!1451) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45315 a!4094) i!1451) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379270 d!148527))

(declare-fun b!1379306 () Bool)

(declare-fun e!781356 () (_ BitVec 32))

(assert (=> b!1379306 (= e!781356 #b00000000000000000000000000000000)))

(declare-fun b!1379307 () Bool)

(declare-fun e!781355 () (_ BitVec 32))

(declare-fun call!66066 () (_ BitVec 32))

(assert (=> b!1379307 (= e!781355 call!66066)))

(declare-fun b!1379308 () Bool)

(assert (=> b!1379308 (= e!781356 e!781355)))

(declare-fun c!128181 () Bool)

(assert (=> b!1379308 (= c!128181 (validKeyInArray!0 (select (arr!45315 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379309 () Bool)

(assert (=> b!1379309 (= e!781355 (bvadd #b00000000000000000000000000000001 call!66066))))

(declare-fun d!148529 () Bool)

(declare-fun lt!607361 () (_ BitVec 32))

(assert (=> d!148529 (and (bvsge lt!607361 #b00000000000000000000000000000000) (bvsle lt!607361 (bvsub (size!45865 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!148529 (= lt!607361 e!781356)))

(declare-fun c!128182 () Bool)

(assert (=> d!148529 (= c!128182 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148529 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45865 a!4094)))))

(assert (=> d!148529 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607361)))

(declare-fun bm!66063 () Bool)

(assert (=> bm!66063 (= call!66066 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and d!148529 c!128182) b!1379306))

(assert (= (and d!148529 (not c!128182)) b!1379308))

(assert (= (and b!1379308 c!128181) b!1379309))

(assert (= (and b!1379308 (not c!128181)) b!1379307))

(assert (= (or b!1379309 b!1379307) bm!66063))

(declare-fun m!1264347 () Bool)

(assert (=> b!1379308 m!1264347))

(assert (=> b!1379308 m!1264347))

(declare-fun m!1264349 () Bool)

(assert (=> b!1379308 m!1264349))

(declare-fun m!1264351 () Bool)

(assert (=> bm!66063 m!1264351))

(assert (=> b!1379271 d!148529))

(declare-fun d!148531 () Bool)

(assert (=> d!148531 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607364 () Unit!45857)

(declare-fun choose!61 (array!93829 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45857)

(assert (=> d!148531 (= lt!607364 (choose!61 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148531 (and (bvslt (size!45865 a!4094) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45865 a!4094)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148531 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607364)))

(declare-fun bs!39725 () Bool)

(assert (= bs!39725 d!148531))

(assert (=> bs!39725 m!1264295))

(assert (=> bs!39725 m!1264289))

(assert (=> bs!39725 m!1264299))

(declare-fun m!1264353 () Bool)

(assert (=> bs!39725 m!1264353))

(assert (=> b!1379271 d!148531))

(declare-fun b!1379310 () Bool)

(declare-fun e!781358 () (_ BitVec 32))

(assert (=> b!1379310 (= e!781358 #b00000000000000000000000000000000)))

(declare-fun b!1379311 () Bool)

(declare-fun e!781357 () (_ BitVec 32))

(declare-fun call!66067 () (_ BitVec 32))

(assert (=> b!1379311 (= e!781357 call!66067)))

(declare-fun b!1379312 () Bool)

(assert (=> b!1379312 (= e!781358 e!781357)))

(declare-fun c!128183 () Bool)

(assert (=> b!1379312 (= c!128183 (validKeyInArray!0 (select (arr!45315 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379313 () Bool)

(assert (=> b!1379313 (= e!781357 (bvadd #b00000000000000000000000000000001 call!66067))))

(declare-fun d!148533 () Bool)

(declare-fun lt!607365 () (_ BitVec 32))

(assert (=> d!148533 (and (bvsge lt!607365 #b00000000000000000000000000000000) (bvsle lt!607365 (bvsub (size!45865 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!148533 (= lt!607365 e!781358)))

(declare-fun c!128184 () Bool)

(assert (=> d!148533 (= c!128184 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148533 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45865 a!4094)))))

(assert (=> d!148533 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607365)))

(declare-fun bm!66064 () Bool)

(assert (=> bm!66064 (= call!66067 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(assert (= (and d!148533 c!128184) b!1379310))

(assert (= (and d!148533 (not c!128184)) b!1379312))

(assert (= (and b!1379312 c!128183) b!1379313))

(assert (= (and b!1379312 (not c!128183)) b!1379311))

(assert (= (or b!1379313 b!1379311) bm!66064))

(assert (=> b!1379312 m!1264347))

(assert (=> b!1379312 m!1264347))

(assert (=> b!1379312 m!1264349))

(declare-fun m!1264355 () Bool)

(assert (=> bm!66064 m!1264355))

(assert (=> b!1379271 d!148533))

(declare-fun d!148535 () Bool)

(assert (=> d!148535 (= (bvadd (arrayCountValidKeys!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 lt!607324 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607366 () Unit!45857)

(assert (=> d!148535 (= lt!607366 (choose!61 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148535 (and (bvslt (size!45865 lt!607324) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45865 lt!607324)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148535 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607366)))

(declare-fun bs!39726 () Bool)

(assert (= bs!39726 d!148535))

(assert (=> bs!39726 m!1264305))

(assert (=> bs!39726 m!1264287))

(assert (=> bs!39726 m!1264297))

(declare-fun m!1264357 () Bool)

(assert (=> bs!39726 m!1264357))

(assert (=> b!1379271 d!148535))

(declare-fun b!1379314 () Bool)

(declare-fun e!781360 () (_ BitVec 32))

(assert (=> b!1379314 (= e!781360 #b00000000000000000000000000000000)))

(declare-fun b!1379315 () Bool)

(declare-fun e!781359 () (_ BitVec 32))

(declare-fun call!66068 () (_ BitVec 32))

(assert (=> b!1379315 (= e!781359 call!66068)))

(declare-fun b!1379316 () Bool)

(assert (=> b!1379316 (= e!781360 e!781359)))

(declare-fun c!128185 () Bool)

(assert (=> b!1379316 (= c!128185 (validKeyInArray!0 (select (arr!45315 lt!607324) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379317 () Bool)

(assert (=> b!1379317 (= e!781359 (bvadd #b00000000000000000000000000000001 call!66068))))

(declare-fun d!148537 () Bool)

(declare-fun lt!607367 () (_ BitVec 32))

(assert (=> d!148537 (and (bvsge lt!607367 #b00000000000000000000000000000000) (bvsle lt!607367 (bvsub (size!45865 lt!607324) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!148537 (= lt!607367 e!781360)))

(declare-fun c!128186 () Bool)

(assert (=> d!148537 (= c!128186 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148537 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45865 lt!607324)))))

(assert (=> d!148537 (= (arrayCountValidKeys!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607367)))

(declare-fun bm!66065 () Bool)

(assert (=> bm!66065 (= call!66068 (arrayCountValidKeys!0 lt!607324 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (= (and d!148537 c!128186) b!1379314))

(assert (= (and d!148537 (not c!128186)) b!1379316))

(assert (= (and b!1379316 c!128185) b!1379317))

(assert (= (and b!1379316 (not c!128185)) b!1379315))

(assert (= (or b!1379317 b!1379315) bm!66065))

(declare-fun m!1264359 () Bool)

(assert (=> b!1379316 m!1264359))

(assert (=> b!1379316 m!1264359))

(declare-fun m!1264361 () Bool)

(assert (=> b!1379316 m!1264361))

(declare-fun m!1264363 () Bool)

(assert (=> bm!66065 m!1264363))

(assert (=> b!1379271 d!148537))

(declare-fun b!1379318 () Bool)

(declare-fun e!781362 () (_ BitVec 32))

(assert (=> b!1379318 (= e!781362 #b00000000000000000000000000000000)))

(declare-fun b!1379319 () Bool)

(declare-fun e!781361 () (_ BitVec 32))

(declare-fun call!66069 () (_ BitVec 32))

(assert (=> b!1379319 (= e!781361 call!66069)))

(declare-fun b!1379320 () Bool)

(assert (=> b!1379320 (= e!781362 e!781361)))

(declare-fun c!128187 () Bool)

(assert (=> b!1379320 (= c!128187 (validKeyInArray!0 (select (arr!45315 lt!607324) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379321 () Bool)

(assert (=> b!1379321 (= e!781361 (bvadd #b00000000000000000000000000000001 call!66069))))

(declare-fun d!148539 () Bool)

(declare-fun lt!607368 () (_ BitVec 32))

(assert (=> d!148539 (and (bvsge lt!607368 #b00000000000000000000000000000000) (bvsle lt!607368 (bvsub (size!45865 lt!607324) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (=> d!148539 (= lt!607368 e!781362)))

(declare-fun c!128188 () Bool)

(assert (=> d!148539 (= c!128188 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148539 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45865 lt!607324)))))

(assert (=> d!148539 (= (arrayCountValidKeys!0 lt!607324 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607368)))

(declare-fun bm!66066 () Bool)

(assert (=> bm!66066 (= call!66069 (arrayCountValidKeys!0 lt!607324 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(assert (= (and d!148539 c!128188) b!1379318))

(assert (= (and d!148539 (not c!128188)) b!1379320))

(assert (= (and b!1379320 c!128187) b!1379321))

(assert (= (and b!1379320 (not c!128187)) b!1379319))

(assert (= (or b!1379321 b!1379319) bm!66066))

(assert (=> b!1379320 m!1264359))

(assert (=> b!1379320 m!1264359))

(assert (=> b!1379320 m!1264361))

(declare-fun m!1264365 () Bool)

(assert (=> bm!66066 m!1264365))

(assert (=> b!1379271 d!148539))

(declare-fun d!148541 () Bool)

(assert (=> d!148541 (= (validKeyInArray!0 k0!2953) (and (not (= k0!2953 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2953 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379273 d!148541))

(declare-fun d!148543 () Bool)

(assert (=> d!148543 (= (array_inv!34343 a!4094) (bvsge (size!45865 a!4094) #b00000000000000000000000000000000))))

(assert (=> start!117212 d!148543))

(check-sat (not b!1379304) (not b!1379316) (not bm!66062) (not bm!66064) (not b!1379312) (not b!1379308) (not d!148535) (not b!1379300) (not b!1379320) (not d!148531) (not bm!66066) (not bm!66065) (not bm!66061) (not bm!66063))
(check-sat)
