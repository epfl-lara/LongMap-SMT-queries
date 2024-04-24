; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114430 () Bool)

(assert start!114430)

(declare-fun b!1358016 () Bool)

(declare-fun e!771003 () Bool)

(declare-datatypes ((array!92503 0))(
  ( (array!92504 (arr!44695 (Array (_ BitVec 32) (_ BitVec 64))) (size!45246 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92503)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1358016 (= e!771003 (bvslt (bvsub (size!45246 a!3742) from!3120) #b00000000000000000000000000000000))))

(declare-fun b!1358017 () Bool)

(declare-fun res!901991 () Bool)

(assert (=> b!1358017 (=> (not res!901991) (not e!771003))))

(declare-datatypes ((List!31723 0))(
  ( (Nil!31720) (Cons!31719 (h!32937 (_ BitVec 64)) (t!46373 List!31723)) )
))
(declare-fun arrayNoDuplicates!0 (array!92503 (_ BitVec 32) List!31723) Bool)

(assert (=> b!1358017 (= res!901991 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31720))))

(declare-fun b!1358018 () Bool)

(declare-fun res!901995 () Bool)

(assert (=> b!1358018 (=> (not res!901995) (not e!771003))))

(declare-fun acc!759 () List!31723)

(declare-fun noDuplicate!2266 (List!31723) Bool)

(assert (=> b!1358018 (= res!901995 (noDuplicate!2266 acc!759))))

(declare-fun b!1358019 () Bool)

(declare-fun res!901993 () Bool)

(assert (=> b!1358019 (=> (not res!901993) (not e!771003))))

(declare-fun i!1404 () (_ BitVec 32))

(assert (=> b!1358019 (= res!901993 (and (bvsge i!1404 #b00000000000000000000000000000000) (bvslt i!1404 (size!45246 a!3742))))))

(declare-fun b!1358020 () Bool)

(declare-fun res!901992 () Bool)

(assert (=> b!1358020 (=> (not res!901992) (not e!771003))))

(declare-fun contains!9435 (List!31723 (_ BitVec 64)) Bool)

(assert (=> b!1358020 (= res!901992 (not (contains!9435 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1358021 () Bool)

(declare-fun res!901994 () Bool)

(assert (=> b!1358021 (=> (not res!901994) (not e!771003))))

(declare-fun l!3587 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1358021 (= res!901994 (not (validKeyInArray!0 l!3587)))))

(declare-fun b!1358022 () Bool)

(declare-fun res!901997 () Bool)

(assert (=> b!1358022 (=> (not res!901997) (not e!771003))))

(assert (=> b!1358022 (= res!901997 (not (contains!9435 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901998 () Bool)

(assert (=> start!114430 (=> (not res!901998) (not e!771003))))

(assert (=> start!114430 (= res!901998 (and (bvslt (size!45246 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45246 a!3742))))))

(assert (=> start!114430 e!771003))

(assert (=> start!114430 true))

(declare-fun array_inv!33976 (array!92503) Bool)

(assert (=> start!114430 (array_inv!33976 a!3742)))

(declare-fun b!1358023 () Bool)

(declare-fun res!901996 () Bool)

(assert (=> b!1358023 (=> (not res!901996) (not e!771003))))

(assert (=> b!1358023 (= res!901996 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114430 res!901998) b!1358018))

(assert (= (and b!1358018 res!901995) b!1358020))

(assert (= (and b!1358020 res!901992) b!1358022))

(assert (= (and b!1358022 res!901997) b!1358017))

(assert (= (and b!1358017 res!901991) b!1358023))

(assert (= (and b!1358023 res!901996) b!1358019))

(assert (= (and b!1358019 res!901993) b!1358021))

(assert (= (and b!1358021 res!901994) b!1358016))

(declare-fun m!1244251 () Bool)

(assert (=> b!1358021 m!1244251))

(declare-fun m!1244253 () Bool)

(assert (=> b!1358018 m!1244253))

(declare-fun m!1244255 () Bool)

(assert (=> b!1358022 m!1244255))

(declare-fun m!1244257 () Bool)

(assert (=> b!1358017 m!1244257))

(declare-fun m!1244259 () Bool)

(assert (=> b!1358023 m!1244259))

(declare-fun m!1244261 () Bool)

(assert (=> start!114430 m!1244261))

(declare-fun m!1244263 () Bool)

(assert (=> b!1358020 m!1244263))

(check-sat (not b!1358021) (not b!1358023) (not b!1358022) (not b!1358020) (not start!114430) (not b!1358018) (not b!1358017))
(check-sat)
