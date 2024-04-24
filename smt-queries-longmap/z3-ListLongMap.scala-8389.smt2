; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102246 () Bool)

(assert start!102246)

(declare-fun b!1229621 () Bool)

(declare-fun res!817456 () Bool)

(declare-fun e!698021 () Bool)

(assert (=> b!1229621 (=> (not res!817456) (not e!698021))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1229621 (= res!817456 (validKeyInArray!0 k0!2913))))

(declare-fun b!1229622 () Bool)

(declare-fun res!817452 () Bool)

(assert (=> b!1229622 (=> (not res!817452) (not e!698021))))

(declare-fun from!3184 () (_ BitVec 32))

(declare-datatypes ((array!79319 0))(
  ( (array!79320 (arr!38276 (Array (_ BitVec 32) (_ BitVec 64))) (size!38813 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79319)

(assert (=> b!1229622 (= res!817452 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38813 a!3806)) (bvslt from!3184 (size!38813 a!3806))))))

(declare-fun b!1229623 () Bool)

(declare-fun res!817458 () Bool)

(assert (=> b!1229623 (=> (not res!817458) (not e!698021))))

(declare-datatypes ((List!27062 0))(
  ( (Nil!27059) (Cons!27058 (h!28276 (_ BitVec 64)) (t!40517 List!27062)) )
))
(declare-fun acc!823 () List!27062)

(declare-fun noDuplicate!1714 (List!27062) Bool)

(assert (=> b!1229623 (= res!817458 (noDuplicate!1714 acc!823))))

(declare-fun b!1229624 () Bool)

(declare-fun res!817460 () Bool)

(assert (=> b!1229624 (=> (not res!817460) (not e!698021))))

(declare-fun contains!7133 (List!27062 (_ BitVec 64)) Bool)

(assert (=> b!1229624 (= res!817460 (not (contains!7133 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1229625 () Bool)

(declare-fun res!817459 () Bool)

(assert (=> b!1229625 (=> (not res!817459) (not e!698021))))

(declare-fun arrayNoDuplicates!0 (array!79319 (_ BitVec 32) List!27062) Bool)

(assert (=> b!1229625 (= res!817459 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1229626 () Bool)

(declare-fun res!817453 () Bool)

(assert (=> b!1229626 (=> (not res!817453) (not e!698021))))

(assert (=> b!1229626 (= res!817453 (validKeyInArray!0 (select (arr!38276 a!3806) from!3184)))))

(declare-fun b!1229627 () Bool)

(declare-fun res!817457 () Bool)

(assert (=> b!1229627 (=> (not res!817457) (not e!698021))))

(declare-fun arrayContainsKey!0 (array!79319 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1229627 (= res!817457 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun res!817455 () Bool)

(assert (=> start!102246 (=> (not res!817455) (not e!698021))))

(assert (=> start!102246 (= res!817455 (bvslt (size!38813 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!102246 e!698021))

(declare-fun array_inv!29214 (array!79319) Bool)

(assert (=> start!102246 (array_inv!29214 a!3806)))

(assert (=> start!102246 true))

(declare-fun b!1229628 () Bool)

(assert (=> b!1229628 (= e!698021 (not true))))

(assert (=> b!1229628 (arrayNoDuplicates!0 a!3806 from!3184 Nil!27059)))

(declare-datatypes ((Unit!40667 0))(
  ( (Unit!40668) )
))
(declare-fun lt!559467 () Unit!40667)

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!79319 List!27062 List!27062 (_ BitVec 32)) Unit!40667)

(assert (=> b!1229628 (= lt!559467 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3806 acc!823 Nil!27059 from!3184))))

(assert (=> b!1229628 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27058 (select (arr!38276 a!3806) from!3184) acc!823))))

(declare-fun b!1229629 () Bool)

(declare-fun res!817454 () Bool)

(assert (=> b!1229629 (=> (not res!817454) (not e!698021))))

(assert (=> b!1229629 (= res!817454 (not (contains!7133 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!102246 res!817455) b!1229621))

(assert (= (and b!1229621 res!817456) b!1229622))

(assert (= (and b!1229622 res!817452) b!1229623))

(assert (= (and b!1229623 res!817458) b!1229624))

(assert (= (and b!1229624 res!817460) b!1229629))

(assert (= (and b!1229629 res!817454) b!1229627))

(assert (= (and b!1229627 res!817457) b!1229625))

(assert (= (and b!1229625 res!817459) b!1229626))

(assert (= (and b!1229626 res!817453) b!1229628))

(declare-fun m!1134477 () Bool)

(assert (=> b!1229625 m!1134477))

(declare-fun m!1134479 () Bool)

(assert (=> b!1229628 m!1134479))

(declare-fun m!1134481 () Bool)

(assert (=> b!1229628 m!1134481))

(declare-fun m!1134483 () Bool)

(assert (=> b!1229628 m!1134483))

(declare-fun m!1134485 () Bool)

(assert (=> b!1229628 m!1134485))

(declare-fun m!1134487 () Bool)

(assert (=> b!1229621 m!1134487))

(declare-fun m!1134489 () Bool)

(assert (=> start!102246 m!1134489))

(declare-fun m!1134491 () Bool)

(assert (=> b!1229624 m!1134491))

(declare-fun m!1134493 () Bool)

(assert (=> b!1229623 m!1134493))

(declare-fun m!1134495 () Bool)

(assert (=> b!1229627 m!1134495))

(assert (=> b!1229626 m!1134483))

(assert (=> b!1229626 m!1134483))

(declare-fun m!1134497 () Bool)

(assert (=> b!1229626 m!1134497))

(declare-fun m!1134499 () Bool)

(assert (=> b!1229629 m!1134499))

(check-sat (not b!1229627) (not b!1229628) (not b!1229621) (not start!102246) (not b!1229629) (not b!1229624) (not b!1229626) (not b!1229623) (not b!1229625))
(check-sat)
