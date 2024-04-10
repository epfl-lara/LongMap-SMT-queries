; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62516 () Bool)

(assert start!62516)

(declare-fun b!704134 () Bool)

(declare-fun res!467958 () Bool)

(declare-fun e!397686 () Bool)

(assert (=> b!704134 (=> (not res!467958) (not e!397686))))

(declare-datatypes ((List!13295 0))(
  ( (Nil!13292) (Cons!13291 (h!14336 (_ BitVec 64)) (t!19577 List!13295)) )
))
(declare-fun acc!652 () List!13295)

(declare-fun contains!3872 (List!13295 (_ BitVec 64)) Bool)

(assert (=> b!704134 (= res!467958 (not (contains!3872 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704135 () Bool)

(declare-fun res!467944 () Bool)

(assert (=> b!704135 (=> (not res!467944) (not e!397686))))

(declare-fun k!2824 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!704135 (= res!467944 (validKeyInArray!0 k!2824))))

(declare-fun b!704136 () Bool)

(declare-fun res!467960 () Bool)

(assert (=> b!704136 (=> (not res!467960) (not e!397686))))

(declare-fun newAcc!49 () List!13295)

(declare-fun -!282 (List!13295 (_ BitVec 64)) List!13295)

(assert (=> b!704136 (= res!467960 (= (-!282 newAcc!49 k!2824) acc!652))))

(declare-fun b!704137 () Bool)

(declare-fun res!467946 () Bool)

(assert (=> b!704137 (=> (not res!467946) (not e!397686))))

(declare-fun noDuplicate!1119 (List!13295) Bool)

(assert (=> b!704137 (= res!467946 (noDuplicate!1119 acc!652))))

(declare-fun b!704139 () Bool)

(declare-fun res!467951 () Bool)

(assert (=> b!704139 (=> (not res!467951) (not e!397686))))

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40195 0))(
  ( (array!40196 (arr!19254 (Array (_ BitVec 32) (_ BitVec 64))) (size!19639 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40195)

(assert (=> b!704139 (= res!467951 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19639 a!3591)))))

(declare-fun b!704140 () Bool)

(declare-fun res!467949 () Bool)

(assert (=> b!704140 (=> (not res!467949) (not e!397686))))

(assert (=> b!704140 (= res!467949 (not (contains!3872 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704141 () Bool)

(declare-fun res!467952 () Bool)

(assert (=> b!704141 (=> (not res!467952) (not e!397686))))

(assert (=> b!704141 (= res!467952 (not (contains!3872 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704142 () Bool)

(declare-fun res!467945 () Bool)

(assert (=> b!704142 (=> (not res!467945) (not e!397686))))

(declare-fun arrayNoDuplicates!0 (array!40195 (_ BitVec 32) List!13295) Bool)

(assert (=> b!704142 (= res!467945 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!704143 () Bool)

(declare-fun res!467948 () Bool)

(assert (=> b!704143 (=> (not res!467948) (not e!397686))))

(assert (=> b!704143 (= res!467948 (not (validKeyInArray!0 (select (arr!19254 a!3591) from!2969))))))

(declare-fun b!704144 () Bool)

(declare-fun res!467953 () Bool)

(assert (=> b!704144 (=> (not res!467953) (not e!397686))))

(assert (=> b!704144 (= res!467953 (not (contains!3872 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!704145 () Bool)

(assert (=> b!704145 (= e!397686 false)))

(declare-fun lt!317826 () Bool)

(assert (=> b!704145 (= lt!317826 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!704146 () Bool)

(declare-fun res!467954 () Bool)

(assert (=> b!704146 (=> (not res!467954) (not e!397686))))

(declare-fun arrayContainsKey!0 (array!40195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!704146 (= res!467954 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!704147 () Bool)

(declare-fun res!467950 () Bool)

(assert (=> b!704147 (=> (not res!467950) (not e!397686))))

(assert (=> b!704147 (= res!467950 (noDuplicate!1119 newAcc!49))))

(declare-fun b!704148 () Bool)

(declare-fun res!467957 () Bool)

(assert (=> b!704148 (=> (not res!467957) (not e!397686))))

(assert (=> b!704148 (= res!467957 (not (contains!3872 acc!652 k!2824)))))

(declare-fun b!704149 () Bool)

(declare-fun res!467955 () Bool)

(assert (=> b!704149 (=> (not res!467955) (not e!397686))))

(declare-fun subseq!317 (List!13295 List!13295) Bool)

(assert (=> b!704149 (= res!467955 (subseq!317 acc!652 newAcc!49))))

(declare-fun b!704138 () Bool)

(declare-fun res!467956 () Bool)

(assert (=> b!704138 (=> (not res!467956) (not e!397686))))

(assert (=> b!704138 (= res!467956 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun res!467961 () Bool)

(assert (=> start!62516 (=> (not res!467961) (not e!397686))))

(assert (=> start!62516 (= res!467961 (and (bvslt (size!19639 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19639 a!3591))))))

(assert (=> start!62516 e!397686))

(assert (=> start!62516 true))

(declare-fun array_inv!15050 (array!40195) Bool)

(assert (=> start!62516 (array_inv!15050 a!3591)))

(declare-fun b!704150 () Bool)

(declare-fun res!467959 () Bool)

(assert (=> b!704150 (=> (not res!467959) (not e!397686))))

(assert (=> b!704150 (= res!467959 (contains!3872 newAcc!49 k!2824))))

(declare-fun b!704151 () Bool)

(declare-fun res!467947 () Bool)

(assert (=> b!704151 (=> (not res!467947) (not e!397686))))

(assert (=> b!704151 (= res!467947 (not (arrayContainsKey!0 a!3591 k!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(assert (= (and start!62516 res!467961) b!704137))

(assert (= (and b!704137 res!467946) b!704147))

(assert (= (and b!704147 res!467950) b!704134))

(assert (= (and b!704134 res!467958) b!704144))

(assert (= (and b!704144 res!467953) b!704146))

(assert (= (and b!704146 res!467954) b!704148))

(assert (= (and b!704148 res!467957) b!704135))

(assert (= (and b!704135 res!467944) b!704142))

(assert (= (and b!704142 res!467945) b!704149))

(assert (= (and b!704149 res!467955) b!704150))

(assert (= (and b!704150 res!467959) b!704136))

(assert (= (and b!704136 res!467960) b!704141))

(assert (= (and b!704141 res!467952) b!704140))

(assert (= (and b!704140 res!467949) b!704139))

(assert (= (and b!704139 res!467951) b!704143))

(assert (= (and b!704143 res!467948) b!704138))

(assert (= (and b!704138 res!467956) b!704151))

(assert (= (and b!704151 res!467947) b!704145))

(declare-fun m!662731 () Bool)

(assert (=> b!704140 m!662731))

(declare-fun m!662733 () Bool)

(assert (=> b!704134 m!662733))

(declare-fun m!662735 () Bool)

(assert (=> b!704137 m!662735))

(declare-fun m!662737 () Bool)

(assert (=> b!704143 m!662737))

(assert (=> b!704143 m!662737))

(declare-fun m!662739 () Bool)

(assert (=> b!704143 m!662739))

(declare-fun m!662741 () Bool)

(assert (=> b!704142 m!662741))

(declare-fun m!662743 () Bool)

(assert (=> b!704148 m!662743))

(declare-fun m!662745 () Bool)

(assert (=> b!704150 m!662745))

(declare-fun m!662747 () Bool)

(assert (=> b!704136 m!662747))

(declare-fun m!662749 () Bool)

(assert (=> b!704141 m!662749))

(declare-fun m!662751 () Bool)

(assert (=> b!704149 m!662751))

(declare-fun m!662753 () Bool)

(assert (=> b!704144 m!662753))

(declare-fun m!662755 () Bool)

(assert (=> b!704145 m!662755))

(declare-fun m!662757 () Bool)

(assert (=> b!704147 m!662757))

(declare-fun m!662759 () Bool)

(assert (=> b!704135 m!662759))

(declare-fun m!662761 () Bool)

(assert (=> b!704151 m!662761))

(declare-fun m!662763 () Bool)

(assert (=> start!62516 m!662763))

(declare-fun m!662765 () Bool)

(assert (=> b!704146 m!662765))

(push 1)

(assert (not b!704143))

(assert (not b!704135))

(assert (not b!704142))

(assert (not start!62516))

(assert (not b!704141))

(assert (not b!704147))

(assert (not b!704140))

(assert (not b!704144))

(assert (not b!704145))

(assert (not b!704134))

(assert (not b!704148))

(assert (not b!704136))

(assert (not b!704137))

(assert (not b!704150))

(assert (not b!704151))

(assert (not b!704149))

(assert (not b!704146))

(check-sat)

