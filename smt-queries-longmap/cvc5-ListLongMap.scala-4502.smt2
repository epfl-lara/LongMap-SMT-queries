; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62480 () Bool)

(assert start!62480)

(declare-fun b!703162 () Bool)

(declare-fun res!466981 () Bool)

(declare-fun e!397578 () Bool)

(assert (=> b!703162 (=> (not res!466981) (not e!397578))))

(declare-datatypes ((List!13277 0))(
  ( (Nil!13274) (Cons!13273 (h!14318 (_ BitVec 64)) (t!19559 List!13277)) )
))
(declare-fun acc!652 () List!13277)

(declare-fun contains!3854 (List!13277 (_ BitVec 64)) Bool)

(assert (=> b!703162 (= res!466981 (not (contains!3854 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703163 () Bool)

(declare-fun res!466972 () Bool)

(assert (=> b!703163 (=> (not res!466972) (not e!397578))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!703163 (= res!466972 (validKeyInArray!0 k!2824))))

(declare-fun b!703164 () Bool)

(declare-fun res!466988 () Bool)

(assert (=> b!703164 (=> (not res!466988) (not e!397578))))

(declare-datatypes ((array!40159 0))(
  ( (array!40160 (arr!19236 (Array (_ BitVec 32) (_ BitVec 64))) (size!19621 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40159)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!703164 (= res!466988 (not (validKeyInArray!0 (select (arr!19236 a!3591) from!2969))))))

(declare-fun b!703165 () Bool)

(declare-fun res!466985 () Bool)

(assert (=> b!703165 (=> (not res!466985) (not e!397578))))

(declare-fun newAcc!49 () List!13277)

(declare-fun noDuplicate!1101 (List!13277) Bool)

(assert (=> b!703165 (= res!466985 (noDuplicate!1101 newAcc!49))))

(declare-fun b!703166 () Bool)

(declare-fun res!466984 () Bool)

(assert (=> b!703166 (=> (not res!466984) (not e!397578))))

(declare-fun -!264 (List!13277 (_ BitVec 64)) List!13277)

(assert (=> b!703166 (= res!466984 (= (-!264 newAcc!49 k!2824) acc!652))))

(declare-fun b!703167 () Bool)

(declare-fun res!466975 () Bool)

(assert (=> b!703167 (=> (not res!466975) (not e!397578))))

(declare-fun arrayContainsKey!0 (array!40159 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!703167 (= res!466975 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!703168 () Bool)

(declare-fun res!466978 () Bool)

(assert (=> b!703168 (=> (not res!466978) (not e!397578))))

(declare-fun arrayNoDuplicates!0 (array!40159 (_ BitVec 32) List!13277) Bool)

(assert (=> b!703168 (= res!466978 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!703169 () Bool)

(declare-fun res!466983 () Bool)

(assert (=> b!703169 (=> (not res!466983) (not e!397578))))

(assert (=> b!703169 (= res!466983 (not (contains!3854 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!703170 () Bool)

(declare-fun res!466989 () Bool)

(assert (=> b!703170 (=> (not res!466989) (not e!397578))))

(assert (=> b!703170 (= res!466989 (contains!3854 newAcc!49 k!2824))))

(declare-fun b!703171 () Bool)

(assert (=> b!703171 (= e!397578 false)))

(declare-fun lt!317772 () Bool)

(assert (=> b!703171 (= lt!317772 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!703172 () Bool)

(declare-fun res!466976 () Bool)

(assert (=> b!703172 (=> (not res!466976) (not e!397578))))

(assert (=> b!703172 (= res!466976 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!703173 () Bool)

(declare-fun res!466982 () Bool)

(assert (=> b!703173 (=> (not res!466982) (not e!397578))))

(assert (=> b!703173 (= res!466982 (not (contains!3854 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!466987 () Bool)

(assert (=> start!62480 (=> (not res!466987) (not e!397578))))

(assert (=> start!62480 (= res!466987 (and (bvslt (size!19621 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19621 a!3591))))))

(assert (=> start!62480 e!397578))

(assert (=> start!62480 true))

(declare-fun array_inv!15032 (array!40159) Bool)

(assert (=> start!62480 (array_inv!15032 a!3591)))

(declare-fun b!703174 () Bool)

(declare-fun res!466980 () Bool)

(assert (=> b!703174 (=> (not res!466980) (not e!397578))))

(assert (=> b!703174 (= res!466980 (noDuplicate!1101 acc!652))))

(declare-fun b!703175 () Bool)

(declare-fun res!466977 () Bool)

(assert (=> b!703175 (=> (not res!466977) (not e!397578))))

(assert (=> b!703175 (= res!466977 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!703176 () Bool)

(declare-fun res!466979 () Bool)

(assert (=> b!703176 (=> (not res!466979) (not e!397578))))

(assert (=> b!703176 (= res!466979 (not (contains!3854 acc!652 k!2824)))))

(declare-fun b!703177 () Bool)

(declare-fun res!466973 () Bool)

(assert (=> b!703177 (=> (not res!466973) (not e!397578))))

(declare-fun subseq!299 (List!13277 List!13277) Bool)

(assert (=> b!703177 (= res!466973 (subseq!299 acc!652 newAcc!49))))

(declare-fun b!703178 () Bool)

(declare-fun res!466986 () Bool)

(assert (=> b!703178 (=> (not res!466986) (not e!397578))))

(assert (=> b!703178 (= res!466986 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19621 a!3591)))))

(declare-fun b!703179 () Bool)

(declare-fun res!466974 () Bool)

(assert (=> b!703179 (=> (not res!466974) (not e!397578))))

(assert (=> b!703179 (= res!466974 (not (contains!3854 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62480 res!466987) b!703174))

(assert (= (and b!703174 res!466980) b!703165))

(assert (= (and b!703165 res!466985) b!703173))

(assert (= (and b!703173 res!466982) b!703162))

(assert (= (and b!703162 res!466981) b!703175))

(assert (= (and b!703175 res!466977) b!703176))

(assert (= (and b!703176 res!466979) b!703163))

(assert (= (and b!703163 res!466972) b!703168))

(assert (= (and b!703168 res!466978) b!703177))

(assert (= (and b!703177 res!466973) b!703170))

(assert (= (and b!703170 res!466989) b!703166))

(assert (= (and b!703166 res!466984) b!703179))

(assert (= (and b!703179 res!466974) b!703169))

(assert (= (and b!703169 res!466983) b!703178))

(assert (= (and b!703178 res!466986) b!703164))

(assert (= (and b!703164 res!466988) b!703172))

(assert (= (and b!703172 res!466976) b!703167))

(assert (= (and b!703167 res!466975) b!703171))

(declare-fun m!662083 () Bool)

(assert (=> b!703163 m!662083))

(declare-fun m!662085 () Bool)

(assert (=> b!703177 m!662085))

(declare-fun m!662087 () Bool)

(assert (=> b!703169 m!662087))

(declare-fun m!662089 () Bool)

(assert (=> b!703170 m!662089))

(declare-fun m!662091 () Bool)

(assert (=> b!703165 m!662091))

(declare-fun m!662093 () Bool)

(assert (=> b!703173 m!662093))

(declare-fun m!662095 () Bool)

(assert (=> start!62480 m!662095))

(declare-fun m!662097 () Bool)

(assert (=> b!703166 m!662097))

(declare-fun m!662099 () Bool)

(assert (=> b!703179 m!662099))

(declare-fun m!662101 () Bool)

(assert (=> b!703162 m!662101))

(declare-fun m!662103 () Bool)

(assert (=> b!703168 m!662103))

(declare-fun m!662105 () Bool)

(assert (=> b!703164 m!662105))

(assert (=> b!703164 m!662105))

(declare-fun m!662107 () Bool)

(assert (=> b!703164 m!662107))

(declare-fun m!662109 () Bool)

(assert (=> b!703176 m!662109))

(declare-fun m!662111 () Bool)

(assert (=> b!703171 m!662111))

(declare-fun m!662113 () Bool)

(assert (=> b!703174 m!662113))

(declare-fun m!662115 () Bool)

(assert (=> b!703167 m!662115))

(declare-fun m!662117 () Bool)

(assert (=> b!703175 m!662117))

(push 1)

(assert (not start!62480))

(assert (not b!703171))

(assert (not b!703162))

(assert (not b!703169))

(assert (not b!703168))

(assert (not b!703173))

(assert (not b!703175))

(assert (not b!703179))

(assert (not b!703166))

(assert (not b!703165))

(assert (not b!703167))

(assert (not b!703170))

(assert (not b!703164))

(assert (not b!703174))

(assert (not b!703176))

(assert (not b!703163))

(assert (not b!703177))

(check-sat)

(pop 1)

