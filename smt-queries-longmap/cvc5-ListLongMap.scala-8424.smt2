; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!102632 () Bool)

(assert start!102632)

(declare-fun res!821880 () Bool)

(declare-fun e!699822 () Bool)

(assert (=> start!102632 (=> (not res!821880) (not e!699822))))

(declare-datatypes ((array!79445 0))(
  ( (array!79446 (arr!38332 (Array (_ BitVec 32) (_ BitVec 64))) (size!38870 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79445)

(assert (=> start!102632 (= res!821880 (bvslt (size!38870 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102632 e!699822))

(declare-fun array_inv!29315 (array!79445) Bool)

(assert (=> start!102632 (array_inv!29315 a!3806)))

(assert (=> start!102632 true))

(declare-fun b!1233657 () Bool)

(assert (=> b!1233657 (= e!699822 (not true))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1233657 (not (arrayContainsKey!0 a!3806 (select (arr!38332 a!3806) from!3184) (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-datatypes ((Unit!40695 0))(
  ( (Unit!40696) )
))
(declare-fun lt!559558 () Unit!40695)

(declare-datatypes ((List!27206 0))(
  ( (Nil!27203) (Cons!27202 (h!28411 (_ BitVec 64)) (t!40660 List!27206)) )
))
(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!79445 (_ BitVec 32) (_ BitVec 64) List!27206) Unit!40695)

(assert (=> b!1233657 (= lt!559558 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (select (arr!38332 a!3806) from!3184) (Cons!27202 (select (arr!38332 a!3806) from!3184) Nil!27203)))))

(declare-fun e!699823 () Bool)

(assert (=> b!1233657 e!699823))

(declare-fun res!821877 () Bool)

(assert (=> b!1233657 (=> (not res!821877) (not e!699823))))

(declare-fun arrayNoDuplicates!0 (array!79445 (_ BitVec 32) List!27206) Bool)

(assert (=> b!1233657 (= res!821877 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27203))))

(declare-fun acc!823 () List!27206)

(declare-fun lt!559559 () Unit!40695)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79445 List!27206 List!27206 (_ BitVec 32)) Unit!40695)

(assert (=> b!1233657 (= lt!559559 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27203 from!3184))))

(assert (=> b!1233657 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27202 (select (arr!38332 a!3806) from!3184) acc!823))))

(declare-fun b!1233658 () Bool)

(declare-fun res!821879 () Bool)

(assert (=> b!1233658 (=> (not res!821879) (not e!699822))))

(declare-fun k!2913 () (_ BitVec 64))

(assert (=> b!1233658 (= res!821879 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1233659 () Bool)

(declare-fun res!821881 () Bool)

(assert (=> b!1233659 (=> (not res!821881) (not e!699822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1233659 (= res!821881 (validKeyInArray!0 k!2913))))

(declare-fun b!1233660 () Bool)

(declare-fun res!821878 () Bool)

(assert (=> b!1233660 (=> (not res!821878) (not e!699822))))

(assert (=> b!1233660 (= res!821878 (validKeyInArray!0 (select (arr!38332 a!3806) from!3184)))))

(declare-fun b!1233661 () Bool)

(declare-fun res!821874 () Bool)

(assert (=> b!1233661 (=> (not res!821874) (not e!699822))))

(declare-fun noDuplicate!1821 (List!27206) Bool)

(assert (=> b!1233661 (= res!821874 (noDuplicate!1821 acc!823))))

(declare-fun b!1233662 () Bool)

(declare-fun res!821882 () Bool)

(assert (=> b!1233662 (=> (not res!821882) (not e!699822))))

(assert (=> b!1233662 (= res!821882 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1233663 () Bool)

(declare-fun res!821875 () Bool)

(assert (=> b!1233663 (=> (not res!821875) (not e!699822))))

(declare-fun contains!7178 (List!27206 (_ BitVec 64)) Bool)

(assert (=> b!1233663 (= res!821875 (not (contains!7178 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233664 () Bool)

(declare-fun res!821873 () Bool)

(assert (=> b!1233664 (=> (not res!821873) (not e!699822))))

(assert (=> b!1233664 (= res!821873 (not (contains!7178 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1233665 () Bool)

(assert (=> b!1233665 (= e!699823 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27202 (select (arr!38332 a!3806) from!3184) Nil!27203)))))

(declare-fun b!1233666 () Bool)

(declare-fun res!821876 () Bool)

(assert (=> b!1233666 (=> (not res!821876) (not e!699822))))

(assert (=> b!1233666 (= res!821876 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38870 a!3806)) (bvslt from!3184 (size!38870 a!3806))))))

(assert (= (and start!102632 res!821880) b!1233659))

(assert (= (and b!1233659 res!821881) b!1233666))

(assert (= (and b!1233666 res!821876) b!1233661))

(assert (= (and b!1233661 res!821874) b!1233663))

(assert (= (and b!1233663 res!821875) b!1233664))

(assert (= (and b!1233664 res!821873) b!1233658))

(assert (= (and b!1233658 res!821879) b!1233662))

(assert (= (and b!1233662 res!821882) b!1233660))

(assert (= (and b!1233660 res!821878) b!1233657))

(assert (= (and b!1233657 res!821877) b!1233665))

(declare-fun m!1137285 () Bool)

(assert (=> start!102632 m!1137285))

(declare-fun m!1137287 () Bool)

(assert (=> b!1233657 m!1137287))

(declare-fun m!1137289 () Bool)

(assert (=> b!1233657 m!1137289))

(declare-fun m!1137291 () Bool)

(assert (=> b!1233657 m!1137291))

(declare-fun m!1137293 () Bool)

(assert (=> b!1233657 m!1137293))

(assert (=> b!1233657 m!1137291))

(declare-fun m!1137295 () Bool)

(assert (=> b!1233657 m!1137295))

(assert (=> b!1233657 m!1137291))

(declare-fun m!1137297 () Bool)

(assert (=> b!1233657 m!1137297))

(declare-fun m!1137299 () Bool)

(assert (=> b!1233664 m!1137299))

(assert (=> b!1233665 m!1137291))

(declare-fun m!1137301 () Bool)

(assert (=> b!1233665 m!1137301))

(declare-fun m!1137303 () Bool)

(assert (=> b!1233658 m!1137303))

(declare-fun m!1137305 () Bool)

(assert (=> b!1233663 m!1137305))

(assert (=> b!1233660 m!1137291))

(assert (=> b!1233660 m!1137291))

(declare-fun m!1137307 () Bool)

(assert (=> b!1233660 m!1137307))

(declare-fun m!1137309 () Bool)

(assert (=> b!1233659 m!1137309))

(declare-fun m!1137311 () Bool)

(assert (=> b!1233662 m!1137311))

(declare-fun m!1137313 () Bool)

(assert (=> b!1233661 m!1137313))

(push 1)

(assert (not b!1233657))

(assert (not b!1233658))

(assert (not b!1233662))

(assert (not b!1233665))

(assert (not b!1233664))

(assert (not b!1233659))

(assert (not b!1233660))

(assert (not b!1233661))

(assert (not start!102632))

(assert (not b!1233663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

