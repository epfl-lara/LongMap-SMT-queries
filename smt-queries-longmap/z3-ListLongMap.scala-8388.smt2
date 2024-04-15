; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101998 () Bool)

(assert start!101998)

(declare-fun b!1228144 () Bool)

(declare-fun res!816804 () Bool)

(declare-fun e!697103 () Bool)

(assert (=> b!1228144 (=> (not res!816804) (not e!697103))))

(declare-datatypes ((List!27096 0))(
  ( (Nil!27093) (Cons!27092 (h!28301 (_ BitVec 64)) (t!40550 List!27096)) )
))
(declare-fun acc!823 () List!27096)

(declare-fun contains!7068 (List!27096 (_ BitVec 64)) Bool)

(assert (=> b!1228144 (= res!816804 (not (contains!7068 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228145 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1228145 (= e!697103 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(declare-datatypes ((array!79198 0))(
  ( (array!79199 (arr!38222 (Array (_ BitVec 32) (_ BitVec 64))) (size!38760 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79198)

(declare-fun arrayNoDuplicates!0 (array!79198 (_ BitVec 32) List!27096) Bool)

(assert (=> b!1228145 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27093)))

(declare-datatypes ((Unit!40535 0))(
  ( (Unit!40536) )
))
(declare-fun lt!558797 () Unit!40535)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79198 List!27096 List!27096 (_ BitVec 32)) Unit!40535)

(assert (=> b!1228145 (= lt!558797 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27093 from!3184))))

(assert (=> b!1228145 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27092 (select (arr!38222 a!3806) from!3184) acc!823))))

(declare-fun b!1228146 () Bool)

(declare-fun res!816809 () Bool)

(assert (=> b!1228146 (=> (not res!816809) (not e!697103))))

(declare-fun noDuplicate!1711 (List!27096) Bool)

(assert (=> b!1228146 (= res!816809 (noDuplicate!1711 acc!823))))

(declare-fun res!816811 () Bool)

(assert (=> start!101998 (=> (not res!816811) (not e!697103))))

(assert (=> start!101998 (= res!816811 (bvslt (size!38760 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101998 e!697103))

(declare-fun array_inv!29205 (array!79198) Bool)

(assert (=> start!101998 (array_inv!29205 a!3806)))

(assert (=> start!101998 true))

(declare-fun b!1228147 () Bool)

(declare-fun res!816806 () Bool)

(assert (=> b!1228147 (=> (not res!816806) (not e!697103))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1228147 (= res!816806 (validKeyInArray!0 k0!2913))))

(declare-fun b!1228148 () Bool)

(declare-fun res!816808 () Bool)

(assert (=> b!1228148 (=> (not res!816808) (not e!697103))))

(assert (=> b!1228148 (= res!816808 (validKeyInArray!0 (select (arr!38222 a!3806) from!3184)))))

(declare-fun b!1228149 () Bool)

(declare-fun res!816805 () Bool)

(assert (=> b!1228149 (=> (not res!816805) (not e!697103))))

(assert (=> b!1228149 (= res!816805 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38760 a!3806)) (bvslt from!3184 (size!38760 a!3806))))))

(declare-fun b!1228150 () Bool)

(declare-fun res!816807 () Bool)

(assert (=> b!1228150 (=> (not res!816807) (not e!697103))))

(declare-fun arrayContainsKey!0 (array!79198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1228150 (= res!816807 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1228151 () Bool)

(declare-fun res!816810 () Bool)

(assert (=> b!1228151 (=> (not res!816810) (not e!697103))))

(assert (=> b!1228151 (= res!816810 (not (contains!7068 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1228152 () Bool)

(declare-fun res!816812 () Bool)

(assert (=> b!1228152 (=> (not res!816812) (not e!697103))))

(assert (=> b!1228152 (= res!816812 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!101998 res!816811) b!1228147))

(assert (= (and b!1228147 res!816806) b!1228149))

(assert (= (and b!1228149 res!816805) b!1228146))

(assert (= (and b!1228146 res!816809) b!1228144))

(assert (= (and b!1228144 res!816804) b!1228151))

(assert (= (and b!1228151 res!816810) b!1228150))

(assert (= (and b!1228150 res!816807) b!1228152))

(assert (= (and b!1228152 res!816812) b!1228148))

(assert (= (and b!1228148 res!816808) b!1228145))

(declare-fun m!1132251 () Bool)

(assert (=> b!1228152 m!1132251))

(declare-fun m!1132253 () Bool)

(assert (=> b!1228151 m!1132253))

(declare-fun m!1132255 () Bool)

(assert (=> b!1228144 m!1132255))

(declare-fun m!1132257 () Bool)

(assert (=> b!1228146 m!1132257))

(declare-fun m!1132259 () Bool)

(assert (=> b!1228145 m!1132259))

(declare-fun m!1132261 () Bool)

(assert (=> b!1228145 m!1132261))

(declare-fun m!1132263 () Bool)

(assert (=> b!1228145 m!1132263))

(declare-fun m!1132265 () Bool)

(assert (=> b!1228145 m!1132265))

(declare-fun m!1132267 () Bool)

(assert (=> start!101998 m!1132267))

(declare-fun m!1132269 () Bool)

(assert (=> b!1228150 m!1132269))

(assert (=> b!1228148 m!1132263))

(assert (=> b!1228148 m!1132263))

(declare-fun m!1132271 () Bool)

(assert (=> b!1228148 m!1132271))

(declare-fun m!1132273 () Bool)

(assert (=> b!1228147 m!1132273))

(check-sat (not b!1228150) (not b!1228146) (not b!1228145) (not start!101998) (not b!1228148) (not b!1228144) (not b!1228151) (not b!1228147) (not b!1228152))
(check-sat)
