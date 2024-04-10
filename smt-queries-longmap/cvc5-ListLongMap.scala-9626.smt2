; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113894 () Bool)

(assert start!113894)

(declare-fun res!896056 () Bool)

(declare-fun e!768333 () Bool)

(assert (=> start!113894 (=> (not res!896056) (not e!768333))))

(declare-datatypes ((array!92076 0))(
  ( (array!92077 (arr!44486 (Array (_ BitVec 32) (_ BitVec 64))) (size!45036 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92076)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!113894 (= res!896056 (and (bvslt (size!45036 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45036 a!3742))))))

(assert (=> start!113894 e!768333))

(declare-fun array_inv!33514 (array!92076) Bool)

(assert (=> start!113894 (array_inv!33514 a!3742)))

(assert (=> start!113894 true))

(declare-fun b!1350601 () Bool)

(assert (=> b!1350601 (= e!768333 false)))

(declare-fun lt!597004 () Bool)

(declare-datatypes ((List!31527 0))(
  ( (Nil!31524) (Cons!31523 (h!32732 (_ BitVec 64)) (t!46185 List!31527)) )
))
(declare-fun arrayNoDuplicates!0 (array!92076 (_ BitVec 32) List!31527) Bool)

(assert (=> b!1350601 (= lt!597004 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31524))))

(declare-fun b!1350598 () Bool)

(declare-fun res!896059 () Bool)

(assert (=> b!1350598 (=> (not res!896059) (not e!768333))))

(declare-fun acc!759 () List!31527)

(declare-fun noDuplicate!2093 (List!31527) Bool)

(assert (=> b!1350598 (= res!896059 (noDuplicate!2093 acc!759))))

(declare-fun b!1350599 () Bool)

(declare-fun res!896057 () Bool)

(assert (=> b!1350599 (=> (not res!896057) (not e!768333))))

(declare-fun contains!9236 (List!31527 (_ BitVec 64)) Bool)

(assert (=> b!1350599 (= res!896057 (not (contains!9236 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1350600 () Bool)

(declare-fun res!896058 () Bool)

(assert (=> b!1350600 (=> (not res!896058) (not e!768333))))

(assert (=> b!1350600 (= res!896058 (not (contains!9236 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!113894 res!896056) b!1350598))

(assert (= (and b!1350598 res!896059) b!1350599))

(assert (= (and b!1350599 res!896057) b!1350600))

(assert (= (and b!1350600 res!896058) b!1350601))

(declare-fun m!1237807 () Bool)

(assert (=> b!1350599 m!1237807))

(declare-fun m!1237809 () Bool)

(assert (=> b!1350601 m!1237809))

(declare-fun m!1237811 () Bool)

(assert (=> b!1350598 m!1237811))

(declare-fun m!1237813 () Bool)

(assert (=> start!113894 m!1237813))

(declare-fun m!1237815 () Bool)

(assert (=> b!1350600 m!1237815))

(push 1)

(assert (not start!113894))

(assert (not b!1350600))

(assert (not b!1350598))

(assert (not b!1350599))

(assert (not b!1350601))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

