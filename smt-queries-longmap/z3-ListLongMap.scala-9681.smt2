; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114226 () Bool)

(assert start!114226)

(declare-fun b!1356958 () Bool)

(declare-fun res!901721 () Bool)

(declare-fun e!770221 () Bool)

(assert (=> b!1356958 (=> (not res!901721) (not e!770221))))

(declare-datatypes ((List!31693 0))(
  ( (Nil!31690) (Cons!31689 (h!32898 (_ BitVec 64)) (t!46351 List!31693)) )
))
(declare-fun acc!759 () List!31693)

(declare-datatypes ((array!92408 0))(
  ( (array!92409 (arr!44652 (Array (_ BitVec 32) (_ BitVec 64))) (size!45202 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92408)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92408 (_ BitVec 32) List!31693) Bool)

(assert (=> b!1356958 (= res!901721 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356959 () Bool)

(declare-fun res!901722 () Bool)

(assert (=> b!1356959 (=> (not res!901722) (not e!770221))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356959 (= res!901722 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45202 a!3742))))))

(declare-fun b!1356960 () Bool)

(declare-fun res!901717 () Bool)

(assert (=> b!1356960 (=> (not res!901717) (not e!770221))))

(declare-fun noDuplicate!2259 (List!31693) Bool)

(assert (=> b!1356960 (= res!901717 (noDuplicate!2259 acc!759))))

(declare-fun b!1356961 () Bool)

(declare-fun res!901714 () Bool)

(assert (=> b!1356961 (=> (not res!901714) (not e!770221))))

(declare-fun contains!9402 (List!31693 (_ BitVec 64)) Bool)

(assert (=> b!1356961 (= res!901714 (not (contains!9402 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356962 () Bool)

(assert (=> b!1356962 (= e!770221 (not true))))

(declare-fun subseq!804 (List!31693 List!31693) Bool)

(assert (=> b!1356962 (subseq!804 acc!759 acc!759)))

(declare-datatypes ((Unit!44639 0))(
  ( (Unit!44640) )
))
(declare-fun lt!599104 () Unit!44639)

(declare-fun lemmaListSubSeqRefl!0 (List!31693) Unit!44639)

(assert (=> b!1356962 (= lt!599104 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356963 () Bool)

(declare-fun res!901723 () Bool)

(assert (=> b!1356963 (=> (not res!901723) (not e!770221))))

(assert (=> b!1356963 (= res!901723 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31690))))

(declare-fun res!901718 () Bool)

(assert (=> start!114226 (=> (not res!901718) (not e!770221))))

(assert (=> start!114226 (= res!901718 (and (bvslt (size!45202 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45202 a!3742))))))

(assert (=> start!114226 e!770221))

(assert (=> start!114226 true))

(declare-fun array_inv!33680 (array!92408) Bool)

(assert (=> start!114226 (array_inv!33680 a!3742)))

(declare-fun b!1356964 () Bool)

(declare-fun res!901719 () Bool)

(assert (=> b!1356964 (=> (not res!901719) (not e!770221))))

(assert (=> b!1356964 (= res!901719 (not (contains!9402 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356965 () Bool)

(declare-fun res!901715 () Bool)

(assert (=> b!1356965 (=> (not res!901715) (not e!770221))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356965 (= res!901715 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356966 () Bool)

(declare-fun res!901720 () Bool)

(assert (=> b!1356966 (=> (not res!901720) (not e!770221))))

(assert (=> b!1356966 (= res!901720 (validKeyInArray!0 (select (arr!44652 a!3742) from!3120)))))

(declare-fun b!1356967 () Bool)

(declare-fun res!901716 () Bool)

(assert (=> b!1356967 (=> (not res!901716) (not e!770221))))

(assert (=> b!1356967 (= res!901716 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45202 a!3742)))))

(assert (= (and start!114226 res!901718) b!1356960))

(assert (= (and b!1356960 res!901717) b!1356961))

(assert (= (and b!1356961 res!901714) b!1356964))

(assert (= (and b!1356964 res!901719) b!1356963))

(assert (= (and b!1356963 res!901723) b!1356958))

(assert (= (and b!1356958 res!901721) b!1356959))

(assert (= (and b!1356959 res!901722) b!1356965))

(assert (= (and b!1356965 res!901715) b!1356967))

(assert (= (and b!1356967 res!901716) b!1356966))

(assert (= (and b!1356966 res!901720) b!1356962))

(declare-fun m!1242821 () Bool)

(assert (=> b!1356963 m!1242821))

(declare-fun m!1242823 () Bool)

(assert (=> b!1356960 m!1242823))

(declare-fun m!1242825 () Bool)

(assert (=> start!114226 m!1242825))

(declare-fun m!1242827 () Bool)

(assert (=> b!1356962 m!1242827))

(declare-fun m!1242829 () Bool)

(assert (=> b!1356962 m!1242829))

(declare-fun m!1242831 () Bool)

(assert (=> b!1356964 m!1242831))

(declare-fun m!1242833 () Bool)

(assert (=> b!1356965 m!1242833))

(declare-fun m!1242835 () Bool)

(assert (=> b!1356966 m!1242835))

(assert (=> b!1356966 m!1242835))

(declare-fun m!1242837 () Bool)

(assert (=> b!1356966 m!1242837))

(declare-fun m!1242839 () Bool)

(assert (=> b!1356961 m!1242839))

(declare-fun m!1242841 () Bool)

(assert (=> b!1356958 m!1242841))

(check-sat (not b!1356960) (not b!1356965) (not start!114226) (not b!1356963) (not b!1356964) (not b!1356961) (not b!1356966) (not b!1356962) (not b!1356958))
