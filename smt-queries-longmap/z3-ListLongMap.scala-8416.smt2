; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102434 () Bool)

(assert start!102434)

(declare-fun b!1232072 () Bool)

(declare-fun res!820455 () Bool)

(declare-fun e!698882 () Bool)

(assert (=> b!1232072 (=> (not res!820455) (not e!698882))))

(declare-datatypes ((array!79465 0))(
  ( (array!79466 (arr!38346 (Array (_ BitVec 32) (_ BitVec 64))) (size!38882 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79465)

(declare-datatypes ((List!27119 0))(
  ( (Nil!27116) (Cons!27115 (h!28324 (_ BitVec 64)) (t!40582 List!27119)) )
))
(declare-fun acc!823 () List!27119)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79465 (_ BitVec 32) List!27119) Bool)

(assert (=> b!1232072 (= res!820455 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232073 () Bool)

(declare-fun res!820454 () Bool)

(assert (=> b!1232073 (=> (not res!820454) (not e!698882))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232073 (= res!820454 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!820459 () Bool)

(assert (=> start!102434 (=> (not res!820459) (not e!698882))))

(assert (=> start!102434 (= res!820459 (bvslt (size!38882 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102434 e!698882))

(declare-fun array_inv!29194 (array!79465) Bool)

(assert (=> start!102434 (array_inv!29194 a!3806)))

(assert (=> start!102434 true))

(declare-fun b!1232074 () Bool)

(declare-fun res!820457 () Bool)

(assert (=> b!1232074 (=> (not res!820457) (not e!698882))))

(declare-fun noDuplicate!1778 (List!27119) Bool)

(assert (=> b!1232074 (= res!820457 (noDuplicate!1778 acc!823))))

(declare-fun b!1232075 () Bool)

(declare-fun res!820458 () Bool)

(assert (=> b!1232075 (=> (not res!820458) (not e!698882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232075 (= res!820458 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232076 () Bool)

(declare-fun res!820451 () Bool)

(assert (=> b!1232076 (=> (not res!820451) (not e!698882))))

(assert (=> b!1232076 (= res!820451 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38882 a!3806)) (bvslt from!3184 (size!38882 a!3806))))))

(declare-fun b!1232077 () Bool)

(declare-fun res!820453 () Bool)

(assert (=> b!1232077 (=> (not res!820453) (not e!698882))))

(assert (=> b!1232077 (= res!820453 (validKeyInArray!0 (select (arr!38346 a!3806) from!3184)))))

(declare-fun b!1232078 () Bool)

(declare-fun res!820450 () Bool)

(assert (=> b!1232078 (=> (not res!820450) (not e!698882))))

(declare-fun contains!7181 (List!27119 (_ BitVec 64)) Bool)

(assert (=> b!1232078 (= res!820450 (not (contains!7181 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232079 () Bool)

(assert (=> b!1232079 (= e!698882 (not true))))

(declare-fun e!698883 () Bool)

(assert (=> b!1232079 e!698883))

(declare-fun res!820456 () Bool)

(assert (=> b!1232079 (=> (not res!820456) (not e!698883))))

(assert (=> b!1232079 (= res!820456 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27116))))

(declare-datatypes ((Unit!40798 0))(
  ( (Unit!40799) )
))
(declare-fun lt!559481 () Unit!40798)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79465 List!27119 List!27119 (_ BitVec 32)) Unit!40798)

(assert (=> b!1232079 (= lt!559481 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27116 from!3184))))

(assert (=> b!1232079 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27115 (select (arr!38346 a!3806) from!3184) acc!823))))

(declare-fun b!1232080 () Bool)

(declare-fun res!820452 () Bool)

(assert (=> b!1232080 (=> (not res!820452) (not e!698882))))

(assert (=> b!1232080 (= res!820452 (not (contains!7181 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232081 () Bool)

(assert (=> b!1232081 (= e!698883 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27115 (select (arr!38346 a!3806) from!3184) Nil!27116)))))

(assert (= (and start!102434 res!820459) b!1232075))

(assert (= (and b!1232075 res!820458) b!1232076))

(assert (= (and b!1232076 res!820451) b!1232074))

(assert (= (and b!1232074 res!820457) b!1232080))

(assert (= (and b!1232080 res!820452) b!1232078))

(assert (= (and b!1232078 res!820450) b!1232073))

(assert (= (and b!1232073 res!820454) b!1232072))

(assert (= (and b!1232072 res!820455) b!1232077))

(assert (= (and b!1232077 res!820453) b!1232079))

(assert (= (and b!1232079 res!820456) b!1232081))

(declare-fun m!1136109 () Bool)

(assert (=> b!1232080 m!1136109))

(declare-fun m!1136111 () Bool)

(assert (=> b!1232075 m!1136111))

(declare-fun m!1136113 () Bool)

(assert (=> b!1232074 m!1136113))

(declare-fun m!1136115 () Bool)

(assert (=> b!1232079 m!1136115))

(declare-fun m!1136117 () Bool)

(assert (=> b!1232079 m!1136117))

(declare-fun m!1136119 () Bool)

(assert (=> b!1232079 m!1136119))

(declare-fun m!1136121 () Bool)

(assert (=> b!1232079 m!1136121))

(assert (=> b!1232081 m!1136119))

(declare-fun m!1136123 () Bool)

(assert (=> b!1232081 m!1136123))

(assert (=> b!1232077 m!1136119))

(assert (=> b!1232077 m!1136119))

(declare-fun m!1136125 () Bool)

(assert (=> b!1232077 m!1136125))

(declare-fun m!1136127 () Bool)

(assert (=> start!102434 m!1136127))

(declare-fun m!1136129 () Bool)

(assert (=> b!1232073 m!1136129))

(declare-fun m!1136131 () Bool)

(assert (=> b!1232072 m!1136131))

(declare-fun m!1136133 () Bool)

(assert (=> b!1232078 m!1136133))

(check-sat (not b!1232072) (not b!1232073) (not start!102434) (not b!1232080) (not b!1232081) (not b!1232074) (not b!1232078) (not b!1232079) (not b!1232077) (not b!1232075))
(check-sat)
