; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61740 () Bool)

(assert start!61740)

(declare-fun b!690546 () Bool)

(declare-fun res!455087 () Bool)

(declare-fun e!393130 () Bool)

(assert (=> b!690546 (=> (not res!455087) (not e!393130))))

(declare-datatypes ((array!39772 0))(
  ( (array!39773 (arr!19054 (Array (_ BitVec 32) (_ BitVec 64))) (size!19436 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39772)

(declare-fun from!3004 () (_ BitVec 32))

(declare-datatypes ((List!13134 0))(
  ( (Nil!13131) (Cons!13130 (h!14175 (_ BitVec 64)) (t!19392 List!13134)) )
))
(declare-fun acc!681 () List!13134)

(declare-fun arrayNoDuplicates!0 (array!39772 (_ BitVec 32) List!13134) Bool)

(assert (=> b!690546 (= res!455087 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690548 () Bool)

(declare-fun res!455094 () Bool)

(assert (=> b!690548 (=> (not res!455094) (not e!393130))))

(declare-fun contains!3656 (List!13134 (_ BitVec 64)) Bool)

(assert (=> b!690548 (= res!455094 (not (contains!3656 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690549 () Bool)

(declare-fun res!455095 () Bool)

(assert (=> b!690549 (=> (not res!455095) (not e!393130))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690549 (= res!455095 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19436 a!3626))))))

(declare-fun b!690550 () Bool)

(declare-fun res!455099 () Bool)

(assert (=> b!690550 (=> (not res!455099) (not e!393130))))

(assert (=> b!690550 (= res!455099 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19436 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690551 () Bool)

(declare-fun res!455100 () Bool)

(assert (=> b!690551 (=> (not res!455100) (not e!393130))))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!690551 (= res!455100 (= (select (arr!19054 a!3626) from!3004) k!2843))))

(declare-fun b!690552 () Bool)

(declare-fun e!393127 () Bool)

(declare-fun e!393131 () Bool)

(assert (=> b!690552 (= e!393127 e!393131)))

(declare-fun res!455098 () Bool)

(assert (=> b!690552 (=> (not res!455098) (not e!393131))))

(assert (=> b!690552 (= res!455098 (bvsle from!3004 i!1382))))

(declare-fun b!690553 () Bool)

(assert (=> b!690553 (= e!393130 (not true))))

(declare-fun arrayContainsKey!0 (array!39772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690553 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun b!690554 () Bool)

(assert (=> b!690554 (= e!393131 (not (contains!3656 acc!681 k!2843)))))

(declare-fun b!690555 () Bool)

(declare-fun res!455088 () Bool)

(assert (=> b!690555 (=> (not res!455088) (not e!393130))))

(assert (=> b!690555 (= res!455088 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13131))))

(declare-fun b!690556 () Bool)

(declare-fun res!455086 () Bool)

(assert (=> b!690556 (=> (not res!455086) (not e!393130))))

(assert (=> b!690556 (= res!455086 e!393127)))

(declare-fun res!455096 () Bool)

(assert (=> b!690556 (=> res!455096 e!393127)))

(declare-fun e!393129 () Bool)

(assert (=> b!690556 (= res!455096 e!393129)))

(declare-fun res!455097 () Bool)

(assert (=> b!690556 (=> (not res!455097) (not e!393129))))

(assert (=> b!690556 (= res!455097 (bvsgt from!3004 i!1382))))

(declare-fun b!690557 () Bool)

(declare-fun res!455092 () Bool)

(assert (=> b!690557 (=> (not res!455092) (not e!393130))))

(assert (=> b!690557 (= res!455092 (not (contains!3656 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690547 () Bool)

(declare-fun res!455091 () Bool)

(assert (=> b!690547 (=> (not res!455091) (not e!393130))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690547 (= res!455091 (validKeyInArray!0 k!2843))))

(declare-fun res!455090 () Bool)

(assert (=> start!61740 (=> (not res!455090) (not e!393130))))

(assert (=> start!61740 (= res!455090 (and (bvslt (size!19436 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19436 a!3626))))))

(assert (=> start!61740 e!393130))

(assert (=> start!61740 true))

(declare-fun array_inv!14937 (array!39772) Bool)

(assert (=> start!61740 (array_inv!14937 a!3626)))

(declare-fun b!690558 () Bool)

(declare-fun res!455093 () Bool)

(assert (=> b!690558 (=> (not res!455093) (not e!393130))))

(assert (=> b!690558 (= res!455093 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690559 () Bool)

(assert (=> b!690559 (= e!393129 (contains!3656 acc!681 k!2843))))

(declare-fun b!690560 () Bool)

(declare-fun res!455089 () Bool)

(assert (=> b!690560 (=> (not res!455089) (not e!393130))))

(declare-fun noDuplicate!925 (List!13134) Bool)

(assert (=> b!690560 (= res!455089 (noDuplicate!925 acc!681))))

(declare-fun b!690561 () Bool)

(declare-fun res!455101 () Bool)

(assert (=> b!690561 (=> (not res!455101) (not e!393130))))

(assert (=> b!690561 (= res!455101 (validKeyInArray!0 (select (arr!19054 a!3626) from!3004)))))

(assert (= (and start!61740 res!455090) b!690560))

(assert (= (and b!690560 res!455089) b!690557))

(assert (= (and b!690557 res!455092) b!690548))

(assert (= (and b!690548 res!455094) b!690556))

(assert (= (and b!690556 res!455097) b!690559))

(assert (= (and b!690556 (not res!455096)) b!690552))

(assert (= (and b!690552 res!455098) b!690554))

(assert (= (and b!690556 res!455086) b!690555))

(assert (= (and b!690555 res!455088) b!690546))

(assert (= (and b!690546 res!455087) b!690549))

(assert (= (and b!690549 res!455095) b!690547))

(assert (= (and b!690547 res!455091) b!690558))

(assert (= (and b!690558 res!455093) b!690550))

(assert (= (and b!690550 res!455099) b!690561))

(assert (= (and b!690561 res!455101) b!690551))

(assert (= (and b!690551 res!455100) b!690553))

(declare-fun m!653379 () Bool)

(assert (=> b!690559 m!653379))

(declare-fun m!653381 () Bool)

(assert (=> b!690546 m!653381))

(declare-fun m!653383 () Bool)

(assert (=> b!690560 m!653383))

(assert (=> b!690554 m!653379))

(declare-fun m!653385 () Bool)

(assert (=> b!690551 m!653385))

(declare-fun m!653387 () Bool)

(assert (=> start!61740 m!653387))

(assert (=> b!690561 m!653385))

(assert (=> b!690561 m!653385))

(declare-fun m!653389 () Bool)

(assert (=> b!690561 m!653389))

(declare-fun m!653391 () Bool)

(assert (=> b!690558 m!653391))

(declare-fun m!653393 () Bool)

(assert (=> b!690548 m!653393))

(declare-fun m!653395 () Bool)

(assert (=> b!690555 m!653395))

(declare-fun m!653397 () Bool)

(assert (=> b!690547 m!653397))

(declare-fun m!653399 () Bool)

(assert (=> b!690553 m!653399))

(declare-fun m!653401 () Bool)

(assert (=> b!690557 m!653401))

(push 1)

(assert (not b!690555))

(assert (not b!690553))

(assert (not b!690557))

(assert (not b!690560))

(assert (not b!690548))

(assert (not start!61740))

(assert (not b!690561))

(assert (not b!690559))

(assert (not b!690547))

(assert (not b!690558))

(assert (not b!690546))

(assert (not b!690554))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

