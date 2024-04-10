; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!116944 () Bool)

(assert start!116944)

(declare-fun res!920408 () Bool)

(declare-fun e!780417 () Bool)

(assert (=> start!116944 (=> (not res!920408) (not e!780417))))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93613 0))(
  ( (array!93614 (arr!45210 (Array (_ BitVec 32) (_ BitVec 64))) (size!45760 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93613)

(declare-fun to!375 () (_ BitVec 32))

(assert (=> start!116944 (= res!920408 (and (bvslt (size!45760 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45760 a!4212))))))

(assert (=> start!116944 e!780417))

(declare-fun array_inv!34238 (array!93613) Bool)

(assert (=> start!116944 (array_inv!34238 a!4212)))

(assert (=> start!116944 true))

(declare-fun b!1377686 () Bool)

(declare-fun res!920410 () Bool)

(assert (=> b!1377686 (=> (not res!920410) (not e!780417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377686 (= res!920410 (not (validKeyInArray!0 (select (arr!45210 a!4212) to!375))))))

(declare-fun b!1377687 () Bool)

(declare-fun res!920409 () Bool)

(assert (=> b!1377687 (=> (not res!920409) (not e!780417))))

(assert (=> b!1377687 (= res!920409 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1377688 () Bool)

(declare-fun lt!606142 () (_ BitVec 32))

(declare-fun lt!606144 () (_ BitVec 32))

(assert (=> b!1377688 (= e!780417 (not (= lt!606142 lt!606144)))))

(declare-fun lt!606143 () (_ BitVec 32))

(assert (=> b!1377688 (= (bvadd lt!606144 lt!606143) lt!606142)))

(declare-fun arrayCountValidKeys!0 (array!93613 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1377688 (= lt!606142 (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377688 (= lt!606143 (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1377688 (= lt!606144 (arrayCountValidKeys!0 a!4212 from!3579 to!375))))

(declare-datatypes ((Unit!45713 0))(
  ( (Unit!45714) )
))
(declare-fun lt!606145 () Unit!45713)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45713)

(assert (=> b!1377688 (= lt!606145 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!116944 res!920408) b!1377686))

(assert (= (and b!1377686 res!920410) b!1377687))

(assert (= (and b!1377687 res!920409) b!1377688))

(declare-fun m!1262083 () Bool)

(assert (=> start!116944 m!1262083))

(declare-fun m!1262085 () Bool)

(assert (=> b!1377686 m!1262085))

(assert (=> b!1377686 m!1262085))

(declare-fun m!1262087 () Bool)

(assert (=> b!1377686 m!1262087))

(declare-fun m!1262089 () Bool)

(assert (=> b!1377688 m!1262089))

(declare-fun m!1262091 () Bool)

(assert (=> b!1377688 m!1262091))

(declare-fun m!1262093 () Bool)

(assert (=> b!1377688 m!1262093))

(declare-fun m!1262095 () Bool)

(assert (=> b!1377688 m!1262095))

(check-sat (not b!1377686) (not b!1377688) (not start!116944))
(check-sat)
(get-model)

(declare-fun d!148333 () Bool)

(assert (=> d!148333 (= (validKeyInArray!0 (select (arr!45210 a!4212) to!375)) (and (not (= (select (arr!45210 a!4212) to!375) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45210 a!4212) to!375) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377686 d!148333))

(declare-fun b!1377746 () Bool)

(declare-fun e!780450 () (_ BitVec 32))

(declare-fun call!66027 () (_ BitVec 32))

(assert (=> b!1377746 (= e!780450 (bvadd #b00000000000000000000000000000001 call!66027))))

(declare-fun d!148339 () Bool)

(declare-fun lt!606170 () (_ BitVec 32))

(assert (=> d!148339 (and (bvsge lt!606170 #b00000000000000000000000000000000) (bvsle lt!606170 (bvsub (size!45760 a!4212) from!3579)))))

(declare-fun e!780449 () (_ BitVec 32))

(assert (=> d!148339 (= lt!606170 e!780449)))

(declare-fun c!128103 () Bool)

(assert (=> d!148339 (= c!128103 (bvsge from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148339 (and (bvsle from!3579 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45760 a!4212)))))

(assert (=> d!148339 (= (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)) lt!606170)))

(declare-fun bm!66024 () Bool)

(assert (=> bm!66024 (= call!66027 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377747 () Bool)

(assert (=> b!1377747 (= e!780449 e!780450)))

(declare-fun c!128104 () Bool)

(assert (=> b!1377747 (= c!128104 (validKeyInArray!0 (select (arr!45210 a!4212) from!3579)))))

(declare-fun b!1377748 () Bool)

(assert (=> b!1377748 (= e!780450 call!66027)))

(declare-fun b!1377749 () Bool)

(assert (=> b!1377749 (= e!780449 #b00000000000000000000000000000000)))

(assert (= (and d!148339 c!128103) b!1377749))

(assert (= (and d!148339 (not c!128103)) b!1377747))

(assert (= (and b!1377747 c!128104) b!1377746))

(assert (= (and b!1377747 (not c!128104)) b!1377748))

(assert (= (or b!1377746 b!1377748) bm!66024))

(declare-fun m!1262131 () Bool)

(assert (=> bm!66024 m!1262131))

(declare-fun m!1262133 () Bool)

(assert (=> b!1377747 m!1262133))

(assert (=> b!1377747 m!1262133))

(declare-fun m!1262135 () Bool)

(assert (=> b!1377747 m!1262135))

(assert (=> b!1377688 d!148339))

(declare-fun b!1377750 () Bool)

(declare-fun e!780452 () (_ BitVec 32))

(declare-fun call!66028 () (_ BitVec 32))

(assert (=> b!1377750 (= e!780452 (bvadd #b00000000000000000000000000000001 call!66028))))

(declare-fun d!148353 () Bool)

(declare-fun lt!606171 () (_ BitVec 32))

(assert (=> d!148353 (and (bvsge lt!606171 #b00000000000000000000000000000000) (bvsle lt!606171 (bvsub (size!45760 a!4212) to!375)))))

(declare-fun e!780451 () (_ BitVec 32))

(assert (=> d!148353 (= lt!606171 e!780451)))

(declare-fun c!128105 () Bool)

(assert (=> d!148353 (= c!128105 (bvsge to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148353 (and (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge to!375 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45760 a!4212)))))

(assert (=> d!148353 (= (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)) lt!606171)))

(declare-fun bm!66025 () Bool)

(assert (=> bm!66025 (= call!66028 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377751 () Bool)

(assert (=> b!1377751 (= e!780451 e!780452)))

(declare-fun c!128106 () Bool)

(assert (=> b!1377751 (= c!128106 (validKeyInArray!0 (select (arr!45210 a!4212) to!375)))))

(declare-fun b!1377752 () Bool)

(assert (=> b!1377752 (= e!780452 call!66028)))

(declare-fun b!1377753 () Bool)

(assert (=> b!1377753 (= e!780451 #b00000000000000000000000000000000)))

(assert (= (and d!148353 c!128105) b!1377753))

(assert (= (and d!148353 (not c!128105)) b!1377751))

(assert (= (and b!1377751 c!128106) b!1377750))

(assert (= (and b!1377751 (not c!128106)) b!1377752))

(assert (= (or b!1377750 b!1377752) bm!66025))

(declare-fun m!1262137 () Bool)

(assert (=> bm!66025 m!1262137))

(assert (=> b!1377751 m!1262085))

(assert (=> b!1377751 m!1262085))

(assert (=> b!1377751 m!1262087))

(assert (=> b!1377688 d!148353))

(declare-fun b!1377754 () Bool)

(declare-fun e!780454 () (_ BitVec 32))

(declare-fun call!66029 () (_ BitVec 32))

(assert (=> b!1377754 (= e!780454 (bvadd #b00000000000000000000000000000001 call!66029))))

(declare-fun d!148355 () Bool)

(declare-fun lt!606174 () (_ BitVec 32))

(assert (=> d!148355 (and (bvsge lt!606174 #b00000000000000000000000000000000) (bvsle lt!606174 (bvsub (size!45760 a!4212) from!3579)))))

(declare-fun e!780453 () (_ BitVec 32))

(assert (=> d!148355 (= lt!606174 e!780453)))

(declare-fun c!128107 () Bool)

(assert (=> d!148355 (= c!128107 (bvsge from!3579 to!375))))

(assert (=> d!148355 (and (bvsle from!3579 to!375) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle to!375 (size!45760 a!4212)))))

(assert (=> d!148355 (= (arrayCountValidKeys!0 a!4212 from!3579 to!375) lt!606174)))

(declare-fun bm!66026 () Bool)

(assert (=> bm!66026 (= call!66029 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1377755 () Bool)

(assert (=> b!1377755 (= e!780453 e!780454)))

(declare-fun c!128108 () Bool)

(assert (=> b!1377755 (= c!128108 (validKeyInArray!0 (select (arr!45210 a!4212) from!3579)))))

(declare-fun b!1377756 () Bool)

(assert (=> b!1377756 (= e!780454 call!66029)))

(declare-fun b!1377757 () Bool)

(assert (=> b!1377757 (= e!780453 #b00000000000000000000000000000000)))

(assert (= (and d!148355 c!128107) b!1377757))

(assert (= (and d!148355 (not c!128107)) b!1377755))

(assert (= (and b!1377755 c!128108) b!1377754))

(assert (= (and b!1377755 (not c!128108)) b!1377756))

(assert (= (or b!1377754 b!1377756) bm!66026))

(declare-fun m!1262139 () Bool)

(assert (=> bm!66026 m!1262139))

(assert (=> b!1377755 m!1262133))

(assert (=> b!1377755 m!1262133))

(assert (=> b!1377755 m!1262135))

(assert (=> b!1377688 d!148355))

(declare-fun d!148357 () Bool)

(assert (=> d!148357 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun lt!606181 () Unit!45713)

(declare-fun choose!61 (array!93613 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45713)

(assert (=> d!148357 (= lt!606181 (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (=> d!148357 (and (bvslt (size!45760 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45760 a!4212)) (bvsge to!375 from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148357 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) lt!606181)))

(declare-fun bs!39608 () Bool)

(assert (= bs!39608 d!148357))

(assert (=> bs!39608 m!1262093))

(assert (=> bs!39608 m!1262091))

(assert (=> bs!39608 m!1262089))

(declare-fun m!1262145 () Bool)

(assert (=> bs!39608 m!1262145))

(assert (=> b!1377688 d!148357))

(declare-fun d!148361 () Bool)

(assert (=> d!148361 (= (array_inv!34238 a!4212) (bvsge (size!45760 a!4212) #b00000000000000000000000000000000))))

(assert (=> start!116944 d!148361))

(check-sat (not d!148357) (not b!1377747) (not bm!66026) (not b!1377751) (not b!1377755) (not bm!66024) (not bm!66025))
(check-sat)
(get-model)

(declare-fun d!148363 () Bool)

(assert (=> d!148363 (= (validKeyInArray!0 (select (arr!45210 a!4212) from!3579)) (and (not (= (select (arr!45210 a!4212) from!3579) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45210 a!4212) from!3579) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377747 d!148363))

(assert (=> d!148357 d!148355))

(assert (=> d!148357 d!148353))

(assert (=> d!148357 d!148339))

(declare-fun d!148365 () Bool)

(assert (=> d!148365 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148365 true))

(declare-fun _$76!55 () Unit!45713)

(assert (=> d!148365 (= (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) _$76!55)))

(declare-fun bs!39609 () Bool)

(assert (= bs!39609 d!148365))

(assert (=> bs!39609 m!1262093))

(assert (=> bs!39609 m!1262091))

(assert (=> bs!39609 m!1262089))

(assert (=> d!148357 d!148365))

(assert (=> b!1377755 d!148363))

(declare-fun b!1377758 () Bool)

(declare-fun e!780456 () (_ BitVec 32))

(declare-fun call!66030 () (_ BitVec 32))

(assert (=> b!1377758 (= e!780456 (bvadd #b00000000000000000000000000000001 call!66030))))

(declare-fun d!148367 () Bool)

(declare-fun lt!606182 () (_ BitVec 32))

(assert (=> d!148367 (and (bvsge lt!606182 #b00000000000000000000000000000000) (bvsle lt!606182 (bvsub (size!45760 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun e!780455 () (_ BitVec 32))

(assert (=> d!148367 (= lt!606182 e!780455)))

(declare-fun c!128109 () Bool)

(assert (=> d!148367 (= c!128109 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148367 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45760 a!4212)))))

(assert (=> d!148367 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606182)))

(declare-fun bm!66027 () Bool)

(assert (=> bm!66027 (= call!66030 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377759 () Bool)

(assert (=> b!1377759 (= e!780455 e!780456)))

(declare-fun c!128110 () Bool)

(assert (=> b!1377759 (= c!128110 (validKeyInArray!0 (select (arr!45210 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun b!1377760 () Bool)

(assert (=> b!1377760 (= e!780456 call!66030)))

(declare-fun b!1377761 () Bool)

(assert (=> b!1377761 (= e!780455 #b00000000000000000000000000000000)))

(assert (= (and d!148367 c!128109) b!1377761))

(assert (= (and d!148367 (not c!128109)) b!1377759))

(assert (= (and b!1377759 c!128110) b!1377758))

(assert (= (and b!1377759 (not c!128110)) b!1377760))

(assert (= (or b!1377758 b!1377760) bm!66027))

(declare-fun m!1262147 () Bool)

(assert (=> bm!66027 m!1262147))

(declare-fun m!1262149 () Bool)

(assert (=> b!1377759 m!1262149))

(assert (=> b!1377759 m!1262149))

(declare-fun m!1262151 () Bool)

(assert (=> b!1377759 m!1262151))

(assert (=> bm!66024 d!148367))

(declare-fun b!1377762 () Bool)

(declare-fun e!780458 () (_ BitVec 32))

(declare-fun call!66031 () (_ BitVec 32))

(assert (=> b!1377762 (= e!780458 (bvadd #b00000000000000000000000000000001 call!66031))))

(declare-fun d!148369 () Bool)

(declare-fun lt!606183 () (_ BitVec 32))

(assert (=> d!148369 (and (bvsge lt!606183 #b00000000000000000000000000000000) (bvsle lt!606183 (bvsub (size!45760 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun e!780457 () (_ BitVec 32))

(assert (=> d!148369 (= lt!606183 e!780457)))

(declare-fun c!128111 () Bool)

(assert (=> d!148369 (= c!128111 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(assert (=> d!148369 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) to!375) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!375 (size!45760 a!4212)))))

(assert (=> d!148369 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375) lt!606183)))

(declare-fun bm!66028 () Bool)

(assert (=> bm!66028 (= call!66031 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1377763 () Bool)

(assert (=> b!1377763 (= e!780457 e!780458)))

(declare-fun c!128112 () Bool)

(assert (=> b!1377763 (= c!128112 (validKeyInArray!0 (select (arr!45210 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun b!1377764 () Bool)

(assert (=> b!1377764 (= e!780458 call!66031)))

(declare-fun b!1377765 () Bool)

(assert (=> b!1377765 (= e!780457 #b00000000000000000000000000000000)))

(assert (= (and d!148369 c!128111) b!1377765))

(assert (= (and d!148369 (not c!128111)) b!1377763))

(assert (= (and b!1377763 c!128112) b!1377762))

(assert (= (and b!1377763 (not c!128112)) b!1377764))

(assert (= (or b!1377762 b!1377764) bm!66028))

(declare-fun m!1262153 () Bool)

(assert (=> bm!66028 m!1262153))

(assert (=> b!1377763 m!1262149))

(assert (=> b!1377763 m!1262149))

(assert (=> b!1377763 m!1262151))

(assert (=> bm!66026 d!148369))

(assert (=> b!1377751 d!148333))

(declare-fun b!1377766 () Bool)

(declare-fun e!780460 () (_ BitVec 32))

(declare-fun call!66032 () (_ BitVec 32))

(assert (=> b!1377766 (= e!780460 (bvadd #b00000000000000000000000000000001 call!66032))))

(declare-fun d!148371 () Bool)

(declare-fun lt!606184 () (_ BitVec 32))

(assert (=> d!148371 (and (bvsge lt!606184 #b00000000000000000000000000000000) (bvsle lt!606184 (bvsub (size!45760 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(declare-fun e!780459 () (_ BitVec 32))

(assert (=> d!148371 (= lt!606184 e!780459)))

(declare-fun c!128113 () Bool)

(assert (=> d!148371 (= c!128113 (bvsge (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148371 (and (bvsle (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd to!375 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45760 a!4212)))))

(assert (=> d!148371 (= (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606184)))

(declare-fun bm!66029 () Bool)

(assert (=> bm!66029 (= call!66032 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1377767 () Bool)

(assert (=> b!1377767 (= e!780459 e!780460)))

(declare-fun c!128114 () Bool)

(assert (=> b!1377767 (= c!128114 (validKeyInArray!0 (select (arr!45210 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(declare-fun b!1377768 () Bool)

(assert (=> b!1377768 (= e!780460 call!66032)))

(declare-fun b!1377769 () Bool)

(assert (=> b!1377769 (= e!780459 #b00000000000000000000000000000000)))

(assert (= (and d!148371 c!128113) b!1377769))

(assert (= (and d!148371 (not c!128113)) b!1377767))

(assert (= (and b!1377767 c!128114) b!1377766))

(assert (= (and b!1377767 (not c!128114)) b!1377768))

(assert (= (or b!1377766 b!1377768) bm!66029))

(declare-fun m!1262155 () Bool)

(assert (=> bm!66029 m!1262155))

(declare-fun m!1262157 () Bool)

(assert (=> b!1377767 m!1262157))

(assert (=> b!1377767 m!1262157))

(declare-fun m!1262159 () Bool)

(assert (=> b!1377767 m!1262159))

(assert (=> bm!66025 d!148371))

(check-sat (not b!1377763) (not b!1377759) (not d!148365) (not bm!66028) (not bm!66029) (not b!1377767) (not bm!66027))
(check-sat)
