; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102186 () Bool)

(assert start!102186)

(declare-fun b!1230194 () Bool)

(declare-fun res!818686 () Bool)

(declare-fun e!698033 () Bool)

(assert (=> b!1230194 (=> (not res!818686) (not e!698033))))

(declare-datatypes ((array!79361 0))(
  ( (array!79362 (arr!38300 (Array (_ BitVec 32) (_ BitVec 64))) (size!38836 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79361)

(declare-datatypes ((List!27073 0))(
  ( (Nil!27070) (Cons!27069 (h!28278 (_ BitVec 64)) (t!40536 List!27073)) )
))
(declare-fun acc!823 () List!27073)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79361 (_ BitVec 32) List!27073) Bool)

(assert (=> b!1230194 (= res!818686 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1230195 () Bool)

(declare-fun res!818681 () Bool)

(assert (=> b!1230195 (=> (not res!818681) (not e!698033))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79361 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1230195 (= res!818681 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1230196 () Bool)

(declare-fun res!818689 () Bool)

(assert (=> b!1230196 (=> (not res!818689) (not e!698033))))

(assert (=> b!1230196 (= res!818689 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38836 a!3806)) (bvslt from!3184 (size!38836 a!3806))))))

(declare-fun res!818680 () Bool)

(assert (=> start!102186 (=> (not res!818680) (not e!698033))))

(assert (=> start!102186 (= res!818680 (bvslt (size!38836 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102186 e!698033))

(declare-fun array_inv!29148 (array!79361) Bool)

(assert (=> start!102186 (array_inv!29148 a!3806)))

(assert (=> start!102186 true))

(declare-fun b!1230197 () Bool)

(assert (=> b!1230197 (= e!698033 (not true))))

(assert (=> b!1230197 (not (arrayContainsKey!0 a!3806 (select (arr!38300 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40766 0))(
  ( (Unit!40767) )
))
(declare-fun lt!559339 () Unit!40766)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79361 (_ BitVec 32) (_ BitVec 64) List!27073) Unit!40766)

(assert (=> b!1230197 (= lt!559339 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38300 a!3806) from!3184) (Cons!27069 (select (arr!38300 a!3806) from!3184) Nil!27070)))))

(declare-fun e!698032 () Bool)

(assert (=> b!1230197 e!698032))

(declare-fun res!818688 () Bool)

(assert (=> b!1230197 (=> (not res!818688) (not e!698032))))

(assert (=> b!1230197 (= res!818688 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27070))))

(declare-fun lt!559340 () Unit!40766)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79361 List!27073 List!27073 (_ BitVec 32)) Unit!40766)

(assert (=> b!1230197 (= lt!559340 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27070 from!3184))))

(assert (=> b!1230197 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27069 (select (arr!38300 a!3806) from!3184) acc!823))))

(declare-fun b!1230198 () Bool)

(declare-fun res!818687 () Bool)

(assert (=> b!1230198 (=> (not res!818687) (not e!698033))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1230198 (= res!818687 (validKeyInArray!0 k!2913))))

(declare-fun b!1230199 () Bool)

(declare-fun res!818685 () Bool)

(assert (=> b!1230199 (=> (not res!818685) (not e!698033))))

(declare-fun contains!7135 (List!27073 (_ BitVec 64)) Bool)

(assert (=> b!1230199 (= res!818685 (not (contains!7135 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1230200 () Bool)

(declare-fun res!818684 () Bool)

(assert (=> b!1230200 (=> (not res!818684) (not e!698033))))

(declare-fun noDuplicate!1732 (List!27073) Bool)

(assert (=> b!1230200 (= res!818684 (noDuplicate!1732 acc!823))))

(declare-fun b!1230201 () Bool)

(declare-fun res!818683 () Bool)

(assert (=> b!1230201 (=> (not res!818683) (not e!698033))))

(assert (=> b!1230201 (= res!818683 (validKeyInArray!0 (select (arr!38300 a!3806) from!3184)))))

(declare-fun b!1230202 () Bool)

(assert (=> b!1230202 (= e!698032 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27069 (select (arr!38300 a!3806) from!3184) Nil!27070)))))

(declare-fun b!1230203 () Bool)

(declare-fun res!818682 () Bool)

(assert (=> b!1230203 (=> (not res!818682) (not e!698033))))

(assert (=> b!1230203 (= res!818682 (not (contains!7135 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102186 res!818680) b!1230198))

(assert (= (and b!1230198 res!818687) b!1230196))

(assert (= (and b!1230196 res!818689) b!1230200))

(assert (= (and b!1230200 res!818684) b!1230203))

(assert (= (and b!1230203 res!818682) b!1230199))

(assert (= (and b!1230199 res!818685) b!1230195))

(assert (= (and b!1230195 res!818681) b!1230194))

(assert (= (and b!1230194 res!818686) b!1230201))

(assert (= (and b!1230201 res!818683) b!1230197))

(assert (= (and b!1230197 res!818688) b!1230202))

(declare-fun m!1134649 () Bool)

(assert (=> b!1230202 m!1134649))

(declare-fun m!1134651 () Bool)

(assert (=> b!1230202 m!1134651))

(declare-fun m!1134653 () Bool)

(assert (=> b!1230195 m!1134653))

(declare-fun m!1134655 () Bool)

(assert (=> start!102186 m!1134655))

(declare-fun m!1134657 () Bool)

(assert (=> b!1230198 m!1134657))

(assert (=> b!1230201 m!1134649))

(assert (=> b!1230201 m!1134649))

(declare-fun m!1134659 () Bool)

(assert (=> b!1230201 m!1134659))

(declare-fun m!1134661 () Bool)

(assert (=> b!1230197 m!1134661))

(declare-fun m!1134663 () Bool)

(assert (=> b!1230197 m!1134663))

(assert (=> b!1230197 m!1134649))

(declare-fun m!1134665 () Bool)

(assert (=> b!1230197 m!1134665))

(assert (=> b!1230197 m!1134649))

(declare-fun m!1134667 () Bool)

(assert (=> b!1230197 m!1134667))

(assert (=> b!1230197 m!1134649))

(declare-fun m!1134669 () Bool)

(assert (=> b!1230197 m!1134669))

(declare-fun m!1134671 () Bool)

(assert (=> b!1230203 m!1134671))

(declare-fun m!1134673 () Bool)

(assert (=> b!1230194 m!1134673))

(declare-fun m!1134675 () Bool)

(assert (=> b!1230200 m!1134675))

(declare-fun m!1134677 () Bool)

(assert (=> b!1230199 m!1134677))

(push 1)

(assert (not b!1230199))

(assert (not b!1230197))

(assert (not b!1230200))

(assert (not b!1230195))

(assert (not start!102186))

(assert (not b!1230203))

(assert (not b!1230201))

(assert (not b!1230198))

(assert (not b!1230202))

(assert (not b!1230194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

