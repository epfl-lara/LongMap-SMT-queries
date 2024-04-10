; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102656 () Bool)

(assert start!102656)

(declare-fun b!1234040 () Bool)

(declare-fun res!822226 () Bool)

(declare-fun e!699951 () Bool)

(assert (=> b!1234040 (=> (not res!822226) (not e!699951))))

(declare-datatypes ((List!27155 0))(
  ( (Nil!27152) (Cons!27151 (h!28360 (_ BitVec 64)) (t!40618 List!27155)) )
))
(declare-fun acc!823 () List!27155)

(declare-fun noDuplicate!1814 (List!27155) Bool)

(assert (=> b!1234040 (= res!822226 (noDuplicate!1814 acc!823))))

(declare-fun res!822223 () Bool)

(assert (=> start!102656 (=> (not res!822223) (not e!699951))))

(declare-datatypes ((array!79546 0))(
  ( (array!79547 (arr!38382 (Array (_ BitVec 32) (_ BitVec 64))) (size!38918 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79546)

(assert (=> start!102656 (= res!822223 (bvslt (size!38918 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102656 e!699951))

(declare-fun array_inv!29230 (array!79546) Bool)

(assert (=> start!102656 (array_inv!29230 a!3806)))

(assert (=> start!102656 true))

(declare-fun b!1234041 () Bool)

(declare-fun res!822224 () Bool)

(assert (=> b!1234041 (=> (not res!822224) (not e!699951))))

(declare-fun contains!7217 (List!27155 (_ BitVec 64)) Bool)

(assert (=> b!1234041 (= res!822224 (not (contains!7217 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234042 () Bool)

(assert (=> b!1234042 (= e!699951 false)))

(declare-fun lt!559793 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79546 (_ BitVec 32) List!27155) Bool)

(assert (=> b!1234042 (= lt!559793 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234043 () Bool)

(declare-fun res!822220 () Bool)

(assert (=> b!1234043 (=> (not res!822220) (not e!699951))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234043 (= res!822220 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234044 () Bool)

(declare-fun res!822222 () Bool)

(assert (=> b!1234044 (=> (not res!822222) (not e!699951))))

(assert (=> b!1234044 (= res!822222 (not (contains!7217 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234045 () Bool)

(declare-fun res!822221 () Bool)

(assert (=> b!1234045 (=> (not res!822221) (not e!699951))))

(assert (=> b!1234045 (= res!822221 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38918 a!3806)) (bvslt from!3184 (size!38918 a!3806))))))

(declare-fun b!1234046 () Bool)

(declare-fun res!822225 () Bool)

(assert (=> b!1234046 (=> (not res!822225) (not e!699951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234046 (= res!822225 (validKeyInArray!0 k0!2913))))

(assert (= (and start!102656 res!822223) b!1234046))

(assert (= (and b!1234046 res!822225) b!1234045))

(assert (= (and b!1234045 res!822221) b!1234040))

(assert (= (and b!1234040 res!822226) b!1234041))

(assert (= (and b!1234041 res!822224) b!1234044))

(assert (= (and b!1234044 res!822222) b!1234043))

(assert (= (and b!1234043 res!822220) b!1234042))

(declare-fun m!1138095 () Bool)

(assert (=> b!1234041 m!1138095))

(declare-fun m!1138097 () Bool)

(assert (=> b!1234043 m!1138097))

(declare-fun m!1138099 () Bool)

(assert (=> b!1234040 m!1138099))

(declare-fun m!1138101 () Bool)

(assert (=> b!1234046 m!1138101))

(declare-fun m!1138103 () Bool)

(assert (=> b!1234044 m!1138103))

(declare-fun m!1138105 () Bool)

(assert (=> start!102656 m!1138105))

(declare-fun m!1138107 () Bool)

(assert (=> b!1234042 m!1138107))

(check-sat (not b!1234041) (not b!1234046) (not b!1234043) (not b!1234044) (not start!102656) (not b!1234040) (not b!1234042))
