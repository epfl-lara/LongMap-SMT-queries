; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!114190 () Bool)

(assert start!114190)

(declare-fun b!1356591 () Bool)

(declare-fun res!901349 () Bool)

(declare-fun e!770112 () Bool)

(assert (=> b!1356591 (=> (not res!901349) (not e!770112))))

(declare-datatypes ((List!31675 0))(
  ( (Nil!31672) (Cons!31671 (h!32880 (_ BitVec 64)) (t!46333 List!31675)) )
))
(declare-fun acc!759 () List!31675)

(declare-fun contains!9384 (List!31675 (_ BitVec 64)) Bool)

(assert (=> b!1356591 (= res!901349 (not (contains!9384 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356592 () Bool)

(declare-fun res!901350 () Bool)

(assert (=> b!1356592 (=> (not res!901350) (not e!770112))))

(declare-datatypes ((array!92372 0))(
  ( (array!92373 (arr!44634 (Array (_ BitVec 32) (_ BitVec 64))) (size!45184 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92372)

(declare-fun arrayNoDuplicates!0 (array!92372 (_ BitVec 32) List!31675) Bool)

(assert (=> b!1356592 (= res!901350 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31672))))

(declare-fun res!901348 () Bool)

(assert (=> start!114190 (=> (not res!901348) (not e!770112))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114190 (= res!901348 (and (bvslt (size!45184 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45184 a!3742))))))

(assert (=> start!114190 e!770112))

(declare-fun array_inv!33662 (array!92372) Bool)

(assert (=> start!114190 (array_inv!33662 a!3742)))

(assert (=> start!114190 true))

(declare-fun b!1356593 () Bool)

(declare-fun res!901347 () Bool)

(assert (=> b!1356593 (=> (not res!901347) (not e!770112))))

(declare-fun noDuplicate!2241 (List!31675) Bool)

(assert (=> b!1356593 (= res!901347 (noDuplicate!2241 acc!759))))

(declare-fun b!1356594 () Bool)

(declare-fun res!901351 () Bool)

(assert (=> b!1356594 (=> (not res!901351) (not e!770112))))

(assert (=> b!1356594 (= res!901351 (not (contains!9384 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356595 () Bool)

(assert (=> b!1356595 (= e!770112 false)))

(declare-fun lt!599059 () Bool)

(assert (=> b!1356595 (= lt!599059 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(assert (= (and start!114190 res!901348) b!1356593))

(assert (= (and b!1356593 res!901347) b!1356594))

(assert (= (and b!1356594 res!901351) b!1356591))

(assert (= (and b!1356591 res!901349) b!1356592))

(assert (= (and b!1356592 res!901350) b!1356595))

(declare-fun m!1242559 () Bool)

(assert (=> start!114190 m!1242559))

(declare-fun m!1242561 () Bool)

(assert (=> b!1356595 m!1242561))

(declare-fun m!1242563 () Bool)

(assert (=> b!1356593 m!1242563))

(declare-fun m!1242565 () Bool)

(assert (=> b!1356591 m!1242565))

(declare-fun m!1242567 () Bool)

(assert (=> b!1356594 m!1242567))

(declare-fun m!1242569 () Bool)

(assert (=> b!1356592 m!1242569))

(check-sat (not b!1356594) (not b!1356593) (not b!1356591) (not start!114190) (not b!1356592) (not b!1356595))
(check-sat)
