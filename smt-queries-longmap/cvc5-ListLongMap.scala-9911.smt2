; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117210 () Bool)

(assert start!117210)

(declare-fun res!921793 () Bool)

(declare-fun e!781313 () Bool)

(assert (=> start!117210 (=> (not res!921793) (not e!781313))))

(declare-fun i!1451 () (_ BitVec 32))

(declare-datatypes ((array!93781 0))(
  ( (array!93782 (arr!45291 (Array (_ BitVec 32) (_ BitVec 64))) (size!45843 (_ BitVec 32))) )
))
(declare-fun a!4094 () array!93781)

(assert (=> start!117210 (= res!921793 (and (bvsge i!1451 #b00000000000000000000000000000000) (bvslt i!1451 (size!45843 a!4094))))))

(assert (=> start!117210 e!781313))

(assert (=> start!117210 true))

(declare-fun array_inv!34524 (array!93781) Bool)

(assert (=> start!117210 (array_inv!34524 a!4094)))

(declare-fun b!1379216 () Bool)

(declare-fun res!921794 () Bool)

(assert (=> b!1379216 (=> (not res!921794) (not e!781313))))

(declare-fun k!2953 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1379216 (= res!921794 (not (validKeyInArray!0 k!2953)))))

(declare-fun b!1379217 () Bool)

(declare-fun res!921795 () Bool)

(assert (=> b!1379217 (=> (not res!921795) (not e!781313))))

(declare-fun from!3466 () (_ BitVec 32))

(assert (=> b!1379217 (= res!921795 (and (bvslt (size!45843 a!4094) #b01111111111111111111111111111111) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle from!3466 (size!45843 a!4094)) (bvsge i!1451 from!3466)))))

(declare-fun e!781315 () Bool)

(declare-fun lt!607170 () (_ BitVec 32))

(declare-fun lt!607171 () (_ BitVec 32))

(declare-fun b!1379218 () Bool)

(assert (=> b!1379218 (= e!781315 (not (or (bvsgt (bvsub from!3466 #b00000000000000000000000000000001) (size!45843 a!4094)) (bvslt i!1451 (bvsub from!3466 #b00000000000000000000000000000001)) (= lt!607170 (bvsub lt!607171 #b00000000000000000000000000000001)))))))

(declare-fun lt!607166 () (_ BitVec 32))

(declare-fun lt!607167 () (_ BitVec 32))

(assert (=> b!1379218 (= (bvadd lt!607166 lt!607167) lt!607170)))

(declare-fun lt!607169 () array!93781)

(declare-fun arrayCountValidKeys!0 (array!93781 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1379218 (= lt!607170 (arrayCountValidKeys!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379218 (= lt!607166 (arrayCountValidKeys!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-datatypes ((Unit!45700 0))(
  ( (Unit!45701) )
))
(declare-fun lt!607165 () Unit!45700)

(declare-fun lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 (array!93781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45700)

(assert (=> b!1379218 (= lt!607165 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun lt!607168 () (_ BitVec 32))

(declare-fun lt!607164 () (_ BitVec 32))

(assert (=> b!1379218 (= (bvadd lt!607168 lt!607164) lt!607171)))

(assert (=> b!1379218 (= lt!607171 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379218 (= lt!607168 (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(declare-fun lt!607172 () Unit!45700)

(assert (=> b!1379218 (= lt!607172 (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(declare-fun b!1379219 () Bool)

(assert (=> b!1379219 (= e!781313 e!781315)))

(declare-fun res!921797 () Bool)

(assert (=> b!1379219 (=> (not res!921797) (not e!781315))))

(assert (=> b!1379219 (= res!921797 (and (= lt!607167 (bvsub lt!607164 #b00000000000000000000000000000001)) (bvsgt from!3466 #b00000000000000000000000000000000)))))

(assert (=> b!1379219 (= lt!607167 (arrayCountValidKeys!0 lt!607169 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379219 (= lt!607164 (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> b!1379219 (= lt!607169 (array!93782 (store (arr!45291 a!4094) i!1451 k!2953) (size!45843 a!4094)))))

(declare-fun b!1379220 () Bool)

(declare-fun res!921796 () Bool)

(assert (=> b!1379220 (=> (not res!921796) (not e!781313))))

(assert (=> b!1379220 (= res!921796 (validKeyInArray!0 (select (arr!45291 a!4094) i!1451)))))

(assert (= (and start!117210 res!921793) b!1379220))

(assert (= (and b!1379220 res!921796) b!1379216))

(assert (= (and b!1379216 res!921794) b!1379217))

(assert (= (and b!1379217 res!921795) b!1379219))

(assert (= (and b!1379219 res!921797) b!1379218))

(declare-fun m!1263805 () Bool)

(assert (=> b!1379218 m!1263805))

(declare-fun m!1263807 () Bool)

(assert (=> b!1379218 m!1263807))

(declare-fun m!1263809 () Bool)

(assert (=> b!1379218 m!1263809))

(declare-fun m!1263811 () Bool)

(assert (=> b!1379218 m!1263811))

(declare-fun m!1263813 () Bool)

(assert (=> b!1379218 m!1263813))

(declare-fun m!1263815 () Bool)

(assert (=> b!1379218 m!1263815))

(declare-fun m!1263817 () Bool)

(assert (=> b!1379220 m!1263817))

(assert (=> b!1379220 m!1263817))

(declare-fun m!1263819 () Bool)

(assert (=> b!1379220 m!1263819))

(declare-fun m!1263821 () Bool)

(assert (=> start!117210 m!1263821))

(declare-fun m!1263823 () Bool)

(assert (=> b!1379219 m!1263823))

(declare-fun m!1263825 () Bool)

(assert (=> b!1379219 m!1263825))

(declare-fun m!1263827 () Bool)

(assert (=> b!1379219 m!1263827))

(declare-fun m!1263829 () Bool)

(assert (=> b!1379216 m!1263829))

(push 1)

(assert (not b!1379220))

(assert (not b!1379218))

(assert (not start!117210))

(assert (not b!1379216))

(assert (not b!1379219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1379261 () Bool)

(declare-fun e!781337 () (_ BitVec 32))

(declare-fun call!66053 () (_ BitVec 32))

(assert (=> b!1379261 (= e!781337 call!66053)))

(declare-fun d!148425 () Bool)

(declare-fun lt!607187 () (_ BitVec 32))

(assert (=> d!148425 (and (bvsge lt!607187 #b00000000000000000000000000000000) (bvsle lt!607187 (bvsub (size!45843 lt!607169) from!3466)))))

(declare-fun e!781336 () (_ BitVec 32))

(assert (=> d!148425 (= lt!607187 e!781336)))

(declare-fun c!128175 () Bool)

(assert (=> d!148425 (= c!128175 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148425 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45843 lt!607169)))))

(assert (=> d!148425 (= (arrayCountValidKeys!0 lt!607169 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607187)))

(declare-fun b!1379262 () Bool)

(assert (=> b!1379262 (= e!781336 #b00000000000000000000000000000000)))

(declare-fun b!1379263 () Bool)

(assert (=> b!1379263 (= e!781337 (bvadd #b00000000000000000000000000000001 call!66053))))

(declare-fun bm!66050 () Bool)

(assert (=> bm!66050 (= call!66053 (arrayCountValidKeys!0 lt!607169 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379264 () Bool)

(assert (=> b!1379264 (= e!781336 e!781337)))

(declare-fun c!128174 () Bool)

(assert (=> b!1379264 (= c!128174 (validKeyInArray!0 (select (arr!45291 lt!607169) from!3466)))))

(assert (= (and d!148425 c!128175) b!1379262))

(assert (= (and d!148425 (not c!128175)) b!1379264))

(assert (= (and b!1379264 c!128174) b!1379263))

(assert (= (and b!1379264 (not c!128174)) b!1379261))

(assert (= (or b!1379263 b!1379261) bm!66050))

(declare-fun m!1263863 () Bool)

(assert (=> bm!66050 m!1263863))

(declare-fun m!1263865 () Bool)

(assert (=> b!1379264 m!1263865))

(assert (=> b!1379264 m!1263865))

(declare-fun m!1263867 () Bool)

(assert (=> b!1379264 m!1263867))

(assert (=> b!1379219 d!148425))

(declare-fun b!1379265 () Bool)

(declare-fun e!781339 () (_ BitVec 32))

(declare-fun call!66054 () (_ BitVec 32))

(assert (=> b!1379265 (= e!781339 call!66054)))

(declare-fun d!148427 () Bool)

(declare-fun lt!607188 () (_ BitVec 32))

(assert (=> d!148427 (and (bvsge lt!607188 #b00000000000000000000000000000000) (bvsle lt!607188 (bvsub (size!45843 a!4094) from!3466)))))

(declare-fun e!781338 () (_ BitVec 32))

(assert (=> d!148427 (= lt!607188 e!781338)))

(declare-fun c!128177 () Bool)

(assert (=> d!148427 (= c!128177 (bvsge from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148427 (and (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge from!3466 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45843 a!4094)))))

(assert (=> d!148427 (= (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451)) lt!607188)))

(declare-fun b!1379266 () Bool)

(assert (=> b!1379266 (= e!781338 #b00000000000000000000000000000000)))

(declare-fun b!1379267 () Bool)

(assert (=> b!1379267 (= e!781339 (bvadd #b00000000000000000000000000000001 call!66054))))

(declare-fun bm!66051 () Bool)

(assert (=> bm!66051 (= call!66054 (arrayCountValidKeys!0 a!4094 (bvadd from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379268 () Bool)

(assert (=> b!1379268 (= e!781338 e!781339)))

(declare-fun c!128176 () Bool)

(assert (=> b!1379268 (= c!128176 (validKeyInArray!0 (select (arr!45291 a!4094) from!3466)))))

(assert (= (and d!148427 c!128177) b!1379266))

(assert (= (and d!148427 (not c!128177)) b!1379268))

(assert (= (and b!1379268 c!128176) b!1379267))

(assert (= (and b!1379268 (not c!128176)) b!1379265))

(assert (= (or b!1379267 b!1379265) bm!66051))

(declare-fun m!1263869 () Bool)

(assert (=> bm!66051 m!1263869))

(declare-fun m!1263871 () Bool)

(assert (=> b!1379268 m!1263871))

(assert (=> b!1379268 m!1263871))

(declare-fun m!1263873 () Bool)

(assert (=> b!1379268 m!1263873))

(assert (=> b!1379219 d!148427))

(declare-fun d!148429 () Bool)

(assert (=> d!148429 (= (array_inv!34524 a!4094) (bvsge (size!45843 a!4094) #b00000000000000000000000000000000))))

(assert (=> start!117210 d!148429))

(declare-fun b!1379269 () Bool)

(declare-fun e!781341 () (_ BitVec 32))

(declare-fun call!66055 () (_ BitVec 32))

(assert (=> b!1379269 (= e!781341 call!66055)))

(declare-fun d!148433 () Bool)

(declare-fun lt!607189 () (_ BitVec 32))

(assert (=> d!148433 (and (bvsge lt!607189 #b00000000000000000000000000000000) (bvsle lt!607189 (bvsub (size!45843 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781340 () (_ BitVec 32))

(assert (=> d!148433 (= lt!607189 e!781340)))

(declare-fun c!128179 () Bool)

(assert (=> d!148433 (= c!128179 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148433 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45843 a!4094)))))

(assert (=> d!148433 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607189)))

(declare-fun b!1379270 () Bool)

(assert (=> b!1379270 (= e!781340 #b00000000000000000000000000000000)))

(declare-fun b!1379271 () Bool)

(assert (=> b!1379271 (= e!781341 (bvadd #b00000000000000000000000000000001 call!66055))))

(declare-fun bm!66052 () Bool)

(assert (=> bm!66052 (= call!66055 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379272 () Bool)

(assert (=> b!1379272 (= e!781340 e!781341)))

(declare-fun c!128178 () Bool)

(assert (=> b!1379272 (= c!128178 (validKeyInArray!0 (select (arr!45291 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (= (and d!148433 c!128179) b!1379270))

(assert (= (and d!148433 (not c!128179)) b!1379272))

(assert (= (and b!1379272 c!128178) b!1379271))

(assert (= (and b!1379272 (not c!128178)) b!1379269))

(assert (= (or b!1379271 b!1379269) bm!66052))

(declare-fun m!1263875 () Bool)

(assert (=> bm!66052 m!1263875))

(declare-fun m!1263877 () Bool)

(assert (=> b!1379272 m!1263877))

(assert (=> b!1379272 m!1263877))

(declare-fun m!1263879 () Bool)

(assert (=> b!1379272 m!1263879))

(assert (=> b!1379218 d!148433))

(declare-fun d!148435 () Bool)

(assert (=> d!148435 (= (bvadd (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 a!4094 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607194 () Unit!45700)

(declare-fun choose!61 (array!93781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45700)

(assert (=> d!148435 (= lt!607194 (choose!61 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148435 (and (bvslt (size!45843 a!4094) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45843 a!4094)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148435 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607194)))

(declare-fun bs!39699 () Bool)

(assert (= bs!39699 d!148435))

(assert (=> bs!39699 m!1263805))

(assert (=> bs!39699 m!1263825))

(assert (=> bs!39699 m!1263809))

(declare-fun m!1263881 () Bool)

(assert (=> bs!39699 m!1263881))

(assert (=> b!1379218 d!148435))

(declare-fun b!1379281 () Bool)

(declare-fun e!781347 () (_ BitVec 32))

(declare-fun call!66058 () (_ BitVec 32))

(assert (=> b!1379281 (= e!781347 call!66058)))

(declare-fun d!148437 () Bool)

(declare-fun lt!607195 () (_ BitVec 32))

(assert (=> d!148437 (and (bvsge lt!607195 #b00000000000000000000000000000000) (bvsle lt!607195 (bvsub (size!45843 lt!607169) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781346 () (_ BitVec 32))

(assert (=> d!148437 (= lt!607195 e!781346)))

(declare-fun c!128185 () Bool)

(assert (=> d!148437 (= c!128185 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148437 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45843 lt!607169)))))

(assert (=> d!148437 (= (arrayCountValidKeys!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607195)))

(declare-fun b!1379282 () Bool)

(assert (=> b!1379282 (= e!781346 #b00000000000000000000000000000000)))

(declare-fun b!1379283 () Bool)

(assert (=> b!1379283 (= e!781347 (bvadd #b00000000000000000000000000000001 call!66058))))

(declare-fun bm!66055 () Bool)

(assert (=> bm!66055 (= call!66058 (arrayCountValidKeys!0 lt!607169 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1379284 () Bool)

(assert (=> b!1379284 (= e!781346 e!781347)))

(declare-fun c!128184 () Bool)

(assert (=> b!1379284 (= c!128184 (validKeyInArray!0 (select (arr!45291 lt!607169) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (= (and d!148437 c!128185) b!1379282))

(assert (= (and d!148437 (not c!128185)) b!1379284))

(assert (= (and b!1379284 c!128184) b!1379283))

(assert (= (and b!1379284 (not c!128184)) b!1379281))

(assert (= (or b!1379283 b!1379281) bm!66055))

(declare-fun m!1263883 () Bool)

(assert (=> bm!66055 m!1263883))

(declare-fun m!1263885 () Bool)

(assert (=> b!1379284 m!1263885))

(assert (=> b!1379284 m!1263885))

(declare-fun m!1263887 () Bool)

(assert (=> b!1379284 m!1263887))

(assert (=> b!1379218 d!148437))

(declare-fun d!148439 () Bool)

(assert (=> d!148439 (= (bvadd (arrayCountValidKeys!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (arrayCountValidKeys!0 lt!607169 from!3466 (bvadd #b00000000000000000000000000000001 i!1451))) (arrayCountValidKeys!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun lt!607197 () Unit!45700)

(assert (=> d!148439 (= lt!607197 (choose!61 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466))))

(assert (=> d!148439 (and (bvslt (size!45843 lt!607169) #b01111111111111111111111111111111) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvadd #b00000000000000000000000000000001 i!1451) (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45843 lt!607169)) (bvsge from!3466 (bvsub from!3466 #b00000000000000000000000000000001)) (bvsle from!3466 (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148439 (= (lemmaSumOfNumOfKeysOfSubArraysIsEqualToWhole!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451) from!3466) lt!607197)))

(declare-fun bs!39700 () Bool)

(assert (= bs!39700 d!148439))

(assert (=> bs!39700 m!1263815))

(assert (=> bs!39700 m!1263823))

(assert (=> bs!39700 m!1263813))

(declare-fun m!1263895 () Bool)

(assert (=> bs!39700 m!1263895))

(assert (=> b!1379218 d!148439))

(declare-fun b!1379293 () Bool)

(declare-fun e!781353 () (_ BitVec 32))

(declare-fun call!66061 () (_ BitVec 32))

(assert (=> b!1379293 (= e!781353 call!66061)))

(declare-fun d!148443 () Bool)

(declare-fun lt!607199 () (_ BitVec 32))

(assert (=> d!148443 (and (bvsge lt!607199 #b00000000000000000000000000000000) (bvsle lt!607199 (bvsub (size!45843 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781352 () (_ BitVec 32))

(assert (=> d!148443 (= lt!607199 e!781352)))

(declare-fun c!128191 () Bool)

(assert (=> d!148443 (= c!128191 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) from!3466))))

(assert (=> d!148443 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) from!3466) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle from!3466 (size!45843 a!4094)))))

(assert (=> d!148443 (= (arrayCountValidKeys!0 a!4094 (bvsub from!3466 #b00000000000000000000000000000001) from!3466) lt!607199)))

(declare-fun b!1379294 () Bool)

(assert (=> b!1379294 (= e!781352 #b00000000000000000000000000000000)))

(declare-fun b!1379295 () Bool)

(assert (=> b!1379295 (= e!781353 (bvadd #b00000000000000000000000000000001 call!66061))))

(declare-fun bm!66058 () Bool)

(assert (=> bm!66058 (= call!66061 (arrayCountValidKeys!0 a!4094 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) from!3466))))

(declare-fun b!1379296 () Bool)

(assert (=> b!1379296 (= e!781352 e!781353)))

(declare-fun c!128190 () Bool)

(assert (=> b!1379296 (= c!128190 (validKeyInArray!0 (select (arr!45291 a!4094) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (= (and d!148443 c!128191) b!1379294))

(assert (= (and d!148443 (not c!128191)) b!1379296))

(assert (= (and b!1379296 c!128190) b!1379295))

(assert (= (and b!1379296 (not c!128190)) b!1379293))

(assert (= (or b!1379295 b!1379293) bm!66058))

(declare-fun m!1263903 () Bool)

(assert (=> bm!66058 m!1263903))

(assert (=> b!1379296 m!1263877))

(assert (=> b!1379296 m!1263877))

(assert (=> b!1379296 m!1263879))

(assert (=> b!1379218 d!148443))

(declare-fun b!1379297 () Bool)

(declare-fun e!781355 () (_ BitVec 32))

(declare-fun call!66062 () (_ BitVec 32))

(assert (=> b!1379297 (= e!781355 call!66062)))

(declare-fun d!148447 () Bool)

(declare-fun lt!607200 () (_ BitVec 32))

(assert (=> d!148447 (and (bvsge lt!607200 #b00000000000000000000000000000000) (bvsle lt!607200 (bvsub (size!45843 lt!607169) (bvsub from!3466 #b00000000000000000000000000000001))))))

(declare-fun e!781354 () (_ BitVec 32))

(assert (=> d!148447 (= lt!607200 e!781354)))

(declare-fun c!128193 () Bool)

(assert (=> d!148447 (= c!128193 (bvsge (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(assert (=> d!148447 (and (bvsle (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) (bvsge (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1451) (size!45843 lt!607169)))))

(assert (=> d!148447 (= (arrayCountValidKeys!0 lt!607169 (bvsub from!3466 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)) lt!607200)))

(declare-fun b!1379298 () Bool)

(assert (=> b!1379298 (= e!781354 #b00000000000000000000000000000000)))

(declare-fun b!1379299 () Bool)

(assert (=> b!1379299 (= e!781355 (bvadd #b00000000000000000000000000000001 call!66062))))

(declare-fun bm!66059 () Bool)

(assert (=> bm!66059 (= call!66062 (arrayCountValidKeys!0 lt!607169 (bvadd (bvsub from!3466 #b00000000000000000000000000000001) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1451)))))

(declare-fun b!1379300 () Bool)

(assert (=> b!1379300 (= e!781354 e!781355)))

(declare-fun c!128192 () Bool)

(assert (=> b!1379300 (= c!128192 (validKeyInArray!0 (select (arr!45291 lt!607169) (bvsub from!3466 #b00000000000000000000000000000001))))))

(assert (= (and d!148447 c!128193) b!1379298))

(assert (= (and d!148447 (not c!128193)) b!1379300))

(assert (= (and b!1379300 c!128192) b!1379299))

(assert (= (and b!1379300 (not c!128192)) b!1379297))

(assert (= (or b!1379299 b!1379297) bm!66059))

(declare-fun m!1263905 () Bool)

(assert (=> bm!66059 m!1263905))

(assert (=> b!1379300 m!1263885))

(assert (=> b!1379300 m!1263885))

(assert (=> b!1379300 m!1263887))

(assert (=> b!1379218 d!148447))

(declare-fun d!148449 () Bool)

(assert (=> d!148449 (= (validKeyInArray!0 k!2953) (and (not (= k!2953 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2953 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379216 d!148449))

(declare-fun d!148451 () Bool)

(assert (=> d!148451 (= (validKeyInArray!0 (select (arr!45291 a!4094) i!1451)) (and (not (= (select (arr!45291 a!4094) i!1451) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45291 a!4094) i!1451) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1379220 d!148451))

(push 1)

(assert (not d!148435))

(assert (not b!1379300))

(assert (not bm!66059))

(assert (not bm!66058))

(assert (not b!1379272))

(assert (not b!1379268))

(assert (not bm!66051))

(assert (not b!1379284))

(assert (not bm!66052))

(assert (not b!1379296))

(assert (not b!1379264))

(assert (not d!148439))

(assert (not bm!66055))

(assert (not bm!66050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

