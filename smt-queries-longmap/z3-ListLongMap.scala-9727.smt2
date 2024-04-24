; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!115372 () Bool)

(assert start!115372)

(declare-fun b!1365474 () Bool)

(declare-fun res!908379 () Bool)

(declare-fun e!774447 () Bool)

(assert (=> b!1365474 (=> (not res!908379) (not e!774447))))

(declare-datatypes ((array!92833 0))(
  ( (array!92834 (arr!44842 (Array (_ BitVec 32) (_ BitVec 64))) (size!45393 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92833)

(declare-datatypes ((List!31870 0))(
  ( (Nil!31867) (Cons!31866 (h!33084 (_ BitVec 64)) (t!46556 List!31870)) )
))
(declare-fun arrayNoDuplicates!0 (array!92833 (_ BitVec 32) List!31870) Bool)

(assert (=> b!1365474 (= res!908379 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31867))))

(declare-fun b!1365475 () Bool)

(assert (=> b!1365475 (= e!774447 false)))

(declare-fun acc!759 () List!31870)

(declare-fun lt!601494 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1365475 (= lt!601494 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1365476 () Bool)

(declare-fun res!908375 () Bool)

(assert (=> b!1365476 (=> (not res!908375) (not e!774447))))

(declare-fun contains!9582 (List!31870 (_ BitVec 64)) Bool)

(assert (=> b!1365476 (= res!908375 (not (contains!9582 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365477 () Bool)

(declare-fun res!908376 () Bool)

(assert (=> b!1365477 (=> (not res!908376) (not e!774447))))

(assert (=> b!1365477 (= res!908376 (not (contains!9582 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1365478 () Bool)

(declare-fun res!908377 () Bool)

(assert (=> b!1365478 (=> (not res!908377) (not e!774447))))

(declare-fun noDuplicate!2413 (List!31870) Bool)

(assert (=> b!1365478 (= res!908377 (noDuplicate!2413 acc!759))))

(declare-fun res!908378 () Bool)

(assert (=> start!115372 (=> (not res!908378) (not e!774447))))

(assert (=> start!115372 (= res!908378 (and (bvslt (size!45393 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45393 a!3742))))))

(assert (=> start!115372 e!774447))

(declare-fun array_inv!34123 (array!92833) Bool)

(assert (=> start!115372 (array_inv!34123 a!3742)))

(assert (=> start!115372 true))

(assert (= (and start!115372 res!908378) b!1365478))

(assert (= (and b!1365478 res!908377) b!1365476))

(assert (= (and b!1365476 res!908375) b!1365477))

(assert (= (and b!1365477 res!908376) b!1365474))

(assert (= (and b!1365474 res!908379) b!1365475))

(declare-fun m!1250485 () Bool)

(assert (=> start!115372 m!1250485))

(declare-fun m!1250487 () Bool)

(assert (=> b!1365476 m!1250487))

(declare-fun m!1250489 () Bool)

(assert (=> b!1365475 m!1250489))

(declare-fun m!1250491 () Bool)

(assert (=> b!1365474 m!1250491))

(declare-fun m!1250493 () Bool)

(assert (=> b!1365478 m!1250493))

(declare-fun m!1250495 () Bool)

(assert (=> b!1365477 m!1250495))

(check-sat (not b!1365477) (not b!1365476) (not start!115372) (not b!1365478) (not b!1365475) (not b!1365474))
(check-sat)
