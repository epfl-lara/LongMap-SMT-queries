; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114188 () Bool)

(assert start!114188)

(declare-fun b!1356576 () Bool)

(declare-fun e!770107 () Bool)

(assert (=> b!1356576 (= e!770107 false)))

(declare-datatypes ((array!92370 0))(
  ( (array!92371 (arr!44633 (Array (_ BitVec 32) (_ BitVec 64))) (size!45183 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92370)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!599056 () Bool)

(declare-datatypes ((List!31674 0))(
  ( (Nil!31671) (Cons!31670 (h!32879 (_ BitVec 64)) (t!46332 List!31674)) )
))
(declare-fun acc!759 () List!31674)

(declare-fun arrayNoDuplicates!0 (array!92370 (_ BitVec 32) List!31674) Bool)

(assert (=> b!1356576 (= lt!599056 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356577 () Bool)

(declare-fun res!901334 () Bool)

(assert (=> b!1356577 (=> (not res!901334) (not e!770107))))

(assert (=> b!1356577 (= res!901334 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31671))))

(declare-fun b!1356578 () Bool)

(declare-fun res!901332 () Bool)

(assert (=> b!1356578 (=> (not res!901332) (not e!770107))))

(declare-fun contains!9383 (List!31674 (_ BitVec 64)) Bool)

(assert (=> b!1356578 (= res!901332 (not (contains!9383 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356579 () Bool)

(declare-fun res!901335 () Bool)

(assert (=> b!1356579 (=> (not res!901335) (not e!770107))))

(declare-fun noDuplicate!2240 (List!31674) Bool)

(assert (=> b!1356579 (= res!901335 (noDuplicate!2240 acc!759))))

(declare-fun res!901336 () Bool)

(assert (=> start!114188 (=> (not res!901336) (not e!770107))))

(assert (=> start!114188 (= res!901336 (and (bvslt (size!45183 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45183 a!3742))))))

(assert (=> start!114188 e!770107))

(declare-fun array_inv!33661 (array!92370) Bool)

(assert (=> start!114188 (array_inv!33661 a!3742)))

(assert (=> start!114188 true))

(declare-fun b!1356580 () Bool)

(declare-fun res!901333 () Bool)

(assert (=> b!1356580 (=> (not res!901333) (not e!770107))))

(assert (=> b!1356580 (= res!901333 (not (contains!9383 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114188 res!901336) b!1356579))

(assert (= (and b!1356579 res!901335) b!1356578))

(assert (= (and b!1356578 res!901332) b!1356580))

(assert (= (and b!1356580 res!901333) b!1356577))

(assert (= (and b!1356577 res!901334) b!1356576))

(declare-fun m!1242547 () Bool)

(assert (=> b!1356579 m!1242547))

(declare-fun m!1242549 () Bool)

(assert (=> b!1356577 m!1242549))

(declare-fun m!1242551 () Bool)

(assert (=> b!1356580 m!1242551))

(declare-fun m!1242553 () Bool)

(assert (=> b!1356576 m!1242553))

(declare-fun m!1242555 () Bool)

(assert (=> start!114188 m!1242555))

(declare-fun m!1242557 () Bool)

(assert (=> b!1356578 m!1242557))

(push 1)

(assert (not b!1356579))

(assert (not b!1356580))

(assert (not b!1356577))

(assert (not start!114188))

(assert (not b!1356578))

(assert (not b!1356576))

(check-sat)

(pop 1)

(push 1)

