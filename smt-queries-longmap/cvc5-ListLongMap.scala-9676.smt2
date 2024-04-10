; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114194 () Bool)

(assert start!114194)

(declare-fun b!1356621 () Bool)

(declare-fun e!770124 () Bool)

(assert (=> b!1356621 (= e!770124 false)))

(declare-datatypes ((array!92376 0))(
  ( (array!92377 (arr!44636 (Array (_ BitVec 32) (_ BitVec 64))) (size!45186 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92376)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun lt!599065 () Bool)

(declare-datatypes ((List!31677 0))(
  ( (Nil!31674) (Cons!31673 (h!32882 (_ BitVec 64)) (t!46335 List!31677)) )
))
(declare-fun acc!759 () List!31677)

(declare-fun arrayNoDuplicates!0 (array!92376 (_ BitVec 32) List!31677) Bool)

(assert (=> b!1356621 (= lt!599065 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356622 () Bool)

(declare-fun res!901377 () Bool)

(assert (=> b!1356622 (=> (not res!901377) (not e!770124))))

(declare-fun noDuplicate!2243 (List!31677) Bool)

(assert (=> b!1356622 (= res!901377 (noDuplicate!2243 acc!759))))

(declare-fun b!1356623 () Bool)

(declare-fun res!901381 () Bool)

(assert (=> b!1356623 (=> (not res!901381) (not e!770124))))

(declare-fun contains!9386 (List!31677 (_ BitVec 64)) Bool)

(assert (=> b!1356623 (= res!901381 (not (contains!9386 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356624 () Bool)

(declare-fun res!901378 () Bool)

(assert (=> b!1356624 (=> (not res!901378) (not e!770124))))

(assert (=> b!1356624 (= res!901378 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31674))))

(declare-fun b!1356625 () Bool)

(declare-fun res!901380 () Bool)

(assert (=> b!1356625 (=> (not res!901380) (not e!770124))))

(assert (=> b!1356625 (= res!901380 (not (contains!9386 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901379 () Bool)

(assert (=> start!114194 (=> (not res!901379) (not e!770124))))

(assert (=> start!114194 (= res!901379 (and (bvslt (size!45186 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45186 a!3742))))))

(assert (=> start!114194 e!770124))

(declare-fun array_inv!33664 (array!92376) Bool)

(assert (=> start!114194 (array_inv!33664 a!3742)))

(assert (=> start!114194 true))

(assert (= (and start!114194 res!901379) b!1356622))

(assert (= (and b!1356622 res!901377) b!1356625))

(assert (= (and b!1356625 res!901380) b!1356623))

(assert (= (and b!1356623 res!901381) b!1356624))

(assert (= (and b!1356624 res!901378) b!1356621))

(declare-fun m!1242583 () Bool)

(assert (=> b!1356621 m!1242583))

(declare-fun m!1242585 () Bool)

(assert (=> b!1356625 m!1242585))

(declare-fun m!1242587 () Bool)

(assert (=> b!1356624 m!1242587))

(declare-fun m!1242589 () Bool)

(assert (=> b!1356623 m!1242589))

(declare-fun m!1242591 () Bool)

(assert (=> start!114194 m!1242591))

(declare-fun m!1242593 () Bool)

(assert (=> b!1356622 m!1242593))

(push 1)

(assert (not b!1356621))

(assert (not b!1356623))

(assert (not b!1356622))

(assert (not b!1356624))

(assert (not start!114194))

(assert (not b!1356625))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

