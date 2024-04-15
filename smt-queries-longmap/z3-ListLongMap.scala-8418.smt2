; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102442 () Bool)

(assert start!102442)

(declare-fun b!1232154 () Bool)

(declare-fun res!820573 () Bool)

(declare-fun e!698892 () Bool)

(assert (=> b!1232154 (=> (not res!820573) (not e!698892))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232154 (= res!820573 (validKeyInArray!0 k0!2913))))

(declare-fun b!1232156 () Bool)

(declare-fun res!820572 () Bool)

(assert (=> b!1232156 (=> (not res!820572) (not e!698892))))

(declare-datatypes ((array!79396 0))(
  ( (array!79397 (arr!38312 (Array (_ BitVec 32) (_ BitVec 64))) (size!38850 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79396)

(declare-fun from!3184 () (_ BitVec 32))

(assert (=> b!1232156 (= res!820572 (validKeyInArray!0 (select (arr!38312 a!3806) from!3184)))))

(declare-fun b!1232157 () Bool)

(declare-fun e!698893 () Bool)

(declare-datatypes ((List!27186 0))(
  ( (Nil!27183) (Cons!27182 (h!28391 (_ BitVec 64)) (t!40640 List!27186)) )
))
(declare-fun arrayNoDuplicates!0 (array!79396 (_ BitVec 32) List!27186) Bool)

(assert (=> b!1232157 (= e!698893 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27182 (select (arr!38312 a!3806) from!3184) Nil!27183)))))

(declare-fun b!1232158 () Bool)

(declare-fun res!820570 () Bool)

(assert (=> b!1232158 (=> (not res!820570) (not e!698892))))

(declare-fun arrayContainsKey!0 (array!79396 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232158 (= res!820570 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232159 () Bool)

(declare-fun res!820577 () Bool)

(assert (=> b!1232159 (=> (not res!820577) (not e!698892))))

(declare-fun acc!823 () List!27186)

(declare-fun contains!7158 (List!27186 (_ BitVec 64)) Bool)

(assert (=> b!1232159 (= res!820577 (not (contains!7158 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232160 () Bool)

(assert (=> b!1232160 (= e!698892 (not (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000)))))

(assert (=> b!1232160 e!698893))

(declare-fun res!820576 () Bool)

(assert (=> b!1232160 (=> (not res!820576) (not e!698893))))

(assert (=> b!1232160 (= res!820576 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27183))))

(declare-datatypes ((Unit!40655 0))(
  ( (Unit!40656) )
))
(declare-fun lt!559322 () Unit!40655)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79396 List!27186 List!27186 (_ BitVec 32)) Unit!40655)

(assert (=> b!1232160 (= lt!559322 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27183 from!3184))))

(assert (=> b!1232160 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27182 (select (arr!38312 a!3806) from!3184) acc!823))))

(declare-fun b!1232161 () Bool)

(declare-fun res!820569 () Bool)

(assert (=> b!1232161 (=> (not res!820569) (not e!698892))))

(assert (=> b!1232161 (= res!820569 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38850 a!3806)) (bvslt from!3184 (size!38850 a!3806))))))

(declare-fun b!1232155 () Bool)

(declare-fun res!820568 () Bool)

(assert (=> b!1232155 (=> (not res!820568) (not e!698892))))

(assert (=> b!1232155 (= res!820568 (not (contains!7158 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!820571 () Bool)

(assert (=> start!102442 (=> (not res!820571) (not e!698892))))

(assert (=> start!102442 (= res!820571 (bvslt (size!38850 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102442 e!698892))

(declare-fun array_inv!29295 (array!79396) Bool)

(assert (=> start!102442 (array_inv!29295 a!3806)))

(assert (=> start!102442 true))

(declare-fun b!1232162 () Bool)

(declare-fun res!820574 () Bool)

(assert (=> b!1232162 (=> (not res!820574) (not e!698892))))

(declare-fun noDuplicate!1801 (List!27186) Bool)

(assert (=> b!1232162 (= res!820574 (noDuplicate!1801 acc!823))))

(declare-fun b!1232163 () Bool)

(declare-fun res!820575 () Bool)

(assert (=> b!1232163 (=> (not res!820575) (not e!698892))))

(assert (=> b!1232163 (= res!820575 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(assert (= (and start!102442 res!820571) b!1232154))

(assert (= (and b!1232154 res!820573) b!1232161))

(assert (= (and b!1232161 res!820569) b!1232162))

(assert (= (and b!1232162 res!820574) b!1232155))

(assert (= (and b!1232155 res!820568) b!1232159))

(assert (= (and b!1232159 res!820577) b!1232158))

(assert (= (and b!1232158 res!820570) b!1232163))

(assert (= (and b!1232163 res!820575) b!1232156))

(assert (= (and b!1232156 res!820572) b!1232160))

(assert (= (and b!1232160 res!820576) b!1232157))

(declare-fun m!1135743 () Bool)

(assert (=> start!102442 m!1135743))

(declare-fun m!1135745 () Bool)

(assert (=> b!1232157 m!1135745))

(declare-fun m!1135747 () Bool)

(assert (=> b!1232157 m!1135747))

(declare-fun m!1135749 () Bool)

(assert (=> b!1232160 m!1135749))

(declare-fun m!1135751 () Bool)

(assert (=> b!1232160 m!1135751))

(assert (=> b!1232160 m!1135745))

(declare-fun m!1135753 () Bool)

(assert (=> b!1232160 m!1135753))

(declare-fun m!1135755 () Bool)

(assert (=> b!1232162 m!1135755))

(declare-fun m!1135757 () Bool)

(assert (=> b!1232154 m!1135757))

(assert (=> b!1232156 m!1135745))

(assert (=> b!1232156 m!1135745))

(declare-fun m!1135759 () Bool)

(assert (=> b!1232156 m!1135759))

(declare-fun m!1135761 () Bool)

(assert (=> b!1232158 m!1135761))

(declare-fun m!1135763 () Bool)

(assert (=> b!1232159 m!1135763))

(declare-fun m!1135765 () Bool)

(assert (=> b!1232155 m!1135765))

(declare-fun m!1135767 () Bool)

(assert (=> b!1232163 m!1135767))

(check-sat (not b!1232159) (not b!1232155) (not b!1232157) (not b!1232154) (not start!102442) (not b!1232158) (not b!1232163) (not b!1232156) (not b!1232160) (not b!1232162))
(check-sat)
