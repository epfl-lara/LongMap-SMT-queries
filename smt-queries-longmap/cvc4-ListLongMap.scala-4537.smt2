; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62972 () Bool)

(assert start!62972)

(declare-fun b!709998 () Bool)

(declare-fun res!473508 () Bool)

(declare-fun e!399455 () Bool)

(assert (=> b!709998 (=> (not res!473508) (not e!399455))))

(declare-datatypes ((List!13384 0))(
  ( (Nil!13381) (Cons!13380 (h!14425 (_ BitVec 64)) (t!19681 List!13384)) )
))
(declare-fun lt!318275 () List!13384)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3961 (List!13384 (_ BitVec 64)) Bool)

(assert (=> b!709998 (= res!473508 (not (contains!3961 lt!318275 k!2824)))))

(declare-fun b!709999 () Bool)

(declare-fun res!473511 () Bool)

(assert (=> b!709999 (=> (not res!473511) (not e!399455))))

(declare-fun noDuplicate!1208 (List!13384) Bool)

(assert (=> b!709999 (= res!473511 (noDuplicate!1208 lt!318275))))

(declare-fun b!710001 () Bool)

(declare-fun res!473503 () Bool)

(declare-fun e!399453 () Bool)

(assert (=> b!710001 (=> (not res!473503) (not e!399453))))

(declare-fun acc!652 () List!13384)

(assert (=> b!710001 (= res!473503 (not (contains!3961 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710002 () Bool)

(declare-fun res!473494 () Bool)

(assert (=> b!710002 (=> (not res!473494) (not e!399453))))

(declare-datatypes ((array!40388 0))(
  ( (array!40389 (arr!19343 (Array (_ BitVec 32) (_ BitVec 64))) (size!19739 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40388)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40388 (_ BitVec 32) List!13384) Bool)

(assert (=> b!710002 (= res!473494 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!710003 () Bool)

(declare-fun res!473512 () Bool)

(assert (=> b!710003 (=> (not res!473512) (not e!399453))))

(declare-fun newAcc!49 () List!13384)

(assert (=> b!710003 (= res!473512 (noDuplicate!1208 newAcc!49))))

(declare-fun b!710004 () Bool)

(declare-fun res!473507 () Bool)

(assert (=> b!710004 (=> (not res!473507) (not e!399453))))

(assert (=> b!710004 (= res!473507 (contains!3961 newAcc!49 k!2824))))

(declare-fun b!710005 () Bool)

(declare-fun res!473506 () Bool)

(assert (=> b!710005 (=> (not res!473506) (not e!399453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!710005 (= res!473506 (validKeyInArray!0 (select (arr!19343 a!3591) from!2969)))))

(declare-fun b!710006 () Bool)

(declare-fun res!473502 () Bool)

(assert (=> b!710006 (=> (not res!473502) (not e!399455))))

(assert (=> b!710006 (= res!473502 (not (contains!3961 lt!318275 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710007 () Bool)

(declare-fun res!473490 () Bool)

(assert (=> b!710007 (=> (not res!473490) (not e!399455))))

(declare-fun arrayContainsKey!0 (array!40388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!710007 (= res!473490 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!710008 () Bool)

(declare-fun res!473493 () Bool)

(assert (=> b!710008 (=> (not res!473493) (not e!399455))))

(declare-fun $colon$colon!517 (List!13384 (_ BitVec 64)) List!13384)

(assert (=> b!710008 (= res!473493 (noDuplicate!1208 ($colon$colon!517 newAcc!49 (select (arr!19343 a!3591) from!2969))))))

(declare-fun b!710000 () Bool)

(declare-fun res!473499 () Bool)

(assert (=> b!710000 (=> (not res!473499) (not e!399453))))

(assert (=> b!710000 (= res!473499 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun res!473498 () Bool)

(assert (=> start!62972 (=> (not res!473498) (not e!399453))))

(assert (=> start!62972 (= res!473498 (and (bvslt (size!19739 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19739 a!3591))))))

(assert (=> start!62972 e!399453))

(assert (=> start!62972 true))

(declare-fun array_inv!15139 (array!40388) Bool)

(assert (=> start!62972 (array_inv!15139 a!3591)))

(declare-fun b!710009 () Bool)

(declare-fun res!473496 () Bool)

(assert (=> b!710009 (=> (not res!473496) (not e!399453))))

(assert (=> b!710009 (= res!473496 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19739 a!3591)))))

(declare-fun b!710010 () Bool)

(declare-fun res!473501 () Bool)

(assert (=> b!710010 (=> (not res!473501) (not e!399453))))

(assert (=> b!710010 (= res!473501 (not (contains!3961 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710011 () Bool)

(assert (=> b!710011 (= e!399453 e!399455)))

(declare-fun res!473495 () Bool)

(assert (=> b!710011 (=> (not res!473495) (not e!399455))))

(assert (=> b!710011 (= res!473495 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(assert (=> b!710011 (= lt!318275 ($colon$colon!517 acc!652 (select (arr!19343 a!3591) from!2969)))))

(declare-fun b!710012 () Bool)

(declare-fun res!473491 () Bool)

(assert (=> b!710012 (=> (not res!473491) (not e!399453))))

(assert (=> b!710012 (= res!473491 (not (contains!3961 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710013 () Bool)

(declare-fun res!473505 () Bool)

(assert (=> b!710013 (=> (not res!473505) (not e!399453))))

(assert (=> b!710013 (= res!473505 (not (contains!3961 acc!652 k!2824)))))

(declare-fun b!710014 () Bool)

(declare-fun res!473497 () Bool)

(assert (=> b!710014 (=> (not res!473497) (not e!399453))))

(assert (=> b!710014 (= res!473497 (noDuplicate!1208 acc!652))))

(declare-fun b!710015 () Bool)

(declare-fun res!473510 () Bool)

(assert (=> b!710015 (=> (not res!473510) (not e!399455))))

(assert (=> b!710015 (= res!473510 (not (contains!3961 lt!318275 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710016 () Bool)

(declare-fun res!473492 () Bool)

(assert (=> b!710016 (=> (not res!473492) (not e!399453))))

(assert (=> b!710016 (= res!473492 (validKeyInArray!0 k!2824))))

(declare-fun b!710017 () Bool)

(declare-fun res!473500 () Bool)

(assert (=> b!710017 (=> (not res!473500) (not e!399453))))

(declare-fun subseq!406 (List!13384 List!13384) Bool)

(assert (=> b!710017 (= res!473500 (subseq!406 acc!652 newAcc!49))))

(declare-fun b!710018 () Bool)

(assert (=> b!710018 (= e!399455 (not (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!318275)))))

(declare-fun b!710019 () Bool)

(declare-fun res!473509 () Bool)

(assert (=> b!710019 (=> (not res!473509) (not e!399453))))

(assert (=> b!710019 (= res!473509 (not (contains!3961 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!710020 () Bool)

(declare-fun res!473504 () Bool)

(assert (=> b!710020 (=> (not res!473504) (not e!399453))))

(declare-fun -!371 (List!13384 (_ BitVec 64)) List!13384)

(assert (=> b!710020 (= res!473504 (= (-!371 newAcc!49 k!2824) acc!652))))

(assert (= (and start!62972 res!473498) b!710014))

(assert (= (and b!710014 res!473497) b!710003))

(assert (= (and b!710003 res!473512) b!710001))

(assert (= (and b!710001 res!473503) b!710010))

(assert (= (and b!710010 res!473501) b!710000))

(assert (= (and b!710000 res!473499) b!710013))

(assert (= (and b!710013 res!473505) b!710016))

(assert (= (and b!710016 res!473492) b!710002))

(assert (= (and b!710002 res!473494) b!710017))

(assert (= (and b!710017 res!473500) b!710004))

(assert (= (and b!710004 res!473507) b!710020))

(assert (= (and b!710020 res!473504) b!710012))

(assert (= (and b!710012 res!473491) b!710019))

(assert (= (and b!710019 res!473509) b!710009))

(assert (= (and b!710009 res!473496) b!710005))

(assert (= (and b!710005 res!473506) b!710011))

(assert (= (and b!710011 res!473495) b!709999))

(assert (= (and b!709999 res!473511) b!710008))

(assert (= (and b!710008 res!473493) b!710006))

(assert (= (and b!710006 res!473502) b!710015))

(assert (= (and b!710015 res!473510) b!710007))

(assert (= (and b!710007 res!473490) b!709998))

(assert (= (and b!709998 res!473508) b!710018))

(declare-fun m!667175 () Bool)

(assert (=> b!710003 m!667175))

(declare-fun m!667177 () Bool)

(assert (=> b!709999 m!667177))

(declare-fun m!667179 () Bool)

(assert (=> b!710012 m!667179))

(declare-fun m!667181 () Bool)

(assert (=> b!710000 m!667181))

(declare-fun m!667183 () Bool)

(assert (=> b!710005 m!667183))

(assert (=> b!710005 m!667183))

(declare-fun m!667185 () Bool)

(assert (=> b!710005 m!667185))

(declare-fun m!667187 () Bool)

(assert (=> b!710013 m!667187))

(declare-fun m!667189 () Bool)

(assert (=> b!710010 m!667189))

(declare-fun m!667191 () Bool)

(assert (=> b!710004 m!667191))

(declare-fun m!667193 () Bool)

(assert (=> b!710015 m!667193))

(assert (=> b!710011 m!667183))

(assert (=> b!710011 m!667183))

(declare-fun m!667195 () Bool)

(assert (=> b!710011 m!667195))

(declare-fun m!667197 () Bool)

(assert (=> b!710001 m!667197))

(declare-fun m!667199 () Bool)

(assert (=> b!710006 m!667199))

(declare-fun m!667201 () Bool)

(assert (=> b!710019 m!667201))

(declare-fun m!667203 () Bool)

(assert (=> b!710020 m!667203))

(assert (=> b!710008 m!667183))

(assert (=> b!710008 m!667183))

(declare-fun m!667205 () Bool)

(assert (=> b!710008 m!667205))

(assert (=> b!710008 m!667205))

(declare-fun m!667207 () Bool)

(assert (=> b!710008 m!667207))

(declare-fun m!667209 () Bool)

(assert (=> b!710016 m!667209))

(declare-fun m!667211 () Bool)

(assert (=> b!710002 m!667211))

(declare-fun m!667213 () Bool)

(assert (=> start!62972 m!667213))

(declare-fun m!667215 () Bool)

(assert (=> b!710017 m!667215))

(declare-fun m!667217 () Bool)

(assert (=> b!710018 m!667217))

(declare-fun m!667219 () Bool)

(assert (=> b!710014 m!667219))

(declare-fun m!667221 () Bool)

(assert (=> b!710007 m!667221))

(declare-fun m!667223 () Bool)

(assert (=> b!709998 m!667223))

(push 1)

(assert (not b!710006))

(assert (not b!710015))

(assert (not b!710010))

(assert (not b!710019))

(assert (not b!710017))

(assert (not b!710020))

(assert (not start!62972))

(assert (not b!710018))

(assert (not b!710008))

(assert (not b!710005))

(assert (not b!710001))

(assert (not b!710000))

(assert (not b!710013))

(assert (not b!710007))

(assert (not b!710012))

(assert (not b!710003))

(assert (not b!710004))

(assert (not b!709999))

(assert (not b!710002))

(assert (not b!710011))

(assert (not b!710016))

(assert (not b!709998))

(assert (not b!710014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97237 () Bool)

(declare-fun lt!318278 () Bool)

(declare-fun content!346 (List!13384) (Set (_ BitVec 64)))

(assert (=> d!97237 (= lt!318278 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!346 lt!318275)))))

(declare-fun e!399493 () Bool)

(assert (=> d!97237 (= lt!318278 e!399493)))

(declare-fun res!473546 () Bool)

(assert (=> d!97237 (=> (not res!473546) (not e!399493))))

(assert (=> d!97237 (= res!473546 (is-Cons!13380 lt!318275))))

(assert (=> d!97237 (= (contains!3961 lt!318275 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318278)))

(declare-fun b!710061 () Bool)

(declare-fun e!399492 () Bool)

(assert (=> b!710061 (= e!399493 e!399492)))

(declare-fun res!473545 () Bool)

(assert (=> b!710061 (=> res!473545 e!399492)))

(assert (=> b!710061 (= res!473545 (= (h!14425 lt!318275) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710062 () Bool)

(assert (=> b!710062 (= e!399492 (contains!3961 (t!19681 lt!318275) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97237 res!473546) b!710061))

(assert (= (and b!710061 (not res!473545)) b!710062))

(declare-fun m!667241 () Bool)

(assert (=> d!97237 m!667241))

(declare-fun m!667243 () Bool)

(assert (=> d!97237 m!667243))

(declare-fun m!667245 () Bool)

(assert (=> b!710062 m!667245))

(assert (=> b!710006 d!97237))

(declare-fun b!710082 () Bool)

(declare-fun e!399512 () Bool)

(declare-fun e!399514 () Bool)

(assert (=> b!710082 (= e!399512 e!399514)))

(declare-fun res!473567 () Bool)

(assert (=> b!710082 (=> res!473567 e!399514)))

(declare-fun e!399515 () Bool)

(assert (=> b!710082 (= res!473567 e!399515)))

(declare-fun res!473565 () Bool)

(assert (=> b!710082 (=> (not res!473565) (not e!399515))))

(assert (=> b!710082 (= res!473565 (= (h!14425 acc!652) (h!14425 newAcc!49)))))

(declare-fun b!710084 () Bool)

(assert (=> b!710084 (= e!399514 (subseq!406 acc!652 (t!19681 newAcc!49)))))

(declare-fun b!710081 () Bool)

(declare-fun e!399513 () Bool)

(assert (=> b!710081 (= e!399513 e!399512)))

(declare-fun res!473568 () Bool)

(assert (=> b!710081 (=> (not res!473568) (not e!399512))))

(assert (=> b!710081 (= res!473568 (is-Cons!13380 newAcc!49))))

(declare-fun b!710083 () Bool)

(assert (=> b!710083 (= e!399515 (subseq!406 (t!19681 acc!652) (t!19681 newAcc!49)))))

(declare-fun d!97243 () Bool)

(declare-fun res!473566 () Bool)

(assert (=> d!97243 (=> res!473566 e!399513)))

(assert (=> d!97243 (= res!473566 (is-Nil!13381 acc!652))))

(assert (=> d!97243 (= (subseq!406 acc!652 newAcc!49) e!399513)))

(assert (= (and d!97243 (not res!473566)) b!710081))

(assert (= (and b!710081 res!473568) b!710082))

(assert (= (and b!710082 res!473565) b!710083))

(assert (= (and b!710082 (not res!473567)) b!710084))

(declare-fun m!667257 () Bool)

(assert (=> b!710084 m!667257))

(declare-fun m!667259 () Bool)

(assert (=> b!710083 m!667259))

(assert (=> b!710017 d!97243))

(declare-fun d!97249 () Bool)

(declare-fun lt!318282 () Bool)

(assert (=> d!97249 (= lt!318282 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!346 lt!318275)))))

(declare-fun e!399517 () Bool)

(assert (=> d!97249 (= lt!318282 e!399517)))

(declare-fun res!473570 () Bool)

(assert (=> d!97249 (=> (not res!473570) (not e!399517))))

(assert (=> d!97249 (= res!473570 (is-Cons!13380 lt!318275))))

(assert (=> d!97249 (= (contains!3961 lt!318275 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318282)))

(declare-fun b!710085 () Bool)

(declare-fun e!399516 () Bool)

(assert (=> b!710085 (= e!399517 e!399516)))

(declare-fun res!473569 () Bool)

(assert (=> b!710085 (=> res!473569 e!399516)))

(assert (=> b!710085 (= res!473569 (= (h!14425 lt!318275) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710086 () Bool)

(assert (=> b!710086 (= e!399516 (contains!3961 (t!19681 lt!318275) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97249 res!473570) b!710085))

(assert (= (and b!710085 (not res!473569)) b!710086))

(assert (=> d!97249 m!667241))

(declare-fun m!667261 () Bool)

(assert (=> d!97249 m!667261))

(declare-fun m!667263 () Bool)

(assert (=> b!710086 m!667263))

(assert (=> b!710015 d!97249))

(declare-fun d!97251 () Bool)

(assert (=> d!97251 (= (validKeyInArray!0 (select (arr!19343 a!3591) from!2969)) (and (not (= (select (arr!19343 a!3591) from!2969) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19343 a!3591) from!2969) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710005 d!97251))

(declare-fun d!97253 () Bool)

(assert (=> d!97253 (= (validKeyInArray!0 k!2824) (and (not (= k!2824 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2824 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!710016 d!97253))

(declare-fun d!97255 () Bool)

(declare-fun res!473580 () Bool)

(declare-fun e!399539 () Bool)

(assert (=> d!97255 (=> res!473580 e!399539)))

(assert (=> d!97255 (= res!473580 (is-Nil!13381 newAcc!49))))

(assert (=> d!97255 (= (noDuplicate!1208 newAcc!49) e!399539)))

(declare-fun b!710116 () Bool)

(declare-fun e!399540 () Bool)

(assert (=> b!710116 (= e!399539 e!399540)))

(declare-fun res!473581 () Bool)

(assert (=> b!710116 (=> (not res!473581) (not e!399540))))

(assert (=> b!710116 (= res!473581 (not (contains!3961 (t!19681 newAcc!49) (h!14425 newAcc!49))))))

(declare-fun b!710117 () Bool)

(assert (=> b!710117 (= e!399540 (noDuplicate!1208 (t!19681 newAcc!49)))))

(assert (= (and d!97255 (not res!473580)) b!710116))

(assert (= (and b!710116 res!473581) b!710117))

(declare-fun m!667269 () Bool)

(assert (=> b!710116 m!667269))

(declare-fun m!667275 () Bool)

(assert (=> b!710117 m!667275))

(assert (=> b!710003 d!97255))

(declare-fun d!97257 () Bool)

(declare-fun res!473583 () Bool)

(declare-fun e!399544 () Bool)

(assert (=> d!97257 (=> res!473583 e!399544)))

(assert (=> d!97257 (= res!473583 (is-Nil!13381 acc!652))))

(assert (=> d!97257 (= (noDuplicate!1208 acc!652) e!399544)))

(declare-fun b!710123 () Bool)

(declare-fun e!399545 () Bool)

(assert (=> b!710123 (= e!399544 e!399545)))

(declare-fun res!473584 () Bool)

(assert (=> b!710123 (=> (not res!473584) (not e!399545))))

(assert (=> b!710123 (= res!473584 (not (contains!3961 (t!19681 acc!652) (h!14425 acc!652))))))

(declare-fun b!710124 () Bool)

(assert (=> b!710124 (= e!399545 (noDuplicate!1208 (t!19681 acc!652)))))

(assert (= (and d!97257 (not res!473583)) b!710123))

(assert (= (and b!710123 res!473584) b!710124))

(declare-fun m!667281 () Bool)

(assert (=> b!710123 m!667281))

(declare-fun m!667287 () Bool)

(assert (=> b!710124 m!667287))

(assert (=> b!710014 d!97257))

(declare-fun d!97261 () Bool)

(declare-fun lt!318289 () Bool)

(assert (=> d!97261 (= lt!318289 (member k!2824 (content!346 newAcc!49)))))

(declare-fun e!399547 () Bool)

(assert (=> d!97261 (= lt!318289 e!399547)))

(declare-fun res!473586 () Bool)

(assert (=> d!97261 (=> (not res!473586) (not e!399547))))

(assert (=> d!97261 (= res!473586 (is-Cons!13380 newAcc!49))))

(assert (=> d!97261 (= (contains!3961 newAcc!49 k!2824) lt!318289)))

(declare-fun b!710125 () Bool)

(declare-fun e!399546 () Bool)

(assert (=> b!710125 (= e!399547 e!399546)))

(declare-fun res!473585 () Bool)

(assert (=> b!710125 (=> res!473585 e!399546)))

(assert (=> b!710125 (= res!473585 (= (h!14425 newAcc!49) k!2824))))

(declare-fun b!710126 () Bool)

(assert (=> b!710126 (= e!399546 (contains!3961 (t!19681 newAcc!49) k!2824))))

(assert (= (and d!97261 res!473586) b!710125))

(assert (= (and b!710125 (not res!473585)) b!710126))

(declare-fun m!667295 () Bool)

(assert (=> d!97261 m!667295))

(declare-fun m!667297 () Bool)

(assert (=> d!97261 m!667297))

(declare-fun m!667299 () Bool)

(assert (=> b!710126 m!667299))

(assert (=> b!710004 d!97261))

(declare-fun b!710167 () Bool)

(declare-fun e!399584 () Bool)

(declare-fun call!34465 () Bool)

(assert (=> b!710167 (= e!399584 call!34465)))

(declare-fun b!710168 () Bool)

(declare-fun e!399587 () Bool)

(assert (=> b!710168 (= e!399587 (contains!3961 acc!652 (select (arr!19343 a!3591) from!2969)))))

(declare-fun c!78639 () Bool)

(declare-fun bm!34462 () Bool)

(assert (=> bm!34462 (= call!34465 (arrayNoDuplicates!0 a!3591 (bvadd from!2969 #b00000000000000000000000000000001) (ite c!78639 (Cons!13380 (select (arr!19343 a!3591) from!2969) acc!652) acc!652)))))

(declare-fun b!710170 () Bool)

(declare-fun e!399585 () Bool)

(assert (=> b!710170 (= e!399585 e!399584)))

(assert (=> b!710170 (= c!78639 (validKeyInArray!0 (select (arr!19343 a!3591) from!2969)))))

(declare-fun d!97265 () Bool)

(declare-fun res!473621 () Bool)

(declare-fun e!399586 () Bool)

(assert (=> d!97265 (=> res!473621 e!399586)))

(assert (=> d!97265 (= res!473621 (bvsge from!2969 (size!19739 a!3591)))))

(assert (=> d!97265 (= (arrayNoDuplicates!0 a!3591 from!2969 acc!652) e!399586)))

(declare-fun b!710171 () Bool)

(assert (=> b!710171 (= e!399584 call!34465)))

(declare-fun b!710172 () Bool)

(assert (=> b!710172 (= e!399586 e!399585)))

(declare-fun res!473622 () Bool)

(assert (=> b!710172 (=> (not res!473622) (not e!399585))))

(assert (=> b!710172 (= res!473622 (not e!399587))))

(declare-fun res!473623 () Bool)

(assert (=> b!710172 (=> (not res!473623) (not e!399587))))

(assert (=> b!710172 (= res!473623 (validKeyInArray!0 (select (arr!19343 a!3591) from!2969)))))

(assert (= (and d!97265 (not res!473621)) b!710172))

(assert (= (and b!710172 res!473623) b!710168))

(assert (= (and b!710172 res!473622) b!710170))

(assert (= (and b!710170 c!78639) b!710167))

(assert (= (and b!710170 (not c!78639)) b!710171))

(assert (= (or b!710167 b!710171) bm!34462))

(assert (=> b!710168 m!667183))

(assert (=> b!710168 m!667183))

(declare-fun m!667327 () Bool)

(assert (=> b!710168 m!667327))

(assert (=> bm!34462 m!667183))

(declare-fun m!667329 () Bool)

(assert (=> bm!34462 m!667329))

(assert (=> b!710170 m!667183))

(assert (=> b!710170 m!667183))

(assert (=> b!710170 m!667185))

(assert (=> b!710172 m!667183))

(assert (=> b!710172 m!667183))

(assert (=> b!710172 m!667185))

(assert (=> b!710002 d!97265))

(declare-fun d!97283 () Bool)

(declare-fun lt!318296 () Bool)

(assert (=> d!97283 (= lt!318296 (member k!2824 (content!346 acc!652)))))

(declare-fun e!399595 () Bool)

(assert (=> d!97283 (= lt!318296 e!399595)))

(declare-fun res!473629 () Bool)

(assert (=> d!97283 (=> (not res!473629) (not e!399595))))

(assert (=> d!97283 (= res!473629 (is-Cons!13380 acc!652))))

(assert (=> d!97283 (= (contains!3961 acc!652 k!2824) lt!318296)))

(declare-fun b!710178 () Bool)

(declare-fun e!399594 () Bool)

(assert (=> b!710178 (= e!399595 e!399594)))

(declare-fun res!473628 () Bool)

(assert (=> b!710178 (=> res!473628 e!399594)))

(assert (=> b!710178 (= res!473628 (= (h!14425 acc!652) k!2824))))

(declare-fun b!710179 () Bool)

(assert (=> b!710179 (= e!399594 (contains!3961 (t!19681 acc!652) k!2824))))

(assert (= (and d!97283 res!473629) b!710178))

(assert (= (and b!710178 (not res!473628)) b!710179))

(declare-fun m!667337 () Bool)

(assert (=> d!97283 m!667337))

(declare-fun m!667339 () Bool)

(assert (=> d!97283 m!667339))

(declare-fun m!667341 () Bool)

(assert (=> b!710179 m!667341))

(assert (=> b!710013 d!97283))

(declare-fun d!97287 () Bool)

(assert (=> d!97287 (= ($colon$colon!517 acc!652 (select (arr!19343 a!3591) from!2969)) (Cons!13380 (select (arr!19343 a!3591) from!2969) acc!652))))

(assert (=> b!710011 d!97287))

(declare-fun d!97293 () Bool)

(declare-fun lt!318300 () Bool)

(assert (=> d!97293 (= lt!318300 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!346 acc!652)))))

(declare-fun e!399603 () Bool)

(assert (=> d!97293 (= lt!318300 e!399603)))

(declare-fun res!473637 () Bool)

(assert (=> d!97293 (=> (not res!473637) (not e!399603))))

(assert (=> d!97293 (= res!473637 (is-Cons!13380 acc!652))))

(assert (=> d!97293 (= (contains!3961 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318300)))

(declare-fun b!710186 () Bool)

(declare-fun e!399602 () Bool)

(assert (=> b!710186 (= e!399603 e!399602)))

(declare-fun res!473636 () Bool)

(assert (=> b!710186 (=> res!473636 e!399602)))

(assert (=> b!710186 (= res!473636 (= (h!14425 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710187 () Bool)

(assert (=> b!710187 (= e!399602 (contains!3961 (t!19681 acc!652) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97293 res!473637) b!710186))

(assert (= (and b!710186 (not res!473636)) b!710187))

(assert (=> d!97293 m!667337))

(declare-fun m!667355 () Bool)

(assert (=> d!97293 m!667355))

(declare-fun m!667357 () Bool)

(assert (=> b!710187 m!667357))

(assert (=> b!710001 d!97293))

(declare-fun d!97297 () Bool)

(declare-fun lt!318302 () Bool)

(assert (=> d!97297 (= lt!318302 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!346 newAcc!49)))))

(declare-fun e!399607 () Bool)

(assert (=> d!97297 (= lt!318302 e!399607)))

(declare-fun res!473641 () Bool)

(assert (=> d!97297 (=> (not res!473641) (not e!399607))))

(assert (=> d!97297 (= res!473641 (is-Cons!13380 newAcc!49))))

(assert (=> d!97297 (= (contains!3961 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000) lt!318302)))

(declare-fun b!710190 () Bool)

(declare-fun e!399606 () Bool)

(assert (=> b!710190 (= e!399607 e!399606)))

(declare-fun res!473640 () Bool)

(assert (=> b!710190 (=> res!473640 e!399606)))

(assert (=> b!710190 (= res!473640 (= (h!14425 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710191 () Bool)

(assert (=> b!710191 (= e!399606 (contains!3961 (t!19681 newAcc!49) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97297 res!473641) b!710190))

(assert (= (and b!710190 (not res!473640)) b!710191))

(assert (=> d!97297 m!667295))

(declare-fun m!667363 () Bool)

(assert (=> d!97297 m!667363))

(declare-fun m!667365 () Bool)

(assert (=> b!710191 m!667365))

(assert (=> b!710012 d!97297))

(declare-fun d!97301 () Bool)

(declare-fun res!473644 () Bool)

(declare-fun e!399610 () Bool)

(assert (=> d!97301 (=> res!473644 e!399610)))

(assert (=> d!97301 (= res!473644 (is-Nil!13381 lt!318275))))

(assert (=> d!97301 (= (noDuplicate!1208 lt!318275) e!399610)))

(declare-fun b!710194 () Bool)

(declare-fun e!399611 () Bool)

(assert (=> b!710194 (= e!399610 e!399611)))

(declare-fun res!473645 () Bool)

(assert (=> b!710194 (=> (not res!473645) (not e!399611))))

(assert (=> b!710194 (= res!473645 (not (contains!3961 (t!19681 lt!318275) (h!14425 lt!318275))))))

(declare-fun b!710195 () Bool)

(assert (=> b!710195 (= e!399611 (noDuplicate!1208 (t!19681 lt!318275)))))

(assert (= (and d!97301 (not res!473644)) b!710194))

(assert (= (and b!710194 res!473645) b!710195))

(declare-fun m!667371 () Bool)

(assert (=> b!710194 m!667371))

(declare-fun m!667373 () Bool)

(assert (=> b!710195 m!667373))

(assert (=> b!709999 d!97301))

(declare-fun d!97305 () Bool)

(declare-fun lt!318303 () Bool)

(assert (=> d!97305 (= lt!318303 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!346 acc!652)))))

(declare-fun e!399617 () Bool)

(assert (=> d!97305 (= lt!318303 e!399617)))

(declare-fun res!473650 () Bool)

(assert (=> d!97305 (=> (not res!473650) (not e!399617))))

(assert (=> d!97305 (= res!473650 (is-Cons!13380 acc!652))))

(assert (=> d!97305 (= (contains!3961 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000) lt!318303)))

(declare-fun b!710201 () Bool)

(declare-fun e!399616 () Bool)

(assert (=> b!710201 (= e!399617 e!399616)))

(declare-fun res!473649 () Bool)

(assert (=> b!710201 (=> res!473649 e!399616)))

(assert (=> b!710201 (= res!473649 (= (h!14425 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!710202 () Bool)

(assert (=> b!710202 (= e!399616 (contains!3961 (t!19681 acc!652) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!97305 res!473650) b!710201))

(assert (= (and b!710201 (not res!473649)) b!710202))

(assert (=> d!97305 m!667337))

(declare-fun m!667377 () Bool)

(assert (=> d!97305 m!667377))

(declare-fun m!667383 () Bool)

(assert (=> b!710202 m!667383))

(assert (=> b!710010 d!97305))

(declare-fun d!97311 () Bool)

(declare-fun res!473665 () Bool)

(declare-fun e!399632 () Bool)

(assert (=> d!97311 (=> res!473665 e!399632)))

