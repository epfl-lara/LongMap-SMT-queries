; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61746 () Bool)

(assert start!61746)

(declare-fun b!690698 () Bool)

(declare-fun res!455091 () Bool)

(declare-fun e!393275 () Bool)

(assert (=> b!690698 (=> (not res!455091) (not e!393275))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(declare-datatypes ((array!39767 0))(
  ( (array!39768 (arr!19052 (Array (_ BitVec 32) (_ BitVec 64))) (size!19437 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39767)

(assert (=> b!690698 (= res!455091 (= (select (arr!19052 a!3626) from!3004) k!2843))))

(declare-fun b!690699 () Bool)

(declare-fun res!455080 () Bool)

(assert (=> b!690699 (=> (not res!455080) (not e!393275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690699 (= res!455080 (validKeyInArray!0 (select (arr!19052 a!3626) from!3004)))))

(declare-fun b!690700 () Bool)

(declare-fun res!455089 () Bool)

(assert (=> b!690700 (=> (not res!455089) (not e!393275))))

(assert (=> b!690700 (= res!455089 (validKeyInArray!0 k!2843))))

(declare-fun b!690701 () Bool)

(declare-fun res!455084 () Bool)

(assert (=> b!690701 (=> (not res!455084) (not e!393275))))

(declare-datatypes ((List!13093 0))(
  ( (Nil!13090) (Cons!13089 (h!14134 (_ BitVec 64)) (t!19360 List!13093)) )
))
(declare-fun acc!681 () List!13093)

(declare-fun contains!3670 (List!13093 (_ BitVec 64)) Bool)

(assert (=> b!690701 (= res!455084 (not (contains!3670 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690702 () Bool)

(declare-fun res!455092 () Bool)

(assert (=> b!690702 (=> (not res!455092) (not e!393275))))

(declare-fun noDuplicate!917 (List!13093) Bool)

(assert (=> b!690702 (= res!455092 (noDuplicate!917 acc!681))))

(declare-fun b!690704 () Bool)

(declare-fun res!455085 () Bool)

(assert (=> b!690704 (=> (not res!455085) (not e!393275))))

(declare-fun arrayNoDuplicates!0 (array!39767 (_ BitVec 32) List!13093) Bool)

(assert (=> b!690704 (= res!455085 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13090))))

(declare-fun b!690705 () Bool)

(declare-fun res!455090 () Bool)

(assert (=> b!690705 (=> (not res!455090) (not e!393275))))

(declare-fun arrayContainsKey!0 (array!39767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690705 (= res!455090 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690706 () Bool)

(declare-fun e!393274 () Bool)

(assert (=> b!690706 (= e!393274 (not (contains!3670 acc!681 k!2843)))))

(declare-fun b!690707 () Bool)

(declare-fun res!455083 () Bool)

(assert (=> b!690707 (=> (not res!455083) (not e!393275))))

(assert (=> b!690707 (= res!455083 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690708 () Bool)

(declare-fun e!393273 () Bool)

(assert (=> b!690708 (= e!393273 e!393274)))

(declare-fun res!455093 () Bool)

(assert (=> b!690708 (=> (not res!455093) (not e!393274))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690708 (= res!455093 (bvsle from!3004 i!1382))))

(declare-fun b!690709 () Bool)

(declare-fun res!455079 () Bool)

(assert (=> b!690709 (=> (not res!455079) (not e!393275))))

(assert (=> b!690709 (= res!455079 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19437 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690710 () Bool)

(declare-fun res!455087 () Bool)

(assert (=> b!690710 (=> (not res!455087) (not e!393275))))

(assert (=> b!690710 (= res!455087 (not (contains!3670 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690711 () Bool)

(declare-fun e!393276 () Bool)

(assert (=> b!690711 (= e!393276 (contains!3670 acc!681 k!2843))))

(declare-fun b!690703 () Bool)

(assert (=> b!690703 (= e!393275 (not true))))

(assert (=> b!690703 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun res!455078 () Bool)

(assert (=> start!61746 (=> (not res!455078) (not e!393275))))

(assert (=> start!61746 (= res!455078 (and (bvslt (size!19437 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19437 a!3626))))))

(assert (=> start!61746 e!393275))

(assert (=> start!61746 true))

(declare-fun array_inv!14848 (array!39767) Bool)

(assert (=> start!61746 (array_inv!14848 a!3626)))

(declare-fun b!690712 () Bool)

(declare-fun res!455082 () Bool)

(assert (=> b!690712 (=> (not res!455082) (not e!393275))))

(assert (=> b!690712 (= res!455082 e!393273)))

(declare-fun res!455088 () Bool)

(assert (=> b!690712 (=> res!455088 e!393273)))

(assert (=> b!690712 (= res!455088 e!393276)))

(declare-fun res!455081 () Bool)

(assert (=> b!690712 (=> (not res!455081) (not e!393276))))

(assert (=> b!690712 (= res!455081 (bvsgt from!3004 i!1382))))

(declare-fun b!690713 () Bool)

(declare-fun res!455086 () Bool)

(assert (=> b!690713 (=> (not res!455086) (not e!393275))))

(assert (=> b!690713 (= res!455086 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19437 a!3626))))))

(assert (= (and start!61746 res!455078) b!690702))

(assert (= (and b!690702 res!455092) b!690701))

(assert (= (and b!690701 res!455084) b!690710))

(assert (= (and b!690710 res!455087) b!690712))

(assert (= (and b!690712 res!455081) b!690711))

(assert (= (and b!690712 (not res!455088)) b!690708))

(assert (= (and b!690708 res!455093) b!690706))

(assert (= (and b!690712 res!455082) b!690704))

(assert (= (and b!690704 res!455085) b!690707))

(assert (= (and b!690707 res!455083) b!690713))

(assert (= (and b!690713 res!455086) b!690700))

(assert (= (and b!690700 res!455089) b!690705))

(assert (= (and b!690705 res!455090) b!690709))

(assert (= (and b!690709 res!455079) b!690699))

(assert (= (and b!690699 res!455080) b!690698))

(assert (= (and b!690698 res!455091) b!690703))

(declare-fun m!654089 () Bool)

(assert (=> b!690700 m!654089))

(declare-fun m!654091 () Bool)

(assert (=> b!690710 m!654091))

(declare-fun m!654093 () Bool)

(assert (=> b!690702 m!654093))

(declare-fun m!654095 () Bool)

(assert (=> b!690698 m!654095))

(declare-fun m!654097 () Bool)

(assert (=> b!690701 m!654097))

(declare-fun m!654099 () Bool)

(assert (=> b!690706 m!654099))

(assert (=> b!690699 m!654095))

(assert (=> b!690699 m!654095))

(declare-fun m!654101 () Bool)

(assert (=> b!690699 m!654101))

(declare-fun m!654103 () Bool)

(assert (=> b!690704 m!654103))

(declare-fun m!654105 () Bool)

(assert (=> start!61746 m!654105))

(declare-fun m!654107 () Bool)

(assert (=> b!690705 m!654107))

(declare-fun m!654109 () Bool)

(assert (=> b!690703 m!654109))

(declare-fun m!654111 () Bool)

(assert (=> b!690707 m!654111))

(assert (=> b!690711 m!654099))

(push 1)

(assert (not b!690702))

(assert (not b!690710))

(assert (not b!690706))

(assert (not b!690707))

(assert (not b!690705))

(assert (not b!690704))

(assert (not start!61746))

(assert (not b!690700))

(assert (not b!690703))

(assert (not b!690711))

(assert (not b!690699))

(assert (not b!690701))

(check-sat)

(pop 1)

