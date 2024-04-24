; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102886 () Bool)

(assert start!102886)

(declare-fun b!1235259 () Bool)

(declare-fun res!822652 () Bool)

(declare-fun e!700783 () Bool)

(assert (=> b!1235259 (=> (not res!822652) (not e!700783))))

(declare-datatypes ((List!27176 0))(
  ( (Nil!27173) (Cons!27172 (h!28390 (_ BitVec 64)) (t!40631 List!27176)) )
))
(declare-fun acc!823 () List!27176)

(declare-fun contains!7247 (List!27176 (_ BitVec 64)) Bool)

(assert (=> b!1235259 (= res!822652 (not (contains!7247 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235260 () Bool)

(declare-fun res!822648 () Bool)

(assert (=> b!1235260 (=> (not res!822648) (not e!700783))))

(declare-datatypes ((array!79574 0))(
  ( (array!79575 (arr!38390 (Array (_ BitVec 32) (_ BitVec 64))) (size!38927 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79574)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79574 (_ BitVec 32) List!27176) Bool)

(assert (=> b!1235260 (= res!822648 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1235261 () Bool)

(declare-fun res!822650 () Bool)

(assert (=> b!1235261 (=> (not res!822650) (not e!700783))))

(assert (=> b!1235261 (= res!822650 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38927 a!3806)) (bvslt from!3184 (size!38927 a!3806))))))

(declare-fun b!1235262 () Bool)

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1235262 (= e!700783 (not (not (= (select (arr!38390 a!3806) from!3184) k0!2913))))))

(declare-fun arrayContainsKey!0 (array!79574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1235262 (not (arrayContainsKey!0 a!3806 (select (arr!38390 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40835 0))(
  ( (Unit!40836) )
))
(declare-fun lt!560260 () Unit!40835)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79574 (_ BitVec 32) (_ BitVec 64) List!27176) Unit!40835)

(assert (=> b!1235262 (= lt!560260 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38390 a!3806) from!3184) (Cons!27172 (select (arr!38390 a!3806) from!3184) Nil!27173)))))

(declare-fun e!700782 () Bool)

(assert (=> b!1235262 e!700782))

(declare-fun res!822653 () Bool)

(assert (=> b!1235262 (=> (not res!822653) (not e!700782))))

(assert (=> b!1235262 (= res!822653 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27173))))

(declare-fun lt!560261 () Unit!40835)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79574 List!27176 List!27176 (_ BitVec 32)) Unit!40835)

(assert (=> b!1235262 (= lt!560261 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27173 from!3184))))

(assert (=> b!1235262 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27172 (select (arr!38390 a!3806) from!3184) acc!823))))

(declare-fun res!822657 () Bool)

(assert (=> start!102886 (=> (not res!822657) (not e!700783))))

(assert (=> start!102886 (= res!822657 (bvslt (size!38927 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102886 e!700783))

(declare-fun array_inv!29328 (array!79574) Bool)

(assert (=> start!102886 (array_inv!29328 a!3806)))

(assert (=> start!102886 true))

(declare-fun b!1235263 () Bool)

(declare-fun res!822651 () Bool)

(assert (=> b!1235263 (=> (not res!822651) (not e!700783))))

(assert (=> b!1235263 (= res!822651 (not (contains!7247 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235264 () Bool)

(declare-fun res!822649 () Bool)

(assert (=> b!1235264 (=> (not res!822649) (not e!700783))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235264 (= res!822649 (validKeyInArray!0 (select (arr!38390 a!3806) from!3184)))))

(declare-fun b!1235265 () Bool)

(declare-fun res!822656 () Bool)

(assert (=> b!1235265 (=> (not res!822656) (not e!700783))))

(assert (=> b!1235265 (= res!822656 (validKeyInArray!0 k0!2913))))

(declare-fun b!1235266 () Bool)

(declare-fun res!822655 () Bool)

(assert (=> b!1235266 (=> (not res!822655) (not e!700783))))

(assert (=> b!1235266 (= res!822655 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1235267 () Bool)

(declare-fun res!822654 () Bool)

(assert (=> b!1235267 (=> (not res!822654) (not e!700783))))

(declare-fun noDuplicate!1828 (List!27176) Bool)

(assert (=> b!1235267 (= res!822654 (noDuplicate!1828 acc!823))))

(declare-fun b!1235268 () Bool)

(assert (=> b!1235268 (= e!700782 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27172 (select (arr!38390 a!3806) from!3184) Nil!27173)))))

(assert (= (and start!102886 res!822657) b!1235265))

(assert (= (and b!1235265 res!822656) b!1235261))

(assert (= (and b!1235261 res!822650) b!1235267))

(assert (= (and b!1235267 res!822654) b!1235263))

(assert (= (and b!1235263 res!822651) b!1235259))

(assert (= (and b!1235259 res!822652) b!1235266))

(assert (= (and b!1235266 res!822655) b!1235260))

(assert (= (and b!1235260 res!822648) b!1235264))

(assert (= (and b!1235264 res!822649) b!1235262))

(assert (= (and b!1235262 res!822653) b!1235268))

(declare-fun m!1139639 () Bool)

(assert (=> b!1235262 m!1139639))

(declare-fun m!1139641 () Bool)

(assert (=> b!1235262 m!1139641))

(declare-fun m!1139643 () Bool)

(assert (=> b!1235262 m!1139643))

(declare-fun m!1139645 () Bool)

(assert (=> b!1235262 m!1139645))

(assert (=> b!1235262 m!1139643))

(declare-fun m!1139647 () Bool)

(assert (=> b!1235262 m!1139647))

(assert (=> b!1235262 m!1139643))

(declare-fun m!1139649 () Bool)

(assert (=> b!1235262 m!1139649))

(declare-fun m!1139651 () Bool)

(assert (=> b!1235266 m!1139651))

(declare-fun m!1139653 () Bool)

(assert (=> b!1235265 m!1139653))

(declare-fun m!1139655 () Bool)

(assert (=> b!1235260 m!1139655))

(assert (=> b!1235268 m!1139643))

(declare-fun m!1139657 () Bool)

(assert (=> b!1235268 m!1139657))

(declare-fun m!1139659 () Bool)

(assert (=> b!1235267 m!1139659))

(declare-fun m!1139661 () Bool)

(assert (=> b!1235263 m!1139661))

(declare-fun m!1139663 () Bool)

(assert (=> start!102886 m!1139663))

(declare-fun m!1139665 () Bool)

(assert (=> b!1235259 m!1139665))

(assert (=> b!1235264 m!1139643))

(assert (=> b!1235264 m!1139643))

(declare-fun m!1139667 () Bool)

(assert (=> b!1235264 m!1139667))

(check-sat (not b!1235265) (not b!1235264) (not start!102886) (not b!1235263) (not b!1235267) (not b!1235259) (not b!1235268) (not b!1235262) (not b!1235266) (not b!1235260))
(check-sat)
