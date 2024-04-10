; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60654 () Bool)

(assert start!60654)

(declare-fun b!681369 () Bool)

(declare-fun e!388121 () Bool)

(declare-datatypes ((List!12988 0))(
  ( (Nil!12985) (Cons!12984 (h!14029 (_ BitVec 64)) (t!19222 List!12988)) )
))
(declare-fun acc!681 () List!12988)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3565 (List!12988 (_ BitVec 64)) Bool)

(assert (=> b!681369 (= e!388121 (contains!3565 acc!681 k!2843))))

(declare-fun b!681370 () Bool)

(declare-fun res!447539 () Bool)

(declare-fun e!388124 () Bool)

(assert (=> b!681370 (=> (not res!447539) (not e!388124))))

(declare-fun noDuplicate!812 (List!12988) Bool)

(assert (=> b!681370 (= res!447539 (noDuplicate!812 acc!681))))

(declare-fun b!681371 () Bool)

(declare-fun res!447532 () Bool)

(assert (=> b!681371 (=> (not res!447532) (not e!388124))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39521 0))(
  ( (array!39522 (arr!18947 (Array (_ BitVec 32) (_ BitVec 64))) (size!19311 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39521)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!681371 (= res!447532 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19311 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!681372 () Bool)

(declare-fun res!447522 () Bool)

(declare-fun e!388122 () Bool)

(assert (=> b!681372 (=> res!447522 e!388122)))

(declare-fun lt!313275 () List!12988)

(assert (=> b!681372 (= res!447522 (contains!3565 lt!313275 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681373 () Bool)

(declare-fun res!447535 () Bool)

(assert (=> b!681373 (=> (not res!447535) (not e!388124))))

(declare-fun arrayContainsKey!0 (array!39521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!681373 (= res!447535 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!681374 () Bool)

(declare-fun res!447533 () Bool)

(assert (=> b!681374 (=> (not res!447533) (not e!388124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!681374 (= res!447533 (validKeyInArray!0 k!2843))))

(declare-fun b!681375 () Bool)

(declare-fun res!447528 () Bool)

(assert (=> b!681375 (=> (not res!447528) (not e!388124))))

(declare-fun arrayNoDuplicates!0 (array!39521 (_ BitVec 32) List!12988) Bool)

(assert (=> b!681375 (= res!447528 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12985))))

(declare-fun b!681377 () Bool)

(declare-datatypes ((Unit!23906 0))(
  ( (Unit!23907) )
))
(declare-fun e!388118 () Unit!23906)

(declare-fun Unit!23908 () Unit!23906)

(assert (=> b!681377 (= e!388118 Unit!23908)))

(declare-fun b!681378 () Bool)

(declare-fun res!447529 () Bool)

(assert (=> b!681378 (=> (not res!447529) (not e!388124))))

(assert (=> b!681378 (= res!447529 (not (contains!3565 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681379 () Bool)

(declare-fun res!447521 () Bool)

(assert (=> b!681379 (=> (not res!447521) (not e!388124))))

(assert (=> b!681379 (= res!447521 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19311 a!3626))))))

(declare-fun b!681380 () Bool)

(declare-fun res!447526 () Bool)

(assert (=> b!681380 (=> res!447526 e!388122)))

(assert (=> b!681380 (= res!447526 (not (noDuplicate!812 lt!313275)))))

(declare-fun b!681381 () Bool)

(declare-fun res!447523 () Bool)

(assert (=> b!681381 (=> res!447523 e!388122)))

(assert (=> b!681381 (= res!447523 (contains!3565 lt!313275 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681382 () Bool)

(declare-fun res!447538 () Bool)

(assert (=> b!681382 (=> (not res!447538) (not e!388124))))

(assert (=> b!681382 (= res!447538 (not (contains!3565 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!681383 () Bool)

(declare-fun res!447537 () Bool)

(assert (=> b!681383 (=> (not res!447537) (not e!388124))))

(declare-fun e!388119 () Bool)

(assert (=> b!681383 (= res!447537 e!388119)))

(declare-fun res!447527 () Bool)

(assert (=> b!681383 (=> res!447527 e!388119)))

(assert (=> b!681383 (= res!447527 e!388121)))

(declare-fun res!447525 () Bool)

(assert (=> b!681383 (=> (not res!447525) (not e!388121))))

(assert (=> b!681383 (= res!447525 (bvsgt from!3004 i!1382))))

(declare-fun b!681384 () Bool)

(declare-fun e!388125 () Bool)

(assert (=> b!681384 (= e!388125 (not (contains!3565 acc!681 k!2843)))))

(declare-fun b!681385 () Bool)

(declare-fun Unit!23909 () Unit!23906)

(assert (=> b!681385 (= e!388118 Unit!23909)))

(declare-fun lt!313276 () Unit!23906)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39521 (_ BitVec 64) (_ BitVec 32)) Unit!23906)

(assert (=> b!681385 (= lt!313276 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!681385 false))

(declare-fun b!681386 () Bool)

(declare-fun e!388120 () Bool)

(assert (=> b!681386 (= e!388124 (not e!388120))))

(declare-fun res!447534 () Bool)

(assert (=> b!681386 (=> res!447534 e!388120)))

(assert (=> b!681386 (= res!447534 (not (validKeyInArray!0 (select (arr!18947 a!3626) from!3004))))))

(declare-fun lt!313274 () Unit!23906)

(assert (=> b!681386 (= lt!313274 e!388118)))

(declare-fun c!77291 () Bool)

(assert (=> b!681386 (= c!77291 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!681386 (arrayContainsKey!0 (array!39522 (store (arr!18947 a!3626) i!1382 k!2843) (size!19311 a!3626)) k!2843 from!3004)))

(declare-fun b!681376 () Bool)

(declare-fun res!447531 () Bool)

(assert (=> b!681376 (=> (not res!447531) (not e!388124))))

(assert (=> b!681376 (= res!447531 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun res!447524 () Bool)

(assert (=> start!60654 (=> (not res!447524) (not e!388124))))

(assert (=> start!60654 (= res!447524 (and (bvslt (size!19311 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19311 a!3626))))))

(assert (=> start!60654 e!388124))

(assert (=> start!60654 true))

(declare-fun array_inv!14743 (array!39521) Bool)

(assert (=> start!60654 (array_inv!14743 a!3626)))

(declare-fun b!681387 () Bool)

(declare-fun subseq!151 (List!12988 List!12988) Bool)

(assert (=> b!681387 (= e!388122 (subseq!151 acc!681 lt!313275))))

(declare-fun b!681388 () Bool)

(assert (=> b!681388 (= e!388120 e!388122)))

(declare-fun res!447536 () Bool)

(assert (=> b!681388 (=> res!447536 e!388122)))

(assert (=> b!681388 (= res!447536 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!316 (List!12988 (_ BitVec 64)) List!12988)

(assert (=> b!681388 (= lt!313275 ($colon$colon!316 acc!681 (select (arr!18947 a!3626) from!3004)))))

(assert (=> b!681388 (subseq!151 acc!681 acc!681)))

(declare-fun lt!313273 () Unit!23906)

(declare-fun lemmaListSubSeqRefl!0 (List!12988) Unit!23906)

(assert (=> b!681388 (= lt!313273 (lemmaListSubSeqRefl!0 acc!681))))

(declare-fun b!681389 () Bool)

(assert (=> b!681389 (= e!388119 e!388125)))

(declare-fun res!447530 () Bool)

(assert (=> b!681389 (=> (not res!447530) (not e!388125))))

(assert (=> b!681389 (= res!447530 (bvsle from!3004 i!1382))))

(assert (= (and start!60654 res!447524) b!681370))

(assert (= (and b!681370 res!447539) b!681382))

(assert (= (and b!681382 res!447538) b!681378))

(assert (= (and b!681378 res!447529) b!681383))

(assert (= (and b!681383 res!447525) b!681369))

(assert (= (and b!681383 (not res!447527)) b!681389))

(assert (= (and b!681389 res!447530) b!681384))

(assert (= (and b!681383 res!447537) b!681375))

(assert (= (and b!681375 res!447528) b!681376))

(assert (= (and b!681376 res!447531) b!681379))

(assert (= (and b!681379 res!447521) b!681374))

(assert (= (and b!681374 res!447533) b!681373))

(assert (= (and b!681373 res!447535) b!681371))

(assert (= (and b!681371 res!447532) b!681386))

(assert (= (and b!681386 c!77291) b!681385))

(assert (= (and b!681386 (not c!77291)) b!681377))

(assert (= (and b!681386 (not res!447534)) b!681388))

(assert (= (and b!681388 (not res!447536)) b!681380))

(assert (= (and b!681380 (not res!447526)) b!681381))

(assert (= (and b!681381 (not res!447523)) b!681372))

(assert (= (and b!681372 (not res!447522)) b!681387))

(declare-fun m!646221 () Bool)

(assert (=> b!681388 m!646221))

(assert (=> b!681388 m!646221))

(declare-fun m!646223 () Bool)

(assert (=> b!681388 m!646223))

(declare-fun m!646225 () Bool)

(assert (=> b!681388 m!646225))

(declare-fun m!646227 () Bool)

(assert (=> b!681388 m!646227))

(assert (=> b!681386 m!646221))

(declare-fun m!646229 () Bool)

(assert (=> b!681386 m!646229))

(declare-fun m!646231 () Bool)

(assert (=> b!681386 m!646231))

(assert (=> b!681386 m!646221))

(declare-fun m!646233 () Bool)

(assert (=> b!681386 m!646233))

(declare-fun m!646235 () Bool)

(assert (=> b!681386 m!646235))

(declare-fun m!646237 () Bool)

(assert (=> b!681370 m!646237))

(declare-fun m!646239 () Bool)

(assert (=> b!681375 m!646239))

(declare-fun m!646241 () Bool)

(assert (=> b!681381 m!646241))

(declare-fun m!646243 () Bool)

(assert (=> b!681378 m!646243))

(declare-fun m!646245 () Bool)

(assert (=> b!681387 m!646245))

(declare-fun m!646247 () Bool)

(assert (=> b!681373 m!646247))

(declare-fun m!646249 () Bool)

(assert (=> b!681382 m!646249))

(declare-fun m!646251 () Bool)

(assert (=> b!681374 m!646251))

(declare-fun m!646253 () Bool)

(assert (=> b!681369 m!646253))

(declare-fun m!646255 () Bool)

(assert (=> b!681372 m!646255))

(declare-fun m!646257 () Bool)

(assert (=> b!681385 m!646257))

(declare-fun m!646259 () Bool)

(assert (=> b!681376 m!646259))

(declare-fun m!646261 () Bool)

(assert (=> start!60654 m!646261))

(declare-fun m!646263 () Bool)

(assert (=> b!681380 m!646263))

(assert (=> b!681384 m!646253))

(push 1)

(assert (not b!681376))

(assert (not b!681374))

(assert (not b!681381))

(assert (not b!681370))

(assert (not b!681384))

(assert (not b!681382))

(assert (not b!681386))

(assert (not b!681385))

(assert (not b!681372))

(assert (not b!681387))

(assert (not b!681380))

(assert (not b!681388))

(assert (not b!681378))

(assert (not b!681369))

(assert (not start!60654))

(assert (not b!681375))

(assert (not b!681373))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!93805 () Bool)

(declare-fun lt!313288 () Bool)

(declare-fun content!274 (List!12988) (Set (_ BitVec 64)))

(assert (=> d!93805 (= lt!313288 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!274 acc!681)))))

(declare-fun e!388167 () Bool)

(assert (=> d!93805 (= lt!313288 e!388167)))

(declare-fun res!447580 () Bool)

(assert (=> d!93805 (=> (not res!447580) (not e!388167))))

(assert (=> d!93805 (= res!447580 (is-Cons!12984 acc!681))))

(assert (=> d!93805 (= (contains!3565 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313288)))

(declare-fun b!681430 () Bool)

(declare-fun e!388166 () Bool)

(assert (=> b!681430 (= e!388167 e!388166)))

(declare-fun res!447581 () Bool)

(assert (=> b!681430 (=> res!447581 e!388166)))

(assert (=> b!681430 (= res!447581 (= (h!14029 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681431 () Bool)

(assert (=> b!681431 (= e!388166 (contains!3565 (t!19222 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93805 res!447580) b!681430))

(assert (= (and b!681430 (not res!447581)) b!681431))

(declare-fun m!646293 () Bool)

(assert (=> d!93805 m!646293))

(declare-fun m!646295 () Bool)

(assert (=> d!93805 m!646295))

(declare-fun m!646299 () Bool)

(assert (=> b!681431 m!646299))

(assert (=> b!681378 d!93805))

(declare-fun d!93821 () Bool)

(assert (=> d!93821 (= ($colon$colon!316 acc!681 (select (arr!18947 a!3626) from!3004)) (Cons!12984 (select (arr!18947 a!3626) from!3004) acc!681))))

(assert (=> b!681388 d!93821))

(declare-fun d!93825 () Bool)

(declare-fun res!447608 () Bool)

(declare-fun e!388199 () Bool)

(assert (=> d!93825 (=> res!447608 e!388199)))

(assert (=> d!93825 (= res!447608 (is-Nil!12985 acc!681))))

(assert (=> d!93825 (= (subseq!151 acc!681 acc!681) e!388199)))

(declare-fun b!681465 () Bool)

(declare-fun e!388197 () Bool)

(assert (=> b!681465 (= e!388197 (subseq!151 (t!19222 acc!681) (t!19222 acc!681)))))

(declare-fun b!681464 () Bool)

(declare-fun e!388198 () Bool)

(declare-fun e!388196 () Bool)

(assert (=> b!681464 (= e!388198 e!388196)))

(declare-fun res!447607 () Bool)

(assert (=> b!681464 (=> res!447607 e!388196)))

(assert (=> b!681464 (= res!447607 e!388197)))

(declare-fun res!447609 () Bool)

(assert (=> b!681464 (=> (not res!447609) (not e!388197))))

(assert (=> b!681464 (= res!447609 (= (h!14029 acc!681) (h!14029 acc!681)))))

(declare-fun b!681463 () Bool)

(assert (=> b!681463 (= e!388199 e!388198)))

(declare-fun res!447610 () Bool)

(assert (=> b!681463 (=> (not res!447610) (not e!388198))))

(assert (=> b!681463 (= res!447610 (is-Cons!12984 acc!681))))

(declare-fun b!681466 () Bool)

(assert (=> b!681466 (= e!388196 (subseq!151 acc!681 (t!19222 acc!681)))))

(assert (= (and d!93825 (not res!447608)) b!681463))

(assert (= (and b!681463 res!447610) b!681464))

(assert (= (and b!681464 res!447609) b!681465))

(assert (= (and b!681464 (not res!447607)) b!681466))

(declare-fun m!646311 () Bool)

(assert (=> b!681465 m!646311))

(declare-fun m!646313 () Bool)

(assert (=> b!681466 m!646313))

(assert (=> b!681388 d!93825))

(declare-fun d!93831 () Bool)

(assert (=> d!93831 (subseq!151 acc!681 acc!681)))

(declare-fun lt!313293 () Unit!23906)

(declare-fun choose!36 (List!12988) Unit!23906)

(assert (=> d!93831 (= lt!313293 (choose!36 acc!681))))

(assert (=> d!93831 (= (lemmaListSubSeqRefl!0 acc!681) lt!313293)))

(declare-fun bs!20001 () Bool)

(assert (= bs!20001 d!93831))

(assert (=> bs!20001 m!646225))

(declare-fun m!646321 () Bool)

(assert (=> bs!20001 m!646321))

(assert (=> b!681388 d!93831))

(declare-fun d!93835 () Bool)

(assert (=> d!93835 (= (array_inv!14743 a!3626) (bvsge (size!19311 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!60654 d!93835))

(declare-fun d!93837 () Bool)

(declare-fun res!447627 () Bool)

(declare-fun e!388218 () Bool)

(assert (=> d!93837 (=> res!447627 e!388218)))

(assert (=> d!93837 (= res!447627 (is-Nil!12985 acc!681))))

(assert (=> d!93837 (= (noDuplicate!812 acc!681) e!388218)))

(declare-fun b!681487 () Bool)

(declare-fun e!388219 () Bool)

(assert (=> b!681487 (= e!388218 e!388219)))

(declare-fun res!447628 () Bool)

(assert (=> b!681487 (=> (not res!447628) (not e!388219))))

(assert (=> b!681487 (= res!447628 (not (contains!3565 (t!19222 acc!681) (h!14029 acc!681))))))

(declare-fun b!681488 () Bool)

(assert (=> b!681488 (= e!388219 (noDuplicate!812 (t!19222 acc!681)))))

(assert (= (and d!93837 (not res!447627)) b!681487))

(assert (= (and b!681487 res!447628) b!681488))

(declare-fun m!646329 () Bool)

(assert (=> b!681487 m!646329))

(declare-fun m!646331 () Bool)

(assert (=> b!681488 m!646331))

(assert (=> b!681370 d!93837))

(declare-fun d!93841 () Bool)

(declare-fun lt!313297 () Bool)

(assert (=> d!93841 (= lt!313297 (member k!2843 (content!274 acc!681)))))

(declare-fun e!388221 () Bool)

(assert (=> d!93841 (= lt!313297 e!388221)))

(declare-fun res!447629 () Bool)

(assert (=> d!93841 (=> (not res!447629) (not e!388221))))

(assert (=> d!93841 (= res!447629 (is-Cons!12984 acc!681))))

(assert (=> d!93841 (= (contains!3565 acc!681 k!2843) lt!313297)))

(declare-fun b!681489 () Bool)

(declare-fun e!388220 () Bool)

(assert (=> b!681489 (= e!388221 e!388220)))

(declare-fun res!447630 () Bool)

(assert (=> b!681489 (=> res!447630 e!388220)))

(assert (=> b!681489 (= res!447630 (= (h!14029 acc!681) k!2843))))

(declare-fun b!681490 () Bool)

(assert (=> b!681490 (= e!388220 (contains!3565 (t!19222 acc!681) k!2843))))

(assert (= (and d!93841 res!447629) b!681489))

(assert (= (and b!681489 (not res!447630)) b!681490))

(assert (=> d!93841 m!646293))

(declare-fun m!646333 () Bool)

(assert (=> d!93841 m!646333))

(declare-fun m!646335 () Bool)

(assert (=> b!681490 m!646335))

(assert (=> b!681369 d!93841))

(declare-fun d!93845 () Bool)

(declare-fun res!447631 () Bool)

(declare-fun e!388222 () Bool)

(assert (=> d!93845 (=> res!447631 e!388222)))

(assert (=> d!93845 (= res!447631 (is-Nil!12985 lt!313275))))

(assert (=> d!93845 (= (noDuplicate!812 lt!313275) e!388222)))

(declare-fun b!681491 () Bool)

(declare-fun e!388223 () Bool)

(assert (=> b!681491 (= e!388222 e!388223)))

(declare-fun res!447632 () Bool)

(assert (=> b!681491 (=> (not res!447632) (not e!388223))))

(assert (=> b!681491 (= res!447632 (not (contains!3565 (t!19222 lt!313275) (h!14029 lt!313275))))))

(declare-fun b!681492 () Bool)

(assert (=> b!681492 (= e!388223 (noDuplicate!812 (t!19222 lt!313275)))))

(assert (= (and d!93845 (not res!447631)) b!681491))

(assert (= (and b!681491 res!447632) b!681492))

(declare-fun m!646337 () Bool)

(assert (=> b!681491 m!646337))

(declare-fun m!646339 () Bool)

(assert (=> b!681492 m!646339))

(assert (=> b!681380 d!93845))

(declare-fun d!93847 () Bool)

(declare-fun lt!313298 () Bool)

(assert (=> d!93847 (= lt!313298 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!274 acc!681)))))

(declare-fun e!388229 () Bool)

(assert (=> d!93847 (= lt!313298 e!388229)))

(declare-fun res!447636 () Bool)

(assert (=> d!93847 (=> (not res!447636) (not e!388229))))

(assert (=> d!93847 (= res!447636 (is-Cons!12984 acc!681))))

(assert (=> d!93847 (= (contains!3565 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313298)))

(declare-fun b!681498 () Bool)

(declare-fun e!388228 () Bool)

(assert (=> b!681498 (= e!388229 e!388228)))

(declare-fun res!447637 () Bool)

(assert (=> b!681498 (=> res!447637 e!388228)))

(assert (=> b!681498 (= res!447637 (= (h!14029 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681499 () Bool)

(assert (=> b!681499 (= e!388228 (contains!3565 (t!19222 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93847 res!447636) b!681498))

(assert (= (and b!681498 (not res!447637)) b!681499))

(assert (=> d!93847 m!646293))

(declare-fun m!646341 () Bool)

(assert (=> d!93847 m!646341))

(declare-fun m!646343 () Bool)

(assert (=> b!681499 m!646343))

(assert (=> b!681382 d!93847))

(declare-fun d!93849 () Bool)

(declare-fun lt!313299 () Bool)

(assert (=> d!93849 (= lt!313299 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!274 lt!313275)))))

(declare-fun e!388231 () Bool)

(assert (=> d!93849 (= lt!313299 e!388231)))

(declare-fun res!447638 () Bool)

(assert (=> d!93849 (=> (not res!447638) (not e!388231))))

(assert (=> d!93849 (= res!447638 (is-Cons!12984 lt!313275))))

(assert (=> d!93849 (= (contains!3565 lt!313275 #b0000000000000000000000000000000000000000000000000000000000000000) lt!313299)))

(declare-fun b!681500 () Bool)

(declare-fun e!388230 () Bool)

(assert (=> b!681500 (= e!388231 e!388230)))

(declare-fun res!447639 () Bool)

(assert (=> b!681500 (=> res!447639 e!388230)))

(assert (=> b!681500 (= res!447639 (= (h!14029 lt!313275) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681501 () Bool)

(assert (=> b!681501 (= e!388230 (contains!3565 (t!19222 lt!313275) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93849 res!447638) b!681500))

(assert (= (and b!681500 (not res!447639)) b!681501))

(declare-fun m!646349 () Bool)

(assert (=> d!93849 m!646349))

(declare-fun m!646351 () Bool)

(assert (=> d!93849 m!646351))

(declare-fun m!646353 () Bool)

(assert (=> b!681501 m!646353))

(assert (=> b!681381 d!93849))

(declare-fun d!93855 () Bool)

(declare-fun lt!313300 () Bool)

(assert (=> d!93855 (= lt!313300 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!274 lt!313275)))))

(declare-fun e!388235 () Bool)

(assert (=> d!93855 (= lt!313300 e!388235)))

(declare-fun res!447642 () Bool)

(assert (=> d!93855 (=> (not res!447642) (not e!388235))))

(assert (=> d!93855 (= res!447642 (is-Cons!12984 lt!313275))))

(assert (=> d!93855 (= (contains!3565 lt!313275 #b1000000000000000000000000000000000000000000000000000000000000000) lt!313300)))

(declare-fun b!681504 () Bool)

(declare-fun e!388234 () Bool)

(assert (=> b!681504 (= e!388235 e!388234)))

(declare-fun res!447643 () Bool)

(assert (=> b!681504 (=> res!447643 e!388234)))

(assert (=> b!681504 (= res!447643 (= (h!14029 lt!313275) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!681505 () Bool)

(assert (=> b!681505 (= e!388234 (contains!3565 (t!19222 lt!313275) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!93855 res!447642) b!681504))

(assert (= (and b!681504 (not res!447643)) b!681505))

(assert (=> d!93855 m!646349))

(declare-fun m!646357 () Bool)

(assert (=> d!93855 m!646357))

(declare-fun m!646361 () Bool)

(assert (=> b!681505 m!646361))

(assert (=> b!681372 d!93855))

(declare-fun d!93857 () Bool)

(assert (=> d!93857 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!681374 d!93857))

(declare-fun d!93863 () Bool)

(declare-fun res!447669 () Bool)

(declare-fun e!388262 () Bool)

(assert (=> d!93863 (=> res!447669 e!388262)))

(assert (=> d!93863 (= res!447669 (= (select (arr!18947 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!93863 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!388262)))

(declare-fun b!681533 () Bool)

(declare-fun e!388263 () Bool)

(assert (=> b!681533 (= e!388262 e!388263)))

(declare-fun res!447670 () Bool)

(assert (=> b!681533 (=> (not res!447670) (not e!388263))))

(assert (=> b!681533 (= res!447670 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19311 a!3626)))))

(declare-fun b!681534 () Bool)

(assert (=> b!681534 (= e!388263 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!93863 (not res!447669)) b!681533))

(assert (= (and b!681533 res!447670) b!681534))

(declare-fun m!646381 () Bool)

(assert (=> d!93863 m!646381))

(declare-fun m!646383 () Bool)

(assert (=> b!681534 m!646383))

(assert (=> b!681373 d!93863))

(assert (=> b!681384 d!93841))

(declare-fun d!93873 () Bool)

(declare-fun res!447698 () Bool)

(declare-fun e!388293 () Bool)

(assert (=> d!93873 (=> res!447698 e!388293)))

(assert (=> d!93873 (= res!447698 (bvsge #b00000000000000000000000000000000 (size!19311 a!3626)))))

(assert (=> d!93873 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12985) e!388293)))

(declare-fun b!681565 () Bool)

(declare-fun e!388295 () Bool)

(assert (=> b!681565 (= e!388293 e!388295)))

(declare-fun res!447697 () Bool)

(assert (=> b!681565 (=> (not res!447697) (not e!388295))))

(declare-fun e!388292 () Bool)

(assert (=> b!681565 (= res!447697 (not e!388292))))

(declare-fun res!447699 () Bool)

(assert (=> b!681565 (=> (not res!447699) (not e!388292))))

(assert (=> b!681565 (= res!447699 (validKeyInArray!0 (select (arr!18947 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!33969 () Bool)

(declare-fun call!33972 () Bool)

(declare-fun c!77301 () Bool)

(assert (=> bm!33969 (= call!33972 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77301 (Cons!12984 (select (arr!18947 a!3626) #b00000000000000000000000000000000) Nil!12985) Nil!12985)))))

(declare-fun b!681566 () Bool)

(declare-fun e!388294 () Bool)

(assert (=> b!681566 (= e!388294 call!33972)))

(declare-fun b!681567 () Bool)

(assert (=> b!681567 (= e!388295 e!388294)))

