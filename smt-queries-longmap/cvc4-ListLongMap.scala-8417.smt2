; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102442 () Bool)

(assert start!102442)

(declare-fun res!820573 () Bool)

(declare-fun e!698918 () Bool)

(assert (=> start!102442 (=> (not res!820573) (not e!698918))))

(declare-datatypes ((array!79473 0))(
  ( (array!79474 (arr!38350 (Array (_ BitVec 32) (_ BitVec 64))) (size!38886 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79473)

(assert (=> start!102442 (= res!820573 (bvslt (size!38886 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102442 e!698918))

(declare-fun array_inv!29198 (array!79473) Bool)

(assert (=> start!102442 (array_inv!29198 a!3806)))

(assert (=> start!102442 true))

(declare-fun b!1232192 () Bool)

(declare-fun e!698917 () Bool)

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((List!27123 0))(
  ( (Nil!27120) (Cons!27119 (h!28328 (_ BitVec 64)) (t!40586 List!27123)) )
))
(declare-fun arrayNoDuplicates!0 (array!79473 (_ BitVec 32) List!27123) Bool)

(assert (=> b!1232192 (= e!698917 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27119 (select (arr!38350 a!3806) from!3184) Nil!27120)))))

(declare-fun b!1232193 () Bool)

(declare-fun res!820579 () Bool)

(assert (=> b!1232193 (=> (not res!820579) (not e!698918))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1232193 (= res!820579 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1232194 () Bool)

(declare-fun res!820578 () Bool)

(assert (=> b!1232194 (=> (not res!820578) (not e!698918))))

(assert (=> b!1232194 (= res!820578 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38886 a!3806)) (bvslt from!3184 (size!38886 a!3806))))))

(declare-fun b!1232195 () Bool)

(declare-fun res!820574 () Bool)

(assert (=> b!1232195 (=> (not res!820574) (not e!698918))))

(declare-fun acc!823 () List!27123)

(declare-fun noDuplicate!1782 (List!27123) Bool)

(assert (=> b!1232195 (= res!820574 (noDuplicate!1782 acc!823))))

(declare-fun b!1232196 () Bool)

(declare-fun res!820576 () Bool)

(assert (=> b!1232196 (=> (not res!820576) (not e!698918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1232196 (= res!820576 (validKeyInArray!0 (select (arr!38350 a!3806) from!3184)))))

(declare-fun b!1232197 () Bool)

(declare-fun res!820572 () Bool)

(assert (=> b!1232197 (=> (not res!820572) (not e!698918))))

(assert (=> b!1232197 (= res!820572 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1232198 () Bool)

(declare-fun res!820575 () Bool)

(assert (=> b!1232198 (=> (not res!820575) (not e!698918))))

(declare-fun contains!7185 (List!27123 (_ BitVec 64)) Bool)

(assert (=> b!1232198 (= res!820575 (not (contains!7185 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232199 () Bool)

(declare-fun res!820570 () Bool)

(assert (=> b!1232199 (=> (not res!820570) (not e!698918))))

(assert (=> b!1232199 (= res!820570 (not (contains!7185 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1232200 () Bool)

(declare-fun res!820577 () Bool)

(assert (=> b!1232200 (=> (not res!820577) (not e!698918))))

(assert (=> b!1232200 (= res!820577 (validKeyInArray!0 k!2913))))

(declare-fun b!1232201 () Bool)

(assert (=> b!1232201 (= e!698918 (not true))))

(assert (=> b!1232201 e!698917))

(declare-fun res!820571 () Bool)

(assert (=> b!1232201 (=> (not res!820571) (not e!698917))))

(assert (=> b!1232201 (= res!820571 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27120))))

(declare-datatypes ((Unit!40806 0))(
  ( (Unit!40807) )
))
(declare-fun lt!559493 () Unit!40806)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79473 List!27123 List!27123 (_ BitVec 32)) Unit!40806)

(assert (=> b!1232201 (= lt!559493 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27120 from!3184))))

(assert (=> b!1232201 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27119 (select (arr!38350 a!3806) from!3184) acc!823))))

(assert (= (and start!102442 res!820573) b!1232200))

(assert (= (and b!1232200 res!820577) b!1232194))

(assert (= (and b!1232194 res!820578) b!1232195))

(assert (= (and b!1232195 res!820574) b!1232198))

(assert (= (and b!1232198 res!820575) b!1232199))

(assert (= (and b!1232199 res!820570) b!1232193))

(assert (= (and b!1232193 res!820579) b!1232197))

(assert (= (and b!1232197 res!820572) b!1232196))

(assert (= (and b!1232196 res!820576) b!1232201))

(assert (= (and b!1232201 res!820571) b!1232192))

(declare-fun m!1136213 () Bool)

(assert (=> b!1232200 m!1136213))

(declare-fun m!1136215 () Bool)

(assert (=> b!1232201 m!1136215))

(declare-fun m!1136217 () Bool)

(assert (=> b!1232201 m!1136217))

(declare-fun m!1136219 () Bool)

(assert (=> b!1232201 m!1136219))

(declare-fun m!1136221 () Bool)

(assert (=> b!1232201 m!1136221))

(declare-fun m!1136223 () Bool)

(assert (=> start!102442 m!1136223))

(declare-fun m!1136225 () Bool)

(assert (=> b!1232198 m!1136225))

(declare-fun m!1136227 () Bool)

(assert (=> b!1232197 m!1136227))

(declare-fun m!1136229 () Bool)

(assert (=> b!1232199 m!1136229))

(assert (=> b!1232196 m!1136219))

(assert (=> b!1232196 m!1136219))

(declare-fun m!1136231 () Bool)

(assert (=> b!1232196 m!1136231))

(declare-fun m!1136233 () Bool)

(assert (=> b!1232195 m!1136233))

(assert (=> b!1232192 m!1136219))

(declare-fun m!1136235 () Bool)

(assert (=> b!1232192 m!1136235))

(declare-fun m!1136237 () Bool)

(assert (=> b!1232193 m!1136237))

(push 1)

(assert (not b!1232198))

(assert (not b!1232201))

(assert (not b!1232197))

(assert (not b!1232192))

(assert (not b!1232193))

(assert (not b!1232200))

(assert (not b!1232196))

(assert (not b!1232195))

(assert (not start!102442))

(assert (not b!1232199))

(check-sat)

(pop 1)

(push 1)

(check-sat)

