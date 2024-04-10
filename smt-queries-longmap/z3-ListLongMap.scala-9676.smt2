; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114196 () Bool)

(assert start!114196)

(declare-fun b!1356636 () Bool)

(declare-fun res!901392 () Bool)

(declare-fun e!770131 () Bool)

(assert (=> b!1356636 (=> (not res!901392) (not e!770131))))

(declare-datatypes ((List!31678 0))(
  ( (Nil!31675) (Cons!31674 (h!32883 (_ BitVec 64)) (t!46336 List!31678)) )
))
(declare-fun acc!759 () List!31678)

(declare-fun contains!9387 (List!31678 (_ BitVec 64)) Bool)

(assert (=> b!1356636 (= res!901392 (not (contains!9387 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356637 () Bool)

(declare-fun res!901393 () Bool)

(assert (=> b!1356637 (=> (not res!901393) (not e!770131))))

(declare-fun noDuplicate!2244 (List!31678) Bool)

(assert (=> b!1356637 (= res!901393 (noDuplicate!2244 acc!759))))

(declare-fun b!1356638 () Bool)

(declare-fun res!901395 () Bool)

(assert (=> b!1356638 (=> (not res!901395) (not e!770131))))

(declare-datatypes ((array!92378 0))(
  ( (array!92379 (arr!44637 (Array (_ BitVec 32) (_ BitVec 64))) (size!45187 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92378)

(declare-fun arrayNoDuplicates!0 (array!92378 (_ BitVec 32) List!31678) Bool)

(assert (=> b!1356638 (= res!901395 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31675))))

(declare-fun b!1356639 () Bool)

(declare-fun res!901394 () Bool)

(assert (=> b!1356639 (=> (not res!901394) (not e!770131))))

(assert (=> b!1356639 (= res!901394 (not (contains!9387 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901396 () Bool)

(assert (=> start!114196 (=> (not res!901396) (not e!770131))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114196 (= res!901396 (and (bvslt (size!45187 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45187 a!3742))))))

(assert (=> start!114196 e!770131))

(declare-fun array_inv!33665 (array!92378) Bool)

(assert (=> start!114196 (array_inv!33665 a!3742)))

(assert (=> start!114196 true))

(declare-fun b!1356640 () Bool)

(assert (=> b!1356640 (= e!770131 false)))

(declare-fun lt!599068 () Bool)

(assert (=> b!1356640 (= lt!599068 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114196 res!901396) b!1356637))

(assert (= (and b!1356637 res!901393) b!1356636))

(assert (= (and b!1356636 res!901392) b!1356639))

(assert (= (and b!1356639 res!901394) b!1356638))

(assert (= (and b!1356638 res!901395) b!1356640))

(declare-fun m!1242595 () Bool)

(assert (=> b!1356636 m!1242595))

(declare-fun m!1242597 () Bool)

(assert (=> start!114196 m!1242597))

(declare-fun m!1242599 () Bool)

(assert (=> b!1356637 m!1242599))

(declare-fun m!1242601 () Bool)

(assert (=> b!1356638 m!1242601))

(declare-fun m!1242603 () Bool)

(assert (=> b!1356640 m!1242603))

(declare-fun m!1242605 () Bool)

(assert (=> b!1356639 m!1242605))

(check-sat (not b!1356640) (not b!1356638) (not start!114196) (not b!1356637) (not b!1356639) (not b!1356636))
(check-sat)
