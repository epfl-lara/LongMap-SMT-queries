; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113888 () Bool)

(assert start!113888)

(declare-fun b!1350562 () Bool)

(declare-fun res!896020 () Bool)

(declare-fun e!768316 () Bool)

(assert (=> b!1350562 (=> (not res!896020) (not e!768316))))

(declare-datatypes ((List!31524 0))(
  ( (Nil!31521) (Cons!31520 (h!32729 (_ BitVec 64)) (t!46182 List!31524)) )
))
(declare-fun acc!759 () List!31524)

(declare-fun noDuplicate!2090 (List!31524) Bool)

(assert (=> b!1350562 (= res!896020 (noDuplicate!2090 acc!759))))

(declare-fun b!1350565 () Bool)

(assert (=> b!1350565 (= e!768316 false)))

(declare-fun lt!596995 () Bool)

(declare-datatypes ((array!92070 0))(
  ( (array!92071 (arr!44483 (Array (_ BitVec 32) (_ BitVec 64))) (size!45033 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92070)

(declare-fun arrayNoDuplicates!0 (array!92070 (_ BitVec 32) List!31524) Bool)

(assert (=> b!1350565 (= lt!596995 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31521))))

(declare-fun b!1350563 () Bool)

(declare-fun res!896021 () Bool)

(assert (=> b!1350563 (=> (not res!896021) (not e!768316))))

(declare-fun contains!9233 (List!31524 (_ BitVec 64)) Bool)

(assert (=> b!1350563 (= res!896021 (not (contains!9233 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896022 () Bool)

(assert (=> start!113888 (=> (not res!896022) (not e!768316))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113888 (= res!896022 (and (bvslt (size!45033 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45033 a!3742))))))

(assert (=> start!113888 e!768316))

(declare-fun array_inv!33511 (array!92070) Bool)

(assert (=> start!113888 (array_inv!33511 a!3742)))

(assert (=> start!113888 true))

(declare-fun b!1350564 () Bool)

(declare-fun res!896023 () Bool)

(assert (=> b!1350564 (=> (not res!896023) (not e!768316))))

(assert (=> b!1350564 (= res!896023 (not (contains!9233 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113888 res!896022) b!1350562))

(assert (= (and b!1350562 res!896020) b!1350563))

(assert (= (and b!1350563 res!896021) b!1350564))

(assert (= (and b!1350564 res!896023) b!1350565))

(declare-fun m!1237777 () Bool)

(assert (=> start!113888 m!1237777))

(declare-fun m!1237779 () Bool)

(assert (=> b!1350563 m!1237779))

(declare-fun m!1237781 () Bool)

(assert (=> b!1350562 m!1237781))

(declare-fun m!1237783 () Bool)

(assert (=> b!1350564 m!1237783))

(declare-fun m!1237785 () Bool)

(assert (=> b!1350565 m!1237785))

(push 1)

(assert (not start!113888))

(assert (not b!1350563))

(assert (not b!1350564))

(assert (not b!1350565))

(assert (not b!1350562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

