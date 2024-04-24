; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102672 () Bool)

(assert start!102672)

(declare-fun b!1233370 () Bool)

(declare-fun res!820959 () Bool)

(declare-fun e!699738 () Bool)

(assert (=> b!1233370 (=> (not res!820959) (not e!699738))))

(declare-datatypes ((array!79499 0))(
  ( (array!79500 (arr!38357 (Array (_ BitVec 32) (_ BitVec 64))) (size!38894 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79499)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233370 (= res!820959 (validKeyInArray!0 (select (arr!38357 a!3806) from!3184)))))

(declare-fun b!1233371 () Bool)

(declare-fun res!820956 () Bool)

(assert (=> b!1233371 (=> (not res!820956) (not e!699738))))

(declare-fun k0!2913 () (_ BitVec 64))

(assert (=> b!1233371 (= res!820956 (validKeyInArray!0 k0!2913))))

(declare-fun b!1233372 () Bool)

(declare-fun res!820962 () Bool)

(assert (=> b!1233372 (=> (not res!820962) (not e!699738))))

(assert (=> b!1233372 (= res!820962 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38894 a!3806)) (bvslt from!3184 (size!38894 a!3806))))))

(declare-fun b!1233373 () Bool)

(declare-fun res!820955 () Bool)

(assert (=> b!1233373 (=> (not res!820955) (not e!699738))))

(declare-datatypes ((List!27143 0))(
  ( (Nil!27140) (Cons!27139 (h!28357 (_ BitVec 64)) (t!40598 List!27143)) )
))
(declare-fun acc!823 () List!27143)

(declare-fun arrayNoDuplicates!0 (array!79499 (_ BitVec 32) List!27143) Bool)

(assert (=> b!1233373 (= res!820955 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233374 () Bool)

(declare-fun res!820960 () Bool)

(assert (=> b!1233374 (=> (not res!820960) (not e!699738))))

(declare-fun arrayContainsKey!0 (array!79499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233374 (= res!820960 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233375 () Bool)

(declare-fun e!699740 () Bool)

(assert (=> b!1233375 (= e!699740 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27139 (select (arr!38357 a!3806) from!3184) Nil!27140)))))

(declare-fun b!1233376 () Bool)

(declare-fun res!820961 () Bool)

(assert (=> b!1233376 (=> (not res!820961) (not e!699738))))

(declare-fun noDuplicate!1795 (List!27143) Bool)

(assert (=> b!1233376 (= res!820961 (noDuplicate!1795 acc!823))))

(declare-fun res!820964 () Bool)

(assert (=> start!102672 (=> (not res!820964) (not e!699738))))

(assert (=> start!102672 (= res!820964 (bvslt (size!38894 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102672 e!699738))

(declare-fun array_inv!29295 (array!79499) Bool)

(assert (=> start!102672 (array_inv!29295 a!3806)))

(assert (=> start!102672 true))

(declare-fun b!1233377 () Bool)

(declare-fun res!820957 () Bool)

(assert (=> b!1233377 (=> (not res!820957) (not e!699738))))

(declare-fun contains!7214 (List!27143 (_ BitVec 64)) Bool)

(assert (=> b!1233377 (= res!820957 (not (contains!7214 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233378 () Bool)

(assert (=> b!1233378 (= e!699738 (not true))))

(assert (=> b!1233378 e!699740))

(declare-fun res!820963 () Bool)

(assert (=> b!1233378 (=> (not res!820963) (not e!699740))))

(assert (=> b!1233378 (= res!820963 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27140))))

(declare-datatypes ((Unit!40769 0))(
  ( (Unit!40770) )
))
(declare-fun lt!559965 () Unit!40769)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79499 List!27143 List!27143 (_ BitVec 32)) Unit!40769)

(assert (=> b!1233378 (= lt!559965 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27140 from!3184))))

(assert (=> b!1233378 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27139 (select (arr!38357 a!3806) from!3184) acc!823))))

(declare-fun b!1233379 () Bool)

(declare-fun res!820958 () Bool)

(assert (=> b!1233379 (=> (not res!820958) (not e!699738))))

(assert (=> b!1233379 (= res!820958 (not (contains!7214 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102672 res!820964) b!1233371))

(assert (= (and b!1233371 res!820956) b!1233372))

(assert (= (and b!1233372 res!820962) b!1233376))

(assert (= (and b!1233376 res!820961) b!1233377))

(assert (= (and b!1233377 res!820957) b!1233379))

(assert (= (and b!1233379 res!820958) b!1233374))

(assert (= (and b!1233374 res!820960) b!1233373))

(assert (= (and b!1233373 res!820955) b!1233370))

(assert (= (and b!1233370 res!820959) b!1233378))

(assert (= (and b!1233378 res!820963) b!1233375))

(declare-fun m!1137741 () Bool)

(assert (=> start!102672 m!1137741))

(declare-fun m!1137743 () Bool)

(assert (=> b!1233371 m!1137743))

(declare-fun m!1137745 () Bool)

(assert (=> b!1233373 m!1137745))

(declare-fun m!1137747 () Bool)

(assert (=> b!1233375 m!1137747))

(declare-fun m!1137749 () Bool)

(assert (=> b!1233375 m!1137749))

(declare-fun m!1137751 () Bool)

(assert (=> b!1233374 m!1137751))

(declare-fun m!1137753 () Bool)

(assert (=> b!1233377 m!1137753))

(assert (=> b!1233370 m!1137747))

(assert (=> b!1233370 m!1137747))

(declare-fun m!1137755 () Bool)

(assert (=> b!1233370 m!1137755))

(declare-fun m!1137757 () Bool)

(assert (=> b!1233379 m!1137757))

(declare-fun m!1137759 () Bool)

(assert (=> b!1233376 m!1137759))

(declare-fun m!1137761 () Bool)

(assert (=> b!1233378 m!1137761))

(declare-fun m!1137763 () Bool)

(assert (=> b!1233378 m!1137763))

(assert (=> b!1233378 m!1137747))

(declare-fun m!1137765 () Bool)

(assert (=> b!1233378 m!1137765))

(check-sat (not b!1233378) (not b!1233373) (not b!1233371) (not b!1233379) (not start!102672) (not b!1233377) (not b!1233375) (not b!1233374) (not b!1233376) (not b!1233370))
(check-sat)
