; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113892 () Bool)

(assert start!113892)

(declare-fun b!1350517 () Bool)

(declare-fun res!896018 () Bool)

(declare-fun e!768294 () Bool)

(assert (=> b!1350517 (=> (not res!896018) (not e!768294))))

(declare-datatypes ((List!31579 0))(
  ( (Nil!31576) (Cons!31575 (h!32784 (_ BitVec 64)) (t!46229 List!31579)) )
))
(declare-fun acc!759 () List!31579)

(declare-fun contains!9199 (List!31579 (_ BitVec 64)) Bool)

(assert (=> b!1350517 (= res!896018 (not (contains!9199 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350518 () Bool)

(declare-fun res!896015 () Bool)

(assert (=> b!1350518 (=> (not res!896015) (not e!768294))))

(assert (=> b!1350518 (= res!896015 (not (contains!9199 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896017 () Bool)

(assert (=> start!113892 (=> (not res!896017) (not e!768294))))

(declare-datatypes ((array!92023 0))(
  ( (array!92024 (arr!44460 (Array (_ BitVec 32) (_ BitVec 64))) (size!45012 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92023)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113892 (= res!896017 (and (bvslt (size!45012 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45012 a!3742))))))

(assert (=> start!113892 e!768294))

(declare-fun array_inv!33693 (array!92023) Bool)

(assert (=> start!113892 (array_inv!33693 a!3742)))

(assert (=> start!113892 true))

(declare-fun b!1350519 () Bool)

(assert (=> b!1350519 (= e!768294 false)))

(declare-fun lt!596815 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92023 (_ BitVec 32) List!31579) Bool)

(assert (=> b!1350519 (= lt!596815 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31576))))

(declare-fun b!1350516 () Bool)

(declare-fun res!896016 () Bool)

(assert (=> b!1350516 (=> (not res!896016) (not e!768294))))

(declare-fun noDuplicate!2114 (List!31579) Bool)

(assert (=> b!1350516 (= res!896016 (noDuplicate!2114 acc!759))))

(assert (= (and start!113892 res!896017) b!1350516))

(assert (= (and b!1350516 res!896016) b!1350517))

(assert (= (and b!1350517 res!896018) b!1350518))

(assert (= (and b!1350518 res!896015) b!1350519))

(declare-fun m!1237281 () Bool)

(assert (=> b!1350517 m!1237281))

(declare-fun m!1237283 () Bool)

(assert (=> b!1350519 m!1237283))

(declare-fun m!1237285 () Bool)

(assert (=> b!1350516 m!1237285))

(declare-fun m!1237287 () Bool)

(assert (=> start!113892 m!1237287))

(declare-fun m!1237289 () Bool)

(assert (=> b!1350518 m!1237289))

(push 1)

(assert (not b!1350518))

(assert (not b!1350519))

(assert (not b!1350517))

(assert (not start!113892))

(assert (not b!1350516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

