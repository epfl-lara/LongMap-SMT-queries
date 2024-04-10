; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61088 () Bool)

(assert start!61088)

(declare-fun b!685006 () Bool)

(declare-fun e!390110 () Bool)

(declare-fun e!390114 () Bool)

(assert (=> b!685006 (= e!390110 e!390114)))

(declare-fun res!450448 () Bool)

(assert (=> b!685006 (=> (not res!450448) (not e!390114))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!685006 (= res!450448 (bvsle from!3004 i!1382))))

(declare-fun b!685007 () Bool)

(declare-fun res!450456 () Bool)

(declare-fun e!390113 () Bool)

(assert (=> b!685007 (=> (not res!450456) (not e!390113))))

(declare-datatypes ((array!39622 0))(
  ( (array!39623 (arr!18990 (Array (_ BitVec 32) (_ BitVec 64))) (size!19359 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39622)

(declare-datatypes ((List!13031 0))(
  ( (Nil!13028) (Cons!13027 (h!14072 (_ BitVec 64)) (t!19280 List!13031)) )
))
(declare-fun acc!681 () List!13031)

(declare-fun arrayNoDuplicates!0 (array!39622 (_ BitVec 32) List!13031) Bool)

(assert (=> b!685007 (= res!450456 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!685008 () Bool)

(declare-datatypes ((Unit!24117 0))(
  ( (Unit!24118) )
))
(declare-fun e!390107 () Unit!24117)

(declare-fun Unit!24119 () Unit!24117)

(assert (=> b!685008 (= e!390107 Unit!24119)))

(declare-fun b!685009 () Bool)

(declare-fun res!450450 () Bool)

(declare-fun e!390112 () Bool)

(assert (=> b!685009 (=> res!450450 e!390112)))

(declare-fun lt!314523 () Bool)

(assert (=> b!685009 (= res!450450 lt!314523)))

(declare-fun b!685010 () Bool)

(declare-fun res!450449 () Bool)

(assert (=> b!685010 (=> res!450449 e!390112)))

(declare-fun lt!314518 () List!13031)

(declare-fun subseq!194 (List!13031 List!13031) Bool)

(assert (=> b!685010 (= res!450449 (not (subseq!194 acc!681 lt!314518)))))

(declare-fun b!685011 () Bool)

(declare-fun res!450458 () Bool)

(assert (=> b!685011 (=> (not res!450458) (not e!390113))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!685011 (= res!450458 (validKeyInArray!0 k!2843))))

(declare-fun b!685012 () Bool)

(assert (=> b!685012 (= e!390113 (not e!390112))))

(declare-fun res!450461 () Bool)

(assert (=> b!685012 (=> res!450461 e!390112)))

(assert (=> b!685012 (= res!450461 (bvslt (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun -!159 (List!13031 (_ BitVec 64)) List!13031)

(assert (=> b!685012 (= (-!159 lt!314518 k!2843) acc!681)))

(declare-fun $colon$colon!359 (List!13031 (_ BitVec 64)) List!13031)

(assert (=> b!685012 (= lt!314518 ($colon$colon!359 acc!681 k!2843))))

(declare-fun lt!314520 () Unit!24117)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!13031) Unit!24117)

(assert (=> b!685012 (= lt!314520 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(assert (=> b!685012 (subseq!194 acc!681 acc!681)))

(declare-fun lt!314517 () Unit!24117)

(declare-fun lemmaListSubSeqRefl!0 (List!13031) Unit!24117)

(assert (=> b!685012 (= lt!314517 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685012 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314521 () Unit!24117)

(assert (=> b!685012 (= lt!314521 e!390107)))

(declare-fun c!77647 () Bool)

(assert (=> b!685012 (= c!77647 (validKeyInArray!0 (select (arr!18990 a!3626) from!3004)))))

(declare-fun lt!314524 () Unit!24117)

(declare-fun e!390109 () Unit!24117)

(assert (=> b!685012 (= lt!314524 e!390109)))

(declare-fun c!77648 () Bool)

(assert (=> b!685012 (= c!77648 lt!314523)))

(declare-fun arrayContainsKey!0 (array!39622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!685012 (= lt!314523 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685012 (arrayContainsKey!0 (array!39623 (store (arr!18990 a!3626) i!1382 k!2843) (size!19359 a!3626)) k!2843 from!3004)))

(declare-fun b!685013 () Bool)

(declare-fun Unit!24120 () Unit!24117)

(assert (=> b!685013 (= e!390109 Unit!24120)))

(declare-fun lt!314516 () Unit!24117)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39622 (_ BitVec 64) (_ BitVec 32)) Unit!24117)

(assert (=> b!685013 (= lt!314516 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!685013 false))

(declare-fun res!450451 () Bool)

(assert (=> start!61088 (=> (not res!450451) (not e!390113))))

(assert (=> start!61088 (= res!450451 (and (bvslt (size!19359 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19359 a!3626))))))

(assert (=> start!61088 e!390113))

(assert (=> start!61088 true))

(declare-fun array_inv!14786 (array!39622) Bool)

(assert (=> start!61088 (array_inv!14786 a!3626)))

(declare-fun b!685014 () Bool)

(declare-fun contains!3608 (List!13031 (_ BitVec 64)) Bool)

(assert (=> b!685014 (= e!390114 (not (contains!3608 acc!681 k!2843)))))

(declare-fun b!685015 () Bool)

(declare-fun Unit!24121 () Unit!24117)

(assert (=> b!685015 (= e!390109 Unit!24121)))

(declare-fun b!685016 () Bool)

(declare-fun res!450464 () Bool)

(assert (=> b!685016 (=> (not res!450464) (not e!390113))))

(declare-fun noDuplicate!855 (List!13031) Bool)

(assert (=> b!685016 (= res!450464 (noDuplicate!855 acc!681))))

(declare-fun b!685017 () Bool)

(declare-fun e!390111 () Bool)

(assert (=> b!685017 (= e!390111 (contains!3608 acc!681 k!2843))))

(declare-fun b!685018 () Bool)

(declare-fun res!450454 () Bool)

(assert (=> b!685018 (=> (not res!450454) (not e!390113))))

(assert (=> b!685018 (= res!450454 (not (contains!3608 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685019 () Bool)

(assert (=> b!685019 (= e!390112 (contains!3608 lt!314518 k!2843))))

(declare-fun b!685020 () Bool)

(declare-fun res!450453 () Bool)

(assert (=> b!685020 (=> res!450453 e!390112)))

(assert (=> b!685020 (= res!450453 (not (noDuplicate!855 lt!314518)))))

(declare-fun b!685021 () Bool)

(declare-fun res!450462 () Bool)

(assert (=> b!685021 (=> (not res!450462) (not e!390113))))

(assert (=> b!685021 (= res!450462 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19359 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!685022 () Bool)

(declare-fun res!450447 () Bool)

(assert (=> b!685022 (=> (not res!450447) (not e!390113))))

(assert (=> b!685022 (= res!450447 e!390110)))

(declare-fun res!450463 () Bool)

(assert (=> b!685022 (=> res!450463 e!390110)))

(assert (=> b!685022 (= res!450463 e!390111)))

(declare-fun res!450452 () Bool)

(assert (=> b!685022 (=> (not res!450452) (not e!390111))))

(assert (=> b!685022 (= res!450452 (bvsgt from!3004 i!1382))))

(declare-fun b!685023 () Bool)

(declare-fun res!450457 () Bool)

(assert (=> b!685023 (=> (not res!450457) (not e!390113))))

(assert (=> b!685023 (= res!450457 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!685024 () Bool)

(declare-fun lt!314522 () Unit!24117)

(assert (=> b!685024 (= e!390107 lt!314522)))

(declare-fun lt!314519 () Unit!24117)

(assert (=> b!685024 (= lt!314519 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!685024 (subseq!194 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39622 List!13031 List!13031 (_ BitVec 32)) Unit!24117)

(assert (=> b!685024 (= lt!314522 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!359 acc!681 (select (arr!18990 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!685024 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!685025 () Bool)

(declare-fun res!450460 () Bool)

(assert (=> b!685025 (=> (not res!450460) (not e!390113))))

(assert (=> b!685025 (= res!450460 (not (contains!3608 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!685026 () Bool)

(declare-fun res!450455 () Bool)

(assert (=> b!685026 (=> res!450455 e!390112)))

(assert (=> b!685026 (= res!450455 (contains!3608 acc!681 k!2843))))

(declare-fun b!685027 () Bool)

(declare-fun res!450446 () Bool)

(assert (=> b!685027 (=> (not res!450446) (not e!390113))))

(assert (=> b!685027 (= res!450446 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13028))))

(declare-fun b!685028 () Bool)

(declare-fun res!450459 () Bool)

(assert (=> b!685028 (=> (not res!450459) (not e!390113))))

(assert (=> b!685028 (= res!450459 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19359 a!3626))))))

(assert (= (and start!61088 res!450451) b!685016))

(assert (= (and b!685016 res!450464) b!685018))

(assert (= (and b!685018 res!450454) b!685025))

(assert (= (and b!685025 res!450460) b!685022))

(assert (= (and b!685022 res!450452) b!685017))

(assert (= (and b!685022 (not res!450463)) b!685006))

(assert (= (and b!685006 res!450448) b!685014))

(assert (= (and b!685022 res!450447) b!685027))

(assert (= (and b!685027 res!450446) b!685007))

(assert (= (and b!685007 res!450456) b!685028))

(assert (= (and b!685028 res!450459) b!685011))

(assert (= (and b!685011 res!450458) b!685023))

(assert (= (and b!685023 res!450457) b!685021))

(assert (= (and b!685021 res!450462) b!685012))

(assert (= (and b!685012 c!77648) b!685013))

(assert (= (and b!685012 (not c!77648)) b!685015))

(assert (= (and b!685012 c!77647) b!685024))

(assert (= (and b!685012 (not c!77647)) b!685008))

(assert (= (and b!685012 (not res!450461)) b!685020))

(assert (= (and b!685020 (not res!450453)) b!685009))

(assert (= (and b!685009 (not res!450450)) b!685026))

(assert (= (and b!685026 (not res!450455)) b!685010))

(assert (= (and b!685010 (not res!450449)) b!685019))

(declare-fun m!649271 () Bool)

(assert (=> b!685019 m!649271))

(declare-fun m!649273 () Bool)

(assert (=> b!685020 m!649273))

(declare-fun m!649275 () Bool)

(assert (=> b!685014 m!649275))

(declare-fun m!649277 () Bool)

(assert (=> b!685023 m!649277))

(declare-fun m!649279 () Bool)

(assert (=> b!685024 m!649279))

(declare-fun m!649281 () Bool)

(assert (=> b!685024 m!649281))

(declare-fun m!649283 () Bool)

(assert (=> b!685024 m!649283))

(declare-fun m!649285 () Bool)

(assert (=> b!685024 m!649285))

(assert (=> b!685024 m!649281))

(assert (=> b!685024 m!649283))

(declare-fun m!649287 () Bool)

(assert (=> b!685024 m!649287))

(declare-fun m!649289 () Bool)

(assert (=> b!685024 m!649289))

(assert (=> b!685017 m!649275))

(declare-fun m!649291 () Bool)

(assert (=> b!685016 m!649291))

(declare-fun m!649293 () Bool)

(assert (=> b!685018 m!649293))

(declare-fun m!649295 () Bool)

(assert (=> b!685007 m!649295))

(assert (=> b!685026 m!649275))

(assert (=> b!685012 m!649279))

(assert (=> b!685012 m!649281))

(declare-fun m!649297 () Bool)

(assert (=> b!685012 m!649297))

(declare-fun m!649299 () Bool)

(assert (=> b!685012 m!649299))

(declare-fun m!649301 () Bool)

(assert (=> b!685012 m!649301))

(assert (=> b!685012 m!649287))

(declare-fun m!649303 () Bool)

(assert (=> b!685012 m!649303))

(declare-fun m!649305 () Bool)

(assert (=> b!685012 m!649305))

(assert (=> b!685012 m!649281))

(declare-fun m!649307 () Bool)

(assert (=> b!685012 m!649307))

(declare-fun m!649309 () Bool)

(assert (=> b!685012 m!649309))

(assert (=> b!685012 m!649289))

(declare-fun m!649311 () Bool)

(assert (=> b!685010 m!649311))

(declare-fun m!649313 () Bool)

(assert (=> b!685013 m!649313))

(declare-fun m!649315 () Bool)

(assert (=> b!685027 m!649315))

(declare-fun m!649317 () Bool)

(assert (=> start!61088 m!649317))

(declare-fun m!649319 () Bool)

(assert (=> b!685025 m!649319))

(declare-fun m!649321 () Bool)

(assert (=> b!685011 m!649321))

(push 1)

(assert (not b!685023))

(assert (not b!685010))

(assert (not b!685026))

(assert (not b!685007))

(assert (not b!685017))

(assert (not b!685016))

(assert (not b!685020))

(assert (not b!685027))

(assert (not b!685024))

(assert (not b!685011))

(assert (not b!685014))

(assert (not start!61088))

(assert (not b!685019))

(assert (not b!685012))

(assert (not b!685013))

(assert (not b!685025))

(assert (not b!685018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94459 () Bool)

(declare-fun res!450599 () Bool)

(declare-fun e!390183 () Bool)

(assert (=> d!94459 (=> res!450599 e!390183)))

(assert (=> d!94459 (= res!450599 (is-Nil!13028 lt!314518))))

(assert (=> d!94459 (= (noDuplicate!855 lt!314518) e!390183)))

(declare-fun b!685187 () Bool)

(declare-fun e!390184 () Bool)

(assert (=> b!685187 (= e!390183 e!390184)))

(declare-fun res!450600 () Bool)

(assert (=> b!685187 (=> (not res!450600) (not e!390184))))

(assert (=> b!685187 (= res!450600 (not (contains!3608 (t!19280 lt!314518) (h!14072 lt!314518))))))

(declare-fun b!685188 () Bool)

(assert (=> b!685188 (= e!390184 (noDuplicate!855 (t!19280 lt!314518)))))

(assert (= (and d!94459 (not res!450599)) b!685187))

(assert (= (and b!685187 res!450600) b!685188))

(declare-fun m!649427 () Bool)

(assert (=> b!685187 m!649427))

(declare-fun m!649429 () Bool)

(assert (=> b!685188 m!649429))

(assert (=> b!685020 d!94459))

(declare-fun b!685203 () Bool)

(declare-fun e!390199 () Bool)

(declare-fun e!390201 () Bool)

(assert (=> b!685203 (= e!390199 e!390201)))

(declare-fun res!450617 () Bool)

(assert (=> b!685203 (=> (not res!450617) (not e!390201))))

(assert (=> b!685203 (= res!450617 (is-Cons!13027 lt!314518))))

(declare-fun d!94461 () Bool)

(declare-fun res!450616 () Bool)

(assert (=> d!94461 (=> res!450616 e!390199)))

(assert (=> d!94461 (= res!450616 (is-Nil!13028 acc!681))))

(assert (=> d!94461 (= (subseq!194 acc!681 lt!314518) e!390199)))

(declare-fun b!685205 () Bool)

(declare-fun e!390200 () Bool)

(assert (=> b!685205 (= e!390200 (subseq!194 (t!19280 acc!681) (t!19280 lt!314518)))))

(declare-fun b!685206 () Bool)

(declare-fun e!390202 () Bool)

(assert (=> b!685206 (= e!390202 (subseq!194 acc!681 (t!19280 lt!314518)))))

(declare-fun b!685204 () Bool)

(assert (=> b!685204 (= e!390201 e!390202)))

(declare-fun res!450618 () Bool)

(assert (=> b!685204 (=> res!450618 e!390202)))

(assert (=> b!685204 (= res!450618 e!390200)))

(declare-fun res!450615 () Bool)

(assert (=> b!685204 (=> (not res!450615) (not e!390200))))

(assert (=> b!685204 (= res!450615 (= (h!14072 acc!681) (h!14072 lt!314518)))))

(assert (= (and d!94461 (not res!450616)) b!685203))

(assert (= (and b!685203 res!450617) b!685204))

(assert (= (and b!685204 res!450615) b!685205))

(assert (= (and b!685204 (not res!450618)) b!685206))

(declare-fun m!649441 () Bool)

(assert (=> b!685205 m!649441))

(declare-fun m!649443 () Bool)

(assert (=> b!685206 m!649443))

(assert (=> b!685010 d!94461))

(declare-fun d!94467 () Bool)

(assert (=> d!94467 (= (validKeyInArray!0 k!2843) (and (not (= k!2843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685011 d!94467))

(declare-fun d!94469 () Bool)

(declare-fun res!450635 () Bool)

(declare-fun e!390219 () Bool)

(assert (=> d!94469 (=> res!450635 e!390219)))

(assert (=> d!94469 (= res!450635 (= (select (arr!18990 a!3626) #b00000000000000000000000000000000) k!2843))))

(assert (=> d!94469 (= (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000) e!390219)))

(declare-fun b!685223 () Bool)

(declare-fun e!390220 () Bool)

(assert (=> b!685223 (= e!390219 e!390220)))

(declare-fun res!450636 () Bool)

(assert (=> b!685223 (=> (not res!450636) (not e!390220))))

(assert (=> b!685223 (= res!450636 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19359 a!3626)))))

(declare-fun b!685224 () Bool)

(assert (=> b!685224 (= e!390220 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!94469 (not res!450635)) b!685223))

(assert (= (and b!685223 res!450636) b!685224))

(declare-fun m!649455 () Bool)

(assert (=> d!94469 m!649455))

(declare-fun m!649457 () Bool)

(assert (=> b!685224 m!649457))

(assert (=> b!685023 d!94469))

(declare-fun b!685253 () Bool)

(declare-fun e!390246 () List!13031)

(declare-fun call!34055 () List!13031)

(assert (=> b!685253 (= e!390246 call!34055)))

(declare-fun bm!34052 () Bool)

(assert (=> bm!34052 (= call!34055 (-!159 (t!19280 lt!314518) k!2843))))

(declare-fun b!685254 () Bool)

(assert (=> b!685254 (= e!390246 (Cons!13027 (h!14072 lt!314518) call!34055))))

(declare-fun d!94475 () Bool)

(declare-fun e!390247 () Bool)

(assert (=> d!94475 e!390247))

(declare-fun res!450657 () Bool)

(assert (=> d!94475 (=> (not res!450657) (not e!390247))))

(declare-fun lt!314595 () List!13031)

(declare-fun size!19362 (List!13031) Int)

(assert (=> d!94475 (= res!450657 (<= (size!19362 lt!314595) (size!19362 lt!314518)))))

(declare-fun e!390248 () List!13031)

(assert (=> d!94475 (= lt!314595 e!390248)))

(declare-fun c!77665 () Bool)

(assert (=> d!94475 (= c!77665 (is-Cons!13027 lt!314518))))

(assert (=> d!94475 (= (-!159 lt!314518 k!2843) lt!314595)))

(declare-fun b!685255 () Bool)

(declare-fun content!288 (List!13031) (Set (_ BitVec 64)))

(assert (=> b!685255 (= e!390247 (= (content!288 lt!314595) (set.minus (content!288 lt!314518) (set.insert k!2843 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!685256 () Bool)

(assert (=> b!685256 (= e!390248 Nil!13028)))

(declare-fun b!685257 () Bool)

(assert (=> b!685257 (= e!390248 e!390246)))

(declare-fun c!77666 () Bool)

(assert (=> b!685257 (= c!77666 (= k!2843 (h!14072 lt!314518)))))

(assert (= (and d!94475 c!77665) b!685257))

(assert (= (and d!94475 (not c!77665)) b!685256))

(assert (= (and b!685257 c!77666) b!685253))

(assert (= (and b!685257 (not c!77666)) b!685254))

(assert (= (or b!685253 b!685254) bm!34052))

(assert (= (and d!94475 res!450657) b!685255))

(declare-fun m!649489 () Bool)

(assert (=> bm!34052 m!649489))

(declare-fun m!649491 () Bool)

(assert (=> d!94475 m!649491))

(declare-fun m!649493 () Bool)

(assert (=> d!94475 m!649493))

(declare-fun m!649495 () Bool)

(assert (=> b!685255 m!649495))

(declare-fun m!649497 () Bool)

(assert (=> b!685255 m!649497))

(declare-fun m!649501 () Bool)

(assert (=> b!685255 m!649501))

(assert (=> b!685012 d!94475))

(declare-fun b!685260 () Bool)

(declare-fun e!390251 () Bool)

(declare-fun e!390253 () Bool)

(assert (=> b!685260 (= e!390251 e!390253)))

(declare-fun res!450662 () Bool)

(assert (=> b!685260 (=> (not res!450662) (not e!390253))))

(assert (=> b!685260 (= res!450662 (is-Cons!13027 acc!681))))

(declare-fun d!94493 () Bool)

(declare-fun res!450661 () Bool)

(assert (=> d!94493 (=> res!450661 e!390251)))

(assert (=> d!94493 (= res!450661 (is-Nil!13028 acc!681))))

(assert (=> d!94493 (= (subseq!194 acc!681 acc!681) e!390251)))

(declare-fun b!685262 () Bool)

(declare-fun e!390252 () Bool)

(assert (=> b!685262 (= e!390252 (subseq!194 (t!19280 acc!681) (t!19280 acc!681)))))

(declare-fun b!685263 () Bool)

(declare-fun e!390254 () Bool)

(assert (=> b!685263 (= e!390254 (subseq!194 acc!681 (t!19280 acc!681)))))

(declare-fun b!685261 () Bool)

(assert (=> b!685261 (= e!390253 e!390254)))

(declare-fun res!450663 () Bool)

(assert (=> b!685261 (=> res!450663 e!390254)))

(assert (=> b!685261 (= res!450663 e!390252)))

(declare-fun res!450660 () Bool)

(assert (=> b!685261 (=> (not res!450660) (not e!390252))))

(assert (=> b!685261 (= res!450660 (= (h!14072 acc!681) (h!14072 acc!681)))))

(assert (= (and d!94493 (not res!450661)) b!685260))

(assert (= (and b!685260 res!450662) b!685261))

(assert (= (and b!685261 res!450660) b!685262))

(assert (= (and b!685261 (not res!450663)) b!685263))

(declare-fun m!649505 () Bool)

(assert (=> b!685262 m!649505))

(declare-fun m!649507 () Bool)

(assert (=> b!685263 m!649507))

(assert (=> b!685012 d!94493))

(declare-fun d!94497 () Bool)

(declare-fun res!450664 () Bool)

(declare-fun e!390255 () Bool)

(assert (=> d!94497 (=> res!450664 e!390255)))

(assert (=> d!94497 (= res!450664 (= (select (arr!18990 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) k!2843))))

(assert (=> d!94497 (= (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)) e!390255)))

(declare-fun b!685264 () Bool)

(declare-fun e!390256 () Bool)

(assert (=> b!685264 (= e!390255 e!390256)))

(declare-fun res!450665 () Bool)

(assert (=> b!685264 (=> (not res!450665) (not e!390256))))

(assert (=> b!685264 (= res!450665 (bvslt (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (size!19359 a!3626)))))

(declare-fun b!685265 () Bool)

(assert (=> b!685265 (= e!390256 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94497 (not res!450664)) b!685264))

(assert (= (and b!685264 res!450665) b!685265))

(declare-fun m!649509 () Bool)

(assert (=> d!94497 m!649509))

(declare-fun m!649511 () Bool)

(assert (=> b!685265 m!649511))

(assert (=> b!685012 d!94497))

(declare-fun d!94499 () Bool)

(assert (=> d!94499 (= (-!159 ($colon$colon!359 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!314601 () Unit!24117)

(declare-fun choose!16 ((_ BitVec 64) List!13031) Unit!24117)

(assert (=> d!94499 (= lt!314601 (choose!16 k!2843 acc!681))))

(assert (=> d!94499 (not (contains!3608 acc!681 k!2843))))

(assert (=> d!94499 (= (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681) lt!314601)))

(declare-fun bs!20092 () Bool)

(assert (= bs!20092 d!94499))

(assert (=> bs!20092 m!649305))

(assert (=> bs!20092 m!649305))

(declare-fun m!649515 () Bool)

(assert (=> bs!20092 m!649515))

(declare-fun m!649517 () Bool)

(assert (=> bs!20092 m!649517))

(assert (=> bs!20092 m!649275))

(assert (=> b!685012 d!94499))

(declare-fun d!94505 () Bool)

(declare-fun res!450674 () Bool)

(declare-fun e!390265 () Bool)

(assert (=> d!94505 (=> res!450674 e!390265)))

(assert (=> d!94505 (= res!450674 (= (select (arr!18990 (array!39623 (store (arr!18990 a!3626) i!1382 k!2843) (size!19359 a!3626))) from!3004) k!2843))))

(assert (=> d!94505 (= (arrayContainsKey!0 (array!39623 (store (arr!18990 a!3626) i!1382 k!2843) (size!19359 a!3626)) k!2843 from!3004) e!390265)))

(declare-fun b!685274 () Bool)

(declare-fun e!390266 () Bool)

(assert (=> b!685274 (= e!390265 e!390266)))

(declare-fun res!450675 () Bool)

(assert (=> b!685274 (=> (not res!450675) (not e!390266))))

(assert (=> b!685274 (= res!450675 (bvslt (bvadd from!3004 #b00000000000000000000000000000001) (size!19359 (array!39623 (store (arr!18990 a!3626) i!1382 k!2843) (size!19359 a!3626)))))))

(declare-fun b!685275 () Bool)

(assert (=> b!685275 (= e!390266 (arrayContainsKey!0 (array!39623 (store (arr!18990 a!3626) i!1382 k!2843) (size!19359 a!3626)) k!2843 (bvadd from!3004 #b00000000000000000000000000000001)))))

(assert (= (and d!94505 (not res!450674)) b!685274))

(assert (= (and b!685274 res!450675) b!685275))

(declare-fun m!649519 () Bool)

(assert (=> d!94505 m!649519))

(declare-fun m!649521 () Bool)

(assert (=> b!685275 m!649521))

(assert (=> b!685012 d!94505))

(declare-fun d!94507 () Bool)

(assert (=> d!94507 (subseq!194 acc!681 acc!681)))

(declare-fun lt!314604 () Unit!24117)

(declare-fun choose!36 (List!13031) Unit!24117)

(assert (=> d!94507 (= lt!314604 (choose!36 acc!681))))

(assert (=> d!94507 (= (lemmaListSubSeqRefl!0 acc!681) lt!314604)))

(declare-fun bs!20093 () Bool)

(assert (= bs!20093 d!94507))

(assert (=> bs!20093 m!649289))

(declare-fun m!649527 () Bool)

(assert (=> bs!20093 m!649527))

(assert (=> b!685012 d!94507))

(declare-fun d!94511 () Bool)

(assert (=> d!94511 (= (validKeyInArray!0 (select (arr!18990 a!3626) from!3004)) (and (not (= (select (arr!18990 a!3626) from!3004) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18990 a!3626) from!3004) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!685012 d!94511))

(declare-fun d!94513 () Bool)

(assert (=> d!94513 (= ($colon$colon!359 acc!681 k!2843) (Cons!13027 k!2843 acc!681))))

(assert (=> b!685012 d!94513))

(declare-fun b!685302 () Bool)

(declare-fun e!390291 () Bool)

(assert (=> b!685302 (= e!390291 (contains!3608 acc!681 (select (arr!18990 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun b!685303 () Bool)

(declare-fun e!390290 () Bool)

(declare-fun e!390288 () Bool)

(assert (=> b!685303 (= e!390290 e!390288)))

(declare-fun res!450692 () Bool)

(assert (=> b!685303 (=> (not res!450692) (not e!390288))))

(assert (=> b!685303 (= res!450692 (not e!390291))))

(declare-fun res!450690 () Bool)

(assert (=> b!685303 (=> (not res!450690) (not e!390291))))

(assert (=> b!685303 (= res!450690 (validKeyInArray!0 (select (arr!18990 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(declare-fun bm!34057 () Bool)

(declare-fun call!34060 () Bool)

(declare-fun c!77673 () Bool)

(assert (=> bm!34057 (= call!34060 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004 #b00000000000000000000000000000001) (ite c!77673 (Cons!13027 (select (arr!18990 a!3626) (bvadd #b00000000000000000000000000000001 from!3004)) acc!681) acc!681)))))

(declare-fun b!685304 () Bool)

(declare-fun e!390289 () Bool)

(assert (=> b!685304 (= e!390289 call!34060)))

(declare-fun b!685305 () Bool)

(assert (=> b!685305 (= e!390289 call!34060)))

(declare-fun d!94517 () Bool)

(declare-fun res!450691 () Bool)

(assert (=> d!94517 (=> res!450691 e!390290)))

(assert (=> d!94517 (= res!450691 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) (size!19359 a!3626)))))

(assert (=> d!94517 (= (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681) e!390290)))

(declare-fun b!685306 () Bool)

(assert (=> b!685306 (= e!390288 e!390289)))

(assert (=> b!685306 (= c!77673 (validKeyInArray!0 (select (arr!18990 a!3626) (bvadd #b00000000000000000000000000000001 from!3004))))))

(assert (= (and d!94517 (not res!450691)) b!685303))

(assert (= (and b!685303 res!450690) b!685302))

(assert (= (and b!685303 res!450692) b!685306))

(assert (= (and b!685306 c!77673) b!685304))

(assert (= (and b!685306 (not c!77673)) b!685305))

(assert (= (or b!685304 b!685305) bm!34057))

(assert (=> b!685302 m!649509))

(assert (=> b!685302 m!649509))

(declare-fun m!649537 () Bool)

(assert (=> b!685302 m!649537))

(assert (=> b!685303 m!649509))

(assert (=> b!685303 m!649509))

(declare-fun m!649539 () Bool)

(assert (=> b!685303 m!649539))

(assert (=> bm!34057 m!649509))

(declare-fun m!649541 () Bool)

(assert (=> bm!34057 m!649541))

(assert (=> b!685306 m!649509))

(assert (=> b!685306 m!649509))

(assert (=> b!685306 m!649539))

(assert (=> b!685012 d!94517))

(declare-fun d!94521 () Bool)

(assert (=> d!94521 (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))

(declare-fun lt!314615 () Unit!24117)

(declare-fun choose!13 (array!39622 (_ BitVec 64) (_ BitVec 32)) Unit!24117)

(assert (=> d!94521 (= lt!314615 (choose!13 a!3626 k!2843 from!3004))))

(assert (=> d!94521 (bvsge from!3004 #b00000000000000000000000000000000)))

(assert (=> d!94521 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004) lt!314615)))

(declare-fun bs!20095 () Bool)

(assert (= bs!20095 d!94521))

(assert (=> bs!20095 m!649277))

(declare-fun m!649555 () Bool)

(assert (=> bs!20095 m!649555))

(assert (=> b!685013 d!94521))

(declare-fun d!94525 () Bool)

(assert (=> d!94525 (= ($colon$colon!359 acc!681 (select (arr!18990 a!3626) from!3004)) (Cons!13027 (select (arr!18990 a!3626) from!3004) acc!681))))

(assert (=> b!685024 d!94525))

(assert (=> b!685024 d!94493))

(declare-fun d!94527 () Bool)

(assert (=> d!94527 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!314620 () Unit!24117)

(declare-fun choose!80 (array!39622 List!13031 List!13031 (_ BitVec 32)) Unit!24117)

(assert (=> d!94527 (= lt!314620 (choose!80 a!3626 ($colon$colon!359 acc!681 (select (arr!18990 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> d!94527 (bvslt (size!19359 a!3626) #b01111111111111111111111111111111)))

(assert (=> d!94527 (= (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!359 acc!681 (select (arr!18990 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)) lt!314620)))

(declare-fun bs!20096 () Bool)

(assert (= bs!20096 d!94527))

(assert (=> bs!20096 m!649279))

(assert (=> bs!20096 m!649283))

(declare-fun m!649557 () Bool)

(assert (=> bs!20096 m!649557))

(assert (=> b!685024 d!94527))

(assert (=> b!685024 d!94507))

(assert (=> b!685024 d!94517))

(declare-fun d!94529 () Bool)

(declare-fun lt!314625 () Bool)

(assert (=> d!94529 (= lt!314625 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!288 acc!681)))))

(declare-fun e!390310 () Bool)

(assert (=> d!94529 (= lt!314625 e!390310)))

(declare-fun res!450701 () Bool)

(assert (=> d!94529 (=> (not res!450701) (not e!390310))))

(assert (=> d!94529 (= res!450701 (is-Cons!13027 acc!681))))

(assert (=> d!94529 (= (contains!3608 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000) lt!314625)))

(declare-fun b!685331 () Bool)

(declare-fun e!390309 () Bool)

(assert (=> b!685331 (= e!390310 e!390309)))

(declare-fun res!450702 () Bool)

(assert (=> b!685331 (=> res!450702 e!390309)))

(assert (=> b!685331 (= res!450702 (= (h!14072 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685332 () Bool)

(assert (=> b!685332 (= e!390309 (contains!3608 (t!19280 acc!681) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94529 res!450701) b!685331))

(assert (= (and b!685331 (not res!450702)) b!685332))

(declare-fun m!649573 () Bool)

(assert (=> d!94529 m!649573))

(declare-fun m!649575 () Bool)

(assert (=> d!94529 m!649575))

(declare-fun m!649577 () Bool)

(assert (=> b!685332 m!649577))

(assert (=> b!685025 d!94529))

(declare-fun d!94537 () Bool)

(declare-fun lt!314626 () Bool)

(assert (=> d!94537 (= lt!314626 (set.member k!2843 (content!288 acc!681)))))

(declare-fun e!390314 () Bool)

(assert (=> d!94537 (= lt!314626 e!390314)))

(declare-fun res!450705 () Bool)

(assert (=> d!94537 (=> (not res!450705) (not e!390314))))

(assert (=> d!94537 (= res!450705 (is-Cons!13027 acc!681))))

(assert (=> d!94537 (= (contains!3608 acc!681 k!2843) lt!314626)))

(declare-fun b!685335 () Bool)

(declare-fun e!390313 () Bool)

(assert (=> b!685335 (= e!390314 e!390313)))

(declare-fun res!450706 () Bool)

(assert (=> b!685335 (=> res!450706 e!390313)))

(assert (=> b!685335 (= res!450706 (= (h!14072 acc!681) k!2843))))

(declare-fun b!685336 () Bool)

(assert (=> b!685336 (= e!390313 (contains!3608 (t!19280 acc!681) k!2843))))

(assert (= (and d!94537 res!450705) b!685335))

(assert (= (and b!685335 (not res!450706)) b!685336))

(assert (=> d!94537 m!649573))

(declare-fun m!649583 () Bool)

(assert (=> d!94537 m!649583))

(declare-fun m!649585 () Bool)

(assert (=> b!685336 m!649585))

(assert (=> b!685014 d!94537))

(declare-fun d!94541 () Bool)

(assert (=> d!94541 (= (array_inv!14786 a!3626) (bvsge (size!19359 a!3626) #b00000000000000000000000000000000))))

(assert (=> start!61088 d!94541))

(assert (=> b!685026 d!94537))

(declare-fun b!685337 () Bool)

(declare-fun e!390318 () Bool)

(assert (=> b!685337 (= e!390318 (contains!3608 Nil!13028 (select (arr!18990 a!3626) #b00000000000000000000000000000000)))))

(declare-fun b!685338 () Bool)

(declare-fun e!390317 () Bool)

(declare-fun e!390315 () Bool)

(assert (=> b!685338 (= e!390317 e!390315)))

(declare-fun res!450709 () Bool)

(assert (=> b!685338 (=> (not res!450709) (not e!390315))))

(assert (=> b!685338 (= res!450709 (not e!390318))))

(declare-fun res!450707 () Bool)

(assert (=> b!685338 (=> (not res!450707) (not e!390318))))

(assert (=> b!685338 (= res!450707 (validKeyInArray!0 (select (arr!18990 a!3626) #b00000000000000000000000000000000)))))

(declare-fun bm!34062 () Bool)

(declare-fun call!34065 () Bool)

(declare-fun c!77682 () Bool)

(assert (=> bm!34062 (= call!34065 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!77682 (Cons!13027 (select (arr!18990 a!3626) #b00000000000000000000000000000000) Nil!13028) Nil!13028)))))

(declare-fun b!685339 () Bool)

(declare-fun e!390316 () Bool)

(assert (=> b!685339 (= e!390316 call!34065)))

(declare-fun b!685340 () Bool)

(assert (=> b!685340 (= e!390316 call!34065)))

(declare-fun d!94543 () Bool)

(declare-fun res!450708 () Bool)

(assert (=> d!94543 (=> res!450708 e!390317)))

(assert (=> d!94543 (= res!450708 (bvsge #b00000000000000000000000000000000 (size!19359 a!3626)))))

(assert (=> d!94543 (= (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13028) e!390317)))

(declare-fun b!685341 () Bool)

(assert (=> b!685341 (= e!390315 e!390316)))

(assert (=> b!685341 (= c!77682 (validKeyInArray!0 (select (arr!18990 a!3626) #b00000000000000000000000000000000)))))

(assert (= (and d!94543 (not res!450708)) b!685338))

(assert (= (and b!685338 res!450707) b!685337))

(assert (= (and b!685338 res!450709) b!685341))

(assert (= (and b!685341 c!77682) b!685339))

(assert (= (and b!685341 (not c!77682)) b!685340))

(assert (= (or b!685339 b!685340) bm!34062))

(assert (=> b!685337 m!649455))

(assert (=> b!685337 m!649455))

(declare-fun m!649587 () Bool)

(assert (=> b!685337 m!649587))

(assert (=> b!685338 m!649455))

(assert (=> b!685338 m!649455))

(declare-fun m!649589 () Bool)

(assert (=> b!685338 m!649589))

(assert (=> bm!34062 m!649455))

(declare-fun m!649591 () Bool)

(assert (=> bm!34062 m!649591))

(assert (=> b!685341 m!649455))

(assert (=> b!685341 m!649455))

(assert (=> b!685341 m!649589))

(assert (=> b!685027 d!94543))

(declare-fun d!94545 () Bool)

(declare-fun res!450710 () Bool)

(declare-fun e!390319 () Bool)

(assert (=> d!94545 (=> res!450710 e!390319)))

(assert (=> d!94545 (= res!450710 (is-Nil!13028 acc!681))))

(assert (=> d!94545 (= (noDuplicate!855 acc!681) e!390319)))

(declare-fun b!685342 () Bool)

(declare-fun e!390320 () Bool)

(assert (=> b!685342 (= e!390319 e!390320)))

(declare-fun res!450711 () Bool)

(assert (=> b!685342 (=> (not res!450711) (not e!390320))))

(assert (=> b!685342 (= res!450711 (not (contains!3608 (t!19280 acc!681) (h!14072 acc!681))))))

(declare-fun b!685343 () Bool)

(assert (=> b!685343 (= e!390320 (noDuplicate!855 (t!19280 acc!681)))))

(assert (= (and d!94545 (not res!450710)) b!685342))

(assert (= (and b!685342 res!450711) b!685343))

(declare-fun m!649593 () Bool)

(assert (=> b!685342 m!649593))

(declare-fun m!649595 () Bool)

(assert (=> b!685343 m!649595))

(assert (=> b!685016 d!94545))

(assert (=> b!685017 d!94537))

(declare-fun e!390324 () Bool)

(declare-fun b!685344 () Bool)

(assert (=> b!685344 (= e!390324 (contains!3608 acc!681 (select (arr!18990 a!3626) from!3004)))))

(declare-fun b!685345 () Bool)

(declare-fun e!390323 () Bool)

(declare-fun e!390321 () Bool)

(assert (=> b!685345 (= e!390323 e!390321)))

(declare-fun res!450714 () Bool)

(assert (=> b!685345 (=> (not res!450714) (not e!390321))))

(assert (=> b!685345 (= res!450714 (not e!390324))))

(declare-fun res!450712 () Bool)

(assert (=> b!685345 (=> (not res!450712) (not e!390324))))

(assert (=> b!685345 (= res!450712 (validKeyInArray!0 (select (arr!18990 a!3626) from!3004)))))

(declare-fun call!34066 () Bool)

(declare-fun c!77683 () Bool)

(declare-fun bm!34063 () Bool)

(assert (=> bm!34063 (= call!34066 (arrayNoDuplicates!0 a!3626 (bvadd from!3004 #b00000000000000000000000000000001) (ite c!77683 (Cons!13027 (select (arr!18990 a!3626) from!3004) acc!681) acc!681)))))

(declare-fun b!685346 () Bool)

(declare-fun e!390322 () Bool)

(assert (=> b!685346 (= e!390322 call!34066)))

(declare-fun b!685347 () Bool)

(assert (=> b!685347 (= e!390322 call!34066)))

(declare-fun d!94547 () Bool)

(declare-fun res!450713 () Bool)

(assert (=> d!94547 (=> res!450713 e!390323)))

(assert (=> d!94547 (= res!450713 (bvsge from!3004 (size!19359 a!3626)))))

(assert (=> d!94547 (= (arrayNoDuplicates!0 a!3626 from!3004 acc!681) e!390323)))

(declare-fun b!685348 () Bool)

(assert (=> b!685348 (= e!390321 e!390322)))

(assert (=> b!685348 (= c!77683 (validKeyInArray!0 (select (arr!18990 a!3626) from!3004)))))

(assert (= (and d!94547 (not res!450713)) b!685345))

(assert (= (and b!685345 res!450712) b!685344))

(assert (= (and b!685345 res!450714) b!685348))

(assert (= (and b!685348 c!77683) b!685346))

(assert (= (and b!685348 (not c!77683)) b!685347))

(assert (= (or b!685346 b!685347) bm!34063))

(assert (=> b!685344 m!649281))

(assert (=> b!685344 m!649281))

(declare-fun m!649599 () Bool)

(assert (=> b!685344 m!649599))

(assert (=> b!685345 m!649281))

(assert (=> b!685345 m!649281))

(assert (=> b!685345 m!649307))

(assert (=> bm!34063 m!649281))

(declare-fun m!649601 () Bool)

(assert (=> bm!34063 m!649601))

(assert (=> b!685348 m!649281))

(assert (=> b!685348 m!649281))

(assert (=> b!685348 m!649307))

(assert (=> b!685007 d!94547))

(declare-fun d!94551 () Bool)

(declare-fun lt!314630 () Bool)

(assert (=> d!94551 (= lt!314630 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!288 acc!681)))))

(declare-fun e!390334 () Bool)

(assert (=> d!94551 (= lt!314630 e!390334)))

(declare-fun res!450721 () Bool)

(assert (=> d!94551 (=> (not res!450721) (not e!390334))))

(assert (=> d!94551 (= res!450721 (is-Cons!13027 acc!681))))

(assert (=> d!94551 (= (contains!3608 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000) lt!314630)))

(declare-fun b!685359 () Bool)

(declare-fun e!390333 () Bool)

(assert (=> b!685359 (= e!390334 e!390333)))

(declare-fun res!450722 () Bool)

(assert (=> b!685359 (=> res!450722 e!390333)))

(assert (=> b!685359 (= res!450722 (= (h!14072 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!685360 () Bool)

(assert (=> b!685360 (= e!390333 (contains!3608 (t!19280 acc!681) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!94551 res!450721) b!685359))

(assert (= (and b!685359 (not res!450722)) b!685360))

(assert (=> d!94551 m!649573))

(declare-fun m!649603 () Bool)

(assert (=> d!94551 m!649603))

(declare-fun m!649605 () Bool)

(assert (=> b!685360 m!649605))

(assert (=> b!685018 d!94551))

(declare-fun d!94553 () Bool)

(declare-fun lt!314631 () Bool)

(assert (=> d!94553 (= lt!314631 (set.member k!2843 (content!288 lt!314518)))))

(declare-fun e!390336 () Bool)

(assert (=> d!94553 (= lt!314631 e!390336)))

(declare-fun res!450723 () Bool)

(assert (=> d!94553 (=> (not res!450723) (not e!390336))))

(assert (=> d!94553 (= res!450723 (is-Cons!13027 lt!314518))))

(assert (=> d!94553 (= (contains!3608 lt!314518 k!2843) lt!314631)))

(declare-fun b!685361 () Bool)

(declare-fun e!390335 () Bool)

(assert (=> b!685361 (= e!390336 e!390335)))

(declare-fun res!450724 () Bool)

(assert (=> b!685361 (=> res!450724 e!390335)))

(assert (=> b!685361 (= res!450724 (= (h!14072 lt!314518) k!2843))))

(declare-fun b!685362 () Bool)

(assert (=> b!685362 (= e!390335 (contains!3608 (t!19280 lt!314518) k!2843))))

(assert (= (and d!94553 res!450723) b!685361))

(assert (= (and b!685361 (not res!450724)) b!685362))

(assert (=> d!94553 m!649497))

(declare-fun m!649607 () Bool)

(assert (=> d!94553 m!649607))

(declare-fun m!649609 () Bool)

(assert (=> b!685362 m!649609))

(assert (=> b!685019 d!94553))

(push 1)

