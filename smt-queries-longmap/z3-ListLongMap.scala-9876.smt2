; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116938 () Bool)

(assert start!116938)

(declare-fun res!920375 () Bool)

(declare-fun e!780384 () Bool)

(assert (=> start!116938 (=> (not res!920375) (not e!780384))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93561 0))(
  ( (array!93562 (arr!45184 (Array (_ BitVec 32) (_ BitVec 64))) (size!45736 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93561)

(assert (=> start!116938 (= res!920375 (and (bvslt (size!45736 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45736 a!4212))))))

(assert (=> start!116938 e!780384))

(declare-fun array_inv!34417 (array!93561) Bool)

(assert (=> start!116938 (array_inv!34417 a!4212)))

(assert (=> start!116938 true))

(declare-fun b!1377616 () Bool)

(declare-fun res!920374 () Bool)

(assert (=> b!1377616 (=> (not res!920374) (not e!780384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377616 (= res!920374 (not (validKeyInArray!0 (select (arr!45184 a!4212) to!375))))))

(declare-fun b!1377617 () Bool)

(declare-fun res!920373 () Bool)

(assert (=> b!1377617 (=> (not res!920373) (not e!780384))))

(assert (=> b!1377617 (= res!920373 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377618 () Bool)

(declare-fun lt!605950 () (_ BitVec 32))

(declare-fun lt!605949 () (_ BitVec 32))

(assert (=> b!1377618 (= e!780384 (not (= lt!605950 lt!605949)))))

(declare-fun lt!605948 () (_ BitVec 32))

(assert (=> b!1377618 (= (bvadd lt!605949 lt!605948) lt!605950)))

(declare-fun arrayCountValidKeys!0 (array!93561 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377618 (= lt!605950 (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377618 (= lt!605948 (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377618 (= lt!605949 (arrayCountValidKeys!0 a!4212 from!3579 to!375))))

(declare-datatypes ((Unit!45552 0))(
  ( (Unit!45553) )
))
(declare-fun lt!605951 () Unit!45552)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45552)

(assert (=> b!1377618 (= lt!605951 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116938 res!920375) b!1377616))

(assert (= (and b!1377616 res!920374) b!1377617))

(assert (= (and b!1377617 res!920373) b!1377618))

(declare-fun m!1261571 () Bool)

(assert (=> start!116938 m!1261571))

(declare-fun m!1261573 () Bool)

(assert (=> b!1377616 m!1261573))

(assert (=> b!1377616 m!1261573))

(declare-fun m!1261575 () Bool)

(assert (=> b!1377616 m!1261575))

(declare-fun m!1261577 () Bool)

(assert (=> b!1377618 m!1261577))

(declare-fun m!1261579 () Bool)

(assert (=> b!1377618 m!1261579))

(declare-fun m!1261581 () Bool)

(assert (=> b!1377618 m!1261581))

(declare-fun m!1261583 () Bool)

(assert (=> b!1377618 m!1261583))

(check-sat (not b!1377618) (not start!116938) (not b!1377616))
(check-sat)
(get-model)

(declare-fun b!1377645 () Bool)

(declare-fun e!780402 () (_ BitVec 32))

(assert (=> b!1377645 (= e!780402 #b00000000000000000000000000000000)))

(declare-fun b!1377646 () Bool)

(declare-fun e!780403 () (_ BitVec 32))

(declare-fun call!66000 () (_ BitVec 32))

(assert (=> b!1377646 (= e!780403 (bvadd #b00000000000000000000000000000001 call!66000))))

(declare-fun bm!65997 () Bool)

(assert (=> bm!65997 (= call!66000 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377647 () Bool)

(assert (=> b!1377647 (= e!780402 e!780403)))

(declare-fun c!128068 () Bool)

(assert (=> b!1377647 (= c!128068 (validKeyInArray!0 (select (arr!45184 a!4212) from!3579)))))

(declare-fun b!1377648 () Bool)

(assert (=> b!1377648 (= e!780403 call!66000)))

(declare-fun d!148211 () Bool)

(declare-fun lt!605978 () (_ BitVec 32))

(assert (=> d!148211 (and (bvsge lt!605978 #b00000000000000000000000000000000) (bvsle lt!605978 (bvsub (size!45736 a!4212) from!3579)))))

(assert (=> d!148211 (= lt!605978 e!780402)))

(declare-fun c!128069 () Bool)

(assert (=> d!148211 (= c!128069 (bvsge from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148211 (and (bvsle from!3579 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45736 a!4212)))))

(assert (=> d!148211 (= (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)) lt!605978)))

(assert (= (and d!148211 c!128069) b!1377645))

(assert (= (and d!148211 (not c!128069)) b!1377647))

(assert (= (and b!1377647 c!128068) b!1377646))

(assert (= (and b!1377647 (not c!128068)) b!1377648))

(assert (= (or b!1377646 b!1377648) bm!65997))

(declare-fun m!1261613 () Bool)

(assert (=> bm!65997 m!1261613))

(declare-fun m!1261615 () Bool)

(assert (=> b!1377647 m!1261615))

(assert (=> b!1377647 m!1261615))

(declare-fun m!1261617 () Bool)

(assert (=> b!1377647 m!1261617))

(assert (=> b!1377618 d!148211))

(declare-fun b!1377649 () Bool)

(declare-fun e!780404 () (_ BitVec 32))

(assert (=> b!1377649 (= e!780404 #b00000000000000000000000000000000)))

(declare-fun b!1377650 () Bool)

(declare-fun e!780405 () (_ BitVec 32))

(declare-fun call!66001 () (_ BitVec 32))

(assert (=> b!1377650 (= e!780405 (bvadd #b00000000000000000000000000000001 call!66001))))

(declare-fun bm!65998 () Bool)

(assert (=> bm!65998 (= call!66001 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377651 () Bool)

(assert (=> b!1377651 (= e!780404 e!780405)))

(declare-fun c!128070 () Bool)

(assert (=> b!1377651 (= c!128070 (validKeyInArray!0 (select (arr!45184 a!4212) to!375)))))

(declare-fun b!1377652 () Bool)

(assert (=> b!1377652 (= e!780405 call!66001)))

(declare-fun d!148213 () Bool)

(declare-fun lt!605979 () (_ BitVec 32))

(assert (=> d!148213 (and (bvsge lt!605979 #b00000000000000000000000000000000) (bvsle lt!605979 (bvsub (size!45736 a!4212) to!375)))))

(assert (=> d!148213 (= lt!605979 e!780404)))

(declare-fun c!128071 () Bool)

(assert (=> d!148213 (= c!128071 (bvsge to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148213 (and (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge to!375 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45736 a!4212)))))

(assert (=> d!148213 (= (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)) lt!605979)))

(assert (= (and d!148213 c!128071) b!1377649))

(assert (= (and d!148213 (not c!128071)) b!1377651))

(assert (= (and b!1377651 c!128070) b!1377650))

(assert (= (and b!1377651 (not c!128070)) b!1377652))

(assert (= (or b!1377650 b!1377652) bm!65998))

(declare-fun m!1261619 () Bool)

(assert (=> bm!65998 m!1261619))

(assert (=> b!1377651 m!1261573))

(assert (=> b!1377651 m!1261573))

(assert (=> b!1377651 m!1261575))

(assert (=> b!1377618 d!148213))

(declare-fun b!1377653 () Bool)

(declare-fun e!780406 () (_ BitVec 32))

(assert (=> b!1377653 (= e!780406 #b00000000000000000000000000000000)))

(declare-fun b!1377654 () Bool)

(declare-fun e!780407 () (_ BitVec 32))

(declare-fun call!66002 () (_ BitVec 32))

(assert (=> b!1377654 (= e!780407 (bvadd #b00000000000000000000000000000001 call!66002))))

(declare-fun bm!65999 () Bool)

(assert (=> bm!65999 (= call!66002 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1377655 () Bool)

(assert (=> b!1377655 (= e!780406 e!780407)))

(declare-fun c!128072 () Bool)

(assert (=> b!1377655 (= c!128072 (validKeyInArray!0 (select (arr!45184 a!4212) from!3579)))))

(declare-fun b!1377656 () Bool)

(assert (=> b!1377656 (= e!780407 call!66002)))

(declare-fun d!148217 () Bool)

(declare-fun lt!605980 () (_ BitVec 32))

(assert (=> d!148217 (and (bvsge lt!605980 #b00000000000000000000000000000000) (bvsle lt!605980 (bvsub (size!45736 a!4212) from!3579)))))

(assert (=> d!148217 (= lt!605980 e!780406)))

(declare-fun c!128073 () Bool)

(assert (=> d!148217 (= c!128073 (bvsge from!3579 to!375))))

(assert (=> d!148217 (and (bvsle from!3579 to!375) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle to!375 (size!45736 a!4212)))))

(assert (=> d!148217 (= (arrayCountValidKeys!0 a!4212 from!3579 to!375) lt!605980)))

(assert (= (and d!148217 c!128073) b!1377653))

(assert (= (and d!148217 (not c!128073)) b!1377655))

(assert (= (and b!1377655 c!128072) b!1377654))

(assert (= (and b!1377655 (not c!128072)) b!1377656))

(assert (= (or b!1377654 b!1377656) bm!65999))

(declare-fun m!1261621 () Bool)

(assert (=> bm!65999 m!1261621))

(assert (=> b!1377655 m!1261615))

(assert (=> b!1377655 m!1261615))

(assert (=> b!1377655 m!1261617))

(assert (=> b!1377618 d!148217))

(declare-fun d!148219 () Bool)

(assert (=> d!148219 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun lt!605985 () Unit!45552)

(declare-fun choose!61 (array!93561 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45552)

(assert (=> d!148219 (= lt!605985 (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (=> d!148219 (and (bvslt (size!45736 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45736 a!4212)) (bvsge to!375 from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148219 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) lt!605985)))

(declare-fun bs!39578 () Bool)

(assert (= bs!39578 d!148219))

(assert (=> bs!39578 m!1261581))

(assert (=> bs!39578 m!1261579))

(assert (=> bs!39578 m!1261577))

(declare-fun m!1261623 () Bool)

(assert (=> bs!39578 m!1261623))

(assert (=> b!1377618 d!148219))

(declare-fun d!148223 () Bool)

(assert (=> d!148223 (= (array_inv!34417 a!4212) (bvsge (size!45736 a!4212) #b00000000000000000000000000000000))))

(assert (=> start!116938 d!148223))

(declare-fun d!148225 () Bool)

(assert (=> d!148225 (= (validKeyInArray!0 (select (arr!45184 a!4212) to!375)) (and (not (= (select (arr!45184 a!4212) to!375) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45184 a!4212) to!375) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377616 d!148225))

(check-sat (not b!1377647) (not bm!65999) (not b!1377651) (not bm!65997) (not d!148219) (not b!1377655) (not bm!65998))
(check-sat)
(get-model)

(assert (=> b!1377651 d!148225))

(declare-fun b!1377697 () Bool)

(declare-fun e!780428 () (_ BitVec 32))

(assert (=> b!1377697 (= e!780428 #b00000000000000000000000000000000)))

(declare-fun b!1377698 () Bool)

(declare-fun e!780429 () (_ BitVec 32))

(declare-fun call!66013 () (_ BitVec 32))

(assert (=> b!1377698 (= e!780429 (bvadd #b00000000000000000000000000000001 call!66013))))

(declare-fun bm!66010 () Bool)

(assert (=> bm!66010 (= call!66013 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1377699 () Bool)

(assert (=> b!1377699 (= e!780428 e!780429)))

(declare-fun c!128094 () Bool)

(assert (=> b!1377699 (= c!128094 (validKeyInArray!0 (select (arr!45184 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun b!1377700 () Bool)

(assert (=> b!1377700 (= e!780429 call!66013)))

(declare-fun d!148247 () Bool)

(declare-fun lt!606000 () (_ BitVec 32))

(assert (=> d!148247 (and (bvsge lt!606000 #b00000000000000000000000000000000) (bvsle lt!606000 (bvsub (size!45736 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (=> d!148247 (= lt!606000 e!780428)))

(declare-fun c!128095 () Bool)

(assert (=> d!148247 (= c!128095 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(assert (=> d!148247 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) to!375) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!375 (size!45736 a!4212)))))

(assert (=> d!148247 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375) lt!606000)))

(assert (= (and d!148247 c!128095) b!1377697))

(assert (= (and d!148247 (not c!128095)) b!1377699))

(assert (= (and b!1377699 c!128094) b!1377698))

(assert (= (and b!1377699 (not c!128094)) b!1377700))

(assert (= (or b!1377698 b!1377700) bm!66010))

(declare-fun m!1261649 () Bool)

(assert (=> bm!66010 m!1261649))

(declare-fun m!1261651 () Bool)

(assert (=> b!1377699 m!1261651))

(assert (=> b!1377699 m!1261651))

(declare-fun m!1261653 () Bool)

(assert (=> b!1377699 m!1261653))

(assert (=> bm!65999 d!148247))

(assert (=> d!148219 d!148217))

(assert (=> d!148219 d!148213))

(assert (=> d!148219 d!148211))

(declare-fun d!148249 () Bool)

(assert (=> d!148249 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148249 true))

(declare-fun _$76!55 () Unit!45552)

(assert (=> d!148249 (= (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) _$76!55)))

(declare-fun bs!39581 () Bool)

(assert (= bs!39581 d!148249))

(assert (=> bs!39581 m!1261581))

(assert (=> bs!39581 m!1261579))

(assert (=> bs!39581 m!1261577))

(assert (=> d!148219 d!148249))

(declare-fun d!148251 () Bool)

(assert (=> d!148251 (= (validKeyInArray!0 (select (arr!45184 a!4212) from!3579)) (and (not (= (select (arr!45184 a!4212) from!3579) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45184 a!4212) from!3579) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377655 d!148251))

(declare-fun b!1377701 () Bool)

(declare-fun e!780430 () (_ BitVec 32))

(assert (=> b!1377701 (= e!780430 #b00000000000000000000000000000000)))

(declare-fun b!1377702 () Bool)

(declare-fun e!780431 () (_ BitVec 32))

(declare-fun call!66014 () (_ BitVec 32))

(assert (=> b!1377702 (= e!780431 (bvadd #b00000000000000000000000000000001 call!66014))))

(declare-fun bm!66011 () Bool)

(assert (=> bm!66011 (= call!66014 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377703 () Bool)

(assert (=> b!1377703 (= e!780430 e!780431)))

(declare-fun c!128096 () Bool)

(assert (=> b!1377703 (= c!128096 (validKeyInArray!0 (select (arr!45184 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun b!1377704 () Bool)

(assert (=> b!1377704 (= e!780431 call!66014)))

(declare-fun d!148253 () Bool)

(declare-fun lt!606001 () (_ BitVec 32))

(assert (=> d!148253 (and (bvsge lt!606001 #b00000000000000000000000000000000) (bvsle lt!606001 (bvsub (size!45736 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (=> d!148253 (= lt!606001 e!780430)))

(declare-fun c!128097 () Bool)

(assert (=> d!148253 (= c!128097 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148253 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45736 a!4212)))))

(assert (=> d!148253 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606001)))

(assert (= (and d!148253 c!128097) b!1377701))

(assert (= (and d!148253 (not c!128097)) b!1377703))

(assert (= (and b!1377703 c!128096) b!1377702))

(assert (= (and b!1377703 (not c!128096)) b!1377704))

(assert (= (or b!1377702 b!1377704) bm!66011))

(declare-fun m!1261655 () Bool)

(assert (=> bm!66011 m!1261655))

(assert (=> b!1377703 m!1261651))

(assert (=> b!1377703 m!1261651))

(assert (=> b!1377703 m!1261653))

(assert (=> bm!65997 d!148253))

(assert (=> b!1377647 d!148251))

(declare-fun b!1377705 () Bool)

(declare-fun e!780432 () (_ BitVec 32))

(assert (=> b!1377705 (= e!780432 #b00000000000000000000000000000000)))

(declare-fun b!1377706 () Bool)

(declare-fun e!780433 () (_ BitVec 32))

(declare-fun call!66015 () (_ BitVec 32))

(assert (=> b!1377706 (= e!780433 (bvadd #b00000000000000000000000000000001 call!66015))))

(declare-fun bm!66012 () Bool)

(assert (=> bm!66012 (= call!66015 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377707 () Bool)

(assert (=> b!1377707 (= e!780432 e!780433)))

(declare-fun c!128098 () Bool)

(assert (=> b!1377707 (= c!128098 (validKeyInArray!0 (select (arr!45184 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(declare-fun b!1377708 () Bool)

(assert (=> b!1377708 (= e!780433 call!66015)))

(declare-fun d!148255 () Bool)

(declare-fun lt!606002 () (_ BitVec 32))

(assert (=> d!148255 (and (bvsge lt!606002 #b00000000000000000000000000000000) (bvsle lt!606002 (bvsub (size!45736 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(assert (=> d!148255 (= lt!606002 e!780432)))

(declare-fun c!128099 () Bool)

(assert (=> d!148255 (= c!128099 (bvsge (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148255 (and (bvsle (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd to!375 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45736 a!4212)))))

(assert (=> d!148255 (= (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606002)))

(assert (= (and d!148255 c!128099) b!1377705))

(assert (= (and d!148255 (not c!128099)) b!1377707))

(assert (= (and b!1377707 c!128098) b!1377706))

(assert (= (and b!1377707 (not c!128098)) b!1377708))

(assert (= (or b!1377706 b!1377708) bm!66012))

(declare-fun m!1261657 () Bool)

(assert (=> bm!66012 m!1261657))

(declare-fun m!1261659 () Bool)

(assert (=> b!1377707 m!1261659))

(assert (=> b!1377707 m!1261659))

(declare-fun m!1261661 () Bool)

(assert (=> b!1377707 m!1261661))

(assert (=> bm!65998 d!148255))

(check-sat (not d!148249) (not bm!66012) (not b!1377699) (not bm!66011) (not b!1377707) (not b!1377703) (not bm!66010))
(check-sat)
