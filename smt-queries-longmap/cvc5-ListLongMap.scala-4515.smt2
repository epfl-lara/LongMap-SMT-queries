; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62550 () Bool)

(assert start!62550)

(declare-fun b!705088 () Bool)

(declare-fun e!397643 () Bool)

(assert (=> b!705088 (= e!397643 false)))

(declare-datatypes ((array!40240 0))(
  ( (array!40241 (arr!19276 (Array (_ BitVec 32) (_ BitVec 64))) (size!19658 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40240)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((List!13356 0))(
  ( (Nil!13353) (Cons!13352 (h!14397 (_ BitVec 64)) (t!19629 List!13356)) )
))
(declare-fun acc!652 () List!13356)

(declare-fun lt!317643 () Bool)

(declare-fun arrayNoDuplicates!0 (array!40240 (_ BitVec 32) List!13356) Bool)

(assert (=> b!705088 (= lt!317643 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705089 () Bool)

(declare-fun res!469064 () Bool)

(assert (=> b!705089 (=> (not res!469064) (not e!397643))))

(declare-fun newAcc!49 () List!13356)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun -!305 (List!13356 (_ BitVec 64)) List!13356)

(assert (=> b!705089 (= res!469064 (= (-!305 newAcc!49 k!2824) acc!652))))

(declare-fun b!705090 () Bool)

(declare-fun res!469063 () Bool)

(assert (=> b!705090 (=> (not res!469063) (not e!397643))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705090 (= res!469063 (validKeyInArray!0 k!2824))))

(declare-fun b!705091 () Bool)

(declare-fun res!469072 () Bool)

(assert (=> b!705091 (=> (not res!469072) (not e!397643))))

(declare-fun noDuplicate!1147 (List!13356) Bool)

(assert (=> b!705091 (= res!469072 (noDuplicate!1147 acc!652))))

(declare-fun b!705092 () Bool)

(declare-fun res!469074 () Bool)

(assert (=> b!705092 (=> (not res!469074) (not e!397643))))

(declare-fun contains!3878 (List!13356 (_ BitVec 64)) Bool)

(assert (=> b!705092 (= res!469074 (not (contains!3878 acc!652 k!2824)))))

(declare-fun b!705093 () Bool)

(declare-fun res!469073 () Bool)

(assert (=> b!705093 (=> (not res!469073) (not e!397643))))

(assert (=> b!705093 (= res!469073 (not (contains!3878 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705094 () Bool)

(declare-fun res!469068 () Bool)

(assert (=> b!705094 (=> (not res!469068) (not e!397643))))

(assert (=> b!705094 (= res!469068 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!705095 () Bool)

(declare-fun res!469062 () Bool)

(assert (=> b!705095 (=> (not res!469062) (not e!397643))))

(assert (=> b!705095 (= res!469062 (contains!3878 newAcc!49 k!2824))))

(declare-fun b!705096 () Bool)

(declare-fun res!469067 () Bool)

(assert (=> b!705096 (=> (not res!469067) (not e!397643))))

(declare-fun arrayContainsKey!0 (array!40240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705096 (= res!469067 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!705097 () Bool)

(declare-fun res!469061 () Bool)

(assert (=> b!705097 (=> (not res!469061) (not e!397643))))

(assert (=> b!705097 (= res!469061 (not (contains!3878 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!469059 () Bool)

(assert (=> start!62550 (=> (not res!469059) (not e!397643))))

(assert (=> start!62550 (= res!469059 (and (bvslt (size!19658 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19658 a!3591))))))

(assert (=> start!62550 e!397643))

(assert (=> start!62550 true))

(declare-fun array_inv!15159 (array!40240) Bool)

(assert (=> start!62550 (array_inv!15159 a!3591)))

(declare-fun b!705098 () Bool)

(declare-fun res!469065 () Bool)

(assert (=> b!705098 (=> (not res!469065) (not e!397643))))

(declare-fun subseq!340 (List!13356 List!13356) Bool)

(assert (=> b!705098 (= res!469065 (subseq!340 acc!652 newAcc!49))))

(declare-fun b!705099 () Bool)

(declare-fun res!469070 () Bool)

(assert (=> b!705099 (=> (not res!469070) (not e!397643))))

(assert (=> b!705099 (= res!469070 (not (validKeyInArray!0 (select (arr!19276 a!3591) from!2969))))))

(declare-fun b!705100 () Bool)

(declare-fun res!469060 () Bool)

(assert (=> b!705100 (=> (not res!469060) (not e!397643))))

(assert (=> b!705100 (= res!469060 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19658 a!3591)))))

(declare-fun b!705101 () Bool)

(declare-fun res!469066 () Bool)

(assert (=> b!705101 (=> (not res!469066) (not e!397643))))

(assert (=> b!705101 (= res!469066 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705102 () Bool)

(declare-fun res!469071 () Bool)

(assert (=> b!705102 (=> (not res!469071) (not e!397643))))

(assert (=> b!705102 (= res!469071 (not (contains!3878 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705103 () Bool)

(declare-fun res!469075 () Bool)

(assert (=> b!705103 (=> (not res!469075) (not e!397643))))

(assert (=> b!705103 (= res!469075 (noDuplicate!1147 newAcc!49))))

(declare-fun b!705104 () Bool)

(declare-fun res!469058 () Bool)

(assert (=> b!705104 (=> (not res!469058) (not e!397643))))

(assert (=> b!705104 (= res!469058 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705105 () Bool)

(declare-fun res!469069 () Bool)

(assert (=> b!705105 (=> (not res!469069) (not e!397643))))

(assert (=> b!705105 (= res!469069 (not (contains!3878 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62550 res!469059) b!705091))

(assert (= (and b!705091 res!469072) b!705103))

(assert (= (and b!705103 res!469075) b!705097))

(assert (= (and b!705097 res!469061) b!705102))

(assert (= (and b!705102 res!469071) b!705096))

(assert (= (and b!705096 res!469067) b!705092))

(assert (= (and b!705092 res!469074) b!705090))

(assert (= (and b!705090 res!469063) b!705094))

(assert (= (and b!705094 res!469068) b!705098))

(assert (= (and b!705098 res!469065) b!705095))

(assert (= (and b!705095 res!469062) b!705089))

(assert (= (and b!705089 res!469064) b!705105))

(assert (= (and b!705105 res!469069) b!705093))

(assert (= (and b!705093 res!469073) b!705100))

(assert (= (and b!705100 res!469060) b!705099))

(assert (= (and b!705099 res!469070) b!705101))

(assert (= (and b!705101 res!469066) b!705104))

(assert (= (and b!705104 res!469058) b!705088))

(declare-fun m!662799 () Bool)

(assert (=> b!705091 m!662799))

(declare-fun m!662801 () Bool)

(assert (=> b!705103 m!662801))

(declare-fun m!662803 () Bool)

(assert (=> b!705095 m!662803))

(declare-fun m!662805 () Bool)

(assert (=> b!705099 m!662805))

(assert (=> b!705099 m!662805))

(declare-fun m!662807 () Bool)

(assert (=> b!705099 m!662807))

(declare-fun m!662809 () Bool)

(assert (=> start!62550 m!662809))

(declare-fun m!662811 () Bool)

(assert (=> b!705105 m!662811))

(declare-fun m!662813 () Bool)

(assert (=> b!705097 m!662813))

(declare-fun m!662815 () Bool)

(assert (=> b!705092 m!662815))

(declare-fun m!662817 () Bool)

(assert (=> b!705094 m!662817))

(declare-fun m!662819 () Bool)

(assert (=> b!705088 m!662819))

(declare-fun m!662821 () Bool)

(assert (=> b!705093 m!662821))

(declare-fun m!662823 () Bool)

(assert (=> b!705104 m!662823))

(declare-fun m!662825 () Bool)

(assert (=> b!705098 m!662825))

(declare-fun m!662827 () Bool)

(assert (=> b!705102 m!662827))

(declare-fun m!662829 () Bool)

(assert (=> b!705089 m!662829))

(declare-fun m!662831 () Bool)

(assert (=> b!705096 m!662831))

(declare-fun m!662833 () Bool)

(assert (=> b!705090 m!662833))

(push 1)

(assert (not b!705096))

(assert (not b!705094))

(assert (not b!705104))

(assert (not b!705097))

(assert (not b!705105))

(assert (not b!705099))

(assert (not b!705089))

(assert (not b!705092))

(assert (not b!705091))

(assert (not start!62550))

(assert (not b!705102))

(assert (not b!705088))

(assert (not b!705090))

(assert (not b!705098))

(assert (not b!705103))

(assert (not b!705095))

(assert (not b!705093))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

