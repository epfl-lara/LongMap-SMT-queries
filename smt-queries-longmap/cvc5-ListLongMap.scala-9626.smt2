; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114122 () Bool)

(assert start!114122)

(declare-fun b!1351923 () Bool)

(declare-fun res!896599 () Bool)

(declare-fun e!769188 () Bool)

(assert (=> b!1351923 (=> (not res!896599) (not e!769188))))

(declare-datatypes ((List!31569 0))(
  ( (Nil!31566) (Cons!31565 (h!32783 (_ BitVec 64)) (t!46219 List!31569)) )
))
(declare-fun acc!759 () List!31569)

(declare-fun contains!9281 (List!31569 (_ BitVec 64)) Bool)

(assert (=> b!1351923 (= res!896599 (not (contains!9281 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351922 () Bool)

(declare-fun res!896600 () Bool)

(assert (=> b!1351922 (=> (not res!896600) (not e!769188))))

(assert (=> b!1351922 (= res!896600 (not (contains!9281 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1351924 () Bool)

(assert (=> b!1351924 (= e!769188 false)))

(declare-fun lt!597486 () Bool)

(declare-datatypes ((array!92195 0))(
  ( (array!92196 (arr!44541 (Array (_ BitVec 32) (_ BitVec 64))) (size!45092 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92195)

(declare-fun arrayNoDuplicates!0 (array!92195 (_ BitVec 32) List!31569) Bool)

(assert (=> b!1351924 (= lt!597486 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31566))))

(declare-fun b!1351921 () Bool)

(declare-fun res!896601 () Bool)

(assert (=> b!1351921 (=> (not res!896601) (not e!769188))))

(declare-fun noDuplicate!2112 (List!31569) Bool)

(assert (=> b!1351921 (= res!896601 (noDuplicate!2112 acc!759))))

(declare-fun res!896598 () Bool)

(assert (=> start!114122 (=> (not res!896598) (not e!769188))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114122 (= res!896598 (and (bvslt (size!45092 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45092 a!3742))))))

(assert (=> start!114122 e!769188))

(declare-fun array_inv!33822 (array!92195) Bool)

(assert (=> start!114122 (array_inv!33822 a!3742)))

(assert (=> start!114122 true))

(assert (= (and start!114122 res!896598) b!1351921))

(assert (= (and b!1351921 res!896601) b!1351922))

(assert (= (and b!1351922 res!896600) b!1351923))

(assert (= (and b!1351923 res!896599) b!1351924))

(declare-fun m!1239423 () Bool)

(assert (=> b!1351921 m!1239423))

(declare-fun m!1239425 () Bool)

(assert (=> b!1351923 m!1239425))

(declare-fun m!1239427 () Bool)

(assert (=> b!1351924 m!1239427))

(declare-fun m!1239429 () Bool)

(assert (=> b!1351922 m!1239429))

(declare-fun m!1239431 () Bool)

(assert (=> start!114122 m!1239431))

(push 1)

(assert (not start!114122))

(assert (not b!1351921))

(assert (not b!1351922))

(assert (not b!1351924))

(assert (not b!1351923))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

