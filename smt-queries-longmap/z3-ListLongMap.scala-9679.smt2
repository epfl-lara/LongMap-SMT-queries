; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114212 () Bool)

(assert start!114212)

(declare-fun b!1356713 () Bool)

(declare-fun res!901512 () Bool)

(declare-fun e!770145 () Bool)

(assert (=> b!1356713 (=> (not res!901512) (not e!770145))))

(declare-datatypes ((array!92343 0))(
  ( (array!92344 (arr!44620 (Array (_ BitVec 32) (_ BitVec 64))) (size!45172 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92343)

(declare-datatypes ((List!31739 0))(
  ( (Nil!31736) (Cons!31735 (h!32944 (_ BitVec 64)) (t!46389 List!31739)) )
))
(declare-fun arrayNoDuplicates!0 (array!92343 (_ BitVec 32) List!31739) Bool)

(assert (=> b!1356713 (= res!901512 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31736))))

(declare-fun b!1356714 () Bool)

(assert (=> b!1356714 (= e!770145 false)))

(declare-fun lt!598897 () Bool)

(declare-fun acc!759 () List!31739)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356714 (= lt!598897 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356715 () Bool)

(declare-fun res!901514 () Bool)

(assert (=> b!1356715 (=> (not res!901514) (not e!770145))))

(declare-fun contains!9359 (List!31739 (_ BitVec 64)) Bool)

(assert (=> b!1356715 (= res!901514 (not (contains!9359 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356716 () Bool)

(declare-fun res!901511 () Bool)

(assert (=> b!1356716 (=> (not res!901511) (not e!770145))))

(assert (=> b!1356716 (= res!901511 (not (contains!9359 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901510 () Bool)

(assert (=> start!114212 (=> (not res!901510) (not e!770145))))

(assert (=> start!114212 (= res!901510 (and (bvslt (size!45172 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45172 a!3742))))))

(assert (=> start!114212 e!770145))

(declare-fun array_inv!33853 (array!92343) Bool)

(assert (=> start!114212 (array_inv!33853 a!3742)))

(assert (=> start!114212 true))

(declare-fun b!1356717 () Bool)

(declare-fun res!901513 () Bool)

(assert (=> b!1356717 (=> (not res!901513) (not e!770145))))

(declare-fun noDuplicate!2274 (List!31739) Bool)

(assert (=> b!1356717 (= res!901513 (noDuplicate!2274 acc!759))))

(assert (= (and start!114212 res!901510) b!1356717))

(assert (= (and b!1356717 res!901513) b!1356715))

(assert (= (and b!1356715 res!901514) b!1356716))

(assert (= (and b!1356716 res!901511) b!1356713))

(assert (= (and b!1356713 res!901512) b!1356714))

(declare-fun m!1242181 () Bool)

(assert (=> b!1356716 m!1242181))

(declare-fun m!1242183 () Bool)

(assert (=> b!1356717 m!1242183))

(declare-fun m!1242185 () Bool)

(assert (=> start!114212 m!1242185))

(declare-fun m!1242187 () Bool)

(assert (=> b!1356715 m!1242187))

(declare-fun m!1242189 () Bool)

(assert (=> b!1356713 m!1242189))

(declare-fun m!1242191 () Bool)

(assert (=> b!1356714 m!1242191))

(check-sat (not b!1356715) (not b!1356716) (not b!1356713) (not b!1356714) (not b!1356717) (not start!114212))
(check-sat)
