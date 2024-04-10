; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62654 () Bool)

(assert start!62654)

(declare-fun b!707444 () Bool)

(declare-fun res!471262 () Bool)

(declare-fun e!398101 () Bool)

(assert (=> b!707444 (=> (not res!471262) (not e!398101))))

(declare-datatypes ((array!40333 0))(
  ( (array!40334 (arr!19323 (Array (_ BitVec 32) (_ BitVec 64))) (size!19708 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40333)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707444 (= res!471262 (validKeyInArray!0 (select (arr!19323 a!3591) from!2969)))))

(declare-fun b!707445 () Bool)

(declare-fun res!471257 () Bool)

(assert (=> b!707445 (=> (not res!471257) (not e!398101))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40333 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707445 (= res!471257 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707446 () Bool)

(declare-fun res!471258 () Bool)

(assert (=> b!707446 (=> (not res!471258) (not e!398101))))

(declare-datatypes ((List!13364 0))(
  ( (Nil!13361) (Cons!13360 (h!14405 (_ BitVec 64)) (t!19646 List!13364)) )
))
(declare-fun acc!652 () List!13364)

(declare-fun contains!3941 (List!13364 (_ BitVec 64)) Bool)

(assert (=> b!707446 (= res!471258 (not (contains!3941 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707447 () Bool)

(declare-fun res!471270 () Bool)

(assert (=> b!707447 (=> (not res!471270) (not e!398101))))

(assert (=> b!707447 (= res!471270 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!707448 () Bool)

(declare-fun res!471265 () Bool)

(assert (=> b!707448 (=> (not res!471265) (not e!398101))))

(declare-fun newAcc!49 () List!13364)

(declare-fun noDuplicate!1188 (List!13364) Bool)

(assert (=> b!707448 (= res!471265 (noDuplicate!1188 newAcc!49))))

(declare-fun b!707449 () Bool)

(declare-fun res!471268 () Bool)

(assert (=> b!707449 (=> (not res!471268) (not e!398101))))

(declare-fun subseq!386 (List!13364 List!13364) Bool)

(assert (=> b!707449 (= res!471268 (subseq!386 acc!652 newAcc!49))))

(declare-fun b!707450 () Bool)

(declare-fun res!471259 () Bool)

(assert (=> b!707450 (=> (not res!471259) (not e!398101))))

(declare-fun arrayNoDuplicates!0 (array!40333 (_ BitVec 32) List!13364) Bool)

(assert (=> b!707450 (= res!471259 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707451 () Bool)

(declare-fun res!471264 () Bool)

(assert (=> b!707451 (=> (not res!471264) (not e!398101))))

(assert (=> b!707451 (= res!471264 (not (contains!3941 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!471255 () Bool)

(assert (=> start!62654 (=> (not res!471255) (not e!398101))))

(assert (=> start!62654 (= res!471255 (and (bvslt (size!19708 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19708 a!3591))))))

(assert (=> start!62654 e!398101))

(assert (=> start!62654 true))

(declare-fun array_inv!15119 (array!40333) Bool)

(assert (=> start!62654 (array_inv!15119 a!3591)))

(declare-fun b!707452 () Bool)

(declare-fun res!471269 () Bool)

(assert (=> b!707452 (=> (not res!471269) (not e!398101))))

(assert (=> b!707452 (= res!471269 (not (contains!3941 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707453 () Bool)

(declare-fun res!471266 () Bool)

(assert (=> b!707453 (=> (not res!471266) (not e!398101))))

(assert (=> b!707453 (= res!471266 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19708 a!3591)))))

(declare-fun b!707454 () Bool)

(declare-fun $colon$colon!497 (List!13364 (_ BitVec 64)) List!13364)

(assert (=> b!707454 (= e!398101 (not (noDuplicate!1188 ($colon$colon!497 acc!652 (select (arr!19323 a!3591) from!2969)))))))

(declare-fun b!707455 () Bool)

(declare-fun res!471261 () Bool)

(assert (=> b!707455 (=> (not res!471261) (not e!398101))))

(assert (=> b!707455 (= res!471261 (noDuplicate!1188 acc!652))))

(declare-fun b!707456 () Bool)

(declare-fun res!471263 () Bool)

(assert (=> b!707456 (=> (not res!471263) (not e!398101))))

(assert (=> b!707456 (= res!471263 (contains!3941 newAcc!49 k!2824))))

(declare-fun b!707457 () Bool)

(declare-fun res!471260 () Bool)

(assert (=> b!707457 (=> (not res!471260) (not e!398101))))

(assert (=> b!707457 (= res!471260 (validKeyInArray!0 k!2824))))

(declare-fun b!707458 () Bool)

(declare-fun res!471256 () Bool)

(assert (=> b!707458 (=> (not res!471256) (not e!398101))))

(declare-fun -!351 (List!13364 (_ BitVec 64)) List!13364)

(assert (=> b!707458 (= res!471256 (= (-!351 newAcc!49 k!2824) acc!652))))

(declare-fun b!707459 () Bool)

(declare-fun res!471254 () Bool)

(assert (=> b!707459 (=> (not res!471254) (not e!398101))))

(assert (=> b!707459 (= res!471254 (not (contains!3941 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707460 () Bool)

(declare-fun res!471267 () Bool)

(assert (=> b!707460 (=> (not res!471267) (not e!398101))))

(assert (=> b!707460 (= res!471267 (not (contains!3941 acc!652 k!2824)))))

(assert (= (and start!62654 res!471255) b!707455))

(assert (= (and b!707455 res!471261) b!707448))

(assert (= (and b!707448 res!471265) b!707446))

(assert (= (and b!707446 res!471258) b!707451))

(assert (= (and b!707451 res!471264) b!707445))

(assert (= (and b!707445 res!471257) b!707460))

(assert (= (and b!707460 res!471267) b!707457))

(assert (= (and b!707457 res!471260) b!707450))

(assert (= (and b!707450 res!471259) b!707449))

(assert (= (and b!707449 res!471268) b!707456))

(assert (= (and b!707456 res!471263) b!707458))

(assert (= (and b!707458 res!471256) b!707452))

(assert (= (and b!707452 res!471269) b!707459))

(assert (= (and b!707459 res!471254) b!707453))

(assert (= (and b!707453 res!471266) b!707444))

(assert (= (and b!707444 res!471262) b!707447))

(assert (= (and b!707447 res!471270) b!707454))

(declare-fun m!665011 () Bool)

(assert (=> b!707455 m!665011))

(declare-fun m!665013 () Bool)

(assert (=> b!707456 m!665013))

(declare-fun m!665015 () Bool)

(assert (=> b!707446 m!665015))

(declare-fun m!665017 () Bool)

(assert (=> b!707450 m!665017))

(declare-fun m!665019 () Bool)

(assert (=> b!707451 m!665019))

(declare-fun m!665021 () Bool)

(assert (=> b!707444 m!665021))

(assert (=> b!707444 m!665021))

(declare-fun m!665023 () Bool)

(assert (=> b!707444 m!665023))

(declare-fun m!665025 () Bool)

(assert (=> start!62654 m!665025))

(declare-fun m!665027 () Bool)

(assert (=> b!707459 m!665027))

(declare-fun m!665029 () Bool)

(assert (=> b!707457 m!665029))

(assert (=> b!707454 m!665021))

(assert (=> b!707454 m!665021))

(declare-fun m!665031 () Bool)

(assert (=> b!707454 m!665031))

(assert (=> b!707454 m!665031))

(declare-fun m!665033 () Bool)

(assert (=> b!707454 m!665033))

(declare-fun m!665035 () Bool)

(assert (=> b!707445 m!665035))

(declare-fun m!665037 () Bool)

(assert (=> b!707448 m!665037))

(declare-fun m!665039 () Bool)

(assert (=> b!707458 m!665039))

(declare-fun m!665041 () Bool)

(assert (=> b!707449 m!665041))

(declare-fun m!665043 () Bool)

(assert (=> b!707452 m!665043))

(declare-fun m!665045 () Bool)

(assert (=> b!707460 m!665045))

(push 1)

(assert (not b!707451))

(assert (not b!707456))

(assert (not b!707445))

(assert (not b!707444))

(assert (not b!707450))

(assert (not b!707449))

(assert (not b!707459))

(assert (not b!707446))

(assert (not b!707448))

(assert (not b!707458))

(assert (not start!62654))

(assert (not b!707454))

(assert (not b!707460))

(assert (not b!707452))

(assert (not b!707455))

(assert (not b!707457))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!707605 () Bool)

(declare-fun e!398155 () Bool)

(declare-fun e!398154 () Bool)

(assert (=> b!707605 (= e!398155 e!398154)))

(declare-fun res!471413 () Bool)

(assert (=> b!707605 (=> (not res!471413) (not e!398154))))

(declare-fun e!398156 () Bool)

(assert (=> b!707605 (= res!471413 (not e!398156))))

(declare-fun res!471411 () Bool)

(assert (=> b!707605 (=> (not res!471411) (not e!398156))))

(assert (=> b!707605 (= res!471411 (validKeyInArray!0 (select (arr!19323 a!3591) from!2969)))))

(declare-fun b!707607 () Bool)

(assert (=> b!707607 (= e!398156 (contains!3941 acc!652 (select (arr!19323 a!3591) from!2969)))))

(declare-fun b!707608 () Bool)

(declare-fun e!398157 () Bool)

(declare-fun call!34361 () Bool)

(assert (=> b!707608 (= e!398157 call!34361)))

(declare-fun c!78464 () Bool)

(declare-fun bm!34358 () Bool)

(assert (=> bm!34358 (= call!34361 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78464 (Cons!13360 (select (arr!19323 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!707609 () Bool)

(assert (=> b!707609 (= e!398154 e!398157)))

(assert (=> b!707609 (= c!78464 (validKeyInArray!0 (select (arr!19323 a!3591) from!2969)))))

(declare-fun b!707606 () Bool)

(assert (=> b!707606 (= e!398157 call!34361)))

(declare-fun d!96509 () Bool)

(declare-fun res!471412 () Bool)

(assert (=> d!96509 (=> res!471412 e!398155)))

(assert (=> d!96509 (= res!471412 (bvsge from!2969 (size!19708 a!3591)))))

(assert (=> d!96509 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!398155)))

(assert (= (and d!96509 (not res!471412)) b!707605))

(assert (= (and b!707605 res!471411) b!707607))

(assert (= (and b!707605 res!471413) b!707609))

(assert (= (and b!707609 c!78464) b!707608))

(assert (= (and b!707609 (not c!78464)) b!707606))

(assert (= (or b!707608 b!707606) bm!34358))

(assert (=> b!707605 m!665021))

(assert (=> b!707605 m!665021))

(assert (=> b!707605 m!665023))

(assert (=> b!707607 m!665021))

(assert (=> b!707607 m!665021))

(declare-fun m!665139 () Bool)

(assert (=> b!707607 m!665139))

(assert (=> bm!34358 m!665021))

(declare-fun m!665141 () Bool)

(assert (=> bm!34358 m!665141))

(assert (=> b!707609 m!665021))

(assert (=> b!707609 m!665021))

(assert (=> b!707609 m!665023))

(assert (=> b!707450 d!96509))

(declare-fun d!96523 () Bool)

(declare-fun lt!318009 () Bool)

(declare-fun content!332 (List!13364) (Set (_ BitVec 64)))

(assert (=> d!96523 (= lt!318009 (set.member k!2824 (content!332 acc!652)))))

(declare-fun e!398171 () Bool)

(assert (=> d!96523 (= lt!318009 e!398171)))

(declare-fun res!471424 () Bool)

(assert (=> d!96523 (=> (not res!471424) (not e!398171))))

(assert (=> d!96523 (= res!471424 (is-Cons!13360 acc!652))))

(assert (=> d!96523 (= (contains!3941 acc!652 k!2824) lt!318009)))

(declare-fun b!707624 () Bool)

(declare-fun e!398170 () Bool)

(assert (=> b!707624 (= e!398171 e!398170)))

(declare-fun res!471425 () Bool)

(assert (=> b!707624 (=> res!471425 e!398170)))

(assert (=> b!707624 (= res!471425 (= (h!14405 acc!652) k!2824))))

(declare-fun b!707625 () Bool)

(assert (=> b!707625 (= e!398170 (contains!3941 (t!19646 acc!652) k!2824))))

(assert (= (and d!96523 res!471424) b!707624))

(assert (= (and b!707624 (not res!471425)) b!707625))

(declare-fun m!665143 () Bool)

(assert (=> d!96523 m!665143))

(declare-fun m!665145 () Bool)

(assert (=> d!96523 m!665145))

(declare-fun m!665147 () Bool)

(assert (=> b!707625 m!665147))

(assert (=> b!707460 d!96523))

(declare-fun b!707656 () Bool)

(declare-fun e!398198 () Bool)

(assert (=> b!707656 (= e!398198 (subseq!386 acc!652 (t!19646 newAcc!49)))))

(declare-fun b!707655 () Bool)

(declare-fun e!398200 () Bool)

(assert (=> b!707655 (= e!398200 (subseq!386 (t!19646 acc!652) (t!19646 newAcc!49)))))

(declare-fun b!707653 () Bool)

(declare-fun e!398199 () Bool)

(declare-fun e!398201 () Bool)

(assert (=> b!707653 (= e!398199 e!398201)))

(declare-fun res!471453 () Bool)

(assert (=> b!707653 (=> (not res!471453) (not e!398201))))

(assert (=> b!707653 (= res!471453 (is-Cons!13360 newAcc!49))))

(declare-fun d!96527 () Bool)

(declare-fun res!471454 () Bool)

(assert (=> d!96527 (=> res!471454 e!398199)))

(assert (=> d!96527 (= res!471454 (is-Nil!13361 acc!652))))

(assert (=> d!96527 (= (subseq!386 acc!652 newAcc!49) e!398199)))

(declare-fun b!707654 () Bool)

(assert (=> b!707654 (= e!398201 e!398198)))

(declare-fun res!471452 () Bool)

(assert (=> b!707654 (=> res!471452 e!398198)))

(assert (=> b!707654 (= res!471452 e!398200)))

(declare-fun res!471451 () Bool)

(assert (=> b!707654 (=> (not res!471451) (not e!398200))))

(assert (=> b!707654 (= res!471451 (= (h!14405 acc!652) (h!14405 newAcc!49)))))

(assert (= (and d!96527 (not res!471454)) b!707653))

(assert (= (and b!707653 res!471453) b!707654))

(assert (= (and b!707654 res!471451) b!707655))

(assert (= (and b!707654 (not res!471452)) b!707656))

(declare-fun m!665159 () Bool)

(assert (=> b!707656 m!665159))

(declare-fun m!665161 () Bool)

(assert (=> b!707655 m!665161))

(assert (=> b!707449 d!96527))

(declare-fun d!96533 () Bool)

(declare-fun lt!318012 () Bool)

(assert (=> d!96533 (= lt!318012 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!332 newAcc!49)))))

(declare-fun e!398205 () Bool)

(assert (=> d!96533 (= lt!318012 e!398205)))

(declare-fun res!471457 () Bool)

(assert (=> d!96533 (=> (not res!471457) (not e!398205))))

(assert (=> d!96533 (= res!471457 (is-Cons!13360 newAcc!49))))

(assert (=> d!96533 (= (contains!3941 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318012)))

(declare-fun b!707659 () Bool)

(declare-fun e!398204 () Bool)

(assert (=> b!707659 (= e!398205 e!398204)))

(declare-fun res!471458 () Bool)

(assert (=> b!707659 (=> res!471458 e!398204)))

(assert (=> b!707659 (= res!471458 (= (h!14405 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707660 () Bool)

(assert (=> b!707660 (= e!398204 (contains!3941 (t!19646 newAcc!49) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96533 res!471457) b!707659))

(assert (= (and b!707659 (not res!471458)) b!707660))

(declare-fun m!665167 () Bool)

(assert (=> d!96533 m!665167))

(declare-fun m!665169 () Bool)

(assert (=> d!96533 m!665169))

(declare-fun m!665171 () Bool)

(assert (=> b!707660 m!665171))

(assert (=> b!707459 d!96533))

(declare-fun d!96537 () Bool)

(declare-fun lt!318014 () Bool)

(assert (=> d!96537 (= lt!318014 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!332 newAcc!49)))))

(declare-fun e!398209 () Bool)

(assert (=> d!96537 (= lt!318014 e!398209)))

(declare-fun res!471461 () Bool)

(assert (=> d!96537 (=> (not res!471461) (not e!398209))))

(assert (=> d!96537 (= res!471461 (is-Cons!13360 newAcc!49))))

(assert (=> d!96537 (= (contains!3941 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318014)))

(declare-fun b!707663 () Bool)

(declare-fun e!398208 () Bool)

(assert (=> b!707663 (= e!398209 e!398208)))

(declare-fun res!471462 () Bool)

(assert (=> b!707663 (=> res!471462 e!398208)))

(assert (=> b!707663 (= res!471462 (= (h!14405 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707664 () Bool)

(assert (=> b!707664 (= e!398208 (contains!3941 (t!19646 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96537 res!471461) b!707663))

(assert (= (and b!707663 (not res!471462)) b!707664))

(assert (=> d!96537 m!665167))

(declare-fun m!665177 () Bool)

(assert (=> d!96537 m!665177))

(declare-fun m!665179 () Bool)

(assert (=> b!707664 m!665179))

(assert (=> b!707452 d!96537))

(declare-fun d!96539 () Bool)

(declare-fun lt!318015 () Bool)

(assert (=> d!96539 (= lt!318015 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!332 acc!652)))))

(declare-fun e!398211 () Bool)

(assert (=> d!96539 (= lt!318015 e!398211)))

(declare-fun res!471463 () Bool)

(assert (=> d!96539 (=> (not res!471463) (not e!398211))))

(assert (=> d!96539 (= res!471463 (is-Cons!13360 acc!652))))

(assert (=> d!96539 (= (contains!3941 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318015)))

(declare-fun b!707665 () Bool)

(declare-fun e!398210 () Bool)

(assert (=> b!707665 (= e!398211 e!398210)))

(declare-fun res!471464 () Bool)

(assert (=> b!707665 (=> res!471464 e!398210)))

(assert (=> b!707665 (= res!471464 (= (h!14405 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707666 () Bool)

(assert (=> b!707666 (= e!398210 (contains!3941 (t!19646 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96539 res!471463) b!707665))

(assert (= (and b!707665 (not res!471464)) b!707666))

(assert (=> d!96539 m!665143))

(declare-fun m!665185 () Bool)

(assert (=> d!96539 m!665185))

(declare-fun m!665187 () Bool)

(assert (=> b!707666 m!665187))

(assert (=> b!707451 d!96539))

(declare-fun d!96545 () Bool)

(declare-fun lt!318017 () Bool)

(assert (=> d!96545 (= lt!318017 (set.member k!2824 (content!332 newAcc!49)))))

(declare-fun e!398215 () Bool)

(assert (=> d!96545 (= lt!318017 e!398215)))

(declare-fun res!471467 () Bool)

(assert (=> d!96545 (=> (not res!471467) (not e!398215))))

(assert (=> d!96545 (= res!471467 (is-Cons!13360 newAcc!49))))

(assert (=> d!96545 (= (contains!3941 newAcc!49 k!2824) lt!318017)))

(declare-fun b!707669 () Bool)

(declare-fun e!398214 () Bool)

(assert (=> b!707669 (= e!398215 e!398214)))

(declare-fun res!471468 () Bool)

(assert (=> b!707669 (=> res!471468 e!398214)))

(assert (=> b!707669 (= res!471468 (= (h!14405 newAcc!49) k!2824))))

(declare-fun b!707670 () Bool)

(assert (=> b!707670 (= e!398214 (contains!3941 (t!19646 newAcc!49) k!2824))))

(assert (= (and d!96545 res!471467) b!707669))

(assert (= (and b!707669 (not res!471468)) b!707670))

(assert (=> d!96545 m!665167))

(declare-fun m!665191 () Bool)

(assert (=> d!96545 m!665191))

(declare-fun m!665195 () Bool)

(assert (=> b!707670 m!665195))

(assert (=> b!707456 d!96545))

(declare-fun d!96547 () Bool)

(declare-fun res!471481 () Bool)

(declare-fun e!398228 () Bool)

(assert (=> d!96547 (=> res!471481 e!398228)))

(assert (=> d!96547 (= res!471481 (= (select (arr!19323 a!3591) from!2969) k!2824))))

(assert (=> d!96547 (= (arrayContainsKey!0 a!3591 k!2824 from!2969) e!398228)))

(declare-fun b!707683 () Bool)

(declare-fun e!398229 () Bool)

(assert (=> b!707683 (= e!398228 e!398229)))

(declare-fun res!471482 () Bool)

(assert (=> b!707683 (=> (not res!471482) (not e!398229))))

(assert (=> b!707683 (= res!471482 (bvslt (bvadd from!2969 #b00000000000000000000000000000001) (size!19708 a!3591)))))

(declare-fun b!707684 () Bool)

(assert (=> b!707684 (= e!398229 (arrayContainsKey!0 a!3591 k!2824 (bvadd from!2969 #b00000000000000000000000000000001)))))

(assert (= (and d!96547 (not res!471481)) b!707683))

(assert (= (and b!707683 res!471482) b!707684))

(assert (=> d!96547 m!665021))

(declare-fun m!665197 () Bool)

(assert (=> b!707684 m!665197))

(assert (=> b!707445 d!96547))

(declare-fun d!96551 () Bool)

(declare-fun res!471493 () Bool)

(declare-fun e!398240 () Bool)

(assert (=> d!96551 (=> res!471493 e!398240)))

(assert (=> d!96551 (= res!471493 (is-Nil!13361 acc!652))))

(assert (=> d!96551 (= (noDuplicate!1188 acc!652) e!398240)))

(declare-fun b!707695 () Bool)

(declare-fun e!398241 () Bool)

(assert (=> b!707695 (= e!398240 e!398241)))

(declare-fun res!471494 () Bool)

(assert (=> b!707695 (=> (not res!471494) (not e!398241))))

(assert (=> b!707695 (= res!471494 (not (contains!3941 (t!19646 acc!652) (h!14405 acc!652))))))

(declare-fun b!707696 () Bool)

(assert (=> b!707696 (= e!398241 (noDuplicate!1188 (t!19646 acc!652)))))

(assert (= (and d!96551 (not res!471493)) b!707695))

(assert (= (and b!707695 res!471494) b!707696))

(declare-fun m!665209 () Bool)

(assert (=> b!707695 m!665209))

(declare-fun m!665213 () Bool)

(assert (=> b!707696 m!665213))

(assert (=> b!707455 d!96551))

(declare-fun d!96557 () Bool)

(assert (=> d!96557 (= (validKeyInArray!0 (select (arr!19323 a!3591) from!2969)) (and (not (= (select (arr!19323 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19323 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707444 d!96557))

(declare-fun d!96565 () Bool)

(declare-fun res!471503 () Bool)

(declare-fun e!398250 () Bool)

(assert (=> d!96565 (=> res!471503 e!398250)))

(assert (=> d!96565 (= res!471503 (is-Nil!13361 ($colon$colon!497 acc!652 (select (arr!19323 a!3591) from!2969))))))

(assert (=> d!96565 (= (noDuplicate!1188 ($colon$colon!497 acc!652 (select (arr!19323 a!3591) from!2969))) e!398250)))

(declare-fun b!707705 () Bool)

(declare-fun e!398251 () Bool)

(assert (=> b!707705 (= e!398250 e!398251)))

(declare-fun res!471504 () Bool)

(assert (=> b!707705 (=> (not res!471504) (not e!398251))))

(assert (=> b!707705 (= res!471504 (not (contains!3941 (t!19646 ($colon$colon!497 acc!652 (select (arr!19323 a!3591) from!2969))) (h!14405 ($colon$colon!497 acc!652 (select (arr!19323 a!3591) from!2969))))))))

(declare-fun b!707706 () Bool)

(assert (=> b!707706 (= e!398251 (noDuplicate!1188 (t!19646 ($colon$colon!497 acc!652 (select (arr!19323 a!3591) from!2969)))))))

(assert (= (and d!96565 (not res!471503)) b!707705))

(assert (= (and b!707705 res!471504) b!707706))

(declare-fun m!665221 () Bool)

(assert (=> b!707705 m!665221))

(declare-fun m!665225 () Bool)

(assert (=> b!707706 m!665225))

(assert (=> b!707454 d!96565))

(declare-fun d!96567 () Bool)

(assert (=> d!96567 (= ($colon$colon!497 acc!652 (select (arr!19323 a!3591) from!2969)) (Cons!13360 (select (arr!19323 a!3591) from!2969) acc!652))))

(assert (=> b!707454 d!96567))

(declare-fun d!96571 () Bool)

(declare-fun res!471507 () Bool)

(declare-fun e!398254 () Bool)

(assert (=> d!96571 (=> res!471507 e!398254)))

(assert (=> d!96571 (= res!471507 (is-Nil!13361 newAcc!49))))

(assert (=> d!96571 (= (noDuplicate!1188 newAcc!49) e!398254)))

(declare-fun b!707709 () Bool)

(declare-fun e!398255 () Bool)

(assert (=> b!707709 (= e!398254 e!398255)))

(declare-fun res!471508 () Bool)

(assert (=> b!707709 (=> (not res!471508) (not e!398255))))

(assert (=> b!707709 (= res!471508 (not (contains!3941 (t!19646 newAcc!49) (h!14405 newAcc!49))))))

(declare-fun b!707710 () Bool)

(assert (=> b!707710 (= e!398255 (noDuplicate!1188 (t!19646 newAcc!49)))))

(assert (= (and d!96571 (not res!471507)) b!707709))

(assert (= (and b!707709 res!471508) b!707710))

(declare-fun m!665233 () Bool)

(assert (=> b!707709 m!665233))

(declare-fun m!665235 () Bool)

(assert (=> b!707710 m!665235))

(assert (=> b!707448 d!96571))

(declare-fun d!96575 () Bool)

(assert (=> d!96575 (= (array_inv!15119 a!3591) (bvsge (size!19708 a!3591) #b00000000000000000000000000000000))))

(assert (=> start!62654 d!96575))

(declare-fun b!707737 () Bool)

(declare-fun e!398278 () List!13364)

(declare-fun call!34369 () List!13364)

(assert (=> b!707737 (= e!398278 call!34369)))

(declare-fun lt!318030 () List!13364)

(declare-fun e!398276 () Bool)

(declare-fun b!707738 () Bool)

(assert (=> b!707738 (= e!398276 (= (content!332 lt!318030) (set.minus (content!332 newAcc!49) (set.insert k!2824 (as set.empty (Set (_ BitVec 64)))))))))

(declare-fun b!707739 () Bool)

(declare-fun e!398277 () List!13364)

(assert (=> b!707739 (= e!398277 Nil!13361)))

(declare-fun d!96579 () Bool)

(assert (=> d!96579 e!398276))

(declare-fun res!471519 () Bool)

(assert (=> d!96579 (=> (not res!471519) (not e!398276))))

(declare-fun size!19711 (List!13364) Int)

(assert (=> d!96579 (= res!471519 (<= (size!19711 lt!318030) (size!19711 newAcc!49)))))

(assert (=> d!96579 (= lt!318030 e!398277)))

(declare-fun c!78476 () Bool)

(assert (=> d!96579 (= c!78476 (is-Cons!13360 newAcc!49))))

(assert (=> d!96579 (= (-!351 newAcc!49 k!2824) lt!318030)))

(declare-fun b!707740 () Bool)

(assert (=> b!707740 (= e!398277 e!398278)))

(declare-fun c!78477 () Bool)

(assert (=> b!707740 (= c!78477 (= k!2824 (h!14405 newAcc!49)))))

(declare-fun b!707741 () Bool)

(assert (=> b!707741 (= e!398278 (Cons!13360 (h!14405 newAcc!49) call!34369))))

(declare-fun bm!34366 () Bool)

(assert (=> bm!34366 (= call!34369 (-!351 (t!19646 newAcc!49) k!2824))))

(assert (= (and d!96579 c!78476) b!707740))

(assert (= (and d!96579 (not c!78476)) b!707739))

(assert (= (and b!707740 c!78477) b!707737))

(assert (= (and b!707740 (not c!78477)) b!707741))

(assert (= (or b!707737 b!707741) bm!34366))

(assert (= (and d!96579 res!471519) b!707738))

(declare-fun m!665249 () Bool)

(assert (=> b!707738 m!665249))

(assert (=> b!707738 m!665167))

(declare-fun m!665251 () Bool)

(assert (=> b!707738 m!665251))

(declare-fun m!665253 () Bool)

(assert (=> d!96579 m!665253))

(declare-fun m!665255 () Bool)

(assert (=> d!96579 m!665255))

(declare-fun m!665257 () Bool)

(assert (=> bm!34366 m!665257))

(assert (=> b!707458 d!96579))

(declare-fun d!96587 () Bool)

(assert (=> d!96587 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!707457 d!96587))

(declare-fun d!96589 () Bool)

(declare-fun lt!318031 () Bool)

(assert (=> d!96589 (= lt!318031 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!332 acc!652)))))

(declare-fun e!398286 () Bool)

(assert (=> d!96589 (= lt!318031 e!398286)))

(declare-fun res!471526 () Bool)

(assert (=> d!96589 (=> (not res!471526) (not e!398286))))

(assert (=> d!96589 (= res!471526 (is-Cons!13360 acc!652))))

(assert (=> d!96589 (= (contains!3941 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318031)))

(declare-fun b!707748 () Bool)

(declare-fun e!398285 () Bool)

(assert (=> b!707748 (= e!398286 e!398285)))

(declare-fun res!471527 () Bool)

(assert (=> b!707748 (=> res!471527 e!398285)))

(assert (=> b!707748 (= res!471527 (= (h!14405 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707749 () Bool)

(assert (=> b!707749 (= e!398285 (contains!3941 (t!19646 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!96589 res!471526) b!707748))

(assert (= (and b!707748 (not res!471527)) b!707749))

(assert (=> d!96589 m!665143))

(declare-fun m!665259 () Bool)

(assert (=> d!96589 m!665259))

(declare-fun m!665261 () Bool)

(assert (=> b!707749 m!665261))

(assert (=> b!707446 d!96589))

(push 1)

