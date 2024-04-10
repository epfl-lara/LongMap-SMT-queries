; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62640 () Bool)

(assert start!62640)

(declare-fun b!707136 () Bool)

(declare-fun res!470953 () Bool)

(declare-fun e!398059 () Bool)

(assert (=> b!707136 (=> (not res!470953) (not e!398059))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!707136 (= res!470953 (validKeyInArray!0 k!2824))))

(declare-fun res!470950 () Bool)

(assert (=> start!62640 (=> (not res!470950) (not e!398059))))

(declare-datatypes ((array!40319 0))(
  ( (array!40320 (arr!19316 (Array (_ BitVec 32) (_ BitVec 64))) (size!19701 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40319)

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> start!62640 (= res!470950 (and (bvslt (size!19701 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19701 a!3591))))))

(assert (=> start!62640 e!398059))

(assert (=> start!62640 true))

(declare-fun array_inv!15112 (array!40319) Bool)

(assert (=> start!62640 (array_inv!15112 a!3591)))

(declare-fun b!707137 () Bool)

(assert (=> b!707137 (= e!398059 false)))

(declare-fun lt!317994 () Bool)

(declare-datatypes ((List!13357 0))(
  ( (Nil!13354) (Cons!13353 (h!14398 (_ BitVec 64)) (t!19639 List!13357)) )
))
(declare-fun newAcc!49 () List!13357)

(declare-fun contains!3934 (List!13357 (_ BitVec 64)) Bool)

(assert (=> b!707137 (= lt!317994 (contains!3934 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!707138 () Bool)

(declare-fun res!470954 () Bool)

(assert (=> b!707138 (=> (not res!470954) (not e!398059))))

(declare-fun acc!652 () List!13357)

(declare-fun -!344 (List!13357 (_ BitVec 64)) List!13357)

(assert (=> b!707138 (= res!470954 (= (-!344 newAcc!49 k!2824) acc!652))))

(declare-fun b!707139 () Bool)

(declare-fun res!470948 () Bool)

(assert (=> b!707139 (=> (not res!470948) (not e!398059))))

(declare-fun arrayContainsKey!0 (array!40319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!707139 (= res!470948 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!707140 () Bool)

(declare-fun res!470952 () Bool)

(assert (=> b!707140 (=> (not res!470952) (not e!398059))))

(assert (=> b!707140 (= res!470952 (not (contains!3934 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707141 () Bool)

(declare-fun res!470946 () Bool)

(assert (=> b!707141 (=> (not res!470946) (not e!398059))))

(assert (=> b!707141 (= res!470946 (not (contains!3934 acc!652 k!2824)))))

(declare-fun b!707142 () Bool)

(declare-fun res!470958 () Bool)

(assert (=> b!707142 (=> (not res!470958) (not e!398059))))

(declare-fun subseq!379 (List!13357 List!13357) Bool)

(assert (=> b!707142 (= res!470958 (subseq!379 acc!652 newAcc!49))))

(declare-fun b!707143 () Bool)

(declare-fun res!470947 () Bool)

(assert (=> b!707143 (=> (not res!470947) (not e!398059))))

(declare-fun noDuplicate!1181 (List!13357) Bool)

(assert (=> b!707143 (= res!470947 (noDuplicate!1181 newAcc!49))))

(declare-fun b!707144 () Bool)

(declare-fun res!470951 () Bool)

(assert (=> b!707144 (=> (not res!470951) (not e!398059))))

(declare-fun arrayNoDuplicates!0 (array!40319 (_ BitVec 32) List!13357) Bool)

(assert (=> b!707144 (= res!470951 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!707145 () Bool)

(declare-fun res!470955 () Bool)

(assert (=> b!707145 (=> (not res!470955) (not e!398059))))

(assert (=> b!707145 (= res!470955 (contains!3934 newAcc!49 k!2824))))

(declare-fun b!707146 () Bool)

(declare-fun res!470956 () Bool)

(assert (=> b!707146 (=> (not res!470956) (not e!398059))))

(assert (=> b!707146 (= res!470956 (noDuplicate!1181 acc!652))))

(declare-fun b!707147 () Bool)

(declare-fun res!470957 () Bool)

(assert (=> b!707147 (=> (not res!470957) (not e!398059))))

(assert (=> b!707147 (= res!470957 (not (contains!3934 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!707148 () Bool)

(declare-fun res!470949 () Bool)

(assert (=> b!707148 (=> (not res!470949) (not e!398059))))

(assert (=> b!707148 (= res!470949 (not (contains!3934 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!62640 res!470950) b!707146))

(assert (= (and b!707146 res!470956) b!707143))

(assert (= (and b!707143 res!470947) b!707148))

(assert (= (and b!707148 res!470949) b!707140))

(assert (= (and b!707140 res!470952) b!707139))

(assert (= (and b!707139 res!470948) b!707141))

(assert (= (and b!707141 res!470946) b!707136))

(assert (= (and b!707136 res!470953) b!707144))

(assert (= (and b!707144 res!470951) b!707142))

(assert (= (and b!707142 res!470958) b!707145))

(assert (= (and b!707145 res!470955) b!707138))

(assert (= (and b!707138 res!470954) b!707147))

(assert (= (and b!707147 res!470957) b!707137))

(declare-fun m!664803 () Bool)

(assert (=> b!707137 m!664803))

(declare-fun m!664805 () Bool)

(assert (=> b!707143 m!664805))

(declare-fun m!664807 () Bool)

(assert (=> b!707136 m!664807))

(declare-fun m!664809 () Bool)

(assert (=> b!707142 m!664809))

(declare-fun m!664811 () Bool)

(assert (=> b!707145 m!664811))

(declare-fun m!664813 () Bool)

(assert (=> b!707138 m!664813))

(declare-fun m!664815 () Bool)

(assert (=> start!62640 m!664815))

(declare-fun m!664817 () Bool)

(assert (=> b!707148 m!664817))

(declare-fun m!664819 () Bool)

(assert (=> b!707139 m!664819))

(declare-fun m!664821 () Bool)

(assert (=> b!707140 m!664821))

(declare-fun m!664823 () Bool)

(assert (=> b!707146 m!664823))

(declare-fun m!664825 () Bool)

(assert (=> b!707141 m!664825))

(declare-fun m!664827 () Bool)

(assert (=> b!707144 m!664827))

(declare-fun m!664829 () Bool)

(assert (=> b!707147 m!664829))

(push 1)

(assert (not b!707136))

(assert (not b!707140))

(assert (not b!707146))

(assert (not b!707137))

(assert (not b!707138))

(assert (not b!707142))

