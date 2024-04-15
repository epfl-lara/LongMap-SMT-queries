; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102658 () Bool)

(assert start!102658)

(declare-fun b!1234018 () Bool)

(declare-fun res!822239 () Bool)

(declare-fun e!699929 () Bool)

(assert (=> b!1234018 (=> (not res!822239) (not e!699929))))

(declare-datatypes ((array!79471 0))(
  ( (array!79472 (arr!38345 (Array (_ BitVec 32) (_ BitVec 64))) (size!38883 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79471)

(declare-datatypes ((List!27219 0))(
  ( (Nil!27216) (Cons!27215 (h!28424 (_ BitVec 64)) (t!40673 List!27219)) )
))
(declare-fun acc!823 () List!27219)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79471 (_ BitVec 32) List!27219) Bool)

(assert (=> b!1234018 (= res!822239 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1234019 () Bool)

(declare-fun res!822236 () Bool)

(assert (=> b!1234019 (=> (not res!822236) (not e!699929))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1234019 (= res!822236 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1234020 () Bool)

(declare-fun res!822240 () Bool)

(assert (=> b!1234020 (=> (not res!822240) (not e!699929))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1234020 (= res!822240 (validKeyInArray!0 k0!2913))))

(declare-fun b!1234021 () Bool)

(declare-fun res!822238 () Bool)

(assert (=> b!1234021 (=> (not res!822238) (not e!699929))))

(declare-fun contains!7191 (List!27219 (_ BitVec 64)) Bool)

(assert (=> b!1234021 (= res!822238 (not (contains!7191 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1234022 () Bool)

(declare-fun res!822242 () Bool)

(assert (=> b!1234022 (=> (not res!822242) (not e!699929))))

(assert (=> b!1234022 (= res!822242 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38883 a!3806)) (bvslt from!3184 (size!38883 a!3806))))))

(declare-fun b!1234023 () Bool)

(declare-fun res!822237 () Bool)

(assert (=> b!1234023 (=> (not res!822237) (not e!699929))))

(assert (=> b!1234023 (= res!822237 (not (contains!7191 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!822234 () Bool)

(assert (=> start!102658 (=> (not res!822234) (not e!699929))))

(assert (=> start!102658 (= res!822234 (bvslt (size!38883 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102658 e!699929))

(declare-fun array_inv!29328 (array!79471) Bool)

(assert (=> start!102658 (array_inv!29328 a!3806)))

(assert (=> start!102658 true))

(declare-fun b!1234024 () Bool)

(declare-fun res!822235 () Bool)

(assert (=> b!1234024 (=> (not res!822235) (not e!699929))))

(assert (=> b!1234024 (= res!822235 (not (validKeyInArray!0 (select (arr!38345 a!3806) from!3184))))))

(declare-fun b!1234025 () Bool)

(assert (=> b!1234025 (= e!699929 (= (select (arr!38345 a!3806) from!3184) k0!2913))))

(declare-fun b!1234026 () Bool)

(declare-fun res!822241 () Bool)

(assert (=> b!1234026 (=> (not res!822241) (not e!699929))))

(declare-fun noDuplicate!1834 (List!27219) Bool)

(assert (=> b!1234026 (= res!822241 (noDuplicate!1834 acc!823))))

(assert (= (and start!102658 res!822234) b!1234020))

(assert (= (and b!1234020 res!822240) b!1234022))

(assert (= (and b!1234022 res!822242) b!1234026))

(assert (= (and b!1234026 res!822241) b!1234023))

(assert (= (and b!1234023 res!822237) b!1234021))

(assert (= (and b!1234021 res!822238) b!1234019))

(assert (= (and b!1234019 res!822236) b!1234018))

(assert (= (and b!1234018 res!822239) b!1234024))

(assert (= (and b!1234024 res!822235) b!1234025))

(declare-fun m!1137627 () Bool)

(assert (=> b!1234026 m!1137627))

(declare-fun m!1137629 () Bool)

(assert (=> b!1234018 m!1137629))

(declare-fun m!1137631 () Bool)

(assert (=> b!1234025 m!1137631))

(declare-fun m!1137633 () Bool)

(assert (=> b!1234023 m!1137633))

(declare-fun m!1137635 () Bool)

(assert (=> b!1234021 m!1137635))

(declare-fun m!1137637 () Bool)

(assert (=> b!1234020 m!1137637))

(declare-fun m!1137639 () Bool)

(assert (=> start!102658 m!1137639))

(assert (=> b!1234024 m!1137631))

(assert (=> b!1234024 m!1137631))

(declare-fun m!1137641 () Bool)

(assert (=> b!1234024 m!1137641))

(declare-fun m!1137643 () Bool)

(assert (=> b!1234019 m!1137643))

(check-sat (not b!1234026) (not b!1234024) (not b!1234019) (not start!102658) (not b!1234023) (not b!1234018) (not b!1234020) (not b!1234021))
(check-sat)
