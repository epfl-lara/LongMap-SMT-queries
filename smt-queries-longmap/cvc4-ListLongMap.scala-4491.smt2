; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62418 () Bool)

(assert start!62418)

(declare-fun b!700542 () Bool)

(declare-fun res!464378 () Bool)

(declare-fun e!397301 () Bool)

(assert (=> b!700542 (=> (not res!464378) (not e!397301))))

(declare-datatypes ((List!13246 0))(
  ( (Nil!13243) (Cons!13242 (h!14287 (_ BitVec 64)) (t!19528 List!13246)) )
))
(declare-fun newAcc!49 () List!13246)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3823 (List!13246 (_ BitVec 64)) Bool)

(assert (=> b!700542 (= res!464378 (contains!3823 newAcc!49 k!2824))))

(declare-fun b!700543 () Bool)

(declare-fun res!464354 () Bool)

(assert (=> b!700543 (=> (not res!464354) (not e!397301))))

(assert (=> b!700543 (= res!464354 (not (contains!3823 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700544 () Bool)

(declare-fun res!464362 () Bool)

(assert (=> b!700544 (=> (not res!464362) (not e!397301))))

(declare-fun acc!652 () List!13246)

(declare-fun subseq!268 (List!13246 List!13246) Bool)

(assert (=> b!700544 (= res!464362 (subseq!268 acc!652 newAcc!49))))

(declare-fun b!700545 () Bool)

(declare-fun res!464377 () Bool)

(declare-fun e!397303 () Bool)

(assert (=> b!700545 (=> (not res!464377) (not e!397303))))

(declare-fun lt!317499 () List!13246)

(assert (=> b!700545 (= res!464377 (not (contains!3823 lt!317499 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700546 () Bool)

(declare-fun res!464373 () Bool)

(assert (=> b!700546 (=> (not res!464373) (not e!397301))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!700546 (= res!464373 (validKeyInArray!0 k!2824))))

(declare-fun b!700547 () Bool)

(declare-fun res!464363 () Bool)

(assert (=> b!700547 (=> (not res!464363) (not e!397301))))

(declare-datatypes ((array!40097 0))(
  ( (array!40098 (arr!19205 (Array (_ BitVec 32) (_ BitVec 64))) (size!19590 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40097)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!40097 (_ BitVec 32) List!13246) Bool)

(assert (=> b!700547 (= res!464363 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!700548 () Bool)

(assert (=> b!700548 (= e!397303 false)))

(declare-fun lt!317498 () Bool)

(assert (=> b!700548 (= lt!317498 (contains!3823 lt!317499 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!700549 () Bool)

(declare-fun res!464359 () Bool)

(assert (=> b!700549 (=> (not res!464359) (not e!397301))))

(declare-fun -!233 (List!13246 (_ BitVec 64)) List!13246)

(assert (=> b!700549 (= res!464359 (= (-!233 newAcc!49 k!2824) acc!652))))

(declare-fun b!700550 () Bool)

(declare-fun res!464372 () Bool)

(assert (=> b!700550 (=> (not res!464372) (not e!397301))))

(assert (=> b!700550 (= res!464372 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19590 a!3591)))))

(declare-fun b!700551 () Bool)

(declare-fun res!464356 () Bool)

(assert (=> b!700551 (=> (not res!464356) (not e!397301))))

(assert (=> b!700551 (= res!464356 (validKeyInArray!0 (select (arr!19205 a!3591) from!2969)))))

(declare-fun b!700552 () Bool)

(declare-fun res!464364 () Bool)

(assert (=> b!700552 (=> (not res!464364) (not e!397303))))

(declare-fun lt!317497 () List!13246)

(assert (=> b!700552 (= res!464364 (not (contains!3823 lt!317497 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700553 () Bool)

(declare-fun res!464358 () Bool)

(assert (=> b!700553 (=> (not res!464358) (not e!397303))))

(declare-fun arrayContainsKey!0 (array!40097 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!700553 (= res!464358 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!700554 () Bool)

(declare-fun res!464374 () Bool)

(assert (=> b!700554 (=> (not res!464374) (not e!397301))))

(assert (=> b!700554 (= res!464374 (not (contains!3823 acc!652 k!2824)))))

(declare-fun b!700555 () Bool)

(assert (=> b!700555 (= e!397301 e!397303)))

(declare-fun res!464376 () Bool)

(assert (=> b!700555 (=> (not res!464376) (not e!397303))))

(assert (=> b!700555 (= res!464376 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun $colon$colon!466 (List!13246 (_ BitVec 64)) List!13246)

(assert (=> b!700555 (= lt!317499 ($colon$colon!466 newAcc!49 (select (arr!19205 a!3591) from!2969)))))

(assert (=> b!700555 (= lt!317497 ($colon$colon!466 acc!652 (select (arr!19205 a!3591) from!2969)))))

(declare-fun b!700556 () Bool)

(declare-fun res!464361 () Bool)

(assert (=> b!700556 (=> (not res!464361) (not e!397301))))

(assert (=> b!700556 (= res!464361 (not (contains!3823 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700557 () Bool)

(declare-fun res!464371 () Bool)

(assert (=> b!700557 (=> (not res!464371) (not e!397303))))

(assert (=> b!700557 (= res!464371 (= (-!233 lt!317499 k!2824) lt!317497))))

(declare-fun b!700558 () Bool)

(declare-fun res!464360 () Bool)

(assert (=> b!700558 (=> (not res!464360) (not e!397303))))

(assert (=> b!700558 (= res!464360 (subseq!268 lt!317497 lt!317499))))

(declare-fun b!700559 () Bool)

(declare-fun res!464352 () Bool)

(assert (=> b!700559 (=> (not res!464352) (not e!397303))))

(assert (=> b!700559 (= res!464352 (not (contains!3823 lt!317497 k!2824)))))

(declare-fun res!464370 () Bool)

(assert (=> start!62418 (=> (not res!464370) (not e!397301))))

(assert (=> start!62418 (= res!464370 (and (bvslt (size!19590 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19590 a!3591))))))

(assert (=> start!62418 e!397301))

(assert (=> start!62418 true))

(declare-fun array_inv!15001 (array!40097) Bool)

(assert (=> start!62418 (array_inv!15001 a!3591)))

(declare-fun b!700560 () Bool)

(declare-fun res!464365 () Bool)

(assert (=> b!700560 (=> (not res!464365) (not e!397303))))

(assert (=> b!700560 (= res!464365 (not (contains!3823 lt!317497 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700561 () Bool)

(declare-fun res!464375 () Bool)

(assert (=> b!700561 (=> (not res!464375) (not e!397301))))

(assert (=> b!700561 (= res!464375 (not (contains!3823 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700562 () Bool)

(declare-fun res!464369 () Bool)

(assert (=> b!700562 (=> (not res!464369) (not e!397303))))

(declare-fun noDuplicate!1070 (List!13246) Bool)

(assert (=> b!700562 (= res!464369 (noDuplicate!1070 lt!317497))))

(declare-fun b!700563 () Bool)

(declare-fun res!464367 () Bool)

(assert (=> b!700563 (=> (not res!464367) (not e!397301))))

(assert (=> b!700563 (= res!464367 (noDuplicate!1070 newAcc!49))))

(declare-fun b!700564 () Bool)

(declare-fun res!464366 () Bool)

(assert (=> b!700564 (=> (not res!464366) (not e!397303))))

(assert (=> b!700564 (= res!464366 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) lt!317497))))

(declare-fun b!700565 () Bool)

(declare-fun res!464353 () Bool)

(assert (=> b!700565 (=> (not res!464353) (not e!397301))))

(assert (=> b!700565 (= res!464353 (not (contains!3823 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!700566 () Bool)

(declare-fun res!464355 () Bool)

(assert (=> b!700566 (=> (not res!464355) (not e!397303))))

(assert (=> b!700566 (= res!464355 (noDuplicate!1070 lt!317499))))

(declare-fun b!700567 () Bool)

(declare-fun res!464379 () Bool)

(assert (=> b!700567 (=> (not res!464379) (not e!397301))))

(assert (=> b!700567 (= res!464379 (noDuplicate!1070 acc!652))))

(declare-fun b!700568 () Bool)

(declare-fun res!464368 () Bool)

(assert (=> b!700568 (=> (not res!464368) (not e!397301))))

(assert (=> b!700568 (= res!464368 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!700569 () Bool)

(declare-fun res!464357 () Bool)

(assert (=> b!700569 (=> (not res!464357) (not e!397303))))

(assert (=> b!700569 (= res!464357 (contains!3823 lt!317499 k!2824))))

(assert (= (and start!62418 res!464370) b!700567))

(assert (= (and b!700567 res!464379) b!700563))

(assert (= (and b!700563 res!464367) b!700565))

(assert (= (and b!700565 res!464353) b!700556))

(assert (= (and b!700556 res!464361) b!700568))

(assert (= (and b!700568 res!464368) b!700554))

(assert (= (and b!700554 res!464374) b!700546))

(assert (= (and b!700546 res!464373) b!700547))

(assert (= (and b!700547 res!464363) b!700544))

(assert (= (and b!700544 res!464362) b!700542))

(assert (= (and b!700542 res!464378) b!700549))

(assert (= (and b!700549 res!464359) b!700561))

(assert (= (and b!700561 res!464375) b!700543))

(assert (= (and b!700543 res!464354) b!700550))

(assert (= (and b!700550 res!464372) b!700551))

(assert (= (and b!700551 res!464356) b!700555))

(assert (= (and b!700555 res!464376) b!700562))

(assert (= (and b!700562 res!464369) b!700566))

(assert (= (and b!700566 res!464355) b!700560))

(assert (= (and b!700560 res!464365) b!700552))

(assert (= (and b!700552 res!464364) b!700553))

(assert (= (and b!700553 res!464358) b!700559))

(assert (= (and b!700559 res!464352) b!700564))

(assert (= (and b!700564 res!464366) b!700558))

(assert (= (and b!700558 res!464360) b!700569))

(assert (= (and b!700569 res!464357) b!700557))

(assert (= (and b!700557 res!464371) b!700545))

(assert (= (and b!700545 res!464377) b!700548))

(declare-fun m!660175 () Bool)

(assert (=> b!700564 m!660175))

(declare-fun m!660177 () Bool)

(assert (=> b!700545 m!660177))

(declare-fun m!660179 () Bool)

(assert (=> b!700562 m!660179))

(declare-fun m!660181 () Bool)

(assert (=> b!700546 m!660181))

(declare-fun m!660183 () Bool)

(assert (=> b!700568 m!660183))

(declare-fun m!660185 () Bool)

(assert (=> b!700559 m!660185))

(declare-fun m!660187 () Bool)

(assert (=> start!62418 m!660187))

(declare-fun m!660189 () Bool)

(assert (=> b!700553 m!660189))

(declare-fun m!660191 () Bool)

(assert (=> b!700560 m!660191))

(declare-fun m!660193 () Bool)

(assert (=> b!700549 m!660193))

(declare-fun m!660195 () Bool)

(assert (=> b!700551 m!660195))

(assert (=> b!700551 m!660195))

(declare-fun m!660197 () Bool)

(assert (=> b!700551 m!660197))

(declare-fun m!660199 () Bool)

(assert (=> b!700556 m!660199))

(declare-fun m!660201 () Bool)

(assert (=> b!700548 m!660201))

(assert (=> b!700555 m!660195))

(assert (=> b!700555 m!660195))

(declare-fun m!660203 () Bool)

(assert (=> b!700555 m!660203))

(assert (=> b!700555 m!660195))

(declare-fun m!660205 () Bool)

(assert (=> b!700555 m!660205))

(declare-fun m!660207 () Bool)

(assert (=> b!700542 m!660207))

(declare-fun m!660209 () Bool)

(assert (=> b!700567 m!660209))

(declare-fun m!660211 () Bool)

(assert (=> b!700563 m!660211))

(declare-fun m!660213 () Bool)

(assert (=> b!700566 m!660213))

(declare-fun m!660215 () Bool)

(assert (=> b!700561 m!660215))

(declare-fun m!660217 () Bool)

(assert (=> b!700565 m!660217))

(declare-fun m!660219 () Bool)

(assert (=> b!700552 m!660219))

(declare-fun m!660221 () Bool)

(assert (=> b!700544 m!660221))

(declare-fun m!660223 () Bool)

(assert (=> b!700558 m!660223))

(declare-fun m!660225 () Bool)

(assert (=> b!700569 m!660225))

(declare-fun m!660227 () Bool)

(assert (=> b!700557 m!660227))

(declare-fun m!660229 () Bool)

(assert (=> b!700543 m!660229))

(declare-fun m!660231 () Bool)

(assert (=> b!700554 m!660231))

(declare-fun m!660233 () Bool)

(assert (=> b!700547 m!660233))

(push 1)

