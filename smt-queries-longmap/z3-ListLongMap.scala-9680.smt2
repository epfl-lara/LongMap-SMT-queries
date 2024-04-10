; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114220 () Bool)

(assert start!114220)

(declare-fun b!1356868 () Bool)

(declare-fun res!901632 () Bool)

(declare-fun e!770203 () Bool)

(assert (=> b!1356868 (=> (not res!901632) (not e!770203))))

(declare-fun from!3120 () (_ BitVec 32))

(declare-datatypes ((array!92402 0))(
  ( (array!92403 (arr!44649 (Array (_ BitVec 32) (_ BitVec 64))) (size!45199 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92402)

(assert (=> b!1356868 (= res!901632 (bvslt (bvadd #b00000000000000000000000000000001 from!3120) (size!45199 a!3742)))))

(declare-fun b!1356869 () Bool)

(declare-fun res!901627 () Bool)

(assert (=> b!1356869 (=> (not res!901627) (not e!770203))))

(declare-datatypes ((List!31690 0))(
  ( (Nil!31687) (Cons!31686 (h!32895 (_ BitVec 64)) (t!46348 List!31690)) )
))
(declare-fun acc!759 () List!31690)

(declare-fun arrayNoDuplicates!0 (array!92402 (_ BitVec 32) List!31690) Bool)

(assert (=> b!1356869 (= res!901627 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356870 () Bool)

(declare-fun res!901626 () Bool)

(assert (=> b!1356870 (=> (not res!901626) (not e!770203))))

(declare-fun contains!9399 (List!31690 (_ BitVec 64)) Bool)

(assert (=> b!1356870 (= res!901626 (not (contains!9399 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356871 () Bool)

(assert (=> b!1356871 (= e!770203 (not true))))

(declare-fun subseq!801 (List!31690 List!31690) Bool)

(assert (=> b!1356871 (subseq!801 acc!759 acc!759)))

(declare-datatypes ((Unit!44633 0))(
  ( (Unit!44634) )
))
(declare-fun lt!599095 () Unit!44633)

(declare-fun lemmaListSubSeqRefl!0 (List!31690) Unit!44633)

(assert (=> b!1356871 (= lt!599095 (lemmaListSubSeqRefl!0 acc!759))))

(declare-fun b!1356872 () Bool)

(declare-fun res!901624 () Bool)

(assert (=> b!1356872 (=> (not res!901624) (not e!770203))))

(assert (=> b!1356872 (= res!901624 (not (contains!9399 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356874 () Bool)

(declare-fun res!901630 () Bool)

(assert (=> b!1356874 (=> (not res!901630) (not e!770203))))

(declare-fun noDuplicate!2256 (List!31690) Bool)

(assert (=> b!1356874 (= res!901630 (noDuplicate!2256 acc!759))))

(declare-fun res!901631 () Bool)

(assert (=> start!114220 (=> (not res!901631) (not e!770203))))

(assert (=> start!114220 (= res!901631 (and (bvslt (size!45199 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45199 a!3742))))))

(assert (=> start!114220 e!770203))

(assert (=> start!114220 true))

(declare-fun array_inv!33677 (array!92402) Bool)

(assert (=> start!114220 (array_inv!33677 a!3742)))

(declare-fun b!1356873 () Bool)

(declare-fun res!901625 () Bool)

(assert (=> b!1356873 (=> (not res!901625) (not e!770203))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1356873 (= res!901625 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1356875 () Bool)

(declare-fun res!901629 () Bool)

(assert (=> b!1356875 (=> (not res!901629) (not e!770203))))

(assert (=> b!1356875 (= res!901629 (validKeyInArray!0 (select (arr!44649 a!3742) from!3120)))))

(declare-fun b!1356876 () Bool)

(declare-fun res!901628 () Bool)

(assert (=> b!1356876 (=> (not res!901628) (not e!770203))))

(assert (=> b!1356876 (= res!901628 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31687))))

(declare-fun b!1356877 () Bool)

(declare-fun res!901633 () Bool)

(assert (=> b!1356877 (=> (not res!901633) (not e!770203))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1356877 (= res!901633 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45199 a!3742))))))

(assert (= (and start!114220 res!901631) b!1356874))

(assert (= (and b!1356874 res!901630) b!1356870))

(assert (= (and b!1356870 res!901626) b!1356872))

(assert (= (and b!1356872 res!901624) b!1356876))

(assert (= (and b!1356876 res!901628) b!1356869))

(assert (= (and b!1356869 res!901627) b!1356877))

(assert (= (and b!1356877 res!901633) b!1356873))

(assert (= (and b!1356873 res!901625) b!1356868))

(assert (= (and b!1356868 res!901632) b!1356875))

(assert (= (and b!1356875 res!901629) b!1356871))

(declare-fun m!1242755 () Bool)

(assert (=> b!1356874 m!1242755))

(declare-fun m!1242757 () Bool)

(assert (=> b!1356873 m!1242757))

(declare-fun m!1242759 () Bool)

(assert (=> start!114220 m!1242759))

(declare-fun m!1242761 () Bool)

(assert (=> b!1356871 m!1242761))

(declare-fun m!1242763 () Bool)

(assert (=> b!1356871 m!1242763))

(declare-fun m!1242765 () Bool)

(assert (=> b!1356870 m!1242765))

(declare-fun m!1242767 () Bool)

(assert (=> b!1356872 m!1242767))

(declare-fun m!1242769 () Bool)

(assert (=> b!1356875 m!1242769))

(assert (=> b!1356875 m!1242769))

(declare-fun m!1242771 () Bool)

(assert (=> b!1356875 m!1242771))

(declare-fun m!1242773 () Bool)

(assert (=> b!1356876 m!1242773))

(declare-fun m!1242775 () Bool)

(assert (=> b!1356869 m!1242775))

(check-sat (not b!1356871) (not b!1356874) (not b!1356869) (not b!1356872) (not b!1356876) (not b!1356870) (not b!1356875) (not start!114220) (not b!1356873))
