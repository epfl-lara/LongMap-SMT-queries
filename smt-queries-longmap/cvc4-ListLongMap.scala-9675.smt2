; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114192 () Bool)

(assert start!114192)

(declare-fun b!1356606 () Bool)

(declare-fun res!901365 () Bool)

(declare-fun e!770118 () Bool)

(assert (=> b!1356606 (=> (not res!901365) (not e!770118))))

(declare-datatypes ((array!92374 0))(
  ( (array!92375 (arr!44635 (Array (_ BitVec 32) (_ BitVec 64))) (size!45185 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92374)

(declare-datatypes ((List!31676 0))(
  ( (Nil!31673) (Cons!31672 (h!32881 (_ BitVec 64)) (t!46334 List!31676)) )
))
(declare-fun arrayNoDuplicates!0 (array!92374 (_ BitVec 32) List!31676) Bool)

(assert (=> b!1356606 (= res!901365 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31673))))

(declare-fun b!1356607 () Bool)

(assert (=> b!1356607 (= e!770118 false)))

(declare-fun lt!599062 () Bool)

(declare-fun acc!759 () List!31676)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> b!1356607 (= lt!599062 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356608 () Bool)

(declare-fun res!901366 () Bool)

(assert (=> b!1356608 (=> (not res!901366) (not e!770118))))

(declare-fun noDuplicate!2242 (List!31676) Bool)

(assert (=> b!1356608 (= res!901366 (noDuplicate!2242 acc!759))))

(declare-fun b!1356609 () Bool)

(declare-fun res!901363 () Bool)

(assert (=> b!1356609 (=> (not res!901363) (not e!770118))))

(declare-fun contains!9385 (List!31676 (_ BitVec 64)) Bool)

(assert (=> b!1356609 (= res!901363 (not (contains!9385 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901364 () Bool)

(assert (=> start!114192 (=> (not res!901364) (not e!770118))))

(assert (=> start!114192 (= res!901364 (and (bvslt (size!45185 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45185 a!3742))))))

(assert (=> start!114192 e!770118))

(declare-fun array_inv!33663 (array!92374) Bool)

(assert (=> start!114192 (array_inv!33663 a!3742)))

(assert (=> start!114192 true))

(declare-fun b!1356610 () Bool)

(declare-fun res!901362 () Bool)

(assert (=> b!1356610 (=> (not res!901362) (not e!770118))))

(assert (=> b!1356610 (= res!901362 (not (contains!9385 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114192 res!901364) b!1356608))

(assert (= (and b!1356608 res!901366) b!1356610))

(assert (= (and b!1356610 res!901362) b!1356609))

(assert (= (and b!1356609 res!901363) b!1356606))

(assert (= (and b!1356606 res!901365) b!1356607))

(declare-fun m!1242571 () Bool)

(assert (=> b!1356609 m!1242571))

(declare-fun m!1242573 () Bool)

(assert (=> start!114192 m!1242573))

(declare-fun m!1242575 () Bool)

(assert (=> b!1356608 m!1242575))

(declare-fun m!1242577 () Bool)

(assert (=> b!1356610 m!1242577))

(declare-fun m!1242579 () Bool)

(assert (=> b!1356606 m!1242579))

(declare-fun m!1242581 () Bool)

(assert (=> b!1356607 m!1242581))

(push 1)

(assert (not b!1356610))

(assert (not b!1356607))

(assert (not b!1356606))

(assert (not b!1356608))

(assert (not start!114192))

(assert (not b!1356609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

