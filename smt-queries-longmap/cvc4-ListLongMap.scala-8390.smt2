; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102020 () Bool)

(assert start!102020)

(declare-fun res!817091 () Bool)

(declare-fun e!697228 () Bool)

(assert (=> start!102020 (=> (not res!817091) (not e!697228))))

(declare-datatypes ((array!79293 0))(
  ( (array!79294 (arr!38269 (Array (_ BitVec 32) (_ BitVec 64))) (size!38805 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79293)

(assert (=> start!102020 (= res!817091 (bvslt (size!38805 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102020 e!697228))

(declare-fun array_inv!29117 (array!79293) Bool)

(assert (=> start!102020 (array_inv!29117 a!3806)))

(assert (=> start!102020 true))

(declare-fun b!1228477 () Bool)

(declare-fun res!817093 () Bool)

(assert (=> b!1228477 (=> (not res!817093) (not e!697228))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228477 (= res!817093 (validKeyInArray!0 k!2913))))

(declare-fun b!1228478 () Bool)

(declare-fun res!817092 () Bool)

(assert (=> b!1228478 (=> (not res!817092) (not e!697228))))

(declare-datatypes ((List!27042 0))(
  ( (Nil!27039) (Cons!27038 (h!28247 (_ BitVec 64)) (t!40505 List!27042)) )
))
(declare-fun acc!823 () List!27042)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79293 (_ BitVec 32) List!27042) Bool)

(assert (=> b!1228478 (= res!817092 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1228479 () Bool)

(declare-fun e!697229 () Bool)

(declare-fun noDuplicate!1701 (List!27042) Bool)

(assert (=> b!1228479 (= e!697229 (noDuplicate!1701 (Cons!27038 (select (arr!38269 a!3806) from!3184) Nil!27039)))))

(declare-fun b!1228480 () Bool)

(declare-fun res!817096 () Bool)

(assert (=> b!1228480 (=> (not res!817096) (not e!697228))))

(declare-fun contains!7104 (List!27042 (_ BitVec 64)) Bool)

(assert (=> b!1228480 (= res!817096 (not (contains!7104 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228481 () Bool)

(declare-fun res!817090 () Bool)

(assert (=> b!1228481 (=> (not res!817090) (not e!697228))))

(declare-fun arrayContainsKey!0 (array!79293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228481 (= res!817090 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228482 () Bool)

(declare-fun res!817098 () Bool)

(assert (=> b!1228482 (=> (not res!817098) (not e!697228))))

(assert (=> b!1228482 (= res!817098 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38805 a!3806)) (bvslt from!3184 (size!38805 a!3806))))))

(declare-fun b!1228483 () Bool)

(assert (=> b!1228483 (= e!697228 (not e!697229))))

(declare-fun res!817094 () Bool)

(assert (=> b!1228483 (=> res!817094 e!697229)))

(assert (=> b!1228483 (= res!817094 (bvslt (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1228483 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27039)))

(declare-datatypes ((Unit!40704 0))(
  ( (Unit!40705) )
))
(declare-fun lt!559002 () Unit!40704)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79293 List!27042 List!27042 (_ BitVec 32)) Unit!40704)

(assert (=> b!1228483 (= lt!559002 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27039 from!3184))))

(assert (=> b!1228483 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27038 (select (arr!38269 a!3806) from!3184) acc!823))))

(declare-fun b!1228484 () Bool)

(declare-fun res!817095 () Bool)

(assert (=> b!1228484 (=> (not res!817095) (not e!697228))))

(assert (=> b!1228484 (= res!817095 (not (contains!7104 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228485 () Bool)

(declare-fun res!817097 () Bool)

(assert (=> b!1228485 (=> (not res!817097) (not e!697228))))

(assert (=> b!1228485 (= res!817097 (noDuplicate!1701 acc!823))))

(declare-fun b!1228486 () Bool)

(declare-fun res!817089 () Bool)

(assert (=> b!1228486 (=> (not res!817089) (not e!697228))))

(assert (=> b!1228486 (= res!817089 (validKeyInArray!0 (select (arr!38269 a!3806) from!3184)))))

(assert (= (and start!102020 res!817091) b!1228477))

(assert (= (and b!1228477 res!817093) b!1228482))

(assert (= (and b!1228482 res!817098) b!1228485))

(assert (= (and b!1228485 res!817097) b!1228480))

(assert (= (and b!1228480 res!817096) b!1228484))

(assert (= (and b!1228484 res!817095) b!1228481))

(assert (= (and b!1228481 res!817090) b!1228478))

(assert (= (and b!1228478 res!817092) b!1228486))

(assert (= (and b!1228486 res!817089) b!1228483))

(assert (= (and b!1228483 (not res!817094)) b!1228479))

(declare-fun m!1133011 () Bool)

(assert (=> start!102020 m!1133011))

(declare-fun m!1133013 () Bool)

(assert (=> b!1228481 m!1133013))

(declare-fun m!1133015 () Bool)

(assert (=> b!1228477 m!1133015))

(declare-fun m!1133017 () Bool)

(assert (=> b!1228485 m!1133017))

(declare-fun m!1133019 () Bool)

(assert (=> b!1228480 m!1133019))

(declare-fun m!1133021 () Bool)

(assert (=> b!1228483 m!1133021))

(declare-fun m!1133023 () Bool)

(assert (=> b!1228483 m!1133023))

(declare-fun m!1133025 () Bool)

(assert (=> b!1228483 m!1133025))

(declare-fun m!1133027 () Bool)

(assert (=> b!1228483 m!1133027))

(declare-fun m!1133029 () Bool)

(assert (=> b!1228484 m!1133029))

(assert (=> b!1228479 m!1133025))

(declare-fun m!1133031 () Bool)

(assert (=> b!1228479 m!1133031))

(assert (=> b!1228486 m!1133025))

(assert (=> b!1228486 m!1133025))

(declare-fun m!1133033 () Bool)

(assert (=> b!1228486 m!1133033))

(declare-fun m!1133035 () Bool)

(assert (=> b!1228478 m!1133035))

(push 1)

(assert (not b!1228480))

(assert (not b!1228478))

(assert (not b!1228483))

(assert (not b!1228477))

(assert (not b!1228486))

(assert (not b!1228484))

(assert (not b!1228481))

(assert (not b!1228479))

(assert (not b!1228485))

(assert (not start!102020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!134215 () Bool)

(declare-fun res!817130 () Bool)

(declare-fun e!697264 () Bool)

(assert (=> d!134215 (=> res!817130 e!697264)))

(assert (=> d!134215 (= res!817130 (= (select (arr!38269 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k!2913))))

(assert (=> d!134215 (= (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!697264)))

(declare-fun b!1228524 () Bool)

(declare-fun e!697265 () Bool)

(assert (=> b!1228524 (= e!697264 e!697265)))

(declare-fun res!817131 () Bool)

(assert (=> b!1228524 (=> (not res!817131) (not e!697265))))

(assert (=> b!1228524 (= res!817131 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38805 a!3806)))))

(declare-fun b!1228525 () Bool)

(assert (=> b!1228525 (= e!697265 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134215 (not res!817130)) b!1228524))

(assert (= (and b!1228524 res!817131) b!1228525))

(declare-fun m!1133053 () Bool)

(assert (=> d!134215 m!1133053))

(declare-fun m!1133055 () Bool)

(assert (=> b!1228525 m!1133055))

(assert (=> b!1228481 d!134215))

(declare-fun d!134223 () Bool)

(assert (=> d!134223 (= (validKeyInArray!0 (select (arr!38269 a!3806) from!3184)) (and (not (= (select (arr!38269 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38269 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228486 d!134223))

(declare-fun d!134229 () Bool)

(declare-fun lt!559008 () Bool)

(declare-fun content!554 (List!27042) (Set (_ BitVec 64)))

(assert (=> d!134229 (= lt!559008 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!554 acc!823)))))

(declare-fun e!697290 () Bool)

(assert (=> d!134229 (= lt!559008 e!697290)))

(declare-fun res!817153 () Bool)

(assert (=> d!134229 (=> (not res!817153) (not e!697290))))

(assert (=> d!134229 (= res!817153 (is-Cons!27038 acc!823))))

(assert (=> d!134229 (= (contains!7104 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!559008)))

(declare-fun b!1228553 () Bool)

(declare-fun e!697291 () Bool)

(assert (=> b!1228553 (= e!697290 e!697291)))

(declare-fun res!817154 () Bool)

(assert (=> b!1228553 (=> res!817154 e!697291)))

(assert (=> b!1228553 (= res!817154 (= (h!28247 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228554 () Bool)

(assert (=> b!1228554 (= e!697291 (contains!7104 (t!40505 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134229 res!817153) b!1228553))

(assert (= (and b!1228553 (not res!817154)) b!1228554))

(declare-fun m!1133071 () Bool)

(assert (=> d!134229 m!1133071))

(declare-fun m!1133073 () Bool)

(assert (=> d!134229 m!1133073))

(declare-fun m!1133075 () Bool)

(assert (=> b!1228554 m!1133075))

(assert (=> b!1228480 d!134229))

(declare-fun d!134237 () Bool)

(declare-fun res!817166 () Bool)

(declare-fun e!697304 () Bool)

(assert (=> d!134237 (=> res!817166 e!697304)))

(assert (=> d!134237 (= res!817166 (is-Nil!27039 acc!823))))

(assert (=> d!134237 (= (noDuplicate!1701 acc!823) e!697304)))

(declare-fun b!1228568 () Bool)

(declare-fun e!697305 () Bool)

(assert (=> b!1228568 (= e!697304 e!697305)))

(declare-fun res!817167 () Bool)

(assert (=> b!1228568 (=> (not res!817167) (not e!697305))))

(assert (=> b!1228568 (= res!817167 (not (contains!7104 (t!40505 acc!823) (h!28247 acc!823))))))

(declare-fun b!1228569 () Bool)

(assert (=> b!1228569 (= e!697305 (noDuplicate!1701 (t!40505 acc!823)))))

(assert (= (and d!134237 (not res!817166)) b!1228568))

(assert (= (and b!1228568 res!817167) b!1228569))

(declare-fun m!1133081 () Bool)

(assert (=> b!1228568 m!1133081))

(declare-fun m!1133083 () Bool)

(assert (=> b!1228569 m!1133083))

(assert (=> b!1228485 d!134237))

(declare-fun d!134243 () Bool)

(declare-fun res!817170 () Bool)

(declare-fun e!697308 () Bool)

(assert (=> d!134243 (=> res!817170 e!697308)))

(assert (=> d!134243 (= res!817170 (is-Nil!27039 (Cons!27038 (select (arr!38269 a!3806) from!3184) Nil!27039)))))

(assert (=> d!134243 (= (noDuplicate!1701 (Cons!27038 (select (arr!38269 a!3806) from!3184) Nil!27039)) e!697308)))

(declare-fun b!1228572 () Bool)

(declare-fun e!697309 () Bool)

(assert (=> b!1228572 (= e!697308 e!697309)))

(declare-fun res!817171 () Bool)

(assert (=> b!1228572 (=> (not res!817171) (not e!697309))))

(assert (=> b!1228572 (= res!817171 (not (contains!7104 (t!40505 (Cons!27038 (select (arr!38269 a!3806) from!3184) Nil!27039)) (h!28247 (Cons!27038 (select (arr!38269 a!3806) from!3184) Nil!27039)))))))

(declare-fun b!1228573 () Bool)

(assert (=> b!1228573 (= e!697309 (noDuplicate!1701 (t!40505 (Cons!27038 (select (arr!38269 a!3806) from!3184) Nil!27039))))))

(assert (= (and d!134243 (not res!817170)) b!1228572))

(assert (= (and b!1228572 res!817171) b!1228573))

(declare-fun m!1133089 () Bool)

(assert (=> b!1228572 m!1133089))

(declare-fun m!1133091 () Bool)

(assert (=> b!1228573 m!1133091))

(assert (=> b!1228479 d!134243))

(declare-fun d!134247 () Bool)

(declare-fun lt!559011 () Bool)

(assert (=> d!134247 (= lt!559011 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!554 acc!823)))))

(declare-fun e!697310 () Bool)

(assert (=> d!134247 (= lt!559011 e!697310)))

(declare-fun res!817172 () Bool)

(assert (=> d!134247 (=> (not res!817172) (not e!697310))))

(assert (=> d!134247 (= res!817172 (is-Cons!27038 acc!823))))

(assert (=> d!134247 (= (contains!7104 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!559011)))

(declare-fun b!1228574 () Bool)

(declare-fun e!697311 () Bool)

(assert (=> b!1228574 (= e!697310 e!697311)))

(declare-fun res!817173 () Bool)

(assert (=> b!1228574 (=> res!817173 e!697311)))

(assert (=> b!1228574 (= res!817173 (= (h!28247 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1228575 () Bool)

(assert (=> b!1228575 (= e!697311 (contains!7104 (t!40505 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!134247 res!817172) b!1228574))

(assert (= (and b!1228574 (not res!817173)) b!1228575))

(assert (=> d!134247 m!1133071))

(declare-fun m!1133093 () Bool)

(assert (=> d!134247 m!1133093))

(declare-fun m!1133095 () Bool)

(assert (=> b!1228575 m!1133095))

(assert (=> b!1228484 d!134247))

(declare-fun d!134249 () Bool)

(assert (=> d!134249 (= (array_inv!29117 a!3806) (bvsge (size!38805 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!102020 d!134249))

(declare-fun call!60820 () Bool)

(declare-fun c!120565 () Bool)

(declare-fun bm!60817 () Bool)

(assert (=> bm!60817 (= call!60820 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120565 (Cons!27038 (select (arr!38269 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1228608 () Bool)

(declare-fun e!697340 () Bool)

(declare-fun e!697342 () Bool)

(assert (=> b!1228608 (= e!697340 e!697342)))

(assert (=> b!1228608 (= c!120565 (validKeyInArray!0 (select (arr!38269 a!3806) from!3184)))))

(declare-fun b!1228609 () Bool)

(assert (=> b!1228609 (= e!697342 call!60820)))

(declare-fun d!134253 () Bool)

(declare-fun res!817199 () Bool)

(declare-fun e!697343 () Bool)

(assert (=> d!134253 (=> res!817199 e!697343)))

(assert (=> d!134253 (= res!817199 (bvsge from!3184 (size!38805 a!3806)))))

(assert (=> d!134253 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!697343)))

(declare-fun b!1228610 () Bool)

(assert (=> b!1228610 (= e!697342 call!60820)))

(declare-fun b!1228611 () Bool)

(declare-fun e!697341 () Bool)

(assert (=> b!1228611 (= e!697341 (contains!7104 acc!823 (select (arr!38269 a!3806) from!3184)))))

(declare-fun b!1228612 () Bool)

(assert (=> b!1228612 (= e!697343 e!697340)))

(declare-fun res!817200 () Bool)

(assert (=> b!1228612 (=> (not res!817200) (not e!697340))))

(assert (=> b!1228612 (= res!817200 (not e!697341))))

(declare-fun res!817198 () Bool)

(assert (=> b!1228612 (=> (not res!817198) (not e!697341))))

(assert (=> b!1228612 (= res!817198 (validKeyInArray!0 (select (arr!38269 a!3806) from!3184)))))

(assert (= (and d!134253 (not res!817199)) b!1228612))

(assert (= (and b!1228612 res!817198) b!1228611))

(assert (= (and b!1228612 res!817200) b!1228608))

(assert (= (and b!1228608 c!120565) b!1228609))

(assert (= (and b!1228608 (not c!120565)) b!1228610))

(assert (= (or b!1228609 b!1228610) bm!60817))

(assert (=> bm!60817 m!1133025))

(declare-fun m!1133127 () Bool)

(assert (=> bm!60817 m!1133127))

(assert (=> b!1228608 m!1133025))

(assert (=> b!1228608 m!1133025))

(assert (=> b!1228608 m!1133033))

(assert (=> b!1228611 m!1133025))

(assert (=> b!1228611 m!1133025))

(declare-fun m!1133129 () Bool)

(assert (=> b!1228611 m!1133129))

(assert (=> b!1228612 m!1133025))

(assert (=> b!1228612 m!1133025))

(assert (=> b!1228612 m!1133033))

(assert (=> b!1228478 d!134253))

(declare-fun bm!60818 () Bool)

(declare-fun call!60821 () Bool)

(declare-fun c!120566 () Bool)

(assert (=> bm!60818 (= call!60821 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120566 (Cons!27038 (select (arr!38269 a!3806) from!3184) Nil!27039) Nil!27039)))))

(declare-fun b!1228613 () Bool)

(declare-fun e!697344 () Bool)

(declare-fun e!697346 () Bool)

(assert (=> b!1228613 (= e!697344 e!697346)))

(assert (=> b!1228613 (= c!120566 (validKeyInArray!0 (select (arr!38269 a!3806) from!3184)))))

(declare-fun b!1228614 () Bool)

(assert (=> b!1228614 (= e!697346 call!60821)))

(declare-fun d!134265 () Bool)

(declare-fun res!817202 () Bool)

(declare-fun e!697347 () Bool)

(assert (=> d!134265 (=> res!817202 e!697347)))

(assert (=> d!134265 (= res!817202 (bvsge from!3184 (size!38805 a!3806)))))

(assert (=> d!134265 (= (arrayNoDuplicates!0 a!3806 from!3184 Nil!27039) e!697347)))

(declare-fun b!1228615 () Bool)

(assert (=> b!1228615 (= e!697346 call!60821)))

(declare-fun b!1228616 () Bool)

(declare-fun e!697345 () Bool)

(assert (=> b!1228616 (= e!697345 (contains!7104 Nil!27039 (select (arr!38269 a!3806) from!3184)))))

(declare-fun b!1228617 () Bool)

(assert (=> b!1228617 (= e!697347 e!697344)))

(declare-fun res!817203 () Bool)

(assert (=> b!1228617 (=> (not res!817203) (not e!697344))))

(assert (=> b!1228617 (= res!817203 (not e!697345))))

(declare-fun res!817201 () Bool)

(assert (=> b!1228617 (=> (not res!817201) (not e!697345))))

(assert (=> b!1228617 (= res!817201 (validKeyInArray!0 (select (arr!38269 a!3806) from!3184)))))

(assert (= (and d!134265 (not res!817202)) b!1228617))

(assert (= (and b!1228617 res!817201) b!1228616))

(assert (= (and b!1228617 res!817203) b!1228613))

(assert (= (and b!1228613 c!120566) b!1228614))

(assert (= (and b!1228613 (not c!120566)) b!1228615))

(assert (= (or b!1228614 b!1228615) bm!60818))

(assert (=> bm!60818 m!1133025))

(declare-fun m!1133131 () Bool)

(assert (=> bm!60818 m!1133131))

(assert (=> b!1228613 m!1133025))

(assert (=> b!1228613 m!1133025))

(assert (=> b!1228613 m!1133033))

(assert (=> b!1228616 m!1133025))

(assert (=> b!1228616 m!1133025))

(declare-fun m!1133135 () Bool)

(assert (=> b!1228616 m!1133135))

(assert (=> b!1228617 m!1133025))

(assert (=> b!1228617 m!1133025))

(assert (=> b!1228617 m!1133033))

(assert (=> b!1228483 d!134265))

(declare-fun d!134269 () Bool)

(assert (=> d!134269 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27039)))

(declare-fun lt!559023 () Unit!40704)

(declare-fun choose!80 (array!79293 List!27042 List!27042 (_ BitVec 32)) Unit!40704)

(assert (=> d!134269 (= lt!559023 (choose!80 a!3806 acc!823 Nil!27039 from!3184))))

(assert (=> d!134269 (bvslt (size!38805 a!3806) #b01111111111111111111111111111111)))

(assert (=> d!134269 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27039 from!3184) lt!559023)))

(declare-fun bs!34535 () Bool)

(assert (= bs!34535 d!134269))

(assert (=> bs!34535 m!1133021))

(declare-fun m!1133143 () Bool)

(assert (=> bs!34535 m!1133143))

(assert (=> b!1228483 d!134269))

(declare-fun bm!60820 () Bool)

(declare-fun c!120568 () Bool)

(declare-fun call!60823 () Bool)

(assert (=> bm!60820 (= call!60823 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (ite c!120568 (Cons!27038 (select (arr!38269 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) (Cons!27038 (select (arr!38269 a!3806) from!3184) acc!823)) (Cons!27038 (select (arr!38269 a!3806) from!3184) acc!823))))))

(declare-fun b!1228623 () Bool)

(declare-fun e!697352 () Bool)

(declare-fun e!697354 () Bool)

(assert (=> b!1228623 (= e!697352 e!697354)))

(assert (=> b!1228623 (= c!120568 (validKeyInArray!0 (select (arr!38269 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228624 () Bool)

(assert (=> b!1228624 (= e!697354 call!60823)))

(declare-fun d!134271 () Bool)

(declare-fun res!817208 () Bool)

(declare-fun e!697355 () Bool)

(assert (=> d!134271 (=> res!817208 e!697355)))

(assert (=> d!134271 (= res!817208 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) (size!38805 a!3806)))))

(assert (=> d!134271 (= (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27038 (select (arr!38269 a!3806) from!3184) acc!823)) e!697355)))

(declare-fun b!1228625 () Bool)

(assert (=> b!1228625 (= e!697354 call!60823)))

(declare-fun b!1228626 () Bool)

(declare-fun e!697353 () Bool)

(assert (=> b!1228626 (= e!697353 (contains!7104 (Cons!27038 (select (arr!38269 a!3806) from!3184) acc!823) (select (arr!38269 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(declare-fun b!1228627 () Bool)

(assert (=> b!1228627 (= e!697355 e!697352)))

(declare-fun res!817209 () Bool)

(assert (=> b!1228627 (=> (not res!817209) (not e!697352))))

(assert (=> b!1228627 (= res!817209 (not e!697353))))

(declare-fun res!817207 () Bool)

(assert (=> b!1228627 (=> (not res!817207) (not e!697353))))

(assert (=> b!1228627 (= res!817207 (validKeyInArray!0 (select (arr!38269 a!3806) (bvadd #b00000000000000000000000000000001 from!3184))))))

(assert (= (and d!134271 (not res!817208)) b!1228627))

(assert (= (and b!1228627 res!817207) b!1228626))

(assert (= (and b!1228627 res!817209) b!1228623))

(assert (= (and b!1228623 c!120568) b!1228624))

(assert (= (and b!1228623 (not c!120568)) b!1228625))

(assert (= (or b!1228624 b!1228625) bm!60820))

(assert (=> bm!60820 m!1133053))

(declare-fun m!1133145 () Bool)

(assert (=> bm!60820 m!1133145))

(assert (=> b!1228623 m!1133053))

(assert (=> b!1228623 m!1133053))

(declare-fun m!1133147 () Bool)

(assert (=> b!1228623 m!1133147))

(assert (=> b!1228626 m!1133053))

(assert (=> b!1228626 m!1133053))

(declare-fun m!1133149 () Bool)

(assert (=> b!1228626 m!1133149))

(assert (=> b!1228627 m!1133053))

(assert (=> b!1228627 m!1133053))

(assert (=> b!1228627 m!1133147))

(assert (=> b!1228483 d!134271))

(declare-fun d!134273 () Bool)

(assert (=> d!134273 (= (validKeyInArray!0 k!2913) (and (not (= k!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1228477 d!134273))

(push 1)

(assert (not b!1228627))

(assert (not b!1228612))

(assert (not b!1228525))

(assert (not b!1228568))

(assert (not b!1228569))

(assert (not d!134229))

(assert (not b!1228613))

(assert (not b!1228575))

(assert (not bm!60817))

(assert (not b!1228608))

(assert (not b!1228623))

(assert (not b!1228617))

(assert (not b!1228616))

(assert (not bm!60818))

(assert (not b!1228626))

(assert (not b!1228572))

(assert (not d!134247))

(assert (not b!1228573))

(assert (not b!1228554))

(assert (not b!1228611))

(assert (not bm!60820))

(assert (not d!134269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

