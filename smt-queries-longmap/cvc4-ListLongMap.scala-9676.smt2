; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114198 () Bool)

(assert start!114198)

(declare-fun b!1356651 () Bool)

(declare-fun res!901409 () Bool)

(declare-fun e!770136 () Bool)

(assert (=> b!1356651 (=> (not res!901409) (not e!770136))))

(declare-datatypes ((List!31679 0))(
  ( (Nil!31676) (Cons!31675 (h!32884 (_ BitVec 64)) (t!46337 List!31679)) )
))
(declare-fun acc!759 () List!31679)

(declare-fun contains!9388 (List!31679 (_ BitVec 64)) Bool)

(assert (=> b!1356651 (= res!901409 (not (contains!9388 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356652 () Bool)

(declare-fun res!901408 () Bool)

(assert (=> b!1356652 (=> (not res!901408) (not e!770136))))

(declare-datatypes ((array!92380 0))(
  ( (array!92381 (arr!44638 (Array (_ BitVec 32) (_ BitVec 64))) (size!45188 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92380)

(declare-fun arrayNoDuplicates!0 (array!92380 (_ BitVec 32) List!31679) Bool)

(assert (=> b!1356652 (= res!901408 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31676))))

(declare-fun b!1356653 () Bool)

(assert (=> b!1356653 (= e!770136 false)))

(declare-fun lt!599071 () Bool)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356653 (= lt!599071 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356654 () Bool)

(declare-fun res!901410 () Bool)

(assert (=> b!1356654 (=> (not res!901410) (not e!770136))))

(declare-fun noDuplicate!2245 (List!31679) Bool)

(assert (=> b!1356654 (= res!901410 (noDuplicate!2245 acc!759))))

(declare-fun b!1356655 () Bool)

(declare-fun res!901411 () Bool)

(assert (=> b!1356655 (=> (not res!901411) (not e!770136))))

(assert (=> b!1356655 (= res!901411 (not (contains!9388 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901407 () Bool)

(assert (=> start!114198 (=> (not res!901407) (not e!770136))))

(assert (=> start!114198 (= res!901407 (and (bvslt (size!45188 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45188 a!3742))))))

(assert (=> start!114198 e!770136))

(declare-fun array_inv!33666 (array!92380) Bool)

(assert (=> start!114198 (array_inv!33666 a!3742)))

(assert (=> start!114198 true))

(assert (= (and start!114198 res!901407) b!1356654))

(assert (= (and b!1356654 res!901410) b!1356651))

(assert (= (and b!1356651 res!901409) b!1356655))

(assert (= (and b!1356655 res!901411) b!1356652))

(assert (= (and b!1356652 res!901408) b!1356653))

(declare-fun m!1242607 () Bool)

(assert (=> b!1356652 m!1242607))

(declare-fun m!1242609 () Bool)

(assert (=> start!114198 m!1242609))

(declare-fun m!1242611 () Bool)

(assert (=> b!1356655 m!1242611))

(declare-fun m!1242613 () Bool)

(assert (=> b!1356654 m!1242613))

(declare-fun m!1242615 () Bool)

(assert (=> b!1356651 m!1242615))

(declare-fun m!1242617 () Bool)

(assert (=> b!1356653 m!1242617))

(push 1)

(assert (not b!1356654))

(assert (not b!1356652))

(assert (not b!1356655))

(assert (not b!1356651))

(assert (not b!1356653))

(assert (not start!114198))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

