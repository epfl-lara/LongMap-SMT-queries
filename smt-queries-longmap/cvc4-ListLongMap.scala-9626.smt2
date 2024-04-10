; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113898 () Bool)

(assert start!113898)

(declare-fun b!1350622 () Bool)

(declare-fun res!896081 () Bool)

(declare-fun e!768346 () Bool)

(assert (=> b!1350622 (=> (not res!896081) (not e!768346))))

(declare-datatypes ((List!31529 0))(
  ( (Nil!31526) (Cons!31525 (h!32734 (_ BitVec 64)) (t!46187 List!31529)) )
))
(declare-fun acc!759 () List!31529)

(declare-fun noDuplicate!2095 (List!31529) Bool)

(assert (=> b!1350622 (= res!896081 (noDuplicate!2095 acc!759))))

(declare-fun b!1350624 () Bool)

(declare-fun res!896082 () Bool)

(assert (=> b!1350624 (=> (not res!896082) (not e!768346))))

(declare-fun contains!9238 (List!31529 (_ BitVec 64)) Bool)

(assert (=> b!1350624 (= res!896082 (not (contains!9238 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350625 () Bool)

(assert (=> b!1350625 (= e!768346 false)))

(declare-fun lt!597010 () Bool)

(declare-datatypes ((array!92080 0))(
  ( (array!92081 (arr!44488 (Array (_ BitVec 32) (_ BitVec 64))) (size!45038 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92080)

(declare-fun arrayNoDuplicates!0 (array!92080 (_ BitVec 32) List!31529) Bool)

(assert (=> b!1350625 (= lt!597010 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31526))))

(declare-fun b!1350623 () Bool)

(declare-fun res!896083 () Bool)

(assert (=> b!1350623 (=> (not res!896083) (not e!768346))))

(assert (=> b!1350623 (= res!896083 (not (contains!9238 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!896080 () Bool)

(assert (=> start!113898 (=> (not res!896080) (not e!768346))))

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113898 (= res!896080 (and (bvslt (size!45038 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45038 a!3742))))))

(assert (=> start!113898 e!768346))

(declare-fun array_inv!33516 (array!92080) Bool)

(assert (=> start!113898 (array_inv!33516 a!3742)))

(assert (=> start!113898 true))

(assert (= (and start!113898 res!896080) b!1350622))

(assert (= (and b!1350622 res!896081) b!1350623))

(assert (= (and b!1350623 res!896083) b!1350624))

(assert (= (and b!1350624 res!896082) b!1350625))

(declare-fun m!1237827 () Bool)

(assert (=> b!1350625 m!1237827))

(declare-fun m!1237829 () Bool)

(assert (=> b!1350622 m!1237829))

(declare-fun m!1237831 () Bool)

(assert (=> b!1350623 m!1237831))

(declare-fun m!1237833 () Bool)

(assert (=> b!1350624 m!1237833))

(declare-fun m!1237835 () Bool)

(assert (=> start!113898 m!1237835))

(push 1)

(assert (not b!1350625))

(assert (not b!1350623))

(assert (not start!113898))

(assert (not b!1350622))

(assert (not b!1350624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

