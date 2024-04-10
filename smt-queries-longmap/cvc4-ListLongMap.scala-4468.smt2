; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62160 () Bool)

(assert start!62160)

(declare-fun res!460257 () Bool)

(declare-fun e!395935 () Bool)

(assert (=> start!62160 (=> (not res!460257) (not e!395935))))

(declare-datatypes ((array!39950 0))(
  ( (array!39951 (arr!19136 (Array (_ BitVec 32) (_ BitVec 64))) (size!19521 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39950)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!62160 (= res!460257 (and (bvslt (size!19521 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19521 a!3626))))))

(assert (=> start!62160 e!395935))

(assert (=> start!62160 true))

(declare-fun array_inv!14932 (array!39950) Bool)

(assert (=> start!62160 (array_inv!14932 a!3626)))

(declare-fun b!696307 () Bool)

(declare-fun res!460273 () Bool)

(assert (=> b!696307 (=> (not res!460273) (not e!395935))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696307 (= res!460273 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19521 a!3626))))))

(declare-fun b!696308 () Bool)

(declare-fun e!395936 () Bool)

(declare-datatypes ((List!13177 0))(
  ( (Nil!13174) (Cons!13173 (h!14218 (_ BitVec 64)) (t!19459 List!13177)) )
))
(declare-fun acc!681 () List!13177)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3754 (List!13177 (_ BitVec 64)) Bool)

(assert (=> b!696308 (= e!395936 (not (contains!3754 acc!681 k!2843)))))

(declare-fun b!696309 () Bool)

(declare-fun res!460261 () Bool)

(assert (=> b!696309 (=> (not res!460261) (not e!395935))))

(declare-fun arrayContainsKey!0 (array!39950 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696309 (= res!460261 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696310 () Bool)

(declare-fun e!395931 () Bool)

(assert (=> b!696310 (= e!395931 e!395936)))

(declare-fun res!460255 () Bool)

(assert (=> b!696310 (=> (not res!460255) (not e!395936))))

(assert (=> b!696310 (= res!460255 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696311 () Bool)

(declare-fun res!460268 () Bool)

(assert (=> b!696311 (=> (not res!460268) (not e!395935))))

(assert (=> b!696311 (= res!460268 (not (contains!3754 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696312 () Bool)

(declare-fun res!460262 () Bool)

(assert (=> b!696312 (=> (not res!460262) (not e!395935))))

(declare-fun arrayNoDuplicates!0 (array!39950 (_ BitVec 32) List!13177) Bool)

(assert (=> b!696312 (= res!460262 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696313 () Bool)

(declare-fun res!460271 () Bool)

(assert (=> b!696313 (=> (not res!460271) (not e!395935))))

(assert (=> b!696313 (= res!460271 e!395931)))

(declare-fun res!460267 () Bool)

(assert (=> b!696313 (=> res!460267 e!395931)))

(declare-fun e!395937 () Bool)

(assert (=> b!696313 (= res!460267 e!395937)))

(declare-fun res!460264 () Bool)

(assert (=> b!696313 (=> (not res!460264) (not e!395937))))

(assert (=> b!696313 (= res!460264 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696314 () Bool)

(declare-fun res!460258 () Bool)

(assert (=> b!696314 (=> (not res!460258) (not e!395935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696314 (= res!460258 (validKeyInArray!0 k!2843))))

(declare-fun b!696315 () Bool)

(declare-fun res!460256 () Bool)

(assert (=> b!696315 (=> (not res!460256) (not e!395935))))

(assert (=> b!696315 (= res!460256 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19521 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696316 () Bool)

(declare-fun res!460263 () Bool)

(assert (=> b!696316 (=> (not res!460263) (not e!395935))))

(assert (=> b!696316 (= res!460263 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696317 () Bool)

(declare-fun res!460269 () Bool)

(assert (=> b!696317 (=> (not res!460269) (not e!395935))))

(declare-fun noDuplicate!1001 (List!13177) Bool)

(assert (=> b!696317 (= res!460269 (noDuplicate!1001 acc!681))))

(declare-fun b!696318 () Bool)

(assert (=> b!696318 (= e!395937 (contains!3754 acc!681 k!2843))))

(declare-fun b!696319 () Bool)

(declare-fun res!460260 () Bool)

(assert (=> b!696319 (=> (not res!460260) (not e!395935))))

(declare-fun e!395933 () Bool)

(assert (=> b!696319 (= res!460260 e!395933)))

(declare-fun res!460274 () Bool)

(assert (=> b!696319 (=> res!460274 e!395933)))

(declare-fun e!395934 () Bool)

(assert (=> b!696319 (= res!460274 e!395934)))

(declare-fun res!460270 () Bool)

(assert (=> b!696319 (=> (not res!460270) (not e!395934))))

(assert (=> b!696319 (= res!460270 (bvsgt from!3004 i!1382))))

(declare-fun b!696320 () Bool)

(declare-fun e!395932 () Bool)

(assert (=> b!696320 (= e!395933 e!395932)))

(declare-fun res!460272 () Bool)

(assert (=> b!696320 (=> (not res!460272) (not e!395932))))

(assert (=> b!696320 (= res!460272 (bvsle from!3004 i!1382))))

(declare-fun b!696321 () Bool)

(assert (=> b!696321 (= e!395934 (contains!3754 acc!681 k!2843))))

(declare-fun b!696322 () Bool)

(assert (=> b!696322 (= e!395935 (not (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))))

(declare-fun b!696323 () Bool)

(declare-fun res!460259 () Bool)

(assert (=> b!696323 (=> (not res!460259) (not e!395935))))

(assert (=> b!696323 (= res!460259 (not (contains!3754 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696324 () Bool)

(assert (=> b!696324 (= e!395932 (not (contains!3754 acc!681 k!2843)))))

(declare-fun b!696325 () Bool)

(declare-fun res!460266 () Bool)

(assert (=> b!696325 (=> (not res!460266) (not e!395935))))

(assert (=> b!696325 (= res!460266 (not (validKeyInArray!0 (select (arr!19136 a!3626) from!3004))))))

(declare-fun b!696326 () Bool)

(declare-fun res!460265 () Bool)

(assert (=> b!696326 (=> (not res!460265) (not e!395935))))

(assert (=> b!696326 (= res!460265 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13174))))

(assert (= (and start!62160 res!460257) b!696317))

(assert (= (and b!696317 res!460269) b!696323))

(assert (= (and b!696323 res!460259) b!696311))

(assert (= (and b!696311 res!460268) b!696319))

(assert (= (and b!696319 res!460270) b!696321))

(assert (= (and b!696319 (not res!460274)) b!696320))

(assert (= (and b!696320 res!460272) b!696324))

(assert (= (and b!696319 res!460260) b!696326))

(assert (= (and b!696326 res!460265) b!696312))

(assert (= (and b!696312 res!460262) b!696307))

(assert (= (and b!696307 res!460273) b!696314))

(assert (= (and b!696314 res!460258) b!696309))

(assert (= (and b!696309 res!460261) b!696315))

(assert (= (and b!696315 res!460256) b!696325))

(assert (= (and b!696325 res!460266) b!696316))

(assert (= (and b!696316 res!460263) b!696313))

(assert (= (and b!696313 res!460264) b!696318))

(assert (= (and b!696313 (not res!460267)) b!696310))

(assert (= (and b!696310 res!460255) b!696308))

(assert (= (and b!696313 res!460271) b!696322))

(declare-fun m!657323 () Bool)

(assert (=> b!696308 m!657323))

(assert (=> b!696318 m!657323))

(declare-fun m!657325 () Bool)

(assert (=> b!696317 m!657325))

(declare-fun m!657327 () Bool)

(assert (=> b!696312 m!657327))

(assert (=> b!696321 m!657323))

(declare-fun m!657329 () Bool)

(assert (=> b!696322 m!657329))

(declare-fun m!657331 () Bool)

(assert (=> b!696311 m!657331))

(declare-fun m!657333 () Bool)

(assert (=> b!696326 m!657333))

(declare-fun m!657335 () Bool)

(assert (=> b!696309 m!657335))

(declare-fun m!657337 () Bool)

(assert (=> b!696325 m!657337))

(assert (=> b!696325 m!657337))

(declare-fun m!657339 () Bool)

(assert (=> b!696325 m!657339))

(declare-fun m!657341 () Bool)

(assert (=> b!696323 m!657341))

(assert (=> b!696324 m!657323))

(declare-fun m!657343 () Bool)

(assert (=> b!696314 m!657343))

(declare-fun m!657345 () Bool)

(assert (=> start!62160 m!657345))

(push 1)

(assert (not b!696325))

(assert (not b!696312))

(assert (not b!696326))

(assert (not start!62160))

(assert (not b!696321))

(assert (not b!696311))

(assert (not b!696318))

(assert (not b!696317))

(assert (not b!696314))

(assert (not b!696309))

(assert (not b!696323))

(assert (not b!696308))

(assert (not b!696322))

(assert (not b!696324))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!96087 () Bool)

(declare-fun lt!317105 () Bool)

(declare-fun content!326 (List!13177) (Set (_ BitVec 64)))

(assert (=> d!96087 (= lt!317105 (member k!2843 (content!326 acc!681)))))

(declare-fun e!395977 () Bool)

(assert (=> d!96087 (= lt!317105 e!395977)))

(declare-fun res!460309 () Bool)

(assert (=> d!96087 (=> (not res!460309) (not e!395977))))

(assert (=> d!96087 (= res!460309 (is-Cons!13173 acc!681))))

(assert (=> d!96087 (= (contains!3754 acc!681 k!2843) lt!317105)))

(declare-fun b!696370 () Bool)

(declare-fun e!395976 () Bool)

(assert (=> b!696370 (= e!395977 e!395976)))

(declare-fun res!460308 () Bool)

(assert (=> b!696370 (=> res!460308 e!395976)))

(assert (=> b!696370 (= res!460308 (= (h!14218 acc!681) k!2843))))

(declare-fun b!696371 () Bool)

(assert (=> b!696371 (= e!395976 (contains!3754 (t!19459 acc!681) k!2843))))

(assert (= (and d!96087 res!460309) b!696370))

(assert (= (and b!696370 (not res!460308)) b!696371))

(declare-fun m!657383 () Bool)

(assert (=> d!96087 m!657383))

(declare-fun m!657385 () Bool)

(assert (=> d!96087 m!657385))

(declare-fun m!657387 () Bool)

(assert (=> b!696371 m!657387))

(assert (=> b!696324 d!96087))

(declare-fun d!96097 () Bool)

(assert (=> d!96097 (= (validKeyInArray!0 (select (arr!19136 a!3626) from!3004)) (and (not (= (select (arr!19136 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19136 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!696325 d!96097))

(declare-fun d!96099 () Bool)

(assert (=> d!96099 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!696314 d!96099))

(declare-fun d!96101 () Bool)

(declare-fun res!460343 () Bool)

(declare-fun e!396016 () Bool)

(assert (=> d!96101 (=> res!460343 e!396016)))

(assert (=> d!96101 (= res!460343 (bvsge #b00000000000000000000000000000000 (size!19521 a!3626)))))

(assert (=> d!96101 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13174) e!396016)))

(declare-fun b!696416 () Bool)

(declare-fun e!396017 () Bool)

(assert (=> b!696416 (= e!396017 (contains!3754 Nil!13174 (select (arr!19136 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!696417 () Bool)

(declare-fun e!396018 () Bool)

(declare-fun call!34310 () Bool)

(assert (=> b!696417 (= e!396018 call!34310)))

(declare-fun b!696418 () Bool)

(declare-fun e!396019 () Bool)

(assert (=> b!696418 (= e!396016 e!396019)))

(declare-fun res!460342 () Bool)

(assert (=> b!696418 (=> (not res!460342) (not e!396019))))

(assert (=> b!696418 (= res!460342 (not e!396017))))

(declare-fun res!460344 () Bool)

(assert (=> b!696418 (=> (not res!460344) (not e!396017))))

(assert (=> b!696418 (= res!460344 (validKeyInArray!0 (select (arr!19136 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34307 () Bool)

(declare-fun c!78404 () Bool)

(assert (=> bm!34307 (= call!34310 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!78404 (Cons!13173 (select (arr!19136 a!3626) #b00000000000000000000000000000000) Nil!13174) Nil!13174)))))

(declare-fun b!696419 () Bool)

(assert (=> b!696419 (= e!396019 e!396018)))

(assert (=> b!696419 (= c!78404 (validKeyInArray!0 (select (arr!19136 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!696420 () Bool)

(assert (=> b!696420 (= e!396018 call!34310)))

(assert (= (and d!96101 (not res!460343)) b!696418))

(assert (= (and b!696418 res!460344) b!696416))

(assert (= (and b!696418 res!460342) b!696419))

(assert (= (and b!696419 c!78404) b!696420))

(assert (= (and b!696419 (not c!78404)) b!696417))

(assert (= (or b!696420 b!696417) bm!34307))

(declare-fun m!657411 () Bool)

(assert (=> b!696416 m!657411))

(assert (=> b!696416 m!657411))

(declare-fun m!657413 () Bool)

(assert (=> b!696416 m!657413))

(assert (=> b!696418 m!657411))

(assert (=> b!696418 m!657411))

(declare-fun m!657415 () Bool)

(assert (=> b!696418 m!657415))

(assert (=> bm!34307 m!657411))

(declare-fun m!657417 () Bool)

(assert (=> bm!34307 m!657417))

(assert (=> b!696419 m!657411))

(assert (=> b!696419 m!657411))

(assert (=> b!696419 m!657415))

(assert (=> b!696326 d!96101))

(declare-fun d!96115 () Bool)

(declare-fun res!460357 () Bool)

(declare-fun e!396032 () Bool)

(assert (=> d!96115 (=> res!460357 e!396032)))

(assert (=> d!96115 (= res!460357 (is-Nil!13174 acc!681))))

(assert (=> d!96115 (= (noDuplicate!1001 acc!681) e!396032)))

(declare-fun b!696433 () Bool)

(declare-fun e!396033 () Bool)

(assert (=> b!696433 (= e!396032 e!396033)))

(declare-fun res!460358 () Bool)

(assert (=> b!696433 (=> (not res!460358) (not e!396033))))

(assert (=> b!696433 (= res!460358 (not (contains!3754 (t!19459 acc!681) (h!14218 acc!681))))))

(declare-fun b!696434 () Bool)

(assert (=> b!696434 (= e!396033 (noDuplicate!1001 (t!19459 acc!681)))))

(assert (= (and d!96115 (not res!460357)) b!696433))

(assert (= (and b!696433 res!460358) b!696434))

(declare-fun m!657427 () Bool)

(assert (=> b!696433 m!657427))

(declare-fun m!657429 () Bool)

(assert (=> b!696434 m!657429))

(assert (=> b!696317 d!96115))

(assert (=> b!696318 d!96087))

(assert (=> b!696308 d!96087))

(declare-fun d!96119 () Bool)

(declare-fun res!460368 () Bool)

(declare-fun e!396044 () Bool)

(assert (=> d!96119 (=> res!460368 e!396044)))

(assert (=> d!96119 (= res!460368 (= (select (arr!19136 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!96119 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!396044)))

(declare-fun b!696446 () Bool)

(declare-fun e!396045 () Bool)

(assert (=> b!696446 (= e!396044 e!396045)))

(declare-fun res!460369 () Bool)

(assert (=> b!696446 (=> (not res!460369) (not e!396045))))

(assert (=> b!696446 (= res!460369 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19521 a!3626)))))

(declare-fun b!696447 () Bool)

(assert (=> b!696447 (= e!396045 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!96119 (not res!460368)) b!696446))

(assert (= (and b!696446 res!460369) b!696447))

(assert (=> d!96119 m!657411))

(declare-fun m!657443 () Bool)

(assert (=> b!696447 m!657443))

(assert (=> b!696309 d!96119))

(assert (=> b!696321 d!96087))

(declare-fun d!96129 () Bool)

(assert (=> d!96129 (= (array_inv!14932 a!3626) (bvsge (size!19521 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!62160 d!96129))

(declare-fun d!96133 () Bool)

(declare-fun lt!317109 () Bool)

(assert (=> d!96133 (= lt!317109 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!326 acc!681)))))

(declare-fun e!396047 () Bool)

(assert (=> d!96133 (= lt!317109 e!396047)))

(declare-fun res!460371 () Bool)

(assert (=> d!96133 (=> (not res!460371) (not e!396047))))

(assert (=> d!96133 (= res!460371 (is-Cons!13173 acc!681))))

(assert (=> d!96133 (= (contains!3754 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!317109)))

(declare-fun b!696448 () Bool)

(declare-fun e!396046 () Bool)

(assert (=> b!696448 (= e!396047 e!396046)))

(declare-fun res!460370 () Bool)

(assert (=> b!696448 (=> res!460370 e!396046)))

(assert (=> b!696448 (= res!460370 (= (h!14218 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!696449 () Bool)

(assert (=> b!696449 (= e!396046 (contains!3754 (t!19459 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96133 res!460371) b!696448))

(assert (= (and b!696448 (not res!460370)) b!696449))

(assert (=> d!96133 m!657383))

(declare-fun m!657445 () Bool)

(assert (=> d!96133 m!657445))

(declare-fun m!657447 () Bool)

(assert (=> b!696449 m!657447))

(assert (=> b!696311 d!96133))

(declare-fun d!96135 () Bool)

(declare-fun res!460373 () Bool)

(declare-fun e!396048 () Bool)

(assert (=> d!96135 (=> res!460373 e!396048)))

(assert (=> d!96135 (= res!460373 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19521 a!3626)))))

(assert (=> d!96135 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!396048)))

(declare-fun b!696450 () Bool)

(declare-fun e!396049 () Bool)

(assert (=> b!696450 (= e!396049 (contains!3754 acc!681 (select (arr!19136 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!696451 () Bool)

(declare-fun e!396050 () Bool)

(declare-fun call!34312 () Bool)

(assert (=> b!696451 (= e!396050 call!34312)))

(declare-fun b!696452 () Bool)

(declare-fun e!396051 () Bool)

(assert (=> b!696452 (= e!396048 e!396051)))

(declare-fun res!460372 () Bool)

(assert (=> b!696452 (=> (not res!460372) (not e!396051))))

(assert (=> b!696452 (= res!460372 (not e!396049))))

(declare-fun res!460374 () Bool)

(assert (=> b!696452 (=> (not res!460374) (not e!396049))))

(assert (=> b!696452 (= res!460374 (validKeyInArray!0 (select (arr!19136 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34309 () Bool)

(declare-fun c!78406 () Bool)

