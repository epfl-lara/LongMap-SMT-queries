; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114234 () Bool)

(assert start!114234)

(declare-fun b!1357078 () Bool)

(declare-fun res!901835 () Bool)

(declare-fun e!770244 () Bool)

(assert (=> b!1357078 (=> (not res!901835) (not e!770244))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92416 0))(
  ( (array!92417 (arr!44656 (Array (_ BitVec 32) (_ BitVec 64))) (size!45206 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92416)

(assert (=> b!1357078 (= res!901835 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45206 a!3742)))))

(declare-fun b!1357079 () Bool)

(declare-fun res!901836 () Bool)

(assert (=> b!1357079 (=> (not res!901836) (not e!770244))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1357079 (= res!901836 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45206 a!3742))))))

(declare-fun b!1357080 () Bool)

(assert (=> b!1357080 (= e!770244 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3120) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!31697 0))(
  ( (Nil!31694) (Cons!31693 (h!32902 (_ BitVec 64)) (t!46355 List!31697)) )
))
(declare-fun acc!759 () List!31697)

(declare-fun subseq!808 (List!31697 List!31697) Bool)

(assert (=> b!1357080 (subseq!808 acc!759 acc!759)))

(declare-datatypes ((Unit!44647 0))(
  ( (Unit!44648) )
))
(declare-fun lt!599116 () Unit!44647)

(declare-fun lemmaListSubSeqRefl!0 (List!31697) Unit!44647)

(assert (=> b!1357080 (= lt!599116 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357081 () Bool)

(declare-fun res!901838 () Bool)

(assert (=> b!1357081 (=> (not res!901838) (not e!770244))))

(declare-fun arrayNoDuplicates!0 (array!92416 (_ BitVec 32) List!31697) Bool)

(assert (=> b!1357081 (= res!901838 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357082 () Bool)

(declare-fun res!901843 () Bool)

(assert (=> b!1357082 (=> (not res!901843) (not e!770244))))

(declare-fun contains!9406 (List!31697 (_ BitVec 64)) Bool)

(assert (=> b!1357082 (= res!901843 (not (contains!9406 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357083 () Bool)

(declare-fun res!901841 () Bool)

(assert (=> b!1357083 (=> (not res!901841) (not e!770244))))

(assert (=> b!1357083 (= res!901841 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31694))))

(declare-fun b!1357084 () Bool)

(declare-fun res!901839 () Bool)

(assert (=> b!1357084 (=> (not res!901839) (not e!770244))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357084 (= res!901839 (not (validKeyInArray!0 l!3587)))))

(declare-fun res!901834 () Bool)

(assert (=> start!114234 (=> (not res!901834) (not e!770244))))

(assert (=> start!114234 (= res!901834 (and (bvslt (size!45206 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45206 a!3742))))))

(assert (=> start!114234 e!770244))

(assert (=> start!114234 true))

(declare-fun array_inv!33684 (array!92416) Bool)

(assert (=> start!114234 (array_inv!33684 a!3742)))

(declare-fun b!1357085 () Bool)

(declare-fun res!901842 () Bool)

(assert (=> b!1357085 (=> (not res!901842) (not e!770244))))

(assert (=> b!1357085 (= res!901842 (not (contains!9406 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357086 () Bool)

(declare-fun res!901837 () Bool)

(assert (=> b!1357086 (=> (not res!901837) (not e!770244))))

(declare-fun noDuplicate!2263 (List!31697) Bool)

(assert (=> b!1357086 (= res!901837 (noDuplicate!2263 acc!759))))

(declare-fun b!1357087 () Bool)

(declare-fun res!901840 () Bool)

(assert (=> b!1357087 (=> (not res!901840) (not e!770244))))

(assert (=> b!1357087 (= res!901840 (validKeyInArray!0 (select (arr!44656 a!3742) from!3120)))))

(assert (= (and start!114234 res!901834) b!1357086))

(assert (= (and b!1357086 res!901837) b!1357082))

(assert (= (and b!1357082 res!901843) b!1357085))

(assert (= (and b!1357085 res!901842) b!1357083))

(assert (= (and b!1357083 res!901841) b!1357081))

(assert (= (and b!1357081 res!901838) b!1357079))

(assert (= (and b!1357079 res!901836) b!1357084))

(assert (= (and b!1357084 res!901839) b!1357078))

(assert (= (and b!1357078 res!901835) b!1357087))

(assert (= (and b!1357087 res!901840) b!1357080))

(declare-fun m!1242909 () Bool)

(assert (=> b!1357080 m!1242909))

(declare-fun m!1242911 () Bool)

(assert (=> b!1357080 m!1242911))

(declare-fun m!1242913 () Bool)

(assert (=> b!1357085 m!1242913))

(declare-fun m!1242915 () Bool)

(assert (=> b!1357082 m!1242915))

(declare-fun m!1242917 () Bool)

(assert (=> b!1357081 m!1242917))

(declare-fun m!1242919 () Bool)

(assert (=> start!114234 m!1242919))

(declare-fun m!1242921 () Bool)

(assert (=> b!1357086 m!1242921))

(declare-fun m!1242923 () Bool)

(assert (=> b!1357084 m!1242923))

(declare-fun m!1242925 () Bool)

(assert (=> b!1357083 m!1242925))

(declare-fun m!1242927 () Bool)

(assert (=> b!1357087 m!1242927))

(assert (=> b!1357087 m!1242927))

(declare-fun m!1242929 () Bool)

(assert (=> b!1357087 m!1242929))

(push 1)

(assert (not b!1357085))

(assert (not b!1357083))

(assert (not start!114234))

(assert (not b!1357080))

(assert (not b!1357086))

(assert (not b!1357084))

(assert (not b!1357087))

(assert (not b!1357082))

(assert (not b!1357081))

(check-sat)

