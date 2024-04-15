; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!114196 () Bool)

(assert start!114196)

(declare-fun b!1356566 () Bool)

(declare-fun res!901365 () Bool)

(declare-fun e!770097 () Bool)

(assert (=> b!1356566 (=> (not res!901365) (not e!770097))))

(declare-datatypes ((List!31731 0))(
  ( (Nil!31728) (Cons!31727 (h!32936 (_ BitVec 64)) (t!46381 List!31731)) )
))
(declare-fun acc!759 () List!31731)

(declare-fun noDuplicate!2266 (List!31731) Bool)

(assert (=> b!1356566 (= res!901365 (noDuplicate!2266 acc!759))))

(declare-fun b!1356567 () Bool)

(assert (=> b!1356567 (= e!770097 false)))

(declare-fun lt!598882 () Bool)

(declare-datatypes ((array!92327 0))(
  ( (array!92328 (arr!44612 (Array (_ BitVec 32) (_ BitVec 64))) (size!45164 (_ BitVec 32))) )
))
(declare-fun a!3742 () array!92327)

(declare-fun from!3120 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!92327 (_ BitVec 32) List!31731) Bool)

(assert (=> b!1356567 (= lt!598882 (arrayNoDuplicates!0 a!3742 from!3120 acc!759))))

(declare-fun res!901366 () Bool)

(assert (=> start!114196 (=> (not res!901366) (not e!770097))))

(assert (=> start!114196 (= res!901366 (and (bvslt (size!45164 a!3742) #b01111111111111111111111111111111) (bvsge from!3120 #b00000000000000000000000000000000) (bvslt from!3120 (size!45164 a!3742))))))

(assert (=> start!114196 e!770097))

(declare-fun array_inv!33845 (array!92327) Bool)

(assert (=> start!114196 (array_inv!33845 a!3742)))

(assert (=> start!114196 true))

(declare-fun b!1356568 () Bool)

(declare-fun res!901367 () Bool)

(assert (=> b!1356568 (=> (not res!901367) (not e!770097))))

(assert (=> b!1356568 (= res!901367 (arrayNoDuplicates!0 a!3742 #b00000000000000000000000000000000 Nil!31728))))

(declare-fun b!1356569 () Bool)

(declare-fun res!901363 () Bool)

(assert (=> b!1356569 (=> (not res!901363) (not e!770097))))

(declare-fun contains!9351 (List!31731 (_ BitVec 64)) Bool)

(assert (=> b!1356569 (= res!901363 (not (contains!9351 acc!759 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1356570 () Bool)

(declare-fun res!901364 () Bool)

(assert (=> b!1356570 (=> (not res!901364) (not e!770097))))

(assert (=> b!1356570 (= res!901364 (not (contains!9351 acc!759 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!114196 res!901366) b!1356566))

(assert (= (and b!1356566 res!901365) b!1356570))

(assert (= (and b!1356570 res!901364) b!1356569))

(assert (= (and b!1356569 res!901363) b!1356568))

(assert (= (and b!1356568 res!901367) b!1356567))

(declare-fun m!1242079 () Bool)

(assert (=> start!114196 m!1242079))

(declare-fun m!1242081 () Bool)

(assert (=> b!1356567 m!1242081))

(declare-fun m!1242083 () Bool)

(assert (=> b!1356569 m!1242083))

(declare-fun m!1242085 () Bool)

(assert (=> b!1356568 m!1242085))

(declare-fun m!1242087 () Bool)

(assert (=> b!1356566 m!1242087))

(declare-fun m!1242089 () Bool)

(assert (=> b!1356570 m!1242089))

(push 1)

(assert (not b!1356567))

(assert (not b!1356570))

(assert (not b!1356569))

(assert (not b!1356566))

(assert (not start!114196))

(assert (not b!1356568))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

