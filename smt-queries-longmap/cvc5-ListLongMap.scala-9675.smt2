; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114192 () Bool)

(assert start!114192)

(declare-fun b!1356536 () Bool)

(declare-fun res!901333 () Bool)

(declare-fun e!770085 () Bool)

(assert (=> b!1356536 (=> (not res!901333) (not e!770085))))

(declare-datatypes ((List!31729 0))(
  ( (Nil!31726) (Cons!31725 (h!32934 (_ BitVec 64)) (t!46379 List!31729)) )
))
(declare-fun acc!759 () List!31729)

(declare-fun contains!9349 (List!31729 (_ BitVec 64)) Bool)

(assert (=> b!1356536 (= res!901333 (not (contains!9349 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!901337 () Bool)

(assert (=> start!114192 (=> (not res!901337) (not e!770085))))

(declare-datatypes ((array!92323 0))(
  ( (array!92324 (arr!44610 (Array (_ BitVec 32) (_ BitVec 64))) (size!45162 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92323)

(declare-fun from!3120 () (_ BitVec 32))

(assert (=> start!114192 (= res!901337 (and (bvslt (size!45162 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45162 a!3742))))))

(assert (=> start!114192 e!770085))

(declare-fun array_inv!33843 (array!92323) Bool)

(assert (=> start!114192 (array_inv!33843 a!3742)))

(assert (=> start!114192 true))

(declare-fun b!1356537 () Bool)

(assert (=> b!1356537 (= e!770085 false)))

(declare-fun lt!598876 () Bool)

(declare-fun arrayNoDuplicates!0 (array!92323 (_ BitVec 32) List!31729) Bool)

(assert (=> b!1356537 (= lt!598876 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun b!1356538 () Bool)

(declare-fun res!901336 () Bool)

(assert (=> b!1356538 (=> (not res!901336) (not e!770085))))

(declare-fun noDuplicate!2264 (List!31729) Bool)

(assert (=> b!1356538 (= res!901336 (noDuplicate!2264 acc!759))))

(declare-fun b!1356539 () Bool)

(declare-fun res!901335 () Bool)

(assert (=> b!1356539 (=> (not res!901335) (not e!770085))))

(assert (=> b!1356539 (= res!901335 (not (contains!9349 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356540 () Bool)

(declare-fun res!901334 () Bool)

(assert (=> b!1356540 (=> (not res!901334) (not e!770085))))

(assert (=> b!1356540 (= res!901334 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31726))))

(assert (= (and start!114192 res!901337) b!1356538))

(assert (= (and b!1356538 res!901336) b!1356536))

(assert (= (and b!1356536 res!901333) b!1356539))

(assert (= (and b!1356539 res!901335) b!1356540))

(assert (= (and b!1356540 res!901334) b!1356537))

(declare-fun m!1242055 () Bool)

(assert (=> b!1356536 m!1242055))

(declare-fun m!1242057 () Bool)

(assert (=> b!1356537 m!1242057))

(declare-fun m!1242059 () Bool)

(assert (=> start!114192 m!1242059))

(declare-fun m!1242061 () Bool)

(assert (=> b!1356540 m!1242061))

(declare-fun m!1242063 () Bool)

(assert (=> b!1356539 m!1242063))

(declare-fun m!1242065 () Bool)

(assert (=> b!1356538 m!1242065))

(push 1)

(assert (not b!1356540))

(assert (not b!1356537))

(assert (not b!1356538))

(assert (not b!1356536))

(assert (not b!1356539))

(assert (not start!114192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

