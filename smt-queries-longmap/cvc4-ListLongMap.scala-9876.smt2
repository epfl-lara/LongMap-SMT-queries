; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116946 () Bool)

(assert start!116946)

(declare-fun res!920419 () Bool)

(declare-fun e!780424 () Bool)

(assert (=> start!116946 (=> (not res!920419) (not e!780424))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93615 0))(
  ( (array!93616 (arr!45211 (Array (_ BitVec 32) (_ BitVec 64))) (size!45761 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93615)

(assert (=> start!116946 (= res!920419 (and (bvslt (size!45761 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45761 a!4212))))))

(assert (=> start!116946 e!780424))

(declare-fun array_inv!34239 (array!93615) Bool)

(assert (=> start!116946 (array_inv!34239 a!4212)))

(assert (=> start!116946 true))

(declare-fun b!1377695 () Bool)

(declare-fun res!920417 () Bool)

(assert (=> b!1377695 (=> (not res!920417) (not e!780424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377695 (= res!920417 (not (validKeyInArray!0 (select (arr!45211 a!4212) to!375))))))

(declare-fun b!1377696 () Bool)

(declare-fun res!920418 () Bool)

(assert (=> b!1377696 (=> (not res!920418) (not e!780424))))

(assert (=> b!1377696 (= res!920418 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377697 () Bool)

(declare-fun lt!606156 () (_ BitVec 32))

(declare-fun lt!606154 () (_ BitVec 32))

(assert (=> b!1377697 (= e!780424 (not (= lt!606156 lt!606154)))))

(declare-fun lt!606155 () (_ BitVec 32))

(assert (=> b!1377697 (= (bvadd lt!606154 lt!606155) lt!606156)))

(declare-fun arrayCountValidKeys!0 (array!93615 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377697 (= lt!606156 (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377697 (= lt!606155 (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377697 (= lt!606154 (arrayCountValidKeys!0 a!4212 from!3579 to!375))))

(declare-datatypes ((Unit!45715 0))(
  ( (Unit!45716) )
))
(declare-fun lt!606157 () Unit!45715)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45715)

(assert (=> b!1377697 (= lt!606157 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116946 res!920419) b!1377695))

(assert (= (and b!1377695 res!920417) b!1377696))

(assert (= (and b!1377696 res!920418) b!1377697))

(declare-fun m!1262097 () Bool)

(assert (=> start!116946 m!1262097))

(declare-fun m!1262099 () Bool)

(assert (=> b!1377695 m!1262099))

(assert (=> b!1377695 m!1262099))

(declare-fun m!1262101 () Bool)

(assert (=> b!1377695 m!1262101))

(declare-fun m!1262103 () Bool)

(assert (=> b!1377697 m!1262103))

(declare-fun m!1262105 () Bool)

(assert (=> b!1377697 m!1262105))

(declare-fun m!1262107 () Bool)

(assert (=> b!1377697 m!1262107))

(declare-fun m!1262109 () Bool)

(assert (=> b!1377697 m!1262109))

(push 1)

(assert (not start!116946))

(assert (not b!1377695))

(assert (not b!1377697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!148331 () Bool)

(assert (=> d!148331 (= (array_inv!34239 a!4212) (bvsge (size!45761 a!4212) #b00000000000000000000000000000000))))

(assert (=> start!116946 d!148331))

(declare-fun d!148335 () Bool)

(assert (=> d!148335 (= (validKeyInArray!0 (select (arr!45211 a!4212) to!375)) (and (not (= (select (arr!45211 a!4212) to!375) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45211 a!4212) to!375) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377695 d!148335))

(declare-fun bm!66020 () Bool)

(declare-fun call!66023 () (_ BitVec 32))

(assert (=> bm!66020 (= call!66023 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun d!148337 () Bool)

(declare-fun lt!606166 () (_ BitVec 32))

(assert (=> d!148337 (and (bvsge lt!606166 #b00000000000000000000000000000000) (bvsle lt!606166 (bvsub (size!45761 a!4212) from!3579)))))

(declare-fun e!780441 () (_ BitVec 32))

(assert (=> d!148337 (= lt!606166 e!780441)))

(declare-fun c!128095 () Bool)

(assert (=> d!148337 (= c!128095 (bvsge from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148337 (and (bvsle from!3579 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45761 a!4212)))))

(assert (=> d!148337 (= (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)) lt!606166)))

(declare-fun b!1377730 () Bool)

(declare-fun e!780443 () (_ BitVec 32))

(assert (=> b!1377730 (= e!780441 e!780443)))

(declare-fun c!128096 () Bool)

(assert (=> b!1377730 (= c!128096 (validKeyInArray!0 (select (arr!45211 a!4212) from!3579)))))

(declare-fun b!1377731 () Bool)

(assert (=> b!1377731 (= e!780443 (bvadd #b00000000000000000000000000000001 call!66023))))

(declare-fun b!1377733 () Bool)

(assert (=> b!1377733 (= e!780441 #b00000000000000000000000000000000)))

(declare-fun b!1377735 () Bool)

(assert (=> b!1377735 (= e!780443 call!66023)))

(assert (= (and d!148337 c!128095) b!1377733))

(assert (= (and d!148337 (not c!128095)) b!1377730))

(assert (= (and b!1377730 c!128096) b!1377731))

(assert (= (and b!1377730 (not c!128096)) b!1377735))

(assert (= (or b!1377731 b!1377735) bm!66020))

(declare-fun m!1262120 () Bool)

(assert (=> bm!66020 m!1262120))

(declare-fun m!1262123 () Bool)

(assert (=> b!1377730 m!1262123))

(assert (=> b!1377730 m!1262123))

(declare-fun m!1262125 () Bool)

(assert (=> b!1377730 m!1262125))

(assert (=> b!1377697 d!148337))

(declare-fun bm!66022 () Bool)

(declare-fun call!66025 () (_ BitVec 32))

(assert (=> bm!66022 (= call!66025 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun d!148347 () Bool)

(declare-fun lt!606168 () (_ BitVec 32))

(assert (=> d!148347 (and (bvsge lt!606168 #b00000000000000000000000000000000) (bvsle lt!606168 (bvsub (size!45761 a!4212) to!375)))))

(declare-fun e!780445 () (_ BitVec 32))

(assert (=> d!148347 (= lt!606168 e!780445)))

(declare-fun c!128099 () Bool)

(assert (=> d!148347 (= c!128099 (bvsge to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148347 (and (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge to!375 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45761 a!4212)))))

(assert (=> d!148347 (= (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)) lt!606168)))

(declare-fun b!1377738 () Bool)

(declare-fun e!780446 () (_ BitVec 32))

(assert (=> b!1377738 (= e!780445 e!780446)))

(declare-fun c!128100 () Bool)

(assert (=> b!1377738 (= c!128100 (validKeyInArray!0 (select (arr!45211 a!4212) to!375)))))

(declare-fun b!1377739 () Bool)

(assert (=> b!1377739 (= e!780446 (bvadd #b00000000000000000000000000000001 call!66025))))

(declare-fun b!1377740 () Bool)

(assert (=> b!1377740 (= e!780445 #b00000000000000000000000000000000)))

(declare-fun b!1377741 () Bool)

(assert (=> b!1377741 (= e!780446 call!66025)))

(assert (= (and d!148347 c!128099) b!1377740))

(assert (= (and d!148347 (not c!128099)) b!1377738))

(assert (= (and b!1377738 c!128100) b!1377739))

(assert (= (and b!1377738 (not c!128100)) b!1377741))

(assert (= (or b!1377739 b!1377741) bm!66022))

(declare-fun m!1262127 () Bool)

(assert (=> bm!66022 m!1262127))

(assert (=> b!1377738 m!1262099))

(assert (=> b!1377738 m!1262099))

(assert (=> b!1377738 m!1262101))

(assert (=> b!1377697 d!148347))

(declare-fun bm!66023 () Bool)

(declare-fun call!66026 () (_ BitVec 32))

(assert (=> bm!66023 (= call!66026 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(declare-fun d!148349 () Bool)

(declare-fun lt!606169 () (_ BitVec 32))

(assert (=> d!148349 (and (bvsge lt!606169 #b00000000000000000000000000000000) (bvsle lt!606169 (bvsub (size!45761 a!4212) from!3579)))))

(declare-fun e!780447 () (_ BitVec 32))

(assert (=> d!148349 (= lt!606169 e!780447)))

(declare-fun c!128101 () Bool)

(assert (=> d!148349 (= c!128101 (bvsge from!3579 to!375))))

(assert (=> d!148349 (and (bvsle from!3579 to!375) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle to!375 (size!45761 a!4212)))))

(assert (=> d!148349 (= (arrayCountValidKeys!0 a!4212 from!3579 to!375) lt!606169)))

(declare-fun b!1377742 () Bool)

(declare-fun e!780448 () (_ BitVec 32))

(assert (=> b!1377742 (= e!780447 e!780448)))

(declare-fun c!128102 () Bool)

(assert (=> b!1377742 (= c!128102 (validKeyInArray!0 (select (arr!45211 a!4212) from!3579)))))

(declare-fun b!1377743 () Bool)

(assert (=> b!1377743 (= e!780448 (bvadd #b00000000000000000000000000000001 call!66026))))

(declare-fun b!1377744 () Bool)

(assert (=> b!1377744 (= e!780447 #b00000000000000000000000000000000)))

(declare-fun b!1377745 () Bool)

(assert (=> b!1377745 (= e!780448 call!66026)))

(assert (= (and d!148349 c!128101) b!1377744))

(assert (= (and d!148349 (not c!128101)) b!1377742))

(assert (= (and b!1377742 c!128102) b!1377743))

(assert (= (and b!1377742 (not c!128102)) b!1377745))

(assert (= (or b!1377743 b!1377745) bm!66023))

(declare-fun m!1262129 () Bool)

(assert (=> bm!66023 m!1262129))

(assert (=> b!1377742 m!1262123))

(assert (=> b!1377742 m!1262123))

(assert (=> b!1377742 m!1262125))

(assert (=> b!1377697 d!148349))

(declare-fun d!148351 () Bool)

(assert (=> d!148351 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun lt!606178 () Unit!45715)

(declare-fun choose!61 (array!93615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45715)

(assert (=> d!148351 (= lt!606178 (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (=> d!148351 (and (bvslt (size!45761 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45761 a!4212)) (bvsge to!375 from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148351 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) lt!606178)))

(declare-fun bs!39607 () Bool)

(assert (= bs!39607 d!148351))

(assert (=> bs!39607 m!1262107))

(assert (=> bs!39607 m!1262105))

(assert (=> bs!39607 m!1262103))

(declare-fun m!1262143 () Bool)

(assert (=> bs!39607 m!1262143))

(assert (=> b!1377697 d!148351))

(push 1)

(assert (not bm!66020))

(assert (not b!1377738))

(assert (not bm!66022))

(assert (not bm!66023))

(assert (not d!148351))

(assert (not b!1377730))

(assert (not b!1377742))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> b!1377738 d!148335))

(declare-fun d!148383 () Bool)

(assert (=> d!148383 (= (validKeyInArray!0 (select (arr!45211 a!4212) from!3579)) (and (not (= (select (arr!45211 a!4212) from!3579) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45211 a!4212) from!3579) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377742 d!148383))

(declare-fun bm!66033 () Bool)

(declare-fun call!66036 () (_ BitVec 32))

(assert (=> bm!66033 (= call!66036 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun d!148385 () Bool)

(declare-fun lt!606188 () (_ BitVec 32))

(assert (=> d!148385 (and (bvsge lt!606188 #b00000000000000000000000000000000) (bvsle lt!606188 (bvsub (size!45761 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun e!780467 () (_ BitVec 32))

(assert (=> d!148385 (= lt!606188 e!780467)))

(declare-fun c!128121 () Bool)

(assert (=> d!148385 (= c!128121 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148385 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45761 a!4212)))))

(assert (=> d!148385 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606188)))

(declare-fun b!1377782 () Bool)

(declare-fun e!780468 () (_ BitVec 32))

(assert (=> b!1377782 (= e!780467 e!780468)))

(declare-fun c!128122 () Bool)

(assert (=> b!1377782 (= c!128122 (validKeyInArray!0 (select (arr!45211 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun b!1377783 () Bool)

(assert (=> b!1377783 (= e!780468 (bvadd #b00000000000000000000000000000001 call!66036))))

(declare-fun b!1377784 () Bool)

(assert (=> b!1377784 (= e!780467 #b00000000000000000000000000000000)))

(declare-fun b!1377785 () Bool)

(assert (=> b!1377785 (= e!780468 call!66036)))

(assert (= (and d!148385 c!128121) b!1377784))

(assert (= (and d!148385 (not c!128121)) b!1377782))

(assert (= (and b!1377782 c!128122) b!1377783))

(assert (= (and b!1377782 (not c!128122)) b!1377785))

(assert (= (or b!1377783 b!1377785) bm!66033))

(declare-fun m!1262175 () Bool)

(assert (=> bm!66033 m!1262175))

(declare-fun m!1262177 () Bool)

(assert (=> b!1377782 m!1262177))

(assert (=> b!1377782 m!1262177))

(declare-fun m!1262179 () Bool)

(assert (=> b!1377782 m!1262179))

(assert (=> bm!66020 d!148385))

(declare-fun call!66037 () (_ BitVec 32))

(declare-fun bm!66034 () Bool)

(assert (=> bm!66034 (= call!66037 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!375))))

(declare-fun d!148387 () Bool)

(declare-fun lt!606189 () (_ BitVec 32))

(assert (=> d!148387 (and (bvsge lt!606189 #b00000000000000000000000000000000) (bvsle lt!606189 (bvsub (size!45761 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun e!780469 () (_ BitVec 32))

(assert (=> d!148387 (= lt!606189 e!780469)))

(declare-fun c!128123 () Bool)

(assert (=> d!148387 (= c!128123 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(assert (=> d!148387 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) to!375) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!375 (size!45761 a!4212)))))

(assert (=> d!148387 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375) lt!606189)))

(declare-fun b!1377786 () Bool)

(declare-fun e!780470 () (_ BitVec 32))

(assert (=> b!1377786 (= e!780469 e!780470)))

(declare-fun c!128124 () Bool)

(assert (=> b!1377786 (= c!128124 (validKeyInArray!0 (select (arr!45211 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun b!1377787 () Bool)

(assert (=> b!1377787 (= e!780470 (bvadd #b00000000000000000000000000000001 call!66037))))

(declare-fun b!1377788 () Bool)

(assert (=> b!1377788 (= e!780469 #b00000000000000000000000000000000)))

(declare-fun b!1377789 () Bool)

(assert (=> b!1377789 (= e!780470 call!66037)))

(assert (= (and d!148387 c!128123) b!1377788))

(assert (= (and d!148387 (not c!128123)) b!1377786))

(assert (= (and b!1377786 c!128124) b!1377787))

(assert (= (and b!1377786 (not c!128124)) b!1377789))

(assert (= (or b!1377787 b!1377789) bm!66034))

(declare-fun m!1262181 () Bool)

(assert (=> bm!66034 m!1262181))

(assert (=> b!1377786 m!1262177))

(assert (=> b!1377786 m!1262177))

(assert (=> b!1377786 m!1262179))

(assert (=> bm!66023 d!148387))

(assert (=> b!1377730 d!148383))

(declare-fun bm!66035 () Bool)

(declare-fun call!66038 () (_ BitVec 32))

(assert (=> bm!66035 (= call!66038 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun d!148389 () Bool)

(declare-fun lt!606190 () (_ BitVec 32))

(assert (=> d!148389 (and (bvsge lt!606190 #b00000000000000000000000000000000) (bvsle lt!606190 (bvsub (size!45761 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(declare-fun e!780471 () (_ BitVec 32))

(assert (=> d!148389 (= lt!606190 e!780471)))

(declare-fun c!128125 () Bool)

(assert (=> d!148389 (= c!128125 (bvsge (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148389 (and (bvsle (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd to!375 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45761 a!4212)))))

(assert (=> d!148389 (= (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606190)))

(declare-fun b!1377790 () Bool)

(declare-fun e!780472 () (_ BitVec 32))

(assert (=> b!1377790 (= e!780471 e!780472)))

(declare-fun c!128126 () Bool)

(assert (=> b!1377790 (= c!128126 (validKeyInArray!0 (select (arr!45211 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(declare-fun b!1377791 () Bool)

(assert (=> b!1377791 (= e!780472 (bvadd #b00000000000000000000000000000001 call!66038))))

(declare-fun b!1377792 () Bool)

(assert (=> b!1377792 (= e!780471 #b00000000000000000000000000000000)))

(declare-fun b!1377793 () Bool)

(assert (=> b!1377793 (= e!780472 call!66038)))

(assert (= (and d!148389 c!128125) b!1377792))

