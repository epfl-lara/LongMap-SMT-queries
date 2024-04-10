; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114238 () Bool)

(assert start!114238)

(declare-fun b!1357138 () Bool)

(declare-fun e!770256 () Bool)

(assert (=> b!1357138 (= e!770256 (not true))))

(declare-datatypes ((List!31699 0))(
  ( (Nil!31696) (Cons!31695 (h!32904 (_ BitVec 64)) (t!46357 List!31699)) )
))
(declare-fun acc!759 () List!31699)

(declare-fun subseq!810 (List!31699 List!31699) Bool)

(assert (=> b!1357138 (subseq!810 acc!759 acc!759)))

(declare-datatypes ((Unit!44651 0))(
  ( (Unit!44652) )
))
(declare-fun lt!599122 () Unit!44651)

(declare-fun lemmaListSubSeqRefl!0 (List!31699) Unit!44651)

(assert (=> b!1357138 (= lt!599122 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1357139 () Bool)

(declare-fun res!901895 () Bool)

(assert (=> b!1357139 (=> (not res!901895) (not e!770256))))

(declare-fun contains!9408 (List!31699 (_ BitVec 64)) Bool)

(assert (=> b!1357139 (= res!901895 (not (contains!9408 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357140 () Bool)

(declare-fun res!901898 () Bool)

(assert (=> b!1357140 (=> (not res!901898) (not e!770256))))

(declare-fun i!1404 () (_ BitVec 32))

(declare-datatypes ((array!92420 0))(
  ( (array!92421 (arr!44658 (Array (_ BitVec 32) (_ BitVec 64))) (size!45208 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92420)

(assert (=> b!1357140 (= res!901898 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45208 a!3742))))))

(declare-fun b!1357141 () Bool)

(declare-fun res!901902 () Bool)

(assert (=> b!1357141 (=> (not res!901902) (not e!770256))))

(declare-fun noDuplicate!2265 (List!31699) Bool)

(assert (=> b!1357141 (= res!901902 (noDuplicate!2265 acc!759))))

(declare-fun b!1357142 () Bool)

(declare-fun res!901897 () Bool)

(assert (=> b!1357142 (=> (not res!901897) (not e!770256))))

(assert (=> b!1357142 (= res!901897 (not (contains!9408 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1357143 () Bool)

(declare-fun res!901900 () Bool)

(assert (=> b!1357143 (=> (not res!901900) (not e!770256))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1357143 (= res!901900 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1357144 () Bool)

(declare-fun res!901903 () Bool)

(assert (=> b!1357144 (=> (not res!901903) (not e!770256))))

(declare-fun arrayNoDuplicates!0 (array!92420 (_ BitVec 32) List!31699) Bool)

(assert (=> b!1357144 (= res!901903 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31696))))

(declare-fun b!1357145 () Bool)

(declare-fun res!901901 () Bool)

(assert (=> b!1357145 (=> (not res!901901) (not e!770256))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1357145 (= res!901901 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1357146 () Bool)

(declare-fun res!901896 () Bool)

(assert (=> b!1357146 (=> (not res!901896) (not e!770256))))

(assert (=> b!1357146 (= res!901896 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45208 a!3742)))))

(declare-fun b!1357147 () Bool)

(declare-fun res!901894 () Bool)

(assert (=> b!1357147 (=> (not res!901894) (not e!770256))))

(assert (=> b!1357147 (= res!901894 (validKeyInArray!0 (select (arr!44658 a!3742) from!3120)))))

(declare-fun res!901899 () Bool)

(assert (=> start!114238 (=> (not res!901899) (not e!770256))))

(assert (=> start!114238 (= res!901899 (and (bvslt (size!45208 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45208 a!3742))))))

(assert (=> start!114238 e!770256))

(assert (=> start!114238 true))

(declare-fun array_inv!33686 (array!92420) Bool)

(assert (=> start!114238 (array_inv!33686 a!3742)))

(assert (= (and start!114238 res!901899) b!1357141))

(assert (= (and b!1357141 res!901902) b!1357142))

(assert (= (and b!1357142 res!901897) b!1357139))

(assert (= (and b!1357139 res!901895) b!1357144))

(assert (= (and b!1357144 res!901903) b!1357145))

(assert (= (and b!1357145 res!901901) b!1357140))

(assert (= (and b!1357140 res!901898) b!1357143))

(assert (= (and b!1357143 res!901900) b!1357146))

(assert (= (and b!1357146 res!901896) b!1357147))

(assert (= (and b!1357147 res!901894) b!1357138))

(declare-fun m!1242953 () Bool)

(assert (=> b!1357145 m!1242953))

(declare-fun m!1242955 () Bool)

(assert (=> b!1357143 m!1242955))

(declare-fun m!1242957 () Bool)

(assert (=> b!1357139 m!1242957))

(declare-fun m!1242959 () Bool)

(assert (=> b!1357144 m!1242959))

(declare-fun m!1242961 () Bool)

(assert (=> b!1357147 m!1242961))

(assert (=> b!1357147 m!1242961))

(declare-fun m!1242963 () Bool)

(assert (=> b!1357147 m!1242963))

(declare-fun m!1242965 () Bool)

(assert (=> b!1357142 m!1242965))

(declare-fun m!1242967 () Bool)

(assert (=> b!1357141 m!1242967))

(declare-fun m!1242969 () Bool)

(assert (=> start!114238 m!1242969))

(declare-fun m!1242971 () Bool)

(assert (=> b!1357138 m!1242971))

(declare-fun m!1242973 () Bool)

(assert (=> b!1357138 m!1242973))

(check-sat (not start!114238) (not b!1357139) (not b!1357141) (not b!1357138) (not b!1357143) (not b!1357144) (not b!1357142) (not b!1357147) (not b!1357145))
