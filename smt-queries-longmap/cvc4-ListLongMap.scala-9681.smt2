; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114228 () Bool)

(assert start!114228)

(declare-fun b!1356988 () Bool)

(declare-fun res!901744 () Bool)

(declare-fun e!770227 () Bool)

(assert (=> b!1356988 (=> (not res!901744) (not e!770227))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92410 0))(
  ( (array!92411 (arr!44653 (Array (_ BitVec 32) (_ BitVec 64))) (size!45203 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92410)

(assert (=> b!1356988 (= res!901744 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45203 a!3742))))))

(declare-fun b!1356989 () Bool)

(declare-fun res!901751 () Bool)

(assert (=> b!1356989 (=> (not res!901751) (not e!770227))))

(declare-datatypes ((List!31694 0))(
  ( (Nil!31691) (Cons!31690 (h!32899 (_ BitVec 64)) (t!46352 List!31694)) )
))
(declare-fun acc!759 () List!31694)

(declare-fun contains!9403 (List!31694 (_ BitVec 64)) Bool)

(assert (=> b!1356989 (= res!901751 (not (contains!9403 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356990 () Bool)

(declare-fun res!901745 () Bool)

(assert (=> b!1356990 (=> (not res!901745) (not e!770227))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356990 (= res!901745 (validKeyInArray!0 (select (arr!44653 a!3742) from!3120)))))

(declare-fun b!1356991 () Bool)

(declare-fun res!901746 () Bool)

(assert (=> b!1356991 (=> (not res!901746) (not e!770227))))

(declare-fun arrayNoDuplicates!0 (array!92410 (_ BitVec 32) List!31694) Bool)

(assert (=> b!1356991 (= res!901746 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356992 () Bool)

(declare-fun res!901753 () Bool)

(assert (=> b!1356992 (=> (not res!901753) (not e!770227))))

(assert (=> b!1356992 (= res!901753 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31691))))

(declare-fun b!1356993 () Bool)

(declare-fun res!901749 () Bool)

(assert (=> b!1356993 (=> (not res!901749) (not e!770227))))

(declare-fun l!3587 () (_ BitVec 64))

(assert (=> b!1356993 (= res!901749 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356994 () Bool)

(declare-fun res!901752 () Bool)

(assert (=> b!1356994 (=> (not res!901752) (not e!770227))))

(assert (=> b!1356994 (= res!901752 (not (contains!9403 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356995 () Bool)

(assert (=> b!1356995 (= e!770227 (not true))))

(declare-fun subseq!805 (List!31694 List!31694) Bool)

(assert (=> b!1356995 (subseq!805 acc!759 acc!759)))

(declare-datatypes ((Unit!44641 0))(
  ( (Unit!44642) )
))
(declare-fun lt!599107 () Unit!44641)

(declare-fun lemmaListSubSeqRefl!0 (List!31694) Unit!44641)

(assert (=> b!1356995 (= lt!599107 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356997 () Bool)

(declare-fun res!901750 () Bool)

(assert (=> b!1356997 (=> (not res!901750) (not e!770227))))

(declare-fun noDuplicate!2260 (List!31694) Bool)

(assert (=> b!1356997 (= res!901750 (noDuplicate!2260 acc!759))))

(declare-fun res!901747 () Bool)

(assert (=> start!114228 (=> (not res!901747) (not e!770227))))

(assert (=> start!114228 (= res!901747 (and (bvslt (size!45203 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45203 a!3742))))))

(assert (=> start!114228 e!770227))

(assert (=> start!114228 true))

(declare-fun array_inv!33681 (array!92410) Bool)

(assert (=> start!114228 (array_inv!33681 a!3742)))

(declare-fun b!1356996 () Bool)

(declare-fun res!901748 () Bool)

(assert (=> b!1356996 (=> (not res!901748) (not e!770227))))

(assert (=> b!1356996 (= res!901748 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45203 a!3742)))))

(assert (= (and start!114228 res!901747) b!1356997))

(assert (= (and b!1356997 res!901750) b!1356989))

(assert (= (and b!1356989 res!901751) b!1356994))

(assert (= (and b!1356994 res!901752) b!1356992))

(assert (= (and b!1356992 res!901753) b!1356991))

(assert (= (and b!1356991 res!901746) b!1356988))

(assert (= (and b!1356988 res!901744) b!1356993))

(assert (= (and b!1356993 res!901749) b!1356996))

(assert (= (and b!1356996 res!901748) b!1356990))

(assert (= (and b!1356990 res!901745) b!1356995))

(declare-fun m!1242843 () Bool)

(assert (=> b!1356995 m!1242843))

(declare-fun m!1242845 () Bool)

(assert (=> b!1356995 m!1242845))

(declare-fun m!1242847 () Bool)

(assert (=> b!1356994 m!1242847))

(declare-fun m!1242849 () Bool)

(assert (=> b!1356997 m!1242849))

(declare-fun m!1242851 () Bool)

(assert (=> b!1356990 m!1242851))

(assert (=> b!1356990 m!1242851))

(declare-fun m!1242853 () Bool)

(assert (=> b!1356990 m!1242853))

(declare-fun m!1242855 () Bool)

(assert (=> b!1356992 m!1242855))

(declare-fun m!1242857 () Bool)

(assert (=> b!1356993 m!1242857))

(declare-fun m!1242859 () Bool)

(assert (=> start!114228 m!1242859))

(declare-fun m!1242861 () Bool)

(assert (=> b!1356989 m!1242861))

(declare-fun m!1242863 () Bool)

(assert (=> b!1356991 m!1242863))

(push 1)

(assert (not b!1356989))

(assert (not b!1356993))

(assert (not b!1356994))

(assert (not b!1356990))

(assert (not start!114228))

(assert (not b!1356997))

(assert (not b!1356995))

(assert (not b!1356992))

(assert (not b!1356991))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

