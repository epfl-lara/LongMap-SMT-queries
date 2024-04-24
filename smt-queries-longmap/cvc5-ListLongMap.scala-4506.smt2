; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62564 () Bool)

(assert start!62564)

(declare-fun b!704111 () Bool)

(declare-fun res!467839 () Bool)

(declare-fun e!397778 () Bool)

(assert (=> b!704111 (=> (not res!467839) (not e!397778))))

(declare-datatypes ((List!13193 0))(
  ( (Nil!13190) (Cons!13189 (h!14237 (_ BitVec 64)) (t!19467 List!13193)) )
))
(declare-fun newAcc!49 () List!13193)

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun contains!3845 (List!13193 (_ BitVec 64)) Bool)

(assert (=> b!704111 (= res!467839 (contains!3845 newAcc!49 k!2824))))

(declare-fun b!704112 () Bool)

(declare-fun res!467834 () Bool)

(assert (=> b!704112 (=> (not res!467834) (not e!397778))))

(declare-fun acc!652 () List!13193)

(declare-fun subseq!313 (List!13193 List!13193) Bool)

(assert (=> b!704112 (= res!467834 (subseq!313 acc!652 newAcc!49))))

(declare-fun b!704113 () Bool)

(declare-fun res!467831 () Bool)

(assert (=> b!704113 (=> (not res!467831) (not e!397778))))

(assert (=> b!704113 (= res!467831 (not (contains!3845 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704114 () Bool)

(declare-fun res!467835 () Bool)

(assert (=> b!704114 (=> (not res!467835) (not e!397778))))

(assert (=> b!704114 (= res!467835 (not (contains!3845 acc!652 k!2824)))))

(declare-fun b!704115 () Bool)

(declare-fun res!467828 () Bool)

(assert (=> b!704115 (=> (not res!467828) (not e!397778))))

(declare-datatypes ((array!40183 0))(
  ( (array!40184 (arr!19245 (Array (_ BitVec 32) (_ BitVec 64))) (size!19628 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40183)

(declare-fun from!2969 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!40183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704115 (= res!467828 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!704116 () Bool)

(declare-fun res!467826 () Bool)

(assert (=> b!704116 (=> (not res!467826) (not e!397778))))

(declare-fun arrayNoDuplicates!0 (array!40183 (_ BitVec 32) List!13193) Bool)

(assert (=> b!704116 (= res!467826 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704117 () Bool)

(declare-fun res!467836 () Bool)

(assert (=> b!704117 (=> (not res!467836) (not e!397778))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704117 (= res!467836 (not (validKeyInArray!0 (select (arr!19245 a!3591) from!2969))))))

(declare-fun b!704118 () Bool)

(declare-fun res!467832 () Bool)

(assert (=> b!704118 (=> (not res!467832) (not e!397778))))

(assert (=> b!704118 (= res!467832 (not (contains!3845 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704120 () Bool)

(declare-fun res!467837 () Bool)

(assert (=> b!704120 (=> (not res!467837) (not e!397778))))

(assert (=> b!704120 (= res!467837 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!704121 () Bool)

(declare-fun res!467822 () Bool)

(assert (=> b!704121 (=> (not res!467822) (not e!397778))))

(declare-fun noDuplicate!1119 (List!13193) Bool)

(assert (=> b!704121 (= res!467822 (noDuplicate!1119 acc!652))))

(declare-fun b!704122 () Bool)

(declare-fun res!467838 () Bool)

(assert (=> b!704122 (=> (not res!467838) (not e!397778))))

(assert (=> b!704122 (= res!467838 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704123 () Bool)

(assert (=> b!704123 (= e!397778 false)))

(declare-fun lt!317913 () Bool)

(assert (=> b!704123 (= lt!317913 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704124 () Bool)

(declare-fun res!467823 () Bool)

(assert (=> b!704124 (=> (not res!467823) (not e!397778))))

(assert (=> b!704124 (= res!467823 (noDuplicate!1119 newAcc!49))))

(declare-fun b!704125 () Bool)

(declare-fun res!467825 () Bool)

(assert (=> b!704125 (=> (not res!467825) (not e!397778))))

(assert (=> b!704125 (= res!467825 (validKeyInArray!0 k!2824))))

(declare-fun b!704126 () Bool)

(declare-fun res!467827 () Bool)

(assert (=> b!704126 (=> (not res!467827) (not e!397778))))

(assert (=> b!704126 (= res!467827 (not (contains!3845 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704127 () Bool)

(declare-fun res!467829 () Bool)

(assert (=> b!704127 (=> (not res!467829) (not e!397778))))

(declare-fun -!277 (List!13193 (_ BitVec 64)) List!13193)

(assert (=> b!704127 (= res!467829 (= (-!277 newAcc!49 k!2824) acc!652))))

(declare-fun b!704128 () Bool)

(declare-fun res!467824 () Bool)

(assert (=> b!704128 (=> (not res!467824) (not e!397778))))

(assert (=> b!704128 (= res!467824 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19628 a!3591)))))

(declare-fun b!704119 () Bool)

(declare-fun res!467833 () Bool)

(assert (=> b!704119 (=> (not res!467833) (not e!397778))))

(assert (=> b!704119 (= res!467833 (not (contains!3845 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!467830 () Bool)

(assert (=> start!62564 (=> (not res!467830) (not e!397778))))

(assert (=> start!62564 (= res!467830 (and (bvslt (size!19628 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19628 a!3591))))))

(assert (=> start!62564 e!397778))

(assert (=> start!62564 true))

(declare-fun array_inv!15104 (array!40183) Bool)

(assert (=> start!62564 (array_inv!15104 a!3591)))

(assert (= (and start!62564 res!467830) b!704121))

(assert (= (and b!704121 res!467822) b!704124))

(assert (= (and b!704124 res!467823) b!704126))

(assert (= (and b!704126 res!467827) b!704118))

(assert (= (and b!704118 res!467832) b!704122))

(assert (= (and b!704122 res!467838) b!704114))

(assert (= (and b!704114 res!467835) b!704125))

(assert (= (and b!704125 res!467825) b!704116))

(assert (= (and b!704116 res!467826) b!704112))

(assert (= (and b!704112 res!467834) b!704111))

(assert (= (and b!704111 res!467839) b!704127))

(assert (= (and b!704127 res!467829) b!704119))

(assert (= (and b!704119 res!467833) b!704113))

(assert (= (and b!704113 res!467831) b!704128))

(assert (= (and b!704128 res!467824) b!704117))

(assert (= (and b!704117 res!467836) b!704120))

(assert (= (and b!704120 res!467837) b!704115))

(assert (= (and b!704115 res!467828) b!704123))

(declare-fun m!663243 () Bool)

(assert (=> b!704121 m!663243))

(declare-fun m!663245 () Bool)

(assert (=> b!704115 m!663245))

(declare-fun m!663247 () Bool)

(assert (=> b!704123 m!663247))

(declare-fun m!663249 () Bool)

(assert (=> b!704111 m!663249))

(declare-fun m!663251 () Bool)

(assert (=> start!62564 m!663251))

(declare-fun m!663253 () Bool)

(assert (=> b!704113 m!663253))

(declare-fun m!663255 () Bool)

(assert (=> b!704122 m!663255))

(declare-fun m!663257 () Bool)

(assert (=> b!704114 m!663257))

(declare-fun m!663259 () Bool)

(assert (=> b!704124 m!663259))

(declare-fun m!663261 () Bool)

(assert (=> b!704118 m!663261))

(declare-fun m!663263 () Bool)

(assert (=> b!704112 m!663263))

(declare-fun m!663265 () Bool)

(assert (=> b!704119 m!663265))

(declare-fun m!663267 () Bool)

(assert (=> b!704127 m!663267))

(declare-fun m!663269 () Bool)

(assert (=> b!704125 m!663269))

(declare-fun m!663271 () Bool)

(assert (=> b!704117 m!663271))

(assert (=> b!704117 m!663271))

(declare-fun m!663273 () Bool)

(assert (=> b!704117 m!663273))

(declare-fun m!663275 () Bool)

(assert (=> b!704116 m!663275))

(declare-fun m!663277 () Bool)

(assert (=> b!704126 m!663277))

(push 1)

(assert (not b!704117))

(assert (not b!704121))

(assert (not b!704114))

(assert (not b!704127))

(assert (not b!704111))

(assert (not start!62564))

(assert (not b!704118))

(assert (not b!704124))

(assert (not b!704123))

(assert (not b!704113))

(assert (not b!704126))

(assert (not b!704125))

(assert (not b!704112))

(assert (not b!704116))

(assert (not b!704115))

(assert (not b!704119))

(assert (not b!704122))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

