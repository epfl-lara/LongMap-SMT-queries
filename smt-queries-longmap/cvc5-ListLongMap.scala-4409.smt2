; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60866 () Bool)

(assert start!60866)

(declare-fun b!682569 () Bool)

(declare-datatypes ((Unit!23952 0))(
  ( (Unit!23953) )
))
(declare-fun e!388917 () Unit!23952)

(declare-fun Unit!23954 () Unit!23952)

(assert (=> b!682569 (= e!388917 Unit!23954)))

(declare-fun b!682570 () Bool)

(declare-fun res!448548 () Bool)

(declare-fun e!388923 () Bool)

(assert (=> b!682570 (=> (not res!448548) (not e!388923))))

(declare-fun i!1382 () (_ BitVec 32))

(declare-datatypes ((array!39550 0))(
  ( (array!39551 (arr!18957 (Array (_ BitVec 32) (_ BitVec 64))) (size!19321 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39550)

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!682570 (= res!448548 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19321 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!682571 () Bool)

(declare-fun e!388920 () Bool)

(declare-datatypes ((List!12998 0))(
  ( (Nil!12995) (Cons!12994 (h!14039 (_ BitVec 64)) (t!19241 List!12998)) )
))
(declare-fun acc!681 () List!12998)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3575 (List!12998 (_ BitVec 64)) Bool)

(assert (=> b!682571 (= e!388920 (contains!3575 acc!681 k!2843))))

(declare-fun res!448546 () Bool)

(assert (=> start!60866 (=> (not res!448546) (not e!388923))))

(assert (=> start!60866 (= res!448546 (and (bvslt (size!19321 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19321 a!3626))))))

(assert (=> start!60866 e!388923))

(assert (=> start!60866 true))

(declare-fun array_inv!14753 (array!39550) Bool)

(assert (=> start!60866 (array_inv!14753 a!3626)))

(declare-fun b!682572 () Bool)

(declare-fun res!448544 () Bool)

(assert (=> b!682572 (=> (not res!448544) (not e!388923))))

(declare-fun arrayNoDuplicates!0 (array!39550 (_ BitVec 32) List!12998) Bool)

(assert (=> b!682572 (= res!448544 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12995))))

(declare-fun b!682573 () Bool)

(declare-fun res!448537 () Bool)

(assert (=> b!682573 (=> (not res!448537) (not e!388923))))

(declare-fun arrayContainsKey!0 (array!39550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!682573 (= res!448537 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!682574 () Bool)

(declare-fun res!448549 () Bool)

(assert (=> b!682574 (=> (not res!448549) (not e!388923))))

(assert (=> b!682574 (= res!448549 (not (contains!3575 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682575 () Bool)

(assert (=> b!682575 (= e!388923 (not true))))

(declare-fun -!126 (List!12998 (_ BitVec 64)) List!12998)

(declare-fun $colon$colon!326 (List!12998 (_ BitVec 64)) List!12998)

(assert (=> b!682575 (= (-!126 ($colon$colon!326 acc!681 k!2843) k!2843) acc!681)))

(declare-fun lt!313565 () Unit!23952)

(declare-fun lemmaLMinusHeadEqualsTail!0 ((_ BitVec 64) List!12998) Unit!23952)

(assert (=> b!682575 (= lt!313565 (lemmaLMinusHeadEqualsTail!0 k!2843 acc!681))))

(declare-fun subseq!161 (List!12998 List!12998) Bool)

(assert (=> b!682575 (subseq!161 acc!681 acc!681)))

(declare-fun lt!313570 () Unit!23952)

(declare-fun lemmaListSubSeqRefl!0 (List!12998) Unit!23952)

(assert (=> b!682575 (= lt!313570 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682575 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun lt!313569 () Unit!23952)

(declare-fun e!388919 () Unit!23952)

(assert (=> b!682575 (= lt!313569 e!388919)))

(declare-fun c!77384 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!682575 (= c!77384 (validKeyInArray!0 (select (arr!18957 a!3626) from!3004)))))

(declare-fun lt!313566 () Unit!23952)

(assert (=> b!682575 (= lt!313566 e!388917)))

(declare-fun c!77383 () Bool)

(assert (=> b!682575 (= c!77383 (arrayContainsKey!0 a!3626 k!2843 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682575 (arrayContainsKey!0 (array!39551 (store (arr!18957 a!3626) i!1382 k!2843) (size!19321 a!3626)) k!2843 from!3004)))

(declare-fun b!682576 () Bool)

(declare-fun res!448547 () Bool)

(assert (=> b!682576 (=> (not res!448547) (not e!388923))))

(assert (=> b!682576 (= res!448547 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!682577 () Bool)

(declare-fun res!448545 () Bool)

(assert (=> b!682577 (=> (not res!448545) (not e!388923))))

(assert (=> b!682577 (= res!448545 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19321 a!3626))))))

(declare-fun b!682578 () Bool)

(declare-fun Unit!23955 () Unit!23952)

(assert (=> b!682578 (= e!388919 Unit!23955)))

(declare-fun b!682579 () Bool)

(declare-fun Unit!23956 () Unit!23952)

(assert (=> b!682579 (= e!388917 Unit!23956)))

(declare-fun lt!313567 () Unit!23952)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39550 (_ BitVec 64) (_ BitVec 32)) Unit!23952)

(assert (=> b!682579 (= lt!313567 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!682579 false))

(declare-fun b!682580 () Bool)

(declare-fun res!448543 () Bool)

(assert (=> b!682580 (=> (not res!448543) (not e!388923))))

(assert (=> b!682580 (= res!448543 (validKeyInArray!0 k!2843))))

(declare-fun b!682581 () Bool)

(declare-fun res!448538 () Bool)

(assert (=> b!682581 (=> (not res!448538) (not e!388923))))

(assert (=> b!682581 (= res!448538 (not (contains!3575 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!682582 () Bool)

(declare-fun res!448542 () Bool)

(assert (=> b!682582 (=> (not res!448542) (not e!388923))))

(declare-fun noDuplicate!822 (List!12998) Bool)

(assert (=> b!682582 (= res!448542 (noDuplicate!822 acc!681))))

(declare-fun b!682583 () Bool)

(declare-fun e!388918 () Bool)

(assert (=> b!682583 (= e!388918 (not (contains!3575 acc!681 k!2843)))))

(declare-fun b!682584 () Bool)

(declare-fun lt!313564 () Unit!23952)

(assert (=> b!682584 (= e!388919 lt!313564)))

(declare-fun lt!313568 () Unit!23952)

(assert (=> b!682584 (= lt!313568 (lemmaListSubSeqRefl!0 acc!681))))

(assert (=> b!682584 (subseq!161 acc!681 acc!681)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!39550 List!12998 List!12998 (_ BitVec 32)) Unit!23952)

(assert (=> b!682584 (= lt!313564 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3626 ($colon$colon!326 acc!681 (select (arr!18957 a!3626) from!3004)) acc!681 (bvadd #b00000000000000000000000000000001 from!3004)))))

(assert (=> b!682584 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) acc!681)))

(declare-fun b!682585 () Bool)

(declare-fun e!388921 () Bool)

(assert (=> b!682585 (= e!388921 e!388918)))

(declare-fun res!448539 () Bool)

(assert (=> b!682585 (=> (not res!448539) (not e!388918))))

(assert (=> b!682585 (= res!448539 (bvsle from!3004 i!1382))))

(declare-fun b!682586 () Bool)

(declare-fun res!448541 () Bool)

(assert (=> b!682586 (=> (not res!448541) (not e!388923))))

(assert (=> b!682586 (= res!448541 e!388921)))

(declare-fun res!448550 () Bool)

(assert (=> b!682586 (=> res!448550 e!388921)))

(assert (=> b!682586 (= res!448550 e!388920)))

(declare-fun res!448540 () Bool)

(assert (=> b!682586 (=> (not res!448540) (not e!388920))))

(assert (=> b!682586 (= res!448540 (bvsgt from!3004 i!1382))))

(assert (= (and start!60866 res!448546) b!682582))

(assert (= (and b!682582 res!448542) b!682581))

(assert (= (and b!682581 res!448538) b!682574))

(assert (= (and b!682574 res!448549) b!682586))

(assert (= (and b!682586 res!448540) b!682571))

(assert (= (and b!682586 (not res!448550)) b!682585))

(assert (= (and b!682585 res!448539) b!682583))

(assert (= (and b!682586 res!448541) b!682572))

(assert (= (and b!682572 res!448544) b!682576))

(assert (= (and b!682576 res!448547) b!682577))

(assert (= (and b!682577 res!448545) b!682580))

(assert (= (and b!682580 res!448543) b!682573))

(assert (= (and b!682573 res!448537) b!682570))

(assert (= (and b!682570 res!448548) b!682575))

(assert (= (and b!682575 c!77383) b!682579))

(assert (= (and b!682575 (not c!77383)) b!682569))

(assert (= (and b!682575 c!77384) b!682584))

(assert (= (and b!682575 (not c!77384)) b!682578))

(declare-fun m!647237 () Bool)

(assert (=> start!60866 m!647237))

(declare-fun m!647239 () Bool)

(assert (=> b!682583 m!647239))

(declare-fun m!647241 () Bool)

(assert (=> b!682574 m!647241))

(declare-fun m!647243 () Bool)

(assert (=> b!682573 m!647243))

(declare-fun m!647245 () Bool)

(assert (=> b!682584 m!647245))

(declare-fun m!647247 () Bool)

(assert (=> b!682584 m!647247))

(declare-fun m!647249 () Bool)

(assert (=> b!682584 m!647249))

(declare-fun m!647251 () Bool)

(assert (=> b!682584 m!647251))

(assert (=> b!682584 m!647247))

(assert (=> b!682584 m!647249))

(declare-fun m!647253 () Bool)

(assert (=> b!682584 m!647253))

(declare-fun m!647255 () Bool)

(assert (=> b!682584 m!647255))

(assert (=> b!682571 m!647239))

(declare-fun m!647257 () Bool)

(assert (=> b!682575 m!647257))

(declare-fun m!647259 () Bool)

(assert (=> b!682575 m!647259))

(assert (=> b!682575 m!647245))

(assert (=> b!682575 m!647247))

(declare-fun m!647261 () Bool)

(assert (=> b!682575 m!647261))

(declare-fun m!647263 () Bool)

(assert (=> b!682575 m!647263))

(assert (=> b!682575 m!647253))

(declare-fun m!647265 () Bool)

(assert (=> b!682575 m!647265))

(assert (=> b!682575 m!647257))

(assert (=> b!682575 m!647247))

(declare-fun m!647267 () Bool)

(assert (=> b!682575 m!647267))

(declare-fun m!647269 () Bool)

(assert (=> b!682575 m!647269))

(assert (=> b!682575 m!647255))

(declare-fun m!647271 () Bool)

(assert (=> b!682579 m!647271))

(declare-fun m!647273 () Bool)

(assert (=> b!682576 m!647273))

(declare-fun m!647275 () Bool)

(assert (=> b!682581 m!647275))

(declare-fun m!647277 () Bool)

(assert (=> b!682572 m!647277))

(declare-fun m!647279 () Bool)

(assert (=> b!682582 m!647279))

(declare-fun m!647281 () Bool)

(assert (=> b!682580 m!647281))

(push 1)

(assert (not b!682575))

(assert (not b!682582))

(assert (not b!682583))

(assert (not b!682584))

(assert (not b!682571))

(assert (not b!682581))

(assert (not start!60866))

(assert (not b!682574))

(assert (not b!682573))

(assert (not b!682572))

(assert (not b!682580))

(assert (not b!682576))

(assert (not b!682579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

