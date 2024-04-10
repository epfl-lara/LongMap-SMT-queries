; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62520 () Bool)

(assert start!62520)

(declare-fun b!704242 () Bool)

(declare-fun res!468069 () Bool)

(declare-fun e!397699 () Bool)

(assert (=> b!704242 (=> (not res!468069) (not e!397699))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!704242 (= res!468069 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704243 () Bool)

(declare-fun res!468063 () Bool)

(assert (=> b!704243 (=> (not res!468063) (not e!397699))))

(declare-datatypes ((List!13297 0))(
  ( (Nil!13294) (Cons!13293 (h!14338 (_ BitVec 64)) (t!19579 List!13297)) )
))
(declare-fun acc!652 () List!13297)

(declare-fun noDuplicate!1121 (List!13297) Bool)

(assert (=> b!704243 (= res!468063 (noDuplicate!1121 acc!652))))

(declare-fun b!704244 () Bool)

(declare-fun res!468054 () Bool)

(assert (=> b!704244 (=> (not res!468054) (not e!397699))))

(declare-fun newAcc!49 () List!13297)

(declare-fun contains!3874 (List!13297 (_ BitVec 64)) Bool)

(assert (=> b!704244 (= res!468054 (not (contains!3874 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704245 () Bool)

(declare-fun res!468068 () Bool)

(assert (=> b!704245 (=> (not res!468068) (not e!397699))))

(assert (=> b!704245 (= res!468068 (not (contains!3874 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704246 () Bool)

(declare-fun res!468062 () Bool)

(assert (=> b!704246 (=> (not res!468062) (not e!397699))))

(declare-datatypes ((array!40199 0))(
  ( (array!40200 (arr!19256 (Array (_ BitVec 32) (_ BitVec 64))) (size!19641 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40199)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704246 (= res!468062 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun res!468065 () Bool)

(assert (=> start!62520 (=> (not res!468065) (not e!397699))))

(assert (=> start!62520 (= res!468065 (and (bvslt (size!19641 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19641 a!3591))))))

(assert (=> start!62520 e!397699))

(assert (=> start!62520 true))

(declare-fun array_inv!15052 (array!40199) Bool)

(assert (=> start!62520 (array_inv!15052 a!3591)))

(declare-fun b!704247 () Bool)

(declare-fun res!468055 () Bool)

(assert (=> b!704247 (=> (not res!468055) (not e!397699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704247 (= res!468055 (validKeyInArray!0 k!2824))))

(declare-fun b!704248 () Bool)

(declare-fun res!468061 () Bool)

(assert (=> b!704248 (=> (not res!468061) (not e!397699))))

(assert (=> b!704248 (= res!468061 (noDuplicate!1121 newAcc!49))))

(declare-fun b!704249 () Bool)

(declare-fun res!468058 () Bool)

(assert (=> b!704249 (=> (not res!468058) (not e!397699))))

(declare-fun arrayNoDuplicates!0 (array!40199 (_ BitVec 32) List!13297) Bool)

(assert (=> b!704249 (= res!468058 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704250 () Bool)

(declare-fun res!468057 () Bool)

(assert (=> b!704250 (=> (not res!468057) (not e!397699))))

(assert (=> b!704250 (= res!468057 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704251 () Bool)

(declare-fun res!468067 () Bool)

(assert (=> b!704251 (=> (not res!468067) (not e!397699))))

(assert (=> b!704251 (= res!468067 (not (contains!3874 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704252 () Bool)

(declare-fun res!468060 () Bool)

(assert (=> b!704252 (=> (not res!468060) (not e!397699))))

(assert (=> b!704252 (= res!468060 (not (contains!3874 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704253 () Bool)

(declare-fun res!468064 () Bool)

(assert (=> b!704253 (=> (not res!468064) (not e!397699))))

(assert (=> b!704253 (= res!468064 (contains!3874 newAcc!49 k!2824))))

(declare-fun b!704254 () Bool)

(declare-fun res!468066 () Bool)

(assert (=> b!704254 (=> (not res!468066) (not e!397699))))

(assert (=> b!704254 (= res!468066 (not (contains!3874 acc!652 k!2824)))))

(declare-fun b!704255 () Bool)

(declare-fun res!468059 () Bool)

(assert (=> b!704255 (=> (not res!468059) (not e!397699))))

(assert (=> b!704255 (= res!468059 (not (validKeyInArray!0 (select (arr!19256 a!3591) from!2969))))))

(declare-fun b!704256 () Bool)

(declare-fun res!468053 () Bool)

(assert (=> b!704256 (=> (not res!468053) (not e!397699))))

(assert (=> b!704256 (= res!468053 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19641 a!3591)))))

(declare-fun b!704257 () Bool)

(declare-fun res!468052 () Bool)

(assert (=> b!704257 (=> (not res!468052) (not e!397699))))

(declare-fun subseq!319 (List!13297 List!13297) Bool)

(assert (=> b!704257 (= res!468052 (subseq!319 acc!652 newAcc!49))))

(declare-fun b!704258 () Bool)

(assert (=> b!704258 (= e!397699 false)))

(declare-fun lt!317832 () Bool)

(assert (=> b!704258 (= lt!317832 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704259 () Bool)

(declare-fun res!468056 () Bool)

(assert (=> b!704259 (=> (not res!468056) (not e!397699))))

(declare-fun -!284 (List!13297 (_ BitVec 64)) List!13297)

(assert (=> b!704259 (= res!468056 (= (-!284 newAcc!49 k!2824) acc!652))))

(assert (= (and start!62520 res!468065) b!704243))

(assert (= (and b!704243 res!468063) b!704248))

(assert (= (and b!704248 res!468061) b!704252))

(assert (= (and b!704252 res!468060) b!704251))

(assert (= (and b!704251 res!468067) b!704250))

(assert (= (and b!704250 res!468057) b!704254))

(assert (= (and b!704254 res!468066) b!704247))

(assert (= (and b!704247 res!468055) b!704249))

(assert (= (and b!704249 res!468058) b!704257))

(assert (= (and b!704257 res!468052) b!704253))

(assert (= (and b!704253 res!468064) b!704259))

(assert (= (and b!704259 res!468056) b!704244))

(assert (= (and b!704244 res!468054) b!704245))

(assert (= (and b!704245 res!468068) b!704256))

(assert (= (and b!704256 res!468053) b!704255))

(assert (= (and b!704255 res!468059) b!704242))

(assert (= (and b!704242 res!468069) b!704246))

(assert (= (and b!704246 res!468062) b!704258))

(declare-fun m!662803 () Bool)

(assert (=> b!704259 m!662803))

(declare-fun m!662805 () Bool)

(assert (=> b!704258 m!662805))

(declare-fun m!662807 () Bool)

(assert (=> b!704251 m!662807))

(declare-fun m!662809 () Bool)

(assert (=> b!704254 m!662809))

(declare-fun m!662811 () Bool)

(assert (=> b!704250 m!662811))

(declare-fun m!662813 () Bool)

(assert (=> b!704253 m!662813))

(declare-fun m!662815 () Bool)

(assert (=> b!704245 m!662815))

(declare-fun m!662817 () Bool)

(assert (=> start!62520 m!662817))

(declare-fun m!662819 () Bool)

(assert (=> b!704243 m!662819))

(declare-fun m!662821 () Bool)

(assert (=> b!704252 m!662821))

(declare-fun m!662823 () Bool)

(assert (=> b!704246 m!662823))

(declare-fun m!662825 () Bool)

(assert (=> b!704247 m!662825))

(declare-fun m!662827 () Bool)

(assert (=> b!704249 m!662827))

(declare-fun m!662829 () Bool)

(assert (=> b!704255 m!662829))

(assert (=> b!704255 m!662829))

(declare-fun m!662831 () Bool)

(assert (=> b!704255 m!662831))

(declare-fun m!662833 () Bool)

(assert (=> b!704248 m!662833))

(declare-fun m!662835 () Bool)

(assert (=> b!704257 m!662835))

(declare-fun m!662837 () Bool)

(assert (=> b!704244 m!662837))

(push 1)

(assert (not b!704246))

(assert (not b!704249))

(assert (not b!704258))

(assert (not b!704254))

(assert (not b!704257))

(assert (not start!62520))

(assert (not b!704248))

(assert (not b!704250))

(assert (not b!704252))

(assert (not b!704253))

(assert (not b!704251))

(assert (not b!704259))

(assert (not b!704247))

(assert (not b!704244))

(assert (not b!704255))

(assert (not b!704245))

(assert (not b!704243))

(check-sat)

