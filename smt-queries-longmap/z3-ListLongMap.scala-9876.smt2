; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117172 () Bool)

(assert start!117172)

(declare-fun res!920920 () Bool)

(declare-fun e!781263 () Bool)

(assert (=> start!117172 (=> (not res!920920) (not e!781263))))

(declare-fun to!375 () (_ BitVec 32))

(declare-fun from!3579 () (_ BitVec 32))

(declare-datatypes ((array!93727 0))(
  ( (array!93728 (arr!45262 (Array (_ BitVec 32) (_ BitVec 64))) (size!45813 (_ BitVec 32))) )
))
(declare-fun a!4212 () array!93727)

(assert (=> start!117172 (= res!920920 (and (bvslt (size!45813 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge to!375 from!3579) (bvslt to!375 (size!45813 a!4212))))))

(assert (=> start!117172 e!781263))

(declare-fun array_inv!34543 (array!93727) Bool)

(assert (=> start!117172 (array_inv!34543 a!4212)))

(assert (=> start!117172 true))

(declare-fun b!1378991 () Bool)

(declare-fun res!920922 () Bool)

(assert (=> b!1378991 (=> (not res!920922) (not e!781263))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1378991 (= res!920922 (not (validKeyInArray!0 (select (arr!45262 a!4212) to!375))))))

(declare-fun b!1378992 () Bool)

(declare-fun res!920921 () Bool)

(assert (=> b!1378992 (=> (not res!920921) (not e!781263))))

(assert (=> b!1378992 (= res!920921 (and (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375))))))

(declare-fun b!1378993 () Bool)

(declare-fun lt!606612 () (_ BitVec 32))

(declare-fun lt!606613 () (_ BitVec 32))

(assert (=> b!1378993 (= e!781263 (not (= lt!606612 lt!606613)))))

(declare-fun lt!606615 () (_ BitVec 32))

(assert (=> b!1378993 (= (bvadd lt!606613 lt!606615) lt!606612)))

(declare-fun arrayCountValidKeys!0 (array!93727 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1378993 (= lt!606612 (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1378993 (= lt!606615 (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> b!1378993 (= lt!606613 (arrayCountValidKeys!0 a!4212 from!3579 to!375))))

(declare-datatypes ((Unit!45650 0))(
  ( (Unit!45651) )
))
(declare-fun lt!606614 () Unit!45650)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45650)

(assert (=> b!1378993 (= lt!606614 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (= (and start!117172 res!920920) b!1378991))

(assert (= (and b!1378991 res!920922) b!1378992))

(assert (= (and b!1378992 res!920921) b!1378993))

(declare-fun m!1263705 () Bool)

(assert (=> start!117172 m!1263705))

(declare-fun m!1263707 () Bool)

(assert (=> b!1378991 m!1263707))

(assert (=> b!1378991 m!1263707))

(declare-fun m!1263709 () Bool)

(assert (=> b!1378991 m!1263709))

(declare-fun m!1263711 () Bool)

(assert (=> b!1378993 m!1263711))

(declare-fun m!1263713 () Bool)

(assert (=> b!1378993 m!1263713))

(declare-fun m!1263715 () Bool)

(assert (=> b!1378993 m!1263715))

(declare-fun m!1263717 () Bool)

(assert (=> b!1378993 m!1263717))

(check-sat (not b!1378993) (not start!117172) (not b!1378991))
(check-sat)
(get-model)

(declare-fun bm!66082 () Bool)

(declare-fun call!66085 () (_ BitVec 32))

(assert (=> bm!66082 (= call!66085 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1379020 () Bool)

(declare-fun e!781281 () (_ BitVec 32))

(assert (=> b!1379020 (= e!781281 call!66085)))

(declare-fun b!1379021 () Bool)

(declare-fun e!781282 () (_ BitVec 32))

(assert (=> b!1379021 (= e!781282 #b00000000000000000000000000000000)))

(declare-fun b!1379022 () Bool)

(assert (=> b!1379022 (= e!781282 e!781281)))

(declare-fun c!128487 () Bool)

(assert (=> b!1379022 (= c!128487 (validKeyInArray!0 (select (arr!45262 a!4212) from!3579)))))

(declare-fun d!148785 () Bool)

(declare-fun lt!606642 () (_ BitVec 32))

(assert (=> d!148785 (and (bvsge lt!606642 #b00000000000000000000000000000000) (bvsle lt!606642 (bvsub (size!45813 a!4212) from!3579)))))

(assert (=> d!148785 (= lt!606642 e!781282)))

(declare-fun c!128488 () Bool)

(assert (=> d!148785 (= c!128488 (bvsge from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148785 (and (bvsle from!3579 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45813 a!4212)))))

(assert (=> d!148785 (= (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)) lt!606642)))

(declare-fun b!1379023 () Bool)

(assert (=> b!1379023 (= e!781281 (bvadd #b00000000000000000000000000000001 call!66085))))

(assert (= (and d!148785 c!128488) b!1379021))

(assert (= (and d!148785 (not c!128488)) b!1379022))

(assert (= (and b!1379022 c!128487) b!1379023))

(assert (= (and b!1379022 (not c!128487)) b!1379020))

(assert (= (or b!1379023 b!1379020) bm!66082))

(declare-fun m!1263747 () Bool)

(assert (=> bm!66082 m!1263747))

(declare-fun m!1263749 () Bool)

(assert (=> b!1379022 m!1263749))

(assert (=> b!1379022 m!1263749))

(declare-fun m!1263751 () Bool)

(assert (=> b!1379022 m!1263751))

(assert (=> b!1378993 d!148785))

(declare-fun bm!66083 () Bool)

(declare-fun call!66086 () (_ BitVec 32))

(assert (=> bm!66083 (= call!66086 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1379024 () Bool)

(declare-fun e!781283 () (_ BitVec 32))

(assert (=> b!1379024 (= e!781283 call!66086)))

(declare-fun b!1379025 () Bool)

(declare-fun e!781284 () (_ BitVec 32))

(assert (=> b!1379025 (= e!781284 #b00000000000000000000000000000000)))

(declare-fun b!1379026 () Bool)

(assert (=> b!1379026 (= e!781284 e!781283)))

(declare-fun c!128489 () Bool)

(assert (=> b!1379026 (= c!128489 (validKeyInArray!0 (select (arr!45262 a!4212) to!375)))))

(declare-fun d!148787 () Bool)

(declare-fun lt!606643 () (_ BitVec 32))

(assert (=> d!148787 (and (bvsge lt!606643 #b00000000000000000000000000000000) (bvsle lt!606643 (bvsub (size!45813 a!4212) to!375)))))

(assert (=> d!148787 (= lt!606643 e!781284)))

(declare-fun c!128490 () Bool)

(assert (=> d!148787 (= c!128490 (bvsge to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148787 (and (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)) (bvsge to!375 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45813 a!4212)))))

(assert (=> d!148787 (= (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375)) lt!606643)))

(declare-fun b!1379027 () Bool)

(assert (=> b!1379027 (= e!781283 (bvadd #b00000000000000000000000000000001 call!66086))))

(assert (= (and d!148787 c!128490) b!1379025))

(assert (= (and d!148787 (not c!128490)) b!1379026))

(assert (= (and b!1379026 c!128489) b!1379027))

(assert (= (and b!1379026 (not c!128489)) b!1379024))

(assert (= (or b!1379027 b!1379024) bm!66083))

(declare-fun m!1263753 () Bool)

(assert (=> bm!66083 m!1263753))

(assert (=> b!1379026 m!1263707))

(assert (=> b!1379026 m!1263707))

(assert (=> b!1379026 m!1263709))

(assert (=> b!1378993 d!148787))

(declare-fun call!66087 () (_ BitVec 32))

(declare-fun bm!66084 () Bool)

(assert (=> bm!66084 (= call!66087 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1379028 () Bool)

(declare-fun e!781285 () (_ BitVec 32))

(assert (=> b!1379028 (= e!781285 call!66087)))

(declare-fun b!1379029 () Bool)

(declare-fun e!781286 () (_ BitVec 32))

(assert (=> b!1379029 (= e!781286 #b00000000000000000000000000000000)))

(declare-fun b!1379030 () Bool)

(assert (=> b!1379030 (= e!781286 e!781285)))

(declare-fun c!128491 () Bool)

(assert (=> b!1379030 (= c!128491 (validKeyInArray!0 (select (arr!45262 a!4212) from!3579)))))

(declare-fun d!148789 () Bool)

(declare-fun lt!606644 () (_ BitVec 32))

(assert (=> d!148789 (and (bvsge lt!606644 #b00000000000000000000000000000000) (bvsle lt!606644 (bvsub (size!45813 a!4212) from!3579)))))

(assert (=> d!148789 (= lt!606644 e!781286)))

(declare-fun c!128492 () Bool)

(assert (=> d!148789 (= c!128492 (bvsge from!3579 to!375))))

(assert (=> d!148789 (and (bvsle from!3579 to!375) (bvsge from!3579 #b00000000000000000000000000000000) (bvsle to!375 (size!45813 a!4212)))))

(assert (=> d!148789 (= (arrayCountValidKeys!0 a!4212 from!3579 to!375) lt!606644)))

(declare-fun b!1379031 () Bool)

(assert (=> b!1379031 (= e!781285 (bvadd #b00000000000000000000000000000001 call!66087))))

(assert (= (and d!148789 c!128492) b!1379029))

(assert (= (and d!148789 (not c!128492)) b!1379030))

(assert (= (and b!1379030 c!128491) b!1379031))

(assert (= (and b!1379030 (not c!128491)) b!1379028))

(assert (= (or b!1379031 b!1379028) bm!66084))

(declare-fun m!1263755 () Bool)

(assert (=> bm!66084 m!1263755))

(assert (=> b!1379030 m!1263749))

(assert (=> b!1379030 m!1263749))

(assert (=> b!1379030 m!1263751))

(assert (=> b!1378993 d!148789))

(declare-fun d!148791 () Bool)

(assert (=> d!148791 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun lt!606649 () Unit!45650)

(declare-fun choose!61 (array!93727 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45650)

(assert (=> d!148791 (= lt!606649 (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375))))

(assert (=> d!148791 (and (bvslt (size!45813 a!4212) #b01111111111111111111111111111111) (bvsge from!3579 #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 to!375) from!3579) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45813 a!4212)) (bvsge to!375 from!3579) (bvsle to!375 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148791 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) lt!606649)))

(declare-fun bs!39622 () Bool)

(assert (= bs!39622 d!148791))

(assert (=> bs!39622 m!1263715))

(assert (=> bs!39622 m!1263713))

(assert (=> bs!39622 m!1263711))

(declare-fun m!1263757 () Bool)

(assert (=> bs!39622 m!1263757))

(assert (=> b!1378993 d!148791))

(declare-fun d!148797 () Bool)

(assert (=> d!148797 (= (array_inv!34543 a!4212) (bvsge (size!45813 a!4212) #b00000000000000000000000000000000))))

(assert (=> start!117172 d!148797))

(declare-fun d!148799 () Bool)

(assert (=> d!148799 (= (validKeyInArray!0 (select (arr!45262 a!4212) to!375)) (and (not (= (select (arr!45262 a!4212) to!375) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45262 a!4212) to!375) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1378991 d!148799))

(check-sat (not b!1379026) (not bm!66084) (not b!1379030) (not bm!66082) (not bm!66083) (not b!1379022) (not d!148791))
(check-sat)
(get-model)

(declare-fun call!66098 () (_ BitVec 32))

(declare-fun bm!66095 () Bool)

(assert (=> bm!66095 (= call!66098 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!375))))

(declare-fun b!1379072 () Bool)

(declare-fun e!781307 () (_ BitVec 32))

(assert (=> b!1379072 (= e!781307 call!66098)))

(declare-fun b!1379073 () Bool)

(declare-fun e!781308 () (_ BitVec 32))

(assert (=> b!1379073 (= e!781308 #b00000000000000000000000000000000)))

(declare-fun b!1379074 () Bool)

(assert (=> b!1379074 (= e!781308 e!781307)))

(declare-fun c!128513 () Bool)

(assert (=> b!1379074 (= c!128513 (validKeyInArray!0 (select (arr!45262 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun d!148821 () Bool)

(declare-fun lt!606664 () (_ BitVec 32))

(assert (=> d!148821 (and (bvsge lt!606664 #b00000000000000000000000000000000) (bvsle lt!606664 (bvsub (size!45813 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (=> d!148821 (= lt!606664 e!781308)))

(declare-fun c!128514 () Bool)

(assert (=> d!148821 (= c!128514 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) to!375))))

(assert (=> d!148821 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) to!375) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle to!375 (size!45813 a!4212)))))

(assert (=> d!148821 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) to!375) lt!606664)))

(declare-fun b!1379075 () Bool)

(assert (=> b!1379075 (= e!781307 (bvadd #b00000000000000000000000000000001 call!66098))))

(assert (= (and d!148821 c!128514) b!1379073))

(assert (= (and d!148821 (not c!128514)) b!1379074))

(assert (= (and b!1379074 c!128513) b!1379075))

(assert (= (and b!1379074 (not c!128513)) b!1379072))

(assert (= (or b!1379075 b!1379072) bm!66095))

(declare-fun m!1263783 () Bool)

(assert (=> bm!66095 m!1263783))

(declare-fun m!1263785 () Bool)

(assert (=> b!1379074 m!1263785))

(assert (=> b!1379074 m!1263785))

(declare-fun m!1263787 () Bool)

(assert (=> b!1379074 m!1263787))

(assert (=> bm!66084 d!148821))

(declare-fun bm!66096 () Bool)

(declare-fun call!66099 () (_ BitVec 32))

(assert (=> bm!66096 (= call!66099 (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1379076 () Bool)

(declare-fun e!781309 () (_ BitVec 32))

(assert (=> b!1379076 (= e!781309 call!66099)))

(declare-fun b!1379077 () Bool)

(declare-fun e!781310 () (_ BitVec 32))

(assert (=> b!1379077 (= e!781310 #b00000000000000000000000000000000)))

(declare-fun b!1379078 () Bool)

(assert (=> b!1379078 (= e!781310 e!781309)))

(declare-fun c!128515 () Bool)

(assert (=> b!1379078 (= c!128515 (validKeyInArray!0 (select (arr!45262 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(declare-fun d!148823 () Bool)

(declare-fun lt!606665 () (_ BitVec 32))

(assert (=> d!148823 (and (bvsge lt!606665 #b00000000000000000000000000000000) (bvsle lt!606665 (bvsub (size!45813 a!4212) (bvadd to!375 #b00000000000000000000000000000001))))))

(assert (=> d!148823 (= lt!606665 e!781310)))

(declare-fun c!128516 () Bool)

(assert (=> d!148823 (= c!128516 (bvsge (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148823 (and (bvsle (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd to!375 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45813 a!4212)))))

(assert (=> d!148823 (= (arrayCountValidKeys!0 a!4212 (bvadd to!375 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606665)))

(declare-fun b!1379079 () Bool)

(assert (=> b!1379079 (= e!781309 (bvadd #b00000000000000000000000000000001 call!66099))))

(assert (= (and d!148823 c!128516) b!1379077))

(assert (= (and d!148823 (not c!128516)) b!1379078))

(assert (= (and b!1379078 c!128515) b!1379079))

(assert (= (and b!1379078 (not c!128515)) b!1379076))

(assert (= (or b!1379079 b!1379076) bm!66096))

(declare-fun m!1263789 () Bool)

(assert (=> bm!66096 m!1263789))

(declare-fun m!1263791 () Bool)

(assert (=> b!1379078 m!1263791))

(assert (=> b!1379078 m!1263791))

(declare-fun m!1263793 () Bool)

(assert (=> b!1379078 m!1263793))

(assert (=> bm!66083 d!148823))

(declare-fun d!148825 () Bool)

(assert (=> d!148825 (= (validKeyInArray!0 (select (arr!45262 a!4212) from!3579)) (and (not (= (select (arr!45262 a!4212) from!3579) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45262 a!4212) from!3579) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379022 d!148825))

(assert (=> d!148791 d!148789))

(assert (=> d!148791 d!148787))

(assert (=> d!148791 d!148785))

(declare-fun d!148827 () Bool)

(assert (=> d!148827 (= (bvadd (arrayCountValidKeys!0 a!4212 from!3579 to!375) (arrayCountValidKeys!0 a!4212 to!375 (bvadd #b00000000000000000000000000000001 to!375))) (arrayCountValidKeys!0 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148827 true))

(declare-fun _$76!55 () Unit!45650)

(assert (=> d!148827 (= (choose!61 a!4212 from!3579 (bvadd #b00000000000000000000000000000001 to!375) to!375) _$76!55)))

(declare-fun bs!39625 () Bool)

(assert (= bs!39625 d!148827))

(assert (=> bs!39625 m!1263715))

(assert (=> bs!39625 m!1263713))

(assert (=> bs!39625 m!1263711))

(assert (=> d!148791 d!148827))

(declare-fun bm!66097 () Bool)

(declare-fun call!66100 () (_ BitVec 32))

(assert (=> bm!66097 (= call!66100 (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(declare-fun b!1379080 () Bool)

(declare-fun e!781311 () (_ BitVec 32))

(assert (=> b!1379080 (= e!781311 call!66100)))

(declare-fun b!1379081 () Bool)

(declare-fun e!781312 () (_ BitVec 32))

(assert (=> b!1379081 (= e!781312 #b00000000000000000000000000000000)))

(declare-fun b!1379082 () Bool)

(assert (=> b!1379082 (= e!781312 e!781311)))

(declare-fun c!128517 () Bool)

(assert (=> b!1379082 (= c!128517 (validKeyInArray!0 (select (arr!45262 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(declare-fun d!148829 () Bool)

(declare-fun lt!606666 () (_ BitVec 32))

(assert (=> d!148829 (and (bvsge lt!606666 #b00000000000000000000000000000000) (bvsle lt!606666 (bvsub (size!45813 a!4212) (bvadd from!3579 #b00000000000000000000000000000001))))))

(assert (=> d!148829 (= lt!606666 e!781312)))

(declare-fun c!128518 () Bool)

(assert (=> d!148829 (= c!128518 (bvsge (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)))))

(assert (=> d!148829 (and (bvsle (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) (bvsge (bvadd from!3579 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 to!375) (size!45813 a!4212)))))

(assert (=> d!148829 (= (arrayCountValidKeys!0 a!4212 (bvadd from!3579 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 to!375)) lt!606666)))

(declare-fun b!1379083 () Bool)

(assert (=> b!1379083 (= e!781311 (bvadd #b00000000000000000000000000000001 call!66100))))

(assert (= (and d!148829 c!128518) b!1379081))

(assert (= (and d!148829 (not c!128518)) b!1379082))

(assert (= (and b!1379082 c!128517) b!1379083))

(assert (= (and b!1379082 (not c!128517)) b!1379080))

(assert (= (or b!1379083 b!1379080) bm!66097))

(declare-fun m!1263795 () Bool)

(assert (=> bm!66097 m!1263795))

(assert (=> b!1379082 m!1263785))

(assert (=> b!1379082 m!1263785))

(assert (=> b!1379082 m!1263787))

(assert (=> bm!66082 d!148829))

(assert (=> b!1379030 d!148825))

(assert (=> b!1379026 d!148799))

(check-sat (not bm!66097) (not b!1379074) (not d!148827) (not b!1379078) (not b!1379082) (not bm!66095) (not bm!66096))
(check-sat)
