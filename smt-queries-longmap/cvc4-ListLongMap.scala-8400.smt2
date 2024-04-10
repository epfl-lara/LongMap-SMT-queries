; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102184 () Bool)

(assert start!102184)

(declare-fun b!1230164 () Bool)

(declare-fun res!818650 () Bool)

(declare-fun e!698024 () Bool)

(assert (=> b!1230164 (=> (not res!818650) (not e!698024))))

(declare-datatypes ((List!27072 0))(
  ( (Nil!27069) (Cons!27068 (h!28277 (_ BitVec 64)) (t!40535 List!27072)) )
))
(declare-fun acc!823 () List!27072)

(declare-fun contains!7134 (List!27072 (_ BitVec 64)) Bool)

(assert (=> b!1230164 (= res!818650 (not (contains!7134 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230165 () Bool)

(declare-fun res!818656 () Bool)

(assert (=> b!1230165 (=> (not res!818656) (not e!698024))))

(assert (=> b!1230165 (= res!818656 (not (contains!7134 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230166 () Bool)

(assert (=> b!1230166 (= e!698024 (not true))))

(declare-datatypes ((array!79359 0))(
  ( (array!79360 (arr!38299 (Array (_ BitVec 32) (_ BitVec 64))) (size!38835 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79359)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230166 (not (arrayContainsKey!0 a!3806 (select (arr!38299 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40764 0))(
  ( (Unit!40765) )
))
(declare-fun lt!559334 () Unit!40764)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79359 (_ BitVec 32) (_ BitVec 64) List!27072) Unit!40764)

(assert (=> b!1230166 (= lt!559334 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38299 a!3806) from!3184) (Cons!27068 (select (arr!38299 a!3806) from!3184) Nil!27069)))))

(declare-fun e!698023 () Bool)

(assert (=> b!1230166 e!698023))

(declare-fun res!818651 () Bool)

(assert (=> b!1230166 (=> (not res!818651) (not e!698023))))

(declare-fun arrayNoDuplicates!0 (array!79359 (_ BitVec 32) List!27072) Bool)

(assert (=> b!1230166 (= res!818651 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27069))))

(declare-fun lt!559333 () Unit!40764)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79359 List!27072 List!27072 (_ BitVec 32)) Unit!40764)

(assert (=> b!1230166 (= lt!559333 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27069 from!3184))))

(assert (=> b!1230166 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27068 (select (arr!38299 a!3806) from!3184) acc!823))))

(declare-fun res!818658 () Bool)

(assert (=> start!102184 (=> (not res!818658) (not e!698024))))

(assert (=> start!102184 (= res!818658 (bvslt (size!38835 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102184 e!698024))

(declare-fun array_inv!29147 (array!79359) Bool)

(assert (=> start!102184 (array_inv!29147 a!3806)))

(assert (=> start!102184 true))

(declare-fun b!1230167 () Bool)

(declare-fun res!818653 () Bool)

(assert (=> b!1230167 (=> (not res!818653) (not e!698024))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230167 (= res!818653 (validKeyInArray!0 k!2913))))

(declare-fun b!1230168 () Bool)

(assert (=> b!1230168 (= e!698023 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27068 (select (arr!38299 a!3806) from!3184) Nil!27069)))))

(declare-fun b!1230169 () Bool)

(declare-fun res!818659 () Bool)

(assert (=> b!1230169 (=> (not res!818659) (not e!698024))))

(declare-fun noDuplicate!1731 (List!27072) Bool)

(assert (=> b!1230169 (= res!818659 (noDuplicate!1731 acc!823))))

(declare-fun b!1230170 () Bool)

(declare-fun res!818657 () Bool)

(assert (=> b!1230170 (=> (not res!818657) (not e!698024))))

(assert (=> b!1230170 (= res!818657 (validKeyInArray!0 (select (arr!38299 a!3806) from!3184)))))

(declare-fun b!1230171 () Bool)

(declare-fun res!818654 () Bool)

(assert (=> b!1230171 (=> (not res!818654) (not e!698024))))

(assert (=> b!1230171 (= res!818654 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230172 () Bool)

(declare-fun res!818655 () Bool)

(assert (=> b!1230172 (=> (not res!818655) (not e!698024))))

(assert (=> b!1230172 (= res!818655 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230173 () Bool)

(declare-fun res!818652 () Bool)

(assert (=> b!1230173 (=> (not res!818652) (not e!698024))))

(assert (=> b!1230173 (= res!818652 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38835 a!3806)) (bvslt from!3184 (size!38835 a!3806))))))

(assert (= (and start!102184 res!818658) b!1230167))

(assert (= (and b!1230167 res!818653) b!1230173))

(assert (= (and b!1230173 res!818652) b!1230169))

(assert (= (and b!1230169 res!818659) b!1230165))

(assert (= (and b!1230165 res!818656) b!1230164))

(assert (= (and b!1230164 res!818650) b!1230171))

(assert (= (and b!1230171 res!818654) b!1230172))

(assert (= (and b!1230172 res!818655) b!1230170))

(assert (= (and b!1230170 res!818657) b!1230166))

(assert (= (and b!1230166 res!818651) b!1230168))

(declare-fun m!1134619 () Bool)

(assert (=> b!1230166 m!1134619))

(declare-fun m!1134621 () Bool)

(assert (=> b!1230166 m!1134621))

(declare-fun m!1134623 () Bool)

(assert (=> b!1230166 m!1134623))

(declare-fun m!1134625 () Bool)

(assert (=> b!1230166 m!1134625))

(assert (=> b!1230166 m!1134623))

(declare-fun m!1134627 () Bool)

(assert (=> b!1230166 m!1134627))

(assert (=> b!1230166 m!1134623))

(declare-fun m!1134629 () Bool)

(assert (=> b!1230166 m!1134629))

(declare-fun m!1134631 () Bool)

(assert (=> b!1230172 m!1134631))

(declare-fun m!1134633 () Bool)

(assert (=> b!1230165 m!1134633))

(declare-fun m!1134635 () Bool)

(assert (=> b!1230171 m!1134635))

(assert (=> b!1230168 m!1134623))

(declare-fun m!1134637 () Bool)

(assert (=> b!1230168 m!1134637))

(declare-fun m!1134639 () Bool)

(assert (=> b!1230167 m!1134639))

(declare-fun m!1134641 () Bool)

(assert (=> b!1230164 m!1134641))

(declare-fun m!1134643 () Bool)

(assert (=> start!102184 m!1134643))

(declare-fun m!1134645 () Bool)

(assert (=> b!1230169 m!1134645))

(assert (=> b!1230170 m!1134623))

(assert (=> b!1230170 m!1134623))

(declare-fun m!1134647 () Bool)

(assert (=> b!1230170 m!1134647))

(push 1)

(assert (not b!1230165))

(assert (not b!1230167))

(assert (not b!1230168))

(assert (not b!1230171))

(assert (not b!1230164))

(assert (not start!102184))

(assert (not b!1230172))

(assert (not b!1230166))

(assert (not b!1230170))

(assert (not b!1230169))

(check-sat)

