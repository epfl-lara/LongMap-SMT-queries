; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116942 () Bool)

(assert start!116942)

(declare-fun res!920400 () Bool)

(declare-fun e!780411 () Bool)

(assert (=> start!116942 (=> (not res!920400) (not e!780411))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93611 0))(
  ( (array!93612 (arr!45209 (Array (_ BitVec 32) (_ BitVec 64))) (size!45759 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93611)

(assert (=> start!116942 (= res!920400 (and (bvslt (size!45759 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45759 a!4212))))))

(assert (=> start!116942 e!780411))

(declare-fun array_inv!34237 (array!93611) Bool)

(assert (=> start!116942 (array_inv!34237 a!4212)))

(assert (=> start!116942 true))

(declare-fun b!1377677 () Bool)

(declare-fun res!920399 () Bool)

(assert (=> b!1377677 (=> (not res!920399) (not e!780411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377677 (= res!920399 (not (validKeyInArray!0 (select (arr!45209 a!4212) to!375))))))

(declare-fun b!1377678 () Bool)

(declare-fun res!920401 () Bool)

(assert (=> b!1377678 (=> (not res!920401) (not e!780411))))

(assert (=> b!1377678 (= res!920401 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377679 () Bool)

(declare-fun lt!606131 () (_ BitVec 32))

(declare-fun lt!606132 () (_ BitVec 32))

(assert (=> b!1377679 (= e!780411 (not (= lt!606131 lt!606132)))))

(declare-fun lt!606130 () (_ BitVec 32))

(assert (=> b!1377679 (= (bvadd lt!606132 lt!606130) lt!606131)))

(declare-fun arrayCountValidKeys!0 (array!93611 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377679 (= lt!606131 (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377679 (= lt!606130 (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377679 (= lt!606132 (arrayCountValidKeys!0 a!4212 from!3579 to!375))))

(declare-datatypes ((Unit!45711 0))(
  ( (Unit!45712) )
))
(declare-fun lt!606133 () Unit!45711)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45711)

(assert (=> b!1377679 (= lt!606133 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116942 res!920400) b!1377677))

(assert (= (and b!1377677 res!920399) b!1377678))

(assert (= (and b!1377678 res!920401) b!1377679))

(declare-fun m!1262069 () Bool)

(assert (=> start!116942 m!1262069))

(declare-fun m!1262071 () Bool)

(assert (=> b!1377677 m!1262071))

(assert (=> b!1377677 m!1262071))

(declare-fun m!1262073 () Bool)

(assert (=> b!1377677 m!1262073))

(declare-fun m!1262075 () Bool)

(assert (=> b!1377679 m!1262075))

(declare-fun m!1262077 () Bool)

(assert (=> b!1377679 m!1262077))

(declare-fun m!1262079 () Bool)

(assert (=> b!1377679 m!1262079))

(declare-fun m!1262081 () Bool)

(assert (=> b!1377679 m!1262081))

(push 1)

(assert (not b!1377677))

(assert (not b!1377679))

(assert (not start!116942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148327 () Bool)

(assert (=> d!148327 (= (validKeyInArray!0 (select (arr!45209 a!4212) to!375)) (and (not (= (select (arr!45209 a!4212) to!375) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45209 a!4212) to!375) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377677 d!148327))

(declare-fun b!1377714 () Bool)

(declare-fun e!780433 () (_ BitVec 32))

(declare-fun call!66019 () (_ BitVec 32))

(assert (=> b!1377714 (= e!780433 (bvadd #b00000000000000000000000000000001 call!66019))))

(declare-fun b!1377715 () Bool)

(declare-fun e!780434 () (_ BitVec 32))

(assert (=> b!1377715 (= e!780434 #b00000000000000000000000000000000)))

(declare-fun b!1377716 () Bool)

(assert (=> b!1377716 (= e!780433 call!66019)))

(declare-fun d!148329 () Bool)

(declare-fun lt!606162 () (_ BitVec 32))

(assert (=> d!148329 (and (bvsge lt!606162 #b00000000000000000000000000000000) (bvsle lt!606162 (bvsub (size!45759 a!4212) from!3579)))))

(assert (=> d!148329 (= lt!606162 e!780434)))

(declare-fun c!128088 () Bool)

(assert (=> d!148329 (= c!128088 (bvsge from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148329 (and (bvsle from!3579 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45759 a!4212)))))

(assert (=> d!148329 (= (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)) lt!606162)))

(declare-fun bm!66016 () Bool)

(assert (=> bm!66016 (= call!66019 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377717 () Bool)

(assert (=> b!1377717 (= e!780434 e!780433)))

(declare-fun c!128087 () Bool)

(assert (=> b!1377717 (= c!128087 (validKeyInArray!0 (select (arr!45209 a!4212) from!3579)))))

(assert (= (and d!148329 c!128088) b!1377715))

(assert (= (and d!148329 (not c!128088)) b!1377717))

(assert (= (and b!1377717 c!128087) b!1377714))

(assert (= (and b!1377717 (not c!128087)) b!1377716))

(assert (= (or b!1377714 b!1377716) bm!66016))

(declare-fun m!1262111 () Bool)

(assert (=> bm!66016 m!1262111))

(declare-fun m!1262113 () Bool)

(assert (=> b!1377717 m!1262113))

(assert (=> b!1377717 m!1262113))

(declare-fun m!1262115 () Bool)

(assert (=> b!1377717 m!1262115))

(assert (=> b!1377679 d!148329))

(declare-fun b!1377720 () Bool)

(declare-fun e!780435 () (_ BitVec 32))

(declare-fun call!66020 () (_ BitVec 32))

(assert (=> b!1377720 (= e!780435 (bvadd #b00000000000000000000000000000001 call!66020))))

(declare-fun b!1377721 () Bool)

(declare-fun e!780436 () (_ BitVec 32))

(assert (=> b!1377721 (= e!780436 #b00000000000000000000000000000000)))

(declare-fun b!1377722 () Bool)

(assert (=> b!1377722 (= e!780435 call!66020)))

(declare-fun d!148341 () Bool)

(declare-fun lt!606165 () (_ BitVec 32))

(assert (=> d!148341 (and (bvsge lt!606165 #b00000000000000000000000000000000) (bvsle lt!606165 (bvsub (size!45759 a!4212) to!375)))))

(assert (=> d!148341 (= lt!606165 e!780436)))

(declare-fun c!128090 () Bool)

(assert (=> d!148341 (= c!128090 (bvsge to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148341 (and (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge to!375 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45759 a!4212)))))

(assert (=> d!148341 (= (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)) lt!606165)))

(declare-fun bm!66017 () Bool)

(assert (=> bm!66017 (= call!66020 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377723 () Bool)

(assert (=> b!1377723 (= e!780436 e!780435)))

(declare-fun c!128089 () Bool)

(assert (=> b!1377723 (= c!128089 (validKeyInArray!0 (select (arr!45209 a!4212) to!375)))))

(assert (= (and d!148341 c!128090) b!1377721))

(assert (= (and d!148341 (not c!128090)) b!1377723))

(assert (= (and b!1377723 c!128089) b!1377720))

(assert (= (and b!1377723 (not c!128089)) b!1377722))

(assert (= (or b!1377720 b!1377722) bm!66017))

(declare-fun m!1262117 () Bool)

(assert (=> bm!66017 m!1262117))

(assert (=> b!1377723 m!1262071))

(assert (=> b!1377723 m!1262071))

(assert (=> b!1377723 m!1262073))

(assert (=> b!1377679 d!148341))

(declare-fun b!1377732 () Bool)

(declare-fun e!780442 () (_ BitVec 32))

(declare-fun call!66024 () (_ BitVec 32))

(assert (=> b!1377732 (= e!780442 (bvadd #b00000000000000000000000000000001 call!66024))))

(declare-fun b!1377734 () Bool)

(declare-fun e!780444 () (_ BitVec 32))

(assert (=> b!1377734 (= e!780444 #b00000000000000000000000000000000)))

(declare-fun b!1377736 () Bool)

(assert (=> b!1377736 (= e!780442 call!66024)))

(declare-fun d!148343 () Bool)

(declare-fun lt!606167 () (_ BitVec 32))

(assert (=> d!148343 (and (bvsge lt!606167 #b00000000000000000000000000000000) (bvsle lt!606167 (bvsub (size!45759 a!4212) from!3579)))))

(assert (=> d!148343 (= lt!606167 e!780444)))

(declare-fun c!128098 () Bool)

(assert (=> d!148343 (= c!128098 (bvsge from!3579 to!375))))

(assert (=> d!148343 (and (bvsle from!3579 to!375) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle to!375 (size!45759 a!4212)))))

(assert (=> d!148343 (= (arrayCountValidKeys!0 a!4212 from!3579 to!375) lt!606167)))

(declare-fun bm!66021 () Bool)

(assert (=> bm!66021 (= call!66024 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1377737 () Bool)

(assert (=> b!1377737 (= e!780444 e!780442)))

(declare-fun c!128097 () Bool)

(assert (=> b!1377737 (= c!128097 (validKeyInArray!0 (select (arr!45209 a!4212) from!3579)))))

(assert (= (and d!148343 c!128098) b!1377734))

(assert (= (and d!148343 (not c!128098)) b!1377737))

(assert (= (and b!1377737 c!128097) b!1377732))

(assert (= (and b!1377737 (not c!128097)) b!1377736))

(assert (= (or b!1377732 b!1377736) bm!66021))

(declare-fun m!1262121 () Bool)

(assert (=> bm!66021 m!1262121))

(assert (=> b!1377737 m!1262113))

(assert (=> b!1377737 m!1262113))

(assert (=> b!1377737 m!1262115))

(assert (=> b!1377679 d!148343))

(declare-fun d!148346 () Bool)

(assert (=> d!148346 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun lt!606175 () Unit!45711)

(declare-fun choose!61 (array!93611 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45711)

(assert (=> d!148346 (= lt!606175 (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (=> d!148346 (and (bvslt (size!45759 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45759 a!4212)) (bvsge to!375 from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148346 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) lt!606175)))

(declare-fun bs!39606 () Bool)

(assert (= bs!39606 d!148346))

(assert (=> bs!39606 m!1262079))

(assert (=> bs!39606 m!1262077))

(assert (=> bs!39606 m!1262075))

(declare-fun m!1262141 () Bool)

(assert (=> bs!39606 m!1262141))

(assert (=> b!1377679 d!148346))

(declare-fun d!148359 () Bool)

(assert (=> d!148359 (= (array_inv!34237 a!4212) (bvsge (size!45759 a!4212) #b00000000000000000000000000000000))))

(assert (=> start!116942 d!148359))

(push 1)

(assert (not b!1377737))

(assert (not d!148346))

(assert (not b!1377723))

(assert (not bm!66021))

(assert (not b!1377717))

(assert (not bm!66017))

(assert (not bm!66016))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!1377723 d!148327))

(declare-fun b!1377770 () Bool)

(declare-fun e!780461 () (_ BitVec 32))

(declare-fun call!66033 () (_ BitVec 32))

(assert (=> b!1377770 (= e!780461 (bvadd #b00000000000000000000000000000001 call!66033))))

(declare-fun b!1377771 () Bool)

(declare-fun e!780462 () (_ BitVec 32))

(assert (=> b!1377771 (= e!780462 #b00000000000000000000000000000000)))

(declare-fun b!1377772 () Bool)

(assert (=> b!1377772 (= e!780461 call!66033)))

(declare-fun d!148373 () Bool)

(declare-fun lt!606185 () (_ BitVec 32))

(assert (=> d!148373 (and (bvsge lt!606185 #b00000000000000000000000000000000) (bvsle lt!606185 (bvsub (size!45759 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (=> d!148373 (= lt!606185 e!780462)))

(declare-fun c!128116 () Bool)

(assert (=> d!148373 (= c!128116 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(assert (=> d!148373 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) to!375) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!375 (size!45759 a!4212)))))

(assert (=> d!148373 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375) lt!606185)))

(declare-fun bm!66030 () Bool)

(assert (=> bm!66030 (= call!66033 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1377773 () Bool)

(assert (=> b!1377773 (= e!780462 e!780461)))

(declare-fun c!128115 () Bool)

(assert (=> b!1377773 (= c!128115 (validKeyInArray!0 (select (arr!45209 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (= (and d!148373 c!128116) b!1377771))

(assert (= (and d!148373 (not c!128116)) b!1377773))

(assert (= (and b!1377773 c!128115) b!1377770))

(assert (= (and b!1377773 (not c!128115)) b!1377772))

(assert (= (or b!1377770 b!1377772) bm!66030))

(declare-fun m!1262161 () Bool)

(assert (=> bm!66030 m!1262161))

(declare-fun m!1262163 () Bool)

(assert (=> b!1377773 m!1262163))

(assert (=> b!1377773 m!1262163))

(declare-fun m!1262165 () Bool)

(assert (=> b!1377773 m!1262165))

(assert (=> bm!66021 d!148373))

(declare-fun d!148375 () Bool)

(assert (=> d!148375 (= (validKeyInArray!0 (select (arr!45209 a!4212) from!3579)) (and (not (= (select (arr!45209 a!4212) from!3579) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45209 a!4212) from!3579) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377737 d!148375))

(assert (=> d!148346 d!148343))

(assert (=> d!148346 d!148341))

(assert (=> d!148346 d!148329))

(declare-fun d!148377 () Bool)

(assert (=> d!148377 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148377 true))

(declare-fun _$76!58 () Unit!45711)

(assert (=> d!148377 (= (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) _$76!58)))

(declare-fun bs!39610 () Bool)

(assert (= bs!39610 d!148377))

(assert (=> bs!39610 m!1262079))

(assert (=> bs!39610 m!1262077))

(assert (=> bs!39610 m!1262075))

(assert (=> d!148346 d!148377))

(declare-fun b!1377774 () Bool)

(declare-fun e!780463 () (_ BitVec 32))

(declare-fun call!66034 () (_ BitVec 32))

(assert (=> b!1377774 (= e!780463 (bvadd #b00000000000000000000000000000001 call!66034))))

(declare-fun b!1377775 () Bool)

(declare-fun e!780464 () (_ BitVec 32))

(assert (=> b!1377775 (= e!780464 #b00000000000000000000000000000000)))

(declare-fun b!1377776 () Bool)

(assert (=> b!1377776 (= e!780463 call!66034)))

(declare-fun d!148379 () Bool)

(declare-fun lt!606186 () (_ BitVec 32))

(assert (=> d!148379 (and (bvsge lt!606186 #b00000000000000000000000000000000) (bvsle lt!606186 (bvsub (size!45759 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (=> d!148379 (= lt!606186 e!780464)))

(declare-fun c!128118 () Bool)

(assert (=> d!148379 (= c!128118 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148379 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45759 a!4212)))))

(assert (=> d!148379 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606186)))

(declare-fun bm!66031 () Bool)

(assert (=> bm!66031 (= call!66034 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377777 () Bool)

(assert (=> b!1377777 (= e!780464 e!780463)))

(declare-fun c!128117 () Bool)

(assert (=> b!1377777 (= c!128117 (validKeyInArray!0 (select (arr!45209 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (= (and d!148379 c!128118) b!1377775))

(assert (= (and d!148379 (not c!128118)) b!1377777))

(assert (= (and b!1377777 c!128117) b!1377774))

(assert (= (and b!1377777 (not c!128117)) b!1377776))

(assert (= (or b!1377774 b!1377776) bm!66031))

(declare-fun m!1262167 () Bool)

(assert (=> bm!66031 m!1262167))

(assert (=> b!1377777 m!1262163))

(assert (=> b!1377777 m!1262163))

(assert (=> b!1377777 m!1262165))

(assert (=> bm!66016 d!148379))

(assert (=> b!1377717 d!148375))

(declare-fun b!1377778 () Bool)

(declare-fun e!780465 () (_ BitVec 32))

(declare-fun call!66035 () (_ BitVec 32))

(assert (=> b!1377778 (= e!780465 (bvadd #b00000000000000000000000000000001 call!66035))))

(declare-fun b!1377779 () Bool)

(declare-fun e!780466 () (_ BitVec 32))

(assert (=> b!1377779 (= e!780466 #b00000000000000000000000000000000)))

(declare-fun b!1377780 () Bool)

(assert (=> b!1377780 (= e!780465 call!66035)))

(declare-fun d!148381 () Bool)

(declare-fun lt!606187 () (_ BitVec 32))

(assert (=> d!148381 (and (bvsge lt!606187 #b00000000000000000000000000000000) (bvsle lt!606187 (bvsub (size!45759 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(assert (=> d!148381 (= lt!606187 e!780466)))

(declare-fun c!128120 () Bool)

(assert (=> d!148381 (= c!128120 (bvsge (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148381 (and (bvsle (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd to!375 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45759 a!4212)))))

(assert (=> d!148381 (= (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606187)))

(declare-fun bm!66032 () Bool)

(assert (=> bm!66032 (= call!66035 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377781 () Bool)

(assert (=> b!1377781 (= e!780466 e!780465)))

(declare-fun c!128119 () Bool)

(assert (=> b!1377781 (= c!128119 (validKeyInArray!0 (select (arr!45209 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(assert (= (and d!148381 c!128120) b!1377779))

(assert (= (and d!148381 (not c!128120)) b!1377781))

(assert (= (and b!1377781 c!128119) b!1377778))

(assert (= (and b!1377781 (not c!128119)) b!1377780))

(assert (= (or b!1377778 b!1377780) bm!66032))

(declare-fun m!1262169 () Bool)

(assert (=> bm!66032 m!1262169))

(declare-fun m!1262171 () Bool)

(assert (=> b!1377781 m!1262171))

(assert (=> b!1377781 m!1262171))

(declare-fun m!1262173 () Bool)

(assert (=> b!1377781 m!1262173))

(assert (=> bm!66017 d!148381))

(push 1)

(assert (not bm!66032))

(assert (not b!1377781))

(assert (not bm!66030))

(assert (not d!148377))

(assert (not b!1377777))

(assert (not bm!66031))

(assert (not b!1377773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

