; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117210 () Bool)

(assert start!117210)

(declare-fun b!1379255 () Bool)

(declare-fun res!921792 () Bool)

(declare-fun e!781326 () Bool)

(assert (=> b!1379255 (=> (not res!921792) (not e!781326))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379255 (= res!921792 (not (validKeyInArray!0 k!2953)))))

(declare-fun res!921789 () Bool)

(assert (=> start!117210 (=> (not res!921789) (not e!781326))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93827 0))(
  ( (array!93828 (arr!45314 (Array (_ BitVec 32) (_ BitVec 64))) (size!45864 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93827)

(assert (=> start!117210 (= res!921789 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45864 a!4094))))))

(assert (=> start!117210 e!781326))

(assert (=> start!117210 true))

(declare-fun array_inv!34342 (array!93827) Bool)

(assert (=> start!117210 (array_inv!34342 a!4094)))

(declare-fun b!1379256 () Bool)

(declare-fun res!921793 () Bool)

(assert (=> b!1379256 (=> (not res!921793) (not e!781326))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379256 (= res!921793 (and (bvslt (size!45864 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45864 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun b!1379257 () Bool)

(declare-fun res!921791 () Bool)

(assert (=> b!1379257 (=> (not res!921791) (not e!781326))))

(assert (=> b!1379257 (= res!921791 (validKeyInArray!0 (select (arr!45314 a!4094) i!1451)))))

(declare-fun b!1379258 () Bool)

(declare-fun e!781328 () Bool)

(assert (=> b!1379258 (= e!781326 e!781328)))

(declare-fun res!921790 () Bool)

(assert (=> b!1379258 (=> (not res!921790) (not e!781328))))

(declare-fun lt!607301 () (_ BitVec 32))

(declare-fun lt!607302 () (_ BitVec 32))

(assert (=> b!1379258 (= res!921790 (and (= lt!607302 (bvsub lt!607301 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(declare-fun lt!607297 () array!93827)

(declare-fun arrayCountValidKeys!0 (array!93827 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379258 (= lt!607302 (arrayCountValidKeys!0 lt!607297 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379258 (= lt!607301 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379258 (= lt!607297 (array!93828 (store (arr!45314 a!4094) i!1451 k!2953) (size!45864 a!4094)))))

(declare-fun lt!607294 () (_ BitVec 32))

(declare-fun b!1379259 () Bool)

(declare-fun lt!607298 () (_ BitVec 32))

(assert (=> b!1379259 (= e!781328 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45864 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (= lt!607298 (bvsub lt!607294 #b00000000000000000000000000000001)))))))

(declare-fun lt!607295 () (_ BitVec 32))

(assert (=> b!1379259 (= (bvadd lt!607295 lt!607302) lt!607298)))

(assert (=> b!1379259 (= lt!607298 (arrayCountValidKeys!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379259 (= lt!607295 (arrayCountValidKeys!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45855 0))(
  ( (Unit!45856) )
))
(declare-fun lt!607299 () Unit!45855)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45855)

(assert (=> b!1379259 (= lt!607299 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607300 () (_ BitVec 32))

(assert (=> b!1379259 (= (bvadd lt!607300 lt!607301) lt!607294)))

(assert (=> b!1379259 (= lt!607294 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379259 (= lt!607300 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607296 () Unit!45855)

(assert (=> b!1379259 (= lt!607296 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (= (and start!117210 res!921789) b!1379257))

(assert (= (and b!1379257 res!921791) b!1379255))

(assert (= (and b!1379255 res!921792) b!1379256))

(assert (= (and b!1379256 res!921793) b!1379258))

(assert (= (and b!1379258 res!921790) b!1379259))

(declare-fun m!1264257 () Bool)

(assert (=> b!1379255 m!1264257))

(declare-fun m!1264259 () Bool)

(assert (=> b!1379258 m!1264259))

(declare-fun m!1264261 () Bool)

(assert (=> b!1379258 m!1264261))

(declare-fun m!1264263 () Bool)

(assert (=> b!1379258 m!1264263))

(declare-fun m!1264265 () Bool)

(assert (=> b!1379257 m!1264265))

(assert (=> b!1379257 m!1264265))

(declare-fun m!1264267 () Bool)

(assert (=> b!1379257 m!1264267))

(declare-fun m!1264269 () Bool)

(assert (=> b!1379259 m!1264269))

(declare-fun m!1264271 () Bool)

(assert (=> b!1379259 m!1264271))

(declare-fun m!1264273 () Bool)

(assert (=> b!1379259 m!1264273))

(declare-fun m!1264275 () Bool)

(assert (=> b!1379259 m!1264275))

(declare-fun m!1264277 () Bool)

(assert (=> b!1379259 m!1264277))

(declare-fun m!1264279 () Bool)

(assert (=> b!1379259 m!1264279))

(declare-fun m!1264281 () Bool)

(assert (=> start!117210 m!1264281))

(push 1)

(assert (not start!117210))

(assert (not b!1379259))

(assert (not b!1379258))

(assert (not b!1379257))

(assert (not b!1379255))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1379330 () Bool)

(declare-fun e!781368 () (_ BitVec 32))

(declare-fun call!66072 () (_ BitVec 32))

(assert (=> b!1379330 (= e!781368 (bvadd #b00000000000000000000000000000001 call!66072))))

(declare-fun b!1379331 () Bool)

(assert (=> b!1379331 (= e!781368 call!66072)))

(declare-fun d!148545 () Bool)

(declare-fun lt!607371 () (_ BitVec 32))

(assert (=> d!148545 (and (bvsge lt!607371 #b00000000000000000000000000000000) (bvsle lt!607371 (bvsub (size!45864 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781367 () (_ BitVec 32))

(assert (=> d!148545 (= lt!607371 e!781367)))

(declare-fun c!128193 () Bool)

(assert (=> d!148545 (= c!128193 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148545 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45864 a!4094)))))

(assert (=> d!148545 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607371)))

(declare-fun bm!66069 () Bool)

(assert (=> bm!66069 (= call!66072 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379332 () Bool)

(assert (=> b!1379332 (= e!781367 e!781368)))

(declare-fun c!128194 () Bool)

(assert (=> b!1379332 (= c!128194 (validKeyInArray!0 (select (arr!45314 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379333 () Bool)

(assert (=> b!1379333 (= e!781367 #b00000000000000000000000000000000)))

(assert (= (and d!148545 c!128193) b!1379333))

(assert (= (and d!148545 (not c!128193)) b!1379332))

(assert (= (and b!1379332 c!128194) b!1379330))

(assert (= (and b!1379332 (not c!128194)) b!1379331))

(assert (= (or b!1379330 b!1379331) bm!66069))

(declare-fun m!1264367 () Bool)

(assert (=> bm!66069 m!1264367))

(declare-fun m!1264369 () Bool)

(assert (=> b!1379332 m!1264369))

(assert (=> b!1379332 m!1264369))

(declare-fun m!1264371 () Bool)

(assert (=> b!1379332 m!1264371))

(assert (=> b!1379259 d!148545))

(declare-fun b!1379334 () Bool)

(declare-fun e!781370 () (_ BitVec 32))

(declare-fun call!66073 () (_ BitVec 32))

(assert (=> b!1379334 (= e!781370 (bvadd #b00000000000000000000000000000001 call!66073))))

(declare-fun b!1379335 () Bool)

(assert (=> b!1379335 (= e!781370 call!66073)))

(declare-fun d!148549 () Bool)

(declare-fun lt!607372 () (_ BitVec 32))

(assert (=> d!148549 (and (bvsge lt!607372 #b00000000000000000000000000000000) (bvsle lt!607372 (bvsub (size!45864 lt!607297) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781369 () (_ BitVec 32))

(assert (=> d!148549 (= lt!607372 e!781369)))

(declare-fun c!128195 () Bool)

(assert (=> d!148549 (= c!128195 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148549 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45864 lt!607297)))))

(assert (=> d!148549 (= (arrayCountValidKeys!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607372)))

(declare-fun bm!66070 () Bool)

(assert (=> bm!66070 (= call!66073 (arrayCountValidKeys!0 lt!607297 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379336 () Bool)

(assert (=> b!1379336 (= e!781369 e!781370)))

(declare-fun c!128196 () Bool)

(assert (=> b!1379336 (= c!128196 (validKeyInArray!0 (select (arr!45314 lt!607297) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379337 () Bool)

(assert (=> b!1379337 (= e!781369 #b00000000000000000000000000000000)))

(assert (= (and d!148549 c!128195) b!1379337))

(assert (= (and d!148549 (not c!128195)) b!1379336))

(assert (= (and b!1379336 c!128196) b!1379334))

(assert (= (and b!1379336 (not c!128196)) b!1379335))

(assert (= (or b!1379334 b!1379335) bm!66070))

(declare-fun m!1264373 () Bool)

(assert (=> bm!66070 m!1264373))

(declare-fun m!1264375 () Bool)

(assert (=> b!1379336 m!1264375))

(assert (=> b!1379336 m!1264375))

(declare-fun m!1264377 () Bool)

(assert (=> b!1379336 m!1264377))

(assert (=> b!1379259 d!148549))

(declare-fun b!1379338 () Bool)

(declare-fun e!781372 () (_ BitVec 32))

(declare-fun call!66074 () (_ BitVec 32))

(assert (=> b!1379338 (= e!781372 (bvadd #b00000000000000000000000000000001 call!66074))))

(declare-fun b!1379339 () Bool)

(assert (=> b!1379339 (= e!781372 call!66074)))

(declare-fun d!148551 () Bool)

(declare-fun lt!607373 () (_ BitVec 32))

(assert (=> d!148551 (and (bvsge lt!607373 #b00000000000000000000000000000000) (bvsle lt!607373 (bvsub (size!45864 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781371 () (_ BitVec 32))

(assert (=> d!148551 (= lt!607373 e!781371)))

(declare-fun c!128197 () Bool)

(assert (=> d!148551 (= c!128197 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148551 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45864 a!4094)))))

(assert (=> d!148551 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607373)))

(declare-fun bm!66071 () Bool)

(assert (=> bm!66071 (= call!66074 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1379340 () Bool)

(assert (=> b!1379340 (= e!781371 e!781372)))

(declare-fun c!128198 () Bool)

(assert (=> b!1379340 (= c!128198 (validKeyInArray!0 (select (arr!45314 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379341 () Bool)

(assert (=> b!1379341 (= e!781371 #b00000000000000000000000000000000)))

(assert (= (and d!148551 c!128197) b!1379341))

(assert (= (and d!148551 (not c!128197)) b!1379340))

(assert (= (and b!1379340 c!128198) b!1379338))

(assert (= (and b!1379340 (not c!128198)) b!1379339))

(assert (= (or b!1379338 b!1379339) bm!66071))

(declare-fun m!1264379 () Bool)

(assert (=> bm!66071 m!1264379))

(assert (=> b!1379340 m!1264369))

(assert (=> b!1379340 m!1264369))

(assert (=> b!1379340 m!1264371))

(assert (=> b!1379259 d!148551))

(declare-fun b!1379342 () Bool)

(declare-fun e!781374 () (_ BitVec 32))

(declare-fun call!66075 () (_ BitVec 32))

(assert (=> b!1379342 (= e!781374 (bvadd #b00000000000000000000000000000001 call!66075))))

(declare-fun b!1379343 () Bool)

(assert (=> b!1379343 (= e!781374 call!66075)))

(declare-fun d!148553 () Bool)

(declare-fun lt!607374 () (_ BitVec 32))

(assert (=> d!148553 (and (bvsge lt!607374 #b00000000000000000000000000000000) (bvsle lt!607374 (bvsub (size!45864 lt!607297) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781373 () (_ BitVec 32))

(assert (=> d!148553 (= lt!607374 e!781373)))

(declare-fun c!128199 () Bool)

(assert (=> d!148553 (= c!128199 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148553 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45864 lt!607297)))))

(assert (=> d!148553 (= (arrayCountValidKeys!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607374)))

(declare-fun bm!66072 () Bool)

(assert (=> bm!66072 (= call!66075 (arrayCountValidKeys!0 lt!607297 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1379344 () Bool)

(assert (=> b!1379344 (= e!781373 e!781374)))

(declare-fun c!128200 () Bool)

(assert (=> b!1379344 (= c!128200 (validKeyInArray!0 (select (arr!45314 lt!607297) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun b!1379345 () Bool)

(assert (=> b!1379345 (= e!781373 #b00000000000000000000000000000000)))

(assert (= (and d!148553 c!128199) b!1379345))

(assert (= (and d!148553 (not c!128199)) b!1379344))

(assert (= (and b!1379344 c!128200) b!1379342))

(assert (= (and b!1379344 (not c!128200)) b!1379343))

(assert (= (or b!1379342 b!1379343) bm!66072))

(declare-fun m!1264381 () Bool)

(assert (=> bm!66072 m!1264381))

(assert (=> b!1379344 m!1264375))

(assert (=> b!1379344 m!1264375))

(assert (=> b!1379344 m!1264377))

(assert (=> b!1379259 d!148553))

(declare-fun d!148555 () Bool)

(assert (=> d!148555 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607380 () Unit!45855)

(declare-fun choose!61 (array!93827 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45855)

(assert (=> d!148555 (= lt!607380 (choose!61 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148555 (and (bvslt (size!45864 a!4094) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45864 a!4094)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148555 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607380)))

(declare-fun bs!39727 () Bool)

(assert (= bs!39727 d!148555))

(assert (=> bs!39727 m!1264269))

(assert (=> bs!39727 m!1264261))

(assert (=> bs!39727 m!1264275))

(declare-fun m!1264389 () Bool)

(assert (=> bs!39727 m!1264389))

(assert (=> b!1379259 d!148555))

(declare-fun d!148559 () Bool)

(assert (=> d!148559 (= (bvadd (arrayCountValidKeys!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 lt!607297 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607382 () Unit!45855)

(assert (=> d!148559 (= lt!607382 (choose!61 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148559 (and (bvslt (size!45864 lt!607297) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45864 lt!607297)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148559 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607297 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607382)))

(declare-fun bs!39728 () Bool)

(assert (= bs!39728 d!148559))

(assert (=> bs!39728 m!1264271))

(assert (=> bs!39728 m!1264259))

(assert (=> bs!39728 m!1264273))

(declare-fun m!1264397 () Bool)

(assert (=> bs!39728 m!1264397))

(assert (=> b!1379259 d!148559))

(declare-fun b!1379362 () Bool)

(declare-fun e!781384 () (_ BitVec 32))

(declare-fun call!66080 () (_ BitVec 32))

(assert (=> b!1379362 (= e!781384 (bvadd #b00000000000000000000000000000001 call!66080))))

(declare-fun b!1379363 () Bool)

(assert (=> b!1379363 (= e!781384 call!66080)))

(declare-fun d!148563 () Bool)

(declare-fun lt!607383 () (_ BitVec 32))

(assert (=> d!148563 (and (bvsge lt!607383 #b00000000000000000000000000000000) (bvsle lt!607383 (bvsub (size!45864 lt!607297) from!3466)))))

(declare-fun e!781383 () (_ BitVec 32))

(assert (=> d!148563 (= lt!607383 e!781383)))

(declare-fun c!128209 () Bool)

(assert (=> d!148563 (= c!128209 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148563 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45864 lt!607297)))))

(assert (=> d!148563 (= (arrayCountValidKeys!0 lt!607297 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607383)))

(declare-fun bm!66077 () Bool)

(assert (=> bm!66077 (= call!66080 (arrayCountValidKeys!0 lt!607297 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379364 () Bool)

(assert (=> b!1379364 (= e!781383 e!781384)))

(declare-fun c!128210 () Bool)

(assert (=> b!1379364 (= c!128210 (validKeyInArray!0 (select (arr!45314 lt!607297) from!3466)))))

(declare-fun b!1379365 () Bool)

(assert (=> b!1379365 (= e!781383 #b00000000000000000000000000000000)))

(assert (= (and d!148563 c!128209) b!1379365))

(assert (= (and d!148563 (not c!128209)) b!1379364))

(assert (= (and b!1379364 c!128210) b!1379362))

(assert (= (and b!1379364 (not c!128210)) b!1379363))

(assert (= (or b!1379362 b!1379363) bm!66077))

(declare-fun m!1264399 () Bool)

(assert (=> bm!66077 m!1264399))

(declare-fun m!1264401 () Bool)

(assert (=> b!1379364 m!1264401))

(assert (=> b!1379364 m!1264401))

(declare-fun m!1264403 () Bool)

(assert (=> b!1379364 m!1264403))

(assert (=> b!1379258 d!148563))

(declare-fun b!1379370 () Bool)

(declare-fun e!781388 () (_ BitVec 32))

(declare-fun call!66082 () (_ BitVec 32))

(assert (=> b!1379370 (= e!781388 (bvadd #b00000000000000000000000000000001 call!66082))))

(declare-fun b!1379371 () Bool)

(assert (=> b!1379371 (= e!781388 call!66082)))

(declare-fun d!148567 () Bool)

(declare-fun lt!607385 () (_ BitVec 32))

(assert (=> d!148567 (and (bvsge lt!607385 #b00000000000000000000000000000000) (bvsle lt!607385 (bvsub (size!45864 a!4094) from!3466)))))

(declare-fun e!781387 () (_ BitVec 32))

(assert (=> d!148567 (= lt!607385 e!781387)))

(declare-fun c!128213 () Bool)

(assert (=> d!148567 (= c!128213 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148567 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45864 a!4094)))))

(assert (=> d!148567 (= (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607385)))

(declare-fun bm!66079 () Bool)

(assert (=> bm!66079 (= call!66082 (arrayCountValidKeys!0 a!4094 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379372 () Bool)

(assert (=> b!1379372 (= e!781387 e!781388)))

(declare-fun c!128214 () Bool)

(assert (=> b!1379372 (= c!128214 (validKeyInArray!0 (select (arr!45314 a!4094) from!3466)))))

(declare-fun b!1379373 () Bool)

(assert (=> b!1379373 (= e!781387 #b00000000000000000000000000000000)))

(assert (= (and d!148567 c!128213) b!1379373))

(assert (= (and d!148567 (not c!128213)) b!1379372))

(assert (= (and b!1379372 c!128214) b!1379370))

(assert (= (and b!1379372 (not c!128214)) b!1379371))

(assert (= (or b!1379370 b!1379371) bm!66079))

(declare-fun m!1264411 () Bool)

(assert (=> bm!66079 m!1264411))

(declare-fun m!1264413 () Bool)

(assert (=> b!1379372 m!1264413))

(assert (=> b!1379372 m!1264413))

(declare-fun m!1264415 () Bool)

(assert (=> b!1379372 m!1264415))

(assert (=> b!1379258 d!148567))

(declare-fun d!148571 () Bool)

(assert (=> d!148571 (= (validKeyInArray!0 k!2953) (and (not (= k!2953 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2953 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379255 d!148571))

(declare-fun d!148573 () Bool)

(assert (=> d!148573 (= (array_inv!34342 a!4094) (bvsge (size!45864 a!4094) #b00000000000000000000000000000000))))

(assert (=> start!117210 d!148573))

(declare-fun d!148575 () Bool)

(assert (=> d!148575 (= (validKeyInArray!0 (select (arr!45314 a!4094) i!1451)) (and (not (= (select (arr!45314 a!4094) i!1451) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45314 a!4094) i!1451) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379257 d!148575))

(push 1)

(assert (not bm!66072))

(assert (not bm!66069))

(assert (not b!1379336))

(assert (not bm!66071))

(assert (not b!1379340))

(assert (not d!148555))

(assert (not b!1379364))

(assert (not b!1379372))

(assert (not b!1379332))

(assert (not d!148559))

(assert (not bm!66070))

(assert (not bm!66077))

(assert (not b!1379344))

(assert (not bm!66079))

(check-sat)

(pop 1)

(push 1)

(check-sat)

