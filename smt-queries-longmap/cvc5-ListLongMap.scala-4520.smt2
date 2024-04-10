; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62588 () Bool)

(assert start!62588)

(declare-fun b!706106 () Bool)

(declare-fun e!397903 () Bool)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40267 0))(
  ( (array!40268 (arr!19290 (Array (_ BitVec 32) (_ BitVec 64))) (size!19675 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40267)

(assert (=> b!706106 (= e!397903 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2969) (size!19675 a!3591)) (bvsgt from!2969 (size!19675 a!3591))))))

(declare-fun b!706107 () Bool)

(declare-fun res!469916 () Bool)

(assert (=> b!706107 (=> (not res!469916) (not e!397903))))

(declare-datatypes ((List!13331 0))(
  ( (Nil!13328) (Cons!13327 (h!14372 (_ BitVec 64)) (t!19613 List!13331)) )
))
(declare-fun acc!652 () List!13331)

(declare-fun contains!3908 (List!13331 (_ BitVec 64)) Bool)

(assert (=> b!706107 (= res!469916 (not (contains!3908 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706108 () Bool)

(declare-fun res!469921 () Bool)

(assert (=> b!706108 (=> (not res!469921) (not e!397903))))

(assert (=> b!706108 (= res!469921 (not (contains!3908 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706109 () Bool)

(declare-fun res!469929 () Bool)

(assert (=> b!706109 (=> (not res!469929) (not e!397903))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!706109 (= res!469929 (not (contains!3908 acc!652 k!2824)))))

(declare-fun b!706110 () Bool)

(declare-fun res!469928 () Bool)

(assert (=> b!706110 (=> (not res!469928) (not e!397903))))

(declare-fun newAcc!49 () List!13331)

(declare-fun -!318 (List!13331 (_ BitVec 64)) List!13331)

(assert (=> b!706110 (= res!469928 (= (-!318 newAcc!49 k!2824) acc!652))))

(declare-fun b!706111 () Bool)

(declare-fun res!469918 () Bool)

(assert (=> b!706111 (=> (not res!469918) (not e!397903))))

(declare-fun arrayNoDuplicates!0 (array!40267 (_ BitVec 32) List!13331) Bool)

(assert (=> b!706111 (= res!469918 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(declare-fun b!706112 () Bool)

(declare-fun res!469925 () Bool)

(assert (=> b!706112 (=> (not res!469925) (not e!397903))))

(declare-fun subseq!353 (List!13331 List!13331) Bool)

(assert (=> b!706112 (= res!469925 (subseq!353 acc!652 newAcc!49))))

(declare-fun res!469919 () Bool)

(assert (=> start!62588 (=> (not res!469919) (not e!397903))))

(assert (=> start!62588 (= res!469919 (and (bvslt (size!19675 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19675 a!3591))))))

(assert (=> start!62588 e!397903))

(assert (=> start!62588 true))

(declare-fun array_inv!15086 (array!40267) Bool)

(assert (=> start!62588 (array_inv!15086 a!3591)))

(declare-fun b!706113 () Bool)

(declare-fun res!469917 () Bool)

(assert (=> b!706113 (=> (not res!469917) (not e!397903))))

(assert (=> b!706113 (= res!469917 (not (contains!3908 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706114 () Bool)

(declare-fun res!469923 () Bool)

(assert (=> b!706114 (=> (not res!469923) (not e!397903))))

(declare-fun noDuplicate!1155 (List!13331) Bool)

(assert (=> b!706114 (= res!469923 (noDuplicate!1155 newAcc!49))))

(declare-fun b!706115 () Bool)

(declare-fun res!469920 () Bool)

(assert (=> b!706115 (=> (not res!469920) (not e!397903))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!706115 (= res!469920 (validKeyInArray!0 k!2824))))

(declare-fun b!706116 () Bool)

(declare-fun res!469922 () Bool)

(assert (=> b!706116 (=> (not res!469922) (not e!397903))))

(assert (=> b!706116 (= res!469922 (noDuplicate!1155 acc!652))))

(declare-fun b!706117 () Bool)

(declare-fun res!469926 () Bool)

(assert (=> b!706117 (=> (not res!469926) (not e!397903))))

(declare-fun arrayContainsKey!0 (array!40267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!706117 (= res!469926 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun b!706118 () Bool)

(declare-fun res!469927 () Bool)

(assert (=> b!706118 (=> (not res!469927) (not e!397903))))

(assert (=> b!706118 (= res!469927 (not (contains!3908 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!706119 () Bool)

(declare-fun res!469924 () Bool)

(assert (=> b!706119 (=> (not res!469924) (not e!397903))))

(assert (=> b!706119 (= res!469924 (contains!3908 newAcc!49 k!2824))))

(assert (= (and start!62588 res!469919) b!706116))

(assert (= (and b!706116 res!469922) b!706114))

(assert (= (and b!706114 res!469923) b!706108))

(assert (= (and b!706108 res!469921) b!706107))

(assert (= (and b!706107 res!469916) b!706117))

(assert (= (and b!706117 res!469926) b!706109))

(assert (= (and b!706109 res!469929) b!706115))

(assert (= (and b!706115 res!469920) b!706111))

(assert (= (and b!706111 res!469918) b!706112))

(assert (= (and b!706112 res!469925) b!706119))

(assert (= (and b!706119 res!469924) b!706110))

(assert (= (and b!706110 res!469928) b!706113))

(assert (= (and b!706113 res!469917) b!706118))

(assert (= (and b!706118 res!469927) b!706106))

(declare-fun m!664075 () Bool)

(assert (=> b!706116 m!664075))

(declare-fun m!664077 () Bool)

(assert (=> b!706110 m!664077))

(declare-fun m!664079 () Bool)

(assert (=> b!706109 m!664079))

(declare-fun m!664081 () Bool)

(assert (=> b!706119 m!664081))

(declare-fun m!664083 () Bool)

(assert (=> b!706118 m!664083))

(declare-fun m!664085 () Bool)

(assert (=> b!706114 m!664085))

(declare-fun m!664087 () Bool)

(assert (=> start!62588 m!664087))

(declare-fun m!664089 () Bool)

(assert (=> b!706107 m!664089))

(declare-fun m!664091 () Bool)

(assert (=> b!706113 m!664091))

(declare-fun m!664093 () Bool)

(assert (=> b!706111 m!664093))

(declare-fun m!664095 () Bool)

(assert (=> b!706117 m!664095))

(declare-fun m!664097 () Bool)

(assert (=> b!706115 m!664097))

(declare-fun m!664099 () Bool)

(assert (=> b!706112 m!664099))

(declare-fun m!664101 () Bool)

(assert (=> b!706108 m!664101))

(push 1)

(assert (not start!62588))

(assert (not b!706119))

(assert (not b!706111))

(assert (not b!706116))

(assert (not b!706107))

(assert (not b!706117))

(assert (not b!706118))

(assert (not b!706109))

(assert (not b!706114))

(assert (not b!706108))

(assert (not b!706113))

(assert (not b!706110))

(assert (not b!706115))

(assert (not b!706112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

